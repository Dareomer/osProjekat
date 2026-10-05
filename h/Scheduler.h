//
// Created by os on 7/20/26.
//

#ifndef PROJECT_BASE_V1_1_SCHEDULER_H
#define PROJECT_BASE_V1_1_SCHEDULER_H


#include "MemAllocator.h"
#include "../h/KThread.h"

class Scheduler
{
public:
    static Scheduler& getInstance()
    {
        static Scheduler instance;
        return instance;
    }
    int init();

    void put(KThread* thread);
    KThread* get();

    KThread* getIdleThread();
    bool isEmpty() const;
private:
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};

    Scheduler(const Scheduler&) = delete;
    Scheduler& operator=(const Scheduler&) = delete;

    static void idleBody(void*);

    KThread* head;
    KThread* tail;
    KThread* idleThread;

};

#endif //PROJECT_BASE_V1_1_SCHEDULER_H
