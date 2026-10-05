//
// Created by os on 7/25/26.
//
#include "../h/syscall_cpp.hpp"

int time_sleep(time_t time)
{
    return -1;
}

Thread::Thread(void (*body)(void *), void *arg):myHandle(nullptr),body(body),arg(arg)
{

}

Thread::Thread():myHandle(nullptr),body(nullptr),arg(nullptr)
{

}

void Thread::runWrapper(void *thread)
{
    Thread* object = (Thread*)thread;
    if (object != nullptr)
    {
        object->run();
    }
}

int Thread::start()
{
    if (myHandle!=nullptr)
    {
        return -1;
    }
    if (body!=nullptr)
    {
        return thread_create(&myHandle,body,arg);
    }
    return thread_create(&myHandle,&Thread::runWrapper,this);
}

void Thread::dispatch()
{
    thread_dispatch();
}

int Thread::sleep(time_t)
{
    return -1;
}

Thread::~Thread()
{

}

Semaphore::Semaphore(unsigned init):myHandle(nullptr)
{
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore()
{
    if (myHandle!=nullptr)
    {
        sem_close(myHandle);
        myHandle = nullptr;
    }
}
int Semaphore::wait()
{
    if (myHandle==nullptr)
    {
        return -1;
    }
    return sem_wait(myHandle);
}

int Semaphore::signal()
{
    if (myHandle==nullptr)
    {
        return -1;
    }
    return sem_signal(myHandle);
}

char Console::getc()
{
    return ::getc();
}

void Console::putc(char c)
{
    ::putc(c);
}

PeriodicThread::PeriodicThread(time_t period):Thread(),period(period)
{

}

void PeriodicThread::terminate()
{
    period=0;
}