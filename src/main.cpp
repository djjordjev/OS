#include "../lib/hw.h"
#include "../lib/console.h"

#include "../h/MemoryAllocator.h"
#include "../h/syscall.h"

extern "C" void trap();
extern "C" uint64 TrapHandler(uint64* savedRegisters);

int main(){
    MemoryAllocator::initialize();
    asm volatile("csrw stvec, %0" : : "r"(trap));

    void* addr = mem_alloc(50);
    int status = mem_free(addr);

    if(status) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');

    return 0;
    
    
}