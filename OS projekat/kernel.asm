
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00023117          	auipc	sp,0x23
    80000004:	57813103          	ld	sp,1400(sp) # 80023578 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	71c200ef          	jal	ra,80020738 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080010000 <trap>:
.global TrapHandler

.align 16

trap:
addi sp, sp, -272 #zaokruzuje se na broj deljiv sa 16
    80010000:	ef010113          	addi	sp,sp,-272
#po zahtevu sp mora biti deljiv sa 16

sd t0, 168(sp)
    80010004:	0a513423          	sd	t0,168(sp)

csrr t0, sepc #pc pre ecall
    80010008:	141022f3          	csrr	t0,sepc
sd t0, 248(sp)
    8001000c:	0e513c23          	sd	t0,248(sp)
csrr t0, sstatus #statusni registar pre ecall
    80010010:	100022f3          	csrr	t0,sstatus
sd t0, 256(sp)
    80010014:	10513023          	sd	t0,256(sp)

sd ra, 0(sp)
    80010018:	00113023          	sd	ra,0(sp)
sd s0, 8(sp)
    8001001c:	00813423          	sd	s0,8(sp)
sd s1, 16(sp)
    80010020:	00913823          	sd	s1,16(sp)
sd s2, 24(sp)
    80010024:	01213c23          	sd	s2,24(sp)
sd s3, 32(sp)
    80010028:	03313023          	sd	s3,32(sp)
sd s4, 40(sp)
    8001002c:	03413423          	sd	s4,40(sp)
sd s5, 48(sp)
    80010030:	03513823          	sd	s5,48(sp)
sd s6, 56(sp)
    80010034:	03613c23          	sd	s6,56(sp)
sd s7, 64(sp)
    80010038:	05713023          	sd	s7,64(sp)
sd s8, 72(sp)
    8001003c:	05813423          	sd	s8,72(sp)
sd s9, 80(sp)
    80010040:	05913823          	sd	s9,80(sp)
sd s10, 88(sp)
    80010044:	05a13c23          	sd	s10,88(sp)
sd s11, 96(sp)
    80010048:	07b13023          	sd	s11,96(sp)
sd a0, 104(sp)
    8001004c:	06a13423          	sd	a0,104(sp)
sd a1, 112(sp)
    80010050:	06b13823          	sd	a1,112(sp)
sd a2, 120(sp)
    80010054:	06c13c23          	sd	a2,120(sp)
sd a3, 128(sp)
    80010058:	08d13023          	sd	a3,128(sp)
sd a4, 136(sp)
    8001005c:	08e13423          	sd	a4,136(sp)
sd a5, 144(sp)
    80010060:	08f13823          	sd	a5,144(sp)
sd a6, 152(sp)
    80010064:	09013c23          	sd	a6,152(sp)
sd a7, 160(sp)
    80010068:	0b113023          	sd	a7,160(sp)
sd t1, 176(sp)
    8001006c:	0a613823          	sd	t1,176(sp)
sd t2, 184(sp)
    80010070:	0a713c23          	sd	t2,184(sp)
sd t3, 192(sp)
    80010074:	0dc13023          	sd	t3,192(sp)
sd t4, 200(sp)
    80010078:	0dd13423          	sd	t4,200(sp)
sd t5, 208(sp)
    8001007c:	0de13823          	sd	t5,208(sp)
sd t6, 216(sp)
    80010080:	0df13c23          	sd	t6,216(sp)
sd gp, 224(sp)
    80010084:	0e313023          	sd	gp,224(sp)
sd tp, 232(sp)
    80010088:	0e413423          	sd	tp,232(sp)

addi t0, sp, 272
    8001008c:	11010293          	addi	t0,sp,272
sd t0, 240(sp)
    80010090:	0e513823          	sd	t0,240(sp)

mv a0, sp #kao argument trap handleru se salje sp, to omogucava iteraciju kroz niz registara
    80010094:	00010513          	mv	a0,sp
call TrapHandler
    80010098:	7690f0ef          	jal	ra,80020000 <TrapHandler>
sd a0, 104(sp)
    8001009c:	06a13423          	sd	a0,104(sp)

ld t0, 256(sp)
    800100a0:	10013283          	ld	t0,256(sp)
csrw sstatus, t0
    800100a4:	10029073          	csrw	sstatus,t0
ld t0, 248(sp)
    800100a8:	0f813283          	ld	t0,248(sp)
addi t0, t0, 4 #prelazak na instrukciju nakon ecall
    800100ac:	00428293          	addi	t0,t0,4
csrw sepc, t0
    800100b0:	14129073          	csrw	sepc,t0

ld ra, 0(sp)
    800100b4:	00013083          	ld	ra,0(sp)
ld s0, 8(sp)
    800100b8:	00813403          	ld	s0,8(sp)
ld s1, 16(sp)
    800100bc:	01013483          	ld	s1,16(sp)
ld s2, 24(sp)
    800100c0:	01813903          	ld	s2,24(sp)
ld s3, 32(sp)
    800100c4:	02013983          	ld	s3,32(sp)
ld s4, 40(sp)
    800100c8:	02813a03          	ld	s4,40(sp)
ld s5, 48(sp)
    800100cc:	03013a83          	ld	s5,48(sp)
ld s6, 56(sp)
    800100d0:	03813b03          	ld	s6,56(sp)
ld s7, 64(sp)
    800100d4:	04013b83          	ld	s7,64(sp)
ld s8, 72(sp)
    800100d8:	04813c03          	ld	s8,72(sp)
ld s9, 80(sp)
    800100dc:	05013c83          	ld	s9,80(sp)
ld s10, 88(sp)
    800100e0:	05813d03          	ld	s10,88(sp)
ld s11, 96(sp)
    800100e4:	06013d83          	ld	s11,96(sp)
ld a0, 104(sp)
    800100e8:	06813503          	ld	a0,104(sp)
ld a1, 112(sp)
    800100ec:	07013583          	ld	a1,112(sp)
ld a2, 120(sp)
    800100f0:	07813603          	ld	a2,120(sp)
ld a3, 128(sp)
    800100f4:	08013683          	ld	a3,128(sp)
ld a4, 136(sp)
    800100f8:	08813703          	ld	a4,136(sp)
ld a5, 144(sp)
    800100fc:	09013783          	ld	a5,144(sp)
ld a6, 152(sp)
    80010100:	09813803          	ld	a6,152(sp)
ld a7, 160(sp)
    80010104:	0a013883          	ld	a7,160(sp)
ld t1, 176(sp)
    80010108:	0b013303          	ld	t1,176(sp)
ld t2, 184(sp)
    8001010c:	0b813383          	ld	t2,184(sp)
ld t3, 192(sp)
    80010110:	0c013e03          	ld	t3,192(sp)
ld t4, 200(sp)
    80010114:	0c813e83          	ld	t4,200(sp)
ld t5, 208(sp)
    80010118:	0d013f03          	ld	t5,208(sp)
ld t6, 216(sp)
    8001011c:	0d813f83          	ld	t6,216(sp)
ld gp, 224(sp)
    80010120:	0e013183          	ld	gp,224(sp)
ld tp, 232(sp)
    80010124:	0e813203          	ld	tp,232(sp)
ld sp, 240(sp)
    80010128:	0f013103          	ld	sp,240(sp)

    8001012c:	10200073          	sret
	...

0000000080020000 <TrapHandler>:
#include "../lib/console.h"

