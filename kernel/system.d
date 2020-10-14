
system.o:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100004:	8e d8                	mov    %eax,%ds
ffff800000100006:	8e c0                	mov    %eax,%es
ffff800000100008:	8e e0                	mov    %eax,%fs
ffff80000010000a:	8e d0                	mov    %eax,%ss
ffff80000010000c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
ffff800000100011:	0f 01 15 00 99 00 00 	lgdt   0x9900(%rip)        # ffff800000109918 <GDT_END>
ffff800000100018:	0f 01 1d 03 a9 00 00 	lidt   0xa903(%rip)        # ffff80000010a922 <IDT_END>
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
ffff80000010009a:	48 8d 3d 81 98 00 00 	lea    0x9881(%rip),%rdi        # ffff800000109922 <IDT_Table>
ffff8000001000a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff8000001000a8 <rp_sidt>:
ffff8000001000a8:	48 89 07             	mov    %rax,(%rdi)
ffff8000001000ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff8000001000af:	48 83 c7 10          	add    $0x10,%rdi
ffff8000001000b3:	48 ff c9             	dec    %rcx
ffff8000001000b6:	75 f0                	jne    ffff8000001000a8 <rp_sidt>

ffff8000001000b8 <setup_TSS64>:
ffff8000001000b8:	48 8d 15 6d a8 00 00 	lea    0xa86d(%rip),%rdx        # ffff80000010a92c <TSS64_Table>
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
ffff8000001000f2:	48 8d 3d 87 97 00 00 	lea    0x9787(%rip),%rdi        # ffff800000109880 <GDT_Table>
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
ffff80000010405f:	e8 92 51 00 00       	callq  ffff8000001091f6 <system_call_function>

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
ffff800000104291:	48 ba 30 a9 10 00 00 	movabs $0xffff80000010a930,%rdx
ffff800000104298:	80 ff ff 
ffff80000010429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010429f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042a2:	48 ba 38 a9 10 00 00 	movabs $0xffff80000010a938,%rdx
ffff8000001042a9:	80 ff ff 
ffff8000001042ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042b3:	48 ba 40 a9 10 00 00 	movabs $0xffff80000010a940,%rdx
ffff8000001042ba:	80 ff ff 
ffff8000001042bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001042c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042c4:	48 ba 50 a9 10 00 00 	movabs $0xffff80000010a950,%rdx
ffff8000001042cb:	80 ff ff 
ffff8000001042ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001042d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042d5:	48 ba 58 a9 10 00 00 	movabs $0xffff80000010a958,%rdx
ffff8000001042dc:	80 ff ff 
ffff8000001042df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042e6:	48 ba 60 a9 10 00 00 	movabs $0xffff80000010a960,%rdx
ffff8000001042ed:	80 ff ff 
ffff8000001042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001042f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042f7:	48 ba 68 a9 10 00 00 	movabs $0xffff80000010a968,%rdx
ffff8000001042fe:	80 ff ff 
ffff800000104301:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000104305:	48 89 02             	mov    %rax,(%rdx)
ffff800000104308:	48 ba 70 a9 10 00 00 	movabs $0xffff80000010a970,%rdx
ffff80000010430f:	80 ff ff 
ffff800000104312:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000104316:	48 89 02             	mov    %rax,(%rdx)
ffff800000104319:	48 ba 78 a9 10 00 00 	movabs $0xffff80000010a978,%rdx
ffff800000104320:	80 ff ff 
ffff800000104323:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000104327:	48 89 02             	mov    %rax,(%rdx)
ffff80000010432a:	48 ba 80 a9 10 00 00 	movabs $0xffff80000010a980,%rdx
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
ffff800000104358:	48 ba e0 19 11 00 00 	movabs $0xffff8000001119e0,%rdx
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
ffff800000104547:	48 ba 63 98 10 00 00 	movabs $0xffff800000109863,%rdx
ffff80000010454e:	80 ff ff 
ffff800000104551:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104558:	80 ff ff 
ffff80000010455b:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
ffff800000104562:	48 ba e0 19 11 00 00 	movabs $0xffff8000001119e0,%rdx
ffff800000104569:	80 ff ff 
ffff80000010456c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104573:	80 ff ff 
ffff800000104576:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
ffff80000010457d:	48 ba 30 e5 12 00 00 	movabs $0xffff80000012e530,%rdx
ffff800000104584:	80 ff ff 
ffff800000104587:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010458e:	80 ff ff 
ffff800000104591:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
ffff800000104598:	48 ba 04 1a 11 00 00 	movabs $0xffff800000111a04,%rdx
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
ffff8000001045ce:	48 ba 12 1a 11 00 00 	movabs $0xffff800000111a12,%rdx
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
ffff800000104604:	48 ba 23 1a 11 00 00 	movabs $0xffff800000111a23,%rdx
ffff80000010460b:	80 ff ff 
ffff80000010460e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104613:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104618:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010461d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000104624:	80 ff ff 
ffff800000104627:	ff d1                	callq  *%rcx
ffff800000104629:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010462e:	48 ba 20 95 10 00 00 	movabs $0xffff800000109520,%rdx
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
ffff8000001046bc:	48 b8 a0 a9 10 00 00 	movabs $0xffff80000010a9a0,%rax
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
ffff8000001047d4:	48 b8 30 1a 11 00 00 	movabs $0xffff800000111a30,%rax
ffff8000001047db:	80 ff ff 
ffff8000001047de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047e2:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047e5:	83 e0 40             	and    $0x40,%eax
ffff8000001047e8:	85 c0                	test   %eax,%eax
ffff8000001047ea:	74 0e                	je     ffff8000001047fa <number+0x40>
ffff8000001047ec:	48 b8 58 1a 11 00 00 	movabs $0xffff800000111a58,%rax
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
ffff800000104aa5:	48 b8 80 1a 11 00 00 	movabs $0xffff800000111a80,%rax
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
ffff800000104c9e:	48 b8 08 1b 11 00 00 	movabs $0xffff800000111b08,%rax
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
ffff80000010586c:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
ffff800000105873:	80 ff ff 
ffff800000105876:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff80000010587a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010587d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105881:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105885:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
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
ffff8000001058fb:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
ffff800000105902:	80 ff ff 
ffff800000105905:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105909:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010590c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105910:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105914:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
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
ffff80000010598a:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
ffff800000105991:	80 ff ff 
ffff800000105994:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105998:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010599b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010599f:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001059a3:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
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
ffff800000105a1b:	48 ba 30 a9 10 00 00 	movabs $0xffff80000010a930,%rdx
ffff800000105a22:	80 ff ff 
ffff800000105a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105a29:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a2c:	48 ba 38 a9 10 00 00 	movabs $0xffff80000010a938,%rdx
ffff800000105a33:	80 ff ff 
ffff800000105a36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105a3a:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a3d:	48 ba 40 a9 10 00 00 	movabs $0xffff80000010a940,%rdx
ffff800000105a44:	80 ff ff 
ffff800000105a47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a4b:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a4e:	48 ba 50 a9 10 00 00 	movabs $0xffff80000010a950,%rdx
ffff800000105a55:	80 ff ff 
ffff800000105a58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105a5c:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a5f:	48 ba 58 a9 10 00 00 	movabs $0xffff80000010a958,%rdx
ffff800000105a66:	80 ff ff 
ffff800000105a69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105a6d:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a70:	48 ba 60 a9 10 00 00 	movabs $0xffff80000010a960,%rdx
ffff800000105a77:	80 ff ff 
ffff800000105a7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a7e:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a81:	48 ba 68 a9 10 00 00 	movabs $0xffff80000010a968,%rdx
ffff800000105a88:	80 ff ff 
ffff800000105a8b:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000105a8f:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a92:	48 ba 70 a9 10 00 00 	movabs $0xffff80000010a970,%rdx
ffff800000105a99:	80 ff ff 
ffff800000105a9c:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000105aa0:	48 89 02             	mov    %rax,(%rdx)
ffff800000105aa3:	48 ba 78 a9 10 00 00 	movabs $0xffff80000010a978,%rdx
ffff800000105aaa:	80 ff ff 
ffff800000105aad:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000105ab1:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ab4:	48 ba 80 a9 10 00 00 	movabs $0xffff80000010a980,%rdx
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
ffff800000105afb:	48 ba a8 1d 11 00 00 	movabs $0xffff800000111da8,%rdx
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
ffff800000105b56:	48 ba e8 1d 11 00 00 	movabs $0xffff800000111de8,%rdx
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
ffff800000105bb1:	48 ba 20 1e 11 00 00 	movabs $0xffff800000111e20,%rdx
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
ffff800000105c0c:	48 ba 58 1e 11 00 00 	movabs $0xffff800000111e58,%rdx
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
ffff800000105c67:	48 ba 90 1e 11 00 00 	movabs $0xffff800000111e90,%rdx
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
ffff800000105cc2:	48 ba d0 1e 11 00 00 	movabs $0xffff800000111ed0,%rdx
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
ffff800000105d1d:	48 ba 10 1f 11 00 00 	movabs $0xffff800000111f10,%rdx
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
ffff800000105d78:	48 ba 58 1f 11 00 00 	movabs $0xffff800000111f58,%rdx
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
ffff800000105dd3:	48 ba a0 1f 11 00 00 	movabs $0xffff800000111fa0,%rdx
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
ffff800000105e2e:	48 ba e0 1f 11 00 00 	movabs $0xffff800000111fe0,%rdx
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
ffff800000105e89:	48 ba 30 20 11 00 00 	movabs $0xffff800000112030,%rdx
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
ffff800000105ebb:	48 ba 70 20 11 00 00 	movabs $0xffff800000112070,%rdx
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
ffff800000105eec:	48 ba f0 20 11 00 00 	movabs $0xffff8000001120f0,%rdx
ffff800000105ef3:	80 ff ff 
ffff800000105ef6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105efb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f05:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f0c:	80 ff ff 
ffff800000105f0f:	ff d1                	callq  *%rcx
ffff800000105f11:	eb 25                	jmp    ffff800000105f38 <do_invalid_TSS+0xe2>
ffff800000105f13:	48 ba 20 21 11 00 00 	movabs $0xffff800000112120,%rdx
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
ffff800000105f50:	48 ba 58 21 11 00 00 	movabs $0xffff800000112158,%rdx
ffff800000105f57:	80 ff ff 
ffff800000105f5a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f5f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f64:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f69:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f70:	80 ff ff 
ffff800000105f73:	ff d1                	callq  *%rcx
ffff800000105f75:	eb 25                	jmp    ffff800000105f9c <do_invalid_TSS+0x146>
ffff800000105f77:	48 ba 90 21 11 00 00 	movabs $0xffff800000112190,%rdx
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
ffff800000105fa8:	48 ba c0 21 11 00 00 	movabs $0xffff8000001121c0,%rdx
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
ffff800000106003:	48 ba e0 21 11 00 00 	movabs $0xffff8000001121e0,%rdx
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
ffff800000106035:	48 ba 70 20 11 00 00 	movabs $0xffff800000112070,%rdx
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
ffff800000106066:	48 ba f0 20 11 00 00 	movabs $0xffff8000001120f0,%rdx
ffff80000010606d:	80 ff ff 
ffff800000106070:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106075:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010607a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010607f:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106086:	80 ff ff 
ffff800000106089:	ff d1                	callq  *%rcx
ffff80000010608b:	eb 25                	jmp    ffff8000001060b2 <do_segment_not_present+0xe2>
ffff80000010608d:	48 ba 20 21 11 00 00 	movabs $0xffff800000112120,%rdx
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
ffff8000001060ca:	48 ba 58 21 11 00 00 	movabs $0xffff800000112158,%rdx
ffff8000001060d1:	80 ff ff 
ffff8000001060d4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060d9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060de:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060e3:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001060ea:	80 ff ff 
ffff8000001060ed:	ff d1                	callq  *%rcx
ffff8000001060ef:	eb 25                	jmp    ffff800000106116 <do_segment_not_present+0x146>
ffff8000001060f1:	48 ba 90 21 11 00 00 	movabs $0xffff800000112190,%rdx
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
ffff800000106122:	48 ba c0 21 11 00 00 	movabs $0xffff8000001121c0,%rdx
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
ffff80000010617d:	48 ba 28 22 11 00 00 	movabs $0xffff800000112228,%rdx
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
ffff8000001061af:	48 ba 70 20 11 00 00 	movabs $0xffff800000112070,%rdx
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
ffff8000001061e0:	48 ba f0 20 11 00 00 	movabs $0xffff8000001120f0,%rdx
ffff8000001061e7:	80 ff ff 
ffff8000001061ea:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061ef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061f9:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106200:	80 ff ff 
ffff800000106203:	ff d1                	callq  *%rcx
ffff800000106205:	eb 25                	jmp    ffff80000010622c <do_stack_segment_fault+0xe2>
ffff800000106207:	48 ba 20 21 11 00 00 	movabs $0xffff800000112120,%rdx
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
ffff800000106244:	48 ba 58 21 11 00 00 	movabs $0xffff800000112158,%rdx
ffff80000010624b:	80 ff ff 
ffff80000010624e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106253:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106258:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010625d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106264:	80 ff ff 
ffff800000106267:	ff d1                	callq  *%rcx
ffff800000106269:	eb 25                	jmp    ffff800000106290 <do_stack_segment_fault+0x146>
ffff80000010626b:	48 ba 90 21 11 00 00 	movabs $0xffff800000112190,%rdx
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
ffff80000010629c:	48 ba c0 21 11 00 00 	movabs $0xffff8000001121c0,%rdx
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
ffff8000001062f7:	48 ba 70 22 11 00 00 	movabs $0xffff800000112270,%rdx
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
ffff800000106329:	48 ba 70 20 11 00 00 	movabs $0xffff800000112070,%rdx
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
ffff80000010635a:	48 ba f0 20 11 00 00 	movabs $0xffff8000001120f0,%rdx
ffff800000106361:	80 ff ff 
ffff800000106364:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106369:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010636e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106373:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010637a:	80 ff ff 
ffff80000010637d:	ff d1                	callq  *%rcx
ffff80000010637f:	eb 25                	jmp    ffff8000001063a6 <do_general_protection+0xe2>
ffff800000106381:	48 ba 20 21 11 00 00 	movabs $0xffff800000112120,%rdx
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
ffff8000001063be:	48 ba 58 21 11 00 00 	movabs $0xffff800000112158,%rdx
ffff8000001063c5:	80 ff ff 
ffff8000001063c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063cd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063d7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001063de:	80 ff ff 
ffff8000001063e1:	ff d1                	callq  *%rcx
ffff8000001063e3:	eb 25                	jmp    ffff80000010640a <do_general_protection+0x146>
ffff8000001063e5:	48 ba 90 21 11 00 00 	movabs $0xffff800000112190,%rdx
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
ffff800000106416:	48 ba c0 21 11 00 00 	movabs $0xffff8000001121c0,%rdx
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
ffff800000106480:	48 ba b8 22 11 00 00 	movabs $0xffff8000001122b8,%rdx
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
ffff8000001064b2:	48 ba f6 22 11 00 00 	movabs $0xffff8000001122f6,%rdx
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
ffff8000001064e3:	48 ba 09 23 11 00 00 	movabs $0xffff800000112309,%rdx
ffff8000001064ea:	80 ff ff 
ffff8000001064ed:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064fc:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106503:	80 ff ff 
ffff800000106506:	ff d1                	callq  *%rcx
ffff800000106508:	eb 25                	jmp    ffff80000010652f <do_page_fault+0xf1>
ffff80000010650a:	48 ba 1d 23 11 00 00 	movabs $0xffff80000011231d,%rdx
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
ffff80000010653b:	48 ba 30 23 11 00 00 	movabs $0xffff800000112330,%rdx
ffff800000106542:	80 ff ff 
ffff800000106545:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010654a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010654f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106554:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010655b:	80 ff ff 
ffff80000010655e:	ff d1                	callq  *%rcx
ffff800000106560:	eb 25                	jmp    ffff800000106587 <do_page_fault+0x149>
ffff800000106562:	48 ba 42 23 11 00 00 	movabs $0xffff800000112342,%rdx
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
ffff800000106593:	48 ba 5e 23 11 00 00 	movabs $0xffff80000011235e,%rdx
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
ffff8000001065c4:	48 ba 80 23 11 00 00 	movabs $0xffff800000112380,%rdx
ffff8000001065cb:	80 ff ff 
ffff8000001065ce:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065d3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065dd:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001065e4:	80 ff ff 
ffff8000001065e7:	ff d1                	callq  *%rcx
ffff8000001065e9:	48 ba 9f 23 11 00 00 	movabs $0xffff80000011239f,%rdx
ffff8000001065f0:	80 ff ff 
ffff8000001065f3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065f8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065fd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106602:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106609:	80 ff ff 
ffff80000010660c:	ff d1                	callq  *%rcx
ffff80000010660e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106612:	48 89 c1             	mov    %rax,%rcx
ffff800000106615:	48 ba a1 23 11 00 00 	movabs $0xffff8000001123a1,%rdx
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
ffff800000106670:	48 ba b0 23 11 00 00 	movabs $0xffff8000001123b0,%rdx
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
ffff8000001066cb:	48 ba f8 23 11 00 00 	movabs $0xffff8000001123f8,%rdx
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
ffff800000106726:	48 ba 40 24 11 00 00 	movabs $0xffff800000112440,%rdx
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
ffff800000106781:	48 ba 88 24 11 00 00 	movabs $0xffff800000112488,%rdx
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
ffff8000001067dc:	48 ba d0 24 11 00 00 	movabs $0xffff8000001124d0,%rdx
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
ffff800000106e98:	48 ba 20 25 11 00 00 	movabs $0xffff800000112520,%rdx
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
ffff800000106fd4:	48 ba 98 25 11 00 00 	movabs $0xffff800000112598,%rdx
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
ffff80000010711d:	48 ba b8 25 11 00 00 	movabs $0xffff8000001125b8,%rdx
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
ffff8000001077e4:	48 ba e8 25 11 00 00 	movabs $0xffff8000001125e8,%rdx
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
ffff800000107846:	48 ba 20 26 11 00 00 	movabs $0xffff800000112620,%rdx
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
ffff8000001078a8:	48 ba 60 26 11 00 00 	movabs $0xffff800000112660,%rdx
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
ffff800000107958:	48 ba a0 26 11 00 00 	movabs $0xffff8000001126a0,%rdx
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
ffff800000107a72:	48 ba 18 27 11 00 00 	movabs $0xffff800000112718,%rdx
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
ffff800000107b40:	48 ba 74 27 11 00 00 	movabs $0xffff800000112774,%rdx
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
ffff800000107b8b:	48 ba 89 27 11 00 00 	movabs $0xffff800000112789,%rdx
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
ffff800000107beb:	48 ba 9f 27 11 00 00 	movabs $0xffff80000011279f,%rdx
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
ffff800000107cc0:	48 ba b8 27 11 00 00 	movabs $0xffff8000001127b8,%rdx
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
ffff800000107fab:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
ffff800000107fb2:	80 ff ff 
ffff800000107fb5:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000107fb9:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107fbc:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107fc0:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000107fc4:	48 b8 22 99 10 00 00 	movabs $0xffff800000109922,%rax
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
ffff80000010803c:	48 ba 30 a9 10 00 00 	movabs $0xffff80000010a930,%rdx
ffff800000108043:	80 ff ff 
ffff800000108046:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010804a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010804d:	48 ba 38 a9 10 00 00 	movabs $0xffff80000010a938,%rdx
ffff800000108054:	80 ff ff 
ffff800000108057:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010805b:	48 89 02             	mov    %rax,(%rdx)
ffff80000010805e:	48 ba 40 a9 10 00 00 	movabs $0xffff80000010a940,%rdx
ffff800000108065:	80 ff ff 
ffff800000108068:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010806c:	48 89 02             	mov    %rax,(%rdx)
ffff80000010806f:	48 ba 50 a9 10 00 00 	movabs $0xffff80000010a950,%rdx
ffff800000108076:	80 ff ff 
ffff800000108079:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010807d:	48 89 02             	mov    %rax,(%rdx)
ffff800000108080:	48 ba 58 a9 10 00 00 	movabs $0xffff80000010a958,%rdx
ffff800000108087:	80 ff ff 
ffff80000010808a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010808e:	48 89 02             	mov    %rax,(%rdx)
ffff800000108091:	48 ba 60 a9 10 00 00 	movabs $0xffff80000010a960,%rdx
ffff800000108098:	80 ff ff 
ffff80000010809b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010809f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080a2:	48 ba 68 a9 10 00 00 	movabs $0xffff80000010a968,%rdx
ffff8000001080a9:	80 ff ff 
ffff8000001080ac:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff8000001080b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080b3:	48 ba 70 a9 10 00 00 	movabs $0xffff80000010a970,%rdx
ffff8000001080ba:	80 ff ff 
ffff8000001080bd:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff8000001080c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080c4:	48 ba 78 a9 10 00 00 	movabs $0xffff80000010a978,%rdx
ffff8000001080cb:	80 ff ff 
ffff8000001080ce:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff8000001080d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080d5:	48 ba 80 a9 10 00 00 	movabs $0xffff80000010a980,%rdx
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
ffff8000001087f0:	48 ba 60 01 11 00 00 	movabs $0xffff800000110160,%rdx
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
ffff800000108820:	48 ba e0 27 11 00 00 	movabs $0xffff8000001127e0,%rdx
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
ffff80000010893c:	48 ba ed 27 11 00 00 	movabs $0xffff8000001127ed,%rdx
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
ffff80000010897c:	48 ba fd 27 11 00 00 	movabs $0xffff8000001127fd,%rdx
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
ffff8000001089db:	48 ba 10 28 11 00 00 	movabs $0xffff800000112810,%rdx
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
ffff800000108bbf:	48 ba 38 28 11 00 00 	movabs $0xffff800000112838,%rdx
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
ffff800000108c43:	48 ba 30 a9 10 00 00 	movabs $0xffff80000010a930,%rdx
ffff800000108c4a:	80 ff ff 
ffff800000108c4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c51:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c54:	48 ba 38 a9 10 00 00 	movabs $0xffff80000010a938,%rdx
ffff800000108c5b:	80 ff ff 
ffff800000108c5e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108c62:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c65:	48 ba 40 a9 10 00 00 	movabs $0xffff80000010a940,%rdx
ffff800000108c6c:	80 ff ff 
ffff800000108c6f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c73:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c76:	48 ba 50 a9 10 00 00 	movabs $0xffff80000010a950,%rdx
ffff800000108c7d:	80 ff ff 
ffff800000108c80:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108c84:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c87:	48 ba 58 a9 10 00 00 	movabs $0xffff80000010a958,%rdx
ffff800000108c8e:	80 ff ff 
ffff800000108c91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108c95:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c98:	48 ba 60 a9 10 00 00 	movabs $0xffff80000010a960,%rdx
ffff800000108c9f:	80 ff ff 
ffff800000108ca2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108ca6:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ca9:	48 ba 68 a9 10 00 00 	movabs $0xffff80000010a968,%rdx
ffff800000108cb0:	80 ff ff 
ffff800000108cb3:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000108cb7:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cba:	48 ba 70 a9 10 00 00 	movabs $0xffff80000010a970,%rdx
ffff800000108cc1:	80 ff ff 
ffff800000108cc4:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000108cc8:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ccb:	48 ba 78 a9 10 00 00 	movabs $0xffff80000010a978,%rdx
ffff800000108cd2:	80 ff ff 
ffff800000108cd5:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000108cd9:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cdc:	48 ba 80 a9 10 00 00 	movabs $0xffff80000010a980,%rdx
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
ffff800000108cfc:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108d03:	20 57 6f 
ffff800000108d06:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff800000108d0a:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108d11:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108d17:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108d1c:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108d20:	48 89 d7             	mov    %rdx,%rdi
ffff800000108d23:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108d2f <sysexit_return_address>
ffff800000108d2a:	48 89 e1             	mov    %rsp,%rcx
ffff800000108d2d:	0f 34                	sysenter 

ffff800000108d2f <sysexit_return_address>:
ffff800000108d2f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108d33:	eb fe                	jmp    ffff800000108d33 <sysexit_return_address+0x4>

ffff800000108d35 <do_execve>:
ffff800000108d35:	55                   	push   %rbp
ffff800000108d36:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d39:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108d3d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108d41:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d45:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108d4c:	00 
ffff800000108d4d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d51:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108d58:	00 
ffff800000108d59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d5d:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
ffff800000108d64:	01 00 00 00 
ffff800000108d68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d6c:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108d73:	00 
ffff800000108d74:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d78:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108d7f:	00 
ffff800000108d80:	48 ba 5c 28 11 00 00 	movabs $0xffff80000011285c,%rdx
ffff800000108d87:	80 ff ff 
ffff800000108d8a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108d8f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108d94:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d99:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108da0:	80 ff ff 
ffff800000108da3:	ff d1                	callq  *%rcx
ffff800000108da5:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108daa:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108daf:	48 bf f0 8c 10 00 00 	movabs $0xffff800000108cf0,%rdi
ffff800000108db6:	80 ff ff 
ffff800000108db9:	48 b8 8f 8a 10 00 00 	movabs $0xffff800000108a8f,%rax
ffff800000108dc0:	80 ff ff 
ffff800000108dc3:	ff d0                	callq  *%rax
ffff800000108dc5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108dca:	c9                   	leaveq 
ffff800000108dcb:	c3                   	retq   

ffff800000108dcc <init>:
ffff800000108dcc:	55                   	push   %rbp
ffff800000108dcd:	48 89 e5             	mov    %rsp,%rbp
ffff800000108dd0:	53                   	push   %rbx
ffff800000108dd1:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108dd5:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108dd9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ddd:	48 89 c1             	mov    %rax,%rcx
ffff800000108de0:	48 ba 78 28 11 00 00 	movabs $0xffff800000112878,%rdx
ffff800000108de7:	80 ff ff 
ffff800000108dea:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108def:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108df4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108df9:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108e00:	80 ff ff 
ffff800000108e03:	41 ff d0             	callq  *%r8
ffff800000108e06:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e0b:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e12:	80 ff ff 
ffff800000108e15:	ff d2                	callq  *%rdx
ffff800000108e17:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e1b:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff800000108e22:	80 ff ff 
ffff800000108e25:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108e29:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e2e:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e35:	80 ff ff 
ffff800000108e38:	ff d2                	callq  *%rdx
ffff800000108e3a:	48 89 c3             	mov    %rax,%rbx
ffff800000108e3d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e42:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e49:	80 ff ff 
ffff800000108e4c:	ff d2                	callq  *%rdx
ffff800000108e4e:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e52:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
ffff800000108e59:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108e5d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e62:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e69:	80 ff ff 
ffff800000108e6c:	ff d2                	callq  *%rdx
ffff800000108e6e:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e72:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108e76:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108e7a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e7f:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e86:	80 ff ff 
ffff800000108e89:	ff d2                	callq  *%rdx
ffff800000108e8b:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000108e8f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e94:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000108e9b:	80 ff ff 
ffff800000108e9e:	ff d2                	callq  *%rdx
ffff800000108ea0:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000108ea4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ea8:	48 89 c7             	mov    %rax,%rdi
ffff800000108eab:	48 8b 63 10          	mov    0x10(%rbx),%rsp
ffff800000108eaf:	ff 72 08             	pushq  0x8(%rdx)
ffff800000108eb2:	e9 7e fe ff ff       	jmpq   ffff800000108d35 <do_execve>
ffff800000108eb7:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108ebc:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000108ec0:	c9                   	leaveq 
ffff800000108ec1:	c3                   	retq   

ffff800000108ec2 <do_fork>:
ffff800000108ec2:	55                   	push   %rbp
ffff800000108ec3:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ec6:	53                   	push   %rbx
ffff800000108ec7:	48 83 ec 48          	sub    $0x48,%rsp
ffff800000108ecb:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108ecf:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108ed3:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108ed7:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000108edb:	48 ba 9a 28 11 00 00 	movabs $0xffff80000011289a,%rdx
ffff800000108ee2:	80 ff ff 
ffff800000108ee5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108eea:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108eef:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108ef4:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000108efb:	80 ff ff 
ffff800000108efe:	ff d1                	callq  *%rcx
ffff800000108f00:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000108f07:	00 
ffff800000108f08:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000108f0f:	00 
ffff800000108f10:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108f17:	00 
ffff800000108f18:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f1f:	80 ff ff 
ffff800000108f22:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f29:	48 8b 00             	mov    (%rax),%rax
ffff800000108f2c:	48 89 c1             	mov    %rax,%rcx
ffff800000108f2f:	48 ba a9 28 11 00 00 	movabs $0xffff8000001128a9,%rdx
ffff800000108f36:	80 ff ff 
ffff800000108f39:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f3e:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108f43:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f48:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108f4f:	80 ff ff 
ffff800000108f52:	41 ff d0             	callq  *%r8
ffff800000108f55:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000108f5a:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108f5f:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000108f64:	48 b8 1e 7c 10 00 00 	movabs $0xffff800000107c1e,%rax
ffff800000108f6b:	80 ff ff 
ffff800000108f6e:	ff d0                	callq  *%rax
ffff800000108f70:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108f74:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f7b:	80 ff ff 
ffff800000108f7e:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f85:	48 8b 00             	mov    (%rax),%rax
ffff800000108f88:	48 89 c1             	mov    %rax,%rcx
ffff800000108f8b:	48 ba a9 28 11 00 00 	movabs $0xffff8000001128a9,%rdx
ffff800000108f92:	80 ff ff 
ffff800000108f95:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f9a:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108f9f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fa4:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108fab:	80 ff ff 
ffff800000108fae:	41 ff d0             	callq  *%r8
ffff800000108fb1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fb5:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108fb9:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
ffff800000108fc0:	80 ff ff 
ffff800000108fc3:	48 01 d0             	add    %rdx,%rax
ffff800000108fc6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108fca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108fce:	48 89 c1             	mov    %rax,%rcx
ffff800000108fd1:	48 ba c8 28 11 00 00 	movabs $0xffff8000001128c8,%rdx
ffff800000108fd8:	80 ff ff 
ffff800000108fdb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fe0:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108fe5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fea:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108ff1:	80 ff ff 
ffff800000108ff4:	41 ff d0             	callq  *%r8
ffff800000108ff7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ffb:	ba 58 00 00 00       	mov    $0x58,%edx
ffff800000109000:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109005:	48 89 c7             	mov    %rax,%rdi
ffff800000109008:	48 b8 e9 8a 10 00 00 	movabs $0xffff800000108ae9,%rax
ffff80000010900f:	80 ff ff 
ffff800000109012:	ff d0                	callq  *%rax
ffff800000109014:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109019:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000109020:	80 ff ff 
ffff800000109023:	ff d2                	callq  *%rdx
ffff800000109025:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109029:	48 8b 08             	mov    (%rax),%rcx
ffff80000010902c:	48 8b 58 08          	mov    0x8(%rax),%rbx
ffff800000109030:	48 89 0a             	mov    %rcx,(%rdx)
ffff800000109033:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
ffff800000109037:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff80000010903b:	48 8b 58 18          	mov    0x18(%rax),%rbx
ffff80000010903f:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
ffff800000109043:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
ffff800000109047:	48 8b 48 20          	mov    0x20(%rax),%rcx
ffff80000010904b:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff80000010904f:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
ffff800000109053:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
ffff800000109057:	48 8b 48 30          	mov    0x30(%rax),%rcx
ffff80000010905b:	48 8b 58 38          	mov    0x38(%rax),%rbx
ffff80000010905f:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
ffff800000109063:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
ffff800000109067:	48 8b 48 40          	mov    0x40(%rax),%rcx
ffff80000010906b:	48 8b 58 48          	mov    0x48(%rax),%rbx
ffff80000010906f:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
ffff800000109073:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
ffff800000109077:	48 8b 40 50          	mov    0x50(%rax),%rax
ffff80000010907b:	48 89 42 50          	mov    %rax,0x50(%rdx)
ffff80000010907f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109083:	48 89 c7             	mov    %rax,%rdi
ffff800000109086:	48 b8 04 8a 10 00 00 	movabs $0xffff800000108a04,%rax
ffff80000010908d:	80 ff ff 
ffff800000109090:	ff d0                	callq  *%rax
ffff800000109092:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109096:	48 89 c6             	mov    %rax,%rsi
ffff800000109099:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff8000001090a0:	80 ff ff 
ffff8000001090a3:	48 b8 26 8a 10 00 00 	movabs $0xffff800000108a26,%rax
ffff8000001090aa:	80 ff ff 
ffff8000001090ad:	ff d0                	callq  *%rax
ffff8000001090af:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090b3:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001090b7:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001090bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090bf:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001090c3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090c7:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001090ce:	00 
ffff8000001090cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090d3:	48 83 c0 58          	add    $0x58,%rax
ffff8000001090d7:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001090db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090df:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001090e3:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001090e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090eb:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff8000001090f1:	48 89 c1             	mov    %rax,%rcx
ffff8000001090f4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001090f8:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff8000001090fd:	48 89 ce             	mov    %rcx,%rsi
ffff800000109100:	48 89 c7             	mov    %rax,%rdi
ffff800000109103:	48 b8 8f 8a 10 00 00 	movabs $0xffff800000108a8f,%rax
ffff80000010910a:	80 ff ff 
ffff80000010910d:	ff d0                	callq  *%rax
ffff80000010910f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109113:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff80000010911a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010911e:	48 89 10             	mov    %rdx,(%rax)
ffff800000109121:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109125:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff80000010912c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109130:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109134:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109138:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010913f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109143:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000109147:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010914b:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010914f:	83 e0 01             	and    $0x1,%eax
ffff800000109152:	48 85 c0             	test   %rax,%rax
ffff800000109155:	75 28                	jne    ffff80000010917f <do_fork+0x2bd>
ffff800000109157:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff80000010915e:	80 ff ff 
ffff800000109161:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109165:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff80000010916c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109170:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109177:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010917b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010917f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109183:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff80000010918a:	00 
ffff80000010918b:	48 ba ec 28 11 00 00 	movabs $0xffff8000001128ec,%rdx
ffff800000109192:	80 ff ff 
ffff800000109195:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010919a:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010919f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091a4:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001091ab:	80 ff ff 
ffff8000001091ae:	ff d1                	callq  *%rcx
ffff8000001091b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091b5:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001091b9:	c9                   	leaveq 
ffff8000001091ba:	c3                   	retq   

ffff8000001091bb <do_exit>:
ffff8000001091bb:	55                   	push   %rbp
ffff8000001091bc:	48 89 e5             	mov    %rsp,%rbp
ffff8000001091bf:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001091c3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001091c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001091cb:	48 89 c1             	mov    %rax,%rcx
ffff8000001091ce:	48 ba 00 29 11 00 00 	movabs $0xffff800000112900,%rdx
ffff8000001091d5:	80 ff ff 
ffff8000001091d8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001091dd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001091e2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091e7:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001091ee:	80 ff ff 
ffff8000001091f1:	41 ff d0             	callq  *%r8
ffff8000001091f4:	eb fe                	jmp    ffff8000001091f4 <do_exit+0x39>

ffff8000001091f6 <system_call_function>:
ffff8000001091f6:	55                   	push   %rbp
ffff8000001091f7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001091fa:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001091fe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109202:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000109206:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010920d:	48 ba 60 bd 10 00 00 	movabs $0xffff80000010bd60,%rdx
ffff800000109214:	80 ff ff 
ffff800000109217:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff80000010921b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010921f:	48 89 c7             	mov    %rax,%rdi
ffff800000109222:	ff d2                	callq  *%rdx
ffff800000109224:	c9                   	leaveq 
ffff800000109225:	c3                   	retq   

ffff800000109226 <kernel_thread_func>:
ffff800000109226:	41 5f                	pop    %r15
ffff800000109228:	41 5e                	pop    %r14
ffff80000010922a:	41 5d                	pop    %r13
ffff80000010922c:	41 5c                	pop    %r12
ffff80000010922e:	41 5b                	pop    %r11
ffff800000109230:	41 5a                	pop    %r10
ffff800000109232:	41 59                	pop    %r9
ffff800000109234:	41 58                	pop    %r8
ffff800000109236:	5b                   	pop    %rbx
ffff800000109237:	59                   	pop    %rcx
ffff800000109238:	5a                   	pop    %rdx
ffff800000109239:	5e                   	pop    %rsi
ffff80000010923a:	5f                   	pop    %rdi
ffff80000010923b:	5d                   	pop    %rbp
ffff80000010923c:	58                   	pop    %rax
ffff80000010923d:	48 8e d8             	mov    %rax,%ds
ffff800000109240:	58                   	pop    %rax
ffff800000109241:	48 8e c0             	mov    %rax,%es
ffff800000109244:	58                   	pop    %rax
ffff800000109245:	48 83 c4 38          	add    $0x38,%rsp
ffff800000109249:	48 89 d7             	mov    %rdx,%rdi
ffff80000010924c:	ff d3                	callq  *%rbx
ffff80000010924e:	48 89 c7             	mov    %rax,%rdi
ffff800000109251:	e8 65 ff ff ff       	callq  ffff8000001091bb <do_exit>

ffff800000109256 <kernel_thread>:
ffff800000109256:	55                   	push   %rbp
ffff800000109257:	48 89 e5             	mov    %rsp,%rbp
ffff80000010925a:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff800000109261:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
ffff800000109268:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
ffff80000010926f:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
ffff800000109276:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff80000010927d:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109282:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109287:	48 89 c7             	mov    %rax,%rdi
ffff80000010928a:	48 b8 e9 8a 10 00 00 	movabs $0xffff800000108ae9,%rax
ffff800000109291:	80 ff ff 
ffff800000109294:	ff d0                	callq  *%rax
ffff800000109296:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
ffff80000010929d:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff8000001092a1:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
ffff8000001092a8:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff8000001092ac:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
ffff8000001092b3:	00 
ffff8000001092b4:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
ffff8000001092bb:	00 
ffff8000001092bc:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
ffff8000001092c3:	00 
ffff8000001092c4:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
ffff8000001092cb:	00 
ffff8000001092cc:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
ffff8000001092d3:	00 
ffff8000001092d4:	48 b8 26 92 10 00 00 	movabs $0xffff800000109226,%rax
ffff8000001092db:	80 ff ff 
ffff8000001092de:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001092e2:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
ffff8000001092e9:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff8000001092f0:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff8000001092f5:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001092fa:	48 89 c7             	mov    %rax,%rdi
ffff8000001092fd:	48 b8 c2 8e 10 00 00 	movabs $0xffff800000108ec2,%rax
ffff800000109304:	80 ff ff 
ffff800000109307:	ff d0                	callq  *%rax
ffff800000109309:	c9                   	leaveq 
ffff80000010930a:	c3                   	retq   

ffff80000010930b <__switch_to>:
ffff80000010930b:	55                   	push   %rbp
ffff80000010930c:	48 89 e5             	mov    %rsp,%rbp
ffff80000010930f:	53                   	push   %rbx
ffff800000109310:	48 83 ec 18          	sub    $0x18,%rsp
ffff800000109314:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000109318:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff80000010931c:	48 ba 22 29 11 00 00 	movabs $0xffff800000112922,%rdx
ffff800000109323:	80 ff ff 
ffff800000109326:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010932b:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109330:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109335:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010933c:	80 ff ff 
ffff80000010933f:	ff d1                	callq  *%rcx
ffff800000109341:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109345:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109349:	48 8b 00             	mov    (%rax),%rax
ffff80000010934c:	48 ba 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rdx
ffff800000109353:	80 ff ff 
ffff800000109356:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff80000010935a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010935e:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109362:	48 8b 00             	mov    (%rax),%rax
ffff800000109365:	48 89 c1             	mov    %rax,%rcx
ffff800000109368:	48 ba 35 29 11 00 00 	movabs $0xffff800000112935,%rdx
ffff80000010936f:	80 ff ff 
ffff800000109372:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109377:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010937c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109381:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000109388:	80 ff ff 
ffff80000010938b:	41 ff d0             	callq  *%r8
ffff80000010938e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109392:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109396:	48 8b 00             	mov    (%rax),%rax
ffff800000109399:	48 89 c1             	mov    %rax,%rcx
ffff80000010939c:	48 ba 51 29 11 00 00 	movabs $0xffff800000112951,%rdx
ffff8000001093a3:	80 ff ff 
ffff8000001093a6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001093ab:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001093b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093b5:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001093bc:	80 ff ff 
ffff8000001093bf:	41 ff d0             	callq  *%r8
ffff8000001093c2:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001093c9:	80 ff ff 
ffff8000001093cc:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff8000001093d0:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001093d7:	80 ff ff 
ffff8000001093da:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff8000001093de:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001093e5:	80 ff ff 
ffff8000001093e8:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff8000001093ec:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001093f3:	80 ff ff 
ffff8000001093f6:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff8000001093fa:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff800000109401:	80 ff ff 
ffff800000109404:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff800000109408:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff80000010940f:	80 ff ff 
ffff800000109412:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff800000109416:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff80000010941d:	80 ff ff 
ffff800000109420:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff800000109424:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff80000010942b:	80 ff ff 
ffff80000010942e:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff800000109432:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff800000109439:	80 ff ff 
ffff80000010943c:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff800000109440:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff800000109447:	80 ff ff 
ffff80000010944a:	48 8b 40 04          	mov    0x4(%rax),%rax
ffff80000010944e:	41 52                	push   %r10
ffff800000109450:	41 51                	push   %r9
ffff800000109452:	41 50                	push   %r8
ffff800000109454:	57                   	push   %rdi
ffff800000109455:	49 89 d9             	mov    %rbx,%r9
ffff800000109458:	4d 89 d8             	mov    %r11,%r8
ffff80000010945b:	48 89 c7             	mov    %rax,%rdi
ffff80000010945e:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000109465:	80 ff ff 
ffff800000109468:	ff d0                	callq  *%rax
ffff80000010946a:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010946e:	48 ba 6d 29 11 00 00 	movabs $0xffff80000011296d,%rdx
ffff800000109475:	80 ff ff 
ffff800000109478:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010947d:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109482:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109487:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010948e:	80 ff ff 
ffff800000109491:	ff d1                	callq  *%rcx
ffff800000109493:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109497:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010949b:	48 8c e0             	mov    %fs,%rax
ffff80000010949e:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff8000001094a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001094a6:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001094aa:	48 8c e8             	mov    %gs,%rax
ffff8000001094ad:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff8000001094b1:	48 ba 7e 29 11 00 00 	movabs $0xffff80000011297e,%rdx
ffff8000001094b8:	80 ff ff 
ffff8000001094bb:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001094c0:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001094c5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001094ca:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001094d1:	80 ff ff 
ffff8000001094d4:	ff d1                	callq  *%rcx
ffff8000001094d6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001094da:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001094de:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001094e2:	48 8e e8             	mov    %rax,%gs
ffff8000001094e5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001094e9:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001094ed:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001094f1:	48 8e e0             	mov    %rax,%fs
ffff8000001094f4:	48 ba 8f 29 11 00 00 	movabs $0xffff80000011298f,%rdx
ffff8000001094fb:	80 ff ff 
ffff8000001094fe:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109503:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109508:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010950d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000109514:	80 ff ff 
ffff800000109517:	ff d1                	callq  *%rcx
ffff800000109519:	90                   	nop
ffff80000010951a:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010951e:	c9                   	leaveq 
ffff80000010951f:	c3                   	retq   

ffff800000109520 <task_init>:
ffff800000109520:	55                   	push   %rbp
ffff800000109521:	48 89 e5             	mov    %rsp,%rbp
ffff800000109524:	41 56                	push   %r14
ffff800000109526:	41 55                	push   %r13
ffff800000109528:	41 54                	push   %r12
ffff80000010952a:	53                   	push   %rbx
ffff80000010952b:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010952f:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000109536:	00 
ffff800000109537:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff80000010953e:	80 ff ff 
ffff800000109541:	48 8b 00             	mov    (%rax),%rax
ffff800000109544:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010954b:	80 ff ff 
ffff80000010954e:	48 89 02             	mov    %rax,(%rdx)
ffff800000109551:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109558:	80 ff ff 
ffff80000010955b:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000109562:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109569:	80 ff ff 
ffff80000010956c:	48 89 42 08          	mov    %rax,0x8(%rdx)
ffff800000109570:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109577:	80 ff ff 
ffff80000010957a:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
ffff800000109581:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109588:	80 ff ff 
ffff80000010958b:	48 89 42 10          	mov    %rax,0x10(%rdx)
ffff80000010958f:	48 ba 80 98 10 00 00 	movabs $0xffff800000109880,%rdx
ffff800000109596:	80 ff ff 
ffff800000109599:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095a0:	80 ff ff 
ffff8000001095a3:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001095a7:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001095ae:	80 ff ff 
ffff8000001095b1:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
ffff8000001095b8:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff8000001095bf:	80 ff ff 
ffff8000001095c2:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff8000001095c6:	48 ba e0 19 11 00 00 	movabs $0xffff8000001119e0,%rdx
ffff8000001095cd:	80 ff ff 
ffff8000001095d0:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095d7:	80 ff ff 
ffff8000001095da:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001095de:	48 ba a3 29 11 00 00 	movabs $0xffff8000001129a3,%rdx
ffff8000001095e5:	80 ff ff 
ffff8000001095e8:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095ef:	80 ff ff 
ffff8000001095f2:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff8000001095f6:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001095fd:	80 ff ff 
ffff800000109600:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000109607:	00 
ffff800000109608:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010960f:	80 ff ff 
ffff800000109612:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000109619:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109620:	80 ff ff 
ffff800000109623:	48 89 42 40          	mov    %rax,0x40(%rdx)
ffff800000109627:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff80000010962e:	80 ff ff 
ffff800000109631:	48 8b 00             	mov    (%rax),%rax
ffff800000109634:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010963b:	80 ff ff 
ffff80000010963e:	48 89 42 48          	mov    %rax,0x48(%rdx)
ffff800000109642:	be 08 00 00 00       	mov    $0x8,%esi
ffff800000109647:	bf 74 01 00 00       	mov    $0x174,%edi
ffff80000010964c:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff800000109653:	80 ff ff 
ffff800000109656:	ff d0                	callq  *%rax
ffff800000109658:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010965d:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000109664:	80 ff ff 
ffff800000109667:	ff d2                	callq  *%rdx
ffff800000109669:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010966d:	48 8b 00             	mov    (%rax),%rax
ffff800000109670:	48 89 c6             	mov    %rax,%rsi
ffff800000109673:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000109678:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff80000010967f:	80 ff ff 
ffff800000109682:	ff d0                	callq  *%rax
ffff800000109684:	48 b8 27 40 10 00 00 	movabs $0xffff800000104027,%rax
ffff80000010968b:	80 ff ff 
ffff80000010968e:	48 89 c6             	mov    %rax,%rsi
ffff800000109691:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109696:	48 b8 5f 8b 10 00 00 	movabs $0xffff800000108b5f,%rax
ffff80000010969d:	80 ff ff 
ffff8000001096a0:	ff d0                	callq  *%rax
ffff8000001096a2:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096a9:	80 ff ff 
ffff8000001096ac:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff8000001096b0:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096b7:	80 ff ff 
ffff8000001096ba:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff8000001096be:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096c5:	80 ff ff 
ffff8000001096c8:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff8000001096cc:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096d3:	80 ff ff 
ffff8000001096d6:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff8000001096da:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096e1:	80 ff ff 
ffff8000001096e4:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff8000001096e8:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096ef:	80 ff ff 
ffff8000001096f2:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001096f6:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff8000001096fd:	80 ff ff 
ffff800000109700:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff800000109704:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff80000010970b:	80 ff ff 
ffff80000010970e:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff800000109712:	48 b8 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rax
ffff800000109719:	80 ff ff 
ffff80000010971c:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff800000109720:	48 b8 a0 b9 10 00 00 	movabs $0xffff80000010b9a0,%rax
ffff800000109727:	80 ff ff 
ffff80000010972a:	48 8b 00             	mov    (%rax),%rax
ffff80000010972d:	41 52                	push   %r10
ffff80000010972f:	41 51                	push   %r9
ffff800000109731:	41 50                	push   %r8
ffff800000109733:	57                   	push   %rdi
ffff800000109734:	49 89 d9             	mov    %rbx,%r9
ffff800000109737:	4d 89 d8             	mov    %r11,%r8
ffff80000010973a:	48 89 c7             	mov    %rax,%rdi
ffff80000010973d:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000109744:	80 ff ff 
ffff800000109747:	ff d0                	callq  *%rax
ffff800000109749:	48 83 c4 20          	add    $0x20,%rsp
ffff80000010974d:	48 b8 a0 b9 10 00 00 	movabs $0xffff80000010b9a0,%rax
ffff800000109754:	80 ff ff 
ffff800000109757:	48 8b 00             	mov    (%rax),%rax
ffff80000010975a:	48 ba 20 ba 10 00 00 	movabs $0xffff80000010ba20,%rdx
ffff800000109761:	80 ff ff 
ffff800000109764:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000109768:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff80000010976f:	80 ff ff 
ffff800000109772:	48 b8 04 8a 10 00 00 	movabs $0xffff800000108a04,%rax
ffff800000109779:	80 ff ff 
ffff80000010977c:	ff d0                	callq  *%rax
ffff80000010977e:	ba 07 00 00 00       	mov    $0x7,%edx
ffff800000109783:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109788:	48 bf cc 8d 10 00 00 	movabs $0xffff800000108dcc,%rdi
ffff80000010978f:	80 ff ff 
ffff800000109792:	48 b8 56 92 10 00 00 	movabs $0xffff800000109256,%rax
ffff800000109799:	80 ff ff 
ffff80000010979c:	ff d0                	callq  *%rax
ffff80000010979e:	48 b8 00 80 11 00 00 	movabs $0xffff800000118000,%rax
ffff8000001097a5:	80 ff ff 
ffff8000001097a8:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff8000001097af:	00 
ffff8000001097b0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097b5:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001097bc:	80 ff ff 
ffff8000001097bf:	ff d2                	callq  *%rdx
ffff8000001097c1:	48 89 c7             	mov    %rax,%rdi
ffff8000001097c4:	48 b8 69 8a 10 00 00 	movabs $0xffff800000108a69,%rax
ffff8000001097cb:	80 ff ff 
ffff8000001097ce:	ff d0                	callq  *%rax
ffff8000001097d0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001097d4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001097d8:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001097dc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097e1:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001097e8:	80 ff ff 
ffff8000001097eb:	ff d2                	callq  *%rdx
ffff8000001097ed:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001097f1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001097f6:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff8000001097fd:	80 ff ff 
ffff800000109800:	ff d2                	callq  *%rdx
ffff800000109802:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff800000109806:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010980a:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff80000010980e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109812:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109816:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010981b:	48 ba 85 8b 10 00 00 	movabs $0xffff800000108b85,%rdx
ffff800000109822:	80 ff ff 
ffff800000109825:	ff d2                	callq  *%rdx
ffff800000109827:	48 89 c2             	mov    %rax,%rdx
ffff80000010982a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010982e:	48 89 d7             	mov    %rdx,%rdi
ffff800000109831:	48 89 c6             	mov    %rax,%rsi
ffff800000109834:	55                   	push   %rbp
ffff800000109835:	50                   	push   %rax
ffff800000109836:	48 89 63 10          	mov    %rsp,0x10(%rbx)
ffff80000010983a:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff80000010983f:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff800000109853 <task_init+0x333>
ffff800000109846:	49 89 46 08          	mov    %rax,0x8(%r14)
ffff80000010984a:	41 ff 75 08          	pushq  0x8(%r13)
ffff80000010984e:	e9 b8 fa ff ff       	jmpq   ffff80000010930b <__switch_to>
ffff800000109853:	58                   	pop    %rax
ffff800000109854:	5d                   	pop    %rbp
ffff800000109855:	90                   	nop
ffff800000109856:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
ffff80000010985a:	5b                   	pop    %rbx
ffff80000010985b:	41 5c                	pop    %r12
ffff80000010985d:	41 5d                	pop    %r13
ffff80000010985f:	41 5e                	pop    %r14
ffff800000109861:	5d                   	pop    %rbp
ffff800000109862:	c3                   	retq   

Disassembly of section .data:

ffff800000109880 <GDT_Table>:
	...
ffff80000010988c:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
ffff800000109892:	00 00                	add    %al,(%rax)
ffff800000109894:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
ffff8000001098aa:	00 00                	add    %al,(%rax)
ffff8000001098ac:	00 f8                	add    %bh,%al
ffff8000001098ae:	20 00                	and    %al,(%rax)
ffff8000001098b0:	00 00                	add    %al,(%rax)
ffff8000001098b2:	00 00                	add    %al,(%rax)
ffff8000001098b4:	00 f2                	add    %dh,%dl
ffff8000001098b6:	00 00                	add    %al,(%rax)
ffff8000001098b8:	ff                   	(bad)  
ffff8000001098b9:	ff 00                	incl   (%rax)
ffff8000001098bb:	00 00                	add    %al,(%rax)
ffff8000001098bd:	9a                   	(bad)  
ffff8000001098be:	cf                   	iret   
ffff8000001098bf:	00 ff                	add    %bh,%bh
ffff8000001098c1:	ff 00                	incl   (%rax)
ffff8000001098c3:	00 00                	add    %al,(%rax)
ffff8000001098c5:	92                   	xchg   %eax,%edx
ffff8000001098c6:	cf                   	iret   
	...

ffff800000109918 <GDT_END>:
ffff800000109918:	97                   	xchg   %eax,%edi
	...

ffff80000010991a <GDT_BASE>:
ffff80000010991a:	80 98 10 00 00 80 ff 	sbbb   $0xff,-0x7ffffff0(%rax)
ffff800000109921:	ff                 	incl   (%rax)

ffff800000109922 <IDT_Table>:
	...

ffff80000010a922 <IDT_END>:
ffff80000010a922:	ff 0f                	decl   (%rdi)

ffff80000010a924 <IDT_BASE>:
ffff80000010a924:	22 99 10 00 00 80    	and    -0x7ffffff0(%rcx),%bl
ffff80000010a92a:	ff                   	(bad)  
ffff80000010a92b:	ff                 	incl   (%rax)

ffff80000010a92c <TSS64_Table>:
	...

ffff80000010a994 <TSS64_END>:
ffff80000010a994:	67 00            	add    %ch,(%ecx,%ebp,4)

ffff80000010a996 <TSS64_BASE>:
ffff80000010a996:	2c a9                	sub    $0xa9,%al
ffff80000010a998:	10 00                	adc    %al,(%rax)
ffff80000010a99a:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff80000010a9a0 <font_ascii>:
	...
ffff80000010abb0:	00 10                	add    %dl,(%rax)
ffff80000010abb2:	10 10                	adc    %dl,(%rax)
ffff80000010abb4:	10 10                	adc    %dl,(%rax)
ffff80000010abb6:	10 10                	adc    %dl,(%rax)
ffff80000010abb8:	10 10                	adc    %dl,(%rax)
ffff80000010abba:	00 00                	add    %al,(%rax)
ffff80000010abbc:	10 10                	adc    %dl,(%rax)
ffff80000010abbe:	00 00                	add    %al,(%rax)
ffff80000010abc0:	28 28                	sub    %ch,(%rax)
ffff80000010abc2:	28 00                	sub    %al,(%rax)
	...
ffff80000010abd0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010abd4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010abd8:	44                   	rex.R
ffff80000010abd9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010abde:	00 00                	add    %al,(%rax)
ffff80000010abe0:	10 3a                	adc    %bh,(%rdx)
ffff80000010abe2:	56                   	push   %rsi
ffff80000010abe3:	92                   	xchg   %eax,%edx
ffff80000010abe4:	92                   	xchg   %eax,%edx
ffff80000010abe5:	90                   	nop
ffff80000010abe6:	50                   	push   %rax
ffff80000010abe7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010abea:	92                   	xchg   %eax,%edx
ffff80000010abeb:	92                   	xchg   %eax,%edx
ffff80000010abec:	d4                   	(bad)  
ffff80000010abed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010abf2:	94                   	xchg   %eax,%esp
ffff80000010abf3:	94                   	xchg   %eax,%esp
ffff80000010abf4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010abf9:	2c 52                	sub    $0x52,%al
ffff80000010abfb:	52                   	push   %rdx
ffff80000010abfc:	92                   	xchg   %eax,%edx
ffff80000010abfd:	8c 00                	mov    %es,(%rax)
ffff80000010abff:	00 00                	add    %al,(%rax)
ffff80000010ac01:	70 88                	jo     ffff80000010ab8b <font_ascii+0x1eb>
ffff80000010ac03:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010ac09:	92                   	xchg   %eax,%edx
ffff80000010ac0a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010ac11:	08 10                	or     %dl,(%rax)
	...
ffff80000010ac1f:	00 02                	add    %al,(%rdx)
ffff80000010ac21:	04 08                	add    $0x8,%al
ffff80000010ac23:	08 10                	or     %dl,(%rax)
ffff80000010ac25:	10 10                	adc    %dl,(%rax)
ffff80000010ac27:	10 10                	adc    %dl,(%rax)
ffff80000010ac29:	10 10                	adc    %dl,(%rax)
ffff80000010ac2b:	08 08                	or     %cl,(%rax)
ffff80000010ac2d:	04 02                	add    $0x2,%al
ffff80000010ac2f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010ac35:	10 10                	adc    %dl,(%rax)
ffff80000010ac37:	10 10                	adc    %dl,(%rax)
ffff80000010ac39:	10 10                	adc    %dl,(%rax)
ffff80000010ac3b:	20 20                	and    %ah,(%rax)
ffff80000010ac3d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ac41:	00 00                	add    %al,(%rax)
ffff80000010ac43:	00 00                	add    %al,(%rax)
ffff80000010ac45:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010ac4b:	10 00                	adc    %al,(%rax)
	...
ffff80000010ac55:	10 10                	adc    %dl,(%rax)
ffff80000010ac57:	10 fe                	adc    %bh,%dh
ffff80000010ac59:	10 10                	adc    %dl,(%rax)
ffff80000010ac5b:	10 00                	adc    %al,(%rax)
	...
ffff80000010ac69:	00 00                	add    %al,(%rax)
ffff80000010ac6b:	18 18                	sbb    %bl,(%rax)
ffff80000010ac6d:	08 08                	or     %cl,(%rax)
ffff80000010ac6f:	10 00                	adc    %al,(%rax)
ffff80000010ac71:	00 00                	add    %al,(%rax)
ffff80000010ac73:	00 00                	add    %al,(%rax)
ffff80000010ac75:	00 00                	add    %al,(%rax)
ffff80000010ac77:	00 fe                	add    %bh,%dh
	...
ffff80000010ac89:	00 00                	add    %al,(%rax)
ffff80000010ac8b:	00 18                	add    %bl,(%rax)
ffff80000010ac8d:	18 00                	sbb    %al,(%rax)
ffff80000010ac8f:	00 02                	add    %al,(%rdx)
ffff80000010ac91:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010ac94:	08 08                	or     %cl,(%rax)
ffff80000010ac96:	08 10                	or     %dl,(%rax)
ffff80000010ac98:	10 20                	adc    %ah,(%rax)
ffff80000010ac9a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010ac9d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010aca4:	42 
ffff80000010aca5:	42                   	rex.X
ffff80000010aca6:	42                   	rex.X
ffff80000010aca7:	42                   	rex.X
ffff80000010aca8:	42                   	rex.X
ffff80000010aca9:	42                   	rex.X
ffff80000010acaa:	42 24 24             	rex.X and $0x24,%al
ffff80000010acad:	18 00                	sbb    %al,(%rax)
ffff80000010acaf:	00 00                	add    %al,(%rax)
ffff80000010acb1:	08 18                	or     %bl,(%rax)
ffff80000010acb3:	28 08                	sub    %cl,(%rax)
ffff80000010acb5:	08 08                	or     %cl,(%rax)
ffff80000010acb7:	08 08                	or     %cl,(%rax)
ffff80000010acb9:	08 08                	or     %cl,(%rax)
ffff80000010acbb:	08 08                	or     %cl,(%rax)
ffff80000010acbd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010acc0:	00 18                	add    %bl,(%rax)
ffff80000010acc2:	24 42                	and    $0x42,%al
ffff80000010acc4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010acc8:	10 20                	adc    %ah,(%rax)
ffff80000010acca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010accd:	7e 00                	jle    ffff80000010accf <font_ascii+0x32f>
ffff80000010accf:	00 00                	add    %al,(%rax)
ffff80000010acd1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010acd4:	02 02                	add    (%rdx),%al
ffff80000010acd6:	04 18                	add    $0x18,%al
ffff80000010acd8:	04 02                	add    $0x2,%al
ffff80000010acda:	02 42 24             	add    0x24(%rdx),%al
ffff80000010acdd:	18 00                	sbb    %al,(%rax)
ffff80000010acdf:	00 00                	add    %al,(%rax)
ffff80000010ace1:	0c 0c                	or     $0xc,%al
ffff80000010ace3:	0c 14                	or     $0x14,%al
ffff80000010ace5:	14 14                	adc    $0x14,%al
ffff80000010ace7:	24 24                	and    $0x24,%al
ffff80000010ace9:	44 7e 04             	rex.R jle ffff80000010acf0 <font_ascii+0x350>
ffff80000010acec:	04 1e                	add    $0x1e,%al
ffff80000010acee:	00 00                	add    %al,(%rax)
ffff80000010acf0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010acf4:	40 58                	rex pop %rax
ffff80000010acf6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010acf9:	02 02                	add    (%rdx),%al
ffff80000010acfb:	42 24 18             	rex.X and $0x18,%al
ffff80000010acfe:	00 00                	add    %al,(%rax)
ffff80000010ad00:	00 18                	add    %bl,(%rax)
ffff80000010ad02:	24 42                	and    $0x42,%al
ffff80000010ad04:	40 58                	rex pop %rax
ffff80000010ad06:	64 42                	fs rex.X
ffff80000010ad08:	42                   	rex.X
ffff80000010ad09:	42                   	rex.X
ffff80000010ad0a:	42                   	rex.X
ffff80000010ad0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ad0e:	00 00                	add    %al,(%rax)
ffff80000010ad10:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010ad13:	42 04 04             	rex.X add $0x4,%al
ffff80000010ad16:	08 08                	or     %cl,(%rax)
ffff80000010ad18:	08 10                	or     %dl,(%rax)
ffff80000010ad1a:	10 10                	adc    %dl,(%rax)
ffff80000010ad1c:	10 38                	adc    %bh,(%rax)
ffff80000010ad1e:	00 00                	add    %al,(%rax)
ffff80000010ad20:	00 18                	add    %bl,(%rax)
ffff80000010ad22:	24 42                	and    $0x42,%al
ffff80000010ad24:	42                   	rex.X
ffff80000010ad25:	42 24 18             	rex.X and $0x18,%al
ffff80000010ad28:	24 42                	and    $0x42,%al
ffff80000010ad2a:	42                   	rex.X
ffff80000010ad2b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ad2e:	00 00                	add    %al,(%rax)
ffff80000010ad30:	00 18                	add    %bl,(%rax)
ffff80000010ad32:	24 42                	and    $0x42,%al
ffff80000010ad34:	42                   	rex.X
ffff80000010ad35:	42                   	rex.X
ffff80000010ad36:	42                   	rex.X
ffff80000010ad37:	42                   	rex.X
ffff80000010ad38:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010ad3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ad3e:	00 00                	add    %al,(%rax)
ffff80000010ad40:	00 00                	add    %al,(%rax)
ffff80000010ad42:	00 00                	add    %al,(%rax)
ffff80000010ad44:	00 18                	add    %bl,(%rax)
ffff80000010ad46:	18 00                	sbb    %al,(%rax)
ffff80000010ad48:	00 00                	add    %al,(%rax)
ffff80000010ad4a:	00 00                	add    %al,(%rax)
ffff80000010ad4c:	18 18                	sbb    %bl,(%rax)
ffff80000010ad4e:	00 00                	add    %al,(%rax)
ffff80000010ad50:	00 00                	add    %al,(%rax)
ffff80000010ad52:	00 00                	add    %al,(%rax)
ffff80000010ad54:	00 18                	add    %bl,(%rax)
ffff80000010ad56:	18 00                	sbb    %al,(%rax)
ffff80000010ad58:	00 00                	add    %al,(%rax)
ffff80000010ad5a:	00 18                	add    %bl,(%rax)
ffff80000010ad5c:	18 08                	sbb    %cl,(%rax)
ffff80000010ad5e:	08 10                	or     %dl,(%rax)
ffff80000010ad60:	00 02                	add    %al,(%rdx)
ffff80000010ad62:	04 08                	add    $0x8,%al
ffff80000010ad64:	10 20                	adc    %ah,(%rax)
ffff80000010ad66:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ad6d:	04 
ffff80000010ad6e:	02 00                	add    (%rax),%al
ffff80000010ad70:	00 00                	add    %al,(%rax)
ffff80000010ad72:	00 00                	add    %al,(%rax)
ffff80000010ad74:	00 00                	add    %al,(%rax)
ffff80000010ad76:	fe 00                	incb   (%rax)
ffff80000010ad78:	00 fe                	add    %bh,%dh
ffff80000010ad7a:	00 00                	add    %al,(%rax)
ffff80000010ad7c:	00 00                	add    %al,(%rax)
ffff80000010ad7e:	00 00                	add    %al,(%rax)
ffff80000010ad80:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ad86:	04 02                	add    $0x2,%al
ffff80000010ad88:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ad8b:	10 20                	adc    %ah,(%rax)
ffff80000010ad8d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ad91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ad95:	82                   	(bad)  
ffff80000010ad96:	04 08                	add    $0x8,%al
ffff80000010ad98:	10 10                	adc    %dl,(%rax)
ffff80000010ad9a:	00 00                	add    %al,(%rax)
ffff80000010ad9c:	18 18                	sbb    %bl,(%rax)
ffff80000010ad9e:	00 00                	add    %al,(%rax)
ffff80000010ada0:	00 38                	add    %bh,(%rax)
ffff80000010ada2:	44 82                	rex.R (bad) 
ffff80000010ada4:	9a                   	(bad)  
ffff80000010ada5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ada6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ada7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ada8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010ada9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010adaa:	9c                   	pushfq 
ffff80000010adab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010adaf:	00 00                	add    %al,(%rax)
ffff80000010adb1:	18 18                	sbb    %bl,(%rax)
ffff80000010adb3:	18 18                	sbb    %bl,(%rax)
ffff80000010adb5:	24 24                	and    $0x24,%al
ffff80000010adb7:	24 24                	and    $0x24,%al
ffff80000010adb9:	7e 42                	jle    ffff80000010adfd <font_ascii+0x45d>
ffff80000010adbb:	42                   	rex.X
ffff80000010adbc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010adbf:	00 00                	add    %al,(%rax)
ffff80000010adc1:	f0 48                	lock rex.W
ffff80000010adc3:	44                   	rex.R
ffff80000010adc4:	44                   	rex.R
ffff80000010adc5:	44                   	rex.R
ffff80000010adc6:	48 78 44             	rex.W js ffff80000010ae0d <font_ascii+0x46d>
ffff80000010adc9:	42                   	rex.X
ffff80000010adca:	42                   	rex.X
ffff80000010adcb:	42                   	rex.X
ffff80000010adcc:	44 f8                	rex.R clc 
ffff80000010adce:	00 00                	add    %al,(%rax)
ffff80000010add0:	00 3a                	add    %bh,(%rdx)
ffff80000010add2:	46                   	rex.RX
ffff80000010add3:	42 82                	rex.X (bad) 
ffff80000010add5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010addc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010addf:	00 00                	add    %al,(%rax)
ffff80000010ade1:	f8                   	clc    
ffff80000010ade2:	44                   	rex.R
ffff80000010ade3:	44                   	rex.R
ffff80000010ade4:	42                   	rex.X
ffff80000010ade5:	42                   	rex.X
ffff80000010ade6:	42                   	rex.X
ffff80000010ade7:	42                   	rex.X
ffff80000010ade8:	42                   	rex.X
ffff80000010ade9:	42                   	rex.X
ffff80000010adea:	42                   	rex.X
ffff80000010adeb:	44                   	rex.R
ffff80000010adec:	44 f8                	rex.R clc 
ffff80000010adee:	00 00                	add    %al,(%rax)
ffff80000010adf0:	00 fe                	add    %bh,%dh
ffff80000010adf2:	42                   	rex.X
ffff80000010adf3:	42                   	rex.X
ffff80000010adf4:	40                   	rex
ffff80000010adf5:	40                   	rex
ffff80000010adf6:	44 7c 44             	rex.R jl ffff80000010ae3d <font_ascii+0x49d>
ffff80000010adf9:	40                   	rex
ffff80000010adfa:	40                   	rex
ffff80000010adfb:	42                   	rex.X
ffff80000010adfc:	42 fe 00             	rex.X incb (%rax)
ffff80000010adff:	00 00                	add    %al,(%rax)
ffff80000010ae01:	fe 42 42             	incb   0x42(%rdx)
ffff80000010ae04:	40                   	rex
ffff80000010ae05:	40                   	rex
ffff80000010ae06:	44 7c 44             	rex.R jl ffff80000010ae4d <font_ascii+0x4ad>
ffff80000010ae09:	44                   	rex.R
ffff80000010ae0a:	40                   	rex
ffff80000010ae0b:	40                   	rex
ffff80000010ae0c:	40                   	rex
ffff80000010ae0d:	f0 00 00             	lock add %al,(%rax)
ffff80000010ae10:	00 3a                	add    %bh,(%rdx)
ffff80000010ae12:	46                   	rex.RX
ffff80000010ae13:	42 82                	rex.X (bad) 
ffff80000010ae15:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010ae1c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010ae1f:	00 00                	add    %al,(%rax)
ffff80000010ae21:	e7 42                	out    %eax,$0x42
ffff80000010ae23:	42                   	rex.X
ffff80000010ae24:	42                   	rex.X
ffff80000010ae25:	42                   	rex.X
ffff80000010ae26:	42 7e 42             	rex.X jle ffff80000010ae6b <font_ascii+0x4cb>
ffff80000010ae29:	42                   	rex.X
ffff80000010ae2a:	42                   	rex.X
ffff80000010ae2b:	42                   	rex.X
ffff80000010ae2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae2f:	00 00                	add    %al,(%rax)
ffff80000010ae31:	7c 10                	jl     ffff80000010ae43 <font_ascii+0x4a3>
ffff80000010ae33:	10 10                	adc    %dl,(%rax)
ffff80000010ae35:	10 10                	adc    %dl,(%rax)
ffff80000010ae37:	10 10                	adc    %dl,(%rax)
ffff80000010ae39:	10 10                	adc    %dl,(%rax)
ffff80000010ae3b:	10 10                	adc    %dl,(%rax)
ffff80000010ae3d:	7c 00                	jl     ffff80000010ae3f <font_ascii+0x49f>
ffff80000010ae3f:	00 00                	add    %al,(%rax)
ffff80000010ae41:	1f                   	(bad)  
ffff80000010ae42:	04 04                	add    $0x4,%al
ffff80000010ae44:	04 04                	add    $0x4,%al
ffff80000010ae46:	04 04                	add    $0x4,%al
ffff80000010ae48:	04 04                	add    $0x4,%al
ffff80000010ae4a:	04 04                	add    $0x4,%al
ffff80000010ae4c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010ae4f:	00 00                	add    %al,(%rax)
ffff80000010ae51:	e7 42                	out    %eax,$0x42
ffff80000010ae53:	44                   	rex.R
ffff80000010ae54:	48 50                	rex.W push %rax
ffff80000010ae56:	50                   	push   %rax
ffff80000010ae57:	60                   	(bad)  
ffff80000010ae58:	50                   	push   %rax
ffff80000010ae59:	50                   	push   %rax
ffff80000010ae5a:	48                   	rex.W
ffff80000010ae5b:	44                   	rex.R
ffff80000010ae5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae5f:	00 00                	add    %al,(%rax)
ffff80000010ae61:	f0 40                	lock rex
ffff80000010ae63:	40                   	rex
ffff80000010ae64:	40                   	rex
ffff80000010ae65:	40                   	rex
ffff80000010ae66:	40                   	rex
ffff80000010ae67:	40                   	rex
ffff80000010ae68:	40                   	rex
ffff80000010ae69:	40                   	rex
ffff80000010ae6a:	40                   	rex
ffff80000010ae6b:	42                   	rex.X
ffff80000010ae6c:	42 fe 00             	rex.X incb (%rax)
ffff80000010ae6f:	00 00                	add    %al,(%rax)
ffff80000010ae71:	c3                   	retq   
ffff80000010ae72:	42                   	rex.X
ffff80000010ae73:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010ae77:	5a                   	pop    %rdx
ffff80000010ae78:	5a                   	pop    %rdx
ffff80000010ae79:	42                   	rex.X
ffff80000010ae7a:	42                   	rex.X
ffff80000010ae7b:	42                   	rex.X
ffff80000010ae7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ae7f:	00 00                	add    %al,(%rax)
ffff80000010ae81:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010ae88:	4a                   	rex.WX
ffff80000010ae89:	4a                   	rex.WX
ffff80000010ae8a:	4a                   	rex.WX
ffff80000010ae8b:	46                   	rex.RX
ffff80000010ae8c:	46 e2 00             	rex.RX loop ffff80000010ae8f <font_ascii+0x4ef>
ffff80000010ae8f:	00 00                	add    %al,(%rax)
ffff80000010ae91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ae95:	82                   	(bad)  
ffff80000010ae96:	82                   	(bad)  
ffff80000010ae97:	82                   	(bad)  
ffff80000010ae98:	82                   	(bad)  
ffff80000010ae99:	82                   	(bad)  
ffff80000010ae9a:	82                   	(bad)  
ffff80000010ae9b:	82                   	(bad)  
ffff80000010ae9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ae9f:	00 00                	add    %al,(%rax)
ffff80000010aea1:	f8                   	clc    
ffff80000010aea2:	44                   	rex.R
ffff80000010aea3:	42                   	rex.X
ffff80000010aea4:	42                   	rex.X
ffff80000010aea5:	42                   	rex.X
ffff80000010aea6:	44 78 40             	rex.R js ffff80000010aee9 <font_ascii+0x549>
ffff80000010aea9:	40                   	rex
ffff80000010aeaa:	40                   	rex
ffff80000010aeab:	40                   	rex
ffff80000010aeac:	40                   	rex
ffff80000010aead:	f0 00 00             	lock add %al,(%rax)
ffff80000010aeb0:	00 38                	add    %bh,(%rax)
ffff80000010aeb2:	44 82                	rex.R (bad) 
ffff80000010aeb4:	82                   	(bad)  
ffff80000010aeb5:	82                   	(bad)  
ffff80000010aeb6:	82                   	(bad)  
ffff80000010aeb7:	82                   	(bad)  
ffff80000010aeb8:	82                   	(bad)  
ffff80000010aeb9:	82                   	(bad)  
ffff80000010aeba:	92                   	xchg   %eax,%edx
ffff80000010aebb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010aebf:	00 00                	add    %al,(%rax)
ffff80000010aec1:	fc                   	cld    
ffff80000010aec2:	42                   	rex.X
ffff80000010aec3:	42                   	rex.X
ffff80000010aec4:	42                   	rex.X
ffff80000010aec5:	42 7c 44             	rex.X jl ffff80000010af0c <font_ascii+0x56c>
ffff80000010aec8:	42                   	rex.X
ffff80000010aec9:	42                   	rex.X
ffff80000010aeca:	42                   	rex.X
ffff80000010aecb:	42                   	rex.X
ffff80000010aecc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010aecf:	00 00                	add    %al,(%rax)
ffff80000010aed1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010aed4:	82                   	(bad)  
ffff80000010aed5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010aed9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010aedf:	00 00                	add    %al,(%rax)
ffff80000010aee1:	fe                   	(bad)  
ffff80000010aee2:	92                   	xchg   %eax,%edx
ffff80000010aee3:	92                   	xchg   %eax,%edx
ffff80000010aee4:	10 10                	adc    %dl,(%rax)
ffff80000010aee6:	10 10                	adc    %dl,(%rax)
ffff80000010aee8:	10 10                	adc    %dl,(%rax)
ffff80000010aeea:	10 10                	adc    %dl,(%rax)
ffff80000010aeec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010aef0:	00 e7                	add    %ah,%bh
ffff80000010aef2:	42                   	rex.X
ffff80000010aef3:	42                   	rex.X
ffff80000010aef4:	42                   	rex.X
ffff80000010aef5:	42                   	rex.X
ffff80000010aef6:	42                   	rex.X
ffff80000010aef7:	42                   	rex.X
ffff80000010aef8:	42                   	rex.X
ffff80000010aef9:	42                   	rex.X
ffff80000010aefa:	42                   	rex.X
ffff80000010aefb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010aefe:	00 00                	add    %al,(%rax)
ffff80000010af00:	00 e7                	add    %ah,%bh
ffff80000010af02:	42                   	rex.X
ffff80000010af03:	42                   	rex.X
ffff80000010af04:	42                   	rex.X
ffff80000010af05:	42 24 24             	rex.X and $0x24,%al
ffff80000010af08:	24 24                	and    $0x24,%al
ffff80000010af0a:	18 18                	sbb    %bl,(%rax)
ffff80000010af0c:	18 18                	sbb    %bl,(%rax)
ffff80000010af0e:	00 00                	add    %al,(%rax)
ffff80000010af10:	00 e7                	add    %ah,%bh
ffff80000010af12:	42                   	rex.X
ffff80000010af13:	42                   	rex.X
ffff80000010af14:	42 5a                	rex.X pop %rdx
ffff80000010af16:	5a                   	pop    %rdx
ffff80000010af17:	5a                   	pop    %rdx
ffff80000010af18:	5a                   	pop    %rdx
ffff80000010af19:	24 24                	and    $0x24,%al
ffff80000010af1b:	24 24                	and    $0x24,%al
ffff80000010af1d:	24 00                	and    $0x0,%al
ffff80000010af1f:	00 00                	add    %al,(%rax)
ffff80000010af21:	e7 42                	out    %eax,$0x42
ffff80000010af23:	42 24 24             	rex.X and $0x24,%al
ffff80000010af26:	24 18                	and    $0x18,%al
ffff80000010af28:	24 24                	and    $0x24,%al
ffff80000010af2a:	24 42                	and    $0x42,%al
ffff80000010af2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010af2f:	00 00                	add    %al,(%rax)
ffff80000010af31:	ee                   	out    %al,(%dx)
ffff80000010af32:	44                   	rex.R
ffff80000010af33:	44                   	rex.R
ffff80000010af34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010af37:	28 10                	sub    %dl,(%rax)
ffff80000010af39:	10 10                	adc    %dl,(%rax)
ffff80000010af3b:	10 10                	adc    %dl,(%rax)
ffff80000010af3d:	7c 00                	jl     ffff80000010af3f <font_ascii+0x59f>
ffff80000010af3f:	00 00                	add    %al,(%rax)
ffff80000010af41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010af48:	20 20                	and    %ah,(%rax)
ffff80000010af4a:	40                   	rex
ffff80000010af4b:	42 82                	rex.X (bad) 
ffff80000010af4d:	fe 00                	incb   (%rax)
ffff80000010af4f:	00 00                	add    %al,(%rax)
ffff80000010af51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010af54:	20 20                	and    %ah,(%rax)
ffff80000010af56:	20 20                	and    %ah,(%rax)
ffff80000010af58:	20 20                	and    %ah,(%rax)
ffff80000010af5a:	20 20                	and    %ah,(%rax)
ffff80000010af5c:	20 20                	and    %ah,(%rax)
ffff80000010af5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010af65:	20 20                	and    %ah,(%rax)
ffff80000010af67:	10 10                	adc    %dl,(%rax)
ffff80000010af69:	08 08                	or     %cl,(%rax)
ffff80000010af6b:	04 04                	add    $0x4,%al
ffff80000010af6d:	04 02                	add    $0x2,%al
ffff80000010af6f:	02 00                	add    (%rax),%al
ffff80000010af71:	7c 04                	jl     ffff80000010af77 <font_ascii+0x5d7>
ffff80000010af73:	04 04                	add    $0x4,%al
ffff80000010af75:	04 04                	add    $0x4,%al
ffff80000010af77:	04 04                	add    $0x4,%al
ffff80000010af79:	04 04                	add    $0x4,%al
ffff80000010af7b:	04 04                	add    $0x4,%al
ffff80000010af7d:	04 7c                	add    $0x7c,%al
ffff80000010af7f:	00 00                	add    %al,(%rax)
ffff80000010af81:	10 28                	adc    %ch,(%rax)
ffff80000010af83:	44 82                	rex.R (bad) 
	...
ffff80000010af9d:	00 fe                	add    %bh,%dh
ffff80000010af9f:	00 10                	add    %dl,(%rax)
ffff80000010afa1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010afb4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010afb7:	04 3c                	add    $0x3c,%al
ffff80000010afb9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010afc0:	c0 
ffff80000010afc1:	40                   	rex
ffff80000010afc2:	40                   	rex
ffff80000010afc3:	40                   	rex
ffff80000010afc4:	40 58                	rex pop %rax
ffff80000010afc6:	64 42                	fs rex.X
ffff80000010afc8:	42                   	rex.X
ffff80000010afc9:	42                   	rex.X
ffff80000010afca:	42                   	rex.X
ffff80000010afcb:	42                   	rex.X
ffff80000010afcc:	64 58                	fs pop %rax
ffff80000010afce:	00 00                	add    %al,(%rax)
ffff80000010afd0:	00 00                	add    %al,(%rax)
ffff80000010afd2:	00 00                	add    %al,(%rax)
ffff80000010afd4:	00 30                	add    %dh,(%rax)
ffff80000010afd6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010afdd:	38 
ffff80000010afde:	00 00                	add    %al,(%rax)
ffff80000010afe0:	0c 04                	or     $0x4,%al
ffff80000010afe2:	04 04                	add    $0x4,%al
ffff80000010afe4:	04 34                	add    $0x34,%al
ffff80000010afe6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010afed:	36 
ffff80000010afee:	00 00                	add    %al,(%rax)
ffff80000010aff0:	00 00                	add    %al,(%rax)
ffff80000010aff2:	00 00                	add    %al,(%rax)
ffff80000010aff4:	00 38                	add    %bh,(%rax)
ffff80000010aff6:	44 82                	rex.R (bad) 
ffff80000010aff8:	82                   	(bad)  
ffff80000010aff9:	fc                   	cld    
ffff80000010affa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010b001:	10 10                	adc    %dl,(%rax)
ffff80000010b003:	10 10                	adc    %dl,(%rax)
ffff80000010b005:	7c 10                	jl     ffff80000010b017 <font_ascii+0x677>
ffff80000010b007:	10 10                	adc    %dl,(%rax)
ffff80000010b009:	10 10                	adc    %dl,(%rax)
ffff80000010b00b:	10 10                	adc    %dl,(%rax)
ffff80000010b00d:	7c 00                	jl     ffff80000010b00f <font_ascii+0x66f>
ffff80000010b00f:	00 00                	add    %al,(%rax)
ffff80000010b011:	00 00                	add    %al,(%rax)
ffff80000010b013:	00 00                	add    %al,(%rax)
ffff80000010b015:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010b01c:	34 04 
ffff80000010b01e:	04 38                	add    $0x38,%al
ffff80000010b020:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010b024:	40 58                	rex pop %rax
ffff80000010b026:	64 42                	fs rex.X
ffff80000010b028:	42                   	rex.X
ffff80000010b029:	42                   	rex.X
ffff80000010b02a:	42                   	rex.X
ffff80000010b02b:	42                   	rex.X
ffff80000010b02c:	42 e3 00             	rex.X jrcxz ffff80000010b02f <font_ascii+0x68f>
ffff80000010b02f:	00 00                	add    %al,(%rax)
ffff80000010b031:	10 10                	adc    %dl,(%rax)
ffff80000010b033:	00 00                	add    %al,(%rax)
ffff80000010b035:	30 10                	xor    %dl,(%rax)
ffff80000010b037:	10 10                	adc    %dl,(%rax)
ffff80000010b039:	10 10                	adc    %dl,(%rax)
ffff80000010b03b:	10 10                	adc    %dl,(%rax)
ffff80000010b03d:	38 00                	cmp    %al,(%rax)
ffff80000010b03f:	00 00                	add    %al,(%rax)
ffff80000010b041:	04 04                	add    $0x4,%al
ffff80000010b043:	00 00                	add    %al,(%rax)
ffff80000010b045:	0c 04                	or     $0x4,%al
ffff80000010b047:	04 04                	add    $0x4,%al
ffff80000010b049:	04 04                	add    $0x4,%al
ffff80000010b04b:	04 04                	add    $0x4,%al
ffff80000010b04d:	08 08                	or     %cl,(%rax)
ffff80000010b04f:	30 c0                	xor    %al,%al
ffff80000010b051:	40                   	rex
ffff80000010b052:	40                   	rex
ffff80000010b053:	40                   	rex
ffff80000010b054:	40                   	rex
ffff80000010b055:	4e                   	rex.WRX
ffff80000010b056:	44                   	rex.R
ffff80000010b057:	48 50                	rex.W push %rax
ffff80000010b059:	60                   	(bad)  
ffff80000010b05a:	50                   	push   %rax
ffff80000010b05b:	48                   	rex.W
ffff80000010b05c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010b05f:	00 30                	add    %dh,(%rax)
ffff80000010b061:	10 10                	adc    %dl,(%rax)
ffff80000010b063:	10 10                	adc    %dl,(%rax)
ffff80000010b065:	10 10                	adc    %dl,(%rax)
ffff80000010b067:	10 10                	adc    %dl,(%rax)
ffff80000010b069:	10 10                	adc    %dl,(%rax)
ffff80000010b06b:	10 10                	adc    %dl,(%rax)
ffff80000010b06d:	38 00                	cmp    %al,(%rax)
ffff80000010b06f:	00 00                	add    %al,(%rax)
ffff80000010b071:	00 00                	add    %al,(%rax)
ffff80000010b073:	00 00                	add    %al,(%rax)
ffff80000010b075:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b079:	49                   	rex.WB
ffff80000010b07a:	49                   	rex.WB
ffff80000010b07b:	49                   	rex.WB
ffff80000010b07c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b07f:	00 00                	add    %al,(%rax)
ffff80000010b081:	00 00                	add    %al,(%rax)
ffff80000010b083:	00 00                	add    %al,(%rax)
ffff80000010b085:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b089:	42                   	rex.X
ffff80000010b08a:	42                   	rex.X
ffff80000010b08b:	42                   	rex.X
ffff80000010b08c:	42 e3 00             	rex.X jrcxz ffff80000010b08f <font_ascii+0x6ef>
ffff80000010b08f:	00 00                	add    %al,(%rax)
ffff80000010b091:	00 00                	add    %al,(%rax)
ffff80000010b093:	00 00                	add    %al,(%rax)
ffff80000010b095:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b099:	82                   	(bad)  
ffff80000010b09a:	82                   	(bad)  
ffff80000010b09b:	82                   	(bad)  
ffff80000010b09c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b09f:	00 00                	add    %al,(%rax)
ffff80000010b0a1:	00 00                	add    %al,(%rax)
ffff80000010b0a3:	00 d8                	add    %bl,%al
ffff80000010b0a5:	64 42                	fs rex.X
ffff80000010b0a7:	42                   	rex.X
ffff80000010b0a8:	42                   	rex.X
ffff80000010b0a9:	42                   	rex.X
ffff80000010b0aa:	42                   	rex.X
ffff80000010b0ab:	64 58                	fs pop %rax
ffff80000010b0ad:	40                   	rex
ffff80000010b0ae:	40 e0 00             	rex loopne ffff80000010b0b1 <font_ascii+0x711>
ffff80000010b0b1:	00 00                	add    %al,(%rax)
ffff80000010b0b3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b0b6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b0bd:	04 04                	add    $0x4,%al
ffff80000010b0bf:	0e                   	(bad)  
ffff80000010b0c0:	00 00                	add    %al,(%rax)
ffff80000010b0c2:	00 00                	add    %al,(%rax)
ffff80000010b0c4:	00 dc                	add    %bl,%ah
ffff80000010b0c6:	62 42                	(bad)  
ffff80000010b0c8:	40                   	rex
ffff80000010b0c9:	40                   	rex
ffff80000010b0ca:	40                   	rex
ffff80000010b0cb:	40                   	rex
ffff80000010b0cc:	40 e0 00             	rex loopne ffff80000010b0cf <font_ascii+0x72f>
ffff80000010b0cf:	00 00                	add    %al,(%rax)
ffff80000010b0d1:	00 00                	add    %al,(%rax)
ffff80000010b0d3:	00 00                	add    %al,(%rax)
ffff80000010b0d5:	7a 86                	jp     ffff80000010b05d <font_ascii+0x6bd>
ffff80000010b0d7:	82                   	(bad)  
ffff80000010b0d8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b0db:	82                   	(bad)  
ffff80000010b0dc:	c2 bc 00             	retq   $0xbc
ffff80000010b0df:	00 00                	add    %al,(%rax)
ffff80000010b0e1:	00 10                	add    %dl,(%rax)
ffff80000010b0e3:	10 10                	adc    %dl,(%rax)
ffff80000010b0e5:	7c 10                	jl     ffff80000010b0f7 <font_ascii+0x757>
ffff80000010b0e7:	10 10                	adc    %dl,(%rax)
ffff80000010b0e9:	10 10                	adc    %dl,(%rax)
ffff80000010b0eb:	10 10                	adc    %dl,(%rax)
ffff80000010b0ed:	0e                   	(bad)  
ffff80000010b0ee:	00 00                	add    %al,(%rax)
ffff80000010b0f0:	00 00                	add    %al,(%rax)
ffff80000010b0f2:	00 00                	add    %al,(%rax)
ffff80000010b0f4:	00 c6                	add    %al,%dh
ffff80000010b0f6:	42                   	rex.X
ffff80000010b0f7:	42                   	rex.X
ffff80000010b0f8:	42                   	rex.X
ffff80000010b0f9:	42                   	rex.X
ffff80000010b0fa:	42                   	rex.X
ffff80000010b0fb:	42                   	rex.X
ffff80000010b0fc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b0ff:	00 00                	add    %al,(%rax)
ffff80000010b101:	00 00                	add    %al,(%rax)
ffff80000010b103:	00 00                	add    %al,(%rax)
ffff80000010b105:	e7 42                	out    %eax,$0x42
ffff80000010b107:	42                   	rex.X
ffff80000010b108:	42 24 24             	rex.X and $0x24,%al
ffff80000010b10b:	24 18                	and    $0x18,%al
ffff80000010b10d:	18 00                	sbb    %al,(%rax)
ffff80000010b10f:	00 00                	add    %al,(%rax)
ffff80000010b111:	00 00                	add    %al,(%rax)
ffff80000010b113:	00 00                	add    %al,(%rax)
ffff80000010b115:	e7 42                	out    %eax,$0x42
ffff80000010b117:	42 5a                	rex.X pop %rdx
ffff80000010b119:	5a                   	pop    %rdx
ffff80000010b11a:	5a                   	pop    %rdx
ffff80000010b11b:	24 24                	and    $0x24,%al
ffff80000010b11d:	24 00                	and    $0x0,%al
ffff80000010b11f:	00 00                	add    %al,(%rax)
ffff80000010b121:	00 00                	add    %al,(%rax)
ffff80000010b123:	00 00                	add    %al,(%rax)
ffff80000010b125:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b12a:	28 28                	sub    %ch,(%rax)
ffff80000010b12c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b130:	00 00                	add    %al,(%rax)
ffff80000010b132:	00 00                	add    %al,(%rax)
ffff80000010b134:	00 e7                	add    %ah,%bh
ffff80000010b136:	42                   	rex.X
ffff80000010b137:	42 24 24             	rex.X and $0x24,%al
ffff80000010b13a:	24 18                	and    $0x18,%al
ffff80000010b13c:	18 10                	sbb    %dl,(%rax)
ffff80000010b13e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b141:	00 00                	add    %al,(%rax)
ffff80000010b143:	00 00                	add    %al,(%rax)
ffff80000010b145:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b14b:	42 82                	rex.X (bad) 
ffff80000010b14d:	fe 00                	incb   (%rax)
ffff80000010b14f:	00 00                	add    %al,(%rax)
ffff80000010b151:	06                   	(bad)  
ffff80000010b152:	08 10                	or     %dl,(%rax)
ffff80000010b154:	10 10                	adc    %dl,(%rax)
ffff80000010b156:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b159:	10 10                	adc    %dl,(%rax)
ffff80000010b15b:	10 08                	adc    %cl,(%rax)
ffff80000010b15d:	06                   	(bad)  
ffff80000010b15e:	00 00                	add    %al,(%rax)
ffff80000010b160:	10 10                	adc    %dl,(%rax)
ffff80000010b162:	10 10                	adc    %dl,(%rax)
ffff80000010b164:	10 10                	adc    %dl,(%rax)
ffff80000010b166:	10 10                	adc    %dl,(%rax)
ffff80000010b168:	10 10                	adc    %dl,(%rax)
ffff80000010b16a:	10 10                	adc    %dl,(%rax)
ffff80000010b16c:	10 10                	adc    %dl,(%rax)
ffff80000010b16e:	10 10                	adc    %dl,(%rax)
ffff80000010b170:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b173:	08 08                	or     %cl,(%rax)
ffff80000010b175:	08 08                	or     %cl,(%rax)
ffff80000010b177:	06                   	(bad)  
ffff80000010b178:	08 08                	or     %cl,(%rax)
ffff80000010b17a:	08 08                	or     %cl,(%rax)
ffff80000010b17c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b17f:	00 00                	add    %al,(%rax)
ffff80000010b181:	72 8c                	jb     ffff80000010b10f <font_ascii+0x76f>
	...

ffff80000010b9a0 <init_thread>:
ffff80000010b9a0:	00 00                	add    %al,(%rax)
ffff80000010b9a2:	12 00                	adc    (%rax),%al
ffff80000010b9a4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b9b2:	12 00                	adc    (%rax),%al
ffff80000010b9b4:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010b9ba:	00 00                	add    %al,(%rax)
ffff80000010b9bc:	00 00                	add    %al,(%rax)
ffff80000010b9be:	00 00                	add    %al,(%rax)
ffff80000010b9c0:	10 00                	adc    %al,(%rax)
	...

ffff80000010b9e0 <init_task>:
ffff80000010b9e0:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010b9e6:	ff                   	(bad)  
ffff80000010b9e7:	ff 00                	incl   (%rax)
	...

ffff80000010ba20 <init_tss>:
ffff80000010ba20:	00 00                	add    %al,(%rax)
ffff80000010ba22:	00 00                	add    %al,(%rax)
ffff80000010ba24:	00 00                	add    %al,(%rax)
ffff80000010ba26:	12 00                	adc    (%rax),%al
ffff80000010ba28:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba2e:	12 00                	adc    (%rax),%al
ffff80000010ba30:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba36:	12 00                	adc    (%rax),%al
ffff80000010ba38:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba3e:	00 00                	add    %al,(%rax)
ffff80000010ba40:	00 00                	add    %al,(%rax)
ffff80000010ba42:	00 00                	add    %al,(%rax)
ffff80000010ba44:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010ba48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010ba4e:	00 00                	add    %al,(%rax)
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
ffff80000010ba78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010ba8e:	12 00                	adc    (%rax),%al
ffff80000010ba90:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba96:	12 00                	adc    (%rax),%al
ffff80000010ba98:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010ba9e:	12 00                	adc    (%rax),%al
ffff80000010baa0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010baa6:	00 00                	add    %al,(%rax)
ffff80000010baa8:	00 00                	add    %al,(%rax)
ffff80000010baaa:	00 00                	add    %al,(%rax)
ffff80000010baac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bab0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bab6:	00 00                	add    %al,(%rax)
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
ffff80000010bae0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010baf6:	12 00                	adc    (%rax),%al
ffff80000010baf8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bafe:	12 00                	adc    (%rax),%al
ffff80000010bb00:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb06:	12 00                	adc    (%rax),%al
ffff80000010bb08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb0e:	00 00                	add    %al,(%rax)
ffff80000010bb10:	00 00                	add    %al,(%rax)
ffff80000010bb12:	00 00                	add    %al,(%rax)
ffff80000010bb14:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb1e:	00 00                	add    %al,(%rax)
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
ffff80000010bb48:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bb5e:	12 00                	adc    (%rax),%al
ffff80000010bb60:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb66:	12 00                	adc    (%rax),%al
ffff80000010bb68:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb6e:	12 00                	adc    (%rax),%al
ffff80000010bb70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bb76:	00 00                	add    %al,(%rax)
ffff80000010bb78:	00 00                	add    %al,(%rax)
ffff80000010bb7a:	00 00                	add    %al,(%rax)
ffff80000010bb7c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bb80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bb86:	00 00                	add    %al,(%rax)
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
ffff80000010bbb0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bbc6:	12 00                	adc    (%rax),%al
ffff80000010bbc8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbce:	12 00                	adc    (%rax),%al
ffff80000010bbd0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbd6:	12 00                	adc    (%rax),%al
ffff80000010bbd8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bbde:	00 00                	add    %al,(%rax)
ffff80000010bbe0:	00 00                	add    %al,(%rax)
ffff80000010bbe2:	00 00                	add    %al,(%rax)
ffff80000010bbe4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bbe8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bbee:	00 00                	add    %al,(%rax)
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
ffff80000010bc18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc2e:	12 00                	adc    (%rax),%al
ffff80000010bc30:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc36:	12 00                	adc    (%rax),%al
ffff80000010bc38:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc3e:	12 00                	adc    (%rax),%al
ffff80000010bc40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc46:	00 00                	add    %al,(%rax)
ffff80000010bc48:	00 00                	add    %al,(%rax)
ffff80000010bc4a:	00 00                	add    %al,(%rax)
ffff80000010bc4c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bc50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bc56:	00 00                	add    %al,(%rax)
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
ffff80000010bc80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bc96:	12 00                	adc    (%rax),%al
ffff80000010bc98:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bc9e:	12 00                	adc    (%rax),%al
ffff80000010bca0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bca6:	12 00                	adc    (%rax),%al
ffff80000010bca8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bcae:	00 00                	add    %al,(%rax)
ffff80000010bcb0:	00 00                	add    %al,(%rax)
ffff80000010bcb2:	00 00                	add    %al,(%rax)
ffff80000010bcb4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bcb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bcbe:	00 00                	add    %al,(%rax)
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
ffff80000010bce8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bcfe:	12 00                	adc    (%rax),%al
ffff80000010bd00:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd06:	12 00                	adc    (%rax),%al
ffff80000010bd08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd0e:	12 00                	adc    (%rax),%al
ffff80000010bd10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bd16:	00 00                	add    %al,(%rax)
ffff80000010bd18:	00 00                	add    %al,(%rax)
ffff80000010bd1a:	00 00                	add    %al,(%rax)
ffff80000010bd1c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bd20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd26:	00 00                	add    %al,(%rax)
ffff80000010bd28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd2e:	00 00                	add    %al,(%rax)
ffff80000010bd30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd36:	00 00                	add    %al,(%rax)
ffff80000010bd38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd3e:	00 00                	add    %al,(%rax)
ffff80000010bd40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd46:	00 00                	add    %al,(%rax)
ffff80000010bd48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bd4e:	00 00                	add    %al,(%rax)
ffff80000010bd50:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010bd60 <system_call_table>:
ffff80000010bd60:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff80000010bd64:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
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
ffff80000010c15c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c36e:	00 00                	add    %al,(%rax)
ffff80000010c370:	00 10                	add    %dl,(%rax)
ffff80000010c372:	10 10                	adc    %dl,(%rax)
ffff80000010c374:	10 10                	adc    %dl,(%rax)
ffff80000010c376:	10 10                	adc    %dl,(%rax)
ffff80000010c378:	10 10                	adc    %dl,(%rax)
ffff80000010c37a:	00 00                	add    %al,(%rax)
ffff80000010c37c:	10 10                	adc    %dl,(%rax)
ffff80000010c37e:	00 00                	add    %al,(%rax)
ffff80000010c380:	28 28                	sub    %ch,(%rax)
ffff80000010c382:	28 00                	sub    %al,(%rax)
	...
ffff80000010c390:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010c394:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010c398:	44                   	rex.R
ffff80000010c399:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c39e:	00 00                	add    %al,(%rax)
ffff80000010c3a0:	10 3a                	adc    %bh,(%rdx)
ffff80000010c3a2:	56                   	push   %rsi
ffff80000010c3a3:	92                   	xchg   %eax,%edx
ffff80000010c3a4:	92                   	xchg   %eax,%edx
ffff80000010c3a5:	90                   	nop
ffff80000010c3a6:	50                   	push   %rax
ffff80000010c3a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010c3aa:	92                   	xchg   %eax,%edx
ffff80000010c3ab:	92                   	xchg   %eax,%edx
ffff80000010c3ac:	d4                   	(bad)  
ffff80000010c3ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010c3b2:	94                   	xchg   %eax,%esp
ffff80000010c3b3:	94                   	xchg   %eax,%esp
ffff80000010c3b4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010c3b9:	2c 52                	sub    $0x52,%al
ffff80000010c3bb:	52                   	push   %rdx
ffff80000010c3bc:	92                   	xchg   %eax,%edx
ffff80000010c3bd:	8c 00                	mov    %es,(%rax)
ffff80000010c3bf:	00 00                	add    %al,(%rax)
ffff80000010c3c1:	70 88                	jo     ffff80000010c34b <system_call_table+0x5eb>
ffff80000010c3c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010c3c9:	92                   	xchg   %eax,%edx
ffff80000010c3ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010c3d1:	08 10                	or     %dl,(%rax)
	...
ffff80000010c3df:	00 02                	add    %al,(%rdx)
ffff80000010c3e1:	04 08                	add    $0x8,%al
ffff80000010c3e3:	08 10                	or     %dl,(%rax)
ffff80000010c3e5:	10 10                	adc    %dl,(%rax)
ffff80000010c3e7:	10 10                	adc    %dl,(%rax)
ffff80000010c3e9:	10 10                	adc    %dl,(%rax)
ffff80000010c3eb:	08 08                	or     %cl,(%rax)
ffff80000010c3ed:	04 02                	add    $0x2,%al
ffff80000010c3ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010c3f5:	10 10                	adc    %dl,(%rax)
ffff80000010c3f7:	10 10                	adc    %dl,(%rax)
ffff80000010c3f9:	10 10                	adc    %dl,(%rax)
ffff80000010c3fb:	20 20                	and    %ah,(%rax)
ffff80000010c3fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c401:	00 00                	add    %al,(%rax)
ffff80000010c403:	00 00                	add    %al,(%rax)
ffff80000010c405:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010c40b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c415:	10 10                	adc    %dl,(%rax)
ffff80000010c417:	10 fe                	adc    %bh,%dh
ffff80000010c419:	10 10                	adc    %dl,(%rax)
ffff80000010c41b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c429:	00 00                	add    %al,(%rax)
ffff80000010c42b:	18 18                	sbb    %bl,(%rax)
ffff80000010c42d:	08 08                	or     %cl,(%rax)
ffff80000010c42f:	10 00                	adc    %al,(%rax)
ffff80000010c431:	00 00                	add    %al,(%rax)
ffff80000010c433:	00 00                	add    %al,(%rax)
ffff80000010c435:	00 00                	add    %al,(%rax)
ffff80000010c437:	00 fe                	add    %bh,%dh
	...
ffff80000010c449:	00 00                	add    %al,(%rax)
ffff80000010c44b:	00 18                	add    %bl,(%rax)
ffff80000010c44d:	18 00                	sbb    %al,(%rax)
ffff80000010c44f:	00 02                	add    %al,(%rdx)
ffff80000010c451:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010c454:	08 08                	or     %cl,(%rax)
ffff80000010c456:	08 10                	or     %dl,(%rax)
ffff80000010c458:	10 20                	adc    %ah,(%rax)
ffff80000010c45a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c45d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010c464:	42 
ffff80000010c465:	42                   	rex.X
ffff80000010c466:	42                   	rex.X
ffff80000010c467:	42                   	rex.X
ffff80000010c468:	42                   	rex.X
ffff80000010c469:	42                   	rex.X
ffff80000010c46a:	42 24 24             	rex.X and $0x24,%al
ffff80000010c46d:	18 00                	sbb    %al,(%rax)
ffff80000010c46f:	00 00                	add    %al,(%rax)
ffff80000010c471:	08 18                	or     %bl,(%rax)
ffff80000010c473:	28 08                	sub    %cl,(%rax)
ffff80000010c475:	08 08                	or     %cl,(%rax)
ffff80000010c477:	08 08                	or     %cl,(%rax)
ffff80000010c479:	08 08                	or     %cl,(%rax)
ffff80000010c47b:	08 08                	or     %cl,(%rax)
ffff80000010c47d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010c480:	00 18                	add    %bl,(%rax)
ffff80000010c482:	24 42                	and    $0x42,%al
ffff80000010c484:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010c488:	10 20                	adc    %ah,(%rax)
ffff80000010c48a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c48d:	7e 00                	jle    ffff80000010c48f <system_call_table+0x72f>
ffff80000010c48f:	00 00                	add    %al,(%rax)
ffff80000010c491:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010c494:	02 02                	add    (%rdx),%al
ffff80000010c496:	04 18                	add    $0x18,%al
ffff80000010c498:	04 02                	add    $0x2,%al
ffff80000010c49a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010c49d:	18 00                	sbb    %al,(%rax)
ffff80000010c49f:	00 00                	add    %al,(%rax)
ffff80000010c4a1:	0c 0c                	or     $0xc,%al
ffff80000010c4a3:	0c 14                	or     $0x14,%al
ffff80000010c4a5:	14 14                	adc    $0x14,%al
ffff80000010c4a7:	24 24                	and    $0x24,%al
ffff80000010c4a9:	44 7e 04             	rex.R jle ffff80000010c4b0 <system_call_table+0x750>
ffff80000010c4ac:	04 1e                	add    $0x1e,%al
ffff80000010c4ae:	00 00                	add    %al,(%rax)
ffff80000010c4b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010c4b4:	40 58                	rex pop %rax
ffff80000010c4b6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010c4b9:	02 02                	add    (%rdx),%al
ffff80000010c4bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c4be:	00 00                	add    %al,(%rax)
ffff80000010c4c0:	00 18                	add    %bl,(%rax)
ffff80000010c4c2:	24 42                	and    $0x42,%al
ffff80000010c4c4:	40 58                	rex pop %rax
ffff80000010c4c6:	64 42                	fs rex.X
ffff80000010c4c8:	42                   	rex.X
ffff80000010c4c9:	42                   	rex.X
ffff80000010c4ca:	42                   	rex.X
ffff80000010c4cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c4ce:	00 00                	add    %al,(%rax)
ffff80000010c4d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010c4d3:	42 04 04             	rex.X add $0x4,%al
ffff80000010c4d6:	08 08                	or     %cl,(%rax)
ffff80000010c4d8:	08 10                	or     %dl,(%rax)
ffff80000010c4da:	10 10                	adc    %dl,(%rax)
ffff80000010c4dc:	10 38                	adc    %bh,(%rax)
ffff80000010c4de:	00 00                	add    %al,(%rax)
ffff80000010c4e0:	00 18                	add    %bl,(%rax)
ffff80000010c4e2:	24 42                	and    $0x42,%al
ffff80000010c4e4:	42                   	rex.X
ffff80000010c4e5:	42 24 18             	rex.X and $0x18,%al
ffff80000010c4e8:	24 42                	and    $0x42,%al
ffff80000010c4ea:	42                   	rex.X
ffff80000010c4eb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c4ee:	00 00                	add    %al,(%rax)
ffff80000010c4f0:	00 18                	add    %bl,(%rax)
ffff80000010c4f2:	24 42                	and    $0x42,%al
ffff80000010c4f4:	42                   	rex.X
ffff80000010c4f5:	42                   	rex.X
ffff80000010c4f6:	42                   	rex.X
ffff80000010c4f7:	42                   	rex.X
ffff80000010c4f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010c4fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c4fe:	00 00                	add    %al,(%rax)
ffff80000010c500:	00 00                	add    %al,(%rax)
ffff80000010c502:	00 00                	add    %al,(%rax)
ffff80000010c504:	00 18                	add    %bl,(%rax)
ffff80000010c506:	18 00                	sbb    %al,(%rax)
ffff80000010c508:	00 00                	add    %al,(%rax)
ffff80000010c50a:	00 00                	add    %al,(%rax)
ffff80000010c50c:	18 18                	sbb    %bl,(%rax)
ffff80000010c50e:	00 00                	add    %al,(%rax)
ffff80000010c510:	00 00                	add    %al,(%rax)
ffff80000010c512:	00 00                	add    %al,(%rax)
ffff80000010c514:	00 18                	add    %bl,(%rax)
ffff80000010c516:	18 00                	sbb    %al,(%rax)
ffff80000010c518:	00 00                	add    %al,(%rax)
ffff80000010c51a:	00 18                	add    %bl,(%rax)
ffff80000010c51c:	18 08                	sbb    %cl,(%rax)
ffff80000010c51e:	08 10                	or     %dl,(%rax)
ffff80000010c520:	00 02                	add    %al,(%rdx)
ffff80000010c522:	04 08                	add    $0x8,%al
ffff80000010c524:	10 20                	adc    %ah,(%rax)
ffff80000010c526:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010c52d:	04 
ffff80000010c52e:	02 00                	add    (%rax),%al
ffff80000010c530:	00 00                	add    %al,(%rax)
ffff80000010c532:	00 00                	add    %al,(%rax)
ffff80000010c534:	00 00                	add    %al,(%rax)
ffff80000010c536:	fe 00                	incb   (%rax)
ffff80000010c538:	00 fe                	add    %bh,%dh
ffff80000010c53a:	00 00                	add    %al,(%rax)
ffff80000010c53c:	00 00                	add    %al,(%rax)
ffff80000010c53e:	00 00                	add    %al,(%rax)
ffff80000010c540:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010c546:	04 02                	add    $0x2,%al
ffff80000010c548:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010c54b:	10 20                	adc    %ah,(%rax)
ffff80000010c54d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c551:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c555:	82                   	(bad)  
ffff80000010c556:	04 08                	add    $0x8,%al
ffff80000010c558:	10 10                	adc    %dl,(%rax)
ffff80000010c55a:	00 00                	add    %al,(%rax)
ffff80000010c55c:	18 18                	sbb    %bl,(%rax)
ffff80000010c55e:	00 00                	add    %al,(%rax)
ffff80000010c560:	00 38                	add    %bh,(%rax)
ffff80000010c562:	44 82                	rex.R (bad) 
ffff80000010c564:	9a                   	(bad)  
ffff80000010c565:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c566:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c567:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c568:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c569:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c56a:	9c                   	pushfq 
ffff80000010c56b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010c56f:	00 00                	add    %al,(%rax)
ffff80000010c571:	18 18                	sbb    %bl,(%rax)
ffff80000010c573:	18 18                	sbb    %bl,(%rax)
ffff80000010c575:	24 24                	and    $0x24,%al
ffff80000010c577:	24 24                	and    $0x24,%al
ffff80000010c579:	7e 42                	jle    ffff80000010c5bd <system_call_table+0x85d>
ffff80000010c57b:	42                   	rex.X
ffff80000010c57c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c57f:	00 00                	add    %al,(%rax)
ffff80000010c581:	f0 48                	lock rex.W
ffff80000010c583:	44                   	rex.R
ffff80000010c584:	44                   	rex.R
ffff80000010c585:	44                   	rex.R
ffff80000010c586:	48 78 44             	rex.W js ffff80000010c5cd <system_call_table+0x86d>
ffff80000010c589:	42                   	rex.X
ffff80000010c58a:	42                   	rex.X
ffff80000010c58b:	42                   	rex.X
ffff80000010c58c:	44 f8                	rex.R clc 
ffff80000010c58e:	00 00                	add    %al,(%rax)
ffff80000010c590:	00 3a                	add    %bh,(%rdx)
ffff80000010c592:	46                   	rex.RX
ffff80000010c593:	42 82                	rex.X (bad) 
ffff80000010c595:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010c59c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c59f:	00 00                	add    %al,(%rax)
ffff80000010c5a1:	f8                   	clc    
ffff80000010c5a2:	44                   	rex.R
ffff80000010c5a3:	44                   	rex.R
ffff80000010c5a4:	42                   	rex.X
ffff80000010c5a5:	42                   	rex.X
ffff80000010c5a6:	42                   	rex.X
ffff80000010c5a7:	42                   	rex.X
ffff80000010c5a8:	42                   	rex.X
ffff80000010c5a9:	42                   	rex.X
ffff80000010c5aa:	42                   	rex.X
ffff80000010c5ab:	44                   	rex.R
ffff80000010c5ac:	44 f8                	rex.R clc 
ffff80000010c5ae:	00 00                	add    %al,(%rax)
ffff80000010c5b0:	00 fe                	add    %bh,%dh
ffff80000010c5b2:	42                   	rex.X
ffff80000010c5b3:	42                   	rex.X
ffff80000010c5b4:	40                   	rex
ffff80000010c5b5:	40                   	rex
ffff80000010c5b6:	44 7c 44             	rex.R jl ffff80000010c5fd <system_call_table+0x89d>
ffff80000010c5b9:	40                   	rex
ffff80000010c5ba:	40                   	rex
ffff80000010c5bb:	42                   	rex.X
ffff80000010c5bc:	42 fe 00             	rex.X incb (%rax)
ffff80000010c5bf:	00 00                	add    %al,(%rax)
ffff80000010c5c1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010c5c4:	40                   	rex
ffff80000010c5c5:	40                   	rex
ffff80000010c5c6:	44 7c 44             	rex.R jl ffff80000010c60d <system_call_table+0x8ad>
ffff80000010c5c9:	44                   	rex.R
ffff80000010c5ca:	40                   	rex
ffff80000010c5cb:	40                   	rex
ffff80000010c5cc:	40                   	rex
ffff80000010c5cd:	f0 00 00             	lock add %al,(%rax)
ffff80000010c5d0:	00 3a                	add    %bh,(%rdx)
ffff80000010c5d2:	46                   	rex.RX
ffff80000010c5d3:	42 82                	rex.X (bad) 
ffff80000010c5d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010c5dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010c5df:	00 00                	add    %al,(%rax)
ffff80000010c5e1:	e7 42                	out    %eax,$0x42
ffff80000010c5e3:	42                   	rex.X
ffff80000010c5e4:	42                   	rex.X
ffff80000010c5e5:	42                   	rex.X
ffff80000010c5e6:	42 7e 42             	rex.X jle ffff80000010c62b <system_call_table+0x8cb>
ffff80000010c5e9:	42                   	rex.X
ffff80000010c5ea:	42                   	rex.X
ffff80000010c5eb:	42                   	rex.X
ffff80000010c5ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c5ef:	00 00                	add    %al,(%rax)
ffff80000010c5f1:	7c 10                	jl     ffff80000010c603 <system_call_table+0x8a3>
ffff80000010c5f3:	10 10                	adc    %dl,(%rax)
ffff80000010c5f5:	10 10                	adc    %dl,(%rax)
ffff80000010c5f7:	10 10                	adc    %dl,(%rax)
ffff80000010c5f9:	10 10                	adc    %dl,(%rax)
ffff80000010c5fb:	10 10                	adc    %dl,(%rax)
ffff80000010c5fd:	7c 00                	jl     ffff80000010c5ff <system_call_table+0x89f>
ffff80000010c5ff:	00 00                	add    %al,(%rax)
ffff80000010c601:	1f                   	(bad)  
ffff80000010c602:	04 04                	add    $0x4,%al
ffff80000010c604:	04 04                	add    $0x4,%al
ffff80000010c606:	04 04                	add    $0x4,%al
ffff80000010c608:	04 04                	add    $0x4,%al
ffff80000010c60a:	04 04                	add    $0x4,%al
ffff80000010c60c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010c60f:	00 00                	add    %al,(%rax)
ffff80000010c611:	e7 42                	out    %eax,$0x42
ffff80000010c613:	44                   	rex.R
ffff80000010c614:	48 50                	rex.W push %rax
ffff80000010c616:	50                   	push   %rax
ffff80000010c617:	60                   	(bad)  
ffff80000010c618:	50                   	push   %rax
ffff80000010c619:	50                   	push   %rax
ffff80000010c61a:	48                   	rex.W
ffff80000010c61b:	44                   	rex.R
ffff80000010c61c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c61f:	00 00                	add    %al,(%rax)
ffff80000010c621:	f0 40                	lock rex
ffff80000010c623:	40                   	rex
ffff80000010c624:	40                   	rex
ffff80000010c625:	40                   	rex
ffff80000010c626:	40                   	rex
ffff80000010c627:	40                   	rex
ffff80000010c628:	40                   	rex
ffff80000010c629:	40                   	rex
ffff80000010c62a:	40                   	rex
ffff80000010c62b:	42                   	rex.X
ffff80000010c62c:	42 fe 00             	rex.X incb (%rax)
ffff80000010c62f:	00 00                	add    %al,(%rax)
ffff80000010c631:	c3                   	retq   
ffff80000010c632:	42                   	rex.X
ffff80000010c633:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010c637:	5a                   	pop    %rdx
ffff80000010c638:	5a                   	pop    %rdx
ffff80000010c639:	42                   	rex.X
ffff80000010c63a:	42                   	rex.X
ffff80000010c63b:	42                   	rex.X
ffff80000010c63c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c63f:	00 00                	add    %al,(%rax)
ffff80000010c641:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010c648:	4a                   	rex.WX
ffff80000010c649:	4a                   	rex.WX
ffff80000010c64a:	4a                   	rex.WX
ffff80000010c64b:	46                   	rex.RX
ffff80000010c64c:	46 e2 00             	rex.RX loop ffff80000010c64f <system_call_table+0x8ef>
ffff80000010c64f:	00 00                	add    %al,(%rax)
ffff80000010c651:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c655:	82                   	(bad)  
ffff80000010c656:	82                   	(bad)  
ffff80000010c657:	82                   	(bad)  
ffff80000010c658:	82                   	(bad)  
ffff80000010c659:	82                   	(bad)  
ffff80000010c65a:	82                   	(bad)  
ffff80000010c65b:	82                   	(bad)  
ffff80000010c65c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c65f:	00 00                	add    %al,(%rax)
ffff80000010c661:	f8                   	clc    
ffff80000010c662:	44                   	rex.R
ffff80000010c663:	42                   	rex.X
ffff80000010c664:	42                   	rex.X
ffff80000010c665:	42                   	rex.X
ffff80000010c666:	44 78 40             	rex.R js ffff80000010c6a9 <system_call_table+0x949>
ffff80000010c669:	40                   	rex
ffff80000010c66a:	40                   	rex
ffff80000010c66b:	40                   	rex
ffff80000010c66c:	40                   	rex
ffff80000010c66d:	f0 00 00             	lock add %al,(%rax)
ffff80000010c670:	00 38                	add    %bh,(%rax)
ffff80000010c672:	44 82                	rex.R (bad) 
ffff80000010c674:	82                   	(bad)  
ffff80000010c675:	82                   	(bad)  
ffff80000010c676:	82                   	(bad)  
ffff80000010c677:	82                   	(bad)  
ffff80000010c678:	82                   	(bad)  
ffff80000010c679:	82                   	(bad)  
ffff80000010c67a:	92                   	xchg   %eax,%edx
ffff80000010c67b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010c67f:	00 00                	add    %al,(%rax)
ffff80000010c681:	fc                   	cld    
ffff80000010c682:	42                   	rex.X
ffff80000010c683:	42                   	rex.X
ffff80000010c684:	42                   	rex.X
ffff80000010c685:	42 7c 44             	rex.X jl ffff80000010c6cc <system_call_table+0x96c>
ffff80000010c688:	42                   	rex.X
ffff80000010c689:	42                   	rex.X
ffff80000010c68a:	42                   	rex.X
ffff80000010c68b:	42                   	rex.X
ffff80000010c68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c68f:	00 00                	add    %al,(%rax)
ffff80000010c691:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010c694:	82                   	(bad)  
ffff80000010c695:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010c699:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010c69f:	00 00                	add    %al,(%rax)
ffff80000010c6a1:	fe                   	(bad)  
ffff80000010c6a2:	92                   	xchg   %eax,%edx
ffff80000010c6a3:	92                   	xchg   %eax,%edx
ffff80000010c6a4:	10 10                	adc    %dl,(%rax)
ffff80000010c6a6:	10 10                	adc    %dl,(%rax)
ffff80000010c6a8:	10 10                	adc    %dl,(%rax)
ffff80000010c6aa:	10 10                	adc    %dl,(%rax)
ffff80000010c6ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010c6b0:	00 e7                	add    %ah,%bh
ffff80000010c6b2:	42                   	rex.X
ffff80000010c6b3:	42                   	rex.X
ffff80000010c6b4:	42                   	rex.X
ffff80000010c6b5:	42                   	rex.X
ffff80000010c6b6:	42                   	rex.X
ffff80000010c6b7:	42                   	rex.X
ffff80000010c6b8:	42                   	rex.X
ffff80000010c6b9:	42                   	rex.X
ffff80000010c6ba:	42                   	rex.X
ffff80000010c6bb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010c6be:	00 00                	add    %al,(%rax)
ffff80000010c6c0:	00 e7                	add    %ah,%bh
ffff80000010c6c2:	42                   	rex.X
ffff80000010c6c3:	42                   	rex.X
ffff80000010c6c4:	42                   	rex.X
ffff80000010c6c5:	42 24 24             	rex.X and $0x24,%al
ffff80000010c6c8:	24 24                	and    $0x24,%al
ffff80000010c6ca:	18 18                	sbb    %bl,(%rax)
ffff80000010c6cc:	18 18                	sbb    %bl,(%rax)
ffff80000010c6ce:	00 00                	add    %al,(%rax)
ffff80000010c6d0:	00 e7                	add    %ah,%bh
ffff80000010c6d2:	42                   	rex.X
ffff80000010c6d3:	42                   	rex.X
ffff80000010c6d4:	42 5a                	rex.X pop %rdx
ffff80000010c6d6:	5a                   	pop    %rdx
ffff80000010c6d7:	5a                   	pop    %rdx
ffff80000010c6d8:	5a                   	pop    %rdx
ffff80000010c6d9:	24 24                	and    $0x24,%al
ffff80000010c6db:	24 24                	and    $0x24,%al
ffff80000010c6dd:	24 00                	and    $0x0,%al
ffff80000010c6df:	00 00                	add    %al,(%rax)
ffff80000010c6e1:	e7 42                	out    %eax,$0x42
ffff80000010c6e3:	42 24 24             	rex.X and $0x24,%al
ffff80000010c6e6:	24 18                	and    $0x18,%al
ffff80000010c6e8:	24 24                	and    $0x24,%al
ffff80000010c6ea:	24 42                	and    $0x42,%al
ffff80000010c6ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c6ef:	00 00                	add    %al,(%rax)
ffff80000010c6f1:	ee                   	out    %al,(%dx)
ffff80000010c6f2:	44                   	rex.R
ffff80000010c6f3:	44                   	rex.R
ffff80000010c6f4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010c6f7:	28 10                	sub    %dl,(%rax)
ffff80000010c6f9:	10 10                	adc    %dl,(%rax)
ffff80000010c6fb:	10 10                	adc    %dl,(%rax)
ffff80000010c6fd:	7c 00                	jl     ffff80000010c6ff <system_call_table+0x99f>
ffff80000010c6ff:	00 00                	add    %al,(%rax)
ffff80000010c701:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010c708:	20 20                	and    %ah,(%rax)
ffff80000010c70a:	40                   	rex
ffff80000010c70b:	42 82                	rex.X (bad) 
ffff80000010c70d:	fe 00                	incb   (%rax)
ffff80000010c70f:	00 00                	add    %al,(%rax)
ffff80000010c711:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010c714:	20 20                	and    %ah,(%rax)
ffff80000010c716:	20 20                	and    %ah,(%rax)
ffff80000010c718:	20 20                	and    %ah,(%rax)
ffff80000010c71a:	20 20                	and    %ah,(%rax)
ffff80000010c71c:	20 20                	and    %ah,(%rax)
ffff80000010c71e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010c725:	20 20                	and    %ah,(%rax)
ffff80000010c727:	10 10                	adc    %dl,(%rax)
ffff80000010c729:	08 08                	or     %cl,(%rax)
ffff80000010c72b:	04 04                	add    $0x4,%al
ffff80000010c72d:	04 02                	add    $0x2,%al
ffff80000010c72f:	02 00                	add    (%rax),%al
ffff80000010c731:	7c 04                	jl     ffff80000010c737 <system_call_table+0x9d7>
ffff80000010c733:	04 04                	add    $0x4,%al
ffff80000010c735:	04 04                	add    $0x4,%al
ffff80000010c737:	04 04                	add    $0x4,%al
ffff80000010c739:	04 04                	add    $0x4,%al
ffff80000010c73b:	04 04                	add    $0x4,%al
ffff80000010c73d:	04 7c                	add    $0x7c,%al
ffff80000010c73f:	00 00                	add    %al,(%rax)
ffff80000010c741:	10 28                	adc    %ch,(%rax)
ffff80000010c743:	44 82                	rex.R (bad) 
	...
ffff80000010c75d:	00 fe                	add    %bh,%dh
ffff80000010c75f:	00 10                	add    %dl,(%rax)
ffff80000010c761:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010c774:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010c777:	04 3c                	add    $0x3c,%al
ffff80000010c779:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010c780:	c0 
ffff80000010c781:	40                   	rex
ffff80000010c782:	40                   	rex
ffff80000010c783:	40                   	rex
ffff80000010c784:	40 58                	rex pop %rax
ffff80000010c786:	64 42                	fs rex.X
ffff80000010c788:	42                   	rex.X
ffff80000010c789:	42                   	rex.X
ffff80000010c78a:	42                   	rex.X
ffff80000010c78b:	42                   	rex.X
ffff80000010c78c:	64 58                	fs pop %rax
ffff80000010c78e:	00 00                	add    %al,(%rax)
ffff80000010c790:	00 00                	add    %al,(%rax)
ffff80000010c792:	00 00                	add    %al,(%rax)
ffff80000010c794:	00 30                	add    %dh,(%rax)
ffff80000010c796:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010c79d:	38 
ffff80000010c79e:	00 00                	add    %al,(%rax)
ffff80000010c7a0:	0c 04                	or     $0x4,%al
ffff80000010c7a2:	04 04                	add    $0x4,%al
ffff80000010c7a4:	04 34                	add    $0x34,%al
ffff80000010c7a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010c7ad:	36 
ffff80000010c7ae:	00 00                	add    %al,(%rax)
ffff80000010c7b0:	00 00                	add    %al,(%rax)
ffff80000010c7b2:	00 00                	add    %al,(%rax)
ffff80000010c7b4:	00 38                	add    %bh,(%rax)
ffff80000010c7b6:	44 82                	rex.R (bad) 
ffff80000010c7b8:	82                   	(bad)  
ffff80000010c7b9:	fc                   	cld    
ffff80000010c7ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010c7c1:	10 10                	adc    %dl,(%rax)
ffff80000010c7c3:	10 10                	adc    %dl,(%rax)
ffff80000010c7c5:	7c 10                	jl     ffff80000010c7d7 <system_call_table+0xa77>
ffff80000010c7c7:	10 10                	adc    %dl,(%rax)
ffff80000010c7c9:	10 10                	adc    %dl,(%rax)
ffff80000010c7cb:	10 10                	adc    %dl,(%rax)
ffff80000010c7cd:	7c 00                	jl     ffff80000010c7cf <system_call_table+0xa6f>
ffff80000010c7cf:	00 00                	add    %al,(%rax)
ffff80000010c7d1:	00 00                	add    %al,(%rax)
ffff80000010c7d3:	00 00                	add    %al,(%rax)
ffff80000010c7d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010c7dc:	34 04 
ffff80000010c7de:	04 38                	add    $0x38,%al
ffff80000010c7e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010c7e4:	40 58                	rex pop %rax
ffff80000010c7e6:	64 42                	fs rex.X
ffff80000010c7e8:	42                   	rex.X
ffff80000010c7e9:	42                   	rex.X
ffff80000010c7ea:	42                   	rex.X
ffff80000010c7eb:	42                   	rex.X
ffff80000010c7ec:	42 e3 00             	rex.X jrcxz ffff80000010c7ef <system_call_table+0xa8f>
ffff80000010c7ef:	00 00                	add    %al,(%rax)
ffff80000010c7f1:	10 10                	adc    %dl,(%rax)
ffff80000010c7f3:	00 00                	add    %al,(%rax)
ffff80000010c7f5:	30 10                	xor    %dl,(%rax)
ffff80000010c7f7:	10 10                	adc    %dl,(%rax)
ffff80000010c7f9:	10 10                	adc    %dl,(%rax)
ffff80000010c7fb:	10 10                	adc    %dl,(%rax)
ffff80000010c7fd:	38 00                	cmp    %al,(%rax)
ffff80000010c7ff:	00 00                	add    %al,(%rax)
ffff80000010c801:	04 04                	add    $0x4,%al
ffff80000010c803:	00 00                	add    %al,(%rax)
ffff80000010c805:	0c 04                	or     $0x4,%al
ffff80000010c807:	04 04                	add    $0x4,%al
ffff80000010c809:	04 04                	add    $0x4,%al
ffff80000010c80b:	04 04                	add    $0x4,%al
ffff80000010c80d:	08 08                	or     %cl,(%rax)
ffff80000010c80f:	30 c0                	xor    %al,%al
ffff80000010c811:	40                   	rex
ffff80000010c812:	40                   	rex
ffff80000010c813:	40                   	rex
ffff80000010c814:	40                   	rex
ffff80000010c815:	4e                   	rex.WRX
ffff80000010c816:	44                   	rex.R
ffff80000010c817:	48 50                	rex.W push %rax
ffff80000010c819:	60                   	(bad)  
ffff80000010c81a:	50                   	push   %rax
ffff80000010c81b:	48                   	rex.W
ffff80000010c81c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010c81f:	00 30                	add    %dh,(%rax)
ffff80000010c821:	10 10                	adc    %dl,(%rax)
ffff80000010c823:	10 10                	adc    %dl,(%rax)
ffff80000010c825:	10 10                	adc    %dl,(%rax)
ffff80000010c827:	10 10                	adc    %dl,(%rax)
ffff80000010c829:	10 10                	adc    %dl,(%rax)
ffff80000010c82b:	10 10                	adc    %dl,(%rax)
ffff80000010c82d:	38 00                	cmp    %al,(%rax)
ffff80000010c82f:	00 00                	add    %al,(%rax)
ffff80000010c831:	00 00                	add    %al,(%rax)
ffff80000010c833:	00 00                	add    %al,(%rax)
ffff80000010c835:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010c839:	49                   	rex.WB
ffff80000010c83a:	49                   	rex.WB
ffff80000010c83b:	49                   	rex.WB
ffff80000010c83c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010c83f:	00 00                	add    %al,(%rax)
ffff80000010c841:	00 00                	add    %al,(%rax)
ffff80000010c843:	00 00                	add    %al,(%rax)
ffff80000010c845:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010c849:	42                   	rex.X
ffff80000010c84a:	42                   	rex.X
ffff80000010c84b:	42                   	rex.X
ffff80000010c84c:	42 e3 00             	rex.X jrcxz ffff80000010c84f <system_call_table+0xaef>
ffff80000010c84f:	00 00                	add    %al,(%rax)
ffff80000010c851:	00 00                	add    %al,(%rax)
ffff80000010c853:	00 00                	add    %al,(%rax)
ffff80000010c855:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c859:	82                   	(bad)  
ffff80000010c85a:	82                   	(bad)  
ffff80000010c85b:	82                   	(bad)  
ffff80000010c85c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c85f:	00 00                	add    %al,(%rax)
ffff80000010c861:	00 00                	add    %al,(%rax)
ffff80000010c863:	00 d8                	add    %bl,%al
ffff80000010c865:	64 42                	fs rex.X
ffff80000010c867:	42                   	rex.X
ffff80000010c868:	42                   	rex.X
ffff80000010c869:	42                   	rex.X
ffff80000010c86a:	42                   	rex.X
ffff80000010c86b:	64 58                	fs pop %rax
ffff80000010c86d:	40                   	rex
ffff80000010c86e:	40 e0 00             	rex loopne ffff80000010c871 <system_call_table+0xb11>
ffff80000010c871:	00 00                	add    %al,(%rax)
ffff80000010c873:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010c876:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010c87d:	04 04                	add    $0x4,%al
ffff80000010c87f:	0e                   	(bad)  
ffff80000010c880:	00 00                	add    %al,(%rax)
ffff80000010c882:	00 00                	add    %al,(%rax)
ffff80000010c884:	00 dc                	add    %bl,%ah
ffff80000010c886:	62 42                	(bad)  
ffff80000010c888:	40                   	rex
ffff80000010c889:	40                   	rex
ffff80000010c88a:	40                   	rex
ffff80000010c88b:	40                   	rex
ffff80000010c88c:	40 e0 00             	rex loopne ffff80000010c88f <system_call_table+0xb2f>
ffff80000010c88f:	00 00                	add    %al,(%rax)
ffff80000010c891:	00 00                	add    %al,(%rax)
ffff80000010c893:	00 00                	add    %al,(%rax)
ffff80000010c895:	7a 86                	jp     ffff80000010c81d <system_call_table+0xabd>
ffff80000010c897:	82                   	(bad)  
ffff80000010c898:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010c89b:	82                   	(bad)  
ffff80000010c89c:	c2 bc 00             	retq   $0xbc
ffff80000010c89f:	00 00                	add    %al,(%rax)
ffff80000010c8a1:	00 10                	add    %dl,(%rax)
ffff80000010c8a3:	10 10                	adc    %dl,(%rax)
ffff80000010c8a5:	7c 10                	jl     ffff80000010c8b7 <system_call_table+0xb57>
ffff80000010c8a7:	10 10                	adc    %dl,(%rax)
ffff80000010c8a9:	10 10                	adc    %dl,(%rax)
ffff80000010c8ab:	10 10                	adc    %dl,(%rax)
ffff80000010c8ad:	0e                   	(bad)  
ffff80000010c8ae:	00 00                	add    %al,(%rax)
ffff80000010c8b0:	00 00                	add    %al,(%rax)
ffff80000010c8b2:	00 00                	add    %al,(%rax)
ffff80000010c8b4:	00 c6                	add    %al,%dh
ffff80000010c8b6:	42                   	rex.X
ffff80000010c8b7:	42                   	rex.X
ffff80000010c8b8:	42                   	rex.X
ffff80000010c8b9:	42                   	rex.X
ffff80000010c8ba:	42                   	rex.X
ffff80000010c8bb:	42                   	rex.X
ffff80000010c8bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010c8bf:	00 00                	add    %al,(%rax)
ffff80000010c8c1:	00 00                	add    %al,(%rax)
ffff80000010c8c3:	00 00                	add    %al,(%rax)
ffff80000010c8c5:	e7 42                	out    %eax,$0x42
ffff80000010c8c7:	42                   	rex.X
ffff80000010c8c8:	42 24 24             	rex.X and $0x24,%al
ffff80000010c8cb:	24 18                	and    $0x18,%al
ffff80000010c8cd:	18 00                	sbb    %al,(%rax)
ffff80000010c8cf:	00 00                	add    %al,(%rax)
ffff80000010c8d1:	00 00                	add    %al,(%rax)
ffff80000010c8d3:	00 00                	add    %al,(%rax)
ffff80000010c8d5:	e7 42                	out    %eax,$0x42
ffff80000010c8d7:	42 5a                	rex.X pop %rdx
ffff80000010c8d9:	5a                   	pop    %rdx
ffff80000010c8da:	5a                   	pop    %rdx
ffff80000010c8db:	24 24                	and    $0x24,%al
ffff80000010c8dd:	24 00                	and    $0x0,%al
ffff80000010c8df:	00 00                	add    %al,(%rax)
ffff80000010c8e1:	00 00                	add    %al,(%rax)
ffff80000010c8e3:	00 00                	add    %al,(%rax)
ffff80000010c8e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010c8ea:	28 28                	sub    %ch,(%rax)
ffff80000010c8ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010c8f0:	00 00                	add    %al,(%rax)
ffff80000010c8f2:	00 00                	add    %al,(%rax)
ffff80000010c8f4:	00 e7                	add    %ah,%bh
ffff80000010c8f6:	42                   	rex.X
ffff80000010c8f7:	42 24 24             	rex.X and $0x24,%al
ffff80000010c8fa:	24 18                	and    $0x18,%al
ffff80000010c8fc:	18 10                	sbb    %dl,(%rax)
ffff80000010c8fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010c901:	00 00                	add    %al,(%rax)
ffff80000010c903:	00 00                	add    %al,(%rax)
ffff80000010c905:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010c90b:	42 82                	rex.X (bad) 
ffff80000010c90d:	fe 00                	incb   (%rax)
ffff80000010c90f:	00 00                	add    %al,(%rax)
ffff80000010c911:	06                   	(bad)  
ffff80000010c912:	08 10                	or     %dl,(%rax)
ffff80000010c914:	10 10                	adc    %dl,(%rax)
ffff80000010c916:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010c919:	10 10                	adc    %dl,(%rax)
ffff80000010c91b:	10 08                	adc    %cl,(%rax)
ffff80000010c91d:	06                   	(bad)  
ffff80000010c91e:	00 00                	add    %al,(%rax)
ffff80000010c920:	10 10                	adc    %dl,(%rax)
ffff80000010c922:	10 10                	adc    %dl,(%rax)
ffff80000010c924:	10 10                	adc    %dl,(%rax)
ffff80000010c926:	10 10                	adc    %dl,(%rax)
ffff80000010c928:	10 10                	adc    %dl,(%rax)
ffff80000010c92a:	10 10                	adc    %dl,(%rax)
ffff80000010c92c:	10 10                	adc    %dl,(%rax)
ffff80000010c92e:	10 10                	adc    %dl,(%rax)
ffff80000010c930:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010c933:	08 08                	or     %cl,(%rax)
ffff80000010c935:	08 08                	or     %cl,(%rax)
ffff80000010c937:	06                   	(bad)  
ffff80000010c938:	08 08                	or     %cl,(%rax)
ffff80000010c93a:	08 08                	or     %cl,(%rax)
ffff80000010c93c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010c93f:	00 00                	add    %al,(%rax)
ffff80000010c941:	72 8c                	jb     ffff80000010c8cf <system_call_table+0xb6f>
	...
ffff80000010d36f:	00 00                	add    %al,(%rax)
ffff80000010d371:	10 10                	adc    %dl,(%rax)
ffff80000010d373:	10 10                	adc    %dl,(%rax)
ffff80000010d375:	10 10                	adc    %dl,(%rax)
ffff80000010d377:	10 10                	adc    %dl,(%rax)
ffff80000010d379:	10 00                	adc    %al,(%rax)
ffff80000010d37b:	00 10                	add    %dl,(%rax)
ffff80000010d37d:	10 00                	adc    %al,(%rax)
ffff80000010d37f:	00 28                	add    %ch,(%rax)
ffff80000010d381:	28 28                	sub    %ch,(%rax)
	...
ffff80000010d38f:	00 00                	add    %al,(%rax)
ffff80000010d391:	44                   	rex.R
ffff80000010d392:	44                   	rex.R
ffff80000010d393:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d398:	44                   	rex.R
ffff80000010d399:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d39e:	00 00                	add    %al,(%rax)
ffff80000010d3a0:	10 3a                	adc    %bh,(%rdx)
ffff80000010d3a2:	56                   	push   %rsi
ffff80000010d3a3:	92                   	xchg   %eax,%edx
ffff80000010d3a4:	92                   	xchg   %eax,%edx
ffff80000010d3a5:	90                   	nop
ffff80000010d3a6:	50                   	push   %rax
ffff80000010d3a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010d3aa:	92                   	xchg   %eax,%edx
ffff80000010d3ab:	92                   	xchg   %eax,%edx
ffff80000010d3ac:	d4                   	(bad)  
ffff80000010d3ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010d3b2:	94                   	xchg   %eax,%esp
ffff80000010d3b3:	94                   	xchg   %eax,%esp
ffff80000010d3b4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010d3b9:	2c 52                	sub    $0x52,%al
ffff80000010d3bb:	52                   	push   %rdx
ffff80000010d3bc:	92                   	xchg   %eax,%edx
ffff80000010d3bd:	8c 00                	mov    %es,(%rax)
ffff80000010d3bf:	00 00                	add    %al,(%rax)
ffff80000010d3c1:	70 88                	jo     ffff80000010d34b <system_call_table+0x15eb>
ffff80000010d3c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010d3c9:	92                   	xchg   %eax,%edx
ffff80000010d3ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010d3d1:	08 10                	or     %dl,(%rax)
	...
ffff80000010d3df:	00 02                	add    %al,(%rdx)
ffff80000010d3e1:	04 08                	add    $0x8,%al
ffff80000010d3e3:	08 10                	or     %dl,(%rax)
ffff80000010d3e5:	10 10                	adc    %dl,(%rax)
ffff80000010d3e7:	10 10                	adc    %dl,(%rax)
ffff80000010d3e9:	10 10                	adc    %dl,(%rax)
ffff80000010d3eb:	08 08                	or     %cl,(%rax)
ffff80000010d3ed:	04 02                	add    $0x2,%al
ffff80000010d3ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010d3f5:	10 10                	adc    %dl,(%rax)
ffff80000010d3f7:	10 10                	adc    %dl,(%rax)
ffff80000010d3f9:	10 10                	adc    %dl,(%rax)
ffff80000010d3fb:	20 20                	and    %ah,(%rax)
ffff80000010d3fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d401:	00 00                	add    %al,(%rax)
ffff80000010d403:	00 00                	add    %al,(%rax)
ffff80000010d405:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010d40b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d415:	10 10                	adc    %dl,(%rax)
ffff80000010d417:	10 fe                	adc    %bh,%dh
ffff80000010d419:	10 10                	adc    %dl,(%rax)
ffff80000010d41b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d429:	00 00                	add    %al,(%rax)
ffff80000010d42b:	18 18                	sbb    %bl,(%rax)
ffff80000010d42d:	08 08                	or     %cl,(%rax)
ffff80000010d42f:	10 00                	adc    %al,(%rax)
ffff80000010d431:	00 00                	add    %al,(%rax)
ffff80000010d433:	00 00                	add    %al,(%rax)
ffff80000010d435:	00 00                	add    %al,(%rax)
ffff80000010d437:	00 fe                	add    %bh,%dh
	...
ffff80000010d449:	00 00                	add    %al,(%rax)
ffff80000010d44b:	00 18                	add    %bl,(%rax)
ffff80000010d44d:	18 00                	sbb    %al,(%rax)
ffff80000010d44f:	00 02                	add    %al,(%rdx)
ffff80000010d451:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010d454:	08 08                	or     %cl,(%rax)
ffff80000010d456:	08 10                	or     %dl,(%rax)
ffff80000010d458:	10 20                	adc    %ah,(%rax)
ffff80000010d45a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d45d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010d464:	42 
ffff80000010d465:	42                   	rex.X
ffff80000010d466:	42                   	rex.X
ffff80000010d467:	42                   	rex.X
ffff80000010d468:	42                   	rex.X
ffff80000010d469:	42                   	rex.X
ffff80000010d46a:	42 24 24             	rex.X and $0x24,%al
ffff80000010d46d:	18 00                	sbb    %al,(%rax)
ffff80000010d46f:	00 00                	add    %al,(%rax)
ffff80000010d471:	08 18                	or     %bl,(%rax)
ffff80000010d473:	28 08                	sub    %cl,(%rax)
ffff80000010d475:	08 08                	or     %cl,(%rax)
ffff80000010d477:	08 08                	or     %cl,(%rax)
ffff80000010d479:	08 08                	or     %cl,(%rax)
ffff80000010d47b:	08 08                	or     %cl,(%rax)
ffff80000010d47d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010d480:	00 18                	add    %bl,(%rax)
ffff80000010d482:	24 42                	and    $0x42,%al
ffff80000010d484:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010d488:	10 20                	adc    %ah,(%rax)
ffff80000010d48a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d48d:	7e 00                	jle    ffff80000010d48f <system_call_table+0x172f>
ffff80000010d48f:	00 00                	add    %al,(%rax)
ffff80000010d491:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010d494:	02 02                	add    (%rdx),%al
ffff80000010d496:	04 18                	add    $0x18,%al
ffff80000010d498:	04 02                	add    $0x2,%al
ffff80000010d49a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010d49d:	18 00                	sbb    %al,(%rax)
ffff80000010d49f:	00 00                	add    %al,(%rax)
ffff80000010d4a1:	0c 0c                	or     $0xc,%al
ffff80000010d4a3:	0c 14                	or     $0x14,%al
ffff80000010d4a5:	14 14                	adc    $0x14,%al
ffff80000010d4a7:	24 24                	and    $0x24,%al
ffff80000010d4a9:	44 7e 04             	rex.R jle ffff80000010d4b0 <system_call_table+0x1750>
ffff80000010d4ac:	04 1e                	add    $0x1e,%al
ffff80000010d4ae:	00 00                	add    %al,(%rax)
ffff80000010d4b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010d4b4:	40 58                	rex pop %rax
ffff80000010d4b6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010d4b9:	02 02                	add    (%rdx),%al
ffff80000010d4bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d4be:	00 00                	add    %al,(%rax)
ffff80000010d4c0:	00 18                	add    %bl,(%rax)
ffff80000010d4c2:	24 42                	and    $0x42,%al
ffff80000010d4c4:	40 58                	rex pop %rax
ffff80000010d4c6:	64 42                	fs rex.X
ffff80000010d4c8:	42                   	rex.X
ffff80000010d4c9:	42                   	rex.X
ffff80000010d4ca:	42                   	rex.X
ffff80000010d4cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d4ce:	00 00                	add    %al,(%rax)
ffff80000010d4d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010d4d3:	42 04 04             	rex.X add $0x4,%al
ffff80000010d4d6:	08 08                	or     %cl,(%rax)
ffff80000010d4d8:	08 10                	or     %dl,(%rax)
ffff80000010d4da:	10 10                	adc    %dl,(%rax)
ffff80000010d4dc:	10 38                	adc    %bh,(%rax)
ffff80000010d4de:	00 00                	add    %al,(%rax)
ffff80000010d4e0:	00 18                	add    %bl,(%rax)
ffff80000010d4e2:	24 42                	and    $0x42,%al
ffff80000010d4e4:	42                   	rex.X
ffff80000010d4e5:	42 24 18             	rex.X and $0x18,%al
ffff80000010d4e8:	24 42                	and    $0x42,%al
ffff80000010d4ea:	42                   	rex.X
ffff80000010d4eb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d4ee:	00 00                	add    %al,(%rax)
ffff80000010d4f0:	00 18                	add    %bl,(%rax)
ffff80000010d4f2:	24 42                	and    $0x42,%al
ffff80000010d4f4:	42                   	rex.X
ffff80000010d4f5:	42                   	rex.X
ffff80000010d4f6:	42                   	rex.X
ffff80000010d4f7:	42                   	rex.X
ffff80000010d4f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010d4fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d4fe:	00 00                	add    %al,(%rax)
ffff80000010d500:	00 00                	add    %al,(%rax)
ffff80000010d502:	00 00                	add    %al,(%rax)
ffff80000010d504:	00 18                	add    %bl,(%rax)
ffff80000010d506:	18 00                	sbb    %al,(%rax)
ffff80000010d508:	00 00                	add    %al,(%rax)
ffff80000010d50a:	00 00                	add    %al,(%rax)
ffff80000010d50c:	18 18                	sbb    %bl,(%rax)
ffff80000010d50e:	00 00                	add    %al,(%rax)
ffff80000010d510:	00 00                	add    %al,(%rax)
ffff80000010d512:	00 00                	add    %al,(%rax)
ffff80000010d514:	00 18                	add    %bl,(%rax)
ffff80000010d516:	18 00                	sbb    %al,(%rax)
ffff80000010d518:	00 00                	add    %al,(%rax)
ffff80000010d51a:	00 18                	add    %bl,(%rax)
ffff80000010d51c:	18 08                	sbb    %cl,(%rax)
ffff80000010d51e:	08 10                	or     %dl,(%rax)
ffff80000010d520:	00 02                	add    %al,(%rdx)
ffff80000010d522:	04 08                	add    $0x8,%al
ffff80000010d524:	10 20                	adc    %ah,(%rax)
ffff80000010d526:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010d52d:	04 
ffff80000010d52e:	02 00                	add    (%rax),%al
ffff80000010d530:	00 00                	add    %al,(%rax)
ffff80000010d532:	00 00                	add    %al,(%rax)
ffff80000010d534:	00 00                	add    %al,(%rax)
ffff80000010d536:	fe 00                	incb   (%rax)
ffff80000010d538:	00 fe                	add    %bh,%dh
ffff80000010d53a:	00 00                	add    %al,(%rax)
ffff80000010d53c:	00 00                	add    %al,(%rax)
ffff80000010d53e:	00 00                	add    %al,(%rax)
ffff80000010d540:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010d546:	04 02                	add    $0x2,%al
ffff80000010d548:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010d54b:	10 20                	adc    %ah,(%rax)
ffff80000010d54d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d551:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d555:	82                   	(bad)  
ffff80000010d556:	04 08                	add    $0x8,%al
ffff80000010d558:	10 10                	adc    %dl,(%rax)
ffff80000010d55a:	00 00                	add    %al,(%rax)
ffff80000010d55c:	18 18                	sbb    %bl,(%rax)
ffff80000010d55e:	00 00                	add    %al,(%rax)
ffff80000010d560:	00 38                	add    %bh,(%rax)
ffff80000010d562:	44 82                	rex.R (bad) 
ffff80000010d564:	9a                   	(bad)  
ffff80000010d565:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d566:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d567:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d568:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d569:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d56a:	9c                   	pushfq 
ffff80000010d56b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010d56f:	00 00                	add    %al,(%rax)
ffff80000010d571:	18 18                	sbb    %bl,(%rax)
ffff80000010d573:	18 18                	sbb    %bl,(%rax)
ffff80000010d575:	24 24                	and    $0x24,%al
ffff80000010d577:	24 24                	and    $0x24,%al
ffff80000010d579:	7e 42                	jle    ffff80000010d5bd <system_call_table+0x185d>
ffff80000010d57b:	42                   	rex.X
ffff80000010d57c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d57f:	00 00                	add    %al,(%rax)
ffff80000010d581:	f0 48                	lock rex.W
ffff80000010d583:	44                   	rex.R
ffff80000010d584:	44                   	rex.R
ffff80000010d585:	44                   	rex.R
ffff80000010d586:	48 78 44             	rex.W js ffff80000010d5cd <system_call_table+0x186d>
ffff80000010d589:	42                   	rex.X
ffff80000010d58a:	42                   	rex.X
ffff80000010d58b:	42                   	rex.X
ffff80000010d58c:	44 f8                	rex.R clc 
ffff80000010d58e:	00 00                	add    %al,(%rax)
ffff80000010d590:	00 3a                	add    %bh,(%rdx)
ffff80000010d592:	46                   	rex.RX
ffff80000010d593:	42 82                	rex.X (bad) 
ffff80000010d595:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010d59c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d59f:	00 00                	add    %al,(%rax)
ffff80000010d5a1:	f8                   	clc    
ffff80000010d5a2:	44                   	rex.R
ffff80000010d5a3:	44                   	rex.R
ffff80000010d5a4:	42                   	rex.X
ffff80000010d5a5:	42                   	rex.X
ffff80000010d5a6:	42                   	rex.X
ffff80000010d5a7:	42                   	rex.X
ffff80000010d5a8:	42                   	rex.X
ffff80000010d5a9:	42                   	rex.X
ffff80000010d5aa:	42                   	rex.X
ffff80000010d5ab:	44                   	rex.R
ffff80000010d5ac:	44 f8                	rex.R clc 
ffff80000010d5ae:	00 00                	add    %al,(%rax)
ffff80000010d5b0:	00 fe                	add    %bh,%dh
ffff80000010d5b2:	42                   	rex.X
ffff80000010d5b3:	42                   	rex.X
ffff80000010d5b4:	40                   	rex
ffff80000010d5b5:	40                   	rex
ffff80000010d5b6:	44 7c 44             	rex.R jl ffff80000010d5fd <system_call_table+0x189d>
ffff80000010d5b9:	40                   	rex
ffff80000010d5ba:	40                   	rex
ffff80000010d5bb:	42                   	rex.X
ffff80000010d5bc:	42 fe 00             	rex.X incb (%rax)
ffff80000010d5bf:	00 00                	add    %al,(%rax)
ffff80000010d5c1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010d5c4:	40                   	rex
ffff80000010d5c5:	40                   	rex
ffff80000010d5c6:	44 7c 44             	rex.R jl ffff80000010d60d <system_call_table+0x18ad>
ffff80000010d5c9:	44                   	rex.R
ffff80000010d5ca:	40                   	rex
ffff80000010d5cb:	40                   	rex
ffff80000010d5cc:	40                   	rex
ffff80000010d5cd:	f0 00 00             	lock add %al,(%rax)
ffff80000010d5d0:	00 3a                	add    %bh,(%rdx)
ffff80000010d5d2:	46                   	rex.RX
ffff80000010d5d3:	42 82                	rex.X (bad) 
ffff80000010d5d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010d5dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010d5df:	00 00                	add    %al,(%rax)
ffff80000010d5e1:	e7 42                	out    %eax,$0x42
ffff80000010d5e3:	42                   	rex.X
ffff80000010d5e4:	42                   	rex.X
ffff80000010d5e5:	42                   	rex.X
ffff80000010d5e6:	42 7e 42             	rex.X jle ffff80000010d62b <system_call_table+0x18cb>
ffff80000010d5e9:	42                   	rex.X
ffff80000010d5ea:	42                   	rex.X
ffff80000010d5eb:	42                   	rex.X
ffff80000010d5ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d5ef:	00 00                	add    %al,(%rax)
ffff80000010d5f1:	7c 10                	jl     ffff80000010d603 <system_call_table+0x18a3>
ffff80000010d5f3:	10 10                	adc    %dl,(%rax)
ffff80000010d5f5:	10 10                	adc    %dl,(%rax)
ffff80000010d5f7:	10 10                	adc    %dl,(%rax)
ffff80000010d5f9:	10 10                	adc    %dl,(%rax)
ffff80000010d5fb:	10 10                	adc    %dl,(%rax)
ffff80000010d5fd:	7c 00                	jl     ffff80000010d5ff <system_call_table+0x189f>
ffff80000010d5ff:	00 00                	add    %al,(%rax)
ffff80000010d601:	1f                   	(bad)  
ffff80000010d602:	04 04                	add    $0x4,%al
ffff80000010d604:	04 04                	add    $0x4,%al
ffff80000010d606:	04 04                	add    $0x4,%al
ffff80000010d608:	04 04                	add    $0x4,%al
ffff80000010d60a:	04 04                	add    $0x4,%al
ffff80000010d60c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010d60f:	00 00                	add    %al,(%rax)
ffff80000010d611:	e7 42                	out    %eax,$0x42
ffff80000010d613:	44                   	rex.R
ffff80000010d614:	48 50                	rex.W push %rax
ffff80000010d616:	50                   	push   %rax
ffff80000010d617:	60                   	(bad)  
ffff80000010d618:	50                   	push   %rax
ffff80000010d619:	50                   	push   %rax
ffff80000010d61a:	48                   	rex.W
ffff80000010d61b:	44                   	rex.R
ffff80000010d61c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d61f:	00 00                	add    %al,(%rax)
ffff80000010d621:	f0 40                	lock rex
ffff80000010d623:	40                   	rex
ffff80000010d624:	40                   	rex
ffff80000010d625:	40                   	rex
ffff80000010d626:	40                   	rex
ffff80000010d627:	40                   	rex
ffff80000010d628:	40                   	rex
ffff80000010d629:	40                   	rex
ffff80000010d62a:	40                   	rex
ffff80000010d62b:	42                   	rex.X
ffff80000010d62c:	42 fe 00             	rex.X incb (%rax)
ffff80000010d62f:	00 00                	add    %al,(%rax)
ffff80000010d631:	c3                   	retq   
ffff80000010d632:	42                   	rex.X
ffff80000010d633:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010d637:	5a                   	pop    %rdx
ffff80000010d638:	5a                   	pop    %rdx
ffff80000010d639:	42                   	rex.X
ffff80000010d63a:	42                   	rex.X
ffff80000010d63b:	42                   	rex.X
ffff80000010d63c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d63f:	00 00                	add    %al,(%rax)
ffff80000010d641:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010d648:	4a                   	rex.WX
ffff80000010d649:	4a                   	rex.WX
ffff80000010d64a:	4a                   	rex.WX
ffff80000010d64b:	46                   	rex.RX
ffff80000010d64c:	46 e2 00             	rex.RX loop ffff80000010d64f <system_call_table+0x18ef>
ffff80000010d64f:	00 00                	add    %al,(%rax)
ffff80000010d651:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d655:	82                   	(bad)  
ffff80000010d656:	82                   	(bad)  
ffff80000010d657:	82                   	(bad)  
ffff80000010d658:	82                   	(bad)  
ffff80000010d659:	82                   	(bad)  
ffff80000010d65a:	82                   	(bad)  
ffff80000010d65b:	82                   	(bad)  
ffff80000010d65c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d65f:	00 00                	add    %al,(%rax)
ffff80000010d661:	f8                   	clc    
ffff80000010d662:	44                   	rex.R
ffff80000010d663:	42                   	rex.X
ffff80000010d664:	42                   	rex.X
ffff80000010d665:	42                   	rex.X
ffff80000010d666:	44 78 40             	rex.R js ffff80000010d6a9 <system_call_table+0x1949>
ffff80000010d669:	40                   	rex
ffff80000010d66a:	40                   	rex
ffff80000010d66b:	40                   	rex
ffff80000010d66c:	40                   	rex
ffff80000010d66d:	f0 00 00             	lock add %al,(%rax)
ffff80000010d670:	00 38                	add    %bh,(%rax)
ffff80000010d672:	44 82                	rex.R (bad) 
ffff80000010d674:	82                   	(bad)  
ffff80000010d675:	82                   	(bad)  
ffff80000010d676:	82                   	(bad)  
ffff80000010d677:	82                   	(bad)  
ffff80000010d678:	82                   	(bad)  
ffff80000010d679:	82                   	(bad)  
ffff80000010d67a:	92                   	xchg   %eax,%edx
ffff80000010d67b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010d67f:	00 00                	add    %al,(%rax)
ffff80000010d681:	fc                   	cld    
ffff80000010d682:	42                   	rex.X
ffff80000010d683:	42                   	rex.X
ffff80000010d684:	42                   	rex.X
ffff80000010d685:	42 7c 44             	rex.X jl ffff80000010d6cc <system_call_table+0x196c>
ffff80000010d688:	42                   	rex.X
ffff80000010d689:	42                   	rex.X
ffff80000010d68a:	42                   	rex.X
ffff80000010d68b:	42                   	rex.X
ffff80000010d68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d68f:	00 00                	add    %al,(%rax)
ffff80000010d691:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010d694:	82                   	(bad)  
ffff80000010d695:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010d699:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010d69f:	00 00                	add    %al,(%rax)
ffff80000010d6a1:	fe                   	(bad)  
ffff80000010d6a2:	92                   	xchg   %eax,%edx
ffff80000010d6a3:	92                   	xchg   %eax,%edx
ffff80000010d6a4:	10 10                	adc    %dl,(%rax)
ffff80000010d6a6:	10 10                	adc    %dl,(%rax)
ffff80000010d6a8:	10 10                	adc    %dl,(%rax)
ffff80000010d6aa:	10 10                	adc    %dl,(%rax)
ffff80000010d6ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010d6b0:	00 e7                	add    %ah,%bh
ffff80000010d6b2:	42                   	rex.X
ffff80000010d6b3:	42                   	rex.X
ffff80000010d6b4:	42                   	rex.X
ffff80000010d6b5:	42                   	rex.X
ffff80000010d6b6:	42                   	rex.X
ffff80000010d6b7:	42                   	rex.X
ffff80000010d6b8:	42                   	rex.X
ffff80000010d6b9:	42                   	rex.X
ffff80000010d6ba:	42                   	rex.X
ffff80000010d6bb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010d6be:	00 00                	add    %al,(%rax)
ffff80000010d6c0:	00 e7                	add    %ah,%bh
ffff80000010d6c2:	42                   	rex.X
ffff80000010d6c3:	42                   	rex.X
ffff80000010d6c4:	42                   	rex.X
ffff80000010d6c5:	42 24 24             	rex.X and $0x24,%al
ffff80000010d6c8:	24 24                	and    $0x24,%al
ffff80000010d6ca:	18 18                	sbb    %bl,(%rax)
ffff80000010d6cc:	18 18                	sbb    %bl,(%rax)
ffff80000010d6ce:	00 00                	add    %al,(%rax)
ffff80000010d6d0:	00 e7                	add    %ah,%bh
ffff80000010d6d2:	42                   	rex.X
ffff80000010d6d3:	42                   	rex.X
ffff80000010d6d4:	42 5a                	rex.X pop %rdx
ffff80000010d6d6:	5a                   	pop    %rdx
ffff80000010d6d7:	5a                   	pop    %rdx
ffff80000010d6d8:	5a                   	pop    %rdx
ffff80000010d6d9:	24 24                	and    $0x24,%al
ffff80000010d6db:	24 24                	and    $0x24,%al
ffff80000010d6dd:	24 00                	and    $0x0,%al
ffff80000010d6df:	00 00                	add    %al,(%rax)
ffff80000010d6e1:	e7 42                	out    %eax,$0x42
ffff80000010d6e3:	42 24 24             	rex.X and $0x24,%al
ffff80000010d6e6:	24 18                	and    $0x18,%al
ffff80000010d6e8:	24 24                	and    $0x24,%al
ffff80000010d6ea:	24 42                	and    $0x42,%al
ffff80000010d6ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d6ef:	00 00                	add    %al,(%rax)
ffff80000010d6f1:	ee                   	out    %al,(%dx)
ffff80000010d6f2:	44                   	rex.R
ffff80000010d6f3:	44                   	rex.R
ffff80000010d6f4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010d6f7:	28 10                	sub    %dl,(%rax)
ffff80000010d6f9:	10 10                	adc    %dl,(%rax)
ffff80000010d6fb:	10 10                	adc    %dl,(%rax)
ffff80000010d6fd:	7c 00                	jl     ffff80000010d6ff <system_call_table+0x199f>
ffff80000010d6ff:	00 00                	add    %al,(%rax)
ffff80000010d701:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010d708:	20 20                	and    %ah,(%rax)
ffff80000010d70a:	40                   	rex
ffff80000010d70b:	42 82                	rex.X (bad) 
ffff80000010d70d:	fe 00                	incb   (%rax)
ffff80000010d70f:	00 00                	add    %al,(%rax)
ffff80000010d711:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010d714:	20 20                	and    %ah,(%rax)
ffff80000010d716:	20 20                	and    %ah,(%rax)
ffff80000010d718:	20 20                	and    %ah,(%rax)
ffff80000010d71a:	20 20                	and    %ah,(%rax)
ffff80000010d71c:	20 20                	and    %ah,(%rax)
ffff80000010d71e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010d725:	20 20                	and    %ah,(%rax)
ffff80000010d727:	10 10                	adc    %dl,(%rax)
ffff80000010d729:	08 08                	or     %cl,(%rax)
ffff80000010d72b:	04 04                	add    $0x4,%al
ffff80000010d72d:	04 02                	add    $0x2,%al
ffff80000010d72f:	02 00                	add    (%rax),%al
ffff80000010d731:	7c 04                	jl     ffff80000010d737 <system_call_table+0x19d7>
ffff80000010d733:	04 04                	add    $0x4,%al
ffff80000010d735:	04 04                	add    $0x4,%al
ffff80000010d737:	04 04                	add    $0x4,%al
ffff80000010d739:	04 04                	add    $0x4,%al
ffff80000010d73b:	04 04                	add    $0x4,%al
ffff80000010d73d:	04 7c                	add    $0x7c,%al
ffff80000010d73f:	00 00                	add    %al,(%rax)
ffff80000010d741:	10 28                	adc    %ch,(%rax)
ffff80000010d743:	44 82                	rex.R (bad) 
	...
ffff80000010d75d:	00 fe                	add    %bh,%dh
ffff80000010d75f:	00 10                	add    %dl,(%rax)
ffff80000010d761:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010d774:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010d777:	04 3c                	add    $0x3c,%al
ffff80000010d779:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010d780:	c0 
ffff80000010d781:	40                   	rex
ffff80000010d782:	40                   	rex
ffff80000010d783:	40                   	rex
ffff80000010d784:	40 58                	rex pop %rax
ffff80000010d786:	64 42                	fs rex.X
ffff80000010d788:	42                   	rex.X
ffff80000010d789:	42                   	rex.X
ffff80000010d78a:	42                   	rex.X
ffff80000010d78b:	42                   	rex.X
ffff80000010d78c:	64 58                	fs pop %rax
ffff80000010d78e:	00 00                	add    %al,(%rax)
ffff80000010d790:	00 00                	add    %al,(%rax)
ffff80000010d792:	00 00                	add    %al,(%rax)
ffff80000010d794:	00 30                	add    %dh,(%rax)
ffff80000010d796:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010d79d:	38 
ffff80000010d79e:	00 00                	add    %al,(%rax)
ffff80000010d7a0:	0c 04                	or     $0x4,%al
ffff80000010d7a2:	04 04                	add    $0x4,%al
ffff80000010d7a4:	04 34                	add    $0x34,%al
ffff80000010d7a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010d7ad:	36 
ffff80000010d7ae:	00 00                	add    %al,(%rax)
ffff80000010d7b0:	00 00                	add    %al,(%rax)
ffff80000010d7b2:	00 00                	add    %al,(%rax)
ffff80000010d7b4:	00 38                	add    %bh,(%rax)
ffff80000010d7b6:	44 82                	rex.R (bad) 
ffff80000010d7b8:	82                   	(bad)  
ffff80000010d7b9:	fc                   	cld    
ffff80000010d7ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010d7c1:	10 10                	adc    %dl,(%rax)
ffff80000010d7c3:	10 10                	adc    %dl,(%rax)
ffff80000010d7c5:	7c 10                	jl     ffff80000010d7d7 <system_call_table+0x1a77>
ffff80000010d7c7:	10 10                	adc    %dl,(%rax)
ffff80000010d7c9:	10 10                	adc    %dl,(%rax)
ffff80000010d7cb:	10 10                	adc    %dl,(%rax)
ffff80000010d7cd:	7c 00                	jl     ffff80000010d7cf <system_call_table+0x1a6f>
ffff80000010d7cf:	00 00                	add    %al,(%rax)
ffff80000010d7d1:	00 00                	add    %al,(%rax)
ffff80000010d7d3:	00 00                	add    %al,(%rax)
ffff80000010d7d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010d7dc:	34 04 
ffff80000010d7de:	04 38                	add    $0x38,%al
ffff80000010d7e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010d7e4:	40 58                	rex pop %rax
ffff80000010d7e6:	64 42                	fs rex.X
ffff80000010d7e8:	42                   	rex.X
ffff80000010d7e9:	42                   	rex.X
ffff80000010d7ea:	42                   	rex.X
ffff80000010d7eb:	42                   	rex.X
ffff80000010d7ec:	42 e3 00             	rex.X jrcxz ffff80000010d7ef <system_call_table+0x1a8f>
ffff80000010d7ef:	00 00                	add    %al,(%rax)
ffff80000010d7f1:	10 10                	adc    %dl,(%rax)
ffff80000010d7f3:	00 00                	add    %al,(%rax)
ffff80000010d7f5:	30 10                	xor    %dl,(%rax)
ffff80000010d7f7:	10 10                	adc    %dl,(%rax)
ffff80000010d7f9:	10 10                	adc    %dl,(%rax)
ffff80000010d7fb:	10 10                	adc    %dl,(%rax)
ffff80000010d7fd:	38 00                	cmp    %al,(%rax)
ffff80000010d7ff:	00 00                	add    %al,(%rax)
ffff80000010d801:	04 04                	add    $0x4,%al
ffff80000010d803:	00 00                	add    %al,(%rax)
ffff80000010d805:	0c 04                	or     $0x4,%al
ffff80000010d807:	04 04                	add    $0x4,%al
ffff80000010d809:	04 04                	add    $0x4,%al
ffff80000010d80b:	04 04                	add    $0x4,%al
ffff80000010d80d:	08 08                	or     %cl,(%rax)
ffff80000010d80f:	30 c0                	xor    %al,%al
ffff80000010d811:	40                   	rex
ffff80000010d812:	40                   	rex
ffff80000010d813:	40                   	rex
ffff80000010d814:	40                   	rex
ffff80000010d815:	4e                   	rex.WRX
ffff80000010d816:	44                   	rex.R
ffff80000010d817:	48 50                	rex.W push %rax
ffff80000010d819:	60                   	(bad)  
ffff80000010d81a:	50                   	push   %rax
ffff80000010d81b:	48                   	rex.W
ffff80000010d81c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010d81f:	00 30                	add    %dh,(%rax)
ffff80000010d821:	10 10                	adc    %dl,(%rax)
ffff80000010d823:	10 10                	adc    %dl,(%rax)
ffff80000010d825:	10 10                	adc    %dl,(%rax)
ffff80000010d827:	10 10                	adc    %dl,(%rax)
ffff80000010d829:	10 10                	adc    %dl,(%rax)
ffff80000010d82b:	10 10                	adc    %dl,(%rax)
ffff80000010d82d:	38 00                	cmp    %al,(%rax)
ffff80000010d82f:	00 00                	add    %al,(%rax)
ffff80000010d831:	00 00                	add    %al,(%rax)
ffff80000010d833:	00 00                	add    %al,(%rax)
ffff80000010d835:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010d839:	49                   	rex.WB
ffff80000010d83a:	49                   	rex.WB
ffff80000010d83b:	49                   	rex.WB
ffff80000010d83c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010d83f:	00 00                	add    %al,(%rax)
ffff80000010d841:	00 00                	add    %al,(%rax)
ffff80000010d843:	00 00                	add    %al,(%rax)
ffff80000010d845:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010d849:	42                   	rex.X
ffff80000010d84a:	42                   	rex.X
ffff80000010d84b:	42                   	rex.X
ffff80000010d84c:	42 e3 00             	rex.X jrcxz ffff80000010d84f <system_call_table+0x1aef>
ffff80000010d84f:	00 00                	add    %al,(%rax)
ffff80000010d851:	00 00                	add    %al,(%rax)
ffff80000010d853:	00 00                	add    %al,(%rax)
ffff80000010d855:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d859:	82                   	(bad)  
ffff80000010d85a:	82                   	(bad)  
ffff80000010d85b:	82                   	(bad)  
ffff80000010d85c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d85f:	00 00                	add    %al,(%rax)
ffff80000010d861:	00 00                	add    %al,(%rax)
ffff80000010d863:	00 d8                	add    %bl,%al
ffff80000010d865:	64 42                	fs rex.X
ffff80000010d867:	42                   	rex.X
ffff80000010d868:	42                   	rex.X
ffff80000010d869:	42                   	rex.X
ffff80000010d86a:	42                   	rex.X
ffff80000010d86b:	64 58                	fs pop %rax
ffff80000010d86d:	40                   	rex
ffff80000010d86e:	40 e0 00             	rex loopne ffff80000010d871 <system_call_table+0x1b11>
ffff80000010d871:	00 00                	add    %al,(%rax)
ffff80000010d873:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010d876:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010d87d:	04 04                	add    $0x4,%al
ffff80000010d87f:	0e                   	(bad)  
ffff80000010d880:	00 00                	add    %al,(%rax)
ffff80000010d882:	00 00                	add    %al,(%rax)
ffff80000010d884:	00 dc                	add    %bl,%ah
ffff80000010d886:	62 42                	(bad)  
ffff80000010d888:	40                   	rex
ffff80000010d889:	40                   	rex
ffff80000010d88a:	40                   	rex
ffff80000010d88b:	40                   	rex
ffff80000010d88c:	40 e0 00             	rex loopne ffff80000010d88f <system_call_table+0x1b2f>
ffff80000010d88f:	00 00                	add    %al,(%rax)
ffff80000010d891:	00 00                	add    %al,(%rax)
ffff80000010d893:	00 00                	add    %al,(%rax)
ffff80000010d895:	7a 86                	jp     ffff80000010d81d <system_call_table+0x1abd>
ffff80000010d897:	82                   	(bad)  
ffff80000010d898:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010d89b:	82                   	(bad)  
ffff80000010d89c:	c2 bc 00             	retq   $0xbc
ffff80000010d89f:	00 00                	add    %al,(%rax)
ffff80000010d8a1:	00 10                	add    %dl,(%rax)
ffff80000010d8a3:	10 10                	adc    %dl,(%rax)
ffff80000010d8a5:	7c 10                	jl     ffff80000010d8b7 <system_call_table+0x1b57>
ffff80000010d8a7:	10 10                	adc    %dl,(%rax)
ffff80000010d8a9:	10 10                	adc    %dl,(%rax)
ffff80000010d8ab:	10 10                	adc    %dl,(%rax)
ffff80000010d8ad:	0e                   	(bad)  
ffff80000010d8ae:	00 00                	add    %al,(%rax)
ffff80000010d8b0:	00 00                	add    %al,(%rax)
ffff80000010d8b2:	00 00                	add    %al,(%rax)
ffff80000010d8b4:	00 c6                	add    %al,%dh
ffff80000010d8b6:	42                   	rex.X
ffff80000010d8b7:	42                   	rex.X
ffff80000010d8b8:	42                   	rex.X
ffff80000010d8b9:	42                   	rex.X
ffff80000010d8ba:	42                   	rex.X
ffff80000010d8bb:	42                   	rex.X
ffff80000010d8bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010d8bf:	00 00                	add    %al,(%rax)
ffff80000010d8c1:	00 00                	add    %al,(%rax)
ffff80000010d8c3:	00 00                	add    %al,(%rax)
ffff80000010d8c5:	e7 42                	out    %eax,$0x42
ffff80000010d8c7:	42                   	rex.X
ffff80000010d8c8:	42 24 24             	rex.X and $0x24,%al
ffff80000010d8cb:	24 18                	and    $0x18,%al
ffff80000010d8cd:	18 00                	sbb    %al,(%rax)
ffff80000010d8cf:	00 00                	add    %al,(%rax)
ffff80000010d8d1:	00 00                	add    %al,(%rax)
ffff80000010d8d3:	00 00                	add    %al,(%rax)
ffff80000010d8d5:	e7 42                	out    %eax,$0x42
ffff80000010d8d7:	42 5a                	rex.X pop %rdx
ffff80000010d8d9:	5a                   	pop    %rdx
ffff80000010d8da:	5a                   	pop    %rdx
ffff80000010d8db:	24 24                	and    $0x24,%al
ffff80000010d8dd:	24 00                	and    $0x0,%al
ffff80000010d8df:	00 00                	add    %al,(%rax)
ffff80000010d8e1:	00 00                	add    %al,(%rax)
ffff80000010d8e3:	00 00                	add    %al,(%rax)
ffff80000010d8e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010d8ea:	28 28                	sub    %ch,(%rax)
ffff80000010d8ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010d8f0:	00 00                	add    %al,(%rax)
ffff80000010d8f2:	00 00                	add    %al,(%rax)
ffff80000010d8f4:	00 e7                	add    %ah,%bh
ffff80000010d8f6:	42                   	rex.X
ffff80000010d8f7:	42 24 24             	rex.X and $0x24,%al
ffff80000010d8fa:	24 18                	and    $0x18,%al
ffff80000010d8fc:	18 10                	sbb    %dl,(%rax)
ffff80000010d8fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010d901:	00 00                	add    %al,(%rax)
ffff80000010d903:	00 00                	add    %al,(%rax)
ffff80000010d905:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010d90b:	42 82                	rex.X (bad) 
ffff80000010d90d:	fe 00                	incb   (%rax)
ffff80000010d90f:	00 00                	add    %al,(%rax)
ffff80000010d911:	06                   	(bad)  
ffff80000010d912:	08 10                	or     %dl,(%rax)
ffff80000010d914:	10 10                	adc    %dl,(%rax)
ffff80000010d916:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010d919:	10 10                	adc    %dl,(%rax)
ffff80000010d91b:	10 08                	adc    %cl,(%rax)
ffff80000010d91d:	06                   	(bad)  
ffff80000010d91e:	00 00                	add    %al,(%rax)
ffff80000010d920:	10 10                	adc    %dl,(%rax)
ffff80000010d922:	10 10                	adc    %dl,(%rax)
ffff80000010d924:	10 10                	adc    %dl,(%rax)
ffff80000010d926:	10 10                	adc    %dl,(%rax)
ffff80000010d928:	10 10                	adc    %dl,(%rax)
ffff80000010d92a:	10 10                	adc    %dl,(%rax)
ffff80000010d92c:	10 10                	adc    %dl,(%rax)
ffff80000010d92e:	10 10                	adc    %dl,(%rax)
ffff80000010d930:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010d933:	08 08                	or     %cl,(%rax)
ffff80000010d935:	08 08                	or     %cl,(%rax)
ffff80000010d937:	06                   	(bad)  
ffff80000010d938:	08 08                	or     %cl,(%rax)
ffff80000010d93a:	08 08                	or     %cl,(%rax)
ffff80000010d93c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010d93f:	00 00                	add    %al,(%rax)
ffff80000010d941:	72 8c                	jb     ffff80000010d8cf <system_call_table+0x1b6f>
	...
ffff80000010e36f:	00 00                	add    %al,(%rax)
ffff80000010e371:	10 10                	adc    %dl,(%rax)
ffff80000010e373:	10 10                	adc    %dl,(%rax)
ffff80000010e375:	10 10                	adc    %dl,(%rax)
ffff80000010e377:	10 10                	adc    %dl,(%rax)
ffff80000010e379:	10 00                	adc    %al,(%rax)
ffff80000010e37b:	00 10                	add    %dl,(%rax)
ffff80000010e37d:	10 00                	adc    %al,(%rax)
ffff80000010e37f:	00 28                	add    %ch,(%rax)
ffff80000010e381:	28 28                	sub    %ch,(%rax)
	...
ffff80000010e38f:	00 00                	add    %al,(%rax)
ffff80000010e391:	44                   	rex.R
ffff80000010e392:	44                   	rex.R
ffff80000010e393:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e398:	44                   	rex.R
ffff80000010e399:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e39e:	00 00                	add    %al,(%rax)
ffff80000010e3a0:	10 3a                	adc    %bh,(%rdx)
ffff80000010e3a2:	56                   	push   %rsi
ffff80000010e3a3:	92                   	xchg   %eax,%edx
ffff80000010e3a4:	92                   	xchg   %eax,%edx
ffff80000010e3a5:	90                   	nop
ffff80000010e3a6:	50                   	push   %rax
ffff80000010e3a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010e3aa:	92                   	xchg   %eax,%edx
ffff80000010e3ab:	92                   	xchg   %eax,%edx
ffff80000010e3ac:	d4                   	(bad)  
ffff80000010e3ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010e3b2:	94                   	xchg   %eax,%esp
ffff80000010e3b3:	94                   	xchg   %eax,%esp
ffff80000010e3b4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010e3b9:	2c 52                	sub    $0x52,%al
ffff80000010e3bb:	52                   	push   %rdx
ffff80000010e3bc:	92                   	xchg   %eax,%edx
ffff80000010e3bd:	8c 00                	mov    %es,(%rax)
ffff80000010e3bf:	00 00                	add    %al,(%rax)
ffff80000010e3c1:	70 88                	jo     ffff80000010e34b <system_call_table+0x25eb>
ffff80000010e3c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010e3c9:	92                   	xchg   %eax,%edx
ffff80000010e3ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010e3d1:	08 10                	or     %dl,(%rax)
	...
ffff80000010e3df:	00 02                	add    %al,(%rdx)
ffff80000010e3e1:	04 08                	add    $0x8,%al
ffff80000010e3e3:	08 10                	or     %dl,(%rax)
ffff80000010e3e5:	10 10                	adc    %dl,(%rax)
ffff80000010e3e7:	10 10                	adc    %dl,(%rax)
ffff80000010e3e9:	10 10                	adc    %dl,(%rax)
ffff80000010e3eb:	08 08                	or     %cl,(%rax)
ffff80000010e3ed:	04 02                	add    $0x2,%al
ffff80000010e3ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010e3f5:	10 10                	adc    %dl,(%rax)
ffff80000010e3f7:	10 10                	adc    %dl,(%rax)
ffff80000010e3f9:	10 10                	adc    %dl,(%rax)
ffff80000010e3fb:	20 20                	and    %ah,(%rax)
ffff80000010e3fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e401:	00 00                	add    %al,(%rax)
ffff80000010e403:	00 00                	add    %al,(%rax)
ffff80000010e405:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010e40b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e415:	10 10                	adc    %dl,(%rax)
ffff80000010e417:	10 fe                	adc    %bh,%dh
ffff80000010e419:	10 10                	adc    %dl,(%rax)
ffff80000010e41b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e429:	00 00                	add    %al,(%rax)
ffff80000010e42b:	18 18                	sbb    %bl,(%rax)
ffff80000010e42d:	08 08                	or     %cl,(%rax)
ffff80000010e42f:	10 00                	adc    %al,(%rax)
ffff80000010e431:	00 00                	add    %al,(%rax)
ffff80000010e433:	00 00                	add    %al,(%rax)
ffff80000010e435:	00 00                	add    %al,(%rax)
ffff80000010e437:	00 fe                	add    %bh,%dh
	...
ffff80000010e449:	00 00                	add    %al,(%rax)
ffff80000010e44b:	00 18                	add    %bl,(%rax)
ffff80000010e44d:	18 00                	sbb    %al,(%rax)
ffff80000010e44f:	00 02                	add    %al,(%rdx)
ffff80000010e451:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010e454:	08 08                	or     %cl,(%rax)
ffff80000010e456:	08 10                	or     %dl,(%rax)
ffff80000010e458:	10 20                	adc    %ah,(%rax)
ffff80000010e45a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e45d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010e464:	42 
ffff80000010e465:	42                   	rex.X
ffff80000010e466:	42                   	rex.X
ffff80000010e467:	42                   	rex.X
ffff80000010e468:	42                   	rex.X
ffff80000010e469:	42                   	rex.X
ffff80000010e46a:	42 24 24             	rex.X and $0x24,%al
ffff80000010e46d:	18 00                	sbb    %al,(%rax)
ffff80000010e46f:	00 00                	add    %al,(%rax)
ffff80000010e471:	08 18                	or     %bl,(%rax)
ffff80000010e473:	28 08                	sub    %cl,(%rax)
ffff80000010e475:	08 08                	or     %cl,(%rax)
ffff80000010e477:	08 08                	or     %cl,(%rax)
ffff80000010e479:	08 08                	or     %cl,(%rax)
ffff80000010e47b:	08 08                	or     %cl,(%rax)
ffff80000010e47d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010e480:	00 18                	add    %bl,(%rax)
ffff80000010e482:	24 42                	and    $0x42,%al
ffff80000010e484:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010e488:	10 20                	adc    %ah,(%rax)
ffff80000010e48a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e48d:	7e 00                	jle    ffff80000010e48f <system_call_table+0x272f>
ffff80000010e48f:	00 00                	add    %al,(%rax)
ffff80000010e491:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010e494:	02 02                	add    (%rdx),%al
ffff80000010e496:	04 18                	add    $0x18,%al
ffff80000010e498:	04 02                	add    $0x2,%al
ffff80000010e49a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010e49d:	18 00                	sbb    %al,(%rax)
ffff80000010e49f:	00 00                	add    %al,(%rax)
ffff80000010e4a1:	0c 0c                	or     $0xc,%al
ffff80000010e4a3:	0c 14                	or     $0x14,%al
ffff80000010e4a5:	14 14                	adc    $0x14,%al
ffff80000010e4a7:	24 24                	and    $0x24,%al
ffff80000010e4a9:	44 7e 04             	rex.R jle ffff80000010e4b0 <system_call_table+0x2750>
ffff80000010e4ac:	04 1e                	add    $0x1e,%al
ffff80000010e4ae:	00 00                	add    %al,(%rax)
ffff80000010e4b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010e4b4:	40 58                	rex pop %rax
ffff80000010e4b6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010e4b9:	02 02                	add    (%rdx),%al
ffff80000010e4bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e4be:	00 00                	add    %al,(%rax)
ffff80000010e4c0:	00 18                	add    %bl,(%rax)
ffff80000010e4c2:	24 42                	and    $0x42,%al
ffff80000010e4c4:	40 58                	rex pop %rax
ffff80000010e4c6:	64 42                	fs rex.X
ffff80000010e4c8:	42                   	rex.X
ffff80000010e4c9:	42                   	rex.X
ffff80000010e4ca:	42                   	rex.X
ffff80000010e4cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e4ce:	00 00                	add    %al,(%rax)
ffff80000010e4d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010e4d3:	42 04 04             	rex.X add $0x4,%al
ffff80000010e4d6:	08 08                	or     %cl,(%rax)
ffff80000010e4d8:	08 10                	or     %dl,(%rax)
ffff80000010e4da:	10 10                	adc    %dl,(%rax)
ffff80000010e4dc:	10 38                	adc    %bh,(%rax)
ffff80000010e4de:	00 00                	add    %al,(%rax)
ffff80000010e4e0:	00 18                	add    %bl,(%rax)
ffff80000010e4e2:	24 42                	and    $0x42,%al
ffff80000010e4e4:	42                   	rex.X
ffff80000010e4e5:	42 24 18             	rex.X and $0x18,%al
ffff80000010e4e8:	24 42                	and    $0x42,%al
ffff80000010e4ea:	42                   	rex.X
ffff80000010e4eb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e4ee:	00 00                	add    %al,(%rax)
ffff80000010e4f0:	00 18                	add    %bl,(%rax)
ffff80000010e4f2:	24 42                	and    $0x42,%al
ffff80000010e4f4:	42                   	rex.X
ffff80000010e4f5:	42                   	rex.X
ffff80000010e4f6:	42                   	rex.X
ffff80000010e4f7:	42                   	rex.X
ffff80000010e4f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010e4fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e4fe:	00 00                	add    %al,(%rax)
ffff80000010e500:	00 00                	add    %al,(%rax)
ffff80000010e502:	00 00                	add    %al,(%rax)
ffff80000010e504:	00 18                	add    %bl,(%rax)
ffff80000010e506:	18 00                	sbb    %al,(%rax)
ffff80000010e508:	00 00                	add    %al,(%rax)
ffff80000010e50a:	00 00                	add    %al,(%rax)
ffff80000010e50c:	18 18                	sbb    %bl,(%rax)
ffff80000010e50e:	00 00                	add    %al,(%rax)
ffff80000010e510:	00 00                	add    %al,(%rax)
ffff80000010e512:	00 00                	add    %al,(%rax)
ffff80000010e514:	00 18                	add    %bl,(%rax)
ffff80000010e516:	18 00                	sbb    %al,(%rax)
ffff80000010e518:	00 00                	add    %al,(%rax)
ffff80000010e51a:	00 18                	add    %bl,(%rax)
ffff80000010e51c:	18 08                	sbb    %cl,(%rax)
ffff80000010e51e:	08 10                	or     %dl,(%rax)
ffff80000010e520:	00 02                	add    %al,(%rdx)
ffff80000010e522:	04 08                	add    $0x8,%al
ffff80000010e524:	10 20                	adc    %ah,(%rax)
ffff80000010e526:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010e52d:	04 
ffff80000010e52e:	02 00                	add    (%rax),%al
ffff80000010e530:	00 00                	add    %al,(%rax)
ffff80000010e532:	00 00                	add    %al,(%rax)
ffff80000010e534:	00 00                	add    %al,(%rax)
ffff80000010e536:	fe 00                	incb   (%rax)
ffff80000010e538:	00 fe                	add    %bh,%dh
ffff80000010e53a:	00 00                	add    %al,(%rax)
ffff80000010e53c:	00 00                	add    %al,(%rax)
ffff80000010e53e:	00 00                	add    %al,(%rax)
ffff80000010e540:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010e546:	04 02                	add    $0x2,%al
ffff80000010e548:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010e54b:	10 20                	adc    %ah,(%rax)
ffff80000010e54d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e551:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e555:	82                   	(bad)  
ffff80000010e556:	04 08                	add    $0x8,%al
ffff80000010e558:	10 10                	adc    %dl,(%rax)
ffff80000010e55a:	00 00                	add    %al,(%rax)
ffff80000010e55c:	18 18                	sbb    %bl,(%rax)
ffff80000010e55e:	00 00                	add    %al,(%rax)
ffff80000010e560:	00 38                	add    %bh,(%rax)
ffff80000010e562:	44 82                	rex.R (bad) 
ffff80000010e564:	9a                   	(bad)  
ffff80000010e565:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e566:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e567:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e568:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e569:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e56a:	9c                   	pushfq 
ffff80000010e56b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010e56f:	00 00                	add    %al,(%rax)
ffff80000010e571:	18 18                	sbb    %bl,(%rax)
ffff80000010e573:	18 18                	sbb    %bl,(%rax)
ffff80000010e575:	24 24                	and    $0x24,%al
ffff80000010e577:	24 24                	and    $0x24,%al
ffff80000010e579:	7e 42                	jle    ffff80000010e5bd <system_call_table+0x285d>
ffff80000010e57b:	42                   	rex.X
ffff80000010e57c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e57f:	00 00                	add    %al,(%rax)
ffff80000010e581:	f0 48                	lock rex.W
ffff80000010e583:	44                   	rex.R
ffff80000010e584:	44                   	rex.R
ffff80000010e585:	44                   	rex.R
ffff80000010e586:	48 78 44             	rex.W js ffff80000010e5cd <system_call_table+0x286d>
ffff80000010e589:	42                   	rex.X
ffff80000010e58a:	42                   	rex.X
ffff80000010e58b:	42                   	rex.X
ffff80000010e58c:	44 f8                	rex.R clc 
ffff80000010e58e:	00 00                	add    %al,(%rax)
ffff80000010e590:	00 3a                	add    %bh,(%rdx)
ffff80000010e592:	46                   	rex.RX
ffff80000010e593:	42 82                	rex.X (bad) 
ffff80000010e595:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010e59c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e59f:	00 00                	add    %al,(%rax)
ffff80000010e5a1:	f8                   	clc    
ffff80000010e5a2:	44                   	rex.R
ffff80000010e5a3:	44                   	rex.R
ffff80000010e5a4:	42                   	rex.X
ffff80000010e5a5:	42                   	rex.X
ffff80000010e5a6:	42                   	rex.X
ffff80000010e5a7:	42                   	rex.X
ffff80000010e5a8:	42                   	rex.X
ffff80000010e5a9:	42                   	rex.X
ffff80000010e5aa:	42                   	rex.X
ffff80000010e5ab:	44                   	rex.R
ffff80000010e5ac:	44 f8                	rex.R clc 
ffff80000010e5ae:	00 00                	add    %al,(%rax)
ffff80000010e5b0:	00 fe                	add    %bh,%dh
ffff80000010e5b2:	42                   	rex.X
ffff80000010e5b3:	42                   	rex.X
ffff80000010e5b4:	40                   	rex
ffff80000010e5b5:	40                   	rex
ffff80000010e5b6:	44 7c 44             	rex.R jl ffff80000010e5fd <system_call_table+0x289d>
ffff80000010e5b9:	40                   	rex
ffff80000010e5ba:	40                   	rex
ffff80000010e5bb:	42                   	rex.X
ffff80000010e5bc:	42 fe 00             	rex.X incb (%rax)
ffff80000010e5bf:	00 00                	add    %al,(%rax)
ffff80000010e5c1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010e5c4:	40                   	rex
ffff80000010e5c5:	40                   	rex
ffff80000010e5c6:	44 7c 44             	rex.R jl ffff80000010e60d <system_call_table+0x28ad>
ffff80000010e5c9:	44                   	rex.R
ffff80000010e5ca:	40                   	rex
ffff80000010e5cb:	40                   	rex
ffff80000010e5cc:	40                   	rex
ffff80000010e5cd:	f0 00 00             	lock add %al,(%rax)
ffff80000010e5d0:	00 3a                	add    %bh,(%rdx)
ffff80000010e5d2:	46                   	rex.RX
ffff80000010e5d3:	42 82                	rex.X (bad) 
ffff80000010e5d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010e5dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010e5df:	00 00                	add    %al,(%rax)
ffff80000010e5e1:	e7 42                	out    %eax,$0x42
ffff80000010e5e3:	42                   	rex.X
ffff80000010e5e4:	42                   	rex.X
ffff80000010e5e5:	42                   	rex.X
ffff80000010e5e6:	42 7e 42             	rex.X jle ffff80000010e62b <system_call_table+0x28cb>
ffff80000010e5e9:	42                   	rex.X
ffff80000010e5ea:	42                   	rex.X
ffff80000010e5eb:	42                   	rex.X
ffff80000010e5ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e5ef:	00 00                	add    %al,(%rax)
ffff80000010e5f1:	7c 10                	jl     ffff80000010e603 <system_call_table+0x28a3>
ffff80000010e5f3:	10 10                	adc    %dl,(%rax)
ffff80000010e5f5:	10 10                	adc    %dl,(%rax)
ffff80000010e5f7:	10 10                	adc    %dl,(%rax)
ffff80000010e5f9:	10 10                	adc    %dl,(%rax)
ffff80000010e5fb:	10 10                	adc    %dl,(%rax)
ffff80000010e5fd:	7c 00                	jl     ffff80000010e5ff <system_call_table+0x289f>
ffff80000010e5ff:	00 00                	add    %al,(%rax)
ffff80000010e601:	1f                   	(bad)  
ffff80000010e602:	04 04                	add    $0x4,%al
ffff80000010e604:	04 04                	add    $0x4,%al
ffff80000010e606:	04 04                	add    $0x4,%al
ffff80000010e608:	04 04                	add    $0x4,%al
ffff80000010e60a:	04 04                	add    $0x4,%al
ffff80000010e60c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010e60f:	00 00                	add    %al,(%rax)
ffff80000010e611:	e7 42                	out    %eax,$0x42
ffff80000010e613:	44                   	rex.R
ffff80000010e614:	48 50                	rex.W push %rax
ffff80000010e616:	50                   	push   %rax
ffff80000010e617:	60                   	(bad)  
ffff80000010e618:	50                   	push   %rax
ffff80000010e619:	50                   	push   %rax
ffff80000010e61a:	48                   	rex.W
ffff80000010e61b:	44                   	rex.R
ffff80000010e61c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e61f:	00 00                	add    %al,(%rax)
ffff80000010e621:	f0 40                	lock rex
ffff80000010e623:	40                   	rex
ffff80000010e624:	40                   	rex
ffff80000010e625:	40                   	rex
ffff80000010e626:	40                   	rex
ffff80000010e627:	40                   	rex
ffff80000010e628:	40                   	rex
ffff80000010e629:	40                   	rex
ffff80000010e62a:	40                   	rex
ffff80000010e62b:	42                   	rex.X
ffff80000010e62c:	42 fe 00             	rex.X incb (%rax)
ffff80000010e62f:	00 00                	add    %al,(%rax)
ffff80000010e631:	c3                   	retq   
ffff80000010e632:	42                   	rex.X
ffff80000010e633:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010e637:	5a                   	pop    %rdx
ffff80000010e638:	5a                   	pop    %rdx
ffff80000010e639:	42                   	rex.X
ffff80000010e63a:	42                   	rex.X
ffff80000010e63b:	42                   	rex.X
ffff80000010e63c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e63f:	00 00                	add    %al,(%rax)
ffff80000010e641:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010e648:	4a                   	rex.WX
ffff80000010e649:	4a                   	rex.WX
ffff80000010e64a:	4a                   	rex.WX
ffff80000010e64b:	46                   	rex.RX
ffff80000010e64c:	46 e2 00             	rex.RX loop ffff80000010e64f <system_call_table+0x28ef>
ffff80000010e64f:	00 00                	add    %al,(%rax)
ffff80000010e651:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e655:	82                   	(bad)  
ffff80000010e656:	82                   	(bad)  
ffff80000010e657:	82                   	(bad)  
ffff80000010e658:	82                   	(bad)  
ffff80000010e659:	82                   	(bad)  
ffff80000010e65a:	82                   	(bad)  
ffff80000010e65b:	82                   	(bad)  
ffff80000010e65c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e65f:	00 00                	add    %al,(%rax)
ffff80000010e661:	f8                   	clc    
ffff80000010e662:	44                   	rex.R
ffff80000010e663:	42                   	rex.X
ffff80000010e664:	42                   	rex.X
ffff80000010e665:	42                   	rex.X
ffff80000010e666:	44 78 40             	rex.R js ffff80000010e6a9 <system_call_table+0x2949>
ffff80000010e669:	40                   	rex
ffff80000010e66a:	40                   	rex
ffff80000010e66b:	40                   	rex
ffff80000010e66c:	40                   	rex
ffff80000010e66d:	f0 00 00             	lock add %al,(%rax)
ffff80000010e670:	00 38                	add    %bh,(%rax)
ffff80000010e672:	44 82                	rex.R (bad) 
ffff80000010e674:	82                   	(bad)  
ffff80000010e675:	82                   	(bad)  
ffff80000010e676:	82                   	(bad)  
ffff80000010e677:	82                   	(bad)  
ffff80000010e678:	82                   	(bad)  
ffff80000010e679:	82                   	(bad)  
ffff80000010e67a:	92                   	xchg   %eax,%edx
ffff80000010e67b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010e67f:	00 00                	add    %al,(%rax)
ffff80000010e681:	fc                   	cld    
ffff80000010e682:	42                   	rex.X
ffff80000010e683:	42                   	rex.X
ffff80000010e684:	42                   	rex.X
ffff80000010e685:	42 7c 44             	rex.X jl ffff80000010e6cc <system_call_table+0x296c>
ffff80000010e688:	42                   	rex.X
ffff80000010e689:	42                   	rex.X
ffff80000010e68a:	42                   	rex.X
ffff80000010e68b:	42                   	rex.X
ffff80000010e68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e68f:	00 00                	add    %al,(%rax)
ffff80000010e691:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010e694:	82                   	(bad)  
ffff80000010e695:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010e699:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010e69f:	00 00                	add    %al,(%rax)
ffff80000010e6a1:	fe                   	(bad)  
ffff80000010e6a2:	92                   	xchg   %eax,%edx
ffff80000010e6a3:	92                   	xchg   %eax,%edx
ffff80000010e6a4:	10 10                	adc    %dl,(%rax)
ffff80000010e6a6:	10 10                	adc    %dl,(%rax)
ffff80000010e6a8:	10 10                	adc    %dl,(%rax)
ffff80000010e6aa:	10 10                	adc    %dl,(%rax)
ffff80000010e6ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010e6b0:	00 e7                	add    %ah,%bh
ffff80000010e6b2:	42                   	rex.X
ffff80000010e6b3:	42                   	rex.X
ffff80000010e6b4:	42                   	rex.X
ffff80000010e6b5:	42                   	rex.X
ffff80000010e6b6:	42                   	rex.X
ffff80000010e6b7:	42                   	rex.X
ffff80000010e6b8:	42                   	rex.X
ffff80000010e6b9:	42                   	rex.X
ffff80000010e6ba:	42                   	rex.X
ffff80000010e6bb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010e6be:	00 00                	add    %al,(%rax)
ffff80000010e6c0:	00 e7                	add    %ah,%bh
ffff80000010e6c2:	42                   	rex.X
ffff80000010e6c3:	42                   	rex.X
ffff80000010e6c4:	42                   	rex.X
ffff80000010e6c5:	42 24 24             	rex.X and $0x24,%al
ffff80000010e6c8:	24 24                	and    $0x24,%al
ffff80000010e6ca:	18 18                	sbb    %bl,(%rax)
ffff80000010e6cc:	18 18                	sbb    %bl,(%rax)
ffff80000010e6ce:	00 00                	add    %al,(%rax)
ffff80000010e6d0:	00 e7                	add    %ah,%bh
ffff80000010e6d2:	42                   	rex.X
ffff80000010e6d3:	42                   	rex.X
ffff80000010e6d4:	42 5a                	rex.X pop %rdx
ffff80000010e6d6:	5a                   	pop    %rdx
ffff80000010e6d7:	5a                   	pop    %rdx
ffff80000010e6d8:	5a                   	pop    %rdx
ffff80000010e6d9:	24 24                	and    $0x24,%al
ffff80000010e6db:	24 24                	and    $0x24,%al
ffff80000010e6dd:	24 00                	and    $0x0,%al
ffff80000010e6df:	00 00                	add    %al,(%rax)
ffff80000010e6e1:	e7 42                	out    %eax,$0x42
ffff80000010e6e3:	42 24 24             	rex.X and $0x24,%al
ffff80000010e6e6:	24 18                	and    $0x18,%al
ffff80000010e6e8:	24 24                	and    $0x24,%al
ffff80000010e6ea:	24 42                	and    $0x42,%al
ffff80000010e6ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e6ef:	00 00                	add    %al,(%rax)
ffff80000010e6f1:	ee                   	out    %al,(%dx)
ffff80000010e6f2:	44                   	rex.R
ffff80000010e6f3:	44                   	rex.R
ffff80000010e6f4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010e6f7:	28 10                	sub    %dl,(%rax)
ffff80000010e6f9:	10 10                	adc    %dl,(%rax)
ffff80000010e6fb:	10 10                	adc    %dl,(%rax)
ffff80000010e6fd:	7c 00                	jl     ffff80000010e6ff <system_call_table+0x299f>
ffff80000010e6ff:	00 00                	add    %al,(%rax)
ffff80000010e701:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010e708:	20 20                	and    %ah,(%rax)
ffff80000010e70a:	40                   	rex
ffff80000010e70b:	42 82                	rex.X (bad) 
ffff80000010e70d:	fe 00                	incb   (%rax)
ffff80000010e70f:	00 00                	add    %al,(%rax)
ffff80000010e711:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010e714:	20 20                	and    %ah,(%rax)
ffff80000010e716:	20 20                	and    %ah,(%rax)
ffff80000010e718:	20 20                	and    %ah,(%rax)
ffff80000010e71a:	20 20                	and    %ah,(%rax)
ffff80000010e71c:	20 20                	and    %ah,(%rax)
ffff80000010e71e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010e725:	20 20                	and    %ah,(%rax)
ffff80000010e727:	10 10                	adc    %dl,(%rax)
ffff80000010e729:	08 08                	or     %cl,(%rax)
ffff80000010e72b:	04 04                	add    $0x4,%al
ffff80000010e72d:	04 02                	add    $0x2,%al
ffff80000010e72f:	02 00                	add    (%rax),%al
ffff80000010e731:	7c 04                	jl     ffff80000010e737 <system_call_table+0x29d7>
ffff80000010e733:	04 04                	add    $0x4,%al
ffff80000010e735:	04 04                	add    $0x4,%al
ffff80000010e737:	04 04                	add    $0x4,%al
ffff80000010e739:	04 04                	add    $0x4,%al
ffff80000010e73b:	04 04                	add    $0x4,%al
ffff80000010e73d:	04 7c                	add    $0x7c,%al
ffff80000010e73f:	00 00                	add    %al,(%rax)
ffff80000010e741:	10 28                	adc    %ch,(%rax)
ffff80000010e743:	44 82                	rex.R (bad) 
	...
ffff80000010e75d:	00 fe                	add    %bh,%dh
ffff80000010e75f:	00 10                	add    %dl,(%rax)
ffff80000010e761:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010e774:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010e777:	04 3c                	add    $0x3c,%al
ffff80000010e779:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010e780:	c0 
ffff80000010e781:	40                   	rex
ffff80000010e782:	40                   	rex
ffff80000010e783:	40                   	rex
ffff80000010e784:	40 58                	rex pop %rax
ffff80000010e786:	64 42                	fs rex.X
ffff80000010e788:	42                   	rex.X
ffff80000010e789:	42                   	rex.X
ffff80000010e78a:	42                   	rex.X
ffff80000010e78b:	42                   	rex.X
ffff80000010e78c:	64 58                	fs pop %rax
ffff80000010e78e:	00 00                	add    %al,(%rax)
ffff80000010e790:	00 00                	add    %al,(%rax)
ffff80000010e792:	00 00                	add    %al,(%rax)
ffff80000010e794:	00 30                	add    %dh,(%rax)
ffff80000010e796:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010e79d:	38 
ffff80000010e79e:	00 00                	add    %al,(%rax)
ffff80000010e7a0:	0c 04                	or     $0x4,%al
ffff80000010e7a2:	04 04                	add    $0x4,%al
ffff80000010e7a4:	04 34                	add    $0x34,%al
ffff80000010e7a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010e7ad:	36 
ffff80000010e7ae:	00 00                	add    %al,(%rax)
ffff80000010e7b0:	00 00                	add    %al,(%rax)
ffff80000010e7b2:	00 00                	add    %al,(%rax)
ffff80000010e7b4:	00 38                	add    %bh,(%rax)
ffff80000010e7b6:	44 82                	rex.R (bad) 
ffff80000010e7b8:	82                   	(bad)  
ffff80000010e7b9:	fc                   	cld    
ffff80000010e7ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010e7c1:	10 10                	adc    %dl,(%rax)
ffff80000010e7c3:	10 10                	adc    %dl,(%rax)
ffff80000010e7c5:	7c 10                	jl     ffff80000010e7d7 <system_call_table+0x2a77>
ffff80000010e7c7:	10 10                	adc    %dl,(%rax)
ffff80000010e7c9:	10 10                	adc    %dl,(%rax)
ffff80000010e7cb:	10 10                	adc    %dl,(%rax)
ffff80000010e7cd:	7c 00                	jl     ffff80000010e7cf <system_call_table+0x2a6f>
ffff80000010e7cf:	00 00                	add    %al,(%rax)
ffff80000010e7d1:	00 00                	add    %al,(%rax)
ffff80000010e7d3:	00 00                	add    %al,(%rax)
ffff80000010e7d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010e7dc:	34 04 
ffff80000010e7de:	04 38                	add    $0x38,%al
ffff80000010e7e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010e7e4:	40 58                	rex pop %rax
ffff80000010e7e6:	64 42                	fs rex.X
ffff80000010e7e8:	42                   	rex.X
ffff80000010e7e9:	42                   	rex.X
ffff80000010e7ea:	42                   	rex.X
ffff80000010e7eb:	42                   	rex.X
ffff80000010e7ec:	42 e3 00             	rex.X jrcxz ffff80000010e7ef <system_call_table+0x2a8f>
ffff80000010e7ef:	00 00                	add    %al,(%rax)
ffff80000010e7f1:	10 10                	adc    %dl,(%rax)
ffff80000010e7f3:	00 00                	add    %al,(%rax)
ffff80000010e7f5:	30 10                	xor    %dl,(%rax)
ffff80000010e7f7:	10 10                	adc    %dl,(%rax)
ffff80000010e7f9:	10 10                	adc    %dl,(%rax)
ffff80000010e7fb:	10 10                	adc    %dl,(%rax)
ffff80000010e7fd:	38 00                	cmp    %al,(%rax)
ffff80000010e7ff:	00 00                	add    %al,(%rax)
ffff80000010e801:	04 04                	add    $0x4,%al
ffff80000010e803:	00 00                	add    %al,(%rax)
ffff80000010e805:	0c 04                	or     $0x4,%al
ffff80000010e807:	04 04                	add    $0x4,%al
ffff80000010e809:	04 04                	add    $0x4,%al
ffff80000010e80b:	04 04                	add    $0x4,%al
ffff80000010e80d:	08 08                	or     %cl,(%rax)
ffff80000010e80f:	30 c0                	xor    %al,%al
ffff80000010e811:	40                   	rex
ffff80000010e812:	40                   	rex
ffff80000010e813:	40                   	rex
ffff80000010e814:	40                   	rex
ffff80000010e815:	4e                   	rex.WRX
ffff80000010e816:	44                   	rex.R
ffff80000010e817:	48 50                	rex.W push %rax
ffff80000010e819:	60                   	(bad)  
ffff80000010e81a:	50                   	push   %rax
ffff80000010e81b:	48                   	rex.W
ffff80000010e81c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010e81f:	00 30                	add    %dh,(%rax)
ffff80000010e821:	10 10                	adc    %dl,(%rax)
ffff80000010e823:	10 10                	adc    %dl,(%rax)
ffff80000010e825:	10 10                	adc    %dl,(%rax)
ffff80000010e827:	10 10                	adc    %dl,(%rax)
ffff80000010e829:	10 10                	adc    %dl,(%rax)
ffff80000010e82b:	10 10                	adc    %dl,(%rax)
ffff80000010e82d:	38 00                	cmp    %al,(%rax)
ffff80000010e82f:	00 00                	add    %al,(%rax)
ffff80000010e831:	00 00                	add    %al,(%rax)
ffff80000010e833:	00 00                	add    %al,(%rax)
ffff80000010e835:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010e839:	49                   	rex.WB
ffff80000010e83a:	49                   	rex.WB
ffff80000010e83b:	49                   	rex.WB
ffff80000010e83c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010e83f:	00 00                	add    %al,(%rax)
ffff80000010e841:	00 00                	add    %al,(%rax)
ffff80000010e843:	00 00                	add    %al,(%rax)
ffff80000010e845:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010e849:	42                   	rex.X
ffff80000010e84a:	42                   	rex.X
ffff80000010e84b:	42                   	rex.X
ffff80000010e84c:	42 e3 00             	rex.X jrcxz ffff80000010e84f <system_call_table+0x2aef>
ffff80000010e84f:	00 00                	add    %al,(%rax)
ffff80000010e851:	00 00                	add    %al,(%rax)
ffff80000010e853:	00 00                	add    %al,(%rax)
ffff80000010e855:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e859:	82                   	(bad)  
ffff80000010e85a:	82                   	(bad)  
ffff80000010e85b:	82                   	(bad)  
ffff80000010e85c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e85f:	00 00                	add    %al,(%rax)
ffff80000010e861:	00 00                	add    %al,(%rax)
ffff80000010e863:	00 d8                	add    %bl,%al
ffff80000010e865:	64 42                	fs rex.X
ffff80000010e867:	42                   	rex.X
ffff80000010e868:	42                   	rex.X
ffff80000010e869:	42                   	rex.X
ffff80000010e86a:	42                   	rex.X
ffff80000010e86b:	64 58                	fs pop %rax
ffff80000010e86d:	40                   	rex
ffff80000010e86e:	40 e0 00             	rex loopne ffff80000010e871 <system_call_table+0x2b11>
ffff80000010e871:	00 00                	add    %al,(%rax)
ffff80000010e873:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010e876:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010e87d:	04 04                	add    $0x4,%al
ffff80000010e87f:	0e                   	(bad)  
ffff80000010e880:	00 00                	add    %al,(%rax)
ffff80000010e882:	00 00                	add    %al,(%rax)
ffff80000010e884:	00 dc                	add    %bl,%ah
ffff80000010e886:	62 42                	(bad)  
ffff80000010e888:	40                   	rex
ffff80000010e889:	40                   	rex
ffff80000010e88a:	40                   	rex
ffff80000010e88b:	40                   	rex
ffff80000010e88c:	40 e0 00             	rex loopne ffff80000010e88f <system_call_table+0x2b2f>
ffff80000010e88f:	00 00                	add    %al,(%rax)
ffff80000010e891:	00 00                	add    %al,(%rax)
ffff80000010e893:	00 00                	add    %al,(%rax)
ffff80000010e895:	7a 86                	jp     ffff80000010e81d <system_call_table+0x2abd>
ffff80000010e897:	82                   	(bad)  
ffff80000010e898:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010e89b:	82                   	(bad)  
ffff80000010e89c:	c2 bc 00             	retq   $0xbc
ffff80000010e89f:	00 00                	add    %al,(%rax)
ffff80000010e8a1:	00 10                	add    %dl,(%rax)
ffff80000010e8a3:	10 10                	adc    %dl,(%rax)
ffff80000010e8a5:	7c 10                	jl     ffff80000010e8b7 <system_call_table+0x2b57>
ffff80000010e8a7:	10 10                	adc    %dl,(%rax)
ffff80000010e8a9:	10 10                	adc    %dl,(%rax)
ffff80000010e8ab:	10 10                	adc    %dl,(%rax)
ffff80000010e8ad:	0e                   	(bad)  
ffff80000010e8ae:	00 00                	add    %al,(%rax)
ffff80000010e8b0:	00 00                	add    %al,(%rax)
ffff80000010e8b2:	00 00                	add    %al,(%rax)
ffff80000010e8b4:	00 c6                	add    %al,%dh
ffff80000010e8b6:	42                   	rex.X
ffff80000010e8b7:	42                   	rex.X
ffff80000010e8b8:	42                   	rex.X
ffff80000010e8b9:	42                   	rex.X
ffff80000010e8ba:	42                   	rex.X
ffff80000010e8bb:	42                   	rex.X
ffff80000010e8bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010e8bf:	00 00                	add    %al,(%rax)
ffff80000010e8c1:	00 00                	add    %al,(%rax)
ffff80000010e8c3:	00 00                	add    %al,(%rax)
ffff80000010e8c5:	e7 42                	out    %eax,$0x42
ffff80000010e8c7:	42                   	rex.X
ffff80000010e8c8:	42 24 24             	rex.X and $0x24,%al
ffff80000010e8cb:	24 18                	and    $0x18,%al
ffff80000010e8cd:	18 00                	sbb    %al,(%rax)
ffff80000010e8cf:	00 00                	add    %al,(%rax)
ffff80000010e8d1:	00 00                	add    %al,(%rax)
ffff80000010e8d3:	00 00                	add    %al,(%rax)
ffff80000010e8d5:	e7 42                	out    %eax,$0x42
ffff80000010e8d7:	42 5a                	rex.X pop %rdx
ffff80000010e8d9:	5a                   	pop    %rdx
ffff80000010e8da:	5a                   	pop    %rdx
ffff80000010e8db:	24 24                	and    $0x24,%al
ffff80000010e8dd:	24 00                	and    $0x0,%al
ffff80000010e8df:	00 00                	add    %al,(%rax)
ffff80000010e8e1:	00 00                	add    %al,(%rax)
ffff80000010e8e3:	00 00                	add    %al,(%rax)
ffff80000010e8e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010e8ea:	28 28                	sub    %ch,(%rax)
ffff80000010e8ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010e8f0:	00 00                	add    %al,(%rax)
ffff80000010e8f2:	00 00                	add    %al,(%rax)
ffff80000010e8f4:	00 e7                	add    %ah,%bh
ffff80000010e8f6:	42                   	rex.X
ffff80000010e8f7:	42 24 24             	rex.X and $0x24,%al
ffff80000010e8fa:	24 18                	and    $0x18,%al
ffff80000010e8fc:	18 10                	sbb    %dl,(%rax)
ffff80000010e8fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e901:	00 00                	add    %al,(%rax)
ffff80000010e903:	00 00                	add    %al,(%rax)
ffff80000010e905:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010e90b:	42 82                	rex.X (bad) 
ffff80000010e90d:	fe 00                	incb   (%rax)
ffff80000010e90f:	00 00                	add    %al,(%rax)
ffff80000010e911:	06                   	(bad)  
ffff80000010e912:	08 10                	or     %dl,(%rax)
ffff80000010e914:	10 10                	adc    %dl,(%rax)
ffff80000010e916:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010e919:	10 10                	adc    %dl,(%rax)
ffff80000010e91b:	10 08                	adc    %cl,(%rax)
ffff80000010e91d:	06                   	(bad)  
ffff80000010e91e:	00 00                	add    %al,(%rax)
ffff80000010e920:	10 10                	adc    %dl,(%rax)
ffff80000010e922:	10 10                	adc    %dl,(%rax)
ffff80000010e924:	10 10                	adc    %dl,(%rax)
ffff80000010e926:	10 10                	adc    %dl,(%rax)
ffff80000010e928:	10 10                	adc    %dl,(%rax)
ffff80000010e92a:	10 10                	adc    %dl,(%rax)
ffff80000010e92c:	10 10                	adc    %dl,(%rax)
ffff80000010e92e:	10 10                	adc    %dl,(%rax)
ffff80000010e930:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010e933:	08 08                	or     %cl,(%rax)
ffff80000010e935:	08 08                	or     %cl,(%rax)
ffff80000010e937:	06                   	(bad)  
ffff80000010e938:	08 08                	or     %cl,(%rax)
ffff80000010e93a:	08 08                	or     %cl,(%rax)
ffff80000010e93c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010e93f:	00 00                	add    %al,(%rax)
ffff80000010e941:	72 8c                	jb     ffff80000010e8cf <system_call_table+0x2b6f>
	...
ffff80000010f36f:	00 00                	add    %al,(%rax)
ffff80000010f371:	10 10                	adc    %dl,(%rax)
ffff80000010f373:	10 10                	adc    %dl,(%rax)
ffff80000010f375:	10 10                	adc    %dl,(%rax)
ffff80000010f377:	10 10                	adc    %dl,(%rax)
ffff80000010f379:	10 00                	adc    %al,(%rax)
ffff80000010f37b:	00 10                	add    %dl,(%rax)
ffff80000010f37d:	10 00                	adc    %al,(%rax)
ffff80000010f37f:	00 28                	add    %ch,(%rax)
ffff80000010f381:	28 28                	sub    %ch,(%rax)
	...
ffff80000010f38f:	00 00                	add    %al,(%rax)
ffff80000010f391:	44                   	rex.R
ffff80000010f392:	44                   	rex.R
ffff80000010f393:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f398:	44                   	rex.R
ffff80000010f399:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f39e:	00 00                	add    %al,(%rax)
ffff80000010f3a0:	10 3a                	adc    %bh,(%rdx)
ffff80000010f3a2:	56                   	push   %rsi
ffff80000010f3a3:	92                   	xchg   %eax,%edx
ffff80000010f3a4:	92                   	xchg   %eax,%edx
ffff80000010f3a5:	90                   	nop
ffff80000010f3a6:	50                   	push   %rax
ffff80000010f3a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010f3aa:	92                   	xchg   %eax,%edx
ffff80000010f3ab:	92                   	xchg   %eax,%edx
ffff80000010f3ac:	d4                   	(bad)  
ffff80000010f3ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010f3b2:	94                   	xchg   %eax,%esp
ffff80000010f3b3:	94                   	xchg   %eax,%esp
ffff80000010f3b4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010f3b9:	2c 52                	sub    $0x52,%al
ffff80000010f3bb:	52                   	push   %rdx
ffff80000010f3bc:	92                   	xchg   %eax,%edx
ffff80000010f3bd:	8c 00                	mov    %es,(%rax)
ffff80000010f3bf:	00 00                	add    %al,(%rax)
ffff80000010f3c1:	70 88                	jo     ffff80000010f34b <system_call_table+0x35eb>
ffff80000010f3c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010f3c9:	92                   	xchg   %eax,%edx
ffff80000010f3ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010f3d1:	08 10                	or     %dl,(%rax)
	...
ffff80000010f3df:	00 02                	add    %al,(%rdx)
ffff80000010f3e1:	04 08                	add    $0x8,%al
ffff80000010f3e3:	08 10                	or     %dl,(%rax)
ffff80000010f3e5:	10 10                	adc    %dl,(%rax)
ffff80000010f3e7:	10 10                	adc    %dl,(%rax)
ffff80000010f3e9:	10 10                	adc    %dl,(%rax)
ffff80000010f3eb:	08 08                	or     %cl,(%rax)
ffff80000010f3ed:	04 02                	add    $0x2,%al
ffff80000010f3ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010f3f5:	10 10                	adc    %dl,(%rax)
ffff80000010f3f7:	10 10                	adc    %dl,(%rax)
ffff80000010f3f9:	10 10                	adc    %dl,(%rax)
ffff80000010f3fb:	20 20                	and    %ah,(%rax)
ffff80000010f3fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f401:	00 00                	add    %al,(%rax)
ffff80000010f403:	00 00                	add    %al,(%rax)
ffff80000010f405:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010f40b:	10 00                	adc    %al,(%rax)
	...
ffff80000010f415:	10 10                	adc    %dl,(%rax)
ffff80000010f417:	10 fe                	adc    %bh,%dh
ffff80000010f419:	10 10                	adc    %dl,(%rax)
ffff80000010f41b:	10 00                	adc    %al,(%rax)
	...
ffff80000010f429:	00 00                	add    %al,(%rax)
ffff80000010f42b:	18 18                	sbb    %bl,(%rax)
ffff80000010f42d:	08 08                	or     %cl,(%rax)
ffff80000010f42f:	10 00                	adc    %al,(%rax)
ffff80000010f431:	00 00                	add    %al,(%rax)
ffff80000010f433:	00 00                	add    %al,(%rax)
ffff80000010f435:	00 00                	add    %al,(%rax)
ffff80000010f437:	00 fe                	add    %bh,%dh
	...
ffff80000010f449:	00 00                	add    %al,(%rax)
ffff80000010f44b:	00 18                	add    %bl,(%rax)
ffff80000010f44d:	18 00                	sbb    %al,(%rax)
ffff80000010f44f:	00 02                	add    %al,(%rdx)
ffff80000010f451:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010f454:	08 08                	or     %cl,(%rax)
ffff80000010f456:	08 10                	or     %dl,(%rax)
ffff80000010f458:	10 20                	adc    %ah,(%rax)
ffff80000010f45a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f45d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010f464:	42 
ffff80000010f465:	42                   	rex.X
ffff80000010f466:	42                   	rex.X
ffff80000010f467:	42                   	rex.X
ffff80000010f468:	42                   	rex.X
ffff80000010f469:	42                   	rex.X
ffff80000010f46a:	42 24 24             	rex.X and $0x24,%al
ffff80000010f46d:	18 00                	sbb    %al,(%rax)
ffff80000010f46f:	00 00                	add    %al,(%rax)
ffff80000010f471:	08 18                	or     %bl,(%rax)
ffff80000010f473:	28 08                	sub    %cl,(%rax)
ffff80000010f475:	08 08                	or     %cl,(%rax)
ffff80000010f477:	08 08                	or     %cl,(%rax)
ffff80000010f479:	08 08                	or     %cl,(%rax)
ffff80000010f47b:	08 08                	or     %cl,(%rax)
ffff80000010f47d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010f480:	00 18                	add    %bl,(%rax)
ffff80000010f482:	24 42                	and    $0x42,%al
ffff80000010f484:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010f488:	10 20                	adc    %ah,(%rax)
ffff80000010f48a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f48d:	7e 00                	jle    ffff80000010f48f <system_call_table+0x372f>
ffff80000010f48f:	00 00                	add    %al,(%rax)
ffff80000010f491:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010f494:	02 02                	add    (%rdx),%al
ffff80000010f496:	04 18                	add    $0x18,%al
ffff80000010f498:	04 02                	add    $0x2,%al
ffff80000010f49a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010f49d:	18 00                	sbb    %al,(%rax)
ffff80000010f49f:	00 00                	add    %al,(%rax)
ffff80000010f4a1:	0c 0c                	or     $0xc,%al
ffff80000010f4a3:	0c 14                	or     $0x14,%al
ffff80000010f4a5:	14 14                	adc    $0x14,%al
ffff80000010f4a7:	24 24                	and    $0x24,%al
ffff80000010f4a9:	44 7e 04             	rex.R jle ffff80000010f4b0 <system_call_table+0x3750>
ffff80000010f4ac:	04 1e                	add    $0x1e,%al
ffff80000010f4ae:	00 00                	add    %al,(%rax)
ffff80000010f4b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010f4b4:	40 58                	rex pop %rax
ffff80000010f4b6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010f4b9:	02 02                	add    (%rdx),%al
ffff80000010f4bb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f4be:	00 00                	add    %al,(%rax)
ffff80000010f4c0:	00 18                	add    %bl,(%rax)
ffff80000010f4c2:	24 42                	and    $0x42,%al
ffff80000010f4c4:	40 58                	rex pop %rax
ffff80000010f4c6:	64 42                	fs rex.X
ffff80000010f4c8:	42                   	rex.X
ffff80000010f4c9:	42                   	rex.X
ffff80000010f4ca:	42                   	rex.X
ffff80000010f4cb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f4ce:	00 00                	add    %al,(%rax)
ffff80000010f4d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010f4d3:	42 04 04             	rex.X add $0x4,%al
ffff80000010f4d6:	08 08                	or     %cl,(%rax)
ffff80000010f4d8:	08 10                	or     %dl,(%rax)
ffff80000010f4da:	10 10                	adc    %dl,(%rax)
ffff80000010f4dc:	10 38                	adc    %bh,(%rax)
ffff80000010f4de:	00 00                	add    %al,(%rax)
ffff80000010f4e0:	00 18                	add    %bl,(%rax)
ffff80000010f4e2:	24 42                	and    $0x42,%al
ffff80000010f4e4:	42                   	rex.X
ffff80000010f4e5:	42 24 18             	rex.X and $0x18,%al
ffff80000010f4e8:	24 42                	and    $0x42,%al
ffff80000010f4ea:	42                   	rex.X
ffff80000010f4eb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f4ee:	00 00                	add    %al,(%rax)
ffff80000010f4f0:	00 18                	add    %bl,(%rax)
ffff80000010f4f2:	24 42                	and    $0x42,%al
ffff80000010f4f4:	42                   	rex.X
ffff80000010f4f5:	42                   	rex.X
ffff80000010f4f6:	42                   	rex.X
ffff80000010f4f7:	42                   	rex.X
ffff80000010f4f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010f4fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f4fe:	00 00                	add    %al,(%rax)
ffff80000010f500:	00 00                	add    %al,(%rax)
ffff80000010f502:	00 00                	add    %al,(%rax)
ffff80000010f504:	00 18                	add    %bl,(%rax)
ffff80000010f506:	18 00                	sbb    %al,(%rax)
ffff80000010f508:	00 00                	add    %al,(%rax)
ffff80000010f50a:	00 00                	add    %al,(%rax)
ffff80000010f50c:	18 18                	sbb    %bl,(%rax)
ffff80000010f50e:	00 00                	add    %al,(%rax)
ffff80000010f510:	00 00                	add    %al,(%rax)
ffff80000010f512:	00 00                	add    %al,(%rax)
ffff80000010f514:	00 18                	add    %bl,(%rax)
ffff80000010f516:	18 00                	sbb    %al,(%rax)
ffff80000010f518:	00 00                	add    %al,(%rax)
ffff80000010f51a:	00 18                	add    %bl,(%rax)
ffff80000010f51c:	18 08                	sbb    %cl,(%rax)
ffff80000010f51e:	08 10                	or     %dl,(%rax)
ffff80000010f520:	00 02                	add    %al,(%rdx)
ffff80000010f522:	04 08                	add    $0x8,%al
ffff80000010f524:	10 20                	adc    %ah,(%rax)
ffff80000010f526:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010f52d:	04 
ffff80000010f52e:	02 00                	add    (%rax),%al
ffff80000010f530:	00 00                	add    %al,(%rax)
ffff80000010f532:	00 00                	add    %al,(%rax)
ffff80000010f534:	00 00                	add    %al,(%rax)
ffff80000010f536:	fe 00                	incb   (%rax)
ffff80000010f538:	00 fe                	add    %bh,%dh
ffff80000010f53a:	00 00                	add    %al,(%rax)
ffff80000010f53c:	00 00                	add    %al,(%rax)
ffff80000010f53e:	00 00                	add    %al,(%rax)
ffff80000010f540:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010f546:	04 02                	add    $0x2,%al
ffff80000010f548:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010f54b:	10 20                	adc    %ah,(%rax)
ffff80000010f54d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f551:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f555:	82                   	(bad)  
ffff80000010f556:	04 08                	add    $0x8,%al
ffff80000010f558:	10 10                	adc    %dl,(%rax)
ffff80000010f55a:	00 00                	add    %al,(%rax)
ffff80000010f55c:	18 18                	sbb    %bl,(%rax)
ffff80000010f55e:	00 00                	add    %al,(%rax)
ffff80000010f560:	00 38                	add    %bh,(%rax)
ffff80000010f562:	44 82                	rex.R (bad) 
ffff80000010f564:	9a                   	(bad)  
ffff80000010f565:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f566:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f567:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f568:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f569:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f56a:	9c                   	pushfq 
ffff80000010f56b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010f56f:	00 00                	add    %al,(%rax)
ffff80000010f571:	18 18                	sbb    %bl,(%rax)
ffff80000010f573:	18 18                	sbb    %bl,(%rax)
ffff80000010f575:	24 24                	and    $0x24,%al
ffff80000010f577:	24 24                	and    $0x24,%al
ffff80000010f579:	7e 42                	jle    ffff80000010f5bd <system_call_table+0x385d>
ffff80000010f57b:	42                   	rex.X
ffff80000010f57c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f57f:	00 00                	add    %al,(%rax)
ffff80000010f581:	f0 48                	lock rex.W
ffff80000010f583:	44                   	rex.R
ffff80000010f584:	44                   	rex.R
ffff80000010f585:	44                   	rex.R
ffff80000010f586:	48 78 44             	rex.W js ffff80000010f5cd <system_call_table+0x386d>
ffff80000010f589:	42                   	rex.X
ffff80000010f58a:	42                   	rex.X
ffff80000010f58b:	42                   	rex.X
ffff80000010f58c:	44 f8                	rex.R clc 
ffff80000010f58e:	00 00                	add    %al,(%rax)
ffff80000010f590:	00 3a                	add    %bh,(%rdx)
ffff80000010f592:	46                   	rex.RX
ffff80000010f593:	42 82                	rex.X (bad) 
ffff80000010f595:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010f59c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f59f:	00 00                	add    %al,(%rax)
ffff80000010f5a1:	f8                   	clc    
ffff80000010f5a2:	44                   	rex.R
ffff80000010f5a3:	44                   	rex.R
ffff80000010f5a4:	42                   	rex.X
ffff80000010f5a5:	42                   	rex.X
ffff80000010f5a6:	42                   	rex.X
ffff80000010f5a7:	42                   	rex.X
ffff80000010f5a8:	42                   	rex.X
ffff80000010f5a9:	42                   	rex.X
ffff80000010f5aa:	42                   	rex.X
ffff80000010f5ab:	44                   	rex.R
ffff80000010f5ac:	44 f8                	rex.R clc 
ffff80000010f5ae:	00 00                	add    %al,(%rax)
ffff80000010f5b0:	00 fe                	add    %bh,%dh
ffff80000010f5b2:	42                   	rex.X
ffff80000010f5b3:	42                   	rex.X
ffff80000010f5b4:	40                   	rex
ffff80000010f5b5:	40                   	rex
ffff80000010f5b6:	44 7c 44             	rex.R jl ffff80000010f5fd <system_call_table+0x389d>
ffff80000010f5b9:	40                   	rex
ffff80000010f5ba:	40                   	rex
ffff80000010f5bb:	42                   	rex.X
ffff80000010f5bc:	42 fe 00             	rex.X incb (%rax)
ffff80000010f5bf:	00 00                	add    %al,(%rax)
ffff80000010f5c1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010f5c4:	40                   	rex
ffff80000010f5c5:	40                   	rex
ffff80000010f5c6:	44 7c 44             	rex.R jl ffff80000010f60d <system_call_table+0x38ad>
ffff80000010f5c9:	44                   	rex.R
ffff80000010f5ca:	40                   	rex
ffff80000010f5cb:	40                   	rex
ffff80000010f5cc:	40                   	rex
ffff80000010f5cd:	f0 00 00             	lock add %al,(%rax)
ffff80000010f5d0:	00 3a                	add    %bh,(%rdx)
ffff80000010f5d2:	46                   	rex.RX
ffff80000010f5d3:	42 82                	rex.X (bad) 
ffff80000010f5d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010f5dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010f5df:	00 00                	add    %al,(%rax)
ffff80000010f5e1:	e7 42                	out    %eax,$0x42
ffff80000010f5e3:	42                   	rex.X
ffff80000010f5e4:	42                   	rex.X
ffff80000010f5e5:	42                   	rex.X
ffff80000010f5e6:	42 7e 42             	rex.X jle ffff80000010f62b <system_call_table+0x38cb>
ffff80000010f5e9:	42                   	rex.X
ffff80000010f5ea:	42                   	rex.X
ffff80000010f5eb:	42                   	rex.X
ffff80000010f5ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f5ef:	00 00                	add    %al,(%rax)
ffff80000010f5f1:	7c 10                	jl     ffff80000010f603 <system_call_table+0x38a3>
ffff80000010f5f3:	10 10                	adc    %dl,(%rax)
ffff80000010f5f5:	10 10                	adc    %dl,(%rax)
ffff80000010f5f7:	10 10                	adc    %dl,(%rax)
ffff80000010f5f9:	10 10                	adc    %dl,(%rax)
ffff80000010f5fb:	10 10                	adc    %dl,(%rax)
ffff80000010f5fd:	7c 00                	jl     ffff80000010f5ff <system_call_table+0x389f>
ffff80000010f5ff:	00 00                	add    %al,(%rax)
ffff80000010f601:	1f                   	(bad)  
ffff80000010f602:	04 04                	add    $0x4,%al
ffff80000010f604:	04 04                	add    $0x4,%al
ffff80000010f606:	04 04                	add    $0x4,%al
ffff80000010f608:	04 04                	add    $0x4,%al
ffff80000010f60a:	04 04                	add    $0x4,%al
ffff80000010f60c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010f60f:	00 00                	add    %al,(%rax)
ffff80000010f611:	e7 42                	out    %eax,$0x42
ffff80000010f613:	44                   	rex.R
ffff80000010f614:	48 50                	rex.W push %rax
ffff80000010f616:	50                   	push   %rax
ffff80000010f617:	60                   	(bad)  
ffff80000010f618:	50                   	push   %rax
ffff80000010f619:	50                   	push   %rax
ffff80000010f61a:	48                   	rex.W
ffff80000010f61b:	44                   	rex.R
ffff80000010f61c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f61f:	00 00                	add    %al,(%rax)
ffff80000010f621:	f0 40                	lock rex
ffff80000010f623:	40                   	rex
ffff80000010f624:	40                   	rex
ffff80000010f625:	40                   	rex
ffff80000010f626:	40                   	rex
ffff80000010f627:	40                   	rex
ffff80000010f628:	40                   	rex
ffff80000010f629:	40                   	rex
ffff80000010f62a:	40                   	rex
ffff80000010f62b:	42                   	rex.X
ffff80000010f62c:	42 fe 00             	rex.X incb (%rax)
ffff80000010f62f:	00 00                	add    %al,(%rax)
ffff80000010f631:	c3                   	retq   
ffff80000010f632:	42                   	rex.X
ffff80000010f633:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010f637:	5a                   	pop    %rdx
ffff80000010f638:	5a                   	pop    %rdx
ffff80000010f639:	42                   	rex.X
ffff80000010f63a:	42                   	rex.X
ffff80000010f63b:	42                   	rex.X
ffff80000010f63c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f63f:	00 00                	add    %al,(%rax)
ffff80000010f641:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010f648:	4a                   	rex.WX
ffff80000010f649:	4a                   	rex.WX
ffff80000010f64a:	4a                   	rex.WX
ffff80000010f64b:	46                   	rex.RX
ffff80000010f64c:	46 e2 00             	rex.RX loop ffff80000010f64f <system_call_table+0x38ef>
ffff80000010f64f:	00 00                	add    %al,(%rax)
ffff80000010f651:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f655:	82                   	(bad)  
ffff80000010f656:	82                   	(bad)  
ffff80000010f657:	82                   	(bad)  
ffff80000010f658:	82                   	(bad)  
ffff80000010f659:	82                   	(bad)  
ffff80000010f65a:	82                   	(bad)  
ffff80000010f65b:	82                   	(bad)  
ffff80000010f65c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f65f:	00 00                	add    %al,(%rax)
ffff80000010f661:	f8                   	clc    
ffff80000010f662:	44                   	rex.R
ffff80000010f663:	42                   	rex.X
ffff80000010f664:	42                   	rex.X
ffff80000010f665:	42                   	rex.X
ffff80000010f666:	44 78 40             	rex.R js ffff80000010f6a9 <system_call_table+0x3949>
ffff80000010f669:	40                   	rex
ffff80000010f66a:	40                   	rex
ffff80000010f66b:	40                   	rex
ffff80000010f66c:	40                   	rex
ffff80000010f66d:	f0 00 00             	lock add %al,(%rax)
ffff80000010f670:	00 38                	add    %bh,(%rax)
ffff80000010f672:	44 82                	rex.R (bad) 
ffff80000010f674:	82                   	(bad)  
ffff80000010f675:	82                   	(bad)  
ffff80000010f676:	82                   	(bad)  
ffff80000010f677:	82                   	(bad)  
ffff80000010f678:	82                   	(bad)  
ffff80000010f679:	82                   	(bad)  
ffff80000010f67a:	92                   	xchg   %eax,%edx
ffff80000010f67b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010f67f:	00 00                	add    %al,(%rax)
ffff80000010f681:	fc                   	cld    
ffff80000010f682:	42                   	rex.X
ffff80000010f683:	42                   	rex.X
ffff80000010f684:	42                   	rex.X
ffff80000010f685:	42 7c 44             	rex.X jl ffff80000010f6cc <system_call_table+0x396c>
ffff80000010f688:	42                   	rex.X
ffff80000010f689:	42                   	rex.X
ffff80000010f68a:	42                   	rex.X
ffff80000010f68b:	42                   	rex.X
ffff80000010f68c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f68f:	00 00                	add    %al,(%rax)
ffff80000010f691:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010f694:	82                   	(bad)  
ffff80000010f695:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010f699:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010f69f:	00 00                	add    %al,(%rax)
ffff80000010f6a1:	fe                   	(bad)  
ffff80000010f6a2:	92                   	xchg   %eax,%edx
ffff80000010f6a3:	92                   	xchg   %eax,%edx
ffff80000010f6a4:	10 10                	adc    %dl,(%rax)
ffff80000010f6a6:	10 10                	adc    %dl,(%rax)
ffff80000010f6a8:	10 10                	adc    %dl,(%rax)
ffff80000010f6aa:	10 10                	adc    %dl,(%rax)
ffff80000010f6ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010f6b0:	00 e7                	add    %ah,%bh
ffff80000010f6b2:	42                   	rex.X
ffff80000010f6b3:	42                   	rex.X
ffff80000010f6b4:	42                   	rex.X
ffff80000010f6b5:	42                   	rex.X
ffff80000010f6b6:	42                   	rex.X
ffff80000010f6b7:	42                   	rex.X
ffff80000010f6b8:	42                   	rex.X
ffff80000010f6b9:	42                   	rex.X
ffff80000010f6ba:	42                   	rex.X
ffff80000010f6bb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010f6be:	00 00                	add    %al,(%rax)
ffff80000010f6c0:	00 e7                	add    %ah,%bh
ffff80000010f6c2:	42                   	rex.X
ffff80000010f6c3:	42                   	rex.X
ffff80000010f6c4:	42                   	rex.X
ffff80000010f6c5:	42 24 24             	rex.X and $0x24,%al
ffff80000010f6c8:	24 24                	and    $0x24,%al
ffff80000010f6ca:	18 18                	sbb    %bl,(%rax)
ffff80000010f6cc:	18 18                	sbb    %bl,(%rax)
ffff80000010f6ce:	00 00                	add    %al,(%rax)
ffff80000010f6d0:	00 e7                	add    %ah,%bh
ffff80000010f6d2:	42                   	rex.X
ffff80000010f6d3:	42                   	rex.X
ffff80000010f6d4:	42 5a                	rex.X pop %rdx
ffff80000010f6d6:	5a                   	pop    %rdx
ffff80000010f6d7:	5a                   	pop    %rdx
ffff80000010f6d8:	5a                   	pop    %rdx
ffff80000010f6d9:	24 24                	and    $0x24,%al
ffff80000010f6db:	24 24                	and    $0x24,%al
ffff80000010f6dd:	24 00                	and    $0x0,%al
ffff80000010f6df:	00 00                	add    %al,(%rax)
ffff80000010f6e1:	e7 42                	out    %eax,$0x42
ffff80000010f6e3:	42 24 24             	rex.X and $0x24,%al
ffff80000010f6e6:	24 18                	and    $0x18,%al
ffff80000010f6e8:	24 24                	and    $0x24,%al
ffff80000010f6ea:	24 42                	and    $0x42,%al
ffff80000010f6ec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f6ef:	00 00                	add    %al,(%rax)
ffff80000010f6f1:	ee                   	out    %al,(%dx)
ffff80000010f6f2:	44                   	rex.R
ffff80000010f6f3:	44                   	rex.R
ffff80000010f6f4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010f6f7:	28 10                	sub    %dl,(%rax)
ffff80000010f6f9:	10 10                	adc    %dl,(%rax)
ffff80000010f6fb:	10 10                	adc    %dl,(%rax)
ffff80000010f6fd:	7c 00                	jl     ffff80000010f6ff <system_call_table+0x399f>
ffff80000010f6ff:	00 00                	add    %al,(%rax)
ffff80000010f701:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010f708:	20 20                	and    %ah,(%rax)
ffff80000010f70a:	40                   	rex
ffff80000010f70b:	42 82                	rex.X (bad) 
ffff80000010f70d:	fe 00                	incb   (%rax)
ffff80000010f70f:	00 00                	add    %al,(%rax)
ffff80000010f711:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010f714:	20 20                	and    %ah,(%rax)
ffff80000010f716:	20 20                	and    %ah,(%rax)
ffff80000010f718:	20 20                	and    %ah,(%rax)
ffff80000010f71a:	20 20                	and    %ah,(%rax)
ffff80000010f71c:	20 20                	and    %ah,(%rax)
ffff80000010f71e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010f725:	20 20                	and    %ah,(%rax)
ffff80000010f727:	10 10                	adc    %dl,(%rax)
ffff80000010f729:	08 08                	or     %cl,(%rax)
ffff80000010f72b:	04 04                	add    $0x4,%al
ffff80000010f72d:	04 02                	add    $0x2,%al
ffff80000010f72f:	02 00                	add    (%rax),%al
ffff80000010f731:	7c 04                	jl     ffff80000010f737 <system_call_table+0x39d7>
ffff80000010f733:	04 04                	add    $0x4,%al
ffff80000010f735:	04 04                	add    $0x4,%al
ffff80000010f737:	04 04                	add    $0x4,%al
ffff80000010f739:	04 04                	add    $0x4,%al
ffff80000010f73b:	04 04                	add    $0x4,%al
ffff80000010f73d:	04 7c                	add    $0x7c,%al
ffff80000010f73f:	00 00                	add    %al,(%rax)
ffff80000010f741:	10 28                	adc    %ch,(%rax)
ffff80000010f743:	44 82                	rex.R (bad) 
	...
ffff80000010f75d:	00 fe                	add    %bh,%dh
ffff80000010f75f:	00 10                	add    %dl,(%rax)
ffff80000010f761:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010f774:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010f777:	04 3c                	add    $0x3c,%al
ffff80000010f779:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010f780:	c0 
ffff80000010f781:	40                   	rex
ffff80000010f782:	40                   	rex
ffff80000010f783:	40                   	rex
ffff80000010f784:	40 58                	rex pop %rax
ffff80000010f786:	64 42                	fs rex.X
ffff80000010f788:	42                   	rex.X
ffff80000010f789:	42                   	rex.X
ffff80000010f78a:	42                   	rex.X
ffff80000010f78b:	42                   	rex.X
ffff80000010f78c:	64 58                	fs pop %rax
ffff80000010f78e:	00 00                	add    %al,(%rax)
ffff80000010f790:	00 00                	add    %al,(%rax)
ffff80000010f792:	00 00                	add    %al,(%rax)
ffff80000010f794:	00 30                	add    %dh,(%rax)
ffff80000010f796:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010f79d:	38 
ffff80000010f79e:	00 00                	add    %al,(%rax)
ffff80000010f7a0:	0c 04                	or     $0x4,%al
ffff80000010f7a2:	04 04                	add    $0x4,%al
ffff80000010f7a4:	04 34                	add    $0x34,%al
ffff80000010f7a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010f7ad:	36 
ffff80000010f7ae:	00 00                	add    %al,(%rax)
ffff80000010f7b0:	00 00                	add    %al,(%rax)
ffff80000010f7b2:	00 00                	add    %al,(%rax)
ffff80000010f7b4:	00 38                	add    %bh,(%rax)
ffff80000010f7b6:	44 82                	rex.R (bad) 
ffff80000010f7b8:	82                   	(bad)  
ffff80000010f7b9:	fc                   	cld    
ffff80000010f7ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010f7c1:	10 10                	adc    %dl,(%rax)
ffff80000010f7c3:	10 10                	adc    %dl,(%rax)
ffff80000010f7c5:	7c 10                	jl     ffff80000010f7d7 <system_call_table+0x3a77>
ffff80000010f7c7:	10 10                	adc    %dl,(%rax)
ffff80000010f7c9:	10 10                	adc    %dl,(%rax)
ffff80000010f7cb:	10 10                	adc    %dl,(%rax)
ffff80000010f7cd:	7c 00                	jl     ffff80000010f7cf <system_call_table+0x3a6f>
ffff80000010f7cf:	00 00                	add    %al,(%rax)
ffff80000010f7d1:	00 00                	add    %al,(%rax)
ffff80000010f7d3:	00 00                	add    %al,(%rax)
ffff80000010f7d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010f7dc:	34 04 
ffff80000010f7de:	04 38                	add    $0x38,%al
ffff80000010f7e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010f7e4:	40 58                	rex pop %rax
ffff80000010f7e6:	64 42                	fs rex.X
ffff80000010f7e8:	42                   	rex.X
ffff80000010f7e9:	42                   	rex.X
ffff80000010f7ea:	42                   	rex.X
ffff80000010f7eb:	42                   	rex.X
ffff80000010f7ec:	42 e3 00             	rex.X jrcxz ffff80000010f7ef <system_call_table+0x3a8f>
ffff80000010f7ef:	00 00                	add    %al,(%rax)
ffff80000010f7f1:	10 10                	adc    %dl,(%rax)
ffff80000010f7f3:	00 00                	add    %al,(%rax)
ffff80000010f7f5:	30 10                	xor    %dl,(%rax)
ffff80000010f7f7:	10 10                	adc    %dl,(%rax)
ffff80000010f7f9:	10 10                	adc    %dl,(%rax)
ffff80000010f7fb:	10 10                	adc    %dl,(%rax)
ffff80000010f7fd:	38 00                	cmp    %al,(%rax)
ffff80000010f7ff:	00 00                	add    %al,(%rax)
ffff80000010f801:	04 04                	add    $0x4,%al
ffff80000010f803:	00 00                	add    %al,(%rax)
ffff80000010f805:	0c 04                	or     $0x4,%al
ffff80000010f807:	04 04                	add    $0x4,%al
ffff80000010f809:	04 04                	add    $0x4,%al
ffff80000010f80b:	04 04                	add    $0x4,%al
ffff80000010f80d:	08 08                	or     %cl,(%rax)
ffff80000010f80f:	30 c0                	xor    %al,%al
ffff80000010f811:	40                   	rex
ffff80000010f812:	40                   	rex
ffff80000010f813:	40                   	rex
ffff80000010f814:	40                   	rex
ffff80000010f815:	4e                   	rex.WRX
ffff80000010f816:	44                   	rex.R
ffff80000010f817:	48 50                	rex.W push %rax
ffff80000010f819:	60                   	(bad)  
ffff80000010f81a:	50                   	push   %rax
ffff80000010f81b:	48                   	rex.W
ffff80000010f81c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010f81f:	00 30                	add    %dh,(%rax)
ffff80000010f821:	10 10                	adc    %dl,(%rax)
ffff80000010f823:	10 10                	adc    %dl,(%rax)
ffff80000010f825:	10 10                	adc    %dl,(%rax)
ffff80000010f827:	10 10                	adc    %dl,(%rax)
ffff80000010f829:	10 10                	adc    %dl,(%rax)
ffff80000010f82b:	10 10                	adc    %dl,(%rax)
ffff80000010f82d:	38 00                	cmp    %al,(%rax)
ffff80000010f82f:	00 00                	add    %al,(%rax)
ffff80000010f831:	00 00                	add    %al,(%rax)
ffff80000010f833:	00 00                	add    %al,(%rax)
ffff80000010f835:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010f839:	49                   	rex.WB
ffff80000010f83a:	49                   	rex.WB
ffff80000010f83b:	49                   	rex.WB
ffff80000010f83c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010f83f:	00 00                	add    %al,(%rax)
ffff80000010f841:	00 00                	add    %al,(%rax)
ffff80000010f843:	00 00                	add    %al,(%rax)
ffff80000010f845:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010f849:	42                   	rex.X
ffff80000010f84a:	42                   	rex.X
ffff80000010f84b:	42                   	rex.X
ffff80000010f84c:	42 e3 00             	rex.X jrcxz ffff80000010f84f <system_call_table+0x3aef>
ffff80000010f84f:	00 00                	add    %al,(%rax)
ffff80000010f851:	00 00                	add    %al,(%rax)
ffff80000010f853:	00 00                	add    %al,(%rax)
ffff80000010f855:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f859:	82                   	(bad)  
ffff80000010f85a:	82                   	(bad)  
ffff80000010f85b:	82                   	(bad)  
ffff80000010f85c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f85f:	00 00                	add    %al,(%rax)
ffff80000010f861:	00 00                	add    %al,(%rax)
ffff80000010f863:	00 d8                	add    %bl,%al
ffff80000010f865:	64 42                	fs rex.X
ffff80000010f867:	42                   	rex.X
ffff80000010f868:	42                   	rex.X
ffff80000010f869:	42                   	rex.X
ffff80000010f86a:	42                   	rex.X
ffff80000010f86b:	64 58                	fs pop %rax
ffff80000010f86d:	40                   	rex
ffff80000010f86e:	40 e0 00             	rex loopne ffff80000010f871 <system_call_table+0x3b11>
ffff80000010f871:	00 00                	add    %al,(%rax)
ffff80000010f873:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010f876:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010f87d:	04 04                	add    $0x4,%al
ffff80000010f87f:	0e                   	(bad)  
ffff80000010f880:	00 00                	add    %al,(%rax)
ffff80000010f882:	00 00                	add    %al,(%rax)
ffff80000010f884:	00 dc                	add    %bl,%ah
ffff80000010f886:	62 42                	(bad)  
ffff80000010f888:	40                   	rex
ffff80000010f889:	40                   	rex
ffff80000010f88a:	40                   	rex
ffff80000010f88b:	40                   	rex
ffff80000010f88c:	40 e0 00             	rex loopne ffff80000010f88f <system_call_table+0x3b2f>
ffff80000010f88f:	00 00                	add    %al,(%rax)
ffff80000010f891:	00 00                	add    %al,(%rax)
ffff80000010f893:	00 00                	add    %al,(%rax)
ffff80000010f895:	7a 86                	jp     ffff80000010f81d <system_call_table+0x3abd>
ffff80000010f897:	82                   	(bad)  
ffff80000010f898:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010f89b:	82                   	(bad)  
ffff80000010f89c:	c2 bc 00             	retq   $0xbc
ffff80000010f89f:	00 00                	add    %al,(%rax)
ffff80000010f8a1:	00 10                	add    %dl,(%rax)
ffff80000010f8a3:	10 10                	adc    %dl,(%rax)
ffff80000010f8a5:	7c 10                	jl     ffff80000010f8b7 <system_call_table+0x3b57>
ffff80000010f8a7:	10 10                	adc    %dl,(%rax)
ffff80000010f8a9:	10 10                	adc    %dl,(%rax)
ffff80000010f8ab:	10 10                	adc    %dl,(%rax)
ffff80000010f8ad:	0e                   	(bad)  
ffff80000010f8ae:	00 00                	add    %al,(%rax)
ffff80000010f8b0:	00 00                	add    %al,(%rax)
ffff80000010f8b2:	00 00                	add    %al,(%rax)
ffff80000010f8b4:	00 c6                	add    %al,%dh
ffff80000010f8b6:	42                   	rex.X
ffff80000010f8b7:	42                   	rex.X
ffff80000010f8b8:	42                   	rex.X
ffff80000010f8b9:	42                   	rex.X
ffff80000010f8ba:	42                   	rex.X
ffff80000010f8bb:	42                   	rex.X
ffff80000010f8bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010f8bf:	00 00                	add    %al,(%rax)
ffff80000010f8c1:	00 00                	add    %al,(%rax)
ffff80000010f8c3:	00 00                	add    %al,(%rax)
ffff80000010f8c5:	e7 42                	out    %eax,$0x42
ffff80000010f8c7:	42                   	rex.X
ffff80000010f8c8:	42 24 24             	rex.X and $0x24,%al
ffff80000010f8cb:	24 18                	and    $0x18,%al
ffff80000010f8cd:	18 00                	sbb    %al,(%rax)
ffff80000010f8cf:	00 00                	add    %al,(%rax)
ffff80000010f8d1:	00 00                	add    %al,(%rax)
ffff80000010f8d3:	00 00                	add    %al,(%rax)
ffff80000010f8d5:	e7 42                	out    %eax,$0x42
ffff80000010f8d7:	42 5a                	rex.X pop %rdx
ffff80000010f8d9:	5a                   	pop    %rdx
ffff80000010f8da:	5a                   	pop    %rdx
ffff80000010f8db:	24 24                	and    $0x24,%al
ffff80000010f8dd:	24 00                	and    $0x0,%al
ffff80000010f8df:	00 00                	add    %al,(%rax)
ffff80000010f8e1:	00 00                	add    %al,(%rax)
ffff80000010f8e3:	00 00                	add    %al,(%rax)
ffff80000010f8e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010f8ea:	28 28                	sub    %ch,(%rax)
ffff80000010f8ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010f8f0:	00 00                	add    %al,(%rax)
ffff80000010f8f2:	00 00                	add    %al,(%rax)
ffff80000010f8f4:	00 e7                	add    %ah,%bh
ffff80000010f8f6:	42                   	rex.X
ffff80000010f8f7:	42 24 24             	rex.X and $0x24,%al
ffff80000010f8fa:	24 18                	and    $0x18,%al
ffff80000010f8fc:	18 10                	sbb    %dl,(%rax)
ffff80000010f8fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010f901:	00 00                	add    %al,(%rax)
ffff80000010f903:	00 00                	add    %al,(%rax)
ffff80000010f905:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010f90b:	42 82                	rex.X (bad) 
ffff80000010f90d:	fe 00                	incb   (%rax)
ffff80000010f90f:	00 00                	add    %al,(%rax)
ffff80000010f911:	06                   	(bad)  
ffff80000010f912:	08 10                	or     %dl,(%rax)
ffff80000010f914:	10 10                	adc    %dl,(%rax)
ffff80000010f916:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010f919:	10 10                	adc    %dl,(%rax)
ffff80000010f91b:	10 08                	adc    %cl,(%rax)
ffff80000010f91d:	06                   	(bad)  
ffff80000010f91e:	00 00                	add    %al,(%rax)
ffff80000010f920:	10 10                	adc    %dl,(%rax)
ffff80000010f922:	10 10                	adc    %dl,(%rax)
ffff80000010f924:	10 10                	adc    %dl,(%rax)
ffff80000010f926:	10 10                	adc    %dl,(%rax)
ffff80000010f928:	10 10                	adc    %dl,(%rax)
ffff80000010f92a:	10 10                	adc    %dl,(%rax)
ffff80000010f92c:	10 10                	adc    %dl,(%rax)
ffff80000010f92e:	10 10                	adc    %dl,(%rax)
ffff80000010f930:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010f933:	08 08                	or     %cl,(%rax)
ffff80000010f935:	08 08                	or     %cl,(%rax)
ffff80000010f937:	06                   	(bad)  
ffff80000010f938:	08 08                	or     %cl,(%rax)
ffff80000010f93a:	08 08                	or     %cl,(%rax)
ffff80000010f93c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010f93f:	00 00                	add    %al,(%rax)
ffff80000010f941:	72 8c                	jb     ffff80000010f8cf <system_call_table+0x3b6f>
	...

ffff800000110160 <interrupt>:
ffff800000110160:	e9 80 10 00 00       	jmpq   ffff8000001111e5 <interrupt+0x1085>
ffff800000110165:	80 ff ff             	cmp    $0xff,%bh
ffff800000110168:	33 81 10 00 00 80    	xor    -0x7ffffff0(%rcx),%eax
ffff80000011016e:	ff                   	(bad)  
ffff80000011016f:	ff                   	(bad)  
ffff800000110170:	7d 81                	jge    ffff8000001100f3 <system_call_table+0x4393>
ffff800000110172:	10 00                	adc    %al,(%rax)
ffff800000110174:	00 80 ff ff c7 81    	add    %al,-0x7e380001(%rax)
ffff80000011017a:	10 00                	adc    %al,(%rax)
ffff80000011017c:	00 80 ff ff 11 82    	add    %al,-0x7dee0001(%rax)
ffff800000110182:	10 00                	adc    %al,(%rax)
ffff800000110184:	00 80 ff ff 5b 82    	add    %al,-0x7da40001(%rax)
ffff80000011018a:	10 00                	adc    %al,(%rax)
ffff80000011018c:	00 80 ff ff a5 82    	add    %al,-0x7d5a0001(%rax)
ffff800000110192:	10 00                	adc    %al,(%rax)
ffff800000110194:	00 80 ff ff ef 82    	add    %al,-0x7d100001(%rax)
ffff80000011019a:	10 00                	adc    %al,(%rax)
ffff80000011019c:	00 80 ff ff 39 83    	add    %al,-0x7cc60001(%rax)
ffff8000001101a2:	10 00                	adc    %al,(%rax)
ffff8000001101a4:	00 80 ff ff 83 83    	add    %al,-0x7c7c0001(%rax)
ffff8000001101aa:	10 00                	adc    %al,(%rax)
ffff8000001101ac:	00 80 ff ff cd 83    	add    %al,-0x7c320001(%rax)
ffff8000001101b2:	10 00                	adc    %al,(%rax)
ffff8000001101b4:	00 80 ff ff 17 84    	add    %al,-0x7be80001(%rax)
ffff8000001101ba:	10 00                	adc    %al,(%rax)
ffff8000001101bc:	00 80 ff ff 61 84    	add    %al,-0x7b9e0001(%rax)
ffff8000001101c2:	10 00                	adc    %al,(%rax)
ffff8000001101c4:	00 80 ff ff ab 84    	add    %al,-0x7b540001(%rax)
ffff8000001101ca:	10 00                	adc    %al,(%rax)
ffff8000001101cc:	00 80 ff ff f5 84    	add    %al,-0x7b0a0001(%rax)
ffff8000001101d2:	10 00                	adc    %al,(%rax)
ffff8000001101d4:	00 80 ff ff 3f 85    	add    %al,-0x7ac00001(%rax)
ffff8000001101da:	10 00                	adc    %al,(%rax)
ffff8000001101dc:	00 80 ff ff 89 85    	add    %al,-0x7a760001(%rax)
ffff8000001101e2:	10 00                	adc    %al,(%rax)
ffff8000001101e4:	00 80 ff ff d3 85    	add    %al,-0x7a2c0001(%rax)
ffff8000001101ea:	10 00                	adc    %al,(%rax)
ffff8000001101ec:	00 80 ff ff 1d 86    	add    %al,-0x79e20001(%rax)
ffff8000001101f2:	10 00                	adc    %al,(%rax)
ffff8000001101f4:	00 80 ff ff 67 86    	add    %al,-0x79980001(%rax)
ffff8000001101fa:	10 00                	adc    %al,(%rax)
ffff8000001101fc:	00 80 ff ff b1 86    	add    %al,-0x794e0001(%rax)
ffff800000110202:	10 00                	adc    %al,(%rax)
ffff800000110204:	00 80 ff ff fb 86    	add    %al,-0x79040001(%rax)
ffff80000011020a:	10 00                	adc    %al,(%rax)
ffff80000011020c:	00 80 ff ff 45 87    	add    %al,-0x78ba0001(%rax)
ffff800000110212:	10 00                	adc    %al,(%rax)
ffff800000110214:	00 80 ff ff 8f 87    	add    %al,-0x78700001(%rax)
ffff80000011021a:	10 00                	adc    %al,(%rax)
ffff80000011021c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011042e:	00 00                	add    %al,(%rax)
ffff800000110430:	00 10                	add    %dl,(%rax)
ffff800000110432:	10 10                	adc    %dl,(%rax)
ffff800000110434:	10 10                	adc    %dl,(%rax)
ffff800000110436:	10 10                	adc    %dl,(%rax)
ffff800000110438:	10 10                	adc    %dl,(%rax)
ffff80000011043a:	00 00                	add    %al,(%rax)
ffff80000011043c:	10 10                	adc    %dl,(%rax)
ffff80000011043e:	00 00                	add    %al,(%rax)
ffff800000110440:	28 28                	sub    %ch,(%rax)
ffff800000110442:	28 00                	sub    %al,(%rax)
	...
ffff800000110450:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff800000110454:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff800000110458:	44                   	rex.R
ffff800000110459:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000011045e:	00 00                	add    %al,(%rax)
ffff800000110460:	10 3a                	adc    %bh,(%rdx)
ffff800000110462:	56                   	push   %rsi
ffff800000110463:	92                   	xchg   %eax,%edx
ffff800000110464:	92                   	xchg   %eax,%edx
ffff800000110465:	90                   	nop
ffff800000110466:	50                   	push   %rax
ffff800000110467:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000011046a:	92                   	xchg   %eax,%edx
ffff80000011046b:	92                   	xchg   %eax,%edx
ffff80000011046c:	d4                   	(bad)  
ffff80000011046d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff800000110472:	94                   	xchg   %eax,%esp
ffff800000110473:	94                   	xchg   %eax,%esp
ffff800000110474:	68 08 10 10 20       	pushq  $0x20101008
ffff800000110479:	2c 52                	sub    $0x52,%al
ffff80000011047b:	52                   	push   %rdx
ffff80000011047c:	92                   	xchg   %eax,%edx
ffff80000011047d:	8c 00                	mov    %es,(%rax)
ffff80000011047f:	00 00                	add    %al,(%rax)
ffff800000110481:	70 88                	jo     ffff80000011040b <interrupt+0x2ab>
ffff800000110483:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff800000110489:	92                   	xchg   %eax,%edx
ffff80000011048a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff800000110491:	08 10                	or     %dl,(%rax)
	...
ffff80000011049f:	00 02                	add    %al,(%rdx)
ffff8000001104a1:	04 08                	add    $0x8,%al
ffff8000001104a3:	08 10                	or     %dl,(%rax)
ffff8000001104a5:	10 10                	adc    %dl,(%rax)
ffff8000001104a7:	10 10                	adc    %dl,(%rax)
ffff8000001104a9:	10 10                	adc    %dl,(%rax)
ffff8000001104ab:	08 08                	or     %cl,(%rax)
ffff8000001104ad:	04 02                	add    $0x2,%al
ffff8000001104af:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff8000001104b5:	10 10                	adc    %dl,(%rax)
ffff8000001104b7:	10 10                	adc    %dl,(%rax)
ffff8000001104b9:	10 10                	adc    %dl,(%rax)
ffff8000001104bb:	20 20                	and    %ah,(%rax)
ffff8000001104bd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff8000001104c1:	00 00                	add    %al,(%rax)
ffff8000001104c3:	00 00                	add    %al,(%rax)
ffff8000001104c5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff8000001104cb:	10 00                	adc    %al,(%rax)
	...
ffff8000001104d5:	10 10                	adc    %dl,(%rax)
ffff8000001104d7:	10 fe                	adc    %bh,%dh
ffff8000001104d9:	10 10                	adc    %dl,(%rax)
ffff8000001104db:	10 00                	adc    %al,(%rax)
	...
ffff8000001104e9:	00 00                	add    %al,(%rax)
ffff8000001104eb:	18 18                	sbb    %bl,(%rax)
ffff8000001104ed:	08 08                	or     %cl,(%rax)
ffff8000001104ef:	10 00                	adc    %al,(%rax)
ffff8000001104f1:	00 00                	add    %al,(%rax)
ffff8000001104f3:	00 00                	add    %al,(%rax)
ffff8000001104f5:	00 00                	add    %al,(%rax)
ffff8000001104f7:	00 fe                	add    %bh,%dh
	...
ffff800000110509:	00 00                	add    %al,(%rax)
ffff80000011050b:	00 18                	add    %bl,(%rax)
ffff80000011050d:	18 00                	sbb    %al,(%rax)
ffff80000011050f:	00 02                	add    %al,(%rdx)
ffff800000110511:	02 04 04             	add    (%rsp,%rax,1),%al
ffff800000110514:	08 08                	or     %cl,(%rax)
ffff800000110516:	08 10                	or     %dl,(%rax)
ffff800000110518:	10 20                	adc    %ah,(%rax)
ffff80000011051a:	20 40 40             	and    %al,0x40(%rax)
ffff80000011051d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff800000110524:	42 
ffff800000110525:	42                   	rex.X
ffff800000110526:	42                   	rex.X
ffff800000110527:	42                   	rex.X
ffff800000110528:	42                   	rex.X
ffff800000110529:	42                   	rex.X
ffff80000011052a:	42 24 24             	rex.X and $0x24,%al
ffff80000011052d:	18 00                	sbb    %al,(%rax)
ffff80000011052f:	00 00                	add    %al,(%rax)
ffff800000110531:	08 18                	or     %bl,(%rax)
ffff800000110533:	28 08                	sub    %cl,(%rax)
ffff800000110535:	08 08                	or     %cl,(%rax)
ffff800000110537:	08 08                	or     %cl,(%rax)
ffff800000110539:	08 08                	or     %cl,(%rax)
ffff80000011053b:	08 08                	or     %cl,(%rax)
ffff80000011053d:	3e 00 00             	add    %al,%ds:(%rax)
ffff800000110540:	00 18                	add    %bl,(%rax)
ffff800000110542:	24 42                	and    $0x42,%al
ffff800000110544:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff800000110548:	10 20                	adc    %ah,(%rax)
ffff80000011054a:	20 40 40             	and    %al,0x40(%rax)
ffff80000011054d:	7e 00                	jle    ffff80000011054f <interrupt+0x3ef>
ffff80000011054f:	00 00                	add    %al,(%rax)
ffff800000110551:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff800000110554:	02 02                	add    (%rdx),%al
ffff800000110556:	04 18                	add    $0x18,%al
ffff800000110558:	04 02                	add    $0x2,%al
ffff80000011055a:	02 42 24             	add    0x24(%rdx),%al
ffff80000011055d:	18 00                	sbb    %al,(%rax)
ffff80000011055f:	00 00                	add    %al,(%rax)
ffff800000110561:	0c 0c                	or     $0xc,%al
ffff800000110563:	0c 14                	or     $0x14,%al
ffff800000110565:	14 14                	adc    $0x14,%al
ffff800000110567:	24 24                	and    $0x24,%al
ffff800000110569:	44 7e 04             	rex.R jle ffff800000110570 <interrupt+0x410>
ffff80000011056c:	04 1e                	add    $0x1e,%al
ffff80000011056e:	00 00                	add    %al,(%rax)
ffff800000110570:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff800000110574:	40 58                	rex pop %rax
ffff800000110576:	64 02 02             	add    %fs:(%rdx),%al
ffff800000110579:	02 02                	add    (%rdx),%al
ffff80000011057b:	42 24 18             	rex.X and $0x18,%al
ffff80000011057e:	00 00                	add    %al,(%rax)
ffff800000110580:	00 18                	add    %bl,(%rax)
ffff800000110582:	24 42                	and    $0x42,%al
ffff800000110584:	40 58                	rex pop %rax
ffff800000110586:	64 42                	fs rex.X
ffff800000110588:	42                   	rex.X
ffff800000110589:	42                   	rex.X
ffff80000011058a:	42                   	rex.X
ffff80000011058b:	42 24 18             	rex.X and $0x18,%al
ffff80000011058e:	00 00                	add    %al,(%rax)
ffff800000110590:	00 7e 42             	add    %bh,0x42(%rsi)
ffff800000110593:	42 04 04             	rex.X add $0x4,%al
ffff800000110596:	08 08                	or     %cl,(%rax)
ffff800000110598:	08 10                	or     %dl,(%rax)
ffff80000011059a:	10 10                	adc    %dl,(%rax)
ffff80000011059c:	10 38                	adc    %bh,(%rax)
ffff80000011059e:	00 00                	add    %al,(%rax)
ffff8000001105a0:	00 18                	add    %bl,(%rax)
ffff8000001105a2:	24 42                	and    $0x42,%al
ffff8000001105a4:	42                   	rex.X
ffff8000001105a5:	42 24 18             	rex.X and $0x18,%al
ffff8000001105a8:	24 42                	and    $0x42,%al
ffff8000001105aa:	42                   	rex.X
ffff8000001105ab:	42 24 18             	rex.X and $0x18,%al
ffff8000001105ae:	00 00                	add    %al,(%rax)
ffff8000001105b0:	00 18                	add    %bl,(%rax)
ffff8000001105b2:	24 42                	and    $0x42,%al
ffff8000001105b4:	42                   	rex.X
ffff8000001105b5:	42                   	rex.X
ffff8000001105b6:	42                   	rex.X
ffff8000001105b7:	42                   	rex.X
ffff8000001105b8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff8000001105bb:	42 24 18             	rex.X and $0x18,%al
ffff8000001105be:	00 00                	add    %al,(%rax)
ffff8000001105c0:	00 00                	add    %al,(%rax)
ffff8000001105c2:	00 00                	add    %al,(%rax)
ffff8000001105c4:	00 18                	add    %bl,(%rax)
ffff8000001105c6:	18 00                	sbb    %al,(%rax)
ffff8000001105c8:	00 00                	add    %al,(%rax)
ffff8000001105ca:	00 00                	add    %al,(%rax)
ffff8000001105cc:	18 18                	sbb    %bl,(%rax)
ffff8000001105ce:	00 00                	add    %al,(%rax)
ffff8000001105d0:	00 00                	add    %al,(%rax)
ffff8000001105d2:	00 00                	add    %al,(%rax)
ffff8000001105d4:	00 18                	add    %bl,(%rax)
ffff8000001105d6:	18 00                	sbb    %al,(%rax)
ffff8000001105d8:	00 00                	add    %al,(%rax)
ffff8000001105da:	00 18                	add    %bl,(%rax)
ffff8000001105dc:	18 08                	sbb    %cl,(%rax)
ffff8000001105de:	08 10                	or     %dl,(%rax)
ffff8000001105e0:	00 02                	add    %al,(%rdx)
ffff8000001105e2:	04 08                	add    $0x8,%al
ffff8000001105e4:	10 20                	adc    %ah,(%rax)
ffff8000001105e6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff8000001105ed:	04 
ffff8000001105ee:	02 00                	add    (%rax),%al
ffff8000001105f0:	00 00                	add    %al,(%rax)
ffff8000001105f2:	00 00                	add    %al,(%rax)
ffff8000001105f4:	00 00                	add    %al,(%rax)
ffff8000001105f6:	fe 00                	incb   (%rax)
ffff8000001105f8:	00 fe                	add    %bh,%dh
ffff8000001105fa:	00 00                	add    %al,(%rax)
ffff8000001105fc:	00 00                	add    %al,(%rax)
ffff8000001105fe:	00 00                	add    %al,(%rax)
ffff800000110600:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff800000110606:	04 02                	add    $0x2,%al
ffff800000110608:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000011060b:	10 20                	adc    %ah,(%rax)
ffff80000011060d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000110611:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110615:	82                   	(bad)  
ffff800000110616:	04 08                	add    $0x8,%al
ffff800000110618:	10 10                	adc    %dl,(%rax)
ffff80000011061a:	00 00                	add    %al,(%rax)
ffff80000011061c:	18 18                	sbb    %bl,(%rax)
ffff80000011061e:	00 00                	add    %al,(%rax)
ffff800000110620:	00 38                	add    %bh,(%rax)
ffff800000110622:	44 82                	rex.R (bad) 
ffff800000110624:	9a                   	(bad)  
ffff800000110625:	aa                   	stos   %al,%es:(%rdi)
ffff800000110626:	aa                   	stos   %al,%es:(%rdi)
ffff800000110627:	aa                   	stos   %al,%es:(%rdi)
ffff800000110628:	aa                   	stos   %al,%es:(%rdi)
ffff800000110629:	aa                   	stos   %al,%es:(%rdi)
ffff80000011062a:	9c                   	pushfq 
ffff80000011062b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000011062f:	00 00                	add    %al,(%rax)
ffff800000110631:	18 18                	sbb    %bl,(%rax)
ffff800000110633:	18 18                	sbb    %bl,(%rax)
ffff800000110635:	24 24                	and    $0x24,%al
ffff800000110637:	24 24                	and    $0x24,%al
ffff800000110639:	7e 42                	jle    ffff80000011067d <interrupt+0x51d>
ffff80000011063b:	42                   	rex.X
ffff80000011063c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011063f:	00 00                	add    %al,(%rax)
ffff800000110641:	f0 48                	lock rex.W
ffff800000110643:	44                   	rex.R
ffff800000110644:	44                   	rex.R
ffff800000110645:	44                   	rex.R
ffff800000110646:	48 78 44             	rex.W js ffff80000011068d <interrupt+0x52d>
ffff800000110649:	42                   	rex.X
ffff80000011064a:	42                   	rex.X
ffff80000011064b:	42                   	rex.X
ffff80000011064c:	44 f8                	rex.R clc 
ffff80000011064e:	00 00                	add    %al,(%rax)
ffff800000110650:	00 3a                	add    %bh,(%rdx)
ffff800000110652:	46                   	rex.RX
ffff800000110653:	42 82                	rex.X (bad) 
ffff800000110655:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000011065c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011065f:	00 00                	add    %al,(%rax)
ffff800000110661:	f8                   	clc    
ffff800000110662:	44                   	rex.R
ffff800000110663:	44                   	rex.R
ffff800000110664:	42                   	rex.X
ffff800000110665:	42                   	rex.X
ffff800000110666:	42                   	rex.X
ffff800000110667:	42                   	rex.X
ffff800000110668:	42                   	rex.X
ffff800000110669:	42                   	rex.X
ffff80000011066a:	42                   	rex.X
ffff80000011066b:	44                   	rex.R
ffff80000011066c:	44 f8                	rex.R clc 
ffff80000011066e:	00 00                	add    %al,(%rax)
ffff800000110670:	00 fe                	add    %bh,%dh
ffff800000110672:	42                   	rex.X
ffff800000110673:	42                   	rex.X
ffff800000110674:	40                   	rex
ffff800000110675:	40                   	rex
ffff800000110676:	44 7c 44             	rex.R jl ffff8000001106bd <interrupt+0x55d>
ffff800000110679:	40                   	rex
ffff80000011067a:	40                   	rex
ffff80000011067b:	42                   	rex.X
ffff80000011067c:	42 fe 00             	rex.X incb (%rax)
ffff80000011067f:	00 00                	add    %al,(%rax)
ffff800000110681:	fe 42 42             	incb   0x42(%rdx)
ffff800000110684:	40                   	rex
ffff800000110685:	40                   	rex
ffff800000110686:	44 7c 44             	rex.R jl ffff8000001106cd <interrupt+0x56d>
ffff800000110689:	44                   	rex.R
ffff80000011068a:	40                   	rex
ffff80000011068b:	40                   	rex
ffff80000011068c:	40                   	rex
ffff80000011068d:	f0 00 00             	lock add %al,(%rax)
ffff800000110690:	00 3a                	add    %bh,(%rdx)
ffff800000110692:	46                   	rex.RX
ffff800000110693:	42 82                	rex.X (bad) 
ffff800000110695:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000011069c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000011069f:	00 00                	add    %al,(%rax)
ffff8000001106a1:	e7 42                	out    %eax,$0x42
ffff8000001106a3:	42                   	rex.X
ffff8000001106a4:	42                   	rex.X
ffff8000001106a5:	42                   	rex.X
ffff8000001106a6:	42 7e 42             	rex.X jle ffff8000001106eb <interrupt+0x58b>
ffff8000001106a9:	42                   	rex.X
ffff8000001106aa:	42                   	rex.X
ffff8000001106ab:	42                   	rex.X
ffff8000001106ac:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001106af:	00 00                	add    %al,(%rax)
ffff8000001106b1:	7c 10                	jl     ffff8000001106c3 <interrupt+0x563>
ffff8000001106b3:	10 10                	adc    %dl,(%rax)
ffff8000001106b5:	10 10                	adc    %dl,(%rax)
ffff8000001106b7:	10 10                	adc    %dl,(%rax)
ffff8000001106b9:	10 10                	adc    %dl,(%rax)
ffff8000001106bb:	10 10                	adc    %dl,(%rax)
ffff8000001106bd:	7c 00                	jl     ffff8000001106bf <interrupt+0x55f>
ffff8000001106bf:	00 00                	add    %al,(%rax)
ffff8000001106c1:	1f                   	(bad)  
ffff8000001106c2:	04 04                	add    $0x4,%al
ffff8000001106c4:	04 04                	add    $0x4,%al
ffff8000001106c6:	04 04                	add    $0x4,%al
ffff8000001106c8:	04 04                	add    $0x4,%al
ffff8000001106ca:	04 04                	add    $0x4,%al
ffff8000001106cc:	84 48 30             	test   %cl,0x30(%rax)
ffff8000001106cf:	00 00                	add    %al,(%rax)
ffff8000001106d1:	e7 42                	out    %eax,$0x42
ffff8000001106d3:	44                   	rex.R
ffff8000001106d4:	48 50                	rex.W push %rax
ffff8000001106d6:	50                   	push   %rax
ffff8000001106d7:	60                   	(bad)  
ffff8000001106d8:	50                   	push   %rax
ffff8000001106d9:	50                   	push   %rax
ffff8000001106da:	48                   	rex.W
ffff8000001106db:	44                   	rex.R
ffff8000001106dc:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001106df:	00 00                	add    %al,(%rax)
ffff8000001106e1:	f0 40                	lock rex
ffff8000001106e3:	40                   	rex
ffff8000001106e4:	40                   	rex
ffff8000001106e5:	40                   	rex
ffff8000001106e6:	40                   	rex
ffff8000001106e7:	40                   	rex
ffff8000001106e8:	40                   	rex
ffff8000001106e9:	40                   	rex
ffff8000001106ea:	40                   	rex
ffff8000001106eb:	42                   	rex.X
ffff8000001106ec:	42 fe 00             	rex.X incb (%rax)
ffff8000001106ef:	00 00                	add    %al,(%rax)
ffff8000001106f1:	c3                   	retq   
ffff8000001106f2:	42                   	rex.X
ffff8000001106f3:	66 66 66 5a          	data16 data16 pop %dx
ffff8000001106f7:	5a                   	pop    %rdx
ffff8000001106f8:	5a                   	pop    %rdx
ffff8000001106f9:	42                   	rex.X
ffff8000001106fa:	42                   	rex.X
ffff8000001106fb:	42                   	rex.X
ffff8000001106fc:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001106ff:	00 00                	add    %al,(%rax)
ffff800000110701:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff800000110708:	4a                   	rex.WX
ffff800000110709:	4a                   	rex.WX
ffff80000011070a:	4a                   	rex.WX
ffff80000011070b:	46                   	rex.RX
ffff80000011070c:	46 e2 00             	rex.RX loop ffff80000011070f <interrupt+0x5af>
ffff80000011070f:	00 00                	add    %al,(%rax)
ffff800000110711:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110715:	82                   	(bad)  
ffff800000110716:	82                   	(bad)  
ffff800000110717:	82                   	(bad)  
ffff800000110718:	82                   	(bad)  
ffff800000110719:	82                   	(bad)  
ffff80000011071a:	82                   	(bad)  
ffff80000011071b:	82                   	(bad)  
ffff80000011071c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011071f:	00 00                	add    %al,(%rax)
ffff800000110721:	f8                   	clc    
ffff800000110722:	44                   	rex.R
ffff800000110723:	42                   	rex.X
ffff800000110724:	42                   	rex.X
ffff800000110725:	42                   	rex.X
ffff800000110726:	44 78 40             	rex.R js ffff800000110769 <interrupt+0x609>
ffff800000110729:	40                   	rex
ffff80000011072a:	40                   	rex
ffff80000011072b:	40                   	rex
ffff80000011072c:	40                   	rex
ffff80000011072d:	f0 00 00             	lock add %al,(%rax)
ffff800000110730:	00 38                	add    %bh,(%rax)
ffff800000110732:	44 82                	rex.R (bad) 
ffff800000110734:	82                   	(bad)  
ffff800000110735:	82                   	(bad)  
ffff800000110736:	82                   	(bad)  
ffff800000110737:	82                   	(bad)  
ffff800000110738:	82                   	(bad)  
ffff800000110739:	82                   	(bad)  
ffff80000011073a:	92                   	xchg   %eax,%edx
ffff80000011073b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000011073f:	00 00                	add    %al,(%rax)
ffff800000110741:	fc                   	cld    
ffff800000110742:	42                   	rex.X
ffff800000110743:	42                   	rex.X
ffff800000110744:	42                   	rex.X
ffff800000110745:	42 7c 44             	rex.X jl ffff80000011078c <interrupt+0x62c>
ffff800000110748:	42                   	rex.X
ffff800000110749:	42                   	rex.X
ffff80000011074a:	42                   	rex.X
ffff80000011074b:	42                   	rex.X
ffff80000011074c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011074f:	00 00                	add    %al,(%rax)
ffff800000110751:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff800000110754:	82                   	(bad)  
ffff800000110755:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff800000110759:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000011075f:	00 00                	add    %al,(%rax)
ffff800000110761:	fe                   	(bad)  
ffff800000110762:	92                   	xchg   %eax,%edx
ffff800000110763:	92                   	xchg   %eax,%edx
ffff800000110764:	10 10                	adc    %dl,(%rax)
ffff800000110766:	10 10                	adc    %dl,(%rax)
ffff800000110768:	10 10                	adc    %dl,(%rax)
ffff80000011076a:	10 10                	adc    %dl,(%rax)
ffff80000011076c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff800000110770:	00 e7                	add    %ah,%bh
ffff800000110772:	42                   	rex.X
ffff800000110773:	42                   	rex.X
ffff800000110774:	42                   	rex.X
ffff800000110775:	42                   	rex.X
ffff800000110776:	42                   	rex.X
ffff800000110777:	42                   	rex.X
ffff800000110778:	42                   	rex.X
ffff800000110779:	42                   	rex.X
ffff80000011077a:	42                   	rex.X
ffff80000011077b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000011077e:	00 00                	add    %al,(%rax)
ffff800000110780:	00 e7                	add    %ah,%bh
ffff800000110782:	42                   	rex.X
ffff800000110783:	42                   	rex.X
ffff800000110784:	42                   	rex.X
ffff800000110785:	42 24 24             	rex.X and $0x24,%al
ffff800000110788:	24 24                	and    $0x24,%al
ffff80000011078a:	18 18                	sbb    %bl,(%rax)
ffff80000011078c:	18 18                	sbb    %bl,(%rax)
ffff80000011078e:	00 00                	add    %al,(%rax)
ffff800000110790:	00 e7                	add    %ah,%bh
ffff800000110792:	42                   	rex.X
ffff800000110793:	42                   	rex.X
ffff800000110794:	42 5a                	rex.X pop %rdx
ffff800000110796:	5a                   	pop    %rdx
ffff800000110797:	5a                   	pop    %rdx
ffff800000110798:	5a                   	pop    %rdx
ffff800000110799:	24 24                	and    $0x24,%al
ffff80000011079b:	24 24                	and    $0x24,%al
ffff80000011079d:	24 00                	and    $0x0,%al
ffff80000011079f:	00 00                	add    %al,(%rax)
ffff8000001107a1:	e7 42                	out    %eax,$0x42
ffff8000001107a3:	42 24 24             	rex.X and $0x24,%al
ffff8000001107a6:	24 18                	and    $0x18,%al
ffff8000001107a8:	24 24                	and    $0x24,%al
ffff8000001107aa:	24 42                	and    $0x42,%al
ffff8000001107ac:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001107af:	00 00                	add    %al,(%rax)
ffff8000001107b1:	ee                   	out    %al,(%dx)
ffff8000001107b2:	44                   	rex.R
ffff8000001107b3:	44                   	rex.R
ffff8000001107b4:	44 28 28             	sub    %r13b,(%rax)
ffff8000001107b7:	28 10                	sub    %dl,(%rax)
ffff8000001107b9:	10 10                	adc    %dl,(%rax)
ffff8000001107bb:	10 10                	adc    %dl,(%rax)
ffff8000001107bd:	7c 00                	jl     ffff8000001107bf <interrupt+0x65f>
ffff8000001107bf:	00 00                	add    %al,(%rax)
ffff8000001107c1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff8000001107c8:	20 20                	and    %ah,(%rax)
ffff8000001107ca:	40                   	rex
ffff8000001107cb:	42 82                	rex.X (bad) 
ffff8000001107cd:	fe 00                	incb   (%rax)
ffff8000001107cf:	00 00                	add    %al,(%rax)
ffff8000001107d1:	3e 20 20             	and    %ah,%ds:(%rax)
ffff8000001107d4:	20 20                	and    %ah,(%rax)
ffff8000001107d6:	20 20                	and    %ah,(%rax)
ffff8000001107d8:	20 20                	and    %ah,(%rax)
ffff8000001107da:	20 20                	and    %ah,(%rax)
ffff8000001107dc:	20 20                	and    %ah,(%rax)
ffff8000001107de:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff8000001107e5:	20 20                	and    %ah,(%rax)
ffff8000001107e7:	10 10                	adc    %dl,(%rax)
ffff8000001107e9:	08 08                	or     %cl,(%rax)
ffff8000001107eb:	04 04                	add    $0x4,%al
ffff8000001107ed:	04 02                	add    $0x2,%al
ffff8000001107ef:	02 00                	add    (%rax),%al
ffff8000001107f1:	7c 04                	jl     ffff8000001107f7 <interrupt+0x697>
ffff8000001107f3:	04 04                	add    $0x4,%al
ffff8000001107f5:	04 04                	add    $0x4,%al
ffff8000001107f7:	04 04                	add    $0x4,%al
ffff8000001107f9:	04 04                	add    $0x4,%al
ffff8000001107fb:	04 04                	add    $0x4,%al
ffff8000001107fd:	04 7c                	add    $0x7c,%al
ffff8000001107ff:	00 00                	add    %al,(%rax)
ffff800000110801:	10 28                	adc    %ch,(%rax)
ffff800000110803:	44 82                	rex.R (bad) 
	...
ffff80000011081d:	00 fe                	add    %bh,%dh
ffff80000011081f:	00 10                	add    %dl,(%rax)
ffff800000110821:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff800000110834:	00 70 08             	add    %dh,0x8(%rax)
ffff800000110837:	04 3c                	add    $0x3c,%al
ffff800000110839:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff800000110840:	c0 
ffff800000110841:	40                   	rex
ffff800000110842:	40                   	rex
ffff800000110843:	40                   	rex
ffff800000110844:	40 58                	rex pop %rax
ffff800000110846:	64 42                	fs rex.X
ffff800000110848:	42                   	rex.X
ffff800000110849:	42                   	rex.X
ffff80000011084a:	42                   	rex.X
ffff80000011084b:	42                   	rex.X
ffff80000011084c:	64 58                	fs pop %rax
ffff80000011084e:	00 00                	add    %al,(%rax)
ffff800000110850:	00 00                	add    %al,(%rax)
ffff800000110852:	00 00                	add    %al,(%rax)
ffff800000110854:	00 30                	add    %dh,(%rax)
ffff800000110856:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000011085d:	38 
ffff80000011085e:	00 00                	add    %al,(%rax)
ffff800000110860:	0c 04                	or     $0x4,%al
ffff800000110862:	04 04                	add    $0x4,%al
ffff800000110864:	04 34                	add    $0x34,%al
ffff800000110866:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000011086d:	36 
ffff80000011086e:	00 00                	add    %al,(%rax)
ffff800000110870:	00 00                	add    %al,(%rax)
ffff800000110872:	00 00                	add    %al,(%rax)
ffff800000110874:	00 38                	add    %bh,(%rax)
ffff800000110876:	44 82                	rex.R (bad) 
ffff800000110878:	82                   	(bad)  
ffff800000110879:	fc                   	cld    
ffff80000011087a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff800000110881:	10 10                	adc    %dl,(%rax)
ffff800000110883:	10 10                	adc    %dl,(%rax)
ffff800000110885:	7c 10                	jl     ffff800000110897 <interrupt+0x737>
ffff800000110887:	10 10                	adc    %dl,(%rax)
ffff800000110889:	10 10                	adc    %dl,(%rax)
ffff80000011088b:	10 10                	adc    %dl,(%rax)
ffff80000011088d:	7c 00                	jl     ffff80000011088f <interrupt+0x72f>
ffff80000011088f:	00 00                	add    %al,(%rax)
ffff800000110891:	00 00                	add    %al,(%rax)
ffff800000110893:	00 00                	add    %al,(%rax)
ffff800000110895:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000011089c:	34 04 
ffff80000011089e:	04 38                	add    $0x38,%al
ffff8000001108a0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff8000001108a4:	40 58                	rex pop %rax
ffff8000001108a6:	64 42                	fs rex.X
ffff8000001108a8:	42                   	rex.X
ffff8000001108a9:	42                   	rex.X
ffff8000001108aa:	42                   	rex.X
ffff8000001108ab:	42                   	rex.X
ffff8000001108ac:	42 e3 00             	rex.X jrcxz ffff8000001108af <interrupt+0x74f>
ffff8000001108af:	00 00                	add    %al,(%rax)
ffff8000001108b1:	10 10                	adc    %dl,(%rax)
ffff8000001108b3:	00 00                	add    %al,(%rax)
ffff8000001108b5:	30 10                	xor    %dl,(%rax)
ffff8000001108b7:	10 10                	adc    %dl,(%rax)
ffff8000001108b9:	10 10                	adc    %dl,(%rax)
ffff8000001108bb:	10 10                	adc    %dl,(%rax)
ffff8000001108bd:	38 00                	cmp    %al,(%rax)
ffff8000001108bf:	00 00                	add    %al,(%rax)
ffff8000001108c1:	04 04                	add    $0x4,%al
ffff8000001108c3:	00 00                	add    %al,(%rax)
ffff8000001108c5:	0c 04                	or     $0x4,%al
ffff8000001108c7:	04 04                	add    $0x4,%al
ffff8000001108c9:	04 04                	add    $0x4,%al
ffff8000001108cb:	04 04                	add    $0x4,%al
ffff8000001108cd:	08 08                	or     %cl,(%rax)
ffff8000001108cf:	30 c0                	xor    %al,%al
ffff8000001108d1:	40                   	rex
ffff8000001108d2:	40                   	rex
ffff8000001108d3:	40                   	rex
ffff8000001108d4:	40                   	rex
ffff8000001108d5:	4e                   	rex.WRX
ffff8000001108d6:	44                   	rex.R
ffff8000001108d7:	48 50                	rex.W push %rax
ffff8000001108d9:	60                   	(bad)  
ffff8000001108da:	50                   	push   %rax
ffff8000001108db:	48                   	rex.W
ffff8000001108dc:	44 e6 00             	rex.R out %al,$0x0
ffff8000001108df:	00 30                	add    %dh,(%rax)
ffff8000001108e1:	10 10                	adc    %dl,(%rax)
ffff8000001108e3:	10 10                	adc    %dl,(%rax)
ffff8000001108e5:	10 10                	adc    %dl,(%rax)
ffff8000001108e7:	10 10                	adc    %dl,(%rax)
ffff8000001108e9:	10 10                	adc    %dl,(%rax)
ffff8000001108eb:	10 10                	adc    %dl,(%rax)
ffff8000001108ed:	38 00                	cmp    %al,(%rax)
ffff8000001108ef:	00 00                	add    %al,(%rax)
ffff8000001108f1:	00 00                	add    %al,(%rax)
ffff8000001108f3:	00 00                	add    %al,(%rax)
ffff8000001108f5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff8000001108f9:	49                   	rex.WB
ffff8000001108fa:	49                   	rex.WB
ffff8000001108fb:	49                   	rex.WB
ffff8000001108fc:	49 db 00             	rex.WB fildl (%r8)
ffff8000001108ff:	00 00                	add    %al,(%rax)
ffff800000110901:	00 00                	add    %al,(%rax)
ffff800000110903:	00 00                	add    %al,(%rax)
ffff800000110905:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff800000110909:	42                   	rex.X
ffff80000011090a:	42                   	rex.X
ffff80000011090b:	42                   	rex.X
ffff80000011090c:	42 e3 00             	rex.X jrcxz ffff80000011090f <interrupt+0x7af>
ffff80000011090f:	00 00                	add    %al,(%rax)
ffff800000110911:	00 00                	add    %al,(%rax)
ffff800000110913:	00 00                	add    %al,(%rax)
ffff800000110915:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110919:	82                   	(bad)  
ffff80000011091a:	82                   	(bad)  
ffff80000011091b:	82                   	(bad)  
ffff80000011091c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011091f:	00 00                	add    %al,(%rax)
ffff800000110921:	00 00                	add    %al,(%rax)
ffff800000110923:	00 d8                	add    %bl,%al
ffff800000110925:	64 42                	fs rex.X
ffff800000110927:	42                   	rex.X
ffff800000110928:	42                   	rex.X
ffff800000110929:	42                   	rex.X
ffff80000011092a:	42                   	rex.X
ffff80000011092b:	64 58                	fs pop %rax
ffff80000011092d:	40                   	rex
ffff80000011092e:	40 e0 00             	rex loopne ffff800000110931 <interrupt+0x7d1>
ffff800000110931:	00 00                	add    %al,(%rax)
ffff800000110933:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff800000110936:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000011093d:	04 04                	add    $0x4,%al
ffff80000011093f:	0e                   	(bad)  
ffff800000110940:	00 00                	add    %al,(%rax)
ffff800000110942:	00 00                	add    %al,(%rax)
ffff800000110944:	00 dc                	add    %bl,%ah
ffff800000110946:	62 42                	(bad)  
ffff800000110948:	40                   	rex
ffff800000110949:	40                   	rex
ffff80000011094a:	40                   	rex
ffff80000011094b:	40                   	rex
ffff80000011094c:	40 e0 00             	rex loopne ffff80000011094f <interrupt+0x7ef>
ffff80000011094f:	00 00                	add    %al,(%rax)
ffff800000110951:	00 00                	add    %al,(%rax)
ffff800000110953:	00 00                	add    %al,(%rax)
ffff800000110955:	7a 86                	jp     ffff8000001108dd <interrupt+0x77d>
ffff800000110957:	82                   	(bad)  
ffff800000110958:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000011095b:	82                   	(bad)  
ffff80000011095c:	c2 bc 00             	retq   $0xbc
ffff80000011095f:	00 00                	add    %al,(%rax)
ffff800000110961:	00 10                	add    %dl,(%rax)
ffff800000110963:	10 10                	adc    %dl,(%rax)
ffff800000110965:	7c 10                	jl     ffff800000110977 <interrupt+0x817>
ffff800000110967:	10 10                	adc    %dl,(%rax)
ffff800000110969:	10 10                	adc    %dl,(%rax)
ffff80000011096b:	10 10                	adc    %dl,(%rax)
ffff80000011096d:	0e                   	(bad)  
ffff80000011096e:	00 00                	add    %al,(%rax)
ffff800000110970:	00 00                	add    %al,(%rax)
ffff800000110972:	00 00                	add    %al,(%rax)
ffff800000110974:	00 c6                	add    %al,%dh
ffff800000110976:	42                   	rex.X
ffff800000110977:	42                   	rex.X
ffff800000110978:	42                   	rex.X
ffff800000110979:	42                   	rex.X
ffff80000011097a:	42                   	rex.X
ffff80000011097b:	42                   	rex.X
ffff80000011097c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000011097f:	00 00                	add    %al,(%rax)
ffff800000110981:	00 00                	add    %al,(%rax)
ffff800000110983:	00 00                	add    %al,(%rax)
ffff800000110985:	e7 42                	out    %eax,$0x42
ffff800000110987:	42                   	rex.X
ffff800000110988:	42 24 24             	rex.X and $0x24,%al
ffff80000011098b:	24 18                	and    $0x18,%al
ffff80000011098d:	18 00                	sbb    %al,(%rax)
ffff80000011098f:	00 00                	add    %al,(%rax)
ffff800000110991:	00 00                	add    %al,(%rax)
ffff800000110993:	00 00                	add    %al,(%rax)
ffff800000110995:	e7 42                	out    %eax,$0x42
ffff800000110997:	42 5a                	rex.X pop %rdx
ffff800000110999:	5a                   	pop    %rdx
ffff80000011099a:	5a                   	pop    %rdx
ffff80000011099b:	24 24                	and    $0x24,%al
ffff80000011099d:	24 00                	and    $0x0,%al
ffff80000011099f:	00 00                	add    %al,(%rax)
ffff8000001109a1:	00 00                	add    %al,(%rax)
ffff8000001109a3:	00 00                	add    %al,(%rax)
ffff8000001109a5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff8000001109aa:	28 28                	sub    %ch,(%rax)
ffff8000001109ac:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff8000001109b0:	00 00                	add    %al,(%rax)
ffff8000001109b2:	00 00                	add    %al,(%rax)
ffff8000001109b4:	00 e7                	add    %ah,%bh
ffff8000001109b6:	42                   	rex.X
ffff8000001109b7:	42 24 24             	rex.X and $0x24,%al
ffff8000001109ba:	24 18                	and    $0x18,%al
ffff8000001109bc:	18 10                	sbb    %dl,(%rax)
ffff8000001109be:	10 60 00             	adc    %ah,0x0(%rax)
ffff8000001109c1:	00 00                	add    %al,(%rax)
ffff8000001109c3:	00 00                	add    %al,(%rax)
ffff8000001109c5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff8000001109cb:	42 82                	rex.X (bad) 
ffff8000001109cd:	fe 00                	incb   (%rax)
ffff8000001109cf:	00 00                	add    %al,(%rax)
ffff8000001109d1:	06                   	(bad)  
ffff8000001109d2:	08 10                	or     %dl,(%rax)
ffff8000001109d4:	10 10                	adc    %dl,(%rax)
ffff8000001109d6:	10 60 10             	adc    %ah,0x10(%rax)
ffff8000001109d9:	10 10                	adc    %dl,(%rax)
ffff8000001109db:	10 08                	adc    %cl,(%rax)
ffff8000001109dd:	06                   	(bad)  
ffff8000001109de:	00 00                	add    %al,(%rax)
ffff8000001109e0:	10 10                	adc    %dl,(%rax)
ffff8000001109e2:	10 10                	adc    %dl,(%rax)
ffff8000001109e4:	10 10                	adc    %dl,(%rax)
ffff8000001109e6:	10 10                	adc    %dl,(%rax)
ffff8000001109e8:	10 10                	adc    %dl,(%rax)
ffff8000001109ea:	10 10                	adc    %dl,(%rax)
ffff8000001109ec:	10 10                	adc    %dl,(%rax)
ffff8000001109ee:	10 10                	adc    %dl,(%rax)
ffff8000001109f0:	00 60 10             	add    %ah,0x10(%rax)
ffff8000001109f3:	08 08                	or     %cl,(%rax)
ffff8000001109f5:	08 08                	or     %cl,(%rax)
ffff8000001109f7:	06                   	(bad)  
ffff8000001109f8:	08 08                	or     %cl,(%rax)
ffff8000001109fa:	08 08                	or     %cl,(%rax)
ffff8000001109fc:	10 60 00             	adc    %ah,0x0(%rax)
ffff8000001109ff:	00 00                	add    %al,(%rax)
ffff800000110a01:	72 8c                	jb     ffff80000011098f <interrupt+0x82f>
	...
ffff80000011121f:	00 00                	add    %al,(%rax)
ffff800000111221:	00 12                	add    %dl,(%rdx)
ffff800000111223:	00 00                	add    %al,(%rax)
ffff800000111225:	80 ff ff             	cmp    $0xff,%bh
	...
ffff800000111230:	00 00                	add    %al,(%rax)
ffff800000111232:	12 00                	adc    (%rax),%al
ffff800000111234:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000011123a:	00 00                	add    %al,(%rax)
ffff80000011123c:	00 00                	add    %al,(%rax)
ffff80000011123e:	00 00                	add    %al,(%rax)
ffff800000111240:	10 00                	adc    %al,(%rax)
	...
ffff80000011125e:	00 00                	add    %al,(%rax)
ffff800000111260:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff800000111266:	ff                   	(bad)  
ffff800000111267:	ff 00                	incl   (%rax)
	...
ffff8000001112a5:	00 12                	add    %dl,(%rdx)
ffff8000001112a7:	00 00                	add    %al,(%rax)
ffff8000001112a9:	80 ff ff             	cmp    $0xff,%bh
ffff8000001112ac:	00 00                	add    %al,(%rax)
ffff8000001112ae:	12 00                	adc    (%rax),%al
ffff8000001112b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001112b6:	12 00                	adc    (%rax),%al
ffff8000001112b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001112be:	00 00                	add    %al,(%rax)
ffff8000001112c0:	00 00                	add    %al,(%rax)
ffff8000001112c2:	00 00                	add    %al,(%rax)
ffff8000001112c4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001112c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001112ce:	00 00                	add    %al,(%rax)
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
ffff8000001112f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011130e:	12 00                	adc    (%rax),%al
ffff800000111310:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111316:	12 00                	adc    (%rax),%al
ffff800000111318:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011131e:	12 00                	adc    (%rax),%al
ffff800000111320:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111326:	00 00                	add    %al,(%rax)
ffff800000111328:	00 00                	add    %al,(%rax)
ffff80000011132a:	00 00                	add    %al,(%rax)
ffff80000011132c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111330:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111336:	00 00                	add    %al,(%rax)
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
ffff800000111360:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111376:	12 00                	adc    (%rax),%al
ffff800000111378:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011137e:	12 00                	adc    (%rax),%al
ffff800000111380:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111386:	12 00                	adc    (%rax),%al
ffff800000111388:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011138e:	00 00                	add    %al,(%rax)
ffff800000111390:	00 00                	add    %al,(%rax)
ffff800000111392:	00 00                	add    %al,(%rax)
ffff800000111394:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111398:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011139e:	00 00                	add    %al,(%rax)
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
ffff8000001113c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001113de:	12 00                	adc    (%rax),%al
ffff8000001113e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113e6:	12 00                	adc    (%rax),%al
ffff8000001113e8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113ee:	12 00                	adc    (%rax),%al
ffff8000001113f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001113f6:	00 00                	add    %al,(%rax)
ffff8000001113f8:	00 00                	add    %al,(%rax)
ffff8000001113fa:	00 00                	add    %al,(%rax)
ffff8000001113fc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111400:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111406:	00 00                	add    %al,(%rax)
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
ffff800000111430:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111446:	12 00                	adc    (%rax),%al
ffff800000111448:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011144e:	12 00                	adc    (%rax),%al
ffff800000111450:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111456:	12 00                	adc    (%rax),%al
ffff800000111458:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011145e:	00 00                	add    %al,(%rax)
ffff800000111460:	00 00                	add    %al,(%rax)
ffff800000111462:	00 00                	add    %al,(%rax)
ffff800000111464:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111468:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011146e:	00 00                	add    %al,(%rax)
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
ffff800000111498:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001114ae:	12 00                	adc    (%rax),%al
ffff8000001114b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114b6:	12 00                	adc    (%rax),%al
ffff8000001114b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114be:	12 00                	adc    (%rax),%al
ffff8000001114c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001114c6:	00 00                	add    %al,(%rax)
ffff8000001114c8:	00 00                	add    %al,(%rax)
ffff8000001114ca:	00 00                	add    %al,(%rax)
ffff8000001114cc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001114d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001114d6:	00 00                	add    %al,(%rax)
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
ffff800000111500:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111516:	12 00                	adc    (%rax),%al
ffff800000111518:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011151e:	12 00                	adc    (%rax),%al
ffff800000111520:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111526:	12 00                	adc    (%rax),%al
ffff800000111528:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011152e:	00 00                	add    %al,(%rax)
ffff800000111530:	00 00                	add    %al,(%rax)
ffff800000111532:	00 00                	add    %al,(%rax)
ffff800000111534:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111538:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011153e:	00 00                	add    %al,(%rax)
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
ffff800000111568:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011157e:	12 00                	adc    (%rax),%al
ffff800000111580:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111586:	12 00                	adc    (%rax),%al
ffff800000111588:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011158e:	12 00                	adc    (%rax),%al
ffff800000111590:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111596:	00 00                	add    %al,(%rax)
ffff800000111598:	00 00                	add    %al,(%rax)
ffff80000011159a:	00 00                	add    %al,(%rax)
ffff80000011159c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001115a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115a6:	00 00                	add    %al,(%rax)
ffff8000001115a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115ae:	00 00                	add    %al,(%rax)
ffff8000001115b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115b6:	00 00                	add    %al,(%rax)
ffff8000001115b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115be:	00 00                	add    %al,(%rax)
ffff8000001115c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115c6:	00 00                	add    %al,(%rax)
ffff8000001115c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115ce:	00 00                	add    %al,(%rax)
ffff8000001115d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001115de:	00 00                	add    %al,(%rax)
ffff8000001115e0:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff8000001115e4:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
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
ffff8000001119dc:	00                   	.byte 0x0
ffff8000001119dd:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff8000001119e0 <_rodata>:
ffff8000001119e0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001119e1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001119e2:	5f                   	pop    %rdi
ffff8000001119e3:	73 79                	jae    ffff800000111a5e <_rodata+0x7e>
ffff8000001119e5:	73 74                	jae    ffff800000111a5b <_rodata+0x7b>
ffff8000001119e7:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff8000001119e9:	5f                   	pop    %rdi
ffff8000001119ea:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff8000001119ed:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119ee:	20 69 73             	and    %ch,0x73(%rcx)
ffff8000001119f1:	20 63 61             	and    %ah,0x61(%rbx)
ffff8000001119f4:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119f5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119f6:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff8000001119fd:	25 23 30 34 78       	and    $0x78343023,%eax
ffff800000111a02:	0a 00                	or     (%rax),%al
ffff800000111a04:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111a05:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000111a07:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111a08:	72 79                	jb     ffff800000111a83 <_rodata+0xa3>
ffff800000111a0a:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000111a0d:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
ffff800000111a14:	74 
ffff800000111a15:	65 72 72             	gs jb  ffff800000111a8a <_rodata+0xaa>
ffff800000111a18:	75 70                	jne    ffff800000111a8a <_rodata+0xaa>
ffff800000111a1a:	74 20                	je     ffff800000111a3c <_rodata+0x5c>
ffff800000111a1c:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000111a23:	74 61                	je     ffff800000111a86 <_rodata+0xa6>
ffff800000111a25:	73 6b                	jae    ffff800000111a92 <_rodata+0xb2>
ffff800000111a27:	5f                   	pop    %rdi
ffff800000111a28:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000111a2f:	00 30                	add    %dh,(%rax)
ffff800000111a31:	31 32                	xor    %esi,(%rdx)
ffff800000111a33:	33 34 35 36 37 38 39 	xor    0x39383736(,%rsi,1),%esi
ffff800000111a3a:	41                   	rex.B
ffff800000111a3b:	42                   	rex.X
ffff800000111a3c:	43                   	rex.XB
ffff800000111a3d:	44                   	rex.R
ffff800000111a3e:	45                   	rex.RB
ffff800000111a3f:	46                   	rex.RX
ffff800000111a40:	47                   	rex.RXB
ffff800000111a41:	48                   	rex.W
ffff800000111a42:	49                   	rex.WB
ffff800000111a43:	4a                   	rex.WX
ffff800000111a44:	4b                   	rex.WXB
ffff800000111a45:	4c                   	rex.WR
ffff800000111a46:	4d                   	rex.WRB
ffff800000111a47:	4e                   	rex.WRX
ffff800000111a48:	4f 50                	rex.WRXB push %r8
ffff800000111a4a:	51                   	push   %rcx
ffff800000111a4b:	52                   	push   %rdx
ffff800000111a4c:	53                   	push   %rbx
ffff800000111a4d:	54                   	push   %rsp
ffff800000111a4e:	55                   	push   %rbp
ffff800000111a4f:	56                   	push   %rsi
ffff800000111a50:	57                   	push   %rdi
ffff800000111a51:	58                   	pop    %rax
ffff800000111a52:	59                   	pop    %rcx
ffff800000111a53:	5a                   	pop    %rdx
ffff800000111a54:	00 00                	add    %al,(%rax)
ffff800000111a56:	00 00                	add    %al,(%rax)
ffff800000111a58:	30 31                	xor    %dh,(%rcx)
ffff800000111a5a:	32 33                	xor    (%rbx),%dh
ffff800000111a5c:	34 35                	xor    $0x35,%al
ffff800000111a5e:	36 37                	ss (bad) 
ffff800000111a60:	38 39                	cmp    %bh,(%rcx)
ffff800000111a62:	61                   	(bad)  
ffff800000111a63:	62 63 64 65 66       	(bad)
ffff800000111a68:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
ffff800000111a6e:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111a6f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111a70:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111a71:	70 71                	jo     ffff800000111ae4 <_rodata+0x104>
ffff800000111a73:	72 73                	jb     ffff800000111ae8 <_rodata+0x108>
ffff800000111a75:	74 75                	je     ffff800000111aec <_rodata+0x10c>
ffff800000111a77:	76 77                	jbe    ffff800000111af0 <_rodata+0x110>
ffff800000111a79:	78 79                	js     ffff800000111af4 <_rodata+0x114>
ffff800000111a7b:	7a 00                	jp     ffff800000111a7d <_rodata+0x9d>
ffff800000111a7d:	00 00                	add    %al,(%rax)
ffff800000111a7f:	00 c3                	add    %al,%bl
ffff800000111a81:	4a 10 00             	rex.WX adc %al,(%rax)
ffff800000111a84:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a8a:	10 00                	adc    %al,(%rax)
ffff800000111a8c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111a92:	10 00                	adc    %al,(%rax)
ffff800000111a94:	00 80 ff ff c9 4a    	add    %al,0x4ac9ffff(%rax)
ffff800000111a9a:	10 00                	adc    %al,(%rax)
ffff800000111a9c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111aa2:	10 00                	adc    %al,(%rax)
ffff800000111aa4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111aaa:	10 00                	adc    %al,(%rax)
ffff800000111aac:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111ab2:	10 00                	adc    %al,(%rax)
ffff800000111ab4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111aba:	10 00                	adc    %al,(%rax)
ffff800000111abc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111ac2:	10 00                	adc    %al,(%rax)
ffff800000111ac4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111aca:	10 00                	adc    %al,(%rax)
ffff800000111acc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111ad2:	10 00                	adc    %al,(%rax)
ffff800000111ad4:	00 80 ff ff bd 4a    	add    %al,0x4abdffff(%rax)
ffff800000111ada:	10 00                	adc    %al,(%rax)
ffff800000111adc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111ae2:	10 00                	adc    %al,(%rax)
ffff800000111ae4:	00 80 ff ff b7 4a    	add    %al,0x4ab7ffff(%rax)
ffff800000111aea:	10 00                	adc    %al,(%rax)
ffff800000111aec:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111af2:	10 00                	adc    %al,(%rax)
ffff800000111af4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111afa:	10 00                	adc    %al,(%rax)
ffff800000111afc:	00 80 ff ff cf 4a    	add    %al,0x4acfffff(%rax)
ffff800000111b02:	10 00                	adc    %al,(%rax)
ffff800000111b04:	00 80 ff ff ae 52    	add    %al,0x52aeffff(%rax)
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
ffff800000111c9c:	00 80 ff ff e7 4f    	add    %al,0x4fe7ffff(%rax)
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
ffff800000111cf4:	00 80 ff ff b0 4c    	add    %al,0x4cb0ffff(%rax)
ffff800000111cfa:	10 00                	adc    %al,(%rax)
ffff800000111cfc:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111d02:	10 00                	adc    %al,(%rax)
ffff800000111d04:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d0a:	10 00                	adc    %al,(%rax)
ffff800000111d0c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d12:	10 00                	adc    %al,(%rax)
ffff800000111d14:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d1a:	10 00                	adc    %al,(%rax)
ffff800000111d1c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d22:	10 00                	adc    %al,(%rax)
ffff800000111d24:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111d2a:	10 00                	adc    %al,(%rax)
ffff800000111d2c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d32:	10 00                	adc    %al,(%rax)
ffff800000111d34:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d3a:	10 00                	adc    %al,(%rax)
ffff800000111d3c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d42:	10 00                	adc    %al,(%rax)
ffff800000111d44:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d4a:	10 00                	adc    %al,(%rax)
ffff800000111d4c:	00 80 ff ff eb 51    	add    %al,0x51ebffff(%rax)
ffff800000111d52:	10 00                	adc    %al,(%rax)
ffff800000111d54:	00 80 ff ff 54 4e    	add    %al,0x4e54ffff(%rax)
ffff800000111d5a:	10 00                	adc    %al,(%rax)
ffff800000111d5c:	00 80 ff ff 54 4f    	add    %al,0x4f54ffff(%rax)
ffff800000111d62:	10 00                	adc    %al,(%rax)
ffff800000111d64:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d6a:	10 00                	adc    %al,(%rax)
ffff800000111d6c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d72:	10 00                	adc    %al,(%rax)
ffff800000111d74:	00 80 ff ff 4a 4d    	add    %al,0x4d4affff(%rax)
ffff800000111d7a:	10 00                	adc    %al,(%rax)
ffff800000111d7c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d82:	10 00                	adc    %al,(%rax)
ffff800000111d84:	00 80 ff ff eb 50    	add    %al,0x50ebffff(%rax)
ffff800000111d8a:	10 00                	adc    %al,(%rax)
ffff800000111d8c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d92:	10 00                	adc    %al,(%rax)
ffff800000111d94:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111d9a:	10 00                	adc    %al,(%rax)
ffff800000111d9c:	00 80 ff ff e3 4f    	add    %al,0x4fe3ffff(%rax)
ffff800000111da2:	10 00                	adc    %al,(%rax)
ffff800000111da4:	00 80 ff ff 64 6f    	add    %al,0x6f64ffff(%rax)
ffff800000111daa:	5f                   	pop    %rdi
ffff800000111dab:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
ffff800000111db2:	65 
ffff800000111db3:	72 72                	jb     ffff800000111e27 <_rodata+0x447>
ffff800000111db5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111db6:	72 28                	jb     ffff800000111de0 <_rodata+0x400>
ffff800000111db8:	30 29                	xor    %ch,(%rcx)
ffff800000111dba:	2c 45                	sub    $0x45,%al
ffff800000111dbc:	52                   	push   %rdx
ffff800000111dbd:	52                   	push   %rdx
ffff800000111dbe:	4f 52                	rex.WRXB push %r10
ffff800000111dc0:	5f                   	pop    %rdi
ffff800000111dc1:	43                   	rex.XB
ffff800000111dc2:	4f                   	rex.WRXB
ffff800000111dc3:	44                   	rex.R
ffff800000111dc4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424dee <_ebss+0x382f68be>
ffff800000111dcb:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111dcc:	78 2c                	js     ffff800000111dfa <_rodata+0x41a>
ffff800000111dce:	52                   	push   %rdx
ffff800000111dcf:	53                   	push   %rbx
ffff800000111dd0:	50                   	push   %rax
ffff800000111dd1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424dfa <_ebss+0x382f68ca>
ffff800000111dd7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111dd8:	78 2c                	js     ffff800000111e06 <_rodata+0x426>
ffff800000111dda:	52                   	push   %rdx
ffff800000111ddb:	49 50                	rex.WB push %r8
ffff800000111ddd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e06 <_ebss+0x382f68d6>
ffff800000111de3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111de4:	78 0a                	js     ffff800000111df0 <_rodata+0x410>
ffff800000111de6:	00 00                	add    %al,(%rax)
ffff800000111de8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111dea:	5f                   	pop    %rdi
ffff800000111deb:	64 65 62             	fs gs (bad) 
ffff800000111dee:	75 67                	jne    ffff800000111e57 <_rodata+0x477>
ffff800000111df0:	28 31                	sub    %dh,(%rcx)
ffff800000111df2:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111df9:	5f                   	pop    %rdi
ffff800000111dfa:	43                   	rex.XB
ffff800000111dfb:	4f                   	rex.WRXB
ffff800000111dfc:	44                   	rex.R
ffff800000111dfd:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424e27 <_ebss+0x382f68f7>
ffff800000111e04:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e05:	78 2c                	js     ffff800000111e33 <_rodata+0x453>
ffff800000111e07:	52                   	push   %rdx
ffff800000111e08:	53                   	push   %rbx
ffff800000111e09:	50                   	push   %rax
ffff800000111e0a:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e33 <_ebss+0x382f6903>
ffff800000111e10:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e11:	78 2c                	js     ffff800000111e3f <_rodata+0x45f>
ffff800000111e13:	52                   	push   %rdx
ffff800000111e14:	49 50                	rex.WB push %r8
ffff800000111e16:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e3f <_ebss+0x382f690f>
ffff800000111e1c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e1d:	78 0a                	js     ffff800000111e29 <_rodata+0x449>
ffff800000111e1f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111e23:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111e24:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111e25:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
ffff800000111e2b:	52                   	push   %rdx
ffff800000111e2c:	52                   	push   %rdx
ffff800000111e2d:	4f 52                	rex.WRXB push %r10
ffff800000111e2f:	5f                   	pop    %rdi
ffff800000111e30:	43                   	rex.XB
ffff800000111e31:	4f                   	rex.WRXB
ffff800000111e32:	44                   	rex.R
ffff800000111e33:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424e5d <_ebss+0x382f692d>
ffff800000111e3a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e3b:	78 2c                	js     ffff800000111e69 <_rodata+0x489>
ffff800000111e3d:	52                   	push   %rdx
ffff800000111e3e:	53                   	push   %rbx
ffff800000111e3f:	50                   	push   %rax
ffff800000111e40:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e69 <_ebss+0x382f6939>
ffff800000111e46:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e47:	78 2c                	js     ffff800000111e75 <_rodata+0x495>
ffff800000111e49:	52                   	push   %rdx
ffff800000111e4a:	49 50                	rex.WB push %r8
ffff800000111e4c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424e75 <_ebss+0x382f6945>
ffff800000111e52:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e53:	78 0a                	js     ffff800000111e5f <_rodata+0x47f>
ffff800000111e55:	00 00                	add    %al,(%rax)
ffff800000111e57:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111e5b:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
ffff800000111e62:	2c 45                	sub    $0x45,%al
ffff800000111e64:	52                   	push   %rdx
ffff800000111e65:	52                   	push   %rdx
ffff800000111e66:	4f 52                	rex.WRXB push %r10
ffff800000111e68:	5f                   	pop    %rdi
ffff800000111e69:	43                   	rex.XB
ffff800000111e6a:	4f                   	rex.WRXB
ffff800000111e6b:	44                   	rex.R
ffff800000111e6c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424e96 <_ebss+0x382f6966>
ffff800000111e73:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e74:	78 2c                	js     ffff800000111ea2 <_rodata+0x4c2>
ffff800000111e76:	52                   	push   %rdx
ffff800000111e77:	53                   	push   %rbx
ffff800000111e78:	50                   	push   %rax
ffff800000111e79:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ea2 <_ebss+0x382f6972>
ffff800000111e7f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e80:	78 2c                	js     ffff800000111eae <_rodata+0x4ce>
ffff800000111e82:	52                   	push   %rdx
ffff800000111e83:	49 50                	rex.WB push %r8
ffff800000111e85:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424eae <_ebss+0x382f697e>
ffff800000111e8b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e8c:	78 0a                	js     ffff800000111e98 <_rodata+0x4b8>
ffff800000111e8e:	00 00                	add    %al,(%rax)
ffff800000111e90:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111e92:	5f                   	pop    %rdi
ffff800000111e93:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e94:	76 65                	jbe    ffff800000111efb <_rodata+0x51b>
ffff800000111e96:	72 66                	jb     ffff800000111efe <_rodata+0x51e>
ffff800000111e98:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111e99:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111e9a:	77 28                	ja     ffff800000111ec4 <_rodata+0x4e4>
ffff800000111e9c:	34 29                	xor    $0x29,%al
ffff800000111e9e:	2c 45                	sub    $0x45,%al
ffff800000111ea0:	52                   	push   %rdx
ffff800000111ea1:	52                   	push   %rdx
ffff800000111ea2:	4f 52                	rex.WRXB push %r10
ffff800000111ea4:	5f                   	pop    %rdi
ffff800000111ea5:	43                   	rex.XB
ffff800000111ea6:	4f                   	rex.WRXB
ffff800000111ea7:	44                   	rex.R
ffff800000111ea8:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424ed2 <_ebss+0x382f69a2>
ffff800000111eaf:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111eb0:	78 2c                	js     ffff800000111ede <_rodata+0x4fe>
ffff800000111eb2:	52                   	push   %rdx
ffff800000111eb3:	53                   	push   %rbx
ffff800000111eb4:	50                   	push   %rax
ffff800000111eb5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ede <_ebss+0x382f69ae>
ffff800000111ebb:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ebc:	78 2c                	js     ffff800000111eea <_rodata+0x50a>
ffff800000111ebe:	52                   	push   %rdx
ffff800000111ebf:	49 50                	rex.WB push %r8
ffff800000111ec1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424eea <_ebss+0x382f69ba>
ffff800000111ec7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ec8:	78 0a                	js     ffff800000111ed4 <_rodata+0x4f4>
ffff800000111eca:	00 00                	add    %al,(%rax)
ffff800000111ecc:	00 00                	add    %al,(%rax)
ffff800000111ece:	00 00                	add    %al,(%rax)
ffff800000111ed0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111ed2:	5f                   	pop    %rdi
ffff800000111ed3:	62                   	(bad)  
ffff800000111ed4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ed5:	75 6e                	jne    ffff800000111f45 <_rodata+0x565>
ffff800000111ed7:	64 73 28             	fs jae ffff800000111f02 <_rodata+0x522>
ffff800000111eda:	35 29 2c 45 52       	xor    $0x52452c29,%eax
ffff800000111edf:	52                   	push   %rdx
ffff800000111ee0:	4f 52                	rex.WRXB push %r10
ffff800000111ee2:	5f                   	pop    %rdi
ffff800000111ee3:	43                   	rex.XB
ffff800000111ee4:	4f                   	rex.WRXB
ffff800000111ee5:	44                   	rex.R
ffff800000111ee6:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f10 <_ebss+0x382f69e0>
ffff800000111eed:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111eee:	78 2c                	js     ffff800000111f1c <_rodata+0x53c>
ffff800000111ef0:	52                   	push   %rdx
ffff800000111ef1:	53                   	push   %rbx
ffff800000111ef2:	50                   	push   %rax
ffff800000111ef3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f1c <_ebss+0x382f69ec>
ffff800000111ef9:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111efa:	78 2c                	js     ffff800000111f28 <_rodata+0x548>
ffff800000111efc:	52                   	push   %rdx
ffff800000111efd:	49 50                	rex.WB push %r8
ffff800000111eff:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f28 <_ebss+0x382f69f8>
ffff800000111f05:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f06:	78 0a                	js     ffff800000111f12 <_rodata+0x532>
	...
ffff800000111f10:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111f12:	5f                   	pop    %rdi
ffff800000111f13:	75 6e                	jne    ffff800000111f83 <_rodata+0x5a3>
ffff800000111f15:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
ffff800000111f1c:	5f 
ffff800000111f1d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f1e:	70 63                	jo     ffff800000111f83 <_rodata+0x5a3>
ffff800000111f20:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f21:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
ffff800000111f25:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111f2c:	5f                   	pop    %rdi
ffff800000111f2d:	43                   	rex.XB
ffff800000111f2e:	4f                   	rex.WRXB
ffff800000111f2f:	44                   	rex.R
ffff800000111f30:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424f5a <_ebss+0x382f6a2a>
ffff800000111f37:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f38:	78 2c                	js     ffff800000111f66 <_rodata+0x586>
ffff800000111f3a:	52                   	push   %rdx
ffff800000111f3b:	53                   	push   %rbx
ffff800000111f3c:	50                   	push   %rax
ffff800000111f3d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f66 <_ebss+0x382f6a36>
ffff800000111f43:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f44:	78 2c                	js     ffff800000111f72 <_rodata+0x592>
ffff800000111f46:	52                   	push   %rdx
ffff800000111f47:	49 50                	rex.WB push %r8
ffff800000111f49:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424f72 <_ebss+0x382f6a42>
ffff800000111f4f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f50:	78 0a                	js     ffff800000111f5c <_rodata+0x57c>
ffff800000111f52:	00 00                	add    %al,(%rax)
ffff800000111f54:	00 00                	add    %al,(%rax)
ffff800000111f56:	00 00                	add    %al,(%rax)
ffff800000111f58:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111f5a:	5f                   	pop    %rdi
ffff800000111f5b:	64 65 76 5f          	fs gs jbe ffff800000111fbe <_rodata+0x5de>
ffff800000111f5f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111f60:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111f61:	74 5f                	je     ffff800000111fc2 <_rodata+0x5e2>
ffff800000111f63:	61                   	(bad)  
ffff800000111f64:	76 61                	jbe    ffff800000111fc7 <_rodata+0x5e7>
ffff800000111f66:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
ffff800000111f6d:	37 
ffff800000111f6e:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111f75:	5f                   	pop    %rdi
ffff800000111f76:	43                   	rex.XB
ffff800000111f77:	4f                   	rex.WRXB
ffff800000111f78:	44                   	rex.R
ffff800000111f79:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424fa3 <_ebss+0x382f6a73>
ffff800000111f80:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f81:	78 2c                	js     ffff800000111faf <_rodata+0x5cf>
ffff800000111f83:	52                   	push   %rdx
ffff800000111f84:	53                   	push   %rbx
ffff800000111f85:	50                   	push   %rax
ffff800000111f86:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424faf <_ebss+0x382f6a7f>
ffff800000111f8c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f8d:	78 2c                	js     ffff800000111fbb <_rodata+0x5db>
ffff800000111f8f:	52                   	push   %rdx
ffff800000111f90:	49 50                	rex.WB push %r8
ffff800000111f92:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424fbb <_ebss+0x382f6a8b>
ffff800000111f98:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111f99:	78 0a                	js     ffff800000111fa5 <_rodata+0x5c5>
ffff800000111f9b:	00 00                	add    %al,(%rax)
ffff800000111f9d:	00 00                	add    %al,(%rax)
ffff800000111f9f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111fa3:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111fa5:	75 62                	jne    ffff800000112009 <_rodata+0x629>
ffff800000111fa7:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fa8:	65 5f                	gs pop %rdi
ffff800000111faa:	66 61                	data16 (bad) 
ffff800000111fac:	75 6c                	jne    ffff80000011201a <_rodata+0x63a>
ffff800000111fae:	74 28                	je     ffff800000111fd8 <_rodata+0x5f8>
ffff800000111fb0:	38 29                	cmp    %ch,(%rcx)
ffff800000111fb2:	2c 45                	sub    $0x45,%al
ffff800000111fb4:	52                   	push   %rdx
ffff800000111fb5:	52                   	push   %rdx
ffff800000111fb6:	4f 52                	rex.WRXB push %r10
ffff800000111fb8:	5f                   	pop    %rdi
ffff800000111fb9:	43                   	rex.XB
ffff800000111fba:	4f                   	rex.WRXB
ffff800000111fbb:	44                   	rex.R
ffff800000111fbc:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424fe6 <_ebss+0x382f6ab6>
ffff800000111fc3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fc4:	78 2c                	js     ffff800000111ff2 <_rodata+0x612>
ffff800000111fc6:	52                   	push   %rdx
ffff800000111fc7:	53                   	push   %rbx
ffff800000111fc8:	50                   	push   %rax
ffff800000111fc9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ff2 <_ebss+0x382f6ac2>
ffff800000111fcf:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fd0:	78 2c                	js     ffff800000111ffe <_rodata+0x61e>
ffff800000111fd2:	52                   	push   %rdx
ffff800000111fd3:	49 50                	rex.WB push %r8
ffff800000111fd5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424ffe <_ebss+0x382f6ace>
ffff800000111fdb:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111fdc:	78 0a                	js     ffff800000111fe8 <_rodata+0x608>
ffff800000111fde:	00 00                	add    %al,(%rax)
ffff800000111fe0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111fe2:	5f                   	pop    %rdi
ffff800000111fe3:	63 6f 70             	movsxd 0x70(%rdi),%ebp
ffff800000111fe6:	72 6f                	jb     ffff800000112057 <_rodata+0x677>
ffff800000111fe8:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff800000111feb:	73 6f                	jae    ffff80000011205c <_rodata+0x67c>
ffff800000111fed:	72 5f                	jb     ffff80000011204e <_rodata+0x66e>
ffff800000111fef:	73 65                	jae    ffff800000112056 <_rodata+0x676>
ffff800000111ff1:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111ff3:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111ff5:	74 5f                	je     ffff800000112056 <_rodata+0x676>
ffff800000111ff7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ff8:	76 65                	jbe    ffff80000011205f <_rodata+0x67f>
ffff800000111ffa:	72 72                	jb     ffff80000011206e <_rodata+0x68e>
ffff800000111ffc:	75 6e                	jne    ffff80000011206c <_rodata+0x68c>
ffff800000111ffe:	28 39                	sub    %bh,(%rcx)
ffff800000112000:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112007:	5f                   	pop    %rdi
ffff800000112008:	43                   	rex.XB
ffff800000112009:	4f                   	rex.WRXB
ffff80000011200a:	44                   	rex.R
ffff80000011200b:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425035 <_ebss+0x382f6b05>
ffff800000112012:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112013:	78 2c                	js     ffff800000112041 <_rodata+0x661>
ffff800000112015:	52                   	push   %rdx
ffff800000112016:	53                   	push   %rbx
ffff800000112017:	50                   	push   %rax
ffff800000112018:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425041 <_ebss+0x382f6b11>
ffff80000011201e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011201f:	78 2c                	js     ffff80000011204d <_rodata+0x66d>
ffff800000112021:	52                   	push   %rdx
ffff800000112022:	49 50                	rex.WB push %r8
ffff800000112024:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842504d <_ebss+0x382f6b1d>
ffff80000011202a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011202b:	78 0a                	js     ffff800000112037 <_rodata+0x657>
ffff80000011202d:	00 00                	add    %al,(%rax)
ffff80000011202f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112033:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
ffff80000011203a:	5f                   	pop    %rdi
ffff80000011203b:	54                   	push   %rsp
ffff80000011203c:	53                   	push   %rbx
ffff80000011203d:	53                   	push   %rbx
ffff80000011203e:	28 31                	sub    %dh,(%rcx)
ffff800000112040:	30 29                	xor    %ch,(%rcx)
ffff800000112042:	2c 45                	sub    $0x45,%al
ffff800000112044:	52                   	push   %rdx
ffff800000112045:	52                   	push   %rdx
ffff800000112046:	4f 52                	rex.WRXB push %r10
ffff800000112048:	5f                   	pop    %rdi
ffff800000112049:	43                   	rex.XB
ffff80000011204a:	4f                   	rex.WRXB
ffff80000011204b:	44                   	rex.R
ffff80000011204c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425076 <_ebss+0x382f6b46>
ffff800000112053:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112054:	78 2c                	js     ffff800000112082 <_rodata+0x6a2>
ffff800000112056:	52                   	push   %rdx
ffff800000112057:	53                   	push   %rbx
ffff800000112058:	50                   	push   %rax
ffff800000112059:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425082 <_ebss+0x382f6b52>
ffff80000011205f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112060:	78 2c                	js     ffff80000011208e <_rodata+0x6ae>
ffff800000112062:	52                   	push   %rdx
ffff800000112063:	49 50                	rex.WB push %r8
ffff800000112065:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842508e <_ebss+0x382f6b5e>
ffff80000011206b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011206c:	78 0a                	js     ffff800000112078 <_rodata+0x698>
ffff80000011206e:	00 00                	add    %al,(%rax)
ffff800000112070:	54                   	push   %rsp
ffff800000112071:	68 65 20 65 78       	pushq  $0x78652065
ffff800000112076:	63 65 70             	movsxd 0x70(%rbp),%esp
ffff800000112079:	74 69                	je     ffff8000001120e4 <_rodata+0x704>
ffff80000011207b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011207c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011207d:	20 6f 63             	and    %ch,0x63(%rdi)
ffff800000112080:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000112083:	72 65                	jb     ffff8000001120ea <_rodata+0x70a>
ffff800000112085:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000011208a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff800000112091:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff800000112098:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000011209c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000011209f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001120a1:	74 20                	je     ffff8000001120c3 <_rodata+0x6e3>
ffff8000001120a3:	65 78 74             	gs js  ffff80000011211a <_rodata+0x73a>
ffff8000001120a6:	65 72 6e             	gs jb  ffff800000112117 <_rodata+0x737>
ffff8000001120a9:	61                   	(bad)  
ffff8000001120aa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001120ab:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001120af:	74 68                	je     ffff800000112119 <_rodata+0x739>
ffff8000001120b1:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff8000001120b5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001120b6:	67 72 61             	addr32 jb ffff80000011211a <_rodata+0x73a>
ffff8000001120b9:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001120ba:	2c 73                	sub    $0x73,%al
ffff8000001120bc:	75 63                	jne    ffff800000112121 <_rodata+0x741>
ffff8000001120be:	68 20 61 73 20       	pushq  $0x20736120
ffff8000001120c3:	61                   	(bad)  
ffff8000001120c4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001120c5:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff8000001120c8:	74 65                	je     ffff80000011212f <_rodata+0x74f>
ffff8000001120ca:	72 72                	jb     ffff80000011213e <_rodata+0x75e>
ffff8000001120cc:	75 70                	jne    ffff80000011213e <_rodata+0x75e>
ffff8000001120ce:	74 20                	je     ffff8000001120f0 <_rodata+0x710>
ffff8000001120d0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001120d1:	72 20                	jb     ffff8000001120f3 <_rodata+0x713>
ffff8000001120d3:	61                   	(bad)  
ffff8000001120d4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001120d5:	20 65 61             	and    %ah,0x61(%rbp)
ffff8000001120d8:	72 6c                	jb     ffff800000112146 <_rodata+0x766>
ffff8000001120da:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff8000001120e1:	65 70 74             	gs jo  ffff800000112158 <_rodata+0x778>
ffff8000001120e4:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff8000001120eb:	00 00                	add    %al,(%rax)
ffff8000001120ed:	00 00                	add    %al,(%rax)
ffff8000001120ef:	00 52 65             	add    %dl,0x65(%rdx)
ffff8000001120f2:	66 65 72 73          	data16 gs jb ffff800000112169 <_rodata+0x789>
ffff8000001120f6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001120fa:	61                   	(bad)  
ffff8000001120fb:	20 67 61             	and    %ah,0x61(%rdi)
ffff8000001120fe:	74 65                	je     ffff800000112165 <_rodata+0x785>
ffff800000112100:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000112104:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000112107:	70 74                	jo     ffff80000011217d <_rodata+0x79d>
ffff800000112109:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011210a:	72 20                	jb     ffff80000011212c <_rodata+0x74c>
ffff80000011210c:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000112113:	49                   	rex.WB
ffff800000112114:	44 54                	rex.R push %rsp
ffff800000112116:	3b 0a                	cmp    (%rdx),%ecx
	...
ffff800000112120:	52                   	push   %rdx
ffff800000112121:	65 66 65 72 73       	gs data16 gs jb ffff800000112199 <_rodata+0x7b9>
ffff800000112126:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011212a:	61                   	(bad)  
ffff80000011212b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011212f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000112132:	70 74                	jo     ffff8000001121a8 <_rodata+0x7c8>
ffff800000112134:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112135:	72 20                	jb     ffff800000112157 <_rodata+0x777>
ffff800000112137:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011213e:	47                   	rex.RXB
ffff80000011213f:	44 54                	rex.R push %rsp
ffff800000112141:	20 6f 72             	and    %ch,0x72(%rdi)
ffff800000112144:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff800000112148:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000011214b:	72 72                	jb     ffff8000001121bf <_rodata+0x7df>
ffff80000011214d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011214f:	74 20                	je     ffff800000112171 <_rodata+0x791>
ffff800000112151:	4c                   	rex.WR
ffff800000112152:	44 54                	rex.R push %rsp
ffff800000112154:	3b 0a                	cmp    (%rdx),%ecx
ffff800000112156:	00 00                	add    %al,(%rax)
ffff800000112158:	52                   	push   %rdx
ffff800000112159:	65 66 65 72 73       	gs data16 gs jb ffff8000001121d1 <_rodata+0x7f1>
ffff80000011215e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff800000112162:	61                   	(bad)  
ffff800000112163:	20 73 65             	and    %dh,0x65(%rbx)
ffff800000112166:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112168:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011216a:	74 20                	je     ffff80000011218c <_rodata+0x7ac>
ffff80000011216c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011216d:	72 20                	jb     ffff80000011218f <_rodata+0x7af>
ffff80000011216f:	67 61                	addr32 (bad) 
ffff800000112171:	74 65                	je     ffff8000001121d8 <_rodata+0x7f8>
ffff800000112173:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000112177:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff80000011217a:	70 74                	jo     ffff8000001121f0 <_rodata+0x810>
ffff80000011217c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011217d:	72 20                	jb     ffff80000011219f <_rodata+0x7bf>
ffff80000011217f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000112186:	4c                   	rex.WR
ffff800000112187:	44 54                	rex.R push %rsp
ffff800000112189:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011218b:	00 00                	add    %al,(%rax)
ffff80000011218d:	00 00                	add    %al,(%rax)
ffff80000011218f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000112192:	66 65 72 73          	data16 gs jb ffff800000112209 <_rodata+0x829>
ffff800000112196:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011219a:	61                   	(bad)  
ffff80000011219b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011219f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001121a2:	70 74                	jo     ffff800000112218 <_rodata+0x838>
ffff8000001121a4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001121a5:	72 20                	jb     ffff8000001121c7 <_rodata+0x7e7>
ffff8000001121a7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001121ae:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff8000001121b1:	72 65                	jb     ffff800000112218 <_rodata+0x838>
ffff8000001121b3:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001121b4:	74 20                	je     ffff8000001121d6 <_rodata+0x7f6>
ffff8000001121b6:	47                   	rex.RXB
ffff8000001121b7:	44 54                	rex.R push %rsp
ffff8000001121b9:	3b 0a                	cmp    (%rdx),%ecx
ffff8000001121bb:	00 00                	add    %al,(%rax)
ffff8000001121bd:	00 00                	add    %al,(%rax)
ffff8000001121bf:	00 53 65             	add    %dl,0x65(%rbx)
ffff8000001121c2:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001121c4:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001121c6:	74 20                	je     ffff8000001121e8 <_rodata+0x808>
ffff8000001121c8:	53                   	push   %rbx
ffff8000001121c9:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff8000001121cb:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
ffff8000001121d0:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff8000001121d3:	64 65 78 3a          	fs gs js ffff800000112211 <_rodata+0x831>
ffff8000001121d7:	25 23 30 31 30       	and    $0x30313023,%eax
ffff8000001121dc:	78 0a                	js     ffff8000001121e8 <_rodata+0x808>
ffff8000001121de:	00 00                	add    %al,(%rax)
ffff8000001121e0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001121e2:	5f                   	pop    %rdi
ffff8000001121e3:	73 65                	jae    ffff80000011224a <_rodata+0x86a>
ffff8000001121e5:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001121e7:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001121e9:	74 5f                	je     ffff80000011224a <_rodata+0x86a>
ffff8000001121eb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001121ec:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001121ed:	74 5f                	je     ffff80000011224e <_rodata+0x86e>
ffff8000001121ef:	70 72                	jo     ffff800000112263 <_rodata+0x883>
ffff8000001121f1:	65 73 65             	gs jae ffff800000112259 <_rodata+0x879>
ffff8000001121f4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001121f5:	74 28                	je     ffff80000011221f <_rodata+0x83f>
ffff8000001121f7:	31 31                	xor    %esi,(%rcx)
ffff8000001121f9:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112200:	5f                   	pop    %rdi
ffff800000112201:	43                   	rex.XB
ffff800000112202:	4f                   	rex.WRXB
ffff800000112203:	44                   	rex.R
ffff800000112204:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842522e <_ebss+0x382f6cfe>
ffff80000011220b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011220c:	78 2c                	js     ffff80000011223a <_rodata+0x85a>
ffff80000011220e:	52                   	push   %rdx
ffff80000011220f:	53                   	push   %rbx
ffff800000112210:	50                   	push   %rax
ffff800000112211:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842523a <_ebss+0x382f6d0a>
ffff800000112217:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112218:	78 2c                	js     ffff800000112246 <_rodata+0x866>
ffff80000011221a:	52                   	push   %rdx
ffff80000011221b:	49 50                	rex.WB push %r8
ffff80000011221d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425246 <_ebss+0x382f6d16>
ffff800000112223:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112224:	78 0a                	js     ffff800000112230 <_rodata+0x850>
ffff800000112226:	00 00                	add    %al,(%rax)
ffff800000112228:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011222a:	5f                   	pop    %rdi
ffff80000011222b:	73 74                	jae    ffff8000001122a1 <_rodata+0x8c1>
ffff80000011222d:	61                   	(bad)  
ffff80000011222e:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
ffff800000112231:	73 65                	jae    ffff800000112298 <_rodata+0x8b8>
ffff800000112233:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000112235:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112237:	74 5f                	je     ffff800000112298 <_rodata+0x8b8>
ffff800000112239:	66 61                	data16 (bad) 
ffff80000011223b:	75 6c                	jne    ffff8000001122a9 <_rodata+0x8c9>
ffff80000011223d:	74 28                	je     ffff800000112267 <_rodata+0x887>
ffff80000011223f:	31 32                	xor    %esi,(%rdx)
ffff800000112241:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112248:	5f                   	pop    %rdi
ffff800000112249:	43                   	rex.XB
ffff80000011224a:	4f                   	rex.WRXB
ffff80000011224b:	44                   	rex.R
ffff80000011224c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425276 <_ebss+0x382f6d46>
ffff800000112253:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112254:	78 2c                	js     ffff800000112282 <_rodata+0x8a2>
ffff800000112256:	52                   	push   %rdx
ffff800000112257:	53                   	push   %rbx
ffff800000112258:	50                   	push   %rax
ffff800000112259:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425282 <_ebss+0x382f6d52>
ffff80000011225f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112260:	78 2c                	js     ffff80000011228e <_rodata+0x8ae>
ffff800000112262:	52                   	push   %rdx
ffff800000112263:	49 50                	rex.WB push %r8
ffff800000112265:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842528e <_ebss+0x382f6d5e>
ffff80000011226b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011226c:	78 0a                	js     ffff800000112278 <_rodata+0x898>
ffff80000011226e:	00 00                	add    %al,(%rax)
ffff800000112270:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112272:	5f                   	pop    %rdi
ffff800000112273:	67 65 6e             	outsb  %gs:(%esi),(%dx)
ffff800000112276:	65 72 61             	gs jb  ffff8000001122da <_rodata+0x8fa>
ffff800000112279:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011227a:	5f                   	pop    %rdi
ffff80000011227b:	70 72                	jo     ffff8000001122ef <_rodata+0x90f>
ffff80000011227d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011227e:	74 65                	je     ffff8000001122e5 <_rodata+0x905>
ffff800000112280:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff800000112284:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112285:	28 31                	sub    %dh,(%rcx)
ffff800000112287:	33 29                	xor    (%rcx),%ebp
ffff800000112289:	2c 45                	sub    $0x45,%al
ffff80000011228b:	52                   	push   %rdx
ffff80000011228c:	52                   	push   %rdx
ffff80000011228d:	4f 52                	rex.WRXB push %r10
ffff80000011228f:	5f                   	pop    %rdi
ffff800000112290:	43                   	rex.XB
ffff800000112291:	4f                   	rex.WRXB
ffff800000112292:	44                   	rex.R
ffff800000112293:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384252bd <_ebss+0x382f6d8d>
ffff80000011229a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011229b:	78 2c                	js     ffff8000001122c9 <_rodata+0x8e9>
ffff80000011229d:	52                   	push   %rdx
ffff80000011229e:	53                   	push   %rbx
ffff80000011229f:	50                   	push   %rax
ffff8000001122a0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384252c9 <_ebss+0x382f6d99>
ffff8000001122a6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122a7:	78 2c                	js     ffff8000001122d5 <_rodata+0x8f5>
ffff8000001122a9:	52                   	push   %rdx
ffff8000001122aa:	49 50                	rex.WB push %r8
ffff8000001122ac:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384252d5 <_ebss+0x382f6da5>
ffff8000001122b2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122b3:	78 0a                	js     ffff8000001122bf <_rodata+0x8df>
ffff8000001122b5:	00 00                	add    %al,(%rax)
ffff8000001122b7:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001122bb:	70 61                	jo     ffff80000011231e <_rodata+0x93e>
ffff8000001122bd:	67 65 5f             	addr32 gs pop %rdi
ffff8000001122c0:	66 61                	data16 (bad) 
ffff8000001122c2:	75 6c                	jne    ffff800000112330 <_rodata+0x950>
ffff8000001122c4:	74 28                	je     ffff8000001122ee <_rodata+0x90e>
ffff8000001122c6:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
ffff8000001122c9:	2c 45                	sub    $0x45,%al
ffff8000001122cb:	52                   	push   %rdx
ffff8000001122cc:	52                   	push   %rdx
ffff8000001122cd:	4f 52                	rex.WRXB push %r10
ffff8000001122cf:	5f                   	pop    %rdi
ffff8000001122d0:	43                   	rex.XB
ffff8000001122d1:	4f                   	rex.WRXB
ffff8000001122d2:	44                   	rex.R
ffff8000001122d3:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384252fd <_ebss+0x382f6dcd>
ffff8000001122da:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122db:	78 2c                	js     ffff800000112309 <_rodata+0x929>
ffff8000001122dd:	52                   	push   %rdx
ffff8000001122de:	53                   	push   %rbx
ffff8000001122df:	50                   	push   %rax
ffff8000001122e0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425309 <_ebss+0x382f6dd9>
ffff8000001122e6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122e7:	78 2c                	js     ffff800000112315 <_rodata+0x935>
ffff8000001122e9:	52                   	push   %rdx
ffff8000001122ea:	49 50                	rex.WB push %r8
ffff8000001122ec:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425315 <_ebss+0x382f6de5>
ffff8000001122f2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001122f3:	78 0a                	js     ffff8000001122ff <_rodata+0x91f>
ffff8000001122f5:	00 50 61             	add    %dl,0x61(%rax)
ffff8000001122f8:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff8000001122fd:	74 2d                	je     ffff80000011232c <_rodata+0x94c>
ffff8000001122ff:	50                   	push   %rax
ffff800000112300:	72 65                	jb     ffff800000112367 <_rodata+0x987>
ffff800000112302:	73 65                	jae    ffff800000112369 <_rodata+0x989>
ffff800000112304:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112305:	74 2c                	je     ffff800000112333 <_rodata+0x953>
ffff800000112307:	09 00                	or     %eax,(%rax)
ffff800000112309:	57                   	push   %rdi
ffff80000011230a:	72 69                	jb     ffff800000112375 <_rodata+0x995>
ffff80000011230c:	74 65                	je     ffff800000112373 <_rodata+0x993>
ffff80000011230e:	20 43 61             	and    %al,0x61(%rbx)
ffff800000112311:	75 73                	jne    ffff800000112386 <_rodata+0x9a6>
ffff800000112313:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000112317:	75 6c                	jne    ffff800000112385 <_rodata+0x9a5>
ffff800000112319:	74 2c                	je     ffff800000112347 <_rodata+0x967>
ffff80000011231b:	09 00                	or     %eax,(%rax)
ffff80000011231d:	52                   	push   %rdx
ffff80000011231e:	65 61                	gs (bad) 
ffff800000112320:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff800000112324:	75 73                	jne    ffff800000112399 <_rodata+0x9b9>
ffff800000112326:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000011232a:	75 6c                	jne    ffff800000112398 <_rodata+0x9b8>
ffff80000011232c:	74 2c                	je     ffff80000011235a <_rodata+0x97a>
ffff80000011232e:	09 00                	or     %eax,(%rax)
ffff800000112330:	46 61                	rex.RX (bad) 
ffff800000112332:	75 6c                	jne    ffff8000001123a0 <_rodata+0x9c0>
ffff800000112334:	74 20                	je     ffff800000112356 <_rodata+0x976>
ffff800000112336:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000011233d:	28 33                	sub    %dh,(%rbx)
ffff80000011233f:	29 09                	sub    %ecx,(%rcx)
ffff800000112341:	00 46 61             	add    %al,0x61(%rsi)
ffff800000112344:	75 6c                	jne    ffff8000001123b2 <_rodata+0x9d2>
ffff800000112346:	74 20                	je     ffff800000112368 <_rodata+0x988>
ffff800000112348:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000011234f:	72 76                	jb     ffff8000001123c7 <_rodata+0x9e7>
ffff800000112351:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff800000112358:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000011235b:	29 09                	sub    %ecx,(%rcx)
ffff80000011235d:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
ffff800000112360:	65 73 65             	gs jae ffff8000001123c8 <_rodata+0x9e8>
ffff800000112363:	72 76                	jb     ffff8000001123db <_rodata+0x9fb>
ffff800000112365:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff80000011236a:	74 20                	je     ffff80000011238c <_rodata+0x9ac>
ffff80000011236c:	43 61                	rex.XB (bad) 
ffff80000011236e:	75 73                	jne    ffff8000001123e3 <_rodata+0xa03>
ffff800000112370:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000112374:	75 6c                	jne    ffff8000001123e2 <_rodata+0xa02>
ffff800000112376:	74 09                	je     ffff800000112381 <_rodata+0x9a1>
	...
ffff800000112380:	2c 49                	sub    $0x49,%al
ffff800000112382:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112383:	73 74                	jae    ffff8000001123f9 <_rodata+0xa19>
ffff800000112385:	72 75                	jb     ffff8000001123fc <_rodata+0xa1c>
ffff800000112387:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff80000011238b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011238c:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000011238f:	74 63                	je     ffff8000001123f4 <_rodata+0xa14>
ffff800000112391:	68 20 43 61 75       	pushq  $0x75614320
ffff800000112396:	73 65                	jae    ffff8000001123fd <_rodata+0xa1d>
ffff800000112398:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011239b:	75 6c                	jne    ffff800000112409 <_rodata+0xa29>
ffff80000011239d:	74 00                	je     ffff80000011239f <_rodata+0x9bf>
ffff80000011239f:	0a 00                	or     (%rax),%al
ffff8000001123a1:	43 52                	rex.XB push %r10
ffff8000001123a3:	32 3a                	xor    (%rdx),%bh
ffff8000001123a5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001123aa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123ab:	78 0a                	js     ffff8000001123b7 <_rodata+0x9d7>
ffff8000001123ad:	00 00                	add    %al,(%rax)
ffff8000001123af:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001123b3:	78 38                	js     ffff8000001123ed <_rodata+0xa0d>
ffff8000001123b5:	37                   	(bad)  
ffff8000001123b6:	5f                   	pop    %rdi
ffff8000001123b7:	46 50                	rex.RX push %rax
ffff8000001123b9:	55                   	push   %rbp
ffff8000001123ba:	5f                   	pop    %rdi
ffff8000001123bb:	65 72 72             	gs jb  ffff800000112430 <_rodata+0xa50>
ffff8000001123be:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001123bf:	72 28                	jb     ffff8000001123e9 <_rodata+0xa09>
ffff8000001123c1:	31 36                	xor    %esi,(%rsi)
ffff8000001123c3:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001123ca:	5f                   	pop    %rdi
ffff8000001123cb:	43                   	rex.XB
ffff8000001123cc:	4f                   	rex.WRXB
ffff8000001123cd:	44                   	rex.R
ffff8000001123ce:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384253f8 <_ebss+0x382f6ec8>
ffff8000001123d5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123d6:	78 2c                	js     ffff800000112404 <_rodata+0xa24>
ffff8000001123d8:	52                   	push   %rdx
ffff8000001123d9:	53                   	push   %rbx
ffff8000001123da:	50                   	push   %rax
ffff8000001123db:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425404 <_ebss+0x382f6ed4>
ffff8000001123e1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123e2:	78 2c                	js     ffff800000112410 <_rodata+0xa30>
ffff8000001123e4:	52                   	push   %rdx
ffff8000001123e5:	49 50                	rex.WB push %r8
ffff8000001123e7:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425410 <_ebss+0x382f6ee0>
ffff8000001123ed:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123ee:	78 0a                	js     ffff8000001123fa <_rodata+0xa1a>
	...
ffff8000001123f8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001123fa:	5f                   	pop    %rdi
ffff8000001123fb:	61                   	(bad)  
ffff8000001123fc:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001123fd:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff800000112404:	5f                   	pop    %rdi
ffff800000112405:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff800000112408:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff80000011240b:	31 37                	xor    %esi,(%rdi)
ffff80000011240d:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112414:	5f                   	pop    %rdi
ffff800000112415:	43                   	rex.XB
ffff800000112416:	4f                   	rex.WRXB
ffff800000112417:	44                   	rex.R
ffff800000112418:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425442 <_ebss+0x382f6f12>
ffff80000011241f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112420:	78 2c                	js     ffff80000011244e <_rodata+0xa6e>
ffff800000112422:	52                   	push   %rdx
ffff800000112423:	53                   	push   %rbx
ffff800000112424:	50                   	push   %rax
ffff800000112425:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842544e <_ebss+0x382f6f1e>
ffff80000011242b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011242c:	78 2c                	js     ffff80000011245a <_rodata+0xa7a>
ffff80000011242e:	52                   	push   %rdx
ffff80000011242f:	49 50                	rex.WB push %r8
ffff800000112431:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842545a <_ebss+0x382f6f2a>
ffff800000112437:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112438:	78 0a                	js     ffff800000112444 <_rodata+0xa64>
ffff80000011243a:	00 00                	add    %al,(%rax)
ffff80000011243c:	00 00                	add    %al,(%rax)
ffff80000011243e:	00 00                	add    %al,(%rax)
ffff800000112440:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112442:	5f                   	pop    %rdi
ffff800000112443:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112444:	61                   	(bad)  
ffff800000112445:	63 68 69             	movsxd 0x69(%rax),%ebp
ffff800000112448:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112449:	65 5f                	gs pop %rdi
ffff80000011244b:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff80000011244e:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff800000112451:	31 38                	xor    %edi,(%rax)
ffff800000112453:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011245a:	5f                   	pop    %rdi
ffff80000011245b:	43                   	rex.XB
ffff80000011245c:	4f                   	rex.WRXB
ffff80000011245d:	44                   	rex.R
ffff80000011245e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425488 <_ebss+0x382f6f58>
ffff800000112465:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112466:	78 2c                	js     ffff800000112494 <_rodata+0xab4>
ffff800000112468:	52                   	push   %rdx
ffff800000112469:	53                   	push   %rbx
ffff80000011246a:	50                   	push   %rax
ffff80000011246b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425494 <_ebss+0x382f6f64>
ffff800000112471:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112472:	78 2c                	js     ffff8000001124a0 <_rodata+0xac0>
ffff800000112474:	52                   	push   %rdx
ffff800000112475:	49 50                	rex.WB push %r8
ffff800000112477:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254a0 <_ebss+0x382f6f70>
ffff80000011247d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011247e:	78 0a                	js     ffff80000011248a <_rodata+0xaaa>
	...
ffff800000112488:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011248a:	5f                   	pop    %rdi
ffff80000011248b:	53                   	push   %rbx
ffff80000011248c:	49                   	rex.WB
ffff80000011248d:	4d                   	rex.WRB
ffff80000011248e:	44 5f                	rex.R pop %rdi
ffff800000112490:	65 78 63             	gs js  ffff8000001124f6 <_rodata+0xb16>
ffff800000112493:	65 70 74             	gs jo  ffff80000011250a <_rodata+0xb2a>
ffff800000112496:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
ffff80000011249d:	2c 45                	sub    $0x45,%al
ffff80000011249f:	52                   	push   %rdx
ffff8000001124a0:	52                   	push   %rdx
ffff8000001124a1:	4f 52                	rex.WRXB push %r10
ffff8000001124a3:	5f                   	pop    %rdi
ffff8000001124a4:	43                   	rex.XB
ffff8000001124a5:	4f                   	rex.WRXB
ffff8000001124a6:	44                   	rex.R
ffff8000001124a7:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384254d1 <_ebss+0x382f6fa1>
ffff8000001124ae:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124af:	78 2c                	js     ffff8000001124dd <_rodata+0xafd>
ffff8000001124b1:	52                   	push   %rdx
ffff8000001124b2:	53                   	push   %rbx
ffff8000001124b3:	50                   	push   %rax
ffff8000001124b4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254dd <_ebss+0x382f6fad>
ffff8000001124ba:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124bb:	78 2c                	js     ffff8000001124e9 <_rodata+0xb09>
ffff8000001124bd:	52                   	push   %rdx
ffff8000001124be:	49 50                	rex.WB push %r8
ffff8000001124c0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384254e9 <_ebss+0x382f6fb9>
ffff8000001124c6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124c7:	78 0a                	js     ffff8000001124d3 <_rodata+0xaf3>
ffff8000001124c9:	00 00                	add    %al,(%rax)
ffff8000001124cb:	00 00                	add    %al,(%rax)
ffff8000001124cd:	00 00                	add    %al,(%rax)
ffff8000001124cf:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001124d3:	76 69                	jbe    ffff80000011253e <_rodata+0xb5e>
ffff8000001124d5:	72 74                	jb     ffff80000011254b <_rodata+0xb6b>
ffff8000001124d7:	75 61                	jne    ffff80000011253a <_rodata+0xb5a>
ffff8000001124d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001124da:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff8000001124e1:	5f                   	pop    %rdi
ffff8000001124e2:	65 78 63             	gs js  ffff800000112548 <_rodata+0xb68>
ffff8000001124e5:	65 70 74             	gs jo  ffff80000011255c <_rodata+0xb7c>
ffff8000001124e8:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
ffff8000001124ef:	2c 45                	sub    $0x45,%al
ffff8000001124f1:	52                   	push   %rdx
ffff8000001124f2:	52                   	push   %rdx
ffff8000001124f3:	4f 52                	rex.WRXB push %r10
ffff8000001124f5:	5f                   	pop    %rdi
ffff8000001124f6:	43                   	rex.XB
ffff8000001124f7:	4f                   	rex.WRXB
ffff8000001124f8:	44                   	rex.R
ffff8000001124f9:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425523 <_ebss+0x382f6ff3>
ffff800000112500:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112501:	78 2c                	js     ffff80000011252f <_rodata+0xb4f>
ffff800000112503:	52                   	push   %rdx
ffff800000112504:	53                   	push   %rbx
ffff800000112505:	50                   	push   %rax
ffff800000112506:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842552f <_ebss+0x382f6fff>
ffff80000011250c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011250d:	78 2c                	js     ffff80000011253b <_rodata+0xb5b>
ffff80000011250f:	52                   	push   %rdx
ffff800000112510:	49 50                	rex.WB push %r8
ffff800000112512:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842553b <_ebss+0x382f700b>
ffff800000112518:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112519:	78 0a                	js     ffff800000112525 <_rodata+0xb45>
ffff80000011251b:	00 00                	add    %al,(%rax)
ffff80000011251d:	00 00                	add    %al,(%rax)
ffff80000011251f:	00 44 69 73          	add    %al,0x73(%rcx,%rbp,2)
ffff800000112523:	70 6c                	jo     ffff800000112591 <_rodata+0xbb1>
ffff800000112525:	61                   	(bad)  
ffff800000112526:	79 20                	jns    ffff800000112548 <_rodata+0xb68>
ffff800000112528:	50                   	push   %rax
ffff800000112529:	68 79 73 69 63       	pushq  $0x63697379
ffff80000011252e:	73 20                	jae    ffff800000112550 <_rodata+0xb70>
ffff800000112530:	41                   	rex.B
ffff800000112531:	64 64 72 65          	fs fs jb ffff80000011259a <_rodata+0xbba>
ffff800000112535:	73 73                	jae    ffff8000001125aa <_rodata+0xbca>
ffff800000112537:	20 4d 41             	and    %cl,0x41(%rbp)
ffff80000011253a:	50                   	push   %rax
ffff80000011253b:	2c 54                	sub    $0x54,%al
ffff80000011253d:	79 70                	jns    ffff8000001125af <_rodata+0xbcf>
ffff80000011253f:	65 28 31             	sub    %dh,%gs:(%rcx)
ffff800000112542:	3a 52 41             	cmp    0x41(%rdx),%dl
ffff800000112545:	4d 2c 32             	rex.WRB sub $0x32,%al
ffff800000112548:	3a 52 4f             	cmp    0x4f(%rdx),%dl
ffff80000011254b:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
ffff80000011254f:	20 52 65             	and    %dl,0x65(%rdx)
ffff800000112552:	73 65                	jae    ffff8000001125b9 <_rodata+0xbd9>
ffff800000112554:	72 76                	jb     ffff8000001125cc <_rodata+0xbec>
ffff800000112556:	65 64 2c 33          	gs fs sub $0x33,%al
ffff80000011255a:	3a 41 43             	cmp    0x43(%rcx),%al
ffff80000011255d:	50                   	push   %rax
ffff80000011255e:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
ffff800000112562:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
ffff800000112566:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112567:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011256a:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011256b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011256c:	72 79                	jb     ffff8000001125e7 <_rodata+0xc07>
ffff80000011256e:	2c 34                	sub    $0x34,%al
ffff800000112570:	3a 41 43             	cmp    0x43(%rcx),%al
ffff800000112573:	50                   	push   %rax
ffff800000112574:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
ffff800000112578:	53                   	push   %rbx
ffff800000112579:	20 4d 65             	and    %cl,0x65(%rbp)
ffff80000011257c:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011257d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011257e:	72 79                	jb     ffff8000001125f9 <_rodata+0xc19>
ffff800000112580:	2c 4f                	sub    $0x4f,%al
ffff800000112582:	74 68                	je     ffff8000001125ec <_rodata+0xc0c>
ffff800000112584:	65 72 73             	gs jb  ffff8000001125fa <_rodata+0xc1a>
ffff800000112587:	3a 55 6e             	cmp    0x6e(%rbp),%dl
ffff80000011258a:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
ffff800000112591:	0a 
ffff800000112592:	00 00                	add    %al,(%rax)
ffff800000112594:	00 00                	add    %al,(%rax)
ffff800000112596:	00 00                	add    %al,(%rax)
ffff800000112598:	4f 53                	rex.WRXB push %r11
ffff80000011259a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011259d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011259e:	20 55 73             	and    %dl,0x73(%rbp)
ffff8000001125a1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff8000001125a7:	61                   	(bad)  
ffff8000001125a8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125a9:	20 52 41             	and    %dl,0x41(%rdx)
ffff8000001125ac:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff8000384255d6 <_ebss+0x382f70a6>
ffff8000001125b3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125b4:	78 0a                	js     ffff8000001125c0 <_rodata+0xbe0>
ffff8000001125b6:	00 00                	add    %al,(%rax)
ffff8000001125b8:	4f 53                	rex.WRXB push %r11
ffff8000001125ba:	20 43 61             	and    %al,0x61(%rbx)
ffff8000001125bd:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001125be:	20 55 73             	and    %dl,0x73(%rbp)
ffff8000001125c1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff8000001125c7:	61                   	(bad)  
ffff8000001125c8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125c9:	20 32                	and    %dh,(%rdx)
ffff8000001125cb:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
ffff8000001125cf:	47                   	rex.RXB
ffff8000001125d0:	45 73 3a             	rex.RB jae ffff80000011260d <_rodata+0xc2d>
ffff8000001125d3:	25 23 30 31 30       	and    $0x30313023,%eax
ffff8000001125d8:	78 3d                	js     ffff800000112617 <_rodata+0xc37>
ffff8000001125da:	25 30 31 30 64       	and    $0x64303130,%eax
ffff8000001125df:	0a 00                	or     (%rax),%al
ffff8000001125e1:	00 00                	add    %al,(%rax)
ffff8000001125e3:	00 00                	add    %al,(%rax)
ffff8000001125e5:	00 00                	add    %al,(%rax)
ffff8000001125e7:	00 62 69             	add    %ah,0x69(%rdx)
ffff8000001125ea:	74 73                	je     ffff80000011265f <_rodata+0xc7f>
ffff8000001125ec:	5f                   	pop    %rdi
ffff8000001125ed:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001125ee:	61                   	(bad)  
ffff8000001125ef:	70 3a                	jo     ffff80000011262b <_rodata+0xc4b>
ffff8000001125f1:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001125f6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001125f7:	78 2c                	js     ffff800000112625 <_rodata+0xc45>
ffff8000001125f9:	62                   	(bad)  
ffff8000001125fa:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
ffff800000112601:	65 
ffff800000112602:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842562b <_ebss+0x382f70fb>
ffff800000112608:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112609:	78 2c                	js     ffff800000112637 <_rodata+0xc57>
ffff80000011260b:	62                   	(bad)  
ffff80000011260c:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
ffff800000112613:	67 
ffff800000112614:	74 68                	je     ffff80000011267e <_rodata+0xc9e>
ffff800000112616:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842563f <_ebss+0x382f710f>
ffff80000011261c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011261d:	78 0a                	js     ffff800000112629 <_rodata+0xc49>
ffff80000011261f:	00 70 61             	add    %dh,0x61(%rax)
ffff800000112622:	67 65 73 5f          	addr32 gs jae ffff800000112685 <_rodata+0xca5>
ffff800000112626:	73 74                	jae    ffff80000011269c <_rodata+0xcbc>
ffff800000112628:	72 75                	jb     ffff80000011269f <_rodata+0xcbf>
ffff80000011262a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011262e:	23 30                	and    (%rax),%esi
ffff800000112630:	31 38                	xor    %edi,(%rax)
ffff800000112632:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112633:	78 2c                	js     ffff800000112661 <_rodata+0xc81>
ffff800000112635:	70 61                	jo     ffff800000112698 <_rodata+0xcb8>
ffff800000112637:	67 65 73 5f          	addr32 gs jae ffff80000011269a <_rodata+0xcba>
ffff80000011263b:	73 69                	jae    ffff8000001126a6 <_rodata+0xcc6>
ffff80000011263d:	7a 65                	jp     ffff8000001126a4 <_rodata+0xcc4>
ffff80000011263f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425668 <_ebss+0x382f7138>
ffff800000112645:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112646:	78 2c                	js     ffff800000112674 <_rodata+0xc94>
ffff800000112648:	70 61                	jo     ffff8000001126ab <_rodata+0xccb>
ffff80000011264a:	67 65 73 5f          	addr32 gs jae ffff8000001126ad <_rodata+0xccd>
ffff80000011264e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011264f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112651:	67 74 68             	addr32 je ffff8000001126bc <_rodata+0xcdc>
ffff800000112654:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842567d <_ebss+0x382f714d>
ffff80000011265a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011265b:	78 0a                	js     ffff800000112667 <_rodata+0xc87>
ffff80000011265d:	00 00                	add    %al,(%rax)
ffff80000011265f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000112662:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112663:	65 73 5f             	gs jae ffff8000001126c5 <_rodata+0xce5>
ffff800000112666:	73 74                	jae    ffff8000001126dc <_rodata+0xcfc>
ffff800000112668:	72 75                	jb     ffff8000001126df <_rodata+0xcff>
ffff80000011266a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011266e:	23 30                	and    (%rax),%esi
ffff800000112670:	31 38                	xor    %edi,(%rax)
ffff800000112672:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112673:	78 2c                	js     ffff8000001126a1 <_rodata+0xcc1>
ffff800000112675:	7a 6f                	jp     ffff8000001126e6 <_rodata+0xd06>
ffff800000112677:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112678:	65 73 5f             	gs jae ffff8000001126da <_rodata+0xcfa>
ffff80000011267b:	73 69                	jae    ffff8000001126e6 <_rodata+0xd06>
ffff80000011267d:	7a 65                	jp     ffff8000001126e4 <_rodata+0xd04>
ffff80000011267f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256a8 <_ebss+0x382f7178>
ffff800000112685:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112686:	78 2c                	js     ffff8000001126b4 <_rodata+0xcd4>
ffff800000112688:	7a 6f                	jp     ffff8000001126f9 <_rodata+0xd19>
ffff80000011268a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011268b:	65 73 5f             	gs jae ffff8000001126ed <_rodata+0xd0d>
ffff80000011268e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011268f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112691:	67 74 68             	addr32 je ffff8000001126fc <_rodata+0xd1c>
ffff800000112694:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256bd <_ebss+0x382f718d>
ffff80000011269a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011269b:	78 0a                	js     ffff8000001126a7 <_rodata+0xcc7>
ffff80000011269d:	00 00                	add    %al,(%rax)
ffff80000011269f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff8000001126a2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001126a3:	65 5f                	gs pop %rdi
ffff8000001126a5:	73 74                	jae    ffff80000011271b <_rodata+0xd3b>
ffff8000001126a7:	61                   	(bad)  
ffff8000001126a8:	72 74                	jb     ffff80000011271e <_rodata+0xd3e>
ffff8000001126aa:	5f                   	pop    %rdi
ffff8000001126ab:	61                   	(bad)  
ffff8000001126ac:	64 64 72 65          	fs fs jb ffff800000112715 <_rodata+0xd35>
ffff8000001126b0:	73 73                	jae    ffff800000112725 <_rodata+0xd45>
ffff8000001126b2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256db <_ebss+0x382f71ab>
ffff8000001126b8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126b9:	78 2c                	js     ffff8000001126e7 <_rodata+0xd07>
ffff8000001126bb:	7a 6f                	jp     ffff80000011272c <_rodata+0xd4c>
ffff8000001126bd:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001126be:	65 5f                	gs pop %rdi
ffff8000001126c0:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001126c2:	64 5f                	fs pop %rdi
ffff8000001126c4:	61                   	(bad)  
ffff8000001126c5:	64 64 72 65          	fs fs jb ffff80000011272e <_rodata+0xd4e>
ffff8000001126c9:	73 73                	jae    ffff80000011273e <_rodata+0xd5e>
ffff8000001126cb:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384256f4 <_ebss+0x382f71c4>
ffff8000001126d1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126d2:	78 2c                	js     ffff800000112700 <_rodata+0xd20>
ffff8000001126d4:	7a 6f                	jp     ffff800000112745 <_rodata+0xd65>
ffff8000001126d6:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001126d7:	65 5f                	gs pop %rdi
ffff8000001126d9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126da:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001126dc:	67 74 68             	addr32 je ffff800000112747 <_rodata+0xd67>
ffff8000001126df:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425708 <_ebss+0x382f71d8>
ffff8000001126e5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126e6:	78 2c                	js     ffff800000112714 <_rodata+0xd34>
ffff8000001126e8:	70 61                	jo     ffff80000011274b <_rodata+0xd6b>
ffff8000001126ea:	67 65 73 5f          	addr32 gs jae ffff80000011274d <_rodata+0xd6d>
ffff8000001126ee:	67 72 6f             	addr32 jb ffff800000112760 <_rodata+0xd80>
ffff8000001126f1:	75 70                	jne    ffff800000112763 <_rodata+0xd83>
ffff8000001126f3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842571c <_ebss+0x382f71ec>
ffff8000001126f9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001126fa:	78 2c                	js     ffff800000112728 <_rodata+0xd48>
ffff8000001126fc:	70 61                	jo     ffff80000011275f <_rodata+0xd7f>
ffff8000001126fe:	67 65 73 5f          	addr32 gs jae ffff800000112761 <_rodata+0xd81>
ffff800000112702:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112703:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000112705:	67 74 68             	addr32 je ffff800000112770 <_rodata+0xd90>
ffff800000112708:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425731 <_ebss+0x382f7201>
ffff80000011270e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011270f:	78 0a                	js     ffff80000011271b <_rodata+0xd3b>
ffff800000112711:	00 00                	add    %al,(%rax)
ffff800000112713:	00 00                	add    %al,(%rax)
ffff800000112715:	00 00                	add    %al,(%rax)
ffff800000112717:	00 73 74             	add    %dh,0x74(%rbx)
ffff80000011271a:	61                   	(bad)  
ffff80000011271b:	72 74                	jb     ffff800000112791 <_rodata+0xdb1>
ffff80000011271d:	5f                   	pop    %rdi
ffff80000011271e:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112721:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842574b <_ebss+0x382f721b>
ffff800000112728:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112729:	78 2c                	js     ffff800000112757 <_rodata+0xd77>
ffff80000011272b:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011272d:	64 5f                	fs pop %rdi
ffff80000011272f:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112732:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842575c <_ebss+0x382f722c>
ffff800000112739:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011273a:	78 2c                	js     ffff800000112768 <_rodata+0xd88>
ffff80000011273c:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011273e:	64 5f                	fs pop %rdi
ffff800000112740:	64 61                	fs (bad) 
ffff800000112742:	74 61                	je     ffff8000001127a5 <_rodata+0xdc5>
ffff800000112744:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842576d <_ebss+0x382f723d>
ffff80000011274a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011274b:	78 2c                	js     ffff800000112779 <_rodata+0xd99>
ffff80000011274d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011274f:	64 5f                	fs pop %rdi
ffff800000112751:	62 72                	(bad)  
ffff800000112753:	6b 3a 25             	imul   $0x25,(%rdx),%edi
ffff800000112756:	23 30                	and    (%rax),%esi
ffff800000112758:	31 38                	xor    %edi,(%rax)
ffff80000011275a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011275b:	78 2c                	js     ffff800000112789 <_rodata+0xda9>
ffff80000011275d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011275f:	64 5f                	fs pop %rdi
ffff800000112761:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112762:	66 5f                	pop    %di
ffff800000112764:	73 74                	jae    ffff8000001127da <_rodata+0xdfa>
ffff800000112766:	72 75                	jb     ffff8000001127dd <_rodata+0xdfd>
ffff800000112768:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff80000011276c:	23 30                	and    (%rax),%esi
ffff80000011276e:	31 38                	xor    %edi,(%rax)
ffff800000112770:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112771:	78 0a                	js     ffff80000011277d <_rodata+0xd9d>
ffff800000112773:	00 47 6c             	add    %al,0x6c(%rdi)
ffff800000112776:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112777:	62 61 6c 5f 43       	(bad)
ffff80000011277c:	52                   	push   %rdx
ffff80000011277d:	33 09                	xor    (%rcx),%ecx
ffff80000011277f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257a8 <_ebss+0x382f7278>
ffff800000112785:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112786:	78 0a                	js     ffff800000112792 <_rodata+0xdb2>
ffff800000112788:	00 2a                	add    %ch,(%rdx)
ffff80000011278a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000011278c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011278d:	62 61 6c 5f 43       	(bad)
ffff800000112792:	52                   	push   %rdx
ffff800000112793:	33 09                	xor    (%rcx),%ecx
ffff800000112795:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257be <_ebss+0x382f728e>
ffff80000011279b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011279c:	78 0a                	js     ffff8000001127a8 <_rodata+0xdc8>
ffff80000011279e:	00 2a                	add    %ch,(%rdx)
ffff8000001127a0:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff8000001127a3:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001127a4:	62 61 6c 5f 43       	(bad)
ffff8000001127a9:	52                   	push   %rdx
ffff8000001127aa:	33 09                	xor    (%rcx),%ecx
ffff8000001127ac:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384257d5 <_ebss+0x382f72a5>
ffff8000001127b2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127b3:	78 0a                	js     ffff8000001127bf <_rodata+0xddf>
ffff8000001127b5:	00 00                	add    %al,(%rax)
ffff8000001127b7:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff8000001127ba:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127bb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001127bc:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff8000001127bf:	61                   	(bad)  
ffff8000001127c0:	67 65 73 20          	addr32 gs jae ffff8000001127e4 <_rodata+0xe04>
ffff8000001127c4:	65 72 72             	gs jb  ffff800000112839 <_rodata+0xe59>
ffff8000001127c7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001127c8:	72 20                	jb     ffff8000001127ea <_rodata+0xe0a>
ffff8000001127ca:	7a 6f                	jp     ffff80000011283b <_rodata+0xe5b>
ffff8000001127cc:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127cd:	65 5f                	gs pop %rdi
ffff8000001127cf:	73 65                	jae    ffff800000112836 <_rodata+0xe56>
ffff8000001127d1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127d2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
ffff8000001127d7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127d8:	64 65 78 0a          	fs gs js ffff8000001127e6 <_rodata+0xe06>
ffff8000001127dc:	00 00                	add    %al,(%rax)
ffff8000001127de:	00 00                	add    %al,(%rax)
ffff8000001127e0:	38 32                	cmp    %dh,(%rdx)
ffff8000001127e2:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff8000001127e7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001127e8:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
ffff8000001127ef:	5f 
ffff8000001127f0:	49 52                	rex.WB push %r10
ffff8000001127f2:	51                   	push   %rcx
ffff8000001127f3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842581c <_ebss+0x382f72ec>
ffff8000001127f9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001127fa:	78 09                	js     ffff800000112805 <_rodata+0xe25>
ffff8000001127fc:	00 6b 65             	add    %ch,0x65(%rbx)
ffff8000001127ff:	79 20                	jns    ffff800000112821 <_rodata+0xe41>
ffff800000112801:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000112804:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff80003842582e <_ebss+0x382f72fe>
ffff80000011280b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011280c:	78 09                	js     ffff800000112817 <_rodata+0xe37>
ffff80000011280e:	00 00                	add    %al,(%rax)
ffff800000112810:	72 65                	jb     ffff800000112877 <_rodata+0xe97>
ffff800000112812:	67 73 3a             	addr32 jae ffff80000011284f <_rodata+0xe6f>
ffff800000112815:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011281a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011281b:	78 09                	js     ffff800000112826 <_rodata+0xe46>
ffff80000011281d:	3c 52                	cmp    $0x52,%al
ffff80000011281f:	49 50                	rex.WB push %r8
ffff800000112821:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842584a <_ebss+0x382f731a>
ffff800000112827:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112828:	78 09                	js     ffff800000112833 <_rodata+0xe53>
ffff80000011282a:	52                   	push   %rdx
ffff80000011282b:	53                   	push   %rbx
ffff80000011282c:	50                   	push   %rax
ffff80000011282d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425856 <_ebss+0x382f7326>
ffff800000112833:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112834:	78 3e                	js     ffff800000112874 <_rodata+0xe94>
ffff800000112836:	0a 00                	or     (%rax),%al
ffff800000112838:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112839:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011283a:	5f                   	pop    %rdi
ffff80000011283b:	73 79                	jae    ffff8000001128b6 <_rodata+0xed6>
ffff80000011283d:	73 74                	jae    ffff8000001128b3 <_rodata+0xed3>
ffff80000011283f:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000112841:	5f                   	pop    %rdi
ffff800000112842:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000112845:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112846:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000112849:	20 63 61             	and    %ah,0x61(%rbx)
ffff80000011284c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011284d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011284e:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000112855:	25 23 30 34 78       	and    $0x78343023,%eax
ffff80000011285a:	0a 00                	or     (%rax),%al
ffff80000011285c:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011285e:	5f                   	pop    %rdi
ffff80000011285f:	65 78 65             	gs js  ffff8000001128c7 <_rodata+0xee7>
ffff800000112862:	63 76 65             	movsxd 0x65(%rsi),%esi
ffff800000112865:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff800000112869:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff80000011286c:	73 20                	jae    ffff80000011288e <_rodata+0xeae>
ffff80000011286e:	72 75                	jb     ffff8000001128e5 <_rodata+0xf05>
ffff800000112870:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112871:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112872:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
ffff800000112879:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011287a:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000112881:	20 
ffff800000112882:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000112889:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000112890:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384258b9 <_ebss+0x382f7389>
ffff800000112896:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112897:	78 0a                	js     ffff8000001128a3 <_rodata+0xec3>
ffff800000112899:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff80000011289d:	46                   	rex.RX
ffff80000011289e:	4f 52                	rex.WRXB push %r10
ffff8000001128a0:	4b 20 53 54          	rex.WXB and %dl,0x54(%r11)
ffff8000001128a4:	41 52                	push   %r10
ffff8000001128a6:	54                   	push   %rsp
ffff8000001128a7:	0a 00                	or     (%rax),%al
ffff8000001128a9:	61                   	(bad)  
ffff8000001128aa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128ab:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128ac:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001128ad:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff8000001128b0:	61                   	(bad)  
ffff8000001128b1:	67 65 73 2c          	addr32 gs jae ffff8000001128e1 <_rodata+0xf01>
ffff8000001128b5:	62                   	(bad)  
ffff8000001128b6:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
ffff8000001128bd:	23 
ffff8000001128be:	30 31                	xor    %dh,(%rcx)
ffff8000001128c0:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
ffff8000001128c4:	00 00                	add    %al,(%rax)
ffff8000001128c6:	00 00                	add    %al,(%rax)
ffff8000001128c8:	73 74                	jae    ffff80000011293e <_rodata+0xf5e>
ffff8000001128ca:	72 75                	jb     ffff800000112941 <_rodata+0xf61>
ffff8000001128cc:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
ffff8000001128d0:	61                   	(bad)  
ffff8000001128d1:	73 6b                	jae    ffff80000011293e <_rodata+0xf5e>
ffff8000001128d3:	5f                   	pop    %rdi
ffff8000001128d4:	73 74                	jae    ffff80000011294a <_rodata+0xf6a>
ffff8000001128d6:	72 75                	jb     ffff80000011294d <_rodata+0xf6d>
ffff8000001128d8:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
ffff8000001128dc:	64 64 72 65          	fs fs jb ffff800000112945 <_rodata+0xf65>
ffff8000001128e0:	73 73                	jae    ffff800000112955 <_rodata+0xf75>
ffff8000001128e2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842590b <_ebss+0x382f73db>
ffff8000001128e8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001128e9:	78 0a                	js     ffff8000001128f5 <_rodata+0xf15>
ffff8000001128eb:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff8000001128ef:	46                   	rex.RX
ffff8000001128f0:	4f 52                	rex.WRXB push %r10
ffff8000001128f2:	4b 20 46 49          	rex.WXB and %al,0x49(%r14)
ffff8000001128f6:	4e                   	rex.WRX
ffff8000001128f7:	49 53                	rex.WB push %r11
ffff8000001128f9:	48 0a 00             	rex.W or (%rax),%al
ffff8000001128fc:	00 00                	add    %al,(%rax)
ffff8000001128fe:	00 00                	add    %al,(%rax)
ffff800000112900:	65 78 69             	gs js  ffff80000011296c <_rodata+0xf8c>
ffff800000112903:	74 20                	je     ffff800000112925 <_rodata+0xf45>
ffff800000112905:	74 61                	je     ffff800000112968 <_rodata+0xf88>
ffff800000112907:	73 6b                	jae    ffff800000112974 <_rodata+0xf94>
ffff800000112909:	20 69 73             	and    %ch,0x73(%rcx)
ffff80000011290c:	20 72 75             	and    %dh,0x75(%rdx)
ffff80000011290f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112910:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112911:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000112918:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425941 <_ebss+0x382f7411>
ffff80000011291e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011291f:	78 0a                	js     ffff80000011292b <_rodata+0xf4b>
ffff800000112921:	00 5f 5f             	add    %bl,0x5f(%rdi)
ffff800000112924:	53                   	push   %rbx
ffff800000112925:	57                   	push   %rdi
ffff800000112926:	49 54                	rex.WB push %r12
ffff800000112928:	43                   	rex.XB
ffff800000112929:	48 5f                	rex.W pop %rdi
ffff80000011292b:	54                   	push   %rsp
ffff80000011292c:	4f 20 53 54          	rex.WRXB and %r10b,0x54(%r11)
ffff800000112930:	41 52                	push   %r10
ffff800000112932:	54                   	push   %rsp
ffff800000112933:	0a 00                	or     (%rax),%al
ffff800000112935:	70 72                	jo     ffff8000001129a9 <_erodata+0x6>
ffff800000112937:	65 76 2d             	gs jbe ffff800000112967 <_rodata+0xf87>
ffff80000011293a:	3e 74 68             	je,pt  ffff8000001129a5 <_erodata+0x2>
ffff80000011293d:	72 65                	jb     ffff8000001129a4 <_erodata+0x1>
ffff80000011293f:	61                   	(bad)  
ffff800000112940:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000112946:	30 3a                	xor    %bh,(%rdx)
ffff800000112948:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011294d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011294e:	78 0a                	js     ffff80000011295a <_rodata+0xf7a>
ffff800000112950:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000112953:	78 74                	js     ffff8000001129c9 <_erodata+0x26>
ffff800000112955:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff80000011295a:	65 61                	gs (bad) 
ffff80000011295c:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000112962:	30 3a                	xor    %bh,(%rdx)
ffff800000112964:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000112969:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011296a:	78 0a                	js     ffff800000112976 <_rodata+0xf96>
ffff80000011296c:	00 53 41             	add    %dl,0x41(%rbx)
ffff80000011296f:	56                   	push   %rsi
ffff800000112970:	45 20 50 52          	and    %r10b,0x52(%r8)
ffff800000112974:	45 56                	rex.RB push %r14
ffff800000112976:	20 46 53             	and    %al,0x53(%rsi)
ffff800000112979:	20 47 53             	and    %al,0x53(%rdi)
ffff80000011297c:	0a 00                	or     (%rax),%al
ffff80000011297e:	4c                   	rex.WR
ffff80000011297f:	4f                   	rex.WRXB
ffff800000112980:	41                   	rex.B
ffff800000112981:	44 20 4e 45          	and    %r9b,0x45(%rsi)
ffff800000112985:	58                   	pop    %rax
ffff800000112986:	54                   	push   %rsp
ffff800000112987:	20 46 53             	and    %al,0x53(%rsi)
ffff80000011298a:	20 47 53             	and    %al,0x53(%rdi)
ffff80000011298d:	0a 00                	or     (%rax),%al
ffff80000011298f:	5f                   	pop    %rdi
ffff800000112990:	5f                   	pop    %rdi
ffff800000112991:	53                   	push   %rbx
ffff800000112992:	57                   	push   %rdi
ffff800000112993:	49 54                	rex.WB push %r12
ffff800000112995:	43                   	rex.XB
ffff800000112996:	48 5f                	rex.W pop %rdi
ffff800000112998:	54                   	push   %rsp
ffff800000112999:	4f 20 46 49          	rex.WRXB and %r8b,0x49(%r14)
ffff80000011299d:	4e                   	rex.WRX
ffff80000011299e:	49 53                	rex.WB push %r11
ffff8000001129a0:	48 0a 00             	rex.W or (%rax),%al

Disassembly of section .eh_frame:

ffff8000001129a8 <.eh_frame>:
ffff8000001129a8:	14 00                	adc    $0x0,%al
ffff8000001129aa:	00 00                	add    %al,(%rax)
ffff8000001129ac:	00 00                	add    %al,(%rax)
ffff8000001129ae:	00 00                	add    %al,(%rax)
ffff8000001129b0:	01 7a 52             	add    %edi,0x52(%rdx)
ffff8000001129b3:	00 01                	add    %al,(%rcx)
ffff8000001129b5:	78 10                	js     ffff8000001129c7 <_erodata+0x24>
ffff8000001129b7:	01 1b                	add    %ebx,(%rbx)
ffff8000001129b9:	0c 07                	or     $0x7,%al
ffff8000001129bb:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff8000001129c1:	00 00                	add    %al,(%rax)
ffff8000001129c3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001129c6:	00 00                	add    %al,(%rax)
ffff8000001129c8:	ad                   	lods   %ds:(%rsi),%eax
ffff8000001129c9:	18 ff                	sbb    %bh,%bh
ffff8000001129cb:	ff c9                	dec    %ecx
ffff8000001129cd:	00 00                	add    %al,(%rax)
ffff8000001129cf:	00 00                	add    %al,(%rax)
ffff8000001129d1:	41 0e                	rex.B (bad) 
ffff8000001129d3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001129d9:	02 c4                	add    %ah,%al
ffff8000001129db:	0c 07                	or     $0x7,%al
ffff8000001129dd:	08 00                	or     %al,(%rax)
ffff8000001129df:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001129e2:	00 00                	add    %al,(%rax)
ffff8000001129e4:	3c 00                	cmp    $0x0,%al
ffff8000001129e6:	00 00                	add    %al,(%rax)
ffff8000001129e8:	56                   	push   %rsi
ffff8000001129e9:	19 ff                	sbb    %edi,%edi
ffff8000001129eb:	ff 49 00             	decl   0x0(%rcx)
ffff8000001129ee:	00 00                	add    %al,(%rax)
ffff8000001129f0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001129f3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001129f9:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff8000001129fd:	08 00                	or     %al,(%rax)
ffff8000001129ff:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112a02:	00 00                	add    %al,(%rax)
ffff800000112a04:	5c                   	pop    %rsp
ffff800000112a05:	00 00                	add    %al,(%rax)
ffff800000112a07:	00 7f 19             	add    %bh,0x19(%rdi)
ffff800000112a0a:	ff                   	(bad)  
ffff800000112a0b:	ff                   	(bad)  
ffff800000112a0c:	39 00                	cmp    %eax,(%rax)
ffff800000112a0e:	00 00                	add    %al,(%rax)
ffff800000112a10:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112a13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a19:	74 0c                	je     ffff800000112a27 <_erodata+0x84>
ffff800000112a1b:	07                   	(bad)  
ffff800000112a1c:	08 00                	or     %al,(%rax)
ffff800000112a1e:	00 00                	add    %al,(%rax)
ffff800000112a20:	1c 00                	sbb    $0x0,%al
ffff800000112a22:	00 00                	add    %al,(%rax)
ffff800000112a24:	7c 00                	jl     ffff800000112a26 <_erodata+0x83>
ffff800000112a26:	00 00                	add    %al,(%rax)
ffff800000112a28:	98                   	cwtl   
ffff800000112a29:	19 ff                	sbb    %edi,%edi
ffff800000112a2b:	ff                   	(bad)  
ffff800000112a2c:	7c 02                	jl     ffff800000112a30 <_erodata+0x8d>
ffff800000112a2e:	00 00                	add    %al,(%rax)
ffff800000112a30:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112a33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a39:	00 00                	add    %al,(%rax)
ffff800000112a3b:	00 00                	add    %al,(%rax)
ffff800000112a3d:	00 00                	add    %al,(%rax)
ffff800000112a3f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112a42:	00 00                	add    %al,(%rax)
ffff800000112a44:	9c                   	pushfq 
ffff800000112a45:	00 00                	add    %al,(%rax)
ffff800000112a47:	00 f4                	add    %dh,%ah
ffff800000112a49:	1b ff                	sbb    %edi,%edi
ffff800000112a4b:	ff 2f                	ljmp   *(%rdi)
ffff800000112a4d:	00 00                	add    %al,(%rax)
ffff800000112a4f:	00 00                	add    %al,(%rax)
ffff800000112a51:	41 0e                	rex.B (bad) 
ffff800000112a53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a59:	41 83 03 69          	addl   $0x69,(%r11)
ffff800000112a5d:	0c 07                	or     $0x7,%al
ffff800000112a5f:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff800000112a62:	00 00                	add    %al,(%rax)
ffff800000112a64:	bc 00 00 00 03       	mov    $0x3000000,%esp
ffff800000112a69:	1c ff                	sbb    $0xff,%al
ffff800000112a6b:	ff                   	(bad)  
ffff800000112a6c:	ef                   	out    %eax,(%dx)
ffff800000112a6d:	00 00                	add    %al,(%rax)
ffff800000112a6f:	00 00                	add    %al,(%rax)
ffff800000112a71:	41 0e                	rex.B (bad) 
ffff800000112a73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a79:	02 ea                	add    %dl,%ch
ffff800000112a7b:	0c 07                	or     $0x7,%al
ffff800000112a7d:	08 00                	or     %al,(%rax)
ffff800000112a7f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112a82:	00 00                	add    %al,(%rax)
ffff800000112a84:	dc 00                	faddl  (%rax)
ffff800000112a86:	00 00                	add    %al,(%rax)
ffff800000112a88:	d2 1c ff             	rcrb   %cl,(%rdi,%rdi,8)
ffff800000112a8b:	ff 60 00             	jmpq   *0x0(%rax)
ffff800000112a8e:	00 00                	add    %al,(%rax)
ffff800000112a90:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112a93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112a99:	02 5b 0c             	add    0xc(%rbx),%bl
ffff800000112a9c:	07                   	(bad)  
ffff800000112a9d:	08 00                	or     %al,(%rax)
ffff800000112a9f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112aa2:	00 00                	add    %al,(%rax)
ffff800000112aa4:	fc                   	cld    
ffff800000112aa5:	00 00                	add    %al,(%rax)
ffff800000112aa7:	00 12                	add    %dl,(%rdx)
ffff800000112aa9:	1d ff ff 76 02       	sbb    $0x276ffff,%eax
ffff800000112aae:	00 00                	add    %al,(%rax)
ffff800000112ab0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112ab3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ab9:	03 71 02             	add    0x2(%rcx),%esi
ffff800000112abc:	0c 07                	or     $0x7,%al
ffff800000112abe:	08 00                	or     %al,(%rax)
ffff800000112ac0:	1c 00                	sbb    $0x0,%al
ffff800000112ac2:	00 00                	add    %al,(%rax)
ffff800000112ac4:	1c 01                	sbb    $0x1,%al
ffff800000112ac6:	00 00                	add    %al,(%rax)
ffff800000112ac8:	68 1f ff ff f9       	pushq  $0xfffffffff9ffff1f
ffff800000112acd:	08 00                	or     %al,(%rax)
ffff800000112acf:	00 00                	add    %al,(%rax)
ffff800000112ad1:	41 0e                	rex.B (bad) 
ffff800000112ad3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ad9:	03 f4                	add    %esp,%esi
ffff800000112adb:	08 0c 07             	or     %cl,(%rdi,%rax,1)
ffff800000112ade:	08 00                	or     %al,(%rax)
ffff800000112ae0:	1c 00                	sbb    $0x0,%al
ffff800000112ae2:	00 00                	add    %al,(%rax)
ffff800000112ae4:	3c 01                	cmp    $0x1,%al
ffff800000112ae6:	00 00                	add    %al,(%rax)
ffff800000112ae8:	41 28 ff             	sub    %dil,%r15b
ffff800000112aeb:	ff 29                	ljmp   *(%rcx)
ffff800000112aed:	05 00 00 00 41       	add    $0x41000000,%eax
ffff800000112af2:	0e                   	(bad)  
ffff800000112af3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112af9:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
ffff800000112b00:	1c 00                	sbb    $0x0,%al
ffff800000112b02:	00 00                	add    %al,(%rax)
ffff800000112b04:	5c                   	pop    %rsp
ffff800000112b05:	01 00                	add    %eax,(%rax)
ffff800000112b07:	00 4a 2d             	add    %cl,0x2d(%rdx)
ffff800000112b0a:	ff                   	(bad)  
ffff800000112b0b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112b11:	41 0e                	rex.B (bad) 
ffff800000112b13:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b19:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112b1f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b22:	00 00                	add    %al,(%rax)
ffff800000112b24:	7c 01                	jl     ffff800000112b27 <_erodata+0x184>
ffff800000112b26:	00 00                	add    %al,(%rax)
ffff800000112b28:	b9 2d ff ff 8f       	mov    $0x8fffff2d,%ecx
ffff800000112b2d:	00 00                	add    %al,(%rax)
ffff800000112b2f:	00 00                	add    %al,(%rax)
ffff800000112b31:	41 0e                	rex.B (bad) 
ffff800000112b33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b39:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112b3f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b42:	00 00                	add    %al,(%rax)
ffff800000112b44:	9c                   	pushfq 
ffff800000112b45:	01 00                	add    %eax,(%rax)
ffff800000112b47:	00 28                	add    %ch,(%rax)
ffff800000112b49:	2e ff                	cs (bad) 
ffff800000112b4b:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000112b51:	41 0e                	rex.B (bad) 
ffff800000112b53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b59:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112b5f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112b62:	00 00                	add    %al,(%rax)
ffff800000112b64:	bc 01 00 00 97       	mov    $0x97000001,%esp
ffff800000112b69:	2e ff                	cs (bad) 
ffff800000112b6b:	ff c9                	dec    %ecx
ffff800000112b6d:	00 00                	add    %al,(%rax)
ffff800000112b6f:	00 00                	add    %al,(%rax)
ffff800000112b71:	41 0e                	rex.B (bad) 
ffff800000112b73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b79:	02 c4                	add    %ah,%al
ffff800000112b7b:	0c 07                	or     $0x7,%al
ffff800000112b7d:	08 00                	or     %al,(%rax)
ffff800000112b7f:	00 18                	add    %bl,(%rax)
ffff800000112b81:	00 00                	add    %al,(%rax)
ffff800000112b83:	00 dc                	add    %bl,%ah
ffff800000112b85:	01 00                	add    %eax,(%rax)
ffff800000112b87:	00 40 2f             	add    %al,0x2f(%rax)
ffff800000112b8a:	ff                   	(bad)  
ffff800000112b8b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112b8e:	00 00                	add    %al,(%rax)
ffff800000112b90:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112b93:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112b99:	00 00                	add    %al,(%rax)
ffff800000112b9b:	00 18                	add    %bl,(%rax)
ffff800000112b9d:	00 00                	add    %al,(%rax)
ffff800000112b9f:	00 f8                	add    %bh,%al
ffff800000112ba1:	01 00                	add    %eax,(%rax)
ffff800000112ba3:	00 7f 2f             	add    %bh,0x2f(%rdi)
ffff800000112ba6:	ff                   	(bad)  
ffff800000112ba7:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112baa:	00 00                	add    %al,(%rax)
ffff800000112bac:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112baf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bb5:	00 00                	add    %al,(%rax)
ffff800000112bb7:	00 18                	add    %bl,(%rax)
ffff800000112bb9:	00 00                	add    %al,(%rax)
ffff800000112bbb:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff800000112bbe:	00 00                	add    %al,(%rax)
ffff800000112bc0:	be 2f ff ff 5b       	mov    $0x5bffff2f,%esi
ffff800000112bc5:	00 00                	add    %al,(%rax)
ffff800000112bc7:	00 00                	add    %al,(%rax)
ffff800000112bc9:	41 0e                	rex.B (bad) 
ffff800000112bcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bd1:	00 00                	add    %al,(%rax)
ffff800000112bd3:	00 18                	add    %bl,(%rax)
ffff800000112bd5:	00 00                	add    %al,(%rax)
ffff800000112bd7:	00 30                	add    %dh,(%rax)
ffff800000112bd9:	02 00                	add    (%rax),%al
ffff800000112bdb:	00 fd                	add    %bh,%ch
ffff800000112bdd:	2f                   	(bad)  
ffff800000112bde:	ff                   	(bad)  
ffff800000112bdf:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112be2:	00 00                	add    %al,(%rax)
ffff800000112be4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112be7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112bed:	00 00                	add    %al,(%rax)
ffff800000112bef:	00 18                	add    %bl,(%rax)
ffff800000112bf1:	00 00                	add    %al,(%rax)
ffff800000112bf3:	00 4c 02 00          	add    %cl,0x0(%rdx,%rax,1)
ffff800000112bf7:	00 3c 30             	add    %bh,(%rax,%rsi,1)
ffff800000112bfa:	ff                   	(bad)  
ffff800000112bfb:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112bfe:	00 00                	add    %al,(%rax)
ffff800000112c00:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c09:	00 00                	add    %al,(%rax)
ffff800000112c0b:	00 18                	add    %bl,(%rax)
ffff800000112c0d:	00 00                	add    %al,(%rax)
ffff800000112c0f:	00 68 02             	add    %ch,0x2(%rax)
ffff800000112c12:	00 00                	add    %al,(%rax)
ffff800000112c14:	7b 30                	jnp    ffff800000112c46 <_erodata+0x2a3>
ffff800000112c16:	ff                   	(bad)  
ffff800000112c17:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c1a:	00 00                	add    %al,(%rax)
ffff800000112c1c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c1f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c25:	00 00                	add    %al,(%rax)
ffff800000112c27:	00 18                	add    %bl,(%rax)
ffff800000112c29:	00 00                	add    %al,(%rax)
ffff800000112c2b:	00 84 02 00 00 ba 30 	add    %al,0x30ba0000(%rdx,%rax,1)
ffff800000112c32:	ff                   	(bad)  
ffff800000112c33:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c36:	00 00                	add    %al,(%rax)
ffff800000112c38:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c3b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c41:	00 00                	add    %al,(%rax)
ffff800000112c43:	00 18                	add    %bl,(%rax)
ffff800000112c45:	00 00                	add    %al,(%rax)
ffff800000112c47:	00 a0 02 00 00 f9    	add    %ah,-0x6fffffe(%rax)
ffff800000112c4d:	30 ff                	xor    %bh,%bh
ffff800000112c4f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c52:	00 00                	add    %al,(%rax)
ffff800000112c54:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c57:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c5d:	00 00                	add    %al,(%rax)
ffff800000112c5f:	00 18                	add    %bl,(%rax)
ffff800000112c61:	00 00                	add    %al,(%rax)
ffff800000112c63:	00 bc 02 00 00 38 31 	add    %bh,0x31380000(%rdx,%rax,1)
ffff800000112c6a:	ff                   	(bad)  
ffff800000112c6b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c6e:	00 00                	add    %al,(%rax)
ffff800000112c70:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c73:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c79:	00 00                	add    %al,(%rax)
ffff800000112c7b:	00 18                	add    %bl,(%rax)
ffff800000112c7d:	00 00                	add    %al,(%rax)
ffff800000112c7f:	00 d8                	add    %bl,%al
ffff800000112c81:	02 00                	add    (%rax),%al
ffff800000112c83:	00 77 31             	add    %dh,0x31(%rdi)
ffff800000112c86:	ff                   	(bad)  
ffff800000112c87:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112c8a:	00 00                	add    %al,(%rax)
ffff800000112c8c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112c8f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112c95:	00 00                	add    %al,(%rax)
ffff800000112c97:	00 18                	add    %bl,(%rax)
ffff800000112c99:	00 00                	add    %al,(%rax)
ffff800000112c9b:	00 f4                	add    %dh,%ah
ffff800000112c9d:	02 00                	add    (%rax),%al
ffff800000112c9f:	00 b6 31 ff ff 7a    	add    %dh,0x7affff31(%rsi)
ffff800000112ca5:	01 00                	add    %eax,(%rax)
ffff800000112ca7:	00 00                	add    %al,(%rax)
ffff800000112ca9:	41 0e                	rex.B (bad) 
ffff800000112cab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112cb1:	00 00                	add    %al,(%rax)
ffff800000112cb3:	00 18                	add    %bl,(%rax)
ffff800000112cb5:	00 00                	add    %al,(%rax)
ffff800000112cb7:	00 10                	add    %dl,(%rax)
ffff800000112cb9:	03 00                	add    (%rax),%eax
ffff800000112cbb:	00 14 33             	add    %dl,(%rbx,%rsi,1)
ffff800000112cbe:	ff                   	(bad)  
ffff800000112cbf:	ff                   	(bad)  
ffff800000112cc0:	7a 01                	jp     ffff800000112cc3 <_erodata+0x320>
ffff800000112cc2:	00 00                	add    %al,(%rax)
ffff800000112cc4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cc7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ccd:	00 00                	add    %al,(%rax)
ffff800000112ccf:	00 18                	add    %bl,(%rax)
ffff800000112cd1:	00 00                	add    %al,(%rax)
ffff800000112cd3:	00 2c 03             	add    %ch,(%rbx,%rax,1)
ffff800000112cd6:	00 00                	add    %al,(%rax)
ffff800000112cd8:	72 34                	jb     ffff800000112d0e <_erodata+0x36b>
ffff800000112cda:	ff                   	(bad)  
ffff800000112cdb:	ff                   	(bad)  
ffff800000112cdc:	7a 01                	jp     ffff800000112cdf <_erodata+0x33c>
ffff800000112cde:	00 00                	add    %al,(%rax)
ffff800000112ce0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112ce3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ce9:	00 00                	add    %al,(%rax)
ffff800000112ceb:	00 18                	add    %bl,(%rax)
ffff800000112ced:	00 00                	add    %al,(%rax)
ffff800000112cef:	00 48 03             	add    %cl,0x3(%rax)
ffff800000112cf2:	00 00                	add    %al,(%rax)
ffff800000112cf4:	d0 35 ff ff 7a 01    	shlb   0x17affff(%rip)        # ffff8000018c2cf9 <_ebss+0x17947c9>
ffff800000112cfa:	00 00                	add    %al,(%rax)
ffff800000112cfc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112cff:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d05:	00 00                	add    %al,(%rax)
ffff800000112d07:	00 18                	add    %bl,(%rax)
ffff800000112d09:	00 00                	add    %al,(%rax)
ffff800000112d0b:	00 64 03 00          	add    %ah,0x0(%rbx,%rax,1)
ffff800000112d0f:	00 2e                	add    %ch,(%rsi)
ffff800000112d11:	37                   	(bad)  
ffff800000112d12:	ff                   	(bad)  
ffff800000112d13:	ff                   	(bad)  
ffff800000112d14:	ff 01                	incl   (%rcx)
ffff800000112d16:	00 00                	add    %al,(%rax)
ffff800000112d18:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d1b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d21:	00 00                	add    %al,(%rax)
ffff800000112d23:	00 18                	add    %bl,(%rax)
ffff800000112d25:	00 00                	add    %al,(%rax)
ffff800000112d27:	00 80 03 00 00 11    	add    %al,0x11000003(%rax)
ffff800000112d2d:	39 ff                	cmp    %edi,%edi
ffff800000112d2f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d32:	00 00                	add    %al,(%rax)
ffff800000112d34:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d37:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d3d:	00 00                	add    %al,(%rax)
ffff800000112d3f:	00 18                	add    %bl,(%rax)
ffff800000112d41:	00 00                	add    %al,(%rax)
ffff800000112d43:	00 9c 03 00 00 50 39 	add    %bl,0x39500000(%rbx,%rax,1)
ffff800000112d4a:	ff                   	(bad)  
ffff800000112d4b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d4e:	00 00                	add    %al,(%rax)
ffff800000112d50:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d53:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d59:	00 00                	add    %al,(%rax)
ffff800000112d5b:	00 18                	add    %bl,(%rax)
ffff800000112d5d:	00 00                	add    %al,(%rax)
ffff800000112d5f:	00 b8 03 00 00 8f    	add    %bh,-0x70fffffd(%rax)
ffff800000112d65:	39 ff                	cmp    %edi,%edi
ffff800000112d67:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d6a:	00 00                	add    %al,(%rax)
ffff800000112d6c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d6f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d75:	00 00                	add    %al,(%rax)
ffff800000112d77:	00 18                	add    %bl,(%rax)
ffff800000112d79:	00 00                	add    %al,(%rax)
ffff800000112d7b:	00 d4                	add    %dl,%ah
ffff800000112d7d:	03 00                	add    (%rax),%eax
ffff800000112d7f:	00 ce                	add    %cl,%dh
ffff800000112d81:	39 ff                	cmp    %edi,%edi
ffff800000112d83:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000112d86:	00 00                	add    %al,(%rax)
ffff800000112d88:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112d8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112d91:	00 00                	add    %al,(%rax)
ffff800000112d93:	00 18                	add    %bl,(%rax)
ffff800000112d95:	00 00                	add    %al,(%rax)
ffff800000112d97:	00 f0                	add    %dh,%al
ffff800000112d99:	03 00                	add    (%rax),%eax
ffff800000112d9b:	00 0d 3a ff ff 5b    	add    %cl,0x5bffff3a(%rip)        # ffff80005c112cdb <_ebss+0x5bfe47ab>
ffff800000112da1:	00 00                	add    %al,(%rax)
ffff800000112da3:	00 00                	add    %al,(%rax)
ffff800000112da5:	41 0e                	rex.B (bad) 
ffff800000112da7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112dad:	00 00                	add    %al,(%rax)
ffff800000112daf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112db2:	00 00                	add    %al,(%rax)
ffff800000112db4:	0c 04                	or     $0x4,%al
ffff800000112db6:	00 00                	add    %al,(%rax)
ffff800000112db8:	4c 3a ff             	rex.WR cmp %dil,%r15b
ffff800000112dbb:	ff 87 02 00 00 00    	incl   0x2(%rdi)
ffff800000112dc1:	41 0e                	rex.B (bad) 
ffff800000112dc3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112dc9:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
ffff800000112dcf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112dd2:	00 00                	add    %al,(%rax)
ffff800000112dd4:	2c 04                	sub    $0x4,%al
ffff800000112dd6:	00 00                	add    %al,(%rax)
ffff800000112dd8:	b3 3c                	mov    $0x3c,%bl
ffff800000112dda:	ff                   	(bad)  
ffff800000112ddb:	ff 76 00             	pushq  0x0(%rsi)
ffff800000112dde:	00 00                	add    %al,(%rax)
ffff800000112de0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112de3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112de9:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112dec:	07                   	(bad)  
ffff800000112ded:	08 00                	or     %al,(%rax)
ffff800000112def:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112df2:	00 00                	add    %al,(%rax)
ffff800000112df4:	4c 04 00             	rex.WR add $0x0,%al
ffff800000112df7:	00 09                	add    %cl,(%rcx)
ffff800000112df9:	3d ff ff 11 00       	cmp    $0x11ffff,%eax
ffff800000112dfe:	00 00                	add    %al,(%rax)
ffff800000112e00:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112e03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e09:	4c 0c 07             	rex.WR or $0x7,%al
ffff800000112e0c:	08 00                	or     %al,(%rax)
ffff800000112e0e:	00 00                	add    %al,(%rax)
ffff800000112e10:	1c 00                	sbb    $0x0,%al
ffff800000112e12:	00 00                	add    %al,(%rax)
ffff800000112e14:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112e15:	04 00                	add    $0x0,%al
ffff800000112e17:	00 fa                	add    %bh,%dl
ffff800000112e19:	3c ff                	cmp    $0xff,%al
ffff800000112e1b:	ff                   	(bad)  
ffff800000112e1c:	ec                   	in     (%dx),%al
ffff800000112e1d:	01 00                	add    %eax,(%rax)
ffff800000112e1f:	00 00                	add    %al,(%rax)
ffff800000112e21:	41 0e                	rex.B (bad) 
ffff800000112e23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e29:	03 e7                	add    %edi,%esp
ffff800000112e2b:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000112e2e:	08 00                	or     %al,(%rax)
ffff800000112e30:	1c 00                	sbb    $0x0,%al
ffff800000112e32:	00 00                	add    %al,(%rax)
ffff800000112e34:	8c 04 00             	mov    %es,(%rax,%rax,1)
ffff800000112e37:	00 c6                	add    %al,%dh
ffff800000112e39:	3e ff                	ds (bad) 
ffff800000112e3b:	ff 82 01 00 00 00    	incl   0x1(%rdx)
ffff800000112e41:	41 0e                	rex.B (bad) 
ffff800000112e43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e49:	03 7d 01             	add    0x1(%rbp),%edi
ffff800000112e4c:	0c 07                	or     $0x7,%al
ffff800000112e4e:	08 00                	or     %al,(%rax)
ffff800000112e50:	1c 00                	sbb    $0x0,%al
ffff800000112e52:	00 00                	add    %al,(%rax)
ffff800000112e54:	ac                   	lods   %ds:(%rsi),%al
ffff800000112e55:	04 00                	add    $0x0,%al
ffff800000112e57:	00 28                	add    %ch,(%rax)
ffff800000112e59:	40 ff                	rex (bad) 
ffff800000112e5b:	ff 9e 0d 00 00 00    	lcall  *0xd(%rsi)
ffff800000112e61:	41 0e                	rex.B (bad) 
ffff800000112e63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e69:	03 99 0d 0c 07 08    	add    0x8070c0d(%rcx),%ebx
ffff800000112e6f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112e72:	00 00                	add    %al,(%rax)
ffff800000112e74:	cc                   	int3   
ffff800000112e75:	04 00                	add    $0x0,%al
ffff800000112e77:	00 a6 4d ff ff 32    	add    %ah,0x32ffff4d(%rsi)
ffff800000112e7d:	03 00                	add    (%rax),%eax
ffff800000112e7f:	00 00                	add    %al,(%rax)
ffff800000112e81:	41 0e                	rex.B (bad) 
ffff800000112e83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112e89:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # ffff800008183a92 <_ebss+0x8055562>
ffff800000112e8f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112e92:	00 00                	add    %al,(%rax)
ffff800000112e94:	ec                   	in     (%dx),%al
ffff800000112e95:	04 00                	add    $0x0,%al
ffff800000112e97:	00 b8 50 ff ff 21    	add    %bh,0x21ffff50(%rax)
ffff800000112e9d:	00 00                	add    %al,(%rax)
ffff800000112e9f:	00 00                	add    %al,(%rax)
ffff800000112ea1:	41 0e                	rex.B (bad) 
ffff800000112ea3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ea9:	5c                   	pop    %rsp
ffff800000112eaa:	0c 07                	or     $0x7,%al
ffff800000112eac:	08 00                	or     %al,(%rax)
ffff800000112eae:	00 00                	add    %al,(%rax)
ffff800000112eb0:	1c 00                	sbb    $0x0,%al
ffff800000112eb2:	00 00                	add    %al,(%rax)
ffff800000112eb4:	0c 05                	or     $0x5,%al
ffff800000112eb6:	00 00                	add    %al,(%rax)
ffff800000112eb8:	b9 50 ff ff 20       	mov    $0x20ffff50,%ecx
ffff800000112ebd:	00 00                	add    %al,(%rax)
ffff800000112ebf:	00 00                	add    %al,(%rax)
ffff800000112ec1:	41 0e                	rex.B (bad) 
ffff800000112ec3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ec9:	5b                   	pop    %rbx
ffff800000112eca:	0c 07                	or     $0x7,%al
ffff800000112ecc:	08 00                	or     %al,(%rax)
ffff800000112ece:	00 00                	add    %al,(%rax)
ffff800000112ed0:	1c 00                	sbb    $0x0,%al
ffff800000112ed2:	00 00                	add    %al,(%rax)
ffff800000112ed4:	2c 05                	sub    $0x5,%al
ffff800000112ed6:	00 00                	add    %al,(%rax)
ffff800000112ed8:	b9 50 ff ff 8f       	mov    $0x8fffff50,%ecx
ffff800000112edd:	00 00                	add    %al,(%rax)
ffff800000112edf:	00 00                	add    %al,(%rax)
ffff800000112ee1:	41 0e                	rex.B (bad) 
ffff800000112ee3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112ee9:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112eef:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112ef2:	00 00                	add    %al,(%rax)
ffff800000112ef4:	4c 05 00 00 28 51    	rex.WR add $0x51280000,%rax
ffff800000112efa:	ff                   	(bad)  
ffff800000112efb:	ff c9                	dec    %ecx
ffff800000112efd:	00 00                	add    %al,(%rax)
ffff800000112eff:	00 00                	add    %al,(%rax)
ffff800000112f01:	41 0e                	rex.B (bad) 
ffff800000112f03:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f09:	02 c4                	add    %ah,%al
ffff800000112f0b:	0c 07                	or     $0x7,%al
ffff800000112f0d:	08 00                	or     %al,(%rax)
ffff800000112f0f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f12:	00 00                	add    %al,(%rax)
ffff800000112f14:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f15:	05 00 00 c1 58       	add    $0x58c10000,%eax
ffff800000112f1a:	ff                   	(bad)  
ffff800000112f1b:	ff 4c 01 00          	decl   0x0(%rcx,%rax,1)
ffff800000112f1f:	00 00                	add    %al,(%rax)
ffff800000112f21:	41 0e                	rex.B (bad) 
ffff800000112f23:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f29:	03 47 01             	add    0x1(%rdi),%eax
ffff800000112f2c:	0c 07                	or     $0x7,%al
ffff800000112f2e:	08 00                	or     %al,(%rax)
ffff800000112f30:	1c 00                	sbb    $0x0,%al
ffff800000112f32:	00 00                	add    %al,(%rax)
ffff800000112f34:	8c 05 00 00 ed 59    	mov    %es,0x59ed0000(%rip)        # ffff800059fe2f3a <_ebss+0x59eb4a0a>
ffff800000112f3a:	ff                   	(bad)  
ffff800000112f3b:	ff                   	(bad)  
ffff800000112f3c:	df 00                	filds  (%rax)
ffff800000112f3e:	00 00                	add    %al,(%rax)
ffff800000112f40:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112f43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f49:	02 da                	add    %dl,%bl
ffff800000112f4b:	0c 07                	or     $0x7,%al
ffff800000112f4d:	08 00                	or     %al,(%rax)
ffff800000112f4f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112f52:	00 00                	add    %al,(%rax)
ffff800000112f54:	ac                   	lods   %ds:(%rsi),%al
ffff800000112f55:	05 00 00 ac 5a       	add    $0x5aac0000,%eax
ffff800000112f5a:	ff                   	(bad)  
ffff800000112f5b:	ff 22                	jmpq   *(%rdx)
ffff800000112f5d:	00 00                	add    %al,(%rax)
ffff800000112f5f:	00 00                	add    %al,(%rax)
ffff800000112f61:	41 0e                	rex.B (bad) 
ffff800000112f63:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f69:	5d                   	pop    %rbp
ffff800000112f6a:	0c 07                	or     $0x7,%al
ffff800000112f6c:	08 00                	or     %al,(%rax)
ffff800000112f6e:	00 00                	add    %al,(%rax)
ffff800000112f70:	1c 00                	sbb    $0x0,%al
ffff800000112f72:	00 00                	add    %al,(%rax)
ffff800000112f74:	cc                   	int3   
ffff800000112f75:	05 00 00 ae 5a       	add    $0x5aae0000,%eax
ffff800000112f7a:	ff                   	(bad)  
ffff800000112f7b:	ff 43 00             	incl   0x0(%rbx)
ffff800000112f7e:	00 00                	add    %al,(%rax)
ffff800000112f80:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112f83:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112f89:	7e 0c                	jle    ffff800000112f97 <_erodata+0x5f4>
ffff800000112f8b:	07                   	(bad)  
ffff800000112f8c:	08 00                	or     %al,(%rax)
ffff800000112f8e:	00 00                	add    %al,(%rax)
ffff800000112f90:	1c 00                	sbb    $0x0,%al
ffff800000112f92:	00 00                	add    %al,(%rax)
ffff800000112f94:	ec                   	in     (%dx),%al
ffff800000112f95:	05 00 00 d1 5a       	add    $0x5ad10000,%eax
ffff800000112f9a:	ff                   	(bad)  
ffff800000112f9b:	ff 26                	jmpq   *(%rsi)
ffff800000112f9d:	00 00                	add    %al,(%rax)
ffff800000112f9f:	00 00                	add    %al,(%rax)
ffff800000112fa1:	41 0e                	rex.B (bad) 
ffff800000112fa3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fa9:	61                   	(bad)  
ffff800000112faa:	0c 07                	or     $0x7,%al
ffff800000112fac:	08 00                	or     %al,(%rax)
ffff800000112fae:	00 00                	add    %al,(%rax)
ffff800000112fb0:	1c 00                	sbb    $0x0,%al
ffff800000112fb2:	00 00                	add    %al,(%rax)
ffff800000112fb4:	0c 06                	or     $0x6,%al
ffff800000112fb6:	00 00                	add    %al,(%rax)
ffff800000112fb8:	d7                   	xlat   %ds:(%rbx)
ffff800000112fb9:	5a                   	pop    %rdx
ffff800000112fba:	ff                   	(bad)  
ffff800000112fbb:	ff 5a 00             	lcall  *0x0(%rdx)
ffff800000112fbe:	00 00                	add    %al,(%rax)
ffff800000112fc0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112fc3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fc9:	02 55 0c             	add    0xc(%rbp),%dl
ffff800000112fcc:	07                   	(bad)  
ffff800000112fcd:	08 00                	or     %al,(%rax)
ffff800000112fcf:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112fd2:	00 00                	add    %al,(%rax)
ffff800000112fd4:	2c 06                	sub    $0x6,%al
ffff800000112fd6:	00 00                	add    %al,(%rax)
ffff800000112fd8:	11 5b ff             	adc    %ebx,-0x1(%rbx)
ffff800000112fdb:	ff 76 00             	pushq  0x0(%rsi)
ffff800000112fde:	00 00                	add    %al,(%rax)
ffff800000112fe0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112fe3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112fe9:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112fec:	07                   	(bad)  
ffff800000112fed:	08 00                	or     %al,(%rax)
ffff800000112fef:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000112ff2:	00 00                	add    %al,(%rax)
ffff800000112ff4:	4c 06                	rex.WR (bad) 
ffff800000112ff6:	00 00                	add    %al,(%rax)
ffff800000112ff8:	67 5b                	addr32 pop %rbx
ffff800000112ffa:	ff                   	(bad)  
ffff800000112ffb:	ff 26                	jmpq   *(%rsi)
ffff800000112ffd:	00 00                	add    %al,(%rax)
ffff800000112fff:	00 00                	add    %al,(%rax)
ffff800000113001:	41 0e                	rex.B (bad) 
ffff800000113003:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113009:	61                   	(bad)  
ffff80000011300a:	0c 07                	or     $0x7,%al
ffff80000011300c:	08 00                	or     %al,(%rax)
ffff80000011300e:	00 00                	add    %al,(%rax)
ffff800000113010:	1c 00                	sbb    $0x0,%al
ffff800000113012:	00 00                	add    %al,(%rax)
ffff800000113014:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113015:	06                   	(bad)  
ffff800000113016:	00 00                	add    %al,(%rax)
ffff800000113018:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000113019:	5b                   	pop    %rbx
ffff80000011301a:	ff                   	(bad)  
ffff80000011301b:	ff 20                	jmpq   *(%rax)
ffff80000011301d:	00 00                	add    %al,(%rax)
ffff80000011301f:	00 00                	add    %al,(%rax)
ffff800000113021:	41 0e                	rex.B (bad) 
ffff800000113023:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113029:	5b                   	pop    %rbx
ffff80000011302a:	0c 07                	or     $0x7,%al
ffff80000011302c:	08 00                	or     %al,(%rax)
ffff80000011302e:	00 00                	add    %al,(%rax)
ffff800000113030:	1c 00                	sbb    $0x0,%al
ffff800000113032:	00 00                	add    %al,(%rax)
ffff800000113034:	8c 06                	mov    %es,(%rsi)
ffff800000113036:	00 00                	add    %al,(%rax)
ffff800000113038:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000113039:	5b                   	pop    %rbx
ffff80000011303a:	ff                   	(bad)  
ffff80000011303b:	ff 49 00             	decl   0x0(%rcx)
ffff80000011303e:	00 00                	add    %al,(%rax)
ffff800000113040:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113043:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113049:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff80000011304d:	08 00                	or     %al,(%rax)
ffff80000011304f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113052:	00 00                	add    %al,(%rax)
ffff800000113054:	ac                   	lods   %ds:(%rsi),%al
ffff800000113055:	06                   	(bad)  
ffff800000113056:	00 00                	add    %al,(%rax)
ffff800000113058:	96                   	xchg   %eax,%esi
ffff800000113059:	5b                   	pop    %rbx
ffff80000011305a:	ff                   	(bad)  
ffff80000011305b:	ff                   	(bad)  
ffff80000011305c:	39 00                	cmp    %eax,(%rax)
ffff80000011305e:	00 00                	add    %al,(%rax)
ffff800000113060:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113063:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113069:	74 0c                	je     ffff800000113077 <_erodata+0x6d4>
ffff80000011306b:	07                   	(bad)  
ffff80000011306c:	08 00                	or     %al,(%rax)
ffff80000011306e:	00 00                	add    %al,(%rax)
ffff800000113070:	1c 00                	sbb    $0x0,%al
ffff800000113072:	00 00                	add    %al,(%rax)
ffff800000113074:	cc                   	int3   
ffff800000113075:	06                   	(bad)  
ffff800000113076:	00 00                	add    %al,(%rax)
ffff800000113078:	af                   	scas   %es:(%rdi),%eax
ffff800000113079:	5b                   	pop    %rbx
ffff80000011307a:	ff                   	(bad)  
ffff80000011307b:	ff c9                	dec    %ecx
ffff80000011307d:	00 00                	add    %al,(%rax)
ffff80000011307f:	00 00                	add    %al,(%rax)
ffff800000113081:	41 0e                	rex.B (bad) 
ffff800000113083:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113089:	02 c4                	add    %ah,%al
ffff80000011308b:	0c 07                	or     $0x7,%al
ffff80000011308d:	08 00                	or     %al,(%rax)
ffff80000011308f:	00 18                	add    %bl,(%rax)
ffff800000113091:	00 00                	add    %al,(%rax)
ffff800000113093:	00 ec                	add    %ch,%ah
ffff800000113095:	06                   	(bad)  
ffff800000113096:	00 00                	add    %al,(%rax)
ffff800000113098:	58                   	pop    %rax
ffff800000113099:	5c                   	pop    %rsp
ffff80000011309a:	ff                   	(bad)  
ffff80000011309b:	ff 45 00             	incl   0x0(%rbp)
ffff80000011309e:	00 00                	add    %al,(%rax)
ffff8000001130a0:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001130a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130a9:	00 00                	add    %al,(%rax)
ffff8000001130ab:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001130ae:	00 00                	add    %al,(%rax)
ffff8000001130b0:	08 07                	or     %al,(%rdi)
ffff8000001130b2:	00 00                	add    %al,(%rax)
ffff8000001130b4:	81 5c ff ff 97 00 00 	sbbl   $0x97,-0x1(%rdi,%rdi,8)
ffff8000001130bb:	00 
ffff8000001130bc:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001130bf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130c5:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
ffff8000001130cb:	00 20                	add    %ah,(%rax)
ffff8000001130cd:	00 00                	add    %al,(%rax)
ffff8000001130cf:	00 28                	add    %ch,(%rax)
ffff8000001130d1:	07                   	(bad)  
ffff8000001130d2:	00 00                	add    %al,(%rax)
ffff8000001130d4:	f8                   	clc    
ffff8000001130d5:	5c                   	pop    %rsp
ffff8000001130d6:	ff                   	(bad)  
ffff8000001130d7:	ff f6                	push   %rsi
ffff8000001130d9:	00 00                	add    %al,(%rax)
ffff8000001130db:	00 00                	add    %al,(%rax)
ffff8000001130dd:	41 0e                	rex.B (bad) 
ffff8000001130df:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001130e5:	45 83 03 02          	rex.RB addl $0x2,(%r11)
ffff8000001130e9:	ec                   	in     (%dx),%al
ffff8000001130ea:	0c 07                	or     $0x7,%al
ffff8000001130ec:	08 00                	or     %al,(%rax)
ffff8000001130ee:	00 00                	add    %al,(%rax)
ffff8000001130f0:	20 00                	and    %al,(%rax)
ffff8000001130f2:	00 00                	add    %al,(%rax)
ffff8000001130f4:	4c 07                	rex.WR (bad) 
ffff8000001130f6:	00 00                	add    %al,(%rax)
ffff8000001130f8:	ca 5d ff             	lret   $0xff5d
ffff8000001130fb:	ff                   	(bad)  
ffff8000001130fc:	f9                   	stc    
ffff8000001130fd:	02 00                	add    (%rax),%al
ffff8000001130ff:	00 00                	add    %al,(%rax)
ffff800000113101:	41 0e                	rex.B (bad) 
ffff800000113103:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113109:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000011310d:	ef                   	out    %eax,(%dx)
ffff80000011310e:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff800000113111:	08 00                	or     %al,(%rax)
ffff800000113113:	00 18                	add    %bl,(%rax)
ffff800000113115:	00 00                	add    %al,(%rax)
ffff800000113117:	00 70 07             	add    %dh,0x7(%rax)
ffff80000011311a:	00 00                	add    %al,(%rax)
ffff80000011311c:	9f                   	lahf   
ffff80000011311d:	60                   	(bad)  
ffff80000011311e:	ff                   	(bad)  
ffff80000011311f:	ff                   	(bad)  
ffff800000113120:	3b 00                	cmp    (%rax),%eax
ffff800000113122:	00 00                	add    %al,(%rax)
ffff800000113124:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113127:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011312d:	00 00                	add    %al,(%rax)
ffff80000011312f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113132:	00 00                	add    %al,(%rax)
ffff800000113134:	8c 07                	mov    %es,(%rdi)
ffff800000113136:	00 00                	add    %al,(%rax)
ffff800000113138:	be 60 ff ff 30       	mov    $0x30ffff60,%esi
ffff80000011313d:	00 00                	add    %al,(%rax)
ffff80000011313f:	00 00                	add    %al,(%rax)
ffff800000113141:	41 0e                	rex.B (bad) 
ffff800000113143:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113149:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
ffff80000011314d:	00 00                	add    %al,(%rax)
ffff80000011314f:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113152:	00 00                	add    %al,(%rax)
ffff800000113154:	ac                   	lods   %ds:(%rsi),%al
ffff800000113155:	07                   	(bad)  
ffff800000113156:	00 00                	add    %al,(%rax)
ffff800000113158:	fe                   	(bad)  
ffff800000113159:	60                   	(bad)  
ffff80000011315a:	ff                   	(bad)  
ffff80000011315b:	ff b5 00 00 00 00    	pushq  0x0(%rbp)
ffff800000113161:	41 0e                	rex.B (bad) 
ffff800000113163:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113169:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
ffff80000011316f:	00 20                	add    %ah,(%rax)
ffff800000113171:	00 00                	add    %al,(%rax)
ffff800000113173:	00 cc                	add    %cl,%ah
ffff800000113175:	07                   	(bad)  
ffff800000113176:	00 00                	add    %al,(%rax)
ffff800000113178:	93                   	xchg   %eax,%ebx
ffff800000113179:	61                   	(bad)  
ffff80000011317a:	ff                   	(bad)  
ffff80000011317b:	ff 15 02 00 00 00    	callq  *0x2(%rip)        # ffff800000113183 <_erodata+0x7e0>
ffff800000113181:	41 0e                	rex.B (bad) 
ffff800000113183:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113189:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff80000011318d:	0b 02                	or     (%rdx),%eax
ffff80000011318f:	0c 07                	or     $0x7,%al
ffff800000113191:	08 00                	or     %al,(%rax)
ffff800000113193:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff800000113196:	00 00                	add    %al,(%rax)
ffff800000113198:	f0 07                	lock (bad) 
ffff80000011319a:	00 00                	add    %al,(%rax)
ffff80000011319c:	84 63 ff             	test   %ah,-0x1(%rbx)
ffff80000011319f:	ff 43 03             	incl   0x3(%rbx)
ffff8000001131a2:	00 00                	add    %al,(%rax)
ffff8000001131a4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001131a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001131ad:	4b 8e 03             	rex.WXB mov (%r11),%es
ffff8000001131b0:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
ffff8000001131b3:	05 83 06 03 33       	add    $0x33030683,%eax
ffff8000001131b8:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff8000001131bb:	08                   	.byte 0x8

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
ffff800000118024:	00 80 ff ff a0 b9    	add    %al,-0x465f0001(%rax)
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
ffff800000120024:	00 80 ff ff a0 b9    	add    %al,-0x465f0001(%rax)
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
