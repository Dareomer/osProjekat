//
// Created by os on 6/24/26.
//

#ifndef PROJECT_BASE_V1_1_SYSCALLS_H
#define PROJECT_BASE_V1_1_SYSCALLS_H
#include "../lib/hw.h"

class KThread;
using thread_t = KThread*;
class KSemaphore;
using sem_t = KSemaphore*;

enum SyscallCode : uint64{
    MEM_ALLOC=0x01,
    MEM_FREE=0x02,
    TEST = 0x03,
    TEST_NOP = 0x04,

    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH=0x13,

    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    SEM_WAIT_N = 0x25,
    SEM_SIGNAL_N = 0x26,

    CONSOLE_GETC = 0x41,
    CONSOLE_PUTC = 0x42
};
uint64 raw_syscall(uint64 code,uint64 arg1=0,uint64 arg2=0,uint64 arg3=0,uint64 arg4=0,uint64 arg5=0,uint64 arg6=0,uint64 arg7=0);//za test

void* mem_alloc(size_t numOfBlocks);
int mem_free(void* address);

int thread_create(thread_t* handle,void (*startRoutine)(void*),void* arg);
int thread_exit();
void thread_dispatch();

int sem_open(sem_t* handle, unsigned init);
int sem_close(sem_t handle);
int sem_wait(sem_t handle);
int sem_signal(sem_t handle);
int sem_wait_n(sem_t handle,unsigned n);
int sem_signal_n(sem_t handle,unsigned n);

int time_sleep(time_t time);  //brisi ovo obavezno

char getc();
void putc(char c);

int test(int a,int b,int c,int d,int e,int f,int h,int l);

#endif //PROJECT_BASE_V1_1_SYSCALLS_H
