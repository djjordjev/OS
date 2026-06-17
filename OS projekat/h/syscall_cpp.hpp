#ifndef SYSCALL_CPP_HPP
#define SYSCALL_CPP_HPP

#include "syscall_c.hpp"

void* operator new(size_t size);
void operator delete(void* at);

#endif