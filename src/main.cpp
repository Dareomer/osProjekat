#include "../h/MemAllocator.h"
//
// Created by os on 5/6/26.
//


#include "../lib/console.h"
#include "../h/syscall_c.h"
#include "../h/KThread.h"
#include "../h/Scheduler.h"

extern "C" void yield(KThread* oldThread, KThread* newThread);
extern "C" void trapFun();
//void* allocate[100];
//int test_fun()
//{
    //__asm__ volatile(".word 0");

    //void* result = mem_alloc(9999999999999);
    //if (result == nullptr) return 1;

    //int x = mem_free(0);
    //if (x==-1) return 1;

    //int i = test(3,10,20,30,40,50,60,70);
    //if(i) return i;
    //return 0;
//}

// ---------- MAIN ----------
/*
int main()
{
    int x;
    uint64 stvecSet = (uint64)&trapFun | 0L;
    __asm__ volatile ("csrw stvec, %0": :"r"(stvecSet));//treba da se OR sa 0
    x = test_fun();
    if(x==280) __putc('C');
    return 0;
}
*/

/*void userMain(){}

static void userMainWrapper(void*)
{
    userMain();
}

int main()
{
    __asm__ volatile("csrw stvec,%0"::"r"((uint64)&trapFun));
    if(Scheduler::getInstance().init()<0)
    {
        while(true) {}
    }
    Thread* initThread = Thread::allocate(nullptr, nullptr);
    Thread* mainThread = Thread::allocate(&userMainWrapper, nullptr);
    if(initThread==nullptr || mainThread== nullptr){
        while(true) {}
    }
    mainThread->kernelStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    mainThread->userStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    if(mainThread->kernelStack == nullptr|| mainThread->userStack == nullptr)
    {
        while(true){}
    }
    if(Thread::initializeUserContext(mainThread)<0)
    {
        while(true){}
    }
    initThread->status = Thread::RUNNING;
    Thread::running = mainThread;
    mainThread->status = Thread::RUNNING;
    yield(initThread,mainThread);
    while(true)
    {
        __asm__ volatile("nop");
    }
}*/
#include "../h/KSemaphore.h"
#include "../h/KThread.h"
#include "../h/Scheduler.h"
#include "../h/MemAllocator.h"
#include "../h/KConsole.h"
#include "../h/syscall_cpp.hpp"


#include "../test/printing.hpp"

#define LEVEL_1_IMPLEMENTED 1
#define LEVEL_2_IMPLEMENTED 1
#define LEVEL_3_IMPLEMENTED 1
#define LEVEL_4_IMPLEMENTED 0

#if LEVEL_2_IMPLEMENTED == 1
// TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)
#include "../test/Threads_C_API_test.hpp"
// TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)
#include "../test/Threads_CPP_API_test.hpp"
// TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)
#include "../test/System_Mode_test.hpp"
#endif

#if LEVEL_3_IMPLEMENTED == 1
// TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_C_API_test.hpp"
// TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp"
#endif

#if LEVEL_4_IMPLEMENTED == 1
// TEST 5 (zadatak 4., thread_sleep test C API)
#include "../test/ThreadSleep_C_API_test.hpp"
// TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMain() {
    printString("Unesite broj testa? [1-7]\n");
    int test = getc() - '0';
    getc(); // Enter posle broja

    if ((test >= 1 && test <= 2) || test == 7) {
        if (LEVEL_2_IMPLEMENTED == 0) {
            printString("Nije navedeno da je zadatak 2 implementiran\n");
            return;
        }
    }

    if (test >= 3 && test <= 4) {
        if (LEVEL_3_IMPLEMENTED == 0) {
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
        if (LEVEL_4_IMPLEMENTED == 0) {
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
#endif
            break;
        case 2:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_CPP_API_test();
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
#endif
            break;
        case 3:
#if LEVEL_3_IMPLEMENTED == 1
            producerConsumer_C_API();
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
#endif
            break;
        case 4:
#if LEVEL_3_IMPLEMENTED == 1
            producerConsumer_CPP_Sync_API();
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
#endif
            break;
        case 5:
#if LEVEL_4_IMPLEMENTED == 1
            testSleeping();
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
#endif
            break;
        case 6:
#if LEVEL_4_IMPLEMENTED == 1
            testConsumerProducer();
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
#endif
            break;
        case 7:
#if LEVEL_2_IMPLEMENTED == 1
            System_Mode_test();
            printString("Test se nije uspesno zavrsio\n");
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
}

static void userMainWrapper(void*)
{
    userMain();
}


int main()
{
    __asm__ volatile("csrw stvec,%0"::"r"((uint64)&trapFun));
    if(Scheduler::getInstance().init()<0)
    {
        while(true) {}
    }
    KThread* initThread = KThread::allocate(nullptr, nullptr);
    KThread* mainThread = KThread::allocate(userMainWrapper, nullptr);
    if(initThread==nullptr || mainThread== nullptr){
        while(true) {}
    }
    mainThread->kernelStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    mainThread->userStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    if(mainThread->kernelStack == nullptr|| mainThread->userStack == nullptr)
    {
        while(true){}
    }
    if(KThread::initializeUserContext(mainThread)<0)
    {
        while(true){}
    }
    initThread->status = KThread::RUNNING;
    KThread::running = mainThread;
    mainThread->status = KThread::RUNNING;
    yield(initThread,mainThread);
    while(true)
    {
        __asm__ volatile("nop");
    }
}




