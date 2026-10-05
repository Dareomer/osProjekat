//
// Created by os on 6/24/26.
//
#include "../h/syscall_c.h"


//priprema parametara za syscall
static inline uint64 doSyscall(uint64 code,uint64 arg1=0,uint64 arg2=0,uint64 arg3=0,uint64 arg4=0,uint64 arg5=0,uint64 arg6=0,uint64 arg7=0)
{
   /* __asm__ volatile ("mv a0, %[a0]": : [a0] "r"(code));
    __asm__ volatile ("mv a1, %[a1]": :[a1] "r"(arg1));
    __asm__ volatile ("mv a2, %[a2]": :[a2] "r"(arg2));
    __asm__ volatile ("mv a3, %[a3]": :[a3] "r"(arg3));   //ovo je bila prvobitna ideja vraticu ako je
    __asm__ volatile ("mv a4, %[a4]": :[a4] "r"(arg4));   // ovo sad lose
    __asm__ volatile ("mv a5, %[a5]": :[a5] "r"(arg5));
    __asm__ volatile ("mv a6, %[a6]": :[a6] "r"(arg6));
    __asm__ volatile ("mv a7, %[a7]": :[a7] "r"(arg7));

    __asm__ volatile("ecall");*/

    register uint64 a0 asm("a0") = code;
    register uint64 a1 asm("a1") = arg1;
    register uint64 a2 asm("a2") = arg2;
    register uint64 a3 asm("a3") = arg3;
    register uint64 a4 asm("a4") = arg4;
    register uint64 a5 asm("a5") = arg5;
    register uint64 a6 asm("a6") = arg6;
    register uint64 a7 asm("a7") = arg7;

    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");

    return a0;
}

void* mem_alloc(size_t size)
{
    if(size==0) return nullptr;
    size_t blocks = (size+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    return (void*) doSyscall(MEM_ALLOC,(uint64)blocks);
}

int mem_free(void* address)
{
    return (int) doSyscall(MEM_FREE,(uint64)address);
}

int thread_create(thread_t* handle,void (*startRoutine)(void*),void* arg)
{
    if(handle== nullptr || startRoutine == nullptr) return -1;
    void* stackBase = mem_alloc(DEFAULT_STACK_SIZE);
    if(stackBase == nullptr) return -2;
    void* stackTop = (void*)((uint64)stackBase+DEFAULT_STACK_SIZE);
    int result = (int) doSyscall(THREAD_CREATE,(uint64)handle,(uint64)startRoutine,(uint64)arg,(uint64)stackTop);
    if(result<0)
    {
        mem_free(stackBase);
    }
    return result;
}

int thread_exit()
{
    return (int) doSyscall(THREAD_EXIT);
}

void thread_dispatch()
{
    doSyscall(THREAD_DISPATCH);
}

int sem_open(sem_t *handle, unsigned init)
{
    return (int)doSyscall(SEM_OPEN,(uint64)handle,(uint64)init);
}

int sem_close(sem_t handle)
{
    return (int)doSyscall(SEM_CLOSE,(uint64)handle);
}

int sem_wait(sem_t handle)
{
    return (int)doSyscall(SEM_WAIT,(uint64)handle);
}

int sem_signal(sem_t handle)
{
    return (int)doSyscall(SEM_SIGNAL,(uint64)handle);
}

int sem_wait_n(sem_t handle, unsigned n)
{
    return (int)doSyscall(SEM_WAIT_N,(uint64)handle,(uint64)n);
}

int sem_signal_n(sem_t handle, unsigned n)
{
    return (int)doSyscall(SEM_SIGNAL_N,(uint64)handle,(uint64)n);
}

char getc()
{
    return (char)doSyscall(CONSOLE_GETC);
}

void putc(char c)
{
    doSyscall(CONSOLE_PUTC,(uint64)(unsigned char )c);
}

int test(int a,int b,int c,int d,int e,int f,int h,int l) //ovo je testno treba da se sklanja
{
    return (int) doSyscall(a,b,c,d,e,f,h,l);
}

//za test brisati posle
uint64 raw_syscall(uint64 code,uint64 arg1,uint64 arg2,uint64 arg3,uint64 arg4,uint64 arg5,uint64 arg6,uint64 arg7)
{
    return doSyscall(code,arg1,arg2,arg3,arg4,arg5,arg6,arg7);
}

