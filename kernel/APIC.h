#ifndef __APIC_H__
#define __APIC_H__

#include "linkage.h"
#include "ptrace.h"
#include "interrupt.h"

void do_IRQ(struct pt_regs * regs,unsigned long nr);

void APIC_IOAPIC_init();

void Local_APIC_init();

#endif