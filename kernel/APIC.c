#include "interrupt.h"
#include "linkage.h"
#include "lib.h"
#include "printk.h"
#include "memory.h"
#include "gate.h"
#include "ptrace.h"
#include "cpu.h"
#include "APIC.h"

// 每个RTE表项为64位的，但是每次只能操作32位的
// 所以要分两次进行， 读和写都是

// 读的返回值是一个RTE表项 64位的
unsigned long ioapic_rte_read(unsigned char index)
{
	unsigned long ret;

	*ioapic_map.virtual_index_address = index + 1;
	io_mfence();
	ret = *ioapic_map.virtual_data_address;
	ret <<= 32;
	io_mfence();

	*ioapic_map.virtual_index_address = index;		
	io_mfence();
	ret |= *ioapic_map.virtual_data_address;
	io_mfence();

	return ret;
}

// 写的参数value是一个RTE表项 64位的
void ioapic_rte_write(unsigned char index,unsigned long value)
{
	*ioapic_map.virtual_index_address = index;
	io_mfence();
	*ioapic_map.virtual_data_address = value & 0xffffffff;
	value >>= 32;
	io_mfence();
	
	*ioapic_map.virtual_index_address = index + 1;
	io_mfence();
	*ioapic_map.virtual_data_address = value & 0xffffffff;
	io_mfence();
}

void IOAPIC_pagetable_remap()
{
	unsigned long * tmp;
	unsigned char * IOAPIC_addr = (unsigned char *)Phy_To_Virt(0xfec00000);

	ioapic_map.physical_address = 0xfec00000;
	ioapic_map.virtual_index_address  = IOAPIC_addr;
	ioapic_map.virtual_data_address   = (unsigned int *)(IOAPIC_addr + 0x10);
	ioapic_map.virtual_EOI_address    = (unsigned int *)(IOAPIC_addr + 0x40);
	
	Global_CR3 = Get_gdt();

	tmp = Phy_To_Virt(Global_CR3 + (((unsigned long)IOAPIC_addr >> PAGE_GDT_SHIFT) & 0x1ff));
	if (*tmp == 0)
	{
		unsigned long * virtual = kmalloc(PAGE_4K_SIZE,0);
		set_mpl4t(tmp,mk_mpl4t(Virt_To_Phy(virtual),PAGE_KERNEL_GDT));
	}

	color_printk(YELLOW,BLACK,"1:%#018lx\t%#018lx\n",(unsigned long)tmp,(unsigned long)*tmp);

	tmp = Phy_To_Virt((unsigned long *)(*tmp & (~ 0xfffUL)) + (((unsigned long)IOAPIC_addr >> PAGE_1G_SHIFT) & 0x1ff));
	if(*tmp == 0)
	{
		unsigned long * virtual = kmalloc(PAGE_4K_SIZE,0);
		set_pdpt(tmp,mk_pdpt(Virt_To_Phy(virtual),PAGE_KERNEL_Dir));
	}

	color_printk(YELLOW,BLACK,"2:%#018lx\t%#018lx\n",(unsigned long)tmp,(unsigned long)*tmp);
	
	tmp = Phy_To_Virt((unsigned long *)(*tmp & (~ 0xfffUL)) + (((unsigned long)IOAPIC_addr >> PAGE_2M_SHIFT) & 0x1ff));
	set_pdt(tmp,mk_pdt(ioapic_map.physical_address,PAGE_KERNEL_Page | PAGE_PWT | PAGE_PCD));

	color_printk(BLUE,BLACK,"3:%#018lx\t%#018lx\n",(unsigned long)tmp,(unsigned long)*tmp);

	color_printk(BLUE,BLACK,"ioapic_map.physical_address:%#010x\t\t\n",ioapic_map.physical_address);
	color_printk(BLUE,BLACK,"ioapic_map.virtual_address:%#018lx\t\t\n",(unsigned long)ioapic_map.virtual_index_address);

	flush_tlb();
}

