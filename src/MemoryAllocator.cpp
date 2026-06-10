#include "../h/MemoryAllocator.h"

MemoryAllocator::MemBlock* MemoryAllocator::free_mem_head = nullptr;

void MemoryAllocator::initialize(){
    free_mem_head = (MemBlock*)HEAP_START_ADDR;
    free_mem_head->sizeInBlocks = ((uint64)HEAP_END_ADDR - (uint64)HEAP_START_ADDR) / MEM_BLOCK_SIZE;
    free_mem_head->next = nullptr;
}

void* MemoryAllocator::malloc(size_t sizeInBlocks){
    // sizeInBlocks - velicina prostora u blokovima
    if(sizeInBlocks == 0 || sizeInBlocks*MEM_BLOCK_SIZE > ((uint64)HEAP_END_ADDR - 
                        (uint64)HEAP_START_ADDR)) 
    return nullptr;

    MemBlock* block = free_mem_head;
    MemBlock* prev = nullptr;
    
    for(; block != nullptr; block = block->next){
        if(block->sizeInBlocks >= (sizeInBlocks + HEADER_SIZE)) break; // alocira se dodatni pred-blok u kome se nalazi informacija o velicini alociranog dela memorije
        prev = block;
    }

    if(block == nullptr) return nullptr;

    size_t remaining_size = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
    if(remaining_size > HEADER_SIZE) {
        MemBlock* new_free = (MemBlock*)((char*)block + MEM_BLOCK_SIZE*(sizeInBlocks + HEADER_SIZE));
        new_free->sizeInBlocks = block->sizeInBlocks - (sizeInBlocks + HEADER_SIZE);
        new_free->next = block->next;
        if(prev) prev->next = new_free;
        else free_mem_head = new_free;
    }
    else {
        if(remaining_size == HEADER_SIZE) sizeInBlocks += HEADER_SIZE;
        if(prev) prev->next = block->next;
        else free_mem_head = block->next;
    }

    // zadrzava se MemBlock header
    // on se nalazi u bloku ispod novoalociranje memorije
    // ovo se koristi pri dealokaciji
    block->sizeInBlocks = sizeInBlocks + HEADER_SIZE;
    block->next = nullptr;
    return (void*)((char*)block + MEM_BLOCK_SIZE);
}

void MemoryAllocator::merge(MemBlock* low, MemBlock* high){
    low->sizeInBlocks += high->sizeInBlocks;
    low->next = high->next;
}

int MemoryAllocator::dealloc(void* at){
    if(!at) return -1;
    if((char*)at < (char*)HEAP_START_ADDR + MEM_BLOCK_SIZE || (char*)at >= HEAP_END_ADDR) return -2;

    // MemBlock struktura koja sadrzi velicinu segmenta za brisanje
    MemBlock* new_free_mem_block = (MemBlock*)((char*)at - MEM_BLOCK_SIZE);
    
    MemBlock* next = free_mem_head;
    MemBlock* prev = nullptr;
    for(; next; next = next->next){
        if((void*)next > (void*)new_free_mem_block) break;
        prev = next;
    }

    if(!prev){
        free_mem_head = new_free_mem_block;
        new_free_mem_block->next = next;
    }
    else{
        new_free_mem_block->next = prev->next;
        prev->next = new_free_mem_block;
    } 

    // potrebno je spojiti oslobodnjene delove memorije sa susednim, ako takvih ima
    if(next && (char*)new_free_mem_block + new_free_mem_block->sizeInBlocks*MEM_BLOCK_SIZE == (char*)next)
        merge(new_free_mem_block, next);
    if(prev && (char*)prev + prev->sizeInBlocks*MEM_BLOCK_SIZE == (char*)new_free_mem_block)
        merge(prev, new_free_mem_block);

    return 0;
}