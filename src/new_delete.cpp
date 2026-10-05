//
// Created by os on 7/25/26.
//
#include "../h/syscall_c.h"

void* operator new(size_t size)
{
    if (size==0) size=1;
    return mem_alloc(size);
}
void* operator new[](size_t size)
{
    if (size==0) size=1;
    return mem_alloc(size);
}
void operator delete(void* ptr)
{
    if (ptr!=nullptr)
    {
        mem_free(ptr);
    }
}
void operator delete[](void* ptr)
{
    if (ptr!=nullptr)
    {
        mem_free(ptr);
    }
}