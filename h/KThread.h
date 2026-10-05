//
// Created by os on 7/20/26.
//

#ifndef PROJECT_BASE_V1_1_THREAD_H
#define PROJECT_BASE_V1_1_THREAD_H

#include "../lib/hw.h"
#include "../h/TrapFrame.h"

extern "C" void threadWrapper(void (*body)(void*),void* arg);


class KThread
{
public:
    using Body = void(*)(void*);

    enum Status
    {
        READY,
        RUNNING,
        FINISHED,
        BLOCKED
    };
    static constexpr uint64 MAX_THREADS=64;

    uint64* sp;
    Body body;
    void* arg;

    KThread* next;
    Status status;
    //semafor only

    KThread* waitNext;
    unsigned waitUnits;
    int waitResult;
    //semafor only kraj

    void* kernelStack;
    void* userStack;

    static KThread* running;

    static int initializeContext(KThread* thread,void* kernelStack);
    static int initializeUserContext(KThread* thread);

    static KThread* allocate(Body body,void* arg);

    static int release(KThread* thread);

    static int createUserThread(KThread** handle,Body body,void* arg,void* userStackTop);

    static int block();
    static int unblock(KThread* thread);
    static void dispatch();
    static int exit();

    static void deferCleanup(KThread* thread);
    static void cleanupFinishedthreads();

    static bool isAllocated(const KThread* thread);
    static uint64 getUsedBitmap();
    static uint64 getAllocatedCount();
private:
    KThread();

    void reset();

    static KThread threadPool[MAX_THREADS];
    static uint64 usedBitmap;

    static KThread* cleanupHead;
    static KThread* cleanupTail;
};

extern "C" void yield(KThread* oldThread, KThread* newThread);
extern "C" void returnFromTrap();

#endif //PROJECT_BASE_V1_1_THREAD_H
