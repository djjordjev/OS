#include "../lib/hw.h"
#include "../lib/console.h"

#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_cpp.hpp"

extern "C" void trap();
extern "C" uint64 TrapHandler(uint64* savedRegisters);

int main(){
    asm volatile("csrw stvec, %0" : : "r"(trap));
    MemoryAllocator::initialize();

    //if(q->get() != ii) {__putc('N');__putc('E');} __putc('U');__putc('S');__putc('P');__putc('E');__putc('H');

    return 0;
}