    #ifndef MEMORYALLOCATOR_HPP
    #define MEMORYALLOCATOR_HPP

    #include "../lib/hw.h"

    class MemoryAllocator{
    public:
        static void initialize();

        static void* malloc(size_t sizeInBlocks);
        static int dealloc(void* at);

    private:
        MemoryAllocator() = delete;

        struct MemBlock{
            size_t sizeInBlocks;
            MemBlock* next;
        };

        static void merge(MemBlock* low, MemBlock* high);
        static const size_t HEADER_SIZE = 1;
        static MemBlock* free_mem_head;
    };

    #endif