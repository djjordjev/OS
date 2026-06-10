#include "../lib/hw.h"
#include "../h/MemoryAllocator.h"

extern "C" uint64 TrapHandler(uint64* savedRegisters){

    uint64 scause;
    asm volatile("csrr %0, scause" : "=r"(scause));

    uint64 sysCallCode = savedRegisters[13];

    if(scause == 0x8 || scause == 0x9){

        if(sysCallCode == 0x1){

            uint64 sizeInBlocks = savedRegisters[14];
            void* addr = MemoryAllocator::malloc(sizeInBlocks);
            return (uint64)addr;
            //...
        }

        if(sysCallCode == 0x2){

            void* at = (void*)savedRegisters[14];
            int status = MemoryAllocator::dealloc(at);
            return (uint64)status;
            //...
        }

    }

    return -1;

}