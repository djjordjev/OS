#ifndef SCHEDULER_HPP
#define SCHEDULER_HPP

#include "../h/TCB.hpp"

class Scheduler{
public:
    Scheduler() = delete;
    
    static TCB* get();
    static void put(TCB* tcb);
private:
    static TCB* head;
    static TCB* tail;
};

#endif