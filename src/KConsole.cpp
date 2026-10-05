//
// Created by os on 7/25/26.
//
#include "../h/KConsole.h"
#include "../lib/hw.h"

char KConsole::getc()
{
    volatile uint8* status = (volatile uint8*)CONSOLE_STATUS;
    volatile uint8* rxData = (volatile uint8*)CONSOLE_RX_DATA;
    while ((*status & CONSOLE_RX_STATUS_BIT)==0)
    {

    }
    return (char)(*rxData);
}

void KConsole::putc(char c)
{
    volatile uint8* status = (volatile uint8*)CONSOLE_STATUS;
    volatile uint8* txData = (volatile uint8*)CONSOLE_TX_DATA;
    while ((*status & CONSOLE_TX_STATUS_BIT)==0)
    {

    }
    *txData = (uint8)c;
}
