//
// Created by os on 7/20/26.
//

#include "../h/KThread.h"
#include "../h/ThreadContext.h"
#include "../h/MemAllocator.h"
#include "../h/Scheduler.h"
#include "../h/syscall_c.h"

extern "C" void yield(KThread* oldThread,KThread* newThread);
extern "C" void threadWrapper(KThread::Body body,void* arg);

alignas(16) KThread KThread::threadPool[KThread::MAX_THREADS];
uint64 KThread::usedBitmap = 0;
KThread* KThread::running = nullptr;

KThread::KThread():sp(nullptr),body(nullptr),arg(nullptr),next(nullptr),status(FINISHED),waitNext(nullptr),waitUnits(0),waitResult(0),kernelStack(nullptr),userStack(nullptr){}

KThread* KThread::cleanupHead = nullptr;
KThread* KThread::cleanupTail=nullptr;

void KThread::deferCleanup(KThread *thread)
{
    if(thread == nullptr) return;
    thread->next = nullptr;
    if(cleanupTail==nullptr)
    {
        cleanupHead=thread;
        cleanupTail=thread;
        return;
    }
    cleanupTail->next = thread;
    cleanupTail=thread;
}

void KThread::cleanupFinishedthreads()
{
    while(cleanupHead!= nullptr)
    {
        KThread* victim = cleanupHead;
        cleanupHead = cleanupHead->next;
        if(cleanupHead== nullptr) cleanupTail= nullptr;
        void* kernelStack = victim->kernelStack;
        void* userStack = victim->userStack;
        victim->kernelStack = nullptr;
        victim->userStack = nullptr;
        victim->next = nullptr;
        KThread::release(victim);
        if(kernelStack!=nullptr) MemAllocator::mem_free(kernelStack);
        if(userStack!= nullptr) MemAllocator::mem_free(userStack);
    }
}

static uint64 findFirstSetBit(uint64 value)
{
    uint64 index = 0;
    while ((value&1)==0)
    {
        value>>=1;
        index++;
    }
    return index;
}

void KThread::reset()
{
    sp=nullptr;
    body =nullptr;
    arg = nullptr;
    next=nullptr;

    waitNext = nullptr;
    waitUnits = 0;
    waitResult = 0;

    status = FINISHED;
    kernelStack = nullptr;
    userStack = nullptr;
}

KThread *KThread::allocate(Body body, void *arg)
{
    //cek dal je ceo zauzet
    if (usedBitmap == ~(uint64)0)
    {
        return nullptr;
    }

    //trazi freeslot
    uint64 freeSlots = ~usedBitmap;

    //ovde ide builtin ako provalim kako da ga namestim
    uint64 index = findFirstSetBit(freeSlots);

    //updejtuje zauzetost bitmape
    usedBitmap |= ((uint64)1 << index);

    //zauzme u threadpoolu
    KThread* thread = &threadPool[index];

    thread->sp = nullptr;
    thread->body = body;
    thread->arg = arg;
    thread->next = nullptr;
    thread->status = READY;
    thread->kernelStack=nullptr;
    thread->userStack=nullptr;
    thread->waitNext = nullptr;
    thread->waitUnits = 0;
    thread->waitResult = 0;

    return thread;
}

int KThread::release(KThread* thread)
{
    //ako nema sta da releasuje
    if (thread==nullptr)
    {
        return -1;
    }
    //ako krsi granice poola
    if (thread<&threadPool[0] || thread>= &threadPool[MAX_THREADS])
    {
        return -2;
    }

    uint64 index = (uint64)(thread-threadPool);
    uint64 bit = ((uint64)1<<index);

    //provera da nije vec releasovan u bitmapi
    if ((usedBitmap & bit)==0)
    {
        return -3;
    }

    //resetuje thread i updejtuje bitmapu
    thread->reset();
    usedBitmap &= ~bit;

    return 0;
}