void Local_APIC_init()
{
	unsigned int x,y;
	unsigned int a,b,c,d;

	//check APIC & x2APIC support
	get_cpuid(1,0,&a,&b,&c,&d);
	//void get_cpuid(unsigned int Mop,unsigned int Sop,unsigned int * a,unsigned int * b,unsigned int * c,unsigned int * d)
	color_printk(WHITE,BLACK,"CPUID\t01,eax:%#010x,ebx:%#010x,ecx:%#010x,edx:%#010x\n",a,b,c,d);

	if((1<<9) & d)
		color_printk(WHITE,BLACK,"HW support APIC&xAPIC\t");
	else
		color_printk(WHITE,BLACK,"HW NO support APIC&xAPIC\t");
	
	if((1<<21) & c)
		color_printk(WHITE,BLACK,"HW support x2APIC\n");
	else
		color_printk(WHITE,BLACK,"HW NO support x2APIC\n");

	// enable xAPIC & x2APIC
	// MSR 0x1B 功能号为操作 IA32_APIC_BASE寄存器
	// 该寄存器第10位置位表示开启 xAPIC功能
	// 第11位置位表示开启 x2APIC功能(只有xAPIC有效是此位才有效)
	__asm__ __volatile__(	"movq 	$0x1b,	%%rcx	\n\t"
				"rdmsr	\n\t"
				"bts	$10,	%%rax	\n\t"
				"bts	$11,	%%rax	\n\t"
				"wrmsr	\n\t"
				"movq 	$0x1b,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");

	color_printk(WHITE,BLACK,"eax:%#010x,edx:%#010x\t",x,y);
	
	if(x&0xc00)
		color_printk(WHITE,BLACK,"xAPIC & x2APIC enabled\n");

	// enable SVR[8]
	// SVR[8]：开启Local APIC功能
	// SVR[12]：禁止EOI广播功能
	__asm__ __volatile__(	"movq 	$0x80f,	%%rcx	\n\t"
				"rdmsr	\n\t"
				"bts	$8,	%%rax	\n\t"
				"bts	$12,%%rax\n\t"
				"wrmsr	\n\t"
				"movq 	$0x80f,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");

	color_printk(WHITE,BLACK,"eax:%#010x,edx:%#010x\t",x,y);

	if(x&0x100)
		color_printk(WHITE,BLACK,"SVR[8] enabled\n");
	if(x&0x1000)
		color_printk(WHITE,BLACK,"SVR[12] enabled\n");

	//get local APIC ID
	__asm__ __volatile__(	"movq $0x802,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");
	
	color_printk(WHITE,BLACK,"eax:%#010x,edx:%#010x\tx2APIC ID:%#010x\n",x,y,x);

	//get local APIC version
	__asm__ __volatile__(	"movq $0x803,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");

    // Local APIC 版本寄存器的第24位可以检测是否支持禁止EOI广播功能
    // 如果不支持则 SVR[12]保留使用其值位0
	color_printk(WHITE,BLACK,"local APIC Version:%#010x,\
                Max LVT Entry:%#010x,SVR(Suppress EOI Broadcast):%#04x\t",\
                x & 0xff,\
                (x >> 16 & 0xff) + 1,\
                x >> 24 & 0x1);

	if((x & 0xff) < 0x10)
		color_printk(WHITE,BLACK,"82489DX discrete APIC\n");

	else if( ((x & 0xff) >= 0x10) && ((x & 0xff) <= 0x15) )
		color_printk(WHITE,BLACK,"Integrated APIC\n");

	// mask all LVT
	// 由于还未配备LVT处理程序，
	// 所以要将LVT中断投递功能全部屏蔽
	__asm__ __volatile__(	"movq 	$0x82f,	%%rcx	\n\t"	//CMCI
				"wrmsr	\n\t"
				"movq 	$0x832,	%%rcx	\n\t"	//Timer
				"wrmsr	\n\t"
				"movq 	$0x833,	%%rcx	\n\t"	//Thermal Monitor
				"wrmsr	\n\t"
				"movq 	$0x834,	%%rcx	\n\t"	//Performance Counter
				"wrmsr	\n\t"
				"movq 	$0x835,	%%rcx	\n\t"	//LINT0
				"wrmsr	\n\t"
				"movq 	$0x836,	%%rcx	\n\t"	//LINT1
				"wrmsr	\n\t"
				"movq 	$0x837,	%%rcx	\n\t"	//Error
				"wrmsr	\n\t"
				:
				:"a"(0x10000),"d"(0x00)
				:"memory");

	color_printk(GREEN,BLACK,"Mask ALL LVT\n");

	//TPR
	__asm__ __volatile__(	"movq 	$0x808,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");

	color_printk(GREEN,BLACK,"Set LVT TPR:%#010x\t",x);

	//PPR
	__asm__ __volatile__(	"movq 	$0x80a,	%%rcx	\n\t"
				"rdmsr	\n\t"
				:"=a"(x),"=d"(y)
				:
				:"memory");

	color_printk(GREEN,BLACK,"Set LVT PPR:%#010x\n",x);

}

