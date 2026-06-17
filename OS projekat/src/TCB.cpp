#include "../h/TCB.hpp"

TCB* TCB::running = nullptr;

TCB* TCB::createThread(void(*startRoutine)(void*), void* arg){
    // size_t sizeInBlocks = (sizeof(TCB) + MEM_BLOCK_SIZE - 1)/MEM_BLOCK_SIZE;
    // TCB* newTCB = (TCB*)MemoryAllocator::malloc(sizeInBlocks);

    // newTCB->next = nullptr; 

    // newTCB->startRoutine = startRoutine;
    // newTCB->arg = arg;
}