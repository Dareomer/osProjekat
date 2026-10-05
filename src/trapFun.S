.extern trapHandle

.section .text
.align 4
.global trapFun
.type trapFun, @function

.global returnFromTrap
.type returnFromTrap, @function

trapFun:

    csrrw sp,sscratch,sp
    addi sp,sp,-160

    sd ra,0(sp)

    sd a0,8(sp)
    sd a1,16(sp)
    sd a2,24(sp)
    sd a3,32(sp)
    sd a4,40(sp)
    sd a5,48(sp)
    sd a6,56(sp)
    sd a7,64(sp)

    sd t0,72(sp)
    sd t1,80(sp)
    sd t2,88(sp)
    sd t3,96(sp)
    sd t4,104(sp)
    sd t5,112(sp)
    sd t6,120(sp)

    csrr t0,sepc
    sd t0,128(sp)
    csrr t0,sstatus
    sd t0,136(sp)

    csrr t0,sscratch
    sd t0,144(sp)

    sd zero,152(sp)

    mv a0,sp
    call trapHandle

returnFromTrap:

    ld t0,144(sp)
    csrw sscratch,t0

    ld t0,136(sp)
    csrw sstatus,t0

    ld t0,128(sp)
    csrw sepc,t0

    ld t6,120(sp)
    ld t5,112(sp)
    ld t4,104(sp)
    ld t3,96(sp)
    ld t2,88(sp)
    ld t1,80(sp)
    ld t0,72(sp)

    ld a7,64(sp)
    ld a6,56(sp)
    ld a5,48(sp)
    ld a4,40(sp)
    ld a3,32(sp)
    ld a2,24(sp)
    ld a1,16(sp)
    ld a0,8(sp)

    ld ra,0(sp)
    addi sp,sp,160

    csrrw sp,sscratch,sp

    sret