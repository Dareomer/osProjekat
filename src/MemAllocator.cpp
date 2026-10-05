//
// Created by os on 4/29/26.
//
#include "../h/MemAllocator.h"


FreeMem* MemAllocator::freeMemHead = nullptr;
bool MemAllocator::initialized = false;


void MemAllocator::init()   //cela funkcija sluzi samo da pri prvom alociranju setujem ovaj fleg initialized
{                           //da bi izbegao da cekujem dal je freememHead ==nullptr jer to moze da se desi kad je
    if (initialized) return;        // i prazan heap i pun heap tehnicki bez ove provere(vrv ima bolji nacin)

    uint64 startAddr = ((uint64)HEAP_START_ADDR+MEM_BLOCK_SIZE-1) & ~(MEM_BLOCK_SIZE-1);
    uint64 endAddr = (uint64)HEAP_END_ADDR & ~(MEM_BLOCK_SIZE-1);

    freeMemHead = (FreeMem*)startAddr;
    freeMemHead->size = (endAddr - startAddr)/MEM_BLOCK_SIZE;
    freeMemHead->next = nullptr;

    initialized = true;
}


void* MemAllocator::mem_alloc(size_t numOfBlocks)
{
    if (!initialized) init();
    size_t heapBlocks = ((uint64)HEAP_END_ADDR-(uint64)HEAP_START_ADDR)/MEM_BLOCK_SIZE;//dodato za overflow check
    if (numOfBlocks==0 || numOfBlocks>=heapBlocks) return nullptr; //takodje dodat overflow check

    size_t neededBlocks = numOfBlocks+1; //+1 block za size_t header(tj podatak o velicini procesa)

    FreeMem* cur=freeMemHead;
    FreeMem* prev=nullptr;

    for(;cur!= nullptr;cur=cur->next)  //first fit trazenje
    {
        if(cur->size>=neededBlocks) break;   //ostavljam jos jedan blok uz proces da bi stavio size procesa
        prev=cur;
    }
    if(cur != nullptr)   //u slucaju da smo nasli odg FreeMem fragment
    {
        char* allocatedStart = (char*) cur;  //izvlacenje podataka za ulancavanje i potencijalni novi FreeMem
        FreeMem* nextFree=cur->next;
        size_t oldSize = cur->size;
        if(oldSize>neededBlocks)   //ako ima jedan blok vise da se smesti FreeMem
        {
            char* newFreeAddr = allocatedStart+neededBlocks*MEM_BLOCK_SIZE;

            FreeMem* newFree = (FreeMem*) newFreeAddr;
            newFree->size = oldSize-neededBlocks;
            newFree->next = nextFree;

            if(prev) prev->next = newFree;
            else freeMemHead = newFree;
        }
        else
        {
            if (prev) prev->next = nextFree;
            else freeMemHead = nextFree;
        }
        *((size_t*)allocatedStart) = numOfBlocks;//postavljanje u blok iznad velicinu procesa
        void* ret = (char*)allocatedStart+MEM_BLOCK_SIZE; //vracanje stvarne adrese pocetka procesa
        return ret;
    }
    return nullptr;
}

int MemAllocator::mem_free(void *address)
{
    if (address==nullptr) return -1;   //provera dal je zaht adresa validna

    uint64 addr = (uint64)address;
    if (addr%MEM_BLOCK_SIZE!=0) return -2;   //provera dal je block aligned

    uint64 startAddr = ((uint64)HEAP_START_ADDR+MEM_BLOCK_SIZE-1) & ~(MEM_BLOCK_SIZE-1);
    uint64 endAddr = (uint64)HEAP_END_ADDR & ~(MEM_BLOCK_SIZE-1);
    if(addr<startAddr+MEM_BLOCK_SIZE || addr>=endAddr) return -3;   //provera dal prevazilazi granice heapa

    char* allocStart= (char*) address-MEM_BLOCK_SIZE;       //cupanje pocetne adrese sa blokom za velicinu procesa
    size_t userBlocks = *((size_t*)allocStart);
    size_t totalBlocks = userBlocks+1;    //ukupan broj blokova koji se freeuje

    FreeMem* cur = (FreeMem*) allocStart;    //postavljanje parametara bloka za freeovanje
    cur->size = totalBlocks;
    cur->next = nullptr;

    FreeMem* tek = freeMemHead;
    FreeMem* prev= nullptr;
    if(!freeMemHead)   // u slucaju da nema head on postaje head
    {
        freeMemHead = cur;
    }
    else if ((char*)cur<(char*)freeMemHead)   //ako je iza heada da postane on head, head njegov next radi odrzavanja
    {                                         //rastuceg niza adresa FreeMem
        cur->next = freeMemHead;
        freeMemHead = cur;
    }
    else
    {
        while(tek && (char*)tek<(char*)cur)  //trazenje potencijalnih prev i next za coalesce
        {
            prev=tek;
            tek=tek->next;
        }
        prev->next=cur;
        cur->next = tek;
    }
    if(prev && (char*)prev+(prev->size*MEM_BLOCK_SIZE)==(char*)cur) //ako ima iznad njega spoji gore
    {
        prev->size +=cur->size;
        prev->next = cur->next;
        cur=prev;
    }
    if(cur->next && (char*)cur+(cur->size*MEM_BLOCK_SIZE)==(char*)cur->next)  //ako ima ispod njega spoj dole
    {
        cur->size+=cur->next->size;
        cur->next = cur->next->next;
    }
    return 0;
}



