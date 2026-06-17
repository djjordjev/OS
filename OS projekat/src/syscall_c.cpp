#include "../h/syscall_c.hpp"
#include "../lib/console.h"

void* mem_alloc(size_t sizeInBytes){
    size_t sizeInBlocks = (sizeInBytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    void* result;

    asm volatile(
    "li a0, 1\n"
    "mv a1, %1\n"
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(result)
    : "r"(sizeInBlocks)
    : "a0", "a1"
    );

    return result;
}

int mem_free(void* at){
    int status;

    asm volatile(
    "li a0, 2\n"
    "mv a1, %1\n"
    "ecall\n"
    "mv %0, a0\n"
    : "=r"(status)
    : "r"(at)
    : "a0", "a1"
    );
    
    return status;
}