bool KThread::isAllocated(const KThread* thread)
{
    if (thread==nullptr)
    {
        return false;
    }
    if (thread<&threadPool[0] || thread>= &threadPool[MAX_THREADS])
    {
        return false;
    }

    uint64 index = (uint64)(thread-threadPool);
    uint64 bit = ((uint64)1<<index);

    return (usedBitmap & bit) !=0;
}

uint64 KThread::getUsedBitmap()
{
    return usedBitmap;
}

uint64 KThread::getAllocatedCount()
{
    uint64 count = 0;
    uint64 bitmap = usedBitmap;
    while (bitmap!=0)
    {
        bitmap &=bitmap-1;
        count++;
    }
    return count;
}

static uint64 alignDown16(uint64 address)
{
    return address & ~((uint64)0xF);
}

static void clearThreadContext(ThreadContext* context)
{
    uint64* values = (uint64*)context;

    for (size_t i = 0;
         i < sizeof(ThreadContext) / sizeof(uint64);
         i++)
    {
        values[i] = 0;
    }
}

int KThread::initializeContext(KThread* thread,void* kernelStackAddress)
{
    if (thread == nullptr || kernelStackAddress == nullptr)
    {
        return -1;
    }

    thread->kernelStack = kernelStackAddress;
    thread->userStack = nullptr;

    uint64 stackTop =
        (uint64)kernelStackAddress + DEFAULT_STACK_SIZE;

    stackTop = alignDown16(stackTop);
    stackTop -= sizeof(ThreadContext);

    ThreadContext* context = (ThreadContext*)stackTop;

    clearThreadContext(context);

    uint64 currentGp;
    uint64 currentTp;
    uint64 currentSstatus;

    __asm__ volatile(
        "mv %0, gp"
        : "=r"(currentGp)
    );

    __asm__ volatile(
        "mv %0, tp"
        : "=r"(currentTp)
    );

    __asm__ volatile(
        "csrr %0, sstatus"
        : "=r"(currentSstatus)
    );

    context->gp = currentGp;
    context->tp = currentTp;

    /*
     * Postojeći yield završava sa ret.
     * Zato ra vodi na wrapper.
     */
    context->ra = (uint64)&threadWrapper;

    /*
     * Priprema za kasniju sret putanju.
     */
    context->sepc = (uint64)&threadWrapper;

    /*
     * Korak 3 radi u S režimu.
     *
     * Postavljamo SPP bit na 1.
     */
    static constexpr uint64 SSTATUS_SPP =
        ((uint64)1 << 8);

    context->sstatus =
        currentSstatus | SSTATUS_SPP;

    /*
     * Prvi argument wrapper-a.
     */
    context->a0 = (uint64)thread->body;

    /*
     * Drugi argument wrapper-a.
     */
    context->a1 = (uint64)thread->arg;

    thread->sp = (uint64*)context;
    thread->status = READY;

    return 0;
}

static void clearMemory(void* address, size_t size)
{
    uint8* bytes = (uint8*)address;
    for (size_t i=0;i<size;i++)
    {
        bytes[i] = 0;
    }
}

