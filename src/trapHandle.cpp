//
// Created by os on 6/24/26.
//
#include "../h/KConsole.h"
#include "../h/KSemaphore.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/MemAllocator.h"
#include "../h/TrapFrame.h"
#include "../h/KThread.h"

static constexpr uint64 TIMER_INTERRUPT = ((uint64)1<<63) | 1;
static constexpr uint64 INTERRUPT_BIT = 1ULL<63;
static constexpr uint64 EXTERNAL_INTERRUPT = INTERRUPT_BIT | 9;
volatile int debugScause = 0;
volatile int debugSepc = 0;
volatile int debugStval = 0;
volatile int debugSstatus = 0;
volatile int debugIrq = -1;
volatile int debugBranch = 0;

extern "C" void console_handler();

//handler za rutiranje koji syscall se poziva
extern "C" void trapHandle(TrapFrame* frame){
    uint64 scause;
    __asm__ volatile("csrr %0, scause":"=r"(scause));

    bool isInterrupt = (scause >>63)!=0;
    uint64 causeCode = scause & ~(1ULL<<63);
    if(isInterrupt && causeCode==1)
    {
        __asm__ volatile("csrc sip,%0": :"r"(1ULL<<1));//setuje bit 1 sip na 0
        return;
    }
    if(isInterrupt && causeCode==9)
    {
        int irq = plic_claim();
        if(irq == CONSOLE_IRQ)
        {

        }
        if(irq!=0)
        {
            plic_complete(irq);
        }
        return;
    }
    if(!isInterrupt && (causeCode==8 || causeCode==9))
    {
        uint64 syscallCode = frame->a0;
        frame->sepc+=4;
        switch(syscallCode)
        {
            case SEM_WAIT_N: {
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
                unsigned n = (unsigned)frame->a2;
                if (!KSemaphore::isAllocated(semaphore))
                {
                    frame->a0 = (uint64)-1;
                    break;
                }
                frame->a0 = (uint64)semaphore->waitN(n);
                break;
            }
            case SEM_SIGNAL_N: {
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
                unsigned n = (unsigned)frame->a2;
                if (!KSemaphore::isAllocated(semaphore))
                {
                    frame->a0 = (uint64)-1;
                    break;
                }
                frame->a0 = (uint64)semaphore->signalN(n);
                break;
            }
            case SEM_OPEN: {
                sem_t* handle = (sem_t*)frame->a1;
                unsigned init = (unsigned) frame->a2;
                if (handle==nullptr)
                {
                    frame->a1 = (uint64)-1;
                    break;
                }
                KSemaphore* semaphore = KSemaphore::allocate(init);
                if (semaphore==nullptr)
                {
                    frame->a0 = (uint64)-2;
                    break;
                }
                *handle = semaphore;
                frame->a0 = 0;
                break;
            }
            case SEM_WAIT: {
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
                if (!KSemaphore::isAllocated(semaphore))
                {
                    frame->a0 = (uint64)-1;
                    break;
                }
                frame->a0 = (uint64)semaphore->wait();
                break;
            }
            case SEM_SIGNAL: {
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
                if (!KSemaphore::isAllocated(semaphore))
                {
                    frame->a0 = (uint64)-1;
                    break;
                }
                frame->a0 = (uint64)semaphore->signal();
                break;
            }
            case SEM_CLOSE: {
                KSemaphore* semaphore=(KSemaphore*)frame->a1;
                if (!KSemaphore::isAllocated(semaphore))
                {
                    frame->a0 = (uint64)-1;
                    break;
                }
                int result = semaphore->close();
                if (result==0) result = KSemaphore::release(semaphore);
                frame->a0 = (uint64)result;
                break;
            }
            case THREAD_CREATE: {
                KThread **handle = (KThread **) frame->a1;
                KThread::Body body = (KThread::Body) frame->a2;
                void *arg = (void *) frame->a3;
                void *userStackTop = (void *) frame->a4;
                frame->a0 = (uint64) KThread::createUserThread(handle, body, arg, userStackTop);
                break;
            }
            case THREAD_EXIT: {
                frame->a0 = (uint64) KThread::exit();
                break;
            }
            case THREAD_DISPATCH: {
                KThread::dispatch();
                frame->a0 = 0;
                break;
            }
            case MEM_ALLOC: {
                void *result = (void *) MemAllocator::mem_alloc((size_t) frame->a1);
                frame->a0 = (uint64) result;
                break;
            }
            case MEM_FREE: {
                void *address = (void *) frame->a1;
                int result = MemAllocator::mem_free(address);
                frame->a0 = (uint64) result;
                break;
            }
            case CONSOLE_PUTC: {
                char c = (char)frame->a1;
                KConsole::putc(c);
                frame->a0=0;
                break;
            }
            case CONSOLE_GETC: {
                frame->a0 = (uint64)(unsigned char)KConsole::getc();
                break;
            }
            case TEST: {
                int result = frame->a1 + frame->a2 + frame->a3 + frame->a4 + frame->a5 + frame->a6 + frame->a7;
                frame->a0 = (uint64) result;
                break;
            }
            case TEST_NOP: {
                frame->a0 = 0;
                break;
            }
            default: {
                frame->a0 = (uint64) -1;
                break;
            }
        }
        return;
    }
    if (!isInterrupt && (causeCode==2 || causeCode==5 || causeCode==7))
    {
        if (causeCode==2)
        {
            KConsole::putc('E');
            KConsole::putc('2');
            KConsole::putc('\n');
        }
        else if (causeCode==5)
        {
            KConsole::putc('E');
            KConsole::putc('5');
            KConsole::putc('\n');
        }
        else
        {
            KConsole::putc('E');
            KConsole::putc('7');
            KConsole::putc('\n');
        }
        volatile uint32* qemuExit = (volatile uint32*)0x100000;
        *qemuExit = 0x5555;
    }
    debugScause=scause;
    debugSepc = frame->sepc;
    uint64 stval;
    __asm__ volatile("csrr %0,stval":"=r"(stval));
    debugStval =stval;
    while(true)
    {
        __asm__ volatile("nop");
    }

}

