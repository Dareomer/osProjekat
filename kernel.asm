
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	a1813103          	ld	sp,-1512(sp) # 8000ba18 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	5b9060ef          	jal	ra,80006dd4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <trapFun>:
.global returnFromTrap
.type returnFromTrap, @function

trapFun:

    csrrw sp,sscratch,sp
    80001000:	14011173          	csrrw	sp,sscratch,sp
    addi sp,sp,-160
    80001004:	f6010113          	addi	sp,sp,-160

    sd ra,0(sp)
    80001008:	00113023          	sd	ra,0(sp)

    sd a0,8(sp)
    8000100c:	00a13423          	sd	a0,8(sp)
    sd a1,16(sp)
    80001010:	00b13823          	sd	a1,16(sp)
    sd a2,24(sp)
    80001014:	00c13c23          	sd	a2,24(sp)
    sd a3,32(sp)
    80001018:	02d13023          	sd	a3,32(sp)
    sd a4,40(sp)
    8000101c:	02e13423          	sd	a4,40(sp)
    sd a5,48(sp)
    80001020:	02f13823          	sd	a5,48(sp)
    sd a6,56(sp)
    80001024:	03013c23          	sd	a6,56(sp)
    sd a7,64(sp)
    80001028:	05113023          	sd	a7,64(sp)

    sd t0,72(sp)
    8000102c:	04513423          	sd	t0,72(sp)
    sd t1,80(sp)
    80001030:	04613823          	sd	t1,80(sp)
    sd t2,88(sp)
    80001034:	04713c23          	sd	t2,88(sp)
    sd t3,96(sp)
    80001038:	07c13023          	sd	t3,96(sp)
    sd t4,104(sp)
    8000103c:	07d13423          	sd	t4,104(sp)
    sd t5,112(sp)
    80001040:	07e13823          	sd	t5,112(sp)
    sd t6,120(sp)
    80001044:	07f13c23          	sd	t6,120(sp)

    csrr t0,sepc
    80001048:	141022f3          	csrr	t0,sepc
    sd t0,128(sp)
    8000104c:	08513023          	sd	t0,128(sp)
    csrr t0,sstatus
    80001050:	100022f3          	csrr	t0,sstatus
    sd t0,136(sp)
    80001054:	08513423          	sd	t0,136(sp)

    csrr t0,sscratch
    80001058:	140022f3          	csrr	t0,sscratch
    sd t0,144(sp)
    8000105c:	08513823          	sd	t0,144(sp)

    sd zero,152(sp)
    80001060:	08013c23          	sd	zero,152(sp)

    mv a0,sp
    80001064:	00010513          	mv	a0,sp
    call trapHandle
    80001068:	5b5010ef          	jal	ra,80002e1c <trapHandle>

000000008000106c <returnFromTrap>:

returnFromTrap:

    ld t0,144(sp)
    8000106c:	09013283          	ld	t0,144(sp)
    csrw sscratch,t0
    80001070:	14029073          	csrw	sscratch,t0

    ld t0,136(sp)
    80001074:	08813283          	ld	t0,136(sp)
    csrw sstatus,t0
    80001078:	10029073          	csrw	sstatus,t0

    ld t0,128(sp)
    8000107c:	08013283          	ld	t0,128(sp)
    csrw sepc,t0
    80001080:	14129073          	csrw	sepc,t0

    ld t6,120(sp)
    80001084:	07813f83          	ld	t6,120(sp)
    ld t5,112(sp)
    80001088:	07013f03          	ld	t5,112(sp)
    ld t4,104(sp)
    8000108c:	06813e83          	ld	t4,104(sp)
    ld t3,96(sp)
    80001090:	06013e03          	ld	t3,96(sp)
    ld t2,88(sp)
    80001094:	05813383          	ld	t2,88(sp)
    ld t1,80(sp)
    80001098:	05013303          	ld	t1,80(sp)
    ld t0,72(sp)
    8000109c:	04813283          	ld	t0,72(sp)

    ld a7,64(sp)
    800010a0:	04013883          	ld	a7,64(sp)
    ld a6,56(sp)
    800010a4:	03813803          	ld	a6,56(sp)
    ld a5,48(sp)
    800010a8:	03013783          	ld	a5,48(sp)
    ld a4,40(sp)
    800010ac:	02813703          	ld	a4,40(sp)
    ld a3,32(sp)
    800010b0:	02013683          	ld	a3,32(sp)
    ld a2,24(sp)
    800010b4:	01813603          	ld	a2,24(sp)
    ld a1,16(sp)
    800010b8:	01013583          	ld	a1,16(sp)
    ld a0,8(sp)
    800010bc:	00813503          	ld	a0,8(sp)

    ld ra,0(sp)
    800010c0:	00013083          	ld	ra,0(sp)
    addi sp,sp,160
    800010c4:	0a010113          	addi	sp,sp,160

    csrrw sp,sscratch,sp
    800010c8:	14011173          	csrrw	sp,sscratch,sp

    800010cc:	10200073          	sret

00000000800010d0 <yield>:
.global yield
.type yield, @function

yield:

    addi sp, sp, -256
    800010d0:	f0010113          	addi	sp,sp,-256

    sd ra,   0(sp)
    800010d4:	00113023          	sd	ra,0(sp)

    sd gp,   8(sp)
    800010d8:	00313423          	sd	gp,8(sp)
    sd tp,  16(sp)
    800010dc:	00413823          	sd	tp,16(sp)

    sd t0,  24(sp)
    800010e0:	00513c23          	sd	t0,24(sp)
    sd t1,  32(sp)
    800010e4:	02613023          	sd	t1,32(sp)
    sd t2,  40(sp)
    800010e8:	02713423          	sd	t2,40(sp)
    sd t3,  48(sp)
    800010ec:	03c13823          	sd	t3,48(sp)
    sd t4,  56(sp)
    800010f0:	03d13c23          	sd	t4,56(sp)
    sd t5,  64(sp)
    800010f4:	05e13023          	sd	t5,64(sp)
    sd t6,  72(sp)
    800010f8:	05f13423          	sd	t6,72(sp)

    sd a0,  80(sp)
    800010fc:	04a13823          	sd	a0,80(sp)
    sd a1,  88(sp)
    80001100:	04b13c23          	sd	a1,88(sp)
    sd a2,  96(sp)
    80001104:	06c13023          	sd	a2,96(sp)
    sd a3, 104(sp)
    80001108:	06d13423          	sd	a3,104(sp)
    sd a4, 112(sp)
    8000110c:	06e13823          	sd	a4,112(sp)
    sd a5, 120(sp)
    80001110:	06f13c23          	sd	a5,120(sp)
    sd a6, 128(sp)
    80001114:	09013023          	sd	a6,128(sp)
    sd a7, 136(sp)
    80001118:	09113423          	sd	a7,136(sp)

    sd s0, 144(sp)
    8000111c:	08813823          	sd	s0,144(sp)
    sd s1, 152(sp)
    80001120:	08913c23          	sd	s1,152(sp)
    sd s2, 160(sp)
    80001124:	0b213023          	sd	s2,160(sp)
    sd s3, 168(sp)
    80001128:	0b313423          	sd	s3,168(sp)
    sd s4, 176(sp)
    8000112c:	0b413823          	sd	s4,176(sp)
    sd s5, 184(sp)
    80001130:	0b513c23          	sd	s5,184(sp)
    sd s6, 192(sp)
    80001134:	0d613023          	sd	s6,192(sp)
    sd s7, 200(sp)
    80001138:	0d713423          	sd	s7,200(sp)
    sd s8, 208(sp)
    8000113c:	0d813823          	sd	s8,208(sp)
    sd s9, 216(sp)
    80001140:	0d913c23          	sd	s9,216(sp)
    sd s10, 224(sp)
    80001144:	0fa13023          	sd	s10,224(sp)
    sd s11, 232(sp)
    80001148:	0fb13423          	sd	s11,232(sp)

    csrr t0, sepc
    8000114c:	141022f3          	csrr	t0,sepc
    sd t0, 240(sp)
    80001150:	0e513823          	sd	t0,240(sp)

    csrr t0, sstatus
    80001154:	100022f3          	csrr	t0,sstatus
    sd t0, 248(sp)
    80001158:	0e513c23          	sd	t0,248(sp)

    sd sp, 0(a0)
    8000115c:	00253023          	sd	sp,0(a0) # 1000 <_entry-0x7ffff000>

    ld sp, 0(a1)
    80001160:	0005b103          	ld	sp,0(a1)

    ld t0, 248(sp)
    80001164:	0f813283          	ld	t0,248(sp)
    csrw sstatus, t0
    80001168:	10029073          	csrw	sstatus,t0

    ld t0, 240(sp)
    8000116c:	0f013283          	ld	t0,240(sp)
    csrw sepc, t0
    80001170:	14129073          	csrw	sepc,t0


    ld ra,   0(sp)
    80001174:	00013083          	ld	ra,0(sp)

    ld gp,   8(sp)
    80001178:	00813183          	ld	gp,8(sp)
    ld tp,  16(sp)
    8000117c:	01013203          	ld	tp,16(sp)

    ld t0,  24(sp)
    80001180:	01813283          	ld	t0,24(sp)
    ld t1,  32(sp)
    80001184:	02013303          	ld	t1,32(sp)
    ld t2,  40(sp)
    80001188:	02813383          	ld	t2,40(sp)
    ld t3,  48(sp)
    8000118c:	03013e03          	ld	t3,48(sp)
    ld t4,  56(sp)
    80001190:	03813e83          	ld	t4,56(sp)
    ld t5,  64(sp)
    80001194:	04013f03          	ld	t5,64(sp)
    ld t6,  72(sp)
    80001198:	04813f83          	ld	t6,72(sp)

    ld a0,  80(sp)
    8000119c:	05013503          	ld	a0,80(sp)
    ld a1,  88(sp)
    800011a0:	05813583          	ld	a1,88(sp)
    ld a2,  96(sp)
    800011a4:	06013603          	ld	a2,96(sp)
    ld a3, 104(sp)
    800011a8:	06813683          	ld	a3,104(sp)
    ld a4, 112(sp)
    800011ac:	07013703          	ld	a4,112(sp)
    ld a5, 120(sp)
    800011b0:	07813783          	ld	a5,120(sp)
    ld a6, 128(sp)
    800011b4:	08013803          	ld	a6,128(sp)
    ld a7, 136(sp)
    800011b8:	08813883          	ld	a7,136(sp)

    ld s0, 144(sp)
    800011bc:	09013403          	ld	s0,144(sp)
    ld s1, 152(sp)
    800011c0:	09813483          	ld	s1,152(sp)
    ld s2, 160(sp)
    800011c4:	0a013903          	ld	s2,160(sp)
    ld s3, 168(sp)
    800011c8:	0a813983          	ld	s3,168(sp)
    ld s4, 176(sp)
    800011cc:	0b013a03          	ld	s4,176(sp)
    ld s5, 184(sp)
    800011d0:	0b813a83          	ld	s5,184(sp)
    ld s6, 192(sp)
    800011d4:	0c013b03          	ld	s6,192(sp)
    ld s7, 200(sp)
    800011d8:	0c813b83          	ld	s7,200(sp)
    ld s8, 208(sp)
    800011dc:	0d013c03          	ld	s8,208(sp)
    ld s9, 216(sp)
    800011e0:	0d813c83          	ld	s9,216(sp)
    ld s10, 224(sp)
    800011e4:	0e013d03          	ld	s10,224(sp)
    ld s11, 232(sp)
    800011e8:	0e813d83          	ld	s11,232(sp)

    addi sp, sp, 256
    800011ec:	10010113          	addi	sp,sp,256


    800011f0:	00008067          	ret

00000000800011f4 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    800011f4:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    800011f8:	00b29a63          	bne	t0,a1,8000120c <fail>
    sc.w t0, a2, (a0)      # Try to update.
    800011fc:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001200:	fe029ae3          	bnez	t0,800011f4 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001204:	00000513          	li	a0,0
    jr ra                  # Return.
    80001208:	00008067          	ret

000000008000120c <fail>:
    fail:
    li a0, 1               # Set return to failure.
    8000120c:	00100513          	li	a0,1
    80001210:	00008067          	ret

0000000080001214 <_Z9mem_allocm>:

    return a0;
}

void* mem_alloc(size_t size)
{
    80001214:	ff010113          	addi	sp,sp,-16
    80001218:	00813423          	sd	s0,8(sp)
    8000121c:	01010413          	addi	s0,sp,16
    if(size==0) return nullptr;
    80001220:	02050c63          	beqz	a0,80001258 <_Z9mem_allocm+0x44>
    size_t blocks = (size+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE;
    80001224:	03f50593          	addi	a1,a0,63
    register uint64 a0 asm("a0") = code;
    80001228:	00100513          	li	a0,1
    register uint64 a1 asm("a1") = arg1;
    8000122c:	0065d593          	srli	a1,a1,0x6
    register uint64 a2 asm("a2") = arg2;
    80001230:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001234:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    80001238:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    8000123c:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001240:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001244:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001248:	00000073          	ecall
    return (void*) doSyscall(MEM_ALLOC,(uint64)blocks);
}
    8000124c:	00813403          	ld	s0,8(sp)
    80001250:	01010113          	addi	sp,sp,16
    80001254:	00008067          	ret
    if(size==0) return nullptr;
    80001258:	00000513          	li	a0,0
    8000125c:	ff1ff06f          	j	8000124c <_Z9mem_allocm+0x38>

0000000080001260 <_Z8mem_freePv>:

int mem_free(void* address)
{
    80001260:	ff010113          	addi	sp,sp,-16
    80001264:	00813423          	sd	s0,8(sp)
    80001268:	01010413          	addi	s0,sp,16
    8000126c:	00050593          	mv	a1,a0
    register uint64 a0 asm("a0") = code;
    80001270:	00200513          	li	a0,2
    register uint64 a2 asm("a2") = arg2;
    80001274:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001278:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    8000127c:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001280:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001284:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001288:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    8000128c:	00000073          	ecall
    return (int) doSyscall(MEM_FREE,(uint64)address);
}
    80001290:	0005051b          	sext.w	a0,a0
    80001294:	00813403          	ld	s0,8(sp)
    80001298:	01010113          	addi	sp,sp,16
    8000129c:	00008067          	ret

00000000800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>:

int thread_create(thread_t* handle,void (*startRoutine)(void*),void* arg)
{
    800012a0:	fd010113          	addi	sp,sp,-48
    800012a4:	02113423          	sd	ra,40(sp)
    800012a8:	02813023          	sd	s0,32(sp)
    800012ac:	00913c23          	sd	s1,24(sp)
    800012b0:	01213823          	sd	s2,16(sp)
    800012b4:	01313423          	sd	s3,8(sp)
    800012b8:	03010413          	addi	s0,sp,48
    if(handle== nullptr || startRoutine == nullptr) return -1;
    800012bc:	08050663          	beqz	a0,80001348 <_Z13thread_createPP7KThreadPFvPvES2_+0xa8>
    800012c0:	00050493          	mv	s1,a0
    800012c4:	00058913          	mv	s2,a1
    800012c8:	00060993          	mv	s3,a2
    800012cc:	08058263          	beqz	a1,80001350 <_Z13thread_createPP7KThreadPFvPvES2_+0xb0>
    void* stackBase = mem_alloc(DEFAULT_STACK_SIZE);
    800012d0:	00001537          	lui	a0,0x1
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	f40080e7          	jalr	-192(ra) # 80001214 <_Z9mem_allocm>
    800012dc:	00050313          	mv	t1,a0
    if(stackBase == nullptr) return -2;
    800012e0:	06050c63          	beqz	a0,80001358 <_Z13thread_createPP7KThreadPFvPvES2_+0xb8>
    register uint64 a0 asm("a0") = code;
    800012e4:	01100513          	li	a0,17
    register uint64 a1 asm("a1") = arg1;
    800012e8:	00048593          	mv	a1,s1
    register uint64 a2 asm("a2") = arg2;
    800012ec:	00090613          	mv	a2,s2
    register uint64 a3 asm("a3") = arg3;
    800012f0:	00098693          	mv	a3,s3
    register uint64 a4 asm("a4") = arg4;
    800012f4:	00001737          	lui	a4,0x1
    800012f8:	00e30733          	add	a4,t1,a4
    register uint64 a5 asm("a5") = arg5;
    800012fc:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001300:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001304:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001308:	00000073          	ecall
    void* stackTop = (void*)((uint64)stackBase+DEFAULT_STACK_SIZE);
    int result = (int) doSyscall(THREAD_CREATE,(uint64)handle,(uint64)startRoutine,(uint64)arg,(uint64)stackTop);
    8000130c:	0005049b          	sext.w	s1,a0
    if(result<0)
    80001310:	02051793          	slli	a5,a0,0x20
    80001314:	0207c263          	bltz	a5,80001338 <_Z13thread_createPP7KThreadPFvPvES2_+0x98>
    {
        mem_free(stackBase);
    }
    return result;
}
    80001318:	00048513          	mv	a0,s1
    8000131c:	02813083          	ld	ra,40(sp)
    80001320:	02013403          	ld	s0,32(sp)
    80001324:	01813483          	ld	s1,24(sp)
    80001328:	01013903          	ld	s2,16(sp)
    8000132c:	00813983          	ld	s3,8(sp)
    80001330:	03010113          	addi	sp,sp,48
    80001334:	00008067          	ret
        mem_free(stackBase);
    80001338:	00030513          	mv	a0,t1
    8000133c:	00000097          	auipc	ra,0x0
    80001340:	f24080e7          	jalr	-220(ra) # 80001260 <_Z8mem_freePv>
    80001344:	fd5ff06f          	j	80001318 <_Z13thread_createPP7KThreadPFvPvES2_+0x78>
    if(handle== nullptr || startRoutine == nullptr) return -1;
    80001348:	fff00493          	li	s1,-1
    8000134c:	fcdff06f          	j	80001318 <_Z13thread_createPP7KThreadPFvPvES2_+0x78>
    80001350:	fff00493          	li	s1,-1
    80001354:	fc5ff06f          	j	80001318 <_Z13thread_createPP7KThreadPFvPvES2_+0x78>
    if(stackBase == nullptr) return -2;
    80001358:	ffe00493          	li	s1,-2
    8000135c:	fbdff06f          	j	80001318 <_Z13thread_createPP7KThreadPFvPvES2_+0x78>

0000000080001360 <_Z11thread_exitv>:

int thread_exit()
{
    80001360:	ff010113          	addi	sp,sp,-16
    80001364:	00813423          	sd	s0,8(sp)
    80001368:	01010413          	addi	s0,sp,16
    register uint64 a0 asm("a0") = code;
    8000136c:	01200513          	li	a0,18
    register uint64 a1 asm("a1") = arg1;
    80001370:	00000593          	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80001374:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001378:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    8000137c:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001380:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001384:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001388:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    8000138c:	00000073          	ecall
    return (int) doSyscall(THREAD_EXIT);
}
    80001390:	0005051b          	sext.w	a0,a0
    80001394:	00813403          	ld	s0,8(sp)
    80001398:	01010113          	addi	sp,sp,16
    8000139c:	00008067          	ret

00000000800013a0 <_Z15thread_dispatchv>:

void thread_dispatch()
{
    800013a0:	ff010113          	addi	sp,sp,-16
    800013a4:	00813423          	sd	s0,8(sp)
    800013a8:	01010413          	addi	s0,sp,16
    register uint64 a0 asm("a0") = code;
    800013ac:	01300513          	li	a0,19
    register uint64 a1 asm("a1") = arg1;
    800013b0:	00000593          	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    800013b4:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    800013b8:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    800013bc:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    800013c0:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    800013c4:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    800013c8:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    800013cc:	00000073          	ecall
    doSyscall(THREAD_DISPATCH);
}
    800013d0:	00813403          	ld	s0,8(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z8sem_openPP10KSemaphorej>:

int sem_open(sem_t *handle, unsigned init)
{
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00813423          	sd	s0,8(sp)
    800013e4:	01010413          	addi	s0,sp,16
    800013e8:	00050793          	mv	a5,a0
    800013ec:	00058613          	mv	a2,a1
    register uint64 a0 asm("a0") = code;
    800013f0:	02100513          	li	a0,33
    register uint64 a1 asm("a1") = arg1;
    800013f4:	00078593          	mv	a1,a5
    register uint64 a2 asm("a2") = arg2;
    800013f8:	02061613          	slli	a2,a2,0x20
    800013fc:	02065613          	srli	a2,a2,0x20
    register uint64 a3 asm("a3") = arg3;
    80001400:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    80001404:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001408:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    8000140c:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001410:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001414:	00000073          	ecall
    return (int)doSyscall(SEM_OPEN,(uint64)handle,(uint64)init);
}
    80001418:	0005051b          	sext.w	a0,a0
    8000141c:	00813403          	ld	s0,8(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_Z9sem_closeP10KSemaphore>:

int sem_close(sem_t handle)
{
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00813423          	sd	s0,8(sp)
    80001430:	01010413          	addi	s0,sp,16
    80001434:	00050593          	mv	a1,a0
    register uint64 a0 asm("a0") = code;
    80001438:	02200513          	li	a0,34
    register uint64 a2 asm("a2") = arg2;
    8000143c:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001440:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    80001444:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001448:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    8000144c:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001450:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001454:	00000073          	ecall
    return (int)doSyscall(SEM_CLOSE,(uint64)handle);
}
    80001458:	0005051b          	sext.w	a0,a0
    8000145c:	00813403          	ld	s0,8(sp)
    80001460:	01010113          	addi	sp,sp,16
    80001464:	00008067          	ret

0000000080001468 <_Z8sem_waitP10KSemaphore>:

int sem_wait(sem_t handle)
{
    80001468:	ff010113          	addi	sp,sp,-16
    8000146c:	00813423          	sd	s0,8(sp)
    80001470:	01010413          	addi	s0,sp,16
    80001474:	00050593          	mv	a1,a0
    register uint64 a0 asm("a0") = code;
    80001478:	02300513          	li	a0,35
    register uint64 a2 asm("a2") = arg2;
    8000147c:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001480:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    80001484:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001488:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    8000148c:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001490:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001494:	00000073          	ecall
    return (int)doSyscall(SEM_WAIT,(uint64)handle);
}
    80001498:	0005051b          	sext.w	a0,a0
    8000149c:	00813403          	ld	s0,8(sp)
    800014a0:	01010113          	addi	sp,sp,16
    800014a4:	00008067          	ret

00000000800014a8 <_Z10sem_signalP10KSemaphore>:

int sem_signal(sem_t handle)
{
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00813423          	sd	s0,8(sp)
    800014b0:	01010413          	addi	s0,sp,16
    800014b4:	00050593          	mv	a1,a0
    register uint64 a0 asm("a0") = code;
    800014b8:	02400513          	li	a0,36
    register uint64 a2 asm("a2") = arg2;
    800014bc:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    800014c0:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    800014c4:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    800014c8:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    800014cc:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    800014d0:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    800014d4:	00000073          	ecall
    return (int)doSyscall(SEM_SIGNAL,(uint64)handle);
}
    800014d8:	0005051b          	sext.w	a0,a0
    800014dc:	00813403          	ld	s0,8(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z10sem_wait_nP10KSemaphorej>:

int sem_wait_n(sem_t handle, unsigned n)
{
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    800014f4:	00050793          	mv	a5,a0
    800014f8:	00058613          	mv	a2,a1
    register uint64 a0 asm("a0") = code;
    800014fc:	02500513          	li	a0,37
    register uint64 a1 asm("a1") = arg1;
    80001500:	00078593          	mv	a1,a5
    register uint64 a2 asm("a2") = arg2;
    80001504:	02061613          	slli	a2,a2,0x20
    80001508:	02065613          	srli	a2,a2,0x20
    register uint64 a3 asm("a3") = arg3;
    8000150c:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    80001510:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001514:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001518:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    8000151c:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001520:	00000073          	ecall
    return (int)doSyscall(SEM_WAIT_N,(uint64)handle,(uint64)n);
}
    80001524:	0005051b          	sext.w	a0,a0
    80001528:	00813403          	ld	s0,8(sp)
    8000152c:	01010113          	addi	sp,sp,16
    80001530:	00008067          	ret

0000000080001534 <_Z12sem_signal_nP10KSemaphorej>:

int sem_signal_n(sem_t handle, unsigned n)
{
    80001534:	ff010113          	addi	sp,sp,-16
    80001538:	00813423          	sd	s0,8(sp)
    8000153c:	01010413          	addi	s0,sp,16
    80001540:	00050793          	mv	a5,a0
    80001544:	00058613          	mv	a2,a1
    register uint64 a0 asm("a0") = code;
    80001548:	02600513          	li	a0,38
    register uint64 a1 asm("a1") = arg1;
    8000154c:	00078593          	mv	a1,a5
    register uint64 a2 asm("a2") = arg2;
    80001550:	02061613          	slli	a2,a2,0x20
    80001554:	02065613          	srli	a2,a2,0x20
    register uint64 a3 asm("a3") = arg3;
    80001558:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    8000155c:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    80001560:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    80001564:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    80001568:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    8000156c:	00000073          	ecall
    return (int)doSyscall(SEM_SIGNAL_N,(uint64)handle,(uint64)n);
}
    80001570:	0005051b          	sext.w	a0,a0
    80001574:	00813403          	ld	s0,8(sp)
    80001578:	01010113          	addi	sp,sp,16
    8000157c:	00008067          	ret

0000000080001580 <_Z4getcv>:

char getc()
{
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00813423          	sd	s0,8(sp)
    80001588:	01010413          	addi	s0,sp,16
    register uint64 a0 asm("a0") = code;
    8000158c:	04100513          	li	a0,65
    register uint64 a1 asm("a1") = arg1;
    80001590:	00000593          	li	a1,0
    register uint64 a2 asm("a2") = arg2;
    80001594:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    80001598:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    8000159c:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    800015a0:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    800015a4:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    800015a8:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    800015ac:	00000073          	ecall
    return (char)doSyscall(CONSOLE_GETC);
}
    800015b0:	0ff57513          	andi	a0,a0,255
    800015b4:	00813403          	ld	s0,8(sp)
    800015b8:	01010113          	addi	sp,sp,16
    800015bc:	00008067          	ret

00000000800015c0 <_Z4putcc>:

void putc(char c)
{
    800015c0:	ff010113          	addi	sp,sp,-16
    800015c4:	00813423          	sd	s0,8(sp)
    800015c8:	01010413          	addi	s0,sp,16
    800015cc:	00050593          	mv	a1,a0
    register uint64 a0 asm("a0") = code;
    800015d0:	04200513          	li	a0,66
    register uint64 a2 asm("a2") = arg2;
    800015d4:	00000613          	li	a2,0
    register uint64 a3 asm("a3") = arg3;
    800015d8:	00000693          	li	a3,0
    register uint64 a4 asm("a4") = arg4;
    800015dc:	00000713          	li	a4,0
    register uint64 a5 asm("a5") = arg5;
    800015e0:	00000793          	li	a5,0
    register uint64 a6 asm("a6") = arg6;
    800015e4:	00000813          	li	a6,0
    register uint64 a7 asm("a7") = arg7;
    800015e8:	00000893          	li	a7,0
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    800015ec:	00000073          	ecall
    doSyscall(CONSOLE_PUTC,(uint64)(unsigned char )c);
}
    800015f0:	00813403          	ld	s0,8(sp)
    800015f4:	01010113          	addi	sp,sp,16
    800015f8:	00008067          	ret

00000000800015fc <_Z4testiiiiiiii>:

int test(int a,int b,int c,int d,int e,int f,int h,int l) //ovo je testno treba da se sklanja
{
    800015fc:	ff010113          	addi	sp,sp,-16
    80001600:	00813423          	sd	s0,8(sp)
    80001604:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001608:	00000073          	ecall
    return (int) doSyscall(a,b,c,d,e,f,h,l);
}
    8000160c:	0005051b          	sext.w	a0,a0
    80001610:	00813403          	ld	s0,8(sp)
    80001614:	01010113          	addi	sp,sp,16
    80001618:	00008067          	ret

000000008000161c <_Z11raw_syscallmmmmmmmm>:

//za test brisati posle
uint64 raw_syscall(uint64 code,uint64 arg1,uint64 arg2,uint64 arg3,uint64 arg4,uint64 arg5,uint64 arg6,uint64 arg7)
{
    8000161c:	ff010113          	addi	sp,sp,-16
    80001620:	00813423          	sd	s0,8(sp)
    80001624:	01010413          	addi	s0,sp,16
    __asm__ volatile("ecall":"+r"(a0):"r"(a1),"r"(a2),"r"(a3),"r"(a4),"r"(a5),"r"(a6),"r"(a7):"memory");
    80001628:	00000073          	ecall
    return doSyscall(code,arg1,arg2,arg3,arg4,arg5,arg6,arg7);
}
    8000162c:	00813403          	ld	s0,8(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00008067          	ret

0000000080001638 <_ZL15findFirstSetBitm>:
        if(userStack!= nullptr) MemAllocator::mem_free(userStack);
    }
}

static uint64 findFirstSetBit(uint64 value)
{
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00813423          	sd	s0,8(sp)
    80001640:	01010413          	addi	s0,sp,16
    80001644:	00050793          	mv	a5,a0
    uint64 index = 0;
    80001648:	00000513          	li	a0,0
    while ((value&1)==0)
    8000164c:	0017f713          	andi	a4,a5,1
    80001650:	00071863          	bnez	a4,80001660 <_ZL15findFirstSetBitm+0x28>
    {
        value>>=1;
    80001654:	0017d793          	srli	a5,a5,0x1
        index++;
    80001658:	00150513          	addi	a0,a0,1 # 1001 <_entry-0x7fffefff>
    while ((value&1)==0)
    8000165c:	ff1ff06f          	j	8000164c <_ZL15findFirstSetBitm+0x14>
    }
    return index;
}
    80001660:	00813403          	ld	s0,8(sp)
    80001664:	01010113          	addi	sp,sp,16
    80001668:	00008067          	ret

000000008000166c <_ZL11alignDown16m>:
    }
    return count;
}

static uint64 alignDown16(uint64 address)
{
    8000166c:	ff010113          	addi	sp,sp,-16
    80001670:	00813423          	sd	s0,8(sp)
    80001674:	01010413          	addi	s0,sp,16
    return address & ~((uint64)0xF);
}
    80001678:	ff057513          	andi	a0,a0,-16
    8000167c:	00813403          	ld	s0,8(sp)
    80001680:	01010113          	addi	sp,sp,16
    80001684:	00008067          	ret

0000000080001688 <_ZL18clearThreadContextP13ThreadContext>:

static void clearThreadContext(ThreadContext* context)
{
    80001688:	ff010113          	addi	sp,sp,-16
    8000168c:	00813423          	sd	s0,8(sp)
    80001690:	01010413          	addi	s0,sp,16
    uint64* values = (uint64*)context;

    for (size_t i = 0;
    80001694:	00000793          	li	a5,0
         i < sizeof(ThreadContext) / sizeof(uint64);
    80001698:	01f00713          	li	a4,31
    8000169c:	00f76c63          	bltu	a4,a5,800016b4 <_ZL18clearThreadContextP13ThreadContext+0x2c>
         i++)
    {
        values[i] = 0;
    800016a0:	00379713          	slli	a4,a5,0x3
    800016a4:	00e50733          	add	a4,a0,a4
    800016a8:	00073023          	sd	zero,0(a4) # 1000 <_entry-0x7ffff000>
    for (size_t i = 0;
    800016ac:	00178793          	addi	a5,a5,1
    800016b0:	fe9ff06f          	j	80001698 <_ZL18clearThreadContextP13ThreadContext+0x10>
    }
}
    800016b4:	00813403          	ld	s0,8(sp)
    800016b8:	01010113          	addi	sp,sp,16
    800016bc:	00008067          	ret

00000000800016c0 <_ZL11clearMemoryPvm>:

    return 0;
}

static void clearMemory(void* address, size_t size)
{
    800016c0:	ff010113          	addi	sp,sp,-16
    800016c4:	00813423          	sd	s0,8(sp)
    800016c8:	01010413          	addi	s0,sp,16
    uint8* bytes = (uint8*)address;
    for (size_t i=0;i<size;i++)
    800016cc:	00000793          	li	a5,0
    800016d0:	00b7fa63          	bgeu	a5,a1,800016e4 <_ZL11clearMemoryPvm+0x24>
    {
        bytes[i] = 0;
    800016d4:	00f50733          	add	a4,a0,a5
    800016d8:	00070023          	sb	zero,0(a4)
    for (size_t i=0;i<size;i++)
    800016dc:	00178793          	addi	a5,a5,1
    800016e0:	ff1ff06f          	j	800016d0 <_ZL11clearMemoryPvm+0x10>
    }
}
    800016e4:	00813403          	ld	s0,8(sp)
    800016e8:	01010113          	addi	sp,sp,16
    800016ec:	00008067          	ret

00000000800016f0 <threadWrapper>:
        __asm__ volatile("nop");
    }
}

void threadWrapper(KThread::Body body,void *arg)
{
    800016f0:	ff010113          	addi	sp,sp,-16
    800016f4:	00113423          	sd	ra,8(sp)
    800016f8:	00813023          	sd	s0,0(sp)
    800016fc:	01010413          	addi	s0,sp,16
    80001700:	00050793          	mv	a5,a0
    if (body!=nullptr) body(arg);
    80001704:	00050663          	beqz	a0,80001710 <threadWrapper+0x20>
    80001708:	00058513          	mv	a0,a1
    8000170c:	000780e7          	jalr	a5
        next->status = Thread::RUNNING;

        yield(finished,next);
    }*/

    thread_exit();
    80001710:	00000097          	auipc	ra,0x0
    80001714:	c50080e7          	jalr	-944(ra) # 80001360 <_Z11thread_exitv>

    while (true)
    {
        __asm__ volatile("nop");//ovo ce brisemo
    80001718:	00000013          	nop
    while (true)
    8000171c:	ffdff06f          	j	80001718 <threadWrapper+0x28>

0000000080001720 <_ZN7KThreadC1Ev>:
KThread::KThread():sp(nullptr),body(nullptr),arg(nullptr),next(nullptr),status(FINISHED),waitNext(nullptr),waitUnits(0),waitResult(0),kernelStack(nullptr),userStack(nullptr){}
    80001720:	ff010113          	addi	sp,sp,-16
    80001724:	00813423          	sd	s0,8(sp)
    80001728:	01010413          	addi	s0,sp,16
    8000172c:	00053023          	sd	zero,0(a0)
    80001730:	00053423          	sd	zero,8(a0)
    80001734:	00053823          	sd	zero,16(a0)
    80001738:	00053c23          	sd	zero,24(a0)
    8000173c:	00200793          	li	a5,2
    80001740:	02f52023          	sw	a5,32(a0)
    80001744:	02053423          	sd	zero,40(a0)
    80001748:	02052823          	sw	zero,48(a0)
    8000174c:	02052a23          	sw	zero,52(a0)
    80001750:	02053c23          	sd	zero,56(a0)
    80001754:	04053023          	sd	zero,64(a0)
    80001758:	00813403          	ld	s0,8(sp)
    8000175c:	01010113          	addi	sp,sp,16
    80001760:	00008067          	ret

0000000080001764 <_Z41__static_initialization_and_destruction_0ii>:
    }
    80001764:	00100793          	li	a5,1
    80001768:	00f50463          	beq	a0,a5,80001770 <_Z41__static_initialization_and_destruction_0ii+0xc>
    8000176c:	00008067          	ret
    80001770:	000107b7          	lui	a5,0x10
    80001774:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001778:	fef59ae3          	bne	a1,a5,8000176c <_Z41__static_initialization_and_destruction_0ii+0x8>
    8000177c:	fe010113          	addi	sp,sp,-32
    80001780:	00113c23          	sd	ra,24(sp)
    80001784:	00813823          	sd	s0,16(sp)
    80001788:	00913423          	sd	s1,8(sp)
    8000178c:	01213023          	sd	s2,0(sp)
    80001790:	02010413          	addi	s0,sp,32
alignas(16) KThread KThread::threadPool[KThread::MAX_THREADS];
    80001794:	03f00493          	li	s1,63
    80001798:	0000a917          	auipc	s2,0xa
    8000179c:	30890913          	addi	s2,s2,776 # 8000baa0 <_ZN7KThread10threadPoolE>
    800017a0:	0004ce63          	bltz	s1,800017bc <_Z41__static_initialization_and_destruction_0ii+0x58>
    800017a4:	00090513          	mv	a0,s2
    800017a8:	00000097          	auipc	ra,0x0
    800017ac:	f78080e7          	jalr	-136(ra) # 80001720 <_ZN7KThreadC1Ev>
    800017b0:	04890913          	addi	s2,s2,72
    800017b4:	fff48493          	addi	s1,s1,-1
    800017b8:	fe9ff06f          	j	800017a0 <_Z41__static_initialization_and_destruction_0ii+0x3c>
    800017bc:	01813083          	ld	ra,24(sp)
    800017c0:	01013403          	ld	s0,16(sp)
    800017c4:	00813483          	ld	s1,8(sp)
    800017c8:	00013903          	ld	s2,0(sp)
    800017cc:	02010113          	addi	sp,sp,32
    800017d0:	00008067          	ret

00000000800017d4 <_ZN7KThread12deferCleanupEPS_>:
{
    800017d4:	ff010113          	addi	sp,sp,-16
    800017d8:	00813423          	sd	s0,8(sp)
    800017dc:	01010413          	addi	s0,sp,16
    if(thread == nullptr) return;
    800017e0:	02050063          	beqz	a0,80001800 <_ZN7KThread12deferCleanupEPS_+0x2c>
    thread->next = nullptr;
    800017e4:	00053c23          	sd	zero,24(a0)
    if(cleanupTail==nullptr)
    800017e8:	0000a797          	auipc	a5,0xa
    800017ec:	2987b783          	ld	a5,664(a5) # 8000ba80 <_ZN7KThread11cleanupTailE>
    800017f0:	00078e63          	beqz	a5,8000180c <_ZN7KThread12deferCleanupEPS_+0x38>
    cleanupTail->next = thread;
    800017f4:	00a7bc23          	sd	a0,24(a5)
    cleanupTail=thread;
    800017f8:	0000a797          	auipc	a5,0xa
    800017fc:	28a7b423          	sd	a0,648(a5) # 8000ba80 <_ZN7KThread11cleanupTailE>
}
    80001800:	00813403          	ld	s0,8(sp)
    80001804:	01010113          	addi	sp,sp,16
    80001808:	00008067          	ret
        cleanupHead=thread;
    8000180c:	0000a797          	auipc	a5,0xa
    80001810:	27478793          	addi	a5,a5,628 # 8000ba80 <_ZN7KThread11cleanupTailE>
    80001814:	00a7b423          	sd	a0,8(a5)
        cleanupTail=thread;
    80001818:	00a7b023          	sd	a0,0(a5)
        return;
    8000181c:	fe5ff06f          	j	80001800 <_ZN7KThread12deferCleanupEPS_+0x2c>

0000000080001820 <_ZN7KThread5resetEv>:
{
    80001820:	ff010113          	addi	sp,sp,-16
    80001824:	00813423          	sd	s0,8(sp)
    80001828:	01010413          	addi	s0,sp,16
    sp=nullptr;
    8000182c:	00053023          	sd	zero,0(a0)
    body =nullptr;
    80001830:	00053423          	sd	zero,8(a0)
    arg = nullptr;
    80001834:	00053823          	sd	zero,16(a0)
    next=nullptr;
    80001838:	00053c23          	sd	zero,24(a0)
    waitNext = nullptr;
    8000183c:	02053423          	sd	zero,40(a0)
    waitUnits = 0;
    80001840:	02052823          	sw	zero,48(a0)
    waitResult = 0;
    80001844:	02052a23          	sw	zero,52(a0)
    status = FINISHED;
    80001848:	00200793          	li	a5,2
    8000184c:	02f52023          	sw	a5,32(a0)
    kernelStack = nullptr;
    80001850:	02053c23          	sd	zero,56(a0)
    userStack = nullptr;
    80001854:	04053023          	sd	zero,64(a0)
}
    80001858:	00813403          	ld	s0,8(sp)
    8000185c:	01010113          	addi	sp,sp,16
    80001860:	00008067          	ret

0000000080001864 <_ZN7KThread8allocateEPFvPvES0_>:
{
    80001864:	fd010113          	addi	sp,sp,-48
    80001868:	02113423          	sd	ra,40(sp)
    8000186c:	02813023          	sd	s0,32(sp)
    80001870:	00913c23          	sd	s1,24(sp)
    80001874:	01213823          	sd	s2,16(sp)
    80001878:	01313423          	sd	s3,8(sp)
    8000187c:	03010413          	addi	s0,sp,48
    if (usedBitmap == ~(uint64)0)
    80001880:	0000a497          	auipc	s1,0xa
    80001884:	2104b483          	ld	s1,528(s1) # 8000ba90 <_ZN7KThread10usedBitmapE>
    80001888:	fff00793          	li	a5,-1
    8000188c:	08f48463          	beq	s1,a5,80001914 <_ZN7KThread8allocateEPFvPvES0_+0xb0>
    80001890:	00050993          	mv	s3,a0
    80001894:	00058913          	mv	s2,a1
    uint64 index = findFirstSetBit(freeSlots);
    80001898:	fff4c513          	not	a0,s1
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	d9c080e7          	jalr	-612(ra) # 80001638 <_ZL15findFirstSetBitm>
    usedBitmap |= ((uint64)1 << index);
    800018a4:	00100793          	li	a5,1
    800018a8:	00a797b3          	sll	a5,a5,a0
    800018ac:	00f4e4b3          	or	s1,s1,a5
    800018b0:	0000a797          	auipc	a5,0xa
    800018b4:	1e97b023          	sd	s1,480(a5) # 8000ba90 <_ZN7KThread10usedBitmapE>
    KThread* thread = &threadPool[index];
    800018b8:	00351713          	slli	a4,a0,0x3
    800018bc:	00a707b3          	add	a5,a4,a0
    800018c0:	00379793          	slli	a5,a5,0x3
    800018c4:	0000a617          	auipc	a2,0xa
    800018c8:	1dc60613          	addi	a2,a2,476 # 8000baa0 <_ZN7KThread10threadPoolE>
    800018cc:	00c78533          	add	a0,a5,a2
    thread->sp = nullptr;
    800018d0:	00053023          	sd	zero,0(a0)
    thread->body = body;
    800018d4:	01353423          	sd	s3,8(a0)
    thread->arg = arg;
    800018d8:	01253823          	sd	s2,16(a0)
    thread->next = nullptr;
    800018dc:	00053c23          	sd	zero,24(a0)
    thread->status = READY;
    800018e0:	02052023          	sw	zero,32(a0)
    thread->kernelStack=nullptr;
    800018e4:	02053c23          	sd	zero,56(a0)
    thread->userStack=nullptr;
    800018e8:	04053023          	sd	zero,64(a0)
    thread->waitNext = nullptr;
    800018ec:	02053423          	sd	zero,40(a0)
    thread->waitUnits = 0;
    800018f0:	02052823          	sw	zero,48(a0)
    thread->waitResult = 0;
    800018f4:	02052a23          	sw	zero,52(a0)
}
    800018f8:	02813083          	ld	ra,40(sp)
    800018fc:	02013403          	ld	s0,32(sp)
    80001900:	01813483          	ld	s1,24(sp)
    80001904:	01013903          	ld	s2,16(sp)
    80001908:	00813983          	ld	s3,8(sp)
    8000190c:	03010113          	addi	sp,sp,48
    80001910:	00008067          	ret
        return nullptr;
    80001914:	00000513          	li	a0,0
    80001918:	fe1ff06f          	j	800018f8 <_ZN7KThread8allocateEPFvPvES0_+0x94>

000000008000191c <_ZN7KThread7releaseEPS_>:
    if (thread==nullptr)
    8000191c:	08050e63          	beqz	a0,800019b8 <_ZN7KThread7releaseEPS_+0x9c>
    if (thread<&threadPool[0] || thread>= &threadPool[MAX_THREADS])
    80001920:	0000a797          	auipc	a5,0xa
    80001924:	18078793          	addi	a5,a5,384 # 8000baa0 <_ZN7KThread10threadPoolE>
    80001928:	08f56c63          	bltu	a0,a5,800019c0 <_ZN7KThread7releaseEPS_+0xa4>
    8000192c:	0000b797          	auipc	a5,0xb
    80001930:	37478793          	addi	a5,a5,884 # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80001934:	08f57a63          	bgeu	a0,a5,800019c8 <_ZN7KThread7releaseEPS_+0xac>
{
    80001938:	fe010113          	addi	sp,sp,-32
    8000193c:	00113c23          	sd	ra,24(sp)
    80001940:	00813823          	sd	s0,16(sp)
    80001944:	00913423          	sd	s1,8(sp)
    80001948:	02010413          	addi	s0,sp,32
    uint64 index = (uint64)(thread-threadPool);
    8000194c:	0000a797          	auipc	a5,0xa
    80001950:	15478793          	addi	a5,a5,340 # 8000baa0 <_ZN7KThread10threadPoolE>
    80001954:	40f507b3          	sub	a5,a0,a5
    80001958:	4037d793          	srai	a5,a5,0x3
    uint64 bit = ((uint64)1<<index);
    8000195c:	00007717          	auipc	a4,0x7
    80001960:	6c473703          	ld	a4,1732(a4) # 80009020 <CONSOLE_STATUS+0x10>
    80001964:	02e787bb          	mulw	a5,a5,a4
    80001968:	00100493          	li	s1,1
    8000196c:	00f494b3          	sll	s1,s1,a5
    if ((usedBitmap & bit)==0)
    80001970:	0000a797          	auipc	a5,0xa
    80001974:	1207b783          	ld	a5,288(a5) # 8000ba90 <_ZN7KThread10usedBitmapE>
    80001978:	00f4f7b3          	and	a5,s1,a5
    8000197c:	04078a63          	beqz	a5,800019d0 <_ZN7KThread7releaseEPS_+0xb4>
    thread->reset();
    80001980:	00000097          	auipc	ra,0x0
    80001984:	ea0080e7          	jalr	-352(ra) # 80001820 <_ZN7KThread5resetEv>
    usedBitmap &= ~bit;
    80001988:	fff4c793          	not	a5,s1
    8000198c:	0000a717          	auipc	a4,0xa
    80001990:	0f470713          	addi	a4,a4,244 # 8000ba80 <_ZN7KThread11cleanupTailE>
    80001994:	01073483          	ld	s1,16(a4)
    80001998:	00f4f7b3          	and	a5,s1,a5
    8000199c:	00f73823          	sd	a5,16(a4)
    return 0;
    800019a0:	00000513          	li	a0,0
}
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	01013403          	ld	s0,16(sp)
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	02010113          	addi	sp,sp,32
    800019b4:	00008067          	ret
        return -1;
    800019b8:	fff00513          	li	a0,-1
    800019bc:	00008067          	ret
        return -2;
    800019c0:	ffe00513          	li	a0,-2
    800019c4:	00008067          	ret
    800019c8:	ffe00513          	li	a0,-2
}
    800019cc:	00008067          	ret
        return -3;
    800019d0:	ffd00513          	li	a0,-3
    800019d4:	fd1ff06f          	j	800019a4 <_ZN7KThread7releaseEPS_+0x88>

00000000800019d8 <_ZN7KThread22cleanupFinishedthreadsEv>:
    while(cleanupHead!= nullptr)
    800019d8:	0000a517          	auipc	a0,0xa
    800019dc:	0b053503          	ld	a0,176(a0) # 8000ba88 <_ZN7KThread11cleanupHeadE>
    800019e0:	0a050263          	beqz	a0,80001a84 <_ZN7KThread22cleanupFinishedthreadsEv+0xac>
{
    800019e4:	fe010113          	addi	sp,sp,-32
    800019e8:	00113c23          	sd	ra,24(sp)
    800019ec:	00813823          	sd	s0,16(sp)
    800019f0:	00913423          	sd	s1,8(sp)
    800019f4:	01213023          	sd	s2,0(sp)
    800019f8:	02010413          	addi	s0,sp,32
    800019fc:	02c0006f          	j	80001a28 <_ZN7KThread22cleanupFinishedthreadsEv+0x50>
        if(cleanupHead== nullptr) cleanupTail= nullptr;
    80001a00:	0000a797          	auipc	a5,0xa
    80001a04:	0807b023          	sd	zero,128(a5) # 8000ba80 <_ZN7KThread11cleanupTailE>
    80001a08:	0300006f          	j	80001a38 <_ZN7KThread22cleanupFinishedthreadsEv+0x60>
        if(kernelStack!=nullptr) MemAllocator::mem_free(kernelStack);
    80001a0c:	00048513          	mv	a0,s1
    80001a10:	00001097          	auipc	ra,0x1
    80001a14:	a64080e7          	jalr	-1436(ra) # 80002474 <_ZN12MemAllocator8mem_freeEPv>
        if(userStack!= nullptr) MemAllocator::mem_free(userStack);
    80001a18:	04091263          	bnez	s2,80001a5c <_ZN7KThread22cleanupFinishedthreadsEv+0x84>
    while(cleanupHead!= nullptr)
    80001a1c:	0000a517          	auipc	a0,0xa
    80001a20:	06c53503          	ld	a0,108(a0) # 8000ba88 <_ZN7KThread11cleanupHeadE>
    80001a24:	04050463          	beqz	a0,80001a6c <_ZN7KThread22cleanupFinishedthreadsEv+0x94>
        cleanupHead = cleanupHead->next;
    80001a28:	01853783          	ld	a5,24(a0)
    80001a2c:	0000a717          	auipc	a4,0xa
    80001a30:	04f73e23          	sd	a5,92(a4) # 8000ba88 <_ZN7KThread11cleanupHeadE>
        if(cleanupHead== nullptr) cleanupTail= nullptr;
    80001a34:	fc0786e3          	beqz	a5,80001a00 <_ZN7KThread22cleanupFinishedthreadsEv+0x28>
        void* kernelStack = victim->kernelStack;
    80001a38:	03853483          	ld	s1,56(a0)
        void* userStack = victim->userStack;
    80001a3c:	04053903          	ld	s2,64(a0)
        victim->kernelStack = nullptr;
    80001a40:	02053c23          	sd	zero,56(a0)
        victim->userStack = nullptr;
    80001a44:	04053023          	sd	zero,64(a0)
        victim->next = nullptr;
    80001a48:	00053c23          	sd	zero,24(a0)
        KThread::release(victim);
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	ed0080e7          	jalr	-304(ra) # 8000191c <_ZN7KThread7releaseEPS_>
        if(kernelStack!=nullptr) MemAllocator::mem_free(kernelStack);
    80001a54:	fa049ce3          	bnez	s1,80001a0c <_ZN7KThread22cleanupFinishedthreadsEv+0x34>
    80001a58:	fc1ff06f          	j	80001a18 <_ZN7KThread22cleanupFinishedthreadsEv+0x40>
        if(userStack!= nullptr) MemAllocator::mem_free(userStack);
    80001a5c:	00090513          	mv	a0,s2
    80001a60:	00001097          	auipc	ra,0x1
    80001a64:	a14080e7          	jalr	-1516(ra) # 80002474 <_ZN12MemAllocator8mem_freeEPv>
    80001a68:	fb5ff06f          	j	80001a1c <_ZN7KThread22cleanupFinishedthreadsEv+0x44>
}
    80001a6c:	01813083          	ld	ra,24(sp)
    80001a70:	01013403          	ld	s0,16(sp)
    80001a74:	00813483          	ld	s1,8(sp)
    80001a78:	00013903          	ld	s2,0(sp)
    80001a7c:	02010113          	addi	sp,sp,32
    80001a80:	00008067          	ret
    80001a84:	00008067          	ret

0000000080001a88 <_ZN7KThread11isAllocatedEPKS_>:
{
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00813423          	sd	s0,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    if (thread==nullptr)
    80001a94:	04050e63          	beqz	a0,80001af0 <_ZN7KThread11isAllocatedEPKS_+0x68>
    if (thread<&threadPool[0] || thread>= &threadPool[MAX_THREADS])
    80001a98:	0000a797          	auipc	a5,0xa
    80001a9c:	00878793          	addi	a5,a5,8 # 8000baa0 <_ZN7KThread10threadPoolE>
    80001aa0:	04f56c63          	bltu	a0,a5,80001af8 <_ZN7KThread11isAllocatedEPKS_+0x70>
    80001aa4:	0000b797          	auipc	a5,0xb
    80001aa8:	1fc78793          	addi	a5,a5,508 # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80001aac:	04f57a63          	bgeu	a0,a5,80001b00 <_ZN7KThread11isAllocatedEPKS_+0x78>
    uint64 index = (uint64)(thread-threadPool);
    80001ab0:	0000a797          	auipc	a5,0xa
    80001ab4:	ff078793          	addi	a5,a5,-16 # 8000baa0 <_ZN7KThread10threadPoolE>
    80001ab8:	40f50533          	sub	a0,a0,a5
    80001abc:	40355513          	srai	a0,a0,0x3
    uint64 bit = ((uint64)1<<index);
    80001ac0:	00007797          	auipc	a5,0x7
    80001ac4:	5607b783          	ld	a5,1376(a5) # 80009020 <CONSOLE_STATUS+0x10>
    80001ac8:	02f5053b          	mulw	a0,a0,a5
    80001acc:	00100793          	li	a5,1
    80001ad0:	00a79533          	sll	a0,a5,a0
    return (usedBitmap & bit) !=0;
    80001ad4:	0000a797          	auipc	a5,0xa
    80001ad8:	fbc7b783          	ld	a5,-68(a5) # 8000ba90 <_ZN7KThread10usedBitmapE>
    80001adc:	00f57533          	and	a0,a0,a5
    80001ae0:	00a03533          	snez	a0,a0
}
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret
        return false;
    80001af0:	00000513          	li	a0,0
    80001af4:	ff1ff06f          	j	80001ae4 <_ZN7KThread11isAllocatedEPKS_+0x5c>
        return false;
    80001af8:	00000513          	li	a0,0
    80001afc:	fe9ff06f          	j	80001ae4 <_ZN7KThread11isAllocatedEPKS_+0x5c>
    80001b00:	00000513          	li	a0,0
    80001b04:	fe1ff06f          	j	80001ae4 <_ZN7KThread11isAllocatedEPKS_+0x5c>

0000000080001b08 <_ZN7KThread13getUsedBitmapEv>:
{
    80001b08:	ff010113          	addi	sp,sp,-16
    80001b0c:	00813423          	sd	s0,8(sp)
    80001b10:	01010413          	addi	s0,sp,16
}
    80001b14:	0000a517          	auipc	a0,0xa
    80001b18:	f7c53503          	ld	a0,-132(a0) # 8000ba90 <_ZN7KThread10usedBitmapE>
    80001b1c:	00813403          	ld	s0,8(sp)
    80001b20:	01010113          	addi	sp,sp,16
    80001b24:	00008067          	ret

0000000080001b28 <_ZN7KThread17getAllocatedCountEv>:
{
    80001b28:	ff010113          	addi	sp,sp,-16
    80001b2c:	00813423          	sd	s0,8(sp)
    80001b30:	01010413          	addi	s0,sp,16
    uint64 bitmap = usedBitmap;
    80001b34:	0000a797          	auipc	a5,0xa
    80001b38:	f5c7b783          	ld	a5,-164(a5) # 8000ba90 <_ZN7KThread10usedBitmapE>
    uint64 count = 0;
    80001b3c:	00000513          	li	a0,0
    while (bitmap!=0)
    80001b40:	00078a63          	beqz	a5,80001b54 <_ZN7KThread17getAllocatedCountEv+0x2c>
        bitmap &=bitmap-1;
    80001b44:	fff78713          	addi	a4,a5,-1
    80001b48:	00e7f7b3          	and	a5,a5,a4
        count++;
    80001b4c:	00150513          	addi	a0,a0,1
    while (bitmap!=0)
    80001b50:	ff1ff06f          	j	80001b40 <_ZN7KThread17getAllocatedCountEv+0x18>
}
    80001b54:	00813403          	ld	s0,8(sp)
    80001b58:	01010113          	addi	sp,sp,16
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN7KThread17initializeContextEPS_Pv>:
    if (thread == nullptr || kernelStackAddress == nullptr)
    80001b60:	0a050c63          	beqz	a0,80001c18 <_ZN7KThread17initializeContextEPS_Pv+0xb8>
{
    80001b64:	fd010113          	addi	sp,sp,-48
    80001b68:	02113423          	sd	ra,40(sp)
    80001b6c:	02813023          	sd	s0,32(sp)
    80001b70:	00913c23          	sd	s1,24(sp)
    80001b74:	01213823          	sd	s2,16(sp)
    80001b78:	01313423          	sd	s3,8(sp)
    80001b7c:	03010413          	addi	s0,sp,48
    80001b80:	00050493          	mv	s1,a0
    if (thread == nullptr || kernelStackAddress == nullptr)
    80001b84:	08058e63          	beqz	a1,80001c20 <_ZN7KThread17initializeContextEPS_Pv+0xc0>
    thread->kernelStack = kernelStackAddress;
    80001b88:	02b53c23          	sd	a1,56(a0)
    thread->userStack = nullptr;
    80001b8c:	04053023          	sd	zero,64(a0)
    stackTop = alignDown16(stackTop);
    80001b90:	00001537          	lui	a0,0x1
    80001b94:	00a58533          	add	a0,a1,a0
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	ad4080e7          	jalr	-1324(ra) # 8000166c <_ZL11alignDown16m>
    80001ba0:	00050993          	mv	s3,a0
    stackTop -= sizeof(ThreadContext);
    80001ba4:	f0050913          	addi	s2,a0,-256 # f00 <_entry-0x7ffff100>
    clearThreadContext(context);
    80001ba8:	00090513          	mv	a0,s2
    80001bac:	00000097          	auipc	ra,0x0
    80001bb0:	adc080e7          	jalr	-1316(ra) # 80001688 <_ZL18clearThreadContextP13ThreadContext>
    );
    80001bb4:	00018693          	mv	a3,gp
    );
    80001bb8:	00020713          	mv	a4,tp
    );
    80001bbc:	100027f3          	csrr	a5,sstatus
    context->gp = currentGp;
    80001bc0:	00d93423          	sd	a3,8(s2)
    context->tp = currentTp;
    80001bc4:	00e93823          	sd	a4,16(s2)
    context->ra = (uint64)&threadWrapper;
    80001bc8:	00000717          	auipc	a4,0x0
    80001bcc:	b2870713          	addi	a4,a4,-1240 # 800016f0 <threadWrapper>
    80001bd0:	f0e9b023          	sd	a4,-256(s3)
    context->sepc = (uint64)&threadWrapper;
    80001bd4:	0ee93823          	sd	a4,240(s2)
        currentSstatus | SSTATUS_SPP;
    80001bd8:	1007e793          	ori	a5,a5,256
    context->sstatus =
    80001bdc:	0ef93c23          	sd	a5,248(s2)
    context->a0 = (uint64)thread->body;
    80001be0:	0084b783          	ld	a5,8(s1)
    80001be4:	04f93823          	sd	a5,80(s2)
    context->a1 = (uint64)thread->arg;
    80001be8:	0104b783          	ld	a5,16(s1)
    80001bec:	04f93c23          	sd	a5,88(s2)
    thread->sp = (uint64*)context;
    80001bf0:	0124b023          	sd	s2,0(s1)
    thread->status = READY;
    80001bf4:	0204a023          	sw	zero,32(s1)
    return 0;
    80001bf8:	00000513          	li	a0,0
}
    80001bfc:	02813083          	ld	ra,40(sp)
    80001c00:	02013403          	ld	s0,32(sp)
    80001c04:	01813483          	ld	s1,24(sp)
    80001c08:	01013903          	ld	s2,16(sp)
    80001c0c:	00813983          	ld	s3,8(sp)
    80001c10:	03010113          	addi	sp,sp,48
    80001c14:	00008067          	ret
        return -1;
    80001c18:	fff00513          	li	a0,-1
}
    80001c1c:	00008067          	ret
        return -1;
    80001c20:	fff00513          	li	a0,-1
    80001c24:	fd9ff06f          	j	80001bfc <_ZN7KThread17initializeContextEPS_Pv+0x9c>

0000000080001c28 <_ZN7KThread21initializeUserContextEPS_>:
    if (thread==nullptr || thread->kernelStack==nullptr || thread->userStack==nullptr || thread->body == nullptr)
    80001c28:	10050463          	beqz	a0,80001d30 <_ZN7KThread21initializeUserContextEPS_+0x108>
{
    80001c2c:	fd010113          	addi	sp,sp,-48
    80001c30:	02113423          	sd	ra,40(sp)
    80001c34:	02813023          	sd	s0,32(sp)
    80001c38:	00913c23          	sd	s1,24(sp)
    80001c3c:	01213823          	sd	s2,16(sp)
    80001c40:	01313423          	sd	s3,8(sp)
    80001c44:	01413023          	sd	s4,0(sp)
    80001c48:	03010413          	addi	s0,sp,48
    80001c4c:	00050493          	mv	s1,a0
    if (thread==nullptr || thread->kernelStack==nullptr || thread->userStack==nullptr || thread->body == nullptr)
    80001c50:	03853503          	ld	a0,56(a0)
    80001c54:	0e050263          	beqz	a0,80001d38 <_ZN7KThread21initializeUserContextEPS_+0x110>
    80001c58:	0404b783          	ld	a5,64(s1)
    80001c5c:	0e078263          	beqz	a5,80001d40 <_ZN7KThread21initializeUserContextEPS_+0x118>
    80001c60:	0084b783          	ld	a5,8(s1)
    80001c64:	0e078263          	beqz	a5,80001d48 <_ZN7KThread21initializeUserContextEPS_+0x120>
    uint64 kernelTop = (uint64)thread->kernelStack+DEFAULT_STACK_SIZE;
    80001c68:	00001a37          	lui	s4,0x1
    kernelTop = alignDown16(kernelTop);
    80001c6c:	01450533          	add	a0,a0,s4
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	9fc080e7          	jalr	-1540(ra) # 8000166c <_ZL11alignDown16m>
    80001c78:	00050993          	mv	s3,a0
    kernelTop -= sizeof(TrapFrame);
    80001c7c:	f6050913          	addi	s2,a0,-160
    clearMemory(trapFrame,sizeof(TrapFrame));
    80001c80:	0a000593          	li	a1,160
    80001c84:	00090513          	mv	a0,s2
    80001c88:	00000097          	auipc	ra,0x0
    80001c8c:	a38080e7          	jalr	-1480(ra) # 800016c0 <_ZL11clearMemoryPvm>
    uint64 userTop = (uint64)thread->userStack+DEFAULT_STACK_SIZE;
    80001c90:	0404b503          	ld	a0,64(s1)
    userTop = alignDown16(userTop);
    80001c94:	01450533          	add	a0,a0,s4
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	9d4080e7          	jalr	-1580(ra) # 8000166c <_ZL11alignDown16m>
    trapFrame->sepc = (uint64)&threadWrapper;
    80001ca0:	00000797          	auipc	a5,0x0
    80001ca4:	a5078793          	addi	a5,a5,-1456 # 800016f0 <threadWrapper>
    80001ca8:	08f93023          	sd	a5,128(s2)
    __asm__ volatile("csrr %0, sstatus": "=r"(currentSstatus));
    80001cac:	10002a73          	csrr	s4,sstatus
    trapFrame->sstatus = currentSstatus& ~SSTATUS_SPP;
    80001cb0:	effa7793          	andi	a5,s4,-257
    80001cb4:	08f93423          	sd	a5,136(s2)
    trapFrame->a0 = (uint64)thread->body;
    80001cb8:	0084b783          	ld	a5,8(s1)
    80001cbc:	00f93423          	sd	a5,8(s2)
    trapFrame->a1 = (uint64)thread->arg;
    80001cc0:	0104b783          	ld	a5,16(s1)
    80001cc4:	00f93823          	sd	a5,16(s2)
    trapFrame->userSp=userTop;
    80001cc8:	08a93823          	sd	a0,144(s2)
    kernelTop -=sizeof(ThreadContext);
    80001ccc:	e6098913          	addi	s2,s3,-416
    clearMemory(context,sizeof(ThreadContext));
    80001cd0:	10000593          	li	a1,256
    80001cd4:	00090513          	mv	a0,s2
    80001cd8:	00000097          	auipc	ra,0x0
    80001cdc:	9e8080e7          	jalr	-1560(ra) # 800016c0 <_ZL11clearMemoryPvm>
    __asm__ volatile("mv %0, gp":"=r"(currentGp));
    80001ce0:	00018713          	mv	a4,gp
    __asm__ volatile("mv %0, tp":"=r"(currentTp));
    80001ce4:	00020793          	mv	a5,tp
    context->gp = currentGp;
    80001ce8:	00e93423          	sd	a4,8(s2)
    context->tp = currentTp;
    80001cec:	00f93823          	sd	a5,16(s2)
    context->ra = (uint64)&returnFromTrap;
    80001cf0:	0000a797          	auipc	a5,0xa
    80001cf4:	d107b783          	ld	a5,-752(a5) # 8000ba00 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001cf8:	e6f9b023          	sd	a5,-416(s3)
    context->sepc = (uint64)&returnFromTrap;
    80001cfc:	0ef93823          	sd	a5,240(s2)
    context->sstatus = currentSstatus;
    80001d00:	0f493c23          	sd	s4,248(s2)
    thread->sp = (uint64*)context;
    80001d04:	0124b023          	sd	s2,0(s1)
    thread->status = READY;
    80001d08:	0204a023          	sw	zero,32(s1)
    return 0;
    80001d0c:	00000513          	li	a0,0
}
    80001d10:	02813083          	ld	ra,40(sp)
    80001d14:	02013403          	ld	s0,32(sp)
    80001d18:	01813483          	ld	s1,24(sp)
    80001d1c:	01013903          	ld	s2,16(sp)
    80001d20:	00813983          	ld	s3,8(sp)
    80001d24:	00013a03          	ld	s4,0(sp)
    80001d28:	03010113          	addi	sp,sp,48
    80001d2c:	00008067          	ret
        return -1;
    80001d30:	fff00513          	li	a0,-1
}
    80001d34:	00008067          	ret
        return -1;
    80001d38:	fff00513          	li	a0,-1
    80001d3c:	fd5ff06f          	j	80001d10 <_ZN7KThread21initializeUserContextEPS_+0xe8>
    80001d40:	fff00513          	li	a0,-1
    80001d44:	fcdff06f          	j	80001d10 <_ZN7KThread21initializeUserContextEPS_+0xe8>
    80001d48:	fff00513          	li	a0,-1
    80001d4c:	fc5ff06f          	j	80001d10 <_ZN7KThread21initializeUserContextEPS_+0xe8>

0000000080001d50 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_>:
{
    80001d50:	fd010113          	addi	sp,sp,-48
    80001d54:	02113423          	sd	ra,40(sp)
    80001d58:	02813023          	sd	s0,32(sp)
    80001d5c:	00913c23          	sd	s1,24(sp)
    80001d60:	01213823          	sd	s2,16(sp)
    80001d64:	01313423          	sd	s3,8(sp)
    80001d68:	01413023          	sd	s4,0(sp)
    80001d6c:	03010413          	addi	s0,sp,48
    80001d70:	00050993          	mv	s3,a0
    if(handle== nullptr || body==nullptr || userStackTop == nullptr) return -1;
    80001d74:	0e050c63          	beqz	a0,80001e6c <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0x11c>
    80001d78:	00058513          	mv	a0,a1
    80001d7c:	00060593          	mv	a1,a2
    80001d80:	00068913          	mv	s2,a3
    80001d84:	0e050863          	beqz	a0,80001e74 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0x124>
    80001d88:	0e068a63          	beqz	a3,80001e7c <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0x12c>
    KThread* thread = KThread::allocate(body,arg);
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	ad8080e7          	jalr	-1320(ra) # 80001864 <_ZN7KThread8allocateEPFvPvES0_>
    80001d94:	00050493          	mv	s1,a0
    if(thread == nullptr) return -2;
    80001d98:	0e050663          	beqz	a0,80001e84 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0x134>
    void* kernelStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    80001d9c:	04000513          	li	a0,64
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	5d8080e7          	jalr	1496(ra) # 80002378 <_ZN12MemAllocator9mem_allocEm>
    80001da8:	00050a13          	mv	s4,a0
    if(kernelStack==nullptr)
    80001dac:	08050663          	beqz	a0,80001e38 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xe8>
    thread->kernelStack = kernelStack;
    80001db0:	02a4bc23          	sd	a0,56(s1)
    thread->userStack = (void*)((uint64)userStackTop-DEFAULT_STACK_SIZE);
    80001db4:	fffff6b7          	lui	a3,0xfffff
    80001db8:	00d90933          	add	s2,s2,a3
    80001dbc:	0524b023          	sd	s2,64(s1)
    if(KThread::initializeUserContext(thread)<0)
    80001dc0:	00048513          	mv	a0,s1
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	e64080e7          	jalr	-412(ra) # 80001c28 <_ZN7KThread21initializeUserContextEPS_>
    80001dcc:	08054063          	bltz	a0,80001e4c <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xfc>
class Scheduler
{
public:
    static Scheduler& getInstance()
    {
        static Scheduler instance;
    80001dd0:	0000b797          	auipc	a5,0xb
    80001dd4:	ed07c783          	lbu	a5,-304(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80001dd8:	02079263          	bnez	a5,80001dfc <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xac>
    KThread* get();

    KThread* getIdleThread();
    bool isEmpty() const;
private:
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80001ddc:	0000b797          	auipc	a5,0xb
    80001de0:	ecc78793          	addi	a5,a5,-308 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001de4:	0007b023          	sd	zero,0(a5)
    80001de8:	0007b423          	sd	zero,8(a5)
    80001dec:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80001df0:	00100793          	li	a5,1
    80001df4:	0000b717          	auipc	a4,0xb
    80001df8:	eaf70623          	sb	a5,-340(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    Scheduler::getInstance().put(thread);
    80001dfc:	00048593          	mv	a1,s1
    80001e00:	0000b517          	auipc	a0,0xb
    80001e04:	ea850513          	addi	a0,a0,-344 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001e08:	00001097          	auipc	ra,0x1
    80001e0c:	8ac080e7          	jalr	-1876(ra) # 800026b4 <_ZN9Scheduler3putEP7KThread>
    *handle = thread;
    80001e10:	0099b023          	sd	s1,0(s3)
    return 0;
    80001e14:	00000513          	li	a0,0
}
    80001e18:	02813083          	ld	ra,40(sp)
    80001e1c:	02013403          	ld	s0,32(sp)
    80001e20:	01813483          	ld	s1,24(sp)
    80001e24:	01013903          	ld	s2,16(sp)
    80001e28:	00813983          	ld	s3,8(sp)
    80001e2c:	00013a03          	ld	s4,0(sp)
    80001e30:	03010113          	addi	sp,sp,48
    80001e34:	00008067          	ret
        KThread::release(thread);
    80001e38:	00048513          	mv	a0,s1
    80001e3c:	00000097          	auipc	ra,0x0
    80001e40:	ae0080e7          	jalr	-1312(ra) # 8000191c <_ZN7KThread7releaseEPS_>
        return -3;
    80001e44:	ffd00513          	li	a0,-3
    80001e48:	fd1ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>
        MemAllocator::mem_free(kernelStack);
    80001e4c:	000a0513          	mv	a0,s4
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	624080e7          	jalr	1572(ra) # 80002474 <_ZN12MemAllocator8mem_freeEPv>
        KThread::release(thread);
    80001e58:	00048513          	mv	a0,s1
    80001e5c:	00000097          	auipc	ra,0x0
    80001e60:	ac0080e7          	jalr	-1344(ra) # 8000191c <_ZN7KThread7releaseEPS_>
        return -4;
    80001e64:	ffc00513          	li	a0,-4
    80001e68:	fb1ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>
    if(handle== nullptr || body==nullptr || userStackTop == nullptr) return -1;
    80001e6c:	fff00513          	li	a0,-1
    80001e70:	fa9ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>
    80001e74:	fff00513          	li	a0,-1
    80001e78:	fa1ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>
    80001e7c:	fff00513          	li	a0,-1
    80001e80:	f99ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>
    if(thread == nullptr) return -2;
    80001e84:	ffe00513          	li	a0,-2
    80001e88:	f91ff06f          	j	80001e18 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_+0xc8>

0000000080001e8c <_ZN7KThread5blockEv>:
{
    80001e8c:	fe010113          	addi	sp,sp,-32
    80001e90:	00113c23          	sd	ra,24(sp)
    80001e94:	00813823          	sd	s0,16(sp)
    80001e98:	00913423          	sd	s1,8(sp)
    80001e9c:	02010413          	addi	s0,sp,32
    KThread* old = KThread::running;
    80001ea0:	0000a497          	auipc	s1,0xa
    80001ea4:	bf84b483          	ld	s1,-1032(s1) # 8000ba98 <_ZN7KThread7runningE>
    if (old==nullptr) return -1;
    80001ea8:	08048a63          	beqz	s1,80001f3c <_ZN7KThread5blockEv+0xb0>
    old->status = KThread::BLOCKED;
    80001eac:	00300793          	li	a5,3
    80001eb0:	02f4a023          	sw	a5,32(s1)
    80001eb4:	0000b797          	auipc	a5,0xb
    80001eb8:	dec7c783          	lbu	a5,-532(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80001ebc:	02079263          	bnez	a5,80001ee0 <_ZN7KThread5blockEv+0x54>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80001ec0:	0000b797          	auipc	a5,0xb
    80001ec4:	de878793          	addi	a5,a5,-536 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001ec8:	0007b023          	sd	zero,0(a5)
    80001ecc:	0007b423          	sd	zero,8(a5)
    80001ed0:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80001ed4:	00100793          	li	a5,1
    80001ed8:	0000b717          	auipc	a4,0xb
    80001edc:	dcf70423          	sb	a5,-568(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    KThread* next = Scheduler::getInstance().get();
    80001ee0:	0000b517          	auipc	a0,0xb
    80001ee4:	dc850513          	addi	a0,a0,-568 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001ee8:	00001097          	auipc	ra,0x1
    80001eec:	828080e7          	jalr	-2008(ra) # 80002710 <_ZN9Scheduler3getEv>
    80001ef0:	00050593          	mv	a1,a0
    if (next==nullptr)
    80001ef4:	02050c63          	beqz	a0,80001f2c <_ZN7KThread5blockEv+0xa0>
    KThread::running = next;
    80001ef8:	0000a797          	auipc	a5,0xa
    80001efc:	baa7b023          	sd	a0,-1120(a5) # 8000ba98 <_ZN7KThread7runningE>
    next->status = KThread::RUNNING;
    80001f00:	00100793          	li	a5,1
    80001f04:	02f52023          	sw	a5,32(a0)
    yield(old,next);
    80001f08:	00048513          	mv	a0,s1
    80001f0c:	fffff097          	auipc	ra,0xfffff
    80001f10:	1c4080e7          	jalr	452(ra) # 800010d0 <yield>
    return 0;
    80001f14:	00000513          	li	a0,0
}
    80001f18:	01813083          	ld	ra,24(sp)
    80001f1c:	01013403          	ld	s0,16(sp)
    80001f20:	00813483          	ld	s1,8(sp)
    80001f24:	02010113          	addi	sp,sp,32
    80001f28:	00008067          	ret
        old->status = KThread::RUNNING;
    80001f2c:	00100793          	li	a5,1
    80001f30:	02f4a023          	sw	a5,32(s1)
        return -2;
    80001f34:	ffe00513          	li	a0,-2
    80001f38:	fe1ff06f          	j	80001f18 <_ZN7KThread5blockEv+0x8c>
    if (old==nullptr) return -1;
    80001f3c:	fff00513          	li	a0,-1
    80001f40:	fd9ff06f          	j	80001f18 <_ZN7KThread5blockEv+0x8c>

0000000080001f44 <_ZN7KThread7unblockEPS_>:
    if (thread==nullptr) return -1;
    80001f44:	08050863          	beqz	a0,80001fd4 <_ZN7KThread7unblockEPS_+0x90>
{
    80001f48:	fe010113          	addi	sp,sp,-32
    80001f4c:	00113c23          	sd	ra,24(sp)
    80001f50:	00813823          	sd	s0,16(sp)
    80001f54:	00913423          	sd	s1,8(sp)
    80001f58:	02010413          	addi	s0,sp,32
    80001f5c:	00050493          	mv	s1,a0
    if (!KThread::isAllocated(thread)) return -2;
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	b28080e7          	jalr	-1240(ra) # 80001a88 <_ZN7KThread11isAllocatedEPKS_>
    80001f68:	06050a63          	beqz	a0,80001fdc <_ZN7KThread7unblockEPS_+0x98>
    if (thread->status != KThread::BLOCKED) return -3;
    80001f6c:	0204a703          	lw	a4,32(s1)
    80001f70:	00300793          	li	a5,3
    80001f74:	06f71863          	bne	a4,a5,80001fe4 <_ZN7KThread7unblockEPS_+0xa0>
    thread->status = KThread::READY;
    80001f78:	0204a023          	sw	zero,32(s1)
    80001f7c:	0000b797          	auipc	a5,0xb
    80001f80:	d247c783          	lbu	a5,-732(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80001f84:	02079263          	bnez	a5,80001fa8 <_ZN7KThread7unblockEPS_+0x64>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80001f88:	0000b797          	auipc	a5,0xb
    80001f8c:	d2078793          	addi	a5,a5,-736 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001f90:	0007b023          	sd	zero,0(a5)
    80001f94:	0007b423          	sd	zero,8(a5)
    80001f98:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80001f9c:	00100793          	li	a5,1
    80001fa0:	0000b717          	auipc	a4,0xb
    80001fa4:	d0f70023          	sb	a5,-768(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    Scheduler::getInstance().put(thread);
    80001fa8:	00048593          	mv	a1,s1
    80001fac:	0000b517          	auipc	a0,0xb
    80001fb0:	cfc50513          	addi	a0,a0,-772 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	700080e7          	jalr	1792(ra) # 800026b4 <_ZN9Scheduler3putEP7KThread>
    return 0;
    80001fbc:	00000513          	li	a0,0
}
    80001fc0:	01813083          	ld	ra,24(sp)
    80001fc4:	01013403          	ld	s0,16(sp)
    80001fc8:	00813483          	ld	s1,8(sp)
    80001fcc:	02010113          	addi	sp,sp,32
    80001fd0:	00008067          	ret
    if (thread==nullptr) return -1;
    80001fd4:	fff00513          	li	a0,-1
}
    80001fd8:	00008067          	ret
    if (!KThread::isAllocated(thread)) return -2;
    80001fdc:	ffe00513          	li	a0,-2
    80001fe0:	fe1ff06f          	j	80001fc0 <_ZN7KThread7unblockEPS_+0x7c>
    if (thread->status != KThread::BLOCKED) return -3;
    80001fe4:	ffd00513          	li	a0,-3
    80001fe8:	fd9ff06f          	j	80001fc0 <_ZN7KThread7unblockEPS_+0x7c>

0000000080001fec <_ZN7KThread8dispatchEv>:
{
    80001fec:	fe010113          	addi	sp,sp,-32
    80001ff0:	00113c23          	sd	ra,24(sp)
    80001ff4:	00813823          	sd	s0,16(sp)
    80001ff8:	00913423          	sd	s1,8(sp)
    80001ffc:	02010413          	addi	s0,sp,32
    KThread* old = KThread::running;
    80002000:	0000a497          	auipc	s1,0xa
    80002004:	a984b483          	ld	s1,-1384(s1) # 8000ba98 <_ZN7KThread7runningE>
    if(old!=nullptr && old->status == RUNNING)
    80002008:	00048863          	beqz	s1,80002018 <_ZN7KThread8dispatchEv+0x2c>
    8000200c:	0204a703          	lw	a4,32(s1)
    80002010:	00100793          	li	a5,1
    80002014:	06f70e63          	beq	a4,a5,80002090 <_ZN7KThread8dispatchEv+0xa4>
    80002018:	0000b797          	auipc	a5,0xb
    8000201c:	c887c783          	lbu	a5,-888(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80002020:	02079263          	bnez	a5,80002044 <_ZN7KThread8dispatchEv+0x58>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80002024:	0000b797          	auipc	a5,0xb
    80002028:	c8478793          	addi	a5,a5,-892 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    8000202c:	0007b023          	sd	zero,0(a5)
    80002030:	0007b423          	sd	zero,8(a5)
    80002034:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80002038:	00100793          	li	a5,1
    8000203c:	0000b717          	auipc	a4,0xb
    80002040:	c6f70223          	sb	a5,-924(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    KThread* next = Scheduler::getInstance().get();
    80002044:	0000b517          	auipc	a0,0xb
    80002048:	c6450513          	addi	a0,a0,-924 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    8000204c:	00000097          	auipc	ra,0x0
    80002050:	6c4080e7          	jalr	1732(ra) # 80002710 <_ZN9Scheduler3getEv>
    if(next==nullptr) return;
    80002054:	02050463          	beqz	a0,8000207c <_ZN7KThread8dispatchEv+0x90>
    KThread::running = next;
    80002058:	0000a797          	auipc	a5,0xa
    8000205c:	a4a7b023          	sd	a0,-1472(a5) # 8000ba98 <_ZN7KThread7runningE>
    next->status = RUNNING;
    80002060:	00100793          	li	a5,1
    80002064:	02f52023          	sw	a5,32(a0)
    if(old!=next) yield(old,next);
    80002068:	00a48a63          	beq	s1,a0,8000207c <_ZN7KThread8dispatchEv+0x90>
    8000206c:	00050593          	mv	a1,a0
    80002070:	00048513          	mv	a0,s1
    80002074:	fffff097          	auipc	ra,0xfffff
    80002078:	05c080e7          	jalr	92(ra) # 800010d0 <yield>
}
    8000207c:	01813083          	ld	ra,24(sp)
    80002080:	01013403          	ld	s0,16(sp)
    80002084:	00813483          	ld	s1,8(sp)
    80002088:	02010113          	addi	sp,sp,32
    8000208c:	00008067          	ret
    80002090:	0000b797          	auipc	a5,0xb
    80002094:	c107c783          	lbu	a5,-1008(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80002098:	02079263          	bnez	a5,800020bc <_ZN7KThread8dispatchEv+0xd0>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    8000209c:	0000b797          	auipc	a5,0xb
    800020a0:	c0c78793          	addi	a5,a5,-1012 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    800020a4:	0007b023          	sd	zero,0(a5)
    800020a8:	0007b423          	sd	zero,8(a5)
    800020ac:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    800020b0:	00100793          	li	a5,1
    800020b4:	0000b717          	auipc	a4,0xb
    800020b8:	bef70623          	sb	a5,-1044(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
        Scheduler::getInstance().put(old);
    800020bc:	00048593          	mv	a1,s1
    800020c0:	0000b517          	auipc	a0,0xb
    800020c4:	be850513          	addi	a0,a0,-1048 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    800020c8:	00000097          	auipc	ra,0x0
    800020cc:	5ec080e7          	jalr	1516(ra) # 800026b4 <_ZN9Scheduler3putEP7KThread>
    800020d0:	f49ff06f          	j	80002018 <_ZN7KThread8dispatchEv+0x2c>

00000000800020d4 <_ZN7KThread4exitEv>:
{
    800020d4:	fe010113          	addi	sp,sp,-32
    800020d8:	00113c23          	sd	ra,24(sp)
    800020dc:	00813823          	sd	s0,16(sp)
    800020e0:	00913423          	sd	s1,8(sp)
    800020e4:	02010413          	addi	s0,sp,32
    KThread* old = KThread::running;
    800020e8:	0000a497          	auipc	s1,0xa
    800020ec:	9b04b483          	ld	s1,-1616(s1) # 8000ba98 <_ZN7KThread7runningE>
    if(old== nullptr) return -1;
    800020f0:	08048063          	beqz	s1,80002170 <_ZN7KThread4exitEv+0x9c>
    old->status = FINISHED;
    800020f4:	00200793          	li	a5,2
    800020f8:	02f4a023          	sw	a5,32(s1)
    KThread::deferCleanup(old);
    800020fc:	00048513          	mv	a0,s1
    80002100:	fffff097          	auipc	ra,0xfffff
    80002104:	6d4080e7          	jalr	1748(ra) # 800017d4 <_ZN7KThread12deferCleanupEPS_>
    80002108:	0000b797          	auipc	a5,0xb
    8000210c:	b987c783          	lbu	a5,-1128(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    80002110:	02079263          	bnez	a5,80002134 <_ZN7KThread4exitEv+0x60>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80002114:	0000b797          	auipc	a5,0xb
    80002118:	b9478793          	addi	a5,a5,-1132 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    8000211c:	0007b023          	sd	zero,0(a5)
    80002120:	0007b423          	sd	zero,8(a5)
    80002124:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80002128:	00100793          	li	a5,1
    8000212c:	0000b717          	auipc	a4,0xb
    80002130:	b6f70a23          	sb	a5,-1164(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    KThread* next = Scheduler::getInstance().get();
    80002134:	0000b517          	auipc	a0,0xb
    80002138:	b7450513          	addi	a0,a0,-1164 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    8000213c:	00000097          	auipc	ra,0x0
    80002140:	5d4080e7          	jalr	1492(ra) # 80002710 <_ZN9Scheduler3getEv>
    80002144:	00050593          	mv	a1,a0
    if(next== nullptr) return -2;
    80002148:	04050063          	beqz	a0,80002188 <_ZN7KThread4exitEv+0xb4>
    KThread::running = next;
    8000214c:	0000a797          	auipc	a5,0xa
    80002150:	94a7b623          	sd	a0,-1716(a5) # 8000ba98 <_ZN7KThread7runningE>
    next->status = RUNNING;
    80002154:	00100793          	li	a5,1
    80002158:	02f52023          	sw	a5,32(a0)
    yield(old,next);
    8000215c:	00048513          	mv	a0,s1
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	f70080e7          	jalr	-144(ra) # 800010d0 <yield>
        __asm__ volatile("nop");
    80002168:	00000013          	nop
    while(true)
    8000216c:	ffdff06f          	j	80002168 <_ZN7KThread4exitEv+0x94>
    if(old== nullptr) return -1;
    80002170:	fff00513          	li	a0,-1
}
    80002174:	01813083          	ld	ra,24(sp)
    80002178:	01013403          	ld	s0,16(sp)
    8000217c:	00813483          	ld	s1,8(sp)
    80002180:	02010113          	addi	sp,sp,32
    80002184:	00008067          	ret
    if(next== nullptr) return -2;
    80002188:	ffe00513          	li	a0,-2
    8000218c:	fe9ff06f          	j	80002174 <_ZN7KThread4exitEv+0xa0>

0000000080002190 <_GLOBAL__sub_I__ZN7KThread10threadPoolE>:
    80002190:	ff010113          	addi	sp,sp,-16
    80002194:	00113423          	sd	ra,8(sp)
    80002198:	00813023          	sd	s0,0(sp)
    8000219c:	01010413          	addi	s0,sp,16
    800021a0:	000105b7          	lui	a1,0x10
    800021a4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800021a8:	00100513          	li	a0,1
    800021ac:	fffff097          	auipc	ra,0xfffff
    800021b0:	5b8080e7          	jalr	1464(ra) # 80001764 <_Z41__static_initialization_and_destruction_0ii>
    800021b4:	00813083          	ld	ra,8(sp)
    800021b8:	00013403          	ld	s0,0(sp)
    800021bc:	01010113          	addi	sp,sp,16
    800021c0:	00008067          	ret

00000000800021c4 <_Znwm>:
// Created by os on 7/25/26.
//
#include "../h/syscall_c.h"

void* operator new(size_t size)
{
    800021c4:	ff010113          	addi	sp,sp,-16
    800021c8:	00113423          	sd	ra,8(sp)
    800021cc:	00813023          	sd	s0,0(sp)
    800021d0:	01010413          	addi	s0,sp,16
    if (size==0) size=1;
    800021d4:	00051463          	bnez	a0,800021dc <_Znwm+0x18>
    800021d8:	00100513          	li	a0,1
    return mem_alloc(size);
    800021dc:	fffff097          	auipc	ra,0xfffff
    800021e0:	038080e7          	jalr	56(ra) # 80001214 <_Z9mem_allocm>
}
    800021e4:	00813083          	ld	ra,8(sp)
    800021e8:	00013403          	ld	s0,0(sp)
    800021ec:	01010113          	addi	sp,sp,16
    800021f0:	00008067          	ret

00000000800021f4 <_Znam>:
void* operator new[](size_t size)
{
    800021f4:	ff010113          	addi	sp,sp,-16
    800021f8:	00113423          	sd	ra,8(sp)
    800021fc:	00813023          	sd	s0,0(sp)
    80002200:	01010413          	addi	s0,sp,16
    if (size==0) size=1;
    80002204:	00051463          	bnez	a0,8000220c <_Znam+0x18>
    80002208:	00100513          	li	a0,1
    return mem_alloc(size);
    8000220c:	fffff097          	auipc	ra,0xfffff
    80002210:	008080e7          	jalr	8(ra) # 80001214 <_Z9mem_allocm>
}
    80002214:	00813083          	ld	ra,8(sp)
    80002218:	00013403          	ld	s0,0(sp)
    8000221c:	01010113          	addi	sp,sp,16
    80002220:	00008067          	ret

0000000080002224 <_ZdlPv>:
void operator delete(void* ptr)
{
    if (ptr!=nullptr)
    80002224:	02050663          	beqz	a0,80002250 <_ZdlPv+0x2c>
{
    80002228:	ff010113          	addi	sp,sp,-16
    8000222c:	00113423          	sd	ra,8(sp)
    80002230:	00813023          	sd	s0,0(sp)
    80002234:	01010413          	addi	s0,sp,16
    {
        mem_free(ptr);
    80002238:	fffff097          	auipc	ra,0xfffff
    8000223c:	028080e7          	jalr	40(ra) # 80001260 <_Z8mem_freePv>
    }
}
    80002240:	00813083          	ld	ra,8(sp)
    80002244:	00013403          	ld	s0,0(sp)
    80002248:	01010113          	addi	sp,sp,16
    8000224c:	00008067          	ret
    80002250:	00008067          	ret

0000000080002254 <_ZdaPv>:
void operator delete[](void* ptr)
{
    if (ptr!=nullptr)
    80002254:	02050663          	beqz	a0,80002280 <_ZdaPv+0x2c>
{
    80002258:	ff010113          	addi	sp,sp,-16
    8000225c:	00113423          	sd	ra,8(sp)
    80002260:	00813023          	sd	s0,0(sp)
    80002264:	01010413          	addi	s0,sp,16
    {
        mem_free(ptr);
    80002268:	fffff097          	auipc	ra,0xfffff
    8000226c:	ff8080e7          	jalr	-8(ra) # 80001260 <_Z8mem_freePv>
    }
    80002270:	00813083          	ld	ra,8(sp)
    80002274:	00013403          	ld	s0,0(sp)
    80002278:	01010113          	addi	sp,sp,16
    8000227c:	00008067          	ret
    80002280:	00008067          	ret

0000000080002284 <_ZN8KConsole4getcEv>:
//
#include "../h/KConsole.h"
#include "../lib/hw.h"

char KConsole::getc()
{
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00813423          	sd	s0,8(sp)
    8000228c:	01010413          	addi	s0,sp,16
    volatile uint8* status = (volatile uint8*)CONSOLE_STATUS;
    80002290:	00009797          	auipc	a5,0x9
    80002294:	7607b783          	ld	a5,1888(a5) # 8000b9f0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002298:	0007b703          	ld	a4,0(a5)
    volatile uint8* rxData = (volatile uint8*)CONSOLE_RX_DATA;
    8000229c:	00009797          	auipc	a5,0x9
    800022a0:	74c7b783          	ld	a5,1868(a5) # 8000b9e8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800022a4:	0007b683          	ld	a3,0(a5)
    while ((*status & CONSOLE_RX_STATUS_BIT)==0)
    800022a8:	00074783          	lbu	a5,0(a4)
    800022ac:	0017f793          	andi	a5,a5,1
    800022b0:	fe078ce3          	beqz	a5,800022a8 <_ZN8KConsole4getcEv+0x24>
    {

    }
    return (char)(*rxData);
    800022b4:	0006c503          	lbu	a0,0(a3) # fffffffffffff000 <end+0xffffffff7fff0a50>
}
    800022b8:	0ff57513          	andi	a0,a0,255
    800022bc:	00813403          	ld	s0,8(sp)
    800022c0:	01010113          	addi	sp,sp,16
    800022c4:	00008067          	ret

00000000800022c8 <_ZN8KConsole4putcEc>:

void KConsole::putc(char c)
{
    800022c8:	ff010113          	addi	sp,sp,-16
    800022cc:	00813423          	sd	s0,8(sp)
    800022d0:	01010413          	addi	s0,sp,16
    volatile uint8* status = (volatile uint8*)CONSOLE_STATUS;
    800022d4:	00009797          	auipc	a5,0x9
    800022d8:	71c7b783          	ld	a5,1820(a5) # 8000b9f0 <_GLOBAL_OFFSET_TABLE_+0x10>
    800022dc:	0007b703          	ld	a4,0(a5)
    volatile uint8* txData = (volatile uint8*)CONSOLE_TX_DATA;
    800022e0:	00009797          	auipc	a5,0x9
    800022e4:	7287b783          	ld	a5,1832(a5) # 8000ba08 <_GLOBAL_OFFSET_TABLE_+0x28>
    800022e8:	0007b683          	ld	a3,0(a5)
    while ((*status & CONSOLE_TX_STATUS_BIT)==0)
    800022ec:	00074783          	lbu	a5,0(a4)
    800022f0:	0ff7f793          	andi	a5,a5,255
    800022f4:	0207f793          	andi	a5,a5,32
    800022f8:	fe078ae3          	beqz	a5,800022ec <_ZN8KConsole4putcEc+0x24>
    {

    }
    *txData = (uint8)c;
    800022fc:	00a68023          	sb	a0,0(a3)
}
    80002300:	00813403          	ld	s0,8(sp)
    80002304:	01010113          	addi	sp,sp,16
    80002308:	00008067          	ret

000000008000230c <_ZN12MemAllocator4initEv>:
FreeMem* MemAllocator::freeMemHead = nullptr;
bool MemAllocator::initialized = false;


void MemAllocator::init()   //cela funkcija sluzi samo da pri prvom alociranju setujem ovaj fleg initialized
{                           //da bi izbegao da cekujem dal je freememHead ==nullptr jer to moze da se desi kad je
    8000230c:	ff010113          	addi	sp,sp,-16
    80002310:	00813423          	sd	s0,8(sp)
    80002314:	01010413          	addi	s0,sp,16
    if (initialized) return;        // i prazan heap i pun heap tehnicki bez ove provere(vrv ima bolji nacin)
    80002318:	0000b797          	auipc	a5,0xb
    8000231c:	9a87c783          	lbu	a5,-1624(a5) # 8000ccc0 <_ZN12MemAllocator11initializedE>
    80002320:	04079663          	bnez	a5,8000236c <_ZN12MemAllocator4initEv+0x60>

    uint64 startAddr = ((uint64)HEAP_START_ADDR+MEM_BLOCK_SIZE-1) & ~(MEM_BLOCK_SIZE-1);
    80002324:	00009797          	auipc	a5,0x9
    80002328:	6d47b783          	ld	a5,1748(a5) # 8000b9f8 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000232c:	0007b783          	ld	a5,0(a5)
    80002330:	03f78793          	addi	a5,a5,63
    80002334:	fc07f793          	andi	a5,a5,-64
    uint64 endAddr = (uint64)HEAP_END_ADDR & ~(MEM_BLOCK_SIZE-1);
    80002338:	00009717          	auipc	a4,0x9
    8000233c:	6e873703          	ld	a4,1768(a4) # 8000ba20 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002340:	00073703          	ld	a4,0(a4)
    80002344:	fc077713          	andi	a4,a4,-64

    freeMemHead = (FreeMem*)startAddr;
    80002348:	0000b697          	auipc	a3,0xb
    8000234c:	97868693          	addi	a3,a3,-1672 # 8000ccc0 <_ZN12MemAllocator11initializedE>
    80002350:	00f6b423          	sd	a5,8(a3)
    freeMemHead->size = (endAddr - startAddr)/MEM_BLOCK_SIZE;
    80002354:	40f70733          	sub	a4,a4,a5
    80002358:	00675713          	srli	a4,a4,0x6
    8000235c:	00e7b423          	sd	a4,8(a5)
    freeMemHead->next = nullptr;
    80002360:	0007b023          	sd	zero,0(a5)

    initialized = true;
    80002364:	00100793          	li	a5,1
    80002368:	00f68023          	sb	a5,0(a3)
}
    8000236c:	00813403          	ld	s0,8(sp)
    80002370:	01010113          	addi	sp,sp,16
    80002374:	00008067          	ret

0000000080002378 <_ZN12MemAllocator9mem_allocEm>:


void* MemAllocator::mem_alloc(size_t numOfBlocks)
{
    80002378:	fe010113          	addi	sp,sp,-32
    8000237c:	00113c23          	sd	ra,24(sp)
    80002380:	00813823          	sd	s0,16(sp)
    80002384:	00913423          	sd	s1,8(sp)
    80002388:	02010413          	addi	s0,sp,32
    8000238c:	00050493          	mv	s1,a0
    if (!initialized) init();
    80002390:	0000b797          	auipc	a5,0xb
    80002394:	9307c783          	lbu	a5,-1744(a5) # 8000ccc0 <_ZN12MemAllocator11initializedE>
    80002398:	04078a63          	beqz	a5,800023ec <_ZN12MemAllocator9mem_allocEm+0x74>
    size_t heapBlocks = ((uint64)HEAP_END_ADDR-(uint64)HEAP_START_ADDR)/MEM_BLOCK_SIZE;//dodato za overflow check
    8000239c:	00009797          	auipc	a5,0x9
    800023a0:	6847b783          	ld	a5,1668(a5) # 8000ba20 <_GLOBAL_OFFSET_TABLE_+0x40>
    800023a4:	0007b783          	ld	a5,0(a5)
    800023a8:	00009717          	auipc	a4,0x9
    800023ac:	65073703          	ld	a4,1616(a4) # 8000b9f8 <_GLOBAL_OFFSET_TABLE_+0x18>
    800023b0:	00073703          	ld	a4,0(a4)
    800023b4:	40e787b3          	sub	a5,a5,a4
    800023b8:	0067d793          	srli	a5,a5,0x6
    if (numOfBlocks==0 || numOfBlocks>=heapBlocks) return nullptr; //takodje dodat overflow check
    800023bc:	0a048463          	beqz	s1,80002464 <_ZN12MemAllocator9mem_allocEm+0xec>
    800023c0:	0af4f663          	bgeu	s1,a5,8000246c <_ZN12MemAllocator9mem_allocEm+0xf4>

    size_t neededBlocks = numOfBlocks+1; //+1 block za size_t header(tj podatak o velicini procesa)
    800023c4:	00148713          	addi	a4,s1,1

    FreeMem* cur=freeMemHead;
    800023c8:	0000b517          	auipc	a0,0xb
    800023cc:	90053503          	ld	a0,-1792(a0) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    FreeMem* prev=nullptr;
    800023d0:	00000693          	li	a3,0

    for(;cur!= nullptr;cur=cur->next)  //first fit trazenje
    800023d4:	02050263          	beqz	a0,800023f8 <_ZN12MemAllocator9mem_allocEm+0x80>
    {
        if(cur->size>=neededBlocks) break;   //ostavljam jos jedan blok uz proces da bi stavio size procesa
    800023d8:	00853783          	ld	a5,8(a0)
    800023dc:	00e7fe63          	bgeu	a5,a4,800023f8 <_ZN12MemAllocator9mem_allocEm+0x80>
        prev=cur;
    800023e0:	00050693          	mv	a3,a0
    for(;cur!= nullptr;cur=cur->next)  //first fit trazenje
    800023e4:	00053503          	ld	a0,0(a0)
    800023e8:	fedff06f          	j	800023d4 <_ZN12MemAllocator9mem_allocEm+0x5c>
    if (!initialized) init();
    800023ec:	00000097          	auipc	ra,0x0
    800023f0:	f20080e7          	jalr	-224(ra) # 8000230c <_ZN12MemAllocator4initEv>
    800023f4:	fa9ff06f          	j	8000239c <_ZN12MemAllocator9mem_allocEm+0x24>
    }
    if(cur != nullptr)   //u slucaju da smo nasli odg FreeMem fragment
    800023f8:	02050a63          	beqz	a0,8000242c <_ZN12MemAllocator9mem_allocEm+0xb4>
    {
        char* allocatedStart = (char*) cur;  //izvlacenje podataka za ulancavanje i potencijalni novi FreeMem
        FreeMem* nextFree=cur->next;
    800023fc:	00053583          	ld	a1,0(a0)
        size_t oldSize = cur->size;
    80002400:	00853783          	ld	a5,8(a0)
        if(oldSize>neededBlocks)   //ako ima jedan blok vise da se smesti FreeMem
    80002404:	04f77463          	bgeu	a4,a5,8000244c <_ZN12MemAllocator9mem_allocEm+0xd4>
        {
            char* newFreeAddr = allocatedStart+neededBlocks*MEM_BLOCK_SIZE;
    80002408:	00671613          	slli	a2,a4,0x6
    8000240c:	00c50633          	add	a2,a0,a2

            FreeMem* newFree = (FreeMem*) newFreeAddr;
            newFree->size = oldSize-neededBlocks;
    80002410:	40e78733          	sub	a4,a5,a4
    80002414:	00e63423          	sd	a4,8(a2)
            newFree->next = nextFree;
    80002418:	00b63023          	sd	a1,0(a2)

            if(prev) prev->next = newFree;
    8000241c:	02068263          	beqz	a3,80002440 <_ZN12MemAllocator9mem_allocEm+0xc8>
    80002420:	00c6b023          	sd	a2,0(a3)
        else
        {
            if (prev) prev->next = nextFree;
            else freeMemHead = nextFree;
        }
        *((size_t*)allocatedStart) = numOfBlocks;//postavljanje u blok iznad velicinu procesa
    80002424:	00953023          	sd	s1,0(a0)
        void* ret = (char*)allocatedStart+MEM_BLOCK_SIZE; //vracanje stvarne adrese pocetka procesa
    80002428:	04050513          	addi	a0,a0,64
        return ret;
    }
    return nullptr;
}
    8000242c:	01813083          	ld	ra,24(sp)
    80002430:	01013403          	ld	s0,16(sp)
    80002434:	00813483          	ld	s1,8(sp)
    80002438:	02010113          	addi	sp,sp,32
    8000243c:	00008067          	ret
            else freeMemHead = newFree;
    80002440:	0000b797          	auipc	a5,0xb
    80002444:	88c7b423          	sd	a2,-1912(a5) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    80002448:	fddff06f          	j	80002424 <_ZN12MemAllocator9mem_allocEm+0xac>
            if (prev) prev->next = nextFree;
    8000244c:	00068663          	beqz	a3,80002458 <_ZN12MemAllocator9mem_allocEm+0xe0>
    80002450:	00b6b023          	sd	a1,0(a3)
    80002454:	fd1ff06f          	j	80002424 <_ZN12MemAllocator9mem_allocEm+0xac>
            else freeMemHead = nextFree;
    80002458:	0000b797          	auipc	a5,0xb
    8000245c:	86b7b823          	sd	a1,-1936(a5) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    80002460:	fc5ff06f          	j	80002424 <_ZN12MemAllocator9mem_allocEm+0xac>
    if (numOfBlocks==0 || numOfBlocks>=heapBlocks) return nullptr; //takodje dodat overflow check
    80002464:	00000513          	li	a0,0
    80002468:	fc5ff06f          	j	8000242c <_ZN12MemAllocator9mem_allocEm+0xb4>
    8000246c:	00000513          	li	a0,0
    80002470:	fbdff06f          	j	8000242c <_ZN12MemAllocator9mem_allocEm+0xb4>

0000000080002474 <_ZN12MemAllocator8mem_freeEPv>:

int MemAllocator::mem_free(void *address)
{
    80002474:	ff010113          	addi	sp,sp,-16
    80002478:	00813423          	sd	s0,8(sp)
    8000247c:	01010413          	addi	s0,sp,16
    if (address==nullptr) return -1;   //provera dal je zaht adresa validna
    80002480:	10050663          	beqz	a0,8000258c <_ZN12MemAllocator8mem_freeEPv+0x118>

    uint64 addr = (uint64)address;
    if (addr%MEM_BLOCK_SIZE!=0) return -2;   //provera dal je block aligned
    80002484:	03f57793          	andi	a5,a0,63
    80002488:	10079663          	bnez	a5,80002594 <_ZN12MemAllocator8mem_freeEPv+0x120>

    uint64 startAddr = ((uint64)HEAP_START_ADDR+MEM_BLOCK_SIZE-1) & ~(MEM_BLOCK_SIZE-1);
    8000248c:	00009797          	auipc	a5,0x9
    80002490:	56c7b783          	ld	a5,1388(a5) # 8000b9f8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002494:	0007b783          	ld	a5,0(a5)
    80002498:	03f78793          	addi	a5,a5,63
    8000249c:	fc07f793          	andi	a5,a5,-64
    uint64 endAddr = (uint64)HEAP_END_ADDR & ~(MEM_BLOCK_SIZE-1);
    800024a0:	00009717          	auipc	a4,0x9
    800024a4:	58073703          	ld	a4,1408(a4) # 8000ba20 <_GLOBAL_OFFSET_TABLE_+0x40>
    800024a8:	00073703          	ld	a4,0(a4)
    800024ac:	fc077713          	andi	a4,a4,-64
    if(addr<startAddr+MEM_BLOCK_SIZE || addr>=endAddr) return -3;   //provera dal prevazilazi granice heapa
    800024b0:	04078793          	addi	a5,a5,64
    800024b4:	0ef56463          	bltu	a0,a5,8000259c <_ZN12MemAllocator8mem_freeEPv+0x128>
    800024b8:	0ee57663          	bgeu	a0,a4,800025a4 <_ZN12MemAllocator8mem_freeEPv+0x130>

    char* allocStart= (char*) address-MEM_BLOCK_SIZE;       //cupanje pocetne adrese sa blokom za velicinu procesa
    800024bc:	fc050713          	addi	a4,a0,-64
    size_t userBlocks = *((size_t*)allocStart);
    800024c0:	fc053783          	ld	a5,-64(a0)
    size_t totalBlocks = userBlocks+1;    //ukupan broj blokova koji se freeuje
    800024c4:	00178793          	addi	a5,a5,1

    FreeMem* cur = (FreeMem*) allocStart;    //postavljanje parametara bloka za freeovanje
    cur->size = totalBlocks;
    800024c8:	fcf53423          	sd	a5,-56(a0)
    cur->next = nullptr;
    800024cc:	fc053023          	sd	zero,-64(a0)

    FreeMem* tek = freeMemHead;
    800024d0:	0000a797          	auipc	a5,0xa
    800024d4:	7f87b783          	ld	a5,2040(a5) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    FreeMem* prev= nullptr;
    if(!freeMemHead)   // u slucaju da nema head on postaje head
    800024d8:	02078e63          	beqz	a5,80002514 <_ZN12MemAllocator8mem_freeEPv+0xa0>
    {
        freeMemHead = cur;
    }
    else if ((char*)cur<(char*)freeMemHead)   //ako je iza heada da postane on head, head njegov next radi odrzavanja
    800024dc:	04f77263          	bgeu	a4,a5,80002520 <_ZN12MemAllocator8mem_freeEPv+0xac>
    {                                         //rastuceg niza adresa FreeMem
        cur->next = freeMemHead;
    800024e0:	fcf53023          	sd	a5,-64(a0)
        freeMemHead = cur;
    800024e4:	0000a797          	auipc	a5,0xa
    800024e8:	7ee7b223          	sd	a4,2020(a5) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    {
        prev->size +=cur->size;
        prev->next = cur->next;
        cur=prev;
    }
    if(cur->next && (char*)cur+(cur->size*MEM_BLOCK_SIZE)==(char*)cur->next)  //ako ima ispod njega spoj dole
    800024ec:	00073783          	ld	a5,0(a4)
    800024f0:	0a078e63          	beqz	a5,800025ac <_ZN12MemAllocator8mem_freeEPv+0x138>
    800024f4:	00873603          	ld	a2,8(a4)
    800024f8:	00661693          	slli	a3,a2,0x6
    800024fc:	00d706b3          	add	a3,a4,a3
    80002500:	06d78863          	beq	a5,a3,80002570 <_ZN12MemAllocator8mem_freeEPv+0xfc>
    {
        cur->size+=cur->next->size;
        cur->next = cur->next->next;
    }
    return 0;
    80002504:	00000513          	li	a0,0
}
    80002508:	00813403          	ld	s0,8(sp)
    8000250c:	01010113          	addi	sp,sp,16
    80002510:	00008067          	ret
        freeMemHead = cur;
    80002514:	0000a797          	auipc	a5,0xa
    80002518:	7ae7ba23          	sd	a4,1972(a5) # 8000ccc8 <_ZN12MemAllocator11freeMemHeadE>
    if(prev && (char*)prev+(prev->size*MEM_BLOCK_SIZE)==(char*)cur) //ako ima iznad njega spoji gore
    8000251c:	fd1ff06f          	j	800024ec <_ZN12MemAllocator8mem_freeEPv+0x78>
    FreeMem* prev= nullptr;
    80002520:	00000693          	li	a3,0
        while(tek && (char*)tek<(char*)cur)  //trazenje potencijalnih prev i next za coalesce
    80002524:	00078a63          	beqz	a5,80002538 <_ZN12MemAllocator8mem_freeEPv+0xc4>
    80002528:	00e7f863          	bgeu	a5,a4,80002538 <_ZN12MemAllocator8mem_freeEPv+0xc4>
            prev=tek;
    8000252c:	00078693          	mv	a3,a5
            tek=tek->next;
    80002530:	0007b783          	ld	a5,0(a5)
        while(tek && (char*)tek<(char*)cur)  //trazenje potencijalnih prev i next za coalesce
    80002534:	ff1ff06f          	j	80002524 <_ZN12MemAllocator8mem_freeEPv+0xb0>
        prev->next=cur;
    80002538:	00e6b023          	sd	a4,0(a3)
        cur->next = tek;
    8000253c:	fcf53023          	sd	a5,-64(a0)
    if(prev && (char*)prev+(prev->size*MEM_BLOCK_SIZE)==(char*)cur) //ako ima iznad njega spoji gore
    80002540:	fa0686e3          	beqz	a3,800024ec <_ZN12MemAllocator8mem_freeEPv+0x78>
    80002544:	0086b603          	ld	a2,8(a3)
    80002548:	00661793          	slli	a5,a2,0x6
    8000254c:	00f687b3          	add	a5,a3,a5
    80002550:	f8e79ee3          	bne	a5,a4,800024ec <_ZN12MemAllocator8mem_freeEPv+0x78>
        prev->size +=cur->size;
    80002554:	fc853783          	ld	a5,-56(a0)
    80002558:	00f60633          	add	a2,a2,a5
    8000255c:	00c6b423          	sd	a2,8(a3)
        prev->next = cur->next;
    80002560:	fc053783          	ld	a5,-64(a0)
    80002564:	00f6b023          	sd	a5,0(a3)
        cur=prev;
    80002568:	00068713          	mv	a4,a3
    8000256c:	f81ff06f          	j	800024ec <_ZN12MemAllocator8mem_freeEPv+0x78>
        cur->size+=cur->next->size;
    80002570:	0087b683          	ld	a3,8(a5)
    80002574:	00d60633          	add	a2,a2,a3
    80002578:	00c73423          	sd	a2,8(a4)
        cur->next = cur->next->next;
    8000257c:	0007b783          	ld	a5,0(a5)
    80002580:	00f73023          	sd	a5,0(a4)
    return 0;
    80002584:	00000513          	li	a0,0
    80002588:	f81ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>
    if (address==nullptr) return -1;   //provera dal je zaht adresa validna
    8000258c:	fff00513          	li	a0,-1
    80002590:	f79ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>
    if (addr%MEM_BLOCK_SIZE!=0) return -2;   //provera dal je block aligned
    80002594:	ffe00513          	li	a0,-2
    80002598:	f71ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>
    if(addr<startAddr+MEM_BLOCK_SIZE || addr>=endAddr) return -3;   //provera dal prevazilazi granice heapa
    8000259c:	ffd00513          	li	a0,-3
    800025a0:	f69ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>
    800025a4:	ffd00513          	li	a0,-3
    800025a8:	f61ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>
    return 0;
    800025ac:	00000513          	li	a0,0
    800025b0:	f59ff06f          	j	80002508 <_ZN12MemAllocator8mem_freeEPv+0x94>

00000000800025b4 <_ZN9Scheduler8idleBodyEPv>:
{
    return idleThread;
}

void Scheduler::idleBody(void *)
{
    800025b4:	ff010113          	addi	sp,sp,-16
    800025b8:	00113423          	sd	ra,8(sp)
    800025bc:	00813023          	sd	s0,0(sp)
    800025c0:	01010413          	addi	s0,sp,16
    while (true)
    {
        KThread::cleanupFinishedthreads();
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	414080e7          	jalr	1044(ra) # 800019d8 <_ZN7KThread22cleanupFinishedthreadsEv>
        __asm__ volatile("nop");
    800025cc:	00000013          	nop
    while (true)
    800025d0:	ff5ff06f          	j	800025c4 <_ZN9Scheduler8idleBodyEPv+0x10>

00000000800025d4 <_ZN9Scheduler4initEv>:
    if (idleThread!=nullptr) return 0;
    800025d4:	01053783          	ld	a5,16(a0)
    800025d8:	00078663          	beqz	a5,800025e4 <_ZN9Scheduler4initEv+0x10>
    800025dc:	00000513          	li	a0,0
}
    800025e0:	00008067          	ret
{
    800025e4:	fe010113          	addi	sp,sp,-32
    800025e8:	00113c23          	sd	ra,24(sp)
    800025ec:	00813823          	sd	s0,16(sp)
    800025f0:	00913423          	sd	s1,8(sp)
    800025f4:	01213023          	sd	s2,0(sp)
    800025f8:	02010413          	addi	s0,sp,32
    800025fc:	00050493          	mv	s1,a0
    idleThread = KThread::allocate(&Scheduler::idleBody,nullptr);
    80002600:	00000593          	li	a1,0
    80002604:	00000517          	auipc	a0,0x0
    80002608:	fb050513          	addi	a0,a0,-80 # 800025b4 <_ZN9Scheduler8idleBodyEPv>
    8000260c:	fffff097          	auipc	ra,0xfffff
    80002610:	258080e7          	jalr	600(ra) # 80001864 <_ZN7KThread8allocateEPFvPvES0_>
    80002614:	00a4b823          	sd	a0,16(s1)
    if (idleThread == nullptr) return -1;
    80002618:	08050a63          	beqz	a0,800026ac <_ZN9Scheduler4initEv+0xd8>
    void* stack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    8000261c:	04000513          	li	a0,64
    80002620:	00000097          	auipc	ra,0x0
    80002624:	d58080e7          	jalr	-680(ra) # 80002378 <_ZN12MemAllocator9mem_allocEm>
    80002628:	00050913          	mv	s2,a0
    if(stack== nullptr)
    8000262c:	04050263          	beqz	a0,80002670 <_ZN9Scheduler4initEv+0x9c>
    if(KThread::initializeContext(idleThread,stack)<0)
    80002630:	00050593          	mv	a1,a0
    80002634:	0104b503          	ld	a0,16(s1)
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	528080e7          	jalr	1320(ra) # 80001b60 <_ZN7KThread17initializeContextEPS_Pv>
    80002640:	04054463          	bltz	a0,80002688 <_ZN9Scheduler4initEv+0xb4>
    idleThread->status=KThread::READY;
    80002644:	0104b783          	ld	a5,16(s1)
    80002648:	0207a023          	sw	zero,32(a5)
    idleThread->next = nullptr;
    8000264c:	0104b783          	ld	a5,16(s1)
    80002650:	0007bc23          	sd	zero,24(a5)
    return 0;
    80002654:	00000513          	li	a0,0
}
    80002658:	01813083          	ld	ra,24(sp)
    8000265c:	01013403          	ld	s0,16(sp)
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	00013903          	ld	s2,0(sp)
    80002668:	02010113          	addi	sp,sp,32
    8000266c:	00008067          	ret
        KThread::release(idleThread);
    80002670:	0104b503          	ld	a0,16(s1)
    80002674:	fffff097          	auipc	ra,0xfffff
    80002678:	2a8080e7          	jalr	680(ra) # 8000191c <_ZN7KThread7releaseEPS_>
        idleThread = nullptr;
    8000267c:	0004b823          	sd	zero,16(s1)
        return -2;
    80002680:	ffe00513          	li	a0,-2
    80002684:	fd5ff06f          	j	80002658 <_ZN9Scheduler4initEv+0x84>
        MemAllocator::mem_free(stack);
    80002688:	00090513          	mv	a0,s2
    8000268c:	00000097          	auipc	ra,0x0
    80002690:	de8080e7          	jalr	-536(ra) # 80002474 <_ZN12MemAllocator8mem_freeEPv>
        KThread::release(idleThread);
    80002694:	0104b503          	ld	a0,16(s1)
    80002698:	fffff097          	auipc	ra,0xfffff
    8000269c:	284080e7          	jalr	644(ra) # 8000191c <_ZN7KThread7releaseEPS_>
        idleThread= nullptr;
    800026a0:	0004b823          	sd	zero,16(s1)
        return -3;
    800026a4:	ffd00513          	li	a0,-3
    800026a8:	fb1ff06f          	j	80002658 <_ZN9Scheduler4initEv+0x84>
    if (idleThread == nullptr) return -1;
    800026ac:	fff00513          	li	a0,-1
    800026b0:	fa9ff06f          	j	80002658 <_ZN9Scheduler4initEv+0x84>

00000000800026b4 <_ZN9Scheduler3putEP7KThread>:
{
    800026b4:	ff010113          	addi	sp,sp,-16
    800026b8:	00813423          	sd	s0,8(sp)
    800026bc:	01010413          	addi	s0,sp,16
    if (thread==nullptr) return;
    800026c0:	02058c63          	beqz	a1,800026f8 <_ZN9Scheduler3putEP7KThread+0x44>
    if (thread==idleThread) return;
    800026c4:	01053783          	ld	a5,16(a0)
    800026c8:	02b78863          	beq	a5,a1,800026f8 <_ZN9Scheduler3putEP7KThread+0x44>
    if (thread->status == KThread::FINISHED || thread->status == KThread::BLOCKED) return;
    800026cc:	0205a783          	lw	a5,32(a1)
    800026d0:	ffe7879b          	addiw	a5,a5,-2
    800026d4:	00100713          	li	a4,1
    800026d8:	02f77063          	bgeu	a4,a5,800026f8 <_ZN9Scheduler3putEP7KThread+0x44>
    thread->status = KThread::READY;
    800026dc:	0205a023          	sw	zero,32(a1)
    thread->next = nullptr;
    800026e0:	0005bc23          	sd	zero,24(a1)
    if (head==nullptr)
    800026e4:	00053783          	ld	a5,0(a0)
    800026e8:	00078e63          	beqz	a5,80002704 <_ZN9Scheduler3putEP7KThread+0x50>
    tail->next = thread;
    800026ec:	00853783          	ld	a5,8(a0)
    800026f0:	00b7bc23          	sd	a1,24(a5)
    tail= thread;
    800026f4:	00b53423          	sd	a1,8(a0)
}
    800026f8:	00813403          	ld	s0,8(sp)
    800026fc:	01010113          	addi	sp,sp,16
    80002700:	00008067          	ret
        head = thread;
    80002704:	00b53023          	sd	a1,0(a0)
        tail = thread;
    80002708:	00b53423          	sd	a1,8(a0)
        return;
    8000270c:	fedff06f          	j	800026f8 <_ZN9Scheduler3putEP7KThread+0x44>

0000000080002710 <_ZN9Scheduler3getEv>:
{
    80002710:	ff010113          	addi	sp,sp,-16
    80002714:	00813423          	sd	s0,8(sp)
    80002718:	01010413          	addi	s0,sp,16
    8000271c:	00050793          	mv	a5,a0
    if (head==nullptr) return idleThread;
    80002720:	00053503          	ld	a0,0(a0)
    80002724:	02050063          	beqz	a0,80002744 <_ZN9Scheduler3getEv+0x34>
    head=head->next;
    80002728:	01853703          	ld	a4,24(a0)
    8000272c:	00e7b023          	sd	a4,0(a5)
    if (head==nullptr) tail=nullptr;
    80002730:	00070e63          	beqz	a4,8000274c <_ZN9Scheduler3getEv+0x3c>
    thread->next = nullptr;
    80002734:	00053c23          	sd	zero,24(a0)
}
    80002738:	00813403          	ld	s0,8(sp)
    8000273c:	01010113          	addi	sp,sp,16
    80002740:	00008067          	ret
    if (head==nullptr) return idleThread;
    80002744:	0107b503          	ld	a0,16(a5)
    80002748:	ff1ff06f          	j	80002738 <_ZN9Scheduler3getEv+0x28>
    if (head==nullptr) tail=nullptr;
    8000274c:	0007b423          	sd	zero,8(a5)
    80002750:	fe5ff06f          	j	80002734 <_ZN9Scheduler3getEv+0x24>

0000000080002754 <_ZNK9Scheduler7isEmptyEv>:
{
    80002754:	ff010113          	addi	sp,sp,-16
    80002758:	00813423          	sd	s0,8(sp)
    8000275c:	01010413          	addi	s0,sp,16
    return head==nullptr;
    80002760:	00053503          	ld	a0,0(a0)
}
    80002764:	00153513          	seqz	a0,a0
    80002768:	00813403          	ld	s0,8(sp)
    8000276c:	01010113          	addi	sp,sp,16
    80002770:	00008067          	ret

0000000080002774 <_ZN9Scheduler13getIdleThreadEv>:
{
    80002774:	ff010113          	addi	sp,sp,-16
    80002778:	00813423          	sd	s0,8(sp)
    8000277c:	01010413          	addi	s0,sp,16
}
    80002780:	01053503          	ld	a0,16(a0)
    80002784:	00813403          	ld	s0,8(sp)
    80002788:	01010113          	addi	sp,sp,16
    8000278c:	00008067          	ret

0000000080002790 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "../test/System_Mode_test.hpp"

#endif

void userMain() {
    80002790:	fe010113          	addi	sp,sp,-32
    80002794:	00113c23          	sd	ra,24(sp)
    80002798:	00813823          	sd	s0,16(sp)
    8000279c:	00913423          	sd	s1,8(sp)
    800027a0:	01213023          	sd	s2,0(sp)
    800027a4:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800027a8:	00007517          	auipc	a0,0x7
    800027ac:	88050513          	addi	a0,a0,-1920 # 80009028 <CONSOLE_STATUS+0x18>
    800027b0:	00003097          	auipc	ra,0x3
    800027b4:	528080e7          	jalr	1320(ra) # 80005cd8 <_Z11printStringPKc>
    int test = getc() - '0';
    800027b8:	fffff097          	auipc	ra,0xfffff
    800027bc:	dc8080e7          	jalr	-568(ra) # 80001580 <_Z4getcv>
    800027c0:	00050913          	mv	s2,a0
    800027c4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800027c8:	fffff097          	auipc	ra,0xfffff
    800027cc:	db8080e7          	jalr	-584(ra) # 80001580 <_Z4getcv>
            printString("Nije navedeno da je zadatak 3 implementiran\n");
            return;
        }
    }

    if (test >= 5 && test <= 6) {
    800027d0:	fcb9091b          	addiw	s2,s2,-53
    800027d4:	00100793          	li	a5,1
    800027d8:	0327f463          	bgeu	a5,s2,80002800 <_Z8userMainv+0x70>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800027dc:	00700793          	li	a5,7
    800027e0:	0e97e263          	bltu	a5,s1,800028c4 <_Z8userMainv+0x134>
    800027e4:	00249493          	slli	s1,s1,0x2
    800027e8:	00007717          	auipc	a4,0x7
    800027ec:	a5870713          	addi	a4,a4,-1448 # 80009240 <CONSOLE_STATUS+0x230>
    800027f0:	00e484b3          	add	s1,s1,a4
    800027f4:	0004a783          	lw	a5,0(s1)
    800027f8:	00e787b3          	add	a5,a5,a4
    800027fc:	00078067          	jr	a5
            printString("Nije navedeno da je zadatak 4 implementiran\n");
    80002800:	00007517          	auipc	a0,0x7
    80002804:	84850513          	addi	a0,a0,-1976 # 80009048 <CONSOLE_STATUS+0x38>
    80002808:	00003097          	auipc	ra,0x3
    8000280c:	4d0080e7          	jalr	1232(ra) # 80005cd8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
}
    80002810:	01813083          	ld	ra,24(sp)
    80002814:	01013403          	ld	s0,16(sp)
    80002818:	00813483          	ld	s1,8(sp)
    8000281c:	00013903          	ld	s2,0(sp)
    80002820:	02010113          	addi	sp,sp,32
    80002824:	00008067          	ret
            Threads_C_API_test();
    80002828:	00003097          	auipc	ra,0x3
    8000282c:	b28080e7          	jalr	-1240(ra) # 80005350 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80002830:	00007517          	auipc	a0,0x7
    80002834:	84850513          	addi	a0,a0,-1976 # 80009078 <CONSOLE_STATUS+0x68>
    80002838:	00003097          	auipc	ra,0x3
    8000283c:	4a0080e7          	jalr	1184(ra) # 80005cd8 <_Z11printStringPKc>
            break;
    80002840:	fd1ff06f          	j	80002810 <_Z8userMainv+0x80>
            Threads_CPP_API_test();
    80002844:	00002097          	auipc	ra,0x2
    80002848:	9ec080e7          	jalr	-1556(ra) # 80004230 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    8000284c:	00007517          	auipc	a0,0x7
    80002850:	86c50513          	addi	a0,a0,-1940 # 800090b8 <CONSOLE_STATUS+0xa8>
    80002854:	00003097          	auipc	ra,0x3
    80002858:	484080e7          	jalr	1156(ra) # 80005cd8 <_Z11printStringPKc>
            break;
    8000285c:	fb5ff06f          	j	80002810 <_Z8userMainv+0x80>
            producerConsumer_C_API();
    80002860:	00001097          	auipc	ra,0x1
    80002864:	224080e7          	jalr	548(ra) # 80003a84 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80002868:	00007517          	auipc	a0,0x7
    8000286c:	89050513          	addi	a0,a0,-1904 # 800090f8 <CONSOLE_STATUS+0xe8>
    80002870:	00003097          	auipc	ra,0x3
    80002874:	468080e7          	jalr	1128(ra) # 80005cd8 <_Z11printStringPKc>
            break;
    80002878:	f99ff06f          	j	80002810 <_Z8userMainv+0x80>
            producerConsumer_CPP_Sync_API();
    8000287c:	00003097          	auipc	ra,0x3
    80002880:	e18080e7          	jalr	-488(ra) # 80005694 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80002884:	00007517          	auipc	a0,0x7
    80002888:	8c450513          	addi	a0,a0,-1852 # 80009148 <CONSOLE_STATUS+0x138>
    8000288c:	00003097          	auipc	ra,0x3
    80002890:	44c080e7          	jalr	1100(ra) # 80005cd8 <_Z11printStringPKc>
            break;
    80002894:	f7dff06f          	j	80002810 <_Z8userMainv+0x80>
            System_Mode_test();
    80002898:	00004097          	auipc	ra,0x4
    8000289c:	120080e7          	jalr	288(ra) # 800069b8 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800028a0:	00007517          	auipc	a0,0x7
    800028a4:	90050513          	addi	a0,a0,-1792 # 800091a0 <CONSOLE_STATUS+0x190>
    800028a8:	00003097          	auipc	ra,0x3
    800028ac:	430080e7          	jalr	1072(ra) # 80005cd8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800028b0:	00007517          	auipc	a0,0x7
    800028b4:	91050513          	addi	a0,a0,-1776 # 800091c0 <CONSOLE_STATUS+0x1b0>
    800028b8:	00003097          	auipc	ra,0x3
    800028bc:	420080e7          	jalr	1056(ra) # 80005cd8 <_Z11printStringPKc>
            break;
    800028c0:	f51ff06f          	j	80002810 <_Z8userMainv+0x80>
            printString("Niste uneli odgovarajuci broj za test\n");
    800028c4:	00007517          	auipc	a0,0x7
    800028c8:	95450513          	addi	a0,a0,-1708 # 80009218 <CONSOLE_STATUS+0x208>
    800028cc:	00003097          	auipc	ra,0x3
    800028d0:	40c080e7          	jalr	1036(ra) # 80005cd8 <_Z11printStringPKc>
    800028d4:	f3dff06f          	j	80002810 <_Z8userMainv+0x80>

00000000800028d8 <_ZL15userMainWrapperPv>:

static void userMainWrapper(void*)
{
    800028d8:	ff010113          	addi	sp,sp,-16
    800028dc:	00113423          	sd	ra,8(sp)
    800028e0:	00813023          	sd	s0,0(sp)
    800028e4:	01010413          	addi	s0,sp,16
    userMain();
    800028e8:	00000097          	auipc	ra,0x0
    800028ec:	ea8080e7          	jalr	-344(ra) # 80002790 <_Z8userMainv>
}
    800028f0:	00813083          	ld	ra,8(sp)
    800028f4:	00013403          	ld	s0,0(sp)
    800028f8:	01010113          	addi	sp,sp,16
    800028fc:	00008067          	ret

0000000080002900 <main>:


int main()
{
    80002900:	fe010113          	addi	sp,sp,-32
    80002904:	00113c23          	sd	ra,24(sp)
    80002908:	00813823          	sd	s0,16(sp)
    8000290c:	00913423          	sd	s1,8(sp)
    80002910:	01213023          	sd	s2,0(sp)
    80002914:	02010413          	addi	s0,sp,32
    __asm__ volatile("csrw stvec,%0"::"r"((uint64)&trapFun));
    80002918:	00009797          	auipc	a5,0x9
    8000291c:	0f87b783          	ld	a5,248(a5) # 8000ba10 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002920:	10579073          	csrw	stvec,a5
    80002924:	0000a797          	auipc	a5,0xa
    80002928:	37c7c783          	lbu	a5,892(a5) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    8000292c:	02079263          	bnez	a5,80002950 <main+0x50>
    Scheduler():head(nullptr),tail(nullptr),idleThread(nullptr){};
    80002930:	0000a797          	auipc	a5,0xa
    80002934:	37878793          	addi	a5,a5,888 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80002938:	0007b023          	sd	zero,0(a5)
    8000293c:	0007b423          	sd	zero,8(a5)
    80002940:	0007b823          	sd	zero,16(a5)
        static Scheduler instance;
    80002944:	00100793          	li	a5,1
    80002948:	0000a717          	auipc	a4,0xa
    8000294c:	34f70c23          	sb	a5,856(a4) # 8000cca0 <_ZGVZN9Scheduler11getInstanceEvE8instance>
    if(Scheduler::getInstance().init()<0)
    80002950:	0000a517          	auipc	a0,0xa
    80002954:	35850513          	addi	a0,a0,856 # 8000cca8 <_ZZN9Scheduler11getInstanceEvE8instance>
    80002958:	00000097          	auipc	ra,0x0
    8000295c:	c7c080e7          	jalr	-900(ra) # 800025d4 <_ZN9Scheduler4initEv>
    80002960:	00055463          	bgez	a0,80002968 <main+0x68>
    {
        while(true) {}
    80002964:	0000006f          	j	80002964 <main+0x64>
    }
    KThread* initThread = KThread::allocate(nullptr, nullptr);
    80002968:	00000593          	li	a1,0
    8000296c:	00000513          	li	a0,0
    80002970:	fffff097          	auipc	ra,0xfffff
    80002974:	ef4080e7          	jalr	-268(ra) # 80001864 <_ZN7KThread8allocateEPFvPvES0_>
    80002978:	00050913          	mv	s2,a0
    KThread* mainThread = KThread::allocate(userMainWrapper, nullptr);
    8000297c:	00000593          	li	a1,0
    80002980:	00000517          	auipc	a0,0x0
    80002984:	f5850513          	addi	a0,a0,-168 # 800028d8 <_ZL15userMainWrapperPv>
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	edc080e7          	jalr	-292(ra) # 80001864 <_ZN7KThread8allocateEPFvPvES0_>
    80002990:	00050493          	mv	s1,a0
    if(initThread==nullptr || mainThread== nullptr){
    80002994:	04090463          	beqz	s2,800029dc <main+0xdc>
    80002998:	04050263          	beqz	a0,800029dc <main+0xdc>
        while(true) {}
    }
    mainThread->kernelStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    8000299c:	04000513          	li	a0,64
    800029a0:	00000097          	auipc	ra,0x0
    800029a4:	9d8080e7          	jalr	-1576(ra) # 80002378 <_ZN12MemAllocator9mem_allocEm>
    800029a8:	02a4bc23          	sd	a0,56(s1)
    mainThread->userStack = MemAllocator::mem_alloc(DEFAULT_STACK_SIZE/MEM_BLOCK_SIZE);
    800029ac:	04000513          	li	a0,64
    800029b0:	00000097          	auipc	ra,0x0
    800029b4:	9c8080e7          	jalr	-1592(ra) # 80002378 <_ZN12MemAllocator9mem_allocEm>
    800029b8:	04a4b023          	sd	a0,64(s1)
    if(mainThread->kernelStack == nullptr|| mainThread->userStack == nullptr)
    800029bc:	0384b703          	ld	a4,56(s1)
    800029c0:	02070063          	beqz	a4,800029e0 <main+0xe0>
    800029c4:	00050e63          	beqz	a0,800029e0 <main+0xe0>
    {
        while(true){}
    }
    if(KThread::initializeUserContext(mainThread)<0)
    800029c8:	00048513          	mv	a0,s1
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	25c080e7          	jalr	604(ra) # 80001c28 <_ZN7KThread21initializeUserContextEPS_>
    800029d4:	00055863          	bgez	a0,800029e4 <main+0xe4>
    {
        while(true){}
    800029d8:	0000006f          	j	800029d8 <main+0xd8>
        while(true) {}
    800029dc:	0000006f          	j	800029dc <main+0xdc>
        while(true){}
    800029e0:	0000006f          	j	800029e0 <main+0xe0>
    }
    initThread->status = KThread::RUNNING;
    800029e4:	00100793          	li	a5,1
    800029e8:	02f92023          	sw	a5,32(s2)
    KThread::running = mainThread;
    800029ec:	00009717          	auipc	a4,0x9
    800029f0:	03c73703          	ld	a4,60(a4) # 8000ba28 <_GLOBAL_OFFSET_TABLE_+0x48>
    800029f4:	00973023          	sd	s1,0(a4)
    mainThread->status = KThread::RUNNING;
    800029f8:	02f4a023          	sw	a5,32(s1)
    yield(initThread,mainThread);
    800029fc:	00048593          	mv	a1,s1
    80002a00:	00090513          	mv	a0,s2
    80002a04:	ffffe097          	auipc	ra,0xffffe
    80002a08:	6cc080e7          	jalr	1740(ra) # 800010d0 <yield>
    while(true)
    {
        __asm__ volatile("nop");
    80002a0c:	00000013          	nop
    while(true)
    80002a10:	ffdff06f          	j	80002a0c <main+0x10c>

0000000080002a14 <_ZN6Thread10runWrapperEPv>:
}

void Thread::runWrapper(void *thread)
{
    Thread* object = (Thread*)thread;
    if (object != nullptr)
    80002a14:	02050863          	beqz	a0,80002a44 <_ZN6Thread10runWrapperEPv+0x30>
{
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	00813023          	sd	s0,0(sp)
    80002a24:	01010413          	addi	s0,sp,16
    {
        object->run();
    80002a28:	00053783          	ld	a5,0(a0)
    80002a2c:	0107b783          	ld	a5,16(a5)
    80002a30:	000780e7          	jalr	a5
    }
}
    80002a34:	00813083          	ld	ra,8(sp)
    80002a38:	00013403          	ld	s0,0(sp)
    80002a3c:	01010113          	addi	sp,sp,16
    80002a40:	00008067          	ret
    80002a44:	00008067          	ret

0000000080002a48 <_ZN6ThreadD1Ev>:
int Thread::sleep(time_t)
{
    return -1;
}

Thread::~Thread()
    80002a48:	ff010113          	addi	sp,sp,-16
    80002a4c:	00813423          	sd	s0,8(sp)
    80002a50:	01010413          	addi	s0,sp,16
{

}
    80002a54:	00813403          	ld	s0,8(sp)
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00008067          	ret

0000000080002a60 <_ZN6ThreadD0Ev>:
Thread::~Thread()
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
}
    80002a70:	fffff097          	auipc	ra,0xfffff
    80002a74:	7b4080e7          	jalr	1972(ra) # 80002224 <_ZdlPv>
    80002a78:	00813083          	ld	ra,8(sp)
    80002a7c:	00013403          	ld	s0,0(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret

0000000080002a88 <_ZN9SemaphoreD1Ev>:
Semaphore::Semaphore(unsigned init):myHandle(nullptr)
{
    sem_open(&myHandle,init);
}

Semaphore::~Semaphore()
    80002a88:	00009797          	auipc	a5,0x9
    80002a8c:	d9078793          	addi	a5,a5,-624 # 8000b818 <_ZTV9Semaphore+0x10>
    80002a90:	00f53023          	sd	a5,0(a0)
{
    if (myHandle!=nullptr)
    80002a94:	00853503          	ld	a0,8(a0)
    80002a98:	02050663          	beqz	a0,80002ac4 <_ZN9SemaphoreD1Ev+0x3c>
Semaphore::~Semaphore()
    80002a9c:	ff010113          	addi	sp,sp,-16
    80002aa0:	00113423          	sd	ra,8(sp)
    80002aa4:	00813023          	sd	s0,0(sp)
    80002aa8:	01010413          	addi	s0,sp,16
    {
        sem_close(myHandle);
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	97c080e7          	jalr	-1668(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
        myHandle = nullptr;
    }
}
    80002ab4:	00813083          	ld	ra,8(sp)
    80002ab8:	00013403          	ld	s0,0(sp)
    80002abc:	01010113          	addi	sp,sp,16
    80002ac0:	00008067          	ret
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore()
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	02010413          	addi	s0,sp,32
    80002adc:	00050493          	mv	s1,a0
}
    80002ae0:	00000097          	auipc	ra,0x0
    80002ae4:	fa8080e7          	jalr	-88(ra) # 80002a88 <_ZN9SemaphoreD1Ev>
    80002ae8:	00048513          	mv	a0,s1
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	738080e7          	jalr	1848(ra) # 80002224 <_ZdlPv>
    80002af4:	01813083          	ld	ra,24(sp)
    80002af8:	01013403          	ld	s0,16(sp)
    80002afc:	00813483          	ld	s1,8(sp)
    80002b00:	02010113          	addi	sp,sp,32
    80002b04:	00008067          	ret

0000000080002b08 <_Z10time_sleepm>:
{
    80002b08:	ff010113          	addi	sp,sp,-16
    80002b0c:	00813423          	sd	s0,8(sp)
    80002b10:	01010413          	addi	s0,sp,16
}
    80002b14:	fff00513          	li	a0,-1
    80002b18:	00813403          	ld	s0,8(sp)
    80002b1c:	01010113          	addi	sp,sp,16
    80002b20:	00008067          	ret

0000000080002b24 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg):myHandle(nullptr),body(body),arg(arg)
    80002b24:	ff010113          	addi	sp,sp,-16
    80002b28:	00813423          	sd	s0,8(sp)
    80002b2c:	01010413          	addi	s0,sp,16
    80002b30:	00009797          	auipc	a5,0x9
    80002b34:	cc078793          	addi	a5,a5,-832 # 8000b7f0 <_ZTV6Thread+0x10>
    80002b38:	00f53023          	sd	a5,0(a0)
    80002b3c:	00053423          	sd	zero,8(a0)
    80002b40:	00b53823          	sd	a1,16(a0)
    80002b44:	00c53c23          	sd	a2,24(a0)
}
    80002b48:	00813403          	ld	s0,8(sp)
    80002b4c:	01010113          	addi	sp,sp,16
    80002b50:	00008067          	ret

0000000080002b54 <_ZN6ThreadC1Ev>:
Thread::Thread():myHandle(nullptr),body(nullptr),arg(nullptr)
    80002b54:	ff010113          	addi	sp,sp,-16
    80002b58:	00813423          	sd	s0,8(sp)
    80002b5c:	01010413          	addi	s0,sp,16
    80002b60:	00009797          	auipc	a5,0x9
    80002b64:	c9078793          	addi	a5,a5,-880 # 8000b7f0 <_ZTV6Thread+0x10>
    80002b68:	00f53023          	sd	a5,0(a0)
    80002b6c:	00053423          	sd	zero,8(a0)
    80002b70:	00053823          	sd	zero,16(a0)
    80002b74:	00053c23          	sd	zero,24(a0)
}
    80002b78:	00813403          	ld	s0,8(sp)
    80002b7c:	01010113          	addi	sp,sp,16
    80002b80:	00008067          	ret

0000000080002b84 <_ZN6Thread5startEv>:
    if (myHandle!=nullptr)
    80002b84:	00853783          	ld	a5,8(a0)
    80002b88:	04079c63          	bnez	a5,80002be0 <_ZN6Thread5startEv+0x5c>
{
    80002b8c:	ff010113          	addi	sp,sp,-16
    80002b90:	00113423          	sd	ra,8(sp)
    80002b94:	00813023          	sd	s0,0(sp)
    80002b98:	01010413          	addi	s0,sp,16
    if (body!=nullptr)
    80002b9c:	01053583          	ld	a1,16(a0)
    80002ba0:	02058263          	beqz	a1,80002bc4 <_ZN6Thread5startEv+0x40>
        return thread_create(&myHandle,body,arg);
    80002ba4:	01853603          	ld	a2,24(a0)
    80002ba8:	00850513          	addi	a0,a0,8
    80002bac:	ffffe097          	auipc	ra,0xffffe
    80002bb0:	6f4080e7          	jalr	1780(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
}
    80002bb4:	00813083          	ld	ra,8(sp)
    80002bb8:	00013403          	ld	s0,0(sp)
    80002bbc:	01010113          	addi	sp,sp,16
    80002bc0:	00008067          	ret
    return thread_create(&myHandle,&Thread::runWrapper,this);
    80002bc4:	00050613          	mv	a2,a0
    80002bc8:	00000597          	auipc	a1,0x0
    80002bcc:	e4c58593          	addi	a1,a1,-436 # 80002a14 <_ZN6Thread10runWrapperEPv>
    80002bd0:	00850513          	addi	a0,a0,8
    80002bd4:	ffffe097          	auipc	ra,0xffffe
    80002bd8:	6cc080e7          	jalr	1740(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    80002bdc:	fd9ff06f          	j	80002bb4 <_ZN6Thread5startEv+0x30>
        return -1;
    80002be0:	fff00513          	li	a0,-1
}
    80002be4:	00008067          	ret

0000000080002be8 <_ZN6Thread8dispatchEv>:
{
    80002be8:	ff010113          	addi	sp,sp,-16
    80002bec:	00113423          	sd	ra,8(sp)
    80002bf0:	00813023          	sd	s0,0(sp)
    80002bf4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002bf8:	ffffe097          	auipc	ra,0xffffe
    80002bfc:	7a8080e7          	jalr	1960(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80002c00:	00813083          	ld	ra,8(sp)
    80002c04:	00013403          	ld	s0,0(sp)
    80002c08:	01010113          	addi	sp,sp,16
    80002c0c:	00008067          	ret

0000000080002c10 <_ZN6Thread5sleepEm>:
{
    80002c10:	ff010113          	addi	sp,sp,-16
    80002c14:	00813423          	sd	s0,8(sp)
    80002c18:	01010413          	addi	s0,sp,16
}
    80002c1c:	fff00513          	li	a0,-1
    80002c20:	00813403          	ld	s0,8(sp)
    80002c24:	01010113          	addi	sp,sp,16
    80002c28:	00008067          	ret

0000000080002c2c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned init):myHandle(nullptr)
    80002c2c:	ff010113          	addi	sp,sp,-16
    80002c30:	00113423          	sd	ra,8(sp)
    80002c34:	00813023          	sd	s0,0(sp)
    80002c38:	01010413          	addi	s0,sp,16
    80002c3c:	00009797          	auipc	a5,0x9
    80002c40:	bdc78793          	addi	a5,a5,-1060 # 8000b818 <_ZTV9Semaphore+0x10>
    80002c44:	00f53023          	sd	a5,0(a0)
    80002c48:	00053423          	sd	zero,8(a0)
    sem_open(&myHandle,init);
    80002c4c:	00850513          	addi	a0,a0,8
    80002c50:	ffffe097          	auipc	ra,0xffffe
    80002c54:	78c080e7          	jalr	1932(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
}
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN9Semaphore4waitEv>:
int Semaphore::wait()
{
    if (myHandle==nullptr)
    80002c68:	00853503          	ld	a0,8(a0)
    80002c6c:	02050663          	beqz	a0,80002c98 <_ZN9Semaphore4waitEv+0x30>
{
    80002c70:	ff010113          	addi	sp,sp,-16
    80002c74:	00113423          	sd	ra,8(sp)
    80002c78:	00813023          	sd	s0,0(sp)
    80002c7c:	01010413          	addi	s0,sp,16
    {
        return -1;
    }
    return sem_wait(myHandle);
    80002c80:	ffffe097          	auipc	ra,0xffffe
    80002c84:	7e8080e7          	jalr	2024(ra) # 80001468 <_Z8sem_waitP10KSemaphore>
}
    80002c88:	00813083          	ld	ra,8(sp)
    80002c8c:	00013403          	ld	s0,0(sp)
    80002c90:	01010113          	addi	sp,sp,16
    80002c94:	00008067          	ret
        return -1;
    80002c98:	fff00513          	li	a0,-1
}
    80002c9c:	00008067          	ret

0000000080002ca0 <_ZN9Semaphore6signalEv>:

int Semaphore::signal()
{
    if (myHandle==nullptr)
    80002ca0:	00853503          	ld	a0,8(a0)
    80002ca4:	02050663          	beqz	a0,80002cd0 <_ZN9Semaphore6signalEv+0x30>
{
    80002ca8:	ff010113          	addi	sp,sp,-16
    80002cac:	00113423          	sd	ra,8(sp)
    80002cb0:	00813023          	sd	s0,0(sp)
    80002cb4:	01010413          	addi	s0,sp,16
    {
        return -1;
    }
    return sem_signal(myHandle);
    80002cb8:	ffffe097          	auipc	ra,0xffffe
    80002cbc:	7f0080e7          	jalr	2032(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>
}
    80002cc0:	00813083          	ld	ra,8(sp)
    80002cc4:	00013403          	ld	s0,0(sp)
    80002cc8:	01010113          	addi	sp,sp,16
    80002ccc:	00008067          	ret
        return -1;
    80002cd0:	fff00513          	li	a0,-1
}
    80002cd4:	00008067          	ret

0000000080002cd8 <_ZN7Console4getcEv>:

char Console::getc()
{
    80002cd8:	ff010113          	addi	sp,sp,-16
    80002cdc:	00113423          	sd	ra,8(sp)
    80002ce0:	00813023          	sd	s0,0(sp)
    80002ce4:	01010413          	addi	s0,sp,16
    return ::getc();
    80002ce8:	fffff097          	auipc	ra,0xfffff
    80002cec:	898080e7          	jalr	-1896(ra) # 80001580 <_Z4getcv>
}
    80002cf0:	00813083          	ld	ra,8(sp)
    80002cf4:	00013403          	ld	s0,0(sp)
    80002cf8:	01010113          	addi	sp,sp,16
    80002cfc:	00008067          	ret

0000000080002d00 <_ZN7Console4putcEc>:

void Console::putc(char c)
{
    80002d00:	ff010113          	addi	sp,sp,-16
    80002d04:	00113423          	sd	ra,8(sp)
    80002d08:	00813023          	sd	s0,0(sp)
    80002d0c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	8b0080e7          	jalr	-1872(ra) # 800015c0 <_Z4putcc>
}
    80002d18:	00813083          	ld	ra,8(sp)
    80002d1c:	00013403          	ld	s0,0(sp)
    80002d20:	01010113          	addi	sp,sp,16
    80002d24:	00008067          	ret

0000000080002d28 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period):Thread(),period(period)
    80002d28:	fe010113          	addi	sp,sp,-32
    80002d2c:	00113c23          	sd	ra,24(sp)
    80002d30:	00813823          	sd	s0,16(sp)
    80002d34:	00913423          	sd	s1,8(sp)
    80002d38:	01213023          	sd	s2,0(sp)
    80002d3c:	02010413          	addi	s0,sp,32
    80002d40:	00050493          	mv	s1,a0
    80002d44:	00058913          	mv	s2,a1
    80002d48:	00000097          	auipc	ra,0x0
    80002d4c:	e0c080e7          	jalr	-500(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80002d50:	00009797          	auipc	a5,0x9
    80002d54:	a7078793          	addi	a5,a5,-1424 # 8000b7c0 <_ZTV14PeriodicThread+0x10>
    80002d58:	00f4b023          	sd	a5,0(s1)
    80002d5c:	0324b023          	sd	s2,32(s1)
{

}
    80002d60:	01813083          	ld	ra,24(sp)
    80002d64:	01013403          	ld	s0,16(sp)
    80002d68:	00813483          	ld	s1,8(sp)
    80002d6c:	00013903          	ld	s2,0(sp)
    80002d70:	02010113          	addi	sp,sp,32
    80002d74:	00008067          	ret

0000000080002d78 <_ZN14PeriodicThread9terminateEv>:

void PeriodicThread::terminate()
{
    80002d78:	ff010113          	addi	sp,sp,-16
    80002d7c:	00813423          	sd	s0,8(sp)
    80002d80:	01010413          	addi	s0,sp,16
    period=0;
    80002d84:	02053023          	sd	zero,32(a0)
    80002d88:	00813403          	ld	s0,8(sp)
    80002d8c:	01010113          	addi	sp,sp,16
    80002d90:	00008067          	ret

0000000080002d94 <_ZN6Thread3runEv>:
    static void dispatch();
    static int sleep(time_t);
protected:
    Thread();

    virtual void run()
    80002d94:	ff010113          	addi	sp,sp,-16
    80002d98:	00813423          	sd	s0,8(sp)
    80002d9c:	01010413          	addi	s0,sp,16
    {
    }
    80002da0:	00813403          	ld	s0,8(sp)
    80002da4:	01010113          	addi	sp,sp,16
    80002da8:	00008067          	ret

0000000080002dac <_ZN14PeriodicThread18periodicActivationEv>:
public:
    void terminate();

protected:
    PeriodicThread(time_t period);
    virtual void periodicActivation()
    80002dac:	ff010113          	addi	sp,sp,-16
    80002db0:	00813423          	sd	s0,8(sp)
    80002db4:	01010413          	addi	s0,sp,16
    {
    }
    80002db8:	00813403          	ld	s0,8(sp)
    80002dbc:	01010113          	addi	sp,sp,16
    80002dc0:	00008067          	ret

0000000080002dc4 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread:public Thread
    80002dc4:	ff010113          	addi	sp,sp,-16
    80002dc8:	00813423          	sd	s0,8(sp)
    80002dcc:	01010413          	addi	s0,sp,16
    80002dd0:	00009797          	auipc	a5,0x9
    80002dd4:	9f078793          	addi	a5,a5,-1552 # 8000b7c0 <_ZTV14PeriodicThread+0x10>
    80002dd8:	00f53023          	sd	a5,0(a0)
    80002ddc:	00813403          	ld	s0,8(sp)
    80002de0:	01010113          	addi	sp,sp,16
    80002de4:	00008067          	ret

0000000080002de8 <_ZN14PeriodicThreadD0Ev>:
    80002de8:	ff010113          	addi	sp,sp,-16
    80002dec:	00113423          	sd	ra,8(sp)
    80002df0:	00813023          	sd	s0,0(sp)
    80002df4:	01010413          	addi	s0,sp,16
    80002df8:	00009797          	auipc	a5,0x9
    80002dfc:	9c878793          	addi	a5,a5,-1592 # 8000b7c0 <_ZTV14PeriodicThread+0x10>
    80002e00:	00f53023          	sd	a5,0(a0)
    80002e04:	fffff097          	auipc	ra,0xfffff
    80002e08:	420080e7          	jalr	1056(ra) # 80002224 <_ZdlPv>
    80002e0c:	00813083          	ld	ra,8(sp)
    80002e10:	00013403          	ld	s0,0(sp)
    80002e14:	01010113          	addi	sp,sp,16
    80002e18:	00008067          	ret

0000000080002e1c <trapHandle>:
volatile int debugBranch = 0;

extern "C" void console_handler();

//handler za rutiranje koji syscall se poziva
extern "C" void trapHandle(TrapFrame* frame){
    80002e1c:	fd010113          	addi	sp,sp,-48
    80002e20:	02113423          	sd	ra,40(sp)
    80002e24:	02813023          	sd	s0,32(sp)
    80002e28:	00913c23          	sd	s1,24(sp)
    80002e2c:	01213823          	sd	s2,16(sp)
    80002e30:	01313423          	sd	s3,8(sp)
    80002e34:	03010413          	addi	s0,sp,48
    80002e38:	00050493          	mv	s1,a0
    uint64 scause;
    __asm__ volatile("csrr %0, scause":"=r"(scause));
    80002e3c:	14202973          	csrr	s2,scause

    bool isInterrupt = (scause >>63)!=0;
    80002e40:	00090713          	mv	a4,s2
    uint64 causeCode = scause & ~(1ULL<<63);
    80002e44:	fff00793          	li	a5,-1
    80002e48:	0017d793          	srli	a5,a5,0x1
    80002e4c:	00f977b3          	and	a5,s2,a5
    if(isInterrupt && causeCode==1)
    80002e50:	0a094263          	bltz	s2,80002ef4 <trapHandle+0xd8>
    {
        __asm__ volatile("csrc sip,%0": :"r"(1ULL<<1));//setuje bit 1 sip na 0
        return;
    }
    if(isInterrupt && causeCode==9)
    80002e54:	0c074663          	bltz	a4,80002f20 <trapHandle+0x104>
        {
            plic_complete(irq);
        }
        return;
    }
    if(!isInterrupt && (causeCode==8 || causeCode==9))
    80002e58:	00074863          	bltz	a4,80002e68 <trapHandle+0x4c>
    80002e5c:	ff878693          	addi	a3,a5,-8
    80002e60:	00100613          	li	a2,1
    80002e64:	0cd67e63          	bgeu	a2,a3,80002f40 <trapHandle+0x124>
                break;
            }
        }
        return;
    }
    if (!isInterrupt && (causeCode==2 || causeCode==5 || causeCode==7))
    80002e68:	06074063          	bltz	a4,80002ec8 <trapHandle+0xac>
    80002e6c:	00200713          	li	a4,2
    80002e70:	00e78a63          	beq	a5,a4,80002e84 <trapHandle+0x68>
    80002e74:	00500713          	li	a4,5
    80002e78:	00e78663          	beq	a5,a4,80002e84 <trapHandle+0x68>
    80002e7c:	00700713          	li	a4,7
    80002e80:	04e79463          	bne	a5,a4,80002ec8 <trapHandle+0xac>
    {
        if (causeCode==2)
    80002e84:	00200713          	li	a4,2
    80002e88:	32e78a63          	beq	a5,a4,800031bc <trapHandle+0x3a0>
        {
            KConsole::putc('E');
            KConsole::putc('2');
            KConsole::putc('\n');
        }
        else if (causeCode==5)
    80002e8c:	00500713          	li	a4,5
    80002e90:	34e78a63          	beq	a5,a4,800031e4 <trapHandle+0x3c8>
            KConsole::putc('5');
            KConsole::putc('\n');
        }
        else
        {
            KConsole::putc('E');
    80002e94:	04500513          	li	a0,69
    80002e98:	fffff097          	auipc	ra,0xfffff
    80002e9c:	430080e7          	jalr	1072(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('7');
    80002ea0:	03700513          	li	a0,55
    80002ea4:	fffff097          	auipc	ra,0xfffff
    80002ea8:	424080e7          	jalr	1060(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('\n');
    80002eac:	00a00513          	li	a0,10
    80002eb0:	fffff097          	auipc	ra,0xfffff
    80002eb4:	418080e7          	jalr	1048(ra) # 800022c8 <_ZN8KConsole4putcEc>
        }
        volatile uint32* qemuExit = (volatile uint32*)0x100000;
        *qemuExit = 0x5555;
    80002eb8:	00100737          	lui	a4,0x100
    80002ebc:	000057b7          	lui	a5,0x5
    80002ec0:	5557879b          	addiw	a5,a5,1365
    80002ec4:	00f72023          	sw	a5,0(a4) # 100000 <_entry-0x7ff00000>
    }
    debugScause=scause;
    80002ec8:	0009091b          	sext.w	s2,s2
    80002ecc:	0000a797          	auipc	a5,0xa
    80002ed0:	e0478793          	addi	a5,a5,-508 # 8000ccd0 <debugScause>
    80002ed4:	0127a023          	sw	s2,0(a5)
    debugSepc = frame->sepc;
    80002ed8:	0804a703          	lw	a4,128(s1)
    80002edc:	00e7a223          	sw	a4,4(a5)
    uint64 stval;
    __asm__ volatile("csrr %0,stval":"=r"(stval));
    80002ee0:	14302773          	csrr	a4,stval
    debugStval =stval;
    80002ee4:	0007071b          	sext.w	a4,a4
    80002ee8:	00e7a423          	sw	a4,8(a5)
    while(true)
    {
        __asm__ volatile("nop");
    80002eec:	00000013          	nop
    while(true)
    80002ef0:	ffdff06f          	j	80002eec <trapHandle+0xd0>
    if(isInterrupt && causeCode==1)
    80002ef4:	00100693          	li	a3,1
    80002ef8:	f4d79ee3          	bne	a5,a3,80002e54 <trapHandle+0x38>
        __asm__ volatile("csrc sip,%0": :"r"(1ULL<<1));//setuje bit 1 sip na 0
    80002efc:	00200793          	li	a5,2
    80002f00:	1447b073          	csrc	sip,a5
    }

}
    80002f04:	02813083          	ld	ra,40(sp)
    80002f08:	02013403          	ld	s0,32(sp)
    80002f0c:	01813483          	ld	s1,24(sp)
    80002f10:	01013903          	ld	s2,16(sp)
    80002f14:	00813983          	ld	s3,8(sp)
    80002f18:	03010113          	addi	sp,sp,48
    80002f1c:	00008067          	ret
    if(isInterrupt && causeCode==9)
    80002f20:	00900693          	li	a3,9
    80002f24:	f2d79ae3          	bne	a5,a3,80002e58 <trapHandle+0x3c>
        int irq = plic_claim();
    80002f28:	00004097          	auipc	ra,0x4
    80002f2c:	70c080e7          	jalr	1804(ra) # 80007634 <plic_claim>
        if(irq!=0)
    80002f30:	fc050ae3          	beqz	a0,80002f04 <trapHandle+0xe8>
            plic_complete(irq);
    80002f34:	00004097          	auipc	ra,0x4
    80002f38:	738080e7          	jalr	1848(ra) # 8000766c <plic_complete>
        return;
    80002f3c:	fc9ff06f          	j	80002f04 <trapHandle+0xe8>
        uint64 syscallCode = frame->a0;
    80002f40:	0084b783          	ld	a5,8(s1)
        frame->sepc+=4;
    80002f44:	0804b703          	ld	a4,128(s1)
    80002f48:	00470713          	addi	a4,a4,4
    80002f4c:	08e4b023          	sd	a4,128(s1)
        switch(syscallCode)
    80002f50:	04200713          	li	a4,66
    80002f54:	24f76e63          	bltu	a4,a5,800031b0 <trapHandle+0x394>
    80002f58:	00279793          	slli	a5,a5,0x2
    80002f5c:	00006717          	auipc	a4,0x6
    80002f60:	30470713          	addi	a4,a4,772 # 80009260 <CONSOLE_STATUS+0x250>
    80002f64:	00e787b3          	add	a5,a5,a4
    80002f68:	0007a783          	lw	a5,0(a5)
    80002f6c:	00e787b3          	add	a5,a5,a4
    80002f70:	00078067          	jr	a5
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
    80002f74:	0104b903          	ld	s2,16(s1)
                unsigned n = (unsigned)frame->a2;
    80002f78:	0184a983          	lw	s3,24(s1)
                if (!KSemaphore::isAllocated(semaphore))
    80002f7c:	00090513          	mv	a0,s2
    80002f80:	00000097          	auipc	ra,0x0
    80002f84:	4d4080e7          	jalr	1236(ra) # 80003454 <_ZN10KSemaphore11isAllocatedEPKS_>
    80002f88:	00051863          	bnez	a0,80002f98 <trapHandle+0x17c>
                    frame->a0 = (uint64)-1;
    80002f8c:	fff00793          	li	a5,-1
    80002f90:	00f4b423          	sd	a5,8(s1)
                    break;
    80002f94:	f71ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64)semaphore->waitN(n);
    80002f98:	00098593          	mv	a1,s3
    80002f9c:	00090513          	mv	a0,s2
    80002fa0:	00000097          	auipc	ra,0x0
    80002fa4:	61c080e7          	jalr	1564(ra) # 800035bc <_ZN10KSemaphore5waitNEj>
    80002fa8:	00a4b423          	sd	a0,8(s1)
                break;
    80002fac:	f59ff06f          	j	80002f04 <trapHandle+0xe8>
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
    80002fb0:	0104b903          	ld	s2,16(s1)
                unsigned n = (unsigned)frame->a2;
    80002fb4:	0184a983          	lw	s3,24(s1)
                if (!KSemaphore::isAllocated(semaphore))
    80002fb8:	00090513          	mv	a0,s2
    80002fbc:	00000097          	auipc	ra,0x0
    80002fc0:	498080e7          	jalr	1176(ra) # 80003454 <_ZN10KSemaphore11isAllocatedEPKS_>
    80002fc4:	00051863          	bnez	a0,80002fd4 <trapHandle+0x1b8>
                    frame->a0 = (uint64)-1;
    80002fc8:	fff00793          	li	a5,-1
    80002fcc:	00f4b423          	sd	a5,8(s1)
                    break;
    80002fd0:	f35ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64)semaphore->signalN(n);
    80002fd4:	00098593          	mv	a1,s3
    80002fd8:	00090513          	mv	a0,s2
    80002fdc:	00000097          	auipc	ra,0x0
    80002fe0:	700080e7          	jalr	1792(ra) # 800036dc <_ZN10KSemaphore7signalNEj>
    80002fe4:	00a4b423          	sd	a0,8(s1)
                break;
    80002fe8:	f1dff06f          	j	80002f04 <trapHandle+0xe8>
                sem_t* handle = (sem_t*)frame->a1;
    80002fec:	0104b903          	ld	s2,16(s1)
                unsigned init = (unsigned) frame->a2;
    80002ff0:	0184a503          	lw	a0,24(s1)
                if (handle==nullptr)
    80002ff4:	00091863          	bnez	s2,80003004 <trapHandle+0x1e8>
                    frame->a1 = (uint64)-1;
    80002ff8:	fff00793          	li	a5,-1
    80002ffc:	00f4b823          	sd	a5,16(s1)
                    break;
    80003000:	f05ff06f          	j	80002f04 <trapHandle+0xe8>
                KSemaphore* semaphore = KSemaphore::allocate(init);
    80003004:	00000097          	auipc	ra,0x0
    80003008:	300080e7          	jalr	768(ra) # 80003304 <_ZN10KSemaphore8allocateEj>
                if (semaphore==nullptr)
    8000300c:	00050863          	beqz	a0,8000301c <trapHandle+0x200>
                *handle = semaphore;
    80003010:	00a93023          	sd	a0,0(s2)
                frame->a0 = 0;
    80003014:	0004b423          	sd	zero,8(s1)
                break;
    80003018:	eedff06f          	j	80002f04 <trapHandle+0xe8>
                    frame->a0 = (uint64)-2;
    8000301c:	ffe00793          	li	a5,-2
    80003020:	00f4b423          	sd	a5,8(s1)
                    break;
    80003024:	ee1ff06f          	j	80002f04 <trapHandle+0xe8>
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
    80003028:	0104b903          	ld	s2,16(s1)
                if (!KSemaphore::isAllocated(semaphore))
    8000302c:	00090513          	mv	a0,s2
    80003030:	00000097          	auipc	ra,0x0
    80003034:	424080e7          	jalr	1060(ra) # 80003454 <_ZN10KSemaphore11isAllocatedEPKS_>
    80003038:	00051863          	bnez	a0,80003048 <trapHandle+0x22c>
                    frame->a0 = (uint64)-1;
    8000303c:	fff00793          	li	a5,-1
    80003040:	00f4b423          	sd	a5,8(s1)
                    break;
    80003044:	ec1ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64)semaphore->wait();
    80003048:	00090513          	mv	a0,s2
    8000304c:	00000097          	auipc	ra,0x0
    80003050:	628080e7          	jalr	1576(ra) # 80003674 <_ZN10KSemaphore4waitEv>
    80003054:	00a4b423          	sd	a0,8(s1)
                break;
    80003058:	eadff06f          	j	80002f04 <trapHandle+0xe8>
                KSemaphore* semaphore = (KSemaphore*)frame->a1;
    8000305c:	0104b903          	ld	s2,16(s1)
                if (!KSemaphore::isAllocated(semaphore))
    80003060:	00090513          	mv	a0,s2
    80003064:	00000097          	auipc	ra,0x0
    80003068:	3f0080e7          	jalr	1008(ra) # 80003454 <_ZN10KSemaphore11isAllocatedEPKS_>
    8000306c:	00051863          	bnez	a0,8000307c <trapHandle+0x260>
                    frame->a0 = (uint64)-1;
    80003070:	fff00793          	li	a5,-1
    80003074:	00f4b423          	sd	a5,8(s1)
                    break;
    80003078:	e8dff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64)semaphore->signal();
    8000307c:	00090513          	mv	a0,s2
    80003080:	00000097          	auipc	ra,0x0
    80003084:	700080e7          	jalr	1792(ra) # 80003780 <_ZN10KSemaphore6signalEv>
    80003088:	00a4b423          	sd	a0,8(s1)
                break;
    8000308c:	e79ff06f          	j	80002f04 <trapHandle+0xe8>
                KSemaphore* semaphore=(KSemaphore*)frame->a1;
    80003090:	0104b903          	ld	s2,16(s1)
                if (!KSemaphore::isAllocated(semaphore))
    80003094:	00090513          	mv	a0,s2
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	3bc080e7          	jalr	956(ra) # 80003454 <_ZN10KSemaphore11isAllocatedEPKS_>
    800030a0:	00051863          	bnez	a0,800030b0 <trapHandle+0x294>
                    frame->a0 = (uint64)-1;
    800030a4:	fff00793          	li	a5,-1
    800030a8:	00f4b423          	sd	a5,8(s1)
                    break;
    800030ac:	e59ff06f          	j	80002f04 <trapHandle+0xe8>
                int result = semaphore->close();
    800030b0:	00090513          	mv	a0,s2
    800030b4:	00000097          	auipc	ra,0x0
    800030b8:	6f8080e7          	jalr	1784(ra) # 800037ac <_ZN10KSemaphore5closeEv>
    800030bc:	00050793          	mv	a5,a0
                if (result==0) result = KSemaphore::release(semaphore);
    800030c0:	00050663          	beqz	a0,800030cc <trapHandle+0x2b0>
                frame->a0 = (uint64)result;
    800030c4:	00f4b423          	sd	a5,8(s1)
                break;
    800030c8:	e3dff06f          	j	80002f04 <trapHandle+0xe8>
                if (result==0) result = KSemaphore::release(semaphore);
    800030cc:	00090513          	mv	a0,s2
    800030d0:	00000097          	auipc	ra,0x0
    800030d4:	2c8080e7          	jalr	712(ra) # 80003398 <_ZN10KSemaphore7releaseEPS_>
    800030d8:	00050793          	mv	a5,a0
    800030dc:	fe9ff06f          	j	800030c4 <trapHandle+0x2a8>
                frame->a0 = (uint64) KThread::createUserThread(handle, body, arg, userStackTop);
    800030e0:	0284b683          	ld	a3,40(s1)
    800030e4:	0204b603          	ld	a2,32(s1)
    800030e8:	0184b583          	ld	a1,24(s1)
    800030ec:	0104b503          	ld	a0,16(s1)
    800030f0:	fffff097          	auipc	ra,0xfffff
    800030f4:	c60080e7          	jalr	-928(ra) # 80001d50 <_ZN7KThread16createUserThreadEPPS_PFvPvES2_S2_>
    800030f8:	00a4b423          	sd	a0,8(s1)
                break;
    800030fc:	e09ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64) KThread::exit();
    80003100:	fffff097          	auipc	ra,0xfffff
    80003104:	fd4080e7          	jalr	-44(ra) # 800020d4 <_ZN7KThread4exitEv>
    80003108:	00a4b423          	sd	a0,8(s1)
                break;
    8000310c:	df9ff06f          	j	80002f04 <trapHandle+0xe8>
                KThread::dispatch();
    80003110:	fffff097          	auipc	ra,0xfffff
    80003114:	edc080e7          	jalr	-292(ra) # 80001fec <_ZN7KThread8dispatchEv>
                frame->a0 = 0;
    80003118:	0004b423          	sd	zero,8(s1)
                break;
    8000311c:	de9ff06f          	j	80002f04 <trapHandle+0xe8>
                void *result = (void *) MemAllocator::mem_alloc((size_t) frame->a1);
    80003120:	0104b503          	ld	a0,16(s1)
    80003124:	fffff097          	auipc	ra,0xfffff
    80003128:	254080e7          	jalr	596(ra) # 80002378 <_ZN12MemAllocator9mem_allocEm>
                frame->a0 = (uint64) result;
    8000312c:	00a4b423          	sd	a0,8(s1)
                break;
    80003130:	dd5ff06f          	j	80002f04 <trapHandle+0xe8>
                int result = MemAllocator::mem_free(address);
    80003134:	0104b503          	ld	a0,16(s1)
    80003138:	fffff097          	auipc	ra,0xfffff
    8000313c:	33c080e7          	jalr	828(ra) # 80002474 <_ZN12MemAllocator8mem_freeEPv>
                frame->a0 = (uint64) result;
    80003140:	00a4b423          	sd	a0,8(s1)
                break;
    80003144:	dc1ff06f          	j	80002f04 <trapHandle+0xe8>
                KConsole::putc(c);
    80003148:	0104c503          	lbu	a0,16(s1)
    8000314c:	fffff097          	auipc	ra,0xfffff
    80003150:	17c080e7          	jalr	380(ra) # 800022c8 <_ZN8KConsole4putcEc>
                frame->a0=0;
    80003154:	0004b423          	sd	zero,8(s1)
                break;
    80003158:	dadff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64)(unsigned char)KConsole::getc();
    8000315c:	fffff097          	auipc	ra,0xfffff
    80003160:	128080e7          	jalr	296(ra) # 80002284 <_ZN8KConsole4getcEv>
    80003164:	00a4b423          	sd	a0,8(s1)
                break;
    80003168:	d9dff06f          	j	80002f04 <trapHandle+0xe8>
                int result = frame->a1 + frame->a2 + frame->a3 + frame->a4 + frame->a5 + frame->a6 + frame->a7;
    8000316c:	0104b783          	ld	a5,16(s1)
    80003170:	0184b703          	ld	a4,24(s1)
    80003174:	00e7873b          	addw	a4,a5,a4
    80003178:	0204b783          	ld	a5,32(s1)
    8000317c:	00e787bb          	addw	a5,a5,a4
    80003180:	0284b703          	ld	a4,40(s1)
    80003184:	00f7073b          	addw	a4,a4,a5
    80003188:	0304b783          	ld	a5,48(s1)
    8000318c:	00e7873b          	addw	a4,a5,a4
    80003190:	0384b783          	ld	a5,56(s1)
    80003194:	00e787bb          	addw	a5,a5,a4
    80003198:	0404b703          	ld	a4,64(s1)
    8000319c:	00e787bb          	addw	a5,a5,a4
                frame->a0 = (uint64) result;
    800031a0:	00f4b423          	sd	a5,8(s1)
                break;
    800031a4:	d61ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = 0;
    800031a8:	0004b423          	sd	zero,8(s1)
                break;
    800031ac:	d59ff06f          	j	80002f04 <trapHandle+0xe8>
                frame->a0 = (uint64) -1;
    800031b0:	fff00793          	li	a5,-1
    800031b4:	00f4b423          	sd	a5,8(s1)
        return;
    800031b8:	d4dff06f          	j	80002f04 <trapHandle+0xe8>
            KConsole::putc('E');
    800031bc:	04500513          	li	a0,69
    800031c0:	fffff097          	auipc	ra,0xfffff
    800031c4:	108080e7          	jalr	264(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('2');
    800031c8:	03200513          	li	a0,50
    800031cc:	fffff097          	auipc	ra,0xfffff
    800031d0:	0fc080e7          	jalr	252(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('\n');
    800031d4:	00a00513          	li	a0,10
    800031d8:	fffff097          	auipc	ra,0xfffff
    800031dc:	0f0080e7          	jalr	240(ra) # 800022c8 <_ZN8KConsole4putcEc>
    800031e0:	cd9ff06f          	j	80002eb8 <trapHandle+0x9c>
            KConsole::putc('E');
    800031e4:	04500513          	li	a0,69
    800031e8:	fffff097          	auipc	ra,0xfffff
    800031ec:	0e0080e7          	jalr	224(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('5');
    800031f0:	03500513          	li	a0,53
    800031f4:	fffff097          	auipc	ra,0xfffff
    800031f8:	0d4080e7          	jalr	212(ra) # 800022c8 <_ZN8KConsole4putcEc>
            KConsole::putc('\n');
    800031fc:	00a00513          	li	a0,10
    80003200:	fffff097          	auipc	ra,0xfffff
    80003204:	0c8080e7          	jalr	200(ra) # 800022c8 <_ZN8KConsole4putcEc>
    80003208:	cb1ff06f          	j	80002eb8 <trapHandle+0x9c>

000000008000320c <_ZL15findFirstSetBitm>:
uint64 KSemaphore::usedBitmap = 0;

KSemaphore::KSemaphore():value(0),closed(true),waitHead(nullptr),waitTail(nullptr){}

static uint64 findFirstSetBit(uint64 value)
{
    8000320c:	ff010113          	addi	sp,sp,-16
    80003210:	00813423          	sd	s0,8(sp)
    80003214:	01010413          	addi	s0,sp,16
    80003218:	00050793          	mv	a5,a0
    uint64 index = 0;
    8000321c:	00000513          	li	a0,0

    while ((value & 1) == 0)
    80003220:	0017f713          	andi	a4,a5,1
    80003224:	00071863          	bnez	a4,80003234 <_ZL15findFirstSetBitm+0x28>
    {
        value >>= 1;
    80003228:	0017d793          	srli	a5,a5,0x1
        index++;
    8000322c:	00150513          	addi	a0,a0,1
    while ((value & 1) == 0)
    80003230:	ff1ff06f          	j	80003220 <_ZL15findFirstSetBitm+0x14>
    }

    return index;
}
    80003234:	00813403          	ld	s0,8(sp)
    80003238:	01010113          	addi	sp,sp,16
    8000323c:	00008067          	ret

0000000080003240 <_ZN10KSemaphoreC1Ev>:
KSemaphore::KSemaphore():value(0),closed(true),waitHead(nullptr),waitTail(nullptr){}
    80003240:	ff010113          	addi	sp,sp,-16
    80003244:	00813423          	sd	s0,8(sp)
    80003248:	01010413          	addi	s0,sp,16
    8000324c:	00052023          	sw	zero,0(a0)
    80003250:	00100793          	li	a5,1
    80003254:	00f50223          	sb	a5,4(a0)
    80003258:	00053423          	sd	zero,8(a0)
    8000325c:	00053823          	sd	zero,16(a0)
    80003260:	00813403          	ld	s0,8(sp)
    80003264:	01010113          	addi	sp,sp,16
    80003268:	00008067          	ret

000000008000326c <_Z41__static_initialization_and_destruction_0ii>:
    }

    thread->waitNext = nullptr;

    return thread;
    8000326c:	00100793          	li	a5,1
    80003270:	00f50463          	beq	a0,a5,80003278 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80003274:	00008067          	ret
    80003278:	000107b7          	lui	a5,0x10
    8000327c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003280:	fef59ae3          	bne	a1,a5,80003274 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80003284:	fe010113          	addi	sp,sp,-32
    80003288:	00113c23          	sd	ra,24(sp)
    8000328c:	00813823          	sd	s0,16(sp)
    80003290:	00913423          	sd	s1,8(sp)
    80003294:	01213023          	sd	s2,0(sp)
    80003298:	02010413          	addi	s0,sp,32
alignas(16) KSemaphore KSemaphore::semaphorePool[KSemaphore::MAX_SEMAPHORES];
    8000329c:	03f00493          	li	s1,63
    800032a0:	0000a917          	auipc	s2,0xa
    800032a4:	a5090913          	addi	s2,s2,-1456 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    800032a8:	0004ce63          	bltz	s1,800032c4 <_Z41__static_initialization_and_destruction_0ii+0x58>
    800032ac:	00090513          	mv	a0,s2
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	f90080e7          	jalr	-112(ra) # 80003240 <_ZN10KSemaphoreC1Ev>
    800032b8:	01890913          	addi	s2,s2,24
    800032bc:	fff48493          	addi	s1,s1,-1
    800032c0:	fe9ff06f          	j	800032a8 <_Z41__static_initialization_and_destruction_0ii+0x3c>
    800032c4:	01813083          	ld	ra,24(sp)
    800032c8:	01013403          	ld	s0,16(sp)
    800032cc:	00813483          	ld	s1,8(sp)
    800032d0:	00013903          	ld	s2,0(sp)
    800032d4:	02010113          	addi	sp,sp,32
    800032d8:	00008067          	ret

00000000800032dc <_ZN10KSemaphore5resetEj>:
{
    800032dc:	ff010113          	addi	sp,sp,-16
    800032e0:	00813423          	sd	s0,8(sp)
    800032e4:	01010413          	addi	s0,sp,16
    value = (int)initialValue;
    800032e8:	00b52023          	sw	a1,0(a0)
    closed = false;
    800032ec:	00050223          	sb	zero,4(a0)
    waitHead = nullptr;
    800032f0:	00053423          	sd	zero,8(a0)
    waitTail = nullptr;
    800032f4:	00053823          	sd	zero,16(a0)
}
    800032f8:	00813403          	ld	s0,8(sp)
    800032fc:	01010113          	addi	sp,sp,16
    80003300:	00008067          	ret

0000000080003304 <_ZN10KSemaphore8allocateEj>:
{
    80003304:	fe010113          	addi	sp,sp,-32
    80003308:	00113c23          	sd	ra,24(sp)
    8000330c:	00813823          	sd	s0,16(sp)
    80003310:	00913423          	sd	s1,8(sp)
    80003314:	01213023          	sd	s2,0(sp)
    80003318:	02010413          	addi	s0,sp,32
    if (usedBitmap == ~(uint64)0)
    8000331c:	0000a497          	auipc	s1,0xa
    80003320:	fd44b483          	ld	s1,-44(s1) # 8000d2f0 <_ZN10KSemaphore10usedBitmapE>
    80003324:	fff00793          	li	a5,-1
    80003328:	06f48463          	beq	s1,a5,80003390 <_ZN10KSemaphore8allocateEj+0x8c>
    8000332c:	00050913          	mv	s2,a0
    uint64 index = findFirstSetBit(freeSlots);
    80003330:	fff4c513          	not	a0,s1
    80003334:	00000097          	auipc	ra,0x0
    80003338:	ed8080e7          	jalr	-296(ra) # 8000320c <_ZL15findFirstSetBitm>
    usedBitmap |= ((uint64)1 << index);
    8000333c:	00100713          	li	a4,1
    80003340:	00a71733          	sll	a4,a4,a0
    80003344:	0000a797          	auipc	a5,0xa
    80003348:	9ac78793          	addi	a5,a5,-1620 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    8000334c:	00e4e4b3          	or	s1,s1,a4
    80003350:	6097b023          	sd	s1,1536(a5)
    KSemaphore* semaphore =
    80003354:	00151493          	slli	s1,a0,0x1
    80003358:	00a484b3          	add	s1,s1,a0
    8000335c:	00349493          	slli	s1,s1,0x3
    80003360:	009784b3          	add	s1,a5,s1
    semaphore->reset(initialValue);
    80003364:	00090593          	mv	a1,s2
    80003368:	00048513          	mv	a0,s1
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	f70080e7          	jalr	-144(ra) # 800032dc <_ZN10KSemaphore5resetEj>
}
    80003374:	00048513          	mv	a0,s1
    80003378:	01813083          	ld	ra,24(sp)
    8000337c:	01013403          	ld	s0,16(sp)
    80003380:	00813483          	ld	s1,8(sp)
    80003384:	00013903          	ld	s2,0(sp)
    80003388:	02010113          	addi	sp,sp,32
    8000338c:	00008067          	ret
        return nullptr;
    80003390:	00000493          	li	s1,0
    80003394:	fe1ff06f          	j	80003374 <_ZN10KSemaphore8allocateEj+0x70>

0000000080003398 <_ZN10KSemaphore7releaseEPS_>:
{
    80003398:	ff010113          	addi	sp,sp,-16
    8000339c:	00813423          	sd	s0,8(sp)
    800033a0:	01010413          	addi	s0,sp,16
    if (semaphore == nullptr)
    800033a4:	08050463          	beqz	a0,8000342c <_ZN10KSemaphore7releaseEPS_+0x94>
    if (semaphore < &semaphorePool[0] ||
    800033a8:	0000a797          	auipc	a5,0xa
    800033ac:	94878793          	addi	a5,a5,-1720 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    800033b0:	08f56263          	bltu	a0,a5,80003434 <_ZN10KSemaphore7releaseEPS_+0x9c>
    800033b4:	0000a797          	auipc	a5,0xa
    800033b8:	f3c78793          	addi	a5,a5,-196 # 8000d2f0 <_ZN10KSemaphore10usedBitmapE>
    800033bc:	08f57063          	bgeu	a0,a5,8000343c <_ZN10KSemaphore7releaseEPS_+0xa4>
        (uint64)(semaphore - semaphorePool);
    800033c0:	0000a697          	auipc	a3,0xa
    800033c4:	93068693          	addi	a3,a3,-1744 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    800033c8:	40d507b3          	sub	a5,a0,a3
    800033cc:	4037d793          	srai	a5,a5,0x3
        ((uint64)1 << index);
    800033d0:	00006717          	auipc	a4,0x6
    800033d4:	fa073703          	ld	a4,-96(a4) # 80009370 <CONSOLE_STATUS+0x360>
    800033d8:	02e7873b          	mulw	a4,a5,a4
    uint64 bit =
    800033dc:	00100793          	li	a5,1
    800033e0:	00e797b3          	sll	a5,a5,a4
    if ((usedBitmap & bit) == 0)
    800033e4:	6006b703          	ld	a4,1536(a3)
    800033e8:	00e7f733          	and	a4,a5,a4
    800033ec:	04070c63          	beqz	a4,80003444 <_ZN10KSemaphore7releaseEPS_+0xac>
    if (semaphore->waitHead != nullptr)
    800033f0:	00853703          	ld	a4,8(a0)
    800033f4:	04071c63          	bnez	a4,8000344c <_ZN10KSemaphore7releaseEPS_+0xb4>
    semaphore->value = 0;
    800033f8:	00052023          	sw	zero,0(a0)
    semaphore->closed = true;
    800033fc:	00100713          	li	a4,1
    80003400:	00e50223          	sb	a4,4(a0)
    semaphore->waitHead = nullptr;
    80003404:	00053423          	sd	zero,8(a0)
    semaphore->waitTail = nullptr;
    80003408:	00053823          	sd	zero,16(a0)
    usedBitmap &= ~bit;
    8000340c:	fff7c793          	not	a5,a5
    80003410:	6006b703          	ld	a4,1536(a3)
    80003414:	00f777b3          	and	a5,a4,a5
    80003418:	60f6b023          	sd	a5,1536(a3)
    return 0;
    8000341c:	00000513          	li	a0,0
}
    80003420:	00813403          	ld	s0,8(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret
        return -1;
    8000342c:	fff00513          	li	a0,-1
    80003430:	ff1ff06f          	j	80003420 <_ZN10KSemaphore7releaseEPS_+0x88>
        return -2;
    80003434:	ffe00513          	li	a0,-2
    80003438:	fe9ff06f          	j	80003420 <_ZN10KSemaphore7releaseEPS_+0x88>
    8000343c:	ffe00513          	li	a0,-2
    80003440:	fe1ff06f          	j	80003420 <_ZN10KSemaphore7releaseEPS_+0x88>
        return -3;
    80003444:	ffd00513          	li	a0,-3
    80003448:	fd9ff06f          	j	80003420 <_ZN10KSemaphore7releaseEPS_+0x88>
        return -4;
    8000344c:	ffc00513          	li	a0,-4
    80003450:	fd1ff06f          	j	80003420 <_ZN10KSemaphore7releaseEPS_+0x88>

0000000080003454 <_ZN10KSemaphore11isAllocatedEPKS_>:
{
    80003454:	ff010113          	addi	sp,sp,-16
    80003458:	00813423          	sd	s0,8(sp)
    8000345c:	01010413          	addi	s0,sp,16
    if (semaphore == nullptr)
    80003460:	04050c63          	beqz	a0,800034b8 <_ZN10KSemaphore11isAllocatedEPKS_+0x64>
    if (semaphore < &semaphorePool[0] ||semaphore >=&semaphorePool[MAX_SEMAPHORES])
    80003464:	0000a797          	auipc	a5,0xa
    80003468:	88c78793          	addi	a5,a5,-1908 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    8000346c:	04f56a63          	bltu	a0,a5,800034c0 <_ZN10KSemaphore11isAllocatedEPKS_+0x6c>
    80003470:	0000a797          	auipc	a5,0xa
    80003474:	e8078793          	addi	a5,a5,-384 # 8000d2f0 <_ZN10KSemaphore10usedBitmapE>
    80003478:	04f57863          	bgeu	a0,a5,800034c8 <_ZN10KSemaphore11isAllocatedEPKS_+0x74>
        (uint64)(semaphore - semaphorePool);
    8000347c:	0000a717          	auipc	a4,0xa
    80003480:	87470713          	addi	a4,a4,-1932 # 8000ccf0 <_ZN10KSemaphore13semaphorePoolE>
    80003484:	40e50533          	sub	a0,a0,a4
    80003488:	40355513          	srai	a0,a0,0x3
        ((uint64)1 << index);
    8000348c:	00006797          	auipc	a5,0x6
    80003490:	ee47b783          	ld	a5,-284(a5) # 80009370 <CONSOLE_STATUS+0x360>
    80003494:	02f5053b          	mulw	a0,a0,a5
    uint64 bit =
    80003498:	00100793          	li	a5,1
    8000349c:	00a79533          	sll	a0,a5,a0
    return (usedBitmap & bit) != 0;
    800034a0:	60073783          	ld	a5,1536(a4)
    800034a4:	00f57533          	and	a0,a0,a5
    800034a8:	00a03533          	snez	a0,a0
}
    800034ac:	00813403          	ld	s0,8(sp)
    800034b0:	01010113          	addi	sp,sp,16
    800034b4:	00008067          	ret
        return false;
    800034b8:	00000513          	li	a0,0
    800034bc:	ff1ff06f          	j	800034ac <_ZN10KSemaphore11isAllocatedEPKS_+0x58>
        return false;
    800034c0:	00000513          	li	a0,0
    800034c4:	fe9ff06f          	j	800034ac <_ZN10KSemaphore11isAllocatedEPKS_+0x58>
    800034c8:	00000513          	li	a0,0
    800034cc:	fe1ff06f          	j	800034ac <_ZN10KSemaphore11isAllocatedEPKS_+0x58>

00000000800034d0 <_ZN10KSemaphore13getUsedBitmapEv>:
{
    800034d0:	ff010113          	addi	sp,sp,-16
    800034d4:	00813423          	sd	s0,8(sp)
    800034d8:	01010413          	addi	s0,sp,16
}
    800034dc:	0000a517          	auipc	a0,0xa
    800034e0:	e1453503          	ld	a0,-492(a0) # 8000d2f0 <_ZN10KSemaphore10usedBitmapE>
    800034e4:	00813403          	ld	s0,8(sp)
    800034e8:	01010113          	addi	sp,sp,16
    800034ec:	00008067          	ret

00000000800034f0 <_ZN10KSemaphore17getAllocatedCountEv>:
{
    800034f0:	ff010113          	addi	sp,sp,-16
    800034f4:	00813423          	sd	s0,8(sp)
    800034f8:	01010413          	addi	s0,sp,16
    uint64 bitmap = usedBitmap;
    800034fc:	0000a797          	auipc	a5,0xa
    80003500:	df47b783          	ld	a5,-524(a5) # 8000d2f0 <_ZN10KSemaphore10usedBitmapE>
    uint64 count = 0;
    80003504:	00000513          	li	a0,0
    while (bitmap != 0)
    80003508:	00078a63          	beqz	a5,8000351c <_ZN10KSemaphore17getAllocatedCountEv+0x2c>
        bitmap &= bitmap - 1;
    8000350c:	fff78713          	addi	a4,a5,-1
    80003510:	00e7f7b3          	and	a5,a5,a4
        count++;
    80003514:	00150513          	addi	a0,a0,1
    while (bitmap != 0)
    80003518:	ff1ff06f          	j	80003508 <_ZN10KSemaphore17getAllocatedCountEv+0x18>
}
    8000351c:	00813403          	ld	s0,8(sp)
    80003520:	01010113          	addi	sp,sp,16
    80003524:	00008067          	ret

0000000080003528 <_ZNK10KSemaphore8getValueEv>:
{
    80003528:	ff010113          	addi	sp,sp,-16
    8000352c:	00813423          	sd	s0,8(sp)
    80003530:	01010413          	addi	s0,sp,16
}
    80003534:	00052503          	lw	a0,0(a0)
    80003538:	00813403          	ld	s0,8(sp)
    8000353c:	01010113          	addi	sp,sp,16
    80003540:	00008067          	ret

0000000080003544 <_ZNK10KSemaphore8isClosedEv>:
{
    80003544:	ff010113          	addi	sp,sp,-16
    80003548:	00813423          	sd	s0,8(sp)
    8000354c:	01010413          	addi	s0,sp,16
}
    80003550:	00454503          	lbu	a0,4(a0)
    80003554:	00813403          	ld	s0,8(sp)
    80003558:	01010113          	addi	sp,sp,16
    8000355c:	00008067          	ret

0000000080003560 <_ZNK10KSemaphore17hasWaitingThreadsEv>:
{
    80003560:	ff010113          	addi	sp,sp,-16
    80003564:	00813423          	sd	s0,8(sp)
    80003568:	01010413          	addi	s0,sp,16
    return waitHead != nullptr;
    8000356c:	00853503          	ld	a0,8(a0)
}
    80003570:	00a03533          	snez	a0,a0
    80003574:	00813403          	ld	s0,8(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret

0000000080003580 <_ZN10KSemaphore12putWaitQueueEP7KThread>:
{
    80003580:	ff010113          	addi	sp,sp,-16
    80003584:	00813423          	sd	s0,8(sp)
    80003588:	01010413          	addi	s0,sp,16
    if (thread == nullptr)
    8000358c:	00058c63          	beqz	a1,800035a4 <_ZN10KSemaphore12putWaitQueueEP7KThread+0x24>
    thread->waitNext = nullptr;
    80003590:	0205b423          	sd	zero,40(a1)
    if (waitTail == nullptr)
    80003594:	01053783          	ld	a5,16(a0)
    80003598:	00078c63          	beqz	a5,800035b0 <_ZN10KSemaphore12putWaitQueueEP7KThread+0x30>
    waitTail->waitNext = thread;
    8000359c:	02b7b423          	sd	a1,40(a5)
    waitTail = thread;
    800035a0:	00b53823          	sd	a1,16(a0)
}
    800035a4:	00813403          	ld	s0,8(sp)
    800035a8:	01010113          	addi	sp,sp,16
    800035ac:	00008067          	ret
        waitHead = thread;
    800035b0:	00b53423          	sd	a1,8(a0)
        waitTail = thread;
    800035b4:	00b53823          	sd	a1,16(a0)
        return;
    800035b8:	fedff06f          	j	800035a4 <_ZN10KSemaphore12putWaitQueueEP7KThread+0x24>

00000000800035bc <_ZN10KSemaphore5waitNEj>:
    if (closed) return -1;
    800035bc:	00454783          	lbu	a5,4(a0)
    800035c0:	08079a63          	bnez	a5,80003654 <_ZN10KSemaphore5waitNEj+0x98>
    if (n==0) return 0;
    800035c4:	08058c63          	beqz	a1,8000365c <_ZN10KSemaphore5waitNEj+0xa0>
    if ((unsigned)value>=n)
    800035c8:	00052783          	lw	a5,0(a0)
    800035cc:	0007871b          	sext.w	a4,a5
    800035d0:	06b77a63          	bgeu	a4,a1,80003644 <_ZN10KSemaphore5waitNEj+0x88>
{
    800035d4:	fe010113          	addi	sp,sp,-32
    800035d8:	00113c23          	sd	ra,24(sp)
    800035dc:	00813823          	sd	s0,16(sp)
    800035e0:	00913423          	sd	s1,8(sp)
    800035e4:	02010413          	addi	s0,sp,32
    KThread* current = KThread::running;
    800035e8:	00008797          	auipc	a5,0x8
    800035ec:	4407b783          	ld	a5,1088(a5) # 8000ba28 <_GLOBAL_OFFSET_TABLE_+0x48>
    800035f0:	0007b483          	ld	s1,0(a5)
    if (current == nullptr || current->status != KThread::RUNNING) return -2;
    800035f4:	06048863          	beqz	s1,80003664 <_ZN10KSemaphore5waitNEj+0xa8>
    800035f8:	0204a703          	lw	a4,32(s1)
    800035fc:	00100793          	li	a5,1
    80003600:	06f71663          	bne	a4,a5,8000366c <_ZN10KSemaphore5waitNEj+0xb0>
    current->waitUnits = n;
    80003604:	02b4a823          	sw	a1,48(s1)
    current->waitResult = 0;
    80003608:	0204aa23          	sw	zero,52(s1)
    putWaitQueue(current);
    8000360c:	00048593          	mv	a1,s1
    80003610:	00000097          	auipc	ra,0x0
    80003614:	f70080e7          	jalr	-144(ra) # 80003580 <_ZN10KSemaphore12putWaitQueueEP7KThread>
    int result = KThread::block();
    80003618:	fffff097          	auipc	ra,0xfffff
    8000361c:	874080e7          	jalr	-1932(ra) # 80001e8c <_ZN7KThread5blockEv>
    if (result<0) return result;
    80003620:	00054863          	bltz	a0,80003630 <_ZN10KSemaphore5waitNEj+0x74>
    result = current->waitResult;
    80003624:	0344a503          	lw	a0,52(s1)
    current->waitUnits=0;
    80003628:	0204a823          	sw	zero,48(s1)
    current->waitResult= 0;
    8000362c:	0204aa23          	sw	zero,52(s1)
}
    80003630:	01813083          	ld	ra,24(sp)
    80003634:	01013403          	ld	s0,16(sp)
    80003638:	00813483          	ld	s1,8(sp)
    8000363c:	02010113          	addi	sp,sp,32
    80003640:	00008067          	ret
        value-=(int)n;
    80003644:	40b785bb          	subw	a1,a5,a1
    80003648:	00b52023          	sw	a1,0(a0)
        return 0;
    8000364c:	00000513          	li	a0,0
    80003650:	00008067          	ret
    if (closed) return -1;
    80003654:	fff00513          	li	a0,-1
    80003658:	00008067          	ret
    if (n==0) return 0;
    8000365c:	00000513          	li	a0,0
}
    80003660:	00008067          	ret
    if (current == nullptr || current->status != KThread::RUNNING) return -2;
    80003664:	ffe00513          	li	a0,-2
    80003668:	fc9ff06f          	j	80003630 <_ZN10KSemaphore5waitNEj+0x74>
    8000366c:	ffe00513          	li	a0,-2
    80003670:	fc1ff06f          	j	80003630 <_ZN10KSemaphore5waitNEj+0x74>

0000000080003674 <_ZN10KSemaphore4waitEv>:
{
    80003674:	ff010113          	addi	sp,sp,-16
    80003678:	00113423          	sd	ra,8(sp)
    8000367c:	00813023          	sd	s0,0(sp)
    80003680:	01010413          	addi	s0,sp,16
    return waitN(1);
    80003684:	00100593          	li	a1,1
    80003688:	00000097          	auipc	ra,0x0
    8000368c:	f34080e7          	jalr	-204(ra) # 800035bc <_ZN10KSemaphore5waitNEj>
}
    80003690:	00813083          	ld	ra,8(sp)
    80003694:	00013403          	ld	s0,0(sp)
    80003698:	01010113          	addi	sp,sp,16
    8000369c:	00008067          	ret

00000000800036a0 <_ZN10KSemaphore12getWaitQueueEv>:
{
    800036a0:	ff010113          	addi	sp,sp,-16
    800036a4:	00813423          	sd	s0,8(sp)
    800036a8:	01010413          	addi	s0,sp,16
    800036ac:	00050793          	mv	a5,a0
    if (waitHead == nullptr)
    800036b0:	00853503          	ld	a0,8(a0)
    800036b4:	00050a63          	beqz	a0,800036c8 <_ZN10KSemaphore12getWaitQueueEv+0x28>
    waitHead = waitHead->waitNext;
    800036b8:	02853703          	ld	a4,40(a0)
    800036bc:	00e7b423          	sd	a4,8(a5)
    if (waitHead == nullptr)
    800036c0:	00070a63          	beqz	a4,800036d4 <_ZN10KSemaphore12getWaitQueueEv+0x34>
    thread->waitNext = nullptr;
    800036c4:	02053423          	sd	zero,40(a0)
    800036c8:	00813403          	ld	s0,8(sp)
    800036cc:	01010113          	addi	sp,sp,16
    800036d0:	00008067          	ret
        waitTail = nullptr;
    800036d4:	0007b823          	sd	zero,16(a5)
    800036d8:	fedff06f          	j	800036c4 <_ZN10KSemaphore12getWaitQueueEv+0x24>

00000000800036dc <_ZN10KSemaphore7signalNEj>:
    if (closed) return -1;
    800036dc:	00454783          	lbu	a5,4(a0)
    800036e0:	06079863          	bnez	a5,80003750 <_ZN10KSemaphore7signalNEj+0x74>
{
    800036e4:	fe010113          	addi	sp,sp,-32
    800036e8:	00113c23          	sd	ra,24(sp)
    800036ec:	00813823          	sd	s0,16(sp)
    800036f0:	00913423          	sd	s1,8(sp)
    800036f4:	02010413          	addi	s0,sp,32
    800036f8:	00050493          	mv	s1,a0
    if (n==0) return 0;
    800036fc:	04058e63          	beqz	a1,80003758 <_ZN10KSemaphore7signalNEj+0x7c>
    value+=(int)n;
    80003700:	00052783          	lw	a5,0(a0)
    80003704:	00b785bb          	addw	a1,a5,a1
    80003708:	00b52023          	sw	a1,0(a0)
    while (waitHead!=nullptr)
    8000370c:	0084b783          	ld	a5,8(s1)
    80003710:	06078063          	beqz	a5,80003770 <_ZN10KSemaphore7signalNEj+0x94>
        if (thread->waitUnits>(unsigned)value)
    80003714:	0307a703          	lw	a4,48(a5)
    80003718:	0004a783          	lw	a5,0(s1)
    8000371c:	0007869b          	sext.w	a3,a5
    80003720:	04e6ec63          	bltu	a3,a4,80003778 <_ZN10KSemaphore7signalNEj+0x9c>
        value-=(int)thread->waitUnits;
    80003724:	40e787bb          	subw	a5,a5,a4
    80003728:	00f4a023          	sw	a5,0(s1)
        thread = getWaitQueue();
    8000372c:	00048513          	mv	a0,s1
    80003730:	00000097          	auipc	ra,0x0
    80003734:	f70080e7          	jalr	-144(ra) # 800036a0 <_ZN10KSemaphore12getWaitQueueEv>
        thread->waitResult = 0;
    80003738:	02052a23          	sw	zero,52(a0)
        int result = KThread::unblock(thread);
    8000373c:	fffff097          	auipc	ra,0xfffff
    80003740:	808080e7          	jalr	-2040(ra) # 80001f44 <_ZN7KThread7unblockEPS_>
        if (result<0) return -3;
    80003744:	fc0554e3          	bgez	a0,8000370c <_ZN10KSemaphore7signalNEj+0x30>
    80003748:	ffd00513          	li	a0,-3
    8000374c:	0100006f          	j	8000375c <_ZN10KSemaphore7signalNEj+0x80>
    if (closed) return -1;
    80003750:	fff00513          	li	a0,-1
}
    80003754:	00008067          	ret
    if (n==0) return 0;
    80003758:	00000513          	li	a0,0
}
    8000375c:	01813083          	ld	ra,24(sp)
    80003760:	01013403          	ld	s0,16(sp)
    80003764:	00813483          	ld	s1,8(sp)
    80003768:	02010113          	addi	sp,sp,32
    8000376c:	00008067          	ret
    return 0;
    80003770:	00000513          	li	a0,0
    80003774:	fe9ff06f          	j	8000375c <_ZN10KSemaphore7signalNEj+0x80>
    80003778:	00000513          	li	a0,0
    8000377c:	fe1ff06f          	j	8000375c <_ZN10KSemaphore7signalNEj+0x80>

0000000080003780 <_ZN10KSemaphore6signalEv>:
{
    80003780:	ff010113          	addi	sp,sp,-16
    80003784:	00113423          	sd	ra,8(sp)
    80003788:	00813023          	sd	s0,0(sp)
    8000378c:	01010413          	addi	s0,sp,16
    return signalN(1);
    80003790:	00100593          	li	a1,1
    80003794:	00000097          	auipc	ra,0x0
    80003798:	f48080e7          	jalr	-184(ra) # 800036dc <_ZN10KSemaphore7signalNEj>
}
    8000379c:	00813083          	ld	ra,8(sp)
    800037a0:	00013403          	ld	s0,0(sp)
    800037a4:	01010113          	addi	sp,sp,16
    800037a8:	00008067          	ret

00000000800037ac <_ZN10KSemaphore5closeEv>:
    if (closed) return -1;
    800037ac:	00454783          	lbu	a5,4(a0)
    800037b0:	04079e63          	bnez	a5,8000380c <_ZN10KSemaphore5closeEv+0x60>
{
    800037b4:	fe010113          	addi	sp,sp,-32
    800037b8:	00113c23          	sd	ra,24(sp)
    800037bc:	00813823          	sd	s0,16(sp)
    800037c0:	00913423          	sd	s1,8(sp)
    800037c4:	02010413          	addi	s0,sp,32
    800037c8:	00050493          	mv	s1,a0
    closed = true;
    800037cc:	00100793          	li	a5,1
    800037d0:	00f50223          	sb	a5,4(a0)
    value=0;
    800037d4:	00052023          	sw	zero,0(a0)
    while (waitHead != nullptr)
    800037d8:	0084b783          	ld	a5,8(s1)
    800037dc:	02078c63          	beqz	a5,80003814 <_ZN10KSemaphore5closeEv+0x68>
        KThread* thread = getWaitQueue();
    800037e0:	00048513          	mv	a0,s1
    800037e4:	00000097          	auipc	ra,0x0
    800037e8:	ebc080e7          	jalr	-324(ra) # 800036a0 <_ZN10KSemaphore12getWaitQueueEv>
        thread->waitResult=-1;
    800037ec:	fff00713          	li	a4,-1
    800037f0:	02e52a23          	sw	a4,52(a0)
        thread->waitUnits=0;
    800037f4:	02052823          	sw	zero,48(a0)
        int result = KThread::unblock(thread);
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	74c080e7          	jalr	1868(ra) # 80001f44 <_ZN7KThread7unblockEPS_>
        if (result<0) return -2;
    80003800:	fc055ce3          	bgez	a0,800037d8 <_ZN10KSemaphore5closeEv+0x2c>
    80003804:	ffe00513          	li	a0,-2
    80003808:	0100006f          	j	80003818 <_ZN10KSemaphore5closeEv+0x6c>
    if (closed) return -1;
    8000380c:	fff00513          	li	a0,-1
}
    80003810:	00008067          	ret
    return 0;
    80003814:	00000513          	li	a0,0
}
    80003818:	01813083          	ld	ra,24(sp)
    8000381c:	01013403          	ld	s0,16(sp)
    80003820:	00813483          	ld	s1,8(sp)
    80003824:	02010113          	addi	sp,sp,32
    80003828:	00008067          	ret

000000008000382c <_GLOBAL__sub_I__ZN10KSemaphore13semaphorePoolE>:
    8000382c:	ff010113          	addi	sp,sp,-16
    80003830:	00113423          	sd	ra,8(sp)
    80003834:	00813023          	sd	s0,0(sp)
    80003838:	01010413          	addi	s0,sp,16
    8000383c:	000105b7          	lui	a1,0x10
    80003840:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003844:	00100513          	li	a0,1
    80003848:	00000097          	auipc	ra,0x0
    8000384c:	a24080e7          	jalr	-1500(ra) # 8000326c <_Z41__static_initialization_and_destruction_0ii>
    80003850:	00813083          	ld	ra,8(sp)
    80003854:	00013403          	ld	s0,0(sp)
    80003858:	01010113          	addi	sp,sp,16
    8000385c:	00008067          	ret

0000000080003860 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00113c23          	sd	ra,24(sp)
    80003868:	00813823          	sd	s0,16(sp)
    8000386c:	00913423          	sd	s1,8(sp)
    80003870:	01213023          	sd	s2,0(sp)
    80003874:	02010413          	addi	s0,sp,32
    80003878:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000387c:	00000913          	li	s2,0
    80003880:	00c0006f          	j	8000388c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003884:	ffffe097          	auipc	ra,0xffffe
    80003888:	b1c080e7          	jalr	-1252(ra) # 800013a0 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    8000388c:	ffffe097          	auipc	ra,0xffffe
    80003890:	cf4080e7          	jalr	-780(ra) # 80001580 <_Z4getcv>
    80003894:	0005059b          	sext.w	a1,a0
    80003898:	01b00793          	li	a5,27
    8000389c:	02f58a63          	beq	a1,a5,800038d0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800038a0:	0084b503          	ld	a0,8(s1)
    800038a4:	00003097          	auipc	ra,0x3
    800038a8:	2ac080e7          	jalr	684(ra) # 80006b50 <_ZN6Buffer3putEi>
        i++;
    800038ac:	0019071b          	addiw	a4,s2,1
    800038b0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800038b4:	0004a683          	lw	a3,0(s1)
    800038b8:	0026979b          	slliw	a5,a3,0x2
    800038bc:	00d787bb          	addw	a5,a5,a3
    800038c0:	0017979b          	slliw	a5,a5,0x1
    800038c4:	02f767bb          	remw	a5,a4,a5
    800038c8:	fc0792e3          	bnez	a5,8000388c <_ZL16producerKeyboardPv+0x2c>
    800038cc:	fb9ff06f          	j	80003884 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800038d0:	00100793          	li	a5,1
    800038d4:	0000a717          	auipc	a4,0xa
    800038d8:	a2f72223          	sw	a5,-1500(a4) # 8000d2f8 <_ZL9threadEnd>
    data->buffer->put('!');
    800038dc:	02100593          	li	a1,33
    800038e0:	0084b503          	ld	a0,8(s1)
    800038e4:	00003097          	auipc	ra,0x3
    800038e8:	26c080e7          	jalr	620(ra) # 80006b50 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800038ec:	0104b503          	ld	a0,16(s1)
    800038f0:	ffffe097          	auipc	ra,0xffffe
    800038f4:	bb8080e7          	jalr	-1096(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>
}
    800038f8:	01813083          	ld	ra,24(sp)
    800038fc:	01013403          	ld	s0,16(sp)
    80003900:	00813483          	ld	s1,8(sp)
    80003904:	00013903          	ld	s2,0(sp)
    80003908:	02010113          	addi	sp,sp,32
    8000390c:	00008067          	ret

0000000080003910 <_ZL8producerPv>:

static void producer(void *arg) {
    80003910:	fe010113          	addi	sp,sp,-32
    80003914:	00113c23          	sd	ra,24(sp)
    80003918:	00813823          	sd	s0,16(sp)
    8000391c:	00913423          	sd	s1,8(sp)
    80003920:	01213023          	sd	s2,0(sp)
    80003924:	02010413          	addi	s0,sp,32
    80003928:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000392c:	00000913          	li	s2,0
    80003930:	00c0006f          	j	8000393c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003934:	ffffe097          	auipc	ra,0xffffe
    80003938:	a6c080e7          	jalr	-1428(ra) # 800013a0 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000393c:	0000a797          	auipc	a5,0xa
    80003940:	9bc7a783          	lw	a5,-1604(a5) # 8000d2f8 <_ZL9threadEnd>
    80003944:	02079e63          	bnez	a5,80003980 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003948:	0004a583          	lw	a1,0(s1)
    8000394c:	0305859b          	addiw	a1,a1,48
    80003950:	0084b503          	ld	a0,8(s1)
    80003954:	00003097          	auipc	ra,0x3
    80003958:	1fc080e7          	jalr	508(ra) # 80006b50 <_ZN6Buffer3putEi>
        i++;
    8000395c:	0019071b          	addiw	a4,s2,1
    80003960:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003964:	0004a683          	lw	a3,0(s1)
    80003968:	0026979b          	slliw	a5,a3,0x2
    8000396c:	00d787bb          	addw	a5,a5,a3
    80003970:	0017979b          	slliw	a5,a5,0x1
    80003974:	02f767bb          	remw	a5,a4,a5
    80003978:	fc0792e3          	bnez	a5,8000393c <_ZL8producerPv+0x2c>
    8000397c:	fb9ff06f          	j	80003934 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003980:	0104b503          	ld	a0,16(s1)
    80003984:	ffffe097          	auipc	ra,0xffffe
    80003988:	b24080e7          	jalr	-1244(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>
}
    8000398c:	01813083          	ld	ra,24(sp)
    80003990:	01013403          	ld	s0,16(sp)
    80003994:	00813483          	ld	s1,8(sp)
    80003998:	00013903          	ld	s2,0(sp)
    8000399c:	02010113          	addi	sp,sp,32
    800039a0:	00008067          	ret

00000000800039a4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800039a4:	fd010113          	addi	sp,sp,-48
    800039a8:	02113423          	sd	ra,40(sp)
    800039ac:	02813023          	sd	s0,32(sp)
    800039b0:	00913c23          	sd	s1,24(sp)
    800039b4:	01213823          	sd	s2,16(sp)
    800039b8:	01313423          	sd	s3,8(sp)
    800039bc:	03010413          	addi	s0,sp,48
    800039c0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039c4:	00000993          	li	s3,0
    800039c8:	01c0006f          	j	800039e4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800039cc:	ffffe097          	auipc	ra,0xffffe
    800039d0:	9d4080e7          	jalr	-1580(ra) # 800013a0 <_Z15thread_dispatchv>
    800039d4:	0500006f          	j	80003a24 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800039d8:	00a00513          	li	a0,10
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	be4080e7          	jalr	-1052(ra) # 800015c0 <_Z4putcc>
    while (!threadEnd) {
    800039e4:	0000a797          	auipc	a5,0xa
    800039e8:	9147a783          	lw	a5,-1772(a5) # 8000d2f8 <_ZL9threadEnd>
    800039ec:	06079063          	bnez	a5,80003a4c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    800039f0:	00893503          	ld	a0,8(s2)
    800039f4:	00003097          	auipc	ra,0x3
    800039f8:	1ec080e7          	jalr	492(ra) # 80006be0 <_ZN6Buffer3getEv>
        i++;
    800039fc:	0019849b          	addiw	s1,s3,1
    80003a00:	0004899b          	sext.w	s3,s1
        putc(key);
    80003a04:	0ff57513          	andi	a0,a0,255
    80003a08:	ffffe097          	auipc	ra,0xffffe
    80003a0c:	bb8080e7          	jalr	-1096(ra) # 800015c0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003a10:	00092703          	lw	a4,0(s2)
    80003a14:	0027179b          	slliw	a5,a4,0x2
    80003a18:	00e787bb          	addw	a5,a5,a4
    80003a1c:	02f4e7bb          	remw	a5,s1,a5
    80003a20:	fa0786e3          	beqz	a5,800039cc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003a24:	05000793          	li	a5,80
    80003a28:	02f4e4bb          	remw	s1,s1,a5
    80003a2c:	fa049ce3          	bnez	s1,800039e4 <_ZL8consumerPv+0x40>
    80003a30:	fa9ff06f          	j	800039d8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003a34:	00893503          	ld	a0,8(s2)
    80003a38:	00003097          	auipc	ra,0x3
    80003a3c:	1a8080e7          	jalr	424(ra) # 80006be0 <_ZN6Buffer3getEv>
        putc(key);
    80003a40:	0ff57513          	andi	a0,a0,255
    80003a44:	ffffe097          	auipc	ra,0xffffe
    80003a48:	b7c080e7          	jalr	-1156(ra) # 800015c0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003a4c:	00893503          	ld	a0,8(s2)
    80003a50:	00003097          	auipc	ra,0x3
    80003a54:	21c080e7          	jalr	540(ra) # 80006c6c <_ZN6Buffer6getCntEv>
    80003a58:	fca04ee3          	bgtz	a0,80003a34 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003a5c:	01093503          	ld	a0,16(s2)
    80003a60:	ffffe097          	auipc	ra,0xffffe
    80003a64:	a48080e7          	jalr	-1464(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>
}
    80003a68:	02813083          	ld	ra,40(sp)
    80003a6c:	02013403          	ld	s0,32(sp)
    80003a70:	01813483          	ld	s1,24(sp)
    80003a74:	01013903          	ld	s2,16(sp)
    80003a78:	00813983          	ld	s3,8(sp)
    80003a7c:	03010113          	addi	sp,sp,48
    80003a80:	00008067          	ret

0000000080003a84 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003a84:	f9010113          	addi	sp,sp,-112
    80003a88:	06113423          	sd	ra,104(sp)
    80003a8c:	06813023          	sd	s0,96(sp)
    80003a90:	04913c23          	sd	s1,88(sp)
    80003a94:	05213823          	sd	s2,80(sp)
    80003a98:	05313423          	sd	s3,72(sp)
    80003a9c:	05413023          	sd	s4,64(sp)
    80003aa0:	03513c23          	sd	s5,56(sp)
    80003aa4:	03613823          	sd	s6,48(sp)
    80003aa8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80003aac:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80003ab0:	00006517          	auipc	a0,0x6
    80003ab4:	8c850513          	addi	a0,a0,-1848 # 80009378 <CONSOLE_STATUS+0x368>
    80003ab8:	00002097          	auipc	ra,0x2
    80003abc:	220080e7          	jalr	544(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    80003ac0:	01e00593          	li	a1,30
    80003ac4:	fa040493          	addi	s1,s0,-96
    80003ac8:	00048513          	mv	a0,s1
    80003acc:	00002097          	auipc	ra,0x2
    80003ad0:	294080e7          	jalr	660(ra) # 80005d60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003ad4:	00048513          	mv	a0,s1
    80003ad8:	00002097          	auipc	ra,0x2
    80003adc:	360080e7          	jalr	864(ra) # 80005e38 <_Z11stringToIntPKc>
    80003ae0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003ae4:	00006517          	auipc	a0,0x6
    80003ae8:	8b450513          	addi	a0,a0,-1868 # 80009398 <CONSOLE_STATUS+0x388>
    80003aec:	00002097          	auipc	ra,0x2
    80003af0:	1ec080e7          	jalr	492(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    80003af4:	01e00593          	li	a1,30
    80003af8:	00048513          	mv	a0,s1
    80003afc:	00002097          	auipc	ra,0x2
    80003b00:	264080e7          	jalr	612(ra) # 80005d60 <_Z9getStringPci>
    n = stringToInt(input);
    80003b04:	00048513          	mv	a0,s1
    80003b08:	00002097          	auipc	ra,0x2
    80003b0c:	330080e7          	jalr	816(ra) # 80005e38 <_Z11stringToIntPKc>
    80003b10:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003b14:	00006517          	auipc	a0,0x6
    80003b18:	8a450513          	addi	a0,a0,-1884 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80003b1c:	00002097          	auipc	ra,0x2
    80003b20:	1bc080e7          	jalr	444(ra) # 80005cd8 <_Z11printStringPKc>
    80003b24:	00000613          	li	a2,0
    80003b28:	00a00593          	li	a1,10
    80003b2c:	00090513          	mv	a0,s2
    80003b30:	00002097          	auipc	ra,0x2
    80003b34:	358080e7          	jalr	856(ra) # 80005e88 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003b38:	00006517          	auipc	a0,0x6
    80003b3c:	89850513          	addi	a0,a0,-1896 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80003b40:	00002097          	auipc	ra,0x2
    80003b44:	198080e7          	jalr	408(ra) # 80005cd8 <_Z11printStringPKc>
    80003b48:	00000613          	li	a2,0
    80003b4c:	00a00593          	li	a1,10
    80003b50:	00048513          	mv	a0,s1
    80003b54:	00002097          	auipc	ra,0x2
    80003b58:	334080e7          	jalr	820(ra) # 80005e88 <_Z8printIntiii>
    printString(".\n");
    80003b5c:	00006517          	auipc	a0,0x6
    80003b60:	88c50513          	addi	a0,a0,-1908 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80003b64:	00002097          	auipc	ra,0x2
    80003b68:	174080e7          	jalr	372(ra) # 80005cd8 <_Z11printStringPKc>
    if(threadNum > n) {
    80003b6c:	0324c463          	blt	s1,s2,80003b94 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003b70:	03205c63          	blez	s2,80003ba8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003b74:	03800513          	li	a0,56
    80003b78:	ffffe097          	auipc	ra,0xffffe
    80003b7c:	64c080e7          	jalr	1612(ra) # 800021c4 <_Znwm>
    80003b80:	00050a13          	mv	s4,a0
    80003b84:	00048593          	mv	a1,s1
    80003b88:	00003097          	auipc	ra,0x3
    80003b8c:	f2c080e7          	jalr	-212(ra) # 80006ab4 <_ZN6BufferC1Ei>
    80003b90:	0300006f          	j	80003bc0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003b94:	00006517          	auipc	a0,0x6
    80003b98:	85c50513          	addi	a0,a0,-1956 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80003b9c:	00002097          	auipc	ra,0x2
    80003ba0:	13c080e7          	jalr	316(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    80003ba4:	0140006f          	j	80003bb8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003ba8:	00006517          	auipc	a0,0x6
    80003bac:	88850513          	addi	a0,a0,-1912 # 80009430 <CONSOLE_STATUS+0x420>
    80003bb0:	00002097          	auipc	ra,0x2
    80003bb4:	128080e7          	jalr	296(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    80003bb8:	000b0113          	mv	sp,s6
    80003bbc:	1500006f          	j	80003d0c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80003bc0:	00000593          	li	a1,0
    80003bc4:	00009517          	auipc	a0,0x9
    80003bc8:	73c50513          	addi	a0,a0,1852 # 8000d300 <_ZL10waitForAll>
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	810080e7          	jalr	-2032(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
    thread_t threads[threadNum];
    80003bd4:	00391793          	slli	a5,s2,0x3
    80003bd8:	00f78793          	addi	a5,a5,15
    80003bdc:	ff07f793          	andi	a5,a5,-16
    80003be0:	40f10133          	sub	sp,sp,a5
    80003be4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003be8:	0019071b          	addiw	a4,s2,1
    80003bec:	00171793          	slli	a5,a4,0x1
    80003bf0:	00e787b3          	add	a5,a5,a4
    80003bf4:	00379793          	slli	a5,a5,0x3
    80003bf8:	00f78793          	addi	a5,a5,15
    80003bfc:	ff07f793          	andi	a5,a5,-16
    80003c00:	40f10133          	sub	sp,sp,a5
    80003c04:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003c08:	00191613          	slli	a2,s2,0x1
    80003c0c:	012607b3          	add	a5,a2,s2
    80003c10:	00379793          	slli	a5,a5,0x3
    80003c14:	00f987b3          	add	a5,s3,a5
    80003c18:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003c1c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003c20:	00009717          	auipc	a4,0x9
    80003c24:	6e073703          	ld	a4,1760(a4) # 8000d300 <_ZL10waitForAll>
    80003c28:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003c2c:	00078613          	mv	a2,a5
    80003c30:	00000597          	auipc	a1,0x0
    80003c34:	d7458593          	addi	a1,a1,-652 # 800039a4 <_ZL8consumerPv>
    80003c38:	f9840513          	addi	a0,s0,-104
    80003c3c:	ffffd097          	auipc	ra,0xffffd
    80003c40:	664080e7          	jalr	1636(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c44:	00000493          	li	s1,0
    80003c48:	0280006f          	j	80003c70 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003c4c:	00000597          	auipc	a1,0x0
    80003c50:	c1458593          	addi	a1,a1,-1004 # 80003860 <_ZL16producerKeyboardPv>
                      data + i);
    80003c54:	00179613          	slli	a2,a5,0x1
    80003c58:	00f60633          	add	a2,a2,a5
    80003c5c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003c60:	00c98633          	add	a2,s3,a2
    80003c64:	ffffd097          	auipc	ra,0xffffd
    80003c68:	63c080e7          	jalr	1596(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003c6c:	0014849b          	addiw	s1,s1,1
    80003c70:	0524d263          	bge	s1,s2,80003cb4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003c74:	00149793          	slli	a5,s1,0x1
    80003c78:	009787b3          	add	a5,a5,s1
    80003c7c:	00379793          	slli	a5,a5,0x3
    80003c80:	00f987b3          	add	a5,s3,a5
    80003c84:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003c88:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003c8c:	00009717          	auipc	a4,0x9
    80003c90:	67473703          	ld	a4,1652(a4) # 8000d300 <_ZL10waitForAll>
    80003c94:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003c98:	00048793          	mv	a5,s1
    80003c9c:	00349513          	slli	a0,s1,0x3
    80003ca0:	00aa8533          	add	a0,s5,a0
    80003ca4:	fa9054e3          	blez	s1,80003c4c <_Z22producerConsumer_C_APIv+0x1c8>
    80003ca8:	00000597          	auipc	a1,0x0
    80003cac:	c6858593          	addi	a1,a1,-920 # 80003910 <_ZL8producerPv>
    80003cb0:	fa5ff06f          	j	80003c54 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003cb4:	ffffd097          	auipc	ra,0xffffd
    80003cb8:	6ec080e7          	jalr	1772(ra) # 800013a0 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003cbc:	00000493          	li	s1,0
    80003cc0:	00994e63          	blt	s2,s1,80003cdc <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003cc4:	00009517          	auipc	a0,0x9
    80003cc8:	63c53503          	ld	a0,1596(a0) # 8000d300 <_ZL10waitForAll>
    80003ccc:	ffffd097          	auipc	ra,0xffffd
    80003cd0:	79c080e7          	jalr	1948(ra) # 80001468 <_Z8sem_waitP10KSemaphore>
    for (int i = 0; i <= threadNum; i++) {
    80003cd4:	0014849b          	addiw	s1,s1,1
    80003cd8:	fe9ff06f          	j	80003cc0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003cdc:	00009517          	auipc	a0,0x9
    80003ce0:	62453503          	ld	a0,1572(a0) # 8000d300 <_ZL10waitForAll>
    80003ce4:	ffffd097          	auipc	ra,0xffffd
    80003ce8:	744080e7          	jalr	1860(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
    delete buffer;
    80003cec:	000a0e63          	beqz	s4,80003d08 <_Z22producerConsumer_C_APIv+0x284>
    80003cf0:	000a0513          	mv	a0,s4
    80003cf4:	00003097          	auipc	ra,0x3
    80003cf8:	000080e7          	jalr	ra # 80006cf4 <_ZN6BufferD1Ev>
    80003cfc:	000a0513          	mv	a0,s4
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	524080e7          	jalr	1316(ra) # 80002224 <_ZdlPv>
    80003d08:	000b0113          	mv	sp,s6

}
    80003d0c:	f9040113          	addi	sp,s0,-112
    80003d10:	06813083          	ld	ra,104(sp)
    80003d14:	06013403          	ld	s0,96(sp)
    80003d18:	05813483          	ld	s1,88(sp)
    80003d1c:	05013903          	ld	s2,80(sp)
    80003d20:	04813983          	ld	s3,72(sp)
    80003d24:	04013a03          	ld	s4,64(sp)
    80003d28:	03813a83          	ld	s5,56(sp)
    80003d2c:	03013b03          	ld	s6,48(sp)
    80003d30:	07010113          	addi	sp,sp,112
    80003d34:	00008067          	ret
    80003d38:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003d3c:	000a0513          	mv	a0,s4
    80003d40:	ffffe097          	auipc	ra,0xffffe
    80003d44:	4e4080e7          	jalr	1252(ra) # 80002224 <_ZdlPv>
    80003d48:	00048513          	mv	a0,s1
    80003d4c:	0000a097          	auipc	ra,0xa
    80003d50:	6cc080e7          	jalr	1740(ra) # 8000e418 <_Unwind_Resume>

0000000080003d54 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003d54:	fe010113          	addi	sp,sp,-32
    80003d58:	00113c23          	sd	ra,24(sp)
    80003d5c:	00813823          	sd	s0,16(sp)
    80003d60:	00913423          	sd	s1,8(sp)
    80003d64:	01213023          	sd	s2,0(sp)
    80003d68:	02010413          	addi	s0,sp,32
    80003d6c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003d70:	00100793          	li	a5,1
    80003d74:	02a7f863          	bgeu	a5,a0,80003da4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003d78:	00a00793          	li	a5,10
    80003d7c:	02f577b3          	remu	a5,a0,a5
    80003d80:	02078e63          	beqz	a5,80003dbc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003d84:	fff48513          	addi	a0,s1,-1
    80003d88:	00000097          	auipc	ra,0x0
    80003d8c:	fcc080e7          	jalr	-52(ra) # 80003d54 <_ZL9fibonaccim>
    80003d90:	00050913          	mv	s2,a0
    80003d94:	ffe48513          	addi	a0,s1,-2
    80003d98:	00000097          	auipc	ra,0x0
    80003d9c:	fbc080e7          	jalr	-68(ra) # 80003d54 <_ZL9fibonaccim>
    80003da0:	00a90533          	add	a0,s2,a0
}
    80003da4:	01813083          	ld	ra,24(sp)
    80003da8:	01013403          	ld	s0,16(sp)
    80003dac:	00813483          	ld	s1,8(sp)
    80003db0:	00013903          	ld	s2,0(sp)
    80003db4:	02010113          	addi	sp,sp,32
    80003db8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003dbc:	ffffd097          	auipc	ra,0xffffd
    80003dc0:	5e4080e7          	jalr	1508(ra) # 800013a0 <_Z15thread_dispatchv>
    80003dc4:	fc1ff06f          	j	80003d84 <_ZL9fibonaccim+0x30>

0000000080003dc8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003dc8:	fe010113          	addi	sp,sp,-32
    80003dcc:	00113c23          	sd	ra,24(sp)
    80003dd0:	00813823          	sd	s0,16(sp)
    80003dd4:	00913423          	sd	s1,8(sp)
    80003dd8:	01213023          	sd	s2,0(sp)
    80003ddc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003de0:	00000913          	li	s2,0
    80003de4:	0380006f          	j	80003e1c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003de8:	ffffd097          	auipc	ra,0xffffd
    80003dec:	5b8080e7          	jalr	1464(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003df0:	00148493          	addi	s1,s1,1
    80003df4:	000027b7          	lui	a5,0x2
    80003df8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003dfc:	0097ee63          	bltu	a5,s1,80003e18 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e00:	00000713          	li	a4,0
    80003e04:	000077b7          	lui	a5,0x7
    80003e08:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e0c:	fce7eee3          	bltu	a5,a4,80003de8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003e10:	00170713          	addi	a4,a4,1
    80003e14:	ff1ff06f          	j	80003e04 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003e18:	00190913          	addi	s2,s2,1
    80003e1c:	00900793          	li	a5,9
    80003e20:	0527e063          	bltu	a5,s2,80003e60 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003e24:	00005517          	auipc	a0,0x5
    80003e28:	63c50513          	addi	a0,a0,1596 # 80009460 <CONSOLE_STATUS+0x450>
    80003e2c:	00002097          	auipc	ra,0x2
    80003e30:	eac080e7          	jalr	-340(ra) # 80005cd8 <_Z11printStringPKc>
    80003e34:	00000613          	li	a2,0
    80003e38:	00a00593          	li	a1,10
    80003e3c:	0009051b          	sext.w	a0,s2
    80003e40:	00002097          	auipc	ra,0x2
    80003e44:	048080e7          	jalr	72(ra) # 80005e88 <_Z8printIntiii>
    80003e48:	00005517          	auipc	a0,0x5
    80003e4c:	35050513          	addi	a0,a0,848 # 80009198 <CONSOLE_STATUS+0x188>
    80003e50:	00002097          	auipc	ra,0x2
    80003e54:	e88080e7          	jalr	-376(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e58:	00000493          	li	s1,0
    80003e5c:	f99ff06f          	j	80003df4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003e60:	00005517          	auipc	a0,0x5
    80003e64:	60850513          	addi	a0,a0,1544 # 80009468 <CONSOLE_STATUS+0x458>
    80003e68:	00002097          	auipc	ra,0x2
    80003e6c:	e70080e7          	jalr	-400(ra) # 80005cd8 <_Z11printStringPKc>
    finishedA = true;
    80003e70:	00100793          	li	a5,1
    80003e74:	00009717          	auipc	a4,0x9
    80003e78:	48f70a23          	sb	a5,1172(a4) # 8000d308 <_ZL9finishedA>
}
    80003e7c:	01813083          	ld	ra,24(sp)
    80003e80:	01013403          	ld	s0,16(sp)
    80003e84:	00813483          	ld	s1,8(sp)
    80003e88:	00013903          	ld	s2,0(sp)
    80003e8c:	02010113          	addi	sp,sp,32
    80003e90:	00008067          	ret

0000000080003e94 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003e94:	fe010113          	addi	sp,sp,-32
    80003e98:	00113c23          	sd	ra,24(sp)
    80003e9c:	00813823          	sd	s0,16(sp)
    80003ea0:	00913423          	sd	s1,8(sp)
    80003ea4:	01213023          	sd	s2,0(sp)
    80003ea8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003eac:	00000913          	li	s2,0
    80003eb0:	0380006f          	j	80003ee8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003eb4:	ffffd097          	auipc	ra,0xffffd
    80003eb8:	4ec080e7          	jalr	1260(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ebc:	00148493          	addi	s1,s1,1
    80003ec0:	000027b7          	lui	a5,0x2
    80003ec4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ec8:	0097ee63          	bltu	a5,s1,80003ee4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ecc:	00000713          	li	a4,0
    80003ed0:	000077b7          	lui	a5,0x7
    80003ed4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ed8:	fce7eee3          	bltu	a5,a4,80003eb4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003edc:	00170713          	addi	a4,a4,1
    80003ee0:	ff1ff06f          	j	80003ed0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003ee4:	00190913          	addi	s2,s2,1
    80003ee8:	00f00793          	li	a5,15
    80003eec:	0527e063          	bltu	a5,s2,80003f2c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ef0:	00005517          	auipc	a0,0x5
    80003ef4:	58850513          	addi	a0,a0,1416 # 80009478 <CONSOLE_STATUS+0x468>
    80003ef8:	00002097          	auipc	ra,0x2
    80003efc:	de0080e7          	jalr	-544(ra) # 80005cd8 <_Z11printStringPKc>
    80003f00:	00000613          	li	a2,0
    80003f04:	00a00593          	li	a1,10
    80003f08:	0009051b          	sext.w	a0,s2
    80003f0c:	00002097          	auipc	ra,0x2
    80003f10:	f7c080e7          	jalr	-132(ra) # 80005e88 <_Z8printIntiii>
    80003f14:	00005517          	auipc	a0,0x5
    80003f18:	28450513          	addi	a0,a0,644 # 80009198 <CONSOLE_STATUS+0x188>
    80003f1c:	00002097          	auipc	ra,0x2
    80003f20:	dbc080e7          	jalr	-580(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f24:	00000493          	li	s1,0
    80003f28:	f99ff06f          	j	80003ec0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003f2c:	00005517          	auipc	a0,0x5
    80003f30:	55450513          	addi	a0,a0,1364 # 80009480 <CONSOLE_STATUS+0x470>
    80003f34:	00002097          	auipc	ra,0x2
    80003f38:	da4080e7          	jalr	-604(ra) # 80005cd8 <_Z11printStringPKc>
    finishedB = true;
    80003f3c:	00100793          	li	a5,1
    80003f40:	00009717          	auipc	a4,0x9
    80003f44:	3cf704a3          	sb	a5,969(a4) # 8000d309 <_ZL9finishedB>
    thread_dispatch();
    80003f48:	ffffd097          	auipc	ra,0xffffd
    80003f4c:	458080e7          	jalr	1112(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80003f50:	01813083          	ld	ra,24(sp)
    80003f54:	01013403          	ld	s0,16(sp)
    80003f58:	00813483          	ld	s1,8(sp)
    80003f5c:	00013903          	ld	s2,0(sp)
    80003f60:	02010113          	addi	sp,sp,32
    80003f64:	00008067          	ret

0000000080003f68 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003f68:	fe010113          	addi	sp,sp,-32
    80003f6c:	00113c23          	sd	ra,24(sp)
    80003f70:	00813823          	sd	s0,16(sp)
    80003f74:	00913423          	sd	s1,8(sp)
    80003f78:	01213023          	sd	s2,0(sp)
    80003f7c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003f80:	00000493          	li	s1,0
    80003f84:	0400006f          	j	80003fc4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003f88:	00005517          	auipc	a0,0x5
    80003f8c:	50850513          	addi	a0,a0,1288 # 80009490 <CONSOLE_STATUS+0x480>
    80003f90:	00002097          	auipc	ra,0x2
    80003f94:	d48080e7          	jalr	-696(ra) # 80005cd8 <_Z11printStringPKc>
    80003f98:	00000613          	li	a2,0
    80003f9c:	00a00593          	li	a1,10
    80003fa0:	00048513          	mv	a0,s1
    80003fa4:	00002097          	auipc	ra,0x2
    80003fa8:	ee4080e7          	jalr	-284(ra) # 80005e88 <_Z8printIntiii>
    80003fac:	00005517          	auipc	a0,0x5
    80003fb0:	1ec50513          	addi	a0,a0,492 # 80009198 <CONSOLE_STATUS+0x188>
    80003fb4:	00002097          	auipc	ra,0x2
    80003fb8:	d24080e7          	jalr	-732(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003fbc:	0014849b          	addiw	s1,s1,1
    80003fc0:	0ff4f493          	andi	s1,s1,255
    80003fc4:	00200793          	li	a5,2
    80003fc8:	fc97f0e3          	bgeu	a5,s1,80003f88 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003fcc:	00005517          	auipc	a0,0x5
    80003fd0:	4cc50513          	addi	a0,a0,1228 # 80009498 <CONSOLE_STATUS+0x488>
    80003fd4:	00002097          	auipc	ra,0x2
    80003fd8:	d04080e7          	jalr	-764(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003fdc:	00700313          	li	t1,7
    thread_dispatch();
    80003fe0:	ffffd097          	auipc	ra,0xffffd
    80003fe4:	3c0080e7          	jalr	960(ra) # 800013a0 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003fe8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003fec:	00005517          	auipc	a0,0x5
    80003ff0:	4bc50513          	addi	a0,a0,1212 # 800094a8 <CONSOLE_STATUS+0x498>
    80003ff4:	00002097          	auipc	ra,0x2
    80003ff8:	ce4080e7          	jalr	-796(ra) # 80005cd8 <_Z11printStringPKc>
    80003ffc:	00000613          	li	a2,0
    80004000:	00a00593          	li	a1,10
    80004004:	0009051b          	sext.w	a0,s2
    80004008:	00002097          	auipc	ra,0x2
    8000400c:	e80080e7          	jalr	-384(ra) # 80005e88 <_Z8printIntiii>
    80004010:	00005517          	auipc	a0,0x5
    80004014:	18850513          	addi	a0,a0,392 # 80009198 <CONSOLE_STATUS+0x188>
    80004018:	00002097          	auipc	ra,0x2
    8000401c:	cc0080e7          	jalr	-832(ra) # 80005cd8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004020:	00c00513          	li	a0,12
    80004024:	00000097          	auipc	ra,0x0
    80004028:	d30080e7          	jalr	-720(ra) # 80003d54 <_ZL9fibonaccim>
    8000402c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004030:	00005517          	auipc	a0,0x5
    80004034:	48050513          	addi	a0,a0,1152 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80004038:	00002097          	auipc	ra,0x2
    8000403c:	ca0080e7          	jalr	-864(ra) # 80005cd8 <_Z11printStringPKc>
    80004040:	00000613          	li	a2,0
    80004044:	00a00593          	li	a1,10
    80004048:	0009051b          	sext.w	a0,s2
    8000404c:	00002097          	auipc	ra,0x2
    80004050:	e3c080e7          	jalr	-452(ra) # 80005e88 <_Z8printIntiii>
    80004054:	00005517          	auipc	a0,0x5
    80004058:	14450513          	addi	a0,a0,324 # 80009198 <CONSOLE_STATUS+0x188>
    8000405c:	00002097          	auipc	ra,0x2
    80004060:	c7c080e7          	jalr	-900(ra) # 80005cd8 <_Z11printStringPKc>
    80004064:	0400006f          	j	800040a4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004068:	00005517          	auipc	a0,0x5
    8000406c:	42850513          	addi	a0,a0,1064 # 80009490 <CONSOLE_STATUS+0x480>
    80004070:	00002097          	auipc	ra,0x2
    80004074:	c68080e7          	jalr	-920(ra) # 80005cd8 <_Z11printStringPKc>
    80004078:	00000613          	li	a2,0
    8000407c:	00a00593          	li	a1,10
    80004080:	00048513          	mv	a0,s1
    80004084:	00002097          	auipc	ra,0x2
    80004088:	e04080e7          	jalr	-508(ra) # 80005e88 <_Z8printIntiii>
    8000408c:	00005517          	auipc	a0,0x5
    80004090:	10c50513          	addi	a0,a0,268 # 80009198 <CONSOLE_STATUS+0x188>
    80004094:	00002097          	auipc	ra,0x2
    80004098:	c44080e7          	jalr	-956(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000409c:	0014849b          	addiw	s1,s1,1
    800040a0:	0ff4f493          	andi	s1,s1,255
    800040a4:	00500793          	li	a5,5
    800040a8:	fc97f0e3          	bgeu	a5,s1,80004068 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800040ac:	00005517          	auipc	a0,0x5
    800040b0:	3bc50513          	addi	a0,a0,956 # 80009468 <CONSOLE_STATUS+0x458>
    800040b4:	00002097          	auipc	ra,0x2
    800040b8:	c24080e7          	jalr	-988(ra) # 80005cd8 <_Z11printStringPKc>
    finishedC = true;
    800040bc:	00100793          	li	a5,1
    800040c0:	00009717          	auipc	a4,0x9
    800040c4:	24f70523          	sb	a5,586(a4) # 8000d30a <_ZL9finishedC>
    thread_dispatch();
    800040c8:	ffffd097          	auipc	ra,0xffffd
    800040cc:	2d8080e7          	jalr	728(ra) # 800013a0 <_Z15thread_dispatchv>
}
    800040d0:	01813083          	ld	ra,24(sp)
    800040d4:	01013403          	ld	s0,16(sp)
    800040d8:	00813483          	ld	s1,8(sp)
    800040dc:	00013903          	ld	s2,0(sp)
    800040e0:	02010113          	addi	sp,sp,32
    800040e4:	00008067          	ret

00000000800040e8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800040e8:	fe010113          	addi	sp,sp,-32
    800040ec:	00113c23          	sd	ra,24(sp)
    800040f0:	00813823          	sd	s0,16(sp)
    800040f4:	00913423          	sd	s1,8(sp)
    800040f8:	01213023          	sd	s2,0(sp)
    800040fc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004100:	00a00493          	li	s1,10
    80004104:	0400006f          	j	80004144 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004108:	00005517          	auipc	a0,0x5
    8000410c:	3b850513          	addi	a0,a0,952 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80004110:	00002097          	auipc	ra,0x2
    80004114:	bc8080e7          	jalr	-1080(ra) # 80005cd8 <_Z11printStringPKc>
    80004118:	00000613          	li	a2,0
    8000411c:	00a00593          	li	a1,10
    80004120:	00048513          	mv	a0,s1
    80004124:	00002097          	auipc	ra,0x2
    80004128:	d64080e7          	jalr	-668(ra) # 80005e88 <_Z8printIntiii>
    8000412c:	00005517          	auipc	a0,0x5
    80004130:	06c50513          	addi	a0,a0,108 # 80009198 <CONSOLE_STATUS+0x188>
    80004134:	00002097          	auipc	ra,0x2
    80004138:	ba4080e7          	jalr	-1116(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000413c:	0014849b          	addiw	s1,s1,1
    80004140:	0ff4f493          	andi	s1,s1,255
    80004144:	00c00793          	li	a5,12
    80004148:	fc97f0e3          	bgeu	a5,s1,80004108 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000414c:	00005517          	auipc	a0,0x5
    80004150:	37c50513          	addi	a0,a0,892 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80004154:	00002097          	auipc	ra,0x2
    80004158:	b84080e7          	jalr	-1148(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000415c:	00500313          	li	t1,5
    thread_dispatch();
    80004160:	ffffd097          	auipc	ra,0xffffd
    80004164:	240080e7          	jalr	576(ra) # 800013a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004168:	01000513          	li	a0,16
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	be8080e7          	jalr	-1048(ra) # 80003d54 <_ZL9fibonaccim>
    80004174:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004178:	00005517          	auipc	a0,0x5
    8000417c:	36050513          	addi	a0,a0,864 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80004180:	00002097          	auipc	ra,0x2
    80004184:	b58080e7          	jalr	-1192(ra) # 80005cd8 <_Z11printStringPKc>
    80004188:	00000613          	li	a2,0
    8000418c:	00a00593          	li	a1,10
    80004190:	0009051b          	sext.w	a0,s2
    80004194:	00002097          	auipc	ra,0x2
    80004198:	cf4080e7          	jalr	-780(ra) # 80005e88 <_Z8printIntiii>
    8000419c:	00005517          	auipc	a0,0x5
    800041a0:	ffc50513          	addi	a0,a0,-4 # 80009198 <CONSOLE_STATUS+0x188>
    800041a4:	00002097          	auipc	ra,0x2
    800041a8:	b34080e7          	jalr	-1228(ra) # 80005cd8 <_Z11printStringPKc>
    800041ac:	0400006f          	j	800041ec <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041b0:	00005517          	auipc	a0,0x5
    800041b4:	31050513          	addi	a0,a0,784 # 800094c0 <CONSOLE_STATUS+0x4b0>
    800041b8:	00002097          	auipc	ra,0x2
    800041bc:	b20080e7          	jalr	-1248(ra) # 80005cd8 <_Z11printStringPKc>
    800041c0:	00000613          	li	a2,0
    800041c4:	00a00593          	li	a1,10
    800041c8:	00048513          	mv	a0,s1
    800041cc:	00002097          	auipc	ra,0x2
    800041d0:	cbc080e7          	jalr	-836(ra) # 80005e88 <_Z8printIntiii>
    800041d4:	00005517          	auipc	a0,0x5
    800041d8:	fc450513          	addi	a0,a0,-60 # 80009198 <CONSOLE_STATUS+0x188>
    800041dc:	00002097          	auipc	ra,0x2
    800041e0:	afc080e7          	jalr	-1284(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800041e4:	0014849b          	addiw	s1,s1,1
    800041e8:	0ff4f493          	andi	s1,s1,255
    800041ec:	00f00793          	li	a5,15
    800041f0:	fc97f0e3          	bgeu	a5,s1,800041b0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800041f4:	00005517          	auipc	a0,0x5
    800041f8:	2f450513          	addi	a0,a0,756 # 800094e8 <CONSOLE_STATUS+0x4d8>
    800041fc:	00002097          	auipc	ra,0x2
    80004200:	adc080e7          	jalr	-1316(ra) # 80005cd8 <_Z11printStringPKc>
    finishedD = true;
    80004204:	00100793          	li	a5,1
    80004208:	00009717          	auipc	a4,0x9
    8000420c:	10f701a3          	sb	a5,259(a4) # 8000d30b <_ZL9finishedD>
    thread_dispatch();
    80004210:	ffffd097          	auipc	ra,0xffffd
    80004214:	190080e7          	jalr	400(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80004218:	01813083          	ld	ra,24(sp)
    8000421c:	01013403          	ld	s0,16(sp)
    80004220:	00813483          	ld	s1,8(sp)
    80004224:	00013903          	ld	s2,0(sp)
    80004228:	02010113          	addi	sp,sp,32
    8000422c:	00008067          	ret

0000000080004230 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004230:	fc010113          	addi	sp,sp,-64
    80004234:	02113c23          	sd	ra,56(sp)
    80004238:	02813823          	sd	s0,48(sp)
    8000423c:	02913423          	sd	s1,40(sp)
    80004240:	03213023          	sd	s2,32(sp)
    80004244:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004248:	02000513          	li	a0,32
    8000424c:	ffffe097          	auipc	ra,0xffffe
    80004250:	f78080e7          	jalr	-136(ra) # 800021c4 <_Znwm>
    80004254:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004258:	fffff097          	auipc	ra,0xfffff
    8000425c:	8fc080e7          	jalr	-1796(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80004260:	00007797          	auipc	a5,0x7
    80004264:	5e878793          	addi	a5,a5,1512 # 8000b848 <_ZTV7WorkerA+0x10>
    80004268:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000426c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004270:	00005517          	auipc	a0,0x5
    80004274:	28850513          	addi	a0,a0,648 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80004278:	00002097          	auipc	ra,0x2
    8000427c:	a60080e7          	jalr	-1440(ra) # 80005cd8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004280:	02000513          	li	a0,32
    80004284:	ffffe097          	auipc	ra,0xffffe
    80004288:	f40080e7          	jalr	-192(ra) # 800021c4 <_Znwm>
    8000428c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004290:	fffff097          	auipc	ra,0xfffff
    80004294:	8c4080e7          	jalr	-1852(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80004298:	00007797          	auipc	a5,0x7
    8000429c:	5d878793          	addi	a5,a5,1496 # 8000b870 <_ZTV7WorkerB+0x10>
    800042a0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800042a4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800042a8:	00005517          	auipc	a0,0x5
    800042ac:	26850513          	addi	a0,a0,616 # 80009510 <CONSOLE_STATUS+0x500>
    800042b0:	00002097          	auipc	ra,0x2
    800042b4:	a28080e7          	jalr	-1496(ra) # 80005cd8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800042b8:	02000513          	li	a0,32
    800042bc:	ffffe097          	auipc	ra,0xffffe
    800042c0:	f08080e7          	jalr	-248(ra) # 800021c4 <_Znwm>
    800042c4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800042c8:	fffff097          	auipc	ra,0xfffff
    800042cc:	88c080e7          	jalr	-1908(ra) # 80002b54 <_ZN6ThreadC1Ev>
    800042d0:	00007797          	auipc	a5,0x7
    800042d4:	5c878793          	addi	a5,a5,1480 # 8000b898 <_ZTV7WorkerC+0x10>
    800042d8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800042dc:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800042e0:	00005517          	auipc	a0,0x5
    800042e4:	24850513          	addi	a0,a0,584 # 80009528 <CONSOLE_STATUS+0x518>
    800042e8:	00002097          	auipc	ra,0x2
    800042ec:	9f0080e7          	jalr	-1552(ra) # 80005cd8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800042f0:	02000513          	li	a0,32
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	ed0080e7          	jalr	-304(ra) # 800021c4 <_Znwm>
    800042fc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004300:	fffff097          	auipc	ra,0xfffff
    80004304:	854080e7          	jalr	-1964(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80004308:	00007797          	auipc	a5,0x7
    8000430c:	5b878793          	addi	a5,a5,1464 # 8000b8c0 <_ZTV7WorkerD+0x10>
    80004310:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004314:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004318:	00005517          	auipc	a0,0x5
    8000431c:	22850513          	addi	a0,a0,552 # 80009540 <CONSOLE_STATUS+0x530>
    80004320:	00002097          	auipc	ra,0x2
    80004324:	9b8080e7          	jalr	-1608(ra) # 80005cd8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004328:	00000493          	li	s1,0
    8000432c:	00300793          	li	a5,3
    80004330:	0297c663          	blt	a5,s1,8000435c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004334:	00349793          	slli	a5,s1,0x3
    80004338:	fe040713          	addi	a4,s0,-32
    8000433c:	00f707b3          	add	a5,a4,a5
    80004340:	fe07b503          	ld	a0,-32(a5)
    80004344:	fffff097          	auipc	ra,0xfffff
    80004348:	840080e7          	jalr	-1984(ra) # 80002b84 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000434c:	0014849b          	addiw	s1,s1,1
    80004350:	fddff06f          	j	8000432c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004354:	fffff097          	auipc	ra,0xfffff
    80004358:	894080e7          	jalr	-1900(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000435c:	00009797          	auipc	a5,0x9
    80004360:	fac7c783          	lbu	a5,-84(a5) # 8000d308 <_ZL9finishedA>
    80004364:	fe0788e3          	beqz	a5,80004354 <_Z20Threads_CPP_API_testv+0x124>
    80004368:	00009797          	auipc	a5,0x9
    8000436c:	fa17c783          	lbu	a5,-95(a5) # 8000d309 <_ZL9finishedB>
    80004370:	fe0782e3          	beqz	a5,80004354 <_Z20Threads_CPP_API_testv+0x124>
    80004374:	00009797          	auipc	a5,0x9
    80004378:	f967c783          	lbu	a5,-106(a5) # 8000d30a <_ZL9finishedC>
    8000437c:	fc078ce3          	beqz	a5,80004354 <_Z20Threads_CPP_API_testv+0x124>
    80004380:	00009797          	auipc	a5,0x9
    80004384:	f8b7c783          	lbu	a5,-117(a5) # 8000d30b <_ZL9finishedD>
    80004388:	fc0786e3          	beqz	a5,80004354 <_Z20Threads_CPP_API_testv+0x124>
    8000438c:	fc040493          	addi	s1,s0,-64
    80004390:	0080006f          	j	80004398 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80004394:	00848493          	addi	s1,s1,8
    80004398:	fe040793          	addi	a5,s0,-32
    8000439c:	08f48663          	beq	s1,a5,80004428 <_Z20Threads_CPP_API_testv+0x1f8>
    800043a0:	0004b503          	ld	a0,0(s1)
    800043a4:	fe0508e3          	beqz	a0,80004394 <_Z20Threads_CPP_API_testv+0x164>
    800043a8:	00053783          	ld	a5,0(a0)
    800043ac:	0087b783          	ld	a5,8(a5)
    800043b0:	000780e7          	jalr	a5
    800043b4:	fe1ff06f          	j	80004394 <_Z20Threads_CPP_API_testv+0x164>
    800043b8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800043bc:	00048513          	mv	a0,s1
    800043c0:	ffffe097          	auipc	ra,0xffffe
    800043c4:	e64080e7          	jalr	-412(ra) # 80002224 <_ZdlPv>
    800043c8:	00090513          	mv	a0,s2
    800043cc:	0000a097          	auipc	ra,0xa
    800043d0:	04c080e7          	jalr	76(ra) # 8000e418 <_Unwind_Resume>
    800043d4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800043d8:	00048513          	mv	a0,s1
    800043dc:	ffffe097          	auipc	ra,0xffffe
    800043e0:	e48080e7          	jalr	-440(ra) # 80002224 <_ZdlPv>
    800043e4:	00090513          	mv	a0,s2
    800043e8:	0000a097          	auipc	ra,0xa
    800043ec:	030080e7          	jalr	48(ra) # 8000e418 <_Unwind_Resume>
    800043f0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800043f4:	00048513          	mv	a0,s1
    800043f8:	ffffe097          	auipc	ra,0xffffe
    800043fc:	e2c080e7          	jalr	-468(ra) # 80002224 <_ZdlPv>
    80004400:	00090513          	mv	a0,s2
    80004404:	0000a097          	auipc	ra,0xa
    80004408:	014080e7          	jalr	20(ra) # 8000e418 <_Unwind_Resume>
    8000440c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004410:	00048513          	mv	a0,s1
    80004414:	ffffe097          	auipc	ra,0xffffe
    80004418:	e10080e7          	jalr	-496(ra) # 80002224 <_ZdlPv>
    8000441c:	00090513          	mv	a0,s2
    80004420:	0000a097          	auipc	ra,0xa
    80004424:	ff8080e7          	jalr	-8(ra) # 8000e418 <_Unwind_Resume>
}
    80004428:	03813083          	ld	ra,56(sp)
    8000442c:	03013403          	ld	s0,48(sp)
    80004430:	02813483          	ld	s1,40(sp)
    80004434:	02013903          	ld	s2,32(sp)
    80004438:	04010113          	addi	sp,sp,64
    8000443c:	00008067          	ret

0000000080004440 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004440:	ff010113          	addi	sp,sp,-16
    80004444:	00113423          	sd	ra,8(sp)
    80004448:	00813023          	sd	s0,0(sp)
    8000444c:	01010413          	addi	s0,sp,16
    80004450:	00007797          	auipc	a5,0x7
    80004454:	3f878793          	addi	a5,a5,1016 # 8000b848 <_ZTV7WorkerA+0x10>
    80004458:	00f53023          	sd	a5,0(a0)
    8000445c:	ffffe097          	auipc	ra,0xffffe
    80004460:	5ec080e7          	jalr	1516(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004464:	00813083          	ld	ra,8(sp)
    80004468:	00013403          	ld	s0,0(sp)
    8000446c:	01010113          	addi	sp,sp,16
    80004470:	00008067          	ret

0000000080004474 <_ZN7WorkerAD0Ev>:
    80004474:	fe010113          	addi	sp,sp,-32
    80004478:	00113c23          	sd	ra,24(sp)
    8000447c:	00813823          	sd	s0,16(sp)
    80004480:	00913423          	sd	s1,8(sp)
    80004484:	02010413          	addi	s0,sp,32
    80004488:	00050493          	mv	s1,a0
    8000448c:	00007797          	auipc	a5,0x7
    80004490:	3bc78793          	addi	a5,a5,956 # 8000b848 <_ZTV7WorkerA+0x10>
    80004494:	00f53023          	sd	a5,0(a0)
    80004498:	ffffe097          	auipc	ra,0xffffe
    8000449c:	5b0080e7          	jalr	1456(ra) # 80002a48 <_ZN6ThreadD1Ev>
    800044a0:	00048513          	mv	a0,s1
    800044a4:	ffffe097          	auipc	ra,0xffffe
    800044a8:	d80080e7          	jalr	-640(ra) # 80002224 <_ZdlPv>
    800044ac:	01813083          	ld	ra,24(sp)
    800044b0:	01013403          	ld	s0,16(sp)
    800044b4:	00813483          	ld	s1,8(sp)
    800044b8:	02010113          	addi	sp,sp,32
    800044bc:	00008067          	ret

00000000800044c0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800044c0:	ff010113          	addi	sp,sp,-16
    800044c4:	00113423          	sd	ra,8(sp)
    800044c8:	00813023          	sd	s0,0(sp)
    800044cc:	01010413          	addi	s0,sp,16
    800044d0:	00007797          	auipc	a5,0x7
    800044d4:	3a078793          	addi	a5,a5,928 # 8000b870 <_ZTV7WorkerB+0x10>
    800044d8:	00f53023          	sd	a5,0(a0)
    800044dc:	ffffe097          	auipc	ra,0xffffe
    800044e0:	56c080e7          	jalr	1388(ra) # 80002a48 <_ZN6ThreadD1Ev>
    800044e4:	00813083          	ld	ra,8(sp)
    800044e8:	00013403          	ld	s0,0(sp)
    800044ec:	01010113          	addi	sp,sp,16
    800044f0:	00008067          	ret

00000000800044f4 <_ZN7WorkerBD0Ev>:
    800044f4:	fe010113          	addi	sp,sp,-32
    800044f8:	00113c23          	sd	ra,24(sp)
    800044fc:	00813823          	sd	s0,16(sp)
    80004500:	00913423          	sd	s1,8(sp)
    80004504:	02010413          	addi	s0,sp,32
    80004508:	00050493          	mv	s1,a0
    8000450c:	00007797          	auipc	a5,0x7
    80004510:	36478793          	addi	a5,a5,868 # 8000b870 <_ZTV7WorkerB+0x10>
    80004514:	00f53023          	sd	a5,0(a0)
    80004518:	ffffe097          	auipc	ra,0xffffe
    8000451c:	530080e7          	jalr	1328(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004520:	00048513          	mv	a0,s1
    80004524:	ffffe097          	auipc	ra,0xffffe
    80004528:	d00080e7          	jalr	-768(ra) # 80002224 <_ZdlPv>
    8000452c:	01813083          	ld	ra,24(sp)
    80004530:	01013403          	ld	s0,16(sp)
    80004534:	00813483          	ld	s1,8(sp)
    80004538:	02010113          	addi	sp,sp,32
    8000453c:	00008067          	ret

0000000080004540 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004540:	ff010113          	addi	sp,sp,-16
    80004544:	00113423          	sd	ra,8(sp)
    80004548:	00813023          	sd	s0,0(sp)
    8000454c:	01010413          	addi	s0,sp,16
    80004550:	00007797          	auipc	a5,0x7
    80004554:	34878793          	addi	a5,a5,840 # 8000b898 <_ZTV7WorkerC+0x10>
    80004558:	00f53023          	sd	a5,0(a0)
    8000455c:	ffffe097          	auipc	ra,0xffffe
    80004560:	4ec080e7          	jalr	1260(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004564:	00813083          	ld	ra,8(sp)
    80004568:	00013403          	ld	s0,0(sp)
    8000456c:	01010113          	addi	sp,sp,16
    80004570:	00008067          	ret

0000000080004574 <_ZN7WorkerCD0Ev>:
    80004574:	fe010113          	addi	sp,sp,-32
    80004578:	00113c23          	sd	ra,24(sp)
    8000457c:	00813823          	sd	s0,16(sp)
    80004580:	00913423          	sd	s1,8(sp)
    80004584:	02010413          	addi	s0,sp,32
    80004588:	00050493          	mv	s1,a0
    8000458c:	00007797          	auipc	a5,0x7
    80004590:	30c78793          	addi	a5,a5,780 # 8000b898 <_ZTV7WorkerC+0x10>
    80004594:	00f53023          	sd	a5,0(a0)
    80004598:	ffffe097          	auipc	ra,0xffffe
    8000459c:	4b0080e7          	jalr	1200(ra) # 80002a48 <_ZN6ThreadD1Ev>
    800045a0:	00048513          	mv	a0,s1
    800045a4:	ffffe097          	auipc	ra,0xffffe
    800045a8:	c80080e7          	jalr	-896(ra) # 80002224 <_ZdlPv>
    800045ac:	01813083          	ld	ra,24(sp)
    800045b0:	01013403          	ld	s0,16(sp)
    800045b4:	00813483          	ld	s1,8(sp)
    800045b8:	02010113          	addi	sp,sp,32
    800045bc:	00008067          	ret

00000000800045c0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800045c0:	ff010113          	addi	sp,sp,-16
    800045c4:	00113423          	sd	ra,8(sp)
    800045c8:	00813023          	sd	s0,0(sp)
    800045cc:	01010413          	addi	s0,sp,16
    800045d0:	00007797          	auipc	a5,0x7
    800045d4:	2f078793          	addi	a5,a5,752 # 8000b8c0 <_ZTV7WorkerD+0x10>
    800045d8:	00f53023          	sd	a5,0(a0)
    800045dc:	ffffe097          	auipc	ra,0xffffe
    800045e0:	46c080e7          	jalr	1132(ra) # 80002a48 <_ZN6ThreadD1Ev>
    800045e4:	00813083          	ld	ra,8(sp)
    800045e8:	00013403          	ld	s0,0(sp)
    800045ec:	01010113          	addi	sp,sp,16
    800045f0:	00008067          	ret

00000000800045f4 <_ZN7WorkerDD0Ev>:
    800045f4:	fe010113          	addi	sp,sp,-32
    800045f8:	00113c23          	sd	ra,24(sp)
    800045fc:	00813823          	sd	s0,16(sp)
    80004600:	00913423          	sd	s1,8(sp)
    80004604:	02010413          	addi	s0,sp,32
    80004608:	00050493          	mv	s1,a0
    8000460c:	00007797          	auipc	a5,0x7
    80004610:	2b478793          	addi	a5,a5,692 # 8000b8c0 <_ZTV7WorkerD+0x10>
    80004614:	00f53023          	sd	a5,0(a0)
    80004618:	ffffe097          	auipc	ra,0xffffe
    8000461c:	430080e7          	jalr	1072(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004620:	00048513          	mv	a0,s1
    80004624:	ffffe097          	auipc	ra,0xffffe
    80004628:	c00080e7          	jalr	-1024(ra) # 80002224 <_ZdlPv>
    8000462c:	01813083          	ld	ra,24(sp)
    80004630:	01013403          	ld	s0,16(sp)
    80004634:	00813483          	ld	s1,8(sp)
    80004638:	02010113          	addi	sp,sp,32
    8000463c:	00008067          	ret

0000000080004640 <_ZN7WorkerA3runEv>:
    void run() override {
    80004640:	ff010113          	addi	sp,sp,-16
    80004644:	00113423          	sd	ra,8(sp)
    80004648:	00813023          	sd	s0,0(sp)
    8000464c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004650:	00000593          	li	a1,0
    80004654:	fffff097          	auipc	ra,0xfffff
    80004658:	774080e7          	jalr	1908(ra) # 80003dc8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000465c:	00813083          	ld	ra,8(sp)
    80004660:	00013403          	ld	s0,0(sp)
    80004664:	01010113          	addi	sp,sp,16
    80004668:	00008067          	ret

000000008000466c <_ZN7WorkerB3runEv>:
    void run() override {
    8000466c:	ff010113          	addi	sp,sp,-16
    80004670:	00113423          	sd	ra,8(sp)
    80004674:	00813023          	sd	s0,0(sp)
    80004678:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000467c:	00000593          	li	a1,0
    80004680:	00000097          	auipc	ra,0x0
    80004684:	814080e7          	jalr	-2028(ra) # 80003e94 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004688:	00813083          	ld	ra,8(sp)
    8000468c:	00013403          	ld	s0,0(sp)
    80004690:	01010113          	addi	sp,sp,16
    80004694:	00008067          	ret

0000000080004698 <_ZN7WorkerC3runEv>:
    void run() override {
    80004698:	ff010113          	addi	sp,sp,-16
    8000469c:	00113423          	sd	ra,8(sp)
    800046a0:	00813023          	sd	s0,0(sp)
    800046a4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800046a8:	00000593          	li	a1,0
    800046ac:	00000097          	auipc	ra,0x0
    800046b0:	8bc080e7          	jalr	-1860(ra) # 80003f68 <_ZN7WorkerC11workerBodyCEPv>
    }
    800046b4:	00813083          	ld	ra,8(sp)
    800046b8:	00013403          	ld	s0,0(sp)
    800046bc:	01010113          	addi	sp,sp,16
    800046c0:	00008067          	ret

00000000800046c4 <_ZN7WorkerD3runEv>:
    void run() override {
    800046c4:	ff010113          	addi	sp,sp,-16
    800046c8:	00113423          	sd	ra,8(sp)
    800046cc:	00813023          	sd	s0,0(sp)
    800046d0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800046d4:	00000593          	li	a1,0
    800046d8:	00000097          	auipc	ra,0x0
    800046dc:	a10080e7          	jalr	-1520(ra) # 800040e8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800046e0:	00813083          	ld	ra,8(sp)
    800046e4:	00013403          	ld	s0,0(sp)
    800046e8:	01010113          	addi	sp,sp,16
    800046ec:	00008067          	ret

00000000800046f0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800046f0:	f8010113          	addi	sp,sp,-128
    800046f4:	06113c23          	sd	ra,120(sp)
    800046f8:	06813823          	sd	s0,112(sp)
    800046fc:	06913423          	sd	s1,104(sp)
    80004700:	07213023          	sd	s2,96(sp)
    80004704:	05313c23          	sd	s3,88(sp)
    80004708:	05413823          	sd	s4,80(sp)
    8000470c:	05513423          	sd	s5,72(sp)
    80004710:	05613023          	sd	s6,64(sp)
    80004714:	03713c23          	sd	s7,56(sp)
    80004718:	03813823          	sd	s8,48(sp)
    8000471c:	03913423          	sd	s9,40(sp)
    80004720:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004724:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004728:	00005517          	auipc	a0,0x5
    8000472c:	c5050513          	addi	a0,a0,-944 # 80009378 <CONSOLE_STATUS+0x368>
    80004730:	00001097          	auipc	ra,0x1
    80004734:	5a8080e7          	jalr	1448(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    80004738:	01e00593          	li	a1,30
    8000473c:	f8040493          	addi	s1,s0,-128
    80004740:	00048513          	mv	a0,s1
    80004744:	00001097          	auipc	ra,0x1
    80004748:	61c080e7          	jalr	1564(ra) # 80005d60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000474c:	00048513          	mv	a0,s1
    80004750:	00001097          	auipc	ra,0x1
    80004754:	6e8080e7          	jalr	1768(ra) # 80005e38 <_Z11stringToIntPKc>
    80004758:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000475c:	00005517          	auipc	a0,0x5
    80004760:	c3c50513          	addi	a0,a0,-964 # 80009398 <CONSOLE_STATUS+0x388>
    80004764:	00001097          	auipc	ra,0x1
    80004768:	574080e7          	jalr	1396(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    8000476c:	01e00593          	li	a1,30
    80004770:	00048513          	mv	a0,s1
    80004774:	00001097          	auipc	ra,0x1
    80004778:	5ec080e7          	jalr	1516(ra) # 80005d60 <_Z9getStringPci>
    n = stringToInt(input);
    8000477c:	00048513          	mv	a0,s1
    80004780:	00001097          	auipc	ra,0x1
    80004784:	6b8080e7          	jalr	1720(ra) # 80005e38 <_Z11stringToIntPKc>
    80004788:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000478c:	00005517          	auipc	a0,0x5
    80004790:	c2c50513          	addi	a0,a0,-980 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80004794:	00001097          	auipc	ra,0x1
    80004798:	544080e7          	jalr	1348(ra) # 80005cd8 <_Z11printStringPKc>
    printInt(threadNum);
    8000479c:	00000613          	li	a2,0
    800047a0:	00a00593          	li	a1,10
    800047a4:	00098513          	mv	a0,s3
    800047a8:	00001097          	auipc	ra,0x1
    800047ac:	6e0080e7          	jalr	1760(ra) # 80005e88 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800047b0:	00005517          	auipc	a0,0x5
    800047b4:	c2050513          	addi	a0,a0,-992 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800047b8:	00001097          	auipc	ra,0x1
    800047bc:	520080e7          	jalr	1312(ra) # 80005cd8 <_Z11printStringPKc>
    printInt(n);
    800047c0:	00000613          	li	a2,0
    800047c4:	00a00593          	li	a1,10
    800047c8:	00048513          	mv	a0,s1
    800047cc:	00001097          	auipc	ra,0x1
    800047d0:	6bc080e7          	jalr	1724(ra) # 80005e88 <_Z8printIntiii>
    printString(".\n");
    800047d4:	00005517          	auipc	a0,0x5
    800047d8:	c1450513          	addi	a0,a0,-1004 # 800093e8 <CONSOLE_STATUS+0x3d8>
    800047dc:	00001097          	auipc	ra,0x1
    800047e0:	4fc080e7          	jalr	1276(ra) # 80005cd8 <_Z11printStringPKc>
    if (threadNum > n) {
    800047e4:	0334c463          	blt	s1,s3,8000480c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800047e8:	03305c63          	blez	s3,80004820 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800047ec:	03800513          	li	a0,56
    800047f0:	ffffe097          	auipc	ra,0xffffe
    800047f4:	9d4080e7          	jalr	-1580(ra) # 800021c4 <_Znwm>
    800047f8:	00050a93          	mv	s5,a0
    800047fc:	00048593          	mv	a1,s1
    80004800:	00001097          	auipc	ra,0x1
    80004804:	7a8080e7          	jalr	1960(ra) # 80005fa8 <_ZN9BufferCPPC1Ei>
    80004808:	0300006f          	j	80004838 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000480c:	00005517          	auipc	a0,0x5
    80004810:	be450513          	addi	a0,a0,-1052 # 800093f0 <CONSOLE_STATUS+0x3e0>
    80004814:	00001097          	auipc	ra,0x1
    80004818:	4c4080e7          	jalr	1220(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    8000481c:	0140006f          	j	80004830 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004820:	00005517          	auipc	a0,0x5
    80004824:	c1050513          	addi	a0,a0,-1008 # 80009430 <CONSOLE_STATUS+0x420>
    80004828:	00001097          	auipc	ra,0x1
    8000482c:	4b0080e7          	jalr	1200(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    80004830:	000c0113          	mv	sp,s8
    80004834:	2140006f          	j	80004a48 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004838:	01000513          	li	a0,16
    8000483c:	ffffe097          	auipc	ra,0xffffe
    80004840:	988080e7          	jalr	-1656(ra) # 800021c4 <_Znwm>
    80004844:	00050913          	mv	s2,a0
    80004848:	00000593          	li	a1,0
    8000484c:	ffffe097          	auipc	ra,0xffffe
    80004850:	3e0080e7          	jalr	992(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    80004854:	00009797          	auipc	a5,0x9
    80004858:	ad27b223          	sd	s2,-1340(a5) # 8000d318 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000485c:	00399793          	slli	a5,s3,0x3
    80004860:	00f78793          	addi	a5,a5,15
    80004864:	ff07f793          	andi	a5,a5,-16
    80004868:	40f10133          	sub	sp,sp,a5
    8000486c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004870:	0019871b          	addiw	a4,s3,1
    80004874:	00171793          	slli	a5,a4,0x1
    80004878:	00e787b3          	add	a5,a5,a4
    8000487c:	00379793          	slli	a5,a5,0x3
    80004880:	00f78793          	addi	a5,a5,15
    80004884:	ff07f793          	andi	a5,a5,-16
    80004888:	40f10133          	sub	sp,sp,a5
    8000488c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80004890:	00199493          	slli	s1,s3,0x1
    80004894:	013484b3          	add	s1,s1,s3
    80004898:	00349493          	slli	s1,s1,0x3
    8000489c:	009b04b3          	add	s1,s6,s1
    800048a0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800048a4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800048a8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048ac:	02800513          	li	a0,40
    800048b0:	ffffe097          	auipc	ra,0xffffe
    800048b4:	914080e7          	jalr	-1772(ra) # 800021c4 <_Znwm>
    800048b8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800048bc:	ffffe097          	auipc	ra,0xffffe
    800048c0:	298080e7          	jalr	664(ra) # 80002b54 <_ZN6ThreadC1Ev>
    800048c4:	00007797          	auipc	a5,0x7
    800048c8:	07478793          	addi	a5,a5,116 # 8000b938 <_ZTV8Consumer+0x10>
    800048cc:	00fbb023          	sd	a5,0(s7)
    800048d0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800048d4:	000b8513          	mv	a0,s7
    800048d8:	ffffe097          	auipc	ra,0xffffe
    800048dc:	2ac080e7          	jalr	684(ra) # 80002b84 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800048e0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800048e4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800048e8:	00009797          	auipc	a5,0x9
    800048ec:	a307b783          	ld	a5,-1488(a5) # 8000d318 <_ZL10waitForAll>
    800048f0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048f4:	02800513          	li	a0,40
    800048f8:	ffffe097          	auipc	ra,0xffffe
    800048fc:	8cc080e7          	jalr	-1844(ra) # 800021c4 <_Znwm>
    80004900:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004904:	ffffe097          	auipc	ra,0xffffe
    80004908:	250080e7          	jalr	592(ra) # 80002b54 <_ZN6ThreadC1Ev>
    8000490c:	00007797          	auipc	a5,0x7
    80004910:	fdc78793          	addi	a5,a5,-36 # 8000b8e8 <_ZTV16ProducerKeyborad+0x10>
    80004914:	00f4b023          	sd	a5,0(s1)
    80004918:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000491c:	009a3023          	sd	s1,0(s4) # 1000 <_entry-0x7ffff000>
    producers[0]->start();
    80004920:	00048513          	mv	a0,s1
    80004924:	ffffe097          	auipc	ra,0xffffe
    80004928:	260080e7          	jalr	608(ra) # 80002b84 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000492c:	00100913          	li	s2,1
    80004930:	0300006f          	j	80004960 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004934:	00007797          	auipc	a5,0x7
    80004938:	fdc78793          	addi	a5,a5,-36 # 8000b910 <_ZTV8Producer+0x10>
    8000493c:	00fcb023          	sd	a5,0(s9)
    80004940:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004944:	00391793          	slli	a5,s2,0x3
    80004948:	00fa07b3          	add	a5,s4,a5
    8000494c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004950:	000c8513          	mv	a0,s9
    80004954:	ffffe097          	auipc	ra,0xffffe
    80004958:	230080e7          	jalr	560(ra) # 80002b84 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000495c:	0019091b          	addiw	s2,s2,1
    80004960:	05395263          	bge	s2,s3,800049a4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004964:	00191493          	slli	s1,s2,0x1
    80004968:	012484b3          	add	s1,s1,s2
    8000496c:	00349493          	slli	s1,s1,0x3
    80004970:	009b04b3          	add	s1,s6,s1
    80004974:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004978:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000497c:	00009797          	auipc	a5,0x9
    80004980:	99c7b783          	ld	a5,-1636(a5) # 8000d318 <_ZL10waitForAll>
    80004984:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004988:	02800513          	li	a0,40
    8000498c:	ffffe097          	auipc	ra,0xffffe
    80004990:	838080e7          	jalr	-1992(ra) # 800021c4 <_Znwm>
    80004994:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004998:	ffffe097          	auipc	ra,0xffffe
    8000499c:	1bc080e7          	jalr	444(ra) # 80002b54 <_ZN6ThreadC1Ev>
    800049a0:	f95ff06f          	j	80004934 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800049a4:	ffffe097          	auipc	ra,0xffffe
    800049a8:	244080e7          	jalr	580(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800049ac:	00000493          	li	s1,0
    800049b0:	0099ce63          	blt	s3,s1,800049cc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800049b4:	00009517          	auipc	a0,0x9
    800049b8:	96453503          	ld	a0,-1692(a0) # 8000d318 <_ZL10waitForAll>
    800049bc:	ffffe097          	auipc	ra,0xffffe
    800049c0:	2ac080e7          	jalr	684(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800049c4:	0014849b          	addiw	s1,s1,1
    800049c8:	fe9ff06f          	j	800049b0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800049cc:	00009517          	auipc	a0,0x9
    800049d0:	94c53503          	ld	a0,-1716(a0) # 8000d318 <_ZL10waitForAll>
    800049d4:	00050863          	beqz	a0,800049e4 <_Z20testConsumerProducerv+0x2f4>
    800049d8:	00053783          	ld	a5,0(a0)
    800049dc:	0087b783          	ld	a5,8(a5)
    800049e0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800049e4:	00000493          	li	s1,0
    800049e8:	0080006f          	j	800049f0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800049ec:	0014849b          	addiw	s1,s1,1
    800049f0:	0334d263          	bge	s1,s3,80004a14 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    800049f4:	00349793          	slli	a5,s1,0x3
    800049f8:	00fa07b3          	add	a5,s4,a5
    800049fc:	0007b503          	ld	a0,0(a5)
    80004a00:	fe0506e3          	beqz	a0,800049ec <_Z20testConsumerProducerv+0x2fc>
    80004a04:	00053783          	ld	a5,0(a0)
    80004a08:	0087b783          	ld	a5,8(a5)
    80004a0c:	000780e7          	jalr	a5
    80004a10:	fddff06f          	j	800049ec <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004a14:	000b8a63          	beqz	s7,80004a28 <_Z20testConsumerProducerv+0x338>
    80004a18:	000bb783          	ld	a5,0(s7)
    80004a1c:	0087b783          	ld	a5,8(a5)
    80004a20:	000b8513          	mv	a0,s7
    80004a24:	000780e7          	jalr	a5
    delete buffer;
    80004a28:	000a8e63          	beqz	s5,80004a44 <_Z20testConsumerProducerv+0x354>
    80004a2c:	000a8513          	mv	a0,s5
    80004a30:	00002097          	auipc	ra,0x2
    80004a34:	870080e7          	jalr	-1936(ra) # 800062a0 <_ZN9BufferCPPD1Ev>
    80004a38:	000a8513          	mv	a0,s5
    80004a3c:	ffffd097          	auipc	ra,0xffffd
    80004a40:	7e8080e7          	jalr	2024(ra) # 80002224 <_ZdlPv>
    80004a44:	000c0113          	mv	sp,s8
}
    80004a48:	f8040113          	addi	sp,s0,-128
    80004a4c:	07813083          	ld	ra,120(sp)
    80004a50:	07013403          	ld	s0,112(sp)
    80004a54:	06813483          	ld	s1,104(sp)
    80004a58:	06013903          	ld	s2,96(sp)
    80004a5c:	05813983          	ld	s3,88(sp)
    80004a60:	05013a03          	ld	s4,80(sp)
    80004a64:	04813a83          	ld	s5,72(sp)
    80004a68:	04013b03          	ld	s6,64(sp)
    80004a6c:	03813b83          	ld	s7,56(sp)
    80004a70:	03013c03          	ld	s8,48(sp)
    80004a74:	02813c83          	ld	s9,40(sp)
    80004a78:	08010113          	addi	sp,sp,128
    80004a7c:	00008067          	ret
    80004a80:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004a84:	000a8513          	mv	a0,s5
    80004a88:	ffffd097          	auipc	ra,0xffffd
    80004a8c:	79c080e7          	jalr	1948(ra) # 80002224 <_ZdlPv>
    80004a90:	00048513          	mv	a0,s1
    80004a94:	0000a097          	auipc	ra,0xa
    80004a98:	984080e7          	jalr	-1660(ra) # 8000e418 <_Unwind_Resume>
    80004a9c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80004aa0:	00090513          	mv	a0,s2
    80004aa4:	ffffd097          	auipc	ra,0xffffd
    80004aa8:	780080e7          	jalr	1920(ra) # 80002224 <_ZdlPv>
    80004aac:	00048513          	mv	a0,s1
    80004ab0:	0000a097          	auipc	ra,0xa
    80004ab4:	968080e7          	jalr	-1688(ra) # 8000e418 <_Unwind_Resume>
    80004ab8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80004abc:	000b8513          	mv	a0,s7
    80004ac0:	ffffd097          	auipc	ra,0xffffd
    80004ac4:	764080e7          	jalr	1892(ra) # 80002224 <_ZdlPv>
    80004ac8:	00048513          	mv	a0,s1
    80004acc:	0000a097          	auipc	ra,0xa
    80004ad0:	94c080e7          	jalr	-1716(ra) # 8000e418 <_Unwind_Resume>
    80004ad4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004ad8:	00048513          	mv	a0,s1
    80004adc:	ffffd097          	auipc	ra,0xffffd
    80004ae0:	748080e7          	jalr	1864(ra) # 80002224 <_ZdlPv>
    80004ae4:	00090513          	mv	a0,s2
    80004ae8:	0000a097          	auipc	ra,0xa
    80004aec:	930080e7          	jalr	-1744(ra) # 8000e418 <_Unwind_Resume>
    80004af0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004af4:	000c8513          	mv	a0,s9
    80004af8:	ffffd097          	auipc	ra,0xffffd
    80004afc:	72c080e7          	jalr	1836(ra) # 80002224 <_ZdlPv>
    80004b00:	00048513          	mv	a0,s1
    80004b04:	0000a097          	auipc	ra,0xa
    80004b08:	914080e7          	jalr	-1772(ra) # 8000e418 <_Unwind_Resume>

0000000080004b0c <_ZN8Consumer3runEv>:
    void run() override {
    80004b0c:	fd010113          	addi	sp,sp,-48
    80004b10:	02113423          	sd	ra,40(sp)
    80004b14:	02813023          	sd	s0,32(sp)
    80004b18:	00913c23          	sd	s1,24(sp)
    80004b1c:	01213823          	sd	s2,16(sp)
    80004b20:	01313423          	sd	s3,8(sp)
    80004b24:	03010413          	addi	s0,sp,48
    80004b28:	00050913          	mv	s2,a0
        int i = 0;
    80004b2c:	00000993          	li	s3,0
    80004b30:	0100006f          	j	80004b40 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004b34:	00a00513          	li	a0,10
    80004b38:	ffffe097          	auipc	ra,0xffffe
    80004b3c:	1c8080e7          	jalr	456(ra) # 80002d00 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004b40:	00008797          	auipc	a5,0x8
    80004b44:	7d07a783          	lw	a5,2000(a5) # 8000d310 <_ZL9threadEnd>
    80004b48:	04079a63          	bnez	a5,80004b9c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004b4c:	02093783          	ld	a5,32(s2)
    80004b50:	0087b503          	ld	a0,8(a5)
    80004b54:	00001097          	auipc	ra,0x1
    80004b58:	638080e7          	jalr	1592(ra) # 8000618c <_ZN9BufferCPP3getEv>
            i++;
    80004b5c:	0019849b          	addiw	s1,s3,1
    80004b60:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004b64:	0ff57513          	andi	a0,a0,255
    80004b68:	ffffe097          	auipc	ra,0xffffe
    80004b6c:	198080e7          	jalr	408(ra) # 80002d00 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004b70:	05000793          	li	a5,80
    80004b74:	02f4e4bb          	remw	s1,s1,a5
    80004b78:	fc0494e3          	bnez	s1,80004b40 <_ZN8Consumer3runEv+0x34>
    80004b7c:	fb9ff06f          	j	80004b34 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004b80:	02093783          	ld	a5,32(s2)
    80004b84:	0087b503          	ld	a0,8(a5)
    80004b88:	00001097          	auipc	ra,0x1
    80004b8c:	604080e7          	jalr	1540(ra) # 8000618c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80004b90:	0ff57513          	andi	a0,a0,255
    80004b94:	ffffe097          	auipc	ra,0xffffe
    80004b98:	16c080e7          	jalr	364(ra) # 80002d00 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80004b9c:	02093783          	ld	a5,32(s2)
    80004ba0:	0087b503          	ld	a0,8(a5)
    80004ba4:	00001097          	auipc	ra,0x1
    80004ba8:	674080e7          	jalr	1652(ra) # 80006218 <_ZN9BufferCPP6getCntEv>
    80004bac:	fca04ae3          	bgtz	a0,80004b80 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80004bb0:	02093783          	ld	a5,32(s2)
    80004bb4:	0107b503          	ld	a0,16(a5)
    80004bb8:	ffffe097          	auipc	ra,0xffffe
    80004bbc:	0e8080e7          	jalr	232(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
    }
    80004bc0:	02813083          	ld	ra,40(sp)
    80004bc4:	02013403          	ld	s0,32(sp)
    80004bc8:	01813483          	ld	s1,24(sp)
    80004bcc:	01013903          	ld	s2,16(sp)
    80004bd0:	00813983          	ld	s3,8(sp)
    80004bd4:	03010113          	addi	sp,sp,48
    80004bd8:	00008067          	ret

0000000080004bdc <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004bdc:	ff010113          	addi	sp,sp,-16
    80004be0:	00113423          	sd	ra,8(sp)
    80004be4:	00813023          	sd	s0,0(sp)
    80004be8:	01010413          	addi	s0,sp,16
    80004bec:	00007797          	auipc	a5,0x7
    80004bf0:	d4c78793          	addi	a5,a5,-692 # 8000b938 <_ZTV8Consumer+0x10>
    80004bf4:	00f53023          	sd	a5,0(a0)
    80004bf8:	ffffe097          	auipc	ra,0xffffe
    80004bfc:	e50080e7          	jalr	-432(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004c00:	00813083          	ld	ra,8(sp)
    80004c04:	00013403          	ld	s0,0(sp)
    80004c08:	01010113          	addi	sp,sp,16
    80004c0c:	00008067          	ret

0000000080004c10 <_ZN8ConsumerD0Ev>:
    80004c10:	fe010113          	addi	sp,sp,-32
    80004c14:	00113c23          	sd	ra,24(sp)
    80004c18:	00813823          	sd	s0,16(sp)
    80004c1c:	00913423          	sd	s1,8(sp)
    80004c20:	02010413          	addi	s0,sp,32
    80004c24:	00050493          	mv	s1,a0
    80004c28:	00007797          	auipc	a5,0x7
    80004c2c:	d1078793          	addi	a5,a5,-752 # 8000b938 <_ZTV8Consumer+0x10>
    80004c30:	00f53023          	sd	a5,0(a0)
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	e14080e7          	jalr	-492(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004c3c:	00048513          	mv	a0,s1
    80004c40:	ffffd097          	auipc	ra,0xffffd
    80004c44:	5e4080e7          	jalr	1508(ra) # 80002224 <_ZdlPv>
    80004c48:	01813083          	ld	ra,24(sp)
    80004c4c:	01013403          	ld	s0,16(sp)
    80004c50:	00813483          	ld	s1,8(sp)
    80004c54:	02010113          	addi	sp,sp,32
    80004c58:	00008067          	ret

0000000080004c5c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004c5c:	ff010113          	addi	sp,sp,-16
    80004c60:	00113423          	sd	ra,8(sp)
    80004c64:	00813023          	sd	s0,0(sp)
    80004c68:	01010413          	addi	s0,sp,16
    80004c6c:	00007797          	auipc	a5,0x7
    80004c70:	c7c78793          	addi	a5,a5,-900 # 8000b8e8 <_ZTV16ProducerKeyborad+0x10>
    80004c74:	00f53023          	sd	a5,0(a0)
    80004c78:	ffffe097          	auipc	ra,0xffffe
    80004c7c:	dd0080e7          	jalr	-560(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004c80:	00813083          	ld	ra,8(sp)
    80004c84:	00013403          	ld	s0,0(sp)
    80004c88:	01010113          	addi	sp,sp,16
    80004c8c:	00008067          	ret

0000000080004c90 <_ZN16ProducerKeyboradD0Ev>:
    80004c90:	fe010113          	addi	sp,sp,-32
    80004c94:	00113c23          	sd	ra,24(sp)
    80004c98:	00813823          	sd	s0,16(sp)
    80004c9c:	00913423          	sd	s1,8(sp)
    80004ca0:	02010413          	addi	s0,sp,32
    80004ca4:	00050493          	mv	s1,a0
    80004ca8:	00007797          	auipc	a5,0x7
    80004cac:	c4078793          	addi	a5,a5,-960 # 8000b8e8 <_ZTV16ProducerKeyborad+0x10>
    80004cb0:	00f53023          	sd	a5,0(a0)
    80004cb4:	ffffe097          	auipc	ra,0xffffe
    80004cb8:	d94080e7          	jalr	-620(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004cbc:	00048513          	mv	a0,s1
    80004cc0:	ffffd097          	auipc	ra,0xffffd
    80004cc4:	564080e7          	jalr	1380(ra) # 80002224 <_ZdlPv>
    80004cc8:	01813083          	ld	ra,24(sp)
    80004ccc:	01013403          	ld	s0,16(sp)
    80004cd0:	00813483          	ld	s1,8(sp)
    80004cd4:	02010113          	addi	sp,sp,32
    80004cd8:	00008067          	ret

0000000080004cdc <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004cdc:	ff010113          	addi	sp,sp,-16
    80004ce0:	00113423          	sd	ra,8(sp)
    80004ce4:	00813023          	sd	s0,0(sp)
    80004ce8:	01010413          	addi	s0,sp,16
    80004cec:	00007797          	auipc	a5,0x7
    80004cf0:	c2478793          	addi	a5,a5,-988 # 8000b910 <_ZTV8Producer+0x10>
    80004cf4:	00f53023          	sd	a5,0(a0)
    80004cf8:	ffffe097          	auipc	ra,0xffffe
    80004cfc:	d50080e7          	jalr	-688(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004d00:	00813083          	ld	ra,8(sp)
    80004d04:	00013403          	ld	s0,0(sp)
    80004d08:	01010113          	addi	sp,sp,16
    80004d0c:	00008067          	ret

0000000080004d10 <_ZN8ProducerD0Ev>:
    80004d10:	fe010113          	addi	sp,sp,-32
    80004d14:	00113c23          	sd	ra,24(sp)
    80004d18:	00813823          	sd	s0,16(sp)
    80004d1c:	00913423          	sd	s1,8(sp)
    80004d20:	02010413          	addi	s0,sp,32
    80004d24:	00050493          	mv	s1,a0
    80004d28:	00007797          	auipc	a5,0x7
    80004d2c:	be878793          	addi	a5,a5,-1048 # 8000b910 <_ZTV8Producer+0x10>
    80004d30:	00f53023          	sd	a5,0(a0)
    80004d34:	ffffe097          	auipc	ra,0xffffe
    80004d38:	d14080e7          	jalr	-748(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80004d3c:	00048513          	mv	a0,s1
    80004d40:	ffffd097          	auipc	ra,0xffffd
    80004d44:	4e4080e7          	jalr	1252(ra) # 80002224 <_ZdlPv>
    80004d48:	01813083          	ld	ra,24(sp)
    80004d4c:	01013403          	ld	s0,16(sp)
    80004d50:	00813483          	ld	s1,8(sp)
    80004d54:	02010113          	addi	sp,sp,32
    80004d58:	00008067          	ret

0000000080004d5c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004d5c:	fe010113          	addi	sp,sp,-32
    80004d60:	00113c23          	sd	ra,24(sp)
    80004d64:	00813823          	sd	s0,16(sp)
    80004d68:	00913423          	sd	s1,8(sp)
    80004d6c:	02010413          	addi	s0,sp,32
    80004d70:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004d74:	ffffd097          	auipc	ra,0xffffd
    80004d78:	80c080e7          	jalr	-2036(ra) # 80001580 <_Z4getcv>
    80004d7c:	0005059b          	sext.w	a1,a0
    80004d80:	01b00793          	li	a5,27
    80004d84:	00f58c63          	beq	a1,a5,80004d9c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004d88:	0204b783          	ld	a5,32(s1)
    80004d8c:	0087b503          	ld	a0,8(a5)
    80004d90:	00001097          	auipc	ra,0x1
    80004d94:	36c080e7          	jalr	876(ra) # 800060fc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004d98:	fddff06f          	j	80004d74 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004d9c:	00100793          	li	a5,1
    80004da0:	00008717          	auipc	a4,0x8
    80004da4:	56f72823          	sw	a5,1392(a4) # 8000d310 <_ZL9threadEnd>
        td->buffer->put('!');
    80004da8:	0204b783          	ld	a5,32(s1)
    80004dac:	02100593          	li	a1,33
    80004db0:	0087b503          	ld	a0,8(a5)
    80004db4:	00001097          	auipc	ra,0x1
    80004db8:	348080e7          	jalr	840(ra) # 800060fc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004dbc:	0204b783          	ld	a5,32(s1)
    80004dc0:	0107b503          	ld	a0,16(a5)
    80004dc4:	ffffe097          	auipc	ra,0xffffe
    80004dc8:	edc080e7          	jalr	-292(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
    }
    80004dcc:	01813083          	ld	ra,24(sp)
    80004dd0:	01013403          	ld	s0,16(sp)
    80004dd4:	00813483          	ld	s1,8(sp)
    80004dd8:	02010113          	addi	sp,sp,32
    80004ddc:	00008067          	ret

0000000080004de0 <_ZN8Producer3runEv>:
    void run() override {
    80004de0:	fe010113          	addi	sp,sp,-32
    80004de4:	00113c23          	sd	ra,24(sp)
    80004de8:	00813823          	sd	s0,16(sp)
    80004dec:	00913423          	sd	s1,8(sp)
    80004df0:	01213023          	sd	s2,0(sp)
    80004df4:	02010413          	addi	s0,sp,32
    80004df8:	00050493          	mv	s1,a0
        int i = 0;
    80004dfc:	00000913          	li	s2,0
        while (!threadEnd) {
    80004e00:	00008797          	auipc	a5,0x8
    80004e04:	5107a783          	lw	a5,1296(a5) # 8000d310 <_ZL9threadEnd>
    80004e08:	04079263          	bnez	a5,80004e4c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004e0c:	0204b783          	ld	a5,32(s1)
    80004e10:	0007a583          	lw	a1,0(a5)
    80004e14:	0305859b          	addiw	a1,a1,48
    80004e18:	0087b503          	ld	a0,8(a5)
    80004e1c:	00001097          	auipc	ra,0x1
    80004e20:	2e0080e7          	jalr	736(ra) # 800060fc <_ZN9BufferCPP3putEi>
            i++;
    80004e24:	0019071b          	addiw	a4,s2,1
    80004e28:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004e2c:	0204b783          	ld	a5,32(s1)
    80004e30:	0007a783          	lw	a5,0(a5)
    80004e34:	00e787bb          	addw	a5,a5,a4
    80004e38:	00500513          	li	a0,5
    80004e3c:	02a7e53b          	remw	a0,a5,a0
    80004e40:	ffffe097          	auipc	ra,0xffffe
    80004e44:	dd0080e7          	jalr	-560(ra) # 80002c10 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004e48:	fb9ff06f          	j	80004e00 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004e4c:	0204b783          	ld	a5,32(s1)
    80004e50:	0107b503          	ld	a0,16(a5)
    80004e54:	ffffe097          	auipc	ra,0xffffe
    80004e58:	e4c080e7          	jalr	-436(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
    }
    80004e5c:	01813083          	ld	ra,24(sp)
    80004e60:	01013403          	ld	s0,16(sp)
    80004e64:	00813483          	ld	s1,8(sp)
    80004e68:	00013903          	ld	s2,0(sp)
    80004e6c:	02010113          	addi	sp,sp,32
    80004e70:	00008067          	ret

0000000080004e74 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004e74:	fe010113          	addi	sp,sp,-32
    80004e78:	00113c23          	sd	ra,24(sp)
    80004e7c:	00813823          	sd	s0,16(sp)
    80004e80:	00913423          	sd	s1,8(sp)
    80004e84:	01213023          	sd	s2,0(sp)
    80004e88:	02010413          	addi	s0,sp,32
    80004e8c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004e90:	00100793          	li	a5,1
    80004e94:	02a7f863          	bgeu	a5,a0,80004ec4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004e98:	00a00793          	li	a5,10
    80004e9c:	02f577b3          	remu	a5,a0,a5
    80004ea0:	02078e63          	beqz	a5,80004edc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004ea4:	fff48513          	addi	a0,s1,-1
    80004ea8:	00000097          	auipc	ra,0x0
    80004eac:	fcc080e7          	jalr	-52(ra) # 80004e74 <_ZL9fibonaccim>
    80004eb0:	00050913          	mv	s2,a0
    80004eb4:	ffe48513          	addi	a0,s1,-2
    80004eb8:	00000097          	auipc	ra,0x0
    80004ebc:	fbc080e7          	jalr	-68(ra) # 80004e74 <_ZL9fibonaccim>
    80004ec0:	00a90533          	add	a0,s2,a0
}
    80004ec4:	01813083          	ld	ra,24(sp)
    80004ec8:	01013403          	ld	s0,16(sp)
    80004ecc:	00813483          	ld	s1,8(sp)
    80004ed0:	00013903          	ld	s2,0(sp)
    80004ed4:	02010113          	addi	sp,sp,32
    80004ed8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004edc:	ffffc097          	auipc	ra,0xffffc
    80004ee0:	4c4080e7          	jalr	1220(ra) # 800013a0 <_Z15thread_dispatchv>
    80004ee4:	fc1ff06f          	j	80004ea4 <_ZL9fibonaccim+0x30>

0000000080004ee8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004ee8:	fe010113          	addi	sp,sp,-32
    80004eec:	00113c23          	sd	ra,24(sp)
    80004ef0:	00813823          	sd	s0,16(sp)
    80004ef4:	00913423          	sd	s1,8(sp)
    80004ef8:	01213023          	sd	s2,0(sp)
    80004efc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004f00:	00a00493          	li	s1,10
    80004f04:	0400006f          	j	80004f44 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004f08:	00004517          	auipc	a0,0x4
    80004f0c:	5b850513          	addi	a0,a0,1464 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80004f10:	00001097          	auipc	ra,0x1
    80004f14:	dc8080e7          	jalr	-568(ra) # 80005cd8 <_Z11printStringPKc>
    80004f18:	00000613          	li	a2,0
    80004f1c:	00a00593          	li	a1,10
    80004f20:	00048513          	mv	a0,s1
    80004f24:	00001097          	auipc	ra,0x1
    80004f28:	f64080e7          	jalr	-156(ra) # 80005e88 <_Z8printIntiii>
    80004f2c:	00004517          	auipc	a0,0x4
    80004f30:	26c50513          	addi	a0,a0,620 # 80009198 <CONSOLE_STATUS+0x188>
    80004f34:	00001097          	auipc	ra,0x1
    80004f38:	da4080e7          	jalr	-604(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004f3c:	0014849b          	addiw	s1,s1,1
    80004f40:	0ff4f493          	andi	s1,s1,255
    80004f44:	00c00793          	li	a5,12
    80004f48:	fc97f0e3          	bgeu	a5,s1,80004f08 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004f4c:	00004517          	auipc	a0,0x4
    80004f50:	57c50513          	addi	a0,a0,1404 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80004f54:	00001097          	auipc	ra,0x1
    80004f58:	d84080e7          	jalr	-636(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004f5c:	00500313          	li	t1,5
    thread_dispatch();
    80004f60:	ffffc097          	auipc	ra,0xffffc
    80004f64:	440080e7          	jalr	1088(ra) # 800013a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004f68:	01000513          	li	a0,16
    80004f6c:	00000097          	auipc	ra,0x0
    80004f70:	f08080e7          	jalr	-248(ra) # 80004e74 <_ZL9fibonaccim>
    80004f74:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004f78:	00004517          	auipc	a0,0x4
    80004f7c:	56050513          	addi	a0,a0,1376 # 800094d8 <CONSOLE_STATUS+0x4c8>
    80004f80:	00001097          	auipc	ra,0x1
    80004f84:	d58080e7          	jalr	-680(ra) # 80005cd8 <_Z11printStringPKc>
    80004f88:	00000613          	li	a2,0
    80004f8c:	00a00593          	li	a1,10
    80004f90:	0009051b          	sext.w	a0,s2
    80004f94:	00001097          	auipc	ra,0x1
    80004f98:	ef4080e7          	jalr	-268(ra) # 80005e88 <_Z8printIntiii>
    80004f9c:	00004517          	auipc	a0,0x4
    80004fa0:	1fc50513          	addi	a0,a0,508 # 80009198 <CONSOLE_STATUS+0x188>
    80004fa4:	00001097          	auipc	ra,0x1
    80004fa8:	d34080e7          	jalr	-716(ra) # 80005cd8 <_Z11printStringPKc>
    80004fac:	0400006f          	j	80004fec <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004fb0:	00004517          	auipc	a0,0x4
    80004fb4:	51050513          	addi	a0,a0,1296 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80004fb8:	00001097          	auipc	ra,0x1
    80004fbc:	d20080e7          	jalr	-736(ra) # 80005cd8 <_Z11printStringPKc>
    80004fc0:	00000613          	li	a2,0
    80004fc4:	00a00593          	li	a1,10
    80004fc8:	00048513          	mv	a0,s1
    80004fcc:	00001097          	auipc	ra,0x1
    80004fd0:	ebc080e7          	jalr	-324(ra) # 80005e88 <_Z8printIntiii>
    80004fd4:	00004517          	auipc	a0,0x4
    80004fd8:	1c450513          	addi	a0,a0,452 # 80009198 <CONSOLE_STATUS+0x188>
    80004fdc:	00001097          	auipc	ra,0x1
    80004fe0:	cfc080e7          	jalr	-772(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004fe4:	0014849b          	addiw	s1,s1,1
    80004fe8:	0ff4f493          	andi	s1,s1,255
    80004fec:	00f00793          	li	a5,15
    80004ff0:	fc97f0e3          	bgeu	a5,s1,80004fb0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004ff4:	00004517          	auipc	a0,0x4
    80004ff8:	4f450513          	addi	a0,a0,1268 # 800094e8 <CONSOLE_STATUS+0x4d8>
    80004ffc:	00001097          	auipc	ra,0x1
    80005000:	cdc080e7          	jalr	-804(ra) # 80005cd8 <_Z11printStringPKc>
    finishedD = true;
    80005004:	00100793          	li	a5,1
    80005008:	00008717          	auipc	a4,0x8
    8000500c:	30f70c23          	sb	a5,792(a4) # 8000d320 <_ZL9finishedD>
    thread_dispatch();
    80005010:	ffffc097          	auipc	ra,0xffffc
    80005014:	390080e7          	jalr	912(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80005018:	01813083          	ld	ra,24(sp)
    8000501c:	01013403          	ld	s0,16(sp)
    80005020:	00813483          	ld	s1,8(sp)
    80005024:	00013903          	ld	s2,0(sp)
    80005028:	02010113          	addi	sp,sp,32
    8000502c:	00008067          	ret

0000000080005030 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005030:	fe010113          	addi	sp,sp,-32
    80005034:	00113c23          	sd	ra,24(sp)
    80005038:	00813823          	sd	s0,16(sp)
    8000503c:	00913423          	sd	s1,8(sp)
    80005040:	01213023          	sd	s2,0(sp)
    80005044:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005048:	00000493          	li	s1,0
    8000504c:	0400006f          	j	8000508c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005050:	00004517          	auipc	a0,0x4
    80005054:	44050513          	addi	a0,a0,1088 # 80009490 <CONSOLE_STATUS+0x480>
    80005058:	00001097          	auipc	ra,0x1
    8000505c:	c80080e7          	jalr	-896(ra) # 80005cd8 <_Z11printStringPKc>
    80005060:	00000613          	li	a2,0
    80005064:	00a00593          	li	a1,10
    80005068:	00048513          	mv	a0,s1
    8000506c:	00001097          	auipc	ra,0x1
    80005070:	e1c080e7          	jalr	-484(ra) # 80005e88 <_Z8printIntiii>
    80005074:	00004517          	auipc	a0,0x4
    80005078:	12450513          	addi	a0,a0,292 # 80009198 <CONSOLE_STATUS+0x188>
    8000507c:	00001097          	auipc	ra,0x1
    80005080:	c5c080e7          	jalr	-932(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005084:	0014849b          	addiw	s1,s1,1
    80005088:	0ff4f493          	andi	s1,s1,255
    8000508c:	00200793          	li	a5,2
    80005090:	fc97f0e3          	bgeu	a5,s1,80005050 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005094:	00004517          	auipc	a0,0x4
    80005098:	40450513          	addi	a0,a0,1028 # 80009498 <CONSOLE_STATUS+0x488>
    8000509c:	00001097          	auipc	ra,0x1
    800050a0:	c3c080e7          	jalr	-964(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800050a4:	00700313          	li	t1,7
    thread_dispatch();
    800050a8:	ffffc097          	auipc	ra,0xffffc
    800050ac:	2f8080e7          	jalr	760(ra) # 800013a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800050b0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800050b4:	00004517          	auipc	a0,0x4
    800050b8:	3f450513          	addi	a0,a0,1012 # 800094a8 <CONSOLE_STATUS+0x498>
    800050bc:	00001097          	auipc	ra,0x1
    800050c0:	c1c080e7          	jalr	-996(ra) # 80005cd8 <_Z11printStringPKc>
    800050c4:	00000613          	li	a2,0
    800050c8:	00a00593          	li	a1,10
    800050cc:	0009051b          	sext.w	a0,s2
    800050d0:	00001097          	auipc	ra,0x1
    800050d4:	db8080e7          	jalr	-584(ra) # 80005e88 <_Z8printIntiii>
    800050d8:	00004517          	auipc	a0,0x4
    800050dc:	0c050513          	addi	a0,a0,192 # 80009198 <CONSOLE_STATUS+0x188>
    800050e0:	00001097          	auipc	ra,0x1
    800050e4:	bf8080e7          	jalr	-1032(ra) # 80005cd8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800050e8:	00c00513          	li	a0,12
    800050ec:	00000097          	auipc	ra,0x0
    800050f0:	d88080e7          	jalr	-632(ra) # 80004e74 <_ZL9fibonaccim>
    800050f4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800050f8:	00004517          	auipc	a0,0x4
    800050fc:	3b850513          	addi	a0,a0,952 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80005100:	00001097          	auipc	ra,0x1
    80005104:	bd8080e7          	jalr	-1064(ra) # 80005cd8 <_Z11printStringPKc>
    80005108:	00000613          	li	a2,0
    8000510c:	00a00593          	li	a1,10
    80005110:	0009051b          	sext.w	a0,s2
    80005114:	00001097          	auipc	ra,0x1
    80005118:	d74080e7          	jalr	-652(ra) # 80005e88 <_Z8printIntiii>
    8000511c:	00004517          	auipc	a0,0x4
    80005120:	07c50513          	addi	a0,a0,124 # 80009198 <CONSOLE_STATUS+0x188>
    80005124:	00001097          	auipc	ra,0x1
    80005128:	bb4080e7          	jalr	-1100(ra) # 80005cd8 <_Z11printStringPKc>
    8000512c:	0400006f          	j	8000516c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005130:	00004517          	auipc	a0,0x4
    80005134:	36050513          	addi	a0,a0,864 # 80009490 <CONSOLE_STATUS+0x480>
    80005138:	00001097          	auipc	ra,0x1
    8000513c:	ba0080e7          	jalr	-1120(ra) # 80005cd8 <_Z11printStringPKc>
    80005140:	00000613          	li	a2,0
    80005144:	00a00593          	li	a1,10
    80005148:	00048513          	mv	a0,s1
    8000514c:	00001097          	auipc	ra,0x1
    80005150:	d3c080e7          	jalr	-708(ra) # 80005e88 <_Z8printIntiii>
    80005154:	00004517          	auipc	a0,0x4
    80005158:	04450513          	addi	a0,a0,68 # 80009198 <CONSOLE_STATUS+0x188>
    8000515c:	00001097          	auipc	ra,0x1
    80005160:	b7c080e7          	jalr	-1156(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005164:	0014849b          	addiw	s1,s1,1
    80005168:	0ff4f493          	andi	s1,s1,255
    8000516c:	00500793          	li	a5,5
    80005170:	fc97f0e3          	bgeu	a5,s1,80005130 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005174:	00004517          	auipc	a0,0x4
    80005178:	2f450513          	addi	a0,a0,756 # 80009468 <CONSOLE_STATUS+0x458>
    8000517c:	00001097          	auipc	ra,0x1
    80005180:	b5c080e7          	jalr	-1188(ra) # 80005cd8 <_Z11printStringPKc>
    finishedC = true;
    80005184:	00100793          	li	a5,1
    80005188:	00008717          	auipc	a4,0x8
    8000518c:	18f70ca3          	sb	a5,409(a4) # 8000d321 <_ZL9finishedC>
    thread_dispatch();
    80005190:	ffffc097          	auipc	ra,0xffffc
    80005194:	210080e7          	jalr	528(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80005198:	01813083          	ld	ra,24(sp)
    8000519c:	01013403          	ld	s0,16(sp)
    800051a0:	00813483          	ld	s1,8(sp)
    800051a4:	00013903          	ld	s2,0(sp)
    800051a8:	02010113          	addi	sp,sp,32
    800051ac:	00008067          	ret

00000000800051b0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800051b0:	fe010113          	addi	sp,sp,-32
    800051b4:	00113c23          	sd	ra,24(sp)
    800051b8:	00813823          	sd	s0,16(sp)
    800051bc:	00913423          	sd	s1,8(sp)
    800051c0:	01213023          	sd	s2,0(sp)
    800051c4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800051c8:	00000913          	li	s2,0
    800051cc:	0380006f          	j	80005204 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800051d0:	ffffc097          	auipc	ra,0xffffc
    800051d4:	1d0080e7          	jalr	464(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800051d8:	00148493          	addi	s1,s1,1
    800051dc:	000027b7          	lui	a5,0x2
    800051e0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800051e4:	0097ee63          	bltu	a5,s1,80005200 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800051e8:	00000713          	li	a4,0
    800051ec:	000077b7          	lui	a5,0x7
    800051f0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800051f4:	fce7eee3          	bltu	a5,a4,800051d0 <_ZL11workerBodyBPv+0x20>
    800051f8:	00170713          	addi	a4,a4,1
    800051fc:	ff1ff06f          	j	800051ec <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005200:	00190913          	addi	s2,s2,1
    80005204:	00f00793          	li	a5,15
    80005208:	0527e063          	bltu	a5,s2,80005248 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000520c:	00004517          	auipc	a0,0x4
    80005210:	26c50513          	addi	a0,a0,620 # 80009478 <CONSOLE_STATUS+0x468>
    80005214:	00001097          	auipc	ra,0x1
    80005218:	ac4080e7          	jalr	-1340(ra) # 80005cd8 <_Z11printStringPKc>
    8000521c:	00000613          	li	a2,0
    80005220:	00a00593          	li	a1,10
    80005224:	0009051b          	sext.w	a0,s2
    80005228:	00001097          	auipc	ra,0x1
    8000522c:	c60080e7          	jalr	-928(ra) # 80005e88 <_Z8printIntiii>
    80005230:	00004517          	auipc	a0,0x4
    80005234:	f6850513          	addi	a0,a0,-152 # 80009198 <CONSOLE_STATUS+0x188>
    80005238:	00001097          	auipc	ra,0x1
    8000523c:	aa0080e7          	jalr	-1376(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005240:	00000493          	li	s1,0
    80005244:	f99ff06f          	j	800051dc <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005248:	00004517          	auipc	a0,0x4
    8000524c:	23850513          	addi	a0,a0,568 # 80009480 <CONSOLE_STATUS+0x470>
    80005250:	00001097          	auipc	ra,0x1
    80005254:	a88080e7          	jalr	-1400(ra) # 80005cd8 <_Z11printStringPKc>
    finishedB = true;
    80005258:	00100793          	li	a5,1
    8000525c:	00008717          	auipc	a4,0x8
    80005260:	0cf70323          	sb	a5,198(a4) # 8000d322 <_ZL9finishedB>
    thread_dispatch();
    80005264:	ffffc097          	auipc	ra,0xffffc
    80005268:	13c080e7          	jalr	316(ra) # 800013a0 <_Z15thread_dispatchv>
}
    8000526c:	01813083          	ld	ra,24(sp)
    80005270:	01013403          	ld	s0,16(sp)
    80005274:	00813483          	ld	s1,8(sp)
    80005278:	00013903          	ld	s2,0(sp)
    8000527c:	02010113          	addi	sp,sp,32
    80005280:	00008067          	ret

0000000080005284 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005284:	fe010113          	addi	sp,sp,-32
    80005288:	00113c23          	sd	ra,24(sp)
    8000528c:	00813823          	sd	s0,16(sp)
    80005290:	00913423          	sd	s1,8(sp)
    80005294:	01213023          	sd	s2,0(sp)
    80005298:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000529c:	00000913          	li	s2,0
    800052a0:	0380006f          	j	800052d8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800052a4:	ffffc097          	auipc	ra,0xffffc
    800052a8:	0fc080e7          	jalr	252(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800052ac:	00148493          	addi	s1,s1,1
    800052b0:	000027b7          	lui	a5,0x2
    800052b4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800052b8:	0097ee63          	bltu	a5,s1,800052d4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800052bc:	00000713          	li	a4,0
    800052c0:	000077b7          	lui	a5,0x7
    800052c4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800052c8:	fce7eee3          	bltu	a5,a4,800052a4 <_ZL11workerBodyAPv+0x20>
    800052cc:	00170713          	addi	a4,a4,1
    800052d0:	ff1ff06f          	j	800052c0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800052d4:	00190913          	addi	s2,s2,1
    800052d8:	00900793          	li	a5,9
    800052dc:	0527e063          	bltu	a5,s2,8000531c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800052e0:	00004517          	auipc	a0,0x4
    800052e4:	18050513          	addi	a0,a0,384 # 80009460 <CONSOLE_STATUS+0x450>
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	9f0080e7          	jalr	-1552(ra) # 80005cd8 <_Z11printStringPKc>
    800052f0:	00000613          	li	a2,0
    800052f4:	00a00593          	li	a1,10
    800052f8:	0009051b          	sext.w	a0,s2
    800052fc:	00001097          	auipc	ra,0x1
    80005300:	b8c080e7          	jalr	-1140(ra) # 80005e88 <_Z8printIntiii>
    80005304:	00004517          	auipc	a0,0x4
    80005308:	e9450513          	addi	a0,a0,-364 # 80009198 <CONSOLE_STATUS+0x188>
    8000530c:	00001097          	auipc	ra,0x1
    80005310:	9cc080e7          	jalr	-1588(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005314:	00000493          	li	s1,0
    80005318:	f99ff06f          	j	800052b0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000531c:	00004517          	auipc	a0,0x4
    80005320:	14c50513          	addi	a0,a0,332 # 80009468 <CONSOLE_STATUS+0x458>
    80005324:	00001097          	auipc	ra,0x1
    80005328:	9b4080e7          	jalr	-1612(ra) # 80005cd8 <_Z11printStringPKc>
    finishedA = true;
    8000532c:	00100793          	li	a5,1
    80005330:	00008717          	auipc	a4,0x8
    80005334:	fef709a3          	sb	a5,-13(a4) # 8000d323 <_ZL9finishedA>
}
    80005338:	01813083          	ld	ra,24(sp)
    8000533c:	01013403          	ld	s0,16(sp)
    80005340:	00813483          	ld	s1,8(sp)
    80005344:	00013903          	ld	s2,0(sp)
    80005348:	02010113          	addi	sp,sp,32
    8000534c:	00008067          	ret

0000000080005350 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005350:	fd010113          	addi	sp,sp,-48
    80005354:	02113423          	sd	ra,40(sp)
    80005358:	02813023          	sd	s0,32(sp)
    8000535c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005360:	00000613          	li	a2,0
    80005364:	00000597          	auipc	a1,0x0
    80005368:	f2058593          	addi	a1,a1,-224 # 80005284 <_ZL11workerBodyAPv>
    8000536c:	fd040513          	addi	a0,s0,-48
    80005370:	ffffc097          	auipc	ra,0xffffc
    80005374:	f30080e7          	jalr	-208(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadA created\n");
    80005378:	00004517          	auipc	a0,0x4
    8000537c:	18050513          	addi	a0,a0,384 # 800094f8 <CONSOLE_STATUS+0x4e8>
    80005380:	00001097          	auipc	ra,0x1
    80005384:	958080e7          	jalr	-1704(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005388:	00000613          	li	a2,0
    8000538c:	00000597          	auipc	a1,0x0
    80005390:	e2458593          	addi	a1,a1,-476 # 800051b0 <_ZL11workerBodyBPv>
    80005394:	fd840513          	addi	a0,s0,-40
    80005398:	ffffc097          	auipc	ra,0xffffc
    8000539c:	f08080e7          	jalr	-248(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadB created\n");
    800053a0:	00004517          	auipc	a0,0x4
    800053a4:	17050513          	addi	a0,a0,368 # 80009510 <CONSOLE_STATUS+0x500>
    800053a8:	00001097          	auipc	ra,0x1
    800053ac:	930080e7          	jalr	-1744(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800053b0:	00000613          	li	a2,0
    800053b4:	00000597          	auipc	a1,0x0
    800053b8:	c7c58593          	addi	a1,a1,-900 # 80005030 <_ZL11workerBodyCPv>
    800053bc:	fe040513          	addi	a0,s0,-32
    800053c0:	ffffc097          	auipc	ra,0xffffc
    800053c4:	ee0080e7          	jalr	-288(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadC created\n");
    800053c8:	00004517          	auipc	a0,0x4
    800053cc:	16050513          	addi	a0,a0,352 # 80009528 <CONSOLE_STATUS+0x518>
    800053d0:	00001097          	auipc	ra,0x1
    800053d4:	908080e7          	jalr	-1784(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800053d8:	00000613          	li	a2,0
    800053dc:	00000597          	auipc	a1,0x0
    800053e0:	b0c58593          	addi	a1,a1,-1268 # 80004ee8 <_ZL11workerBodyDPv>
    800053e4:	fe840513          	addi	a0,s0,-24
    800053e8:	ffffc097          	auipc	ra,0xffffc
    800053ec:	eb8080e7          	jalr	-328(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadD created\n");
    800053f0:	00004517          	auipc	a0,0x4
    800053f4:	15050513          	addi	a0,a0,336 # 80009540 <CONSOLE_STATUS+0x530>
    800053f8:	00001097          	auipc	ra,0x1
    800053fc:	8e0080e7          	jalr	-1824(ra) # 80005cd8 <_Z11printStringPKc>
    80005400:	00c0006f          	j	8000540c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005404:	ffffc097          	auipc	ra,0xffffc
    80005408:	f9c080e7          	jalr	-100(ra) # 800013a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000540c:	00008797          	auipc	a5,0x8
    80005410:	f177c783          	lbu	a5,-233(a5) # 8000d323 <_ZL9finishedA>
    80005414:	fe0788e3          	beqz	a5,80005404 <_Z18Threads_C_API_testv+0xb4>
    80005418:	00008797          	auipc	a5,0x8
    8000541c:	f0a7c783          	lbu	a5,-246(a5) # 8000d322 <_ZL9finishedB>
    80005420:	fe0782e3          	beqz	a5,80005404 <_Z18Threads_C_API_testv+0xb4>
    80005424:	00008797          	auipc	a5,0x8
    80005428:	efd7c783          	lbu	a5,-259(a5) # 8000d321 <_ZL9finishedC>
    8000542c:	fc078ce3          	beqz	a5,80005404 <_Z18Threads_C_API_testv+0xb4>
    80005430:	00008797          	auipc	a5,0x8
    80005434:	ef07c783          	lbu	a5,-272(a5) # 8000d320 <_ZL9finishedD>
    80005438:	fc0786e3          	beqz	a5,80005404 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000543c:	02813083          	ld	ra,40(sp)
    80005440:	02013403          	ld	s0,32(sp)
    80005444:	03010113          	addi	sp,sp,48
    80005448:	00008067          	ret

000000008000544c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000544c:	fd010113          	addi	sp,sp,-48
    80005450:	02113423          	sd	ra,40(sp)
    80005454:	02813023          	sd	s0,32(sp)
    80005458:	00913c23          	sd	s1,24(sp)
    8000545c:	01213823          	sd	s2,16(sp)
    80005460:	01313423          	sd	s3,8(sp)
    80005464:	03010413          	addi	s0,sp,48
    80005468:	00050993          	mv	s3,a0
    8000546c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005470:	00000913          	li	s2,0
    80005474:	00c0006f          	j	80005480 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005478:	ffffd097          	auipc	ra,0xffffd
    8000547c:	770080e7          	jalr	1904(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005480:	ffffc097          	auipc	ra,0xffffc
    80005484:	100080e7          	jalr	256(ra) # 80001580 <_Z4getcv>
    80005488:	0005059b          	sext.w	a1,a0
    8000548c:	01b00793          	li	a5,27
    80005490:	02f58a63          	beq	a1,a5,800054c4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80005494:	0084b503          	ld	a0,8(s1)
    80005498:	00001097          	auipc	ra,0x1
    8000549c:	c64080e7          	jalr	-924(ra) # 800060fc <_ZN9BufferCPP3putEi>
        i++;
    800054a0:	0019071b          	addiw	a4,s2,1
    800054a4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800054a8:	0004a683          	lw	a3,0(s1)
    800054ac:	0026979b          	slliw	a5,a3,0x2
    800054b0:	00d787bb          	addw	a5,a5,a3
    800054b4:	0017979b          	slliw	a5,a5,0x1
    800054b8:	02f767bb          	remw	a5,a4,a5
    800054bc:	fc0792e3          	bnez	a5,80005480 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800054c0:	fb9ff06f          	j	80005478 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800054c4:	00100793          	li	a5,1
    800054c8:	00008717          	auipc	a4,0x8
    800054cc:	e6f72023          	sw	a5,-416(a4) # 8000d328 <_ZL9threadEnd>
    td->buffer->put('!');
    800054d0:	0209b783          	ld	a5,32(s3)
    800054d4:	02100593          	li	a1,33
    800054d8:	0087b503          	ld	a0,8(a5)
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	c20080e7          	jalr	-992(ra) # 800060fc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800054e4:	0104b503          	ld	a0,16(s1)
    800054e8:	ffffd097          	auipc	ra,0xffffd
    800054ec:	7b8080e7          	jalr	1976(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
}
    800054f0:	02813083          	ld	ra,40(sp)
    800054f4:	02013403          	ld	s0,32(sp)
    800054f8:	01813483          	ld	s1,24(sp)
    800054fc:	01013903          	ld	s2,16(sp)
    80005500:	00813983          	ld	s3,8(sp)
    80005504:	03010113          	addi	sp,sp,48
    80005508:	00008067          	ret

000000008000550c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000550c:	fe010113          	addi	sp,sp,-32
    80005510:	00113c23          	sd	ra,24(sp)
    80005514:	00813823          	sd	s0,16(sp)
    80005518:	00913423          	sd	s1,8(sp)
    8000551c:	01213023          	sd	s2,0(sp)
    80005520:	02010413          	addi	s0,sp,32
    80005524:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005528:	00000913          	li	s2,0
    8000552c:	00c0006f          	j	80005538 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005530:	ffffd097          	auipc	ra,0xffffd
    80005534:	6b8080e7          	jalr	1720(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005538:	00008797          	auipc	a5,0x8
    8000553c:	df07a783          	lw	a5,-528(a5) # 8000d328 <_ZL9threadEnd>
    80005540:	02079e63          	bnez	a5,8000557c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005544:	0004a583          	lw	a1,0(s1)
    80005548:	0305859b          	addiw	a1,a1,48
    8000554c:	0084b503          	ld	a0,8(s1)
    80005550:	00001097          	auipc	ra,0x1
    80005554:	bac080e7          	jalr	-1108(ra) # 800060fc <_ZN9BufferCPP3putEi>
        i++;
    80005558:	0019071b          	addiw	a4,s2,1
    8000555c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005560:	0004a683          	lw	a3,0(s1)
    80005564:	0026979b          	slliw	a5,a3,0x2
    80005568:	00d787bb          	addw	a5,a5,a3
    8000556c:	0017979b          	slliw	a5,a5,0x1
    80005570:	02f767bb          	remw	a5,a4,a5
    80005574:	fc0792e3          	bnez	a5,80005538 <_ZN12ProducerSync8producerEPv+0x2c>
    80005578:	fb9ff06f          	j	80005530 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000557c:	0104b503          	ld	a0,16(s1)
    80005580:	ffffd097          	auipc	ra,0xffffd
    80005584:	720080e7          	jalr	1824(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
}
    80005588:	01813083          	ld	ra,24(sp)
    8000558c:	01013403          	ld	s0,16(sp)
    80005590:	00813483          	ld	s1,8(sp)
    80005594:	00013903          	ld	s2,0(sp)
    80005598:	02010113          	addi	sp,sp,32
    8000559c:	00008067          	ret

00000000800055a0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800055a0:	fd010113          	addi	sp,sp,-48
    800055a4:	02113423          	sd	ra,40(sp)
    800055a8:	02813023          	sd	s0,32(sp)
    800055ac:	00913c23          	sd	s1,24(sp)
    800055b0:	01213823          	sd	s2,16(sp)
    800055b4:	01313423          	sd	s3,8(sp)
    800055b8:	01413023          	sd	s4,0(sp)
    800055bc:	03010413          	addi	s0,sp,48
    800055c0:	00050993          	mv	s3,a0
    800055c4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800055c8:	00000a13          	li	s4,0
    800055cc:	01c0006f          	j	800055e8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800055d0:	ffffd097          	auipc	ra,0xffffd
    800055d4:	618080e7          	jalr	1560(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    800055d8:	0500006f          	j	80005628 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800055dc:	00a00513          	li	a0,10
    800055e0:	ffffc097          	auipc	ra,0xffffc
    800055e4:	fe0080e7          	jalr	-32(ra) # 800015c0 <_Z4putcc>
    while (!threadEnd) {
    800055e8:	00008797          	auipc	a5,0x8
    800055ec:	d407a783          	lw	a5,-704(a5) # 8000d328 <_ZL9threadEnd>
    800055f0:	06079263          	bnez	a5,80005654 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800055f4:	00893503          	ld	a0,8(s2)
    800055f8:	00001097          	auipc	ra,0x1
    800055fc:	b94080e7          	jalr	-1132(ra) # 8000618c <_ZN9BufferCPP3getEv>
        i++;
    80005600:	001a049b          	addiw	s1,s4,1
    80005604:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005608:	0ff57513          	andi	a0,a0,255
    8000560c:	ffffc097          	auipc	ra,0xffffc
    80005610:	fb4080e7          	jalr	-76(ra) # 800015c0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005614:	00092703          	lw	a4,0(s2)
    80005618:	0027179b          	slliw	a5,a4,0x2
    8000561c:	00e787bb          	addw	a5,a5,a4
    80005620:	02f4e7bb          	remw	a5,s1,a5
    80005624:	fa0786e3          	beqz	a5,800055d0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005628:	05000793          	li	a5,80
    8000562c:	02f4e4bb          	remw	s1,s1,a5
    80005630:	fa049ce3          	bnez	s1,800055e8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005634:	fa9ff06f          	j	800055dc <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005638:	0209b783          	ld	a5,32(s3)
    8000563c:	0087b503          	ld	a0,8(a5)
    80005640:	00001097          	auipc	ra,0x1
    80005644:	b4c080e7          	jalr	-1204(ra) # 8000618c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005648:	0ff57513          	andi	a0,a0,255
    8000564c:	ffffd097          	auipc	ra,0xffffd
    80005650:	6b4080e7          	jalr	1716(ra) # 80002d00 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005654:	0209b783          	ld	a5,32(s3)
    80005658:	0087b503          	ld	a0,8(a5)
    8000565c:	00001097          	auipc	ra,0x1
    80005660:	bbc080e7          	jalr	-1092(ra) # 80006218 <_ZN9BufferCPP6getCntEv>
    80005664:	fca04ae3          	bgtz	a0,80005638 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005668:	01093503          	ld	a0,16(s2)
    8000566c:	ffffd097          	auipc	ra,0xffffd
    80005670:	634080e7          	jalr	1588(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
}
    80005674:	02813083          	ld	ra,40(sp)
    80005678:	02013403          	ld	s0,32(sp)
    8000567c:	01813483          	ld	s1,24(sp)
    80005680:	01013903          	ld	s2,16(sp)
    80005684:	00813983          	ld	s3,8(sp)
    80005688:	00013a03          	ld	s4,0(sp)
    8000568c:	03010113          	addi	sp,sp,48
    80005690:	00008067          	ret

0000000080005694 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80005694:	f8010113          	addi	sp,sp,-128
    80005698:	06113c23          	sd	ra,120(sp)
    8000569c:	06813823          	sd	s0,112(sp)
    800056a0:	06913423          	sd	s1,104(sp)
    800056a4:	07213023          	sd	s2,96(sp)
    800056a8:	05313c23          	sd	s3,88(sp)
    800056ac:	05413823          	sd	s4,80(sp)
    800056b0:	05513423          	sd	s5,72(sp)
    800056b4:	05613023          	sd	s6,64(sp)
    800056b8:	03713c23          	sd	s7,56(sp)
    800056bc:	03813823          	sd	s8,48(sp)
    800056c0:	03913423          	sd	s9,40(sp)
    800056c4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800056c8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800056cc:	00004517          	auipc	a0,0x4
    800056d0:	cac50513          	addi	a0,a0,-852 # 80009378 <CONSOLE_STATUS+0x368>
    800056d4:	00000097          	auipc	ra,0x0
    800056d8:	604080e7          	jalr	1540(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    800056dc:	01e00593          	li	a1,30
    800056e0:	f8040493          	addi	s1,s0,-128
    800056e4:	00048513          	mv	a0,s1
    800056e8:	00000097          	auipc	ra,0x0
    800056ec:	678080e7          	jalr	1656(ra) # 80005d60 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800056f0:	00048513          	mv	a0,s1
    800056f4:	00000097          	auipc	ra,0x0
    800056f8:	744080e7          	jalr	1860(ra) # 80005e38 <_Z11stringToIntPKc>
    800056fc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005700:	00004517          	auipc	a0,0x4
    80005704:	c9850513          	addi	a0,a0,-872 # 80009398 <CONSOLE_STATUS+0x388>
    80005708:	00000097          	auipc	ra,0x0
    8000570c:	5d0080e7          	jalr	1488(ra) # 80005cd8 <_Z11printStringPKc>
    getString(input, 30);
    80005710:	01e00593          	li	a1,30
    80005714:	00048513          	mv	a0,s1
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	648080e7          	jalr	1608(ra) # 80005d60 <_Z9getStringPci>
    n = stringToInt(input);
    80005720:	00048513          	mv	a0,s1
    80005724:	00000097          	auipc	ra,0x0
    80005728:	714080e7          	jalr	1812(ra) # 80005e38 <_Z11stringToIntPKc>
    8000572c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005730:	00004517          	auipc	a0,0x4
    80005734:	c8850513          	addi	a0,a0,-888 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80005738:	00000097          	auipc	ra,0x0
    8000573c:	5a0080e7          	jalr	1440(ra) # 80005cd8 <_Z11printStringPKc>
    80005740:	00000613          	li	a2,0
    80005744:	00a00593          	li	a1,10
    80005748:	00090513          	mv	a0,s2
    8000574c:	00000097          	auipc	ra,0x0
    80005750:	73c080e7          	jalr	1852(ra) # 80005e88 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005754:	00004517          	auipc	a0,0x4
    80005758:	c7c50513          	addi	a0,a0,-900 # 800093d0 <CONSOLE_STATUS+0x3c0>
    8000575c:	00000097          	auipc	ra,0x0
    80005760:	57c080e7          	jalr	1404(ra) # 80005cd8 <_Z11printStringPKc>
    80005764:	00000613          	li	a2,0
    80005768:	00a00593          	li	a1,10
    8000576c:	00048513          	mv	a0,s1
    80005770:	00000097          	auipc	ra,0x0
    80005774:	718080e7          	jalr	1816(ra) # 80005e88 <_Z8printIntiii>
    printString(".\n");
    80005778:	00004517          	auipc	a0,0x4
    8000577c:	c7050513          	addi	a0,a0,-912 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80005780:	00000097          	auipc	ra,0x0
    80005784:	558080e7          	jalr	1368(ra) # 80005cd8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005788:	0324c463          	blt	s1,s2,800057b0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000578c:	03205c63          	blez	s2,800057c4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80005790:	03800513          	li	a0,56
    80005794:	ffffd097          	auipc	ra,0xffffd
    80005798:	a30080e7          	jalr	-1488(ra) # 800021c4 <_Znwm>
    8000579c:	00050a93          	mv	s5,a0
    800057a0:	00048593          	mv	a1,s1
    800057a4:	00001097          	auipc	ra,0x1
    800057a8:	804080e7          	jalr	-2044(ra) # 80005fa8 <_ZN9BufferCPPC1Ei>
    800057ac:	0300006f          	j	800057dc <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800057b0:	00004517          	auipc	a0,0x4
    800057b4:	c4050513          	addi	a0,a0,-960 # 800093f0 <CONSOLE_STATUS+0x3e0>
    800057b8:	00000097          	auipc	ra,0x0
    800057bc:	520080e7          	jalr	1312(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    800057c0:	0140006f          	j	800057d4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800057c4:	00004517          	auipc	a0,0x4
    800057c8:	c6c50513          	addi	a0,a0,-916 # 80009430 <CONSOLE_STATUS+0x420>
    800057cc:	00000097          	auipc	ra,0x0
    800057d0:	50c080e7          	jalr	1292(ra) # 80005cd8 <_Z11printStringPKc>
        return;
    800057d4:	000b8113          	mv	sp,s7
    800057d8:	2380006f          	j	80005a10 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800057dc:	01000513          	li	a0,16
    800057e0:	ffffd097          	auipc	ra,0xffffd
    800057e4:	9e4080e7          	jalr	-1564(ra) # 800021c4 <_Znwm>
    800057e8:	00050493          	mv	s1,a0
    800057ec:	00000593          	li	a1,0
    800057f0:	ffffd097          	auipc	ra,0xffffd
    800057f4:	43c080e7          	jalr	1084(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    800057f8:	00008797          	auipc	a5,0x8
    800057fc:	b297bc23          	sd	s1,-1224(a5) # 8000d330 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005800:	00391793          	slli	a5,s2,0x3
    80005804:	00f78793          	addi	a5,a5,15
    80005808:	ff07f793          	andi	a5,a5,-16
    8000580c:	40f10133          	sub	sp,sp,a5
    80005810:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005814:	0019071b          	addiw	a4,s2,1
    80005818:	00171793          	slli	a5,a4,0x1
    8000581c:	00e787b3          	add	a5,a5,a4
    80005820:	00379793          	slli	a5,a5,0x3
    80005824:	00f78793          	addi	a5,a5,15
    80005828:	ff07f793          	andi	a5,a5,-16
    8000582c:	40f10133          	sub	sp,sp,a5
    80005830:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005834:	00191c13          	slli	s8,s2,0x1
    80005838:	012c07b3          	add	a5,s8,s2
    8000583c:	00379793          	slli	a5,a5,0x3
    80005840:	00fa07b3          	add	a5,s4,a5
    80005844:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005848:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000584c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005850:	02800513          	li	a0,40
    80005854:	ffffd097          	auipc	ra,0xffffd
    80005858:	970080e7          	jalr	-1680(ra) # 800021c4 <_Znwm>
    8000585c:	00050b13          	mv	s6,a0
    80005860:	012c0c33          	add	s8,s8,s2
    80005864:	003c1c13          	slli	s8,s8,0x3
    80005868:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000586c:	ffffd097          	auipc	ra,0xffffd
    80005870:	2e8080e7          	jalr	744(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80005874:	00006797          	auipc	a5,0x6
    80005878:	13c78793          	addi	a5,a5,316 # 8000b9b0 <_ZTV12ConsumerSync+0x10>
    8000587c:	00fb3023          	sd	a5,0(s6)
    80005880:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005884:	000b0513          	mv	a0,s6
    80005888:	ffffd097          	auipc	ra,0xffffd
    8000588c:	2fc080e7          	jalr	764(ra) # 80002b84 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80005890:	00000493          	li	s1,0
    80005894:	0380006f          	j	800058cc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005898:	00006797          	auipc	a5,0x6
    8000589c:	0f078793          	addi	a5,a5,240 # 8000b988 <_ZTV12ProducerSync+0x10>
    800058a0:	00fcb023          	sd	a5,0(s9)
    800058a4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800058a8:	00349793          	slli	a5,s1,0x3
    800058ac:	00f987b3          	add	a5,s3,a5
    800058b0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800058b4:	00349793          	slli	a5,s1,0x3
    800058b8:	00f987b3          	add	a5,s3,a5
    800058bc:	0007b503          	ld	a0,0(a5)
    800058c0:	ffffd097          	auipc	ra,0xffffd
    800058c4:	2c4080e7          	jalr	708(ra) # 80002b84 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800058c8:	0014849b          	addiw	s1,s1,1
    800058cc:	0b24d063          	bge	s1,s2,8000596c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800058d0:	00149793          	slli	a5,s1,0x1
    800058d4:	009787b3          	add	a5,a5,s1
    800058d8:	00379793          	slli	a5,a5,0x3
    800058dc:	00fa07b3          	add	a5,s4,a5
    800058e0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800058e4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800058e8:	00008717          	auipc	a4,0x8
    800058ec:	a4873703          	ld	a4,-1464(a4) # 8000d330 <_ZL10waitForAll>
    800058f0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    800058f4:	02905863          	blez	s1,80005924 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    800058f8:	02800513          	li	a0,40
    800058fc:	ffffd097          	auipc	ra,0xffffd
    80005900:	8c8080e7          	jalr	-1848(ra) # 800021c4 <_Znwm>
    80005904:	00050c93          	mv	s9,a0
    80005908:	00149c13          	slli	s8,s1,0x1
    8000590c:	009c0c33          	add	s8,s8,s1
    80005910:	003c1c13          	slli	s8,s8,0x3
    80005914:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005918:	ffffd097          	auipc	ra,0xffffd
    8000591c:	23c080e7          	jalr	572(ra) # 80002b54 <_ZN6ThreadC1Ev>
    80005920:	f79ff06f          	j	80005898 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005924:	02800513          	li	a0,40
    80005928:	ffffd097          	auipc	ra,0xffffd
    8000592c:	89c080e7          	jalr	-1892(ra) # 800021c4 <_Znwm>
    80005930:	00050c93          	mv	s9,a0
    80005934:	00149c13          	slli	s8,s1,0x1
    80005938:	009c0c33          	add	s8,s8,s1
    8000593c:	003c1c13          	slli	s8,s8,0x3
    80005940:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005944:	ffffd097          	auipc	ra,0xffffd
    80005948:	210080e7          	jalr	528(ra) # 80002b54 <_ZN6ThreadC1Ev>
    8000594c:	00006797          	auipc	a5,0x6
    80005950:	01478793          	addi	a5,a5,20 # 8000b960 <_ZTV16ProducerKeyboard+0x10>
    80005954:	00fcb023          	sd	a5,0(s9)
    80005958:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000595c:	00349793          	slli	a5,s1,0x3
    80005960:	00f987b3          	add	a5,s3,a5
    80005964:	0197b023          	sd	s9,0(a5)
    80005968:	f4dff06f          	j	800058b4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000596c:	ffffd097          	auipc	ra,0xffffd
    80005970:	27c080e7          	jalr	636(ra) # 80002be8 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005974:	00000493          	li	s1,0
    80005978:	00994e63          	blt	s2,s1,80005994 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000597c:	00008517          	auipc	a0,0x8
    80005980:	9b453503          	ld	a0,-1612(a0) # 8000d330 <_ZL10waitForAll>
    80005984:	ffffd097          	auipc	ra,0xffffd
    80005988:	2e4080e7          	jalr	740(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000598c:	0014849b          	addiw	s1,s1,1
    80005990:	fe9ff06f          	j	80005978 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80005994:	00000493          	li	s1,0
    80005998:	0080006f          	j	800059a0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    8000599c:	0014849b          	addiw	s1,s1,1
    800059a0:	0324d263          	bge	s1,s2,800059c4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800059a4:	00349793          	slli	a5,s1,0x3
    800059a8:	00f987b3          	add	a5,s3,a5
    800059ac:	0007b503          	ld	a0,0(a5)
    800059b0:	fe0506e3          	beqz	a0,8000599c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800059b4:	00053783          	ld	a5,0(a0)
    800059b8:	0087b783          	ld	a5,8(a5)
    800059bc:	000780e7          	jalr	a5
    800059c0:	fddff06f          	j	8000599c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800059c4:	000b0a63          	beqz	s6,800059d8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800059c8:	000b3783          	ld	a5,0(s6)
    800059cc:	0087b783          	ld	a5,8(a5)
    800059d0:	000b0513          	mv	a0,s6
    800059d4:	000780e7          	jalr	a5
    delete waitForAll;
    800059d8:	00008517          	auipc	a0,0x8
    800059dc:	95853503          	ld	a0,-1704(a0) # 8000d330 <_ZL10waitForAll>
    800059e0:	00050863          	beqz	a0,800059f0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800059e4:	00053783          	ld	a5,0(a0)
    800059e8:	0087b783          	ld	a5,8(a5)
    800059ec:	000780e7          	jalr	a5
    delete buffer;
    800059f0:	000a8e63          	beqz	s5,80005a0c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    800059f4:	000a8513          	mv	a0,s5
    800059f8:	00001097          	auipc	ra,0x1
    800059fc:	8a8080e7          	jalr	-1880(ra) # 800062a0 <_ZN9BufferCPPD1Ev>
    80005a00:	000a8513          	mv	a0,s5
    80005a04:	ffffd097          	auipc	ra,0xffffd
    80005a08:	820080e7          	jalr	-2016(ra) # 80002224 <_ZdlPv>
    80005a0c:	000b8113          	mv	sp,s7

}
    80005a10:	f8040113          	addi	sp,s0,-128
    80005a14:	07813083          	ld	ra,120(sp)
    80005a18:	07013403          	ld	s0,112(sp)
    80005a1c:	06813483          	ld	s1,104(sp)
    80005a20:	06013903          	ld	s2,96(sp)
    80005a24:	05813983          	ld	s3,88(sp)
    80005a28:	05013a03          	ld	s4,80(sp)
    80005a2c:	04813a83          	ld	s5,72(sp)
    80005a30:	04013b03          	ld	s6,64(sp)
    80005a34:	03813b83          	ld	s7,56(sp)
    80005a38:	03013c03          	ld	s8,48(sp)
    80005a3c:	02813c83          	ld	s9,40(sp)
    80005a40:	08010113          	addi	sp,sp,128
    80005a44:	00008067          	ret
    80005a48:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005a4c:	000a8513          	mv	a0,s5
    80005a50:	ffffc097          	auipc	ra,0xffffc
    80005a54:	7d4080e7          	jalr	2004(ra) # 80002224 <_ZdlPv>
    80005a58:	00048513          	mv	a0,s1
    80005a5c:	00009097          	auipc	ra,0x9
    80005a60:	9bc080e7          	jalr	-1604(ra) # 8000e418 <_Unwind_Resume>
    80005a64:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005a68:	00048513          	mv	a0,s1
    80005a6c:	ffffc097          	auipc	ra,0xffffc
    80005a70:	7b8080e7          	jalr	1976(ra) # 80002224 <_ZdlPv>
    80005a74:	00090513          	mv	a0,s2
    80005a78:	00009097          	auipc	ra,0x9
    80005a7c:	9a0080e7          	jalr	-1632(ra) # 8000e418 <_Unwind_Resume>
    80005a80:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005a84:	000b0513          	mv	a0,s6
    80005a88:	ffffc097          	auipc	ra,0xffffc
    80005a8c:	79c080e7          	jalr	1948(ra) # 80002224 <_ZdlPv>
    80005a90:	00048513          	mv	a0,s1
    80005a94:	00009097          	auipc	ra,0x9
    80005a98:	984080e7          	jalr	-1660(ra) # 8000e418 <_Unwind_Resume>
    80005a9c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80005aa0:	000c8513          	mv	a0,s9
    80005aa4:	ffffc097          	auipc	ra,0xffffc
    80005aa8:	780080e7          	jalr	1920(ra) # 80002224 <_ZdlPv>
    80005aac:	00048513          	mv	a0,s1
    80005ab0:	00009097          	auipc	ra,0x9
    80005ab4:	968080e7          	jalr	-1688(ra) # 8000e418 <_Unwind_Resume>
    80005ab8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80005abc:	000c8513          	mv	a0,s9
    80005ac0:	ffffc097          	auipc	ra,0xffffc
    80005ac4:	764080e7          	jalr	1892(ra) # 80002224 <_ZdlPv>
    80005ac8:	00048513          	mv	a0,s1
    80005acc:	00009097          	auipc	ra,0x9
    80005ad0:	94c080e7          	jalr	-1716(ra) # 8000e418 <_Unwind_Resume>

0000000080005ad4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80005ad4:	ff010113          	addi	sp,sp,-16
    80005ad8:	00113423          	sd	ra,8(sp)
    80005adc:	00813023          	sd	s0,0(sp)
    80005ae0:	01010413          	addi	s0,sp,16
    80005ae4:	00006797          	auipc	a5,0x6
    80005ae8:	ecc78793          	addi	a5,a5,-308 # 8000b9b0 <_ZTV12ConsumerSync+0x10>
    80005aec:	00f53023          	sd	a5,0(a0)
    80005af0:	ffffd097          	auipc	ra,0xffffd
    80005af4:	f58080e7          	jalr	-168(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005af8:	00813083          	ld	ra,8(sp)
    80005afc:	00013403          	ld	s0,0(sp)
    80005b00:	01010113          	addi	sp,sp,16
    80005b04:	00008067          	ret

0000000080005b08 <_ZN12ConsumerSyncD0Ev>:
    80005b08:	fe010113          	addi	sp,sp,-32
    80005b0c:	00113c23          	sd	ra,24(sp)
    80005b10:	00813823          	sd	s0,16(sp)
    80005b14:	00913423          	sd	s1,8(sp)
    80005b18:	02010413          	addi	s0,sp,32
    80005b1c:	00050493          	mv	s1,a0
    80005b20:	00006797          	auipc	a5,0x6
    80005b24:	e9078793          	addi	a5,a5,-368 # 8000b9b0 <_ZTV12ConsumerSync+0x10>
    80005b28:	00f53023          	sd	a5,0(a0)
    80005b2c:	ffffd097          	auipc	ra,0xffffd
    80005b30:	f1c080e7          	jalr	-228(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005b34:	00048513          	mv	a0,s1
    80005b38:	ffffc097          	auipc	ra,0xffffc
    80005b3c:	6ec080e7          	jalr	1772(ra) # 80002224 <_ZdlPv>
    80005b40:	01813083          	ld	ra,24(sp)
    80005b44:	01013403          	ld	s0,16(sp)
    80005b48:	00813483          	ld	s1,8(sp)
    80005b4c:	02010113          	addi	sp,sp,32
    80005b50:	00008067          	ret

0000000080005b54 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005b54:	ff010113          	addi	sp,sp,-16
    80005b58:	00113423          	sd	ra,8(sp)
    80005b5c:	00813023          	sd	s0,0(sp)
    80005b60:	01010413          	addi	s0,sp,16
    80005b64:	00006797          	auipc	a5,0x6
    80005b68:	e2478793          	addi	a5,a5,-476 # 8000b988 <_ZTV12ProducerSync+0x10>
    80005b6c:	00f53023          	sd	a5,0(a0)
    80005b70:	ffffd097          	auipc	ra,0xffffd
    80005b74:	ed8080e7          	jalr	-296(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005b78:	00813083          	ld	ra,8(sp)
    80005b7c:	00013403          	ld	s0,0(sp)
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret

0000000080005b88 <_ZN12ProducerSyncD0Ev>:
    80005b88:	fe010113          	addi	sp,sp,-32
    80005b8c:	00113c23          	sd	ra,24(sp)
    80005b90:	00813823          	sd	s0,16(sp)
    80005b94:	00913423          	sd	s1,8(sp)
    80005b98:	02010413          	addi	s0,sp,32
    80005b9c:	00050493          	mv	s1,a0
    80005ba0:	00006797          	auipc	a5,0x6
    80005ba4:	de878793          	addi	a5,a5,-536 # 8000b988 <_ZTV12ProducerSync+0x10>
    80005ba8:	00f53023          	sd	a5,0(a0)
    80005bac:	ffffd097          	auipc	ra,0xffffd
    80005bb0:	e9c080e7          	jalr	-356(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005bb4:	00048513          	mv	a0,s1
    80005bb8:	ffffc097          	auipc	ra,0xffffc
    80005bbc:	66c080e7          	jalr	1644(ra) # 80002224 <_ZdlPv>
    80005bc0:	01813083          	ld	ra,24(sp)
    80005bc4:	01013403          	ld	s0,16(sp)
    80005bc8:	00813483          	ld	s1,8(sp)
    80005bcc:	02010113          	addi	sp,sp,32
    80005bd0:	00008067          	ret

0000000080005bd4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80005bd4:	ff010113          	addi	sp,sp,-16
    80005bd8:	00113423          	sd	ra,8(sp)
    80005bdc:	00813023          	sd	s0,0(sp)
    80005be0:	01010413          	addi	s0,sp,16
    80005be4:	00006797          	auipc	a5,0x6
    80005be8:	d7c78793          	addi	a5,a5,-644 # 8000b960 <_ZTV16ProducerKeyboard+0x10>
    80005bec:	00f53023          	sd	a5,0(a0)
    80005bf0:	ffffd097          	auipc	ra,0xffffd
    80005bf4:	e58080e7          	jalr	-424(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005bf8:	00813083          	ld	ra,8(sp)
    80005bfc:	00013403          	ld	s0,0(sp)
    80005c00:	01010113          	addi	sp,sp,16
    80005c04:	00008067          	ret

0000000080005c08 <_ZN16ProducerKeyboardD0Ev>:
    80005c08:	fe010113          	addi	sp,sp,-32
    80005c0c:	00113c23          	sd	ra,24(sp)
    80005c10:	00813823          	sd	s0,16(sp)
    80005c14:	00913423          	sd	s1,8(sp)
    80005c18:	02010413          	addi	s0,sp,32
    80005c1c:	00050493          	mv	s1,a0
    80005c20:	00006797          	auipc	a5,0x6
    80005c24:	d4078793          	addi	a5,a5,-704 # 8000b960 <_ZTV16ProducerKeyboard+0x10>
    80005c28:	00f53023          	sd	a5,0(a0)
    80005c2c:	ffffd097          	auipc	ra,0xffffd
    80005c30:	e1c080e7          	jalr	-484(ra) # 80002a48 <_ZN6ThreadD1Ev>
    80005c34:	00048513          	mv	a0,s1
    80005c38:	ffffc097          	auipc	ra,0xffffc
    80005c3c:	5ec080e7          	jalr	1516(ra) # 80002224 <_ZdlPv>
    80005c40:	01813083          	ld	ra,24(sp)
    80005c44:	01013403          	ld	s0,16(sp)
    80005c48:	00813483          	ld	s1,8(sp)
    80005c4c:	02010113          	addi	sp,sp,32
    80005c50:	00008067          	ret

0000000080005c54 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005c54:	ff010113          	addi	sp,sp,-16
    80005c58:	00113423          	sd	ra,8(sp)
    80005c5c:	00813023          	sd	s0,0(sp)
    80005c60:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005c64:	02053583          	ld	a1,32(a0)
    80005c68:	fffff097          	auipc	ra,0xfffff
    80005c6c:	7e4080e7          	jalr	2020(ra) # 8000544c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005c70:	00813083          	ld	ra,8(sp)
    80005c74:	00013403          	ld	s0,0(sp)
    80005c78:	01010113          	addi	sp,sp,16
    80005c7c:	00008067          	ret

0000000080005c80 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005c80:	ff010113          	addi	sp,sp,-16
    80005c84:	00113423          	sd	ra,8(sp)
    80005c88:	00813023          	sd	s0,0(sp)
    80005c8c:	01010413          	addi	s0,sp,16
        producer(td);
    80005c90:	02053583          	ld	a1,32(a0)
    80005c94:	00000097          	auipc	ra,0x0
    80005c98:	878080e7          	jalr	-1928(ra) # 8000550c <_ZN12ProducerSync8producerEPv>
    }
    80005c9c:	00813083          	ld	ra,8(sp)
    80005ca0:	00013403          	ld	s0,0(sp)
    80005ca4:	01010113          	addi	sp,sp,16
    80005ca8:	00008067          	ret

0000000080005cac <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005cac:	ff010113          	addi	sp,sp,-16
    80005cb0:	00113423          	sd	ra,8(sp)
    80005cb4:	00813023          	sd	s0,0(sp)
    80005cb8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005cbc:	02053583          	ld	a1,32(a0)
    80005cc0:	00000097          	auipc	ra,0x0
    80005cc4:	8e0080e7          	jalr	-1824(ra) # 800055a0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005cc8:	00813083          	ld	ra,8(sp)
    80005ccc:	00013403          	ld	s0,0(sp)
    80005cd0:	01010113          	addi	sp,sp,16
    80005cd4:	00008067          	ret

0000000080005cd8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005cd8:	fe010113          	addi	sp,sp,-32
    80005cdc:	00113c23          	sd	ra,24(sp)
    80005ce0:	00813823          	sd	s0,16(sp)
    80005ce4:	00913423          	sd	s1,8(sp)
    80005ce8:	02010413          	addi	s0,sp,32
    80005cec:	00050493          	mv	s1,a0
    LOCK();
    80005cf0:	00100613          	li	a2,1
    80005cf4:	00000593          	li	a1,0
    80005cf8:	00007517          	auipc	a0,0x7
    80005cfc:	64050513          	addi	a0,a0,1600 # 8000d338 <lockPrint>
    80005d00:	ffffb097          	auipc	ra,0xffffb
    80005d04:	4f4080e7          	jalr	1268(ra) # 800011f4 <copy_and_swap>
    80005d08:	00050863          	beqz	a0,80005d18 <_Z11printStringPKc+0x40>
    80005d0c:	ffffb097          	auipc	ra,0xffffb
    80005d10:	694080e7          	jalr	1684(ra) # 800013a0 <_Z15thread_dispatchv>
    80005d14:	fddff06f          	j	80005cf0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005d18:	0004c503          	lbu	a0,0(s1)
    80005d1c:	00050a63          	beqz	a0,80005d30 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005d20:	ffffc097          	auipc	ra,0xffffc
    80005d24:	8a0080e7          	jalr	-1888(ra) # 800015c0 <_Z4putcc>
        string++;
    80005d28:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005d2c:	fedff06f          	j	80005d18 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005d30:	00000613          	li	a2,0
    80005d34:	00100593          	li	a1,1
    80005d38:	00007517          	auipc	a0,0x7
    80005d3c:	60050513          	addi	a0,a0,1536 # 8000d338 <lockPrint>
    80005d40:	ffffb097          	auipc	ra,0xffffb
    80005d44:	4b4080e7          	jalr	1204(ra) # 800011f4 <copy_and_swap>
    80005d48:	fe0514e3          	bnez	a0,80005d30 <_Z11printStringPKc+0x58>
}
    80005d4c:	01813083          	ld	ra,24(sp)
    80005d50:	01013403          	ld	s0,16(sp)
    80005d54:	00813483          	ld	s1,8(sp)
    80005d58:	02010113          	addi	sp,sp,32
    80005d5c:	00008067          	ret

0000000080005d60 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005d60:	fd010113          	addi	sp,sp,-48
    80005d64:	02113423          	sd	ra,40(sp)
    80005d68:	02813023          	sd	s0,32(sp)
    80005d6c:	00913c23          	sd	s1,24(sp)
    80005d70:	01213823          	sd	s2,16(sp)
    80005d74:	01313423          	sd	s3,8(sp)
    80005d78:	01413023          	sd	s4,0(sp)
    80005d7c:	03010413          	addi	s0,sp,48
    80005d80:	00050993          	mv	s3,a0
    80005d84:	00058a13          	mv	s4,a1
    LOCK();
    80005d88:	00100613          	li	a2,1
    80005d8c:	00000593          	li	a1,0
    80005d90:	00007517          	auipc	a0,0x7
    80005d94:	5a850513          	addi	a0,a0,1448 # 8000d338 <lockPrint>
    80005d98:	ffffb097          	auipc	ra,0xffffb
    80005d9c:	45c080e7          	jalr	1116(ra) # 800011f4 <copy_and_swap>
    80005da0:	00050863          	beqz	a0,80005db0 <_Z9getStringPci+0x50>
    80005da4:	ffffb097          	auipc	ra,0xffffb
    80005da8:	5fc080e7          	jalr	1532(ra) # 800013a0 <_Z15thread_dispatchv>
    80005dac:	fddff06f          	j	80005d88 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005db0:	00000913          	li	s2,0
    80005db4:	00090493          	mv	s1,s2
    80005db8:	0019091b          	addiw	s2,s2,1
    80005dbc:	03495a63          	bge	s2,s4,80005df0 <_Z9getStringPci+0x90>
        cc = getc();
    80005dc0:	ffffb097          	auipc	ra,0xffffb
    80005dc4:	7c0080e7          	jalr	1984(ra) # 80001580 <_Z4getcv>
        if(cc < 1)
    80005dc8:	02050463          	beqz	a0,80005df0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005dcc:	009984b3          	add	s1,s3,s1
    80005dd0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005dd4:	00a00793          	li	a5,10
    80005dd8:	00f50a63          	beq	a0,a5,80005dec <_Z9getStringPci+0x8c>
    80005ddc:	00d00793          	li	a5,13
    80005de0:	fcf51ae3          	bne	a0,a5,80005db4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005de4:	00090493          	mv	s1,s2
    80005de8:	0080006f          	j	80005df0 <_Z9getStringPci+0x90>
    80005dec:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005df0:	009984b3          	add	s1,s3,s1
    80005df4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005df8:	00000613          	li	a2,0
    80005dfc:	00100593          	li	a1,1
    80005e00:	00007517          	auipc	a0,0x7
    80005e04:	53850513          	addi	a0,a0,1336 # 8000d338 <lockPrint>
    80005e08:	ffffb097          	auipc	ra,0xffffb
    80005e0c:	3ec080e7          	jalr	1004(ra) # 800011f4 <copy_and_swap>
    80005e10:	fe0514e3          	bnez	a0,80005df8 <_Z9getStringPci+0x98>
    return buf;
}
    80005e14:	00098513          	mv	a0,s3
    80005e18:	02813083          	ld	ra,40(sp)
    80005e1c:	02013403          	ld	s0,32(sp)
    80005e20:	01813483          	ld	s1,24(sp)
    80005e24:	01013903          	ld	s2,16(sp)
    80005e28:	00813983          	ld	s3,8(sp)
    80005e2c:	00013a03          	ld	s4,0(sp)
    80005e30:	03010113          	addi	sp,sp,48
    80005e34:	00008067          	ret

0000000080005e38 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005e38:	ff010113          	addi	sp,sp,-16
    80005e3c:	00813423          	sd	s0,8(sp)
    80005e40:	01010413          	addi	s0,sp,16
    80005e44:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005e48:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005e4c:	0006c603          	lbu	a2,0(a3)
    80005e50:	fd06071b          	addiw	a4,a2,-48
    80005e54:	0ff77713          	andi	a4,a4,255
    80005e58:	00900793          	li	a5,9
    80005e5c:	02e7e063          	bltu	a5,a4,80005e7c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005e60:	0025179b          	slliw	a5,a0,0x2
    80005e64:	00a787bb          	addw	a5,a5,a0
    80005e68:	0017979b          	slliw	a5,a5,0x1
    80005e6c:	00168693          	addi	a3,a3,1
    80005e70:	00c787bb          	addw	a5,a5,a2
    80005e74:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005e78:	fd5ff06f          	j	80005e4c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005e7c:	00813403          	ld	s0,8(sp)
    80005e80:	01010113          	addi	sp,sp,16
    80005e84:	00008067          	ret

0000000080005e88 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005e88:	fc010113          	addi	sp,sp,-64
    80005e8c:	02113c23          	sd	ra,56(sp)
    80005e90:	02813823          	sd	s0,48(sp)
    80005e94:	02913423          	sd	s1,40(sp)
    80005e98:	03213023          	sd	s2,32(sp)
    80005e9c:	01313c23          	sd	s3,24(sp)
    80005ea0:	04010413          	addi	s0,sp,64
    80005ea4:	00050493          	mv	s1,a0
    80005ea8:	00058913          	mv	s2,a1
    80005eac:	00060993          	mv	s3,a2
    LOCK();
    80005eb0:	00100613          	li	a2,1
    80005eb4:	00000593          	li	a1,0
    80005eb8:	00007517          	auipc	a0,0x7
    80005ebc:	48050513          	addi	a0,a0,1152 # 8000d338 <lockPrint>
    80005ec0:	ffffb097          	auipc	ra,0xffffb
    80005ec4:	334080e7          	jalr	820(ra) # 800011f4 <copy_and_swap>
    80005ec8:	00050863          	beqz	a0,80005ed8 <_Z8printIntiii+0x50>
    80005ecc:	ffffb097          	auipc	ra,0xffffb
    80005ed0:	4d4080e7          	jalr	1236(ra) # 800013a0 <_Z15thread_dispatchv>
    80005ed4:	fddff06f          	j	80005eb0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ed8:	00098463          	beqz	s3,80005ee0 <_Z8printIntiii+0x58>
    80005edc:	0804c463          	bltz	s1,80005f64 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005ee0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005ee4:	00000593          	li	a1,0
    }

    i = 0;
    80005ee8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005eec:	0009079b          	sext.w	a5,s2
    80005ef0:	0325773b          	remuw	a4,a0,s2
    80005ef4:	00048613          	mv	a2,s1
    80005ef8:	0014849b          	addiw	s1,s1,1
    80005efc:	02071693          	slli	a3,a4,0x20
    80005f00:	0206d693          	srli	a3,a3,0x20
    80005f04:	00006717          	auipc	a4,0x6
    80005f08:	ac470713          	addi	a4,a4,-1340 # 8000b9c8 <digits>
    80005f0c:	00d70733          	add	a4,a4,a3
    80005f10:	00074683          	lbu	a3,0(a4)
    80005f14:	fd040713          	addi	a4,s0,-48
    80005f18:	00c70733          	add	a4,a4,a2
    80005f1c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005f20:	0005071b          	sext.w	a4,a0
    80005f24:	0325553b          	divuw	a0,a0,s2
    80005f28:	fcf772e3          	bgeu	a4,a5,80005eec <_Z8printIntiii+0x64>
    if(neg)
    80005f2c:	00058c63          	beqz	a1,80005f44 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005f30:	fd040793          	addi	a5,s0,-48
    80005f34:	009784b3          	add	s1,a5,s1
    80005f38:	02d00793          	li	a5,45
    80005f3c:	fef48823          	sb	a5,-16(s1)
    80005f40:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005f44:	fff4849b          	addiw	s1,s1,-1
    80005f48:	0204c463          	bltz	s1,80005f70 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005f4c:	fd040793          	addi	a5,s0,-48
    80005f50:	009787b3          	add	a5,a5,s1
    80005f54:	ff07c503          	lbu	a0,-16(a5)
    80005f58:	ffffb097          	auipc	ra,0xffffb
    80005f5c:	668080e7          	jalr	1640(ra) # 800015c0 <_Z4putcc>
    80005f60:	fe5ff06f          	j	80005f44 <_Z8printIntiii+0xbc>
        x = -xx;
    80005f64:	4090053b          	negw	a0,s1
        neg = 1;
    80005f68:	00100593          	li	a1,1
        x = -xx;
    80005f6c:	f7dff06f          	j	80005ee8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005f70:	00000613          	li	a2,0
    80005f74:	00100593          	li	a1,1
    80005f78:	00007517          	auipc	a0,0x7
    80005f7c:	3c050513          	addi	a0,a0,960 # 8000d338 <lockPrint>
    80005f80:	ffffb097          	auipc	ra,0xffffb
    80005f84:	274080e7          	jalr	628(ra) # 800011f4 <copy_and_swap>
    80005f88:	fe0514e3          	bnez	a0,80005f70 <_Z8printIntiii+0xe8>
    80005f8c:	03813083          	ld	ra,56(sp)
    80005f90:	03013403          	ld	s0,48(sp)
    80005f94:	02813483          	ld	s1,40(sp)
    80005f98:	02013903          	ld	s2,32(sp)
    80005f9c:	01813983          	ld	s3,24(sp)
    80005fa0:	04010113          	addi	sp,sp,64
    80005fa4:	00008067          	ret

0000000080005fa8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005fa8:	fd010113          	addi	sp,sp,-48
    80005fac:	02113423          	sd	ra,40(sp)
    80005fb0:	02813023          	sd	s0,32(sp)
    80005fb4:	00913c23          	sd	s1,24(sp)
    80005fb8:	01213823          	sd	s2,16(sp)
    80005fbc:	01313423          	sd	s3,8(sp)
    80005fc0:	03010413          	addi	s0,sp,48
    80005fc4:	00050493          	mv	s1,a0
    80005fc8:	00058913          	mv	s2,a1
    80005fcc:	0015879b          	addiw	a5,a1,1
    80005fd0:	0007851b          	sext.w	a0,a5
    80005fd4:	00f4a023          	sw	a5,0(s1)
    80005fd8:	0004a823          	sw	zero,16(s1)
    80005fdc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005fe0:	00251513          	slli	a0,a0,0x2
    80005fe4:	ffffb097          	auipc	ra,0xffffb
    80005fe8:	230080e7          	jalr	560(ra) # 80001214 <_Z9mem_allocm>
    80005fec:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005ff0:	01000513          	li	a0,16
    80005ff4:	ffffc097          	auipc	ra,0xffffc
    80005ff8:	1d0080e7          	jalr	464(ra) # 800021c4 <_Znwm>
    80005ffc:	00050993          	mv	s3,a0
    80006000:	00000593          	li	a1,0
    80006004:	ffffd097          	auipc	ra,0xffffd
    80006008:	c28080e7          	jalr	-984(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    8000600c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80006010:	01000513          	li	a0,16
    80006014:	ffffc097          	auipc	ra,0xffffc
    80006018:	1b0080e7          	jalr	432(ra) # 800021c4 <_Znwm>
    8000601c:	00050993          	mv	s3,a0
    80006020:	00090593          	mv	a1,s2
    80006024:	ffffd097          	auipc	ra,0xffffd
    80006028:	c08080e7          	jalr	-1016(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    8000602c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80006030:	01000513          	li	a0,16
    80006034:	ffffc097          	auipc	ra,0xffffc
    80006038:	190080e7          	jalr	400(ra) # 800021c4 <_Znwm>
    8000603c:	00050913          	mv	s2,a0
    80006040:	00100593          	li	a1,1
    80006044:	ffffd097          	auipc	ra,0xffffd
    80006048:	be8080e7          	jalr	-1048(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    8000604c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80006050:	01000513          	li	a0,16
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	170080e7          	jalr	368(ra) # 800021c4 <_Znwm>
    8000605c:	00050913          	mv	s2,a0
    80006060:	00100593          	li	a1,1
    80006064:	ffffd097          	auipc	ra,0xffffd
    80006068:	bc8080e7          	jalr	-1080(ra) # 80002c2c <_ZN9SemaphoreC1Ej>
    8000606c:	0324b823          	sd	s2,48(s1)
}
    80006070:	02813083          	ld	ra,40(sp)
    80006074:	02013403          	ld	s0,32(sp)
    80006078:	01813483          	ld	s1,24(sp)
    8000607c:	01013903          	ld	s2,16(sp)
    80006080:	00813983          	ld	s3,8(sp)
    80006084:	03010113          	addi	sp,sp,48
    80006088:	00008067          	ret
    8000608c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80006090:	00098513          	mv	a0,s3
    80006094:	ffffc097          	auipc	ra,0xffffc
    80006098:	190080e7          	jalr	400(ra) # 80002224 <_ZdlPv>
    8000609c:	00048513          	mv	a0,s1
    800060a0:	00008097          	auipc	ra,0x8
    800060a4:	378080e7          	jalr	888(ra) # 8000e418 <_Unwind_Resume>
    800060a8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800060ac:	00098513          	mv	a0,s3
    800060b0:	ffffc097          	auipc	ra,0xffffc
    800060b4:	174080e7          	jalr	372(ra) # 80002224 <_ZdlPv>
    800060b8:	00048513          	mv	a0,s1
    800060bc:	00008097          	auipc	ra,0x8
    800060c0:	35c080e7          	jalr	860(ra) # 8000e418 <_Unwind_Resume>
    800060c4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800060c8:	00090513          	mv	a0,s2
    800060cc:	ffffc097          	auipc	ra,0xffffc
    800060d0:	158080e7          	jalr	344(ra) # 80002224 <_ZdlPv>
    800060d4:	00048513          	mv	a0,s1
    800060d8:	00008097          	auipc	ra,0x8
    800060dc:	340080e7          	jalr	832(ra) # 8000e418 <_Unwind_Resume>
    800060e0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800060e4:	00090513          	mv	a0,s2
    800060e8:	ffffc097          	auipc	ra,0xffffc
    800060ec:	13c080e7          	jalr	316(ra) # 80002224 <_ZdlPv>
    800060f0:	00048513          	mv	a0,s1
    800060f4:	00008097          	auipc	ra,0x8
    800060f8:	324080e7          	jalr	804(ra) # 8000e418 <_Unwind_Resume>

00000000800060fc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800060fc:	fe010113          	addi	sp,sp,-32
    80006100:	00113c23          	sd	ra,24(sp)
    80006104:	00813823          	sd	s0,16(sp)
    80006108:	00913423          	sd	s1,8(sp)
    8000610c:	01213023          	sd	s2,0(sp)
    80006110:	02010413          	addi	s0,sp,32
    80006114:	00050493          	mv	s1,a0
    80006118:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    8000611c:	01853503          	ld	a0,24(a0)
    80006120:	ffffd097          	auipc	ra,0xffffd
    80006124:	b48080e7          	jalr	-1208(ra) # 80002c68 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80006128:	0304b503          	ld	a0,48(s1)
    8000612c:	ffffd097          	auipc	ra,0xffffd
    80006130:	b3c080e7          	jalr	-1220(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80006134:	0084b783          	ld	a5,8(s1)
    80006138:	0144a703          	lw	a4,20(s1)
    8000613c:	00271713          	slli	a4,a4,0x2
    80006140:	00e787b3          	add	a5,a5,a4
    80006144:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006148:	0144a783          	lw	a5,20(s1)
    8000614c:	0017879b          	addiw	a5,a5,1
    80006150:	0004a703          	lw	a4,0(s1)
    80006154:	02e7e7bb          	remw	a5,a5,a4
    80006158:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000615c:	0304b503          	ld	a0,48(s1)
    80006160:	ffffd097          	auipc	ra,0xffffd
    80006164:	b40080e7          	jalr	-1216(ra) # 80002ca0 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80006168:	0204b503          	ld	a0,32(s1)
    8000616c:	ffffd097          	auipc	ra,0xffffd
    80006170:	b34080e7          	jalr	-1228(ra) # 80002ca0 <_ZN9Semaphore6signalEv>

}
    80006174:	01813083          	ld	ra,24(sp)
    80006178:	01013403          	ld	s0,16(sp)
    8000617c:	00813483          	ld	s1,8(sp)
    80006180:	00013903          	ld	s2,0(sp)
    80006184:	02010113          	addi	sp,sp,32
    80006188:	00008067          	ret

000000008000618c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000618c:	fe010113          	addi	sp,sp,-32
    80006190:	00113c23          	sd	ra,24(sp)
    80006194:	00813823          	sd	s0,16(sp)
    80006198:	00913423          	sd	s1,8(sp)
    8000619c:	01213023          	sd	s2,0(sp)
    800061a0:	02010413          	addi	s0,sp,32
    800061a4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800061a8:	02053503          	ld	a0,32(a0)
    800061ac:	ffffd097          	auipc	ra,0xffffd
    800061b0:	abc080e7          	jalr	-1348(ra) # 80002c68 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800061b4:	0284b503          	ld	a0,40(s1)
    800061b8:	ffffd097          	auipc	ra,0xffffd
    800061bc:	ab0080e7          	jalr	-1360(ra) # 80002c68 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800061c0:	0084b703          	ld	a4,8(s1)
    800061c4:	0104a783          	lw	a5,16(s1)
    800061c8:	00279693          	slli	a3,a5,0x2
    800061cc:	00d70733          	add	a4,a4,a3
    800061d0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800061d4:	0017879b          	addiw	a5,a5,1
    800061d8:	0004a703          	lw	a4,0(s1)
    800061dc:	02e7e7bb          	remw	a5,a5,a4
    800061e0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800061e4:	0284b503          	ld	a0,40(s1)
    800061e8:	ffffd097          	auipc	ra,0xffffd
    800061ec:	ab8080e7          	jalr	-1352(ra) # 80002ca0 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800061f0:	0184b503          	ld	a0,24(s1)
    800061f4:	ffffd097          	auipc	ra,0xffffd
    800061f8:	aac080e7          	jalr	-1364(ra) # 80002ca0 <_ZN9Semaphore6signalEv>

    return ret;
}
    800061fc:	00090513          	mv	a0,s2
    80006200:	01813083          	ld	ra,24(sp)
    80006204:	01013403          	ld	s0,16(sp)
    80006208:	00813483          	ld	s1,8(sp)
    8000620c:	00013903          	ld	s2,0(sp)
    80006210:	02010113          	addi	sp,sp,32
    80006214:	00008067          	ret

0000000080006218 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006218:	fe010113          	addi	sp,sp,-32
    8000621c:	00113c23          	sd	ra,24(sp)
    80006220:	00813823          	sd	s0,16(sp)
    80006224:	00913423          	sd	s1,8(sp)
    80006228:	01213023          	sd	s2,0(sp)
    8000622c:	02010413          	addi	s0,sp,32
    80006230:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006234:	02853503          	ld	a0,40(a0)
    80006238:	ffffd097          	auipc	ra,0xffffd
    8000623c:	a30080e7          	jalr	-1488(ra) # 80002c68 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006240:	0304b503          	ld	a0,48(s1)
    80006244:	ffffd097          	auipc	ra,0xffffd
    80006248:	a24080e7          	jalr	-1500(ra) # 80002c68 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000624c:	0144a783          	lw	a5,20(s1)
    80006250:	0104a903          	lw	s2,16(s1)
    80006254:	0327ce63          	blt	a5,s2,80006290 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006258:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000625c:	0304b503          	ld	a0,48(s1)
    80006260:	ffffd097          	auipc	ra,0xffffd
    80006264:	a40080e7          	jalr	-1472(ra) # 80002ca0 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006268:	0284b503          	ld	a0,40(s1)
    8000626c:	ffffd097          	auipc	ra,0xffffd
    80006270:	a34080e7          	jalr	-1484(ra) # 80002ca0 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006274:	00090513          	mv	a0,s2
    80006278:	01813083          	ld	ra,24(sp)
    8000627c:	01013403          	ld	s0,16(sp)
    80006280:	00813483          	ld	s1,8(sp)
    80006284:	00013903          	ld	s2,0(sp)
    80006288:	02010113          	addi	sp,sp,32
    8000628c:	00008067          	ret
        ret = cap - head + tail;
    80006290:	0004a703          	lw	a4,0(s1)
    80006294:	4127093b          	subw	s2,a4,s2
    80006298:	00f9093b          	addw	s2,s2,a5
    8000629c:	fc1ff06f          	j	8000625c <_ZN9BufferCPP6getCntEv+0x44>

00000000800062a0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800062a0:	fe010113          	addi	sp,sp,-32
    800062a4:	00113c23          	sd	ra,24(sp)
    800062a8:	00813823          	sd	s0,16(sp)
    800062ac:	00913423          	sd	s1,8(sp)
    800062b0:	02010413          	addi	s0,sp,32
    800062b4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800062b8:	00a00513          	li	a0,10
    800062bc:	ffffd097          	auipc	ra,0xffffd
    800062c0:	a44080e7          	jalr	-1468(ra) # 80002d00 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800062c4:	00003517          	auipc	a0,0x3
    800062c8:	29450513          	addi	a0,a0,660 # 80009558 <CONSOLE_STATUS+0x548>
    800062cc:	00000097          	auipc	ra,0x0
    800062d0:	a0c080e7          	jalr	-1524(ra) # 80005cd8 <_Z11printStringPKc>
    while (getCnt()) {
    800062d4:	00048513          	mv	a0,s1
    800062d8:	00000097          	auipc	ra,0x0
    800062dc:	f40080e7          	jalr	-192(ra) # 80006218 <_ZN9BufferCPP6getCntEv>
    800062e0:	02050c63          	beqz	a0,80006318 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800062e4:	0084b783          	ld	a5,8(s1)
    800062e8:	0104a703          	lw	a4,16(s1)
    800062ec:	00271713          	slli	a4,a4,0x2
    800062f0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800062f4:	0007c503          	lbu	a0,0(a5)
    800062f8:	ffffd097          	auipc	ra,0xffffd
    800062fc:	a08080e7          	jalr	-1528(ra) # 80002d00 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006300:	0104a783          	lw	a5,16(s1)
    80006304:	0017879b          	addiw	a5,a5,1
    80006308:	0004a703          	lw	a4,0(s1)
    8000630c:	02e7e7bb          	remw	a5,a5,a4
    80006310:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006314:	fc1ff06f          	j	800062d4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006318:	02100513          	li	a0,33
    8000631c:	ffffd097          	auipc	ra,0xffffd
    80006320:	9e4080e7          	jalr	-1564(ra) # 80002d00 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006324:	00a00513          	li	a0,10
    80006328:	ffffd097          	auipc	ra,0xffffd
    8000632c:	9d8080e7          	jalr	-1576(ra) # 80002d00 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006330:	0084b503          	ld	a0,8(s1)
    80006334:	ffffb097          	auipc	ra,0xffffb
    80006338:	f2c080e7          	jalr	-212(ra) # 80001260 <_Z8mem_freePv>
    delete itemAvailable;
    8000633c:	0204b503          	ld	a0,32(s1)
    80006340:	00050863          	beqz	a0,80006350 <_ZN9BufferCPPD1Ev+0xb0>
    80006344:	00053783          	ld	a5,0(a0)
    80006348:	0087b783          	ld	a5,8(a5)
    8000634c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006350:	0184b503          	ld	a0,24(s1)
    80006354:	00050863          	beqz	a0,80006364 <_ZN9BufferCPPD1Ev+0xc4>
    80006358:	00053783          	ld	a5,0(a0)
    8000635c:	0087b783          	ld	a5,8(a5)
    80006360:	000780e7          	jalr	a5
    delete mutexTail;
    80006364:	0304b503          	ld	a0,48(s1)
    80006368:	00050863          	beqz	a0,80006378 <_ZN9BufferCPPD1Ev+0xd8>
    8000636c:	00053783          	ld	a5,0(a0)
    80006370:	0087b783          	ld	a5,8(a5)
    80006374:	000780e7          	jalr	a5
    delete mutexHead;
    80006378:	0284b503          	ld	a0,40(s1)
    8000637c:	00050863          	beqz	a0,8000638c <_ZN9BufferCPPD1Ev+0xec>
    80006380:	00053783          	ld	a5,0(a0)
    80006384:	0087b783          	ld	a5,8(a5)
    80006388:	000780e7          	jalr	a5
}
    8000638c:	01813083          	ld	ra,24(sp)
    80006390:	01013403          	ld	s0,16(sp)
    80006394:	00813483          	ld	s1,8(sp)
    80006398:	02010113          	addi	sp,sp,32
    8000639c:	00008067          	ret

00000000800063a0 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800063a0:	fe010113          	addi	sp,sp,-32
    800063a4:	00113c23          	sd	ra,24(sp)
    800063a8:	00813823          	sd	s0,16(sp)
    800063ac:	00913423          	sd	s1,8(sp)
    800063b0:	01213023          	sd	s2,0(sp)
    800063b4:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800063b8:	00053903          	ld	s2,0(a0)
    int i = 6;
    800063bc:	00600493          	li	s1,6
    while (--i > 0) {
    800063c0:	fff4849b          	addiw	s1,s1,-1
    800063c4:	04905463          	blez	s1,8000640c <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800063c8:	00003517          	auipc	a0,0x3
    800063cc:	1a850513          	addi	a0,a0,424 # 80009570 <CONSOLE_STATUS+0x560>
    800063d0:	00000097          	auipc	ra,0x0
    800063d4:	908080e7          	jalr	-1784(ra) # 80005cd8 <_Z11printStringPKc>
        printInt(sleep_time);
    800063d8:	00000613          	li	a2,0
    800063dc:	00a00593          	li	a1,10
    800063e0:	0009051b          	sext.w	a0,s2
    800063e4:	00000097          	auipc	ra,0x0
    800063e8:	aa4080e7          	jalr	-1372(ra) # 80005e88 <_Z8printIntiii>
        printString(" !\n");
    800063ec:	00003517          	auipc	a0,0x3
    800063f0:	18c50513          	addi	a0,a0,396 # 80009578 <CONSOLE_STATUS+0x568>
    800063f4:	00000097          	auipc	ra,0x0
    800063f8:	8e4080e7          	jalr	-1820(ra) # 80005cd8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800063fc:	00090513          	mv	a0,s2
    80006400:	ffffc097          	auipc	ra,0xffffc
    80006404:	708080e7          	jalr	1800(ra) # 80002b08 <_Z10time_sleepm>
    while (--i > 0) {
    80006408:	fb9ff06f          	j	800063c0 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000640c:	00a00793          	li	a5,10
    80006410:	02f95933          	divu	s2,s2,a5
    80006414:	fff90913          	addi	s2,s2,-1
    80006418:	00007797          	auipc	a5,0x7
    8000641c:	f2878793          	addi	a5,a5,-216 # 8000d340 <_ZL8finished>
    80006420:	01278933          	add	s2,a5,s2
    80006424:	00100793          	li	a5,1
    80006428:	00f90023          	sb	a5,0(s2)
}
    8000642c:	01813083          	ld	ra,24(sp)
    80006430:	01013403          	ld	s0,16(sp)
    80006434:	00813483          	ld	s1,8(sp)
    80006438:	00013903          	ld	s2,0(sp)
    8000643c:	02010113          	addi	sp,sp,32
    80006440:	00008067          	ret

0000000080006444 <_Z12testSleepingv>:

void testSleeping() {
    80006444:	fc010113          	addi	sp,sp,-64
    80006448:	02113c23          	sd	ra,56(sp)
    8000644c:	02813823          	sd	s0,48(sp)
    80006450:	02913423          	sd	s1,40(sp)
    80006454:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80006458:	00a00793          	li	a5,10
    8000645c:	fcf43823          	sd	a5,-48(s0)
    80006460:	01400793          	li	a5,20
    80006464:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80006468:	00000493          	li	s1,0
    8000646c:	02c0006f          	j	80006498 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80006470:	00349793          	slli	a5,s1,0x3
    80006474:	fd040613          	addi	a2,s0,-48
    80006478:	00f60633          	add	a2,a2,a5
    8000647c:	00000597          	auipc	a1,0x0
    80006480:	f2458593          	addi	a1,a1,-220 # 800063a0 <_ZL9sleepyRunPv>
    80006484:	fc040513          	addi	a0,s0,-64
    80006488:	00f50533          	add	a0,a0,a5
    8000648c:	ffffb097          	auipc	ra,0xffffb
    80006490:	e14080e7          	jalr	-492(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80006494:	0014849b          	addiw	s1,s1,1
    80006498:	00100793          	li	a5,1
    8000649c:	fc97dae3          	bge	a5,s1,80006470 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800064a0:	00007797          	auipc	a5,0x7
    800064a4:	ea07c783          	lbu	a5,-352(a5) # 8000d340 <_ZL8finished>
    800064a8:	fe078ce3          	beqz	a5,800064a0 <_Z12testSleepingv+0x5c>
    800064ac:	00007797          	auipc	a5,0x7
    800064b0:	e957c783          	lbu	a5,-363(a5) # 8000d341 <_ZL8finished+0x1>
    800064b4:	fe0786e3          	beqz	a5,800064a0 <_Z12testSleepingv+0x5c>
}
    800064b8:	03813083          	ld	ra,56(sp)
    800064bc:	03013403          	ld	s0,48(sp)
    800064c0:	02813483          	ld	s1,40(sp)
    800064c4:	04010113          	addi	sp,sp,64
    800064c8:	00008067          	ret

00000000800064cc <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800064cc:	fe010113          	addi	sp,sp,-32
    800064d0:	00113c23          	sd	ra,24(sp)
    800064d4:	00813823          	sd	s0,16(sp)
    800064d8:	00913423          	sd	s1,8(sp)
    800064dc:	01213023          	sd	s2,0(sp)
    800064e0:	02010413          	addi	s0,sp,32
    800064e4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800064e8:	00100793          	li	a5,1
    800064ec:	02a7f863          	bgeu	a5,a0,8000651c <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800064f0:	00a00793          	li	a5,10
    800064f4:	02f577b3          	remu	a5,a0,a5
    800064f8:	02078e63          	beqz	a5,80006534 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800064fc:	fff48513          	addi	a0,s1,-1
    80006500:	00000097          	auipc	ra,0x0
    80006504:	fcc080e7          	jalr	-52(ra) # 800064cc <_ZL9fibonaccim>
    80006508:	00050913          	mv	s2,a0
    8000650c:	ffe48513          	addi	a0,s1,-2
    80006510:	00000097          	auipc	ra,0x0
    80006514:	fbc080e7          	jalr	-68(ra) # 800064cc <_ZL9fibonaccim>
    80006518:	00a90533          	add	a0,s2,a0
}
    8000651c:	01813083          	ld	ra,24(sp)
    80006520:	01013403          	ld	s0,16(sp)
    80006524:	00813483          	ld	s1,8(sp)
    80006528:	00013903          	ld	s2,0(sp)
    8000652c:	02010113          	addi	sp,sp,32
    80006530:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006534:	ffffb097          	auipc	ra,0xffffb
    80006538:	e6c080e7          	jalr	-404(ra) # 800013a0 <_Z15thread_dispatchv>
    8000653c:	fc1ff06f          	j	800064fc <_ZL9fibonaccim+0x30>

0000000080006540 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80006540:	fe010113          	addi	sp,sp,-32
    80006544:	00113c23          	sd	ra,24(sp)
    80006548:	00813823          	sd	s0,16(sp)
    8000654c:	00913423          	sd	s1,8(sp)
    80006550:	01213023          	sd	s2,0(sp)
    80006554:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80006558:	00a00493          	li	s1,10
    8000655c:	0400006f          	j	8000659c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006560:	00003517          	auipc	a0,0x3
    80006564:	f6050513          	addi	a0,a0,-160 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80006568:	fffff097          	auipc	ra,0xfffff
    8000656c:	770080e7          	jalr	1904(ra) # 80005cd8 <_Z11printStringPKc>
    80006570:	00000613          	li	a2,0
    80006574:	00a00593          	li	a1,10
    80006578:	00048513          	mv	a0,s1
    8000657c:	00000097          	auipc	ra,0x0
    80006580:	90c080e7          	jalr	-1780(ra) # 80005e88 <_Z8printIntiii>
    80006584:	00003517          	auipc	a0,0x3
    80006588:	c1450513          	addi	a0,a0,-1004 # 80009198 <CONSOLE_STATUS+0x188>
    8000658c:	fffff097          	auipc	ra,0xfffff
    80006590:	74c080e7          	jalr	1868(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80006594:	0014849b          	addiw	s1,s1,1
    80006598:	0ff4f493          	andi	s1,s1,255
    8000659c:	00c00793          	li	a5,12
    800065a0:	fc97f0e3          	bgeu	a5,s1,80006560 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800065a4:	00003517          	auipc	a0,0x3
    800065a8:	f2450513          	addi	a0,a0,-220 # 800094c8 <CONSOLE_STATUS+0x4b8>
    800065ac:	fffff097          	auipc	ra,0xfffff
    800065b0:	72c080e7          	jalr	1836(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800065b4:	00500313          	li	t1,5
    thread_dispatch();
    800065b8:	ffffb097          	auipc	ra,0xffffb
    800065bc:	de8080e7          	jalr	-536(ra) # 800013a0 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800065c0:	01000513          	li	a0,16
    800065c4:	00000097          	auipc	ra,0x0
    800065c8:	f08080e7          	jalr	-248(ra) # 800064cc <_ZL9fibonaccim>
    800065cc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800065d0:	00003517          	auipc	a0,0x3
    800065d4:	f0850513          	addi	a0,a0,-248 # 800094d8 <CONSOLE_STATUS+0x4c8>
    800065d8:	fffff097          	auipc	ra,0xfffff
    800065dc:	700080e7          	jalr	1792(ra) # 80005cd8 <_Z11printStringPKc>
    800065e0:	00000613          	li	a2,0
    800065e4:	00a00593          	li	a1,10
    800065e8:	0009051b          	sext.w	a0,s2
    800065ec:	00000097          	auipc	ra,0x0
    800065f0:	89c080e7          	jalr	-1892(ra) # 80005e88 <_Z8printIntiii>
    800065f4:	00003517          	auipc	a0,0x3
    800065f8:	ba450513          	addi	a0,a0,-1116 # 80009198 <CONSOLE_STATUS+0x188>
    800065fc:	fffff097          	auipc	ra,0xfffff
    80006600:	6dc080e7          	jalr	1756(ra) # 80005cd8 <_Z11printStringPKc>
    80006604:	0400006f          	j	80006644 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80006608:	00003517          	auipc	a0,0x3
    8000660c:	eb850513          	addi	a0,a0,-328 # 800094c0 <CONSOLE_STATUS+0x4b0>
    80006610:	fffff097          	auipc	ra,0xfffff
    80006614:	6c8080e7          	jalr	1736(ra) # 80005cd8 <_Z11printStringPKc>
    80006618:	00000613          	li	a2,0
    8000661c:	00a00593          	li	a1,10
    80006620:	00048513          	mv	a0,s1
    80006624:	00000097          	auipc	ra,0x0
    80006628:	864080e7          	jalr	-1948(ra) # 80005e88 <_Z8printIntiii>
    8000662c:	00003517          	auipc	a0,0x3
    80006630:	b6c50513          	addi	a0,a0,-1172 # 80009198 <CONSOLE_STATUS+0x188>
    80006634:	fffff097          	auipc	ra,0xfffff
    80006638:	6a4080e7          	jalr	1700(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000663c:	0014849b          	addiw	s1,s1,1
    80006640:	0ff4f493          	andi	s1,s1,255
    80006644:	00f00793          	li	a5,15
    80006648:	fc97f0e3          	bgeu	a5,s1,80006608 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000664c:	00003517          	auipc	a0,0x3
    80006650:	e9c50513          	addi	a0,a0,-356 # 800094e8 <CONSOLE_STATUS+0x4d8>
    80006654:	fffff097          	auipc	ra,0xfffff
    80006658:	684080e7          	jalr	1668(ra) # 80005cd8 <_Z11printStringPKc>
    finishedD = true;
    8000665c:	00100793          	li	a5,1
    80006660:	00007717          	auipc	a4,0x7
    80006664:	cef70123          	sb	a5,-798(a4) # 8000d342 <_ZL9finishedD>
    thread_dispatch();
    80006668:	ffffb097          	auipc	ra,0xffffb
    8000666c:	d38080e7          	jalr	-712(ra) # 800013a0 <_Z15thread_dispatchv>
}
    80006670:	01813083          	ld	ra,24(sp)
    80006674:	01013403          	ld	s0,16(sp)
    80006678:	00813483          	ld	s1,8(sp)
    8000667c:	00013903          	ld	s2,0(sp)
    80006680:	02010113          	addi	sp,sp,32
    80006684:	00008067          	ret

0000000080006688 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80006688:	fe010113          	addi	sp,sp,-32
    8000668c:	00113c23          	sd	ra,24(sp)
    80006690:	00813823          	sd	s0,16(sp)
    80006694:	00913423          	sd	s1,8(sp)
    80006698:	01213023          	sd	s2,0(sp)
    8000669c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800066a0:	00000493          	li	s1,0
    800066a4:	0400006f          	j	800066e4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    800066a8:	00003517          	auipc	a0,0x3
    800066ac:	de850513          	addi	a0,a0,-536 # 80009490 <CONSOLE_STATUS+0x480>
    800066b0:	fffff097          	auipc	ra,0xfffff
    800066b4:	628080e7          	jalr	1576(ra) # 80005cd8 <_Z11printStringPKc>
    800066b8:	00000613          	li	a2,0
    800066bc:	00a00593          	li	a1,10
    800066c0:	00048513          	mv	a0,s1
    800066c4:	fffff097          	auipc	ra,0xfffff
    800066c8:	7c4080e7          	jalr	1988(ra) # 80005e88 <_Z8printIntiii>
    800066cc:	00003517          	auipc	a0,0x3
    800066d0:	acc50513          	addi	a0,a0,-1332 # 80009198 <CONSOLE_STATUS+0x188>
    800066d4:	fffff097          	auipc	ra,0xfffff
    800066d8:	604080e7          	jalr	1540(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800066dc:	0014849b          	addiw	s1,s1,1
    800066e0:	0ff4f493          	andi	s1,s1,255
    800066e4:	00200793          	li	a5,2
    800066e8:	fc97f0e3          	bgeu	a5,s1,800066a8 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800066ec:	00003517          	auipc	a0,0x3
    800066f0:	dac50513          	addi	a0,a0,-596 # 80009498 <CONSOLE_STATUS+0x488>
    800066f4:	fffff097          	auipc	ra,0xfffff
    800066f8:	5e4080e7          	jalr	1508(ra) # 80005cd8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800066fc:	00700313          	li	t1,7
    thread_dispatch();
    80006700:	ffffb097          	auipc	ra,0xffffb
    80006704:	ca0080e7          	jalr	-864(ra) # 800013a0 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80006708:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    8000670c:	00003517          	auipc	a0,0x3
    80006710:	d9c50513          	addi	a0,a0,-612 # 800094a8 <CONSOLE_STATUS+0x498>
    80006714:	fffff097          	auipc	ra,0xfffff
    80006718:	5c4080e7          	jalr	1476(ra) # 80005cd8 <_Z11printStringPKc>
    8000671c:	00000613          	li	a2,0
    80006720:	00a00593          	li	a1,10
    80006724:	0009051b          	sext.w	a0,s2
    80006728:	fffff097          	auipc	ra,0xfffff
    8000672c:	760080e7          	jalr	1888(ra) # 80005e88 <_Z8printIntiii>
    80006730:	00003517          	auipc	a0,0x3
    80006734:	a6850513          	addi	a0,a0,-1432 # 80009198 <CONSOLE_STATUS+0x188>
    80006738:	fffff097          	auipc	ra,0xfffff
    8000673c:	5a0080e7          	jalr	1440(ra) # 80005cd8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80006740:	00c00513          	li	a0,12
    80006744:	00000097          	auipc	ra,0x0
    80006748:	d88080e7          	jalr	-632(ra) # 800064cc <_ZL9fibonaccim>
    8000674c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80006750:	00003517          	auipc	a0,0x3
    80006754:	d6050513          	addi	a0,a0,-672 # 800094b0 <CONSOLE_STATUS+0x4a0>
    80006758:	fffff097          	auipc	ra,0xfffff
    8000675c:	580080e7          	jalr	1408(ra) # 80005cd8 <_Z11printStringPKc>
    80006760:	00000613          	li	a2,0
    80006764:	00a00593          	li	a1,10
    80006768:	0009051b          	sext.w	a0,s2
    8000676c:	fffff097          	auipc	ra,0xfffff
    80006770:	71c080e7          	jalr	1820(ra) # 80005e88 <_Z8printIntiii>
    80006774:	00003517          	auipc	a0,0x3
    80006778:	a2450513          	addi	a0,a0,-1500 # 80009198 <CONSOLE_STATUS+0x188>
    8000677c:	fffff097          	auipc	ra,0xfffff
    80006780:	55c080e7          	jalr	1372(ra) # 80005cd8 <_Z11printStringPKc>
    80006784:	0400006f          	j	800067c4 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006788:	00003517          	auipc	a0,0x3
    8000678c:	d0850513          	addi	a0,a0,-760 # 80009490 <CONSOLE_STATUS+0x480>
    80006790:	fffff097          	auipc	ra,0xfffff
    80006794:	548080e7          	jalr	1352(ra) # 80005cd8 <_Z11printStringPKc>
    80006798:	00000613          	li	a2,0
    8000679c:	00a00593          	li	a1,10
    800067a0:	00048513          	mv	a0,s1
    800067a4:	fffff097          	auipc	ra,0xfffff
    800067a8:	6e4080e7          	jalr	1764(ra) # 80005e88 <_Z8printIntiii>
    800067ac:	00003517          	auipc	a0,0x3
    800067b0:	9ec50513          	addi	a0,a0,-1556 # 80009198 <CONSOLE_STATUS+0x188>
    800067b4:	fffff097          	auipc	ra,0xfffff
    800067b8:	524080e7          	jalr	1316(ra) # 80005cd8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800067bc:	0014849b          	addiw	s1,s1,1
    800067c0:	0ff4f493          	andi	s1,s1,255
    800067c4:	00500793          	li	a5,5
    800067c8:	fc97f0e3          	bgeu	a5,s1,80006788 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    800067cc:	00003517          	auipc	a0,0x3
    800067d0:	c9c50513          	addi	a0,a0,-868 # 80009468 <CONSOLE_STATUS+0x458>
    800067d4:	fffff097          	auipc	ra,0xfffff
    800067d8:	504080e7          	jalr	1284(ra) # 80005cd8 <_Z11printStringPKc>
    finishedC = true;
    800067dc:	00100793          	li	a5,1
    800067e0:	00007717          	auipc	a4,0x7
    800067e4:	b6f701a3          	sb	a5,-1181(a4) # 8000d343 <_ZL9finishedC>
    thread_dispatch();
    800067e8:	ffffb097          	auipc	ra,0xffffb
    800067ec:	bb8080e7          	jalr	-1096(ra) # 800013a0 <_Z15thread_dispatchv>
}
    800067f0:	01813083          	ld	ra,24(sp)
    800067f4:	01013403          	ld	s0,16(sp)
    800067f8:	00813483          	ld	s1,8(sp)
    800067fc:	00013903          	ld	s2,0(sp)
    80006800:	02010113          	addi	sp,sp,32
    80006804:	00008067          	ret

0000000080006808 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006808:	fe010113          	addi	sp,sp,-32
    8000680c:	00113c23          	sd	ra,24(sp)
    80006810:	00813823          	sd	s0,16(sp)
    80006814:	00913423          	sd	s1,8(sp)
    80006818:	01213023          	sd	s2,0(sp)
    8000681c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006820:	00000913          	li	s2,0
    80006824:	0400006f          	j	80006864 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80006828:	ffffb097          	auipc	ra,0xffffb
    8000682c:	b78080e7          	jalr	-1160(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006830:	00148493          	addi	s1,s1,1
    80006834:	000027b7          	lui	a5,0x2
    80006838:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000683c:	0097ee63          	bltu	a5,s1,80006858 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006840:	00000713          	li	a4,0
    80006844:	000077b7          	lui	a5,0x7
    80006848:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000684c:	fce7eee3          	bltu	a5,a4,80006828 <_ZL11workerBodyBPv+0x20>
    80006850:	00170713          	addi	a4,a4,1
    80006854:	ff1ff06f          	j	80006844 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80006858:	00a00793          	li	a5,10
    8000685c:	04f90663          	beq	s2,a5,800068a8 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80006860:	00190913          	addi	s2,s2,1
    80006864:	00f00793          	li	a5,15
    80006868:	0527e463          	bltu	a5,s2,800068b0 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    8000686c:	00003517          	auipc	a0,0x3
    80006870:	c0c50513          	addi	a0,a0,-1012 # 80009478 <CONSOLE_STATUS+0x468>
    80006874:	fffff097          	auipc	ra,0xfffff
    80006878:	464080e7          	jalr	1124(ra) # 80005cd8 <_Z11printStringPKc>
    8000687c:	00000613          	li	a2,0
    80006880:	00a00593          	li	a1,10
    80006884:	0009051b          	sext.w	a0,s2
    80006888:	fffff097          	auipc	ra,0xfffff
    8000688c:	600080e7          	jalr	1536(ra) # 80005e88 <_Z8printIntiii>
    80006890:	00003517          	auipc	a0,0x3
    80006894:	90850513          	addi	a0,a0,-1784 # 80009198 <CONSOLE_STATUS+0x188>
    80006898:	fffff097          	auipc	ra,0xfffff
    8000689c:	440080e7          	jalr	1088(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068a0:	00000493          	li	s1,0
    800068a4:	f91ff06f          	j	80006834 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    800068a8:	14102ff3          	csrr	t6,sepc
    800068ac:	fb5ff06f          	j	80006860 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    800068b0:	00003517          	auipc	a0,0x3
    800068b4:	bd050513          	addi	a0,a0,-1072 # 80009480 <CONSOLE_STATUS+0x470>
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	420080e7          	jalr	1056(ra) # 80005cd8 <_Z11printStringPKc>
    finishedB = true;
    800068c0:	00100793          	li	a5,1
    800068c4:	00007717          	auipc	a4,0x7
    800068c8:	a8f70023          	sb	a5,-1408(a4) # 8000d344 <_ZL9finishedB>
    thread_dispatch();
    800068cc:	ffffb097          	auipc	ra,0xffffb
    800068d0:	ad4080e7          	jalr	-1324(ra) # 800013a0 <_Z15thread_dispatchv>
}
    800068d4:	01813083          	ld	ra,24(sp)
    800068d8:	01013403          	ld	s0,16(sp)
    800068dc:	00813483          	ld	s1,8(sp)
    800068e0:	00013903          	ld	s2,0(sp)
    800068e4:	02010113          	addi	sp,sp,32
    800068e8:	00008067          	ret

00000000800068ec <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800068ec:	fe010113          	addi	sp,sp,-32
    800068f0:	00113c23          	sd	ra,24(sp)
    800068f4:	00813823          	sd	s0,16(sp)
    800068f8:	00913423          	sd	s1,8(sp)
    800068fc:	01213023          	sd	s2,0(sp)
    80006900:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006904:	00000913          	li	s2,0
    80006908:	0380006f          	j	80006940 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    8000690c:	ffffb097          	auipc	ra,0xffffb
    80006910:	a94080e7          	jalr	-1388(ra) # 800013a0 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006914:	00148493          	addi	s1,s1,1
    80006918:	000027b7          	lui	a5,0x2
    8000691c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006920:	0097ee63          	bltu	a5,s1,8000693c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006924:	00000713          	li	a4,0
    80006928:	000077b7          	lui	a5,0x7
    8000692c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006930:	fce7eee3          	bltu	a5,a4,8000690c <_ZL11workerBodyAPv+0x20>
    80006934:	00170713          	addi	a4,a4,1
    80006938:	ff1ff06f          	j	80006928 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000693c:	00190913          	addi	s2,s2,1
    80006940:	00900793          	li	a5,9
    80006944:	0527e063          	bltu	a5,s2,80006984 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80006948:	00003517          	auipc	a0,0x3
    8000694c:	b1850513          	addi	a0,a0,-1256 # 80009460 <CONSOLE_STATUS+0x450>
    80006950:	fffff097          	auipc	ra,0xfffff
    80006954:	388080e7          	jalr	904(ra) # 80005cd8 <_Z11printStringPKc>
    80006958:	00000613          	li	a2,0
    8000695c:	00a00593          	li	a1,10
    80006960:	0009051b          	sext.w	a0,s2
    80006964:	fffff097          	auipc	ra,0xfffff
    80006968:	524080e7          	jalr	1316(ra) # 80005e88 <_Z8printIntiii>
    8000696c:	00003517          	auipc	a0,0x3
    80006970:	82c50513          	addi	a0,a0,-2004 # 80009198 <CONSOLE_STATUS+0x188>
    80006974:	fffff097          	auipc	ra,0xfffff
    80006978:	364080e7          	jalr	868(ra) # 80005cd8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000697c:	00000493          	li	s1,0
    80006980:	f99ff06f          	j	80006918 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006984:	00003517          	auipc	a0,0x3
    80006988:	ae450513          	addi	a0,a0,-1308 # 80009468 <CONSOLE_STATUS+0x458>
    8000698c:	fffff097          	auipc	ra,0xfffff
    80006990:	34c080e7          	jalr	844(ra) # 80005cd8 <_Z11printStringPKc>
    finishedA = true;
    80006994:	00100793          	li	a5,1
    80006998:	00007717          	auipc	a4,0x7
    8000699c:	9af706a3          	sb	a5,-1619(a4) # 8000d345 <_ZL9finishedA>
}
    800069a0:	01813083          	ld	ra,24(sp)
    800069a4:	01013403          	ld	s0,16(sp)
    800069a8:	00813483          	ld	s1,8(sp)
    800069ac:	00013903          	ld	s2,0(sp)
    800069b0:	02010113          	addi	sp,sp,32
    800069b4:	00008067          	ret

00000000800069b8 <_Z16System_Mode_testv>:


void System_Mode_test() {
    800069b8:	fd010113          	addi	sp,sp,-48
    800069bc:	02113423          	sd	ra,40(sp)
    800069c0:	02813023          	sd	s0,32(sp)
    800069c4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800069c8:	00000613          	li	a2,0
    800069cc:	00000597          	auipc	a1,0x0
    800069d0:	f2058593          	addi	a1,a1,-224 # 800068ec <_ZL11workerBodyAPv>
    800069d4:	fd040513          	addi	a0,s0,-48
    800069d8:	ffffb097          	auipc	ra,0xffffb
    800069dc:	8c8080e7          	jalr	-1848(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadA created\n");
    800069e0:	00003517          	auipc	a0,0x3
    800069e4:	b1850513          	addi	a0,a0,-1256 # 800094f8 <CONSOLE_STATUS+0x4e8>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	2f0080e7          	jalr	752(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800069f0:	00000613          	li	a2,0
    800069f4:	00000597          	auipc	a1,0x0
    800069f8:	e1458593          	addi	a1,a1,-492 # 80006808 <_ZL11workerBodyBPv>
    800069fc:	fd840513          	addi	a0,s0,-40
    80006a00:	ffffb097          	auipc	ra,0xffffb
    80006a04:	8a0080e7          	jalr	-1888(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadB created\n");
    80006a08:	00003517          	auipc	a0,0x3
    80006a0c:	b0850513          	addi	a0,a0,-1272 # 80009510 <CONSOLE_STATUS+0x500>
    80006a10:	fffff097          	auipc	ra,0xfffff
    80006a14:	2c8080e7          	jalr	712(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006a18:	00000613          	li	a2,0
    80006a1c:	00000597          	auipc	a1,0x0
    80006a20:	c6c58593          	addi	a1,a1,-916 # 80006688 <_ZL11workerBodyCPv>
    80006a24:	fe040513          	addi	a0,s0,-32
    80006a28:	ffffb097          	auipc	ra,0xffffb
    80006a2c:	878080e7          	jalr	-1928(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadC created\n");
    80006a30:	00003517          	auipc	a0,0x3
    80006a34:	af850513          	addi	a0,a0,-1288 # 80009528 <CONSOLE_STATUS+0x518>
    80006a38:	fffff097          	auipc	ra,0xfffff
    80006a3c:	2a0080e7          	jalr	672(ra) # 80005cd8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80006a40:	00000613          	li	a2,0
    80006a44:	00000597          	auipc	a1,0x0
    80006a48:	afc58593          	addi	a1,a1,-1284 # 80006540 <_ZL11workerBodyDPv>
    80006a4c:	fe840513          	addi	a0,s0,-24
    80006a50:	ffffb097          	auipc	ra,0xffffb
    80006a54:	850080e7          	jalr	-1968(ra) # 800012a0 <_Z13thread_createPP7KThreadPFvPvES2_>
    printString("ThreadD created\n");
    80006a58:	00003517          	auipc	a0,0x3
    80006a5c:	ae850513          	addi	a0,a0,-1304 # 80009540 <CONSOLE_STATUS+0x530>
    80006a60:	fffff097          	auipc	ra,0xfffff
    80006a64:	278080e7          	jalr	632(ra) # 80005cd8 <_Z11printStringPKc>
    80006a68:	00c0006f          	j	80006a74 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80006a6c:	ffffb097          	auipc	ra,0xffffb
    80006a70:	934080e7          	jalr	-1740(ra) # 800013a0 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80006a74:	00007797          	auipc	a5,0x7
    80006a78:	8d17c783          	lbu	a5,-1839(a5) # 8000d345 <_ZL9finishedA>
    80006a7c:	fe0788e3          	beqz	a5,80006a6c <_Z16System_Mode_testv+0xb4>
    80006a80:	00007797          	auipc	a5,0x7
    80006a84:	8c47c783          	lbu	a5,-1852(a5) # 8000d344 <_ZL9finishedB>
    80006a88:	fe0782e3          	beqz	a5,80006a6c <_Z16System_Mode_testv+0xb4>
    80006a8c:	00007797          	auipc	a5,0x7
    80006a90:	8b77c783          	lbu	a5,-1865(a5) # 8000d343 <_ZL9finishedC>
    80006a94:	fc078ce3          	beqz	a5,80006a6c <_Z16System_Mode_testv+0xb4>
    80006a98:	00007797          	auipc	a5,0x7
    80006a9c:	8aa7c783          	lbu	a5,-1878(a5) # 8000d342 <_ZL9finishedD>
    80006aa0:	fc0786e3          	beqz	a5,80006a6c <_Z16System_Mode_testv+0xb4>
    }

}
    80006aa4:	02813083          	ld	ra,40(sp)
    80006aa8:	02013403          	ld	s0,32(sp)
    80006aac:	03010113          	addi	sp,sp,48
    80006ab0:	00008067          	ret

0000000080006ab4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006ab4:	fe010113          	addi	sp,sp,-32
    80006ab8:	00113c23          	sd	ra,24(sp)
    80006abc:	00813823          	sd	s0,16(sp)
    80006ac0:	00913423          	sd	s1,8(sp)
    80006ac4:	01213023          	sd	s2,0(sp)
    80006ac8:	02010413          	addi	s0,sp,32
    80006acc:	00050493          	mv	s1,a0
    80006ad0:	00058913          	mv	s2,a1
    80006ad4:	0015879b          	addiw	a5,a1,1
    80006ad8:	0007851b          	sext.w	a0,a5
    80006adc:	00f4a023          	sw	a5,0(s1)
    80006ae0:	0004a823          	sw	zero,16(s1)
    80006ae4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006ae8:	00251513          	slli	a0,a0,0x2
    80006aec:	ffffa097          	auipc	ra,0xffffa
    80006af0:	728080e7          	jalr	1832(ra) # 80001214 <_Z9mem_allocm>
    80006af4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006af8:	00000593          	li	a1,0
    80006afc:	02048513          	addi	a0,s1,32
    80006b00:	ffffb097          	auipc	ra,0xffffb
    80006b04:	8dc080e7          	jalr	-1828(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
    sem_open(&spaceAvailable, _cap);
    80006b08:	00090593          	mv	a1,s2
    80006b0c:	01848513          	addi	a0,s1,24
    80006b10:	ffffb097          	auipc	ra,0xffffb
    80006b14:	8cc080e7          	jalr	-1844(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
    sem_open(&mutexHead, 1);
    80006b18:	00100593          	li	a1,1
    80006b1c:	02848513          	addi	a0,s1,40
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	8bc080e7          	jalr	-1860(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
    sem_open(&mutexTail, 1);
    80006b28:	00100593          	li	a1,1
    80006b2c:	03048513          	addi	a0,s1,48
    80006b30:	ffffb097          	auipc	ra,0xffffb
    80006b34:	8ac080e7          	jalr	-1876(ra) # 800013dc <_Z8sem_openPP10KSemaphorej>
}
    80006b38:	01813083          	ld	ra,24(sp)
    80006b3c:	01013403          	ld	s0,16(sp)
    80006b40:	00813483          	ld	s1,8(sp)
    80006b44:	00013903          	ld	s2,0(sp)
    80006b48:	02010113          	addi	sp,sp,32
    80006b4c:	00008067          	ret

0000000080006b50 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006b50:	fe010113          	addi	sp,sp,-32
    80006b54:	00113c23          	sd	ra,24(sp)
    80006b58:	00813823          	sd	s0,16(sp)
    80006b5c:	00913423          	sd	s1,8(sp)
    80006b60:	01213023          	sd	s2,0(sp)
    80006b64:	02010413          	addi	s0,sp,32
    80006b68:	00050493          	mv	s1,a0
    80006b6c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006b70:	01853503          	ld	a0,24(a0)
    80006b74:	ffffb097          	auipc	ra,0xffffb
    80006b78:	8f4080e7          	jalr	-1804(ra) # 80001468 <_Z8sem_waitP10KSemaphore>

    sem_wait(mutexTail);
    80006b7c:	0304b503          	ld	a0,48(s1)
    80006b80:	ffffb097          	auipc	ra,0xffffb
    80006b84:	8e8080e7          	jalr	-1816(ra) # 80001468 <_Z8sem_waitP10KSemaphore>
    buffer[tail] = val;
    80006b88:	0084b783          	ld	a5,8(s1)
    80006b8c:	0144a703          	lw	a4,20(s1)
    80006b90:	00271713          	slli	a4,a4,0x2
    80006b94:	00e787b3          	add	a5,a5,a4
    80006b98:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006b9c:	0144a783          	lw	a5,20(s1)
    80006ba0:	0017879b          	addiw	a5,a5,1
    80006ba4:	0004a703          	lw	a4,0(s1)
    80006ba8:	02e7e7bb          	remw	a5,a5,a4
    80006bac:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006bb0:	0304b503          	ld	a0,48(s1)
    80006bb4:	ffffb097          	auipc	ra,0xffffb
    80006bb8:	8f4080e7          	jalr	-1804(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>

    sem_signal(itemAvailable);
    80006bbc:	0204b503          	ld	a0,32(s1)
    80006bc0:	ffffb097          	auipc	ra,0xffffb
    80006bc4:	8e8080e7          	jalr	-1816(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>

}
    80006bc8:	01813083          	ld	ra,24(sp)
    80006bcc:	01013403          	ld	s0,16(sp)
    80006bd0:	00813483          	ld	s1,8(sp)
    80006bd4:	00013903          	ld	s2,0(sp)
    80006bd8:	02010113          	addi	sp,sp,32
    80006bdc:	00008067          	ret

0000000080006be0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006be0:	fe010113          	addi	sp,sp,-32
    80006be4:	00113c23          	sd	ra,24(sp)
    80006be8:	00813823          	sd	s0,16(sp)
    80006bec:	00913423          	sd	s1,8(sp)
    80006bf0:	01213023          	sd	s2,0(sp)
    80006bf4:	02010413          	addi	s0,sp,32
    80006bf8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006bfc:	02053503          	ld	a0,32(a0)
    80006c00:	ffffb097          	auipc	ra,0xffffb
    80006c04:	868080e7          	jalr	-1944(ra) # 80001468 <_Z8sem_waitP10KSemaphore>

    sem_wait(mutexHead);
    80006c08:	0284b503          	ld	a0,40(s1)
    80006c0c:	ffffb097          	auipc	ra,0xffffb
    80006c10:	85c080e7          	jalr	-1956(ra) # 80001468 <_Z8sem_waitP10KSemaphore>

    int ret = buffer[head];
    80006c14:	0084b703          	ld	a4,8(s1)
    80006c18:	0104a783          	lw	a5,16(s1)
    80006c1c:	00279693          	slli	a3,a5,0x2
    80006c20:	00d70733          	add	a4,a4,a3
    80006c24:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006c28:	0017879b          	addiw	a5,a5,1
    80006c2c:	0004a703          	lw	a4,0(s1)
    80006c30:	02e7e7bb          	remw	a5,a5,a4
    80006c34:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006c38:	0284b503          	ld	a0,40(s1)
    80006c3c:	ffffb097          	auipc	ra,0xffffb
    80006c40:	86c080e7          	jalr	-1940(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>

    sem_signal(spaceAvailable);
    80006c44:	0184b503          	ld	a0,24(s1)
    80006c48:	ffffb097          	auipc	ra,0xffffb
    80006c4c:	860080e7          	jalr	-1952(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>

    return ret;
}
    80006c50:	00090513          	mv	a0,s2
    80006c54:	01813083          	ld	ra,24(sp)
    80006c58:	01013403          	ld	s0,16(sp)
    80006c5c:	00813483          	ld	s1,8(sp)
    80006c60:	00013903          	ld	s2,0(sp)
    80006c64:	02010113          	addi	sp,sp,32
    80006c68:	00008067          	ret

0000000080006c6c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006c6c:	fe010113          	addi	sp,sp,-32
    80006c70:	00113c23          	sd	ra,24(sp)
    80006c74:	00813823          	sd	s0,16(sp)
    80006c78:	00913423          	sd	s1,8(sp)
    80006c7c:	01213023          	sd	s2,0(sp)
    80006c80:	02010413          	addi	s0,sp,32
    80006c84:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006c88:	02853503          	ld	a0,40(a0)
    80006c8c:	ffffa097          	auipc	ra,0xffffa
    80006c90:	7dc080e7          	jalr	2012(ra) # 80001468 <_Z8sem_waitP10KSemaphore>
    sem_wait(mutexTail);
    80006c94:	0304b503          	ld	a0,48(s1)
    80006c98:	ffffa097          	auipc	ra,0xffffa
    80006c9c:	7d0080e7          	jalr	2000(ra) # 80001468 <_Z8sem_waitP10KSemaphore>

    if (tail >= head) {
    80006ca0:	0144a783          	lw	a5,20(s1)
    80006ca4:	0104a903          	lw	s2,16(s1)
    80006ca8:	0327ce63          	blt	a5,s2,80006ce4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006cac:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006cb0:	0304b503          	ld	a0,48(s1)
    80006cb4:	ffffa097          	auipc	ra,0xffffa
    80006cb8:	7f4080e7          	jalr	2036(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>
    sem_signal(mutexHead);
    80006cbc:	0284b503          	ld	a0,40(s1)
    80006cc0:	ffffa097          	auipc	ra,0xffffa
    80006cc4:	7e8080e7          	jalr	2024(ra) # 800014a8 <_Z10sem_signalP10KSemaphore>

    return ret;
}
    80006cc8:	00090513          	mv	a0,s2
    80006ccc:	01813083          	ld	ra,24(sp)
    80006cd0:	01013403          	ld	s0,16(sp)
    80006cd4:	00813483          	ld	s1,8(sp)
    80006cd8:	00013903          	ld	s2,0(sp)
    80006cdc:	02010113          	addi	sp,sp,32
    80006ce0:	00008067          	ret
        ret = cap - head + tail;
    80006ce4:	0004a703          	lw	a4,0(s1)
    80006ce8:	4127093b          	subw	s2,a4,s2
    80006cec:	00f9093b          	addw	s2,s2,a5
    80006cf0:	fc1ff06f          	j	80006cb0 <_ZN6Buffer6getCntEv+0x44>

0000000080006cf4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006cf4:	fe010113          	addi	sp,sp,-32
    80006cf8:	00113c23          	sd	ra,24(sp)
    80006cfc:	00813823          	sd	s0,16(sp)
    80006d00:	00913423          	sd	s1,8(sp)
    80006d04:	02010413          	addi	s0,sp,32
    80006d08:	00050493          	mv	s1,a0
    putc('\n');
    80006d0c:	00a00513          	li	a0,10
    80006d10:	ffffb097          	auipc	ra,0xffffb
    80006d14:	8b0080e7          	jalr	-1872(ra) # 800015c0 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006d18:	00003517          	auipc	a0,0x3
    80006d1c:	84050513          	addi	a0,a0,-1984 # 80009558 <CONSOLE_STATUS+0x548>
    80006d20:	fffff097          	auipc	ra,0xfffff
    80006d24:	fb8080e7          	jalr	-72(ra) # 80005cd8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006d28:	00048513          	mv	a0,s1
    80006d2c:	00000097          	auipc	ra,0x0
    80006d30:	f40080e7          	jalr	-192(ra) # 80006c6c <_ZN6Buffer6getCntEv>
    80006d34:	02a05c63          	blez	a0,80006d6c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006d38:	0084b783          	ld	a5,8(s1)
    80006d3c:	0104a703          	lw	a4,16(s1)
    80006d40:	00271713          	slli	a4,a4,0x2
    80006d44:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006d48:	0007c503          	lbu	a0,0(a5)
    80006d4c:	ffffb097          	auipc	ra,0xffffb
    80006d50:	874080e7          	jalr	-1932(ra) # 800015c0 <_Z4putcc>
        head = (head + 1) % cap;
    80006d54:	0104a783          	lw	a5,16(s1)
    80006d58:	0017879b          	addiw	a5,a5,1
    80006d5c:	0004a703          	lw	a4,0(s1)
    80006d60:	02e7e7bb          	remw	a5,a5,a4
    80006d64:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006d68:	fc1ff06f          	j	80006d28 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006d6c:	02100513          	li	a0,33
    80006d70:	ffffb097          	auipc	ra,0xffffb
    80006d74:	850080e7          	jalr	-1968(ra) # 800015c0 <_Z4putcc>
    putc('\n');
    80006d78:	00a00513          	li	a0,10
    80006d7c:	ffffb097          	auipc	ra,0xffffb
    80006d80:	844080e7          	jalr	-1980(ra) # 800015c0 <_Z4putcc>
    mem_free(buffer);
    80006d84:	0084b503          	ld	a0,8(s1)
    80006d88:	ffffa097          	auipc	ra,0xffffa
    80006d8c:	4d8080e7          	jalr	1240(ra) # 80001260 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006d90:	0204b503          	ld	a0,32(s1)
    80006d94:	ffffa097          	auipc	ra,0xffffa
    80006d98:	694080e7          	jalr	1684(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
    sem_close(spaceAvailable);
    80006d9c:	0184b503          	ld	a0,24(s1)
    80006da0:	ffffa097          	auipc	ra,0xffffa
    80006da4:	688080e7          	jalr	1672(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
    sem_close(mutexTail);
    80006da8:	0304b503          	ld	a0,48(s1)
    80006dac:	ffffa097          	auipc	ra,0xffffa
    80006db0:	67c080e7          	jalr	1660(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
    sem_close(mutexHead);
    80006db4:	0284b503          	ld	a0,40(s1)
    80006db8:	ffffa097          	auipc	ra,0xffffa
    80006dbc:	670080e7          	jalr	1648(ra) # 80001428 <_Z9sem_closeP10KSemaphore>
}
    80006dc0:	01813083          	ld	ra,24(sp)
    80006dc4:	01013403          	ld	s0,16(sp)
    80006dc8:	00813483          	ld	s1,8(sp)
    80006dcc:	02010113          	addi	sp,sp,32
    80006dd0:	00008067          	ret

0000000080006dd4 <start>:
    80006dd4:	ff010113          	addi	sp,sp,-16
    80006dd8:	00813423          	sd	s0,8(sp)
    80006ddc:	01010413          	addi	s0,sp,16
    80006de0:	300027f3          	csrr	a5,mstatus
    80006de4:	ffffe737          	lui	a4,0xffffe
    80006de8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff024f>
    80006dec:	00e7f7b3          	and	a5,a5,a4
    80006df0:	00001737          	lui	a4,0x1
    80006df4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006df8:	00e7e7b3          	or	a5,a5,a4
    80006dfc:	30079073          	csrw	mstatus,a5
    80006e00:	00000797          	auipc	a5,0x0
    80006e04:	16078793          	addi	a5,a5,352 # 80006f60 <system_main>
    80006e08:	34179073          	csrw	mepc,a5
    80006e0c:	00000793          	li	a5,0
    80006e10:	18079073          	csrw	satp,a5
    80006e14:	000107b7          	lui	a5,0x10
    80006e18:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006e1c:	30279073          	csrw	medeleg,a5
    80006e20:	30379073          	csrw	mideleg,a5
    80006e24:	104027f3          	csrr	a5,sie
    80006e28:	2227e793          	ori	a5,a5,546
    80006e2c:	10479073          	csrw	sie,a5
    80006e30:	fff00793          	li	a5,-1
    80006e34:	00a7d793          	srli	a5,a5,0xa
    80006e38:	3b079073          	csrw	pmpaddr0,a5
    80006e3c:	00f00793          	li	a5,15
    80006e40:	3a079073          	csrw	pmpcfg0,a5
    80006e44:	f14027f3          	csrr	a5,mhartid
    80006e48:	0200c737          	lui	a4,0x200c
    80006e4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006e50:	0007869b          	sext.w	a3,a5
    80006e54:	00269713          	slli	a4,a3,0x2
    80006e58:	000f4637          	lui	a2,0xf4
    80006e5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006e60:	00d70733          	add	a4,a4,a3
    80006e64:	0037979b          	slliw	a5,a5,0x3
    80006e68:	020046b7          	lui	a3,0x2004
    80006e6c:	00d787b3          	add	a5,a5,a3
    80006e70:	00c585b3          	add	a1,a1,a2
    80006e74:	00371693          	slli	a3,a4,0x3
    80006e78:	00006717          	auipc	a4,0x6
    80006e7c:	4d870713          	addi	a4,a4,1240 # 8000d350 <timer_scratch>
    80006e80:	00b7b023          	sd	a1,0(a5)
    80006e84:	00d70733          	add	a4,a4,a3
    80006e88:	00f73c23          	sd	a5,24(a4)
    80006e8c:	02c73023          	sd	a2,32(a4)
    80006e90:	34071073          	csrw	mscratch,a4
    80006e94:	00000797          	auipc	a5,0x0
    80006e98:	6ec78793          	addi	a5,a5,1772 # 80007580 <timervec>
    80006e9c:	30579073          	csrw	mtvec,a5
    80006ea0:	300027f3          	csrr	a5,mstatus
    80006ea4:	0087e793          	ori	a5,a5,8
    80006ea8:	30079073          	csrw	mstatus,a5
    80006eac:	304027f3          	csrr	a5,mie
    80006eb0:	0807e793          	ori	a5,a5,128
    80006eb4:	30479073          	csrw	mie,a5
    80006eb8:	f14027f3          	csrr	a5,mhartid
    80006ebc:	0007879b          	sext.w	a5,a5
    80006ec0:	00078213          	mv	tp,a5
    80006ec4:	30200073          	mret
    80006ec8:	00813403          	ld	s0,8(sp)
    80006ecc:	01010113          	addi	sp,sp,16
    80006ed0:	00008067          	ret

0000000080006ed4 <timerinit>:
    80006ed4:	ff010113          	addi	sp,sp,-16
    80006ed8:	00813423          	sd	s0,8(sp)
    80006edc:	01010413          	addi	s0,sp,16
    80006ee0:	f14027f3          	csrr	a5,mhartid
    80006ee4:	0200c737          	lui	a4,0x200c
    80006ee8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006eec:	0007869b          	sext.w	a3,a5
    80006ef0:	00269713          	slli	a4,a3,0x2
    80006ef4:	000f4637          	lui	a2,0xf4
    80006ef8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006efc:	00d70733          	add	a4,a4,a3
    80006f00:	0037979b          	slliw	a5,a5,0x3
    80006f04:	020046b7          	lui	a3,0x2004
    80006f08:	00d787b3          	add	a5,a5,a3
    80006f0c:	00c585b3          	add	a1,a1,a2
    80006f10:	00371693          	slli	a3,a4,0x3
    80006f14:	00006717          	auipc	a4,0x6
    80006f18:	43c70713          	addi	a4,a4,1084 # 8000d350 <timer_scratch>
    80006f1c:	00b7b023          	sd	a1,0(a5)
    80006f20:	00d70733          	add	a4,a4,a3
    80006f24:	00f73c23          	sd	a5,24(a4)
    80006f28:	02c73023          	sd	a2,32(a4)
    80006f2c:	34071073          	csrw	mscratch,a4
    80006f30:	00000797          	auipc	a5,0x0
    80006f34:	65078793          	addi	a5,a5,1616 # 80007580 <timervec>
    80006f38:	30579073          	csrw	mtvec,a5
    80006f3c:	300027f3          	csrr	a5,mstatus
    80006f40:	0087e793          	ori	a5,a5,8
    80006f44:	30079073          	csrw	mstatus,a5
    80006f48:	304027f3          	csrr	a5,mie
    80006f4c:	0807e793          	ori	a5,a5,128
    80006f50:	30479073          	csrw	mie,a5
    80006f54:	00813403          	ld	s0,8(sp)
    80006f58:	01010113          	addi	sp,sp,16
    80006f5c:	00008067          	ret

0000000080006f60 <system_main>:
    80006f60:	fe010113          	addi	sp,sp,-32
    80006f64:	00813823          	sd	s0,16(sp)
    80006f68:	00913423          	sd	s1,8(sp)
    80006f6c:	00113c23          	sd	ra,24(sp)
    80006f70:	02010413          	addi	s0,sp,32
    80006f74:	00000097          	auipc	ra,0x0
    80006f78:	0c4080e7          	jalr	196(ra) # 80007038 <cpuid>
    80006f7c:	00005497          	auipc	s1,0x5
    80006f80:	ad448493          	addi	s1,s1,-1324 # 8000ba50 <started>
    80006f84:	02050263          	beqz	a0,80006fa8 <system_main+0x48>
    80006f88:	0004a783          	lw	a5,0(s1)
    80006f8c:	0007879b          	sext.w	a5,a5
    80006f90:	fe078ce3          	beqz	a5,80006f88 <system_main+0x28>
    80006f94:	0ff0000f          	fence
    80006f98:	00002517          	auipc	a0,0x2
    80006f9c:	61850513          	addi	a0,a0,1560 # 800095b0 <CONSOLE_STATUS+0x5a0>
    80006fa0:	00001097          	auipc	ra,0x1
    80006fa4:	a7c080e7          	jalr	-1412(ra) # 80007a1c <panic>
    80006fa8:	00001097          	auipc	ra,0x1
    80006fac:	9d0080e7          	jalr	-1584(ra) # 80007978 <consoleinit>
    80006fb0:	00001097          	auipc	ra,0x1
    80006fb4:	15c080e7          	jalr	348(ra) # 8000810c <printfinit>
    80006fb8:	00002517          	auipc	a0,0x2
    80006fbc:	1e050513          	addi	a0,a0,480 # 80009198 <CONSOLE_STATUS+0x188>
    80006fc0:	00001097          	auipc	ra,0x1
    80006fc4:	ab8080e7          	jalr	-1352(ra) # 80007a78 <__printf>
    80006fc8:	00002517          	auipc	a0,0x2
    80006fcc:	5b850513          	addi	a0,a0,1464 # 80009580 <CONSOLE_STATUS+0x570>
    80006fd0:	00001097          	auipc	ra,0x1
    80006fd4:	aa8080e7          	jalr	-1368(ra) # 80007a78 <__printf>
    80006fd8:	00002517          	auipc	a0,0x2
    80006fdc:	1c050513          	addi	a0,a0,448 # 80009198 <CONSOLE_STATUS+0x188>
    80006fe0:	00001097          	auipc	ra,0x1
    80006fe4:	a98080e7          	jalr	-1384(ra) # 80007a78 <__printf>
    80006fe8:	00001097          	auipc	ra,0x1
    80006fec:	4b0080e7          	jalr	1200(ra) # 80008498 <kinit>
    80006ff0:	00000097          	auipc	ra,0x0
    80006ff4:	148080e7          	jalr	328(ra) # 80007138 <trapinit>
    80006ff8:	00000097          	auipc	ra,0x0
    80006ffc:	16c080e7          	jalr	364(ra) # 80007164 <trapinithart>
    80007000:	00000097          	auipc	ra,0x0
    80007004:	5c0080e7          	jalr	1472(ra) # 800075c0 <plicinit>
    80007008:	00000097          	auipc	ra,0x0
    8000700c:	5e0080e7          	jalr	1504(ra) # 800075e8 <plicinithart>
    80007010:	00000097          	auipc	ra,0x0
    80007014:	078080e7          	jalr	120(ra) # 80007088 <userinit>
    80007018:	0ff0000f          	fence
    8000701c:	00100793          	li	a5,1
    80007020:	00002517          	auipc	a0,0x2
    80007024:	57850513          	addi	a0,a0,1400 # 80009598 <CONSOLE_STATUS+0x588>
    80007028:	00f4a023          	sw	a5,0(s1)
    8000702c:	00001097          	auipc	ra,0x1
    80007030:	a4c080e7          	jalr	-1460(ra) # 80007a78 <__printf>
    80007034:	0000006f          	j	80007034 <system_main+0xd4>

0000000080007038 <cpuid>:
    80007038:	ff010113          	addi	sp,sp,-16
    8000703c:	00813423          	sd	s0,8(sp)
    80007040:	01010413          	addi	s0,sp,16
    80007044:	00020513          	mv	a0,tp
    80007048:	00813403          	ld	s0,8(sp)
    8000704c:	0005051b          	sext.w	a0,a0
    80007050:	01010113          	addi	sp,sp,16
    80007054:	00008067          	ret

0000000080007058 <mycpu>:
    80007058:	ff010113          	addi	sp,sp,-16
    8000705c:	00813423          	sd	s0,8(sp)
    80007060:	01010413          	addi	s0,sp,16
    80007064:	00020793          	mv	a5,tp
    80007068:	00813403          	ld	s0,8(sp)
    8000706c:	0007879b          	sext.w	a5,a5
    80007070:	00779793          	slli	a5,a5,0x7
    80007074:	00007517          	auipc	a0,0x7
    80007078:	30c50513          	addi	a0,a0,780 # 8000e380 <cpus>
    8000707c:	00f50533          	add	a0,a0,a5
    80007080:	01010113          	addi	sp,sp,16
    80007084:	00008067          	ret

0000000080007088 <userinit>:
    80007088:	ff010113          	addi	sp,sp,-16
    8000708c:	00813423          	sd	s0,8(sp)
    80007090:	01010413          	addi	s0,sp,16
    80007094:	00813403          	ld	s0,8(sp)
    80007098:	01010113          	addi	sp,sp,16
    8000709c:	ffffc317          	auipc	t1,0xffffc
    800070a0:	86430067          	jr	-1948(t1) # 80002900 <main>

00000000800070a4 <either_copyout>:
    800070a4:	ff010113          	addi	sp,sp,-16
    800070a8:	00813023          	sd	s0,0(sp)
    800070ac:	00113423          	sd	ra,8(sp)
    800070b0:	01010413          	addi	s0,sp,16
    800070b4:	02051663          	bnez	a0,800070e0 <either_copyout+0x3c>
    800070b8:	00058513          	mv	a0,a1
    800070bc:	00060593          	mv	a1,a2
    800070c0:	0006861b          	sext.w	a2,a3
    800070c4:	00002097          	auipc	ra,0x2
    800070c8:	c60080e7          	jalr	-928(ra) # 80008d24 <__memmove>
    800070cc:	00813083          	ld	ra,8(sp)
    800070d0:	00013403          	ld	s0,0(sp)
    800070d4:	00000513          	li	a0,0
    800070d8:	01010113          	addi	sp,sp,16
    800070dc:	00008067          	ret
    800070e0:	00002517          	auipc	a0,0x2
    800070e4:	4f850513          	addi	a0,a0,1272 # 800095d8 <CONSOLE_STATUS+0x5c8>
    800070e8:	00001097          	auipc	ra,0x1
    800070ec:	934080e7          	jalr	-1740(ra) # 80007a1c <panic>

00000000800070f0 <either_copyin>:
    800070f0:	ff010113          	addi	sp,sp,-16
    800070f4:	00813023          	sd	s0,0(sp)
    800070f8:	00113423          	sd	ra,8(sp)
    800070fc:	01010413          	addi	s0,sp,16
    80007100:	02059463          	bnez	a1,80007128 <either_copyin+0x38>
    80007104:	00060593          	mv	a1,a2
    80007108:	0006861b          	sext.w	a2,a3
    8000710c:	00002097          	auipc	ra,0x2
    80007110:	c18080e7          	jalr	-1000(ra) # 80008d24 <__memmove>
    80007114:	00813083          	ld	ra,8(sp)
    80007118:	00013403          	ld	s0,0(sp)
    8000711c:	00000513          	li	a0,0
    80007120:	01010113          	addi	sp,sp,16
    80007124:	00008067          	ret
    80007128:	00002517          	auipc	a0,0x2
    8000712c:	4d850513          	addi	a0,a0,1240 # 80009600 <CONSOLE_STATUS+0x5f0>
    80007130:	00001097          	auipc	ra,0x1
    80007134:	8ec080e7          	jalr	-1812(ra) # 80007a1c <panic>

0000000080007138 <trapinit>:
    80007138:	ff010113          	addi	sp,sp,-16
    8000713c:	00813423          	sd	s0,8(sp)
    80007140:	01010413          	addi	s0,sp,16
    80007144:	00813403          	ld	s0,8(sp)
    80007148:	00002597          	auipc	a1,0x2
    8000714c:	4e058593          	addi	a1,a1,1248 # 80009628 <CONSOLE_STATUS+0x618>
    80007150:	00007517          	auipc	a0,0x7
    80007154:	2b050513          	addi	a0,a0,688 # 8000e400 <tickslock>
    80007158:	01010113          	addi	sp,sp,16
    8000715c:	00001317          	auipc	t1,0x1
    80007160:	5cc30067          	jr	1484(t1) # 80008728 <initlock>

0000000080007164 <trapinithart>:
    80007164:	ff010113          	addi	sp,sp,-16
    80007168:	00813423          	sd	s0,8(sp)
    8000716c:	01010413          	addi	s0,sp,16
    80007170:	00000797          	auipc	a5,0x0
    80007174:	30078793          	addi	a5,a5,768 # 80007470 <kernelvec>
    80007178:	10579073          	csrw	stvec,a5
    8000717c:	00813403          	ld	s0,8(sp)
    80007180:	01010113          	addi	sp,sp,16
    80007184:	00008067          	ret

0000000080007188 <usertrap>:
    80007188:	ff010113          	addi	sp,sp,-16
    8000718c:	00813423          	sd	s0,8(sp)
    80007190:	01010413          	addi	s0,sp,16
    80007194:	00813403          	ld	s0,8(sp)
    80007198:	01010113          	addi	sp,sp,16
    8000719c:	00008067          	ret

00000000800071a0 <usertrapret>:
    800071a0:	ff010113          	addi	sp,sp,-16
    800071a4:	00813423          	sd	s0,8(sp)
    800071a8:	01010413          	addi	s0,sp,16
    800071ac:	00813403          	ld	s0,8(sp)
    800071b0:	01010113          	addi	sp,sp,16
    800071b4:	00008067          	ret

00000000800071b8 <kerneltrap>:
    800071b8:	fe010113          	addi	sp,sp,-32
    800071bc:	00813823          	sd	s0,16(sp)
    800071c0:	00113c23          	sd	ra,24(sp)
    800071c4:	00913423          	sd	s1,8(sp)
    800071c8:	02010413          	addi	s0,sp,32
    800071cc:	142025f3          	csrr	a1,scause
    800071d0:	100027f3          	csrr	a5,sstatus
    800071d4:	0027f793          	andi	a5,a5,2
    800071d8:	10079c63          	bnez	a5,800072f0 <kerneltrap+0x138>
    800071dc:	142027f3          	csrr	a5,scause
    800071e0:	0207ce63          	bltz	a5,8000721c <kerneltrap+0x64>
    800071e4:	00002517          	auipc	a0,0x2
    800071e8:	48c50513          	addi	a0,a0,1164 # 80009670 <CONSOLE_STATUS+0x660>
    800071ec:	00001097          	auipc	ra,0x1
    800071f0:	88c080e7          	jalr	-1908(ra) # 80007a78 <__printf>
    800071f4:	141025f3          	csrr	a1,sepc
    800071f8:	14302673          	csrr	a2,stval
    800071fc:	00002517          	auipc	a0,0x2
    80007200:	48450513          	addi	a0,a0,1156 # 80009680 <CONSOLE_STATUS+0x670>
    80007204:	00001097          	auipc	ra,0x1
    80007208:	874080e7          	jalr	-1932(ra) # 80007a78 <__printf>
    8000720c:	00002517          	auipc	a0,0x2
    80007210:	48c50513          	addi	a0,a0,1164 # 80009698 <CONSOLE_STATUS+0x688>
    80007214:	00001097          	auipc	ra,0x1
    80007218:	808080e7          	jalr	-2040(ra) # 80007a1c <panic>
    8000721c:	0ff7f713          	andi	a4,a5,255
    80007220:	00900693          	li	a3,9
    80007224:	04d70063          	beq	a4,a3,80007264 <kerneltrap+0xac>
    80007228:	fff00713          	li	a4,-1
    8000722c:	03f71713          	slli	a4,a4,0x3f
    80007230:	00170713          	addi	a4,a4,1
    80007234:	fae798e3          	bne	a5,a4,800071e4 <kerneltrap+0x2c>
    80007238:	00000097          	auipc	ra,0x0
    8000723c:	e00080e7          	jalr	-512(ra) # 80007038 <cpuid>
    80007240:	06050663          	beqz	a0,800072ac <kerneltrap+0xf4>
    80007244:	144027f3          	csrr	a5,sip
    80007248:	ffd7f793          	andi	a5,a5,-3
    8000724c:	14479073          	csrw	sip,a5
    80007250:	01813083          	ld	ra,24(sp)
    80007254:	01013403          	ld	s0,16(sp)
    80007258:	00813483          	ld	s1,8(sp)
    8000725c:	02010113          	addi	sp,sp,32
    80007260:	00008067          	ret
    80007264:	00000097          	auipc	ra,0x0
    80007268:	3d0080e7          	jalr	976(ra) # 80007634 <plic_claim>
    8000726c:	00a00793          	li	a5,10
    80007270:	00050493          	mv	s1,a0
    80007274:	06f50863          	beq	a0,a5,800072e4 <kerneltrap+0x12c>
    80007278:	fc050ce3          	beqz	a0,80007250 <kerneltrap+0x98>
    8000727c:	00050593          	mv	a1,a0
    80007280:	00002517          	auipc	a0,0x2
    80007284:	3d050513          	addi	a0,a0,976 # 80009650 <CONSOLE_STATUS+0x640>
    80007288:	00000097          	auipc	ra,0x0
    8000728c:	7f0080e7          	jalr	2032(ra) # 80007a78 <__printf>
    80007290:	01013403          	ld	s0,16(sp)
    80007294:	01813083          	ld	ra,24(sp)
    80007298:	00048513          	mv	a0,s1
    8000729c:	00813483          	ld	s1,8(sp)
    800072a0:	02010113          	addi	sp,sp,32
    800072a4:	00000317          	auipc	t1,0x0
    800072a8:	3c830067          	jr	968(t1) # 8000766c <plic_complete>
    800072ac:	00007517          	auipc	a0,0x7
    800072b0:	15450513          	addi	a0,a0,340 # 8000e400 <tickslock>
    800072b4:	00001097          	auipc	ra,0x1
    800072b8:	498080e7          	jalr	1176(ra) # 8000874c <acquire>
    800072bc:	00004717          	auipc	a4,0x4
    800072c0:	79870713          	addi	a4,a4,1944 # 8000ba54 <ticks>
    800072c4:	00072783          	lw	a5,0(a4)
    800072c8:	00007517          	auipc	a0,0x7
    800072cc:	13850513          	addi	a0,a0,312 # 8000e400 <tickslock>
    800072d0:	0017879b          	addiw	a5,a5,1
    800072d4:	00f72023          	sw	a5,0(a4)
    800072d8:	00001097          	auipc	ra,0x1
    800072dc:	540080e7          	jalr	1344(ra) # 80008818 <release>
    800072e0:	f65ff06f          	j	80007244 <kerneltrap+0x8c>
    800072e4:	00001097          	auipc	ra,0x1
    800072e8:	09c080e7          	jalr	156(ra) # 80008380 <uartintr>
    800072ec:	fa5ff06f          	j	80007290 <kerneltrap+0xd8>
    800072f0:	00002517          	auipc	a0,0x2
    800072f4:	34050513          	addi	a0,a0,832 # 80009630 <CONSOLE_STATUS+0x620>
    800072f8:	00000097          	auipc	ra,0x0
    800072fc:	724080e7          	jalr	1828(ra) # 80007a1c <panic>

0000000080007300 <clockintr>:
    80007300:	fe010113          	addi	sp,sp,-32
    80007304:	00813823          	sd	s0,16(sp)
    80007308:	00913423          	sd	s1,8(sp)
    8000730c:	00113c23          	sd	ra,24(sp)
    80007310:	02010413          	addi	s0,sp,32
    80007314:	00007497          	auipc	s1,0x7
    80007318:	0ec48493          	addi	s1,s1,236 # 8000e400 <tickslock>
    8000731c:	00048513          	mv	a0,s1
    80007320:	00001097          	auipc	ra,0x1
    80007324:	42c080e7          	jalr	1068(ra) # 8000874c <acquire>
    80007328:	00004717          	auipc	a4,0x4
    8000732c:	72c70713          	addi	a4,a4,1836 # 8000ba54 <ticks>
    80007330:	00072783          	lw	a5,0(a4)
    80007334:	01013403          	ld	s0,16(sp)
    80007338:	01813083          	ld	ra,24(sp)
    8000733c:	00048513          	mv	a0,s1
    80007340:	0017879b          	addiw	a5,a5,1
    80007344:	00813483          	ld	s1,8(sp)
    80007348:	00f72023          	sw	a5,0(a4)
    8000734c:	02010113          	addi	sp,sp,32
    80007350:	00001317          	auipc	t1,0x1
    80007354:	4c830067          	jr	1224(t1) # 80008818 <release>

0000000080007358 <devintr>:
    80007358:	142027f3          	csrr	a5,scause
    8000735c:	00000513          	li	a0,0
    80007360:	0007c463          	bltz	a5,80007368 <devintr+0x10>
    80007364:	00008067          	ret
    80007368:	fe010113          	addi	sp,sp,-32
    8000736c:	00813823          	sd	s0,16(sp)
    80007370:	00113c23          	sd	ra,24(sp)
    80007374:	00913423          	sd	s1,8(sp)
    80007378:	02010413          	addi	s0,sp,32
    8000737c:	0ff7f713          	andi	a4,a5,255
    80007380:	00900693          	li	a3,9
    80007384:	04d70c63          	beq	a4,a3,800073dc <devintr+0x84>
    80007388:	fff00713          	li	a4,-1
    8000738c:	03f71713          	slli	a4,a4,0x3f
    80007390:	00170713          	addi	a4,a4,1
    80007394:	00e78c63          	beq	a5,a4,800073ac <devintr+0x54>
    80007398:	01813083          	ld	ra,24(sp)
    8000739c:	01013403          	ld	s0,16(sp)
    800073a0:	00813483          	ld	s1,8(sp)
    800073a4:	02010113          	addi	sp,sp,32
    800073a8:	00008067          	ret
    800073ac:	00000097          	auipc	ra,0x0
    800073b0:	c8c080e7          	jalr	-884(ra) # 80007038 <cpuid>
    800073b4:	06050663          	beqz	a0,80007420 <devintr+0xc8>
    800073b8:	144027f3          	csrr	a5,sip
    800073bc:	ffd7f793          	andi	a5,a5,-3
    800073c0:	14479073          	csrw	sip,a5
    800073c4:	01813083          	ld	ra,24(sp)
    800073c8:	01013403          	ld	s0,16(sp)
    800073cc:	00813483          	ld	s1,8(sp)
    800073d0:	00200513          	li	a0,2
    800073d4:	02010113          	addi	sp,sp,32
    800073d8:	00008067          	ret
    800073dc:	00000097          	auipc	ra,0x0
    800073e0:	258080e7          	jalr	600(ra) # 80007634 <plic_claim>
    800073e4:	00a00793          	li	a5,10
    800073e8:	00050493          	mv	s1,a0
    800073ec:	06f50663          	beq	a0,a5,80007458 <devintr+0x100>
    800073f0:	00100513          	li	a0,1
    800073f4:	fa0482e3          	beqz	s1,80007398 <devintr+0x40>
    800073f8:	00048593          	mv	a1,s1
    800073fc:	00002517          	auipc	a0,0x2
    80007400:	25450513          	addi	a0,a0,596 # 80009650 <CONSOLE_STATUS+0x640>
    80007404:	00000097          	auipc	ra,0x0
    80007408:	674080e7          	jalr	1652(ra) # 80007a78 <__printf>
    8000740c:	00048513          	mv	a0,s1
    80007410:	00000097          	auipc	ra,0x0
    80007414:	25c080e7          	jalr	604(ra) # 8000766c <plic_complete>
    80007418:	00100513          	li	a0,1
    8000741c:	f7dff06f          	j	80007398 <devintr+0x40>
    80007420:	00007517          	auipc	a0,0x7
    80007424:	fe050513          	addi	a0,a0,-32 # 8000e400 <tickslock>
    80007428:	00001097          	auipc	ra,0x1
    8000742c:	324080e7          	jalr	804(ra) # 8000874c <acquire>
    80007430:	00004717          	auipc	a4,0x4
    80007434:	62470713          	addi	a4,a4,1572 # 8000ba54 <ticks>
    80007438:	00072783          	lw	a5,0(a4)
    8000743c:	00007517          	auipc	a0,0x7
    80007440:	fc450513          	addi	a0,a0,-60 # 8000e400 <tickslock>
    80007444:	0017879b          	addiw	a5,a5,1
    80007448:	00f72023          	sw	a5,0(a4)
    8000744c:	00001097          	auipc	ra,0x1
    80007450:	3cc080e7          	jalr	972(ra) # 80008818 <release>
    80007454:	f65ff06f          	j	800073b8 <devintr+0x60>
    80007458:	00001097          	auipc	ra,0x1
    8000745c:	f28080e7          	jalr	-216(ra) # 80008380 <uartintr>
    80007460:	fadff06f          	j	8000740c <devintr+0xb4>
	...

0000000080007470 <kernelvec>:
    80007470:	f0010113          	addi	sp,sp,-256
    80007474:	00113023          	sd	ra,0(sp)
    80007478:	00213423          	sd	sp,8(sp)
    8000747c:	00313823          	sd	gp,16(sp)
    80007480:	00413c23          	sd	tp,24(sp)
    80007484:	02513023          	sd	t0,32(sp)
    80007488:	02613423          	sd	t1,40(sp)
    8000748c:	02713823          	sd	t2,48(sp)
    80007490:	02813c23          	sd	s0,56(sp)
    80007494:	04913023          	sd	s1,64(sp)
    80007498:	04a13423          	sd	a0,72(sp)
    8000749c:	04b13823          	sd	a1,80(sp)
    800074a0:	04c13c23          	sd	a2,88(sp)
    800074a4:	06d13023          	sd	a3,96(sp)
    800074a8:	06e13423          	sd	a4,104(sp)
    800074ac:	06f13823          	sd	a5,112(sp)
    800074b0:	07013c23          	sd	a6,120(sp)
    800074b4:	09113023          	sd	a7,128(sp)
    800074b8:	09213423          	sd	s2,136(sp)
    800074bc:	09313823          	sd	s3,144(sp)
    800074c0:	09413c23          	sd	s4,152(sp)
    800074c4:	0b513023          	sd	s5,160(sp)
    800074c8:	0b613423          	sd	s6,168(sp)
    800074cc:	0b713823          	sd	s7,176(sp)
    800074d0:	0b813c23          	sd	s8,184(sp)
    800074d4:	0d913023          	sd	s9,192(sp)
    800074d8:	0da13423          	sd	s10,200(sp)
    800074dc:	0db13823          	sd	s11,208(sp)
    800074e0:	0dc13c23          	sd	t3,216(sp)
    800074e4:	0fd13023          	sd	t4,224(sp)
    800074e8:	0fe13423          	sd	t5,232(sp)
    800074ec:	0ff13823          	sd	t6,240(sp)
    800074f0:	cc9ff0ef          	jal	ra,800071b8 <kerneltrap>
    800074f4:	00013083          	ld	ra,0(sp)
    800074f8:	00813103          	ld	sp,8(sp)
    800074fc:	01013183          	ld	gp,16(sp)
    80007500:	02013283          	ld	t0,32(sp)
    80007504:	02813303          	ld	t1,40(sp)
    80007508:	03013383          	ld	t2,48(sp)
    8000750c:	03813403          	ld	s0,56(sp)
    80007510:	04013483          	ld	s1,64(sp)
    80007514:	04813503          	ld	a0,72(sp)
    80007518:	05013583          	ld	a1,80(sp)
    8000751c:	05813603          	ld	a2,88(sp)
    80007520:	06013683          	ld	a3,96(sp)
    80007524:	06813703          	ld	a4,104(sp)
    80007528:	07013783          	ld	a5,112(sp)
    8000752c:	07813803          	ld	a6,120(sp)
    80007530:	08013883          	ld	a7,128(sp)
    80007534:	08813903          	ld	s2,136(sp)
    80007538:	09013983          	ld	s3,144(sp)
    8000753c:	09813a03          	ld	s4,152(sp)
    80007540:	0a013a83          	ld	s5,160(sp)
    80007544:	0a813b03          	ld	s6,168(sp)
    80007548:	0b013b83          	ld	s7,176(sp)
    8000754c:	0b813c03          	ld	s8,184(sp)
    80007550:	0c013c83          	ld	s9,192(sp)
    80007554:	0c813d03          	ld	s10,200(sp)
    80007558:	0d013d83          	ld	s11,208(sp)
    8000755c:	0d813e03          	ld	t3,216(sp)
    80007560:	0e013e83          	ld	t4,224(sp)
    80007564:	0e813f03          	ld	t5,232(sp)
    80007568:	0f013f83          	ld	t6,240(sp)
    8000756c:	10010113          	addi	sp,sp,256
    80007570:	10200073          	sret
    80007574:	00000013          	nop
    80007578:	00000013          	nop
    8000757c:	00000013          	nop

0000000080007580 <timervec>:
    80007580:	34051573          	csrrw	a0,mscratch,a0
    80007584:	00b53023          	sd	a1,0(a0)
    80007588:	00c53423          	sd	a2,8(a0)
    8000758c:	00d53823          	sd	a3,16(a0)
    80007590:	01853583          	ld	a1,24(a0)
    80007594:	02053603          	ld	a2,32(a0)
    80007598:	0005b683          	ld	a3,0(a1)
    8000759c:	00c686b3          	add	a3,a3,a2
    800075a0:	00d5b023          	sd	a3,0(a1)
    800075a4:	00200593          	li	a1,2
    800075a8:	14459073          	csrw	sip,a1
    800075ac:	01053683          	ld	a3,16(a0)
    800075b0:	00853603          	ld	a2,8(a0)
    800075b4:	00053583          	ld	a1,0(a0)
    800075b8:	34051573          	csrrw	a0,mscratch,a0
    800075bc:	30200073          	mret

00000000800075c0 <plicinit>:
    800075c0:	ff010113          	addi	sp,sp,-16
    800075c4:	00813423          	sd	s0,8(sp)
    800075c8:	01010413          	addi	s0,sp,16
    800075cc:	00813403          	ld	s0,8(sp)
    800075d0:	0c0007b7          	lui	a5,0xc000
    800075d4:	00100713          	li	a4,1
    800075d8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800075dc:	00e7a223          	sw	a4,4(a5)
    800075e0:	01010113          	addi	sp,sp,16
    800075e4:	00008067          	ret

00000000800075e8 <plicinithart>:
    800075e8:	ff010113          	addi	sp,sp,-16
    800075ec:	00813023          	sd	s0,0(sp)
    800075f0:	00113423          	sd	ra,8(sp)
    800075f4:	01010413          	addi	s0,sp,16
    800075f8:	00000097          	auipc	ra,0x0
    800075fc:	a40080e7          	jalr	-1472(ra) # 80007038 <cpuid>
    80007600:	0085171b          	slliw	a4,a0,0x8
    80007604:	0c0027b7          	lui	a5,0xc002
    80007608:	00e787b3          	add	a5,a5,a4
    8000760c:	40200713          	li	a4,1026
    80007610:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007614:	00813083          	ld	ra,8(sp)
    80007618:	00013403          	ld	s0,0(sp)
    8000761c:	00d5151b          	slliw	a0,a0,0xd
    80007620:	0c2017b7          	lui	a5,0xc201
    80007624:	00a78533          	add	a0,a5,a0
    80007628:	00052023          	sw	zero,0(a0)
    8000762c:	01010113          	addi	sp,sp,16
    80007630:	00008067          	ret

0000000080007634 <plic_claim>:
    80007634:	ff010113          	addi	sp,sp,-16
    80007638:	00813023          	sd	s0,0(sp)
    8000763c:	00113423          	sd	ra,8(sp)
    80007640:	01010413          	addi	s0,sp,16
    80007644:	00000097          	auipc	ra,0x0
    80007648:	9f4080e7          	jalr	-1548(ra) # 80007038 <cpuid>
    8000764c:	00813083          	ld	ra,8(sp)
    80007650:	00013403          	ld	s0,0(sp)
    80007654:	00d5151b          	slliw	a0,a0,0xd
    80007658:	0c2017b7          	lui	a5,0xc201
    8000765c:	00a78533          	add	a0,a5,a0
    80007660:	00452503          	lw	a0,4(a0)
    80007664:	01010113          	addi	sp,sp,16
    80007668:	00008067          	ret

000000008000766c <plic_complete>:
    8000766c:	fe010113          	addi	sp,sp,-32
    80007670:	00813823          	sd	s0,16(sp)
    80007674:	00913423          	sd	s1,8(sp)
    80007678:	00113c23          	sd	ra,24(sp)
    8000767c:	02010413          	addi	s0,sp,32
    80007680:	00050493          	mv	s1,a0
    80007684:	00000097          	auipc	ra,0x0
    80007688:	9b4080e7          	jalr	-1612(ra) # 80007038 <cpuid>
    8000768c:	01813083          	ld	ra,24(sp)
    80007690:	01013403          	ld	s0,16(sp)
    80007694:	00d5179b          	slliw	a5,a0,0xd
    80007698:	0c201737          	lui	a4,0xc201
    8000769c:	00f707b3          	add	a5,a4,a5
    800076a0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800076a4:	00813483          	ld	s1,8(sp)
    800076a8:	02010113          	addi	sp,sp,32
    800076ac:	00008067          	ret

00000000800076b0 <consolewrite>:
    800076b0:	fb010113          	addi	sp,sp,-80
    800076b4:	04813023          	sd	s0,64(sp)
    800076b8:	04113423          	sd	ra,72(sp)
    800076bc:	02913c23          	sd	s1,56(sp)
    800076c0:	03213823          	sd	s2,48(sp)
    800076c4:	03313423          	sd	s3,40(sp)
    800076c8:	03413023          	sd	s4,32(sp)
    800076cc:	01513c23          	sd	s5,24(sp)
    800076d0:	05010413          	addi	s0,sp,80
    800076d4:	06c05c63          	blez	a2,8000774c <consolewrite+0x9c>
    800076d8:	00060993          	mv	s3,a2
    800076dc:	00050a13          	mv	s4,a0
    800076e0:	00058493          	mv	s1,a1
    800076e4:	00000913          	li	s2,0
    800076e8:	fff00a93          	li	s5,-1
    800076ec:	01c0006f          	j	80007708 <consolewrite+0x58>
    800076f0:	fbf44503          	lbu	a0,-65(s0)
    800076f4:	0019091b          	addiw	s2,s2,1
    800076f8:	00148493          	addi	s1,s1,1
    800076fc:	00001097          	auipc	ra,0x1
    80007700:	a9c080e7          	jalr	-1380(ra) # 80008198 <uartputc>
    80007704:	03298063          	beq	s3,s2,80007724 <consolewrite+0x74>
    80007708:	00048613          	mv	a2,s1
    8000770c:	00100693          	li	a3,1
    80007710:	000a0593          	mv	a1,s4
    80007714:	fbf40513          	addi	a0,s0,-65
    80007718:	00000097          	auipc	ra,0x0
    8000771c:	9d8080e7          	jalr	-1576(ra) # 800070f0 <either_copyin>
    80007720:	fd5518e3          	bne	a0,s5,800076f0 <consolewrite+0x40>
    80007724:	04813083          	ld	ra,72(sp)
    80007728:	04013403          	ld	s0,64(sp)
    8000772c:	03813483          	ld	s1,56(sp)
    80007730:	02813983          	ld	s3,40(sp)
    80007734:	02013a03          	ld	s4,32(sp)
    80007738:	01813a83          	ld	s5,24(sp)
    8000773c:	00090513          	mv	a0,s2
    80007740:	03013903          	ld	s2,48(sp)
    80007744:	05010113          	addi	sp,sp,80
    80007748:	00008067          	ret
    8000774c:	00000913          	li	s2,0
    80007750:	fd5ff06f          	j	80007724 <consolewrite+0x74>

0000000080007754 <consoleread>:
    80007754:	f9010113          	addi	sp,sp,-112
    80007758:	06813023          	sd	s0,96(sp)
    8000775c:	04913c23          	sd	s1,88(sp)
    80007760:	05213823          	sd	s2,80(sp)
    80007764:	05313423          	sd	s3,72(sp)
    80007768:	05413023          	sd	s4,64(sp)
    8000776c:	03513c23          	sd	s5,56(sp)
    80007770:	03613823          	sd	s6,48(sp)
    80007774:	03713423          	sd	s7,40(sp)
    80007778:	03813023          	sd	s8,32(sp)
    8000777c:	06113423          	sd	ra,104(sp)
    80007780:	01913c23          	sd	s9,24(sp)
    80007784:	07010413          	addi	s0,sp,112
    80007788:	00060b93          	mv	s7,a2
    8000778c:	00050913          	mv	s2,a0
    80007790:	00058c13          	mv	s8,a1
    80007794:	00060b1b          	sext.w	s6,a2
    80007798:	00007497          	auipc	s1,0x7
    8000779c:	c9048493          	addi	s1,s1,-880 # 8000e428 <cons>
    800077a0:	00400993          	li	s3,4
    800077a4:	fff00a13          	li	s4,-1
    800077a8:	00a00a93          	li	s5,10
    800077ac:	05705e63          	blez	s7,80007808 <consoleread+0xb4>
    800077b0:	09c4a703          	lw	a4,156(s1)
    800077b4:	0984a783          	lw	a5,152(s1)
    800077b8:	0007071b          	sext.w	a4,a4
    800077bc:	08e78463          	beq	a5,a4,80007844 <consoleread+0xf0>
    800077c0:	07f7f713          	andi	a4,a5,127
    800077c4:	00e48733          	add	a4,s1,a4
    800077c8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800077cc:	0017869b          	addiw	a3,a5,1
    800077d0:	08d4ac23          	sw	a3,152(s1)
    800077d4:	00070c9b          	sext.w	s9,a4
    800077d8:	0b370663          	beq	a4,s3,80007884 <consoleread+0x130>
    800077dc:	00100693          	li	a3,1
    800077e0:	f9f40613          	addi	a2,s0,-97
    800077e4:	000c0593          	mv	a1,s8
    800077e8:	00090513          	mv	a0,s2
    800077ec:	f8e40fa3          	sb	a4,-97(s0)
    800077f0:	00000097          	auipc	ra,0x0
    800077f4:	8b4080e7          	jalr	-1868(ra) # 800070a4 <either_copyout>
    800077f8:	01450863          	beq	a0,s4,80007808 <consoleread+0xb4>
    800077fc:	001c0c13          	addi	s8,s8,1
    80007800:	fffb8b9b          	addiw	s7,s7,-1
    80007804:	fb5c94e3          	bne	s9,s5,800077ac <consoleread+0x58>
    80007808:	000b851b          	sext.w	a0,s7
    8000780c:	06813083          	ld	ra,104(sp)
    80007810:	06013403          	ld	s0,96(sp)
    80007814:	05813483          	ld	s1,88(sp)
    80007818:	05013903          	ld	s2,80(sp)
    8000781c:	04813983          	ld	s3,72(sp)
    80007820:	04013a03          	ld	s4,64(sp)
    80007824:	03813a83          	ld	s5,56(sp)
    80007828:	02813b83          	ld	s7,40(sp)
    8000782c:	02013c03          	ld	s8,32(sp)
    80007830:	01813c83          	ld	s9,24(sp)
    80007834:	40ab053b          	subw	a0,s6,a0
    80007838:	03013b03          	ld	s6,48(sp)
    8000783c:	07010113          	addi	sp,sp,112
    80007840:	00008067          	ret
    80007844:	00001097          	auipc	ra,0x1
    80007848:	1d8080e7          	jalr	472(ra) # 80008a1c <push_on>
    8000784c:	0984a703          	lw	a4,152(s1)
    80007850:	09c4a783          	lw	a5,156(s1)
    80007854:	0007879b          	sext.w	a5,a5
    80007858:	fef70ce3          	beq	a4,a5,80007850 <consoleread+0xfc>
    8000785c:	00001097          	auipc	ra,0x1
    80007860:	234080e7          	jalr	564(ra) # 80008a90 <pop_on>
    80007864:	0984a783          	lw	a5,152(s1)
    80007868:	07f7f713          	andi	a4,a5,127
    8000786c:	00e48733          	add	a4,s1,a4
    80007870:	01874703          	lbu	a4,24(a4)
    80007874:	0017869b          	addiw	a3,a5,1
    80007878:	08d4ac23          	sw	a3,152(s1)
    8000787c:	00070c9b          	sext.w	s9,a4
    80007880:	f5371ee3          	bne	a4,s3,800077dc <consoleread+0x88>
    80007884:	000b851b          	sext.w	a0,s7
    80007888:	f96bf2e3          	bgeu	s7,s6,8000780c <consoleread+0xb8>
    8000788c:	08f4ac23          	sw	a5,152(s1)
    80007890:	f7dff06f          	j	8000780c <consoleread+0xb8>

0000000080007894 <consputc>:
    80007894:	10000793          	li	a5,256
    80007898:	00f50663          	beq	a0,a5,800078a4 <consputc+0x10>
    8000789c:	00001317          	auipc	t1,0x1
    800078a0:	9f430067          	jr	-1548(t1) # 80008290 <uartputc_sync>
    800078a4:	ff010113          	addi	sp,sp,-16
    800078a8:	00113423          	sd	ra,8(sp)
    800078ac:	00813023          	sd	s0,0(sp)
    800078b0:	01010413          	addi	s0,sp,16
    800078b4:	00800513          	li	a0,8
    800078b8:	00001097          	auipc	ra,0x1
    800078bc:	9d8080e7          	jalr	-1576(ra) # 80008290 <uartputc_sync>
    800078c0:	02000513          	li	a0,32
    800078c4:	00001097          	auipc	ra,0x1
    800078c8:	9cc080e7          	jalr	-1588(ra) # 80008290 <uartputc_sync>
    800078cc:	00013403          	ld	s0,0(sp)
    800078d0:	00813083          	ld	ra,8(sp)
    800078d4:	00800513          	li	a0,8
    800078d8:	01010113          	addi	sp,sp,16
    800078dc:	00001317          	auipc	t1,0x1
    800078e0:	9b430067          	jr	-1612(t1) # 80008290 <uartputc_sync>

00000000800078e4 <consoleintr>:
    800078e4:	fe010113          	addi	sp,sp,-32
    800078e8:	00813823          	sd	s0,16(sp)
    800078ec:	00913423          	sd	s1,8(sp)
    800078f0:	01213023          	sd	s2,0(sp)
    800078f4:	00113c23          	sd	ra,24(sp)
    800078f8:	02010413          	addi	s0,sp,32
    800078fc:	00007917          	auipc	s2,0x7
    80007900:	b2c90913          	addi	s2,s2,-1236 # 8000e428 <cons>
    80007904:	00050493          	mv	s1,a0
    80007908:	00090513          	mv	a0,s2
    8000790c:	00001097          	auipc	ra,0x1
    80007910:	e40080e7          	jalr	-448(ra) # 8000874c <acquire>
    80007914:	02048c63          	beqz	s1,8000794c <consoleintr+0x68>
    80007918:	0a092783          	lw	a5,160(s2)
    8000791c:	09892703          	lw	a4,152(s2)
    80007920:	07f00693          	li	a3,127
    80007924:	40e7873b          	subw	a4,a5,a4
    80007928:	02e6e263          	bltu	a3,a4,8000794c <consoleintr+0x68>
    8000792c:	00d00713          	li	a4,13
    80007930:	04e48063          	beq	s1,a4,80007970 <consoleintr+0x8c>
    80007934:	07f7f713          	andi	a4,a5,127
    80007938:	00e90733          	add	a4,s2,a4
    8000793c:	0017879b          	addiw	a5,a5,1
    80007940:	0af92023          	sw	a5,160(s2)
    80007944:	00970c23          	sb	s1,24(a4)
    80007948:	08f92e23          	sw	a5,156(s2)
    8000794c:	01013403          	ld	s0,16(sp)
    80007950:	01813083          	ld	ra,24(sp)
    80007954:	00813483          	ld	s1,8(sp)
    80007958:	00013903          	ld	s2,0(sp)
    8000795c:	00007517          	auipc	a0,0x7
    80007960:	acc50513          	addi	a0,a0,-1332 # 8000e428 <cons>
    80007964:	02010113          	addi	sp,sp,32
    80007968:	00001317          	auipc	t1,0x1
    8000796c:	eb030067          	jr	-336(t1) # 80008818 <release>
    80007970:	00a00493          	li	s1,10
    80007974:	fc1ff06f          	j	80007934 <consoleintr+0x50>

0000000080007978 <consoleinit>:
    80007978:	fe010113          	addi	sp,sp,-32
    8000797c:	00113c23          	sd	ra,24(sp)
    80007980:	00813823          	sd	s0,16(sp)
    80007984:	00913423          	sd	s1,8(sp)
    80007988:	02010413          	addi	s0,sp,32
    8000798c:	00007497          	auipc	s1,0x7
    80007990:	a9c48493          	addi	s1,s1,-1380 # 8000e428 <cons>
    80007994:	00048513          	mv	a0,s1
    80007998:	00002597          	auipc	a1,0x2
    8000799c:	d1058593          	addi	a1,a1,-752 # 800096a8 <CONSOLE_STATUS+0x698>
    800079a0:	00001097          	auipc	ra,0x1
    800079a4:	d88080e7          	jalr	-632(ra) # 80008728 <initlock>
    800079a8:	00000097          	auipc	ra,0x0
    800079ac:	7ac080e7          	jalr	1964(ra) # 80008154 <uartinit>
    800079b0:	01813083          	ld	ra,24(sp)
    800079b4:	01013403          	ld	s0,16(sp)
    800079b8:	00000797          	auipc	a5,0x0
    800079bc:	d9c78793          	addi	a5,a5,-612 # 80007754 <consoleread>
    800079c0:	0af4bc23          	sd	a5,184(s1)
    800079c4:	00000797          	auipc	a5,0x0
    800079c8:	cec78793          	addi	a5,a5,-788 # 800076b0 <consolewrite>
    800079cc:	0cf4b023          	sd	a5,192(s1)
    800079d0:	00813483          	ld	s1,8(sp)
    800079d4:	02010113          	addi	sp,sp,32
    800079d8:	00008067          	ret

00000000800079dc <console_read>:
    800079dc:	ff010113          	addi	sp,sp,-16
    800079e0:	00813423          	sd	s0,8(sp)
    800079e4:	01010413          	addi	s0,sp,16
    800079e8:	00813403          	ld	s0,8(sp)
    800079ec:	00007317          	auipc	t1,0x7
    800079f0:	af433303          	ld	t1,-1292(t1) # 8000e4e0 <devsw+0x10>
    800079f4:	01010113          	addi	sp,sp,16
    800079f8:	00030067          	jr	t1

00000000800079fc <console_write>:
    800079fc:	ff010113          	addi	sp,sp,-16
    80007a00:	00813423          	sd	s0,8(sp)
    80007a04:	01010413          	addi	s0,sp,16
    80007a08:	00813403          	ld	s0,8(sp)
    80007a0c:	00007317          	auipc	t1,0x7
    80007a10:	adc33303          	ld	t1,-1316(t1) # 8000e4e8 <devsw+0x18>
    80007a14:	01010113          	addi	sp,sp,16
    80007a18:	00030067          	jr	t1

0000000080007a1c <panic>:
    80007a1c:	fe010113          	addi	sp,sp,-32
    80007a20:	00113c23          	sd	ra,24(sp)
    80007a24:	00813823          	sd	s0,16(sp)
    80007a28:	00913423          	sd	s1,8(sp)
    80007a2c:	02010413          	addi	s0,sp,32
    80007a30:	00050493          	mv	s1,a0
    80007a34:	00002517          	auipc	a0,0x2
    80007a38:	c7c50513          	addi	a0,a0,-900 # 800096b0 <CONSOLE_STATUS+0x6a0>
    80007a3c:	00007797          	auipc	a5,0x7
    80007a40:	b407a623          	sw	zero,-1204(a5) # 8000e588 <pr+0x18>
    80007a44:	00000097          	auipc	ra,0x0
    80007a48:	034080e7          	jalr	52(ra) # 80007a78 <__printf>
    80007a4c:	00048513          	mv	a0,s1
    80007a50:	00000097          	auipc	ra,0x0
    80007a54:	028080e7          	jalr	40(ra) # 80007a78 <__printf>
    80007a58:	00001517          	auipc	a0,0x1
    80007a5c:	74050513          	addi	a0,a0,1856 # 80009198 <CONSOLE_STATUS+0x188>
    80007a60:	00000097          	auipc	ra,0x0
    80007a64:	018080e7          	jalr	24(ra) # 80007a78 <__printf>
    80007a68:	00100793          	li	a5,1
    80007a6c:	00004717          	auipc	a4,0x4
    80007a70:	fef72623          	sw	a5,-20(a4) # 8000ba58 <panicked>
    80007a74:	0000006f          	j	80007a74 <panic+0x58>

0000000080007a78 <__printf>:
    80007a78:	f3010113          	addi	sp,sp,-208
    80007a7c:	08813023          	sd	s0,128(sp)
    80007a80:	07313423          	sd	s3,104(sp)
    80007a84:	09010413          	addi	s0,sp,144
    80007a88:	05813023          	sd	s8,64(sp)
    80007a8c:	08113423          	sd	ra,136(sp)
    80007a90:	06913c23          	sd	s1,120(sp)
    80007a94:	07213823          	sd	s2,112(sp)
    80007a98:	07413023          	sd	s4,96(sp)
    80007a9c:	05513c23          	sd	s5,88(sp)
    80007aa0:	05613823          	sd	s6,80(sp)
    80007aa4:	05713423          	sd	s7,72(sp)
    80007aa8:	03913c23          	sd	s9,56(sp)
    80007aac:	03a13823          	sd	s10,48(sp)
    80007ab0:	03b13423          	sd	s11,40(sp)
    80007ab4:	00007317          	auipc	t1,0x7
    80007ab8:	abc30313          	addi	t1,t1,-1348 # 8000e570 <pr>
    80007abc:	01832c03          	lw	s8,24(t1)
    80007ac0:	00b43423          	sd	a1,8(s0)
    80007ac4:	00c43823          	sd	a2,16(s0)
    80007ac8:	00d43c23          	sd	a3,24(s0)
    80007acc:	02e43023          	sd	a4,32(s0)
    80007ad0:	02f43423          	sd	a5,40(s0)
    80007ad4:	03043823          	sd	a6,48(s0)
    80007ad8:	03143c23          	sd	a7,56(s0)
    80007adc:	00050993          	mv	s3,a0
    80007ae0:	4a0c1663          	bnez	s8,80007f8c <__printf+0x514>
    80007ae4:	60098c63          	beqz	s3,800080fc <__printf+0x684>
    80007ae8:	0009c503          	lbu	a0,0(s3)
    80007aec:	00840793          	addi	a5,s0,8
    80007af0:	f6f43c23          	sd	a5,-136(s0)
    80007af4:	00000493          	li	s1,0
    80007af8:	22050063          	beqz	a0,80007d18 <__printf+0x2a0>
    80007afc:	00002a37          	lui	s4,0x2
    80007b00:	00018ab7          	lui	s5,0x18
    80007b04:	000f4b37          	lui	s6,0xf4
    80007b08:	00989bb7          	lui	s7,0x989
    80007b0c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007b10:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007b14:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007b18:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007b1c:	00148c9b          	addiw	s9,s1,1
    80007b20:	02500793          	li	a5,37
    80007b24:	01998933          	add	s2,s3,s9
    80007b28:	38f51263          	bne	a0,a5,80007eac <__printf+0x434>
    80007b2c:	00094783          	lbu	a5,0(s2)
    80007b30:	00078c9b          	sext.w	s9,a5
    80007b34:	1e078263          	beqz	a5,80007d18 <__printf+0x2a0>
    80007b38:	0024849b          	addiw	s1,s1,2
    80007b3c:	07000713          	li	a4,112
    80007b40:	00998933          	add	s2,s3,s1
    80007b44:	38e78a63          	beq	a5,a4,80007ed8 <__printf+0x460>
    80007b48:	20f76863          	bltu	a4,a5,80007d58 <__printf+0x2e0>
    80007b4c:	42a78863          	beq	a5,a0,80007f7c <__printf+0x504>
    80007b50:	06400713          	li	a4,100
    80007b54:	40e79663          	bne	a5,a4,80007f60 <__printf+0x4e8>
    80007b58:	f7843783          	ld	a5,-136(s0)
    80007b5c:	0007a603          	lw	a2,0(a5)
    80007b60:	00878793          	addi	a5,a5,8
    80007b64:	f6f43c23          	sd	a5,-136(s0)
    80007b68:	42064a63          	bltz	a2,80007f9c <__printf+0x524>
    80007b6c:	00a00713          	li	a4,10
    80007b70:	02e677bb          	remuw	a5,a2,a4
    80007b74:	00002d97          	auipc	s11,0x2
    80007b78:	b64d8d93          	addi	s11,s11,-1180 # 800096d8 <digits>
    80007b7c:	00900593          	li	a1,9
    80007b80:	0006051b          	sext.w	a0,a2
    80007b84:	00000c93          	li	s9,0
    80007b88:	02079793          	slli	a5,a5,0x20
    80007b8c:	0207d793          	srli	a5,a5,0x20
    80007b90:	00fd87b3          	add	a5,s11,a5
    80007b94:	0007c783          	lbu	a5,0(a5)
    80007b98:	02e656bb          	divuw	a3,a2,a4
    80007b9c:	f8f40023          	sb	a5,-128(s0)
    80007ba0:	14c5d863          	bge	a1,a2,80007cf0 <__printf+0x278>
    80007ba4:	06300593          	li	a1,99
    80007ba8:	00100c93          	li	s9,1
    80007bac:	02e6f7bb          	remuw	a5,a3,a4
    80007bb0:	02079793          	slli	a5,a5,0x20
    80007bb4:	0207d793          	srli	a5,a5,0x20
    80007bb8:	00fd87b3          	add	a5,s11,a5
    80007bbc:	0007c783          	lbu	a5,0(a5)
    80007bc0:	02e6d73b          	divuw	a4,a3,a4
    80007bc4:	f8f400a3          	sb	a5,-127(s0)
    80007bc8:	12a5f463          	bgeu	a1,a0,80007cf0 <__printf+0x278>
    80007bcc:	00a00693          	li	a3,10
    80007bd0:	00900593          	li	a1,9
    80007bd4:	02d777bb          	remuw	a5,a4,a3
    80007bd8:	02079793          	slli	a5,a5,0x20
    80007bdc:	0207d793          	srli	a5,a5,0x20
    80007be0:	00fd87b3          	add	a5,s11,a5
    80007be4:	0007c503          	lbu	a0,0(a5)
    80007be8:	02d757bb          	divuw	a5,a4,a3
    80007bec:	f8a40123          	sb	a0,-126(s0)
    80007bf0:	48e5f263          	bgeu	a1,a4,80008074 <__printf+0x5fc>
    80007bf4:	06300513          	li	a0,99
    80007bf8:	02d7f5bb          	remuw	a1,a5,a3
    80007bfc:	02059593          	slli	a1,a1,0x20
    80007c00:	0205d593          	srli	a1,a1,0x20
    80007c04:	00bd85b3          	add	a1,s11,a1
    80007c08:	0005c583          	lbu	a1,0(a1)
    80007c0c:	02d7d7bb          	divuw	a5,a5,a3
    80007c10:	f8b401a3          	sb	a1,-125(s0)
    80007c14:	48e57263          	bgeu	a0,a4,80008098 <__printf+0x620>
    80007c18:	3e700513          	li	a0,999
    80007c1c:	02d7f5bb          	remuw	a1,a5,a3
    80007c20:	02059593          	slli	a1,a1,0x20
    80007c24:	0205d593          	srli	a1,a1,0x20
    80007c28:	00bd85b3          	add	a1,s11,a1
    80007c2c:	0005c583          	lbu	a1,0(a1)
    80007c30:	02d7d7bb          	divuw	a5,a5,a3
    80007c34:	f8b40223          	sb	a1,-124(s0)
    80007c38:	46e57663          	bgeu	a0,a4,800080a4 <__printf+0x62c>
    80007c3c:	02d7f5bb          	remuw	a1,a5,a3
    80007c40:	02059593          	slli	a1,a1,0x20
    80007c44:	0205d593          	srli	a1,a1,0x20
    80007c48:	00bd85b3          	add	a1,s11,a1
    80007c4c:	0005c583          	lbu	a1,0(a1)
    80007c50:	02d7d7bb          	divuw	a5,a5,a3
    80007c54:	f8b402a3          	sb	a1,-123(s0)
    80007c58:	46ea7863          	bgeu	s4,a4,800080c8 <__printf+0x650>
    80007c5c:	02d7f5bb          	remuw	a1,a5,a3
    80007c60:	02059593          	slli	a1,a1,0x20
    80007c64:	0205d593          	srli	a1,a1,0x20
    80007c68:	00bd85b3          	add	a1,s11,a1
    80007c6c:	0005c583          	lbu	a1,0(a1)
    80007c70:	02d7d7bb          	divuw	a5,a5,a3
    80007c74:	f8b40323          	sb	a1,-122(s0)
    80007c78:	3eeaf863          	bgeu	s5,a4,80008068 <__printf+0x5f0>
    80007c7c:	02d7f5bb          	remuw	a1,a5,a3
    80007c80:	02059593          	slli	a1,a1,0x20
    80007c84:	0205d593          	srli	a1,a1,0x20
    80007c88:	00bd85b3          	add	a1,s11,a1
    80007c8c:	0005c583          	lbu	a1,0(a1)
    80007c90:	02d7d7bb          	divuw	a5,a5,a3
    80007c94:	f8b403a3          	sb	a1,-121(s0)
    80007c98:	42eb7e63          	bgeu	s6,a4,800080d4 <__printf+0x65c>
    80007c9c:	02d7f5bb          	remuw	a1,a5,a3
    80007ca0:	02059593          	slli	a1,a1,0x20
    80007ca4:	0205d593          	srli	a1,a1,0x20
    80007ca8:	00bd85b3          	add	a1,s11,a1
    80007cac:	0005c583          	lbu	a1,0(a1)
    80007cb0:	02d7d7bb          	divuw	a5,a5,a3
    80007cb4:	f8b40423          	sb	a1,-120(s0)
    80007cb8:	42ebfc63          	bgeu	s7,a4,800080f0 <__printf+0x678>
    80007cbc:	02079793          	slli	a5,a5,0x20
    80007cc0:	0207d793          	srli	a5,a5,0x20
    80007cc4:	00fd8db3          	add	s11,s11,a5
    80007cc8:	000dc703          	lbu	a4,0(s11)
    80007ccc:	00a00793          	li	a5,10
    80007cd0:	00900c93          	li	s9,9
    80007cd4:	f8e404a3          	sb	a4,-119(s0)
    80007cd8:	00065c63          	bgez	a2,80007cf0 <__printf+0x278>
    80007cdc:	f9040713          	addi	a4,s0,-112
    80007ce0:	00f70733          	add	a4,a4,a5
    80007ce4:	02d00693          	li	a3,45
    80007ce8:	fed70823          	sb	a3,-16(a4)
    80007cec:	00078c93          	mv	s9,a5
    80007cf0:	f8040793          	addi	a5,s0,-128
    80007cf4:	01978cb3          	add	s9,a5,s9
    80007cf8:	f7f40d13          	addi	s10,s0,-129
    80007cfc:	000cc503          	lbu	a0,0(s9)
    80007d00:	fffc8c93          	addi	s9,s9,-1
    80007d04:	00000097          	auipc	ra,0x0
    80007d08:	b90080e7          	jalr	-1136(ra) # 80007894 <consputc>
    80007d0c:	ffac98e3          	bne	s9,s10,80007cfc <__printf+0x284>
    80007d10:	00094503          	lbu	a0,0(s2)
    80007d14:	e00514e3          	bnez	a0,80007b1c <__printf+0xa4>
    80007d18:	1a0c1663          	bnez	s8,80007ec4 <__printf+0x44c>
    80007d1c:	08813083          	ld	ra,136(sp)
    80007d20:	08013403          	ld	s0,128(sp)
    80007d24:	07813483          	ld	s1,120(sp)
    80007d28:	07013903          	ld	s2,112(sp)
    80007d2c:	06813983          	ld	s3,104(sp)
    80007d30:	06013a03          	ld	s4,96(sp)
    80007d34:	05813a83          	ld	s5,88(sp)
    80007d38:	05013b03          	ld	s6,80(sp)
    80007d3c:	04813b83          	ld	s7,72(sp)
    80007d40:	04013c03          	ld	s8,64(sp)
    80007d44:	03813c83          	ld	s9,56(sp)
    80007d48:	03013d03          	ld	s10,48(sp)
    80007d4c:	02813d83          	ld	s11,40(sp)
    80007d50:	0d010113          	addi	sp,sp,208
    80007d54:	00008067          	ret
    80007d58:	07300713          	li	a4,115
    80007d5c:	1ce78a63          	beq	a5,a4,80007f30 <__printf+0x4b8>
    80007d60:	07800713          	li	a4,120
    80007d64:	1ee79e63          	bne	a5,a4,80007f60 <__printf+0x4e8>
    80007d68:	f7843783          	ld	a5,-136(s0)
    80007d6c:	0007a703          	lw	a4,0(a5)
    80007d70:	00878793          	addi	a5,a5,8
    80007d74:	f6f43c23          	sd	a5,-136(s0)
    80007d78:	28074263          	bltz	a4,80007ffc <__printf+0x584>
    80007d7c:	00002d97          	auipc	s11,0x2
    80007d80:	95cd8d93          	addi	s11,s11,-1700 # 800096d8 <digits>
    80007d84:	00f77793          	andi	a5,a4,15
    80007d88:	00fd87b3          	add	a5,s11,a5
    80007d8c:	0007c683          	lbu	a3,0(a5)
    80007d90:	00f00613          	li	a2,15
    80007d94:	0007079b          	sext.w	a5,a4
    80007d98:	f8d40023          	sb	a3,-128(s0)
    80007d9c:	0047559b          	srliw	a1,a4,0x4
    80007da0:	0047569b          	srliw	a3,a4,0x4
    80007da4:	00000c93          	li	s9,0
    80007da8:	0ee65063          	bge	a2,a4,80007e88 <__printf+0x410>
    80007dac:	00f6f693          	andi	a3,a3,15
    80007db0:	00dd86b3          	add	a3,s11,a3
    80007db4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007db8:	0087d79b          	srliw	a5,a5,0x8
    80007dbc:	00100c93          	li	s9,1
    80007dc0:	f8d400a3          	sb	a3,-127(s0)
    80007dc4:	0cb67263          	bgeu	a2,a1,80007e88 <__printf+0x410>
    80007dc8:	00f7f693          	andi	a3,a5,15
    80007dcc:	00dd86b3          	add	a3,s11,a3
    80007dd0:	0006c583          	lbu	a1,0(a3)
    80007dd4:	00f00613          	li	a2,15
    80007dd8:	0047d69b          	srliw	a3,a5,0x4
    80007ddc:	f8b40123          	sb	a1,-126(s0)
    80007de0:	0047d593          	srli	a1,a5,0x4
    80007de4:	28f67e63          	bgeu	a2,a5,80008080 <__printf+0x608>
    80007de8:	00f6f693          	andi	a3,a3,15
    80007dec:	00dd86b3          	add	a3,s11,a3
    80007df0:	0006c503          	lbu	a0,0(a3)
    80007df4:	0087d813          	srli	a6,a5,0x8
    80007df8:	0087d69b          	srliw	a3,a5,0x8
    80007dfc:	f8a401a3          	sb	a0,-125(s0)
    80007e00:	28b67663          	bgeu	a2,a1,8000808c <__printf+0x614>
    80007e04:	00f6f693          	andi	a3,a3,15
    80007e08:	00dd86b3          	add	a3,s11,a3
    80007e0c:	0006c583          	lbu	a1,0(a3)
    80007e10:	00c7d513          	srli	a0,a5,0xc
    80007e14:	00c7d69b          	srliw	a3,a5,0xc
    80007e18:	f8b40223          	sb	a1,-124(s0)
    80007e1c:	29067a63          	bgeu	a2,a6,800080b0 <__printf+0x638>
    80007e20:	00f6f693          	andi	a3,a3,15
    80007e24:	00dd86b3          	add	a3,s11,a3
    80007e28:	0006c583          	lbu	a1,0(a3)
    80007e2c:	0107d813          	srli	a6,a5,0x10
    80007e30:	0107d69b          	srliw	a3,a5,0x10
    80007e34:	f8b402a3          	sb	a1,-123(s0)
    80007e38:	28a67263          	bgeu	a2,a0,800080bc <__printf+0x644>
    80007e3c:	00f6f693          	andi	a3,a3,15
    80007e40:	00dd86b3          	add	a3,s11,a3
    80007e44:	0006c683          	lbu	a3,0(a3)
    80007e48:	0147d79b          	srliw	a5,a5,0x14
    80007e4c:	f8d40323          	sb	a3,-122(s0)
    80007e50:	21067663          	bgeu	a2,a6,8000805c <__printf+0x5e4>
    80007e54:	02079793          	slli	a5,a5,0x20
    80007e58:	0207d793          	srli	a5,a5,0x20
    80007e5c:	00fd8db3          	add	s11,s11,a5
    80007e60:	000dc683          	lbu	a3,0(s11)
    80007e64:	00800793          	li	a5,8
    80007e68:	00700c93          	li	s9,7
    80007e6c:	f8d403a3          	sb	a3,-121(s0)
    80007e70:	00075c63          	bgez	a4,80007e88 <__printf+0x410>
    80007e74:	f9040713          	addi	a4,s0,-112
    80007e78:	00f70733          	add	a4,a4,a5
    80007e7c:	02d00693          	li	a3,45
    80007e80:	fed70823          	sb	a3,-16(a4)
    80007e84:	00078c93          	mv	s9,a5
    80007e88:	f8040793          	addi	a5,s0,-128
    80007e8c:	01978cb3          	add	s9,a5,s9
    80007e90:	f7f40d13          	addi	s10,s0,-129
    80007e94:	000cc503          	lbu	a0,0(s9)
    80007e98:	fffc8c93          	addi	s9,s9,-1
    80007e9c:	00000097          	auipc	ra,0x0
    80007ea0:	9f8080e7          	jalr	-1544(ra) # 80007894 <consputc>
    80007ea4:	ff9d18e3          	bne	s10,s9,80007e94 <__printf+0x41c>
    80007ea8:	0100006f          	j	80007eb8 <__printf+0x440>
    80007eac:	00000097          	auipc	ra,0x0
    80007eb0:	9e8080e7          	jalr	-1560(ra) # 80007894 <consputc>
    80007eb4:	000c8493          	mv	s1,s9
    80007eb8:	00094503          	lbu	a0,0(s2)
    80007ebc:	c60510e3          	bnez	a0,80007b1c <__printf+0xa4>
    80007ec0:	e40c0ee3          	beqz	s8,80007d1c <__printf+0x2a4>
    80007ec4:	00006517          	auipc	a0,0x6
    80007ec8:	6ac50513          	addi	a0,a0,1708 # 8000e570 <pr>
    80007ecc:	00001097          	auipc	ra,0x1
    80007ed0:	94c080e7          	jalr	-1716(ra) # 80008818 <release>
    80007ed4:	e49ff06f          	j	80007d1c <__printf+0x2a4>
    80007ed8:	f7843783          	ld	a5,-136(s0)
    80007edc:	03000513          	li	a0,48
    80007ee0:	01000d13          	li	s10,16
    80007ee4:	00878713          	addi	a4,a5,8
    80007ee8:	0007bc83          	ld	s9,0(a5)
    80007eec:	f6e43c23          	sd	a4,-136(s0)
    80007ef0:	00000097          	auipc	ra,0x0
    80007ef4:	9a4080e7          	jalr	-1628(ra) # 80007894 <consputc>
    80007ef8:	07800513          	li	a0,120
    80007efc:	00000097          	auipc	ra,0x0
    80007f00:	998080e7          	jalr	-1640(ra) # 80007894 <consputc>
    80007f04:	00001d97          	auipc	s11,0x1
    80007f08:	7d4d8d93          	addi	s11,s11,2004 # 800096d8 <digits>
    80007f0c:	03ccd793          	srli	a5,s9,0x3c
    80007f10:	00fd87b3          	add	a5,s11,a5
    80007f14:	0007c503          	lbu	a0,0(a5)
    80007f18:	fffd0d1b          	addiw	s10,s10,-1
    80007f1c:	004c9c93          	slli	s9,s9,0x4
    80007f20:	00000097          	auipc	ra,0x0
    80007f24:	974080e7          	jalr	-1676(ra) # 80007894 <consputc>
    80007f28:	fe0d12e3          	bnez	s10,80007f0c <__printf+0x494>
    80007f2c:	f8dff06f          	j	80007eb8 <__printf+0x440>
    80007f30:	f7843783          	ld	a5,-136(s0)
    80007f34:	0007bc83          	ld	s9,0(a5)
    80007f38:	00878793          	addi	a5,a5,8
    80007f3c:	f6f43c23          	sd	a5,-136(s0)
    80007f40:	000c9a63          	bnez	s9,80007f54 <__printf+0x4dc>
    80007f44:	1080006f          	j	8000804c <__printf+0x5d4>
    80007f48:	001c8c93          	addi	s9,s9,1
    80007f4c:	00000097          	auipc	ra,0x0
    80007f50:	948080e7          	jalr	-1720(ra) # 80007894 <consputc>
    80007f54:	000cc503          	lbu	a0,0(s9)
    80007f58:	fe0518e3          	bnez	a0,80007f48 <__printf+0x4d0>
    80007f5c:	f5dff06f          	j	80007eb8 <__printf+0x440>
    80007f60:	02500513          	li	a0,37
    80007f64:	00000097          	auipc	ra,0x0
    80007f68:	930080e7          	jalr	-1744(ra) # 80007894 <consputc>
    80007f6c:	000c8513          	mv	a0,s9
    80007f70:	00000097          	auipc	ra,0x0
    80007f74:	924080e7          	jalr	-1756(ra) # 80007894 <consputc>
    80007f78:	f41ff06f          	j	80007eb8 <__printf+0x440>
    80007f7c:	02500513          	li	a0,37
    80007f80:	00000097          	auipc	ra,0x0
    80007f84:	914080e7          	jalr	-1772(ra) # 80007894 <consputc>
    80007f88:	f31ff06f          	j	80007eb8 <__printf+0x440>
    80007f8c:	00030513          	mv	a0,t1
    80007f90:	00000097          	auipc	ra,0x0
    80007f94:	7bc080e7          	jalr	1980(ra) # 8000874c <acquire>
    80007f98:	b4dff06f          	j	80007ae4 <__printf+0x6c>
    80007f9c:	40c0053b          	negw	a0,a2
    80007fa0:	00a00713          	li	a4,10
    80007fa4:	02e576bb          	remuw	a3,a0,a4
    80007fa8:	00001d97          	auipc	s11,0x1
    80007fac:	730d8d93          	addi	s11,s11,1840 # 800096d8 <digits>
    80007fb0:	ff700593          	li	a1,-9
    80007fb4:	02069693          	slli	a3,a3,0x20
    80007fb8:	0206d693          	srli	a3,a3,0x20
    80007fbc:	00dd86b3          	add	a3,s11,a3
    80007fc0:	0006c683          	lbu	a3,0(a3)
    80007fc4:	02e557bb          	divuw	a5,a0,a4
    80007fc8:	f8d40023          	sb	a3,-128(s0)
    80007fcc:	10b65e63          	bge	a2,a1,800080e8 <__printf+0x670>
    80007fd0:	06300593          	li	a1,99
    80007fd4:	02e7f6bb          	remuw	a3,a5,a4
    80007fd8:	02069693          	slli	a3,a3,0x20
    80007fdc:	0206d693          	srli	a3,a3,0x20
    80007fe0:	00dd86b3          	add	a3,s11,a3
    80007fe4:	0006c683          	lbu	a3,0(a3)
    80007fe8:	02e7d73b          	divuw	a4,a5,a4
    80007fec:	00200793          	li	a5,2
    80007ff0:	f8d400a3          	sb	a3,-127(s0)
    80007ff4:	bca5ece3          	bltu	a1,a0,80007bcc <__printf+0x154>
    80007ff8:	ce5ff06f          	j	80007cdc <__printf+0x264>
    80007ffc:	40e007bb          	negw	a5,a4
    80008000:	00001d97          	auipc	s11,0x1
    80008004:	6d8d8d93          	addi	s11,s11,1752 # 800096d8 <digits>
    80008008:	00f7f693          	andi	a3,a5,15
    8000800c:	00dd86b3          	add	a3,s11,a3
    80008010:	0006c583          	lbu	a1,0(a3)
    80008014:	ff100613          	li	a2,-15
    80008018:	0047d69b          	srliw	a3,a5,0x4
    8000801c:	f8b40023          	sb	a1,-128(s0)
    80008020:	0047d59b          	srliw	a1,a5,0x4
    80008024:	0ac75e63          	bge	a4,a2,800080e0 <__printf+0x668>
    80008028:	00f6f693          	andi	a3,a3,15
    8000802c:	00dd86b3          	add	a3,s11,a3
    80008030:	0006c603          	lbu	a2,0(a3)
    80008034:	00f00693          	li	a3,15
    80008038:	0087d79b          	srliw	a5,a5,0x8
    8000803c:	f8c400a3          	sb	a2,-127(s0)
    80008040:	d8b6e4e3          	bltu	a3,a1,80007dc8 <__printf+0x350>
    80008044:	00200793          	li	a5,2
    80008048:	e2dff06f          	j	80007e74 <__printf+0x3fc>
    8000804c:	00001c97          	auipc	s9,0x1
    80008050:	66cc8c93          	addi	s9,s9,1644 # 800096b8 <CONSOLE_STATUS+0x6a8>
    80008054:	02800513          	li	a0,40
    80008058:	ef1ff06f          	j	80007f48 <__printf+0x4d0>
    8000805c:	00700793          	li	a5,7
    80008060:	00600c93          	li	s9,6
    80008064:	e0dff06f          	j	80007e70 <__printf+0x3f8>
    80008068:	00700793          	li	a5,7
    8000806c:	00600c93          	li	s9,6
    80008070:	c69ff06f          	j	80007cd8 <__printf+0x260>
    80008074:	00300793          	li	a5,3
    80008078:	00200c93          	li	s9,2
    8000807c:	c5dff06f          	j	80007cd8 <__printf+0x260>
    80008080:	00300793          	li	a5,3
    80008084:	00200c93          	li	s9,2
    80008088:	de9ff06f          	j	80007e70 <__printf+0x3f8>
    8000808c:	00400793          	li	a5,4
    80008090:	00300c93          	li	s9,3
    80008094:	dddff06f          	j	80007e70 <__printf+0x3f8>
    80008098:	00400793          	li	a5,4
    8000809c:	00300c93          	li	s9,3
    800080a0:	c39ff06f          	j	80007cd8 <__printf+0x260>
    800080a4:	00500793          	li	a5,5
    800080a8:	00400c93          	li	s9,4
    800080ac:	c2dff06f          	j	80007cd8 <__printf+0x260>
    800080b0:	00500793          	li	a5,5
    800080b4:	00400c93          	li	s9,4
    800080b8:	db9ff06f          	j	80007e70 <__printf+0x3f8>
    800080bc:	00600793          	li	a5,6
    800080c0:	00500c93          	li	s9,5
    800080c4:	dadff06f          	j	80007e70 <__printf+0x3f8>
    800080c8:	00600793          	li	a5,6
    800080cc:	00500c93          	li	s9,5
    800080d0:	c09ff06f          	j	80007cd8 <__printf+0x260>
    800080d4:	00800793          	li	a5,8
    800080d8:	00700c93          	li	s9,7
    800080dc:	bfdff06f          	j	80007cd8 <__printf+0x260>
    800080e0:	00100793          	li	a5,1
    800080e4:	d91ff06f          	j	80007e74 <__printf+0x3fc>
    800080e8:	00100793          	li	a5,1
    800080ec:	bf1ff06f          	j	80007cdc <__printf+0x264>
    800080f0:	00900793          	li	a5,9
    800080f4:	00800c93          	li	s9,8
    800080f8:	be1ff06f          	j	80007cd8 <__printf+0x260>
    800080fc:	00001517          	auipc	a0,0x1
    80008100:	5c450513          	addi	a0,a0,1476 # 800096c0 <CONSOLE_STATUS+0x6b0>
    80008104:	00000097          	auipc	ra,0x0
    80008108:	918080e7          	jalr	-1768(ra) # 80007a1c <panic>

000000008000810c <printfinit>:
    8000810c:	fe010113          	addi	sp,sp,-32
    80008110:	00813823          	sd	s0,16(sp)
    80008114:	00913423          	sd	s1,8(sp)
    80008118:	00113c23          	sd	ra,24(sp)
    8000811c:	02010413          	addi	s0,sp,32
    80008120:	00006497          	auipc	s1,0x6
    80008124:	45048493          	addi	s1,s1,1104 # 8000e570 <pr>
    80008128:	00048513          	mv	a0,s1
    8000812c:	00001597          	auipc	a1,0x1
    80008130:	5a458593          	addi	a1,a1,1444 # 800096d0 <CONSOLE_STATUS+0x6c0>
    80008134:	00000097          	auipc	ra,0x0
    80008138:	5f4080e7          	jalr	1524(ra) # 80008728 <initlock>
    8000813c:	01813083          	ld	ra,24(sp)
    80008140:	01013403          	ld	s0,16(sp)
    80008144:	0004ac23          	sw	zero,24(s1)
    80008148:	00813483          	ld	s1,8(sp)
    8000814c:	02010113          	addi	sp,sp,32
    80008150:	00008067          	ret

0000000080008154 <uartinit>:
    80008154:	ff010113          	addi	sp,sp,-16
    80008158:	00813423          	sd	s0,8(sp)
    8000815c:	01010413          	addi	s0,sp,16
    80008160:	100007b7          	lui	a5,0x10000
    80008164:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80008168:	f8000713          	li	a4,-128
    8000816c:	00e781a3          	sb	a4,3(a5)
    80008170:	00300713          	li	a4,3
    80008174:	00e78023          	sb	a4,0(a5)
    80008178:	000780a3          	sb	zero,1(a5)
    8000817c:	00e781a3          	sb	a4,3(a5)
    80008180:	00700693          	li	a3,7
    80008184:	00d78123          	sb	a3,2(a5)
    80008188:	00e780a3          	sb	a4,1(a5)
    8000818c:	00813403          	ld	s0,8(sp)
    80008190:	01010113          	addi	sp,sp,16
    80008194:	00008067          	ret

0000000080008198 <uartputc>:
    80008198:	00004797          	auipc	a5,0x4
    8000819c:	8c07a783          	lw	a5,-1856(a5) # 8000ba58 <panicked>
    800081a0:	00078463          	beqz	a5,800081a8 <uartputc+0x10>
    800081a4:	0000006f          	j	800081a4 <uartputc+0xc>
    800081a8:	fd010113          	addi	sp,sp,-48
    800081ac:	02813023          	sd	s0,32(sp)
    800081b0:	00913c23          	sd	s1,24(sp)
    800081b4:	01213823          	sd	s2,16(sp)
    800081b8:	01313423          	sd	s3,8(sp)
    800081bc:	02113423          	sd	ra,40(sp)
    800081c0:	03010413          	addi	s0,sp,48
    800081c4:	00004917          	auipc	s2,0x4
    800081c8:	89c90913          	addi	s2,s2,-1892 # 8000ba60 <uart_tx_r>
    800081cc:	00093783          	ld	a5,0(s2)
    800081d0:	00004497          	auipc	s1,0x4
    800081d4:	89848493          	addi	s1,s1,-1896 # 8000ba68 <uart_tx_w>
    800081d8:	0004b703          	ld	a4,0(s1)
    800081dc:	02078693          	addi	a3,a5,32
    800081e0:	00050993          	mv	s3,a0
    800081e4:	02e69c63          	bne	a3,a4,8000821c <uartputc+0x84>
    800081e8:	00001097          	auipc	ra,0x1
    800081ec:	834080e7          	jalr	-1996(ra) # 80008a1c <push_on>
    800081f0:	00093783          	ld	a5,0(s2)
    800081f4:	0004b703          	ld	a4,0(s1)
    800081f8:	02078793          	addi	a5,a5,32
    800081fc:	00e79463          	bne	a5,a4,80008204 <uartputc+0x6c>
    80008200:	0000006f          	j	80008200 <uartputc+0x68>
    80008204:	00001097          	auipc	ra,0x1
    80008208:	88c080e7          	jalr	-1908(ra) # 80008a90 <pop_on>
    8000820c:	00093783          	ld	a5,0(s2)
    80008210:	0004b703          	ld	a4,0(s1)
    80008214:	02078693          	addi	a3,a5,32
    80008218:	fce688e3          	beq	a3,a4,800081e8 <uartputc+0x50>
    8000821c:	01f77693          	andi	a3,a4,31
    80008220:	00006597          	auipc	a1,0x6
    80008224:	37058593          	addi	a1,a1,880 # 8000e590 <uart_tx_buf>
    80008228:	00d586b3          	add	a3,a1,a3
    8000822c:	00170713          	addi	a4,a4,1
    80008230:	01368023          	sb	s3,0(a3)
    80008234:	00e4b023          	sd	a4,0(s1)
    80008238:	10000637          	lui	a2,0x10000
    8000823c:	02f71063          	bne	a4,a5,8000825c <uartputc+0xc4>
    80008240:	0340006f          	j	80008274 <uartputc+0xdc>
    80008244:	00074703          	lbu	a4,0(a4)
    80008248:	00f93023          	sd	a5,0(s2)
    8000824c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80008250:	00093783          	ld	a5,0(s2)
    80008254:	0004b703          	ld	a4,0(s1)
    80008258:	00f70e63          	beq	a4,a5,80008274 <uartputc+0xdc>
    8000825c:	00564683          	lbu	a3,5(a2)
    80008260:	01f7f713          	andi	a4,a5,31
    80008264:	00e58733          	add	a4,a1,a4
    80008268:	0206f693          	andi	a3,a3,32
    8000826c:	00178793          	addi	a5,a5,1
    80008270:	fc069ae3          	bnez	a3,80008244 <uartputc+0xac>
    80008274:	02813083          	ld	ra,40(sp)
    80008278:	02013403          	ld	s0,32(sp)
    8000827c:	01813483          	ld	s1,24(sp)
    80008280:	01013903          	ld	s2,16(sp)
    80008284:	00813983          	ld	s3,8(sp)
    80008288:	03010113          	addi	sp,sp,48
    8000828c:	00008067          	ret

0000000080008290 <uartputc_sync>:
    80008290:	ff010113          	addi	sp,sp,-16
    80008294:	00813423          	sd	s0,8(sp)
    80008298:	01010413          	addi	s0,sp,16
    8000829c:	00003717          	auipc	a4,0x3
    800082a0:	7bc72703          	lw	a4,1980(a4) # 8000ba58 <panicked>
    800082a4:	02071663          	bnez	a4,800082d0 <uartputc_sync+0x40>
    800082a8:	00050793          	mv	a5,a0
    800082ac:	100006b7          	lui	a3,0x10000
    800082b0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800082b4:	02077713          	andi	a4,a4,32
    800082b8:	fe070ce3          	beqz	a4,800082b0 <uartputc_sync+0x20>
    800082bc:	0ff7f793          	andi	a5,a5,255
    800082c0:	00f68023          	sb	a5,0(a3)
    800082c4:	00813403          	ld	s0,8(sp)
    800082c8:	01010113          	addi	sp,sp,16
    800082cc:	00008067          	ret
    800082d0:	0000006f          	j	800082d0 <uartputc_sync+0x40>

00000000800082d4 <uartstart>:
    800082d4:	ff010113          	addi	sp,sp,-16
    800082d8:	00813423          	sd	s0,8(sp)
    800082dc:	01010413          	addi	s0,sp,16
    800082e0:	00003617          	auipc	a2,0x3
    800082e4:	78060613          	addi	a2,a2,1920 # 8000ba60 <uart_tx_r>
    800082e8:	00003517          	auipc	a0,0x3
    800082ec:	78050513          	addi	a0,a0,1920 # 8000ba68 <uart_tx_w>
    800082f0:	00063783          	ld	a5,0(a2)
    800082f4:	00053703          	ld	a4,0(a0)
    800082f8:	04f70263          	beq	a4,a5,8000833c <uartstart+0x68>
    800082fc:	100005b7          	lui	a1,0x10000
    80008300:	00006817          	auipc	a6,0x6
    80008304:	29080813          	addi	a6,a6,656 # 8000e590 <uart_tx_buf>
    80008308:	01c0006f          	j	80008324 <uartstart+0x50>
    8000830c:	0006c703          	lbu	a4,0(a3)
    80008310:	00f63023          	sd	a5,0(a2)
    80008314:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008318:	00063783          	ld	a5,0(a2)
    8000831c:	00053703          	ld	a4,0(a0)
    80008320:	00f70e63          	beq	a4,a5,8000833c <uartstart+0x68>
    80008324:	01f7f713          	andi	a4,a5,31
    80008328:	00e806b3          	add	a3,a6,a4
    8000832c:	0055c703          	lbu	a4,5(a1)
    80008330:	00178793          	addi	a5,a5,1
    80008334:	02077713          	andi	a4,a4,32
    80008338:	fc071ae3          	bnez	a4,8000830c <uartstart+0x38>
    8000833c:	00813403          	ld	s0,8(sp)
    80008340:	01010113          	addi	sp,sp,16
    80008344:	00008067          	ret

0000000080008348 <uartgetc>:
    80008348:	ff010113          	addi	sp,sp,-16
    8000834c:	00813423          	sd	s0,8(sp)
    80008350:	01010413          	addi	s0,sp,16
    80008354:	10000737          	lui	a4,0x10000
    80008358:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000835c:	0017f793          	andi	a5,a5,1
    80008360:	00078c63          	beqz	a5,80008378 <uartgetc+0x30>
    80008364:	00074503          	lbu	a0,0(a4)
    80008368:	0ff57513          	andi	a0,a0,255
    8000836c:	00813403          	ld	s0,8(sp)
    80008370:	01010113          	addi	sp,sp,16
    80008374:	00008067          	ret
    80008378:	fff00513          	li	a0,-1
    8000837c:	ff1ff06f          	j	8000836c <uartgetc+0x24>

0000000080008380 <uartintr>:
    80008380:	100007b7          	lui	a5,0x10000
    80008384:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80008388:	0017f793          	andi	a5,a5,1
    8000838c:	0a078463          	beqz	a5,80008434 <uartintr+0xb4>
    80008390:	fe010113          	addi	sp,sp,-32
    80008394:	00813823          	sd	s0,16(sp)
    80008398:	00913423          	sd	s1,8(sp)
    8000839c:	00113c23          	sd	ra,24(sp)
    800083a0:	02010413          	addi	s0,sp,32
    800083a4:	100004b7          	lui	s1,0x10000
    800083a8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800083ac:	0ff57513          	andi	a0,a0,255
    800083b0:	fffff097          	auipc	ra,0xfffff
    800083b4:	534080e7          	jalr	1332(ra) # 800078e4 <consoleintr>
    800083b8:	0054c783          	lbu	a5,5(s1)
    800083bc:	0017f793          	andi	a5,a5,1
    800083c0:	fe0794e3          	bnez	a5,800083a8 <uartintr+0x28>
    800083c4:	00003617          	auipc	a2,0x3
    800083c8:	69c60613          	addi	a2,a2,1692 # 8000ba60 <uart_tx_r>
    800083cc:	00003517          	auipc	a0,0x3
    800083d0:	69c50513          	addi	a0,a0,1692 # 8000ba68 <uart_tx_w>
    800083d4:	00063783          	ld	a5,0(a2)
    800083d8:	00053703          	ld	a4,0(a0)
    800083dc:	04f70263          	beq	a4,a5,80008420 <uartintr+0xa0>
    800083e0:	100005b7          	lui	a1,0x10000
    800083e4:	00006817          	auipc	a6,0x6
    800083e8:	1ac80813          	addi	a6,a6,428 # 8000e590 <uart_tx_buf>
    800083ec:	01c0006f          	j	80008408 <uartintr+0x88>
    800083f0:	0006c703          	lbu	a4,0(a3)
    800083f4:	00f63023          	sd	a5,0(a2)
    800083f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800083fc:	00063783          	ld	a5,0(a2)
    80008400:	00053703          	ld	a4,0(a0)
    80008404:	00f70e63          	beq	a4,a5,80008420 <uartintr+0xa0>
    80008408:	01f7f713          	andi	a4,a5,31
    8000840c:	00e806b3          	add	a3,a6,a4
    80008410:	0055c703          	lbu	a4,5(a1)
    80008414:	00178793          	addi	a5,a5,1
    80008418:	02077713          	andi	a4,a4,32
    8000841c:	fc071ae3          	bnez	a4,800083f0 <uartintr+0x70>
    80008420:	01813083          	ld	ra,24(sp)
    80008424:	01013403          	ld	s0,16(sp)
    80008428:	00813483          	ld	s1,8(sp)
    8000842c:	02010113          	addi	sp,sp,32
    80008430:	00008067          	ret
    80008434:	00003617          	auipc	a2,0x3
    80008438:	62c60613          	addi	a2,a2,1580 # 8000ba60 <uart_tx_r>
    8000843c:	00003517          	auipc	a0,0x3
    80008440:	62c50513          	addi	a0,a0,1580 # 8000ba68 <uart_tx_w>
    80008444:	00063783          	ld	a5,0(a2)
    80008448:	00053703          	ld	a4,0(a0)
    8000844c:	04f70263          	beq	a4,a5,80008490 <uartintr+0x110>
    80008450:	100005b7          	lui	a1,0x10000
    80008454:	00006817          	auipc	a6,0x6
    80008458:	13c80813          	addi	a6,a6,316 # 8000e590 <uart_tx_buf>
    8000845c:	01c0006f          	j	80008478 <uartintr+0xf8>
    80008460:	0006c703          	lbu	a4,0(a3)
    80008464:	00f63023          	sd	a5,0(a2)
    80008468:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000846c:	00063783          	ld	a5,0(a2)
    80008470:	00053703          	ld	a4,0(a0)
    80008474:	02f70063          	beq	a4,a5,80008494 <uartintr+0x114>
    80008478:	01f7f713          	andi	a4,a5,31
    8000847c:	00e806b3          	add	a3,a6,a4
    80008480:	0055c703          	lbu	a4,5(a1)
    80008484:	00178793          	addi	a5,a5,1
    80008488:	02077713          	andi	a4,a4,32
    8000848c:	fc071ae3          	bnez	a4,80008460 <uartintr+0xe0>
    80008490:	00008067          	ret
    80008494:	00008067          	ret

0000000080008498 <kinit>:
    80008498:	fc010113          	addi	sp,sp,-64
    8000849c:	02913423          	sd	s1,40(sp)
    800084a0:	fffff7b7          	lui	a5,0xfffff
    800084a4:	00007497          	auipc	s1,0x7
    800084a8:	10b48493          	addi	s1,s1,267 # 8000f5af <end+0xfff>
    800084ac:	02813823          	sd	s0,48(sp)
    800084b0:	01313c23          	sd	s3,24(sp)
    800084b4:	00f4f4b3          	and	s1,s1,a5
    800084b8:	02113c23          	sd	ra,56(sp)
    800084bc:	03213023          	sd	s2,32(sp)
    800084c0:	01413823          	sd	s4,16(sp)
    800084c4:	01513423          	sd	s5,8(sp)
    800084c8:	04010413          	addi	s0,sp,64
    800084cc:	000017b7          	lui	a5,0x1
    800084d0:	01100993          	li	s3,17
    800084d4:	00f487b3          	add	a5,s1,a5
    800084d8:	01b99993          	slli	s3,s3,0x1b
    800084dc:	06f9e063          	bltu	s3,a5,8000853c <kinit+0xa4>
    800084e0:	00006a97          	auipc	s5,0x6
    800084e4:	0d0a8a93          	addi	s5,s5,208 # 8000e5b0 <end>
    800084e8:	0754ec63          	bltu	s1,s5,80008560 <kinit+0xc8>
    800084ec:	0734fa63          	bgeu	s1,s3,80008560 <kinit+0xc8>
    800084f0:	00088a37          	lui	s4,0x88
    800084f4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800084f8:	00003917          	auipc	s2,0x3
    800084fc:	57890913          	addi	s2,s2,1400 # 8000ba70 <kmem>
    80008500:	00ca1a13          	slli	s4,s4,0xc
    80008504:	0140006f          	j	80008518 <kinit+0x80>
    80008508:	000017b7          	lui	a5,0x1
    8000850c:	00f484b3          	add	s1,s1,a5
    80008510:	0554e863          	bltu	s1,s5,80008560 <kinit+0xc8>
    80008514:	0534f663          	bgeu	s1,s3,80008560 <kinit+0xc8>
    80008518:	00001637          	lui	a2,0x1
    8000851c:	00100593          	li	a1,1
    80008520:	00048513          	mv	a0,s1
    80008524:	00000097          	auipc	ra,0x0
    80008528:	5e4080e7          	jalr	1508(ra) # 80008b08 <__memset>
    8000852c:	00093783          	ld	a5,0(s2)
    80008530:	00f4b023          	sd	a5,0(s1)
    80008534:	00993023          	sd	s1,0(s2)
    80008538:	fd4498e3          	bne	s1,s4,80008508 <kinit+0x70>
    8000853c:	03813083          	ld	ra,56(sp)
    80008540:	03013403          	ld	s0,48(sp)
    80008544:	02813483          	ld	s1,40(sp)
    80008548:	02013903          	ld	s2,32(sp)
    8000854c:	01813983          	ld	s3,24(sp)
    80008550:	01013a03          	ld	s4,16(sp)
    80008554:	00813a83          	ld	s5,8(sp)
    80008558:	04010113          	addi	sp,sp,64
    8000855c:	00008067          	ret
    80008560:	00001517          	auipc	a0,0x1
    80008564:	19050513          	addi	a0,a0,400 # 800096f0 <digits+0x18>
    80008568:	fffff097          	auipc	ra,0xfffff
    8000856c:	4b4080e7          	jalr	1204(ra) # 80007a1c <panic>

0000000080008570 <freerange>:
    80008570:	fc010113          	addi	sp,sp,-64
    80008574:	000017b7          	lui	a5,0x1
    80008578:	02913423          	sd	s1,40(sp)
    8000857c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80008580:	009504b3          	add	s1,a0,s1
    80008584:	fffff537          	lui	a0,0xfffff
    80008588:	02813823          	sd	s0,48(sp)
    8000858c:	02113c23          	sd	ra,56(sp)
    80008590:	03213023          	sd	s2,32(sp)
    80008594:	01313c23          	sd	s3,24(sp)
    80008598:	01413823          	sd	s4,16(sp)
    8000859c:	01513423          	sd	s5,8(sp)
    800085a0:	01613023          	sd	s6,0(sp)
    800085a4:	04010413          	addi	s0,sp,64
    800085a8:	00a4f4b3          	and	s1,s1,a0
    800085ac:	00f487b3          	add	a5,s1,a5
    800085b0:	06f5e463          	bltu	a1,a5,80008618 <freerange+0xa8>
    800085b4:	00006a97          	auipc	s5,0x6
    800085b8:	ffca8a93          	addi	s5,s5,-4 # 8000e5b0 <end>
    800085bc:	0954e263          	bltu	s1,s5,80008640 <freerange+0xd0>
    800085c0:	01100993          	li	s3,17
    800085c4:	01b99993          	slli	s3,s3,0x1b
    800085c8:	0734fc63          	bgeu	s1,s3,80008640 <freerange+0xd0>
    800085cc:	00058a13          	mv	s4,a1
    800085d0:	00003917          	auipc	s2,0x3
    800085d4:	4a090913          	addi	s2,s2,1184 # 8000ba70 <kmem>
    800085d8:	00002b37          	lui	s6,0x2
    800085dc:	0140006f          	j	800085f0 <freerange+0x80>
    800085e0:	000017b7          	lui	a5,0x1
    800085e4:	00f484b3          	add	s1,s1,a5
    800085e8:	0554ec63          	bltu	s1,s5,80008640 <freerange+0xd0>
    800085ec:	0534fa63          	bgeu	s1,s3,80008640 <freerange+0xd0>
    800085f0:	00001637          	lui	a2,0x1
    800085f4:	00100593          	li	a1,1
    800085f8:	00048513          	mv	a0,s1
    800085fc:	00000097          	auipc	ra,0x0
    80008600:	50c080e7          	jalr	1292(ra) # 80008b08 <__memset>
    80008604:	00093703          	ld	a4,0(s2)
    80008608:	016487b3          	add	a5,s1,s6
    8000860c:	00e4b023          	sd	a4,0(s1)
    80008610:	00993023          	sd	s1,0(s2)
    80008614:	fcfa76e3          	bgeu	s4,a5,800085e0 <freerange+0x70>
    80008618:	03813083          	ld	ra,56(sp)
    8000861c:	03013403          	ld	s0,48(sp)
    80008620:	02813483          	ld	s1,40(sp)
    80008624:	02013903          	ld	s2,32(sp)
    80008628:	01813983          	ld	s3,24(sp)
    8000862c:	01013a03          	ld	s4,16(sp)
    80008630:	00813a83          	ld	s5,8(sp)
    80008634:	00013b03          	ld	s6,0(sp)
    80008638:	04010113          	addi	sp,sp,64
    8000863c:	00008067          	ret
    80008640:	00001517          	auipc	a0,0x1
    80008644:	0b050513          	addi	a0,a0,176 # 800096f0 <digits+0x18>
    80008648:	fffff097          	auipc	ra,0xfffff
    8000864c:	3d4080e7          	jalr	980(ra) # 80007a1c <panic>

0000000080008650 <kfree>:
    80008650:	fe010113          	addi	sp,sp,-32
    80008654:	00813823          	sd	s0,16(sp)
    80008658:	00113c23          	sd	ra,24(sp)
    8000865c:	00913423          	sd	s1,8(sp)
    80008660:	02010413          	addi	s0,sp,32
    80008664:	03451793          	slli	a5,a0,0x34
    80008668:	04079c63          	bnez	a5,800086c0 <kfree+0x70>
    8000866c:	00006797          	auipc	a5,0x6
    80008670:	f4478793          	addi	a5,a5,-188 # 8000e5b0 <end>
    80008674:	00050493          	mv	s1,a0
    80008678:	04f56463          	bltu	a0,a5,800086c0 <kfree+0x70>
    8000867c:	01100793          	li	a5,17
    80008680:	01b79793          	slli	a5,a5,0x1b
    80008684:	02f57e63          	bgeu	a0,a5,800086c0 <kfree+0x70>
    80008688:	00001637          	lui	a2,0x1
    8000868c:	00100593          	li	a1,1
    80008690:	00000097          	auipc	ra,0x0
    80008694:	478080e7          	jalr	1144(ra) # 80008b08 <__memset>
    80008698:	00003797          	auipc	a5,0x3
    8000869c:	3d878793          	addi	a5,a5,984 # 8000ba70 <kmem>
    800086a0:	0007b703          	ld	a4,0(a5)
    800086a4:	01813083          	ld	ra,24(sp)
    800086a8:	01013403          	ld	s0,16(sp)
    800086ac:	00e4b023          	sd	a4,0(s1)
    800086b0:	0097b023          	sd	s1,0(a5)
    800086b4:	00813483          	ld	s1,8(sp)
    800086b8:	02010113          	addi	sp,sp,32
    800086bc:	00008067          	ret
    800086c0:	00001517          	auipc	a0,0x1
    800086c4:	03050513          	addi	a0,a0,48 # 800096f0 <digits+0x18>
    800086c8:	fffff097          	auipc	ra,0xfffff
    800086cc:	354080e7          	jalr	852(ra) # 80007a1c <panic>

00000000800086d0 <kalloc>:
    800086d0:	fe010113          	addi	sp,sp,-32
    800086d4:	00813823          	sd	s0,16(sp)
    800086d8:	00913423          	sd	s1,8(sp)
    800086dc:	00113c23          	sd	ra,24(sp)
    800086e0:	02010413          	addi	s0,sp,32
    800086e4:	00003797          	auipc	a5,0x3
    800086e8:	38c78793          	addi	a5,a5,908 # 8000ba70 <kmem>
    800086ec:	0007b483          	ld	s1,0(a5)
    800086f0:	02048063          	beqz	s1,80008710 <kalloc+0x40>
    800086f4:	0004b703          	ld	a4,0(s1)
    800086f8:	00001637          	lui	a2,0x1
    800086fc:	00500593          	li	a1,5
    80008700:	00048513          	mv	a0,s1
    80008704:	00e7b023          	sd	a4,0(a5)
    80008708:	00000097          	auipc	ra,0x0
    8000870c:	400080e7          	jalr	1024(ra) # 80008b08 <__memset>
    80008710:	01813083          	ld	ra,24(sp)
    80008714:	01013403          	ld	s0,16(sp)
    80008718:	00048513          	mv	a0,s1
    8000871c:	00813483          	ld	s1,8(sp)
    80008720:	02010113          	addi	sp,sp,32
    80008724:	00008067          	ret

0000000080008728 <initlock>:
    80008728:	ff010113          	addi	sp,sp,-16
    8000872c:	00813423          	sd	s0,8(sp)
    80008730:	01010413          	addi	s0,sp,16
    80008734:	00813403          	ld	s0,8(sp)
    80008738:	00b53423          	sd	a1,8(a0)
    8000873c:	00052023          	sw	zero,0(a0)
    80008740:	00053823          	sd	zero,16(a0)
    80008744:	01010113          	addi	sp,sp,16
    80008748:	00008067          	ret

000000008000874c <acquire>:
    8000874c:	fe010113          	addi	sp,sp,-32
    80008750:	00813823          	sd	s0,16(sp)
    80008754:	00913423          	sd	s1,8(sp)
    80008758:	00113c23          	sd	ra,24(sp)
    8000875c:	01213023          	sd	s2,0(sp)
    80008760:	02010413          	addi	s0,sp,32
    80008764:	00050493          	mv	s1,a0
    80008768:	10002973          	csrr	s2,sstatus
    8000876c:	100027f3          	csrr	a5,sstatus
    80008770:	ffd7f793          	andi	a5,a5,-3
    80008774:	10079073          	csrw	sstatus,a5
    80008778:	fffff097          	auipc	ra,0xfffff
    8000877c:	8e0080e7          	jalr	-1824(ra) # 80007058 <mycpu>
    80008780:	07852783          	lw	a5,120(a0)
    80008784:	06078e63          	beqz	a5,80008800 <acquire+0xb4>
    80008788:	fffff097          	auipc	ra,0xfffff
    8000878c:	8d0080e7          	jalr	-1840(ra) # 80007058 <mycpu>
    80008790:	07852783          	lw	a5,120(a0)
    80008794:	0004a703          	lw	a4,0(s1)
    80008798:	0017879b          	addiw	a5,a5,1
    8000879c:	06f52c23          	sw	a5,120(a0)
    800087a0:	04071063          	bnez	a4,800087e0 <acquire+0x94>
    800087a4:	00100713          	li	a4,1
    800087a8:	00070793          	mv	a5,a4
    800087ac:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800087b0:	0007879b          	sext.w	a5,a5
    800087b4:	fe079ae3          	bnez	a5,800087a8 <acquire+0x5c>
    800087b8:	0ff0000f          	fence
    800087bc:	fffff097          	auipc	ra,0xfffff
    800087c0:	89c080e7          	jalr	-1892(ra) # 80007058 <mycpu>
    800087c4:	01813083          	ld	ra,24(sp)
    800087c8:	01013403          	ld	s0,16(sp)
    800087cc:	00a4b823          	sd	a0,16(s1)
    800087d0:	00013903          	ld	s2,0(sp)
    800087d4:	00813483          	ld	s1,8(sp)
    800087d8:	02010113          	addi	sp,sp,32
    800087dc:	00008067          	ret
    800087e0:	0104b903          	ld	s2,16(s1)
    800087e4:	fffff097          	auipc	ra,0xfffff
    800087e8:	874080e7          	jalr	-1932(ra) # 80007058 <mycpu>
    800087ec:	faa91ce3          	bne	s2,a0,800087a4 <acquire+0x58>
    800087f0:	00001517          	auipc	a0,0x1
    800087f4:	f0850513          	addi	a0,a0,-248 # 800096f8 <digits+0x20>
    800087f8:	fffff097          	auipc	ra,0xfffff
    800087fc:	224080e7          	jalr	548(ra) # 80007a1c <panic>
    80008800:	00195913          	srli	s2,s2,0x1
    80008804:	fffff097          	auipc	ra,0xfffff
    80008808:	854080e7          	jalr	-1964(ra) # 80007058 <mycpu>
    8000880c:	00197913          	andi	s2,s2,1
    80008810:	07252e23          	sw	s2,124(a0)
    80008814:	f75ff06f          	j	80008788 <acquire+0x3c>

0000000080008818 <release>:
    80008818:	fe010113          	addi	sp,sp,-32
    8000881c:	00813823          	sd	s0,16(sp)
    80008820:	00113c23          	sd	ra,24(sp)
    80008824:	00913423          	sd	s1,8(sp)
    80008828:	01213023          	sd	s2,0(sp)
    8000882c:	02010413          	addi	s0,sp,32
    80008830:	00052783          	lw	a5,0(a0)
    80008834:	00079a63          	bnez	a5,80008848 <release+0x30>
    80008838:	00001517          	auipc	a0,0x1
    8000883c:	ec850513          	addi	a0,a0,-312 # 80009700 <digits+0x28>
    80008840:	fffff097          	auipc	ra,0xfffff
    80008844:	1dc080e7          	jalr	476(ra) # 80007a1c <panic>
    80008848:	01053903          	ld	s2,16(a0)
    8000884c:	00050493          	mv	s1,a0
    80008850:	fffff097          	auipc	ra,0xfffff
    80008854:	808080e7          	jalr	-2040(ra) # 80007058 <mycpu>
    80008858:	fea910e3          	bne	s2,a0,80008838 <release+0x20>
    8000885c:	0004b823          	sd	zero,16(s1)
    80008860:	0ff0000f          	fence
    80008864:	0f50000f          	fence	iorw,ow
    80008868:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000886c:	ffffe097          	auipc	ra,0xffffe
    80008870:	7ec080e7          	jalr	2028(ra) # 80007058 <mycpu>
    80008874:	100027f3          	csrr	a5,sstatus
    80008878:	0027f793          	andi	a5,a5,2
    8000887c:	04079a63          	bnez	a5,800088d0 <release+0xb8>
    80008880:	07852783          	lw	a5,120(a0)
    80008884:	02f05e63          	blez	a5,800088c0 <release+0xa8>
    80008888:	fff7871b          	addiw	a4,a5,-1
    8000888c:	06e52c23          	sw	a4,120(a0)
    80008890:	00071c63          	bnez	a4,800088a8 <release+0x90>
    80008894:	07c52783          	lw	a5,124(a0)
    80008898:	00078863          	beqz	a5,800088a8 <release+0x90>
    8000889c:	100027f3          	csrr	a5,sstatus
    800088a0:	0027e793          	ori	a5,a5,2
    800088a4:	10079073          	csrw	sstatus,a5
    800088a8:	01813083          	ld	ra,24(sp)
    800088ac:	01013403          	ld	s0,16(sp)
    800088b0:	00813483          	ld	s1,8(sp)
    800088b4:	00013903          	ld	s2,0(sp)
    800088b8:	02010113          	addi	sp,sp,32
    800088bc:	00008067          	ret
    800088c0:	00001517          	auipc	a0,0x1
    800088c4:	e6050513          	addi	a0,a0,-416 # 80009720 <digits+0x48>
    800088c8:	fffff097          	auipc	ra,0xfffff
    800088cc:	154080e7          	jalr	340(ra) # 80007a1c <panic>
    800088d0:	00001517          	auipc	a0,0x1
    800088d4:	e3850513          	addi	a0,a0,-456 # 80009708 <digits+0x30>
    800088d8:	fffff097          	auipc	ra,0xfffff
    800088dc:	144080e7          	jalr	324(ra) # 80007a1c <panic>

00000000800088e0 <holding>:
    800088e0:	00052783          	lw	a5,0(a0)
    800088e4:	00079663          	bnez	a5,800088f0 <holding+0x10>
    800088e8:	00000513          	li	a0,0
    800088ec:	00008067          	ret
    800088f0:	fe010113          	addi	sp,sp,-32
    800088f4:	00813823          	sd	s0,16(sp)
    800088f8:	00913423          	sd	s1,8(sp)
    800088fc:	00113c23          	sd	ra,24(sp)
    80008900:	02010413          	addi	s0,sp,32
    80008904:	01053483          	ld	s1,16(a0)
    80008908:	ffffe097          	auipc	ra,0xffffe
    8000890c:	750080e7          	jalr	1872(ra) # 80007058 <mycpu>
    80008910:	01813083          	ld	ra,24(sp)
    80008914:	01013403          	ld	s0,16(sp)
    80008918:	40a48533          	sub	a0,s1,a0
    8000891c:	00153513          	seqz	a0,a0
    80008920:	00813483          	ld	s1,8(sp)
    80008924:	02010113          	addi	sp,sp,32
    80008928:	00008067          	ret

000000008000892c <push_off>:
    8000892c:	fe010113          	addi	sp,sp,-32
    80008930:	00813823          	sd	s0,16(sp)
    80008934:	00113c23          	sd	ra,24(sp)
    80008938:	00913423          	sd	s1,8(sp)
    8000893c:	02010413          	addi	s0,sp,32
    80008940:	100024f3          	csrr	s1,sstatus
    80008944:	100027f3          	csrr	a5,sstatus
    80008948:	ffd7f793          	andi	a5,a5,-3
    8000894c:	10079073          	csrw	sstatus,a5
    80008950:	ffffe097          	auipc	ra,0xffffe
    80008954:	708080e7          	jalr	1800(ra) # 80007058 <mycpu>
    80008958:	07852783          	lw	a5,120(a0)
    8000895c:	02078663          	beqz	a5,80008988 <push_off+0x5c>
    80008960:	ffffe097          	auipc	ra,0xffffe
    80008964:	6f8080e7          	jalr	1784(ra) # 80007058 <mycpu>
    80008968:	07852783          	lw	a5,120(a0)
    8000896c:	01813083          	ld	ra,24(sp)
    80008970:	01013403          	ld	s0,16(sp)
    80008974:	0017879b          	addiw	a5,a5,1
    80008978:	06f52c23          	sw	a5,120(a0)
    8000897c:	00813483          	ld	s1,8(sp)
    80008980:	02010113          	addi	sp,sp,32
    80008984:	00008067          	ret
    80008988:	0014d493          	srli	s1,s1,0x1
    8000898c:	ffffe097          	auipc	ra,0xffffe
    80008990:	6cc080e7          	jalr	1740(ra) # 80007058 <mycpu>
    80008994:	0014f493          	andi	s1,s1,1
    80008998:	06952e23          	sw	s1,124(a0)
    8000899c:	fc5ff06f          	j	80008960 <push_off+0x34>

00000000800089a0 <pop_off>:
    800089a0:	ff010113          	addi	sp,sp,-16
    800089a4:	00813023          	sd	s0,0(sp)
    800089a8:	00113423          	sd	ra,8(sp)
    800089ac:	01010413          	addi	s0,sp,16
    800089b0:	ffffe097          	auipc	ra,0xffffe
    800089b4:	6a8080e7          	jalr	1704(ra) # 80007058 <mycpu>
    800089b8:	100027f3          	csrr	a5,sstatus
    800089bc:	0027f793          	andi	a5,a5,2
    800089c0:	04079663          	bnez	a5,80008a0c <pop_off+0x6c>
    800089c4:	07852783          	lw	a5,120(a0)
    800089c8:	02f05a63          	blez	a5,800089fc <pop_off+0x5c>
    800089cc:	fff7871b          	addiw	a4,a5,-1
    800089d0:	06e52c23          	sw	a4,120(a0)
    800089d4:	00071c63          	bnez	a4,800089ec <pop_off+0x4c>
    800089d8:	07c52783          	lw	a5,124(a0)
    800089dc:	00078863          	beqz	a5,800089ec <pop_off+0x4c>
    800089e0:	100027f3          	csrr	a5,sstatus
    800089e4:	0027e793          	ori	a5,a5,2
    800089e8:	10079073          	csrw	sstatus,a5
    800089ec:	00813083          	ld	ra,8(sp)
    800089f0:	00013403          	ld	s0,0(sp)
    800089f4:	01010113          	addi	sp,sp,16
    800089f8:	00008067          	ret
    800089fc:	00001517          	auipc	a0,0x1
    80008a00:	d2450513          	addi	a0,a0,-732 # 80009720 <digits+0x48>
    80008a04:	fffff097          	auipc	ra,0xfffff
    80008a08:	018080e7          	jalr	24(ra) # 80007a1c <panic>
    80008a0c:	00001517          	auipc	a0,0x1
    80008a10:	cfc50513          	addi	a0,a0,-772 # 80009708 <digits+0x30>
    80008a14:	fffff097          	auipc	ra,0xfffff
    80008a18:	008080e7          	jalr	8(ra) # 80007a1c <panic>

0000000080008a1c <push_on>:
    80008a1c:	fe010113          	addi	sp,sp,-32
    80008a20:	00813823          	sd	s0,16(sp)
    80008a24:	00113c23          	sd	ra,24(sp)
    80008a28:	00913423          	sd	s1,8(sp)
    80008a2c:	02010413          	addi	s0,sp,32
    80008a30:	100024f3          	csrr	s1,sstatus
    80008a34:	100027f3          	csrr	a5,sstatus
    80008a38:	0027e793          	ori	a5,a5,2
    80008a3c:	10079073          	csrw	sstatus,a5
    80008a40:	ffffe097          	auipc	ra,0xffffe
    80008a44:	618080e7          	jalr	1560(ra) # 80007058 <mycpu>
    80008a48:	07852783          	lw	a5,120(a0)
    80008a4c:	02078663          	beqz	a5,80008a78 <push_on+0x5c>
    80008a50:	ffffe097          	auipc	ra,0xffffe
    80008a54:	608080e7          	jalr	1544(ra) # 80007058 <mycpu>
    80008a58:	07852783          	lw	a5,120(a0)
    80008a5c:	01813083          	ld	ra,24(sp)
    80008a60:	01013403          	ld	s0,16(sp)
    80008a64:	0017879b          	addiw	a5,a5,1
    80008a68:	06f52c23          	sw	a5,120(a0)
    80008a6c:	00813483          	ld	s1,8(sp)
    80008a70:	02010113          	addi	sp,sp,32
    80008a74:	00008067          	ret
    80008a78:	0014d493          	srli	s1,s1,0x1
    80008a7c:	ffffe097          	auipc	ra,0xffffe
    80008a80:	5dc080e7          	jalr	1500(ra) # 80007058 <mycpu>
    80008a84:	0014f493          	andi	s1,s1,1
    80008a88:	06952e23          	sw	s1,124(a0)
    80008a8c:	fc5ff06f          	j	80008a50 <push_on+0x34>

0000000080008a90 <pop_on>:
    80008a90:	ff010113          	addi	sp,sp,-16
    80008a94:	00813023          	sd	s0,0(sp)
    80008a98:	00113423          	sd	ra,8(sp)
    80008a9c:	01010413          	addi	s0,sp,16
    80008aa0:	ffffe097          	auipc	ra,0xffffe
    80008aa4:	5b8080e7          	jalr	1464(ra) # 80007058 <mycpu>
    80008aa8:	100027f3          	csrr	a5,sstatus
    80008aac:	0027f793          	andi	a5,a5,2
    80008ab0:	04078463          	beqz	a5,80008af8 <pop_on+0x68>
    80008ab4:	07852783          	lw	a5,120(a0)
    80008ab8:	02f05863          	blez	a5,80008ae8 <pop_on+0x58>
    80008abc:	fff7879b          	addiw	a5,a5,-1
    80008ac0:	06f52c23          	sw	a5,120(a0)
    80008ac4:	07853783          	ld	a5,120(a0)
    80008ac8:	00079863          	bnez	a5,80008ad8 <pop_on+0x48>
    80008acc:	100027f3          	csrr	a5,sstatus
    80008ad0:	ffd7f793          	andi	a5,a5,-3
    80008ad4:	10079073          	csrw	sstatus,a5
    80008ad8:	00813083          	ld	ra,8(sp)
    80008adc:	00013403          	ld	s0,0(sp)
    80008ae0:	01010113          	addi	sp,sp,16
    80008ae4:	00008067          	ret
    80008ae8:	00001517          	auipc	a0,0x1
    80008aec:	c6050513          	addi	a0,a0,-928 # 80009748 <digits+0x70>
    80008af0:	fffff097          	auipc	ra,0xfffff
    80008af4:	f2c080e7          	jalr	-212(ra) # 80007a1c <panic>
    80008af8:	00001517          	auipc	a0,0x1
    80008afc:	c3050513          	addi	a0,a0,-976 # 80009728 <digits+0x50>
    80008b00:	fffff097          	auipc	ra,0xfffff
    80008b04:	f1c080e7          	jalr	-228(ra) # 80007a1c <panic>

0000000080008b08 <__memset>:
    80008b08:	ff010113          	addi	sp,sp,-16
    80008b0c:	00813423          	sd	s0,8(sp)
    80008b10:	01010413          	addi	s0,sp,16
    80008b14:	1a060e63          	beqz	a2,80008cd0 <__memset+0x1c8>
    80008b18:	40a007b3          	neg	a5,a0
    80008b1c:	0077f793          	andi	a5,a5,7
    80008b20:	00778693          	addi	a3,a5,7
    80008b24:	00b00813          	li	a6,11
    80008b28:	0ff5f593          	andi	a1,a1,255
    80008b2c:	fff6071b          	addiw	a4,a2,-1
    80008b30:	1b06e663          	bltu	a3,a6,80008cdc <__memset+0x1d4>
    80008b34:	1cd76463          	bltu	a4,a3,80008cfc <__memset+0x1f4>
    80008b38:	1a078e63          	beqz	a5,80008cf4 <__memset+0x1ec>
    80008b3c:	00b50023          	sb	a1,0(a0)
    80008b40:	00100713          	li	a4,1
    80008b44:	1ae78463          	beq	a5,a4,80008cec <__memset+0x1e4>
    80008b48:	00b500a3          	sb	a1,1(a0)
    80008b4c:	00200713          	li	a4,2
    80008b50:	1ae78a63          	beq	a5,a4,80008d04 <__memset+0x1fc>
    80008b54:	00b50123          	sb	a1,2(a0)
    80008b58:	00300713          	li	a4,3
    80008b5c:	18e78463          	beq	a5,a4,80008ce4 <__memset+0x1dc>
    80008b60:	00b501a3          	sb	a1,3(a0)
    80008b64:	00400713          	li	a4,4
    80008b68:	1ae78263          	beq	a5,a4,80008d0c <__memset+0x204>
    80008b6c:	00b50223          	sb	a1,4(a0)
    80008b70:	00500713          	li	a4,5
    80008b74:	1ae78063          	beq	a5,a4,80008d14 <__memset+0x20c>
    80008b78:	00b502a3          	sb	a1,5(a0)
    80008b7c:	00700713          	li	a4,7
    80008b80:	18e79e63          	bne	a5,a4,80008d1c <__memset+0x214>
    80008b84:	00b50323          	sb	a1,6(a0)
    80008b88:	00700e93          	li	t4,7
    80008b8c:	00859713          	slli	a4,a1,0x8
    80008b90:	00e5e733          	or	a4,a1,a4
    80008b94:	01059e13          	slli	t3,a1,0x10
    80008b98:	01c76e33          	or	t3,a4,t3
    80008b9c:	01859313          	slli	t1,a1,0x18
    80008ba0:	006e6333          	or	t1,t3,t1
    80008ba4:	02059893          	slli	a7,a1,0x20
    80008ba8:	40f60e3b          	subw	t3,a2,a5
    80008bac:	011368b3          	or	a7,t1,a7
    80008bb0:	02859813          	slli	a6,a1,0x28
    80008bb4:	0108e833          	or	a6,a7,a6
    80008bb8:	03059693          	slli	a3,a1,0x30
    80008bbc:	003e589b          	srliw	a7,t3,0x3
    80008bc0:	00d866b3          	or	a3,a6,a3
    80008bc4:	03859713          	slli	a4,a1,0x38
    80008bc8:	00389813          	slli	a6,a7,0x3
    80008bcc:	00f507b3          	add	a5,a0,a5
    80008bd0:	00e6e733          	or	a4,a3,a4
    80008bd4:	000e089b          	sext.w	a7,t3
    80008bd8:	00f806b3          	add	a3,a6,a5
    80008bdc:	00e7b023          	sd	a4,0(a5)
    80008be0:	00878793          	addi	a5,a5,8
    80008be4:	fed79ce3          	bne	a5,a3,80008bdc <__memset+0xd4>
    80008be8:	ff8e7793          	andi	a5,t3,-8
    80008bec:	0007871b          	sext.w	a4,a5
    80008bf0:	01d787bb          	addw	a5,a5,t4
    80008bf4:	0ce88e63          	beq	a7,a4,80008cd0 <__memset+0x1c8>
    80008bf8:	00f50733          	add	a4,a0,a5
    80008bfc:	00b70023          	sb	a1,0(a4)
    80008c00:	0017871b          	addiw	a4,a5,1
    80008c04:	0cc77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c08:	00e50733          	add	a4,a0,a4
    80008c0c:	00b70023          	sb	a1,0(a4)
    80008c10:	0027871b          	addiw	a4,a5,2
    80008c14:	0ac77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c18:	00e50733          	add	a4,a0,a4
    80008c1c:	00b70023          	sb	a1,0(a4)
    80008c20:	0037871b          	addiw	a4,a5,3
    80008c24:	0ac77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c28:	00e50733          	add	a4,a0,a4
    80008c2c:	00b70023          	sb	a1,0(a4)
    80008c30:	0047871b          	addiw	a4,a5,4
    80008c34:	08c77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c38:	00e50733          	add	a4,a0,a4
    80008c3c:	00b70023          	sb	a1,0(a4)
    80008c40:	0057871b          	addiw	a4,a5,5
    80008c44:	08c77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c48:	00e50733          	add	a4,a0,a4
    80008c4c:	00b70023          	sb	a1,0(a4)
    80008c50:	0067871b          	addiw	a4,a5,6
    80008c54:	06c77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c58:	00e50733          	add	a4,a0,a4
    80008c5c:	00b70023          	sb	a1,0(a4)
    80008c60:	0077871b          	addiw	a4,a5,7
    80008c64:	06c77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c68:	00e50733          	add	a4,a0,a4
    80008c6c:	00b70023          	sb	a1,0(a4)
    80008c70:	0087871b          	addiw	a4,a5,8
    80008c74:	04c77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c78:	00e50733          	add	a4,a0,a4
    80008c7c:	00b70023          	sb	a1,0(a4)
    80008c80:	0097871b          	addiw	a4,a5,9
    80008c84:	04c77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c88:	00e50733          	add	a4,a0,a4
    80008c8c:	00b70023          	sb	a1,0(a4)
    80008c90:	00a7871b          	addiw	a4,a5,10
    80008c94:	02c77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008c98:	00e50733          	add	a4,a0,a4
    80008c9c:	00b70023          	sb	a1,0(a4)
    80008ca0:	00b7871b          	addiw	a4,a5,11
    80008ca4:	02c77663          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008ca8:	00e50733          	add	a4,a0,a4
    80008cac:	00b70023          	sb	a1,0(a4)
    80008cb0:	00c7871b          	addiw	a4,a5,12
    80008cb4:	00c77e63          	bgeu	a4,a2,80008cd0 <__memset+0x1c8>
    80008cb8:	00e50733          	add	a4,a0,a4
    80008cbc:	00b70023          	sb	a1,0(a4)
    80008cc0:	00d7879b          	addiw	a5,a5,13
    80008cc4:	00c7f663          	bgeu	a5,a2,80008cd0 <__memset+0x1c8>
    80008cc8:	00f507b3          	add	a5,a0,a5
    80008ccc:	00b78023          	sb	a1,0(a5)
    80008cd0:	00813403          	ld	s0,8(sp)
    80008cd4:	01010113          	addi	sp,sp,16
    80008cd8:	00008067          	ret
    80008cdc:	00b00693          	li	a3,11
    80008ce0:	e55ff06f          	j	80008b34 <__memset+0x2c>
    80008ce4:	00300e93          	li	t4,3
    80008ce8:	ea5ff06f          	j	80008b8c <__memset+0x84>
    80008cec:	00100e93          	li	t4,1
    80008cf0:	e9dff06f          	j	80008b8c <__memset+0x84>
    80008cf4:	00000e93          	li	t4,0
    80008cf8:	e95ff06f          	j	80008b8c <__memset+0x84>
    80008cfc:	00000793          	li	a5,0
    80008d00:	ef9ff06f          	j	80008bf8 <__memset+0xf0>
    80008d04:	00200e93          	li	t4,2
    80008d08:	e85ff06f          	j	80008b8c <__memset+0x84>
    80008d0c:	00400e93          	li	t4,4
    80008d10:	e7dff06f          	j	80008b8c <__memset+0x84>
    80008d14:	00500e93          	li	t4,5
    80008d18:	e75ff06f          	j	80008b8c <__memset+0x84>
    80008d1c:	00600e93          	li	t4,6
    80008d20:	e6dff06f          	j	80008b8c <__memset+0x84>

0000000080008d24 <__memmove>:
    80008d24:	ff010113          	addi	sp,sp,-16
    80008d28:	00813423          	sd	s0,8(sp)
    80008d2c:	01010413          	addi	s0,sp,16
    80008d30:	0e060863          	beqz	a2,80008e20 <__memmove+0xfc>
    80008d34:	fff6069b          	addiw	a3,a2,-1
    80008d38:	0006881b          	sext.w	a6,a3
    80008d3c:	0ea5e863          	bltu	a1,a0,80008e2c <__memmove+0x108>
    80008d40:	00758713          	addi	a4,a1,7
    80008d44:	00a5e7b3          	or	a5,a1,a0
    80008d48:	40a70733          	sub	a4,a4,a0
    80008d4c:	0077f793          	andi	a5,a5,7
    80008d50:	00f73713          	sltiu	a4,a4,15
    80008d54:	00174713          	xori	a4,a4,1
    80008d58:	0017b793          	seqz	a5,a5
    80008d5c:	00e7f7b3          	and	a5,a5,a4
    80008d60:	10078863          	beqz	a5,80008e70 <__memmove+0x14c>
    80008d64:	00900793          	li	a5,9
    80008d68:	1107f463          	bgeu	a5,a6,80008e70 <__memmove+0x14c>
    80008d6c:	0036581b          	srliw	a6,a2,0x3
    80008d70:	fff8081b          	addiw	a6,a6,-1
    80008d74:	02081813          	slli	a6,a6,0x20
    80008d78:	01d85893          	srli	a7,a6,0x1d
    80008d7c:	00858813          	addi	a6,a1,8
    80008d80:	00058793          	mv	a5,a1
    80008d84:	00050713          	mv	a4,a0
    80008d88:	01088833          	add	a6,a7,a6
    80008d8c:	0007b883          	ld	a7,0(a5)
    80008d90:	00878793          	addi	a5,a5,8
    80008d94:	00870713          	addi	a4,a4,8
    80008d98:	ff173c23          	sd	a7,-8(a4)
    80008d9c:	ff0798e3          	bne	a5,a6,80008d8c <__memmove+0x68>
    80008da0:	ff867713          	andi	a4,a2,-8
    80008da4:	02071793          	slli	a5,a4,0x20
    80008da8:	0207d793          	srli	a5,a5,0x20
    80008dac:	00f585b3          	add	a1,a1,a5
    80008db0:	40e686bb          	subw	a3,a3,a4
    80008db4:	00f507b3          	add	a5,a0,a5
    80008db8:	06e60463          	beq	a2,a4,80008e20 <__memmove+0xfc>
    80008dbc:	0005c703          	lbu	a4,0(a1)
    80008dc0:	00e78023          	sb	a4,0(a5)
    80008dc4:	04068e63          	beqz	a3,80008e20 <__memmove+0xfc>
    80008dc8:	0015c603          	lbu	a2,1(a1)
    80008dcc:	00100713          	li	a4,1
    80008dd0:	00c780a3          	sb	a2,1(a5)
    80008dd4:	04e68663          	beq	a3,a4,80008e20 <__memmove+0xfc>
    80008dd8:	0025c603          	lbu	a2,2(a1)
    80008ddc:	00200713          	li	a4,2
    80008de0:	00c78123          	sb	a2,2(a5)
    80008de4:	02e68e63          	beq	a3,a4,80008e20 <__memmove+0xfc>
    80008de8:	0035c603          	lbu	a2,3(a1)
    80008dec:	00300713          	li	a4,3
    80008df0:	00c781a3          	sb	a2,3(a5)
    80008df4:	02e68663          	beq	a3,a4,80008e20 <__memmove+0xfc>
    80008df8:	0045c603          	lbu	a2,4(a1)
    80008dfc:	00400713          	li	a4,4
    80008e00:	00c78223          	sb	a2,4(a5)
    80008e04:	00e68e63          	beq	a3,a4,80008e20 <__memmove+0xfc>
    80008e08:	0055c603          	lbu	a2,5(a1)
    80008e0c:	00500713          	li	a4,5
    80008e10:	00c782a3          	sb	a2,5(a5)
    80008e14:	00e68663          	beq	a3,a4,80008e20 <__memmove+0xfc>
    80008e18:	0065c703          	lbu	a4,6(a1)
    80008e1c:	00e78323          	sb	a4,6(a5)
    80008e20:	00813403          	ld	s0,8(sp)
    80008e24:	01010113          	addi	sp,sp,16
    80008e28:	00008067          	ret
    80008e2c:	02061713          	slli	a4,a2,0x20
    80008e30:	02075713          	srli	a4,a4,0x20
    80008e34:	00e587b3          	add	a5,a1,a4
    80008e38:	f0f574e3          	bgeu	a0,a5,80008d40 <__memmove+0x1c>
    80008e3c:	02069613          	slli	a2,a3,0x20
    80008e40:	02065613          	srli	a2,a2,0x20
    80008e44:	fff64613          	not	a2,a2
    80008e48:	00e50733          	add	a4,a0,a4
    80008e4c:	00c78633          	add	a2,a5,a2
    80008e50:	fff7c683          	lbu	a3,-1(a5)
    80008e54:	fff78793          	addi	a5,a5,-1
    80008e58:	fff70713          	addi	a4,a4,-1
    80008e5c:	00d70023          	sb	a3,0(a4)
    80008e60:	fec798e3          	bne	a5,a2,80008e50 <__memmove+0x12c>
    80008e64:	00813403          	ld	s0,8(sp)
    80008e68:	01010113          	addi	sp,sp,16
    80008e6c:	00008067          	ret
    80008e70:	02069713          	slli	a4,a3,0x20
    80008e74:	02075713          	srli	a4,a4,0x20
    80008e78:	00170713          	addi	a4,a4,1
    80008e7c:	00e50733          	add	a4,a0,a4
    80008e80:	00050793          	mv	a5,a0
    80008e84:	0005c683          	lbu	a3,0(a1)
    80008e88:	00178793          	addi	a5,a5,1
    80008e8c:	00158593          	addi	a1,a1,1
    80008e90:	fed78fa3          	sb	a3,-1(a5)
    80008e94:	fee798e3          	bne	a5,a4,80008e84 <__memmove+0x160>
    80008e98:	f89ff06f          	j	80008e20 <__memmove+0xfc>
	...