void IOAPIC_init()
{
	int i ;
	//	I/O APIC
	//	I/O APIC	ID

	// color_printk(GREEN,BLACK,"IOAPIC INDEX REG:%#010x\n",*ioapic_map.virtual_index_address);

	// 将索引寄存器的值赋为 0x00
	*ioapic_map.virtual_index_address = 0x00;
	io_mfence();

	// 将数据寄存器的值赋为 0x0f000000
	*ioapic_map.virtual_data_address = 0x0f000000;
	io_mfence();
	color_printk(GREEN,BLACK,"Get IOAPIC ID REG:%#010x,ID:%#010x\n",*ioapic_map.virtual_data_address, *ioapic_map.virtual_data_address >> 24 & 0xf);
	io_mfence();

	//	I/O APIC	Version

	// color_printk(GREEN,BLACK,"BEFORE Get IOAPIC Version REG:%#010x,MAX redirection enties:%#08d\n",*ioapic_map.virtual_data_address ,((*ioapic_map.virtual_data_address >> 16) & 0xff) + 1);

	// 将索引寄存器的值赋为 0x01
	*ioapic_map.virtual_index_address = 0x01;
	io_mfence();

	// 读取数据寄存器 （IOAPIC的version 寄存器的值）
	color_printk(GREEN,BLACK,"Get IOAPIC Version REG:%#010x,MAX redirection enties:%#08d\n",*ioapic_map.virtual_data_address ,((*ioapic_map.virtual_data_address >> 16) & 0xff) + 1);

	// RTE
	// 初始化RTE表
	// 暂时屏蔽所有中断	
	for(i = 0x10;i < 0x40;i += 2)
		ioapic_rte_write(i,0x10020 + ((i - 0x10) >> 1));

	// 开启第一个RTE表项， 投递到处理器核心（BSP）
	// 中断向量号位 0x21
	ioapic_rte_write(0x12,0x21);
	color_printk(GREEN,BLACK,"I/O APIC Redirection Table Entries Set Finished.\n");	
}

void APIC_IOAPIC_init()
{
	//	init trap abort fault
	int i ;

	// 地址重映射
	// 将RTE 表映射到线性地址中去
	IOAPIC_pagetable_remap();

	for(i = 32;i < 56;i++)
	{
		set_intr_gate(i , 2 , interrupt[i - 32]);
	}

	// mask 8259A
	// 屏蔽类8259A 芯片，只接受来自 I/O APIC的中断
	color_printk(GREEN,BLACK,"MASK 8259A\n");
	io_out8(0x21,0xff);
	io_out8(0xa1,0xff);

	//enable IMCR
	io_out8(0x22,0x70);
	io_out8(0x23,0x01);

	//init local apic
	Local_APIC_init();

	//init ioapic
	IOAPIC_init();

	unsigned int x;
	unsigned int * p;
	
	// //get RCBA address
	// io_out32(0xcf8,0x8000f8f0);
	// x = io_in32(0xcfc);
	// color_printk(RED,BLACK,"Get RCBA Address:%#010x\n",x);	
	// x = x & 0xffffc000;
	// color_printk(RED,BLACK,"Get RCBA Address:%#010x\n",x);

	sti();

	// //get OIC address
	// if(x > 0xfec00000 && x < 0xfee00000)
	// {
	// 	p = (unsigned int *)Phy_To_Virt(x + 0x31feUL);
	// }

	// //enable IOAPIC
	// x = (*p & 0xffffff00) | 0x100;
	// io_mfence();
	// *p = x;
	// io_mfence();

	// // enable IF eflages
	// // 开中断？
	// sti();
}

void do_IRQ(struct pt_regs * regs,unsigned long nr)	//regs:rsp,nr
{
	unsigned char x;

	x = io_in8(0x60);	
	color_printk(BLUE,WHITE,"(IRQ:%#04x)\tkey code:%#04x\n",nr,x);

	__asm__ __volatile__(	"movq	$0x00,	%%rdx	\n\t"
				"movq	$0x00,	%%rax	\n\t"
				"movq 	$0x80b,	%%rcx	\n\t"
				"wrmsr	\n\t"
				:::"memory");
}