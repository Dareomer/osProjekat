//
// Created by os on 7/20/26.
//

#ifndef PROJECT_BASE_V1_1_THREADCONTEXT_H
#define PROJECT_BASE_V1_1_THREADCONTEXT_H

#include "../lib/hw.h"


struct ThreadContext
{
    uint64 ra;       // offset 0

    uint64 gp;       // offset 8
    uint64 tp;       // offset 16

    uint64 t0;       // offset 24
    uint64 t1;       // offset 32
    uint64 t2;       // offset 40
    uint64 t3;       // offset 48
    uint64 t4;       // offset 56
    uint64 t5;       // offset 64
    uint64 t6;       // offset 72

    uint64 a0;       // offset 80
    uint64 a1;       // offset 88
    uint64 a2;       // offset 96
    uint64 a3;       // offset 104
    uint64 a4;       // offset 112
    uint64 a5;       // offset 120
    uint64 a6;       // offset 128
    uint64 a7;       // offset 136

    uint64 s0;       // offset 144
    uint64 s1;       // offset 152
    uint64 s2;       // offset 160
    uint64 s3;       // offset 168
    uint64 s4;       // offset 176
    uint64 s5;       // offset 184
    uint64 s6;       // offset 192
    uint64 s7;       // offset 200
    uint64 s8;       // offset 208
    uint64 s9;       // offset 216
    uint64 s10;      // offset 224
    uint64 s11;      // offset 232

    uint64 sepc;     // offset 240
    uint64 sstatus;  // offset 248
};

static_assert(
    sizeof(ThreadContext) == 256,
    "ThreadContext layout mora imati tacno 256 bajtova"
);


#endif //PROJECT_BASE_V1_1_THREADCONTEXT_H
