//
// Created by os on 7/23/26.
//

#ifndef PROJECT_BASE_V1_1_TRAPFRAME_H
#define PROJECT_BASE_V1_1_TRAPFRAME_H

#include "../lib/hw.h"
struct TrapFrame{
    uint64 ra;

    uint64 a0;
    uint64 a1;
    uint64 a2;
    uint64 a3;
    uint64 a4;
    uint64 a5;
    uint64 a6;
    uint64 a7;

    uint64 t0;
    uint64 t1;
    uint64 t2;
    uint64 t3;
    uint64 t4;
    uint64 t5;
    uint64 t6;

    uint64 sepc;
    uint64 sstatus;

    uint64 userSp;
    uint64 padding;
};

#endif //PROJECT_BASE_V1_1_TRAPFRAME_H
