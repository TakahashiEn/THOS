
#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__
#include "linkage.h"
#include "ptrace.h"

// 中断操作函数封装
typedef struct hw_int_type
{
	// 使能中断
	void (*enable)(unsigned long irq);
	
	// 禁止中断
	void (*disable)(unsigned long irq);

	// 安装中断
	unsigned long (*install)(unsigned long irq,void * arg);
	
	// 卸载中断
	void (*uninstall)(unsigned long irq);

	// 应答中断
	void (*ack)(unsigned long irq);
}hw_int_controller;

// 记录处理中断是所需要的信息
typedef struct {

	// 中断操作封装
	hw_int_controller * controller;

	// 中断名
	char * irq_name;

	// 参数
	unsigned long parameter;

	// 中断处理函数
	void (*handler)(unsigned long nr, unsigned long parameter, struct pt_regs * regs);

	// 自定义标志位
	unsigned long flags;
}irq_desc_T;

#define NR_IRQS 24

irq_desc_T interrupt_desc[NR_IRQS] = {0};


int register_irq(

		// 中断向量号
		unsigned long irq,
		void * arg,

		// 中断响应的函数
		void (*handler)\
			(unsigned long nr, 
			 unsigned long parameter, 
			 struct pt_regs * regs),

		unsigned long parameter,

		// 中断控制函数（屏蔽，使能等）
		hw_int_controller * controller,
		char * irq_name
);

int unregister_irq(unsigned long irq);

extern void (* interrupt[24])(void);

extern void do_IRQ(struct pt_regs * regs,unsigned long nr);

#endif
