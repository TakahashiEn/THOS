
system.o:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100004:	8e d8                	mov    %eax,%ds
ffff800000100006:	8e c0                	mov    %eax,%es
ffff800000100008:	8e e0                	mov    %eax,%fs
ffff80000010000a:	8e d0                	mov    %eax,%ss
ffff80000010000c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
ffff800000100011:	0f 01 15 a0 98 00 00 	lgdt   0x98a0(%rip)        # ffff8000001098b8 <GDT_END>
ffff800000100018:	0f 01 1d a3 a8 00 00 	lidt   0xa8a3(%rip)        # ffff80000010a8c2 <IDT_END>
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
ffff80000010009a:	48 8d 3d 21 98 00 00 	lea    0x9821(%rip),%rdi        # ffff8000001098c2 <IDT_Table>
ffff8000001000a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff8000001000a8 <rp_sidt>:
ffff8000001000a8:	48 89 07             	mov    %rax,(%rdi)
ffff8000001000ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff8000001000af:	48 83 c7 10          	add    $0x10,%rdi
ffff8000001000b3:	48 ff c9             	dec    %rcx
ffff8000001000b6:	75 f0                	jne    ffff8000001000a8 <rp_sidt>

ffff8000001000b8 <setup_TSS64>:
ffff8000001000b8:	48 8d 15 0d a8 00 00 	lea    0xa80d(%rip),%rdx        # ffff80000010a8cc <TSS64_Table>
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
ffff8000001000f2:	48 8d 3d 27 97 00 00 	lea    0x9727(%rip),%rdi        # ffff800000109820 <GDT_Table>
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
ffff80000010405f:	e8 e1 51 00 00       	callq  ffff800000109245 <system_call_function>

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
ffff800000104291:	48 ba d0 a8 10 00 00 	movabs $0xffff80000010a8d0,%rdx
ffff800000104298:	80 ff ff 
ffff80000010429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010429f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042a2:	48 ba d8 a8 10 00 00 	movabs $0xffff80000010a8d8,%rdx
ffff8000001042a9:	80 ff ff 
ffff8000001042ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042b3:	48 ba e0 a8 10 00 00 	movabs $0xffff80000010a8e0,%rdx
ffff8000001042ba:	80 ff ff 
ffff8000001042bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001042c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042c4:	48 ba f0 a8 10 00 00 	movabs $0xffff80000010a8f0,%rdx
ffff8000001042cb:	80 ff ff 
ffff8000001042ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001042d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042d5:	48 ba f8 a8 10 00 00 	movabs $0xffff80000010a8f8,%rdx
ffff8000001042dc:	80 ff ff 
ffff8000001042df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042e6:	48 ba 00 a9 10 00 00 	movabs $0xffff80000010a900,%rdx
ffff8000001042ed:	80 ff ff 
ffff8000001042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001042f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042f7:	48 ba 08 a9 10 00 00 	movabs $0xffff80000010a908,%rdx
ffff8000001042fe:	80 ff ff 
ffff800000104301:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000104305:	48 89 02             	mov    %rax,(%rdx)
ffff800000104308:	48 ba 10 a9 10 00 00 	movabs $0xffff80000010a910,%rdx
ffff80000010430f:	80 ff ff 
ffff800000104312:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000104316:	48 89 02             	mov    %rax,(%rdx)
ffff800000104319:	48 ba 18 a9 10 00 00 	movabs $0xffff80000010a918,%rdx
ffff800000104320:	80 ff ff 
ffff800000104323:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000104327:	48 89 02             	mov    %rax,(%rdx)
ffff80000010432a:	48 ba 20 a9 10 00 00 	movabs $0xffff80000010a920,%rdx
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
ffff800000104358:	48 ba 80 19 11 00 00 	movabs $0xffff800000111980,%rdx
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
ffff8000001043e0:	c7 00 a0 05 00 00    	movl   $0x5a0,(%rax)
ffff8000001043e6:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001043ed:	80 ff ff 
ffff8000001043f0:	c7 40 04 84 03 00 00 	movl   $0x384,0x4(%rax)
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
ffff800000104547:	48 ba 1e 98 10 00 00 	movabs $0xffff80000010981e,%rdx
ffff80000010454e:	80 ff ff 
ffff800000104551:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104558:	80 ff ff 
ffff80000010455b:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
ffff800000104562:	48 ba 80 19 11 00 00 	movabs $0xffff800000111980,%rdx
ffff800000104569:	80 ff ff 
ffff80000010456c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104573:	80 ff ff 
ffff800000104576:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
ffff80000010457d:	48 ba 30 e5 12 00 00 	movabs $0xffff80000012e530,%rdx
ffff800000104584:	80 ff ff 
ffff800000104587:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010458e:	80 ff ff 
ffff800000104591:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
ffff800000104598:	48 ba a4 19 11 00 00 	movabs $0xffff8000001119a4,%rdx
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
ffff8000001045ce:	48 ba b2 19 11 00 00 	movabs $0xffff8000001119b2,%rdx
ffff8000001045d5:	80 ff ff 
ffff8000001045d8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045dd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045e2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045e7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001045ee:	80 ff ff 
ffff8000001045f1:	ff d1                	callq  *%rcx
ffff8000001045f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045f8:	48 ba 72 88 10 00 00 	movabs $0xffff800000108872,%rdx
ffff8000001045ff:	80 ff ff 
ffff800000104602:	ff d2                	callq  *%rdx
ffff800000104604:	48 ba c3 19 11 00 00 	movabs $0xffff8000001119c3,%rdx
ffff80000010460b:	80 ff ff 
ffff80000010460e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104613:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104618:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010461d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000104624:	80 ff ff 
ffff800000104627:	ff d1                	callq  *%rcx
ffff800000104629:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010462e:	48 ba db 94 10 00 00 	movabs $0xffff8000001094db,%rdx
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
ffff8000001046bc:	48 b8 40 a9 10 00 00 	movabs $0xffff80000010a940,%rax
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
ffff8000001047d4:	48 b8 d0 19 11 00 00 	movabs $0xffff8000001119d0,%rax
ffff8000001047db:	80 ff ff 
ffff8000001047de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047e2:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047e5:	83 e0 40             	and    $0x40,%eax
ffff8000001047e8:	85 c0                	test   %eax,%eax
ffff8000001047ea:	74 0e                	je     ffff8000001047fa <number+0x40>
ffff8000001047ec:	48 b8 f8 19 11 00 00 	movabs $0xffff8000001119f8,%rax
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
ffff800000104aa5:	48 b8 20 1a 11 00 00 	movabs $0xffff800000111a20,%rax
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
ffff800000104c9e:	48 b8 a8 1a 11 00 00 	movabs $0xffff800000111aa8,%rax
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
ffff80000010586c:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
ffff800000105873:	80 ff ff 
ffff800000105876:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff80000010587a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010587d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105881:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105885:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
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
ffff8000001058fb:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
ffff800000105902:	80 ff ff 
ffff800000105905:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105909:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010590c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105910:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105914:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
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
ffff80000010598a:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
ffff800000105991:	80 ff ff 
ffff800000105994:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105998:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010599b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010599f:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001059a3:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
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
ffff800000105a1b:	48 ba d0 a8 10 00 00 	movabs $0xffff80000010a8d0,%rdx
ffff800000105a22:	80 ff ff 
ffff800000105a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105a29:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a2c:	48 ba d8 a8 10 00 00 	movabs $0xffff80000010a8d8,%rdx
ffff800000105a33:	80 ff ff 
ffff800000105a36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105a3a:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a3d:	48 ba e0 a8 10 00 00 	movabs $0xffff80000010a8e0,%rdx
ffff800000105a44:	80 ff ff 
ffff800000105a47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a4b:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a4e:	48 ba f0 a8 10 00 00 	movabs $0xffff80000010a8f0,%rdx
ffff800000105a55:	80 ff ff 
ffff800000105a58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105a5c:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a5f:	48 ba f8 a8 10 00 00 	movabs $0xffff80000010a8f8,%rdx
ffff800000105a66:	80 ff ff 
ffff800000105a69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105a6d:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a70:	48 ba 00 a9 10 00 00 	movabs $0xffff80000010a900,%rdx
ffff800000105a77:	80 ff ff 
ffff800000105a7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a7e:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a81:	48 ba 08 a9 10 00 00 	movabs $0xffff80000010a908,%rdx
ffff800000105a88:	80 ff ff 
ffff800000105a8b:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000105a8f:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a92:	48 ba 10 a9 10 00 00 	movabs $0xffff80000010a910,%rdx
ffff800000105a99:	80 ff ff 
ffff800000105a9c:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000105aa0:	48 89 02             	mov    %rax,(%rdx)
ffff800000105aa3:	48 ba 18 a9 10 00 00 	movabs $0xffff80000010a918,%rdx
ffff800000105aaa:	80 ff ff 
ffff800000105aad:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000105ab1:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ab4:	48 ba 20 a9 10 00 00 	movabs $0xffff80000010a920,%rdx
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
ffff800000105afb:	48 ba 48 1d 11 00 00 	movabs $0xffff800000111d48,%rdx
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
ffff800000105b56:	48 ba 88 1d 11 00 00 	movabs $0xffff800000111d88,%rdx
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
ffff800000105bb1:	48 ba c0 1d 11 00 00 	movabs $0xffff800000111dc0,%rdx
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
ffff800000105c0c:	48 ba f8 1d 11 00 00 	movabs $0xffff800000111df8,%rdx
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
ffff800000105c67:	48 ba 30 1e 11 00 00 	movabs $0xffff800000111e30,%rdx
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
ffff800000105cc2:	48 ba 70 1e 11 00 00 	movabs $0xffff800000111e70,%rdx
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
ffff800000105d1d:	48 ba b0 1e 11 00 00 	movabs $0xffff800000111eb0,%rdx
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
ffff800000105d78:	48 ba f8 1e 11 00 00 	movabs $0xffff800000111ef8,%rdx
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
ffff800000105dd3:	48 ba 40 1f 11 00 00 	movabs $0xffff800000111f40,%rdx
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
ffff800000105e2e:	48 ba 80 1f 11 00 00 	movabs $0xffff800000111f80,%rdx
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
ffff800000105e89:	48 ba d0 1f 11 00 00 	movabs $0xffff800000111fd0,%rdx
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
ffff800000105ebb:	48 ba 10 20 11 00 00 	movabs $0xffff800000112010,%rdx
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
ffff800000105eec:	48 ba 90 20 11 00 00 	movabs $0xffff800000112090,%rdx
ffff800000105ef3:	80 ff ff 
ffff800000105ef6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105efb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f05:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f0c:	80 ff ff 
ffff800000105f0f:	ff d1                	callq  *%rcx
ffff800000105f11:	eb 25                	jmp    ffff800000105f38 <do_invalid_TSS+0xe2>
ffff800000105f13:	48 ba c0 20 11 00 00 	movabs $0xffff8000001120c0,%rdx
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
ffff800000105f50:	48 ba f8 20 11 00 00 	movabs $0xffff8000001120f8,%rdx
ffff800000105f57:	80 ff ff 
ffff800000105f5a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f5f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f64:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f69:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f70:	80 ff ff 
ffff800000105f73:	ff d1                	callq  *%rcx
ffff800000105f75:	eb 25                	jmp    ffff800000105f9c <do_invalid_TSS+0x146>
ffff800000105f77:	48 ba 30 21 11 00 00 	movabs $0xffff800000112130,%rdx
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
ffff800000105fa8:	48 ba 60 21 11 00 00 	movabs $0xffff800000112160,%rdx
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
ffff800000106003:	48 ba 80 21 11 00 00 	movabs $0xffff800000112180,%rdx
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
ffff800000106035:	48 ba 10 20 11 00 00 	movabs $0xffff800000112010,%rdx
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
ffff800000106066:	48 ba 90 20 11 00 00 	movabs $0xffff800000112090,%rdx
ffff80000010606d:	80 ff ff 
ffff800000106070:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106075:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010607a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010607f:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106086:	80 ff ff 
ffff800000106089:	ff d1                	callq  *%rcx
ffff80000010608b:	eb 25                	jmp    ffff8000001060b2 <do_segment_not_present+0xe2>
ffff80000010608d:	48 ba c0 20 11 00 00 	movabs $0xffff8000001120c0,%rdx
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
ffff8000001060ca:	48 ba f8 20 11 00 00 	movabs $0xffff8000001120f8,%rdx
ffff8000001060d1:	80 ff ff 
ffff8000001060d4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060d9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060de:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060e3:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001060ea:	80 ff ff 
ffff8000001060ed:	ff d1                	callq  *%rcx
ffff8000001060ef:	eb 25                	jmp    ffff800000106116 <do_segment_not_present+0x146>
ffff8000001060f1:	48 ba 30 21 11 00 00 	movabs $0xffff800000112130,%rdx
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
ffff800000106122:	48 ba 60 21 11 00 00 	movabs $0xffff800000112160,%rdx
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
ffff80000010617d:	48 ba c8 21 11 00 00 	movabs $0xffff8000001121c8,%rdx
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
ffff8000001061af:	48 ba 10 20 11 00 00 	movabs $0xffff800000112010,%rdx
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
ffff8000001061e0:	48 ba 90 20 11 00 00 	movabs $0xffff800000112090,%rdx
ffff8000001061e7:	80 ff ff 
ffff8000001061ea:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061ef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061f9:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106200:	80 ff ff 
ffff800000106203:	ff d1                	callq  *%rcx
ffff800000106205:	eb 25                	jmp    ffff80000010622c <do_stack_segment_fault+0xe2>
ffff800000106207:	48 ba c0 20 11 00 00 	movabs $0xffff8000001120c0,%rdx
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
ffff800000106244:	48 ba f8 20 11 00 00 	movabs $0xffff8000001120f8,%rdx
ffff80000010624b:	80 ff ff 
ffff80000010624e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106253:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106258:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010625d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106264:	80 ff ff 
ffff800000106267:	ff d1                	callq  *%rcx
ffff800000106269:	eb 25                	jmp    ffff800000106290 <do_stack_segment_fault+0x146>
ffff80000010626b:	48 ba 30 21 11 00 00 	movabs $0xffff800000112130,%rdx
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
ffff80000010629c:	48 ba 60 21 11 00 00 	movabs $0xffff800000112160,%rdx
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
ffff8000001062f7:	48 ba 10 22 11 00 00 	movabs $0xffff800000112210,%rdx
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
ffff800000106329:	48 ba 10 20 11 00 00 	movabs $0xffff800000112010,%rdx
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
ffff80000010635a:	48 ba 90 20 11 00 00 	movabs $0xffff800000112090,%rdx
ffff800000106361:	80 ff ff 
ffff800000106364:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106369:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010636e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106373:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010637a:	80 ff ff 
ffff80000010637d:	ff d1                	callq  *%rcx
ffff80000010637f:	eb 25                	jmp    ffff8000001063a6 <do_general_protection+0xe2>
ffff800000106381:	48 ba c0 20 11 00 00 	movabs $0xffff8000001120c0,%rdx
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
ffff8000001063be:	48 ba f8 20 11 00 00 	movabs $0xffff8000001120f8,%rdx
ffff8000001063c5:	80 ff ff 
ffff8000001063c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063cd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063d7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001063de:	80 ff ff 
ffff8000001063e1:	ff d1                	callq  *%rcx
ffff8000001063e3:	eb 25                	jmp    ffff80000010640a <do_general_protection+0x146>
ffff8000001063e5:	48 ba 30 21 11 00 00 	movabs $0xffff800000112130,%rdx
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
ffff800000106416:	48 ba 60 21 11 00 00 	movabs $0xffff800000112160,%rdx
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
ffff800000106480:	48 ba 58 22 11 00 00 	movabs $0xffff800000112258,%rdx
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
ffff8000001064b2:	48 ba 96 22 11 00 00 	movabs $0xffff800000112296,%rdx
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
ffff8000001064e3:	48 ba a9 22 11 00 00 	movabs $0xffff8000001122a9,%rdx
ffff8000001064ea:	80 ff ff 
ffff8000001064ed:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064fc:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106503:	80 ff ff 
ffff800000106506:	ff d1                	callq  *%rcx
ffff800000106508:	eb 25                	jmp    ffff80000010652f <do_page_fault+0xf1>
ffff80000010650a:	48 ba bd 22 11 00 00 	movabs $0xffff8000001122bd,%rdx
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
ffff80000010653b:	48 ba d0 22 11 00 00 	movabs $0xffff8000001122d0,%rdx
ffff800000106542:	80 ff ff 
ffff800000106545:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010654a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010654f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106554:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010655b:	80 ff ff 
ffff80000010655e:	ff d1                	callq  *%rcx
ffff800000106560:	eb 25                	jmp    ffff800000106587 <do_page_fault+0x149>
ffff800000106562:	48 ba e2 22 11 00 00 	movabs $0xffff8000001122e2,%rdx
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
ffff800000106593:	48 ba fe 22 11 00 00 	movabs $0xffff8000001122fe,%rdx
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
ffff8000001065c4:	48 ba 20 23 11 00 00 	movabs $0xffff800000112320,%rdx
ffff8000001065cb:	80 ff ff 
ffff8000001065ce:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065d3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065dd:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001065e4:	80 ff ff 
ffff8000001065e7:	ff d1                	callq  *%rcx
ffff8000001065e9:	48 ba 3f 23 11 00 00 	movabs $0xffff80000011233f,%rdx
ffff8000001065f0:	80 ff ff 
ffff8000001065f3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065f8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065fd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106602:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106609:	80 ff ff 
ffff80000010660c:	ff d1                	callq  *%rcx
ffff80000010660e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106612:	48 89 c1             	mov    %rax,%rcx
ffff800000106615:	48 ba 41 23 11 00 00 	movabs $0xffff800000112341,%rdx
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
ffff800000106670:	48 ba 50 23 11 00 00 	movabs $0xffff800000112350,%rdx
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
ffff8000001066cb:	48 ba 98 23 11 00 00 	movabs $0xffff800000112398,%rdx
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
ffff800000106726:	48 ba e0 23 11 00 00 	movabs $0xffff8000001123e0,%rdx
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
ffff800000106781:	48 ba 28 24 11 00 00 	movabs $0xffff800000112428,%rdx
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
ffff8000001067dc:	48 ba 70 24 11 00 00 	movabs $0xffff800000112470,%rdx
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
ffff800000106e98:	48 ba c0 24 11 00 00 	movabs $0xffff8000001124c0,%rdx
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
ffff800000106ed2:	e9 85 01 00 00       	jmpq   ffff80000010705c <init_memory+0x1dc>
ffff800000106ed7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106edb:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106ede:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ee2:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106ee6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106eea:	48 8b 00             	mov    (%rax),%rax
ffff800000106eed:	41 89 c9             	mov    %ecx,%r9d
ffff800000106ef0:	49 89 d0             	mov    %rdx,%r8
ffff800000106ef3:	48 89 c1             	mov    %rax,%rcx
ffff800000106ef6:	48 ba 38 25 11 00 00 	movabs $0xffff800000112538,%rdx
ffff800000106efd:	80 ff ff 
ffff800000106f00:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106f05:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000106f0a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106f0f:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106f16:	80 ff ff 
ffff800000106f19:	41 ff d2             	callq  *%r10
ffff800000106f1c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000106f23:	00 
ffff800000106f24:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f28:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106f2b:	83 f8 01             	cmp    $0x1,%eax
ffff800000106f2e:	75 0c                	jne    ffff800000106f3c <init_memory+0xbc>
ffff800000106f30:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f34:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106f38:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff800000106f3c:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000106f43:	80 ff ff 
ffff800000106f46:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f49:	48 63 d0             	movslq %eax,%rdx
ffff800000106f4c:	48 89 d0             	mov    %rdx,%rax
ffff800000106f4f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f53:	48 01 d0             	add    %rdx,%rax
ffff800000106f56:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f5a:	48 01 c8             	add    %rcx,%rax
ffff800000106f5d:	48 8b 10             	mov    (%rax),%rdx
ffff800000106f60:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f64:	48 8b 00             	mov    (%rax),%rax
ffff800000106f67:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000106f6b:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f72:	80 ff ff 
ffff800000106f75:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f78:	48 63 d0             	movslq %eax,%rdx
ffff800000106f7b:	48 89 d0             	mov    %rdx,%rax
ffff800000106f7e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f82:	48 01 d0             	add    %rdx,%rax
ffff800000106f85:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f89:	48 01 f0             	add    %rsi,%rax
ffff800000106f8c:	48 89 08             	mov    %rcx,(%rax)
ffff800000106f8f:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000106f96:	80 ff ff 
ffff800000106f99:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f9c:	48 63 d0             	movslq %eax,%rdx
ffff800000106f9f:	48 89 d0             	mov    %rdx,%rax
ffff800000106fa2:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fa6:	48 01 d0             	add    %rdx,%rax
ffff800000106fa9:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fad:	48 01 c8             	add    %rcx,%rax
ffff800000106fb0:	48 83 c0 08          	add    $0x8,%rax
ffff800000106fb4:	48 8b 10             	mov    (%rax),%rdx
ffff800000106fb7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fbb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106fbf:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000106fc3:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106fca:	80 ff ff 
ffff800000106fcd:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106fd0:	48 63 d0             	movslq %eax,%rdx
ffff800000106fd3:	48 89 d0             	mov    %rdx,%rax
ffff800000106fd6:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fda:	48 01 d0             	add    %rdx,%rax
ffff800000106fdd:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fe1:	48 01 f0             	add    %rsi,%rax
ffff800000106fe4:	48 83 c0 08          	add    $0x8,%rax
ffff800000106fe8:	48 89 08             	mov    %rcx,(%rax)
ffff800000106feb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fef:	8b 50 10             	mov    0x10(%rax),%edx
ffff800000106ff2:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106ff9:	80 ff ff 
ffff800000106ffc:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106fff:	48 63 c8             	movslq %eax,%rcx
ffff800000107002:	48 89 c8             	mov    %rcx,%rax
ffff800000107005:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107009:	48 01 c8             	add    %rcx,%rax
ffff80000010700c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107010:	48 01 f0             	add    %rsi,%rax
ffff800000107013:	48 83 c0 10          	add    $0x10,%rax
ffff800000107017:	89 10                	mov    %edx,(%rax)
ffff800000107019:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010701c:	48 98                	cltq   
ffff80000010701e:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff800000107025:	80 ff ff 
ffff800000107028:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
ffff80000010702f:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
ffff800000107034:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107038:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010703b:	83 f8 04             	cmp    $0x4,%eax
ffff80000010703e:	77 26                	ja     ffff800000107066 <init_memory+0x1e6>
ffff800000107040:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107044:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107048:	48 85 c0             	test   %rax,%rax
ffff80000010704b:	74 19                	je     ffff800000107066 <init_memory+0x1e6>
ffff80000010704d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107051:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000107054:	85 c0                	test   %eax,%eax
ffff800000107056:	74 0e                	je     ffff800000107066 <init_memory+0x1e6>
ffff800000107058:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff80000010705c:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
ffff800000107060:	0f 8e 71 fe ff ff    	jle    ffff800000106ed7 <init_memory+0x57>
ffff800000107066:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010706a:	48 89 c1             	mov    %rax,%rcx
ffff80000010706d:	48 ba 68 25 11 00 00 	movabs $0xffff800000112568,%rdx
ffff800000107074:	80 ff ff 
ffff800000107077:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010707c:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107081:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107086:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010708d:	80 ff ff 
ffff800000107090:	41 ff d0             	callq  *%r8
ffff800000107093:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff80000010709a:	00 
ffff80000010709b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001070a2:	e9 e1 00 00 00       	jmpq   ffff800000107188 <init_memory+0x308>
ffff8000001070a7:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001070ae:	80 ff ff 
ffff8000001070b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070b4:	48 63 d0             	movslq %eax,%rdx
ffff8000001070b7:	48 89 d0             	mov    %rdx,%rax
ffff8000001070ba:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070be:	48 01 d0             	add    %rdx,%rax
ffff8000001070c1:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070c5:	48 01 c8             	add    %rcx,%rax
ffff8000001070c8:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070cc:	8b 00                	mov    (%rax),%eax
ffff8000001070ce:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070d1:	0f 85 a9 00 00 00    	jne    ffff800000107180 <init_memory+0x300>
ffff8000001070d7:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001070de:	80 ff ff 
ffff8000001070e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070e4:	48 63 d0             	movslq %eax,%rdx
ffff8000001070e7:	48 89 d0             	mov    %rdx,%rax
ffff8000001070ea:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070ee:	48 01 d0             	add    %rdx,%rax
ffff8000001070f1:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070f5:	48 01 c8             	add    %rcx,%rax
ffff8000001070f8:	48 8b 00             	mov    (%rax),%rax
ffff8000001070fb:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107101:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107107:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff80000010710b:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107112:	80 ff ff 
ffff800000107115:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107118:	48 63 d0             	movslq %eax,%rdx
ffff80000010711b:	48 89 d0             	mov    %rdx,%rax
ffff80000010711e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107122:	48 01 d0             	add    %rdx,%rax
ffff800000107125:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107129:	48 01 c8             	add    %rcx,%rax
ffff80000010712c:	48 8b 08             	mov    (%rax),%rcx
ffff80000010712f:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000107136:	80 ff ff 
ffff800000107139:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010713c:	48 63 d0             	movslq %eax,%rdx
ffff80000010713f:	48 89 d0             	mov    %rdx,%rax
ffff800000107142:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107146:	48 01 d0             	add    %rdx,%rax
ffff800000107149:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010714d:	48 01 f0             	add    %rsi,%rax
ffff800000107150:	48 83 c0 08          	add    $0x8,%rax
ffff800000107154:	48 8b 00             	mov    (%rax),%rax
ffff800000107157:	48 01 c8             	add    %rcx,%rax
ffff80000010715a:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107160:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107164:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107168:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff80000010716c:	76 15                	jbe    ffff800000107183 <init_memory+0x303>
ffff80000010716e:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107172:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff800000107176:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010717a:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff80000010717e:	eb 04                	jmp    ffff800000107184 <init_memory+0x304>
ffff800000107180:	90                   	nop
ffff800000107181:	eb 01                	jmp    ffff800000107184 <init_memory+0x304>
ffff800000107183:	90                   	nop
ffff800000107184:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107188:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010718b:	48 63 d0             	movslq %eax,%rdx
ffff80000010718e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107195:	80 ff ff 
ffff800000107198:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff80000010719f:	48 39 c2             	cmp    %rax,%rdx
ffff8000001071a2:	0f 86 ff fe ff ff    	jbe    ffff8000001070a7 <init_memory+0x227>
ffff8000001071a8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001071ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001071b0:	49 89 d0             	mov    %rdx,%r8
ffff8000001071b3:	48 89 c1             	mov    %rax,%rcx
ffff8000001071b6:	48 ba 88 25 11 00 00 	movabs $0xffff800000112588,%rdx
ffff8000001071bd:	80 ff ff 
ffff8000001071c0:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001071c5:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001071ca:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001071cf:	49 b9 29 53 10 00 00 	movabs $0xffff800000105329,%r9
ffff8000001071d6:	80 ff ff 
ffff8000001071d9:	41 ff d1             	callq  *%r9
ffff8000001071dc:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071e3:	80 ff ff 
ffff8000001071e6:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff8000001071ed:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001071f4:	80 ff ff 
ffff8000001071f7:	48 89 d0             	mov    %rdx,%rax
ffff8000001071fa:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071fe:	48 01 d0             	add    %rdx,%rax
ffff800000107201:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107205:	48 01 c8             	add    %rcx,%rax
ffff800000107208:	48 8b 08             	mov    (%rax),%rcx
ffff80000010720b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107212:	80 ff ff 
ffff800000107215:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff80000010721c:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000107223:	80 ff ff 
ffff800000107226:	48 89 d0             	mov    %rdx,%rax
ffff800000107229:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010722d:	48 01 d0             	add    %rdx,%rax
ffff800000107230:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107234:	48 01 f0             	add    %rsi,%rax
ffff800000107237:	48 83 c0 08          	add    $0x8,%rax
ffff80000010723b:	48 8b 00             	mov    (%rax),%rax
ffff80000010723e:	48 01 c8             	add    %rcx,%rax
ffff800000107241:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000107245:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010724c:	80 ff ff 
ffff80000010724f:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000107256:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff80000010725c:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107262:	48 89 c2             	mov    %rax,%rdx
ffff800000107265:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010726c:	80 ff ff 
ffff80000010726f:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff800000107276:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010727a:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010727e:	48 89 c2             	mov    %rax,%rdx
ffff800000107281:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107288:	80 ff ff 
ffff80000010728b:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000107292:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107296:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010729a:	48 83 c0 3f          	add    $0x3f,%rax
ffff80000010729e:	48 c1 e8 03          	shr    $0x3,%rax
ffff8000001072a2:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001072a6:	48 89 c2             	mov    %rax,%rdx
ffff8000001072a9:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072b0:	80 ff ff 
ffff8000001072b3:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff8000001072ba:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072c1:	80 ff ff 
ffff8000001072c4:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff8000001072cb:	48 89 c2             	mov    %rax,%rdx
ffff8000001072ce:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072d5:	80 ff ff 
ffff8000001072d8:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001072df:	be ff 00 00 00       	mov    $0xff,%esi
ffff8000001072e4:	48 89 c7             	mov    %rax,%rdi
ffff8000001072e7:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff8000001072ee:	80 ff ff 
ffff8000001072f1:	ff d0                	callq  *%rax
ffff8000001072f3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072fa:	80 ff ff 
ffff8000001072fd:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107304:	48 89 c2             	mov    %rax,%rdx
ffff800000107307:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010730e:	80 ff ff 
ffff800000107311:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff800000107318:	48 01 d0             	add    %rdx,%rax
ffff80000010731b:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000107321:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff800000107327:	48 89 c2             	mov    %rax,%rdx
ffff80000010732a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107331:	80 ff ff 
ffff800000107334:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff80000010733b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010733f:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107343:	48 89 c2             	mov    %rax,%rdx
ffff800000107346:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010734d:	80 ff ff 
ffff800000107350:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff800000107357:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010735b:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010735f:	48 89 c2             	mov    %rax,%rdx
ffff800000107362:	48 89 d0             	mov    %rdx,%rax
ffff800000107365:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107369:	48 01 d0             	add    %rdx,%rax
ffff80000010736c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107370:	48 83 c0 07          	add    $0x7,%rax
ffff800000107374:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107378:	48 89 c2             	mov    %rax,%rdx
ffff80000010737b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107382:	80 ff ff 
ffff800000107385:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff80000010738c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107393:	80 ff ff 
ffff800000107396:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff80000010739d:	48 89 c2             	mov    %rax,%rdx
ffff8000001073a0:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073a7:	80 ff ff 
ffff8000001073aa:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001073b1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001073b6:	48 89 c7             	mov    %rax,%rdi
ffff8000001073b9:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff8000001073c0:	80 ff ff 
ffff8000001073c3:	ff d0                	callq  *%rax
ffff8000001073c5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073cc:	80 ff ff 
ffff8000001073cf:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001073d6:	48 89 c2             	mov    %rax,%rdx
ffff8000001073d9:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073e0:	80 ff ff 
ffff8000001073e3:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff8000001073ea:	48 01 d0             	add    %rdx,%rax
ffff8000001073ed:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff8000001073f3:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff8000001073f9:	48 89 c2             	mov    %rax,%rdx
ffff8000001073fc:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107403:	80 ff ff 
ffff800000107406:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff80000010740d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107414:	80 ff ff 
ffff800000107417:	48 c7 80 c0 02 00 00 	movq   $0x0,0x2c0(%rax)
ffff80000010741e:	00 00 00 00 
ffff800000107422:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107429:	80 ff ff 
ffff80000010742c:	48 c7 80 c8 02 00 00 	movq   $0x190,0x2c8(%rax)
ffff800000107433:	90 01 00 00 
ffff800000107437:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010743e:	80 ff ff 
ffff800000107441:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff800000107448:	48 89 c2             	mov    %rax,%rdx
ffff80000010744b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107452:	80 ff ff 
ffff800000107455:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff80000010745c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107461:	48 89 c7             	mov    %rax,%rdi
ffff800000107464:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff80000010746b:	80 ff ff 
ffff80000010746e:	ff d0                	callq  *%rax
ffff800000107470:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000107477:	e9 e1 02 00 00       	jmpq   ffff80000010775d <init_memory+0x8dd>
ffff80000010747c:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107483:	80 ff ff 
ffff800000107486:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107489:	48 63 d0             	movslq %eax,%rdx
ffff80000010748c:	48 89 d0             	mov    %rdx,%rax
ffff80000010748f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107493:	48 01 d0             	add    %rdx,%rax
ffff800000107496:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010749a:	48 01 c8             	add    %rcx,%rax
ffff80000010749d:	48 83 c0 10          	add    $0x10,%rax
ffff8000001074a1:	8b 00                	mov    (%rax),%eax
ffff8000001074a3:	83 f8 01             	cmp    $0x1,%eax
ffff8000001074a6:	0f 85 a9 02 00 00    	jne    ffff800000107755 <init_memory+0x8d5>
ffff8000001074ac:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001074b3:	80 ff ff 
ffff8000001074b6:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001074b9:	48 63 d0             	movslq %eax,%rdx
ffff8000001074bc:	48 89 d0             	mov    %rdx,%rax
ffff8000001074bf:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074c3:	48 01 d0             	add    %rdx,%rax
ffff8000001074c6:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074ca:	48 01 c8             	add    %rcx,%rax
ffff8000001074cd:	48 8b 00             	mov    (%rax),%rax
ffff8000001074d0:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff8000001074d6:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001074dc:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001074e0:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001074e7:	80 ff ff 
ffff8000001074ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001074ed:	48 63 d0             	movslq %eax,%rdx
ffff8000001074f0:	48 89 d0             	mov    %rdx,%rax
ffff8000001074f3:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074f7:	48 01 d0             	add    %rdx,%rax
ffff8000001074fa:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074fe:	48 01 c8             	add    %rcx,%rax
ffff800000107501:	48 8b 08             	mov    (%rax),%rcx
ffff800000107504:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010750b:	80 ff ff 
ffff80000010750e:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107511:	48 63 d0             	movslq %eax,%rdx
ffff800000107514:	48 89 d0             	mov    %rdx,%rax
ffff800000107517:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010751b:	48 01 d0             	add    %rdx,%rax
ffff80000010751e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107522:	48 01 f0             	add    %rsi,%rax
ffff800000107525:	48 83 c0 08          	add    $0x8,%rax
ffff800000107529:	48 8b 00             	mov    (%rax),%rax
ffff80000010752c:	48 01 c8             	add    %rcx,%rax
ffff80000010752f:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107535:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107539:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff80000010753d:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
ffff800000107541:	0f 86 11 02 00 00    	jbe    ffff800000107758 <init_memory+0x8d8>
ffff800000107547:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010754e:	80 ff ff 
ffff800000107551:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107558:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010755f:	80 ff ff 
ffff800000107562:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff800000107569:	48 89 d0             	mov    %rdx,%rax
ffff80000010756c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107570:	48 01 d0             	add    %rdx,%rax
ffff800000107573:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107577:	48 01 c8             	add    %rcx,%rax
ffff80000010757a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff80000010757e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107585:	80 ff ff 
ffff800000107588:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff80000010758f:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000107593:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010759a:	80 ff ff 
ffff80000010759d:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff8000001075a4:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075a8:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff8000001075ac:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001075b0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075b4:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff8000001075b8:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001075bc:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001075c0:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff8000001075c4:	48 89 c2             	mov    %rax,%rdx
ffff8000001075c7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075cb:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff8000001075cf:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075d3:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff8000001075da:	00 
ffff8000001075db:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001075df:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff8000001075e3:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001075e7:	48 89 c2             	mov    %rax,%rdx
ffff8000001075ea:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075ee:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff8000001075f2:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075f6:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff8000001075fd:	00 
ffff8000001075fe:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107602:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff800000107609:	00 
ffff80000010760a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010760e:	48 bf a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdi
ffff800000107615:	80 ff ff 
ffff800000107618:	48 89 78 30          	mov    %rdi,0x30(%rax)
ffff80000010761c:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107620:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff800000107624:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107628:	48 89 c2             	mov    %rax,%rdx
ffff80000010762b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010762f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107633:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010763a:	80 ff ff 
ffff80000010763d:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107644:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107648:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010764c:	48 89 c2             	mov    %rax,%rdx
ffff80000010764f:	48 89 d0             	mov    %rdx,%rax
ffff800000107652:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107656:	48 01 d0             	add    %rdx,%rax
ffff800000107659:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010765d:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff800000107661:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107665:	48 89 10             	mov    %rdx,(%rax)
ffff800000107668:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010766c:	48 8b 00             	mov    (%rax),%rax
ffff80000010766f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000107673:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010767a:	e9 bd 00 00 00       	jmpq   ffff80000010773c <init_memory+0x8bc>
ffff80000010767f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107683:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff800000107687:	48 89 10             	mov    %rdx,(%rax)
ffff80000010768a:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff80000010768d:	48 98                	cltq   
ffff80000010768f:	48 c1 e0 15          	shl    $0x15,%rax
ffff800000107693:	48 89 c2             	mov    %rax,%rdx
ffff800000107696:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff80000010769a:	48 01 c2             	add    %rax,%rdx
ffff80000010769d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076a1:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001076a5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076a9:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff8000001076b0:	00 
ffff8000001076b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076b5:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001076bc:	00 
ffff8000001076bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076c1:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001076c8:	00 
ffff8000001076c9:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001076d0:	80 ff ff 
ffff8000001076d3:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff8000001076da:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076de:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001076e2:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff8000001076e6:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001076ea:	48 01 d0             	add    %rdx,%rax
ffff8000001076ed:	48 8b 10             	mov    (%rax),%rdx
ffff8000001076f0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076f4:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001076f8:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001076fc:	83 e0 3f             	and    $0x3f,%eax
ffff8000001076ff:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107704:	89 c1                	mov    %eax,%ecx
ffff800000107706:	48 d3 e6             	shl    %cl,%rsi
ffff800000107709:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107710:	80 ff ff 
ffff800000107713:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff80000010771a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010771e:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107722:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107726:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010772a:	48 01 c8             	add    %rcx,%rax
ffff80000010772d:	48 31 f2             	xor    %rsi,%rdx
ffff800000107730:	48 89 10             	mov    %rdx,(%rax)
ffff800000107733:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000107737:	48 83 45 e0 28       	addq   $0x28,-0x20(%rbp)
ffff80000010773c:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff80000010773f:	48 63 d0             	movslq %eax,%rdx
ffff800000107742:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107746:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010774a:	48 39 c2             	cmp    %rax,%rdx
ffff80000010774d:	0f 82 2c ff ff ff    	jb     ffff80000010767f <init_memory+0x7ff>
ffff800000107753:	eb 04                	jmp    ffff800000107759 <init_memory+0x8d9>
ffff800000107755:	90                   	nop
ffff800000107756:	eb 01                	jmp    ffff800000107759 <init_memory+0x8d9>
ffff800000107758:	90                   	nop
ffff800000107759:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff80000010775d:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107760:	48 63 d0             	movslq %eax,%rdx
ffff800000107763:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010776a:	80 ff ff 
ffff80000010776d:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000107774:	48 39 c2             	cmp    %rax,%rdx
ffff800000107777:	0f 86 ff fc ff ff    	jbe    ffff80000010747c <init_memory+0x5fc>
ffff80000010777d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107784:	80 ff ff 
ffff800000107787:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010778e:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff800000107795:	80 ff ff 
ffff800000107798:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff80000010779f:	48 89 10             	mov    %rdx,(%rax)
ffff8000001077a2:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077a9:	80 ff ff 
ffff8000001077ac:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001077b3:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff8000001077ba:	00 
ffff8000001077bb:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077c2:	80 ff ff 
ffff8000001077c5:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001077cc:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff8000001077d3:	00 
ffff8000001077d4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077db:	80 ff ff 
ffff8000001077de:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001077e5:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001077ec:	00 
ffff8000001077ed:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077f4:	80 ff ff 
ffff8000001077f7:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001077fe:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff800000107805:	00 
ffff800000107806:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010780d:	80 ff ff 
ffff800000107810:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff800000107817:	48 89 d0             	mov    %rdx,%rax
ffff80000010781a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010781e:	48 01 d0             	add    %rdx,%rax
ffff800000107821:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107825:	48 83 c0 07          	add    $0x7,%rax
ffff800000107829:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff80000010782d:	48 89 c2             	mov    %rax,%rdx
ffff800000107830:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107837:	80 ff ff 
ffff80000010783a:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff800000107841:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107848:	80 ff ff 
ffff80000010784b:	48 8b 88 98 02 00 00 	mov    0x298(%rax),%rcx
ffff800000107852:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107859:	80 ff ff 
ffff80000010785c:	48 8b 90 90 02 00 00 	mov    0x290(%rax),%rdx
ffff800000107863:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010786a:	80 ff ff 
ffff80000010786d:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107874:	49 89 c9             	mov    %rcx,%r9
ffff800000107877:	49 89 d0             	mov    %rdx,%r8
ffff80000010787a:	48 89 c1             	mov    %rax,%rcx
ffff80000010787d:	48 ba b8 25 11 00 00 	movabs $0xffff8000001125b8,%rdx
ffff800000107884:	80 ff ff 
ffff800000107887:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010788c:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107891:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107896:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff80000010789d:	80 ff ff 
ffff8000001078a0:	41 ff d2             	callq  *%r10
ffff8000001078a3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001078aa:	80 ff ff 
ffff8000001078ad:	48 8b 88 b0 02 00 00 	mov    0x2b0(%rax),%rcx
ffff8000001078b4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001078bb:	80 ff ff 
ffff8000001078be:	48 8b 90 a8 02 00 00 	mov    0x2a8(%rax),%rdx
ffff8000001078c5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001078cc:	80 ff ff 
ffff8000001078cf:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff8000001078d6:	49 89 c9             	mov    %rcx,%r9
ffff8000001078d9:	49 89 d0             	mov    %rdx,%r8
ffff8000001078dc:	48 89 c1             	mov    %rax,%rcx
ffff8000001078df:	48 ba f0 25 11 00 00 	movabs $0xffff8000001125f0,%rdx
ffff8000001078e6:	80 ff ff 
ffff8000001078e9:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078ee:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001078f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078f8:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff8000001078ff:	80 ff ff 
ffff800000107902:	41 ff d2             	callq  *%r10
ffff800000107905:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010790c:	80 ff ff 
ffff80000010790f:	48 8b 88 c8 02 00 00 	mov    0x2c8(%rax),%rcx
ffff800000107916:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010791d:	80 ff ff 
ffff800000107920:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff800000107927:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010792e:	80 ff ff 
ffff800000107931:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107938:	49 89 c9             	mov    %rcx,%r9
ffff80000010793b:	49 89 d0             	mov    %rdx,%r8
ffff80000010793e:	48 89 c1             	mov    %rax,%rcx
ffff800000107941:	48 ba 30 26 11 00 00 	movabs $0xffff800000112630,%rdx
ffff800000107948:	80 ff ff 
ffff80000010794b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107950:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107955:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010795a:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107961:	80 ff ff 
ffff800000107964:	41 ff d2             	callq  *%r10
ffff800000107967:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff80000010796e:	80 ff ff 
ffff800000107971:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff800000107977:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff80000010797e:	80 ff ff 
ffff800000107981:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff800000107987:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff80000010798e:	e9 b2 00 00 00       	jmpq   ffff800000107a45 <init_memory+0xbc5>
ffff800000107993:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010799a:	80 ff ff 
ffff80000010799d:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001079a4:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001079a7:	48 63 d0             	movslq %eax,%rdx
ffff8000001079aa:	48 89 d0             	mov    %rdx,%rax
ffff8000001079ad:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001079b1:	48 01 d0             	add    %rdx,%rax
ffff8000001079b4:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001079b8:	48 01 c8             	add    %rcx,%rax
ffff8000001079bb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff8000001079bf:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001079c3:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff8000001079c7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001079cb:	48 8b 10             	mov    (%rax),%rdx
ffff8000001079ce:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001079d2:	48 8b 78 20          	mov    0x20(%rax),%rdi
ffff8000001079d6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001079da:	48 8b 70 18          	mov    0x18(%rax),%rsi
ffff8000001079de:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001079e2:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001079e6:	51                   	push   %rcx
ffff8000001079e7:	52                   	push   %rdx
ffff8000001079e8:	49 89 f9             	mov    %rdi,%r9
ffff8000001079eb:	49 89 f0             	mov    %rsi,%r8
ffff8000001079ee:	48 89 c1             	mov    %rax,%rcx
ffff8000001079f1:	48 ba 70 26 11 00 00 	movabs $0xffff800000112670,%rdx
ffff8000001079f8:	80 ff ff 
ffff8000001079fb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107a00:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107a05:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107a0a:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107a11:	80 ff ff 
ffff800000107a14:	41 ff d2             	callq  *%r10
ffff800000107a17:	48 83 c4 10          	add    $0x10,%rsp
ffff800000107a1b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107a1f:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107a23:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
ffff800000107a2a:	00 00 00 
ffff800000107a2d:	48 39 d0             	cmp    %rdx,%rax
ffff800000107a30:	75 0f                	jne    ffff800000107a41 <init_memory+0xbc1>
ffff800000107a32:	48 ba 38 90 12 00 00 	movabs $0xffff800000129038,%rdx
ffff800000107a39:	80 ff ff 
ffff800000107a3c:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107a3f:	89 02                	mov    %eax,(%rdx)
ffff800000107a41:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107a45:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107a48:	48 63 d0             	movslq %eax,%rdx
ffff800000107a4b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a52:	80 ff ff 
ffff800000107a55:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107a5c:	48 39 c2             	cmp    %rax,%rdx
ffff800000107a5f:	0f 82 2e ff ff ff    	jb     ffff800000107993 <init_memory+0xb13>
ffff800000107a65:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a6c:	80 ff ff 
ffff800000107a6f:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff800000107a76:	48 89 c2             	mov    %rax,%rdx
ffff800000107a79:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a80:	80 ff ff 
ffff800000107a83:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff800000107a8a:	48 01 d0             	add    %rdx,%rax
ffff800000107a8d:	48 05 00 01 00 00    	add    $0x100,%rax
ffff800000107a93:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107a97:	48 89 c2             	mov    %rax,%rdx
ffff800000107a9a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107aa1:	80 ff ff 
ffff800000107aa4:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000107aab:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107ab2:	80 ff ff 
ffff800000107ab5:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
ffff800000107abc:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107ac3:	80 ff ff 
ffff800000107ac6:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff800000107acd:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107ad4:	80 ff ff 
ffff800000107ad7:	48 8b b8 e0 02 00 00 	mov    0x2e0(%rax),%rdi
ffff800000107ade:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107ae5:	80 ff ff 
ffff800000107ae8:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
ffff800000107aef:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107af6:	80 ff ff 
ffff800000107af9:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000107b00:	51                   	push   %rcx
ffff800000107b01:	52                   	push   %rdx
ffff800000107b02:	49 89 f9             	mov    %rdi,%r9
ffff800000107b05:	49 89 f0             	mov    %rsi,%r8
ffff800000107b08:	48 89 c1             	mov    %rax,%rcx
ffff800000107b0b:	48 ba e8 26 11 00 00 	movabs $0xffff8000001126e8,%rdx
ffff800000107b12:	80 ff ff 
ffff800000107b15:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107b1a:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107b1f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b24:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000107b2b:	80 ff ff 
ffff800000107b2e:	41 ff d2             	callq  *%r10
ffff800000107b31:	48 83 c4 10          	add    $0x10,%rsp
ffff800000107b35:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107b3c:	80 ff ff 
ffff800000107b3f:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000107b46:	48 ba 00 00 00 00 00 	movabs $0x800000000000,%rdx
ffff800000107b4d:	80 00 00 
ffff800000107b50:	48 01 d0             	add    %rdx,%rax
ffff800000107b53:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107b57:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107b5a:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107b61:	eb 40                	jmp    ffff800000107ba3 <init_memory+0xd23>
ffff800000107b63:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107b6a:	80 ff ff 
ffff800000107b6d:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107b74:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107b77:	48 63 d0             	movslq %eax,%rdx
ffff800000107b7a:	48 89 d0             	mov    %rdx,%rax
ffff800000107b7d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107b81:	48 01 d0             	add    %rdx,%rax
ffff800000107b84:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107b88:	48 01 c8             	add    %rcx,%rax
ffff800000107b8b:	be 93 00 00 00       	mov    $0x93,%esi
ffff800000107b90:	48 89 c7             	mov    %rax,%rdi
ffff800000107b93:	48 b8 12 6b 10 00 00 	movabs $0xffff800000106b12,%rax
ffff800000107b9a:	80 ff ff 
ffff800000107b9d:	ff d0                	callq  *%rax
ffff800000107b9f:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000107ba3:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107ba6:	3b 45 fc             	cmp    -0x4(%rbp),%eax
ffff800000107ba9:	7e b8                	jle    ffff800000107b63 <init_memory+0xce3>
ffff800000107bab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bb0:	48 ba 01 6b 10 00 00 	movabs $0xffff800000106b01,%rdx
ffff800000107bb7:	80 ff ff 
ffff800000107bba:	ff d2                	callq  *%rdx
ffff800000107bbc:	48 ba 28 90 12 00 00 	movabs $0xffff800000129028,%rdx
ffff800000107bc3:	80 ff ff 
ffff800000107bc6:	48 89 02             	mov    %rax,(%rdx)
ffff800000107bc9:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107bd0:	80 ff ff 
ffff800000107bd3:	48 8b 00             	mov    (%rax),%rax
ffff800000107bd6:	48 89 c1             	mov    %rax,%rcx
ffff800000107bd9:	48 ba 44 27 11 00 00 	movabs $0xffff800000112744,%rdx
ffff800000107be0:	80 ff ff 
ffff800000107be3:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107be8:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107bed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bf2:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107bf9:	80 ff ff 
ffff800000107bfc:	41 ff d0             	callq  *%r8
ffff800000107bff:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107c06:	80 ff ff 
ffff800000107c09:	48 8b 00             	mov    (%rax),%rax
ffff800000107c0c:	48 89 c2             	mov    %rax,%rdx
ffff800000107c0f:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107c16:	80 ff ff 
ffff800000107c19:	48 01 d0             	add    %rdx,%rax
ffff800000107c1c:	48 8b 00             	mov    (%rax),%rax
ffff800000107c1f:	b0 00                	mov    $0x0,%al
ffff800000107c21:	48 89 c1             	mov    %rax,%rcx
ffff800000107c24:	48 ba 59 27 11 00 00 	movabs $0xffff800000112759,%rdx
ffff800000107c2b:	80 ff ff 
ffff800000107c2e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107c33:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107c38:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c3d:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107c44:	80 ff ff 
ffff800000107c47:	41 ff d0             	callq  *%r8
ffff800000107c4a:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107c51:	80 ff ff 
ffff800000107c54:	48 8b 00             	mov    (%rax),%rax
ffff800000107c57:	48 89 c2             	mov    %rax,%rdx
ffff800000107c5a:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107c61:	80 ff ff 
ffff800000107c64:	48 01 d0             	add    %rdx,%rax
ffff800000107c67:	48 8b 00             	mov    (%rax),%rax
ffff800000107c6a:	b0 00                	mov    $0x0,%al
ffff800000107c6c:	48 89 c2             	mov    %rax,%rdx
ffff800000107c6f:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107c76:	80 ff ff 
ffff800000107c79:	48 01 d0             	add    %rdx,%rax
ffff800000107c7c:	48 8b 00             	mov    (%rax),%rax
ffff800000107c7f:	b0 00                	mov    $0x0,%al
ffff800000107c81:	48 89 c1             	mov    %rax,%rcx
ffff800000107c84:	48 ba 6f 27 11 00 00 	movabs $0xffff80000011276f,%rdx
ffff800000107c8b:	80 ff ff 
ffff800000107c8e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107c93:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff800000107c98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c9d:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107ca4:	80 ff ff 
ffff800000107ca7:	41 ff d0             	callq  *%r8
ffff800000107caa:	0f 20 d8             	mov    %cr3,%rax
ffff800000107cad:	0f 22 d8             	mov    %rax,%cr3
ffff800000107cb0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107cb4:	90                   	nop
ffff800000107cb5:	c9                   	leaveq 
ffff800000107cb6:	c3                   	retq   

ffff800000107cb7 <alloc_pages>:
ffff800000107cb7:	55                   	push   %rbp
ffff800000107cb8:	48 89 e5             	mov    %rsp,%rbp
ffff800000107cbb:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107cbf:	89 7d 8c             	mov    %edi,-0x74(%rbp)
ffff800000107cc2:	89 75 88             	mov    %esi,-0x78(%rbp)
ffff800000107cc5:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
ffff800000107cc9:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000107cd0:	00 
ffff800000107cd1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107cd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff800000107cdf:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107ce3:	74 4c                	je     ffff800000107d31 <alloc_pages+0x7a>
ffff800000107ce5:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107ce9:	7f 6e                	jg     ffff800000107d59 <alloc_pages+0xa2>
ffff800000107ceb:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
ffff800000107cef:	74 08                	je     ffff800000107cf9 <alloc_pages+0x42>
ffff800000107cf1:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
ffff800000107cf5:	74 1a                	je     ffff800000107d11 <alloc_pages+0x5a>
ffff800000107cf7:	eb 60                	jmp    ffff800000107d59 <alloc_pages+0xa2>
ffff800000107cf9:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107d00:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107d07:	80 ff ff 
ffff800000107d0a:	8b 00                	mov    (%rax),%eax
ffff800000107d0c:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107d0f:	eb 77                	jmp    ffff800000107d88 <alloc_pages+0xd1>
ffff800000107d11:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107d18:	80 ff ff 
ffff800000107d1b:	8b 00                	mov    (%rax),%eax
ffff800000107d1d:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107d20:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff800000107d27:	80 ff ff 
ffff800000107d2a:	8b 00                	mov    (%rax),%eax
ffff800000107d2c:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107d2f:	eb 57                	jmp    ffff800000107d88 <alloc_pages+0xd1>
ffff800000107d31:	48 b8 38 90 12 00 00 	movabs $0xffff800000129038,%rax
ffff800000107d38:	80 ff ff 
ffff800000107d3b:	8b 00                	mov    (%rax),%eax
ffff800000107d3d:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107d40:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d47:	80 ff ff 
ffff800000107d4a:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107d51:	83 e8 01             	sub    $0x1,%eax
ffff800000107d54:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107d57:	eb 2f                	jmp    ffff800000107d88 <alloc_pages+0xd1>
ffff800000107d59:	48 ba 88 27 11 00 00 	movabs $0xffff800000112788,%rdx
ffff800000107d60:	80 ff ff 
ffff800000107d63:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107d68:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107d6d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107d72:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000107d79:	80 ff ff 
ffff800000107d7c:	ff d1                	callq  *%rcx
ffff800000107d7e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107d83:	e9 5f 02 00 00       	jmpq   ffff800000107fe7 <alloc_pages+0x330>
ffff800000107d88:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107d8b:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107d8e:	e9 1b 02 00 00       	jmpq   ffff800000107fae <alloc_pages+0x2f7>
ffff800000107d93:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d9a:	80 ff ff 
ffff800000107d9d:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107da4:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107da7:	48 63 d0             	movslq %eax,%rdx
ffff800000107daa:	48 89 d0             	mov    %rdx,%rax
ffff800000107dad:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107db1:	48 01 d0             	add    %rdx,%rax
ffff800000107db4:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107db8:	48 01 c8             	add    %rcx,%rax
ffff800000107dbb:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107dbf:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107dc2:	48 98                	cltq   
ffff800000107dc4:	48 39 c2             	cmp    %rax,%rdx
ffff800000107dc7:	0f 82 dc 01 00 00    	jb     ffff800000107fa9 <alloc_pages+0x2f2>
ffff800000107dcd:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107dd4:	80 ff ff 
ffff800000107dd7:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107dde:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107de1:	48 63 d0             	movslq %eax,%rdx
ffff800000107de4:	48 89 d0             	mov    %rdx,%rax
ffff800000107de7:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107deb:	48 01 d0             	add    %rdx,%rax
ffff800000107dee:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107df2:	48 01 c8             	add    %rcx,%rax
ffff800000107df5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107df9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107dfd:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107e01:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107e05:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107e09:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107e0d:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000107e11:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107e15:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107e19:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107e1d:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107e21:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107e25:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107e29:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107e2d:	83 e0 3f             	and    $0x3f,%eax
ffff800000107e30:	48 89 c2             	mov    %rax,%rdx
ffff800000107e33:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107e38:	48 29 d0             	sub    %rdx,%rax
ffff800000107e3b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107e3f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107e43:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107e47:	e9 4d 01 00 00       	jmpq   ffff800000107f99 <alloc_pages+0x2e2>
ffff800000107e4c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107e53:	80 ff ff 
ffff800000107e56:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107e5d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107e61:	48 c1 e8 06          	shr    $0x6,%rax
ffff800000107e65:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107e69:	48 01 d0             	add    %rdx,%rax
ffff800000107e6c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107e70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107e74:	83 e0 3f             	and    $0x3f,%eax
ffff800000107e77:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107e7b:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107e7f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000107e83:	e9 e3 00 00 00       	jmpq   ffff800000107f6b <alloc_pages+0x2b4>
ffff800000107e88:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107e8c:	48 8b 00             	mov    (%rax),%rax
ffff800000107e8f:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000107e93:	89 d1                	mov    %edx,%ecx
ffff800000107e95:	48 d3 e8             	shr    %cl,%rax
ffff800000107e98:	48 89 c6             	mov    %rax,%rsi
ffff800000107e9b:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107e9f:	48 83 c0 08          	add    $0x8,%rax
ffff800000107ea3:	48 8b 10             	mov    (%rax),%rdx
ffff800000107ea6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107eaa:	89 c1                	mov    %eax,%ecx
ffff800000107eac:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107eb1:	29 c8                	sub    %ecx,%eax
ffff800000107eb3:	89 c1                	mov    %eax,%ecx
ffff800000107eb5:	48 d3 e2             	shl    %cl,%rdx
ffff800000107eb8:	48 89 d0             	mov    %rdx,%rax
ffff800000107ebb:	48 09 c6             	or     %rax,%rsi
ffff800000107ebe:	48 89 f2             	mov    %rsi,%rdx
ffff800000107ec1:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
ffff800000107ec5:	74 16                	je     ffff800000107edd <alloc_pages+0x226>
ffff800000107ec7:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107eca:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107ecf:	89 c1                	mov    %eax,%ecx
ffff800000107ed1:	48 d3 e6             	shl    %cl,%rsi
ffff800000107ed4:	48 89 f0             	mov    %rsi,%rax
ffff800000107ed7:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107edb:	eb 07                	jmp    ffff800000107ee4 <alloc_pages+0x22d>
ffff800000107edd:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107ee4:	48 21 d0             	and    %rdx,%rax
ffff800000107ee7:	48 85 c0             	test   %rax,%rax
ffff800000107eea:	75 7a                	jne    ffff800000107f66 <alloc_pages+0x2af>
ffff800000107eec:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000107ef0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107ef4:	48 01 d0             	add    %rdx,%rax
ffff800000107ef7:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107efb:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107eff:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000107f06:	00 
ffff800000107f07:	eb 50                	jmp    ffff800000107f59 <alloc_pages+0x2a2>
ffff800000107f09:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107f10:	80 ff ff 
ffff800000107f13:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107f1a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107f1e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107f22:	48 01 c2             	add    %rax,%rdx
ffff800000107f25:	48 89 d0             	mov    %rdx,%rax
ffff800000107f28:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107f2c:	48 01 d0             	add    %rdx,%rax
ffff800000107f2f:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f33:	48 01 c8             	add    %rcx,%rax
ffff800000107f36:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107f3a:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
ffff800000107f3e:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107f42:	48 89 d6             	mov    %rdx,%rsi
ffff800000107f45:	48 89 c7             	mov    %rax,%rdi
ffff800000107f48:	48 b8 12 6b 10 00 00 	movabs $0xffff800000106b12,%rax
ffff800000107f4f:	80 ff ff 
ffff800000107f52:	ff d0                	callq  *%rax
ffff800000107f54:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
ffff800000107f59:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107f5c:	48 98                	cltq   
ffff800000107f5e:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000107f62:	72 a5                	jb     ffff800000107f09 <alloc_pages+0x252>
ffff800000107f64:	eb 5b                	jmp    ffff800000107fc1 <alloc_pages+0x30a>
ffff800000107f66:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000107f6b:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107f70:	48 2b 45 98          	sub    -0x68(%rbp),%rax
ffff800000107f74:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
ffff800000107f78:	0f 82 0a ff ff ff    	jb     ffff800000107e88 <alloc_pages+0x1d1>
ffff800000107f7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f82:	83 e0 3f             	and    $0x3f,%eax
ffff800000107f85:	48 85 c0             	test   %rax,%rax
ffff800000107f88:	74 06                	je     ffff800000107f90 <alloc_pages+0x2d9>
ffff800000107f8a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107f8e:	eb 05                	jmp    ffff800000107f95 <alloc_pages+0x2de>
ffff800000107f90:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107f95:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000107f99:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f9d:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
ffff800000107fa1:	0f 86 a5 fe ff ff    	jbe    ffff800000107e4c <alloc_pages+0x195>
ffff800000107fa7:	eb 01                	jmp    ffff800000107faa <alloc_pages+0x2f3>
ffff800000107fa9:	90                   	nop
ffff800000107faa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107fae:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107fb1:	3b 45 f4             	cmp    -0xc(%rbp),%eax
ffff800000107fb4:	0f 8e d9 fd ff ff    	jle    ffff800000107d93 <alloc_pages+0xdc>
ffff800000107fba:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107fbf:	eb 26                	jmp    ffff800000107fe7 <alloc_pages+0x330>
ffff800000107fc1:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107fc8:	80 ff ff 
ffff800000107fcb:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107fd2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107fd6:	48 89 d0             	mov    %rdx,%rax
ffff800000107fd9:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107fdd:	48 01 d0             	add    %rdx,%rax
ffff800000107fe0:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107fe4:	48 01 c8             	add    %rcx,%rax
ffff800000107fe7:	c9                   	leaveq 
ffff800000107fe8:	c3                   	retq   

ffff800000107fe9 <io_in8>:
ffff800000107fe9:	55                   	push   %rbp
ffff800000107fea:	48 89 e5             	mov    %rsp,%rbp
ffff800000107fed:	89 f8                	mov    %edi,%eax
ffff800000107fef:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107ff3:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107ff7:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107ffb:	89 c2                	mov    %eax,%edx
ffff800000107ffd:	ec                   	in     (%dx),%al
ffff800000107ffe:	0f ae f0             	mfence 
ffff800000108001:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000108004:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000108008:	5d                   	pop    %rbp
ffff800000108009:	c3                   	retq   

ffff80000010800a <io_out8>:
ffff80000010800a:	55                   	push   %rbp
ffff80000010800b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010800e:	89 f8                	mov    %edi,%eax
ffff800000108010:	89 f2                	mov    %esi,%edx
ffff800000108012:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
ffff800000108016:	89 d0                	mov    %edx,%eax
ffff800000108018:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff80000010801b:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff80000010801f:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000108023:	ee                   	out    %al,(%dx)
ffff800000108024:	0f ae f0             	mfence 
ffff800000108027:	90                   	nop
ffff800000108028:	5d                   	pop    %rbp
ffff800000108029:	c3                   	retq   

ffff80000010802a <set_intr_gate>:
ffff80000010802a:	55                   	push   %rbp
ffff80000010802b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010802e:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000108031:	89 f0                	mov    %esi,%eax
ffff800000108033:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff800000108037:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff80000010803a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010803d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000108041:	48 89 c2             	mov    %rax,%rdx
ffff800000108044:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
ffff80000010804b:	80 ff ff 
ffff80000010804e:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000108052:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000108055:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000108059:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff80000010805d:	48 b8 c2 98 10 00 00 	movabs $0xffff8000001098c2,%rax
ffff800000108064:	80 ff ff 
ffff800000108067:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff80000010806b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010806f:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff800000108075:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff800000108079:	48 89 c2             	mov    %rax,%rdx
ffff80000010807c:	44 89 c0             	mov    %r8d,%eax
ffff80000010807f:	66 89 d0             	mov    %dx,%ax
ffff800000108082:	48 83 e1 07          	and    $0x7,%rcx
ffff800000108086:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff80000010808d:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000108091:	48 01 c8             	add    %rcx,%rax
ffff800000108094:	48 31 c9             	xor    %rcx,%rcx
ffff800000108097:	89 d1                	mov    %edx,%ecx
ffff800000108099:	48 c1 e9 10          	shr    $0x10,%rcx
ffff80000010809d:	48 c1 e1 30          	shl    $0x30,%rcx
ffff8000001080a1:	48 01 c8             	add    %rcx,%rax
ffff8000001080a4:	48 89 06             	mov    %rax,(%rsi)
ffff8000001080a7:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001080ab:	48 89 17             	mov    %rdx,(%rdi)
ffff8000001080ae:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001080b2:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001080b6:	90                   	nop
ffff8000001080b7:	5d                   	pop    %rbp
ffff8000001080b8:	c3                   	retq   
ffff8000001080b9:	55                   	push   %rbp
ffff8000001080ba:	48 89 e5             	mov    %rsp,%rbp
ffff8000001080bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001080c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001080c5:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff8000001080c9:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff8000001080cd:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff8000001080d1:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff8000001080d5:	48 ba d0 a8 10 00 00 	movabs $0xffff80000010a8d0,%rdx
ffff8000001080dc:	80 ff ff 
ffff8000001080df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001080e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080e6:	48 ba d8 a8 10 00 00 	movabs $0xffff80000010a8d8,%rdx
ffff8000001080ed:	80 ff ff 
ffff8000001080f0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001080f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080f7:	48 ba e0 a8 10 00 00 	movabs $0xffff80000010a8e0,%rdx
ffff8000001080fe:	80 ff ff 
ffff800000108101:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108105:	48 89 02             	mov    %rax,(%rdx)
ffff800000108108:	48 ba f0 a8 10 00 00 	movabs $0xffff80000010a8f0,%rdx
ffff80000010810f:	80 ff ff 
ffff800000108112:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108116:	48 89 02             	mov    %rax,(%rdx)
ffff800000108119:	48 ba f8 a8 10 00 00 	movabs $0xffff80000010a8f8,%rdx
ffff800000108120:	80 ff ff 
ffff800000108123:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108127:	48 89 02             	mov    %rax,(%rdx)
ffff80000010812a:	48 ba 00 a9 10 00 00 	movabs $0xffff80000010a900,%rdx
ffff800000108131:	80 ff ff 
ffff800000108134:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108138:	48 89 02             	mov    %rax,(%rdx)
ffff80000010813b:	48 ba 08 a9 10 00 00 	movabs $0xffff80000010a908,%rdx
ffff800000108142:	80 ff ff 
ffff800000108145:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000108149:	48 89 02             	mov    %rax,(%rdx)
ffff80000010814c:	48 ba 10 a9 10 00 00 	movabs $0xffff80000010a910,%rdx
ffff800000108153:	80 ff ff 
ffff800000108156:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff80000010815a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010815d:	48 ba 18 a9 10 00 00 	movabs $0xffff80000010a918,%rdx
ffff800000108164:	80 ff ff 
ffff800000108167:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff80000010816b:	48 89 02             	mov    %rax,(%rdx)
ffff80000010816e:	48 ba 20 a9 10 00 00 	movabs $0xffff80000010a920,%rdx
ffff800000108175:	80 ff ff 
ffff800000108178:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff80000010817c:	48 89 02             	mov    %rax,(%rdx)
ffff80000010817f:	90                   	nop
ffff800000108180:	5d                   	pop    %rbp
ffff800000108181:	c3                   	retq   

ffff800000108182 <IRQ0x20_interrupt>:
ffff800000108182:	6a 00                	pushq  $0x0
ffff800000108184:	fc                   	cld    
ffff800000108185:	50                   	push   %rax
ffff800000108186:	50                   	push   %rax
ffff800000108187:	48 8c c0             	mov    %es,%rax
ffff80000010818a:	50                   	push   %rax
ffff80000010818b:	48 8c d8             	mov    %ds,%rax
ffff80000010818e:	50                   	push   %rax
ffff80000010818f:	48 31 c0             	xor    %rax,%rax
ffff800000108192:	55                   	push   %rbp
ffff800000108193:	57                   	push   %rdi
ffff800000108194:	56                   	push   %rsi
ffff800000108195:	52                   	push   %rdx
ffff800000108196:	51                   	push   %rcx
ffff800000108197:	53                   	push   %rbx
ffff800000108198:	41 50                	push   %r8
ffff80000010819a:	41 51                	push   %r9
ffff80000010819c:	41 52                	push   %r10
ffff80000010819e:	41 53                	push   %r11
ffff8000001081a0:	41 54                	push   %r12
ffff8000001081a2:	41 55                	push   %r13
ffff8000001081a4:	41 56                	push   %r14
ffff8000001081a6:	41 57                	push   %r15
ffff8000001081a8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081af:	48 8e da             	mov    %rdx,%ds
ffff8000001081b2:	48 8e c2             	mov    %rdx,%es
ffff8000001081b5:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081b8:	48 8d 05 66 be ff ff 	lea    -0x419a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081bf:	50                   	push   %rax
ffff8000001081c0:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff8000001081c7:	e9 f2 07 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001081cc <IRQ0x21_interrupt>:
ffff8000001081cc:	6a 00                	pushq  $0x0
ffff8000001081ce:	fc                   	cld    
ffff8000001081cf:	50                   	push   %rax
ffff8000001081d0:	50                   	push   %rax
ffff8000001081d1:	48 8c c0             	mov    %es,%rax
ffff8000001081d4:	50                   	push   %rax
ffff8000001081d5:	48 8c d8             	mov    %ds,%rax
ffff8000001081d8:	50                   	push   %rax
ffff8000001081d9:	48 31 c0             	xor    %rax,%rax
ffff8000001081dc:	55                   	push   %rbp
ffff8000001081dd:	57                   	push   %rdi
ffff8000001081de:	56                   	push   %rsi
ffff8000001081df:	52                   	push   %rdx
ffff8000001081e0:	51                   	push   %rcx
ffff8000001081e1:	53                   	push   %rbx
ffff8000001081e2:	41 50                	push   %r8
ffff8000001081e4:	41 51                	push   %r9
ffff8000001081e6:	41 52                	push   %r10
ffff8000001081e8:	41 53                	push   %r11
ffff8000001081ea:	41 54                	push   %r12
ffff8000001081ec:	41 55                	push   %r13
ffff8000001081ee:	41 56                	push   %r14
ffff8000001081f0:	41 57                	push   %r15
ffff8000001081f2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081f9:	48 8e da             	mov    %rdx,%ds
ffff8000001081fc:	48 8e c2             	mov    %rdx,%es
ffff8000001081ff:	48 89 e7             	mov    %rsp,%rdi
ffff800000108202:	48 8d 05 1c be ff ff 	lea    -0x41e4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108209:	50                   	push   %rax
ffff80000010820a:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000108211:	e9 a8 07 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108216 <IRQ0x22_interrupt>:
ffff800000108216:	6a 00                	pushq  $0x0
ffff800000108218:	fc                   	cld    
ffff800000108219:	50                   	push   %rax
ffff80000010821a:	50                   	push   %rax
ffff80000010821b:	48 8c c0             	mov    %es,%rax
ffff80000010821e:	50                   	push   %rax
ffff80000010821f:	48 8c d8             	mov    %ds,%rax
ffff800000108222:	50                   	push   %rax
ffff800000108223:	48 31 c0             	xor    %rax,%rax
ffff800000108226:	55                   	push   %rbp
ffff800000108227:	57                   	push   %rdi
ffff800000108228:	56                   	push   %rsi
ffff800000108229:	52                   	push   %rdx
ffff80000010822a:	51                   	push   %rcx
ffff80000010822b:	53                   	push   %rbx
ffff80000010822c:	41 50                	push   %r8
ffff80000010822e:	41 51                	push   %r9
ffff800000108230:	41 52                	push   %r10
ffff800000108232:	41 53                	push   %r11
ffff800000108234:	41 54                	push   %r12
ffff800000108236:	41 55                	push   %r13
ffff800000108238:	41 56                	push   %r14
ffff80000010823a:	41 57                	push   %r15
ffff80000010823c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108243:	48 8e da             	mov    %rdx,%ds
ffff800000108246:	48 8e c2             	mov    %rdx,%es
ffff800000108249:	48 89 e7             	mov    %rsp,%rdi
ffff80000010824c:	48 8d 05 d2 bd ff ff 	lea    -0x422e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108253:	50                   	push   %rax
ffff800000108254:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff80000010825b:	e9 5e 07 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108260 <IRQ0x23_interrupt>:
ffff800000108260:	6a 00                	pushq  $0x0
ffff800000108262:	fc                   	cld    
ffff800000108263:	50                   	push   %rax
ffff800000108264:	50                   	push   %rax
ffff800000108265:	48 8c c0             	mov    %es,%rax
ffff800000108268:	50                   	push   %rax
ffff800000108269:	48 8c d8             	mov    %ds,%rax
ffff80000010826c:	50                   	push   %rax
ffff80000010826d:	48 31 c0             	xor    %rax,%rax
ffff800000108270:	55                   	push   %rbp
ffff800000108271:	57                   	push   %rdi
ffff800000108272:	56                   	push   %rsi
ffff800000108273:	52                   	push   %rdx
ffff800000108274:	51                   	push   %rcx
ffff800000108275:	53                   	push   %rbx
ffff800000108276:	41 50                	push   %r8
ffff800000108278:	41 51                	push   %r9
ffff80000010827a:	41 52                	push   %r10
ffff80000010827c:	41 53                	push   %r11
ffff80000010827e:	41 54                	push   %r12
ffff800000108280:	41 55                	push   %r13
ffff800000108282:	41 56                	push   %r14
ffff800000108284:	41 57                	push   %r15
ffff800000108286:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010828d:	48 8e da             	mov    %rdx,%ds
ffff800000108290:	48 8e c2             	mov    %rdx,%es
ffff800000108293:	48 89 e7             	mov    %rsp,%rdi
ffff800000108296:	48 8d 05 88 bd ff ff 	lea    -0x4278(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010829d:	50                   	push   %rax
ffff80000010829e:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff8000001082a5:	e9 14 07 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001082aa <IRQ0x24_interrupt>:
ffff8000001082aa:	6a 00                	pushq  $0x0
ffff8000001082ac:	fc                   	cld    
ffff8000001082ad:	50                   	push   %rax
ffff8000001082ae:	50                   	push   %rax
ffff8000001082af:	48 8c c0             	mov    %es,%rax
ffff8000001082b2:	50                   	push   %rax
ffff8000001082b3:	48 8c d8             	mov    %ds,%rax
ffff8000001082b6:	50                   	push   %rax
ffff8000001082b7:	48 31 c0             	xor    %rax,%rax
ffff8000001082ba:	55                   	push   %rbp
ffff8000001082bb:	57                   	push   %rdi
ffff8000001082bc:	56                   	push   %rsi
ffff8000001082bd:	52                   	push   %rdx
ffff8000001082be:	51                   	push   %rcx
ffff8000001082bf:	53                   	push   %rbx
ffff8000001082c0:	41 50                	push   %r8
ffff8000001082c2:	41 51                	push   %r9
ffff8000001082c4:	41 52                	push   %r10
ffff8000001082c6:	41 53                	push   %r11
ffff8000001082c8:	41 54                	push   %r12
ffff8000001082ca:	41 55                	push   %r13
ffff8000001082cc:	41 56                	push   %r14
ffff8000001082ce:	41 57                	push   %r15
ffff8000001082d0:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082d7:	48 8e da             	mov    %rdx,%ds
ffff8000001082da:	48 8e c2             	mov    %rdx,%es
ffff8000001082dd:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082e0:	48 8d 05 3e bd ff ff 	lea    -0x42c2(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082e7:	50                   	push   %rax
ffff8000001082e8:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff8000001082ef:	e9 ca 06 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001082f4 <IRQ0x25_interrupt>:
ffff8000001082f4:	6a 00                	pushq  $0x0
ffff8000001082f6:	fc                   	cld    
ffff8000001082f7:	50                   	push   %rax
ffff8000001082f8:	50                   	push   %rax
ffff8000001082f9:	48 8c c0             	mov    %es,%rax
ffff8000001082fc:	50                   	push   %rax
ffff8000001082fd:	48 8c d8             	mov    %ds,%rax
ffff800000108300:	50                   	push   %rax
ffff800000108301:	48 31 c0             	xor    %rax,%rax
ffff800000108304:	55                   	push   %rbp
ffff800000108305:	57                   	push   %rdi
ffff800000108306:	56                   	push   %rsi
ffff800000108307:	52                   	push   %rdx
ffff800000108308:	51                   	push   %rcx
ffff800000108309:	53                   	push   %rbx
ffff80000010830a:	41 50                	push   %r8
ffff80000010830c:	41 51                	push   %r9
ffff80000010830e:	41 52                	push   %r10
ffff800000108310:	41 53                	push   %r11
ffff800000108312:	41 54                	push   %r12
ffff800000108314:	41 55                	push   %r13
ffff800000108316:	41 56                	push   %r14
ffff800000108318:	41 57                	push   %r15
ffff80000010831a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108321:	48 8e da             	mov    %rdx,%ds
ffff800000108324:	48 8e c2             	mov    %rdx,%es
ffff800000108327:	48 89 e7             	mov    %rsp,%rdi
ffff80000010832a:	48 8d 05 f4 bc ff ff 	lea    -0x430c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108331:	50                   	push   %rax
ffff800000108332:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff800000108339:	e9 80 06 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff80000010833e <IRQ0x26_interrupt>:
ffff80000010833e:	6a 00                	pushq  $0x0
ffff800000108340:	fc                   	cld    
ffff800000108341:	50                   	push   %rax
ffff800000108342:	50                   	push   %rax
ffff800000108343:	48 8c c0             	mov    %es,%rax
ffff800000108346:	50                   	push   %rax
ffff800000108347:	48 8c d8             	mov    %ds,%rax
ffff80000010834a:	50                   	push   %rax
ffff80000010834b:	48 31 c0             	xor    %rax,%rax
ffff80000010834e:	55                   	push   %rbp
ffff80000010834f:	57                   	push   %rdi
ffff800000108350:	56                   	push   %rsi
ffff800000108351:	52                   	push   %rdx
ffff800000108352:	51                   	push   %rcx
ffff800000108353:	53                   	push   %rbx
ffff800000108354:	41 50                	push   %r8
ffff800000108356:	41 51                	push   %r9
ffff800000108358:	41 52                	push   %r10
ffff80000010835a:	41 53                	push   %r11
ffff80000010835c:	41 54                	push   %r12
ffff80000010835e:	41 55                	push   %r13
ffff800000108360:	41 56                	push   %r14
ffff800000108362:	41 57                	push   %r15
ffff800000108364:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010836b:	48 8e da             	mov    %rdx,%ds
ffff80000010836e:	48 8e c2             	mov    %rdx,%es
ffff800000108371:	48 89 e7             	mov    %rsp,%rdi
ffff800000108374:	48 8d 05 aa bc ff ff 	lea    -0x4356(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010837b:	50                   	push   %rax
ffff80000010837c:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff800000108383:	e9 36 06 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108388 <IRQ0x27_interrupt>:
ffff800000108388:	6a 00                	pushq  $0x0
ffff80000010838a:	fc                   	cld    
ffff80000010838b:	50                   	push   %rax
ffff80000010838c:	50                   	push   %rax
ffff80000010838d:	48 8c c0             	mov    %es,%rax
ffff800000108390:	50                   	push   %rax
ffff800000108391:	48 8c d8             	mov    %ds,%rax
ffff800000108394:	50                   	push   %rax
ffff800000108395:	48 31 c0             	xor    %rax,%rax
ffff800000108398:	55                   	push   %rbp
ffff800000108399:	57                   	push   %rdi
ffff80000010839a:	56                   	push   %rsi
ffff80000010839b:	52                   	push   %rdx
ffff80000010839c:	51                   	push   %rcx
ffff80000010839d:	53                   	push   %rbx
ffff80000010839e:	41 50                	push   %r8
ffff8000001083a0:	41 51                	push   %r9
ffff8000001083a2:	41 52                	push   %r10
ffff8000001083a4:	41 53                	push   %r11
ffff8000001083a6:	41 54                	push   %r12
ffff8000001083a8:	41 55                	push   %r13
ffff8000001083aa:	41 56                	push   %r14
ffff8000001083ac:	41 57                	push   %r15
ffff8000001083ae:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083b5:	48 8e da             	mov    %rdx,%ds
ffff8000001083b8:	48 8e c2             	mov    %rdx,%es
ffff8000001083bb:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083be:	48 8d 05 60 bc ff ff 	lea    -0x43a0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083c5:	50                   	push   %rax
ffff8000001083c6:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff8000001083cd:	e9 ec 05 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001083d2 <IRQ0x28_interrupt>:
ffff8000001083d2:	6a 00                	pushq  $0x0
ffff8000001083d4:	fc                   	cld    
ffff8000001083d5:	50                   	push   %rax
ffff8000001083d6:	50                   	push   %rax
ffff8000001083d7:	48 8c c0             	mov    %es,%rax
ffff8000001083da:	50                   	push   %rax
ffff8000001083db:	48 8c d8             	mov    %ds,%rax
ffff8000001083de:	50                   	push   %rax
ffff8000001083df:	48 31 c0             	xor    %rax,%rax
ffff8000001083e2:	55                   	push   %rbp
ffff8000001083e3:	57                   	push   %rdi
ffff8000001083e4:	56                   	push   %rsi
ffff8000001083e5:	52                   	push   %rdx
ffff8000001083e6:	51                   	push   %rcx
ffff8000001083e7:	53                   	push   %rbx
ffff8000001083e8:	41 50                	push   %r8
ffff8000001083ea:	41 51                	push   %r9
ffff8000001083ec:	41 52                	push   %r10
ffff8000001083ee:	41 53                	push   %r11
ffff8000001083f0:	41 54                	push   %r12
ffff8000001083f2:	41 55                	push   %r13
ffff8000001083f4:	41 56                	push   %r14
ffff8000001083f6:	41 57                	push   %r15
ffff8000001083f8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083ff:	48 8e da             	mov    %rdx,%ds
ffff800000108402:	48 8e c2             	mov    %rdx,%es
ffff800000108405:	48 89 e7             	mov    %rsp,%rdi
ffff800000108408:	48 8d 05 16 bc ff ff 	lea    -0x43ea(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010840f:	50                   	push   %rax
ffff800000108410:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff800000108417:	e9 a2 05 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff80000010841c <IRQ0x29_interrupt>:
ffff80000010841c:	6a 00                	pushq  $0x0
ffff80000010841e:	fc                   	cld    
ffff80000010841f:	50                   	push   %rax
ffff800000108420:	50                   	push   %rax
ffff800000108421:	48 8c c0             	mov    %es,%rax
ffff800000108424:	50                   	push   %rax
ffff800000108425:	48 8c d8             	mov    %ds,%rax
ffff800000108428:	50                   	push   %rax
ffff800000108429:	48 31 c0             	xor    %rax,%rax
ffff80000010842c:	55                   	push   %rbp
ffff80000010842d:	57                   	push   %rdi
ffff80000010842e:	56                   	push   %rsi
ffff80000010842f:	52                   	push   %rdx
ffff800000108430:	51                   	push   %rcx
ffff800000108431:	53                   	push   %rbx
ffff800000108432:	41 50                	push   %r8
ffff800000108434:	41 51                	push   %r9
ffff800000108436:	41 52                	push   %r10
ffff800000108438:	41 53                	push   %r11
ffff80000010843a:	41 54                	push   %r12
ffff80000010843c:	41 55                	push   %r13
ffff80000010843e:	41 56                	push   %r14
ffff800000108440:	41 57                	push   %r15
ffff800000108442:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108449:	48 8e da             	mov    %rdx,%ds
ffff80000010844c:	48 8e c2             	mov    %rdx,%es
ffff80000010844f:	48 89 e7             	mov    %rsp,%rdi
ffff800000108452:	48 8d 05 cc bb ff ff 	lea    -0x4434(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108459:	50                   	push   %rax
ffff80000010845a:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff800000108461:	e9 58 05 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108466 <IRQ0x2a_interrupt>:
ffff800000108466:	6a 00                	pushq  $0x0
ffff800000108468:	fc                   	cld    
ffff800000108469:	50                   	push   %rax
ffff80000010846a:	50                   	push   %rax
ffff80000010846b:	48 8c c0             	mov    %es,%rax
ffff80000010846e:	50                   	push   %rax
ffff80000010846f:	48 8c d8             	mov    %ds,%rax
ffff800000108472:	50                   	push   %rax
ffff800000108473:	48 31 c0             	xor    %rax,%rax
ffff800000108476:	55                   	push   %rbp
ffff800000108477:	57                   	push   %rdi
ffff800000108478:	56                   	push   %rsi
ffff800000108479:	52                   	push   %rdx
ffff80000010847a:	51                   	push   %rcx
ffff80000010847b:	53                   	push   %rbx
ffff80000010847c:	41 50                	push   %r8
ffff80000010847e:	41 51                	push   %r9
ffff800000108480:	41 52                	push   %r10
ffff800000108482:	41 53                	push   %r11
ffff800000108484:	41 54                	push   %r12
ffff800000108486:	41 55                	push   %r13
ffff800000108488:	41 56                	push   %r14
ffff80000010848a:	41 57                	push   %r15
ffff80000010848c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108493:	48 8e da             	mov    %rdx,%ds
ffff800000108496:	48 8e c2             	mov    %rdx,%es
ffff800000108499:	48 89 e7             	mov    %rsp,%rdi
ffff80000010849c:	48 8d 05 82 bb ff ff 	lea    -0x447e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084a3:	50                   	push   %rax
ffff8000001084a4:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff8000001084ab:	e9 0e 05 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001084b0 <IRQ0x2b_interrupt>:
ffff8000001084b0:	6a 00                	pushq  $0x0
ffff8000001084b2:	fc                   	cld    
ffff8000001084b3:	50                   	push   %rax
ffff8000001084b4:	50                   	push   %rax
ffff8000001084b5:	48 8c c0             	mov    %es,%rax
ffff8000001084b8:	50                   	push   %rax
ffff8000001084b9:	48 8c d8             	mov    %ds,%rax
ffff8000001084bc:	50                   	push   %rax
ffff8000001084bd:	48 31 c0             	xor    %rax,%rax
ffff8000001084c0:	55                   	push   %rbp
ffff8000001084c1:	57                   	push   %rdi
ffff8000001084c2:	56                   	push   %rsi
ffff8000001084c3:	52                   	push   %rdx
ffff8000001084c4:	51                   	push   %rcx
ffff8000001084c5:	53                   	push   %rbx
ffff8000001084c6:	41 50                	push   %r8
ffff8000001084c8:	41 51                	push   %r9
ffff8000001084ca:	41 52                	push   %r10
ffff8000001084cc:	41 53                	push   %r11
ffff8000001084ce:	41 54                	push   %r12
ffff8000001084d0:	41 55                	push   %r13
ffff8000001084d2:	41 56                	push   %r14
ffff8000001084d4:	41 57                	push   %r15
ffff8000001084d6:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084dd:	48 8e da             	mov    %rdx,%ds
ffff8000001084e0:	48 8e c2             	mov    %rdx,%es
ffff8000001084e3:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084e6:	48 8d 05 38 bb ff ff 	lea    -0x44c8(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084ed:	50                   	push   %rax
ffff8000001084ee:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff8000001084f5:	e9 c4 04 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001084fa <IRQ0x2c_interrupt>:
ffff8000001084fa:	6a 00                	pushq  $0x0
ffff8000001084fc:	fc                   	cld    
ffff8000001084fd:	50                   	push   %rax
ffff8000001084fe:	50                   	push   %rax
ffff8000001084ff:	48 8c c0             	mov    %es,%rax
ffff800000108502:	50                   	push   %rax
ffff800000108503:	48 8c d8             	mov    %ds,%rax
ffff800000108506:	50                   	push   %rax
ffff800000108507:	48 31 c0             	xor    %rax,%rax
ffff80000010850a:	55                   	push   %rbp
ffff80000010850b:	57                   	push   %rdi
ffff80000010850c:	56                   	push   %rsi
ffff80000010850d:	52                   	push   %rdx
ffff80000010850e:	51                   	push   %rcx
ffff80000010850f:	53                   	push   %rbx
ffff800000108510:	41 50                	push   %r8
ffff800000108512:	41 51                	push   %r9
ffff800000108514:	41 52                	push   %r10
ffff800000108516:	41 53                	push   %r11
ffff800000108518:	41 54                	push   %r12
ffff80000010851a:	41 55                	push   %r13
ffff80000010851c:	41 56                	push   %r14
ffff80000010851e:	41 57                	push   %r15
ffff800000108520:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108527:	48 8e da             	mov    %rdx,%ds
ffff80000010852a:	48 8e c2             	mov    %rdx,%es
ffff80000010852d:	48 89 e7             	mov    %rsp,%rdi
ffff800000108530:	48 8d 05 ee ba ff ff 	lea    -0x4512(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108537:	50                   	push   %rax
ffff800000108538:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff80000010853f:	e9 7a 04 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108544 <IRQ0x2d_interrupt>:
ffff800000108544:	6a 00                	pushq  $0x0
ffff800000108546:	fc                   	cld    
ffff800000108547:	50                   	push   %rax
ffff800000108548:	50                   	push   %rax
ffff800000108549:	48 8c c0             	mov    %es,%rax
ffff80000010854c:	50                   	push   %rax
ffff80000010854d:	48 8c d8             	mov    %ds,%rax
ffff800000108550:	50                   	push   %rax
ffff800000108551:	48 31 c0             	xor    %rax,%rax
ffff800000108554:	55                   	push   %rbp
ffff800000108555:	57                   	push   %rdi
ffff800000108556:	56                   	push   %rsi
ffff800000108557:	52                   	push   %rdx
ffff800000108558:	51                   	push   %rcx
ffff800000108559:	53                   	push   %rbx
ffff80000010855a:	41 50                	push   %r8
ffff80000010855c:	41 51                	push   %r9
ffff80000010855e:	41 52                	push   %r10
ffff800000108560:	41 53                	push   %r11
ffff800000108562:	41 54                	push   %r12
ffff800000108564:	41 55                	push   %r13
ffff800000108566:	41 56                	push   %r14
ffff800000108568:	41 57                	push   %r15
ffff80000010856a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108571:	48 8e da             	mov    %rdx,%ds
ffff800000108574:	48 8e c2             	mov    %rdx,%es
ffff800000108577:	48 89 e7             	mov    %rsp,%rdi
ffff80000010857a:	48 8d 05 a4 ba ff ff 	lea    -0x455c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108581:	50                   	push   %rax
ffff800000108582:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff800000108589:	e9 30 04 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff80000010858e <IRQ0x2e_interrupt>:
ffff80000010858e:	6a 00                	pushq  $0x0
ffff800000108590:	fc                   	cld    
ffff800000108591:	50                   	push   %rax
ffff800000108592:	50                   	push   %rax
ffff800000108593:	48 8c c0             	mov    %es,%rax
ffff800000108596:	50                   	push   %rax
ffff800000108597:	48 8c d8             	mov    %ds,%rax
ffff80000010859a:	50                   	push   %rax
ffff80000010859b:	48 31 c0             	xor    %rax,%rax
ffff80000010859e:	55                   	push   %rbp
ffff80000010859f:	57                   	push   %rdi
ffff8000001085a0:	56                   	push   %rsi
ffff8000001085a1:	52                   	push   %rdx
ffff8000001085a2:	51                   	push   %rcx
ffff8000001085a3:	53                   	push   %rbx
ffff8000001085a4:	41 50                	push   %r8
ffff8000001085a6:	41 51                	push   %r9
ffff8000001085a8:	41 52                	push   %r10
ffff8000001085aa:	41 53                	push   %r11
ffff8000001085ac:	41 54                	push   %r12
ffff8000001085ae:	41 55                	push   %r13
ffff8000001085b0:	41 56                	push   %r14
ffff8000001085b2:	41 57                	push   %r15
ffff8000001085b4:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085bb:	48 8e da             	mov    %rdx,%ds
ffff8000001085be:	48 8e c2             	mov    %rdx,%es
ffff8000001085c1:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085c4:	48 8d 05 5a ba ff ff 	lea    -0x45a6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085cb:	50                   	push   %rax
ffff8000001085cc:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff8000001085d3:	e9 e6 03 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001085d8 <IRQ0x2f_interrupt>:
ffff8000001085d8:	6a 00                	pushq  $0x0
ffff8000001085da:	fc                   	cld    
ffff8000001085db:	50                   	push   %rax
ffff8000001085dc:	50                   	push   %rax
ffff8000001085dd:	48 8c c0             	mov    %es,%rax
ffff8000001085e0:	50                   	push   %rax
ffff8000001085e1:	48 8c d8             	mov    %ds,%rax
ffff8000001085e4:	50                   	push   %rax
ffff8000001085e5:	48 31 c0             	xor    %rax,%rax
ffff8000001085e8:	55                   	push   %rbp
ffff8000001085e9:	57                   	push   %rdi
ffff8000001085ea:	56                   	push   %rsi
ffff8000001085eb:	52                   	push   %rdx
ffff8000001085ec:	51                   	push   %rcx
ffff8000001085ed:	53                   	push   %rbx
ffff8000001085ee:	41 50                	push   %r8
ffff8000001085f0:	41 51                	push   %r9
ffff8000001085f2:	41 52                	push   %r10
ffff8000001085f4:	41 53                	push   %r11
ffff8000001085f6:	41 54                	push   %r12
ffff8000001085f8:	41 55                	push   %r13
ffff8000001085fa:	41 56                	push   %r14
ffff8000001085fc:	41 57                	push   %r15
ffff8000001085fe:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108605:	48 8e da             	mov    %rdx,%ds
ffff800000108608:	48 8e c2             	mov    %rdx,%es
ffff80000010860b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010860e:	48 8d 05 10 ba ff ff 	lea    -0x45f0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108615:	50                   	push   %rax
ffff800000108616:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff80000010861d:	e9 9c 03 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108622 <IRQ0x30_interrupt>:
ffff800000108622:	6a 00                	pushq  $0x0
ffff800000108624:	fc                   	cld    
ffff800000108625:	50                   	push   %rax
ffff800000108626:	50                   	push   %rax
ffff800000108627:	48 8c c0             	mov    %es,%rax
ffff80000010862a:	50                   	push   %rax
ffff80000010862b:	48 8c d8             	mov    %ds,%rax
ffff80000010862e:	50                   	push   %rax
ffff80000010862f:	48 31 c0             	xor    %rax,%rax
ffff800000108632:	55                   	push   %rbp
ffff800000108633:	57                   	push   %rdi
ffff800000108634:	56                   	push   %rsi
ffff800000108635:	52                   	push   %rdx
ffff800000108636:	51                   	push   %rcx
ffff800000108637:	53                   	push   %rbx
ffff800000108638:	41 50                	push   %r8
ffff80000010863a:	41 51                	push   %r9
ffff80000010863c:	41 52                	push   %r10
ffff80000010863e:	41 53                	push   %r11
ffff800000108640:	41 54                	push   %r12
ffff800000108642:	41 55                	push   %r13
ffff800000108644:	41 56                	push   %r14
ffff800000108646:	41 57                	push   %r15
ffff800000108648:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010864f:	48 8e da             	mov    %rdx,%ds
ffff800000108652:	48 8e c2             	mov    %rdx,%es
ffff800000108655:	48 89 e7             	mov    %rsp,%rdi
ffff800000108658:	48 8d 05 c6 b9 ff ff 	lea    -0x463a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010865f:	50                   	push   %rax
ffff800000108660:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff800000108667:	e9 52 03 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff80000010866c <IRQ0x31_interrupt>:
ffff80000010866c:	6a 00                	pushq  $0x0
ffff80000010866e:	fc                   	cld    
ffff80000010866f:	50                   	push   %rax
ffff800000108670:	50                   	push   %rax
ffff800000108671:	48 8c c0             	mov    %es,%rax
ffff800000108674:	50                   	push   %rax
ffff800000108675:	48 8c d8             	mov    %ds,%rax
ffff800000108678:	50                   	push   %rax
ffff800000108679:	48 31 c0             	xor    %rax,%rax
ffff80000010867c:	55                   	push   %rbp
ffff80000010867d:	57                   	push   %rdi
ffff80000010867e:	56                   	push   %rsi
ffff80000010867f:	52                   	push   %rdx
ffff800000108680:	51                   	push   %rcx
ffff800000108681:	53                   	push   %rbx
ffff800000108682:	41 50                	push   %r8
ffff800000108684:	41 51                	push   %r9
ffff800000108686:	41 52                	push   %r10
ffff800000108688:	41 53                	push   %r11
ffff80000010868a:	41 54                	push   %r12
ffff80000010868c:	41 55                	push   %r13
ffff80000010868e:	41 56                	push   %r14
ffff800000108690:	41 57                	push   %r15
ffff800000108692:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108699:	48 8e da             	mov    %rdx,%ds
ffff80000010869c:	48 8e c2             	mov    %rdx,%es
ffff80000010869f:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086a2:	48 8d 05 7c b9 ff ff 	lea    -0x4684(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086a9:	50                   	push   %rax
ffff8000001086aa:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff8000001086b1:	e9 08 03 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001086b6 <IRQ0x32_interrupt>:
ffff8000001086b6:	6a 00                	pushq  $0x0
ffff8000001086b8:	fc                   	cld    
ffff8000001086b9:	50                   	push   %rax
ffff8000001086ba:	50                   	push   %rax
ffff8000001086bb:	48 8c c0             	mov    %es,%rax
ffff8000001086be:	50                   	push   %rax
ffff8000001086bf:	48 8c d8             	mov    %ds,%rax
ffff8000001086c2:	50                   	push   %rax
ffff8000001086c3:	48 31 c0             	xor    %rax,%rax
ffff8000001086c6:	55                   	push   %rbp
ffff8000001086c7:	57                   	push   %rdi
ffff8000001086c8:	56                   	push   %rsi
ffff8000001086c9:	52                   	push   %rdx
ffff8000001086ca:	51                   	push   %rcx
ffff8000001086cb:	53                   	push   %rbx
ffff8000001086cc:	41 50                	push   %r8
ffff8000001086ce:	41 51                	push   %r9
ffff8000001086d0:	41 52                	push   %r10
ffff8000001086d2:	41 53                	push   %r11
ffff8000001086d4:	41 54                	push   %r12
ffff8000001086d6:	41 55                	push   %r13
ffff8000001086d8:	41 56                	push   %r14
ffff8000001086da:	41 57                	push   %r15
ffff8000001086dc:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086e3:	48 8e da             	mov    %rdx,%ds
ffff8000001086e6:	48 8e c2             	mov    %rdx,%es
ffff8000001086e9:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086ec:	48 8d 05 32 b9 ff ff 	lea    -0x46ce(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086f3:	50                   	push   %rax
ffff8000001086f4:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff8000001086fb:	e9 be 02 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108700 <IRQ0x33_interrupt>:
ffff800000108700:	6a 00                	pushq  $0x0
ffff800000108702:	fc                   	cld    
ffff800000108703:	50                   	push   %rax
ffff800000108704:	50                   	push   %rax
ffff800000108705:	48 8c c0             	mov    %es,%rax
ffff800000108708:	50                   	push   %rax
ffff800000108709:	48 8c d8             	mov    %ds,%rax
ffff80000010870c:	50                   	push   %rax
ffff80000010870d:	48 31 c0             	xor    %rax,%rax
ffff800000108710:	55                   	push   %rbp
ffff800000108711:	57                   	push   %rdi
ffff800000108712:	56                   	push   %rsi
ffff800000108713:	52                   	push   %rdx
ffff800000108714:	51                   	push   %rcx
ffff800000108715:	53                   	push   %rbx
ffff800000108716:	41 50                	push   %r8
ffff800000108718:	41 51                	push   %r9
ffff80000010871a:	41 52                	push   %r10
ffff80000010871c:	41 53                	push   %r11
ffff80000010871e:	41 54                	push   %r12
ffff800000108720:	41 55                	push   %r13
ffff800000108722:	41 56                	push   %r14
ffff800000108724:	41 57                	push   %r15
ffff800000108726:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010872d:	48 8e da             	mov    %rdx,%ds
ffff800000108730:	48 8e c2             	mov    %rdx,%es
ffff800000108733:	48 89 e7             	mov    %rsp,%rdi
ffff800000108736:	48 8d 05 e8 b8 ff ff 	lea    -0x4718(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010873d:	50                   	push   %rax
ffff80000010873e:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff800000108745:	e9 74 02 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff80000010874a <IRQ0x34_interrupt>:
ffff80000010874a:	6a 00                	pushq  $0x0
ffff80000010874c:	fc                   	cld    
ffff80000010874d:	50                   	push   %rax
ffff80000010874e:	50                   	push   %rax
ffff80000010874f:	48 8c c0             	mov    %es,%rax
ffff800000108752:	50                   	push   %rax
ffff800000108753:	48 8c d8             	mov    %ds,%rax
ffff800000108756:	50                   	push   %rax
ffff800000108757:	48 31 c0             	xor    %rax,%rax
ffff80000010875a:	55                   	push   %rbp
ffff80000010875b:	57                   	push   %rdi
ffff80000010875c:	56                   	push   %rsi
ffff80000010875d:	52                   	push   %rdx
ffff80000010875e:	51                   	push   %rcx
ffff80000010875f:	53                   	push   %rbx
ffff800000108760:	41 50                	push   %r8
ffff800000108762:	41 51                	push   %r9
ffff800000108764:	41 52                	push   %r10
ffff800000108766:	41 53                	push   %r11
ffff800000108768:	41 54                	push   %r12
ffff80000010876a:	41 55                	push   %r13
ffff80000010876c:	41 56                	push   %r14
ffff80000010876e:	41 57                	push   %r15
ffff800000108770:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108777:	48 8e da             	mov    %rdx,%ds
ffff80000010877a:	48 8e c2             	mov    %rdx,%es
ffff80000010877d:	48 89 e7             	mov    %rsp,%rdi
ffff800000108780:	48 8d 05 9e b8 ff ff 	lea    -0x4762(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108787:	50                   	push   %rax
ffff800000108788:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff80000010878f:	e9 2a 02 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108794 <IRQ0x35_interrupt>:
ffff800000108794:	6a 00                	pushq  $0x0
ffff800000108796:	fc                   	cld    
ffff800000108797:	50                   	push   %rax
ffff800000108798:	50                   	push   %rax
ffff800000108799:	48 8c c0             	mov    %es,%rax
ffff80000010879c:	50                   	push   %rax
ffff80000010879d:	48 8c d8             	mov    %ds,%rax
ffff8000001087a0:	50                   	push   %rax
ffff8000001087a1:	48 31 c0             	xor    %rax,%rax
ffff8000001087a4:	55                   	push   %rbp
ffff8000001087a5:	57                   	push   %rdi
ffff8000001087a6:	56                   	push   %rsi
ffff8000001087a7:	52                   	push   %rdx
ffff8000001087a8:	51                   	push   %rcx
ffff8000001087a9:	53                   	push   %rbx
ffff8000001087aa:	41 50                	push   %r8
ffff8000001087ac:	41 51                	push   %r9
ffff8000001087ae:	41 52                	push   %r10
ffff8000001087b0:	41 53                	push   %r11
ffff8000001087b2:	41 54                	push   %r12
ffff8000001087b4:	41 55                	push   %r13
ffff8000001087b6:	41 56                	push   %r14
ffff8000001087b8:	41 57                	push   %r15
ffff8000001087ba:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001087c1:	48 8e da             	mov    %rdx,%ds
ffff8000001087c4:	48 8e c2             	mov    %rdx,%es
ffff8000001087c7:	48 89 e7             	mov    %rsp,%rdi
ffff8000001087ca:	48 8d 05 54 b8 ff ff 	lea    -0x47ac(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001087d1:	50                   	push   %rax
ffff8000001087d2:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff8000001087d9:	e9 e0 01 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff8000001087de <IRQ0x36_interrupt>:
ffff8000001087de:	6a 00                	pushq  $0x0
ffff8000001087e0:	fc                   	cld    
ffff8000001087e1:	50                   	push   %rax
ffff8000001087e2:	50                   	push   %rax
ffff8000001087e3:	48 8c c0             	mov    %es,%rax
ffff8000001087e6:	50                   	push   %rax
ffff8000001087e7:	48 8c d8             	mov    %ds,%rax
ffff8000001087ea:	50                   	push   %rax
ffff8000001087eb:	48 31 c0             	xor    %rax,%rax
ffff8000001087ee:	55                   	push   %rbp
ffff8000001087ef:	57                   	push   %rdi
ffff8000001087f0:	56                   	push   %rsi
ffff8000001087f1:	52                   	push   %rdx
ffff8000001087f2:	51                   	push   %rcx
ffff8000001087f3:	53                   	push   %rbx
ffff8000001087f4:	41 50                	push   %r8
ffff8000001087f6:	41 51                	push   %r9
ffff8000001087f8:	41 52                	push   %r10
ffff8000001087fa:	41 53                	push   %r11
ffff8000001087fc:	41 54                	push   %r12
ffff8000001087fe:	41 55                	push   %r13
ffff800000108800:	41 56                	push   %r14
ffff800000108802:	41 57                	push   %r15
ffff800000108804:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010880b:	48 8e da             	mov    %rdx,%ds
ffff80000010880e:	48 8e c2             	mov    %rdx,%es
ffff800000108811:	48 89 e7             	mov    %rsp,%rdi
ffff800000108814:	48 8d 05 0a b8 ff ff 	lea    -0x47f6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010881b:	50                   	push   %rax
ffff80000010881c:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff800000108823:	e9 96 01 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108828 <IRQ0x37_interrupt>:
ffff800000108828:	6a 00                	pushq  $0x0
ffff80000010882a:	fc                   	cld    
ffff80000010882b:	50                   	push   %rax
ffff80000010882c:	50                   	push   %rax
ffff80000010882d:	48 8c c0             	mov    %es,%rax
ffff800000108830:	50                   	push   %rax
ffff800000108831:	48 8c d8             	mov    %ds,%rax
ffff800000108834:	50                   	push   %rax
ffff800000108835:	48 31 c0             	xor    %rax,%rax
ffff800000108838:	55                   	push   %rbp
ffff800000108839:	57                   	push   %rdi
ffff80000010883a:	56                   	push   %rsi
ffff80000010883b:	52                   	push   %rdx
ffff80000010883c:	51                   	push   %rcx
ffff80000010883d:	53                   	push   %rbx
ffff80000010883e:	41 50                	push   %r8
ffff800000108840:	41 51                	push   %r9
ffff800000108842:	41 52                	push   %r10
ffff800000108844:	41 53                	push   %r11
ffff800000108846:	41 54                	push   %r12
ffff800000108848:	41 55                	push   %r13
ffff80000010884a:	41 56                	push   %r14
ffff80000010884c:	41 57                	push   %r15
ffff80000010884e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108855:	48 8e da             	mov    %rdx,%ds
ffff800000108858:	48 8e c2             	mov    %rdx,%es
ffff80000010885b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010885e:	48 8d 05 c0 b7 ff ff 	lea    -0x4840(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108865:	50                   	push   %rax
ffff800000108866:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff80000010886d:	e9 4c 01 00 00       	jmpq   ffff8000001089be <do_IRQ>

ffff800000108872 <init_interrupt>:
ffff800000108872:	55                   	push   %rbp
ffff800000108873:	48 89 e5             	mov    %rsp,%rbp
ffff800000108876:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010887a:	c7 45 fc 20 00 00 00 	movl   $0x20,-0x4(%rbp)
ffff800000108881:	eb 30                	jmp    ffff8000001088b3 <init_interrupt+0x41>
ffff800000108883:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000108886:	83 e8 20             	sub    $0x20,%eax
ffff800000108889:	48 ba 00 01 11 00 00 	movabs $0xffff800000110100,%rdx
ffff800000108890:	80 ff ff 
ffff800000108893:	48 98                	cltq   
ffff800000108895:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff800000108899:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010889c:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001088a1:	89 c7                	mov    %eax,%edi
ffff8000001088a3:	48 b8 2a 80 10 00 00 	movabs $0xffff80000010802a,%rax
ffff8000001088aa:	80 ff ff 
ffff8000001088ad:	ff d0                	callq  *%rax
ffff8000001088af:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001088b3:	83 7d fc 37          	cmpl   $0x37,-0x4(%rbp)
ffff8000001088b7:	7e ca                	jle    ffff800000108883 <init_interrupt+0x11>
ffff8000001088b9:	48 ba b0 27 11 00 00 	movabs $0xffff8000001127b0,%rdx
ffff8000001088c0:	80 ff ff 
ffff8000001088c3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001088c8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001088cd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001088d2:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001088d9:	80 ff ff 
ffff8000001088dc:	ff d1                	callq  *%rcx
ffff8000001088de:	be 11 00 00 00       	mov    $0x11,%esi
ffff8000001088e3:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001088e8:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff8000001088ef:	80 ff ff 
ffff8000001088f2:	ff d0                	callq  *%rax
ffff8000001088f4:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001088f9:	bf 21 00 00 00       	mov    $0x21,%edi
ffff8000001088fe:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108905:	80 ff ff 
ffff800000108908:	ff d0                	callq  *%rax
ffff80000010890a:	be 04 00 00 00       	mov    $0x4,%esi
ffff80000010890f:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108914:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff80000010891b:	80 ff ff 
ffff80000010891e:	ff d0                	callq  *%rax
ffff800000108920:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108925:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010892a:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108931:	80 ff ff 
ffff800000108934:	ff d0                	callq  *%rax
ffff800000108936:	be 11 00 00 00       	mov    $0x11,%esi
ffff80000010893b:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff800000108940:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108947:	80 ff ff 
ffff80000010894a:	ff d0                	callq  *%rax
ffff80000010894c:	be 28 00 00 00       	mov    $0x28,%esi
ffff800000108951:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108956:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff80000010895d:	80 ff ff 
ffff800000108960:	ff d0                	callq  *%rax
ffff800000108962:	be 02 00 00 00       	mov    $0x2,%esi
ffff800000108967:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff80000010896c:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108973:	80 ff ff 
ffff800000108976:	ff d0                	callq  *%rax
ffff800000108978:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010897d:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108982:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108989:	80 ff ff 
ffff80000010898c:	ff d0                	callq  *%rax
ffff80000010898e:	be fd 00 00 00       	mov    $0xfd,%esi
ffff800000108993:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108998:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff80000010899f:	80 ff ff 
ffff8000001089a2:	ff d0                	callq  *%rax
ffff8000001089a4:	be ff 00 00 00       	mov    $0xff,%esi
ffff8000001089a9:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001089ae:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff8000001089b5:	80 ff ff 
ffff8000001089b8:	ff d0                	callq  *%rax
ffff8000001089ba:	fb                   	sti    
ffff8000001089bb:	90                   	nop
ffff8000001089bc:	c9                   	leaveq 
ffff8000001089bd:	c3                   	retq   

ffff8000001089be <do_IRQ>:
ffff8000001089be:	55                   	push   %rbp
ffff8000001089bf:	48 89 e5             	mov    %rsp,%rbp
ffff8000001089c2:	48 83 ec 20          	sub    $0x20,%rsp
ffff8000001089c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001089ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001089ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001089d2:	48 89 c1             	mov    %rax,%rcx
ffff8000001089d5:	48 ba bd 27 11 00 00 	movabs $0xffff8000001127bd,%rdx
ffff8000001089dc:	80 ff ff 
ffff8000001089df:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001089e4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001089e9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001089ee:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001089f5:	80 ff ff 
ffff8000001089f8:	41 ff d0             	callq  *%r8
ffff8000001089fb:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000108a00:	48 b8 e9 7f 10 00 00 	movabs $0xffff800000107fe9,%rax
ffff800000108a07:	80 ff ff 
ffff800000108a0a:	ff d0                	callq  *%rax
ffff800000108a0c:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000108a0f:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000108a13:	89 c1                	mov    %eax,%ecx
ffff800000108a15:	48 ba cd 27 11 00 00 	movabs $0xffff8000001127cd,%rdx
ffff800000108a1c:	80 ff ff 
ffff800000108a1f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a24:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108a29:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a2e:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108a35:	80 ff ff 
ffff800000108a38:	41 ff d0             	callq  *%r8
ffff800000108a3b:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000108a40:	bf 20 00 00 00       	mov    $0x20,%edi
ffff800000108a45:	48 b8 0a 80 10 00 00 	movabs $0xffff80000010800a,%rax
ffff800000108a4c:	80 ff ff 
ffff800000108a4f:	ff d0                	callq  *%rax
ffff800000108a51:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a55:	48 8b 88 b0 00 00 00 	mov    0xb0(%rax),%rcx
ffff800000108a5c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a60:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000108a67:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a6b:	49 89 c9             	mov    %rcx,%r9
ffff800000108a6e:	49 89 d0             	mov    %rdx,%r8
ffff800000108a71:	48 89 c1             	mov    %rax,%rcx
ffff800000108a74:	48 ba e0 27 11 00 00 	movabs $0xffff8000001127e0,%rdx
ffff800000108a7b:	80 ff ff 
ffff800000108a7e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a83:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108a88:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a8d:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000108a94:	80 ff ff 
ffff800000108a97:	41 ff d2             	callq  *%r10
ffff800000108a9a:	90                   	nop
ffff800000108a9b:	c9                   	leaveq 
ffff800000108a9c:	c3                   	retq   

ffff800000108a9d <list_init>:
ffff800000108a9d:	55                   	push   %rbp
ffff800000108a9e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108aa1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108aa5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108aa9:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108aad:	48 89 10             	mov    %rdx,(%rax)
ffff800000108ab0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108ab4:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108ab8:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108abc:	90                   	nop
ffff800000108abd:	5d                   	pop    %rbp
ffff800000108abe:	c3                   	retq   

ffff800000108abf <list_add_to_before>:
ffff800000108abf:	55                   	push   %rbp
ffff800000108ac0:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ac3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108ac7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108acf:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108ad3:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108ad7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108adb:	48 8b 00             	mov    (%rax),%rax
ffff800000108ade:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108ae2:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108ae6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108aea:	48 8b 10             	mov    (%rax),%rdx
ffff800000108aed:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108af1:	48 89 10             	mov    %rdx,(%rax)
ffff800000108af4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108af8:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108afc:	48 89 10             	mov    %rdx,(%rax)
ffff800000108aff:	90                   	nop
ffff800000108b00:	5d                   	pop    %rbp
ffff800000108b01:	c3                   	retq   

ffff800000108b02 <list_next>:
ffff800000108b02:	55                   	push   %rbp
ffff800000108b03:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b06:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108b0a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b0e:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108b12:	48 85 c0             	test   %rax,%rax
ffff800000108b15:	74 0a                	je     ffff800000108b21 <list_next+0x1f>
ffff800000108b17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b1b:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108b1f:	eb 05                	jmp    ffff800000108b26 <list_next+0x24>
ffff800000108b21:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108b26:	5d                   	pop    %rbp
ffff800000108b27:	c3                   	retq   

ffff800000108b28 <memcpy>:
ffff800000108b28:	55                   	push   %rbp
ffff800000108b29:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b2c:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108b30:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108b34:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108b38:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b3c:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108b40:	48 85 c0             	test   %rax,%rax
ffff800000108b43:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108b47:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108b4b:	48 89 c1             	mov    %rax,%rcx
ffff800000108b4e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b52:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000108b56:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
ffff800000108b5a:	48 89 d7             	mov    %rdx,%rdi
ffff800000108b5d:	fc                   	cld    
ffff800000108b5e:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
ffff800000108b61:	a8 04                	test   $0x4,%al
ffff800000108b63:	74 01                	je     ffff800000108b66 <memcpy+0x3e>
ffff800000108b65:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff800000108b66:	a8 02                	test   $0x2,%al
ffff800000108b68:	74 02                	je     ffff800000108b6c <memcpy+0x44>
ffff800000108b6a:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
ffff800000108b6c:	a8 01                	test   $0x1,%al
ffff800000108b6e:	74 01                	je     ffff800000108b71 <memcpy+0x49>
ffff800000108b70:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff800000108b71:	89 f2                	mov    %esi,%edx
ffff800000108b73:	89 4d fc             	mov    %ecx,-0x4(%rbp)
ffff800000108b76:	89 7d f8             	mov    %edi,-0x8(%rbp)
ffff800000108b79:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108b7c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108b80:	5d                   	pop    %rbp
ffff800000108b81:	c3                   	retq   

ffff800000108b82 <memset>:
ffff800000108b82:	55                   	push   %rbp
ffff800000108b83:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b86:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108b8a:	89 f0                	mov    %esi,%eax
ffff800000108b8c:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108b90:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000108b93:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108b97:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000108b9e:	01 01 01 
ffff800000108ba1:	48 0f af c2          	imul   %rdx,%rax
ffff800000108ba5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108ba9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108bad:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108bb1:	48 85 c0             	test   %rax,%rax
ffff800000108bb4:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108bb8:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108bbc:	48 89 c1             	mov    %rax,%rcx
ffff800000108bbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bc3:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff800000108bc7:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000108bcb:	48 89 d7             	mov    %rdx,%rdi
ffff800000108bce:	fc                   	cld    
ffff800000108bcf:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff800000108bd2:	40 f6 c6 04          	test   $0x4,%sil
ffff800000108bd6:	74 01                	je     ffff800000108bd9 <memset+0x57>
ffff800000108bd8:	ab                   	stos   %eax,%es:(%rdi)
ffff800000108bd9:	40 f6 c6 02          	test   $0x2,%sil
ffff800000108bdd:	74 02                	je     ffff800000108be1 <memset+0x5f>
ffff800000108bdf:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000108be1:	40 f6 c6 01          	test   $0x1,%sil
ffff800000108be5:	74 01                	je     ffff800000108be8 <memset+0x66>
ffff800000108be7:	aa                   	stos   %al,%es:(%rdi)
ffff800000108be8:	89 f8                	mov    %edi,%eax
ffff800000108bea:	89 ca                	mov    %ecx,%edx
ffff800000108bec:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108bef:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff800000108bf2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108bf6:	5d                   	pop    %rbp
ffff800000108bf7:	c3                   	retq   

ffff800000108bf8 <wrmsr>:
ffff800000108bf8:	55                   	push   %rbp
ffff800000108bf9:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bfc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c00:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108c04:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108c08:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108c0c:	48 89 c2             	mov    %rax,%rdx
ffff800000108c0f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108c13:	89 c0                	mov    %eax,%eax
ffff800000108c15:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff800000108c19:	0f 30                	wrmsr  
ffff800000108c1b:	90                   	nop
ffff800000108c1c:	5d                   	pop    %rbp
ffff800000108c1d:	c3                   	retq   

ffff800000108c1e <get_current>:
ffff800000108c1e:	55                   	push   %rbp
ffff800000108c1f:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c22:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108c29:	00 
ffff800000108c2a:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108c31:	48 21 e0             	and    %rsp,%rax
ffff800000108c34:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108c38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c3c:	5d                   	pop    %rbp
ffff800000108c3d:	c3                   	retq   
ffff800000108c3e:	55                   	push   %rbp
ffff800000108c3f:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c42:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c46:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c4e:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108c55:	48 89 c1             	mov    %rax,%rcx
ffff800000108c58:	48 ba 08 28 11 00 00 	movabs $0xffff800000112808,%rdx
ffff800000108c5f:	80 ff ff 
ffff800000108c62:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108c67:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108c6c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108c71:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108c78:	80 ff ff 
ffff800000108c7b:	41 ff d0             	callq  *%r8
ffff800000108c7e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108c85:	c9                   	leaveq 
ffff800000108c86:	c3                   	retq   
ffff800000108c87:	55                   	push   %rbp
ffff800000108c88:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c8b:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c8f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c97:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108c9b:	48 89 c2             	mov    %rax,%rdx
ffff800000108c9e:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108ca3:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108ca8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108cad:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108cb4:	80 ff ff 
ffff800000108cb7:	ff d1                	callq  *%rcx
ffff800000108cb9:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108cbe:	c9                   	leaveq 
ffff800000108cbf:	c3                   	retq   
ffff800000108cc0:	55                   	push   %rbp
ffff800000108cc1:	48 89 e5             	mov    %rsp,%rbp
ffff800000108cc4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108cc8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108ccc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108cd0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000108cd4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108cd8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000108cdc:	48 ba d0 a8 10 00 00 	movabs $0xffff80000010a8d0,%rdx
ffff800000108ce3:	80 ff ff 
ffff800000108ce6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108cea:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ced:	48 ba d8 a8 10 00 00 	movabs $0xffff80000010a8d8,%rdx
ffff800000108cf4:	80 ff ff 
ffff800000108cf7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108cfb:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cfe:	48 ba e0 a8 10 00 00 	movabs $0xffff80000010a8e0,%rdx
ffff800000108d05:	80 ff ff 
ffff800000108d08:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108d0c:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d0f:	48 ba f0 a8 10 00 00 	movabs $0xffff80000010a8f0,%rdx
ffff800000108d16:	80 ff ff 
ffff800000108d19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108d1d:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d20:	48 ba f8 a8 10 00 00 	movabs $0xffff80000010a8f8,%rdx
ffff800000108d27:	80 ff ff 
ffff800000108d2a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108d2e:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d31:	48 ba 00 a9 10 00 00 	movabs $0xffff80000010a900,%rdx
ffff800000108d38:	80 ff ff 
ffff800000108d3b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108d3f:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d42:	48 ba 08 a9 10 00 00 	movabs $0xffff80000010a908,%rdx
ffff800000108d49:	80 ff ff 
ffff800000108d4c:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000108d50:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d53:	48 ba 10 a9 10 00 00 	movabs $0xffff80000010a910,%rdx
ffff800000108d5a:	80 ff ff 
ffff800000108d5d:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000108d61:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d64:	48 ba 18 a9 10 00 00 	movabs $0xffff80000010a918,%rdx
ffff800000108d6b:	80 ff ff 
ffff800000108d6e:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000108d72:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d75:	48 ba 20 a9 10 00 00 	movabs $0xffff80000010a920,%rdx
ffff800000108d7c:	80 ff ff 
ffff800000108d7f:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000108d83:	48 89 02             	mov    %rax,(%rdx)
ffff800000108d86:	90                   	nop
ffff800000108d87:	5d                   	pop    %rbp
ffff800000108d88:	c3                   	retq   

ffff800000108d89 <user_level_function>:
ffff800000108d89:	55                   	push   %rbp
ffff800000108d8a:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d8d:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108d94:	00 
ffff800000108d95:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108d9c:	20 57 6f 
ffff800000108d9f:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108da3:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108daa:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108db0:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108db5:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108db9:	48 89 d7             	mov    %rdx,%rdi
ffff800000108dbc:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108dc8 <sysexit_return_address>
ffff800000108dc3:	48 89 e1             	mov    %rsp,%rcx
ffff800000108dc6:	0f 34                	sysenter 

ffff800000108dc8 <sysexit_return_address>:
ffff800000108dc8:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108dcc:	eb fe                	jmp    ffff800000108dcc <sysexit_return_address+0x4>

ffff800000108dce <do_execve>:
ffff800000108dce:	55                   	push   %rbp
ffff800000108dcf:	48 89 e5             	mov    %rsp,%rbp
ffff800000108dd2:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108dd6:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108dda:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108dde:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108de5:	00 
ffff800000108de6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108dea:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108df1:	00 
ffff800000108df2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108df6:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
ffff800000108dfd:	01 00 00 00 
ffff800000108e01:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108e05:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108e0c:	00 
ffff800000108e0d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108e11:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108e18:	00 
ffff800000108e19:	48 ba 2c 28 11 00 00 	movabs $0xffff80000011282c,%rdx
ffff800000108e20:	80 ff ff 
ffff800000108e23:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108e28:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108e2d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e32:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108e39:	80 ff ff 
ffff800000108e3c:	ff d1                	callq  *%rcx
ffff800000108e3e:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108e43:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108e48:	48 bf 89 8d 10 00 00 	movabs $0xffff800000108d89,%rdi
ffff800000108e4f:	80 ff ff 
ffff800000108e52:	48 b8 28 8b 10 00 00 	movabs $0xffff800000108b28,%rax
ffff800000108e59:	80 ff ff 
ffff800000108e5c:	ff d0                	callq  *%rax
ffff800000108e5e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e63:	c9                   	leaveq 
ffff800000108e64:	c3                   	retq   

ffff800000108e65 <init>:
ffff800000108e65:	55                   	push   %rbp
ffff800000108e66:	48 89 e5             	mov    %rsp,%rbp
ffff800000108e69:	53                   	push   %rbx
ffff800000108e6a:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108e6e:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108e72:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108e76:	48 89 c1             	mov    %rax,%rcx
ffff800000108e79:	48 ba 48 28 11 00 00 	movabs $0xffff800000112848,%rdx
ffff800000108e80:	80 ff ff 
ffff800000108e83:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108e88:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108e8d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e92:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108e99:	80 ff ff 
ffff800000108e9c:	41 ff d0             	callq  *%r8
ffff800000108e9f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ea4:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108eab:	80 ff ff 
ffff800000108eae:	ff d2                	callq  *%rdx
ffff800000108eb0:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108eb4:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff800000108ebb:	80 ff ff 
ffff800000108ebe:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108ec2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ec7:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108ece:	80 ff ff 
ffff800000108ed1:	ff d2                	callq  *%rdx
ffff800000108ed3:	48 89 c3             	mov    %rax,%rbx
ffff800000108ed6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108edb:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108ee2:	80 ff ff 
ffff800000108ee5:	ff d2                	callq  *%rdx
ffff800000108ee7:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108eeb:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
ffff800000108ef2:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108ef6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108efb:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108f02:	80 ff ff 
ffff800000108f05:	ff d2                	callq  *%rdx
ffff800000108f07:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108f0b:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108f0f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108f13:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f18:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108f1f:	80 ff ff 
ffff800000108f22:	ff d2                	callq  *%rdx
ffff800000108f24:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000108f28:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f2d:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000108f34:	80 ff ff 
ffff800000108f37:	ff d2                	callq  *%rdx
ffff800000108f39:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000108f3d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108f41:	48 89 c7             	mov    %rax,%rdi
ffff800000108f44:	48 8b 63 10          	mov    0x10(%rbx),%rsp
ffff800000108f48:	ff 72 08             	pushq  0x8(%rdx)
ffff800000108f4b:	e9 7e fe ff ff       	jmpq   ffff800000108dce <do_execve>
ffff800000108f50:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108f55:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000108f59:	c9                   	leaveq 
ffff800000108f5a:	c3                   	retq   

ffff800000108f5b <do_fork>:
ffff800000108f5b:	55                   	push   %rbp
ffff800000108f5c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108f5f:	53                   	push   %rbx
ffff800000108f60:	48 83 ec 48          	sub    $0x48,%rsp
ffff800000108f64:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108f68:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108f6c:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108f70:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000108f74:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000108f7b:	00 
ffff800000108f7c:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000108f83:	00 
ffff800000108f84:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108f8b:	00 
ffff800000108f8c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f93:	80 ff ff 
ffff800000108f96:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f9d:	48 8b 00             	mov    (%rax),%rax
ffff800000108fa0:	48 89 c1             	mov    %rax,%rcx
ffff800000108fa3:	48 ba 6a 28 11 00 00 	movabs $0xffff80000011286a,%rdx
ffff800000108faa:	80 ff ff 
ffff800000108fad:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fb2:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108fb7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fbc:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108fc3:	80 ff ff 
ffff800000108fc6:	41 ff d0             	callq  *%r8
ffff800000108fc9:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000108fce:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108fd3:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000108fd8:	48 b8 b7 7c 10 00 00 	movabs $0xffff800000107cb7,%rax
ffff800000108fdf:	80 ff ff 
ffff800000108fe2:	ff d0                	callq  *%rax
ffff800000108fe4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108fe8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108fef:	80 ff ff 
ffff800000108ff2:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108ff9:	48 8b 00             	mov    (%rax),%rax
ffff800000108ffc:	48 89 c1             	mov    %rax,%rcx
ffff800000108fff:	48 ba 6a 28 11 00 00 	movabs $0xffff80000011286a,%rdx
ffff800000109006:	80 ff ff 
ffff800000109009:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010900e:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109013:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109018:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010901f:	80 ff ff 
ffff800000109022:	41 ff d0             	callq  *%r8
ffff800000109025:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109029:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010902d:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
ffff800000109034:	80 ff ff 
ffff800000109037:	48 01 d0             	add    %rdx,%rax
ffff80000010903a:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff80000010903e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109042:	48 89 c1             	mov    %rax,%rcx
ffff800000109045:	48 ba 88 28 11 00 00 	movabs $0xffff800000112888,%rdx
ffff80000010904c:	80 ff ff 
ffff80000010904f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109054:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109059:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010905e:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000109065:	80 ff ff 
ffff800000109068:	41 ff d0             	callq  *%r8
ffff80000010906b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010906f:	ba 58 00 00 00       	mov    $0x58,%edx
ffff800000109074:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109079:	48 89 c7             	mov    %rax,%rdi
ffff80000010907c:	48 b8 82 8b 10 00 00 	movabs $0xffff800000108b82,%rax
ffff800000109083:	80 ff ff 
ffff800000109086:	ff d0                	callq  *%rax
ffff800000109088:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010908d:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000109094:	80 ff ff 
ffff800000109097:	ff d2                	callq  *%rdx
ffff800000109099:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff80000010909d:	48 8b 08             	mov    (%rax),%rcx
ffff8000001090a0:	48 8b 58 08          	mov    0x8(%rax),%rbx
ffff8000001090a4:	48 89 0a             	mov    %rcx,(%rdx)
ffff8000001090a7:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
ffff8000001090ab:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff8000001090af:	48 8b 58 18          	mov    0x18(%rax),%rbx
ffff8000001090b3:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
ffff8000001090b7:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
ffff8000001090bb:	48 8b 48 20          	mov    0x20(%rax),%rcx
ffff8000001090bf:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001090c3:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
ffff8000001090c7:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
ffff8000001090cb:	48 8b 48 30          	mov    0x30(%rax),%rcx
ffff8000001090cf:	48 8b 58 38          	mov    0x38(%rax),%rbx
ffff8000001090d3:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
ffff8000001090d7:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
ffff8000001090db:	48 8b 48 40          	mov    0x40(%rax),%rcx
ffff8000001090df:	48 8b 58 48          	mov    0x48(%rax),%rbx
ffff8000001090e3:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
ffff8000001090e7:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
ffff8000001090eb:	48 8b 40 50          	mov    0x50(%rax),%rax
ffff8000001090ef:	48 89 42 50          	mov    %rax,0x50(%rdx)
ffff8000001090f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090f7:	48 89 c7             	mov    %rax,%rdi
ffff8000001090fa:	48 b8 9d 8a 10 00 00 	movabs $0xffff800000108a9d,%rax
ffff800000109101:	80 ff ff 
ffff800000109104:	ff d0                	callq  *%rax
ffff800000109106:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010910a:	48 89 c6             	mov    %rax,%rsi
ffff80000010910d:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff800000109114:	80 ff ff 
ffff800000109117:	48 b8 bf 8a 10 00 00 	movabs $0xffff800000108abf,%rax
ffff80000010911e:	80 ff ff 
ffff800000109121:	ff d0                	callq  *%rax
ffff800000109123:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109127:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff80000010912b:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010912f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109133:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000109137:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010913b:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff800000109142:	00 
ffff800000109143:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109147:	48 83 c0 58          	add    $0x58,%rax
ffff80000010914b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff80000010914f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109153:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000109157:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff80000010915b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010915f:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff800000109165:	48 89 c1             	mov    %rax,%rcx
ffff800000109168:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010916c:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109171:	48 89 ce             	mov    %rcx,%rsi
ffff800000109174:	48 89 c7             	mov    %rax,%rdi
ffff800000109177:	48 b8 28 8b 10 00 00 	movabs $0xffff800000108b28,%rax
ffff80000010917e:	80 ff ff 
ffff800000109181:	ff d0                	callq  *%rax
ffff800000109183:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109187:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff80000010918e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109192:	48 89 10             	mov    %rdx,(%rax)
ffff800000109195:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109199:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001091a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091a4:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001091a8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001091ac:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff8000001091b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091b7:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff8000001091bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001091bf:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001091c3:	83 e0 01             	and    $0x1,%eax
ffff8000001091c6:	48 85 c0             	test   %rax,%rax
ffff8000001091c9:	75 28                	jne    ffff8000001091f3 <do_fork+0x298>
ffff8000001091cb:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff8000001091d2:	80 ff ff 
ffff8000001091d5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001091d9:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff8000001091e0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001091e4:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001091eb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091ef:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001091f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001091f7:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff8000001091fe:	00 
ffff8000001091ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109204:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000109208:	c9                   	leaveq 
ffff800000109209:	c3                   	retq   

ffff80000010920a <do_exit>:
ffff80000010920a:	55                   	push   %rbp
ffff80000010920b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010920e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109212:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109216:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010921a:	48 89 c1             	mov    %rax,%rcx
ffff80000010921d:	48 ba b0 28 11 00 00 	movabs $0xffff8000001128b0,%rdx
ffff800000109224:	80 ff ff 
ffff800000109227:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010922c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109231:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109236:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010923d:	80 ff ff 
ffff800000109240:	41 ff d0             	callq  *%r8
ffff800000109243:	eb fe                	jmp    ffff800000109243 <do_exit+0x39>

ffff800000109245 <system_call_function>:
ffff800000109245:	55                   	push   %rbp
ffff800000109246:	48 89 e5             	mov    %rsp,%rbp
ffff800000109249:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010924d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109251:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000109255:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010925c:	48 ba 00 bd 10 00 00 	movabs $0xffff80000010bd00,%rdx
ffff800000109263:	80 ff ff 
ffff800000109266:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff80000010926a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010926e:	48 89 c7             	mov    %rax,%rdi
ffff800000109271:	ff d2                	callq  *%rdx
ffff800000109273:	c9                   	leaveq 
ffff800000109274:	c3                   	retq   

ffff800000109275 <kernel_thread_func>:
ffff800000109275:	41 5f                	pop    %r15
ffff800000109277:	41 5e                	pop    %r14
ffff800000109279:	41 5d                	pop    %r13
ffff80000010927b:	41 5c                	pop    %r12
ffff80000010927d:	41 5b                	pop    %r11
ffff80000010927f:	41 5a                	pop    %r10
ffff800000109281:	41 59                	pop    %r9
ffff800000109283:	41 58                	pop    %r8
ffff800000109285:	5b                   	pop    %rbx
ffff800000109286:	59                   	pop    %rcx
ffff800000109287:	5a                   	pop    %rdx
ffff800000109288:	5e                   	pop    %rsi
ffff800000109289:	5f                   	pop    %rdi
ffff80000010928a:	5d                   	pop    %rbp
ffff80000010928b:	58                   	pop    %rax
ffff80000010928c:	48 8e d8             	mov    %rax,%ds
ffff80000010928f:	58                   	pop    %rax
ffff800000109290:	48 8e c0             	mov    %rax,%es
ffff800000109293:	58                   	pop    %rax
ffff800000109294:	48 83 c4 38          	add    $0x38,%rsp
ffff800000109298:	48 89 d7             	mov    %rdx,%rdi
ffff80000010929b:	ff d3                	callq  *%rbx
ffff80000010929d:	48 89 c7             	mov    %rax,%rdi
ffff8000001092a0:	e8 65 ff ff ff       	callq  ffff80000010920a <do_exit>

ffff8000001092a5 <kernel_thread>:
ffff8000001092a5:	55                   	push   %rbp
ffff8000001092a6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001092a9:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff8000001092b0:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
ffff8000001092b7:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
ffff8000001092be:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
ffff8000001092c5:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff8000001092cc:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001092d1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001092d6:	48 89 c7             	mov    %rax,%rdi
ffff8000001092d9:	48 b8 82 8b 10 00 00 	movabs $0xffff800000108b82,%rax
ffff8000001092e0:	80 ff ff 
ffff8000001092e3:	ff d0                	callq  *%rax
ffff8000001092e5:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
ffff8000001092ec:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001092f0:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
ffff8000001092f7:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff8000001092fb:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
ffff800000109302:	00 
ffff800000109303:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
ffff80000010930a:	00 
ffff80000010930b:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
ffff800000109312:	00 
ffff800000109313:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
ffff80000010931a:	00 
ffff80000010931b:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
ffff800000109322:	00 
ffff800000109323:	48 b8 75 92 10 00 00 	movabs $0xffff800000109275,%rax
ffff80000010932a:	80 ff ff 
ffff80000010932d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000109331:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
ffff800000109338:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff80000010933f:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff800000109344:	ba 00 00 00 00       	mov    $0x0,%edx
ffff800000109349:	48 89 c7             	mov    %rax,%rdi
ffff80000010934c:	48 b8 5b 8f 10 00 00 	movabs $0xffff800000108f5b,%rax
ffff800000109353:	80 ff ff 
ffff800000109356:	ff d0                	callq  *%rax
ffff800000109358:	c9                   	leaveq 
ffff800000109359:	c3                   	retq   

ffff80000010935a <__switch_to>:
ffff80000010935a:	55                   	push   %rbp
ffff80000010935b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010935e:	53                   	push   %rbx
ffff80000010935f:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109363:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000109367:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff80000010936b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010936f:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109373:	48 8b 00             	mov    (%rax),%rax
ffff800000109376:	48 ba c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rdx
ffff80000010937d:	80 ff ff 
ffff800000109380:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000109384:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff80000010938b:	80 ff ff 
ffff80000010938e:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff800000109392:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff800000109399:	80 ff ff 
ffff80000010939c:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff8000001093a0:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093a7:	80 ff ff 
ffff8000001093aa:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff8000001093ae:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093b5:	80 ff ff 
ffff8000001093b8:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff8000001093bc:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093c3:	80 ff ff 
ffff8000001093c6:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff8000001093ca:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093d1:	80 ff ff 
ffff8000001093d4:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001093d8:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093df:	80 ff ff 
ffff8000001093e2:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff8000001093e6:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093ed:	80 ff ff 
ffff8000001093f0:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff8000001093f4:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001093fb:	80 ff ff 
ffff8000001093fe:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff800000109402:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff800000109409:	80 ff ff 
ffff80000010940c:	48 8b 40 04          	mov    0x4(%rax),%rax
ffff800000109410:	41 52                	push   %r10
ffff800000109412:	41 51                	push   %r9
ffff800000109414:	41 50                	push   %r8
ffff800000109416:	57                   	push   %rdi
ffff800000109417:	49 89 d9             	mov    %rbx,%r9
ffff80000010941a:	4d 89 d8             	mov    %r11,%r8
ffff80000010941d:	48 89 c7             	mov    %rax,%rdi
ffff800000109420:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000109427:	80 ff ff 
ffff80000010942a:	ff d0                	callq  *%rax
ffff80000010942c:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109430:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109434:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109438:	48 8c e0             	mov    %fs,%rax
ffff80000010943b:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff80000010943f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109443:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000109447:	48 8c e8             	mov    %gs,%rax
ffff80000010944a:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff80000010944e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109452:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109456:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010945a:	48 8e e0             	mov    %rax,%fs
ffff80000010945d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109461:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109465:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109469:	48 8e e8             	mov    %rax,%gs
ffff80000010946c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109470:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109474:	48 8b 00             	mov    (%rax),%rax
ffff800000109477:	48 89 c1             	mov    %rax,%rcx
ffff80000010947a:	48 ba d2 28 11 00 00 	movabs $0xffff8000001128d2,%rdx
ffff800000109481:	80 ff ff 
ffff800000109484:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109489:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010948e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109493:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010949a:	80 ff ff 
ffff80000010949d:	41 ff d0             	callq  *%r8
ffff8000001094a0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001094a4:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001094a8:	48 8b 00             	mov    (%rax),%rax
ffff8000001094ab:	48 89 c1             	mov    %rax,%rcx
ffff8000001094ae:	48 ba ee 28 11 00 00 	movabs $0xffff8000001128ee,%rdx
ffff8000001094b5:	80 ff ff 
ffff8000001094b8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001094bd:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001094c2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001094c7:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001094ce:	80 ff ff 
ffff8000001094d1:	41 ff d0             	callq  *%r8
ffff8000001094d4:	90                   	nop
ffff8000001094d5:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001094d9:	c9                   	leaveq 
ffff8000001094da:	c3                   	retq   

ffff8000001094db <task_init>:
ffff8000001094db:	55                   	push   %rbp
ffff8000001094dc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001094df:	41 56                	push   %r14
ffff8000001094e1:	41 55                	push   %r13
ffff8000001094e3:	41 54                	push   %r12
ffff8000001094e5:	53                   	push   %rbx
ffff8000001094e6:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001094ea:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff8000001094f1:	00 
ffff8000001094f2:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff8000001094f9:	80 ff ff 
ffff8000001094fc:	48 8b 00             	mov    (%rax),%rax
ffff8000001094ff:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109506:	80 ff ff 
ffff800000109509:	48 89 02             	mov    %rax,(%rdx)
ffff80000010950c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109513:	80 ff ff 
ffff800000109516:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff80000010951d:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109524:	80 ff ff 
ffff800000109527:	48 89 42 08          	mov    %rax,0x8(%rdx)
ffff80000010952b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109532:	80 ff ff 
ffff800000109535:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
ffff80000010953c:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109543:	80 ff ff 
ffff800000109546:	48 89 42 10          	mov    %rax,0x10(%rdx)
ffff80000010954a:	48 ba 20 98 10 00 00 	movabs $0xffff800000109820,%rdx
ffff800000109551:	80 ff ff 
ffff800000109554:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff80000010955b:	80 ff ff 
ffff80000010955e:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000109562:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109569:	80 ff ff 
ffff80000010956c:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
ffff800000109573:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010957a:	80 ff ff 
ffff80000010957d:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109581:	48 ba 80 19 11 00 00 	movabs $0xffff800000111980,%rdx
ffff800000109588:	80 ff ff 
ffff80000010958b:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000109592:	80 ff ff 
ffff800000109595:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000109599:	48 ba 0a 29 11 00 00 	movabs $0xffff80000011290a,%rdx
ffff8000001095a0:	80 ff ff 
ffff8000001095a3:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095aa:	80 ff ff 
ffff8000001095ad:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff8000001095b1:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095b8:	80 ff ff 
ffff8000001095bb:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff8000001095c2:	00 
ffff8000001095c3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001095ca:	80 ff ff 
ffff8000001095cd:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff8000001095d4:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff8000001095db:	80 ff ff 
ffff8000001095de:	48 89 42 40          	mov    %rax,0x40(%rdx)
ffff8000001095e2:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff8000001095e9:	80 ff ff 
ffff8000001095ec:	48 8b 00             	mov    (%rax),%rax
ffff8000001095ef:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff8000001095f6:	80 ff ff 
ffff8000001095f9:	48 89 42 48          	mov    %rax,0x48(%rdx)
ffff8000001095fd:	be 08 00 00 00       	mov    $0x8,%esi
ffff800000109602:	bf 74 01 00 00       	mov    $0x174,%edi
ffff800000109607:	48 b8 f8 8b 10 00 00 	movabs $0xffff800000108bf8,%rax
ffff80000010960e:	80 ff ff 
ffff800000109611:	ff d0                	callq  *%rax
ffff800000109613:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109618:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff80000010961f:	80 ff ff 
ffff800000109622:	ff d2                	callq  *%rdx
ffff800000109624:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109628:	48 8b 00             	mov    (%rax),%rax
ffff80000010962b:	48 89 c6             	mov    %rax,%rsi
ffff80000010962e:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000109633:	48 b8 f8 8b 10 00 00 	movabs $0xffff800000108bf8,%rax
ffff80000010963a:	80 ff ff 
ffff80000010963d:	ff d0                	callq  *%rax
ffff80000010963f:	48 b8 27 40 10 00 00 	movabs $0xffff800000104027,%rax
ffff800000109646:	80 ff ff 
ffff800000109649:	48 89 c6             	mov    %rax,%rsi
ffff80000010964c:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109651:	48 b8 f8 8b 10 00 00 	movabs $0xffff800000108bf8,%rax
ffff800000109658:	80 ff ff 
ffff80000010965b:	ff d0                	callq  *%rax
ffff80000010965d:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff800000109664:	80 ff ff 
ffff800000109667:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff80000010966b:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff800000109672:	80 ff ff 
ffff800000109675:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff800000109679:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff800000109680:	80 ff ff 
ffff800000109683:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff800000109687:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff80000010968e:	80 ff ff 
ffff800000109691:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff800000109695:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff80000010969c:	80 ff ff 
ffff80000010969f:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff8000001096a3:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001096aa:	80 ff ff 
ffff8000001096ad:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001096b1:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001096b8:	80 ff ff 
ffff8000001096bb:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff8000001096bf:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001096c6:	80 ff ff 
ffff8000001096c9:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff8000001096cd:	48 b8 c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rax
ffff8000001096d4:	80 ff ff 
ffff8000001096d7:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff8000001096db:	48 b8 40 b9 10 00 00 	movabs $0xffff80000010b940,%rax
ffff8000001096e2:	80 ff ff 
ffff8000001096e5:	48 8b 00             	mov    (%rax),%rax
ffff8000001096e8:	41 52                	push   %r10
ffff8000001096ea:	41 51                	push   %r9
ffff8000001096ec:	41 50                	push   %r8
ffff8000001096ee:	57                   	push   %rdi
ffff8000001096ef:	49 89 d9             	mov    %rbx,%r9
ffff8000001096f2:	4d 89 d8             	mov    %r11,%r8
ffff8000001096f5:	48 89 c7             	mov    %rax,%rdi
ffff8000001096f8:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff8000001096ff:	80 ff ff 
ffff800000109702:	ff d0                	callq  *%rax
ffff800000109704:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109708:	48 b8 40 b9 10 00 00 	movabs $0xffff80000010b940,%rax
ffff80000010970f:	80 ff ff 
ffff800000109712:	48 8b 00             	mov    (%rax),%rax
ffff800000109715:	48 ba c0 b9 10 00 00 	movabs $0xffff80000010b9c0,%rdx
ffff80000010971c:	80 ff ff 
ffff80000010971f:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000109723:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff80000010972a:	80 ff ff 
ffff80000010972d:	48 b8 9d 8a 10 00 00 	movabs $0xffff800000108a9d,%rax
ffff800000109734:	80 ff ff 
ffff800000109737:	ff d0                	callq  *%rax
ffff800000109739:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010973e:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109743:	48 bf 65 8e 10 00 00 	movabs $0xffff800000108e65,%rdi
ffff80000010974a:	80 ff ff 
ffff80000010974d:	48 b8 a5 92 10 00 00 	movabs $0xffff8000001092a5,%rax
ffff800000109754:	80 ff ff 
ffff800000109757:	ff d0                	callq  *%rax
ffff800000109759:	48 b8 00 80 11 00 00 	movabs $0xffff800000118000,%rax
ffff800000109760:	80 ff ff 
ffff800000109763:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff80000010976a:	00 
ffff80000010976b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109770:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff800000109777:	80 ff ff 
ffff80000010977a:	ff d2                	callq  *%rdx
ffff80000010977c:	48 89 c7             	mov    %rax,%rdi
ffff80000010977f:	48 b8 02 8b 10 00 00 	movabs $0xffff800000108b02,%rax
ffff800000109786:	80 ff ff 
ffff800000109789:	ff d0                	callq  *%rax
ffff80000010978b:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff80000010978f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000109793:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000109797:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010979c:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff8000001097a3:	80 ff ff 
ffff8000001097a6:	ff d2                	callq  *%rdx
ffff8000001097a8:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001097ac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097b1:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff8000001097b8:	80 ff ff 
ffff8000001097bb:	ff d2                	callq  *%rdx
ffff8000001097bd:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff8000001097c1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097c5:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff8000001097c9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097cd:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff8000001097d1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097d6:	48 ba 1e 8c 10 00 00 	movabs $0xffff800000108c1e,%rdx
ffff8000001097dd:	80 ff ff 
ffff8000001097e0:	ff d2                	callq  *%rdx
ffff8000001097e2:	48 89 c2             	mov    %rax,%rdx
ffff8000001097e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001097e9:	48 89 d7             	mov    %rdx,%rdi
ffff8000001097ec:	48 89 c6             	mov    %rax,%rsi
ffff8000001097ef:	55                   	push   %rbp
ffff8000001097f0:	50                   	push   %rax
ffff8000001097f1:	48 89 63 10          	mov    %rsp,0x10(%rbx)
ffff8000001097f5:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff8000001097fa:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010980e <task_init+0x333>
ffff800000109801:	49 89 46 08          	mov    %rax,0x8(%r14)
ffff800000109805:	41 ff 75 08          	pushq  0x8(%r13)
ffff800000109809:	e9 4c fb ff ff       	jmpq   ffff80000010935a <__switch_to>
ffff80000010980e:	58                   	pop    %rax
ffff80000010980f:	5d                   	pop    %rbp
ffff800000109810:	90                   	nop
ffff800000109811:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
ffff800000109815:	5b                   	pop    %rbx
ffff800000109816:	41 5c                	pop    %r12
ffff800000109818:	41 5d                	pop    %r13
ffff80000010981a:	41 5e                	pop    %r14
ffff80000010981c:	5d                   	pop    %rbp
ffff80000010981d:	c3                   	retq   

Disassembly of section .data:

ffff800000109820 <GDT_Table>:
	...
ffff80000010982c:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
ffff800000109832:	00 00                	add    %al,(%rax)
ffff800000109834:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
ffff80000010984a:	00 00                	add    %al,(%rax)
ffff80000010984c:	00 f8                	add    %bh,%al
ffff80000010984e:	20 00                	and    %al,(%rax)
ffff800000109850:	00 00                	add    %al,(%rax)
ffff800000109852:	00 00                	add    %al,(%rax)
ffff800000109854:	00 f2                	add    %dh,%dl
ffff800000109856:	00 00                	add    %al,(%rax)
ffff800000109858:	ff                   	(bad)  
ffff800000109859:	ff 00                	incl   (%rax)
ffff80000010985b:	00 00                	add    %al,(%rax)
ffff80000010985d:	9a                   	(bad)  
ffff80000010985e:	cf                   	iret   
ffff80000010985f:	00 ff                	add    %bh,%bh
ffff800000109861:	ff 00                	incl   (%rax)
ffff800000109863:	00 00                	add    %al,(%rax)
ffff800000109865:	92                   	xchg   %eax,%edx
ffff800000109866:	cf                   	iret   
	...

ffff8000001098b8 <GDT_END>:
ffff8000001098b8:	97                   	xchg   %eax,%edi
	...

ffff8000001098ba <GDT_BASE>:
ffff8000001098ba:	20 98 10 00 00 80    	and    %bl,-0x7ffffff0(%rax)
ffff8000001098c0:	ff                   	(bad)  
ffff8000001098c1:	ff                 	incl   (%rax)

ffff8000001098c2 <IDT_Table>:
	...

ffff80000010a8c2 <IDT_END>:
ffff80000010a8c2:	ff 0f                	decl   (%rdi)

ffff80000010a8c4 <IDT_BASE>:
ffff80000010a8c4:	c2 98 10             	retq   $0x1098
ffff80000010a8c7:	00 00                	add    %al,(%rax)
ffff80000010a8c9:	80 ff ff             	cmp    $0xff,%bh

ffff80000010a8cc <TSS64_Table>:
	...

ffff80000010a934 <TSS64_END>:
ffff80000010a934:	67 00              	addr32 add %cl,%ah

ffff80000010a936 <TSS64_BASE>:
ffff80000010a936:	cc                   	int3   
ffff80000010a937:	a8 10                	test   $0x10,%al
ffff80000010a939:	00 00                	add    %al,(%rax)
ffff80000010a93b:	80 ff ff             	cmp    $0xff,%bh
	...

ffff80000010a940 <font_ascii>:
	...
ffff80000010ab50:	00 10                	add    %dl,(%rax)
ffff80000010ab52:	10 10                	adc    %dl,(%rax)
ffff80000010ab54:	10 10                	adc    %dl,(%rax)
ffff80000010ab56:	10 10                	adc    %dl,(%rax)
ffff80000010ab58:	10 10                	adc    %dl,(%rax)
ffff80000010ab5a:	00 00                	add    %al,(%rax)
ffff80000010ab5c:	10 10                	adc    %dl,(%rax)
ffff80000010ab5e:	00 00                	add    %al,(%rax)
ffff80000010ab60:	28 28                	sub    %ch,(%rax)
ffff80000010ab62:	28 00                	sub    %al,(%rax)
	...
ffff80000010ab70:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010ab74:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010ab78:	44                   	rex.R
ffff80000010ab79:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010ab7e:	00 00                	add    %al,(%rax)
ffff80000010ab80:	10 3a                	adc    %bh,(%rdx)
ffff80000010ab82:	56                   	push   %rsi
ffff80000010ab83:	92                   	xchg   %eax,%edx
ffff80000010ab84:	92                   	xchg   %eax,%edx
ffff80000010ab85:	90                   	nop
ffff80000010ab86:	50                   	push   %rax
ffff80000010ab87:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010ab8a:	92                   	xchg   %eax,%edx
ffff80000010ab8b:	92                   	xchg   %eax,%edx
ffff80000010ab8c:	d4                   	(bad)  
ffff80000010ab8d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010ab92:	94                   	xchg   %eax,%esp
ffff80000010ab93:	94                   	xchg   %eax,%esp
ffff80000010ab94:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010ab99:	2c 52                	sub    $0x52,%al
ffff80000010ab9b:	52                   	push   %rdx
ffff80000010ab9c:	92                   	xchg   %eax,%edx
ffff80000010ab9d:	8c 00                	mov    %es,(%rax)
ffff80000010ab9f:	00 00                	add    %al,(%rax)
ffff80000010aba1:	70 88                	jo     ffff80000010ab2b <font_ascii+0x1eb>
ffff80000010aba3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010aba9:	92                   	xchg   %eax,%edx
ffff80000010abaa:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010abb1:	08 10                	or     %dl,(%rax)
	...
ffff80000010abbf:	00 02                	add    %al,(%rdx)
ffff80000010abc1:	04 08                	add    $0x8,%al
ffff80000010abc3:	08 10                	or     %dl,(%rax)
ffff80000010abc5:	10 10                	adc    %dl,(%rax)
ffff80000010abc7:	10 10                	adc    %dl,(%rax)
ffff80000010abc9:	10 10                	adc    %dl,(%rax)
ffff80000010abcb:	08 08                	or     %cl,(%rax)
ffff80000010abcd:	04 02                	add    $0x2,%al
ffff80000010abcf:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010abd5:	10 10                	adc    %dl,(%rax)
ffff80000010abd7:	10 10                	adc    %dl,(%rax)
ffff80000010abd9:	10 10                	adc    %dl,(%rax)
ffff80000010abdb:	20 20                	and    %ah,(%rax)
ffff80000010abdd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010abe1:	00 00                	add    %al,(%rax)
ffff80000010abe3:	00 00                	add    %al,(%rax)
ffff80000010abe5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010abeb:	10 00                	adc    %al,(%rax)
	...
ffff80000010abf5:	10 10                	adc    %dl,(%rax)
ffff80000010abf7:	10 fe                	adc    %bh,%dh
ffff80000010abf9:	10 10                	adc    %dl,(%rax)
ffff80000010abfb:	10 00                	adc    %al,(%rax)
	...
ffff80000010ac09:	00 00                	add    %al,(%rax)
ffff80000010ac0b:	18 18                	sbb    %bl,(%rax)
ffff80000010ac0d:	08 08                	or     %cl,(%rax)
ffff80000010ac0f:	10 00                	adc    %al,(%rax)
ffff80000010ac11:	00 00                	add    %al,(%rax)
ffff80000010ac13:	00 00                	add    %al,(%rax)
ffff80000010ac15:	00 00                	add    %al,(%rax)
ffff80000010ac17:	00 fe                	add    %bh,%dh
	...
ffff80000010ac29:	00 00                	add    %al,(%rax)
ffff80000010ac2b:	00 18                	add    %bl,(%rax)
ffff80000010ac2d:	18 00                	sbb    %al,(%rax)
ffff80000010ac2f:	00 02                	add    %al,(%rdx)
ffff80000010ac31:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010ac34:	08 08                	or     %cl,(%rax)
ffff80000010ac36:	08 10                	or     %dl,(%rax)
ffff80000010ac38:	10 20                	adc    %ah,(%rax)
ffff80000010ac3a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ac3d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010ac44:	42 
ffff80000010ac45:	42                   	rex.X
ffff80000010ac46:	42                   	rex.X
ffff80000010ac47:	42                   	rex.X
ffff80000010ac48:	42                   	rex.X
ffff80000010ac49:	42                   	rex.X
ffff80000010ac4a:	42 24 24             	rex.X and $0x24,%al
ffff80000010ac4d:	18 00                	sbb    %al,(%rax)
ffff80000010ac4f:	00 00                	add    %al,(%rax)
ffff80000010ac51:	08 18                	or     %bl,(%rax)
ffff80000010ac53:	28 08                	sub    %cl,(%rax)
ffff80000010ac55:	08 08                	or     %cl,(%rax)
ffff80000010ac57:	08 08                	or     %cl,(%rax)
ffff80000010ac59:	08 08                	or     %cl,(%rax)
ffff80000010ac5b:	08 08                	or     %cl,(%rax)
ffff80000010ac5d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010ac60:	00 18                	add    %bl,(%rax)
ffff80000010ac62:	24 42                	and    $0x42,%al
ffff80000010ac64:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010ac68:	10 20                	adc    %ah,(%rax)
ffff80000010ac6a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ac6d:	7e 00                	jle    ffff80000010ac6f <font_ascii+0x32f>
ffff80000010ac6f:	00 00                	add    %al,(%rax)
ffff80000010ac71:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010ac74:	02 02                	add    (%rdx),%al
ffff80000010ac76:	04 18                	add    $0x18,%al
ffff80000010ac78:	04 02                	add    $0x2,%al
ffff80000010ac7a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010ac7d:	18 00                	sbb    %al,(%rax)
ffff80000010ac7f:	00 00                	add    %al,(%rax)
ffff80000010ac81:	0c 0c                	or     $0xc,%al
ffff80000010ac83:	0c 14                	or     $0x14,%al
ffff80000010ac85:	14 14                	adc    $0x14,%al
ffff80000010ac87:	24 24                	and    $0x24,%al
ffff80000010ac89:	44 7e 04             	rex.R jle ffff80000010ac90 <font_ascii+0x350>
ffff80000010ac8c:	04 1e                	add    $0x1e,%al
ffff80000010ac8e:	00 00                	add    %al,(%rax)
ffff80000010ac90:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010ac94:	40 58                	rex pop %rax
ffff80000010ac96:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010ac99:	02 02                	add    (%rdx),%al
ffff80000010ac9b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ac9e:	00 00                	add    %al,(%rax)
ffff80000010aca0:	00 18                	add    %bl,(%rax)
ffff80000010aca2:	24 42                	and    $0x42,%al
ffff80000010aca4:	40 58                	rex pop %rax
ffff80000010aca6:	64 42                	fs rex.X
ffff80000010aca8:	42                   	rex.X
ffff80000010aca9:	42                   	rex.X
ffff80000010acaa:	42                   	rex.X
ffff80000010acab:	42 24 18             	rex.X and $0x18,%al
ffff80000010acae:	00 00                	add    %al,(%rax)
ffff80000010acb0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010acb3:	42 04 04             	rex.X add $0x4,%al
ffff80000010acb6:	08 08                	or     %cl,(%rax)
ffff80000010acb8:	08 10                	or     %dl,(%rax)
ffff80000010acba:	10 10                	adc    %dl,(%rax)
ffff80000010acbc:	10 38                	adc    %bh,(%rax)
ffff80000010acbe:	00 00                	add    %al,(%rax)
ffff80000010acc0:	00 18                	add    %bl,(%rax)
ffff80000010acc2:	24 42                	and    $0x42,%al
ffff80000010acc4:	42                   	rex.X
ffff80000010acc5:	42 24 18             	rex.X and $0x18,%al
ffff80000010acc8:	24 42                	and    $0x42,%al
ffff80000010acca:	42                   	rex.X
ffff80000010accb:	42 24 18             	rex.X and $0x18,%al
ffff80000010acce:	00 00                	add    %al,(%rax)
ffff80000010acd0:	00 18                	add    %bl,(%rax)
ffff80000010acd2:	24 42                	and    $0x42,%al
ffff80000010acd4:	42                   	rex.X
ffff80000010acd5:	42                   	rex.X
ffff80000010acd6:	42                   	rex.X
ffff80000010acd7:	42                   	rex.X
ffff80000010acd8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010acdb:	42 24 18             	rex.X and $0x18,%al
ffff80000010acde:	00 00                	add    %al,(%rax)
ffff80000010ace0:	00 00                	add    %al,(%rax)
ffff80000010ace2:	00 00                	add    %al,(%rax)
ffff80000010ace4:	00 18                	add    %bl,(%rax)
ffff80000010ace6:	18 00                	sbb    %al,(%rax)
ffff80000010ace8:	00 00                	add    %al,(%rax)
ffff80000010acea:	00 00                	add    %al,(%rax)
ffff80000010acec:	18 18                	sbb    %bl,(%rax)
ffff80000010acee:	00 00                	add    %al,(%rax)
ffff80000010acf0:	00 00                	add    %al,(%rax)
ffff80000010acf2:	00 00                	add    %al,(%rax)
ffff80000010acf4:	00 18                	add    %bl,(%rax)
ffff80000010acf6:	18 00                	sbb    %al,(%rax)
ffff80000010acf8:	00 00                	add    %al,(%rax)
ffff80000010acfa:	00 18                	add    %bl,(%rax)
ffff80000010acfc:	18 08                	sbb    %cl,(%rax)
ffff80000010acfe:	08 10                	or     %dl,(%rax)
ffff80000010ad00:	00 02                	add    %al,(%rdx)
ffff80000010ad02:	04 08                	add    $0x8,%al
ffff80000010ad04:	10 20                	adc    %ah,(%rax)
ffff80000010ad06:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ad0d:	04 
ffff80000010ad0e:	02 00                	add    (%rax),%al
ffff80000010ad10:	00 00                	add    %al,(%rax)
ffff80000010ad12:	00 00                	add    %al,(%rax)
ffff80000010ad14:	00 00                	add    %al,(%rax)
ffff80000010ad16:	fe 00                	incb   (%rax)
ffff80000010ad18:	00 fe                	add    %bh,%dh
ffff80000010ad1a:	00 00                	add    %al,(%rax)
ffff80000010ad1c:	00 00                	add    %al,(%rax)
ffff80000010ad1e:	00 00                	add    %al,(%rax)
ffff80000010ad20:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ad26:	04 02                	add    $0x2,%al
ffff80000010ad28:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ad2b:	10 20                	adc    %ah,(%rax)
ffff80000010ad2d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ad31:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ad35:	82                   	(bad)  
ffff80000010ad36:	04 08                	add    $0x8,%al
ffff80000010ad38:	10 10                	adc    %dl,(%rax)
ffff80000010ad3a:	00 00                	add    %al,(%rax)
ffff80000010ad3c:	18 18                	sbb    %bl,(%rax)
ffff80000010ad3e:	00 00                	add    %al,(%rax)
ffff80000010ad40:	00 38                	add    %bh,(%rax)
ffff80000010ad42:	44 82                	rex.R (bad) 
ffff80000010ad44:	9a                   	(bad)  
ffff80000010ad45:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad46:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad47:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad48:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad49:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ad4a:	9c                   	pushfq 
ffff80000010ad4b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010ad4f:	00 00                	add    %al,(%rax)
ffff80000010ad51:	18 18                	sbb    %bl,(%rax)
ffff80000010ad53:	18 18                	sbb    %bl,(%rax)
ffff80000010ad55:	24 24                	and    $0x24,%al
ffff80000010ad57:	24 24                	and    $0x24,%al
ffff80000010ad59:	7e 42                	jle    ffff80000010ad9d <font_ascii+0x45d>
ffff80000010ad5b:	42                   	rex.X
ffff80000010ad5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ad5f:	00 00                	add    %al,(%rax)
ffff80000010ad61:	f0 48                	lock rex.W
ffff80000010ad63:	44                   	rex.R
ffff80000010ad64:	44                   	rex.R
ffff80000010ad65:	44                   	rex.R
ffff80000010ad66:	48 78 44             	rex.W js ffff80000010adad <font_ascii+0x46d>
ffff80000010ad69:	42                   	rex.X
ffff80000010ad6a:	42                   	rex.X
ffff80000010ad6b:	42                   	rex.X
ffff80000010ad6c:	44 f8                	rex.R clc 
ffff80000010ad6e:	00 00                	add    %al,(%rax)
ffff80000010ad70:	00 3a                	add    %bh,(%rdx)
ffff80000010ad72:	46                   	rex.RX
ffff80000010ad73:	42 82                	rex.X (bad) 
ffff80000010ad75:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010ad7c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ad7f:	00 00                	add    %al,(%rax)
ffff80000010ad81:	f8                   	clc    
ffff80000010ad82:	44                   	rex.R
ffff80000010ad83:	44                   	rex.R
ffff80000010ad84:	42                   	rex.X
ffff80000010ad85:	42                   	rex.X
ffff80000010ad86:	42                   	rex.X
ffff80000010ad87:	42                   	rex.X
ffff80000010ad88:	42                   	rex.X
ffff80000010ad89:	42                   	rex.X
ffff80000010ad8a:	42                   	rex.X
ffff80000010ad8b:	44                   	rex.R
ffff80000010ad8c:	44 f8                	rex.R clc 
ffff80000010ad8e:	00 00                	add    %al,(%rax)
ffff80000010ad90:	00 fe                	add    %bh,%dh
ffff80000010ad92:	42                   	rex.X
ffff80000010ad93:	42                   	rex.X
ffff80000010ad94:	40                   	rex
ffff80000010ad95:	40                   	rex
ffff80000010ad96:	44 7c 44             	rex.R jl ffff80000010addd <font_ascii+0x49d>
ffff80000010ad99:	40                   	rex
ffff80000010ad9a:	40                   	rex
ffff80000010ad9b:	42                   	rex.X
ffff80000010ad9c:	42 fe 00             	rex.X incb (%rax)
ffff80000010ad9f:	00 00                	add    %al,(%rax)
ffff80000010ada1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010ada4:	40                   	rex
ffff80000010ada5:	40                   	rex
ffff80000010ada6:	44 7c 44             	rex.R jl ffff80000010aded <font_ascii+0x4ad>
ffff80000010ada9:	44                   	rex.R
ffff80000010adaa:	40                   	rex
ffff80000010adab:	40                   	rex
ffff80000010adac:	40                   	rex
ffff80000010adad:	f0 00 00             	lock add %al,(%rax)
ffff80000010adb0:	00 3a                	add    %bh,(%rdx)
ffff80000010adb2:	46                   	rex.RX
ffff80000010adb3:	42 82                	rex.X (bad) 
ffff80000010adb5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010adbc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010adbf:	00 00                	add    %al,(%rax)
ffff80000010adc1:	e7 42                	out    %eax,$0x42
ffff80000010adc3:	42                   	rex.X
ffff80000010adc4:	42                   	rex.X
ffff80000010adc5:	42                   	rex.X
ffff80000010adc6:	42 7e 42             	rex.X jle ffff80000010ae0b <font_ascii+0x4cb>
ffff80000010adc9:	42                   	rex.X
ffff80000010adca:	42                   	rex.X
ffff80000010adcb:	42                   	rex.X
ffff80000010adcc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010adcf:	00 00                	add    %al,(%rax)
ffff80000010add1:	7c 10                	jl     ffff80000010ade3 <font_ascii+0x4a3>
ffff80000010add3:	10 10                	adc    %dl,(%rax)
ffff80000010add5:	10 10                	adc    %dl,(%rax)
ffff80000010add7:	10 10                	adc    %dl,(%rax)
ffff80000010add9:	10 10                	adc    %dl,(%rax)
ffff80000010addb:	10 10                	adc    %dl,(%rax)
ffff80000010addd:	7c 00                	jl     ffff80000010addf <font_ascii+0x49f>
ffff80000010addf:	00 00                	add    %al,(%rax)
ffff80000010ade1:	1f                   	(bad)  
ffff80000010ade2:	04 04                	add    $0x4,%al
ffff80000010ade4:	04 04                	add    $0x4,%al
ffff80000010ade6:	04 04                	add    $0x4,%al
ffff80000010ade8:	04 04                	add    $0x4,%al
ffff80000010adea:	04 04                	add    $0x4,%al
ffff80000010adec:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010adef:	00 00                	add    %al,(%rax)
ffff80000010adf1:	e7 42                	out    %eax,$0x42
ffff80000010adf3:	44                   	rex.R
ffff80000010adf4:	48 50                	rex.W push %rax
ffff80000010adf6:	50                   	push   %rax
ffff80000010adf7:	60                   	(bad)  
ffff80000010adf8:	50                   	push   %rax
ffff80000010adf9:	50                   	push   %rax
ffff80000010adfa:	48                   	rex.W
ffff80000010adfb:	44                   	rex.R
ffff80000010adfc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010adff:	00 00                	add    %al,(%rax)
ffff80000010ae01:	f0 40                	lock rex
ffff80000010ae03:	40                   	rex
ffff80000010ae04:	40                   	rex
ffff80000010ae05:	40                   	rex
ffff80000010ae06:	40                   	rex
ffff80000010ae07:	40                   	rex
ffff80000010ae08:	40                   	rex
ffff80000010ae09:	40                   	rex
ffff80000010ae0a:	40                   	rex
ffff80000010ae0b:	42                   	rex.X
ffff80000010ae0c:	42 fe 00             	rex.X incb (%rax)
ffff80000010ae0f:	00 00                	add    %al,(%rax)
ffff80000010ae11:	c3                   	retq   
ffff80000010ae12:	42                   	rex.X
ffff80000010ae13:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010ae17:	5a                   	pop    %rdx
ffff80000010ae18:	5a                   	pop    %rdx
ffff80000010ae19:	42                   	rex.X
ffff80000010ae1a:	42                   	rex.X
ffff80000010ae1b:	42                   	rex.X
ffff80000010ae1c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae1f:	00 00                	add    %al,(%rax)
ffff80000010ae21:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010ae28:	4a                   	rex.WX
ffff80000010ae29:	4a                   	rex.WX
ffff80000010ae2a:	4a                   	rex.WX
ffff80000010ae2b:	46                   	rex.RX
ffff80000010ae2c:	46 e2 00             	rex.RX loop ffff80000010ae2f <font_ascii+0x4ef>
ffff80000010ae2f:	00 00                	add    %al,(%rax)
ffff80000010ae31:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ae35:	82                   	(bad)  
ffff80000010ae36:	82                   	(bad)  
ffff80000010ae37:	82                   	(bad)  
ffff80000010ae38:	82                   	(bad)  
ffff80000010ae39:	82                   	(bad)  
ffff80000010ae3a:	82                   	(bad)  
ffff80000010ae3b:	82                   	(bad)  
ffff80000010ae3c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ae3f:	00 00                	add    %al,(%rax)
ffff80000010ae41:	f8                   	clc    
ffff80000010ae42:	44                   	rex.R
ffff80000010ae43:	42                   	rex.X
ffff80000010ae44:	42                   	rex.X
ffff80000010ae45:	42                   	rex.X
ffff80000010ae46:	44 78 40             	rex.R js ffff80000010ae89 <font_ascii+0x549>
ffff80000010ae49:	40                   	rex
ffff80000010ae4a:	40                   	rex
ffff80000010ae4b:	40                   	rex
ffff80000010ae4c:	40                   	rex
ffff80000010ae4d:	f0 00 00             	lock add %al,(%rax)
ffff80000010ae50:	00 38                	add    %bh,(%rax)
ffff80000010ae52:	44 82                	rex.R (bad) 
ffff80000010ae54:	82                   	(bad)  
ffff80000010ae55:	82                   	(bad)  
ffff80000010ae56:	82                   	(bad)  
ffff80000010ae57:	82                   	(bad)  
ffff80000010ae58:	82                   	(bad)  
ffff80000010ae59:	82                   	(bad)  
ffff80000010ae5a:	92                   	xchg   %eax,%edx
ffff80000010ae5b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010ae5f:	00 00                	add    %al,(%rax)
ffff80000010ae61:	fc                   	cld    
ffff80000010ae62:	42                   	rex.X
ffff80000010ae63:	42                   	rex.X
ffff80000010ae64:	42                   	rex.X
ffff80000010ae65:	42 7c 44             	rex.X jl ffff80000010aeac <font_ascii+0x56c>
ffff80000010ae68:	42                   	rex.X
ffff80000010ae69:	42                   	rex.X
ffff80000010ae6a:	42                   	rex.X
ffff80000010ae6b:	42                   	rex.X
ffff80000010ae6c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae6f:	00 00                	add    %al,(%rax)
ffff80000010ae71:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010ae74:	82                   	(bad)  
ffff80000010ae75:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010ae79:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010ae7f:	00 00                	add    %al,(%rax)
ffff80000010ae81:	fe                   	(bad)  
ffff80000010ae82:	92                   	xchg   %eax,%edx
ffff80000010ae83:	92                   	xchg   %eax,%edx
ffff80000010ae84:	10 10                	adc    %dl,(%rax)
ffff80000010ae86:	10 10                	adc    %dl,(%rax)
ffff80000010ae88:	10 10                	adc    %dl,(%rax)
ffff80000010ae8a:	10 10                	adc    %dl,(%rax)
ffff80000010ae8c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010ae90:	00 e7                	add    %ah,%bh
ffff80000010ae92:	42                   	rex.X
ffff80000010ae93:	42                   	rex.X
ffff80000010ae94:	42                   	rex.X
ffff80000010ae95:	42                   	rex.X
ffff80000010ae96:	42                   	rex.X
ffff80000010ae97:	42                   	rex.X
ffff80000010ae98:	42                   	rex.X
ffff80000010ae99:	42                   	rex.X
ffff80000010ae9a:	42                   	rex.X
ffff80000010ae9b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010ae9e:	00 00                	add    %al,(%rax)
ffff80000010aea0:	00 e7                	add    %ah,%bh
ffff80000010aea2:	42                   	rex.X
ffff80000010aea3:	42                   	rex.X
ffff80000010aea4:	42                   	rex.X
ffff80000010aea5:	42 24 24             	rex.X and $0x24,%al
ffff80000010aea8:	24 24                	and    $0x24,%al
ffff80000010aeaa:	18 18                	sbb    %bl,(%rax)
ffff80000010aeac:	18 18                	sbb    %bl,(%rax)
ffff80000010aeae:	00 00                	add    %al,(%rax)
ffff80000010aeb0:	00 e7                	add    %ah,%bh
ffff80000010aeb2:	42                   	rex.X
ffff80000010aeb3:	42                   	rex.X
ffff80000010aeb4:	42 5a                	rex.X pop %rdx
ffff80000010aeb6:	5a                   	pop    %rdx
ffff80000010aeb7:	5a                   	pop    %rdx
ffff80000010aeb8:	5a                   	pop    %rdx
ffff80000010aeb9:	24 24                	and    $0x24,%al
ffff80000010aebb:	24 24                	and    $0x24,%al
ffff80000010aebd:	24 00                	and    $0x0,%al
ffff80000010aebf:	00 00                	add    %al,(%rax)
ffff80000010aec1:	e7 42                	out    %eax,$0x42
ffff80000010aec3:	42 24 24             	rex.X and $0x24,%al
ffff80000010aec6:	24 18                	and    $0x18,%al
ffff80000010aec8:	24 24                	and    $0x24,%al
ffff80000010aeca:	24 42                	and    $0x42,%al
ffff80000010aecc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010aecf:	00 00                	add    %al,(%rax)
ffff80000010aed1:	ee                   	out    %al,(%dx)
ffff80000010aed2:	44                   	rex.R
ffff80000010aed3:	44                   	rex.R
ffff80000010aed4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010aed7:	28 10                	sub    %dl,(%rax)
ffff80000010aed9:	10 10                	adc    %dl,(%rax)
ffff80000010aedb:	10 10                	adc    %dl,(%rax)
ffff80000010aedd:	7c 00                	jl     ffff80000010aedf <font_ascii+0x59f>
ffff80000010aedf:	00 00                	add    %al,(%rax)
ffff80000010aee1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010aee8:	20 20                	and    %ah,(%rax)
ffff80000010aeea:	40                   	rex
ffff80000010aeeb:	42 82                	rex.X (bad) 
ffff80000010aeed:	fe 00                	incb   (%rax)
ffff80000010aeef:	00 00                	add    %al,(%rax)
ffff80000010aef1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010aef4:	20 20                	and    %ah,(%rax)
ffff80000010aef6:	20 20                	and    %ah,(%rax)
ffff80000010aef8:	20 20                	and    %ah,(%rax)
ffff80000010aefa:	20 20                	and    %ah,(%rax)
ffff80000010aefc:	20 20                	and    %ah,(%rax)
ffff80000010aefe:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010af05:	20 20                	and    %ah,(%rax)
ffff80000010af07:	10 10                	adc    %dl,(%rax)
ffff80000010af09:	08 08                	or     %cl,(%rax)
ffff80000010af0b:	04 04                	add    $0x4,%al
ffff80000010af0d:	04 02                	add    $0x2,%al
ffff80000010af0f:	02 00                	add    (%rax),%al
ffff80000010af11:	7c 04                	jl     ffff80000010af17 <font_ascii+0x5d7>
ffff80000010af13:	04 04                	add    $0x4,%al
ffff80000010af15:	04 04                	add    $0x4,%al
ffff80000010af17:	04 04                	add    $0x4,%al
ffff80000010af19:	04 04                	add    $0x4,%al
ffff80000010af1b:	04 04                	add    $0x4,%al
ffff80000010af1d:	04 7c                	add    $0x7c,%al
ffff80000010af1f:	00 00                	add    %al,(%rax)
ffff80000010af21:	10 28                	adc    %ch,(%rax)
ffff80000010af23:	44 82                	rex.R (bad) 
	...
ffff80000010af3d:	00 fe                	add    %bh,%dh
ffff80000010af3f:	00 10                	add    %dl,(%rax)
ffff80000010af41:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010af54:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010af57:	04 3c                	add    $0x3c,%al
ffff80000010af59:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010af60:	c0 
ffff80000010af61:	40                   	rex
ffff80000010af62:	40                   	rex
ffff80000010af63:	40                   	rex
ffff80000010af64:	40 58                	rex pop %rax
ffff80000010af66:	64 42                	fs rex.X
ffff80000010af68:	42                   	rex.X
ffff80000010af69:	42                   	rex.X
ffff80000010af6a:	42                   	rex.X
ffff80000010af6b:	42                   	rex.X
ffff80000010af6c:	64 58                	fs pop %rax
ffff80000010af6e:	00 00                	add    %al,(%rax)
ffff80000010af70:	00 00                	add    %al,(%rax)
ffff80000010af72:	00 00                	add    %al,(%rax)
ffff80000010af74:	00 30                	add    %dh,(%rax)
ffff80000010af76:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010af7d:	38 
ffff80000010af7e:	00 00                	add    %al,(%rax)
ffff80000010af80:	0c 04                	or     $0x4,%al
ffff80000010af82:	04 04                	add    $0x4,%al
ffff80000010af84:	04 34                	add    $0x34,%al
ffff80000010af86:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010af8d:	36 
ffff80000010af8e:	00 00                	add    %al,(%rax)
ffff80000010af90:	00 00                	add    %al,(%rax)
ffff80000010af92:	00 00                	add    %al,(%rax)
ffff80000010af94:	00 38                	add    %bh,(%rax)
ffff80000010af96:	44 82                	rex.R (bad) 
ffff80000010af98:	82                   	(bad)  
ffff80000010af99:	fc                   	cld    
ffff80000010af9a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010afa1:	10 10                	adc    %dl,(%rax)
ffff80000010afa3:	10 10                	adc    %dl,(%rax)
ffff80000010afa5:	7c 10                	jl     ffff80000010afb7 <font_ascii+0x677>
ffff80000010afa7:	10 10                	adc    %dl,(%rax)
ffff80000010afa9:	10 10                	adc    %dl,(%rax)
ffff80000010afab:	10 10                	adc    %dl,(%rax)
ffff80000010afad:	7c 00                	jl     ffff80000010afaf <font_ascii+0x66f>
ffff80000010afaf:	00 00                	add    %al,(%rax)
ffff80000010afb1:	00 00                	add    %al,(%rax)
ffff80000010afb3:	00 00                	add    %al,(%rax)
ffff80000010afb5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010afbc:	34 04 
ffff80000010afbe:	04 38                	add    $0x38,%al
ffff80000010afc0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010afc4:	40 58                	rex pop %rax
ffff80000010afc6:	64 42                	fs rex.X
ffff80000010afc8:	42                   	rex.X
ffff80000010afc9:	42                   	rex.X
ffff80000010afca:	42                   	rex.X
ffff80000010afcb:	42                   	rex.X
ffff80000010afcc:	42 e3 00             	rex.X jrcxz ffff80000010afcf <font_ascii+0x68f>
ffff80000010afcf:	00 00                	add    %al,(%rax)
ffff80000010afd1:	10 10                	adc    %dl,(%rax)
ffff80000010afd3:	00 00                	add    %al,(%rax)
ffff80000010afd5:	30 10                	xor    %dl,(%rax)
ffff80000010afd7:	10 10                	adc    %dl,(%rax)
ffff80000010afd9:	10 10                	adc    %dl,(%rax)
ffff80000010afdb:	10 10                	adc    %dl,(%rax)
ffff80000010afdd:	38 00                	cmp    %al,(%rax)
ffff80000010afdf:	00 00                	add    %al,(%rax)
ffff80000010afe1:	04 04                	add    $0x4,%al
ffff80000010afe3:	00 00                	add    %al,(%rax)
ffff80000010afe5:	0c 04                	or     $0x4,%al
ffff80000010afe7:	04 04                	add    $0x4,%al
ffff80000010afe9:	04 04                	add    $0x4,%al
ffff80000010afeb:	04 04                	add    $0x4,%al
ffff80000010afed:	08 08                	or     %cl,(%rax)
ffff80000010afef:	30 c0                	xor    %al,%al
ffff80000010aff1:	40                   	rex
ffff80000010aff2:	40                   	rex
ffff80000010aff3:	40                   	rex
ffff80000010aff4:	40                   	rex
ffff80000010aff5:	4e                   	rex.WRX
ffff80000010aff6:	44                   	rex.R
ffff80000010aff7:	48 50                	rex.W push %rax
ffff80000010aff9:	60                   	(bad)  
ffff80000010affa:	50                   	push   %rax
ffff80000010affb:	48                   	rex.W
ffff80000010affc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010afff:	00 30                	add    %dh,(%rax)
ffff80000010b001:	10 10                	adc    %dl,(%rax)
ffff80000010b003:	10 10                	adc    %dl,(%rax)
ffff80000010b005:	10 10                	adc    %dl,(%rax)
ffff80000010b007:	10 10                	adc    %dl,(%rax)
ffff80000010b009:	10 10                	adc    %dl,(%rax)
ffff80000010b00b:	10 10                	adc    %dl,(%rax)
ffff80000010b00d:	38 00                	cmp    %al,(%rax)
ffff80000010b00f:	00 00                	add    %al,(%rax)
ffff80000010b011:	00 00                	add    %al,(%rax)
ffff80000010b013:	00 00                	add    %al,(%rax)
ffff80000010b015:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b019:	49                   	rex.WB
ffff80000010b01a:	49                   	rex.WB
ffff80000010b01b:	49                   	rex.WB
ffff80000010b01c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b01f:	00 00                	add    %al,(%rax)
ffff80000010b021:	00 00                	add    %al,(%rax)
ffff80000010b023:	00 00                	add    %al,(%rax)
ffff80000010b025:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b029:	42                   	rex.X
ffff80000010b02a:	42                   	rex.X
ffff80000010b02b:	42                   	rex.X
ffff80000010b02c:	42 e3 00             	rex.X jrcxz ffff80000010b02f <font_ascii+0x6ef>
ffff80000010b02f:	00 00                	add    %al,(%rax)
ffff80000010b031:	00 00                	add    %al,(%rax)
ffff80000010b033:	00 00                	add    %al,(%rax)
ffff80000010b035:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b039:	82                   	(bad)  
ffff80000010b03a:	82                   	(bad)  
ffff80000010b03b:	82                   	(bad)  
ffff80000010b03c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b03f:	00 00                	add    %al,(%rax)
ffff80000010b041:	00 00                	add    %al,(%rax)
ffff80000010b043:	00 d8                	add    %bl,%al
ffff80000010b045:	64 42                	fs rex.X
ffff80000010b047:	42                   	rex.X
ffff80000010b048:	42                   	rex.X
ffff80000010b049:	42                   	rex.X
ffff80000010b04a:	42                   	rex.X
ffff80000010b04b:	64 58                	fs pop %rax
ffff80000010b04d:	40                   	rex
ffff80000010b04e:	40 e0 00             	rex loopne ffff80000010b051 <font_ascii+0x711>
ffff80000010b051:	00 00                	add    %al,(%rax)
ffff80000010b053:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b056:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b05d:	04 04                	add    $0x4,%al
ffff80000010b05f:	0e                   	(bad)  
ffff80000010b060:	00 00                	add    %al,(%rax)
ffff80000010b062:	00 00                	add    %al,(%rax)
ffff80000010b064:	00 dc                	add    %bl,%ah
ffff80000010b066:	62 42                	(bad)  
ffff80000010b068:	40                   	rex
ffff80000010b069:	40                   	rex
ffff80000010b06a:	40                   	rex
ffff80000010b06b:	40                   	rex
ffff80000010b06c:	40 e0 00             	rex loopne ffff80000010b06f <font_ascii+0x72f>
ffff80000010b06f:	00 00                	add    %al,(%rax)
ffff80000010b071:	00 00                	add    %al,(%rax)
ffff80000010b073:	00 00                	add    %al,(%rax)
ffff80000010b075:	7a 86                	jp     ffff80000010affd <font_ascii+0x6bd>
ffff80000010b077:	82                   	(bad)  
ffff80000010b078:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b07b:	82                   	(bad)  
ffff80000010b07c:	c2 bc 00             	retq   $0xbc
ffff80000010b07f:	00 00                	add    %al,(%rax)
ffff80000010b081:	00 10                	add    %dl,(%rax)
ffff80000010b083:	10 10                	adc    %dl,(%rax)
ffff80000010b085:	7c 10                	jl     ffff80000010b097 <font_ascii+0x757>
ffff80000010b087:	10 10                	adc    %dl,(%rax)
ffff80000010b089:	10 10                	adc    %dl,(%rax)
ffff80000010b08b:	10 10                	adc    %dl,(%rax)
ffff80000010b08d:	0e                   	(bad)  
ffff80000010b08e:	00 00                	add    %al,(%rax)
ffff80000010b090:	00 00                	add    %al,(%rax)
ffff80000010b092:	00 00                	add    %al,(%rax)
ffff80000010b094:	00 c6                	add    %al,%dh
ffff80000010b096:	42                   	rex.X
ffff80000010b097:	42                   	rex.X
ffff80000010b098:	42                   	rex.X
ffff80000010b099:	42                   	rex.X
ffff80000010b09a:	42                   	rex.X
ffff80000010b09b:	42                   	rex.X
ffff80000010b09c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b09f:	00 00                	add    %al,(%rax)
ffff80000010b0a1:	00 00                	add    %al,(%rax)
ffff80000010b0a3:	00 00                	add    %al,(%rax)
ffff80000010b0a5:	e7 42                	out    %eax,$0x42
ffff80000010b0a7:	42                   	rex.X
ffff80000010b0a8:	42 24 24             	rex.X and $0x24,%al
ffff80000010b0ab:	24 18                	and    $0x18,%al
ffff80000010b0ad:	18 00                	sbb    %al,(%rax)
ffff80000010b0af:	00 00                	add    %al,(%rax)
ffff80000010b0b1:	00 00                	add    %al,(%rax)
ffff80000010b0b3:	00 00                	add    %al,(%rax)
ffff80000010b0b5:	e7 42                	out    %eax,$0x42
ffff80000010b0b7:	42 5a                	rex.X pop %rdx
ffff80000010b0b9:	5a                   	pop    %rdx
ffff80000010b0ba:	5a                   	pop    %rdx
ffff80000010b0bb:	24 24                	and    $0x24,%al
ffff80000010b0bd:	24 00                	and    $0x0,%al
ffff80000010b0bf:	00 00                	add    %al,(%rax)
ffff80000010b0c1:	00 00                	add    %al,(%rax)
ffff80000010b0c3:	00 00                	add    %al,(%rax)
ffff80000010b0c5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b0ca:	28 28                	sub    %ch,(%rax)
ffff80000010b0cc:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b0d0:	00 00                	add    %al,(%rax)
ffff80000010b0d2:	00 00                	add    %al,(%rax)
ffff80000010b0d4:	00 e7                	add    %ah,%bh
ffff80000010b0d6:	42                   	rex.X
ffff80000010b0d7:	42 24 24             	rex.X and $0x24,%al
ffff80000010b0da:	24 18                	and    $0x18,%al
ffff80000010b0dc:	18 10                	sbb    %dl,(%rax)
ffff80000010b0de:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b0e1:	00 00                	add    %al,(%rax)
ffff80000010b0e3:	00 00                	add    %al,(%rax)
ffff80000010b0e5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b0eb:	42 82                	rex.X (bad) 
ffff80000010b0ed:	fe 00                	incb   (%rax)
ffff80000010b0ef:	00 00                	add    %al,(%rax)
ffff80000010b0f1:	06                   	(bad)  
ffff80000010b0f2:	08 10                	or     %dl,(%rax)
ffff80000010b0f4:	10 10                	adc    %dl,(%rax)
ffff80000010b0f6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b0f9:	10 10                	adc    %dl,(%rax)
ffff80000010b0fb:	10 08                	adc    %cl,(%rax)
ffff80000010b0fd:	06                   	(bad)  
ffff80000010b0fe:	00 00                	add    %al,(%rax)
ffff80000010b100:	10 10                	adc    %dl,(%rax)
ffff80000010b102:	10 10                	adc    %dl,(%rax)
ffff80000010b104:	10 10                	adc    %dl,(%rax)
ffff80000010b106:	10 10                	adc    %dl,(%rax)
ffff80000010b108:	10 10                	adc    %dl,(%rax)
ffff80000010b10a:	10 10                	adc    %dl,(%rax)
ffff80000010b10c:	10 10                	adc    %dl,(%rax)
ffff80000010b10e:	10 10                	adc    %dl,(%rax)
ffff80000010b110:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b113:	08 08                	or     %cl,(%rax)
ffff80000010b115:	08 08                	or     %cl,(%rax)
ffff80000010b117:	06                   	(bad)  
ffff80000010b118:	08 08                	or     %cl,(%rax)
ffff80000010b11a:	08 08                	or     %cl,(%rax)
ffff80000010b11c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b11f:	00 00                	add    %al,(%rax)
ffff80000010b121:	72 8c                	jb     ffff80000010b0af <font_ascii+0x76f>
	...

ffff80000010b940 <init_thread>:
ffff80000010b940:	00 00                	add    %al,(%rax)
ffff80000010b942:	12 00                	adc    (%rax),%al
ffff80000010b944:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b952:	12 00                	adc    (%rax),%al
ffff80000010b954:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010b95a:	00 00                	add    %al,(%rax)
ffff80000010b95c:	00 00                	add    %al,(%rax)
ffff80000010b95e:	00 00                	add    %al,(%rax)
ffff80000010b960:	10 00                	adc    %al,(%rax)
	...

ffff80000010b980 <init_task>:
ffff80000010b980:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010b986:	ff                   	(bad)  
ffff80000010b987:	ff 00                	incl   (%rax)
	...

ffff80000010b9c0 <init_tss>:
ffff80000010b9c0:	00 00                	add    %al,(%rax)
ffff80000010b9c2:	00 00                	add    %al,(%rax)
ffff80000010b9c4:	00 00                	add    %al,(%rax)
ffff80000010b9c6:	12 00                	adc    (%rax),%al
ffff80000010b9c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b9ce:	12 00                	adc    (%rax),%al
ffff80000010b9d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b9d6:	12 00                	adc    (%rax),%al
ffff80000010b9d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b9de:	00 00                	add    %al,(%rax)
ffff80000010b9e0:	00 00                	add    %al,(%rax)
ffff80000010b9e2:	00 00                	add    %al,(%rax)
ffff80000010b9e4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b9e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b9ee:	00 00                	add    %al,(%rax)
ffff80000010b9f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b9f6:	00 00                	add    %al,(%rax)
ffff80000010b9f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b9fe:	00 00                	add    %al,(%rax)
ffff80000010ba00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba06:	00 00                	add    %al,(%rax)
ffff80000010ba08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba0e:	00 00                	add    %al,(%rax)
ffff80000010ba10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba16:	00 00                	add    %al,(%rax)
ffff80000010ba18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ba2e:	12 00                	adc    (%rax),%al
ffff80000010ba30:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba36:	12 00                	adc    (%rax),%al
ffff80000010ba38:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba3e:	12 00                	adc    (%rax),%al
ffff80000010ba40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba46:	00 00                	add    %al,(%rax)
ffff80000010ba48:	00 00                	add    %al,(%rax)
ffff80000010ba4a:	00 00                	add    %al,(%rax)
ffff80000010ba4c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010ba50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba56:	00 00                	add    %al,(%rax)
ffff80000010ba58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba5e:	00 00                	add    %al,(%rax)
ffff80000010ba60:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba66:	00 00                	add    %al,(%rax)
ffff80000010ba68:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba6e:	00 00                	add    %al,(%rax)
ffff80000010ba70:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba76:	00 00                	add    %al,(%rax)
ffff80000010ba78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba7e:	00 00                	add    %al,(%rax)
ffff80000010ba80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ba96:	12 00                	adc    (%rax),%al
ffff80000010ba98:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba9e:	12 00                	adc    (%rax),%al
ffff80000010baa0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010baa6:	12 00                	adc    (%rax),%al
ffff80000010baa8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010baae:	00 00                	add    %al,(%rax)
ffff80000010bab0:	00 00                	add    %al,(%rax)
ffff80000010bab2:	00 00                	add    %al,(%rax)
ffff80000010bab4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bab8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010babe:	00 00                	add    %al,(%rax)
ffff80000010bac0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bac6:	00 00                	add    %al,(%rax)
ffff80000010bac8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bace:	00 00                	add    %al,(%rax)
ffff80000010bad0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bad6:	00 00                	add    %al,(%rax)
ffff80000010bad8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bade:	00 00                	add    %al,(%rax)
ffff80000010bae0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bae6:	00 00                	add    %al,(%rax)
ffff80000010bae8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bafe:	12 00                	adc    (%rax),%al
ffff80000010bb00:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb06:	12 00                	adc    (%rax),%al
ffff80000010bb08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb0e:	12 00                	adc    (%rax),%al
ffff80000010bb10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb16:	00 00                	add    %al,(%rax)
ffff80000010bb18:	00 00                	add    %al,(%rax)
ffff80000010bb1a:	00 00                	add    %al,(%rax)
ffff80000010bb1c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb26:	00 00                	add    %al,(%rax)
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
ffff80000010bb50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bb66:	12 00                	adc    (%rax),%al
ffff80000010bb68:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb6e:	12 00                	adc    (%rax),%al
ffff80000010bb70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb76:	12 00                	adc    (%rax),%al
ffff80000010bb78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb7e:	00 00                	add    %al,(%rax)
ffff80000010bb80:	00 00                	add    %al,(%rax)
ffff80000010bb82:	00 00                	add    %al,(%rax)
ffff80000010bb84:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb8e:	00 00                	add    %al,(%rax)
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
ffff80000010bbb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bbce:	12 00                	adc    (%rax),%al
ffff80000010bbd0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbd6:	12 00                	adc    (%rax),%al
ffff80000010bbd8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbde:	12 00                	adc    (%rax),%al
ffff80000010bbe0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbe6:	00 00                	add    %al,(%rax)
ffff80000010bbe8:	00 00                	add    %al,(%rax)
ffff80000010bbea:	00 00                	add    %al,(%rax)
ffff80000010bbec:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bbf0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbf6:	00 00                	add    %al,(%rax)
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
ffff80000010bc20:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc36:	12 00                	adc    (%rax),%al
ffff80000010bc38:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc3e:	12 00                	adc    (%rax),%al
ffff80000010bc40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc46:	12 00                	adc    (%rax),%al
ffff80000010bc48:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc4e:	00 00                	add    %al,(%rax)
ffff80000010bc50:	00 00                	add    %al,(%rax)
ffff80000010bc52:	00 00                	add    %al,(%rax)
ffff80000010bc54:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bc58:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc5e:	00 00                	add    %al,(%rax)
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
ffff80000010bc88:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc9e:	12 00                	adc    (%rax),%al
ffff80000010bca0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bca6:	12 00                	adc    (%rax),%al
ffff80000010bca8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcae:	12 00                	adc    (%rax),%al
ffff80000010bcb0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcb6:	00 00                	add    %al,(%rax)
ffff80000010bcb8:	00 00                	add    %al,(%rax)
ffff80000010bcba:	00 00                	add    %al,(%rax)
ffff80000010bcbc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bcc0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcc6:	00 00                	add    %al,(%rax)
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
ffff80000010bcf0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010bd00 <system_call_table>:
ffff80000010bd00:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff80000010bd04:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff80000010bd0a:	10 00                	adc    %al,(%rax)
ffff80000010bd0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd12:	10 00                	adc    %al,(%rax)
ffff80000010bd14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd1a:	10 00                	adc    %al,(%rax)
ffff80000010bd1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd22:	10 00                	adc    %al,(%rax)
ffff80000010bd24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd2a:	10 00                	adc    %al,(%rax)
ffff80000010bd2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd32:	10 00                	adc    %al,(%rax)
ffff80000010bd34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd3a:	10 00                	adc    %al,(%rax)
ffff80000010bd3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd42:	10 00                	adc    %al,(%rax)
ffff80000010bd44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd4a:	10 00                	adc    %al,(%rax)
ffff80000010bd4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd52:	10 00                	adc    %al,(%rax)
ffff80000010bd54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd5a:	10 00                	adc    %al,(%rax)
ffff80000010bd5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd62:	10 00                	adc    %al,(%rax)
ffff80000010bd64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd6a:	10 00                	adc    %al,(%rax)
ffff80000010bd6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd72:	10 00                	adc    %al,(%rax)
ffff80000010bd74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd7a:	10 00                	adc    %al,(%rax)
ffff80000010bd7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd82:	10 00                	adc    %al,(%rax)
ffff80000010bd84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd8a:	10 00                	adc    %al,(%rax)
ffff80000010bd8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd92:	10 00                	adc    %al,(%rax)
ffff80000010bd94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bd9a:	10 00                	adc    %al,(%rax)
ffff80000010bd9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bda2:	10 00                	adc    %al,(%rax)
ffff80000010bda4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdaa:	10 00                	adc    %al,(%rax)
ffff80000010bdac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdb2:	10 00                	adc    %al,(%rax)
ffff80000010bdb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdba:	10 00                	adc    %al,(%rax)
ffff80000010bdbc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdc2:	10 00                	adc    %al,(%rax)
ffff80000010bdc4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdca:	10 00                	adc    %al,(%rax)
ffff80000010bdcc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdd2:	10 00                	adc    %al,(%rax)
ffff80000010bdd4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdda:	10 00                	adc    %al,(%rax)
ffff80000010bddc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bde2:	10 00                	adc    %al,(%rax)
ffff80000010bde4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdea:	10 00                	adc    %al,(%rax)
ffff80000010bdec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdf2:	10 00                	adc    %al,(%rax)
ffff80000010bdf4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010bdfa:	10 00                	adc    %al,(%rax)
ffff80000010bdfc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be02:	10 00                	adc    %al,(%rax)
ffff80000010be04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be0a:	10 00                	adc    %al,(%rax)
ffff80000010be0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be12:	10 00                	adc    %al,(%rax)
ffff80000010be14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be1a:	10 00                	adc    %al,(%rax)
ffff80000010be1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be22:	10 00                	adc    %al,(%rax)
ffff80000010be24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be2a:	10 00                	adc    %al,(%rax)
ffff80000010be2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be32:	10 00                	adc    %al,(%rax)
ffff80000010be34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be3a:	10 00                	adc    %al,(%rax)
ffff80000010be3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010be42:	10 00                	adc    %al,(%rax)
ffff80000010be44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
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
ffff80000010c0fc:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c30e:	00 00                	add    %al,(%rax)
ffff80000010c310:	00 10                	add    %dl,(%rax)
ffff80000010c312:	10 10                	adc    %dl,(%rax)
ffff80000010c314:	10 10                	adc    %dl,(%rax)
ffff80000010c316:	10 10                	adc    %dl,(%rax)
ffff80000010c318:	10 10                	adc    %dl,(%rax)
ffff80000010c31a:	00 00                	add    %al,(%rax)
ffff80000010c31c:	10 10                	adc    %dl,(%rax)
ffff80000010c31e:	00 00                	add    %al,(%rax)
ffff80000010c320:	28 28                	sub    %ch,(%rax)
ffff80000010c322:	28 00                	sub    %al,(%rax)
	...
ffff80000010c330:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010c334:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010c338:	44                   	rex.R
ffff80000010c339:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c33e:	00 00                	add    %al,(%rax)
ffff80000010c340:	10 3a                	adc    %bh,(%rdx)
ffff80000010c342:	56                   	push   %rsi
ffff80000010c343:	92                   	xchg   %eax,%edx
ffff80000010c344:	92                   	xchg   %eax,%edx
ffff80000010c345:	90                   	nop
ffff80000010c346:	50                   	push   %rax
ffff80000010c347:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010c34a:	92                   	xchg   %eax,%edx
ffff80000010c34b:	92                   	xchg   %eax,%edx
ffff80000010c34c:	d4                   	(bad)  
ffff80000010c34d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010c352:	94                   	xchg   %eax,%esp
ffff80000010c353:	94                   	xchg   %eax,%esp
ffff80000010c354:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010c359:	2c 52                	sub    $0x52,%al
ffff80000010c35b:	52                   	push   %rdx
ffff80000010c35c:	92                   	xchg   %eax,%edx
ffff80000010c35d:	8c 00                	mov    %es,(%rax)
ffff80000010c35f:	00 00                	add    %al,(%rax)
ffff80000010c361:	70 88                	jo     ffff80000010c2eb <system_call_table+0x5eb>
ffff80000010c363:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010c369:	92                   	xchg   %eax,%edx
ffff80000010c36a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010c371:	08 10                	or     %dl,(%rax)
	...
ffff80000010c37f:	00 02                	add    %al,(%rdx)
ffff80000010c381:	04 08                	add    $0x8,%al
ffff80000010c383:	08 10                	or     %dl,(%rax)
ffff80000010c385:	10 10                	adc    %dl,(%rax)
ffff80000010c387:	10 10                	adc    %dl,(%rax)
ffff80000010c389:	10 10                	adc    %dl,(%rax)
ffff80000010c38b:	08 08                	or     %cl,(%rax)
ffff80000010c38d:	04 02                	add    $0x2,%al
ffff80000010c38f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010c395:	10 10                	adc    %dl,(%rax)
ffff80000010c397:	10 10                	adc    %dl,(%rax)
ffff80000010c399:	10 10                	adc    %dl,(%rax)
ffff80000010c39b:	20 20                	and    %ah,(%rax)
ffff80000010c39d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c3a1:	00 00                	add    %al,(%rax)
ffff80000010c3a3:	00 00                	add    %al,(%rax)
ffff80000010c3a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010c3ab:	10 00                	adc    %al,(%rax)
	...
ffff80000010c3b5:	10 10                	adc    %dl,(%rax)
ffff80000010c3b7:	10 fe                	adc    %bh,%dh
ffff80000010c3b9:	10 10                	adc    %dl,(%rax)
ffff80000010c3bb:	10 00                	adc    %al,(%rax)
	...
ffff80000010c3c9:	00 00                	add    %al,(%rax)
ffff80000010c3cb:	18 18                	sbb    %bl,(%rax)
ffff80000010c3cd:	08 08                	or     %cl,(%rax)
ffff80000010c3cf:	10 00                	adc    %al,(%rax)
ffff80000010c3d1:	00 00                	add    %al,(%rax)
ffff80000010c3d3:	00 00                	add    %al,(%rax)
ffff80000010c3d5:	00 00                	add    %al,(%rax)
ffff80000010c3d7:	00 fe                	add    %bh,%dh
	...
ffff80000010c3e9:	00 00                	add    %al,(%rax)
ffff80000010c3eb:	00 18                	add    %bl,(%rax)
ffff80000010c3ed:	18 00                	sbb    %al,(%rax)
ffff80000010c3ef:	00 02                	add    %al,(%rdx)
ffff80000010c3f1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010c3f4:	08 08                	or     %cl,(%rax)
ffff80000010c3f6:	08 10                	or     %dl,(%rax)
ffff80000010c3f8:	10 20                	adc    %ah,(%rax)
ffff80000010c3fa:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c3fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010c404:	42 
ffff80000010c405:	42                   	rex.X
ffff80000010c406:	42                   	rex.X
ffff80000010c407:	42                   	rex.X
ffff80000010c408:	42                   	rex.X
ffff80000010c409:	42                   	rex.X
ffff80000010c40a:	42 24 24             	rex.X and $0x24,%al
ffff80000010c40d:	18 00                	sbb    %al,(%rax)
ffff80000010c40f:	00 00                	add    %al,(%rax)
ffff80000010c411:	08 18                	or     %bl,(%rax)
ffff80000010c413:	28 08                	sub    %cl,(%rax)
ffff80000010c415:	08 08                	or     %cl,(%rax)
ffff80000010c417:	08 08                	or     %cl,(%rax)
ffff80000010c419:	08 08                	or     %cl,(%rax)
ffff80000010c41b:	08 08                	or     %cl,(%rax)
ffff80000010c41d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010c420:	00 18                	add    %bl,(%rax)
ffff80000010c422:	24 42                	and    $0x42,%al
ffff80000010c424:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010c428:	10 20                	adc    %ah,(%rax)
ffff80000010c42a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c42d:	7e 00                	jle    ffff80000010c42f <system_call_table+0x72f>
ffff80000010c42f:	00 00                	add    %al,(%rax)
ffff80000010c431:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010c434:	02 02                	add    (%rdx),%al
ffff80000010c436:	04 18                	add    $0x18,%al
ffff80000010c438:	04 02                	add    $0x2,%al
ffff80000010c43a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010c43d:	18 00                	sbb    %al,(%rax)
ffff80000010c43f:	00 00                	add    %al,(%rax)
ffff80000010c441:	0c 0c                	or     $0xc,%al
ffff80000010c443:	0c 14                	or     $0x14,%al
ffff80000010c445:	14 14                	adc    $0x14,%al
ffff80000010c447:	24 24                	and    $0x24,%al
ffff80000010c449:	44 7e 04             	rex.R jle ffff80000010c450 <system_call_table+0x750>
ffff80000010c44c:	04 1e                	add    $0x1e,%al
ffff80000010c44e:	00 00                	add    %al,(%rax)
ffff80000010c450:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010c454:	40 58                	rex pop %rax
ffff80000010c456:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010c459:	02 02                	add    (%rdx),%al
ffff80000010c45b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c45e:	00 00                	add    %al,(%rax)
ffff80000010c460:	00 18                	add    %bl,(%rax)
ffff80000010c462:	24 42                	and    $0x42,%al
ffff80000010c464:	40 58                	rex pop %rax
ffff80000010c466:	64 42                	fs rex.X
ffff80000010c468:	42                   	rex.X
ffff80000010c469:	42                   	rex.X
ffff80000010c46a:	42                   	rex.X
ffff80000010c46b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c46e:	00 00                	add    %al,(%rax)
ffff80000010c470:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010c473:	42 04 04             	rex.X add $0x4,%al
ffff80000010c476:	08 08                	or     %cl,(%rax)
ffff80000010c478:	08 10                	or     %dl,(%rax)
ffff80000010c47a:	10 10                	adc    %dl,(%rax)
ffff80000010c47c:	10 38                	adc    %bh,(%rax)
ffff80000010c47e:	00 00                	add    %al,(%rax)
ffff80000010c480:	00 18                	add    %bl,(%rax)
ffff80000010c482:	24 42                	and    $0x42,%al
ffff80000010c484:	42                   	rex.X
ffff80000010c485:	42 24 18             	rex.X and $0x18,%al
ffff80000010c488:	24 42                	and    $0x42,%al
ffff80000010c48a:	42                   	rex.X
ffff80000010c48b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c48e:	00 00                	add    %al,(%rax)
ffff80000010c490:	00 18                	add    %bl,(%rax)
ffff80000010c492:	24 42                	and    $0x42,%al
ffff80000010c494:	42                   	rex.X
ffff80000010c495:	42                   	rex.X
ffff80000010c496:	42                   	rex.X
ffff80000010c497:	42                   	rex.X
ffff80000010c498:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010c49b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c49e:	00 00                	add    %al,(%rax)
ffff80000010c4a0:	00 00                	add    %al,(%rax)
ffff80000010c4a2:	00 00                	add    %al,(%rax)
ffff80000010c4a4:	00 18                	add    %bl,(%rax)
ffff80000010c4a6:	18 00                	sbb    %al,(%rax)
ffff80000010c4a8:	00 00                	add    %al,(%rax)
ffff80000010c4aa:	00 00                	add    %al,(%rax)
ffff80000010c4ac:	18 18                	sbb    %bl,(%rax)
ffff80000010c4ae:	00 00                	add    %al,(%rax)
ffff80000010c4b0:	00 00                	add    %al,(%rax)
ffff80000010c4b2:	00 00                	add    %al,(%rax)
ffff80000010c4b4:	00 18                	add    %bl,(%rax)
ffff80000010c4b6:	18 00                	sbb    %al,(%rax)
ffff80000010c4b8:	00 00                	add    %al,(%rax)
ffff80000010c4ba:	00 18                	add    %bl,(%rax)
ffff80000010c4bc:	18 08                	sbb    %cl,(%rax)
ffff80000010c4be:	08 10                	or     %dl,(%rax)
ffff80000010c4c0:	00 02                	add    %al,(%rdx)
ffff80000010c4c2:	04 08                	add    $0x8,%al
ffff80000010c4c4:	10 20                	adc    %ah,(%rax)
ffff80000010c4c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010c4cd:	04 
ffff80000010c4ce:	02 00                	add    (%rax),%al
ffff80000010c4d0:	00 00                	add    %al,(%rax)
ffff80000010c4d2:	00 00                	add    %al,(%rax)
ffff80000010c4d4:	00 00                	add    %al,(%rax)
ffff80000010c4d6:	fe 00                	incb   (%rax)
ffff80000010c4d8:	00 fe                	add    %bh,%dh
ffff80000010c4da:	00 00                	add    %al,(%rax)
ffff80000010c4dc:	00 00                	add    %al,(%rax)
ffff80000010c4de:	00 00                	add    %al,(%rax)
ffff80000010c4e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010c4e6:	04 02                	add    $0x2,%al
ffff80000010c4e8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010c4eb:	10 20                	adc    %ah,(%rax)
ffff80000010c4ed:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c4f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c4f5:	82                   	(bad)  
ffff80000010c4f6:	04 08                	add    $0x8,%al
ffff80000010c4f8:	10 10                	adc    %dl,(%rax)
ffff80000010c4fa:	00 00                	add    %al,(%rax)
ffff80000010c4fc:	18 18                	sbb    %bl,(%rax)
ffff80000010c4fe:	00 00                	add    %al,(%rax)
ffff80000010c500:	00 38                	add    %bh,(%rax)
ffff80000010c502:	44 82                	rex.R (bad) 
ffff80000010c504:	9a                   	(bad)  
ffff80000010c505:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c506:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c507:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c508:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c509:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c50a:	9c                   	pushfq 
ffff80000010c50b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010c50f:	00 00                	add    %al,(%rax)
ffff80000010c511:	18 18                	sbb    %bl,(%rax)
ffff80000010c513:	18 18                	sbb    %bl,(%rax)
ffff80000010c515:	24 24                	and    $0x24,%al
ffff80000010c517:	24 24                	and    $0x24,%al
ffff80000010c519:	7e 42                	jle    ffff80000010c55d <system_call_table+0x85d>
ffff80000010c51b:	42                   	rex.X
ffff80000010c51c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c51f:	00 00                	add    %al,(%rax)
ffff80000010c521:	f0 48                	lock rex.W
ffff80000010c523:	44                   	rex.R
ffff80000010c524:	44                   	rex.R
ffff80000010c525:	44                   	rex.R
ffff80000010c526:	48 78 44             	rex.W js ffff80000010c56d <system_call_table+0x86d>
ffff80000010c529:	42                   	rex.X
ffff80000010c52a:	42                   	rex.X
ffff80000010c52b:	42                   	rex.X
ffff80000010c52c:	44 f8                	rex.R clc 
ffff80000010c52e:	00 00                	add    %al,(%rax)
ffff80000010c530:	00 3a                	add    %bh,(%rdx)
ffff80000010c532:	46                   	rex.RX
ffff80000010c533:	42 82                	rex.X (bad) 
ffff80000010c535:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010c53c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c53f:	00 00                	add    %al,(%rax)
ffff80000010c541:	f8                   	clc    
ffff80000010c542:	44                   	rex.R
ffff80000010c543:	44                   	rex.R
ffff80000010c544:	42                   	rex.X
ffff80000010c545:	42                   	rex.X
ffff80000010c546:	42                   	rex.X
ffff80000010c547:	42                   	rex.X
ffff80000010c548:	42                   	rex.X
ffff80000010c549:	42                   	rex.X
ffff80000010c54a:	42                   	rex.X
ffff80000010c54b:	44                   	rex.R
ffff80000010c54c:	44 f8                	rex.R clc 
ffff80000010c54e:	00 00                	add    %al,(%rax)
ffff80000010c550:	00 fe                	add    %bh,%dh
ffff80000010c552:	42                   	rex.X
ffff80000010c553:	42                   	rex.X
ffff80000010c554:	40                   	rex
ffff80000010c555:	40                   	rex
ffff80000010c556:	44 7c 44             	rex.R jl ffff80000010c59d <system_call_table+0x89d>
ffff80000010c559:	40                   	rex
ffff80000010c55a:	40                   	rex
ffff80000010c55b:	42                   	rex.X
ffff80000010c55c:	42 fe 00             	rex.X incb (%rax)
ffff80000010c55f:	00 00                	add    %al,(%rax)
ffff80000010c561:	fe 42 42             	incb   0x42(%rdx)
ffff80000010c564:	40                   	rex
ffff80000010c565:	40                   	rex
ffff80000010c566:	44 7c 44             	rex.R jl ffff80000010c5ad <system_call_table+0x8ad>
ffff80000010c569:	44                   	rex.R
ffff80000010c56a:	40                   	rex
ffff80000010c56b:	40                   	rex
ffff80000010c56c:	40                   	rex
ffff80000010c56d:	f0 00 00             	lock add %al,(%rax)
ffff80000010c570:	00 3a                	add    %bh,(%rdx)
ffff80000010c572:	46                   	rex.RX
ffff80000010c573:	42 82                	rex.X (bad) 
ffff80000010c575:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010c57c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010c57f:	00 00                	add    %al,(%rax)
ffff80000010c581:	e7 42                	out    %eax,$0x42
ffff80000010c583:	42                   	rex.X
ffff80000010c584:	42                   	rex.X
ffff80000010c585:	42                   	rex.X
ffff80000010c586:	42 7e 42             	rex.X jle ffff80000010c5cb <system_call_table+0x8cb>
ffff80000010c589:	42                   	rex.X
ffff80000010c58a:	42                   	rex.X
ffff80000010c58b:	42                   	rex.X
ffff80000010c58c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c58f:	00 00                	add    %al,(%rax)
ffff80000010c591:	7c 10                	jl     ffff80000010c5a3 <system_call_table+0x8a3>
ffff80000010c593:	10 10                	adc    %dl,(%rax)
ffff80000010c595:	10 10                	adc    %dl,(%rax)
ffff80000010c597:	10 10                	adc    %dl,(%rax)
ffff80000010c599:	10 10                	adc    %dl,(%rax)
ffff80000010c59b:	10 10                	adc    %dl,(%rax)
ffff80000010c59d:	7c 00                	jl     ffff80000010c59f <system_call_table+0x89f>
ffff80000010c59f:	00 00                	add    %al,(%rax)
ffff80000010c5a1:	1f                   	(bad)  
ffff80000010c5a2:	04 04                	add    $0x4,%al
ffff80000010c5a4:	04 04                	add    $0x4,%al
ffff80000010c5a6:	04 04                	add    $0x4,%al
ffff80000010c5a8:	04 04                	add    $0x4,%al
ffff80000010c5aa:	04 04                	add    $0x4,%al
ffff80000010c5ac:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010c5af:	00 00                	add    %al,(%rax)
ffff80000010c5b1:	e7 42                	out    %eax,$0x42
ffff80000010c5b3:	44                   	rex.R
ffff80000010c5b4:	48 50                	rex.W push %rax
ffff80000010c5b6:	50                   	push   %rax
ffff80000010c5b7:	60                   	(bad)  
ffff80000010c5b8:	50                   	push   %rax
ffff80000010c5b9:	50                   	push   %rax
ffff80000010c5ba:	48                   	rex.W
ffff80000010c5bb:	44                   	rex.R
ffff80000010c5bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c5bf:	00 00                	add    %al,(%rax)
ffff80000010c5c1:	f0 40                	lock rex
ffff80000010c5c3:	40                   	rex
ffff80000010c5c4:	40                   	rex
ffff80000010c5c5:	40                   	rex
ffff80000010c5c6:	40                   	rex
ffff80000010c5c7:	40                   	rex
ffff80000010c5c8:	40                   	rex
ffff80000010c5c9:	40                   	rex
ffff80000010c5ca:	40                   	rex
ffff80000010c5cb:	42                   	rex.X
ffff80000010c5cc:	42 fe 00             	rex.X incb (%rax)
ffff80000010c5cf:	00 00                	add    %al,(%rax)
ffff80000010c5d1:	c3                   	retq   
ffff80000010c5d2:	42                   	rex.X
ffff80000010c5d3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010c5d7:	5a                   	pop    %rdx
ffff80000010c5d8:	5a                   	pop    %rdx
ffff80000010c5d9:	42                   	rex.X
ffff80000010c5da:	42                   	rex.X
ffff80000010c5db:	42                   	rex.X
ffff80000010c5dc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c5df:	00 00                	add    %al,(%rax)
ffff80000010c5e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010c5e8:	4a                   	rex.WX
ffff80000010c5e9:	4a                   	rex.WX
ffff80000010c5ea:	4a                   	rex.WX
ffff80000010c5eb:	46                   	rex.RX
ffff80000010c5ec:	46 e2 00             	rex.RX loop ffff80000010c5ef <system_call_table+0x8ef>
ffff80000010c5ef:	00 00                	add    %al,(%rax)
ffff80000010c5f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c5f5:	82                   	(bad)  
ffff80000010c5f6:	82                   	(bad)  
ffff80000010c5f7:	82                   	(bad)  
ffff80000010c5f8:	82                   	(bad)  
ffff80000010c5f9:	82                   	(bad)  
ffff80000010c5fa:	82                   	(bad)  
ffff80000010c5fb:	82                   	(bad)  
ffff80000010c5fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c5ff:	00 00                	add    %al,(%rax)
ffff80000010c601:	f8                   	clc    
ffff80000010c602:	44                   	rex.R
ffff80000010c603:	42                   	rex.X
ffff80000010c604:	42                   	rex.X
ffff80000010c605:	42                   	rex.X
ffff80000010c606:	44 78 40             	rex.R js ffff80000010c649 <system_call_table+0x949>
ffff80000010c609:	40                   	rex
ffff80000010c60a:	40                   	rex
ffff80000010c60b:	40                   	rex
ffff80000010c60c:	40                   	rex
ffff80000010c60d:	f0 00 00             	lock add %al,(%rax)
ffff80000010c610:	00 38                	add    %bh,(%rax)
ffff80000010c612:	44 82                	rex.R (bad) 
ffff80000010c614:	82                   	(bad)  
ffff80000010c615:	82                   	(bad)  
ffff80000010c616:	82                   	(bad)  
ffff80000010c617:	82                   	(bad)  
ffff80000010c618:	82                   	(bad)  
ffff80000010c619:	82                   	(bad)  
ffff80000010c61a:	92                   	xchg   %eax,%edx
ffff80000010c61b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010c61f:	00 00                	add    %al,(%rax)
ffff80000010c621:	fc                   	cld    
ffff80000010c622:	42                   	rex.X
ffff80000010c623:	42                   	rex.X
ffff80000010c624:	42                   	rex.X
ffff80000010c625:	42 7c 44             	rex.X jl ffff80000010c66c <system_call_table+0x96c>
ffff80000010c628:	42                   	rex.X
ffff80000010c629:	42                   	rex.X
ffff80000010c62a:	42                   	rex.X
ffff80000010c62b:	42                   	rex.X
ffff80000010c62c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c62f:	00 00                	add    %al,(%rax)
ffff80000010c631:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010c634:	82                   	(bad)  
ffff80000010c635:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010c639:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010c63f:	00 00                	add    %al,(%rax)
ffff80000010c641:	fe                   	(bad)  
ffff80000010c642:	92                   	xchg   %eax,%edx
ffff80000010c643:	92                   	xchg   %eax,%edx
ffff80000010c644:	10 10                	adc    %dl,(%rax)
ffff80000010c646:	10 10                	adc    %dl,(%rax)
ffff80000010c648:	10 10                	adc    %dl,(%rax)
ffff80000010c64a:	10 10                	adc    %dl,(%rax)
ffff80000010c64c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010c650:	00 e7                	add    %ah,%bh
ffff80000010c652:	42                   	rex.X
ffff80000010c653:	42                   	rex.X
ffff80000010c654:	42                   	rex.X
ffff80000010c655:	42                   	rex.X
ffff80000010c656:	42                   	rex.X
ffff80000010c657:	42                   	rex.X
ffff80000010c658:	42                   	rex.X
ffff80000010c659:	42                   	rex.X
ffff80000010c65a:	42                   	rex.X
ffff80000010c65b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010c65e:	00 00                	add    %al,(%rax)
ffff80000010c660:	00 e7                	add    %ah,%bh
ffff80000010c662:	42                   	rex.X
ffff80000010c663:	42                   	rex.X
ffff80000010c664:	42                   	rex.X
ffff80000010c665:	42 24 24             	rex.X and $0x24,%al
ffff80000010c668:	24 24                	and    $0x24,%al
ffff80000010c66a:	18 18                	sbb    %bl,(%rax)
ffff80000010c66c:	18 18                	sbb    %bl,(%rax)
ffff80000010c66e:	00 00                	add    %al,(%rax)
ffff80000010c670:	00 e7                	add    %ah,%bh
ffff80000010c672:	42                   	rex.X
ffff80000010c673:	42                   	rex.X
ffff80000010c674:	42 5a                	rex.X pop %rdx
ffff80000010c676:	5a                   	pop    %rdx
ffff80000010c677:	5a                   	pop    %rdx
ffff80000010c678:	5a                   	pop    %rdx
ffff80000010c679:	24 24                	and    $0x24,%al
ffff80000010c67b:	24 24                	and    $0x24,%al
ffff80000010c67d:	24 00                	and    $0x0,%al
ffff80000010c67f:	00 00                	add    %al,(%rax)
ffff80000010c681:	e7 42                	out    %eax,$0x42
ffff80000010c683:	42 24 24             	rex.X and $0x24,%al
ffff80000010c686:	24 18                	and    $0x18,%al
ffff80000010c688:	24 24                	and    $0x24,%al
ffff80000010c68a:	24 42                	and    $0x42,%al
ffff80000010c68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c68f:	00 00                	add    %al,(%rax)
ffff80000010c691:	ee                   	out    %al,(%dx)
ffff80000010c692:	44                   	rex.R
ffff80000010c693:	44                   	rex.R
ffff80000010c694:	44 28 28             	sub    %r13b,(%rax)
ffff80000010c697:	28 10                	sub    %dl,(%rax)
ffff80000010c699:	10 10                	adc    %dl,(%rax)
ffff80000010c69b:	10 10                	adc    %dl,(%rax)
ffff80000010c69d:	7c 00                	jl     ffff80000010c69f <system_call_table+0x99f>
ffff80000010c69f:	00 00                	add    %al,(%rax)
ffff80000010c6a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010c6a8:	20 20                	and    %ah,(%rax)
ffff80000010c6aa:	40                   	rex
ffff80000010c6ab:	42 82                	rex.X (bad) 
ffff80000010c6ad:	fe 00                	incb   (%rax)
ffff80000010c6af:	00 00                	add    %al,(%rax)
ffff80000010c6b1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010c6b4:	20 20                	and    %ah,(%rax)
ffff80000010c6b6:	20 20                	and    %ah,(%rax)
ffff80000010c6b8:	20 20                	and    %ah,(%rax)
ffff80000010c6ba:	20 20                	and    %ah,(%rax)
ffff80000010c6bc:	20 20                	and    %ah,(%rax)
ffff80000010c6be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010c6c5:	20 20                	and    %ah,(%rax)
ffff80000010c6c7:	10 10                	adc    %dl,(%rax)
ffff80000010c6c9:	08 08                	or     %cl,(%rax)
ffff80000010c6cb:	04 04                	add    $0x4,%al
ffff80000010c6cd:	04 02                	add    $0x2,%al
ffff80000010c6cf:	02 00                	add    (%rax),%al
ffff80000010c6d1:	7c 04                	jl     ffff80000010c6d7 <system_call_table+0x9d7>
ffff80000010c6d3:	04 04                	add    $0x4,%al
ffff80000010c6d5:	04 04                	add    $0x4,%al
ffff80000010c6d7:	04 04                	add    $0x4,%al
ffff80000010c6d9:	04 04                	add    $0x4,%al
ffff80000010c6db:	04 04                	add    $0x4,%al
ffff80000010c6dd:	04 7c                	add    $0x7c,%al
ffff80000010c6df:	00 00                	add    %al,(%rax)
ffff80000010c6e1:	10 28                	adc    %ch,(%rax)
ffff80000010c6e3:	44 82                	rex.R (bad) 
	...
ffff80000010c6fd:	00 fe                	add    %bh,%dh
ffff80000010c6ff:	00 10                	add    %dl,(%rax)
ffff80000010c701:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010c714:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010c717:	04 3c                	add    $0x3c,%al
ffff80000010c719:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010c720:	c0 
ffff80000010c721:	40                   	rex
ffff80000010c722:	40                   	rex
ffff80000010c723:	40                   	rex
ffff80000010c724:	40 58                	rex pop %rax
ffff80000010c726:	64 42                	fs rex.X
ffff80000010c728:	42                   	rex.X
ffff80000010c729:	42                   	rex.X
ffff80000010c72a:	42                   	rex.X
ffff80000010c72b:	42                   	rex.X
ffff80000010c72c:	64 58                	fs pop %rax
ffff80000010c72e:	00 00                	add    %al,(%rax)
ffff80000010c730:	00 00                	add    %al,(%rax)
ffff80000010c732:	00 00                	add    %al,(%rax)
ffff80000010c734:	00 30                	add    %dh,(%rax)
ffff80000010c736:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010c73d:	38 
ffff80000010c73e:	00 00                	add    %al,(%rax)
ffff80000010c740:	0c 04                	or     $0x4,%al
ffff80000010c742:	04 04                	add    $0x4,%al
ffff80000010c744:	04 34                	add    $0x34,%al
ffff80000010c746:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010c74d:	36 
ffff80000010c74e:	00 00                	add    %al,(%rax)
ffff80000010c750:	00 00                	add    %al,(%rax)
ffff80000010c752:	00 00                	add    %al,(%rax)
ffff80000010c754:	00 38                	add    %bh,(%rax)
ffff80000010c756:	44 82                	rex.R (bad) 
ffff80000010c758:	82                   	(bad)  
ffff80000010c759:	fc                   	cld    
ffff80000010c75a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010c761:	10 10                	adc    %dl,(%rax)
ffff80000010c763:	10 10                	adc    %dl,(%rax)
ffff80000010c765:	7c 10                	jl     ffff80000010c777 <system_call_table+0xa77>
ffff80000010c767:	10 10                	adc    %dl,(%rax)
ffff80000010c769:	10 10                	adc    %dl,(%rax)
ffff80000010c76b:	10 10                	adc    %dl,(%rax)
ffff80000010c76d:	7c 00                	jl     ffff80000010c76f <system_call_table+0xa6f>
ffff80000010c76f:	00 00                	add    %al,(%rax)
ffff80000010c771:	00 00                	add    %al,(%rax)
ffff80000010c773:	00 00                	add    %al,(%rax)
ffff80000010c775:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010c77c:	34 04 
ffff80000010c77e:	04 38                	add    $0x38,%al
ffff80000010c780:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010c784:	40 58                	rex pop %rax
ffff80000010c786:	64 42                	fs rex.X
ffff80000010c788:	42                   	rex.X
ffff80000010c789:	42                   	rex.X
ffff80000010c78a:	42                   	rex.X
ffff80000010c78b:	42                   	rex.X
ffff80000010c78c:	42 e3 00             	rex.X jrcxz ffff80000010c78f <system_call_table+0xa8f>
ffff80000010c78f:	00 00                	add    %al,(%rax)
ffff80000010c791:	10 10                	adc    %dl,(%rax)
ffff80000010c793:	00 00                	add    %al,(%rax)
ffff80000010c795:	30 10                	xor    %dl,(%rax)
ffff80000010c797:	10 10                	adc    %dl,(%rax)
ffff80000010c799:	10 10                	adc    %dl,(%rax)
ffff80000010c79b:	10 10                	adc    %dl,(%rax)
ffff80000010c79d:	38 00                	cmp    %al,(%rax)
ffff80000010c79f:	00 00                	add    %al,(%rax)
ffff80000010c7a1:	04 04                	add    $0x4,%al
ffff80000010c7a3:	00 00                	add    %al,(%rax)
ffff80000010c7a5:	0c 04                	or     $0x4,%al
ffff80000010c7a7:	04 04                	add    $0x4,%al
ffff80000010c7a9:	04 04                	add    $0x4,%al
ffff80000010c7ab:	04 04                	add    $0x4,%al
ffff80000010c7ad:	08 08                	or     %cl,(%rax)
ffff80000010c7af:	30 c0                	xor    %al,%al
ffff80000010c7b1:	40                   	rex
ffff80000010c7b2:	40                   	rex
ffff80000010c7b3:	40                   	rex
ffff80000010c7b4:	40                   	rex
ffff80000010c7b5:	4e                   	rex.WRX
ffff80000010c7b6:	44                   	rex.R
ffff80000010c7b7:	48 50                	rex.W push %rax
ffff80000010c7b9:	60                   	(bad)  
ffff80000010c7ba:	50                   	push   %rax
ffff80000010c7bb:	48                   	rex.W
ffff80000010c7bc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010c7bf:	00 30                	add    %dh,(%rax)
ffff80000010c7c1:	10 10                	adc    %dl,(%rax)
ffff80000010c7c3:	10 10                	adc    %dl,(%rax)
ffff80000010c7c5:	10 10                	adc    %dl,(%rax)
ffff80000010c7c7:	10 10                	adc    %dl,(%rax)
ffff80000010c7c9:	10 10                	adc    %dl,(%rax)
ffff80000010c7cb:	10 10                	adc    %dl,(%rax)
ffff80000010c7cd:	38 00                	cmp    %al,(%rax)
ffff80000010c7cf:	00 00                	add    %al,(%rax)
ffff80000010c7d1:	00 00                	add    %al,(%rax)
ffff80000010c7d3:	00 00                	add    %al,(%rax)
ffff80000010c7d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010c7d9:	49                   	rex.WB
ffff80000010c7da:	49                   	rex.WB
ffff80000010c7db:	49                   	rex.WB
ffff80000010c7dc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010c7df:	00 00                	add    %al,(%rax)
ffff80000010c7e1:	00 00                	add    %al,(%rax)
ffff80000010c7e3:	00 00                	add    %al,(%rax)
ffff80000010c7e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010c7e9:	42                   	rex.X
ffff80000010c7ea:	42                   	rex.X
ffff80000010c7eb:	42                   	rex.X
ffff80000010c7ec:	42 e3 00             	rex.X jrcxz ffff80000010c7ef <system_call_table+0xaef>
ffff80000010c7ef:	00 00                	add    %al,(%rax)
ffff80000010c7f1:	00 00                	add    %al,(%rax)
ffff80000010c7f3:	00 00                	add    %al,(%rax)
ffff80000010c7f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c7f9:	82                   	(bad)  
ffff80000010c7fa:	82                   	(bad)  
ffff80000010c7fb:	82                   	(bad)  
ffff80000010c7fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c7ff:	00 00                	add    %al,(%rax)
ffff80000010c801:	00 00                	add    %al,(%rax)
ffff80000010c803:	00 d8                	add    %bl,%al
ffff80000010c805:	64 42                	fs rex.X
ffff80000010c807:	42                   	rex.X
ffff80000010c808:	42                   	rex.X
ffff80000010c809:	42                   	rex.X
ffff80000010c80a:	42                   	rex.X
ffff80000010c80b:	64 58                	fs pop %rax
ffff80000010c80d:	40                   	rex
ffff80000010c80e:	40 e0 00             	rex loopne ffff80000010c811 <system_call_table+0xb11>
ffff80000010c811:	00 00                	add    %al,(%rax)
ffff80000010c813:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010c816:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010c81d:	04 04                	add    $0x4,%al
ffff80000010c81f:	0e                   	(bad)  
ffff80000010c820:	00 00                	add    %al,(%rax)
ffff80000010c822:	00 00                	add    %al,(%rax)
ffff80000010c824:	00 dc                	add    %bl,%ah
ffff80000010c826:	62 42                	(bad)  
ffff80000010c828:	40                   	rex
ffff80000010c829:	40                   	rex
ffff80000010c82a:	40                   	rex
ffff80000010c82b:	40                   	rex
ffff80000010c82c:	40 e0 00             	rex loopne ffff80000010c82f <system_call_table+0xb2f>
ffff80000010c82f:	00 00                	add    %al,(%rax)
ffff80000010c831:	00 00                	add    %al,(%rax)
ffff80000010c833:	00 00                	add    %al,(%rax)
ffff80000010c835:	7a 86                	jp     ffff80000010c7bd <system_call_table+0xabd>
ffff80000010c837:	82                   	(bad)  
ffff80000010c838:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010c83b:	82                   	(bad)  
ffff80000010c83c:	c2 bc 00             	retq   $0xbc
ffff80000010c83f:	00 00                	add    %al,(%rax)
ffff80000010c841:	00 10                	add    %dl,(%rax)
ffff80000010c843:	10 10                	adc    %dl,(%rax)
ffff80000010c845:	7c 10                	jl     ffff80000010c857 <system_call_table+0xb57>
ffff80000010c847:	10 10                	adc    %dl,(%rax)
ffff80000010c849:	10 10                	adc    %dl,(%rax)
ffff80000010c84b:	10 10                	adc    %dl,(%rax)
ffff80000010c84d:	0e                   	(bad)  
ffff80000010c84e:	00 00                	add    %al,(%rax)
ffff80000010c850:	00 00                	add    %al,(%rax)
ffff80000010c852:	00 00                	add    %al,(%rax)
ffff80000010c854:	00 c6                	add    %al,%dh
ffff80000010c856:	42                   	rex.X
ffff80000010c857:	42                   	rex.X
ffff80000010c858:	42                   	rex.X
ffff80000010c859:	42                   	rex.X
ffff80000010c85a:	42                   	rex.X
ffff80000010c85b:	42                   	rex.X
ffff80000010c85c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010c85f:	00 00                	add    %al,(%rax)
ffff80000010c861:	00 00                	add    %al,(%rax)
ffff80000010c863:	00 00                	add    %al,(%rax)
ffff80000010c865:	e7 42                	out    %eax,$0x42
ffff80000010c867:	42                   	rex.X
ffff80000010c868:	42 24 24             	rex.X and $0x24,%al
ffff80000010c86b:	24 18                	and    $0x18,%al
ffff80000010c86d:	18 00                	sbb    %al,(%rax)
ffff80000010c86f:	00 00                	add    %al,(%rax)
ffff80000010c871:	00 00                	add    %al,(%rax)
ffff80000010c873:	00 00                	add    %al,(%rax)
ffff80000010c875:	e7 42                	out    %eax,$0x42
ffff80000010c877:	42 5a                	rex.X pop %rdx
ffff80000010c879:	5a                   	pop    %rdx
ffff80000010c87a:	5a                   	pop    %rdx
ffff80000010c87b:	24 24                	and    $0x24,%al
ffff80000010c87d:	24 00                	and    $0x0,%al
ffff80000010c87f:	00 00                	add    %al,(%rax)
ffff80000010c881:	00 00                	add    %al,(%rax)
ffff80000010c883:	00 00                	add    %al,(%rax)
ffff80000010c885:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010c88a:	28 28                	sub    %ch,(%rax)
ffff80000010c88c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010c890:	00 00                	add    %al,(%rax)
ffff80000010c892:	00 00                	add    %al,(%rax)
ffff80000010c894:	00 e7                	add    %ah,%bh
ffff80000010c896:	42                   	rex.X
ffff80000010c897:	42 24 24             	rex.X and $0x24,%al
ffff80000010c89a:	24 18                	and    $0x18,%al
ffff80000010c89c:	18 10                	sbb    %dl,(%rax)
ffff80000010c89e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010c8a1:	00 00                	add    %al,(%rax)
ffff80000010c8a3:	00 00                	add    %al,(%rax)
ffff80000010c8a5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010c8ab:	42 82                	rex.X (bad) 
ffff80000010c8ad:	fe 00                	incb   (%rax)
ffff80000010c8af:	00 00                	add    %al,(%rax)
ffff80000010c8b1:	06                   	(bad)  
ffff80000010c8b2:	08 10                	or     %dl,(%rax)
ffff80000010c8b4:	10 10                	adc    %dl,(%rax)
ffff80000010c8b6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010c8b9:	10 10                	adc    %dl,(%rax)
ffff80000010c8bb:	10 08                	adc    %cl,(%rax)
ffff80000010c8bd:	06                   	(bad)  
ffff80000010c8be:	00 00                	add    %al,(%rax)
ffff80000010c8c0:	10 10                	adc    %dl,(%rax)
ffff80000010c8c2:	10 10                	adc    %dl,(%rax)
ffff80000010c8c4:	10 10                	adc    %dl,(%rax)
ffff80000010c8c6:	10 10                	adc    %dl,(%rax)
ffff80000010c8c8:	10 10                	adc    %dl,(%rax)
ffff80000010c8ca:	10 10                	adc    %dl,(%rax)
ffff80000010c8cc:	10 10                	adc    %dl,(%rax)
ffff80000010c8ce:	10 10                	adc    %dl,(%rax)
ffff80000010c8d0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010c8d3:	08 08                	or     %cl,(%rax)
ffff80000010c8d5:	08 08                	or     %cl,(%rax)
ffff80000010c8d7:	06                   	(bad)  
ffff80000010c8d8:	08 08                	or     %cl,(%rax)
ffff80000010c8da:	08 08                	or     %cl,(%rax)
ffff80000010c8dc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010c8df:	00 00                	add    %al,(%rax)
ffff80000010c8e1:	72 8c                	jb     ffff80000010c86f <system_call_table+0xb6f>
	...
ffff80000010d30f:	00 00                	add    %al,(%rax)
ffff80000010d311:	10 10                	adc    %dl,(%rax)
ffff80000010d313:	10 10                	adc    %dl,(%rax)
ffff80000010d315:	10 10                	adc    %dl,(%rax)
ffff80000010d317:	10 10                	adc    %dl,(%rax)
ffff80000010d319:	10 00                	adc    %al,(%rax)
ffff80000010d31b:	00 10                	add    %dl,(%rax)
ffff80000010d31d:	10 00                	adc    %al,(%rax)
ffff80000010d31f:	00 28                	add    %ch,(%rax)
ffff80000010d321:	28 28                	sub    %ch,(%rax)
	...
ffff80000010d32f:	00 00                	add    %al,(%rax)
ffff80000010d331:	44                   	rex.R
ffff80000010d332:	44                   	rex.R
ffff80000010d333:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d338:	44                   	rex.R
ffff80000010d339:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d33e:	00 00                	add    %al,(%rax)
ffff80000010d340:	10 3a                	adc    %bh,(%rdx)
ffff80000010d342:	56                   	push   %rsi
ffff80000010d343:	92                   	xchg   %eax,%edx
ffff80000010d344:	92                   	xchg   %eax,%edx
ffff80000010d345:	90                   	nop
ffff80000010d346:	50                   	push   %rax
ffff80000010d347:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010d34a:	92                   	xchg   %eax,%edx
ffff80000010d34b:	92                   	xchg   %eax,%edx
ffff80000010d34c:	d4                   	(bad)  
ffff80000010d34d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010d352:	94                   	xchg   %eax,%esp
ffff80000010d353:	94                   	xchg   %eax,%esp
ffff80000010d354:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010d359:	2c 52                	sub    $0x52,%al
ffff80000010d35b:	52                   	push   %rdx
ffff80000010d35c:	92                   	xchg   %eax,%edx
ffff80000010d35d:	8c 00                	mov    %es,(%rax)
ffff80000010d35f:	00 00                	add    %al,(%rax)
ffff80000010d361:	70 88                	jo     ffff80000010d2eb <system_call_table+0x15eb>
ffff80000010d363:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010d369:	92                   	xchg   %eax,%edx
ffff80000010d36a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010d371:	08 10                	or     %dl,(%rax)
	...
ffff80000010d37f:	00 02                	add    %al,(%rdx)
ffff80000010d381:	04 08                	add    $0x8,%al
ffff80000010d383:	08 10                	or     %dl,(%rax)
ffff80000010d385:	10 10                	adc    %dl,(%rax)
ffff80000010d387:	10 10                	adc    %dl,(%rax)
ffff80000010d389:	10 10                	adc    %dl,(%rax)
ffff80000010d38b:	08 08                	or     %cl,(%rax)
ffff80000010d38d:	04 02                	add    $0x2,%al
ffff80000010d38f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010d395:	10 10                	adc    %dl,(%rax)
ffff80000010d397:	10 10                	adc    %dl,(%rax)
ffff80000010d399:	10 10                	adc    %dl,(%rax)
ffff80000010d39b:	20 20                	and    %ah,(%rax)
ffff80000010d39d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d3a1:	00 00                	add    %al,(%rax)
ffff80000010d3a3:	00 00                	add    %al,(%rax)
ffff80000010d3a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010d3ab:	10 00                	adc    %al,(%rax)
	...
ffff80000010d3b5:	10 10                	adc    %dl,(%rax)
ffff80000010d3b7:	10 fe                	adc    %bh,%dh
ffff80000010d3b9:	10 10                	adc    %dl,(%rax)
ffff80000010d3bb:	10 00                	adc    %al,(%rax)
	...
ffff80000010d3c9:	00 00                	add    %al,(%rax)
ffff80000010d3cb:	18 18                	sbb    %bl,(%rax)
ffff80000010d3cd:	08 08                	or     %cl,(%rax)
ffff80000010d3cf:	10 00                	adc    %al,(%rax)
ffff80000010d3d1:	00 00                	add    %al,(%rax)
ffff80000010d3d3:	00 00                	add    %al,(%rax)
ffff80000010d3d5:	00 00                	add    %al,(%rax)
ffff80000010d3d7:	00 fe                	add    %bh,%dh
	...
ffff80000010d3e9:	00 00                	add    %al,(%rax)
ffff80000010d3eb:	00 18                	add    %bl,(%rax)
ffff80000010d3ed:	18 00                	sbb    %al,(%rax)
ffff80000010d3ef:	00 02                	add    %al,(%rdx)
ffff80000010d3f1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010d3f4:	08 08                	or     %cl,(%rax)
ffff80000010d3f6:	08 10                	or     %dl,(%rax)
ffff80000010d3f8:	10 20                	adc    %ah,(%rax)
ffff80000010d3fa:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d3fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010d404:	42 
ffff80000010d405:	42                   	rex.X
ffff80000010d406:	42                   	rex.X
ffff80000010d407:	42                   	rex.X
ffff80000010d408:	42                   	rex.X
ffff80000010d409:	42                   	rex.X
ffff80000010d40a:	42 24 24             	rex.X and $0x24,%al
ffff80000010d40d:	18 00                	sbb    %al,(%rax)
ffff80000010d40f:	00 00                	add    %al,(%rax)
ffff80000010d411:	08 18                	or     %bl,(%rax)
ffff80000010d413:	28 08                	sub    %cl,(%rax)
ffff80000010d415:	08 08                	or     %cl,(%rax)
ffff80000010d417:	08 08                	or     %cl,(%rax)
ffff80000010d419:	08 08                	or     %cl,(%rax)
ffff80000010d41b:	08 08                	or     %cl,(%rax)
ffff80000010d41d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010d420:	00 18                	add    %bl,(%rax)
ffff80000010d422:	24 42                	and    $0x42,%al
ffff80000010d424:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010d428:	10 20                	adc    %ah,(%rax)
ffff80000010d42a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d42d:	7e 00                	jle    ffff80000010d42f <system_call_table+0x172f>
ffff80000010d42f:	00 00                	add    %al,(%rax)
ffff80000010d431:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010d434:	02 02                	add    (%rdx),%al
ffff80000010d436:	04 18                	add    $0x18,%al
ffff80000010d438:	04 02                	add    $0x2,%al
ffff80000010d43a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010d43d:	18 00                	sbb    %al,(%rax)
ffff80000010d43f:	00 00                	add    %al,(%rax)
ffff80000010d441:	0c 0c                	or     $0xc,%al
ffff80000010d443:	0c 14                	or     $0x14,%al
ffff80000010d445:	14 14                	adc    $0x14,%al
ffff80000010d447:	24 24                	and    $0x24,%al
ffff80000010d449:	44 7e 04             	rex.R jle ffff80000010d450 <system_call_table+0x1750>
ffff80000010d44c:	04 1e                	add    $0x1e,%al
ffff80000010d44e:	00 00                	add    %al,(%rax)
ffff80000010d450:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010d454:	40 58                	rex pop %rax
ffff80000010d456:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010d459:	02 02                	add    (%rdx),%al
ffff80000010d45b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d45e:	00 00                	add    %al,(%rax)
ffff80000010d460:	00 18                	add    %bl,(%rax)
ffff80000010d462:	24 42                	and    $0x42,%al
ffff80000010d464:	40 58                	rex pop %rax
ffff80000010d466:	64 42                	fs rex.X
ffff80000010d468:	42                   	rex.X
ffff80000010d469:	42                   	rex.X
ffff80000010d46a:	42                   	rex.X
ffff80000010d46b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d46e:	00 00                	add    %al,(%rax)
ffff80000010d470:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010d473:	42 04 04             	rex.X add $0x4,%al
ffff80000010d476:	08 08                	or     %cl,(%rax)
ffff80000010d478:	08 10                	or     %dl,(%rax)
ffff80000010d47a:	10 10                	adc    %dl,(%rax)
ffff80000010d47c:	10 38                	adc    %bh,(%rax)
ffff80000010d47e:	00 00                	add    %al,(%rax)
ffff80000010d480:	00 18                	add    %bl,(%rax)
ffff80000010d482:	24 42                	and    $0x42,%al
ffff80000010d484:	42                   	rex.X
ffff80000010d485:	42 24 18             	rex.X and $0x18,%al
ffff80000010d488:	24 42                	and    $0x42,%al
ffff80000010d48a:	42                   	rex.X
ffff80000010d48b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d48e:	00 00                	add    %al,(%rax)
ffff80000010d490:	00 18                	add    %bl,(%rax)
ffff80000010d492:	24 42                	and    $0x42,%al
ffff80000010d494:	42                   	rex.X
ffff80000010d495:	42                   	rex.X
ffff80000010d496:	42                   	rex.X
ffff80000010d497:	42                   	rex.X
ffff80000010d498:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010d49b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d49e:	00 00                	add    %al,(%rax)
ffff80000010d4a0:	00 00                	add    %al,(%rax)
ffff80000010d4a2:	00 00                	add    %al,(%rax)
ffff80000010d4a4:	00 18                	add    %bl,(%rax)
ffff80000010d4a6:	18 00                	sbb    %al,(%rax)
ffff80000010d4a8:	00 00                	add    %al,(%rax)
ffff80000010d4aa:	00 00                	add    %al,(%rax)
ffff80000010d4ac:	18 18                	sbb    %bl,(%rax)
ffff80000010d4ae:	00 00                	add    %al,(%rax)
ffff80000010d4b0:	00 00                	add    %al,(%rax)
ffff80000010d4b2:	00 00                	add    %al,(%rax)
ffff80000010d4b4:	00 18                	add    %bl,(%rax)
ffff80000010d4b6:	18 00                	sbb    %al,(%rax)
ffff80000010d4b8:	00 00                	add    %al,(%rax)
ffff80000010d4ba:	00 18                	add    %bl,(%rax)
ffff80000010d4bc:	18 08                	sbb    %cl,(%rax)
ffff80000010d4be:	08 10                	or     %dl,(%rax)
ffff80000010d4c0:	00 02                	add    %al,(%rdx)
ffff80000010d4c2:	04 08                	add    $0x8,%al
ffff80000010d4c4:	10 20                	adc    %ah,(%rax)
ffff80000010d4c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010d4cd:	04 
ffff80000010d4ce:	02 00                	add    (%rax),%al
ffff80000010d4d0:	00 00                	add    %al,(%rax)
ffff80000010d4d2:	00 00                	add    %al,(%rax)
ffff80000010d4d4:	00 00                	add    %al,(%rax)
ffff80000010d4d6:	fe 00                	incb   (%rax)
ffff80000010d4d8:	00 fe                	add    %bh,%dh
ffff80000010d4da:	00 00                	add    %al,(%rax)
ffff80000010d4dc:	00 00                	add    %al,(%rax)
ffff80000010d4de:	00 00                	add    %al,(%rax)
ffff80000010d4e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010d4e6:	04 02                	add    $0x2,%al
ffff80000010d4e8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010d4eb:	10 20                	adc    %ah,(%rax)
ffff80000010d4ed:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d4f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d4f5:	82                   	(bad)  
ffff80000010d4f6:	04 08                	add    $0x8,%al
ffff80000010d4f8:	10 10                	adc    %dl,(%rax)
ffff80000010d4fa:	00 00                	add    %al,(%rax)
ffff80000010d4fc:	18 18                	sbb    %bl,(%rax)
ffff80000010d4fe:	00 00                	add    %al,(%rax)
ffff80000010d500:	00 38                	add    %bh,(%rax)
ffff80000010d502:	44 82                	rex.R (bad) 
ffff80000010d504:	9a                   	(bad)  
ffff80000010d505:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d506:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d507:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d508:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d509:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d50a:	9c                   	pushfq 
ffff80000010d50b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010d50f:	00 00                	add    %al,(%rax)
ffff80000010d511:	18 18                	sbb    %bl,(%rax)
ffff80000010d513:	18 18                	sbb    %bl,(%rax)
ffff80000010d515:	24 24                	and    $0x24,%al
ffff80000010d517:	24 24                	and    $0x24,%al
ffff80000010d519:	7e 42                	jle    ffff80000010d55d <system_call_table+0x185d>
ffff80000010d51b:	42                   	rex.X
ffff80000010d51c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d51f:	00 00                	add    %al,(%rax)
ffff80000010d521:	f0 48                	lock rex.W
ffff80000010d523:	44                   	rex.R
ffff80000010d524:	44                   	rex.R
ffff80000010d525:	44                   	rex.R
ffff80000010d526:	48 78 44             	rex.W js ffff80000010d56d <system_call_table+0x186d>
ffff80000010d529:	42                   	rex.X
ffff80000010d52a:	42                   	rex.X
ffff80000010d52b:	42                   	rex.X
ffff80000010d52c:	44 f8                	rex.R clc 
ffff80000010d52e:	00 00                	add    %al,(%rax)
ffff80000010d530:	00 3a                	add    %bh,(%rdx)
ffff80000010d532:	46                   	rex.RX
ffff80000010d533:	42 82                	rex.X (bad) 
ffff80000010d535:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010d53c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d53f:	00 00                	add    %al,(%rax)
ffff80000010d541:	f8                   	clc    
ffff80000010d542:	44                   	rex.R
ffff80000010d543:	44                   	rex.R
ffff80000010d544:	42                   	rex.X
ffff80000010d545:	42                   	rex.X
ffff80000010d546:	42                   	rex.X
ffff80000010d547:	42                   	rex.X
ffff80000010d548:	42                   	rex.X
ffff80000010d549:	42                   	rex.X
ffff80000010d54a:	42                   	rex.X
ffff80000010d54b:	44                   	rex.R
ffff80000010d54c:	44 f8                	rex.R clc 
ffff80000010d54e:	00 00                	add    %al,(%rax)
ffff80000010d550:	00 fe                	add    %bh,%dh
ffff80000010d552:	42                   	rex.X
ffff80000010d553:	42                   	rex.X
ffff80000010d554:	40                   	rex
ffff80000010d555:	40                   	rex
ffff80000010d556:	44 7c 44             	rex.R jl ffff80000010d59d <system_call_table+0x189d>
ffff80000010d559:	40                   	rex
ffff80000010d55a:	40                   	rex
ffff80000010d55b:	42                   	rex.X
ffff80000010d55c:	42 fe 00             	rex.X incb (%rax)
ffff80000010d55f:	00 00                	add    %al,(%rax)
ffff80000010d561:	fe 42 42             	incb   0x42(%rdx)
ffff80000010d564:	40                   	rex
ffff80000010d565:	40                   	rex
ffff80000010d566:	44 7c 44             	rex.R jl ffff80000010d5ad <system_call_table+0x18ad>
ffff80000010d569:	44                   	rex.R
ffff80000010d56a:	40                   	rex
ffff80000010d56b:	40                   	rex
ffff80000010d56c:	40                   	rex
ffff80000010d56d:	f0 00 00             	lock add %al,(%rax)
ffff80000010d570:	00 3a                	add    %bh,(%rdx)
ffff80000010d572:	46                   	rex.RX
ffff80000010d573:	42 82                	rex.X (bad) 
ffff80000010d575:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010d57c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010d57f:	00 00                	add    %al,(%rax)
ffff80000010d581:	e7 42                	out    %eax,$0x42
ffff80000010d583:	42                   	rex.X
ffff80000010d584:	42                   	rex.X
ffff80000010d585:	42                   	rex.X
ffff80000010d586:	42 7e 42             	rex.X jle ffff80000010d5cb <system_call_table+0x18cb>
ffff80000010d589:	42                   	rex.X
ffff80000010d58a:	42                   	rex.X
ffff80000010d58b:	42                   	rex.X
ffff80000010d58c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d58f:	00 00                	add    %al,(%rax)
ffff80000010d591:	7c 10                	jl     ffff80000010d5a3 <system_call_table+0x18a3>
ffff80000010d593:	10 10                	adc    %dl,(%rax)
ffff80000010d595:	10 10                	adc    %dl,(%rax)
ffff80000010d597:	10 10                	adc    %dl,(%rax)
ffff80000010d599:	10 10                	adc    %dl,(%rax)
ffff80000010d59b:	10 10                	adc    %dl,(%rax)
ffff80000010d59d:	7c 00                	jl     ffff80000010d59f <system_call_table+0x189f>
ffff80000010d59f:	00 00                	add    %al,(%rax)
ffff80000010d5a1:	1f                   	(bad)  
ffff80000010d5a2:	04 04                	add    $0x4,%al
ffff80000010d5a4:	04 04                	add    $0x4,%al
ffff80000010d5a6:	04 04                	add    $0x4,%al
ffff80000010d5a8:	04 04                	add    $0x4,%al
ffff80000010d5aa:	04 04                	add    $0x4,%al
ffff80000010d5ac:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010d5af:	00 00                	add    %al,(%rax)
ffff80000010d5b1:	e7 42                	out    %eax,$0x42
ffff80000010d5b3:	44                   	rex.R
ffff80000010d5b4:	48 50                	rex.W push %rax
ffff80000010d5b6:	50                   	push   %rax
ffff80000010d5b7:	60                   	(bad)  
ffff80000010d5b8:	50                   	push   %rax
ffff80000010d5b9:	50                   	push   %rax
ffff80000010d5ba:	48                   	rex.W
ffff80000010d5bb:	44                   	rex.R
ffff80000010d5bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d5bf:	00 00                	add    %al,(%rax)
ffff80000010d5c1:	f0 40                	lock rex
ffff80000010d5c3:	40                   	rex
ffff80000010d5c4:	40                   	rex
ffff80000010d5c5:	40                   	rex
ffff80000010d5c6:	40                   	rex
ffff80000010d5c7:	40                   	rex
ffff80000010d5c8:	40                   	rex
ffff80000010d5c9:	40                   	rex
ffff80000010d5ca:	40                   	rex
ffff80000010d5cb:	42                   	rex.X
ffff80000010d5cc:	42 fe 00             	rex.X incb (%rax)
ffff80000010d5cf:	00 00                	add    %al,(%rax)
ffff80000010d5d1:	c3                   	retq   
ffff80000010d5d2:	42                   	rex.X
ffff80000010d5d3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010d5d7:	5a                   	pop    %rdx
ffff80000010d5d8:	5a                   	pop    %rdx
ffff80000010d5d9:	42                   	rex.X
ffff80000010d5da:	42                   	rex.X
ffff80000010d5db:	42                   	rex.X
ffff80000010d5dc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d5df:	00 00                	add    %al,(%rax)
ffff80000010d5e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010d5e8:	4a                   	rex.WX
ffff80000010d5e9:	4a                   	rex.WX
ffff80000010d5ea:	4a                   	rex.WX
ffff80000010d5eb:	46                   	rex.RX
ffff80000010d5ec:	46 e2 00             	rex.RX loop ffff80000010d5ef <system_call_table+0x18ef>
ffff80000010d5ef:	00 00                	add    %al,(%rax)
ffff80000010d5f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d5f5:	82                   	(bad)  
ffff80000010d5f6:	82                   	(bad)  
ffff80000010d5f7:	82                   	(bad)  
ffff80000010d5f8:	82                   	(bad)  
ffff80000010d5f9:	82                   	(bad)  
ffff80000010d5fa:	82                   	(bad)  
ffff80000010d5fb:	82                   	(bad)  
ffff80000010d5fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d5ff:	00 00                	add    %al,(%rax)
ffff80000010d601:	f8                   	clc    
ffff80000010d602:	44                   	rex.R
ffff80000010d603:	42                   	rex.X
ffff80000010d604:	42                   	rex.X
ffff80000010d605:	42                   	rex.X
ffff80000010d606:	44 78 40             	rex.R js ffff80000010d649 <system_call_table+0x1949>
ffff80000010d609:	40                   	rex
ffff80000010d60a:	40                   	rex
ffff80000010d60b:	40                   	rex
ffff80000010d60c:	40                   	rex
ffff80000010d60d:	f0 00 00             	lock add %al,(%rax)
ffff80000010d610:	00 38                	add    %bh,(%rax)
ffff80000010d612:	44 82                	rex.R (bad) 
ffff80000010d614:	82                   	(bad)  
ffff80000010d615:	82                   	(bad)  
ffff80000010d616:	82                   	(bad)  
ffff80000010d617:	82                   	(bad)  
ffff80000010d618:	82                   	(bad)  
ffff80000010d619:	82                   	(bad)  
ffff80000010d61a:	92                   	xchg   %eax,%edx
ffff80000010d61b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010d61f:	00 00                	add    %al,(%rax)
ffff80000010d621:	fc                   	cld    
ffff80000010d622:	42                   	rex.X
ffff80000010d623:	42                   	rex.X
ffff80000010d624:	42                   	rex.X
ffff80000010d625:	42 7c 44             	rex.X jl ffff80000010d66c <system_call_table+0x196c>
ffff80000010d628:	42                   	rex.X
ffff80000010d629:	42                   	rex.X
ffff80000010d62a:	42                   	rex.X
ffff80000010d62b:	42                   	rex.X
ffff80000010d62c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d62f:	00 00                	add    %al,(%rax)
ffff80000010d631:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010d634:	82                   	(bad)  
ffff80000010d635:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010d639:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010d63f:	00 00                	add    %al,(%rax)
ffff80000010d641:	fe                   	(bad)  
ffff80000010d642:	92                   	xchg   %eax,%edx
ffff80000010d643:	92                   	xchg   %eax,%edx
ffff80000010d644:	10 10                	adc    %dl,(%rax)
ffff80000010d646:	10 10                	adc    %dl,(%rax)
ffff80000010d648:	10 10                	adc    %dl,(%rax)
ffff80000010d64a:	10 10                	adc    %dl,(%rax)
ffff80000010d64c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010d650:	00 e7                	add    %ah,%bh
ffff80000010d652:	42                   	rex.X
ffff80000010d653:	42                   	rex.X
ffff80000010d654:	42                   	rex.X
ffff80000010d655:	42                   	rex.X
ffff80000010d656:	42                   	rex.X
ffff80000010d657:	42                   	rex.X
ffff80000010d658:	42                   	rex.X
ffff80000010d659:	42                   	rex.X
ffff80000010d65a:	42                   	rex.X
ffff80000010d65b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010d65e:	00 00                	add    %al,(%rax)
ffff80000010d660:	00 e7                	add    %ah,%bh
ffff80000010d662:	42                   	rex.X
ffff80000010d663:	42                   	rex.X
ffff80000010d664:	42                   	rex.X
ffff80000010d665:	42 24 24             	rex.X and $0x24,%al
ffff80000010d668:	24 24                	and    $0x24,%al
ffff80000010d66a:	18 18                	sbb    %bl,(%rax)
ffff80000010d66c:	18 18                	sbb    %bl,(%rax)
ffff80000010d66e:	00 00                	add    %al,(%rax)
ffff80000010d670:	00 e7                	add    %ah,%bh
ffff80000010d672:	42                   	rex.X
ffff80000010d673:	42                   	rex.X
ffff80000010d674:	42 5a                	rex.X pop %rdx
ffff80000010d676:	5a                   	pop    %rdx
ffff80000010d677:	5a                   	pop    %rdx
ffff80000010d678:	5a                   	pop    %rdx
ffff80000010d679:	24 24                	and    $0x24,%al
ffff80000010d67b:	24 24                	and    $0x24,%al
ffff80000010d67d:	24 00                	and    $0x0,%al
ffff80000010d67f:	00 00                	add    %al,(%rax)
ffff80000010d681:	e7 42                	out    %eax,$0x42
ffff80000010d683:	42 24 24             	rex.X and $0x24,%al
ffff80000010d686:	24 18                	and    $0x18,%al
ffff80000010d688:	24 24                	and    $0x24,%al
ffff80000010d68a:	24 42                	and    $0x42,%al
ffff80000010d68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d68f:	00 00                	add    %al,(%rax)
ffff80000010d691:	ee                   	out    %al,(%dx)
ffff80000010d692:	44                   	rex.R
ffff80000010d693:	44                   	rex.R
ffff80000010d694:	44 28 28             	sub    %r13b,(%rax)
ffff80000010d697:	28 10                	sub    %dl,(%rax)
ffff80000010d699:	10 10                	adc    %dl,(%rax)
ffff80000010d69b:	10 10                	adc    %dl,(%rax)
ffff80000010d69d:	7c 00                	jl     ffff80000010d69f <system_call_table+0x199f>
ffff80000010d69f:	00 00                	add    %al,(%rax)
ffff80000010d6a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010d6a8:	20 20                	and    %ah,(%rax)
ffff80000010d6aa:	40                   	rex
ffff80000010d6ab:	42 82                	rex.X (bad) 
ffff80000010d6ad:	fe 00                	incb   (%rax)
ffff80000010d6af:	00 00                	add    %al,(%rax)
ffff80000010d6b1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010d6b4:	20 20                	and    %ah,(%rax)
ffff80000010d6b6:	20 20                	and    %ah,(%rax)
ffff80000010d6b8:	20 20                	and    %ah,(%rax)
ffff80000010d6ba:	20 20                	and    %ah,(%rax)
ffff80000010d6bc:	20 20                	and    %ah,(%rax)
ffff80000010d6be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010d6c5:	20 20                	and    %ah,(%rax)
ffff80000010d6c7:	10 10                	adc    %dl,(%rax)
ffff80000010d6c9:	08 08                	or     %cl,(%rax)
ffff80000010d6cb:	04 04                	add    $0x4,%al
ffff80000010d6cd:	04 02                	add    $0x2,%al
ffff80000010d6cf:	02 00                	add    (%rax),%al
ffff80000010d6d1:	7c 04                	jl     ffff80000010d6d7 <system_call_table+0x19d7>
ffff80000010d6d3:	04 04                	add    $0x4,%al
ffff80000010d6d5:	04 04                	add    $0x4,%al
ffff80000010d6d7:	04 04                	add    $0x4,%al
ffff80000010d6d9:	04 04                	add    $0x4,%al
ffff80000010d6db:	04 04                	add    $0x4,%al
ffff80000010d6dd:	04 7c                	add    $0x7c,%al
ffff80000010d6df:	00 00                	add    %al,(%rax)
ffff80000010d6e1:	10 28                	adc    %ch,(%rax)
ffff80000010d6e3:	44 82                	rex.R (bad) 
	...
ffff80000010d6fd:	00 fe                	add    %bh,%dh
ffff80000010d6ff:	00 10                	add    %dl,(%rax)
ffff80000010d701:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010d714:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010d717:	04 3c                	add    $0x3c,%al
ffff80000010d719:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010d720:	c0 
ffff80000010d721:	40                   	rex
ffff80000010d722:	40                   	rex
ffff80000010d723:	40                   	rex
ffff80000010d724:	40 58                	rex pop %rax
ffff80000010d726:	64 42                	fs rex.X
ffff80000010d728:	42                   	rex.X
ffff80000010d729:	42                   	rex.X
ffff80000010d72a:	42                   	rex.X
ffff80000010d72b:	42                   	rex.X
ffff80000010d72c:	64 58                	fs pop %rax
ffff80000010d72e:	00 00                	add    %al,(%rax)
ffff80000010d730:	00 00                	add    %al,(%rax)
ffff80000010d732:	00 00                	add    %al,(%rax)
ffff80000010d734:	00 30                	add    %dh,(%rax)
ffff80000010d736:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010d73d:	38 
ffff80000010d73e:	00 00                	add    %al,(%rax)
ffff80000010d740:	0c 04                	or     $0x4,%al
ffff80000010d742:	04 04                	add    $0x4,%al
ffff80000010d744:	04 34                	add    $0x34,%al
ffff80000010d746:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010d74d:	36 
ffff80000010d74e:	00 00                	add    %al,(%rax)
ffff80000010d750:	00 00                	add    %al,(%rax)
ffff80000010d752:	00 00                	add    %al,(%rax)
ffff80000010d754:	00 38                	add    %bh,(%rax)
ffff80000010d756:	44 82                	rex.R (bad) 
ffff80000010d758:	82                   	(bad)  
ffff80000010d759:	fc                   	cld    
ffff80000010d75a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010d761:	10 10                	adc    %dl,(%rax)
ffff80000010d763:	10 10                	adc    %dl,(%rax)
ffff80000010d765:	7c 10                	jl     ffff80000010d777 <system_call_table+0x1a77>
ffff80000010d767:	10 10                	adc    %dl,(%rax)
ffff80000010d769:	10 10                	adc    %dl,(%rax)
ffff80000010d76b:	10 10                	adc    %dl,(%rax)
ffff80000010d76d:	7c 00                	jl     ffff80000010d76f <system_call_table+0x1a6f>
ffff80000010d76f:	00 00                	add    %al,(%rax)
ffff80000010d771:	00 00                	add    %al,(%rax)
ffff80000010d773:	00 00                	add    %al,(%rax)
ffff80000010d775:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010d77c:	34 04 
ffff80000010d77e:	04 38                	add    $0x38,%al
ffff80000010d780:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010d784:	40 58                	rex pop %rax
ffff80000010d786:	64 42                	fs rex.X
ffff80000010d788:	42                   	rex.X
ffff80000010d789:	42                   	rex.X
ffff80000010d78a:	42                   	rex.X
ffff80000010d78b:	42                   	rex.X
ffff80000010d78c:	42 e3 00             	rex.X jrcxz ffff80000010d78f <system_call_table+0x1a8f>
ffff80000010d78f:	00 00                	add    %al,(%rax)
ffff80000010d791:	10 10                	adc    %dl,(%rax)
ffff80000010d793:	00 00                	add    %al,(%rax)
ffff80000010d795:	30 10                	xor    %dl,(%rax)
ffff80000010d797:	10 10                	adc    %dl,(%rax)
ffff80000010d799:	10 10                	adc    %dl,(%rax)
ffff80000010d79b:	10 10                	adc    %dl,(%rax)
ffff80000010d79d:	38 00                	cmp    %al,(%rax)
ffff80000010d79f:	00 00                	add    %al,(%rax)
ffff80000010d7a1:	04 04                	add    $0x4,%al
ffff80000010d7a3:	00 00                	add    %al,(%rax)
ffff80000010d7a5:	0c 04                	or     $0x4,%al
ffff80000010d7a7:	04 04                	add    $0x4,%al
ffff80000010d7a9:	04 04                	add    $0x4,%al
ffff80000010d7ab:	04 04                	add    $0x4,%al
ffff80000010d7ad:	08 08                	or     %cl,(%rax)
ffff80000010d7af:	30 c0                	xor    %al,%al
ffff80000010d7b1:	40                   	rex
ffff80000010d7b2:	40                   	rex
ffff80000010d7b3:	40                   	rex
ffff80000010d7b4:	40                   	rex
ffff80000010d7b5:	4e                   	rex.WRX
ffff80000010d7b6:	44                   	rex.R
ffff80000010d7b7:	48 50                	rex.W push %rax
ffff80000010d7b9:	60                   	(bad)  
ffff80000010d7ba:	50                   	push   %rax
ffff80000010d7bb:	48                   	rex.W
ffff80000010d7bc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010d7bf:	00 30                	add    %dh,(%rax)
ffff80000010d7c1:	10 10                	adc    %dl,(%rax)
ffff80000010d7c3:	10 10                	adc    %dl,(%rax)
ffff80000010d7c5:	10 10                	adc    %dl,(%rax)
ffff80000010d7c7:	10 10                	adc    %dl,(%rax)
ffff80000010d7c9:	10 10                	adc    %dl,(%rax)
ffff80000010d7cb:	10 10                	adc    %dl,(%rax)
ffff80000010d7cd:	38 00                	cmp    %al,(%rax)
ffff80000010d7cf:	00 00                	add    %al,(%rax)
ffff80000010d7d1:	00 00                	add    %al,(%rax)
ffff80000010d7d3:	00 00                	add    %al,(%rax)
ffff80000010d7d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010d7d9:	49                   	rex.WB
ffff80000010d7da:	49                   	rex.WB
ffff80000010d7db:	49                   	rex.WB
ffff80000010d7dc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010d7df:	00 00                	add    %al,(%rax)
ffff80000010d7e1:	00 00                	add    %al,(%rax)
ffff80000010d7e3:	00 00                	add    %al,(%rax)
ffff80000010d7e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010d7e9:	42                   	rex.X
ffff80000010d7ea:	42                   	rex.X
ffff80000010d7eb:	42                   	rex.X
ffff80000010d7ec:	42 e3 00             	rex.X jrcxz ffff80000010d7ef <system_call_table+0x1aef>
ffff80000010d7ef:	00 00                	add    %al,(%rax)
ffff80000010d7f1:	00 00                	add    %al,(%rax)
ffff80000010d7f3:	00 00                	add    %al,(%rax)
ffff80000010d7f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d7f9:	82                   	(bad)  
ffff80000010d7fa:	82                   	(bad)  
ffff80000010d7fb:	82                   	(bad)  
ffff80000010d7fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d7ff:	00 00                	add    %al,(%rax)
ffff80000010d801:	00 00                	add    %al,(%rax)
ffff80000010d803:	00 d8                	add    %bl,%al
ffff80000010d805:	64 42                	fs rex.X
ffff80000010d807:	42                   	rex.X
ffff80000010d808:	42                   	rex.X
ffff80000010d809:	42                   	rex.X
ffff80000010d80a:	42                   	rex.X
ffff80000010d80b:	64 58                	fs pop %rax
ffff80000010d80d:	40                   	rex
ffff80000010d80e:	40 e0 00             	rex loopne ffff80000010d811 <system_call_table+0x1b11>
ffff80000010d811:	00 00                	add    %al,(%rax)
ffff80000010d813:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010d816:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010d81d:	04 04                	add    $0x4,%al
ffff80000010d81f:	0e                   	(bad)  
ffff80000010d820:	00 00                	add    %al,(%rax)
ffff80000010d822:	00 00                	add    %al,(%rax)
ffff80000010d824:	00 dc                	add    %bl,%ah
ffff80000010d826:	62 42                	(bad)  
ffff80000010d828:	40                   	rex
ffff80000010d829:	40                   	rex
ffff80000010d82a:	40                   	rex
ffff80000010d82b:	40                   	rex
ffff80000010d82c:	40 e0 00             	rex loopne ffff80000010d82f <system_call_table+0x1b2f>
ffff80000010d82f:	00 00                	add    %al,(%rax)
ffff80000010d831:	00 00                	add    %al,(%rax)
ffff80000010d833:	00 00                	add    %al,(%rax)
ffff80000010d835:	7a 86                	jp     ffff80000010d7bd <system_call_table+0x1abd>
ffff80000010d837:	82                   	(bad)  
ffff80000010d838:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010d83b:	82                   	(bad)  
ffff80000010d83c:	c2 bc 00             	retq   $0xbc
ffff80000010d83f:	00 00                	add    %al,(%rax)
ffff80000010d841:	00 10                	add    %dl,(%rax)
ffff80000010d843:	10 10                	adc    %dl,(%rax)
ffff80000010d845:	7c 10                	jl     ffff80000010d857 <system_call_table+0x1b57>
ffff80000010d847:	10 10                	adc    %dl,(%rax)
ffff80000010d849:	10 10                	adc    %dl,(%rax)
ffff80000010d84b:	10 10                	adc    %dl,(%rax)
ffff80000010d84d:	0e                   	(bad)  
ffff80000010d84e:	00 00                	add    %al,(%rax)
ffff80000010d850:	00 00                	add    %al,(%rax)
ffff80000010d852:	00 00                	add    %al,(%rax)
ffff80000010d854:	00 c6                	add    %al,%dh
ffff80000010d856:	42                   	rex.X
ffff80000010d857:	42                   	rex.X
ffff80000010d858:	42                   	rex.X
ffff80000010d859:	42                   	rex.X
ffff80000010d85a:	42                   	rex.X
ffff80000010d85b:	42                   	rex.X
ffff80000010d85c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010d85f:	00 00                	add    %al,(%rax)
ffff80000010d861:	00 00                	add    %al,(%rax)
ffff80000010d863:	00 00                	add    %al,(%rax)
ffff80000010d865:	e7 42                	out    %eax,$0x42
ffff80000010d867:	42                   	rex.X
ffff80000010d868:	42 24 24             	rex.X and $0x24,%al
ffff80000010d86b:	24 18                	and    $0x18,%al
ffff80000010d86d:	18 00                	sbb    %al,(%rax)
ffff80000010d86f:	00 00                	add    %al,(%rax)
ffff80000010d871:	00 00                	add    %al,(%rax)
ffff80000010d873:	00 00                	add    %al,(%rax)
ffff80000010d875:	e7 42                	out    %eax,$0x42
ffff80000010d877:	42 5a                	rex.X pop %rdx
ffff80000010d879:	5a                   	pop    %rdx
ffff80000010d87a:	5a                   	pop    %rdx
ffff80000010d87b:	24 24                	and    $0x24,%al
ffff80000010d87d:	24 00                	and    $0x0,%al
ffff80000010d87f:	00 00                	add    %al,(%rax)
ffff80000010d881:	00 00                	add    %al,(%rax)
ffff80000010d883:	00 00                	add    %al,(%rax)
ffff80000010d885:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010d88a:	28 28                	sub    %ch,(%rax)
ffff80000010d88c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010d890:	00 00                	add    %al,(%rax)
ffff80000010d892:	00 00                	add    %al,(%rax)
ffff80000010d894:	00 e7                	add    %ah,%bh
ffff80000010d896:	42                   	rex.X
ffff80000010d897:	42 24 24             	rex.X and $0x24,%al
ffff80000010d89a:	24 18                	and    $0x18,%al
ffff80000010d89c:	18 10                	sbb    %dl,(%rax)
ffff80000010d89e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010d8a1:	00 00                	add    %al,(%rax)
ffff80000010d8a3:	00 00                	add    %al,(%rax)
ffff80000010d8a5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010d8ab:	42 82                	rex.X (bad) 
ffff80000010d8ad:	fe 00                	incb   (%rax)
ffff80000010d8af:	00 00                	add    %al,(%rax)
ffff80000010d8b1:	06                   	(bad)  
ffff80000010d8b2:	08 10                	or     %dl,(%rax)
ffff80000010d8b4:	10 10                	adc    %dl,(%rax)
ffff80000010d8b6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010d8b9:	10 10                	adc    %dl,(%rax)
ffff80000010d8bb:	10 08                	adc    %cl,(%rax)
ffff80000010d8bd:	06                   	(bad)  
ffff80000010d8be:	00 00                	add    %al,(%rax)
ffff80000010d8c0:	10 10                	adc    %dl,(%rax)
ffff80000010d8c2:	10 10                	adc    %dl,(%rax)
ffff80000010d8c4:	10 10                	adc    %dl,(%rax)
ffff80000010d8c6:	10 10                	adc    %dl,(%rax)
ffff80000010d8c8:	10 10                	adc    %dl,(%rax)
ffff80000010d8ca:	10 10                	adc    %dl,(%rax)
ffff80000010d8cc:	10 10                	adc    %dl,(%rax)
ffff80000010d8ce:	10 10                	adc    %dl,(%rax)
ffff80000010d8d0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010d8d3:	08 08                	or     %cl,(%rax)
ffff80000010d8d5:	08 08                	or     %cl,(%rax)
ffff80000010d8d7:	06                   	(bad)  
ffff80000010d8d8:	08 08                	or     %cl,(%rax)
ffff80000010d8da:	08 08                	or     %cl,(%rax)
ffff80000010d8dc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010d8df:	00 00                	add    %al,(%rax)
ffff80000010d8e1:	72 8c                	jb     ffff80000010d86f <system_call_table+0x1b6f>
	...
ffff80000010e30f:	00 00                	add    %al,(%rax)
ffff80000010e311:	10 10                	adc    %dl,(%rax)
ffff80000010e313:	10 10                	adc    %dl,(%rax)
ffff80000010e315:	10 10                	adc    %dl,(%rax)
ffff80000010e317:	10 10                	adc    %dl,(%rax)
ffff80000010e319:	10 00                	adc    %al,(%rax)
ffff80000010e31b:	00 10                	add    %dl,(%rax)
ffff80000010e31d:	10 00                	adc    %al,(%rax)
ffff80000010e31f:	00 28                	add    %ch,(%rax)
ffff80000010e321:	28 28                	sub    %ch,(%rax)
	...
ffff80000010e32f:	00 00                	add    %al,(%rax)
ffff80000010e331:	44                   	rex.R
ffff80000010e332:	44                   	rex.R
ffff80000010e333:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e338:	44                   	rex.R
ffff80000010e339:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e33e:	00 00                	add    %al,(%rax)
ffff80000010e340:	10 3a                	adc    %bh,(%rdx)
ffff80000010e342:	56                   	push   %rsi
ffff80000010e343:	92                   	xchg   %eax,%edx
ffff80000010e344:	92                   	xchg   %eax,%edx
ffff80000010e345:	90                   	nop
ffff80000010e346:	50                   	push   %rax
ffff80000010e347:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010e34a:	92                   	xchg   %eax,%edx
ffff80000010e34b:	92                   	xchg   %eax,%edx
ffff80000010e34c:	d4                   	(bad)  
ffff80000010e34d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010e352:	94                   	xchg   %eax,%esp
ffff80000010e353:	94                   	xchg   %eax,%esp
ffff80000010e354:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010e359:	2c 52                	sub    $0x52,%al
ffff80000010e35b:	52                   	push   %rdx
ffff80000010e35c:	92                   	xchg   %eax,%edx
ffff80000010e35d:	8c 00                	mov    %es,(%rax)
ffff80000010e35f:	00 00                	add    %al,(%rax)
ffff80000010e361:	70 88                	jo     ffff80000010e2eb <system_call_table+0x25eb>
ffff80000010e363:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010e369:	92                   	xchg   %eax,%edx
ffff80000010e36a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010e371:	08 10                	or     %dl,(%rax)
	...
ffff80000010e37f:	00 02                	add    %al,(%rdx)
ffff80000010e381:	04 08                	add    $0x8,%al
ffff80000010e383:	08 10                	or     %dl,(%rax)
ffff80000010e385:	10 10                	adc    %dl,(%rax)
ffff80000010e387:	10 10                	adc    %dl,(%rax)
ffff80000010e389:	10 10                	adc    %dl,(%rax)
ffff80000010e38b:	08 08                	or     %cl,(%rax)
ffff80000010e38d:	04 02                	add    $0x2,%al
ffff80000010e38f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010e395:	10 10                	adc    %dl,(%rax)
ffff80000010e397:	10 10                	adc    %dl,(%rax)
ffff80000010e399:	10 10                	adc    %dl,(%rax)
ffff80000010e39b:	20 20                	and    %ah,(%rax)
ffff80000010e39d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e3a1:	00 00                	add    %al,(%rax)
ffff80000010e3a3:	00 00                	add    %al,(%rax)
ffff80000010e3a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010e3ab:	10 00                	adc    %al,(%rax)
	...
ffff80000010e3b5:	10 10                	adc    %dl,(%rax)
ffff80000010e3b7:	10 fe                	adc    %bh,%dh
ffff80000010e3b9:	10 10                	adc    %dl,(%rax)
ffff80000010e3bb:	10 00                	adc    %al,(%rax)
	...
ffff80000010e3c9:	00 00                	add    %al,(%rax)
ffff80000010e3cb:	18 18                	sbb    %bl,(%rax)
ffff80000010e3cd:	08 08                	or     %cl,(%rax)
ffff80000010e3cf:	10 00                	adc    %al,(%rax)
ffff80000010e3d1:	00 00                	add    %al,(%rax)
ffff80000010e3d3:	00 00                	add    %al,(%rax)
ffff80000010e3d5:	00 00                	add    %al,(%rax)
ffff80000010e3d7:	00 fe                	add    %bh,%dh
	...
ffff80000010e3e9:	00 00                	add    %al,(%rax)
ffff80000010e3eb:	00 18                	add    %bl,(%rax)
ffff80000010e3ed:	18 00                	sbb    %al,(%rax)
ffff80000010e3ef:	00 02                	add    %al,(%rdx)
ffff80000010e3f1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010e3f4:	08 08                	or     %cl,(%rax)
ffff80000010e3f6:	08 10                	or     %dl,(%rax)
ffff80000010e3f8:	10 20                	adc    %ah,(%rax)
ffff80000010e3fa:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e3fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010e404:	42 
ffff80000010e405:	42                   	rex.X
ffff80000010e406:	42                   	rex.X
ffff80000010e407:	42                   	rex.X
ffff80000010e408:	42                   	rex.X
ffff80000010e409:	42                   	rex.X
ffff80000010e40a:	42 24 24             	rex.X and $0x24,%al
ffff80000010e40d:	18 00                	sbb    %al,(%rax)
ffff80000010e40f:	00 00                	add    %al,(%rax)
ffff80000010e411:	08 18                	or     %bl,(%rax)
ffff80000010e413:	28 08                	sub    %cl,(%rax)
ffff80000010e415:	08 08                	or     %cl,(%rax)
ffff80000010e417:	08 08                	or     %cl,(%rax)
ffff80000010e419:	08 08                	or     %cl,(%rax)
ffff80000010e41b:	08 08                	or     %cl,(%rax)
ffff80000010e41d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010e420:	00 18                	add    %bl,(%rax)
ffff80000010e422:	24 42                	and    $0x42,%al
ffff80000010e424:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010e428:	10 20                	adc    %ah,(%rax)
ffff80000010e42a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e42d:	7e 00                	jle    ffff80000010e42f <system_call_table+0x272f>
ffff80000010e42f:	00 00                	add    %al,(%rax)
ffff80000010e431:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010e434:	02 02                	add    (%rdx),%al
ffff80000010e436:	04 18                	add    $0x18,%al
ffff80000010e438:	04 02                	add    $0x2,%al
ffff80000010e43a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010e43d:	18 00                	sbb    %al,(%rax)
ffff80000010e43f:	00 00                	add    %al,(%rax)
ffff80000010e441:	0c 0c                	or     $0xc,%al
ffff80000010e443:	0c 14                	or     $0x14,%al
ffff80000010e445:	14 14                	adc    $0x14,%al
ffff80000010e447:	24 24                	and    $0x24,%al
ffff80000010e449:	44 7e 04             	rex.R jle ffff80000010e450 <system_call_table+0x2750>
ffff80000010e44c:	04 1e                	add    $0x1e,%al
ffff80000010e44e:	00 00                	add    %al,(%rax)
ffff80000010e450:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010e454:	40 58                	rex pop %rax
ffff80000010e456:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010e459:	02 02                	add    (%rdx),%al
ffff80000010e45b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e45e:	00 00                	add    %al,(%rax)
ffff80000010e460:	00 18                	add    %bl,(%rax)
ffff80000010e462:	24 42                	and    $0x42,%al
ffff80000010e464:	40 58                	rex pop %rax
ffff80000010e466:	64 42                	fs rex.X
ffff80000010e468:	42                   	rex.X
ffff80000010e469:	42                   	rex.X
ffff80000010e46a:	42                   	rex.X
ffff80000010e46b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e46e:	00 00                	add    %al,(%rax)
ffff80000010e470:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010e473:	42 04 04             	rex.X add $0x4,%al
ffff80000010e476:	08 08                	or     %cl,(%rax)
ffff80000010e478:	08 10                	or     %dl,(%rax)
ffff80000010e47a:	10 10                	adc    %dl,(%rax)
ffff80000010e47c:	10 38                	adc    %bh,(%rax)
ffff80000010e47e:	00 00                	add    %al,(%rax)
ffff80000010e480:	00 18                	add    %bl,(%rax)
ffff80000010e482:	24 42                	and    $0x42,%al
ffff80000010e484:	42                   	rex.X
ffff80000010e485:	42 24 18             	rex.X and $0x18,%al
ffff80000010e488:	24 42                	and    $0x42,%al
ffff80000010e48a:	42                   	rex.X
ffff80000010e48b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e48e:	00 00                	add    %al,(%rax)
ffff80000010e490:	00 18                	add    %bl,(%rax)
ffff80000010e492:	24 42                	and    $0x42,%al
ffff80000010e494:	42                   	rex.X
ffff80000010e495:	42                   	rex.X
ffff80000010e496:	42                   	rex.X
ffff80000010e497:	42                   	rex.X
ffff80000010e498:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010e49b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e49e:	00 00                	add    %al,(%rax)
ffff80000010e4a0:	00 00                	add    %al,(%rax)
ffff80000010e4a2:	00 00                	add    %al,(%rax)
ffff80000010e4a4:	00 18                	add    %bl,(%rax)
ffff80000010e4a6:	18 00                	sbb    %al,(%rax)
ffff80000010e4a8:	00 00                	add    %al,(%rax)
ffff80000010e4aa:	00 00                	add    %al,(%rax)
ffff80000010e4ac:	18 18                	sbb    %bl,(%rax)
ffff80000010e4ae:	00 00                	add    %al,(%rax)
ffff80000010e4b0:	00 00                	add    %al,(%rax)
ffff80000010e4b2:	00 00                	add    %al,(%rax)
ffff80000010e4b4:	00 18                	add    %bl,(%rax)
ffff80000010e4b6:	18 00                	sbb    %al,(%rax)
ffff80000010e4b8:	00 00                	add    %al,(%rax)
ffff80000010e4ba:	00 18                	add    %bl,(%rax)
ffff80000010e4bc:	18 08                	sbb    %cl,(%rax)
ffff80000010e4be:	08 10                	or     %dl,(%rax)
ffff80000010e4c0:	00 02                	add    %al,(%rdx)
ffff80000010e4c2:	04 08                	add    $0x8,%al
ffff80000010e4c4:	10 20                	adc    %ah,(%rax)
ffff80000010e4c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010e4cd:	04 
ffff80000010e4ce:	02 00                	add    (%rax),%al
ffff80000010e4d0:	00 00                	add    %al,(%rax)
ffff80000010e4d2:	00 00                	add    %al,(%rax)
ffff80000010e4d4:	00 00                	add    %al,(%rax)
ffff80000010e4d6:	fe 00                	incb   (%rax)
ffff80000010e4d8:	00 fe                	add    %bh,%dh
ffff80000010e4da:	00 00                	add    %al,(%rax)
ffff80000010e4dc:	00 00                	add    %al,(%rax)
ffff80000010e4de:	00 00                	add    %al,(%rax)
ffff80000010e4e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010e4e6:	04 02                	add    $0x2,%al
ffff80000010e4e8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010e4eb:	10 20                	adc    %ah,(%rax)
ffff80000010e4ed:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e4f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e4f5:	82                   	(bad)  
ffff80000010e4f6:	04 08                	add    $0x8,%al
ffff80000010e4f8:	10 10                	adc    %dl,(%rax)
ffff80000010e4fa:	00 00                	add    %al,(%rax)
ffff80000010e4fc:	18 18                	sbb    %bl,(%rax)
ffff80000010e4fe:	00 00                	add    %al,(%rax)
ffff80000010e500:	00 38                	add    %bh,(%rax)
ffff80000010e502:	44 82                	rex.R (bad) 
ffff80000010e504:	9a                   	(bad)  
ffff80000010e505:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e506:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e507:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e508:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e509:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e50a:	9c                   	pushfq 
ffff80000010e50b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010e50f:	00 00                	add    %al,(%rax)
ffff80000010e511:	18 18                	sbb    %bl,(%rax)
ffff80000010e513:	18 18                	sbb    %bl,(%rax)
ffff80000010e515:	24 24                	and    $0x24,%al
ffff80000010e517:	24 24                	and    $0x24,%al
ffff80000010e519:	7e 42                	jle    ffff80000010e55d <system_call_table+0x285d>
ffff80000010e51b:	42                   	rex.X
ffff80000010e51c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e51f:	00 00                	add    %al,(%rax)
ffff80000010e521:	f0 48                	lock rex.W
ffff80000010e523:	44                   	rex.R
ffff80000010e524:	44                   	rex.R
ffff80000010e525:	44                   	rex.R
ffff80000010e526:	48 78 44             	rex.W js ffff80000010e56d <system_call_table+0x286d>
ffff80000010e529:	42                   	rex.X
ffff80000010e52a:	42                   	rex.X
ffff80000010e52b:	42                   	rex.X
ffff80000010e52c:	44 f8                	rex.R clc 
ffff80000010e52e:	00 00                	add    %al,(%rax)
ffff80000010e530:	00 3a                	add    %bh,(%rdx)
ffff80000010e532:	46                   	rex.RX
ffff80000010e533:	42 82                	rex.X (bad) 
ffff80000010e535:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010e53c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e53f:	00 00                	add    %al,(%rax)
ffff80000010e541:	f8                   	clc    
ffff80000010e542:	44                   	rex.R
ffff80000010e543:	44                   	rex.R
ffff80000010e544:	42                   	rex.X
ffff80000010e545:	42                   	rex.X
ffff80000010e546:	42                   	rex.X
ffff80000010e547:	42                   	rex.X
ffff80000010e548:	42                   	rex.X
ffff80000010e549:	42                   	rex.X
ffff80000010e54a:	42                   	rex.X
ffff80000010e54b:	44                   	rex.R
ffff80000010e54c:	44 f8                	rex.R clc 
ffff80000010e54e:	00 00                	add    %al,(%rax)
ffff80000010e550:	00 fe                	add    %bh,%dh
ffff80000010e552:	42                   	rex.X
ffff80000010e553:	42                   	rex.X
ffff80000010e554:	40                   	rex
ffff80000010e555:	40                   	rex
ffff80000010e556:	44 7c 44             	rex.R jl ffff80000010e59d <system_call_table+0x289d>
ffff80000010e559:	40                   	rex
ffff80000010e55a:	40                   	rex
ffff80000010e55b:	42                   	rex.X
ffff80000010e55c:	42 fe 00             	rex.X incb (%rax)
ffff80000010e55f:	00 00                	add    %al,(%rax)
ffff80000010e561:	fe 42 42             	incb   0x42(%rdx)
ffff80000010e564:	40                   	rex
ffff80000010e565:	40                   	rex
ffff80000010e566:	44 7c 44             	rex.R jl ffff80000010e5ad <system_call_table+0x28ad>
ffff80000010e569:	44                   	rex.R
ffff80000010e56a:	40                   	rex
ffff80000010e56b:	40                   	rex
ffff80000010e56c:	40                   	rex
ffff80000010e56d:	f0 00 00             	lock add %al,(%rax)
ffff80000010e570:	00 3a                	add    %bh,(%rdx)
ffff80000010e572:	46                   	rex.RX
ffff80000010e573:	42 82                	rex.X (bad) 
ffff80000010e575:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010e57c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010e57f:	00 00                	add    %al,(%rax)
ffff80000010e581:	e7 42                	out    %eax,$0x42
ffff80000010e583:	42                   	rex.X
ffff80000010e584:	42                   	rex.X
ffff80000010e585:	42                   	rex.X
ffff80000010e586:	42 7e 42             	rex.X jle ffff80000010e5cb <system_call_table+0x28cb>
ffff80000010e589:	42                   	rex.X
ffff80000010e58a:	42                   	rex.X
ffff80000010e58b:	42                   	rex.X
ffff80000010e58c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e58f:	00 00                	add    %al,(%rax)
ffff80000010e591:	7c 10                	jl     ffff80000010e5a3 <system_call_table+0x28a3>
ffff80000010e593:	10 10                	adc    %dl,(%rax)
ffff80000010e595:	10 10                	adc    %dl,(%rax)
ffff80000010e597:	10 10                	adc    %dl,(%rax)
ffff80000010e599:	10 10                	adc    %dl,(%rax)
ffff80000010e59b:	10 10                	adc    %dl,(%rax)
ffff80000010e59d:	7c 00                	jl     ffff80000010e59f <system_call_table+0x289f>
ffff80000010e59f:	00 00                	add    %al,(%rax)
ffff80000010e5a1:	1f                   	(bad)  
ffff80000010e5a2:	04 04                	add    $0x4,%al
ffff80000010e5a4:	04 04                	add    $0x4,%al
ffff80000010e5a6:	04 04                	add    $0x4,%al
ffff80000010e5a8:	04 04                	add    $0x4,%al
ffff80000010e5aa:	04 04                	add    $0x4,%al
ffff80000010e5ac:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010e5af:	00 00                	add    %al,(%rax)
ffff80000010e5b1:	e7 42                	out    %eax,$0x42
ffff80000010e5b3:	44                   	rex.R
ffff80000010e5b4:	48 50                	rex.W push %rax
ffff80000010e5b6:	50                   	push   %rax
ffff80000010e5b7:	60                   	(bad)  
ffff80000010e5b8:	50                   	push   %rax
ffff80000010e5b9:	50                   	push   %rax
ffff80000010e5ba:	48                   	rex.W
ffff80000010e5bb:	44                   	rex.R
ffff80000010e5bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e5bf:	00 00                	add    %al,(%rax)
ffff80000010e5c1:	f0 40                	lock rex
ffff80000010e5c3:	40                   	rex
ffff80000010e5c4:	40                   	rex
ffff80000010e5c5:	40                   	rex
ffff80000010e5c6:	40                   	rex
ffff80000010e5c7:	40                   	rex
ffff80000010e5c8:	40                   	rex
ffff80000010e5c9:	40                   	rex
ffff80000010e5ca:	40                   	rex
ffff80000010e5cb:	42                   	rex.X
ffff80000010e5cc:	42 fe 00             	rex.X incb (%rax)
ffff80000010e5cf:	00 00                	add    %al,(%rax)
ffff80000010e5d1:	c3                   	retq   
ffff80000010e5d2:	42                   	rex.X
ffff80000010e5d3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010e5d7:	5a                   	pop    %rdx
ffff80000010e5d8:	5a                   	pop    %rdx
ffff80000010e5d9:	42                   	rex.X
ffff80000010e5da:	42                   	rex.X
ffff80000010e5db:	42                   	rex.X
ffff80000010e5dc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e5df:	00 00                	add    %al,(%rax)
ffff80000010e5e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010e5e8:	4a                   	rex.WX
ffff80000010e5e9:	4a                   	rex.WX
ffff80000010e5ea:	4a                   	rex.WX
ffff80000010e5eb:	46                   	rex.RX
ffff80000010e5ec:	46 e2 00             	rex.RX loop ffff80000010e5ef <system_call_table+0x28ef>
ffff80000010e5ef:	00 00                	add    %al,(%rax)
ffff80000010e5f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e5f5:	82                   	(bad)  
ffff80000010e5f6:	82                   	(bad)  
ffff80000010e5f7:	82                   	(bad)  
ffff80000010e5f8:	82                   	(bad)  
ffff80000010e5f9:	82                   	(bad)  
ffff80000010e5fa:	82                   	(bad)  
ffff80000010e5fb:	82                   	(bad)  
ffff80000010e5fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e5ff:	00 00                	add    %al,(%rax)
ffff80000010e601:	f8                   	clc    
ffff80000010e602:	44                   	rex.R
ffff80000010e603:	42                   	rex.X
ffff80000010e604:	42                   	rex.X
ffff80000010e605:	42                   	rex.X
ffff80000010e606:	44 78 40             	rex.R js ffff80000010e649 <system_call_table+0x2949>
ffff80000010e609:	40                   	rex
ffff80000010e60a:	40                   	rex
ffff80000010e60b:	40                   	rex
ffff80000010e60c:	40                   	rex
ffff80000010e60d:	f0 00 00             	lock add %al,(%rax)
ffff80000010e610:	00 38                	add    %bh,(%rax)
ffff80000010e612:	44 82                	rex.R (bad) 
ffff80000010e614:	82                   	(bad)  
ffff80000010e615:	82                   	(bad)  
ffff80000010e616:	82                   	(bad)  
ffff80000010e617:	82                   	(bad)  
ffff80000010e618:	82                   	(bad)  
ffff80000010e619:	82                   	(bad)  
ffff80000010e61a:	92                   	xchg   %eax,%edx
ffff80000010e61b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010e61f:	00 00                	add    %al,(%rax)
ffff80000010e621:	fc                   	cld    
ffff80000010e622:	42                   	rex.X
ffff80000010e623:	42                   	rex.X
ffff80000010e624:	42                   	rex.X
ffff80000010e625:	42 7c 44             	rex.X jl ffff80000010e66c <system_call_table+0x296c>
ffff80000010e628:	42                   	rex.X
ffff80000010e629:	42                   	rex.X
ffff80000010e62a:	42                   	rex.X
ffff80000010e62b:	42                   	rex.X
ffff80000010e62c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e62f:	00 00                	add    %al,(%rax)
ffff80000010e631:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010e634:	82                   	(bad)  
ffff80000010e635:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010e639:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010e63f:	00 00                	add    %al,(%rax)
ffff80000010e641:	fe                   	(bad)  
ffff80000010e642:	92                   	xchg   %eax,%edx
ffff80000010e643:	92                   	xchg   %eax,%edx
ffff80000010e644:	10 10                	adc    %dl,(%rax)
ffff80000010e646:	10 10                	adc    %dl,(%rax)
ffff80000010e648:	10 10                	adc    %dl,(%rax)
ffff80000010e64a:	10 10                	adc    %dl,(%rax)
ffff80000010e64c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010e650:	00 e7                	add    %ah,%bh
ffff80000010e652:	42                   	rex.X
ffff80000010e653:	42                   	rex.X
ffff80000010e654:	42                   	rex.X
ffff80000010e655:	42                   	rex.X
ffff80000010e656:	42                   	rex.X
ffff80000010e657:	42                   	rex.X
ffff80000010e658:	42                   	rex.X
ffff80000010e659:	42                   	rex.X
ffff80000010e65a:	42                   	rex.X
ffff80000010e65b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010e65e:	00 00                	add    %al,(%rax)
ffff80000010e660:	00 e7                	add    %ah,%bh
ffff80000010e662:	42                   	rex.X
ffff80000010e663:	42                   	rex.X
ffff80000010e664:	42                   	rex.X
ffff80000010e665:	42 24 24             	rex.X and $0x24,%al
ffff80000010e668:	24 24                	and    $0x24,%al
ffff80000010e66a:	18 18                	sbb    %bl,(%rax)
ffff80000010e66c:	18 18                	sbb    %bl,(%rax)
ffff80000010e66e:	00 00                	add    %al,(%rax)
ffff80000010e670:	00 e7                	add    %ah,%bh
ffff80000010e672:	42                   	rex.X
ffff80000010e673:	42                   	rex.X
ffff80000010e674:	42 5a                	rex.X pop %rdx
ffff80000010e676:	5a                   	pop    %rdx
ffff80000010e677:	5a                   	pop    %rdx
ffff80000010e678:	5a                   	pop    %rdx
ffff80000010e679:	24 24                	and    $0x24,%al
ffff80000010e67b:	24 24                	and    $0x24,%al
ffff80000010e67d:	24 00                	and    $0x0,%al
ffff80000010e67f:	00 00                	add    %al,(%rax)
ffff80000010e681:	e7 42                	out    %eax,$0x42
ffff80000010e683:	42 24 24             	rex.X and $0x24,%al
ffff80000010e686:	24 18                	and    $0x18,%al
ffff80000010e688:	24 24                	and    $0x24,%al
ffff80000010e68a:	24 42                	and    $0x42,%al
ffff80000010e68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e68f:	00 00                	add    %al,(%rax)
ffff80000010e691:	ee                   	out    %al,(%dx)
ffff80000010e692:	44                   	rex.R
ffff80000010e693:	44                   	rex.R
ffff80000010e694:	44 28 28             	sub    %r13b,(%rax)
ffff80000010e697:	28 10                	sub    %dl,(%rax)
ffff80000010e699:	10 10                	adc    %dl,(%rax)
ffff80000010e69b:	10 10                	adc    %dl,(%rax)
ffff80000010e69d:	7c 00                	jl     ffff80000010e69f <system_call_table+0x299f>
ffff80000010e69f:	00 00                	add    %al,(%rax)
ffff80000010e6a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010e6a8:	20 20                	and    %ah,(%rax)
ffff80000010e6aa:	40                   	rex
ffff80000010e6ab:	42 82                	rex.X (bad) 
ffff80000010e6ad:	fe 00                	incb   (%rax)
ffff80000010e6af:	00 00                	add    %al,(%rax)
ffff80000010e6b1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010e6b4:	20 20                	and    %ah,(%rax)
ffff80000010e6b6:	20 20                	and    %ah,(%rax)
ffff80000010e6b8:	20 20                	and    %ah,(%rax)
ffff80000010e6ba:	20 20                	and    %ah,(%rax)
ffff80000010e6bc:	20 20                	and    %ah,(%rax)
ffff80000010e6be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010e6c5:	20 20                	and    %ah,(%rax)
ffff80000010e6c7:	10 10                	adc    %dl,(%rax)
ffff80000010e6c9:	08 08                	or     %cl,(%rax)
ffff80000010e6cb:	04 04                	add    $0x4,%al
ffff80000010e6cd:	04 02                	add    $0x2,%al
ffff80000010e6cf:	02 00                	add    (%rax),%al
ffff80000010e6d1:	7c 04                	jl     ffff80000010e6d7 <system_call_table+0x29d7>
ffff80000010e6d3:	04 04                	add    $0x4,%al
ffff80000010e6d5:	04 04                	add    $0x4,%al
ffff80000010e6d7:	04 04                	add    $0x4,%al
ffff80000010e6d9:	04 04                	add    $0x4,%al
ffff80000010e6db:	04 04                	add    $0x4,%al
ffff80000010e6dd:	04 7c                	add    $0x7c,%al
ffff80000010e6df:	00 00                	add    %al,(%rax)
ffff80000010e6e1:	10 28                	adc    %ch,(%rax)
ffff80000010e6e3:	44 82                	rex.R (bad) 
	...
ffff80000010e6fd:	00 fe                	add    %bh,%dh
ffff80000010e6ff:	00 10                	add    %dl,(%rax)
ffff80000010e701:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010e714:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010e717:	04 3c                	add    $0x3c,%al
ffff80000010e719:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010e720:	c0 
ffff80000010e721:	40                   	rex
ffff80000010e722:	40                   	rex
ffff80000010e723:	40                   	rex
ffff80000010e724:	40 58                	rex pop %rax
ffff80000010e726:	64 42                	fs rex.X
ffff80000010e728:	42                   	rex.X
ffff80000010e729:	42                   	rex.X
ffff80000010e72a:	42                   	rex.X
ffff80000010e72b:	42                   	rex.X
ffff80000010e72c:	64 58                	fs pop %rax
ffff80000010e72e:	00 00                	add    %al,(%rax)
ffff80000010e730:	00 00                	add    %al,(%rax)
ffff80000010e732:	00 00                	add    %al,(%rax)
ffff80000010e734:	00 30                	add    %dh,(%rax)
ffff80000010e736:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010e73d:	38 
ffff80000010e73e:	00 00                	add    %al,(%rax)
ffff80000010e740:	0c 04                	or     $0x4,%al
ffff80000010e742:	04 04                	add    $0x4,%al
ffff80000010e744:	04 34                	add    $0x34,%al
ffff80000010e746:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010e74d:	36 
ffff80000010e74e:	00 00                	add    %al,(%rax)
ffff80000010e750:	00 00                	add    %al,(%rax)
ffff80000010e752:	00 00                	add    %al,(%rax)
ffff80000010e754:	00 38                	add    %bh,(%rax)
ffff80000010e756:	44 82                	rex.R (bad) 
ffff80000010e758:	82                   	(bad)  
ffff80000010e759:	fc                   	cld    
ffff80000010e75a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010e761:	10 10                	adc    %dl,(%rax)
ffff80000010e763:	10 10                	adc    %dl,(%rax)
ffff80000010e765:	7c 10                	jl     ffff80000010e777 <system_call_table+0x2a77>
ffff80000010e767:	10 10                	adc    %dl,(%rax)
ffff80000010e769:	10 10                	adc    %dl,(%rax)
ffff80000010e76b:	10 10                	adc    %dl,(%rax)
ffff80000010e76d:	7c 00                	jl     ffff80000010e76f <system_call_table+0x2a6f>
ffff80000010e76f:	00 00                	add    %al,(%rax)
ffff80000010e771:	00 00                	add    %al,(%rax)
ffff80000010e773:	00 00                	add    %al,(%rax)
ffff80000010e775:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010e77c:	34 04 
ffff80000010e77e:	04 38                	add    $0x38,%al
ffff80000010e780:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010e784:	40 58                	rex pop %rax
ffff80000010e786:	64 42                	fs rex.X
ffff80000010e788:	42                   	rex.X
ffff80000010e789:	42                   	rex.X
ffff80000010e78a:	42                   	rex.X
ffff80000010e78b:	42                   	rex.X
ffff80000010e78c:	42 e3 00             	rex.X jrcxz ffff80000010e78f <system_call_table+0x2a8f>
ffff80000010e78f:	00 00                	add    %al,(%rax)
ffff80000010e791:	10 10                	adc    %dl,(%rax)
ffff80000010e793:	00 00                	add    %al,(%rax)
ffff80000010e795:	30 10                	xor    %dl,(%rax)
ffff80000010e797:	10 10                	adc    %dl,(%rax)
ffff80000010e799:	10 10                	adc    %dl,(%rax)
ffff80000010e79b:	10 10                	adc    %dl,(%rax)
ffff80000010e79d:	38 00                	cmp    %al,(%rax)
ffff80000010e79f:	00 00                	add    %al,(%rax)
ffff80000010e7a1:	04 04                	add    $0x4,%al
ffff80000010e7a3:	00 00                	add    %al,(%rax)
ffff80000010e7a5:	0c 04                	or     $0x4,%al
ffff80000010e7a7:	04 04                	add    $0x4,%al
ffff80000010e7a9:	04 04                	add    $0x4,%al
ffff80000010e7ab:	04 04                	add    $0x4,%al
ffff80000010e7ad:	08 08                	or     %cl,(%rax)
ffff80000010e7af:	30 c0                	xor    %al,%al
ffff80000010e7b1:	40                   	rex
ffff80000010e7b2:	40                   	rex
ffff80000010e7b3:	40                   	rex
ffff80000010e7b4:	40                   	rex
ffff80000010e7b5:	4e                   	rex.WRX
ffff80000010e7b6:	44                   	rex.R
ffff80000010e7b7:	48 50                	rex.W push %rax
ffff80000010e7b9:	60                   	(bad)  
ffff80000010e7ba:	50                   	push   %rax
ffff80000010e7bb:	48                   	rex.W
ffff80000010e7bc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010e7bf:	00 30                	add    %dh,(%rax)
ffff80000010e7c1:	10 10                	adc    %dl,(%rax)
ffff80000010e7c3:	10 10                	adc    %dl,(%rax)
ffff80000010e7c5:	10 10                	adc    %dl,(%rax)
ffff80000010e7c7:	10 10                	adc    %dl,(%rax)
ffff80000010e7c9:	10 10                	adc    %dl,(%rax)
ffff80000010e7cb:	10 10                	adc    %dl,(%rax)
ffff80000010e7cd:	38 00                	cmp    %al,(%rax)
ffff80000010e7cf:	00 00                	add    %al,(%rax)
ffff80000010e7d1:	00 00                	add    %al,(%rax)
ffff80000010e7d3:	00 00                	add    %al,(%rax)
ffff80000010e7d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010e7d9:	49                   	rex.WB
ffff80000010e7da:	49                   	rex.WB
ffff80000010e7db:	49                   	rex.WB
ffff80000010e7dc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010e7df:	00 00                	add    %al,(%rax)
ffff80000010e7e1:	00 00                	add    %al,(%rax)
ffff80000010e7e3:	00 00                	add    %al,(%rax)
ffff80000010e7e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010e7e9:	42                   	rex.X
ffff80000010e7ea:	42                   	rex.X
ffff80000010e7eb:	42                   	rex.X
ffff80000010e7ec:	42 e3 00             	rex.X jrcxz ffff80000010e7ef <system_call_table+0x2aef>
ffff80000010e7ef:	00 00                	add    %al,(%rax)
ffff80000010e7f1:	00 00                	add    %al,(%rax)
ffff80000010e7f3:	00 00                	add    %al,(%rax)
ffff80000010e7f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e7f9:	82                   	(bad)  
ffff80000010e7fa:	82                   	(bad)  
ffff80000010e7fb:	82                   	(bad)  
ffff80000010e7fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e7ff:	00 00                	add    %al,(%rax)
ffff80000010e801:	00 00                	add    %al,(%rax)
ffff80000010e803:	00 d8                	add    %bl,%al
ffff80000010e805:	64 42                	fs rex.X
ffff80000010e807:	42                   	rex.X
ffff80000010e808:	42                   	rex.X
ffff80000010e809:	42                   	rex.X
ffff80000010e80a:	42                   	rex.X
ffff80000010e80b:	64 58                	fs pop %rax
ffff80000010e80d:	40                   	rex
ffff80000010e80e:	40 e0 00             	rex loopne ffff80000010e811 <system_call_table+0x2b11>
ffff80000010e811:	00 00                	add    %al,(%rax)
ffff80000010e813:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010e816:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010e81d:	04 04                	add    $0x4,%al
ffff80000010e81f:	0e                   	(bad)  
ffff80000010e820:	00 00                	add    %al,(%rax)
ffff80000010e822:	00 00                	add    %al,(%rax)
ffff80000010e824:	00 dc                	add    %bl,%ah
ffff80000010e826:	62 42                	(bad)  
ffff80000010e828:	40                   	rex
ffff80000010e829:	40                   	rex
ffff80000010e82a:	40                   	rex
ffff80000010e82b:	40                   	rex
ffff80000010e82c:	40 e0 00             	rex loopne ffff80000010e82f <system_call_table+0x2b2f>
ffff80000010e82f:	00 00                	add    %al,(%rax)
ffff80000010e831:	00 00                	add    %al,(%rax)
ffff80000010e833:	00 00                	add    %al,(%rax)
ffff80000010e835:	7a 86                	jp     ffff80000010e7bd <system_call_table+0x2abd>
ffff80000010e837:	82                   	(bad)  
ffff80000010e838:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010e83b:	82                   	(bad)  
ffff80000010e83c:	c2 bc 00             	retq   $0xbc
ffff80000010e83f:	00 00                	add    %al,(%rax)
ffff80000010e841:	00 10                	add    %dl,(%rax)
ffff80000010e843:	10 10                	adc    %dl,(%rax)
ffff80000010e845:	7c 10                	jl     ffff80000010e857 <system_call_table+0x2b57>
ffff80000010e847:	10 10                	adc    %dl,(%rax)
ffff80000010e849:	10 10                	adc    %dl,(%rax)
ffff80000010e84b:	10 10                	adc    %dl,(%rax)
ffff80000010e84d:	0e                   	(bad)  
ffff80000010e84e:	00 00                	add    %al,(%rax)
ffff80000010e850:	00 00                	add    %al,(%rax)
ffff80000010e852:	00 00                	add    %al,(%rax)
ffff80000010e854:	00 c6                	add    %al,%dh
ffff80000010e856:	42                   	rex.X
ffff80000010e857:	42                   	rex.X
ffff80000010e858:	42                   	rex.X
ffff80000010e859:	42                   	rex.X
ffff80000010e85a:	42                   	rex.X
ffff80000010e85b:	42                   	rex.X
ffff80000010e85c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010e85f:	00 00                	add    %al,(%rax)
ffff80000010e861:	00 00                	add    %al,(%rax)
ffff80000010e863:	00 00                	add    %al,(%rax)
ffff80000010e865:	e7 42                	out    %eax,$0x42
ffff80000010e867:	42                   	rex.X
ffff80000010e868:	42 24 24             	rex.X and $0x24,%al
ffff80000010e86b:	24 18                	and    $0x18,%al
ffff80000010e86d:	18 00                	sbb    %al,(%rax)
ffff80000010e86f:	00 00                	add    %al,(%rax)
ffff80000010e871:	00 00                	add    %al,(%rax)
ffff80000010e873:	00 00                	add    %al,(%rax)
ffff80000010e875:	e7 42                	out    %eax,$0x42
ffff80000010e877:	42 5a                	rex.X pop %rdx
ffff80000010e879:	5a                   	pop    %rdx
ffff80000010e87a:	5a                   	pop    %rdx
ffff80000010e87b:	24 24                	and    $0x24,%al
ffff80000010e87d:	24 00                	and    $0x0,%al
ffff80000010e87f:	00 00                	add    %al,(%rax)
ffff80000010e881:	00 00                	add    %al,(%rax)
ffff80000010e883:	00 00                	add    %al,(%rax)
ffff80000010e885:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010e88a:	28 28                	sub    %ch,(%rax)
ffff80000010e88c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010e890:	00 00                	add    %al,(%rax)
ffff80000010e892:	00 00                	add    %al,(%rax)
ffff80000010e894:	00 e7                	add    %ah,%bh
ffff80000010e896:	42                   	rex.X
ffff80000010e897:	42 24 24             	rex.X and $0x24,%al
ffff80000010e89a:	24 18                	and    $0x18,%al
ffff80000010e89c:	18 10                	sbb    %dl,(%rax)
ffff80000010e89e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e8a1:	00 00                	add    %al,(%rax)
ffff80000010e8a3:	00 00                	add    %al,(%rax)
ffff80000010e8a5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010e8ab:	42 82                	rex.X (bad) 
ffff80000010e8ad:	fe 00                	incb   (%rax)
ffff80000010e8af:	00 00                	add    %al,(%rax)
ffff80000010e8b1:	06                   	(bad)  
ffff80000010e8b2:	08 10                	or     %dl,(%rax)
ffff80000010e8b4:	10 10                	adc    %dl,(%rax)
ffff80000010e8b6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010e8b9:	10 10                	adc    %dl,(%rax)
ffff80000010e8bb:	10 08                	adc    %cl,(%rax)
ffff80000010e8bd:	06                   	(bad)  
ffff80000010e8be:	00 00                	add    %al,(%rax)
ffff80000010e8c0:	10 10                	adc    %dl,(%rax)
ffff80000010e8c2:	10 10                	adc    %dl,(%rax)
ffff80000010e8c4:	10 10                	adc    %dl,(%rax)
ffff80000010e8c6:	10 10                	adc    %dl,(%rax)
ffff80000010e8c8:	10 10                	adc    %dl,(%rax)
ffff80000010e8ca:	10 10                	adc    %dl,(%rax)
ffff80000010e8cc:	10 10                	adc    %dl,(%rax)
ffff80000010e8ce:	10 10                	adc    %dl,(%rax)
ffff80000010e8d0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010e8d3:	08 08                	or     %cl,(%rax)
ffff80000010e8d5:	08 08                	or     %cl,(%rax)
ffff80000010e8d7:	06                   	(bad)  
ffff80000010e8d8:	08 08                	or     %cl,(%rax)
ffff80000010e8da:	08 08                	or     %cl,(%rax)
ffff80000010e8dc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e8df:	00 00                	add    %al,(%rax)
ffff80000010e8e1:	72 8c                	jb     ffff80000010e86f <system_call_table+0x2b6f>
	...
ffff80000010f30f:	00 00                	add    %al,(%rax)
ffff80000010f311:	10 10                	adc    %dl,(%rax)
ffff80000010f313:	10 10                	adc    %dl,(%rax)
ffff80000010f315:	10 10                	adc    %dl,(%rax)
ffff80000010f317:	10 10                	adc    %dl,(%rax)
ffff80000010f319:	10 00                	adc    %al,(%rax)
ffff80000010f31b:	00 10                	add    %dl,(%rax)
ffff80000010f31d:	10 00                	adc    %al,(%rax)
ffff80000010f31f:	00 28                	add    %ch,(%rax)
ffff80000010f321:	28 28                	sub    %ch,(%rax)
	...
ffff80000010f32f:	00 00                	add    %al,(%rax)
ffff80000010f331:	44                   	rex.R
ffff80000010f332:	44                   	rex.R
ffff80000010f333:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f338:	44                   	rex.R
ffff80000010f339:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f33e:	00 00                	add    %al,(%rax)
ffff80000010f340:	10 3a                	adc    %bh,(%rdx)
ffff80000010f342:	56                   	push   %rsi
ffff80000010f343:	92                   	xchg   %eax,%edx
ffff80000010f344:	92                   	xchg   %eax,%edx
ffff80000010f345:	90                   	nop
ffff80000010f346:	50                   	push   %rax
ffff80000010f347:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010f34a:	92                   	xchg   %eax,%edx
ffff80000010f34b:	92                   	xchg   %eax,%edx
ffff80000010f34c:	d4                   	(bad)  
ffff80000010f34d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010f352:	94                   	xchg   %eax,%esp
ffff80000010f353:	94                   	xchg   %eax,%esp
ffff80000010f354:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010f359:	2c 52                	sub    $0x52,%al
ffff80000010f35b:	52                   	push   %rdx
ffff80000010f35c:	92                   	xchg   %eax,%edx
ffff80000010f35d:	8c 00                	mov    %es,(%rax)
ffff80000010f35f:	00 00                	add    %al,(%rax)
ffff80000010f361:	70 88                	jo     ffff80000010f2eb <system_call_table+0x35eb>
ffff80000010f363:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010f369:	92                   	xchg   %eax,%edx
ffff80000010f36a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010f371:	08 10                	or     %dl,(%rax)
	...
ffff80000010f37f:	00 02                	add    %al,(%rdx)
ffff80000010f381:	04 08                	add    $0x8,%al
ffff80000010f383:	08 10                	or     %dl,(%rax)
ffff80000010f385:	10 10                	adc    %dl,(%rax)
ffff80000010f387:	10 10                	adc    %dl,(%rax)
ffff80000010f389:	10 10                	adc    %dl,(%rax)
ffff80000010f38b:	08 08                	or     %cl,(%rax)
ffff80000010f38d:	04 02                	add    $0x2,%al
ffff80000010f38f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010f395:	10 10                	adc    %dl,(%rax)
ffff80000010f397:	10 10                	adc    %dl,(%rax)
ffff80000010f399:	10 10                	adc    %dl,(%rax)
ffff80000010f39b:	20 20                	and    %ah,(%rax)
ffff80000010f39d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f3a1:	00 00                	add    %al,(%rax)
ffff80000010f3a3:	00 00                	add    %al,(%rax)
ffff80000010f3a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010f3ab:	10 00                	adc    %al,(%rax)
	...
ffff80000010f3b5:	10 10                	adc    %dl,(%rax)
ffff80000010f3b7:	10 fe                	adc    %bh,%dh
ffff80000010f3b9:	10 10                	adc    %dl,(%rax)
ffff80000010f3bb:	10 00                	adc    %al,(%rax)
	...
ffff80000010f3c9:	00 00                	add    %al,(%rax)
ffff80000010f3cb:	18 18                	sbb    %bl,(%rax)
ffff80000010f3cd:	08 08                	or     %cl,(%rax)
ffff80000010f3cf:	10 00                	adc    %al,(%rax)
ffff80000010f3d1:	00 00                	add    %al,(%rax)
ffff80000010f3d3:	00 00                	add    %al,(%rax)
ffff80000010f3d5:	00 00                	add    %al,(%rax)
ffff80000010f3d7:	00 fe                	add    %bh,%dh
	...
ffff80000010f3e9:	00 00                	add    %al,(%rax)
ffff80000010f3eb:	00 18                	add    %bl,(%rax)
ffff80000010f3ed:	18 00                	sbb    %al,(%rax)
ffff80000010f3ef:	00 02                	add    %al,(%rdx)
ffff80000010f3f1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010f3f4:	08 08                	or     %cl,(%rax)
ffff80000010f3f6:	08 10                	or     %dl,(%rax)
ffff80000010f3f8:	10 20                	adc    %ah,(%rax)
ffff80000010f3fa:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f3fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010f404:	42 
ffff80000010f405:	42                   	rex.X
ffff80000010f406:	42                   	rex.X
ffff80000010f407:	42                   	rex.X
ffff80000010f408:	42                   	rex.X
ffff80000010f409:	42                   	rex.X
ffff80000010f40a:	42 24 24             	rex.X and $0x24,%al
ffff80000010f40d:	18 00                	sbb    %al,(%rax)
ffff80000010f40f:	00 00                	add    %al,(%rax)
ffff80000010f411:	08 18                	or     %bl,(%rax)
ffff80000010f413:	28 08                	sub    %cl,(%rax)
ffff80000010f415:	08 08                	or     %cl,(%rax)
ffff80000010f417:	08 08                	or     %cl,(%rax)
ffff80000010f419:	08 08                	or     %cl,(%rax)
ffff80000010f41b:	08 08                	or     %cl,(%rax)
ffff80000010f41d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010f420:	00 18                	add    %bl,(%rax)
ffff80000010f422:	24 42                	and    $0x42,%al
ffff80000010f424:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010f428:	10 20                	adc    %ah,(%rax)
ffff80000010f42a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f42d:	7e 00                	jle    ffff80000010f42f <system_call_table+0x372f>
ffff80000010f42f:	00 00                	add    %al,(%rax)
ffff80000010f431:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010f434:	02 02                	add    (%rdx),%al
ffff80000010f436:	04 18                	add    $0x18,%al
ffff80000010f438:	04 02                	add    $0x2,%al
ffff80000010f43a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010f43d:	18 00                	sbb    %al,(%rax)
ffff80000010f43f:	00 00                	add    %al,(%rax)
ffff80000010f441:	0c 0c                	or     $0xc,%al
ffff80000010f443:	0c 14                	or     $0x14,%al
ffff80000010f445:	14 14                	adc    $0x14,%al
ffff80000010f447:	24 24                	and    $0x24,%al
ffff80000010f449:	44 7e 04             	rex.R jle ffff80000010f450 <system_call_table+0x3750>
ffff80000010f44c:	04 1e                	add    $0x1e,%al
ffff80000010f44e:	00 00                	add    %al,(%rax)
ffff80000010f450:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010f454:	40 58                	rex pop %rax
ffff80000010f456:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010f459:	02 02                	add    (%rdx),%al
ffff80000010f45b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f45e:	00 00                	add    %al,(%rax)
ffff80000010f460:	00 18                	add    %bl,(%rax)
ffff80000010f462:	24 42                	and    $0x42,%al
ffff80000010f464:	40 58                	rex pop %rax
ffff80000010f466:	64 42                	fs rex.X
ffff80000010f468:	42                   	rex.X
ffff80000010f469:	42                   	rex.X
ffff80000010f46a:	42                   	rex.X
ffff80000010f46b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f46e:	00 00                	add    %al,(%rax)
ffff80000010f470:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010f473:	42 04 04             	rex.X add $0x4,%al
ffff80000010f476:	08 08                	or     %cl,(%rax)
ffff80000010f478:	08 10                	or     %dl,(%rax)
ffff80000010f47a:	10 10                	adc    %dl,(%rax)
ffff80000010f47c:	10 38                	adc    %bh,(%rax)
ffff80000010f47e:	00 00                	add    %al,(%rax)
ffff80000010f480:	00 18                	add    %bl,(%rax)
ffff80000010f482:	24 42                	and    $0x42,%al
ffff80000010f484:	42                   	rex.X
ffff80000010f485:	42 24 18             	rex.X and $0x18,%al
ffff80000010f488:	24 42                	and    $0x42,%al
ffff80000010f48a:	42                   	rex.X
ffff80000010f48b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f48e:	00 00                	add    %al,(%rax)
ffff80000010f490:	00 18                	add    %bl,(%rax)
ffff80000010f492:	24 42                	and    $0x42,%al
ffff80000010f494:	42                   	rex.X
ffff80000010f495:	42                   	rex.X
ffff80000010f496:	42                   	rex.X
ffff80000010f497:	42                   	rex.X
ffff80000010f498:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010f49b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f49e:	00 00                	add    %al,(%rax)
ffff80000010f4a0:	00 00                	add    %al,(%rax)
ffff80000010f4a2:	00 00                	add    %al,(%rax)
ffff80000010f4a4:	00 18                	add    %bl,(%rax)
ffff80000010f4a6:	18 00                	sbb    %al,(%rax)
ffff80000010f4a8:	00 00                	add    %al,(%rax)
ffff80000010f4aa:	00 00                	add    %al,(%rax)
ffff80000010f4ac:	18 18                	sbb    %bl,(%rax)
ffff80000010f4ae:	00 00                	add    %al,(%rax)
ffff80000010f4b0:	00 00                	add    %al,(%rax)
ffff80000010f4b2:	00 00                	add    %al,(%rax)
ffff80000010f4b4:	00 18                	add    %bl,(%rax)
ffff80000010f4b6:	18 00                	sbb    %al,(%rax)
ffff80000010f4b8:	00 00                	add    %al,(%rax)
ffff80000010f4ba:	00 18                	add    %bl,(%rax)
ffff80000010f4bc:	18 08                	sbb    %cl,(%rax)
ffff80000010f4be:	08 10                	or     %dl,(%rax)
ffff80000010f4c0:	00 02                	add    %al,(%rdx)
ffff80000010f4c2:	04 08                	add    $0x8,%al
ffff80000010f4c4:	10 20                	adc    %ah,(%rax)
ffff80000010f4c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010f4cd:	04 
ffff80000010f4ce:	02 00                	add    (%rax),%al
ffff80000010f4d0:	00 00                	add    %al,(%rax)
ffff80000010f4d2:	00 00                	add    %al,(%rax)
ffff80000010f4d4:	00 00                	add    %al,(%rax)
ffff80000010f4d6:	fe 00                	incb   (%rax)
ffff80000010f4d8:	00 fe                	add    %bh,%dh
ffff80000010f4da:	00 00                	add    %al,(%rax)
ffff80000010f4dc:	00 00                	add    %al,(%rax)
ffff80000010f4de:	00 00                	add    %al,(%rax)
ffff80000010f4e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010f4e6:	04 02                	add    $0x2,%al
ffff80000010f4e8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010f4eb:	10 20                	adc    %ah,(%rax)
ffff80000010f4ed:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f4f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f4f5:	82                   	(bad)  
ffff80000010f4f6:	04 08                	add    $0x8,%al
ffff80000010f4f8:	10 10                	adc    %dl,(%rax)
ffff80000010f4fa:	00 00                	add    %al,(%rax)
ffff80000010f4fc:	18 18                	sbb    %bl,(%rax)
ffff80000010f4fe:	00 00                	add    %al,(%rax)
ffff80000010f500:	00 38                	add    %bh,(%rax)
ffff80000010f502:	44 82                	rex.R (bad) 
ffff80000010f504:	9a                   	(bad)  
ffff80000010f505:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f506:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f507:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f508:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f509:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f50a:	9c                   	pushfq 
ffff80000010f50b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010f50f:	00 00                	add    %al,(%rax)
ffff80000010f511:	18 18                	sbb    %bl,(%rax)
ffff80000010f513:	18 18                	sbb    %bl,(%rax)
ffff80000010f515:	24 24                	and    $0x24,%al
ffff80000010f517:	24 24                	and    $0x24,%al
ffff80000010f519:	7e 42                	jle    ffff80000010f55d <system_call_table+0x385d>
ffff80000010f51b:	42                   	rex.X
ffff80000010f51c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f51f:	00 00                	add    %al,(%rax)
ffff80000010f521:	f0 48                	lock rex.W
ffff80000010f523:	44                   	rex.R
ffff80000010f524:	44                   	rex.R
ffff80000010f525:	44                   	rex.R
ffff80000010f526:	48 78 44             	rex.W js ffff80000010f56d <system_call_table+0x386d>
ffff80000010f529:	42                   	rex.X
ffff80000010f52a:	42                   	rex.X
ffff80000010f52b:	42                   	rex.X
ffff80000010f52c:	44 f8                	rex.R clc 
ffff80000010f52e:	00 00                	add    %al,(%rax)
ffff80000010f530:	00 3a                	add    %bh,(%rdx)
ffff80000010f532:	46                   	rex.RX
ffff80000010f533:	42 82                	rex.X (bad) 
ffff80000010f535:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010f53c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f53f:	00 00                	add    %al,(%rax)
ffff80000010f541:	f8                   	clc    
ffff80000010f542:	44                   	rex.R
ffff80000010f543:	44                   	rex.R
ffff80000010f544:	42                   	rex.X
ffff80000010f545:	42                   	rex.X
ffff80000010f546:	42                   	rex.X
ffff80000010f547:	42                   	rex.X
ffff80000010f548:	42                   	rex.X
ffff80000010f549:	42                   	rex.X
ffff80000010f54a:	42                   	rex.X
ffff80000010f54b:	44                   	rex.R
ffff80000010f54c:	44 f8                	rex.R clc 
ffff80000010f54e:	00 00                	add    %al,(%rax)
ffff80000010f550:	00 fe                	add    %bh,%dh
ffff80000010f552:	42                   	rex.X
ffff80000010f553:	42                   	rex.X
ffff80000010f554:	40                   	rex
ffff80000010f555:	40                   	rex
ffff80000010f556:	44 7c 44             	rex.R jl ffff80000010f59d <system_call_table+0x389d>
ffff80000010f559:	40                   	rex
ffff80000010f55a:	40                   	rex
ffff80000010f55b:	42                   	rex.X
ffff80000010f55c:	42 fe 00             	rex.X incb (%rax)
ffff80000010f55f:	00 00                	add    %al,(%rax)
ffff80000010f561:	fe 42 42             	incb   0x42(%rdx)
ffff80000010f564:	40                   	rex
ffff80000010f565:	40                   	rex
ffff80000010f566:	44 7c 44             	rex.R jl ffff80000010f5ad <system_call_table+0x38ad>
ffff80000010f569:	44                   	rex.R
ffff80000010f56a:	40                   	rex
ffff80000010f56b:	40                   	rex
ffff80000010f56c:	40                   	rex
ffff80000010f56d:	f0 00 00             	lock add %al,(%rax)
ffff80000010f570:	00 3a                	add    %bh,(%rdx)
ffff80000010f572:	46                   	rex.RX
ffff80000010f573:	42 82                	rex.X (bad) 
ffff80000010f575:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010f57c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010f57f:	00 00                	add    %al,(%rax)
ffff80000010f581:	e7 42                	out    %eax,$0x42
ffff80000010f583:	42                   	rex.X
ffff80000010f584:	42                   	rex.X
ffff80000010f585:	42                   	rex.X
ffff80000010f586:	42 7e 42             	rex.X jle ffff80000010f5cb <system_call_table+0x38cb>
ffff80000010f589:	42                   	rex.X
ffff80000010f58a:	42                   	rex.X
ffff80000010f58b:	42                   	rex.X
ffff80000010f58c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f58f:	00 00                	add    %al,(%rax)
ffff80000010f591:	7c 10                	jl     ffff80000010f5a3 <system_call_table+0x38a3>
ffff80000010f593:	10 10                	adc    %dl,(%rax)
ffff80000010f595:	10 10                	adc    %dl,(%rax)
ffff80000010f597:	10 10                	adc    %dl,(%rax)
ffff80000010f599:	10 10                	adc    %dl,(%rax)
ffff80000010f59b:	10 10                	adc    %dl,(%rax)
ffff80000010f59d:	7c 00                	jl     ffff80000010f59f <system_call_table+0x389f>
ffff80000010f59f:	00 00                	add    %al,(%rax)
ffff80000010f5a1:	1f                   	(bad)  
ffff80000010f5a2:	04 04                	add    $0x4,%al
ffff80000010f5a4:	04 04                	add    $0x4,%al
ffff80000010f5a6:	04 04                	add    $0x4,%al
ffff80000010f5a8:	04 04                	add    $0x4,%al
ffff80000010f5aa:	04 04                	add    $0x4,%al
ffff80000010f5ac:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010f5af:	00 00                	add    %al,(%rax)
ffff80000010f5b1:	e7 42                	out    %eax,$0x42
ffff80000010f5b3:	44                   	rex.R
ffff80000010f5b4:	48 50                	rex.W push %rax
ffff80000010f5b6:	50                   	push   %rax
ffff80000010f5b7:	60                   	(bad)  
ffff80000010f5b8:	50                   	push   %rax
ffff80000010f5b9:	50                   	push   %rax
ffff80000010f5ba:	48                   	rex.W
ffff80000010f5bb:	44                   	rex.R
ffff80000010f5bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f5bf:	00 00                	add    %al,(%rax)
ffff80000010f5c1:	f0 40                	lock rex
ffff80000010f5c3:	40                   	rex
ffff80000010f5c4:	40                   	rex
ffff80000010f5c5:	40                   	rex
ffff80000010f5c6:	40                   	rex
ffff80000010f5c7:	40                   	rex
ffff80000010f5c8:	40                   	rex
ffff80000010f5c9:	40                   	rex
ffff80000010f5ca:	40                   	rex
ffff80000010f5cb:	42                   	rex.X
ffff80000010f5cc:	42 fe 00             	rex.X incb (%rax)
ffff80000010f5cf:	00 00                	add    %al,(%rax)
ffff80000010f5d1:	c3                   	retq   
ffff80000010f5d2:	42                   	rex.X
ffff80000010f5d3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010f5d7:	5a                   	pop    %rdx
ffff80000010f5d8:	5a                   	pop    %rdx
ffff80000010f5d9:	42                   	rex.X
ffff80000010f5da:	42                   	rex.X
ffff80000010f5db:	42                   	rex.X
ffff80000010f5dc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f5df:	00 00                	add    %al,(%rax)
ffff80000010f5e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010f5e8:	4a                   	rex.WX
ffff80000010f5e9:	4a                   	rex.WX
ffff80000010f5ea:	4a                   	rex.WX
ffff80000010f5eb:	46                   	rex.RX
ffff80000010f5ec:	46 e2 00             	rex.RX loop ffff80000010f5ef <system_call_table+0x38ef>
ffff80000010f5ef:	00 00                	add    %al,(%rax)
ffff80000010f5f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f5f5:	82                   	(bad)  
ffff80000010f5f6:	82                   	(bad)  
ffff80000010f5f7:	82                   	(bad)  
ffff80000010f5f8:	82                   	(bad)  
ffff80000010f5f9:	82                   	(bad)  
ffff80000010f5fa:	82                   	(bad)  
ffff80000010f5fb:	82                   	(bad)  
ffff80000010f5fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f5ff:	00 00                	add    %al,(%rax)
ffff80000010f601:	f8                   	clc    
ffff80000010f602:	44                   	rex.R
ffff80000010f603:	42                   	rex.X
ffff80000010f604:	42                   	rex.X
ffff80000010f605:	42                   	rex.X
ffff80000010f606:	44 78 40             	rex.R js ffff80000010f649 <system_call_table+0x3949>
ffff80000010f609:	40                   	rex
ffff80000010f60a:	40                   	rex
ffff80000010f60b:	40                   	rex
ffff80000010f60c:	40                   	rex
ffff80000010f60d:	f0 00 00             	lock add %al,(%rax)
ffff80000010f610:	00 38                	add    %bh,(%rax)
ffff80000010f612:	44 82                	rex.R (bad) 
ffff80000010f614:	82                   	(bad)  
ffff80000010f615:	82                   	(bad)  
ffff80000010f616:	82                   	(bad)  
ffff80000010f617:	82                   	(bad)  
ffff80000010f618:	82                   	(bad)  
ffff80000010f619:	82                   	(bad)  
ffff80000010f61a:	92                   	xchg   %eax,%edx
ffff80000010f61b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010f61f:	00 00                	add    %al,(%rax)
ffff80000010f621:	fc                   	cld    
ffff80000010f622:	42                   	rex.X
ffff80000010f623:	42                   	rex.X
ffff80000010f624:	42                   	rex.X
ffff80000010f625:	42 7c 44             	rex.X jl ffff80000010f66c <system_call_table+0x396c>
ffff80000010f628:	42                   	rex.X
ffff80000010f629:	42                   	rex.X
ffff80000010f62a:	42                   	rex.X
ffff80000010f62b:	42                   	rex.X
ffff80000010f62c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f62f:	00 00                	add    %al,(%rax)
ffff80000010f631:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010f634:	82                   	(bad)  
ffff80000010f635:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010f639:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010f63f:	00 00                	add    %al,(%rax)
ffff80000010f641:	fe                   	(bad)  
ffff80000010f642:	92                   	xchg   %eax,%edx
ffff80000010f643:	92                   	xchg   %eax,%edx
ffff80000010f644:	10 10                	adc    %dl,(%rax)
ffff80000010f646:	10 10                	adc    %dl,(%rax)
ffff80000010f648:	10 10                	adc    %dl,(%rax)
ffff80000010f64a:	10 10                	adc    %dl,(%rax)
ffff80000010f64c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010f650:	00 e7                	add    %ah,%bh
ffff80000010f652:	42                   	rex.X
ffff80000010f653:	42                   	rex.X
ffff80000010f654:	42                   	rex.X
ffff80000010f655:	42                   	rex.X
ffff80000010f656:	42                   	rex.X
ffff80000010f657:	42                   	rex.X
ffff80000010f658:	42                   	rex.X
ffff80000010f659:	42                   	rex.X
ffff80000010f65a:	42                   	rex.X
ffff80000010f65b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010f65e:	00 00                	add    %al,(%rax)
ffff80000010f660:	00 e7                	add    %ah,%bh
ffff80000010f662:	42                   	rex.X
ffff80000010f663:	42                   	rex.X
ffff80000010f664:	42                   	rex.X
ffff80000010f665:	42 24 24             	rex.X and $0x24,%al
ffff80000010f668:	24 24                	and    $0x24,%al
ffff80000010f66a:	18 18                	sbb    %bl,(%rax)
ffff80000010f66c:	18 18                	sbb    %bl,(%rax)
ffff80000010f66e:	00 00                	add    %al,(%rax)
ffff80000010f670:	00 e7                	add    %ah,%bh
ffff80000010f672:	42                   	rex.X
ffff80000010f673:	42                   	rex.X
ffff80000010f674:	42 5a                	rex.X pop %rdx
ffff80000010f676:	5a                   	pop    %rdx
ffff80000010f677:	5a                   	pop    %rdx
ffff80000010f678:	5a                   	pop    %rdx
ffff80000010f679:	24 24                	and    $0x24,%al
ffff80000010f67b:	24 24                	and    $0x24,%al
ffff80000010f67d:	24 00                	and    $0x0,%al
ffff80000010f67f:	00 00                	add    %al,(%rax)
ffff80000010f681:	e7 42                	out    %eax,$0x42
ffff80000010f683:	42 24 24             	rex.X and $0x24,%al
ffff80000010f686:	24 18                	and    $0x18,%al
ffff80000010f688:	24 24                	and    $0x24,%al
ffff80000010f68a:	24 42                	and    $0x42,%al
ffff80000010f68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f68f:	00 00                	add    %al,(%rax)
ffff80000010f691:	ee                   	out    %al,(%dx)
ffff80000010f692:	44                   	rex.R
ffff80000010f693:	44                   	rex.R
ffff80000010f694:	44 28 28             	sub    %r13b,(%rax)
ffff80000010f697:	28 10                	sub    %dl,(%rax)
ffff80000010f699:	10 10                	adc    %dl,(%rax)
ffff80000010f69b:	10 10                	adc    %dl,(%rax)
ffff80000010f69d:	7c 00                	jl     ffff80000010f69f <system_call_table+0x399f>
ffff80000010f69f:	00 00                	add    %al,(%rax)
ffff80000010f6a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010f6a8:	20 20                	and    %ah,(%rax)
ffff80000010f6aa:	40                   	rex
ffff80000010f6ab:	42 82                	rex.X (bad) 
ffff80000010f6ad:	fe 00                	incb   (%rax)
ffff80000010f6af:	00 00                	add    %al,(%rax)
ffff80000010f6b1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010f6b4:	20 20                	and    %ah,(%rax)
ffff80000010f6b6:	20 20                	and    %ah,(%rax)
ffff80000010f6b8:	20 20                	and    %ah,(%rax)
ffff80000010f6ba:	20 20                	and    %ah,(%rax)
ffff80000010f6bc:	20 20                	and    %ah,(%rax)
ffff80000010f6be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010f6c5:	20 20                	and    %ah,(%rax)
ffff80000010f6c7:	10 10                	adc    %dl,(%rax)
ffff80000010f6c9:	08 08                	or     %cl,(%rax)
ffff80000010f6cb:	04 04                	add    $0x4,%al
ffff80000010f6cd:	04 02                	add    $0x2,%al
ffff80000010f6cf:	02 00                	add    (%rax),%al
ffff80000010f6d1:	7c 04                	jl     ffff80000010f6d7 <system_call_table+0x39d7>
ffff80000010f6d3:	04 04                	add    $0x4,%al
ffff80000010f6d5:	04 04                	add    $0x4,%al
ffff80000010f6d7:	04 04                	add    $0x4,%al
ffff80000010f6d9:	04 04                	add    $0x4,%al
ffff80000010f6db:	04 04                	add    $0x4,%al
ffff80000010f6dd:	04 7c                	add    $0x7c,%al
ffff80000010f6df:	00 00                	add    %al,(%rax)
ffff80000010f6e1:	10 28                	adc    %ch,(%rax)
ffff80000010f6e3:	44 82                	rex.R (bad) 
	...
ffff80000010f6fd:	00 fe                	add    %bh,%dh
ffff80000010f6ff:	00 10                	add    %dl,(%rax)
ffff80000010f701:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010f714:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010f717:	04 3c                	add    $0x3c,%al
ffff80000010f719:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010f720:	c0 
ffff80000010f721:	40                   	rex
ffff80000010f722:	40                   	rex
ffff80000010f723:	40                   	rex
ffff80000010f724:	40 58                	rex pop %rax
ffff80000010f726:	64 42                	fs rex.X
ffff80000010f728:	42                   	rex.X
ffff80000010f729:	42                   	rex.X
ffff80000010f72a:	42                   	rex.X
ffff80000010f72b:	42                   	rex.X
ffff80000010f72c:	64 58                	fs pop %rax
ffff80000010f72e:	00 00                	add    %al,(%rax)
ffff80000010f730:	00 00                	add    %al,(%rax)
ffff80000010f732:	00 00                	add    %al,(%rax)
ffff80000010f734:	00 30                	add    %dh,(%rax)
ffff80000010f736:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010f73d:	38 
ffff80000010f73e:	00 00                	add    %al,(%rax)
ffff80000010f740:	0c 04                	or     $0x4,%al
ffff80000010f742:	04 04                	add    $0x4,%al
ffff80000010f744:	04 34                	add    $0x34,%al
ffff80000010f746:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010f74d:	36 
ffff80000010f74e:	00 00                	add    %al,(%rax)
ffff80000010f750:	00 00                	add    %al,(%rax)
ffff80000010f752:	00 00                	add    %al,(%rax)
ffff80000010f754:	00 38                	add    %bh,(%rax)
ffff80000010f756:	44 82                	rex.R (bad) 
ffff80000010f758:	82                   	(bad)  
ffff80000010f759:	fc                   	cld    
ffff80000010f75a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010f761:	10 10                	adc    %dl,(%rax)
ffff80000010f763:	10 10                	adc    %dl,(%rax)
ffff80000010f765:	7c 10                	jl     ffff80000010f777 <system_call_table+0x3a77>
ffff80000010f767:	10 10                	adc    %dl,(%rax)
ffff80000010f769:	10 10                	adc    %dl,(%rax)
ffff80000010f76b:	10 10                	adc    %dl,(%rax)
ffff80000010f76d:	7c 00                	jl     ffff80000010f76f <system_call_table+0x3a6f>
ffff80000010f76f:	00 00                	add    %al,(%rax)
ffff80000010f771:	00 00                	add    %al,(%rax)
ffff80000010f773:	00 00                	add    %al,(%rax)
ffff80000010f775:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010f77c:	34 04 
ffff80000010f77e:	04 38                	add    $0x38,%al
ffff80000010f780:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010f784:	40 58                	rex pop %rax
ffff80000010f786:	64 42                	fs rex.X
ffff80000010f788:	42                   	rex.X
ffff80000010f789:	42                   	rex.X
ffff80000010f78a:	42                   	rex.X
ffff80000010f78b:	42                   	rex.X
ffff80000010f78c:	42 e3 00             	rex.X jrcxz ffff80000010f78f <system_call_table+0x3a8f>
ffff80000010f78f:	00 00                	add    %al,(%rax)
ffff80000010f791:	10 10                	adc    %dl,(%rax)
ffff80000010f793:	00 00                	add    %al,(%rax)
ffff80000010f795:	30 10                	xor    %dl,(%rax)
ffff80000010f797:	10 10                	adc    %dl,(%rax)
ffff80000010f799:	10 10                	adc    %dl,(%rax)
ffff80000010f79b:	10 10                	adc    %dl,(%rax)
ffff80000010f79d:	38 00                	cmp    %al,(%rax)
ffff80000010f79f:	00 00                	add    %al,(%rax)
ffff80000010f7a1:	04 04                	add    $0x4,%al
ffff80000010f7a3:	00 00                	add    %al,(%rax)
ffff80000010f7a5:	0c 04                	or     $0x4,%al
ffff80000010f7a7:	04 04                	add    $0x4,%al
ffff80000010f7a9:	04 04                	add    $0x4,%al
ffff80000010f7ab:	04 04                	add    $0x4,%al
ffff80000010f7ad:	08 08                	or     %cl,(%rax)
ffff80000010f7af:	30 c0                	xor    %al,%al
ffff80000010f7b1:	40                   	rex
ffff80000010f7b2:	40                   	rex
ffff80000010f7b3:	40                   	rex
ffff80000010f7b4:	40                   	rex
ffff80000010f7b5:	4e                   	rex.WRX
ffff80000010f7b6:	44                   	rex.R
ffff80000010f7b7:	48 50                	rex.W push %rax
ffff80000010f7b9:	60                   	(bad)  
ffff80000010f7ba:	50                   	push   %rax
ffff80000010f7bb:	48                   	rex.W
ffff80000010f7bc:	44 e6 00             	rex.R out %al,$0x0
ffff80000010f7bf:	00 30                	add    %dh,(%rax)
ffff80000010f7c1:	10 10                	adc    %dl,(%rax)
ffff80000010f7c3:	10 10                	adc    %dl,(%rax)
ffff80000010f7c5:	10 10                	adc    %dl,(%rax)
ffff80000010f7c7:	10 10                	adc    %dl,(%rax)
ffff80000010f7c9:	10 10                	adc    %dl,(%rax)
ffff80000010f7cb:	10 10                	adc    %dl,(%rax)
ffff80000010f7cd:	38 00                	cmp    %al,(%rax)
ffff80000010f7cf:	00 00                	add    %al,(%rax)
ffff80000010f7d1:	00 00                	add    %al,(%rax)
ffff80000010f7d3:	00 00                	add    %al,(%rax)
ffff80000010f7d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010f7d9:	49                   	rex.WB
ffff80000010f7da:	49                   	rex.WB
ffff80000010f7db:	49                   	rex.WB
ffff80000010f7dc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010f7df:	00 00                	add    %al,(%rax)
ffff80000010f7e1:	00 00                	add    %al,(%rax)
ffff80000010f7e3:	00 00                	add    %al,(%rax)
ffff80000010f7e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010f7e9:	42                   	rex.X
ffff80000010f7ea:	42                   	rex.X
ffff80000010f7eb:	42                   	rex.X
ffff80000010f7ec:	42 e3 00             	rex.X jrcxz ffff80000010f7ef <system_call_table+0x3aef>
ffff80000010f7ef:	00 00                	add    %al,(%rax)
ffff80000010f7f1:	00 00                	add    %al,(%rax)
ffff80000010f7f3:	00 00                	add    %al,(%rax)
ffff80000010f7f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f7f9:	82                   	(bad)  
ffff80000010f7fa:	82                   	(bad)  
ffff80000010f7fb:	82                   	(bad)  
ffff80000010f7fc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f7ff:	00 00                	add    %al,(%rax)
ffff80000010f801:	00 00                	add    %al,(%rax)
ffff80000010f803:	00 d8                	add    %bl,%al
ffff80000010f805:	64 42                	fs rex.X
ffff80000010f807:	42                   	rex.X
ffff80000010f808:	42                   	rex.X
ffff80000010f809:	42                   	rex.X
ffff80000010f80a:	42                   	rex.X
ffff80000010f80b:	64 58                	fs pop %rax
ffff80000010f80d:	40                   	rex
ffff80000010f80e:	40 e0 00             	rex loopne ffff80000010f811 <system_call_table+0x3b11>
ffff80000010f811:	00 00                	add    %al,(%rax)
ffff80000010f813:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010f816:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010f81d:	04 04                	add    $0x4,%al
ffff80000010f81f:	0e                   	(bad)  
ffff80000010f820:	00 00                	add    %al,(%rax)
ffff80000010f822:	00 00                	add    %al,(%rax)
ffff80000010f824:	00 dc                	add    %bl,%ah
ffff80000010f826:	62 42                	(bad)  
ffff80000010f828:	40                   	rex
ffff80000010f829:	40                   	rex
ffff80000010f82a:	40                   	rex
ffff80000010f82b:	40                   	rex
ffff80000010f82c:	40 e0 00             	rex loopne ffff80000010f82f <system_call_table+0x3b2f>
ffff80000010f82f:	00 00                	add    %al,(%rax)
ffff80000010f831:	00 00                	add    %al,(%rax)
ffff80000010f833:	00 00                	add    %al,(%rax)
ffff80000010f835:	7a 86                	jp     ffff80000010f7bd <system_call_table+0x3abd>
ffff80000010f837:	82                   	(bad)  
ffff80000010f838:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010f83b:	82                   	(bad)  
ffff80000010f83c:	c2 bc 00             	retq   $0xbc
ffff80000010f83f:	00 00                	add    %al,(%rax)
ffff80000010f841:	00 10                	add    %dl,(%rax)
ffff80000010f843:	10 10                	adc    %dl,(%rax)
ffff80000010f845:	7c 10                	jl     ffff80000010f857 <system_call_table+0x3b57>
ffff80000010f847:	10 10                	adc    %dl,(%rax)
ffff80000010f849:	10 10                	adc    %dl,(%rax)
ffff80000010f84b:	10 10                	adc    %dl,(%rax)
ffff80000010f84d:	0e                   	(bad)  
ffff80000010f84e:	00 00                	add    %al,(%rax)
ffff80000010f850:	00 00                	add    %al,(%rax)
ffff80000010f852:	00 00                	add    %al,(%rax)
ffff80000010f854:	00 c6                	add    %al,%dh
ffff80000010f856:	42                   	rex.X
ffff80000010f857:	42                   	rex.X
ffff80000010f858:	42                   	rex.X
ffff80000010f859:	42                   	rex.X
ffff80000010f85a:	42                   	rex.X
ffff80000010f85b:	42                   	rex.X
ffff80000010f85c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010f85f:	00 00                	add    %al,(%rax)
ffff80000010f861:	00 00                	add    %al,(%rax)
ffff80000010f863:	00 00                	add    %al,(%rax)
ffff80000010f865:	e7 42                	out    %eax,$0x42
ffff80000010f867:	42                   	rex.X
ffff80000010f868:	42 24 24             	rex.X and $0x24,%al
ffff80000010f86b:	24 18                	and    $0x18,%al
ffff80000010f86d:	18 00                	sbb    %al,(%rax)
ffff80000010f86f:	00 00                	add    %al,(%rax)
ffff80000010f871:	00 00                	add    %al,(%rax)
ffff80000010f873:	00 00                	add    %al,(%rax)
ffff80000010f875:	e7 42                	out    %eax,$0x42
ffff80000010f877:	42 5a                	rex.X pop %rdx
ffff80000010f879:	5a                   	pop    %rdx
ffff80000010f87a:	5a                   	pop    %rdx
ffff80000010f87b:	24 24                	and    $0x24,%al
ffff80000010f87d:	24 00                	and    $0x0,%al
ffff80000010f87f:	00 00                	add    %al,(%rax)
ffff80000010f881:	00 00                	add    %al,(%rax)
ffff80000010f883:	00 00                	add    %al,(%rax)
ffff80000010f885:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010f88a:	28 28                	sub    %ch,(%rax)
ffff80000010f88c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010f890:	00 00                	add    %al,(%rax)
ffff80000010f892:	00 00                	add    %al,(%rax)
ffff80000010f894:	00 e7                	add    %ah,%bh
ffff80000010f896:	42                   	rex.X
ffff80000010f897:	42 24 24             	rex.X and $0x24,%al
ffff80000010f89a:	24 18                	and    $0x18,%al
ffff80000010f89c:	18 10                	sbb    %dl,(%rax)
ffff80000010f89e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010f8a1:	00 00                	add    %al,(%rax)
ffff80000010f8a3:	00 00                	add    %al,(%rax)
ffff80000010f8a5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010f8ab:	42 82                	rex.X (bad) 
ffff80000010f8ad:	fe 00                	incb   (%rax)
ffff80000010f8af:	00 00                	add    %al,(%rax)
ffff80000010f8b1:	06                   	(bad)  
ffff80000010f8b2:	08 10                	or     %dl,(%rax)
ffff80000010f8b4:	10 10                	adc    %dl,(%rax)
ffff80000010f8b6:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010f8b9:	10 10                	adc    %dl,(%rax)
ffff80000010f8bb:	10 08                	adc    %cl,(%rax)
ffff80000010f8bd:	06                   	(bad)  
ffff80000010f8be:	00 00                	add    %al,(%rax)
ffff80000010f8c0:	10 10                	adc    %dl,(%rax)
ffff80000010f8c2:	10 10                	adc    %dl,(%rax)
ffff80000010f8c4:	10 10                	adc    %dl,(%rax)
ffff80000010f8c6:	10 10                	adc    %dl,(%rax)
ffff80000010f8c8:	10 10                	adc    %dl,(%rax)
ffff80000010f8ca:	10 10                	adc    %dl,(%rax)
ffff80000010f8cc:	10 10                	adc    %dl,(%rax)
ffff80000010f8ce:	10 10                	adc    %dl,(%rax)
ffff80000010f8d0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010f8d3:	08 08                	or     %cl,(%rax)
ffff80000010f8d5:	08 08                	or     %cl,(%rax)
ffff80000010f8d7:	06                   	(bad)  
ffff80000010f8d8:	08 08                	or     %cl,(%rax)
ffff80000010f8da:	08 08                	or     %cl,(%rax)
ffff80000010f8dc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010f8df:	00 00                	add    %al,(%rax)
ffff80000010f8e1:	72 8c                	jb     ffff80000010f86f <system_call_table+0x3b6f>
	...

ffff800000110100 <interrupt>:
ffff800000110100:	82                   	(bad)  
ffff800000110101:	81 10 00 00 80 ff    	adcl   $0xff800000,(%rax)
ffff800000110107:	ff cc                	dec    %esp
ffff800000110109:	81 10 00 00 80 ff    	adcl   $0xff800000,(%rax)
ffff80000011010f:	ff 16                	callq  *(%rsi)
ffff800000110111:	82                   	(bad)  
ffff800000110112:	10 00                	adc    %al,(%rax)
ffff800000110114:	00 80 ff ff 60 82    	add    %al,-0x7d9f0001(%rax)
ffff80000011011a:	10 00                	adc    %al,(%rax)
ffff80000011011c:	00 80 ff ff aa 82    	add    %al,-0x7d550001(%rax)
ffff800000110122:	10 00                	adc    %al,(%rax)
ffff800000110124:	00 80 ff ff f4 82    	add    %al,-0x7d0b0001(%rax)
ffff80000011012a:	10 00                	adc    %al,(%rax)
ffff80000011012c:	00 80 ff ff 3e 83    	add    %al,-0x7cc10001(%rax)
ffff800000110132:	10 00                	adc    %al,(%rax)
ffff800000110134:	00 80 ff ff 88 83    	add    %al,-0x7c770001(%rax)
ffff80000011013a:	10 00                	adc    %al,(%rax)
ffff80000011013c:	00 80 ff ff d2 83    	add    %al,-0x7c2d0001(%rax)
ffff800000110142:	10 00                	adc    %al,(%rax)
ffff800000110144:	00 80 ff ff 1c 84    	add    %al,-0x7be30001(%rax)
ffff80000011014a:	10 00                	adc    %al,(%rax)
ffff80000011014c:	00 80 ff ff 66 84    	add    %al,-0x7b990001(%rax)
ffff800000110152:	10 00                	adc    %al,(%rax)
ffff800000110154:	00 80 ff ff b0 84    	add    %al,-0x7b4f0001(%rax)
ffff80000011015a:	10 00                	adc    %al,(%rax)
ffff80000011015c:	00 80 ff ff fa 84    	add    %al,-0x7b050001(%rax)
ffff800000110162:	10 00                	adc    %al,(%rax)
ffff800000110164:	00 80 ff ff 44 85    	add    %al,-0x7abb0001(%rax)
ffff80000011016a:	10 00                	adc    %al,(%rax)
ffff80000011016c:	00 80 ff ff 8e 85    	add    %al,-0x7a710001(%rax)
ffff800000110172:	10 00                	adc    %al,(%rax)
ffff800000110174:	00 80 ff ff d8 85    	add    %al,-0x7a270001(%rax)
ffff80000011017a:	10 00                	adc    %al,(%rax)
ffff80000011017c:	00 80 ff ff 22 86    	add    %al,-0x79dd0001(%rax)
ffff800000110182:	10 00                	adc    %al,(%rax)
ffff800000110184:	00 80 ff ff 6c 86    	add    %al,-0x79930001(%rax)
ffff80000011018a:	10 00                	adc    %al,(%rax)
ffff80000011018c:	00 80 ff ff b6 86    	add    %al,-0x79490001(%rax)
ffff800000110192:	10 00                	adc    %al,(%rax)
ffff800000110194:	00 80 ff ff 00 87    	add    %al,-0x78ff0001(%rax)
ffff80000011019a:	10 00                	adc    %al,(%rax)
ffff80000011019c:	00 80 ff ff 4a 87    	add    %al,-0x78b50001(%rax)
ffff8000001101a2:	10 00                	adc    %al,(%rax)
ffff8000001101a4:	00 80 ff ff 94 87    	add    %al,-0x786b0001(%rax)
ffff8000001101aa:	10 00                	adc    %al,(%rax)
ffff8000001101ac:	00 80 ff ff de 87    	add    %al,-0x78210001(%rax)
ffff8000001101b2:	10 00                	adc    %al,(%rax)
ffff8000001101b4:	00 80 ff ff 28 88    	add    %al,-0x77d70001(%rax)
ffff8000001101ba:	10 00                	adc    %al,(%rax)
ffff8000001101bc:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001103ce:	00 00                	add    %al,(%rax)
ffff8000001103d0:	00 10                	add    %dl,(%rax)
ffff8000001103d2:	10 10                	adc    %dl,(%rax)
ffff8000001103d4:	10 10                	adc    %dl,(%rax)
ffff8000001103d6:	10 10                	adc    %dl,(%rax)
ffff8000001103d8:	10 10                	adc    %dl,(%rax)
ffff8000001103da:	00 00                	add    %al,(%rax)
ffff8000001103dc:	10 10                	adc    %dl,(%rax)
ffff8000001103de:	00 00                	add    %al,(%rax)
ffff8000001103e0:	28 28                	sub    %ch,(%rax)
ffff8000001103e2:	28 00                	sub    %al,(%rax)
	...
ffff8000001103f0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff8000001103f4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff8000001103f8:	44                   	rex.R
ffff8000001103f9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff8000001103fe:	00 00                	add    %al,(%rax)
ffff800000110400:	10 3a                	adc    %bh,(%rdx)
ffff800000110402:	56                   	push   %rsi
ffff800000110403:	92                   	xchg   %eax,%edx
ffff800000110404:	92                   	xchg   %eax,%edx
ffff800000110405:	90                   	nop
ffff800000110406:	50                   	push   %rax
ffff800000110407:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000011040a:	92                   	xchg   %eax,%edx
ffff80000011040b:	92                   	xchg   %eax,%edx
ffff80000011040c:	d4                   	(bad)  
ffff80000011040d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff800000110412:	94                   	xchg   %eax,%esp
ffff800000110413:	94                   	xchg   %eax,%esp
ffff800000110414:	68 08 10 10 20       	pushq  $0x20101008
ffff800000110419:	2c 52                	sub    $0x52,%al
ffff80000011041b:	52                   	push   %rdx
ffff80000011041c:	92                   	xchg   %eax,%edx
ffff80000011041d:	8c 00                	mov    %es,(%rax)
ffff80000011041f:	00 00                	add    %al,(%rax)
ffff800000110421:	70 88                	jo     ffff8000001103ab <interrupt+0x2ab>
ffff800000110423:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff800000110429:	92                   	xchg   %eax,%edx
ffff80000011042a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff800000110431:	08 10                	or     %dl,(%rax)
	...
ffff80000011043f:	00 02                	add    %al,(%rdx)
ffff800000110441:	04 08                	add    $0x8,%al
ffff800000110443:	08 10                	or     %dl,(%rax)
ffff800000110445:	10 10                	adc    %dl,(%rax)
ffff800000110447:	10 10                	adc    %dl,(%rax)
ffff800000110449:	10 10                	adc    %dl,(%rax)
ffff80000011044b:	08 08                	or     %cl,(%rax)
ffff80000011044d:	04 02                	add    $0x2,%al
ffff80000011044f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff800000110455:	10 10                	adc    %dl,(%rax)
ffff800000110457:	10 10                	adc    %dl,(%rax)
ffff800000110459:	10 10                	adc    %dl,(%rax)
ffff80000011045b:	20 20                	and    %ah,(%rax)
ffff80000011045d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000110461:	00 00                	add    %al,(%rax)
ffff800000110463:	00 00                	add    %al,(%rax)
ffff800000110465:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000011046b:	10 00                	adc    %al,(%rax)
	...
ffff800000110475:	10 10                	adc    %dl,(%rax)
ffff800000110477:	10 fe                	adc    %bh,%dh
ffff800000110479:	10 10                	adc    %dl,(%rax)
ffff80000011047b:	10 00                	adc    %al,(%rax)
	...
ffff800000110489:	00 00                	add    %al,(%rax)
ffff80000011048b:	18 18                	sbb    %bl,(%rax)
ffff80000011048d:	08 08                	or     %cl,(%rax)
ffff80000011048f:	10 00                	adc    %al,(%rax)
ffff800000110491:	00 00                	add    %al,(%rax)
ffff800000110493:	00 00                	add    %al,(%rax)
ffff800000110495:	00 00                	add    %al,(%rax)
ffff800000110497:	00 fe                	add    %bh,%dh
	...
ffff8000001104a9:	00 00                	add    %al,(%rax)
ffff8000001104ab:	00 18                	add    %bl,(%rax)
ffff8000001104ad:	18 00                	sbb    %al,(%rax)
ffff8000001104af:	00 02                	add    %al,(%rdx)
ffff8000001104b1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff8000001104b4:	08 08                	or     %cl,(%rax)
ffff8000001104b6:	08 10                	or     %dl,(%rax)
ffff8000001104b8:	10 20                	adc    %ah,(%rax)
ffff8000001104ba:	20 40 40             	and    %al,0x40(%rax)
ffff8000001104bd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff8000001104c4:	42 
ffff8000001104c5:	42                   	rex.X
ffff8000001104c6:	42                   	rex.X
ffff8000001104c7:	42                   	rex.X
ffff8000001104c8:	42                   	rex.X
ffff8000001104c9:	42                   	rex.X
ffff8000001104ca:	42 24 24             	rex.X and $0x24,%al
ffff8000001104cd:	18 00                	sbb    %al,(%rax)
ffff8000001104cf:	00 00                	add    %al,(%rax)
ffff8000001104d1:	08 18                	or     %bl,(%rax)
ffff8000001104d3:	28 08                	sub    %cl,(%rax)
ffff8000001104d5:	08 08                	or     %cl,(%rax)
ffff8000001104d7:	08 08                	or     %cl,(%rax)
ffff8000001104d9:	08 08                	or     %cl,(%rax)
ffff8000001104db:	08 08                	or     %cl,(%rax)
ffff8000001104dd:	3e 00 00             	add    %al,%ds:(%rax)
ffff8000001104e0:	00 18                	add    %bl,(%rax)
ffff8000001104e2:	24 42                	and    $0x42,%al
ffff8000001104e4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff8000001104e8:	10 20                	adc    %ah,(%rax)
ffff8000001104ea:	20 40 40             	and    %al,0x40(%rax)
ffff8000001104ed:	7e 00                	jle    ffff8000001104ef <interrupt+0x3ef>
ffff8000001104ef:	00 00                	add    %al,(%rax)
ffff8000001104f1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff8000001104f4:	02 02                	add    (%rdx),%al
ffff8000001104f6:	04 18                	add    $0x18,%al
ffff8000001104f8:	04 02                	add    $0x2,%al
ffff8000001104fa:	02 42 24             	add    0x24(%rdx),%al
ffff8000001104fd:	18 00                	sbb    %al,(%rax)
ffff8000001104ff:	00 00                	add    %al,(%rax)
ffff800000110501:	0c 0c                	or     $0xc,%al
ffff800000110503:	0c 14                	or     $0x14,%al
ffff800000110505:	14 14                	adc    $0x14,%al
ffff800000110507:	24 24                	and    $0x24,%al
ffff800000110509:	44 7e 04             	rex.R jle ffff800000110510 <interrupt+0x410>
ffff80000011050c:	04 1e                	add    $0x1e,%al
ffff80000011050e:	00 00                	add    %al,(%rax)
ffff800000110510:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff800000110514:	40 58                	rex pop %rax
ffff800000110516:	64 02 02             	add    %fs:(%rdx),%al
ffff800000110519:	02 02                	add    (%rdx),%al
ffff80000011051b:	42 24 18             	rex.X and $0x18,%al
ffff80000011051e:	00 00                	add    %al,(%rax)
ffff800000110520:	00 18                	add    %bl,(%rax)
ffff800000110522:	24 42                	and    $0x42,%al
ffff800000110524:	40 58                	rex pop %rax
ffff800000110526:	64 42                	fs rex.X
ffff800000110528:	42                   	rex.X
ffff800000110529:	42                   	rex.X
ffff80000011052a:	42                   	rex.X
ffff80000011052b:	42 24 18             	rex.X and $0x18,%al
ffff80000011052e:	00 00                	add    %al,(%rax)
ffff800000110530:	00 7e 42             	add    %bh,0x42(%rsi)
ffff800000110533:	42 04 04             	rex.X add $0x4,%al
ffff800000110536:	08 08                	or     %cl,(%rax)
ffff800000110538:	08 10                	or     %dl,(%rax)
ffff80000011053a:	10 10                	adc    %dl,(%rax)
ffff80000011053c:	10 38                	adc    %bh,(%rax)
ffff80000011053e:	00 00                	add    %al,(%rax)
ffff800000110540:	00 18                	add    %bl,(%rax)
ffff800000110542:	24 42                	and    $0x42,%al
ffff800000110544:	42                   	rex.X
ffff800000110545:	42 24 18             	rex.X and $0x18,%al
ffff800000110548:	24 42                	and    $0x42,%al
ffff80000011054a:	42                   	rex.X
ffff80000011054b:	42 24 18             	rex.X and $0x18,%al
ffff80000011054e:	00 00                	add    %al,(%rax)
ffff800000110550:	00 18                	add    %bl,(%rax)
ffff800000110552:	24 42                	and    $0x42,%al
ffff800000110554:	42                   	rex.X
ffff800000110555:	42                   	rex.X
ffff800000110556:	42                   	rex.X
ffff800000110557:	42                   	rex.X
ffff800000110558:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000011055b:	42 24 18             	rex.X and $0x18,%al
ffff80000011055e:	00 00                	add    %al,(%rax)
ffff800000110560:	00 00                	add    %al,(%rax)
ffff800000110562:	00 00                	add    %al,(%rax)
ffff800000110564:	00 18                	add    %bl,(%rax)
ffff800000110566:	18 00                	sbb    %al,(%rax)
ffff800000110568:	00 00                	add    %al,(%rax)
ffff80000011056a:	00 00                	add    %al,(%rax)
ffff80000011056c:	18 18                	sbb    %bl,(%rax)
ffff80000011056e:	00 00                	add    %al,(%rax)
ffff800000110570:	00 00                	add    %al,(%rax)
ffff800000110572:	00 00                	add    %al,(%rax)
ffff800000110574:	00 18                	add    %bl,(%rax)
ffff800000110576:	18 00                	sbb    %al,(%rax)
ffff800000110578:	00 00                	add    %al,(%rax)
ffff80000011057a:	00 18                	add    %bl,(%rax)
ffff80000011057c:	18 08                	sbb    %cl,(%rax)
ffff80000011057e:	08 10                	or     %dl,(%rax)
ffff800000110580:	00 02                	add    %al,(%rdx)
ffff800000110582:	04 08                	add    $0x8,%al
ffff800000110584:	10 20                	adc    %ah,(%rax)
ffff800000110586:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000011058d:	04 
ffff80000011058e:	02 00                	add    (%rax),%al
ffff800000110590:	00 00                	add    %al,(%rax)
ffff800000110592:	00 00                	add    %al,(%rax)
ffff800000110594:	00 00                	add    %al,(%rax)
ffff800000110596:	fe 00                	incb   (%rax)
ffff800000110598:	00 fe                	add    %bh,%dh
ffff80000011059a:	00 00                	add    %al,(%rax)
ffff80000011059c:	00 00                	add    %al,(%rax)
ffff80000011059e:	00 00                	add    %al,(%rax)
ffff8000001105a0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff8000001105a6:	04 02                	add    $0x2,%al
ffff8000001105a8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff8000001105ab:	10 20                	adc    %ah,(%rax)
ffff8000001105ad:	40 80 00 00          	rex addb $0x0,(%rax)
ffff8000001105b1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001105b5:	82                   	(bad)  
ffff8000001105b6:	04 08                	add    $0x8,%al
ffff8000001105b8:	10 10                	adc    %dl,(%rax)
ffff8000001105ba:	00 00                	add    %al,(%rax)
ffff8000001105bc:	18 18                	sbb    %bl,(%rax)
ffff8000001105be:	00 00                	add    %al,(%rax)
ffff8000001105c0:	00 38                	add    %bh,(%rax)
ffff8000001105c2:	44 82                	rex.R (bad) 
ffff8000001105c4:	9a                   	(bad)  
ffff8000001105c5:	aa                   	stos   %al,%es:(%rdi)
ffff8000001105c6:	aa                   	stos   %al,%es:(%rdi)
ffff8000001105c7:	aa                   	stos   %al,%es:(%rdi)
ffff8000001105c8:	aa                   	stos   %al,%es:(%rdi)
ffff8000001105c9:	aa                   	stos   %al,%es:(%rdi)
ffff8000001105ca:	9c                   	pushfq 
ffff8000001105cb:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff8000001105cf:	00 00                	add    %al,(%rax)
ffff8000001105d1:	18 18                	sbb    %bl,(%rax)
ffff8000001105d3:	18 18                	sbb    %bl,(%rax)
ffff8000001105d5:	24 24                	and    $0x24,%al
ffff8000001105d7:	24 24                	and    $0x24,%al
ffff8000001105d9:	7e 42                	jle    ffff80000011061d <interrupt+0x51d>
ffff8000001105db:	42                   	rex.X
ffff8000001105dc:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001105df:	00 00                	add    %al,(%rax)
ffff8000001105e1:	f0 48                	lock rex.W
ffff8000001105e3:	44                   	rex.R
ffff8000001105e4:	44                   	rex.R
ffff8000001105e5:	44                   	rex.R
ffff8000001105e6:	48 78 44             	rex.W js ffff80000011062d <interrupt+0x52d>
ffff8000001105e9:	42                   	rex.X
ffff8000001105ea:	42                   	rex.X
ffff8000001105eb:	42                   	rex.X
ffff8000001105ec:	44 f8                	rex.R clc 
ffff8000001105ee:	00 00                	add    %al,(%rax)
ffff8000001105f0:	00 3a                	add    %bh,(%rdx)
ffff8000001105f2:	46                   	rex.RX
ffff8000001105f3:	42 82                	rex.X (bad) 
ffff8000001105f5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff8000001105fc:	44 38 00             	cmp    %r8b,(%rax)
ffff8000001105ff:	00 00                	add    %al,(%rax)
ffff800000110601:	f8                   	clc    
ffff800000110602:	44                   	rex.R
ffff800000110603:	44                   	rex.R
ffff800000110604:	42                   	rex.X
ffff800000110605:	42                   	rex.X
ffff800000110606:	42                   	rex.X
ffff800000110607:	42                   	rex.X
ffff800000110608:	42                   	rex.X
ffff800000110609:	42                   	rex.X
ffff80000011060a:	42                   	rex.X
ffff80000011060b:	44                   	rex.R
ffff80000011060c:	44 f8                	rex.R clc 
ffff80000011060e:	00 00                	add    %al,(%rax)
ffff800000110610:	00 fe                	add    %bh,%dh
ffff800000110612:	42                   	rex.X
ffff800000110613:	42                   	rex.X
ffff800000110614:	40                   	rex
ffff800000110615:	40                   	rex
ffff800000110616:	44 7c 44             	rex.R jl ffff80000011065d <interrupt+0x55d>
ffff800000110619:	40                   	rex
ffff80000011061a:	40                   	rex
ffff80000011061b:	42                   	rex.X
ffff80000011061c:	42 fe 00             	rex.X incb (%rax)
ffff80000011061f:	00 00                	add    %al,(%rax)
ffff800000110621:	fe 42 42             	incb   0x42(%rdx)
ffff800000110624:	40                   	rex
ffff800000110625:	40                   	rex
ffff800000110626:	44 7c 44             	rex.R jl ffff80000011066d <interrupt+0x56d>
ffff800000110629:	44                   	rex.R
ffff80000011062a:	40                   	rex
ffff80000011062b:	40                   	rex
ffff80000011062c:	40                   	rex
ffff80000011062d:	f0 00 00             	lock add %al,(%rax)
ffff800000110630:	00 3a                	add    %bh,(%rdx)
ffff800000110632:	46                   	rex.RX
ffff800000110633:	42 82                	rex.X (bad) 
ffff800000110635:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000011063c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000011063f:	00 00                	add    %al,(%rax)
ffff800000110641:	e7 42                	out    %eax,$0x42
ffff800000110643:	42                   	rex.X
ffff800000110644:	42                   	rex.X
ffff800000110645:	42                   	rex.X
ffff800000110646:	42 7e 42             	rex.X jle ffff80000011068b <interrupt+0x58b>
ffff800000110649:	42                   	rex.X
ffff80000011064a:	42                   	rex.X
ffff80000011064b:	42                   	rex.X
ffff80000011064c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011064f:	00 00                	add    %al,(%rax)
ffff800000110651:	7c 10                	jl     ffff800000110663 <interrupt+0x563>
ffff800000110653:	10 10                	adc    %dl,(%rax)
ffff800000110655:	10 10                	adc    %dl,(%rax)
ffff800000110657:	10 10                	adc    %dl,(%rax)
ffff800000110659:	10 10                	adc    %dl,(%rax)
ffff80000011065b:	10 10                	adc    %dl,(%rax)
ffff80000011065d:	7c 00                	jl     ffff80000011065f <interrupt+0x55f>
ffff80000011065f:	00 00                	add    %al,(%rax)
ffff800000110661:	1f                   	(bad)  
ffff800000110662:	04 04                	add    $0x4,%al
ffff800000110664:	04 04                	add    $0x4,%al
ffff800000110666:	04 04                	add    $0x4,%al
ffff800000110668:	04 04                	add    $0x4,%al
ffff80000011066a:	04 04                	add    $0x4,%al
ffff80000011066c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000011066f:	00 00                	add    %al,(%rax)
ffff800000110671:	e7 42                	out    %eax,$0x42
ffff800000110673:	44                   	rex.R
ffff800000110674:	48 50                	rex.W push %rax
ffff800000110676:	50                   	push   %rax
ffff800000110677:	60                   	(bad)  
ffff800000110678:	50                   	push   %rax
ffff800000110679:	50                   	push   %rax
ffff80000011067a:	48                   	rex.W
ffff80000011067b:	44                   	rex.R
ffff80000011067c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011067f:	00 00                	add    %al,(%rax)
ffff800000110681:	f0 40                	lock rex
ffff800000110683:	40                   	rex
ffff800000110684:	40                   	rex
ffff800000110685:	40                   	rex
ffff800000110686:	40                   	rex
ffff800000110687:	40                   	rex
ffff800000110688:	40                   	rex
ffff800000110689:	40                   	rex
ffff80000011068a:	40                   	rex
ffff80000011068b:	42                   	rex.X
ffff80000011068c:	42 fe 00             	rex.X incb (%rax)
ffff80000011068f:	00 00                	add    %al,(%rax)
ffff800000110691:	c3                   	retq   
ffff800000110692:	42                   	rex.X
ffff800000110693:	66 66 66 5a          	data16 data16 pop %dx
ffff800000110697:	5a                   	pop    %rdx
ffff800000110698:	5a                   	pop    %rdx
ffff800000110699:	42                   	rex.X
ffff80000011069a:	42                   	rex.X
ffff80000011069b:	42                   	rex.X
ffff80000011069c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011069f:	00 00                	add    %al,(%rax)
ffff8000001106a1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff8000001106a8:	4a                   	rex.WX
ffff8000001106a9:	4a                   	rex.WX
ffff8000001106aa:	4a                   	rex.WX
ffff8000001106ab:	46                   	rex.RX
ffff8000001106ac:	46 e2 00             	rex.RX loop ffff8000001106af <interrupt+0x5af>
ffff8000001106af:	00 00                	add    %al,(%rax)
ffff8000001106b1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001106b5:	82                   	(bad)  
ffff8000001106b6:	82                   	(bad)  
ffff8000001106b7:	82                   	(bad)  
ffff8000001106b8:	82                   	(bad)  
ffff8000001106b9:	82                   	(bad)  
ffff8000001106ba:	82                   	(bad)  
ffff8000001106bb:	82                   	(bad)  
ffff8000001106bc:	44 38 00             	cmp    %r8b,(%rax)
ffff8000001106bf:	00 00                	add    %al,(%rax)
ffff8000001106c1:	f8                   	clc    
ffff8000001106c2:	44                   	rex.R
ffff8000001106c3:	42                   	rex.X
ffff8000001106c4:	42                   	rex.X
ffff8000001106c5:	42                   	rex.X
ffff8000001106c6:	44 78 40             	rex.R js ffff800000110709 <interrupt+0x609>
ffff8000001106c9:	40                   	rex
ffff8000001106ca:	40                   	rex
ffff8000001106cb:	40                   	rex
ffff8000001106cc:	40                   	rex
ffff8000001106cd:	f0 00 00             	lock add %al,(%rax)
ffff8000001106d0:	00 38                	add    %bh,(%rax)
ffff8000001106d2:	44 82                	rex.R (bad) 
ffff8000001106d4:	82                   	(bad)  
ffff8000001106d5:	82                   	(bad)  
ffff8000001106d6:	82                   	(bad)  
ffff8000001106d7:	82                   	(bad)  
ffff8000001106d8:	82                   	(bad)  
ffff8000001106d9:	82                   	(bad)  
ffff8000001106da:	92                   	xchg   %eax,%edx
ffff8000001106db:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff8000001106df:	00 00                	add    %al,(%rax)
ffff8000001106e1:	fc                   	cld    
ffff8000001106e2:	42                   	rex.X
ffff8000001106e3:	42                   	rex.X
ffff8000001106e4:	42                   	rex.X
ffff8000001106e5:	42 7c 44             	rex.X jl ffff80000011072c <interrupt+0x62c>
ffff8000001106e8:	42                   	rex.X
ffff8000001106e9:	42                   	rex.X
ffff8000001106ea:	42                   	rex.X
ffff8000001106eb:	42                   	rex.X
ffff8000001106ec:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001106ef:	00 00                	add    %al,(%rax)
ffff8000001106f1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff8000001106f4:	82                   	(bad)  
ffff8000001106f5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff8000001106f9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff8000001106ff:	00 00                	add    %al,(%rax)
ffff800000110701:	fe                   	(bad)  
ffff800000110702:	92                   	xchg   %eax,%edx
ffff800000110703:	92                   	xchg   %eax,%edx
ffff800000110704:	10 10                	adc    %dl,(%rax)
ffff800000110706:	10 10                	adc    %dl,(%rax)
ffff800000110708:	10 10                	adc    %dl,(%rax)
ffff80000011070a:	10 10                	adc    %dl,(%rax)
ffff80000011070c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff800000110710:	00 e7                	add    %ah,%bh
ffff800000110712:	42                   	rex.X
ffff800000110713:	42                   	rex.X
ffff800000110714:	42                   	rex.X
ffff800000110715:	42                   	rex.X
ffff800000110716:	42                   	rex.X
ffff800000110717:	42                   	rex.X
ffff800000110718:	42                   	rex.X
ffff800000110719:	42                   	rex.X
ffff80000011071a:	42                   	rex.X
ffff80000011071b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000011071e:	00 00                	add    %al,(%rax)
ffff800000110720:	00 e7                	add    %ah,%bh
ffff800000110722:	42                   	rex.X
ffff800000110723:	42                   	rex.X
ffff800000110724:	42                   	rex.X
ffff800000110725:	42 24 24             	rex.X and $0x24,%al
ffff800000110728:	24 24                	and    $0x24,%al
ffff80000011072a:	18 18                	sbb    %bl,(%rax)
ffff80000011072c:	18 18                	sbb    %bl,(%rax)
ffff80000011072e:	00 00                	add    %al,(%rax)
ffff800000110730:	00 e7                	add    %ah,%bh
ffff800000110732:	42                   	rex.X
ffff800000110733:	42                   	rex.X
ffff800000110734:	42 5a                	rex.X pop %rdx
ffff800000110736:	5a                   	pop    %rdx
ffff800000110737:	5a                   	pop    %rdx
ffff800000110738:	5a                   	pop    %rdx
ffff800000110739:	24 24                	and    $0x24,%al
ffff80000011073b:	24 24                	and    $0x24,%al
ffff80000011073d:	24 00                	and    $0x0,%al
ffff80000011073f:	00 00                	add    %al,(%rax)
ffff800000110741:	e7 42                	out    %eax,$0x42
ffff800000110743:	42 24 24             	rex.X and $0x24,%al
ffff800000110746:	24 18                	and    $0x18,%al
ffff800000110748:	24 24                	and    $0x24,%al
ffff80000011074a:	24 42                	and    $0x42,%al
ffff80000011074c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011074f:	00 00                	add    %al,(%rax)
ffff800000110751:	ee                   	out    %al,(%dx)
ffff800000110752:	44                   	rex.R
ffff800000110753:	44                   	rex.R
ffff800000110754:	44 28 28             	sub    %r13b,(%rax)
ffff800000110757:	28 10                	sub    %dl,(%rax)
ffff800000110759:	10 10                	adc    %dl,(%rax)
ffff80000011075b:	10 10                	adc    %dl,(%rax)
ffff80000011075d:	7c 00                	jl     ffff80000011075f <interrupt+0x65f>
ffff80000011075f:	00 00                	add    %al,(%rax)
ffff800000110761:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff800000110768:	20 20                	and    %ah,(%rax)
ffff80000011076a:	40                   	rex
ffff80000011076b:	42 82                	rex.X (bad) 
ffff80000011076d:	fe 00                	incb   (%rax)
ffff80000011076f:	00 00                	add    %al,(%rax)
ffff800000110771:	3e 20 20             	and    %ah,%ds:(%rax)
ffff800000110774:	20 20                	and    %ah,(%rax)
ffff800000110776:	20 20                	and    %ah,(%rax)
ffff800000110778:	20 20                	and    %ah,(%rax)
ffff80000011077a:	20 20                	and    %ah,(%rax)
ffff80000011077c:	20 20                	and    %ah,(%rax)
ffff80000011077e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff800000110785:	20 20                	and    %ah,(%rax)
ffff800000110787:	10 10                	adc    %dl,(%rax)
ffff800000110789:	08 08                	or     %cl,(%rax)
ffff80000011078b:	04 04                	add    $0x4,%al
ffff80000011078d:	04 02                	add    $0x2,%al
ffff80000011078f:	02 00                	add    (%rax),%al
ffff800000110791:	7c 04                	jl     ffff800000110797 <interrupt+0x697>
ffff800000110793:	04 04                	add    $0x4,%al
ffff800000110795:	04 04                	add    $0x4,%al
ffff800000110797:	04 04                	add    $0x4,%al
ffff800000110799:	04 04                	add    $0x4,%al
ffff80000011079b:	04 04                	add    $0x4,%al
ffff80000011079d:	04 7c                	add    $0x7c,%al
ffff80000011079f:	00 00                	add    %al,(%rax)
ffff8000001107a1:	10 28                	adc    %ch,(%rax)
ffff8000001107a3:	44 82                	rex.R (bad) 
	...
ffff8000001107bd:	00 fe                	add    %bh,%dh
ffff8000001107bf:	00 10                	add    %dl,(%rax)
ffff8000001107c1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff8000001107d4:	00 70 08             	add    %dh,0x8(%rax)
ffff8000001107d7:	04 3c                	add    $0x3c,%al
ffff8000001107d9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff8000001107e0:	c0 
ffff8000001107e1:	40                   	rex
ffff8000001107e2:	40                   	rex
ffff8000001107e3:	40                   	rex
ffff8000001107e4:	40 58                	rex pop %rax
ffff8000001107e6:	64 42                	fs rex.X
ffff8000001107e8:	42                   	rex.X
ffff8000001107e9:	42                   	rex.X
ffff8000001107ea:	42                   	rex.X
ffff8000001107eb:	42                   	rex.X
ffff8000001107ec:	64 58                	fs pop %rax
ffff8000001107ee:	00 00                	add    %al,(%rax)
ffff8000001107f0:	00 00                	add    %al,(%rax)
ffff8000001107f2:	00 00                	add    %al,(%rax)
ffff8000001107f4:	00 30                	add    %dh,(%rax)
ffff8000001107f6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff8000001107fd:	38 
ffff8000001107fe:	00 00                	add    %al,(%rax)
ffff800000110800:	0c 04                	or     $0x4,%al
ffff800000110802:	04 04                	add    $0x4,%al
ffff800000110804:	04 34                	add    $0x34,%al
ffff800000110806:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000011080d:	36 
ffff80000011080e:	00 00                	add    %al,(%rax)
ffff800000110810:	00 00                	add    %al,(%rax)
ffff800000110812:	00 00                	add    %al,(%rax)
ffff800000110814:	00 38                	add    %bh,(%rax)
ffff800000110816:	44 82                	rex.R (bad) 
ffff800000110818:	82                   	(bad)  
ffff800000110819:	fc                   	cld    
ffff80000011081a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff800000110821:	10 10                	adc    %dl,(%rax)
ffff800000110823:	10 10                	adc    %dl,(%rax)
ffff800000110825:	7c 10                	jl     ffff800000110837 <interrupt+0x737>
ffff800000110827:	10 10                	adc    %dl,(%rax)
ffff800000110829:	10 10                	adc    %dl,(%rax)
ffff80000011082b:	10 10                	adc    %dl,(%rax)
ffff80000011082d:	7c 00                	jl     ffff80000011082f <interrupt+0x72f>
ffff80000011082f:	00 00                	add    %al,(%rax)
ffff800000110831:	00 00                	add    %al,(%rax)
ffff800000110833:	00 00                	add    %al,(%rax)
ffff800000110835:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000011083c:	34 04 
ffff80000011083e:	04 38                	add    $0x38,%al
ffff800000110840:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff800000110844:	40 58                	rex pop %rax
ffff800000110846:	64 42                	fs rex.X
ffff800000110848:	42                   	rex.X
ffff800000110849:	42                   	rex.X
ffff80000011084a:	42                   	rex.X
ffff80000011084b:	42                   	rex.X
ffff80000011084c:	42 e3 00             	rex.X jrcxz ffff80000011084f <interrupt+0x74f>
ffff80000011084f:	00 00                	add    %al,(%rax)
ffff800000110851:	10 10                	adc    %dl,(%rax)
ffff800000110853:	00 00                	add    %al,(%rax)
ffff800000110855:	30 10                	xor    %dl,(%rax)
ffff800000110857:	10 10                	adc    %dl,(%rax)
ffff800000110859:	10 10                	adc    %dl,(%rax)
ffff80000011085b:	10 10                	adc    %dl,(%rax)
ffff80000011085d:	38 00                	cmp    %al,(%rax)
ffff80000011085f:	00 00                	add    %al,(%rax)
ffff800000110861:	04 04                	add    $0x4,%al
ffff800000110863:	00 00                	add    %al,(%rax)
ffff800000110865:	0c 04                	or     $0x4,%al
ffff800000110867:	04 04                	add    $0x4,%al
ffff800000110869:	04 04                	add    $0x4,%al
ffff80000011086b:	04 04                	add    $0x4,%al
ffff80000011086d:	08 08                	or     %cl,(%rax)
ffff80000011086f:	30 c0                	xor    %al,%al
ffff800000110871:	40                   	rex
ffff800000110872:	40                   	rex
ffff800000110873:	40                   	rex
ffff800000110874:	40                   	rex
ffff800000110875:	4e                   	rex.WRX
ffff800000110876:	44                   	rex.R
ffff800000110877:	48 50                	rex.W push %rax
ffff800000110879:	60                   	(bad)  
ffff80000011087a:	50                   	push   %rax
ffff80000011087b:	48                   	rex.W
ffff80000011087c:	44 e6 00             	rex.R out %al,$0x0
ffff80000011087f:	00 30                	add    %dh,(%rax)
ffff800000110881:	10 10                	adc    %dl,(%rax)
ffff800000110883:	10 10                	adc    %dl,(%rax)
ffff800000110885:	10 10                	adc    %dl,(%rax)
ffff800000110887:	10 10                	adc    %dl,(%rax)
ffff800000110889:	10 10                	adc    %dl,(%rax)
ffff80000011088b:	10 10                	adc    %dl,(%rax)
ffff80000011088d:	38 00                	cmp    %al,(%rax)
ffff80000011088f:	00 00                	add    %al,(%rax)
ffff800000110891:	00 00                	add    %al,(%rax)
ffff800000110893:	00 00                	add    %al,(%rax)
ffff800000110895:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff800000110899:	49                   	rex.WB
ffff80000011089a:	49                   	rex.WB
ffff80000011089b:	49                   	rex.WB
ffff80000011089c:	49 db 00             	rex.WB fildl (%r8)
ffff80000011089f:	00 00                	add    %al,(%rax)
ffff8000001108a1:	00 00                	add    %al,(%rax)
ffff8000001108a3:	00 00                	add    %al,(%rax)
ffff8000001108a5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff8000001108a9:	42                   	rex.X
ffff8000001108aa:	42                   	rex.X
ffff8000001108ab:	42                   	rex.X
ffff8000001108ac:	42 e3 00             	rex.X jrcxz ffff8000001108af <interrupt+0x7af>
ffff8000001108af:	00 00                	add    %al,(%rax)
ffff8000001108b1:	00 00                	add    %al,(%rax)
ffff8000001108b3:	00 00                	add    %al,(%rax)
ffff8000001108b5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff8000001108b9:	82                   	(bad)  
ffff8000001108ba:	82                   	(bad)  
ffff8000001108bb:	82                   	(bad)  
ffff8000001108bc:	44 38 00             	cmp    %r8b,(%rax)
ffff8000001108bf:	00 00                	add    %al,(%rax)
ffff8000001108c1:	00 00                	add    %al,(%rax)
ffff8000001108c3:	00 d8                	add    %bl,%al
ffff8000001108c5:	64 42                	fs rex.X
ffff8000001108c7:	42                   	rex.X
ffff8000001108c8:	42                   	rex.X
ffff8000001108c9:	42                   	rex.X
ffff8000001108ca:	42                   	rex.X
ffff8000001108cb:	64 58                	fs pop %rax
ffff8000001108cd:	40                   	rex
ffff8000001108ce:	40 e0 00             	rex loopne ffff8000001108d1 <interrupt+0x7d1>
ffff8000001108d1:	00 00                	add    %al,(%rax)
ffff8000001108d3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff8000001108d6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff8000001108dd:	04 04                	add    $0x4,%al
ffff8000001108df:	0e                   	(bad)  
ffff8000001108e0:	00 00                	add    %al,(%rax)
ffff8000001108e2:	00 00                	add    %al,(%rax)
ffff8000001108e4:	00 dc                	add    %bl,%ah
ffff8000001108e6:	62 42                	(bad)  
ffff8000001108e8:	40                   	rex
ffff8000001108e9:	40                   	rex
ffff8000001108ea:	40                   	rex
ffff8000001108eb:	40                   	rex
ffff8000001108ec:	40 e0 00             	rex loopne ffff8000001108ef <interrupt+0x7ef>
ffff8000001108ef:	00 00                	add    %al,(%rax)
ffff8000001108f1:	00 00                	add    %al,(%rax)
ffff8000001108f3:	00 00                	add    %al,(%rax)
ffff8000001108f5:	7a 86                	jp     ffff80000011087d <interrupt+0x77d>
ffff8000001108f7:	82                   	(bad)  
ffff8000001108f8:	c0 38 06             	sarb   $0x6,(%rax)
ffff8000001108fb:	82                   	(bad)  
ffff8000001108fc:	c2 bc 00             	retq   $0xbc
ffff8000001108ff:	00 00                	add    %al,(%rax)
ffff800000110901:	00 10                	add    %dl,(%rax)
ffff800000110903:	10 10                	adc    %dl,(%rax)
ffff800000110905:	7c 10                	jl     ffff800000110917 <interrupt+0x817>
ffff800000110907:	10 10                	adc    %dl,(%rax)
ffff800000110909:	10 10                	adc    %dl,(%rax)
ffff80000011090b:	10 10                	adc    %dl,(%rax)
ffff80000011090d:	0e                   	(bad)  
ffff80000011090e:	00 00                	add    %al,(%rax)
ffff800000110910:	00 00                	add    %al,(%rax)
ffff800000110912:	00 00                	add    %al,(%rax)
ffff800000110914:	00 c6                	add    %al,%dh
ffff800000110916:	42                   	rex.X
ffff800000110917:	42                   	rex.X
ffff800000110918:	42                   	rex.X
ffff800000110919:	42                   	rex.X
ffff80000011091a:	42                   	rex.X
ffff80000011091b:	42                   	rex.X
ffff80000011091c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000011091f:	00 00                	add    %al,(%rax)
ffff800000110921:	00 00                	add    %al,(%rax)
ffff800000110923:	00 00                	add    %al,(%rax)
ffff800000110925:	e7 42                	out    %eax,$0x42
ffff800000110927:	42                   	rex.X
ffff800000110928:	42 24 24             	rex.X and $0x24,%al
ffff80000011092b:	24 18                	and    $0x18,%al
ffff80000011092d:	18 00                	sbb    %al,(%rax)
ffff80000011092f:	00 00                	add    %al,(%rax)
ffff800000110931:	00 00                	add    %al,(%rax)
ffff800000110933:	00 00                	add    %al,(%rax)
ffff800000110935:	e7 42                	out    %eax,$0x42
ffff800000110937:	42 5a                	rex.X pop %rdx
ffff800000110939:	5a                   	pop    %rdx
ffff80000011093a:	5a                   	pop    %rdx
ffff80000011093b:	24 24                	and    $0x24,%al
ffff80000011093d:	24 00                	and    $0x0,%al
ffff80000011093f:	00 00                	add    %al,(%rax)
ffff800000110941:	00 00                	add    %al,(%rax)
ffff800000110943:	00 00                	add    %al,(%rax)
ffff800000110945:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000011094a:	28 28                	sub    %ch,(%rax)
ffff80000011094c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff800000110950:	00 00                	add    %al,(%rax)
ffff800000110952:	00 00                	add    %al,(%rax)
ffff800000110954:	00 e7                	add    %ah,%bh
ffff800000110956:	42                   	rex.X
ffff800000110957:	42 24 24             	rex.X and $0x24,%al
ffff80000011095a:	24 18                	and    $0x18,%al
ffff80000011095c:	18 10                	sbb    %dl,(%rax)
ffff80000011095e:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000110961:	00 00                	add    %al,(%rax)
ffff800000110963:	00 00                	add    %al,(%rax)
ffff800000110965:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000011096b:	42 82                	rex.X (bad) 
ffff80000011096d:	fe 00                	incb   (%rax)
ffff80000011096f:	00 00                	add    %al,(%rax)
ffff800000110971:	06                   	(bad)  
ffff800000110972:	08 10                	or     %dl,(%rax)
ffff800000110974:	10 10                	adc    %dl,(%rax)
ffff800000110976:	10 60 10             	adc    %ah,0x10(%rax)
ffff800000110979:	10 10                	adc    %dl,(%rax)
ffff80000011097b:	10 08                	adc    %cl,(%rax)
ffff80000011097d:	06                   	(bad)  
ffff80000011097e:	00 00                	add    %al,(%rax)
ffff800000110980:	10 10                	adc    %dl,(%rax)
ffff800000110982:	10 10                	adc    %dl,(%rax)
ffff800000110984:	10 10                	adc    %dl,(%rax)
ffff800000110986:	10 10                	adc    %dl,(%rax)
ffff800000110988:	10 10                	adc    %dl,(%rax)
ffff80000011098a:	10 10                	adc    %dl,(%rax)
ffff80000011098c:	10 10                	adc    %dl,(%rax)
ffff80000011098e:	10 10                	adc    %dl,(%rax)
ffff800000110990:	00 60 10             	add    %ah,0x10(%rax)
ffff800000110993:	08 08                	or     %cl,(%rax)
ffff800000110995:	08 08                	or     %cl,(%rax)
ffff800000110997:	06                   	(bad)  
ffff800000110998:	08 08                	or     %cl,(%rax)
ffff80000011099a:	08 08                	or     %cl,(%rax)
ffff80000011099c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000011099f:	00 00                	add    %al,(%rax)
ffff8000001109a1:	72 8c                	jb     ffff80000011092f <interrupt+0x82f>
	...
ffff8000001111bf:	00 00                	add    %al,(%rax)
ffff8000001111c1:	00 12                	add    %dl,(%rdx)
ffff8000001111c3:	00 00                	add    %al,(%rax)
ffff8000001111c5:	80 ff ff             	cmp    $0xff,%bh
	...
ffff8000001111d0:	00 00                	add    %al,(%rax)
ffff8000001111d2:	12 00                	adc    (%rax),%al
ffff8000001111d4:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff8000001111da:	00 00                	add    %al,(%rax)
ffff8000001111dc:	00 00                	add    %al,(%rax)
ffff8000001111de:	00 00                	add    %al,(%rax)
ffff8000001111e0:	10 00                	adc    %al,(%rax)
	...
ffff8000001111fe:	00 00                	add    %al,(%rax)
ffff800000111200:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff800000111206:	ff                   	(bad)  
ffff800000111207:	ff 00                	incl   (%rax)
	...
ffff800000111245:	00 12                	add    %dl,(%rdx)
ffff800000111247:	00 00                	add    %al,(%rax)
ffff800000111249:	80 ff ff             	cmp    $0xff,%bh
ffff80000011124c:	00 00                	add    %al,(%rax)
ffff80000011124e:	12 00                	adc    (%rax),%al
ffff800000111250:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111256:	12 00                	adc    (%rax),%al
ffff800000111258:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011125e:	00 00                	add    %al,(%rax)
ffff800000111260:	00 00                	add    %al,(%rax)
ffff800000111262:	00 00                	add    %al,(%rax)
ffff800000111264:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111268:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011126e:	00 00                	add    %al,(%rax)
ffff800000111270:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111276:	00 00                	add    %al,(%rax)
ffff800000111278:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011127e:	00 00                	add    %al,(%rax)
ffff800000111280:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111286:	00 00                	add    %al,(%rax)
ffff800000111288:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011128e:	00 00                	add    %al,(%rax)
ffff800000111290:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111296:	00 00                	add    %al,(%rax)
ffff800000111298:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001112ae:	12 00                	adc    (%rax),%al
ffff8000001112b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001112b6:	12 00                	adc    (%rax),%al
ffff8000001112b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001112be:	12 00                	adc    (%rax),%al
ffff8000001112c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001112c6:	00 00                	add    %al,(%rax)
ffff8000001112c8:	00 00                	add    %al,(%rax)
ffff8000001112ca:	00 00                	add    %al,(%rax)
ffff8000001112cc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001112d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112d6:	00 00                	add    %al,(%rax)
ffff8000001112d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112de:	00 00                	add    %al,(%rax)
ffff8000001112e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112e6:	00 00                	add    %al,(%rax)
ffff8000001112e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112ee:	00 00                	add    %al,(%rax)
ffff8000001112f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112f6:	00 00                	add    %al,(%rax)
ffff8000001112f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112fe:	00 00                	add    %al,(%rax)
ffff800000111300:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111316:	12 00                	adc    (%rax),%al
ffff800000111318:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011131e:	12 00                	adc    (%rax),%al
ffff800000111320:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111326:	12 00                	adc    (%rax),%al
ffff800000111328:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011132e:	00 00                	add    %al,(%rax)
ffff800000111330:	00 00                	add    %al,(%rax)
ffff800000111332:	00 00                	add    %al,(%rax)
ffff800000111334:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111338:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011133e:	00 00                	add    %al,(%rax)
ffff800000111340:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111346:	00 00                	add    %al,(%rax)
ffff800000111348:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011134e:	00 00                	add    %al,(%rax)
ffff800000111350:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111356:	00 00                	add    %al,(%rax)
ffff800000111358:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011135e:	00 00                	add    %al,(%rax)
ffff800000111360:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111366:	00 00                	add    %al,(%rax)
ffff800000111368:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011137e:	12 00                	adc    (%rax),%al
ffff800000111380:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111386:	12 00                	adc    (%rax),%al
ffff800000111388:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011138e:	12 00                	adc    (%rax),%al
ffff800000111390:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111396:	00 00                	add    %al,(%rax)
ffff800000111398:	00 00                	add    %al,(%rax)
ffff80000011139a:	00 00                	add    %al,(%rax)
ffff80000011139c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001113a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001113a6:	00 00                	add    %al,(%rax)
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
ffff8000001113d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001113e6:	12 00                	adc    (%rax),%al
ffff8000001113e8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113ee:	12 00                	adc    (%rax),%al
ffff8000001113f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113f6:	12 00                	adc    (%rax),%al
ffff8000001113f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113fe:	00 00                	add    %al,(%rax)
ffff800000111400:	00 00                	add    %al,(%rax)
ffff800000111402:	00 00                	add    %al,(%rax)
ffff800000111404:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111408:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011140e:	00 00                	add    %al,(%rax)
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
ffff800000111438:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011144e:	12 00                	adc    (%rax),%al
ffff800000111450:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111456:	12 00                	adc    (%rax),%al
ffff800000111458:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011145e:	12 00                	adc    (%rax),%al
ffff800000111460:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111466:	00 00                	add    %al,(%rax)
ffff800000111468:	00 00                	add    %al,(%rax)
ffff80000011146a:	00 00                	add    %al,(%rax)
ffff80000011146c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111470:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111476:	00 00                	add    %al,(%rax)
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
ffff8000001114a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001114b6:	12 00                	adc    (%rax),%al
ffff8000001114b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114be:	12 00                	adc    (%rax),%al
ffff8000001114c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114c6:	12 00                	adc    (%rax),%al
ffff8000001114c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114ce:	00 00                	add    %al,(%rax)
ffff8000001114d0:	00 00                	add    %al,(%rax)
ffff8000001114d2:	00 00                	add    %al,(%rax)
ffff8000001114d4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001114d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114de:	00 00                	add    %al,(%rax)
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
ffff800000111508:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011151e:	12 00                	adc    (%rax),%al
ffff800000111520:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111526:	12 00                	adc    (%rax),%al
ffff800000111528:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011152e:	12 00                	adc    (%rax),%al
ffff800000111530:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111536:	00 00                	add    %al,(%rax)
ffff800000111538:	00 00                	add    %al,(%rax)
ffff80000011153a:	00 00                	add    %al,(%rax)
ffff80000011153c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111540:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111546:	00 00                	add    %al,(%rax)
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
ffff800000111570:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011157e:	00 00                	add    %al,(%rax)
ffff800000111580:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff800000111584:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff80000011158a:	10 00                	adc    %al,(%rax)
ffff80000011158c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111592:	10 00                	adc    %al,(%rax)
ffff800000111594:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011159a:	10 00                	adc    %al,(%rax)
ffff80000011159c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115a2:	10 00                	adc    %al,(%rax)
ffff8000001115a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115aa:	10 00                	adc    %al,(%rax)
ffff8000001115ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115b2:	10 00                	adc    %al,(%rax)
ffff8000001115b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115ba:	10 00                	adc    %al,(%rax)
ffff8000001115bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115c2:	10 00                	adc    %al,(%rax)
ffff8000001115c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115ca:	10 00                	adc    %al,(%rax)
ffff8000001115cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115d2:	10 00                	adc    %al,(%rax)
ffff8000001115d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115da:	10 00                	adc    %al,(%rax)
ffff8000001115dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115e2:	10 00                	adc    %al,(%rax)
ffff8000001115e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115ea:	10 00                	adc    %al,(%rax)
ffff8000001115ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115f2:	10 00                	adc    %al,(%rax)
ffff8000001115f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001115fa:	10 00                	adc    %al,(%rax)
ffff8000001115fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111602:	10 00                	adc    %al,(%rax)
ffff800000111604:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011160a:	10 00                	adc    %al,(%rax)
ffff80000011160c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111612:	10 00                	adc    %al,(%rax)
ffff800000111614:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011161a:	10 00                	adc    %al,(%rax)
ffff80000011161c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111622:	10 00                	adc    %al,(%rax)
ffff800000111624:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011162a:	10 00                	adc    %al,(%rax)
ffff80000011162c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111632:	10 00                	adc    %al,(%rax)
ffff800000111634:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011163a:	10 00                	adc    %al,(%rax)
ffff80000011163c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111642:	10 00                	adc    %al,(%rax)
ffff800000111644:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011164a:	10 00                	adc    %al,(%rax)
ffff80000011164c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111652:	10 00                	adc    %al,(%rax)
ffff800000111654:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011165a:	10 00                	adc    %al,(%rax)
ffff80000011165c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111662:	10 00                	adc    %al,(%rax)
ffff800000111664:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011166a:	10 00                	adc    %al,(%rax)
ffff80000011166c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111672:	10 00                	adc    %al,(%rax)
ffff800000111674:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011167a:	10 00                	adc    %al,(%rax)
ffff80000011167c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111682:	10 00                	adc    %al,(%rax)
ffff800000111684:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011168a:	10 00                	adc    %al,(%rax)
ffff80000011168c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111692:	10 00                	adc    %al,(%rax)
ffff800000111694:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000011169a:	10 00                	adc    %al,(%rax)
ffff80000011169c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116a2:	10 00                	adc    %al,(%rax)
ffff8000001116a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116aa:	10 00                	adc    %al,(%rax)
ffff8000001116ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116b2:	10 00                	adc    %al,(%rax)
ffff8000001116b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116ba:	10 00                	adc    %al,(%rax)
ffff8000001116bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff8000001116c2:	10 00                	adc    %al,(%rax)
ffff8000001116c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
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
ffff80000011197c:	00                   	.byte 0x0
ffff80000011197d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff800000111980 <_rodata>:
ffff800000111980:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111981:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111982:	5f                   	pop    %rdi
ffff800000111983:	73 79                	jae    ffff8000001119fe <_rodata+0x7e>
ffff800000111985:	73 74                	jae    ffff8000001119fb <_rodata+0x7b>
ffff800000111987:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000111989:	5f                   	pop    %rdi
ffff80000011198a:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff80000011198d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011198e:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000111991:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000111994:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111995:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111996:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff80000011199d:	25 23 30 34 78       	and    $0x78343023,%eax
ffff8000001119a2:	0a 00                	or     (%rax),%al
ffff8000001119a4:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001119a5:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff8000001119a7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001119a8:	72 79                	jb     ffff800000111a23 <_rodata+0xa3>
ffff8000001119aa:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff8000001119ad:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
ffff8000001119b4:	74 
ffff8000001119b5:	65 72 72             	gs jb  ffff800000111a2a <_rodata+0xaa>
ffff8000001119b8:	75 70                	jne    ffff800000111a2a <_rodata+0xaa>
ffff8000001119ba:	74 20                	je     ffff8000001119dc <_rodata+0x5c>
ffff8000001119bc:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff8000001119c3:	74 61                	je     ffff800000111a26 <_rodata+0xa6>
ffff8000001119c5:	73 6b                	jae    ffff800000111a32 <_rodata+0xb2>
ffff8000001119c7:	5f                   	pop    %rdi
ffff8000001119c8:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff8000001119cf:	00 30                	add    %dh,(%rax)
ffff8000001119d1:	31 32                	xor    %esi,(%rdx)
ffff8000001119d3:	33 34 35 36 37 38 39 	xor    0x39383736(,%rsi,1),%esi
ffff8000001119da:	41                   	rex.B
ffff8000001119db:	42                   	rex.X
ffff8000001119dc:	43                   	rex.XB
ffff8000001119dd:	44                   	rex.R
ffff8000001119de:	45                   	rex.RB
ffff8000001119df:	46                   	rex.RX
ffff8000001119e0:	47                   	rex.RXB
ffff8000001119e1:	48                   	rex.W
ffff8000001119e2:	49                   	rex.WB
ffff8000001119e3:	4a                   	rex.WX
ffff8000001119e4:	4b                   	rex.WXB
ffff8000001119e5:	4c                   	rex.WR
ffff8000001119e6:	4d                   	rex.WRB
ffff8000001119e7:	4e                   	rex.WRX
ffff8000001119e8:	4f 50                	rex.WRXB push %r8
ffff8000001119ea:	51                   	push   %rcx
ffff8000001119eb:	52                   	push   %rdx
ffff8000001119ec:	53                   	push   %rbx
ffff8000001119ed:	54                   	push   %rsp
ffff8000001119ee:	55                   	push   %rbp
ffff8000001119ef:	56                   	push   %rsi
ffff8000001119f0:	57                   	push   %rdi
ffff8000001119f1:	58                   	pop    %rax
ffff8000001119f2:	59                   	pop    %rcx
ffff8000001119f3:	5a                   	pop    %rdx
ffff8000001119f4:	00 00                	add    %al,(%rax)
ffff8000001119f6:	00 00                	add    %al,(%rax)
ffff8000001119f8:	30 31                	xor    %dh,(%rcx)
ffff8000001119fa:	32 33                	xor    (%rbx),%dh
ffff8000001119fc:	34 35                	xor    $0x35,%al
ffff8000001119fe:	36 37                	ss (bad) 
ffff800000111a00:	38 39                	cmp    %bh,(%rcx)
ffff800000111a02:	61                   	(bad)  
ffff800000111a03:	62 63 64 65 66       	(bad)
ffff800000111a08:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
ffff800000111a0e:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111a0f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111a10:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111a11:	70 71                	jo     ffff800000111a84 <_rodata+0x104>
ffff800000111a13:	72 73                	jb     ffff800000111a88 <_rodata+0x108>
ffff800000111a15:	74 75                	je     ffff800000111a8c <_rodata+0x10c>
ffff800000111a17:	76 77                	jbe    ffff800000111a90 <_rodata+0x110>
ffff800000111a19:	78 79                	js     ffff800000111a94 <_rodata+0x114>
ffff800000111a1b:	7a 00                	jp     ffff800000111a1d <_rodata+0x9d>
ffff800000111a1d:	00 00                	add    %al,(%rax)
ffff800000111a1f:	00 c3                	add    %al,%bl
ffff800000111a21:	4a 10 00             	rex.WX adc %al,(%rax)
ffff800000111a24:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a2a:	10 00                	adc    %al,(%rax)
ffff800000111a2c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a32:	10 00                	adc    %al,(%rax)
ffff800000111a34:	00 80 ff ff c9 4a    	add    %al,0x4ac9ffff(%rax)
ffff800000111a3a:	10 00                	adc    %al,(%rax)
ffff800000111a3c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a42:	10 00                	adc    %al,(%rax)
ffff800000111a44:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a4a:	10 00                	adc    %al,(%rax)
ffff800000111a4c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a52:	10 00                	adc    %al,(%rax)
ffff800000111a54:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a5a:	10 00                	adc    %al,(%rax)
ffff800000111a5c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a62:	10 00                	adc    %al,(%rax)
ffff800000111a64:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a6a:	10 00                	adc    %al,(%rax)
ffff800000111a6c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a72:	10 00                	adc    %al,(%rax)
ffff800000111a74:	00 80 ff ff bd 4a    	add    %al,0x4abdffff(%rax)
ffff800000111a7a:	10 00                	adc    %al,(%rax)
ffff800000111a7c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a82:	10 00                	adc    %al,(%rax)
ffff800000111a84:	00 80 ff ff b7 4a    	add    %al,0x4ab7ffff(%rax)
ffff800000111a8a:	10 00                	adc    %al,(%rax)
ffff800000111a8c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a92:	10 00                	adc    %al,(%rax)
ffff800000111a94:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a9a:	10 00                	adc    %al,(%rax)
ffff800000111a9c:	00 80 ff ff cf 4a    	add    %al,0x4acfffff(%rax)
ffff800000111aa2:	10 00                	adc    %al,(%rax)
ffff800000111aa4:	00 80 ff ff ae 52    	add    %al,0x52aeffff(%rax)
ffff800000111aaa:	10 00                	adc    %al,(%rax)
ffff800000111aac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ab2:	10 00                	adc    %al,(%rax)
ffff800000111ab4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111aba:	10 00                	adc    %al,(%rax)
ffff800000111abc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ac2:	10 00                	adc    %al,(%rax)
ffff800000111ac4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111aca:	10 00                	adc    %al,(%rax)
ffff800000111acc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ad2:	10 00                	adc    %al,(%rax)
ffff800000111ad4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ada:	10 00                	adc    %al,(%rax)
ffff800000111adc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ae2:	10 00                	adc    %al,(%rax)
ffff800000111ae4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111aea:	10 00                	adc    %al,(%rax)
ffff800000111aec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111af2:	10 00                	adc    %al,(%rax)
ffff800000111af4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111afa:	10 00                	adc    %al,(%rax)
ffff800000111afc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b02:	10 00                	adc    %al,(%rax)
ffff800000111b04:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b0a:	10 00                	adc    %al,(%rax)
ffff800000111b0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b12:	10 00                	adc    %al,(%rax)
ffff800000111b14:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b1a:	10 00                	adc    %al,(%rax)
ffff800000111b1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b22:	10 00                	adc    %al,(%rax)
ffff800000111b24:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b2a:	10 00                	adc    %al,(%rax)
ffff800000111b2c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b32:	10 00                	adc    %al,(%rax)
ffff800000111b34:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b3a:	10 00                	adc    %al,(%rax)
ffff800000111b3c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b42:	10 00                	adc    %al,(%rax)
ffff800000111b44:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b4a:	10 00                	adc    %al,(%rax)
ffff800000111b4c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b52:	10 00                	adc    %al,(%rax)
ffff800000111b54:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b5a:	10 00                	adc    %al,(%rax)
ffff800000111b5c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b62:	10 00                	adc    %al,(%rax)
ffff800000111b64:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b6a:	10 00                	adc    %al,(%rax)
ffff800000111b6c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b72:	10 00                	adc    %al,(%rax)
ffff800000111b74:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b7a:	10 00                	adc    %al,(%rax)
ffff800000111b7c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b82:	10 00                	adc    %al,(%rax)
ffff800000111b84:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b8a:	10 00                	adc    %al,(%rax)
ffff800000111b8c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b92:	10 00                	adc    %al,(%rax)
ffff800000111b94:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111b9a:	10 00                	adc    %al,(%rax)
ffff800000111b9c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ba2:	10 00                	adc    %al,(%rax)
ffff800000111ba4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111baa:	10 00                	adc    %al,(%rax)
ffff800000111bac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bb2:	10 00                	adc    %al,(%rax)
ffff800000111bb4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bba:	10 00                	adc    %al,(%rax)
ffff800000111bbc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bc2:	10 00                	adc    %al,(%rax)
ffff800000111bc4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bca:	10 00                	adc    %al,(%rax)
ffff800000111bcc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bd2:	10 00                	adc    %al,(%rax)
ffff800000111bd4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111bda:	10 00                	adc    %al,(%rax)
ffff800000111bdc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111be2:	10 00                	adc    %al,(%rax)
ffff800000111be4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
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
ffff800000111c3c:	00 80 ff ff e7 4f    	add    %al,0x4fe7ffff(%rax)
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
ffff800000111c94:	00 80 ff ff b0 4c    	add    %al,0x4cb0ffff(%rax)
ffff800000111c9a:	10 00                	adc    %al,(%rax)
ffff800000111c9c:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111ca2:	10 00                	adc    %al,(%rax)
ffff800000111ca4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111caa:	10 00                	adc    %al,(%rax)
ffff800000111cac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cb2:	10 00                	adc    %al,(%rax)
ffff800000111cb4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cba:	10 00                	adc    %al,(%rax)
ffff800000111cbc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cc2:	10 00                	adc    %al,(%rax)
ffff800000111cc4:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111cca:	10 00                	adc    %al,(%rax)
ffff800000111ccc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cd2:	10 00                	adc    %al,(%rax)
ffff800000111cd4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cda:	10 00                	adc    %al,(%rax)
ffff800000111cdc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111ce2:	10 00                	adc    %al,(%rax)
ffff800000111ce4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111cea:	10 00                	adc    %al,(%rax)
ffff800000111cec:	00 80 ff ff eb 51    	add    %al,0x51ebffff(%rax)
ffff800000111cf2:	10 00                	adc    %al,(%rax)
ffff800000111cf4:	00 80 ff ff 54 4e    	add    %al,0x4e54ffff(%rax)
ffff800000111cfa:	10 00                	adc    %al,(%rax)
ffff800000111cfc:	00 80 ff ff 54 4f    	add    %al,0x4f54ffff(%rax)
ffff800000111d02:	10 00                	adc    %al,(%rax)
ffff800000111d04:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d0a:	10 00                	adc    %al,(%rax)
ffff800000111d0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d12:	10 00                	adc    %al,(%rax)
ffff800000111d14:	00 80 ff ff 4a 4d    	add    %al,0x4d4affff(%rax)
ffff800000111d1a:	10 00                	adc    %al,(%rax)
ffff800000111d1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d22:	10 00                	adc    %al,(%rax)
ffff800000111d24:	00 80 ff ff eb 50    	add    %al,0x50ebffff(%rax)
ffff800000111d2a:	10 00                	adc    %al,(%rax)
ffff800000111d2c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d32:	10 00                	adc    %al,(%rax)
ffff800000111d34:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d3a:	10 00                	adc    %al,(%rax)
ffff800000111d3c:	00 80 ff ff e3 4f    	add    %al,0x4fe3ffff(%rax)
ffff800000111d42:	10 00                	adc    %al,(%rax)
ffff800000111d44:	00 80 ff ff 64 6f    	add    %al,0x6f64ffff(%rax)
ffff800000111d4a:	5f                   	pop    %rdi
ffff800000111d4b:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
ffff800000111d52:	65 
ffff800000111d53:	72 72                	jb     ffff800000111dc7 <_rodata+0x447>
ffff800000111d55:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111d56:	72 28                	jb     ffff800000111d80 <_rodata+0x400>
ffff800000111d58:	30 29                	xor    %ch,(%rcx)
ffff800000111d5a:	2c 45                	sub    $0x45,%al
ffff800000111d5c:	52                   	push   %rdx
ffff800000111d5d:	52                   	push   %rdx
ffff800000111d5e:	4f 52                	rex.WRXB push %r10
ffff800000111d60:	5f                   	pop    %rdi
ffff800000111d61:	43                   	rex.XB
ffff800000111d62:	4f                   	rex.WRXB
ffff800000111d63:	44                   	rex.R
ffff800000111d64:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424d8e <_ebss+0x382f685e>
ffff800000111d6b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111d6c:	78 2c                	js     ffff800000111d9a <_rodata+0x41a>
ffff800000111d6e:	52                   	push   %rdx
ffff800000111d6f:	53                   	push   %rbx
ffff800000111d70:	50                   	push   %rax
ffff800000111d71:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424d9a <_ebss+0x382f686a>
ffff800000111d77:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111d78:	78 2c                	js     ffff800000111da6 <_rodata+0x426>
ffff800000111d7a:	52                   	push   %rdx
ffff800000111d7b:	49 50                	rex.WB push %r8
ffff800000111d7d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424da6 <_ebss+0x382f6876>
ffff800000111d83:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111d84:	78 0a                	js     ffff800000111d90 <_rodata+0x410>
ffff800000111d86:	00 00                	add    %al,(%rax)
ffff800000111d88:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111d8a:	5f                   	pop    %rdi
ffff800000111d8b:	64 65 62             	fs gs (bad) 
ffff800000111d8e:	75 67                	jne    ffff800000111df7 <_rodata+0x477>
ffff800000111d90:	28 31                	sub    %dh,(%rcx)
ffff800000111d92:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111d99:	5f                   	pop    %rdi
ffff800000111d9a:	43                   	rex.XB
ffff800000111d9b:	4f                   	rex.WRXB
ffff800000111d9c:	44                   	rex.R
ffff800000111d9d:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424dc7 <_ebss+0x382f6897>
ffff800000111da4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111da5:	78 2c                	js     ffff800000111dd3 <_rodata+0x453>
ffff800000111da7:	52                   	push   %rdx
ffff800000111da8:	53                   	push   %rbx
ffff800000111da9:	50                   	push   %rax
ffff800000111daa:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424dd3 <_ebss+0x382f68a3>
ffff800000111db0:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111db1:	78 2c                	js     ffff800000111ddf <_rodata+0x45f>
ffff800000111db3:	52                   	push   %rdx
ffff800000111db4:	49 50                	rex.WB push %r8
ffff800000111db6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ddf <_ebss+0x382f68af>
ffff800000111dbc:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111dbd:	78 0a                	js     ffff800000111dc9 <_rodata+0x449>
ffff800000111dbf:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111dc3:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111dc4:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111dc5:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
ffff800000111dcb:	52                   	push   %rdx
ffff800000111dcc:	52                   	push   %rdx
ffff800000111dcd:	4f 52                	rex.WRXB push %r10
ffff800000111dcf:	5f                   	pop    %rdi
ffff800000111dd0:	43                   	rex.XB
ffff800000111dd1:	4f                   	rex.WRXB
ffff800000111dd2:	44                   	rex.R
ffff800000111dd3:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424dfd <_ebss+0x382f68cd>
ffff800000111dda:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ddb:	78 2c                	js     ffff800000111e09 <_rodata+0x489>
ffff800000111ddd:	52                   	push   %rdx
ffff800000111dde:	53                   	push   %rbx
ffff800000111ddf:	50                   	push   %rax
ffff800000111de0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e09 <_ebss+0x382f68d9>
ffff800000111de6:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111de7:	78 2c                	js     ffff800000111e15 <_rodata+0x495>
ffff800000111de9:	52                   	push   %rdx
ffff800000111dea:	49 50                	rex.WB push %r8
ffff800000111dec:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e15 <_ebss+0x382f68e5>
ffff800000111df2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111df3:	78 0a                	js     ffff800000111dff <_rodata+0x47f>
ffff800000111df5:	00 00                	add    %al,(%rax)
ffff800000111df7:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111dfb:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
ffff800000111e02:	2c 45                	sub    $0x45,%al
ffff800000111e04:	52                   	push   %rdx
ffff800000111e05:	52                   	push   %rdx
ffff800000111e06:	4f 52                	rex.WRXB push %r10
ffff800000111e08:	5f                   	pop    %rdi
ffff800000111e09:	43                   	rex.XB
ffff800000111e0a:	4f                   	rex.WRXB
ffff800000111e0b:	44                   	rex.R
ffff800000111e0c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424e36 <_ebss+0x382f6906>
ffff800000111e13:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e14:	78 2c                	js     ffff800000111e42 <_rodata+0x4c2>
ffff800000111e16:	52                   	push   %rdx
ffff800000111e17:	53                   	push   %rbx
ffff800000111e18:	50                   	push   %rax
ffff800000111e19:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e42 <_ebss+0x382f6912>
ffff800000111e1f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e20:	78 2c                	js     ffff800000111e4e <_rodata+0x4ce>
ffff800000111e22:	52                   	push   %rdx
ffff800000111e23:	49 50                	rex.WB push %r8
ffff800000111e25:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e4e <_ebss+0x382f691e>
ffff800000111e2b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e2c:	78 0a                	js     ffff800000111e38 <_rodata+0x4b8>
ffff800000111e2e:	00 00                	add    %al,(%rax)
ffff800000111e30:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111e32:	5f                   	pop    %rdi
ffff800000111e33:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e34:	76 65                	jbe    ffff800000111e9b <_rodata+0x51b>
ffff800000111e36:	72 66                	jb     ffff800000111e9e <_rodata+0x51e>
ffff800000111e38:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e39:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e3a:	77 28                	ja     ffff800000111e64 <_rodata+0x4e4>
ffff800000111e3c:	34 29                	xor    $0x29,%al
ffff800000111e3e:	2c 45                	sub    $0x45,%al
ffff800000111e40:	52                   	push   %rdx
ffff800000111e41:	52                   	push   %rdx
ffff800000111e42:	4f 52                	rex.WRXB push %r10
ffff800000111e44:	5f                   	pop    %rdi
ffff800000111e45:	43                   	rex.XB
ffff800000111e46:	4f                   	rex.WRXB
ffff800000111e47:	44                   	rex.R
ffff800000111e48:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424e72 <_ebss+0x382f6942>
ffff800000111e4f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e50:	78 2c                	js     ffff800000111e7e <_rodata+0x4fe>
ffff800000111e52:	52                   	push   %rdx
ffff800000111e53:	53                   	push   %rbx
ffff800000111e54:	50                   	push   %rax
ffff800000111e55:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e7e <_ebss+0x382f694e>
ffff800000111e5b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e5c:	78 2c                	js     ffff800000111e8a <_rodata+0x50a>
ffff800000111e5e:	52                   	push   %rdx
ffff800000111e5f:	49 50                	rex.WB push %r8
ffff800000111e61:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e8a <_ebss+0x382f695a>
ffff800000111e67:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e68:	78 0a                	js     ffff800000111e74 <_rodata+0x4f4>
ffff800000111e6a:	00 00                	add    %al,(%rax)
ffff800000111e6c:	00 00                	add    %al,(%rax)
ffff800000111e6e:	00 00                	add    %al,(%rax)
ffff800000111e70:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111e72:	5f                   	pop    %rdi
ffff800000111e73:	62                   	(bad)  
ffff800000111e74:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e75:	75 6e                	jne    ffff800000111ee5 <_rodata+0x565>
ffff800000111e77:	64 73 28             	fs jae ffff800000111ea2 <_rodata+0x522>
ffff800000111e7a:	35 29 2c 45 52       	xor    $0x52452c29,%eax
ffff800000111e7f:	52                   	push   %rdx
ffff800000111e80:	4f 52                	rex.WRXB push %r10
ffff800000111e82:	5f                   	pop    %rdi
ffff800000111e83:	43                   	rex.XB
ffff800000111e84:	4f                   	rex.WRXB
ffff800000111e85:	44                   	rex.R
ffff800000111e86:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424eb0 <_ebss+0x382f6980>
ffff800000111e8d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e8e:	78 2c                	js     ffff800000111ebc <_rodata+0x53c>
ffff800000111e90:	52                   	push   %rdx
ffff800000111e91:	53                   	push   %rbx
ffff800000111e92:	50                   	push   %rax
ffff800000111e93:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ebc <_ebss+0x382f698c>
ffff800000111e99:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e9a:	78 2c                	js     ffff800000111ec8 <_rodata+0x548>
ffff800000111e9c:	52                   	push   %rdx
ffff800000111e9d:	49 50                	rex.WB push %r8
ffff800000111e9f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ec8 <_ebss+0x382f6998>
ffff800000111ea5:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ea6:	78 0a                	js     ffff800000111eb2 <_rodata+0x532>
	...
ffff800000111eb0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111eb2:	5f                   	pop    %rdi
ffff800000111eb3:	75 6e                	jne    ffff800000111f23 <_rodata+0x5a3>
ffff800000111eb5:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
ffff800000111ebc:	5f 
ffff800000111ebd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ebe:	70 63                	jo     ffff800000111f23 <_rodata+0x5a3>
ffff800000111ec0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ec1:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
ffff800000111ec5:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111ecc:	5f                   	pop    %rdi
ffff800000111ecd:	43                   	rex.XB
ffff800000111ece:	4f                   	rex.WRXB
ffff800000111ecf:	44                   	rex.R
ffff800000111ed0:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424efa <_ebss+0x382f69ca>
ffff800000111ed7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ed8:	78 2c                	js     ffff800000111f06 <_rodata+0x586>
ffff800000111eda:	52                   	push   %rdx
ffff800000111edb:	53                   	push   %rbx
ffff800000111edc:	50                   	push   %rax
ffff800000111edd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f06 <_ebss+0x382f69d6>
ffff800000111ee3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ee4:	78 2c                	js     ffff800000111f12 <_rodata+0x592>
ffff800000111ee6:	52                   	push   %rdx
ffff800000111ee7:	49 50                	rex.WB push %r8
ffff800000111ee9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f12 <_ebss+0x382f69e2>
ffff800000111eef:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ef0:	78 0a                	js     ffff800000111efc <_rodata+0x57c>
ffff800000111ef2:	00 00                	add    %al,(%rax)
ffff800000111ef4:	00 00                	add    %al,(%rax)
ffff800000111ef6:	00 00                	add    %al,(%rax)
ffff800000111ef8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111efa:	5f                   	pop    %rdi
ffff800000111efb:	64 65 76 5f          	fs gs jbe ffff800000111f5e <_rodata+0x5de>
ffff800000111eff:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111f00:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f01:	74 5f                	je     ffff800000111f62 <_rodata+0x5e2>
ffff800000111f03:	61                   	(bad)  
ffff800000111f04:	76 61                	jbe    ffff800000111f67 <_rodata+0x5e7>
ffff800000111f06:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
ffff800000111f0d:	37 
ffff800000111f0e:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111f15:	5f                   	pop    %rdi
ffff800000111f16:	43                   	rex.XB
ffff800000111f17:	4f                   	rex.WRXB
ffff800000111f18:	44                   	rex.R
ffff800000111f19:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f43 <_ebss+0x382f6a13>
ffff800000111f20:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f21:	78 2c                	js     ffff800000111f4f <_rodata+0x5cf>
ffff800000111f23:	52                   	push   %rdx
ffff800000111f24:	53                   	push   %rbx
ffff800000111f25:	50                   	push   %rax
ffff800000111f26:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f4f <_ebss+0x382f6a1f>
ffff800000111f2c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f2d:	78 2c                	js     ffff800000111f5b <_rodata+0x5db>
ffff800000111f2f:	52                   	push   %rdx
ffff800000111f30:	49 50                	rex.WB push %r8
ffff800000111f32:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f5b <_ebss+0x382f6a2b>
ffff800000111f38:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f39:	78 0a                	js     ffff800000111f45 <_rodata+0x5c5>
ffff800000111f3b:	00 00                	add    %al,(%rax)
ffff800000111f3d:	00 00                	add    %al,(%rax)
ffff800000111f3f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111f43:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111f45:	75 62                	jne    ffff800000111fa9 <_rodata+0x629>
ffff800000111f47:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f48:	65 5f                	gs pop %rdi
ffff800000111f4a:	66 61                	data16 (bad) 
ffff800000111f4c:	75 6c                	jne    ffff800000111fba <_rodata+0x63a>
ffff800000111f4e:	74 28                	je     ffff800000111f78 <_rodata+0x5f8>
ffff800000111f50:	38 29                	cmp    %ch,(%rcx)
ffff800000111f52:	2c 45                	sub    $0x45,%al
ffff800000111f54:	52                   	push   %rdx
ffff800000111f55:	52                   	push   %rdx
ffff800000111f56:	4f 52                	rex.WRXB push %r10
ffff800000111f58:	5f                   	pop    %rdi
ffff800000111f59:	43                   	rex.XB
ffff800000111f5a:	4f                   	rex.WRXB
ffff800000111f5b:	44                   	rex.R
ffff800000111f5c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f86 <_ebss+0x382f6a56>
ffff800000111f63:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f64:	78 2c                	js     ffff800000111f92 <_rodata+0x612>
ffff800000111f66:	52                   	push   %rdx
ffff800000111f67:	53                   	push   %rbx
ffff800000111f68:	50                   	push   %rax
ffff800000111f69:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f92 <_ebss+0x382f6a62>
ffff800000111f6f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f70:	78 2c                	js     ffff800000111f9e <_rodata+0x61e>
ffff800000111f72:	52                   	push   %rdx
ffff800000111f73:	49 50                	rex.WB push %r8
ffff800000111f75:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f9e <_ebss+0x382f6a6e>
ffff800000111f7b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f7c:	78 0a                	js     ffff800000111f88 <_rodata+0x608>
ffff800000111f7e:	00 00                	add    %al,(%rax)
ffff800000111f80:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111f82:	5f                   	pop    %rdi
ffff800000111f83:	63 6f 70             	movsxd 0x70(%rdi),%ebp
ffff800000111f86:	72 6f                	jb     ffff800000111ff7 <_rodata+0x677>
ffff800000111f88:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff800000111f8b:	73 6f                	jae    ffff800000111ffc <_rodata+0x67c>
ffff800000111f8d:	72 5f                	jb     ffff800000111fee <_rodata+0x66e>
ffff800000111f8f:	73 65                	jae    ffff800000111ff6 <_rodata+0x676>
ffff800000111f91:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111f93:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111f95:	74 5f                	je     ffff800000111ff6 <_rodata+0x676>
ffff800000111f97:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f98:	76 65                	jbe    ffff800000111fff <_rodata+0x67f>
ffff800000111f9a:	72 72                	jb     ffff80000011200e <_rodata+0x68e>
ffff800000111f9c:	75 6e                	jne    ffff80000011200c <_rodata+0x68c>
ffff800000111f9e:	28 39                	sub    %bh,(%rcx)
ffff800000111fa0:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111fa7:	5f                   	pop    %rdi
ffff800000111fa8:	43                   	rex.XB
ffff800000111fa9:	4f                   	rex.WRXB
ffff800000111faa:	44                   	rex.R
ffff800000111fab:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424fd5 <_ebss+0x382f6aa5>
ffff800000111fb2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fb3:	78 2c                	js     ffff800000111fe1 <_rodata+0x661>
ffff800000111fb5:	52                   	push   %rdx
ffff800000111fb6:	53                   	push   %rbx
ffff800000111fb7:	50                   	push   %rax
ffff800000111fb8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424fe1 <_ebss+0x382f6ab1>
ffff800000111fbe:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fbf:	78 2c                	js     ffff800000111fed <_rodata+0x66d>
ffff800000111fc1:	52                   	push   %rdx
ffff800000111fc2:	49 50                	rex.WB push %r8
ffff800000111fc4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424fed <_ebss+0x382f6abd>
ffff800000111fca:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fcb:	78 0a                	js     ffff800000111fd7 <_rodata+0x657>
ffff800000111fcd:	00 00                	add    %al,(%rax)
ffff800000111fcf:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111fd3:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
ffff800000111fda:	5f                   	pop    %rdi
ffff800000111fdb:	54                   	push   %rsp
ffff800000111fdc:	53                   	push   %rbx
ffff800000111fdd:	53                   	push   %rbx
ffff800000111fde:	28 31                	sub    %dh,(%rcx)
ffff800000111fe0:	30 29                	xor    %ch,(%rcx)
ffff800000111fe2:	2c 45                	sub    $0x45,%al
ffff800000111fe4:	52                   	push   %rdx
ffff800000111fe5:	52                   	push   %rdx
ffff800000111fe6:	4f 52                	rex.WRXB push %r10
ffff800000111fe8:	5f                   	pop    %rdi
ffff800000111fe9:	43                   	rex.XB
ffff800000111fea:	4f                   	rex.WRXB
ffff800000111feb:	44                   	rex.R
ffff800000111fec:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425016 <_ebss+0x382f6ae6>
ffff800000111ff3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ff4:	78 2c                	js     ffff800000112022 <_rodata+0x6a2>
ffff800000111ff6:	52                   	push   %rdx
ffff800000111ff7:	53                   	push   %rbx
ffff800000111ff8:	50                   	push   %rax
ffff800000111ff9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425022 <_ebss+0x382f6af2>
ffff800000111fff:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112000:	78 2c                	js     ffff80000011202e <_rodata+0x6ae>
ffff800000112002:	52                   	push   %rdx
ffff800000112003:	49 50                	rex.WB push %r8
ffff800000112005:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842502e <_ebss+0x382f6afe>
ffff80000011200b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011200c:	78 0a                	js     ffff800000112018 <_rodata+0x698>
ffff80000011200e:	00 00                	add    %al,(%rax)
ffff800000112010:	54                   	push   %rsp
ffff800000112011:	68 65 20 65 78       	pushq  $0x78652065
ffff800000112016:	63 65 70             	movsxd 0x70(%rbp),%esp
ffff800000112019:	74 69                	je     ffff800000112084 <_rodata+0x704>
ffff80000011201b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011201c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011201d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff800000112020:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000112023:	72 65                	jb     ffff80000011208a <_rodata+0x70a>
ffff800000112025:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000011202a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff800000112031:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff800000112038:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000011203c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000011203f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112041:	74 20                	je     ffff800000112063 <_rodata+0x6e3>
ffff800000112043:	65 78 74             	gs js  ffff8000001120ba <_rodata+0x73a>
ffff800000112046:	65 72 6e             	gs jb  ffff8000001120b7 <_rodata+0x737>
ffff800000112049:	61                   	(bad)  
ffff80000011204a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011204b:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011204f:	74 68                	je     ffff8000001120b9 <_rodata+0x739>
ffff800000112051:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff800000112055:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112056:	67 72 61             	addr32 jb ffff8000001120ba <_rodata+0x73a>
ffff800000112059:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011205a:	2c 73                	sub    $0x73,%al
ffff80000011205c:	75 63                	jne    ffff8000001120c1 <_rodata+0x741>
ffff80000011205e:	68 20 61 73 20       	pushq  $0x20736120
ffff800000112063:	61                   	(bad)  
ffff800000112064:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112065:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000112068:	74 65                	je     ffff8000001120cf <_rodata+0x74f>
ffff80000011206a:	72 72                	jb     ffff8000001120de <_rodata+0x75e>
ffff80000011206c:	75 70                	jne    ffff8000001120de <_rodata+0x75e>
ffff80000011206e:	74 20                	je     ffff800000112090 <_rodata+0x710>
ffff800000112070:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112071:	72 20                	jb     ffff800000112093 <_rodata+0x713>
ffff800000112073:	61                   	(bad)  
ffff800000112074:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112075:	20 65 61             	and    %ah,0x61(%rbp)
ffff800000112078:	72 6c                	jb     ffff8000001120e6 <_rodata+0x766>
ffff80000011207a:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff800000112081:	65 70 74             	gs jo  ffff8000001120f8 <_rodata+0x778>
ffff800000112084:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000011208b:	00 00                	add    %al,(%rax)
ffff80000011208d:	00 00                	add    %al,(%rax)
ffff80000011208f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000112092:	66 65 72 73          	data16 gs jb ffff800000112109 <_rodata+0x789>
ffff800000112096:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011209a:	61                   	(bad)  
ffff80000011209b:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000011209e:	74 65                	je     ffff800000112105 <_rodata+0x785>
ffff8000001120a0:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001120a4:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001120a7:	70 74                	jo     ffff80000011211d <_rodata+0x79d>
ffff8000001120a9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001120aa:	72 20                	jb     ffff8000001120cc <_rodata+0x74c>
ffff8000001120ac:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001120b3:	49                   	rex.WB
ffff8000001120b4:	44 54                	rex.R push %rsp
ffff8000001120b6:	3b 0a                	cmp    (%rdx),%ecx
	...
ffff8000001120c0:	52                   	push   %rdx
ffff8000001120c1:	65 66 65 72 73       	gs data16 gs jb ffff800000112139 <_rodata+0x7b9>
ffff8000001120c6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001120ca:	61                   	(bad)  
ffff8000001120cb:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001120cf:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001120d2:	70 74                	jo     ffff800000112148 <_rodata+0x7c8>
ffff8000001120d4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001120d5:	72 20                	jb     ffff8000001120f7 <_rodata+0x777>
ffff8000001120d7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001120de:	47                   	rex.RXB
ffff8000001120df:	44 54                	rex.R push %rsp
ffff8000001120e1:	20 6f 72             	and    %ch,0x72(%rdi)
ffff8000001120e4:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff8000001120e8:	20 63 75             	and    %ah,0x75(%rbx)
ffff8000001120eb:	72 72                	jb     ffff80000011215f <_rodata+0x7df>
ffff8000001120ed:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001120ef:	74 20                	je     ffff800000112111 <_rodata+0x791>
ffff8000001120f1:	4c                   	rex.WR
ffff8000001120f2:	44 54                	rex.R push %rsp
ffff8000001120f4:	3b 0a                	cmp    (%rdx),%ecx
ffff8000001120f6:	00 00                	add    %al,(%rax)
ffff8000001120f8:	52                   	push   %rdx
ffff8000001120f9:	65 66 65 72 73       	gs data16 gs jb ffff800000112171 <_rodata+0x7f1>
ffff8000001120fe:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff800000112102:	61                   	(bad)  
ffff800000112103:	20 73 65             	and    %dh,0x65(%rbx)
ffff800000112106:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112108:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011210a:	74 20                	je     ffff80000011212c <_rodata+0x7ac>
ffff80000011210c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011210d:	72 20                	jb     ffff80000011212f <_rodata+0x7af>
ffff80000011210f:	67 61                	addr32 (bad) 
ffff800000112111:	74 65                	je     ffff800000112178 <_rodata+0x7f8>
ffff800000112113:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000112117:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff80000011211a:	70 74                	jo     ffff800000112190 <_rodata+0x810>
ffff80000011211c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011211d:	72 20                	jb     ffff80000011213f <_rodata+0x7bf>
ffff80000011211f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000112126:	4c                   	rex.WR
ffff800000112127:	44 54                	rex.R push %rsp
ffff800000112129:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011212b:	00 00                	add    %al,(%rax)
ffff80000011212d:	00 00                	add    %al,(%rax)
ffff80000011212f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000112132:	66 65 72 73          	data16 gs jb ffff8000001121a9 <_rodata+0x829>
ffff800000112136:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011213a:	61                   	(bad)  
ffff80000011213b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011213f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000112142:	70 74                	jo     ffff8000001121b8 <_rodata+0x838>
ffff800000112144:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112145:	72 20                	jb     ffff800000112167 <_rodata+0x7e7>
ffff800000112147:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011214e:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000112151:	72 65                	jb     ffff8000001121b8 <_rodata+0x838>
ffff800000112153:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112154:	74 20                	je     ffff800000112176 <_rodata+0x7f6>
ffff800000112156:	47                   	rex.RXB
ffff800000112157:	44 54                	rex.R push %rsp
ffff800000112159:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011215b:	00 00                	add    %al,(%rax)
ffff80000011215d:	00 00                	add    %al,(%rax)
ffff80000011215f:	00 53 65             	add    %dl,0x65(%rbx)
ffff800000112162:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112164:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112166:	74 20                	je     ffff800000112188 <_rodata+0x808>
ffff800000112168:	53                   	push   %rbx
ffff800000112169:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000011216b:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
ffff800000112170:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff800000112173:	64 65 78 3a          	fs gs js ffff8000001121b1 <_rodata+0x831>
ffff800000112177:	25 23 30 31 30       	and    $0x30313023,%eax
ffff80000011217c:	78 0a                	js     ffff800000112188 <_rodata+0x808>
ffff80000011217e:	00 00                	add    %al,(%rax)
ffff800000112180:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112182:	5f                   	pop    %rdi
ffff800000112183:	73 65                	jae    ffff8000001121ea <_rodata+0x86a>
ffff800000112185:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112187:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112189:	74 5f                	je     ffff8000001121ea <_rodata+0x86a>
ffff80000011218b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011218c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011218d:	74 5f                	je     ffff8000001121ee <_rodata+0x86e>
ffff80000011218f:	70 72                	jo     ffff800000112203 <_rodata+0x883>
ffff800000112191:	65 73 65             	gs jae ffff8000001121f9 <_rodata+0x879>
ffff800000112194:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112195:	74 28                	je     ffff8000001121bf <_rodata+0x83f>
ffff800000112197:	31 31                	xor    %esi,(%rcx)
ffff800000112199:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001121a0:	5f                   	pop    %rdi
ffff8000001121a1:	43                   	rex.XB
ffff8000001121a2:	4f                   	rex.WRXB
ffff8000001121a3:	44                   	rex.R
ffff8000001121a4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384251ce <_ebss+0x382f6c9e>
ffff8000001121ab:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001121ac:	78 2c                	js     ffff8000001121da <_rodata+0x85a>
ffff8000001121ae:	52                   	push   %rdx
ffff8000001121af:	53                   	push   %rbx
ffff8000001121b0:	50                   	push   %rax
ffff8000001121b1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384251da <_ebss+0x382f6caa>
ffff8000001121b7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001121b8:	78 2c                	js     ffff8000001121e6 <_rodata+0x866>
ffff8000001121ba:	52                   	push   %rdx
ffff8000001121bb:	49 50                	rex.WB push %r8
ffff8000001121bd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384251e6 <_ebss+0x382f6cb6>
ffff8000001121c3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001121c4:	78 0a                	js     ffff8000001121d0 <_rodata+0x850>
ffff8000001121c6:	00 00                	add    %al,(%rax)
ffff8000001121c8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001121ca:	5f                   	pop    %rdi
ffff8000001121cb:	73 74                	jae    ffff800000112241 <_rodata+0x8c1>
ffff8000001121cd:	61                   	(bad)  
ffff8000001121ce:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
ffff8000001121d1:	73 65                	jae    ffff800000112238 <_rodata+0x8b8>
ffff8000001121d3:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001121d5:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001121d7:	74 5f                	je     ffff800000112238 <_rodata+0x8b8>
ffff8000001121d9:	66 61                	data16 (bad) 
ffff8000001121db:	75 6c                	jne    ffff800000112249 <_rodata+0x8c9>
ffff8000001121dd:	74 28                	je     ffff800000112207 <_rodata+0x887>
ffff8000001121df:	31 32                	xor    %esi,(%rdx)
ffff8000001121e1:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001121e8:	5f                   	pop    %rdi
ffff8000001121e9:	43                   	rex.XB
ffff8000001121ea:	4f                   	rex.WRXB
ffff8000001121eb:	44                   	rex.R
ffff8000001121ec:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425216 <_ebss+0x382f6ce6>
ffff8000001121f3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001121f4:	78 2c                	js     ffff800000112222 <_rodata+0x8a2>
ffff8000001121f6:	52                   	push   %rdx
ffff8000001121f7:	53                   	push   %rbx
ffff8000001121f8:	50                   	push   %rax
ffff8000001121f9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425222 <_ebss+0x382f6cf2>
ffff8000001121ff:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112200:	78 2c                	js     ffff80000011222e <_rodata+0x8ae>
ffff800000112202:	52                   	push   %rdx
ffff800000112203:	49 50                	rex.WB push %r8
ffff800000112205:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842522e <_ebss+0x382f6cfe>
ffff80000011220b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011220c:	78 0a                	js     ffff800000112218 <_rodata+0x898>
ffff80000011220e:	00 00                	add    %al,(%rax)
ffff800000112210:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112212:	5f                   	pop    %rdi
ffff800000112213:	67 65 6e             	outsb  %gs:(%esi),(%dx)
ffff800000112216:	65 72 61             	gs jb  ffff80000011227a <_rodata+0x8fa>
ffff800000112219:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011221a:	5f                   	pop    %rdi
ffff80000011221b:	70 72                	jo     ffff80000011228f <_rodata+0x90f>
ffff80000011221d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011221e:	74 65                	je     ffff800000112285 <_rodata+0x905>
ffff800000112220:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff800000112224:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112225:	28 31                	sub    %dh,(%rcx)
ffff800000112227:	33 29                	xor    (%rcx),%ebp
ffff800000112229:	2c 45                	sub    $0x45,%al
ffff80000011222b:	52                   	push   %rdx
ffff80000011222c:	52                   	push   %rdx
ffff80000011222d:	4f 52                	rex.WRXB push %r10
ffff80000011222f:	5f                   	pop    %rdi
ffff800000112230:	43                   	rex.XB
ffff800000112231:	4f                   	rex.WRXB
ffff800000112232:	44                   	rex.R
ffff800000112233:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842525d <_ebss+0x382f6d2d>
ffff80000011223a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011223b:	78 2c                	js     ffff800000112269 <_rodata+0x8e9>
ffff80000011223d:	52                   	push   %rdx
ffff80000011223e:	53                   	push   %rbx
ffff80000011223f:	50                   	push   %rax
ffff800000112240:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425269 <_ebss+0x382f6d39>
ffff800000112246:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112247:	78 2c                	js     ffff800000112275 <_rodata+0x8f5>
ffff800000112249:	52                   	push   %rdx
ffff80000011224a:	49 50                	rex.WB push %r8
ffff80000011224c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425275 <_ebss+0x382f6d45>
ffff800000112252:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112253:	78 0a                	js     ffff80000011225f <_rodata+0x8df>
ffff800000112255:	00 00                	add    %al,(%rax)
ffff800000112257:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff80000011225b:	70 61                	jo     ffff8000001122be <_rodata+0x93e>
ffff80000011225d:	67 65 5f             	addr32 gs pop %rdi
ffff800000112260:	66 61                	data16 (bad) 
ffff800000112262:	75 6c                	jne    ffff8000001122d0 <_rodata+0x950>
ffff800000112264:	74 28                	je     ffff80000011228e <_rodata+0x90e>
ffff800000112266:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
ffff800000112269:	2c 45                	sub    $0x45,%al
ffff80000011226b:	52                   	push   %rdx
ffff80000011226c:	52                   	push   %rdx
ffff80000011226d:	4f 52                	rex.WRXB push %r10
ffff80000011226f:	5f                   	pop    %rdi
ffff800000112270:	43                   	rex.XB
ffff800000112271:	4f                   	rex.WRXB
ffff800000112272:	44                   	rex.R
ffff800000112273:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842529d <_ebss+0x382f6d6d>
ffff80000011227a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011227b:	78 2c                	js     ffff8000001122a9 <_rodata+0x929>
ffff80000011227d:	52                   	push   %rdx
ffff80000011227e:	53                   	push   %rbx
ffff80000011227f:	50                   	push   %rax
ffff800000112280:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384252a9 <_ebss+0x382f6d79>
ffff800000112286:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112287:	78 2c                	js     ffff8000001122b5 <_rodata+0x935>
ffff800000112289:	52                   	push   %rdx
ffff80000011228a:	49 50                	rex.WB push %r8
ffff80000011228c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384252b5 <_ebss+0x382f6d85>
ffff800000112292:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112293:	78 0a                	js     ffff80000011229f <_rodata+0x91f>
ffff800000112295:	00 50 61             	add    %dl,0x61(%rax)
ffff800000112298:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000011229d:	74 2d                	je     ffff8000001122cc <_rodata+0x94c>
ffff80000011229f:	50                   	push   %rax
ffff8000001122a0:	72 65                	jb     ffff800000112307 <_rodata+0x987>
ffff8000001122a2:	73 65                	jae    ffff800000112309 <_rodata+0x989>
ffff8000001122a4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001122a5:	74 2c                	je     ffff8000001122d3 <_rodata+0x953>
ffff8000001122a7:	09 00                	or     %eax,(%rax)
ffff8000001122a9:	57                   	push   %rdi
ffff8000001122aa:	72 69                	jb     ffff800000112315 <_rodata+0x995>
ffff8000001122ac:	74 65                	je     ffff800000112313 <_rodata+0x993>
ffff8000001122ae:	20 43 61             	and    %al,0x61(%rbx)
ffff8000001122b1:	75 73                	jne    ffff800000112326 <_rodata+0x9a6>
ffff8000001122b3:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001122b7:	75 6c                	jne    ffff800000112325 <_rodata+0x9a5>
ffff8000001122b9:	74 2c                	je     ffff8000001122e7 <_rodata+0x967>
ffff8000001122bb:	09 00                	or     %eax,(%rax)
ffff8000001122bd:	52                   	push   %rdx
ffff8000001122be:	65 61                	gs (bad) 
ffff8000001122c0:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff8000001122c4:	75 73                	jne    ffff800000112339 <_rodata+0x9b9>
ffff8000001122c6:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001122ca:	75 6c                	jne    ffff800000112338 <_rodata+0x9b8>
ffff8000001122cc:	74 2c                	je     ffff8000001122fa <_rodata+0x97a>
ffff8000001122ce:	09 00                	or     %eax,(%rax)
ffff8000001122d0:	46 61                	rex.RX (bad) 
ffff8000001122d2:	75 6c                	jne    ffff800000112340 <_rodata+0x9c0>
ffff8000001122d4:	74 20                	je     ffff8000001122f6 <_rodata+0x976>
ffff8000001122d6:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff8000001122dd:	28 33                	sub    %dh,(%rbx)
ffff8000001122df:	29 09                	sub    %ecx,(%rcx)
ffff8000001122e1:	00 46 61             	add    %al,0x61(%rsi)
ffff8000001122e4:	75 6c                	jne    ffff800000112352 <_rodata+0x9d2>
ffff8000001122e6:	74 20                	je     ffff800000112308 <_rodata+0x988>
ffff8000001122e8:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff8000001122ef:	72 76                	jb     ffff800000112367 <_rodata+0x9e7>
ffff8000001122f1:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff8000001122f8:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff8000001122fb:	29 09                	sub    %ecx,(%rcx)
ffff8000001122fd:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
ffff800000112300:	65 73 65             	gs jae ffff800000112368 <_rodata+0x9e8>
ffff800000112303:	72 76                	jb     ffff80000011237b <_rodata+0x9fb>
ffff800000112305:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000011230a:	74 20                	je     ffff80000011232c <_rodata+0x9ac>
ffff80000011230c:	43 61                	rex.XB (bad) 
ffff80000011230e:	75 73                	jne    ffff800000112383 <_rodata+0xa03>
ffff800000112310:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000112314:	75 6c                	jne    ffff800000112382 <_rodata+0xa02>
ffff800000112316:	74 09                	je     ffff800000112321 <_rodata+0x9a1>
	...
ffff800000112320:	2c 49                	sub    $0x49,%al
ffff800000112322:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112323:	73 74                	jae    ffff800000112399 <_rodata+0xa19>
ffff800000112325:	72 75                	jb     ffff80000011239c <_rodata+0xa1c>
ffff800000112327:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff80000011232b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011232c:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000011232f:	74 63                	je     ffff800000112394 <_rodata+0xa14>
ffff800000112331:	68 20 43 61 75       	pushq  $0x75614320
ffff800000112336:	73 65                	jae    ffff80000011239d <_rodata+0xa1d>
ffff800000112338:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011233b:	75 6c                	jne    ffff8000001123a9 <_rodata+0xa29>
ffff80000011233d:	74 00                	je     ffff80000011233f <_rodata+0x9bf>
ffff80000011233f:	0a 00                	or     (%rax),%al
ffff800000112341:	43 52                	rex.XB push %r10
ffff800000112343:	32 3a                	xor    (%rdx),%bh
ffff800000112345:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011234a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011234b:	78 0a                	js     ffff800000112357 <_rodata+0x9d7>
ffff80000011234d:	00 00                	add    %al,(%rax)
ffff80000011234f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112353:	78 38                	js     ffff80000011238d <_rodata+0xa0d>
ffff800000112355:	37                   	(bad)  
ffff800000112356:	5f                   	pop    %rdi
ffff800000112357:	46 50                	rex.RX push %rax
ffff800000112359:	55                   	push   %rbp
ffff80000011235a:	5f                   	pop    %rdi
ffff80000011235b:	65 72 72             	gs jb  ffff8000001123d0 <_rodata+0xa50>
ffff80000011235e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011235f:	72 28                	jb     ffff800000112389 <_rodata+0xa09>
ffff800000112361:	31 36                	xor    %esi,(%rsi)
ffff800000112363:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011236a:	5f                   	pop    %rdi
ffff80000011236b:	43                   	rex.XB
ffff80000011236c:	4f                   	rex.WRXB
ffff80000011236d:	44                   	rex.R
ffff80000011236e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425398 <_ebss+0x382f6e68>
ffff800000112375:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112376:	78 2c                	js     ffff8000001123a4 <_rodata+0xa24>
ffff800000112378:	52                   	push   %rdx
ffff800000112379:	53                   	push   %rbx
ffff80000011237a:	50                   	push   %rax
ffff80000011237b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253a4 <_ebss+0x382f6e74>
ffff800000112381:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112382:	78 2c                	js     ffff8000001123b0 <_rodata+0xa30>
ffff800000112384:	52                   	push   %rdx
ffff800000112385:	49 50                	rex.WB push %r8
ffff800000112387:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253b0 <_ebss+0x382f6e80>
ffff80000011238d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011238e:	78 0a                	js     ffff80000011239a <_rodata+0xa1a>
	...
ffff800000112398:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011239a:	5f                   	pop    %rdi
ffff80000011239b:	61                   	(bad)  
ffff80000011239c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011239d:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff8000001123a4:	5f                   	pop    %rdi
ffff8000001123a5:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff8000001123a8:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff8000001123ab:	31 37                	xor    %esi,(%rdi)
ffff8000001123ad:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001123b4:	5f                   	pop    %rdi
ffff8000001123b5:	43                   	rex.XB
ffff8000001123b6:	4f                   	rex.WRXB
ffff8000001123b7:	44                   	rex.R
ffff8000001123b8:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384253e2 <_ebss+0x382f6eb2>
ffff8000001123bf:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123c0:	78 2c                	js     ffff8000001123ee <_rodata+0xa6e>
ffff8000001123c2:	52                   	push   %rdx
ffff8000001123c3:	53                   	push   %rbx
ffff8000001123c4:	50                   	push   %rax
ffff8000001123c5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253ee <_ebss+0x382f6ebe>
ffff8000001123cb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123cc:	78 2c                	js     ffff8000001123fa <_rodata+0xa7a>
ffff8000001123ce:	52                   	push   %rdx
ffff8000001123cf:	49 50                	rex.WB push %r8
ffff8000001123d1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384253fa <_ebss+0x382f6eca>
ffff8000001123d7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123d8:	78 0a                	js     ffff8000001123e4 <_rodata+0xa64>
ffff8000001123da:	00 00                	add    %al,(%rax)
ffff8000001123dc:	00 00                	add    %al,(%rax)
ffff8000001123de:	00 00                	add    %al,(%rax)
ffff8000001123e0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001123e2:	5f                   	pop    %rdi
ffff8000001123e3:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001123e4:	61                   	(bad)  
ffff8000001123e5:	63 68 69             	movsxd 0x69(%rax),%ebp
ffff8000001123e8:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001123e9:	65 5f                	gs pop %rdi
ffff8000001123eb:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff8000001123ee:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff8000001123f1:	31 38                	xor    %edi,(%rax)
ffff8000001123f3:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001123fa:	5f                   	pop    %rdi
ffff8000001123fb:	43                   	rex.XB
ffff8000001123fc:	4f                   	rex.WRXB
ffff8000001123fd:	44                   	rex.R
ffff8000001123fe:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425428 <_ebss+0x382f6ef8>
ffff800000112405:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112406:	78 2c                	js     ffff800000112434 <_rodata+0xab4>
ffff800000112408:	52                   	push   %rdx
ffff800000112409:	53                   	push   %rbx
ffff80000011240a:	50                   	push   %rax
ffff80000011240b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425434 <_ebss+0x382f6f04>
ffff800000112411:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112412:	78 2c                	js     ffff800000112440 <_rodata+0xac0>
ffff800000112414:	52                   	push   %rdx
ffff800000112415:	49 50                	rex.WB push %r8
ffff800000112417:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425440 <_ebss+0x382f6f10>
ffff80000011241d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011241e:	78 0a                	js     ffff80000011242a <_rodata+0xaaa>
	...
ffff800000112428:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011242a:	5f                   	pop    %rdi
ffff80000011242b:	53                   	push   %rbx
ffff80000011242c:	49                   	rex.WB
ffff80000011242d:	4d                   	rex.WRB
ffff80000011242e:	44 5f                	rex.R pop %rdi
ffff800000112430:	65 78 63             	gs js  ffff800000112496 <_rodata+0xb16>
ffff800000112433:	65 70 74             	gs jo  ffff8000001124aa <_rodata+0xb2a>
ffff800000112436:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
ffff80000011243d:	2c 45                	sub    $0x45,%al
ffff80000011243f:	52                   	push   %rdx
ffff800000112440:	52                   	push   %rdx
ffff800000112441:	4f 52                	rex.WRXB push %r10
ffff800000112443:	5f                   	pop    %rdi
ffff800000112444:	43                   	rex.XB
ffff800000112445:	4f                   	rex.WRXB
ffff800000112446:	44                   	rex.R
ffff800000112447:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425471 <_ebss+0x382f6f41>
ffff80000011244e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011244f:	78 2c                	js     ffff80000011247d <_rodata+0xafd>
ffff800000112451:	52                   	push   %rdx
ffff800000112452:	53                   	push   %rbx
ffff800000112453:	50                   	push   %rax
ffff800000112454:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842547d <_ebss+0x382f6f4d>
ffff80000011245a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011245b:	78 2c                	js     ffff800000112489 <_rodata+0xb09>
ffff80000011245d:	52                   	push   %rdx
ffff80000011245e:	49 50                	rex.WB push %r8
ffff800000112460:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425489 <_ebss+0x382f6f59>
ffff800000112466:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112467:	78 0a                	js     ffff800000112473 <_rodata+0xaf3>
ffff800000112469:	00 00                	add    %al,(%rax)
ffff80000011246b:	00 00                	add    %al,(%rax)
ffff80000011246d:	00 00                	add    %al,(%rax)
ffff80000011246f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112473:	76 69                	jbe    ffff8000001124de <_rodata+0xb5e>
ffff800000112475:	72 74                	jb     ffff8000001124eb <_rodata+0xb6b>
ffff800000112477:	75 61                	jne    ffff8000001124da <_rodata+0xb5a>
ffff800000112479:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011247a:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff800000112481:	5f                   	pop    %rdi
ffff800000112482:	65 78 63             	gs js  ffff8000001124e8 <_rodata+0xb68>
ffff800000112485:	65 70 74             	gs jo  ffff8000001124fc <_rodata+0xb7c>
ffff800000112488:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
ffff80000011248f:	2c 45                	sub    $0x45,%al
ffff800000112491:	52                   	push   %rdx
ffff800000112492:	52                   	push   %rdx
ffff800000112493:	4f 52                	rex.WRXB push %r10
ffff800000112495:	5f                   	pop    %rdi
ffff800000112496:	43                   	rex.XB
ffff800000112497:	4f                   	rex.WRXB
ffff800000112498:	44                   	rex.R
ffff800000112499:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384254c3 <_ebss+0x382f6f93>
ffff8000001124a0:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124a1:	78 2c                	js     ffff8000001124cf <_rodata+0xb4f>
ffff8000001124a3:	52                   	push   %rdx
ffff8000001124a4:	53                   	push   %rbx
ffff8000001124a5:	50                   	push   %rax
ffff8000001124a6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254cf <_ebss+0x382f6f9f>
ffff8000001124ac:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124ad:	78 2c                	js     ffff8000001124db <_rodata+0xb5b>
ffff8000001124af:	52                   	push   %rdx
ffff8000001124b0:	49 50                	rex.WB push %r8
ffff8000001124b2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254db <_ebss+0x382f6fab>
ffff8000001124b8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124b9:	78 0a                	js     ffff8000001124c5 <_rodata+0xb45>
ffff8000001124bb:	00 00                	add    %al,(%rax)
ffff8000001124bd:	00 00                	add    %al,(%rax)
ffff8000001124bf:	00 44 69 73          	add    %al,0x73(%rcx,%rbp,2)
ffff8000001124c3:	70 6c                	jo     ffff800000112531 <_rodata+0xbb1>
ffff8000001124c5:	61                   	(bad)  
ffff8000001124c6:	79 20                	jns    ffff8000001124e8 <_rodata+0xb68>
ffff8000001124c8:	50                   	push   %rax
ffff8000001124c9:	68 79 73 69 63       	pushq  $0x63697379
ffff8000001124ce:	73 20                	jae    ffff8000001124f0 <_rodata+0xb70>
ffff8000001124d0:	41                   	rex.B
ffff8000001124d1:	64 64 72 65          	fs fs jb ffff80000011253a <_rodata+0xbba>
ffff8000001124d5:	73 73                	jae    ffff80000011254a <_rodata+0xbca>
ffff8000001124d7:	20 4d 41             	and    %cl,0x41(%rbp)
ffff8000001124da:	50                   	push   %rax
ffff8000001124db:	2c 54                	sub    $0x54,%al
ffff8000001124dd:	79 70                	jns    ffff80000011254f <_rodata+0xbcf>
ffff8000001124df:	65 28 31             	sub    %dh,%gs:(%rcx)
ffff8000001124e2:	3a 52 41             	cmp    0x41(%rdx),%dl
ffff8000001124e5:	4d 2c 32             	rex.WRB sub $0x32,%al
ffff8000001124e8:	3a 52 4f             	cmp    0x4f(%rdx),%dl
ffff8000001124eb:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
ffff8000001124ef:	20 52 65             	and    %dl,0x65(%rdx)
ffff8000001124f2:	73 65                	jae    ffff800000112559 <_rodata+0xbd9>
ffff8000001124f4:	72 76                	jb     ffff80000011256c <_rodata+0xbec>
ffff8000001124f6:	65 64 2c 33          	gs fs sub $0x33,%al
ffff8000001124fa:	3a 41 43             	cmp    0x43(%rcx),%al
ffff8000001124fd:	50                   	push   %rax
ffff8000001124fe:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
ffff800000112502:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
ffff800000112506:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112507:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011250a:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011250b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011250c:	72 79                	jb     ffff800000112587 <_rodata+0xc07>
ffff80000011250e:	2c 34                	sub    $0x34,%al
ffff800000112510:	3a 41 43             	cmp    0x43(%rcx),%al
ffff800000112513:	50                   	push   %rax
ffff800000112514:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
ffff800000112518:	53                   	push   %rbx
ffff800000112519:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011251c:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011251d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011251e:	72 79                	jb     ffff800000112599 <_rodata+0xc19>
ffff800000112520:	2c 4f                	sub    $0x4f,%al
ffff800000112522:	74 68                	je     ffff80000011258c <_rodata+0xc0c>
ffff800000112524:	65 72 73             	gs jb  ffff80000011259a <_rodata+0xc1a>
ffff800000112527:	3a 55 6e             	cmp    0x6e(%rbp),%dl
ffff80000011252a:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
ffff800000112531:	0a 
ffff800000112532:	00 00                	add    %al,(%rax)
ffff800000112534:	00 00                	add    %al,(%rax)
ffff800000112536:	00 00                	add    %al,(%rax)
ffff800000112538:	41                   	rex.B
ffff800000112539:	64 64 72 65          	fs fs jb ffff8000001125a2 <_rodata+0xc22>
ffff80000011253d:	73 73                	jae    ffff8000001125b2 <_rodata+0xc32>
ffff80000011253f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425568 <_ebss+0x382f7038>
ffff800000112545:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112546:	78 09                	js     ffff800000112551 <_rodata+0xbd1>
ffff800000112548:	4c                   	rex.WR
ffff800000112549:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011254b:	67 74 68             	addr32 je ffff8000001125b6 <_rodata+0xc36>
ffff80000011254e:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425577 <_ebss+0x382f7047>
ffff800000112554:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112555:	78 09                	js     ffff800000112560 <_rodata+0xbe0>
ffff800000112557:	54                   	push   %rsp
ffff800000112558:	79 70                	jns    ffff8000001125ca <_rodata+0xc4a>
ffff80000011255a:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # ffff800030425584 <_ebss+0x302f7054>
ffff800000112561:	78 0a                	js     ffff80000011256d <_rodata+0xbed>
ffff800000112563:	00 00                	add    %al,(%rax)
ffff800000112565:	00 00                	add    %al,(%rax)
ffff800000112567:	00 4f 53             	add    %cl,0x53(%rdi)
ffff80000011256a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011256d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011256e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000112571:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000112577:	61                   	(bad)  
ffff800000112578:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112579:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000011257c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff8000384255a6 <_ebss+0x382f7076>
ffff800000112583:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112584:	78 0a                	js     ffff800000112590 <_rodata+0xc10>
ffff800000112586:	00 00                	add    %al,(%rax)
ffff800000112588:	4f 53                	rex.WRXB push %r11
ffff80000011258a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011258d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011258e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000112591:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000112597:	61                   	(bad)  
ffff800000112598:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112599:	20 32                	and    %dh,(%rdx)
ffff80000011259b:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
ffff80000011259f:	47                   	rex.RXB
ffff8000001125a0:	45 73 3a             	rex.RB jae ffff8000001125dd <_rodata+0xc5d>
ffff8000001125a3:	25 23 30 31 30       	and    $0x30313023,%eax
ffff8000001125a8:	78 3d                	js     ffff8000001125e7 <_rodata+0xc67>
ffff8000001125aa:	25 30 31 30 64       	and    $0x64303130,%eax
ffff8000001125af:	0a 00                	or     (%rax),%al
ffff8000001125b1:	00 00                	add    %al,(%rax)
ffff8000001125b3:	00 00                	add    %al,(%rax)
ffff8000001125b5:	00 00                	add    %al,(%rax)
ffff8000001125b7:	00 62 69             	add    %ah,0x69(%rdx)
ffff8000001125ba:	74 73                	je     ffff80000011262f <_rodata+0xcaf>
ffff8000001125bc:	5f                   	pop    %rdi
ffff8000001125bd:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001125be:	61                   	(bad)  
ffff8000001125bf:	70 3a                	jo     ffff8000001125fb <_rodata+0xc7b>
ffff8000001125c1:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001125c6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125c7:	78 2c                	js     ffff8000001125f5 <_rodata+0xc75>
ffff8000001125c9:	62                   	(bad)  
ffff8000001125ca:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
ffff8000001125d1:	65 
ffff8000001125d2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384255fb <_ebss+0x382f70cb>
ffff8000001125d8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125d9:	78 2c                	js     ffff800000112607 <_rodata+0xc87>
ffff8000001125db:	62                   	(bad)  
ffff8000001125dc:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
ffff8000001125e3:	67 
ffff8000001125e4:	74 68                	je     ffff80000011264e <_rodata+0xcce>
ffff8000001125e6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842560f <_ebss+0x382f70df>
ffff8000001125ec:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125ed:	78 0a                	js     ffff8000001125f9 <_rodata+0xc79>
ffff8000001125ef:	00 70 61             	add    %dh,0x61(%rax)
ffff8000001125f2:	67 65 73 5f          	addr32 gs jae ffff800000112655 <_rodata+0xcd5>
ffff8000001125f6:	73 74                	jae    ffff80000011266c <_rodata+0xcec>
ffff8000001125f8:	72 75                	jb     ffff80000011266f <_rodata+0xcef>
ffff8000001125fa:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff8000001125fe:	23 30                	and    (%rax),%esi
ffff800000112600:	31 38                	xor    %edi,(%rax)
ffff800000112602:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112603:	78 2c                	js     ffff800000112631 <_rodata+0xcb1>
ffff800000112605:	70 61                	jo     ffff800000112668 <_rodata+0xce8>
ffff800000112607:	67 65 73 5f          	addr32 gs jae ffff80000011266a <_rodata+0xcea>
ffff80000011260b:	73 69                	jae    ffff800000112676 <_rodata+0xcf6>
ffff80000011260d:	7a 65                	jp     ffff800000112674 <_rodata+0xcf4>
ffff80000011260f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425638 <_ebss+0x382f7108>
ffff800000112615:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112616:	78 2c                	js     ffff800000112644 <_rodata+0xcc4>
ffff800000112618:	70 61                	jo     ffff80000011267b <_rodata+0xcfb>
ffff80000011261a:	67 65 73 5f          	addr32 gs jae ffff80000011267d <_rodata+0xcfd>
ffff80000011261e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011261f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112621:	67 74 68             	addr32 je ffff80000011268c <_rodata+0xd0c>
ffff800000112624:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842564d <_ebss+0x382f711d>
ffff80000011262a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011262b:	78 0a                	js     ffff800000112637 <_rodata+0xcb7>
ffff80000011262d:	00 00                	add    %al,(%rax)
ffff80000011262f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000112632:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112633:	65 73 5f             	gs jae ffff800000112695 <_rodata+0xd15>
ffff800000112636:	73 74                	jae    ffff8000001126ac <_rodata+0xd2c>
ffff800000112638:	72 75                	jb     ffff8000001126af <_rodata+0xd2f>
ffff80000011263a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011263e:	23 30                	and    (%rax),%esi
ffff800000112640:	31 38                	xor    %edi,(%rax)
ffff800000112642:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112643:	78 2c                	js     ffff800000112671 <_rodata+0xcf1>
ffff800000112645:	7a 6f                	jp     ffff8000001126b6 <_rodata+0xd36>
ffff800000112647:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112648:	65 73 5f             	gs jae ffff8000001126aa <_rodata+0xd2a>
ffff80000011264b:	73 69                	jae    ffff8000001126b6 <_rodata+0xd36>
ffff80000011264d:	7a 65                	jp     ffff8000001126b4 <_rodata+0xd34>
ffff80000011264f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425678 <_ebss+0x382f7148>
ffff800000112655:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112656:	78 2c                	js     ffff800000112684 <_rodata+0xd04>
ffff800000112658:	7a 6f                	jp     ffff8000001126c9 <_rodata+0xd49>
ffff80000011265a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011265b:	65 73 5f             	gs jae ffff8000001126bd <_rodata+0xd3d>
ffff80000011265e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011265f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112661:	67 74 68             	addr32 je ffff8000001126cc <_rodata+0xd4c>
ffff800000112664:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842568d <_ebss+0x382f715d>
ffff80000011266a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011266b:	78 0a                	js     ffff800000112677 <_rodata+0xcf7>
ffff80000011266d:	00 00                	add    %al,(%rax)
ffff80000011266f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000112672:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112673:	65 5f                	gs pop %rdi
ffff800000112675:	73 74                	jae    ffff8000001126eb <_rodata+0xd6b>
ffff800000112677:	61                   	(bad)  
ffff800000112678:	72 74                	jb     ffff8000001126ee <_rodata+0xd6e>
ffff80000011267a:	5f                   	pop    %rdi
ffff80000011267b:	61                   	(bad)  
ffff80000011267c:	64 64 72 65          	fs fs jb ffff8000001126e5 <_rodata+0xd65>
ffff800000112680:	73 73                	jae    ffff8000001126f5 <_rodata+0xd75>
ffff800000112682:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256ab <_ebss+0x382f717b>
ffff800000112688:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112689:	78 2c                	js     ffff8000001126b7 <_rodata+0xd37>
ffff80000011268b:	7a 6f                	jp     ffff8000001126fc <_rodata+0xd7c>
ffff80000011268d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011268e:	65 5f                	gs pop %rdi
ffff800000112690:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112692:	64 5f                	fs pop %rdi
ffff800000112694:	61                   	(bad)  
ffff800000112695:	64 64 72 65          	fs fs jb ffff8000001126fe <_rodata+0xd7e>
ffff800000112699:	73 73                	jae    ffff80000011270e <_rodata+0xd8e>
ffff80000011269b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256c4 <_ebss+0x382f7194>
ffff8000001126a1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126a2:	78 2c                	js     ffff8000001126d0 <_rodata+0xd50>
ffff8000001126a4:	7a 6f                	jp     ffff800000112715 <_rodata+0xd95>
ffff8000001126a6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001126a7:	65 5f                	gs pop %rdi
ffff8000001126a9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126aa:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001126ac:	67 74 68             	addr32 je ffff800000112717 <_rodata+0xd97>
ffff8000001126af:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256d8 <_ebss+0x382f71a8>
ffff8000001126b5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126b6:	78 2c                	js     ffff8000001126e4 <_rodata+0xd64>
ffff8000001126b8:	70 61                	jo     ffff80000011271b <_rodata+0xd9b>
ffff8000001126ba:	67 65 73 5f          	addr32 gs jae ffff80000011271d <_rodata+0xd9d>
ffff8000001126be:	67 72 6f             	addr32 jb ffff800000112730 <_rodata+0xdb0>
ffff8000001126c1:	75 70                	jne    ffff800000112733 <_rodata+0xdb3>
ffff8000001126c3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256ec <_ebss+0x382f71bc>
ffff8000001126c9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126ca:	78 2c                	js     ffff8000001126f8 <_rodata+0xd78>
ffff8000001126cc:	70 61                	jo     ffff80000011272f <_rodata+0xdaf>
ffff8000001126ce:	67 65 73 5f          	addr32 gs jae ffff800000112731 <_rodata+0xdb1>
ffff8000001126d2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126d3:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001126d5:	67 74 68             	addr32 je ffff800000112740 <_rodata+0xdc0>
ffff8000001126d8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425701 <_ebss+0x382f71d1>
ffff8000001126de:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126df:	78 0a                	js     ffff8000001126eb <_rodata+0xd6b>
ffff8000001126e1:	00 00                	add    %al,(%rax)
ffff8000001126e3:	00 00                	add    %al,(%rax)
ffff8000001126e5:	00 00                	add    %al,(%rax)
ffff8000001126e7:	00 73 74             	add    %dh,0x74(%rbx)
ffff8000001126ea:	61                   	(bad)  
ffff8000001126eb:	72 74                	jb     ffff800000112761 <_rodata+0xde1>
ffff8000001126ed:	5f                   	pop    %rdi
ffff8000001126ee:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff8000001126f1:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842571b <_ebss+0x382f71eb>
ffff8000001126f8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126f9:	78 2c                	js     ffff800000112727 <_rodata+0xda7>
ffff8000001126fb:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001126fd:	64 5f                	fs pop %rdi
ffff8000001126ff:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112702:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842572c <_ebss+0x382f71fc>
ffff800000112709:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011270a:	78 2c                	js     ffff800000112738 <_rodata+0xdb8>
ffff80000011270c:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011270e:	64 5f                	fs pop %rdi
ffff800000112710:	64 61                	fs (bad) 
ffff800000112712:	74 61                	je     ffff800000112775 <_rodata+0xdf5>
ffff800000112714:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842573d <_ebss+0x382f720d>
ffff80000011271a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011271b:	78 2c                	js     ffff800000112749 <_rodata+0xdc9>
ffff80000011271d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011271f:	64 5f                	fs pop %rdi
ffff800000112721:	62 72                	(bad)  
ffff800000112723:	6b 3a 25             	imul   $0x25,(%rdx),%edi
ffff800000112726:	23 30                	and    (%rax),%esi
ffff800000112728:	31 38                	xor    %edi,(%rax)
ffff80000011272a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011272b:	78 2c                	js     ffff800000112759 <_rodata+0xdd9>
ffff80000011272d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011272f:	64 5f                	fs pop %rdi
ffff800000112731:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112732:	66 5f                	pop    %di
ffff800000112734:	73 74                	jae    ffff8000001127aa <_rodata+0xe2a>
ffff800000112736:	72 75                	jb     ffff8000001127ad <_rodata+0xe2d>
ffff800000112738:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011273c:	23 30                	and    (%rax),%esi
ffff80000011273e:	31 38                	xor    %edi,(%rax)
ffff800000112740:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112741:	78 0a                	js     ffff80000011274d <_rodata+0xdcd>
ffff800000112743:	00 47 6c             	add    %al,0x6c(%rdi)
ffff800000112746:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112747:	62 61 6c 5f 43       	(bad)
ffff80000011274c:	52                   	push   %rdx
ffff80000011274d:	33 09                	xor    (%rcx),%ecx
ffff80000011274f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425778 <_ebss+0x382f7248>
ffff800000112755:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112756:	78 0a                	js     ffff800000112762 <_rodata+0xde2>
ffff800000112758:	00 2a                	add    %ch,(%rdx)
ffff80000011275a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000011275c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011275d:	62 61 6c 5f 43       	(bad)
ffff800000112762:	52                   	push   %rdx
ffff800000112763:	33 09                	xor    (%rcx),%ecx
ffff800000112765:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842578e <_ebss+0x382f725e>
ffff80000011276b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011276c:	78 0a                	js     ffff800000112778 <_rodata+0xdf8>
ffff80000011276e:	00 2a                	add    %ch,(%rdx)
ffff800000112770:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff800000112773:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112774:	62 61 6c 5f 43       	(bad)
ffff800000112779:	52                   	push   %rdx
ffff80000011277a:	33 09                	xor    (%rcx),%ecx
ffff80000011277c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257a5 <_ebss+0x382f7275>
ffff800000112782:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112783:	78 0a                	js     ffff80000011278f <_rodata+0xe0f>
ffff800000112785:	00 00                	add    %al,(%rax)
ffff800000112787:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff80000011278a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011278b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011278c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff80000011278f:	61                   	(bad)  
ffff800000112790:	67 65 73 20          	addr32 gs jae ffff8000001127b4 <_rodata+0xe34>
ffff800000112794:	65 72 72             	gs jb  ffff800000112809 <_rodata+0xe89>
ffff800000112797:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112798:	72 20                	jb     ffff8000001127ba <_rodata+0xe3a>
ffff80000011279a:	7a 6f                	jp     ffff80000011280b <_rodata+0xe8b>
ffff80000011279c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011279d:	65 5f                	gs pop %rdi
ffff80000011279f:	73 65                	jae    ffff800000112806 <_rodata+0xe86>
ffff8000001127a1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127a2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
ffff8000001127a7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127a8:	64 65 78 0a          	fs gs js ffff8000001127b6 <_rodata+0xe36>
ffff8000001127ac:	00 00                	add    %al,(%rax)
ffff8000001127ae:	00 00                	add    %al,(%rax)
ffff8000001127b0:	38 32                	cmp    %dh,(%rdx)
ffff8000001127b2:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff8000001127b7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127b8:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
ffff8000001127bf:	5f 
ffff8000001127c0:	49 52                	rex.WB push %r10
ffff8000001127c2:	51                   	push   %rcx
ffff8000001127c3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257ec <_ebss+0x382f72bc>
ffff8000001127c9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127ca:	78 09                	js     ffff8000001127d5 <_rodata+0xe55>
ffff8000001127cc:	00 6b 65             	add    %ch,0x65(%rbx)
ffff8000001127cf:	79 20                	jns    ffff8000001127f1 <_rodata+0xe71>
ffff8000001127d1:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff8000001127d4:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff8000384257fe <_ebss+0x382f72ce>
ffff8000001127db:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127dc:	78 09                	js     ffff8000001127e7 <_rodata+0xe67>
ffff8000001127de:	00 00                	add    %al,(%rax)
ffff8000001127e0:	72 65                	jb     ffff800000112847 <_rodata+0xec7>
ffff8000001127e2:	67 73 3a             	addr32 jae ffff80000011281f <_rodata+0xe9f>
ffff8000001127e5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001127ea:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127eb:	78 09                	js     ffff8000001127f6 <_rodata+0xe76>
ffff8000001127ed:	3c 52                	cmp    $0x52,%al
ffff8000001127ef:	49 50                	rex.WB push %r8
ffff8000001127f1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842581a <_ebss+0x382f72ea>
ffff8000001127f7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127f8:	78 09                	js     ffff800000112803 <_rodata+0xe83>
ffff8000001127fa:	52                   	push   %rdx
ffff8000001127fb:	53                   	push   %rbx
ffff8000001127fc:	50                   	push   %rax
ffff8000001127fd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425826 <_ebss+0x382f72f6>
ffff800000112803:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112804:	78 3e                	js     ffff800000112844 <_rodata+0xec4>
ffff800000112806:	0a 00                	or     (%rax),%al
ffff800000112808:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112809:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011280a:	5f                   	pop    %rdi
ffff80000011280b:	73 79                	jae    ffff800000112886 <_rodata+0xf06>
ffff80000011280d:	73 74                	jae    ffff800000112883 <_rodata+0xf03>
ffff80000011280f:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000112811:	5f                   	pop    %rdi
ffff800000112812:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000112815:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112816:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000112819:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000011281c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011281d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011281e:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000112825:	25 23 30 34 78       	and    $0x78343023,%eax
ffff80000011282a:	0a 00                	or     (%rax),%al
ffff80000011282c:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011282e:	5f                   	pop    %rdi
ffff80000011282f:	65 78 65             	gs js  ffff800000112897 <_rodata+0xf17>
ffff800000112832:	63 76 65             	movsxd 0x65(%rsi),%esi
ffff800000112835:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff800000112839:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000011283c:	73 20                	jae    ffff80000011285e <_rodata+0xede>
ffff80000011283e:	72 75                	jb     ffff8000001128b5 <_rodata+0xf35>
ffff800000112840:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112841:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112842:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
ffff800000112849:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011284a:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000112851:	20 
ffff800000112852:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000112859:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000112860:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425889 <_ebss+0x382f7359>
ffff800000112866:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112867:	78 0a                	js     ffff800000112873 <_rodata+0xef3>
ffff800000112869:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff80000011286c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011286d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011286e:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff800000112871:	61                   	(bad)  
ffff800000112872:	67 65 73 2c          	addr32 gs jae ffff8000001128a2 <_rodata+0xf22>
ffff800000112876:	62                   	(bad)  
ffff800000112877:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
ffff80000011287e:	23 
ffff80000011287f:	30 31                	xor    %dh,(%rcx)
ffff800000112881:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
ffff800000112885:	00 00                	add    %al,(%rax)
ffff800000112887:	00 73 74             	add    %dh,0x74(%rbx)
ffff80000011288a:	72 75                	jb     ffff800000112901 <_rodata+0xf81>
ffff80000011288c:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
ffff800000112890:	61                   	(bad)  
ffff800000112891:	73 6b                	jae    ffff8000001128fe <_rodata+0xf7e>
ffff800000112893:	5f                   	pop    %rdi
ffff800000112894:	73 74                	jae    ffff80000011290a <_erodata>
ffff800000112896:	72 75                	jb     ffff80000011290d <_erodata+0x3>
ffff800000112898:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
ffff80000011289c:	64 64 72 65          	fs fs jb ffff800000112905 <_rodata+0xf85>
ffff8000001128a0:	73 73                	jae    ffff800000112915 <_erodata+0xb>
ffff8000001128a2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384258cb <_ebss+0x382f739b>
ffff8000001128a8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128a9:	78 0a                	js     ffff8000001128b5 <_rodata+0xf35>
ffff8000001128ab:	00 00                	add    %al,(%rax)
ffff8000001128ad:	00 00                	add    %al,(%rax)
ffff8000001128af:	00 65 78             	add    %ah,0x78(%rbp)
ffff8000001128b2:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff8000001128b9:	20 
ffff8000001128ba:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff8000001128c1:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff8000001128c8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384258f1 <_ebss+0x382f73c1>
ffff8000001128ce:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128cf:	78 0a                	js     ffff8000001128db <_rodata+0xf5b>
ffff8000001128d1:	00 70 72             	add    %dh,0x72(%rax)
ffff8000001128d4:	65 76 2d             	gs jbe ffff800000112904 <_rodata+0xf84>
ffff8000001128d7:	3e 74 68             	je,pt  ffff800000112942 <_erodata+0x38>
ffff8000001128da:	72 65                	jb     ffff800000112941 <_erodata+0x37>
ffff8000001128dc:	61                   	(bad)  
ffff8000001128dd:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff8000001128e3:	30 3a                	xor    %bh,(%rdx)
ffff8000001128e5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001128ea:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128eb:	78 0a                	js     ffff8000001128f7 <_rodata+0xf77>
ffff8000001128ed:	00 6e 65             	add    %ch,0x65(%rsi)
ffff8000001128f0:	78 74                	js     ffff800000112966 <_erodata+0x5c>
ffff8000001128f2:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff8000001128f7:	65 61                	gs (bad) 
ffff8000001128f9:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff8000001128ff:	30 3a                	xor    %bh,(%rdx)
ffff800000112901:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112906:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112907:	78 0a                	js     ffff800000112913 <_erodata+0x9>
	...

Disassembly of section .eh_frame:

ffff800000112910 <.eh_frame>:
ffff800000112910:	14 00                	adc    $0x0,%al
ffff800000112912:	00 00                	add    %al,(%rax)
ffff800000112914:	00 00                	add    %al,(%rax)
ffff800000112916:	00 00                	add    %al,(%rax)
ffff800000112918:	01 7a 52             	add    %edi,0x52(%rdx)
ffff80000011291b:	00 01                	add    %al,(%rcx)
ffff80000011291d:	78 10                	js     ffff80000011292f <_erodata+0x25>
ffff80000011291f:	01 1b                	add    %ebx,(%rbx)
ffff800000112921:	0c 07                	or     $0x7,%al
ffff800000112923:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff800000112929:	00 00                	add    %al,(%rax)
ffff80000011292b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011292e:	00 00                	add    %al,(%rax)
ffff800000112930:	45 19 ff             	sbb    %r15d,%r15d
ffff800000112933:	ff c9                	dec    %ecx
ffff800000112935:	00 00                	add    %al,(%rax)
ffff800000112937:	00 00                	add    %al,(%rax)
ffff800000112939:	41 0e                	rex.B (bad) 
ffff80000011293b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112941:	02 c4                	add    %ah,%al
ffff800000112943:	0c 07                	or     $0x7,%al
ffff800000112945:	08 00                	or     %al,(%rax)
ffff800000112947:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011294a:	00 00                	add    %al,(%rax)
ffff80000011294c:	3c 00                	cmp    $0x0,%al
ffff80000011294e:	00 00                	add    %al,(%rax)
ffff800000112950:	ee                   	out    %al,(%dx)
ffff800000112951:	19 ff                	sbb    %edi,%edi
ffff800000112953:	ff 49 00             	decl   0x0(%rcx)
ffff800000112956:	00 00                	add    %al,(%rax)
ffff800000112958:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011295b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112961:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000112965:	08 00                	or     %al,(%rax)
ffff800000112967:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011296a:	00 00                	add    %al,(%rax)
ffff80000011296c:	5c                   	pop    %rsp
ffff80000011296d:	00 00                	add    %al,(%rax)
ffff80000011296f:	00 17                	add    %dl,(%rdi)
ffff800000112971:	1a ff                	sbb    %bh,%bh
ffff800000112973:	ff                   	(bad)  
ffff800000112974:	39 00                	cmp    %eax,(%rax)
ffff800000112976:	00 00                	add    %al,(%rax)
ffff800000112978:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011297b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112981:	74 0c                	je     ffff80000011298f <_erodata+0x85>
ffff800000112983:	07                   	(bad)  
ffff800000112984:	08 00                	or     %al,(%rax)
ffff800000112986:	00 00                	add    %al,(%rax)
ffff800000112988:	1c 00                	sbb    $0x0,%al
ffff80000011298a:	00 00                	add    %al,(%rax)
ffff80000011298c:	7c 00                	jl     ffff80000011298e <_erodata+0x84>
ffff80000011298e:	00 00                	add    %al,(%rax)
ffff800000112990:	30 1a                	xor    %bl,(%rdx)
ffff800000112992:	ff                   	(bad)  
ffff800000112993:	ff                   	(bad)  
ffff800000112994:	7c 02                	jl     ffff800000112998 <_erodata+0x8e>
ffff800000112996:	00 00                	add    %al,(%rax)
ffff800000112998:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011299b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001129a1:	00 00                	add    %al,(%rax)
ffff8000001129a3:	00 00                	add    %al,(%rax)
ffff8000001129a5:	00 00                	add    %al,(%rax)
ffff8000001129a7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001129aa:	00 00                	add    %al,(%rax)
ffff8000001129ac:	9c                   	pushfq 
ffff8000001129ad:	00 00                	add    %al,(%rax)
ffff8000001129af:	00 8c 1c ff ff 2f 00 	add    %cl,0x2fffff(%rsp,%rbx,1)
ffff8000001129b6:	00 00                	add    %al,(%rax)
ffff8000001129b8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001129bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001129c1:	41 83 03 69          	addl   $0x69,(%r11)
ffff8000001129c5:	0c 07                	or     $0x7,%al
ffff8000001129c7:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff8000001129ca:	00 00                	add    %al,(%rax)
ffff8000001129cc:	bc 00 00 00 9b       	mov    $0x9b000000,%esp
ffff8000001129d1:	1c ff                	sbb    $0xff,%al
ffff8000001129d3:	ff                   	(bad)  
ffff8000001129d4:	ef                   	out    %eax,(%dx)
ffff8000001129d5:	00 00                	add    %al,(%rax)
ffff8000001129d7:	00 00                	add    %al,(%rax)
ffff8000001129d9:	41 0e                	rex.B (bad) 
ffff8000001129db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001129e1:	02 ea                	add    %dl,%ch
ffff8000001129e3:	0c 07                	or     $0x7,%al
ffff8000001129e5:	08 00                	or     %al,(%rax)
ffff8000001129e7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001129ea:	00 00                	add    %al,(%rax)
ffff8000001129ec:	dc 00                	faddl  (%rax)
ffff8000001129ee:	00 00                	add    %al,(%rax)
ffff8000001129f0:	6a 1d                	pushq  $0x1d
ffff8000001129f2:	ff                   	(bad)  
ffff8000001129f3:	ff 60 00             	jmpq   *0x0(%rax)
ffff8000001129f6:	00 00                	add    %al,(%rax)
ffff8000001129f8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001129fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a01:	02 5b 0c             	add    0xc(%rbx),%bl
ffff800000112a04:	07                   	(bad)  
ffff800000112a05:	08 00                	or     %al,(%rax)
ffff800000112a07:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112a0a:	00 00                	add    %al,(%rax)
ffff800000112a0c:	fc                   	cld    
ffff800000112a0d:	00 00                	add    %al,(%rax)
ffff800000112a0f:	00 aa 1d ff ff 76    	add    %ch,0x76ffff1d(%rdx)
ffff800000112a15:	02 00                	add    (%rax),%al
ffff800000112a17:	00 00                	add    %al,(%rax)
ffff800000112a19:	41 0e                	rex.B (bad) 
ffff800000112a1b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a21:	03 71 02             	add    0x2(%rcx),%esi
ffff800000112a24:	0c 07                	or     $0x7,%al
ffff800000112a26:	08 00                	or     %al,(%rax)
ffff800000112a28:	1c 00                	sbb    $0x0,%al
ffff800000112a2a:	00 00                	add    %al,(%rax)
ffff800000112a2c:	1c 01                	sbb    $0x1,%al
ffff800000112a2e:	00 00                	add    %al,(%rax)
ffff800000112a30:	00 20                	add    %ah,(%rax)
ffff800000112a32:	ff                   	(bad)  
ffff800000112a33:	ff                   	(bad)  
ffff800000112a34:	f9                   	stc    
ffff800000112a35:	08 00                	or     %al,(%rax)
ffff800000112a37:	00 00                	add    %al,(%rax)
ffff800000112a39:	41 0e                	rex.B (bad) 
ffff800000112a3b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a41:	03 f4                	add    %esp,%esi
ffff800000112a43:	08 0c 07             	or     %cl,(%rdi,%rax,1)
ffff800000112a46:	08 00                	or     %al,(%rax)
ffff800000112a48:	1c 00                	sbb    $0x0,%al
ffff800000112a4a:	00 00                	add    %al,(%rax)
ffff800000112a4c:	3c 01                	cmp    $0x1,%al
ffff800000112a4e:	00 00                	add    %al,(%rax)
ffff800000112a50:	d9 28                	fldcw  (%rax)
ffff800000112a52:	ff                   	(bad)  
ffff800000112a53:	ff 29                	ljmp   *(%rcx)
ffff800000112a55:	05 00 00 00 41       	add    $0x41000000,%eax
ffff800000112a5a:	0e                   	(bad)  
ffff800000112a5b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a61:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
ffff800000112a68:	1c 00                	sbb    $0x0,%al
ffff800000112a6a:	00 00                	add    %al,(%rax)
ffff800000112a6c:	5c                   	pop    %rsp
ffff800000112a6d:	01 00                	add    %eax,(%rax)
ffff800000112a6f:	00 e2                	add    %ah,%dl
ffff800000112a71:	2d ff ff 8f 00       	sub    $0x8fffff,%eax
ffff800000112a76:	00 00                	add    %al,(%rax)
ffff800000112a78:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112a7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a81:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112a87:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112a8a:	00 00                	add    %al,(%rax)
ffff800000112a8c:	7c 01                	jl     ffff800000112a8f <_erodata+0x185>
ffff800000112a8e:	00 00                	add    %al,(%rax)
ffff800000112a90:	51                   	push   %rcx
ffff800000112a91:	2e ff                	cs (bad) 
ffff800000112a93:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112a99:	41 0e                	rex.B (bad) 
ffff800000112a9b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112aa1:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112aa7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112aaa:	00 00                	add    %al,(%rax)
ffff800000112aac:	9c                   	pushfq 
ffff800000112aad:	01 00                	add    %eax,(%rax)
ffff800000112aaf:	00 c0                	add    %al,%al
ffff800000112ab1:	2e ff                	cs (bad) 
ffff800000112ab3:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112ab9:	41 0e                	rex.B (bad) 
ffff800000112abb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ac1:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112ac7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112aca:	00 00                	add    %al,(%rax)
ffff800000112acc:	bc 01 00 00 2f       	mov    $0x2f000001,%esp
ffff800000112ad1:	2f                   	(bad)  
ffff800000112ad2:	ff                   	(bad)  
ffff800000112ad3:	ff c9                	dec    %ecx
ffff800000112ad5:	00 00                	add    %al,(%rax)
ffff800000112ad7:	00 00                	add    %al,(%rax)
ffff800000112ad9:	41 0e                	rex.B (bad) 
ffff800000112adb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ae1:	02 c4                	add    %ah,%al
ffff800000112ae3:	0c 07                	or     $0x7,%al
ffff800000112ae5:	08 00                	or     %al,(%rax)
ffff800000112ae7:	00 18                	add    %bl,(%rax)
ffff800000112ae9:	00 00                	add    %al,(%rax)
ffff800000112aeb:	00 dc                	add    %bl,%ah
ffff800000112aed:	01 00                	add    %eax,(%rax)
ffff800000112aef:	00 d8                	add    %bl,%al
ffff800000112af1:	2f                   	(bad)  
ffff800000112af2:	ff                   	(bad)  
ffff800000112af3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112af6:	00 00                	add    %al,(%rax)
ffff800000112af8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112afb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b01:	00 00                	add    %al,(%rax)
ffff800000112b03:	00 18                	add    %bl,(%rax)
ffff800000112b05:	00 00                	add    %al,(%rax)
ffff800000112b07:	00 f8                	add    %bh,%al
ffff800000112b09:	01 00                	add    %eax,(%rax)
ffff800000112b0b:	00 17                	add    %dl,(%rdi)
ffff800000112b0d:	30 ff                	xor    %bh,%bh
ffff800000112b0f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b12:	00 00                	add    %al,(%rax)
ffff800000112b14:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b17:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b1d:	00 00                	add    %al,(%rax)
ffff800000112b1f:	00 18                	add    %bl,(%rax)
ffff800000112b21:	00 00                	add    %al,(%rax)
ffff800000112b23:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff800000112b26:	00 00                	add    %al,(%rax)
ffff800000112b28:	56                   	push   %rsi
ffff800000112b29:	30 ff                	xor    %bh,%bh
ffff800000112b2b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b2e:	00 00                	add    %al,(%rax)
ffff800000112b30:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b39:	00 00                	add    %al,(%rax)
ffff800000112b3b:	00 18                	add    %bl,(%rax)
ffff800000112b3d:	00 00                	add    %al,(%rax)
ffff800000112b3f:	00 30                	add    %dh,(%rax)
ffff800000112b41:	02 00                	add    (%rax),%al
ffff800000112b43:	00 95 30 ff ff 5b    	add    %dl,0x5bffff30(%rbp)
ffff800000112b49:	00 00                	add    %al,(%rax)
ffff800000112b4b:	00 00                	add    %al,(%rax)
ffff800000112b4d:	41 0e                	rex.B (bad) 
ffff800000112b4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b55:	00 00                	add    %al,(%rax)
ffff800000112b57:	00 18                	add    %bl,(%rax)
ffff800000112b59:	00 00                	add    %al,(%rax)
ffff800000112b5b:	00 4c 02 00          	add    %cl,0x0(%rdx,%rax,1)
ffff800000112b5f:	00 d4                	add    %dl,%ah
ffff800000112b61:	30 ff                	xor    %bh,%bh
ffff800000112b63:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b66:	00 00                	add    %al,(%rax)
ffff800000112b68:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b71:	00 00                	add    %al,(%rax)
ffff800000112b73:	00 18                	add    %bl,(%rax)
ffff800000112b75:	00 00                	add    %al,(%rax)
ffff800000112b77:	00 68 02             	add    %ch,0x2(%rax)
ffff800000112b7a:	00 00                	add    %al,(%rax)
ffff800000112b7c:	13 31                	adc    (%rcx),%esi
ffff800000112b7e:	ff                   	(bad)  
ffff800000112b7f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b82:	00 00                	add    %al,(%rax)
ffff800000112b84:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b8d:	00 00                	add    %al,(%rax)
ffff800000112b8f:	00 18                	add    %bl,(%rax)
ffff800000112b91:	00 00                	add    %al,(%rax)
ffff800000112b93:	00 84 02 00 00 52 31 	add    %al,0x31520000(%rdx,%rax,1)
ffff800000112b9a:	ff                   	(bad)  
ffff800000112b9b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b9e:	00 00                	add    %al,(%rax)
ffff800000112ba0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112ba3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ba9:	00 00                	add    %al,(%rax)
ffff800000112bab:	00 18                	add    %bl,(%rax)
ffff800000112bad:	00 00                	add    %al,(%rax)
ffff800000112baf:	00 a0 02 00 00 91    	add    %ah,-0x6efffffe(%rax)
ffff800000112bb5:	31 ff                	xor    %edi,%edi
ffff800000112bb7:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112bba:	00 00                	add    %al,(%rax)
ffff800000112bbc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112bbf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bc5:	00 00                	add    %al,(%rax)
ffff800000112bc7:	00 18                	add    %bl,(%rax)
ffff800000112bc9:	00 00                	add    %al,(%rax)
ffff800000112bcb:	00 bc 02 00 00 d0 31 	add    %bh,0x31d00000(%rdx,%rax,1)
ffff800000112bd2:	ff                   	(bad)  
ffff800000112bd3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112bd6:	00 00                	add    %al,(%rax)
ffff800000112bd8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112bdb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112be1:	00 00                	add    %al,(%rax)
ffff800000112be3:	00 18                	add    %bl,(%rax)
ffff800000112be5:	00 00                	add    %al,(%rax)
ffff800000112be7:	00 d8                	add    %bl,%al
ffff800000112be9:	02 00                	add    (%rax),%al
ffff800000112beb:	00 0f                	add    %cl,(%rdi)
ffff800000112bed:	32 ff                	xor    %bh,%bh
ffff800000112bef:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112bf2:	00 00                	add    %al,(%rax)
ffff800000112bf4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112bf7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bfd:	00 00                	add    %al,(%rax)
ffff800000112bff:	00 18                	add    %bl,(%rax)
ffff800000112c01:	00 00                	add    %al,(%rax)
ffff800000112c03:	00 f4                	add    %dh,%ah
ffff800000112c05:	02 00                	add    (%rax),%al
ffff800000112c07:	00 4e 32             	add    %cl,0x32(%rsi)
ffff800000112c0a:	ff                   	(bad)  
ffff800000112c0b:	ff                   	(bad)  
ffff800000112c0c:	7a 01                	jp     ffff800000112c0f <_erodata+0x305>
ffff800000112c0e:	00 00                	add    %al,(%rax)
ffff800000112c10:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c19:	00 00                	add    %al,(%rax)
ffff800000112c1b:	00 18                	add    %bl,(%rax)
ffff800000112c1d:	00 00                	add    %al,(%rax)
ffff800000112c1f:	00 10                	add    %dl,(%rax)
ffff800000112c21:	03 00                	add    (%rax),%eax
ffff800000112c23:	00 ac 33 ff ff 7a 01 	add    %ch,0x17affff(%rbx,%rsi,1)
ffff800000112c2a:	00 00                	add    %al,(%rax)
ffff800000112c2c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c2f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c35:	00 00                	add    %al,(%rax)
ffff800000112c37:	00 18                	add    %bl,(%rax)
ffff800000112c39:	00 00                	add    %al,(%rax)
ffff800000112c3b:	00 2c 03             	add    %ch,(%rbx,%rax,1)
ffff800000112c3e:	00 00                	add    %al,(%rax)
ffff800000112c40:	0a 35 ff ff 7a 01    	or     0x17affff(%rip),%dh        # ffff8000018c2c45 <_ebss+0x1794715>
ffff800000112c46:	00 00                	add    %al,(%rax)
ffff800000112c48:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c51:	00 00                	add    %al,(%rax)
ffff800000112c53:	00 18                	add    %bl,(%rax)
ffff800000112c55:	00 00                	add    %al,(%rax)
ffff800000112c57:	00 48 03             	add    %cl,0x3(%rax)
ffff800000112c5a:	00 00                	add    %al,(%rax)
ffff800000112c5c:	68 36 ff ff 7a       	pushq  $0x7affff36
ffff800000112c61:	01 00                	add    %eax,(%rax)
ffff800000112c63:	00 00                	add    %al,(%rax)
ffff800000112c65:	41 0e                	rex.B (bad) 
ffff800000112c67:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c6d:	00 00                	add    %al,(%rax)
ffff800000112c6f:	00 18                	add    %bl,(%rax)
ffff800000112c71:	00 00                	add    %al,(%rax)
ffff800000112c73:	00 64 03 00          	add    %ah,0x0(%rbx,%rax,1)
ffff800000112c77:	00 c6                	add    %al,%dh
ffff800000112c79:	37                   	(bad)  
ffff800000112c7a:	ff                   	(bad)  
ffff800000112c7b:	ff                   	(bad)  
ffff800000112c7c:	ff 01                	incl   (%rcx)
ffff800000112c7e:	00 00                	add    %al,(%rax)
ffff800000112c80:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c89:	00 00                	add    %al,(%rax)
ffff800000112c8b:	00 18                	add    %bl,(%rax)
ffff800000112c8d:	00 00                	add    %al,(%rax)
ffff800000112c8f:	00 80 03 00 00 a9    	add    %al,-0x56fffffd(%rax)
ffff800000112c95:	39 ff                	cmp    %edi,%edi
ffff800000112c97:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c9a:	00 00                	add    %al,(%rax)
ffff800000112c9c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c9f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ca5:	00 00                	add    %al,(%rax)
ffff800000112ca7:	00 18                	add    %bl,(%rax)
ffff800000112ca9:	00 00                	add    %al,(%rax)
ffff800000112cab:	00 9c 03 00 00 e8 39 	add    %bl,0x39e80000(%rbx,%rax,1)
ffff800000112cb2:	ff                   	(bad)  
ffff800000112cb3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cb6:	00 00                	add    %al,(%rax)
ffff800000112cb8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cbb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112cc1:	00 00                	add    %al,(%rax)
ffff800000112cc3:	00 18                	add    %bl,(%rax)
ffff800000112cc5:	00 00                	add    %al,(%rax)
ffff800000112cc7:	00 b8 03 00 00 27    	add    %bh,0x27000003(%rax)
ffff800000112ccd:	3a ff                	cmp    %bh,%bh
ffff800000112ccf:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cd2:	00 00                	add    %al,(%rax)
ffff800000112cd4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cd7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112cdd:	00 00                	add    %al,(%rax)
ffff800000112cdf:	00 18                	add    %bl,(%rax)
ffff800000112ce1:	00 00                	add    %al,(%rax)
ffff800000112ce3:	00 d4                	add    %dl,%ah
ffff800000112ce5:	03 00                	add    (%rax),%eax
ffff800000112ce7:	00 66 3a             	add    %ah,0x3a(%rsi)
ffff800000112cea:	ff                   	(bad)  
ffff800000112ceb:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112cee:	00 00                	add    %al,(%rax)
ffff800000112cf0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cf3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112cf9:	00 00                	add    %al,(%rax)
ffff800000112cfb:	00 18                	add    %bl,(%rax)
ffff800000112cfd:	00 00                	add    %al,(%rax)
ffff800000112cff:	00 f0                	add    %dh,%al
ffff800000112d01:	03 00                	add    (%rax),%eax
ffff800000112d03:	00 a5 3a ff ff 5b    	add    %ah,0x5bffff3a(%rbp)
ffff800000112d09:	00 00                	add    %al,(%rax)
ffff800000112d0b:	00 00                	add    %al,(%rax)
ffff800000112d0d:	41 0e                	rex.B (bad) 
ffff800000112d0f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d15:	00 00                	add    %al,(%rax)
ffff800000112d17:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112d1a:	00 00                	add    %al,(%rax)
ffff800000112d1c:	0c 04                	or     $0x4,%al
ffff800000112d1e:	00 00                	add    %al,(%rax)
ffff800000112d20:	e4 3a                	in     $0x3a,%al
ffff800000112d22:	ff                   	(bad)  
ffff800000112d23:	ff 87 02 00 00 00    	incl   0x2(%rdi)
ffff800000112d29:	41 0e                	rex.B (bad) 
ffff800000112d2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d31:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
ffff800000112d37:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112d3a:	00 00                	add    %al,(%rax)
ffff800000112d3c:	2c 04                	sub    $0x4,%al
ffff800000112d3e:	00 00                	add    %al,(%rax)
ffff800000112d40:	4b 3d ff ff 76 00    	rex.WXB cmp $0x76ffff,%rax
ffff800000112d46:	00 00                	add    %al,(%rax)
ffff800000112d48:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d51:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112d54:	07                   	(bad)  
ffff800000112d55:	08 00                	or     %al,(%rax)
ffff800000112d57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112d5a:	00 00                	add    %al,(%rax)
ffff800000112d5c:	4c 04 00             	rex.WR add $0x0,%al
ffff800000112d5f:	00 a1 3d ff ff 11    	add    %ah,0x11ffff3d(%rcx)
ffff800000112d65:	00 00                	add    %al,(%rax)
ffff800000112d67:	00 00                	add    %al,(%rax)
ffff800000112d69:	41 0e                	rex.B (bad) 
ffff800000112d6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d71:	4c 0c 07             	rex.WR or $0x7,%al
ffff800000112d74:	08 00                	or     %al,(%rax)
ffff800000112d76:	00 00                	add    %al,(%rax)
ffff800000112d78:	1c 00                	sbb    $0x0,%al
ffff800000112d7a:	00 00                	add    %al,(%rax)
ffff800000112d7c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112d7d:	04 00                	add    $0x0,%al
ffff800000112d7f:	00 92 3d ff ff ec    	add    %dl,-0x130000c3(%rdx)
ffff800000112d85:	01 00                	add    %eax,(%rax)
ffff800000112d87:	00 00                	add    %al,(%rax)
ffff800000112d89:	41 0e                	rex.B (bad) 
ffff800000112d8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d91:	03 e7                	add    %edi,%esp
ffff800000112d93:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000112d96:	08 00                	or     %al,(%rax)
ffff800000112d98:	1c 00                	sbb    $0x0,%al
ffff800000112d9a:	00 00                	add    %al,(%rax)
ffff800000112d9c:	8c 04 00             	mov    %es,(%rax,%rax,1)
ffff800000112d9f:	00 5e 3f             	add    %bl,0x3f(%rsi)
ffff800000112da2:	ff                   	(bad)  
ffff800000112da3:	ff 82 01 00 00 00    	incl   0x1(%rdx)
ffff800000112da9:	41 0e                	rex.B (bad) 
ffff800000112dab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112db1:	03 7d 01             	add    0x1(%rbp),%edi
ffff800000112db4:	0c 07                	or     $0x7,%al
ffff800000112db6:	08 00                	or     %al,(%rax)
ffff800000112db8:	1c 00                	sbb    $0x0,%al
ffff800000112dba:	00 00                	add    %al,(%rax)
ffff800000112dbc:	ac                   	lods   %ds:(%rsi),%al
ffff800000112dbd:	04 00                	add    $0x0,%al
ffff800000112dbf:	00 c0                	add    %al,%al
ffff800000112dc1:	40 ff                	rex (bad) 
ffff800000112dc3:	ff 37                	pushq  (%rdi)
ffff800000112dc5:	0e                   	(bad)  
ffff800000112dc6:	00 00                	add    %al,(%rax)
ffff800000112dc8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112dcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112dd1:	03 32                	add    (%rdx),%esi
ffff800000112dd3:	0e                   	(bad)  
ffff800000112dd4:	0c 07                	or     $0x7,%al
ffff800000112dd6:	08 00                	or     %al,(%rax)
ffff800000112dd8:	1c 00                	sbb    $0x0,%al
ffff800000112dda:	00 00                	add    %al,(%rax)
ffff800000112ddc:	cc                   	int3   
ffff800000112ddd:	04 00                	add    $0x0,%al
ffff800000112ddf:	00 d7                	add    %dl,%bh
ffff800000112de1:	4e ff                	rex.WRX (bad) 
ffff800000112de3:	ff 32                	pushq  (%rdx)
ffff800000112de5:	03 00                	add    (%rax),%eax
ffff800000112de7:	00 00                	add    %al,(%rax)
ffff800000112de9:	41 0e                	rex.B (bad) 
ffff800000112deb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112df1:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # ffff8000081839fa <_ebss+0x80554ca>
ffff800000112df7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112dfa:	00 00                	add    %al,(%rax)
ffff800000112dfc:	ec                   	in     (%dx),%al
ffff800000112dfd:	04 00                	add    $0x0,%al
ffff800000112dff:	00 e9                	add    %ch,%cl
ffff800000112e01:	51                   	push   %rcx
ffff800000112e02:	ff                   	(bad)  
ffff800000112e03:	ff 21                	jmpq   *(%rcx)
ffff800000112e05:	00 00                	add    %al,(%rax)
ffff800000112e07:	00 00                	add    %al,(%rax)
ffff800000112e09:	41 0e                	rex.B (bad) 
ffff800000112e0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e11:	5c                   	pop    %rsp
ffff800000112e12:	0c 07                	or     $0x7,%al
ffff800000112e14:	08 00                	or     %al,(%rax)
ffff800000112e16:	00 00                	add    %al,(%rax)
ffff800000112e18:	1c 00                	sbb    $0x0,%al
ffff800000112e1a:	00 00                	add    %al,(%rax)
ffff800000112e1c:	0c 05                	or     $0x5,%al
ffff800000112e1e:	00 00                	add    %al,(%rax)
ffff800000112e20:	ea                   	(bad)  
ffff800000112e21:	51                   	push   %rcx
ffff800000112e22:	ff                   	(bad)  
ffff800000112e23:	ff 20                	jmpq   *(%rax)
ffff800000112e25:	00 00                	add    %al,(%rax)
ffff800000112e27:	00 00                	add    %al,(%rax)
ffff800000112e29:	41 0e                	rex.B (bad) 
ffff800000112e2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e31:	5b                   	pop    %rbx
ffff800000112e32:	0c 07                	or     $0x7,%al
ffff800000112e34:	08 00                	or     %al,(%rax)
ffff800000112e36:	00 00                	add    %al,(%rax)
ffff800000112e38:	1c 00                	sbb    $0x0,%al
ffff800000112e3a:	00 00                	add    %al,(%rax)
ffff800000112e3c:	2c 05                	sub    $0x5,%al
ffff800000112e3e:	00 00                	add    %al,(%rax)
ffff800000112e40:	ea                   	(bad)  
ffff800000112e41:	51                   	push   %rcx
ffff800000112e42:	ff                   	(bad)  
ffff800000112e43:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112e49:	41 0e                	rex.B (bad) 
ffff800000112e4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e51:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112e57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112e5a:	00 00                	add    %al,(%rax)
ffff800000112e5c:	4c 05 00 00 59 52    	rex.WR add $0x52590000,%rax
ffff800000112e62:	ff                   	(bad)  
ffff800000112e63:	ff c9                	dec    %ecx
ffff800000112e65:	00 00                	add    %al,(%rax)
ffff800000112e67:	00 00                	add    %al,(%rax)
ffff800000112e69:	41 0e                	rex.B (bad) 
ffff800000112e6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e71:	02 c4                	add    %ah,%al
ffff800000112e73:	0c 07                	or     $0x7,%al
ffff800000112e75:	08 00                	or     %al,(%rax)
ffff800000112e77:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112e7a:	00 00                	add    %al,(%rax)
ffff800000112e7c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112e7d:	05 00 00 f2 59       	add    $0x59f20000,%eax
ffff800000112e82:	ff                   	(bad)  
ffff800000112e83:	ff 4c 01 00          	decl   0x0(%rcx,%rax,1)
ffff800000112e87:	00 00                	add    %al,(%rax)
ffff800000112e89:	41 0e                	rex.B (bad) 
ffff800000112e8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e91:	03 47 01             	add    0x1(%rdi),%eax
ffff800000112e94:	0c 07                	or     $0x7,%al
ffff800000112e96:	08 00                	or     %al,(%rax)
ffff800000112e98:	1c 00                	sbb    $0x0,%al
ffff800000112e9a:	00 00                	add    %al,(%rax)
ffff800000112e9c:	8c 05 00 00 1e 5b    	mov    %es,0x5b1e0000(%rip)        # ffff80005b2f2ea2 <_ebss+0x5b1c4972>
ffff800000112ea2:	ff                   	(bad)  
ffff800000112ea3:	ff                   	(bad)  
ffff800000112ea4:	df 00                	filds  (%rax)
ffff800000112ea6:	00 00                	add    %al,(%rax)
ffff800000112ea8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112eab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112eb1:	02 da                	add    %dl,%bl
ffff800000112eb3:	0c 07                	or     $0x7,%al
ffff800000112eb5:	08 00                	or     %al,(%rax)
ffff800000112eb7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112eba:	00 00                	add    %al,(%rax)
ffff800000112ebc:	ac                   	lods   %ds:(%rsi),%al
ffff800000112ebd:	05 00 00 dd 5b       	add    $0x5bdd0000,%eax
ffff800000112ec2:	ff                   	(bad)  
ffff800000112ec3:	ff 22                	jmpq   *(%rdx)
ffff800000112ec5:	00 00                	add    %al,(%rax)
ffff800000112ec7:	00 00                	add    %al,(%rax)
ffff800000112ec9:	41 0e                	rex.B (bad) 
ffff800000112ecb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ed1:	5d                   	pop    %rbp
ffff800000112ed2:	0c 07                	or     $0x7,%al
ffff800000112ed4:	08 00                	or     %al,(%rax)
ffff800000112ed6:	00 00                	add    %al,(%rax)
ffff800000112ed8:	1c 00                	sbb    $0x0,%al
ffff800000112eda:	00 00                	add    %al,(%rax)
ffff800000112edc:	cc                   	int3   
ffff800000112edd:	05 00 00 df 5b       	add    $0x5bdf0000,%eax
ffff800000112ee2:	ff                   	(bad)  
ffff800000112ee3:	ff 43 00             	incl   0x0(%rbx)
ffff800000112ee6:	00 00                	add    %al,(%rax)
ffff800000112ee8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112eeb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ef1:	7e 0c                	jle    ffff800000112eff <_erodata+0x5f5>
ffff800000112ef3:	07                   	(bad)  
ffff800000112ef4:	08 00                	or     %al,(%rax)
ffff800000112ef6:	00 00                	add    %al,(%rax)
ffff800000112ef8:	1c 00                	sbb    $0x0,%al
ffff800000112efa:	00 00                	add    %al,(%rax)
ffff800000112efc:	ec                   	in     (%dx),%al
ffff800000112efd:	05 00 00 02 5c       	add    $0x5c020000,%eax
ffff800000112f02:	ff                   	(bad)  
ffff800000112f03:	ff 26                	jmpq   *(%rsi)
ffff800000112f05:	00 00                	add    %al,(%rax)
ffff800000112f07:	00 00                	add    %al,(%rax)
ffff800000112f09:	41 0e                	rex.B (bad) 
ffff800000112f0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f11:	61                   	(bad)  
ffff800000112f12:	0c 07                	or     $0x7,%al
ffff800000112f14:	08 00                	or     %al,(%rax)
ffff800000112f16:	00 00                	add    %al,(%rax)
ffff800000112f18:	1c 00                	sbb    $0x0,%al
ffff800000112f1a:	00 00                	add    %al,(%rax)
ffff800000112f1c:	0c 06                	or     $0x6,%al
ffff800000112f1e:	00 00                	add    %al,(%rax)
ffff800000112f20:	08 5c ff ff          	or     %bl,-0x1(%rdi,%rdi,8)
ffff800000112f24:	5a                   	pop    %rdx
ffff800000112f25:	00 00                	add    %al,(%rax)
ffff800000112f27:	00 00                	add    %al,(%rax)
ffff800000112f29:	41 0e                	rex.B (bad) 
ffff800000112f2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f31:	02 55 0c             	add    0xc(%rbp),%dl
ffff800000112f34:	07                   	(bad)  
ffff800000112f35:	08 00                	or     %al,(%rax)
ffff800000112f37:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f3a:	00 00                	add    %al,(%rax)
ffff800000112f3c:	2c 06                	sub    $0x6,%al
ffff800000112f3e:	00 00                	add    %al,(%rax)
ffff800000112f40:	42 5c                	rex.X pop %rsp
ffff800000112f42:	ff                   	(bad)  
ffff800000112f43:	ff 76 00             	pushq  0x0(%rsi)
ffff800000112f46:	00 00                	add    %al,(%rax)
ffff800000112f48:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112f4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f51:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112f54:	07                   	(bad)  
ffff800000112f55:	08 00                	or     %al,(%rax)
ffff800000112f57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f5a:	00 00                	add    %al,(%rax)
ffff800000112f5c:	4c 06                	rex.WR (bad) 
ffff800000112f5e:	00 00                	add    %al,(%rax)
ffff800000112f60:	98                   	cwtl   
ffff800000112f61:	5c                   	pop    %rsp
ffff800000112f62:	ff                   	(bad)  
ffff800000112f63:	ff 26                	jmpq   *(%rsi)
ffff800000112f65:	00 00                	add    %al,(%rax)
ffff800000112f67:	00 00                	add    %al,(%rax)
ffff800000112f69:	41 0e                	rex.B (bad) 
ffff800000112f6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f71:	61                   	(bad)  
ffff800000112f72:	0c 07                	or     $0x7,%al
ffff800000112f74:	08 00                	or     %al,(%rax)
ffff800000112f76:	00 00                	add    %al,(%rax)
ffff800000112f78:	1c 00                	sbb    $0x0,%al
ffff800000112f7a:	00 00                	add    %al,(%rax)
ffff800000112f7c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f7d:	06                   	(bad)  
ffff800000112f7e:	00 00                	add    %al,(%rax)
ffff800000112f80:	9e                   	sahf   
ffff800000112f81:	5c                   	pop    %rsp
ffff800000112f82:	ff                   	(bad)  
ffff800000112f83:	ff 20                	jmpq   *(%rax)
ffff800000112f85:	00 00                	add    %al,(%rax)
ffff800000112f87:	00 00                	add    %al,(%rax)
ffff800000112f89:	41 0e                	rex.B (bad) 
ffff800000112f8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f91:	5b                   	pop    %rbx
ffff800000112f92:	0c 07                	or     $0x7,%al
ffff800000112f94:	08 00                	or     %al,(%rax)
ffff800000112f96:	00 00                	add    %al,(%rax)
ffff800000112f98:	1c 00                	sbb    $0x0,%al
ffff800000112f9a:	00 00                	add    %al,(%rax)
ffff800000112f9c:	8c 06                	mov    %es,(%rsi)
ffff800000112f9e:	00 00                	add    %al,(%rax)
ffff800000112fa0:	9e                   	sahf   
ffff800000112fa1:	5c                   	pop    %rsp
ffff800000112fa2:	ff                   	(bad)  
ffff800000112fa3:	ff 49 00             	decl   0x0(%rcx)
ffff800000112fa6:	00 00                	add    %al,(%rax)
ffff800000112fa8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112fab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fb1:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000112fb5:	08 00                	or     %al,(%rax)
ffff800000112fb7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112fba:	00 00                	add    %al,(%rax)
ffff800000112fbc:	ac                   	lods   %ds:(%rsi),%al
ffff800000112fbd:	06                   	(bad)  
ffff800000112fbe:	00 00                	add    %al,(%rax)
ffff800000112fc0:	c7                   	(bad)  
ffff800000112fc1:	5c                   	pop    %rsp
ffff800000112fc2:	ff                   	(bad)  
ffff800000112fc3:	ff                   	(bad)  
ffff800000112fc4:	39 00                	cmp    %eax,(%rax)
ffff800000112fc6:	00 00                	add    %al,(%rax)
ffff800000112fc8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112fcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fd1:	74 0c                	je     ffff800000112fdf <_erodata+0x6d5>
ffff800000112fd3:	07                   	(bad)  
ffff800000112fd4:	08 00                	or     %al,(%rax)
ffff800000112fd6:	00 00                	add    %al,(%rax)
ffff800000112fd8:	1c 00                	sbb    $0x0,%al
ffff800000112fda:	00 00                	add    %al,(%rax)
ffff800000112fdc:	cc                   	int3   
ffff800000112fdd:	06                   	(bad)  
ffff800000112fde:	00 00                	add    %al,(%rax)
ffff800000112fe0:	e0 5c                	loopne ffff80000011303e <_erodata+0x734>
ffff800000112fe2:	ff                   	(bad)  
ffff800000112fe3:	ff c9                	dec    %ecx
ffff800000112fe5:	00 00                	add    %al,(%rax)
ffff800000112fe7:	00 00                	add    %al,(%rax)
ffff800000112fe9:	41 0e                	rex.B (bad) 
ffff800000112feb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ff1:	02 c4                	add    %ah,%al
ffff800000112ff3:	0c 07                	or     $0x7,%al
ffff800000112ff5:	08 00                	or     %al,(%rax)
ffff800000112ff7:	00 18                	add    %bl,(%rax)
ffff800000112ff9:	00 00                	add    %al,(%rax)
ffff800000112ffb:	00 ec                	add    %ch,%ah
ffff800000112ffd:	06                   	(bad)  
ffff800000112ffe:	00 00                	add    %al,(%rax)
ffff800000113000:	89 5d ff             	mov    %ebx,-0x1(%rbp)
ffff800000113003:	ff 45 00             	incl   0x0(%rbp)
ffff800000113006:	00 00                	add    %al,(%rax)
ffff800000113008:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011300b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113011:	00 00                	add    %al,(%rax)
ffff800000113013:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113016:	00 00                	add    %al,(%rax)
ffff800000113018:	08 07                	or     %al,(%rdi)
ffff80000011301a:	00 00                	add    %al,(%rax)
ffff80000011301c:	b2 5d                	mov    $0x5d,%dl
ffff80000011301e:	ff                   	(bad)  
ffff80000011301f:	ff 97 00 00 00 00    	callq  *0x0(%rdi)
ffff800000113025:	41 0e                	rex.B (bad) 
ffff800000113027:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011302d:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
ffff800000113033:	00 20                	add    %ah,(%rax)
ffff800000113035:	00 00                	add    %al,(%rax)
ffff800000113037:	00 28                	add    %ch,(%rax)
ffff800000113039:	07                   	(bad)  
ffff80000011303a:	00 00                	add    %al,(%rax)
ffff80000011303c:	29 5e ff             	sub    %ebx,-0x1(%rsi)
ffff80000011303f:	ff f6                	push   %rsi
ffff800000113041:	00 00                	add    %al,(%rax)
ffff800000113043:	00 00                	add    %al,(%rax)
ffff800000113045:	41 0e                	rex.B (bad) 
ffff800000113047:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011304d:	45 83 03 02          	rex.RB addl $0x2,(%r11)
ffff800000113051:	ec                   	in     (%dx),%al
ffff800000113052:	0c 07                	or     $0x7,%al
ffff800000113054:	08 00                	or     %al,(%rax)
ffff800000113056:	00 00                	add    %al,(%rax)
ffff800000113058:	20 00                	and    %al,(%rax)
ffff80000011305a:	00 00                	add    %al,(%rax)
ffff80000011305c:	4c 07                	rex.WR (bad) 
ffff80000011305e:	00 00                	add    %al,(%rax)
ffff800000113060:	fb                   	sti    
ffff800000113061:	5e                   	pop    %rsi
ffff800000113062:	ff                   	(bad)  
ffff800000113063:	ff af 02 00 00 00    	ljmp   *0x2(%rdi)
ffff800000113069:	41 0e                	rex.B (bad) 
ffff80000011306b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113071:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff800000113075:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff800000113076:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff800000113079:	08 00                	or     %al,(%rax)
ffff80000011307b:	00 18                	add    %bl,(%rax)
ffff80000011307d:	00 00                	add    %al,(%rax)
ffff80000011307f:	00 70 07             	add    %dh,0x7(%rax)
ffff800000113082:	00 00                	add    %al,(%rax)
ffff800000113084:	86 61 ff             	xchg   %ah,-0x1(%rcx)
ffff800000113087:	ff                   	(bad)  
ffff800000113088:	3b 00                	cmp    (%rax),%eax
ffff80000011308a:	00 00                	add    %al,(%rax)
ffff80000011308c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011308f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113095:	00 00                	add    %al,(%rax)
ffff800000113097:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011309a:	00 00                	add    %al,(%rax)
ffff80000011309c:	8c 07                	mov    %es,(%rdi)
ffff80000011309e:	00 00                	add    %al,(%rax)
ffff8000001130a0:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff8000001130a1:	61                   	(bad)  
ffff8000001130a2:	ff                   	(bad)  
ffff8000001130a3:	ff 30                	pushq  (%rax)
ffff8000001130a5:	00 00                	add    %al,(%rax)
ffff8000001130a7:	00 00                	add    %al,(%rax)
ffff8000001130a9:	41 0e                	rex.B (bad) 
ffff8000001130ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130b1:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
ffff8000001130b5:	00 00                	add    %al,(%rax)
ffff8000001130b7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001130ba:	00 00                	add    %al,(%rax)
ffff8000001130bc:	ac                   	lods   %ds:(%rsi),%al
ffff8000001130bd:	07                   	(bad)  
ffff8000001130be:	00 00                	add    %al,(%rax)
ffff8000001130c0:	e5 61                	in     $0x61,%eax
ffff8000001130c2:	ff                   	(bad)  
ffff8000001130c3:	ff b5 00 00 00 00    	pushq  0x0(%rbp)
ffff8000001130c9:	41 0e                	rex.B (bad) 
ffff8000001130cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130d1:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
ffff8000001130d7:	00 20                	add    %ah,(%rax)
ffff8000001130d9:	00 00                	add    %al,(%rax)
ffff8000001130db:	00 cc                	add    %cl,%ah
ffff8000001130dd:	07                   	(bad)  
ffff8000001130de:	00 00                	add    %al,(%rax)
ffff8000001130e0:	7a 62                	jp     ffff800000113144 <_erodata+0x83a>
ffff8000001130e2:	ff                   	(bad)  
ffff8000001130e3:	ff 81 01 00 00 00    	incl   0x1(%rcx)
ffff8000001130e9:	41 0e                	rex.B (bad) 
ffff8000001130eb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130f1:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff8000001130f5:	77 01                	ja     ffff8000001130f8 <_erodata+0x7ee>
ffff8000001130f7:	0c 07                	or     $0x7,%al
ffff8000001130f9:	08 00                	or     %al,(%rax)
ffff8000001130fb:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff8000001130fe:	00 00                	add    %al,(%rax)
ffff800000113100:	f0 07                	lock (bad) 
ffff800000113102:	00 00                	add    %al,(%rax)
ffff800000113104:	d7                   	xlat   %ds:(%rbx)
ffff800000113105:	63 ff                	movsxd %edi,%edi
ffff800000113107:	ff 43 03             	incl   0x3(%rbx)
ffff80000011310a:	00 00                	add    %al,(%rax)
ffff80000011310c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011310f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113115:	4b 8e 03             	rex.WXB mov (%r11),%es
ffff800000113118:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
ffff80000011311b:	05 83 06 03 33       	add    $0x33030683,%eax
ffff800000113120:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff800000113123:	08                   	.byte 0x8

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
ffff800000118024:	00 80 ff ff 40 b9    	add    %al,-0x46bf0001(%rax)
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
ffff800000120024:	00 80 ff ff 40 b9    	add    %al,-0x46bf0001(%rax)
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
