#ifndef SYSCALL_C_H
#define SYSCALL_C_H

#include "../lib/hw.h"

void* mem_alloc(size_t sizeInBytes);
int mem_free(void* at);

#endif