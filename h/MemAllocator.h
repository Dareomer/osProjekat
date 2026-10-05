//
// Created by os on 5/6/26.
//

#ifndef PROJECT_BASE_V1_1_MEMALLOCATOR_H
#define PROJECT_BASE_V1_1_MEMALLOCATOR_H
#include "../lib/hw.h"

struct FreeMem
{
    FreeMem* next;
    size_t size;
};

class MemAllocator
{
public:


    static void* mem_alloc(size_t size);
    static int mem_free(void* address);
    static void print_free_list();
    static void init();

private:
    MemAllocator()=delete;
    MemAllocator(MemAllocator const&);
    void operator = (MemAllocator const&);
    static FreeMem* freeMemHead;
    static bool initialized;
};



#endif //PROJECT_BASE_V1_1_MEMALLOCATOR_H