int KThread::initializeUserContext(KThread *thread)
{
    if (thread==nullptr || thread->kernelStack==nullptr || thread->userStack==nullptr || thread->body == nullptr)
    {
        return -1;
    }
    uint64 kernelTop = (uint64)thread->kernelStack+DEFAULT_STACK_SIZE;
    kernelTop = alignDown16(kernelTop);

    kernelTop -= sizeof(TrapFrame);
    TrapFrame* trapFrame = (TrapFrame*)kernelTop;

    clearMemory(trapFrame,sizeof(TrapFrame));

    uint64 userTop = (uint64)thread->userStack+DEFAULT_STACK_SIZE;
    userTop = alignDown16(userTop);

    trapFrame->sepc = (uint64)&threadWrapper;
    trapFrame->sstatus = 0;

    static constexpr uint64 SSTATUS_SPP = ((uint64)1<<8);

    uint64 currentSstatus;

    __asm__ volatile("csrr %0, sstatus": "=r"(currentSstatus));

    trapFrame->sstatus = currentSstatus& ~SSTATUS_SPP;

    trapFrame->a0 = (uint64)thread->body;
    trapFrame->a1 = (uint64)thread->arg;
    trapFrame->userSp=userTop;

    kernelTop -=sizeof(ThreadContext);
    ThreadContext* context = (ThreadContext*)kernelTop;

    clearMemory(context,sizeof(ThreadContext));

    uint64 currentGp;
    uint64 currentTp;

    __asm__ volatile("mv %0, gp":"=r"(currentGp));
    __asm__ volatile("mv %0, tp":"=r"(currentTp));

    context->gp = currentGp;
    context->tp = currentTp;
    context->ra = (uint64)&returnFromTrap;

    context->sepc = (uint64)&returnFromTrap;
    context->sstatus = currentSstatus;
    thread->sp = (uint64*)context;
    thread->status = READY;

    return 0;

}

int KThread::createUserThread(KThread **handle, Body body, void *arg, void *userStackTop)
{
    if(handle== nullptr || body==nullptr || userStackTop == nullptr) return -1;

    KThread* thread = KThread::allocate(body,arg);
    if(thread == nullptr) return -2;

    void* kernelStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    if(kernelStack==nullptr)
    {
        KThread::release(thread);
        return -3;
    }
    thread->kernelStack = kernelStack;
    thread->userStack = (void*)((uint64)userStackTop-DEFAULT_STACK_SIZE);
    if(KThread::initializeUserContext(thread)<0)
    {
        MemAllocator::mem_free(kernelStack);
        KThread::release(thread);
        return -4;
    }
    Scheduler::getInstance().put(thread);
    *handle = thread;
    return 0;
}

int KThread::block()
{
    KThread* old = KThread::running;
    if (old==nullptr) return -1;

    old->status = KThread::BLOCKED;
    KThread* next = Scheduler::getInstance().get();

    if (next==nullptr)
    {
        old->status = KThread::RUNNING;
        return -2;
    }
    KThread::running = next;
    next->status = KThread::RUNNING;
    yield(old,next);
    return 0;
}

int KThread::unblock(KThread* thread)
{
    if (thread==nullptr) return -1;
    if (!KThread::isAllocated(thread)) return -2;
    if (thread->status != KThread::BLOCKED) return -3;
    thread->status = KThread::READY;
    Scheduler::getInstance().put(thread);
    return 0;
}
void KThread::dispatch()
{
    KThread* old = KThread::running;
    if(old!=nullptr && old->status == RUNNING)
    {
        Scheduler::getInstance().put(old);
    }
    KThread* next = Scheduler::getInstance().get();
    if(next==nullptr) return;
    KThread::running = next;
    next->status = RUNNING;
    if(old!=next) yield(old,next);
}

int KThread::exit()
{
    KThread* old = KThread::running;
    if(old== nullptr) return -1;
    old->status = FINISHED;
    KThread::deferCleanup(old);
    KThread* next = Scheduler::getInstance().get();
    if(next== nullptr) return -2;
    KThread::running = next;
    next->status = RUNNING;
    yield(old,next);
    while(true)
    {
        __asm__ volatile("nop");
    }
}

void threadWrapper(KThread::Body body,void *arg)
{
    if (body!=nullptr) body(arg);

    /*Thread* finished = Thread::running;
    finished->status = Thread::FINISHED;

    Thread* next = Thread::finishTarget;

    if (next!=nullptr)
    {
        Thread::running = next;
        next->status = Thread::RUNNING;

        yield(finished,next);
    }*/

    thread_exit();

    while (true)
    {
        __asm__ volatile("nop");//ovo ce brisemo
    }
}