extern "C" uint64 TrapHandler(uint64* savedRegisters){

    uint64 scause;
    asm volatile("csrr %0, scause" : "=r"(scause));
    80020000:	142027f3          	csrr	a5,scause

    uint64 sysCallCode = savedRegisters[13];
    80020004:	06853703          	ld	a4,104(a0) # 1068 <_entry-0x7fffef98>

    if(scause == 0x8 || scause == 0x9){
    80020008:	ff878793          	addi	a5,a5,-8
    8002000c:	00100693          	li	a3,1
    80020010:	06f6e863          	bltu	a3,a5,80020080 <TrapHandler+0x80>
extern "C" uint64 TrapHandler(uint64* savedRegisters){
    80020014:	fe010113          	addi	sp,sp,-32
    80020018:	00113c23          	sd	ra,24(sp)
    8002001c:	00813823          	sd	s0,16(sp)
    80020020:	00913423          	sd	s1,8(sp)
    80020024:	02010413          	addi	s0,sp,32
    80020028:	00050493          	mv	s1,a0

        if(sysCallCode == 0x1){
    8002002c:	00100793          	li	a5,1
    80020030:	02f70263          	beq	a4,a5,80020054 <TrapHandler+0x54>
            void* addr = MemoryAllocator::malloc(sizeInBlocks);
            return (uint64)addr;
            //...
        }

        if(sysCallCode == 0x2){
    80020034:	00200793          	li	a5,2
    80020038:	02f70663          	beq	a4,a5,80020064 <TrapHandler+0x64>
            //...
        }

    }

    return -1;
    8002003c:	fff00513          	li	a0,-1

    80020040:	01813083          	ld	ra,24(sp)
    80020044:	01013403          	ld	s0,16(sp)
    80020048:	00813483          	ld	s1,8(sp)
    8002004c:	02010113          	addi	sp,sp,32
    80020050:	00008067          	ret
            void* addr = MemoryAllocator::malloc(sizeInBlocks);
    80020054:	07053503          	ld	a0,112(a0)
    80020058:	00000097          	auipc	ra,0x0
    8002005c:	2d0080e7          	jalr	720(ra) # 80020328 <_ZN15MemoryAllocator6mallocEm>
            return (uint64)addr;
    80020060:	fe1ff06f          	j	80020040 <TrapHandler+0x40>
            __putc('D');
    80020064:	04400513          	li	a0,68
    80020068:	00002097          	auipc	ra,0x2
    8002006c:	794080e7          	jalr	1940(ra) # 800227fc <__putc>
            int status = MemoryAllocator::dealloc(at);
    80020070:	0704b503          	ld	a0,112(s1)
    80020074:	00000097          	auipc	ra,0x0
    80020078:	3e4080e7          	jalr	996(ra) # 80020458 <_ZN15MemoryAllocator7deallocEPv>
            return (uint64)status;
    8002007c:	fc5ff06f          	j	80020040 <TrapHandler+0x40>
    return -1;
    80020080:	fff00513          	li	a0,-1
    80020084:	00008067          	ret

0000000080020088 <_Z9mem_allocm>:
#include "../h/syscall_c.hpp"
#include "../lib/console.h"

void* mem_alloc(size_t sizeInBytes){
    80020088:	ff010113          	addi	sp,sp,-16
    8002008c:	00813423          	sd	s0,8(sp)
    80020090:	01010413          	addi	s0,sp,16
    size_t sizeInBlocks = (sizeInBytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80020094:	03f50793          	addi	a5,a0,63
    80020098:	0067d793          	srli	a5,a5,0x6
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(result)
    : "r"(sizeInBlocks)
    : "a0", "a1"
    );
    8002009c:	00100513          	li	a0,1
    800200a0:	00078593          	mv	a1,a5
    800200a4:	00000073          	ecall
    800200a8:	00050793          	mv	a5,a0

    return result;
}
    800200ac:	00078513          	mv	a0,a5
    800200b0:	00813403          	ld	s0,8(sp)
    800200b4:	01010113          	addi	sp,sp,16
    800200b8:	00008067          	ret

00000000800200bc <_Z8mem_freePv>:

int mem_free(void* at){
    800200bc:	ff010113          	addi	sp,sp,-16
    800200c0:	00813423          	sd	s0,8(sp)
    800200c4:	01010413          	addi	s0,sp,16
    800200c8:	00050793          	mv	a5,a0
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(status)
    : "r"(at)
    : "a0", "a1"
    );
    800200cc:	00200513          	li	a0,2
    800200d0:	00078593          	mv	a1,a5
    800200d4:	00000073          	ecall
    800200d8:	00050793          	mv	a5,a0
    
    return status;
    800200dc:	0007851b          	sext.w	a0,a5
    800200e0:	00813403          	ld	s0,8(sp)
    800200e4:	01010113          	addi	sp,sp,16
    800200e8:	00008067          	ret

00000000800200ec <_Z41__static_initialization_and_destruction_0ii>:
    threadScheduler->put(t);
}

Thread* Scheduler::get(){
    return threadScheduler->get();
    800200ec:	00100793          	li	a5,1
    800200f0:	00f50463          	beq	a0,a5,800200f8 <_Z41__static_initialization_and_destruction_0ii+0xc>
    800200f4:	00008067          	ret
    800200f8:	000107b7          	lui	a5,0x10
    800200fc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80020100:	fef59ae3          	bne	a1,a5,800200f4 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80020104:	ff010113          	addi	sp,sp,-16
    80020108:	00113423          	sd	ra,8(sp)
    8002010c:	00813023          	sd	s0,0(sp)
    80020110:	01010413          	addi	s0,sp,16
Queue<Thread*>* Scheduler::threadScheduler = new Queue<Thread*>();
    80020114:	01000513          	li	a0,16
    80020118:	00000097          	auipc	ra,0x0
    8002011c:	170080e7          	jalr	368(ra) # 80020288 <_Znwm>

template <typename T>
class Queue{
public:
    Queue(){
        head = tail = nullptr;
    80020120:	00053423          	sd	zero,8(a0)
    80020124:	00053023          	sd	zero,0(a0)
    80020128:	00003797          	auipc	a5,0x3
    8002012c:	4aa7bc23          	sd	a0,1208(a5) # 800235e0 <_ZN9Scheduler15threadSchedulerE>
    80020130:	00813083          	ld	ra,8(sp)
    80020134:	00013403          	ld	s0,0(sp)
    80020138:	01010113          	addi	sp,sp,16
    8002013c:	00008067          	ret

0000000080020140 <_ZN9Scheduler11getInstanceEv>:
    if(instance == nullptr) instance = new Scheduler();
    80020140:	00003797          	auipc	a5,0x3
    80020144:	4a87b783          	ld	a5,1192(a5) # 800235e8 <_ZN9Scheduler8instanceE>
    80020148:	00078863          	beqz	a5,80020158 <_ZN9Scheduler11getInstanceEv+0x18>
}
    8002014c:	00003517          	auipc	a0,0x3
    80020150:	49c53503          	ld	a0,1180(a0) # 800235e8 <_ZN9Scheduler8instanceE>
    80020154:	00008067          	ret
Scheduler* Scheduler::getInstance(){
    80020158:	ff010113          	addi	sp,sp,-16
    8002015c:	00113423          	sd	ra,8(sp)
    80020160:	00813023          	sd	s0,0(sp)
    80020164:	01010413          	addi	s0,sp,16
    if(instance == nullptr) instance = new Scheduler();
    80020168:	00100513          	li	a0,1
    8002016c:	00000097          	auipc	ra,0x0
    80020170:	11c080e7          	jalr	284(ra) # 80020288 <_Znwm>
    80020174:	00003797          	auipc	a5,0x3
    80020178:	46a7ba23          	sd	a0,1140(a5) # 800235e8 <_ZN9Scheduler8instanceE>
}
    8002017c:	00003517          	auipc	a0,0x3
    80020180:	46c53503          	ld	a0,1132(a0) # 800235e8 <_ZN9Scheduler8instanceE>
    80020184:	00813083          	ld	ra,8(sp)
    80020188:	00013403          	ld	s0,0(sp)
    8002018c:	01010113          	addi	sp,sp,16
    80020190:	00008067          	ret

0000000080020194 <_ZN9SchedulerC1Ev>:
Scheduler::Scheduler(){
    80020194:	ff010113          	addi	sp,sp,-16
    80020198:	00813423          	sd	s0,8(sp)
    8002019c:	01010413          	addi	s0,sp,16
}
    800201a0:	00813403          	ld	s0,8(sp)
    800201a4:	01010113          	addi	sp,sp,16
    800201a8:	00008067          	ret

00000000800201ac <_ZN9Scheduler3putEP6Thread>:
void Scheduler::put(Thread* t){
    800201ac:	fe010113          	addi	sp,sp,-32
    800201b0:	00113c23          	sd	ra,24(sp)
    800201b4:	00813823          	sd	s0,16(sp)
    800201b8:	00913423          	sd	s1,8(sp)
    800201bc:	01213023          	sd	s2,0(sp)
    800201c0:	02010413          	addi	s0,sp,32
    800201c4:	00050913          	mv	s2,a0
    threadScheduler->put(t);
    800201c8:	00003497          	auipc	s1,0x3
    800201cc:	4184b483          	ld	s1,1048(s1) # 800235e0 <_ZN9Scheduler15threadSchedulerE>

        Enqueued(T argdata, Enqueued* argnext = nullptr) : data(argdata), next(argnext) {}
    };

    void put(T data){
        Enqueued* e = new Enqueued(data, nullptr);
    800201d0:	01000513          	li	a0,16
    800201d4:	00000097          	auipc	ra,0x0
    800201d8:	0b4080e7          	jalr	180(ra) # 80020288 <_Znwm>
        Enqueued(T argdata, Enqueued* argnext = nullptr) : data(argdata), next(argnext) {}
    800201dc:	01253023          	sd	s2,0(a0)
    800201e0:	00053423          	sd	zero,8(a0)
        if(head == nullptr){
    800201e4:	0004b783          	ld	a5,0(s1)
    800201e8:	02078663          	beqz	a5,80020214 <_ZN9Scheduler3putEP6Thread+0x68>
            head = e;
            tail = head;
        }
        else{
            tail->next = e;
    800201ec:	0084b783          	ld	a5,8(s1)
    800201f0:	00a7b423          	sd	a0,8(a5)
            e->next = nullptr;
    800201f4:	00053423          	sd	zero,8(a0)
            tail = e;
    800201f8:	00a4b423          	sd	a0,8(s1)
}
    800201fc:	01813083          	ld	ra,24(sp)
    80020200:	01013403          	ld	s0,16(sp)
    80020204:	00813483          	ld	s1,8(sp)
    80020208:	00013903          	ld	s2,0(sp)
    8002020c:	02010113          	addi	sp,sp,32
    80020210:	00008067          	ret
            head = e;
    80020214:	00a4b023          	sd	a0,0(s1)
            tail = head;
    80020218:	00a4b423          	sd	a0,8(s1)
    8002021c:	fe1ff06f          	j	800201fc <_ZN9Scheduler3putEP6Thread+0x50>

0000000080020220 <_ZN9Scheduler3getEv>:
Thread* Scheduler::get(){
    80020220:	ff010113          	addi	sp,sp,-16
    80020224:	00813423          	sd	s0,8(sp)
    80020228:	01010413          	addi	s0,sp,16
    return threadScheduler->get();
    8002022c:	00003717          	auipc	a4,0x3
    80020230:	3b473703          	ld	a4,948(a4) # 800235e0 <_ZN9Scheduler15threadSchedulerE>
        }
    }

    T get(){
        Enqueued* r = head;
    80020234:	00073783          	ld	a5,0(a4)
        if(head) head = head->next;
    80020238:	00078663          	beqz	a5,80020244 <_ZN9Scheduler3getEv+0x24>
    8002023c:	0087b683          	ld	a3,8(a5)
    80020240:	00d73023          	sd	a3,0(a4)
    80020244:	0007b503          	ld	a0,0(a5)
    80020248:	00813403          	ld	s0,8(sp)
    8002024c:	01010113          	addi	sp,sp,16
    80020250:	00008067          	ret

0000000080020254 <_GLOBAL__sub_I__ZN9Scheduler15threadSchedulerE>:
    80020254:	ff010113          	addi	sp,sp,-16
    80020258:	00113423          	sd	ra,8(sp)
    8002025c:	00813023          	sd	s0,0(sp)
    80020260:	01010413          	addi	s0,sp,16
    80020264:	000105b7          	lui	a1,0x10
    80020268:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    8002026c:	00100513          	li	a0,1
    80020270:	00000097          	auipc	ra,0x0
    80020274:	e7c080e7          	jalr	-388(ra) # 800200ec <_Z41__static_initialization_and_destruction_0ii>
    80020278:	00813083          	ld	ra,8(sp)
    8002027c:	00013403          	ld	s0,0(sp)
    80020280:	01010113          	addi	sp,sp,16
    80020284:	00008067          	ret

0000000080020288 <_Znwm>:
#include "../h/syscall_cpp.hpp"

void* operator new(size_t size){
    80020288:	ff010113          	addi	sp,sp,-16
    8002028c:	00113423          	sd	ra,8(sp)
    80020290:	00813023          	sd	s0,0(sp)
    80020294:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80020298:	00000097          	auipc	ra,0x0
    8002029c:	df0080e7          	jalr	-528(ra) # 80020088 <_Z9mem_allocm>
}
    800202a0:	00813083          	ld	ra,8(sp)
    800202a4:	00013403          	ld	s0,0(sp)
    800202a8:	01010113          	addi	sp,sp,16
    800202ac:	00008067          	ret

00000000800202b0 <_ZdlPv>:

void operator delete(void* at){
    800202b0:	ff010113          	addi	sp,sp,-16
    800202b4:	00113423          	sd	ra,8(sp)
    800202b8:	00813023          	sd	s0,0(sp)
    800202bc:	01010413          	addi	s0,sp,16
    mem_free(at);
    800202c0:	00000097          	auipc	ra,0x0
    800202c4:	dfc080e7          	jalr	-516(ra) # 800200bc <_Z8mem_freePv>
    800202c8:	00813083          	ld	ra,8(sp)
    800202cc:	00013403          	ld	s0,0(sp)
    800202d0:	01010113          	addi	sp,sp,16
    800202d4:	00008067          	ret

00000000800202d8 <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemBlock* MemoryAllocator::free_mem_head = nullptr;

void MemoryAllocator::initialize(){
    800202d8:	ff010113          	addi	sp,sp,-16
    800202dc:	00813423          	sd	s0,8(sp)
    800202e0:	01010413          	addi	s0,sp,16
    free_mem_head = (MemBlock*)HEAP_START_ADDR;
    800202e4:	00003797          	auipc	a5,0x3
    800202e8:	28c7b783          	ld	a5,652(a5) # 80023570 <_GLOBAL_OFFSET_TABLE_+0x8>
    800202ec:	0007b703          	ld	a4,0(a5)
    800202f0:	00003697          	auipc	a3,0x3
    800202f4:	30068693          	addi	a3,a3,768 # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
    800202f8:	00e6b023          	sd	a4,0(a3)
    free_mem_head->sizeInBlocks = ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    800202fc:	00003797          	auipc	a5,0x3
    80020300:	28c7b783          	ld	a5,652(a5) # 80023588 <_GLOBAL_OFFSET_TABLE_+0x20>
    80020304:	0007b783          	ld	a5,0(a5)
    80020308:	40e787b3          	sub	a5,a5,a4
    8002030c:	0067d793          	srli	a5,a5,0x6
    80020310:	00f73023          	sd	a5,0(a4)
    free_mem_head->next = nullptr;
    80020314:	0006b783          	ld	a5,0(a3)
    80020318:	0007b423          	sd	zero,8(a5)
}
    8002031c:	00813403          	ld	s0,8(sp)
    80020320:	01010113          	addi	sp,sp,16
    80020324:	00008067          	ret

0000000080020328 <_ZN15MemoryAllocator6mallocEm>:

void* MemoryAllocator::malloc(size_t sizeInBlocks){
    80020328:	ff010113          	addi	sp,sp,-16
    8002032c:	00813423          	sd	s0,8(sp)
    80020330:	01010413          	addi	s0,sp,16
    // sizeInBlocks - velicina prostora u blokovima
    if(sizeInBlocks == 0 || sizeInBlocks*MEM_BLOCK_SIZE > ((uint64)HEAP_END_ADDR - 
    80020334:	0e050263          	beqz	a0,80020418 <_ZN15MemoryAllocator6mallocEm+0xf0>
    80020338:	00050793          	mv	a5,a0
    8002033c:	00651693          	slli	a3,a0,0x6
    80020340:	00003717          	auipc	a4,0x3
    80020344:	24873703          	ld	a4,584(a4) # 80023588 <_GLOBAL_OFFSET_TABLE_+0x20>
    80020348:	00073703          	ld	a4,0(a4)
    8002034c:	00003617          	auipc	a2,0x3
    80020350:	22463603          	ld	a2,548(a2) # 80023570 <_GLOBAL_OFFSET_TABLE_+0x8>
    80020354:	00063603          	ld	a2,0(a2)
    80020358:	40c70733          	sub	a4,a4,a2
    8002035c:	0cd76263          	bltu	a4,a3,80020420 <_ZN15MemoryAllocator6mallocEm+0xf8>
                        (uint64)HEAP_START_ADDR)) 
    return nullptr;

    MemBlock* block = free_mem_head;
    80020360:	00003517          	auipc	a0,0x3
    80020364:	29053503          	ld	a0,656(a0) # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
    MemBlock* prev = nullptr;
    80020368:	00000613          	li	a2,0
    
    for(; block != nullptr; block = block->next){
    8002036c:	00050e63          	beqz	a0,80020388 <_ZN15MemoryAllocator6mallocEm+0x60>
        if(block->sizeInBlocks >= (sizeInBlocks + HEADER_SIZE)) break; // alocira se dodatni pred-blok u kome se nalazi informacija o velicini alociranog dela memorije
    80020370:	00053683          	ld	a3,0(a0)
    80020374:	00178713          	addi	a4,a5,1
    80020378:	00e6f863          	bgeu	a3,a4,80020388 <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = block;
    8002037c:	00050613          	mv	a2,a0
    for(; block != nullptr; block = block->next){
    80020380:	00853503          	ld	a0,8(a0)
    80020384:	fe9ff06f          	j	8002036c <_ZN15MemoryAllocator6mallocEm+0x44>
    }

    if(block == nullptr) return nullptr;
    80020388:	04050463          	beqz	a0,800203d0 <_ZN15MemoryAllocator6mallocEm+0xa8>

    size_t remaining_size = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
    8002038c:	00053703          	ld	a4,0(a0)
    80020390:	40f70733          	sub	a4,a4,a5
    80020394:	fff70713          	addi	a4,a4,-1
    if(remaining_size > HEADER_SIZE) {
    80020398:	00100693          	li	a3,1
    8002039c:	04e6f663          	bgeu	a3,a4,800203e8 <_ZN15MemoryAllocator6mallocEm+0xc0>
        MemBlock* new_free = (MemBlock*)((char*)block + MEM_BLOCK_SIZE*(sizeInBlocks + HEADER_SIZE));
    800203a0:	00178693          	addi	a3,a5,1
    800203a4:	00669693          	slli	a3,a3,0x6
    800203a8:	00d506b3          	add	a3,a0,a3
        new_free->sizeInBlocks = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
    800203ac:	00e6b023          	sd	a4,0(a3)
        new_free->next = block->next;
    800203b0:	00853703          	ld	a4,8(a0)
    800203b4:	00e6b423          	sd	a4,8(a3)
        if(prev) prev->next = new_free;
    800203b8:	02060263          	beqz	a2,800203dc <_ZN15MemoryAllocator6mallocEm+0xb4>
    800203bc:	00d63423          	sd	a3,8(a2)
    }

    // zadrzava se MemBlock header
    // on se nalazi u bloku ispod novoalociranje memorije
    // ovo se koristi pri dealokaciji
    block->sizeInBlocks = sizeInBlocks + HEADER_SIZE;
    800203c0:	00178793          	addi	a5,a5,1
    800203c4:	00f53023          	sd	a5,0(a0)
    block->next = nullptr;
    800203c8:	00053423          	sd	zero,8(a0)
    return (void*)((char*)block + MEM_BLOCK_SIZE);
    800203cc:	04050513          	addi	a0,a0,64
}
    800203d0:	00813403          	ld	s0,8(sp)
    800203d4:	01010113          	addi	sp,sp,16
    800203d8:	00008067          	ret
        else free_mem_head = new_free;
    800203dc:	00003717          	auipc	a4,0x3
    800203e0:	20d73a23          	sd	a3,532(a4) # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
    800203e4:	fddff06f          	j	800203c0 <_ZN15MemoryAllocator6mallocEm+0x98>
        if(remaining_size == HEADER_SIZE) sizeInBlocks += HEADER_SIZE;
    800203e8:	00100693          	li	a3,1
    800203ec:	00d70a63          	beq	a4,a3,80020400 <_ZN15MemoryAllocator6mallocEm+0xd8>
        if(prev) prev->next = block->next;
    800203f0:	00060c63          	beqz	a2,80020408 <_ZN15MemoryAllocator6mallocEm+0xe0>
    800203f4:	00853703          	ld	a4,8(a0)
    800203f8:	00e63423          	sd	a4,8(a2)
    800203fc:	fc5ff06f          	j	800203c0 <_ZN15MemoryAllocator6mallocEm+0x98>
        if(remaining_size == HEADER_SIZE) sizeInBlocks += HEADER_SIZE;
    80020400:	00178793          	addi	a5,a5,1
    80020404:	fedff06f          	j	800203f0 <_ZN15MemoryAllocator6mallocEm+0xc8>
        else free_mem_head = block->next;
    80020408:	00853703          	ld	a4,8(a0)
    8002040c:	00003697          	auipc	a3,0x3
    80020410:	1ee6b223          	sd	a4,484(a3) # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
    80020414:	fadff06f          	j	800203c0 <_ZN15MemoryAllocator6mallocEm+0x98>
    return nullptr;
    80020418:	00000513          	li	a0,0
    8002041c:	fb5ff06f          	j	800203d0 <_ZN15MemoryAllocator6mallocEm+0xa8>
    80020420:	00000513          	li	a0,0
    80020424:	fadff06f          	j	800203d0 <_ZN15MemoryAllocator6mallocEm+0xa8>

0000000080020428 <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>:

void MemoryAllocator::merge(MemBlock* low, MemBlock* high){
    80020428:	ff010113          	addi	sp,sp,-16
    8002042c:	00813423          	sd	s0,8(sp)
    80020430:	01010413          	addi	s0,sp,16
    low->sizeInBlocks += high->sizeInBlocks;
    80020434:	0005b703          	ld	a4,0(a1)
    80020438:	00053783          	ld	a5,0(a0)
    8002043c:	00e787b3          	add	a5,a5,a4
    80020440:	00f53023          	sd	a5,0(a0)
    low->next = high->next;
    80020444:	0085b783          	ld	a5,8(a1)
    80020448:	00f53423          	sd	a5,8(a0)
}
    8002044c:	00813403          	ld	s0,8(sp)
    80020450:	01010113          	addi	sp,sp,16
    80020454:	00008067          	ret

0000000080020458 <_ZN15MemoryAllocator7deallocEPv>:

int MemoryAllocator::dealloc(void* at){
    if(!at) return -1;
    80020458:	0e050863          	beqz	a0,80020548 <_ZN15MemoryAllocator7deallocEPv+0xf0>
    if((char*)at < (char*)HEAP_START_ADDR + MEM_BLOCK_SIZE || (char*)at >= HEAP_END_ADDR) return -2;
    8002045c:	00003797          	auipc	a5,0x3
    80020460:	1147b783          	ld	a5,276(a5) # 80023570 <_GLOBAL_OFFSET_TABLE_+0x8>
    80020464:	0007b783          	ld	a5,0(a5)
    80020468:	04078793          	addi	a5,a5,64
    8002046c:	0ef56263          	bltu	a0,a5,80020550 <_ZN15MemoryAllocator7deallocEPv+0xf8>
    80020470:	00003797          	auipc	a5,0x3
    80020474:	1187b783          	ld	a5,280(a5) # 80023588 <_GLOBAL_OFFSET_TABLE_+0x20>
    80020478:	0007b783          	ld	a5,0(a5)
    8002047c:	0cf57e63          	bgeu	a0,a5,80020558 <_ZN15MemoryAllocator7deallocEPv+0x100>
int MemoryAllocator::dealloc(void* at){
    80020480:	fe010113          	addi	sp,sp,-32
    80020484:	00113c23          	sd	ra,24(sp)
    80020488:	00813823          	sd	s0,16(sp)
    8002048c:	00913423          	sd	s1,8(sp)
    80020490:	01213023          	sd	s2,0(sp)
    80020494:	02010413          	addi	s0,sp,32

    // MemBlock struktura koja sadrzi velicinu segmenta za brisanje
    MemBlock* new_free_mem_block = (MemBlock*)((char*)at - MEM_BLOCK_SIZE);
    80020498:	fc050913          	addi	s2,a0,-64
    
    MemBlock* next = free_mem_head;
    8002049c:	00003597          	auipc	a1,0x3
    800204a0:	1545b583          	ld	a1,340(a1) # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
    MemBlock* prev = nullptr;
    800204a4:	00000493          	li	s1,0
    for(; next; next = next->next){
    800204a8:	00058a63          	beqz	a1,800204bc <_ZN15MemoryAllocator7deallocEPv+0x64>
        if((void*)next > (void*)new_free_mem_block) break;
    800204ac:	00b96863          	bltu	s2,a1,800204bc <_ZN15MemoryAllocator7deallocEPv+0x64>
        prev = next;
    800204b0:	00058493          	mv	s1,a1
    for(; next; next = next->next){
    800204b4:	0085b583          	ld	a1,8(a1)
    800204b8:	ff1ff06f          	j	800204a8 <_ZN15MemoryAllocator7deallocEPv+0x50>
    }

    if(!prev){
    800204bc:	04048a63          	beqz	s1,80020510 <_ZN15MemoryAllocator7deallocEPv+0xb8>
        free_mem_head = new_free_mem_block;
        new_free_mem_block->next = next;
    }
    else{
        new_free_mem_block->next = prev->next;
    800204c0:	0084b783          	ld	a5,8(s1)
    800204c4:	fcf53423          	sd	a5,-56(a0)
        prev->next = new_free_mem_block;
    800204c8:	0124b423          	sd	s2,8(s1)
    } 

    // potrebno je spojiti oslobodnjene delove memorije sa susednim, ako takvih ima
    if(next && (char*)new_free_mem_block + new_free_mem_block->sizeInBlocks*MEM_BLOCK_SIZE == (char*)next)
    800204cc:	00058a63          	beqz	a1,800204e0 <_ZN15MemoryAllocator7deallocEPv+0x88>
    800204d0:	fc053783          	ld	a5,-64(a0)
    800204d4:	00679793          	slli	a5,a5,0x6
    800204d8:	00f907b3          	add	a5,s2,a5
    800204dc:	04b78263          	beq	a5,a1,80020520 <_ZN15MemoryAllocator7deallocEPv+0xc8>
        merge(new_free_mem_block, next);
    if(prev && (char*)prev + prev->sizeInBlocks*MEM_BLOCK_SIZE == (char*)new_free_mem_block)
    800204e0:	08048063          	beqz	s1,80020560 <_ZN15MemoryAllocator7deallocEPv+0x108>
    800204e4:	0004b783          	ld	a5,0(s1)
    800204e8:	00679793          	slli	a5,a5,0x6
    800204ec:	00f487b3          	add	a5,s1,a5
    800204f0:	05278063          	beq	a5,s2,80020530 <_ZN15MemoryAllocator7deallocEPv+0xd8>
        merge(prev, new_free_mem_block);

    return 0;
    800204f4:	00000513          	li	a0,0
    800204f8:	01813083          	ld	ra,24(sp)
    800204fc:	01013403          	ld	s0,16(sp)
    80020500:	00813483          	ld	s1,8(sp)
    80020504:	00013903          	ld	s2,0(sp)
    80020508:	02010113          	addi	sp,sp,32
    8002050c:	00008067          	ret
        free_mem_head = new_free_mem_block;
    80020510:	00003797          	auipc	a5,0x3
    80020514:	0f27b023          	sd	s2,224(a5) # 800235f0 <_ZN15MemoryAllocator13free_mem_headE>
        new_free_mem_block->next = next;
    80020518:	fcb53423          	sd	a1,-56(a0)
    8002051c:	fb1ff06f          	j	800204cc <_ZN15MemoryAllocator7deallocEPv+0x74>
        merge(new_free_mem_block, next);
    80020520:	00090513          	mv	a0,s2
    80020524:	00000097          	auipc	ra,0x0
    80020528:	f04080e7          	jalr	-252(ra) # 80020428 <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>
    8002052c:	fb5ff06f          	j	800204e0 <_ZN15MemoryAllocator7deallocEPv+0x88>
        merge(prev, new_free_mem_block);
    80020530:	00090593          	mv	a1,s2
    80020534:	00048513          	mv	a0,s1
    80020538:	00000097          	auipc	ra,0x0
    8002053c:	ef0080e7          	jalr	-272(ra) # 80020428 <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>
    return 0;
    80020540:	00000513          	li	a0,0
    80020544:	fb5ff06f          	j	800204f8 <_ZN15MemoryAllocator7deallocEPv+0xa0>
    if(!at) return -1;
    80020548:	fff00513          	li	a0,-1
    8002054c:	00008067          	ret
    if((char*)at < (char*)HEAP_START_ADDR + MEM_BLOCK_SIZE || (char*)at >= HEAP_END_ADDR) return -2;
    80020550:	ffe00513          	li	a0,-2
    80020554:	00008067          	ret
    80020558:	ffe00513          	li	a0,-2
    8002055c:	00008067          	ret
    return 0;
    80020560:	00000513          	li	a0,0
    80020564:	f95ff06f          	j	800204f8 <_ZN15MemoryAllocator7deallocEPv+0xa0>

0000000080020568 <main>:
#include "../h/Queue.hpp"

extern "C" void trap();
extern "C" uint64 TrapHandler(uint64* savedRegisters);

int main(){
    80020568:	fe010113          	addi	sp,sp,-32
    8002056c:	00113c23          	sd	ra,24(sp)
    80020570:	00813823          	sd	s0,16(sp)
    80020574:	00913423          	sd	s1,8(sp)
    80020578:	01213023          	sd	s2,0(sp)
    8002057c:	02010413          	addi	s0,sp,32
    asm volatile("csrw stvec, %0" : : "r"(trap));
    80020580:	00003797          	auipc	a5,0x3
    80020584:	0007b783          	ld	a5,0(a5) # 80023580 <_GLOBAL_OFFSET_TABLE_+0x18>
    80020588:	10579073          	csrw	stvec,a5
    MemoryAllocator::initialize();
    8002058c:	00000097          	auipc	ra,0x0
    80020590:	d4c080e7          	jalr	-692(ra) # 800202d8 <_ZN15MemoryAllocator10initializeEv>
    
    Queue<char>* q = new Queue<char>();
    80020594:	01000513          	li	a0,16
    80020598:	00000097          	auipc	ra,0x0
    8002059c:	cf0080e7          	jalr	-784(ra) # 80020288 <_Znwm>
    800205a0:	00050913          	mv	s2,a0

template <typename T>
class Queue{
public:
    Queue(){
        head = tail = nullptr;
    800205a4:	00053423          	sd	zero,8(a0)
    800205a8:	00053023          	sd	zero,0(a0)
    char i = 'x';
    char ii = 'y';
    q->put(i);
    800205ac:	07800593          	li	a1,120
    800205b0:	00000097          	auipc	ra,0x0
    800205b4:	118080e7          	jalr	280(ra) # 800206c8 <_ZN5QueueIcE3putEc>
    q->put(ii);
    800205b8:	07900593          	li	a1,121
    800205bc:	00090513          	mv	a0,s2
    800205c0:	00000097          	auipc	ra,0x0
    800205c4:	108080e7          	jalr	264(ra) # 800206c8 <_ZN5QueueIcE3putEc>
            tail = e;
        }
    }

    T get(){
        Enqueued* r = head;
    800205c8:	00093783          	ld	a5,0(s2)
        if(head) head = head->next;
    800205cc:	00078663          	beqz	a5,800205d8 <main+0x70>
    800205d0:	0087b783          	ld	a5,8(a5)
    800205d4:	00f93023          	sd	a5,0(s2)
        Enqueued* r = head;
    800205d8:	00093783          	ld	a5,0(s2)
        if(head) head = head->next;
    800205dc:	00078663          	beqz	a5,800205e8 <main+0x80>
    800205e0:	0087b703          	ld	a4,8(a5)
    800205e4:	00e93023          	sd	a4,0(s2)
        return r->data;
    800205e8:	0007c703          	lbu	a4,0(a5)

    q->get();

    if(q->get() != ii) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');
    800205ec:	07900793          	li	a5,121
    800205f0:	06f71863          	bne	a4,a5,80020660 <main+0xf8>
    800205f4:	05500513          	li	a0,85
    800205f8:	00002097          	auipc	ra,0x2
    800205fc:	204080e7          	jalr	516(ra) # 800227fc <__putc>
    80020600:	05300513          	li	a0,83
    80020604:	00002097          	auipc	ra,0x2
    80020608:	1f8080e7          	jalr	504(ra) # 800227fc <__putc>
    8002060c:	05000513          	li	a0,80
    80020610:	00002097          	auipc	ra,0x2
    80020614:	1ec080e7          	jalr	492(ra) # 800227fc <__putc>
    80020618:	04500513          	li	a0,69
    8002061c:	00002097          	auipc	ra,0x2
    80020620:	1e0080e7          	jalr	480(ra) # 800227fc <__putc>
    80020624:	04800513          	li	a0,72
    80020628:	00002097          	auipc	ra,0x2
    8002062c:	1d4080e7          	jalr	468(ra) # 800227fc <__putc>

    if(q) __putc('X');
    80020630:	00090863          	beqz	s2,80020640 <main+0xd8>
    80020634:	05800513          	li	a0,88
    80020638:	00002097          	auipc	ra,0x2
    8002063c:	1c4080e7          	jalr	452(ra) # 800227fc <__putc>
    delete q;
    80020640:	04090463          	beqz	s2,80020688 <main+0x120>
    }

    ~Queue(){
        Enqueued* e = head;
    80020644:	00093503          	ld	a0,0(s2)
        while(e){
    80020648:	02050a63          	beqz	a0,8002067c <main+0x114>
            Enqueued* toDelete = e;
            e = e->next;
    8002064c:	00853483          	ld	s1,8(a0)

            delete toDelete;
    80020650:	00000097          	auipc	ra,0x0
    80020654:	c60080e7          	jalr	-928(ra) # 800202b0 <_ZdlPv>
    80020658:	00048513          	mv	a0,s1
    8002065c:	fedff06f          	j	80020648 <main+0xe0>
    if(q->get() != ii) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');
    80020660:	04e00513          	li	a0,78
    80020664:	00002097          	auipc	ra,0x2
    80020668:	198080e7          	jalr	408(ra) # 800227fc <__putc>
    8002066c:	04500513          	li	a0,69
    80020670:	00002097          	auipc	ra,0x2
    80020674:	18c080e7          	jalr	396(ra) # 800227fc <__putc>
    80020678:	f7dff06f          	j	800205f4 <main+0x8c>
    delete q;
    8002067c:	00090513          	mv	a0,s2
    80020680:	00000097          	auipc	ra,0x0
    80020684:	c30080e7          	jalr	-976(ra) # 800202b0 <_ZdlPv>
    q->put('X');
    80020688:	05800593          	li	a1,88
    8002068c:	00090513          	mv	a0,s2
    80020690:	00000097          	auipc	ra,0x0
    80020694:	038080e7          	jalr	56(ra) # 800206c8 <_ZN5QueueIcE3putEc>
    if(q == nullptr) __putc('Y');
    80020698:	02090063          	beqz	s2,800206b8 <main+0x150>

    return 0;
    8002069c:	00000513          	li	a0,0
    800206a0:	01813083          	ld	ra,24(sp)
    800206a4:	01013403          	ld	s0,16(sp)
    800206a8:	00813483          	ld	s1,8(sp)
    800206ac:	00013903          	ld	s2,0(sp)
    800206b0:	02010113          	addi	sp,sp,32
    800206b4:	00008067          	ret
    if(q == nullptr) __putc('Y');
    800206b8:	05900513          	li	a0,89
    800206bc:	00002097          	auipc	ra,0x2
    800206c0:	140080e7          	jalr	320(ra) # 800227fc <__putc>
    800206c4:	fd9ff06f          	j	8002069c <main+0x134>

00000000800206c8 <_ZN5QueueIcE3putEc>:
    void put(T data){
    800206c8:	fe010113          	addi	sp,sp,-32
    800206cc:	00113c23          	sd	ra,24(sp)
    800206d0:	00813823          	sd	s0,16(sp)
    800206d4:	00913423          	sd	s1,8(sp)
    800206d8:	01213023          	sd	s2,0(sp)
    800206dc:	02010413          	addi	s0,sp,32
    800206e0:	00050493          	mv	s1,a0
    800206e4:	00058913          	mv	s2,a1
        Enqueued* e = new Enqueued(data, nullptr);
    800206e8:	01000513          	li	a0,16
    800206ec:	00000097          	auipc	ra,0x0
    800206f0:	b9c080e7          	jalr	-1124(ra) # 80020288 <_Znwm>
        Enqueued(T argdata, Enqueued* argnext = nullptr) : data(argdata), next(argnext) {}
    800206f4:	01250023          	sb	s2,0(a0)
    800206f8:	00053423          	sd	zero,8(a0)
        if(head == nullptr){
    800206fc:	0004b783          	ld	a5,0(s1)
    80020700:	02078663          	beqz	a5,8002072c <_ZN5QueueIcE3putEc+0x64>
            tail->next = e;
    80020704:	0084b783          	ld	a5,8(s1)
    80020708:	00a7b423          	sd	a0,8(a5)
            e->next = nullptr;
    8002070c:	00053423          	sd	zero,8(a0)
            tail = e;
    80020710:	00a4b423          	sd	a0,8(s1)
    }
    80020714:	01813083          	ld	ra,24(sp)
    80020718:	01013403          	ld	s0,16(sp)
    8002071c:	00813483          	ld	s1,8(sp)
    80020720:	00013903          	ld	s2,0(sp)
    80020724:	02010113          	addi	sp,sp,32
    80020728:	00008067          	ret
            head = e;
    8002072c:	00a4b023          	sd	a0,0(s1)
            tail = head;
    80020730:	00a4b423          	sd	a0,8(s1)
    80020734:	fe1ff06f          	j	80020714 <_ZN5QueueIcE3putEc+0x4c>

0000000080020738 <start>:
    80020738:	ff010113          	addi	sp,sp,-16
    8002073c:	00813423          	sd	s0,8(sp)
    80020740:	01010413          	addi	s0,sp,16
    80020744:	300027f3          	csrr	a5,mstatus
    80020748:	ffffe737          	lui	a4,0xffffe
    8002074c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffd9f9f>
    80020750:	00e7f7b3          	and	a5,a5,a4
    80020754:	00001737          	lui	a4,0x1
    80020758:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8002075c:	00e7e7b3          	or	a5,a5,a4
    80020760:	30079073          	csrw	mstatus,a5
    80020764:	00000797          	auipc	a5,0x0
    80020768:	16078793          	addi	a5,a5,352 # 800208c4 <system_main>
    8002076c:	34179073          	csrw	mepc,a5
    80020770:	00000793          	li	a5,0
    80020774:	18079073          	csrw	satp,a5
    80020778:	000107b7          	lui	a5,0x10
    8002077c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80020780:	30279073          	csrw	medeleg,a5
    80020784:	30379073          	csrw	mideleg,a5
    80020788:	104027f3          	csrr	a5,sie
    8002078c:	2227e793          	ori	a5,a5,546
    80020790:	10479073          	csrw	sie,a5
    80020794:	fff00793          	li	a5,-1
    80020798:	00a7d793          	srli	a5,a5,0xa
    8002079c:	3b079073          	csrw	pmpaddr0,a5
    800207a0:	00f00793          	li	a5,15
    800207a4:	3a079073          	csrw	pmpcfg0,a5
    800207a8:	f14027f3          	csrr	a5,mhartid
    800207ac:	0200c737          	lui	a4,0x200c
    800207b0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800207b4:	0007869b          	sext.w	a3,a5
    800207b8:	00269713          	slli	a4,a3,0x2
    800207bc:	000f4637          	lui	a2,0xf4
    800207c0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800207c4:	00d70733          	add	a4,a4,a3
    800207c8:	0037979b          	slliw	a5,a5,0x3
    800207cc:	020046b7          	lui	a3,0x2004
    800207d0:	00d787b3          	add	a5,a5,a3
    800207d4:	00c585b3          	add	a1,a1,a2
    800207d8:	00371693          	slli	a3,a4,0x3
    800207dc:	00003717          	auipc	a4,0x3
    800207e0:	e2470713          	addi	a4,a4,-476 # 80023600 <timer_scratch>
    800207e4:	00b7b023          	sd	a1,0(a5)
    800207e8:	00d70733          	add	a4,a4,a3
    800207ec:	00f73c23          	sd	a5,24(a4)
    800207f0:	02c73023          	sd	a2,32(a4)
    800207f4:	34071073          	csrw	mscratch,a4
    800207f8:	00000797          	auipc	a5,0x0
    800207fc:	6e878793          	addi	a5,a5,1768 # 80020ee0 <timervec>
    80020800:	30579073          	csrw	mtvec,a5
    80020804:	300027f3          	csrr	a5,mstatus
    80020808:	0087e793          	ori	a5,a5,8
    8002080c:	30079073          	csrw	mstatus,a5
    80020810:	304027f3          	csrr	a5,mie
    80020814:	0807e793          	ori	a5,a5,128
    80020818:	30479073          	csrw	mie,a5
    8002081c:	f14027f3          	csrr	a5,mhartid
    80020820:	0007879b          	sext.w	a5,a5
    80020824:	00078213          	mv	tp,a5
    80020828:	30200073          	mret
    8002082c:	00813403          	ld	s0,8(sp)
    80020830:	01010113          	addi	sp,sp,16
    80020834:	00008067          	ret

0000000080020838 <timerinit>:
    80020838:	ff010113          	addi	sp,sp,-16
    8002083c:	00813423          	sd	s0,8(sp)
    80020840:	01010413          	addi	s0,sp,16
    80020844:	f14027f3          	csrr	a5,mhartid
    80020848:	0200c737          	lui	a4,0x200c
    8002084c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80020850:	0007869b          	sext.w	a3,a5
    80020854:	00269713          	slli	a4,a3,0x2
    80020858:	000f4637          	lui	a2,0xf4
    8002085c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80020860:	00d70733          	add	a4,a4,a3
    80020864:	0037979b          	slliw	a5,a5,0x3
    80020868:	020046b7          	lui	a3,0x2004
    8002086c:	00d787b3          	add	a5,a5,a3
    80020870:	00c585b3          	add	a1,a1,a2
    80020874:	00371693          	slli	a3,a4,0x3
    80020878:	00003717          	auipc	a4,0x3
    8002087c:	d8870713          	addi	a4,a4,-632 # 80023600 <timer_scratch>
    80020880:	00b7b023          	sd	a1,0(a5)
    80020884:	00d70733          	add	a4,a4,a3
    80020888:	00f73c23          	sd	a5,24(a4)
    8002088c:	02c73023          	sd	a2,32(a4)
    80020890:	34071073          	csrw	mscratch,a4
    80020894:	00000797          	auipc	a5,0x0
    80020898:	64c78793          	addi	a5,a5,1612 # 80020ee0 <timervec>
    8002089c:	30579073          	csrw	mtvec,a5
    800208a0:	300027f3          	csrr	a5,mstatus
    800208a4:	0087e793          	ori	a5,a5,8
    800208a8:	30079073          	csrw	mstatus,a5
    800208ac:	304027f3          	csrr	a5,mie
    800208b0:	0807e793          	ori	a5,a5,128
    800208b4:	30479073          	csrw	mie,a5
    800208b8:	00813403          	ld	s0,8(sp)
    800208bc:	01010113          	addi	sp,sp,16
    800208c0:	00008067          	ret

00000000800208c4 <system_main>:
    800208c4:	fe010113          	addi	sp,sp,-32
    800208c8:	00813823          	sd	s0,16(sp)
    800208cc:	00913423          	sd	s1,8(sp)
    800208d0:	00113c23          	sd	ra,24(sp)
    800208d4:	02010413          	addi	s0,sp,32
    800208d8:	00000097          	auipc	ra,0x0
    800208dc:	0c4080e7          	jalr	196(ra) # 8002099c <cpuid>
    800208e0:	00003497          	auipc	s1,0x3
    800208e4:	cd048493          	addi	s1,s1,-816 # 800235b0 <started>
    800208e8:	02050263          	beqz	a0,8002090c <system_main+0x48>
    800208ec:	0004a783          	lw	a5,0(s1)
    800208f0:	0007879b          	sext.w	a5,a5
    800208f4:	fe078ce3          	beqz	a5,800208ec <system_main+0x28>
    800208f8:	0ff0000f          	fence
    800208fc:	00002517          	auipc	a0,0x2
    80020900:	75450513          	addi	a0,a0,1876 # 80023050 <CONSOLE_STATUS+0x40>
    80020904:	00001097          	auipc	ra,0x1
    80020908:	a78080e7          	jalr	-1416(ra) # 8002137c <panic>
    8002090c:	00001097          	auipc	ra,0x1
    80020910:	9cc080e7          	jalr	-1588(ra) # 800212d8 <consoleinit>
    80020914:	00001097          	auipc	ra,0x1
    80020918:	158080e7          	jalr	344(ra) # 80021a6c <printfinit>
    8002091c:	00003517          	auipc	a0,0x3
    80020920:	81450513          	addi	a0,a0,-2028 # 80023130 <CONSOLE_STATUS+0x120>
    80020924:	00001097          	auipc	ra,0x1
    80020928:	ab4080e7          	jalr	-1356(ra) # 800213d8 <__printf>
    8002092c:	00002517          	auipc	a0,0x2
    80020930:	6f450513          	addi	a0,a0,1780 # 80023020 <CONSOLE_STATUS+0x10>
    80020934:	00001097          	auipc	ra,0x1
    80020938:	aa4080e7          	jalr	-1372(ra) # 800213d8 <__printf>
    8002093c:	00002517          	auipc	a0,0x2
    80020940:	7f450513          	addi	a0,a0,2036 # 80023130 <CONSOLE_STATUS+0x120>
    80020944:	00001097          	auipc	ra,0x1
    80020948:	a94080e7          	jalr	-1388(ra) # 800213d8 <__printf>
    8002094c:	00001097          	auipc	ra,0x1
    80020950:	4ac080e7          	jalr	1196(ra) # 80021df8 <kinit>
    80020954:	00000097          	auipc	ra,0x0
    80020958:	148080e7          	jalr	328(ra) # 80020a9c <trapinit>
    8002095c:	00000097          	auipc	ra,0x0
    80020960:	16c080e7          	jalr	364(ra) # 80020ac8 <trapinithart>
    80020964:	00000097          	auipc	ra,0x0
    80020968:	5bc080e7          	jalr	1468(ra) # 80020f20 <plicinit>
    8002096c:	00000097          	auipc	ra,0x0
    80020970:	5dc080e7          	jalr	1500(ra) # 80020f48 <plicinithart>
    80020974:	00000097          	auipc	ra,0x0
    80020978:	078080e7          	jalr	120(ra) # 800209ec <userinit>
    8002097c:	0ff0000f          	fence
    80020980:	00100793          	li	a5,1
    80020984:	00002517          	auipc	a0,0x2
    80020988:	6b450513          	addi	a0,a0,1716 # 80023038 <CONSOLE_STATUS+0x28>
    8002098c:	00f4a023          	sw	a5,0(s1)
    80020990:	00001097          	auipc	ra,0x1
    80020994:	a48080e7          	jalr	-1464(ra) # 800213d8 <__printf>
    80020998:	0000006f          	j	80020998 <system_main+0xd4>

000000008002099c <cpuid>:
    8002099c:	ff010113          	addi	sp,sp,-16
    800209a0:	00813423          	sd	s0,8(sp)
    800209a4:	01010413          	addi	s0,sp,16
    800209a8:	00020513          	mv	a0,tp
    800209ac:	00813403          	ld	s0,8(sp)
    800209b0:	0005051b          	sext.w	a0,a0
    800209b4:	01010113          	addi	sp,sp,16
    800209b8:	00008067          	ret

00000000800209bc <mycpu>:
    800209bc:	ff010113          	addi	sp,sp,-16
    800209c0:	00813423          	sd	s0,8(sp)
    800209c4:	01010413          	addi	s0,sp,16
    800209c8:	00020793          	mv	a5,tp
    800209cc:	00813403          	ld	s0,8(sp)
    800209d0:	0007879b          	sext.w	a5,a5
    800209d4:	00779793          	slli	a5,a5,0x7
    800209d8:	00004517          	auipc	a0,0x4
    800209dc:	c5850513          	addi	a0,a0,-936 # 80024630 <cpus>
    800209e0:	00f50533          	add	a0,a0,a5
    800209e4:	01010113          	addi	sp,sp,16
    800209e8:	00008067          	ret

00000000800209ec <userinit>:
    800209ec:	ff010113          	addi	sp,sp,-16
    800209f0:	00813423          	sd	s0,8(sp)
    800209f4:	01010413          	addi	s0,sp,16
    800209f8:	00813403          	ld	s0,8(sp)
    800209fc:	01010113          	addi	sp,sp,16
    80020a00:	00000317          	auipc	t1,0x0
    80020a04:	b6830067          	jr	-1176(t1) # 80020568 <main>

0000000080020a08 <either_copyout>:
    80020a08:	ff010113          	addi	sp,sp,-16
    80020a0c:	00813023          	sd	s0,0(sp)
    80020a10:	00113423          	sd	ra,8(sp)
    80020a14:	01010413          	addi	s0,sp,16
    80020a18:	02051663          	bnez	a0,80020a44 <either_copyout+0x3c>
    80020a1c:	00058513          	mv	a0,a1
    80020a20:	00060593          	mv	a1,a2
    80020a24:	0006861b          	sext.w	a2,a3
    80020a28:	00002097          	auipc	ra,0x2
    80020a2c:	c5c080e7          	jalr	-932(ra) # 80022684 <__memmove>
    80020a30:	00813083          	ld	ra,8(sp)
    80020a34:	00013403          	ld	s0,0(sp)
    80020a38:	00000513          	li	a0,0
    80020a3c:	01010113          	addi	sp,sp,16
    80020a40:	00008067          	ret
    80020a44:	00002517          	auipc	a0,0x2
    80020a48:	63450513          	addi	a0,a0,1588 # 80023078 <CONSOLE_STATUS+0x68>
    80020a4c:	00001097          	auipc	ra,0x1
    80020a50:	930080e7          	jalr	-1744(ra) # 8002137c <panic>

0000000080020a54 <either_copyin>:
    80020a54:	ff010113          	addi	sp,sp,-16
    80020a58:	00813023          	sd	s0,0(sp)
    80020a5c:	00113423          	sd	ra,8(sp)
    80020a60:	01010413          	addi	s0,sp,16
    80020a64:	02059463          	bnez	a1,80020a8c <either_copyin+0x38>
    80020a68:	00060593          	mv	a1,a2
    80020a6c:	0006861b          	sext.w	a2,a3
    80020a70:	00002097          	auipc	ra,0x2
    80020a74:	c14080e7          	jalr	-1004(ra) # 80022684 <__memmove>
    80020a78:	00813083          	ld	ra,8(sp)
    80020a7c:	00013403          	ld	s0,0(sp)
    80020a80:	00000513          	li	a0,0
    80020a84:	01010113          	addi	sp,sp,16
    80020a88:	00008067          	ret
    80020a8c:	00002517          	auipc	a0,0x2
    80020a90:	61450513          	addi	a0,a0,1556 # 800230a0 <CONSOLE_STATUS+0x90>
    80020a94:	00001097          	auipc	ra,0x1
    80020a98:	8e8080e7          	jalr	-1816(ra) # 8002137c <panic>

0000000080020a9c <trapinit>:
    80020a9c:	ff010113          	addi	sp,sp,-16
    80020aa0:	00813423          	sd	s0,8(sp)
    80020aa4:	01010413          	addi	s0,sp,16
    80020aa8:	00813403          	ld	s0,8(sp)
    80020aac:	00002597          	auipc	a1,0x2
    80020ab0:	61c58593          	addi	a1,a1,1564 # 800230c8 <CONSOLE_STATUS+0xb8>
    80020ab4:	00004517          	auipc	a0,0x4
    80020ab8:	bfc50513          	addi	a0,a0,-1028 # 800246b0 <tickslock>
    80020abc:	01010113          	addi	sp,sp,16
    80020ac0:	00001317          	auipc	t1,0x1
    80020ac4:	5c830067          	jr	1480(t1) # 80022088 <initlock>

0000000080020ac8 <trapinithart>:
    80020ac8:	ff010113          	addi	sp,sp,-16
    80020acc:	00813423          	sd	s0,8(sp)
    80020ad0:	01010413          	addi	s0,sp,16
    80020ad4:	00000797          	auipc	a5,0x0
    80020ad8:	2fc78793          	addi	a5,a5,764 # 80020dd0 <kernelvec>
    80020adc:	10579073          	csrw	stvec,a5
    80020ae0:	00813403          	ld	s0,8(sp)
    80020ae4:	01010113          	addi	sp,sp,16
    80020ae8:	00008067          	ret

0000000080020aec <usertrap>:
    80020aec:	ff010113          	addi	sp,sp,-16
    80020af0:	00813423          	sd	s0,8(sp)
    80020af4:	01010413          	addi	s0,sp,16
    80020af8:	00813403          	ld	s0,8(sp)
    80020afc:	01010113          	addi	sp,sp,16
    80020b00:	00008067          	ret

0000000080020b04 <usertrapret>:
    80020b04:	ff010113          	addi	sp,sp,-16
    80020b08:	00813423          	sd	s0,8(sp)
    80020b0c:	01010413          	addi	s0,sp,16
    80020b10:	00813403          	ld	s0,8(sp)
    80020b14:	01010113          	addi	sp,sp,16
    80020b18:	00008067          	ret

0000000080020b1c <kerneltrap>:
    80020b1c:	fe010113          	addi	sp,sp,-32
    80020b20:	00813823          	sd	s0,16(sp)
    80020b24:	00113c23          	sd	ra,24(sp)
    80020b28:	00913423          	sd	s1,8(sp)
    80020b2c:	02010413          	addi	s0,sp,32
    80020b30:	142025f3          	csrr	a1,scause
    80020b34:	100027f3          	csrr	a5,sstatus
    80020b38:	0027f793          	andi	a5,a5,2
    80020b3c:	10079c63          	bnez	a5,80020c54 <kerneltrap+0x138>
    80020b40:	142027f3          	csrr	a5,scause
    80020b44:	0207ce63          	bltz	a5,80020b80 <kerneltrap+0x64>
    80020b48:	00002517          	auipc	a0,0x2
    80020b4c:	5c850513          	addi	a0,a0,1480 # 80023110 <CONSOLE_STATUS+0x100>
    80020b50:	00001097          	auipc	ra,0x1
    80020b54:	888080e7          	jalr	-1912(ra) # 800213d8 <__printf>
    80020b58:	141025f3          	csrr	a1,sepc
    80020b5c:	14302673          	csrr	a2,stval
    80020b60:	00002517          	auipc	a0,0x2
    80020b64:	5c050513          	addi	a0,a0,1472 # 80023120 <CONSOLE_STATUS+0x110>
    80020b68:	00001097          	auipc	ra,0x1
    80020b6c:	870080e7          	jalr	-1936(ra) # 800213d8 <__printf>
    80020b70:	00002517          	auipc	a0,0x2
    80020b74:	5c850513          	addi	a0,a0,1480 # 80023138 <CONSOLE_STATUS+0x128>
    80020b78:	00001097          	auipc	ra,0x1
    80020b7c:	804080e7          	jalr	-2044(ra) # 8002137c <panic>
    80020b80:	0ff7f713          	andi	a4,a5,255
    80020b84:	00900693          	li	a3,9
    80020b88:	04d70063          	beq	a4,a3,80020bc8 <kerneltrap+0xac>
    80020b8c:	fff00713          	li	a4,-1
    80020b90:	03f71713          	slli	a4,a4,0x3f
    80020b94:	00170713          	addi	a4,a4,1
    80020b98:	fae798e3          	bne	a5,a4,80020b48 <kerneltrap+0x2c>
    80020b9c:	00000097          	auipc	ra,0x0
    80020ba0:	e00080e7          	jalr	-512(ra) # 8002099c <cpuid>
    80020ba4:	06050663          	beqz	a0,80020c10 <kerneltrap+0xf4>
    80020ba8:	144027f3          	csrr	a5,sip
    80020bac:	ffd7f793          	andi	a5,a5,-3
    80020bb0:	14479073          	csrw	sip,a5
    80020bb4:	01813083          	ld	ra,24(sp)
    80020bb8:	01013403          	ld	s0,16(sp)
    80020bbc:	00813483          	ld	s1,8(sp)
    80020bc0:	02010113          	addi	sp,sp,32
    80020bc4:	00008067          	ret
    80020bc8:	00000097          	auipc	ra,0x0
    80020bcc:	3cc080e7          	jalr	972(ra) # 80020f94 <plic_claim>
    80020bd0:	00a00793          	li	a5,10
    80020bd4:	00050493          	mv	s1,a0
    80020bd8:	06f50863          	beq	a0,a5,80020c48 <kerneltrap+0x12c>
    80020bdc:	fc050ce3          	beqz	a0,80020bb4 <kerneltrap+0x98>
    80020be0:	00050593          	mv	a1,a0
    80020be4:	00002517          	auipc	a0,0x2
    80020be8:	50c50513          	addi	a0,a0,1292 # 800230f0 <CONSOLE_STATUS+0xe0>
    80020bec:	00000097          	auipc	ra,0x0
    80020bf0:	7ec080e7          	jalr	2028(ra) # 800213d8 <__printf>
    80020bf4:	01013403          	ld	s0,16(sp)
    80020bf8:	01813083          	ld	ra,24(sp)
    80020bfc:	00048513          	mv	a0,s1
    80020c00:	00813483          	ld	s1,8(sp)
    80020c04:	02010113          	addi	sp,sp,32
    80020c08:	00000317          	auipc	t1,0x0
    80020c0c:	3c430067          	jr	964(t1) # 80020fcc <plic_complete>
    80020c10:	00004517          	auipc	a0,0x4
    80020c14:	aa050513          	addi	a0,a0,-1376 # 800246b0 <tickslock>
    80020c18:	00001097          	auipc	ra,0x1
    80020c1c:	494080e7          	jalr	1172(ra) # 800220ac <acquire>
    80020c20:	00003717          	auipc	a4,0x3
    80020c24:	99470713          	addi	a4,a4,-1644 # 800235b4 <ticks>
    80020c28:	00072783          	lw	a5,0(a4)
    80020c2c:	00004517          	auipc	a0,0x4
    80020c30:	a8450513          	addi	a0,a0,-1404 # 800246b0 <tickslock>
    80020c34:	0017879b          	addiw	a5,a5,1
    80020c38:	00f72023          	sw	a5,0(a4)
    80020c3c:	00001097          	auipc	ra,0x1
    80020c40:	53c080e7          	jalr	1340(ra) # 80022178 <release>
    80020c44:	f65ff06f          	j	80020ba8 <kerneltrap+0x8c>
    80020c48:	00001097          	auipc	ra,0x1
    80020c4c:	098080e7          	jalr	152(ra) # 80021ce0 <uartintr>
    80020c50:	fa5ff06f          	j	80020bf4 <kerneltrap+0xd8>
    80020c54:	00002517          	auipc	a0,0x2
    80020c58:	47c50513          	addi	a0,a0,1148 # 800230d0 <CONSOLE_STATUS+0xc0>
    80020c5c:	00000097          	auipc	ra,0x0
    80020c60:	720080e7          	jalr	1824(ra) # 8002137c <panic>

0000000080020c64 <clockintr>:
    80020c64:	fe010113          	addi	sp,sp,-32
    80020c68:	00813823          	sd	s0,16(sp)
    80020c6c:	00913423          	sd	s1,8(sp)
    80020c70:	00113c23          	sd	ra,24(sp)
    80020c74:	02010413          	addi	s0,sp,32
    80020c78:	00004497          	auipc	s1,0x4
    80020c7c:	a3848493          	addi	s1,s1,-1480 # 800246b0 <tickslock>
    80020c80:	00048513          	mv	a0,s1
    80020c84:	00001097          	auipc	ra,0x1
    80020c88:	428080e7          	jalr	1064(ra) # 800220ac <acquire>
    80020c8c:	00003717          	auipc	a4,0x3
    80020c90:	92870713          	addi	a4,a4,-1752 # 800235b4 <ticks>
    80020c94:	00072783          	lw	a5,0(a4)
    80020c98:	01013403          	ld	s0,16(sp)
    80020c9c:	01813083          	ld	ra,24(sp)
    80020ca0:	00048513          	mv	a0,s1
    80020ca4:	0017879b          	addiw	a5,a5,1
    80020ca8:	00813483          	ld	s1,8(sp)
    80020cac:	00f72023          	sw	a5,0(a4)
    80020cb0:	02010113          	addi	sp,sp,32
    80020cb4:	00001317          	auipc	t1,0x1
    80020cb8:	4c430067          	jr	1220(t1) # 80022178 <release>

0000000080020cbc <devintr>:
    80020cbc:	142027f3          	csrr	a5,scause
    80020cc0:	00000513          	li	a0,0
    80020cc4:	0007c463          	bltz	a5,80020ccc <devintr+0x10>
    80020cc8:	00008067          	ret
    80020ccc:	fe010113          	addi	sp,sp,-32
    80020cd0:	00813823          	sd	s0,16(sp)
    80020cd4:	00113c23          	sd	ra,24(sp)
    80020cd8:	00913423          	sd	s1,8(sp)
    80020cdc:	02010413          	addi	s0,sp,32
    80020ce0:	0ff7f713          	andi	a4,a5,255
    80020ce4:	00900693          	li	a3,9
    80020ce8:	04d70c63          	beq	a4,a3,80020d40 <devintr+0x84>
    80020cec:	fff00713          	li	a4,-1
    80020cf0:	03f71713          	slli	a4,a4,0x3f
    80020cf4:	00170713          	addi	a4,a4,1
    80020cf8:	00e78c63          	beq	a5,a4,80020d10 <devintr+0x54>
    80020cfc:	01813083          	ld	ra,24(sp)
    80020d00:	01013403          	ld	s0,16(sp)
    80020d04:	00813483          	ld	s1,8(sp)
    80020d08:	02010113          	addi	sp,sp,32
    80020d0c:	00008067          	ret
    80020d10:	00000097          	auipc	ra,0x0
    80020d14:	c8c080e7          	jalr	-884(ra) # 8002099c <cpuid>
    80020d18:	06050663          	beqz	a0,80020d84 <devintr+0xc8>
    80020d1c:	144027f3          	csrr	a5,sip
    80020d20:	ffd7f793          	andi	a5,a5,-3
    80020d24:	14479073          	csrw	sip,a5
    80020d28:	01813083          	ld	ra,24(sp)
    80020d2c:	01013403          	ld	s0,16(sp)
    80020d30:	00813483          	ld	s1,8(sp)
    80020d34:	00200513          	li	a0,2
    80020d38:	02010113          	addi	sp,sp,32
    80020d3c:	00008067          	ret
    80020d40:	00000097          	auipc	ra,0x0
    80020d44:	254080e7          	jalr	596(ra) # 80020f94 <plic_claim>
    80020d48:	00a00793          	li	a5,10
    80020d4c:	00050493          	mv	s1,a0
    80020d50:	06f50663          	beq	a0,a5,80020dbc <devintr+0x100>
    80020d54:	00100513          	li	a0,1
    80020d58:	fa0482e3          	beqz	s1,80020cfc <devintr+0x40>
    80020d5c:	00048593          	mv	a1,s1
    80020d60:	00002517          	auipc	a0,0x2
    80020d64:	39050513          	addi	a0,a0,912 # 800230f0 <CONSOLE_STATUS+0xe0>
    80020d68:	00000097          	auipc	ra,0x0
    80020d6c:	670080e7          	jalr	1648(ra) # 800213d8 <__printf>
    80020d70:	00048513          	mv	a0,s1
    80020d74:	00000097          	auipc	ra,0x0
    80020d78:	258080e7          	jalr	600(ra) # 80020fcc <plic_complete>
    80020d7c:	00100513          	li	a0,1
    80020d80:	f7dff06f          	j	80020cfc <devintr+0x40>
    80020d84:	00004517          	auipc	a0,0x4
    80020d88:	92c50513          	addi	a0,a0,-1748 # 800246b0 <tickslock>
    80020d8c:	00001097          	auipc	ra,0x1
    80020d90:	320080e7          	jalr	800(ra) # 800220ac <acquire>
    80020d94:	00003717          	auipc	a4,0x3
    80020d98:	82070713          	addi	a4,a4,-2016 # 800235b4 <ticks>
    80020d9c:	00072783          	lw	a5,0(a4)
    80020da0:	00004517          	auipc	a0,0x4
    80020da4:	91050513          	addi	a0,a0,-1776 # 800246b0 <tickslock>
    80020da8:	0017879b          	addiw	a5,a5,1
    80020dac:	00f72023          	sw	a5,0(a4)
    80020db0:	00001097          	auipc	ra,0x1
    80020db4:	3c8080e7          	jalr	968(ra) # 80022178 <release>
    80020db8:	f65ff06f          	j	80020d1c <devintr+0x60>
    80020dbc:	00001097          	auipc	ra,0x1
    80020dc0:	f24080e7          	jalr	-220(ra) # 80021ce0 <uartintr>
    80020dc4:	fadff06f          	j	80020d70 <devintr+0xb4>
	...

0000000080020dd0 <kernelvec>:
    80020dd0:	f0010113          	addi	sp,sp,-256
    80020dd4:	00113023          	sd	ra,0(sp)
    80020dd8:	00213423          	sd	sp,8(sp)
    80020ddc:	00313823          	sd	gp,16(sp)
    80020de0:	00413c23          	sd	tp,24(sp)
    80020de4:	02513023          	sd	t0,32(sp)
    80020de8:	02613423          	sd	t1,40(sp)
    80020dec:	02713823          	sd	t2,48(sp)
    80020df0:	02813c23          	sd	s0,56(sp)
    80020df4:	04913023          	sd	s1,64(sp)
    80020df8:	04a13423          	sd	a0,72(sp)
    80020dfc:	04b13823          	sd	a1,80(sp)
    80020e00:	04c13c23          	sd	a2,88(sp)
    80020e04:	06d13023          	sd	a3,96(sp)
    80020e08:	06e13423          	sd	a4,104(sp)
    80020e0c:	06f13823          	sd	a5,112(sp)
    80020e10:	07013c23          	sd	a6,120(sp)
    80020e14:	09113023          	sd	a7,128(sp)
    80020e18:	09213423          	sd	s2,136(sp)
    80020e1c:	09313823          	sd	s3,144(sp)
    80020e20:	09413c23          	sd	s4,152(sp)
    80020e24:	0b513023          	sd	s5,160(sp)
    80020e28:	0b613423          	sd	s6,168(sp)
    80020e2c:	0b713823          	sd	s7,176(sp)
    80020e30:	0b813c23          	sd	s8,184(sp)
    80020e34:	0d913023          	sd	s9,192(sp)
    80020e38:	0da13423          	sd	s10,200(sp)
    80020e3c:	0db13823          	sd	s11,208(sp)
    80020e40:	0dc13c23          	sd	t3,216(sp)
    80020e44:	0fd13023          	sd	t4,224(sp)
    80020e48:	0fe13423          	sd	t5,232(sp)
    80020e4c:	0ff13823          	sd	t6,240(sp)
    80020e50:	ccdff0ef          	jal	ra,80020b1c <kerneltrap>
    80020e54:	00013083          	ld	ra,0(sp)
    80020e58:	00813103          	ld	sp,8(sp)
    80020e5c:	01013183          	ld	gp,16(sp)
    80020e60:	02013283          	ld	t0,32(sp)
    80020e64:	02813303          	ld	t1,40(sp)
    80020e68:	03013383          	ld	t2,48(sp)
    80020e6c:	03813403          	ld	s0,56(sp)
    80020e70:	04013483          	ld	s1,64(sp)
    80020e74:	04813503          	ld	a0,72(sp)
    80020e78:	05013583          	ld	a1,80(sp)
    80020e7c:	05813603          	ld	a2,88(sp)
    80020e80:	06013683          	ld	a3,96(sp)
    80020e84:	06813703          	ld	a4,104(sp)
    80020e88:	07013783          	ld	a5,112(sp)
    80020e8c:	07813803          	ld	a6,120(sp)
    80020e90:	08013883          	ld	a7,128(sp)
    80020e94:	08813903          	ld	s2,136(sp)
    80020e98:	09013983          	ld	s3,144(sp)
    80020e9c:	09813a03          	ld	s4,152(sp)
    80020ea0:	0a013a83          	ld	s5,160(sp)
    80020ea4:	0a813b03          	ld	s6,168(sp)
    80020ea8:	0b013b83          	ld	s7,176(sp)
    80020eac:	0b813c03          	ld	s8,184(sp)
    80020eb0:	0c013c83          	ld	s9,192(sp)
    80020eb4:	0c813d03          	ld	s10,200(sp)
    80020eb8:	0d013d83          	ld	s11,208(sp)
    80020ebc:	0d813e03          	ld	t3,216(sp)
    80020ec0:	0e013e83          	ld	t4,224(sp)
    80020ec4:	0e813f03          	ld	t5,232(sp)
    80020ec8:	0f013f83          	ld	t6,240(sp)
    80020ecc:	10010113          	addi	sp,sp,256
    80020ed0:	10200073          	sret
    80020ed4:	00000013          	nop
    80020ed8:	00000013          	nop
    80020edc:	00000013          	nop

0000000080020ee0 <timervec>:
    80020ee0:	34051573          	csrrw	a0,mscratch,a0
    80020ee4:	00b53023          	sd	a1,0(a0)
    80020ee8:	00c53423          	sd	a2,8(a0)
    80020eec:	00d53823          	sd	a3,16(a0)
    80020ef0:	01853583          	ld	a1,24(a0)
    80020ef4:	02053603          	ld	a2,32(a0)
    80020ef8:	0005b683          	ld	a3,0(a1)
    80020efc:	00c686b3          	add	a3,a3,a2
    80020f00:	00d5b023          	sd	a3,0(a1)
    80020f04:	00200593          	li	a1,2
    80020f08:	14459073          	csrw	sip,a1
    80020f0c:	01053683          	ld	a3,16(a0)
    80020f10:	00853603          	ld	a2,8(a0)
    80020f14:	00053583          	ld	a1,0(a0)
    80020f18:	34051573          	csrrw	a0,mscratch,a0
    80020f1c:	30200073          	mret

0000000080020f20 <plicinit>:
    80020f20:	ff010113          	addi	sp,sp,-16
    80020f24:	00813423          	sd	s0,8(sp)
    80020f28:	01010413          	addi	s0,sp,16
    80020f2c:	00813403          	ld	s0,8(sp)
    80020f30:	0c0007b7          	lui	a5,0xc000
    80020f34:	00100713          	li	a4,1
    80020f38:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80020f3c:	00e7a223          	sw	a4,4(a5)
    80020f40:	01010113          	addi	sp,sp,16
    80020f44:	00008067          	ret

0000000080020f48 <plicinithart>:
    80020f48:	ff010113          	addi	sp,sp,-16
    80020f4c:	00813023          	sd	s0,0(sp)
    80020f50:	00113423          	sd	ra,8(sp)
    80020f54:	01010413          	addi	s0,sp,16
    80020f58:	00000097          	auipc	ra,0x0
    80020f5c:	a44080e7          	jalr	-1468(ra) # 8002099c <cpuid>
    80020f60:	0085171b          	slliw	a4,a0,0x8
    80020f64:	0c0027b7          	lui	a5,0xc002
    80020f68:	00e787b3          	add	a5,a5,a4
    80020f6c:	40200713          	li	a4,1026
    80020f70:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80020f74:	00813083          	ld	ra,8(sp)
    80020f78:	00013403          	ld	s0,0(sp)
    80020f7c:	00d5151b          	slliw	a0,a0,0xd
    80020f80:	0c2017b7          	lui	a5,0xc201
    80020f84:	00a78533          	add	a0,a5,a0
    80020f88:	00052023          	sw	zero,0(a0)
    80020f8c:	01010113          	addi	sp,sp,16
    80020f90:	00008067          	ret

0000000080020f94 <plic_claim>:
    80020f94:	ff010113          	addi	sp,sp,-16
    80020f98:	00813023          	sd	s0,0(sp)
    80020f9c:	00113423          	sd	ra,8(sp)
    80020fa0:	01010413          	addi	s0,sp,16
    80020fa4:	00000097          	auipc	ra,0x0
    80020fa8:	9f8080e7          	jalr	-1544(ra) # 8002099c <cpuid>
    80020fac:	00813083          	ld	ra,8(sp)
    80020fb0:	00013403          	ld	s0,0(sp)
    80020fb4:	00d5151b          	slliw	a0,a0,0xd
    80020fb8:	0c2017b7          	lui	a5,0xc201
    80020fbc:	00a78533          	add	a0,a5,a0
    80020fc0:	00452503          	lw	a0,4(a0)
    80020fc4:	01010113          	addi	sp,sp,16
    80020fc8:	00008067          	ret

0000000080020fcc <plic_complete>:
    80020fcc:	fe010113          	addi	sp,sp,-32
    80020fd0:	00813823          	sd	s0,16(sp)
    80020fd4:	00913423          	sd	s1,8(sp)
    80020fd8:	00113c23          	sd	ra,24(sp)
    80020fdc:	02010413          	addi	s0,sp,32
    80020fe0:	00050493          	mv	s1,a0
    80020fe4:	00000097          	auipc	ra,0x0
    80020fe8:	9b8080e7          	jalr	-1608(ra) # 8002099c <cpuid>
    80020fec:	01813083          	ld	ra,24(sp)
    80020ff0:	01013403          	ld	s0,16(sp)
    80020ff4:	00d5179b          	slliw	a5,a0,0xd
    80020ff8:	0c201737          	lui	a4,0xc201
    80020ffc:	00f707b3          	add	a5,a4,a5
    80021000:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80021004:	00813483          	ld	s1,8(sp)
    80021008:	02010113          	addi	sp,sp,32
    8002100c:	00008067          	ret

0000000080021010 <consolewrite>:
    80021010:	fb010113          	addi	sp,sp,-80
    80021014:	04813023          	sd	s0,64(sp)
    80021018:	04113423          	sd	ra,72(sp)
    8002101c:	02913c23          	sd	s1,56(sp)
    80021020:	03213823          	sd	s2,48(sp)
    80021024:	03313423          	sd	s3,40(sp)
    80021028:	03413023          	sd	s4,32(sp)
    8002102c:	01513c23          	sd	s5,24(sp)
    80021030:	05010413          	addi	s0,sp,80
    80021034:	06c05c63          	blez	a2,800210ac <consolewrite+0x9c>
    80021038:	00060993          	mv	s3,a2
    8002103c:	00050a13          	mv	s4,a0
    80021040:	00058493          	mv	s1,a1
    80021044:	00000913          	li	s2,0
    80021048:	fff00a93          	li	s5,-1
    8002104c:	01c0006f          	j	80021068 <consolewrite+0x58>
    80021050:	fbf44503          	lbu	a0,-65(s0)
    80021054:	0019091b          	addiw	s2,s2,1
    80021058:	00148493          	addi	s1,s1,1
    8002105c:	00001097          	auipc	ra,0x1
    80021060:	a9c080e7          	jalr	-1380(ra) # 80021af8 <uartputc>
    80021064:	03298063          	beq	s3,s2,80021084 <consolewrite+0x74>
    80021068:	00048613          	mv	a2,s1
    8002106c:	00100693          	li	a3,1
    80021070:	000a0593          	mv	a1,s4
    80021074:	fbf40513          	addi	a0,s0,-65
    80021078:	00000097          	auipc	ra,0x0
    8002107c:	9dc080e7          	jalr	-1572(ra) # 80020a54 <either_copyin>
    80021080:	fd5518e3          	bne	a0,s5,80021050 <consolewrite+0x40>
    80021084:	04813083          	ld	ra,72(sp)
    80021088:	04013403          	ld	s0,64(sp)
    8002108c:	03813483          	ld	s1,56(sp)
    80021090:	02813983          	ld	s3,40(sp)
    80021094:	02013a03          	ld	s4,32(sp)
    80021098:	01813a83          	ld	s5,24(sp)
    8002109c:	00090513          	mv	a0,s2
    800210a0:	03013903          	ld	s2,48(sp)
    800210a4:	05010113          	addi	sp,sp,80
    800210a8:	00008067          	ret
    800210ac:	00000913          	li	s2,0
    800210b0:	fd5ff06f          	j	80021084 <consolewrite+0x74>

00000000800210b4 <consoleread>:
    800210b4:	f9010113          	addi	sp,sp,-112
    800210b8:	06813023          	sd	s0,96(sp)
    800210bc:	04913c23          	sd	s1,88(sp)
    800210c0:	05213823          	sd	s2,80(sp)
    800210c4:	05313423          	sd	s3,72(sp)
    800210c8:	05413023          	sd	s4,64(sp)
    800210cc:	03513c23          	sd	s5,56(sp)
    800210d0:	03613823          	sd	s6,48(sp)
    800210d4:	03713423          	sd	s7,40(sp)
    800210d8:	03813023          	sd	s8,32(sp)
    800210dc:	06113423          	sd	ra,104(sp)
    800210e0:	01913c23          	sd	s9,24(sp)
    800210e4:	07010413          	addi	s0,sp,112
    800210e8:	00060b93          	mv	s7,a2
    800210ec:	00050913          	mv	s2,a0
    800210f0:	00058c13          	mv	s8,a1
    800210f4:	00060b1b          	sext.w	s6,a2
    800210f8:	00003497          	auipc	s1,0x3
    800210fc:	5e048493          	addi	s1,s1,1504 # 800246d8 <cons>
    80021100:	00400993          	li	s3,4
    80021104:	fff00a13          	li	s4,-1
    80021108:	00a00a93          	li	s5,10
    8002110c:	05705e63          	blez	s7,80021168 <consoleread+0xb4>
    80021110:	09c4a703          	lw	a4,156(s1)
    80021114:	0984a783          	lw	a5,152(s1)
    80021118:	0007071b          	sext.w	a4,a4
    8002111c:	08e78463          	beq	a5,a4,800211a4 <consoleread+0xf0>
    80021120:	07f7f713          	andi	a4,a5,127
    80021124:	00e48733          	add	a4,s1,a4
    80021128:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8002112c:	0017869b          	addiw	a3,a5,1
    80021130:	08d4ac23          	sw	a3,152(s1)
    80021134:	00070c9b          	sext.w	s9,a4
    80021138:	0b370663          	beq	a4,s3,800211e4 <consoleread+0x130>
    8002113c:	00100693          	li	a3,1
    80021140:	f9f40613          	addi	a2,s0,-97
    80021144:	000c0593          	mv	a1,s8
    80021148:	00090513          	mv	a0,s2
    8002114c:	f8e40fa3          	sb	a4,-97(s0)
    80021150:	00000097          	auipc	ra,0x0
    80021154:	8b8080e7          	jalr	-1864(ra) # 80020a08 <either_copyout>
    80021158:	01450863          	beq	a0,s4,80021168 <consoleread+0xb4>
    8002115c:	001c0c13          	addi	s8,s8,1
    80021160:	fffb8b9b          	addiw	s7,s7,-1
    80021164:	fb5c94e3          	bne	s9,s5,8002110c <consoleread+0x58>
    80021168:	000b851b          	sext.w	a0,s7
    8002116c:	06813083          	ld	ra,104(sp)
    80021170:	06013403          	ld	s0,96(sp)
    80021174:	05813483          	ld	s1,88(sp)
    80021178:	05013903          	ld	s2,80(sp)
    8002117c:	04813983          	ld	s3,72(sp)
    80021180:	04013a03          	ld	s4,64(sp)
    80021184:	03813a83          	ld	s5,56(sp)
    80021188:	02813b83          	ld	s7,40(sp)
    8002118c:	02013c03          	ld	s8,32(sp)
    80021190:	01813c83          	ld	s9,24(sp)
    80021194:	40ab053b          	subw	a0,s6,a0
    80021198:	03013b03          	ld	s6,48(sp)
    8002119c:	07010113          	addi	sp,sp,112
    800211a0:	00008067          	ret
    800211a4:	00001097          	auipc	ra,0x1
    800211a8:	1d8080e7          	jalr	472(ra) # 8002237c <push_on>
    800211ac:	0984a703          	lw	a4,152(s1)
    800211b0:	09c4a783          	lw	a5,156(s1)
    800211b4:	0007879b          	sext.w	a5,a5
    800211b8:	fef70ce3          	beq	a4,a5,800211b0 <consoleread+0xfc>
    800211bc:	00001097          	auipc	ra,0x1
    800211c0:	234080e7          	jalr	564(ra) # 800223f0 <pop_on>
    800211c4:	0984a783          	lw	a5,152(s1)
    800211c8:	07f7f713          	andi	a4,a5,127
    800211cc:	00e48733          	add	a4,s1,a4
    800211d0:	01874703          	lbu	a4,24(a4)
    800211d4:	0017869b          	addiw	a3,a5,1
    800211d8:	08d4ac23          	sw	a3,152(s1)
    800211dc:	00070c9b          	sext.w	s9,a4
    800211e0:	f5371ee3          	bne	a4,s3,8002113c <consoleread+0x88>
    800211e4:	000b851b          	sext.w	a0,s7
    800211e8:	f96bf2e3          	bgeu	s7,s6,8002116c <consoleread+0xb8>
    800211ec:	08f4ac23          	sw	a5,152(s1)
    800211f0:	f7dff06f          	j	8002116c <consoleread+0xb8>

00000000800211f4 <consputc>:
    800211f4:	10000793          	li	a5,256
    800211f8:	00f50663          	beq	a0,a5,80021204 <consputc+0x10>
    800211fc:	00001317          	auipc	t1,0x1
    80021200:	9f430067          	jr	-1548(t1) # 80021bf0 <uartputc_sync>
    80021204:	ff010113          	addi	sp,sp,-16
    80021208:	00113423          	sd	ra,8(sp)
    8002120c:	00813023          	sd	s0,0(sp)
    80021210:	01010413          	addi	s0,sp,16
    80021214:	00800513          	li	a0,8
    80021218:	00001097          	auipc	ra,0x1
    8002121c:	9d8080e7          	jalr	-1576(ra) # 80021bf0 <uartputc_sync>
    80021220:	02000513          	li	a0,32
    80021224:	00001097          	auipc	ra,0x1
    80021228:	9cc080e7          	jalr	-1588(ra) # 80021bf0 <uartputc_sync>
    8002122c:	00013403          	ld	s0,0(sp)
    80021230:	00813083          	ld	ra,8(sp)
    80021234:	00800513          	li	a0,8
    80021238:	01010113          	addi	sp,sp,16
    8002123c:	00001317          	auipc	t1,0x1
    80021240:	9b430067          	jr	-1612(t1) # 80021bf0 <uartputc_sync>

0000000080021244 <consoleintr>:
    80021244:	fe010113          	addi	sp,sp,-32
    80021248:	00813823          	sd	s0,16(sp)
    8002124c:	00913423          	sd	s1,8(sp)
    80021250:	01213023          	sd	s2,0(sp)
    80021254:	00113c23          	sd	ra,24(sp)
    80021258:	02010413          	addi	s0,sp,32
    8002125c:	00003917          	auipc	s2,0x3
    80021260:	47c90913          	addi	s2,s2,1148 # 800246d8 <cons>
    80021264:	00050493          	mv	s1,a0
    80021268:	00090513          	mv	a0,s2
    8002126c:	00001097          	auipc	ra,0x1
    80021270:	e40080e7          	jalr	-448(ra) # 800220ac <acquire>
    80021274:	02048c63          	beqz	s1,800212ac <consoleintr+0x68>
    80021278:	0a092783          	lw	a5,160(s2)
    8002127c:	09892703          	lw	a4,152(s2)
    80021280:	07f00693          	li	a3,127
    80021284:	40e7873b          	subw	a4,a5,a4
    80021288:	02e6e263          	bltu	a3,a4,800212ac <consoleintr+0x68>
    8002128c:	00d00713          	li	a4,13
    80021290:	04e48063          	beq	s1,a4,800212d0 <consoleintr+0x8c>
    80021294:	07f7f713          	andi	a4,a5,127
    80021298:	00e90733          	add	a4,s2,a4
    8002129c:	0017879b          	addiw	a5,a5,1
    800212a0:	0af92023          	sw	a5,160(s2)
    800212a4:	00970c23          	sb	s1,24(a4)
    800212a8:	08f92e23          	sw	a5,156(s2)
    800212ac:	01013403          	ld	s0,16(sp)
    800212b0:	01813083          	ld	ra,24(sp)
    800212b4:	00813483          	ld	s1,8(sp)
    800212b8:	00013903          	ld	s2,0(sp)
    800212bc:	00003517          	auipc	a0,0x3
    800212c0:	41c50513          	addi	a0,a0,1052 # 800246d8 <cons>
    800212c4:	02010113          	addi	sp,sp,32
    800212c8:	00001317          	auipc	t1,0x1
    800212cc:	eb030067          	jr	-336(t1) # 80022178 <release>
    800212d0:	00a00493          	li	s1,10
    800212d4:	fc1ff06f          	j	80021294 <consoleintr+0x50>

00000000800212d8 <consoleinit>:
    800212d8:	fe010113          	addi	sp,sp,-32
    800212dc:	00113c23          	sd	ra,24(sp)
    800212e0:	00813823          	sd	s0,16(sp)
    800212e4:	00913423          	sd	s1,8(sp)
    800212e8:	02010413          	addi	s0,sp,32
    800212ec:	00003497          	auipc	s1,0x3
    800212f0:	3ec48493          	addi	s1,s1,1004 # 800246d8 <cons>
    800212f4:	00048513          	mv	a0,s1
    800212f8:	00002597          	auipc	a1,0x2
    800212fc:	e5058593          	addi	a1,a1,-432 # 80023148 <CONSOLE_STATUS+0x138>
    80021300:	00001097          	auipc	ra,0x1
    80021304:	d88080e7          	jalr	-632(ra) # 80022088 <initlock>
    80021308:	00000097          	auipc	ra,0x0
    8002130c:	7ac080e7          	jalr	1964(ra) # 80021ab4 <uartinit>
    80021310:	01813083          	ld	ra,24(sp)
    80021314:	01013403          	ld	s0,16(sp)
    80021318:	00000797          	auipc	a5,0x0
    8002131c:	d9c78793          	addi	a5,a5,-612 # 800210b4 <consoleread>
    80021320:	0af4bc23          	sd	a5,184(s1)
    80021324:	00000797          	auipc	a5,0x0
    80021328:	cec78793          	addi	a5,a5,-788 # 80021010 <consolewrite>
    8002132c:	0cf4b023          	sd	a5,192(s1)
    80021330:	00813483          	ld	s1,8(sp)
    80021334:	02010113          	addi	sp,sp,32
    80021338:	00008067          	ret

000000008002133c <console_read>:
    8002133c:	ff010113          	addi	sp,sp,-16
    80021340:	00813423          	sd	s0,8(sp)
    80021344:	01010413          	addi	s0,sp,16
    80021348:	00813403          	ld	s0,8(sp)
    8002134c:	00003317          	auipc	t1,0x3
    80021350:	44433303          	ld	t1,1092(t1) # 80024790 <devsw+0x10>
    80021354:	01010113          	addi	sp,sp,16
    80021358:	00030067          	jr	t1

000000008002135c <console_write>:
    8002135c:	ff010113          	addi	sp,sp,-16
    80021360:	00813423          	sd	s0,8(sp)
    80021364:	01010413          	addi	s0,sp,16
    80021368:	00813403          	ld	s0,8(sp)
    8002136c:	00003317          	auipc	t1,0x3
    80021370:	42c33303          	ld	t1,1068(t1) # 80024798 <devsw+0x18>
    80021374:	01010113          	addi	sp,sp,16
    80021378:	00030067          	jr	t1

000000008002137c <panic>:
    8002137c:	fe010113          	addi	sp,sp,-32
    80021380:	00113c23          	sd	ra,24(sp)
    80021384:	00813823          	sd	s0,16(sp)
    80021388:	00913423          	sd	s1,8(sp)
    8002138c:	02010413          	addi	s0,sp,32
    80021390:	00050493          	mv	s1,a0
    80021394:	00002517          	auipc	a0,0x2
    80021398:	dbc50513          	addi	a0,a0,-580 # 80023150 <CONSOLE_STATUS+0x140>
    8002139c:	00003797          	auipc	a5,0x3
    800213a0:	4807ae23          	sw	zero,1180(a5) # 80024838 <pr+0x18>
    800213a4:	00000097          	auipc	ra,0x0
    800213a8:	034080e7          	jalr	52(ra) # 800213d8 <__printf>
    800213ac:	00048513          	mv	a0,s1
    800213b0:	00000097          	auipc	ra,0x0
    800213b4:	028080e7          	jalr	40(ra) # 800213d8 <__printf>
    800213b8:	00002517          	auipc	a0,0x2
    800213bc:	d7850513          	addi	a0,a0,-648 # 80023130 <CONSOLE_STATUS+0x120>
    800213c0:	00000097          	auipc	ra,0x0
    800213c4:	018080e7          	jalr	24(ra) # 800213d8 <__printf>
    800213c8:	00100793          	li	a5,1
    800213cc:	00002717          	auipc	a4,0x2
    800213d0:	1ef72623          	sw	a5,492(a4) # 800235b8 <panicked>
    800213d4:	0000006f          	j	800213d4 <panic+0x58>

00000000800213d8 <__printf>:
    800213d8:	f3010113          	addi	sp,sp,-208
    800213dc:	08813023          	sd	s0,128(sp)
    800213e0:	07313423          	sd	s3,104(sp)
    800213e4:	09010413          	addi	s0,sp,144
    800213e8:	05813023          	sd	s8,64(sp)
    800213ec:	08113423          	sd	ra,136(sp)
    800213f0:	06913c23          	sd	s1,120(sp)
    800213f4:	07213823          	sd	s2,112(sp)
    800213f8:	07413023          	sd	s4,96(sp)
    800213fc:	05513c23          	sd	s5,88(sp)
    80021400:	05613823          	sd	s6,80(sp)
    80021404:	05713423          	sd	s7,72(sp)
    80021408:	03913c23          	sd	s9,56(sp)
    8002140c:	03a13823          	sd	s10,48(sp)
    80021410:	03b13423          	sd	s11,40(sp)
    80021414:	00003317          	auipc	t1,0x3
    80021418:	40c30313          	addi	t1,t1,1036 # 80024820 <pr>
    8002141c:	01832c03          	lw	s8,24(t1)
    80021420:	00b43423          	sd	a1,8(s0)
    80021424:	00c43823          	sd	a2,16(s0)
    80021428:	00d43c23          	sd	a3,24(s0)
    8002142c:	02e43023          	sd	a4,32(s0)
    80021430:	02f43423          	sd	a5,40(s0)
    80021434:	03043823          	sd	a6,48(s0)
    80021438:	03143c23          	sd	a7,56(s0)
    8002143c:	00050993          	mv	s3,a0
    80021440:	4a0c1663          	bnez	s8,800218ec <__printf+0x514>
    80021444:	60098c63          	beqz	s3,80021a5c <__printf+0x684>
    80021448:	0009c503          	lbu	a0,0(s3)
    8002144c:	00840793          	addi	a5,s0,8
    80021450:	f6f43c23          	sd	a5,-136(s0)
    80021454:	00000493          	li	s1,0
    80021458:	22050063          	beqz	a0,80021678 <__printf+0x2a0>
    8002145c:	00002a37          	lui	s4,0x2
    80021460:	00018ab7          	lui	s5,0x18
    80021464:	000f4b37          	lui	s6,0xf4
    80021468:	00989bb7          	lui	s7,0x989
    8002146c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80021470:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80021474:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80021478:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8002147c:	00148c9b          	addiw	s9,s1,1
    80021480:	02500793          	li	a5,37
    80021484:	01998933          	add	s2,s3,s9
    80021488:	38f51263          	bne	a0,a5,8002180c <__printf+0x434>
    8002148c:	00094783          	lbu	a5,0(s2)
    80021490:	00078c9b          	sext.w	s9,a5
    80021494:	1e078263          	beqz	a5,80021678 <__printf+0x2a0>
    80021498:	0024849b          	addiw	s1,s1,2
    8002149c:	07000713          	li	a4,112
    800214a0:	00998933          	add	s2,s3,s1
    800214a4:	38e78a63          	beq	a5,a4,80021838 <__printf+0x460>
    800214a8:	20f76863          	bltu	a4,a5,800216b8 <__printf+0x2e0>
    800214ac:	42a78863          	beq	a5,a0,800218dc <__printf+0x504>
    800214b0:	06400713          	li	a4,100
    800214b4:	40e79663          	bne	a5,a4,800218c0 <__printf+0x4e8>
    800214b8:	f7843783          	ld	a5,-136(s0)
    800214bc:	0007a603          	lw	a2,0(a5)
    800214c0:	00878793          	addi	a5,a5,8
    800214c4:	f6f43c23          	sd	a5,-136(s0)
    800214c8:	42064a63          	bltz	a2,800218fc <__printf+0x524>
    800214cc:	00a00713          	li	a4,10
    800214d0:	02e677bb          	remuw	a5,a2,a4
    800214d4:	00002d97          	auipc	s11,0x2
    800214d8:	ca4d8d93          	addi	s11,s11,-860 # 80023178 <digits>
    800214dc:	00900593          	li	a1,9
    800214e0:	0006051b          	sext.w	a0,a2
    800214e4:	00000c93          	li	s9,0
    800214e8:	02079793          	slli	a5,a5,0x20
    800214ec:	0207d793          	srli	a5,a5,0x20
    800214f0:	00fd87b3          	add	a5,s11,a5
    800214f4:	0007c783          	lbu	a5,0(a5)
    800214f8:	02e656bb          	divuw	a3,a2,a4
    800214fc:	f8f40023          	sb	a5,-128(s0)
    80021500:	14c5d863          	bge	a1,a2,80021650 <__printf+0x278>
    80021504:	06300593          	li	a1,99
    80021508:	00100c93          	li	s9,1
    8002150c:	02e6f7bb          	remuw	a5,a3,a4
    80021510:	02079793          	slli	a5,a5,0x20
    80021514:	0207d793          	srli	a5,a5,0x20
    80021518:	00fd87b3          	add	a5,s11,a5
    8002151c:	0007c783          	lbu	a5,0(a5)
    80021520:	02e6d73b          	divuw	a4,a3,a4
    80021524:	f8f400a3          	sb	a5,-127(s0)
    80021528:	12a5f463          	bgeu	a1,a0,80021650 <__printf+0x278>
    8002152c:	00a00693          	li	a3,10
    80021530:	00900593          	li	a1,9
    80021534:	02d777bb          	remuw	a5,a4,a3
    80021538:	02079793          	slli	a5,a5,0x20
    8002153c:	0207d793          	srli	a5,a5,0x20
    80021540:	00fd87b3          	add	a5,s11,a5
    80021544:	0007c503          	lbu	a0,0(a5)
    80021548:	02d757bb          	divuw	a5,a4,a3
    8002154c:	f8a40123          	sb	a0,-126(s0)
    80021550:	48e5f263          	bgeu	a1,a4,800219d4 <__printf+0x5fc>
    80021554:	06300513          	li	a0,99
    80021558:	02d7f5bb          	remuw	a1,a5,a3
    8002155c:	02059593          	slli	a1,a1,0x20
    80021560:	0205d593          	srli	a1,a1,0x20
    80021564:	00bd85b3          	add	a1,s11,a1
    80021568:	0005c583          	lbu	a1,0(a1)
    8002156c:	02d7d7bb          	divuw	a5,a5,a3
    80021570:	f8b401a3          	sb	a1,-125(s0)
    80021574:	48e57263          	bgeu	a0,a4,800219f8 <__printf+0x620>
    80021578:	3e700513          	li	a0,999
    8002157c:	02d7f5bb          	remuw	a1,a5,a3
    80021580:	02059593          	slli	a1,a1,0x20
    80021584:	0205d593          	srli	a1,a1,0x20
    80021588:	00bd85b3          	add	a1,s11,a1
    8002158c:	0005c583          	lbu	a1,0(a1)
    80021590:	02d7d7bb          	divuw	a5,a5,a3
    80021594:	f8b40223          	sb	a1,-124(s0)
    80021598:	46e57663          	bgeu	a0,a4,80021a04 <__printf+0x62c>
    8002159c:	02d7f5bb          	remuw	a1,a5,a3
    800215a0:	02059593          	slli	a1,a1,0x20
    800215a4:	0205d593          	srli	a1,a1,0x20
    800215a8:	00bd85b3          	add	a1,s11,a1
    800215ac:	0005c583          	lbu	a1,0(a1)
    800215b0:	02d7d7bb          	divuw	a5,a5,a3
    800215b4:	f8b402a3          	sb	a1,-123(s0)
    800215b8:	46ea7863          	bgeu	s4,a4,80021a28 <__printf+0x650>
    800215bc:	02d7f5bb          	remuw	a1,a5,a3
    800215c0:	02059593          	slli	a1,a1,0x20
    800215c4:	0205d593          	srli	a1,a1,0x20
    800215c8:	00bd85b3          	add	a1,s11,a1
    800215cc:	0005c583          	lbu	a1,0(a1)
    800215d0:	02d7d7bb          	divuw	a5,a5,a3
    800215d4:	f8b40323          	sb	a1,-122(s0)
    800215d8:	3eeaf863          	bgeu	s5,a4,800219c8 <__printf+0x5f0>
    800215dc:	02d7f5bb          	remuw	a1,a5,a3
    800215e0:	02059593          	slli	a1,a1,0x20
    800215e4:	0205d593          	srli	a1,a1,0x20
    800215e8:	00bd85b3          	add	a1,s11,a1
    800215ec:	0005c583          	lbu	a1,0(a1)
    800215f0:	02d7d7bb          	divuw	a5,a5,a3
    800215f4:	f8b403a3          	sb	a1,-121(s0)
    800215f8:	42eb7e63          	bgeu	s6,a4,80021a34 <__printf+0x65c>
    800215fc:	02d7f5bb          	remuw	a1,a5,a3
    80021600:	02059593          	slli	a1,a1,0x20
    80021604:	0205d593          	srli	a1,a1,0x20
    80021608:	00bd85b3          	add	a1,s11,a1
    8002160c:	0005c583          	lbu	a1,0(a1)
    80021610:	02d7d7bb          	divuw	a5,a5,a3
    80021614:	f8b40423          	sb	a1,-120(s0)
    80021618:	42ebfc63          	bgeu	s7,a4,80021a50 <__printf+0x678>
    8002161c:	02079793          	slli	a5,a5,0x20
    80021620:	0207d793          	srli	a5,a5,0x20
    80021624:	00fd8db3          	add	s11,s11,a5
    80021628:	000dc703          	lbu	a4,0(s11)
    8002162c:	00a00793          	li	a5,10
    80021630:	00900c93          	li	s9,9
    80021634:	f8e404a3          	sb	a4,-119(s0)
    80021638:	00065c63          	bgez	a2,80021650 <__printf+0x278>
    8002163c:	f9040713          	addi	a4,s0,-112
    80021640:	00f70733          	add	a4,a4,a5
    80021644:	02d00693          	li	a3,45
    80021648:	fed70823          	sb	a3,-16(a4)
    8002164c:	00078c93          	mv	s9,a5
    80021650:	f8040793          	addi	a5,s0,-128
    80021654:	01978cb3          	add	s9,a5,s9
    80021658:	f7f40d13          	addi	s10,s0,-129
    8002165c:	000cc503          	lbu	a0,0(s9)
    80021660:	fffc8c93          	addi	s9,s9,-1
    80021664:	00000097          	auipc	ra,0x0
    80021668:	b90080e7          	jalr	-1136(ra) # 800211f4 <consputc>
    8002166c:	ffac98e3          	bne	s9,s10,8002165c <__printf+0x284>
    80021670:	00094503          	lbu	a0,0(s2)
    80021674:	e00514e3          	bnez	a0,8002147c <__printf+0xa4>
    80021678:	1a0c1663          	bnez	s8,80021824 <__printf+0x44c>
    8002167c:	08813083          	ld	ra,136(sp)
    80021680:	08013403          	ld	s0,128(sp)
    80021684:	07813483          	ld	s1,120(sp)
    80021688:	07013903          	ld	s2,112(sp)
    8002168c:	06813983          	ld	s3,104(sp)
    80021690:	06013a03          	ld	s4,96(sp)
    80021694:	05813a83          	ld	s5,88(sp)
    80021698:	05013b03          	ld	s6,80(sp)
    8002169c:	04813b83          	ld	s7,72(sp)
    800216a0:	04013c03          	ld	s8,64(sp)
    800216a4:	03813c83          	ld	s9,56(sp)
    800216a8:	03013d03          	ld	s10,48(sp)
    800216ac:	02813d83          	ld	s11,40(sp)
    800216b0:	0d010113          	addi	sp,sp,208
    800216b4:	00008067          	ret
    800216b8:	07300713          	li	a4,115
    800216bc:	1ce78a63          	beq	a5,a4,80021890 <__printf+0x4b8>
    800216c0:	07800713          	li	a4,120
    800216c4:	1ee79e63          	bne	a5,a4,800218c0 <__printf+0x4e8>
    800216c8:	f7843783          	ld	a5,-136(s0)
    800216cc:	0007a703          	lw	a4,0(a5)
    800216d0:	00878793          	addi	a5,a5,8
    800216d4:	f6f43c23          	sd	a5,-136(s0)
    800216d8:	28074263          	bltz	a4,8002195c <__printf+0x584>
    800216dc:	00002d97          	auipc	s11,0x2
    800216e0:	a9cd8d93          	addi	s11,s11,-1380 # 80023178 <digits>
    800216e4:	00f77793          	andi	a5,a4,15
    800216e8:	00fd87b3          	add	a5,s11,a5
    800216ec:	0007c683          	lbu	a3,0(a5)
    800216f0:	00f00613          	li	a2,15
    800216f4:	0007079b          	sext.w	a5,a4
    800216f8:	f8d40023          	sb	a3,-128(s0)
    800216fc:	0047559b          	srliw	a1,a4,0x4
    80021700:	0047569b          	srliw	a3,a4,0x4
    80021704:	00000c93          	li	s9,0
    80021708:	0ee65063          	bge	a2,a4,800217e8 <__printf+0x410>
    8002170c:	00f6f693          	andi	a3,a3,15
    80021710:	00dd86b3          	add	a3,s11,a3
    80021714:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80021718:	0087d79b          	srliw	a5,a5,0x8
    8002171c:	00100c93          	li	s9,1
    80021720:	f8d400a3          	sb	a3,-127(s0)
    80021724:	0cb67263          	bgeu	a2,a1,800217e8 <__printf+0x410>
    80021728:	00f7f693          	andi	a3,a5,15
    8002172c:	00dd86b3          	add	a3,s11,a3
    80021730:	0006c583          	lbu	a1,0(a3)
    80021734:	00f00613          	li	a2,15
    80021738:	0047d69b          	srliw	a3,a5,0x4
    8002173c:	f8b40123          	sb	a1,-126(s0)
    80021740:	0047d593          	srli	a1,a5,0x4
    80021744:	28f67e63          	bgeu	a2,a5,800219e0 <__printf+0x608>
    80021748:	00f6f693          	andi	a3,a3,15
    8002174c:	00dd86b3          	add	a3,s11,a3
    80021750:	0006c503          	lbu	a0,0(a3)
    80021754:	0087d813          	srli	a6,a5,0x8
    80021758:	0087d69b          	srliw	a3,a5,0x8
    8002175c:	f8a401a3          	sb	a0,-125(s0)
    80021760:	28b67663          	bgeu	a2,a1,800219ec <__printf+0x614>
    80021764:	00f6f693          	andi	a3,a3,15
    80021768:	00dd86b3          	add	a3,s11,a3
    8002176c:	0006c583          	lbu	a1,0(a3)
    80021770:	00c7d513          	srli	a0,a5,0xc
    80021774:	00c7d69b          	srliw	a3,a5,0xc
    80021778:	f8b40223          	sb	a1,-124(s0)
    8002177c:	29067a63          	bgeu	a2,a6,80021a10 <__printf+0x638>
    80021780:	00f6f693          	andi	a3,a3,15
    80021784:	00dd86b3          	add	a3,s11,a3
    80021788:	0006c583          	lbu	a1,0(a3)
    8002178c:	0107d813          	srli	a6,a5,0x10
    80021790:	0107d69b          	srliw	a3,a5,0x10
    80021794:	f8b402a3          	sb	a1,-123(s0)
    80021798:	28a67263          	bgeu	a2,a0,80021a1c <__printf+0x644>
    8002179c:	00f6f693          	andi	a3,a3,15
    800217a0:	00dd86b3          	add	a3,s11,a3
    800217a4:	0006c683          	lbu	a3,0(a3)
    800217a8:	0147d79b          	srliw	a5,a5,0x14
    800217ac:	f8d40323          	sb	a3,-122(s0)
    800217b0:	21067663          	bgeu	a2,a6,800219bc <__printf+0x5e4>
    800217b4:	02079793          	slli	a5,a5,0x20
    800217b8:	0207d793          	srli	a5,a5,0x20
    800217bc:	00fd8db3          	add	s11,s11,a5
    800217c0:	000dc683          	lbu	a3,0(s11)
    800217c4:	00800793          	li	a5,8
    800217c8:	00700c93          	li	s9,7
    800217cc:	f8d403a3          	sb	a3,-121(s0)
    800217d0:	00075c63          	bgez	a4,800217e8 <__printf+0x410>
    800217d4:	f9040713          	addi	a4,s0,-112
    800217d8:	00f70733          	add	a4,a4,a5
    800217dc:	02d00693          	li	a3,45
    800217e0:	fed70823          	sb	a3,-16(a4)
    800217e4:	00078c93          	mv	s9,a5
    800217e8:	f8040793          	addi	a5,s0,-128
    800217ec:	01978cb3          	add	s9,a5,s9
    800217f0:	f7f40d13          	addi	s10,s0,-129
    800217f4:	000cc503          	lbu	a0,0(s9)
    800217f8:	fffc8c93          	addi	s9,s9,-1
    800217fc:	00000097          	auipc	ra,0x0
    80021800:	9f8080e7          	jalr	-1544(ra) # 800211f4 <consputc>
    80021804:	ff9d18e3          	bne	s10,s9,800217f4 <__printf+0x41c>
    80021808:	0100006f          	j	80021818 <__printf+0x440>
    8002180c:	00000097          	auipc	ra,0x0
    80021810:	9e8080e7          	jalr	-1560(ra) # 800211f4 <consputc>
    80021814:	000c8493          	mv	s1,s9
    80021818:	00094503          	lbu	a0,0(s2)
    8002181c:	c60510e3          	bnez	a0,8002147c <__printf+0xa4>
    80021820:	e40c0ee3          	beqz	s8,8002167c <__printf+0x2a4>
    80021824:	00003517          	auipc	a0,0x3
    80021828:	ffc50513          	addi	a0,a0,-4 # 80024820 <pr>
    8002182c:	00001097          	auipc	ra,0x1
    80021830:	94c080e7          	jalr	-1716(ra) # 80022178 <release>
    80021834:	e49ff06f          	j	8002167c <__printf+0x2a4>
    80021838:	f7843783          	ld	a5,-136(s0)
    8002183c:	03000513          	li	a0,48
    80021840:	01000d13          	li	s10,16
    80021844:	00878713          	addi	a4,a5,8
    80021848:	0007bc83          	ld	s9,0(a5)
    8002184c:	f6e43c23          	sd	a4,-136(s0)
    80021850:	00000097          	auipc	ra,0x0
    80021854:	9a4080e7          	jalr	-1628(ra) # 800211f4 <consputc>
    80021858:	07800513          	li	a0,120
    8002185c:	00000097          	auipc	ra,0x0
    80021860:	998080e7          	jalr	-1640(ra) # 800211f4 <consputc>
    80021864:	00002d97          	auipc	s11,0x2
    80021868:	914d8d93          	addi	s11,s11,-1772 # 80023178 <digits>
    8002186c:	03ccd793          	srli	a5,s9,0x3c
    80021870:	00fd87b3          	add	a5,s11,a5
    80021874:	0007c503          	lbu	a0,0(a5)
    80021878:	fffd0d1b          	addiw	s10,s10,-1
    8002187c:	004c9c93          	slli	s9,s9,0x4
    80021880:	00000097          	auipc	ra,0x0
    80021884:	974080e7          	jalr	-1676(ra) # 800211f4 <consputc>
    80021888:	fe0d12e3          	bnez	s10,8002186c <__printf+0x494>
    8002188c:	f8dff06f          	j	80021818 <__printf+0x440>
    80021890:	f7843783          	ld	a5,-136(s0)
    80021894:	0007bc83          	ld	s9,0(a5)
    80021898:	00878793          	addi	a5,a5,8
    8002189c:	f6f43c23          	sd	a5,-136(s0)
    800218a0:	000c9a63          	bnez	s9,800218b4 <__printf+0x4dc>
    800218a4:	1080006f          	j	800219ac <__printf+0x5d4>
    800218a8:	001c8c93          	addi	s9,s9,1
    800218ac:	00000097          	auipc	ra,0x0
    800218b0:	948080e7          	jalr	-1720(ra) # 800211f4 <consputc>
    800218b4:	000cc503          	lbu	a0,0(s9)
    800218b8:	fe0518e3          	bnez	a0,800218a8 <__printf+0x4d0>
    800218bc:	f5dff06f          	j	80021818 <__printf+0x440>
    800218c0:	02500513          	li	a0,37
    800218c4:	00000097          	auipc	ra,0x0
    800218c8:	930080e7          	jalr	-1744(ra) # 800211f4 <consputc>
    800218cc:	000c8513          	mv	a0,s9
    800218d0:	00000097          	auipc	ra,0x0
    800218d4:	924080e7          	jalr	-1756(ra) # 800211f4 <consputc>
    800218d8:	f41ff06f          	j	80021818 <__printf+0x440>
    800218dc:	02500513          	li	a0,37
    800218e0:	00000097          	auipc	ra,0x0
    800218e4:	914080e7          	jalr	-1772(ra) # 800211f4 <consputc>
    800218e8:	f31ff06f          	j	80021818 <__printf+0x440>
    800218ec:	00030513          	mv	a0,t1
    800218f0:	00000097          	auipc	ra,0x0
    800218f4:	7bc080e7          	jalr	1980(ra) # 800220ac <acquire>
    800218f8:	b4dff06f          	j	80021444 <__printf+0x6c>
    800218fc:	40c0053b          	negw	a0,a2
    80021900:	00a00713          	li	a4,10
    80021904:	02e576bb          	remuw	a3,a0,a4
    80021908:	00002d97          	auipc	s11,0x2
    8002190c:	870d8d93          	addi	s11,s11,-1936 # 80023178 <digits>
    80021910:	ff700593          	li	a1,-9
    80021914:	02069693          	slli	a3,a3,0x20
    80021918:	0206d693          	srli	a3,a3,0x20
    8002191c:	00dd86b3          	add	a3,s11,a3
    80021920:	0006c683          	lbu	a3,0(a3)
    80021924:	02e557bb          	divuw	a5,a0,a4
    80021928:	f8d40023          	sb	a3,-128(s0)
    8002192c:	10b65e63          	bge	a2,a1,80021a48 <__printf+0x670>
    80021930:	06300593          	li	a1,99
    80021934:	02e7f6bb          	remuw	a3,a5,a4
    80021938:	02069693          	slli	a3,a3,0x20
    8002193c:	0206d693          	srli	a3,a3,0x20
    80021940:	00dd86b3          	add	a3,s11,a3
    80021944:	0006c683          	lbu	a3,0(a3)
    80021948:	02e7d73b          	divuw	a4,a5,a4
    8002194c:	00200793          	li	a5,2
    80021950:	f8d400a3          	sb	a3,-127(s0)
    80021954:	bca5ece3          	bltu	a1,a0,8002152c <__printf+0x154>
    80021958:	ce5ff06f          	j	8002163c <__printf+0x264>
    8002195c:	40e007bb          	negw	a5,a4
    80021960:	00002d97          	auipc	s11,0x2
    80021964:	818d8d93          	addi	s11,s11,-2024 # 80023178 <digits>
    80021968:	00f7f693          	andi	a3,a5,15
    8002196c:	00dd86b3          	add	a3,s11,a3
    80021970:	0006c583          	lbu	a1,0(a3)
    80021974:	ff100613          	li	a2,-15
    80021978:	0047d69b          	srliw	a3,a5,0x4
    8002197c:	f8b40023          	sb	a1,-128(s0)
    80021980:	0047d59b          	srliw	a1,a5,0x4
    80021984:	0ac75e63          	bge	a4,a2,80021a40 <__printf+0x668>
    80021988:	00f6f693          	andi	a3,a3,15
    8002198c:	00dd86b3          	add	a3,s11,a3
    80021990:	0006c603          	lbu	a2,0(a3)
    80021994:	00f00693          	li	a3,15
    80021998:	0087d79b          	srliw	a5,a5,0x8
    8002199c:	f8c400a3          	sb	a2,-127(s0)
    800219a0:	d8b6e4e3          	bltu	a3,a1,80021728 <__printf+0x350>
    800219a4:	00200793          	li	a5,2
    800219a8:	e2dff06f          	j	800217d4 <__printf+0x3fc>
    800219ac:	00001c97          	auipc	s9,0x1
    800219b0:	7acc8c93          	addi	s9,s9,1964 # 80023158 <CONSOLE_STATUS+0x148>
    800219b4:	02800513          	li	a0,40
    800219b8:	ef1ff06f          	j	800218a8 <__printf+0x4d0>
    800219bc:	00700793          	li	a5,7
    800219c0:	00600c93          	li	s9,6
    800219c4:	e0dff06f          	j	800217d0 <__printf+0x3f8>
    800219c8:	00700793          	li	a5,7
    800219cc:	00600c93          	li	s9,6
    800219d0:	c69ff06f          	j	80021638 <__printf+0x260>
    800219d4:	00300793          	li	a5,3
    800219d8:	00200c93          	li	s9,2
    800219dc:	c5dff06f          	j	80021638 <__printf+0x260>
    800219e0:	00300793          	li	a5,3
    800219e4:	00200c93          	li	s9,2
    800219e8:	de9ff06f          	j	800217d0 <__printf+0x3f8>
    800219ec:	00400793          	li	a5,4
    800219f0:	00300c93          	li	s9,3
    800219f4:	dddff06f          	j	800217d0 <__printf+0x3f8>
    800219f8:	00400793          	li	a5,4
    800219fc:	00300c93          	li	s9,3
    80021a00:	c39ff06f          	j	80021638 <__printf+0x260>
    80021a04:	00500793          	li	a5,5
    80021a08:	00400c93          	li	s9,4
    80021a0c:	c2dff06f          	j	80021638 <__printf+0x260>
    80021a10:	00500793          	li	a5,5
    80021a14:	00400c93          	li	s9,4
    80021a18:	db9ff06f          	j	800217d0 <__printf+0x3f8>
    80021a1c:	00600793          	li	a5,6
    80021a20:	00500c93          	li	s9,5
    80021a24:	dadff06f          	j	800217d0 <__printf+0x3f8>
    80021a28:	00600793          	li	a5,6
    80021a2c:	00500c93          	li	s9,5
    80021a30:	c09ff06f          	j	80021638 <__printf+0x260>
    80021a34:	00800793          	li	a5,8
    80021a38:	00700c93          	li	s9,7
    80021a3c:	bfdff06f          	j	80021638 <__printf+0x260>
    80021a40:	00100793          	li	a5,1
    80021a44:	d91ff06f          	j	800217d4 <__printf+0x3fc>
    80021a48:	00100793          	li	a5,1
    80021a4c:	bf1ff06f          	j	8002163c <__printf+0x264>
    80021a50:	00900793          	li	a5,9
    80021a54:	00800c93          	li	s9,8
    80021a58:	be1ff06f          	j	80021638 <__printf+0x260>
    80021a5c:	00001517          	auipc	a0,0x1
    80021a60:	70450513          	addi	a0,a0,1796 # 80023160 <CONSOLE_STATUS+0x150>
    80021a64:	00000097          	auipc	ra,0x0
    80021a68:	918080e7          	jalr	-1768(ra) # 8002137c <panic>

0000000080021a6c <printfinit>:
    80021a6c:	fe010113          	addi	sp,sp,-32
    80021a70:	00813823          	sd	s0,16(sp)
    80021a74:	00913423          	sd	s1,8(sp)
    80021a78:	00113c23          	sd	ra,24(sp)
    80021a7c:	02010413          	addi	s0,sp,32
    80021a80:	00003497          	auipc	s1,0x3
    80021a84:	da048493          	addi	s1,s1,-608 # 80024820 <pr>
    80021a88:	00048513          	mv	a0,s1
    80021a8c:	00001597          	auipc	a1,0x1
    80021a90:	6e458593          	addi	a1,a1,1764 # 80023170 <CONSOLE_STATUS+0x160>
    80021a94:	00000097          	auipc	ra,0x0
    80021a98:	5f4080e7          	jalr	1524(ra) # 80022088 <initlock>
    80021a9c:	01813083          	ld	ra,24(sp)
    80021aa0:	01013403          	ld	s0,16(sp)
    80021aa4:	0004ac23          	sw	zero,24(s1)
    80021aa8:	00813483          	ld	s1,8(sp)
    80021aac:	02010113          	addi	sp,sp,32
    80021ab0:	00008067          	ret

0000000080021ab4 <uartinit>:
    80021ab4:	ff010113          	addi	sp,sp,-16
    80021ab8:	00813423          	sd	s0,8(sp)
    80021abc:	01010413          	addi	s0,sp,16
    80021ac0:	100007b7          	lui	a5,0x10000
    80021ac4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80021ac8:	f8000713          	li	a4,-128
    80021acc:	00e781a3          	sb	a4,3(a5)
    80021ad0:	00300713          	li	a4,3
    80021ad4:	00e78023          	sb	a4,0(a5)
    80021ad8:	000780a3          	sb	zero,1(a5)
    80021adc:	00e781a3          	sb	a4,3(a5)
    80021ae0:	00700693          	li	a3,7
    80021ae4:	00d78123          	sb	a3,2(a5)
    80021ae8:	00e780a3          	sb	a4,1(a5)
    80021aec:	00813403          	ld	s0,8(sp)
    80021af0:	01010113          	addi	sp,sp,16
    80021af4:	00008067          	ret

0000000080021af8 <uartputc>:
    80021af8:	00002797          	auipc	a5,0x2
    80021afc:	ac07a783          	lw	a5,-1344(a5) # 800235b8 <panicked>
    80021b00:	00078463          	beqz	a5,80021b08 <uartputc+0x10>
    80021b04:	0000006f          	j	80021b04 <uartputc+0xc>
    80021b08:	fd010113          	addi	sp,sp,-48
    80021b0c:	02813023          	sd	s0,32(sp)
    80021b10:	00913c23          	sd	s1,24(sp)
    80021b14:	01213823          	sd	s2,16(sp)
    80021b18:	01313423          	sd	s3,8(sp)
    80021b1c:	02113423          	sd	ra,40(sp)
    80021b20:	03010413          	addi	s0,sp,48
    80021b24:	00002917          	auipc	s2,0x2
    80021b28:	a9c90913          	addi	s2,s2,-1380 # 800235c0 <uart_tx_r>
    80021b2c:	00093783          	ld	a5,0(s2)
    80021b30:	00002497          	auipc	s1,0x2
    80021b34:	a9848493          	addi	s1,s1,-1384 # 800235c8 <uart_tx_w>
    80021b38:	0004b703          	ld	a4,0(s1)
    80021b3c:	02078693          	addi	a3,a5,32
    80021b40:	00050993          	mv	s3,a0
    80021b44:	02e69c63          	bne	a3,a4,80021b7c <uartputc+0x84>
    80021b48:	00001097          	auipc	ra,0x1
    80021b4c:	834080e7          	jalr	-1996(ra) # 8002237c <push_on>
    80021b50:	00093783          	ld	a5,0(s2)
    80021b54:	0004b703          	ld	a4,0(s1)
    80021b58:	02078793          	addi	a5,a5,32
    80021b5c:	00e79463          	bne	a5,a4,80021b64 <uartputc+0x6c>
    80021b60:	0000006f          	j	80021b60 <uartputc+0x68>
    80021b64:	00001097          	auipc	ra,0x1
    80021b68:	88c080e7          	jalr	-1908(ra) # 800223f0 <pop_on>
    80021b6c:	00093783          	ld	a5,0(s2)
    80021b70:	0004b703          	ld	a4,0(s1)
    80021b74:	02078693          	addi	a3,a5,32
    80021b78:	fce688e3          	beq	a3,a4,80021b48 <uartputc+0x50>
    80021b7c:	01f77693          	andi	a3,a4,31
    80021b80:	00003597          	auipc	a1,0x3
    80021b84:	cc058593          	addi	a1,a1,-832 # 80024840 <uart_tx_buf>
    80021b88:	00d586b3          	add	a3,a1,a3
    80021b8c:	00170713          	addi	a4,a4,1
    80021b90:	01368023          	sb	s3,0(a3)
    80021b94:	00e4b023          	sd	a4,0(s1)
    80021b98:	10000637          	lui	a2,0x10000
    80021b9c:	02f71063          	bne	a4,a5,80021bbc <uartputc+0xc4>
    80021ba0:	0340006f          	j	80021bd4 <uartputc+0xdc>
    80021ba4:	00074703          	lbu	a4,0(a4)
    80021ba8:	00f93023          	sd	a5,0(s2)
    80021bac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80021bb0:	00093783          	ld	a5,0(s2)
    80021bb4:	0004b703          	ld	a4,0(s1)
    80021bb8:	00f70e63          	beq	a4,a5,80021bd4 <uartputc+0xdc>
    80021bbc:	00564683          	lbu	a3,5(a2)
    80021bc0:	01f7f713          	andi	a4,a5,31
    80021bc4:	00e58733          	add	a4,a1,a4
    80021bc8:	0206f693          	andi	a3,a3,32
    80021bcc:	00178793          	addi	a5,a5,1
    80021bd0:	fc069ae3          	bnez	a3,80021ba4 <uartputc+0xac>
    80021bd4:	02813083          	ld	ra,40(sp)
    80021bd8:	02013403          	ld	s0,32(sp)
    80021bdc:	01813483          	ld	s1,24(sp)
    80021be0:	01013903          	ld	s2,16(sp)
    80021be4:	00813983          	ld	s3,8(sp)
    80021be8:	03010113          	addi	sp,sp,48
    80021bec:	00008067          	ret

0000000080021bf0 <uartputc_sync>:
    80021bf0:	ff010113          	addi	sp,sp,-16
    80021bf4:	00813423          	sd	s0,8(sp)
    80021bf8:	01010413          	addi	s0,sp,16
    80021bfc:	00002717          	auipc	a4,0x2
    80021c00:	9bc72703          	lw	a4,-1604(a4) # 800235b8 <panicked>
    80021c04:	02071663          	bnez	a4,80021c30 <uartputc_sync+0x40>
    80021c08:	00050793          	mv	a5,a0
    80021c0c:	100006b7          	lui	a3,0x10000
    80021c10:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80021c14:	02077713          	andi	a4,a4,32
    80021c18:	fe070ce3          	beqz	a4,80021c10 <uartputc_sync+0x20>
    80021c1c:	0ff7f793          	andi	a5,a5,255
    80021c20:	00f68023          	sb	a5,0(a3)
    80021c24:	00813403          	ld	s0,8(sp)
    80021c28:	01010113          	addi	sp,sp,16
    80021c2c:	00008067          	ret
    80021c30:	0000006f          	j	80021c30 <uartputc_sync+0x40>

0000000080021c34 <uartstart>:
    80021c34:	ff010113          	addi	sp,sp,-16
    80021c38:	00813423          	sd	s0,8(sp)
    80021c3c:	01010413          	addi	s0,sp,16
    80021c40:	00002617          	auipc	a2,0x2
    80021c44:	98060613          	addi	a2,a2,-1664 # 800235c0 <uart_tx_r>
    80021c48:	00002517          	auipc	a0,0x2
    80021c4c:	98050513          	addi	a0,a0,-1664 # 800235c8 <uart_tx_w>
    80021c50:	00063783          	ld	a5,0(a2)
    80021c54:	00053703          	ld	a4,0(a0)
    80021c58:	04f70263          	beq	a4,a5,80021c9c <uartstart+0x68>
    80021c5c:	100005b7          	lui	a1,0x10000
    80021c60:	00003817          	auipc	a6,0x3
    80021c64:	be080813          	addi	a6,a6,-1056 # 80024840 <uart_tx_buf>
    80021c68:	01c0006f          	j	80021c84 <uartstart+0x50>
    80021c6c:	0006c703          	lbu	a4,0(a3)
    80021c70:	00f63023          	sd	a5,0(a2)
    80021c74:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021c78:	00063783          	ld	a5,0(a2)
    80021c7c:	00053703          	ld	a4,0(a0)
    80021c80:	00f70e63          	beq	a4,a5,80021c9c <uartstart+0x68>
    80021c84:	01f7f713          	andi	a4,a5,31
    80021c88:	00e806b3          	add	a3,a6,a4
    80021c8c:	0055c703          	lbu	a4,5(a1)
    80021c90:	00178793          	addi	a5,a5,1
    80021c94:	02077713          	andi	a4,a4,32
    80021c98:	fc071ae3          	bnez	a4,80021c6c <uartstart+0x38>
    80021c9c:	00813403          	ld	s0,8(sp)
    80021ca0:	01010113          	addi	sp,sp,16
    80021ca4:	00008067          	ret

0000000080021ca8 <uartgetc>:
    80021ca8:	ff010113          	addi	sp,sp,-16
    80021cac:	00813423          	sd	s0,8(sp)
    80021cb0:	01010413          	addi	s0,sp,16
    80021cb4:	10000737          	lui	a4,0x10000
    80021cb8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80021cbc:	0017f793          	andi	a5,a5,1
    80021cc0:	00078c63          	beqz	a5,80021cd8 <uartgetc+0x30>
    80021cc4:	00074503          	lbu	a0,0(a4)
    80021cc8:	0ff57513          	andi	a0,a0,255
    80021ccc:	00813403          	ld	s0,8(sp)
    80021cd0:	01010113          	addi	sp,sp,16
    80021cd4:	00008067          	ret
    80021cd8:	fff00513          	li	a0,-1
    80021cdc:	ff1ff06f          	j	80021ccc <uartgetc+0x24>

0000000080021ce0 <uartintr>:
    80021ce0:	100007b7          	lui	a5,0x10000
    80021ce4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80021ce8:	0017f793          	andi	a5,a5,1
    80021cec:	0a078463          	beqz	a5,80021d94 <uartintr+0xb4>
    80021cf0:	fe010113          	addi	sp,sp,-32
    80021cf4:	00813823          	sd	s0,16(sp)
    80021cf8:	00913423          	sd	s1,8(sp)
    80021cfc:	00113c23          	sd	ra,24(sp)
    80021d00:	02010413          	addi	s0,sp,32
    80021d04:	100004b7          	lui	s1,0x10000
    80021d08:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80021d0c:	0ff57513          	andi	a0,a0,255
    80021d10:	fffff097          	auipc	ra,0xfffff
    80021d14:	534080e7          	jalr	1332(ra) # 80021244 <consoleintr>
    80021d18:	0054c783          	lbu	a5,5(s1)
    80021d1c:	0017f793          	andi	a5,a5,1
    80021d20:	fe0794e3          	bnez	a5,80021d08 <uartintr+0x28>
    80021d24:	00002617          	auipc	a2,0x2
    80021d28:	89c60613          	addi	a2,a2,-1892 # 800235c0 <uart_tx_r>
    80021d2c:	00002517          	auipc	a0,0x2
    80021d30:	89c50513          	addi	a0,a0,-1892 # 800235c8 <uart_tx_w>
    80021d34:	00063783          	ld	a5,0(a2)
    80021d38:	00053703          	ld	a4,0(a0)
    80021d3c:	04f70263          	beq	a4,a5,80021d80 <uartintr+0xa0>
    80021d40:	100005b7          	lui	a1,0x10000
    80021d44:	00003817          	auipc	a6,0x3
    80021d48:	afc80813          	addi	a6,a6,-1284 # 80024840 <uart_tx_buf>
    80021d4c:	01c0006f          	j	80021d68 <uartintr+0x88>
    80021d50:	0006c703          	lbu	a4,0(a3)
    80021d54:	00f63023          	sd	a5,0(a2)
    80021d58:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021d5c:	00063783          	ld	a5,0(a2)
    80021d60:	00053703          	ld	a4,0(a0)
    80021d64:	00f70e63          	beq	a4,a5,80021d80 <uartintr+0xa0>
    80021d68:	01f7f713          	andi	a4,a5,31
    80021d6c:	00e806b3          	add	a3,a6,a4
    80021d70:	0055c703          	lbu	a4,5(a1)
    80021d74:	00178793          	addi	a5,a5,1
    80021d78:	02077713          	andi	a4,a4,32
    80021d7c:	fc071ae3          	bnez	a4,80021d50 <uartintr+0x70>
    80021d80:	01813083          	ld	ra,24(sp)
    80021d84:	01013403          	ld	s0,16(sp)
    80021d88:	00813483          	ld	s1,8(sp)
    80021d8c:	02010113          	addi	sp,sp,32
    80021d90:	00008067          	ret
    80021d94:	00002617          	auipc	a2,0x2
    80021d98:	82c60613          	addi	a2,a2,-2004 # 800235c0 <uart_tx_r>
    80021d9c:	00002517          	auipc	a0,0x2
    80021da0:	82c50513          	addi	a0,a0,-2004 # 800235c8 <uart_tx_w>
    80021da4:	00063783          	ld	a5,0(a2)
    80021da8:	00053703          	ld	a4,0(a0)
    80021dac:	04f70263          	beq	a4,a5,80021df0 <uartintr+0x110>
    80021db0:	100005b7          	lui	a1,0x10000
    80021db4:	00003817          	auipc	a6,0x3
    80021db8:	a8c80813          	addi	a6,a6,-1396 # 80024840 <uart_tx_buf>
    80021dbc:	01c0006f          	j	80021dd8 <uartintr+0xf8>
    80021dc0:	0006c703          	lbu	a4,0(a3)
    80021dc4:	00f63023          	sd	a5,0(a2)
    80021dc8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021dcc:	00063783          	ld	a5,0(a2)
    80021dd0:	00053703          	ld	a4,0(a0)
    80021dd4:	02f70063          	beq	a4,a5,80021df4 <uartintr+0x114>
    80021dd8:	01f7f713          	andi	a4,a5,31
    80021ddc:	00e806b3          	add	a3,a6,a4
    80021de0:	0055c703          	lbu	a4,5(a1)
    80021de4:	00178793          	addi	a5,a5,1
    80021de8:	02077713          	andi	a4,a4,32
    80021dec:	fc071ae3          	bnez	a4,80021dc0 <uartintr+0xe0>
    80021df0:	00008067          	ret
    80021df4:	00008067          	ret

0000000080021df8 <kinit>:
    80021df8:	fc010113          	addi	sp,sp,-64
    80021dfc:	02913423          	sd	s1,40(sp)
    80021e00:	fffff7b7          	lui	a5,0xfffff
    80021e04:	00004497          	auipc	s1,0x4
    80021e08:	a5b48493          	addi	s1,s1,-1445 # 8002585f <end+0xfff>
    80021e0c:	02813823          	sd	s0,48(sp)
    80021e10:	01313c23          	sd	s3,24(sp)
    80021e14:	00f4f4b3          	and	s1,s1,a5
    80021e18:	02113c23          	sd	ra,56(sp)
    80021e1c:	03213023          	sd	s2,32(sp)
    80021e20:	01413823          	sd	s4,16(sp)
    80021e24:	01513423          	sd	s5,8(sp)
    80021e28:	04010413          	addi	s0,sp,64
    80021e2c:	000017b7          	lui	a5,0x1
    80021e30:	01100993          	li	s3,17
    80021e34:	00f487b3          	add	a5,s1,a5
    80021e38:	01b99993          	slli	s3,s3,0x1b
    80021e3c:	06f9e063          	bltu	s3,a5,80021e9c <kinit+0xa4>
    80021e40:	00003a97          	auipc	s5,0x3
    80021e44:	a20a8a93          	addi	s5,s5,-1504 # 80024860 <end>
    80021e48:	0754ec63          	bltu	s1,s5,80021ec0 <kinit+0xc8>
    80021e4c:	0734fa63          	bgeu	s1,s3,80021ec0 <kinit+0xc8>
    80021e50:	00088a37          	lui	s4,0x88
    80021e54:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80021e58:	00001917          	auipc	s2,0x1
    80021e5c:	77890913          	addi	s2,s2,1912 # 800235d0 <kmem>
    80021e60:	00ca1a13          	slli	s4,s4,0xc
    80021e64:	0140006f          	j	80021e78 <kinit+0x80>
    80021e68:	000017b7          	lui	a5,0x1
    80021e6c:	00f484b3          	add	s1,s1,a5
    80021e70:	0554e863          	bltu	s1,s5,80021ec0 <kinit+0xc8>
    80021e74:	0534f663          	bgeu	s1,s3,80021ec0 <kinit+0xc8>
    80021e78:	00001637          	lui	a2,0x1
    80021e7c:	00100593          	li	a1,1
    80021e80:	00048513          	mv	a0,s1
    80021e84:	00000097          	auipc	ra,0x0
    80021e88:	5e4080e7          	jalr	1508(ra) # 80022468 <__memset>
    80021e8c:	00093783          	ld	a5,0(s2)
    80021e90:	00f4b023          	sd	a5,0(s1)
    80021e94:	00993023          	sd	s1,0(s2)
    80021e98:	fd4498e3          	bne	s1,s4,80021e68 <kinit+0x70>
    80021e9c:	03813083          	ld	ra,56(sp)
    80021ea0:	03013403          	ld	s0,48(sp)
    80021ea4:	02813483          	ld	s1,40(sp)
    80021ea8:	02013903          	ld	s2,32(sp)
    80021eac:	01813983          	ld	s3,24(sp)
    80021eb0:	01013a03          	ld	s4,16(sp)
    80021eb4:	00813a83          	ld	s5,8(sp)
    80021eb8:	04010113          	addi	sp,sp,64
    80021ebc:	00008067          	ret
    80021ec0:	00001517          	auipc	a0,0x1
    80021ec4:	2d050513          	addi	a0,a0,720 # 80023190 <digits+0x18>
    80021ec8:	fffff097          	auipc	ra,0xfffff
    80021ecc:	4b4080e7          	jalr	1204(ra) # 8002137c <panic>

0000000080021ed0 <freerange>:
    80021ed0:	fc010113          	addi	sp,sp,-64
    80021ed4:	000017b7          	lui	a5,0x1
    80021ed8:	02913423          	sd	s1,40(sp)
    80021edc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80021ee0:	009504b3          	add	s1,a0,s1
    80021ee4:	fffff537          	lui	a0,0xfffff
    80021ee8:	02813823          	sd	s0,48(sp)
    80021eec:	02113c23          	sd	ra,56(sp)
    80021ef0:	03213023          	sd	s2,32(sp)
    80021ef4:	01313c23          	sd	s3,24(sp)
    80021ef8:	01413823          	sd	s4,16(sp)
    80021efc:	01513423          	sd	s5,8(sp)
    80021f00:	01613023          	sd	s6,0(sp)
    80021f04:	04010413          	addi	s0,sp,64
    80021f08:	00a4f4b3          	and	s1,s1,a0
    80021f0c:	00f487b3          	add	a5,s1,a5
    80021f10:	06f5e463          	bltu	a1,a5,80021f78 <freerange+0xa8>
    80021f14:	00003a97          	auipc	s5,0x3
    80021f18:	94ca8a93          	addi	s5,s5,-1716 # 80024860 <end>
    80021f1c:	0954e263          	bltu	s1,s5,80021fa0 <freerange+0xd0>
    80021f20:	01100993          	li	s3,17
    80021f24:	01b99993          	slli	s3,s3,0x1b
    80021f28:	0734fc63          	bgeu	s1,s3,80021fa0 <freerange+0xd0>
    80021f2c:	00058a13          	mv	s4,a1
    80021f30:	00001917          	auipc	s2,0x1
    80021f34:	6a090913          	addi	s2,s2,1696 # 800235d0 <kmem>
    80021f38:	00002b37          	lui	s6,0x2
    80021f3c:	0140006f          	j	80021f50 <freerange+0x80>
    80021f40:	000017b7          	lui	a5,0x1
    80021f44:	00f484b3          	add	s1,s1,a5
    80021f48:	0554ec63          	bltu	s1,s5,80021fa0 <freerange+0xd0>
    80021f4c:	0534fa63          	bgeu	s1,s3,80021fa0 <freerange+0xd0>
    80021f50:	00001637          	lui	a2,0x1
    80021f54:	00100593          	li	a1,1
    80021f58:	00048513          	mv	a0,s1
    80021f5c:	00000097          	auipc	ra,0x0
    80021f60:	50c080e7          	jalr	1292(ra) # 80022468 <__memset>
    80021f64:	00093703          	ld	a4,0(s2)
    80021f68:	016487b3          	add	a5,s1,s6
    80021f6c:	00e4b023          	sd	a4,0(s1)
    80021f70:	00993023          	sd	s1,0(s2)
    80021f74:	fcfa76e3          	bgeu	s4,a5,80021f40 <freerange+0x70>
    80021f78:	03813083          	ld	ra,56(sp)
    80021f7c:	03013403          	ld	s0,48(sp)
    80021f80:	02813483          	ld	s1,40(sp)
    80021f84:	02013903          	ld	s2,32(sp)
    80021f88:	01813983          	ld	s3,24(sp)
    80021f8c:	01013a03          	ld	s4,16(sp)
    80021f90:	00813a83          	ld	s5,8(sp)
    80021f94:	00013b03          	ld	s6,0(sp)
    80021f98:	04010113          	addi	sp,sp,64
    80021f9c:	00008067          	ret
    80021fa0:	00001517          	auipc	a0,0x1
    80021fa4:	1f050513          	addi	a0,a0,496 # 80023190 <digits+0x18>
    80021fa8:	fffff097          	auipc	ra,0xfffff
    80021fac:	3d4080e7          	jalr	980(ra) # 8002137c <panic>

0000000080021fb0 <kfree>:
    80021fb0:	fe010113          	addi	sp,sp,-32
    80021fb4:	00813823          	sd	s0,16(sp)
    80021fb8:	00113c23          	sd	ra,24(sp)
    80021fbc:	00913423          	sd	s1,8(sp)
    80021fc0:	02010413          	addi	s0,sp,32
    80021fc4:	03451793          	slli	a5,a0,0x34
    80021fc8:	04079c63          	bnez	a5,80022020 <kfree+0x70>
    80021fcc:	00003797          	auipc	a5,0x3
    80021fd0:	89478793          	addi	a5,a5,-1900 # 80024860 <end>
    80021fd4:	00050493          	mv	s1,a0
    80021fd8:	04f56463          	bltu	a0,a5,80022020 <kfree+0x70>
    80021fdc:	01100793          	li	a5,17
    80021fe0:	01b79793          	slli	a5,a5,0x1b
    80021fe4:	02f57e63          	bgeu	a0,a5,80022020 <kfree+0x70>
    80021fe8:	00001637          	lui	a2,0x1
    80021fec:	00100593          	li	a1,1
    80021ff0:	00000097          	auipc	ra,0x0
    80021ff4:	478080e7          	jalr	1144(ra) # 80022468 <__memset>
    80021ff8:	00001797          	auipc	a5,0x1
    80021ffc:	5d878793          	addi	a5,a5,1496 # 800235d0 <kmem>
    80022000:	0007b703          	ld	a4,0(a5)
    80022004:	01813083          	ld	ra,24(sp)
    80022008:	01013403          	ld	s0,16(sp)
    8002200c:	00e4b023          	sd	a4,0(s1)
    80022010:	0097b023          	sd	s1,0(a5)
    80022014:	00813483          	ld	s1,8(sp)
    80022018:	02010113          	addi	sp,sp,32
    8002201c:	00008067          	ret
    80022020:	00001517          	auipc	a0,0x1
    80022024:	17050513          	addi	a0,a0,368 # 80023190 <digits+0x18>
    80022028:	fffff097          	auipc	ra,0xfffff
    8002202c:	354080e7          	jalr	852(ra) # 8002137c <panic>

0000000080022030 <kalloc>:
    80022030:	fe010113          	addi	sp,sp,-32
    80022034:	00813823          	sd	s0,16(sp)
    80022038:	00913423          	sd	s1,8(sp)
    8002203c:	00113c23          	sd	ra,24(sp)
    80022040:	02010413          	addi	s0,sp,32
    80022044:	00001797          	auipc	a5,0x1
    80022048:	58c78793          	addi	a5,a5,1420 # 800235d0 <kmem>
    8002204c:	0007b483          	ld	s1,0(a5)
    80022050:	02048063          	beqz	s1,80022070 <kalloc+0x40>
    80022054:	0004b703          	ld	a4,0(s1)
    80022058:	00001637          	lui	a2,0x1
    8002205c:	00500593          	li	a1,5
    80022060:	00048513          	mv	a0,s1
    80022064:	00e7b023          	sd	a4,0(a5)
    80022068:	00000097          	auipc	ra,0x0
    8002206c:	400080e7          	jalr	1024(ra) # 80022468 <__memset>
    80022070:	01813083          	ld	ra,24(sp)
    80022074:	01013403          	ld	s0,16(sp)
    80022078:	00048513          	mv	a0,s1
    8002207c:	00813483          	ld	s1,8(sp)
    80022080:	02010113          	addi	sp,sp,32
    80022084:	00008067          	ret

0000000080022088 <initlock>:
    80022088:	ff010113          	addi	sp,sp,-16
    8002208c:	00813423          	sd	s0,8(sp)
    80022090:	01010413          	addi	s0,sp,16
    80022094:	00813403          	ld	s0,8(sp)
    80022098:	00b53423          	sd	a1,8(a0)
    8002209c:	00052023          	sw	zero,0(a0)
    800220a0:	00053823          	sd	zero,16(a0)
    800220a4:	01010113          	addi	sp,sp,16
    800220a8:	00008067          	ret

00000000800220ac <acquire>:
    800220ac:	fe010113          	addi	sp,sp,-32
    800220b0:	00813823          	sd	s0,16(sp)
    800220b4:	00913423          	sd	s1,8(sp)
    800220b8:	00113c23          	sd	ra,24(sp)
    800220bc:	01213023          	sd	s2,0(sp)
    800220c0:	02010413          	addi	s0,sp,32
    800220c4:	00050493          	mv	s1,a0
    800220c8:	10002973          	csrr	s2,sstatus
    800220cc:	100027f3          	csrr	a5,sstatus
    800220d0:	ffd7f793          	andi	a5,a5,-3
    800220d4:	10079073          	csrw	sstatus,a5
    800220d8:	fffff097          	auipc	ra,0xfffff
    800220dc:	8e4080e7          	jalr	-1820(ra) # 800209bc <mycpu>
    800220e0:	07852783          	lw	a5,120(a0)
    800220e4:	06078e63          	beqz	a5,80022160 <acquire+0xb4>
    800220e8:	fffff097          	auipc	ra,0xfffff
    800220ec:	8d4080e7          	jalr	-1836(ra) # 800209bc <mycpu>
    800220f0:	07852783          	lw	a5,120(a0)
    800220f4:	0004a703          	lw	a4,0(s1)
    800220f8:	0017879b          	addiw	a5,a5,1
    800220fc:	06f52c23          	sw	a5,120(a0)
    80022100:	04071063          	bnez	a4,80022140 <acquire+0x94>
    80022104:	00100713          	li	a4,1
    80022108:	00070793          	mv	a5,a4
    8002210c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80022110:	0007879b          	sext.w	a5,a5
    80022114:	fe079ae3          	bnez	a5,80022108 <acquire+0x5c>
    80022118:	0ff0000f          	fence
    8002211c:	fffff097          	auipc	ra,0xfffff
    80022120:	8a0080e7          	jalr	-1888(ra) # 800209bc <mycpu>
    80022124:	01813083          	ld	ra,24(sp)
    80022128:	01013403          	ld	s0,16(sp)
    8002212c:	00a4b823          	sd	a0,16(s1)
    80022130:	00013903          	ld	s2,0(sp)
    80022134:	00813483          	ld	s1,8(sp)
    80022138:	02010113          	addi	sp,sp,32
    8002213c:	00008067          	ret
    80022140:	0104b903          	ld	s2,16(s1)
    80022144:	fffff097          	auipc	ra,0xfffff
    80022148:	878080e7          	jalr	-1928(ra) # 800209bc <mycpu>
    8002214c:	faa91ce3          	bne	s2,a0,80022104 <acquire+0x58>
    80022150:	00001517          	auipc	a0,0x1
    80022154:	04850513          	addi	a0,a0,72 # 80023198 <digits+0x20>
    80022158:	fffff097          	auipc	ra,0xfffff
    8002215c:	224080e7          	jalr	548(ra) # 8002137c <panic>
    80022160:	00195913          	srli	s2,s2,0x1
    80022164:	fffff097          	auipc	ra,0xfffff
    80022168:	858080e7          	jalr	-1960(ra) # 800209bc <mycpu>
    8002216c:	00197913          	andi	s2,s2,1
    80022170:	07252e23          	sw	s2,124(a0)
    80022174:	f75ff06f          	j	800220e8 <acquire+0x3c>

0000000080022178 <release>:
    80022178:	fe010113          	addi	sp,sp,-32
    8002217c:	00813823          	sd	s0,16(sp)
    80022180:	00113c23          	sd	ra,24(sp)
    80022184:	00913423          	sd	s1,8(sp)
    80022188:	01213023          	sd	s2,0(sp)
    8002218c:	02010413          	addi	s0,sp,32
    80022190:	00052783          	lw	a5,0(a0)
    80022194:	00079a63          	bnez	a5,800221a8 <release+0x30>
    80022198:	00001517          	auipc	a0,0x1
    8002219c:	00850513          	addi	a0,a0,8 # 800231a0 <digits+0x28>
    800221a0:	fffff097          	auipc	ra,0xfffff
    800221a4:	1dc080e7          	jalr	476(ra) # 8002137c <panic>
    800221a8:	01053903          	ld	s2,16(a0)
    800221ac:	00050493          	mv	s1,a0
    800221b0:	fffff097          	auipc	ra,0xfffff
    800221b4:	80c080e7          	jalr	-2036(ra) # 800209bc <mycpu>
    800221b8:	fea910e3          	bne	s2,a0,80022198 <release+0x20>
    800221bc:	0004b823          	sd	zero,16(s1)
    800221c0:	0ff0000f          	fence
    800221c4:	0f50000f          	fence	iorw,ow
    800221c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800221cc:	ffffe097          	auipc	ra,0xffffe
    800221d0:	7f0080e7          	jalr	2032(ra) # 800209bc <mycpu>
    800221d4:	100027f3          	csrr	a5,sstatus
    800221d8:	0027f793          	andi	a5,a5,2
    800221dc:	04079a63          	bnez	a5,80022230 <release+0xb8>
    800221e0:	07852783          	lw	a5,120(a0)
    800221e4:	02f05e63          	blez	a5,80022220 <release+0xa8>
    800221e8:	fff7871b          	addiw	a4,a5,-1
    800221ec:	06e52c23          	sw	a4,120(a0)
    800221f0:	00071c63          	bnez	a4,80022208 <release+0x90>
    800221f4:	07c52783          	lw	a5,124(a0)
    800221f8:	00078863          	beqz	a5,80022208 <release+0x90>
    800221fc:	100027f3          	csrr	a5,sstatus
    80022200:	0027e793          	ori	a5,a5,2
    80022204:	10079073          	csrw	sstatus,a5
    80022208:	01813083          	ld	ra,24(sp)
    8002220c:	01013403          	ld	s0,16(sp)
    80022210:	00813483          	ld	s1,8(sp)
    80022214:	00013903          	ld	s2,0(sp)
    80022218:	02010113          	addi	sp,sp,32
    8002221c:	00008067          	ret
    80022220:	00001517          	auipc	a0,0x1
    80022224:	fa050513          	addi	a0,a0,-96 # 800231c0 <digits+0x48>
    80022228:	fffff097          	auipc	ra,0xfffff
    8002222c:	154080e7          	jalr	340(ra) # 8002137c <panic>
    80022230:	00001517          	auipc	a0,0x1
    80022234:	f7850513          	addi	a0,a0,-136 # 800231a8 <digits+0x30>
    80022238:	fffff097          	auipc	ra,0xfffff
    8002223c:	144080e7          	jalr	324(ra) # 8002137c <panic>

0000000080022240 <holding>:
    80022240:	00052783          	lw	a5,0(a0)
    80022244:	00079663          	bnez	a5,80022250 <holding+0x10>
    80022248:	00000513          	li	a0,0
    8002224c:	00008067          	ret
    80022250:	fe010113          	addi	sp,sp,-32
    80022254:	00813823          	sd	s0,16(sp)
    80022258:	00913423          	sd	s1,8(sp)
    8002225c:	00113c23          	sd	ra,24(sp)
    80022260:	02010413          	addi	s0,sp,32
    80022264:	01053483          	ld	s1,16(a0)
    80022268:	ffffe097          	auipc	ra,0xffffe
    8002226c:	754080e7          	jalr	1876(ra) # 800209bc <mycpu>
    80022270:	01813083          	ld	ra,24(sp)
    80022274:	01013403          	ld	s0,16(sp)
    80022278:	40a48533          	sub	a0,s1,a0
    8002227c:	00153513          	seqz	a0,a0
    80022280:	00813483          	ld	s1,8(sp)
    80022284:	02010113          	addi	sp,sp,32
    80022288:	00008067          	ret

000000008002228c <push_off>:
    8002228c:	fe010113          	addi	sp,sp,-32
    80022290:	00813823          	sd	s0,16(sp)
    80022294:	00113c23          	sd	ra,24(sp)
    80022298:	00913423          	sd	s1,8(sp)
    8002229c:	02010413          	addi	s0,sp,32
    800222a0:	100024f3          	csrr	s1,sstatus
    800222a4:	100027f3          	csrr	a5,sstatus
    800222a8:	ffd7f793          	andi	a5,a5,-3
    800222ac:	10079073          	csrw	sstatus,a5
    800222b0:	ffffe097          	auipc	ra,0xffffe
    800222b4:	70c080e7          	jalr	1804(ra) # 800209bc <mycpu>
    800222b8:	07852783          	lw	a5,120(a0)
    800222bc:	02078663          	beqz	a5,800222e8 <push_off+0x5c>
    800222c0:	ffffe097          	auipc	ra,0xffffe
    800222c4:	6fc080e7          	jalr	1788(ra) # 800209bc <mycpu>
    800222c8:	07852783          	lw	a5,120(a0)
    800222cc:	01813083          	ld	ra,24(sp)
    800222d0:	01013403          	ld	s0,16(sp)
    800222d4:	0017879b          	addiw	a5,a5,1
    800222d8:	06f52c23          	sw	a5,120(a0)
    800222dc:	00813483          	ld	s1,8(sp)
    800222e0:	02010113          	addi	sp,sp,32
    800222e4:	00008067          	ret
    800222e8:	0014d493          	srli	s1,s1,0x1
    800222ec:	ffffe097          	auipc	ra,0xffffe
    800222f0:	6d0080e7          	jalr	1744(ra) # 800209bc <mycpu>
    800222f4:	0014f493          	andi	s1,s1,1
    800222f8:	06952e23          	sw	s1,124(a0)
    800222fc:	fc5ff06f          	j	800222c0 <push_off+0x34>

0000000080022300 <pop_off>:
    80022300:	ff010113          	addi	sp,sp,-16
    80022304:	00813023          	sd	s0,0(sp)
    80022308:	00113423          	sd	ra,8(sp)
    8002230c:	01010413          	addi	s0,sp,16
    80022310:	ffffe097          	auipc	ra,0xffffe
    80022314:	6ac080e7          	jalr	1708(ra) # 800209bc <mycpu>
    80022318:	100027f3          	csrr	a5,sstatus
    8002231c:	0027f793          	andi	a5,a5,2
    80022320:	04079663          	bnez	a5,8002236c <pop_off+0x6c>
    80022324:	07852783          	lw	a5,120(a0)
    80022328:	02f05a63          	blez	a5,8002235c <pop_off+0x5c>
    8002232c:	fff7871b          	addiw	a4,a5,-1
    80022330:	06e52c23          	sw	a4,120(a0)
    80022334:	00071c63          	bnez	a4,8002234c <pop_off+0x4c>
    80022338:	07c52783          	lw	a5,124(a0)
    8002233c:	00078863          	beqz	a5,8002234c <pop_off+0x4c>
    80022340:	100027f3          	csrr	a5,sstatus
    80022344:	0027e793          	ori	a5,a5,2
    80022348:	10079073          	csrw	sstatus,a5
    8002234c:	00813083          	ld	ra,8(sp)
    80022350:	00013403          	ld	s0,0(sp)
    80022354:	01010113          	addi	sp,sp,16
    80022358:	00008067          	ret
    8002235c:	00001517          	auipc	a0,0x1
    80022360:	e6450513          	addi	a0,a0,-412 # 800231c0 <digits+0x48>
    80022364:	fffff097          	auipc	ra,0xfffff
    80022368:	018080e7          	jalr	24(ra) # 8002137c <panic>
    8002236c:	00001517          	auipc	a0,0x1
    80022370:	e3c50513          	addi	a0,a0,-452 # 800231a8 <digits+0x30>
    80022374:	fffff097          	auipc	ra,0xfffff
    80022378:	008080e7          	jalr	8(ra) # 8002137c <panic>

000000008002237c <push_on>:
    8002237c:	fe010113          	addi	sp,sp,-32
    80022380:	00813823          	sd	s0,16(sp)
    80022384:	00113c23          	sd	ra,24(sp)
    80022388:	00913423          	sd	s1,8(sp)
    8002238c:	02010413          	addi	s0,sp,32
    80022390:	100024f3          	csrr	s1,sstatus
    80022394:	100027f3          	csrr	a5,sstatus
    80022398:	0027e793          	ori	a5,a5,2
    8002239c:	10079073          	csrw	sstatus,a5
    800223a0:	ffffe097          	auipc	ra,0xffffe
    800223a4:	61c080e7          	jalr	1564(ra) # 800209bc <mycpu>
    800223a8:	07852783          	lw	a5,120(a0)
    800223ac:	02078663          	beqz	a5,800223d8 <push_on+0x5c>
    800223b0:	ffffe097          	auipc	ra,0xffffe
    800223b4:	60c080e7          	jalr	1548(ra) # 800209bc <mycpu>
    800223b8:	07852783          	lw	a5,120(a0)
    800223bc:	01813083          	ld	ra,24(sp)
    800223c0:	01013403          	ld	s0,16(sp)
    800223c4:	0017879b          	addiw	a5,a5,1
    800223c8:	06f52c23          	sw	a5,120(a0)
    800223cc:	00813483          	ld	s1,8(sp)
    800223d0:	02010113          	addi	sp,sp,32
    800223d4:	00008067          	ret
    800223d8:	0014d493          	srli	s1,s1,0x1
    800223dc:	ffffe097          	auipc	ra,0xffffe
    800223e0:	5e0080e7          	jalr	1504(ra) # 800209bc <mycpu>
    800223e4:	0014f493          	andi	s1,s1,1
    800223e8:	06952e23          	sw	s1,124(a0)
    800223ec:	fc5ff06f          	j	800223b0 <push_on+0x34>

00000000800223f0 <pop_on>:
    800223f0:	ff010113          	addi	sp,sp,-16
    800223f4:	00813023          	sd	s0,0(sp)
    800223f8:	00113423          	sd	ra,8(sp)
    800223fc:	01010413          	addi	s0,sp,16
    80022400:	ffffe097          	auipc	ra,0xffffe
    80022404:	5bc080e7          	jalr	1468(ra) # 800209bc <mycpu>
    80022408:	100027f3          	csrr	a5,sstatus
    8002240c:	0027f793          	andi	a5,a5,2
    80022410:	04078463          	beqz	a5,80022458 <pop_on+0x68>
    80022414:	07852783          	lw	a5,120(a0)
    80022418:	02f05863          	blez	a5,80022448 <pop_on+0x58>
    8002241c:	fff7879b          	addiw	a5,a5,-1
    80022420:	06f52c23          	sw	a5,120(a0)
    80022424:	07853783          	ld	a5,120(a0)
    80022428:	00079863          	bnez	a5,80022438 <pop_on+0x48>
    8002242c:	100027f3          	csrr	a5,sstatus
    80022430:	ffd7f793          	andi	a5,a5,-3
    80022434:	10079073          	csrw	sstatus,a5
    80022438:	00813083          	ld	ra,8(sp)
    8002243c:	00013403          	ld	s0,0(sp)
    80022440:	01010113          	addi	sp,sp,16
    80022444:	00008067          	ret
    80022448:	00001517          	auipc	a0,0x1
    8002244c:	da050513          	addi	a0,a0,-608 # 800231e8 <digits+0x70>
    80022450:	fffff097          	auipc	ra,0xfffff
    80022454:	f2c080e7          	jalr	-212(ra) # 8002137c <panic>
    80022458:	00001517          	auipc	a0,0x1
    8002245c:	d7050513          	addi	a0,a0,-656 # 800231c8 <digits+0x50>
    80022460:	fffff097          	auipc	ra,0xfffff
    80022464:	f1c080e7          	jalr	-228(ra) # 8002137c <panic>

0000000080022468 <__memset>:
    80022468:	ff010113          	addi	sp,sp,-16
    8002246c:	00813423          	sd	s0,8(sp)
    80022470:	01010413          	addi	s0,sp,16
    80022474:	1a060e63          	beqz	a2,80022630 <__memset+0x1c8>
    80022478:	40a007b3          	neg	a5,a0
    8002247c:	0077f793          	andi	a5,a5,7
    80022480:	00778693          	addi	a3,a5,7
    80022484:	00b00813          	li	a6,11
    80022488:	0ff5f593          	andi	a1,a1,255
    8002248c:	fff6071b          	addiw	a4,a2,-1
    80022490:	1b06e663          	bltu	a3,a6,8002263c <__memset+0x1d4>
    80022494:	1cd76463          	bltu	a4,a3,8002265c <__memset+0x1f4>
    80022498:	1a078e63          	beqz	a5,80022654 <__memset+0x1ec>
    8002249c:	00b50023          	sb	a1,0(a0)
    800224a0:	00100713          	li	a4,1
    800224a4:	1ae78463          	beq	a5,a4,8002264c <__memset+0x1e4>
    800224a8:	00b500a3          	sb	a1,1(a0)
    800224ac:	00200713          	li	a4,2
    800224b0:	1ae78a63          	beq	a5,a4,80022664 <__memset+0x1fc>
    800224b4:	00b50123          	sb	a1,2(a0)
    800224b8:	00300713          	li	a4,3
    800224bc:	18e78463          	beq	a5,a4,80022644 <__memset+0x1dc>
    800224c0:	00b501a3          	sb	a1,3(a0)
    800224c4:	00400713          	li	a4,4
    800224c8:	1ae78263          	beq	a5,a4,8002266c <__memset+0x204>
    800224cc:	00b50223          	sb	a1,4(a0)
    800224d0:	00500713          	li	a4,5
    800224d4:	1ae78063          	beq	a5,a4,80022674 <__memset+0x20c>
    800224d8:	00b502a3          	sb	a1,5(a0)
    800224dc:	00700713          	li	a4,7
    800224e0:	18e79e63          	bne	a5,a4,8002267c <__memset+0x214>
    800224e4:	00b50323          	sb	a1,6(a0)
    800224e8:	00700e93          	li	t4,7
    800224ec:	00859713          	slli	a4,a1,0x8
    800224f0:	00e5e733          	or	a4,a1,a4
    800224f4:	01059e13          	slli	t3,a1,0x10
    800224f8:	01c76e33          	or	t3,a4,t3
    800224fc:	01859313          	slli	t1,a1,0x18
    80022500:	006e6333          	or	t1,t3,t1
    80022504:	02059893          	slli	a7,a1,0x20
    80022508:	40f60e3b          	subw	t3,a2,a5
    8002250c:	011368b3          	or	a7,t1,a7
    80022510:	02859813          	slli	a6,a1,0x28
    80022514:	0108e833          	or	a6,a7,a6
    80022518:	03059693          	slli	a3,a1,0x30
    8002251c:	003e589b          	srliw	a7,t3,0x3
    80022520:	00d866b3          	or	a3,a6,a3
    80022524:	03859713          	slli	a4,a1,0x38
    80022528:	00389813          	slli	a6,a7,0x3
    8002252c:	00f507b3          	add	a5,a0,a5
    80022530:	00e6e733          	or	a4,a3,a4
    80022534:	000e089b          	sext.w	a7,t3
    80022538:	00f806b3          	add	a3,a6,a5
    8002253c:	00e7b023          	sd	a4,0(a5)
    80022540:	00878793          	addi	a5,a5,8
    80022544:	fed79ce3          	bne	a5,a3,8002253c <__memset+0xd4>
    80022548:	ff8e7793          	andi	a5,t3,-8
    8002254c:	0007871b          	sext.w	a4,a5
    80022550:	01d787bb          	addw	a5,a5,t4
    80022554:	0ce88e63          	beq	a7,a4,80022630 <__memset+0x1c8>
    80022558:	00f50733          	add	a4,a0,a5
    8002255c:	00b70023          	sb	a1,0(a4)
    80022560:	0017871b          	addiw	a4,a5,1
    80022564:	0cc77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022568:	00e50733          	add	a4,a0,a4
    8002256c:	00b70023          	sb	a1,0(a4)
    80022570:	0027871b          	addiw	a4,a5,2
    80022574:	0ac77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022578:	00e50733          	add	a4,a0,a4
    8002257c:	00b70023          	sb	a1,0(a4)
    80022580:	0037871b          	addiw	a4,a5,3
    80022584:	0ac77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022588:	00e50733          	add	a4,a0,a4
    8002258c:	00b70023          	sb	a1,0(a4)
    80022590:	0047871b          	addiw	a4,a5,4
    80022594:	08c77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022598:	00e50733          	add	a4,a0,a4
    8002259c:	00b70023          	sb	a1,0(a4)
    800225a0:	0057871b          	addiw	a4,a5,5
    800225a4:	08c77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225a8:	00e50733          	add	a4,a0,a4
    800225ac:	00b70023          	sb	a1,0(a4)
    800225b0:	0067871b          	addiw	a4,a5,6
    800225b4:	06c77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225b8:	00e50733          	add	a4,a0,a4
    800225bc:	00b70023          	sb	a1,0(a4)
    800225c0:	0077871b          	addiw	a4,a5,7
    800225c4:	06c77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225c8:	00e50733          	add	a4,a0,a4
    800225cc:	00b70023          	sb	a1,0(a4)
    800225d0:	0087871b          	addiw	a4,a5,8
    800225d4:	04c77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225d8:	00e50733          	add	a4,a0,a4
    800225dc:	00b70023          	sb	a1,0(a4)
    800225e0:	0097871b          	addiw	a4,a5,9
    800225e4:	04c77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225e8:	00e50733          	add	a4,a0,a4
    800225ec:	00b70023          	sb	a1,0(a4)
    800225f0:	00a7871b          	addiw	a4,a5,10
    800225f4:	02c77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    800225f8:	00e50733          	add	a4,a0,a4
    800225fc:	00b70023          	sb	a1,0(a4)
    80022600:	00b7871b          	addiw	a4,a5,11
    80022604:	02c77663          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022608:	00e50733          	add	a4,a0,a4
    8002260c:	00b70023          	sb	a1,0(a4)
    80022610:	00c7871b          	addiw	a4,a5,12
    80022614:	00c77e63          	bgeu	a4,a2,80022630 <__memset+0x1c8>
    80022618:	00e50733          	add	a4,a0,a4
    8002261c:	00b70023          	sb	a1,0(a4)
    80022620:	00d7879b          	addiw	a5,a5,13
    80022624:	00c7f663          	bgeu	a5,a2,80022630 <__memset+0x1c8>
    80022628:	00f507b3          	add	a5,a0,a5
    8002262c:	00b78023          	sb	a1,0(a5)
    80022630:	00813403          	ld	s0,8(sp)
    80022634:	01010113          	addi	sp,sp,16
    80022638:	00008067          	ret
    8002263c:	00b00693          	li	a3,11
    80022640:	e55ff06f          	j	80022494 <__memset+0x2c>
    80022644:	00300e93          	li	t4,3
    80022648:	ea5ff06f          	j	800224ec <__memset+0x84>
    8002264c:	00100e93          	li	t4,1
    80022650:	e9dff06f          	j	800224ec <__memset+0x84>
    80022654:	00000e93          	li	t4,0
    80022658:	e95ff06f          	j	800224ec <__memset+0x84>
    8002265c:	00000793          	li	a5,0
    80022660:	ef9ff06f          	j	80022558 <__memset+0xf0>
    80022664:	00200e93          	li	t4,2
    80022668:	e85ff06f          	j	800224ec <__memset+0x84>
    8002266c:	00400e93          	li	t4,4
    80022670:	e7dff06f          	j	800224ec <__memset+0x84>
    80022674:	00500e93          	li	t4,5
    80022678:	e75ff06f          	j	800224ec <__memset+0x84>
    8002267c:	00600e93          	li	t4,6
    80022680:	e6dff06f          	j	800224ec <__memset+0x84>

0000000080022684 <__memmove>:
    80022684:	ff010113          	addi	sp,sp,-16
    80022688:	00813423          	sd	s0,8(sp)
    8002268c:	01010413          	addi	s0,sp,16
    80022690:	0e060863          	beqz	a2,80022780 <__memmove+0xfc>
    80022694:	fff6069b          	addiw	a3,a2,-1
    80022698:	0006881b          	sext.w	a6,a3
    8002269c:	0ea5e863          	bltu	a1,a0,8002278c <__memmove+0x108>
    800226a0:	00758713          	addi	a4,a1,7
    800226a4:	00a5e7b3          	or	a5,a1,a0
    800226a8:	40a70733          	sub	a4,a4,a0
    800226ac:	0077f793          	andi	a5,a5,7
    800226b0:	00f73713          	sltiu	a4,a4,15
    800226b4:	00174713          	xori	a4,a4,1
    800226b8:	0017b793          	seqz	a5,a5
    800226bc:	00e7f7b3          	and	a5,a5,a4
    800226c0:	10078863          	beqz	a5,800227d0 <__memmove+0x14c>
    800226c4:	00900793          	li	a5,9
    800226c8:	1107f463          	bgeu	a5,a6,800227d0 <__memmove+0x14c>
    800226cc:	0036581b          	srliw	a6,a2,0x3
    800226d0:	fff8081b          	addiw	a6,a6,-1
    800226d4:	02081813          	slli	a6,a6,0x20
    800226d8:	01d85893          	srli	a7,a6,0x1d
    800226dc:	00858813          	addi	a6,a1,8
    800226e0:	00058793          	mv	a5,a1
    800226e4:	00050713          	mv	a4,a0
    800226e8:	01088833          	add	a6,a7,a6
    800226ec:	0007b883          	ld	a7,0(a5)
    800226f0:	00878793          	addi	a5,a5,8
    800226f4:	00870713          	addi	a4,a4,8
    800226f8:	ff173c23          	sd	a7,-8(a4)
    800226fc:	ff0798e3          	bne	a5,a6,800226ec <__memmove+0x68>
    80022700:	ff867713          	andi	a4,a2,-8
    80022704:	02071793          	slli	a5,a4,0x20
    80022708:	0207d793          	srli	a5,a5,0x20
    8002270c:	00f585b3          	add	a1,a1,a5
    80022710:	40e686bb          	subw	a3,a3,a4
    80022714:	00f507b3          	add	a5,a0,a5
    80022718:	06e60463          	beq	a2,a4,80022780 <__memmove+0xfc>
    8002271c:	0005c703          	lbu	a4,0(a1)
    80022720:	00e78023          	sb	a4,0(a5)
    80022724:	04068e63          	beqz	a3,80022780 <__memmove+0xfc>
    80022728:	0015c603          	lbu	a2,1(a1)
    8002272c:	00100713          	li	a4,1
    80022730:	00c780a3          	sb	a2,1(a5)
    80022734:	04e68663          	beq	a3,a4,80022780 <__memmove+0xfc>
    80022738:	0025c603          	lbu	a2,2(a1)
    8002273c:	00200713          	li	a4,2
    80022740:	00c78123          	sb	a2,2(a5)
    80022744:	02e68e63          	beq	a3,a4,80022780 <__memmove+0xfc>
    80022748:	0035c603          	lbu	a2,3(a1)
    8002274c:	00300713          	li	a4,3
    80022750:	00c781a3          	sb	a2,3(a5)
    80022754:	02e68663          	beq	a3,a4,80022780 <__memmove+0xfc>
    80022758:	0045c603          	lbu	a2,4(a1)
    8002275c:	00400713          	li	a4,4
    80022760:	00c78223          	sb	a2,4(a5)
    80022764:	00e68e63          	beq	a3,a4,80022780 <__memmove+0xfc>
    80022768:	0055c603          	lbu	a2,5(a1)
    8002276c:	00500713          	li	a4,5
    80022770:	00c782a3          	sb	a2,5(a5)
    80022774:	00e68663          	beq	a3,a4,80022780 <__memmove+0xfc>
    80022778:	0065c703          	lbu	a4,6(a1)
    8002277c:	00e78323          	sb	a4,6(a5)
    80022780:	00813403          	ld	s0,8(sp)
    80022784:	01010113          	addi	sp,sp,16
    80022788:	00008067          	ret
    8002278c:	02061713          	slli	a4,a2,0x20
    80022790:	02075713          	srli	a4,a4,0x20
    80022794:	00e587b3          	add	a5,a1,a4
    80022798:	f0f574e3          	bgeu	a0,a5,800226a0 <__memmove+0x1c>
    8002279c:	02069613          	slli	a2,a3,0x20
    800227a0:	02065613          	srli	a2,a2,0x20
    800227a4:	fff64613          	not	a2,a2
    800227a8:	00e50733          	add	a4,a0,a4
    800227ac:	00c78633          	add	a2,a5,a2
    800227b0:	fff7c683          	lbu	a3,-1(a5)
    800227b4:	fff78793          	addi	a5,a5,-1
    800227b8:	fff70713          	addi	a4,a4,-1
    800227bc:	00d70023          	sb	a3,0(a4)
    800227c0:	fec798e3          	bne	a5,a2,800227b0 <__memmove+0x12c>
    800227c4:	00813403          	ld	s0,8(sp)
    800227c8:	01010113          	addi	sp,sp,16
    800227cc:	00008067          	ret
    800227d0:	02069713          	slli	a4,a3,0x20
    800227d4:	02075713          	srli	a4,a4,0x20
    800227d8:	00170713          	addi	a4,a4,1
    800227dc:	00e50733          	add	a4,a0,a4
    800227e0:	00050793          	mv	a5,a0
    800227e4:	0005c683          	lbu	a3,0(a1)
    800227e8:	00178793          	addi	a5,a5,1
    800227ec:	00158593          	addi	a1,a1,1
    800227f0:	fed78fa3          	sb	a3,-1(a5)
    800227f4:	fee798e3          	bne	a5,a4,800227e4 <__memmove+0x160>
    800227f8:	f89ff06f          	j	80022780 <__memmove+0xfc>

00000000800227fc <__putc>:
    800227fc:	fe010113          	addi	sp,sp,-32
    80022800:	00813823          	sd	s0,16(sp)
    80022804:	00113c23          	sd	ra,24(sp)
    80022808:	02010413          	addi	s0,sp,32
    8002280c:	00050793          	mv	a5,a0
    80022810:	fef40593          	addi	a1,s0,-17
    80022814:	00100613          	li	a2,1
    80022818:	00000513          	li	a0,0
    8002281c:	fef407a3          	sb	a5,-17(s0)
    80022820:	fffff097          	auipc	ra,0xfffff
    80022824:	b3c080e7          	jalr	-1220(ra) # 8002135c <console_write>
    80022828:	01813083          	ld	ra,24(sp)
    8002282c:	01013403          	ld	s0,16(sp)
    80022830:	02010113          	addi	sp,sp,32
    80022834:	00008067          	ret

0000000080022838 <__getc>:
    80022838:	fe010113          	addi	sp,sp,-32
    8002283c:	00813823          	sd	s0,16(sp)
    80022840:	00113c23          	sd	ra,24(sp)
    80022844:	02010413          	addi	s0,sp,32
    80022848:	fe840593          	addi	a1,s0,-24
    8002284c:	00100613          	li	a2,1
    80022850:	00000513          	li	a0,0
    80022854:	fffff097          	auipc	ra,0xfffff
    80022858:	ae8080e7          	jalr	-1304(ra) # 8002133c <console_read>
    8002285c:	fe844503          	lbu	a0,-24(s0)
    80022860:	01813083          	ld	ra,24(sp)
    80022864:	01013403          	ld	s0,16(sp)
    80022868:	02010113          	addi	sp,sp,32
    8002286c:	00008067          	ret

0000000080022870 <console_handler>:
    80022870:	fe010113          	addi	sp,sp,-32
    80022874:	00813823          	sd	s0,16(sp)
    80022878:	00113c23          	sd	ra,24(sp)
    8002287c:	00913423          	sd	s1,8(sp)
    80022880:	02010413          	addi	s0,sp,32
    80022884:	14202773          	csrr	a4,scause
    80022888:	100027f3          	csrr	a5,sstatus
    8002288c:	0027f793          	andi	a5,a5,2
    80022890:	06079e63          	bnez	a5,8002290c <console_handler+0x9c>
    80022894:	00074c63          	bltz	a4,800228ac <console_handler+0x3c>
    80022898:	01813083          	ld	ra,24(sp)
    8002289c:	01013403          	ld	s0,16(sp)
    800228a0:	00813483          	ld	s1,8(sp)
    800228a4:	02010113          	addi	sp,sp,32
    800228a8:	00008067          	ret
    800228ac:	0ff77713          	andi	a4,a4,255
    800228b0:	00900793          	li	a5,9
    800228b4:	fef712e3          	bne	a4,a5,80022898 <console_handler+0x28>
    800228b8:	ffffe097          	auipc	ra,0xffffe
    800228bc:	6dc080e7          	jalr	1756(ra) # 80020f94 <plic_claim>
    800228c0:	00a00793          	li	a5,10
    800228c4:	00050493          	mv	s1,a0
    800228c8:	02f50c63          	beq	a0,a5,80022900 <console_handler+0x90>
    800228cc:	fc0506e3          	beqz	a0,80022898 <console_handler+0x28>
    800228d0:	00050593          	mv	a1,a0
    800228d4:	00001517          	auipc	a0,0x1
    800228d8:	81c50513          	addi	a0,a0,-2020 # 800230f0 <CONSOLE_STATUS+0xe0>
    800228dc:	fffff097          	auipc	ra,0xfffff
    800228e0:	afc080e7          	jalr	-1284(ra) # 800213d8 <__printf>
    800228e4:	01013403          	ld	s0,16(sp)
    800228e8:	01813083          	ld	ra,24(sp)
    800228ec:	00048513          	mv	a0,s1
    800228f0:	00813483          	ld	s1,8(sp)
    800228f4:	02010113          	addi	sp,sp,32
    800228f8:	ffffe317          	auipc	t1,0xffffe
    800228fc:	6d430067          	jr	1748(t1) # 80020fcc <plic_complete>
    80022900:	fffff097          	auipc	ra,0xfffff
    80022904:	3e0080e7          	jalr	992(ra) # 80021ce0 <uartintr>
    80022908:	fddff06f          	j	800228e4 <console_handler+0x74>
    8002290c:	00001517          	auipc	a0,0x1
    80022910:	8e450513          	addi	a0,a0,-1820 # 800231f0 <digits+0x78>
    80022914:	fffff097          	auipc	ra,0xfffff
    80022918:	a68080e7          	jalr	-1432(ra) # 8002137c <panic>
	...
