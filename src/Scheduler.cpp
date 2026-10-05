//
// Created by os on 7/20/26.
//

#include "../h/Scheduler.h"

int Scheduler::init()
{
    if (idleThread!=nullptr) return 0;

    idleThread = KThread::allocate(&Scheduler::idleBody,nullptr);
    if (idleThread == nullptr) return -1;

    void* stack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    if(stack== nullptr)
    {
        KThread::release(idleThread);
        idleThread = nullptr;
        return -2;
    }
    if(KThread::initializeContext(idleThread,stack)<0)
    {
        MemAllocator::mem_free(stack);
        KThread::release(idleThread);
        idleThread= nullptr;
        return -3;
    }
    idleThread->status=KThread::READY;
    idleThread->next = nullptr;
    return 0;
}

void Scheduler::put(KThread *thread)
{
    if (thread==nullptr) return;
    if (thread==idleThread) return;
    if (thread->status == KThread::FINISHED || thread->status == KThread::BLOCKED) return;

    thread->status = KThread::READY;
    thread->next = nullptr;

    if (head==nullptr)
    {
        head = thread;
        tail = thread;
        return;
    }
    tail->next = thread;
    tail= thread;
}

KThread *Scheduler::get()
{
    if (head==nullptr) return idleThread;

    KThread* thread=head;
    head=head->next;

    if (head==nullptr) tail=nullptr;

    thread->next = nullptr;
    return thread;
}

bool Scheduler::isEmpty() const
{
    return head==nullptr;
}

KThread *Scheduler::getIdleThread()
{
    return idleThread;
}

void Scheduler::idleBody(void *)
{
    while (true)
    {
        KThread::cleanupFinishedthreads();
        __asm__ volatile("nop");
    }
}
