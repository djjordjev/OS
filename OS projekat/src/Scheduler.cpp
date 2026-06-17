#include "../h/Scheduler.hpp"

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;

TCB* Scheduler::get(){
    if(!head) return nullptr;
    TCB* tcb = head;
    head = head->next;
    if(!head) tail = nullptr;
    return tcb;
}

void Scheduler::put(TCB* tcb){
    if(!tcb) return;
    tcb->next = nullptr; // resetuje se next za slucaj da TCB dolazi iz recimo liste blokiranih (i imao je next tamo)
    if(tail) tail->next = tcb;
    else head = tcb;
    tail = tcb;
}