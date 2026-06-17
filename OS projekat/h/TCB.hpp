#ifndef TCB_HPP
#define TCB_HPP

#include "../h/MemoryAllocator.hpp"

enum Status{
    READY,
    FINISHED,
    BLOCKED,
    SLEEPING
};

class TCB{
public:

    friend class Scheduler;
    static TCB* createThread(void(*startRoutine)(void*), void* arg);

    static TCB* running;

private:

    void* sp; // offset: 0
    void* stackSpace;

    TCB* next;

    void(*startRoutine)(void*);
    void* arg;

    Status status;
};

#endif