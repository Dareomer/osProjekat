//
// Created by os on 7/25/26.
//
#include "../h/KSemaphore.h"


alignas(16) KSemaphore KSemaphore::semaphorePool[KSemaphore::MAX_SEMAPHORES];
uint64 KSemaphore::usedBitmap = 0;

KSemaphore::KSemaphore():value(0),closed(true),waitHead(nullptr),waitTail(nullptr){}

static uint64 findFirstSetBit(uint64 value)
{
    uint64 index = 0;

    while ((value & 1) == 0)
    {
        value >>= 1;
        index++;
    }

    return index;
}

void KSemaphore::reset(unsigned initialValue)
{
    value = (int)initialValue;
    closed = false;

    waitHead = nullptr;
    waitTail = nullptr;
}

KSemaphore* KSemaphore::allocate(unsigned initialValue)
{
    if (usedBitmap == ~(uint64)0)
    {
        return nullptr;
    }

    uint64 freeSlots = ~usedBitmap;
    uint64 index = findFirstSetBit(freeSlots);

    usedBitmap |= ((uint64)1 << index);

    KSemaphore* semaphore =
        &semaphorePool[index];

    semaphore->reset(initialValue);

    return semaphore;
}



int KSemaphore::release(KSemaphore* semaphore)
{
    if (semaphore == nullptr)
    {
        return -1;
    }

    if (semaphore < &semaphorePool[0] ||
        semaphore >=
            &semaphorePool[MAX_SEMAPHORES])
    {
        return -2;
    }

    uint64 index =
        (uint64)(semaphore - semaphorePool);

    uint64 bit =
        ((uint64)1 << index);

    if ((usedBitmap & bit) == 0)
    {
        return -3;
    }

    /*
     * Dok postoje niti u redu, objekat se
     * ne sme samo resetovati.
     */
    if (semaphore->waitHead != nullptr)
    {
        return -4;
    }

    semaphore->value = 0;
    semaphore->closed = true;
    semaphore->waitHead = nullptr;
    semaphore->waitTail = nullptr;

    usedBitmap &= ~bit;

    return 0;
}

int KSemaphore::waitN(unsigned n)
{
    if (closed) return -1;
    if (n==0) return 0;
    if ((unsigned)value>=n)
    {
        value-=(int)n;
        return 0;
    }
    KThread* current = KThread::running;
    if (current == nullptr || current->status != KThread::RUNNING) return -2;
    current->waitUnits = n;
    current->waitResult = 0;
    putWaitQueue(current);
    int result = KThread::block();
    if (result<0) return result;
    result = current->waitResult;
    current->waitUnits=0;
    current->waitResult= 0;
    return result;
}

int KSemaphore::signalN(unsigned n)
{
    if (closed) return -1;
    if (n==0) return 0;
    //ovde ubaciti zastitu od prevelikog n ako treba
    value+=(int)n;
    while (waitHead!=nullptr)
    {
        KThread* thread=waitHead;
        if (thread->waitUnits>(unsigned)value)
        {
            break;
        }
        value-=(int)thread->waitUnits;
        thread = getWaitQueue();
        thread->waitResult = 0;
        int result = KThread::unblock(thread);
        if (result<0) return -3;
    }
    return 0;
}

int KSemaphore::wait()
{
    return waitN(1);
}

int KSemaphore::signal()
{
    return signalN(1);
}

int KSemaphore::close()
{
    if (closed) return -1;
    closed = true;
    value=0;
    while (waitHead != nullptr)
    {
        KThread* thread = getWaitQueue();
        thread->waitResult=-1;
        thread->waitUnits=0;
        int result = KThread::unblock(thread);
        if (result<0) return -2;
    }
    return 0;
}

bool KSemaphore::isAllocated(const KSemaphore* semaphore)
{
    if (semaphore == nullptr)
    {
        return false;
    }

    if (semaphore < &semaphorePool[0] ||semaphore >=&semaphorePool[MAX_SEMAPHORES])
    {
        return false;
    }

    uint64 index =
        (uint64)(semaphore - semaphorePool);

    uint64 bit =
        ((uint64)1 << index);

    return (usedBitmap & bit) != 0;
}


uint64 KSemaphore::getUsedBitmap()
{
    return usedBitmap;
}

uint64 KSemaphore::getAllocatedCount()
{
    uint64 count = 0;
    uint64 bitmap = usedBitmap;

    while (bitmap != 0)
    {
        bitmap &= bitmap - 1;
        count++;
    }

    return count;
}


int KSemaphore::getValue() const
{
    return value;
}

bool KSemaphore::isClosed() const
{
    return closed;
}

bool KSemaphore::hasWaitingThreads() const
{
    return waitHead != nullptr;
}


void KSemaphore::putWaitQueue(KThread* thread)
{
    if (thread == nullptr)
    {
        return;
    }

    thread->waitNext = nullptr;

    if (waitTail == nullptr)
    {
        waitHead = thread;
        waitTail = thread;
        return;
    }

    waitTail->waitNext = thread;
    waitTail = thread;
}



KThread* KSemaphore::getWaitQueue()
{
    if (waitHead == nullptr)
    {
        return nullptr;
    }

    KThread* thread = waitHead;

    waitHead = waitHead->waitNext;

    if (waitHead == nullptr)
    {
        waitTail = nullptr;
    }

    thread->waitNext = nullptr;

    return thread;
}