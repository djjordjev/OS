
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00023117          	auipc	sp,0x23
    80000004:	3b013103          	ld	sp,944(sp) # 800233b0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3f0200ef          	jal	ra,8002040c <start>

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
#include "../h/MemoryAllocator.h"

extern "C" uint64 TrapHandler(uint64* savedRegisters){

    uint64 scause;
    asm volatile("csrr %0, scause" : "=r"(scause));
    80020000:	142027f3          	csrr	a5,scause

    uint64 sysCallCode = savedRegisters[13];
    80020004:	06853703          	ld	a4,104(a0) # 1068 <_entry-0x7fffef98>

    if(scause == 0x8 || scause == 0x9){
    80020008:	ff878793          	addi	a5,a5,-8
    8002000c:	00100693          	li	a3,1
    80020010:	04f6ec63          	bltu	a3,a5,80020068 <TrapHandler+0x68>
extern "C" uint64 TrapHandler(uint64* savedRegisters){
    80020014:	ff010113          	addi	sp,sp,-16
    80020018:	00113423          	sd	ra,8(sp)
    8002001c:	00813023          	sd	s0,0(sp)
    80020020:	01010413          	addi	s0,sp,16

        if(sysCallCode == 0x1){
    80020024:	00100793          	li	a5,1
    80020028:	02f70063          	beq	a4,a5,80020048 <TrapHandler+0x48>
            void* addr = MemoryAllocator::malloc(sizeInBlocks);
            return (uint64)addr;
            //...
        }

        if(sysCallCode == 0x2){
    8002002c:	00200793          	li	a5,2
    80020030:	02f70463          	beq	a4,a5,80020058 <TrapHandler+0x58>
            //...
        }

    }

    return -1;
    80020034:	fff00513          	li	a0,-1

    80020038:	00813083          	ld	ra,8(sp)
    8002003c:	00013403          	ld	s0,0(sp)
    80020040:	01010113          	addi	sp,sp,16
    80020044:	00008067          	ret
            void* addr = MemoryAllocator::malloc(sizeInBlocks);
    80020048:	07053503          	ld	a0,112(a0)
    8002004c:	00000097          	auipc	ra,0x0
    80020050:	180080e7          	jalr	384(ra) # 800201cc <_ZN15MemoryAllocator6mallocEm>
            return (uint64)addr;
    80020054:	fe5ff06f          	j	80020038 <TrapHandler+0x38>
            int status = MemoryAllocator::dealloc(at);
    80020058:	07053503          	ld	a0,112(a0)
    8002005c:	00000097          	auipc	ra,0x0
    80020060:	2a0080e7          	jalr	672(ra) # 800202fc <_ZN15MemoryAllocator7deallocEPv>
            return (uint64)status;
    80020064:	fd5ff06f          	j	80020038 <TrapHandler+0x38>
    return -1;
    80020068:	fff00513          	li	a0,-1
    8002006c:	00008067          	ret

0000000080020070 <main>:
#include "../h/syscall.h"

extern "C" void trap();
extern "C" uint64 TrapHandler(uint64* savedRegisters);

int main(){
    80020070:	ff010113          	addi	sp,sp,-16
    80020074:	00113423          	sd	ra,8(sp)
    80020078:	00813023          	sd	s0,0(sp)
    8002007c:	01010413          	addi	s0,sp,16
    MemoryAllocator::initialize();
    80020080:	00000097          	auipc	ra,0x0
    80020084:	0fc080e7          	jalr	252(ra) # 8002017c <_ZN15MemoryAllocator10initializeEv>
    asm volatile("csrw stvec, %0" : : "r"(trap));
    80020088:	00003797          	auipc	a5,0x3
    8002008c:	3307b783          	ld	a5,816(a5) # 800233b8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80020090:	10579073          	csrw	stvec,a5

    void* addr = mem_alloc(50);
    80020094:	03200513          	li	a0,50
    80020098:	00000097          	auipc	ra,0x0
    8002009c:	080080e7          	jalr	128(ra) # 80020118 <_Z9mem_allocm>
    int status = mem_free(addr);
    800200a0:	00000097          	auipc	ra,0x0
    800200a4:	0ac080e7          	jalr	172(ra) # 8002014c <_Z8mem_freePv>

    if(status) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');
    800200a8:	04051a63          	bnez	a0,800200fc <main+0x8c>
    800200ac:	05500513          	li	a0,85
    800200b0:	00002097          	auipc	ra,0x2
    800200b4:	41c080e7          	jalr	1052(ra) # 800224cc <__putc>
    800200b8:	05300513          	li	a0,83
    800200bc:	00002097          	auipc	ra,0x2
    800200c0:	410080e7          	jalr	1040(ra) # 800224cc <__putc>
    800200c4:	05000513          	li	a0,80
    800200c8:	00002097          	auipc	ra,0x2
    800200cc:	404080e7          	jalr	1028(ra) # 800224cc <__putc>
    800200d0:	04500513          	li	a0,69
    800200d4:	00002097          	auipc	ra,0x2
    800200d8:	3f8080e7          	jalr	1016(ra) # 800224cc <__putc>
    800200dc:	04800513          	li	a0,72
    800200e0:	00002097          	auipc	ra,0x2
    800200e4:	3ec080e7          	jalr	1004(ra) # 800224cc <__putc>

    return 0;
    800200e8:	00000513          	li	a0,0
    800200ec:	00813083          	ld	ra,8(sp)
    800200f0:	00013403          	ld	s0,0(sp)
    800200f4:	01010113          	addi	sp,sp,16
    800200f8:	00008067          	ret
    if(status) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');
    800200fc:	04e00513          	li	a0,78
    80020100:	00002097          	auipc	ra,0x2
    80020104:	3cc080e7          	jalr	972(ra) # 800224cc <__putc>
    80020108:	04500513          	li	a0,69
    8002010c:	00002097          	auipc	ra,0x2
    80020110:	3c0080e7          	jalr	960(ra) # 800224cc <__putc>
    80020114:	f99ff06f          	j	800200ac <main+0x3c>

0000000080020118 <_Z9mem_allocm>:
#include "../h/syscall.h"

void* mem_alloc(size_t sizeInBytes){
    80020118:	ff010113          	addi	sp,sp,-16
    8002011c:	00813423          	sd	s0,8(sp)
    80020120:	01010413          	addi	s0,sp,16
    size_t sizeInBlocks = (sizeInBytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80020124:	03f50793          	addi	a5,a0,63
    80020128:	0067d793          	srli	a5,a5,0x6
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(result)
    : "r"(sizeInBlocks)
    : "a0", "a1"
    );
    8002012c:	00100513          	li	a0,1
    80020130:	00078593          	mv	a1,a5
    80020134:	00000073          	ecall
    80020138:	00050793          	mv	a5,a0

    return result;
}
    8002013c:	00078513          	mv	a0,a5
    80020140:	00813403          	ld	s0,8(sp)
    80020144:	01010113          	addi	sp,sp,16
    80020148:	00008067          	ret

000000008002014c <_Z8mem_freePv>:

int mem_free(void* at){
    8002014c:	ff010113          	addi	sp,sp,-16
    80020150:	00813423          	sd	s0,8(sp)
    80020154:	01010413          	addi	s0,sp,16
    80020158:	00050793          	mv	a5,a0
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(status)
    : "r"(at)
    : "a0", "a1"
    );
    8002015c:	00200513          	li	a0,2
    80020160:	00078593          	mv	a1,a5
    80020164:	00000073          	ecall
    80020168:	00050793          	mv	a5,a0

    return status;
    8002016c:	0007851b          	sext.w	a0,a5
    80020170:	00813403          	ld	s0,8(sp)
    80020174:	01010113          	addi	sp,sp,16
    80020178:	00008067          	ret

000000008002017c <_ZN15MemoryAllocator10initializeEv>:
#include "../h/MemoryAllocator.h"

MemoryAllocator::MemBlock* MemoryAllocator::free_mem_head = nullptr;

void MemoryAllocator::initialize(){
    8002017c:	ff010113          	addi	sp,sp,-16
    80020180:	00813423          	sd	s0,8(sp)
    80020184:	01010413          	addi	s0,sp,16
    free_mem_head = (MemBlock*)HEAP_START_ADDR;
    80020188:	00003797          	auipc	a5,0x3
    8002018c:	2207b783          	ld	a5,544(a5) # 800233a8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80020190:	0007b703          	ld	a4,0(a5)
    80020194:	00003697          	auipc	a3,0x3
    80020198:	27c68693          	addi	a3,a3,636 # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
    8002019c:	00e6b023          	sd	a4,0(a3)
    free_mem_head->sizeInBlocks = ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    800201a0:	00003797          	auipc	a5,0x3
    800201a4:	2207b783          	ld	a5,544(a5) # 800233c0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800201a8:	0007b783          	ld	a5,0(a5)
    800201ac:	40e787b3          	sub	a5,a5,a4
    800201b0:	0067d793          	srli	a5,a5,0x6
    800201b4:	00f73023          	sd	a5,0(a4)
    free_mem_head->next = nullptr;
    800201b8:	0006b783          	ld	a5,0(a3)
    800201bc:	0007b423          	sd	zero,8(a5)
}
    800201c0:	00813403          	ld	s0,8(sp)
    800201c4:	01010113          	addi	sp,sp,16
    800201c8:	00008067          	ret

00000000800201cc <_ZN15MemoryAllocator6mallocEm>:

void* MemoryAllocator::malloc(size_t sizeInBlocks){
    800201cc:	ff010113          	addi	sp,sp,-16
    800201d0:	00813423          	sd	s0,8(sp)
    800201d4:	01010413          	addi	s0,sp,16
    // sizeInBlocks - velicina prostora u blokovima
    if(sizeInBlocks == 0 || sizeInBlocks*MEM_BLOCK_SIZE > ((uint64)HEAP_END_ADDR - 
    800201d8:	0e050263          	beqz	a0,800202bc <_ZN15MemoryAllocator6mallocEm+0xf0>
    800201dc:	00050793          	mv	a5,a0
    800201e0:	00651693          	slli	a3,a0,0x6
    800201e4:	00003717          	auipc	a4,0x3
    800201e8:	1dc73703          	ld	a4,476(a4) # 800233c0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800201ec:	00073703          	ld	a4,0(a4)
    800201f0:	00003617          	auipc	a2,0x3
    800201f4:	1b863603          	ld	a2,440(a2) # 800233a8 <_GLOBAL_OFFSET_TABLE_+0x8>
    800201f8:	00063603          	ld	a2,0(a2)
    800201fc:	40c70733          	sub	a4,a4,a2
    80020200:	0cd76263          	bltu	a4,a3,800202c4 <_ZN15MemoryAllocator6mallocEm+0xf8>
                        (uint64)HEAP_START_ADDR)) 
    return nullptr;

    MemBlock* block = free_mem_head;
    80020204:	00003517          	auipc	a0,0x3
    80020208:	20c53503          	ld	a0,524(a0) # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
    MemBlock* prev = nullptr;
    8002020c:	00000613          	li	a2,0
    
    for(; block != nullptr; block = block->next){
    80020210:	00050e63          	beqz	a0,8002022c <_ZN15MemoryAllocator6mallocEm+0x60>
        if(block->sizeInBlocks >= (sizeInBlocks + HEADER_SIZE)) break; // alocira se dodatni pred-blok u kome se nalazi informacija o velicini alociranog dela memorije
    80020214:	00053683          	ld	a3,0(a0)
    80020218:	00178713          	addi	a4,a5,1
    8002021c:	00e6f863          	bgeu	a3,a4,8002022c <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = block;
    80020220:	00050613          	mv	a2,a0
    for(; block != nullptr; block = block->next){
    80020224:	00853503          	ld	a0,8(a0)
    80020228:	fe9ff06f          	j	80020210 <_ZN15MemoryAllocator6mallocEm+0x44>
    }

    if(block == nullptr) return nullptr;
    8002022c:	04050463          	beqz	a0,80020274 <_ZN15MemoryAllocator6mallocEm+0xa8>

    size_t remaining_size = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
    80020230:	00053703          	ld	a4,0(a0)
    80020234:	40f70733          	sub	a4,a4,a5
    80020238:	fff70713          	addi	a4,a4,-1
    if(remaining_size > HEADER_SIZE) {
    8002023c:	00100693          	li	a3,1
    80020240:	04e6f663          	bgeu	a3,a4,8002028c <_ZN15MemoryAllocator6mallocEm+0xc0>
        MemBlock* new_free = (MemBlock*)((char*)block + MEM_BLOCK_SIZE*(sizeInBlocks + HEADER_SIZE));
    80020244:	00178693          	addi	a3,a5,1
    80020248:	00669693          	slli	a3,a3,0x6
    8002024c:	00d506b3          	add	a3,a0,a3
        new_free->sizeInBlocks = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
    80020250:	00e6b023          	sd	a4,0(a3)
        new_free->next = block->next;
    80020254:	00853703          	ld	a4,8(a0)
    80020258:	00e6b423          	sd	a4,8(a3)
        if(prev) prev->next = new_free;
    8002025c:	02060263          	beqz	a2,80020280 <_ZN15MemoryAllocator6mallocEm+0xb4>
    80020260:	00d63423          	sd	a3,8(a2)
    }

    // zadrzava se MemBlock header
    // on se nalazi u bloku ispod novoalociranje memorije
    // ovo se koristi pri dealokaciji
    block->sizeInBlocks = sizeInBlocks + HEADER_SIZE;
    80020264:	00178793          	addi	a5,a5,1
    80020268:	00f53023          	sd	a5,0(a0)
    block->next = nullptr;
    8002026c:	00053423          	sd	zero,8(a0)
    return (void*)((char*)block + MEM_BLOCK_SIZE);
    80020270:	04050513          	addi	a0,a0,64
}
    80020274:	00813403          	ld	s0,8(sp)
    80020278:	01010113          	addi	sp,sp,16
    8002027c:	00008067          	ret
        else free_mem_head = new_free;
    80020280:	00003717          	auipc	a4,0x3
    80020284:	18d73823          	sd	a3,400(a4) # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
    80020288:	fddff06f          	j	80020264 <_ZN15MemoryAllocator6mallocEm+0x98>
        if(remaining_size == HEADER_SIZE) sizeInBlocks += HEADER_SIZE;
    8002028c:	00100693          	li	a3,1
    80020290:	00d70a63          	beq	a4,a3,800202a4 <_ZN15MemoryAllocator6mallocEm+0xd8>
        if(prev) prev->next = block->next;
    80020294:	00060c63          	beqz	a2,800202ac <_ZN15MemoryAllocator6mallocEm+0xe0>
    80020298:	00853703          	ld	a4,8(a0)
    8002029c:	00e63423          	sd	a4,8(a2)
    800202a0:	fc5ff06f          	j	80020264 <_ZN15MemoryAllocator6mallocEm+0x98>
        if(remaining_size == HEADER_SIZE) sizeInBlocks += HEADER_SIZE;
    800202a4:	00178793          	addi	a5,a5,1
    800202a8:	fedff06f          	j	80020294 <_ZN15MemoryAllocator6mallocEm+0xc8>
        else free_mem_head = block->next;
    800202ac:	00853703          	ld	a4,8(a0)
    800202b0:	00003697          	auipc	a3,0x3
    800202b4:	16e6b023          	sd	a4,352(a3) # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
    800202b8:	fadff06f          	j	80020264 <_ZN15MemoryAllocator6mallocEm+0x98>
    return nullptr;
    800202bc:	00000513          	li	a0,0
    800202c0:	fb5ff06f          	j	80020274 <_ZN15MemoryAllocator6mallocEm+0xa8>
    800202c4:	00000513          	li	a0,0
    800202c8:	fadff06f          	j	80020274 <_ZN15MemoryAllocator6mallocEm+0xa8>

00000000800202cc <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>:

void MemoryAllocator::merge(MemBlock* low, MemBlock* high){
    800202cc:	ff010113          	addi	sp,sp,-16
    800202d0:	00813423          	sd	s0,8(sp)
    800202d4:	01010413          	addi	s0,sp,16
    low->sizeInBlocks += high->sizeInBlocks;
    800202d8:	0005b703          	ld	a4,0(a1)
    800202dc:	00053783          	ld	a5,0(a0)
    800202e0:	00e787b3          	add	a5,a5,a4
    800202e4:	00f53023          	sd	a5,0(a0)
    low->next = high->next;
    800202e8:	0085b783          	ld	a5,8(a1)
    800202ec:	00f53423          	sd	a5,8(a0)
}
    800202f0:	00813403          	ld	s0,8(sp)
    800202f4:	01010113          	addi	sp,sp,16
    800202f8:	00008067          	ret

00000000800202fc <_ZN15MemoryAllocator7deallocEPv>:

int MemoryAllocator::dealloc(void* at){
    if(!at) return -1;
    800202fc:	0e050863          	beqz	a0,800203ec <_ZN15MemoryAllocator7deallocEPv+0xf0>
    if((char*)at < (char*)HEAP_START_ADDR + MEM_BLOCK_SIZE || (char*)at >= HEAP_END_ADDR) return -2;
    80020300:	00003797          	auipc	a5,0x3
    80020304:	0a87b783          	ld	a5,168(a5) # 800233a8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80020308:	0007b783          	ld	a5,0(a5)
    8002030c:	04078793          	addi	a5,a5,64
    80020310:	0ef56263          	bltu	a0,a5,800203f4 <_ZN15MemoryAllocator7deallocEPv+0xf8>
    80020314:	00003797          	auipc	a5,0x3
    80020318:	0ac7b783          	ld	a5,172(a5) # 800233c0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8002031c:	0007b783          	ld	a5,0(a5)
    80020320:	0cf57e63          	bgeu	a0,a5,800203fc <_ZN15MemoryAllocator7deallocEPv+0x100>
int MemoryAllocator::dealloc(void* at){
    80020324:	fe010113          	addi	sp,sp,-32
    80020328:	00113c23          	sd	ra,24(sp)
    8002032c:	00813823          	sd	s0,16(sp)
    80020330:	00913423          	sd	s1,8(sp)
    80020334:	01213023          	sd	s2,0(sp)
    80020338:	02010413          	addi	s0,sp,32

    // MemBlock struktura koja sadrzi velicinu segmenta za brisanje
    MemBlock* new_free_mem_block = (MemBlock*)((char*)at - MEM_BLOCK_SIZE);
    8002033c:	fc050913          	addi	s2,a0,-64
    
    MemBlock* next = free_mem_head;
    80020340:	00003597          	auipc	a1,0x3
    80020344:	0d05b583          	ld	a1,208(a1) # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
    MemBlock* prev = nullptr;
    80020348:	00000493          	li	s1,0
    for(; next; next = next->next){
    8002034c:	00058a63          	beqz	a1,80020360 <_ZN15MemoryAllocator7deallocEPv+0x64>
        if((void*)next > (void*)new_free_mem_block) break;
    80020350:	00b96863          	bltu	s2,a1,80020360 <_ZN15MemoryAllocator7deallocEPv+0x64>
        prev = next;
    80020354:	00058493          	mv	s1,a1
    for(; next; next = next->next){
    80020358:	0085b583          	ld	a1,8(a1)
    8002035c:	ff1ff06f          	j	8002034c <_ZN15MemoryAllocator7deallocEPv+0x50>
    }

    if(!prev){
    80020360:	04048a63          	beqz	s1,800203b4 <_ZN15MemoryAllocator7deallocEPv+0xb8>
        free_mem_head = new_free_mem_block;
        new_free_mem_block->next = next;
    }
    else{
        new_free_mem_block->next = prev->next;
    80020364:	0084b783          	ld	a5,8(s1)
    80020368:	fcf53423          	sd	a5,-56(a0)
        prev->next = new_free_mem_block;
    8002036c:	0124b423          	sd	s2,8(s1)
    } 

    // potrebno je spojiti oslobodnjene delove memorije sa susednim, ako takvih ima
    if(next && (char*)new_free_mem_block + new_free_mem_block->sizeInBlocks*MEM_BLOCK_SIZE == (char*)next)
    80020370:	00058a63          	beqz	a1,80020384 <_ZN15MemoryAllocator7deallocEPv+0x88>
    80020374:	fc053783          	ld	a5,-64(a0)
    80020378:	00679793          	slli	a5,a5,0x6
    8002037c:	00f907b3          	add	a5,s2,a5
    80020380:	04b78263          	beq	a5,a1,800203c4 <_ZN15MemoryAllocator7deallocEPv+0xc8>
        merge(new_free_mem_block, next);
    if(prev && (char*)prev + prev->sizeInBlocks*MEM_BLOCK_SIZE == (char*)new_free_mem_block)
    80020384:	08048063          	beqz	s1,80020404 <_ZN15MemoryAllocator7deallocEPv+0x108>
    80020388:	0004b783          	ld	a5,0(s1)
    8002038c:	00679793          	slli	a5,a5,0x6
    80020390:	00f487b3          	add	a5,s1,a5
    80020394:	05278063          	beq	a5,s2,800203d4 <_ZN15MemoryAllocator7deallocEPv+0xd8>
        merge(prev, new_free_mem_block);

    return 0;
    80020398:	00000513          	li	a0,0
    8002039c:	01813083          	ld	ra,24(sp)
    800203a0:	01013403          	ld	s0,16(sp)
    800203a4:	00813483          	ld	s1,8(sp)
    800203a8:	00013903          	ld	s2,0(sp)
    800203ac:	02010113          	addi	sp,sp,32
    800203b0:	00008067          	ret
        free_mem_head = new_free_mem_block;
    800203b4:	00003797          	auipc	a5,0x3
    800203b8:	0527be23          	sd	s2,92(a5) # 80023410 <_ZN15MemoryAllocator13free_mem_headE>
        new_free_mem_block->next = next;
    800203bc:	fcb53423          	sd	a1,-56(a0)
    800203c0:	fb1ff06f          	j	80020370 <_ZN15MemoryAllocator7deallocEPv+0x74>
        merge(new_free_mem_block, next);
    800203c4:	00090513          	mv	a0,s2
    800203c8:	00000097          	auipc	ra,0x0
    800203cc:	f04080e7          	jalr	-252(ra) # 800202cc <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>
    800203d0:	fb5ff06f          	j	80020384 <_ZN15MemoryAllocator7deallocEPv+0x88>
        merge(prev, new_free_mem_block);
    800203d4:	00090593          	mv	a1,s2
    800203d8:	00048513          	mv	a0,s1
    800203dc:	00000097          	auipc	ra,0x0
    800203e0:	ef0080e7          	jalr	-272(ra) # 800202cc <_ZN15MemoryAllocator5mergeEPNS_8MemBlockES1_>
    return 0;
    800203e4:	00000513          	li	a0,0
    800203e8:	fb5ff06f          	j	8002039c <_ZN15MemoryAllocator7deallocEPv+0xa0>
    if(!at) return -1;
    800203ec:	fff00513          	li	a0,-1
    800203f0:	00008067          	ret
    if((char*)at < (char*)HEAP_START_ADDR + MEM_BLOCK_SIZE || (char*)at >= HEAP_END_ADDR) return -2;
    800203f4:	ffe00513          	li	a0,-2
    800203f8:	00008067          	ret
    800203fc:	ffe00513          	li	a0,-2
    80020400:	00008067          	ret
    return 0;
    80020404:	00000513          	li	a0,0
    80020408:	f95ff06f          	j	8002039c <_ZN15MemoryAllocator7deallocEPv+0xa0>

000000008002040c <start>:
    8002040c:	ff010113          	addi	sp,sp,-16
    80020410:	00813423          	sd	s0,8(sp)
    80020414:	01010413          	addi	s0,sp,16
    80020418:	300027f3          	csrr	a5,mstatus
    8002041c:	ffffe737          	lui	a4,0xffffe
    80020420:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7ffda18f>
    80020424:	00e7f7b3          	and	a5,a5,a4
    80020428:	00001737          	lui	a4,0x1
    8002042c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80020430:	00e7e7b3          	or	a5,a5,a4
    80020434:	30079073          	csrw	mstatus,a5
    80020438:	00000797          	auipc	a5,0x0
    8002043c:	16078793          	addi	a5,a5,352 # 80020598 <system_main>
    80020440:	34179073          	csrw	mepc,a5
    80020444:	00000793          	li	a5,0
    80020448:	18079073          	csrw	satp,a5
    8002044c:	000107b7          	lui	a5,0x10
    80020450:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80020454:	30279073          	csrw	medeleg,a5
    80020458:	30379073          	csrw	mideleg,a5
    8002045c:	104027f3          	csrr	a5,sie
    80020460:	2227e793          	ori	a5,a5,546
    80020464:	10479073          	csrw	sie,a5
    80020468:	fff00793          	li	a5,-1
    8002046c:	00a7d793          	srli	a5,a5,0xa
    80020470:	3b079073          	csrw	pmpaddr0,a5
    80020474:	00f00793          	li	a5,15
    80020478:	3a079073          	csrw	pmpcfg0,a5
    8002047c:	f14027f3          	csrr	a5,mhartid
    80020480:	0200c737          	lui	a4,0x200c
    80020484:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80020488:	0007869b          	sext.w	a3,a5
    8002048c:	00269713          	slli	a4,a3,0x2
    80020490:	000f4637          	lui	a2,0xf4
    80020494:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80020498:	00d70733          	add	a4,a4,a3
    8002049c:	0037979b          	slliw	a5,a5,0x3
    800204a0:	020046b7          	lui	a3,0x2004
    800204a4:	00d787b3          	add	a5,a5,a3
    800204a8:	00c585b3          	add	a1,a1,a2
    800204ac:	00371693          	slli	a3,a4,0x3
    800204b0:	00003717          	auipc	a4,0x3
    800204b4:	f7070713          	addi	a4,a4,-144 # 80023420 <timer_scratch>
    800204b8:	00b7b023          	sd	a1,0(a5)
    800204bc:	00d70733          	add	a4,a4,a3
    800204c0:	00f73c23          	sd	a5,24(a4)
    800204c4:	02c73023          	sd	a2,32(a4)
    800204c8:	34071073          	csrw	mscratch,a4
    800204cc:	00000797          	auipc	a5,0x0
    800204d0:	6e478793          	addi	a5,a5,1764 # 80020bb0 <timervec>
    800204d4:	30579073          	csrw	mtvec,a5
    800204d8:	300027f3          	csrr	a5,mstatus
    800204dc:	0087e793          	ori	a5,a5,8
    800204e0:	30079073          	csrw	mstatus,a5
    800204e4:	304027f3          	csrr	a5,mie
    800204e8:	0807e793          	ori	a5,a5,128
    800204ec:	30479073          	csrw	mie,a5
    800204f0:	f14027f3          	csrr	a5,mhartid
    800204f4:	0007879b          	sext.w	a5,a5
    800204f8:	00078213          	mv	tp,a5
    800204fc:	30200073          	mret
    80020500:	00813403          	ld	s0,8(sp)
    80020504:	01010113          	addi	sp,sp,16
    80020508:	00008067          	ret

000000008002050c <timerinit>:
    8002050c:	ff010113          	addi	sp,sp,-16
    80020510:	00813423          	sd	s0,8(sp)
    80020514:	01010413          	addi	s0,sp,16
    80020518:	f14027f3          	csrr	a5,mhartid
    8002051c:	0200c737          	lui	a4,0x200c
    80020520:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80020524:	0007869b          	sext.w	a3,a5
    80020528:	00269713          	slli	a4,a3,0x2
    8002052c:	000f4637          	lui	a2,0xf4
    80020530:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80020534:	00d70733          	add	a4,a4,a3
    80020538:	0037979b          	slliw	a5,a5,0x3
    8002053c:	020046b7          	lui	a3,0x2004
    80020540:	00d787b3          	add	a5,a5,a3
    80020544:	00c585b3          	add	a1,a1,a2
    80020548:	00371693          	slli	a3,a4,0x3
    8002054c:	00003717          	auipc	a4,0x3
    80020550:	ed470713          	addi	a4,a4,-300 # 80023420 <timer_scratch>
    80020554:	00b7b023          	sd	a1,0(a5)
    80020558:	00d70733          	add	a4,a4,a3
    8002055c:	00f73c23          	sd	a5,24(a4)
    80020560:	02c73023          	sd	a2,32(a4)
    80020564:	34071073          	csrw	mscratch,a4
    80020568:	00000797          	auipc	a5,0x0
    8002056c:	64878793          	addi	a5,a5,1608 # 80020bb0 <timervec>
    80020570:	30579073          	csrw	mtvec,a5
    80020574:	300027f3          	csrr	a5,mstatus
    80020578:	0087e793          	ori	a5,a5,8
    8002057c:	30079073          	csrw	mstatus,a5
    80020580:	304027f3          	csrr	a5,mie
    80020584:	0807e793          	ori	a5,a5,128
    80020588:	30479073          	csrw	mie,a5
    8002058c:	00813403          	ld	s0,8(sp)
    80020590:	01010113          	addi	sp,sp,16
    80020594:	00008067          	ret

0000000080020598 <system_main>:
    80020598:	fe010113          	addi	sp,sp,-32
    8002059c:	00813823          	sd	s0,16(sp)
    800205a0:	00913423          	sd	s1,8(sp)
    800205a4:	00113c23          	sd	ra,24(sp)
    800205a8:	02010413          	addi	s0,sp,32
    800205ac:	00000097          	auipc	ra,0x0
    800205b0:	0c4080e7          	jalr	196(ra) # 80020670 <cpuid>
    800205b4:	00003497          	auipc	s1,0x3
    800205b8:	e2c48493          	addi	s1,s1,-468 # 800233e0 <started>
    800205bc:	02050263          	beqz	a0,800205e0 <system_main+0x48>
    800205c0:	0004a783          	lw	a5,0(s1)
    800205c4:	0007879b          	sext.w	a5,a5
    800205c8:	fe078ce3          	beqz	a5,800205c0 <system_main+0x28>
    800205cc:	0ff0000f          	fence
    800205d0:	00003517          	auipc	a0,0x3
    800205d4:	a8050513          	addi	a0,a0,-1408 # 80023050 <CONSOLE_STATUS+0x40>
    800205d8:	00001097          	auipc	ra,0x1
    800205dc:	a74080e7          	jalr	-1420(ra) # 8002104c <panic>
    800205e0:	00001097          	auipc	ra,0x1
    800205e4:	9c8080e7          	jalr	-1592(ra) # 80020fa8 <consoleinit>
    800205e8:	00001097          	auipc	ra,0x1
    800205ec:	154080e7          	jalr	340(ra) # 8002173c <printfinit>
    800205f0:	00003517          	auipc	a0,0x3
    800205f4:	b4050513          	addi	a0,a0,-1216 # 80023130 <CONSOLE_STATUS+0x120>
    800205f8:	00001097          	auipc	ra,0x1
    800205fc:	ab0080e7          	jalr	-1360(ra) # 800210a8 <__printf>
    80020600:	00003517          	auipc	a0,0x3
    80020604:	a2050513          	addi	a0,a0,-1504 # 80023020 <CONSOLE_STATUS+0x10>
    80020608:	00001097          	auipc	ra,0x1
    8002060c:	aa0080e7          	jalr	-1376(ra) # 800210a8 <__printf>
    80020610:	00003517          	auipc	a0,0x3
    80020614:	b2050513          	addi	a0,a0,-1248 # 80023130 <CONSOLE_STATUS+0x120>
    80020618:	00001097          	auipc	ra,0x1
    8002061c:	a90080e7          	jalr	-1392(ra) # 800210a8 <__printf>
    80020620:	00001097          	auipc	ra,0x1
    80020624:	4a8080e7          	jalr	1192(ra) # 80021ac8 <kinit>
    80020628:	00000097          	auipc	ra,0x0
    8002062c:	148080e7          	jalr	328(ra) # 80020770 <trapinit>
    80020630:	00000097          	auipc	ra,0x0
    80020634:	16c080e7          	jalr	364(ra) # 8002079c <trapinithart>
    80020638:	00000097          	auipc	ra,0x0
    8002063c:	5b8080e7          	jalr	1464(ra) # 80020bf0 <plicinit>
    80020640:	00000097          	auipc	ra,0x0
    80020644:	5d8080e7          	jalr	1496(ra) # 80020c18 <plicinithart>
    80020648:	00000097          	auipc	ra,0x0
    8002064c:	078080e7          	jalr	120(ra) # 800206c0 <userinit>
    80020650:	0ff0000f          	fence
    80020654:	00100793          	li	a5,1
    80020658:	00003517          	auipc	a0,0x3
    8002065c:	9e050513          	addi	a0,a0,-1568 # 80023038 <CONSOLE_STATUS+0x28>
    80020660:	00f4a023          	sw	a5,0(s1)
    80020664:	00001097          	auipc	ra,0x1
    80020668:	a44080e7          	jalr	-1468(ra) # 800210a8 <__printf>
    8002066c:	0000006f          	j	8002066c <system_main+0xd4>

0000000080020670 <cpuid>:
    80020670:	ff010113          	addi	sp,sp,-16
    80020674:	00813423          	sd	s0,8(sp)
    80020678:	01010413          	addi	s0,sp,16
    8002067c:	00020513          	mv	a0,tp
    80020680:	00813403          	ld	s0,8(sp)
    80020684:	0005051b          	sext.w	a0,a0
    80020688:	01010113          	addi	sp,sp,16
    8002068c:	00008067          	ret

0000000080020690 <mycpu>:
    80020690:	ff010113          	addi	sp,sp,-16
    80020694:	00813423          	sd	s0,8(sp)
    80020698:	01010413          	addi	s0,sp,16
    8002069c:	00020793          	mv	a5,tp
    800206a0:	00813403          	ld	s0,8(sp)
    800206a4:	0007879b          	sext.w	a5,a5
    800206a8:	00779793          	slli	a5,a5,0x7
    800206ac:	00004517          	auipc	a0,0x4
    800206b0:	da450513          	addi	a0,a0,-604 # 80024450 <cpus>
    800206b4:	00f50533          	add	a0,a0,a5
    800206b8:	01010113          	addi	sp,sp,16
    800206bc:	00008067          	ret

00000000800206c0 <userinit>:
    800206c0:	ff010113          	addi	sp,sp,-16
    800206c4:	00813423          	sd	s0,8(sp)
    800206c8:	01010413          	addi	s0,sp,16
    800206cc:	00813403          	ld	s0,8(sp)
    800206d0:	01010113          	addi	sp,sp,16
    800206d4:	00000317          	auipc	t1,0x0
    800206d8:	99c30067          	jr	-1636(t1) # 80020070 <main>

00000000800206dc <either_copyout>:
    800206dc:	ff010113          	addi	sp,sp,-16
    800206e0:	00813023          	sd	s0,0(sp)
    800206e4:	00113423          	sd	ra,8(sp)
    800206e8:	01010413          	addi	s0,sp,16
    800206ec:	02051663          	bnez	a0,80020718 <either_copyout+0x3c>
    800206f0:	00058513          	mv	a0,a1
    800206f4:	00060593          	mv	a1,a2
    800206f8:	0006861b          	sext.w	a2,a3
    800206fc:	00002097          	auipc	ra,0x2
    80020700:	c58080e7          	jalr	-936(ra) # 80022354 <__memmove>
    80020704:	00813083          	ld	ra,8(sp)
    80020708:	00013403          	ld	s0,0(sp)
    8002070c:	00000513          	li	a0,0
    80020710:	01010113          	addi	sp,sp,16
    80020714:	00008067          	ret
    80020718:	00003517          	auipc	a0,0x3
    8002071c:	96050513          	addi	a0,a0,-1696 # 80023078 <CONSOLE_STATUS+0x68>
    80020720:	00001097          	auipc	ra,0x1
    80020724:	92c080e7          	jalr	-1748(ra) # 8002104c <panic>

0000000080020728 <either_copyin>:
    80020728:	ff010113          	addi	sp,sp,-16
    8002072c:	00813023          	sd	s0,0(sp)
    80020730:	00113423          	sd	ra,8(sp)
    80020734:	01010413          	addi	s0,sp,16
    80020738:	02059463          	bnez	a1,80020760 <either_copyin+0x38>
    8002073c:	00060593          	mv	a1,a2
    80020740:	0006861b          	sext.w	a2,a3
    80020744:	00002097          	auipc	ra,0x2
    80020748:	c10080e7          	jalr	-1008(ra) # 80022354 <__memmove>
    8002074c:	00813083          	ld	ra,8(sp)
    80020750:	00013403          	ld	s0,0(sp)
    80020754:	00000513          	li	a0,0
    80020758:	01010113          	addi	sp,sp,16
    8002075c:	00008067          	ret
    80020760:	00003517          	auipc	a0,0x3
    80020764:	94050513          	addi	a0,a0,-1728 # 800230a0 <CONSOLE_STATUS+0x90>
    80020768:	00001097          	auipc	ra,0x1
    8002076c:	8e4080e7          	jalr	-1820(ra) # 8002104c <panic>

0000000080020770 <trapinit>:
    80020770:	ff010113          	addi	sp,sp,-16
    80020774:	00813423          	sd	s0,8(sp)
    80020778:	01010413          	addi	s0,sp,16
    8002077c:	00813403          	ld	s0,8(sp)
    80020780:	00003597          	auipc	a1,0x3
    80020784:	94858593          	addi	a1,a1,-1720 # 800230c8 <CONSOLE_STATUS+0xb8>
    80020788:	00004517          	auipc	a0,0x4
    8002078c:	d4850513          	addi	a0,a0,-696 # 800244d0 <tickslock>
    80020790:	01010113          	addi	sp,sp,16
    80020794:	00001317          	auipc	t1,0x1
    80020798:	5c430067          	jr	1476(t1) # 80021d58 <initlock>

000000008002079c <trapinithart>:
    8002079c:	ff010113          	addi	sp,sp,-16
    800207a0:	00813423          	sd	s0,8(sp)
    800207a4:	01010413          	addi	s0,sp,16
    800207a8:	00000797          	auipc	a5,0x0
    800207ac:	2f878793          	addi	a5,a5,760 # 80020aa0 <kernelvec>
    800207b0:	10579073          	csrw	stvec,a5
    800207b4:	00813403          	ld	s0,8(sp)
    800207b8:	01010113          	addi	sp,sp,16
    800207bc:	00008067          	ret

00000000800207c0 <usertrap>:
    800207c0:	ff010113          	addi	sp,sp,-16
    800207c4:	00813423          	sd	s0,8(sp)
    800207c8:	01010413          	addi	s0,sp,16
    800207cc:	00813403          	ld	s0,8(sp)
    800207d0:	01010113          	addi	sp,sp,16
    800207d4:	00008067          	ret

00000000800207d8 <usertrapret>:
    800207d8:	ff010113          	addi	sp,sp,-16
    800207dc:	00813423          	sd	s0,8(sp)
    800207e0:	01010413          	addi	s0,sp,16
    800207e4:	00813403          	ld	s0,8(sp)
    800207e8:	01010113          	addi	sp,sp,16
    800207ec:	00008067          	ret

00000000800207f0 <kerneltrap>:
    800207f0:	fe010113          	addi	sp,sp,-32
    800207f4:	00813823          	sd	s0,16(sp)
    800207f8:	00113c23          	sd	ra,24(sp)
    800207fc:	00913423          	sd	s1,8(sp)
    80020800:	02010413          	addi	s0,sp,32
    80020804:	142025f3          	csrr	a1,scause
    80020808:	100027f3          	csrr	a5,sstatus
    8002080c:	0027f793          	andi	a5,a5,2
    80020810:	10079c63          	bnez	a5,80020928 <kerneltrap+0x138>
    80020814:	142027f3          	csrr	a5,scause
    80020818:	0207ce63          	bltz	a5,80020854 <kerneltrap+0x64>
    8002081c:	00003517          	auipc	a0,0x3
    80020820:	8f450513          	addi	a0,a0,-1804 # 80023110 <CONSOLE_STATUS+0x100>
    80020824:	00001097          	auipc	ra,0x1
    80020828:	884080e7          	jalr	-1916(ra) # 800210a8 <__printf>
    8002082c:	141025f3          	csrr	a1,sepc
    80020830:	14302673          	csrr	a2,stval
    80020834:	00003517          	auipc	a0,0x3
    80020838:	8ec50513          	addi	a0,a0,-1812 # 80023120 <CONSOLE_STATUS+0x110>
    8002083c:	00001097          	auipc	ra,0x1
    80020840:	86c080e7          	jalr	-1940(ra) # 800210a8 <__printf>
    80020844:	00003517          	auipc	a0,0x3
    80020848:	8f450513          	addi	a0,a0,-1804 # 80023138 <CONSOLE_STATUS+0x128>
    8002084c:	00001097          	auipc	ra,0x1
    80020850:	800080e7          	jalr	-2048(ra) # 8002104c <panic>
    80020854:	0ff7f713          	andi	a4,a5,255
    80020858:	00900693          	li	a3,9
    8002085c:	04d70063          	beq	a4,a3,8002089c <kerneltrap+0xac>
    80020860:	fff00713          	li	a4,-1
    80020864:	03f71713          	slli	a4,a4,0x3f
    80020868:	00170713          	addi	a4,a4,1
    8002086c:	fae798e3          	bne	a5,a4,8002081c <kerneltrap+0x2c>
    80020870:	00000097          	auipc	ra,0x0
    80020874:	e00080e7          	jalr	-512(ra) # 80020670 <cpuid>
    80020878:	06050663          	beqz	a0,800208e4 <kerneltrap+0xf4>
    8002087c:	144027f3          	csrr	a5,sip
    80020880:	ffd7f793          	andi	a5,a5,-3
    80020884:	14479073          	csrw	sip,a5
    80020888:	01813083          	ld	ra,24(sp)
    8002088c:	01013403          	ld	s0,16(sp)
    80020890:	00813483          	ld	s1,8(sp)
    80020894:	02010113          	addi	sp,sp,32
    80020898:	00008067          	ret
    8002089c:	00000097          	auipc	ra,0x0
    800208a0:	3c8080e7          	jalr	968(ra) # 80020c64 <plic_claim>
    800208a4:	00a00793          	li	a5,10
    800208a8:	00050493          	mv	s1,a0
    800208ac:	06f50863          	beq	a0,a5,8002091c <kerneltrap+0x12c>
    800208b0:	fc050ce3          	beqz	a0,80020888 <kerneltrap+0x98>
    800208b4:	00050593          	mv	a1,a0
    800208b8:	00003517          	auipc	a0,0x3
    800208bc:	83850513          	addi	a0,a0,-1992 # 800230f0 <CONSOLE_STATUS+0xe0>
    800208c0:	00000097          	auipc	ra,0x0
    800208c4:	7e8080e7          	jalr	2024(ra) # 800210a8 <__printf>
    800208c8:	01013403          	ld	s0,16(sp)
    800208cc:	01813083          	ld	ra,24(sp)
    800208d0:	00048513          	mv	a0,s1
    800208d4:	00813483          	ld	s1,8(sp)
    800208d8:	02010113          	addi	sp,sp,32
    800208dc:	00000317          	auipc	t1,0x0
    800208e0:	3c030067          	jr	960(t1) # 80020c9c <plic_complete>
    800208e4:	00004517          	auipc	a0,0x4
    800208e8:	bec50513          	addi	a0,a0,-1044 # 800244d0 <tickslock>
    800208ec:	00001097          	auipc	ra,0x1
    800208f0:	490080e7          	jalr	1168(ra) # 80021d7c <acquire>
    800208f4:	00003717          	auipc	a4,0x3
    800208f8:	af070713          	addi	a4,a4,-1296 # 800233e4 <ticks>
    800208fc:	00072783          	lw	a5,0(a4)
    80020900:	00004517          	auipc	a0,0x4
    80020904:	bd050513          	addi	a0,a0,-1072 # 800244d0 <tickslock>
    80020908:	0017879b          	addiw	a5,a5,1
    8002090c:	00f72023          	sw	a5,0(a4)
    80020910:	00001097          	auipc	ra,0x1
    80020914:	538080e7          	jalr	1336(ra) # 80021e48 <release>
    80020918:	f65ff06f          	j	8002087c <kerneltrap+0x8c>
    8002091c:	00001097          	auipc	ra,0x1
    80020920:	094080e7          	jalr	148(ra) # 800219b0 <uartintr>
    80020924:	fa5ff06f          	j	800208c8 <kerneltrap+0xd8>
    80020928:	00002517          	auipc	a0,0x2
    8002092c:	7a850513          	addi	a0,a0,1960 # 800230d0 <CONSOLE_STATUS+0xc0>
    80020930:	00000097          	auipc	ra,0x0
    80020934:	71c080e7          	jalr	1820(ra) # 8002104c <panic>

0000000080020938 <clockintr>:
    80020938:	fe010113          	addi	sp,sp,-32
    8002093c:	00813823          	sd	s0,16(sp)
    80020940:	00913423          	sd	s1,8(sp)
    80020944:	00113c23          	sd	ra,24(sp)
    80020948:	02010413          	addi	s0,sp,32
    8002094c:	00004497          	auipc	s1,0x4
    80020950:	b8448493          	addi	s1,s1,-1148 # 800244d0 <tickslock>
    80020954:	00048513          	mv	a0,s1
    80020958:	00001097          	auipc	ra,0x1
    8002095c:	424080e7          	jalr	1060(ra) # 80021d7c <acquire>
    80020960:	00003717          	auipc	a4,0x3
    80020964:	a8470713          	addi	a4,a4,-1404 # 800233e4 <ticks>
    80020968:	00072783          	lw	a5,0(a4)
    8002096c:	01013403          	ld	s0,16(sp)
    80020970:	01813083          	ld	ra,24(sp)
    80020974:	00048513          	mv	a0,s1
    80020978:	0017879b          	addiw	a5,a5,1
    8002097c:	00813483          	ld	s1,8(sp)
    80020980:	00f72023          	sw	a5,0(a4)
    80020984:	02010113          	addi	sp,sp,32
    80020988:	00001317          	auipc	t1,0x1
    8002098c:	4c030067          	jr	1216(t1) # 80021e48 <release>

0000000080020990 <devintr>:
    80020990:	142027f3          	csrr	a5,scause
    80020994:	00000513          	li	a0,0
    80020998:	0007c463          	bltz	a5,800209a0 <devintr+0x10>
    8002099c:	00008067          	ret
    800209a0:	fe010113          	addi	sp,sp,-32
    800209a4:	00813823          	sd	s0,16(sp)
    800209a8:	00113c23          	sd	ra,24(sp)
    800209ac:	00913423          	sd	s1,8(sp)
    800209b0:	02010413          	addi	s0,sp,32
    800209b4:	0ff7f713          	andi	a4,a5,255
    800209b8:	00900693          	li	a3,9
    800209bc:	04d70c63          	beq	a4,a3,80020a14 <devintr+0x84>
    800209c0:	fff00713          	li	a4,-1
    800209c4:	03f71713          	slli	a4,a4,0x3f
    800209c8:	00170713          	addi	a4,a4,1
    800209cc:	00e78c63          	beq	a5,a4,800209e4 <devintr+0x54>
    800209d0:	01813083          	ld	ra,24(sp)
    800209d4:	01013403          	ld	s0,16(sp)
    800209d8:	00813483          	ld	s1,8(sp)
    800209dc:	02010113          	addi	sp,sp,32
    800209e0:	00008067          	ret
    800209e4:	00000097          	auipc	ra,0x0
    800209e8:	c8c080e7          	jalr	-884(ra) # 80020670 <cpuid>
    800209ec:	06050663          	beqz	a0,80020a58 <devintr+0xc8>
    800209f0:	144027f3          	csrr	a5,sip
    800209f4:	ffd7f793          	andi	a5,a5,-3
    800209f8:	14479073          	csrw	sip,a5
    800209fc:	01813083          	ld	ra,24(sp)
    80020a00:	01013403          	ld	s0,16(sp)
    80020a04:	00813483          	ld	s1,8(sp)
    80020a08:	00200513          	li	a0,2
    80020a0c:	02010113          	addi	sp,sp,32
    80020a10:	00008067          	ret
    80020a14:	00000097          	auipc	ra,0x0
    80020a18:	250080e7          	jalr	592(ra) # 80020c64 <plic_claim>
    80020a1c:	00a00793          	li	a5,10
    80020a20:	00050493          	mv	s1,a0
    80020a24:	06f50663          	beq	a0,a5,80020a90 <devintr+0x100>
    80020a28:	00100513          	li	a0,1
    80020a2c:	fa0482e3          	beqz	s1,800209d0 <devintr+0x40>
    80020a30:	00048593          	mv	a1,s1
    80020a34:	00002517          	auipc	a0,0x2
    80020a38:	6bc50513          	addi	a0,a0,1724 # 800230f0 <CONSOLE_STATUS+0xe0>
    80020a3c:	00000097          	auipc	ra,0x0
    80020a40:	66c080e7          	jalr	1644(ra) # 800210a8 <__printf>
    80020a44:	00048513          	mv	a0,s1
    80020a48:	00000097          	auipc	ra,0x0
    80020a4c:	254080e7          	jalr	596(ra) # 80020c9c <plic_complete>
    80020a50:	00100513          	li	a0,1
    80020a54:	f7dff06f          	j	800209d0 <devintr+0x40>
    80020a58:	00004517          	auipc	a0,0x4
    80020a5c:	a7850513          	addi	a0,a0,-1416 # 800244d0 <tickslock>
    80020a60:	00001097          	auipc	ra,0x1
    80020a64:	31c080e7          	jalr	796(ra) # 80021d7c <acquire>
    80020a68:	00003717          	auipc	a4,0x3
    80020a6c:	97c70713          	addi	a4,a4,-1668 # 800233e4 <ticks>
    80020a70:	00072783          	lw	a5,0(a4)
    80020a74:	00004517          	auipc	a0,0x4
    80020a78:	a5c50513          	addi	a0,a0,-1444 # 800244d0 <tickslock>
    80020a7c:	0017879b          	addiw	a5,a5,1
    80020a80:	00f72023          	sw	a5,0(a4)
    80020a84:	00001097          	auipc	ra,0x1
    80020a88:	3c4080e7          	jalr	964(ra) # 80021e48 <release>
    80020a8c:	f65ff06f          	j	800209f0 <devintr+0x60>
    80020a90:	00001097          	auipc	ra,0x1
    80020a94:	f20080e7          	jalr	-224(ra) # 800219b0 <uartintr>
    80020a98:	fadff06f          	j	80020a44 <devintr+0xb4>
    80020a9c:	0000                	unimp
	...

0000000080020aa0 <kernelvec>:
    80020aa0:	f0010113          	addi	sp,sp,-256
    80020aa4:	00113023          	sd	ra,0(sp)
    80020aa8:	00213423          	sd	sp,8(sp)
    80020aac:	00313823          	sd	gp,16(sp)
    80020ab0:	00413c23          	sd	tp,24(sp)
    80020ab4:	02513023          	sd	t0,32(sp)
    80020ab8:	02613423          	sd	t1,40(sp)
    80020abc:	02713823          	sd	t2,48(sp)
    80020ac0:	02813c23          	sd	s0,56(sp)
    80020ac4:	04913023          	sd	s1,64(sp)
    80020ac8:	04a13423          	sd	a0,72(sp)
    80020acc:	04b13823          	sd	a1,80(sp)
    80020ad0:	04c13c23          	sd	a2,88(sp)
    80020ad4:	06d13023          	sd	a3,96(sp)
    80020ad8:	06e13423          	sd	a4,104(sp)
    80020adc:	06f13823          	sd	a5,112(sp)
    80020ae0:	07013c23          	sd	a6,120(sp)
    80020ae4:	09113023          	sd	a7,128(sp)
    80020ae8:	09213423          	sd	s2,136(sp)
    80020aec:	09313823          	sd	s3,144(sp)
    80020af0:	09413c23          	sd	s4,152(sp)
    80020af4:	0b513023          	sd	s5,160(sp)
    80020af8:	0b613423          	sd	s6,168(sp)
    80020afc:	0b713823          	sd	s7,176(sp)
    80020b00:	0b813c23          	sd	s8,184(sp)
    80020b04:	0d913023          	sd	s9,192(sp)
    80020b08:	0da13423          	sd	s10,200(sp)
    80020b0c:	0db13823          	sd	s11,208(sp)
    80020b10:	0dc13c23          	sd	t3,216(sp)
    80020b14:	0fd13023          	sd	t4,224(sp)
    80020b18:	0fe13423          	sd	t5,232(sp)
    80020b1c:	0ff13823          	sd	t6,240(sp)
    80020b20:	cd1ff0ef          	jal	ra,800207f0 <kerneltrap>
    80020b24:	00013083          	ld	ra,0(sp)
    80020b28:	00813103          	ld	sp,8(sp)
    80020b2c:	01013183          	ld	gp,16(sp)
    80020b30:	02013283          	ld	t0,32(sp)
    80020b34:	02813303          	ld	t1,40(sp)
    80020b38:	03013383          	ld	t2,48(sp)
    80020b3c:	03813403          	ld	s0,56(sp)
    80020b40:	04013483          	ld	s1,64(sp)
    80020b44:	04813503          	ld	a0,72(sp)
    80020b48:	05013583          	ld	a1,80(sp)
    80020b4c:	05813603          	ld	a2,88(sp)
    80020b50:	06013683          	ld	a3,96(sp)
    80020b54:	06813703          	ld	a4,104(sp)
    80020b58:	07013783          	ld	a5,112(sp)
    80020b5c:	07813803          	ld	a6,120(sp)
    80020b60:	08013883          	ld	a7,128(sp)
    80020b64:	08813903          	ld	s2,136(sp)
    80020b68:	09013983          	ld	s3,144(sp)
    80020b6c:	09813a03          	ld	s4,152(sp)
    80020b70:	0a013a83          	ld	s5,160(sp)
    80020b74:	0a813b03          	ld	s6,168(sp)
    80020b78:	0b013b83          	ld	s7,176(sp)
    80020b7c:	0b813c03          	ld	s8,184(sp)
    80020b80:	0c013c83          	ld	s9,192(sp)
    80020b84:	0c813d03          	ld	s10,200(sp)
    80020b88:	0d013d83          	ld	s11,208(sp)
    80020b8c:	0d813e03          	ld	t3,216(sp)
    80020b90:	0e013e83          	ld	t4,224(sp)
    80020b94:	0e813f03          	ld	t5,232(sp)
    80020b98:	0f013f83          	ld	t6,240(sp)
    80020b9c:	10010113          	addi	sp,sp,256
    80020ba0:	10200073          	sret
    80020ba4:	00000013          	nop
    80020ba8:	00000013          	nop
    80020bac:	00000013          	nop

0000000080020bb0 <timervec>:
    80020bb0:	34051573          	csrrw	a0,mscratch,a0
    80020bb4:	00b53023          	sd	a1,0(a0)
    80020bb8:	00c53423          	sd	a2,8(a0)
    80020bbc:	00d53823          	sd	a3,16(a0)
    80020bc0:	01853583          	ld	a1,24(a0)
    80020bc4:	02053603          	ld	a2,32(a0)
    80020bc8:	0005b683          	ld	a3,0(a1)
    80020bcc:	00c686b3          	add	a3,a3,a2
    80020bd0:	00d5b023          	sd	a3,0(a1)
    80020bd4:	00200593          	li	a1,2
    80020bd8:	14459073          	csrw	sip,a1
    80020bdc:	01053683          	ld	a3,16(a0)
    80020be0:	00853603          	ld	a2,8(a0)
    80020be4:	00053583          	ld	a1,0(a0)
    80020be8:	34051573          	csrrw	a0,mscratch,a0
    80020bec:	30200073          	mret

0000000080020bf0 <plicinit>:
    80020bf0:	ff010113          	addi	sp,sp,-16
    80020bf4:	00813423          	sd	s0,8(sp)
    80020bf8:	01010413          	addi	s0,sp,16
    80020bfc:	00813403          	ld	s0,8(sp)
    80020c00:	0c0007b7          	lui	a5,0xc000
    80020c04:	00100713          	li	a4,1
    80020c08:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80020c0c:	00e7a223          	sw	a4,4(a5)
    80020c10:	01010113          	addi	sp,sp,16
    80020c14:	00008067          	ret

0000000080020c18 <plicinithart>:
    80020c18:	ff010113          	addi	sp,sp,-16
    80020c1c:	00813023          	sd	s0,0(sp)
    80020c20:	00113423          	sd	ra,8(sp)
    80020c24:	01010413          	addi	s0,sp,16
    80020c28:	00000097          	auipc	ra,0x0
    80020c2c:	a48080e7          	jalr	-1464(ra) # 80020670 <cpuid>
    80020c30:	0085171b          	slliw	a4,a0,0x8
    80020c34:	0c0027b7          	lui	a5,0xc002
    80020c38:	00e787b3          	add	a5,a5,a4
    80020c3c:	40200713          	li	a4,1026
    80020c40:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80020c44:	00813083          	ld	ra,8(sp)
    80020c48:	00013403          	ld	s0,0(sp)
    80020c4c:	00d5151b          	slliw	a0,a0,0xd
    80020c50:	0c2017b7          	lui	a5,0xc201
    80020c54:	00a78533          	add	a0,a5,a0
    80020c58:	00052023          	sw	zero,0(a0)
    80020c5c:	01010113          	addi	sp,sp,16
    80020c60:	00008067          	ret

0000000080020c64 <plic_claim>:
    80020c64:	ff010113          	addi	sp,sp,-16
    80020c68:	00813023          	sd	s0,0(sp)
    80020c6c:	00113423          	sd	ra,8(sp)
    80020c70:	01010413          	addi	s0,sp,16
    80020c74:	00000097          	auipc	ra,0x0
    80020c78:	9fc080e7          	jalr	-1540(ra) # 80020670 <cpuid>
    80020c7c:	00813083          	ld	ra,8(sp)
    80020c80:	00013403          	ld	s0,0(sp)
    80020c84:	00d5151b          	slliw	a0,a0,0xd
    80020c88:	0c2017b7          	lui	a5,0xc201
    80020c8c:	00a78533          	add	a0,a5,a0
    80020c90:	00452503          	lw	a0,4(a0)
    80020c94:	01010113          	addi	sp,sp,16
    80020c98:	00008067          	ret

0000000080020c9c <plic_complete>:
    80020c9c:	fe010113          	addi	sp,sp,-32
    80020ca0:	00813823          	sd	s0,16(sp)
    80020ca4:	00913423          	sd	s1,8(sp)
    80020ca8:	00113c23          	sd	ra,24(sp)
    80020cac:	02010413          	addi	s0,sp,32
    80020cb0:	00050493          	mv	s1,a0
    80020cb4:	00000097          	auipc	ra,0x0
    80020cb8:	9bc080e7          	jalr	-1604(ra) # 80020670 <cpuid>
    80020cbc:	01813083          	ld	ra,24(sp)
    80020cc0:	01013403          	ld	s0,16(sp)
    80020cc4:	00d5179b          	slliw	a5,a0,0xd
    80020cc8:	0c201737          	lui	a4,0xc201
    80020ccc:	00f707b3          	add	a5,a4,a5
    80020cd0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80020cd4:	00813483          	ld	s1,8(sp)
    80020cd8:	02010113          	addi	sp,sp,32
    80020cdc:	00008067          	ret

0000000080020ce0 <consolewrite>:
    80020ce0:	fb010113          	addi	sp,sp,-80
    80020ce4:	04813023          	sd	s0,64(sp)
    80020ce8:	04113423          	sd	ra,72(sp)
    80020cec:	02913c23          	sd	s1,56(sp)
    80020cf0:	03213823          	sd	s2,48(sp)
    80020cf4:	03313423          	sd	s3,40(sp)
    80020cf8:	03413023          	sd	s4,32(sp)
    80020cfc:	01513c23          	sd	s5,24(sp)
    80020d00:	05010413          	addi	s0,sp,80
    80020d04:	06c05c63          	blez	a2,80020d7c <consolewrite+0x9c>
    80020d08:	00060993          	mv	s3,a2
    80020d0c:	00050a13          	mv	s4,a0
    80020d10:	00058493          	mv	s1,a1
    80020d14:	00000913          	li	s2,0
    80020d18:	fff00a93          	li	s5,-1
    80020d1c:	01c0006f          	j	80020d38 <consolewrite+0x58>
    80020d20:	fbf44503          	lbu	a0,-65(s0)
    80020d24:	0019091b          	addiw	s2,s2,1
    80020d28:	00148493          	addi	s1,s1,1
    80020d2c:	00001097          	auipc	ra,0x1
    80020d30:	a9c080e7          	jalr	-1380(ra) # 800217c8 <uartputc>
    80020d34:	03298063          	beq	s3,s2,80020d54 <consolewrite+0x74>
    80020d38:	00048613          	mv	a2,s1
    80020d3c:	00100693          	li	a3,1
    80020d40:	000a0593          	mv	a1,s4
    80020d44:	fbf40513          	addi	a0,s0,-65
    80020d48:	00000097          	auipc	ra,0x0
    80020d4c:	9e0080e7          	jalr	-1568(ra) # 80020728 <either_copyin>
    80020d50:	fd5518e3          	bne	a0,s5,80020d20 <consolewrite+0x40>
    80020d54:	04813083          	ld	ra,72(sp)
    80020d58:	04013403          	ld	s0,64(sp)
    80020d5c:	03813483          	ld	s1,56(sp)
    80020d60:	02813983          	ld	s3,40(sp)
    80020d64:	02013a03          	ld	s4,32(sp)
    80020d68:	01813a83          	ld	s5,24(sp)
    80020d6c:	00090513          	mv	a0,s2
    80020d70:	03013903          	ld	s2,48(sp)
    80020d74:	05010113          	addi	sp,sp,80
    80020d78:	00008067          	ret
    80020d7c:	00000913          	li	s2,0
    80020d80:	fd5ff06f          	j	80020d54 <consolewrite+0x74>

0000000080020d84 <consoleread>:
    80020d84:	f9010113          	addi	sp,sp,-112
    80020d88:	06813023          	sd	s0,96(sp)
    80020d8c:	04913c23          	sd	s1,88(sp)
    80020d90:	05213823          	sd	s2,80(sp)
    80020d94:	05313423          	sd	s3,72(sp)
    80020d98:	05413023          	sd	s4,64(sp)
    80020d9c:	03513c23          	sd	s5,56(sp)
    80020da0:	03613823          	sd	s6,48(sp)
    80020da4:	03713423          	sd	s7,40(sp)
    80020da8:	03813023          	sd	s8,32(sp)
    80020dac:	06113423          	sd	ra,104(sp)
    80020db0:	01913c23          	sd	s9,24(sp)
    80020db4:	07010413          	addi	s0,sp,112
    80020db8:	00060b93          	mv	s7,a2
    80020dbc:	00050913          	mv	s2,a0
    80020dc0:	00058c13          	mv	s8,a1
    80020dc4:	00060b1b          	sext.w	s6,a2
    80020dc8:	00003497          	auipc	s1,0x3
    80020dcc:	72048493          	addi	s1,s1,1824 # 800244e8 <cons>
    80020dd0:	00400993          	li	s3,4
    80020dd4:	fff00a13          	li	s4,-1
    80020dd8:	00a00a93          	li	s5,10
    80020ddc:	05705e63          	blez	s7,80020e38 <consoleread+0xb4>
    80020de0:	09c4a703          	lw	a4,156(s1)
    80020de4:	0984a783          	lw	a5,152(s1)
    80020de8:	0007071b          	sext.w	a4,a4
    80020dec:	08e78463          	beq	a5,a4,80020e74 <consoleread+0xf0>
    80020df0:	07f7f713          	andi	a4,a5,127
    80020df4:	00e48733          	add	a4,s1,a4
    80020df8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80020dfc:	0017869b          	addiw	a3,a5,1
    80020e00:	08d4ac23          	sw	a3,152(s1)
    80020e04:	00070c9b          	sext.w	s9,a4
    80020e08:	0b370663          	beq	a4,s3,80020eb4 <consoleread+0x130>
    80020e0c:	00100693          	li	a3,1
    80020e10:	f9f40613          	addi	a2,s0,-97
    80020e14:	000c0593          	mv	a1,s8
    80020e18:	00090513          	mv	a0,s2
    80020e1c:	f8e40fa3          	sb	a4,-97(s0)
    80020e20:	00000097          	auipc	ra,0x0
    80020e24:	8bc080e7          	jalr	-1860(ra) # 800206dc <either_copyout>
    80020e28:	01450863          	beq	a0,s4,80020e38 <consoleread+0xb4>
    80020e2c:	001c0c13          	addi	s8,s8,1
    80020e30:	fffb8b9b          	addiw	s7,s7,-1
    80020e34:	fb5c94e3          	bne	s9,s5,80020ddc <consoleread+0x58>
    80020e38:	000b851b          	sext.w	a0,s7
    80020e3c:	06813083          	ld	ra,104(sp)
    80020e40:	06013403          	ld	s0,96(sp)
    80020e44:	05813483          	ld	s1,88(sp)
    80020e48:	05013903          	ld	s2,80(sp)
    80020e4c:	04813983          	ld	s3,72(sp)
    80020e50:	04013a03          	ld	s4,64(sp)
    80020e54:	03813a83          	ld	s5,56(sp)
    80020e58:	02813b83          	ld	s7,40(sp)
    80020e5c:	02013c03          	ld	s8,32(sp)
    80020e60:	01813c83          	ld	s9,24(sp)
    80020e64:	40ab053b          	subw	a0,s6,a0
    80020e68:	03013b03          	ld	s6,48(sp)
    80020e6c:	07010113          	addi	sp,sp,112
    80020e70:	00008067          	ret
    80020e74:	00001097          	auipc	ra,0x1
    80020e78:	1d8080e7          	jalr	472(ra) # 8002204c <push_on>
    80020e7c:	0984a703          	lw	a4,152(s1)
    80020e80:	09c4a783          	lw	a5,156(s1)
    80020e84:	0007879b          	sext.w	a5,a5
    80020e88:	fef70ce3          	beq	a4,a5,80020e80 <consoleread+0xfc>
    80020e8c:	00001097          	auipc	ra,0x1
    80020e90:	234080e7          	jalr	564(ra) # 800220c0 <pop_on>
    80020e94:	0984a783          	lw	a5,152(s1)
    80020e98:	07f7f713          	andi	a4,a5,127
    80020e9c:	00e48733          	add	a4,s1,a4
    80020ea0:	01874703          	lbu	a4,24(a4)
    80020ea4:	0017869b          	addiw	a3,a5,1
    80020ea8:	08d4ac23          	sw	a3,152(s1)
    80020eac:	00070c9b          	sext.w	s9,a4
    80020eb0:	f5371ee3          	bne	a4,s3,80020e0c <consoleread+0x88>
    80020eb4:	000b851b          	sext.w	a0,s7
    80020eb8:	f96bf2e3          	bgeu	s7,s6,80020e3c <consoleread+0xb8>
    80020ebc:	08f4ac23          	sw	a5,152(s1)
    80020ec0:	f7dff06f          	j	80020e3c <consoleread+0xb8>

0000000080020ec4 <consputc>:
    80020ec4:	10000793          	li	a5,256
    80020ec8:	00f50663          	beq	a0,a5,80020ed4 <consputc+0x10>
    80020ecc:	00001317          	auipc	t1,0x1
    80020ed0:	9f430067          	jr	-1548(t1) # 800218c0 <uartputc_sync>
    80020ed4:	ff010113          	addi	sp,sp,-16
    80020ed8:	00113423          	sd	ra,8(sp)
    80020edc:	00813023          	sd	s0,0(sp)
    80020ee0:	01010413          	addi	s0,sp,16
    80020ee4:	00800513          	li	a0,8
    80020ee8:	00001097          	auipc	ra,0x1
    80020eec:	9d8080e7          	jalr	-1576(ra) # 800218c0 <uartputc_sync>
    80020ef0:	02000513          	li	a0,32
    80020ef4:	00001097          	auipc	ra,0x1
    80020ef8:	9cc080e7          	jalr	-1588(ra) # 800218c0 <uartputc_sync>
    80020efc:	00013403          	ld	s0,0(sp)
    80020f00:	00813083          	ld	ra,8(sp)
    80020f04:	00800513          	li	a0,8
    80020f08:	01010113          	addi	sp,sp,16
    80020f0c:	00001317          	auipc	t1,0x1
    80020f10:	9b430067          	jr	-1612(t1) # 800218c0 <uartputc_sync>

0000000080020f14 <consoleintr>:
    80020f14:	fe010113          	addi	sp,sp,-32
    80020f18:	00813823          	sd	s0,16(sp)
    80020f1c:	00913423          	sd	s1,8(sp)
    80020f20:	01213023          	sd	s2,0(sp)
    80020f24:	00113c23          	sd	ra,24(sp)
    80020f28:	02010413          	addi	s0,sp,32
    80020f2c:	00003917          	auipc	s2,0x3
    80020f30:	5bc90913          	addi	s2,s2,1468 # 800244e8 <cons>
    80020f34:	00050493          	mv	s1,a0
    80020f38:	00090513          	mv	a0,s2
    80020f3c:	00001097          	auipc	ra,0x1
    80020f40:	e40080e7          	jalr	-448(ra) # 80021d7c <acquire>
    80020f44:	02048c63          	beqz	s1,80020f7c <consoleintr+0x68>
    80020f48:	0a092783          	lw	a5,160(s2)
    80020f4c:	09892703          	lw	a4,152(s2)
    80020f50:	07f00693          	li	a3,127
    80020f54:	40e7873b          	subw	a4,a5,a4
    80020f58:	02e6e263          	bltu	a3,a4,80020f7c <consoleintr+0x68>
    80020f5c:	00d00713          	li	a4,13
    80020f60:	04e48063          	beq	s1,a4,80020fa0 <consoleintr+0x8c>
    80020f64:	07f7f713          	andi	a4,a5,127
    80020f68:	00e90733          	add	a4,s2,a4
    80020f6c:	0017879b          	addiw	a5,a5,1
    80020f70:	0af92023          	sw	a5,160(s2)
    80020f74:	00970c23          	sb	s1,24(a4)
    80020f78:	08f92e23          	sw	a5,156(s2)
    80020f7c:	01013403          	ld	s0,16(sp)
    80020f80:	01813083          	ld	ra,24(sp)
    80020f84:	00813483          	ld	s1,8(sp)
    80020f88:	00013903          	ld	s2,0(sp)
    80020f8c:	00003517          	auipc	a0,0x3
    80020f90:	55c50513          	addi	a0,a0,1372 # 800244e8 <cons>
    80020f94:	02010113          	addi	sp,sp,32
    80020f98:	00001317          	auipc	t1,0x1
    80020f9c:	eb030067          	jr	-336(t1) # 80021e48 <release>
    80020fa0:	00a00493          	li	s1,10
    80020fa4:	fc1ff06f          	j	80020f64 <consoleintr+0x50>

0000000080020fa8 <consoleinit>:
    80020fa8:	fe010113          	addi	sp,sp,-32
    80020fac:	00113c23          	sd	ra,24(sp)
    80020fb0:	00813823          	sd	s0,16(sp)
    80020fb4:	00913423          	sd	s1,8(sp)
    80020fb8:	02010413          	addi	s0,sp,32
    80020fbc:	00003497          	auipc	s1,0x3
    80020fc0:	52c48493          	addi	s1,s1,1324 # 800244e8 <cons>
    80020fc4:	00048513          	mv	a0,s1
    80020fc8:	00002597          	auipc	a1,0x2
    80020fcc:	18058593          	addi	a1,a1,384 # 80023148 <CONSOLE_STATUS+0x138>
    80020fd0:	00001097          	auipc	ra,0x1
    80020fd4:	d88080e7          	jalr	-632(ra) # 80021d58 <initlock>
    80020fd8:	00000097          	auipc	ra,0x0
    80020fdc:	7ac080e7          	jalr	1964(ra) # 80021784 <uartinit>
    80020fe0:	01813083          	ld	ra,24(sp)
    80020fe4:	01013403          	ld	s0,16(sp)
    80020fe8:	00000797          	auipc	a5,0x0
    80020fec:	d9c78793          	addi	a5,a5,-612 # 80020d84 <consoleread>
    80020ff0:	0af4bc23          	sd	a5,184(s1)
    80020ff4:	00000797          	auipc	a5,0x0
    80020ff8:	cec78793          	addi	a5,a5,-788 # 80020ce0 <consolewrite>
    80020ffc:	0cf4b023          	sd	a5,192(s1)
    80021000:	00813483          	ld	s1,8(sp)
    80021004:	02010113          	addi	sp,sp,32
    80021008:	00008067          	ret

000000008002100c <console_read>:
    8002100c:	ff010113          	addi	sp,sp,-16
    80021010:	00813423          	sd	s0,8(sp)
    80021014:	01010413          	addi	s0,sp,16
    80021018:	00813403          	ld	s0,8(sp)
    8002101c:	00003317          	auipc	t1,0x3
    80021020:	58433303          	ld	t1,1412(t1) # 800245a0 <devsw+0x10>
    80021024:	01010113          	addi	sp,sp,16
    80021028:	00030067          	jr	t1

000000008002102c <console_write>:
    8002102c:	ff010113          	addi	sp,sp,-16
    80021030:	00813423          	sd	s0,8(sp)
    80021034:	01010413          	addi	s0,sp,16
    80021038:	00813403          	ld	s0,8(sp)
    8002103c:	00003317          	auipc	t1,0x3
    80021040:	56c33303          	ld	t1,1388(t1) # 800245a8 <devsw+0x18>
    80021044:	01010113          	addi	sp,sp,16
    80021048:	00030067          	jr	t1

000000008002104c <panic>:
    8002104c:	fe010113          	addi	sp,sp,-32
    80021050:	00113c23          	sd	ra,24(sp)
    80021054:	00813823          	sd	s0,16(sp)
    80021058:	00913423          	sd	s1,8(sp)
    8002105c:	02010413          	addi	s0,sp,32
    80021060:	00050493          	mv	s1,a0
    80021064:	00002517          	auipc	a0,0x2
    80021068:	0ec50513          	addi	a0,a0,236 # 80023150 <CONSOLE_STATUS+0x140>
    8002106c:	00003797          	auipc	a5,0x3
    80021070:	5c07ae23          	sw	zero,1500(a5) # 80024648 <pr+0x18>
    80021074:	00000097          	auipc	ra,0x0
    80021078:	034080e7          	jalr	52(ra) # 800210a8 <__printf>
    8002107c:	00048513          	mv	a0,s1
    80021080:	00000097          	auipc	ra,0x0
    80021084:	028080e7          	jalr	40(ra) # 800210a8 <__printf>
    80021088:	00002517          	auipc	a0,0x2
    8002108c:	0a850513          	addi	a0,a0,168 # 80023130 <CONSOLE_STATUS+0x120>
    80021090:	00000097          	auipc	ra,0x0
    80021094:	018080e7          	jalr	24(ra) # 800210a8 <__printf>
    80021098:	00100793          	li	a5,1
    8002109c:	00002717          	auipc	a4,0x2
    800210a0:	34f72623          	sw	a5,844(a4) # 800233e8 <panicked>
    800210a4:	0000006f          	j	800210a4 <panic+0x58>

00000000800210a8 <__printf>:
    800210a8:	f3010113          	addi	sp,sp,-208
    800210ac:	08813023          	sd	s0,128(sp)
    800210b0:	07313423          	sd	s3,104(sp)
    800210b4:	09010413          	addi	s0,sp,144
    800210b8:	05813023          	sd	s8,64(sp)
    800210bc:	08113423          	sd	ra,136(sp)
    800210c0:	06913c23          	sd	s1,120(sp)
    800210c4:	07213823          	sd	s2,112(sp)
    800210c8:	07413023          	sd	s4,96(sp)
    800210cc:	05513c23          	sd	s5,88(sp)
    800210d0:	05613823          	sd	s6,80(sp)
    800210d4:	05713423          	sd	s7,72(sp)
    800210d8:	03913c23          	sd	s9,56(sp)
    800210dc:	03a13823          	sd	s10,48(sp)
    800210e0:	03b13423          	sd	s11,40(sp)
    800210e4:	00003317          	auipc	t1,0x3
    800210e8:	54c30313          	addi	t1,t1,1356 # 80024630 <pr>
    800210ec:	01832c03          	lw	s8,24(t1)
    800210f0:	00b43423          	sd	a1,8(s0)
    800210f4:	00c43823          	sd	a2,16(s0)
    800210f8:	00d43c23          	sd	a3,24(s0)
    800210fc:	02e43023          	sd	a4,32(s0)
    80021100:	02f43423          	sd	a5,40(s0)
    80021104:	03043823          	sd	a6,48(s0)
    80021108:	03143c23          	sd	a7,56(s0)
    8002110c:	00050993          	mv	s3,a0
    80021110:	4a0c1663          	bnez	s8,800215bc <__printf+0x514>
    80021114:	60098c63          	beqz	s3,8002172c <__printf+0x684>
    80021118:	0009c503          	lbu	a0,0(s3)
    8002111c:	00840793          	addi	a5,s0,8
    80021120:	f6f43c23          	sd	a5,-136(s0)
    80021124:	00000493          	li	s1,0
    80021128:	22050063          	beqz	a0,80021348 <__printf+0x2a0>
    8002112c:	00002a37          	lui	s4,0x2
    80021130:	00018ab7          	lui	s5,0x18
    80021134:	000f4b37          	lui	s6,0xf4
    80021138:	00989bb7          	lui	s7,0x989
    8002113c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80021140:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80021144:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80021148:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8002114c:	00148c9b          	addiw	s9,s1,1
    80021150:	02500793          	li	a5,37
    80021154:	01998933          	add	s2,s3,s9
    80021158:	38f51263          	bne	a0,a5,800214dc <__printf+0x434>
    8002115c:	00094783          	lbu	a5,0(s2)
    80021160:	00078c9b          	sext.w	s9,a5
    80021164:	1e078263          	beqz	a5,80021348 <__printf+0x2a0>
    80021168:	0024849b          	addiw	s1,s1,2
    8002116c:	07000713          	li	a4,112
    80021170:	00998933          	add	s2,s3,s1
    80021174:	38e78a63          	beq	a5,a4,80021508 <__printf+0x460>
    80021178:	20f76863          	bltu	a4,a5,80021388 <__printf+0x2e0>
    8002117c:	42a78863          	beq	a5,a0,800215ac <__printf+0x504>
    80021180:	06400713          	li	a4,100
    80021184:	40e79663          	bne	a5,a4,80021590 <__printf+0x4e8>
    80021188:	f7843783          	ld	a5,-136(s0)
    8002118c:	0007a603          	lw	a2,0(a5)
    80021190:	00878793          	addi	a5,a5,8
    80021194:	f6f43c23          	sd	a5,-136(s0)
    80021198:	42064a63          	bltz	a2,800215cc <__printf+0x524>
    8002119c:	00a00713          	li	a4,10
    800211a0:	02e677bb          	remuw	a5,a2,a4
    800211a4:	00002d97          	auipc	s11,0x2
    800211a8:	fd4d8d93          	addi	s11,s11,-44 # 80023178 <digits>
    800211ac:	00900593          	li	a1,9
    800211b0:	0006051b          	sext.w	a0,a2
    800211b4:	00000c93          	li	s9,0
    800211b8:	02079793          	slli	a5,a5,0x20
    800211bc:	0207d793          	srli	a5,a5,0x20
    800211c0:	00fd87b3          	add	a5,s11,a5
    800211c4:	0007c783          	lbu	a5,0(a5)
    800211c8:	02e656bb          	divuw	a3,a2,a4
    800211cc:	f8f40023          	sb	a5,-128(s0)
    800211d0:	14c5d863          	bge	a1,a2,80021320 <__printf+0x278>
    800211d4:	06300593          	li	a1,99
    800211d8:	00100c93          	li	s9,1
    800211dc:	02e6f7bb          	remuw	a5,a3,a4
    800211e0:	02079793          	slli	a5,a5,0x20
    800211e4:	0207d793          	srli	a5,a5,0x20
    800211e8:	00fd87b3          	add	a5,s11,a5
    800211ec:	0007c783          	lbu	a5,0(a5)
    800211f0:	02e6d73b          	divuw	a4,a3,a4
    800211f4:	f8f400a3          	sb	a5,-127(s0)
    800211f8:	12a5f463          	bgeu	a1,a0,80021320 <__printf+0x278>
    800211fc:	00a00693          	li	a3,10
    80021200:	00900593          	li	a1,9
    80021204:	02d777bb          	remuw	a5,a4,a3
    80021208:	02079793          	slli	a5,a5,0x20
    8002120c:	0207d793          	srli	a5,a5,0x20
    80021210:	00fd87b3          	add	a5,s11,a5
    80021214:	0007c503          	lbu	a0,0(a5)
    80021218:	02d757bb          	divuw	a5,a4,a3
    8002121c:	f8a40123          	sb	a0,-126(s0)
    80021220:	48e5f263          	bgeu	a1,a4,800216a4 <__printf+0x5fc>
    80021224:	06300513          	li	a0,99
    80021228:	02d7f5bb          	remuw	a1,a5,a3
    8002122c:	02059593          	slli	a1,a1,0x20
    80021230:	0205d593          	srli	a1,a1,0x20
    80021234:	00bd85b3          	add	a1,s11,a1
    80021238:	0005c583          	lbu	a1,0(a1)
    8002123c:	02d7d7bb          	divuw	a5,a5,a3
    80021240:	f8b401a3          	sb	a1,-125(s0)
    80021244:	48e57263          	bgeu	a0,a4,800216c8 <__printf+0x620>
    80021248:	3e700513          	li	a0,999
    8002124c:	02d7f5bb          	remuw	a1,a5,a3
    80021250:	02059593          	slli	a1,a1,0x20
    80021254:	0205d593          	srli	a1,a1,0x20
    80021258:	00bd85b3          	add	a1,s11,a1
    8002125c:	0005c583          	lbu	a1,0(a1)
    80021260:	02d7d7bb          	divuw	a5,a5,a3
    80021264:	f8b40223          	sb	a1,-124(s0)
    80021268:	46e57663          	bgeu	a0,a4,800216d4 <__printf+0x62c>
    8002126c:	02d7f5bb          	remuw	a1,a5,a3
    80021270:	02059593          	slli	a1,a1,0x20
    80021274:	0205d593          	srli	a1,a1,0x20
    80021278:	00bd85b3          	add	a1,s11,a1
    8002127c:	0005c583          	lbu	a1,0(a1)
    80021280:	02d7d7bb          	divuw	a5,a5,a3
    80021284:	f8b402a3          	sb	a1,-123(s0)
    80021288:	46ea7863          	bgeu	s4,a4,800216f8 <__printf+0x650>
    8002128c:	02d7f5bb          	remuw	a1,a5,a3
    80021290:	02059593          	slli	a1,a1,0x20
    80021294:	0205d593          	srli	a1,a1,0x20
    80021298:	00bd85b3          	add	a1,s11,a1
    8002129c:	0005c583          	lbu	a1,0(a1)
    800212a0:	02d7d7bb          	divuw	a5,a5,a3
    800212a4:	f8b40323          	sb	a1,-122(s0)
    800212a8:	3eeaf863          	bgeu	s5,a4,80021698 <__printf+0x5f0>
    800212ac:	02d7f5bb          	remuw	a1,a5,a3
    800212b0:	02059593          	slli	a1,a1,0x20
    800212b4:	0205d593          	srli	a1,a1,0x20
    800212b8:	00bd85b3          	add	a1,s11,a1
    800212bc:	0005c583          	lbu	a1,0(a1)
    800212c0:	02d7d7bb          	divuw	a5,a5,a3
    800212c4:	f8b403a3          	sb	a1,-121(s0)
    800212c8:	42eb7e63          	bgeu	s6,a4,80021704 <__printf+0x65c>
    800212cc:	02d7f5bb          	remuw	a1,a5,a3
    800212d0:	02059593          	slli	a1,a1,0x20
    800212d4:	0205d593          	srli	a1,a1,0x20
    800212d8:	00bd85b3          	add	a1,s11,a1
    800212dc:	0005c583          	lbu	a1,0(a1)
    800212e0:	02d7d7bb          	divuw	a5,a5,a3
    800212e4:	f8b40423          	sb	a1,-120(s0)
    800212e8:	42ebfc63          	bgeu	s7,a4,80021720 <__printf+0x678>
    800212ec:	02079793          	slli	a5,a5,0x20
    800212f0:	0207d793          	srli	a5,a5,0x20
    800212f4:	00fd8db3          	add	s11,s11,a5
    800212f8:	000dc703          	lbu	a4,0(s11)
    800212fc:	00a00793          	li	a5,10
    80021300:	00900c93          	li	s9,9
    80021304:	f8e404a3          	sb	a4,-119(s0)
    80021308:	00065c63          	bgez	a2,80021320 <__printf+0x278>
    8002130c:	f9040713          	addi	a4,s0,-112
    80021310:	00f70733          	add	a4,a4,a5
    80021314:	02d00693          	li	a3,45
    80021318:	fed70823          	sb	a3,-16(a4)
    8002131c:	00078c93          	mv	s9,a5
    80021320:	f8040793          	addi	a5,s0,-128
    80021324:	01978cb3          	add	s9,a5,s9
    80021328:	f7f40d13          	addi	s10,s0,-129
    8002132c:	000cc503          	lbu	a0,0(s9)
    80021330:	fffc8c93          	addi	s9,s9,-1
    80021334:	00000097          	auipc	ra,0x0
    80021338:	b90080e7          	jalr	-1136(ra) # 80020ec4 <consputc>
    8002133c:	ffac98e3          	bne	s9,s10,8002132c <__printf+0x284>
    80021340:	00094503          	lbu	a0,0(s2)
    80021344:	e00514e3          	bnez	a0,8002114c <__printf+0xa4>
    80021348:	1a0c1663          	bnez	s8,800214f4 <__printf+0x44c>
    8002134c:	08813083          	ld	ra,136(sp)
    80021350:	08013403          	ld	s0,128(sp)
    80021354:	07813483          	ld	s1,120(sp)
    80021358:	07013903          	ld	s2,112(sp)
    8002135c:	06813983          	ld	s3,104(sp)
    80021360:	06013a03          	ld	s4,96(sp)
    80021364:	05813a83          	ld	s5,88(sp)
    80021368:	05013b03          	ld	s6,80(sp)
    8002136c:	04813b83          	ld	s7,72(sp)
    80021370:	04013c03          	ld	s8,64(sp)
    80021374:	03813c83          	ld	s9,56(sp)
    80021378:	03013d03          	ld	s10,48(sp)
    8002137c:	02813d83          	ld	s11,40(sp)
    80021380:	0d010113          	addi	sp,sp,208
    80021384:	00008067          	ret
    80021388:	07300713          	li	a4,115
    8002138c:	1ce78a63          	beq	a5,a4,80021560 <__printf+0x4b8>
    80021390:	07800713          	li	a4,120
    80021394:	1ee79e63          	bne	a5,a4,80021590 <__printf+0x4e8>
    80021398:	f7843783          	ld	a5,-136(s0)
    8002139c:	0007a703          	lw	a4,0(a5)
    800213a0:	00878793          	addi	a5,a5,8
    800213a4:	f6f43c23          	sd	a5,-136(s0)
    800213a8:	28074263          	bltz	a4,8002162c <__printf+0x584>
    800213ac:	00002d97          	auipc	s11,0x2
    800213b0:	dccd8d93          	addi	s11,s11,-564 # 80023178 <digits>
    800213b4:	00f77793          	andi	a5,a4,15
    800213b8:	00fd87b3          	add	a5,s11,a5
    800213bc:	0007c683          	lbu	a3,0(a5)
    800213c0:	00f00613          	li	a2,15
    800213c4:	0007079b          	sext.w	a5,a4
    800213c8:	f8d40023          	sb	a3,-128(s0)
    800213cc:	0047559b          	srliw	a1,a4,0x4
    800213d0:	0047569b          	srliw	a3,a4,0x4
    800213d4:	00000c93          	li	s9,0
    800213d8:	0ee65063          	bge	a2,a4,800214b8 <__printf+0x410>
    800213dc:	00f6f693          	andi	a3,a3,15
    800213e0:	00dd86b3          	add	a3,s11,a3
    800213e4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800213e8:	0087d79b          	srliw	a5,a5,0x8
    800213ec:	00100c93          	li	s9,1
    800213f0:	f8d400a3          	sb	a3,-127(s0)
    800213f4:	0cb67263          	bgeu	a2,a1,800214b8 <__printf+0x410>
    800213f8:	00f7f693          	andi	a3,a5,15
    800213fc:	00dd86b3          	add	a3,s11,a3
    80021400:	0006c583          	lbu	a1,0(a3)
    80021404:	00f00613          	li	a2,15
    80021408:	0047d69b          	srliw	a3,a5,0x4
    8002140c:	f8b40123          	sb	a1,-126(s0)
    80021410:	0047d593          	srli	a1,a5,0x4
    80021414:	28f67e63          	bgeu	a2,a5,800216b0 <__printf+0x608>
    80021418:	00f6f693          	andi	a3,a3,15
    8002141c:	00dd86b3          	add	a3,s11,a3
    80021420:	0006c503          	lbu	a0,0(a3)
    80021424:	0087d813          	srli	a6,a5,0x8
    80021428:	0087d69b          	srliw	a3,a5,0x8
    8002142c:	f8a401a3          	sb	a0,-125(s0)
    80021430:	28b67663          	bgeu	a2,a1,800216bc <__printf+0x614>
    80021434:	00f6f693          	andi	a3,a3,15
    80021438:	00dd86b3          	add	a3,s11,a3
    8002143c:	0006c583          	lbu	a1,0(a3)
    80021440:	00c7d513          	srli	a0,a5,0xc
    80021444:	00c7d69b          	srliw	a3,a5,0xc
    80021448:	f8b40223          	sb	a1,-124(s0)
    8002144c:	29067a63          	bgeu	a2,a6,800216e0 <__printf+0x638>
    80021450:	00f6f693          	andi	a3,a3,15
    80021454:	00dd86b3          	add	a3,s11,a3
    80021458:	0006c583          	lbu	a1,0(a3)
    8002145c:	0107d813          	srli	a6,a5,0x10
    80021460:	0107d69b          	srliw	a3,a5,0x10
    80021464:	f8b402a3          	sb	a1,-123(s0)
    80021468:	28a67263          	bgeu	a2,a0,800216ec <__printf+0x644>
    8002146c:	00f6f693          	andi	a3,a3,15
    80021470:	00dd86b3          	add	a3,s11,a3
    80021474:	0006c683          	lbu	a3,0(a3)
    80021478:	0147d79b          	srliw	a5,a5,0x14
    8002147c:	f8d40323          	sb	a3,-122(s0)
    80021480:	21067663          	bgeu	a2,a6,8002168c <__printf+0x5e4>
    80021484:	02079793          	slli	a5,a5,0x20
    80021488:	0207d793          	srli	a5,a5,0x20
    8002148c:	00fd8db3          	add	s11,s11,a5
    80021490:	000dc683          	lbu	a3,0(s11)
    80021494:	00800793          	li	a5,8
    80021498:	00700c93          	li	s9,7
    8002149c:	f8d403a3          	sb	a3,-121(s0)
    800214a0:	00075c63          	bgez	a4,800214b8 <__printf+0x410>
    800214a4:	f9040713          	addi	a4,s0,-112
    800214a8:	00f70733          	add	a4,a4,a5
    800214ac:	02d00693          	li	a3,45
    800214b0:	fed70823          	sb	a3,-16(a4)
    800214b4:	00078c93          	mv	s9,a5
    800214b8:	f8040793          	addi	a5,s0,-128
    800214bc:	01978cb3          	add	s9,a5,s9
    800214c0:	f7f40d13          	addi	s10,s0,-129
    800214c4:	000cc503          	lbu	a0,0(s9)
    800214c8:	fffc8c93          	addi	s9,s9,-1
    800214cc:	00000097          	auipc	ra,0x0
    800214d0:	9f8080e7          	jalr	-1544(ra) # 80020ec4 <consputc>
    800214d4:	ff9d18e3          	bne	s10,s9,800214c4 <__printf+0x41c>
    800214d8:	0100006f          	j	800214e8 <__printf+0x440>
    800214dc:	00000097          	auipc	ra,0x0
    800214e0:	9e8080e7          	jalr	-1560(ra) # 80020ec4 <consputc>
    800214e4:	000c8493          	mv	s1,s9
    800214e8:	00094503          	lbu	a0,0(s2)
    800214ec:	c60510e3          	bnez	a0,8002114c <__printf+0xa4>
    800214f0:	e40c0ee3          	beqz	s8,8002134c <__printf+0x2a4>
    800214f4:	00003517          	auipc	a0,0x3
    800214f8:	13c50513          	addi	a0,a0,316 # 80024630 <pr>
    800214fc:	00001097          	auipc	ra,0x1
    80021500:	94c080e7          	jalr	-1716(ra) # 80021e48 <release>
    80021504:	e49ff06f          	j	8002134c <__printf+0x2a4>
    80021508:	f7843783          	ld	a5,-136(s0)
    8002150c:	03000513          	li	a0,48
    80021510:	01000d13          	li	s10,16
    80021514:	00878713          	addi	a4,a5,8
    80021518:	0007bc83          	ld	s9,0(a5)
    8002151c:	f6e43c23          	sd	a4,-136(s0)
    80021520:	00000097          	auipc	ra,0x0
    80021524:	9a4080e7          	jalr	-1628(ra) # 80020ec4 <consputc>
    80021528:	07800513          	li	a0,120
    8002152c:	00000097          	auipc	ra,0x0
    80021530:	998080e7          	jalr	-1640(ra) # 80020ec4 <consputc>
    80021534:	00002d97          	auipc	s11,0x2
    80021538:	c44d8d93          	addi	s11,s11,-956 # 80023178 <digits>
    8002153c:	03ccd793          	srli	a5,s9,0x3c
    80021540:	00fd87b3          	add	a5,s11,a5
    80021544:	0007c503          	lbu	a0,0(a5)
    80021548:	fffd0d1b          	addiw	s10,s10,-1
    8002154c:	004c9c93          	slli	s9,s9,0x4
    80021550:	00000097          	auipc	ra,0x0
    80021554:	974080e7          	jalr	-1676(ra) # 80020ec4 <consputc>
    80021558:	fe0d12e3          	bnez	s10,8002153c <__printf+0x494>
    8002155c:	f8dff06f          	j	800214e8 <__printf+0x440>
    80021560:	f7843783          	ld	a5,-136(s0)
    80021564:	0007bc83          	ld	s9,0(a5)
    80021568:	00878793          	addi	a5,a5,8
    8002156c:	f6f43c23          	sd	a5,-136(s0)
    80021570:	000c9a63          	bnez	s9,80021584 <__printf+0x4dc>
    80021574:	1080006f          	j	8002167c <__printf+0x5d4>
    80021578:	001c8c93          	addi	s9,s9,1
    8002157c:	00000097          	auipc	ra,0x0
    80021580:	948080e7          	jalr	-1720(ra) # 80020ec4 <consputc>
    80021584:	000cc503          	lbu	a0,0(s9)
    80021588:	fe0518e3          	bnez	a0,80021578 <__printf+0x4d0>
    8002158c:	f5dff06f          	j	800214e8 <__printf+0x440>
    80021590:	02500513          	li	a0,37
    80021594:	00000097          	auipc	ra,0x0
    80021598:	930080e7          	jalr	-1744(ra) # 80020ec4 <consputc>
    8002159c:	000c8513          	mv	a0,s9
    800215a0:	00000097          	auipc	ra,0x0
    800215a4:	924080e7          	jalr	-1756(ra) # 80020ec4 <consputc>
    800215a8:	f41ff06f          	j	800214e8 <__printf+0x440>
    800215ac:	02500513          	li	a0,37
    800215b0:	00000097          	auipc	ra,0x0
    800215b4:	914080e7          	jalr	-1772(ra) # 80020ec4 <consputc>
    800215b8:	f31ff06f          	j	800214e8 <__printf+0x440>
    800215bc:	00030513          	mv	a0,t1
    800215c0:	00000097          	auipc	ra,0x0
    800215c4:	7bc080e7          	jalr	1980(ra) # 80021d7c <acquire>
    800215c8:	b4dff06f          	j	80021114 <__printf+0x6c>
    800215cc:	40c0053b          	negw	a0,a2
    800215d0:	00a00713          	li	a4,10
    800215d4:	02e576bb          	remuw	a3,a0,a4
    800215d8:	00002d97          	auipc	s11,0x2
    800215dc:	ba0d8d93          	addi	s11,s11,-1120 # 80023178 <digits>
    800215e0:	ff700593          	li	a1,-9
    800215e4:	02069693          	slli	a3,a3,0x20
    800215e8:	0206d693          	srli	a3,a3,0x20
    800215ec:	00dd86b3          	add	a3,s11,a3
    800215f0:	0006c683          	lbu	a3,0(a3)
    800215f4:	02e557bb          	divuw	a5,a0,a4
    800215f8:	f8d40023          	sb	a3,-128(s0)
    800215fc:	10b65e63          	bge	a2,a1,80021718 <__printf+0x670>
    80021600:	06300593          	li	a1,99
    80021604:	02e7f6bb          	remuw	a3,a5,a4
    80021608:	02069693          	slli	a3,a3,0x20
    8002160c:	0206d693          	srli	a3,a3,0x20
    80021610:	00dd86b3          	add	a3,s11,a3
    80021614:	0006c683          	lbu	a3,0(a3)
    80021618:	02e7d73b          	divuw	a4,a5,a4
    8002161c:	00200793          	li	a5,2
    80021620:	f8d400a3          	sb	a3,-127(s0)
    80021624:	bca5ece3          	bltu	a1,a0,800211fc <__printf+0x154>
    80021628:	ce5ff06f          	j	8002130c <__printf+0x264>
    8002162c:	40e007bb          	negw	a5,a4
    80021630:	00002d97          	auipc	s11,0x2
    80021634:	b48d8d93          	addi	s11,s11,-1208 # 80023178 <digits>
    80021638:	00f7f693          	andi	a3,a5,15
    8002163c:	00dd86b3          	add	a3,s11,a3
    80021640:	0006c583          	lbu	a1,0(a3)
    80021644:	ff100613          	li	a2,-15
    80021648:	0047d69b          	srliw	a3,a5,0x4
    8002164c:	f8b40023          	sb	a1,-128(s0)
    80021650:	0047d59b          	srliw	a1,a5,0x4
    80021654:	0ac75e63          	bge	a4,a2,80021710 <__printf+0x668>
    80021658:	00f6f693          	andi	a3,a3,15
    8002165c:	00dd86b3          	add	a3,s11,a3
    80021660:	0006c603          	lbu	a2,0(a3)
    80021664:	00f00693          	li	a3,15
    80021668:	0087d79b          	srliw	a5,a5,0x8
    8002166c:	f8c400a3          	sb	a2,-127(s0)
    80021670:	d8b6e4e3          	bltu	a3,a1,800213f8 <__printf+0x350>
    80021674:	00200793          	li	a5,2
    80021678:	e2dff06f          	j	800214a4 <__printf+0x3fc>
    8002167c:	00002c97          	auipc	s9,0x2
    80021680:	adcc8c93          	addi	s9,s9,-1316 # 80023158 <CONSOLE_STATUS+0x148>
    80021684:	02800513          	li	a0,40
    80021688:	ef1ff06f          	j	80021578 <__printf+0x4d0>
    8002168c:	00700793          	li	a5,7
    80021690:	00600c93          	li	s9,6
    80021694:	e0dff06f          	j	800214a0 <__printf+0x3f8>
    80021698:	00700793          	li	a5,7
    8002169c:	00600c93          	li	s9,6
    800216a0:	c69ff06f          	j	80021308 <__printf+0x260>
    800216a4:	00300793          	li	a5,3
    800216a8:	00200c93          	li	s9,2
    800216ac:	c5dff06f          	j	80021308 <__printf+0x260>
    800216b0:	00300793          	li	a5,3
    800216b4:	00200c93          	li	s9,2
    800216b8:	de9ff06f          	j	800214a0 <__printf+0x3f8>
    800216bc:	00400793          	li	a5,4
    800216c0:	00300c93          	li	s9,3
    800216c4:	dddff06f          	j	800214a0 <__printf+0x3f8>
    800216c8:	00400793          	li	a5,4
    800216cc:	00300c93          	li	s9,3
    800216d0:	c39ff06f          	j	80021308 <__printf+0x260>
    800216d4:	00500793          	li	a5,5
    800216d8:	00400c93          	li	s9,4
    800216dc:	c2dff06f          	j	80021308 <__printf+0x260>
    800216e0:	00500793          	li	a5,5
    800216e4:	00400c93          	li	s9,4
    800216e8:	db9ff06f          	j	800214a0 <__printf+0x3f8>
    800216ec:	00600793          	li	a5,6
    800216f0:	00500c93          	li	s9,5
    800216f4:	dadff06f          	j	800214a0 <__printf+0x3f8>
    800216f8:	00600793          	li	a5,6
    800216fc:	00500c93          	li	s9,5
    80021700:	c09ff06f          	j	80021308 <__printf+0x260>
    80021704:	00800793          	li	a5,8
    80021708:	00700c93          	li	s9,7
    8002170c:	bfdff06f          	j	80021308 <__printf+0x260>
    80021710:	00100793          	li	a5,1
    80021714:	d91ff06f          	j	800214a4 <__printf+0x3fc>
    80021718:	00100793          	li	a5,1
    8002171c:	bf1ff06f          	j	8002130c <__printf+0x264>
    80021720:	00900793          	li	a5,9
    80021724:	00800c93          	li	s9,8
    80021728:	be1ff06f          	j	80021308 <__printf+0x260>
    8002172c:	00002517          	auipc	a0,0x2
    80021730:	a3450513          	addi	a0,a0,-1484 # 80023160 <CONSOLE_STATUS+0x150>
    80021734:	00000097          	auipc	ra,0x0
    80021738:	918080e7          	jalr	-1768(ra) # 8002104c <panic>

000000008002173c <printfinit>:
    8002173c:	fe010113          	addi	sp,sp,-32
    80021740:	00813823          	sd	s0,16(sp)
    80021744:	00913423          	sd	s1,8(sp)
    80021748:	00113c23          	sd	ra,24(sp)
    8002174c:	02010413          	addi	s0,sp,32
    80021750:	00003497          	auipc	s1,0x3
    80021754:	ee048493          	addi	s1,s1,-288 # 80024630 <pr>
    80021758:	00048513          	mv	a0,s1
    8002175c:	00002597          	auipc	a1,0x2
    80021760:	a1458593          	addi	a1,a1,-1516 # 80023170 <CONSOLE_STATUS+0x160>
    80021764:	00000097          	auipc	ra,0x0
    80021768:	5f4080e7          	jalr	1524(ra) # 80021d58 <initlock>
    8002176c:	01813083          	ld	ra,24(sp)
    80021770:	01013403          	ld	s0,16(sp)
    80021774:	0004ac23          	sw	zero,24(s1)
    80021778:	00813483          	ld	s1,8(sp)
    8002177c:	02010113          	addi	sp,sp,32
    80021780:	00008067          	ret

0000000080021784 <uartinit>:
    80021784:	ff010113          	addi	sp,sp,-16
    80021788:	00813423          	sd	s0,8(sp)
    8002178c:	01010413          	addi	s0,sp,16
    80021790:	100007b7          	lui	a5,0x10000
    80021794:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80021798:	f8000713          	li	a4,-128
    8002179c:	00e781a3          	sb	a4,3(a5)
    800217a0:	00300713          	li	a4,3
    800217a4:	00e78023          	sb	a4,0(a5)
    800217a8:	000780a3          	sb	zero,1(a5)
    800217ac:	00e781a3          	sb	a4,3(a5)
    800217b0:	00700693          	li	a3,7
    800217b4:	00d78123          	sb	a3,2(a5)
    800217b8:	00e780a3          	sb	a4,1(a5)
    800217bc:	00813403          	ld	s0,8(sp)
    800217c0:	01010113          	addi	sp,sp,16
    800217c4:	00008067          	ret

00000000800217c8 <uartputc>:
    800217c8:	00002797          	auipc	a5,0x2
    800217cc:	c207a783          	lw	a5,-992(a5) # 800233e8 <panicked>
    800217d0:	00078463          	beqz	a5,800217d8 <uartputc+0x10>
    800217d4:	0000006f          	j	800217d4 <uartputc+0xc>
    800217d8:	fd010113          	addi	sp,sp,-48
    800217dc:	02813023          	sd	s0,32(sp)
    800217e0:	00913c23          	sd	s1,24(sp)
    800217e4:	01213823          	sd	s2,16(sp)
    800217e8:	01313423          	sd	s3,8(sp)
    800217ec:	02113423          	sd	ra,40(sp)
    800217f0:	03010413          	addi	s0,sp,48
    800217f4:	00002917          	auipc	s2,0x2
    800217f8:	bfc90913          	addi	s2,s2,-1028 # 800233f0 <uart_tx_r>
    800217fc:	00093783          	ld	a5,0(s2)
    80021800:	00002497          	auipc	s1,0x2
    80021804:	bf848493          	addi	s1,s1,-1032 # 800233f8 <uart_tx_w>
    80021808:	0004b703          	ld	a4,0(s1)
    8002180c:	02078693          	addi	a3,a5,32
    80021810:	00050993          	mv	s3,a0
    80021814:	02e69c63          	bne	a3,a4,8002184c <uartputc+0x84>
    80021818:	00001097          	auipc	ra,0x1
    8002181c:	834080e7          	jalr	-1996(ra) # 8002204c <push_on>
    80021820:	00093783          	ld	a5,0(s2)
    80021824:	0004b703          	ld	a4,0(s1)
    80021828:	02078793          	addi	a5,a5,32
    8002182c:	00e79463          	bne	a5,a4,80021834 <uartputc+0x6c>
    80021830:	0000006f          	j	80021830 <uartputc+0x68>
    80021834:	00001097          	auipc	ra,0x1
    80021838:	88c080e7          	jalr	-1908(ra) # 800220c0 <pop_on>
    8002183c:	00093783          	ld	a5,0(s2)
    80021840:	0004b703          	ld	a4,0(s1)
    80021844:	02078693          	addi	a3,a5,32
    80021848:	fce688e3          	beq	a3,a4,80021818 <uartputc+0x50>
    8002184c:	01f77693          	andi	a3,a4,31
    80021850:	00003597          	auipc	a1,0x3
    80021854:	e0058593          	addi	a1,a1,-512 # 80024650 <uart_tx_buf>
    80021858:	00d586b3          	add	a3,a1,a3
    8002185c:	00170713          	addi	a4,a4,1
    80021860:	01368023          	sb	s3,0(a3)
    80021864:	00e4b023          	sd	a4,0(s1)
    80021868:	10000637          	lui	a2,0x10000
    8002186c:	02f71063          	bne	a4,a5,8002188c <uartputc+0xc4>
    80021870:	0340006f          	j	800218a4 <uartputc+0xdc>
    80021874:	00074703          	lbu	a4,0(a4)
    80021878:	00f93023          	sd	a5,0(s2)
    8002187c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80021880:	00093783          	ld	a5,0(s2)
    80021884:	0004b703          	ld	a4,0(s1)
    80021888:	00f70e63          	beq	a4,a5,800218a4 <uartputc+0xdc>
    8002188c:	00564683          	lbu	a3,5(a2)
    80021890:	01f7f713          	andi	a4,a5,31
    80021894:	00e58733          	add	a4,a1,a4
    80021898:	0206f693          	andi	a3,a3,32
    8002189c:	00178793          	addi	a5,a5,1
    800218a0:	fc069ae3          	bnez	a3,80021874 <uartputc+0xac>
    800218a4:	02813083          	ld	ra,40(sp)
    800218a8:	02013403          	ld	s0,32(sp)
    800218ac:	01813483          	ld	s1,24(sp)
    800218b0:	01013903          	ld	s2,16(sp)
    800218b4:	00813983          	ld	s3,8(sp)
    800218b8:	03010113          	addi	sp,sp,48
    800218bc:	00008067          	ret

00000000800218c0 <uartputc_sync>:
    800218c0:	ff010113          	addi	sp,sp,-16
    800218c4:	00813423          	sd	s0,8(sp)
    800218c8:	01010413          	addi	s0,sp,16
    800218cc:	00002717          	auipc	a4,0x2
    800218d0:	b1c72703          	lw	a4,-1252(a4) # 800233e8 <panicked>
    800218d4:	02071663          	bnez	a4,80021900 <uartputc_sync+0x40>
    800218d8:	00050793          	mv	a5,a0
    800218dc:	100006b7          	lui	a3,0x10000
    800218e0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800218e4:	02077713          	andi	a4,a4,32
    800218e8:	fe070ce3          	beqz	a4,800218e0 <uartputc_sync+0x20>
    800218ec:	0ff7f793          	andi	a5,a5,255
    800218f0:	00f68023          	sb	a5,0(a3)
    800218f4:	00813403          	ld	s0,8(sp)
    800218f8:	01010113          	addi	sp,sp,16
    800218fc:	00008067          	ret
    80021900:	0000006f          	j	80021900 <uartputc_sync+0x40>

0000000080021904 <uartstart>:
    80021904:	ff010113          	addi	sp,sp,-16
    80021908:	00813423          	sd	s0,8(sp)
    8002190c:	01010413          	addi	s0,sp,16
    80021910:	00002617          	auipc	a2,0x2
    80021914:	ae060613          	addi	a2,a2,-1312 # 800233f0 <uart_tx_r>
    80021918:	00002517          	auipc	a0,0x2
    8002191c:	ae050513          	addi	a0,a0,-1312 # 800233f8 <uart_tx_w>
    80021920:	00063783          	ld	a5,0(a2)
    80021924:	00053703          	ld	a4,0(a0)
    80021928:	04f70263          	beq	a4,a5,8002196c <uartstart+0x68>
    8002192c:	100005b7          	lui	a1,0x10000
    80021930:	00003817          	auipc	a6,0x3
    80021934:	d2080813          	addi	a6,a6,-736 # 80024650 <uart_tx_buf>
    80021938:	01c0006f          	j	80021954 <uartstart+0x50>
    8002193c:	0006c703          	lbu	a4,0(a3)
    80021940:	00f63023          	sd	a5,0(a2)
    80021944:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021948:	00063783          	ld	a5,0(a2)
    8002194c:	00053703          	ld	a4,0(a0)
    80021950:	00f70e63          	beq	a4,a5,8002196c <uartstart+0x68>
    80021954:	01f7f713          	andi	a4,a5,31
    80021958:	00e806b3          	add	a3,a6,a4
    8002195c:	0055c703          	lbu	a4,5(a1)
    80021960:	00178793          	addi	a5,a5,1
    80021964:	02077713          	andi	a4,a4,32
    80021968:	fc071ae3          	bnez	a4,8002193c <uartstart+0x38>
    8002196c:	00813403          	ld	s0,8(sp)
    80021970:	01010113          	addi	sp,sp,16
    80021974:	00008067          	ret

0000000080021978 <uartgetc>:
    80021978:	ff010113          	addi	sp,sp,-16
    8002197c:	00813423          	sd	s0,8(sp)
    80021980:	01010413          	addi	s0,sp,16
    80021984:	10000737          	lui	a4,0x10000
    80021988:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8002198c:	0017f793          	andi	a5,a5,1
    80021990:	00078c63          	beqz	a5,800219a8 <uartgetc+0x30>
    80021994:	00074503          	lbu	a0,0(a4)
    80021998:	0ff57513          	andi	a0,a0,255
    8002199c:	00813403          	ld	s0,8(sp)
    800219a0:	01010113          	addi	sp,sp,16
    800219a4:	00008067          	ret
    800219a8:	fff00513          	li	a0,-1
    800219ac:	ff1ff06f          	j	8002199c <uartgetc+0x24>

00000000800219b0 <uartintr>:
    800219b0:	100007b7          	lui	a5,0x10000
    800219b4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800219b8:	0017f793          	andi	a5,a5,1
    800219bc:	0a078463          	beqz	a5,80021a64 <uartintr+0xb4>
    800219c0:	fe010113          	addi	sp,sp,-32
    800219c4:	00813823          	sd	s0,16(sp)
    800219c8:	00913423          	sd	s1,8(sp)
    800219cc:	00113c23          	sd	ra,24(sp)
    800219d0:	02010413          	addi	s0,sp,32
    800219d4:	100004b7          	lui	s1,0x10000
    800219d8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800219dc:	0ff57513          	andi	a0,a0,255
    800219e0:	fffff097          	auipc	ra,0xfffff
    800219e4:	534080e7          	jalr	1332(ra) # 80020f14 <consoleintr>
    800219e8:	0054c783          	lbu	a5,5(s1)
    800219ec:	0017f793          	andi	a5,a5,1
    800219f0:	fe0794e3          	bnez	a5,800219d8 <uartintr+0x28>
    800219f4:	00002617          	auipc	a2,0x2
    800219f8:	9fc60613          	addi	a2,a2,-1540 # 800233f0 <uart_tx_r>
    800219fc:	00002517          	auipc	a0,0x2
    80021a00:	9fc50513          	addi	a0,a0,-1540 # 800233f8 <uart_tx_w>
    80021a04:	00063783          	ld	a5,0(a2)
    80021a08:	00053703          	ld	a4,0(a0)
    80021a0c:	04f70263          	beq	a4,a5,80021a50 <uartintr+0xa0>
    80021a10:	100005b7          	lui	a1,0x10000
    80021a14:	00003817          	auipc	a6,0x3
    80021a18:	c3c80813          	addi	a6,a6,-964 # 80024650 <uart_tx_buf>
    80021a1c:	01c0006f          	j	80021a38 <uartintr+0x88>
    80021a20:	0006c703          	lbu	a4,0(a3)
    80021a24:	00f63023          	sd	a5,0(a2)
    80021a28:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021a2c:	00063783          	ld	a5,0(a2)
    80021a30:	00053703          	ld	a4,0(a0)
    80021a34:	00f70e63          	beq	a4,a5,80021a50 <uartintr+0xa0>
    80021a38:	01f7f713          	andi	a4,a5,31
    80021a3c:	00e806b3          	add	a3,a6,a4
    80021a40:	0055c703          	lbu	a4,5(a1)
    80021a44:	00178793          	addi	a5,a5,1
    80021a48:	02077713          	andi	a4,a4,32
    80021a4c:	fc071ae3          	bnez	a4,80021a20 <uartintr+0x70>
    80021a50:	01813083          	ld	ra,24(sp)
    80021a54:	01013403          	ld	s0,16(sp)
    80021a58:	00813483          	ld	s1,8(sp)
    80021a5c:	02010113          	addi	sp,sp,32
    80021a60:	00008067          	ret
    80021a64:	00002617          	auipc	a2,0x2
    80021a68:	98c60613          	addi	a2,a2,-1652 # 800233f0 <uart_tx_r>
    80021a6c:	00002517          	auipc	a0,0x2
    80021a70:	98c50513          	addi	a0,a0,-1652 # 800233f8 <uart_tx_w>
    80021a74:	00063783          	ld	a5,0(a2)
    80021a78:	00053703          	ld	a4,0(a0)
    80021a7c:	04f70263          	beq	a4,a5,80021ac0 <uartintr+0x110>
    80021a80:	100005b7          	lui	a1,0x10000
    80021a84:	00003817          	auipc	a6,0x3
    80021a88:	bcc80813          	addi	a6,a6,-1076 # 80024650 <uart_tx_buf>
    80021a8c:	01c0006f          	j	80021aa8 <uartintr+0xf8>
    80021a90:	0006c703          	lbu	a4,0(a3)
    80021a94:	00f63023          	sd	a5,0(a2)
    80021a98:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80021a9c:	00063783          	ld	a5,0(a2)
    80021aa0:	00053703          	ld	a4,0(a0)
    80021aa4:	02f70063          	beq	a4,a5,80021ac4 <uartintr+0x114>
    80021aa8:	01f7f713          	andi	a4,a5,31
    80021aac:	00e806b3          	add	a3,a6,a4
    80021ab0:	0055c703          	lbu	a4,5(a1)
    80021ab4:	00178793          	addi	a5,a5,1
    80021ab8:	02077713          	andi	a4,a4,32
    80021abc:	fc071ae3          	bnez	a4,80021a90 <uartintr+0xe0>
    80021ac0:	00008067          	ret
    80021ac4:	00008067          	ret

0000000080021ac8 <kinit>:
    80021ac8:	fc010113          	addi	sp,sp,-64
    80021acc:	02913423          	sd	s1,40(sp)
    80021ad0:	fffff7b7          	lui	a5,0xfffff
    80021ad4:	00004497          	auipc	s1,0x4
    80021ad8:	b9b48493          	addi	s1,s1,-1125 # 8002566f <end+0xfff>
    80021adc:	02813823          	sd	s0,48(sp)
    80021ae0:	01313c23          	sd	s3,24(sp)
    80021ae4:	00f4f4b3          	and	s1,s1,a5
    80021ae8:	02113c23          	sd	ra,56(sp)
    80021aec:	03213023          	sd	s2,32(sp)
    80021af0:	01413823          	sd	s4,16(sp)
    80021af4:	01513423          	sd	s5,8(sp)
    80021af8:	04010413          	addi	s0,sp,64
    80021afc:	000017b7          	lui	a5,0x1
    80021b00:	01100993          	li	s3,17
    80021b04:	00f487b3          	add	a5,s1,a5
    80021b08:	01b99993          	slli	s3,s3,0x1b
    80021b0c:	06f9e063          	bltu	s3,a5,80021b6c <kinit+0xa4>
    80021b10:	00003a97          	auipc	s5,0x3
    80021b14:	b60a8a93          	addi	s5,s5,-1184 # 80024670 <end>
    80021b18:	0754ec63          	bltu	s1,s5,80021b90 <kinit+0xc8>
    80021b1c:	0734fa63          	bgeu	s1,s3,80021b90 <kinit+0xc8>
    80021b20:	00088a37          	lui	s4,0x88
    80021b24:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80021b28:	00002917          	auipc	s2,0x2
    80021b2c:	8d890913          	addi	s2,s2,-1832 # 80023400 <kmem>
    80021b30:	00ca1a13          	slli	s4,s4,0xc
    80021b34:	0140006f          	j	80021b48 <kinit+0x80>
    80021b38:	000017b7          	lui	a5,0x1
    80021b3c:	00f484b3          	add	s1,s1,a5
    80021b40:	0554e863          	bltu	s1,s5,80021b90 <kinit+0xc8>
    80021b44:	0534f663          	bgeu	s1,s3,80021b90 <kinit+0xc8>
    80021b48:	00001637          	lui	a2,0x1
    80021b4c:	00100593          	li	a1,1
    80021b50:	00048513          	mv	a0,s1
    80021b54:	00000097          	auipc	ra,0x0
    80021b58:	5e4080e7          	jalr	1508(ra) # 80022138 <__memset>
    80021b5c:	00093783          	ld	a5,0(s2)
    80021b60:	00f4b023          	sd	a5,0(s1)
    80021b64:	00993023          	sd	s1,0(s2)
    80021b68:	fd4498e3          	bne	s1,s4,80021b38 <kinit+0x70>
    80021b6c:	03813083          	ld	ra,56(sp)
    80021b70:	03013403          	ld	s0,48(sp)
    80021b74:	02813483          	ld	s1,40(sp)
    80021b78:	02013903          	ld	s2,32(sp)
    80021b7c:	01813983          	ld	s3,24(sp)
    80021b80:	01013a03          	ld	s4,16(sp)
    80021b84:	00813a83          	ld	s5,8(sp)
    80021b88:	04010113          	addi	sp,sp,64
    80021b8c:	00008067          	ret
    80021b90:	00001517          	auipc	a0,0x1
    80021b94:	60050513          	addi	a0,a0,1536 # 80023190 <digits+0x18>
    80021b98:	fffff097          	auipc	ra,0xfffff
    80021b9c:	4b4080e7          	jalr	1204(ra) # 8002104c <panic>

0000000080021ba0 <freerange>:
    80021ba0:	fc010113          	addi	sp,sp,-64
    80021ba4:	000017b7          	lui	a5,0x1
    80021ba8:	02913423          	sd	s1,40(sp)
    80021bac:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80021bb0:	009504b3          	add	s1,a0,s1
    80021bb4:	fffff537          	lui	a0,0xfffff
    80021bb8:	02813823          	sd	s0,48(sp)
    80021bbc:	02113c23          	sd	ra,56(sp)
    80021bc0:	03213023          	sd	s2,32(sp)
    80021bc4:	01313c23          	sd	s3,24(sp)
    80021bc8:	01413823          	sd	s4,16(sp)
    80021bcc:	01513423          	sd	s5,8(sp)
    80021bd0:	01613023          	sd	s6,0(sp)
    80021bd4:	04010413          	addi	s0,sp,64
    80021bd8:	00a4f4b3          	and	s1,s1,a0
    80021bdc:	00f487b3          	add	a5,s1,a5
    80021be0:	06f5e463          	bltu	a1,a5,80021c48 <freerange+0xa8>
    80021be4:	00003a97          	auipc	s5,0x3
    80021be8:	a8ca8a93          	addi	s5,s5,-1396 # 80024670 <end>
    80021bec:	0954e263          	bltu	s1,s5,80021c70 <freerange+0xd0>
    80021bf0:	01100993          	li	s3,17
    80021bf4:	01b99993          	slli	s3,s3,0x1b
    80021bf8:	0734fc63          	bgeu	s1,s3,80021c70 <freerange+0xd0>
    80021bfc:	00058a13          	mv	s4,a1
    80021c00:	00002917          	auipc	s2,0x2
    80021c04:	80090913          	addi	s2,s2,-2048 # 80023400 <kmem>
    80021c08:	00002b37          	lui	s6,0x2
    80021c0c:	0140006f          	j	80021c20 <freerange+0x80>
    80021c10:	000017b7          	lui	a5,0x1
    80021c14:	00f484b3          	add	s1,s1,a5
    80021c18:	0554ec63          	bltu	s1,s5,80021c70 <freerange+0xd0>
    80021c1c:	0534fa63          	bgeu	s1,s3,80021c70 <freerange+0xd0>
    80021c20:	00001637          	lui	a2,0x1
    80021c24:	00100593          	li	a1,1
    80021c28:	00048513          	mv	a0,s1
    80021c2c:	00000097          	auipc	ra,0x0
    80021c30:	50c080e7          	jalr	1292(ra) # 80022138 <__memset>
    80021c34:	00093703          	ld	a4,0(s2)
    80021c38:	016487b3          	add	a5,s1,s6
    80021c3c:	00e4b023          	sd	a4,0(s1)
    80021c40:	00993023          	sd	s1,0(s2)
    80021c44:	fcfa76e3          	bgeu	s4,a5,80021c10 <freerange+0x70>
    80021c48:	03813083          	ld	ra,56(sp)
    80021c4c:	03013403          	ld	s0,48(sp)
    80021c50:	02813483          	ld	s1,40(sp)
    80021c54:	02013903          	ld	s2,32(sp)
    80021c58:	01813983          	ld	s3,24(sp)
    80021c5c:	01013a03          	ld	s4,16(sp)
    80021c60:	00813a83          	ld	s5,8(sp)
    80021c64:	00013b03          	ld	s6,0(sp)
    80021c68:	04010113          	addi	sp,sp,64
    80021c6c:	00008067          	ret
    80021c70:	00001517          	auipc	a0,0x1
    80021c74:	52050513          	addi	a0,a0,1312 # 80023190 <digits+0x18>
    80021c78:	fffff097          	auipc	ra,0xfffff
    80021c7c:	3d4080e7          	jalr	980(ra) # 8002104c <panic>

0000000080021c80 <kfree>:
    80021c80:	fe010113          	addi	sp,sp,-32
    80021c84:	00813823          	sd	s0,16(sp)
    80021c88:	00113c23          	sd	ra,24(sp)
    80021c8c:	00913423          	sd	s1,8(sp)
    80021c90:	02010413          	addi	s0,sp,32
    80021c94:	03451793          	slli	a5,a0,0x34
    80021c98:	04079c63          	bnez	a5,80021cf0 <kfree+0x70>
    80021c9c:	00003797          	auipc	a5,0x3
    80021ca0:	9d478793          	addi	a5,a5,-1580 # 80024670 <end>
    80021ca4:	00050493          	mv	s1,a0
    80021ca8:	04f56463          	bltu	a0,a5,80021cf0 <kfree+0x70>
    80021cac:	01100793          	li	a5,17
    80021cb0:	01b79793          	slli	a5,a5,0x1b
    80021cb4:	02f57e63          	bgeu	a0,a5,80021cf0 <kfree+0x70>
    80021cb8:	00001637          	lui	a2,0x1
    80021cbc:	00100593          	li	a1,1
    80021cc0:	00000097          	auipc	ra,0x0
    80021cc4:	478080e7          	jalr	1144(ra) # 80022138 <__memset>
    80021cc8:	00001797          	auipc	a5,0x1
    80021ccc:	73878793          	addi	a5,a5,1848 # 80023400 <kmem>
    80021cd0:	0007b703          	ld	a4,0(a5)
    80021cd4:	01813083          	ld	ra,24(sp)
    80021cd8:	01013403          	ld	s0,16(sp)
    80021cdc:	00e4b023          	sd	a4,0(s1)
    80021ce0:	0097b023          	sd	s1,0(a5)
    80021ce4:	00813483          	ld	s1,8(sp)
    80021ce8:	02010113          	addi	sp,sp,32
    80021cec:	00008067          	ret
    80021cf0:	00001517          	auipc	a0,0x1
    80021cf4:	4a050513          	addi	a0,a0,1184 # 80023190 <digits+0x18>
    80021cf8:	fffff097          	auipc	ra,0xfffff
    80021cfc:	354080e7          	jalr	852(ra) # 8002104c <panic>

0000000080021d00 <kalloc>:
    80021d00:	fe010113          	addi	sp,sp,-32
    80021d04:	00813823          	sd	s0,16(sp)
    80021d08:	00913423          	sd	s1,8(sp)
    80021d0c:	00113c23          	sd	ra,24(sp)
    80021d10:	02010413          	addi	s0,sp,32
    80021d14:	00001797          	auipc	a5,0x1
    80021d18:	6ec78793          	addi	a5,a5,1772 # 80023400 <kmem>
    80021d1c:	0007b483          	ld	s1,0(a5)
    80021d20:	02048063          	beqz	s1,80021d40 <kalloc+0x40>
    80021d24:	0004b703          	ld	a4,0(s1)
    80021d28:	00001637          	lui	a2,0x1
    80021d2c:	00500593          	li	a1,5
    80021d30:	00048513          	mv	a0,s1
    80021d34:	00e7b023          	sd	a4,0(a5)
    80021d38:	00000097          	auipc	ra,0x0
    80021d3c:	400080e7          	jalr	1024(ra) # 80022138 <__memset>
    80021d40:	01813083          	ld	ra,24(sp)
    80021d44:	01013403          	ld	s0,16(sp)
    80021d48:	00048513          	mv	a0,s1
    80021d4c:	00813483          	ld	s1,8(sp)
    80021d50:	02010113          	addi	sp,sp,32
    80021d54:	00008067          	ret

0000000080021d58 <initlock>:
    80021d58:	ff010113          	addi	sp,sp,-16
    80021d5c:	00813423          	sd	s0,8(sp)
    80021d60:	01010413          	addi	s0,sp,16
    80021d64:	00813403          	ld	s0,8(sp)
    80021d68:	00b53423          	sd	a1,8(a0)
    80021d6c:	00052023          	sw	zero,0(a0)
    80021d70:	00053823          	sd	zero,16(a0)
    80021d74:	01010113          	addi	sp,sp,16
    80021d78:	00008067          	ret

0000000080021d7c <acquire>:
    80021d7c:	fe010113          	addi	sp,sp,-32
    80021d80:	00813823          	sd	s0,16(sp)
    80021d84:	00913423          	sd	s1,8(sp)
    80021d88:	00113c23          	sd	ra,24(sp)
    80021d8c:	01213023          	sd	s2,0(sp)
    80021d90:	02010413          	addi	s0,sp,32
    80021d94:	00050493          	mv	s1,a0
    80021d98:	10002973          	csrr	s2,sstatus
    80021d9c:	100027f3          	csrr	a5,sstatus
    80021da0:	ffd7f793          	andi	a5,a5,-3
    80021da4:	10079073          	csrw	sstatus,a5
    80021da8:	fffff097          	auipc	ra,0xfffff
    80021dac:	8e8080e7          	jalr	-1816(ra) # 80020690 <mycpu>
    80021db0:	07852783          	lw	a5,120(a0)
    80021db4:	06078e63          	beqz	a5,80021e30 <acquire+0xb4>
    80021db8:	fffff097          	auipc	ra,0xfffff
    80021dbc:	8d8080e7          	jalr	-1832(ra) # 80020690 <mycpu>
    80021dc0:	07852783          	lw	a5,120(a0)
    80021dc4:	0004a703          	lw	a4,0(s1)
    80021dc8:	0017879b          	addiw	a5,a5,1
    80021dcc:	06f52c23          	sw	a5,120(a0)
    80021dd0:	04071063          	bnez	a4,80021e10 <acquire+0x94>
    80021dd4:	00100713          	li	a4,1
    80021dd8:	00070793          	mv	a5,a4
    80021ddc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80021de0:	0007879b          	sext.w	a5,a5
    80021de4:	fe079ae3          	bnez	a5,80021dd8 <acquire+0x5c>
    80021de8:	0ff0000f          	fence
    80021dec:	fffff097          	auipc	ra,0xfffff
    80021df0:	8a4080e7          	jalr	-1884(ra) # 80020690 <mycpu>
    80021df4:	01813083          	ld	ra,24(sp)
    80021df8:	01013403          	ld	s0,16(sp)
    80021dfc:	00a4b823          	sd	a0,16(s1)
    80021e00:	00013903          	ld	s2,0(sp)
    80021e04:	00813483          	ld	s1,8(sp)
    80021e08:	02010113          	addi	sp,sp,32
    80021e0c:	00008067          	ret
    80021e10:	0104b903          	ld	s2,16(s1)
    80021e14:	fffff097          	auipc	ra,0xfffff
    80021e18:	87c080e7          	jalr	-1924(ra) # 80020690 <mycpu>
    80021e1c:	faa91ce3          	bne	s2,a0,80021dd4 <acquire+0x58>
    80021e20:	00001517          	auipc	a0,0x1
    80021e24:	37850513          	addi	a0,a0,888 # 80023198 <digits+0x20>
    80021e28:	fffff097          	auipc	ra,0xfffff
    80021e2c:	224080e7          	jalr	548(ra) # 8002104c <panic>
    80021e30:	00195913          	srli	s2,s2,0x1
    80021e34:	fffff097          	auipc	ra,0xfffff
    80021e38:	85c080e7          	jalr	-1956(ra) # 80020690 <mycpu>
    80021e3c:	00197913          	andi	s2,s2,1
    80021e40:	07252e23          	sw	s2,124(a0)
    80021e44:	f75ff06f          	j	80021db8 <acquire+0x3c>

0000000080021e48 <release>:
    80021e48:	fe010113          	addi	sp,sp,-32
    80021e4c:	00813823          	sd	s0,16(sp)
    80021e50:	00113c23          	sd	ra,24(sp)
    80021e54:	00913423          	sd	s1,8(sp)
    80021e58:	01213023          	sd	s2,0(sp)
    80021e5c:	02010413          	addi	s0,sp,32
    80021e60:	00052783          	lw	a5,0(a0)
    80021e64:	00079a63          	bnez	a5,80021e78 <release+0x30>
    80021e68:	00001517          	auipc	a0,0x1
    80021e6c:	33850513          	addi	a0,a0,824 # 800231a0 <digits+0x28>
    80021e70:	fffff097          	auipc	ra,0xfffff
    80021e74:	1dc080e7          	jalr	476(ra) # 8002104c <panic>
    80021e78:	01053903          	ld	s2,16(a0)
    80021e7c:	00050493          	mv	s1,a0
    80021e80:	fffff097          	auipc	ra,0xfffff
    80021e84:	810080e7          	jalr	-2032(ra) # 80020690 <mycpu>
    80021e88:	fea910e3          	bne	s2,a0,80021e68 <release+0x20>
    80021e8c:	0004b823          	sd	zero,16(s1)
    80021e90:	0ff0000f          	fence
    80021e94:	0f50000f          	fence	iorw,ow
    80021e98:	0804a02f          	amoswap.w	zero,zero,(s1)
    80021e9c:	ffffe097          	auipc	ra,0xffffe
    80021ea0:	7f4080e7          	jalr	2036(ra) # 80020690 <mycpu>
    80021ea4:	100027f3          	csrr	a5,sstatus
    80021ea8:	0027f793          	andi	a5,a5,2
    80021eac:	04079a63          	bnez	a5,80021f00 <release+0xb8>
    80021eb0:	07852783          	lw	a5,120(a0)
    80021eb4:	02f05e63          	blez	a5,80021ef0 <release+0xa8>
    80021eb8:	fff7871b          	addiw	a4,a5,-1
    80021ebc:	06e52c23          	sw	a4,120(a0)
    80021ec0:	00071c63          	bnez	a4,80021ed8 <release+0x90>
    80021ec4:	07c52783          	lw	a5,124(a0)
    80021ec8:	00078863          	beqz	a5,80021ed8 <release+0x90>
    80021ecc:	100027f3          	csrr	a5,sstatus
    80021ed0:	0027e793          	ori	a5,a5,2
    80021ed4:	10079073          	csrw	sstatus,a5
    80021ed8:	01813083          	ld	ra,24(sp)
    80021edc:	01013403          	ld	s0,16(sp)
    80021ee0:	00813483          	ld	s1,8(sp)
    80021ee4:	00013903          	ld	s2,0(sp)
    80021ee8:	02010113          	addi	sp,sp,32
    80021eec:	00008067          	ret
    80021ef0:	00001517          	auipc	a0,0x1
    80021ef4:	2d050513          	addi	a0,a0,720 # 800231c0 <digits+0x48>
    80021ef8:	fffff097          	auipc	ra,0xfffff
    80021efc:	154080e7          	jalr	340(ra) # 8002104c <panic>
    80021f00:	00001517          	auipc	a0,0x1
    80021f04:	2a850513          	addi	a0,a0,680 # 800231a8 <digits+0x30>
    80021f08:	fffff097          	auipc	ra,0xfffff
    80021f0c:	144080e7          	jalr	324(ra) # 8002104c <panic>

0000000080021f10 <holding>:
    80021f10:	00052783          	lw	a5,0(a0)
    80021f14:	00079663          	bnez	a5,80021f20 <holding+0x10>
    80021f18:	00000513          	li	a0,0
    80021f1c:	00008067          	ret
    80021f20:	fe010113          	addi	sp,sp,-32
    80021f24:	00813823          	sd	s0,16(sp)
    80021f28:	00913423          	sd	s1,8(sp)
    80021f2c:	00113c23          	sd	ra,24(sp)
    80021f30:	02010413          	addi	s0,sp,32
    80021f34:	01053483          	ld	s1,16(a0)
    80021f38:	ffffe097          	auipc	ra,0xffffe
    80021f3c:	758080e7          	jalr	1880(ra) # 80020690 <mycpu>
    80021f40:	01813083          	ld	ra,24(sp)
    80021f44:	01013403          	ld	s0,16(sp)
    80021f48:	40a48533          	sub	a0,s1,a0
    80021f4c:	00153513          	seqz	a0,a0
    80021f50:	00813483          	ld	s1,8(sp)
    80021f54:	02010113          	addi	sp,sp,32
    80021f58:	00008067          	ret

0000000080021f5c <push_off>:
    80021f5c:	fe010113          	addi	sp,sp,-32
    80021f60:	00813823          	sd	s0,16(sp)
    80021f64:	00113c23          	sd	ra,24(sp)
    80021f68:	00913423          	sd	s1,8(sp)
    80021f6c:	02010413          	addi	s0,sp,32
    80021f70:	100024f3          	csrr	s1,sstatus
    80021f74:	100027f3          	csrr	a5,sstatus
    80021f78:	ffd7f793          	andi	a5,a5,-3
    80021f7c:	10079073          	csrw	sstatus,a5
    80021f80:	ffffe097          	auipc	ra,0xffffe
    80021f84:	710080e7          	jalr	1808(ra) # 80020690 <mycpu>
    80021f88:	07852783          	lw	a5,120(a0)
    80021f8c:	02078663          	beqz	a5,80021fb8 <push_off+0x5c>
    80021f90:	ffffe097          	auipc	ra,0xffffe
    80021f94:	700080e7          	jalr	1792(ra) # 80020690 <mycpu>
    80021f98:	07852783          	lw	a5,120(a0)
    80021f9c:	01813083          	ld	ra,24(sp)
    80021fa0:	01013403          	ld	s0,16(sp)
    80021fa4:	0017879b          	addiw	a5,a5,1
    80021fa8:	06f52c23          	sw	a5,120(a0)
    80021fac:	00813483          	ld	s1,8(sp)
    80021fb0:	02010113          	addi	sp,sp,32
    80021fb4:	00008067          	ret
    80021fb8:	0014d493          	srli	s1,s1,0x1
    80021fbc:	ffffe097          	auipc	ra,0xffffe
    80021fc0:	6d4080e7          	jalr	1748(ra) # 80020690 <mycpu>
    80021fc4:	0014f493          	andi	s1,s1,1
    80021fc8:	06952e23          	sw	s1,124(a0)
    80021fcc:	fc5ff06f          	j	80021f90 <push_off+0x34>

0000000080021fd0 <pop_off>:
    80021fd0:	ff010113          	addi	sp,sp,-16
    80021fd4:	00813023          	sd	s0,0(sp)
    80021fd8:	00113423          	sd	ra,8(sp)
    80021fdc:	01010413          	addi	s0,sp,16
    80021fe0:	ffffe097          	auipc	ra,0xffffe
    80021fe4:	6b0080e7          	jalr	1712(ra) # 80020690 <mycpu>
    80021fe8:	100027f3          	csrr	a5,sstatus
    80021fec:	0027f793          	andi	a5,a5,2
    80021ff0:	04079663          	bnez	a5,8002203c <pop_off+0x6c>
    80021ff4:	07852783          	lw	a5,120(a0)
    80021ff8:	02f05a63          	blez	a5,8002202c <pop_off+0x5c>
    80021ffc:	fff7871b          	addiw	a4,a5,-1
    80022000:	06e52c23          	sw	a4,120(a0)
    80022004:	00071c63          	bnez	a4,8002201c <pop_off+0x4c>
    80022008:	07c52783          	lw	a5,124(a0)
    8002200c:	00078863          	beqz	a5,8002201c <pop_off+0x4c>
    80022010:	100027f3          	csrr	a5,sstatus
    80022014:	0027e793          	ori	a5,a5,2
    80022018:	10079073          	csrw	sstatus,a5
    8002201c:	00813083          	ld	ra,8(sp)
    80022020:	00013403          	ld	s0,0(sp)
    80022024:	01010113          	addi	sp,sp,16
    80022028:	00008067          	ret
    8002202c:	00001517          	auipc	a0,0x1
    80022030:	19450513          	addi	a0,a0,404 # 800231c0 <digits+0x48>
    80022034:	fffff097          	auipc	ra,0xfffff
    80022038:	018080e7          	jalr	24(ra) # 8002104c <panic>
    8002203c:	00001517          	auipc	a0,0x1
    80022040:	16c50513          	addi	a0,a0,364 # 800231a8 <digits+0x30>
    80022044:	fffff097          	auipc	ra,0xfffff
    80022048:	008080e7          	jalr	8(ra) # 8002104c <panic>

000000008002204c <push_on>:
    8002204c:	fe010113          	addi	sp,sp,-32
    80022050:	00813823          	sd	s0,16(sp)
    80022054:	00113c23          	sd	ra,24(sp)
    80022058:	00913423          	sd	s1,8(sp)
    8002205c:	02010413          	addi	s0,sp,32
    80022060:	100024f3          	csrr	s1,sstatus
    80022064:	100027f3          	csrr	a5,sstatus
    80022068:	0027e793          	ori	a5,a5,2
    8002206c:	10079073          	csrw	sstatus,a5
    80022070:	ffffe097          	auipc	ra,0xffffe
    80022074:	620080e7          	jalr	1568(ra) # 80020690 <mycpu>
    80022078:	07852783          	lw	a5,120(a0)
    8002207c:	02078663          	beqz	a5,800220a8 <push_on+0x5c>
    80022080:	ffffe097          	auipc	ra,0xffffe
    80022084:	610080e7          	jalr	1552(ra) # 80020690 <mycpu>
    80022088:	07852783          	lw	a5,120(a0)
    8002208c:	01813083          	ld	ra,24(sp)
    80022090:	01013403          	ld	s0,16(sp)
    80022094:	0017879b          	addiw	a5,a5,1
    80022098:	06f52c23          	sw	a5,120(a0)
    8002209c:	00813483          	ld	s1,8(sp)
    800220a0:	02010113          	addi	sp,sp,32
    800220a4:	00008067          	ret
    800220a8:	0014d493          	srli	s1,s1,0x1
    800220ac:	ffffe097          	auipc	ra,0xffffe
    800220b0:	5e4080e7          	jalr	1508(ra) # 80020690 <mycpu>
    800220b4:	0014f493          	andi	s1,s1,1
    800220b8:	06952e23          	sw	s1,124(a0)
    800220bc:	fc5ff06f          	j	80022080 <push_on+0x34>

00000000800220c0 <pop_on>:
    800220c0:	ff010113          	addi	sp,sp,-16
    800220c4:	00813023          	sd	s0,0(sp)
    800220c8:	00113423          	sd	ra,8(sp)
    800220cc:	01010413          	addi	s0,sp,16
    800220d0:	ffffe097          	auipc	ra,0xffffe
    800220d4:	5c0080e7          	jalr	1472(ra) # 80020690 <mycpu>
    800220d8:	100027f3          	csrr	a5,sstatus
    800220dc:	0027f793          	andi	a5,a5,2
    800220e0:	04078463          	beqz	a5,80022128 <pop_on+0x68>
    800220e4:	07852783          	lw	a5,120(a0)
    800220e8:	02f05863          	blez	a5,80022118 <pop_on+0x58>
    800220ec:	fff7879b          	addiw	a5,a5,-1
    800220f0:	06f52c23          	sw	a5,120(a0)
    800220f4:	07853783          	ld	a5,120(a0)
    800220f8:	00079863          	bnez	a5,80022108 <pop_on+0x48>
    800220fc:	100027f3          	csrr	a5,sstatus
    80022100:	ffd7f793          	andi	a5,a5,-3
    80022104:	10079073          	csrw	sstatus,a5
    80022108:	00813083          	ld	ra,8(sp)
    8002210c:	00013403          	ld	s0,0(sp)
    80022110:	01010113          	addi	sp,sp,16
    80022114:	00008067          	ret
    80022118:	00001517          	auipc	a0,0x1
    8002211c:	0d050513          	addi	a0,a0,208 # 800231e8 <digits+0x70>
    80022120:	fffff097          	auipc	ra,0xfffff
    80022124:	f2c080e7          	jalr	-212(ra) # 8002104c <panic>
    80022128:	00001517          	auipc	a0,0x1
    8002212c:	0a050513          	addi	a0,a0,160 # 800231c8 <digits+0x50>
    80022130:	fffff097          	auipc	ra,0xfffff
    80022134:	f1c080e7          	jalr	-228(ra) # 8002104c <panic>

0000000080022138 <__memset>:
    80022138:	ff010113          	addi	sp,sp,-16
    8002213c:	00813423          	sd	s0,8(sp)
    80022140:	01010413          	addi	s0,sp,16
    80022144:	1a060e63          	beqz	a2,80022300 <__memset+0x1c8>
    80022148:	40a007b3          	neg	a5,a0
    8002214c:	0077f793          	andi	a5,a5,7
    80022150:	00778693          	addi	a3,a5,7
    80022154:	00b00813          	li	a6,11
    80022158:	0ff5f593          	andi	a1,a1,255
    8002215c:	fff6071b          	addiw	a4,a2,-1
    80022160:	1b06e663          	bltu	a3,a6,8002230c <__memset+0x1d4>
    80022164:	1cd76463          	bltu	a4,a3,8002232c <__memset+0x1f4>
    80022168:	1a078e63          	beqz	a5,80022324 <__memset+0x1ec>
    8002216c:	00b50023          	sb	a1,0(a0)
    80022170:	00100713          	li	a4,1
    80022174:	1ae78463          	beq	a5,a4,8002231c <__memset+0x1e4>
    80022178:	00b500a3          	sb	a1,1(a0)
    8002217c:	00200713          	li	a4,2
    80022180:	1ae78a63          	beq	a5,a4,80022334 <__memset+0x1fc>
    80022184:	00b50123          	sb	a1,2(a0)
    80022188:	00300713          	li	a4,3
    8002218c:	18e78463          	beq	a5,a4,80022314 <__memset+0x1dc>
    80022190:	00b501a3          	sb	a1,3(a0)
    80022194:	00400713          	li	a4,4
    80022198:	1ae78263          	beq	a5,a4,8002233c <__memset+0x204>
    8002219c:	00b50223          	sb	a1,4(a0)
    800221a0:	00500713          	li	a4,5
    800221a4:	1ae78063          	beq	a5,a4,80022344 <__memset+0x20c>
    800221a8:	00b502a3          	sb	a1,5(a0)
    800221ac:	00700713          	li	a4,7
    800221b0:	18e79e63          	bne	a5,a4,8002234c <__memset+0x214>
    800221b4:	00b50323          	sb	a1,6(a0)
    800221b8:	00700e93          	li	t4,7
    800221bc:	00859713          	slli	a4,a1,0x8
    800221c0:	00e5e733          	or	a4,a1,a4
    800221c4:	01059e13          	slli	t3,a1,0x10
    800221c8:	01c76e33          	or	t3,a4,t3
    800221cc:	01859313          	slli	t1,a1,0x18
    800221d0:	006e6333          	or	t1,t3,t1
    800221d4:	02059893          	slli	a7,a1,0x20
    800221d8:	40f60e3b          	subw	t3,a2,a5
    800221dc:	011368b3          	or	a7,t1,a7
    800221e0:	02859813          	slli	a6,a1,0x28
    800221e4:	0108e833          	or	a6,a7,a6
    800221e8:	03059693          	slli	a3,a1,0x30
    800221ec:	003e589b          	srliw	a7,t3,0x3
    800221f0:	00d866b3          	or	a3,a6,a3
    800221f4:	03859713          	slli	a4,a1,0x38
    800221f8:	00389813          	slli	a6,a7,0x3
    800221fc:	00f507b3          	add	a5,a0,a5
    80022200:	00e6e733          	or	a4,a3,a4
    80022204:	000e089b          	sext.w	a7,t3
    80022208:	00f806b3          	add	a3,a6,a5
    8002220c:	00e7b023          	sd	a4,0(a5)
    80022210:	00878793          	addi	a5,a5,8
    80022214:	fed79ce3          	bne	a5,a3,8002220c <__memset+0xd4>
    80022218:	ff8e7793          	andi	a5,t3,-8
    8002221c:	0007871b          	sext.w	a4,a5
    80022220:	01d787bb          	addw	a5,a5,t4
    80022224:	0ce88e63          	beq	a7,a4,80022300 <__memset+0x1c8>
    80022228:	00f50733          	add	a4,a0,a5
    8002222c:	00b70023          	sb	a1,0(a4)
    80022230:	0017871b          	addiw	a4,a5,1
    80022234:	0cc77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022238:	00e50733          	add	a4,a0,a4
    8002223c:	00b70023          	sb	a1,0(a4)
    80022240:	0027871b          	addiw	a4,a5,2
    80022244:	0ac77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022248:	00e50733          	add	a4,a0,a4
    8002224c:	00b70023          	sb	a1,0(a4)
    80022250:	0037871b          	addiw	a4,a5,3
    80022254:	0ac77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022258:	00e50733          	add	a4,a0,a4
    8002225c:	00b70023          	sb	a1,0(a4)
    80022260:	0047871b          	addiw	a4,a5,4
    80022264:	08c77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022268:	00e50733          	add	a4,a0,a4
    8002226c:	00b70023          	sb	a1,0(a4)
    80022270:	0057871b          	addiw	a4,a5,5
    80022274:	08c77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022278:	00e50733          	add	a4,a0,a4
    8002227c:	00b70023          	sb	a1,0(a4)
    80022280:	0067871b          	addiw	a4,a5,6
    80022284:	06c77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022288:	00e50733          	add	a4,a0,a4
    8002228c:	00b70023          	sb	a1,0(a4)
    80022290:	0077871b          	addiw	a4,a5,7
    80022294:	06c77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    80022298:	00e50733          	add	a4,a0,a4
    8002229c:	00b70023          	sb	a1,0(a4)
    800222a0:	0087871b          	addiw	a4,a5,8
    800222a4:	04c77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    800222a8:	00e50733          	add	a4,a0,a4
    800222ac:	00b70023          	sb	a1,0(a4)
    800222b0:	0097871b          	addiw	a4,a5,9
    800222b4:	04c77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    800222b8:	00e50733          	add	a4,a0,a4
    800222bc:	00b70023          	sb	a1,0(a4)
    800222c0:	00a7871b          	addiw	a4,a5,10
    800222c4:	02c77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    800222c8:	00e50733          	add	a4,a0,a4
    800222cc:	00b70023          	sb	a1,0(a4)
    800222d0:	00b7871b          	addiw	a4,a5,11
    800222d4:	02c77663          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    800222d8:	00e50733          	add	a4,a0,a4
    800222dc:	00b70023          	sb	a1,0(a4)
    800222e0:	00c7871b          	addiw	a4,a5,12
    800222e4:	00c77e63          	bgeu	a4,a2,80022300 <__memset+0x1c8>
    800222e8:	00e50733          	add	a4,a0,a4
    800222ec:	00b70023          	sb	a1,0(a4)
    800222f0:	00d7879b          	addiw	a5,a5,13
    800222f4:	00c7f663          	bgeu	a5,a2,80022300 <__memset+0x1c8>
    800222f8:	00f507b3          	add	a5,a0,a5
    800222fc:	00b78023          	sb	a1,0(a5)
    80022300:	00813403          	ld	s0,8(sp)
    80022304:	01010113          	addi	sp,sp,16
    80022308:	00008067          	ret
    8002230c:	00b00693          	li	a3,11
    80022310:	e55ff06f          	j	80022164 <__memset+0x2c>
    80022314:	00300e93          	li	t4,3
    80022318:	ea5ff06f          	j	800221bc <__memset+0x84>
    8002231c:	00100e93          	li	t4,1
    80022320:	e9dff06f          	j	800221bc <__memset+0x84>
    80022324:	00000e93          	li	t4,0
    80022328:	e95ff06f          	j	800221bc <__memset+0x84>
    8002232c:	00000793          	li	a5,0
    80022330:	ef9ff06f          	j	80022228 <__memset+0xf0>
    80022334:	00200e93          	li	t4,2
    80022338:	e85ff06f          	j	800221bc <__memset+0x84>
    8002233c:	00400e93          	li	t4,4
    80022340:	e7dff06f          	j	800221bc <__memset+0x84>
    80022344:	00500e93          	li	t4,5
    80022348:	e75ff06f          	j	800221bc <__memset+0x84>
    8002234c:	00600e93          	li	t4,6
    80022350:	e6dff06f          	j	800221bc <__memset+0x84>

0000000080022354 <__memmove>:
    80022354:	ff010113          	addi	sp,sp,-16
    80022358:	00813423          	sd	s0,8(sp)
    8002235c:	01010413          	addi	s0,sp,16
    80022360:	0e060863          	beqz	a2,80022450 <__memmove+0xfc>
    80022364:	fff6069b          	addiw	a3,a2,-1
    80022368:	0006881b          	sext.w	a6,a3
    8002236c:	0ea5e863          	bltu	a1,a0,8002245c <__memmove+0x108>
    80022370:	00758713          	addi	a4,a1,7
    80022374:	00a5e7b3          	or	a5,a1,a0
    80022378:	40a70733          	sub	a4,a4,a0
    8002237c:	0077f793          	andi	a5,a5,7
    80022380:	00f73713          	sltiu	a4,a4,15
    80022384:	00174713          	xori	a4,a4,1
    80022388:	0017b793          	seqz	a5,a5
    8002238c:	00e7f7b3          	and	a5,a5,a4
    80022390:	10078863          	beqz	a5,800224a0 <__memmove+0x14c>
    80022394:	00900793          	li	a5,9
    80022398:	1107f463          	bgeu	a5,a6,800224a0 <__memmove+0x14c>
    8002239c:	0036581b          	srliw	a6,a2,0x3
    800223a0:	fff8081b          	addiw	a6,a6,-1
    800223a4:	02081813          	slli	a6,a6,0x20
    800223a8:	01d85893          	srli	a7,a6,0x1d
    800223ac:	00858813          	addi	a6,a1,8
    800223b0:	00058793          	mv	a5,a1
    800223b4:	00050713          	mv	a4,a0
    800223b8:	01088833          	add	a6,a7,a6
    800223bc:	0007b883          	ld	a7,0(a5)
    800223c0:	00878793          	addi	a5,a5,8
    800223c4:	00870713          	addi	a4,a4,8
    800223c8:	ff173c23          	sd	a7,-8(a4)
    800223cc:	ff0798e3          	bne	a5,a6,800223bc <__memmove+0x68>
    800223d0:	ff867713          	andi	a4,a2,-8
    800223d4:	02071793          	slli	a5,a4,0x20
    800223d8:	0207d793          	srli	a5,a5,0x20
    800223dc:	00f585b3          	add	a1,a1,a5
    800223e0:	40e686bb          	subw	a3,a3,a4
    800223e4:	00f507b3          	add	a5,a0,a5
    800223e8:	06e60463          	beq	a2,a4,80022450 <__memmove+0xfc>
    800223ec:	0005c703          	lbu	a4,0(a1)
    800223f0:	00e78023          	sb	a4,0(a5)
    800223f4:	04068e63          	beqz	a3,80022450 <__memmove+0xfc>
    800223f8:	0015c603          	lbu	a2,1(a1)
    800223fc:	00100713          	li	a4,1
    80022400:	00c780a3          	sb	a2,1(a5)
    80022404:	04e68663          	beq	a3,a4,80022450 <__memmove+0xfc>
    80022408:	0025c603          	lbu	a2,2(a1)
    8002240c:	00200713          	li	a4,2
    80022410:	00c78123          	sb	a2,2(a5)
    80022414:	02e68e63          	beq	a3,a4,80022450 <__memmove+0xfc>
    80022418:	0035c603          	lbu	a2,3(a1)
    8002241c:	00300713          	li	a4,3
    80022420:	00c781a3          	sb	a2,3(a5)
    80022424:	02e68663          	beq	a3,a4,80022450 <__memmove+0xfc>
    80022428:	0045c603          	lbu	a2,4(a1)
    8002242c:	00400713          	li	a4,4
    80022430:	00c78223          	sb	a2,4(a5)
    80022434:	00e68e63          	beq	a3,a4,80022450 <__memmove+0xfc>
    80022438:	0055c603          	lbu	a2,5(a1)
    8002243c:	00500713          	li	a4,5
    80022440:	00c782a3          	sb	a2,5(a5)
    80022444:	00e68663          	beq	a3,a4,80022450 <__memmove+0xfc>
    80022448:	0065c703          	lbu	a4,6(a1)
    8002244c:	00e78323          	sb	a4,6(a5)
    80022450:	00813403          	ld	s0,8(sp)
    80022454:	01010113          	addi	sp,sp,16
    80022458:	00008067          	ret
    8002245c:	02061713          	slli	a4,a2,0x20
    80022460:	02075713          	srli	a4,a4,0x20
    80022464:	00e587b3          	add	a5,a1,a4
    80022468:	f0f574e3          	bgeu	a0,a5,80022370 <__memmove+0x1c>
    8002246c:	02069613          	slli	a2,a3,0x20
    80022470:	02065613          	srli	a2,a2,0x20
    80022474:	fff64613          	not	a2,a2
    80022478:	00e50733          	add	a4,a0,a4
    8002247c:	00c78633          	add	a2,a5,a2
    80022480:	fff7c683          	lbu	a3,-1(a5)
    80022484:	fff78793          	addi	a5,a5,-1
    80022488:	fff70713          	addi	a4,a4,-1
    8002248c:	00d70023          	sb	a3,0(a4)
    80022490:	fec798e3          	bne	a5,a2,80022480 <__memmove+0x12c>
    80022494:	00813403          	ld	s0,8(sp)
    80022498:	01010113          	addi	sp,sp,16
    8002249c:	00008067          	ret
    800224a0:	02069713          	slli	a4,a3,0x20
    800224a4:	02075713          	srli	a4,a4,0x20
    800224a8:	00170713          	addi	a4,a4,1
    800224ac:	00e50733          	add	a4,a0,a4
    800224b0:	00050793          	mv	a5,a0
    800224b4:	0005c683          	lbu	a3,0(a1)
    800224b8:	00178793          	addi	a5,a5,1
    800224bc:	00158593          	addi	a1,a1,1
    800224c0:	fed78fa3          	sb	a3,-1(a5)
    800224c4:	fee798e3          	bne	a5,a4,800224b4 <__memmove+0x160>
    800224c8:	f89ff06f          	j	80022450 <__memmove+0xfc>

00000000800224cc <__putc>:
    800224cc:	fe010113          	addi	sp,sp,-32
    800224d0:	00813823          	sd	s0,16(sp)
    800224d4:	00113c23          	sd	ra,24(sp)
    800224d8:	02010413          	addi	s0,sp,32
    800224dc:	00050793          	mv	a5,a0
    800224e0:	fef40593          	addi	a1,s0,-17
    800224e4:	00100613          	li	a2,1
    800224e8:	00000513          	li	a0,0
    800224ec:	fef407a3          	sb	a5,-17(s0)
    800224f0:	fffff097          	auipc	ra,0xfffff
    800224f4:	b3c080e7          	jalr	-1220(ra) # 8002102c <console_write>
    800224f8:	01813083          	ld	ra,24(sp)
    800224fc:	01013403          	ld	s0,16(sp)
    80022500:	02010113          	addi	sp,sp,32
    80022504:	00008067          	ret

0000000080022508 <__getc>:
    80022508:	fe010113          	addi	sp,sp,-32
    8002250c:	00813823          	sd	s0,16(sp)
    80022510:	00113c23          	sd	ra,24(sp)
    80022514:	02010413          	addi	s0,sp,32
    80022518:	fe840593          	addi	a1,s0,-24
    8002251c:	00100613          	li	a2,1
    80022520:	00000513          	li	a0,0
    80022524:	fffff097          	auipc	ra,0xfffff
    80022528:	ae8080e7          	jalr	-1304(ra) # 8002100c <console_read>
    8002252c:	fe844503          	lbu	a0,-24(s0)
    80022530:	01813083          	ld	ra,24(sp)
    80022534:	01013403          	ld	s0,16(sp)
    80022538:	02010113          	addi	sp,sp,32
    8002253c:	00008067          	ret

0000000080022540 <console_handler>:
    80022540:	fe010113          	addi	sp,sp,-32
    80022544:	00813823          	sd	s0,16(sp)
    80022548:	00113c23          	sd	ra,24(sp)
    8002254c:	00913423          	sd	s1,8(sp)
    80022550:	02010413          	addi	s0,sp,32
    80022554:	14202773          	csrr	a4,scause
    80022558:	100027f3          	csrr	a5,sstatus
    8002255c:	0027f793          	andi	a5,a5,2
    80022560:	06079e63          	bnez	a5,800225dc <console_handler+0x9c>
    80022564:	00074c63          	bltz	a4,8002257c <console_handler+0x3c>
    80022568:	01813083          	ld	ra,24(sp)
    8002256c:	01013403          	ld	s0,16(sp)
    80022570:	00813483          	ld	s1,8(sp)
    80022574:	02010113          	addi	sp,sp,32
    80022578:	00008067          	ret
    8002257c:	0ff77713          	andi	a4,a4,255
    80022580:	00900793          	li	a5,9
    80022584:	fef712e3          	bne	a4,a5,80022568 <console_handler+0x28>
    80022588:	ffffe097          	auipc	ra,0xffffe
    8002258c:	6dc080e7          	jalr	1756(ra) # 80020c64 <plic_claim>
    80022590:	00a00793          	li	a5,10
    80022594:	00050493          	mv	s1,a0
    80022598:	02f50c63          	beq	a0,a5,800225d0 <console_handler+0x90>
    8002259c:	fc0506e3          	beqz	a0,80022568 <console_handler+0x28>
    800225a0:	00050593          	mv	a1,a0
    800225a4:	00001517          	auipc	a0,0x1
    800225a8:	b4c50513          	addi	a0,a0,-1204 # 800230f0 <CONSOLE_STATUS+0xe0>
    800225ac:	fffff097          	auipc	ra,0xfffff
    800225b0:	afc080e7          	jalr	-1284(ra) # 800210a8 <__printf>
    800225b4:	01013403          	ld	s0,16(sp)
    800225b8:	01813083          	ld	ra,24(sp)
    800225bc:	00048513          	mv	a0,s1
    800225c0:	00813483          	ld	s1,8(sp)
    800225c4:	02010113          	addi	sp,sp,32
    800225c8:	ffffe317          	auipc	t1,0xffffe
    800225cc:	6d430067          	jr	1748(t1) # 80020c9c <plic_complete>
    800225d0:	fffff097          	auipc	ra,0xfffff
    800225d4:	3e0080e7          	jalr	992(ra) # 800219b0 <uartintr>
    800225d8:	fddff06f          	j	800225b4 <console_handler+0x74>
    800225dc:	00001517          	auipc	a0,0x1
    800225e0:	c1450513          	addi	a0,a0,-1004 # 800231f0 <digits+0x78>
    800225e4:	fffff097          	auipc	ra,0xfffff
    800225e8:	a68080e7          	jalr	-1432(ra) # 8002104c <panic>
	...
