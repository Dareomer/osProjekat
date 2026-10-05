//
// Created by os on 7/25/26.
//

#ifndef PROJECT_BASE_V1_1_KSEMAPHORE_H
#define PROJECT_BASE_V1_1_KSEMAPHORE_H

#include "../lib/hw.h"
#include "KThread.h"

class KSemaphore
{
public:
    static constexpr uint64 MAX_SEMAPHORES=64;

    static KSemaphore* allocate(unsigned initialValue);
    static int release(KSemaphore* semaphore);

    static bool isAllocated(const KSemaphore* semaphore);
    static uint64 getAllocatedCount();
    static uint64 getUsedBitmap();

    int close();

    int wait();
    int signal();
    int waitN(unsigned n);
    int signalN(unsigned n);

    int getValue() const;
    bool isClosed() const;
    bool hasWaitingThreads() const;

    void putWaitQueue(KThread* thread);
    KThread* getWaitQueue();
private:
    KSemaphore();

    void reset(unsigned initialValue);

    int value;
    bool closed;

    KThread* waitHead;
    KThread* waitTail;

    static KSemaphore semaphorePool[MAX_SEMAPHORES];
    static uint64 usedBitmap;
};

#endif //PROJECT_BASE_V1_1_KSEMAPHORE_H
