
system.o:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100004:	8e d8                	mov    %eax,%ds
ffff800000100006:	8e c0                	mov    %eax,%es
ffff800000100008:	8e e0                	mov    %eax,%fs
ffff80000010000a:	8e d0                	mov    %eax,%ss
ffff80000010000c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
ffff800000100011:	0f 01 15 e0 99 00 00 	lgdt   0x99e0(%rip)        # ffff8000001099f8 <GDT_END>
ffff800000100018:	0f 01 1d e3 a9 00 00 	lidt   0xa9e3(%rip)        # ffff80000010aa02 <IDT_END>
ffff80000010001f:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100023:	8e d8                	mov    %eax,%ds
ffff800000100025:	8e c0                	mov    %eax,%es
ffff800000100027:	8e e0                	mov    %eax,%fs
ffff800000100029:	8e e8                	mov    %eax,%gs
ffff80000010002b:	8e d0                	mov    %eax,%ss
ffff80000010002d:	48 c7 c4 00 7e 00 00 	mov    $0x7e00,%rsp
ffff800000100034:	48 c7 c0 00 10 10 00 	mov    $0x101000,%rax
ffff80000010003b:	0f 22 d8             	mov    %rax,%cr3
ffff80000010003e:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # ffff80000010004a <switch_seg>
ffff800000100045:	6a 08                	pushq  $0x8
ffff800000100047:	50                   	push   %rax
ffff800000100048:	48 cb                	lretq  

ffff80000010004a <switch_seg>:
ffff80000010004a:	52                   	push   %rdx
ffff80000010004b:	00 10                	add    %dl,(%rax)
ffff80000010004d:	00 00                	add    %al,(%rax)
ffff80000010004f:	80 ff ff             	cmp    $0xff,%bh

ffff800000100052 <entry64>:
ffff800000100052:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
ffff800000100059:	48 8e d8             	mov    %rax,%ds
ffff80000010005c:	48 8e c0             	mov    %rax,%es
ffff80000010005f:	48 8e e8             	mov    %rax,%gs
ffff800000100062:	48 8e d0             	mov    %rax,%ss
ffff800000100065:	48 8b 25 49 01 00 00 	mov    0x149(%rip),%rsp        # ffff8000001001b5 <_stack_start>

ffff80000010006c <setup_IDT>:
ffff80000010006c:	48 8d 15 a6 00 00 00 	lea    0xa6(%rip),%rdx        # ffff800000100119 <ignore_int>
ffff800000100073:	48 c7 c0 00 00 08 00 	mov    $0x80000,%rax
ffff80000010007a:	66 89 d0             	mov    %dx,%ax
ffff80000010007d:	48 b9 00 00 00 00 00 	movabs $0x8e0000000000,%rcx
ffff800000100084:	8e 00 00 
ffff800000100087:	48 01 c8             	add    %rcx,%rax
ffff80000010008a:	89 d1                	mov    %edx,%ecx
ffff80000010008c:	c1 e9 10             	shr    $0x10,%ecx
ffff80000010008f:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000100093:	48 01 c8             	add    %rcx,%rax
ffff800000100096:	48 c1 ea 20          	shr    $0x20,%rdx
ffff80000010009a:	48 8d 3d 61 99 00 00 	lea    0x9961(%rip),%rdi        # ffff800000109a02 <IDT_Table>
ffff8000001000a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff8000001000a8 <rp_sidt>:
ffff8000001000a8:	48 89 07             	mov    %rax,(%rdi)
ffff8000001000ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff8000001000af:	48 83 c7 10          	add    $0x10,%rdi
ffff8000001000b3:	48 ff c9             	dec    %rcx
ffff8000001000b6:	75 f0                	jne    ffff8000001000a8 <rp_sidt>

ffff8000001000b8 <setup_TSS64>:
ffff8000001000b8:	48 8d 15 4d a9 00 00 	lea    0xa94d(%rip),%rdx        # ffff80000010aa0c <TSS64_Table>
ffff8000001000bf:	48 31 c0             	xor    %rax,%rax
ffff8000001000c2:	48 31 c9             	xor    %rcx,%rcx
ffff8000001000c5:	48 c7 c0 89 00 00 00 	mov    $0x89,%rax
ffff8000001000cc:	48 c1 e0 28          	shl    $0x28,%rax
ffff8000001000d0:	89 d1                	mov    %edx,%ecx
ffff8000001000d2:	c1 e9 18             	shr    $0x18,%ecx
ffff8000001000d5:	48 c1 e1 38          	shl    $0x38,%rcx
ffff8000001000d9:	48 01 c8             	add    %rcx,%rax
ffff8000001000dc:	48 31 c9             	xor    %rcx,%rcx
ffff8000001000df:	89 d1                	mov    %edx,%ecx
ffff8000001000e1:	81 e1 ff ff ff 00    	and    $0xffffff,%ecx
ffff8000001000e7:	48 c1 e1 10          	shl    $0x10,%rcx
ffff8000001000eb:	48 01 c8             	add    %rcx,%rax
ffff8000001000ee:	48 83 c0 67          	add    $0x67,%rax
ffff8000001000f2:	48 8d 3d 67 98 00 00 	lea    0x9867(%rip),%rdi        # ffff800000109960 <GDT_Table>
ffff8000001000f9:	48 89 47 50          	mov    %rax,0x50(%rdi)
ffff8000001000fd:	48 c1 ea 20          	shr    $0x20,%rdx
ffff800000100101:	48 89 57 58          	mov    %rdx,0x58(%rdi)
ffff800000100105:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # ffff800000100111 <go_to_kernel>
ffff80000010010c:	6a 08                	pushq  $0x8
ffff80000010010e:	50                   	push   %rax
ffff80000010010f:	48 cb                	lretq  

ffff800000100111 <go_to_kernel>:
ffff800000100111:	c0 43 10 00          	rolb   $0x0,0x10(%rbx)
ffff800000100115:	00 80 ff ff      	add    %al,0x50fcffff(%rax)

ffff800000100119 <ignore_int>:
ffff800000100119:	fc                   	cld    
ffff80000010011a:	50                   	push   %rax
ffff80000010011b:	53                   	push   %rbx
ffff80000010011c:	51                   	push   %rcx
ffff80000010011d:	52                   	push   %rdx
ffff80000010011e:	55                   	push   %rbp
ffff80000010011f:	57                   	push   %rdi
ffff800000100120:	56                   	push   %rsi
ffff800000100121:	41 50                	push   %r8
ffff800000100123:	41 51                	push   %r9
ffff800000100125:	41 52                	push   %r10
ffff800000100127:	41 53                	push   %r11
ffff800000100129:	41 54                	push   %r12
ffff80000010012b:	41 55                	push   %r13
ffff80000010012d:	41 56                	push   %r14
ffff80000010012f:	41 57                	push   %r15
ffff800000100131:	48 8c c0             	mov    %es,%rax
ffff800000100134:	50                   	push   %rax
ffff800000100135:	48 8c d8             	mov    %ds,%rax
ffff800000100138:	50                   	push   %rax
ffff800000100139:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
ffff800000100140:	48 8e d8             	mov    %rax,%ds
ffff800000100143:	48 8e c0             	mov    %rax,%es
ffff800000100146:	48 8d 05 45 00 00 00 	lea    0x45(%rip),%rax        # ffff800000100192 <int_msg>
ffff80000010014d:	50                   	push   %rax
ffff80000010014e:	48 89 c2             	mov    %rax,%rdx
ffff800000100151:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
ffff800000100158:	48 c7 c7 00 00 ff 00 	mov    $0xff0000,%rdi
ffff80000010015f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
ffff800000100166:	e8 be 51 00 00       	callq  ffff800000105329 <color_printk>
ffff80000010016b:	48 83 c4 08          	add    $0x8,%rsp

ffff80000010016f <Loop>:
ffff80000010016f:	eb fe                	jmp    ffff80000010016f <Loop>
ffff800000100171:	58                   	pop    %rax
ffff800000100172:	48 8e d8             	mov    %rax,%ds
ffff800000100175:	58                   	pop    %rax
ffff800000100176:	48 8e c0             	mov    %rax,%es
ffff800000100179:	41 5f                	pop    %r15
ffff80000010017b:	41 5e                	pop    %r14
ffff80000010017d:	41 5d                	pop    %r13
ffff80000010017f:	41 5c                	pop    %r12
ffff800000100181:	41 5b                	pop    %r11
ffff800000100183:	41 5a                	pop    %r10
ffff800000100185:	41 59                	pop    %r9
ffff800000100187:	41 58                	pop    %r8
ffff800000100189:	5e                   	pop    %rsi
ffff80000010018a:	5f                   	pop    %rdi
ffff80000010018b:	5d                   	pop    %rbp
ffff80000010018c:	5a                   	pop    %rdx
ffff80000010018d:	59                   	pop    %rcx
ffff80000010018e:	5b                   	pop    %rbx
ffff80000010018f:	58                   	pop    %rax
ffff800000100190:	48 cf                	iretq  

ffff800000100192 <int_msg>:
ffff800000100192:	55                   	push   %rbp
ffff800000100193:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000100194:	6b 6e 6f 77          	imul   $0x77,0x6f(%rsi),%ebp
ffff800000100198:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000100199:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff80000010019c:	74 65                	je     ffff800000100203 <_stack_start+0x4e>
ffff80000010019e:	72 72                	jb     ffff800000100212 <_stack_start+0x5d>
ffff8000001001a0:	75 70                	jne    ffff800000100212 <_stack_start+0x5d>
ffff8000001001a2:	74 20                	je     ffff8000001001c4 <_stack_start+0xf>
ffff8000001001a4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001001a5:	72 20                	jb     ffff8000001001c7 <_stack_start+0x12>
ffff8000001001a7:	66 61                	data16 (bad) 
ffff8000001001a9:	75 6c                	jne    ffff800000100217 <_stack_start+0x62>
ffff8000001001ab:	74 20                	je     ffff8000001001cd <_stack_start+0x18>
ffff8000001001ad:	61                   	(bad)  
ffff8000001001ae:	74 20                	je     ffff8000001001d0 <_stack_start+0x1b>
ffff8000001001b0:	52                   	push   %rdx
ffff8000001001b1:	49 50                	rex.WB push %r8
ffff8000001001b3:	0a 00                	or     (%rax),%al

ffff8000001001b5 <_stack_start>:
ffff8000001001b5:	00 00                	add    %al,(%rax)
ffff8000001001b7:	12 00                	adc    (%rax),%al
ffff8000001001b9:	00 80 ff ff 0f 1f    	add    %al,0x1f0fffff(%rax)
	...

ffff800000101000 <__PML4E>:
ffff800000101000:	07                   	(bad)  
ffff800000101001:	20 10                	and    %dl,(%rax)
	...
ffff8000001017ff:	00 07                	add    %al,(%rdi)
ffff800000101801:	20 10                	and    %dl,(%rax)
	...

ffff800000102000 <__PDPTE>:
ffff800000102000:	07                   	(bad)  
ffff800000102001:	30 10                	xor    %dl,(%rax)
	...

ffff800000103000 <__PDE>:
ffff800000103000:	87 00                	xchg   %eax,(%rax)
ffff800000103002:	00 00                	add    %al,(%rax)
ffff800000103004:	00 00                	add    %al,(%rax)
ffff800000103006:	00 00                	add    %al,(%rax)
ffff800000103008:	87 00                	xchg   %eax,(%rax)
ffff80000010300a:	20 00                	and    %al,(%rax)
ffff80000010300c:	00 00                	add    %al,(%rax)
ffff80000010300e:	00 00                	add    %al,(%rax)
ffff800000103010:	87 00                	xchg   %eax,(%rax)
ffff800000103012:	40 00 00             	add    %al,(%rax)
ffff800000103015:	00 00                	add    %al,(%rax)
ffff800000103017:	00 87 00 60 00 00    	add    %al,0x6000(%rdi)
ffff80000010301d:	00 00                	add    %al,(%rax)
ffff80000010301f:	00 87 00 80 00 00    	add    %al,0x8000(%rdi)
ffff800000103025:	00 00                	add    %al,(%rax)
ffff800000103027:	00 87 00 00 e0 00    	add    %al,0xe00000(%rdi)
ffff80000010302d:	00 00                	add    %al,(%rax)
ffff80000010302f:	00 87 00 20 e0 00    	add    %al,0xe02000(%rdi)
ffff800000103035:	00 00                	add    %al,(%rax)
ffff800000103037:	00 87 00 40 e0 00    	add    %al,0xe04000(%rdi)
ffff80000010303d:	00 00                	add    %al,(%rax)
ffff80000010303f:	00 87 00 60 e0 00    	add    %al,0xe06000(%rdi)
ffff800000103045:	00 00                	add    %al,(%rax)
ffff800000103047:	00 87 00 80 e0 00    	add    %al,0xe08000(%rdi)
ffff80000010304d:	00 00                	add    %al,(%rax)
ffff80000010304f:	00 87 00 a0 e0 00    	add    %al,0xe0a000(%rdi)
ffff800000103055:	00 00                	add    %al,(%rax)
ffff800000103057:	00 87 00 c0 e0 00    	add    %al,0xe0c000(%rdi)
ffff80000010305d:	00 00                	add    %al,(%rax)
ffff80000010305f:	00 87 00 e0 e0 00    	add    %al,0xe0e000(%rdi)
	...

ffff800000104000 <RESTORE_ALL>:
ffff800000104000:	41 5f                	pop    %r15
ffff800000104002:	41 5e                	pop    %r14
ffff800000104004:	41 5d                	pop    %r13
ffff800000104006:	41 5c                	pop    %r12
ffff800000104008:	41 5b                	pop    %r11
ffff80000010400a:	41 5a                	pop    %r10
ffff80000010400c:	41 59                	pop    %r9
ffff80000010400e:	41 58                	pop    %r8
ffff800000104010:	5b                   	pop    %rbx
ffff800000104011:	59                   	pop    %rcx
ffff800000104012:	5a                   	pop    %rdx
ffff800000104013:	5e                   	pop    %rsi
ffff800000104014:	5f                   	pop    %rdi
ffff800000104015:	5d                   	pop    %rbp
ffff800000104016:	58                   	pop    %rax
ffff800000104017:	48 8e d8             	mov    %rax,%ds
ffff80000010401a:	58                   	pop    %rax
ffff80000010401b:	48 8e c0             	mov    %rax,%es
ffff80000010401e:	58                   	pop    %rax
ffff80000010401f:	48 83 c4 10          	add    $0x10,%rsp
ffff800000104023:	48 cf                	iretq  

ffff800000104025 <ret_from_intr>:
ffff800000104025:	eb d9                	jmp    ffff800000104000 <RESTORE_ALL>

ffff800000104027 <system_call>:
ffff800000104027:	fb                   	sti    
ffff800000104028:	48 83 ec 38          	sub    $0x38,%rsp
ffff80000010402c:	fc                   	cld    
ffff80000010402d:	50                   	push   %rax
ffff80000010402e:	48 8c c0             	mov    %es,%rax
ffff800000104031:	50                   	push   %rax
ffff800000104032:	48 8c d8             	mov    %ds,%rax
ffff800000104035:	50                   	push   %rax
ffff800000104036:	48 31 c0             	xor    %rax,%rax
ffff800000104039:	55                   	push   %rbp
ffff80000010403a:	57                   	push   %rdi
ffff80000010403b:	56                   	push   %rsi
ffff80000010403c:	52                   	push   %rdx
ffff80000010403d:	51                   	push   %rcx
ffff80000010403e:	53                   	push   %rbx
ffff80000010403f:	41 50                	push   %r8
ffff800000104041:	41 51                	push   %r9
ffff800000104043:	41 52                	push   %r10
ffff800000104045:	41 53                	push   %r11
ffff800000104047:	41 54                	push   %r12
ffff800000104049:	41 55                	push   %r13
ffff80000010404b:	41 56                	push   %r14
ffff80000010404d:	41 57                	push   %r15
ffff80000010404f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000104056:	48 8e da             	mov    %rdx,%ds
ffff800000104059:	48 8e c2             	mov    %rdx,%es
ffff80000010405c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010405f:	e8 18 52 00 00       	callq  ffff80000010927c <system_call_function>

ffff800000104064 <ret_system_call>:
ffff800000104064:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
ffff80000010406b:	00 
ffff80000010406c:	41 5f                	pop    %r15
ffff80000010406e:	41 5e                	pop    %r14
ffff800000104070:	41 5d                	pop    %r13
ffff800000104072:	41 5c                	pop    %r12
ffff800000104074:	41 5b                	pop    %r11
ffff800000104076:	41 5a                	pop    %r10
ffff800000104078:	41 59                	pop    %r9
ffff80000010407a:	41 58                	pop    %r8
ffff80000010407c:	5b                   	pop    %rbx
ffff80000010407d:	59                   	pop    %rcx
ffff80000010407e:	5a                   	pop    %rdx
ffff80000010407f:	5e                   	pop    %rsi
ffff800000104080:	5f                   	pop    %rdi
ffff800000104081:	5d                   	pop    %rbp
ffff800000104082:	58                   	pop    %rax
ffff800000104083:	48 8e d8             	mov    %rax,%ds
ffff800000104086:	58                   	pop    %rax
ffff800000104087:	48 8e c0             	mov    %rax,%es
ffff80000010408a:	58                   	pop    %rax
ffff80000010408b:	48 83 c4 38          	add    $0x38,%rsp
ffff80000010408f:	48 0f 35             	rex.W sysexit 

ffff800000104092 <divide_error>:
ffff800000104092:	6a 00                	pushq  $0x0
ffff800000104094:	50                   	push   %rax
ffff800000104095:	48 8d 05 2c 1a 00 00 	lea    0x1a2c(%rip),%rax        # ffff800000105ac8 <do_divide_error>
ffff80000010409c:	48 87 04 24          	xchg   %rax,(%rsp)

ffff8000001040a0 <error_code>:
ffff8000001040a0:	50                   	push   %rax
ffff8000001040a1:	48 8c c0             	mov    %es,%rax
ffff8000001040a4:	50                   	push   %rax
ffff8000001040a5:	48 8c d8             	mov    %ds,%rax
ffff8000001040a8:	50                   	push   %rax
ffff8000001040a9:	48 31 c0             	xor    %rax,%rax
ffff8000001040ac:	55                   	push   %rbp
ffff8000001040ad:	57                   	push   %rdi
ffff8000001040ae:	56                   	push   %rsi
ffff8000001040af:	52                   	push   %rdx
ffff8000001040b0:	51                   	push   %rcx
ffff8000001040b1:	53                   	push   %rbx
ffff8000001040b2:	41 50                	push   %r8
ffff8000001040b4:	41 51                	push   %r9
ffff8000001040b6:	41 52                	push   %r10
ffff8000001040b8:	41 53                	push   %r11
ffff8000001040ba:	41 54                	push   %r12
ffff8000001040bc:	41 55                	push   %r13
ffff8000001040be:	41 56                	push   %r14
ffff8000001040c0:	41 57                	push   %r15
ffff8000001040c2:	fc                   	cld    
ffff8000001040c3:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
ffff8000001040ca:	00 
ffff8000001040cb:	48 8b 94 24 88 00 00 	mov    0x88(%rsp),%rdx
ffff8000001040d2:	00 
ffff8000001040d3:	48 c7 c7 10 00 00 00 	mov    $0x10,%rdi
ffff8000001040da:	48 8e df             	mov    %rdi,%ds
ffff8000001040dd:	48 8e c7             	mov    %rdi,%es
ffff8000001040e0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001040e3:	ff d2                	callq  *%rdx
ffff8000001040e5:	e9 3b ff ff ff       	jmpq   ffff800000104025 <ret_from_intr>

ffff8000001040ea <debug>:
ffff8000001040ea:	6a 00                	pushq  $0x0
ffff8000001040ec:	50                   	push   %rax
ffff8000001040ed:	48 8d 05 2f 1a 00 00 	lea    0x1a2f(%rip),%rax        # ffff800000105b23 <do_debug>
ffff8000001040f4:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001040f8:	eb a6                	jmp    ffff8000001040a0 <error_code>

ffff8000001040fa <nmi>:
ffff8000001040fa:	50                   	push   %rax
ffff8000001040fb:	fc                   	cld    
ffff8000001040fc:	50                   	push   %rax
ffff8000001040fd:	50                   	push   %rax
ffff8000001040fe:	48 8c c0             	mov    %es,%rax
ffff800000104101:	50                   	push   %rax
ffff800000104102:	48 8c d8             	mov    %ds,%rax
ffff800000104105:	50                   	push   %rax
ffff800000104106:	48 31 c0             	xor    %rax,%rax
ffff800000104109:	55                   	push   %rbp
ffff80000010410a:	57                   	push   %rdi
ffff80000010410b:	56                   	push   %rsi
ffff80000010410c:	52                   	push   %rdx
ffff80000010410d:	51                   	push   %rcx
ffff80000010410e:	53                   	push   %rbx
ffff80000010410f:	41 50                	push   %r8
ffff800000104111:	41 51                	push   %r9
ffff800000104113:	41 52                	push   %r10
ffff800000104115:	41 53                	push   %r11
ffff800000104117:	41 54                	push   %r12
ffff800000104119:	41 55                	push   %r13
ffff80000010411b:	41 56                	push   %r14
ffff80000010411d:	41 57                	push   %r15
ffff80000010411f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000104126:	48 8e da             	mov    %rdx,%ds
ffff800000104129:	48 8e c2             	mov    %rdx,%es
ffff80000010412c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
ffff800000104133:	48 89 e7             	mov    %rsp,%rdi
ffff800000104136:	e8 43 1a 00 00       	callq  ffff800000105b7e <do_nmi>
ffff80000010413b:	e9 c0 fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104140 <int3>:
ffff800000104140:	6a 00                	pushq  $0x0
ffff800000104142:	50                   	push   %rax
ffff800000104143:	48 8d 05 8f 1a 00 00 	lea    0x1a8f(%rip),%rax        # ffff800000105bd9 <do_int3>
ffff80000010414a:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010414e:	e9 4d ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104153 <overflow>:
ffff800000104153:	6a 00                	pushq  $0x0
ffff800000104155:	50                   	push   %rax
ffff800000104156:	48 8d 05 d7 1a 00 00 	lea    0x1ad7(%rip),%rax        # ffff800000105c34 <do_overflow>
ffff80000010415d:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104161:	e9 3a ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104166 <bounds>:
ffff800000104166:	6a 00                	pushq  $0x0
ffff800000104168:	50                   	push   %rax
ffff800000104169:	48 8d 05 1f 1b 00 00 	lea    0x1b1f(%rip),%rax        # ffff800000105c8f <do_bounds>
ffff800000104170:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104174:	e9 27 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104179 <undefined_opcode>:
ffff800000104179:	6a 00                	pushq  $0x0
ffff80000010417b:	50                   	push   %rax
ffff80000010417c:	48 8d 05 67 1b 00 00 	lea    0x1b67(%rip),%rax        # ffff800000105cea <do_undefined_opcode>
ffff800000104183:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104187:	e9 14 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010418c <dev_not_available>:
ffff80000010418c:	6a 00                	pushq  $0x0
ffff80000010418e:	50                   	push   %rax
ffff80000010418f:	48 8d 05 af 1b 00 00 	lea    0x1baf(%rip),%rax        # ffff800000105d45 <do_dev_not_available>
ffff800000104196:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419a:	e9 01 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010419f <double_fault>:
ffff80000010419f:	50                   	push   %rax
ffff8000001041a0:	48 8d 05 f9 1b 00 00 	lea    0x1bf9(%rip),%rax        # ffff800000105da0 <do_double_fault>
ffff8000001041a7:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ab:	e9 f0 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041b0 <coprocessor_segment_overrun>:
ffff8000001041b0:	6a 00                	pushq  $0x0
ffff8000001041b2:	50                   	push   %rax
ffff8000001041b3:	48 8d 05 41 1c 00 00 	lea    0x1c41(%rip),%rax        # ffff800000105dfb <do_coprocessor_segment_overrun>
ffff8000001041ba:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041be:	e9 dd fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041c3 <invalid_TSS>:
ffff8000001041c3:	50                   	push   %rax
ffff8000001041c4:	48 8d 05 8b 1c 00 00 	lea    0x1c8b(%rip),%rax        # ffff800000105e56 <do_invalid_TSS>
ffff8000001041cb:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041cf:	e9 cc fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041d4 <segment_not_present>:
ffff8000001041d4:	50                   	push   %rax
ffff8000001041d5:	48 8d 05 f4 1d 00 00 	lea    0x1df4(%rip),%rax        # ffff800000105fd0 <do_segment_not_present>
ffff8000001041dc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e0:	e9 bb fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041e5 <stack_segment_fault>:
ffff8000001041e5:	50                   	push   %rax
ffff8000001041e6:	48 8d 05 5d 1f 00 00 	lea    0x1f5d(%rip),%rax        # ffff80000010614a <do_stack_segment_fault>
ffff8000001041ed:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f1:	e9 aa fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041f6 <general_protection>:
ffff8000001041f6:	50                   	push   %rax
ffff8000001041f7:	48 8d 05 c6 20 00 00 	lea    0x20c6(%rip),%rax        # ffff8000001062c4 <do_general_protection>
ffff8000001041fe:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104202:	e9 99 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104207 <page_fault>:
ffff800000104207:	50                   	push   %rax
ffff800000104208:	48 8d 05 2f 22 00 00 	lea    0x222f(%rip),%rax        # ffff80000010643e <do_page_fault>
ffff80000010420f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104213:	e9 88 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104218 <x87_FPU_error>:
ffff800000104218:	6a 00                	pushq  $0x0
ffff80000010421a:	50                   	push   %rax
ffff80000010421b:	48 8d 05 1b 24 00 00 	lea    0x241b(%rip),%rax        # ffff80000010663d <do_x87_FPU_error>
ffff800000104222:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104226:	e9 75 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010422b <alignment_check>:
ffff80000010422b:	50                   	push   %rax
ffff80000010422c:	48 8d 05 65 24 00 00 	lea    0x2465(%rip),%rax        # ffff800000106698 <do_alignment_check>
ffff800000104233:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104237:	e9 64 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010423c <machine_check>:
ffff80000010423c:	6a 00                	pushq  $0x0
ffff80000010423e:	50                   	push   %rax
ffff80000010423f:	48 8d 05 ad 24 00 00 	lea    0x24ad(%rip),%rax        # ffff8000001066f3 <do_machine_check>
ffff800000104246:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424a:	e9 51 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010424f <SIMD_exception>:
ffff80000010424f:	6a 00                	pushq  $0x0
ffff800000104251:	50                   	push   %rax
ffff800000104252:	48 8d 05 f5 24 00 00 	lea    0x24f5(%rip),%rax        # ffff80000010674e <do_SIMD_exception>
ffff800000104259:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425d:	e9 3e fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104262 <virtualization_exception>:
ffff800000104262:	6a 00                	pushq  $0x0
ffff800000104264:	50                   	push   %rax
ffff800000104265:	48 8d 05 3d 25 00 00 	lea    0x253d(%rip),%rax        # ffff8000001067a9 <do_virtualization_exception>
ffff80000010426c:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104270:	e9 2b fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104275 <set_tss64>:
ffff800000104275:	55                   	push   %rbp
ffff800000104276:	48 89 e5             	mov    %rsp,%rbp
ffff800000104279:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010427d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000104281:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000104285:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000104289:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff80000010428d:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000104291:	48 ba 10 aa 10 00 00 	movabs $0xffff80000010aa10,%rdx
ffff800000104298:	80 ff ff 
ffff80000010429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010429f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042a2:	48 ba 18 aa 10 00 00 	movabs $0xffff80000010aa18,%rdx
ffff8000001042a9:	80 ff ff 
ffff8000001042ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042b3:	48 ba 20 aa 10 00 00 	movabs $0xffff80000010aa20,%rdx
ffff8000001042ba:	80 ff ff 
ffff8000001042bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001042c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042c4:	48 ba 30 aa 10 00 00 	movabs $0xffff80000010aa30,%rdx
ffff8000001042cb:	80 ff ff 
ffff8000001042ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001042d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042d5:	48 ba 38 aa 10 00 00 	movabs $0xffff80000010aa38,%rdx
ffff8000001042dc:	80 ff ff 
ffff8000001042df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042e6:	48 ba 40 aa 10 00 00 	movabs $0xffff80000010aa40,%rdx
ffff8000001042ed:	80 ff ff 
ffff8000001042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001042f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042f7:	48 ba 48 aa 10 00 00 	movabs $0xffff80000010aa48,%rdx
ffff8000001042fe:	80 ff ff 
ffff800000104301:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000104305:	48 89 02             	mov    %rax,(%rdx)
ffff800000104308:	48 ba 50 aa 10 00 00 	movabs $0xffff80000010aa50,%rdx
ffff80000010430f:	80 ff ff 
ffff800000104312:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000104316:	48 89 02             	mov    %rax,(%rdx)
ffff800000104319:	48 ba 58 aa 10 00 00 	movabs $0xffff80000010aa58,%rdx
ffff800000104320:	80 ff ff 
ffff800000104323:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000104327:	48 89 02             	mov    %rax,(%rdx)
ffff80000010432a:	48 ba 60 aa 10 00 00 	movabs $0xffff80000010aa60,%rdx
ffff800000104331:	80 ff ff 
ffff800000104334:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000104338:	48 89 02             	mov    %rax,(%rdx)
ffff80000010433b:	90                   	nop
ffff80000010433c:	5d                   	pop    %rbp
ffff80000010433d:	c3                   	retq   

ffff80000010433e <no_system_call>:
ffff80000010433e:	55                   	push   %rbp
ffff80000010433f:	48 89 e5             	mov    %rsp,%rbp
ffff800000104342:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000104346:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010434a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010434e:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000104355:	48 89 c1             	mov    %rax,%rcx
ffff800000104358:	48 ba c0 1a 11 00 00 	movabs $0xffff800000111ac0,%rdx
ffff80000010435f:	80 ff ff 
ffff800000104362:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104367:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010436c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104371:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000104378:	80 ff ff 
ffff80000010437b:	41 ff d0             	callq  *%r8
ffff80000010437e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000104385:	c9                   	leaveq 
ffff800000104386:	c3                   	retq   

ffff800000104387 <sys_printf>:
ffff800000104387:	55                   	push   %rbp
ffff800000104388:	48 89 e5             	mov    %rsp,%rbp
ffff80000010438b:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010438f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000104393:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104397:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff80000010439b:	48 89 c2             	mov    %rax,%rdx
ffff80000010439e:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff8000001043a3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff8000001043a8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001043ad:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001043b4:	80 ff ff 
ffff8000001043b7:	ff d1                	callq  *%rcx
ffff8000001043b9:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001043be:	c9                   	leaveq 
ffff8000001043bf:	c3                   	retq   

ffff8000001043c0 <Start_Kernel>:
ffff8000001043c0:	55                   	push   %rbp
ffff8000001043c1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001043c4:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001043c8:	48 bf 00 00 a0 00 00 	movabs $0xffff800000a00000,%rdi
ffff8000001043cf:	80 ff ff 
ffff8000001043d2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001043d6:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001043dd:	80 ff ff 
ffff8000001043e0:	c7 00 00 04 00 00    	movl   $0x400,(%rax)
ffff8000001043e6:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001043ed:	80 ff ff 
ffff8000001043f0:	c7 40 04 00 03 00 00 	movl   $0x300,0x4(%rax)
ffff8000001043f7:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001043fe:	80 ff ff 
ffff800000104401:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffff800000104408:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010440f:	80 ff ff 
ffff800000104412:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
ffff800000104419:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000104420:	80 ff ff 
ffff800000104423:	c7 40 10 08 00 00 00 	movl   $0x8,0x10(%rax)
ffff80000010442a:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000104431:	80 ff ff 
ffff800000104434:	c7 40 14 10 00 00 00 	movl   $0x10,0x14(%rax)
ffff80000010443b:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000104442:	80 ff ff 
ffff800000104445:	48 89 78 18          	mov    %rdi,0x18(%rax)
ffff800000104449:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000104450:	80 ff ff 
ffff800000104453:	8b 10                	mov    (%rax),%edx
ffff800000104455:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010445c:	80 ff ff 
ffff80000010445f:	8b 40 04             	mov    0x4(%rax),%eax
ffff800000104462:	0f af c2             	imul   %edx,%eax
ffff800000104465:	c1 e0 02             	shl    $0x2,%eax
ffff800000104468:	48 98                	cltq   
ffff80000010446a:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000104470:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000104476:	48 89 c2             	mov    %rax,%rdx
ffff800000104479:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000104480:	80 ff ff 
ffff800000104483:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000104487:	b8 50 00 00 00       	mov    $0x50,%eax
ffff80000010448c:	0f 00 d8             	ltr    %ax
ffff80000010448f:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff800000104496:	80 ff ff 
ffff800000104499:	48 8b 10             	mov    (%rax),%rdx
ffff80000010449c:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff8000001044a3:	80 ff ff 
ffff8000001044a6:	48 8b 30             	mov    (%rax),%rsi
ffff8000001044a9:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff8000001044b0:	80 ff ff 
ffff8000001044b3:	48 8b 00             	mov    (%rax),%rax
ffff8000001044b6:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001044bb:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
ffff8000001044c2:	ff 
ffff8000001044c3:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001044c8:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
ffff8000001044cf:	ff 
ffff8000001044d0:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001044d5:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
ffff8000001044dc:	ff 
ffff8000001044dd:	68 00 7c 00 00       	pushq  $0x7c00
ffff8000001044e2:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
ffff8000001044e9:	ff 
ffff8000001044ea:	49 b9 00 7c 00 00 00 	movabs $0xffff800000007c00,%r9
ffff8000001044f1:	80 ff ff 
ffff8000001044f4:	49 b8 00 7c 00 00 00 	movabs $0xffff800000007c00,%r8
ffff8000001044fb:	80 ff ff 
ffff8000001044fe:	48 b9 00 7c 00 00 00 	movabs $0xffff800000007c00,%rcx
ffff800000104505:	80 ff ff 
ffff800000104508:	48 89 c7             	mov    %rax,%rdi
ffff80000010450b:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000104512:	80 ff ff 
ffff800000104515:	ff d0                	callq  *%rax
ffff800000104517:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010451b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104520:	48 ba 04 68 10 00 00 	movabs $0xffff800000106804,%rdx
ffff800000104527:	80 ff ff 
ffff80000010452a:	ff d2                	callq  *%rdx
ffff80000010452c:	48 ba 00 00 10 00 00 	movabs $0xffff800000100000,%rdx
ffff800000104533:	80 ff ff 
ffff800000104536:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010453d:	80 ff ff 
ffff800000104540:	48 89 90 d0 02 00 00 	mov    %rdx,0x2d0(%rax)
ffff800000104547:	48 ba 53 99 10 00 00 	movabs $0xffff800000109953,%rdx
ffff80000010454e:	80 ff ff 
ffff800000104551:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104558:	80 ff ff 
ffff80000010455b:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
ffff800000104562:	48 ba c0 1a 11 00 00 	movabs $0xffff800000111ac0,%rdx
ffff800000104569:	80 ff ff 
ffff80000010456c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104573:	80 ff ff 
ffff800000104576:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
ffff80000010457d:	48 ba 30 e5 12 00 00 	movabs $0xffff80000012e530,%rdx
ffff800000104584:	80 ff ff 
ffff800000104587:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010458e:	80 ff ff 
ffff800000104591:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
ffff800000104598:	48 ba e4 1a 11 00 00 	movabs $0xffff800000111ae4,%rdx
ffff80000010459f:	80 ff ff 
ffff8000001045a2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045a7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045ac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045b1:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001045b8:	80 ff ff 
ffff8000001045bb:	ff d1                	callq  *%rcx
ffff8000001045bd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045c2:	48 ba 80 6e 10 00 00 	movabs $0xffff800000106e80,%rdx
ffff8000001045c9:	80 ff ff 
ffff8000001045cc:	ff d2                	callq  *%rdx
ffff8000001045ce:	48 ba f2 1a 11 00 00 	movabs $0xffff800000111af2,%rdx
ffff8000001045d5:	80 ff ff 
ffff8000001045d8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045dd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045e2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045e7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001045ee:	80 ff ff 
ffff8000001045f1:	ff d1                	callq  *%rcx
ffff8000001045f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045f8:	48 ba d9 87 10 00 00 	movabs $0xffff8000001087d9,%rdx
ffff8000001045ff:	80 ff ff 
ffff800000104602:	ff d2                	callq  *%rdx
ffff800000104604:	48 ba 03 1b 11 00 00 	movabs $0xffff800000111b03,%rdx
ffff80000010460b:	80 ff ff 
ffff80000010460e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104613:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104618:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010461d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000104624:	80 ff ff 
ffff800000104627:	ff d1                	callq  *%rcx
ffff800000104629:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010462e:	48 ba 10 96 10 00 00 	movabs $0xffff800000109610,%rdx
ffff800000104635:	80 ff ff 
ffff800000104638:	ff d2                	callq  *%rdx
ffff80000010463a:	eb fe                	jmp    ffff80000010463a <Start_Kernel+0x27a>

ffff80000010463c <strlen>:
ffff80000010463c:	55                   	push   %rbp
ffff80000010463d:	48 89 e5             	mov    %rsp,%rbp
ffff800000104640:	53                   	push   %rbx
ffff800000104641:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
ffff800000104645:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
ffff800000104649:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010464e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
ffff800000104653:	89 d1                	mov    %edx,%ecx
ffff800000104655:	48 89 f7             	mov    %rsi,%rdi
ffff800000104658:	fc                   	cld    
ffff800000104659:	f2 ae                	repnz scas %es:(%rdi),%al
ffff80000010465b:	f7 d1                	not    %ecx
ffff80000010465d:	ff c9                	dec    %ecx
ffff80000010465f:	89 ca                	mov    %ecx,%edx
ffff800000104661:	89 d3                	mov    %edx,%ebx
ffff800000104663:	89 d8                	mov    %ebx,%eax
ffff800000104665:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000104669:	c9                   	leaveq 
ffff80000010466a:	c3                   	retq   

ffff80000010466b <putchar>:
ffff80000010466b:	55                   	push   %rbp
ffff80000010466c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010466f:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000104673:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000104676:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff800000104679:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff80000010467c:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff800000104680:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff800000104684:	8b 45 10             	mov    0x10(%rbp),%eax
ffff800000104687:	88 45 c0             	mov    %al,-0x40(%rbp)
ffff80000010468a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104691:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000104698:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff80000010469f:	00 
ffff8000001046a0:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001046a7:	00 
ffff8000001046a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff8000001046af:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
ffff8000001046b3:	48 98                	cltq   
ffff8000001046b5:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001046b9:	48 89 c2             	mov    %rax,%rdx
ffff8000001046bc:	48 b8 80 aa 10 00 00 	movabs $0xffff80000010aa80,%rax
ffff8000001046c3:	80 ff ff 
ffff8000001046c6:	48 01 d0             	add    %rdx,%rax
ffff8000001046c9:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001046cd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001046d4:	eb 7a                	jmp    ffff800000104750 <putchar+0xe5>
ffff8000001046d6:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001046d9:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001046dc:	01 d0                	add    %edx,%eax
ffff8000001046de:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff8000001046e2:	48 63 d0             	movslq %eax,%rdx
ffff8000001046e5:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff8000001046e8:	48 98                	cltq   
ffff8000001046ea:	48 01 d0             	add    %rdx,%rax
ffff8000001046ed:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff8000001046f4:	00 
ffff8000001046f5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001046f9:	48 01 d0             	add    %rdx,%rax
ffff8000001046fc:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104700:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff800000104707:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010470e:	eb 31                	jmp    ffff800000104741 <putchar+0xd6>
ffff800000104710:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff800000104713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104717:	0f b6 00             	movzbl (%rax),%eax
ffff80000010471a:	0f b6 c0             	movzbl %al,%eax
ffff80000010471d:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff800000104720:	85 c0                	test   %eax,%eax
ffff800000104722:	74 0b                	je     ffff80000010472f <putchar+0xc4>
ffff800000104724:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104728:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff80000010472b:	89 10                	mov    %edx,(%rax)
ffff80000010472d:	eb 09                	jmp    ffff800000104738 <putchar+0xcd>
ffff80000010472f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104733:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104736:	89 10                	mov    %edx,(%rax)
ffff800000104738:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff80000010473d:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000104741:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104745:	7e c9                	jle    ffff800000104710 <putchar+0xa5>
ffff800000104747:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff80000010474c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000104750:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104754:	7e 80                	jle    ffff8000001046d6 <putchar+0x6b>
ffff800000104756:	90                   	nop
ffff800000104757:	90                   	nop
ffff800000104758:	5d                   	pop    %rbp
ffff800000104759:	c3                   	retq   

ffff80000010475a <skip_atoi>:
ffff80000010475a:	55                   	push   %rbp
ffff80000010475b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010475e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000104762:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104769:	eb 2e                	jmp    ffff800000104799 <skip_atoi+0x3f>
ffff80000010476b:	8b 55 fc             	mov    -0x4(%rbp),%edx
ffff80000010476e:	89 d0                	mov    %edx,%eax
ffff800000104770:	c1 e0 02             	shl    $0x2,%eax
ffff800000104773:	01 d0                	add    %edx,%eax
ffff800000104775:	01 c0                	add    %eax,%eax
ffff800000104777:	89 c6                	mov    %eax,%esi
ffff800000104779:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010477d:	48 8b 00             	mov    (%rax),%rax
ffff800000104780:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104784:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104788:	48 89 0a             	mov    %rcx,(%rdx)
ffff80000010478b:	0f b6 00             	movzbl (%rax),%eax
ffff80000010478e:	0f be c0             	movsbl %al,%eax
ffff800000104791:	01 f0                	add    %esi,%eax
ffff800000104793:	83 e8 30             	sub    $0x30,%eax
ffff800000104796:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000104799:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010479d:	48 8b 00             	mov    (%rax),%rax
ffff8000001047a0:	0f b6 00             	movzbl (%rax),%eax
ffff8000001047a3:	3c 2f                	cmp    $0x2f,%al
ffff8000001047a5:	7e 0e                	jle    ffff8000001047b5 <skip_atoi+0x5b>
ffff8000001047a7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001047ab:	48 8b 00             	mov    (%rax),%rax
ffff8000001047ae:	0f b6 00             	movzbl (%rax),%eax
ffff8000001047b1:	3c 39                	cmp    $0x39,%al
ffff8000001047b3:	7e b6                	jle    ffff80000010476b <skip_atoi+0x11>
ffff8000001047b5:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001047b8:	5d                   	pop    %rbp
ffff8000001047b9:	c3                   	retq   

ffff8000001047ba <number>:
ffff8000001047ba:	55                   	push   %rbp
ffff8000001047bb:	48 89 e5             	mov    %rsp,%rbp
ffff8000001047be:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
ffff8000001047c2:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
ffff8000001047c6:	89 55 9c             	mov    %edx,-0x64(%rbp)
ffff8000001047c9:	89 4d 98             	mov    %ecx,-0x68(%rbp)
ffff8000001047cc:	44 89 45 94          	mov    %r8d,-0x6c(%rbp)
ffff8000001047d0:	44 89 4d 90          	mov    %r9d,-0x70(%rbp)
ffff8000001047d4:	48 b8 10 1b 11 00 00 	movabs $0xffff800000111b10,%rax
ffff8000001047db:	80 ff ff 
ffff8000001047de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047e2:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047e5:	83 e0 40             	and    $0x40,%eax
ffff8000001047e8:	85 c0                	test   %eax,%eax
ffff8000001047ea:	74 0e                	je     ffff8000001047fa <number+0x40>
ffff8000001047ec:	48 b8 38 1b 11 00 00 	movabs $0xffff800000111b38,%rax
ffff8000001047f3:	80 ff ff 
ffff8000001047f6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047fa:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047fd:	83 e0 10             	and    $0x10,%eax
ffff800000104800:	85 c0                	test   %eax,%eax
ffff800000104802:	74 04                	je     ffff800000104808 <number+0x4e>
ffff800000104804:	83 65 90 fe          	andl   $0xfffffffe,-0x70(%rbp)
ffff800000104808:	83 7d 9c 01          	cmpl   $0x1,-0x64(%rbp)
ffff80000010480c:	7e 06                	jle    ffff800000104814 <number+0x5a>
ffff80000010480e:	83 7d 9c 24          	cmpl   $0x24,-0x64(%rbp)
ffff800000104812:	7e 0a                	jle    ffff80000010481e <number+0x64>
ffff800000104814:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104819:	e9 10 02 00 00       	jmpq   ffff800000104a2e <number+0x274>
ffff80000010481e:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104821:	83 e0 01             	and    $0x1,%eax
ffff800000104824:	85 c0                	test   %eax,%eax
ffff800000104826:	74 07                	je     ffff80000010482f <number+0x75>
ffff800000104828:	b8 30 00 00 00       	mov    $0x30,%eax
ffff80000010482d:	eb 05                	jmp    ffff800000104834 <number+0x7a>
ffff80000010482f:	b8 20 00 00 00       	mov    $0x20,%eax
ffff800000104834:	88 45 eb             	mov    %al,-0x15(%rbp)
ffff800000104837:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff80000010483b:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010483e:	83 e0 02             	and    $0x2,%eax
ffff800000104841:	85 c0                	test   %eax,%eax
ffff800000104843:	74 11                	je     ffff800000104856 <number+0x9c>
ffff800000104845:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff80000010484a:	79 0a                	jns    ffff800000104856 <number+0x9c>
ffff80000010484c:	c6 45 ff 2d          	movb   $0x2d,-0x1(%rbp)
ffff800000104850:	48 f7 5d a0          	negq   -0x60(%rbp)
ffff800000104854:	eb 1d                	jmp    ffff800000104873 <number+0xb9>
ffff800000104856:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104859:	83 e0 04             	and    $0x4,%eax
ffff80000010485c:	85 c0                	test   %eax,%eax
ffff80000010485e:	75 0b                	jne    ffff80000010486b <number+0xb1>
ffff800000104860:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104863:	c1 e0 02             	shl    $0x2,%eax
ffff800000104866:	83 e0 20             	and    $0x20,%eax
ffff800000104869:	eb 05                	jmp    ffff800000104870 <number+0xb6>
ffff80000010486b:	b8 2b 00 00 00       	mov    $0x2b,%eax
ffff800000104870:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000104873:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
ffff800000104877:	74 04                	je     ffff80000010487d <number+0xc3>
ffff800000104879:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
ffff80000010487d:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104880:	83 e0 20             	and    $0x20,%eax
ffff800000104883:	85 c0                	test   %eax,%eax
ffff800000104885:	74 16                	je     ffff80000010489d <number+0xe3>
ffff800000104887:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
ffff80000010488b:	75 06                	jne    ffff800000104893 <number+0xd9>
ffff80000010488d:	83 6d 98 02          	subl   $0x2,-0x68(%rbp)
ffff800000104891:	eb 0a                	jmp    ffff80000010489d <number+0xe3>
ffff800000104893:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
ffff800000104897:	75 04                	jne    ffff80000010489d <number+0xe3>
ffff800000104899:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
ffff80000010489d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff8000001048a4:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff8000001048a9:	75 48                	jne    ffff8000001048f3 <number+0x139>
ffff8000001048ab:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001048ae:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001048b1:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff8000001048b4:	48 98                	cltq   
ffff8000001048b6:	c6 44 05 b0 30       	movb   $0x30,-0x50(%rbp,%rax,1)
ffff8000001048bb:	eb 3d                	jmp    ffff8000001048fa <number+0x140>
ffff8000001048bd:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001048c1:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001048c6:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
ffff8000001048c9:	48 f7 f1             	div    %rcx
ffff8000001048cc:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001048d0:	89 55 e4             	mov    %edx,-0x1c(%rbp)
ffff8000001048d3:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff8000001048d6:	48 63 d0             	movslq %eax,%rdx
ffff8000001048d9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001048dd:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff8000001048e1:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001048e4:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001048e7:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff8000001048ea:	0f b6 11             	movzbl (%rcx),%edx
ffff8000001048ed:	48 98                	cltq   
ffff8000001048ef:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
ffff8000001048f3:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff8000001048f8:	75 c3                	jne    ffff8000001048bd <number+0x103>
ffff8000001048fa:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001048fd:	3b 45 94             	cmp    -0x6c(%rbp),%eax
ffff800000104900:	7e 06                	jle    ffff800000104908 <number+0x14e>
ffff800000104902:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104905:	89 45 94             	mov    %eax,-0x6c(%rbp)
ffff800000104908:	8b 45 94             	mov    -0x6c(%rbp),%eax
ffff80000010490b:	29 45 98             	sub    %eax,-0x68(%rbp)
ffff80000010490e:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104911:	83 e0 11             	and    $0x11,%eax
ffff800000104914:	85 c0                	test   %eax,%eax
ffff800000104916:	75 1e                	jne    ffff800000104936 <number+0x17c>
ffff800000104918:	eb 0f                	jmp    ffff800000104929 <number+0x16f>
ffff80000010491a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010491e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104922:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104926:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104929:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff80000010492c:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010492f:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff800000104932:	85 c0                	test   %eax,%eax
ffff800000104934:	7f e4                	jg     ffff80000010491a <number+0x160>
ffff800000104936:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
ffff80000010493a:	74 12                	je     ffff80000010494e <number+0x194>
ffff80000010493c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104940:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104944:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104948:	0f b6 55 ff          	movzbl -0x1(%rbp),%edx
ffff80000010494c:	88 10                	mov    %dl,(%rax)
ffff80000010494e:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104951:	83 e0 20             	and    $0x20,%eax
ffff800000104954:	85 c0                	test   %eax,%eax
ffff800000104956:	74 42                	je     ffff80000010499a <number+0x1e0>
ffff800000104958:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
ffff80000010495c:	75 11                	jne    ffff80000010496f <number+0x1b5>
ffff80000010495e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104962:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104966:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff80000010496a:	c6 00 30             	movb   $0x30,(%rax)
ffff80000010496d:	eb 2b                	jmp    ffff80000010499a <number+0x1e0>
ffff80000010496f:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
ffff800000104973:	75 25                	jne    ffff80000010499a <number+0x1e0>
ffff800000104975:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104979:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010497d:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104981:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104984:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104988:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010498c:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104990:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000104994:	0f b6 52 21          	movzbl 0x21(%rdx),%edx
ffff800000104998:	88 10                	mov    %dl,(%rax)
ffff80000010499a:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010499d:	83 e0 10             	and    $0x10,%eax
ffff8000001049a0:	85 c0                	test   %eax,%eax
ffff8000001049a2:	75 32                	jne    ffff8000001049d6 <number+0x21c>
ffff8000001049a4:	eb 12                	jmp    ffff8000001049b8 <number+0x1fe>
ffff8000001049a6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049aa:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049ae:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049b2:	0f b6 55 eb          	movzbl -0x15(%rbp),%edx
ffff8000001049b6:	88 10                	mov    %dl,(%rax)
ffff8000001049b8:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff8000001049bb:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001049be:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff8000001049c1:	85 c0                	test   %eax,%eax
ffff8000001049c3:	7f e1                	jg     ffff8000001049a6 <number+0x1ec>
ffff8000001049c5:	eb 0f                	jmp    ffff8000001049d6 <number+0x21c>
ffff8000001049c7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049cb:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049cf:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049d3:	c6 00 30             	movb   $0x30,(%rax)
ffff8000001049d6:	8b 45 94             	mov    -0x6c(%rbp),%eax
ffff8000001049d9:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001049dc:	89 55 94             	mov    %edx,-0x6c(%rbp)
ffff8000001049df:	39 45 ec             	cmp    %eax,-0x14(%rbp)
ffff8000001049e2:	7c e3                	jl     ffff8000001049c7 <number+0x20d>
ffff8000001049e4:	eb 19                	jmp    ffff8000001049ff <number+0x245>
ffff8000001049e6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049ea:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049ee:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049f2:	8b 55 ec             	mov    -0x14(%rbp),%edx
ffff8000001049f5:	48 63 d2             	movslq %edx,%rdx
ffff8000001049f8:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff8000001049fd:	88 10                	mov    %dl,(%rax)
ffff8000001049ff:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104a02:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104a05:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff800000104a08:	85 c0                	test   %eax,%eax
ffff800000104a0a:	7f da                	jg     ffff8000001049e6 <number+0x22c>
ffff800000104a0c:	eb 0f                	jmp    ffff800000104a1d <number+0x263>
ffff800000104a0e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104a12:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104a16:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104a1a:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104a1d:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff800000104a20:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104a23:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff800000104a26:	85 c0                	test   %eax,%eax
ffff800000104a28:	7f e4                	jg     ffff800000104a0e <number+0x254>
ffff800000104a2a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104a2e:	5d                   	pop    %rbp
ffff800000104a2f:	c3                   	retq   

ffff800000104a30 <vsprintf>:
ffff800000104a30:	55                   	push   %rbp
ffff800000104a31:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a34:	48 83 ec 58          	sub    $0x58,%rsp
ffff800000104a38:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
ffff800000104a3c:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
ffff800000104a40:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104a44:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104a48:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104a4c:	e9 b8 08 00 00       	jmpq   ffff800000105309 <vsprintf+0x8d9>
ffff800000104a51:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a55:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a58:	3c 25                	cmp    $0x25,%al
ffff800000104a5a:	74 1a                	je     ffff800000104a76 <vsprintf+0x46>
ffff800000104a5c:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff800000104a60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104a64:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104a68:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000104a6c:	0f b6 12             	movzbl (%rdx),%edx
ffff800000104a6f:	88 10                	mov    %dl,(%rax)
ffff800000104a71:	e9 87 08 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104a76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000104a7d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a81:	48 83 c0 01          	add    $0x1,%rax
ffff800000104a85:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104a89:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a8d:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a90:	0f be c0             	movsbl %al,%eax
ffff800000104a93:	83 e8 20             	sub    $0x20,%eax
ffff800000104a96:	83 f8 10             	cmp    $0x10,%eax
ffff800000104a99:	77 3a                	ja     ffff800000104ad5 <vsprintf+0xa5>
ffff800000104a9b:	89 c0                	mov    %eax,%eax
ffff800000104a9d:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000104aa4:	00 
ffff800000104aa5:	48 b8 60 1b 11 00 00 	movabs $0xffff800000111b60,%rax
ffff800000104aac:	80 ff ff 
ffff800000104aaf:	48 01 d0             	add    %rdx,%rax
ffff800000104ab2:	48 8b 00             	mov    (%rax),%rax
ffff800000104ab5:	ff e0                	jmpq   *%rax
ffff800000104ab7:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
ffff800000104abb:	eb c0                	jmp    ffff800000104a7d <vsprintf+0x4d>
ffff800000104abd:	83 4d ec 04          	orl    $0x4,-0x14(%rbp)
ffff800000104ac1:	eb ba                	jmp    ffff800000104a7d <vsprintf+0x4d>
ffff800000104ac3:	83 4d ec 08          	orl    $0x8,-0x14(%rbp)
ffff800000104ac7:	eb b4                	jmp    ffff800000104a7d <vsprintf+0x4d>
ffff800000104ac9:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
ffff800000104acd:	eb ae                	jmp    ffff800000104a7d <vsprintf+0x4d>
ffff800000104acf:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
ffff800000104ad3:	eb a8                	jmp    ffff800000104a7d <vsprintf+0x4d>
ffff800000104ad5:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
ffff800000104adc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104ae0:	0f b6 00             	movzbl (%rax),%eax
ffff800000104ae3:	3c 2f                	cmp    $0x2f,%al
ffff800000104ae5:	7e 23                	jle    ffff800000104b0a <vsprintf+0xda>
ffff800000104ae7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104aeb:	0f b6 00             	movzbl (%rax),%eax
ffff800000104aee:	3c 39                	cmp    $0x39,%al
ffff800000104af0:	7f 18                	jg     ffff800000104b0a <vsprintf+0xda>
ffff800000104af2:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000104af6:	48 89 c7             	mov    %rax,%rdi
ffff800000104af9:	48 b8 5a 47 10 00 00 	movabs $0xffff80000010475a,%rax
ffff800000104b00:	80 ff ff 
ffff800000104b03:	ff d0                	callq  *%rax
ffff800000104b05:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff800000104b08:	eb 6c                	jmp    ffff800000104b76 <vsprintf+0x146>
ffff800000104b0a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b0e:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b11:	3c 2a                	cmp    $0x2a,%al
ffff800000104b13:	75 61                	jne    ffff800000104b76 <vsprintf+0x146>
ffff800000104b15:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b19:	48 83 c0 01          	add    $0x1,%rax
ffff800000104b1d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104b21:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b25:	8b 00                	mov    (%rax),%eax
ffff800000104b27:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104b2a:	77 24                	ja     ffff800000104b50 <vsprintf+0x120>
ffff800000104b2c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b30:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104b34:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b38:	8b 00                	mov    (%rax),%eax
ffff800000104b3a:	89 c0                	mov    %eax,%eax
ffff800000104b3c:	48 01 d0             	add    %rdx,%rax
ffff800000104b3f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b43:	8b 12                	mov    (%rdx),%edx
ffff800000104b45:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104b48:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b4c:	89 0a                	mov    %ecx,(%rdx)
ffff800000104b4e:	eb 14                	jmp    ffff800000104b64 <vsprintf+0x134>
ffff800000104b50:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b54:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104b58:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104b5c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b60:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104b64:	8b 00                	mov    (%rax),%eax
ffff800000104b66:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff800000104b69:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104b6d:	79 07                	jns    ffff800000104b76 <vsprintf+0x146>
ffff800000104b6f:	f7 5d e8             	negl   -0x18(%rbp)
ffff800000104b72:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
ffff800000104b76:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
ffff800000104b7d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b81:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b84:	3c 2e                	cmp    $0x2e,%al
ffff800000104b86:	0f 85 a6 00 00 00    	jne    ffff800000104c32 <vsprintf+0x202>
ffff800000104b8c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b90:	48 83 c0 01          	add    $0x1,%rax
ffff800000104b94:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104b98:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b9c:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b9f:	3c 2f                	cmp    $0x2f,%al
ffff800000104ba1:	7e 23                	jle    ffff800000104bc6 <vsprintf+0x196>
ffff800000104ba3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104ba7:	0f b6 00             	movzbl (%rax),%eax
ffff800000104baa:	3c 39                	cmp    $0x39,%al
ffff800000104bac:	7f 18                	jg     ffff800000104bc6 <vsprintf+0x196>
ffff800000104bae:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000104bb2:	48 89 c7             	mov    %rax,%rdi
ffff800000104bb5:	48 b8 5a 47 10 00 00 	movabs $0xffff80000010475a,%rax
ffff800000104bbc:	80 ff ff 
ffff800000104bbf:	ff d0                	callq  *%rax
ffff800000104bc1:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104bc4:	eb 5f                	jmp    ffff800000104c25 <vsprintf+0x1f5>
ffff800000104bc6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104bca:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bcd:	3c 2a                	cmp    $0x2a,%al
ffff800000104bcf:	75 54                	jne    ffff800000104c25 <vsprintf+0x1f5>
ffff800000104bd1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104bd5:	48 83 c0 01          	add    $0x1,%rax
ffff800000104bd9:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104bdd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104be1:	8b 00                	mov    (%rax),%eax
ffff800000104be3:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104be6:	77 24                	ja     ffff800000104c0c <vsprintf+0x1dc>
ffff800000104be8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104bec:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104bf0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104bf4:	8b 00                	mov    (%rax),%eax
ffff800000104bf6:	89 c0                	mov    %eax,%eax
ffff800000104bf8:	48 01 d0             	add    %rdx,%rax
ffff800000104bfb:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104bff:	8b 12                	mov    (%rdx),%edx
ffff800000104c01:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104c04:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104c08:	89 0a                	mov    %ecx,(%rdx)
ffff800000104c0a:	eb 14                	jmp    ffff800000104c20 <vsprintf+0x1f0>
ffff800000104c0c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104c10:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104c14:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104c18:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104c1c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104c20:	8b 00                	mov    (%rax),%eax
ffff800000104c22:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104c25:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
ffff800000104c29:	79 07                	jns    ffff800000104c32 <vsprintf+0x202>
ffff800000104c2b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000104c32:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
ffff800000104c39:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c3d:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c40:	3c 68                	cmp    $0x68,%al
ffff800000104c42:	74 21                	je     ffff800000104c65 <vsprintf+0x235>
ffff800000104c44:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c48:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c4b:	3c 6c                	cmp    $0x6c,%al
ffff800000104c4d:	74 16                	je     ffff800000104c65 <vsprintf+0x235>
ffff800000104c4f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c53:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c56:	3c 4c                	cmp    $0x4c,%al
ffff800000104c58:	74 0b                	je     ffff800000104c65 <vsprintf+0x235>
ffff800000104c5a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c5e:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c61:	3c 5a                	cmp    $0x5a,%al
ffff800000104c63:	75 19                	jne    ffff800000104c7e <vsprintf+0x24e>
ffff800000104c65:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c69:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c6c:	0f be c0             	movsbl %al,%eax
ffff800000104c6f:	89 45 d8             	mov    %eax,-0x28(%rbp)
ffff800000104c72:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c76:	48 83 c0 01          	add    $0x1,%rax
ffff800000104c7a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104c7e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c82:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c85:	0f be c0             	movsbl %al,%eax
ffff800000104c88:	83 e8 25             	sub    $0x25,%eax
ffff800000104c8b:	83 f8 53             	cmp    $0x53,%eax
ffff800000104c8e:	0f 87 2b 06 00 00    	ja     ffff8000001052bf <vsprintf+0x88f>
ffff800000104c94:	89 c0                	mov    %eax,%eax
ffff800000104c96:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000104c9d:	00 
ffff800000104c9e:	48 b8 e8 1b 11 00 00 	movabs $0xffff800000111be8,%rax
ffff800000104ca5:	80 ff ff 
ffff800000104ca8:	48 01 d0             	add    %rdx,%rax
ffff800000104cab:	48 8b 00             	mov    (%rax),%rax
ffff800000104cae:	ff e0                	jmpq   *%rax
ffff800000104cb0:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104cb3:	83 e0 10             	and    $0x10,%eax
ffff800000104cb6:	85 c0                	test   %eax,%eax
ffff800000104cb8:	75 1b                	jne    ffff800000104cd5 <vsprintf+0x2a5>
ffff800000104cba:	eb 0f                	jmp    ffff800000104ccb <vsprintf+0x29b>
ffff800000104cbc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104cc0:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104cc4:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104cc8:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104ccb:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
ffff800000104ccf:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104cd3:	7f e7                	jg     ffff800000104cbc <vsprintf+0x28c>
ffff800000104cd5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104cd9:	8b 00                	mov    (%rax),%eax
ffff800000104cdb:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104cde:	77 24                	ja     ffff800000104d04 <vsprintf+0x2d4>
ffff800000104ce0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ce4:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104ce8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104cec:	8b 00                	mov    (%rax),%eax
ffff800000104cee:	89 c0                	mov    %eax,%eax
ffff800000104cf0:	48 01 d0             	add    %rdx,%rax
ffff800000104cf3:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104cf7:	8b 12                	mov    (%rdx),%edx
ffff800000104cf9:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104cfc:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d00:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d02:	eb 14                	jmp    ffff800000104d18 <vsprintf+0x2e8>
ffff800000104d04:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d08:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d0c:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d10:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d14:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d18:	8b 08                	mov    (%rax),%ecx
ffff800000104d1a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104d1e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d22:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104d26:	89 ca                	mov    %ecx,%edx
ffff800000104d28:	88 10                	mov    %dl,(%rax)
ffff800000104d2a:	eb 0f                	jmp    ffff800000104d3b <vsprintf+0x30b>
ffff800000104d2c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104d30:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d34:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104d38:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104d3b:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
ffff800000104d3f:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104d43:	7f e7                	jg     ffff800000104d2c <vsprintf+0x2fc>
ffff800000104d45:	e9 b3 05 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104d4a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d4e:	8b 00                	mov    (%rax),%eax
ffff800000104d50:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d53:	77 24                	ja     ffff800000104d79 <vsprintf+0x349>
ffff800000104d55:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d59:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d5d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d61:	8b 00                	mov    (%rax),%eax
ffff800000104d63:	89 c0                	mov    %eax,%eax
ffff800000104d65:	48 01 d0             	add    %rdx,%rax
ffff800000104d68:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d6c:	8b 12                	mov    (%rdx),%edx
ffff800000104d6e:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d71:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d75:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d77:	eb 14                	jmp    ffff800000104d8d <vsprintf+0x35d>
ffff800000104d79:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d7d:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d81:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d85:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d89:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d8d:	48 8b 00             	mov    (%rax),%rax
ffff800000104d90:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104d94:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
ffff800000104d99:	75 08                	jne    ffff800000104da3 <vsprintf+0x373>
ffff800000104d9b:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000104da2:	00 
ffff800000104da3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104da7:	48 89 c7             	mov    %rax,%rdi
ffff800000104daa:	48 b8 3c 46 10 00 00 	movabs $0xffff80000010463c,%rax
ffff800000104db1:	80 ff ff 
ffff800000104db4:	ff d0                	callq  *%rax
ffff800000104db6:	89 45 e0             	mov    %eax,-0x20(%rbp)
ffff800000104db9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
ffff800000104dbd:	79 08                	jns    ffff800000104dc7 <vsprintf+0x397>
ffff800000104dbf:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000104dc2:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104dc5:	eb 0e                	jmp    ffff800000104dd5 <vsprintf+0x3a5>
ffff800000104dc7:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000104dca:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000104dcd:	7e 06                	jle    ffff800000104dd5 <vsprintf+0x3a5>
ffff800000104dcf:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000104dd2:	89 45 e0             	mov    %eax,-0x20(%rbp)
ffff800000104dd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104dd8:	83 e0 10             	and    $0x10,%eax
ffff800000104ddb:	85 c0                	test   %eax,%eax
ffff800000104ddd:	75 1f                	jne    ffff800000104dfe <vsprintf+0x3ce>
ffff800000104ddf:	eb 0f                	jmp    ffff800000104df0 <vsprintf+0x3c0>
ffff800000104de1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104de5:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104de9:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104ded:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104df0:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000104df3:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104df6:	89 55 e8             	mov    %edx,-0x18(%rbp)
ffff800000104df9:	39 45 e0             	cmp    %eax,-0x20(%rbp)
ffff800000104dfc:	7c e3                	jl     ffff800000104de1 <vsprintf+0x3b1>
ffff800000104dfe:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000104e05:	eb 21                	jmp    ffff800000104e28 <vsprintf+0x3f8>
ffff800000104e07:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000104e0b:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000104e0f:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104e13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104e17:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104e1b:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000104e1f:	0f b6 12             	movzbl (%rdx),%edx
ffff800000104e22:	88 10                	mov    %dl,(%rax)
ffff800000104e24:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000104e28:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000104e2b:	3b 45 e0             	cmp    -0x20(%rbp),%eax
ffff800000104e2e:	7c d7                	jl     ffff800000104e07 <vsprintf+0x3d7>
ffff800000104e30:	eb 0f                	jmp    ffff800000104e41 <vsprintf+0x411>
ffff800000104e32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104e36:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e3a:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104e3e:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104e41:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000104e44:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104e47:	89 55 e8             	mov    %edx,-0x18(%rbp)
ffff800000104e4a:	39 45 e0             	cmp    %eax,-0x20(%rbp)
ffff800000104e4d:	7c e3                	jl     ffff800000104e32 <vsprintf+0x402>
ffff800000104e4f:	e9 a9 04 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104e54:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff800000104e58:	75 7e                	jne    ffff800000104ed8 <vsprintf+0x4a8>
ffff800000104e5a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e5e:	8b 00                	mov    (%rax),%eax
ffff800000104e60:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e63:	77 24                	ja     ffff800000104e89 <vsprintf+0x459>
ffff800000104e65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e69:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e6d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e71:	8b 00                	mov    (%rax),%eax
ffff800000104e73:	89 c0                	mov    %eax,%eax
ffff800000104e75:	48 01 d0             	add    %rdx,%rax
ffff800000104e78:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104e7c:	8b 12                	mov    (%rdx),%edx
ffff800000104e7e:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e81:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104e85:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e87:	eb 14                	jmp    ffff800000104e9d <vsprintf+0x46d>
ffff800000104e89:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e8d:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e91:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104e95:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104e99:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104e9d:	48 8b 00             	mov    (%rax),%rax
ffff800000104ea0:	48 89 c7             	mov    %rax,%rdi
ffff800000104ea3:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104ea6:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104ea9:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104eac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104eb0:	41 89 f1             	mov    %esi,%r9d
ffff800000104eb3:	41 89 c8             	mov    %ecx,%r8d
ffff800000104eb6:	89 d1                	mov    %edx,%ecx
ffff800000104eb8:	ba 08 00 00 00       	mov    $0x8,%edx
ffff800000104ebd:	48 89 fe             	mov    %rdi,%rsi
ffff800000104ec0:	48 89 c7             	mov    %rax,%rdi
ffff800000104ec3:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff800000104eca:	80 ff ff 
ffff800000104ecd:	ff d0                	callq  *%rax
ffff800000104ecf:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104ed3:	e9 25 04 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104ed8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104edc:	8b 00                	mov    (%rax),%eax
ffff800000104ede:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104ee1:	77 24                	ja     ffff800000104f07 <vsprintf+0x4d7>
ffff800000104ee3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ee7:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104eeb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104eef:	8b 00                	mov    (%rax),%eax
ffff800000104ef1:	89 c0                	mov    %eax,%eax
ffff800000104ef3:	48 01 d0             	add    %rdx,%rax
ffff800000104ef6:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104efa:	8b 12                	mov    (%rdx),%edx
ffff800000104efc:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104eff:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f03:	89 0a                	mov    %ecx,(%rdx)
ffff800000104f05:	eb 14                	jmp    ffff800000104f1b <vsprintf+0x4eb>
ffff800000104f07:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f0b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104f0f:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104f13:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f17:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104f1b:	8b 00                	mov    (%rax),%eax
ffff800000104f1d:	89 c7                	mov    %eax,%edi
ffff800000104f1f:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104f22:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104f25:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104f28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104f2c:	41 89 f1             	mov    %esi,%r9d
ffff800000104f2f:	41 89 c8             	mov    %ecx,%r8d
ffff800000104f32:	89 d1                	mov    %edx,%ecx
ffff800000104f34:	ba 08 00 00 00       	mov    $0x8,%edx
ffff800000104f39:	48 89 fe             	mov    %rdi,%rsi
ffff800000104f3c:	48 89 c7             	mov    %rax,%rdi
ffff800000104f3f:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff800000104f46:	80 ff ff 
ffff800000104f49:	ff d0                	callq  *%rax
ffff800000104f4b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104f4f:	e9 a9 03 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104f54:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
ffff800000104f58:	75 0b                	jne    ffff800000104f65 <vsprintf+0x535>
ffff800000104f5a:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%rbp)
ffff800000104f61:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
ffff800000104f65:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f69:	8b 00                	mov    (%rax),%eax
ffff800000104f6b:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104f6e:	77 24                	ja     ffff800000104f94 <vsprintf+0x564>
ffff800000104f70:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f74:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104f78:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f7c:	8b 00                	mov    (%rax),%eax
ffff800000104f7e:	89 c0                	mov    %eax,%eax
ffff800000104f80:	48 01 d0             	add    %rdx,%rax
ffff800000104f83:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f87:	8b 12                	mov    (%rdx),%edx
ffff800000104f89:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104f8c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f90:	89 0a                	mov    %ecx,(%rdx)
ffff800000104f92:	eb 14                	jmp    ffff800000104fa8 <vsprintf+0x578>
ffff800000104f94:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f98:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104f9c:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104fa0:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104fa4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104fa8:	48 8b 00             	mov    (%rax),%rax
ffff800000104fab:	48 89 c7             	mov    %rax,%rdi
ffff800000104fae:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104fb1:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104fb4:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104fb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104fbb:	41 89 f1             	mov    %esi,%r9d
ffff800000104fbe:	41 89 c8             	mov    %ecx,%r8d
ffff800000104fc1:	89 d1                	mov    %edx,%ecx
ffff800000104fc3:	ba 10 00 00 00       	mov    $0x10,%edx
ffff800000104fc8:	48 89 fe             	mov    %rdi,%rsi
ffff800000104fcb:	48 89 c7             	mov    %rax,%rdi
ffff800000104fce:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff800000104fd5:	80 ff ff 
ffff800000104fd8:	ff d0                	callq  *%rax
ffff800000104fda:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104fde:	e9 1a 03 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000104fe3:	83 4d ec 40          	orl    $0x40,-0x14(%rbp)
ffff800000104fe7:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff800000104feb:	75 7e                	jne    ffff80000010506b <vsprintf+0x63b>
ffff800000104fed:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ff1:	8b 00                	mov    (%rax),%eax
ffff800000104ff3:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104ff6:	77 24                	ja     ffff80000010501c <vsprintf+0x5ec>
ffff800000104ff8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ffc:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105000:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105004:	8b 00                	mov    (%rax),%eax
ffff800000105006:	89 c0                	mov    %eax,%eax
ffff800000105008:	48 01 d0             	add    %rdx,%rax
ffff80000010500b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010500f:	8b 12                	mov    (%rdx),%edx
ffff800000105011:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105014:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105018:	89 0a                	mov    %ecx,(%rdx)
ffff80000010501a:	eb 14                	jmp    ffff800000105030 <vsprintf+0x600>
ffff80000010501c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105020:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105024:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000105028:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010502c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105030:	48 8b 00             	mov    (%rax),%rax
ffff800000105033:	48 89 c7             	mov    %rax,%rdi
ffff800000105036:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000105039:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff80000010503c:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff80000010503f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105043:	41 89 f1             	mov    %esi,%r9d
ffff800000105046:	41 89 c8             	mov    %ecx,%r8d
ffff800000105049:	89 d1                	mov    %edx,%ecx
ffff80000010504b:	ba 10 00 00 00       	mov    $0x10,%edx
ffff800000105050:	48 89 fe             	mov    %rdi,%rsi
ffff800000105053:	48 89 c7             	mov    %rax,%rdi
ffff800000105056:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff80000010505d:	80 ff ff 
ffff800000105060:	ff d0                	callq  *%rax
ffff800000105062:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105066:	e9 92 02 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff80000010506b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010506f:	8b 00                	mov    (%rax),%eax
ffff800000105071:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105074:	77 24                	ja     ffff80000010509a <vsprintf+0x66a>
ffff800000105076:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010507a:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff80000010507e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105082:	8b 00                	mov    (%rax),%eax
ffff800000105084:	89 c0                	mov    %eax,%eax
ffff800000105086:	48 01 d0             	add    %rdx,%rax
ffff800000105089:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010508d:	8b 12                	mov    (%rdx),%edx
ffff80000010508f:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105092:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105096:	89 0a                	mov    %ecx,(%rdx)
ffff800000105098:	eb 14                	jmp    ffff8000001050ae <vsprintf+0x67e>
ffff80000010509a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010509e:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001050a2:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff8000001050a6:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001050aa:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff8000001050ae:	8b 00                	mov    (%rax),%eax
ffff8000001050b0:	89 c7                	mov    %eax,%edi
ffff8000001050b2:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff8000001050b5:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff8000001050b8:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff8000001050bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001050bf:	41 89 f1             	mov    %esi,%r9d
ffff8000001050c2:	41 89 c8             	mov    %ecx,%r8d
ffff8000001050c5:	89 d1                	mov    %edx,%ecx
ffff8000001050c7:	ba 10 00 00 00       	mov    $0x10,%edx
ffff8000001050cc:	48 89 fe             	mov    %rdi,%rsi
ffff8000001050cf:	48 89 c7             	mov    %rax,%rdi
ffff8000001050d2:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff8000001050d9:	80 ff ff 
ffff8000001050dc:	ff d0                	callq  *%rax
ffff8000001050de:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001050e2:	e9 16 02 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff8000001050e7:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
ffff8000001050eb:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff8000001050ef:	75 7e                	jne    ffff80000010516f <vsprintf+0x73f>
ffff8000001050f1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001050f5:	8b 00                	mov    (%rax),%eax
ffff8000001050f7:	83 f8 2f             	cmp    $0x2f,%eax
ffff8000001050fa:	77 24                	ja     ffff800000105120 <vsprintf+0x6f0>
ffff8000001050fc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105100:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105104:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105108:	8b 00                	mov    (%rax),%eax
ffff80000010510a:	89 c0                	mov    %eax,%eax
ffff80000010510c:	48 01 d0             	add    %rdx,%rax
ffff80000010510f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105113:	8b 12                	mov    (%rdx),%edx
ffff800000105115:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105118:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010511c:	89 0a                	mov    %ecx,(%rdx)
ffff80000010511e:	eb 14                	jmp    ffff800000105134 <vsprintf+0x704>
ffff800000105120:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105124:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105128:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff80000010512c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105130:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105134:	48 8b 00             	mov    (%rax),%rax
ffff800000105137:	48 89 c7             	mov    %rax,%rdi
ffff80000010513a:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff80000010513d:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000105140:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000105143:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105147:	41 89 f1             	mov    %esi,%r9d
ffff80000010514a:	41 89 c8             	mov    %ecx,%r8d
ffff80000010514d:	89 d1                	mov    %edx,%ecx
ffff80000010514f:	ba 0a 00 00 00       	mov    $0xa,%edx
ffff800000105154:	48 89 fe             	mov    %rdi,%rsi
ffff800000105157:	48 89 c7             	mov    %rax,%rdi
ffff80000010515a:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff800000105161:	80 ff ff 
ffff800000105164:	ff d0                	callq  *%rax
ffff800000105166:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010516a:	e9 8e 01 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff80000010516f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105173:	8b 00                	mov    (%rax),%eax
ffff800000105175:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105178:	77 24                	ja     ffff80000010519e <vsprintf+0x76e>
ffff80000010517a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010517e:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105182:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105186:	8b 00                	mov    (%rax),%eax
ffff800000105188:	89 c0                	mov    %eax,%eax
ffff80000010518a:	48 01 d0             	add    %rdx,%rax
ffff80000010518d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105191:	8b 12                	mov    (%rdx),%edx
ffff800000105193:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105196:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010519a:	89 0a                	mov    %ecx,(%rdx)
ffff80000010519c:	eb 14                	jmp    ffff8000001051b2 <vsprintf+0x782>
ffff80000010519e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001051a2:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001051a6:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff8000001051aa:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001051ae:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff8000001051b2:	8b 00                	mov    (%rax),%eax
ffff8000001051b4:	89 c7                	mov    %eax,%edi
ffff8000001051b6:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff8000001051b9:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff8000001051bc:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff8000001051bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001051c3:	41 89 f1             	mov    %esi,%r9d
ffff8000001051c6:	41 89 c8             	mov    %ecx,%r8d
ffff8000001051c9:	89 d1                	mov    %edx,%ecx
ffff8000001051cb:	ba 0a 00 00 00       	mov    $0xa,%edx
ffff8000001051d0:	48 89 fe             	mov    %rdi,%rsi
ffff8000001051d3:	48 89 c7             	mov    %rax,%rdi
ffff8000001051d6:	48 b8 ba 47 10 00 00 	movabs $0xffff8000001047ba,%rax
ffff8000001051dd:	80 ff ff 
ffff8000001051e0:	ff d0                	callq  *%rax
ffff8000001051e2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001051e6:	e9 12 01 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff8000001051eb:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff8000001051ef:	75 61                	jne    ffff800000105252 <vsprintf+0x822>
ffff8000001051f1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001051f5:	8b 00                	mov    (%rax),%eax
ffff8000001051f7:	83 f8 2f             	cmp    $0x2f,%eax
ffff8000001051fa:	77 24                	ja     ffff800000105220 <vsprintf+0x7f0>
ffff8000001051fc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105200:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105204:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105208:	8b 00                	mov    (%rax),%eax
ffff80000010520a:	89 c0                	mov    %eax,%eax
ffff80000010520c:	48 01 d0             	add    %rdx,%rax
ffff80000010520f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105213:	8b 12                	mov    (%rdx),%edx
ffff800000105215:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105218:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010521c:	89 0a                	mov    %ecx,(%rdx)
ffff80000010521e:	eb 14                	jmp    ffff800000105234 <vsprintf+0x804>
ffff800000105220:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105224:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105228:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff80000010522c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105230:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105234:	48 8b 00             	mov    (%rax),%rax
ffff800000105237:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff80000010523b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010523f:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff800000105243:	48 89 c2             	mov    %rax,%rdx
ffff800000105246:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010524a:	48 89 10             	mov    %rdx,(%rax)
ffff80000010524d:	e9 ab 00 00 00       	jmpq   ffff8000001052fd <vsprintf+0x8cd>
ffff800000105252:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105256:	8b 00                	mov    (%rax),%eax
ffff800000105258:	83 f8 2f             	cmp    $0x2f,%eax
ffff80000010525b:	77 24                	ja     ffff800000105281 <vsprintf+0x851>
ffff80000010525d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105261:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105265:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105269:	8b 00                	mov    (%rax),%eax
ffff80000010526b:	89 c0                	mov    %eax,%eax
ffff80000010526d:	48 01 d0             	add    %rdx,%rax
ffff800000105270:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105274:	8b 12                	mov    (%rdx),%edx
ffff800000105276:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105279:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010527d:	89 0a                	mov    %ecx,(%rdx)
ffff80000010527f:	eb 14                	jmp    ffff800000105295 <vsprintf+0x865>
ffff800000105281:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105285:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105289:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff80000010528d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105291:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105295:	48 8b 00             	mov    (%rax),%rax
ffff800000105298:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff80000010529c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052a0:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff8000001052a4:	89 c2                	mov    %eax,%edx
ffff8000001052a6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001052aa:	89 10                	mov    %edx,(%rax)
ffff8000001052ac:	eb 4f                	jmp    ffff8000001052fd <vsprintf+0x8cd>
ffff8000001052ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052b2:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001052b6:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff8000001052ba:	c6 00 25             	movb   $0x25,(%rax)
ffff8000001052bd:	eb 3e                	jmp    ffff8000001052fd <vsprintf+0x8cd>
ffff8000001052bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052c3:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001052c7:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff8000001052cb:	c6 00 25             	movb   $0x25,(%rax)
ffff8000001052ce:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001052d2:	0f b6 00             	movzbl (%rax),%eax
ffff8000001052d5:	84 c0                	test   %al,%al
ffff8000001052d7:	74 17                	je     ffff8000001052f0 <vsprintf+0x8c0>
ffff8000001052d9:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff8000001052dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052e1:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff8000001052e5:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff8000001052e9:	0f b6 12             	movzbl (%rdx),%edx
ffff8000001052ec:	88 10                	mov    %dl,(%rax)
ffff8000001052ee:	eb 0c                	jmp    ffff8000001052fc <vsprintf+0x8cc>
ffff8000001052f0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001052f4:	48 83 e8 01          	sub    $0x1,%rax
ffff8000001052f8:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001052fc:	90                   	nop
ffff8000001052fd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000105301:	48 83 c0 01          	add    $0x1,%rax
ffff800000105305:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000105309:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010530d:	0f b6 00             	movzbl (%rax),%eax
ffff800000105310:	84 c0                	test   %al,%al
ffff800000105312:	0f 85 39 f7 ff ff    	jne    ffff800000104a51 <vsprintf+0x21>
ffff800000105318:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010531c:	c6 00 00             	movb   $0x0,(%rax)
ffff80000010531f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105323:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff800000105327:	c9                   	leaveq 
ffff800000105328:	c3                   	retq   

ffff800000105329 <color_printk>:
ffff800000105329:	55                   	push   %rbp
ffff80000010532a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010532d:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
ffff800000105334:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff80000010533a:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff800000105340:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000105347:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
ffff80000010534e:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
ffff800000105355:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
ffff80000010535c:	84 c0                	test   %al,%al
ffff80000010535e:	74 20                	je     ffff800000105380 <color_printk+0x57>
ffff800000105360:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
ffff800000105364:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
ffff800000105368:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
ffff80000010536c:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
ffff800000105370:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
ffff800000105374:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
ffff800000105378:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
ffff80000010537c:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
ffff800000105380:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%rbp)
ffff800000105387:	00 00 00 
ffff80000010538a:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
ffff800000105391:	00 00 00 
ffff800000105394:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%rbp)
ffff80000010539b:	00 00 00 
ffff80000010539e:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
ffff8000001053a5:	00 00 00 
ffff8000001053a8:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
ffff8000001053af:	00 00 00 
ffff8000001053b2:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff8000001053b6:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff8000001053bd:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
ffff8000001053c4:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
ffff8000001053cb:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
ffff8000001053d2:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff8000001053d9:	48 89 c6             	mov    %rax,%rsi
ffff8000001053dc:	48 bf 00 80 12 00 00 	movabs $0xffff800000128000,%rdi
ffff8000001053e3:	80 ff ff 
ffff8000001053e6:	48 b8 30 4a 10 00 00 	movabs $0xffff800000104a30,%rax
ffff8000001053ed:	80 ff ff 
ffff8000001053f0:	ff d0                	callq  *%rax
ffff8000001053f2:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%rbp)
ffff8000001053f8:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
ffff8000001053ff:	00 00 00 
ffff800000105402:	e9 24 04 00 00       	jmpq   ffff80000010582b <color_printk+0x502>
ffff800000105407:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
ffff80000010540e:	7e 0c                	jle    ffff80000010541c <color_printk+0xf3>
ffff800000105410:	83 ad 4c ff ff ff 01 	subl   $0x1,-0xb4(%rbp)
ffff800000105417:	e9 17 02 00 00       	jmpq   ffff800000105633 <color_printk+0x30a>
ffff80000010541c:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff800000105422:	48 98                	cltq   
ffff800000105424:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff80000010542b:	80 ff ff 
ffff80000010542e:	48 01 d0             	add    %rdx,%rax
ffff800000105431:	0f b6 00             	movzbl (%rax),%eax
ffff800000105434:	3c 0a                	cmp    $0xa,%al
ffff800000105436:	75 33                	jne    ffff80000010546b <color_printk+0x142>
ffff800000105438:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010543f:	80 ff ff 
ffff800000105442:	8b 40 0c             	mov    0xc(%rax),%eax
ffff800000105445:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105448:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010544f:	80 ff ff 
ffff800000105452:	89 50 0c             	mov    %edx,0xc(%rax)
ffff800000105455:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010545c:	80 ff ff 
ffff80000010545f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffff800000105466:	e9 1f 03 00 00       	jmpq   ffff80000010578a <color_printk+0x461>
ffff80000010546b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff800000105471:	48 98                	cltq   
ffff800000105473:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff80000010547a:	80 ff ff 
ffff80000010547d:	48 01 d0             	add    %rdx,%rax
ffff800000105480:	0f b6 00             	movzbl (%rax),%eax
ffff800000105483:	3c 08                	cmp    $0x8,%al
ffff800000105485:	0f 85 5c 01 00 00    	jne    ffff8000001055e7 <color_printk+0x2be>
ffff80000010548b:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105492:	80 ff ff 
ffff800000105495:	8b 40 08             	mov    0x8(%rax),%eax
ffff800000105498:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010549b:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054a2:	80 ff ff 
ffff8000001054a5:	89 50 08             	mov    %edx,0x8(%rax)
ffff8000001054a8:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054af:	80 ff ff 
ffff8000001054b2:	8b 40 08             	mov    0x8(%rax),%eax
ffff8000001054b5:	85 c0                	test   %eax,%eax
ffff8000001054b7:	0f 89 a7 00 00 00    	jns    ffff800000105564 <color_printk+0x23b>
ffff8000001054bd:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054c4:	80 ff ff 
ffff8000001054c7:	8b 00                	mov    (%rax),%eax
ffff8000001054c9:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001054d0:	80 ff ff 
ffff8000001054d3:	8b 72 10             	mov    0x10(%rdx),%esi
ffff8000001054d6:	99                   	cltd   
ffff8000001054d7:	f7 fe                	idiv   %esi
ffff8000001054d9:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001054dc:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054e3:	80 ff ff 
ffff8000001054e6:	8b 40 10             	mov    0x10(%rax),%eax
ffff8000001054e9:	0f af c2             	imul   %edx,%eax
ffff8000001054ec:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001054f3:	80 ff ff 
ffff8000001054f6:	89 42 08             	mov    %eax,0x8(%rdx)
ffff8000001054f9:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105500:	80 ff ff 
ffff800000105503:	8b 40 0c             	mov    0xc(%rax),%eax
ffff800000105506:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105509:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105510:	80 ff ff 
ffff800000105513:	89 50 0c             	mov    %edx,0xc(%rax)
ffff800000105516:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010551d:	80 ff ff 
ffff800000105520:	8b 40 0c             	mov    0xc(%rax),%eax
ffff800000105523:	85 c0                	test   %eax,%eax
ffff800000105525:	79 3d                	jns    ffff800000105564 <color_printk+0x23b>
ffff800000105527:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010552e:	80 ff ff 
ffff800000105531:	8b 40 04             	mov    0x4(%rax),%eax
ffff800000105534:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff80000010553b:	80 ff ff 
ffff80000010553e:	8b 7a 14             	mov    0x14(%rdx),%edi
ffff800000105541:	99                   	cltd   
ffff800000105542:	f7 ff                	idiv   %edi
ffff800000105544:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105547:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010554e:	80 ff ff 
ffff800000105551:	8b 40 14             	mov    0x14(%rax),%eax
ffff800000105554:	0f af c2             	imul   %edx,%eax
ffff800000105557:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff80000010555e:	80 ff ff 
ffff800000105561:	89 42 0c             	mov    %eax,0xc(%rdx)
ffff800000105564:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010556b:	80 ff ff 
ffff80000010556e:	8b 50 0c             	mov    0xc(%rax),%edx
ffff800000105571:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105578:	80 ff ff 
ffff80000010557b:	8b 40 14             	mov    0x14(%rax),%eax
ffff80000010557e:	89 d1                	mov    %edx,%ecx
ffff800000105580:	0f af c8             	imul   %eax,%ecx
ffff800000105583:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010558a:	80 ff ff 
ffff80000010558d:	8b 50 08             	mov    0x8(%rax),%edx
ffff800000105590:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105597:	80 ff ff 
ffff80000010559a:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010559d:	0f af d0             	imul   %eax,%edx
ffff8000001055a0:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001055a7:	80 ff ff 
ffff8000001055aa:	8b 30                	mov    (%rax),%esi
ffff8000001055ac:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001055b3:	80 ff ff 
ffff8000001055b6:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001055ba:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
ffff8000001055c1:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
ffff8000001055c7:	6a 20                	pushq  $0x20
ffff8000001055c9:	45 89 c1             	mov    %r8d,%r9d
ffff8000001055cc:	41 89 f8             	mov    %edi,%r8d
ffff8000001055cf:	48 89 c7             	mov    %rax,%rdi
ffff8000001055d2:	48 b8 6b 46 10 00 00 	movabs $0xffff80000010466b,%rax
ffff8000001055d9:	80 ff ff 
ffff8000001055dc:	ff d0                	callq  *%rax
ffff8000001055de:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001055e2:	e9 a3 01 00 00       	jmpq   ffff80000010578a <color_printk+0x461>
ffff8000001055e7:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff8000001055ed:	48 98                	cltq   
ffff8000001055ef:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff8000001055f6:	80 ff ff 
ffff8000001055f9:	48 01 d0             	add    %rdx,%rax
ffff8000001055fc:	0f b6 00             	movzbl (%rax),%eax
ffff8000001055ff:	3c 09                	cmp    $0x9,%al
ffff800000105601:	0f 85 d3 00 00 00    	jne    ffff8000001056da <color_printk+0x3b1>
ffff800000105607:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010560e:	80 ff ff 
ffff800000105611:	8b 40 08             	mov    0x8(%rax),%eax
ffff800000105614:	83 c0 08             	add    $0x8,%eax
ffff800000105617:	83 e0 f8             	and    $0xfffffff8,%eax
ffff80000010561a:	89 c2                	mov    %eax,%edx
ffff80000010561c:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105623:	80 ff ff 
ffff800000105626:	8b 48 08             	mov    0x8(%rax),%ecx
ffff800000105629:	89 d0                	mov    %edx,%eax
ffff80000010562b:	29 c8                	sub    %ecx,%eax
ffff80000010562d:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%rbp)
ffff800000105633:	83 ad 48 ff ff ff 01 	subl   $0x1,-0xb8(%rbp)
ffff80000010563a:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105641:	80 ff ff 
ffff800000105644:	8b 50 0c             	mov    0xc(%rax),%edx
ffff800000105647:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010564e:	80 ff ff 
ffff800000105651:	8b 40 14             	mov    0x14(%rax),%eax
ffff800000105654:	89 d1                	mov    %edx,%ecx
ffff800000105656:	0f af c8             	imul   %eax,%ecx
ffff800000105659:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105660:	80 ff ff 
ffff800000105663:	8b 50 08             	mov    0x8(%rax),%edx
ffff800000105666:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010566d:	80 ff ff 
ffff800000105670:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000105673:	0f af d0             	imul   %eax,%edx
ffff800000105676:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010567d:	80 ff ff 
ffff800000105680:	8b 30                	mov    (%rax),%esi
ffff800000105682:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105689:	80 ff ff 
ffff80000010568c:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000105690:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
ffff800000105697:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
ffff80000010569d:	6a 20                	pushq  $0x20
ffff80000010569f:	45 89 c1             	mov    %r8d,%r9d
ffff8000001056a2:	41 89 f8             	mov    %edi,%r8d
ffff8000001056a5:	48 89 c7             	mov    %rax,%rdi
ffff8000001056a8:	48 b8 6b 46 10 00 00 	movabs $0xffff80000010466b,%rax
ffff8000001056af:	80 ff ff 
ffff8000001056b2:	ff d0                	callq  *%rax
ffff8000001056b4:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001056b8:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001056bf:	80 ff ff 
ffff8000001056c2:	8b 40 08             	mov    0x8(%rax),%eax
ffff8000001056c5:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001056c8:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001056cf:	80 ff ff 
ffff8000001056d2:	89 50 08             	mov    %edx,0x8(%rax)
ffff8000001056d5:	e9 b0 00 00 00       	jmpq   ffff80000010578a <color_printk+0x461>
ffff8000001056da:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff8000001056e0:	48 98                	cltq   
ffff8000001056e2:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff8000001056e9:	80 ff ff 
ffff8000001056ec:	48 01 d0             	add    %rdx,%rax
ffff8000001056ef:	0f b6 00             	movzbl (%rax),%eax
ffff8000001056f2:	0f b6 f8             	movzbl %al,%edi
ffff8000001056f5:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001056fc:	80 ff ff 
ffff8000001056ff:	8b 50 0c             	mov    0xc(%rax),%edx
ffff800000105702:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105709:	80 ff ff 
ffff80000010570c:	8b 40 14             	mov    0x14(%rax),%eax
ffff80000010570f:	89 d1                	mov    %edx,%ecx
ffff800000105711:	0f af c8             	imul   %eax,%ecx
ffff800000105714:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010571b:	80 ff ff 
ffff80000010571e:	8b 50 08             	mov    0x8(%rax),%edx
ffff800000105721:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105728:	80 ff ff 
ffff80000010572b:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010572e:	0f af d0             	imul   %eax,%edx
ffff800000105731:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105738:	80 ff ff 
ffff80000010573b:	8b 30                	mov    (%rax),%esi
ffff80000010573d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105744:	80 ff ff 
ffff800000105747:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010574b:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff800000105752:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff800000105759:	57                   	push   %rdi
ffff80000010575a:	48 89 c7             	mov    %rax,%rdi
ffff80000010575d:	48 b8 6b 46 10 00 00 	movabs $0xffff80000010466b,%rax
ffff800000105764:	80 ff ff 
ffff800000105767:	ff d0                	callq  *%rax
ffff800000105769:	48 83 c4 08          	add    $0x8,%rsp
ffff80000010576d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105774:	80 ff ff 
ffff800000105777:	8b 40 08             	mov    0x8(%rax),%eax
ffff80000010577a:	8d 50 01             	lea    0x1(%rax),%edx
ffff80000010577d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105784:	80 ff ff 
ffff800000105787:	89 50 08             	mov    %edx,0x8(%rax)
ffff80000010578a:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105791:	80 ff ff 
ffff800000105794:	8b 48 08             	mov    0x8(%rax),%ecx
ffff800000105797:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010579e:	80 ff ff 
ffff8000001057a1:	8b 00                	mov    (%rax),%eax
ffff8000001057a3:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001057aa:	80 ff ff 
ffff8000001057ad:	8b 72 10             	mov    0x10(%rdx),%esi
ffff8000001057b0:	99                   	cltd   
ffff8000001057b1:	f7 fe                	idiv   %esi
ffff8000001057b3:	39 c1                	cmp    %eax,%ecx
ffff8000001057b5:	7c 2e                	jl     ffff8000001057e5 <color_printk+0x4bc>
ffff8000001057b7:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057be:	80 ff ff 
ffff8000001057c1:	8b 40 0c             	mov    0xc(%rax),%eax
ffff8000001057c4:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001057c7:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057ce:	80 ff ff 
ffff8000001057d1:	89 50 0c             	mov    %edx,0xc(%rax)
ffff8000001057d4:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057db:	80 ff ff 
ffff8000001057de:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffff8000001057e5:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057ec:	80 ff ff 
ffff8000001057ef:	8b 48 0c             	mov    0xc(%rax),%ecx
ffff8000001057f2:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057f9:	80 ff ff 
ffff8000001057fc:	8b 40 04             	mov    0x4(%rax),%eax
ffff8000001057ff:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff800000105806:	80 ff ff 
ffff800000105809:	8b 7a 14             	mov    0x14(%rdx),%edi
ffff80000010580c:	99                   	cltd   
ffff80000010580d:	f7 ff                	idiv   %edi
ffff80000010580f:	39 c1                	cmp    %eax,%ecx
ffff800000105811:	7c 11                	jl     ffff800000105824 <color_printk+0x4fb>
ffff800000105813:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010581a:	80 ff ff 
ffff80000010581d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
ffff800000105824:	83 85 4c ff ff ff 01 	addl   $0x1,-0xb4(%rbp)
ffff80000010582b:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff800000105831:	3b 85 44 ff ff ff    	cmp    -0xbc(%rbp),%eax
ffff800000105837:	0f 8c ca fb ff ff    	jl     ffff800000105407 <color_printk+0xde>
ffff80000010583d:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
ffff800000105844:	0f 85 bd fb ff ff    	jne    ffff800000105407 <color_printk+0xde>
ffff80000010584a:	8b 85 44 ff ff ff    	mov    -0xbc(%rbp),%eax
ffff800000105850:	c9                   	leaveq 
ffff800000105851:	c3                   	retq   

ffff800000105852 <set_intr_gate>:
ffff800000105852:	55                   	push   %rbp
ffff800000105853:	48 89 e5             	mov    %rsp,%rbp
ffff800000105856:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000105859:	89 f0                	mov    %esi,%eax
ffff80000010585b:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff80000010585f:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff800000105862:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105865:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105869:	48 89 c2             	mov    %rax,%rdx
ffff80000010586c:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff800000105873:	80 ff ff 
ffff800000105876:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff80000010587a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010587d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105881:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105885:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff80000010588c:	80 ff ff 
ffff80000010588f:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff800000105893:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105897:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff80000010589d:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff8000001058a1:	48 89 c2             	mov    %rax,%rdx
ffff8000001058a4:	44 89 c0             	mov    %r8d,%eax
ffff8000001058a7:	66 89 d0             	mov    %dx,%ax
ffff8000001058aa:	48 83 e1 07          	and    $0x7,%rcx
ffff8000001058ae:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff8000001058b5:	48 c1 e1 20          	shl    $0x20,%rcx
ffff8000001058b9:	48 01 c8             	add    %rcx,%rax
ffff8000001058bc:	48 31 c9             	xor    %rcx,%rcx
ffff8000001058bf:	89 d1                	mov    %edx,%ecx
ffff8000001058c1:	48 c1 e9 10          	shr    $0x10,%rcx
ffff8000001058c5:	48 c1 e1 30          	shl    $0x30,%rcx
ffff8000001058c9:	48 01 c8             	add    %rcx,%rax
ffff8000001058cc:	48 89 06             	mov    %rax,(%rsi)
ffff8000001058cf:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001058d3:	48 89 17             	mov    %rdx,(%rdi)
ffff8000001058d6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001058da:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001058de:	90                   	nop
ffff8000001058df:	5d                   	pop    %rbp
ffff8000001058e0:	c3                   	retq   

ffff8000001058e1 <set_trap_gate>:
ffff8000001058e1:	55                   	push   %rbp
ffff8000001058e2:	48 89 e5             	mov    %rsp,%rbp
ffff8000001058e5:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff8000001058e8:	89 f0                	mov    %esi,%eax
ffff8000001058ea:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff8000001058ee:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff8000001058f1:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001058f4:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001058f8:	48 89 c2             	mov    %rax,%rdx
ffff8000001058fb:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff800000105902:	80 ff ff 
ffff800000105905:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105909:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010590c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105910:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105914:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff80000010591b:	80 ff ff 
ffff80000010591e:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff800000105922:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105926:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff80000010592c:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff800000105930:	48 89 c2             	mov    %rax,%rdx
ffff800000105933:	44 89 c0             	mov    %r8d,%eax
ffff800000105936:	66 89 d0             	mov    %dx,%ax
ffff800000105939:	48 83 e1 07          	and    $0x7,%rcx
ffff80000010593d:	48 81 c1 00 8f 00 00 	add    $0x8f00,%rcx
ffff800000105944:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000105948:	48 01 c8             	add    %rcx,%rax
ffff80000010594b:	48 31 c9             	xor    %rcx,%rcx
ffff80000010594e:	89 d1                	mov    %edx,%ecx
ffff800000105950:	48 c1 e9 10          	shr    $0x10,%rcx
ffff800000105954:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000105958:	48 01 c8             	add    %rcx,%rax
ffff80000010595b:	48 89 06             	mov    %rax,(%rsi)
ffff80000010595e:	48 c1 ea 20          	shr    $0x20,%rdx
ffff800000105962:	48 89 17             	mov    %rdx,(%rdi)
ffff800000105965:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105969:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010596d:	90                   	nop
ffff80000010596e:	5d                   	pop    %rbp
ffff80000010596f:	c3                   	retq   

ffff800000105970 <set_system_gate>:
ffff800000105970:	55                   	push   %rbp
ffff800000105971:	48 89 e5             	mov    %rsp,%rbp
ffff800000105974:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000105977:	89 f0                	mov    %esi,%eax
ffff800000105979:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff80000010597d:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff800000105980:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105983:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105987:	48 89 c2             	mov    %rax,%rdx
ffff80000010598a:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff800000105991:	80 ff ff 
ffff800000105994:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105998:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010599b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010599f:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001059a3:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff8000001059aa:	80 ff ff 
ffff8000001059ad:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff8000001059b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001059b5:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff8000001059bb:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff8000001059bf:	48 89 c2             	mov    %rax,%rdx
ffff8000001059c2:	44 89 c0             	mov    %r8d,%eax
ffff8000001059c5:	66 89 d0             	mov    %dx,%ax
ffff8000001059c8:	48 83 e1 07          	and    $0x7,%rcx
ffff8000001059cc:	48 81 c1 00 ef 00 00 	add    $0xef00,%rcx
ffff8000001059d3:	48 c1 e1 20          	shl    $0x20,%rcx
ffff8000001059d7:	48 01 c8             	add    %rcx,%rax
ffff8000001059da:	48 31 c9             	xor    %rcx,%rcx
ffff8000001059dd:	89 d1                	mov    %edx,%ecx
ffff8000001059df:	48 c1 e9 10          	shr    $0x10,%rcx
ffff8000001059e3:	48 c1 e1 30          	shl    $0x30,%rcx
ffff8000001059e7:	48 01 c8             	add    %rcx,%rax
ffff8000001059ea:	48 89 06             	mov    %rax,(%rsi)
ffff8000001059ed:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001059f1:	48 89 17             	mov    %rdx,(%rdi)
ffff8000001059f4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001059f8:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001059fc:	90                   	nop
ffff8000001059fd:	5d                   	pop    %rbp
ffff8000001059fe:	c3                   	retq   
ffff8000001059ff:	55                   	push   %rbp
ffff800000105a00:	48 89 e5             	mov    %rsp,%rbp
ffff800000105a03:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105a07:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105a0b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000105a0f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000105a13:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000105a17:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000105a1b:	48 ba 10 aa 10 00 00 	movabs $0xffff80000010aa10,%rdx
ffff800000105a22:	80 ff ff 
ffff800000105a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105a29:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a2c:	48 ba 18 aa 10 00 00 	movabs $0xffff80000010aa18,%rdx
ffff800000105a33:	80 ff ff 
ffff800000105a36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105a3a:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a3d:	48 ba 20 aa 10 00 00 	movabs $0xffff80000010aa20,%rdx
ffff800000105a44:	80 ff ff 
ffff800000105a47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a4b:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a4e:	48 ba 30 aa 10 00 00 	movabs $0xffff80000010aa30,%rdx
ffff800000105a55:	80 ff ff 
ffff800000105a58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105a5c:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a5f:	48 ba 38 aa 10 00 00 	movabs $0xffff80000010aa38,%rdx
ffff800000105a66:	80 ff ff 
ffff800000105a69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105a6d:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a70:	48 ba 40 aa 10 00 00 	movabs $0xffff80000010aa40,%rdx
ffff800000105a77:	80 ff ff 
ffff800000105a7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a7e:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a81:	48 ba 48 aa 10 00 00 	movabs $0xffff80000010aa48,%rdx
ffff800000105a88:	80 ff ff 
ffff800000105a8b:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000105a8f:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a92:	48 ba 50 aa 10 00 00 	movabs $0xffff80000010aa50,%rdx
ffff800000105a99:	80 ff ff 
ffff800000105a9c:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000105aa0:	48 89 02             	mov    %rax,(%rdx)
ffff800000105aa3:	48 ba 58 aa 10 00 00 	movabs $0xffff80000010aa58,%rdx
ffff800000105aaa:	80 ff ff 
ffff800000105aad:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000105ab1:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ab4:	48 ba 60 aa 10 00 00 	movabs $0xffff80000010aa60,%rdx
ffff800000105abb:	80 ff ff 
ffff800000105abe:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000105ac2:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ac5:	90                   	nop
ffff800000105ac6:	5d                   	pop    %rbp
ffff800000105ac7:	c3                   	retq   

ffff800000105ac8 <do_divide_error>:
ffff800000105ac8:	55                   	push   %rbp
ffff800000105ac9:	48 89 e5             	mov    %rsp,%rbp
ffff800000105acc:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105ad0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105ad4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105ad8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105adc:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105ae3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ae7:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105aee:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105af2:	49 89 c9             	mov    %rcx,%r9
ffff800000105af5:	49 89 d0             	mov    %rdx,%r8
ffff800000105af8:	48 89 c1             	mov    %rax,%rcx
ffff800000105afb:	48 ba 88 1e 11 00 00 	movabs $0xffff800000111e88,%rdx
ffff800000105b02:	80 ff ff 
ffff800000105b05:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105b0a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105b0f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b14:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105b1b:	80 ff ff 
ffff800000105b1e:	41 ff d2             	callq  *%r10
ffff800000105b21:	eb fe                	jmp    ffff800000105b21 <do_divide_error+0x59>

ffff800000105b23 <do_debug>:
ffff800000105b23:	55                   	push   %rbp
ffff800000105b24:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b27:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105b2b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105b2f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105b33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b37:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105b3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b42:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105b49:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105b4d:	49 89 c9             	mov    %rcx,%r9
ffff800000105b50:	49 89 d0             	mov    %rdx,%r8
ffff800000105b53:	48 89 c1             	mov    %rax,%rcx
ffff800000105b56:	48 ba c8 1e 11 00 00 	movabs $0xffff800000111ec8,%rdx
ffff800000105b5d:	80 ff ff 
ffff800000105b60:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105b65:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105b6a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b6f:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105b76:	80 ff ff 
ffff800000105b79:	41 ff d2             	callq  *%r10
ffff800000105b7c:	eb fe                	jmp    ffff800000105b7c <do_debug+0x59>

ffff800000105b7e <do_nmi>:
ffff800000105b7e:	55                   	push   %rbp
ffff800000105b7f:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b82:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105b86:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105b8a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105b8e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b92:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105b99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b9d:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105ba4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105ba8:	49 89 c9             	mov    %rcx,%r9
ffff800000105bab:	49 89 d0             	mov    %rdx,%r8
ffff800000105bae:	48 89 c1             	mov    %rax,%rcx
ffff800000105bb1:	48 ba 00 1f 11 00 00 	movabs $0xffff800000111f00,%rdx
ffff800000105bb8:	80 ff ff 
ffff800000105bbb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105bc0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105bc5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bca:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105bd1:	80 ff ff 
ffff800000105bd4:	41 ff d2             	callq  *%r10
ffff800000105bd7:	eb fe                	jmp    ffff800000105bd7 <do_nmi+0x59>

ffff800000105bd9 <do_int3>:
ffff800000105bd9:	55                   	push   %rbp
ffff800000105bda:	48 89 e5             	mov    %rsp,%rbp
ffff800000105bdd:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105be1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105be5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105be9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105bed:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105bf4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105bf8:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105bff:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105c03:	49 89 c9             	mov    %rcx,%r9
ffff800000105c06:	49 89 d0             	mov    %rdx,%r8
ffff800000105c09:	48 89 c1             	mov    %rax,%rcx
ffff800000105c0c:	48 ba 38 1f 11 00 00 	movabs $0xffff800000111f38,%rdx
ffff800000105c13:	80 ff ff 
ffff800000105c16:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105c1b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105c20:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c25:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105c2c:	80 ff ff 
ffff800000105c2f:	41 ff d2             	callq  *%r10
ffff800000105c32:	eb fe                	jmp    ffff800000105c32 <do_int3+0x59>

ffff800000105c34 <do_overflow>:
ffff800000105c34:	55                   	push   %rbp
ffff800000105c35:	48 89 e5             	mov    %rsp,%rbp
ffff800000105c38:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105c3c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105c40:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105c44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105c48:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105c4f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105c53:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105c5a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105c5e:	49 89 c9             	mov    %rcx,%r9
ffff800000105c61:	49 89 d0             	mov    %rdx,%r8
ffff800000105c64:	48 89 c1             	mov    %rax,%rcx
ffff800000105c67:	48 ba 70 1f 11 00 00 	movabs $0xffff800000111f70,%rdx
ffff800000105c6e:	80 ff ff 
ffff800000105c71:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105c76:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105c7b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c80:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105c87:	80 ff ff 
ffff800000105c8a:	41 ff d2             	callq  *%r10
ffff800000105c8d:	eb fe                	jmp    ffff800000105c8d <do_overflow+0x59>

ffff800000105c8f <do_bounds>:
ffff800000105c8f:	55                   	push   %rbp
ffff800000105c90:	48 89 e5             	mov    %rsp,%rbp
ffff800000105c93:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105c97:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105c9b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105c9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ca3:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105caa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105cae:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105cb5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105cb9:	49 89 c9             	mov    %rcx,%r9
ffff800000105cbc:	49 89 d0             	mov    %rdx,%r8
ffff800000105cbf:	48 89 c1             	mov    %rax,%rcx
ffff800000105cc2:	48 ba b0 1f 11 00 00 	movabs $0xffff800000111fb0,%rdx
ffff800000105cc9:	80 ff ff 
ffff800000105ccc:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105cd1:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105cd6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105cdb:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105ce2:	80 ff ff 
ffff800000105ce5:	41 ff d2             	callq  *%r10
ffff800000105ce8:	eb fe                	jmp    ffff800000105ce8 <do_bounds+0x59>

ffff800000105cea <do_undefined_opcode>:
ffff800000105cea:	55                   	push   %rbp
ffff800000105ceb:	48 89 e5             	mov    %rsp,%rbp
ffff800000105cee:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105cf2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105cf6:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105cfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105cfe:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105d05:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d09:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105d10:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105d14:	49 89 c9             	mov    %rcx,%r9
ffff800000105d17:	49 89 d0             	mov    %rdx,%r8
ffff800000105d1a:	48 89 c1             	mov    %rax,%rcx
ffff800000105d1d:	48 ba f0 1f 11 00 00 	movabs $0xffff800000111ff0,%rdx
ffff800000105d24:	80 ff ff 
ffff800000105d27:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105d2c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105d31:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d36:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105d3d:	80 ff ff 
ffff800000105d40:	41 ff d2             	callq  *%r10
ffff800000105d43:	eb fe                	jmp    ffff800000105d43 <do_undefined_opcode+0x59>

ffff800000105d45 <do_dev_not_available>:
ffff800000105d45:	55                   	push   %rbp
ffff800000105d46:	48 89 e5             	mov    %rsp,%rbp
ffff800000105d49:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105d4d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105d51:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105d55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d59:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105d60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d64:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105d6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105d6f:	49 89 c9             	mov    %rcx,%r9
ffff800000105d72:	49 89 d0             	mov    %rdx,%r8
ffff800000105d75:	48 89 c1             	mov    %rax,%rcx
ffff800000105d78:	48 ba 38 20 11 00 00 	movabs $0xffff800000112038,%rdx
ffff800000105d7f:	80 ff ff 
ffff800000105d82:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105d87:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105d8c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d91:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105d98:	80 ff ff 
ffff800000105d9b:	41 ff d2             	callq  *%r10
ffff800000105d9e:	eb fe                	jmp    ffff800000105d9e <do_dev_not_available+0x59>

ffff800000105da0 <do_double_fault>:
ffff800000105da0:	55                   	push   %rbp
ffff800000105da1:	48 89 e5             	mov    %rsp,%rbp
ffff800000105da4:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105da8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105dac:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105db0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105db4:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105dbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105dbf:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105dc6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105dca:	49 89 c9             	mov    %rcx,%r9
ffff800000105dcd:	49 89 d0             	mov    %rdx,%r8
ffff800000105dd0:	48 89 c1             	mov    %rax,%rcx
ffff800000105dd3:	48 ba 80 20 11 00 00 	movabs $0xffff800000112080,%rdx
ffff800000105dda:	80 ff ff 
ffff800000105ddd:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105de2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105de7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105dec:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105df3:	80 ff ff 
ffff800000105df6:	41 ff d2             	callq  *%r10
ffff800000105df9:	eb fe                	jmp    ffff800000105df9 <do_double_fault+0x59>

ffff800000105dfb <do_coprocessor_segment_overrun>:
ffff800000105dfb:	55                   	push   %rbp
ffff800000105dfc:	48 89 e5             	mov    %rsp,%rbp
ffff800000105dff:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105e03:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105e07:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105e0b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e0f:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105e16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e1a:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105e21:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105e25:	49 89 c9             	mov    %rcx,%r9
ffff800000105e28:	49 89 d0             	mov    %rdx,%r8
ffff800000105e2b:	48 89 c1             	mov    %rax,%rcx
ffff800000105e2e:	48 ba c0 20 11 00 00 	movabs $0xffff8000001120c0,%rdx
ffff800000105e35:	80 ff ff 
ffff800000105e38:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105e3d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105e42:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e47:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105e4e:	80 ff ff 
ffff800000105e51:	41 ff d2             	callq  *%r10
ffff800000105e54:	eb fe                	jmp    ffff800000105e54 <do_coprocessor_segment_overrun+0x59>

ffff800000105e56 <do_invalid_TSS>:
ffff800000105e56:	55                   	push   %rbp
ffff800000105e57:	48 89 e5             	mov    %rsp,%rbp
ffff800000105e5a:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105e5e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105e62:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105e66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e6a:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105e71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e75:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105e7c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105e80:	49 89 c9             	mov    %rcx,%r9
ffff800000105e83:	49 89 d0             	mov    %rdx,%r8
ffff800000105e86:	48 89 c1             	mov    %rax,%rcx
ffff800000105e89:	48 ba 10 21 11 00 00 	movabs $0xffff800000112110,%rdx
ffff800000105e90:	80 ff ff 
ffff800000105e93:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105e98:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105e9d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ea2:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000105ea9:	80 ff ff 
ffff800000105eac:	41 ff d2             	callq  *%r10
ffff800000105eaf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105eb3:	83 e0 01             	and    $0x1,%eax
ffff800000105eb6:	48 85 c0             	test   %rax,%rax
ffff800000105eb9:	74 25                	je     ffff800000105ee0 <do_invalid_TSS+0x8a>
ffff800000105ebb:	48 ba 50 21 11 00 00 	movabs $0xffff800000112150,%rdx
ffff800000105ec2:	80 ff ff 
ffff800000105ec5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105eca:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105ecf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ed4:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105edb:	80 ff ff 
ffff800000105ede:	ff d1                	callq  *%rcx
ffff800000105ee0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105ee4:	83 e0 02             	and    $0x2,%eax
ffff800000105ee7:	48 85 c0             	test   %rax,%rax
ffff800000105eea:	74 27                	je     ffff800000105f13 <do_invalid_TSS+0xbd>
ffff800000105eec:	48 ba d0 21 11 00 00 	movabs $0xffff8000001121d0,%rdx
ffff800000105ef3:	80 ff ff 
ffff800000105ef6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105efb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f05:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f0c:	80 ff ff 
ffff800000105f0f:	ff d1                	callq  *%rcx
ffff800000105f11:	eb 25                	jmp    ffff800000105f38 <do_invalid_TSS+0xe2>
ffff800000105f13:	48 ba 00 22 11 00 00 	movabs $0xffff800000112200,%rdx
ffff800000105f1a:	80 ff ff 
ffff800000105f1d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f22:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f27:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f2c:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f33:	80 ff ff 
ffff800000105f36:	ff d1                	callq  *%rcx
ffff800000105f38:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105f3c:	83 e0 02             	and    $0x2,%eax
ffff800000105f3f:	48 85 c0             	test   %rax,%rax
ffff800000105f42:	75 58                	jne    ffff800000105f9c <do_invalid_TSS+0x146>
ffff800000105f44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105f48:	83 e0 04             	and    $0x4,%eax
ffff800000105f4b:	48 85 c0             	test   %rax,%rax
ffff800000105f4e:	74 27                	je     ffff800000105f77 <do_invalid_TSS+0x121>
ffff800000105f50:	48 ba 38 22 11 00 00 	movabs $0xffff800000112238,%rdx
ffff800000105f57:	80 ff ff 
ffff800000105f5a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f5f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f64:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f69:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f70:	80 ff ff 
ffff800000105f73:	ff d1                	callq  *%rcx
ffff800000105f75:	eb 25                	jmp    ffff800000105f9c <do_invalid_TSS+0x146>
ffff800000105f77:	48 ba 70 22 11 00 00 	movabs $0xffff800000112270,%rdx
ffff800000105f7e:	80 ff ff 
ffff800000105f81:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f86:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f8b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f90:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f97:	80 ff ff 
ffff800000105f9a:	ff d1                	callq  *%rcx
ffff800000105f9c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105fa0:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105fa5:	48 89 c1             	mov    %rax,%rcx
ffff800000105fa8:	48 ba a0 22 11 00 00 	movabs $0xffff8000001122a0,%rdx
ffff800000105faf:	80 ff ff 
ffff800000105fb2:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105fb7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105fbc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fc1:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000105fc8:	80 ff ff 
ffff800000105fcb:	41 ff d0             	callq  *%r8
ffff800000105fce:	eb fe                	jmp    ffff800000105fce <do_invalid_TSS+0x178>

ffff800000105fd0 <do_segment_not_present>:
ffff800000105fd0:	55                   	push   %rbp
ffff800000105fd1:	48 89 e5             	mov    %rsp,%rbp
ffff800000105fd4:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105fd8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105fdc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105fe0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105fe4:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105feb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105fef:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105ff6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105ffa:	49 89 c9             	mov    %rcx,%r9
ffff800000105ffd:	49 89 d0             	mov    %rdx,%r8
ffff800000106000:	48 89 c1             	mov    %rax,%rcx
ffff800000106003:	48 ba c0 22 11 00 00 	movabs $0xffff8000001122c0,%rdx
ffff80000010600a:	80 ff ff 
ffff80000010600d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106012:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106017:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010601c:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106023:	80 ff ff 
ffff800000106026:	41 ff d2             	callq  *%r10
ffff800000106029:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010602d:	83 e0 01             	and    $0x1,%eax
ffff800000106030:	48 85 c0             	test   %rax,%rax
ffff800000106033:	74 25                	je     ffff80000010605a <do_segment_not_present+0x8a>
ffff800000106035:	48 ba 50 21 11 00 00 	movabs $0xffff800000112150,%rdx
ffff80000010603c:	80 ff ff 
ffff80000010603f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106044:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106049:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010604e:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106055:	80 ff ff 
ffff800000106058:	ff d1                	callq  *%rcx
ffff80000010605a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010605e:	83 e0 02             	and    $0x2,%eax
ffff800000106061:	48 85 c0             	test   %rax,%rax
ffff800000106064:	74 27                	je     ffff80000010608d <do_segment_not_present+0xbd>
ffff800000106066:	48 ba d0 21 11 00 00 	movabs $0xffff8000001121d0,%rdx
ffff80000010606d:	80 ff ff 
ffff800000106070:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106075:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010607a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010607f:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106086:	80 ff ff 
ffff800000106089:	ff d1                	callq  *%rcx
ffff80000010608b:	eb 25                	jmp    ffff8000001060b2 <do_segment_not_present+0xe2>
ffff80000010608d:	48 ba 00 22 11 00 00 	movabs $0xffff800000112200,%rdx
ffff800000106094:	80 ff ff 
ffff800000106097:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010609c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060a1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060a6:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001060ad:	80 ff ff 
ffff8000001060b0:	ff d1                	callq  *%rcx
ffff8000001060b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001060b6:	83 e0 02             	and    $0x2,%eax
ffff8000001060b9:	48 85 c0             	test   %rax,%rax
ffff8000001060bc:	75 58                	jne    ffff800000106116 <do_segment_not_present+0x146>
ffff8000001060be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001060c2:	83 e0 04             	and    $0x4,%eax
ffff8000001060c5:	48 85 c0             	test   %rax,%rax
ffff8000001060c8:	74 27                	je     ffff8000001060f1 <do_segment_not_present+0x121>
ffff8000001060ca:	48 ba 38 22 11 00 00 	movabs $0xffff800000112238,%rdx
ffff8000001060d1:	80 ff ff 
ffff8000001060d4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060d9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060de:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060e3:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001060ea:	80 ff ff 
ffff8000001060ed:	ff d1                	callq  *%rcx
ffff8000001060ef:	eb 25                	jmp    ffff800000106116 <do_segment_not_present+0x146>
ffff8000001060f1:	48 ba 70 22 11 00 00 	movabs $0xffff800000112270,%rdx
ffff8000001060f8:	80 ff ff 
ffff8000001060fb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106100:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106105:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010610a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106111:	80 ff ff 
ffff800000106114:	ff d1                	callq  *%rcx
ffff800000106116:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010611a:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff80000010611f:	48 89 c1             	mov    %rax,%rcx
ffff800000106122:	48 ba a0 22 11 00 00 	movabs $0xffff8000001122a0,%rdx
ffff800000106129:	80 ff ff 
ffff80000010612c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106131:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106136:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010613b:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106142:	80 ff ff 
ffff800000106145:	41 ff d0             	callq  *%r8
ffff800000106148:	eb fe                	jmp    ffff800000106148 <do_segment_not_present+0x178>

ffff80000010614a <do_stack_segment_fault>:
ffff80000010614a:	55                   	push   %rbp
ffff80000010614b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010614e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106152:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106156:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010615a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010615e:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106165:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106169:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106170:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106174:	49 89 c9             	mov    %rcx,%r9
ffff800000106177:	49 89 d0             	mov    %rdx,%r8
ffff80000010617a:	48 89 c1             	mov    %rax,%rcx
ffff80000010617d:	48 ba 08 23 11 00 00 	movabs $0xffff800000112308,%rdx
ffff800000106184:	80 ff ff 
ffff800000106187:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010618c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106191:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106196:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff80000010619d:	80 ff ff 
ffff8000001061a0:	41 ff d2             	callq  *%r10
ffff8000001061a3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001061a7:	83 e0 01             	and    $0x1,%eax
ffff8000001061aa:	48 85 c0             	test   %rax,%rax
ffff8000001061ad:	74 25                	je     ffff8000001061d4 <do_stack_segment_fault+0x8a>
ffff8000001061af:	48 ba 50 21 11 00 00 	movabs $0xffff800000112150,%rdx
ffff8000001061b6:	80 ff ff 
ffff8000001061b9:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061be:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061c3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061c8:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001061cf:	80 ff ff 
ffff8000001061d2:	ff d1                	callq  *%rcx
ffff8000001061d4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001061d8:	83 e0 02             	and    $0x2,%eax
ffff8000001061db:	48 85 c0             	test   %rax,%rax
ffff8000001061de:	74 27                	je     ffff800000106207 <do_stack_segment_fault+0xbd>
ffff8000001061e0:	48 ba d0 21 11 00 00 	movabs $0xffff8000001121d0,%rdx
ffff8000001061e7:	80 ff ff 
ffff8000001061ea:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061ef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061f9:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106200:	80 ff ff 
ffff800000106203:	ff d1                	callq  *%rcx
ffff800000106205:	eb 25                	jmp    ffff80000010622c <do_stack_segment_fault+0xe2>
ffff800000106207:	48 ba 00 22 11 00 00 	movabs $0xffff800000112200,%rdx
ffff80000010620e:	80 ff ff 
ffff800000106211:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106216:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010621b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106220:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106227:	80 ff ff 
ffff80000010622a:	ff d1                	callq  *%rcx
ffff80000010622c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106230:	83 e0 02             	and    $0x2,%eax
ffff800000106233:	48 85 c0             	test   %rax,%rax
ffff800000106236:	75 58                	jne    ffff800000106290 <do_stack_segment_fault+0x146>
ffff800000106238:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010623c:	83 e0 04             	and    $0x4,%eax
ffff80000010623f:	48 85 c0             	test   %rax,%rax
ffff800000106242:	74 27                	je     ffff80000010626b <do_stack_segment_fault+0x121>
ffff800000106244:	48 ba 38 22 11 00 00 	movabs $0xffff800000112238,%rdx
ffff80000010624b:	80 ff ff 
ffff80000010624e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106253:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106258:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010625d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106264:	80 ff ff 
ffff800000106267:	ff d1                	callq  *%rcx
ffff800000106269:	eb 25                	jmp    ffff800000106290 <do_stack_segment_fault+0x146>
ffff80000010626b:	48 ba 70 22 11 00 00 	movabs $0xffff800000112270,%rdx
ffff800000106272:	80 ff ff 
ffff800000106275:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010627a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010627f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106284:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010628b:	80 ff ff 
ffff80000010628e:	ff d1                	callq  *%rcx
ffff800000106290:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106294:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000106299:	48 89 c1             	mov    %rax,%rcx
ffff80000010629c:	48 ba a0 22 11 00 00 	movabs $0xffff8000001122a0,%rdx
ffff8000001062a3:	80 ff ff 
ffff8000001062a6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001062ab:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001062b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062b5:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001062bc:	80 ff ff 
ffff8000001062bf:	41 ff d0             	callq  *%r8
ffff8000001062c2:	eb fe                	jmp    ffff8000001062c2 <do_stack_segment_fault+0x178>

ffff8000001062c4 <do_general_protection>:
ffff8000001062c4:	55                   	push   %rbp
ffff8000001062c5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062c8:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001062cc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001062d0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001062d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001062d8:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001062df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001062e3:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001062ea:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001062ee:	49 89 c9             	mov    %rcx,%r9
ffff8000001062f1:	49 89 d0             	mov    %rdx,%r8
ffff8000001062f4:	48 89 c1             	mov    %rax,%rcx
ffff8000001062f7:	48 ba 50 23 11 00 00 	movabs $0xffff800000112350,%rdx
ffff8000001062fe:	80 ff ff 
ffff800000106301:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106306:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010630b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106310:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106317:	80 ff ff 
ffff80000010631a:	41 ff d2             	callq  *%r10
ffff80000010631d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106321:	83 e0 01             	and    $0x1,%eax
ffff800000106324:	48 85 c0             	test   %rax,%rax
ffff800000106327:	74 25                	je     ffff80000010634e <do_general_protection+0x8a>
ffff800000106329:	48 ba 50 21 11 00 00 	movabs $0xffff800000112150,%rdx
ffff800000106330:	80 ff ff 
ffff800000106333:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106338:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010633d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106342:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106349:	80 ff ff 
ffff80000010634c:	ff d1                	callq  *%rcx
ffff80000010634e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106352:	83 e0 02             	and    $0x2,%eax
ffff800000106355:	48 85 c0             	test   %rax,%rax
ffff800000106358:	74 27                	je     ffff800000106381 <do_general_protection+0xbd>
ffff80000010635a:	48 ba d0 21 11 00 00 	movabs $0xffff8000001121d0,%rdx
ffff800000106361:	80 ff ff 
ffff800000106364:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106369:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010636e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106373:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010637a:	80 ff ff 
ffff80000010637d:	ff d1                	callq  *%rcx
ffff80000010637f:	eb 25                	jmp    ffff8000001063a6 <do_general_protection+0xe2>
ffff800000106381:	48 ba 00 22 11 00 00 	movabs $0xffff800000112200,%rdx
ffff800000106388:	80 ff ff 
ffff80000010638b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106390:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106395:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010639a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001063a1:	80 ff ff 
ffff8000001063a4:	ff d1                	callq  *%rcx
ffff8000001063a6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001063aa:	83 e0 02             	and    $0x2,%eax
ffff8000001063ad:	48 85 c0             	test   %rax,%rax
ffff8000001063b0:	75 58                	jne    ffff80000010640a <do_general_protection+0x146>
ffff8000001063b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001063b6:	83 e0 04             	and    $0x4,%eax
ffff8000001063b9:	48 85 c0             	test   %rax,%rax
ffff8000001063bc:	74 27                	je     ffff8000001063e5 <do_general_protection+0x121>
ffff8000001063be:	48 ba 38 22 11 00 00 	movabs $0xffff800000112238,%rdx
ffff8000001063c5:	80 ff ff 
ffff8000001063c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063cd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063d7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001063de:	80 ff ff 
ffff8000001063e1:	ff d1                	callq  *%rcx
ffff8000001063e3:	eb 25                	jmp    ffff80000010640a <do_general_protection+0x146>
ffff8000001063e5:	48 ba 70 22 11 00 00 	movabs $0xffff800000112270,%rdx
ffff8000001063ec:	80 ff ff 
ffff8000001063ef:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063f4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063f9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063fe:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106405:	80 ff ff 
ffff800000106408:	ff d1                	callq  *%rcx
ffff80000010640a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010640e:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000106413:	48 89 c1             	mov    %rax,%rcx
ffff800000106416:	48 ba a0 22 11 00 00 	movabs $0xffff8000001122a0,%rdx
ffff80000010641d:	80 ff ff 
ffff800000106420:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106425:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010642a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010642f:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106436:	80 ff ff 
ffff800000106439:	41 ff d0             	callq  *%r8
ffff80000010643c:	eb fe                	jmp    ffff80000010643c <do_general_protection+0x178>

ffff80000010643e <do_page_fault>:
ffff80000010643e:	55                   	push   %rbp
ffff80000010643f:	48 89 e5             	mov    %rsp,%rbp
ffff800000106442:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000106446:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010644a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff80000010644e:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000106455:	00 
ffff800000106456:	0f 20 d0             	mov    %cr2,%rax
ffff800000106459:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010645d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106461:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106468:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010646c:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106473:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106477:	49 89 c9             	mov    %rcx,%r9
ffff80000010647a:	49 89 d0             	mov    %rdx,%r8
ffff80000010647d:	48 89 c1             	mov    %rax,%rcx
ffff800000106480:	48 ba 98 23 11 00 00 	movabs $0xffff800000112398,%rdx
ffff800000106487:	80 ff ff 
ffff80000010648a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010648f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106494:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106499:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001064a0:	80 ff ff 
ffff8000001064a3:	41 ff d2             	callq  *%r10
ffff8000001064a6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001064aa:	83 e0 01             	and    $0x1,%eax
ffff8000001064ad:	48 85 c0             	test   %rax,%rax
ffff8000001064b0:	75 25                	jne    ffff8000001064d7 <do_page_fault+0x99>
ffff8000001064b2:	48 ba d6 23 11 00 00 	movabs $0xffff8000001123d6,%rdx
ffff8000001064b9:	80 ff ff 
ffff8000001064bc:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064c1:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064c6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064cb:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001064d2:	80 ff ff 
ffff8000001064d5:	ff d1                	callq  *%rcx
ffff8000001064d7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001064db:	83 e0 02             	and    $0x2,%eax
ffff8000001064de:	48 85 c0             	test   %rax,%rax
ffff8000001064e1:	74 27                	je     ffff80000010650a <do_page_fault+0xcc>
ffff8000001064e3:	48 ba e9 23 11 00 00 	movabs $0xffff8000001123e9,%rdx
ffff8000001064ea:	80 ff ff 
ffff8000001064ed:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064fc:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106503:	80 ff ff 
ffff800000106506:	ff d1                	callq  *%rcx
ffff800000106508:	eb 25                	jmp    ffff80000010652f <do_page_fault+0xf1>
ffff80000010650a:	48 ba fd 23 11 00 00 	movabs $0xffff8000001123fd,%rdx
ffff800000106511:	80 ff ff 
ffff800000106514:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106519:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010651e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106523:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010652a:	80 ff ff 
ffff80000010652d:	ff d1                	callq  *%rcx
ffff80000010652f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106533:	83 e0 04             	and    $0x4,%eax
ffff800000106536:	48 85 c0             	test   %rax,%rax
ffff800000106539:	74 27                	je     ffff800000106562 <do_page_fault+0x124>
ffff80000010653b:	48 ba 10 24 11 00 00 	movabs $0xffff800000112410,%rdx
ffff800000106542:	80 ff ff 
ffff800000106545:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010654a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010654f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106554:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010655b:	80 ff ff 
ffff80000010655e:	ff d1                	callq  *%rcx
ffff800000106560:	eb 25                	jmp    ffff800000106587 <do_page_fault+0x149>
ffff800000106562:	48 ba 22 24 11 00 00 	movabs $0xffff800000112422,%rdx
ffff800000106569:	80 ff ff 
ffff80000010656c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106571:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106576:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010657b:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106582:	80 ff ff 
ffff800000106585:	ff d1                	callq  *%rcx
ffff800000106587:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010658b:	83 e0 08             	and    $0x8,%eax
ffff80000010658e:	48 85 c0             	test   %rax,%rax
ffff800000106591:	74 25                	je     ffff8000001065b8 <do_page_fault+0x17a>
ffff800000106593:	48 ba 3e 24 11 00 00 	movabs $0xffff80000011243e,%rdx
ffff80000010659a:	80 ff ff 
ffff80000010659d:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065a2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065a7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065ac:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001065b3:	80 ff ff 
ffff8000001065b6:	ff d1                	callq  *%rcx
ffff8000001065b8:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001065bc:	83 e0 10             	and    $0x10,%eax
ffff8000001065bf:	48 85 c0             	test   %rax,%rax
ffff8000001065c2:	74 25                	je     ffff8000001065e9 <do_page_fault+0x1ab>
ffff8000001065c4:	48 ba 60 24 11 00 00 	movabs $0xffff800000112460,%rdx
ffff8000001065cb:	80 ff ff 
ffff8000001065ce:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065d3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065dd:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001065e4:	80 ff ff 
ffff8000001065e7:	ff d1                	callq  *%rcx
ffff8000001065e9:	48 ba 7f 24 11 00 00 	movabs $0xffff80000011247f,%rdx
ffff8000001065f0:	80 ff ff 
ffff8000001065f3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065f8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065fd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106602:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106609:	80 ff ff 
ffff80000010660c:	ff d1                	callq  *%rcx
ffff80000010660e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106612:	48 89 c1             	mov    %rax,%rcx
ffff800000106615:	48 ba 81 24 11 00 00 	movabs $0xffff800000112481,%rdx
ffff80000010661c:	80 ff ff 
ffff80000010661f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106624:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106629:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010662e:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106635:	80 ff ff 
ffff800000106638:	41 ff d0             	callq  *%r8
ffff80000010663b:	eb fe                	jmp    ffff80000010663b <do_page_fault+0x1fd>

ffff80000010663d <do_x87_FPU_error>:
ffff80000010663d:	55                   	push   %rbp
ffff80000010663e:	48 89 e5             	mov    %rsp,%rbp
ffff800000106641:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106645:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106649:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010664d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106651:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106658:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010665c:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106663:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106667:	49 89 c9             	mov    %rcx,%r9
ffff80000010666a:	49 89 d0             	mov    %rdx,%r8
ffff80000010666d:	48 89 c1             	mov    %rax,%rcx
ffff800000106670:	48 ba 90 24 11 00 00 	movabs $0xffff800000112490,%rdx
ffff800000106677:	80 ff ff 
ffff80000010667a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010667f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106684:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106689:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106690:	80 ff ff 
ffff800000106693:	41 ff d2             	callq  *%r10
ffff800000106696:	eb fe                	jmp    ffff800000106696 <do_x87_FPU_error+0x59>

ffff800000106698 <do_alignment_check>:
ffff800000106698:	55                   	push   %rbp
ffff800000106699:	48 89 e5             	mov    %rsp,%rbp
ffff80000010669c:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001066a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001066a4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001066a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001066ac:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001066b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001066b7:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001066be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001066c2:	49 89 c9             	mov    %rcx,%r9
ffff8000001066c5:	49 89 d0             	mov    %rdx,%r8
ffff8000001066c8:	48 89 c1             	mov    %rax,%rcx
ffff8000001066cb:	48 ba d8 24 11 00 00 	movabs $0xffff8000001124d8,%rdx
ffff8000001066d2:	80 ff ff 
ffff8000001066d5:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001066da:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001066df:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066e4:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001066eb:	80 ff ff 
ffff8000001066ee:	41 ff d2             	callq  *%r10
ffff8000001066f1:	eb fe                	jmp    ffff8000001066f1 <do_alignment_check+0x59>

ffff8000001066f3 <do_machine_check>:
ffff8000001066f3:	55                   	push   %rbp
ffff8000001066f4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001066f7:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001066fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001066ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106703:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106707:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff80000010670e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106712:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106719:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010671d:	49 89 c9             	mov    %rcx,%r9
ffff800000106720:	49 89 d0             	mov    %rdx,%r8
ffff800000106723:	48 89 c1             	mov    %rax,%rcx
ffff800000106726:	48 ba 20 25 11 00 00 	movabs $0xffff800000112520,%rdx
ffff80000010672d:	80 ff ff 
ffff800000106730:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106735:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010673a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010673f:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106746:	80 ff ff 
ffff800000106749:	41 ff d2             	callq  *%r10
ffff80000010674c:	eb fe                	jmp    ffff80000010674c <do_machine_check+0x59>

ffff80000010674e <do_SIMD_exception>:
ffff80000010674e:	55                   	push   %rbp
ffff80000010674f:	48 89 e5             	mov    %rsp,%rbp
ffff800000106752:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106756:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010675a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010675e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106762:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106769:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010676d:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106774:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106778:	49 89 c9             	mov    %rcx,%r9
ffff80000010677b:	49 89 d0             	mov    %rdx,%r8
ffff80000010677e:	48 89 c1             	mov    %rax,%rcx
ffff800000106781:	48 ba 68 25 11 00 00 	movabs $0xffff800000112568,%rdx
ffff800000106788:	80 ff ff 
ffff80000010678b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106790:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106795:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010679a:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001067a1:	80 ff ff 
ffff8000001067a4:	41 ff d2             	callq  *%r10
ffff8000001067a7:	eb fe                	jmp    ffff8000001067a7 <do_SIMD_exception+0x59>

ffff8000001067a9 <do_virtualization_exception>:
ffff8000001067a9:	55                   	push   %rbp
ffff8000001067aa:	48 89 e5             	mov    %rsp,%rbp
ffff8000001067ad:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001067b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001067b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001067b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001067bd:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001067c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001067c8:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001067cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001067d3:	49 89 c9             	mov    %rcx,%r9
ffff8000001067d6:	49 89 d0             	mov    %rdx,%r8
ffff8000001067d9:	48 89 c1             	mov    %rax,%rcx
ffff8000001067dc:	48 ba b0 25 11 00 00 	movabs $0xffff8000001125b0,%rdx
ffff8000001067e3:	80 ff ff 
ffff8000001067e6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001067eb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001067f0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067f5:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001067fc:	80 ff ff 
ffff8000001067ff:	41 ff d2             	callq  *%r10
ffff800000106802:	eb fe                	jmp    ffff800000106802 <do_virtualization_exception+0x59>

ffff800000106804 <sys_vector_init>:
ffff800000106804:	55                   	push   %rbp
ffff800000106805:	48 89 e5             	mov    %rsp,%rbp
ffff800000106808:	48 ba 92 40 10 00 00 	movabs $0xffff800000104092,%rdx
ffff80000010680f:	80 ff ff 
ffff800000106812:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106817:	bf 00 00 00 00       	mov    $0x0,%edi
ffff80000010681c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106823:	80 ff ff 
ffff800000106826:	ff d0                	callq  *%rax
ffff800000106828:	48 ba ea 40 10 00 00 	movabs $0xffff8000001040ea,%rdx
ffff80000010682f:	80 ff ff 
ffff800000106832:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106837:	bf 01 00 00 00       	mov    $0x1,%edi
ffff80000010683c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106843:	80 ff ff 
ffff800000106846:	ff d0                	callq  *%rax
ffff800000106848:	48 ba fa 40 10 00 00 	movabs $0xffff8000001040fa,%rdx
ffff80000010684f:	80 ff ff 
ffff800000106852:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106857:	bf 02 00 00 00       	mov    $0x2,%edi
ffff80000010685c:	48 b8 52 58 10 00 00 	movabs $0xffff800000105852,%rax
ffff800000106863:	80 ff ff 
ffff800000106866:	ff d0                	callq  *%rax
ffff800000106868:	48 ba 40 41 10 00 00 	movabs $0xffff800000104140,%rdx
ffff80000010686f:	80 ff ff 
ffff800000106872:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106877:	bf 03 00 00 00       	mov    $0x3,%edi
ffff80000010687c:	48 b8 70 59 10 00 00 	movabs $0xffff800000105970,%rax
ffff800000106883:	80 ff ff 
ffff800000106886:	ff d0                	callq  *%rax
ffff800000106888:	48 ba 53 41 10 00 00 	movabs $0xffff800000104153,%rdx
ffff80000010688f:	80 ff ff 
ffff800000106892:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106897:	bf 04 00 00 00       	mov    $0x4,%edi
ffff80000010689c:	48 b8 70 59 10 00 00 	movabs $0xffff800000105970,%rax
ffff8000001068a3:	80 ff ff 
ffff8000001068a6:	ff d0                	callq  *%rax
ffff8000001068a8:	48 ba 66 41 10 00 00 	movabs $0xffff800000104166,%rdx
ffff8000001068af:	80 ff ff 
ffff8000001068b2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068b7:	bf 05 00 00 00       	mov    $0x5,%edi
ffff8000001068bc:	48 b8 70 59 10 00 00 	movabs $0xffff800000105970,%rax
ffff8000001068c3:	80 ff ff 
ffff8000001068c6:	ff d0                	callq  *%rax
ffff8000001068c8:	48 ba 79 41 10 00 00 	movabs $0xffff800000104179,%rdx
ffff8000001068cf:	80 ff ff 
ffff8000001068d2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068d7:	bf 06 00 00 00       	mov    $0x6,%edi
ffff8000001068dc:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff8000001068e3:	80 ff ff 
ffff8000001068e6:	ff d0                	callq  *%rax
ffff8000001068e8:	48 ba 8c 41 10 00 00 	movabs $0xffff80000010418c,%rdx
ffff8000001068ef:	80 ff ff 
ffff8000001068f2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068f7:	bf 07 00 00 00       	mov    $0x7,%edi
ffff8000001068fc:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106903:	80 ff ff 
ffff800000106906:	ff d0                	callq  *%rax
ffff800000106908:	48 ba 9f 41 10 00 00 	movabs $0xffff80000010419f,%rdx
ffff80000010690f:	80 ff ff 
ffff800000106912:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106917:	bf 08 00 00 00       	mov    $0x8,%edi
ffff80000010691c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106923:	80 ff ff 
ffff800000106926:	ff d0                	callq  *%rax
ffff800000106928:	48 ba b0 41 10 00 00 	movabs $0xffff8000001041b0,%rdx
ffff80000010692f:	80 ff ff 
ffff800000106932:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106937:	bf 09 00 00 00       	mov    $0x9,%edi
ffff80000010693c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106943:	80 ff ff 
ffff800000106946:	ff d0                	callq  *%rax
ffff800000106948:	48 ba c3 41 10 00 00 	movabs $0xffff8000001041c3,%rdx
ffff80000010694f:	80 ff ff 
ffff800000106952:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106957:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff80000010695c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106963:	80 ff ff 
ffff800000106966:	ff d0                	callq  *%rax
ffff800000106968:	48 ba d4 41 10 00 00 	movabs $0xffff8000001041d4,%rdx
ffff80000010696f:	80 ff ff 
ffff800000106972:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106977:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff80000010697c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106983:	80 ff ff 
ffff800000106986:	ff d0                	callq  *%rax
ffff800000106988:	48 ba e5 41 10 00 00 	movabs $0xffff8000001041e5,%rdx
ffff80000010698f:	80 ff ff 
ffff800000106992:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106997:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff80000010699c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff8000001069a3:	80 ff ff 
ffff8000001069a6:	ff d0                	callq  *%rax
ffff8000001069a8:	48 ba f6 41 10 00 00 	movabs $0xffff8000001041f6,%rdx
ffff8000001069af:	80 ff ff 
ffff8000001069b2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069b7:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff8000001069bc:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff8000001069c3:	80 ff ff 
ffff8000001069c6:	ff d0                	callq  *%rax
ffff8000001069c8:	48 ba 07 42 10 00 00 	movabs $0xffff800000104207,%rdx
ffff8000001069cf:	80 ff ff 
ffff8000001069d2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069d7:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff8000001069dc:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff8000001069e3:	80 ff ff 
ffff8000001069e6:	ff d0                	callq  *%rax
ffff8000001069e8:	48 ba 18 42 10 00 00 	movabs $0xffff800000104218,%rdx
ffff8000001069ef:	80 ff ff 
ffff8000001069f2:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069f7:	bf 10 00 00 00       	mov    $0x10,%edi
ffff8000001069fc:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106a03:	80 ff ff 
ffff800000106a06:	ff d0                	callq  *%rax
ffff800000106a08:	48 ba 2b 42 10 00 00 	movabs $0xffff80000010422b,%rdx
ffff800000106a0f:	80 ff ff 
ffff800000106a12:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a17:	bf 11 00 00 00       	mov    $0x11,%edi
ffff800000106a1c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106a23:	80 ff ff 
ffff800000106a26:	ff d0                	callq  *%rax
ffff800000106a28:	48 ba 3c 42 10 00 00 	movabs $0xffff80000010423c,%rdx
ffff800000106a2f:	80 ff ff 
ffff800000106a32:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a37:	bf 12 00 00 00       	mov    $0x12,%edi
ffff800000106a3c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106a43:	80 ff ff 
ffff800000106a46:	ff d0                	callq  *%rax
ffff800000106a48:	48 ba 4f 42 10 00 00 	movabs $0xffff80000010424f,%rdx
ffff800000106a4f:	80 ff ff 
ffff800000106a52:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a57:	bf 13 00 00 00       	mov    $0x13,%edi
ffff800000106a5c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106a63:	80 ff ff 
ffff800000106a66:	ff d0                	callq  *%rax
ffff800000106a68:	48 ba 62 42 10 00 00 	movabs $0xffff800000104262,%rdx
ffff800000106a6f:	80 ff ff 
ffff800000106a72:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a77:	bf 14 00 00 00       	mov    $0x14,%edi
ffff800000106a7c:	48 b8 e1 58 10 00 00 	movabs $0xffff8000001058e1,%rax
ffff800000106a83:	80 ff ff 
ffff800000106a86:	ff d0                	callq  *%rax
ffff800000106a88:	90                   	nop
ffff800000106a89:	5d                   	pop    %rbp
ffff800000106a8a:	c3                   	retq   

ffff800000106a8b <memset>:
ffff800000106a8b:	55                   	push   %rbp
ffff800000106a8c:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a8f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106a93:	89 f0                	mov    %esi,%eax
ffff800000106a95:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000106a99:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000106a9c:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000106aa0:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000106aa7:	01 01 01 
ffff800000106aaa:	48 0f af c2          	imul   %rdx,%rax
ffff800000106aae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000106ab2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106ab6:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000106aba:	48 85 c0             	test   %rax,%rax
ffff800000106abd:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000106ac1:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000106ac5:	48 89 c1             	mov    %rax,%rcx
ffff800000106ac8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106acc:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff800000106ad0:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000106ad4:	48 89 d7             	mov    %rdx,%rdi
ffff800000106ad7:	fc                   	cld    
ffff800000106ad8:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff800000106adb:	40 f6 c6 04          	test   $0x4,%sil
ffff800000106adf:	74 01                	je     ffff800000106ae2 <memset+0x57>
ffff800000106ae1:	ab                   	stos   %eax,%es:(%rdi)
ffff800000106ae2:	40 f6 c6 02          	test   $0x2,%sil
ffff800000106ae6:	74 02                	je     ffff800000106aea <memset+0x5f>
ffff800000106ae8:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000106aea:	40 f6 c6 01          	test   $0x1,%sil
ffff800000106aee:	74 01                	je     ffff800000106af1 <memset+0x66>
ffff800000106af0:	aa                   	stos   %al,%es:(%rdi)
ffff800000106af1:	89 f8                	mov    %edi,%eax
ffff800000106af3:	89 ca                	mov    %ecx,%edx
ffff800000106af5:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000106af8:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff800000106afb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106aff:	5d                   	pop    %rbp
ffff800000106b00:	c3                   	retq   

ffff800000106b01 <Get_gdt>:
ffff800000106b01:	55                   	push   %rbp
ffff800000106b02:	48 89 e5             	mov    %rsp,%rbp
ffff800000106b05:	0f 20 d8             	mov    %cr3,%rax
ffff800000106b08:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000106b0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b10:	5d                   	pop    %rbp
ffff800000106b11:	c3                   	retq   

ffff800000106b12 <page_init>:
ffff800000106b12:	55                   	push   %rbp
ffff800000106b13:	48 89 e5             	mov    %rsp,%rbp
ffff800000106b16:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106b1a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106b1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b22:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106b26:	48 85 c0             	test   %rax,%rax
ffff800000106b29:	0f 85 c8 00 00 00    	jne    ffff800000106bf7 <page_init+0xe5>
ffff800000106b2f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106b36:	80 ff ff 
ffff800000106b39:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106b40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b44:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b48:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106b4c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106b50:	48 01 d0             	add    %rdx,%rax
ffff800000106b53:	48 8b 10             	mov    (%rax),%rdx
ffff800000106b56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b5a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b5e:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106b62:	83 e0 3f             	and    $0x3f,%eax
ffff800000106b65:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106b6a:	89 c1                	mov    %eax,%ecx
ffff800000106b6c:	48 d3 e6             	shl    %cl,%rsi
ffff800000106b6f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106b76:	80 ff ff 
ffff800000106b79:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106b80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b84:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b88:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106b8c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106b90:	48 01 c8             	add    %rcx,%rax
ffff800000106b93:	48 09 f2             	or     %rsi,%rdx
ffff800000106b96:	48 89 10             	mov    %rdx,(%rax)
ffff800000106b99:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b9d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000106ba1:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106ba5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ba9:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106bad:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106bb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bb5:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106bb9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bbd:	48 8b 00             	mov    (%rax),%rax
ffff800000106bc0:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106bc4:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106bc8:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106bcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bd0:	48 8b 00             	mov    (%rax),%rax
ffff800000106bd3:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106bd7:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106bdb:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106bdf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106be3:	48 8b 00             	mov    (%rax),%rax
ffff800000106be6:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106bea:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106bee:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106bf2:	e9 00 01 00 00       	jmpq   ffff800000106cf7 <page_init+0x1e5>
ffff800000106bf7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bfb:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106bff:	83 e0 04             	and    $0x4,%eax
ffff800000106c02:	48 85 c0             	test   %rax,%rax
ffff800000106c05:	75 2c                	jne    ffff800000106c33 <page_init+0x121>
ffff800000106c07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c0b:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c0f:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106c14:	48 85 c0             	test   %rax,%rax
ffff800000106c17:	75 1a                	jne    ffff800000106c33 <page_init+0x121>
ffff800000106c19:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106c1d:	83 e0 04             	and    $0x4,%eax
ffff800000106c20:	48 85 c0             	test   %rax,%rax
ffff800000106c23:	75 0e                	jne    ffff800000106c33 <page_init+0x121>
ffff800000106c25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106c29:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106c2e:	48 85 c0             	test   %rax,%rax
ffff800000106c31:	74 43                	je     ffff800000106c76 <page_init+0x164>
ffff800000106c33:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c37:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c3b:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106c3f:	48 89 c2             	mov    %rax,%rdx
ffff800000106c42:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c46:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106c4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c4e:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106c52:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106c56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c5a:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106c5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c62:	48 8b 00             	mov    (%rax),%rax
ffff800000106c65:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106c69:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106c6d:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106c71:	e9 81 00 00 00       	jmpq   ffff800000106cf7 <page_init+0x1e5>
ffff800000106c76:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106c7d:	80 ff ff 
ffff800000106c80:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106c87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c8b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c8f:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106c93:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106c97:	48 01 d0             	add    %rdx,%rax
ffff800000106c9a:	48 8b 10             	mov    (%rax),%rdx
ffff800000106c9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ca1:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ca5:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106ca9:	83 e0 3f             	and    $0x3f,%eax
ffff800000106cac:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106cb1:	89 c1                	mov    %eax,%ecx
ffff800000106cb3:	48 d3 e6             	shl    %cl,%rsi
ffff800000106cb6:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106cbd:	80 ff ff 
ffff800000106cc0:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106cc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ccb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ccf:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106cd3:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106cd7:	48 01 c8             	add    %rcx,%rax
ffff800000106cda:	48 09 f2             	or     %rsi,%rdx
ffff800000106cdd:	48 89 10             	mov    %rdx,(%rax)
ffff800000106ce0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ce4:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106ce8:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106cec:	48 89 c2             	mov    %rax,%rdx
ffff800000106cef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cf3:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106cf7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106cfc:	5d                   	pop    %rbp
ffff800000106cfd:	c3                   	retq   

ffff800000106cfe <page_clean>:
ffff800000106cfe:	55                   	push   %rbp
ffff800000106cff:	48 89 e5             	mov    %rsp,%rbp
ffff800000106d02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106d06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d0a:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d0e:	48 85 c0             	test   %rax,%rax
ffff800000106d11:	75 11                	jne    ffff800000106d24 <page_clean+0x26>
ffff800000106d13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d17:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106d1e:	00 
ffff800000106d1f:	e9 55 01 00 00       	jmpq   ffff800000106e79 <page_clean+0x17b>
ffff800000106d24:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d28:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d2c:	83 e0 04             	and    $0x4,%eax
ffff800000106d2f:	48 85 c0             	test   %rax,%rax
ffff800000106d32:	75 12                	jne    ffff800000106d46 <page_clean+0x48>
ffff800000106d34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d38:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d3c:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106d41:	48 85 c0             	test   %rax,%rax
ffff800000106d44:	74 6f                	je     ffff800000106db5 <page_clean+0xb7>
ffff800000106d46:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d4a:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106d4e:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106d52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d56:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106d5a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d5e:	48 8b 00             	mov    (%rax),%rax
ffff800000106d61:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106d65:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106d69:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106d6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d71:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106d75:	48 85 c0             	test   %rax,%rax
ffff800000106d78:	0f 85 fb 00 00 00    	jne    ffff800000106e79 <page_clean+0x17b>
ffff800000106d7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d82:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106d89:	00 
ffff800000106d8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d8e:	48 8b 00             	mov    (%rax),%rax
ffff800000106d91:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106d95:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106d99:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106d9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106da1:	48 8b 00             	mov    (%rax),%rax
ffff800000106da4:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106da8:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106dac:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106db0:	e9 c4 00 00 00       	jmpq   ffff800000106e79 <page_clean+0x17b>
ffff800000106db5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106dbc:	80 ff ff 
ffff800000106dbf:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106dc6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dca:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106dce:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106dd2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106dd6:	48 01 d0             	add    %rdx,%rax
ffff800000106dd9:	48 8b 10             	mov    (%rax),%rdx
ffff800000106ddc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106de0:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106de4:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106de8:	83 e0 3f             	and    $0x3f,%eax
ffff800000106deb:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106df0:	89 c1                	mov    %eax,%ecx
ffff800000106df2:	48 d3 e6             	shl    %cl,%rsi
ffff800000106df5:	48 89 f0             	mov    %rsi,%rax
ffff800000106df8:	48 f7 d0             	not    %rax
ffff800000106dfb:	48 89 c6             	mov    %rax,%rsi
ffff800000106dfe:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106e05:	80 ff ff 
ffff800000106e08:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106e0f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e13:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106e17:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106e1b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106e1f:	48 01 c8             	add    %rcx,%rax
ffff800000106e22:	48 21 f2             	and    %rsi,%rdx
ffff800000106e25:	48 89 10             	mov    %rdx,(%rax)
ffff800000106e28:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e2c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106e33:	00 
ffff800000106e34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e38:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000106e3f:	00 
ffff800000106e40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e44:	48 8b 00             	mov    (%rax),%rax
ffff800000106e47:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106e4b:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106e4f:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106e53:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e57:	48 8b 00             	mov    (%rax),%rax
ffff800000106e5a:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106e5e:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106e62:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106e66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e6a:	48 8b 00             	mov    (%rax),%rax
ffff800000106e6d:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106e71:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106e75:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106e79:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106e7e:	5d                   	pop    %rbp
ffff800000106e7f:	c3                   	retq   

ffff800000106e80 <init_memory>:
ffff800000106e80:	55                   	push   %rbp
ffff800000106e81:	48 89 e5             	mov    %rsp,%rbp
ffff800000106e84:	48 83 ec 60          	sub    $0x60,%rsp
ffff800000106e88:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000106e8f:	00 
ffff800000106e90:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106e97:	00 
ffff800000106e98:	48 ba 00 26 11 00 00 	movabs $0xffff800000112600,%rdx
ffff800000106e9f:	80 ff ff 
ffff800000106ea2:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106ea7:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106eac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106eb1:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106eb8:	80 ff ff 
ffff800000106ebb:	ff d1                	callq  *%rcx
ffff800000106ebd:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106ec4:	80 ff ff 
ffff800000106ec7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106ecb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000106ed2:	e9 ec 00 00 00       	jmpq   ffff800000106fc3 <init_memory+0x143>
ffff800000106ed7:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000106ede:	00 
ffff800000106edf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ee3:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106ee6:	83 f8 01             	cmp    $0x1,%eax
ffff800000106ee9:	75 0c                	jne    ffff800000106ef7 <init_memory+0x77>
ffff800000106eeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106eef:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ef3:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff800000106ef7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106efb:	48 8b 10             	mov    (%rax),%rdx
ffff800000106efe:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f05:	80 ff ff 
ffff800000106f08:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f0b:	48 63 c8             	movslq %eax,%rcx
ffff800000106f0e:	48 89 c8             	mov    %rcx,%rax
ffff800000106f11:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f15:	48 01 c8             	add    %rcx,%rax
ffff800000106f18:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f1c:	48 01 f0             	add    %rsi,%rax
ffff800000106f1f:	48 89 10             	mov    %rdx,(%rax)
ffff800000106f22:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f26:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106f2a:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f31:	80 ff ff 
ffff800000106f34:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f37:	48 63 c8             	movslq %eax,%rcx
ffff800000106f3a:	48 89 c8             	mov    %rcx,%rax
ffff800000106f3d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f41:	48 01 c8             	add    %rcx,%rax
ffff800000106f44:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f48:	48 01 f0             	add    %rsi,%rax
ffff800000106f4b:	48 83 c0 08          	add    $0x8,%rax
ffff800000106f4f:	48 89 10             	mov    %rdx,(%rax)
ffff800000106f52:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f56:	8b 50 10             	mov    0x10(%rax),%edx
ffff800000106f59:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f60:	80 ff ff 
ffff800000106f63:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f66:	48 63 c8             	movslq %eax,%rcx
ffff800000106f69:	48 89 c8             	mov    %rcx,%rax
ffff800000106f6c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f70:	48 01 c8             	add    %rcx,%rax
ffff800000106f73:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f77:	48 01 f0             	add    %rsi,%rax
ffff800000106f7a:	48 83 c0 10          	add    $0x10,%rax
ffff800000106f7e:	89 10                	mov    %edx,(%rax)
ffff800000106f80:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f83:	48 98                	cltq   
ffff800000106f85:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff800000106f8c:	80 ff ff 
ffff800000106f8f:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
ffff800000106f96:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
ffff800000106f9b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f9f:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106fa2:	83 f8 04             	cmp    $0x4,%eax
ffff800000106fa5:	77 26                	ja     ffff800000106fcd <init_memory+0x14d>
ffff800000106fa7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fab:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106faf:	48 85 c0             	test   %rax,%rax
ffff800000106fb2:	74 19                	je     ffff800000106fcd <init_memory+0x14d>
ffff800000106fb4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fb8:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106fbb:	85 c0                	test   %eax,%eax
ffff800000106fbd:	74 0e                	je     ffff800000106fcd <init_memory+0x14d>
ffff800000106fbf:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000106fc3:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
ffff800000106fc7:	0f 8e 0a ff ff ff    	jle    ffff800000106ed7 <init_memory+0x57>
ffff800000106fcd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106fd1:	48 89 c1             	mov    %rax,%rcx
ffff800000106fd4:	48 ba 78 26 11 00 00 	movabs $0xffff800000112678,%rdx
ffff800000106fdb:	80 ff ff 
ffff800000106fde:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106fe3:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000106fe8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106fed:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106ff4:	80 ff ff 
ffff800000106ff7:	41 ff d0             	callq  *%r8
ffff800000106ffa:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000107001:	00 
ffff800000107002:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000107009:	e9 e1 00 00 00       	jmpq   ffff8000001070ef <init_memory+0x26f>
ffff80000010700e:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107015:	80 ff ff 
ffff800000107018:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010701b:	48 63 d0             	movslq %eax,%rdx
ffff80000010701e:	48 89 d0             	mov    %rdx,%rax
ffff800000107021:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107025:	48 01 d0             	add    %rdx,%rax
ffff800000107028:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010702c:	48 01 c8             	add    %rcx,%rax
ffff80000010702f:	48 83 c0 10          	add    $0x10,%rax
ffff800000107033:	8b 00                	mov    (%rax),%eax
ffff800000107035:	83 f8 01             	cmp    $0x1,%eax
ffff800000107038:	0f 85 a9 00 00 00    	jne    ffff8000001070e7 <init_memory+0x267>
ffff80000010703e:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107045:	80 ff ff 
ffff800000107048:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010704b:	48 63 d0             	movslq %eax,%rdx
ffff80000010704e:	48 89 d0             	mov    %rdx,%rax
ffff800000107051:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107055:	48 01 d0             	add    %rdx,%rax
ffff800000107058:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010705c:	48 01 c8             	add    %rcx,%rax
ffff80000010705f:	48 8b 00             	mov    (%rax),%rax
ffff800000107062:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107068:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010706e:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107072:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107079:	80 ff ff 
ffff80000010707c:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010707f:	48 63 d0             	movslq %eax,%rdx
ffff800000107082:	48 89 d0             	mov    %rdx,%rax
ffff800000107085:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107089:	48 01 d0             	add    %rdx,%rax
ffff80000010708c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107090:	48 01 c8             	add    %rcx,%rax
ffff800000107093:	48 8b 08             	mov    (%rax),%rcx
ffff800000107096:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010709d:	80 ff ff 
ffff8000001070a0:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070a3:	48 63 d0             	movslq %eax,%rdx
ffff8000001070a6:	48 89 d0             	mov    %rdx,%rax
ffff8000001070a9:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070ad:	48 01 d0             	add    %rdx,%rax
ffff8000001070b0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070b4:	48 01 f0             	add    %rsi,%rax
ffff8000001070b7:	48 83 c0 08          	add    $0x8,%rax
ffff8000001070bb:	48 8b 00             	mov    (%rax),%rax
ffff8000001070be:	48 01 c8             	add    %rcx,%rax
ffff8000001070c1:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001070c7:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001070cb:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001070cf:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff8000001070d3:	76 15                	jbe    ffff8000001070ea <init_memory+0x26a>
ffff8000001070d5:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001070d9:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff8000001070dd:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001070e1:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff8000001070e5:	eb 04                	jmp    ffff8000001070eb <init_memory+0x26b>
ffff8000001070e7:	90                   	nop
ffff8000001070e8:	eb 01                	jmp    ffff8000001070eb <init_memory+0x26b>
ffff8000001070ea:	90                   	nop
ffff8000001070eb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001070ef:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070f2:	48 63 d0             	movslq %eax,%rdx
ffff8000001070f5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001070fc:	80 ff ff 
ffff8000001070ff:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000107106:	48 39 c2             	cmp    %rax,%rdx
ffff800000107109:	0f 86 ff fe ff ff    	jbe    ffff80000010700e <init_memory+0x18e>
ffff80000010710f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000107113:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107117:	49 89 d0             	mov    %rdx,%r8
ffff80000010711a:	48 89 c1             	mov    %rax,%rcx
ffff80000010711d:	48 ba 98 26 11 00 00 	movabs $0xffff800000112698,%rdx
ffff800000107124:	80 ff ff 
ffff800000107127:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010712c:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107131:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107136:	49 b9 29 53 10 00 00 	movabs $0xffff800000105329,%r9
ffff80000010713d:	80 ff ff 
ffff800000107140:	41 ff d1             	callq  *%r9
ffff800000107143:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010714a:	80 ff ff 
ffff80000010714d:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000107154:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff80000010715b:	80 ff ff 
ffff80000010715e:	48 89 d0             	mov    %rdx,%rax
ffff800000107161:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107165:	48 01 d0             	add    %rdx,%rax
ffff800000107168:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010716c:	48 01 c8             	add    %rcx,%rax
ffff80000010716f:	48 8b 08             	mov    (%rax),%rcx
ffff800000107172:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107179:	80 ff ff 
ffff80000010717c:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000107183:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010718a:	80 ff ff 
ffff80000010718d:	48 89 d0             	mov    %rdx,%rax
ffff800000107190:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107194:	48 01 d0             	add    %rdx,%rax
ffff800000107197:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010719b:	48 01 f0             	add    %rsi,%rax
ffff80000010719e:	48 83 c0 08          	add    $0x8,%rax
ffff8000001071a2:	48 8b 00             	mov    (%rax),%rax
ffff8000001071a5:	48 01 c8             	add    %rcx,%rax
ffff8000001071a8:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001071ac:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071b3:	80 ff ff 
ffff8000001071b6:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff8000001071bd:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff8000001071c3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff8000001071c9:	48 89 c2             	mov    %rax,%rdx
ffff8000001071cc:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071d3:	80 ff ff 
ffff8000001071d6:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff8000001071dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001071e1:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001071e5:	48 89 c2             	mov    %rax,%rdx
ffff8000001071e8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071ef:	80 ff ff 
ffff8000001071f2:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff8000001071f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001071fd:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107201:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000107205:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000107209:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff80000010720d:	48 89 c2             	mov    %rax,%rdx
ffff800000107210:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107217:	80 ff ff 
ffff80000010721a:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff800000107221:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107228:	80 ff ff 
ffff80000010722b:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000107232:	48 89 c2             	mov    %rax,%rdx
ffff800000107235:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010723c:	80 ff ff 
ffff80000010723f:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107246:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010724b:	48 89 c7             	mov    %rax,%rdi
ffff80000010724e:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff800000107255:	80 ff ff 
ffff800000107258:	ff d0                	callq  *%rax
ffff80000010725a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107261:	80 ff ff 
ffff800000107264:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff80000010726b:	48 89 c2             	mov    %rax,%rdx
ffff80000010726e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107275:	80 ff ff 
ffff800000107278:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff80000010727f:	48 01 d0             	add    %rdx,%rax
ffff800000107282:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000107288:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff80000010728e:	48 89 c2             	mov    %rax,%rdx
ffff800000107291:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107298:	80 ff ff 
ffff80000010729b:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff8000001072a2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001072a6:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072aa:	48 89 c2             	mov    %rax,%rdx
ffff8000001072ad:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072b4:	80 ff ff 
ffff8000001072b7:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff8000001072be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001072c2:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072c6:	48 89 c2             	mov    %rax,%rdx
ffff8000001072c9:	48 89 d0             	mov    %rdx,%rax
ffff8000001072cc:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001072d0:	48 01 d0             	add    %rdx,%rax
ffff8000001072d3:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001072d7:	48 83 c0 07          	add    $0x7,%rax
ffff8000001072db:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001072df:	48 89 c2             	mov    %rax,%rdx
ffff8000001072e2:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072e9:	80 ff ff 
ffff8000001072ec:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff8000001072f3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072fa:	80 ff ff 
ffff8000001072fd:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000107304:	48 89 c2             	mov    %rax,%rdx
ffff800000107307:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010730e:	80 ff ff 
ffff800000107311:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107318:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010731d:	48 89 c7             	mov    %rax,%rdi
ffff800000107320:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff800000107327:	80 ff ff 
ffff80000010732a:	ff d0                	callq  *%rax
ffff80000010732c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107333:	80 ff ff 
ffff800000107336:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010733d:	48 89 c2             	mov    %rax,%rdx
ffff800000107340:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107347:	80 ff ff 
ffff80000010734a:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000107351:	48 01 d0             	add    %rdx,%rax
ffff800000107354:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff80000010735a:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107360:	48 89 c2             	mov    %rax,%rdx
ffff800000107363:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010736a:	80 ff ff 
ffff80000010736d:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107374:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010737b:	80 ff ff 
ffff80000010737e:	48 c7 80 c0 02 00 00 	movq   $0x0,0x2c0(%rax)
ffff800000107385:	00 00 00 00 
ffff800000107389:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107390:	80 ff ff 
ffff800000107393:	48 c7 80 c8 02 00 00 	movq   $0x190,0x2c8(%rax)
ffff80000010739a:	90 01 00 00 
ffff80000010739e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073a5:	80 ff ff 
ffff8000001073a8:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001073af:	48 89 c2             	mov    %rax,%rdx
ffff8000001073b2:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073b9:	80 ff ff 
ffff8000001073bc:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001073c3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001073c8:	48 89 c7             	mov    %rax,%rdi
ffff8000001073cb:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff8000001073d2:	80 ff ff 
ffff8000001073d5:	ff d0                	callq  *%rax
ffff8000001073d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001073de:	e9 e1 02 00 00       	jmpq   ffff8000001076c4 <init_memory+0x844>
ffff8000001073e3:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001073ea:	80 ff ff 
ffff8000001073ed:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001073f0:	48 63 d0             	movslq %eax,%rdx
ffff8000001073f3:	48 89 d0             	mov    %rdx,%rax
ffff8000001073f6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001073fa:	48 01 d0             	add    %rdx,%rax
ffff8000001073fd:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107401:	48 01 c8             	add    %rcx,%rax
ffff800000107404:	48 83 c0 10          	add    $0x10,%rax
ffff800000107408:	8b 00                	mov    (%rax),%eax
ffff80000010740a:	83 f8 01             	cmp    $0x1,%eax
ffff80000010740d:	0f 85 a9 02 00 00    	jne    ffff8000001076bc <init_memory+0x83c>
ffff800000107413:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff80000010741a:	80 ff ff 
ffff80000010741d:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107420:	48 63 d0             	movslq %eax,%rdx
ffff800000107423:	48 89 d0             	mov    %rdx,%rax
ffff800000107426:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010742a:	48 01 d0             	add    %rdx,%rax
ffff80000010742d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107431:	48 01 c8             	add    %rcx,%rax
ffff800000107434:	48 8b 00             	mov    (%rax),%rax
ffff800000107437:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff80000010743d:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107443:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107447:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff80000010744e:	80 ff ff 
ffff800000107451:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107454:	48 63 d0             	movslq %eax,%rdx
ffff800000107457:	48 89 d0             	mov    %rdx,%rax
ffff80000010745a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010745e:	48 01 d0             	add    %rdx,%rax
ffff800000107461:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107465:	48 01 c8             	add    %rcx,%rax
ffff800000107468:	48 8b 08             	mov    (%rax),%rcx
ffff80000010746b:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000107472:	80 ff ff 
ffff800000107475:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107478:	48 63 d0             	movslq %eax,%rdx
ffff80000010747b:	48 89 d0             	mov    %rdx,%rax
ffff80000010747e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107482:	48 01 d0             	add    %rdx,%rax
ffff800000107485:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107489:	48 01 f0             	add    %rsi,%rax
ffff80000010748c:	48 83 c0 08          	add    $0x8,%rax
ffff800000107490:	48 8b 00             	mov    (%rax),%rax
ffff800000107493:	48 01 c8             	add    %rcx,%rax
ffff800000107496:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010749c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff8000001074a0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001074a4:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
ffff8000001074a8:	0f 86 11 02 00 00    	jbe    ffff8000001076bf <init_memory+0x83f>
ffff8000001074ae:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074b5:	80 ff ff 
ffff8000001074b8:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001074bf:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074c6:	80 ff ff 
ffff8000001074c9:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff8000001074d0:	48 89 d0             	mov    %rdx,%rax
ffff8000001074d3:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074d7:	48 01 d0             	add    %rdx,%rax
ffff8000001074da:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001074de:	48 01 c8             	add    %rcx,%rax
ffff8000001074e1:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001074e5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074ec:	80 ff ff 
ffff8000001074ef:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff8000001074f6:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001074fa:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107501:	80 ff ff 
ffff800000107504:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff80000010750b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010750f:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff800000107513:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000107517:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010751b:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff80000010751f:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000107523:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107527:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff80000010752b:	48 89 c2             	mov    %rax,%rdx
ffff80000010752e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107532:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000107536:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010753a:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000107541:	00 
ffff800000107542:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107546:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff80000010754a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010754e:	48 89 c2             	mov    %rax,%rdx
ffff800000107551:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107555:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107559:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010755d:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff800000107564:	00 
ffff800000107565:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107569:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff800000107570:	00 
ffff800000107571:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107575:	48 bf a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdi
ffff80000010757c:	80 ff ff 
ffff80000010757f:	48 89 78 30          	mov    %rdi,0x30(%rax)
ffff800000107583:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107587:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff80000010758b:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010758f:	48 89 c2             	mov    %rax,%rdx
ffff800000107592:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107596:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010759a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001075a1:	80 ff ff 
ffff8000001075a4:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001075ab:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001075af:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001075b3:	48 89 c2             	mov    %rax,%rdx
ffff8000001075b6:	48 89 d0             	mov    %rdx,%rax
ffff8000001075b9:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001075bd:	48 01 d0             	add    %rdx,%rax
ffff8000001075c0:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001075c4:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001075c8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075cc:	48 89 10             	mov    %rdx,(%rax)
ffff8000001075cf:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075d3:	48 8b 00             	mov    (%rax),%rax
ffff8000001075d6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001075da:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001075e1:	e9 bd 00 00 00       	jmpq   ffff8000001076a3 <init_memory+0x823>
ffff8000001075e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001075ea:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff8000001075ee:	48 89 10             	mov    %rdx,(%rax)
ffff8000001075f1:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff8000001075f4:	48 98                	cltq   
ffff8000001075f6:	48 c1 e0 15          	shl    $0x15,%rax
ffff8000001075fa:	48 89 c2             	mov    %rax,%rdx
ffff8000001075fd:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107601:	48 01 c2             	add    %rax,%rdx
ffff800000107604:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107608:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010760c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107610:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107617:	00 
ffff800000107618:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010761c:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000107623:	00 
ffff800000107624:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107628:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010762f:	00 
ffff800000107630:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107637:	80 ff ff 
ffff80000010763a:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107641:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107645:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107649:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010764d:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107651:	48 01 d0             	add    %rdx,%rax
ffff800000107654:	48 8b 10             	mov    (%rax),%rdx
ffff800000107657:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010765b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010765f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107663:	83 e0 3f             	and    $0x3f,%eax
ffff800000107666:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010766b:	89 c1                	mov    %eax,%ecx
ffff80000010766d:	48 d3 e6             	shl    %cl,%rsi
ffff800000107670:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107677:	80 ff ff 
ffff80000010767a:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000107681:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107685:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107689:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff80000010768d:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107691:	48 01 c8             	add    %rcx,%rax
ffff800000107694:	48 31 f2             	xor    %rsi,%rdx
ffff800000107697:	48 89 10             	mov    %rdx,(%rax)
ffff80000010769a:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff80000010769e:	48 83 45 e0 28       	addq   $0x28,-0x20(%rbp)
ffff8000001076a3:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff8000001076a6:	48 63 d0             	movslq %eax,%rdx
ffff8000001076a9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001076ad:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001076b1:	48 39 c2             	cmp    %rax,%rdx
ffff8000001076b4:	0f 82 2c ff ff ff    	jb     ffff8000001075e6 <init_memory+0x766>
ffff8000001076ba:	eb 04                	jmp    ffff8000001076c0 <init_memory+0x840>
ffff8000001076bc:	90                   	nop
ffff8000001076bd:	eb 01                	jmp    ffff8000001076c0 <init_memory+0x840>
ffff8000001076bf:	90                   	nop
ffff8000001076c0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001076c4:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001076c7:	48 63 d0             	movslq %eax,%rdx
ffff8000001076ca:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001076d1:	80 ff ff 
ffff8000001076d4:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001076db:	48 39 c2             	cmp    %rax,%rdx
ffff8000001076de:	0f 86 ff fc ff ff    	jbe    ffff8000001073e3 <init_memory+0x563>
ffff8000001076e4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001076eb:	80 ff ff 
ffff8000001076ee:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001076f5:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff8000001076fc:	80 ff ff 
ffff8000001076ff:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff800000107706:	48 89 10             	mov    %rdx,(%rax)
ffff800000107709:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107710:	80 ff ff 
ffff800000107713:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010771a:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff800000107721:	00 
ffff800000107722:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107729:	80 ff ff 
ffff80000010772c:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107733:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff80000010773a:	00 
ffff80000010773b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107742:	80 ff ff 
ffff800000107745:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010774c:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000107753:	00 
ffff800000107754:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010775b:	80 ff ff 
ffff80000010775e:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107765:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010776c:	00 
ffff80000010776d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107774:	80 ff ff 
ffff800000107777:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff80000010777e:	48 89 d0             	mov    %rdx,%rax
ffff800000107781:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107785:	48 01 d0             	add    %rdx,%rax
ffff800000107788:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010778c:	48 83 c0 07          	add    $0x7,%rax
ffff800000107790:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107794:	48 89 c2             	mov    %rax,%rdx
ffff800000107797:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010779e:	80 ff ff 
ffff8000001077a1:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff8000001077a8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077af:	80 ff ff 
ffff8000001077b2:	48 8b 88 98 02 00 00 	mov    0x298(%rax),%rcx
ffff8000001077b9:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077c0:	80 ff ff 
ffff8000001077c3:	48 8b 90 90 02 00 00 	mov    0x290(%rax),%rdx
ffff8000001077ca:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077d1:	80 ff ff 
ffff8000001077d4:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001077db:	49 89 c9             	mov    %rcx,%r9
ffff8000001077de:	49 89 d0             	mov    %rdx,%r8
ffff8000001077e1:	48 89 c1             	mov    %rax,%rcx
ffff8000001077e4:	48 ba c8 26 11 00 00 	movabs $0xffff8000001126c8,%rdx
ffff8000001077eb:	80 ff ff 
ffff8000001077ee:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001077f3:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001077f8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001077fd:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107804:	80 ff ff 
ffff800000107807:	41 ff d2             	callq  *%r10
ffff80000010780a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107811:	80 ff ff 
ffff800000107814:	48 8b 88 b0 02 00 00 	mov    0x2b0(%rax),%rcx
ffff80000010781b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107822:	80 ff ff 
ffff800000107825:	48 8b 90 a8 02 00 00 	mov    0x2a8(%rax),%rdx
ffff80000010782c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107833:	80 ff ff 
ffff800000107836:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010783d:	49 89 c9             	mov    %rcx,%r9
ffff800000107840:	49 89 d0             	mov    %rdx,%r8
ffff800000107843:	48 89 c1             	mov    %rax,%rcx
ffff800000107846:	48 ba 00 27 11 00 00 	movabs $0xffff800000112700,%rdx
ffff80000010784d:	80 ff ff 
ffff800000107850:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107855:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010785a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010785f:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107866:	80 ff ff 
ffff800000107869:	41 ff d2             	callq  *%r10
ffff80000010786c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107873:	80 ff ff 
ffff800000107876:	48 8b 88 c8 02 00 00 	mov    0x2c8(%rax),%rcx
ffff80000010787d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107884:	80 ff ff 
ffff800000107887:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff80000010788e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107895:	80 ff ff 
ffff800000107898:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff80000010789f:	49 89 c9             	mov    %rcx,%r9
ffff8000001078a2:	49 89 d0             	mov    %rdx,%r8
ffff8000001078a5:	48 89 c1             	mov    %rax,%rcx
ffff8000001078a8:	48 ba 40 27 11 00 00 	movabs $0xffff800000112740,%rdx
ffff8000001078af:	80 ff ff 
ffff8000001078b2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078b7:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001078bc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078c1:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001078c8:	80 ff ff 
ffff8000001078cb:	41 ff d2             	callq  *%r10
ffff8000001078ce:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff8000001078d5:	80 ff ff 
ffff8000001078d8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff8000001078de:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff8000001078e5:	80 ff ff 
ffff8000001078e8:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff8000001078ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001078f5:	e9 b2 00 00 00       	jmpq   ffff8000001079ac <init_memory+0xb2c>
ffff8000001078fa:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107901:	80 ff ff 
ffff800000107904:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010790b:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010790e:	48 63 d0             	movslq %eax,%rdx
ffff800000107911:	48 89 d0             	mov    %rdx,%rax
ffff800000107914:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107918:	48 01 d0             	add    %rdx,%rax
ffff80000010791b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010791f:	48 01 c8             	add    %rcx,%rax
ffff800000107922:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107926:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010792a:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff80000010792e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107932:	48 8b 10             	mov    (%rax),%rdx
ffff800000107935:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107939:	48 8b 78 20          	mov    0x20(%rax),%rdi
ffff80000010793d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107941:	48 8b 70 18          	mov    0x18(%rax),%rsi
ffff800000107945:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107949:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010794d:	51                   	push   %rcx
ffff80000010794e:	52                   	push   %rdx
ffff80000010794f:	49 89 f9             	mov    %rdi,%r9
ffff800000107952:	49 89 f0             	mov    %rsi,%r8
ffff800000107955:	48 89 c1             	mov    %rax,%rcx
ffff800000107958:	48 ba 80 27 11 00 00 	movabs $0xffff800000112780,%rdx
ffff80000010795f:	80 ff ff 
ffff800000107962:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107967:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010796c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107971:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107978:	80 ff ff 
ffff80000010797b:	41 ff d2             	callq  *%r10
ffff80000010797e:	48 83 c4 10          	add    $0x10,%rsp
ffff800000107982:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107986:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff80000010798a:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
ffff800000107991:	00 00 00 
ffff800000107994:	48 39 d0             	cmp    %rdx,%rax
ffff800000107997:	75 0f                	jne    ffff8000001079a8 <init_memory+0xb28>
ffff800000107999:	48 ba 38 90 12 00 00 	movabs $0xffff800000129038,%rdx
ffff8000001079a0:	80 ff ff 
ffff8000001079a3:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001079a6:	89 02                	mov    %eax,(%rdx)
ffff8000001079a8:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001079ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001079af:	48 63 d0             	movslq %eax,%rdx
ffff8000001079b2:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079b9:	80 ff ff 
ffff8000001079bc:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff8000001079c3:	48 39 c2             	cmp    %rax,%rdx
ffff8000001079c6:	0f 82 2e ff ff ff    	jb     ffff8000001078fa <init_memory+0xa7a>
ffff8000001079cc:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079d3:	80 ff ff 
ffff8000001079d6:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001079dd:	48 89 c2             	mov    %rax,%rdx
ffff8000001079e0:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079e7:	80 ff ff 
ffff8000001079ea:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001079f1:	48 01 d0             	add    %rdx,%rax
ffff8000001079f4:	48 05 00 01 00 00    	add    $0x100,%rax
ffff8000001079fa:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001079fe:	48 89 c2             	mov    %rax,%rdx
ffff800000107a01:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a08:	80 ff ff 
ffff800000107a0b:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000107a12:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a19:	80 ff ff 
ffff800000107a1c:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
ffff800000107a23:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a2a:	80 ff ff 
ffff800000107a2d:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff800000107a34:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a3b:	80 ff ff 
ffff800000107a3e:	48 8b b8 e0 02 00 00 	mov    0x2e0(%rax),%rdi
ffff800000107a45:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a4c:	80 ff ff 
ffff800000107a4f:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
ffff800000107a56:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a5d:	80 ff ff 
ffff800000107a60:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000107a67:	51                   	push   %rcx
ffff800000107a68:	52                   	push   %rdx
ffff800000107a69:	49 89 f9             	mov    %rdi,%r9
ffff800000107a6c:	49 89 f0             	mov    %rsi,%r8
ffff800000107a6f:	48 89 c1             	mov    %rax,%rcx
ffff800000107a72:	48 ba f8 27 11 00 00 	movabs $0xffff8000001127f8,%rdx
ffff800000107a79:	80 ff ff 
ffff800000107a7c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107a81:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107a86:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107a8b:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107a92:	80 ff ff 
ffff800000107a95:	41 ff d2             	callq  *%r10
ffff800000107a98:	48 83 c4 10          	add    $0x10,%rsp
ffff800000107a9c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107aa3:	80 ff ff 
ffff800000107aa6:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000107aad:	48 ba 00 00 00 00 00 	movabs $0x800000000000,%rdx
ffff800000107ab4:	80 00 00 
ffff800000107ab7:	48 01 d0             	add    %rdx,%rax
ffff800000107aba:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107abe:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107ac1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107ac8:	eb 40                	jmp    ffff800000107b0a <init_memory+0xc8a>
ffff800000107aca:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107ad1:	80 ff ff 
ffff800000107ad4:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107adb:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107ade:	48 63 d0             	movslq %eax,%rdx
ffff800000107ae1:	48 89 d0             	mov    %rdx,%rax
ffff800000107ae4:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107ae8:	48 01 d0             	add    %rdx,%rax
ffff800000107aeb:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107aef:	48 01 c8             	add    %rcx,%rax
ffff800000107af2:	be 93 00 00 00       	mov    $0x93,%esi
ffff800000107af7:	48 89 c7             	mov    %rax,%rdi
ffff800000107afa:	48 b8 12 6b 10 00 00 	movabs $0xffff800000106b12,%rax
ffff800000107b01:	80 ff ff 
ffff800000107b04:	ff d0                	callq  *%rax
ffff800000107b06:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000107b0a:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107b0d:	3b 45 fc             	cmp    -0x4(%rbp),%eax
ffff800000107b10:	7e b8                	jle    ffff800000107aca <init_memory+0xc4a>
ffff800000107b12:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b17:	48 ba 01 6b 10 00 00 	movabs $0xffff800000106b01,%rdx
ffff800000107b1e:	80 ff ff 
ffff800000107b21:	ff d2                	callq  *%rdx
ffff800000107b23:	48 ba 28 90 12 00 00 	movabs $0xffff800000129028,%rdx
ffff800000107b2a:	80 ff ff 
ffff800000107b2d:	48 89 02             	mov    %rax,(%rdx)
ffff800000107b30:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107b37:	80 ff ff 
ffff800000107b3a:	48 8b 00             	mov    (%rax),%rax
ffff800000107b3d:	48 89 c1             	mov    %rax,%rcx
ffff800000107b40:	48 ba 54 28 11 00 00 	movabs $0xffff800000112854,%rdx
ffff800000107b47:	80 ff ff 
ffff800000107b4a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107b4f:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107b54:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b59:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107b60:	80 ff ff 
ffff800000107b63:	41 ff d0             	callq  *%r8
ffff800000107b66:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107b6d:	80 ff ff 
ffff800000107b70:	48 8b 00             	mov    (%rax),%rax
ffff800000107b73:	48 89 c2             	mov    %rax,%rdx
ffff800000107b76:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107b7d:	80 ff ff 
ffff800000107b80:	48 01 d0             	add    %rdx,%rax
ffff800000107b83:	48 8b 00             	mov    (%rax),%rax
ffff800000107b86:	b0 00                	mov    $0x0,%al
ffff800000107b88:	48 89 c1             	mov    %rax,%rcx
ffff800000107b8b:	48 ba 69 28 11 00 00 	movabs $0xffff800000112869,%rdx
ffff800000107b92:	80 ff ff 
ffff800000107b95:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107b9a:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107b9f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107ba4:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107bab:	80 ff ff 
ffff800000107bae:	41 ff d0             	callq  *%r8
ffff800000107bb1:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107bb8:	80 ff ff 
ffff800000107bbb:	48 8b 00             	mov    (%rax),%rax
ffff800000107bbe:	48 89 c2             	mov    %rax,%rdx
ffff800000107bc1:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107bc8:	80 ff ff 
ffff800000107bcb:	48 01 d0             	add    %rdx,%rax
ffff800000107bce:	48 8b 00             	mov    (%rax),%rax
ffff800000107bd1:	b0 00                	mov    $0x0,%al
ffff800000107bd3:	48 89 c2             	mov    %rax,%rdx
ffff800000107bd6:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107bdd:	80 ff ff 
ffff800000107be0:	48 01 d0             	add    %rdx,%rax
ffff800000107be3:	48 8b 00             	mov    (%rax),%rax
ffff800000107be6:	b0 00                	mov    $0x0,%al
ffff800000107be8:	48 89 c1             	mov    %rax,%rcx
ffff800000107beb:	48 ba 7f 28 11 00 00 	movabs $0xffff80000011287f,%rdx
ffff800000107bf2:	80 ff ff 
ffff800000107bf5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107bfa:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff800000107bff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c04:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107c0b:	80 ff ff 
ffff800000107c0e:	41 ff d0             	callq  *%r8
ffff800000107c11:	0f 20 d8             	mov    %cr3,%rax
ffff800000107c14:	0f 22 d8             	mov    %rax,%cr3
ffff800000107c17:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107c1b:	90                   	nop
ffff800000107c1c:	c9                   	leaveq 
ffff800000107c1d:	c3                   	retq   

ffff800000107c1e <alloc_pages>:
ffff800000107c1e:	55                   	push   %rbp
ffff800000107c1f:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c22:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107c26:	89 7d 8c             	mov    %edi,-0x74(%rbp)
ffff800000107c29:	89 75 88             	mov    %esi,-0x78(%rbp)
ffff800000107c2c:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
ffff800000107c30:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000107c37:	00 
ffff800000107c38:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107c3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff800000107c46:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107c4a:	74 4c                	je     ffff800000107c98 <alloc_pages+0x7a>
ffff800000107c4c:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107c50:	7f 6e                	jg     ffff800000107cc0 <alloc_pages+0xa2>
ffff800000107c52:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
ffff800000107c56:	74 08                	je     ffff800000107c60 <alloc_pages+0x42>
ffff800000107c58:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
ffff800000107c5c:	74 1a                	je     ffff800000107c78 <alloc_pages+0x5a>
ffff800000107c5e:	eb 60                	jmp    ffff800000107cc0 <alloc_pages+0xa2>
ffff800000107c60:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107c67:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107c6e:	80 ff ff 
ffff800000107c71:	8b 00                	mov    (%rax),%eax
ffff800000107c73:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107c76:	eb 77                	jmp    ffff800000107cef <alloc_pages+0xd1>
ffff800000107c78:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107c7f:	80 ff ff 
ffff800000107c82:	8b 00                	mov    (%rax),%eax
ffff800000107c84:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107c87:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff800000107c8e:	80 ff ff 
ffff800000107c91:	8b 00                	mov    (%rax),%eax
ffff800000107c93:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107c96:	eb 57                	jmp    ffff800000107cef <alloc_pages+0xd1>
ffff800000107c98:	48 b8 38 90 12 00 00 	movabs $0xffff800000129038,%rax
ffff800000107c9f:	80 ff ff 
ffff800000107ca2:	8b 00                	mov    (%rax),%eax
ffff800000107ca4:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107ca7:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107cae:	80 ff ff 
ffff800000107cb1:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107cb8:	83 e8 01             	sub    $0x1,%eax
ffff800000107cbb:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107cbe:	eb 2f                	jmp    ffff800000107cef <alloc_pages+0xd1>
ffff800000107cc0:	48 ba 98 28 11 00 00 	movabs $0xffff800000112898,%rdx
ffff800000107cc7:	80 ff ff 
ffff800000107cca:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107ccf:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107cd4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107cd9:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000107ce0:	80 ff ff 
ffff800000107ce3:	ff d1                	callq  *%rcx
ffff800000107ce5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107cea:	e9 5f 02 00 00       	jmpq   ffff800000107f4e <alloc_pages+0x330>
ffff800000107cef:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107cf2:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107cf5:	e9 1b 02 00 00       	jmpq   ffff800000107f15 <alloc_pages+0x2f7>
ffff800000107cfa:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d01:	80 ff ff 
ffff800000107d04:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107d0b:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107d0e:	48 63 d0             	movslq %eax,%rdx
ffff800000107d11:	48 89 d0             	mov    %rdx,%rax
ffff800000107d14:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107d18:	48 01 d0             	add    %rdx,%rax
ffff800000107d1b:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107d1f:	48 01 c8             	add    %rcx,%rax
ffff800000107d22:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107d26:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107d29:	48 98                	cltq   
ffff800000107d2b:	48 39 c2             	cmp    %rax,%rdx
ffff800000107d2e:	0f 82 dc 01 00 00    	jb     ffff800000107f10 <alloc_pages+0x2f2>
ffff800000107d34:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d3b:	80 ff ff 
ffff800000107d3e:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107d45:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107d48:	48 63 d0             	movslq %eax,%rdx
ffff800000107d4b:	48 89 d0             	mov    %rdx,%rax
ffff800000107d4e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107d52:	48 01 d0             	add    %rdx,%rax
ffff800000107d55:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107d59:	48 01 c8             	add    %rcx,%rax
ffff800000107d5c:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107d60:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d64:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107d68:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d6c:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107d70:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d74:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000107d78:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d7c:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107d80:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d84:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107d88:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d8c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107d90:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107d94:	83 e0 3f             	and    $0x3f,%eax
ffff800000107d97:	48 89 c2             	mov    %rax,%rdx
ffff800000107d9a:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107d9f:	48 29 d0             	sub    %rdx,%rax
ffff800000107da2:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107da6:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107daa:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107dae:	e9 4d 01 00 00       	jmpq   ffff800000107f00 <alloc_pages+0x2e2>
ffff800000107db3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107dba:	80 ff ff 
ffff800000107dbd:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107dc4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107dc8:	48 c1 e8 06          	shr    $0x6,%rax
ffff800000107dcc:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107dd0:	48 01 d0             	add    %rdx,%rax
ffff800000107dd3:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107dd7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107ddb:	83 e0 3f             	and    $0x3f,%eax
ffff800000107dde:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107de2:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107de6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000107dea:	e9 e3 00 00 00       	jmpq   ffff800000107ed2 <alloc_pages+0x2b4>
ffff800000107def:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107df3:	48 8b 00             	mov    (%rax),%rax
ffff800000107df6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000107dfa:	89 d1                	mov    %edx,%ecx
ffff800000107dfc:	48 d3 e8             	shr    %cl,%rax
ffff800000107dff:	48 89 c6             	mov    %rax,%rsi
ffff800000107e02:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107e06:	48 83 c0 08          	add    $0x8,%rax
ffff800000107e0a:	48 8b 10             	mov    (%rax),%rdx
ffff800000107e0d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107e11:	89 c1                	mov    %eax,%ecx
ffff800000107e13:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107e18:	29 c8                	sub    %ecx,%eax
ffff800000107e1a:	89 c1                	mov    %eax,%ecx
ffff800000107e1c:	48 d3 e2             	shl    %cl,%rdx
ffff800000107e1f:	48 89 d0             	mov    %rdx,%rax
ffff800000107e22:	48 09 c6             	or     %rax,%rsi
ffff800000107e25:	48 89 f2             	mov    %rsi,%rdx
ffff800000107e28:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
ffff800000107e2c:	74 16                	je     ffff800000107e44 <alloc_pages+0x226>
ffff800000107e2e:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107e31:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107e36:	89 c1                	mov    %eax,%ecx
ffff800000107e38:	48 d3 e6             	shl    %cl,%rsi
ffff800000107e3b:	48 89 f0             	mov    %rsi,%rax
ffff800000107e3e:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107e42:	eb 07                	jmp    ffff800000107e4b <alloc_pages+0x22d>
ffff800000107e44:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107e4b:	48 21 d0             	and    %rdx,%rax
ffff800000107e4e:	48 85 c0             	test   %rax,%rax
ffff800000107e51:	75 7a                	jne    ffff800000107ecd <alloc_pages+0x2af>
ffff800000107e53:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000107e57:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107e5b:	48 01 d0             	add    %rdx,%rax
ffff800000107e5e:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107e62:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107e66:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000107e6d:	00 
ffff800000107e6e:	eb 50                	jmp    ffff800000107ec0 <alloc_pages+0x2a2>
ffff800000107e70:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107e77:	80 ff ff 
ffff800000107e7a:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107e81:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107e85:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107e89:	48 01 c2             	add    %rax,%rdx
ffff800000107e8c:	48 89 d0             	mov    %rdx,%rax
ffff800000107e8f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107e93:	48 01 d0             	add    %rdx,%rax
ffff800000107e96:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107e9a:	48 01 c8             	add    %rcx,%rax
ffff800000107e9d:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107ea1:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
ffff800000107ea5:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107ea9:	48 89 d6             	mov    %rdx,%rsi
ffff800000107eac:	48 89 c7             	mov    %rax,%rdi
ffff800000107eaf:	48 b8 12 6b 10 00 00 	movabs $0xffff800000106b12,%rax
ffff800000107eb6:	80 ff ff 
ffff800000107eb9:	ff d0                	callq  *%rax
ffff800000107ebb:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
ffff800000107ec0:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107ec3:	48 98                	cltq   
ffff800000107ec5:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000107ec9:	72 a5                	jb     ffff800000107e70 <alloc_pages+0x252>
ffff800000107ecb:	eb 5b                	jmp    ffff800000107f28 <alloc_pages+0x30a>
ffff800000107ecd:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000107ed2:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107ed7:	48 2b 45 98          	sub    -0x68(%rbp),%rax
ffff800000107edb:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
ffff800000107edf:	0f 82 0a ff ff ff    	jb     ffff800000107def <alloc_pages+0x1d1>
ffff800000107ee5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107ee9:	83 e0 3f             	and    $0x3f,%eax
ffff800000107eec:	48 85 c0             	test   %rax,%rax
ffff800000107eef:	74 06                	je     ffff800000107ef7 <alloc_pages+0x2d9>
ffff800000107ef1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107ef5:	eb 05                	jmp    ffff800000107efc <alloc_pages+0x2de>
ffff800000107ef7:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107efc:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000107f00:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f04:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
ffff800000107f08:	0f 86 a5 fe ff ff    	jbe    ffff800000107db3 <alloc_pages+0x195>
ffff800000107f0e:	eb 01                	jmp    ffff800000107f11 <alloc_pages+0x2f3>
ffff800000107f10:	90                   	nop
ffff800000107f11:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107f15:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107f18:	3b 45 f4             	cmp    -0xc(%rbp),%eax
ffff800000107f1b:	0f 8e d9 fd ff ff    	jle    ffff800000107cfa <alloc_pages+0xdc>
ffff800000107f21:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107f26:	eb 26                	jmp    ffff800000107f4e <alloc_pages+0x330>
ffff800000107f28:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107f2f:	80 ff ff 
ffff800000107f32:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107f39:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107f3d:	48 89 d0             	mov    %rdx,%rax
ffff800000107f40:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107f44:	48 01 d0             	add    %rdx,%rax
ffff800000107f47:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f4b:	48 01 c8             	add    %rcx,%rax
ffff800000107f4e:	c9                   	leaveq 
ffff800000107f4f:	c3                   	retq   

ffff800000107f50 <io_in8>:
ffff800000107f50:	55                   	push   %rbp
ffff800000107f51:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f54:	89 f8                	mov    %edi,%eax
ffff800000107f56:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107f5a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107f5e:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107f62:	89 c2                	mov    %eax,%edx
ffff800000107f64:	ec                   	in     (%dx),%al
ffff800000107f65:	0f ae f0             	mfence 
ffff800000107f68:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107f6b:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107f6f:	5d                   	pop    %rbp
ffff800000107f70:	c3                   	retq   

ffff800000107f71 <io_out8>:
ffff800000107f71:	55                   	push   %rbp
ffff800000107f72:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f75:	89 f8                	mov    %edi,%eax
ffff800000107f77:	89 f2                	mov    %esi,%edx
ffff800000107f79:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
ffff800000107f7d:	89 d0                	mov    %edx,%eax
ffff800000107f7f:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107f82:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107f86:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107f8a:	ee                   	out    %al,(%dx)
ffff800000107f8b:	0f ae f0             	mfence 
ffff800000107f8e:	90                   	nop
ffff800000107f8f:	5d                   	pop    %rbp
ffff800000107f90:	c3                   	retq   

ffff800000107f91 <set_intr_gate>:
ffff800000107f91:	55                   	push   %rbp
ffff800000107f92:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f95:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000107f98:	89 f0                	mov    %esi,%eax
ffff800000107f9a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff800000107f9e:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff800000107fa1:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107fa4:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107fa8:	48 89 c2             	mov    %rax,%rdx
ffff800000107fab:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff800000107fb2:	80 ff ff 
ffff800000107fb5:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000107fb9:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107fbc:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107fc0:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000107fc4:	48 b8 02 9a 10 00 00 	movabs $0xffff800000109a02,%rax
ffff800000107fcb:	80 ff ff 
ffff800000107fce:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff800000107fd2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107fd6:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff800000107fdc:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff800000107fe0:	48 89 c2             	mov    %rax,%rdx
ffff800000107fe3:	44 89 c0             	mov    %r8d,%eax
ffff800000107fe6:	66 89 d0             	mov    %dx,%ax
ffff800000107fe9:	48 83 e1 07          	and    $0x7,%rcx
ffff800000107fed:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff800000107ff4:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000107ff8:	48 01 c8             	add    %rcx,%rax
ffff800000107ffb:	48 31 c9             	xor    %rcx,%rcx
ffff800000107ffe:	89 d1                	mov    %edx,%ecx
ffff800000108000:	48 c1 e9 10          	shr    $0x10,%rcx
ffff800000108004:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000108008:	48 01 c8             	add    %rcx,%rax
ffff80000010800b:	48 89 06             	mov    %rax,(%rsi)
ffff80000010800e:	48 c1 ea 20          	shr    $0x20,%rdx
ffff800000108012:	48 89 17             	mov    %rdx,(%rdi)
ffff800000108015:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108019:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010801d:	90                   	nop
ffff80000010801e:	5d                   	pop    %rbp
ffff80000010801f:	c3                   	retq   
ffff800000108020:	55                   	push   %rbp
ffff800000108021:	48 89 e5             	mov    %rsp,%rbp
ffff800000108024:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108028:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010802c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108030:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000108034:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108038:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff80000010803c:	48 ba 10 aa 10 00 00 	movabs $0xffff80000010aa10,%rdx
ffff800000108043:	80 ff ff 
ffff800000108046:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010804a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010804d:	48 ba 18 aa 10 00 00 	movabs $0xffff80000010aa18,%rdx
ffff800000108054:	80 ff ff 
ffff800000108057:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010805b:	48 89 02             	mov    %rax,(%rdx)
ffff80000010805e:	48 ba 20 aa 10 00 00 	movabs $0xffff80000010aa20,%rdx
ffff800000108065:	80 ff ff 
ffff800000108068:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010806c:	48 89 02             	mov    %rax,(%rdx)
ffff80000010806f:	48 ba 30 aa 10 00 00 	movabs $0xffff80000010aa30,%rdx
ffff800000108076:	80 ff ff 
ffff800000108079:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010807d:	48 89 02             	mov    %rax,(%rdx)
ffff800000108080:	48 ba 38 aa 10 00 00 	movabs $0xffff80000010aa38,%rdx
ffff800000108087:	80 ff ff 
ffff80000010808a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010808e:	48 89 02             	mov    %rax,(%rdx)
ffff800000108091:	48 ba 40 aa 10 00 00 	movabs $0xffff80000010aa40,%rdx
ffff800000108098:	80 ff ff 
ffff80000010809b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010809f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080a2:	48 ba 48 aa 10 00 00 	movabs $0xffff80000010aa48,%rdx
ffff8000001080a9:	80 ff ff 
ffff8000001080ac:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff8000001080b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080b3:	48 ba 50 aa 10 00 00 	movabs $0xffff80000010aa50,%rdx
ffff8000001080ba:	80 ff ff 
ffff8000001080bd:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff8000001080c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080c4:	48 ba 58 aa 10 00 00 	movabs $0xffff80000010aa58,%rdx
ffff8000001080cb:	80 ff ff 
ffff8000001080ce:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff8000001080d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080d5:	48 ba 60 aa 10 00 00 	movabs $0xffff80000010aa60,%rdx
ffff8000001080dc:	80 ff ff 
ffff8000001080df:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff8000001080e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080e6:	90                   	nop
ffff8000001080e7:	5d                   	pop    %rbp
ffff8000001080e8:	c3                   	retq   

ffff8000001080e9 <IRQ0x20_interrupt>:
ffff8000001080e9:	6a 00                	pushq  $0x0
ffff8000001080eb:	fc                   	cld    
ffff8000001080ec:	50                   	push   %rax
ffff8000001080ed:	50                   	push   %rax
ffff8000001080ee:	48 8c c0             	mov    %es,%rax
ffff8000001080f1:	50                   	push   %rax
ffff8000001080f2:	48 8c d8             	mov    %ds,%rax
ffff8000001080f5:	50                   	push   %rax
ffff8000001080f6:	48 31 c0             	xor    %rax,%rax
ffff8000001080f9:	55                   	push   %rbp
ffff8000001080fa:	57                   	push   %rdi
ffff8000001080fb:	56                   	push   %rsi
ffff8000001080fc:	52                   	push   %rdx
ffff8000001080fd:	51                   	push   %rcx
ffff8000001080fe:	53                   	push   %rbx
ffff8000001080ff:	41 50                	push   %r8
ffff800000108101:	41 51                	push   %r9
ffff800000108103:	41 52                	push   %r10
ffff800000108105:	41 53                	push   %r11
ffff800000108107:	41 54                	push   %r12
ffff800000108109:	41 55                	push   %r13
ffff80000010810b:	41 56                	push   %r14
ffff80000010810d:	41 57                	push   %r15
ffff80000010810f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108116:	48 8e da             	mov    %rdx,%ds
ffff800000108119:	48 8e c2             	mov    %rdx,%es
ffff80000010811c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010811f:	48 8d 05 ff be ff ff 	lea    -0x4101(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108126:	50                   	push   %rax
ffff800000108127:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff80000010812e:	e9 f2 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108133 <IRQ0x21_interrupt>:
ffff800000108133:	6a 00                	pushq  $0x0
ffff800000108135:	fc                   	cld    
ffff800000108136:	50                   	push   %rax
ffff800000108137:	50                   	push   %rax
ffff800000108138:	48 8c c0             	mov    %es,%rax
ffff80000010813b:	50                   	push   %rax
ffff80000010813c:	48 8c d8             	mov    %ds,%rax
ffff80000010813f:	50                   	push   %rax
ffff800000108140:	48 31 c0             	xor    %rax,%rax
ffff800000108143:	55                   	push   %rbp
ffff800000108144:	57                   	push   %rdi
ffff800000108145:	56                   	push   %rsi
ffff800000108146:	52                   	push   %rdx
ffff800000108147:	51                   	push   %rcx
ffff800000108148:	53                   	push   %rbx
ffff800000108149:	41 50                	push   %r8
ffff80000010814b:	41 51                	push   %r9
ffff80000010814d:	41 52                	push   %r10
ffff80000010814f:	41 53                	push   %r11
ffff800000108151:	41 54                	push   %r12
ffff800000108153:	41 55                	push   %r13
ffff800000108155:	41 56                	push   %r14
ffff800000108157:	41 57                	push   %r15
ffff800000108159:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108160:	48 8e da             	mov    %rdx,%ds
ffff800000108163:	48 8e c2             	mov    %rdx,%es
ffff800000108166:	48 89 e7             	mov    %rsp,%rdi
ffff800000108169:	48 8d 05 b5 be ff ff 	lea    -0x414b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108170:	50                   	push   %rax
ffff800000108171:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000108178:	e9 a8 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010817d <IRQ0x22_interrupt>:
ffff80000010817d:	6a 00                	pushq  $0x0
ffff80000010817f:	fc                   	cld    
ffff800000108180:	50                   	push   %rax
ffff800000108181:	50                   	push   %rax
ffff800000108182:	48 8c c0             	mov    %es,%rax
ffff800000108185:	50                   	push   %rax
ffff800000108186:	48 8c d8             	mov    %ds,%rax
ffff800000108189:	50                   	push   %rax
ffff80000010818a:	48 31 c0             	xor    %rax,%rax
ffff80000010818d:	55                   	push   %rbp
ffff80000010818e:	57                   	push   %rdi
ffff80000010818f:	56                   	push   %rsi
ffff800000108190:	52                   	push   %rdx
ffff800000108191:	51                   	push   %rcx
ffff800000108192:	53                   	push   %rbx
ffff800000108193:	41 50                	push   %r8
ffff800000108195:	41 51                	push   %r9
ffff800000108197:	41 52                	push   %r10
ffff800000108199:	41 53                	push   %r11
ffff80000010819b:	41 54                	push   %r12
ffff80000010819d:	41 55                	push   %r13
ffff80000010819f:	41 56                	push   %r14
ffff8000001081a1:	41 57                	push   %r15
ffff8000001081a3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081aa:	48 8e da             	mov    %rdx,%ds
ffff8000001081ad:	48 8e c2             	mov    %rdx,%es
ffff8000001081b0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081b3:	48 8d 05 6b be ff ff 	lea    -0x4195(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081ba:	50                   	push   %rax
ffff8000001081bb:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff8000001081c2:	e9 5e 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001081c7 <IRQ0x23_interrupt>:
ffff8000001081c7:	6a 00                	pushq  $0x0
ffff8000001081c9:	fc                   	cld    
ffff8000001081ca:	50                   	push   %rax
ffff8000001081cb:	50                   	push   %rax
ffff8000001081cc:	48 8c c0             	mov    %es,%rax
ffff8000001081cf:	50                   	push   %rax
ffff8000001081d0:	48 8c d8             	mov    %ds,%rax
ffff8000001081d3:	50                   	push   %rax
ffff8000001081d4:	48 31 c0             	xor    %rax,%rax
ffff8000001081d7:	55                   	push   %rbp
ffff8000001081d8:	57                   	push   %rdi
ffff8000001081d9:	56                   	push   %rsi
ffff8000001081da:	52                   	push   %rdx
ffff8000001081db:	51                   	push   %rcx
ffff8000001081dc:	53                   	push   %rbx
ffff8000001081dd:	41 50                	push   %r8
ffff8000001081df:	41 51                	push   %r9
ffff8000001081e1:	41 52                	push   %r10
ffff8000001081e3:	41 53                	push   %r11
ffff8000001081e5:	41 54                	push   %r12
ffff8000001081e7:	41 55                	push   %r13
ffff8000001081e9:	41 56                	push   %r14
ffff8000001081eb:	41 57                	push   %r15
ffff8000001081ed:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081f4:	48 8e da             	mov    %rdx,%ds
ffff8000001081f7:	48 8e c2             	mov    %rdx,%es
ffff8000001081fa:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081fd:	48 8d 05 21 be ff ff 	lea    -0x41df(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108204:	50                   	push   %rax
ffff800000108205:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff80000010820c:	e9 14 07 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108211 <IRQ0x24_interrupt>:
ffff800000108211:	6a 00                	pushq  $0x0
ffff800000108213:	fc                   	cld    
ffff800000108214:	50                   	push   %rax
ffff800000108215:	50                   	push   %rax
ffff800000108216:	48 8c c0             	mov    %es,%rax
ffff800000108219:	50                   	push   %rax
ffff80000010821a:	48 8c d8             	mov    %ds,%rax
ffff80000010821d:	50                   	push   %rax
ffff80000010821e:	48 31 c0             	xor    %rax,%rax
ffff800000108221:	55                   	push   %rbp
ffff800000108222:	57                   	push   %rdi
ffff800000108223:	56                   	push   %rsi
ffff800000108224:	52                   	push   %rdx
ffff800000108225:	51                   	push   %rcx
ffff800000108226:	53                   	push   %rbx
ffff800000108227:	41 50                	push   %r8
ffff800000108229:	41 51                	push   %r9
ffff80000010822b:	41 52                	push   %r10
ffff80000010822d:	41 53                	push   %r11
ffff80000010822f:	41 54                	push   %r12
ffff800000108231:	41 55                	push   %r13
ffff800000108233:	41 56                	push   %r14
ffff800000108235:	41 57                	push   %r15
ffff800000108237:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010823e:	48 8e da             	mov    %rdx,%ds
ffff800000108241:	48 8e c2             	mov    %rdx,%es
ffff800000108244:	48 89 e7             	mov    %rsp,%rdi
ffff800000108247:	48 8d 05 d7 bd ff ff 	lea    -0x4229(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010824e:	50                   	push   %rax
ffff80000010824f:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff800000108256:	e9 ca 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010825b <IRQ0x25_interrupt>:
ffff80000010825b:	6a 00                	pushq  $0x0
ffff80000010825d:	fc                   	cld    
ffff80000010825e:	50                   	push   %rax
ffff80000010825f:	50                   	push   %rax
ffff800000108260:	48 8c c0             	mov    %es,%rax
ffff800000108263:	50                   	push   %rax
ffff800000108264:	48 8c d8             	mov    %ds,%rax
ffff800000108267:	50                   	push   %rax
ffff800000108268:	48 31 c0             	xor    %rax,%rax
ffff80000010826b:	55                   	push   %rbp
ffff80000010826c:	57                   	push   %rdi
ffff80000010826d:	56                   	push   %rsi
ffff80000010826e:	52                   	push   %rdx
ffff80000010826f:	51                   	push   %rcx
ffff800000108270:	53                   	push   %rbx
ffff800000108271:	41 50                	push   %r8
ffff800000108273:	41 51                	push   %r9
ffff800000108275:	41 52                	push   %r10
ffff800000108277:	41 53                	push   %r11
ffff800000108279:	41 54                	push   %r12
ffff80000010827b:	41 55                	push   %r13
ffff80000010827d:	41 56                	push   %r14
ffff80000010827f:	41 57                	push   %r15
ffff800000108281:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108288:	48 8e da             	mov    %rdx,%ds
ffff80000010828b:	48 8e c2             	mov    %rdx,%es
ffff80000010828e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108291:	48 8d 05 8d bd ff ff 	lea    -0x4273(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108298:	50                   	push   %rax
ffff800000108299:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff8000001082a0:	e9 80 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001082a5 <IRQ0x26_interrupt>:
ffff8000001082a5:	6a 00                	pushq  $0x0
ffff8000001082a7:	fc                   	cld    
ffff8000001082a8:	50                   	push   %rax
ffff8000001082a9:	50                   	push   %rax
ffff8000001082aa:	48 8c c0             	mov    %es,%rax
ffff8000001082ad:	50                   	push   %rax
ffff8000001082ae:	48 8c d8             	mov    %ds,%rax
ffff8000001082b1:	50                   	push   %rax
ffff8000001082b2:	48 31 c0             	xor    %rax,%rax
ffff8000001082b5:	55                   	push   %rbp
ffff8000001082b6:	57                   	push   %rdi
ffff8000001082b7:	56                   	push   %rsi
ffff8000001082b8:	52                   	push   %rdx
ffff8000001082b9:	51                   	push   %rcx
ffff8000001082ba:	53                   	push   %rbx
ffff8000001082bb:	41 50                	push   %r8
ffff8000001082bd:	41 51                	push   %r9
ffff8000001082bf:	41 52                	push   %r10
ffff8000001082c1:	41 53                	push   %r11
ffff8000001082c3:	41 54                	push   %r12
ffff8000001082c5:	41 55                	push   %r13
ffff8000001082c7:	41 56                	push   %r14
ffff8000001082c9:	41 57                	push   %r15
ffff8000001082cb:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082d2:	48 8e da             	mov    %rdx,%ds
ffff8000001082d5:	48 8e c2             	mov    %rdx,%es
ffff8000001082d8:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082db:	48 8d 05 43 bd ff ff 	lea    -0x42bd(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082e2:	50                   	push   %rax
ffff8000001082e3:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff8000001082ea:	e9 36 06 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001082ef <IRQ0x27_interrupt>:
ffff8000001082ef:	6a 00                	pushq  $0x0
ffff8000001082f1:	fc                   	cld    
ffff8000001082f2:	50                   	push   %rax
ffff8000001082f3:	50                   	push   %rax
ffff8000001082f4:	48 8c c0             	mov    %es,%rax
ffff8000001082f7:	50                   	push   %rax
ffff8000001082f8:	48 8c d8             	mov    %ds,%rax
ffff8000001082fb:	50                   	push   %rax
ffff8000001082fc:	48 31 c0             	xor    %rax,%rax
ffff8000001082ff:	55                   	push   %rbp
ffff800000108300:	57                   	push   %rdi
ffff800000108301:	56                   	push   %rsi
ffff800000108302:	52                   	push   %rdx
ffff800000108303:	51                   	push   %rcx
ffff800000108304:	53                   	push   %rbx
ffff800000108305:	41 50                	push   %r8
ffff800000108307:	41 51                	push   %r9
ffff800000108309:	41 52                	push   %r10
ffff80000010830b:	41 53                	push   %r11
ffff80000010830d:	41 54                	push   %r12
ffff80000010830f:	41 55                	push   %r13
ffff800000108311:	41 56                	push   %r14
ffff800000108313:	41 57                	push   %r15
ffff800000108315:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010831c:	48 8e da             	mov    %rdx,%ds
ffff80000010831f:	48 8e c2             	mov    %rdx,%es
ffff800000108322:	48 89 e7             	mov    %rsp,%rdi
ffff800000108325:	48 8d 05 f9 bc ff ff 	lea    -0x4307(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010832c:	50                   	push   %rax
ffff80000010832d:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff800000108334:	e9 ec 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108339 <IRQ0x28_interrupt>:
ffff800000108339:	6a 00                	pushq  $0x0
ffff80000010833b:	fc                   	cld    
ffff80000010833c:	50                   	push   %rax
ffff80000010833d:	50                   	push   %rax
ffff80000010833e:	48 8c c0             	mov    %es,%rax
ffff800000108341:	50                   	push   %rax
ffff800000108342:	48 8c d8             	mov    %ds,%rax
ffff800000108345:	50                   	push   %rax
ffff800000108346:	48 31 c0             	xor    %rax,%rax
ffff800000108349:	55                   	push   %rbp
ffff80000010834a:	57                   	push   %rdi
ffff80000010834b:	56                   	push   %rsi
ffff80000010834c:	52                   	push   %rdx
ffff80000010834d:	51                   	push   %rcx
ffff80000010834e:	53                   	push   %rbx
ffff80000010834f:	41 50                	push   %r8
ffff800000108351:	41 51                	push   %r9
ffff800000108353:	41 52                	push   %r10
ffff800000108355:	41 53                	push   %r11
ffff800000108357:	41 54                	push   %r12
ffff800000108359:	41 55                	push   %r13
ffff80000010835b:	41 56                	push   %r14
ffff80000010835d:	41 57                	push   %r15
ffff80000010835f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108366:	48 8e da             	mov    %rdx,%ds
ffff800000108369:	48 8e c2             	mov    %rdx,%es
ffff80000010836c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010836f:	48 8d 05 af bc ff ff 	lea    -0x4351(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108376:	50                   	push   %rax
ffff800000108377:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff80000010837e:	e9 a2 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108383 <IRQ0x29_interrupt>:
ffff800000108383:	6a 00                	pushq  $0x0
ffff800000108385:	fc                   	cld    
ffff800000108386:	50                   	push   %rax
ffff800000108387:	50                   	push   %rax
ffff800000108388:	48 8c c0             	mov    %es,%rax
ffff80000010838b:	50                   	push   %rax
ffff80000010838c:	48 8c d8             	mov    %ds,%rax
ffff80000010838f:	50                   	push   %rax
ffff800000108390:	48 31 c0             	xor    %rax,%rax
ffff800000108393:	55                   	push   %rbp
ffff800000108394:	57                   	push   %rdi
ffff800000108395:	56                   	push   %rsi
ffff800000108396:	52                   	push   %rdx
ffff800000108397:	51                   	push   %rcx
ffff800000108398:	53                   	push   %rbx
ffff800000108399:	41 50                	push   %r8
ffff80000010839b:	41 51                	push   %r9
ffff80000010839d:	41 52                	push   %r10
ffff80000010839f:	41 53                	push   %r11
ffff8000001083a1:	41 54                	push   %r12
ffff8000001083a3:	41 55                	push   %r13
ffff8000001083a5:	41 56                	push   %r14
ffff8000001083a7:	41 57                	push   %r15
ffff8000001083a9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083b0:	48 8e da             	mov    %rdx,%ds
ffff8000001083b3:	48 8e c2             	mov    %rdx,%es
ffff8000001083b6:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083b9:	48 8d 05 65 bc ff ff 	lea    -0x439b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083c0:	50                   	push   %rax
ffff8000001083c1:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff8000001083c8:	e9 58 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001083cd <IRQ0x2a_interrupt>:
ffff8000001083cd:	6a 00                	pushq  $0x0
ffff8000001083cf:	fc                   	cld    
ffff8000001083d0:	50                   	push   %rax
ffff8000001083d1:	50                   	push   %rax
ffff8000001083d2:	48 8c c0             	mov    %es,%rax
ffff8000001083d5:	50                   	push   %rax
ffff8000001083d6:	48 8c d8             	mov    %ds,%rax
ffff8000001083d9:	50                   	push   %rax
ffff8000001083da:	48 31 c0             	xor    %rax,%rax
ffff8000001083dd:	55                   	push   %rbp
ffff8000001083de:	57                   	push   %rdi
ffff8000001083df:	56                   	push   %rsi
ffff8000001083e0:	52                   	push   %rdx
ffff8000001083e1:	51                   	push   %rcx
ffff8000001083e2:	53                   	push   %rbx
ffff8000001083e3:	41 50                	push   %r8
ffff8000001083e5:	41 51                	push   %r9
ffff8000001083e7:	41 52                	push   %r10
ffff8000001083e9:	41 53                	push   %r11
ffff8000001083eb:	41 54                	push   %r12
ffff8000001083ed:	41 55                	push   %r13
ffff8000001083ef:	41 56                	push   %r14
ffff8000001083f1:	41 57                	push   %r15
ffff8000001083f3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083fa:	48 8e da             	mov    %rdx,%ds
ffff8000001083fd:	48 8e c2             	mov    %rdx,%es
ffff800000108400:	48 89 e7             	mov    %rsp,%rdi
ffff800000108403:	48 8d 05 1b bc ff ff 	lea    -0x43e5(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010840a:	50                   	push   %rax
ffff80000010840b:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff800000108412:	e9 0e 05 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108417 <IRQ0x2b_interrupt>:
ffff800000108417:	6a 00                	pushq  $0x0
ffff800000108419:	fc                   	cld    
ffff80000010841a:	50                   	push   %rax
ffff80000010841b:	50                   	push   %rax
ffff80000010841c:	48 8c c0             	mov    %es,%rax
ffff80000010841f:	50                   	push   %rax
ffff800000108420:	48 8c d8             	mov    %ds,%rax
ffff800000108423:	50                   	push   %rax
ffff800000108424:	48 31 c0             	xor    %rax,%rax
ffff800000108427:	55                   	push   %rbp
ffff800000108428:	57                   	push   %rdi
ffff800000108429:	56                   	push   %rsi
ffff80000010842a:	52                   	push   %rdx
ffff80000010842b:	51                   	push   %rcx
ffff80000010842c:	53                   	push   %rbx
ffff80000010842d:	41 50                	push   %r8
ffff80000010842f:	41 51                	push   %r9
ffff800000108431:	41 52                	push   %r10
ffff800000108433:	41 53                	push   %r11
ffff800000108435:	41 54                	push   %r12
ffff800000108437:	41 55                	push   %r13
ffff800000108439:	41 56                	push   %r14
ffff80000010843b:	41 57                	push   %r15
ffff80000010843d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108444:	48 8e da             	mov    %rdx,%ds
ffff800000108447:	48 8e c2             	mov    %rdx,%es
ffff80000010844a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010844d:	48 8d 05 d1 bb ff ff 	lea    -0x442f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108454:	50                   	push   %rax
ffff800000108455:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff80000010845c:	e9 c4 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108461 <IRQ0x2c_interrupt>:
ffff800000108461:	6a 00                	pushq  $0x0
ffff800000108463:	fc                   	cld    
ffff800000108464:	50                   	push   %rax
ffff800000108465:	50                   	push   %rax
ffff800000108466:	48 8c c0             	mov    %es,%rax
ffff800000108469:	50                   	push   %rax
ffff80000010846a:	48 8c d8             	mov    %ds,%rax
ffff80000010846d:	50                   	push   %rax
ffff80000010846e:	48 31 c0             	xor    %rax,%rax
ffff800000108471:	55                   	push   %rbp
ffff800000108472:	57                   	push   %rdi
ffff800000108473:	56                   	push   %rsi
ffff800000108474:	52                   	push   %rdx
ffff800000108475:	51                   	push   %rcx
ffff800000108476:	53                   	push   %rbx
ffff800000108477:	41 50                	push   %r8
ffff800000108479:	41 51                	push   %r9
ffff80000010847b:	41 52                	push   %r10
ffff80000010847d:	41 53                	push   %r11
ffff80000010847f:	41 54                	push   %r12
ffff800000108481:	41 55                	push   %r13
ffff800000108483:	41 56                	push   %r14
ffff800000108485:	41 57                	push   %r15
ffff800000108487:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010848e:	48 8e da             	mov    %rdx,%ds
ffff800000108491:	48 8e c2             	mov    %rdx,%es
ffff800000108494:	48 89 e7             	mov    %rsp,%rdi
ffff800000108497:	48 8d 05 87 bb ff ff 	lea    -0x4479(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010849e:	50                   	push   %rax
ffff80000010849f:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff8000001084a6:	e9 7a 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001084ab <IRQ0x2d_interrupt>:
ffff8000001084ab:	6a 00                	pushq  $0x0
ffff8000001084ad:	fc                   	cld    
ffff8000001084ae:	50                   	push   %rax
ffff8000001084af:	50                   	push   %rax
ffff8000001084b0:	48 8c c0             	mov    %es,%rax
ffff8000001084b3:	50                   	push   %rax
ffff8000001084b4:	48 8c d8             	mov    %ds,%rax
ffff8000001084b7:	50                   	push   %rax
ffff8000001084b8:	48 31 c0             	xor    %rax,%rax
ffff8000001084bb:	55                   	push   %rbp
ffff8000001084bc:	57                   	push   %rdi
ffff8000001084bd:	56                   	push   %rsi
ffff8000001084be:	52                   	push   %rdx
ffff8000001084bf:	51                   	push   %rcx
ffff8000001084c0:	53                   	push   %rbx
ffff8000001084c1:	41 50                	push   %r8
ffff8000001084c3:	41 51                	push   %r9
ffff8000001084c5:	41 52                	push   %r10
ffff8000001084c7:	41 53                	push   %r11
ffff8000001084c9:	41 54                	push   %r12
ffff8000001084cb:	41 55                	push   %r13
ffff8000001084cd:	41 56                	push   %r14
ffff8000001084cf:	41 57                	push   %r15
ffff8000001084d1:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084d8:	48 8e da             	mov    %rdx,%ds
ffff8000001084db:	48 8e c2             	mov    %rdx,%es
ffff8000001084de:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084e1:	48 8d 05 3d bb ff ff 	lea    -0x44c3(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084e8:	50                   	push   %rax
ffff8000001084e9:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff8000001084f0:	e9 30 04 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001084f5 <IRQ0x2e_interrupt>:
ffff8000001084f5:	6a 00                	pushq  $0x0
ffff8000001084f7:	fc                   	cld    
ffff8000001084f8:	50                   	push   %rax
ffff8000001084f9:	50                   	push   %rax
ffff8000001084fa:	48 8c c0             	mov    %es,%rax
ffff8000001084fd:	50                   	push   %rax
ffff8000001084fe:	48 8c d8             	mov    %ds,%rax
ffff800000108501:	50                   	push   %rax
ffff800000108502:	48 31 c0             	xor    %rax,%rax
ffff800000108505:	55                   	push   %rbp
ffff800000108506:	57                   	push   %rdi
ffff800000108507:	56                   	push   %rsi
ffff800000108508:	52                   	push   %rdx
ffff800000108509:	51                   	push   %rcx
ffff80000010850a:	53                   	push   %rbx
ffff80000010850b:	41 50                	push   %r8
ffff80000010850d:	41 51                	push   %r9
ffff80000010850f:	41 52                	push   %r10
ffff800000108511:	41 53                	push   %r11
ffff800000108513:	41 54                	push   %r12
ffff800000108515:	41 55                	push   %r13
ffff800000108517:	41 56                	push   %r14
ffff800000108519:	41 57                	push   %r15
ffff80000010851b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108522:	48 8e da             	mov    %rdx,%ds
ffff800000108525:	48 8e c2             	mov    %rdx,%es
ffff800000108528:	48 89 e7             	mov    %rsp,%rdi
ffff80000010852b:	48 8d 05 f3 ba ff ff 	lea    -0x450d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108532:	50                   	push   %rax
ffff800000108533:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff80000010853a:	e9 e6 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010853f <IRQ0x2f_interrupt>:
ffff80000010853f:	6a 00                	pushq  $0x0
ffff800000108541:	fc                   	cld    
ffff800000108542:	50                   	push   %rax
ffff800000108543:	50                   	push   %rax
ffff800000108544:	48 8c c0             	mov    %es,%rax
ffff800000108547:	50                   	push   %rax
ffff800000108548:	48 8c d8             	mov    %ds,%rax
ffff80000010854b:	50                   	push   %rax
ffff80000010854c:	48 31 c0             	xor    %rax,%rax
ffff80000010854f:	55                   	push   %rbp
ffff800000108550:	57                   	push   %rdi
ffff800000108551:	56                   	push   %rsi
ffff800000108552:	52                   	push   %rdx
ffff800000108553:	51                   	push   %rcx
ffff800000108554:	53                   	push   %rbx
ffff800000108555:	41 50                	push   %r8
ffff800000108557:	41 51                	push   %r9
ffff800000108559:	41 52                	push   %r10
ffff80000010855b:	41 53                	push   %r11
ffff80000010855d:	41 54                	push   %r12
ffff80000010855f:	41 55                	push   %r13
ffff800000108561:	41 56                	push   %r14
ffff800000108563:	41 57                	push   %r15
ffff800000108565:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010856c:	48 8e da             	mov    %rdx,%ds
ffff80000010856f:	48 8e c2             	mov    %rdx,%es
ffff800000108572:	48 89 e7             	mov    %rsp,%rdi
ffff800000108575:	48 8d 05 a9 ba ff ff 	lea    -0x4557(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010857c:	50                   	push   %rax
ffff80000010857d:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff800000108584:	e9 9c 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108589 <IRQ0x30_interrupt>:
ffff800000108589:	6a 00                	pushq  $0x0
ffff80000010858b:	fc                   	cld    
ffff80000010858c:	50                   	push   %rax
ffff80000010858d:	50                   	push   %rax
ffff80000010858e:	48 8c c0             	mov    %es,%rax
ffff800000108591:	50                   	push   %rax
ffff800000108592:	48 8c d8             	mov    %ds,%rax
ffff800000108595:	50                   	push   %rax
ffff800000108596:	48 31 c0             	xor    %rax,%rax
ffff800000108599:	55                   	push   %rbp
ffff80000010859a:	57                   	push   %rdi
ffff80000010859b:	56                   	push   %rsi
ffff80000010859c:	52                   	push   %rdx
ffff80000010859d:	51                   	push   %rcx
ffff80000010859e:	53                   	push   %rbx
ffff80000010859f:	41 50                	push   %r8
ffff8000001085a1:	41 51                	push   %r9
ffff8000001085a3:	41 52                	push   %r10
ffff8000001085a5:	41 53                	push   %r11
ffff8000001085a7:	41 54                	push   %r12
ffff8000001085a9:	41 55                	push   %r13
ffff8000001085ab:	41 56                	push   %r14
ffff8000001085ad:	41 57                	push   %r15
ffff8000001085af:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085b6:	48 8e da             	mov    %rdx,%ds
ffff8000001085b9:	48 8e c2             	mov    %rdx,%es
ffff8000001085bc:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085bf:	48 8d 05 5f ba ff ff 	lea    -0x45a1(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085c6:	50                   	push   %rax
ffff8000001085c7:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff8000001085ce:	e9 52 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001085d3 <IRQ0x31_interrupt>:
ffff8000001085d3:	6a 00                	pushq  $0x0
ffff8000001085d5:	fc                   	cld    
ffff8000001085d6:	50                   	push   %rax
ffff8000001085d7:	50                   	push   %rax
ffff8000001085d8:	48 8c c0             	mov    %es,%rax
ffff8000001085db:	50                   	push   %rax
ffff8000001085dc:	48 8c d8             	mov    %ds,%rax
ffff8000001085df:	50                   	push   %rax
ffff8000001085e0:	48 31 c0             	xor    %rax,%rax
ffff8000001085e3:	55                   	push   %rbp
ffff8000001085e4:	57                   	push   %rdi
ffff8000001085e5:	56                   	push   %rsi
ffff8000001085e6:	52                   	push   %rdx
ffff8000001085e7:	51                   	push   %rcx
ffff8000001085e8:	53                   	push   %rbx
ffff8000001085e9:	41 50                	push   %r8
ffff8000001085eb:	41 51                	push   %r9
ffff8000001085ed:	41 52                	push   %r10
ffff8000001085ef:	41 53                	push   %r11
ffff8000001085f1:	41 54                	push   %r12
ffff8000001085f3:	41 55                	push   %r13
ffff8000001085f5:	41 56                	push   %r14
ffff8000001085f7:	41 57                	push   %r15
ffff8000001085f9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108600:	48 8e da             	mov    %rdx,%ds
ffff800000108603:	48 8e c2             	mov    %rdx,%es
ffff800000108606:	48 89 e7             	mov    %rsp,%rdi
ffff800000108609:	48 8d 05 15 ba ff ff 	lea    -0x45eb(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108610:	50                   	push   %rax
ffff800000108611:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff800000108618:	e9 08 03 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010861d <IRQ0x32_interrupt>:
ffff80000010861d:	6a 00                	pushq  $0x0
ffff80000010861f:	fc                   	cld    
ffff800000108620:	50                   	push   %rax
ffff800000108621:	50                   	push   %rax
ffff800000108622:	48 8c c0             	mov    %es,%rax
ffff800000108625:	50                   	push   %rax
ffff800000108626:	48 8c d8             	mov    %ds,%rax
ffff800000108629:	50                   	push   %rax
ffff80000010862a:	48 31 c0             	xor    %rax,%rax
ffff80000010862d:	55                   	push   %rbp
ffff80000010862e:	57                   	push   %rdi
ffff80000010862f:	56                   	push   %rsi
ffff800000108630:	52                   	push   %rdx
ffff800000108631:	51                   	push   %rcx
ffff800000108632:	53                   	push   %rbx
ffff800000108633:	41 50                	push   %r8
ffff800000108635:	41 51                	push   %r9
ffff800000108637:	41 52                	push   %r10
ffff800000108639:	41 53                	push   %r11
ffff80000010863b:	41 54                	push   %r12
ffff80000010863d:	41 55                	push   %r13
ffff80000010863f:	41 56                	push   %r14
ffff800000108641:	41 57                	push   %r15
ffff800000108643:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010864a:	48 8e da             	mov    %rdx,%ds
ffff80000010864d:	48 8e c2             	mov    %rdx,%es
ffff800000108650:	48 89 e7             	mov    %rsp,%rdi
ffff800000108653:	48 8d 05 cb b9 ff ff 	lea    -0x4635(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010865a:	50                   	push   %rax
ffff80000010865b:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff800000108662:	e9 be 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108667 <IRQ0x33_interrupt>:
ffff800000108667:	6a 00                	pushq  $0x0
ffff800000108669:	fc                   	cld    
ffff80000010866a:	50                   	push   %rax
ffff80000010866b:	50                   	push   %rax
ffff80000010866c:	48 8c c0             	mov    %es,%rax
ffff80000010866f:	50                   	push   %rax
ffff800000108670:	48 8c d8             	mov    %ds,%rax
ffff800000108673:	50                   	push   %rax
ffff800000108674:	48 31 c0             	xor    %rax,%rax
ffff800000108677:	55                   	push   %rbp
ffff800000108678:	57                   	push   %rdi
ffff800000108679:	56                   	push   %rsi
ffff80000010867a:	52                   	push   %rdx
ffff80000010867b:	51                   	push   %rcx
ffff80000010867c:	53                   	push   %rbx
ffff80000010867d:	41 50                	push   %r8
ffff80000010867f:	41 51                	push   %r9
ffff800000108681:	41 52                	push   %r10
ffff800000108683:	41 53                	push   %r11
ffff800000108685:	41 54                	push   %r12
ffff800000108687:	41 55                	push   %r13
ffff800000108689:	41 56                	push   %r14
ffff80000010868b:	41 57                	push   %r15
ffff80000010868d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108694:	48 8e da             	mov    %rdx,%ds
ffff800000108697:	48 8e c2             	mov    %rdx,%es
ffff80000010869a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010869d:	48 8d 05 81 b9 ff ff 	lea    -0x467f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086a4:	50                   	push   %rax
ffff8000001086a5:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff8000001086ac:	e9 74 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001086b1 <IRQ0x34_interrupt>:
ffff8000001086b1:	6a 00                	pushq  $0x0
ffff8000001086b3:	fc                   	cld    
ffff8000001086b4:	50                   	push   %rax
ffff8000001086b5:	50                   	push   %rax
ffff8000001086b6:	48 8c c0             	mov    %es,%rax
ffff8000001086b9:	50                   	push   %rax
ffff8000001086ba:	48 8c d8             	mov    %ds,%rax
ffff8000001086bd:	50                   	push   %rax
ffff8000001086be:	48 31 c0             	xor    %rax,%rax
ffff8000001086c1:	55                   	push   %rbp
ffff8000001086c2:	57                   	push   %rdi
ffff8000001086c3:	56                   	push   %rsi
ffff8000001086c4:	52                   	push   %rdx
ffff8000001086c5:	51                   	push   %rcx
ffff8000001086c6:	53                   	push   %rbx
ffff8000001086c7:	41 50                	push   %r8
ffff8000001086c9:	41 51                	push   %r9
ffff8000001086cb:	41 52                	push   %r10
ffff8000001086cd:	41 53                	push   %r11
ffff8000001086cf:	41 54                	push   %r12
ffff8000001086d1:	41 55                	push   %r13
ffff8000001086d3:	41 56                	push   %r14
ffff8000001086d5:	41 57                	push   %r15
ffff8000001086d7:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086de:	48 8e da             	mov    %rdx,%ds
ffff8000001086e1:	48 8e c2             	mov    %rdx,%es
ffff8000001086e4:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086e7:	48 8d 05 37 b9 ff ff 	lea    -0x46c9(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086ee:	50                   	push   %rax
ffff8000001086ef:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff8000001086f6:	e9 2a 02 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001086fb <IRQ0x35_interrupt>:
ffff8000001086fb:	6a 00                	pushq  $0x0
ffff8000001086fd:	fc                   	cld    
ffff8000001086fe:	50                   	push   %rax
ffff8000001086ff:	50                   	push   %rax
ffff800000108700:	48 8c c0             	mov    %es,%rax
ffff800000108703:	50                   	push   %rax
ffff800000108704:	48 8c d8             	mov    %ds,%rax
ffff800000108707:	50                   	push   %rax
ffff800000108708:	48 31 c0             	xor    %rax,%rax
ffff80000010870b:	55                   	push   %rbp
ffff80000010870c:	57                   	push   %rdi
ffff80000010870d:	56                   	push   %rsi
ffff80000010870e:	52                   	push   %rdx
ffff80000010870f:	51                   	push   %rcx
ffff800000108710:	53                   	push   %rbx
ffff800000108711:	41 50                	push   %r8
ffff800000108713:	41 51                	push   %r9
ffff800000108715:	41 52                	push   %r10
ffff800000108717:	41 53                	push   %r11
ffff800000108719:	41 54                	push   %r12
ffff80000010871b:	41 55                	push   %r13
ffff80000010871d:	41 56                	push   %r14
ffff80000010871f:	41 57                	push   %r15
ffff800000108721:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108728:	48 8e da             	mov    %rdx,%ds
ffff80000010872b:	48 8e c2             	mov    %rdx,%es
ffff80000010872e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108731:	48 8d 05 ed b8 ff ff 	lea    -0x4713(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108738:	50                   	push   %rax
ffff800000108739:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff800000108740:	e9 e0 01 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff800000108745 <IRQ0x36_interrupt>:
ffff800000108745:	6a 00                	pushq  $0x0
ffff800000108747:	fc                   	cld    
ffff800000108748:	50                   	push   %rax
ffff800000108749:	50                   	push   %rax
ffff80000010874a:	48 8c c0             	mov    %es,%rax
ffff80000010874d:	50                   	push   %rax
ffff80000010874e:	48 8c d8             	mov    %ds,%rax
ffff800000108751:	50                   	push   %rax
ffff800000108752:	48 31 c0             	xor    %rax,%rax
ffff800000108755:	55                   	push   %rbp
ffff800000108756:	57                   	push   %rdi
ffff800000108757:	56                   	push   %rsi
ffff800000108758:	52                   	push   %rdx
ffff800000108759:	51                   	push   %rcx
ffff80000010875a:	53                   	push   %rbx
ffff80000010875b:	41 50                	push   %r8
ffff80000010875d:	41 51                	push   %r9
ffff80000010875f:	41 52                	push   %r10
ffff800000108761:	41 53                	push   %r11
ffff800000108763:	41 54                	push   %r12
ffff800000108765:	41 55                	push   %r13
ffff800000108767:	41 56                	push   %r14
ffff800000108769:	41 57                	push   %r15
ffff80000010876b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108772:	48 8e da             	mov    %rdx,%ds
ffff800000108775:	48 8e c2             	mov    %rdx,%es
ffff800000108778:	48 89 e7             	mov    %rsp,%rdi
ffff80000010877b:	48 8d 05 a3 b8 ff ff 	lea    -0x475d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108782:	50                   	push   %rax
ffff800000108783:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff80000010878a:	e9 96 01 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff80000010878f <IRQ0x37_interrupt>:
ffff80000010878f:	6a 00                	pushq  $0x0
ffff800000108791:	fc                   	cld    
ffff800000108792:	50                   	push   %rax
ffff800000108793:	50                   	push   %rax
ffff800000108794:	48 8c c0             	mov    %es,%rax
ffff800000108797:	50                   	push   %rax
ffff800000108798:	48 8c d8             	mov    %ds,%rax
ffff80000010879b:	50                   	push   %rax
ffff80000010879c:	48 31 c0             	xor    %rax,%rax
ffff80000010879f:	55                   	push   %rbp
ffff8000001087a0:	57                   	push   %rdi
ffff8000001087a1:	56                   	push   %rsi
ffff8000001087a2:	52                   	push   %rdx
ffff8000001087a3:	51                   	push   %rcx
ffff8000001087a4:	53                   	push   %rbx
ffff8000001087a5:	41 50                	push   %r8
ffff8000001087a7:	41 51                	push   %r9
ffff8000001087a9:	41 52                	push   %r10
ffff8000001087ab:	41 53                	push   %r11
ffff8000001087ad:	41 54                	push   %r12
ffff8000001087af:	41 55                	push   %r13
ffff8000001087b1:	41 56                	push   %r14
ffff8000001087b3:	41 57                	push   %r15
ffff8000001087b5:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001087bc:	48 8e da             	mov    %rdx,%ds
ffff8000001087bf:	48 8e c2             	mov    %rdx,%es
ffff8000001087c2:	48 89 e7             	mov    %rsp,%rdi
ffff8000001087c5:	48 8d 05 59 b8 ff ff 	lea    -0x47a7(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001087cc:	50                   	push   %rax
ffff8000001087cd:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff8000001087d4:	e9 4c 01 00 00       	jmpq   ffff800000108925 <do_IRQ>

ffff8000001087d9 <init_interrupt>:
ffff8000001087d9:	55                   	push   %rbp
ffff8000001087da:	48 89 e5             	mov    %rsp,%rbp
ffff8000001087dd:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001087e1:	c7 45 fc 20 00 00 00 	movl   $0x20,-0x4(%rbp)
ffff8000001087e8:	eb 30                	jmp    ffff80000010881a <init_interrupt+0x41>
ffff8000001087ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001087ed:	83 e8 20             	sub    $0x20,%eax
ffff8000001087f0:	48 ba 40 02 11 00 00 	movabs $0xffff800000110240,%rdx
ffff8000001087f7:	80 ff ff 
ffff8000001087fa:	48 98                	cltq   
ffff8000001087fc:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff800000108800:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000108803:	be 02 00 00 00       	mov    $0x2,%esi
ffff800000108808:	89 c7                	mov    %eax,%edi
ffff80000010880a:	48 b8 91 7f 10 00 00 	movabs $0xffff800000107f91,%rax
ffff800000108811:	80 ff ff 
ffff800000108814:	ff d0                	callq  *%rax
ffff800000108816:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff80000010881a:	83 7d fc 37          	cmpl   $0x37,-0x4(%rbp)
ffff80000010881e:	7e ca                	jle    ffff8000001087ea <init_interrupt+0x11>
ffff800000108820:	48 ba c0 28 11 00 00 	movabs $0xffff8000001128c0,%rdx
ffff800000108827:	80 ff ff 
ffff80000010882a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010882f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108834:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108839:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108840:	80 ff ff 
ffff800000108843:	ff d1                	callq  *%rcx
ffff800000108845:	be 11 00 00 00       	mov    $0x11,%esi
ffff80000010884a:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010884f:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff800000108856:	80 ff ff 
ffff800000108859:	ff d0                	callq  *%rax
ffff80000010885b:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000108860:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108865:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff80000010886c:	80 ff ff 
ffff80000010886f:	ff d0                	callq  *%rax
ffff800000108871:	be 04 00 00 00       	mov    $0x4,%esi
ffff800000108876:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010887b:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff800000108882:	80 ff ff 
ffff800000108885:	ff d0                	callq  *%rax
ffff800000108887:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010888c:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108891:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff800000108898:	80 ff ff 
ffff80000010889b:	ff d0                	callq  *%rax
ffff80000010889d:	be 11 00 00 00       	mov    $0x11,%esi
ffff8000001088a2:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff8000001088a7:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff8000001088ae:	80 ff ff 
ffff8000001088b1:	ff d0                	callq  *%rax
ffff8000001088b3:	be 28 00 00 00       	mov    $0x28,%esi
ffff8000001088b8:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088bd:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff8000001088c4:	80 ff ff 
ffff8000001088c7:	ff d0                	callq  *%rax
ffff8000001088c9:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001088ce:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088d3:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff8000001088da:	80 ff ff 
ffff8000001088dd:	ff d0                	callq  *%rax
ffff8000001088df:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001088e4:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088e9:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff8000001088f0:	80 ff ff 
ffff8000001088f3:	ff d0                	callq  *%rax
ffff8000001088f5:	be fd 00 00 00       	mov    $0xfd,%esi
ffff8000001088fa:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001088ff:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff800000108906:	80 ff ff 
ffff800000108909:	ff d0                	callq  *%rax
ffff80000010890b:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000108910:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108915:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff80000010891c:	80 ff ff 
ffff80000010891f:	ff d0                	callq  *%rax
ffff800000108921:	fb                   	sti    
ffff800000108922:	90                   	nop
ffff800000108923:	c9                   	leaveq 
ffff800000108924:	c3                   	retq   

ffff800000108925 <do_IRQ>:
ffff800000108925:	55                   	push   %rbp
ffff800000108926:	48 89 e5             	mov    %rsp,%rbp
ffff800000108929:	48 83 ec 20          	sub    $0x20,%rsp
ffff80000010892d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108931:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108935:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108939:	48 89 c1             	mov    %rax,%rcx
ffff80000010893c:	48 ba cd 28 11 00 00 	movabs $0xffff8000001128cd,%rdx
ffff800000108943:	80 ff ff 
ffff800000108946:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010894b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108950:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108955:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010895c:	80 ff ff 
ffff80000010895f:	41 ff d0             	callq  *%r8
ffff800000108962:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000108967:	48 b8 50 7f 10 00 00 	movabs $0xffff800000107f50,%rax
ffff80000010896e:	80 ff ff 
ffff800000108971:	ff d0                	callq  *%rax
ffff800000108973:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000108976:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff80000010897a:	89 c1                	mov    %eax,%ecx
ffff80000010897c:	48 ba dd 28 11 00 00 	movabs $0xffff8000001128dd,%rdx
ffff800000108983:	80 ff ff 
ffff800000108986:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010898b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108990:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108995:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010899c:	80 ff ff 
ffff80000010899f:	41 ff d0             	callq  *%r8
ffff8000001089a2:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001089a7:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001089ac:	48 b8 71 7f 10 00 00 	movabs $0xffff800000107f71,%rax
ffff8000001089b3:	80 ff ff 
ffff8000001089b6:	ff d0                	callq  *%rax
ffff8000001089b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089bc:	48 8b 88 b0 00 00 00 	mov    0xb0(%rax),%rcx
ffff8000001089c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089c7:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001089ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089d2:	49 89 c9             	mov    %rcx,%r9
ffff8000001089d5:	49 89 d0             	mov    %rdx,%r8
ffff8000001089d8:	48 89 c1             	mov    %rax,%rcx
ffff8000001089db:	48 ba f0 28 11 00 00 	movabs $0xffff8000001128f0,%rdx
ffff8000001089e2:	80 ff ff 
ffff8000001089e5:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001089ea:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001089ef:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001089f4:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001089fb:	80 ff ff 
ffff8000001089fe:	41 ff d2             	callq  *%r10
ffff800000108a01:	90                   	nop
ffff800000108a02:	c9                   	leaveq 
ffff800000108a03:	c3                   	retq   

ffff800000108a04 <list_init>:
ffff800000108a04:	55                   	push   %rbp
ffff800000108a05:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a08:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a10:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a14:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a1b:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a1f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a23:	90                   	nop
ffff800000108a24:	5d                   	pop    %rbp
ffff800000108a25:	c3                   	retq   

ffff800000108a26 <list_add_to_before>:
ffff800000108a26:	55                   	push   %rbp
ffff800000108a27:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a2a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a2e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108a32:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108a36:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a3a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a42:	48 8b 00             	mov    (%rax),%rax
ffff800000108a45:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a49:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a51:	48 8b 10             	mov    (%rax),%rdx
ffff800000108a54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108a58:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a5f:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a63:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a66:	90                   	nop
ffff800000108a67:	5d                   	pop    %rbp
ffff800000108a68:	c3                   	retq   

ffff800000108a69 <list_next>:
ffff800000108a69:	55                   	push   %rbp
ffff800000108a6a:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a6d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a75:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108a79:	48 85 c0             	test   %rax,%rax
ffff800000108a7c:	74 0a                	je     ffff800000108a88 <list_next+0x1f>
ffff800000108a7e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a82:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108a86:	eb 05                	jmp    ffff800000108a8d <list_next+0x24>
ffff800000108a88:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a8d:	5d                   	pop    %rbp
ffff800000108a8e:	c3                   	retq   

ffff800000108a8f <memcpy>:
ffff800000108a8f:	55                   	push   %rbp
ffff800000108a90:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a93:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108a97:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108a9b:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108a9f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108aa3:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108aa7:	48 85 c0             	test   %rax,%rax
ffff800000108aaa:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108aae:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108ab2:	48 89 c1             	mov    %rax,%rcx
ffff800000108ab5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ab9:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000108abd:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
ffff800000108ac1:	48 89 d7             	mov    %rdx,%rdi
ffff800000108ac4:	fc                   	cld    
ffff800000108ac5:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
ffff800000108ac8:	a8 04                	test   $0x4,%al
ffff800000108aca:	74 01                	je     ffff800000108acd <memcpy+0x3e>
ffff800000108acc:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff800000108acd:	a8 02                	test   $0x2,%al
ffff800000108acf:	74 02                	je     ffff800000108ad3 <memcpy+0x44>
ffff800000108ad1:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
ffff800000108ad3:	a8 01                	test   $0x1,%al
ffff800000108ad5:	74 01                	je     ffff800000108ad8 <memcpy+0x49>
ffff800000108ad7:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff800000108ad8:	89 f2                	mov    %esi,%edx
ffff800000108ada:	89 4d fc             	mov    %ecx,-0x4(%rbp)
ffff800000108add:	89 7d f8             	mov    %edi,-0x8(%rbp)
ffff800000108ae0:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108ae3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108ae7:	5d                   	pop    %rbp
ffff800000108ae8:	c3                   	retq   

ffff800000108ae9 <memset>:
ffff800000108ae9:	55                   	push   %rbp
ffff800000108aea:	48 89 e5             	mov    %rsp,%rbp
ffff800000108aed:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108af1:	89 f0                	mov    %esi,%eax
ffff800000108af3:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108af7:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000108afa:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108afe:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000108b05:	01 01 01 
ffff800000108b08:	48 0f af c2          	imul   %rdx,%rax
ffff800000108b0c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b10:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b14:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108b18:	48 85 c0             	test   %rax,%rax
ffff800000108b1b:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108b1f:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108b23:	48 89 c1             	mov    %rax,%rcx
ffff800000108b26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b2a:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff800000108b2e:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000108b32:	48 89 d7             	mov    %rdx,%rdi
ffff800000108b35:	fc                   	cld    
ffff800000108b36:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff800000108b39:	40 f6 c6 04          	test   $0x4,%sil
ffff800000108b3d:	74 01                	je     ffff800000108b40 <memset+0x57>
ffff800000108b3f:	ab                   	stos   %eax,%es:(%rdi)
ffff800000108b40:	40 f6 c6 02          	test   $0x2,%sil
ffff800000108b44:	74 02                	je     ffff800000108b48 <memset+0x5f>
ffff800000108b46:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000108b48:	40 f6 c6 01          	test   $0x1,%sil
ffff800000108b4c:	74 01                	je     ffff800000108b4f <memset+0x66>
ffff800000108b4e:	aa                   	stos   %al,%es:(%rdi)
ffff800000108b4f:	89 f8                	mov    %edi,%eax
ffff800000108b51:	89 ca                	mov    %ecx,%edx
ffff800000108b53:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108b56:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff800000108b59:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108b5d:	5d                   	pop    %rbp
ffff800000108b5e:	c3                   	retq   

ffff800000108b5f <wrmsr>:
ffff800000108b5f:	55                   	push   %rbp
ffff800000108b60:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b63:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108b67:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108b6b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b6f:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108b73:	48 89 c2             	mov    %rax,%rdx
ffff800000108b76:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b7a:	89 c0                	mov    %eax,%eax
ffff800000108b7c:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff800000108b80:	0f 30                	wrmsr  
ffff800000108b82:	90                   	nop
ffff800000108b83:	5d                   	pop    %rbp
ffff800000108b84:	c3                   	retq   

ffff800000108b85 <get_current>:
ffff800000108b85:	55                   	push   %rbp
ffff800000108b86:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b89:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108b90:	00 
ffff800000108b91:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108b98:	48 21 e0             	and    %rsp,%rax
ffff800000108b9b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108ba3:	5d                   	pop    %rbp
ffff800000108ba4:	c3                   	retq   
ffff800000108ba5:	55                   	push   %rbp
ffff800000108ba6:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ba9:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bad:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108bb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bb5:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108bbc:	48 89 c1             	mov    %rax,%rcx
ffff800000108bbf:	48 ba 18 29 11 00 00 	movabs $0xffff800000112918,%rdx
ffff800000108bc6:	80 ff ff 
ffff800000108bc9:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108bce:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108bd3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108bd8:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108bdf:	80 ff ff 
ffff800000108be2:	41 ff d0             	callq  *%r8
ffff800000108be5:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108bec:	c9                   	leaveq 
ffff800000108bed:	c3                   	retq   
ffff800000108bee:	55                   	push   %rbp
ffff800000108bef:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bf2:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bf6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108bfa:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bfe:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108c02:	48 89 c2             	mov    %rax,%rdx
ffff800000108c05:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108c0a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108c0f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108c14:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108c1b:	80 ff ff 
ffff800000108c1e:	ff d1                	callq  *%rcx
ffff800000108c20:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108c25:	c9                   	leaveq 
ffff800000108c26:	c3                   	retq   
ffff800000108c27:	55                   	push   %rbp
ffff800000108c28:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c2b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c2f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108c33:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108c37:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000108c3b:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108c3f:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000108c43:	48 ba 10 aa 10 00 00 	movabs $0xffff80000010aa10,%rdx
ffff800000108c4a:	80 ff ff 
ffff800000108c4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c51:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c54:	48 ba 18 aa 10 00 00 	movabs $0xffff80000010aa18,%rdx
ffff800000108c5b:	80 ff ff 
ffff800000108c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108c62:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c65:	48 ba 20 aa 10 00 00 	movabs $0xffff80000010aa20,%rdx
ffff800000108c6c:	80 ff ff 
ffff800000108c6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c73:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c76:	48 ba 30 aa 10 00 00 	movabs $0xffff80000010aa30,%rdx
ffff800000108c7d:	80 ff ff 
ffff800000108c80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108c84:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c87:	48 ba 38 aa 10 00 00 	movabs $0xffff80000010aa38,%rdx
ffff800000108c8e:	80 ff ff 
ffff800000108c91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108c95:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c98:	48 ba 40 aa 10 00 00 	movabs $0xffff80000010aa40,%rdx
ffff800000108c9f:	80 ff ff 
ffff800000108ca2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108ca6:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ca9:	48 ba 48 aa 10 00 00 	movabs $0xffff80000010aa48,%rdx
ffff800000108cb0:	80 ff ff 
ffff800000108cb3:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000108cb7:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cba:	48 ba 50 aa 10 00 00 	movabs $0xffff80000010aa50,%rdx
ffff800000108cc1:	80 ff ff 
ffff800000108cc4:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000108cc8:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ccb:	48 ba 58 aa 10 00 00 	movabs $0xffff80000010aa58,%rdx
ffff800000108cd2:	80 ff ff 
ffff800000108cd5:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000108cd9:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cdc:	48 ba 60 aa 10 00 00 	movabs $0xffff80000010aa60,%rdx
ffff800000108ce3:	80 ff ff 
ffff800000108ce6:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000108cea:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ced:	90                   	nop
ffff800000108cee:	5d                   	pop    %rbp
ffff800000108cef:	c3                   	retq   

ffff800000108cf0 <user_level_function>:
ffff800000108cf0:	55                   	push   %rbp
ffff800000108cf1:	48 89 e5             	mov    %rsp,%rbp
ffff800000108cf4:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108cfb:	00 
ffff800000108cfc:	48 b8 54 72 69 70 6c 	movabs $0x4820656c70697254,%rax
ffff800000108d03:	65 20 48 
ffff800000108d06:	48 ba 20 4f 53 20 3e 	movabs $0x203c5f3e20534f20,%rdx
ffff800000108d0d:	5f 3c 20 
ffff800000108d10:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000108d14:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108d18:	c7 45 f0 21 21 21 0a 	movl   $0xa212121,-0x10(%rbp)
ffff800000108d1f:	c6 45 f4 00          	movb   $0x0,-0xc(%rbp)
ffff800000108d23:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108d28:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000108d2c:	48 89 d7             	mov    %rdx,%rdi
ffff800000108d2f:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108d3b <sysexit_return_address>
ffff800000108d36:	48 89 e1             	mov    %rsp,%rcx
ffff800000108d39:	0f 34                	sysenter 

ffff800000108d3b <sysexit_return_address>:
ffff800000108d3b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108d3f:	eb fe                	jmp    ffff800000108d3f <sysexit_return_address+0x4>

ffff800000108d41 <do_execve>:
ffff800000108d41:	55                   	push   %rbp
ffff800000108d42:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d45:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108d49:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108d4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d51:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108d58:	00 
ffff800000108d59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d5d:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108d64:	00 
ffff800000108d65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d69:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
ffff800000108d70:	01 00 00 00 
ffff800000108d74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d78:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108d7f:	00 
ffff800000108d80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d84:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108d8b:	00 
ffff800000108d8c:	48 ba 3c 29 11 00 00 	movabs $0xffff80000011293c,%rdx
ffff800000108d93:	80 ff ff 
ffff800000108d96:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108d9b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108da0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108da5:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108dac:	80 ff ff 
ffff800000108daf:	ff d1                	callq  *%rcx
ffff800000108db1:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108db6:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108dbb:	48 bf f0 8c 10 00 00 	movabs $0xffff800000108cf0,%rdi
ffff800000108dc2:	80 ff ff 
ffff800000108dc5:	48 b8 8f 8a 10 00 00 	movabs $0xffff800000108a8f,%rax
ffff800000108dcc:	80 ff ff 
ffff800000108dcf:	ff d0                	callq  *%rax
ffff800000108dd1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108dd6:	c9                   	leaveq 
ffff800000108dd7:	c3                   	retq   

ffff800000108dd8 <init>:
ffff800000108dd8:	55                   	push   %rbp
ffff800000108dd9:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ddc:	53                   	push   %rbx
ffff800000108ddd:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108de1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108de5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108de9:	48 89 c1             	mov    %rax,%rcx
ffff800000108dec:	48 ba 58 29 11 00 00 	movabs $0xffff800000112958,%rdx
ffff800000108df3:	80 ff ff 
ffff800000108df6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108dfb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108e00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e05:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108e0c:	80 ff ff 
ffff800000108e0f:	41 ff d0             	callq  *%r8
ffff800000108e12:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e17:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e1e:	80 ff ff 
ffff800000108e21:	ff d2                	callq  *%rdx
ffff800000108e23:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e27:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff800000108e2e:	80 ff ff 
ffff800000108e31:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108e35:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e3a:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e41:	80 ff ff 
ffff800000108e44:	ff d2                	callq  *%rdx
ffff800000108e46:	48 89 c3             	mov    %rax,%rbx
ffff800000108e49:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e4e:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e55:	80 ff ff 
ffff800000108e58:	ff d2                	callq  *%rdx
ffff800000108e5a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e5e:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
ffff800000108e65:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108e69:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e6e:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e75:	80 ff ff 
ffff800000108e78:	ff d2                	callq  *%rdx
ffff800000108e7a:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e7e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108e82:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108e86:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e8b:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e92:	80 ff ff 
ffff800000108e95:	ff d2                	callq  *%rdx
ffff800000108e97:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000108e9b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ea0:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108ea7:	80 ff ff 
ffff800000108eaa:	ff d2                	callq  *%rdx
ffff800000108eac:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000108eb0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108eb4:	48 89 c7             	mov    %rax,%rdi
ffff800000108eb7:	48 8b 63 10          	mov    0x10(%rbx),%rsp
ffff800000108ebb:	ff 72 08             	pushq  0x8(%rdx)
ffff800000108ebe:	e9 7e fe ff ff       	jmpq   ffff800000108d41 <do_execve>
ffff800000108ec3:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108ec8:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000108ecc:	c9                   	leaveq 
ffff800000108ecd:	c3                   	retq   

ffff800000108ece <do_fork>:
ffff800000108ece:	55                   	push   %rbp
ffff800000108ecf:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ed2:	53                   	push   %rbx
ffff800000108ed3:	48 83 ec 48          	sub    $0x48,%rsp
ffff800000108ed7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108edb:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108edf:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108ee3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000108ee7:	48 ba 7a 29 11 00 00 	movabs $0xffff80000011297a,%rdx
ffff800000108eee:	80 ff ff 
ffff800000108ef1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108ef6:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108efb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f00:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108f07:	80 ff ff 
ffff800000108f0a:	ff d1                	callq  *%rcx
ffff800000108f0c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000108f13:	00 
ffff800000108f14:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000108f1b:	00 
ffff800000108f1c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108f23:	00 
ffff800000108f24:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f2b:	80 ff ff 
ffff800000108f2e:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f35:	48 8b 00             	mov    (%rax),%rax
ffff800000108f38:	48 89 c1             	mov    %rax,%rcx
ffff800000108f3b:	48 ba 89 29 11 00 00 	movabs $0xffff800000112989,%rdx
ffff800000108f42:	80 ff ff 
ffff800000108f45:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f4a:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108f4f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f54:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108f5b:	80 ff ff 
ffff800000108f5e:	41 ff d0             	callq  *%r8
ffff800000108f61:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000108f66:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108f6b:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000108f70:	48 b8 1e 7c 10 00 00 	movabs $0xffff800000107c1e,%rax
ffff800000108f77:	80 ff ff 
ffff800000108f7a:	ff d0                	callq  *%rax
ffff800000108f7c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108f80:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f87:	80 ff ff 
ffff800000108f8a:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f91:	48 8b 00             	mov    (%rax),%rax
ffff800000108f94:	48 89 c1             	mov    %rax,%rcx
ffff800000108f97:	48 ba 89 29 11 00 00 	movabs $0xffff800000112989,%rdx
ffff800000108f9e:	80 ff ff 
ffff800000108fa1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fa6:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108fab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fb0:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108fb7:	80 ff ff 
ffff800000108fba:	41 ff d0             	callq  *%r8
ffff800000108fbd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fc1:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108fc5:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
ffff800000108fcc:	80 ff ff 
ffff800000108fcf:	48 01 d0             	add    %rdx,%rax
ffff800000108fd2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108fd6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108fda:	48 89 c1             	mov    %rax,%rcx
ffff800000108fdd:	48 ba a8 29 11 00 00 	movabs $0xffff8000001129a8,%rdx
ffff800000108fe4:	80 ff ff 
ffff800000108fe7:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fec:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108ff1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ff6:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108ffd:	80 ff ff 
ffff800000109000:	41 ff d0             	callq  *%r8
ffff800000109003:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109007:	ba 58 00 00 00       	mov    $0x58,%edx
ffff80000010900c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109011:	48 89 c7             	mov    %rax,%rdi
ffff800000109014:	48 b8 e9 8a 10 00 00 	movabs $0xffff800000108ae9,%rax
ffff80000010901b:	80 ff ff 
ffff80000010901e:	ff d0                	callq  *%rax
ffff800000109020:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109025:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff80000010902c:	80 ff ff 
ffff80000010902f:	ff d2                	callq  *%rdx
ffff800000109031:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109035:	48 8b 08             	mov    (%rax),%rcx
ffff800000109038:	48 8b 58 08          	mov    0x8(%rax),%rbx
ffff80000010903c:	48 89 0a             	mov    %rcx,(%rdx)
ffff80000010903f:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
ffff800000109043:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff800000109047:	48 8b 58 18          	mov    0x18(%rax),%rbx
ffff80000010904b:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
ffff80000010904f:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
ffff800000109053:	48 8b 48 20          	mov    0x20(%rax),%rcx
ffff800000109057:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff80000010905b:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
ffff80000010905f:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
ffff800000109063:	48 8b 48 30          	mov    0x30(%rax),%rcx
ffff800000109067:	48 8b 58 38          	mov    0x38(%rax),%rbx
ffff80000010906b:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
ffff80000010906f:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
ffff800000109073:	48 8b 48 40          	mov    0x40(%rax),%rcx
ffff800000109077:	48 8b 58 48          	mov    0x48(%rax),%rbx
ffff80000010907b:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
ffff80000010907f:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
ffff800000109083:	48 8b 40 50          	mov    0x50(%rax),%rax
ffff800000109087:	48 89 42 50          	mov    %rax,0x50(%rdx)
ffff80000010908b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010908f:	48 89 c7             	mov    %rax,%rdi
ffff800000109092:	48 b8 04 8a 10 00 00 	movabs $0xffff800000108a04,%rax
ffff800000109099:	80 ff ff 
ffff80000010909c:	ff d0                	callq  *%rax
ffff80000010909e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090a2:	48 89 c6             	mov    %rax,%rsi
ffff8000001090a5:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff8000001090ac:	80 ff ff 
ffff8000001090af:	48 b8 26 8a 10 00 00 	movabs $0xffff800000108a26,%rax
ffff8000001090b6:	80 ff ff 
ffff8000001090b9:	ff d0                	callq  *%rax
ffff8000001090bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090bf:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001090c3:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001090c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090cb:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001090cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090d3:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001090da:	00 
ffff8000001090db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090df:	48 83 c0 58          	add    $0x58,%rax
ffff8000001090e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001090e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090eb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001090ef:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001090f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090f7:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff8000001090fd:	48 89 c1             	mov    %rax,%rcx
ffff800000109100:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109104:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109109:	48 89 ce             	mov    %rcx,%rsi
ffff80000010910c:	48 89 c7             	mov    %rax,%rdi
ffff80000010910f:	48 b8 8f 8a 10 00 00 	movabs $0xffff800000108a8f,%rax
ffff800000109116:	80 ff ff 
ffff800000109119:	ff d0                	callq  *%rax
ffff80000010911b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010911f:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000109126:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010912a:	48 89 10             	mov    %rdx,(%rax)
ffff80000010912d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109131:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109138:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010913c:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109140:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109144:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010914b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010914f:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109153:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109157:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010915b:	48 89 c1             	mov    %rax,%rcx
ffff80000010915e:	48 ba cc 29 11 00 00 	movabs $0xffff8000001129cc,%rdx
ffff800000109165:	80 ff ff 
ffff800000109168:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010916d:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000109172:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109177:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010917e:	80 ff ff 
ffff800000109181:	41 ff d0             	callq  *%r8
ffff800000109184:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109188:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff80000010918c:	48 89 c1             	mov    %rax,%rcx
ffff80000010918f:	48 ba dd 29 11 00 00 	movabs $0xffff8000001129dd,%rdx
ffff800000109196:	80 ff ff 
ffff800000109199:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010919e:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001091a3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091a8:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001091af:	80 ff ff 
ffff8000001091b2:	41 ff d0             	callq  *%r8
ffff8000001091b5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091b9:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001091c0:	00 
ffff8000001091c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091c5:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001091cc:	00 
ffff8000001091cd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001091d1:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001091d5:	83 e0 01             	and    $0x1,%eax
ffff8000001091d8:	48 85 c0             	test   %rax,%rax
ffff8000001091db:	75 28                	jne    ffff800000109205 <do_fork+0x337>
ffff8000001091dd:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff8000001091e4:	80 ff ff 
ffff8000001091e7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001091eb:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff8000001091f2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001091f6:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001091fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109201:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109205:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109209:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff800000109210:	00 
ffff800000109211:	48 ba ee 29 11 00 00 	movabs $0xffff8000001129ee,%rdx
ffff800000109218:	80 ff ff 
ffff80000010921b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109220:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109225:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010922a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000109231:	80 ff ff 
ffff800000109234:	ff d1                	callq  *%rcx
ffff800000109236:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010923b:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010923f:	c9                   	leaveq 
ffff800000109240:	c3                   	retq   

ffff800000109241 <do_exit>:
ffff800000109241:	55                   	push   %rbp
ffff800000109242:	48 89 e5             	mov    %rsp,%rbp
ffff800000109245:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109249:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010924d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000109251:	48 89 c1             	mov    %rax,%rcx
ffff800000109254:	48 ba 00 2a 11 00 00 	movabs $0xffff800000112a00,%rdx
ffff80000010925b:	80 ff ff 
ffff80000010925e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109263:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109268:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010926d:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000109274:	80 ff ff 
ffff800000109277:	41 ff d0             	callq  *%r8
ffff80000010927a:	eb fe                	jmp    ffff80000010927a <do_exit+0x39>

ffff80000010927c <system_call_function>:
ffff80000010927c:	55                   	push   %rbp
ffff80000010927d:	48 89 e5             	mov    %rsp,%rbp
ffff800000109280:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109284:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109288:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010928c:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000109293:	48 ba 40 be 10 00 00 	movabs $0xffff80000010be40,%rdx
ffff80000010929a:	80 ff ff 
ffff80000010929d:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff8000001092a1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001092a5:	48 89 c7             	mov    %rax,%rdi
ffff8000001092a8:	ff d2                	callq  *%rdx
ffff8000001092aa:	c9                   	leaveq 
ffff8000001092ab:	c3                   	retq   

ffff8000001092ac <kernel_thread_func>:
ffff8000001092ac:	41 5f                	pop    %r15
ffff8000001092ae:	41 5e                	pop    %r14
ffff8000001092b0:	41 5d                	pop    %r13
ffff8000001092b2:	41 5c                	pop    %r12
ffff8000001092b4:	41 5b                	pop    %r11
ffff8000001092b6:	41 5a                	pop    %r10
ffff8000001092b8:	41 59                	pop    %r9
ffff8000001092ba:	41 58                	pop    %r8
ffff8000001092bc:	5b                   	pop    %rbx
ffff8000001092bd:	59                   	pop    %rcx
ffff8000001092be:	5a                   	pop    %rdx
ffff8000001092bf:	5e                   	pop    %rsi
ffff8000001092c0:	5f                   	pop    %rdi
ffff8000001092c1:	5d                   	pop    %rbp
ffff8000001092c2:	58                   	pop    %rax
ffff8000001092c3:	48 8e d8             	mov    %rax,%ds
ffff8000001092c6:	58                   	pop    %rax
ffff8000001092c7:	48 8e c0             	mov    %rax,%es
ffff8000001092ca:	58                   	pop    %rax
ffff8000001092cb:	48 83 c4 38          	add    $0x38,%rsp
ffff8000001092cf:	48 89 d7             	mov    %rdx,%rdi
ffff8000001092d2:	ff d3                	callq  *%rbx
ffff8000001092d4:	48 89 c7             	mov    %rax,%rdi
ffff8000001092d7:	e8 65 ff ff ff       	callq  ffff800000109241 <do_exit>

ffff8000001092dc <kernel_thread>:
ffff8000001092dc:	55                   	push   %rbp
ffff8000001092dd:	48 89 e5             	mov    %rsp,%rbp
ffff8000001092e0:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff8000001092e7:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
ffff8000001092ee:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
ffff8000001092f5:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
ffff8000001092fc:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000109303:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109308:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010930d:	48 89 c7             	mov    %rax,%rdi
ffff800000109310:	48 b8 e9 8a 10 00 00 	movabs $0xffff800000108ae9,%rax
ffff800000109317:	80 ff ff 
ffff80000010931a:	ff d0                	callq  *%rax
ffff80000010931c:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
ffff800000109323:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000109327:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
ffff80000010932e:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000109332:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
ffff800000109339:	00 
ffff80000010933a:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
ffff800000109341:	00 
ffff800000109342:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
ffff800000109349:	00 
ffff80000010934a:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
ffff800000109351:	00 
ffff800000109352:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
ffff800000109359:	00 
ffff80000010935a:	48 b8 ac 92 10 00 00 	movabs $0xffff8000001092ac,%rax
ffff800000109361:	80 ff ff 
ffff800000109364:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000109368:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
ffff80000010936f:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000109376:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff80000010937b:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109380:	48 89 c7             	mov    %rax,%rdi
ffff800000109383:	48 b8 ce 8e 10 00 00 	movabs $0xffff800000108ece,%rax
ffff80000010938a:	80 ff ff 
ffff80000010938d:	ff d0                	callq  *%rax
ffff80000010938f:	c9                   	leaveq 
ffff800000109390:	c3                   	retq   

ffff800000109391 <__switch_to>:
ffff800000109391:	55                   	push   %rbp
ffff800000109392:	48 89 e5             	mov    %rsp,%rbp
ffff800000109395:	53                   	push   %rbx
ffff800000109396:	48 83 ec 18          	sub    $0x18,%rsp
ffff80000010939a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010939e:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001093a2:	48 ba 22 2a 11 00 00 	movabs $0xffff800000112a22,%rdx
ffff8000001093a9:	80 ff ff 
ffff8000001093ac:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001093b1:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001093b6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093bb:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001093c2:	80 ff ff 
ffff8000001093c5:	ff d1                	callq  *%rcx
ffff8000001093c7:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001093cb:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001093cf:	48 8b 00             	mov    (%rax),%rax
ffff8000001093d2:	48 ba 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rdx
ffff8000001093d9:	80 ff ff 
ffff8000001093dc:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff8000001093e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001093e4:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001093e8:	48 8b 00             	mov    (%rax),%rax
ffff8000001093eb:	48 89 c1             	mov    %rax,%rcx
ffff8000001093ee:	48 ba 35 2a 11 00 00 	movabs $0xffff800000112a35,%rdx
ffff8000001093f5:	80 ff ff 
ffff8000001093f8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001093fd:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109402:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109407:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010940e:	80 ff ff 
ffff800000109411:	41 ff d0             	callq  *%r8
ffff800000109414:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109418:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010941c:	48 8b 00             	mov    (%rax),%rax
ffff80000010941f:	48 89 c1             	mov    %rax,%rcx
ffff800000109422:	48 ba 51 2a 11 00 00 	movabs $0xffff800000112a51,%rdx
ffff800000109429:	80 ff ff 
ffff80000010942c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109431:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109436:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010943b:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000109442:	80 ff ff 
ffff800000109445:	41 ff d0             	callq  *%r8
ffff800000109448:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff80000010944f:	80 ff ff 
ffff800000109452:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff800000109456:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff80000010945d:	80 ff ff 
ffff800000109460:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff800000109464:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff80000010946b:	80 ff ff 
ffff80000010946e:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff800000109472:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff800000109479:	80 ff ff 
ffff80000010947c:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff800000109480:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff800000109487:	80 ff ff 
ffff80000010948a:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff80000010948e:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff800000109495:	80 ff ff 
ffff800000109498:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff80000010949c:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001094a3:	80 ff ff 
ffff8000001094a6:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff8000001094aa:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001094b1:	80 ff ff 
ffff8000001094b4:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff8000001094b8:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001094bf:	80 ff ff 
ffff8000001094c2:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff8000001094c6:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001094cd:	80 ff ff 
ffff8000001094d0:	48 8b 40 04          	mov    0x4(%rax),%rax
ffff8000001094d4:	41 52                	push   %r10
ffff8000001094d6:	41 51                	push   %r9
ffff8000001094d8:	41 50                	push   %r8
ffff8000001094da:	57                   	push   %rdi
ffff8000001094db:	49 89 d9             	mov    %rbx,%r9
ffff8000001094de:	4d 89 d8             	mov    %r11,%r8
ffff8000001094e1:	48 89 c7             	mov    %rax,%rdi
ffff8000001094e4:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff8000001094eb:	80 ff ff 
ffff8000001094ee:	ff d0                	callq  *%rax
ffff8000001094f0:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001094f4:	48 ba 6d 2a 11 00 00 	movabs $0xffff800000112a6d,%rdx
ffff8000001094fb:	80 ff ff 
ffff8000001094fe:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109503:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109508:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010950d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000109514:	80 ff ff 
ffff800000109517:	ff d1                	callq  *%rcx
ffff800000109519:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010951d:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109521:	48 8c e0             	mov    %fs,%rax
ffff800000109524:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff800000109528:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010952c:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109530:	48 8c e8             	mov    %gs,%rax
ffff800000109533:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109537:	48 ba 7e 2a 11 00 00 	movabs $0xffff800000112a7e,%rdx
ffff80000010953e:	80 ff ff 
ffff800000109541:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109546:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010954b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109550:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000109557:	80 ff ff 
ffff80000010955a:	ff d1                	callq  *%rcx
ffff80000010955c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109560:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109564:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109568:	48 89 c1             	mov    %rax,%rcx
ffff80000010956b:	48 ba 8f 2a 11 00 00 	movabs $0xffff800000112a8f,%rdx
ffff800000109572:	80 ff ff 
ffff800000109575:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010957a:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010957f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109584:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010958b:	80 ff ff 
ffff80000010958e:	41 ff d0             	callq  *%r8
ffff800000109591:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109595:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109599:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff80000010959d:	48 89 c1             	mov    %rax,%rcx
ffff8000001095a0:	48 ba a9 2a 11 00 00 	movabs $0xffff800000112aa9,%rdx
ffff8000001095a7:	80 ff ff 
ffff8000001095aa:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095af:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001095b4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095b9:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001095c0:	80 ff ff 
ffff8000001095c3:	41 ff d0             	callq  *%r8
ffff8000001095c6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095ca:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001095ce:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001095d2:	48 8e e0             	mov    %rax,%fs
ffff8000001095d5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095d9:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001095dd:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001095e1:	48 8e e8             	mov    %rax,%gs
ffff8000001095e4:	48 ba c3 2a 11 00 00 	movabs $0xffff800000112ac3,%rdx
ffff8000001095eb:	80 ff ff 
ffff8000001095ee:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095f3:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001095f8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095fd:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000109604:	80 ff ff 
ffff800000109607:	ff d1                	callq  *%rcx
ffff800000109609:	90                   	nop
ffff80000010960a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010960e:	c9                   	leaveq 
ffff80000010960f:	c3                   	retq   

ffff800000109610 <task_init>:
ffff800000109610:	55                   	push   %rbp
ffff800000109611:	48 89 e5             	mov    %rsp,%rbp
ffff800000109614:	41 56                	push   %r14
ffff800000109616:	41 55                	push   %r13
ffff800000109618:	41 54                	push   %r12
ffff80000010961a:	53                   	push   %rbx
ffff80000010961b:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010961f:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000109626:	00 
ffff800000109627:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff80000010962e:	80 ff ff 
ffff800000109631:	48 8b 00             	mov    (%rax),%rax
ffff800000109634:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010963b:	80 ff ff 
ffff80000010963e:	48 89 02             	mov    %rax,(%rdx)
ffff800000109641:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109648:	80 ff ff 
ffff80000010964b:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000109652:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109659:	80 ff ff 
ffff80000010965c:	48 89 42 08          	mov    %rax,0x8(%rdx)
ffff800000109660:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109667:	80 ff ff 
ffff80000010966a:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
ffff800000109671:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109678:	80 ff ff 
ffff80000010967b:	48 89 42 10          	mov    %rax,0x10(%rdx)
ffff80000010967f:	48 ba 60 99 10 00 00 	movabs $0xffff800000109960,%rdx
ffff800000109686:	80 ff ff 
ffff800000109689:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000109690:	80 ff ff 
ffff800000109693:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000109697:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010969e:	80 ff ff 
ffff8000001096a1:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
ffff8000001096a8:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff8000001096af:	80 ff ff 
ffff8000001096b2:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff8000001096b6:	48 ba c0 1a 11 00 00 	movabs $0xffff800000111ac0,%rdx
ffff8000001096bd:	80 ff ff 
ffff8000001096c0:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096c7:	80 ff ff 
ffff8000001096ca:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001096ce:	48 ba d7 2a 11 00 00 	movabs $0xffff800000112ad7,%rdx
ffff8000001096d5:	80 ff ff 
ffff8000001096d8:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096df:	80 ff ff 
ffff8000001096e2:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff8000001096e6:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096ed:	80 ff ff 
ffff8000001096f0:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff8000001096f7:	00 
ffff8000001096f8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001096ff:	80 ff ff 
ffff800000109702:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000109709:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109710:	80 ff ff 
ffff800000109713:	48 89 42 40          	mov    %rax,0x40(%rdx)
ffff800000109717:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff80000010971e:	80 ff ff 
ffff800000109721:	48 8b 00             	mov    (%rax),%rax
ffff800000109724:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010972b:	80 ff ff 
ffff80000010972e:	48 89 42 48          	mov    %rax,0x48(%rdx)
ffff800000109732:	be 08 00 00 00       	mov    $0x8,%esi
ffff800000109737:	bf 74 01 00 00       	mov    $0x174,%edi
ffff80000010973c:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff800000109743:	80 ff ff 
ffff800000109746:	ff d0                	callq  *%rax
ffff800000109748:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010974d:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000109754:	80 ff ff 
ffff800000109757:	ff d2                	callq  *%rdx
ffff800000109759:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010975d:	48 8b 00             	mov    (%rax),%rax
ffff800000109760:	48 89 c6             	mov    %rax,%rsi
ffff800000109763:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000109768:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff80000010976f:	80 ff ff 
ffff800000109772:	ff d0                	callq  *%rax
ffff800000109774:	48 b8 27 40 10 00 00 	movabs $0xffff800000104027,%rax
ffff80000010977b:	80 ff ff 
ffff80000010977e:	48 89 c6             	mov    %rax,%rsi
ffff800000109781:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109786:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff80000010978d:	80 ff ff 
ffff800000109790:	ff d0                	callq  *%rax
ffff800000109792:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff800000109799:	80 ff ff 
ffff80000010979c:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff8000001097a0:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097a7:	80 ff ff 
ffff8000001097aa:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff8000001097ae:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097b5:	80 ff ff 
ffff8000001097b8:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff8000001097bc:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097c3:	80 ff ff 
ffff8000001097c6:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff8000001097ca:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097d1:	80 ff ff 
ffff8000001097d4:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff8000001097d8:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097df:	80 ff ff 
ffff8000001097e2:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001097e6:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097ed:	80 ff ff 
ffff8000001097f0:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff8000001097f4:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff8000001097fb:	80 ff ff 
ffff8000001097fe:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff800000109802:	48 b8 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rax
ffff800000109809:	80 ff ff 
ffff80000010980c:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff800000109810:	48 b8 80 ba 10 00 00 	movabs $0xffff80000010ba80,%rax
ffff800000109817:	80 ff ff 
ffff80000010981a:	48 8b 00             	mov    (%rax),%rax
ffff80000010981d:	41 52                	push   %r10
ffff80000010981f:	41 51                	push   %r9
ffff800000109821:	41 50                	push   %r8
ffff800000109823:	57                   	push   %rdi
ffff800000109824:	49 89 d9             	mov    %rbx,%r9
ffff800000109827:	4d 89 d8             	mov    %r11,%r8
ffff80000010982a:	48 89 c7             	mov    %rax,%rdi
ffff80000010982d:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000109834:	80 ff ff 
ffff800000109837:	ff d0                	callq  *%rax
ffff800000109839:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010983d:	48 b8 80 ba 10 00 00 	movabs $0xffff80000010ba80,%rax
ffff800000109844:	80 ff ff 
ffff800000109847:	48 8b 00             	mov    (%rax),%rax
ffff80000010984a:	48 ba 00 bb 10 00 00 	movabs $0xffff80000010bb00,%rdx
ffff800000109851:	80 ff ff 
ffff800000109854:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000109858:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff80000010985f:	80 ff ff 
ffff800000109862:	48 b8 04 8a 10 00 00 	movabs $0xffff800000108a04,%rax
ffff800000109869:	80 ff ff 
ffff80000010986c:	ff d0                	callq  *%rax
ffff80000010986e:	ba 07 00 00 00       	mov    $0x7,%edx
ffff800000109873:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109878:	48 bf d8 8d 10 00 00 	movabs $0xffff800000108dd8,%rdi
ffff80000010987f:	80 ff ff 
ffff800000109882:	48 b8 dc 92 10 00 00 	movabs $0xffff8000001092dc,%rax
ffff800000109889:	80 ff ff 
ffff80000010988c:	ff d0                	callq  *%rax
ffff80000010988e:	48 b8 00 80 11 00 00 	movabs $0xffff800000118000,%rax
ffff800000109895:	80 ff ff 
ffff800000109898:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff80000010989f:	00 
ffff8000001098a0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098a5:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001098ac:	80 ff ff 
ffff8000001098af:	ff d2                	callq  *%rdx
ffff8000001098b1:	48 89 c7             	mov    %rax,%rdi
ffff8000001098b4:	48 b8 69 8a 10 00 00 	movabs $0xffff800000108a69,%rax
ffff8000001098bb:	80 ff ff 
ffff8000001098be:	ff d0                	callq  *%rax
ffff8000001098c0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001098c4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001098c8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001098cc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098d1:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001098d8:	80 ff ff 
ffff8000001098db:	ff d2                	callq  *%rdx
ffff8000001098dd:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001098e1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098e6:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001098ed:	80 ff ff 
ffff8000001098f0:	ff d2                	callq  *%rdx
ffff8000001098f2:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff8000001098f6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001098fa:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001098fe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109902:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109906:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010990b:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000109912:	80 ff ff 
ffff800000109915:	ff d2                	callq  *%rdx
ffff800000109917:	48 89 c2             	mov    %rax,%rdx
ffff80000010991a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010991e:	48 89 d7             	mov    %rdx,%rdi
ffff800000109921:	48 89 c6             	mov    %rax,%rsi
ffff800000109924:	55                   	push   %rbp
ffff800000109925:	50                   	push   %rax
ffff800000109926:	48 89 63 10          	mov    %rsp,0x10(%rbx)
ffff80000010992a:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff80000010992f:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff800000109943 <task_init+0x333>
ffff800000109936:	49 89 46 08          	mov    %rax,0x8(%r14)
ffff80000010993a:	41 ff 75 08          	pushq  0x8(%r13)
ffff80000010993e:	e9 4e fa ff ff       	jmpq   ffff800000109391 <__switch_to>
ffff800000109943:	58                   	pop    %rax
ffff800000109944:	5d                   	pop    %rbp
ffff800000109945:	90                   	nop
ffff800000109946:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
ffff80000010994a:	5b                   	pop    %rbx
ffff80000010994b:	41 5c                	pop    %r12
ffff80000010994d:	41 5d                	pop    %r13
ffff80000010994f:	41 5e                	pop    %r14
ffff800000109951:	5d                   	pop    %rbp
ffff800000109952:	c3                   	retq   

Disassembly of section .data:

ffff800000109960 <GDT_Table>:
	...
ffff80000010996c:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
ffff800000109972:	00 00                	add    %al,(%rax)
ffff800000109974:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
ffff80000010998a:	00 00                	add    %al,(%rax)
ffff80000010998c:	00 f8                	add    %bh,%al
ffff80000010998e:	20 00                	and    %al,(%rax)
ffff800000109990:	00 00                	add    %al,(%rax)
ffff800000109992:	00 00                	add    %al,(%rax)
ffff800000109994:	00 f2                	add    %dh,%dl
ffff800000109996:	00 00                	add    %al,(%rax)
ffff800000109998:	ff                   	(bad)  
ffff800000109999:	ff 00                	incl   (%rax)
ffff80000010999b:	00 00                	add    %al,(%rax)
ffff80000010999d:	9a                   	(bad)  
ffff80000010999e:	cf                   	iret   
ffff80000010999f:	00 ff                	add    %bh,%bh
ffff8000001099a1:	ff 00                	incl   (%rax)
ffff8000001099a3:	00 00                	add    %al,(%rax)
ffff8000001099a5:	92                   	xchg   %eax,%edx
ffff8000001099a6:	cf                   	iret   
	...

ffff8000001099f8 <GDT_END>:
ffff8000001099f8:	97                   	xchg   %eax,%edi
	...

ffff8000001099fa <GDT_BASE>:
ffff8000001099fa:	60                   	(bad)  
ffff8000001099fb:	99                   	cltd   
ffff8000001099fc:	10 00                	adc    %al,(%rax)
ffff8000001099fe:	00 80 ff ff      	add    %al,0xffff(%rax)

ffff800000109a02 <IDT_Table>:
	...

ffff80000010aa02 <IDT_END>:
ffff80000010aa02:	ff 0f                	decl   (%rdi)

ffff80000010aa04 <IDT_BASE>:
ffff80000010aa04:	02 9a 10 00 00 80    	add    -0x7ffffff0(%rdx),%bl
ffff80000010aa0a:	ff                   	(bad)  
ffff80000010aa0b:	ff                 	incl   (%rax)

ffff80000010aa0c <TSS64_Table>:
	...

ffff80000010aa74 <TSS64_END>:
ffff80000010aa74:	67 00            	add    %cl,(%edx,%ebp,4)

ffff80000010aa76 <TSS64_BASE>:
ffff80000010aa76:	0c aa                	or     $0xaa,%al
ffff80000010aa78:	10 00                	adc    %al,(%rax)
ffff80000010aa7a:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff80000010aa80 <font_ascii>:
	...
ffff80000010ac90:	00 10                	add    %dl,(%rax)
ffff80000010ac92:	10 10                	adc    %dl,(%rax)
ffff80000010ac94:	10 10                	adc    %dl,(%rax)
ffff80000010ac96:	10 10                	adc    %dl,(%rax)
ffff80000010ac98:	10 10                	adc    %dl,(%rax)
ffff80000010ac9a:	00 00                	add    %al,(%rax)
ffff80000010ac9c:	10 10                	adc    %dl,(%rax)
ffff80000010ac9e:	00 00                	add    %al,(%rax)
ffff80000010aca0:	28 28                	sub    %ch,(%rax)
ffff80000010aca2:	28 00                	sub    %al,(%rax)
	...
ffff80000010acb0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010acb4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010acb8:	44                   	rex.R
ffff80000010acb9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010acbe:	00 00                	add    %al,(%rax)
ffff80000010acc0:	10 3a                	adc    %bh,(%rdx)
ffff80000010acc2:	56                   	push   %rsi
ffff80000010acc3:	92                   	xchg   %eax,%edx
ffff80000010acc4:	92                   	xchg   %eax,%edx
ffff80000010acc5:	90                   	nop
ffff80000010acc6:	50                   	push   %rax
ffff80000010acc7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010acca:	92                   	xchg   %eax,%edx
ffff80000010accb:	92                   	xchg   %eax,%edx
ffff80000010accc:	d4                   	(bad)  
ffff80000010accd:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010acd2:	94                   	xchg   %eax,%esp
ffff80000010acd3:	94                   	xchg   %eax,%esp
ffff80000010acd4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010acd9:	2c 52                	sub    $0x52,%al
ffff80000010acdb:	52                   	push   %rdx
ffff80000010acdc:	92                   	xchg   %eax,%edx
ffff80000010acdd:	8c 00                	mov    %es,(%rax)
ffff80000010acdf:	00 00                	add    %al,(%rax)
ffff80000010ace1:	70 88                	jo     ffff80000010ac6b <font_ascii+0x1eb>
ffff80000010ace3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010ace9:	92                   	xchg   %eax,%edx
ffff80000010acea:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010acf1:	08 10                	or     %dl,(%rax)
	...
ffff80000010acff:	00 02                	add    %al,(%rdx)
ffff80000010ad01:	04 08                	add    $0x8,%al
ffff80000010ad03:	08 10                	or     %dl,(%rax)
ffff80000010ad05:	10 10                	adc    %dl,(%rax)
ffff80000010ad07:	10 10                	adc    %dl,(%rax)
ffff80000010ad09:	10 10                	adc    %dl,(%rax)
ffff80000010ad0b:	08 08                	or     %cl,(%rax)
ffff80000010ad0d:	04 02                	add    $0x2,%al
ffff80000010ad0f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010ad15:	10 10                	adc    %dl,(%rax)
ffff80000010ad17:	10 10                	adc    %dl,(%rax)
ffff80000010ad19:	10 10                	adc    %dl,(%rax)
ffff80000010ad1b:	20 20                	and    %ah,(%rax)
ffff80000010ad1d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ad21:	00 00                	add    %al,(%rax)
ffff80000010ad23:	00 00                	add    %al,(%rax)
ffff80000010ad25:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010ad2b:	10 00                	adc    %al,(%rax)
	...
ffff80000010ad35:	10 10                	adc    %dl,(%rax)
ffff80000010ad37:	10 fe                	adc    %bh,%dh
ffff80000010ad39:	10 10                	adc    %dl,(%rax)
ffff80000010ad3b:	10 00                	adc    %al,(%rax)
	...
ffff80000010ad49:	00 00                	add    %al,(%rax)
ffff80000010ad4b:	18 18                	sbb    %bl,(%rax)
ffff80000010ad4d:	08 08                	or     %cl,(%rax)
ffff80000010ad4f:	10 00                	adc    %al,(%rax)
ffff80000010ad51:	00 00                	add    %al,(%rax)
ffff80000010ad53:	00 00                	add    %al,(%rax)
ffff80000010ad55:	00 00                	add    %al,(%rax)
ffff80000010ad57:	00 fe                	add    %bh,%dh
	...
ffff80000010ad69:	00 00                	add    %al,(%rax)
ffff80000010ad6b:	00 18                	add    %bl,(%rax)
ffff80000010ad6d:	18 00                	sbb    %al,(%rax)
ffff80000010ad6f:	00 02                	add    %al,(%rdx)
ffff80000010ad71:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010ad74:	08 08                	or     %cl,(%rax)
ffff80000010ad76:	08 10                	or     %dl,(%rax)
ffff80000010ad78:	10 20                	adc    %ah,(%rax)
ffff80000010ad7a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ad7d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010ad84:	42 
ffff80000010ad85:	42                   	rex.X
ffff80000010ad86:	42                   	rex.X
ffff80000010ad87:	42                   	rex.X
ffff80000010ad88:	42                   	rex.X
ffff80000010ad89:	42                   	rex.X
ffff80000010ad8a:	42 24 24             	rex.X and $0x24,%al
ffff80000010ad8d:	18 00                	sbb    %al,(%rax)
ffff80000010ad8f:	00 00                	add    %al,(%rax)
ffff80000010ad91:	08 18                	or     %bl,(%rax)
ffff80000010ad93:	28 08                	sub    %cl,(%rax)
ffff80000010ad95:	08 08                	or     %cl,(%rax)
ffff80000010ad97:	08 08                	or     %cl,(%rax)
ffff80000010ad99:	08 08                	or     %cl,(%rax)
ffff80000010ad9b:	08 08                	or     %cl,(%rax)
ffff80000010ad9d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010ada0:	00 18                	add    %bl,(%rax)
ffff80000010ada2:	24 42                	and    $0x42,%al
ffff80000010ada4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010ada8:	10 20                	adc    %ah,(%rax)
ffff80000010adaa:	20 40 40             	and    %al,0x40(%rax)
ffff80000010adad:	7e 00                	jle    ffff80000010adaf <font_ascii+0x32f>
ffff80000010adaf:	00 00                	add    %al,(%rax)
ffff80000010adb1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010adb4:	02 02                	add    (%rdx),%al
ffff80000010adb6:	04 18                	add    $0x18,%al
ffff80000010adb8:	04 02                	add    $0x2,%al
ffff80000010adba:	02 42 24             	add    0x24(%rdx),%al
ffff80000010adbd:	18 00                	sbb    %al,(%rax)
ffff80000010adbf:	00 00                	add    %al,(%rax)
ffff80000010adc1:	0c 0c                	or     $0xc,%al
ffff80000010adc3:	0c 14                	or     $0x14,%al
ffff80000010adc5:	14 14                	adc    $0x14,%al
ffff80000010adc7:	24 24                	and    $0x24,%al
ffff80000010adc9:	44 7e 04             	rex.R jle ffff80000010add0 <font_ascii+0x350>
ffff80000010adcc:	04 1e                	add    $0x1e,%al
ffff80000010adce:	00 00                	add    %al,(%rax)
ffff80000010add0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010add4:	40 58                	rex pop %rax
ffff80000010add6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010add9:	02 02                	add    (%rdx),%al
ffff80000010addb:	42 24 18             	rex.X and $0x18,%al
ffff80000010adde:	00 00                	add    %al,(%rax)
ffff80000010ade0:	00 18                	add    %bl,(%rax)
ffff80000010ade2:	24 42                	and    $0x42,%al
ffff80000010ade4:	40 58                	rex pop %rax
ffff80000010ade6:	64 42                	fs rex.X
ffff80000010ade8:	42                   	rex.X
ffff80000010ade9:	42                   	rex.X
ffff80000010adea:	42                   	rex.X
ffff80000010adeb:	42 24 18             	rex.X and $0x18,%al
ffff80000010adee:	00 00                	add    %al,(%rax)
ffff80000010adf0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010adf3:	42 04 04             	rex.X add $0x4,%al
ffff80000010adf6:	08 08                	or     %cl,(%rax)
ffff80000010adf8:	08 10                	or     %dl,(%rax)
ffff80000010adfa:	10 10                	adc    %dl,(%rax)
ffff80000010adfc:	10 38                	adc    %bh,(%rax)
ffff80000010adfe:	00 00                	add    %al,(%rax)
ffff80000010ae00:	00 18                	add    %bl,(%rax)
ffff80000010ae02:	24 42                	and    $0x42,%al
ffff80000010ae04:	42                   	rex.X
ffff80000010ae05:	42 24 18             	rex.X and $0x18,%al
ffff80000010ae08:	24 42                	and    $0x42,%al
ffff80000010ae0a:	42                   	rex.X
ffff80000010ae0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ae0e:	00 00                	add    %al,(%rax)
ffff80000010ae10:	00 18                	add    %bl,(%rax)
ffff80000010ae12:	24 42                	and    $0x42,%al
ffff80000010ae14:	42                   	rex.X
ffff80000010ae15:	42                   	rex.X
ffff80000010ae16:	42                   	rex.X
ffff80000010ae17:	42                   	rex.X
ffff80000010ae18:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010ae1b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ae1e:	00 00                	add    %al,(%rax)
ffff80000010ae20:	00 00                	add    %al,(%rax)
ffff80000010ae22:	00 00                	add    %al,(%rax)
ffff80000010ae24:	00 18                	add    %bl,(%rax)
ffff80000010ae26:	18 00                	sbb    %al,(%rax)
ffff80000010ae28:	00 00                	add    %al,(%rax)
ffff80000010ae2a:	00 00                	add    %al,(%rax)
ffff80000010ae2c:	18 18                	sbb    %bl,(%rax)
ffff80000010ae2e:	00 00                	add    %al,(%rax)
ffff80000010ae30:	00 00                	add    %al,(%rax)
ffff80000010ae32:	00 00                	add    %al,(%rax)
ffff80000010ae34:	00 18                	add    %bl,(%rax)
ffff80000010ae36:	18 00                	sbb    %al,(%rax)
ffff80000010ae38:	00 00                	add    %al,(%rax)
ffff80000010ae3a:	00 18                	add    %bl,(%rax)
ffff80000010ae3c:	18 08                	sbb    %cl,(%rax)
ffff80000010ae3e:	08 10                	or     %dl,(%rax)
ffff80000010ae40:	00 02                	add    %al,(%rdx)
ffff80000010ae42:	04 08                	add    $0x8,%al
ffff80000010ae44:	10 20                	adc    %ah,(%rax)
ffff80000010ae46:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ae4d:	04 
ffff80000010ae4e:	02 00                	add    (%rax),%al
ffff80000010ae50:	00 00                	add    %al,(%rax)
ffff80000010ae52:	00 00                	add    %al,(%rax)
ffff80000010ae54:	00 00                	add    %al,(%rax)
ffff80000010ae56:	fe 00                	incb   (%rax)
ffff80000010ae58:	00 fe                	add    %bh,%dh
ffff80000010ae5a:	00 00                	add    %al,(%rax)
ffff80000010ae5c:	00 00                	add    %al,(%rax)
ffff80000010ae5e:	00 00                	add    %al,(%rax)
ffff80000010ae60:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ae66:	04 02                	add    $0x2,%al
ffff80000010ae68:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ae6b:	10 20                	adc    %ah,(%rax)
ffff80000010ae6d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ae71:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ae75:	82                   	(bad)  
ffff80000010ae76:	04 08                	add    $0x8,%al
ffff80000010ae78:	10 10                	adc    %dl,(%rax)
ffff80000010ae7a:	00 00                	add    %al,(%rax)
ffff80000010ae7c:	18 18                	sbb    %bl,(%rax)
ffff80000010ae7e:	00 00                	add    %al,(%rax)
ffff80000010ae80:	00 38                	add    %bh,(%rax)
ffff80000010ae82:	44 82                	rex.R (bad) 
ffff80000010ae84:	9a                   	(bad)  
ffff80000010ae85:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ae86:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ae87:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ae88:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ae89:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ae8a:	9c                   	pushfq 
ffff80000010ae8b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010ae8f:	00 00                	add    %al,(%rax)
ffff80000010ae91:	18 18                	sbb    %bl,(%rax)
ffff80000010ae93:	18 18                	sbb    %bl,(%rax)
ffff80000010ae95:	24 24                	and    $0x24,%al
ffff80000010ae97:	24 24                	and    $0x24,%al
ffff80000010ae99:	7e 42                	jle    ffff80000010aedd <font_ascii+0x45d>
ffff80000010ae9b:	42                   	rex.X
ffff80000010ae9c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae9f:	00 00                	add    %al,(%rax)
ffff80000010aea1:	f0 48                	lock rex.W
ffff80000010aea3:	44                   	rex.R
ffff80000010aea4:	44                   	rex.R
ffff80000010aea5:	44                   	rex.R
ffff80000010aea6:	48 78 44             	rex.W js ffff80000010aeed <font_ascii+0x46d>
ffff80000010aea9:	42                   	rex.X
ffff80000010aeaa:	42                   	rex.X
ffff80000010aeab:	42                   	rex.X
ffff80000010aeac:	44 f8                	rex.R clc 
ffff80000010aeae:	00 00                	add    %al,(%rax)
ffff80000010aeb0:	00 3a                	add    %bh,(%rdx)
ffff80000010aeb2:	46                   	rex.RX
ffff80000010aeb3:	42 82                	rex.X (bad) 
ffff80000010aeb5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010aebc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010aebf:	00 00                	add    %al,(%rax)
ffff80000010aec1:	f8                   	clc    
ffff80000010aec2:	44                   	rex.R
ffff80000010aec3:	44                   	rex.R
ffff80000010aec4:	42                   	rex.X
ffff80000010aec5:	42                   	rex.X
ffff80000010aec6:	42                   	rex.X
ffff80000010aec7:	42                   	rex.X
ffff80000010aec8:	42                   	rex.X
ffff80000010aec9:	42                   	rex.X
ffff80000010aeca:	42                   	rex.X
ffff80000010aecb:	44                   	rex.R
ffff80000010aecc:	44 f8                	rex.R clc 
ffff80000010aece:	00 00                	add    %al,(%rax)
ffff80000010aed0:	00 fe                	add    %bh,%dh
ffff80000010aed2:	42                   	rex.X
ffff80000010aed3:	42                   	rex.X
ffff80000010aed4:	40                   	rex
ffff80000010aed5:	40                   	rex
ffff80000010aed6:	44 7c 44             	rex.R jl ffff80000010af1d <font_ascii+0x49d>
ffff80000010aed9:	40                   	rex
ffff80000010aeda:	40                   	rex
ffff80000010aedb:	42                   	rex.X
ffff80000010aedc:	42 fe 00             	rex.X incb (%rax)
ffff80000010aedf:	00 00                	add    %al,(%rax)
ffff80000010aee1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010aee4:	40                   	rex
ffff80000010aee5:	40                   	rex
ffff80000010aee6:	44 7c 44             	rex.R jl ffff80000010af2d <font_ascii+0x4ad>
ffff80000010aee9:	44                   	rex.R
ffff80000010aeea:	40                   	rex
ffff80000010aeeb:	40                   	rex
ffff80000010aeec:	40                   	rex
ffff80000010aeed:	f0 00 00             	lock add %al,(%rax)
ffff80000010aef0:	00 3a                	add    %bh,(%rdx)
ffff80000010aef2:	46                   	rex.RX
ffff80000010aef3:	42 82                	rex.X (bad) 
ffff80000010aef5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010aefc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010aeff:	00 00                	add    %al,(%rax)
ffff80000010af01:	e7 42                	out    %eax,$0x42
ffff80000010af03:	42                   	rex.X
ffff80000010af04:	42                   	rex.X
ffff80000010af05:	42                   	rex.X
ffff80000010af06:	42 7e 42             	rex.X jle ffff80000010af4b <font_ascii+0x4cb>
ffff80000010af09:	42                   	rex.X
ffff80000010af0a:	42                   	rex.X
ffff80000010af0b:	42                   	rex.X
ffff80000010af0c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010af0f:	00 00                	add    %al,(%rax)
ffff80000010af11:	7c 10                	jl     ffff80000010af23 <font_ascii+0x4a3>
ffff80000010af13:	10 10                	adc    %dl,(%rax)
ffff80000010af15:	10 10                	adc    %dl,(%rax)
ffff80000010af17:	10 10                	adc    %dl,(%rax)
ffff80000010af19:	10 10                	adc    %dl,(%rax)
ffff80000010af1b:	10 10                	adc    %dl,(%rax)
ffff80000010af1d:	7c 00                	jl     ffff80000010af1f <font_ascii+0x49f>
ffff80000010af1f:	00 00                	add    %al,(%rax)
ffff80000010af21:	1f                   	(bad)  
ffff80000010af22:	04 04                	add    $0x4,%al
ffff80000010af24:	04 04                	add    $0x4,%al
ffff80000010af26:	04 04                	add    $0x4,%al
ffff80000010af28:	04 04                	add    $0x4,%al
ffff80000010af2a:	04 04                	add    $0x4,%al
ffff80000010af2c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010af2f:	00 00                	add    %al,(%rax)
ffff80000010af31:	e7 42                	out    %eax,$0x42
ffff80000010af33:	44                   	rex.R
ffff80000010af34:	48 50                	rex.W push %rax
ffff80000010af36:	50                   	push   %rax
ffff80000010af37:	60                   	(bad)  
ffff80000010af38:	50                   	push   %rax
ffff80000010af39:	50                   	push   %rax
ffff80000010af3a:	48                   	rex.W
ffff80000010af3b:	44                   	rex.R
ffff80000010af3c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010af3f:	00 00                	add    %al,(%rax)
ffff80000010af41:	f0 40                	lock rex
ffff80000010af43:	40                   	rex
ffff80000010af44:	40                   	rex
ffff80000010af45:	40                   	rex
ffff80000010af46:	40                   	rex
ffff80000010af47:	40                   	rex
ffff80000010af48:	40                   	rex
ffff80000010af49:	40                   	rex
ffff80000010af4a:	40                   	rex
ffff80000010af4b:	42                   	rex.X
ffff80000010af4c:	42 fe 00             	rex.X incb (%rax)
ffff80000010af4f:	00 00                	add    %al,(%rax)
ffff80000010af51:	c3                   	retq   
ffff80000010af52:	42                   	rex.X
ffff80000010af53:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010af57:	5a                   	pop    %rdx
ffff80000010af58:	5a                   	pop    %rdx
ffff80000010af59:	42                   	rex.X
ffff80000010af5a:	42                   	rex.X
ffff80000010af5b:	42                   	rex.X
ffff80000010af5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010af5f:	00 00                	add    %al,(%rax)
ffff80000010af61:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010af68:	4a                   	rex.WX
ffff80000010af69:	4a                   	rex.WX
ffff80000010af6a:	4a                   	rex.WX
ffff80000010af6b:	46                   	rex.RX
ffff80000010af6c:	46 e2 00             	rex.RX loop ffff80000010af6f <font_ascii+0x4ef>
ffff80000010af6f:	00 00                	add    %al,(%rax)
ffff80000010af71:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010af75:	82                   	(bad)  
ffff80000010af76:	82                   	(bad)  
ffff80000010af77:	82                   	(bad)  
ffff80000010af78:	82                   	(bad)  
ffff80000010af79:	82                   	(bad)  
ffff80000010af7a:	82                   	(bad)  
ffff80000010af7b:	82                   	(bad)  
ffff80000010af7c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010af7f:	00 00                	add    %al,(%rax)
ffff80000010af81:	f8                   	clc    
ffff80000010af82:	44                   	rex.R
ffff80000010af83:	42                   	rex.X
ffff80000010af84:	42                   	rex.X
ffff80000010af85:	42                   	rex.X
ffff80000010af86:	44 78 40             	rex.R js ffff80000010afc9 <font_ascii+0x549>
ffff80000010af89:	40                   	rex
ffff80000010af8a:	40                   	rex
ffff80000010af8b:	40                   	rex
ffff80000010af8c:	40                   	rex
ffff80000010af8d:	f0 00 00             	lock add %al,(%rax)
ffff80000010af90:	00 38                	add    %bh,(%rax)
ffff80000010af92:	44 82                	rex.R (bad) 
ffff80000010af94:	82                   	(bad)  
ffff80000010af95:	82                   	(bad)  
ffff80000010af96:	82                   	(bad)  
ffff80000010af97:	82                   	(bad)  
ffff80000010af98:	82                   	(bad)  
ffff80000010af99:	82                   	(bad)  
ffff80000010af9a:	92                   	xchg   %eax,%edx
ffff80000010af9b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010af9f:	00 00                	add    %al,(%rax)
ffff80000010afa1:	fc                   	cld    
ffff80000010afa2:	42                   	rex.X
ffff80000010afa3:	42                   	rex.X
ffff80000010afa4:	42                   	rex.X
ffff80000010afa5:	42 7c 44             	rex.X jl ffff80000010afec <font_ascii+0x56c>
ffff80000010afa8:	42                   	rex.X
ffff80000010afa9:	42                   	rex.X
ffff80000010afaa:	42                   	rex.X
ffff80000010afab:	42                   	rex.X
ffff80000010afac:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010afaf:	00 00                	add    %al,(%rax)
ffff80000010afb1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010afb4:	82                   	(bad)  
ffff80000010afb5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010afb9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010afbf:	00 00                	add    %al,(%rax)
ffff80000010afc1:	fe                   	(bad)  
ffff80000010afc2:	92                   	xchg   %eax,%edx
ffff80000010afc3:	92                   	xchg   %eax,%edx
ffff80000010afc4:	10 10                	adc    %dl,(%rax)
ffff80000010afc6:	10 10                	adc    %dl,(%rax)
ffff80000010afc8:	10 10                	adc    %dl,(%rax)
ffff80000010afca:	10 10                	adc    %dl,(%rax)
ffff80000010afcc:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010afd0:	00 e7                	add    %ah,%bh
ffff80000010afd2:	42                   	rex.X
ffff80000010afd3:	42                   	rex.X
ffff80000010afd4:	42                   	rex.X
ffff80000010afd5:	42                   	rex.X
ffff80000010afd6:	42                   	rex.X
ffff80000010afd7:	42                   	rex.X
ffff80000010afd8:	42                   	rex.X
ffff80000010afd9:	42                   	rex.X
ffff80000010afda:	42                   	rex.X
ffff80000010afdb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010afde:	00 00                	add    %al,(%rax)
ffff80000010afe0:	00 e7                	add    %ah,%bh
ffff80000010afe2:	42                   	rex.X
ffff80000010afe3:	42                   	rex.X
ffff80000010afe4:	42                   	rex.X
ffff80000010afe5:	42 24 24             	rex.X and $0x24,%al
ffff80000010afe8:	24 24                	and    $0x24,%al
ffff80000010afea:	18 18                	sbb    %bl,(%rax)
ffff80000010afec:	18 18                	sbb    %bl,(%rax)
ffff80000010afee:	00 00                	add    %al,(%rax)
ffff80000010aff0:	00 e7                	add    %ah,%bh
ffff80000010aff2:	42                   	rex.X
ffff80000010aff3:	42                   	rex.X
ffff80000010aff4:	42 5a                	rex.X pop %rdx
ffff80000010aff6:	5a                   	pop    %rdx
ffff80000010aff7:	5a                   	pop    %rdx
ffff80000010aff8:	5a                   	pop    %rdx
ffff80000010aff9:	24 24                	and    $0x24,%al
ffff80000010affb:	24 24                	and    $0x24,%al
ffff80000010affd:	24 00                	and    $0x0,%al
ffff80000010afff:	00 00                	add    %al,(%rax)
ffff80000010b001:	e7 42                	out    %eax,$0x42
ffff80000010b003:	42 24 24             	rex.X and $0x24,%al
ffff80000010b006:	24 18                	and    $0x18,%al
ffff80000010b008:	24 24                	and    $0x24,%al
ffff80000010b00a:	24 42                	and    $0x42,%al
ffff80000010b00c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b00f:	00 00                	add    %al,(%rax)
ffff80000010b011:	ee                   	out    %al,(%dx)
ffff80000010b012:	44                   	rex.R
ffff80000010b013:	44                   	rex.R
ffff80000010b014:	44 28 28             	sub    %r13b,(%rax)
ffff80000010b017:	28 10                	sub    %dl,(%rax)
ffff80000010b019:	10 10                	adc    %dl,(%rax)
ffff80000010b01b:	10 10                	adc    %dl,(%rax)
ffff80000010b01d:	7c 00                	jl     ffff80000010b01f <font_ascii+0x59f>
ffff80000010b01f:	00 00                	add    %al,(%rax)
ffff80000010b021:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010b028:	20 20                	and    %ah,(%rax)
ffff80000010b02a:	40                   	rex
ffff80000010b02b:	42 82                	rex.X (bad) 
ffff80000010b02d:	fe 00                	incb   (%rax)
ffff80000010b02f:	00 00                	add    %al,(%rax)
ffff80000010b031:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010b034:	20 20                	and    %ah,(%rax)
ffff80000010b036:	20 20                	and    %ah,(%rax)
ffff80000010b038:	20 20                	and    %ah,(%rax)
ffff80000010b03a:	20 20                	and    %ah,(%rax)
ffff80000010b03c:	20 20                	and    %ah,(%rax)
ffff80000010b03e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010b045:	20 20                	and    %ah,(%rax)
ffff80000010b047:	10 10                	adc    %dl,(%rax)
ffff80000010b049:	08 08                	or     %cl,(%rax)
ffff80000010b04b:	04 04                	add    $0x4,%al
ffff80000010b04d:	04 02                	add    $0x2,%al
ffff80000010b04f:	02 00                	add    (%rax),%al
ffff80000010b051:	7c 04                	jl     ffff80000010b057 <font_ascii+0x5d7>
ffff80000010b053:	04 04                	add    $0x4,%al
ffff80000010b055:	04 04                	add    $0x4,%al
ffff80000010b057:	04 04                	add    $0x4,%al
ffff80000010b059:	04 04                	add    $0x4,%al
ffff80000010b05b:	04 04                	add    $0x4,%al
ffff80000010b05d:	04 7c                	add    $0x7c,%al
ffff80000010b05f:	00 00                	add    %al,(%rax)
ffff80000010b061:	10 28                	adc    %ch,(%rax)
ffff80000010b063:	44 82                	rex.R (bad) 
	...
ffff80000010b07d:	00 fe                	add    %bh,%dh
ffff80000010b07f:	00 10                	add    %dl,(%rax)
ffff80000010b081:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010b094:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010b097:	04 3c                	add    $0x3c,%al
ffff80000010b099:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010b0a0:	c0 
ffff80000010b0a1:	40                   	rex
ffff80000010b0a2:	40                   	rex
ffff80000010b0a3:	40                   	rex
ffff80000010b0a4:	40 58                	rex pop %rax
ffff80000010b0a6:	64 42                	fs rex.X
ffff80000010b0a8:	42                   	rex.X
ffff80000010b0a9:	42                   	rex.X
ffff80000010b0aa:	42                   	rex.X
ffff80000010b0ab:	42                   	rex.X
ffff80000010b0ac:	64 58                	fs pop %rax
ffff80000010b0ae:	00 00                	add    %al,(%rax)
ffff80000010b0b0:	00 00                	add    %al,(%rax)
ffff80000010b0b2:	00 00                	add    %al,(%rax)
ffff80000010b0b4:	00 30                	add    %dh,(%rax)
ffff80000010b0b6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010b0bd:	38 
ffff80000010b0be:	00 00                	add    %al,(%rax)
ffff80000010b0c0:	0c 04                	or     $0x4,%al
ffff80000010b0c2:	04 04                	add    $0x4,%al
ffff80000010b0c4:	04 34                	add    $0x34,%al
ffff80000010b0c6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010b0cd:	36 
ffff80000010b0ce:	00 00                	add    %al,(%rax)
ffff80000010b0d0:	00 00                	add    %al,(%rax)
ffff80000010b0d2:	00 00                	add    %al,(%rax)
ffff80000010b0d4:	00 38                	add    %bh,(%rax)
ffff80000010b0d6:	44 82                	rex.R (bad) 
ffff80000010b0d8:	82                   	(bad)  
ffff80000010b0d9:	fc                   	cld    
ffff80000010b0da:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010b0e1:	10 10                	adc    %dl,(%rax)
ffff80000010b0e3:	10 10                	adc    %dl,(%rax)
ffff80000010b0e5:	7c 10                	jl     ffff80000010b0f7 <font_ascii+0x677>
ffff80000010b0e7:	10 10                	adc    %dl,(%rax)
ffff80000010b0e9:	10 10                	adc    %dl,(%rax)
ffff80000010b0eb:	10 10                	adc    %dl,(%rax)
ffff80000010b0ed:	7c 00                	jl     ffff80000010b0ef <font_ascii+0x66f>
ffff80000010b0ef:	00 00                	add    %al,(%rax)
ffff80000010b0f1:	00 00                	add    %al,(%rax)
ffff80000010b0f3:	00 00                	add    %al,(%rax)
ffff80000010b0f5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010b0fc:	34 04 
ffff80000010b0fe:	04 38                	add    $0x38,%al
ffff80000010b100:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010b104:	40 58                	rex pop %rax
ffff80000010b106:	64 42                	fs rex.X
ffff80000010b108:	42                   	rex.X
ffff80000010b109:	42                   	rex.X
ffff80000010b10a:	42                   	rex.X
ffff80000010b10b:	42                   	rex.X
ffff80000010b10c:	42 e3 00             	rex.X jrcxz ffff80000010b10f <font_ascii+0x68f>
ffff80000010b10f:	00 00                	add    %al,(%rax)
ffff80000010b111:	10 10                	adc    %dl,(%rax)
ffff80000010b113:	00 00                	add    %al,(%rax)
ffff80000010b115:	30 10                	xor    %dl,(%rax)
ffff80000010b117:	10 10                	adc    %dl,(%rax)
ffff80000010b119:	10 10                	adc    %dl,(%rax)
ffff80000010b11b:	10 10                	adc    %dl,(%rax)
ffff80000010b11d:	38 00                	cmp    %al,(%rax)
ffff80000010b11f:	00 00                	add    %al,(%rax)
ffff80000010b121:	04 04                	add    $0x4,%al
ffff80000010b123:	00 00                	add    %al,(%rax)
ffff80000010b125:	0c 04                	or     $0x4,%al
ffff80000010b127:	04 04                	add    $0x4,%al
ffff80000010b129:	04 04                	add    $0x4,%al
ffff80000010b12b:	04 04                	add    $0x4,%al
ffff80000010b12d:	08 08                	or     %cl,(%rax)
ffff80000010b12f:	30 c0                	xor    %al,%al
ffff80000010b131:	40                   	rex
ffff80000010b132:	40                   	rex
ffff80000010b133:	40                   	rex
ffff80000010b134:	40                   	rex
ffff80000010b135:	4e                   	rex.WRX
ffff80000010b136:	44                   	rex.R
ffff80000010b137:	48 50                	rex.W push %rax
ffff80000010b139:	60                   	(bad)  
ffff80000010b13a:	50                   	push   %rax
ffff80000010b13b:	48                   	rex.W
ffff80000010b13c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010b13f:	00 30                	add    %dh,(%rax)
ffff80000010b141:	10 10                	adc    %dl,(%rax)
ffff80000010b143:	10 10                	adc    %dl,(%rax)
ffff80000010b145:	10 10                	adc    %dl,(%rax)
ffff80000010b147:	10 10                	adc    %dl,(%rax)
ffff80000010b149:	10 10                	adc    %dl,(%rax)
ffff80000010b14b:	10 10                	adc    %dl,(%rax)
ffff80000010b14d:	38 00                	cmp    %al,(%rax)
ffff80000010b14f:	00 00                	add    %al,(%rax)
ffff80000010b151:	00 00                	add    %al,(%rax)
ffff80000010b153:	00 00                	add    %al,(%rax)
ffff80000010b155:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b159:	49                   	rex.WB
ffff80000010b15a:	49                   	rex.WB
ffff80000010b15b:	49                   	rex.WB
ffff80000010b15c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b15f:	00 00                	add    %al,(%rax)
ffff80000010b161:	00 00                	add    %al,(%rax)
ffff80000010b163:	00 00                	add    %al,(%rax)
ffff80000010b165:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b169:	42                   	rex.X
ffff80000010b16a:	42                   	rex.X
ffff80000010b16b:	42                   	rex.X
ffff80000010b16c:	42 e3 00             	rex.X jrcxz ffff80000010b16f <font_ascii+0x6ef>
ffff80000010b16f:	00 00                	add    %al,(%rax)
ffff80000010b171:	00 00                	add    %al,(%rax)
ffff80000010b173:	00 00                	add    %al,(%rax)
ffff80000010b175:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b179:	82                   	(bad)  
ffff80000010b17a:	82                   	(bad)  
ffff80000010b17b:	82                   	(bad)  
ffff80000010b17c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b17f:	00 00                	add    %al,(%rax)
ffff80000010b181:	00 00                	add    %al,(%rax)
ffff80000010b183:	00 d8                	add    %bl,%al
ffff80000010b185:	64 42                	fs rex.X
ffff80000010b187:	42                   	rex.X
ffff80000010b188:	42                   	rex.X
ffff80000010b189:	42                   	rex.X
ffff80000010b18a:	42                   	rex.X
ffff80000010b18b:	64 58                	fs pop %rax
ffff80000010b18d:	40                   	rex
ffff80000010b18e:	40 e0 00             	rex loopne ffff80000010b191 <font_ascii+0x711>
ffff80000010b191:	00 00                	add    %al,(%rax)
ffff80000010b193:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b196:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b19d:	04 04                	add    $0x4,%al
ffff80000010b19f:	0e                   	(bad)  
ffff80000010b1a0:	00 00                	add    %al,(%rax)
ffff80000010b1a2:	00 00                	add    %al,(%rax)
ffff80000010b1a4:	00 dc                	add    %bl,%ah
ffff80000010b1a6:	62 42                	(bad)  
ffff80000010b1a8:	40                   	rex
ffff80000010b1a9:	40                   	rex
ffff80000010b1aa:	40                   	rex
ffff80000010b1ab:	40                   	rex
ffff80000010b1ac:	40 e0 00             	rex loopne ffff80000010b1af <font_ascii+0x72f>
ffff80000010b1af:	00 00                	add    %al,(%rax)
ffff80000010b1b1:	00 00                	add    %al,(%rax)
ffff80000010b1b3:	00 00                	add    %al,(%rax)
ffff80000010b1b5:	7a 86                	jp     ffff80000010b13d <font_ascii+0x6bd>
ffff80000010b1b7:	82                   	(bad)  
ffff80000010b1b8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b1bb:	82                   	(bad)  
ffff80000010b1bc:	c2 bc 00             	retq   $0xbc
ffff80000010b1bf:	00 00                	add    %al,(%rax)
ffff80000010b1c1:	00 10                	add    %dl,(%rax)
ffff80000010b1c3:	10 10                	adc    %dl,(%rax)
ffff80000010b1c5:	7c 10                	jl     ffff80000010b1d7 <font_ascii+0x757>
ffff80000010b1c7:	10 10                	adc    %dl,(%rax)
ffff80000010b1c9:	10 10                	adc    %dl,(%rax)
ffff80000010b1cb:	10 10                	adc    %dl,(%rax)
ffff80000010b1cd:	0e                   	(bad)  
ffff80000010b1ce:	00 00                	add    %al,(%rax)
ffff80000010b1d0:	00 00                	add    %al,(%rax)
ffff80000010b1d2:	00 00                	add    %al,(%rax)
ffff80000010b1d4:	00 c6                	add    %al,%dh
ffff80000010b1d6:	42                   	rex.X
ffff80000010b1d7:	42                   	rex.X
ffff80000010b1d8:	42                   	rex.X
ffff80000010b1d9:	42                   	rex.X
ffff80000010b1da:	42                   	rex.X
ffff80000010b1db:	42                   	rex.X
ffff80000010b1dc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b1df:	00 00                	add    %al,(%rax)
ffff80000010b1e1:	00 00                	add    %al,(%rax)
ffff80000010b1e3:	00 00                	add    %al,(%rax)
ffff80000010b1e5:	e7 42                	out    %eax,$0x42
ffff80000010b1e7:	42                   	rex.X
ffff80000010b1e8:	42 24 24             	rex.X and $0x24,%al
ffff80000010b1eb:	24 18                	and    $0x18,%al
ffff80000010b1ed:	18 00                	sbb    %al,(%rax)
ffff80000010b1ef:	00 00                	add    %al,(%rax)
ffff80000010b1f1:	00 00                	add    %al,(%rax)
ffff80000010b1f3:	00 00                	add    %al,(%rax)
ffff80000010b1f5:	e7 42                	out    %eax,$0x42
ffff80000010b1f7:	42 5a                	rex.X pop %rdx
ffff80000010b1f9:	5a                   	pop    %rdx
ffff80000010b1fa:	5a                   	pop    %rdx
ffff80000010b1fb:	24 24                	and    $0x24,%al
ffff80000010b1fd:	24 00                	and    $0x0,%al
ffff80000010b1ff:	00 00                	add    %al,(%rax)
ffff80000010b201:	00 00                	add    %al,(%rax)
ffff80000010b203:	00 00                	add    %al,(%rax)
ffff80000010b205:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b20a:	28 28                	sub    %ch,(%rax)
ffff80000010b20c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b210:	00 00                	add    %al,(%rax)
ffff80000010b212:	00 00                	add    %al,(%rax)
ffff80000010b214:	00 e7                	add    %ah,%bh
ffff80000010b216:	42                   	rex.X
ffff80000010b217:	42 24 24             	rex.X and $0x24,%al
ffff80000010b21a:	24 18                	and    $0x18,%al
ffff80000010b21c:	18 10                	sbb    %dl,(%rax)
ffff80000010b21e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b221:	00 00                	add    %al,(%rax)
ffff80000010b223:	00 00                	add    %al,(%rax)
ffff80000010b225:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b22b:	42 82                	rex.X (bad) 
ffff80000010b22d:	fe 00                	incb   (%rax)
ffff80000010b22f:	00 00                	add    %al,(%rax)
ffff80000010b231:	06                   	(bad)  
ffff80000010b232:	08 10                	or     %dl,(%rax)
ffff80000010b234:	10 10                	adc    %dl,(%rax)
ffff80000010b236:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b239:	10 10                	adc    %dl,(%rax)
ffff80000010b23b:	10 08                	adc    %cl,(%rax)
ffff80000010b23d:	06                   	(bad)  
ffff80000010b23e:	00 00                	add    %al,(%rax)
ffff80000010b240:	10 10                	adc    %dl,(%rax)
ffff80000010b242:	10 10                	adc    %dl,(%rax)
ffff80000010b244:	10 10                	adc    %dl,(%rax)
ffff80000010b246:	10 10                	adc    %dl,(%rax)
ffff80000010b248:	10 10                	adc    %dl,(%rax)
ffff80000010b24a:	10 10                	adc    %dl,(%rax)
ffff80000010b24c:	10 10                	adc    %dl,(%rax)
ffff80000010b24e:	10 10                	adc    %dl,(%rax)
ffff80000010b250:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b253:	08 08                	or     %cl,(%rax)
ffff80000010b255:	08 08                	or     %cl,(%rax)
ffff80000010b257:	06                   	(bad)  
ffff80000010b258:	08 08                	or     %cl,(%rax)
ffff80000010b25a:	08 08                	or     %cl,(%rax)
ffff80000010b25c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b25f:	00 00                	add    %al,(%rax)
ffff80000010b261:	72 8c                	jb     ffff80000010b1ef <font_ascii+0x76f>
	...

ffff80000010ba80 <init_thread>:
ffff80000010ba80:	00 00                	add    %al,(%rax)
ffff80000010ba82:	12 00                	adc    (%rax),%al
ffff80000010ba84:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ba92:	12 00                	adc    (%rax),%al
ffff80000010ba94:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010ba9a:	00 00                	add    %al,(%rax)
ffff80000010ba9c:	00 00                	add    %al,(%rax)
ffff80000010ba9e:	00 00                	add    %al,(%rax)
ffff80000010baa0:	10 00                	adc    %al,(%rax)
	...

ffff80000010bac0 <init_task>:
ffff80000010bac0:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bac6:	ff                   	(bad)  
ffff80000010bac7:	ff 00                	incl   (%rax)
	...

ffff80000010bb00 <init_tss>:
ffff80000010bb00:	00 00                	add    %al,(%rax)
ffff80000010bb02:	00 00                	add    %al,(%rax)
ffff80000010bb04:	00 00                	add    %al,(%rax)
ffff80000010bb06:	12 00                	adc    (%rax),%al
ffff80000010bb08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb0e:	12 00                	adc    (%rax),%al
ffff80000010bb10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb16:	12 00                	adc    (%rax),%al
ffff80000010bb18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb1e:	00 00                	add    %al,(%rax)
ffff80000010bb20:	00 00                	add    %al,(%rax)
ffff80000010bb22:	00 00                	add    %al,(%rax)
ffff80000010bb24:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb2e:	00 00                	add    %al,(%rax)
ffff80000010bb30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb36:	00 00                	add    %al,(%rax)
ffff80000010bb38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb3e:	00 00                	add    %al,(%rax)
ffff80000010bb40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb46:	00 00                	add    %al,(%rax)
ffff80000010bb48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb4e:	00 00                	add    %al,(%rax)
ffff80000010bb50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb56:	00 00                	add    %al,(%rax)
ffff80000010bb58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bb6e:	12 00                	adc    (%rax),%al
ffff80000010bb70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb76:	12 00                	adc    (%rax),%al
ffff80000010bb78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb7e:	12 00                	adc    (%rax),%al
ffff80000010bb80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb86:	00 00                	add    %al,(%rax)
ffff80000010bb88:	00 00                	add    %al,(%rax)
ffff80000010bb8a:	00 00                	add    %al,(%rax)
ffff80000010bb8c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb96:	00 00                	add    %al,(%rax)
ffff80000010bb98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb9e:	00 00                	add    %al,(%rax)
ffff80000010bba0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bba6:	00 00                	add    %al,(%rax)
ffff80000010bba8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbae:	00 00                	add    %al,(%rax)
ffff80000010bbb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbb6:	00 00                	add    %al,(%rax)
ffff80000010bbb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbbe:	00 00                	add    %al,(%rax)
ffff80000010bbc0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bbd6:	12 00                	adc    (%rax),%al
ffff80000010bbd8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbde:	12 00                	adc    (%rax),%al
ffff80000010bbe0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbe6:	12 00                	adc    (%rax),%al
ffff80000010bbe8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbee:	00 00                	add    %al,(%rax)
ffff80000010bbf0:	00 00                	add    %al,(%rax)
ffff80000010bbf2:	00 00                	add    %al,(%rax)
ffff80000010bbf4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bbf8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbfe:	00 00                	add    %al,(%rax)
ffff80000010bc00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc06:	00 00                	add    %al,(%rax)
ffff80000010bc08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc0e:	00 00                	add    %al,(%rax)
ffff80000010bc10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc16:	00 00                	add    %al,(%rax)
ffff80000010bc18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc1e:	00 00                	add    %al,(%rax)
ffff80000010bc20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc26:	00 00                	add    %al,(%rax)
ffff80000010bc28:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc3e:	12 00                	adc    (%rax),%al
ffff80000010bc40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc46:	12 00                	adc    (%rax),%al
ffff80000010bc48:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc4e:	12 00                	adc    (%rax),%al
ffff80000010bc50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc56:	00 00                	add    %al,(%rax)
ffff80000010bc58:	00 00                	add    %al,(%rax)
ffff80000010bc5a:	00 00                	add    %al,(%rax)
ffff80000010bc5c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bc60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc66:	00 00                	add    %al,(%rax)
ffff80000010bc68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc6e:	00 00                	add    %al,(%rax)
ffff80000010bc70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc76:	00 00                	add    %al,(%rax)
ffff80000010bc78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc7e:	00 00                	add    %al,(%rax)
ffff80000010bc80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc86:	00 00                	add    %al,(%rax)
ffff80000010bc88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc8e:	00 00                	add    %al,(%rax)
ffff80000010bc90:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bca6:	12 00                	adc    (%rax),%al
ffff80000010bca8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcae:	12 00                	adc    (%rax),%al
ffff80000010bcb0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcb6:	12 00                	adc    (%rax),%al
ffff80000010bcb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcbe:	00 00                	add    %al,(%rax)
ffff80000010bcc0:	00 00                	add    %al,(%rax)
ffff80000010bcc2:	00 00                	add    %al,(%rax)
ffff80000010bcc4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bcc8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcce:	00 00                	add    %al,(%rax)
ffff80000010bcd0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcd6:	00 00                	add    %al,(%rax)
ffff80000010bcd8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcde:	00 00                	add    %al,(%rax)
ffff80000010bce0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bce6:	00 00                	add    %al,(%rax)
ffff80000010bce8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcee:	00 00                	add    %al,(%rax)
ffff80000010bcf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcf6:	00 00                	add    %al,(%rax)
ffff80000010bcf8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bd0e:	12 00                	adc    (%rax),%al
ffff80000010bd10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd16:	12 00                	adc    (%rax),%al
ffff80000010bd18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd1e:	12 00                	adc    (%rax),%al
ffff80000010bd20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd26:	00 00                	add    %al,(%rax)
ffff80000010bd28:	00 00                	add    %al,(%rax)
ffff80000010bd2a:	00 00                	add    %al,(%rax)
ffff80000010bd2c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bd30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd36:	00 00                	add    %al,(%rax)
ffff80000010bd38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd3e:	00 00                	add    %al,(%rax)
ffff80000010bd40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd46:	00 00                	add    %al,(%rax)
ffff80000010bd48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd4e:	00 00                	add    %al,(%rax)
ffff80000010bd50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd56:	00 00                	add    %al,(%rax)
ffff80000010bd58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd5e:	00 00                	add    %al,(%rax)
ffff80000010bd60:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bd76:	12 00                	adc    (%rax),%al
ffff80000010bd78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd7e:	12 00                	adc    (%rax),%al
ffff80000010bd80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd86:	12 00                	adc    (%rax),%al
ffff80000010bd88:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd8e:	00 00                	add    %al,(%rax)
ffff80000010bd90:	00 00                	add    %al,(%rax)
ffff80000010bd92:	00 00                	add    %al,(%rax)
ffff80000010bd94:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bd98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd9e:	00 00                	add    %al,(%rax)
ffff80000010bda0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bda6:	00 00                	add    %al,(%rax)
ffff80000010bda8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdae:	00 00                	add    %al,(%rax)
ffff80000010bdb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdb6:	00 00                	add    %al,(%rax)
ffff80000010bdb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdbe:	00 00                	add    %al,(%rax)
ffff80000010bdc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bdc6:	00 00                	add    %al,(%rax)
ffff80000010bdc8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bdde:	12 00                	adc    (%rax),%al
ffff80000010bde0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bde6:	12 00                	adc    (%rax),%al
ffff80000010bde8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bdee:	12 00                	adc    (%rax),%al
ffff80000010bdf0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bdf6:	00 00                	add    %al,(%rax)
ffff80000010bdf8:	00 00                	add    %al,(%rax)
ffff80000010bdfa:	00 00                	add    %al,(%rax)
ffff80000010bdfc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010be00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be06:	00 00                	add    %al,(%rax)
ffff80000010be08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be0e:	00 00                	add    %al,(%rax)
ffff80000010be10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be16:	00 00                	add    %al,(%rax)
ffff80000010be18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be1e:	00 00                	add    %al,(%rax)
ffff80000010be20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be26:	00 00                	add    %al,(%rax)
ffff80000010be28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010be2e:	00 00                	add    %al,(%rax)
ffff80000010be30:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010be40 <system_call_table>:
ffff80000010be40:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff80000010be44:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff80000010be4a:	10 00                	adc    %al,(%rax)
ffff80000010be4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be52:	10 00                	adc    %al,(%rax)
ffff80000010be54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be5a:	10 00                	adc    %al,(%rax)
ffff80000010be5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be62:	10 00                	adc    %al,(%rax)
ffff80000010be64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be6a:	10 00                	adc    %al,(%rax)
ffff80000010be6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be72:	10 00                	adc    %al,(%rax)
ffff80000010be74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be7a:	10 00                	adc    %al,(%rax)
ffff80000010be7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be82:	10 00                	adc    %al,(%rax)
ffff80000010be84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be8a:	10 00                	adc    %al,(%rax)
ffff80000010be8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be92:	10 00                	adc    %al,(%rax)
ffff80000010be94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be9a:	10 00                	adc    %al,(%rax)
ffff80000010be9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bea2:	10 00                	adc    %al,(%rax)
ffff80000010bea4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beaa:	10 00                	adc    %al,(%rax)
ffff80000010beac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beb2:	10 00                	adc    %al,(%rax)
ffff80000010beb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beba:	10 00                	adc    %al,(%rax)
ffff80000010bebc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bec2:	10 00                	adc    %al,(%rax)
ffff80000010bec4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beca:	10 00                	adc    %al,(%rax)
ffff80000010becc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bed2:	10 00                	adc    %al,(%rax)
ffff80000010bed4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beda:	10 00                	adc    %al,(%rax)
ffff80000010bedc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bee2:	10 00                	adc    %al,(%rax)
ffff80000010bee4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010beea:	10 00                	adc    %al,(%rax)
ffff80000010beec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bef2:	10 00                	adc    %al,(%rax)
ffff80000010bef4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010befa:	10 00                	adc    %al,(%rax)
ffff80000010befc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf02:	10 00                	adc    %al,(%rax)
ffff80000010bf04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf0a:	10 00                	adc    %al,(%rax)
ffff80000010bf0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf12:	10 00                	adc    %al,(%rax)
ffff80000010bf14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf1a:	10 00                	adc    %al,(%rax)
ffff80000010bf1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf22:	10 00                	adc    %al,(%rax)
ffff80000010bf24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf2a:	10 00                	adc    %al,(%rax)
ffff80000010bf2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf32:	10 00                	adc    %al,(%rax)
ffff80000010bf34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf3a:	10 00                	adc    %al,(%rax)
ffff80000010bf3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf42:	10 00                	adc    %al,(%rax)
ffff80000010bf44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf4a:	10 00                	adc    %al,(%rax)
ffff80000010bf4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf52:	10 00                	adc    %al,(%rax)
ffff80000010bf54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf5a:	10 00                	adc    %al,(%rax)
ffff80000010bf5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf62:	10 00                	adc    %al,(%rax)
ffff80000010bf64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf6a:	10 00                	adc    %al,(%rax)
ffff80000010bf6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf72:	10 00                	adc    %al,(%rax)
ffff80000010bf74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf7a:	10 00                	adc    %al,(%rax)
ffff80000010bf7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf82:	10 00                	adc    %al,(%rax)
ffff80000010bf84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf8a:	10 00                	adc    %al,(%rax)
ffff80000010bf8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf92:	10 00                	adc    %al,(%rax)
ffff80000010bf94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bf9a:	10 00                	adc    %al,(%rax)
ffff80000010bf9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfa2:	10 00                	adc    %al,(%rax)
ffff80000010bfa4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfaa:	10 00                	adc    %al,(%rax)
ffff80000010bfac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfb2:	10 00                	adc    %al,(%rax)
ffff80000010bfb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfba:	10 00                	adc    %al,(%rax)
ffff80000010bfbc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfc2:	10 00                	adc    %al,(%rax)
ffff80000010bfc4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfca:	10 00                	adc    %al,(%rax)
ffff80000010bfcc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfd2:	10 00                	adc    %al,(%rax)
ffff80000010bfd4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfda:	10 00                	adc    %al,(%rax)
ffff80000010bfdc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfe2:	10 00                	adc    %al,(%rax)
ffff80000010bfe4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bfea:	10 00                	adc    %al,(%rax)
ffff80000010bfec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bff2:	10 00                	adc    %al,(%rax)
ffff80000010bff4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bffa:	10 00                	adc    %al,(%rax)
ffff80000010bffc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c002:	10 00                	adc    %al,(%rax)
ffff80000010c004:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c00a:	10 00                	adc    %al,(%rax)
ffff80000010c00c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c012:	10 00                	adc    %al,(%rax)
ffff80000010c014:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c01a:	10 00                	adc    %al,(%rax)
ffff80000010c01c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c022:	10 00                	adc    %al,(%rax)
ffff80000010c024:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c02a:	10 00                	adc    %al,(%rax)
ffff80000010c02c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c032:	10 00                	adc    %al,(%rax)
ffff80000010c034:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c03a:	10 00                	adc    %al,(%rax)
ffff80000010c03c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c042:	10 00                	adc    %al,(%rax)
ffff80000010c044:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c04a:	10 00                	adc    %al,(%rax)
ffff80000010c04c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c052:	10 00                	adc    %al,(%rax)
ffff80000010c054:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c05a:	10 00                	adc    %al,(%rax)
ffff80000010c05c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c062:	10 00                	adc    %al,(%rax)
ffff80000010c064:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c06a:	10 00                	adc    %al,(%rax)
ffff80000010c06c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c072:	10 00                	adc    %al,(%rax)
ffff80000010c074:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c07a:	10 00                	adc    %al,(%rax)
ffff80000010c07c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c082:	10 00                	adc    %al,(%rax)
ffff80000010c084:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c08a:	10 00                	adc    %al,(%rax)
ffff80000010c08c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c092:	10 00                	adc    %al,(%rax)
ffff80000010c094:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c09a:	10 00                	adc    %al,(%rax)
ffff80000010c09c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0a2:	10 00                	adc    %al,(%rax)
ffff80000010c0a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0aa:	10 00                	adc    %al,(%rax)
ffff80000010c0ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0b2:	10 00                	adc    %al,(%rax)
ffff80000010c0b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0ba:	10 00                	adc    %al,(%rax)
ffff80000010c0bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0c2:	10 00                	adc    %al,(%rax)
ffff80000010c0c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0ca:	10 00                	adc    %al,(%rax)
ffff80000010c0cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0d2:	10 00                	adc    %al,(%rax)
ffff80000010c0d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0da:	10 00                	adc    %al,(%rax)
ffff80000010c0dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0e2:	10 00                	adc    %al,(%rax)
ffff80000010c0e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0ea:	10 00                	adc    %al,(%rax)
ffff80000010c0ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0f2:	10 00                	adc    %al,(%rax)
ffff80000010c0f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c0fa:	10 00                	adc    %al,(%rax)
ffff80000010c0fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c102:	10 00                	adc    %al,(%rax)
ffff80000010c104:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c10a:	10 00                	adc    %al,(%rax)
ffff80000010c10c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c112:	10 00                	adc    %al,(%rax)
ffff80000010c114:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c11a:	10 00                	adc    %al,(%rax)
ffff80000010c11c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c122:	10 00                	adc    %al,(%rax)
ffff80000010c124:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c12a:	10 00                	adc    %al,(%rax)
ffff80000010c12c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c132:	10 00                	adc    %al,(%rax)
ffff80000010c134:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c13a:	10 00                	adc    %al,(%rax)
ffff80000010c13c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c142:	10 00                	adc    %al,(%rax)
ffff80000010c144:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c14a:	10 00                	adc    %al,(%rax)
ffff80000010c14c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c152:	10 00                	adc    %al,(%rax)
ffff80000010c154:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c15a:	10 00                	adc    %al,(%rax)
ffff80000010c15c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c162:	10 00                	adc    %al,(%rax)
ffff80000010c164:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c16a:	10 00                	adc    %al,(%rax)
ffff80000010c16c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c172:	10 00                	adc    %al,(%rax)
ffff80000010c174:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c17a:	10 00                	adc    %al,(%rax)
ffff80000010c17c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c182:	10 00                	adc    %al,(%rax)
ffff80000010c184:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c18a:	10 00                	adc    %al,(%rax)
ffff80000010c18c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c192:	10 00                	adc    %al,(%rax)
ffff80000010c194:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c19a:	10 00                	adc    %al,(%rax)
ffff80000010c19c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1a2:	10 00                	adc    %al,(%rax)
ffff80000010c1a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1aa:	10 00                	adc    %al,(%rax)
ffff80000010c1ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1b2:	10 00                	adc    %al,(%rax)
ffff80000010c1b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1ba:	10 00                	adc    %al,(%rax)
ffff80000010c1bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1c2:	10 00                	adc    %al,(%rax)
ffff80000010c1c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1ca:	10 00                	adc    %al,(%rax)
ffff80000010c1cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1d2:	10 00                	adc    %al,(%rax)
ffff80000010c1d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1da:	10 00                	adc    %al,(%rax)
ffff80000010c1dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1e2:	10 00                	adc    %al,(%rax)
ffff80000010c1e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1ea:	10 00                	adc    %al,(%rax)
ffff80000010c1ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1f2:	10 00                	adc    %al,(%rax)
ffff80000010c1f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c1fa:	10 00                	adc    %al,(%rax)
ffff80000010c1fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c202:	10 00                	adc    %al,(%rax)
ffff80000010c204:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c20a:	10 00                	adc    %al,(%rax)
ffff80000010c20c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c212:	10 00                	adc    %al,(%rax)
ffff80000010c214:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c21a:	10 00                	adc    %al,(%rax)
ffff80000010c21c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c222:	10 00                	adc    %al,(%rax)
ffff80000010c224:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c22a:	10 00                	adc    %al,(%rax)
ffff80000010c22c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c232:	10 00                	adc    %al,(%rax)
ffff80000010c234:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c23a:	10 00                	adc    %al,(%rax)
ffff80000010c23c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c44e:	00 00                	add    %al,(%rax)
ffff80000010c450:	00 10                	add    %dl,(%rax)
ffff80000010c452:	10 10                	adc    %dl,(%rax)
ffff80000010c454:	10 10                	adc    %dl,(%rax)
ffff80000010c456:	10 10                	adc    %dl,(%rax)
ffff80000010c458:	10 10                	adc    %dl,(%rax)
ffff80000010c45a:	00 00                	add    %al,(%rax)
ffff80000010c45c:	10 10                	adc    %dl,(%rax)
ffff80000010c45e:	00 00                	add    %al,(%rax)
ffff80000010c460:	28 28                	sub    %ch,(%rax)
ffff80000010c462:	28 00                	sub    %al,(%rax)
	...
ffff80000010c470:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010c474:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010c478:	44                   	rex.R
ffff80000010c479:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c47e:	00 00                	add    %al,(%rax)
ffff80000010c480:	10 3a                	adc    %bh,(%rdx)
ffff80000010c482:	56                   	push   %rsi
ffff80000010c483:	92                   	xchg   %eax,%edx
ffff80000010c484:	92                   	xchg   %eax,%edx
ffff80000010c485:	90                   	nop
ffff80000010c486:	50                   	push   %rax
ffff80000010c487:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010c48a:	92                   	xchg   %eax,%edx
ffff80000010c48b:	92                   	xchg   %eax,%edx
ffff80000010c48c:	d4                   	(bad)  
ffff80000010c48d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010c492:	94                   	xchg   %eax,%esp
ffff80000010c493:	94                   	xchg   %eax,%esp
ffff80000010c494:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010c499:	2c 52                	sub    $0x52,%al
ffff80000010c49b:	52                   	push   %rdx
ffff80000010c49c:	92                   	xchg   %eax,%edx
ffff80000010c49d:	8c 00                	mov    %es,(%rax)
ffff80000010c49f:	00 00                	add    %al,(%rax)
ffff80000010c4a1:	70 88                	jo     ffff80000010c42b <system_call_table+0x5eb>
ffff80000010c4a3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010c4a9:	92                   	xchg   %eax,%edx
ffff80000010c4aa:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010c4b1:	08 10                	or     %dl,(%rax)
	...
ffff80000010c4bf:	00 02                	add    %al,(%rdx)
ffff80000010c4c1:	04 08                	add    $0x8,%al
ffff80000010c4c3:	08 10                	or     %dl,(%rax)
ffff80000010c4c5:	10 10                	adc    %dl,(%rax)
ffff80000010c4c7:	10 10                	adc    %dl,(%rax)
ffff80000010c4c9:	10 10                	adc    %dl,(%rax)
ffff80000010c4cb:	08 08                	or     %cl,(%rax)
ffff80000010c4cd:	04 02                	add    $0x2,%al
ffff80000010c4cf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010c4d5:	10 10                	adc    %dl,(%rax)
ffff80000010c4d7:	10 10                	adc    %dl,(%rax)
ffff80000010c4d9:	10 10                	adc    %dl,(%rax)
ffff80000010c4db:	20 20                	and    %ah,(%rax)
ffff80000010c4dd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c4e1:	00 00                	add    %al,(%rax)
ffff80000010c4e3:	00 00                	add    %al,(%rax)
ffff80000010c4e5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010c4eb:	10 00                	adc    %al,(%rax)
	...
ffff80000010c4f5:	10 10                	adc    %dl,(%rax)
ffff80000010c4f7:	10 fe                	adc    %bh,%dh
ffff80000010c4f9:	10 10                	adc    %dl,(%rax)
ffff80000010c4fb:	10 00                	adc    %al,(%rax)
	...
ffff80000010c509:	00 00                	add    %al,(%rax)
ffff80000010c50b:	18 18                	sbb    %bl,(%rax)
ffff80000010c50d:	08 08                	or     %cl,(%rax)
ffff80000010c50f:	10 00                	adc    %al,(%rax)
ffff80000010c511:	00 00                	add    %al,(%rax)
ffff80000010c513:	00 00                	add    %al,(%rax)
ffff80000010c515:	00 00                	add    %al,(%rax)
ffff80000010c517:	00 fe                	add    %bh,%dh
	...
ffff80000010c529:	00 00                	add    %al,(%rax)
ffff80000010c52b:	00 18                	add    %bl,(%rax)
ffff80000010c52d:	18 00                	sbb    %al,(%rax)
ffff80000010c52f:	00 02                	add    %al,(%rdx)
ffff80000010c531:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010c534:	08 08                	or     %cl,(%rax)
ffff80000010c536:	08 10                	or     %dl,(%rax)
ffff80000010c538:	10 20                	adc    %ah,(%rax)
ffff80000010c53a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c53d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010c544:	42 
ffff80000010c545:	42                   	rex.X
ffff80000010c546:	42                   	rex.X
ffff80000010c547:	42                   	rex.X
ffff80000010c548:	42                   	rex.X
ffff80000010c549:	42                   	rex.X
ffff80000010c54a:	42 24 24             	rex.X and $0x24,%al
ffff80000010c54d:	18 00                	sbb    %al,(%rax)
ffff80000010c54f:	00 00                	add    %al,(%rax)
ffff80000010c551:	08 18                	or     %bl,(%rax)
ffff80000010c553:	28 08                	sub    %cl,(%rax)
ffff80000010c555:	08 08                	or     %cl,(%rax)
ffff80000010c557:	08 08                	or     %cl,(%rax)
ffff80000010c559:	08 08                	or     %cl,(%rax)
ffff80000010c55b:	08 08                	or     %cl,(%rax)
ffff80000010c55d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010c560:	00 18                	add    %bl,(%rax)
ffff80000010c562:	24 42                	and    $0x42,%al
ffff80000010c564:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010c568:	10 20                	adc    %ah,(%rax)
ffff80000010c56a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c56d:	7e 00                	jle    ffff80000010c56f <system_call_table+0x72f>
ffff80000010c56f:	00 00                	add    %al,(%rax)
ffff80000010c571:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010c574:	02 02                	add    (%rdx),%al
ffff80000010c576:	04 18                	add    $0x18,%al
ffff80000010c578:	04 02                	add    $0x2,%al
ffff80000010c57a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010c57d:	18 00                	sbb    %al,(%rax)
ffff80000010c57f:	00 00                	add    %al,(%rax)
ffff80000010c581:	0c 0c                	or     $0xc,%al
ffff80000010c583:	0c 14                	or     $0x14,%al
ffff80000010c585:	14 14                	adc    $0x14,%al
ffff80000010c587:	24 24                	and    $0x24,%al
ffff80000010c589:	44 7e 04             	rex.R jle ffff80000010c590 <system_call_table+0x750>
ffff80000010c58c:	04 1e                	add    $0x1e,%al
ffff80000010c58e:	00 00                	add    %al,(%rax)
ffff80000010c590:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010c594:	40 58                	rex pop %rax
ffff80000010c596:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010c599:	02 02                	add    (%rdx),%al
ffff80000010c59b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c59e:	00 00                	add    %al,(%rax)
ffff80000010c5a0:	00 18                	add    %bl,(%rax)
ffff80000010c5a2:	24 42                	and    $0x42,%al
ffff80000010c5a4:	40 58                	rex pop %rax
ffff80000010c5a6:	64 42                	fs rex.X
ffff80000010c5a8:	42                   	rex.X
ffff80000010c5a9:	42                   	rex.X
ffff80000010c5aa:	42                   	rex.X
ffff80000010c5ab:	42 24 18             	rex.X and $0x18,%al
ffff80000010c5ae:	00 00                	add    %al,(%rax)
ffff80000010c5b0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010c5b3:	42 04 04             	rex.X add $0x4,%al
ffff80000010c5b6:	08 08                	or     %cl,(%rax)
ffff80000010c5b8:	08 10                	or     %dl,(%rax)
ffff80000010c5ba:	10 10                	adc    %dl,(%rax)
ffff80000010c5bc:	10 38                	adc    %bh,(%rax)
ffff80000010c5be:	00 00                	add    %al,(%rax)
ffff80000010c5c0:	00 18                	add    %bl,(%rax)
ffff80000010c5c2:	24 42                	and    $0x42,%al
ffff80000010c5c4:	42                   	rex.X
ffff80000010c5c5:	42 24 18             	rex.X and $0x18,%al
ffff80000010c5c8:	24 42                	and    $0x42,%al
ffff80000010c5ca:	42                   	rex.X
ffff80000010c5cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c5ce:	00 00                	add    %al,(%rax)
ffff80000010c5d0:	00 18                	add    %bl,(%rax)
ffff80000010c5d2:	24 42                	and    $0x42,%al
ffff80000010c5d4:	42                   	rex.X
ffff80000010c5d5:	42                   	rex.X
ffff80000010c5d6:	42                   	rex.X
ffff80000010c5d7:	42                   	rex.X
ffff80000010c5d8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010c5db:	42 24 18             	rex.X and $0x18,%al
ffff80000010c5de:	00 00                	add    %al,(%rax)
ffff80000010c5e0:	00 00                	add    %al,(%rax)
ffff80000010c5e2:	00 00                	add    %al,(%rax)
ffff80000010c5e4:	00 18                	add    %bl,(%rax)
ffff80000010c5e6:	18 00                	sbb    %al,(%rax)
ffff80000010c5e8:	00 00                	add    %al,(%rax)
ffff80000010c5ea:	00 00                	add    %al,(%rax)
ffff80000010c5ec:	18 18                	sbb    %bl,(%rax)
ffff80000010c5ee:	00 00                	add    %al,(%rax)
ffff80000010c5f0:	00 00                	add    %al,(%rax)
ffff80000010c5f2:	00 00                	add    %al,(%rax)
ffff80000010c5f4:	00 18                	add    %bl,(%rax)
ffff80000010c5f6:	18 00                	sbb    %al,(%rax)
ffff80000010c5f8:	00 00                	add    %al,(%rax)
ffff80000010c5fa:	00 18                	add    %bl,(%rax)
ffff80000010c5fc:	18 08                	sbb    %cl,(%rax)
ffff80000010c5fe:	08 10                	or     %dl,(%rax)
ffff80000010c600:	00 02                	add    %al,(%rdx)
ffff80000010c602:	04 08                	add    $0x8,%al
ffff80000010c604:	10 20                	adc    %ah,(%rax)
ffff80000010c606:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010c60d:	04 
ffff80000010c60e:	02 00                	add    (%rax),%al
ffff80000010c610:	00 00                	add    %al,(%rax)
ffff80000010c612:	00 00                	add    %al,(%rax)
ffff80000010c614:	00 00                	add    %al,(%rax)
ffff80000010c616:	fe 00                	incb   (%rax)
ffff80000010c618:	00 fe                	add    %bh,%dh
ffff80000010c61a:	00 00                	add    %al,(%rax)
ffff80000010c61c:	00 00                	add    %al,(%rax)
ffff80000010c61e:	00 00                	add    %al,(%rax)
ffff80000010c620:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010c626:	04 02                	add    $0x2,%al
ffff80000010c628:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010c62b:	10 20                	adc    %ah,(%rax)
ffff80000010c62d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c631:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c635:	82                   	(bad)  
ffff80000010c636:	04 08                	add    $0x8,%al
ffff80000010c638:	10 10                	adc    %dl,(%rax)
ffff80000010c63a:	00 00                	add    %al,(%rax)
ffff80000010c63c:	18 18                	sbb    %bl,(%rax)
ffff80000010c63e:	00 00                	add    %al,(%rax)
ffff80000010c640:	00 38                	add    %bh,(%rax)
ffff80000010c642:	44 82                	rex.R (bad) 
ffff80000010c644:	9a                   	(bad)  
ffff80000010c645:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c646:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c647:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c648:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c649:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c64a:	9c                   	pushfq 
ffff80000010c64b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010c64f:	00 00                	add    %al,(%rax)
ffff80000010c651:	18 18                	sbb    %bl,(%rax)
ffff80000010c653:	18 18                	sbb    %bl,(%rax)
ffff80000010c655:	24 24                	and    $0x24,%al
ffff80000010c657:	24 24                	and    $0x24,%al
ffff80000010c659:	7e 42                	jle    ffff80000010c69d <system_call_table+0x85d>
ffff80000010c65b:	42                   	rex.X
ffff80000010c65c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c65f:	00 00                	add    %al,(%rax)
ffff80000010c661:	f0 48                	lock rex.W
ffff80000010c663:	44                   	rex.R
ffff80000010c664:	44                   	rex.R
ffff80000010c665:	44                   	rex.R
ffff80000010c666:	48 78 44             	rex.W js ffff80000010c6ad <system_call_table+0x86d>
ffff80000010c669:	42                   	rex.X
ffff80000010c66a:	42                   	rex.X
ffff80000010c66b:	42                   	rex.X
ffff80000010c66c:	44 f8                	rex.R clc 
ffff80000010c66e:	00 00                	add    %al,(%rax)
ffff80000010c670:	00 3a                	add    %bh,(%rdx)
ffff80000010c672:	46                   	rex.RX
ffff80000010c673:	42 82                	rex.X (bad) 
ffff80000010c675:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010c67c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c67f:	00 00                	add    %al,(%rax)
ffff80000010c681:	f8                   	clc    
ffff80000010c682:	44                   	rex.R
ffff80000010c683:	44                   	rex.R
ffff80000010c684:	42                   	rex.X
ffff80000010c685:	42                   	rex.X
ffff80000010c686:	42                   	rex.X
ffff80000010c687:	42                   	rex.X
ffff80000010c688:	42                   	rex.X
ffff80000010c689:	42                   	rex.X
ffff80000010c68a:	42                   	rex.X
ffff80000010c68b:	44                   	rex.R
ffff80000010c68c:	44 f8                	rex.R clc 
ffff80000010c68e:	00 00                	add    %al,(%rax)
ffff80000010c690:	00 fe                	add    %bh,%dh
ffff80000010c692:	42                   	rex.X
ffff80000010c693:	42                   	rex.X
ffff80000010c694:	40                   	rex
ffff80000010c695:	40                   	rex
ffff80000010c696:	44 7c 44             	rex.R jl ffff80000010c6dd <system_call_table+0x89d>
ffff80000010c699:	40                   	rex
ffff80000010c69a:	40                   	rex
ffff80000010c69b:	42                   	rex.X
ffff80000010c69c:	42 fe 00             	rex.X incb (%rax)
ffff80000010c69f:	00 00                	add    %al,(%rax)
ffff80000010c6a1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010c6a4:	40                   	rex
ffff80000010c6a5:	40                   	rex
ffff80000010c6a6:	44 7c 44             	rex.R jl ffff80000010c6ed <system_call_table+0x8ad>
ffff80000010c6a9:	44                   	rex.R
ffff80000010c6aa:	40                   	rex
ffff80000010c6ab:	40                   	rex
ffff80000010c6ac:	40                   	rex
ffff80000010c6ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010c6b0:	00 3a                	add    %bh,(%rdx)
ffff80000010c6b2:	46                   	rex.RX
ffff80000010c6b3:	42 82                	rex.X (bad) 
ffff80000010c6b5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010c6bc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010c6bf:	00 00                	add    %al,(%rax)
ffff80000010c6c1:	e7 42                	out    %eax,$0x42
ffff80000010c6c3:	42                   	rex.X
ffff80000010c6c4:	42                   	rex.X
ffff80000010c6c5:	42                   	rex.X
ffff80000010c6c6:	42 7e 42             	rex.X jle ffff80000010c70b <system_call_table+0x8cb>
ffff80000010c6c9:	42                   	rex.X
ffff80000010c6ca:	42                   	rex.X
ffff80000010c6cb:	42                   	rex.X
ffff80000010c6cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c6cf:	00 00                	add    %al,(%rax)
ffff80000010c6d1:	7c 10                	jl     ffff80000010c6e3 <system_call_table+0x8a3>
ffff80000010c6d3:	10 10                	adc    %dl,(%rax)
ffff80000010c6d5:	10 10                	adc    %dl,(%rax)
ffff80000010c6d7:	10 10                	adc    %dl,(%rax)
ffff80000010c6d9:	10 10                	adc    %dl,(%rax)
ffff80000010c6db:	10 10                	adc    %dl,(%rax)
ffff80000010c6dd:	7c 00                	jl     ffff80000010c6df <system_call_table+0x89f>
ffff80000010c6df:	00 00                	add    %al,(%rax)
ffff80000010c6e1:	1f                   	(bad)  
ffff80000010c6e2:	04 04                	add    $0x4,%al
ffff80000010c6e4:	04 04                	add    $0x4,%al
ffff80000010c6e6:	04 04                	add    $0x4,%al
ffff80000010c6e8:	04 04                	add    $0x4,%al
ffff80000010c6ea:	04 04                	add    $0x4,%al
ffff80000010c6ec:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010c6ef:	00 00                	add    %al,(%rax)
ffff80000010c6f1:	e7 42                	out    %eax,$0x42
ffff80000010c6f3:	44                   	rex.R
ffff80000010c6f4:	48 50                	rex.W push %rax
ffff80000010c6f6:	50                   	push   %rax
ffff80000010c6f7:	60                   	(bad)  
ffff80000010c6f8:	50                   	push   %rax
ffff80000010c6f9:	50                   	push   %rax
ffff80000010c6fa:	48                   	rex.W
ffff80000010c6fb:	44                   	rex.R
ffff80000010c6fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c6ff:	00 00                	add    %al,(%rax)
ffff80000010c701:	f0 40                	lock rex
ffff80000010c703:	40                   	rex
ffff80000010c704:	40                   	rex
ffff80000010c705:	40                   	rex
ffff80000010c706:	40                   	rex
ffff80000010c707:	40                   	rex
ffff80000010c708:	40                   	rex
ffff80000010c709:	40                   	rex
ffff80000010c70a:	40                   	rex
ffff80000010c70b:	42                   	rex.X
ffff80000010c70c:	42 fe 00             	rex.X incb (%rax)
ffff80000010c70f:	00 00                	add    %al,(%rax)
ffff80000010c711:	c3                   	retq   
ffff80000010c712:	42                   	rex.X
ffff80000010c713:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010c717:	5a                   	pop    %rdx
ffff80000010c718:	5a                   	pop    %rdx
ffff80000010c719:	42                   	rex.X
ffff80000010c71a:	42                   	rex.X
ffff80000010c71b:	42                   	rex.X
ffff80000010c71c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c71f:	00 00                	add    %al,(%rax)
ffff80000010c721:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010c728:	4a                   	rex.WX
ffff80000010c729:	4a                   	rex.WX
ffff80000010c72a:	4a                   	rex.WX
ffff80000010c72b:	46                   	rex.RX
ffff80000010c72c:	46 e2 00             	rex.RX loop ffff80000010c72f <system_call_table+0x8ef>
ffff80000010c72f:	00 00                	add    %al,(%rax)
ffff80000010c731:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c735:	82                   	(bad)  
ffff80000010c736:	82                   	(bad)  
ffff80000010c737:	82                   	(bad)  
ffff80000010c738:	82                   	(bad)  
ffff80000010c739:	82                   	(bad)  
ffff80000010c73a:	82                   	(bad)  
ffff80000010c73b:	82                   	(bad)  
ffff80000010c73c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c73f:	00 00                	add    %al,(%rax)
ffff80000010c741:	f8                   	clc    
ffff80000010c742:	44                   	rex.R
ffff80000010c743:	42                   	rex.X
ffff80000010c744:	42                   	rex.X
ffff80000010c745:	42                   	rex.X
ffff80000010c746:	44 78 40             	rex.R js ffff80000010c789 <system_call_table+0x949>
ffff80000010c749:	40                   	rex
ffff80000010c74a:	40                   	rex
ffff80000010c74b:	40                   	rex
ffff80000010c74c:	40                   	rex
ffff80000010c74d:	f0 00 00             	lock add %al,(%rax)
ffff80000010c750:	00 38                	add    %bh,(%rax)
ffff80000010c752:	44 82                	rex.R (bad) 
ffff80000010c754:	82                   	(bad)  
ffff80000010c755:	82                   	(bad)  
ffff80000010c756:	82                   	(bad)  
ffff80000010c757:	82                   	(bad)  
ffff80000010c758:	82                   	(bad)  
ffff80000010c759:	82                   	(bad)  
ffff80000010c75a:	92                   	xchg   %eax,%edx
ffff80000010c75b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010c75f:	00 00                	add    %al,(%rax)
ffff80000010c761:	fc                   	cld    
ffff80000010c762:	42                   	rex.X
ffff80000010c763:	42                   	rex.X
ffff80000010c764:	42                   	rex.X
ffff80000010c765:	42 7c 44             	rex.X jl ffff80000010c7ac <system_call_table+0x96c>
ffff80000010c768:	42                   	rex.X
ffff80000010c769:	42                   	rex.X
ffff80000010c76a:	42                   	rex.X
ffff80000010c76b:	42                   	rex.X
ffff80000010c76c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c76f:	00 00                	add    %al,(%rax)
ffff80000010c771:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010c774:	82                   	(bad)  
ffff80000010c775:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010c779:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010c77f:	00 00                	add    %al,(%rax)
ffff80000010c781:	fe                   	(bad)  
ffff80000010c782:	92                   	xchg   %eax,%edx
ffff80000010c783:	92                   	xchg   %eax,%edx
ffff80000010c784:	10 10                	adc    %dl,(%rax)
ffff80000010c786:	10 10                	adc    %dl,(%rax)
ffff80000010c788:	10 10                	adc    %dl,(%rax)
ffff80000010c78a:	10 10                	adc    %dl,(%rax)
ffff80000010c78c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010c790:	00 e7                	add    %ah,%bh
ffff80000010c792:	42                   	rex.X
ffff80000010c793:	42                   	rex.X
ffff80000010c794:	42                   	rex.X
ffff80000010c795:	42                   	rex.X
ffff80000010c796:	42                   	rex.X
ffff80000010c797:	42                   	rex.X
ffff80000010c798:	42                   	rex.X
ffff80000010c799:	42                   	rex.X
ffff80000010c79a:	42                   	rex.X
ffff80000010c79b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010c79e:	00 00                	add    %al,(%rax)
ffff80000010c7a0:	00 e7                	add    %ah,%bh
ffff80000010c7a2:	42                   	rex.X
ffff80000010c7a3:	42                   	rex.X
ffff80000010c7a4:	42                   	rex.X
ffff80000010c7a5:	42 24 24             	rex.X and $0x24,%al
ffff80000010c7a8:	24 24                	and    $0x24,%al
ffff80000010c7aa:	18 18                	sbb    %bl,(%rax)
ffff80000010c7ac:	18 18                	sbb    %bl,(%rax)
ffff80000010c7ae:	00 00                	add    %al,(%rax)
ffff80000010c7b0:	00 e7                	add    %ah,%bh
ffff80000010c7b2:	42                   	rex.X
ffff80000010c7b3:	42                   	rex.X
ffff80000010c7b4:	42 5a                	rex.X pop %rdx
ffff80000010c7b6:	5a                   	pop    %rdx
ffff80000010c7b7:	5a                   	pop    %rdx
ffff80000010c7b8:	5a                   	pop    %rdx
ffff80000010c7b9:	24 24                	and    $0x24,%al
ffff80000010c7bb:	24 24                	and    $0x24,%al
ffff80000010c7bd:	24 00                	and    $0x0,%al
ffff80000010c7bf:	00 00                	add    %al,(%rax)
ffff80000010c7c1:	e7 42                	out    %eax,$0x42
ffff80000010c7c3:	42 24 24             	rex.X and $0x24,%al
ffff80000010c7c6:	24 18                	and    $0x18,%al
ffff80000010c7c8:	24 24                	and    $0x24,%al
ffff80000010c7ca:	24 42                	and    $0x42,%al
ffff80000010c7cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c7cf:	00 00                	add    %al,(%rax)
ffff80000010c7d1:	ee                   	out    %al,(%dx)
ffff80000010c7d2:	44                   	rex.R
ffff80000010c7d3:	44                   	rex.R
ffff80000010c7d4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010c7d7:	28 10                	sub    %dl,(%rax)
ffff80000010c7d9:	10 10                	adc    %dl,(%rax)
ffff80000010c7db:	10 10                	adc    %dl,(%rax)
ffff80000010c7dd:	7c 00                	jl     ffff80000010c7df <system_call_table+0x99f>
ffff80000010c7df:	00 00                	add    %al,(%rax)
ffff80000010c7e1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010c7e8:	20 20                	and    %ah,(%rax)
ffff80000010c7ea:	40                   	rex
ffff80000010c7eb:	42 82                	rex.X (bad) 
ffff80000010c7ed:	fe 00                	incb   (%rax)
ffff80000010c7ef:	00 00                	add    %al,(%rax)
ffff80000010c7f1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010c7f4:	20 20                	and    %ah,(%rax)
ffff80000010c7f6:	20 20                	and    %ah,(%rax)
ffff80000010c7f8:	20 20                	and    %ah,(%rax)
ffff80000010c7fa:	20 20                	and    %ah,(%rax)
ffff80000010c7fc:	20 20                	and    %ah,(%rax)
ffff80000010c7fe:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010c805:	20 20                	and    %ah,(%rax)
ffff80000010c807:	10 10                	adc    %dl,(%rax)
ffff80000010c809:	08 08                	or     %cl,(%rax)
ffff80000010c80b:	04 04                	add    $0x4,%al
ffff80000010c80d:	04 02                	add    $0x2,%al
ffff80000010c80f:	02 00                	add    (%rax),%al
ffff80000010c811:	7c 04                	jl     ffff80000010c817 <system_call_table+0x9d7>
ffff80000010c813:	04 04                	add    $0x4,%al
ffff80000010c815:	04 04                	add    $0x4,%al
ffff80000010c817:	04 04                	add    $0x4,%al
ffff80000010c819:	04 04                	add    $0x4,%al
ffff80000010c81b:	04 04                	add    $0x4,%al
ffff80000010c81d:	04 7c                	add    $0x7c,%al
ffff80000010c81f:	00 00                	add    %al,(%rax)
ffff80000010c821:	10 28                	adc    %ch,(%rax)
ffff80000010c823:	44 82                	rex.R (bad) 
	...
ffff80000010c83d:	00 fe                	add    %bh,%dh
ffff80000010c83f:	00 10                	add    %dl,(%rax)
ffff80000010c841:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010c854:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010c857:	04 3c                	add    $0x3c,%al
ffff80000010c859:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010c860:	c0 
ffff80000010c861:	40                   	rex
ffff80000010c862:	40                   	rex
ffff80000010c863:	40                   	rex
ffff80000010c864:	40 58                	rex pop %rax
ffff80000010c866:	64 42                	fs rex.X
ffff80000010c868:	42                   	rex.X
ffff80000010c869:	42                   	rex.X
ffff80000010c86a:	42                   	rex.X
ffff80000010c86b:	42                   	rex.X
ffff80000010c86c:	64 58                	fs pop %rax
ffff80000010c86e:	00 00                	add    %al,(%rax)
ffff80000010c870:	00 00                	add    %al,(%rax)
ffff80000010c872:	00 00                	add    %al,(%rax)
ffff80000010c874:	00 30                	add    %dh,(%rax)
ffff80000010c876:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010c87d:	38 
ffff80000010c87e:	00 00                	add    %al,(%rax)
ffff80000010c880:	0c 04                	or     $0x4,%al
ffff80000010c882:	04 04                	add    $0x4,%al
ffff80000010c884:	04 34                	add    $0x34,%al
ffff80000010c886:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010c88d:	36 
ffff80000010c88e:	00 00                	add    %al,(%rax)
ffff80000010c890:	00 00                	add    %al,(%rax)
ffff80000010c892:	00 00                	add    %al,(%rax)
ffff80000010c894:	00 38                	add    %bh,(%rax)
ffff80000010c896:	44 82                	rex.R (bad) 
ffff80000010c898:	82                   	(bad)  
ffff80000010c899:	fc                   	cld    
ffff80000010c89a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010c8a1:	10 10                	adc    %dl,(%rax)
ffff80000010c8a3:	10 10                	adc    %dl,(%rax)
ffff80000010c8a5:	7c 10                	jl     ffff80000010c8b7 <system_call_table+0xa77>
ffff80000010c8a7:	10 10                	adc    %dl,(%rax)
ffff80000010c8a9:	10 10                	adc    %dl,(%rax)
ffff80000010c8ab:	10 10                	adc    %dl,(%rax)
ffff80000010c8ad:	7c 00                	jl     ffff80000010c8af <system_call_table+0xa6f>
ffff80000010c8af:	00 00                	add    %al,(%rax)
ffff80000010c8b1:	00 00                	add    %al,(%rax)
ffff80000010c8b3:	00 00                	add    %al,(%rax)
ffff80000010c8b5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010c8bc:	34 04 
ffff80000010c8be:	04 38                	add    $0x38,%al
ffff80000010c8c0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010c8c4:	40 58                	rex pop %rax
ffff80000010c8c6:	64 42                	fs rex.X
ffff80000010c8c8:	42                   	rex.X
ffff80000010c8c9:	42                   	rex.X
ffff80000010c8ca:	42                   	rex.X
ffff80000010c8cb:	42                   	rex.X
ffff80000010c8cc:	42 e3 00             	rex.X jrcxz ffff80000010c8cf <system_call_table+0xa8f>
ffff80000010c8cf:	00 00                	add    %al,(%rax)
ffff80000010c8d1:	10 10                	adc    %dl,(%rax)
ffff80000010c8d3:	00 00                	add    %al,(%rax)
ffff80000010c8d5:	30 10                	xor    %dl,(%rax)
ffff80000010c8d7:	10 10                	adc    %dl,(%rax)
ffff80000010c8d9:	10 10                	adc    %dl,(%rax)
ffff80000010c8db:	10 10                	adc    %dl,(%rax)
ffff80000010c8dd:	38 00                	cmp    %al,(%rax)
ffff80000010c8df:	00 00                	add    %al,(%rax)
ffff80000010c8e1:	04 04                	add    $0x4,%al
ffff80000010c8e3:	00 00                	add    %al,(%rax)
ffff80000010c8e5:	0c 04                	or     $0x4,%al
ffff80000010c8e7:	04 04                	add    $0x4,%al
ffff80000010c8e9:	04 04                	add    $0x4,%al
ffff80000010c8eb:	04 04                	add    $0x4,%al
ffff80000010c8ed:	08 08                	or     %cl,(%rax)
ffff80000010c8ef:	30 c0                	xor    %al,%al
ffff80000010c8f1:	40                   	rex
ffff80000010c8f2:	40                   	rex
ffff80000010c8f3:	40                   	rex
ffff80000010c8f4:	40                   	rex
ffff80000010c8f5:	4e                   	rex.WRX
ffff80000010c8f6:	44                   	rex.R
ffff80000010c8f7:	48 50                	rex.W push %rax
ffff80000010c8f9:	60                   	(bad)  
ffff80000010c8fa:	50                   	push   %rax
ffff80000010c8fb:	48                   	rex.W
ffff80000010c8fc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010c8ff:	00 30                	add    %dh,(%rax)
ffff80000010c901:	10 10                	adc    %dl,(%rax)
ffff80000010c903:	10 10                	adc    %dl,(%rax)
ffff80000010c905:	10 10                	adc    %dl,(%rax)
ffff80000010c907:	10 10                	adc    %dl,(%rax)
ffff80000010c909:	10 10                	adc    %dl,(%rax)
ffff80000010c90b:	10 10                	adc    %dl,(%rax)
ffff80000010c90d:	38 00                	cmp    %al,(%rax)
ffff80000010c90f:	00 00                	add    %al,(%rax)
ffff80000010c911:	00 00                	add    %al,(%rax)
ffff80000010c913:	00 00                	add    %al,(%rax)
ffff80000010c915:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010c919:	49                   	rex.WB
ffff80000010c91a:	49                   	rex.WB
ffff80000010c91b:	49                   	rex.WB
ffff80000010c91c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010c91f:	00 00                	add    %al,(%rax)
ffff80000010c921:	00 00                	add    %al,(%rax)
ffff80000010c923:	00 00                	add    %al,(%rax)
ffff80000010c925:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010c929:	42                   	rex.X
ffff80000010c92a:	42                   	rex.X
ffff80000010c92b:	42                   	rex.X
ffff80000010c92c:	42 e3 00             	rex.X jrcxz ffff80000010c92f <system_call_table+0xaef>
ffff80000010c92f:	00 00                	add    %al,(%rax)
ffff80000010c931:	00 00                	add    %al,(%rax)
ffff80000010c933:	00 00                	add    %al,(%rax)
ffff80000010c935:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c939:	82                   	(bad)  
ffff80000010c93a:	82                   	(bad)  
ffff80000010c93b:	82                   	(bad)  
ffff80000010c93c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c93f:	00 00                	add    %al,(%rax)
ffff80000010c941:	00 00                	add    %al,(%rax)
ffff80000010c943:	00 d8                	add    %bl,%al
ffff80000010c945:	64 42                	fs rex.X
ffff80000010c947:	42                   	rex.X
ffff80000010c948:	42                   	rex.X
ffff80000010c949:	42                   	rex.X
ffff80000010c94a:	42                   	rex.X
ffff80000010c94b:	64 58                	fs pop %rax
ffff80000010c94d:	40                   	rex
ffff80000010c94e:	40 e0 00             	rex loopne ffff80000010c951 <system_call_table+0xb11>
ffff80000010c951:	00 00                	add    %al,(%rax)
ffff80000010c953:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010c956:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010c95d:	04 04                	add    $0x4,%al
ffff80000010c95f:	0e                   	(bad)  
ffff80000010c960:	00 00                	add    %al,(%rax)
ffff80000010c962:	00 00                	add    %al,(%rax)
ffff80000010c964:	00 dc                	add    %bl,%ah
ffff80000010c966:	62 42                	(bad)  
ffff80000010c968:	40                   	rex
ffff80000010c969:	40                   	rex
ffff80000010c96a:	40                   	rex
ffff80000010c96b:	40                   	rex
ffff80000010c96c:	40 e0 00             	rex loopne ffff80000010c96f <system_call_table+0xb2f>
ffff80000010c96f:	00 00                	add    %al,(%rax)
ffff80000010c971:	00 00                	add    %al,(%rax)
ffff80000010c973:	00 00                	add    %al,(%rax)
ffff80000010c975:	7a 86                	jp     ffff80000010c8fd <system_call_table+0xabd>
ffff80000010c977:	82                   	(bad)  
ffff80000010c978:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010c97b:	82                   	(bad)  
ffff80000010c97c:	c2 bc 00             	retq   $0xbc
ffff80000010c97f:	00 00                	add    %al,(%rax)
ffff80000010c981:	00 10                	add    %dl,(%rax)
ffff80000010c983:	10 10                	adc    %dl,(%rax)
ffff80000010c985:	7c 10                	jl     ffff80000010c997 <system_call_table+0xb57>
ffff80000010c987:	10 10                	adc    %dl,(%rax)
ffff80000010c989:	10 10                	adc    %dl,(%rax)
ffff80000010c98b:	10 10                	adc    %dl,(%rax)
ffff80000010c98d:	0e                   	(bad)  
ffff80000010c98e:	00 00                	add    %al,(%rax)
ffff80000010c990:	00 00                	add    %al,(%rax)
ffff80000010c992:	00 00                	add    %al,(%rax)
ffff80000010c994:	00 c6                	add    %al,%dh
ffff80000010c996:	42                   	rex.X
ffff80000010c997:	42                   	rex.X
ffff80000010c998:	42                   	rex.X
ffff80000010c999:	42                   	rex.X
ffff80000010c99a:	42                   	rex.X
ffff80000010c99b:	42                   	rex.X
ffff80000010c99c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010c99f:	00 00                	add    %al,(%rax)
ffff80000010c9a1:	00 00                	add    %al,(%rax)
ffff80000010c9a3:	00 00                	add    %al,(%rax)
ffff80000010c9a5:	e7 42                	out    %eax,$0x42
ffff80000010c9a7:	42                   	rex.X
ffff80000010c9a8:	42 24 24             	rex.X and $0x24,%al
ffff80000010c9ab:	24 18                	and    $0x18,%al
ffff80000010c9ad:	18 00                	sbb    %al,(%rax)
ffff80000010c9af:	00 00                	add    %al,(%rax)
ffff80000010c9b1:	00 00                	add    %al,(%rax)
ffff80000010c9b3:	00 00                	add    %al,(%rax)
ffff80000010c9b5:	e7 42                	out    %eax,$0x42
ffff80000010c9b7:	42 5a                	rex.X pop %rdx
ffff80000010c9b9:	5a                   	pop    %rdx
ffff80000010c9ba:	5a                   	pop    %rdx
ffff80000010c9bb:	24 24                	and    $0x24,%al
ffff80000010c9bd:	24 00                	and    $0x0,%al
ffff80000010c9bf:	00 00                	add    %al,(%rax)
ffff80000010c9c1:	00 00                	add    %al,(%rax)
ffff80000010c9c3:	00 00                	add    %al,(%rax)
ffff80000010c9c5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010c9ca:	28 28                	sub    %ch,(%rax)
ffff80000010c9cc:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010c9d0:	00 00                	add    %al,(%rax)
ffff80000010c9d2:	00 00                	add    %al,(%rax)
ffff80000010c9d4:	00 e7                	add    %ah,%bh
ffff80000010c9d6:	42                   	rex.X
ffff80000010c9d7:	42 24 24             	rex.X and $0x24,%al
ffff80000010c9da:	24 18                	and    $0x18,%al
ffff80000010c9dc:	18 10                	sbb    %dl,(%rax)
ffff80000010c9de:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010c9e1:	00 00                	add    %al,(%rax)
ffff80000010c9e3:	00 00                	add    %al,(%rax)
ffff80000010c9e5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010c9eb:	42 82                	rex.X (bad) 
ffff80000010c9ed:	fe 00                	incb   (%rax)
ffff80000010c9ef:	00 00                	add    %al,(%rax)
ffff80000010c9f1:	06                   	(bad)  
ffff80000010c9f2:	08 10                	or     %dl,(%rax)
ffff80000010c9f4:	10 10                	adc    %dl,(%rax)
ffff80000010c9f6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010c9f9:	10 10                	adc    %dl,(%rax)
ffff80000010c9fb:	10 08                	adc    %cl,(%rax)
ffff80000010c9fd:	06                   	(bad)  
ffff80000010c9fe:	00 00                	add    %al,(%rax)
ffff80000010ca00:	10 10                	adc    %dl,(%rax)
ffff80000010ca02:	10 10                	adc    %dl,(%rax)
ffff80000010ca04:	10 10                	adc    %dl,(%rax)
ffff80000010ca06:	10 10                	adc    %dl,(%rax)
ffff80000010ca08:	10 10                	adc    %dl,(%rax)
ffff80000010ca0a:	10 10                	adc    %dl,(%rax)
ffff80000010ca0c:	10 10                	adc    %dl,(%rax)
ffff80000010ca0e:	10 10                	adc    %dl,(%rax)
ffff80000010ca10:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ca13:	08 08                	or     %cl,(%rax)
ffff80000010ca15:	08 08                	or     %cl,(%rax)
ffff80000010ca17:	06                   	(bad)  
ffff80000010ca18:	08 08                	or     %cl,(%rax)
ffff80000010ca1a:	08 08                	or     %cl,(%rax)
ffff80000010ca1c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ca1f:	00 00                	add    %al,(%rax)
ffff80000010ca21:	72 8c                	jb     ffff80000010c9af <system_call_table+0xb6f>
	...
ffff80000010d44f:	00 00                	add    %al,(%rax)
ffff80000010d451:	10 10                	adc    %dl,(%rax)
ffff80000010d453:	10 10                	adc    %dl,(%rax)
ffff80000010d455:	10 10                	adc    %dl,(%rax)
ffff80000010d457:	10 10                	adc    %dl,(%rax)
ffff80000010d459:	10 00                	adc    %al,(%rax)
ffff80000010d45b:	00 10                	add    %dl,(%rax)
ffff80000010d45d:	10 00                	adc    %al,(%rax)
ffff80000010d45f:	00 28                	add    %ch,(%rax)
ffff80000010d461:	28 28                	sub    %ch,(%rax)
	...
ffff80000010d46f:	00 00                	add    %al,(%rax)
ffff80000010d471:	44                   	rex.R
ffff80000010d472:	44                   	rex.R
ffff80000010d473:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d478:	44                   	rex.R
ffff80000010d479:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d47e:	00 00                	add    %al,(%rax)
ffff80000010d480:	10 3a                	adc    %bh,(%rdx)
ffff80000010d482:	56                   	push   %rsi
ffff80000010d483:	92                   	xchg   %eax,%edx
ffff80000010d484:	92                   	xchg   %eax,%edx
ffff80000010d485:	90                   	nop
ffff80000010d486:	50                   	push   %rax
ffff80000010d487:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010d48a:	92                   	xchg   %eax,%edx
ffff80000010d48b:	92                   	xchg   %eax,%edx
ffff80000010d48c:	d4                   	(bad)  
ffff80000010d48d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010d492:	94                   	xchg   %eax,%esp
ffff80000010d493:	94                   	xchg   %eax,%esp
ffff80000010d494:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010d499:	2c 52                	sub    $0x52,%al
ffff80000010d49b:	52                   	push   %rdx
ffff80000010d49c:	92                   	xchg   %eax,%edx
ffff80000010d49d:	8c 00                	mov    %es,(%rax)
ffff80000010d49f:	00 00                	add    %al,(%rax)
ffff80000010d4a1:	70 88                	jo     ffff80000010d42b <system_call_table+0x15eb>
ffff80000010d4a3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010d4a9:	92                   	xchg   %eax,%edx
ffff80000010d4aa:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010d4b1:	08 10                	or     %dl,(%rax)
	...
ffff80000010d4bf:	00 02                	add    %al,(%rdx)
ffff80000010d4c1:	04 08                	add    $0x8,%al
ffff80000010d4c3:	08 10                	or     %dl,(%rax)
ffff80000010d4c5:	10 10                	adc    %dl,(%rax)
ffff80000010d4c7:	10 10                	adc    %dl,(%rax)
ffff80000010d4c9:	10 10                	adc    %dl,(%rax)
ffff80000010d4cb:	08 08                	or     %cl,(%rax)
ffff80000010d4cd:	04 02                	add    $0x2,%al
ffff80000010d4cf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010d4d5:	10 10                	adc    %dl,(%rax)
ffff80000010d4d7:	10 10                	adc    %dl,(%rax)
ffff80000010d4d9:	10 10                	adc    %dl,(%rax)
ffff80000010d4db:	20 20                	and    %ah,(%rax)
ffff80000010d4dd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d4e1:	00 00                	add    %al,(%rax)
ffff80000010d4e3:	00 00                	add    %al,(%rax)
ffff80000010d4e5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010d4eb:	10 00                	adc    %al,(%rax)
	...
ffff80000010d4f5:	10 10                	adc    %dl,(%rax)
ffff80000010d4f7:	10 fe                	adc    %bh,%dh
ffff80000010d4f9:	10 10                	adc    %dl,(%rax)
ffff80000010d4fb:	10 00                	adc    %al,(%rax)
	...
ffff80000010d509:	00 00                	add    %al,(%rax)
ffff80000010d50b:	18 18                	sbb    %bl,(%rax)
ffff80000010d50d:	08 08                	or     %cl,(%rax)
ffff80000010d50f:	10 00                	adc    %al,(%rax)
ffff80000010d511:	00 00                	add    %al,(%rax)
ffff80000010d513:	00 00                	add    %al,(%rax)
ffff80000010d515:	00 00                	add    %al,(%rax)
ffff80000010d517:	00 fe                	add    %bh,%dh
	...
ffff80000010d529:	00 00                	add    %al,(%rax)
ffff80000010d52b:	00 18                	add    %bl,(%rax)
ffff80000010d52d:	18 00                	sbb    %al,(%rax)
ffff80000010d52f:	00 02                	add    %al,(%rdx)
ffff80000010d531:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010d534:	08 08                	or     %cl,(%rax)
ffff80000010d536:	08 10                	or     %dl,(%rax)
ffff80000010d538:	10 20                	adc    %ah,(%rax)
ffff80000010d53a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d53d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010d544:	42 
ffff80000010d545:	42                   	rex.X
ffff80000010d546:	42                   	rex.X
ffff80000010d547:	42                   	rex.X
ffff80000010d548:	42                   	rex.X
ffff80000010d549:	42                   	rex.X
ffff80000010d54a:	42 24 24             	rex.X and $0x24,%al
ffff80000010d54d:	18 00                	sbb    %al,(%rax)
ffff80000010d54f:	00 00                	add    %al,(%rax)
ffff80000010d551:	08 18                	or     %bl,(%rax)
ffff80000010d553:	28 08                	sub    %cl,(%rax)
ffff80000010d555:	08 08                	or     %cl,(%rax)
ffff80000010d557:	08 08                	or     %cl,(%rax)
ffff80000010d559:	08 08                	or     %cl,(%rax)
ffff80000010d55b:	08 08                	or     %cl,(%rax)
ffff80000010d55d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010d560:	00 18                	add    %bl,(%rax)
ffff80000010d562:	24 42                	and    $0x42,%al
ffff80000010d564:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010d568:	10 20                	adc    %ah,(%rax)
ffff80000010d56a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d56d:	7e 00                	jle    ffff80000010d56f <system_call_table+0x172f>
ffff80000010d56f:	00 00                	add    %al,(%rax)
ffff80000010d571:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010d574:	02 02                	add    (%rdx),%al
ffff80000010d576:	04 18                	add    $0x18,%al
ffff80000010d578:	04 02                	add    $0x2,%al
ffff80000010d57a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010d57d:	18 00                	sbb    %al,(%rax)
ffff80000010d57f:	00 00                	add    %al,(%rax)
ffff80000010d581:	0c 0c                	or     $0xc,%al
ffff80000010d583:	0c 14                	or     $0x14,%al
ffff80000010d585:	14 14                	adc    $0x14,%al
ffff80000010d587:	24 24                	and    $0x24,%al
ffff80000010d589:	44 7e 04             	rex.R jle ffff80000010d590 <system_call_table+0x1750>
ffff80000010d58c:	04 1e                	add    $0x1e,%al
ffff80000010d58e:	00 00                	add    %al,(%rax)
ffff80000010d590:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010d594:	40 58                	rex pop %rax
ffff80000010d596:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010d599:	02 02                	add    (%rdx),%al
ffff80000010d59b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d59e:	00 00                	add    %al,(%rax)
ffff80000010d5a0:	00 18                	add    %bl,(%rax)
ffff80000010d5a2:	24 42                	and    $0x42,%al
ffff80000010d5a4:	40 58                	rex pop %rax
ffff80000010d5a6:	64 42                	fs rex.X
ffff80000010d5a8:	42                   	rex.X
ffff80000010d5a9:	42                   	rex.X
ffff80000010d5aa:	42                   	rex.X
ffff80000010d5ab:	42 24 18             	rex.X and $0x18,%al
ffff80000010d5ae:	00 00                	add    %al,(%rax)
ffff80000010d5b0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010d5b3:	42 04 04             	rex.X add $0x4,%al
ffff80000010d5b6:	08 08                	or     %cl,(%rax)
ffff80000010d5b8:	08 10                	or     %dl,(%rax)
ffff80000010d5ba:	10 10                	adc    %dl,(%rax)
ffff80000010d5bc:	10 38                	adc    %bh,(%rax)
ffff80000010d5be:	00 00                	add    %al,(%rax)
ffff80000010d5c0:	00 18                	add    %bl,(%rax)
ffff80000010d5c2:	24 42                	and    $0x42,%al
ffff80000010d5c4:	42                   	rex.X
ffff80000010d5c5:	42 24 18             	rex.X and $0x18,%al
ffff80000010d5c8:	24 42                	and    $0x42,%al
ffff80000010d5ca:	42                   	rex.X
ffff80000010d5cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d5ce:	00 00                	add    %al,(%rax)
ffff80000010d5d0:	00 18                	add    %bl,(%rax)
ffff80000010d5d2:	24 42                	and    $0x42,%al
ffff80000010d5d4:	42                   	rex.X
ffff80000010d5d5:	42                   	rex.X
ffff80000010d5d6:	42                   	rex.X
ffff80000010d5d7:	42                   	rex.X
ffff80000010d5d8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010d5db:	42 24 18             	rex.X and $0x18,%al
ffff80000010d5de:	00 00                	add    %al,(%rax)
ffff80000010d5e0:	00 00                	add    %al,(%rax)
ffff80000010d5e2:	00 00                	add    %al,(%rax)
ffff80000010d5e4:	00 18                	add    %bl,(%rax)
ffff80000010d5e6:	18 00                	sbb    %al,(%rax)
ffff80000010d5e8:	00 00                	add    %al,(%rax)
ffff80000010d5ea:	00 00                	add    %al,(%rax)
ffff80000010d5ec:	18 18                	sbb    %bl,(%rax)
ffff80000010d5ee:	00 00                	add    %al,(%rax)
ffff80000010d5f0:	00 00                	add    %al,(%rax)
ffff80000010d5f2:	00 00                	add    %al,(%rax)
ffff80000010d5f4:	00 18                	add    %bl,(%rax)
ffff80000010d5f6:	18 00                	sbb    %al,(%rax)
ffff80000010d5f8:	00 00                	add    %al,(%rax)
ffff80000010d5fa:	00 18                	add    %bl,(%rax)
ffff80000010d5fc:	18 08                	sbb    %cl,(%rax)
ffff80000010d5fe:	08 10                	or     %dl,(%rax)
ffff80000010d600:	00 02                	add    %al,(%rdx)
ffff80000010d602:	04 08                	add    $0x8,%al
ffff80000010d604:	10 20                	adc    %ah,(%rax)
ffff80000010d606:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010d60d:	04 
ffff80000010d60e:	02 00                	add    (%rax),%al
ffff80000010d610:	00 00                	add    %al,(%rax)
ffff80000010d612:	00 00                	add    %al,(%rax)
ffff80000010d614:	00 00                	add    %al,(%rax)
ffff80000010d616:	fe 00                	incb   (%rax)
ffff80000010d618:	00 fe                	add    %bh,%dh
ffff80000010d61a:	00 00                	add    %al,(%rax)
ffff80000010d61c:	00 00                	add    %al,(%rax)
ffff80000010d61e:	00 00                	add    %al,(%rax)
ffff80000010d620:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010d626:	04 02                	add    $0x2,%al
ffff80000010d628:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010d62b:	10 20                	adc    %ah,(%rax)
ffff80000010d62d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d631:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d635:	82                   	(bad)  
ffff80000010d636:	04 08                	add    $0x8,%al
ffff80000010d638:	10 10                	adc    %dl,(%rax)
ffff80000010d63a:	00 00                	add    %al,(%rax)
ffff80000010d63c:	18 18                	sbb    %bl,(%rax)
ffff80000010d63e:	00 00                	add    %al,(%rax)
ffff80000010d640:	00 38                	add    %bh,(%rax)
ffff80000010d642:	44 82                	rex.R (bad) 
ffff80000010d644:	9a                   	(bad)  
ffff80000010d645:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d646:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d647:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d648:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d649:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d64a:	9c                   	pushfq 
ffff80000010d64b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010d64f:	00 00                	add    %al,(%rax)
ffff80000010d651:	18 18                	sbb    %bl,(%rax)
ffff80000010d653:	18 18                	sbb    %bl,(%rax)
ffff80000010d655:	24 24                	and    $0x24,%al
ffff80000010d657:	24 24                	and    $0x24,%al
ffff80000010d659:	7e 42                	jle    ffff80000010d69d <system_call_table+0x185d>
ffff80000010d65b:	42                   	rex.X
ffff80000010d65c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d65f:	00 00                	add    %al,(%rax)
ffff80000010d661:	f0 48                	lock rex.W
ffff80000010d663:	44                   	rex.R
ffff80000010d664:	44                   	rex.R
ffff80000010d665:	44                   	rex.R
ffff80000010d666:	48 78 44             	rex.W js ffff80000010d6ad <system_call_table+0x186d>
ffff80000010d669:	42                   	rex.X
ffff80000010d66a:	42                   	rex.X
ffff80000010d66b:	42                   	rex.X
ffff80000010d66c:	44 f8                	rex.R clc 
ffff80000010d66e:	00 00                	add    %al,(%rax)
ffff80000010d670:	00 3a                	add    %bh,(%rdx)
ffff80000010d672:	46                   	rex.RX
ffff80000010d673:	42 82                	rex.X (bad) 
ffff80000010d675:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010d67c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d67f:	00 00                	add    %al,(%rax)
ffff80000010d681:	f8                   	clc    
ffff80000010d682:	44                   	rex.R
ffff80000010d683:	44                   	rex.R
ffff80000010d684:	42                   	rex.X
ffff80000010d685:	42                   	rex.X
ffff80000010d686:	42                   	rex.X
ffff80000010d687:	42                   	rex.X
ffff80000010d688:	42                   	rex.X
ffff80000010d689:	42                   	rex.X
ffff80000010d68a:	42                   	rex.X
ffff80000010d68b:	44                   	rex.R
ffff80000010d68c:	44 f8                	rex.R clc 
ffff80000010d68e:	00 00                	add    %al,(%rax)
ffff80000010d690:	00 fe                	add    %bh,%dh
ffff80000010d692:	42                   	rex.X
ffff80000010d693:	42                   	rex.X
ffff80000010d694:	40                   	rex
ffff80000010d695:	40                   	rex
ffff80000010d696:	44 7c 44             	rex.R jl ffff80000010d6dd <system_call_table+0x189d>
ffff80000010d699:	40                   	rex
ffff80000010d69a:	40                   	rex
ffff80000010d69b:	42                   	rex.X
ffff80000010d69c:	42 fe 00             	rex.X incb (%rax)
ffff80000010d69f:	00 00                	add    %al,(%rax)
ffff80000010d6a1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010d6a4:	40                   	rex
ffff80000010d6a5:	40                   	rex
ffff80000010d6a6:	44 7c 44             	rex.R jl ffff80000010d6ed <system_call_table+0x18ad>
ffff80000010d6a9:	44                   	rex.R
ffff80000010d6aa:	40                   	rex
ffff80000010d6ab:	40                   	rex
ffff80000010d6ac:	40                   	rex
ffff80000010d6ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010d6b0:	00 3a                	add    %bh,(%rdx)
ffff80000010d6b2:	46                   	rex.RX
ffff80000010d6b3:	42 82                	rex.X (bad) 
ffff80000010d6b5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010d6bc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010d6bf:	00 00                	add    %al,(%rax)
ffff80000010d6c1:	e7 42                	out    %eax,$0x42
ffff80000010d6c3:	42                   	rex.X
ffff80000010d6c4:	42                   	rex.X
ffff80000010d6c5:	42                   	rex.X
ffff80000010d6c6:	42 7e 42             	rex.X jle ffff80000010d70b <system_call_table+0x18cb>
ffff80000010d6c9:	42                   	rex.X
ffff80000010d6ca:	42                   	rex.X
ffff80000010d6cb:	42                   	rex.X
ffff80000010d6cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d6cf:	00 00                	add    %al,(%rax)
ffff80000010d6d1:	7c 10                	jl     ffff80000010d6e3 <system_call_table+0x18a3>
ffff80000010d6d3:	10 10                	adc    %dl,(%rax)
ffff80000010d6d5:	10 10                	adc    %dl,(%rax)
ffff80000010d6d7:	10 10                	adc    %dl,(%rax)
ffff80000010d6d9:	10 10                	adc    %dl,(%rax)
ffff80000010d6db:	10 10                	adc    %dl,(%rax)
ffff80000010d6dd:	7c 00                	jl     ffff80000010d6df <system_call_table+0x189f>
ffff80000010d6df:	00 00                	add    %al,(%rax)
ffff80000010d6e1:	1f                   	(bad)  
ffff80000010d6e2:	04 04                	add    $0x4,%al
ffff80000010d6e4:	04 04                	add    $0x4,%al
ffff80000010d6e6:	04 04                	add    $0x4,%al
ffff80000010d6e8:	04 04                	add    $0x4,%al
ffff80000010d6ea:	04 04                	add    $0x4,%al
ffff80000010d6ec:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010d6ef:	00 00                	add    %al,(%rax)
ffff80000010d6f1:	e7 42                	out    %eax,$0x42
ffff80000010d6f3:	44                   	rex.R
ffff80000010d6f4:	48 50                	rex.W push %rax
ffff80000010d6f6:	50                   	push   %rax
ffff80000010d6f7:	60                   	(bad)  
ffff80000010d6f8:	50                   	push   %rax
ffff80000010d6f9:	50                   	push   %rax
ffff80000010d6fa:	48                   	rex.W
ffff80000010d6fb:	44                   	rex.R
ffff80000010d6fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d6ff:	00 00                	add    %al,(%rax)
ffff80000010d701:	f0 40                	lock rex
ffff80000010d703:	40                   	rex
ffff80000010d704:	40                   	rex
ffff80000010d705:	40                   	rex
ffff80000010d706:	40                   	rex
ffff80000010d707:	40                   	rex
ffff80000010d708:	40                   	rex
ffff80000010d709:	40                   	rex
ffff80000010d70a:	40                   	rex
ffff80000010d70b:	42                   	rex.X
ffff80000010d70c:	42 fe 00             	rex.X incb (%rax)
ffff80000010d70f:	00 00                	add    %al,(%rax)
ffff80000010d711:	c3                   	retq   
ffff80000010d712:	42                   	rex.X
ffff80000010d713:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010d717:	5a                   	pop    %rdx
ffff80000010d718:	5a                   	pop    %rdx
ffff80000010d719:	42                   	rex.X
ffff80000010d71a:	42                   	rex.X
ffff80000010d71b:	42                   	rex.X
ffff80000010d71c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d71f:	00 00                	add    %al,(%rax)
ffff80000010d721:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010d728:	4a                   	rex.WX
ffff80000010d729:	4a                   	rex.WX
ffff80000010d72a:	4a                   	rex.WX
ffff80000010d72b:	46                   	rex.RX
ffff80000010d72c:	46 e2 00             	rex.RX loop ffff80000010d72f <system_call_table+0x18ef>
ffff80000010d72f:	00 00                	add    %al,(%rax)
ffff80000010d731:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d735:	82                   	(bad)  
ffff80000010d736:	82                   	(bad)  
ffff80000010d737:	82                   	(bad)  
ffff80000010d738:	82                   	(bad)  
ffff80000010d739:	82                   	(bad)  
ffff80000010d73a:	82                   	(bad)  
ffff80000010d73b:	82                   	(bad)  
ffff80000010d73c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d73f:	00 00                	add    %al,(%rax)
ffff80000010d741:	f8                   	clc    
ffff80000010d742:	44                   	rex.R
ffff80000010d743:	42                   	rex.X
ffff80000010d744:	42                   	rex.X
ffff80000010d745:	42                   	rex.X
ffff80000010d746:	44 78 40             	rex.R js ffff80000010d789 <system_call_table+0x1949>
ffff80000010d749:	40                   	rex
ffff80000010d74a:	40                   	rex
ffff80000010d74b:	40                   	rex
ffff80000010d74c:	40                   	rex
ffff80000010d74d:	f0 00 00             	lock add %al,(%rax)
ffff80000010d750:	00 38                	add    %bh,(%rax)
ffff80000010d752:	44 82                	rex.R (bad) 
ffff80000010d754:	82                   	(bad)  
ffff80000010d755:	82                   	(bad)  
ffff80000010d756:	82                   	(bad)  
ffff80000010d757:	82                   	(bad)  
ffff80000010d758:	82                   	(bad)  
ffff80000010d759:	82                   	(bad)  
ffff80000010d75a:	92                   	xchg   %eax,%edx
ffff80000010d75b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010d75f:	00 00                	add    %al,(%rax)
ffff80000010d761:	fc                   	cld    
ffff80000010d762:	42                   	rex.X
ffff80000010d763:	42                   	rex.X
ffff80000010d764:	42                   	rex.X
ffff80000010d765:	42 7c 44             	rex.X jl ffff80000010d7ac <system_call_table+0x196c>
ffff80000010d768:	42                   	rex.X
ffff80000010d769:	42                   	rex.X
ffff80000010d76a:	42                   	rex.X
ffff80000010d76b:	42                   	rex.X
ffff80000010d76c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d76f:	00 00                	add    %al,(%rax)
ffff80000010d771:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010d774:	82                   	(bad)  
ffff80000010d775:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010d779:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010d77f:	00 00                	add    %al,(%rax)
ffff80000010d781:	fe                   	(bad)  
ffff80000010d782:	92                   	xchg   %eax,%edx
ffff80000010d783:	92                   	xchg   %eax,%edx
ffff80000010d784:	10 10                	adc    %dl,(%rax)
ffff80000010d786:	10 10                	adc    %dl,(%rax)
ffff80000010d788:	10 10                	adc    %dl,(%rax)
ffff80000010d78a:	10 10                	adc    %dl,(%rax)
ffff80000010d78c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010d790:	00 e7                	add    %ah,%bh
ffff80000010d792:	42                   	rex.X
ffff80000010d793:	42                   	rex.X
ffff80000010d794:	42                   	rex.X
ffff80000010d795:	42                   	rex.X
ffff80000010d796:	42                   	rex.X
ffff80000010d797:	42                   	rex.X
ffff80000010d798:	42                   	rex.X
ffff80000010d799:	42                   	rex.X
ffff80000010d79a:	42                   	rex.X
ffff80000010d79b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010d79e:	00 00                	add    %al,(%rax)
ffff80000010d7a0:	00 e7                	add    %ah,%bh
ffff80000010d7a2:	42                   	rex.X
ffff80000010d7a3:	42                   	rex.X
ffff80000010d7a4:	42                   	rex.X
ffff80000010d7a5:	42 24 24             	rex.X and $0x24,%al
ffff80000010d7a8:	24 24                	and    $0x24,%al
ffff80000010d7aa:	18 18                	sbb    %bl,(%rax)
ffff80000010d7ac:	18 18                	sbb    %bl,(%rax)
ffff80000010d7ae:	00 00                	add    %al,(%rax)
ffff80000010d7b0:	00 e7                	add    %ah,%bh
ffff80000010d7b2:	42                   	rex.X
ffff80000010d7b3:	42                   	rex.X
ffff80000010d7b4:	42 5a                	rex.X pop %rdx
ffff80000010d7b6:	5a                   	pop    %rdx
ffff80000010d7b7:	5a                   	pop    %rdx
ffff80000010d7b8:	5a                   	pop    %rdx
ffff80000010d7b9:	24 24                	and    $0x24,%al
ffff80000010d7bb:	24 24                	and    $0x24,%al
ffff80000010d7bd:	24 00                	and    $0x0,%al
ffff80000010d7bf:	00 00                	add    %al,(%rax)
ffff80000010d7c1:	e7 42                	out    %eax,$0x42
ffff80000010d7c3:	42 24 24             	rex.X and $0x24,%al
ffff80000010d7c6:	24 18                	and    $0x18,%al
ffff80000010d7c8:	24 24                	and    $0x24,%al
ffff80000010d7ca:	24 42                	and    $0x42,%al
ffff80000010d7cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d7cf:	00 00                	add    %al,(%rax)
ffff80000010d7d1:	ee                   	out    %al,(%dx)
ffff80000010d7d2:	44                   	rex.R
ffff80000010d7d3:	44                   	rex.R
ffff80000010d7d4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010d7d7:	28 10                	sub    %dl,(%rax)
ffff80000010d7d9:	10 10                	adc    %dl,(%rax)
ffff80000010d7db:	10 10                	adc    %dl,(%rax)
ffff80000010d7dd:	7c 00                	jl     ffff80000010d7df <system_call_table+0x199f>
ffff80000010d7df:	00 00                	add    %al,(%rax)
ffff80000010d7e1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010d7e8:	20 20                	and    %ah,(%rax)
ffff80000010d7ea:	40                   	rex
ffff80000010d7eb:	42 82                	rex.X (bad) 
ffff80000010d7ed:	fe 00                	incb   (%rax)
ffff80000010d7ef:	00 00                	add    %al,(%rax)
ffff80000010d7f1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010d7f4:	20 20                	and    %ah,(%rax)
ffff80000010d7f6:	20 20                	and    %ah,(%rax)
ffff80000010d7f8:	20 20                	and    %ah,(%rax)
ffff80000010d7fa:	20 20                	and    %ah,(%rax)
ffff80000010d7fc:	20 20                	and    %ah,(%rax)
ffff80000010d7fe:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010d805:	20 20                	and    %ah,(%rax)
ffff80000010d807:	10 10                	adc    %dl,(%rax)
ffff80000010d809:	08 08                	or     %cl,(%rax)
ffff80000010d80b:	04 04                	add    $0x4,%al
ffff80000010d80d:	04 02                	add    $0x2,%al
ffff80000010d80f:	02 00                	add    (%rax),%al
ffff80000010d811:	7c 04                	jl     ffff80000010d817 <system_call_table+0x19d7>
ffff80000010d813:	04 04                	add    $0x4,%al
ffff80000010d815:	04 04                	add    $0x4,%al
ffff80000010d817:	04 04                	add    $0x4,%al
ffff80000010d819:	04 04                	add    $0x4,%al
ffff80000010d81b:	04 04                	add    $0x4,%al
ffff80000010d81d:	04 7c                	add    $0x7c,%al
ffff80000010d81f:	00 00                	add    %al,(%rax)
ffff80000010d821:	10 28                	adc    %ch,(%rax)
ffff80000010d823:	44 82                	rex.R (bad) 
	...
ffff80000010d83d:	00 fe                	add    %bh,%dh
ffff80000010d83f:	00 10                	add    %dl,(%rax)
ffff80000010d841:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010d854:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010d857:	04 3c                	add    $0x3c,%al
ffff80000010d859:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010d860:	c0 
ffff80000010d861:	40                   	rex
ffff80000010d862:	40                   	rex
ffff80000010d863:	40                   	rex
ffff80000010d864:	40 58                	rex pop %rax
ffff80000010d866:	64 42                	fs rex.X
ffff80000010d868:	42                   	rex.X
ffff80000010d869:	42                   	rex.X
ffff80000010d86a:	42                   	rex.X
ffff80000010d86b:	42                   	rex.X
ffff80000010d86c:	64 58                	fs pop %rax
ffff80000010d86e:	00 00                	add    %al,(%rax)
ffff80000010d870:	00 00                	add    %al,(%rax)
ffff80000010d872:	00 00                	add    %al,(%rax)
ffff80000010d874:	00 30                	add    %dh,(%rax)
ffff80000010d876:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010d87d:	38 
ffff80000010d87e:	00 00                	add    %al,(%rax)
ffff80000010d880:	0c 04                	or     $0x4,%al
ffff80000010d882:	04 04                	add    $0x4,%al
ffff80000010d884:	04 34                	add    $0x34,%al
ffff80000010d886:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010d88d:	36 
ffff80000010d88e:	00 00                	add    %al,(%rax)
ffff80000010d890:	00 00                	add    %al,(%rax)
ffff80000010d892:	00 00                	add    %al,(%rax)
ffff80000010d894:	00 38                	add    %bh,(%rax)
ffff80000010d896:	44 82                	rex.R (bad) 
ffff80000010d898:	82                   	(bad)  
ffff80000010d899:	fc                   	cld    
ffff80000010d89a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010d8a1:	10 10                	adc    %dl,(%rax)
ffff80000010d8a3:	10 10                	adc    %dl,(%rax)
ffff80000010d8a5:	7c 10                	jl     ffff80000010d8b7 <system_call_table+0x1a77>
ffff80000010d8a7:	10 10                	adc    %dl,(%rax)
ffff80000010d8a9:	10 10                	adc    %dl,(%rax)
ffff80000010d8ab:	10 10                	adc    %dl,(%rax)
ffff80000010d8ad:	7c 00                	jl     ffff80000010d8af <system_call_table+0x1a6f>
ffff80000010d8af:	00 00                	add    %al,(%rax)
ffff80000010d8b1:	00 00                	add    %al,(%rax)
ffff80000010d8b3:	00 00                	add    %al,(%rax)
ffff80000010d8b5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010d8bc:	34 04 
ffff80000010d8be:	04 38                	add    $0x38,%al
ffff80000010d8c0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010d8c4:	40 58                	rex pop %rax
ffff80000010d8c6:	64 42                	fs rex.X
ffff80000010d8c8:	42                   	rex.X
ffff80000010d8c9:	42                   	rex.X
ffff80000010d8ca:	42                   	rex.X
ffff80000010d8cb:	42                   	rex.X
ffff80000010d8cc:	42 e3 00             	rex.X jrcxz ffff80000010d8cf <system_call_table+0x1a8f>
ffff80000010d8cf:	00 00                	add    %al,(%rax)
ffff80000010d8d1:	10 10                	adc    %dl,(%rax)
ffff80000010d8d3:	00 00                	add    %al,(%rax)
ffff80000010d8d5:	30 10                	xor    %dl,(%rax)
ffff80000010d8d7:	10 10                	adc    %dl,(%rax)
ffff80000010d8d9:	10 10                	adc    %dl,(%rax)
ffff80000010d8db:	10 10                	adc    %dl,(%rax)
ffff80000010d8dd:	38 00                	cmp    %al,(%rax)
ffff80000010d8df:	00 00                	add    %al,(%rax)
ffff80000010d8e1:	04 04                	add    $0x4,%al
ffff80000010d8e3:	00 00                	add    %al,(%rax)
ffff80000010d8e5:	0c 04                	or     $0x4,%al
ffff80000010d8e7:	04 04                	add    $0x4,%al
ffff80000010d8e9:	04 04                	add    $0x4,%al
ffff80000010d8eb:	04 04                	add    $0x4,%al
ffff80000010d8ed:	08 08                	or     %cl,(%rax)
ffff80000010d8ef:	30 c0                	xor    %al,%al
ffff80000010d8f1:	40                   	rex
ffff80000010d8f2:	40                   	rex
ffff80000010d8f3:	40                   	rex
ffff80000010d8f4:	40                   	rex
ffff80000010d8f5:	4e                   	rex.WRX
ffff80000010d8f6:	44                   	rex.R
ffff80000010d8f7:	48 50                	rex.W push %rax
ffff80000010d8f9:	60                   	(bad)  
ffff80000010d8fa:	50                   	push   %rax
ffff80000010d8fb:	48                   	rex.W
ffff80000010d8fc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010d8ff:	00 30                	add    %dh,(%rax)
ffff80000010d901:	10 10                	adc    %dl,(%rax)
ffff80000010d903:	10 10                	adc    %dl,(%rax)
ffff80000010d905:	10 10                	adc    %dl,(%rax)
ffff80000010d907:	10 10                	adc    %dl,(%rax)
ffff80000010d909:	10 10                	adc    %dl,(%rax)
ffff80000010d90b:	10 10                	adc    %dl,(%rax)
ffff80000010d90d:	38 00                	cmp    %al,(%rax)
ffff80000010d90f:	00 00                	add    %al,(%rax)
ffff80000010d911:	00 00                	add    %al,(%rax)
ffff80000010d913:	00 00                	add    %al,(%rax)
ffff80000010d915:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010d919:	49                   	rex.WB
ffff80000010d91a:	49                   	rex.WB
ffff80000010d91b:	49                   	rex.WB
ffff80000010d91c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010d91f:	00 00                	add    %al,(%rax)
ffff80000010d921:	00 00                	add    %al,(%rax)
ffff80000010d923:	00 00                	add    %al,(%rax)
ffff80000010d925:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010d929:	42                   	rex.X
ffff80000010d92a:	42                   	rex.X
ffff80000010d92b:	42                   	rex.X
ffff80000010d92c:	42 e3 00             	rex.X jrcxz ffff80000010d92f <system_call_table+0x1aef>
ffff80000010d92f:	00 00                	add    %al,(%rax)
ffff80000010d931:	00 00                	add    %al,(%rax)
ffff80000010d933:	00 00                	add    %al,(%rax)
ffff80000010d935:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d939:	82                   	(bad)  
ffff80000010d93a:	82                   	(bad)  
ffff80000010d93b:	82                   	(bad)  
ffff80000010d93c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d93f:	00 00                	add    %al,(%rax)
ffff80000010d941:	00 00                	add    %al,(%rax)
ffff80000010d943:	00 d8                	add    %bl,%al
ffff80000010d945:	64 42                	fs rex.X
ffff80000010d947:	42                   	rex.X
ffff80000010d948:	42                   	rex.X
ffff80000010d949:	42                   	rex.X
ffff80000010d94a:	42                   	rex.X
ffff80000010d94b:	64 58                	fs pop %rax
ffff80000010d94d:	40                   	rex
ffff80000010d94e:	40 e0 00             	rex loopne ffff80000010d951 <system_call_table+0x1b11>
ffff80000010d951:	00 00                	add    %al,(%rax)
ffff80000010d953:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010d956:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010d95d:	04 04                	add    $0x4,%al
ffff80000010d95f:	0e                   	(bad)  
ffff80000010d960:	00 00                	add    %al,(%rax)
ffff80000010d962:	00 00                	add    %al,(%rax)
ffff80000010d964:	00 dc                	add    %bl,%ah
ffff80000010d966:	62 42                	(bad)  
ffff80000010d968:	40                   	rex
ffff80000010d969:	40                   	rex
ffff80000010d96a:	40                   	rex
ffff80000010d96b:	40                   	rex
ffff80000010d96c:	40 e0 00             	rex loopne ffff80000010d96f <system_call_table+0x1b2f>
ffff80000010d96f:	00 00                	add    %al,(%rax)
ffff80000010d971:	00 00                	add    %al,(%rax)
ffff80000010d973:	00 00                	add    %al,(%rax)
ffff80000010d975:	7a 86                	jp     ffff80000010d8fd <system_call_table+0x1abd>
ffff80000010d977:	82                   	(bad)  
ffff80000010d978:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010d97b:	82                   	(bad)  
ffff80000010d97c:	c2 bc 00             	retq   $0xbc
ffff80000010d97f:	00 00                	add    %al,(%rax)
ffff80000010d981:	00 10                	add    %dl,(%rax)
ffff80000010d983:	10 10                	adc    %dl,(%rax)
ffff80000010d985:	7c 10                	jl     ffff80000010d997 <system_call_table+0x1b57>
ffff80000010d987:	10 10                	adc    %dl,(%rax)
ffff80000010d989:	10 10                	adc    %dl,(%rax)
ffff80000010d98b:	10 10                	adc    %dl,(%rax)
ffff80000010d98d:	0e                   	(bad)  
ffff80000010d98e:	00 00                	add    %al,(%rax)
ffff80000010d990:	00 00                	add    %al,(%rax)
ffff80000010d992:	00 00                	add    %al,(%rax)
ffff80000010d994:	00 c6                	add    %al,%dh
ffff80000010d996:	42                   	rex.X
ffff80000010d997:	42                   	rex.X
ffff80000010d998:	42                   	rex.X
ffff80000010d999:	42                   	rex.X
ffff80000010d99a:	42                   	rex.X
ffff80000010d99b:	42                   	rex.X
ffff80000010d99c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010d99f:	00 00                	add    %al,(%rax)
ffff80000010d9a1:	00 00                	add    %al,(%rax)
ffff80000010d9a3:	00 00                	add    %al,(%rax)
ffff80000010d9a5:	e7 42                	out    %eax,$0x42
ffff80000010d9a7:	42                   	rex.X
ffff80000010d9a8:	42 24 24             	rex.X and $0x24,%al
ffff80000010d9ab:	24 18                	and    $0x18,%al
ffff80000010d9ad:	18 00                	sbb    %al,(%rax)
ffff80000010d9af:	00 00                	add    %al,(%rax)
ffff80000010d9b1:	00 00                	add    %al,(%rax)
ffff80000010d9b3:	00 00                	add    %al,(%rax)
ffff80000010d9b5:	e7 42                	out    %eax,$0x42
ffff80000010d9b7:	42 5a                	rex.X pop %rdx
ffff80000010d9b9:	5a                   	pop    %rdx
ffff80000010d9ba:	5a                   	pop    %rdx
ffff80000010d9bb:	24 24                	and    $0x24,%al
ffff80000010d9bd:	24 00                	and    $0x0,%al
ffff80000010d9bf:	00 00                	add    %al,(%rax)
ffff80000010d9c1:	00 00                	add    %al,(%rax)
ffff80000010d9c3:	00 00                	add    %al,(%rax)
ffff80000010d9c5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010d9ca:	28 28                	sub    %ch,(%rax)
ffff80000010d9cc:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010d9d0:	00 00                	add    %al,(%rax)
ffff80000010d9d2:	00 00                	add    %al,(%rax)
ffff80000010d9d4:	00 e7                	add    %ah,%bh
ffff80000010d9d6:	42                   	rex.X
ffff80000010d9d7:	42 24 24             	rex.X and $0x24,%al
ffff80000010d9da:	24 18                	and    $0x18,%al
ffff80000010d9dc:	18 10                	sbb    %dl,(%rax)
ffff80000010d9de:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010d9e1:	00 00                	add    %al,(%rax)
ffff80000010d9e3:	00 00                	add    %al,(%rax)
ffff80000010d9e5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010d9eb:	42 82                	rex.X (bad) 
ffff80000010d9ed:	fe 00                	incb   (%rax)
ffff80000010d9ef:	00 00                	add    %al,(%rax)
ffff80000010d9f1:	06                   	(bad)  
ffff80000010d9f2:	08 10                	or     %dl,(%rax)
ffff80000010d9f4:	10 10                	adc    %dl,(%rax)
ffff80000010d9f6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010d9f9:	10 10                	adc    %dl,(%rax)
ffff80000010d9fb:	10 08                	adc    %cl,(%rax)
ffff80000010d9fd:	06                   	(bad)  
ffff80000010d9fe:	00 00                	add    %al,(%rax)
ffff80000010da00:	10 10                	adc    %dl,(%rax)
ffff80000010da02:	10 10                	adc    %dl,(%rax)
ffff80000010da04:	10 10                	adc    %dl,(%rax)
ffff80000010da06:	10 10                	adc    %dl,(%rax)
ffff80000010da08:	10 10                	adc    %dl,(%rax)
ffff80000010da0a:	10 10                	adc    %dl,(%rax)
ffff80000010da0c:	10 10                	adc    %dl,(%rax)
ffff80000010da0e:	10 10                	adc    %dl,(%rax)
ffff80000010da10:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010da13:	08 08                	or     %cl,(%rax)
ffff80000010da15:	08 08                	or     %cl,(%rax)
ffff80000010da17:	06                   	(bad)  
ffff80000010da18:	08 08                	or     %cl,(%rax)
ffff80000010da1a:	08 08                	or     %cl,(%rax)
ffff80000010da1c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010da1f:	00 00                	add    %al,(%rax)
ffff80000010da21:	72 8c                	jb     ffff80000010d9af <system_call_table+0x1b6f>
	...
ffff80000010e44f:	00 00                	add    %al,(%rax)
ffff80000010e451:	10 10                	adc    %dl,(%rax)
ffff80000010e453:	10 10                	adc    %dl,(%rax)
ffff80000010e455:	10 10                	adc    %dl,(%rax)
ffff80000010e457:	10 10                	adc    %dl,(%rax)
ffff80000010e459:	10 00                	adc    %al,(%rax)
ffff80000010e45b:	00 10                	add    %dl,(%rax)
ffff80000010e45d:	10 00                	adc    %al,(%rax)
ffff80000010e45f:	00 28                	add    %ch,(%rax)
ffff80000010e461:	28 28                	sub    %ch,(%rax)
	...
ffff80000010e46f:	00 00                	add    %al,(%rax)
ffff80000010e471:	44                   	rex.R
ffff80000010e472:	44                   	rex.R
ffff80000010e473:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e478:	44                   	rex.R
ffff80000010e479:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e47e:	00 00                	add    %al,(%rax)
ffff80000010e480:	10 3a                	adc    %bh,(%rdx)
ffff80000010e482:	56                   	push   %rsi
ffff80000010e483:	92                   	xchg   %eax,%edx
ffff80000010e484:	92                   	xchg   %eax,%edx
ffff80000010e485:	90                   	nop
ffff80000010e486:	50                   	push   %rax
ffff80000010e487:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010e48a:	92                   	xchg   %eax,%edx
ffff80000010e48b:	92                   	xchg   %eax,%edx
ffff80000010e48c:	d4                   	(bad)  
ffff80000010e48d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010e492:	94                   	xchg   %eax,%esp
ffff80000010e493:	94                   	xchg   %eax,%esp
ffff80000010e494:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010e499:	2c 52                	sub    $0x52,%al
ffff80000010e49b:	52                   	push   %rdx
ffff80000010e49c:	92                   	xchg   %eax,%edx
ffff80000010e49d:	8c 00                	mov    %es,(%rax)
ffff80000010e49f:	00 00                	add    %al,(%rax)
ffff80000010e4a1:	70 88                	jo     ffff80000010e42b <system_call_table+0x25eb>
ffff80000010e4a3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010e4a9:	92                   	xchg   %eax,%edx
ffff80000010e4aa:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010e4b1:	08 10                	or     %dl,(%rax)
	...
ffff80000010e4bf:	00 02                	add    %al,(%rdx)
ffff80000010e4c1:	04 08                	add    $0x8,%al
ffff80000010e4c3:	08 10                	or     %dl,(%rax)
ffff80000010e4c5:	10 10                	adc    %dl,(%rax)
ffff80000010e4c7:	10 10                	adc    %dl,(%rax)
ffff80000010e4c9:	10 10                	adc    %dl,(%rax)
ffff80000010e4cb:	08 08                	or     %cl,(%rax)
ffff80000010e4cd:	04 02                	add    $0x2,%al
ffff80000010e4cf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010e4d5:	10 10                	adc    %dl,(%rax)
ffff80000010e4d7:	10 10                	adc    %dl,(%rax)
ffff80000010e4d9:	10 10                	adc    %dl,(%rax)
ffff80000010e4db:	20 20                	and    %ah,(%rax)
ffff80000010e4dd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e4e1:	00 00                	add    %al,(%rax)
ffff80000010e4e3:	00 00                	add    %al,(%rax)
ffff80000010e4e5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010e4eb:	10 00                	adc    %al,(%rax)
	...
ffff80000010e4f5:	10 10                	adc    %dl,(%rax)
ffff80000010e4f7:	10 fe                	adc    %bh,%dh
ffff80000010e4f9:	10 10                	adc    %dl,(%rax)
ffff80000010e4fb:	10 00                	adc    %al,(%rax)
	...
ffff80000010e509:	00 00                	add    %al,(%rax)
ffff80000010e50b:	18 18                	sbb    %bl,(%rax)
ffff80000010e50d:	08 08                	or     %cl,(%rax)
ffff80000010e50f:	10 00                	adc    %al,(%rax)
ffff80000010e511:	00 00                	add    %al,(%rax)
ffff80000010e513:	00 00                	add    %al,(%rax)
ffff80000010e515:	00 00                	add    %al,(%rax)
ffff80000010e517:	00 fe                	add    %bh,%dh
	...
ffff80000010e529:	00 00                	add    %al,(%rax)
ffff80000010e52b:	00 18                	add    %bl,(%rax)
ffff80000010e52d:	18 00                	sbb    %al,(%rax)
ffff80000010e52f:	00 02                	add    %al,(%rdx)
ffff80000010e531:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010e534:	08 08                	or     %cl,(%rax)
ffff80000010e536:	08 10                	or     %dl,(%rax)
ffff80000010e538:	10 20                	adc    %ah,(%rax)
ffff80000010e53a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e53d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010e544:	42 
ffff80000010e545:	42                   	rex.X
ffff80000010e546:	42                   	rex.X
ffff80000010e547:	42                   	rex.X
ffff80000010e548:	42                   	rex.X
ffff80000010e549:	42                   	rex.X
ffff80000010e54a:	42 24 24             	rex.X and $0x24,%al
ffff80000010e54d:	18 00                	sbb    %al,(%rax)
ffff80000010e54f:	00 00                	add    %al,(%rax)
ffff80000010e551:	08 18                	or     %bl,(%rax)
ffff80000010e553:	28 08                	sub    %cl,(%rax)
ffff80000010e555:	08 08                	or     %cl,(%rax)
ffff80000010e557:	08 08                	or     %cl,(%rax)
ffff80000010e559:	08 08                	or     %cl,(%rax)
ffff80000010e55b:	08 08                	or     %cl,(%rax)
ffff80000010e55d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010e560:	00 18                	add    %bl,(%rax)
ffff80000010e562:	24 42                	and    $0x42,%al
ffff80000010e564:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010e568:	10 20                	adc    %ah,(%rax)
ffff80000010e56a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e56d:	7e 00                	jle    ffff80000010e56f <system_call_table+0x272f>
ffff80000010e56f:	00 00                	add    %al,(%rax)
ffff80000010e571:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010e574:	02 02                	add    (%rdx),%al
ffff80000010e576:	04 18                	add    $0x18,%al
ffff80000010e578:	04 02                	add    $0x2,%al
ffff80000010e57a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010e57d:	18 00                	sbb    %al,(%rax)
ffff80000010e57f:	00 00                	add    %al,(%rax)
ffff80000010e581:	0c 0c                	or     $0xc,%al
ffff80000010e583:	0c 14                	or     $0x14,%al
ffff80000010e585:	14 14                	adc    $0x14,%al
ffff80000010e587:	24 24                	and    $0x24,%al
ffff80000010e589:	44 7e 04             	rex.R jle ffff80000010e590 <system_call_table+0x2750>
ffff80000010e58c:	04 1e                	add    $0x1e,%al
ffff80000010e58e:	00 00                	add    %al,(%rax)
ffff80000010e590:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010e594:	40 58                	rex pop %rax
ffff80000010e596:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010e599:	02 02                	add    (%rdx),%al
ffff80000010e59b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e59e:	00 00                	add    %al,(%rax)
ffff80000010e5a0:	00 18                	add    %bl,(%rax)
ffff80000010e5a2:	24 42                	and    $0x42,%al
ffff80000010e5a4:	40 58                	rex pop %rax
ffff80000010e5a6:	64 42                	fs rex.X
ffff80000010e5a8:	42                   	rex.X
ffff80000010e5a9:	42                   	rex.X
ffff80000010e5aa:	42                   	rex.X
ffff80000010e5ab:	42 24 18             	rex.X and $0x18,%al
ffff80000010e5ae:	00 00                	add    %al,(%rax)
ffff80000010e5b0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010e5b3:	42 04 04             	rex.X add $0x4,%al
ffff80000010e5b6:	08 08                	or     %cl,(%rax)
ffff80000010e5b8:	08 10                	or     %dl,(%rax)
ffff80000010e5ba:	10 10                	adc    %dl,(%rax)
ffff80000010e5bc:	10 38                	adc    %bh,(%rax)
ffff80000010e5be:	00 00                	add    %al,(%rax)
ffff80000010e5c0:	00 18                	add    %bl,(%rax)
ffff80000010e5c2:	24 42                	and    $0x42,%al
ffff80000010e5c4:	42                   	rex.X
ffff80000010e5c5:	42 24 18             	rex.X and $0x18,%al
ffff80000010e5c8:	24 42                	and    $0x42,%al
ffff80000010e5ca:	42                   	rex.X
ffff80000010e5cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e5ce:	00 00                	add    %al,(%rax)
ffff80000010e5d0:	00 18                	add    %bl,(%rax)
ffff80000010e5d2:	24 42                	and    $0x42,%al
ffff80000010e5d4:	42                   	rex.X
ffff80000010e5d5:	42                   	rex.X
ffff80000010e5d6:	42                   	rex.X
ffff80000010e5d7:	42                   	rex.X
ffff80000010e5d8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010e5db:	42 24 18             	rex.X and $0x18,%al
ffff80000010e5de:	00 00                	add    %al,(%rax)
ffff80000010e5e0:	00 00                	add    %al,(%rax)
ffff80000010e5e2:	00 00                	add    %al,(%rax)
ffff80000010e5e4:	00 18                	add    %bl,(%rax)
ffff80000010e5e6:	18 00                	sbb    %al,(%rax)
ffff80000010e5e8:	00 00                	add    %al,(%rax)
ffff80000010e5ea:	00 00                	add    %al,(%rax)
ffff80000010e5ec:	18 18                	sbb    %bl,(%rax)
ffff80000010e5ee:	00 00                	add    %al,(%rax)
ffff80000010e5f0:	00 00                	add    %al,(%rax)
ffff80000010e5f2:	00 00                	add    %al,(%rax)
ffff80000010e5f4:	00 18                	add    %bl,(%rax)
ffff80000010e5f6:	18 00                	sbb    %al,(%rax)
ffff80000010e5f8:	00 00                	add    %al,(%rax)
ffff80000010e5fa:	00 18                	add    %bl,(%rax)
ffff80000010e5fc:	18 08                	sbb    %cl,(%rax)
ffff80000010e5fe:	08 10                	or     %dl,(%rax)
ffff80000010e600:	00 02                	add    %al,(%rdx)
ffff80000010e602:	04 08                	add    $0x8,%al
ffff80000010e604:	10 20                	adc    %ah,(%rax)
ffff80000010e606:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010e60d:	04 
ffff80000010e60e:	02 00                	add    (%rax),%al
ffff80000010e610:	00 00                	add    %al,(%rax)
ffff80000010e612:	00 00                	add    %al,(%rax)
ffff80000010e614:	00 00                	add    %al,(%rax)
ffff80000010e616:	fe 00                	incb   (%rax)
ffff80000010e618:	00 fe                	add    %bh,%dh
ffff80000010e61a:	00 00                	add    %al,(%rax)
ffff80000010e61c:	00 00                	add    %al,(%rax)
ffff80000010e61e:	00 00                	add    %al,(%rax)
ffff80000010e620:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010e626:	04 02                	add    $0x2,%al
ffff80000010e628:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010e62b:	10 20                	adc    %ah,(%rax)
ffff80000010e62d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e631:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e635:	82                   	(bad)  
ffff80000010e636:	04 08                	add    $0x8,%al
ffff80000010e638:	10 10                	adc    %dl,(%rax)
ffff80000010e63a:	00 00                	add    %al,(%rax)
ffff80000010e63c:	18 18                	sbb    %bl,(%rax)
ffff80000010e63e:	00 00                	add    %al,(%rax)
ffff80000010e640:	00 38                	add    %bh,(%rax)
ffff80000010e642:	44 82                	rex.R (bad) 
ffff80000010e644:	9a                   	(bad)  
ffff80000010e645:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e646:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e647:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e648:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e649:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e64a:	9c                   	pushfq 
ffff80000010e64b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010e64f:	00 00                	add    %al,(%rax)
ffff80000010e651:	18 18                	sbb    %bl,(%rax)
ffff80000010e653:	18 18                	sbb    %bl,(%rax)
ffff80000010e655:	24 24                	and    $0x24,%al
ffff80000010e657:	24 24                	and    $0x24,%al
ffff80000010e659:	7e 42                	jle    ffff80000010e69d <system_call_table+0x285d>
ffff80000010e65b:	42                   	rex.X
ffff80000010e65c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e65f:	00 00                	add    %al,(%rax)
ffff80000010e661:	f0 48                	lock rex.W
ffff80000010e663:	44                   	rex.R
ffff80000010e664:	44                   	rex.R
ffff80000010e665:	44                   	rex.R
ffff80000010e666:	48 78 44             	rex.W js ffff80000010e6ad <system_call_table+0x286d>
ffff80000010e669:	42                   	rex.X
ffff80000010e66a:	42                   	rex.X
ffff80000010e66b:	42                   	rex.X
ffff80000010e66c:	44 f8                	rex.R clc 
ffff80000010e66e:	00 00                	add    %al,(%rax)
ffff80000010e670:	00 3a                	add    %bh,(%rdx)
ffff80000010e672:	46                   	rex.RX
ffff80000010e673:	42 82                	rex.X (bad) 
ffff80000010e675:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010e67c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e67f:	00 00                	add    %al,(%rax)
ffff80000010e681:	f8                   	clc    
ffff80000010e682:	44                   	rex.R
ffff80000010e683:	44                   	rex.R
ffff80000010e684:	42                   	rex.X
ffff80000010e685:	42                   	rex.X
ffff80000010e686:	42                   	rex.X
ffff80000010e687:	42                   	rex.X
ffff80000010e688:	42                   	rex.X
ffff80000010e689:	42                   	rex.X
ffff80000010e68a:	42                   	rex.X
ffff80000010e68b:	44                   	rex.R
ffff80000010e68c:	44 f8                	rex.R clc 
ffff80000010e68e:	00 00                	add    %al,(%rax)
ffff80000010e690:	00 fe                	add    %bh,%dh
ffff80000010e692:	42                   	rex.X
ffff80000010e693:	42                   	rex.X
ffff80000010e694:	40                   	rex
ffff80000010e695:	40                   	rex
ffff80000010e696:	44 7c 44             	rex.R jl ffff80000010e6dd <system_call_table+0x289d>
ffff80000010e699:	40                   	rex
ffff80000010e69a:	40                   	rex
ffff80000010e69b:	42                   	rex.X
ffff80000010e69c:	42 fe 00             	rex.X incb (%rax)
ffff80000010e69f:	00 00                	add    %al,(%rax)
ffff80000010e6a1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010e6a4:	40                   	rex
ffff80000010e6a5:	40                   	rex
ffff80000010e6a6:	44 7c 44             	rex.R jl ffff80000010e6ed <system_call_table+0x28ad>
ffff80000010e6a9:	44                   	rex.R
ffff80000010e6aa:	40                   	rex
ffff80000010e6ab:	40                   	rex
ffff80000010e6ac:	40                   	rex
ffff80000010e6ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010e6b0:	00 3a                	add    %bh,(%rdx)
ffff80000010e6b2:	46                   	rex.RX
ffff80000010e6b3:	42 82                	rex.X (bad) 
ffff80000010e6b5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010e6bc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010e6bf:	00 00                	add    %al,(%rax)
ffff80000010e6c1:	e7 42                	out    %eax,$0x42
ffff80000010e6c3:	42                   	rex.X
ffff80000010e6c4:	42                   	rex.X
ffff80000010e6c5:	42                   	rex.X
ffff80000010e6c6:	42 7e 42             	rex.X jle ffff80000010e70b <system_call_table+0x28cb>
ffff80000010e6c9:	42                   	rex.X
ffff80000010e6ca:	42                   	rex.X
ffff80000010e6cb:	42                   	rex.X
ffff80000010e6cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e6cf:	00 00                	add    %al,(%rax)
ffff80000010e6d1:	7c 10                	jl     ffff80000010e6e3 <system_call_table+0x28a3>
ffff80000010e6d3:	10 10                	adc    %dl,(%rax)
ffff80000010e6d5:	10 10                	adc    %dl,(%rax)
ffff80000010e6d7:	10 10                	adc    %dl,(%rax)
ffff80000010e6d9:	10 10                	adc    %dl,(%rax)
ffff80000010e6db:	10 10                	adc    %dl,(%rax)
ffff80000010e6dd:	7c 00                	jl     ffff80000010e6df <system_call_table+0x289f>
ffff80000010e6df:	00 00                	add    %al,(%rax)
ffff80000010e6e1:	1f                   	(bad)  
ffff80000010e6e2:	04 04                	add    $0x4,%al
ffff80000010e6e4:	04 04                	add    $0x4,%al
ffff80000010e6e6:	04 04                	add    $0x4,%al
ffff80000010e6e8:	04 04                	add    $0x4,%al
ffff80000010e6ea:	04 04                	add    $0x4,%al
ffff80000010e6ec:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010e6ef:	00 00                	add    %al,(%rax)
ffff80000010e6f1:	e7 42                	out    %eax,$0x42
ffff80000010e6f3:	44                   	rex.R
ffff80000010e6f4:	48 50                	rex.W push %rax
ffff80000010e6f6:	50                   	push   %rax
ffff80000010e6f7:	60                   	(bad)  
ffff80000010e6f8:	50                   	push   %rax
ffff80000010e6f9:	50                   	push   %rax
ffff80000010e6fa:	48                   	rex.W
ffff80000010e6fb:	44                   	rex.R
ffff80000010e6fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e6ff:	00 00                	add    %al,(%rax)
ffff80000010e701:	f0 40                	lock rex
ffff80000010e703:	40                   	rex
ffff80000010e704:	40                   	rex
ffff80000010e705:	40                   	rex
ffff80000010e706:	40                   	rex
ffff80000010e707:	40                   	rex
ffff80000010e708:	40                   	rex
ffff80000010e709:	40                   	rex
ffff80000010e70a:	40                   	rex
ffff80000010e70b:	42                   	rex.X
ffff80000010e70c:	42 fe 00             	rex.X incb (%rax)
ffff80000010e70f:	00 00                	add    %al,(%rax)
ffff80000010e711:	c3                   	retq   
ffff80000010e712:	42                   	rex.X
ffff80000010e713:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010e717:	5a                   	pop    %rdx
ffff80000010e718:	5a                   	pop    %rdx
ffff80000010e719:	42                   	rex.X
ffff80000010e71a:	42                   	rex.X
ffff80000010e71b:	42                   	rex.X
ffff80000010e71c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e71f:	00 00                	add    %al,(%rax)
ffff80000010e721:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010e728:	4a                   	rex.WX
ffff80000010e729:	4a                   	rex.WX
ffff80000010e72a:	4a                   	rex.WX
ffff80000010e72b:	46                   	rex.RX
ffff80000010e72c:	46 e2 00             	rex.RX loop ffff80000010e72f <system_call_table+0x28ef>
ffff80000010e72f:	00 00                	add    %al,(%rax)
ffff80000010e731:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e735:	82                   	(bad)  
ffff80000010e736:	82                   	(bad)  
ffff80000010e737:	82                   	(bad)  
ffff80000010e738:	82                   	(bad)  
ffff80000010e739:	82                   	(bad)  
ffff80000010e73a:	82                   	(bad)  
ffff80000010e73b:	82                   	(bad)  
ffff80000010e73c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e73f:	00 00                	add    %al,(%rax)
ffff80000010e741:	f8                   	clc    
ffff80000010e742:	44                   	rex.R
ffff80000010e743:	42                   	rex.X
ffff80000010e744:	42                   	rex.X
ffff80000010e745:	42                   	rex.X
ffff80000010e746:	44 78 40             	rex.R js ffff80000010e789 <system_call_table+0x2949>
ffff80000010e749:	40                   	rex
ffff80000010e74a:	40                   	rex
ffff80000010e74b:	40                   	rex
ffff80000010e74c:	40                   	rex
ffff80000010e74d:	f0 00 00             	lock add %al,(%rax)
ffff80000010e750:	00 38                	add    %bh,(%rax)
ffff80000010e752:	44 82                	rex.R (bad) 
ffff80000010e754:	82                   	(bad)  
ffff80000010e755:	82                   	(bad)  
ffff80000010e756:	82                   	(bad)  
ffff80000010e757:	82                   	(bad)  
ffff80000010e758:	82                   	(bad)  
ffff80000010e759:	82                   	(bad)  
ffff80000010e75a:	92                   	xchg   %eax,%edx
ffff80000010e75b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010e75f:	00 00                	add    %al,(%rax)
ffff80000010e761:	fc                   	cld    
ffff80000010e762:	42                   	rex.X
ffff80000010e763:	42                   	rex.X
ffff80000010e764:	42                   	rex.X
ffff80000010e765:	42 7c 44             	rex.X jl ffff80000010e7ac <system_call_table+0x296c>
ffff80000010e768:	42                   	rex.X
ffff80000010e769:	42                   	rex.X
ffff80000010e76a:	42                   	rex.X
ffff80000010e76b:	42                   	rex.X
ffff80000010e76c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e76f:	00 00                	add    %al,(%rax)
ffff80000010e771:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010e774:	82                   	(bad)  
ffff80000010e775:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010e779:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010e77f:	00 00                	add    %al,(%rax)
ffff80000010e781:	fe                   	(bad)  
ffff80000010e782:	92                   	xchg   %eax,%edx
ffff80000010e783:	92                   	xchg   %eax,%edx
ffff80000010e784:	10 10                	adc    %dl,(%rax)
ffff80000010e786:	10 10                	adc    %dl,(%rax)
ffff80000010e788:	10 10                	adc    %dl,(%rax)
ffff80000010e78a:	10 10                	adc    %dl,(%rax)
ffff80000010e78c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010e790:	00 e7                	add    %ah,%bh
ffff80000010e792:	42                   	rex.X
ffff80000010e793:	42                   	rex.X
ffff80000010e794:	42                   	rex.X
ffff80000010e795:	42                   	rex.X
ffff80000010e796:	42                   	rex.X
ffff80000010e797:	42                   	rex.X
ffff80000010e798:	42                   	rex.X
ffff80000010e799:	42                   	rex.X
ffff80000010e79a:	42                   	rex.X
ffff80000010e79b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010e79e:	00 00                	add    %al,(%rax)
ffff80000010e7a0:	00 e7                	add    %ah,%bh
ffff80000010e7a2:	42                   	rex.X
ffff80000010e7a3:	42                   	rex.X
ffff80000010e7a4:	42                   	rex.X
ffff80000010e7a5:	42 24 24             	rex.X and $0x24,%al
ffff80000010e7a8:	24 24                	and    $0x24,%al
ffff80000010e7aa:	18 18                	sbb    %bl,(%rax)
ffff80000010e7ac:	18 18                	sbb    %bl,(%rax)
ffff80000010e7ae:	00 00                	add    %al,(%rax)
ffff80000010e7b0:	00 e7                	add    %ah,%bh
ffff80000010e7b2:	42                   	rex.X
ffff80000010e7b3:	42                   	rex.X
ffff80000010e7b4:	42 5a                	rex.X pop %rdx
ffff80000010e7b6:	5a                   	pop    %rdx
ffff80000010e7b7:	5a                   	pop    %rdx
ffff80000010e7b8:	5a                   	pop    %rdx
ffff80000010e7b9:	24 24                	and    $0x24,%al
ffff80000010e7bb:	24 24                	and    $0x24,%al
ffff80000010e7bd:	24 00                	and    $0x0,%al
ffff80000010e7bf:	00 00                	add    %al,(%rax)
ffff80000010e7c1:	e7 42                	out    %eax,$0x42
ffff80000010e7c3:	42 24 24             	rex.X and $0x24,%al
ffff80000010e7c6:	24 18                	and    $0x18,%al
ffff80000010e7c8:	24 24                	and    $0x24,%al
ffff80000010e7ca:	24 42                	and    $0x42,%al
ffff80000010e7cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e7cf:	00 00                	add    %al,(%rax)
ffff80000010e7d1:	ee                   	out    %al,(%dx)
ffff80000010e7d2:	44                   	rex.R
ffff80000010e7d3:	44                   	rex.R
ffff80000010e7d4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010e7d7:	28 10                	sub    %dl,(%rax)
ffff80000010e7d9:	10 10                	adc    %dl,(%rax)
ffff80000010e7db:	10 10                	adc    %dl,(%rax)
ffff80000010e7dd:	7c 00                	jl     ffff80000010e7df <system_call_table+0x299f>
ffff80000010e7df:	00 00                	add    %al,(%rax)
ffff80000010e7e1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010e7e8:	20 20                	and    %ah,(%rax)
ffff80000010e7ea:	40                   	rex
ffff80000010e7eb:	42 82                	rex.X (bad) 
ffff80000010e7ed:	fe 00                	incb   (%rax)
ffff80000010e7ef:	00 00                	add    %al,(%rax)
ffff80000010e7f1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010e7f4:	20 20                	and    %ah,(%rax)
ffff80000010e7f6:	20 20                	and    %ah,(%rax)
ffff80000010e7f8:	20 20                	and    %ah,(%rax)
ffff80000010e7fa:	20 20                	and    %ah,(%rax)
ffff80000010e7fc:	20 20                	and    %ah,(%rax)
ffff80000010e7fe:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010e805:	20 20                	and    %ah,(%rax)
ffff80000010e807:	10 10                	adc    %dl,(%rax)
ffff80000010e809:	08 08                	or     %cl,(%rax)
ffff80000010e80b:	04 04                	add    $0x4,%al
ffff80000010e80d:	04 02                	add    $0x2,%al
ffff80000010e80f:	02 00                	add    (%rax),%al
ffff80000010e811:	7c 04                	jl     ffff80000010e817 <system_call_table+0x29d7>
ffff80000010e813:	04 04                	add    $0x4,%al
ffff80000010e815:	04 04                	add    $0x4,%al
ffff80000010e817:	04 04                	add    $0x4,%al
ffff80000010e819:	04 04                	add    $0x4,%al
ffff80000010e81b:	04 04                	add    $0x4,%al
ffff80000010e81d:	04 7c                	add    $0x7c,%al
ffff80000010e81f:	00 00                	add    %al,(%rax)
ffff80000010e821:	10 28                	adc    %ch,(%rax)
ffff80000010e823:	44 82                	rex.R (bad) 
	...
ffff80000010e83d:	00 fe                	add    %bh,%dh
ffff80000010e83f:	00 10                	add    %dl,(%rax)
ffff80000010e841:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010e854:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010e857:	04 3c                	add    $0x3c,%al
ffff80000010e859:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010e860:	c0 
ffff80000010e861:	40                   	rex
ffff80000010e862:	40                   	rex
ffff80000010e863:	40                   	rex
ffff80000010e864:	40 58                	rex pop %rax
ffff80000010e866:	64 42                	fs rex.X
ffff80000010e868:	42                   	rex.X
ffff80000010e869:	42                   	rex.X
ffff80000010e86a:	42                   	rex.X
ffff80000010e86b:	42                   	rex.X
ffff80000010e86c:	64 58                	fs pop %rax
ffff80000010e86e:	00 00                	add    %al,(%rax)
ffff80000010e870:	00 00                	add    %al,(%rax)
ffff80000010e872:	00 00                	add    %al,(%rax)
ffff80000010e874:	00 30                	add    %dh,(%rax)
ffff80000010e876:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010e87d:	38 
ffff80000010e87e:	00 00                	add    %al,(%rax)
ffff80000010e880:	0c 04                	or     $0x4,%al
ffff80000010e882:	04 04                	add    $0x4,%al
ffff80000010e884:	04 34                	add    $0x34,%al
ffff80000010e886:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010e88d:	36 
ffff80000010e88e:	00 00                	add    %al,(%rax)
ffff80000010e890:	00 00                	add    %al,(%rax)
ffff80000010e892:	00 00                	add    %al,(%rax)
ffff80000010e894:	00 38                	add    %bh,(%rax)
ffff80000010e896:	44 82                	rex.R (bad) 
ffff80000010e898:	82                   	(bad)  
ffff80000010e899:	fc                   	cld    
ffff80000010e89a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010e8a1:	10 10                	adc    %dl,(%rax)
ffff80000010e8a3:	10 10                	adc    %dl,(%rax)
ffff80000010e8a5:	7c 10                	jl     ffff80000010e8b7 <system_call_table+0x2a77>
ffff80000010e8a7:	10 10                	adc    %dl,(%rax)
ffff80000010e8a9:	10 10                	adc    %dl,(%rax)
ffff80000010e8ab:	10 10                	adc    %dl,(%rax)
ffff80000010e8ad:	7c 00                	jl     ffff80000010e8af <system_call_table+0x2a6f>
ffff80000010e8af:	00 00                	add    %al,(%rax)
ffff80000010e8b1:	00 00                	add    %al,(%rax)
ffff80000010e8b3:	00 00                	add    %al,(%rax)
ffff80000010e8b5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010e8bc:	34 04 
ffff80000010e8be:	04 38                	add    $0x38,%al
ffff80000010e8c0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010e8c4:	40 58                	rex pop %rax
ffff80000010e8c6:	64 42                	fs rex.X
ffff80000010e8c8:	42                   	rex.X
ffff80000010e8c9:	42                   	rex.X
ffff80000010e8ca:	42                   	rex.X
ffff80000010e8cb:	42                   	rex.X
ffff80000010e8cc:	42 e3 00             	rex.X jrcxz ffff80000010e8cf <system_call_table+0x2a8f>
ffff80000010e8cf:	00 00                	add    %al,(%rax)
ffff80000010e8d1:	10 10                	adc    %dl,(%rax)
ffff80000010e8d3:	00 00                	add    %al,(%rax)
ffff80000010e8d5:	30 10                	xor    %dl,(%rax)
ffff80000010e8d7:	10 10                	adc    %dl,(%rax)
ffff80000010e8d9:	10 10                	adc    %dl,(%rax)
ffff80000010e8db:	10 10                	adc    %dl,(%rax)
ffff80000010e8dd:	38 00                	cmp    %al,(%rax)
ffff80000010e8df:	00 00                	add    %al,(%rax)
ffff80000010e8e1:	04 04                	add    $0x4,%al
ffff80000010e8e3:	00 00                	add    %al,(%rax)
ffff80000010e8e5:	0c 04                	or     $0x4,%al
ffff80000010e8e7:	04 04                	add    $0x4,%al
ffff80000010e8e9:	04 04                	add    $0x4,%al
ffff80000010e8eb:	04 04                	add    $0x4,%al
ffff80000010e8ed:	08 08                	or     %cl,(%rax)
ffff80000010e8ef:	30 c0                	xor    %al,%al
ffff80000010e8f1:	40                   	rex
ffff80000010e8f2:	40                   	rex
ffff80000010e8f3:	40                   	rex
ffff80000010e8f4:	40                   	rex
ffff80000010e8f5:	4e                   	rex.WRX
ffff80000010e8f6:	44                   	rex.R
ffff80000010e8f7:	48 50                	rex.W push %rax
ffff80000010e8f9:	60                   	(bad)  
ffff80000010e8fa:	50                   	push   %rax
ffff80000010e8fb:	48                   	rex.W
ffff80000010e8fc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010e8ff:	00 30                	add    %dh,(%rax)
ffff80000010e901:	10 10                	adc    %dl,(%rax)
ffff80000010e903:	10 10                	adc    %dl,(%rax)
ffff80000010e905:	10 10                	adc    %dl,(%rax)
ffff80000010e907:	10 10                	adc    %dl,(%rax)
ffff80000010e909:	10 10                	adc    %dl,(%rax)
ffff80000010e90b:	10 10                	adc    %dl,(%rax)
ffff80000010e90d:	38 00                	cmp    %al,(%rax)
ffff80000010e90f:	00 00                	add    %al,(%rax)
ffff80000010e911:	00 00                	add    %al,(%rax)
ffff80000010e913:	00 00                	add    %al,(%rax)
ffff80000010e915:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010e919:	49                   	rex.WB
ffff80000010e91a:	49                   	rex.WB
ffff80000010e91b:	49                   	rex.WB
ffff80000010e91c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010e91f:	00 00                	add    %al,(%rax)
ffff80000010e921:	00 00                	add    %al,(%rax)
ffff80000010e923:	00 00                	add    %al,(%rax)
ffff80000010e925:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010e929:	42                   	rex.X
ffff80000010e92a:	42                   	rex.X
ffff80000010e92b:	42                   	rex.X
ffff80000010e92c:	42 e3 00             	rex.X jrcxz ffff80000010e92f <system_call_table+0x2aef>
ffff80000010e92f:	00 00                	add    %al,(%rax)
ffff80000010e931:	00 00                	add    %al,(%rax)
ffff80000010e933:	00 00                	add    %al,(%rax)
ffff80000010e935:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e939:	82                   	(bad)  
ffff80000010e93a:	82                   	(bad)  
ffff80000010e93b:	82                   	(bad)  
ffff80000010e93c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e93f:	00 00                	add    %al,(%rax)
ffff80000010e941:	00 00                	add    %al,(%rax)
ffff80000010e943:	00 d8                	add    %bl,%al
ffff80000010e945:	64 42                	fs rex.X
ffff80000010e947:	42                   	rex.X
ffff80000010e948:	42                   	rex.X
ffff80000010e949:	42                   	rex.X
ffff80000010e94a:	42                   	rex.X
ffff80000010e94b:	64 58                	fs pop %rax
ffff80000010e94d:	40                   	rex
ffff80000010e94e:	40 e0 00             	rex loopne ffff80000010e951 <system_call_table+0x2b11>
ffff80000010e951:	00 00                	add    %al,(%rax)
ffff80000010e953:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010e956:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010e95d:	04 04                	add    $0x4,%al
ffff80000010e95f:	0e                   	(bad)  
ffff80000010e960:	00 00                	add    %al,(%rax)
ffff80000010e962:	00 00                	add    %al,(%rax)
ffff80000010e964:	00 dc                	add    %bl,%ah
ffff80000010e966:	62 42                	(bad)  
ffff80000010e968:	40                   	rex
ffff80000010e969:	40                   	rex
ffff80000010e96a:	40                   	rex
ffff80000010e96b:	40                   	rex
ffff80000010e96c:	40 e0 00             	rex loopne ffff80000010e96f <system_call_table+0x2b2f>
ffff80000010e96f:	00 00                	add    %al,(%rax)
ffff80000010e971:	00 00                	add    %al,(%rax)
ffff80000010e973:	00 00                	add    %al,(%rax)
ffff80000010e975:	7a 86                	jp     ffff80000010e8fd <system_call_table+0x2abd>
ffff80000010e977:	82                   	(bad)  
ffff80000010e978:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010e97b:	82                   	(bad)  
ffff80000010e97c:	c2 bc 00             	retq   $0xbc
ffff80000010e97f:	00 00                	add    %al,(%rax)
ffff80000010e981:	00 10                	add    %dl,(%rax)
ffff80000010e983:	10 10                	adc    %dl,(%rax)
ffff80000010e985:	7c 10                	jl     ffff80000010e997 <system_call_table+0x2b57>
ffff80000010e987:	10 10                	adc    %dl,(%rax)
ffff80000010e989:	10 10                	adc    %dl,(%rax)
ffff80000010e98b:	10 10                	adc    %dl,(%rax)
ffff80000010e98d:	0e                   	(bad)  
ffff80000010e98e:	00 00                	add    %al,(%rax)
ffff80000010e990:	00 00                	add    %al,(%rax)
ffff80000010e992:	00 00                	add    %al,(%rax)
ffff80000010e994:	00 c6                	add    %al,%dh
ffff80000010e996:	42                   	rex.X
ffff80000010e997:	42                   	rex.X
ffff80000010e998:	42                   	rex.X
ffff80000010e999:	42                   	rex.X
ffff80000010e99a:	42                   	rex.X
ffff80000010e99b:	42                   	rex.X
ffff80000010e99c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010e99f:	00 00                	add    %al,(%rax)
ffff80000010e9a1:	00 00                	add    %al,(%rax)
ffff80000010e9a3:	00 00                	add    %al,(%rax)
ffff80000010e9a5:	e7 42                	out    %eax,$0x42
ffff80000010e9a7:	42                   	rex.X
ffff80000010e9a8:	42 24 24             	rex.X and $0x24,%al
ffff80000010e9ab:	24 18                	and    $0x18,%al
ffff80000010e9ad:	18 00                	sbb    %al,(%rax)
ffff80000010e9af:	00 00                	add    %al,(%rax)
ffff80000010e9b1:	00 00                	add    %al,(%rax)
ffff80000010e9b3:	00 00                	add    %al,(%rax)
ffff80000010e9b5:	e7 42                	out    %eax,$0x42
ffff80000010e9b7:	42 5a                	rex.X pop %rdx
ffff80000010e9b9:	5a                   	pop    %rdx
ffff80000010e9ba:	5a                   	pop    %rdx
ffff80000010e9bb:	24 24                	and    $0x24,%al
ffff80000010e9bd:	24 00                	and    $0x0,%al
ffff80000010e9bf:	00 00                	add    %al,(%rax)
ffff80000010e9c1:	00 00                	add    %al,(%rax)
ffff80000010e9c3:	00 00                	add    %al,(%rax)
ffff80000010e9c5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010e9ca:	28 28                	sub    %ch,(%rax)
ffff80000010e9cc:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010e9d0:	00 00                	add    %al,(%rax)
ffff80000010e9d2:	00 00                	add    %al,(%rax)
ffff80000010e9d4:	00 e7                	add    %ah,%bh
ffff80000010e9d6:	42                   	rex.X
ffff80000010e9d7:	42 24 24             	rex.X and $0x24,%al
ffff80000010e9da:	24 18                	and    $0x18,%al
ffff80000010e9dc:	18 10                	sbb    %dl,(%rax)
ffff80000010e9de:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e9e1:	00 00                	add    %al,(%rax)
ffff80000010e9e3:	00 00                	add    %al,(%rax)
ffff80000010e9e5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010e9eb:	42 82                	rex.X (bad) 
ffff80000010e9ed:	fe 00                	incb   (%rax)
ffff80000010e9ef:	00 00                	add    %al,(%rax)
ffff80000010e9f1:	06                   	(bad)  
ffff80000010e9f2:	08 10                	or     %dl,(%rax)
ffff80000010e9f4:	10 10                	adc    %dl,(%rax)
ffff80000010e9f6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010e9f9:	10 10                	adc    %dl,(%rax)
ffff80000010e9fb:	10 08                	adc    %cl,(%rax)
ffff80000010e9fd:	06                   	(bad)  
ffff80000010e9fe:	00 00                	add    %al,(%rax)
ffff80000010ea00:	10 10                	adc    %dl,(%rax)
ffff80000010ea02:	10 10                	adc    %dl,(%rax)
ffff80000010ea04:	10 10                	adc    %dl,(%rax)
ffff80000010ea06:	10 10                	adc    %dl,(%rax)
ffff80000010ea08:	10 10                	adc    %dl,(%rax)
ffff80000010ea0a:	10 10                	adc    %dl,(%rax)
ffff80000010ea0c:	10 10                	adc    %dl,(%rax)
ffff80000010ea0e:	10 10                	adc    %dl,(%rax)
ffff80000010ea10:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ea13:	08 08                	or     %cl,(%rax)
ffff80000010ea15:	08 08                	or     %cl,(%rax)
ffff80000010ea17:	06                   	(bad)  
ffff80000010ea18:	08 08                	or     %cl,(%rax)
ffff80000010ea1a:	08 08                	or     %cl,(%rax)
ffff80000010ea1c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ea1f:	00 00                	add    %al,(%rax)
ffff80000010ea21:	72 8c                	jb     ffff80000010e9af <system_call_table+0x2b6f>
	...
ffff80000010f44f:	00 00                	add    %al,(%rax)
ffff80000010f451:	10 10                	adc    %dl,(%rax)
ffff80000010f453:	10 10                	adc    %dl,(%rax)
ffff80000010f455:	10 10                	adc    %dl,(%rax)
ffff80000010f457:	10 10                	adc    %dl,(%rax)
ffff80000010f459:	10 00                	adc    %al,(%rax)
ffff80000010f45b:	00 10                	add    %dl,(%rax)
ffff80000010f45d:	10 00                	adc    %al,(%rax)
ffff80000010f45f:	00 28                	add    %ch,(%rax)
ffff80000010f461:	28 28                	sub    %ch,(%rax)
	...
ffff80000010f46f:	00 00                	add    %al,(%rax)
ffff80000010f471:	44                   	rex.R
ffff80000010f472:	44                   	rex.R
ffff80000010f473:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f478:	44                   	rex.R
ffff80000010f479:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f47e:	00 00                	add    %al,(%rax)
ffff80000010f480:	10 3a                	adc    %bh,(%rdx)
ffff80000010f482:	56                   	push   %rsi
ffff80000010f483:	92                   	xchg   %eax,%edx
ffff80000010f484:	92                   	xchg   %eax,%edx
ffff80000010f485:	90                   	nop
ffff80000010f486:	50                   	push   %rax
ffff80000010f487:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010f48a:	92                   	xchg   %eax,%edx
ffff80000010f48b:	92                   	xchg   %eax,%edx
ffff80000010f48c:	d4                   	(bad)  
ffff80000010f48d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010f492:	94                   	xchg   %eax,%esp
ffff80000010f493:	94                   	xchg   %eax,%esp
ffff80000010f494:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010f499:	2c 52                	sub    $0x52,%al
ffff80000010f49b:	52                   	push   %rdx
ffff80000010f49c:	92                   	xchg   %eax,%edx
ffff80000010f49d:	8c 00                	mov    %es,(%rax)
ffff80000010f49f:	00 00                	add    %al,(%rax)
ffff80000010f4a1:	70 88                	jo     ffff80000010f42b <system_call_table+0x35eb>
ffff80000010f4a3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010f4a9:	92                   	xchg   %eax,%edx
ffff80000010f4aa:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010f4b1:	08 10                	or     %dl,(%rax)
	...
ffff80000010f4bf:	00 02                	add    %al,(%rdx)
ffff80000010f4c1:	04 08                	add    $0x8,%al
ffff80000010f4c3:	08 10                	or     %dl,(%rax)
ffff80000010f4c5:	10 10                	adc    %dl,(%rax)
ffff80000010f4c7:	10 10                	adc    %dl,(%rax)
ffff80000010f4c9:	10 10                	adc    %dl,(%rax)
ffff80000010f4cb:	08 08                	or     %cl,(%rax)
ffff80000010f4cd:	04 02                	add    $0x2,%al
ffff80000010f4cf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010f4d5:	10 10                	adc    %dl,(%rax)
ffff80000010f4d7:	10 10                	adc    %dl,(%rax)
ffff80000010f4d9:	10 10                	adc    %dl,(%rax)
ffff80000010f4db:	20 20                	and    %ah,(%rax)
ffff80000010f4dd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f4e1:	00 00                	add    %al,(%rax)
ffff80000010f4e3:	00 00                	add    %al,(%rax)
ffff80000010f4e5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010f4eb:	10 00                	adc    %al,(%rax)
	...
ffff80000010f4f5:	10 10                	adc    %dl,(%rax)
ffff80000010f4f7:	10 fe                	adc    %bh,%dh
ffff80000010f4f9:	10 10                	adc    %dl,(%rax)
ffff80000010f4fb:	10 00                	adc    %al,(%rax)
	...
ffff80000010f509:	00 00                	add    %al,(%rax)
ffff80000010f50b:	18 18                	sbb    %bl,(%rax)
ffff80000010f50d:	08 08                	or     %cl,(%rax)
ffff80000010f50f:	10 00                	adc    %al,(%rax)
ffff80000010f511:	00 00                	add    %al,(%rax)
ffff80000010f513:	00 00                	add    %al,(%rax)
ffff80000010f515:	00 00                	add    %al,(%rax)
ffff80000010f517:	00 fe                	add    %bh,%dh
	...
ffff80000010f529:	00 00                	add    %al,(%rax)
ffff80000010f52b:	00 18                	add    %bl,(%rax)
ffff80000010f52d:	18 00                	sbb    %al,(%rax)
ffff80000010f52f:	00 02                	add    %al,(%rdx)
ffff80000010f531:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010f534:	08 08                	or     %cl,(%rax)
ffff80000010f536:	08 10                	or     %dl,(%rax)
ffff80000010f538:	10 20                	adc    %ah,(%rax)
ffff80000010f53a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f53d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010f544:	42 
ffff80000010f545:	42                   	rex.X
ffff80000010f546:	42                   	rex.X
ffff80000010f547:	42                   	rex.X
ffff80000010f548:	42                   	rex.X
ffff80000010f549:	42                   	rex.X
ffff80000010f54a:	42 24 24             	rex.X and $0x24,%al
ffff80000010f54d:	18 00                	sbb    %al,(%rax)
ffff80000010f54f:	00 00                	add    %al,(%rax)
ffff80000010f551:	08 18                	or     %bl,(%rax)
ffff80000010f553:	28 08                	sub    %cl,(%rax)
ffff80000010f555:	08 08                	or     %cl,(%rax)
ffff80000010f557:	08 08                	or     %cl,(%rax)
ffff80000010f559:	08 08                	or     %cl,(%rax)
ffff80000010f55b:	08 08                	or     %cl,(%rax)
ffff80000010f55d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010f560:	00 18                	add    %bl,(%rax)
ffff80000010f562:	24 42                	and    $0x42,%al
ffff80000010f564:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010f568:	10 20                	adc    %ah,(%rax)
ffff80000010f56a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f56d:	7e 00                	jle    ffff80000010f56f <system_call_table+0x372f>
ffff80000010f56f:	00 00                	add    %al,(%rax)
ffff80000010f571:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010f574:	02 02                	add    (%rdx),%al
ffff80000010f576:	04 18                	add    $0x18,%al
ffff80000010f578:	04 02                	add    $0x2,%al
ffff80000010f57a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010f57d:	18 00                	sbb    %al,(%rax)
ffff80000010f57f:	00 00                	add    %al,(%rax)
ffff80000010f581:	0c 0c                	or     $0xc,%al
ffff80000010f583:	0c 14                	or     $0x14,%al
ffff80000010f585:	14 14                	adc    $0x14,%al
ffff80000010f587:	24 24                	and    $0x24,%al
ffff80000010f589:	44 7e 04             	rex.R jle ffff80000010f590 <system_call_table+0x3750>
ffff80000010f58c:	04 1e                	add    $0x1e,%al
ffff80000010f58e:	00 00                	add    %al,(%rax)
ffff80000010f590:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010f594:	40 58                	rex pop %rax
ffff80000010f596:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010f599:	02 02                	add    (%rdx),%al
ffff80000010f59b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f59e:	00 00                	add    %al,(%rax)
ffff80000010f5a0:	00 18                	add    %bl,(%rax)
ffff80000010f5a2:	24 42                	and    $0x42,%al
ffff80000010f5a4:	40 58                	rex pop %rax
ffff80000010f5a6:	64 42                	fs rex.X
ffff80000010f5a8:	42                   	rex.X
ffff80000010f5a9:	42                   	rex.X
ffff80000010f5aa:	42                   	rex.X
ffff80000010f5ab:	42 24 18             	rex.X and $0x18,%al
ffff80000010f5ae:	00 00                	add    %al,(%rax)
ffff80000010f5b0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010f5b3:	42 04 04             	rex.X add $0x4,%al
ffff80000010f5b6:	08 08                	or     %cl,(%rax)
ffff80000010f5b8:	08 10                	or     %dl,(%rax)
ffff80000010f5ba:	10 10                	adc    %dl,(%rax)
ffff80000010f5bc:	10 38                	adc    %bh,(%rax)
ffff80000010f5be:	00 00                	add    %al,(%rax)
ffff80000010f5c0:	00 18                	add    %bl,(%rax)
ffff80000010f5c2:	24 42                	and    $0x42,%al
ffff80000010f5c4:	42                   	rex.X
ffff80000010f5c5:	42 24 18             	rex.X and $0x18,%al
ffff80000010f5c8:	24 42                	and    $0x42,%al
ffff80000010f5ca:	42                   	rex.X
ffff80000010f5cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f5ce:	00 00                	add    %al,(%rax)
ffff80000010f5d0:	00 18                	add    %bl,(%rax)
ffff80000010f5d2:	24 42                	and    $0x42,%al
ffff80000010f5d4:	42                   	rex.X
ffff80000010f5d5:	42                   	rex.X
ffff80000010f5d6:	42                   	rex.X
ffff80000010f5d7:	42                   	rex.X
ffff80000010f5d8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010f5db:	42 24 18             	rex.X and $0x18,%al
ffff80000010f5de:	00 00                	add    %al,(%rax)
ffff80000010f5e0:	00 00                	add    %al,(%rax)
ffff80000010f5e2:	00 00                	add    %al,(%rax)
ffff80000010f5e4:	00 18                	add    %bl,(%rax)
ffff80000010f5e6:	18 00                	sbb    %al,(%rax)
ffff80000010f5e8:	00 00                	add    %al,(%rax)
ffff80000010f5ea:	00 00                	add    %al,(%rax)
ffff80000010f5ec:	18 18                	sbb    %bl,(%rax)
ffff80000010f5ee:	00 00                	add    %al,(%rax)
ffff80000010f5f0:	00 00                	add    %al,(%rax)
ffff80000010f5f2:	00 00                	add    %al,(%rax)
ffff80000010f5f4:	00 18                	add    %bl,(%rax)
ffff80000010f5f6:	18 00                	sbb    %al,(%rax)
ffff80000010f5f8:	00 00                	add    %al,(%rax)
ffff80000010f5fa:	00 18                	add    %bl,(%rax)
ffff80000010f5fc:	18 08                	sbb    %cl,(%rax)
ffff80000010f5fe:	08 10                	or     %dl,(%rax)
ffff80000010f600:	00 02                	add    %al,(%rdx)
ffff80000010f602:	04 08                	add    $0x8,%al
ffff80000010f604:	10 20                	adc    %ah,(%rax)
ffff80000010f606:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010f60d:	04 
ffff80000010f60e:	02 00                	add    (%rax),%al
ffff80000010f610:	00 00                	add    %al,(%rax)
ffff80000010f612:	00 00                	add    %al,(%rax)
ffff80000010f614:	00 00                	add    %al,(%rax)
ffff80000010f616:	fe 00                	incb   (%rax)
ffff80000010f618:	00 fe                	add    %bh,%dh
ffff80000010f61a:	00 00                	add    %al,(%rax)
ffff80000010f61c:	00 00                	add    %al,(%rax)
ffff80000010f61e:	00 00                	add    %al,(%rax)
ffff80000010f620:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010f626:	04 02                	add    $0x2,%al
ffff80000010f628:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010f62b:	10 20                	adc    %ah,(%rax)
ffff80000010f62d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f631:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f635:	82                   	(bad)  
ffff80000010f636:	04 08                	add    $0x8,%al
ffff80000010f638:	10 10                	adc    %dl,(%rax)
ffff80000010f63a:	00 00                	add    %al,(%rax)
ffff80000010f63c:	18 18                	sbb    %bl,(%rax)
ffff80000010f63e:	00 00                	add    %al,(%rax)
ffff80000010f640:	00 38                	add    %bh,(%rax)
ffff80000010f642:	44 82                	rex.R (bad) 
ffff80000010f644:	9a                   	(bad)  
ffff80000010f645:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f646:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f647:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f648:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f649:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f64a:	9c                   	pushfq 
ffff80000010f64b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010f64f:	00 00                	add    %al,(%rax)
ffff80000010f651:	18 18                	sbb    %bl,(%rax)
ffff80000010f653:	18 18                	sbb    %bl,(%rax)
ffff80000010f655:	24 24                	and    $0x24,%al
ffff80000010f657:	24 24                	and    $0x24,%al
ffff80000010f659:	7e 42                	jle    ffff80000010f69d <system_call_table+0x385d>
ffff80000010f65b:	42                   	rex.X
ffff80000010f65c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f65f:	00 00                	add    %al,(%rax)
ffff80000010f661:	f0 48                	lock rex.W
ffff80000010f663:	44                   	rex.R
ffff80000010f664:	44                   	rex.R
ffff80000010f665:	44                   	rex.R
ffff80000010f666:	48 78 44             	rex.W js ffff80000010f6ad <system_call_table+0x386d>
ffff80000010f669:	42                   	rex.X
ffff80000010f66a:	42                   	rex.X
ffff80000010f66b:	42                   	rex.X
ffff80000010f66c:	44 f8                	rex.R clc 
ffff80000010f66e:	00 00                	add    %al,(%rax)
ffff80000010f670:	00 3a                	add    %bh,(%rdx)
ffff80000010f672:	46                   	rex.RX
ffff80000010f673:	42 82                	rex.X (bad) 
ffff80000010f675:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010f67c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f67f:	00 00                	add    %al,(%rax)
ffff80000010f681:	f8                   	clc    
ffff80000010f682:	44                   	rex.R
ffff80000010f683:	44                   	rex.R
ffff80000010f684:	42                   	rex.X
ffff80000010f685:	42                   	rex.X
ffff80000010f686:	42                   	rex.X
ffff80000010f687:	42                   	rex.X
ffff80000010f688:	42                   	rex.X
ffff80000010f689:	42                   	rex.X
ffff80000010f68a:	42                   	rex.X
ffff80000010f68b:	44                   	rex.R
ffff80000010f68c:	44 f8                	rex.R clc 
ffff80000010f68e:	00 00                	add    %al,(%rax)
ffff80000010f690:	00 fe                	add    %bh,%dh
ffff80000010f692:	42                   	rex.X
ffff80000010f693:	42                   	rex.X
ffff80000010f694:	40                   	rex
ffff80000010f695:	40                   	rex
ffff80000010f696:	44 7c 44             	rex.R jl ffff80000010f6dd <system_call_table+0x389d>
ffff80000010f699:	40                   	rex
ffff80000010f69a:	40                   	rex
ffff80000010f69b:	42                   	rex.X
ffff80000010f69c:	42 fe 00             	rex.X incb (%rax)
ffff80000010f69f:	00 00                	add    %al,(%rax)
ffff80000010f6a1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010f6a4:	40                   	rex
ffff80000010f6a5:	40                   	rex
ffff80000010f6a6:	44 7c 44             	rex.R jl ffff80000010f6ed <system_call_table+0x38ad>
ffff80000010f6a9:	44                   	rex.R
ffff80000010f6aa:	40                   	rex
ffff80000010f6ab:	40                   	rex
ffff80000010f6ac:	40                   	rex
ffff80000010f6ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010f6b0:	00 3a                	add    %bh,(%rdx)
ffff80000010f6b2:	46                   	rex.RX
ffff80000010f6b3:	42 82                	rex.X (bad) 
ffff80000010f6b5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010f6bc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010f6bf:	00 00                	add    %al,(%rax)
ffff80000010f6c1:	e7 42                	out    %eax,$0x42
ffff80000010f6c3:	42                   	rex.X
ffff80000010f6c4:	42                   	rex.X
ffff80000010f6c5:	42                   	rex.X
ffff80000010f6c6:	42 7e 42             	rex.X jle ffff80000010f70b <system_call_table+0x38cb>
ffff80000010f6c9:	42                   	rex.X
ffff80000010f6ca:	42                   	rex.X
ffff80000010f6cb:	42                   	rex.X
ffff80000010f6cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f6cf:	00 00                	add    %al,(%rax)
ffff80000010f6d1:	7c 10                	jl     ffff80000010f6e3 <system_call_table+0x38a3>
ffff80000010f6d3:	10 10                	adc    %dl,(%rax)
ffff80000010f6d5:	10 10                	adc    %dl,(%rax)
ffff80000010f6d7:	10 10                	adc    %dl,(%rax)
ffff80000010f6d9:	10 10                	adc    %dl,(%rax)
ffff80000010f6db:	10 10                	adc    %dl,(%rax)
ffff80000010f6dd:	7c 00                	jl     ffff80000010f6df <system_call_table+0x389f>
ffff80000010f6df:	00 00                	add    %al,(%rax)
ffff80000010f6e1:	1f                   	(bad)  
ffff80000010f6e2:	04 04                	add    $0x4,%al
ffff80000010f6e4:	04 04                	add    $0x4,%al
ffff80000010f6e6:	04 04                	add    $0x4,%al
ffff80000010f6e8:	04 04                	add    $0x4,%al
ffff80000010f6ea:	04 04                	add    $0x4,%al
ffff80000010f6ec:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010f6ef:	00 00                	add    %al,(%rax)
ffff80000010f6f1:	e7 42                	out    %eax,$0x42
ffff80000010f6f3:	44                   	rex.R
ffff80000010f6f4:	48 50                	rex.W push %rax
ffff80000010f6f6:	50                   	push   %rax
ffff80000010f6f7:	60                   	(bad)  
ffff80000010f6f8:	50                   	push   %rax
ffff80000010f6f9:	50                   	push   %rax
ffff80000010f6fa:	48                   	rex.W
ffff80000010f6fb:	44                   	rex.R
ffff80000010f6fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f6ff:	00 00                	add    %al,(%rax)
ffff80000010f701:	f0 40                	lock rex
ffff80000010f703:	40                   	rex
ffff80000010f704:	40                   	rex
ffff80000010f705:	40                   	rex
ffff80000010f706:	40                   	rex
ffff80000010f707:	40                   	rex
ffff80000010f708:	40                   	rex
ffff80000010f709:	40                   	rex
ffff80000010f70a:	40                   	rex
ffff80000010f70b:	42                   	rex.X
ffff80000010f70c:	42 fe 00             	rex.X incb (%rax)
ffff80000010f70f:	00 00                	add    %al,(%rax)
ffff80000010f711:	c3                   	retq   
ffff80000010f712:	42                   	rex.X
ffff80000010f713:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010f717:	5a                   	pop    %rdx
ffff80000010f718:	5a                   	pop    %rdx
ffff80000010f719:	42                   	rex.X
ffff80000010f71a:	42                   	rex.X
ffff80000010f71b:	42                   	rex.X
ffff80000010f71c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f71f:	00 00                	add    %al,(%rax)
ffff80000010f721:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010f728:	4a                   	rex.WX
ffff80000010f729:	4a                   	rex.WX
ffff80000010f72a:	4a                   	rex.WX
ffff80000010f72b:	46                   	rex.RX
ffff80000010f72c:	46 e2 00             	rex.RX loop ffff80000010f72f <system_call_table+0x38ef>
ffff80000010f72f:	00 00                	add    %al,(%rax)
ffff80000010f731:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f735:	82                   	(bad)  
ffff80000010f736:	82                   	(bad)  
ffff80000010f737:	82                   	(bad)  
ffff80000010f738:	82                   	(bad)  
ffff80000010f739:	82                   	(bad)  
ffff80000010f73a:	82                   	(bad)  
ffff80000010f73b:	82                   	(bad)  
ffff80000010f73c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f73f:	00 00                	add    %al,(%rax)
ffff80000010f741:	f8                   	clc    
ffff80000010f742:	44                   	rex.R
ffff80000010f743:	42                   	rex.X
ffff80000010f744:	42                   	rex.X
ffff80000010f745:	42                   	rex.X
ffff80000010f746:	44 78 40             	rex.R js ffff80000010f789 <system_call_table+0x3949>
ffff80000010f749:	40                   	rex
ffff80000010f74a:	40                   	rex
ffff80000010f74b:	40                   	rex
ffff80000010f74c:	40                   	rex
ffff80000010f74d:	f0 00 00             	lock add %al,(%rax)
ffff80000010f750:	00 38                	add    %bh,(%rax)
ffff80000010f752:	44 82                	rex.R (bad) 
ffff80000010f754:	82                   	(bad)  
ffff80000010f755:	82                   	(bad)  
ffff80000010f756:	82                   	(bad)  
ffff80000010f757:	82                   	(bad)  
ffff80000010f758:	82                   	(bad)  
ffff80000010f759:	82                   	(bad)  
ffff80000010f75a:	92                   	xchg   %eax,%edx
ffff80000010f75b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010f75f:	00 00                	add    %al,(%rax)
ffff80000010f761:	fc                   	cld    
ffff80000010f762:	42                   	rex.X
ffff80000010f763:	42                   	rex.X
ffff80000010f764:	42                   	rex.X
ffff80000010f765:	42 7c 44             	rex.X jl ffff80000010f7ac <system_call_table+0x396c>
ffff80000010f768:	42                   	rex.X
ffff80000010f769:	42                   	rex.X
ffff80000010f76a:	42                   	rex.X
ffff80000010f76b:	42                   	rex.X
ffff80000010f76c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f76f:	00 00                	add    %al,(%rax)
ffff80000010f771:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010f774:	82                   	(bad)  
ffff80000010f775:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010f779:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010f77f:	00 00                	add    %al,(%rax)
ffff80000010f781:	fe                   	(bad)  
ffff80000010f782:	92                   	xchg   %eax,%edx
ffff80000010f783:	92                   	xchg   %eax,%edx
ffff80000010f784:	10 10                	adc    %dl,(%rax)
ffff80000010f786:	10 10                	adc    %dl,(%rax)
ffff80000010f788:	10 10                	adc    %dl,(%rax)
ffff80000010f78a:	10 10                	adc    %dl,(%rax)
ffff80000010f78c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010f790:	00 e7                	add    %ah,%bh
ffff80000010f792:	42                   	rex.X
ffff80000010f793:	42                   	rex.X
ffff80000010f794:	42                   	rex.X
ffff80000010f795:	42                   	rex.X
ffff80000010f796:	42                   	rex.X
ffff80000010f797:	42                   	rex.X
ffff80000010f798:	42                   	rex.X
ffff80000010f799:	42                   	rex.X
ffff80000010f79a:	42                   	rex.X
ffff80000010f79b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010f79e:	00 00                	add    %al,(%rax)
ffff80000010f7a0:	00 e7                	add    %ah,%bh
ffff80000010f7a2:	42                   	rex.X
ffff80000010f7a3:	42                   	rex.X
ffff80000010f7a4:	42                   	rex.X
ffff80000010f7a5:	42 24 24             	rex.X and $0x24,%al
ffff80000010f7a8:	24 24                	and    $0x24,%al
ffff80000010f7aa:	18 18                	sbb    %bl,(%rax)
ffff80000010f7ac:	18 18                	sbb    %bl,(%rax)
ffff80000010f7ae:	00 00                	add    %al,(%rax)
ffff80000010f7b0:	00 e7                	add    %ah,%bh
ffff80000010f7b2:	42                   	rex.X
ffff80000010f7b3:	42                   	rex.X
ffff80000010f7b4:	42 5a                	rex.X pop %rdx
ffff80000010f7b6:	5a                   	pop    %rdx
ffff80000010f7b7:	5a                   	pop    %rdx
ffff80000010f7b8:	5a                   	pop    %rdx
ffff80000010f7b9:	24 24                	and    $0x24,%al
ffff80000010f7bb:	24 24                	and    $0x24,%al
ffff80000010f7bd:	24 00                	and    $0x0,%al
ffff80000010f7bf:	00 00                	add    %al,(%rax)
ffff80000010f7c1:	e7 42                	out    %eax,$0x42
ffff80000010f7c3:	42 24 24             	rex.X and $0x24,%al
ffff80000010f7c6:	24 18                	and    $0x18,%al
ffff80000010f7c8:	24 24                	and    $0x24,%al
ffff80000010f7ca:	24 42                	and    $0x42,%al
ffff80000010f7cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f7cf:	00 00                	add    %al,(%rax)
ffff80000010f7d1:	ee                   	out    %al,(%dx)
ffff80000010f7d2:	44                   	rex.R
ffff80000010f7d3:	44                   	rex.R
ffff80000010f7d4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010f7d7:	28 10                	sub    %dl,(%rax)
ffff80000010f7d9:	10 10                	adc    %dl,(%rax)
ffff80000010f7db:	10 10                	adc    %dl,(%rax)
ffff80000010f7dd:	7c 00                	jl     ffff80000010f7df <system_call_table+0x399f>
ffff80000010f7df:	00 00                	add    %al,(%rax)
ffff80000010f7e1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010f7e8:	20 20                	and    %ah,(%rax)
ffff80000010f7ea:	40                   	rex
ffff80000010f7eb:	42 82                	rex.X (bad) 
ffff80000010f7ed:	fe 00                	incb   (%rax)
ffff80000010f7ef:	00 00                	add    %al,(%rax)
ffff80000010f7f1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010f7f4:	20 20                	and    %ah,(%rax)
ffff80000010f7f6:	20 20                	and    %ah,(%rax)
ffff80000010f7f8:	20 20                	and    %ah,(%rax)
ffff80000010f7fa:	20 20                	and    %ah,(%rax)
ffff80000010f7fc:	20 20                	and    %ah,(%rax)
ffff80000010f7fe:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010f805:	20 20                	and    %ah,(%rax)
ffff80000010f807:	10 10                	adc    %dl,(%rax)
ffff80000010f809:	08 08                	or     %cl,(%rax)
ffff80000010f80b:	04 04                	add    $0x4,%al
ffff80000010f80d:	04 02                	add    $0x2,%al
ffff80000010f80f:	02 00                	add    (%rax),%al
ffff80000010f811:	7c 04                	jl     ffff80000010f817 <system_call_table+0x39d7>
ffff80000010f813:	04 04                	add    $0x4,%al
ffff80000010f815:	04 04                	add    $0x4,%al
ffff80000010f817:	04 04                	add    $0x4,%al
ffff80000010f819:	04 04                	add    $0x4,%al
ffff80000010f81b:	04 04                	add    $0x4,%al
ffff80000010f81d:	04 7c                	add    $0x7c,%al
ffff80000010f81f:	00 00                	add    %al,(%rax)
ffff80000010f821:	10 28                	adc    %ch,(%rax)
ffff80000010f823:	44 82                	rex.R (bad) 
	...
ffff80000010f83d:	00 fe                	add    %bh,%dh
ffff80000010f83f:	00 10                	add    %dl,(%rax)
ffff80000010f841:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010f854:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010f857:	04 3c                	add    $0x3c,%al
ffff80000010f859:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010f860:	c0 
ffff80000010f861:	40                   	rex
ffff80000010f862:	40                   	rex
ffff80000010f863:	40                   	rex
ffff80000010f864:	40 58                	rex pop %rax
ffff80000010f866:	64 42                	fs rex.X
ffff80000010f868:	42                   	rex.X
ffff80000010f869:	42                   	rex.X
ffff80000010f86a:	42                   	rex.X
ffff80000010f86b:	42                   	rex.X
ffff80000010f86c:	64 58                	fs pop %rax
ffff80000010f86e:	00 00                	add    %al,(%rax)
ffff80000010f870:	00 00                	add    %al,(%rax)
ffff80000010f872:	00 00                	add    %al,(%rax)
ffff80000010f874:	00 30                	add    %dh,(%rax)
ffff80000010f876:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010f87d:	38 
ffff80000010f87e:	00 00                	add    %al,(%rax)
ffff80000010f880:	0c 04                	or     $0x4,%al
ffff80000010f882:	04 04                	add    $0x4,%al
ffff80000010f884:	04 34                	add    $0x34,%al
ffff80000010f886:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010f88d:	36 
ffff80000010f88e:	00 00                	add    %al,(%rax)
ffff80000010f890:	00 00                	add    %al,(%rax)
ffff80000010f892:	00 00                	add    %al,(%rax)
ffff80000010f894:	00 38                	add    %bh,(%rax)
ffff80000010f896:	44 82                	rex.R (bad) 
ffff80000010f898:	82                   	(bad)  
ffff80000010f899:	fc                   	cld    
ffff80000010f89a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010f8a1:	10 10                	adc    %dl,(%rax)
ffff80000010f8a3:	10 10                	adc    %dl,(%rax)
ffff80000010f8a5:	7c 10                	jl     ffff80000010f8b7 <system_call_table+0x3a77>
ffff80000010f8a7:	10 10                	adc    %dl,(%rax)
ffff80000010f8a9:	10 10                	adc    %dl,(%rax)
ffff80000010f8ab:	10 10                	adc    %dl,(%rax)
ffff80000010f8ad:	7c 00                	jl     ffff80000010f8af <system_call_table+0x3a6f>
ffff80000010f8af:	00 00                	add    %al,(%rax)
ffff80000010f8b1:	00 00                	add    %al,(%rax)
ffff80000010f8b3:	00 00                	add    %al,(%rax)
ffff80000010f8b5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010f8bc:	34 04 
ffff80000010f8be:	04 38                	add    $0x38,%al
ffff80000010f8c0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010f8c4:	40 58                	rex pop %rax
ffff80000010f8c6:	64 42                	fs rex.X
ffff80000010f8c8:	42                   	rex.X
ffff80000010f8c9:	42                   	rex.X
ffff80000010f8ca:	42                   	rex.X
ffff80000010f8cb:	42                   	rex.X
ffff80000010f8cc:	42 e3 00             	rex.X jrcxz ffff80000010f8cf <system_call_table+0x3a8f>
ffff80000010f8cf:	00 00                	add    %al,(%rax)
ffff80000010f8d1:	10 10                	adc    %dl,(%rax)
ffff80000010f8d3:	00 00                	add    %al,(%rax)
ffff80000010f8d5:	30 10                	xor    %dl,(%rax)
ffff80000010f8d7:	10 10                	adc    %dl,(%rax)
ffff80000010f8d9:	10 10                	adc    %dl,(%rax)
ffff80000010f8db:	10 10                	adc    %dl,(%rax)
ffff80000010f8dd:	38 00                	cmp    %al,(%rax)
ffff80000010f8df:	00 00                	add    %al,(%rax)
ffff80000010f8e1:	04 04                	add    $0x4,%al
ffff80000010f8e3:	00 00                	add    %al,(%rax)
ffff80000010f8e5:	0c 04                	or     $0x4,%al
ffff80000010f8e7:	04 04                	add    $0x4,%al
ffff80000010f8e9:	04 04                	add    $0x4,%al
ffff80000010f8eb:	04 04                	add    $0x4,%al
ffff80000010f8ed:	08 08                	or     %cl,(%rax)
ffff80000010f8ef:	30 c0                	xor    %al,%al
ffff80000010f8f1:	40                   	rex
ffff80000010f8f2:	40                   	rex
ffff80000010f8f3:	40                   	rex
ffff80000010f8f4:	40                   	rex
ffff80000010f8f5:	4e                   	rex.WRX
ffff80000010f8f6:	44                   	rex.R
ffff80000010f8f7:	48 50                	rex.W push %rax
ffff80000010f8f9:	60                   	(bad)  
ffff80000010f8fa:	50                   	push   %rax
ffff80000010f8fb:	48                   	rex.W
ffff80000010f8fc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010f8ff:	00 30                	add    %dh,(%rax)
ffff80000010f901:	10 10                	adc    %dl,(%rax)
ffff80000010f903:	10 10                	adc    %dl,(%rax)
ffff80000010f905:	10 10                	adc    %dl,(%rax)
ffff80000010f907:	10 10                	adc    %dl,(%rax)
ffff80000010f909:	10 10                	adc    %dl,(%rax)
ffff80000010f90b:	10 10                	adc    %dl,(%rax)
ffff80000010f90d:	38 00                	cmp    %al,(%rax)
ffff80000010f90f:	00 00                	add    %al,(%rax)
ffff80000010f911:	00 00                	add    %al,(%rax)
ffff80000010f913:	00 00                	add    %al,(%rax)
ffff80000010f915:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010f919:	49                   	rex.WB
ffff80000010f91a:	49                   	rex.WB
ffff80000010f91b:	49                   	rex.WB
ffff80000010f91c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010f91f:	00 00                	add    %al,(%rax)
ffff80000010f921:	00 00                	add    %al,(%rax)
ffff80000010f923:	00 00                	add    %al,(%rax)
ffff80000010f925:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010f929:	42                   	rex.X
ffff80000010f92a:	42                   	rex.X
ffff80000010f92b:	42                   	rex.X
ffff80000010f92c:	42 e3 00             	rex.X jrcxz ffff80000010f92f <system_call_table+0x3aef>
ffff80000010f92f:	00 00                	add    %al,(%rax)
ffff80000010f931:	00 00                	add    %al,(%rax)
ffff80000010f933:	00 00                	add    %al,(%rax)
ffff80000010f935:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f939:	82                   	(bad)  
ffff80000010f93a:	82                   	(bad)  
ffff80000010f93b:	82                   	(bad)  
ffff80000010f93c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f93f:	00 00                	add    %al,(%rax)
ffff80000010f941:	00 00                	add    %al,(%rax)
ffff80000010f943:	00 d8                	add    %bl,%al
ffff80000010f945:	64 42                	fs rex.X
ffff80000010f947:	42                   	rex.X
ffff80000010f948:	42                   	rex.X
ffff80000010f949:	42                   	rex.X
ffff80000010f94a:	42                   	rex.X
ffff80000010f94b:	64 58                	fs pop %rax
ffff80000010f94d:	40                   	rex
ffff80000010f94e:	40 e0 00             	rex loopne ffff80000010f951 <system_call_table+0x3b11>
ffff80000010f951:	00 00                	add    %al,(%rax)
ffff80000010f953:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010f956:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010f95d:	04 04                	add    $0x4,%al
ffff80000010f95f:	0e                   	(bad)  
ffff80000010f960:	00 00                	add    %al,(%rax)
ffff80000010f962:	00 00                	add    %al,(%rax)
ffff80000010f964:	00 dc                	add    %bl,%ah
ffff80000010f966:	62 42                	(bad)  
ffff80000010f968:	40                   	rex
ffff80000010f969:	40                   	rex
ffff80000010f96a:	40                   	rex
ffff80000010f96b:	40                   	rex
ffff80000010f96c:	40 e0 00             	rex loopne ffff80000010f96f <system_call_table+0x3b2f>
ffff80000010f96f:	00 00                	add    %al,(%rax)
ffff80000010f971:	00 00                	add    %al,(%rax)
ffff80000010f973:	00 00                	add    %al,(%rax)
ffff80000010f975:	7a 86                	jp     ffff80000010f8fd <system_call_table+0x3abd>
ffff80000010f977:	82                   	(bad)  
ffff80000010f978:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010f97b:	82                   	(bad)  
ffff80000010f97c:	c2 bc 00             	retq   $0xbc
ffff80000010f97f:	00 00                	add    %al,(%rax)
ffff80000010f981:	00 10                	add    %dl,(%rax)
ffff80000010f983:	10 10                	adc    %dl,(%rax)
ffff80000010f985:	7c 10                	jl     ffff80000010f997 <system_call_table+0x3b57>
ffff80000010f987:	10 10                	adc    %dl,(%rax)
ffff80000010f989:	10 10                	adc    %dl,(%rax)
ffff80000010f98b:	10 10                	adc    %dl,(%rax)
ffff80000010f98d:	0e                   	(bad)  
ffff80000010f98e:	00 00                	add    %al,(%rax)
ffff80000010f990:	00 00                	add    %al,(%rax)
ffff80000010f992:	00 00                	add    %al,(%rax)
ffff80000010f994:	00 c6                	add    %al,%dh
ffff80000010f996:	42                   	rex.X
ffff80000010f997:	42                   	rex.X
ffff80000010f998:	42                   	rex.X
ffff80000010f999:	42                   	rex.X
ffff80000010f99a:	42                   	rex.X
ffff80000010f99b:	42                   	rex.X
ffff80000010f99c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010f99f:	00 00                	add    %al,(%rax)
ffff80000010f9a1:	00 00                	add    %al,(%rax)
ffff80000010f9a3:	00 00                	add    %al,(%rax)
ffff80000010f9a5:	e7 42                	out    %eax,$0x42
ffff80000010f9a7:	42                   	rex.X
ffff80000010f9a8:	42 24 24             	rex.X and $0x24,%al
ffff80000010f9ab:	24 18                	and    $0x18,%al
ffff80000010f9ad:	18 00                	sbb    %al,(%rax)
ffff80000010f9af:	00 00                	add    %al,(%rax)
ffff80000010f9b1:	00 00                	add    %al,(%rax)
ffff80000010f9b3:	00 00                	add    %al,(%rax)
ffff80000010f9b5:	e7 42                	out    %eax,$0x42
ffff80000010f9b7:	42 5a                	rex.X pop %rdx
ffff80000010f9b9:	5a                   	pop    %rdx
ffff80000010f9ba:	5a                   	pop    %rdx
ffff80000010f9bb:	24 24                	and    $0x24,%al
ffff80000010f9bd:	24 00                	and    $0x0,%al
ffff80000010f9bf:	00 00                	add    %al,(%rax)
ffff80000010f9c1:	00 00                	add    %al,(%rax)
ffff80000010f9c3:	00 00                	add    %al,(%rax)
ffff80000010f9c5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010f9ca:	28 28                	sub    %ch,(%rax)
ffff80000010f9cc:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010f9d0:	00 00                	add    %al,(%rax)
ffff80000010f9d2:	00 00                	add    %al,(%rax)
ffff80000010f9d4:	00 e7                	add    %ah,%bh
ffff80000010f9d6:	42                   	rex.X
ffff80000010f9d7:	42 24 24             	rex.X and $0x24,%al
ffff80000010f9da:	24 18                	and    $0x18,%al
ffff80000010f9dc:	18 10                	sbb    %dl,(%rax)
ffff80000010f9de:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010f9e1:	00 00                	add    %al,(%rax)
ffff80000010f9e3:	00 00                	add    %al,(%rax)
ffff80000010f9e5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010f9eb:	42 82                	rex.X (bad) 
ffff80000010f9ed:	fe 00                	incb   (%rax)
ffff80000010f9ef:	00 00                	add    %al,(%rax)
ffff80000010f9f1:	06                   	(bad)  
ffff80000010f9f2:	08 10                	or     %dl,(%rax)
ffff80000010f9f4:	10 10                	adc    %dl,(%rax)
ffff80000010f9f6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010f9f9:	10 10                	adc    %dl,(%rax)
ffff80000010f9fb:	10 08                	adc    %cl,(%rax)
ffff80000010f9fd:	06                   	(bad)  
ffff80000010f9fe:	00 00                	add    %al,(%rax)
ffff80000010fa00:	10 10                	adc    %dl,(%rax)
ffff80000010fa02:	10 10                	adc    %dl,(%rax)
ffff80000010fa04:	10 10                	adc    %dl,(%rax)
ffff80000010fa06:	10 10                	adc    %dl,(%rax)
ffff80000010fa08:	10 10                	adc    %dl,(%rax)
ffff80000010fa0a:	10 10                	adc    %dl,(%rax)
ffff80000010fa0c:	10 10                	adc    %dl,(%rax)
ffff80000010fa0e:	10 10                	adc    %dl,(%rax)
ffff80000010fa10:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010fa13:	08 08                	or     %cl,(%rax)
ffff80000010fa15:	08 08                	or     %cl,(%rax)
ffff80000010fa17:	06                   	(bad)  
ffff80000010fa18:	08 08                	or     %cl,(%rax)
ffff80000010fa1a:	08 08                	or     %cl,(%rax)
ffff80000010fa1c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010fa1f:	00 00                	add    %al,(%rax)
ffff80000010fa21:	72 8c                	jb     ffff80000010f9af <system_call_table+0x3b6f>
	...

ffff800000110240 <interrupt>:
ffff800000110240:	e9 80 10 00 00       	jmpq   ffff8000001112c5 <interrupt+0x1085>
ffff800000110245:	80 ff ff             	cmp    $0xff,%bh
ffff800000110248:	33 81 10 00 00 80    	xor    -0x7ffffff0(%rcx),%eax
ffff80000011024e:	ff                   	(bad)  
ffff80000011024f:	ff                   	(bad)  
ffff800000110250:	7d 81                	jge    ffff8000001101d3 <system_call_table+0x4393>
ffff800000110252:	10 00                	adc    %al,(%rax)
ffff800000110254:	00 80 ff ff c7 81    	add    %al,-0x7e380001(%rax)
ffff80000011025a:	10 00                	adc    %al,(%rax)
ffff80000011025c:	00 80 ff ff 11 82    	add    %al,-0x7dee0001(%rax)
ffff800000110262:	10 00                	adc    %al,(%rax)
ffff800000110264:	00 80 ff ff 5b 82    	add    %al,-0x7da40001(%rax)
ffff80000011026a:	10 00                	adc    %al,(%rax)
ffff80000011026c:	00 80 ff ff a5 82    	add    %al,-0x7d5a0001(%rax)
ffff800000110272:	10 00                	adc    %al,(%rax)
ffff800000110274:	00 80 ff ff ef 82    	add    %al,-0x7d100001(%rax)
ffff80000011027a:	10 00                	adc    %al,(%rax)
ffff80000011027c:	00 80 ff ff 39 83    	add    %al,-0x7cc60001(%rax)
ffff800000110282:	10 00                	adc    %al,(%rax)
ffff800000110284:	00 80 ff ff 83 83    	add    %al,-0x7c7c0001(%rax)
ffff80000011028a:	10 00                	adc    %al,(%rax)
ffff80000011028c:	00 80 ff ff cd 83    	add    %al,-0x7c320001(%rax)
ffff800000110292:	10 00                	adc    %al,(%rax)
ffff800000110294:	00 80 ff ff 17 84    	add    %al,-0x7be80001(%rax)
ffff80000011029a:	10 00                	adc    %al,(%rax)
ffff80000011029c:	00 80 ff ff 61 84    	add    %al,-0x7b9e0001(%rax)
ffff8000001102a2:	10 00                	adc    %al,(%rax)
ffff8000001102a4:	00 80 ff ff ab 84    	add    %al,-0x7b540001(%rax)
ffff8000001102aa:	10 00                	adc    %al,(%rax)
ffff8000001102ac:	00 80 ff ff f5 84    	add    %al,-0x7b0a0001(%rax)
ffff8000001102b2:	10 00                	adc    %al,(%rax)
ffff8000001102b4:	00 80 ff ff 3f 85    	add    %al,-0x7ac00001(%rax)
ffff8000001102ba:	10 00                	adc    %al,(%rax)
ffff8000001102bc:	00 80 ff ff 89 85    	add    %al,-0x7a760001(%rax)
ffff8000001102c2:	10 00                	adc    %al,(%rax)
ffff8000001102c4:	00 80 ff ff d3 85    	add    %al,-0x7a2c0001(%rax)
ffff8000001102ca:	10 00                	adc    %al,(%rax)
ffff8000001102cc:	00 80 ff ff 1d 86    	add    %al,-0x79e20001(%rax)
ffff8000001102d2:	10 00                	adc    %al,(%rax)
ffff8000001102d4:	00 80 ff ff 67 86    	add    %al,-0x79980001(%rax)
ffff8000001102da:	10 00                	adc    %al,(%rax)
ffff8000001102dc:	00 80 ff ff b1 86    	add    %al,-0x794e0001(%rax)
ffff8000001102e2:	10 00                	adc    %al,(%rax)
ffff8000001102e4:	00 80 ff ff fb 86    	add    %al,-0x79040001(%rax)
ffff8000001102ea:	10 00                	adc    %al,(%rax)
ffff8000001102ec:	00 80 ff ff 45 87    	add    %al,-0x78ba0001(%rax)
ffff8000001102f2:	10 00                	adc    %al,(%rax)
ffff8000001102f4:	00 80 ff ff 8f 87    	add    %al,-0x78700001(%rax)
ffff8000001102fa:	10 00                	adc    %al,(%rax)
ffff8000001102fc:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011050e:	00 00                	add    %al,(%rax)
ffff800000110510:	00 10                	add    %dl,(%rax)
ffff800000110512:	10 10                	adc    %dl,(%rax)
ffff800000110514:	10 10                	adc    %dl,(%rax)
ffff800000110516:	10 10                	adc    %dl,(%rax)
ffff800000110518:	10 10                	adc    %dl,(%rax)
ffff80000011051a:	00 00                	add    %al,(%rax)
ffff80000011051c:	10 10                	adc    %dl,(%rax)
ffff80000011051e:	00 00                	add    %al,(%rax)
ffff800000110520:	28 28                	sub    %ch,(%rax)
ffff800000110522:	28 00                	sub    %al,(%rax)
	...
ffff800000110530:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff800000110534:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff800000110538:	44                   	rex.R
ffff800000110539:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000011053e:	00 00                	add    %al,(%rax)
ffff800000110540:	10 3a                	adc    %bh,(%rdx)
ffff800000110542:	56                   	push   %rsi
ffff800000110543:	92                   	xchg   %eax,%edx
ffff800000110544:	92                   	xchg   %eax,%edx
ffff800000110545:	90                   	nop
ffff800000110546:	50                   	push   %rax
ffff800000110547:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000011054a:	92                   	xchg   %eax,%edx
ffff80000011054b:	92                   	xchg   %eax,%edx
ffff80000011054c:	d4                   	(bad)  
ffff80000011054d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff800000110552:	94                   	xchg   %eax,%esp
ffff800000110553:	94                   	xchg   %eax,%esp
ffff800000110554:	68 08 10 10 20       	pushq  $0x20101008
ffff800000110559:	2c 52                	sub    $0x52,%al
ffff80000011055b:	52                   	push   %rdx
ffff80000011055c:	92                   	xchg   %eax,%edx
ffff80000011055d:	8c 00                	mov    %es,(%rax)
ffff80000011055f:	00 00                	add    %al,(%rax)
ffff800000110561:	70 88                	jo     ffff8000001104eb <interrupt+0x2ab>
ffff800000110563:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff800000110569:	92                   	xchg   %eax,%edx
ffff80000011056a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff800000110571:	08 10                	or     %dl,(%rax)
	...
ffff80000011057f:	00 02                	add    %al,(%rdx)
ffff800000110581:	04 08                	add    $0x8,%al
ffff800000110583:	08 10                	or     %dl,(%rax)
ffff800000110585:	10 10                	adc    %dl,(%rax)
ffff800000110587:	10 10                	adc    %dl,(%rax)
ffff800000110589:	10 10                	adc    %dl,(%rax)
ffff80000011058b:	08 08                	or     %cl,(%rax)
ffff80000011058d:	04 02                	add    $0x2,%al
ffff80000011058f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff800000110595:	10 10                	adc    %dl,(%rax)
ffff800000110597:	10 10                	adc    %dl,(%rax)
ffff800000110599:	10 10                	adc    %dl,(%rax)
ffff80000011059b:	20 20                	and    %ah,(%rax)
ffff80000011059d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff8000001105a1:	00 00                	add    %al,(%rax)
ffff8000001105a3:	00 00                	add    %al,(%rax)
ffff8000001105a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff8000001105ab:	10 00                	adc    %al,(%rax)
	...
ffff8000001105b5:	10 10                	adc    %dl,(%rax)
ffff8000001105b7:	10 fe                	adc    %bh,%dh
ffff8000001105b9:	10 10                	adc    %dl,(%rax)
ffff8000001105bb:	10 00                	adc    %al,(%rax)
	...
ffff8000001105c9:	00 00                	add    %al,(%rax)
ffff8000001105cb:	18 18                	sbb    %bl,(%rax)
ffff8000001105cd:	08 08                	or     %cl,(%rax)
ffff8000001105cf:	10 00                	adc    %al,(%rax)
ffff8000001105d1:	00 00                	add    %al,(%rax)
ffff8000001105d3:	00 00                	add    %al,(%rax)
ffff8000001105d5:	00 00                	add    %al,(%rax)
ffff8000001105d7:	00 fe                	add    %bh,%dh
	...
ffff8000001105e9:	00 00                	add    %al,(%rax)
ffff8000001105eb:	00 18                	add    %bl,(%rax)
ffff8000001105ed:	18 00                	sbb    %al,(%rax)
ffff8000001105ef:	00 02                	add    %al,(%rdx)
ffff8000001105f1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff8000001105f4:	08 08                	or     %cl,(%rax)
ffff8000001105f6:	08 10                	or     %dl,(%rax)
ffff8000001105f8:	10 20                	adc    %ah,(%rax)
ffff8000001105fa:	20 40 40             	and    %al,0x40(%rax)
ffff8000001105fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff800000110604:	42 
ffff800000110605:	42                   	rex.X
ffff800000110606:	42                   	rex.X
ffff800000110607:	42                   	rex.X
ffff800000110608:	42                   	rex.X
ffff800000110609:	42                   	rex.X
ffff80000011060a:	42 24 24             	rex.X and $0x24,%al
ffff80000011060d:	18 00                	sbb    %al,(%rax)
ffff80000011060f:	00 00                	add    %al,(%rax)
ffff800000110611:	08 18                	or     %bl,(%rax)
ffff800000110613:	28 08                	sub    %cl,(%rax)
ffff800000110615:	08 08                	or     %cl,(%rax)
ffff800000110617:	08 08                	or     %cl,(%rax)
ffff800000110619:	08 08                	or     %cl,(%rax)
ffff80000011061b:	08 08                	or     %cl,(%rax)
ffff80000011061d:	3e 00 00             	add    %al,%ds:(%rax)
ffff800000110620:	00 18                	add    %bl,(%rax)
ffff800000110622:	24 42                	and    $0x42,%al
ffff800000110624:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff800000110628:	10 20                	adc    %ah,(%rax)
ffff80000011062a:	20 40 40             	and    %al,0x40(%rax)
ffff80000011062d:	7e 00                	jle    ffff80000011062f <interrupt+0x3ef>
ffff80000011062f:	00 00                	add    %al,(%rax)
ffff800000110631:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff800000110634:	02 02                	add    (%rdx),%al
ffff800000110636:	04 18                	add    $0x18,%al
ffff800000110638:	04 02                	add    $0x2,%al
ffff80000011063a:	02 42 24             	add    0x24(%rdx),%al
ffff80000011063d:	18 00                	sbb    %al,(%rax)
ffff80000011063f:	00 00                	add    %al,(%rax)
ffff800000110641:	0c 0c                	or     $0xc,%al
ffff800000110643:	0c 14                	or     $0x14,%al
ffff800000110645:	14 14                	adc    $0x14,%al
ffff800000110647:	24 24                	and    $0x24,%al
ffff800000110649:	44 7e 04             	rex.R jle ffff800000110650 <interrupt+0x410>
ffff80000011064c:	04 1e                	add    $0x1e,%al
ffff80000011064e:	00 00                	add    %al,(%rax)
ffff800000110650:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff800000110654:	40 58                	rex pop %rax
ffff800000110656:	64 02 02             	add    %fs:(%rdx),%al
ffff800000110659:	02 02                	add    (%rdx),%al
ffff80000011065b:	42 24 18             	rex.X and $0x18,%al
ffff80000011065e:	00 00                	add    %al,(%rax)
ffff800000110660:	00 18                	add    %bl,(%rax)
ffff800000110662:	24 42                	and    $0x42,%al
ffff800000110664:	40 58                	rex pop %rax
ffff800000110666:	64 42                	fs rex.X
ffff800000110668:	42                   	rex.X
ffff800000110669:	42                   	rex.X
ffff80000011066a:	42                   	rex.X
ffff80000011066b:	42 24 18             	rex.X and $0x18,%al
ffff80000011066e:	00 00                	add    %al,(%rax)
ffff800000110670:	00 7e 42             	add    %bh,0x42(%rsi)
ffff800000110673:	42 04 04             	rex.X add $0x4,%al
ffff800000110676:	08 08                	or     %cl,(%rax)
ffff800000110678:	08 10                	or     %dl,(%rax)
ffff80000011067a:	10 10                	adc    %dl,(%rax)
ffff80000011067c:	10 38                	adc    %bh,(%rax)
ffff80000011067e:	00 00                	add    %al,(%rax)
ffff800000110680:	00 18                	add    %bl,(%rax)
ffff800000110682:	24 42                	and    $0x42,%al
ffff800000110684:	42                   	rex.X
ffff800000110685:	42 24 18             	rex.X and $0x18,%al
ffff800000110688:	24 42                	and    $0x42,%al
ffff80000011068a:	42                   	rex.X
ffff80000011068b:	42 24 18             	rex.X and $0x18,%al
ffff80000011068e:	00 00                	add    %al,(%rax)
ffff800000110690:	00 18                	add    %bl,(%rax)
ffff800000110692:	24 42                	and    $0x42,%al
ffff800000110694:	42                   	rex.X
ffff800000110695:	42                   	rex.X
ffff800000110696:	42                   	rex.X
ffff800000110697:	42                   	rex.X
ffff800000110698:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000011069b:	42 24 18             	rex.X and $0x18,%al
ffff80000011069e:	00 00                	add    %al,(%rax)
ffff8000001106a0:	00 00                	add    %al,(%rax)
ffff8000001106a2:	00 00                	add    %al,(%rax)
ffff8000001106a4:	00 18                	add    %bl,(%rax)
ffff8000001106a6:	18 00                	sbb    %al,(%rax)
ffff8000001106a8:	00 00                	add    %al,(%rax)
ffff8000001106aa:	00 00                	add    %al,(%rax)
ffff8000001106ac:	18 18                	sbb    %bl,(%rax)
ffff8000001106ae:	00 00                	add    %al,(%rax)
ffff8000001106b0:	00 00                	add    %al,(%rax)
ffff8000001106b2:	00 00                	add    %al,(%rax)
ffff8000001106b4:	00 18                	add    %bl,(%rax)
ffff8000001106b6:	18 00                	sbb    %al,(%rax)
ffff8000001106b8:	00 00                	add    %al,(%rax)
ffff8000001106ba:	00 18                	add    %bl,(%rax)
ffff8000001106bc:	18 08                	sbb    %cl,(%rax)
ffff8000001106be:	08 10                	or     %dl,(%rax)
ffff8000001106c0:	00 02                	add    %al,(%rdx)
ffff8000001106c2:	04 08                	add    $0x8,%al
ffff8000001106c4:	10 20                	adc    %ah,(%rax)
ffff8000001106c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff8000001106cd:	04 
ffff8000001106ce:	02 00                	add    (%rax),%al
ffff8000001106d0:	00 00                	add    %al,(%rax)
ffff8000001106d2:	00 00                	add    %al,(%rax)
ffff8000001106d4:	00 00                	add    %al,(%rax)
ffff8000001106d6:	fe 00                	incb   (%rax)
ffff8000001106d8:	00 fe                	add    %bh,%dh
ffff8000001106da:	00 00                	add    %al,(%rax)
ffff8000001106dc:	00 00                	add    %al,(%rax)
ffff8000001106de:	00 00                	add    %al,(%rax)
ffff8000001106e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff8000001106e6:	04 02                	add    $0x2,%al
ffff8000001106e8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff8000001106eb:	10 20                	adc    %ah,(%rax)
ffff8000001106ed:	40 80 00 00          	rex addb $0x0,(%rax)
ffff8000001106f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001106f5:	82                   	(bad)  
ffff8000001106f6:	04 08                	add    $0x8,%al
ffff8000001106f8:	10 10                	adc    %dl,(%rax)
ffff8000001106fa:	00 00                	add    %al,(%rax)
ffff8000001106fc:	18 18                	sbb    %bl,(%rax)
ffff8000001106fe:	00 00                	add    %al,(%rax)
ffff800000110700:	00 38                	add    %bh,(%rax)
ffff800000110702:	44 82                	rex.R (bad) 
ffff800000110704:	9a                   	(bad)  
ffff800000110705:	aa                   	stos   %al,%es:(%rdi)
ffff800000110706:	aa                   	stos   %al,%es:(%rdi)
ffff800000110707:	aa                   	stos   %al,%es:(%rdi)
ffff800000110708:	aa                   	stos   %al,%es:(%rdi)
ffff800000110709:	aa                   	stos   %al,%es:(%rdi)
ffff80000011070a:	9c                   	pushfq 
ffff80000011070b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000011070f:	00 00                	add    %al,(%rax)
ffff800000110711:	18 18                	sbb    %bl,(%rax)
ffff800000110713:	18 18                	sbb    %bl,(%rax)
ffff800000110715:	24 24                	and    $0x24,%al
ffff800000110717:	24 24                	and    $0x24,%al
ffff800000110719:	7e 42                	jle    ffff80000011075d <interrupt+0x51d>
ffff80000011071b:	42                   	rex.X
ffff80000011071c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011071f:	00 00                	add    %al,(%rax)
ffff800000110721:	f0 48                	lock rex.W
ffff800000110723:	44                   	rex.R
ffff800000110724:	44                   	rex.R
ffff800000110725:	44                   	rex.R
ffff800000110726:	48 78 44             	rex.W js ffff80000011076d <interrupt+0x52d>
ffff800000110729:	42                   	rex.X
ffff80000011072a:	42                   	rex.X
ffff80000011072b:	42                   	rex.X
ffff80000011072c:	44 f8                	rex.R clc 
ffff80000011072e:	00 00                	add    %al,(%rax)
ffff800000110730:	00 3a                	add    %bh,(%rdx)
ffff800000110732:	46                   	rex.RX
ffff800000110733:	42 82                	rex.X (bad) 
ffff800000110735:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000011073c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011073f:	00 00                	add    %al,(%rax)
ffff800000110741:	f8                   	clc    
ffff800000110742:	44                   	rex.R
ffff800000110743:	44                   	rex.R
ffff800000110744:	42                   	rex.X
ffff800000110745:	42                   	rex.X
ffff800000110746:	42                   	rex.X
ffff800000110747:	42                   	rex.X
ffff800000110748:	42                   	rex.X
ffff800000110749:	42                   	rex.X
ffff80000011074a:	42                   	rex.X
ffff80000011074b:	44                   	rex.R
ffff80000011074c:	44 f8                	rex.R clc 
ffff80000011074e:	00 00                	add    %al,(%rax)
ffff800000110750:	00 fe                	add    %bh,%dh
ffff800000110752:	42                   	rex.X
ffff800000110753:	42                   	rex.X
ffff800000110754:	40                   	rex
ffff800000110755:	40                   	rex
ffff800000110756:	44 7c 44             	rex.R jl ffff80000011079d <interrupt+0x55d>
ffff800000110759:	40                   	rex
ffff80000011075a:	40                   	rex
ffff80000011075b:	42                   	rex.X
ffff80000011075c:	42 fe 00             	rex.X incb (%rax)
ffff80000011075f:	00 00                	add    %al,(%rax)
ffff800000110761:	fe 42 42             	incb   0x42(%rdx)
ffff800000110764:	40                   	rex
ffff800000110765:	40                   	rex
ffff800000110766:	44 7c 44             	rex.R jl ffff8000001107ad <interrupt+0x56d>
ffff800000110769:	44                   	rex.R
ffff80000011076a:	40                   	rex
ffff80000011076b:	40                   	rex
ffff80000011076c:	40                   	rex
ffff80000011076d:	f0 00 00             	lock add %al,(%rax)
ffff800000110770:	00 3a                	add    %bh,(%rdx)
ffff800000110772:	46                   	rex.RX
ffff800000110773:	42 82                	rex.X (bad) 
ffff800000110775:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000011077c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000011077f:	00 00                	add    %al,(%rax)
ffff800000110781:	e7 42                	out    %eax,$0x42
ffff800000110783:	42                   	rex.X
ffff800000110784:	42                   	rex.X
ffff800000110785:	42                   	rex.X
ffff800000110786:	42 7e 42             	rex.X jle ffff8000001107cb <interrupt+0x58b>
ffff800000110789:	42                   	rex.X
ffff80000011078a:	42                   	rex.X
ffff80000011078b:	42                   	rex.X
ffff80000011078c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011078f:	00 00                	add    %al,(%rax)
ffff800000110791:	7c 10                	jl     ffff8000001107a3 <interrupt+0x563>
ffff800000110793:	10 10                	adc    %dl,(%rax)
ffff800000110795:	10 10                	adc    %dl,(%rax)
ffff800000110797:	10 10                	adc    %dl,(%rax)
ffff800000110799:	10 10                	adc    %dl,(%rax)
ffff80000011079b:	10 10                	adc    %dl,(%rax)
ffff80000011079d:	7c 00                	jl     ffff80000011079f <interrupt+0x55f>
ffff80000011079f:	00 00                	add    %al,(%rax)
ffff8000001107a1:	1f                   	(bad)  
ffff8000001107a2:	04 04                	add    $0x4,%al
ffff8000001107a4:	04 04                	add    $0x4,%al
ffff8000001107a6:	04 04                	add    $0x4,%al
ffff8000001107a8:	04 04                	add    $0x4,%al
ffff8000001107aa:	04 04                	add    $0x4,%al
ffff8000001107ac:	84 48 30             	test   %cl,0x30(%rax)
ffff8000001107af:	00 00                	add    %al,(%rax)
ffff8000001107b1:	e7 42                	out    %eax,$0x42
ffff8000001107b3:	44                   	rex.R
ffff8000001107b4:	48 50                	rex.W push %rax
ffff8000001107b6:	50                   	push   %rax
ffff8000001107b7:	60                   	(bad)  
ffff8000001107b8:	50                   	push   %rax
ffff8000001107b9:	50                   	push   %rax
ffff8000001107ba:	48                   	rex.W
ffff8000001107bb:	44                   	rex.R
ffff8000001107bc:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001107bf:	00 00                	add    %al,(%rax)
ffff8000001107c1:	f0 40                	lock rex
ffff8000001107c3:	40                   	rex
ffff8000001107c4:	40                   	rex
ffff8000001107c5:	40                   	rex
ffff8000001107c6:	40                   	rex
ffff8000001107c7:	40                   	rex
ffff8000001107c8:	40                   	rex
ffff8000001107c9:	40                   	rex
ffff8000001107ca:	40                   	rex
ffff8000001107cb:	42                   	rex.X
ffff8000001107cc:	42 fe 00             	rex.X incb (%rax)
ffff8000001107cf:	00 00                	add    %al,(%rax)
ffff8000001107d1:	c3                   	retq   
ffff8000001107d2:	42                   	rex.X
ffff8000001107d3:	66 66 66 5a          	data16 data16 pop %dx
ffff8000001107d7:	5a                   	pop    %rdx
ffff8000001107d8:	5a                   	pop    %rdx
ffff8000001107d9:	42                   	rex.X
ffff8000001107da:	42                   	rex.X
ffff8000001107db:	42                   	rex.X
ffff8000001107dc:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001107df:	00 00                	add    %al,(%rax)
ffff8000001107e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff8000001107e8:	4a                   	rex.WX
ffff8000001107e9:	4a                   	rex.WX
ffff8000001107ea:	4a                   	rex.WX
ffff8000001107eb:	46                   	rex.RX
ffff8000001107ec:	46 e2 00             	rex.RX loop ffff8000001107ef <interrupt+0x5af>
ffff8000001107ef:	00 00                	add    %al,(%rax)
ffff8000001107f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001107f5:	82                   	(bad)  
ffff8000001107f6:	82                   	(bad)  
ffff8000001107f7:	82                   	(bad)  
ffff8000001107f8:	82                   	(bad)  
ffff8000001107f9:	82                   	(bad)  
ffff8000001107fa:	82                   	(bad)  
ffff8000001107fb:	82                   	(bad)  
ffff8000001107fc:	44 38 00             	cmp    %r8b,(%rax)
ffff8000001107ff:	00 00                	add    %al,(%rax)
ffff800000110801:	f8                   	clc    
ffff800000110802:	44                   	rex.R
ffff800000110803:	42                   	rex.X
ffff800000110804:	42                   	rex.X
ffff800000110805:	42                   	rex.X
ffff800000110806:	44 78 40             	rex.R js ffff800000110849 <interrupt+0x609>
ffff800000110809:	40                   	rex
ffff80000011080a:	40                   	rex
ffff80000011080b:	40                   	rex
ffff80000011080c:	40                   	rex
ffff80000011080d:	f0 00 00             	lock add %al,(%rax)
ffff800000110810:	00 38                	add    %bh,(%rax)
ffff800000110812:	44 82                	rex.R (bad) 
ffff800000110814:	82                   	(bad)  
ffff800000110815:	82                   	(bad)  
ffff800000110816:	82                   	(bad)  
ffff800000110817:	82                   	(bad)  
ffff800000110818:	82                   	(bad)  
ffff800000110819:	82                   	(bad)  
ffff80000011081a:	92                   	xchg   %eax,%edx
ffff80000011081b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000011081f:	00 00                	add    %al,(%rax)
ffff800000110821:	fc                   	cld    
ffff800000110822:	42                   	rex.X
ffff800000110823:	42                   	rex.X
ffff800000110824:	42                   	rex.X
ffff800000110825:	42 7c 44             	rex.X jl ffff80000011086c <interrupt+0x62c>
ffff800000110828:	42                   	rex.X
ffff800000110829:	42                   	rex.X
ffff80000011082a:	42                   	rex.X
ffff80000011082b:	42                   	rex.X
ffff80000011082c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011082f:	00 00                	add    %al,(%rax)
ffff800000110831:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff800000110834:	82                   	(bad)  
ffff800000110835:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff800000110839:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000011083f:	00 00                	add    %al,(%rax)
ffff800000110841:	fe                   	(bad)  
ffff800000110842:	92                   	xchg   %eax,%edx
ffff800000110843:	92                   	xchg   %eax,%edx
ffff800000110844:	10 10                	adc    %dl,(%rax)
ffff800000110846:	10 10                	adc    %dl,(%rax)
ffff800000110848:	10 10                	adc    %dl,(%rax)
ffff80000011084a:	10 10                	adc    %dl,(%rax)
ffff80000011084c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff800000110850:	00 e7                	add    %ah,%bh
ffff800000110852:	42                   	rex.X
ffff800000110853:	42                   	rex.X
ffff800000110854:	42                   	rex.X
ffff800000110855:	42                   	rex.X
ffff800000110856:	42                   	rex.X
ffff800000110857:	42                   	rex.X
ffff800000110858:	42                   	rex.X
ffff800000110859:	42                   	rex.X
ffff80000011085a:	42                   	rex.X
ffff80000011085b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000011085e:	00 00                	add    %al,(%rax)
ffff800000110860:	00 e7                	add    %ah,%bh
ffff800000110862:	42                   	rex.X
ffff800000110863:	42                   	rex.X
ffff800000110864:	42                   	rex.X
ffff800000110865:	42 24 24             	rex.X and $0x24,%al
ffff800000110868:	24 24                	and    $0x24,%al
ffff80000011086a:	18 18                	sbb    %bl,(%rax)
ffff80000011086c:	18 18                	sbb    %bl,(%rax)
ffff80000011086e:	00 00                	add    %al,(%rax)
ffff800000110870:	00 e7                	add    %ah,%bh
ffff800000110872:	42                   	rex.X
ffff800000110873:	42                   	rex.X
ffff800000110874:	42 5a                	rex.X pop %rdx
ffff800000110876:	5a                   	pop    %rdx
ffff800000110877:	5a                   	pop    %rdx
ffff800000110878:	5a                   	pop    %rdx
ffff800000110879:	24 24                	and    $0x24,%al
ffff80000011087b:	24 24                	and    $0x24,%al
ffff80000011087d:	24 00                	and    $0x0,%al
ffff80000011087f:	00 00                	add    %al,(%rax)
ffff800000110881:	e7 42                	out    %eax,$0x42
ffff800000110883:	42 24 24             	rex.X and $0x24,%al
ffff800000110886:	24 18                	and    $0x18,%al
ffff800000110888:	24 24                	and    $0x24,%al
ffff80000011088a:	24 42                	and    $0x42,%al
ffff80000011088c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011088f:	00 00                	add    %al,(%rax)
ffff800000110891:	ee                   	out    %al,(%dx)
ffff800000110892:	44                   	rex.R
ffff800000110893:	44                   	rex.R
ffff800000110894:	44 28 28             	sub    %r13b,(%rax)
ffff800000110897:	28 10                	sub    %dl,(%rax)
ffff800000110899:	10 10                	adc    %dl,(%rax)
ffff80000011089b:	10 10                	adc    %dl,(%rax)
ffff80000011089d:	7c 00                	jl     ffff80000011089f <interrupt+0x65f>
ffff80000011089f:	00 00                	add    %al,(%rax)
ffff8000001108a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff8000001108a8:	20 20                	and    %ah,(%rax)
ffff8000001108aa:	40                   	rex
ffff8000001108ab:	42 82                	rex.X (bad) 
ffff8000001108ad:	fe 00                	incb   (%rax)
ffff8000001108af:	00 00                	add    %al,(%rax)
ffff8000001108b1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff8000001108b4:	20 20                	and    %ah,(%rax)
ffff8000001108b6:	20 20                	and    %ah,(%rax)
ffff8000001108b8:	20 20                	and    %ah,(%rax)
ffff8000001108ba:	20 20                	and    %ah,(%rax)
ffff8000001108bc:	20 20                	and    %ah,(%rax)
ffff8000001108be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff8000001108c5:	20 20                	and    %ah,(%rax)
ffff8000001108c7:	10 10                	adc    %dl,(%rax)
ffff8000001108c9:	08 08                	or     %cl,(%rax)
ffff8000001108cb:	04 04                	add    $0x4,%al
ffff8000001108cd:	04 02                	add    $0x2,%al
ffff8000001108cf:	02 00                	add    (%rax),%al
ffff8000001108d1:	7c 04                	jl     ffff8000001108d7 <interrupt+0x697>
ffff8000001108d3:	04 04                	add    $0x4,%al
ffff8000001108d5:	04 04                	add    $0x4,%al
ffff8000001108d7:	04 04                	add    $0x4,%al
ffff8000001108d9:	04 04                	add    $0x4,%al
ffff8000001108db:	04 04                	add    $0x4,%al
ffff8000001108dd:	04 7c                	add    $0x7c,%al
ffff8000001108df:	00 00                	add    %al,(%rax)
ffff8000001108e1:	10 28                	adc    %ch,(%rax)
ffff8000001108e3:	44 82                	rex.R (bad) 
	...
ffff8000001108fd:	00 fe                	add    %bh,%dh
ffff8000001108ff:	00 10                	add    %dl,(%rax)
ffff800000110901:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff800000110914:	00 70 08             	add    %dh,0x8(%rax)
ffff800000110917:	04 3c                	add    $0x3c,%al
ffff800000110919:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff800000110920:	c0 
ffff800000110921:	40                   	rex
ffff800000110922:	40                   	rex
ffff800000110923:	40                   	rex
ffff800000110924:	40 58                	rex pop %rax
ffff800000110926:	64 42                	fs rex.X
ffff800000110928:	42                   	rex.X
ffff800000110929:	42                   	rex.X
ffff80000011092a:	42                   	rex.X
ffff80000011092b:	42                   	rex.X
ffff80000011092c:	64 58                	fs pop %rax
ffff80000011092e:	00 00                	add    %al,(%rax)
ffff800000110930:	00 00                	add    %al,(%rax)
ffff800000110932:	00 00                	add    %al,(%rax)
ffff800000110934:	00 30                	add    %dh,(%rax)
ffff800000110936:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000011093d:	38 
ffff80000011093e:	00 00                	add    %al,(%rax)
ffff800000110940:	0c 04                	or     $0x4,%al
ffff800000110942:	04 04                	add    $0x4,%al
ffff800000110944:	04 34                	add    $0x34,%al
ffff800000110946:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000011094d:	36 
ffff80000011094e:	00 00                	add    %al,(%rax)
ffff800000110950:	00 00                	add    %al,(%rax)
ffff800000110952:	00 00                	add    %al,(%rax)
ffff800000110954:	00 38                	add    %bh,(%rax)
ffff800000110956:	44 82                	rex.R (bad) 
ffff800000110958:	82                   	(bad)  
ffff800000110959:	fc                   	cld    
ffff80000011095a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff800000110961:	10 10                	adc    %dl,(%rax)
ffff800000110963:	10 10                	adc    %dl,(%rax)
ffff800000110965:	7c 10                	jl     ffff800000110977 <interrupt+0x737>
ffff800000110967:	10 10                	adc    %dl,(%rax)
ffff800000110969:	10 10                	adc    %dl,(%rax)
ffff80000011096b:	10 10                	adc    %dl,(%rax)
ffff80000011096d:	7c 00                	jl     ffff80000011096f <interrupt+0x72f>
ffff80000011096f:	00 00                	add    %al,(%rax)
ffff800000110971:	00 00                	add    %al,(%rax)
ffff800000110973:	00 00                	add    %al,(%rax)
ffff800000110975:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000011097c:	34 04 
ffff80000011097e:	04 38                	add    $0x38,%al
ffff800000110980:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff800000110984:	40 58                	rex pop %rax
ffff800000110986:	64 42                	fs rex.X
ffff800000110988:	42                   	rex.X
ffff800000110989:	42                   	rex.X
ffff80000011098a:	42                   	rex.X
ffff80000011098b:	42                   	rex.X
ffff80000011098c:	42 e3 00             	rex.X jrcxz ffff80000011098f <interrupt+0x74f>
ffff80000011098f:	00 00                	add    %al,(%rax)
ffff800000110991:	10 10                	adc    %dl,(%rax)
ffff800000110993:	00 00                	add    %al,(%rax)
ffff800000110995:	30 10                	xor    %dl,(%rax)
ffff800000110997:	10 10                	adc    %dl,(%rax)
ffff800000110999:	10 10                	adc    %dl,(%rax)
ffff80000011099b:	10 10                	adc    %dl,(%rax)
ffff80000011099d:	38 00                	cmp    %al,(%rax)
ffff80000011099f:	00 00                	add    %al,(%rax)
ffff8000001109a1:	04 04                	add    $0x4,%al
ffff8000001109a3:	00 00                	add    %al,(%rax)
ffff8000001109a5:	0c 04                	or     $0x4,%al
ffff8000001109a7:	04 04                	add    $0x4,%al
ffff8000001109a9:	04 04                	add    $0x4,%al
ffff8000001109ab:	04 04                	add    $0x4,%al
ffff8000001109ad:	08 08                	or     %cl,(%rax)
ffff8000001109af:	30 c0                	xor    %al,%al
ffff8000001109b1:	40                   	rex
ffff8000001109b2:	40                   	rex
ffff8000001109b3:	40                   	rex
ffff8000001109b4:	40                   	rex
ffff8000001109b5:	4e                   	rex.WRX
ffff8000001109b6:	44                   	rex.R
ffff8000001109b7:	48 50                	rex.W push %rax
ffff8000001109b9:	60                   	(bad)  
ffff8000001109ba:	50                   	push   %rax
ffff8000001109bb:	48                   	rex.W
ffff8000001109bc:	44 e6 00             	rex.R out %al,$0x0
ffff8000001109bf:	00 30                	add    %dh,(%rax)
ffff8000001109c1:	10 10                	adc    %dl,(%rax)
ffff8000001109c3:	10 10                	adc    %dl,(%rax)
ffff8000001109c5:	10 10                	adc    %dl,(%rax)
ffff8000001109c7:	10 10                	adc    %dl,(%rax)
ffff8000001109c9:	10 10                	adc    %dl,(%rax)
ffff8000001109cb:	10 10                	adc    %dl,(%rax)
ffff8000001109cd:	38 00                	cmp    %al,(%rax)
ffff8000001109cf:	00 00                	add    %al,(%rax)
ffff8000001109d1:	00 00                	add    %al,(%rax)
ffff8000001109d3:	00 00                	add    %al,(%rax)
ffff8000001109d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff8000001109d9:	49                   	rex.WB
ffff8000001109da:	49                   	rex.WB
ffff8000001109db:	49                   	rex.WB
ffff8000001109dc:	49 db 00             	rex.WB fildl (%r8)
ffff8000001109df:	00 00                	add    %al,(%rax)
ffff8000001109e1:	00 00                	add    %al,(%rax)
ffff8000001109e3:	00 00                	add    %al,(%rax)
ffff8000001109e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff8000001109e9:	42                   	rex.X
ffff8000001109ea:	42                   	rex.X
ffff8000001109eb:	42                   	rex.X
ffff8000001109ec:	42 e3 00             	rex.X jrcxz ffff8000001109ef <interrupt+0x7af>
ffff8000001109ef:	00 00                	add    %al,(%rax)
ffff8000001109f1:	00 00                	add    %al,(%rax)
ffff8000001109f3:	00 00                	add    %al,(%rax)
ffff8000001109f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001109f9:	82                   	(bad)  
ffff8000001109fa:	82                   	(bad)  
ffff8000001109fb:	82                   	(bad)  
ffff8000001109fc:	44 38 00             	cmp    %r8b,(%rax)
ffff8000001109ff:	00 00                	add    %al,(%rax)
ffff800000110a01:	00 00                	add    %al,(%rax)
ffff800000110a03:	00 d8                	add    %bl,%al
ffff800000110a05:	64 42                	fs rex.X
ffff800000110a07:	42                   	rex.X
ffff800000110a08:	42                   	rex.X
ffff800000110a09:	42                   	rex.X
ffff800000110a0a:	42                   	rex.X
ffff800000110a0b:	64 58                	fs pop %rax
ffff800000110a0d:	40                   	rex
ffff800000110a0e:	40 e0 00             	rex loopne ffff800000110a11 <interrupt+0x7d1>
ffff800000110a11:	00 00                	add    %al,(%rax)
ffff800000110a13:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff800000110a16:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff800000110a1d:	04 04                	add    $0x4,%al
ffff800000110a1f:	0e                   	(bad)  
ffff800000110a20:	00 00                	add    %al,(%rax)
ffff800000110a22:	00 00                	add    %al,(%rax)
ffff800000110a24:	00 dc                	add    %bl,%ah
ffff800000110a26:	62 42                	(bad)  
ffff800000110a28:	40                   	rex
ffff800000110a29:	40                   	rex
ffff800000110a2a:	40                   	rex
ffff800000110a2b:	40                   	rex
ffff800000110a2c:	40 e0 00             	rex loopne ffff800000110a2f <interrupt+0x7ef>
ffff800000110a2f:	00 00                	add    %al,(%rax)
ffff800000110a31:	00 00                	add    %al,(%rax)
ffff800000110a33:	00 00                	add    %al,(%rax)
ffff800000110a35:	7a 86                	jp     ffff8000001109bd <interrupt+0x77d>
ffff800000110a37:	82                   	(bad)  
ffff800000110a38:	c0 38 06             	sarb   $0x6,(%rax)
ffff800000110a3b:	82                   	(bad)  
ffff800000110a3c:	c2 bc 00             	retq   $0xbc
ffff800000110a3f:	00 00                	add    %al,(%rax)
ffff800000110a41:	00 10                	add    %dl,(%rax)
ffff800000110a43:	10 10                	adc    %dl,(%rax)
ffff800000110a45:	7c 10                	jl     ffff800000110a57 <interrupt+0x817>
ffff800000110a47:	10 10                	adc    %dl,(%rax)
ffff800000110a49:	10 10                	adc    %dl,(%rax)
ffff800000110a4b:	10 10                	adc    %dl,(%rax)
ffff800000110a4d:	0e                   	(bad)  
ffff800000110a4e:	00 00                	add    %al,(%rax)
ffff800000110a50:	00 00                	add    %al,(%rax)
ffff800000110a52:	00 00                	add    %al,(%rax)
ffff800000110a54:	00 c6                	add    %al,%dh
ffff800000110a56:	42                   	rex.X
ffff800000110a57:	42                   	rex.X
ffff800000110a58:	42                   	rex.X
ffff800000110a59:	42                   	rex.X
ffff800000110a5a:	42                   	rex.X
ffff800000110a5b:	42                   	rex.X
ffff800000110a5c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff800000110a5f:	00 00                	add    %al,(%rax)
ffff800000110a61:	00 00                	add    %al,(%rax)
ffff800000110a63:	00 00                	add    %al,(%rax)
ffff800000110a65:	e7 42                	out    %eax,$0x42
ffff800000110a67:	42                   	rex.X
ffff800000110a68:	42 24 24             	rex.X and $0x24,%al
ffff800000110a6b:	24 18                	and    $0x18,%al
ffff800000110a6d:	18 00                	sbb    %al,(%rax)
ffff800000110a6f:	00 00                	add    %al,(%rax)
ffff800000110a71:	00 00                	add    %al,(%rax)
ffff800000110a73:	00 00                	add    %al,(%rax)
ffff800000110a75:	e7 42                	out    %eax,$0x42
ffff800000110a77:	42 5a                	rex.X pop %rdx
ffff800000110a79:	5a                   	pop    %rdx
ffff800000110a7a:	5a                   	pop    %rdx
ffff800000110a7b:	24 24                	and    $0x24,%al
ffff800000110a7d:	24 00                	and    $0x0,%al
ffff800000110a7f:	00 00                	add    %al,(%rax)
ffff800000110a81:	00 00                	add    %al,(%rax)
ffff800000110a83:	00 00                	add    %al,(%rax)
ffff800000110a85:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff800000110a8a:	28 28                	sub    %ch,(%rax)
ffff800000110a8c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff800000110a90:	00 00                	add    %al,(%rax)
ffff800000110a92:	00 00                	add    %al,(%rax)
ffff800000110a94:	00 e7                	add    %ah,%bh
ffff800000110a96:	42                   	rex.X
ffff800000110a97:	42 24 24             	rex.X and $0x24,%al
ffff800000110a9a:	24 18                	and    $0x18,%al
ffff800000110a9c:	18 10                	sbb    %dl,(%rax)
ffff800000110a9e:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000110aa1:	00 00                	add    %al,(%rax)
ffff800000110aa3:	00 00                	add    %al,(%rax)
ffff800000110aa5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff800000110aab:	42 82                	rex.X (bad) 
ffff800000110aad:	fe 00                	incb   (%rax)
ffff800000110aaf:	00 00                	add    %al,(%rax)
ffff800000110ab1:	06                   	(bad)  
ffff800000110ab2:	08 10                	or     %dl,(%rax)
ffff800000110ab4:	10 10                	adc    %dl,(%rax)
ffff800000110ab6:	10 60 10             	adc    %ah,0x10(%rax)
ffff800000110ab9:	10 10                	adc    %dl,(%rax)
ffff800000110abb:	10 08                	adc    %cl,(%rax)
ffff800000110abd:	06                   	(bad)  
ffff800000110abe:	00 00                	add    %al,(%rax)
ffff800000110ac0:	10 10                	adc    %dl,(%rax)
ffff800000110ac2:	10 10                	adc    %dl,(%rax)
ffff800000110ac4:	10 10                	adc    %dl,(%rax)
ffff800000110ac6:	10 10                	adc    %dl,(%rax)
ffff800000110ac8:	10 10                	adc    %dl,(%rax)
ffff800000110aca:	10 10                	adc    %dl,(%rax)
ffff800000110acc:	10 10                	adc    %dl,(%rax)
ffff800000110ace:	10 10                	adc    %dl,(%rax)
ffff800000110ad0:	00 60 10             	add    %ah,0x10(%rax)
ffff800000110ad3:	08 08                	or     %cl,(%rax)
ffff800000110ad5:	08 08                	or     %cl,(%rax)
ffff800000110ad7:	06                   	(bad)  
ffff800000110ad8:	08 08                	or     %cl,(%rax)
ffff800000110ada:	08 08                	or     %cl,(%rax)
ffff800000110adc:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000110adf:	00 00                	add    %al,(%rax)
ffff800000110ae1:	72 8c                	jb     ffff800000110a6f <interrupt+0x82f>
	...
ffff8000001112ff:	00 00                	add    %al,(%rax)
ffff800000111301:	00 12                	add    %dl,(%rdx)
ffff800000111303:	00 00                	add    %al,(%rax)
ffff800000111305:	80 ff ff             	cmp    $0xff,%bh
	...
ffff800000111310:	00 00                	add    %al,(%rax)
ffff800000111312:	12 00                	adc    (%rax),%al
ffff800000111314:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000011131a:	00 00                	add    %al,(%rax)
ffff80000011131c:	00 00                	add    %al,(%rax)
ffff80000011131e:	00 00                	add    %al,(%rax)
ffff800000111320:	10 00                	adc    %al,(%rax)
	...
ffff80000011133e:	00 00                	add    %al,(%rax)
ffff800000111340:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff800000111346:	ff                   	(bad)  
ffff800000111347:	ff 00                	incl   (%rax)
	...
ffff800000111385:	00 12                	add    %dl,(%rdx)
ffff800000111387:	00 00                	add    %al,(%rax)
ffff800000111389:	80 ff ff             	cmp    $0xff,%bh
ffff80000011138c:	00 00                	add    %al,(%rax)
ffff80000011138e:	12 00                	adc    (%rax),%al
ffff800000111390:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111396:	12 00                	adc    (%rax),%al
ffff800000111398:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011139e:	00 00                	add    %al,(%rax)
ffff8000001113a0:	00 00                	add    %al,(%rax)
ffff8000001113a2:	00 00                	add    %al,(%rax)
ffff8000001113a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001113a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113ae:	00 00                	add    %al,(%rax)
ffff8000001113b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113b6:	00 00                	add    %al,(%rax)
ffff8000001113b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113be:	00 00                	add    %al,(%rax)
ffff8000001113c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113c6:	00 00                	add    %al,(%rax)
ffff8000001113c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113ce:	00 00                	add    %al,(%rax)
ffff8000001113d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113d6:	00 00                	add    %al,(%rax)
ffff8000001113d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001113ee:	12 00                	adc    (%rax),%al
ffff8000001113f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113f6:	12 00                	adc    (%rax),%al
ffff8000001113f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113fe:	12 00                	adc    (%rax),%al
ffff800000111400:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111406:	00 00                	add    %al,(%rax)
ffff800000111408:	00 00                	add    %al,(%rax)
ffff80000011140a:	00 00                	add    %al,(%rax)
ffff80000011140c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111410:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111416:	00 00                	add    %al,(%rax)
ffff800000111418:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011141e:	00 00                	add    %al,(%rax)
ffff800000111420:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111426:	00 00                	add    %al,(%rax)
ffff800000111428:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011142e:	00 00                	add    %al,(%rax)
ffff800000111430:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111436:	00 00                	add    %al,(%rax)
ffff800000111438:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011143e:	00 00                	add    %al,(%rax)
ffff800000111440:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111456:	12 00                	adc    (%rax),%al
ffff800000111458:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011145e:	12 00                	adc    (%rax),%al
ffff800000111460:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111466:	12 00                	adc    (%rax),%al
ffff800000111468:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011146e:	00 00                	add    %al,(%rax)
ffff800000111470:	00 00                	add    %al,(%rax)
ffff800000111472:	00 00                	add    %al,(%rax)
ffff800000111474:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111478:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011147e:	00 00                	add    %al,(%rax)
ffff800000111480:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111486:	00 00                	add    %al,(%rax)
ffff800000111488:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011148e:	00 00                	add    %al,(%rax)
ffff800000111490:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111496:	00 00                	add    %al,(%rax)
ffff800000111498:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011149e:	00 00                	add    %al,(%rax)
ffff8000001114a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114a6:	00 00                	add    %al,(%rax)
ffff8000001114a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001114be:	12 00                	adc    (%rax),%al
ffff8000001114c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114c6:	12 00                	adc    (%rax),%al
ffff8000001114c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114ce:	12 00                	adc    (%rax),%al
ffff8000001114d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114d6:	00 00                	add    %al,(%rax)
ffff8000001114d8:	00 00                	add    %al,(%rax)
ffff8000001114da:	00 00                	add    %al,(%rax)
ffff8000001114dc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001114e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114e6:	00 00                	add    %al,(%rax)
ffff8000001114e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114ee:	00 00                	add    %al,(%rax)
ffff8000001114f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114f6:	00 00                	add    %al,(%rax)
ffff8000001114f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114fe:	00 00                	add    %al,(%rax)
ffff800000111500:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111506:	00 00                	add    %al,(%rax)
ffff800000111508:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011150e:	00 00                	add    %al,(%rax)
ffff800000111510:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111526:	12 00                	adc    (%rax),%al
ffff800000111528:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011152e:	12 00                	adc    (%rax),%al
ffff800000111530:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111536:	12 00                	adc    (%rax),%al
ffff800000111538:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011153e:	00 00                	add    %al,(%rax)
ffff800000111540:	00 00                	add    %al,(%rax)
ffff800000111542:	00 00                	add    %al,(%rax)
ffff800000111544:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111548:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011154e:	00 00                	add    %al,(%rax)
ffff800000111550:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111556:	00 00                	add    %al,(%rax)
ffff800000111558:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011155e:	00 00                	add    %al,(%rax)
ffff800000111560:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111566:	00 00                	add    %al,(%rax)
ffff800000111568:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011156e:	00 00                	add    %al,(%rax)
ffff800000111570:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111576:	00 00                	add    %al,(%rax)
ffff800000111578:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011158e:	12 00                	adc    (%rax),%al
ffff800000111590:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111596:	12 00                	adc    (%rax),%al
ffff800000111598:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011159e:	12 00                	adc    (%rax),%al
ffff8000001115a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001115a6:	00 00                	add    %al,(%rax)
ffff8000001115a8:	00 00                	add    %al,(%rax)
ffff8000001115aa:	00 00                	add    %al,(%rax)
ffff8000001115ac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001115b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115b6:	00 00                	add    %al,(%rax)
ffff8000001115b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115be:	00 00                	add    %al,(%rax)
ffff8000001115c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115c6:	00 00                	add    %al,(%rax)
ffff8000001115c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115ce:	00 00                	add    %al,(%rax)
ffff8000001115d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115d6:	00 00                	add    %al,(%rax)
ffff8000001115d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115de:	00 00                	add    %al,(%rax)
ffff8000001115e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001115f6:	12 00                	adc    (%rax),%al
ffff8000001115f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001115fe:	12 00                	adc    (%rax),%al
ffff800000111600:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111606:	12 00                	adc    (%rax),%al
ffff800000111608:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011160e:	00 00                	add    %al,(%rax)
ffff800000111610:	00 00                	add    %al,(%rax)
ffff800000111612:	00 00                	add    %al,(%rax)
ffff800000111614:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111618:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011161e:	00 00                	add    %al,(%rax)
ffff800000111620:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111626:	00 00                	add    %al,(%rax)
ffff800000111628:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011162e:	00 00                	add    %al,(%rax)
ffff800000111630:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111636:	00 00                	add    %al,(%rax)
ffff800000111638:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011163e:	00 00                	add    %al,(%rax)
ffff800000111640:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111646:	00 00                	add    %al,(%rax)
ffff800000111648:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011165e:	12 00                	adc    (%rax),%al
ffff800000111660:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111666:	12 00                	adc    (%rax),%al
ffff800000111668:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011166e:	12 00                	adc    (%rax),%al
ffff800000111670:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111676:	00 00                	add    %al,(%rax)
ffff800000111678:	00 00                	add    %al,(%rax)
ffff80000011167a:	00 00                	add    %al,(%rax)
ffff80000011167c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111680:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111686:	00 00                	add    %al,(%rax)
ffff800000111688:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011168e:	00 00                	add    %al,(%rax)
ffff800000111690:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111696:	00 00                	add    %al,(%rax)
ffff800000111698:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011169e:	00 00                	add    %al,(%rax)
ffff8000001116a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116a6:	00 00                	add    %al,(%rax)
ffff8000001116a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116ae:	00 00                	add    %al,(%rax)
ffff8000001116b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001116be:	00 00                	add    %al,(%rax)
ffff8000001116c0:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff8000001116c4:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff8000001116ca:	10 00                	adc    %al,(%rax)
ffff8000001116cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116d2:	10 00                	adc    %al,(%rax)
ffff8000001116d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116da:	10 00                	adc    %al,(%rax)
ffff8000001116dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116e2:	10 00                	adc    %al,(%rax)
ffff8000001116e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116ea:	10 00                	adc    %al,(%rax)
ffff8000001116ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116f2:	10 00                	adc    %al,(%rax)
ffff8000001116f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116fa:	10 00                	adc    %al,(%rax)
ffff8000001116fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111702:	10 00                	adc    %al,(%rax)
ffff800000111704:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011170a:	10 00                	adc    %al,(%rax)
ffff80000011170c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111712:	10 00                	adc    %al,(%rax)
ffff800000111714:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011171a:	10 00                	adc    %al,(%rax)
ffff80000011171c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111722:	10 00                	adc    %al,(%rax)
ffff800000111724:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011172a:	10 00                	adc    %al,(%rax)
ffff80000011172c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111732:	10 00                	adc    %al,(%rax)
ffff800000111734:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011173a:	10 00                	adc    %al,(%rax)
ffff80000011173c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111742:	10 00                	adc    %al,(%rax)
ffff800000111744:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011174a:	10 00                	adc    %al,(%rax)
ffff80000011174c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111752:	10 00                	adc    %al,(%rax)
ffff800000111754:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011175a:	10 00                	adc    %al,(%rax)
ffff80000011175c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111762:	10 00                	adc    %al,(%rax)
ffff800000111764:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011176a:	10 00                	adc    %al,(%rax)
ffff80000011176c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111772:	10 00                	adc    %al,(%rax)
ffff800000111774:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011177a:	10 00                	adc    %al,(%rax)
ffff80000011177c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111782:	10 00                	adc    %al,(%rax)
ffff800000111784:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011178a:	10 00                	adc    %al,(%rax)
ffff80000011178c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111792:	10 00                	adc    %al,(%rax)
ffff800000111794:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011179a:	10 00                	adc    %al,(%rax)
ffff80000011179c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117a2:	10 00                	adc    %al,(%rax)
ffff8000001117a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117aa:	10 00                	adc    %al,(%rax)
ffff8000001117ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117b2:	10 00                	adc    %al,(%rax)
ffff8000001117b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117ba:	10 00                	adc    %al,(%rax)
ffff8000001117bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117c2:	10 00                	adc    %al,(%rax)
ffff8000001117c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117ca:	10 00                	adc    %al,(%rax)
ffff8000001117cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117d2:	10 00                	adc    %al,(%rax)
ffff8000001117d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117da:	10 00                	adc    %al,(%rax)
ffff8000001117dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117e2:	10 00                	adc    %al,(%rax)
ffff8000001117e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117ea:	10 00                	adc    %al,(%rax)
ffff8000001117ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117f2:	10 00                	adc    %al,(%rax)
ffff8000001117f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001117fa:	10 00                	adc    %al,(%rax)
ffff8000001117fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111802:	10 00                	adc    %al,(%rax)
ffff800000111804:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011180a:	10 00                	adc    %al,(%rax)
ffff80000011180c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111812:	10 00                	adc    %al,(%rax)
ffff800000111814:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011181a:	10 00                	adc    %al,(%rax)
ffff80000011181c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111822:	10 00                	adc    %al,(%rax)
ffff800000111824:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011182a:	10 00                	adc    %al,(%rax)
ffff80000011182c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111832:	10 00                	adc    %al,(%rax)
ffff800000111834:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011183a:	10 00                	adc    %al,(%rax)
ffff80000011183c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111842:	10 00                	adc    %al,(%rax)
ffff800000111844:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011184a:	10 00                	adc    %al,(%rax)
ffff80000011184c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111852:	10 00                	adc    %al,(%rax)
ffff800000111854:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011185a:	10 00                	adc    %al,(%rax)
ffff80000011185c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111862:	10 00                	adc    %al,(%rax)
ffff800000111864:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011186a:	10 00                	adc    %al,(%rax)
ffff80000011186c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111872:	10 00                	adc    %al,(%rax)
ffff800000111874:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011187a:	10 00                	adc    %al,(%rax)
ffff80000011187c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111882:	10 00                	adc    %al,(%rax)
ffff800000111884:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011188a:	10 00                	adc    %al,(%rax)
ffff80000011188c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111892:	10 00                	adc    %al,(%rax)
ffff800000111894:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011189a:	10 00                	adc    %al,(%rax)
ffff80000011189c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118a2:	10 00                	adc    %al,(%rax)
ffff8000001118a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118aa:	10 00                	adc    %al,(%rax)
ffff8000001118ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118b2:	10 00                	adc    %al,(%rax)
ffff8000001118b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118ba:	10 00                	adc    %al,(%rax)
ffff8000001118bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118c2:	10 00                	adc    %al,(%rax)
ffff8000001118c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118ca:	10 00                	adc    %al,(%rax)
ffff8000001118cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118d2:	10 00                	adc    %al,(%rax)
ffff8000001118d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118da:	10 00                	adc    %al,(%rax)
ffff8000001118dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118e2:	10 00                	adc    %al,(%rax)
ffff8000001118e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118ea:	10 00                	adc    %al,(%rax)
ffff8000001118ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118f2:	10 00                	adc    %al,(%rax)
ffff8000001118f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001118fa:	10 00                	adc    %al,(%rax)
ffff8000001118fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111902:	10 00                	adc    %al,(%rax)
ffff800000111904:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011190a:	10 00                	adc    %al,(%rax)
ffff80000011190c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111912:	10 00                	adc    %al,(%rax)
ffff800000111914:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011191a:	10 00                	adc    %al,(%rax)
ffff80000011191c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111922:	10 00                	adc    %al,(%rax)
ffff800000111924:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011192a:	10 00                	adc    %al,(%rax)
ffff80000011192c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111932:	10 00                	adc    %al,(%rax)
ffff800000111934:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011193a:	10 00                	adc    %al,(%rax)
ffff80000011193c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111942:	10 00                	adc    %al,(%rax)
ffff800000111944:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011194a:	10 00                	adc    %al,(%rax)
ffff80000011194c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111952:	10 00                	adc    %al,(%rax)
ffff800000111954:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011195a:	10 00                	adc    %al,(%rax)
ffff80000011195c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111962:	10 00                	adc    %al,(%rax)
ffff800000111964:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011196a:	10 00                	adc    %al,(%rax)
ffff80000011196c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111972:	10 00                	adc    %al,(%rax)
ffff800000111974:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011197a:	10 00                	adc    %al,(%rax)
ffff80000011197c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111982:	10 00                	adc    %al,(%rax)
ffff800000111984:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011198a:	10 00                	adc    %al,(%rax)
ffff80000011198c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111992:	10 00                	adc    %al,(%rax)
ffff800000111994:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011199a:	10 00                	adc    %al,(%rax)
ffff80000011199c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119a2:	10 00                	adc    %al,(%rax)
ffff8000001119a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119aa:	10 00                	adc    %al,(%rax)
ffff8000001119ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119b2:	10 00                	adc    %al,(%rax)
ffff8000001119b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119ba:	10 00                	adc    %al,(%rax)
ffff8000001119bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119c2:	10 00                	adc    %al,(%rax)
ffff8000001119c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119ca:	10 00                	adc    %al,(%rax)
ffff8000001119cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119d2:	10 00                	adc    %al,(%rax)
ffff8000001119d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119da:	10 00                	adc    %al,(%rax)
ffff8000001119dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119e2:	10 00                	adc    %al,(%rax)
ffff8000001119e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119ea:	10 00                	adc    %al,(%rax)
ffff8000001119ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119f2:	10 00                	adc    %al,(%rax)
ffff8000001119f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001119fa:	10 00                	adc    %al,(%rax)
ffff8000001119fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a02:	10 00                	adc    %al,(%rax)
ffff800000111a04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a0a:	10 00                	adc    %al,(%rax)
ffff800000111a0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a12:	10 00                	adc    %al,(%rax)
ffff800000111a14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a1a:	10 00                	adc    %al,(%rax)
ffff800000111a1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a22:	10 00                	adc    %al,(%rax)
ffff800000111a24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a2a:	10 00                	adc    %al,(%rax)
ffff800000111a2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a32:	10 00                	adc    %al,(%rax)
ffff800000111a34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a3a:	10 00                	adc    %al,(%rax)
ffff800000111a3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a42:	10 00                	adc    %al,(%rax)
ffff800000111a44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a4a:	10 00                	adc    %al,(%rax)
ffff800000111a4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a52:	10 00                	adc    %al,(%rax)
ffff800000111a54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a5a:	10 00                	adc    %al,(%rax)
ffff800000111a5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a62:	10 00                	adc    %al,(%rax)
ffff800000111a64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a6a:	10 00                	adc    %al,(%rax)
ffff800000111a6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a72:	10 00                	adc    %al,(%rax)
ffff800000111a74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a7a:	10 00                	adc    %al,(%rax)
ffff800000111a7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a82:	10 00                	adc    %al,(%rax)
ffff800000111a84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a8a:	10 00                	adc    %al,(%rax)
ffff800000111a8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a92:	10 00                	adc    %al,(%rax)
ffff800000111a94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111a9a:	10 00                	adc    %al,(%rax)
ffff800000111a9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111aa2:	10 00                	adc    %al,(%rax)
ffff800000111aa4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111aaa:	10 00                	adc    %al,(%rax)
ffff800000111aac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111ab2:	10 00                	adc    %al,(%rax)
ffff800000111ab4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111aba:	10 00                	adc    %al,(%rax)
ffff800000111abc:	00                   	.byte 0x0
ffff800000111abd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff800000111ac0 <_rodata>:
ffff800000111ac0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111ac1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ac2:	5f                   	pop    %rdi
ffff800000111ac3:	73 79                	jae    ffff800000111b3e <_rodata+0x7e>
ffff800000111ac5:	73 74                	jae    ffff800000111b3b <_rodata+0x7b>
ffff800000111ac7:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000111ac9:	5f                   	pop    %rdi
ffff800000111aca:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000111acd:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ace:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000111ad1:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000111ad4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ad5:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ad6:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000111add:	25 23 30 34 78       	and    $0x78343023,%eax
ffff800000111ae2:	0a 00                	or     (%rax),%al
ffff800000111ae4:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111ae5:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000111ae7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ae8:	72 79                	jb     ffff800000111b63 <_rodata+0xa3>
ffff800000111aea:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000111aed:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
ffff800000111af4:	74 
ffff800000111af5:	65 72 72             	gs jb  ffff800000111b6a <_rodata+0xaa>
ffff800000111af8:	75 70                	jne    ffff800000111b6a <_rodata+0xaa>
ffff800000111afa:	74 20                	je     ffff800000111b1c <_rodata+0x5c>
ffff800000111afc:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000111b03:	74 61                	je     ffff800000111b66 <_rodata+0xa6>
ffff800000111b05:	73 6b                	jae    ffff800000111b72 <_rodata+0xb2>
ffff800000111b07:	5f                   	pop    %rdi
ffff800000111b08:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000111b0f:	00 30                	add    %dh,(%rax)
ffff800000111b11:	31 32                	xor    %esi,(%rdx)
ffff800000111b13:	33 34 35 36 37 38 39 	xor    0x39383736(,%rsi,1),%esi
ffff800000111b1a:	41                   	rex.B
ffff800000111b1b:	42                   	rex.X
ffff800000111b1c:	43                   	rex.XB
ffff800000111b1d:	44                   	rex.R
ffff800000111b1e:	45                   	rex.RB
ffff800000111b1f:	46                   	rex.RX
ffff800000111b20:	47                   	rex.RXB
ffff800000111b21:	48                   	rex.W
ffff800000111b22:	49                   	rex.WB
ffff800000111b23:	4a                   	rex.WX
ffff800000111b24:	4b                   	rex.WXB
ffff800000111b25:	4c                   	rex.WR
ffff800000111b26:	4d                   	rex.WRB
ffff800000111b27:	4e                   	rex.WRX
ffff800000111b28:	4f 50                	rex.WRXB push %r8
ffff800000111b2a:	51                   	push   %rcx
ffff800000111b2b:	52                   	push   %rdx
ffff800000111b2c:	53                   	push   %rbx
ffff800000111b2d:	54                   	push   %rsp
ffff800000111b2e:	55                   	push   %rbp
ffff800000111b2f:	56                   	push   %rsi
ffff800000111b30:	57                   	push   %rdi
ffff800000111b31:	58                   	pop    %rax
ffff800000111b32:	59                   	pop    %rcx
ffff800000111b33:	5a                   	pop    %rdx
ffff800000111b34:	00 00                	add    %al,(%rax)
ffff800000111b36:	00 00                	add    %al,(%rax)
ffff800000111b38:	30 31                	xor    %dh,(%rcx)
ffff800000111b3a:	32 33                	xor    (%rbx),%dh
ffff800000111b3c:	34 35                	xor    $0x35,%al
ffff800000111b3e:	36 37                	ss (bad) 
ffff800000111b40:	38 39                	cmp    %bh,(%rcx)
ffff800000111b42:	61                   	(bad)  
ffff800000111b43:	62 63 64 65 66       	(bad)
ffff800000111b48:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
ffff800000111b4e:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111b4f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111b50:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111b51:	70 71                	jo     ffff800000111bc4 <_rodata+0x104>
ffff800000111b53:	72 73                	jb     ffff800000111bc8 <_rodata+0x108>
ffff800000111b55:	74 75                	je     ffff800000111bcc <_rodata+0x10c>
ffff800000111b57:	76 77                	jbe    ffff800000111bd0 <_rodata+0x110>
ffff800000111b59:	78 79                	js     ffff800000111bd4 <_rodata+0x114>
ffff800000111b5b:	7a 00                	jp     ffff800000111b5d <_rodata+0x9d>
ffff800000111b5d:	00 00                	add    %al,(%rax)
ffff800000111b5f:	00 c3                	add    %al,%bl
ffff800000111b61:	4a 10 00             	rex.WX adc %al,(%rax)
ffff800000111b64:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b6a:	10 00                	adc    %al,(%rax)
ffff800000111b6c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b72:	10 00                	adc    %al,(%rax)
ffff800000111b74:	00 80 ff ff c9 4a    	add    %al,0x4ac9ffff(%rax)
ffff800000111b7a:	10 00                	adc    %al,(%rax)
ffff800000111b7c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b82:	10 00                	adc    %al,(%rax)
ffff800000111b84:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b8a:	10 00                	adc    %al,(%rax)
ffff800000111b8c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b92:	10 00                	adc    %al,(%rax)
ffff800000111b94:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111b9a:	10 00                	adc    %al,(%rax)
ffff800000111b9c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111ba2:	10 00                	adc    %al,(%rax)
ffff800000111ba4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111baa:	10 00                	adc    %al,(%rax)
ffff800000111bac:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111bb2:	10 00                	adc    %al,(%rax)
ffff800000111bb4:	00 80 ff ff bd 4a    	add    %al,0x4abdffff(%rax)
ffff800000111bba:	10 00                	adc    %al,(%rax)
ffff800000111bbc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111bc2:	10 00                	adc    %al,(%rax)
ffff800000111bc4:	00 80 ff ff b7 4a    	add    %al,0x4ab7ffff(%rax)
ffff800000111bca:	10 00                	adc    %al,(%rax)
ffff800000111bcc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111bd2:	10 00                	adc    %al,(%rax)
ffff800000111bd4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111bda:	10 00                	adc    %al,(%rax)
ffff800000111bdc:	00 80 ff ff cf 4a    	add    %al,0x4acfffff(%rax)
ffff800000111be2:	10 00                	adc    %al,(%rax)
ffff800000111be4:	00 80 ff ff ae 52    	add    %al,0x52aeffff(%rax)
ffff800000111bea:	10 00                	adc    %al,(%rax)
ffff800000111bec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bf2:	10 00                	adc    %al,(%rax)
ffff800000111bf4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bfa:	10 00                	adc    %al,(%rax)
ffff800000111bfc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c02:	10 00                	adc    %al,(%rax)
ffff800000111c04:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c0a:	10 00                	adc    %al,(%rax)
ffff800000111c0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c12:	10 00                	adc    %al,(%rax)
ffff800000111c14:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c1a:	10 00                	adc    %al,(%rax)
ffff800000111c1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c22:	10 00                	adc    %al,(%rax)
ffff800000111c24:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c2a:	10 00                	adc    %al,(%rax)
ffff800000111c2c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c32:	10 00                	adc    %al,(%rax)
ffff800000111c34:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c3a:	10 00                	adc    %al,(%rax)
ffff800000111c3c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c42:	10 00                	adc    %al,(%rax)
ffff800000111c44:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c4a:	10 00                	adc    %al,(%rax)
ffff800000111c4c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c52:	10 00                	adc    %al,(%rax)
ffff800000111c54:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c5a:	10 00                	adc    %al,(%rax)
ffff800000111c5c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c62:	10 00                	adc    %al,(%rax)
ffff800000111c64:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c6a:	10 00                	adc    %al,(%rax)
ffff800000111c6c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c72:	10 00                	adc    %al,(%rax)
ffff800000111c74:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c7a:	10 00                	adc    %al,(%rax)
ffff800000111c7c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c82:	10 00                	adc    %al,(%rax)
ffff800000111c84:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c8a:	10 00                	adc    %al,(%rax)
ffff800000111c8c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c92:	10 00                	adc    %al,(%rax)
ffff800000111c94:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111c9a:	10 00                	adc    %al,(%rax)
ffff800000111c9c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ca2:	10 00                	adc    %al,(%rax)
ffff800000111ca4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111caa:	10 00                	adc    %al,(%rax)
ffff800000111cac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cb2:	10 00                	adc    %al,(%rax)
ffff800000111cb4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cba:	10 00                	adc    %al,(%rax)
ffff800000111cbc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cc2:	10 00                	adc    %al,(%rax)
ffff800000111cc4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cca:	10 00                	adc    %al,(%rax)
ffff800000111ccc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cd2:	10 00                	adc    %al,(%rax)
ffff800000111cd4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cda:	10 00                	adc    %al,(%rax)
ffff800000111cdc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ce2:	10 00                	adc    %al,(%rax)
ffff800000111ce4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cea:	10 00                	adc    %al,(%rax)
ffff800000111cec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cf2:	10 00                	adc    %al,(%rax)
ffff800000111cf4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cfa:	10 00                	adc    %al,(%rax)
ffff800000111cfc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d02:	10 00                	adc    %al,(%rax)
ffff800000111d04:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d0a:	10 00                	adc    %al,(%rax)
ffff800000111d0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d12:	10 00                	adc    %al,(%rax)
ffff800000111d14:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d1a:	10 00                	adc    %al,(%rax)
ffff800000111d1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d22:	10 00                	adc    %al,(%rax)
ffff800000111d24:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d2a:	10 00                	adc    %al,(%rax)
ffff800000111d2c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d32:	10 00                	adc    %al,(%rax)
ffff800000111d34:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d3a:	10 00                	adc    %al,(%rax)
ffff800000111d3c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d42:	10 00                	adc    %al,(%rax)
ffff800000111d44:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d4a:	10 00                	adc    %al,(%rax)
ffff800000111d4c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d52:	10 00                	adc    %al,(%rax)
ffff800000111d54:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d5a:	10 00                	adc    %al,(%rax)
ffff800000111d5c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d62:	10 00                	adc    %al,(%rax)
ffff800000111d64:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d6a:	10 00                	adc    %al,(%rax)
ffff800000111d6c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d72:	10 00                	adc    %al,(%rax)
ffff800000111d74:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d7a:	10 00                	adc    %al,(%rax)
ffff800000111d7c:	00 80 ff ff e7 4f    	add    %al,0x4fe7ffff(%rax)
ffff800000111d82:	10 00                	adc    %al,(%rax)
ffff800000111d84:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d8a:	10 00                	adc    %al,(%rax)
ffff800000111d8c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d92:	10 00                	adc    %al,(%rax)
ffff800000111d94:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d9a:	10 00                	adc    %al,(%rax)
ffff800000111d9c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111da2:	10 00                	adc    %al,(%rax)
ffff800000111da4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111daa:	10 00                	adc    %al,(%rax)
ffff800000111dac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111db2:	10 00                	adc    %al,(%rax)
ffff800000111db4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dba:	10 00                	adc    %al,(%rax)
ffff800000111dbc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dc2:	10 00                	adc    %al,(%rax)
ffff800000111dc4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dca:	10 00                	adc    %al,(%rax)
ffff800000111dcc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dd2:	10 00                	adc    %al,(%rax)
ffff800000111dd4:	00 80 ff ff b0 4c    	add    %al,0x4cb0ffff(%rax)
ffff800000111dda:	10 00                	adc    %al,(%rax)
ffff800000111ddc:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111de2:	10 00                	adc    %al,(%rax)
ffff800000111de4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dea:	10 00                	adc    %al,(%rax)
ffff800000111dec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111df2:	10 00                	adc    %al,(%rax)
ffff800000111df4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111dfa:	10 00                	adc    %al,(%rax)
ffff800000111dfc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e02:	10 00                	adc    %al,(%rax)
ffff800000111e04:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111e0a:	10 00                	adc    %al,(%rax)
ffff800000111e0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e12:	10 00                	adc    %al,(%rax)
ffff800000111e14:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e1a:	10 00                	adc    %al,(%rax)
ffff800000111e1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e22:	10 00                	adc    %al,(%rax)
ffff800000111e24:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e2a:	10 00                	adc    %al,(%rax)
ffff800000111e2c:	00 80 ff ff eb 51    	add    %al,0x51ebffff(%rax)
ffff800000111e32:	10 00                	adc    %al,(%rax)
ffff800000111e34:	00 80 ff ff 54 4e    	add    %al,0x4e54ffff(%rax)
ffff800000111e3a:	10 00                	adc    %al,(%rax)
ffff800000111e3c:	00 80 ff ff 54 4f    	add    %al,0x4f54ffff(%rax)
ffff800000111e42:	10 00                	adc    %al,(%rax)
ffff800000111e44:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e4a:	10 00                	adc    %al,(%rax)
ffff800000111e4c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e52:	10 00                	adc    %al,(%rax)
ffff800000111e54:	00 80 ff ff 4a 4d    	add    %al,0x4d4affff(%rax)
ffff800000111e5a:	10 00                	adc    %al,(%rax)
ffff800000111e5c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e62:	10 00                	adc    %al,(%rax)
ffff800000111e64:	00 80 ff ff eb 50    	add    %al,0x50ebffff(%rax)
ffff800000111e6a:	10 00                	adc    %al,(%rax)
ffff800000111e6c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e72:	10 00                	adc    %al,(%rax)
ffff800000111e74:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111e7a:	10 00                	adc    %al,(%rax)
ffff800000111e7c:	00 80 ff ff e3 4f    	add    %al,0x4fe3ffff(%rax)
ffff800000111e82:	10 00                	adc    %al,(%rax)
ffff800000111e84:	00 80 ff ff 64 6f    	add    %al,0x6f64ffff(%rax)
ffff800000111e8a:	5f                   	pop    %rdi
ffff800000111e8b:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
ffff800000111e92:	65 
ffff800000111e93:	72 72                	jb     ffff800000111f07 <_rodata+0x447>
ffff800000111e95:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e96:	72 28                	jb     ffff800000111ec0 <_rodata+0x400>
ffff800000111e98:	30 29                	xor    %ch,(%rcx)
ffff800000111e9a:	2c 45                	sub    $0x45,%al
ffff800000111e9c:	52                   	push   %rdx
ffff800000111e9d:	52                   	push   %rdx
ffff800000111e9e:	4f 52                	rex.WRXB push %r10
ffff800000111ea0:	5f                   	pop    %rdi
ffff800000111ea1:	43                   	rex.XB
ffff800000111ea2:	4f                   	rex.WRXB
ffff800000111ea3:	44                   	rex.R
ffff800000111ea4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424ece <_ebss+0x382f699e>
ffff800000111eab:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111eac:	78 2c                	js     ffff800000111eda <_rodata+0x41a>
ffff800000111eae:	52                   	push   %rdx
ffff800000111eaf:	53                   	push   %rbx
ffff800000111eb0:	50                   	push   %rax
ffff800000111eb1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424eda <_ebss+0x382f69aa>
ffff800000111eb7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111eb8:	78 2c                	js     ffff800000111ee6 <_rodata+0x426>
ffff800000111eba:	52                   	push   %rdx
ffff800000111ebb:	49 50                	rex.WB push %r8
ffff800000111ebd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ee6 <_ebss+0x382f69b6>
ffff800000111ec3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ec4:	78 0a                	js     ffff800000111ed0 <_rodata+0x410>
ffff800000111ec6:	00 00                	add    %al,(%rax)
ffff800000111ec8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111eca:	5f                   	pop    %rdi
ffff800000111ecb:	64 65 62             	fs gs (bad) 
ffff800000111ece:	75 67                	jne    ffff800000111f37 <_rodata+0x477>
ffff800000111ed0:	28 31                	sub    %dh,(%rcx)
ffff800000111ed2:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111ed9:	5f                   	pop    %rdi
ffff800000111eda:	43                   	rex.XB
ffff800000111edb:	4f                   	rex.WRXB
ffff800000111edc:	44                   	rex.R
ffff800000111edd:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f07 <_ebss+0x382f69d7>
ffff800000111ee4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ee5:	78 2c                	js     ffff800000111f13 <_rodata+0x453>
ffff800000111ee7:	52                   	push   %rdx
ffff800000111ee8:	53                   	push   %rbx
ffff800000111ee9:	50                   	push   %rax
ffff800000111eea:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f13 <_ebss+0x382f69e3>
ffff800000111ef0:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ef1:	78 2c                	js     ffff800000111f1f <_rodata+0x45f>
ffff800000111ef3:	52                   	push   %rdx
ffff800000111ef4:	49 50                	rex.WB push %r8
ffff800000111ef6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f1f <_ebss+0x382f69ef>
ffff800000111efc:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111efd:	78 0a                	js     ffff800000111f09 <_rodata+0x449>
ffff800000111eff:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111f03:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111f04:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111f05:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
ffff800000111f0b:	52                   	push   %rdx
ffff800000111f0c:	52                   	push   %rdx
ffff800000111f0d:	4f 52                	rex.WRXB push %r10
ffff800000111f0f:	5f                   	pop    %rdi
ffff800000111f10:	43                   	rex.XB
ffff800000111f11:	4f                   	rex.WRXB
ffff800000111f12:	44                   	rex.R
ffff800000111f13:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f3d <_ebss+0x382f6a0d>
ffff800000111f1a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f1b:	78 2c                	js     ffff800000111f49 <_rodata+0x489>
ffff800000111f1d:	52                   	push   %rdx
ffff800000111f1e:	53                   	push   %rbx
ffff800000111f1f:	50                   	push   %rax
ffff800000111f20:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f49 <_ebss+0x382f6a19>
ffff800000111f26:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f27:	78 2c                	js     ffff800000111f55 <_rodata+0x495>
ffff800000111f29:	52                   	push   %rdx
ffff800000111f2a:	49 50                	rex.WB push %r8
ffff800000111f2c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f55 <_ebss+0x382f6a25>
ffff800000111f32:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f33:	78 0a                	js     ffff800000111f3f <_rodata+0x47f>
ffff800000111f35:	00 00                	add    %al,(%rax)
ffff800000111f37:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111f3b:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
ffff800000111f42:	2c 45                	sub    $0x45,%al
ffff800000111f44:	52                   	push   %rdx
ffff800000111f45:	52                   	push   %rdx
ffff800000111f46:	4f 52                	rex.WRXB push %r10
ffff800000111f48:	5f                   	pop    %rdi
ffff800000111f49:	43                   	rex.XB
ffff800000111f4a:	4f                   	rex.WRXB
ffff800000111f4b:	44                   	rex.R
ffff800000111f4c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f76 <_ebss+0x382f6a46>
ffff800000111f53:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f54:	78 2c                	js     ffff800000111f82 <_rodata+0x4c2>
ffff800000111f56:	52                   	push   %rdx
ffff800000111f57:	53                   	push   %rbx
ffff800000111f58:	50                   	push   %rax
ffff800000111f59:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f82 <_ebss+0x382f6a52>
ffff800000111f5f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f60:	78 2c                	js     ffff800000111f8e <_rodata+0x4ce>
ffff800000111f62:	52                   	push   %rdx
ffff800000111f63:	49 50                	rex.WB push %r8
ffff800000111f65:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f8e <_ebss+0x382f6a5e>
ffff800000111f6b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f6c:	78 0a                	js     ffff800000111f78 <_rodata+0x4b8>
ffff800000111f6e:	00 00                	add    %al,(%rax)
ffff800000111f70:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111f72:	5f                   	pop    %rdi
ffff800000111f73:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f74:	76 65                	jbe    ffff800000111fdb <_rodata+0x51b>
ffff800000111f76:	72 66                	jb     ffff800000111fde <_rodata+0x51e>
ffff800000111f78:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f79:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f7a:	77 28                	ja     ffff800000111fa4 <_rodata+0x4e4>
ffff800000111f7c:	34 29                	xor    $0x29,%al
ffff800000111f7e:	2c 45                	sub    $0x45,%al
ffff800000111f80:	52                   	push   %rdx
ffff800000111f81:	52                   	push   %rdx
ffff800000111f82:	4f 52                	rex.WRXB push %r10
ffff800000111f84:	5f                   	pop    %rdi
ffff800000111f85:	43                   	rex.XB
ffff800000111f86:	4f                   	rex.WRXB
ffff800000111f87:	44                   	rex.R
ffff800000111f88:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424fb2 <_ebss+0x382f6a82>
ffff800000111f8f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f90:	78 2c                	js     ffff800000111fbe <_rodata+0x4fe>
ffff800000111f92:	52                   	push   %rdx
ffff800000111f93:	53                   	push   %rbx
ffff800000111f94:	50                   	push   %rax
ffff800000111f95:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424fbe <_ebss+0x382f6a8e>
ffff800000111f9b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f9c:	78 2c                	js     ffff800000111fca <_rodata+0x50a>
ffff800000111f9e:	52                   	push   %rdx
ffff800000111f9f:	49 50                	rex.WB push %r8
ffff800000111fa1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424fca <_ebss+0x382f6a9a>
ffff800000111fa7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fa8:	78 0a                	js     ffff800000111fb4 <_rodata+0x4f4>
ffff800000111faa:	00 00                	add    %al,(%rax)
ffff800000111fac:	00 00                	add    %al,(%rax)
ffff800000111fae:	00 00                	add    %al,(%rax)
ffff800000111fb0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111fb2:	5f                   	pop    %rdi
ffff800000111fb3:	62                   	(bad)  
ffff800000111fb4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111fb5:	75 6e                	jne    ffff800000112025 <_rodata+0x565>
ffff800000111fb7:	64 73 28             	fs jae ffff800000111fe2 <_rodata+0x522>
ffff800000111fba:	35 29 2c 45 52       	xor    $0x52452c29,%eax
ffff800000111fbf:	52                   	push   %rdx
ffff800000111fc0:	4f 52                	rex.WRXB push %r10
ffff800000111fc2:	5f                   	pop    %rdi
ffff800000111fc3:	43                   	rex.XB
ffff800000111fc4:	4f                   	rex.WRXB
ffff800000111fc5:	44                   	rex.R
ffff800000111fc6:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424ff0 <_ebss+0x382f6ac0>
ffff800000111fcd:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fce:	78 2c                	js     ffff800000111ffc <_rodata+0x53c>
ffff800000111fd0:	52                   	push   %rdx
ffff800000111fd1:	53                   	push   %rbx
ffff800000111fd2:	50                   	push   %rax
ffff800000111fd3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ffc <_ebss+0x382f6acc>
ffff800000111fd9:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fda:	78 2c                	js     ffff800000112008 <_rodata+0x548>
ffff800000111fdc:	52                   	push   %rdx
ffff800000111fdd:	49 50                	rex.WB push %r8
ffff800000111fdf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425008 <_ebss+0x382f6ad8>
ffff800000111fe5:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fe6:	78 0a                	js     ffff800000111ff2 <_rodata+0x532>
	...
ffff800000111ff0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111ff2:	5f                   	pop    %rdi
ffff800000111ff3:	75 6e                	jne    ffff800000112063 <_rodata+0x5a3>
ffff800000111ff5:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
ffff800000111ffc:	5f 
ffff800000111ffd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ffe:	70 63                	jo     ffff800000112063 <_rodata+0x5a3>
ffff800000112000:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112001:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
ffff800000112005:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011200c:	5f                   	pop    %rdi
ffff80000011200d:	43                   	rex.XB
ffff80000011200e:	4f                   	rex.WRXB
ffff80000011200f:	44                   	rex.R
ffff800000112010:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842503a <_ebss+0x382f6b0a>
ffff800000112017:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112018:	78 2c                	js     ffff800000112046 <_rodata+0x586>
ffff80000011201a:	52                   	push   %rdx
ffff80000011201b:	53                   	push   %rbx
ffff80000011201c:	50                   	push   %rax
ffff80000011201d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425046 <_ebss+0x382f6b16>
ffff800000112023:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112024:	78 2c                	js     ffff800000112052 <_rodata+0x592>
ffff800000112026:	52                   	push   %rdx
ffff800000112027:	49 50                	rex.WB push %r8
ffff800000112029:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425052 <_ebss+0x382f6b22>
ffff80000011202f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112030:	78 0a                	js     ffff80000011203c <_rodata+0x57c>
ffff800000112032:	00 00                	add    %al,(%rax)
ffff800000112034:	00 00                	add    %al,(%rax)
ffff800000112036:	00 00                	add    %al,(%rax)
ffff800000112038:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011203a:	5f                   	pop    %rdi
ffff80000011203b:	64 65 76 5f          	fs gs jbe ffff80000011209e <_rodata+0x5de>
ffff80000011203f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112040:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112041:	74 5f                	je     ffff8000001120a2 <_rodata+0x5e2>
ffff800000112043:	61                   	(bad)  
ffff800000112044:	76 61                	jbe    ffff8000001120a7 <_rodata+0x5e7>
ffff800000112046:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
ffff80000011204d:	37 
ffff80000011204e:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112055:	5f                   	pop    %rdi
ffff800000112056:	43                   	rex.XB
ffff800000112057:	4f                   	rex.WRXB
ffff800000112058:	44                   	rex.R
ffff800000112059:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425083 <_ebss+0x382f6b53>
ffff800000112060:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112061:	78 2c                	js     ffff80000011208f <_rodata+0x5cf>
ffff800000112063:	52                   	push   %rdx
ffff800000112064:	53                   	push   %rbx
ffff800000112065:	50                   	push   %rax
ffff800000112066:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842508f <_ebss+0x382f6b5f>
ffff80000011206c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011206d:	78 2c                	js     ffff80000011209b <_rodata+0x5db>
ffff80000011206f:	52                   	push   %rdx
ffff800000112070:	49 50                	rex.WB push %r8
ffff800000112072:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842509b <_ebss+0x382f6b6b>
ffff800000112078:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112079:	78 0a                	js     ffff800000112085 <_rodata+0x5c5>
ffff80000011207b:	00 00                	add    %al,(%rax)
ffff80000011207d:	00 00                	add    %al,(%rax)
ffff80000011207f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112083:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112085:	75 62                	jne    ffff8000001120e9 <_rodata+0x629>
ffff800000112087:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112088:	65 5f                	gs pop %rdi
ffff80000011208a:	66 61                	data16 (bad) 
ffff80000011208c:	75 6c                	jne    ffff8000001120fa <_rodata+0x63a>
ffff80000011208e:	74 28                	je     ffff8000001120b8 <_rodata+0x5f8>
ffff800000112090:	38 29                	cmp    %ch,(%rcx)
ffff800000112092:	2c 45                	sub    $0x45,%al
ffff800000112094:	52                   	push   %rdx
ffff800000112095:	52                   	push   %rdx
ffff800000112096:	4f 52                	rex.WRXB push %r10
ffff800000112098:	5f                   	pop    %rdi
ffff800000112099:	43                   	rex.XB
ffff80000011209a:	4f                   	rex.WRXB
ffff80000011209b:	44                   	rex.R
ffff80000011209c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384250c6 <_ebss+0x382f6b96>
ffff8000001120a3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120a4:	78 2c                	js     ffff8000001120d2 <_rodata+0x612>
ffff8000001120a6:	52                   	push   %rdx
ffff8000001120a7:	53                   	push   %rbx
ffff8000001120a8:	50                   	push   %rax
ffff8000001120a9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384250d2 <_ebss+0x382f6ba2>
ffff8000001120af:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120b0:	78 2c                	js     ffff8000001120de <_rodata+0x61e>
ffff8000001120b2:	52                   	push   %rdx
ffff8000001120b3:	49 50                	rex.WB push %r8
ffff8000001120b5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384250de <_ebss+0x382f6bae>
ffff8000001120bb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120bc:	78 0a                	js     ffff8000001120c8 <_rodata+0x608>
ffff8000001120be:	00 00                	add    %al,(%rax)
ffff8000001120c0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001120c2:	5f                   	pop    %rdi
ffff8000001120c3:	63 6f 70             	movsxd 0x70(%rdi),%ebp
ffff8000001120c6:	72 6f                	jb     ffff800000112137 <_rodata+0x677>
ffff8000001120c8:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff8000001120cb:	73 6f                	jae    ffff80000011213c <_rodata+0x67c>
ffff8000001120cd:	72 5f                	jb     ffff80000011212e <_rodata+0x66e>
ffff8000001120cf:	73 65                	jae    ffff800000112136 <_rodata+0x676>
ffff8000001120d1:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001120d3:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001120d5:	74 5f                	je     ffff800000112136 <_rodata+0x676>
ffff8000001120d7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001120d8:	76 65                	jbe    ffff80000011213f <_rodata+0x67f>
ffff8000001120da:	72 72                	jb     ffff80000011214e <_rodata+0x68e>
ffff8000001120dc:	75 6e                	jne    ffff80000011214c <_rodata+0x68c>
ffff8000001120de:	28 39                	sub    %bh,(%rcx)
ffff8000001120e0:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001120e7:	5f                   	pop    %rdi
ffff8000001120e8:	43                   	rex.XB
ffff8000001120e9:	4f                   	rex.WRXB
ffff8000001120ea:	44                   	rex.R
ffff8000001120eb:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425115 <_ebss+0x382f6be5>
ffff8000001120f2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120f3:	78 2c                	js     ffff800000112121 <_rodata+0x661>
ffff8000001120f5:	52                   	push   %rdx
ffff8000001120f6:	53                   	push   %rbx
ffff8000001120f7:	50                   	push   %rax
ffff8000001120f8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425121 <_ebss+0x382f6bf1>
ffff8000001120fe:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120ff:	78 2c                	js     ffff80000011212d <_rodata+0x66d>
ffff800000112101:	52                   	push   %rdx
ffff800000112102:	49 50                	rex.WB push %r8
ffff800000112104:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842512d <_ebss+0x382f6bfd>
ffff80000011210a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011210b:	78 0a                	js     ffff800000112117 <_rodata+0x657>
ffff80000011210d:	00 00                	add    %al,(%rax)
ffff80000011210f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112113:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
ffff80000011211a:	5f                   	pop    %rdi
ffff80000011211b:	54                   	push   %rsp
ffff80000011211c:	53                   	push   %rbx
ffff80000011211d:	53                   	push   %rbx
ffff80000011211e:	28 31                	sub    %dh,(%rcx)
ffff800000112120:	30 29                	xor    %ch,(%rcx)
ffff800000112122:	2c 45                	sub    $0x45,%al
ffff800000112124:	52                   	push   %rdx
ffff800000112125:	52                   	push   %rdx
ffff800000112126:	4f 52                	rex.WRXB push %r10
ffff800000112128:	5f                   	pop    %rdi
ffff800000112129:	43                   	rex.XB
ffff80000011212a:	4f                   	rex.WRXB
ffff80000011212b:	44                   	rex.R
ffff80000011212c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425156 <_ebss+0x382f6c26>
ffff800000112133:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112134:	78 2c                	js     ffff800000112162 <_rodata+0x6a2>
ffff800000112136:	52                   	push   %rdx
ffff800000112137:	53                   	push   %rbx
ffff800000112138:	50                   	push   %rax
ffff800000112139:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425162 <_ebss+0x382f6c32>
ffff80000011213f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112140:	78 2c                	js     ffff80000011216e <_rodata+0x6ae>
ffff800000112142:	52                   	push   %rdx
ffff800000112143:	49 50                	rex.WB push %r8
ffff800000112145:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842516e <_ebss+0x382f6c3e>
ffff80000011214b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011214c:	78 0a                	js     ffff800000112158 <_rodata+0x698>
ffff80000011214e:	00 00                	add    %al,(%rax)
ffff800000112150:	54                   	push   %rsp
ffff800000112151:	68 65 20 65 78       	pushq  $0x78652065
ffff800000112156:	63 65 70             	movsxd 0x70(%rbp),%esp
ffff800000112159:	74 69                	je     ffff8000001121c4 <_rodata+0x704>
ffff80000011215b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011215c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011215d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff800000112160:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000112163:	72 65                	jb     ffff8000001121ca <_rodata+0x70a>
ffff800000112165:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000011216a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff800000112171:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff800000112178:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000011217c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000011217f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112181:	74 20                	je     ffff8000001121a3 <_rodata+0x6e3>
ffff800000112183:	65 78 74             	gs js  ffff8000001121fa <_rodata+0x73a>
ffff800000112186:	65 72 6e             	gs jb  ffff8000001121f7 <_rodata+0x737>
ffff800000112189:	61                   	(bad)  
ffff80000011218a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011218b:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011218f:	74 68                	je     ffff8000001121f9 <_rodata+0x739>
ffff800000112191:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff800000112195:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112196:	67 72 61             	addr32 jb ffff8000001121fa <_rodata+0x73a>
ffff800000112199:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011219a:	2c 73                	sub    $0x73,%al
ffff80000011219c:	75 63                	jne    ffff800000112201 <_rodata+0x741>
ffff80000011219e:	68 20 61 73 20       	pushq  $0x20736120
ffff8000001121a3:	61                   	(bad)  
ffff8000001121a4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001121a5:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff8000001121a8:	74 65                	je     ffff80000011220f <_rodata+0x74f>
ffff8000001121aa:	72 72                	jb     ffff80000011221e <_rodata+0x75e>
ffff8000001121ac:	75 70                	jne    ffff80000011221e <_rodata+0x75e>
ffff8000001121ae:	74 20                	je     ffff8000001121d0 <_rodata+0x710>
ffff8000001121b0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001121b1:	72 20                	jb     ffff8000001121d3 <_rodata+0x713>
ffff8000001121b3:	61                   	(bad)  
ffff8000001121b4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001121b5:	20 65 61             	and    %ah,0x61(%rbp)
ffff8000001121b8:	72 6c                	jb     ffff800000112226 <_rodata+0x766>
ffff8000001121ba:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff8000001121c1:	65 70 74             	gs jo  ffff800000112238 <_rodata+0x778>
ffff8000001121c4:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff8000001121cb:	00 00                	add    %al,(%rax)
ffff8000001121cd:	00 00                	add    %al,(%rax)
ffff8000001121cf:	00 52 65             	add    %dl,0x65(%rdx)
ffff8000001121d2:	66 65 72 73          	data16 gs jb ffff800000112249 <_rodata+0x789>
ffff8000001121d6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001121da:	61                   	(bad)  
ffff8000001121db:	20 67 61             	and    %ah,0x61(%rdi)
ffff8000001121de:	74 65                	je     ffff800000112245 <_rodata+0x785>
ffff8000001121e0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001121e4:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001121e7:	70 74                	jo     ffff80000011225d <_rodata+0x79d>
ffff8000001121e9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001121ea:	72 20                	jb     ffff80000011220c <_rodata+0x74c>
ffff8000001121ec:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001121f3:	49                   	rex.WB
ffff8000001121f4:	44 54                	rex.R push %rsp
ffff8000001121f6:	3b 0a                	cmp    (%rdx),%ecx
	...
ffff800000112200:	52                   	push   %rdx
ffff800000112201:	65 66 65 72 73       	gs data16 gs jb ffff800000112279 <_rodata+0x7b9>
ffff800000112206:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011220a:	61                   	(bad)  
ffff80000011220b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011220f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000112212:	70 74                	jo     ffff800000112288 <_rodata+0x7c8>
ffff800000112214:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112215:	72 20                	jb     ffff800000112237 <_rodata+0x777>
ffff800000112217:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011221e:	47                   	rex.RXB
ffff80000011221f:	44 54                	rex.R push %rsp
ffff800000112221:	20 6f 72             	and    %ch,0x72(%rdi)
ffff800000112224:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff800000112228:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000011222b:	72 72                	jb     ffff80000011229f <_rodata+0x7df>
ffff80000011222d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011222f:	74 20                	je     ffff800000112251 <_rodata+0x791>
ffff800000112231:	4c                   	rex.WR
ffff800000112232:	44 54                	rex.R push %rsp
ffff800000112234:	3b 0a                	cmp    (%rdx),%ecx
ffff800000112236:	00 00                	add    %al,(%rax)
ffff800000112238:	52                   	push   %rdx
ffff800000112239:	65 66 65 72 73       	gs data16 gs jb ffff8000001122b1 <_rodata+0x7f1>
ffff80000011223e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff800000112242:	61                   	(bad)  
ffff800000112243:	20 73 65             	and    %dh,0x65(%rbx)
ffff800000112246:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112248:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011224a:	74 20                	je     ffff80000011226c <_rodata+0x7ac>
ffff80000011224c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011224d:	72 20                	jb     ffff80000011226f <_rodata+0x7af>
ffff80000011224f:	67 61                	addr32 (bad) 
ffff800000112251:	74 65                	je     ffff8000001122b8 <_rodata+0x7f8>
ffff800000112253:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000112257:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff80000011225a:	70 74                	jo     ffff8000001122d0 <_rodata+0x810>
ffff80000011225c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011225d:	72 20                	jb     ffff80000011227f <_rodata+0x7bf>
ffff80000011225f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000112266:	4c                   	rex.WR
ffff800000112267:	44 54                	rex.R push %rsp
ffff800000112269:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011226b:	00 00                	add    %al,(%rax)
ffff80000011226d:	00 00                	add    %al,(%rax)
ffff80000011226f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000112272:	66 65 72 73          	data16 gs jb ffff8000001122e9 <_rodata+0x829>
ffff800000112276:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011227a:	61                   	(bad)  
ffff80000011227b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011227f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000112282:	70 74                	jo     ffff8000001122f8 <_rodata+0x838>
ffff800000112284:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112285:	72 20                	jb     ffff8000001122a7 <_rodata+0x7e7>
ffff800000112287:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011228e:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000112291:	72 65                	jb     ffff8000001122f8 <_rodata+0x838>
ffff800000112293:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112294:	74 20                	je     ffff8000001122b6 <_rodata+0x7f6>
ffff800000112296:	47                   	rex.RXB
ffff800000112297:	44 54                	rex.R push %rsp
ffff800000112299:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011229b:	00 00                	add    %al,(%rax)
ffff80000011229d:	00 00                	add    %al,(%rax)
ffff80000011229f:	00 53 65             	add    %dl,0x65(%rbx)
ffff8000001122a2:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001122a4:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001122a6:	74 20                	je     ffff8000001122c8 <_rodata+0x808>
ffff8000001122a8:	53                   	push   %rbx
ffff8000001122a9:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff8000001122ab:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
ffff8000001122b0:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff8000001122b3:	64 65 78 3a          	fs gs js ffff8000001122f1 <_rodata+0x831>
ffff8000001122b7:	25 23 30 31 30       	and    $0x30313023,%eax
ffff8000001122bc:	78 0a                	js     ffff8000001122c8 <_rodata+0x808>
ffff8000001122be:	00 00                	add    %al,(%rax)
ffff8000001122c0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001122c2:	5f                   	pop    %rdi
ffff8000001122c3:	73 65                	jae    ffff80000011232a <_rodata+0x86a>
ffff8000001122c5:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001122c7:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001122c9:	74 5f                	je     ffff80000011232a <_rodata+0x86a>
ffff8000001122cb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001122cc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001122cd:	74 5f                	je     ffff80000011232e <_rodata+0x86e>
ffff8000001122cf:	70 72                	jo     ffff800000112343 <_rodata+0x883>
ffff8000001122d1:	65 73 65             	gs jae ffff800000112339 <_rodata+0x879>
ffff8000001122d4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001122d5:	74 28                	je     ffff8000001122ff <_rodata+0x83f>
ffff8000001122d7:	31 31                	xor    %esi,(%rcx)
ffff8000001122d9:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001122e0:	5f                   	pop    %rdi
ffff8000001122e1:	43                   	rex.XB
ffff8000001122e2:	4f                   	rex.WRXB
ffff8000001122e3:	44                   	rex.R
ffff8000001122e4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842530e <_ebss+0x382f6dde>
ffff8000001122eb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122ec:	78 2c                	js     ffff80000011231a <_rodata+0x85a>
ffff8000001122ee:	52                   	push   %rdx
ffff8000001122ef:	53                   	push   %rbx
ffff8000001122f0:	50                   	push   %rax
ffff8000001122f1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842531a <_ebss+0x382f6dea>
ffff8000001122f7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122f8:	78 2c                	js     ffff800000112326 <_rodata+0x866>
ffff8000001122fa:	52                   	push   %rdx
ffff8000001122fb:	49 50                	rex.WB push %r8
ffff8000001122fd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425326 <_ebss+0x382f6df6>
ffff800000112303:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112304:	78 0a                	js     ffff800000112310 <_rodata+0x850>
ffff800000112306:	00 00                	add    %al,(%rax)
ffff800000112308:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011230a:	5f                   	pop    %rdi
ffff80000011230b:	73 74                	jae    ffff800000112381 <_rodata+0x8c1>
ffff80000011230d:	61                   	(bad)  
ffff80000011230e:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
ffff800000112311:	73 65                	jae    ffff800000112378 <_rodata+0x8b8>
ffff800000112313:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112315:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112317:	74 5f                	je     ffff800000112378 <_rodata+0x8b8>
ffff800000112319:	66 61                	data16 (bad) 
ffff80000011231b:	75 6c                	jne    ffff800000112389 <_rodata+0x8c9>
ffff80000011231d:	74 28                	je     ffff800000112347 <_rodata+0x887>
ffff80000011231f:	31 32                	xor    %esi,(%rdx)
ffff800000112321:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112328:	5f                   	pop    %rdi
ffff800000112329:	43                   	rex.XB
ffff80000011232a:	4f                   	rex.WRXB
ffff80000011232b:	44                   	rex.R
ffff80000011232c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425356 <_ebss+0x382f6e26>
ffff800000112333:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112334:	78 2c                	js     ffff800000112362 <_rodata+0x8a2>
ffff800000112336:	52                   	push   %rdx
ffff800000112337:	53                   	push   %rbx
ffff800000112338:	50                   	push   %rax
ffff800000112339:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425362 <_ebss+0x382f6e32>
ffff80000011233f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112340:	78 2c                	js     ffff80000011236e <_rodata+0x8ae>
ffff800000112342:	52                   	push   %rdx
ffff800000112343:	49 50                	rex.WB push %r8
ffff800000112345:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842536e <_ebss+0x382f6e3e>
ffff80000011234b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011234c:	78 0a                	js     ffff800000112358 <_rodata+0x898>
ffff80000011234e:	00 00                	add    %al,(%rax)
ffff800000112350:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112352:	5f                   	pop    %rdi
ffff800000112353:	67 65 6e             	outsb  %gs:(%esi),(%dx)
ffff800000112356:	65 72 61             	gs jb  ffff8000001123ba <_rodata+0x8fa>
ffff800000112359:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011235a:	5f                   	pop    %rdi
ffff80000011235b:	70 72                	jo     ffff8000001123cf <_rodata+0x90f>
ffff80000011235d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011235e:	74 65                	je     ffff8000001123c5 <_rodata+0x905>
ffff800000112360:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff800000112364:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112365:	28 31                	sub    %dh,(%rcx)
ffff800000112367:	33 29                	xor    (%rcx),%ebp
ffff800000112369:	2c 45                	sub    $0x45,%al
ffff80000011236b:	52                   	push   %rdx
ffff80000011236c:	52                   	push   %rdx
ffff80000011236d:	4f 52                	rex.WRXB push %r10
ffff80000011236f:	5f                   	pop    %rdi
ffff800000112370:	43                   	rex.XB
ffff800000112371:	4f                   	rex.WRXB
ffff800000112372:	44                   	rex.R
ffff800000112373:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842539d <_ebss+0x382f6e6d>
ffff80000011237a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011237b:	78 2c                	js     ffff8000001123a9 <_rodata+0x8e9>
ffff80000011237d:	52                   	push   %rdx
ffff80000011237e:	53                   	push   %rbx
ffff80000011237f:	50                   	push   %rax
ffff800000112380:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253a9 <_ebss+0x382f6e79>
ffff800000112386:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112387:	78 2c                	js     ffff8000001123b5 <_rodata+0x8f5>
ffff800000112389:	52                   	push   %rdx
ffff80000011238a:	49 50                	rex.WB push %r8
ffff80000011238c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253b5 <_ebss+0x382f6e85>
ffff800000112392:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112393:	78 0a                	js     ffff80000011239f <_rodata+0x8df>
ffff800000112395:	00 00                	add    %al,(%rax)
ffff800000112397:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff80000011239b:	70 61                	jo     ffff8000001123fe <_rodata+0x93e>
ffff80000011239d:	67 65 5f             	addr32 gs pop %rdi
ffff8000001123a0:	66 61                	data16 (bad) 
ffff8000001123a2:	75 6c                	jne    ffff800000112410 <_rodata+0x950>
ffff8000001123a4:	74 28                	je     ffff8000001123ce <_rodata+0x90e>
ffff8000001123a6:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
ffff8000001123a9:	2c 45                	sub    $0x45,%al
ffff8000001123ab:	52                   	push   %rdx
ffff8000001123ac:	52                   	push   %rdx
ffff8000001123ad:	4f 52                	rex.WRXB push %r10
ffff8000001123af:	5f                   	pop    %rdi
ffff8000001123b0:	43                   	rex.XB
ffff8000001123b1:	4f                   	rex.WRXB
ffff8000001123b2:	44                   	rex.R
ffff8000001123b3:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384253dd <_ebss+0x382f6ead>
ffff8000001123ba:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123bb:	78 2c                	js     ffff8000001123e9 <_rodata+0x929>
ffff8000001123bd:	52                   	push   %rdx
ffff8000001123be:	53                   	push   %rbx
ffff8000001123bf:	50                   	push   %rax
ffff8000001123c0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253e9 <_ebss+0x382f6eb9>
ffff8000001123c6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123c7:	78 2c                	js     ffff8000001123f5 <_rodata+0x935>
ffff8000001123c9:	52                   	push   %rdx
ffff8000001123ca:	49 50                	rex.WB push %r8
ffff8000001123cc:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253f5 <_ebss+0x382f6ec5>
ffff8000001123d2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123d3:	78 0a                	js     ffff8000001123df <_rodata+0x91f>
ffff8000001123d5:	00 50 61             	add    %dl,0x61(%rax)
ffff8000001123d8:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff8000001123dd:	74 2d                	je     ffff80000011240c <_rodata+0x94c>
ffff8000001123df:	50                   	push   %rax
ffff8000001123e0:	72 65                	jb     ffff800000112447 <_rodata+0x987>
ffff8000001123e2:	73 65                	jae    ffff800000112449 <_rodata+0x989>
ffff8000001123e4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001123e5:	74 2c                	je     ffff800000112413 <_rodata+0x953>
ffff8000001123e7:	09 00                	or     %eax,(%rax)
ffff8000001123e9:	57                   	push   %rdi
ffff8000001123ea:	72 69                	jb     ffff800000112455 <_rodata+0x995>
ffff8000001123ec:	74 65                	je     ffff800000112453 <_rodata+0x993>
ffff8000001123ee:	20 43 61             	and    %al,0x61(%rbx)
ffff8000001123f1:	75 73                	jne    ffff800000112466 <_rodata+0x9a6>
ffff8000001123f3:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001123f7:	75 6c                	jne    ffff800000112465 <_rodata+0x9a5>
ffff8000001123f9:	74 2c                	je     ffff800000112427 <_rodata+0x967>
ffff8000001123fb:	09 00                	or     %eax,(%rax)
ffff8000001123fd:	52                   	push   %rdx
ffff8000001123fe:	65 61                	gs (bad) 
ffff800000112400:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff800000112404:	75 73                	jne    ffff800000112479 <_rodata+0x9b9>
ffff800000112406:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000011240a:	75 6c                	jne    ffff800000112478 <_rodata+0x9b8>
ffff80000011240c:	74 2c                	je     ffff80000011243a <_rodata+0x97a>
ffff80000011240e:	09 00                	or     %eax,(%rax)
ffff800000112410:	46 61                	rex.RX (bad) 
ffff800000112412:	75 6c                	jne    ffff800000112480 <_rodata+0x9c0>
ffff800000112414:	74 20                	je     ffff800000112436 <_rodata+0x976>
ffff800000112416:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000011241d:	28 33                	sub    %dh,(%rbx)
ffff80000011241f:	29 09                	sub    %ecx,(%rcx)
ffff800000112421:	00 46 61             	add    %al,0x61(%rsi)
ffff800000112424:	75 6c                	jne    ffff800000112492 <_rodata+0x9d2>
ffff800000112426:	74 20                	je     ffff800000112448 <_rodata+0x988>
ffff800000112428:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000011242f:	72 76                	jb     ffff8000001124a7 <_rodata+0x9e7>
ffff800000112431:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff800000112438:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000011243b:	29 09                	sub    %ecx,(%rcx)
ffff80000011243d:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
ffff800000112440:	65 73 65             	gs jae ffff8000001124a8 <_rodata+0x9e8>
ffff800000112443:	72 76                	jb     ffff8000001124bb <_rodata+0x9fb>
ffff800000112445:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000011244a:	74 20                	je     ffff80000011246c <_rodata+0x9ac>
ffff80000011244c:	43 61                	rex.XB (bad) 
ffff80000011244e:	75 73                	jne    ffff8000001124c3 <_rodata+0xa03>
ffff800000112450:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000112454:	75 6c                	jne    ffff8000001124c2 <_rodata+0xa02>
ffff800000112456:	74 09                	je     ffff800000112461 <_rodata+0x9a1>
	...
ffff800000112460:	2c 49                	sub    $0x49,%al
ffff800000112462:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112463:	73 74                	jae    ffff8000001124d9 <_rodata+0xa19>
ffff800000112465:	72 75                	jb     ffff8000001124dc <_rodata+0xa1c>
ffff800000112467:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff80000011246b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011246c:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000011246f:	74 63                	je     ffff8000001124d4 <_rodata+0xa14>
ffff800000112471:	68 20 43 61 75       	pushq  $0x75614320
ffff800000112476:	73 65                	jae    ffff8000001124dd <_rodata+0xa1d>
ffff800000112478:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011247b:	75 6c                	jne    ffff8000001124e9 <_rodata+0xa29>
ffff80000011247d:	74 00                	je     ffff80000011247f <_rodata+0x9bf>
ffff80000011247f:	0a 00                	or     (%rax),%al
ffff800000112481:	43 52                	rex.XB push %r10
ffff800000112483:	32 3a                	xor    (%rdx),%bh
ffff800000112485:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011248a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011248b:	78 0a                	js     ffff800000112497 <_rodata+0x9d7>
ffff80000011248d:	00 00                	add    %al,(%rax)
ffff80000011248f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112493:	78 38                	js     ffff8000001124cd <_rodata+0xa0d>
ffff800000112495:	37                   	(bad)  
ffff800000112496:	5f                   	pop    %rdi
ffff800000112497:	46 50                	rex.RX push %rax
ffff800000112499:	55                   	push   %rbp
ffff80000011249a:	5f                   	pop    %rdi
ffff80000011249b:	65 72 72             	gs jb  ffff800000112510 <_rodata+0xa50>
ffff80000011249e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011249f:	72 28                	jb     ffff8000001124c9 <_rodata+0xa09>
ffff8000001124a1:	31 36                	xor    %esi,(%rsi)
ffff8000001124a3:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001124aa:	5f                   	pop    %rdi
ffff8000001124ab:	43                   	rex.XB
ffff8000001124ac:	4f                   	rex.WRXB
ffff8000001124ad:	44                   	rex.R
ffff8000001124ae:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384254d8 <_ebss+0x382f6fa8>
ffff8000001124b5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124b6:	78 2c                	js     ffff8000001124e4 <_rodata+0xa24>
ffff8000001124b8:	52                   	push   %rdx
ffff8000001124b9:	53                   	push   %rbx
ffff8000001124ba:	50                   	push   %rax
ffff8000001124bb:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254e4 <_ebss+0x382f6fb4>
ffff8000001124c1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124c2:	78 2c                	js     ffff8000001124f0 <_rodata+0xa30>
ffff8000001124c4:	52                   	push   %rdx
ffff8000001124c5:	49 50                	rex.WB push %r8
ffff8000001124c7:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254f0 <_ebss+0x382f6fc0>
ffff8000001124cd:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124ce:	78 0a                	js     ffff8000001124da <_rodata+0xa1a>
	...
ffff8000001124d8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001124da:	5f                   	pop    %rdi
ffff8000001124db:	61                   	(bad)  
ffff8000001124dc:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124dd:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff8000001124e4:	5f                   	pop    %rdi
ffff8000001124e5:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff8000001124e8:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff8000001124eb:	31 37                	xor    %esi,(%rdi)
ffff8000001124ed:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001124f4:	5f                   	pop    %rdi
ffff8000001124f5:	43                   	rex.XB
ffff8000001124f6:	4f                   	rex.WRXB
ffff8000001124f7:	44                   	rex.R
ffff8000001124f8:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425522 <_ebss+0x382f6ff2>
ffff8000001124ff:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112500:	78 2c                	js     ffff80000011252e <_rodata+0xa6e>
ffff800000112502:	52                   	push   %rdx
ffff800000112503:	53                   	push   %rbx
ffff800000112504:	50                   	push   %rax
ffff800000112505:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842552e <_ebss+0x382f6ffe>
ffff80000011250b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011250c:	78 2c                	js     ffff80000011253a <_rodata+0xa7a>
ffff80000011250e:	52                   	push   %rdx
ffff80000011250f:	49 50                	rex.WB push %r8
ffff800000112511:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842553a <_ebss+0x382f700a>
ffff800000112517:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112518:	78 0a                	js     ffff800000112524 <_rodata+0xa64>
ffff80000011251a:	00 00                	add    %al,(%rax)
ffff80000011251c:	00 00                	add    %al,(%rax)
ffff80000011251e:	00 00                	add    %al,(%rax)
ffff800000112520:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112522:	5f                   	pop    %rdi
ffff800000112523:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112524:	61                   	(bad)  
ffff800000112525:	63 68 69             	movsxd 0x69(%rax),%ebp
ffff800000112528:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112529:	65 5f                	gs pop %rdi
ffff80000011252b:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff80000011252e:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff800000112531:	31 38                	xor    %edi,(%rax)
ffff800000112533:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011253a:	5f                   	pop    %rdi
ffff80000011253b:	43                   	rex.XB
ffff80000011253c:	4f                   	rex.WRXB
ffff80000011253d:	44                   	rex.R
ffff80000011253e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425568 <_ebss+0x382f7038>
ffff800000112545:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112546:	78 2c                	js     ffff800000112574 <_rodata+0xab4>
ffff800000112548:	52                   	push   %rdx
ffff800000112549:	53                   	push   %rbx
ffff80000011254a:	50                   	push   %rax
ffff80000011254b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425574 <_ebss+0x382f7044>
ffff800000112551:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112552:	78 2c                	js     ffff800000112580 <_rodata+0xac0>
ffff800000112554:	52                   	push   %rdx
ffff800000112555:	49 50                	rex.WB push %r8
ffff800000112557:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425580 <_ebss+0x382f7050>
ffff80000011255d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011255e:	78 0a                	js     ffff80000011256a <_rodata+0xaaa>
	...
ffff800000112568:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011256a:	5f                   	pop    %rdi
ffff80000011256b:	53                   	push   %rbx
ffff80000011256c:	49                   	rex.WB
ffff80000011256d:	4d                   	rex.WRB
ffff80000011256e:	44 5f                	rex.R pop %rdi
ffff800000112570:	65 78 63             	gs js  ffff8000001125d6 <_rodata+0xb16>
ffff800000112573:	65 70 74             	gs jo  ffff8000001125ea <_rodata+0xb2a>
ffff800000112576:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
ffff80000011257d:	2c 45                	sub    $0x45,%al
ffff80000011257f:	52                   	push   %rdx
ffff800000112580:	52                   	push   %rdx
ffff800000112581:	4f 52                	rex.WRXB push %r10
ffff800000112583:	5f                   	pop    %rdi
ffff800000112584:	43                   	rex.XB
ffff800000112585:	4f                   	rex.WRXB
ffff800000112586:	44                   	rex.R
ffff800000112587:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384255b1 <_ebss+0x382f7081>
ffff80000011258e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011258f:	78 2c                	js     ffff8000001125bd <_rodata+0xafd>
ffff800000112591:	52                   	push   %rdx
ffff800000112592:	53                   	push   %rbx
ffff800000112593:	50                   	push   %rax
ffff800000112594:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384255bd <_ebss+0x382f708d>
ffff80000011259a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011259b:	78 2c                	js     ffff8000001125c9 <_rodata+0xb09>
ffff80000011259d:	52                   	push   %rdx
ffff80000011259e:	49 50                	rex.WB push %r8
ffff8000001125a0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384255c9 <_ebss+0x382f7099>
ffff8000001125a6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125a7:	78 0a                	js     ffff8000001125b3 <_rodata+0xaf3>
ffff8000001125a9:	00 00                	add    %al,(%rax)
ffff8000001125ab:	00 00                	add    %al,(%rax)
ffff8000001125ad:	00 00                	add    %al,(%rax)
ffff8000001125af:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001125b3:	76 69                	jbe    ffff80000011261e <_rodata+0xb5e>
ffff8000001125b5:	72 74                	jb     ffff80000011262b <_rodata+0xb6b>
ffff8000001125b7:	75 61                	jne    ffff80000011261a <_rodata+0xb5a>
ffff8000001125b9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125ba:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff8000001125c1:	5f                   	pop    %rdi
ffff8000001125c2:	65 78 63             	gs js  ffff800000112628 <_rodata+0xb68>
ffff8000001125c5:	65 70 74             	gs jo  ffff80000011263c <_rodata+0xb7c>
ffff8000001125c8:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
ffff8000001125cf:	2c 45                	sub    $0x45,%al
ffff8000001125d1:	52                   	push   %rdx
ffff8000001125d2:	52                   	push   %rdx
ffff8000001125d3:	4f 52                	rex.WRXB push %r10
ffff8000001125d5:	5f                   	pop    %rdi
ffff8000001125d6:	43                   	rex.XB
ffff8000001125d7:	4f                   	rex.WRXB
ffff8000001125d8:	44                   	rex.R
ffff8000001125d9:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425603 <_ebss+0x382f70d3>
ffff8000001125e0:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125e1:	78 2c                	js     ffff80000011260f <_rodata+0xb4f>
ffff8000001125e3:	52                   	push   %rdx
ffff8000001125e4:	53                   	push   %rbx
ffff8000001125e5:	50                   	push   %rax
ffff8000001125e6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842560f <_ebss+0x382f70df>
ffff8000001125ec:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125ed:	78 2c                	js     ffff80000011261b <_rodata+0xb5b>
ffff8000001125ef:	52                   	push   %rdx
ffff8000001125f0:	49 50                	rex.WB push %r8
ffff8000001125f2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842561b <_ebss+0x382f70eb>
ffff8000001125f8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125f9:	78 0a                	js     ffff800000112605 <_rodata+0xb45>
ffff8000001125fb:	00 00                	add    %al,(%rax)
ffff8000001125fd:	00 00                	add    %al,(%rax)
ffff8000001125ff:	00 44 69 73          	add    %al,0x73(%rcx,%rbp,2)
ffff800000112603:	70 6c                	jo     ffff800000112671 <_rodata+0xbb1>
ffff800000112605:	61                   	(bad)  
ffff800000112606:	79 20                	jns    ffff800000112628 <_rodata+0xb68>
ffff800000112608:	50                   	push   %rax
ffff800000112609:	68 79 73 69 63       	pushq  $0x63697379
ffff80000011260e:	73 20                	jae    ffff800000112630 <_rodata+0xb70>
ffff800000112610:	41                   	rex.B
ffff800000112611:	64 64 72 65          	fs fs jb ffff80000011267a <_rodata+0xbba>
ffff800000112615:	73 73                	jae    ffff80000011268a <_rodata+0xbca>
ffff800000112617:	20 4d 41             	and    %cl,0x41(%rbp)
ffff80000011261a:	50                   	push   %rax
ffff80000011261b:	2c 54                	sub    $0x54,%al
ffff80000011261d:	79 70                	jns    ffff80000011268f <_rodata+0xbcf>
ffff80000011261f:	65 28 31             	sub    %dh,%gs:(%rcx)
ffff800000112622:	3a 52 41             	cmp    0x41(%rdx),%dl
ffff800000112625:	4d 2c 32             	rex.WRB sub $0x32,%al
ffff800000112628:	3a 52 4f             	cmp    0x4f(%rdx),%dl
ffff80000011262b:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
ffff80000011262f:	20 52 65             	and    %dl,0x65(%rdx)
ffff800000112632:	73 65                	jae    ffff800000112699 <_rodata+0xbd9>
ffff800000112634:	72 76                	jb     ffff8000001126ac <_rodata+0xbec>
ffff800000112636:	65 64 2c 33          	gs fs sub $0x33,%al
ffff80000011263a:	3a 41 43             	cmp    0x43(%rcx),%al
ffff80000011263d:	50                   	push   %rax
ffff80000011263e:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
ffff800000112642:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
ffff800000112646:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112647:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011264a:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011264b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011264c:	72 79                	jb     ffff8000001126c7 <_rodata+0xc07>
ffff80000011264e:	2c 34                	sub    $0x34,%al
ffff800000112650:	3a 41 43             	cmp    0x43(%rcx),%al
ffff800000112653:	50                   	push   %rax
ffff800000112654:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
ffff800000112658:	53                   	push   %rbx
ffff800000112659:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011265c:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011265d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011265e:	72 79                	jb     ffff8000001126d9 <_rodata+0xc19>
ffff800000112660:	2c 4f                	sub    $0x4f,%al
ffff800000112662:	74 68                	je     ffff8000001126cc <_rodata+0xc0c>
ffff800000112664:	65 72 73             	gs jb  ffff8000001126da <_rodata+0xc1a>
ffff800000112667:	3a 55 6e             	cmp    0x6e(%rbp),%dl
ffff80000011266a:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
ffff800000112671:	0a 
ffff800000112672:	00 00                	add    %al,(%rax)
ffff800000112674:	00 00                	add    %al,(%rax)
ffff800000112676:	00 00                	add    %al,(%rax)
ffff800000112678:	4f 53                	rex.WRXB push %r11
ffff80000011267a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011267d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011267e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000112681:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000112687:	61                   	(bad)  
ffff800000112688:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112689:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000011268c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff8000384256b6 <_ebss+0x382f7186>
ffff800000112693:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112694:	78 0a                	js     ffff8000001126a0 <_rodata+0xbe0>
ffff800000112696:	00 00                	add    %al,(%rax)
ffff800000112698:	4f 53                	rex.WRXB push %r11
ffff80000011269a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011269d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011269e:	20 55 73             	and    %dl,0x73(%rbp)
ffff8000001126a1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff8000001126a7:	61                   	(bad)  
ffff8000001126a8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126a9:	20 32                	and    %dh,(%rdx)
ffff8000001126ab:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
ffff8000001126af:	47                   	rex.RXB
ffff8000001126b0:	45 73 3a             	rex.RB jae ffff8000001126ed <_rodata+0xc2d>
ffff8000001126b3:	25 23 30 31 30       	and    $0x30313023,%eax
ffff8000001126b8:	78 3d                	js     ffff8000001126f7 <_rodata+0xc37>
ffff8000001126ba:	25 30 31 30 64       	and    $0x64303130,%eax
ffff8000001126bf:	0a 00                	or     (%rax),%al
ffff8000001126c1:	00 00                	add    %al,(%rax)
ffff8000001126c3:	00 00                	add    %al,(%rax)
ffff8000001126c5:	00 00                	add    %al,(%rax)
ffff8000001126c7:	00 62 69             	add    %ah,0x69(%rdx)
ffff8000001126ca:	74 73                	je     ffff80000011273f <_rodata+0xc7f>
ffff8000001126cc:	5f                   	pop    %rdi
ffff8000001126cd:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001126ce:	61                   	(bad)  
ffff8000001126cf:	70 3a                	jo     ffff80000011270b <_rodata+0xc4b>
ffff8000001126d1:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001126d6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126d7:	78 2c                	js     ffff800000112705 <_rodata+0xc45>
ffff8000001126d9:	62                   	(bad)  
ffff8000001126da:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
ffff8000001126e1:	65 
ffff8000001126e2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842570b <_ebss+0x382f71db>
ffff8000001126e8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126e9:	78 2c                	js     ffff800000112717 <_rodata+0xc57>
ffff8000001126eb:	62                   	(bad)  
ffff8000001126ec:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
ffff8000001126f3:	67 
ffff8000001126f4:	74 68                	je     ffff80000011275e <_rodata+0xc9e>
ffff8000001126f6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842571f <_ebss+0x382f71ef>
ffff8000001126fc:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126fd:	78 0a                	js     ffff800000112709 <_rodata+0xc49>
ffff8000001126ff:	00 70 61             	add    %dh,0x61(%rax)
ffff800000112702:	67 65 73 5f          	addr32 gs jae ffff800000112765 <_rodata+0xca5>
ffff800000112706:	73 74                	jae    ffff80000011277c <_rodata+0xcbc>
ffff800000112708:	72 75                	jb     ffff80000011277f <_rodata+0xcbf>
ffff80000011270a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011270e:	23 30                	and    (%rax),%esi
ffff800000112710:	31 38                	xor    %edi,(%rax)
ffff800000112712:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112713:	78 2c                	js     ffff800000112741 <_rodata+0xc81>
ffff800000112715:	70 61                	jo     ffff800000112778 <_rodata+0xcb8>
ffff800000112717:	67 65 73 5f          	addr32 gs jae ffff80000011277a <_rodata+0xcba>
ffff80000011271b:	73 69                	jae    ffff800000112786 <_rodata+0xcc6>
ffff80000011271d:	7a 65                	jp     ffff800000112784 <_rodata+0xcc4>
ffff80000011271f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425748 <_ebss+0x382f7218>
ffff800000112725:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112726:	78 2c                	js     ffff800000112754 <_rodata+0xc94>
ffff800000112728:	70 61                	jo     ffff80000011278b <_rodata+0xccb>
ffff80000011272a:	67 65 73 5f          	addr32 gs jae ffff80000011278d <_rodata+0xccd>
ffff80000011272e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011272f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112731:	67 74 68             	addr32 je ffff80000011279c <_rodata+0xcdc>
ffff800000112734:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842575d <_ebss+0x382f722d>
ffff80000011273a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011273b:	78 0a                	js     ffff800000112747 <_rodata+0xc87>
ffff80000011273d:	00 00                	add    %al,(%rax)
ffff80000011273f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000112742:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112743:	65 73 5f             	gs jae ffff8000001127a5 <_rodata+0xce5>
ffff800000112746:	73 74                	jae    ffff8000001127bc <_rodata+0xcfc>
ffff800000112748:	72 75                	jb     ffff8000001127bf <_rodata+0xcff>
ffff80000011274a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011274e:	23 30                	and    (%rax),%esi
ffff800000112750:	31 38                	xor    %edi,(%rax)
ffff800000112752:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112753:	78 2c                	js     ffff800000112781 <_rodata+0xcc1>
ffff800000112755:	7a 6f                	jp     ffff8000001127c6 <_rodata+0xd06>
ffff800000112757:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112758:	65 73 5f             	gs jae ffff8000001127ba <_rodata+0xcfa>
ffff80000011275b:	73 69                	jae    ffff8000001127c6 <_rodata+0xd06>
ffff80000011275d:	7a 65                	jp     ffff8000001127c4 <_rodata+0xd04>
ffff80000011275f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425788 <_ebss+0x382f7258>
ffff800000112765:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112766:	78 2c                	js     ffff800000112794 <_rodata+0xcd4>
ffff800000112768:	7a 6f                	jp     ffff8000001127d9 <_rodata+0xd19>
ffff80000011276a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011276b:	65 73 5f             	gs jae ffff8000001127cd <_rodata+0xd0d>
ffff80000011276e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011276f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112771:	67 74 68             	addr32 je ffff8000001127dc <_rodata+0xd1c>
ffff800000112774:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842579d <_ebss+0x382f726d>
ffff80000011277a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011277b:	78 0a                	js     ffff800000112787 <_rodata+0xcc7>
ffff80000011277d:	00 00                	add    %al,(%rax)
ffff80000011277f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000112782:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112783:	65 5f                	gs pop %rdi
ffff800000112785:	73 74                	jae    ffff8000001127fb <_rodata+0xd3b>
ffff800000112787:	61                   	(bad)  
ffff800000112788:	72 74                	jb     ffff8000001127fe <_rodata+0xd3e>
ffff80000011278a:	5f                   	pop    %rdi
ffff80000011278b:	61                   	(bad)  
ffff80000011278c:	64 64 72 65          	fs fs jb ffff8000001127f5 <_rodata+0xd35>
ffff800000112790:	73 73                	jae    ffff800000112805 <_rodata+0xd45>
ffff800000112792:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257bb <_ebss+0x382f728b>
ffff800000112798:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112799:	78 2c                	js     ffff8000001127c7 <_rodata+0xd07>
ffff80000011279b:	7a 6f                	jp     ffff80000011280c <_rodata+0xd4c>
ffff80000011279d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011279e:	65 5f                	gs pop %rdi
ffff8000001127a0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001127a2:	64 5f                	fs pop %rdi
ffff8000001127a4:	61                   	(bad)  
ffff8000001127a5:	64 64 72 65          	fs fs jb ffff80000011280e <_rodata+0xd4e>
ffff8000001127a9:	73 73                	jae    ffff80000011281e <_rodata+0xd5e>
ffff8000001127ab:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257d4 <_ebss+0x382f72a4>
ffff8000001127b1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127b2:	78 2c                	js     ffff8000001127e0 <_rodata+0xd20>
ffff8000001127b4:	7a 6f                	jp     ffff800000112825 <_rodata+0xd65>
ffff8000001127b6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127b7:	65 5f                	gs pop %rdi
ffff8000001127b9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127ba:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001127bc:	67 74 68             	addr32 je ffff800000112827 <_rodata+0xd67>
ffff8000001127bf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257e8 <_ebss+0x382f72b8>
ffff8000001127c5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127c6:	78 2c                	js     ffff8000001127f4 <_rodata+0xd34>
ffff8000001127c8:	70 61                	jo     ffff80000011282b <_rodata+0xd6b>
ffff8000001127ca:	67 65 73 5f          	addr32 gs jae ffff80000011282d <_rodata+0xd6d>
ffff8000001127ce:	67 72 6f             	addr32 jb ffff800000112840 <_rodata+0xd80>
ffff8000001127d1:	75 70                	jne    ffff800000112843 <_rodata+0xd83>
ffff8000001127d3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257fc <_ebss+0x382f72cc>
ffff8000001127d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127da:	78 2c                	js     ffff800000112808 <_rodata+0xd48>
ffff8000001127dc:	70 61                	jo     ffff80000011283f <_rodata+0xd7f>
ffff8000001127de:	67 65 73 5f          	addr32 gs jae ffff800000112841 <_rodata+0xd81>
ffff8000001127e2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127e3:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001127e5:	67 74 68             	addr32 je ffff800000112850 <_rodata+0xd90>
ffff8000001127e8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425811 <_ebss+0x382f72e1>
ffff8000001127ee:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127ef:	78 0a                	js     ffff8000001127fb <_rodata+0xd3b>
ffff8000001127f1:	00 00                	add    %al,(%rax)
ffff8000001127f3:	00 00                	add    %al,(%rax)
ffff8000001127f5:	00 00                	add    %al,(%rax)
ffff8000001127f7:	00 73 74             	add    %dh,0x74(%rbx)
ffff8000001127fa:	61                   	(bad)  
ffff8000001127fb:	72 74                	jb     ffff800000112871 <_rodata+0xdb1>
ffff8000001127fd:	5f                   	pop    %rdi
ffff8000001127fe:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112801:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842582b <_ebss+0x382f72fb>
ffff800000112808:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112809:	78 2c                	js     ffff800000112837 <_rodata+0xd77>
ffff80000011280b:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011280d:	64 5f                	fs pop %rdi
ffff80000011280f:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112812:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842583c <_ebss+0x382f730c>
ffff800000112819:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011281a:	78 2c                	js     ffff800000112848 <_rodata+0xd88>
ffff80000011281c:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011281e:	64 5f                	fs pop %rdi
ffff800000112820:	64 61                	fs (bad) 
ffff800000112822:	74 61                	je     ffff800000112885 <_rodata+0xdc5>
ffff800000112824:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842584d <_ebss+0x382f731d>
ffff80000011282a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011282b:	78 2c                	js     ffff800000112859 <_rodata+0xd99>
ffff80000011282d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011282f:	64 5f                	fs pop %rdi
ffff800000112831:	62 72                	(bad)  
ffff800000112833:	6b 3a 25             	imul   $0x25,(%rdx),%edi
ffff800000112836:	23 30                	and    (%rax),%esi
ffff800000112838:	31 38                	xor    %edi,(%rax)
ffff80000011283a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011283b:	78 2c                	js     ffff800000112869 <_rodata+0xda9>
ffff80000011283d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011283f:	64 5f                	fs pop %rdi
ffff800000112841:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112842:	66 5f                	pop    %di
ffff800000112844:	73 74                	jae    ffff8000001128ba <_rodata+0xdfa>
ffff800000112846:	72 75                	jb     ffff8000001128bd <_rodata+0xdfd>
ffff800000112848:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011284c:	23 30                	and    (%rax),%esi
ffff80000011284e:	31 38                	xor    %edi,(%rax)
ffff800000112850:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112851:	78 0a                	js     ffff80000011285d <_rodata+0xd9d>
ffff800000112853:	00 47 6c             	add    %al,0x6c(%rdi)
ffff800000112856:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112857:	62 61 6c 5f 43       	(bad)
ffff80000011285c:	52                   	push   %rdx
ffff80000011285d:	33 09                	xor    (%rcx),%ecx
ffff80000011285f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425888 <_ebss+0x382f7358>
ffff800000112865:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112866:	78 0a                	js     ffff800000112872 <_rodata+0xdb2>
ffff800000112868:	00 2a                	add    %ch,(%rdx)
ffff80000011286a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000011286c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011286d:	62 61 6c 5f 43       	(bad)
ffff800000112872:	52                   	push   %rdx
ffff800000112873:	33 09                	xor    (%rcx),%ecx
ffff800000112875:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842589e <_ebss+0x382f736e>
ffff80000011287b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011287c:	78 0a                	js     ffff800000112888 <_rodata+0xdc8>
ffff80000011287e:	00 2a                	add    %ch,(%rdx)
ffff800000112880:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff800000112883:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112884:	62 61 6c 5f 43       	(bad)
ffff800000112889:	52                   	push   %rdx
ffff80000011288a:	33 09                	xor    (%rcx),%ecx
ffff80000011288c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384258b5 <_ebss+0x382f7385>
ffff800000112892:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112893:	78 0a                	js     ffff80000011289f <_rodata+0xddf>
ffff800000112895:	00 00                	add    %al,(%rax)
ffff800000112897:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff80000011289a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011289b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011289c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff80000011289f:	61                   	(bad)  
ffff8000001128a0:	67 65 73 20          	addr32 gs jae ffff8000001128c4 <_rodata+0xe04>
ffff8000001128a4:	65 72 72             	gs jb  ffff800000112919 <_rodata+0xe59>
ffff8000001128a7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001128a8:	72 20                	jb     ffff8000001128ca <_rodata+0xe0a>
ffff8000001128aa:	7a 6f                	jp     ffff80000011291b <_rodata+0xe5b>
ffff8000001128ac:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001128ad:	65 5f                	gs pop %rdi
ffff8000001128af:	73 65                	jae    ffff800000112916 <_rodata+0xe56>
ffff8000001128b1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128b2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
ffff8000001128b7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001128b8:	64 65 78 0a          	fs gs js ffff8000001128c6 <_rodata+0xe06>
ffff8000001128bc:	00 00                	add    %al,(%rax)
ffff8000001128be:	00 00                	add    %al,(%rax)
ffff8000001128c0:	38 32                	cmp    %dh,(%rdx)
ffff8000001128c2:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff8000001128c7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001128c8:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
ffff8000001128cf:	5f 
ffff8000001128d0:	49 52                	rex.WB push %r10
ffff8000001128d2:	51                   	push   %rcx
ffff8000001128d3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384258fc <_ebss+0x382f73cc>
ffff8000001128d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128da:	78 09                	js     ffff8000001128e5 <_rodata+0xe25>
ffff8000001128dc:	00 6b 65             	add    %ch,0x65(%rbx)
ffff8000001128df:	79 20                	jns    ffff800000112901 <_rodata+0xe41>
ffff8000001128e1:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff8000001128e4:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842590e <_ebss+0x382f73de>
ffff8000001128eb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128ec:	78 09                	js     ffff8000001128f7 <_rodata+0xe37>
ffff8000001128ee:	00 00                	add    %al,(%rax)
ffff8000001128f0:	72 65                	jb     ffff800000112957 <_rodata+0xe97>
ffff8000001128f2:	67 73 3a             	addr32 jae ffff80000011292f <_rodata+0xe6f>
ffff8000001128f5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001128fa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128fb:	78 09                	js     ffff800000112906 <_rodata+0xe46>
ffff8000001128fd:	3c 52                	cmp    $0x52,%al
ffff8000001128ff:	49 50                	rex.WB push %r8
ffff800000112901:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842592a <_ebss+0x382f73fa>
ffff800000112907:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112908:	78 09                	js     ffff800000112913 <_rodata+0xe53>
ffff80000011290a:	52                   	push   %rdx
ffff80000011290b:	53                   	push   %rbx
ffff80000011290c:	50                   	push   %rax
ffff80000011290d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425936 <_ebss+0x382f7406>
ffff800000112913:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112914:	78 3e                	js     ffff800000112954 <_rodata+0xe94>
ffff800000112916:	0a 00                	or     (%rax),%al
ffff800000112918:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112919:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011291a:	5f                   	pop    %rdi
ffff80000011291b:	73 79                	jae    ffff800000112996 <_rodata+0xed6>
ffff80000011291d:	73 74                	jae    ffff800000112993 <_rodata+0xed3>
ffff80000011291f:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000112921:	5f                   	pop    %rdi
ffff800000112922:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000112925:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112926:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000112929:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000011292c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011292d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011292e:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000112935:	25 23 30 34 78       	and    $0x78343023,%eax
ffff80000011293a:	0a 00                	or     (%rax),%al
ffff80000011293c:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011293e:	5f                   	pop    %rdi
ffff80000011293f:	65 78 65             	gs js  ffff8000001129a7 <_rodata+0xee7>
ffff800000112942:	63 76 65             	movsxd 0x65(%rsi),%esi
ffff800000112945:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff800000112949:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000011294c:	73 20                	jae    ffff80000011296e <_rodata+0xeae>
ffff80000011294e:	72 75                	jb     ffff8000001129c5 <_rodata+0xf05>
ffff800000112950:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112951:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112952:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
ffff800000112959:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011295a:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000112961:	20 
ffff800000112962:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000112969:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000112970:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425999 <_ebss+0x382f7469>
ffff800000112976:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112977:	78 0a                	js     ffff800000112983 <_rodata+0xec3>
ffff800000112979:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff80000011297d:	46                   	rex.RX
ffff80000011297e:	4f 52                	rex.WRXB push %r10
ffff800000112980:	4b 20 53 54          	rex.WXB and %dl,0x54(%r11)
ffff800000112984:	41 52                	push   %r10
ffff800000112986:	54                   	push   %rsp
ffff800000112987:	0a 00                	or     (%rax),%al
ffff800000112989:	61                   	(bad)  
ffff80000011298a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011298b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011298c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011298d:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff800000112990:	61                   	(bad)  
ffff800000112991:	67 65 73 2c          	addr32 gs jae ffff8000001129c1 <_rodata+0xf01>
ffff800000112995:	62                   	(bad)  
ffff800000112996:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
ffff80000011299d:	23 
ffff80000011299e:	30 31                	xor    %dh,(%rcx)
ffff8000001129a0:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
ffff8000001129a4:	00 00                	add    %al,(%rax)
ffff8000001129a6:	00 00                	add    %al,(%rax)
ffff8000001129a8:	73 74                	jae    ffff800000112a1e <_rodata+0xf5e>
ffff8000001129aa:	72 75                	jb     ffff800000112a21 <_rodata+0xf61>
ffff8000001129ac:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
ffff8000001129b0:	61                   	(bad)  
ffff8000001129b1:	73 6b                	jae    ffff800000112a1e <_rodata+0xf5e>
ffff8000001129b3:	5f                   	pop    %rdi
ffff8000001129b4:	73 74                	jae    ffff800000112a2a <_rodata+0xf6a>
ffff8000001129b6:	72 75                	jb     ffff800000112a2d <_rodata+0xf6d>
ffff8000001129b8:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
ffff8000001129bc:	64 64 72 65          	fs fs jb ffff800000112a25 <_rodata+0xf65>
ffff8000001129c0:	73 73                	jae    ffff800000112a35 <_rodata+0xf75>
ffff8000001129c2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384259eb <_ebss+0x382f74bb>
ffff8000001129c8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001129c9:	78 0a                	js     ffff8000001129d5 <_rodata+0xf15>
ffff8000001129cb:	00 74 68 64          	add    %dh,0x64(%rax,%rbp,2)
ffff8000001129cf:	2d 3e 66 73 3a       	sub    $0x3a73663e,%eax
ffff8000001129d4:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001129d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001129da:	78 0a                	js     ffff8000001129e6 <_rodata+0xf26>
ffff8000001129dc:	00 74 68 64          	add    %dh,0x64(%rax,%rbp,2)
ffff8000001129e0:	2d 3e 67 73 3a       	sub    $0x3a73673e,%eax
ffff8000001129e5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001129ea:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001129eb:	78 0a                	js     ffff8000001129f7 <_rodata+0xf37>
ffff8000001129ed:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff8000001129f1:	46                   	rex.RX
ffff8000001129f2:	4f 52                	rex.WRXB push %r10
ffff8000001129f4:	4b 20 46 49          	rex.WXB and %al,0x49(%r14)
ffff8000001129f8:	4e                   	rex.WRX
ffff8000001129f9:	49 53                	rex.WB push %r11
ffff8000001129fb:	48 0a 00             	rex.W or (%rax),%al
ffff8000001129fe:	00 00                	add    %al,(%rax)
ffff800000112a00:	65 78 69             	gs js  ffff800000112a6c <_rodata+0xfac>
ffff800000112a03:	74 20                	je     ffff800000112a25 <_rodata+0xf65>
ffff800000112a05:	74 61                	je     ffff800000112a68 <_rodata+0xfa8>
ffff800000112a07:	73 6b                	jae    ffff800000112a74 <_rodata+0xfb4>
ffff800000112a09:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000112a0c:	20 72 75             	and    %dh,0x75(%rdx)
ffff800000112a0f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112a10:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112a11:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000112a18:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425a41 <_ebss+0x382f7511>
ffff800000112a1e:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112a1f:	78 0a                	js     ffff800000112a2b <_rodata+0xf6b>
ffff800000112a21:	00 5f 5f             	add    %bl,0x5f(%rdi)
ffff800000112a24:	53                   	push   %rbx
ffff800000112a25:	57                   	push   %rdi
ffff800000112a26:	49 54                	rex.WB push %r12
ffff800000112a28:	43                   	rex.XB
ffff800000112a29:	48 5f                	rex.W pop %rdi
ffff800000112a2b:	54                   	push   %rsp
ffff800000112a2c:	4f 20 53 54          	rex.WRXB and %r10b,0x54(%r11)
ffff800000112a30:	41 52                	push   %r10
ffff800000112a32:	54                   	push   %rsp
ffff800000112a33:	0a 00                	or     (%rax),%al
ffff800000112a35:	70 72                	jo     ffff800000112aa9 <_rodata+0xfe9>
ffff800000112a37:	65 76 2d             	gs jbe ffff800000112a67 <_rodata+0xfa7>
ffff800000112a3a:	3e 74 68             	je,pt  ffff800000112aa5 <_rodata+0xfe5>
ffff800000112a3d:	72 65                	jb     ffff800000112aa4 <_rodata+0xfe4>
ffff800000112a3f:	61                   	(bad)  
ffff800000112a40:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000112a46:	30 3a                	xor    %bh,(%rdx)
ffff800000112a48:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112a4d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112a4e:	78 0a                	js     ffff800000112a5a <_rodata+0xf9a>
ffff800000112a50:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000112a53:	78 74                	js     ffff800000112ac9 <_rodata+0x1009>
ffff800000112a55:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000112a5a:	65 61                	gs (bad) 
ffff800000112a5c:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000112a62:	30 3a                	xor    %bh,(%rdx)
ffff800000112a64:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112a69:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112a6a:	78 0a                	js     ffff800000112a76 <_rodata+0xfb6>
ffff800000112a6c:	00 53 41             	add    %dl,0x41(%rbx)
ffff800000112a6f:	56                   	push   %rsi
ffff800000112a70:	45 20 50 52          	and    %r10b,0x52(%r8)
ffff800000112a74:	45 56                	rex.RB push %r14
ffff800000112a76:	20 46 53             	and    %al,0x53(%rsi)
ffff800000112a79:	20 47 53             	and    %al,0x53(%rdi)
ffff800000112a7c:	0a 00                	or     (%rax),%al
ffff800000112a7e:	4c                   	rex.WR
ffff800000112a7f:	4f                   	rex.WRXB
ffff800000112a80:	41                   	rex.B
ffff800000112a81:	44 20 4e 45          	and    %r9b,0x45(%rsi)
ffff800000112a85:	58                   	pop    %rax
ffff800000112a86:	54                   	push   %rsp
ffff800000112a87:	20 46 53             	and    %al,0x53(%rsi)
ffff800000112a8a:	20 47 53             	and    %al,0x53(%rdi)
ffff800000112a8d:	0a 00                	or     (%rax),%al
ffff800000112a8f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112a90:	65 78 74             	gs js  ffff800000112b07 <_erodata+0x30>
ffff800000112a93:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000112a98:	65 61                	gs (bad) 
ffff800000112a9a:	64 2d 3e 66 73 3a    	fs sub $0x3a73663e,%eax
ffff800000112aa0:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112aa5:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112aa6:	78 0a                	js     ffff800000112ab2 <_rodata+0xff2>
ffff800000112aa8:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000112aab:	78 74                	js     ffff800000112b21 <_erodata+0x4a>
ffff800000112aad:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000112ab2:	65 61                	gs (bad) 
ffff800000112ab4:	64 2d 3e 67 73 3a    	fs sub $0x3a73673e,%eax
ffff800000112aba:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112abf:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112ac0:	78 0a                	js     ffff800000112acc <_rodata+0x100c>
ffff800000112ac2:	00 5f 5f             	add    %bl,0x5f(%rdi)
ffff800000112ac5:	53                   	push   %rbx
ffff800000112ac6:	57                   	push   %rdi
ffff800000112ac7:	49 54                	rex.WB push %r12
ffff800000112ac9:	43                   	rex.XB
ffff800000112aca:	48 5f                	rex.W pop %rdi
ffff800000112acc:	54                   	push   %rsp
ffff800000112acd:	4f 20 46 49          	rex.WRXB and %r8b,0x49(%r14)
ffff800000112ad1:	4e                   	rex.WRX
ffff800000112ad2:	49 53                	rex.WB push %r11
ffff800000112ad4:	48 0a 00             	rex.W or (%rax),%al

Disassembly of section .eh_frame:

ffff800000112ad8 <.eh_frame>:
ffff800000112ad8:	14 00                	adc    $0x0,%al
ffff800000112ada:	00 00                	add    %al,(%rax)
ffff800000112adc:	00 00                	add    %al,(%rax)
ffff800000112ade:	00 00                	add    %al,(%rax)
ffff800000112ae0:	01 7a 52             	add    %edi,0x52(%rdx)
ffff800000112ae3:	00 01                	add    %al,(%rcx)
ffff800000112ae5:	78 10                	js     ffff800000112af7 <_erodata+0x20>
ffff800000112ae7:	01 1b                	add    %ebx,(%rbx)
ffff800000112ae9:	0c 07                	or     $0x7,%al
ffff800000112aeb:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff800000112af1:	00 00                	add    %al,(%rax)
ffff800000112af3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112af6:	00 00                	add    %al,(%rax)
ffff800000112af8:	7d 17                	jge    ffff800000112b11 <_erodata+0x3a>
ffff800000112afa:	ff                   	(bad)  
ffff800000112afb:	ff c9                	dec    %ecx
ffff800000112afd:	00 00                	add    %al,(%rax)
ffff800000112aff:	00 00                	add    %al,(%rax)
ffff800000112b01:	41 0e                	rex.B (bad) 
ffff800000112b03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b09:	02 c4                	add    %ah,%al
ffff800000112b0b:	0c 07                	or     $0x7,%al
ffff800000112b0d:	08 00                	or     %al,(%rax)
ffff800000112b0f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b12:	00 00                	add    %al,(%rax)
ffff800000112b14:	3c 00                	cmp    $0x0,%al
ffff800000112b16:	00 00                	add    %al,(%rax)
ffff800000112b18:	26 18 ff             	es sbb %bh,%bh
ffff800000112b1b:	ff 49 00             	decl   0x0(%rcx)
ffff800000112b1e:	00 00                	add    %al,(%rax)
ffff800000112b20:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b29:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000112b2d:	08 00                	or     %al,(%rax)
ffff800000112b2f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b32:	00 00                	add    %al,(%rax)
ffff800000112b34:	5c                   	pop    %rsp
ffff800000112b35:	00 00                	add    %al,(%rax)
ffff800000112b37:	00 4f 18             	add    %cl,0x18(%rdi)
ffff800000112b3a:	ff                   	(bad)  
ffff800000112b3b:	ff                   	(bad)  
ffff800000112b3c:	39 00                	cmp    %eax,(%rax)
ffff800000112b3e:	00 00                	add    %al,(%rax)
ffff800000112b40:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b49:	74 0c                	je     ffff800000112b57 <_erodata+0x80>
ffff800000112b4b:	07                   	(bad)  
ffff800000112b4c:	08 00                	or     %al,(%rax)
ffff800000112b4e:	00 00                	add    %al,(%rax)
ffff800000112b50:	1c 00                	sbb    $0x0,%al
ffff800000112b52:	00 00                	add    %al,(%rax)
ffff800000112b54:	7c 00                	jl     ffff800000112b56 <_erodata+0x7f>
ffff800000112b56:	00 00                	add    %al,(%rax)
ffff800000112b58:	68 18 ff ff 7c       	pushq  $0x7cffff18
ffff800000112b5d:	02 00                	add    (%rax),%al
ffff800000112b5f:	00 00                	add    %al,(%rax)
ffff800000112b61:	41 0e                	rex.B (bad) 
ffff800000112b63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b69:	00 00                	add    %al,(%rax)
ffff800000112b6b:	00 00                	add    %al,(%rax)
ffff800000112b6d:	00 00                	add    %al,(%rax)
ffff800000112b6f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b72:	00 00                	add    %al,(%rax)
ffff800000112b74:	9c                   	pushfq 
ffff800000112b75:	00 00                	add    %al,(%rax)
ffff800000112b77:	00 c4                	add    %al,%ah
ffff800000112b79:	1a ff                	sbb    %bh,%bh
ffff800000112b7b:	ff 2f                	ljmp   *(%rdi)
ffff800000112b7d:	00 00                	add    %al,(%rax)
ffff800000112b7f:	00 00                	add    %al,(%rax)
ffff800000112b81:	41 0e                	rex.B (bad) 
ffff800000112b83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b89:	41 83 03 69          	addl   $0x69,(%r11)
ffff800000112b8d:	0c 07                	or     $0x7,%al
ffff800000112b8f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff800000112b92:	00 00                	add    %al,(%rax)
ffff800000112b94:	bc 00 00 00 d3       	mov    $0xd3000000,%esp
ffff800000112b99:	1a ff                	sbb    %bh,%bh
ffff800000112b9b:	ff                   	(bad)  
ffff800000112b9c:	ef                   	out    %eax,(%dx)
ffff800000112b9d:	00 00                	add    %al,(%rax)
ffff800000112b9f:	00 00                	add    %al,(%rax)
ffff800000112ba1:	41 0e                	rex.B (bad) 
ffff800000112ba3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ba9:	02 ea                	add    %dl,%ch
ffff800000112bab:	0c 07                	or     $0x7,%al
ffff800000112bad:	08 00                	or     %al,(%rax)
ffff800000112baf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112bb2:	00 00                	add    %al,(%rax)
ffff800000112bb4:	dc 00                	faddl  (%rax)
ffff800000112bb6:	00 00                	add    %al,(%rax)
ffff800000112bb8:	a2 1b ff ff 60 00 00 	movabs %al,0x60ffff1b
ffff800000112bbf:	00 00 
ffff800000112bc1:	41 0e                	rex.B (bad) 
ffff800000112bc3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bc9:	02 5b 0c             	add    0xc(%rbx),%bl
ffff800000112bcc:	07                   	(bad)  
ffff800000112bcd:	08 00                	or     %al,(%rax)
ffff800000112bcf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112bd2:	00 00                	add    %al,(%rax)
ffff800000112bd4:	fc                   	cld    
ffff800000112bd5:	00 00                	add    %al,(%rax)
ffff800000112bd7:	00 e2                	add    %ah,%dl
ffff800000112bd9:	1b ff                	sbb    %edi,%edi
ffff800000112bdb:	ff 76 02             	pushq  0x2(%rsi)
ffff800000112bde:	00 00                	add    %al,(%rax)
ffff800000112be0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112be3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112be9:	03 71 02             	add    0x2(%rcx),%esi
ffff800000112bec:	0c 07                	or     $0x7,%al
ffff800000112bee:	08 00                	or     %al,(%rax)
ffff800000112bf0:	1c 00                	sbb    $0x0,%al
ffff800000112bf2:	00 00                	add    %al,(%rax)
ffff800000112bf4:	1c 01                	sbb    $0x1,%al
ffff800000112bf6:	00 00                	add    %al,(%rax)
ffff800000112bf8:	38 1e                	cmp    %bl,(%rsi)
ffff800000112bfa:	ff                   	(bad)  
ffff800000112bfb:	ff                   	(bad)  
ffff800000112bfc:	f9                   	stc    
ffff800000112bfd:	08 00                	or     %al,(%rax)
ffff800000112bff:	00 00                	add    %al,(%rax)
ffff800000112c01:	41 0e                	rex.B (bad) 
ffff800000112c03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c09:	03 f4                	add    %esp,%esi
ffff800000112c0b:	08 0c 07             	or     %cl,(%rdi,%rax,1)
ffff800000112c0e:	08 00                	or     %al,(%rax)
ffff800000112c10:	1c 00                	sbb    $0x0,%al
ffff800000112c12:	00 00                	add    %al,(%rax)
ffff800000112c14:	3c 01                	cmp    $0x1,%al
ffff800000112c16:	00 00                	add    %al,(%rax)
ffff800000112c18:	11 27                	adc    %esp,(%rdi)
ffff800000112c1a:	ff                   	(bad)  
ffff800000112c1b:	ff 29                	ljmp   *(%rcx)
ffff800000112c1d:	05 00 00 00 41       	add    $0x41000000,%eax
ffff800000112c22:	0e                   	(bad)  
ffff800000112c23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c29:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
ffff800000112c30:	1c 00                	sbb    $0x0,%al
ffff800000112c32:	00 00                	add    %al,(%rax)
ffff800000112c34:	5c                   	pop    %rsp
ffff800000112c35:	01 00                	add    %eax,(%rax)
ffff800000112c37:	00 1a                	add    %bl,(%rdx)
ffff800000112c39:	2c ff                	sub    $0xff,%al
ffff800000112c3b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112c41:	41 0e                	rex.B (bad) 
ffff800000112c43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c49:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112c4f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112c52:	00 00                	add    %al,(%rax)
ffff800000112c54:	7c 01                	jl     ffff800000112c57 <_erodata+0x180>
ffff800000112c56:	00 00                	add    %al,(%rax)
ffff800000112c58:	89 2c ff             	mov    %ebp,(%rdi,%rdi,8)
ffff800000112c5b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112c61:	41 0e                	rex.B (bad) 
ffff800000112c63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c69:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112c6f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112c72:	00 00                	add    %al,(%rax)
ffff800000112c74:	9c                   	pushfq 
ffff800000112c75:	01 00                	add    %eax,(%rax)
ffff800000112c77:	00 f8                	add    %bh,%al
ffff800000112c79:	2c ff                	sub    $0xff,%al
ffff800000112c7b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112c81:	41 0e                	rex.B (bad) 
ffff800000112c83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c89:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112c8f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112c92:	00 00                	add    %al,(%rax)
ffff800000112c94:	bc 01 00 00 67       	mov    $0x67000001,%esp
ffff800000112c99:	2d ff ff c9 00       	sub    $0xc9ffff,%eax
ffff800000112c9e:	00 00                	add    %al,(%rax)
ffff800000112ca0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112ca3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ca9:	02 c4                	add    %ah,%al
ffff800000112cab:	0c 07                	or     $0x7,%al
ffff800000112cad:	08 00                	or     %al,(%rax)
ffff800000112caf:	00 18                	add    %bl,(%rax)
ffff800000112cb1:	00 00                	add    %al,(%rax)
ffff800000112cb3:	00 dc                	add    %bl,%ah
ffff800000112cb5:	01 00                	add    %eax,(%rax)
ffff800000112cb7:	00 10                	add    %dl,(%rax)
ffff800000112cb9:	2e ff                	cs (bad) 
ffff800000112cbb:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cbe:	00 00                	add    %al,(%rax)
ffff800000112cc0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cc3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112cc9:	00 00                	add    %al,(%rax)
ffff800000112ccb:	00 18                	add    %bl,(%rax)
ffff800000112ccd:	00 00                	add    %al,(%rax)
ffff800000112ccf:	00 f8                	add    %bh,%al
ffff800000112cd1:	01 00                	add    %eax,(%rax)
ffff800000112cd3:	00 4f 2e             	add    %cl,0x2e(%rdi)
ffff800000112cd6:	ff                   	(bad)  
ffff800000112cd7:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cda:	00 00                	add    %al,(%rax)
ffff800000112cdc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cdf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ce5:	00 00                	add    %al,(%rax)
ffff800000112ce7:	00 18                	add    %bl,(%rax)
ffff800000112ce9:	00 00                	add    %al,(%rax)
ffff800000112ceb:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff800000112cee:	00 00                	add    %al,(%rax)
ffff800000112cf0:	8e 2e                	mov    (%rsi),%gs
ffff800000112cf2:	ff                   	(bad)  
ffff800000112cf3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cf6:	00 00                	add    %al,(%rax)
ffff800000112cf8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cfb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d01:	00 00                	add    %al,(%rax)
ffff800000112d03:	00 18                	add    %bl,(%rax)
ffff800000112d05:	00 00                	add    %al,(%rax)
ffff800000112d07:	00 30                	add    %dh,(%rax)
ffff800000112d09:	02 00                	add    (%rax),%al
ffff800000112d0b:	00 cd                	add    %cl,%ch
ffff800000112d0d:	2e ff                	cs (bad) 
ffff800000112d0f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d12:	00 00                	add    %al,(%rax)
ffff800000112d14:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d17:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d1d:	00 00                	add    %al,(%rax)
ffff800000112d1f:	00 18                	add    %bl,(%rax)
ffff800000112d21:	00 00                	add    %al,(%rax)
ffff800000112d23:	00 4c 02 00          	add    %cl,0x0(%rdx,%rax,1)
ffff800000112d27:	00 0c 2f             	add    %cl,(%rdi,%rbp,1)
ffff800000112d2a:	ff                   	(bad)  
ffff800000112d2b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d2e:	00 00                	add    %al,(%rax)
ffff800000112d30:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d39:	00 00                	add    %al,(%rax)
ffff800000112d3b:	00 18                	add    %bl,(%rax)
ffff800000112d3d:	00 00                	add    %al,(%rax)
ffff800000112d3f:	00 68 02             	add    %ch,0x2(%rax)
ffff800000112d42:	00 00                	add    %al,(%rax)
ffff800000112d44:	4b 2f                	rex.WXB (bad) 
ffff800000112d46:	ff                   	(bad)  
ffff800000112d47:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d4a:	00 00                	add    %al,(%rax)
ffff800000112d4c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d55:	00 00                	add    %al,(%rax)
ffff800000112d57:	00 18                	add    %bl,(%rax)
ffff800000112d59:	00 00                	add    %al,(%rax)
ffff800000112d5b:	00 84 02 00 00 8a 2f 	add    %al,0x2f8a0000(%rdx,%rax,1)
ffff800000112d62:	ff                   	(bad)  
ffff800000112d63:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d66:	00 00                	add    %al,(%rax)
ffff800000112d68:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d71:	00 00                	add    %al,(%rax)
ffff800000112d73:	00 18                	add    %bl,(%rax)
ffff800000112d75:	00 00                	add    %al,(%rax)
ffff800000112d77:	00 a0 02 00 00 c9    	add    %ah,-0x36fffffe(%rax)
ffff800000112d7d:	2f                   	(bad)  
ffff800000112d7e:	ff                   	(bad)  
ffff800000112d7f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d82:	00 00                	add    %al,(%rax)
ffff800000112d84:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d8d:	00 00                	add    %al,(%rax)
ffff800000112d8f:	00 18                	add    %bl,(%rax)
ffff800000112d91:	00 00                	add    %al,(%rax)
ffff800000112d93:	00 bc 02 00 00 08 30 	add    %bh,0x30080000(%rdx,%rax,1)
ffff800000112d9a:	ff                   	(bad)  
ffff800000112d9b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d9e:	00 00                	add    %al,(%rax)
ffff800000112da0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112da3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112da9:	00 00                	add    %al,(%rax)
ffff800000112dab:	00 18                	add    %bl,(%rax)
ffff800000112dad:	00 00                	add    %al,(%rax)
ffff800000112daf:	00 d8                	add    %bl,%al
ffff800000112db1:	02 00                	add    (%rax),%al
ffff800000112db3:	00 47 30             	add    %al,0x30(%rdi)
ffff800000112db6:	ff                   	(bad)  
ffff800000112db7:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112dba:	00 00                	add    %al,(%rax)
ffff800000112dbc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112dbf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112dc5:	00 00                	add    %al,(%rax)
ffff800000112dc7:	00 18                	add    %bl,(%rax)
ffff800000112dc9:	00 00                	add    %al,(%rax)
ffff800000112dcb:	00 f4                	add    %dh,%ah
ffff800000112dcd:	02 00                	add    (%rax),%al
ffff800000112dcf:	00 86 30 ff ff 7a    	add    %al,0x7affff30(%rsi)
ffff800000112dd5:	01 00                	add    %eax,(%rax)
ffff800000112dd7:	00 00                	add    %al,(%rax)
ffff800000112dd9:	41 0e                	rex.B (bad) 
ffff800000112ddb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112de1:	00 00                	add    %al,(%rax)
ffff800000112de3:	00 18                	add    %bl,(%rax)
ffff800000112de5:	00 00                	add    %al,(%rax)
ffff800000112de7:	00 10                	add    %dl,(%rax)
ffff800000112de9:	03 00                	add    (%rax),%eax
ffff800000112deb:	00 e4                	add    %ah,%ah
ffff800000112ded:	31 ff                	xor    %edi,%edi
ffff800000112def:	ff                   	(bad)  
ffff800000112df0:	7a 01                	jp     ffff800000112df3 <_erodata+0x31c>
ffff800000112df2:	00 00                	add    %al,(%rax)
ffff800000112df4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112df7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112dfd:	00 00                	add    %al,(%rax)
ffff800000112dff:	00 18                	add    %bl,(%rax)
ffff800000112e01:	00 00                	add    %al,(%rax)
ffff800000112e03:	00 2c 03             	add    %ch,(%rbx,%rax,1)
ffff800000112e06:	00 00                	add    %al,(%rax)
ffff800000112e08:	42 33 ff             	rex.X xor %edi,%edi
ffff800000112e0b:	ff                   	(bad)  
ffff800000112e0c:	7a 01                	jp     ffff800000112e0f <_erodata+0x338>
ffff800000112e0e:	00 00                	add    %al,(%rax)
ffff800000112e10:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e19:	00 00                	add    %al,(%rax)
ffff800000112e1b:	00 18                	add    %bl,(%rax)
ffff800000112e1d:	00 00                	add    %al,(%rax)
ffff800000112e1f:	00 48 03             	add    %cl,0x3(%rax)
ffff800000112e22:	00 00                	add    %al,(%rax)
ffff800000112e24:	a0 34 ff ff 7a 01 00 	movabs 0x17affff34,%al
ffff800000112e2b:	00 00 
ffff800000112e2d:	41 0e                	rex.B (bad) 
ffff800000112e2f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e35:	00 00                	add    %al,(%rax)
ffff800000112e37:	00 18                	add    %bl,(%rax)
ffff800000112e39:	00 00                	add    %al,(%rax)
ffff800000112e3b:	00 64 03 00          	add    %ah,0x0(%rbx,%rax,1)
ffff800000112e3f:	00 fe                	add    %bh,%dh
ffff800000112e41:	35 ff ff ff 01       	xor    $0x1ffffff,%eax
ffff800000112e46:	00 00                	add    %al,(%rax)
ffff800000112e48:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e51:	00 00                	add    %al,(%rax)
ffff800000112e53:	00 18                	add    %bl,(%rax)
ffff800000112e55:	00 00                	add    %al,(%rax)
ffff800000112e57:	00 80 03 00 00 e1    	add    %al,-0x1efffffd(%rax)
ffff800000112e5d:	37                   	(bad)  
ffff800000112e5e:	ff                   	(bad)  
ffff800000112e5f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112e62:	00 00                	add    %al,(%rax)
ffff800000112e64:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e67:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e6d:	00 00                	add    %al,(%rax)
ffff800000112e6f:	00 18                	add    %bl,(%rax)
ffff800000112e71:	00 00                	add    %al,(%rax)
ffff800000112e73:	00 9c 03 00 00 20 38 	add    %bl,0x38200000(%rbx,%rax,1)
ffff800000112e7a:	ff                   	(bad)  
ffff800000112e7b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112e7e:	00 00                	add    %al,(%rax)
ffff800000112e80:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e89:	00 00                	add    %al,(%rax)
ffff800000112e8b:	00 18                	add    %bl,(%rax)
ffff800000112e8d:	00 00                	add    %al,(%rax)
ffff800000112e8f:	00 b8 03 00 00 5f    	add    %bh,0x5f000003(%rax)
ffff800000112e95:	38 ff                	cmp    %bh,%bh
ffff800000112e97:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112e9a:	00 00                	add    %al,(%rax)
ffff800000112e9c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e9f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ea5:	00 00                	add    %al,(%rax)
ffff800000112ea7:	00 18                	add    %bl,(%rax)
ffff800000112ea9:	00 00                	add    %al,(%rax)
ffff800000112eab:	00 d4                	add    %dl,%ah
ffff800000112ead:	03 00                	add    (%rax),%eax
ffff800000112eaf:	00 9e 38 ff ff 5b    	add    %bl,0x5bffff38(%rsi)
ffff800000112eb5:	00 00                	add    %al,(%rax)
ffff800000112eb7:	00 00                	add    %al,(%rax)
ffff800000112eb9:	41 0e                	rex.B (bad) 
ffff800000112ebb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ec1:	00 00                	add    %al,(%rax)
ffff800000112ec3:	00 18                	add    %bl,(%rax)
ffff800000112ec5:	00 00                	add    %al,(%rax)
ffff800000112ec7:	00 f0                	add    %dh,%al
ffff800000112ec9:	03 00                	add    (%rax),%eax
ffff800000112ecb:	00 dd                	add    %bl,%ch
ffff800000112ecd:	38 ff                	cmp    %bh,%bh
ffff800000112ecf:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112ed2:	00 00                	add    %al,(%rax)
ffff800000112ed4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112ed7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112edd:	00 00                	add    %al,(%rax)
ffff800000112edf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112ee2:	00 00                	add    %al,(%rax)
ffff800000112ee4:	0c 04                	or     $0x4,%al
ffff800000112ee6:	00 00                	add    %al,(%rax)
ffff800000112ee8:	1c 39                	sbb    $0x39,%al
ffff800000112eea:	ff                   	(bad)  
ffff800000112eeb:	ff 87 02 00 00 00    	incl   0x2(%rdi)
ffff800000112ef1:	41 0e                	rex.B (bad) 
ffff800000112ef3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ef9:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
ffff800000112eff:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f02:	00 00                	add    %al,(%rax)
ffff800000112f04:	2c 04                	sub    $0x4,%al
ffff800000112f06:	00 00                	add    %al,(%rax)
ffff800000112f08:	83 3b ff             	cmpl   $0xffffffff,(%rbx)
ffff800000112f0b:	ff 76 00             	pushq  0x0(%rsi)
ffff800000112f0e:	00 00                	add    %al,(%rax)
ffff800000112f10:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112f13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f19:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112f1c:	07                   	(bad)  
ffff800000112f1d:	08 00                	or     %al,(%rax)
ffff800000112f1f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f22:	00 00                	add    %al,(%rax)
ffff800000112f24:	4c 04 00             	rex.WR add $0x0,%al
ffff800000112f27:	00 d9                	add    %bl,%cl
ffff800000112f29:	3b ff                	cmp    %edi,%edi
ffff800000112f2b:	ff 11                	callq  *(%rcx)
ffff800000112f2d:	00 00                	add    %al,(%rax)
ffff800000112f2f:	00 00                	add    %al,(%rax)
ffff800000112f31:	41 0e                	rex.B (bad) 
ffff800000112f33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f39:	4c 0c 07             	rex.WR or $0x7,%al
ffff800000112f3c:	08 00                	or     %al,(%rax)
ffff800000112f3e:	00 00                	add    %al,(%rax)
ffff800000112f40:	1c 00                	sbb    $0x0,%al
ffff800000112f42:	00 00                	add    %al,(%rax)
ffff800000112f44:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f45:	04 00                	add    $0x0,%al
ffff800000112f47:	00 ca                	add    %cl,%dl
ffff800000112f49:	3b ff                	cmp    %edi,%edi
ffff800000112f4b:	ff                   	(bad)  
ffff800000112f4c:	ec                   	in     (%dx),%al
ffff800000112f4d:	01 00                	add    %eax,(%rax)
ffff800000112f4f:	00 00                	add    %al,(%rax)
ffff800000112f51:	41 0e                	rex.B (bad) 
ffff800000112f53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f59:	03 e7                	add    %edi,%esp
ffff800000112f5b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000112f5e:	08 00                	or     %al,(%rax)
ffff800000112f60:	1c 00                	sbb    $0x0,%al
ffff800000112f62:	00 00                	add    %al,(%rax)
ffff800000112f64:	8c 04 00             	mov    %es,(%rax,%rax,1)
ffff800000112f67:	00 96 3d ff ff 82    	add    %dl,-0x7d0000c3(%rsi)
ffff800000112f6d:	01 00                	add    %eax,(%rax)
ffff800000112f6f:	00 00                	add    %al,(%rax)
ffff800000112f71:	41 0e                	rex.B (bad) 
ffff800000112f73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f79:	03 7d 01             	add    0x1(%rbp),%edi
ffff800000112f7c:	0c 07                	or     $0x7,%al
ffff800000112f7e:	08 00                	or     %al,(%rax)
ffff800000112f80:	1c 00                	sbb    $0x0,%al
ffff800000112f82:	00 00                	add    %al,(%rax)
ffff800000112f84:	ac                   	lods   %ds:(%rsi),%al
ffff800000112f85:	04 00                	add    $0x0,%al
ffff800000112f87:	00 f8                	add    %bh,%al
ffff800000112f89:	3e ff                	ds (bad) 
ffff800000112f8b:	ff 9e 0d 00 00 00    	lcall  *0xd(%rsi)
ffff800000112f91:	41 0e                	rex.B (bad) 
ffff800000112f93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f99:	03 99 0d 0c 07 08    	add    0x8070c0d(%rcx),%ebx
ffff800000112f9f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112fa2:	00 00                	add    %al,(%rax)
ffff800000112fa4:	cc                   	int3   
ffff800000112fa5:	04 00                	add    $0x0,%al
ffff800000112fa7:	00 76 4c             	add    %dh,0x4c(%rsi)
ffff800000112faa:	ff                   	(bad)  
ffff800000112fab:	ff 32                	pushq  (%rdx)
ffff800000112fad:	03 00                	add    (%rax),%eax
ffff800000112faf:	00 00                	add    %al,(%rax)
ffff800000112fb1:	41 0e                	rex.B (bad) 
ffff800000112fb3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fb9:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # ffff800008183bc2 <_ebss+0x8055692>
ffff800000112fbf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112fc2:	00 00                	add    %al,(%rax)
ffff800000112fc4:	ec                   	in     (%dx),%al
ffff800000112fc5:	04 00                	add    $0x0,%al
ffff800000112fc7:	00 88 4f ff ff 21    	add    %cl,0x21ffff4f(%rax)
ffff800000112fcd:	00 00                	add    %al,(%rax)
ffff800000112fcf:	00 00                	add    %al,(%rax)
ffff800000112fd1:	41 0e                	rex.B (bad) 
ffff800000112fd3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fd9:	5c                   	pop    %rsp
ffff800000112fda:	0c 07                	or     $0x7,%al
ffff800000112fdc:	08 00                	or     %al,(%rax)
ffff800000112fde:	00 00                	add    %al,(%rax)
ffff800000112fe0:	1c 00                	sbb    $0x0,%al
ffff800000112fe2:	00 00                	add    %al,(%rax)
ffff800000112fe4:	0c 05                	or     $0x5,%al
ffff800000112fe6:	00 00                	add    %al,(%rax)
ffff800000112fe8:	89 4f ff             	mov    %ecx,-0x1(%rdi)
ffff800000112feb:	ff 20                	jmpq   *(%rax)
ffff800000112fed:	00 00                	add    %al,(%rax)
ffff800000112fef:	00 00                	add    %al,(%rax)
ffff800000112ff1:	41 0e                	rex.B (bad) 
ffff800000112ff3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ff9:	5b                   	pop    %rbx
ffff800000112ffa:	0c 07                	or     $0x7,%al
ffff800000112ffc:	08 00                	or     %al,(%rax)
ffff800000112ffe:	00 00                	add    %al,(%rax)
ffff800000113000:	1c 00                	sbb    $0x0,%al
ffff800000113002:	00 00                	add    %al,(%rax)
ffff800000113004:	2c 05                	sub    $0x5,%al
ffff800000113006:	00 00                	add    %al,(%rax)
ffff800000113008:	89 4f ff             	mov    %ecx,-0x1(%rdi)
ffff80000011300b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000113011:	41 0e                	rex.B (bad) 
ffff800000113013:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113019:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff80000011301f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113022:	00 00                	add    %al,(%rax)
ffff800000113024:	4c 05 00 00 f8 4f    	rex.WR add $0x4ff80000,%rax
ffff80000011302a:	ff                   	(bad)  
ffff80000011302b:	ff c9                	dec    %ecx
ffff80000011302d:	00 00                	add    %al,(%rax)
ffff80000011302f:	00 00                	add    %al,(%rax)
ffff800000113031:	41 0e                	rex.B (bad) 
ffff800000113033:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113039:	02 c4                	add    %ah,%al
ffff80000011303b:	0c 07                	or     $0x7,%al
ffff80000011303d:	08 00                	or     %al,(%rax)
ffff80000011303f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113042:	00 00                	add    %al,(%rax)
ffff800000113044:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113045:	05 00 00 91 57       	add    $0x57910000,%eax
ffff80000011304a:	ff                   	(bad)  
ffff80000011304b:	ff 4c 01 00          	decl   0x0(%rcx,%rax,1)
ffff80000011304f:	00 00                	add    %al,(%rax)
ffff800000113051:	41 0e                	rex.B (bad) 
ffff800000113053:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113059:	03 47 01             	add    0x1(%rdi),%eax
ffff80000011305c:	0c 07                	or     $0x7,%al
ffff80000011305e:	08 00                	or     %al,(%rax)
ffff800000113060:	1c 00                	sbb    $0x0,%al
ffff800000113062:	00 00                	add    %al,(%rax)
ffff800000113064:	8c 05 00 00 bd 58    	mov    %es,0x58bd0000(%rip)        # ffff800058ce306a <_ebss+0x58bb4b3a>
ffff80000011306a:	ff                   	(bad)  
ffff80000011306b:	ff                   	(bad)  
ffff80000011306c:	df 00                	filds  (%rax)
ffff80000011306e:	00 00                	add    %al,(%rax)
ffff800000113070:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113073:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113079:	02 da                	add    %dl,%bl
ffff80000011307b:	0c 07                	or     $0x7,%al
ffff80000011307d:	08 00                	or     %al,(%rax)
ffff80000011307f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113082:	00 00                	add    %al,(%rax)
ffff800000113084:	ac                   	lods   %ds:(%rsi),%al
ffff800000113085:	05 00 00 7c 59       	add    $0x597c0000,%eax
ffff80000011308a:	ff                   	(bad)  
ffff80000011308b:	ff 22                	jmpq   *(%rdx)
ffff80000011308d:	00 00                	add    %al,(%rax)
ffff80000011308f:	00 00                	add    %al,(%rax)
ffff800000113091:	41 0e                	rex.B (bad) 
ffff800000113093:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113099:	5d                   	pop    %rbp
ffff80000011309a:	0c 07                	or     $0x7,%al
ffff80000011309c:	08 00                	or     %al,(%rax)
ffff80000011309e:	00 00                	add    %al,(%rax)
ffff8000001130a0:	1c 00                	sbb    $0x0,%al
ffff8000001130a2:	00 00                	add    %al,(%rax)
ffff8000001130a4:	cc                   	int3   
ffff8000001130a5:	05 00 00 7e 59       	add    $0x597e0000,%eax
ffff8000001130aa:	ff                   	(bad)  
ffff8000001130ab:	ff 43 00             	incl   0x0(%rbx)
ffff8000001130ae:	00 00                	add    %al,(%rax)
ffff8000001130b0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001130b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130b9:	7e 0c                	jle    ffff8000001130c7 <_erodata+0x5f0>
ffff8000001130bb:	07                   	(bad)  
ffff8000001130bc:	08 00                	or     %al,(%rax)
ffff8000001130be:	00 00                	add    %al,(%rax)
ffff8000001130c0:	1c 00                	sbb    $0x0,%al
ffff8000001130c2:	00 00                	add    %al,(%rax)
ffff8000001130c4:	ec                   	in     (%dx),%al
ffff8000001130c5:	05 00 00 a1 59       	add    $0x59a10000,%eax
ffff8000001130ca:	ff                   	(bad)  
ffff8000001130cb:	ff 26                	jmpq   *(%rsi)
ffff8000001130cd:	00 00                	add    %al,(%rax)
ffff8000001130cf:	00 00                	add    %al,(%rax)
ffff8000001130d1:	41 0e                	rex.B (bad) 
ffff8000001130d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130d9:	61                   	(bad)  
ffff8000001130da:	0c 07                	or     $0x7,%al
ffff8000001130dc:	08 00                	or     %al,(%rax)
ffff8000001130de:	00 00                	add    %al,(%rax)
ffff8000001130e0:	1c 00                	sbb    $0x0,%al
ffff8000001130e2:	00 00                	add    %al,(%rax)
ffff8000001130e4:	0c 06                	or     $0x6,%al
ffff8000001130e6:	00 00                	add    %al,(%rax)
ffff8000001130e8:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
ffff8000001130e9:	59                   	pop    %rcx
ffff8000001130ea:	ff                   	(bad)  
ffff8000001130eb:	ff 5a 00             	lcall  *0x0(%rdx)
ffff8000001130ee:	00 00                	add    %al,(%rax)
ffff8000001130f0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001130f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130f9:	02 55 0c             	add    0xc(%rbp),%dl
ffff8000001130fc:	07                   	(bad)  
ffff8000001130fd:	08 00                	or     %al,(%rax)
ffff8000001130ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113102:	00 00                	add    %al,(%rax)
ffff800000113104:	2c 06                	sub    $0x6,%al
ffff800000113106:	00 00                	add    %al,(%rax)
ffff800000113108:	e1 59                	loope  ffff800000113163 <_erodata+0x68c>
ffff80000011310a:	ff                   	(bad)  
ffff80000011310b:	ff 76 00             	pushq  0x0(%rsi)
ffff80000011310e:	00 00                	add    %al,(%rax)
ffff800000113110:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113113:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113119:	02 71 0c             	add    0xc(%rcx),%dh
ffff80000011311c:	07                   	(bad)  
ffff80000011311d:	08 00                	or     %al,(%rax)
ffff80000011311f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113122:	00 00                	add    %al,(%rax)
ffff800000113124:	4c 06                	rex.WR (bad) 
ffff800000113126:	00 00                	add    %al,(%rax)
ffff800000113128:	37                   	(bad)  
ffff800000113129:	5a                   	pop    %rdx
ffff80000011312a:	ff                   	(bad)  
ffff80000011312b:	ff 26                	jmpq   *(%rsi)
ffff80000011312d:	00 00                	add    %al,(%rax)
ffff80000011312f:	00 00                	add    %al,(%rax)
ffff800000113131:	41 0e                	rex.B (bad) 
ffff800000113133:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113139:	61                   	(bad)  
ffff80000011313a:	0c 07                	or     $0x7,%al
ffff80000011313c:	08 00                	or     %al,(%rax)
ffff80000011313e:	00 00                	add    %al,(%rax)
ffff800000113140:	1c 00                	sbb    $0x0,%al
ffff800000113142:	00 00                	add    %al,(%rax)
ffff800000113144:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113145:	06                   	(bad)  
ffff800000113146:	00 00                	add    %al,(%rax)
ffff800000113148:	3d 5a ff ff 20       	cmp    $0x20ffff5a,%eax
ffff80000011314d:	00 00                	add    %al,(%rax)
ffff80000011314f:	00 00                	add    %al,(%rax)
ffff800000113151:	41 0e                	rex.B (bad) 
ffff800000113153:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113159:	5b                   	pop    %rbx
ffff80000011315a:	0c 07                	or     $0x7,%al
ffff80000011315c:	08 00                	or     %al,(%rax)
ffff80000011315e:	00 00                	add    %al,(%rax)
ffff800000113160:	1c 00                	sbb    $0x0,%al
ffff800000113162:	00 00                	add    %al,(%rax)
ffff800000113164:	8c 06                	mov    %es,(%rsi)
ffff800000113166:	00 00                	add    %al,(%rax)
ffff800000113168:	3d 5a ff ff 49       	cmp    $0x49ffff5a,%eax
ffff80000011316d:	00 00                	add    %al,(%rax)
ffff80000011316f:	00 00                	add    %al,(%rax)
ffff800000113171:	41 0e                	rex.B (bad) 
ffff800000113173:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113179:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff80000011317d:	08 00                	or     %al,(%rax)
ffff80000011317f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113182:	00 00                	add    %al,(%rax)
ffff800000113184:	ac                   	lods   %ds:(%rsi),%al
ffff800000113185:	06                   	(bad)  
ffff800000113186:	00 00                	add    %al,(%rax)
ffff800000113188:	66 5a                	pop    %dx
ffff80000011318a:	ff                   	(bad)  
ffff80000011318b:	ff                   	(bad)  
ffff80000011318c:	39 00                	cmp    %eax,(%rax)
ffff80000011318e:	00 00                	add    %al,(%rax)
ffff800000113190:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113193:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113199:	74 0c                	je     ffff8000001131a7 <_erodata+0x6d0>
ffff80000011319b:	07                   	(bad)  
ffff80000011319c:	08 00                	or     %al,(%rax)
ffff80000011319e:	00 00                	add    %al,(%rax)
ffff8000001131a0:	1c 00                	sbb    $0x0,%al
ffff8000001131a2:	00 00                	add    %al,(%rax)
ffff8000001131a4:	cc                   	int3   
ffff8000001131a5:	06                   	(bad)  
ffff8000001131a6:	00 00                	add    %al,(%rax)
ffff8000001131a8:	7f 5a                	jg     ffff800000113204 <_erodata+0x72d>
ffff8000001131aa:	ff                   	(bad)  
ffff8000001131ab:	ff c9                	dec    %ecx
ffff8000001131ad:	00 00                	add    %al,(%rax)
ffff8000001131af:	00 00                	add    %al,(%rax)
ffff8000001131b1:	41 0e                	rex.B (bad) 
ffff8000001131b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001131b9:	02 c4                	add    %ah,%al
ffff8000001131bb:	0c 07                	or     $0x7,%al
ffff8000001131bd:	08 00                	or     %al,(%rax)
ffff8000001131bf:	00 18                	add    %bl,(%rax)
ffff8000001131c1:	00 00                	add    %al,(%rax)
ffff8000001131c3:	00 ec                	add    %ch,%ah
ffff8000001131c5:	06                   	(bad)  
ffff8000001131c6:	00 00                	add    %al,(%rax)
ffff8000001131c8:	28 5b ff             	sub    %bl,-0x1(%rbx)
ffff8000001131cb:	ff 51 00             	callq  *0x0(%rcx)
ffff8000001131ce:	00 00                	add    %al,(%rax)
ffff8000001131d0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001131d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001131d9:	00 00                	add    %al,(%rax)
ffff8000001131db:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001131de:	00 00                	add    %al,(%rax)
ffff8000001131e0:	08 07                	or     %al,(%rdi)
ffff8000001131e2:	00 00                	add    %al,(%rax)
ffff8000001131e4:	5d                   	pop    %rbp
ffff8000001131e5:	5b                   	pop    %rbx
ffff8000001131e6:	ff                   	(bad)  
ffff8000001131e7:	ff 97 00 00 00 00    	callq  *0x0(%rdi)
ffff8000001131ed:	41 0e                	rex.B (bad) 
ffff8000001131ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001131f5:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
ffff8000001131fb:	00 20                	add    %ah,(%rax)
ffff8000001131fd:	00 00                	add    %al,(%rax)
ffff8000001131ff:	00 28                	add    %ch,(%rax)
ffff800000113201:	07                   	(bad)  
ffff800000113202:	00 00                	add    %al,(%rax)
ffff800000113204:	d4                   	(bad)  
ffff800000113205:	5b                   	pop    %rbx
ffff800000113206:	ff                   	(bad)  
ffff800000113207:	ff f6                	push   %rsi
ffff800000113209:	00 00                	add    %al,(%rax)
ffff80000011320b:	00 00                	add    %al,(%rax)
ffff80000011320d:	41 0e                	rex.B (bad) 
ffff80000011320f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113215:	45 83 03 02          	rex.RB addl $0x2,(%r11)
ffff800000113219:	ec                   	in     (%dx),%al
ffff80000011321a:	0c 07                	or     $0x7,%al
ffff80000011321c:	08 00                	or     %al,(%rax)
ffff80000011321e:	00 00                	add    %al,(%rax)
ffff800000113220:	20 00                	and    %al,(%rax)
ffff800000113222:	00 00                	add    %al,(%rax)
ffff800000113224:	4c 07                	rex.WR (bad) 
ffff800000113226:	00 00                	add    %al,(%rax)
ffff800000113228:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
ffff800000113229:	5c                   	pop    %rsp
ffff80000011322a:	ff                   	(bad)  
ffff80000011322b:	ff 73 03             	pushq  0x3(%rbx)
ffff80000011322e:	00 00                	add    %al,(%rax)
ffff800000113230:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113233:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113239:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000011323d:	69 03 0c 07 08 00    	imul   $0x8070c,(%rbx),%eax
ffff800000113243:	00 18                	add    %bl,(%rax)
ffff800000113245:	00 00                	add    %al,(%rax)
ffff800000113247:	00 70 07             	add    %dh,0x7(%rax)
ffff80000011324a:	00 00                	add    %al,(%rax)
ffff80000011324c:	f5                   	cmc    
ffff80000011324d:	5f                   	pop    %rdi
ffff80000011324e:	ff                   	(bad)  
ffff80000011324f:	ff                   	(bad)  
ffff800000113250:	3b 00                	cmp    (%rax),%eax
ffff800000113252:	00 00                	add    %al,(%rax)
ffff800000113254:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113257:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011325d:	00 00                	add    %al,(%rax)
ffff80000011325f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113262:	00 00                	add    %al,(%rax)
ffff800000113264:	8c 07                	mov    %es,(%rdi)
ffff800000113266:	00 00                	add    %al,(%rax)
ffff800000113268:	14 60                	adc    $0x60,%al
ffff80000011326a:	ff                   	(bad)  
ffff80000011326b:	ff 30                	pushq  (%rax)
ffff80000011326d:	00 00                	add    %al,(%rax)
ffff80000011326f:	00 00                	add    %al,(%rax)
ffff800000113271:	41 0e                	rex.B (bad) 
ffff800000113273:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113279:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
ffff80000011327d:	00 00                	add    %al,(%rax)
ffff80000011327f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113282:	00 00                	add    %al,(%rax)
ffff800000113284:	ac                   	lods   %ds:(%rsi),%al
ffff800000113285:	07                   	(bad)  
ffff800000113286:	00 00                	add    %al,(%rax)
ffff800000113288:	54                   	push   %rsp
ffff800000113289:	60                   	(bad)  
ffff80000011328a:	ff                   	(bad)  
ffff80000011328b:	ff b5 00 00 00 00    	pushq  0x0(%rbp)
ffff800000113291:	41 0e                	rex.B (bad) 
ffff800000113293:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113299:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
ffff80000011329f:	00 20                	add    %ah,(%rax)
ffff8000001132a1:	00 00                	add    %al,(%rax)
ffff8000001132a3:	00 cc                	add    %cl,%ah
ffff8000001132a5:	07                   	(bad)  
ffff8000001132a6:	00 00                	add    %al,(%rax)
ffff8000001132a8:	e9 60 ff ff 7f       	jmpq   ffff80008011320d <_ebss+0x7ffe4cdd>
ffff8000001132ad:	02 00                	add    (%rax),%al
ffff8000001132af:	00 00                	add    %al,(%rax)
ffff8000001132b1:	41 0e                	rex.B (bad) 
ffff8000001132b3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001132b9:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff8000001132bd:	75 02                	jne    ffff8000001132c1 <_erodata+0x7ea>
ffff8000001132bf:	0c 07                	or     $0x7,%al
ffff8000001132c1:	08 00                	or     %al,(%rax)
ffff8000001132c3:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff8000001132c6:	00 00                	add    %al,(%rax)
ffff8000001132c8:	f0 07                	lock (bad) 
ffff8000001132ca:	00 00                	add    %al,(%rax)
ffff8000001132cc:	44 63 ff             	movsxd %edi,%r15d
ffff8000001132cf:	ff 43 03             	incl   0x3(%rbx)
ffff8000001132d2:	00 00                	add    %al,(%rax)
ffff8000001132d4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001132d7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001132dd:	4b 8e 03             	rex.WXB mov (%r11),%es
ffff8000001132e0:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
ffff8000001132e3:	05 83 06 03 33       	add    $0x33030683,%eax
ffff8000001132e8:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff8000001132eb:	08                   	.byte 0x8

Disassembly of section .data.init_task:

ffff800000118000 <init_task_union>:
	...
ffff800000118010:	04 00                	add    $0x0,%al
ffff800000118012:	00 00                	add    %al,(%rax)
ffff800000118014:	00 00                	add    %al,(%rax)
ffff800000118016:	00 00                	add    %al,(%rax)
ffff800000118018:	01 00                	add    %eax,(%rax)
ffff80000011801a:	00 00                	add    %al,(%rax)
ffff80000011801c:	00 00                	add    %al,(%rax)
ffff80000011801e:	00 00                	add    %al,(%rax)
ffff800000118020:	40 90                	rex xchg %eax,%eax
ffff800000118022:	12 00                	adc    (%rax),%al
ffff800000118024:	00 80 ff ff 80 ba    	add    %al,-0x457f0001(%rax)
ffff80000011802a:	10 00                	adc    %al,(%rax)
ffff80000011802c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000118032:	00 00                	add    %al,(%rax)
ffff800000118034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011803a:	00 00                	add    %al,(%rax)
ffff80000011803c:	00 00                	add    %al,(%rax)
ffff80000011803e:	00 00                	add    %al,(%rax)
ffff800000118040:	01 00                	add    %eax,(%rax)
	...
ffff80000012000e:	00 00                	add    %al,(%rax)
ffff800000120010:	04 00                	add    $0x0,%al
ffff800000120012:	00 00                	add    %al,(%rax)
ffff800000120014:	00 00                	add    %al,(%rax)
ffff800000120016:	00 00                	add    %al,(%rax)
ffff800000120018:	01 00                	add    %eax,(%rax)
ffff80000012001a:	00 00                	add    %al,(%rax)
ffff80000012001c:	00 00                	add    %al,(%rax)
ffff80000012001e:	00 00                	add    %al,(%rax)
ffff800000120020:	40 90                	rex xchg %eax,%eax
ffff800000120022:	12 00                	adc    (%rax),%al
ffff800000120024:	00 80 ff ff 80 ba    	add    %al,-0x457f0001(%rax)
ffff80000012002a:	10 00                	adc    %al,(%rax)
ffff80000012002c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000120032:	00 00                	add    %al,(%rax)
ffff800000120034:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000012003a:	00 00                	add    %al,(%rax)
ffff80000012003c:	00 00                	add    %al,(%rax)
ffff80000012003e:	00 00                	add    %al,(%rax)
ffff800000120040:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .bss:

ffff800000128000 <buf>:
	...

ffff800000129000 <Pos>:
	...

ffff800000129028 <Global_CR3>:
	...

ffff800000129030 <ZONE_DMA_INDEX>:
ffff800000129030:	00 00                	add    %al,(%rax)
	...

ffff800000129034 <ZONE_NORMAL_INDEX>:
ffff800000129034:	00 00                	add    %al,(%rax)
	...

ffff800000129038 <ZONE_UNMAPED_INDEX>:
	...

ffff800000129040 <init_mm>:
	...

ffff8000001290a0 <memory_management_struct>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 47 4e             	sub    %al,0x4e(%rdi)
   8:	55                   	push   %rbp
   9:	29 20                	sub    %esp,(%rax)
   b:	31 30                	xor    %esi,(%rax)
   d:	2e 32 2e             	xor    %cs:(%rsi),%ch
  10:	30 00                	xor    %al,(%rax)
