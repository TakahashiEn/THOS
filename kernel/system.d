
system.o:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100004:	8e d8                	mov    %eax,%ds
ffff800000100006:	8e c0                	mov    %eax,%es
ffff800000100008:	8e e0                	mov    %eax,%fs
ffff80000010000a:	8e d0                	mov    %eax,%ss
ffff80000010000c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
ffff800000100011:	0f 01 15 00 9e 00 00 	lgdt   0x9e00(%rip)        # ffff800000109e18 <GDT_END>
ffff800000100018:	0f 01 1d 03 ae 00 00 	lidt   0xae03(%rip)        # ffff80000010ae22 <IDT_END>
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
ffff80000010009a:	48 8d 3d 81 9d 00 00 	lea    0x9d81(%rip),%rdi        # ffff800000109e22 <IDT_Table>
ffff8000001000a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff8000001000a8 <rp_sidt>:
ffff8000001000a8:	48 89 07             	mov    %rax,(%rdi)
ffff8000001000ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff8000001000af:	48 83 c7 10          	add    $0x10,%rdi
ffff8000001000b3:	48 ff c9             	dec    %rcx
ffff8000001000b6:	75 f0                	jne    ffff8000001000a8 <rp_sidt>

ffff8000001000b8 <setup_TSS64>:
ffff8000001000b8:	48 8d 15 6d ad 00 00 	lea    0xad6d(%rip),%rdx        # ffff80000010ae2c <TSS64_Table>
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
ffff8000001000f2:	48 8d 3d 87 9c 00 00 	lea    0x9c87(%rip),%rdi        # ffff800000109d80 <GDT_Table>
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
ffff800000100166:	e8 ca 51 00 00       	callq  ffff800000105335 <color_printk>
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
ffff80000010405f:	e8 24 52 00 00       	callq  ffff800000109288 <system_call_function>

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
ffff800000104095:	48 8d 05 38 1a 00 00 	lea    0x1a38(%rip),%rax        # ffff800000105ad4 <do_divide_error>
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
ffff8000001040ed:	48 8d 05 3b 1a 00 00 	lea    0x1a3b(%rip),%rax        # ffff800000105b2f <do_debug>
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
ffff800000104136:	e8 4f 1a 00 00       	callq  ffff800000105b8a <do_nmi>
ffff80000010413b:	e9 c0 fe ff ff       	jmpq   ffff800000104000 <RESTORE_ALL>

ffff800000104140 <int3>:
ffff800000104140:	6a 00                	pushq  $0x0
ffff800000104142:	50                   	push   %rax
ffff800000104143:	48 8d 05 9b 1a 00 00 	lea    0x1a9b(%rip),%rax        # ffff800000105be5 <do_int3>
ffff80000010414a:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010414e:	e9 4d ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104153 <overflow>:
ffff800000104153:	6a 00                	pushq  $0x0
ffff800000104155:	50                   	push   %rax
ffff800000104156:	48 8d 05 e3 1a 00 00 	lea    0x1ae3(%rip),%rax        # ffff800000105c40 <do_overflow>
ffff80000010415d:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104161:	e9 3a ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104166 <bounds>:
ffff800000104166:	6a 00                	pushq  $0x0
ffff800000104168:	50                   	push   %rax
ffff800000104169:	48 8d 05 2b 1b 00 00 	lea    0x1b2b(%rip),%rax        # ffff800000105c9b <do_bounds>
ffff800000104170:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104174:	e9 27 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104179 <undefined_opcode>:
ffff800000104179:	6a 00                	pushq  $0x0
ffff80000010417b:	50                   	push   %rax
ffff80000010417c:	48 8d 05 73 1b 00 00 	lea    0x1b73(%rip),%rax        # ffff800000105cf6 <do_undefined_opcode>
ffff800000104183:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104187:	e9 14 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010418c <dev_not_available>:
ffff80000010418c:	6a 00                	pushq  $0x0
ffff80000010418e:	50                   	push   %rax
ffff80000010418f:	48 8d 05 bb 1b 00 00 	lea    0x1bbb(%rip),%rax        # ffff800000105d51 <do_dev_not_available>
ffff800000104196:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010419a:	e9 01 ff ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010419f <double_fault>:
ffff80000010419f:	50                   	push   %rax
ffff8000001041a0:	48 8d 05 05 1c 00 00 	lea    0x1c05(%rip),%rax        # ffff800000105dac <do_double_fault>
ffff8000001041a7:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041ab:	e9 f0 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041b0 <coprocessor_segment_overrun>:
ffff8000001041b0:	6a 00                	pushq  $0x0
ffff8000001041b2:	50                   	push   %rax
ffff8000001041b3:	48 8d 05 4d 1c 00 00 	lea    0x1c4d(%rip),%rax        # ffff800000105e07 <do_coprocessor_segment_overrun>
ffff8000001041ba:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041be:	e9 dd fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041c3 <invalid_TSS>:
ffff8000001041c3:	50                   	push   %rax
ffff8000001041c4:	48 8d 05 97 1c 00 00 	lea    0x1c97(%rip),%rax        # ffff800000105e62 <do_invalid_TSS>
ffff8000001041cb:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041cf:	e9 cc fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041d4 <segment_not_present>:
ffff8000001041d4:	50                   	push   %rax
ffff8000001041d5:	48 8d 05 00 1e 00 00 	lea    0x1e00(%rip),%rax        # ffff800000105fdc <do_segment_not_present>
ffff8000001041dc:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041e0:	e9 bb fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041e5 <stack_segment_fault>:
ffff8000001041e5:	50                   	push   %rax
ffff8000001041e6:	48 8d 05 69 1f 00 00 	lea    0x1f69(%rip),%rax        # ffff800000106156 <do_stack_segment_fault>
ffff8000001041ed:	48 87 04 24          	xchg   %rax,(%rsp)
ffff8000001041f1:	e9 aa fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff8000001041f6 <general_protection>:
ffff8000001041f6:	50                   	push   %rax
ffff8000001041f7:	48 8d 05 d2 20 00 00 	lea    0x20d2(%rip),%rax        # ffff8000001062d0 <do_general_protection>
ffff8000001041fe:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104202:	e9 99 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104207 <page_fault>:
ffff800000104207:	50                   	push   %rax
ffff800000104208:	48 8d 05 3b 22 00 00 	lea    0x223b(%rip),%rax        # ffff80000010644a <do_page_fault>
ffff80000010420f:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104213:	e9 88 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104218 <x87_FPU_error>:
ffff800000104218:	6a 00                	pushq  $0x0
ffff80000010421a:	50                   	push   %rax
ffff80000010421b:	48 8d 05 27 24 00 00 	lea    0x2427(%rip),%rax        # ffff800000106649 <do_x87_FPU_error>
ffff800000104222:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104226:	e9 75 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010422b <alignment_check>:
ffff80000010422b:	50                   	push   %rax
ffff80000010422c:	48 8d 05 71 24 00 00 	lea    0x2471(%rip),%rax        # ffff8000001066a4 <do_alignment_check>
ffff800000104233:	48 87 04 24          	xchg   %rax,(%rsp)
ffff800000104237:	e9 64 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010423c <machine_check>:
ffff80000010423c:	6a 00                	pushq  $0x0
ffff80000010423e:	50                   	push   %rax
ffff80000010423f:	48 8d 05 b9 24 00 00 	lea    0x24b9(%rip),%rax        # ffff8000001066ff <do_machine_check>
ffff800000104246:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010424a:	e9 51 fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff80000010424f <SIMD_exception>:
ffff80000010424f:	6a 00                	pushq  $0x0
ffff800000104251:	50                   	push   %rax
ffff800000104252:	48 8d 05 01 25 00 00 	lea    0x2501(%rip),%rax        # ffff80000010675a <do_SIMD_exception>
ffff800000104259:	48 87 04 24          	xchg   %rax,(%rsp)
ffff80000010425d:	e9 3e fe ff ff       	jmpq   ffff8000001040a0 <error_code>

ffff800000104262 <virtualization_exception>:
ffff800000104262:	6a 00                	pushq  $0x0
ffff800000104264:	50                   	push   %rax
ffff800000104265:	48 8d 05 49 25 00 00 	lea    0x2549(%rip),%rax        # ffff8000001067b5 <do_virtualization_exception>
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
ffff800000104291:	48 ba 30 ae 10 00 00 	movabs $0xffff80000010ae30,%rdx
ffff800000104298:	80 ff ff 
ffff80000010429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010429f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042a2:	48 ba 38 ae 10 00 00 	movabs $0xffff80000010ae38,%rdx
ffff8000001042a9:	80 ff ff 
ffff8000001042ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042b3:	48 ba 40 ae 10 00 00 	movabs $0xffff80000010ae40,%rdx
ffff8000001042ba:	80 ff ff 
ffff8000001042bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001042c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042c4:	48 ba 50 ae 10 00 00 	movabs $0xffff80000010ae50,%rdx
ffff8000001042cb:	80 ff ff 
ffff8000001042ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001042d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042d5:	48 ba 58 ae 10 00 00 	movabs $0xffff80000010ae58,%rdx
ffff8000001042dc:	80 ff ff 
ffff8000001042df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042e6:	48 ba 60 ae 10 00 00 	movabs $0xffff80000010ae60,%rdx
ffff8000001042ed:	80 ff ff 
ffff8000001042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001042f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042f7:	48 ba 68 ae 10 00 00 	movabs $0xffff80000010ae68,%rdx
ffff8000001042fe:	80 ff ff 
ffff800000104301:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000104305:	48 89 02             	mov    %rax,(%rdx)
ffff800000104308:	48 ba 70 ae 10 00 00 	movabs $0xffff80000010ae70,%rdx
ffff80000010430f:	80 ff ff 
ffff800000104312:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000104316:	48 89 02             	mov    %rax,(%rdx)
ffff800000104319:	48 ba 78 ae 10 00 00 	movabs $0xffff80000010ae78,%rdx
ffff800000104320:	80 ff ff 
ffff800000104323:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000104327:	48 89 02             	mov    %rax,(%rdx)
ffff80000010432a:	48 ba 80 ae 10 00 00 	movabs $0xffff80000010ae80,%rdx
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
ffff800000104358:	48 ba 60 2b 11 00 00 	movabs $0xffff800000112b60,%rdx
ffff80000010435f:	80 ff ff 
ffff800000104362:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104367:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010436c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104371:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
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
ffff8000001043ad:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
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
ffff800000104520:	48 ba 10 68 10 00 00 	movabs $0xffff800000106810,%rdx
ffff800000104527:	80 ff ff 
ffff80000010452a:	ff d2                	callq  *%rdx
ffff80000010452c:	48 b8 a5 99 10 00 00 	movabs $0xffff8000001099a5,%rax
ffff800000104533:	80 ff ff 
ffff800000104536:	ff d0                	callq  *%rax
ffff800000104538:	48 ba 00 00 10 00 00 	movabs $0xffff800000100000,%rdx
ffff80000010453f:	80 ff ff 
ffff800000104542:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104549:	80 ff ff 
ffff80000010454c:	48 89 90 d0 02 00 00 	mov    %rdx,0x2d0(%rax)
ffff800000104553:	48 ba 63 9d 10 00 00 	movabs $0xffff800000109d63,%rdx
ffff80000010455a:	80 ff ff 
ffff80000010455d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104564:	80 ff ff 
ffff800000104567:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
ffff80000010456e:	48 ba 60 2b 11 00 00 	movabs $0xffff800000112b60,%rdx
ffff800000104575:	80 ff ff 
ffff800000104578:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010457f:	80 ff ff 
ffff800000104582:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
ffff800000104589:	48 ba 68 f5 12 00 00 	movabs $0xffff80000012f568,%rdx
ffff800000104590:	80 ff ff 
ffff800000104593:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010459a:	80 ff ff 
ffff80000010459d:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
ffff8000001045a4:	48 ba 84 2b 11 00 00 	movabs $0xffff800000112b84,%rdx
ffff8000001045ab:	80 ff ff 
ffff8000001045ae:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045b3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045b8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045bd:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001045c4:	80 ff ff 
ffff8000001045c7:	ff d1                	callq  *%rcx
ffff8000001045c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045ce:	48 ba 8c 6e 10 00 00 	movabs $0xffff800000106e8c,%rdx
ffff8000001045d5:	80 ff ff 
ffff8000001045d8:	ff d2                	callq  *%rdx
ffff8000001045da:	48 ba 92 2b 11 00 00 	movabs $0xffff800000112b92,%rdx
ffff8000001045e1:	80 ff ff 
ffff8000001045e4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045e9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045ee:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045f3:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001045fa:	80 ff ff 
ffff8000001045fd:	ff d1                	callq  *%rcx
ffff8000001045ff:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104604:	48 ba e5 87 10 00 00 	movabs $0xffff8000001087e5,%rdx
ffff80000010460b:	80 ff ff 
ffff80000010460e:	ff d2                	callq  *%rdx
ffff800000104610:	48 ba a3 2b 11 00 00 	movabs $0xffff800000112ba3,%rdx
ffff800000104617:	80 ff ff 
ffff80000010461a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010461f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104624:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104629:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000104630:	80 ff ff 
ffff800000104633:	ff d1                	callq  *%rcx
ffff800000104635:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010463a:	48 ba 1c 96 10 00 00 	movabs $0xffff80000010961c,%rdx
ffff800000104641:	80 ff ff 
ffff800000104644:	ff d2                	callq  *%rdx
ffff800000104646:	eb fe                	jmp    ffff800000104646 <Start_Kernel+0x286>

ffff800000104648 <strlen>:
ffff800000104648:	55                   	push   %rbp
ffff800000104649:	48 89 e5             	mov    %rsp,%rbp
ffff80000010464c:	53                   	push   %rbx
ffff80000010464d:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
ffff800000104651:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
ffff800000104655:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010465a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
ffff80000010465f:	89 d1                	mov    %edx,%ecx
ffff800000104661:	48 89 f7             	mov    %rsi,%rdi
ffff800000104664:	fc                   	cld    
ffff800000104665:	f2 ae                	repnz scas %es:(%rdi),%al
ffff800000104667:	f7 d1                	not    %ecx
ffff800000104669:	ff c9                	dec    %ecx
ffff80000010466b:	89 ca                	mov    %ecx,%edx
ffff80000010466d:	89 d3                	mov    %edx,%ebx
ffff80000010466f:	89 d8                	mov    %ebx,%eax
ffff800000104671:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000104675:	c9                   	leaveq 
ffff800000104676:	c3                   	retq   

ffff800000104677 <putchar>:
ffff800000104677:	55                   	push   %rbp
ffff800000104678:	48 89 e5             	mov    %rsp,%rbp
ffff80000010467b:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010467f:	89 75 d4             	mov    %esi,-0x2c(%rbp)
ffff800000104682:	89 55 d0             	mov    %edx,-0x30(%rbp)
ffff800000104685:	89 4d cc             	mov    %ecx,-0x34(%rbp)
ffff800000104688:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
ffff80000010468c:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
ffff800000104690:	8b 45 10             	mov    0x10(%rbp),%eax
ffff800000104693:	88 45 c0             	mov    %al,-0x40(%rbp)
ffff800000104696:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff80000010469d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001046a4:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff8000001046ab:	00 
ffff8000001046ac:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff8000001046b3:	00 
ffff8000001046b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff8000001046bb:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
ffff8000001046bf:	48 98                	cltq   
ffff8000001046c1:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001046c5:	48 89 c2             	mov    %rax,%rdx
ffff8000001046c8:	48 b8 a0 ae 10 00 00 	movabs $0xffff80000010aea0,%rax
ffff8000001046cf:	80 ff ff 
ffff8000001046d2:	48 01 d0             	add    %rdx,%rax
ffff8000001046d5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001046d9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001046e0:	eb 7a                	jmp    ffff80000010475c <putchar+0xe5>
ffff8000001046e2:	8b 55 cc             	mov    -0x34(%rbp),%edx
ffff8000001046e5:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001046e8:	01 d0                	add    %edx,%eax
ffff8000001046ea:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
ffff8000001046ee:	48 63 d0             	movslq %eax,%rdx
ffff8000001046f1:	8b 45 d0             	mov    -0x30(%rbp),%eax
ffff8000001046f4:	48 98                	cltq   
ffff8000001046f6:	48 01 d0             	add    %rdx,%rax
ffff8000001046f9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
ffff800000104700:	00 
ffff800000104701:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000104705:	48 01 d0             	add    %rdx,%rax
ffff800000104708:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff80000010470c:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
ffff800000104713:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff80000010471a:	eb 31                	jmp    ffff80000010474d <putchar+0xd6>
ffff80000010471c:	d1 7d e4             	sarl   -0x1c(%rbp)
ffff80000010471f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104723:	0f b6 00             	movzbl (%rax),%eax
ffff800000104726:	0f b6 c0             	movzbl %al,%eax
ffff800000104729:	23 45 e4             	and    -0x1c(%rbp),%eax
ffff80000010472c:	85 c0                	test   %eax,%eax
ffff80000010472e:	74 0b                	je     ffff80000010473b <putchar+0xc4>
ffff800000104730:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104734:	8b 55 c8             	mov    -0x38(%rbp),%edx
ffff800000104737:	89 10                	mov    %edx,(%rax)
ffff800000104739:	eb 09                	jmp    ffff800000104744 <putchar+0xcd>
ffff80000010473b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010473f:	8b 55 c4             	mov    -0x3c(%rbp),%edx
ffff800000104742:	89 10                	mov    %edx,(%rax)
ffff800000104744:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
ffff800000104749:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff80000010474d:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
ffff800000104751:	7e c9                	jle    ffff80000010471c <putchar+0xa5>
ffff800000104753:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
ffff800000104758:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff80000010475c:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
ffff800000104760:	7e 80                	jle    ffff8000001046e2 <putchar+0x6b>
ffff800000104762:	90                   	nop
ffff800000104763:	90                   	nop
ffff800000104764:	5d                   	pop    %rbp
ffff800000104765:	c3                   	retq   

ffff800000104766 <skip_atoi>:
ffff800000104766:	55                   	push   %rbp
ffff800000104767:	48 89 e5             	mov    %rsp,%rbp
ffff80000010476a:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010476e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000104775:	eb 2e                	jmp    ffff8000001047a5 <skip_atoi+0x3f>
ffff800000104777:	8b 55 fc             	mov    -0x4(%rbp),%edx
ffff80000010477a:	89 d0                	mov    %edx,%eax
ffff80000010477c:	c1 e0 02             	shl    $0x2,%eax
ffff80000010477f:	01 d0                	add    %edx,%eax
ffff800000104781:	01 c0                	add    %eax,%eax
ffff800000104783:	89 c6                	mov    %eax,%esi
ffff800000104785:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000104789:	48 8b 00             	mov    (%rax),%rax
ffff80000010478c:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104790:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000104794:	48 89 0a             	mov    %rcx,(%rdx)
ffff800000104797:	0f b6 00             	movzbl (%rax),%eax
ffff80000010479a:	0f be c0             	movsbl %al,%eax
ffff80000010479d:	01 f0                	add    %esi,%eax
ffff80000010479f:	83 e8 30             	sub    $0x30,%eax
ffff8000001047a2:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff8000001047a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001047a9:	48 8b 00             	mov    (%rax),%rax
ffff8000001047ac:	0f b6 00             	movzbl (%rax),%eax
ffff8000001047af:	3c 2f                	cmp    $0x2f,%al
ffff8000001047b1:	7e 0e                	jle    ffff8000001047c1 <skip_atoi+0x5b>
ffff8000001047b3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001047b7:	48 8b 00             	mov    (%rax),%rax
ffff8000001047ba:	0f b6 00             	movzbl (%rax),%eax
ffff8000001047bd:	3c 39                	cmp    $0x39,%al
ffff8000001047bf:	7e b6                	jle    ffff800000104777 <skip_atoi+0x11>
ffff8000001047c1:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001047c4:	5d                   	pop    %rbp
ffff8000001047c5:	c3                   	retq   

ffff8000001047c6 <number>:
ffff8000001047c6:	55                   	push   %rbp
ffff8000001047c7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001047ca:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
ffff8000001047ce:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
ffff8000001047d2:	89 55 9c             	mov    %edx,-0x64(%rbp)
ffff8000001047d5:	89 4d 98             	mov    %ecx,-0x68(%rbp)
ffff8000001047d8:	44 89 45 94          	mov    %r8d,-0x6c(%rbp)
ffff8000001047dc:	44 89 4d 90          	mov    %r9d,-0x70(%rbp)
ffff8000001047e0:	48 b8 b0 2b 11 00 00 	movabs $0xffff800000112bb0,%rax
ffff8000001047e7:	80 ff ff 
ffff8000001047ea:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047ee:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047f1:	83 e0 40             	and    $0x40,%eax
ffff8000001047f4:	85 c0                	test   %eax,%eax
ffff8000001047f6:	74 0e                	je     ffff800000104806 <number+0x40>
ffff8000001047f8:	48 b8 d8 2b 11 00 00 	movabs $0xffff800000112bd8,%rax
ffff8000001047ff:	80 ff ff 
ffff800000104802:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104806:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104809:	83 e0 10             	and    $0x10,%eax
ffff80000010480c:	85 c0                	test   %eax,%eax
ffff80000010480e:	74 04                	je     ffff800000104814 <number+0x4e>
ffff800000104810:	83 65 90 fe          	andl   $0xfffffffe,-0x70(%rbp)
ffff800000104814:	83 7d 9c 01          	cmpl   $0x1,-0x64(%rbp)
ffff800000104818:	7e 06                	jle    ffff800000104820 <number+0x5a>
ffff80000010481a:	83 7d 9c 24          	cmpl   $0x24,-0x64(%rbp)
ffff80000010481e:	7e 0a                	jle    ffff80000010482a <number+0x64>
ffff800000104820:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000104825:	e9 10 02 00 00       	jmpq   ffff800000104a3a <number+0x274>
ffff80000010482a:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010482d:	83 e0 01             	and    $0x1,%eax
ffff800000104830:	85 c0                	test   %eax,%eax
ffff800000104832:	74 07                	je     ffff80000010483b <number+0x75>
ffff800000104834:	b8 30 00 00 00       	mov    $0x30,%eax
ffff800000104839:	eb 05                	jmp    ffff800000104840 <number+0x7a>
ffff80000010483b:	b8 20 00 00 00       	mov    $0x20,%eax
ffff800000104840:	88 45 eb             	mov    %al,-0x15(%rbp)
ffff800000104843:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000104847:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010484a:	83 e0 02             	and    $0x2,%eax
ffff80000010484d:	85 c0                	test   %eax,%eax
ffff80000010484f:	74 11                	je     ffff800000104862 <number+0x9c>
ffff800000104851:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff800000104856:	79 0a                	jns    ffff800000104862 <number+0x9c>
ffff800000104858:	c6 45 ff 2d          	movb   $0x2d,-0x1(%rbp)
ffff80000010485c:	48 f7 5d a0          	negq   -0x60(%rbp)
ffff800000104860:	eb 1d                	jmp    ffff80000010487f <number+0xb9>
ffff800000104862:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff800000104865:	83 e0 04             	and    $0x4,%eax
ffff800000104868:	85 c0                	test   %eax,%eax
ffff80000010486a:	75 0b                	jne    ffff800000104877 <number+0xb1>
ffff80000010486c:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010486f:	c1 e0 02             	shl    $0x2,%eax
ffff800000104872:	83 e0 20             	and    $0x20,%eax
ffff800000104875:	eb 05                	jmp    ffff80000010487c <number+0xb6>
ffff800000104877:	b8 2b 00 00 00       	mov    $0x2b,%eax
ffff80000010487c:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff80000010487f:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
ffff800000104883:	74 04                	je     ffff800000104889 <number+0xc3>
ffff800000104885:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
ffff800000104889:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010488c:	83 e0 20             	and    $0x20,%eax
ffff80000010488f:	85 c0                	test   %eax,%eax
ffff800000104891:	74 16                	je     ffff8000001048a9 <number+0xe3>
ffff800000104893:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
ffff800000104897:	75 06                	jne    ffff80000010489f <number+0xd9>
ffff800000104899:	83 6d 98 02          	subl   $0x2,-0x68(%rbp)
ffff80000010489d:	eb 0a                	jmp    ffff8000001048a9 <number+0xe3>
ffff80000010489f:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
ffff8000001048a3:	75 04                	jne    ffff8000001048a9 <number+0xe3>
ffff8000001048a5:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
ffff8000001048a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff8000001048b0:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff8000001048b5:	75 48                	jne    ffff8000001048ff <number+0x139>
ffff8000001048b7:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001048ba:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001048bd:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff8000001048c0:	48 98                	cltq   
ffff8000001048c2:	c6 44 05 b0 30       	movb   $0x30,-0x50(%rbp,%rax,1)
ffff8000001048c7:	eb 3d                	jmp    ffff800000104906 <number+0x140>
ffff8000001048c9:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001048cd:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001048d2:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
ffff8000001048d5:	48 f7 f1             	div    %rcx
ffff8000001048d8:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001048dc:	89 55 e4             	mov    %edx,-0x1c(%rbp)
ffff8000001048df:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff8000001048e2:	48 63 d0             	movslq %eax,%rdx
ffff8000001048e5:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001048e9:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff8000001048ed:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001048f0:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001048f3:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff8000001048f6:	0f b6 11             	movzbl (%rcx),%edx
ffff8000001048f9:	48 98                	cltq   
ffff8000001048fb:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
ffff8000001048ff:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
ffff800000104904:	75 c3                	jne    ffff8000001048c9 <number+0x103>
ffff800000104906:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104909:	3b 45 94             	cmp    -0x6c(%rbp),%eax
ffff80000010490c:	7e 06                	jle    ffff800000104914 <number+0x14e>
ffff80000010490e:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104911:	89 45 94             	mov    %eax,-0x6c(%rbp)
ffff800000104914:	8b 45 94             	mov    -0x6c(%rbp),%eax
ffff800000104917:	29 45 98             	sub    %eax,-0x68(%rbp)
ffff80000010491a:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010491d:	83 e0 11             	and    $0x11,%eax
ffff800000104920:	85 c0                	test   %eax,%eax
ffff800000104922:	75 1e                	jne    ffff800000104942 <number+0x17c>
ffff800000104924:	eb 0f                	jmp    ffff800000104935 <number+0x16f>
ffff800000104926:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010492a:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff80000010492e:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104932:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104935:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff800000104938:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff80000010493b:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff80000010493e:	85 c0                	test   %eax,%eax
ffff800000104940:	7f e4                	jg     ffff800000104926 <number+0x160>
ffff800000104942:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
ffff800000104946:	74 12                	je     ffff80000010495a <number+0x194>
ffff800000104948:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010494c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104950:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104954:	0f b6 55 ff          	movzbl -0x1(%rbp),%edx
ffff800000104958:	88 10                	mov    %dl,(%rax)
ffff80000010495a:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff80000010495d:	83 e0 20             	and    $0x20,%eax
ffff800000104960:	85 c0                	test   %eax,%eax
ffff800000104962:	74 42                	je     ffff8000001049a6 <number+0x1e0>
ffff800000104964:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
ffff800000104968:	75 11                	jne    ffff80000010497b <number+0x1b5>
ffff80000010496a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010496e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104972:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104976:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104979:	eb 2b                	jmp    ffff8000001049a6 <number+0x1e0>
ffff80000010497b:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
ffff80000010497f:	75 25                	jne    ffff8000001049a6 <number+0x1e0>
ffff800000104981:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104985:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104989:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff80000010498d:	c6 00 30             	movb   $0x30,(%rax)
ffff800000104990:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104994:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104998:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff80000010499c:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff8000001049a0:	0f b6 52 21          	movzbl 0x21(%rdx),%edx
ffff8000001049a4:	88 10                	mov    %dl,(%rax)
ffff8000001049a6:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001049a9:	83 e0 10             	and    $0x10,%eax
ffff8000001049ac:	85 c0                	test   %eax,%eax
ffff8000001049ae:	75 32                	jne    ffff8000001049e2 <number+0x21c>
ffff8000001049b0:	eb 12                	jmp    ffff8000001049c4 <number+0x1fe>
ffff8000001049b2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049b6:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049ba:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049be:	0f b6 55 eb          	movzbl -0x15(%rbp),%edx
ffff8000001049c2:	88 10                	mov    %dl,(%rax)
ffff8000001049c4:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff8000001049c7:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001049ca:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff8000001049cd:	85 c0                	test   %eax,%eax
ffff8000001049cf:	7f e1                	jg     ffff8000001049b2 <number+0x1ec>
ffff8000001049d1:	eb 0f                	jmp    ffff8000001049e2 <number+0x21c>
ffff8000001049d3:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049d7:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049db:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049df:	c6 00 30             	movb   $0x30,(%rax)
ffff8000001049e2:	8b 45 94             	mov    -0x6c(%rbp),%eax
ffff8000001049e5:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001049e8:	89 55 94             	mov    %edx,-0x6c(%rbp)
ffff8000001049eb:	39 45 ec             	cmp    %eax,-0x14(%rbp)
ffff8000001049ee:	7c e3                	jl     ffff8000001049d3 <number+0x20d>
ffff8000001049f0:	eb 19                	jmp    ffff800000104a0b <number+0x245>
ffff8000001049f2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001049f6:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001049fa:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff8000001049fe:	8b 55 ec             	mov    -0x14(%rbp),%edx
ffff800000104a01:	48 63 d2             	movslq %edx,%rdx
ffff800000104a04:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
ffff800000104a09:	88 10                	mov    %dl,(%rax)
ffff800000104a0b:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104a0e:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104a11:	89 55 ec             	mov    %edx,-0x14(%rbp)
ffff800000104a14:	85 c0                	test   %eax,%eax
ffff800000104a16:	7f da                	jg     ffff8000001049f2 <number+0x22c>
ffff800000104a18:	eb 0f                	jmp    ffff800000104a29 <number+0x263>
ffff800000104a1a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104a1e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104a22:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104a26:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104a29:	8b 45 98             	mov    -0x68(%rbp),%eax
ffff800000104a2c:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104a2f:	89 55 98             	mov    %edx,-0x68(%rbp)
ffff800000104a32:	85 c0                	test   %eax,%eax
ffff800000104a34:	7f e4                	jg     ffff800000104a1a <number+0x254>
ffff800000104a36:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104a3a:	5d                   	pop    %rbp
ffff800000104a3b:	c3                   	retq   

ffff800000104a3c <vsprintf>:
ffff800000104a3c:	55                   	push   %rbp
ffff800000104a3d:	48 89 e5             	mov    %rsp,%rbp
ffff800000104a40:	48 83 ec 58          	sub    $0x58,%rsp
ffff800000104a44:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
ffff800000104a48:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
ffff800000104a4c:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
ffff800000104a50:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000104a54:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104a58:	e9 b8 08 00 00       	jmpq   ffff800000105315 <vsprintf+0x8d9>
ffff800000104a5d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a61:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a64:	3c 25                	cmp    $0x25,%al
ffff800000104a66:	74 1a                	je     ffff800000104a82 <vsprintf+0x46>
ffff800000104a68:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff800000104a6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104a70:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104a74:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000104a78:	0f b6 12             	movzbl (%rdx),%edx
ffff800000104a7b:	88 10                	mov    %dl,(%rax)
ffff800000104a7d:	e9 87 08 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104a82:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff800000104a89:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a8d:	48 83 c0 01          	add    $0x1,%rax
ffff800000104a91:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104a95:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104a99:	0f b6 00             	movzbl (%rax),%eax
ffff800000104a9c:	0f be c0             	movsbl %al,%eax
ffff800000104a9f:	83 e8 20             	sub    $0x20,%eax
ffff800000104aa2:	83 f8 10             	cmp    $0x10,%eax
ffff800000104aa5:	77 3a                	ja     ffff800000104ae1 <vsprintf+0xa5>
ffff800000104aa7:	89 c0                	mov    %eax,%eax
ffff800000104aa9:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000104ab0:	00 
ffff800000104ab1:	48 b8 00 2c 11 00 00 	movabs $0xffff800000112c00,%rax
ffff800000104ab8:	80 ff ff 
ffff800000104abb:	48 01 d0             	add    %rdx,%rax
ffff800000104abe:	48 8b 00             	mov    (%rax),%rax
ffff800000104ac1:	ff e0                	jmpq   *%rax
ffff800000104ac3:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
ffff800000104ac7:	eb c0                	jmp    ffff800000104a89 <vsprintf+0x4d>
ffff800000104ac9:	83 4d ec 04          	orl    $0x4,-0x14(%rbp)
ffff800000104acd:	eb ba                	jmp    ffff800000104a89 <vsprintf+0x4d>
ffff800000104acf:	83 4d ec 08          	orl    $0x8,-0x14(%rbp)
ffff800000104ad3:	eb b4                	jmp    ffff800000104a89 <vsprintf+0x4d>
ffff800000104ad5:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
ffff800000104ad9:	eb ae                	jmp    ffff800000104a89 <vsprintf+0x4d>
ffff800000104adb:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
ffff800000104adf:	eb a8                	jmp    ffff800000104a89 <vsprintf+0x4d>
ffff800000104ae1:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
ffff800000104ae8:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104aec:	0f b6 00             	movzbl (%rax),%eax
ffff800000104aef:	3c 2f                	cmp    $0x2f,%al
ffff800000104af1:	7e 23                	jle    ffff800000104b16 <vsprintf+0xda>
ffff800000104af3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104af7:	0f b6 00             	movzbl (%rax),%eax
ffff800000104afa:	3c 39                	cmp    $0x39,%al
ffff800000104afc:	7f 18                	jg     ffff800000104b16 <vsprintf+0xda>
ffff800000104afe:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000104b02:	48 89 c7             	mov    %rax,%rdi
ffff800000104b05:	48 b8 66 47 10 00 00 	movabs $0xffff800000104766,%rax
ffff800000104b0c:	80 ff ff 
ffff800000104b0f:	ff d0                	callq  *%rax
ffff800000104b11:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff800000104b14:	eb 6c                	jmp    ffff800000104b82 <vsprintf+0x146>
ffff800000104b16:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b1a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b1d:	3c 2a                	cmp    $0x2a,%al
ffff800000104b1f:	75 61                	jne    ffff800000104b82 <vsprintf+0x146>
ffff800000104b21:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b25:	48 83 c0 01          	add    $0x1,%rax
ffff800000104b29:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104b2d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b31:	8b 00                	mov    (%rax),%eax
ffff800000104b33:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104b36:	77 24                	ja     ffff800000104b5c <vsprintf+0x120>
ffff800000104b38:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b3c:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104b40:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b44:	8b 00                	mov    (%rax),%eax
ffff800000104b46:	89 c0                	mov    %eax,%eax
ffff800000104b48:	48 01 d0             	add    %rdx,%rax
ffff800000104b4b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b4f:	8b 12                	mov    (%rdx),%edx
ffff800000104b51:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104b54:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b58:	89 0a                	mov    %ecx,(%rdx)
ffff800000104b5a:	eb 14                	jmp    ffff800000104b70 <vsprintf+0x134>
ffff800000104b5c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104b60:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104b64:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104b68:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104b6c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104b70:	8b 00                	mov    (%rax),%eax
ffff800000104b72:	89 45 e8             	mov    %eax,-0x18(%rbp)
ffff800000104b75:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104b79:	79 07                	jns    ffff800000104b82 <vsprintf+0x146>
ffff800000104b7b:	f7 5d e8             	negl   -0x18(%rbp)
ffff800000104b7e:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
ffff800000104b82:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
ffff800000104b89:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b8d:	0f b6 00             	movzbl (%rax),%eax
ffff800000104b90:	3c 2e                	cmp    $0x2e,%al
ffff800000104b92:	0f 85 a6 00 00 00    	jne    ffff800000104c3e <vsprintf+0x202>
ffff800000104b98:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104b9c:	48 83 c0 01          	add    $0x1,%rax
ffff800000104ba0:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104ba4:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104ba8:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bab:	3c 2f                	cmp    $0x2f,%al
ffff800000104bad:	7e 23                	jle    ffff800000104bd2 <vsprintf+0x196>
ffff800000104baf:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104bb3:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bb6:	3c 39                	cmp    $0x39,%al
ffff800000104bb8:	7f 18                	jg     ffff800000104bd2 <vsprintf+0x196>
ffff800000104bba:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
ffff800000104bbe:	48 89 c7             	mov    %rax,%rdi
ffff800000104bc1:	48 b8 66 47 10 00 00 	movabs $0xffff800000104766,%rax
ffff800000104bc8:	80 ff ff 
ffff800000104bcb:	ff d0                	callq  *%rax
ffff800000104bcd:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104bd0:	eb 5f                	jmp    ffff800000104c31 <vsprintf+0x1f5>
ffff800000104bd2:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104bd6:	0f b6 00             	movzbl (%rax),%eax
ffff800000104bd9:	3c 2a                	cmp    $0x2a,%al
ffff800000104bdb:	75 54                	jne    ffff800000104c31 <vsprintf+0x1f5>
ffff800000104bdd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104be1:	48 83 c0 01          	add    $0x1,%rax
ffff800000104be5:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104be9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104bed:	8b 00                	mov    (%rax),%eax
ffff800000104bef:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104bf2:	77 24                	ja     ffff800000104c18 <vsprintf+0x1dc>
ffff800000104bf4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104bf8:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104bfc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104c00:	8b 00                	mov    (%rax),%eax
ffff800000104c02:	89 c0                	mov    %eax,%eax
ffff800000104c04:	48 01 d0             	add    %rdx,%rax
ffff800000104c07:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104c0b:	8b 12                	mov    (%rdx),%edx
ffff800000104c0d:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104c10:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104c14:	89 0a                	mov    %ecx,(%rdx)
ffff800000104c16:	eb 14                	jmp    ffff800000104c2c <vsprintf+0x1f0>
ffff800000104c18:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104c1c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104c20:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104c24:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104c28:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104c2c:	8b 00                	mov    (%rax),%eax
ffff800000104c2e:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104c31:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
ffff800000104c35:	79 07                	jns    ffff800000104c3e <vsprintf+0x202>
ffff800000104c37:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff800000104c3e:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
ffff800000104c45:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c49:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c4c:	3c 68                	cmp    $0x68,%al
ffff800000104c4e:	74 21                	je     ffff800000104c71 <vsprintf+0x235>
ffff800000104c50:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c54:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c57:	3c 6c                	cmp    $0x6c,%al
ffff800000104c59:	74 16                	je     ffff800000104c71 <vsprintf+0x235>
ffff800000104c5b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c5f:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c62:	3c 4c                	cmp    $0x4c,%al
ffff800000104c64:	74 0b                	je     ffff800000104c71 <vsprintf+0x235>
ffff800000104c66:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c6a:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c6d:	3c 5a                	cmp    $0x5a,%al
ffff800000104c6f:	75 19                	jne    ffff800000104c8a <vsprintf+0x24e>
ffff800000104c71:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c75:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c78:	0f be c0             	movsbl %al,%eax
ffff800000104c7b:	89 45 d8             	mov    %eax,-0x28(%rbp)
ffff800000104c7e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c82:	48 83 c0 01          	add    $0x1,%rax
ffff800000104c86:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000104c8a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000104c8e:	0f b6 00             	movzbl (%rax),%eax
ffff800000104c91:	0f be c0             	movsbl %al,%eax
ffff800000104c94:	83 e8 25             	sub    $0x25,%eax
ffff800000104c97:	83 f8 53             	cmp    $0x53,%eax
ffff800000104c9a:	0f 87 2b 06 00 00    	ja     ffff8000001052cb <vsprintf+0x88f>
ffff800000104ca0:	89 c0                	mov    %eax,%eax
ffff800000104ca2:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
ffff800000104ca9:	00 
ffff800000104caa:	48 b8 88 2c 11 00 00 	movabs $0xffff800000112c88,%rax
ffff800000104cb1:	80 ff ff 
ffff800000104cb4:	48 01 d0             	add    %rdx,%rax
ffff800000104cb7:	48 8b 00             	mov    (%rax),%rax
ffff800000104cba:	ff e0                	jmpq   *%rax
ffff800000104cbc:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104cbf:	83 e0 10             	and    $0x10,%eax
ffff800000104cc2:	85 c0                	test   %eax,%eax
ffff800000104cc4:	75 1b                	jne    ffff800000104ce1 <vsprintf+0x2a5>
ffff800000104cc6:	eb 0f                	jmp    ffff800000104cd7 <vsprintf+0x29b>
ffff800000104cc8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104ccc:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104cd0:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104cd4:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104cd7:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
ffff800000104cdb:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104cdf:	7f e7                	jg     ffff800000104cc8 <vsprintf+0x28c>
ffff800000104ce1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ce5:	8b 00                	mov    (%rax),%eax
ffff800000104ce7:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104cea:	77 24                	ja     ffff800000104d10 <vsprintf+0x2d4>
ffff800000104cec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104cf0:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104cf4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104cf8:	8b 00                	mov    (%rax),%eax
ffff800000104cfa:	89 c0                	mov    %eax,%eax
ffff800000104cfc:	48 01 d0             	add    %rdx,%rax
ffff800000104cff:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d03:	8b 12                	mov    (%rdx),%edx
ffff800000104d05:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d08:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d0c:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d0e:	eb 14                	jmp    ffff800000104d24 <vsprintf+0x2e8>
ffff800000104d10:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d14:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d18:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d1c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d20:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d24:	8b 08                	mov    (%rax),%ecx
ffff800000104d26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104d2a:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d2e:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104d32:	89 ca                	mov    %ecx,%edx
ffff800000104d34:	88 10                	mov    %dl,(%rax)
ffff800000104d36:	eb 0f                	jmp    ffff800000104d47 <vsprintf+0x30b>
ffff800000104d38:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104d3c:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104d40:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104d44:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104d47:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
ffff800000104d4b:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
ffff800000104d4f:	7f e7                	jg     ffff800000104d38 <vsprintf+0x2fc>
ffff800000104d51:	e9 b3 05 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104d56:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d5a:	8b 00                	mov    (%rax),%eax
ffff800000104d5c:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104d5f:	77 24                	ja     ffff800000104d85 <vsprintf+0x349>
ffff800000104d61:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d65:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104d69:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d6d:	8b 00                	mov    (%rax),%eax
ffff800000104d6f:	89 c0                	mov    %eax,%eax
ffff800000104d71:	48 01 d0             	add    %rdx,%rax
ffff800000104d74:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d78:	8b 12                	mov    (%rdx),%edx
ffff800000104d7a:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104d7d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d81:	89 0a                	mov    %ecx,(%rdx)
ffff800000104d83:	eb 14                	jmp    ffff800000104d99 <vsprintf+0x35d>
ffff800000104d85:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104d89:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104d8d:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104d91:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104d95:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104d99:	48 8b 00             	mov    (%rax),%rax
ffff800000104d9c:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104da0:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
ffff800000104da5:	75 08                	jne    ffff800000104daf <vsprintf+0x373>
ffff800000104da7:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000104dae:	00 
ffff800000104daf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000104db3:	48 89 c7             	mov    %rax,%rdi
ffff800000104db6:	48 b8 48 46 10 00 00 	movabs $0xffff800000104648,%rax
ffff800000104dbd:	80 ff ff 
ffff800000104dc0:	ff d0                	callq  *%rax
ffff800000104dc2:	89 45 e0             	mov    %eax,-0x20(%rbp)
ffff800000104dc5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
ffff800000104dc9:	79 08                	jns    ffff800000104dd3 <vsprintf+0x397>
ffff800000104dcb:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000104dce:	89 45 e4             	mov    %eax,-0x1c(%rbp)
ffff800000104dd1:	eb 0e                	jmp    ffff800000104de1 <vsprintf+0x3a5>
ffff800000104dd3:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000104dd6:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
ffff800000104dd9:	7e 06                	jle    ffff800000104de1 <vsprintf+0x3a5>
ffff800000104ddb:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000104dde:	89 45 e0             	mov    %eax,-0x20(%rbp)
ffff800000104de1:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000104de4:	83 e0 10             	and    $0x10,%eax
ffff800000104de7:	85 c0                	test   %eax,%eax
ffff800000104de9:	75 1f                	jne    ffff800000104e0a <vsprintf+0x3ce>
ffff800000104deb:	eb 0f                	jmp    ffff800000104dfc <vsprintf+0x3c0>
ffff800000104ded:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104df1:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104df5:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104df9:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104dfc:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000104dff:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104e02:	89 55 e8             	mov    %edx,-0x18(%rbp)
ffff800000104e05:	39 45 e0             	cmp    %eax,-0x20(%rbp)
ffff800000104e08:	7c e3                	jl     ffff800000104ded <vsprintf+0x3b1>
ffff800000104e0a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
ffff800000104e11:	eb 21                	jmp    ffff800000104e34 <vsprintf+0x3f8>
ffff800000104e13:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000104e17:	48 8d 42 01          	lea    0x1(%rdx),%rax
ffff800000104e1b:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff800000104e1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104e23:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff800000104e27:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff800000104e2b:	0f b6 12             	movzbl (%rdx),%edx
ffff800000104e2e:	88 10                	mov    %dl,(%rax)
ffff800000104e30:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
ffff800000104e34:	8b 45 dc             	mov    -0x24(%rbp),%eax
ffff800000104e37:	3b 45 e0             	cmp    -0x20(%rbp),%eax
ffff800000104e3a:	7c d7                	jl     ffff800000104e13 <vsprintf+0x3d7>
ffff800000104e3c:	eb 0f                	jmp    ffff800000104e4d <vsprintf+0x411>
ffff800000104e3e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104e42:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000104e46:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff800000104e4a:	c6 00 20             	movb   $0x20,(%rax)
ffff800000104e4d:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000104e50:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000104e53:	89 55 e8             	mov    %edx,-0x18(%rbp)
ffff800000104e56:	39 45 e0             	cmp    %eax,-0x20(%rbp)
ffff800000104e59:	7c e3                	jl     ffff800000104e3e <vsprintf+0x402>
ffff800000104e5b:	e9 a9 04 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104e60:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff800000104e64:	75 7e                	jne    ffff800000104ee4 <vsprintf+0x4a8>
ffff800000104e66:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e6a:	8b 00                	mov    (%rax),%eax
ffff800000104e6c:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104e6f:	77 24                	ja     ffff800000104e95 <vsprintf+0x459>
ffff800000104e71:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e75:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104e79:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e7d:	8b 00                	mov    (%rax),%eax
ffff800000104e7f:	89 c0                	mov    %eax,%eax
ffff800000104e81:	48 01 d0             	add    %rdx,%rax
ffff800000104e84:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104e88:	8b 12                	mov    (%rdx),%edx
ffff800000104e8a:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104e8d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104e91:	89 0a                	mov    %ecx,(%rdx)
ffff800000104e93:	eb 14                	jmp    ffff800000104ea9 <vsprintf+0x46d>
ffff800000104e95:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104e99:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104e9d:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104ea1:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104ea5:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104ea9:	48 8b 00             	mov    (%rax),%rax
ffff800000104eac:	48 89 c7             	mov    %rax,%rdi
ffff800000104eaf:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104eb2:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104eb5:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104eb8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104ebc:	41 89 f1             	mov    %esi,%r9d
ffff800000104ebf:	41 89 c8             	mov    %ecx,%r8d
ffff800000104ec2:	89 d1                	mov    %edx,%ecx
ffff800000104ec4:	ba 08 00 00 00       	mov    $0x8,%edx
ffff800000104ec9:	48 89 fe             	mov    %rdi,%rsi
ffff800000104ecc:	48 89 c7             	mov    %rax,%rdi
ffff800000104ecf:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff800000104ed6:	80 ff ff 
ffff800000104ed9:	ff d0                	callq  *%rax
ffff800000104edb:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104edf:	e9 25 04 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104ee4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ee8:	8b 00                	mov    (%rax),%eax
ffff800000104eea:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104eed:	77 24                	ja     ffff800000104f13 <vsprintf+0x4d7>
ffff800000104eef:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ef3:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104ef7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104efb:	8b 00                	mov    (%rax),%eax
ffff800000104efd:	89 c0                	mov    %eax,%eax
ffff800000104eff:	48 01 d0             	add    %rdx,%rax
ffff800000104f02:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f06:	8b 12                	mov    (%rdx),%edx
ffff800000104f08:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104f0b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f0f:	89 0a                	mov    %ecx,(%rdx)
ffff800000104f11:	eb 14                	jmp    ffff800000104f27 <vsprintf+0x4eb>
ffff800000104f13:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f17:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104f1b:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104f1f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f23:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104f27:	8b 00                	mov    (%rax),%eax
ffff800000104f29:	89 c7                	mov    %eax,%edi
ffff800000104f2b:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104f2e:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104f31:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104f34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104f38:	41 89 f1             	mov    %esi,%r9d
ffff800000104f3b:	41 89 c8             	mov    %ecx,%r8d
ffff800000104f3e:	89 d1                	mov    %edx,%ecx
ffff800000104f40:	ba 08 00 00 00       	mov    $0x8,%edx
ffff800000104f45:	48 89 fe             	mov    %rdi,%rsi
ffff800000104f48:	48 89 c7             	mov    %rax,%rdi
ffff800000104f4b:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff800000104f52:	80 ff ff 
ffff800000104f55:	ff d0                	callq  *%rax
ffff800000104f57:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104f5b:	e9 a9 03 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104f60:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
ffff800000104f64:	75 0b                	jne    ffff800000104f71 <vsprintf+0x535>
ffff800000104f66:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%rbp)
ffff800000104f6d:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
ffff800000104f71:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f75:	8b 00                	mov    (%rax),%eax
ffff800000104f77:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000104f7a:	77 24                	ja     ffff800000104fa0 <vsprintf+0x564>
ffff800000104f7c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f80:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000104f84:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104f88:	8b 00                	mov    (%rax),%eax
ffff800000104f8a:	89 c0                	mov    %eax,%eax
ffff800000104f8c:	48 01 d0             	add    %rdx,%rax
ffff800000104f8f:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f93:	8b 12                	mov    (%rdx),%edx
ffff800000104f95:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000104f98:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104f9c:	89 0a                	mov    %ecx,(%rdx)
ffff800000104f9e:	eb 14                	jmp    ffff800000104fb4 <vsprintf+0x578>
ffff800000104fa0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104fa4:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000104fa8:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000104fac:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000104fb0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000104fb4:	48 8b 00             	mov    (%rax),%rax
ffff800000104fb7:	48 89 c7             	mov    %rax,%rdi
ffff800000104fba:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000104fbd:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000104fc0:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000104fc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000104fc7:	41 89 f1             	mov    %esi,%r9d
ffff800000104fca:	41 89 c8             	mov    %ecx,%r8d
ffff800000104fcd:	89 d1                	mov    %edx,%ecx
ffff800000104fcf:	ba 10 00 00 00       	mov    $0x10,%edx
ffff800000104fd4:	48 89 fe             	mov    %rdi,%rsi
ffff800000104fd7:	48 89 c7             	mov    %rax,%rdi
ffff800000104fda:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff800000104fe1:	80 ff ff 
ffff800000104fe4:	ff d0                	callq  *%rax
ffff800000104fe6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000104fea:	e9 1a 03 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000104fef:	83 4d ec 40          	orl    $0x40,-0x14(%rbp)
ffff800000104ff3:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff800000104ff7:	75 7e                	jne    ffff800000105077 <vsprintf+0x63b>
ffff800000104ff9:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000104ffd:	8b 00                	mov    (%rax),%eax
ffff800000104fff:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105002:	77 24                	ja     ffff800000105028 <vsprintf+0x5ec>
ffff800000105004:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105008:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff80000010500c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105010:	8b 00                	mov    (%rax),%eax
ffff800000105012:	89 c0                	mov    %eax,%eax
ffff800000105014:	48 01 d0             	add    %rdx,%rax
ffff800000105017:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010501b:	8b 12                	mov    (%rdx),%edx
ffff80000010501d:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105020:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105024:	89 0a                	mov    %ecx,(%rdx)
ffff800000105026:	eb 14                	jmp    ffff80000010503c <vsprintf+0x600>
ffff800000105028:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010502c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105030:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000105034:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105038:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff80000010503c:	48 8b 00             	mov    (%rax),%rax
ffff80000010503f:	48 89 c7             	mov    %rax,%rdi
ffff800000105042:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000105045:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000105048:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff80000010504b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010504f:	41 89 f1             	mov    %esi,%r9d
ffff800000105052:	41 89 c8             	mov    %ecx,%r8d
ffff800000105055:	89 d1                	mov    %edx,%ecx
ffff800000105057:	ba 10 00 00 00       	mov    $0x10,%edx
ffff80000010505c:	48 89 fe             	mov    %rdi,%rsi
ffff80000010505f:	48 89 c7             	mov    %rax,%rdi
ffff800000105062:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff800000105069:	80 ff ff 
ffff80000010506c:	ff d0                	callq  *%rax
ffff80000010506e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105072:	e9 92 02 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff800000105077:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010507b:	8b 00                	mov    (%rax),%eax
ffff80000010507d:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105080:	77 24                	ja     ffff8000001050a6 <vsprintf+0x66a>
ffff800000105082:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105086:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff80000010508a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010508e:	8b 00                	mov    (%rax),%eax
ffff800000105090:	89 c0                	mov    %eax,%eax
ffff800000105092:	48 01 d0             	add    %rdx,%rax
ffff800000105095:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105099:	8b 12                	mov    (%rdx),%edx
ffff80000010509b:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff80000010509e:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001050a2:	89 0a                	mov    %ecx,(%rdx)
ffff8000001050a4:	eb 14                	jmp    ffff8000001050ba <vsprintf+0x67e>
ffff8000001050a6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001050aa:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001050ae:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff8000001050b2:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001050b6:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff8000001050ba:	8b 00                	mov    (%rax),%eax
ffff8000001050bc:	89 c7                	mov    %eax,%edi
ffff8000001050be:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff8000001050c1:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff8000001050c4:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff8000001050c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001050cb:	41 89 f1             	mov    %esi,%r9d
ffff8000001050ce:	41 89 c8             	mov    %ecx,%r8d
ffff8000001050d1:	89 d1                	mov    %edx,%ecx
ffff8000001050d3:	ba 10 00 00 00       	mov    $0x10,%edx
ffff8000001050d8:	48 89 fe             	mov    %rdi,%rsi
ffff8000001050db:	48 89 c7             	mov    %rax,%rdi
ffff8000001050de:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff8000001050e5:	80 ff ff 
ffff8000001050e8:	ff d0                	callq  *%rax
ffff8000001050ea:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001050ee:	e9 16 02 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff8000001050f3:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
ffff8000001050f7:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff8000001050fb:	75 7e                	jne    ffff80000010517b <vsprintf+0x73f>
ffff8000001050fd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105101:	8b 00                	mov    (%rax),%eax
ffff800000105103:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105106:	77 24                	ja     ffff80000010512c <vsprintf+0x6f0>
ffff800000105108:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010510c:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105110:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105114:	8b 00                	mov    (%rax),%eax
ffff800000105116:	89 c0                	mov    %eax,%eax
ffff800000105118:	48 01 d0             	add    %rdx,%rax
ffff80000010511b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010511f:	8b 12                	mov    (%rdx),%edx
ffff800000105121:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105124:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105128:	89 0a                	mov    %ecx,(%rdx)
ffff80000010512a:	eb 14                	jmp    ffff800000105140 <vsprintf+0x704>
ffff80000010512c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105130:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105134:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000105138:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010513c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105140:	48 8b 00             	mov    (%rax),%rax
ffff800000105143:	48 89 c7             	mov    %rax,%rdi
ffff800000105146:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000105149:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff80000010514c:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff80000010514f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105153:	41 89 f1             	mov    %esi,%r9d
ffff800000105156:	41 89 c8             	mov    %ecx,%r8d
ffff800000105159:	89 d1                	mov    %edx,%ecx
ffff80000010515b:	ba 0a 00 00 00       	mov    $0xa,%edx
ffff800000105160:	48 89 fe             	mov    %rdi,%rsi
ffff800000105163:	48 89 c7             	mov    %rax,%rdi
ffff800000105166:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff80000010516d:	80 ff ff 
ffff800000105170:	ff d0                	callq  *%rax
ffff800000105172:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105176:	e9 8e 01 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff80000010517b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010517f:	8b 00                	mov    (%rax),%eax
ffff800000105181:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105184:	77 24                	ja     ffff8000001051aa <vsprintf+0x76e>
ffff800000105186:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010518a:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff80000010518e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105192:	8b 00                	mov    (%rax),%eax
ffff800000105194:	89 c0                	mov    %eax,%eax
ffff800000105196:	48 01 d0             	add    %rdx,%rax
ffff800000105199:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010519d:	8b 12                	mov    (%rdx),%edx
ffff80000010519f:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff8000001051a2:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001051a6:	89 0a                	mov    %ecx,(%rdx)
ffff8000001051a8:	eb 14                	jmp    ffff8000001051be <vsprintf+0x782>
ffff8000001051aa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff8000001051ae:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001051b2:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff8000001051b6:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff8000001051ba:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff8000001051be:	8b 00                	mov    (%rax),%eax
ffff8000001051c0:	89 c7                	mov    %eax,%edi
ffff8000001051c2:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff8000001051c5:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff8000001051c8:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff8000001051cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001051cf:	41 89 f1             	mov    %esi,%r9d
ffff8000001051d2:	41 89 c8             	mov    %ecx,%r8d
ffff8000001051d5:	89 d1                	mov    %edx,%ecx
ffff8000001051d7:	ba 0a 00 00 00       	mov    $0xa,%edx
ffff8000001051dc:	48 89 fe             	mov    %rdi,%rsi
ffff8000001051df:	48 89 c7             	mov    %rax,%rdi
ffff8000001051e2:	48 b8 c6 47 10 00 00 	movabs $0xffff8000001047c6,%rax
ffff8000001051e9:	80 ff ff 
ffff8000001051ec:	ff d0                	callq  *%rax
ffff8000001051ee:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001051f2:	e9 12 01 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff8000001051f7:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
ffff8000001051fb:	75 61                	jne    ffff80000010525e <vsprintf+0x822>
ffff8000001051fd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105201:	8b 00                	mov    (%rax),%eax
ffff800000105203:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105206:	77 24                	ja     ffff80000010522c <vsprintf+0x7f0>
ffff800000105208:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010520c:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105210:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105214:	8b 00                	mov    (%rax),%eax
ffff800000105216:	89 c0                	mov    %eax,%eax
ffff800000105218:	48 01 d0             	add    %rdx,%rax
ffff80000010521b:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010521f:	8b 12                	mov    (%rdx),%edx
ffff800000105221:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105224:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105228:	89 0a                	mov    %ecx,(%rdx)
ffff80000010522a:	eb 14                	jmp    ffff800000105240 <vsprintf+0x804>
ffff80000010522c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105230:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105234:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000105238:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010523c:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff800000105240:	48 8b 00             	mov    (%rax),%rax
ffff800000105243:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000105247:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010524b:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff80000010524f:	48 89 c2             	mov    %rax,%rdx
ffff800000105252:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000105256:	48 89 10             	mov    %rdx,(%rax)
ffff800000105259:	e9 ab 00 00 00       	jmpq   ffff800000105309 <vsprintf+0x8cd>
ffff80000010525e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105262:	8b 00                	mov    (%rax),%eax
ffff800000105264:	83 f8 2f             	cmp    $0x2f,%eax
ffff800000105267:	77 24                	ja     ffff80000010528d <vsprintf+0x851>
ffff800000105269:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff80000010526d:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffff800000105271:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105275:	8b 00                	mov    (%rax),%eax
ffff800000105277:	89 c0                	mov    %eax,%eax
ffff800000105279:	48 01 d0             	add    %rdx,%rax
ffff80000010527c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105280:	8b 12                	mov    (%rdx),%edx
ffff800000105282:	8d 4a 08             	lea    0x8(%rdx),%ecx
ffff800000105285:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff800000105289:	89 0a                	mov    %ecx,(%rdx)
ffff80000010528b:	eb 14                	jmp    ffff8000001052a1 <vsprintf+0x865>
ffff80000010528d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000105291:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000105295:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000105299:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
ffff80000010529d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
ffff8000001052a1:	48 8b 00             	mov    (%rax),%rax
ffff8000001052a4:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001052a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052ac:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff8000001052b0:	89 c2                	mov    %eax,%edx
ffff8000001052b2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001052b6:	89 10                	mov    %edx,(%rax)
ffff8000001052b8:	eb 4f                	jmp    ffff800000105309 <vsprintf+0x8cd>
ffff8000001052ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052be:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001052c2:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff8000001052c6:	c6 00 25             	movb   $0x25,(%rax)
ffff8000001052c9:	eb 3e                	jmp    ffff800000105309 <vsprintf+0x8cd>
ffff8000001052cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052cf:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001052d3:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
ffff8000001052d7:	c6 00 25             	movb   $0x25,(%rax)
ffff8000001052da:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001052de:	0f b6 00             	movzbl (%rax),%eax
ffff8000001052e1:	84 c0                	test   %al,%al
ffff8000001052e3:	74 17                	je     ffff8000001052fc <vsprintf+0x8c0>
ffff8000001052e5:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff8000001052e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001052ed:	48 8d 48 01          	lea    0x1(%rax),%rcx
ffff8000001052f1:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
ffff8000001052f5:	0f b6 12             	movzbl (%rdx),%edx
ffff8000001052f8:	88 10                	mov    %dl,(%rax)
ffff8000001052fa:	eb 0c                	jmp    ffff800000105308 <vsprintf+0x8cc>
ffff8000001052fc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000105300:	48 83 e8 01          	sub    $0x1,%rax
ffff800000105304:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000105308:	90                   	nop
ffff800000105309:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010530d:	48 83 c0 01          	add    $0x1,%rax
ffff800000105311:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000105315:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000105319:	0f b6 00             	movzbl (%rax),%eax
ffff80000010531c:	84 c0                	test   %al,%al
ffff80000010531e:	0f 85 39 f7 ff ff    	jne    ffff800000104a5d <vsprintf+0x21>
ffff800000105324:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105328:	c6 00 00             	movb   $0x0,(%rax)
ffff80000010532b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010532f:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
ffff800000105333:	c9                   	leaveq 
ffff800000105334:	c3                   	retq   

ffff800000105335 <color_printk>:
ffff800000105335:	55                   	push   %rbp
ffff800000105336:	48 89 e5             	mov    %rsp,%rbp
ffff800000105339:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
ffff800000105340:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
ffff800000105346:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
ffff80000010534c:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
ffff800000105353:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
ffff80000010535a:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
ffff800000105361:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
ffff800000105368:	84 c0                	test   %al,%al
ffff80000010536a:	74 20                	je     ffff80000010538c <color_printk+0x57>
ffff80000010536c:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
ffff800000105370:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
ffff800000105374:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
ffff800000105378:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
ffff80000010537c:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
ffff800000105380:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
ffff800000105384:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
ffff800000105388:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
ffff80000010538c:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%rbp)
ffff800000105393:	00 00 00 
ffff800000105396:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
ffff80000010539d:	00 00 00 
ffff8000001053a0:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%rbp)
ffff8000001053a7:	00 00 00 
ffff8000001053aa:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
ffff8000001053b1:	00 00 00 
ffff8000001053b4:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
ffff8000001053bb:	00 00 00 
ffff8000001053be:	48 8d 45 10          	lea    0x10(%rbp),%rax
ffff8000001053c2:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
ffff8000001053c9:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
ffff8000001053d0:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
ffff8000001053d7:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
ffff8000001053de:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
ffff8000001053e5:	48 89 c6             	mov    %rax,%rsi
ffff8000001053e8:	48 bf 00 80 12 00 00 	movabs $0xffff800000128000,%rdi
ffff8000001053ef:	80 ff ff 
ffff8000001053f2:	48 b8 3c 4a 10 00 00 	movabs $0xffff800000104a3c,%rax
ffff8000001053f9:	80 ff ff 
ffff8000001053fc:	ff d0                	callq  *%rax
ffff8000001053fe:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%rbp)
ffff800000105404:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
ffff80000010540b:	00 00 00 
ffff80000010540e:	e9 24 04 00 00       	jmpq   ffff800000105837 <color_printk+0x502>
ffff800000105413:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
ffff80000010541a:	7e 0c                	jle    ffff800000105428 <color_printk+0xf3>
ffff80000010541c:	83 ad 4c ff ff ff 01 	subl   $0x1,-0xb4(%rbp)
ffff800000105423:	e9 17 02 00 00       	jmpq   ffff80000010563f <color_printk+0x30a>
ffff800000105428:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff80000010542e:	48 98                	cltq   
ffff800000105430:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff800000105437:	80 ff ff 
ffff80000010543a:	48 01 d0             	add    %rdx,%rax
ffff80000010543d:	0f b6 00             	movzbl (%rax),%eax
ffff800000105440:	3c 0a                	cmp    $0xa,%al
ffff800000105442:	75 33                	jne    ffff800000105477 <color_printk+0x142>
ffff800000105444:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010544b:	80 ff ff 
ffff80000010544e:	8b 40 0c             	mov    0xc(%rax),%eax
ffff800000105451:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105454:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010545b:	80 ff ff 
ffff80000010545e:	89 50 0c             	mov    %edx,0xc(%rax)
ffff800000105461:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105468:	80 ff ff 
ffff80000010546b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffff800000105472:	e9 1f 03 00 00       	jmpq   ffff800000105796 <color_printk+0x461>
ffff800000105477:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff80000010547d:	48 98                	cltq   
ffff80000010547f:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff800000105486:	80 ff ff 
ffff800000105489:	48 01 d0             	add    %rdx,%rax
ffff80000010548c:	0f b6 00             	movzbl (%rax),%eax
ffff80000010548f:	3c 08                	cmp    $0x8,%al
ffff800000105491:	0f 85 5c 01 00 00    	jne    ffff8000001055f3 <color_printk+0x2be>
ffff800000105497:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010549e:	80 ff ff 
ffff8000001054a1:	8b 40 08             	mov    0x8(%rax),%eax
ffff8000001054a4:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001054a7:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054ae:	80 ff ff 
ffff8000001054b1:	89 50 08             	mov    %edx,0x8(%rax)
ffff8000001054b4:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054bb:	80 ff ff 
ffff8000001054be:	8b 40 08             	mov    0x8(%rax),%eax
ffff8000001054c1:	85 c0                	test   %eax,%eax
ffff8000001054c3:	0f 89 a7 00 00 00    	jns    ffff800000105570 <color_printk+0x23b>
ffff8000001054c9:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054d0:	80 ff ff 
ffff8000001054d3:	8b 00                	mov    (%rax),%eax
ffff8000001054d5:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001054dc:	80 ff ff 
ffff8000001054df:	8b 72 10             	mov    0x10(%rdx),%esi
ffff8000001054e2:	99                   	cltd   
ffff8000001054e3:	f7 fe                	idiv   %esi
ffff8000001054e5:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff8000001054e8:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001054ef:	80 ff ff 
ffff8000001054f2:	8b 40 10             	mov    0x10(%rax),%eax
ffff8000001054f5:	0f af c2             	imul   %edx,%eax
ffff8000001054f8:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001054ff:	80 ff ff 
ffff800000105502:	89 42 08             	mov    %eax,0x8(%rdx)
ffff800000105505:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010550c:	80 ff ff 
ffff80000010550f:	8b 40 0c             	mov    0xc(%rax),%eax
ffff800000105512:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105515:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010551c:	80 ff ff 
ffff80000010551f:	89 50 0c             	mov    %edx,0xc(%rax)
ffff800000105522:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105529:	80 ff ff 
ffff80000010552c:	8b 40 0c             	mov    0xc(%rax),%eax
ffff80000010552f:	85 c0                	test   %eax,%eax
ffff800000105531:	79 3d                	jns    ffff800000105570 <color_printk+0x23b>
ffff800000105533:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010553a:	80 ff ff 
ffff80000010553d:	8b 40 04             	mov    0x4(%rax),%eax
ffff800000105540:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff800000105547:	80 ff ff 
ffff80000010554a:	8b 7a 14             	mov    0x14(%rdx),%edi
ffff80000010554d:	99                   	cltd   
ffff80000010554e:	f7 ff                	idiv   %edi
ffff800000105550:	8d 50 ff             	lea    -0x1(%rax),%edx
ffff800000105553:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010555a:	80 ff ff 
ffff80000010555d:	8b 40 14             	mov    0x14(%rax),%eax
ffff800000105560:	0f af c2             	imul   %edx,%eax
ffff800000105563:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff80000010556a:	80 ff ff 
ffff80000010556d:	89 42 0c             	mov    %eax,0xc(%rdx)
ffff800000105570:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105577:	80 ff ff 
ffff80000010557a:	8b 50 0c             	mov    0xc(%rax),%edx
ffff80000010557d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105584:	80 ff ff 
ffff800000105587:	8b 40 14             	mov    0x14(%rax),%eax
ffff80000010558a:	89 d1                	mov    %edx,%ecx
ffff80000010558c:	0f af c8             	imul   %eax,%ecx
ffff80000010558f:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105596:	80 ff ff 
ffff800000105599:	8b 50 08             	mov    0x8(%rax),%edx
ffff80000010559c:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001055a3:	80 ff ff 
ffff8000001055a6:	8b 40 10             	mov    0x10(%rax),%eax
ffff8000001055a9:	0f af d0             	imul   %eax,%edx
ffff8000001055ac:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001055b3:	80 ff ff 
ffff8000001055b6:	8b 30                	mov    (%rax),%esi
ffff8000001055b8:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001055bf:	80 ff ff 
ffff8000001055c2:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001055c6:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
ffff8000001055cd:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
ffff8000001055d3:	6a 20                	pushq  $0x20
ffff8000001055d5:	45 89 c1             	mov    %r8d,%r9d
ffff8000001055d8:	41 89 f8             	mov    %edi,%r8d
ffff8000001055db:	48 89 c7             	mov    %rax,%rdi
ffff8000001055de:	48 b8 77 46 10 00 00 	movabs $0xffff800000104677,%rax
ffff8000001055e5:	80 ff ff 
ffff8000001055e8:	ff d0                	callq  *%rax
ffff8000001055ea:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001055ee:	e9 a3 01 00 00       	jmpq   ffff800000105796 <color_printk+0x461>
ffff8000001055f3:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff8000001055f9:	48 98                	cltq   
ffff8000001055fb:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff800000105602:	80 ff ff 
ffff800000105605:	48 01 d0             	add    %rdx,%rax
ffff800000105608:	0f b6 00             	movzbl (%rax),%eax
ffff80000010560b:	3c 09                	cmp    $0x9,%al
ffff80000010560d:	0f 85 d3 00 00 00    	jne    ffff8000001056e6 <color_printk+0x3b1>
ffff800000105613:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010561a:	80 ff ff 
ffff80000010561d:	8b 40 08             	mov    0x8(%rax),%eax
ffff800000105620:	83 c0 08             	add    $0x8,%eax
ffff800000105623:	83 e0 f8             	and    $0xfffffff8,%eax
ffff800000105626:	89 c2                	mov    %eax,%edx
ffff800000105628:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010562f:	80 ff ff 
ffff800000105632:	8b 48 08             	mov    0x8(%rax),%ecx
ffff800000105635:	89 d0                	mov    %edx,%eax
ffff800000105637:	29 c8                	sub    %ecx,%eax
ffff800000105639:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%rbp)
ffff80000010563f:	83 ad 48 ff ff ff 01 	subl   $0x1,-0xb8(%rbp)
ffff800000105646:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010564d:	80 ff ff 
ffff800000105650:	8b 50 0c             	mov    0xc(%rax),%edx
ffff800000105653:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010565a:	80 ff ff 
ffff80000010565d:	8b 40 14             	mov    0x14(%rax),%eax
ffff800000105660:	89 d1                	mov    %edx,%ecx
ffff800000105662:	0f af c8             	imul   %eax,%ecx
ffff800000105665:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010566c:	80 ff ff 
ffff80000010566f:	8b 50 08             	mov    0x8(%rax),%edx
ffff800000105672:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105679:	80 ff ff 
ffff80000010567c:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010567f:	0f af d0             	imul   %eax,%edx
ffff800000105682:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105689:	80 ff ff 
ffff80000010568c:	8b 30                	mov    (%rax),%esi
ffff80000010568e:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105695:	80 ff ff 
ffff800000105698:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010569c:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
ffff8000001056a3:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
ffff8000001056a9:	6a 20                	pushq  $0x20
ffff8000001056ab:	45 89 c1             	mov    %r8d,%r9d
ffff8000001056ae:	41 89 f8             	mov    %edi,%r8d
ffff8000001056b1:	48 89 c7             	mov    %rax,%rdi
ffff8000001056b4:	48 b8 77 46 10 00 00 	movabs $0xffff800000104677,%rax
ffff8000001056bb:	80 ff ff 
ffff8000001056be:	ff d0                	callq  *%rax
ffff8000001056c0:	48 83 c4 08          	add    $0x8,%rsp
ffff8000001056c4:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001056cb:	80 ff ff 
ffff8000001056ce:	8b 40 08             	mov    0x8(%rax),%eax
ffff8000001056d1:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001056d4:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001056db:	80 ff ff 
ffff8000001056de:	89 50 08             	mov    %edx,0x8(%rax)
ffff8000001056e1:	e9 b0 00 00 00       	jmpq   ffff800000105796 <color_printk+0x461>
ffff8000001056e6:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff8000001056ec:	48 98                	cltq   
ffff8000001056ee:	48 ba 00 80 12 00 00 	movabs $0xffff800000128000,%rdx
ffff8000001056f5:	80 ff ff 
ffff8000001056f8:	48 01 d0             	add    %rdx,%rax
ffff8000001056fb:	0f b6 00             	movzbl (%rax),%eax
ffff8000001056fe:	0f b6 f8             	movzbl %al,%edi
ffff800000105701:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105708:	80 ff ff 
ffff80000010570b:	8b 50 0c             	mov    0xc(%rax),%edx
ffff80000010570e:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105715:	80 ff ff 
ffff800000105718:	8b 40 14             	mov    0x14(%rax),%eax
ffff80000010571b:	89 d1                	mov    %edx,%ecx
ffff80000010571d:	0f af c8             	imul   %eax,%ecx
ffff800000105720:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105727:	80 ff ff 
ffff80000010572a:	8b 50 08             	mov    0x8(%rax),%edx
ffff80000010572d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105734:	80 ff ff 
ffff800000105737:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010573a:	0f af d0             	imul   %eax,%edx
ffff80000010573d:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105744:	80 ff ff 
ffff800000105747:	8b 30                	mov    (%rax),%esi
ffff800000105749:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105750:	80 ff ff 
ffff800000105753:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000105757:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
ffff80000010575e:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
ffff800000105765:	57                   	push   %rdi
ffff800000105766:	48 89 c7             	mov    %rax,%rdi
ffff800000105769:	48 b8 77 46 10 00 00 	movabs $0xffff800000104677,%rax
ffff800000105770:	80 ff ff 
ffff800000105773:	ff d0                	callq  *%rax
ffff800000105775:	48 83 c4 08          	add    $0x8,%rsp
ffff800000105779:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105780:	80 ff ff 
ffff800000105783:	8b 40 08             	mov    0x8(%rax),%eax
ffff800000105786:	8d 50 01             	lea    0x1(%rax),%edx
ffff800000105789:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105790:	80 ff ff 
ffff800000105793:	89 50 08             	mov    %edx,0x8(%rax)
ffff800000105796:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff80000010579d:	80 ff ff 
ffff8000001057a0:	8b 48 08             	mov    0x8(%rax),%ecx
ffff8000001057a3:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057aa:	80 ff ff 
ffff8000001057ad:	8b 00                	mov    (%rax),%eax
ffff8000001057af:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff8000001057b6:	80 ff ff 
ffff8000001057b9:	8b 72 10             	mov    0x10(%rdx),%esi
ffff8000001057bc:	99                   	cltd   
ffff8000001057bd:	f7 fe                	idiv   %esi
ffff8000001057bf:	39 c1                	cmp    %eax,%ecx
ffff8000001057c1:	7c 2e                	jl     ffff8000001057f1 <color_printk+0x4bc>
ffff8000001057c3:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057ca:	80 ff ff 
ffff8000001057cd:	8b 40 0c             	mov    0xc(%rax),%eax
ffff8000001057d0:	8d 50 01             	lea    0x1(%rax),%edx
ffff8000001057d3:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057da:	80 ff ff 
ffff8000001057dd:	89 50 0c             	mov    %edx,0xc(%rax)
ffff8000001057e0:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057e7:	80 ff ff 
ffff8000001057ea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffff8000001057f1:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff8000001057f8:	80 ff ff 
ffff8000001057fb:	8b 48 0c             	mov    0xc(%rax),%ecx
ffff8000001057fe:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105805:	80 ff ff 
ffff800000105808:	8b 40 04             	mov    0x4(%rax),%eax
ffff80000010580b:	48 ba 00 90 12 00 00 	movabs $0xffff800000129000,%rdx
ffff800000105812:	80 ff ff 
ffff800000105815:	8b 7a 14             	mov    0x14(%rdx),%edi
ffff800000105818:	99                   	cltd   
ffff800000105819:	f7 ff                	idiv   %edi
ffff80000010581b:	39 c1                	cmp    %eax,%ecx
ffff80000010581d:	7c 11                	jl     ffff800000105830 <color_printk+0x4fb>
ffff80000010581f:	48 b8 00 90 12 00 00 	movabs $0xffff800000129000,%rax
ffff800000105826:	80 ff ff 
ffff800000105829:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
ffff800000105830:	83 85 4c ff ff ff 01 	addl   $0x1,-0xb4(%rbp)
ffff800000105837:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
ffff80000010583d:	3b 85 44 ff ff ff    	cmp    -0xbc(%rbp),%eax
ffff800000105843:	0f 8c ca fb ff ff    	jl     ffff800000105413 <color_printk+0xde>
ffff800000105849:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
ffff800000105850:	0f 85 bd fb ff ff    	jne    ffff800000105413 <color_printk+0xde>
ffff800000105856:	8b 85 44 ff ff ff    	mov    -0xbc(%rbp),%eax
ffff80000010585c:	c9                   	leaveq 
ffff80000010585d:	c3                   	retq   

ffff80000010585e <set_intr_gate>:
ffff80000010585e:	55                   	push   %rbp
ffff80000010585f:	48 89 e5             	mov    %rsp,%rbp
ffff800000105862:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000105865:	89 f0                	mov    %esi,%eax
ffff800000105867:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff80000010586b:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff80000010586e:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105871:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105875:	48 89 c2             	mov    %rax,%rdx
ffff800000105878:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff80000010587f:	80 ff ff 
ffff800000105882:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105886:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105889:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010588d:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105891:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff800000105898:	80 ff ff 
ffff80000010589b:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff80000010589f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001058a3:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff8000001058a9:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff8000001058ad:	48 89 c2             	mov    %rax,%rdx
ffff8000001058b0:	44 89 c0             	mov    %r8d,%eax
ffff8000001058b3:	66 89 d0             	mov    %dx,%ax
ffff8000001058b6:	48 83 e1 07          	and    $0x7,%rcx
ffff8000001058ba:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff8000001058c1:	48 c1 e1 20          	shl    $0x20,%rcx
ffff8000001058c5:	48 01 c8             	add    %rcx,%rax
ffff8000001058c8:	48 31 c9             	xor    %rcx,%rcx
ffff8000001058cb:	89 d1                	mov    %edx,%ecx
ffff8000001058cd:	48 c1 e9 10          	shr    $0x10,%rcx
ffff8000001058d1:	48 c1 e1 30          	shl    $0x30,%rcx
ffff8000001058d5:	48 01 c8             	add    %rcx,%rax
ffff8000001058d8:	48 89 06             	mov    %rax,(%rsi)
ffff8000001058db:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001058df:	48 89 17             	mov    %rdx,(%rdi)
ffff8000001058e2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001058e6:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff8000001058ea:	90                   	nop
ffff8000001058eb:	5d                   	pop    %rbp
ffff8000001058ec:	c3                   	retq   

ffff8000001058ed <set_trap_gate>:
ffff8000001058ed:	55                   	push   %rbp
ffff8000001058ee:	48 89 e5             	mov    %rsp,%rbp
ffff8000001058f1:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff8000001058f4:	89 f0                	mov    %esi,%eax
ffff8000001058f6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff8000001058fa:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff8000001058fd:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105900:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105904:	48 89 c2             	mov    %rax,%rdx
ffff800000105907:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff80000010590e:	80 ff ff 
ffff800000105911:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105915:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000105918:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010591c:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105920:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff800000105927:	80 ff ff 
ffff80000010592a:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff80000010592e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105932:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff800000105938:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff80000010593c:	48 89 c2             	mov    %rax,%rdx
ffff80000010593f:	44 89 c0             	mov    %r8d,%eax
ffff800000105942:	66 89 d0             	mov    %dx,%ax
ffff800000105945:	48 83 e1 07          	and    $0x7,%rcx
ffff800000105949:	48 81 c1 00 8f 00 00 	add    $0x8f00,%rcx
ffff800000105950:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000105954:	48 01 c8             	add    %rcx,%rax
ffff800000105957:	48 31 c9             	xor    %rcx,%rcx
ffff80000010595a:	89 d1                	mov    %edx,%ecx
ffff80000010595c:	48 c1 e9 10          	shr    $0x10,%rcx
ffff800000105960:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000105964:	48 01 c8             	add    %rcx,%rax
ffff800000105967:	48 89 06             	mov    %rax,(%rsi)
ffff80000010596a:	48 c1 ea 20          	shr    $0x20,%rdx
ffff80000010596e:	48 89 17             	mov    %rdx,(%rdi)
ffff800000105971:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105975:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000105979:	90                   	nop
ffff80000010597a:	5d                   	pop    %rbp
ffff80000010597b:	c3                   	retq   

ffff80000010597c <set_system_gate>:
ffff80000010597c:	55                   	push   %rbp
ffff80000010597d:	48 89 e5             	mov    %rsp,%rbp
ffff800000105980:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000105983:	89 f0                	mov    %esi,%eax
ffff800000105985:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff800000105989:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff80000010598c:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010598f:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105993:	48 89 c2             	mov    %rax,%rdx
ffff800000105996:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff80000010599d:	80 ff ff 
ffff8000001059a0:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff8000001059a4:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001059a7:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001059ab:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001059af:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff8000001059b6:	80 ff ff 
ffff8000001059b9:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff8000001059bd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001059c1:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff8000001059c7:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff8000001059cb:	48 89 c2             	mov    %rax,%rdx
ffff8000001059ce:	44 89 c0             	mov    %r8d,%eax
ffff8000001059d1:	66 89 d0             	mov    %dx,%ax
ffff8000001059d4:	48 83 e1 07          	and    $0x7,%rcx
ffff8000001059d8:	48 81 c1 00 ef 00 00 	add    $0xef00,%rcx
ffff8000001059df:	48 c1 e1 20          	shl    $0x20,%rcx
ffff8000001059e3:	48 01 c8             	add    %rcx,%rax
ffff8000001059e6:	48 31 c9             	xor    %rcx,%rcx
ffff8000001059e9:	89 d1                	mov    %edx,%ecx
ffff8000001059eb:	48 c1 e9 10          	shr    $0x10,%rcx
ffff8000001059ef:	48 c1 e1 30          	shl    $0x30,%rcx
ffff8000001059f3:	48 01 c8             	add    %rcx,%rax
ffff8000001059f6:	48 89 06             	mov    %rax,(%rsi)
ffff8000001059f9:	48 c1 ea 20          	shr    $0x20,%rdx
ffff8000001059fd:	48 89 17             	mov    %rdx,(%rdi)
ffff800000105a00:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000105a04:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000105a08:	90                   	nop
ffff800000105a09:	5d                   	pop    %rbp
ffff800000105a0a:	c3                   	retq   
ffff800000105a0b:	55                   	push   %rbp
ffff800000105a0c:	48 89 e5             	mov    %rsp,%rbp
ffff800000105a0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105a13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105a17:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000105a1b:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000105a1f:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000105a23:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000105a27:	48 ba 30 ae 10 00 00 	movabs $0xffff80000010ae30,%rdx
ffff800000105a2e:	80 ff ff 
ffff800000105a31:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105a35:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a38:	48 ba 38 ae 10 00 00 	movabs $0xffff80000010ae38,%rdx
ffff800000105a3f:	80 ff ff 
ffff800000105a42:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105a46:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a49:	48 ba 40 ae 10 00 00 	movabs $0xffff80000010ae40,%rdx
ffff800000105a50:	80 ff ff 
ffff800000105a53:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a57:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a5a:	48 ba 50 ae 10 00 00 	movabs $0xffff80000010ae50,%rdx
ffff800000105a61:	80 ff ff 
ffff800000105a64:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105a68:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a6b:	48 ba 58 ae 10 00 00 	movabs $0xffff80000010ae58,%rdx
ffff800000105a72:	80 ff ff 
ffff800000105a75:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105a79:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a7c:	48 ba 60 ae 10 00 00 	movabs $0xffff80000010ae60,%rdx
ffff800000105a83:	80 ff ff 
ffff800000105a86:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a8a:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a8d:	48 ba 68 ae 10 00 00 	movabs $0xffff80000010ae68,%rdx
ffff800000105a94:	80 ff ff 
ffff800000105a97:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000105a9b:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a9e:	48 ba 70 ae 10 00 00 	movabs $0xffff80000010ae70,%rdx
ffff800000105aa5:	80 ff ff 
ffff800000105aa8:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000105aac:	48 89 02             	mov    %rax,(%rdx)
ffff800000105aaf:	48 ba 78 ae 10 00 00 	movabs $0xffff80000010ae78,%rdx
ffff800000105ab6:	80 ff ff 
ffff800000105ab9:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000105abd:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ac0:	48 ba 80 ae 10 00 00 	movabs $0xffff80000010ae80,%rdx
ffff800000105ac7:	80 ff ff 
ffff800000105aca:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000105ace:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ad1:	90                   	nop
ffff800000105ad2:	5d                   	pop    %rbp
ffff800000105ad3:	c3                   	retq   

ffff800000105ad4 <do_divide_error>:
ffff800000105ad4:	55                   	push   %rbp
ffff800000105ad5:	48 89 e5             	mov    %rsp,%rbp
ffff800000105ad8:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105adc:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105ae0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105ae4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ae8:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105aef:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105af3:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105afa:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105afe:	49 89 c9             	mov    %rcx,%r9
ffff800000105b01:	49 89 d0             	mov    %rdx,%r8
ffff800000105b04:	48 89 c1             	mov    %rax,%rcx
ffff800000105b07:	48 ba 28 2f 11 00 00 	movabs $0xffff800000112f28,%rdx
ffff800000105b0e:	80 ff ff 
ffff800000105b11:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105b16:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105b1b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b20:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105b27:	80 ff ff 
ffff800000105b2a:	41 ff d2             	callq  *%r10
ffff800000105b2d:	eb fe                	jmp    ffff800000105b2d <do_divide_error+0x59>

ffff800000105b2f <do_debug>:
ffff800000105b2f:	55                   	push   %rbp
ffff800000105b30:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b33:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105b37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105b3b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105b3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b43:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105b4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b4e:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105b55:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105b59:	49 89 c9             	mov    %rcx,%r9
ffff800000105b5c:	49 89 d0             	mov    %rdx,%r8
ffff800000105b5f:	48 89 c1             	mov    %rax,%rcx
ffff800000105b62:	48 ba 68 2f 11 00 00 	movabs $0xffff800000112f68,%rdx
ffff800000105b69:	80 ff ff 
ffff800000105b6c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105b71:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105b76:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105b7b:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105b82:	80 ff ff 
ffff800000105b85:	41 ff d2             	callq  *%r10
ffff800000105b88:	eb fe                	jmp    ffff800000105b88 <do_debug+0x59>

ffff800000105b8a <do_nmi>:
ffff800000105b8a:	55                   	push   %rbp
ffff800000105b8b:	48 89 e5             	mov    %rsp,%rbp
ffff800000105b8e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105b92:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105b96:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105b9a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105b9e:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105ba5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ba9:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105bb0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105bb4:	49 89 c9             	mov    %rcx,%r9
ffff800000105bb7:	49 89 d0             	mov    %rdx,%r8
ffff800000105bba:	48 89 c1             	mov    %rax,%rcx
ffff800000105bbd:	48 ba a0 2f 11 00 00 	movabs $0xffff800000112fa0,%rdx
ffff800000105bc4:	80 ff ff 
ffff800000105bc7:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105bcc:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105bd1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105bd6:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105bdd:	80 ff ff 
ffff800000105be0:	41 ff d2             	callq  *%r10
ffff800000105be3:	eb fe                	jmp    ffff800000105be3 <do_nmi+0x59>

ffff800000105be5 <do_int3>:
ffff800000105be5:	55                   	push   %rbp
ffff800000105be6:	48 89 e5             	mov    %rsp,%rbp
ffff800000105be9:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105bed:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105bf1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105bf5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105bf9:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105c00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105c04:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105c0b:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105c0f:	49 89 c9             	mov    %rcx,%r9
ffff800000105c12:	49 89 d0             	mov    %rdx,%r8
ffff800000105c15:	48 89 c1             	mov    %rax,%rcx
ffff800000105c18:	48 ba d8 2f 11 00 00 	movabs $0xffff800000112fd8,%rdx
ffff800000105c1f:	80 ff ff 
ffff800000105c22:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105c27:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105c2c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c31:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105c38:	80 ff ff 
ffff800000105c3b:	41 ff d2             	callq  *%r10
ffff800000105c3e:	eb fe                	jmp    ffff800000105c3e <do_int3+0x59>

ffff800000105c40 <do_overflow>:
ffff800000105c40:	55                   	push   %rbp
ffff800000105c41:	48 89 e5             	mov    %rsp,%rbp
ffff800000105c44:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105c48:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105c4c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105c50:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105c54:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105c5b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105c5f:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105c66:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105c6a:	49 89 c9             	mov    %rcx,%r9
ffff800000105c6d:	49 89 d0             	mov    %rdx,%r8
ffff800000105c70:	48 89 c1             	mov    %rax,%rcx
ffff800000105c73:	48 ba 10 30 11 00 00 	movabs $0xffff800000113010,%rdx
ffff800000105c7a:	80 ff ff 
ffff800000105c7d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105c82:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105c87:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105c8c:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105c93:	80 ff ff 
ffff800000105c96:	41 ff d2             	callq  *%r10
ffff800000105c99:	eb fe                	jmp    ffff800000105c99 <do_overflow+0x59>

ffff800000105c9b <do_bounds>:
ffff800000105c9b:	55                   	push   %rbp
ffff800000105c9c:	48 89 e5             	mov    %rsp,%rbp
ffff800000105c9f:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105ca3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105ca7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105cab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105caf:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105cb6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105cba:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105cc1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105cc5:	49 89 c9             	mov    %rcx,%r9
ffff800000105cc8:	49 89 d0             	mov    %rdx,%r8
ffff800000105ccb:	48 89 c1             	mov    %rax,%rcx
ffff800000105cce:	48 ba 50 30 11 00 00 	movabs $0xffff800000113050,%rdx
ffff800000105cd5:	80 ff ff 
ffff800000105cd8:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105cdd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105ce2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ce7:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105cee:	80 ff ff 
ffff800000105cf1:	41 ff d2             	callq  *%r10
ffff800000105cf4:	eb fe                	jmp    ffff800000105cf4 <do_bounds+0x59>

ffff800000105cf6 <do_undefined_opcode>:
ffff800000105cf6:	55                   	push   %rbp
ffff800000105cf7:	48 89 e5             	mov    %rsp,%rbp
ffff800000105cfa:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105cfe:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105d02:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105d06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d0a:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105d11:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d15:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105d1c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105d20:	49 89 c9             	mov    %rcx,%r9
ffff800000105d23:	49 89 d0             	mov    %rdx,%r8
ffff800000105d26:	48 89 c1             	mov    %rax,%rcx
ffff800000105d29:	48 ba 90 30 11 00 00 	movabs $0xffff800000113090,%rdx
ffff800000105d30:	80 ff ff 
ffff800000105d33:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105d38:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105d3d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d42:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105d49:	80 ff ff 
ffff800000105d4c:	41 ff d2             	callq  *%r10
ffff800000105d4f:	eb fe                	jmp    ffff800000105d4f <do_undefined_opcode+0x59>

ffff800000105d51 <do_dev_not_available>:
ffff800000105d51:	55                   	push   %rbp
ffff800000105d52:	48 89 e5             	mov    %rsp,%rbp
ffff800000105d55:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105d59:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105d5d:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105d61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d65:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105d6c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105d70:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105d77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105d7b:	49 89 c9             	mov    %rcx,%r9
ffff800000105d7e:	49 89 d0             	mov    %rdx,%r8
ffff800000105d81:	48 89 c1             	mov    %rax,%rcx
ffff800000105d84:	48 ba d8 30 11 00 00 	movabs $0xffff8000001130d8,%rdx
ffff800000105d8b:	80 ff ff 
ffff800000105d8e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105d93:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105d98:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105d9d:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105da4:	80 ff ff 
ffff800000105da7:	41 ff d2             	callq  *%r10
ffff800000105daa:	eb fe                	jmp    ffff800000105daa <do_dev_not_available+0x59>

ffff800000105dac <do_double_fault>:
ffff800000105dac:	55                   	push   %rbp
ffff800000105dad:	48 89 e5             	mov    %rsp,%rbp
ffff800000105db0:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105db4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105db8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105dbc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105dc0:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105dc7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105dcb:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105dd2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105dd6:	49 89 c9             	mov    %rcx,%r9
ffff800000105dd9:	49 89 d0             	mov    %rdx,%r8
ffff800000105ddc:	48 89 c1             	mov    %rax,%rcx
ffff800000105ddf:	48 ba 20 31 11 00 00 	movabs $0xffff800000113120,%rdx
ffff800000105de6:	80 ff ff 
ffff800000105de9:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105dee:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105df3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105df8:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105dff:	80 ff ff 
ffff800000105e02:	41 ff d2             	callq  *%r10
ffff800000105e05:	eb fe                	jmp    ffff800000105e05 <do_double_fault+0x59>

ffff800000105e07 <do_coprocessor_segment_overrun>:
ffff800000105e07:	55                   	push   %rbp
ffff800000105e08:	48 89 e5             	mov    %rsp,%rbp
ffff800000105e0b:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105e0f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105e13:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105e17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e1b:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105e22:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e26:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105e2d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105e31:	49 89 c9             	mov    %rcx,%r9
ffff800000105e34:	49 89 d0             	mov    %rdx,%r8
ffff800000105e37:	48 89 c1             	mov    %rax,%rcx
ffff800000105e3a:	48 ba 60 31 11 00 00 	movabs $0xffff800000113160,%rdx
ffff800000105e41:	80 ff ff 
ffff800000105e44:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105e49:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105e4e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105e53:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105e5a:	80 ff ff 
ffff800000105e5d:	41 ff d2             	callq  *%r10
ffff800000105e60:	eb fe                	jmp    ffff800000105e60 <do_coprocessor_segment_overrun+0x59>

ffff800000105e62 <do_invalid_TSS>:
ffff800000105e62:	55                   	push   %rbp
ffff800000105e63:	48 89 e5             	mov    %rsp,%rbp
ffff800000105e66:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105e6a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105e6e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105e72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e76:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105e7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105e81:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000105e88:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105e8c:	49 89 c9             	mov    %rcx,%r9
ffff800000105e8f:	49 89 d0             	mov    %rdx,%r8
ffff800000105e92:	48 89 c1             	mov    %rax,%rcx
ffff800000105e95:	48 ba b0 31 11 00 00 	movabs $0xffff8000001131b0,%rdx
ffff800000105e9c:	80 ff ff 
ffff800000105e9f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105ea4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105ea9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105eae:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000105eb5:	80 ff ff 
ffff800000105eb8:	41 ff d2             	callq  *%r10
ffff800000105ebb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105ebf:	83 e0 01             	and    $0x1,%eax
ffff800000105ec2:	48 85 c0             	test   %rax,%rax
ffff800000105ec5:	74 25                	je     ffff800000105eec <do_invalid_TSS+0x8a>
ffff800000105ec7:	48 ba f0 31 11 00 00 	movabs $0xffff8000001131f0,%rdx
ffff800000105ece:	80 ff ff 
ffff800000105ed1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105ed6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105edb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105ee0:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000105ee7:	80 ff ff 
ffff800000105eea:	ff d1                	callq  *%rcx
ffff800000105eec:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105ef0:	83 e0 02             	and    $0x2,%eax
ffff800000105ef3:	48 85 c0             	test   %rax,%rax
ffff800000105ef6:	74 27                	je     ffff800000105f1f <do_invalid_TSS+0xbd>
ffff800000105ef8:	48 ba 70 32 11 00 00 	movabs $0xffff800000113270,%rdx
ffff800000105eff:	80 ff ff 
ffff800000105f02:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f07:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f0c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f11:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000105f18:	80 ff ff 
ffff800000105f1b:	ff d1                	callq  *%rcx
ffff800000105f1d:	eb 25                	jmp    ffff800000105f44 <do_invalid_TSS+0xe2>
ffff800000105f1f:	48 ba a0 32 11 00 00 	movabs $0xffff8000001132a0,%rdx
ffff800000105f26:	80 ff ff 
ffff800000105f29:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f2e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f33:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f38:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000105f3f:	80 ff ff 
ffff800000105f42:	ff d1                	callq  *%rcx
ffff800000105f44:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105f48:	83 e0 02             	and    $0x2,%eax
ffff800000105f4b:	48 85 c0             	test   %rax,%rax
ffff800000105f4e:	75 58                	jne    ffff800000105fa8 <do_invalid_TSS+0x146>
ffff800000105f50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105f54:	83 e0 04             	and    $0x4,%eax
ffff800000105f57:	48 85 c0             	test   %rax,%rax
ffff800000105f5a:	74 27                	je     ffff800000105f83 <do_invalid_TSS+0x121>
ffff800000105f5c:	48 ba d8 32 11 00 00 	movabs $0xffff8000001132d8,%rdx
ffff800000105f63:	80 ff ff 
ffff800000105f66:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f6b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f70:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f75:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000105f7c:	80 ff ff 
ffff800000105f7f:	ff d1                	callq  *%rcx
ffff800000105f81:	eb 25                	jmp    ffff800000105fa8 <do_invalid_TSS+0x146>
ffff800000105f83:	48 ba 10 33 11 00 00 	movabs $0xffff800000113310,%rdx
ffff800000105f8a:	80 ff ff 
ffff800000105f8d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f92:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f97:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f9c:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000105fa3:	80 ff ff 
ffff800000105fa6:	ff d1                	callq  *%rcx
ffff800000105fa8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105fac:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff800000105fb1:	48 89 c1             	mov    %rax,%rcx
ffff800000105fb4:	48 ba 40 33 11 00 00 	movabs $0xffff800000113340,%rdx
ffff800000105fbb:	80 ff ff 
ffff800000105fbe:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105fc3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105fc8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105fcd:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000105fd4:	80 ff ff 
ffff800000105fd7:	41 ff d0             	callq  *%r8
ffff800000105fda:	eb fe                	jmp    ffff800000105fda <do_invalid_TSS+0x178>

ffff800000105fdc <do_segment_not_present>:
ffff800000105fdc:	55                   	push   %rbp
ffff800000105fdd:	48 89 e5             	mov    %rsp,%rbp
ffff800000105fe0:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000105fe4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000105fe8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000105fec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ff0:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000105ff7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105ffb:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106002:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106006:	49 89 c9             	mov    %rcx,%r9
ffff800000106009:	49 89 d0             	mov    %rdx,%r8
ffff80000010600c:	48 89 c1             	mov    %rax,%rcx
ffff80000010600f:	48 ba 60 33 11 00 00 	movabs $0xffff800000113360,%rdx
ffff800000106016:	80 ff ff 
ffff800000106019:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010601e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106023:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106028:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff80000010602f:	80 ff ff 
ffff800000106032:	41 ff d2             	callq  *%r10
ffff800000106035:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106039:	83 e0 01             	and    $0x1,%eax
ffff80000010603c:	48 85 c0             	test   %rax,%rax
ffff80000010603f:	74 25                	je     ffff800000106066 <do_segment_not_present+0x8a>
ffff800000106041:	48 ba f0 31 11 00 00 	movabs $0xffff8000001131f0,%rdx
ffff800000106048:	80 ff ff 
ffff80000010604b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106050:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106055:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010605a:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106061:	80 ff ff 
ffff800000106064:	ff d1                	callq  *%rcx
ffff800000106066:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010606a:	83 e0 02             	and    $0x2,%eax
ffff80000010606d:	48 85 c0             	test   %rax,%rax
ffff800000106070:	74 27                	je     ffff800000106099 <do_segment_not_present+0xbd>
ffff800000106072:	48 ba 70 32 11 00 00 	movabs $0xffff800000113270,%rdx
ffff800000106079:	80 ff ff 
ffff80000010607c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106081:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106086:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010608b:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106092:	80 ff ff 
ffff800000106095:	ff d1                	callq  *%rcx
ffff800000106097:	eb 25                	jmp    ffff8000001060be <do_segment_not_present+0xe2>
ffff800000106099:	48 ba a0 32 11 00 00 	movabs $0xffff8000001132a0,%rdx
ffff8000001060a0:	80 ff ff 
ffff8000001060a3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060a8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060ad:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060b2:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001060b9:	80 ff ff 
ffff8000001060bc:	ff d1                	callq  *%rcx
ffff8000001060be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001060c2:	83 e0 02             	and    $0x2,%eax
ffff8000001060c5:	48 85 c0             	test   %rax,%rax
ffff8000001060c8:	75 58                	jne    ffff800000106122 <do_segment_not_present+0x146>
ffff8000001060ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001060ce:	83 e0 04             	and    $0x4,%eax
ffff8000001060d1:	48 85 c0             	test   %rax,%rax
ffff8000001060d4:	74 27                	je     ffff8000001060fd <do_segment_not_present+0x121>
ffff8000001060d6:	48 ba d8 32 11 00 00 	movabs $0xffff8000001132d8,%rdx
ffff8000001060dd:	80 ff ff 
ffff8000001060e0:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060e5:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060ea:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060ef:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001060f6:	80 ff ff 
ffff8000001060f9:	ff d1                	callq  *%rcx
ffff8000001060fb:	eb 25                	jmp    ffff800000106122 <do_segment_not_present+0x146>
ffff8000001060fd:	48 ba 10 33 11 00 00 	movabs $0xffff800000113310,%rdx
ffff800000106104:	80 ff ff 
ffff800000106107:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010610c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106111:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106116:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010611d:	80 ff ff 
ffff800000106120:	ff d1                	callq  *%rcx
ffff800000106122:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106126:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff80000010612b:	48 89 c1             	mov    %rax,%rcx
ffff80000010612e:	48 ba 40 33 11 00 00 	movabs $0xffff800000113340,%rdx
ffff800000106135:	80 ff ff 
ffff800000106138:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010613d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106142:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106147:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff80000010614e:	80 ff ff 
ffff800000106151:	41 ff d0             	callq  *%r8
ffff800000106154:	eb fe                	jmp    ffff800000106154 <do_segment_not_present+0x178>

ffff800000106156 <do_stack_segment_fault>:
ffff800000106156:	55                   	push   %rbp
ffff800000106157:	48 89 e5             	mov    %rsp,%rbp
ffff80000010615a:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010615e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106162:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106166:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010616a:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106171:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106175:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff80000010617c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106180:	49 89 c9             	mov    %rcx,%r9
ffff800000106183:	49 89 d0             	mov    %rdx,%r8
ffff800000106186:	48 89 c1             	mov    %rax,%rcx
ffff800000106189:	48 ba a8 33 11 00 00 	movabs $0xffff8000001133a8,%rdx
ffff800000106190:	80 ff ff 
ffff800000106193:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106198:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010619d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061a2:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff8000001061a9:	80 ff ff 
ffff8000001061ac:	41 ff d2             	callq  *%r10
ffff8000001061af:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001061b3:	83 e0 01             	and    $0x1,%eax
ffff8000001061b6:	48 85 c0             	test   %rax,%rax
ffff8000001061b9:	74 25                	je     ffff8000001061e0 <do_stack_segment_fault+0x8a>
ffff8000001061bb:	48 ba f0 31 11 00 00 	movabs $0xffff8000001131f0,%rdx
ffff8000001061c2:	80 ff ff 
ffff8000001061c5:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061ca:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061cf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061d4:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001061db:	80 ff ff 
ffff8000001061de:	ff d1                	callq  *%rcx
ffff8000001061e0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001061e4:	83 e0 02             	and    $0x2,%eax
ffff8000001061e7:	48 85 c0             	test   %rax,%rax
ffff8000001061ea:	74 27                	je     ffff800000106213 <do_stack_segment_fault+0xbd>
ffff8000001061ec:	48 ba 70 32 11 00 00 	movabs $0xffff800000113270,%rdx
ffff8000001061f3:	80 ff ff 
ffff8000001061f6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061fb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106200:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106205:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010620c:	80 ff ff 
ffff80000010620f:	ff d1                	callq  *%rcx
ffff800000106211:	eb 25                	jmp    ffff800000106238 <do_stack_segment_fault+0xe2>
ffff800000106213:	48 ba a0 32 11 00 00 	movabs $0xffff8000001132a0,%rdx
ffff80000010621a:	80 ff ff 
ffff80000010621d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106222:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106227:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010622c:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106233:	80 ff ff 
ffff800000106236:	ff d1                	callq  *%rcx
ffff800000106238:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010623c:	83 e0 02             	and    $0x2,%eax
ffff80000010623f:	48 85 c0             	test   %rax,%rax
ffff800000106242:	75 58                	jne    ffff80000010629c <do_stack_segment_fault+0x146>
ffff800000106244:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106248:	83 e0 04             	and    $0x4,%eax
ffff80000010624b:	48 85 c0             	test   %rax,%rax
ffff80000010624e:	74 27                	je     ffff800000106277 <do_stack_segment_fault+0x121>
ffff800000106250:	48 ba d8 32 11 00 00 	movabs $0xffff8000001132d8,%rdx
ffff800000106257:	80 ff ff 
ffff80000010625a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010625f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106264:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106269:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106270:	80 ff ff 
ffff800000106273:	ff d1                	callq  *%rcx
ffff800000106275:	eb 25                	jmp    ffff80000010629c <do_stack_segment_fault+0x146>
ffff800000106277:	48 ba 10 33 11 00 00 	movabs $0xffff800000113310,%rdx
ffff80000010627e:	80 ff ff 
ffff800000106281:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106286:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010628b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106290:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106297:	80 ff ff 
ffff80000010629a:	ff d1                	callq  *%rcx
ffff80000010629c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001062a0:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff8000001062a5:	48 89 c1             	mov    %rax,%rcx
ffff8000001062a8:	48 ba 40 33 11 00 00 	movabs $0xffff800000113340,%rdx
ffff8000001062af:	80 ff ff 
ffff8000001062b2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001062b7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001062bc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001062c1:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff8000001062c8:	80 ff ff 
ffff8000001062cb:	41 ff d0             	callq  *%r8
ffff8000001062ce:	eb fe                	jmp    ffff8000001062ce <do_stack_segment_fault+0x178>

ffff8000001062d0 <do_general_protection>:
ffff8000001062d0:	55                   	push   %rbp
ffff8000001062d1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001062d4:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001062d8:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001062dc:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001062e0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001062e4:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001062eb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001062ef:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001062f6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001062fa:	49 89 c9             	mov    %rcx,%r9
ffff8000001062fd:	49 89 d0             	mov    %rdx,%r8
ffff800000106300:	48 89 c1             	mov    %rax,%rcx
ffff800000106303:	48 ba f0 33 11 00 00 	movabs $0xffff8000001133f0,%rdx
ffff80000010630a:	80 ff ff 
ffff80000010630d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106312:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106317:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010631c:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000106323:	80 ff ff 
ffff800000106326:	41 ff d2             	callq  *%r10
ffff800000106329:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010632d:	83 e0 01             	and    $0x1,%eax
ffff800000106330:	48 85 c0             	test   %rax,%rax
ffff800000106333:	74 25                	je     ffff80000010635a <do_general_protection+0x8a>
ffff800000106335:	48 ba f0 31 11 00 00 	movabs $0xffff8000001131f0,%rdx
ffff80000010633c:	80 ff ff 
ffff80000010633f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106344:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106349:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010634e:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106355:	80 ff ff 
ffff800000106358:	ff d1                	callq  *%rcx
ffff80000010635a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010635e:	83 e0 02             	and    $0x2,%eax
ffff800000106361:	48 85 c0             	test   %rax,%rax
ffff800000106364:	74 27                	je     ffff80000010638d <do_general_protection+0xbd>
ffff800000106366:	48 ba 70 32 11 00 00 	movabs $0xffff800000113270,%rdx
ffff80000010636d:	80 ff ff 
ffff800000106370:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106375:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010637a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010637f:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106386:	80 ff ff 
ffff800000106389:	ff d1                	callq  *%rcx
ffff80000010638b:	eb 25                	jmp    ffff8000001063b2 <do_general_protection+0xe2>
ffff80000010638d:	48 ba a0 32 11 00 00 	movabs $0xffff8000001132a0,%rdx
ffff800000106394:	80 ff ff 
ffff800000106397:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010639c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063a1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063a6:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001063ad:	80 ff ff 
ffff8000001063b0:	ff d1                	callq  *%rcx
ffff8000001063b2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001063b6:	83 e0 02             	and    $0x2,%eax
ffff8000001063b9:	48 85 c0             	test   %rax,%rax
ffff8000001063bc:	75 58                	jne    ffff800000106416 <do_general_protection+0x146>
ffff8000001063be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001063c2:	83 e0 04             	and    $0x4,%eax
ffff8000001063c5:	48 85 c0             	test   %rax,%rax
ffff8000001063c8:	74 27                	je     ffff8000001063f1 <do_general_protection+0x121>
ffff8000001063ca:	48 ba d8 32 11 00 00 	movabs $0xffff8000001132d8,%rdx
ffff8000001063d1:	80 ff ff 
ffff8000001063d4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063d9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063de:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063e3:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001063ea:	80 ff ff 
ffff8000001063ed:	ff d1                	callq  *%rcx
ffff8000001063ef:	eb 25                	jmp    ffff800000106416 <do_general_protection+0x146>
ffff8000001063f1:	48 ba 10 33 11 00 00 	movabs $0xffff800000113310,%rdx
ffff8000001063f8:	80 ff ff 
ffff8000001063fb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106400:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106405:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010640a:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106411:	80 ff ff 
ffff800000106414:	ff d1                	callq  *%rcx
ffff800000106416:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010641a:	25 f8 ff 00 00       	and    $0xfff8,%eax
ffff80000010641f:	48 89 c1             	mov    %rax,%rcx
ffff800000106422:	48 ba 40 33 11 00 00 	movabs $0xffff800000113340,%rdx
ffff800000106429:	80 ff ff 
ffff80000010642c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106431:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106436:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010643b:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000106442:	80 ff ff 
ffff800000106445:	41 ff d0             	callq  *%r8
ffff800000106448:	eb fe                	jmp    ffff800000106448 <do_general_protection+0x178>

ffff80000010644a <do_page_fault>:
ffff80000010644a:	55                   	push   %rbp
ffff80000010644b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010644e:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000106452:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106456:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff80000010645a:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000106461:	00 
ffff800000106462:	0f 20 d0             	mov    %cr2,%rax
ffff800000106465:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000106469:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010646d:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106474:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106478:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff80000010647f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106483:	49 89 c9             	mov    %rcx,%r9
ffff800000106486:	49 89 d0             	mov    %rdx,%r8
ffff800000106489:	48 89 c1             	mov    %rax,%rcx
ffff80000010648c:	48 ba 38 34 11 00 00 	movabs $0xffff800000113438,%rdx
ffff800000106493:	80 ff ff 
ffff800000106496:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010649b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064a0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064a5:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff8000001064ac:	80 ff ff 
ffff8000001064af:	41 ff d2             	callq  *%r10
ffff8000001064b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001064b6:	83 e0 01             	and    $0x1,%eax
ffff8000001064b9:	48 85 c0             	test   %rax,%rax
ffff8000001064bc:	75 25                	jne    ffff8000001064e3 <do_page_fault+0x99>
ffff8000001064be:	48 ba 76 34 11 00 00 	movabs $0xffff800000113476,%rdx
ffff8000001064c5:	80 ff ff 
ffff8000001064c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064cd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064d7:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001064de:	80 ff ff 
ffff8000001064e1:	ff d1                	callq  *%rcx
ffff8000001064e3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001064e7:	83 e0 02             	and    $0x2,%eax
ffff8000001064ea:	48 85 c0             	test   %rax,%rax
ffff8000001064ed:	74 27                	je     ffff800000106516 <do_page_fault+0xcc>
ffff8000001064ef:	48 ba 89 34 11 00 00 	movabs $0xffff800000113489,%rdx
ffff8000001064f6:	80 ff ff 
ffff8000001064f9:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064fe:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106503:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106508:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010650f:	80 ff ff 
ffff800000106512:	ff d1                	callq  *%rcx
ffff800000106514:	eb 25                	jmp    ffff80000010653b <do_page_fault+0xf1>
ffff800000106516:	48 ba 9d 34 11 00 00 	movabs $0xffff80000011349d,%rdx
ffff80000010651d:	80 ff ff 
ffff800000106520:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106525:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010652a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010652f:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106536:	80 ff ff 
ffff800000106539:	ff d1                	callq  *%rcx
ffff80000010653b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010653f:	83 e0 04             	and    $0x4,%eax
ffff800000106542:	48 85 c0             	test   %rax,%rax
ffff800000106545:	74 27                	je     ffff80000010656e <do_page_fault+0x124>
ffff800000106547:	48 ba b0 34 11 00 00 	movabs $0xffff8000001134b0,%rdx
ffff80000010654e:	80 ff ff 
ffff800000106551:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106556:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010655b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106560:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106567:	80 ff ff 
ffff80000010656a:	ff d1                	callq  *%rcx
ffff80000010656c:	eb 25                	jmp    ffff800000106593 <do_page_fault+0x149>
ffff80000010656e:	48 ba c2 34 11 00 00 	movabs $0xffff8000001134c2,%rdx
ffff800000106575:	80 ff ff 
ffff800000106578:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010657d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106582:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106587:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010658e:	80 ff ff 
ffff800000106591:	ff d1                	callq  *%rcx
ffff800000106593:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000106597:	83 e0 08             	and    $0x8,%eax
ffff80000010659a:	48 85 c0             	test   %rax,%rax
ffff80000010659d:	74 25                	je     ffff8000001065c4 <do_page_fault+0x17a>
ffff80000010659f:	48 ba de 34 11 00 00 	movabs $0xffff8000001134de,%rdx
ffff8000001065a6:	80 ff ff 
ffff8000001065a9:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065ae:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065b3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065b8:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001065bf:	80 ff ff 
ffff8000001065c2:	ff d1                	callq  *%rcx
ffff8000001065c4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001065c8:	83 e0 10             	and    $0x10,%eax
ffff8000001065cb:	48 85 c0             	test   %rax,%rax
ffff8000001065ce:	74 25                	je     ffff8000001065f5 <do_page_fault+0x1ab>
ffff8000001065d0:	48 ba 00 35 11 00 00 	movabs $0xffff800000113500,%rdx
ffff8000001065d7:	80 ff ff 
ffff8000001065da:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065df:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065e4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065e9:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001065f0:	80 ff ff 
ffff8000001065f3:	ff d1                	callq  *%rcx
ffff8000001065f5:	48 ba 1f 35 11 00 00 	movabs $0xffff80000011351f,%rdx
ffff8000001065fc:	80 ff ff 
ffff8000001065ff:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106604:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106609:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010660e:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106615:	80 ff ff 
ffff800000106618:	ff d1                	callq  *%rcx
ffff80000010661a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010661e:	48 89 c1             	mov    %rax,%rcx
ffff800000106621:	48 ba 21 35 11 00 00 	movabs $0xffff800000113521,%rdx
ffff800000106628:	80 ff ff 
ffff80000010662b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106630:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106635:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010663a:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000106641:	80 ff ff 
ffff800000106644:	41 ff d0             	callq  *%r8
ffff800000106647:	eb fe                	jmp    ffff800000106647 <do_page_fault+0x1fd>

ffff800000106649 <do_x87_FPU_error>:
ffff800000106649:	55                   	push   %rbp
ffff80000010664a:	48 89 e5             	mov    %rsp,%rbp
ffff80000010664d:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106651:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106655:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106659:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010665d:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106664:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106668:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff80000010666f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106673:	49 89 c9             	mov    %rcx,%r9
ffff800000106676:	49 89 d0             	mov    %rdx,%r8
ffff800000106679:	48 89 c1             	mov    %rax,%rcx
ffff80000010667c:	48 ba 30 35 11 00 00 	movabs $0xffff800000113530,%rdx
ffff800000106683:	80 ff ff 
ffff800000106686:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010668b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106690:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106695:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff80000010669c:	80 ff ff 
ffff80000010669f:	41 ff d2             	callq  *%r10
ffff8000001066a2:	eb fe                	jmp    ffff8000001066a2 <do_x87_FPU_error+0x59>

ffff8000001066a4 <do_alignment_check>:
ffff8000001066a4:	55                   	push   %rbp
ffff8000001066a5:	48 89 e5             	mov    %rsp,%rbp
ffff8000001066a8:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001066ac:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001066b0:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001066b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001066b8:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001066bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001066c3:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001066ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001066ce:	49 89 c9             	mov    %rcx,%r9
ffff8000001066d1:	49 89 d0             	mov    %rdx,%r8
ffff8000001066d4:	48 89 c1             	mov    %rax,%rcx
ffff8000001066d7:	48 ba 78 35 11 00 00 	movabs $0xffff800000113578,%rdx
ffff8000001066de:	80 ff ff 
ffff8000001066e1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001066e6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001066eb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001066f0:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff8000001066f7:	80 ff ff 
ffff8000001066fa:	41 ff d2             	callq  *%r10
ffff8000001066fd:	eb fe                	jmp    ffff8000001066fd <do_alignment_check+0x59>

ffff8000001066ff <do_machine_check>:
ffff8000001066ff:	55                   	push   %rbp
ffff800000106700:	48 89 e5             	mov    %rsp,%rbp
ffff800000106703:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106707:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010670b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010670f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106713:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff80000010671a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010671e:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106725:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106729:	49 89 c9             	mov    %rcx,%r9
ffff80000010672c:	49 89 d0             	mov    %rdx,%r8
ffff80000010672f:	48 89 c1             	mov    %rax,%rcx
ffff800000106732:	48 ba c0 35 11 00 00 	movabs $0xffff8000001135c0,%rdx
ffff800000106739:	80 ff ff 
ffff80000010673c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106741:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106746:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010674b:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000106752:	80 ff ff 
ffff800000106755:	41 ff d2             	callq  *%r10
ffff800000106758:	eb fe                	jmp    ffff800000106758 <do_machine_check+0x59>

ffff80000010675a <do_SIMD_exception>:
ffff80000010675a:	55                   	push   %rbp
ffff80000010675b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010675e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000106762:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106766:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010676a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010676e:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff800000106775:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106779:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff800000106780:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106784:	49 89 c9             	mov    %rcx,%r9
ffff800000106787:	49 89 d0             	mov    %rdx,%r8
ffff80000010678a:	48 89 c1             	mov    %rax,%rcx
ffff80000010678d:	48 ba 08 36 11 00 00 	movabs $0xffff800000113608,%rdx
ffff800000106794:	80 ff ff 
ffff800000106797:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010679c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001067a1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001067a6:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff8000001067ad:	80 ff ff 
ffff8000001067b0:	41 ff d2             	callq  *%r10
ffff8000001067b3:	eb fe                	jmp    ffff8000001067b3 <do_SIMD_exception+0x59>

ffff8000001067b5 <do_virtualization_exception>:
ffff8000001067b5:	55                   	push   %rbp
ffff8000001067b6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001067b9:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001067bd:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001067c1:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff8000001067c5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001067c9:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
ffff8000001067d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001067d4:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
ffff8000001067db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001067df:	49 89 c9             	mov    %rcx,%r9
ffff8000001067e2:	49 89 d0             	mov    %rdx,%r8
ffff8000001067e5:	48 89 c1             	mov    %rax,%rcx
ffff8000001067e8:	48 ba 50 36 11 00 00 	movabs $0xffff800000113650,%rdx
ffff8000001067ef:	80 ff ff 
ffff8000001067f2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001067f7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001067fc:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106801:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000106808:	80 ff ff 
ffff80000010680b:	41 ff d2             	callq  *%r10
ffff80000010680e:	eb fe                	jmp    ffff80000010680e <do_virtualization_exception+0x59>

ffff800000106810 <sys_vector_init>:
ffff800000106810:	55                   	push   %rbp
ffff800000106811:	48 89 e5             	mov    %rsp,%rbp
ffff800000106814:	48 ba 92 40 10 00 00 	movabs $0xffff800000104092,%rdx
ffff80000010681b:	80 ff ff 
ffff80000010681e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106823:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000106828:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010682f:	80 ff ff 
ffff800000106832:	ff d0                	callq  *%rax
ffff800000106834:	48 ba ea 40 10 00 00 	movabs $0xffff8000001040ea,%rdx
ffff80000010683b:	80 ff ff 
ffff80000010683e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106843:	bf 01 00 00 00       	mov    $0x1,%edi
ffff800000106848:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010684f:	80 ff ff 
ffff800000106852:	ff d0                	callq  *%rax
ffff800000106854:	48 ba fa 40 10 00 00 	movabs $0xffff8000001040fa,%rdx
ffff80000010685b:	80 ff ff 
ffff80000010685e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106863:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000106868:	48 b8 5e 58 10 00 00 	movabs $0xffff80000010585e,%rax
ffff80000010686f:	80 ff ff 
ffff800000106872:	ff d0                	callq  *%rax
ffff800000106874:	48 ba 40 41 10 00 00 	movabs $0xffff800000104140,%rdx
ffff80000010687b:	80 ff ff 
ffff80000010687e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106883:	bf 03 00 00 00       	mov    $0x3,%edi
ffff800000106888:	48 b8 7c 59 10 00 00 	movabs $0xffff80000010597c,%rax
ffff80000010688f:	80 ff ff 
ffff800000106892:	ff d0                	callq  *%rax
ffff800000106894:	48 ba 53 41 10 00 00 	movabs $0xffff800000104153,%rdx
ffff80000010689b:	80 ff ff 
ffff80000010689e:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068a3:	bf 04 00 00 00       	mov    $0x4,%edi
ffff8000001068a8:	48 b8 7c 59 10 00 00 	movabs $0xffff80000010597c,%rax
ffff8000001068af:	80 ff ff 
ffff8000001068b2:	ff d0                	callq  *%rax
ffff8000001068b4:	48 ba 66 41 10 00 00 	movabs $0xffff800000104166,%rdx
ffff8000001068bb:	80 ff ff 
ffff8000001068be:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068c3:	bf 05 00 00 00       	mov    $0x5,%edi
ffff8000001068c8:	48 b8 7c 59 10 00 00 	movabs $0xffff80000010597c,%rax
ffff8000001068cf:	80 ff ff 
ffff8000001068d2:	ff d0                	callq  *%rax
ffff8000001068d4:	48 ba 79 41 10 00 00 	movabs $0xffff800000104179,%rdx
ffff8000001068db:	80 ff ff 
ffff8000001068de:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001068e3:	bf 06 00 00 00       	mov    $0x6,%edi
ffff8000001068e8:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff8000001068ef:	80 ff ff 
ffff8000001068f2:	ff d0                	callq  *%rax
ffff8000001068f4:	48 ba 8c 41 10 00 00 	movabs $0xffff80000010418c,%rdx
ffff8000001068fb:	80 ff ff 
ffff8000001068fe:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106903:	bf 07 00 00 00       	mov    $0x7,%edi
ffff800000106908:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010690f:	80 ff ff 
ffff800000106912:	ff d0                	callq  *%rax
ffff800000106914:	48 ba 9f 41 10 00 00 	movabs $0xffff80000010419f,%rdx
ffff80000010691b:	80 ff ff 
ffff80000010691e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106923:	bf 08 00 00 00       	mov    $0x8,%edi
ffff800000106928:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010692f:	80 ff ff 
ffff800000106932:	ff d0                	callq  *%rax
ffff800000106934:	48 ba b0 41 10 00 00 	movabs $0xffff8000001041b0,%rdx
ffff80000010693b:	80 ff ff 
ffff80000010693e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106943:	bf 09 00 00 00       	mov    $0x9,%edi
ffff800000106948:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010694f:	80 ff ff 
ffff800000106952:	ff d0                	callq  *%rax
ffff800000106954:	48 ba c3 41 10 00 00 	movabs $0xffff8000001041c3,%rdx
ffff80000010695b:	80 ff ff 
ffff80000010695e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106963:	bf 0a 00 00 00       	mov    $0xa,%edi
ffff800000106968:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010696f:	80 ff ff 
ffff800000106972:	ff d0                	callq  *%rax
ffff800000106974:	48 ba d4 41 10 00 00 	movabs $0xffff8000001041d4,%rdx
ffff80000010697b:	80 ff ff 
ffff80000010697e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106983:	bf 0b 00 00 00       	mov    $0xb,%edi
ffff800000106988:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff80000010698f:	80 ff ff 
ffff800000106992:	ff d0                	callq  *%rax
ffff800000106994:	48 ba e5 41 10 00 00 	movabs $0xffff8000001041e5,%rdx
ffff80000010699b:	80 ff ff 
ffff80000010699e:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069a3:	bf 0c 00 00 00       	mov    $0xc,%edi
ffff8000001069a8:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff8000001069af:	80 ff ff 
ffff8000001069b2:	ff d0                	callq  *%rax
ffff8000001069b4:	48 ba f6 41 10 00 00 	movabs $0xffff8000001041f6,%rdx
ffff8000001069bb:	80 ff ff 
ffff8000001069be:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069c3:	bf 0d 00 00 00       	mov    $0xd,%edi
ffff8000001069c8:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff8000001069cf:	80 ff ff 
ffff8000001069d2:	ff d0                	callq  *%rax
ffff8000001069d4:	48 ba 07 42 10 00 00 	movabs $0xffff800000104207,%rdx
ffff8000001069db:	80 ff ff 
ffff8000001069de:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001069e3:	bf 0e 00 00 00       	mov    $0xe,%edi
ffff8000001069e8:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff8000001069ef:	80 ff ff 
ffff8000001069f2:	ff d0                	callq  *%rax
ffff8000001069f4:	48 ba 18 42 10 00 00 	movabs $0xffff800000104218,%rdx
ffff8000001069fb:	80 ff ff 
ffff8000001069fe:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a03:	bf 10 00 00 00       	mov    $0x10,%edi
ffff800000106a08:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff800000106a0f:	80 ff ff 
ffff800000106a12:	ff d0                	callq  *%rax
ffff800000106a14:	48 ba 2b 42 10 00 00 	movabs $0xffff80000010422b,%rdx
ffff800000106a1b:	80 ff ff 
ffff800000106a1e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a23:	bf 11 00 00 00       	mov    $0x11,%edi
ffff800000106a28:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff800000106a2f:	80 ff ff 
ffff800000106a32:	ff d0                	callq  *%rax
ffff800000106a34:	48 ba 3c 42 10 00 00 	movabs $0xffff80000010423c,%rdx
ffff800000106a3b:	80 ff ff 
ffff800000106a3e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a43:	bf 12 00 00 00       	mov    $0x12,%edi
ffff800000106a48:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff800000106a4f:	80 ff ff 
ffff800000106a52:	ff d0                	callq  *%rax
ffff800000106a54:	48 ba 4f 42 10 00 00 	movabs $0xffff80000010424f,%rdx
ffff800000106a5b:	80 ff ff 
ffff800000106a5e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a63:	bf 13 00 00 00       	mov    $0x13,%edi
ffff800000106a68:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff800000106a6f:	80 ff ff 
ffff800000106a72:	ff d0                	callq  *%rax
ffff800000106a74:	48 ba 62 42 10 00 00 	movabs $0xffff800000104262,%rdx
ffff800000106a7b:	80 ff ff 
ffff800000106a7e:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106a83:	bf 14 00 00 00       	mov    $0x14,%edi
ffff800000106a88:	48 b8 ed 58 10 00 00 	movabs $0xffff8000001058ed,%rax
ffff800000106a8f:	80 ff ff 
ffff800000106a92:	ff d0                	callq  *%rax
ffff800000106a94:	90                   	nop
ffff800000106a95:	5d                   	pop    %rbp
ffff800000106a96:	c3                   	retq   

ffff800000106a97 <memset>:
ffff800000106a97:	55                   	push   %rbp
ffff800000106a98:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a9b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000106a9f:	89 f0                	mov    %esi,%eax
ffff800000106aa1:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000106aa5:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000106aa8:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000106aac:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000106ab3:	01 01 01 
ffff800000106ab6:	48 0f af c2          	imul   %rdx,%rax
ffff800000106aba:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000106abe:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000106ac2:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000106ac6:	48 85 c0             	test   %rax,%rax
ffff800000106ac9:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000106acd:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000106ad1:	48 89 c1             	mov    %rax,%rcx
ffff800000106ad4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ad8:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff800000106adc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000106ae0:	48 89 d7             	mov    %rdx,%rdi
ffff800000106ae3:	fc                   	cld    
ffff800000106ae4:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff800000106ae7:	40 f6 c6 04          	test   $0x4,%sil
ffff800000106aeb:	74 01                	je     ffff800000106aee <memset+0x57>
ffff800000106aed:	ab                   	stos   %eax,%es:(%rdi)
ffff800000106aee:	40 f6 c6 02          	test   $0x2,%sil
ffff800000106af2:	74 02                	je     ffff800000106af6 <memset+0x5f>
ffff800000106af4:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000106af6:	40 f6 c6 01          	test   $0x1,%sil
ffff800000106afa:	74 01                	je     ffff800000106afd <memset+0x66>
ffff800000106afc:	aa                   	stos   %al,%es:(%rdi)
ffff800000106afd:	89 f8                	mov    %edi,%eax
ffff800000106aff:	89 ca                	mov    %ecx,%edx
ffff800000106b01:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000106b04:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff800000106b07:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106b0b:	5d                   	pop    %rbp
ffff800000106b0c:	c3                   	retq   

ffff800000106b0d <Get_gdt>:
ffff800000106b0d:	55                   	push   %rbp
ffff800000106b0e:	48 89 e5             	mov    %rsp,%rbp
ffff800000106b11:	0f 20 d8             	mov    %cr3,%rax
ffff800000106b14:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000106b18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b1c:	5d                   	pop    %rbp
ffff800000106b1d:	c3                   	retq   

ffff800000106b1e <page_init>:
ffff800000106b1e:	55                   	push   %rbp
ffff800000106b1f:	48 89 e5             	mov    %rsp,%rbp
ffff800000106b22:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106b26:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106b2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b2e:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106b32:	48 85 c0             	test   %rax,%rax
ffff800000106b35:	0f 85 c8 00 00 00    	jne    ffff800000106c03 <page_init+0xe5>
ffff800000106b3b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106b42:	80 ff ff 
ffff800000106b45:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106b4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b50:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b54:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106b58:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106b5c:	48 01 d0             	add    %rdx,%rax
ffff800000106b5f:	48 8b 10             	mov    (%rax),%rdx
ffff800000106b62:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b66:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b6a:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106b6e:	83 e0 3f             	and    $0x3f,%eax
ffff800000106b71:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106b76:	89 c1                	mov    %eax,%ecx
ffff800000106b78:	48 d3 e6             	shl    %cl,%rsi
ffff800000106b7b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106b82:	80 ff ff 
ffff800000106b85:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106b8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b90:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b94:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106b98:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106b9c:	48 01 c8             	add    %rcx,%rax
ffff800000106b9f:	48 09 f2             	or     %rsi,%rdx
ffff800000106ba2:	48 89 10             	mov    %rdx,(%rax)
ffff800000106ba5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ba9:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000106bad:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106bb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bb5:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106bb9:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106bbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bc1:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106bc5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bc9:	48 8b 00             	mov    (%rax),%rax
ffff800000106bcc:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106bd0:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106bd4:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106bd8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bdc:	48 8b 00             	mov    (%rax),%rax
ffff800000106bdf:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106be3:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106be7:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106beb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bef:	48 8b 00             	mov    (%rax),%rax
ffff800000106bf2:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106bf6:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106bfa:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106bfe:	e9 00 01 00 00       	jmpq   ffff800000106d03 <page_init+0x1e5>
ffff800000106c03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c07:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c0b:	83 e0 04             	and    $0x4,%eax
ffff800000106c0e:	48 85 c0             	test   %rax,%rax
ffff800000106c11:	75 2c                	jne    ffff800000106c3f <page_init+0x121>
ffff800000106c13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c17:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c1b:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106c20:	48 85 c0             	test   %rax,%rax
ffff800000106c23:	75 1a                	jne    ffff800000106c3f <page_init+0x121>
ffff800000106c25:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106c29:	83 e0 04             	and    $0x4,%eax
ffff800000106c2c:	48 85 c0             	test   %rax,%rax
ffff800000106c2f:	75 0e                	jne    ffff800000106c3f <page_init+0x121>
ffff800000106c31:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106c35:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106c3a:	48 85 c0             	test   %rax,%rax
ffff800000106c3d:	74 43                	je     ffff800000106c82 <page_init+0x164>
ffff800000106c3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c43:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c47:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106c4b:	48 89 c2             	mov    %rax,%rdx
ffff800000106c4e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c52:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106c56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c5a:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106c5e:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106c62:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c66:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106c6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c6e:	48 8b 00             	mov    (%rax),%rax
ffff800000106c71:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106c75:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106c79:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106c7d:	e9 81 00 00 00       	jmpq   ffff800000106d03 <page_init+0x1e5>
ffff800000106c82:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106c89:	80 ff ff 
ffff800000106c8c:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106c93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c97:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c9b:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106c9f:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106ca3:	48 01 d0             	add    %rdx,%rax
ffff800000106ca6:	48 8b 10             	mov    (%rax),%rdx
ffff800000106ca9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cad:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106cb1:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106cb5:	83 e0 3f             	and    $0x3f,%eax
ffff800000106cb8:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106cbd:	89 c1                	mov    %eax,%ecx
ffff800000106cbf:	48 d3 e6             	shl    %cl,%rsi
ffff800000106cc2:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106cc9:	80 ff ff 
ffff800000106ccc:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106cd3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cd7:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106cdb:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106cdf:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106ce3:	48 01 c8             	add    %rcx,%rax
ffff800000106ce6:	48 09 f2             	or     %rsi,%rdx
ffff800000106ce9:	48 89 10             	mov    %rdx,(%rax)
ffff800000106cec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cf0:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106cf4:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106cf8:	48 89 c2             	mov    %rax,%rdx
ffff800000106cfb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cff:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106d03:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106d08:	5d                   	pop    %rbp
ffff800000106d09:	c3                   	retq   

ffff800000106d0a <page_clean>:
ffff800000106d0a:	55                   	push   %rbp
ffff800000106d0b:	48 89 e5             	mov    %rsp,%rbp
ffff800000106d0e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106d12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d16:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d1a:	48 85 c0             	test   %rax,%rax
ffff800000106d1d:	75 11                	jne    ffff800000106d30 <page_clean+0x26>
ffff800000106d1f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d23:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106d2a:	00 
ffff800000106d2b:	e9 55 01 00 00       	jmpq   ffff800000106e85 <page_clean+0x17b>
ffff800000106d30:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d34:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d38:	83 e0 04             	and    $0x4,%eax
ffff800000106d3b:	48 85 c0             	test   %rax,%rax
ffff800000106d3e:	75 12                	jne    ffff800000106d52 <page_clean+0x48>
ffff800000106d40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d44:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106d48:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106d4d:	48 85 c0             	test   %rax,%rax
ffff800000106d50:	74 6f                	je     ffff800000106dc1 <page_clean+0xb7>
ffff800000106d52:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d56:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106d5a:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106d5e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d62:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106d66:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d6a:	48 8b 00             	mov    (%rax),%rax
ffff800000106d6d:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106d71:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106d75:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106d79:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d7d:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106d81:	48 85 c0             	test   %rax,%rax
ffff800000106d84:	0f 85 fb 00 00 00    	jne    ffff800000106e85 <page_clean+0x17b>
ffff800000106d8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d8e:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106d95:	00 
ffff800000106d96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d9a:	48 8b 00             	mov    (%rax),%rax
ffff800000106d9d:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106da1:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106da5:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106da9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dad:	48 8b 00             	mov    (%rax),%rax
ffff800000106db0:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106db4:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106db8:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106dbc:	e9 c4 00 00 00       	jmpq   ffff800000106e85 <page_clean+0x17b>
ffff800000106dc1:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106dc8:	80 ff ff 
ffff800000106dcb:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106dd2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dd6:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106dda:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106dde:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106de2:	48 01 d0             	add    %rdx,%rax
ffff800000106de5:	48 8b 10             	mov    (%rax),%rdx
ffff800000106de8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dec:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106df0:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106df4:	83 e0 3f             	and    $0x3f,%eax
ffff800000106df7:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106dfc:	89 c1                	mov    %eax,%ecx
ffff800000106dfe:	48 d3 e6             	shl    %cl,%rsi
ffff800000106e01:	48 89 f0             	mov    %rsi,%rax
ffff800000106e04:	48 f7 d0             	not    %rax
ffff800000106e07:	48 89 c6             	mov    %rax,%rsi
ffff800000106e0a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106e11:	80 ff ff 
ffff800000106e14:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106e1b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e1f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106e23:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106e27:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106e2b:	48 01 c8             	add    %rcx,%rax
ffff800000106e2e:	48 21 f2             	and    %rsi,%rdx
ffff800000106e31:	48 89 10             	mov    %rdx,(%rax)
ffff800000106e34:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e38:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106e3f:	00 
ffff800000106e40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e44:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000106e4b:	00 
ffff800000106e4c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e50:	48 8b 00             	mov    (%rax),%rax
ffff800000106e53:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106e57:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106e5b:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106e5f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e63:	48 8b 00             	mov    (%rax),%rax
ffff800000106e66:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106e6a:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106e6e:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106e72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106e76:	48 8b 00             	mov    (%rax),%rax
ffff800000106e79:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106e7d:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106e81:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106e85:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106e8a:	5d                   	pop    %rbp
ffff800000106e8b:	c3                   	retq   

ffff800000106e8c <init_memory>:
ffff800000106e8c:	55                   	push   %rbp
ffff800000106e8d:	48 89 e5             	mov    %rsp,%rbp
ffff800000106e90:	48 83 ec 60          	sub    $0x60,%rsp
ffff800000106e94:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff800000106e9b:	00 
ffff800000106e9c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106ea3:	00 
ffff800000106ea4:	48 ba a0 36 11 00 00 	movabs $0xffff8000001136a0,%rdx
ffff800000106eab:	80 ff ff 
ffff800000106eae:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106eb3:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106eb8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106ebd:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000106ec4:	80 ff ff 
ffff800000106ec7:	ff d1                	callq  *%rcx
ffff800000106ec9:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106ed0:	80 ff ff 
ffff800000106ed3:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106ed7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000106ede:	e9 ec 00 00 00       	jmpq   ffff800000106fcf <init_memory+0x143>
ffff800000106ee3:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000106eea:	00 
ffff800000106eeb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106eef:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106ef2:	83 f8 01             	cmp    $0x1,%eax
ffff800000106ef5:	75 0c                	jne    ffff800000106f03 <init_memory+0x77>
ffff800000106ef7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106efb:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106eff:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff800000106f03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f07:	48 8b 10             	mov    (%rax),%rdx
ffff800000106f0a:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f11:	80 ff ff 
ffff800000106f14:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f17:	48 63 c8             	movslq %eax,%rcx
ffff800000106f1a:	48 89 c8             	mov    %rcx,%rax
ffff800000106f1d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f21:	48 01 c8             	add    %rcx,%rax
ffff800000106f24:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f28:	48 01 f0             	add    %rsi,%rax
ffff800000106f2b:	48 89 10             	mov    %rdx,(%rax)
ffff800000106f2e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f32:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106f36:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f3d:	80 ff ff 
ffff800000106f40:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f43:	48 63 c8             	movslq %eax,%rcx
ffff800000106f46:	48 89 c8             	mov    %rcx,%rax
ffff800000106f49:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f4d:	48 01 c8             	add    %rcx,%rax
ffff800000106f50:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f54:	48 01 f0             	add    %rsi,%rax
ffff800000106f57:	48 83 c0 08          	add    $0x8,%rax
ffff800000106f5b:	48 89 10             	mov    %rdx,(%rax)
ffff800000106f5e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f62:	8b 50 10             	mov    0x10(%rax),%edx
ffff800000106f65:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f6c:	80 ff ff 
ffff800000106f6f:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f72:	48 63 c8             	movslq %eax,%rcx
ffff800000106f75:	48 89 c8             	mov    %rcx,%rax
ffff800000106f78:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f7c:	48 01 c8             	add    %rcx,%rax
ffff800000106f7f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f83:	48 01 f0             	add    %rsi,%rax
ffff800000106f86:	48 83 c0 10          	add    $0x10,%rax
ffff800000106f8a:	89 10                	mov    %edx,(%rax)
ffff800000106f8c:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000106f8f:	48 98                	cltq   
ffff800000106f91:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff800000106f98:	80 ff ff 
ffff800000106f9b:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
ffff800000106fa2:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
ffff800000106fa7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fab:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106fae:	83 f8 04             	cmp    $0x4,%eax
ffff800000106fb1:	77 26                	ja     ffff800000106fd9 <init_memory+0x14d>
ffff800000106fb3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fb7:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106fbb:	48 85 c0             	test   %rax,%rax
ffff800000106fbe:	74 19                	je     ffff800000106fd9 <init_memory+0x14d>
ffff800000106fc0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fc4:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106fc7:	85 c0                	test   %eax,%eax
ffff800000106fc9:	74 0e                	je     ffff800000106fd9 <init_memory+0x14d>
ffff800000106fcb:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000106fcf:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
ffff800000106fd3:	0f 8e 0a ff ff ff    	jle    ffff800000106ee3 <init_memory+0x57>
ffff800000106fd9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106fdd:	48 89 c1             	mov    %rax,%rcx
ffff800000106fe0:	48 ba 18 37 11 00 00 	movabs $0xffff800000113718,%rdx
ffff800000106fe7:	80 ff ff 
ffff800000106fea:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106fef:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000106ff4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106ff9:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000107000:	80 ff ff 
ffff800000107003:	41 ff d0             	callq  *%r8
ffff800000107006:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
ffff80000010700d:	00 
ffff80000010700e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000107015:	e9 e1 00 00 00       	jmpq   ffff8000001070fb <init_memory+0x26f>
ffff80000010701a:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107021:	80 ff ff 
ffff800000107024:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107027:	48 63 d0             	movslq %eax,%rdx
ffff80000010702a:	48 89 d0             	mov    %rdx,%rax
ffff80000010702d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107031:	48 01 d0             	add    %rdx,%rax
ffff800000107034:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107038:	48 01 c8             	add    %rcx,%rax
ffff80000010703b:	48 83 c0 10          	add    $0x10,%rax
ffff80000010703f:	8b 00                	mov    (%rax),%eax
ffff800000107041:	83 f8 01             	cmp    $0x1,%eax
ffff800000107044:	0f 85 a9 00 00 00    	jne    ffff8000001070f3 <init_memory+0x267>
ffff80000010704a:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107051:	80 ff ff 
ffff800000107054:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107057:	48 63 d0             	movslq %eax,%rdx
ffff80000010705a:	48 89 d0             	mov    %rdx,%rax
ffff80000010705d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107061:	48 01 d0             	add    %rdx,%rax
ffff800000107064:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107068:	48 01 c8             	add    %rcx,%rax
ffff80000010706b:	48 8b 00             	mov    (%rax),%rax
ffff80000010706e:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107074:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010707a:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff80000010707e:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107085:	80 ff ff 
ffff800000107088:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010708b:	48 63 d0             	movslq %eax,%rdx
ffff80000010708e:	48 89 d0             	mov    %rdx,%rax
ffff800000107091:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107095:	48 01 d0             	add    %rdx,%rax
ffff800000107098:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010709c:	48 01 c8             	add    %rcx,%rax
ffff80000010709f:	48 8b 08             	mov    (%rax),%rcx
ffff8000001070a2:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff8000001070a9:	80 ff ff 
ffff8000001070ac:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070af:	48 63 d0             	movslq %eax,%rdx
ffff8000001070b2:	48 89 d0             	mov    %rdx,%rax
ffff8000001070b5:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070b9:	48 01 d0             	add    %rdx,%rax
ffff8000001070bc:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070c0:	48 01 f0             	add    %rsi,%rax
ffff8000001070c3:	48 83 c0 08          	add    $0x8,%rax
ffff8000001070c7:	48 8b 00             	mov    (%rax),%rax
ffff8000001070ca:	48 01 c8             	add    %rcx,%rax
ffff8000001070cd:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001070d3:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff8000001070d7:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001070db:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
ffff8000001070df:	76 15                	jbe    ffff8000001070f6 <init_memory+0x26a>
ffff8000001070e1:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff8000001070e5:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
ffff8000001070e9:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001070ed:	48 01 45 f0          	add    %rax,-0x10(%rbp)
ffff8000001070f1:	eb 04                	jmp    ffff8000001070f7 <init_memory+0x26b>
ffff8000001070f3:	90                   	nop
ffff8000001070f4:	eb 01                	jmp    ffff8000001070f7 <init_memory+0x26b>
ffff8000001070f6:	90                   	nop
ffff8000001070f7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001070fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001070fe:	48 63 d0             	movslq %eax,%rdx
ffff800000107101:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107108:	80 ff ff 
ffff80000010710b:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff800000107112:	48 39 c2             	cmp    %rax,%rdx
ffff800000107115:	0f 86 ff fe ff ff    	jbe    ffff80000010701a <init_memory+0x18e>
ffff80000010711b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010711f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107123:	49 89 d0             	mov    %rdx,%r8
ffff800000107126:	48 89 c1             	mov    %rax,%rcx
ffff800000107129:	48 ba 38 37 11 00 00 	movabs $0xffff800000113738,%rdx
ffff800000107130:	80 ff ff 
ffff800000107133:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107138:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010713d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107142:	49 b9 35 53 10 00 00 	movabs $0xffff800000105335,%r9
ffff800000107149:	80 ff ff 
ffff80000010714c:	41 ff d1             	callq  *%r9
ffff80000010714f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107156:	80 ff ff 
ffff800000107159:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000107160:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107167:	80 ff ff 
ffff80000010716a:	48 89 d0             	mov    %rdx,%rax
ffff80000010716d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107171:	48 01 d0             	add    %rdx,%rax
ffff800000107174:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107178:	48 01 c8             	add    %rcx,%rax
ffff80000010717b:	48 8b 08             	mov    (%rax),%rcx
ffff80000010717e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107185:	80 ff ff 
ffff800000107188:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff80000010718f:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000107196:	80 ff ff 
ffff800000107199:	48 89 d0             	mov    %rdx,%rax
ffff80000010719c:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071a0:	48 01 d0             	add    %rdx,%rax
ffff8000001071a3:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001071a7:	48 01 f0             	add    %rsi,%rax
ffff8000001071aa:	48 83 c0 08          	add    $0x8,%rax
ffff8000001071ae:	48 8b 00             	mov    (%rax),%rax
ffff8000001071b1:	48 01 c8             	add    %rcx,%rax
ffff8000001071b4:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001071b8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071bf:	80 ff ff 
ffff8000001071c2:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff8000001071c9:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff8000001071cf:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff8000001071d5:	48 89 c2             	mov    %rax,%rdx
ffff8000001071d8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071df:	80 ff ff 
ffff8000001071e2:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
ffff8000001071e9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001071ed:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001071f1:	48 89 c2             	mov    %rax,%rdx
ffff8000001071f4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071fb:	80 ff ff 
ffff8000001071fe:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
ffff800000107205:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000107209:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010720d:	48 83 c0 3f          	add    $0x3f,%rax
ffff800000107211:	48 c1 e8 03          	shr    $0x3,%rax
ffff800000107215:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107219:	48 89 c2             	mov    %rax,%rdx
ffff80000010721c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107223:	80 ff ff 
ffff800000107226:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
ffff80000010722d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107234:	80 ff ff 
ffff800000107237:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff80000010723e:	48 89 c2             	mov    %rax,%rdx
ffff800000107241:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107248:	80 ff ff 
ffff80000010724b:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107252:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000107257:	48 89 c7             	mov    %rax,%rdi
ffff80000010725a:	48 b8 97 6a 10 00 00 	movabs $0xffff800000106a97,%rax
ffff800000107261:	80 ff ff 
ffff800000107264:	ff d0                	callq  *%rax
ffff800000107266:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010726d:	80 ff ff 
ffff800000107270:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000107277:	48 89 c2             	mov    %rax,%rdx
ffff80000010727a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107281:	80 ff ff 
ffff800000107284:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
ffff80000010728b:	48 01 d0             	add    %rdx,%rax
ffff80000010728e:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000107294:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff80000010729a:	48 89 c2             	mov    %rax,%rdx
ffff80000010729d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072a4:	80 ff ff 
ffff8000001072a7:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
ffff8000001072ae:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001072b2:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072b6:	48 89 c2             	mov    %rax,%rdx
ffff8000001072b9:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072c0:	80 ff ff 
ffff8000001072c3:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
ffff8000001072ca:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001072ce:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001072d2:	48 89 c2             	mov    %rax,%rdx
ffff8000001072d5:	48 89 d0             	mov    %rdx,%rax
ffff8000001072d8:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001072dc:	48 01 d0             	add    %rdx,%rax
ffff8000001072df:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001072e3:	48 83 c0 07          	add    $0x7,%rax
ffff8000001072e7:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001072eb:	48 89 c2             	mov    %rax,%rdx
ffff8000001072ee:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072f5:	80 ff ff 
ffff8000001072f8:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
ffff8000001072ff:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107306:	80 ff ff 
ffff800000107309:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff800000107310:	48 89 c2             	mov    %rax,%rdx
ffff800000107313:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010731a:	80 ff ff 
ffff80000010731d:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107324:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107329:	48 89 c7             	mov    %rax,%rdi
ffff80000010732c:	48 b8 97 6a 10 00 00 	movabs $0xffff800000106a97,%rax
ffff800000107333:	80 ff ff 
ffff800000107336:	ff d0                	callq  *%rax
ffff800000107338:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010733f:	80 ff ff 
ffff800000107342:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107349:	48 89 c2             	mov    %rax,%rdx
ffff80000010734c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107353:	80 ff ff 
ffff800000107356:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
ffff80000010735d:	48 01 d0             	add    %rdx,%rax
ffff800000107360:	48 05 ff 0f 00 00    	add    $0xfff,%rax
ffff800000107366:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffff80000010736c:	48 89 c2             	mov    %rax,%rdx
ffff80000010736f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107376:	80 ff ff 
ffff800000107379:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
ffff800000107380:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107387:	80 ff ff 
ffff80000010738a:	48 c7 80 c0 02 00 00 	movq   $0x0,0x2c0(%rax)
ffff800000107391:	00 00 00 00 
ffff800000107395:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010739c:	80 ff ff 
ffff80000010739f:	48 c7 80 c8 02 00 00 	movq   $0x190,0x2c8(%rax)
ffff8000001073a6:	90 01 00 00 
ffff8000001073aa:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073b1:	80 ff ff 
ffff8000001073b4:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001073bb:	48 89 c2             	mov    %rax,%rdx
ffff8000001073be:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073c5:	80 ff ff 
ffff8000001073c8:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001073cf:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001073d4:	48 89 c7             	mov    %rax,%rdi
ffff8000001073d7:	48 b8 97 6a 10 00 00 	movabs $0xffff800000106a97,%rax
ffff8000001073de:	80 ff ff 
ffff8000001073e1:	ff d0                	callq  *%rax
ffff8000001073e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff8000001073ea:	e9 e1 02 00 00       	jmpq   ffff8000001076d0 <init_memory+0x844>
ffff8000001073ef:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001073f6:	80 ff ff 
ffff8000001073f9:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001073fc:	48 63 d0             	movslq %eax,%rdx
ffff8000001073ff:	48 89 d0             	mov    %rdx,%rax
ffff800000107402:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107406:	48 01 d0             	add    %rdx,%rax
ffff800000107409:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010740d:	48 01 c8             	add    %rcx,%rax
ffff800000107410:	48 83 c0 10          	add    $0x10,%rax
ffff800000107414:	8b 00                	mov    (%rax),%eax
ffff800000107416:	83 f8 01             	cmp    $0x1,%eax
ffff800000107419:	0f 85 a9 02 00 00    	jne    ffff8000001076c8 <init_memory+0x83c>
ffff80000010741f:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000107426:	80 ff ff 
ffff800000107429:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010742c:	48 63 d0             	movslq %eax,%rdx
ffff80000010742f:	48 89 d0             	mov    %rdx,%rax
ffff800000107432:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107436:	48 01 d0             	add    %rdx,%rax
ffff800000107439:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010743d:	48 01 c8             	add    %rcx,%rax
ffff800000107440:	48 8b 00             	mov    (%rax),%rax
ffff800000107443:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107449:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010744f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107453:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff80000010745a:	80 ff ff 
ffff80000010745d:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107460:	48 63 d0             	movslq %eax,%rdx
ffff800000107463:	48 89 d0             	mov    %rdx,%rax
ffff800000107466:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010746a:	48 01 d0             	add    %rdx,%rax
ffff80000010746d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107471:	48 01 c8             	add    %rcx,%rax
ffff800000107474:	48 8b 08             	mov    (%rax),%rcx
ffff800000107477:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010747e:	80 ff ff 
ffff800000107481:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107484:	48 63 d0             	movslq %eax,%rdx
ffff800000107487:	48 89 d0             	mov    %rdx,%rax
ffff80000010748a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010748e:	48 01 d0             	add    %rdx,%rax
ffff800000107491:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107495:	48 01 f0             	add    %rsi,%rax
ffff800000107498:	48 83 c0 08          	add    $0x8,%rax
ffff80000010749c:	48 8b 00             	mov    (%rax),%rax
ffff80000010749f:	48 01 c8             	add    %rcx,%rax
ffff8000001074a2:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff8000001074a8:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff8000001074ac:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff8000001074b0:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
ffff8000001074b4:	0f 86 11 02 00 00    	jbe    ffff8000001076cb <init_memory+0x83f>
ffff8000001074ba:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074c1:	80 ff ff 
ffff8000001074c4:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff8000001074cb:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074d2:	80 ff ff 
ffff8000001074d5:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff8000001074dc:	48 89 d0             	mov    %rdx,%rax
ffff8000001074df:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074e3:	48 01 d0             	add    %rdx,%rax
ffff8000001074e6:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001074ea:	48 01 c8             	add    %rcx,%rax
ffff8000001074ed:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001074f1:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074f8:	80 ff ff 
ffff8000001074fb:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107502:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000107506:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010750d:	80 ff ff 
ffff800000107510:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
ffff800000107517:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010751b:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
ffff80000010751f:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000107523:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107527:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
ffff80000010752b:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff80000010752f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107533:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff800000107537:	48 89 c2             	mov    %rax,%rdx
ffff80000010753a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff80000010753e:	48 89 50 20          	mov    %rdx,0x20(%rax)
ffff800000107542:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107546:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff80000010754d:	00 
ffff80000010754e:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107552:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff800000107556:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010755a:	48 89 c2             	mov    %rax,%rdx
ffff80000010755d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107561:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000107565:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107569:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
ffff800000107570:	00 
ffff800000107571:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107575:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
ffff80000010757c:	00 
ffff80000010757d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff800000107581:	48 bf a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdi
ffff800000107588:	80 ff ff 
ffff80000010758b:	48 89 78 30          	mov    %rdi,0x30(%rax)
ffff80000010758f:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
ffff800000107593:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
ffff800000107597:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010759b:	48 89 c2             	mov    %rax,%rdx
ffff80000010759e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075a2:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff8000001075a6:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001075ad:	80 ff ff 
ffff8000001075b0:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001075b7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001075bb:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001075bf:	48 89 c2             	mov    %rax,%rdx
ffff8000001075c2:	48 89 d0             	mov    %rdx,%rax
ffff8000001075c5:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001075c9:	48 01 d0             	add    %rdx,%rax
ffff8000001075cc:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001075d0:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
ffff8000001075d4:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075d8:	48 89 10             	mov    %rdx,(%rax)
ffff8000001075db:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001075df:	48 8b 00             	mov    (%rax),%rax
ffff8000001075e2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001075e6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff8000001075ed:	e9 bd 00 00 00       	jmpq   ffff8000001076af <init_memory+0x823>
ffff8000001075f2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001075f6:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
ffff8000001075fa:	48 89 10             	mov    %rdx,(%rax)
ffff8000001075fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107600:	48 98                	cltq   
ffff800000107602:	48 c1 e0 15          	shl    $0x15,%rax
ffff800000107606:	48 89 c2             	mov    %rax,%rdx
ffff800000107609:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff80000010760d:	48 01 c2             	add    %rax,%rdx
ffff800000107610:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107614:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000107618:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010761c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107623:	00 
ffff800000107624:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107628:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff80000010762f:	00 
ffff800000107630:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107634:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff80000010763b:	00 
ffff80000010763c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107643:	80 ff ff 
ffff800000107646:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff80000010764d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107651:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107655:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107659:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010765d:	48 01 d0             	add    %rdx,%rax
ffff800000107660:	48 8b 10             	mov    (%rax),%rdx
ffff800000107663:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107667:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff80000010766b:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010766f:	83 e0 3f             	and    $0x3f,%eax
ffff800000107672:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107677:	89 c1                	mov    %eax,%ecx
ffff800000107679:	48 d3 e6             	shl    %cl,%rsi
ffff80000010767c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107683:	80 ff ff 
ffff800000107686:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff80000010768d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107691:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107695:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000107699:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010769d:	48 01 c8             	add    %rcx,%rax
ffff8000001076a0:	48 31 f2             	xor    %rsi,%rdx
ffff8000001076a3:	48 89 10             	mov    %rdx,(%rax)
ffff8000001076a6:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff8000001076aa:	48 83 45 e0 28       	addq   $0x28,-0x20(%rbp)
ffff8000001076af:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff8000001076b2:	48 63 d0             	movslq %eax,%rdx
ffff8000001076b5:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
ffff8000001076b9:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001076bd:	48 39 c2             	cmp    %rax,%rdx
ffff8000001076c0:	0f 82 2c ff ff ff    	jb     ffff8000001075f2 <init_memory+0x766>
ffff8000001076c6:	eb 04                	jmp    ffff8000001076cc <init_memory+0x840>
ffff8000001076c8:	90                   	nop
ffff8000001076c9:	eb 01                	jmp    ffff8000001076cc <init_memory+0x840>
ffff8000001076cb:	90                   	nop
ffff8000001076cc:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001076d0:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001076d3:	48 63 d0             	movslq %eax,%rdx
ffff8000001076d6:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001076dd:	80 ff ff 
ffff8000001076e0:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001076e7:	48 39 c2             	cmp    %rax,%rdx
ffff8000001076ea:	0f 86 ff fc ff ff    	jbe    ffff8000001073ef <init_memory+0x563>
ffff8000001076f0:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001076f7:	80 ff ff 
ffff8000001076fa:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107701:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff800000107708:	80 ff ff 
ffff80000010770b:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
ffff800000107712:	48 89 10             	mov    %rdx,(%rax)
ffff800000107715:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010771c:	80 ff ff 
ffff80000010771f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107726:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
ffff80000010772d:	00 
ffff80000010772e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107735:	80 ff ff 
ffff800000107738:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff80000010773f:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000107746:	00 
ffff800000107747:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010774e:	80 ff ff 
ffff800000107751:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107758:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff80000010775f:	00 
ffff800000107760:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107767:	80 ff ff 
ffff80000010776a:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107771:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff800000107778:	00 
ffff800000107779:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107780:	80 ff ff 
ffff800000107783:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff80000010778a:	48 89 d0             	mov    %rdx,%rax
ffff80000010778d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107791:	48 01 d0             	add    %rdx,%rax
ffff800000107794:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107798:	48 83 c0 07          	add    $0x7,%rax
ffff80000010779c:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff8000001077a0:	48 89 c2             	mov    %rax,%rdx
ffff8000001077a3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077aa:	80 ff ff 
ffff8000001077ad:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
ffff8000001077b4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077bb:	80 ff ff 
ffff8000001077be:	48 8b 88 98 02 00 00 	mov    0x298(%rax),%rcx
ffff8000001077c5:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077cc:	80 ff ff 
ffff8000001077cf:	48 8b 90 90 02 00 00 	mov    0x290(%rax),%rdx
ffff8000001077d6:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001077dd:	80 ff ff 
ffff8000001077e0:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff8000001077e7:	49 89 c9             	mov    %rcx,%r9
ffff8000001077ea:	49 89 d0             	mov    %rdx,%r8
ffff8000001077ed:	48 89 c1             	mov    %rax,%rcx
ffff8000001077f0:	48 ba 68 37 11 00 00 	movabs $0xffff800000113768,%rdx
ffff8000001077f7:	80 ff ff 
ffff8000001077fa:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001077ff:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107804:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107809:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000107810:	80 ff ff 
ffff800000107813:	41 ff d2             	callq  *%r10
ffff800000107816:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010781d:	80 ff ff 
ffff800000107820:	48 8b 88 b0 02 00 00 	mov    0x2b0(%rax),%rcx
ffff800000107827:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010782e:	80 ff ff 
ffff800000107831:	48 8b 90 a8 02 00 00 	mov    0x2a8(%rax),%rdx
ffff800000107838:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010783f:	80 ff ff 
ffff800000107842:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
ffff800000107849:	49 89 c9             	mov    %rcx,%r9
ffff80000010784c:	49 89 d0             	mov    %rdx,%r8
ffff80000010784f:	48 89 c1             	mov    %rax,%rcx
ffff800000107852:	48 ba a0 37 11 00 00 	movabs $0xffff8000001137a0,%rdx
ffff800000107859:	80 ff ff 
ffff80000010785c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107861:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107866:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010786b:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000107872:	80 ff ff 
ffff800000107875:	41 ff d2             	callq  *%r10
ffff800000107878:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010787f:	80 ff ff 
ffff800000107882:	48 8b 88 c8 02 00 00 	mov    0x2c8(%rax),%rcx
ffff800000107889:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107890:	80 ff ff 
ffff800000107893:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
ffff80000010789a:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001078a1:	80 ff ff 
ffff8000001078a4:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001078ab:	49 89 c9             	mov    %rcx,%r9
ffff8000001078ae:	49 89 d0             	mov    %rdx,%r8
ffff8000001078b1:	48 89 c1             	mov    %rax,%rcx
ffff8000001078b4:	48 ba e0 37 11 00 00 	movabs $0xffff8000001137e0,%rdx
ffff8000001078bb:	80 ff ff 
ffff8000001078be:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001078c3:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001078c8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001078cd:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff8000001078d4:	80 ff ff 
ffff8000001078d7:	41 ff d2             	callq  *%r10
ffff8000001078da:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff8000001078e1:	80 ff ff 
ffff8000001078e4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff8000001078ea:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff8000001078f1:	80 ff ff 
ffff8000001078f4:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffff8000001078fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
ffff800000107901:	e9 b2 00 00 00       	jmpq   ffff8000001079b8 <init_memory+0xb2c>
ffff800000107906:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010790d:	80 ff ff 
ffff800000107910:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107917:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010791a:	48 63 d0             	movslq %eax,%rdx
ffff80000010791d:	48 89 d0             	mov    %rdx,%rax
ffff800000107920:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107924:	48 01 d0             	add    %rdx,%rax
ffff800000107927:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010792b:	48 01 c8             	add    %rcx,%rax
ffff80000010792e:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107932:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107936:	48 8b 48 08          	mov    0x8(%rax),%rcx
ffff80000010793a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010793e:	48 8b 10             	mov    (%rax),%rdx
ffff800000107941:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107945:	48 8b 78 20          	mov    0x20(%rax),%rdi
ffff800000107949:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010794d:	48 8b 70 18          	mov    0x18(%rax),%rsi
ffff800000107951:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107955:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107959:	51                   	push   %rcx
ffff80000010795a:	52                   	push   %rdx
ffff80000010795b:	49 89 f9             	mov    %rdi,%r9
ffff80000010795e:	49 89 f0             	mov    %rsi,%r8
ffff800000107961:	48 89 c1             	mov    %rax,%rcx
ffff800000107964:	48 ba 20 38 11 00 00 	movabs $0xffff800000113820,%rdx
ffff80000010796b:	80 ff ff 
ffff80000010796e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107973:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107978:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010797d:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000107984:	80 ff ff 
ffff800000107987:	41 ff d2             	callq  *%r10
ffff80000010798a:	48 83 c4 10          	add    $0x10,%rsp
ffff80000010798e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107992:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107996:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
ffff80000010799d:	00 00 00 
ffff8000001079a0:	48 39 d0             	cmp    %rdx,%rax
ffff8000001079a3:	75 0f                	jne    ffff8000001079b4 <init_memory+0xb28>
ffff8000001079a5:	48 ba 38 90 12 00 00 	movabs $0xffff800000129038,%rdx
ffff8000001079ac:	80 ff ff 
ffff8000001079af:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001079b2:	89 02                	mov    %eax,(%rdx)
ffff8000001079b4:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff8000001079b8:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001079bb:	48 63 d0             	movslq %eax,%rdx
ffff8000001079be:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079c5:	80 ff ff 
ffff8000001079c8:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff8000001079cf:	48 39 c2             	cmp    %rax,%rdx
ffff8000001079d2:	0f 82 2e ff ff ff    	jb     ffff800000107906 <init_memory+0xa7a>
ffff8000001079d8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079df:	80 ff ff 
ffff8000001079e2:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
ffff8000001079e9:	48 89 c2             	mov    %rax,%rdx
ffff8000001079ec:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001079f3:	80 ff ff 
ffff8000001079f6:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
ffff8000001079fd:	48 01 d0             	add    %rdx,%rax
ffff800000107a00:	48 05 00 01 00 00    	add    $0x100,%rax
ffff800000107a06:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
ffff800000107a0a:	48 89 c2             	mov    %rax,%rdx
ffff800000107a0d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a14:	80 ff ff 
ffff800000107a17:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
ffff800000107a1e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a25:	80 ff ff 
ffff800000107a28:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
ffff800000107a2f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a36:	80 ff ff 
ffff800000107a39:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
ffff800000107a40:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a47:	80 ff ff 
ffff800000107a4a:	48 8b b8 e0 02 00 00 	mov    0x2e0(%rax),%rdi
ffff800000107a51:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a58:	80 ff ff 
ffff800000107a5b:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
ffff800000107a62:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107a69:	80 ff ff 
ffff800000107a6c:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000107a73:	51                   	push   %rcx
ffff800000107a74:	52                   	push   %rdx
ffff800000107a75:	49 89 f9             	mov    %rdi,%r9
ffff800000107a78:	49 89 f0             	mov    %rsi,%r8
ffff800000107a7b:	48 89 c1             	mov    %rax,%rcx
ffff800000107a7e:	48 ba 98 38 11 00 00 	movabs $0xffff800000113898,%rdx
ffff800000107a85:	80 ff ff 
ffff800000107a88:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107a8d:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107a92:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107a97:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000107a9e:	80 ff ff 
ffff800000107aa1:	41 ff d2             	callq  *%r10
ffff800000107aa4:	48 83 c4 10          	add    $0x10,%rsp
ffff800000107aa8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107aaf:	80 ff ff 
ffff800000107ab2:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
ffff800000107ab9:	48 ba 00 00 00 00 00 	movabs $0x800000000000,%rdx
ffff800000107ac0:	80 00 00 
ffff800000107ac3:	48 01 d0             	add    %rdx,%rax
ffff800000107ac6:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107aca:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107acd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107ad4:	eb 40                	jmp    ffff800000107b16 <init_memory+0xc8a>
ffff800000107ad6:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107add:	80 ff ff 
ffff800000107ae0:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107ae7:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107aea:	48 63 d0             	movslq %eax,%rdx
ffff800000107aed:	48 89 d0             	mov    %rdx,%rax
ffff800000107af0:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107af4:	48 01 d0             	add    %rdx,%rax
ffff800000107af7:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107afb:	48 01 c8             	add    %rcx,%rax
ffff800000107afe:	be 93 00 00 00       	mov    $0x93,%esi
ffff800000107b03:	48 89 c7             	mov    %rax,%rdi
ffff800000107b06:	48 b8 1e 6b 10 00 00 	movabs $0xffff800000106b1e,%rax
ffff800000107b0d:	80 ff ff 
ffff800000107b10:	ff d0                	callq  *%rax
ffff800000107b12:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
ffff800000107b16:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107b19:	3b 45 fc             	cmp    -0x4(%rbp),%eax
ffff800000107b1c:	7e b8                	jle    ffff800000107ad6 <init_memory+0xc4a>
ffff800000107b1e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b23:	48 ba 0d 6b 10 00 00 	movabs $0xffff800000106b0d,%rdx
ffff800000107b2a:	80 ff ff 
ffff800000107b2d:	ff d2                	callq  *%rdx
ffff800000107b2f:	48 ba 28 90 12 00 00 	movabs $0xffff800000129028,%rdx
ffff800000107b36:	80 ff ff 
ffff800000107b39:	48 89 02             	mov    %rax,(%rdx)
ffff800000107b3c:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107b43:	80 ff ff 
ffff800000107b46:	48 8b 00             	mov    (%rax),%rax
ffff800000107b49:	48 89 c1             	mov    %rax,%rcx
ffff800000107b4c:	48 ba f4 38 11 00 00 	movabs $0xffff8000001138f4,%rdx
ffff800000107b53:	80 ff ff 
ffff800000107b56:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107b5b:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107b60:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107b65:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000107b6c:	80 ff ff 
ffff800000107b6f:	41 ff d0             	callq  *%r8
ffff800000107b72:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107b79:	80 ff ff 
ffff800000107b7c:	48 8b 00             	mov    (%rax),%rax
ffff800000107b7f:	48 89 c2             	mov    %rax,%rdx
ffff800000107b82:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107b89:	80 ff ff 
ffff800000107b8c:	48 01 d0             	add    %rdx,%rax
ffff800000107b8f:	48 8b 00             	mov    (%rax),%rax
ffff800000107b92:	b0 00                	mov    $0x0,%al
ffff800000107b94:	48 89 c1             	mov    %rax,%rcx
ffff800000107b97:	48 ba 09 39 11 00 00 	movabs $0xffff800000113909,%rdx
ffff800000107b9e:	80 ff ff 
ffff800000107ba1:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107ba6:	bf ff ff 00 00       	mov    $0xffff,%edi
ffff800000107bab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107bb0:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000107bb7:	80 ff ff 
ffff800000107bba:	41 ff d0             	callq  *%r8
ffff800000107bbd:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000107bc4:	80 ff ff 
ffff800000107bc7:	48 8b 00             	mov    (%rax),%rax
ffff800000107bca:	48 89 c2             	mov    %rax,%rdx
ffff800000107bcd:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107bd4:	80 ff ff 
ffff800000107bd7:	48 01 d0             	add    %rdx,%rax
ffff800000107bda:	48 8b 00             	mov    (%rax),%rax
ffff800000107bdd:	b0 00                	mov    $0x0,%al
ffff800000107bdf:	48 89 c2             	mov    %rax,%rdx
ffff800000107be2:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
ffff800000107be9:	80 ff ff 
ffff800000107bec:	48 01 d0             	add    %rdx,%rax
ffff800000107bef:	48 8b 00             	mov    (%rax),%rax
ffff800000107bf2:	b0 00                	mov    $0x0,%al
ffff800000107bf4:	48 89 c1             	mov    %rax,%rcx
ffff800000107bf7:	48 ba 1f 39 11 00 00 	movabs $0xffff80000011391f,%rdx
ffff800000107bfe:	80 ff ff 
ffff800000107c01:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107c06:	bf ff 00 80 00       	mov    $0x8000ff,%edi
ffff800000107c0b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107c10:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000107c17:	80 ff ff 
ffff800000107c1a:	41 ff d0             	callq  *%r8
ffff800000107c1d:	0f 20 d8             	mov    %cr3,%rax
ffff800000107c20:	0f 22 d8             	mov    %rax,%cr3
ffff800000107c23:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107c27:	90                   	nop
ffff800000107c28:	c9                   	leaveq 
ffff800000107c29:	c3                   	retq   

ffff800000107c2a <alloc_pages>:
ffff800000107c2a:	55                   	push   %rbp
ffff800000107c2b:	48 89 e5             	mov    %rsp,%rbp
ffff800000107c2e:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107c32:	89 7d 8c             	mov    %edi,-0x74(%rbp)
ffff800000107c35:	89 75 88             	mov    %esi,-0x78(%rbp)
ffff800000107c38:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
ffff800000107c3c:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000107c43:	00 
ffff800000107c44:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107c4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff800000107c52:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107c56:	74 4c                	je     ffff800000107ca4 <alloc_pages+0x7a>
ffff800000107c58:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107c5c:	7f 6e                	jg     ffff800000107ccc <alloc_pages+0xa2>
ffff800000107c5e:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
ffff800000107c62:	74 08                	je     ffff800000107c6c <alloc_pages+0x42>
ffff800000107c64:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
ffff800000107c68:	74 1a                	je     ffff800000107c84 <alloc_pages+0x5a>
ffff800000107c6a:	eb 60                	jmp    ffff800000107ccc <alloc_pages+0xa2>
ffff800000107c6c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107c73:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107c7a:	80 ff ff 
ffff800000107c7d:	8b 00                	mov    (%rax),%eax
ffff800000107c7f:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107c82:	eb 77                	jmp    ffff800000107cfb <alloc_pages+0xd1>
ffff800000107c84:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff800000107c8b:	80 ff ff 
ffff800000107c8e:	8b 00                	mov    (%rax),%eax
ffff800000107c90:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107c93:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff800000107c9a:	80 ff ff 
ffff800000107c9d:	8b 00                	mov    (%rax),%eax
ffff800000107c9f:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107ca2:	eb 57                	jmp    ffff800000107cfb <alloc_pages+0xd1>
ffff800000107ca4:	48 b8 38 90 12 00 00 	movabs $0xffff800000129038,%rax
ffff800000107cab:	80 ff ff 
ffff800000107cae:	8b 00                	mov    (%rax),%eax
ffff800000107cb0:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff800000107cb3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107cba:	80 ff ff 
ffff800000107cbd:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff800000107cc4:	83 e8 01             	sub    $0x1,%eax
ffff800000107cc7:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff800000107cca:	eb 2f                	jmp    ffff800000107cfb <alloc_pages+0xd1>
ffff800000107ccc:	48 ba 38 39 11 00 00 	movabs $0xffff800000113938,%rdx
ffff800000107cd3:	80 ff ff 
ffff800000107cd6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107cdb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107ce0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107ce5:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000107cec:	80 ff ff 
ffff800000107cef:	ff d1                	callq  *%rcx
ffff800000107cf1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107cf6:	e9 5f 02 00 00       	jmpq   ffff800000107f5a <alloc_pages+0x330>
ffff800000107cfb:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107cfe:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107d01:	e9 1b 02 00 00       	jmpq   ffff800000107f21 <alloc_pages+0x2f7>
ffff800000107d06:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d0d:	80 ff ff 
ffff800000107d10:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107d17:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107d1a:	48 63 d0             	movslq %eax,%rdx
ffff800000107d1d:	48 89 d0             	mov    %rdx,%rax
ffff800000107d20:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107d24:	48 01 d0             	add    %rdx,%rax
ffff800000107d27:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107d2b:	48 01 c8             	add    %rcx,%rax
ffff800000107d2e:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107d32:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107d35:	48 98                	cltq   
ffff800000107d37:	48 39 c2             	cmp    %rax,%rdx
ffff800000107d3a:	0f 82 dc 01 00 00    	jb     ffff800000107f1c <alloc_pages+0x2f2>
ffff800000107d40:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107d47:	80 ff ff 
ffff800000107d4a:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107d51:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107d54:	48 63 d0             	movslq %eax,%rdx
ffff800000107d57:	48 89 d0             	mov    %rdx,%rax
ffff800000107d5a:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107d5e:	48 01 d0             	add    %rdx,%rax
ffff800000107d61:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107d65:	48 01 c8             	add    %rcx,%rax
ffff800000107d68:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107d6c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d70:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107d74:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d78:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff800000107d7c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d80:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000107d84:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d88:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff800000107d8c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107d90:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000107d94:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107d98:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff800000107d9c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107da0:	83 e0 3f             	and    $0x3f,%eax
ffff800000107da3:	48 89 c2             	mov    %rax,%rdx
ffff800000107da6:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107dab:	48 29 d0             	sub    %rdx,%rax
ffff800000107dae:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff800000107db2:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff800000107db6:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000107dba:	e9 4d 01 00 00       	jmpq   ffff800000107f0c <alloc_pages+0x2e2>
ffff800000107dbf:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107dc6:	80 ff ff 
ffff800000107dc9:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000107dd0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107dd4:	48 c1 e8 06          	shr    $0x6,%rax
ffff800000107dd8:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ddc:	48 01 d0             	add    %rdx,%rax
ffff800000107ddf:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107de3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107de7:	83 e0 3f             	and    $0x3f,%eax
ffff800000107dea:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107dee:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107df2:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000107df6:	e9 e3 00 00 00       	jmpq   ffff800000107ede <alloc_pages+0x2b4>
ffff800000107dfb:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107dff:	48 8b 00             	mov    (%rax),%rax
ffff800000107e02:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000107e06:	89 d1                	mov    %edx,%ecx
ffff800000107e08:	48 d3 e8             	shr    %cl,%rax
ffff800000107e0b:	48 89 c6             	mov    %rax,%rsi
ffff800000107e0e:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107e12:	48 83 c0 08          	add    $0x8,%rax
ffff800000107e16:	48 8b 10             	mov    (%rax),%rdx
ffff800000107e19:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107e1d:	89 c1                	mov    %eax,%ecx
ffff800000107e1f:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107e24:	29 c8                	sub    %ecx,%eax
ffff800000107e26:	89 c1                	mov    %eax,%ecx
ffff800000107e28:	48 d3 e2             	shl    %cl,%rdx
ffff800000107e2b:	48 89 d0             	mov    %rdx,%rax
ffff800000107e2e:	48 09 c6             	or     %rax,%rsi
ffff800000107e31:	48 89 f2             	mov    %rsi,%rdx
ffff800000107e34:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
ffff800000107e38:	74 16                	je     ffff800000107e50 <alloc_pages+0x226>
ffff800000107e3a:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107e3d:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107e42:	89 c1                	mov    %eax,%ecx
ffff800000107e44:	48 d3 e6             	shl    %cl,%rsi
ffff800000107e47:	48 89 f0             	mov    %rsi,%rax
ffff800000107e4a:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107e4e:	eb 07                	jmp    ffff800000107e57 <alloc_pages+0x22d>
ffff800000107e50:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000107e57:	48 21 d0             	and    %rdx,%rax
ffff800000107e5a:	48 85 c0             	test   %rax,%rax
ffff800000107e5d:	75 7a                	jne    ffff800000107ed9 <alloc_pages+0x2af>
ffff800000107e5f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000107e63:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107e67:	48 01 d0             	add    %rdx,%rax
ffff800000107e6a:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107e6e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107e72:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000107e79:	00 
ffff800000107e7a:	eb 50                	jmp    ffff800000107ecc <alloc_pages+0x2a2>
ffff800000107e7c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107e83:	80 ff ff 
ffff800000107e86:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107e8d:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107e91:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107e95:	48 01 c2             	add    %rax,%rdx
ffff800000107e98:	48 89 d0             	mov    %rdx,%rax
ffff800000107e9b:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107e9f:	48 01 d0             	add    %rdx,%rax
ffff800000107ea2:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107ea6:	48 01 c8             	add    %rcx,%rax
ffff800000107ea9:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000107ead:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
ffff800000107eb1:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff800000107eb5:	48 89 d6             	mov    %rdx,%rsi
ffff800000107eb8:	48 89 c7             	mov    %rax,%rdi
ffff800000107ebb:	48 b8 1e 6b 10 00 00 	movabs $0xffff800000106b1e,%rax
ffff800000107ec2:	80 ff ff 
ffff800000107ec5:	ff d0                	callq  *%rax
ffff800000107ec7:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
ffff800000107ecc:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107ecf:	48 98                	cltq   
ffff800000107ed1:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff800000107ed5:	72 a5                	jb     ffff800000107e7c <alloc_pages+0x252>
ffff800000107ed7:	eb 5b                	jmp    ffff800000107f34 <alloc_pages+0x30a>
ffff800000107ed9:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000107ede:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107ee3:	48 2b 45 98          	sub    -0x68(%rbp),%rax
ffff800000107ee7:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
ffff800000107eeb:	0f 82 0a ff ff ff    	jb     ffff800000107dfb <alloc_pages+0x1d1>
ffff800000107ef1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107ef5:	83 e0 3f             	and    $0x3f,%eax
ffff800000107ef8:	48 85 c0             	test   %rax,%rax
ffff800000107efb:	74 06                	je     ffff800000107f03 <alloc_pages+0x2d9>
ffff800000107efd:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107f01:	eb 05                	jmp    ffff800000107f08 <alloc_pages+0x2de>
ffff800000107f03:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107f08:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000107f0c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107f10:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
ffff800000107f14:	0f 86 a5 fe ff ff    	jbe    ffff800000107dbf <alloc_pages+0x195>
ffff800000107f1a:	eb 01                	jmp    ffff800000107f1d <alloc_pages+0x2f3>
ffff800000107f1c:	90                   	nop
ffff800000107f1d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107f21:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107f24:	3b 45 f4             	cmp    -0xc(%rbp),%eax
ffff800000107f27:	0f 8e d9 fd ff ff    	jle    ffff800000107d06 <alloc_pages+0xdc>
ffff800000107f2d:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107f32:	eb 26                	jmp    ffff800000107f5a <alloc_pages+0x330>
ffff800000107f34:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107f3b:	80 ff ff 
ffff800000107f3e:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff800000107f45:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff800000107f49:	48 89 d0             	mov    %rdx,%rax
ffff800000107f4c:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107f50:	48 01 d0             	add    %rdx,%rax
ffff800000107f53:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107f57:	48 01 c8             	add    %rcx,%rax
ffff800000107f5a:	c9                   	leaveq 
ffff800000107f5b:	c3                   	retq   

ffff800000107f5c <io_in8>:
ffff800000107f5c:	55                   	push   %rbp
ffff800000107f5d:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f60:	89 f8                	mov    %edi,%eax
ffff800000107f62:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff800000107f66:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff800000107f6a:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107f6e:	89 c2                	mov    %eax,%edx
ffff800000107f70:	ec                   	in     (%dx),%al
ffff800000107f71:	0f ae f0             	mfence 
ffff800000107f74:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107f77:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107f7b:	5d                   	pop    %rbp
ffff800000107f7c:	c3                   	retq   

ffff800000107f7d <io_out8>:
ffff800000107f7d:	55                   	push   %rbp
ffff800000107f7e:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f81:	89 f8                	mov    %edi,%eax
ffff800000107f83:	89 f2                	mov    %esi,%edx
ffff800000107f85:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
ffff800000107f89:	89 d0                	mov    %edx,%eax
ffff800000107f8b:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff800000107f8e:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff800000107f92:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff800000107f96:	ee                   	out    %al,(%dx)
ffff800000107f97:	0f ae f0             	mfence 
ffff800000107f9a:	90                   	nop
ffff800000107f9b:	5d                   	pop    %rbp
ffff800000107f9c:	c3                   	retq   

ffff800000107f9d <set_intr_gate>:
ffff800000107f9d:	55                   	push   %rbp
ffff800000107f9e:	48 89 e5             	mov    %rsp,%rbp
ffff800000107fa1:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff800000107fa4:	89 f0                	mov    %esi,%eax
ffff800000107fa6:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff800000107faa:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff800000107fad:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107fb0:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107fb4:	48 89 c2             	mov    %rax,%rdx
ffff800000107fb7:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff800000107fbe:	80 ff ff 
ffff800000107fc1:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000107fc5:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000107fc8:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107fcc:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000107fd0:	48 b8 22 9e 10 00 00 	movabs $0xffff800000109e22,%rax
ffff800000107fd7:	80 ff ff 
ffff800000107fda:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff800000107fde:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107fe2:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff800000107fe8:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff800000107fec:	48 89 c2             	mov    %rax,%rdx
ffff800000107fef:	44 89 c0             	mov    %r8d,%eax
ffff800000107ff2:	66 89 d0             	mov    %dx,%ax
ffff800000107ff5:	48 83 e1 07          	and    $0x7,%rcx
ffff800000107ff9:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff800000108000:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000108004:	48 01 c8             	add    %rcx,%rax
ffff800000108007:	48 31 c9             	xor    %rcx,%rcx
ffff80000010800a:	89 d1                	mov    %edx,%ecx
ffff80000010800c:	48 c1 e9 10          	shr    $0x10,%rcx
ffff800000108010:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000108014:	48 01 c8             	add    %rcx,%rax
ffff800000108017:	48 89 06             	mov    %rax,(%rsi)
ffff80000010801a:	48 c1 ea 20          	shr    $0x20,%rdx
ffff80000010801e:	48 89 17             	mov    %rdx,(%rdi)
ffff800000108021:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108025:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff800000108029:	90                   	nop
ffff80000010802a:	5d                   	pop    %rbp
ffff80000010802b:	c3                   	retq   
ffff80000010802c:	55                   	push   %rbp
ffff80000010802d:	48 89 e5             	mov    %rsp,%rbp
ffff800000108030:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108034:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108038:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff80000010803c:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000108040:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108044:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000108048:	48 ba 30 ae 10 00 00 	movabs $0xffff80000010ae30,%rdx
ffff80000010804f:	80 ff ff 
ffff800000108052:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108056:	48 89 02             	mov    %rax,(%rdx)
ffff800000108059:	48 ba 38 ae 10 00 00 	movabs $0xffff80000010ae38,%rdx
ffff800000108060:	80 ff ff 
ffff800000108063:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108067:	48 89 02             	mov    %rax,(%rdx)
ffff80000010806a:	48 ba 40 ae 10 00 00 	movabs $0xffff80000010ae40,%rdx
ffff800000108071:	80 ff ff 
ffff800000108074:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108078:	48 89 02             	mov    %rax,(%rdx)
ffff80000010807b:	48 ba 50 ae 10 00 00 	movabs $0xffff80000010ae50,%rdx
ffff800000108082:	80 ff ff 
ffff800000108085:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108089:	48 89 02             	mov    %rax,(%rdx)
ffff80000010808c:	48 ba 58 ae 10 00 00 	movabs $0xffff80000010ae58,%rdx
ffff800000108093:	80 ff ff 
ffff800000108096:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010809a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010809d:	48 ba 60 ae 10 00 00 	movabs $0xffff80000010ae60,%rdx
ffff8000001080a4:	80 ff ff 
ffff8000001080a7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001080ab:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080ae:	48 ba 68 ae 10 00 00 	movabs $0xffff80000010ae68,%rdx
ffff8000001080b5:	80 ff ff 
ffff8000001080b8:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff8000001080bc:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080bf:	48 ba 70 ae 10 00 00 	movabs $0xffff80000010ae70,%rdx
ffff8000001080c6:	80 ff ff 
ffff8000001080c9:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff8000001080cd:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080d0:	48 ba 78 ae 10 00 00 	movabs $0xffff80000010ae78,%rdx
ffff8000001080d7:	80 ff ff 
ffff8000001080da:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff8000001080de:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080e1:	48 ba 80 ae 10 00 00 	movabs $0xffff80000010ae80,%rdx
ffff8000001080e8:	80 ff ff 
ffff8000001080eb:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff8000001080ef:	48 89 02             	mov    %rax,(%rdx)
ffff8000001080f2:	90                   	nop
ffff8000001080f3:	5d                   	pop    %rbp
ffff8000001080f4:	c3                   	retq   

ffff8000001080f5 <IRQ0x20_interrupt>:
ffff8000001080f5:	6a 00                	pushq  $0x0
ffff8000001080f7:	fc                   	cld    
ffff8000001080f8:	50                   	push   %rax
ffff8000001080f9:	50                   	push   %rax
ffff8000001080fa:	48 8c c0             	mov    %es,%rax
ffff8000001080fd:	50                   	push   %rax
ffff8000001080fe:	48 8c d8             	mov    %ds,%rax
ffff800000108101:	50                   	push   %rax
ffff800000108102:	48 31 c0             	xor    %rax,%rax
ffff800000108105:	55                   	push   %rbp
ffff800000108106:	57                   	push   %rdi
ffff800000108107:	56                   	push   %rsi
ffff800000108108:	52                   	push   %rdx
ffff800000108109:	51                   	push   %rcx
ffff80000010810a:	53                   	push   %rbx
ffff80000010810b:	41 50                	push   %r8
ffff80000010810d:	41 51                	push   %r9
ffff80000010810f:	41 52                	push   %r10
ffff800000108111:	41 53                	push   %r11
ffff800000108113:	41 54                	push   %r12
ffff800000108115:	41 55                	push   %r13
ffff800000108117:	41 56                	push   %r14
ffff800000108119:	41 57                	push   %r15
ffff80000010811b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108122:	48 8e da             	mov    %rdx,%ds
ffff800000108125:	48 8e c2             	mov    %rdx,%es
ffff800000108128:	48 89 e7             	mov    %rsp,%rdi
ffff80000010812b:	48 8d 05 f3 be ff ff 	lea    -0x410d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108132:	50                   	push   %rax
ffff800000108133:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff80000010813a:	e9 f2 07 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010813f <IRQ0x21_interrupt>:
ffff80000010813f:	6a 00                	pushq  $0x0
ffff800000108141:	fc                   	cld    
ffff800000108142:	50                   	push   %rax
ffff800000108143:	50                   	push   %rax
ffff800000108144:	48 8c c0             	mov    %es,%rax
ffff800000108147:	50                   	push   %rax
ffff800000108148:	48 8c d8             	mov    %ds,%rax
ffff80000010814b:	50                   	push   %rax
ffff80000010814c:	48 31 c0             	xor    %rax,%rax
ffff80000010814f:	55                   	push   %rbp
ffff800000108150:	57                   	push   %rdi
ffff800000108151:	56                   	push   %rsi
ffff800000108152:	52                   	push   %rdx
ffff800000108153:	51                   	push   %rcx
ffff800000108154:	53                   	push   %rbx
ffff800000108155:	41 50                	push   %r8
ffff800000108157:	41 51                	push   %r9
ffff800000108159:	41 52                	push   %r10
ffff80000010815b:	41 53                	push   %r11
ffff80000010815d:	41 54                	push   %r12
ffff80000010815f:	41 55                	push   %r13
ffff800000108161:	41 56                	push   %r14
ffff800000108163:	41 57                	push   %r15
ffff800000108165:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010816c:	48 8e da             	mov    %rdx,%ds
ffff80000010816f:	48 8e c2             	mov    %rdx,%es
ffff800000108172:	48 89 e7             	mov    %rsp,%rdi
ffff800000108175:	48 8d 05 a9 be ff ff 	lea    -0x4157(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010817c:	50                   	push   %rax
ffff80000010817d:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff800000108184:	e9 a8 07 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108189 <IRQ0x22_interrupt>:
ffff800000108189:	6a 00                	pushq  $0x0
ffff80000010818b:	fc                   	cld    
ffff80000010818c:	50                   	push   %rax
ffff80000010818d:	50                   	push   %rax
ffff80000010818e:	48 8c c0             	mov    %es,%rax
ffff800000108191:	50                   	push   %rax
ffff800000108192:	48 8c d8             	mov    %ds,%rax
ffff800000108195:	50                   	push   %rax
ffff800000108196:	48 31 c0             	xor    %rax,%rax
ffff800000108199:	55                   	push   %rbp
ffff80000010819a:	57                   	push   %rdi
ffff80000010819b:	56                   	push   %rsi
ffff80000010819c:	52                   	push   %rdx
ffff80000010819d:	51                   	push   %rcx
ffff80000010819e:	53                   	push   %rbx
ffff80000010819f:	41 50                	push   %r8
ffff8000001081a1:	41 51                	push   %r9
ffff8000001081a3:	41 52                	push   %r10
ffff8000001081a5:	41 53                	push   %r11
ffff8000001081a7:	41 54                	push   %r12
ffff8000001081a9:	41 55                	push   %r13
ffff8000001081ab:	41 56                	push   %r14
ffff8000001081ad:	41 57                	push   %r15
ffff8000001081af:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001081b6:	48 8e da             	mov    %rdx,%ds
ffff8000001081b9:	48 8e c2             	mov    %rdx,%es
ffff8000001081bc:	48 89 e7             	mov    %rsp,%rdi
ffff8000001081bf:	48 8d 05 5f be ff ff 	lea    -0x41a1(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001081c6:	50                   	push   %rax
ffff8000001081c7:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff8000001081ce:	e9 5e 07 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001081d3 <IRQ0x23_interrupt>:
ffff8000001081d3:	6a 00                	pushq  $0x0
ffff8000001081d5:	fc                   	cld    
ffff8000001081d6:	50                   	push   %rax
ffff8000001081d7:	50                   	push   %rax
ffff8000001081d8:	48 8c c0             	mov    %es,%rax
ffff8000001081db:	50                   	push   %rax
ffff8000001081dc:	48 8c d8             	mov    %ds,%rax
ffff8000001081df:	50                   	push   %rax
ffff8000001081e0:	48 31 c0             	xor    %rax,%rax
ffff8000001081e3:	55                   	push   %rbp
ffff8000001081e4:	57                   	push   %rdi
ffff8000001081e5:	56                   	push   %rsi
ffff8000001081e6:	52                   	push   %rdx
ffff8000001081e7:	51                   	push   %rcx
ffff8000001081e8:	53                   	push   %rbx
ffff8000001081e9:	41 50                	push   %r8
ffff8000001081eb:	41 51                	push   %r9
ffff8000001081ed:	41 52                	push   %r10
ffff8000001081ef:	41 53                	push   %r11
ffff8000001081f1:	41 54                	push   %r12
ffff8000001081f3:	41 55                	push   %r13
ffff8000001081f5:	41 56                	push   %r14
ffff8000001081f7:	41 57                	push   %r15
ffff8000001081f9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108200:	48 8e da             	mov    %rdx,%ds
ffff800000108203:	48 8e c2             	mov    %rdx,%es
ffff800000108206:	48 89 e7             	mov    %rsp,%rdi
ffff800000108209:	48 8d 05 15 be ff ff 	lea    -0x41eb(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108210:	50                   	push   %rax
ffff800000108211:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff800000108218:	e9 14 07 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010821d <IRQ0x24_interrupt>:
ffff80000010821d:	6a 00                	pushq  $0x0
ffff80000010821f:	fc                   	cld    
ffff800000108220:	50                   	push   %rax
ffff800000108221:	50                   	push   %rax
ffff800000108222:	48 8c c0             	mov    %es,%rax
ffff800000108225:	50                   	push   %rax
ffff800000108226:	48 8c d8             	mov    %ds,%rax
ffff800000108229:	50                   	push   %rax
ffff80000010822a:	48 31 c0             	xor    %rax,%rax
ffff80000010822d:	55                   	push   %rbp
ffff80000010822e:	57                   	push   %rdi
ffff80000010822f:	56                   	push   %rsi
ffff800000108230:	52                   	push   %rdx
ffff800000108231:	51                   	push   %rcx
ffff800000108232:	53                   	push   %rbx
ffff800000108233:	41 50                	push   %r8
ffff800000108235:	41 51                	push   %r9
ffff800000108237:	41 52                	push   %r10
ffff800000108239:	41 53                	push   %r11
ffff80000010823b:	41 54                	push   %r12
ffff80000010823d:	41 55                	push   %r13
ffff80000010823f:	41 56                	push   %r14
ffff800000108241:	41 57                	push   %r15
ffff800000108243:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010824a:	48 8e da             	mov    %rdx,%ds
ffff80000010824d:	48 8e c2             	mov    %rdx,%es
ffff800000108250:	48 89 e7             	mov    %rsp,%rdi
ffff800000108253:	48 8d 05 cb bd ff ff 	lea    -0x4235(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010825a:	50                   	push   %rax
ffff80000010825b:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff800000108262:	e9 ca 06 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108267 <IRQ0x25_interrupt>:
ffff800000108267:	6a 00                	pushq  $0x0
ffff800000108269:	fc                   	cld    
ffff80000010826a:	50                   	push   %rax
ffff80000010826b:	50                   	push   %rax
ffff80000010826c:	48 8c c0             	mov    %es,%rax
ffff80000010826f:	50                   	push   %rax
ffff800000108270:	48 8c d8             	mov    %ds,%rax
ffff800000108273:	50                   	push   %rax
ffff800000108274:	48 31 c0             	xor    %rax,%rax
ffff800000108277:	55                   	push   %rbp
ffff800000108278:	57                   	push   %rdi
ffff800000108279:	56                   	push   %rsi
ffff80000010827a:	52                   	push   %rdx
ffff80000010827b:	51                   	push   %rcx
ffff80000010827c:	53                   	push   %rbx
ffff80000010827d:	41 50                	push   %r8
ffff80000010827f:	41 51                	push   %r9
ffff800000108281:	41 52                	push   %r10
ffff800000108283:	41 53                	push   %r11
ffff800000108285:	41 54                	push   %r12
ffff800000108287:	41 55                	push   %r13
ffff800000108289:	41 56                	push   %r14
ffff80000010828b:	41 57                	push   %r15
ffff80000010828d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108294:	48 8e da             	mov    %rdx,%ds
ffff800000108297:	48 8e c2             	mov    %rdx,%es
ffff80000010829a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010829d:	48 8d 05 81 bd ff ff 	lea    -0x427f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082a4:	50                   	push   %rax
ffff8000001082a5:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff8000001082ac:	e9 80 06 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001082b1 <IRQ0x26_interrupt>:
ffff8000001082b1:	6a 00                	pushq  $0x0
ffff8000001082b3:	fc                   	cld    
ffff8000001082b4:	50                   	push   %rax
ffff8000001082b5:	50                   	push   %rax
ffff8000001082b6:	48 8c c0             	mov    %es,%rax
ffff8000001082b9:	50                   	push   %rax
ffff8000001082ba:	48 8c d8             	mov    %ds,%rax
ffff8000001082bd:	50                   	push   %rax
ffff8000001082be:	48 31 c0             	xor    %rax,%rax
ffff8000001082c1:	55                   	push   %rbp
ffff8000001082c2:	57                   	push   %rdi
ffff8000001082c3:	56                   	push   %rsi
ffff8000001082c4:	52                   	push   %rdx
ffff8000001082c5:	51                   	push   %rcx
ffff8000001082c6:	53                   	push   %rbx
ffff8000001082c7:	41 50                	push   %r8
ffff8000001082c9:	41 51                	push   %r9
ffff8000001082cb:	41 52                	push   %r10
ffff8000001082cd:	41 53                	push   %r11
ffff8000001082cf:	41 54                	push   %r12
ffff8000001082d1:	41 55                	push   %r13
ffff8000001082d3:	41 56                	push   %r14
ffff8000001082d5:	41 57                	push   %r15
ffff8000001082d7:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001082de:	48 8e da             	mov    %rdx,%ds
ffff8000001082e1:	48 8e c2             	mov    %rdx,%es
ffff8000001082e4:	48 89 e7             	mov    %rsp,%rdi
ffff8000001082e7:	48 8d 05 37 bd ff ff 	lea    -0x42c9(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001082ee:	50                   	push   %rax
ffff8000001082ef:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff8000001082f6:	e9 36 06 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001082fb <IRQ0x27_interrupt>:
ffff8000001082fb:	6a 00                	pushq  $0x0
ffff8000001082fd:	fc                   	cld    
ffff8000001082fe:	50                   	push   %rax
ffff8000001082ff:	50                   	push   %rax
ffff800000108300:	48 8c c0             	mov    %es,%rax
ffff800000108303:	50                   	push   %rax
ffff800000108304:	48 8c d8             	mov    %ds,%rax
ffff800000108307:	50                   	push   %rax
ffff800000108308:	48 31 c0             	xor    %rax,%rax
ffff80000010830b:	55                   	push   %rbp
ffff80000010830c:	57                   	push   %rdi
ffff80000010830d:	56                   	push   %rsi
ffff80000010830e:	52                   	push   %rdx
ffff80000010830f:	51                   	push   %rcx
ffff800000108310:	53                   	push   %rbx
ffff800000108311:	41 50                	push   %r8
ffff800000108313:	41 51                	push   %r9
ffff800000108315:	41 52                	push   %r10
ffff800000108317:	41 53                	push   %r11
ffff800000108319:	41 54                	push   %r12
ffff80000010831b:	41 55                	push   %r13
ffff80000010831d:	41 56                	push   %r14
ffff80000010831f:	41 57                	push   %r15
ffff800000108321:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108328:	48 8e da             	mov    %rdx,%ds
ffff80000010832b:	48 8e c2             	mov    %rdx,%es
ffff80000010832e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108331:	48 8d 05 ed bc ff ff 	lea    -0x4313(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108338:	50                   	push   %rax
ffff800000108339:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff800000108340:	e9 ec 05 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108345 <IRQ0x28_interrupt>:
ffff800000108345:	6a 00                	pushq  $0x0
ffff800000108347:	fc                   	cld    
ffff800000108348:	50                   	push   %rax
ffff800000108349:	50                   	push   %rax
ffff80000010834a:	48 8c c0             	mov    %es,%rax
ffff80000010834d:	50                   	push   %rax
ffff80000010834e:	48 8c d8             	mov    %ds,%rax
ffff800000108351:	50                   	push   %rax
ffff800000108352:	48 31 c0             	xor    %rax,%rax
ffff800000108355:	55                   	push   %rbp
ffff800000108356:	57                   	push   %rdi
ffff800000108357:	56                   	push   %rsi
ffff800000108358:	52                   	push   %rdx
ffff800000108359:	51                   	push   %rcx
ffff80000010835a:	53                   	push   %rbx
ffff80000010835b:	41 50                	push   %r8
ffff80000010835d:	41 51                	push   %r9
ffff80000010835f:	41 52                	push   %r10
ffff800000108361:	41 53                	push   %r11
ffff800000108363:	41 54                	push   %r12
ffff800000108365:	41 55                	push   %r13
ffff800000108367:	41 56                	push   %r14
ffff800000108369:	41 57                	push   %r15
ffff80000010836b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108372:	48 8e da             	mov    %rdx,%ds
ffff800000108375:	48 8e c2             	mov    %rdx,%es
ffff800000108378:	48 89 e7             	mov    %rsp,%rdi
ffff80000010837b:	48 8d 05 a3 bc ff ff 	lea    -0x435d(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108382:	50                   	push   %rax
ffff800000108383:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff80000010838a:	e9 a2 05 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010838f <IRQ0x29_interrupt>:
ffff80000010838f:	6a 00                	pushq  $0x0
ffff800000108391:	fc                   	cld    
ffff800000108392:	50                   	push   %rax
ffff800000108393:	50                   	push   %rax
ffff800000108394:	48 8c c0             	mov    %es,%rax
ffff800000108397:	50                   	push   %rax
ffff800000108398:	48 8c d8             	mov    %ds,%rax
ffff80000010839b:	50                   	push   %rax
ffff80000010839c:	48 31 c0             	xor    %rax,%rax
ffff80000010839f:	55                   	push   %rbp
ffff8000001083a0:	57                   	push   %rdi
ffff8000001083a1:	56                   	push   %rsi
ffff8000001083a2:	52                   	push   %rdx
ffff8000001083a3:	51                   	push   %rcx
ffff8000001083a4:	53                   	push   %rbx
ffff8000001083a5:	41 50                	push   %r8
ffff8000001083a7:	41 51                	push   %r9
ffff8000001083a9:	41 52                	push   %r10
ffff8000001083ab:	41 53                	push   %r11
ffff8000001083ad:	41 54                	push   %r12
ffff8000001083af:	41 55                	push   %r13
ffff8000001083b1:	41 56                	push   %r14
ffff8000001083b3:	41 57                	push   %r15
ffff8000001083b5:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001083bc:	48 8e da             	mov    %rdx,%ds
ffff8000001083bf:	48 8e c2             	mov    %rdx,%es
ffff8000001083c2:	48 89 e7             	mov    %rsp,%rdi
ffff8000001083c5:	48 8d 05 59 bc ff ff 	lea    -0x43a7(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001083cc:	50                   	push   %rax
ffff8000001083cd:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff8000001083d4:	e9 58 05 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001083d9 <IRQ0x2a_interrupt>:
ffff8000001083d9:	6a 00                	pushq  $0x0
ffff8000001083db:	fc                   	cld    
ffff8000001083dc:	50                   	push   %rax
ffff8000001083dd:	50                   	push   %rax
ffff8000001083de:	48 8c c0             	mov    %es,%rax
ffff8000001083e1:	50                   	push   %rax
ffff8000001083e2:	48 8c d8             	mov    %ds,%rax
ffff8000001083e5:	50                   	push   %rax
ffff8000001083e6:	48 31 c0             	xor    %rax,%rax
ffff8000001083e9:	55                   	push   %rbp
ffff8000001083ea:	57                   	push   %rdi
ffff8000001083eb:	56                   	push   %rsi
ffff8000001083ec:	52                   	push   %rdx
ffff8000001083ed:	51                   	push   %rcx
ffff8000001083ee:	53                   	push   %rbx
ffff8000001083ef:	41 50                	push   %r8
ffff8000001083f1:	41 51                	push   %r9
ffff8000001083f3:	41 52                	push   %r10
ffff8000001083f5:	41 53                	push   %r11
ffff8000001083f7:	41 54                	push   %r12
ffff8000001083f9:	41 55                	push   %r13
ffff8000001083fb:	41 56                	push   %r14
ffff8000001083fd:	41 57                	push   %r15
ffff8000001083ff:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108406:	48 8e da             	mov    %rdx,%ds
ffff800000108409:	48 8e c2             	mov    %rdx,%es
ffff80000010840c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010840f:	48 8d 05 0f bc ff ff 	lea    -0x43f1(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108416:	50                   	push   %rax
ffff800000108417:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff80000010841e:	e9 0e 05 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108423 <IRQ0x2b_interrupt>:
ffff800000108423:	6a 00                	pushq  $0x0
ffff800000108425:	fc                   	cld    
ffff800000108426:	50                   	push   %rax
ffff800000108427:	50                   	push   %rax
ffff800000108428:	48 8c c0             	mov    %es,%rax
ffff80000010842b:	50                   	push   %rax
ffff80000010842c:	48 8c d8             	mov    %ds,%rax
ffff80000010842f:	50                   	push   %rax
ffff800000108430:	48 31 c0             	xor    %rax,%rax
ffff800000108433:	55                   	push   %rbp
ffff800000108434:	57                   	push   %rdi
ffff800000108435:	56                   	push   %rsi
ffff800000108436:	52                   	push   %rdx
ffff800000108437:	51                   	push   %rcx
ffff800000108438:	53                   	push   %rbx
ffff800000108439:	41 50                	push   %r8
ffff80000010843b:	41 51                	push   %r9
ffff80000010843d:	41 52                	push   %r10
ffff80000010843f:	41 53                	push   %r11
ffff800000108441:	41 54                	push   %r12
ffff800000108443:	41 55                	push   %r13
ffff800000108445:	41 56                	push   %r14
ffff800000108447:	41 57                	push   %r15
ffff800000108449:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108450:	48 8e da             	mov    %rdx,%ds
ffff800000108453:	48 8e c2             	mov    %rdx,%es
ffff800000108456:	48 89 e7             	mov    %rsp,%rdi
ffff800000108459:	48 8d 05 c5 bb ff ff 	lea    -0x443b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108460:	50                   	push   %rax
ffff800000108461:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff800000108468:	e9 c4 04 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010846d <IRQ0x2c_interrupt>:
ffff80000010846d:	6a 00                	pushq  $0x0
ffff80000010846f:	fc                   	cld    
ffff800000108470:	50                   	push   %rax
ffff800000108471:	50                   	push   %rax
ffff800000108472:	48 8c c0             	mov    %es,%rax
ffff800000108475:	50                   	push   %rax
ffff800000108476:	48 8c d8             	mov    %ds,%rax
ffff800000108479:	50                   	push   %rax
ffff80000010847a:	48 31 c0             	xor    %rax,%rax
ffff80000010847d:	55                   	push   %rbp
ffff80000010847e:	57                   	push   %rdi
ffff80000010847f:	56                   	push   %rsi
ffff800000108480:	52                   	push   %rdx
ffff800000108481:	51                   	push   %rcx
ffff800000108482:	53                   	push   %rbx
ffff800000108483:	41 50                	push   %r8
ffff800000108485:	41 51                	push   %r9
ffff800000108487:	41 52                	push   %r10
ffff800000108489:	41 53                	push   %r11
ffff80000010848b:	41 54                	push   %r12
ffff80000010848d:	41 55                	push   %r13
ffff80000010848f:	41 56                	push   %r14
ffff800000108491:	41 57                	push   %r15
ffff800000108493:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010849a:	48 8e da             	mov    %rdx,%ds
ffff80000010849d:	48 8e c2             	mov    %rdx,%es
ffff8000001084a0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084a3:	48 8d 05 7b bb ff ff 	lea    -0x4485(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084aa:	50                   	push   %rax
ffff8000001084ab:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff8000001084b2:	e9 7a 04 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001084b7 <IRQ0x2d_interrupt>:
ffff8000001084b7:	6a 00                	pushq  $0x0
ffff8000001084b9:	fc                   	cld    
ffff8000001084ba:	50                   	push   %rax
ffff8000001084bb:	50                   	push   %rax
ffff8000001084bc:	48 8c c0             	mov    %es,%rax
ffff8000001084bf:	50                   	push   %rax
ffff8000001084c0:	48 8c d8             	mov    %ds,%rax
ffff8000001084c3:	50                   	push   %rax
ffff8000001084c4:	48 31 c0             	xor    %rax,%rax
ffff8000001084c7:	55                   	push   %rbp
ffff8000001084c8:	57                   	push   %rdi
ffff8000001084c9:	56                   	push   %rsi
ffff8000001084ca:	52                   	push   %rdx
ffff8000001084cb:	51                   	push   %rcx
ffff8000001084cc:	53                   	push   %rbx
ffff8000001084cd:	41 50                	push   %r8
ffff8000001084cf:	41 51                	push   %r9
ffff8000001084d1:	41 52                	push   %r10
ffff8000001084d3:	41 53                	push   %r11
ffff8000001084d5:	41 54                	push   %r12
ffff8000001084d7:	41 55                	push   %r13
ffff8000001084d9:	41 56                	push   %r14
ffff8000001084db:	41 57                	push   %r15
ffff8000001084dd:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001084e4:	48 8e da             	mov    %rdx,%ds
ffff8000001084e7:	48 8e c2             	mov    %rdx,%es
ffff8000001084ea:	48 89 e7             	mov    %rsp,%rdi
ffff8000001084ed:	48 8d 05 31 bb ff ff 	lea    -0x44cf(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001084f4:	50                   	push   %rax
ffff8000001084f5:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff8000001084fc:	e9 30 04 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108501 <IRQ0x2e_interrupt>:
ffff800000108501:	6a 00                	pushq  $0x0
ffff800000108503:	fc                   	cld    
ffff800000108504:	50                   	push   %rax
ffff800000108505:	50                   	push   %rax
ffff800000108506:	48 8c c0             	mov    %es,%rax
ffff800000108509:	50                   	push   %rax
ffff80000010850a:	48 8c d8             	mov    %ds,%rax
ffff80000010850d:	50                   	push   %rax
ffff80000010850e:	48 31 c0             	xor    %rax,%rax
ffff800000108511:	55                   	push   %rbp
ffff800000108512:	57                   	push   %rdi
ffff800000108513:	56                   	push   %rsi
ffff800000108514:	52                   	push   %rdx
ffff800000108515:	51                   	push   %rcx
ffff800000108516:	53                   	push   %rbx
ffff800000108517:	41 50                	push   %r8
ffff800000108519:	41 51                	push   %r9
ffff80000010851b:	41 52                	push   %r10
ffff80000010851d:	41 53                	push   %r11
ffff80000010851f:	41 54                	push   %r12
ffff800000108521:	41 55                	push   %r13
ffff800000108523:	41 56                	push   %r14
ffff800000108525:	41 57                	push   %r15
ffff800000108527:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010852e:	48 8e da             	mov    %rdx,%ds
ffff800000108531:	48 8e c2             	mov    %rdx,%es
ffff800000108534:	48 89 e7             	mov    %rsp,%rdi
ffff800000108537:	48 8d 05 e7 ba ff ff 	lea    -0x4519(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010853e:	50                   	push   %rax
ffff80000010853f:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff800000108546:	e9 e6 03 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010854b <IRQ0x2f_interrupt>:
ffff80000010854b:	6a 00                	pushq  $0x0
ffff80000010854d:	fc                   	cld    
ffff80000010854e:	50                   	push   %rax
ffff80000010854f:	50                   	push   %rax
ffff800000108550:	48 8c c0             	mov    %es,%rax
ffff800000108553:	50                   	push   %rax
ffff800000108554:	48 8c d8             	mov    %ds,%rax
ffff800000108557:	50                   	push   %rax
ffff800000108558:	48 31 c0             	xor    %rax,%rax
ffff80000010855b:	55                   	push   %rbp
ffff80000010855c:	57                   	push   %rdi
ffff80000010855d:	56                   	push   %rsi
ffff80000010855e:	52                   	push   %rdx
ffff80000010855f:	51                   	push   %rcx
ffff800000108560:	53                   	push   %rbx
ffff800000108561:	41 50                	push   %r8
ffff800000108563:	41 51                	push   %r9
ffff800000108565:	41 52                	push   %r10
ffff800000108567:	41 53                	push   %r11
ffff800000108569:	41 54                	push   %r12
ffff80000010856b:	41 55                	push   %r13
ffff80000010856d:	41 56                	push   %r14
ffff80000010856f:	41 57                	push   %r15
ffff800000108571:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108578:	48 8e da             	mov    %rdx,%ds
ffff80000010857b:	48 8e c2             	mov    %rdx,%es
ffff80000010857e:	48 89 e7             	mov    %rsp,%rdi
ffff800000108581:	48 8d 05 9d ba ff ff 	lea    -0x4563(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108588:	50                   	push   %rax
ffff800000108589:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff800000108590:	e9 9c 03 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108595 <IRQ0x30_interrupt>:
ffff800000108595:	6a 00                	pushq  $0x0
ffff800000108597:	fc                   	cld    
ffff800000108598:	50                   	push   %rax
ffff800000108599:	50                   	push   %rax
ffff80000010859a:	48 8c c0             	mov    %es,%rax
ffff80000010859d:	50                   	push   %rax
ffff80000010859e:	48 8c d8             	mov    %ds,%rax
ffff8000001085a1:	50                   	push   %rax
ffff8000001085a2:	48 31 c0             	xor    %rax,%rax
ffff8000001085a5:	55                   	push   %rbp
ffff8000001085a6:	57                   	push   %rdi
ffff8000001085a7:	56                   	push   %rsi
ffff8000001085a8:	52                   	push   %rdx
ffff8000001085a9:	51                   	push   %rcx
ffff8000001085aa:	53                   	push   %rbx
ffff8000001085ab:	41 50                	push   %r8
ffff8000001085ad:	41 51                	push   %r9
ffff8000001085af:	41 52                	push   %r10
ffff8000001085b1:	41 53                	push   %r11
ffff8000001085b3:	41 54                	push   %r12
ffff8000001085b5:	41 55                	push   %r13
ffff8000001085b7:	41 56                	push   %r14
ffff8000001085b9:	41 57                	push   %r15
ffff8000001085bb:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001085c2:	48 8e da             	mov    %rdx,%ds
ffff8000001085c5:	48 8e c2             	mov    %rdx,%es
ffff8000001085c8:	48 89 e7             	mov    %rsp,%rdi
ffff8000001085cb:	48 8d 05 53 ba ff ff 	lea    -0x45ad(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001085d2:	50                   	push   %rax
ffff8000001085d3:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff8000001085da:	e9 52 03 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001085df <IRQ0x31_interrupt>:
ffff8000001085df:	6a 00                	pushq  $0x0
ffff8000001085e1:	fc                   	cld    
ffff8000001085e2:	50                   	push   %rax
ffff8000001085e3:	50                   	push   %rax
ffff8000001085e4:	48 8c c0             	mov    %es,%rax
ffff8000001085e7:	50                   	push   %rax
ffff8000001085e8:	48 8c d8             	mov    %ds,%rax
ffff8000001085eb:	50                   	push   %rax
ffff8000001085ec:	48 31 c0             	xor    %rax,%rax
ffff8000001085ef:	55                   	push   %rbp
ffff8000001085f0:	57                   	push   %rdi
ffff8000001085f1:	56                   	push   %rsi
ffff8000001085f2:	52                   	push   %rdx
ffff8000001085f3:	51                   	push   %rcx
ffff8000001085f4:	53                   	push   %rbx
ffff8000001085f5:	41 50                	push   %r8
ffff8000001085f7:	41 51                	push   %r9
ffff8000001085f9:	41 52                	push   %r10
ffff8000001085fb:	41 53                	push   %r11
ffff8000001085fd:	41 54                	push   %r12
ffff8000001085ff:	41 55                	push   %r13
ffff800000108601:	41 56                	push   %r14
ffff800000108603:	41 57                	push   %r15
ffff800000108605:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010860c:	48 8e da             	mov    %rdx,%ds
ffff80000010860f:	48 8e c2             	mov    %rdx,%es
ffff800000108612:	48 89 e7             	mov    %rsp,%rdi
ffff800000108615:	48 8d 05 09 ba ff ff 	lea    -0x45f7(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010861c:	50                   	push   %rax
ffff80000010861d:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff800000108624:	e9 08 03 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108629 <IRQ0x32_interrupt>:
ffff800000108629:	6a 00                	pushq  $0x0
ffff80000010862b:	fc                   	cld    
ffff80000010862c:	50                   	push   %rax
ffff80000010862d:	50                   	push   %rax
ffff80000010862e:	48 8c c0             	mov    %es,%rax
ffff800000108631:	50                   	push   %rax
ffff800000108632:	48 8c d8             	mov    %ds,%rax
ffff800000108635:	50                   	push   %rax
ffff800000108636:	48 31 c0             	xor    %rax,%rax
ffff800000108639:	55                   	push   %rbp
ffff80000010863a:	57                   	push   %rdi
ffff80000010863b:	56                   	push   %rsi
ffff80000010863c:	52                   	push   %rdx
ffff80000010863d:	51                   	push   %rcx
ffff80000010863e:	53                   	push   %rbx
ffff80000010863f:	41 50                	push   %r8
ffff800000108641:	41 51                	push   %r9
ffff800000108643:	41 52                	push   %r10
ffff800000108645:	41 53                	push   %r11
ffff800000108647:	41 54                	push   %r12
ffff800000108649:	41 55                	push   %r13
ffff80000010864b:	41 56                	push   %r14
ffff80000010864d:	41 57                	push   %r15
ffff80000010864f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108656:	48 8e da             	mov    %rdx,%ds
ffff800000108659:	48 8e c2             	mov    %rdx,%es
ffff80000010865c:	48 89 e7             	mov    %rsp,%rdi
ffff80000010865f:	48 8d 05 bf b9 ff ff 	lea    -0x4641(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108666:	50                   	push   %rax
ffff800000108667:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff80000010866e:	e9 be 02 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108673 <IRQ0x33_interrupt>:
ffff800000108673:	6a 00                	pushq  $0x0
ffff800000108675:	fc                   	cld    
ffff800000108676:	50                   	push   %rax
ffff800000108677:	50                   	push   %rax
ffff800000108678:	48 8c c0             	mov    %es,%rax
ffff80000010867b:	50                   	push   %rax
ffff80000010867c:	48 8c d8             	mov    %ds,%rax
ffff80000010867f:	50                   	push   %rax
ffff800000108680:	48 31 c0             	xor    %rax,%rax
ffff800000108683:	55                   	push   %rbp
ffff800000108684:	57                   	push   %rdi
ffff800000108685:	56                   	push   %rsi
ffff800000108686:	52                   	push   %rdx
ffff800000108687:	51                   	push   %rcx
ffff800000108688:	53                   	push   %rbx
ffff800000108689:	41 50                	push   %r8
ffff80000010868b:	41 51                	push   %r9
ffff80000010868d:	41 52                	push   %r10
ffff80000010868f:	41 53                	push   %r11
ffff800000108691:	41 54                	push   %r12
ffff800000108693:	41 55                	push   %r13
ffff800000108695:	41 56                	push   %r14
ffff800000108697:	41 57                	push   %r15
ffff800000108699:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086a0:	48 8e da             	mov    %rdx,%ds
ffff8000001086a3:	48 8e c2             	mov    %rdx,%es
ffff8000001086a6:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086a9:	48 8d 05 75 b9 ff ff 	lea    -0x468b(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086b0:	50                   	push   %rax
ffff8000001086b1:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff8000001086b8:	e9 74 02 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001086bd <IRQ0x34_interrupt>:
ffff8000001086bd:	6a 00                	pushq  $0x0
ffff8000001086bf:	fc                   	cld    
ffff8000001086c0:	50                   	push   %rax
ffff8000001086c1:	50                   	push   %rax
ffff8000001086c2:	48 8c c0             	mov    %es,%rax
ffff8000001086c5:	50                   	push   %rax
ffff8000001086c6:	48 8c d8             	mov    %ds,%rax
ffff8000001086c9:	50                   	push   %rax
ffff8000001086ca:	48 31 c0             	xor    %rax,%rax
ffff8000001086cd:	55                   	push   %rbp
ffff8000001086ce:	57                   	push   %rdi
ffff8000001086cf:	56                   	push   %rsi
ffff8000001086d0:	52                   	push   %rdx
ffff8000001086d1:	51                   	push   %rcx
ffff8000001086d2:	53                   	push   %rbx
ffff8000001086d3:	41 50                	push   %r8
ffff8000001086d5:	41 51                	push   %r9
ffff8000001086d7:	41 52                	push   %r10
ffff8000001086d9:	41 53                	push   %r11
ffff8000001086db:	41 54                	push   %r12
ffff8000001086dd:	41 55                	push   %r13
ffff8000001086df:	41 56                	push   %r14
ffff8000001086e1:	41 57                	push   %r15
ffff8000001086e3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001086ea:	48 8e da             	mov    %rdx,%ds
ffff8000001086ed:	48 8e c2             	mov    %rdx,%es
ffff8000001086f0:	48 89 e7             	mov    %rsp,%rdi
ffff8000001086f3:	48 8d 05 2b b9 ff ff 	lea    -0x46d5(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001086fa:	50                   	push   %rax
ffff8000001086fb:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff800000108702:	e9 2a 02 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108707 <IRQ0x35_interrupt>:
ffff800000108707:	6a 00                	pushq  $0x0
ffff800000108709:	fc                   	cld    
ffff80000010870a:	50                   	push   %rax
ffff80000010870b:	50                   	push   %rax
ffff80000010870c:	48 8c c0             	mov    %es,%rax
ffff80000010870f:	50                   	push   %rax
ffff800000108710:	48 8c d8             	mov    %ds,%rax
ffff800000108713:	50                   	push   %rax
ffff800000108714:	48 31 c0             	xor    %rax,%rax
ffff800000108717:	55                   	push   %rbp
ffff800000108718:	57                   	push   %rdi
ffff800000108719:	56                   	push   %rsi
ffff80000010871a:	52                   	push   %rdx
ffff80000010871b:	51                   	push   %rcx
ffff80000010871c:	53                   	push   %rbx
ffff80000010871d:	41 50                	push   %r8
ffff80000010871f:	41 51                	push   %r9
ffff800000108721:	41 52                	push   %r10
ffff800000108723:	41 53                	push   %r11
ffff800000108725:	41 54                	push   %r12
ffff800000108727:	41 55                	push   %r13
ffff800000108729:	41 56                	push   %r14
ffff80000010872b:	41 57                	push   %r15
ffff80000010872d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000108734:	48 8e da             	mov    %rdx,%ds
ffff800000108737:	48 8e c2             	mov    %rdx,%es
ffff80000010873a:	48 89 e7             	mov    %rsp,%rdi
ffff80000010873d:	48 8d 05 e1 b8 ff ff 	lea    -0x471f(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000108744:	50                   	push   %rax
ffff800000108745:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff80000010874c:	e9 e0 01 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff800000108751 <IRQ0x36_interrupt>:
ffff800000108751:	6a 00                	pushq  $0x0
ffff800000108753:	fc                   	cld    
ffff800000108754:	50                   	push   %rax
ffff800000108755:	50                   	push   %rax
ffff800000108756:	48 8c c0             	mov    %es,%rax
ffff800000108759:	50                   	push   %rax
ffff80000010875a:	48 8c d8             	mov    %ds,%rax
ffff80000010875d:	50                   	push   %rax
ffff80000010875e:	48 31 c0             	xor    %rax,%rax
ffff800000108761:	55                   	push   %rbp
ffff800000108762:	57                   	push   %rdi
ffff800000108763:	56                   	push   %rsi
ffff800000108764:	52                   	push   %rdx
ffff800000108765:	51                   	push   %rcx
ffff800000108766:	53                   	push   %rbx
ffff800000108767:	41 50                	push   %r8
ffff800000108769:	41 51                	push   %r9
ffff80000010876b:	41 52                	push   %r10
ffff80000010876d:	41 53                	push   %r11
ffff80000010876f:	41 54                	push   %r12
ffff800000108771:	41 55                	push   %r13
ffff800000108773:	41 56                	push   %r14
ffff800000108775:	41 57                	push   %r15
ffff800000108777:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010877e:	48 8e da             	mov    %rdx,%ds
ffff800000108781:	48 8e c2             	mov    %rdx,%es
ffff800000108784:	48 89 e7             	mov    %rsp,%rdi
ffff800000108787:	48 8d 05 97 b8 ff ff 	lea    -0x4769(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010878e:	50                   	push   %rax
ffff80000010878f:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff800000108796:	e9 96 01 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff80000010879b <IRQ0x37_interrupt>:
ffff80000010879b:	6a 00                	pushq  $0x0
ffff80000010879d:	fc                   	cld    
ffff80000010879e:	50                   	push   %rax
ffff80000010879f:	50                   	push   %rax
ffff8000001087a0:	48 8c c0             	mov    %es,%rax
ffff8000001087a3:	50                   	push   %rax
ffff8000001087a4:	48 8c d8             	mov    %ds,%rax
ffff8000001087a7:	50                   	push   %rax
ffff8000001087a8:	48 31 c0             	xor    %rax,%rax
ffff8000001087ab:	55                   	push   %rbp
ffff8000001087ac:	57                   	push   %rdi
ffff8000001087ad:	56                   	push   %rsi
ffff8000001087ae:	52                   	push   %rdx
ffff8000001087af:	51                   	push   %rcx
ffff8000001087b0:	53                   	push   %rbx
ffff8000001087b1:	41 50                	push   %r8
ffff8000001087b3:	41 51                	push   %r9
ffff8000001087b5:	41 52                	push   %r10
ffff8000001087b7:	41 53                	push   %r11
ffff8000001087b9:	41 54                	push   %r12
ffff8000001087bb:	41 55                	push   %r13
ffff8000001087bd:	41 56                	push   %r14
ffff8000001087bf:	41 57                	push   %r15
ffff8000001087c1:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001087c8:	48 8e da             	mov    %rdx,%ds
ffff8000001087cb:	48 8e c2             	mov    %rdx,%es
ffff8000001087ce:	48 89 e7             	mov    %rsp,%rdi
ffff8000001087d1:	48 8d 05 4d b8 ff ff 	lea    -0x47b3(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001087d8:	50                   	push   %rax
ffff8000001087d9:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff8000001087e0:	e9 4c 01 00 00       	jmpq   ffff800000108931 <do_IRQ>

ffff8000001087e5 <init_interrupt>:
ffff8000001087e5:	55                   	push   %rbp
ffff8000001087e6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001087e9:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001087ed:	c7 45 fc 20 00 00 00 	movl   $0x20,-0x4(%rbp)
ffff8000001087f4:	eb 30                	jmp    ffff800000108826 <init_interrupt+0x41>
ffff8000001087f6:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff8000001087f9:	83 e8 20             	sub    $0x20,%eax
ffff8000001087fc:	48 ba a0 04 11 00 00 	movabs $0xffff8000001104a0,%rdx
ffff800000108803:	80 ff ff 
ffff800000108806:	48 98                	cltq   
ffff800000108808:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff80000010880c:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010880f:	be 02 00 00 00       	mov    $0x2,%esi
ffff800000108814:	89 c7                	mov    %eax,%edi
ffff800000108816:	48 b8 9d 7f 10 00 00 	movabs $0xffff800000107f9d,%rax
ffff80000010881d:	80 ff ff 
ffff800000108820:	ff d0                	callq  *%rax
ffff800000108822:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000108826:	83 7d fc 37          	cmpl   $0x37,-0x4(%rbp)
ffff80000010882a:	7e ca                	jle    ffff8000001087f6 <init_interrupt+0x11>
ffff80000010882c:	48 ba 60 39 11 00 00 	movabs $0xffff800000113960,%rdx
ffff800000108833:	80 ff ff 
ffff800000108836:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010883b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108840:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108845:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010884c:	80 ff ff 
ffff80000010884f:	ff d1                	callq  *%rcx
ffff800000108851:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000108856:	bf 20 00 00 00       	mov    $0x20,%edi
ffff80000010885b:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff800000108862:	80 ff ff 
ffff800000108865:	ff d0                	callq  *%rax
ffff800000108867:	be 20 00 00 00       	mov    $0x20,%esi
ffff80000010886c:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108871:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff800000108878:	80 ff ff 
ffff80000010887b:	ff d0                	callq  *%rax
ffff80000010887d:	be 04 00 00 00       	mov    $0x4,%esi
ffff800000108882:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000108887:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff80000010888e:	80 ff ff 
ffff800000108891:	ff d0                	callq  *%rax
ffff800000108893:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108898:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010889d:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001088a4:	80 ff ff 
ffff8000001088a7:	ff d0                	callq  *%rax
ffff8000001088a9:	be 11 00 00 00       	mov    $0x11,%esi
ffff8000001088ae:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff8000001088b3:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001088ba:	80 ff ff 
ffff8000001088bd:	ff d0                	callq  *%rax
ffff8000001088bf:	be 28 00 00 00       	mov    $0x28,%esi
ffff8000001088c4:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088c9:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001088d0:	80 ff ff 
ffff8000001088d3:	ff d0                	callq  *%rax
ffff8000001088d5:	be 02 00 00 00       	mov    $0x2,%esi
ffff8000001088da:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088df:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001088e6:	80 ff ff 
ffff8000001088e9:	ff d0                	callq  *%rax
ffff8000001088eb:	be 01 00 00 00       	mov    $0x1,%esi
ffff8000001088f0:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff8000001088f5:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001088fc:	80 ff ff 
ffff8000001088ff:	ff d0                	callq  *%rax
ffff800000108901:	be fd 00 00 00       	mov    $0xfd,%esi
ffff800000108906:	bf 21 00 00 00       	mov    $0x21,%edi
ffff80000010890b:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff800000108912:	80 ff ff 
ffff800000108915:	ff d0                	callq  *%rax
ffff800000108917:	be ff 00 00 00       	mov    $0xff,%esi
ffff80000010891c:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000108921:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff800000108928:	80 ff ff 
ffff80000010892b:	ff d0                	callq  *%rax
ffff80000010892d:	fb                   	sti    
ffff80000010892e:	90                   	nop
ffff80000010892f:	c9                   	leaveq 
ffff800000108930:	c3                   	retq   

ffff800000108931 <do_IRQ>:
ffff800000108931:	55                   	push   %rbp
ffff800000108932:	48 89 e5             	mov    %rsp,%rbp
ffff800000108935:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000108939:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff80000010893d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108941:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108945:	48 89 c1             	mov    %rax,%rcx
ffff800000108948:	48 ba 6d 39 11 00 00 	movabs $0xffff80000011396d,%rdx
ffff80000010894f:	80 ff ff 
ffff800000108952:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108957:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010895c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108961:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000108968:	80 ff ff 
ffff80000010896b:	41 ff d0             	callq  *%r8
ffff80000010896e:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000108973:	48 b8 5c 7f 10 00 00 	movabs $0xffff800000107f5c,%rax
ffff80000010897a:	80 ff ff 
ffff80000010897d:	ff d0                	callq  *%rax
ffff80000010897f:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000108982:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000108986:	89 c1                	mov    %eax,%ecx
ffff800000108988:	48 ba 7d 39 11 00 00 	movabs $0xffff80000011397d,%rdx
ffff80000010898f:	80 ff ff 
ffff800000108992:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108997:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010899c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001089a1:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff8000001089a8:	80 ff ff 
ffff8000001089ab:	41 ff d0             	callq  *%r8
ffff8000001089ae:	be 20 00 00 00       	mov    $0x20,%esi
ffff8000001089b3:	bf 20 00 00 00       	mov    $0x20,%edi
ffff8000001089b8:	48 b8 7d 7f 10 00 00 	movabs $0xffff800000107f7d,%rax
ffff8000001089bf:	80 ff ff 
ffff8000001089c2:	ff d0                	callq  *%rax
ffff8000001089c4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089c8:	48 8b 88 b0 00 00 00 	mov    0xb0(%rax),%rcx
ffff8000001089cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089d3:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff8000001089da:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089de:	49 89 c9             	mov    %rcx,%r9
ffff8000001089e1:	49 89 d0             	mov    %rdx,%r8
ffff8000001089e4:	48 89 c1             	mov    %rax,%rcx
ffff8000001089e7:	48 ba 90 39 11 00 00 	movabs $0xffff800000113990,%rdx
ffff8000001089ee:	80 ff ff 
ffff8000001089f1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001089f6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001089fb:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a00:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000108a07:	80 ff ff 
ffff800000108a0a:	41 ff d2             	callq  *%r10
ffff800000108a0d:	90                   	nop
ffff800000108a0e:	c9                   	leaveq 
ffff800000108a0f:	c3                   	retq   

ffff800000108a10 <list_init>:
ffff800000108a10:	55                   	push   %rbp
ffff800000108a11:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a14:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a18:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a1c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a20:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a23:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a27:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a2b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a2f:	90                   	nop
ffff800000108a30:	5d                   	pop    %rbp
ffff800000108a31:	c3                   	retq   

ffff800000108a32 <list_add_to_before>:
ffff800000108a32:	55                   	push   %rbp
ffff800000108a33:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a36:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a3a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108a3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108a42:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108a46:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a4a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a4e:	48 8b 00             	mov    (%rax),%rax
ffff800000108a51:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a55:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108a59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a5d:	48 8b 10             	mov    (%rax),%rdx
ffff800000108a60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108a64:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a6b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108a6f:	48 89 10             	mov    %rdx,(%rax)
ffff800000108a72:	90                   	nop
ffff800000108a73:	5d                   	pop    %rbp
ffff800000108a74:	c3                   	retq   

ffff800000108a75 <list_next>:
ffff800000108a75:	55                   	push   %rbp
ffff800000108a76:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a79:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108a7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a81:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108a85:	48 85 c0             	test   %rax,%rax
ffff800000108a88:	74 0a                	je     ffff800000108a94 <list_next+0x1f>
ffff800000108a8a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108a8e:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108a92:	eb 05                	jmp    ffff800000108a99 <list_next+0x24>
ffff800000108a94:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a99:	5d                   	pop    %rbp
ffff800000108a9a:	c3                   	retq   

ffff800000108a9b <memcpy>:
ffff800000108a9b:	55                   	push   %rbp
ffff800000108a9c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a9f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108aa3:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108aa7:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108aab:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108aaf:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108ab3:	48 85 c0             	test   %rax,%rax
ffff800000108ab6:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108aba:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108abe:	48 89 c1             	mov    %rax,%rcx
ffff800000108ac1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ac5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff800000108ac9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
ffff800000108acd:	48 89 d7             	mov    %rdx,%rdi
ffff800000108ad0:	fc                   	cld    
ffff800000108ad1:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
ffff800000108ad4:	a8 04                	test   $0x4,%al
ffff800000108ad6:	74 01                	je     ffff800000108ad9 <memcpy+0x3e>
ffff800000108ad8:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff800000108ad9:	a8 02                	test   $0x2,%al
ffff800000108adb:	74 02                	je     ffff800000108adf <memcpy+0x44>
ffff800000108add:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
ffff800000108adf:	a8 01                	test   $0x1,%al
ffff800000108ae1:	74 01                	je     ffff800000108ae4 <memcpy+0x49>
ffff800000108ae3:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff800000108ae4:	89 f2                	mov    %esi,%edx
ffff800000108ae6:	89 4d fc             	mov    %ecx,-0x4(%rbp)
ffff800000108ae9:	89 7d f8             	mov    %edi,-0x8(%rbp)
ffff800000108aec:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108aef:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108af3:	5d                   	pop    %rbp
ffff800000108af4:	c3                   	retq   

ffff800000108af5 <memset>:
ffff800000108af5:	55                   	push   %rbp
ffff800000108af6:	48 89 e5             	mov    %rsp,%rbp
ffff800000108af9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108afd:	89 f0                	mov    %esi,%eax
ffff800000108aff:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108b03:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff800000108b06:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff800000108b0a:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000108b11:	01 01 01 
ffff800000108b14:	48 0f af c2          	imul   %rdx,%rax
ffff800000108b18:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108b1c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108b20:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108b24:	48 85 c0             	test   %rax,%rax
ffff800000108b27:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108b2b:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108b2f:	48 89 c1             	mov    %rax,%rcx
ffff800000108b32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108b36:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff800000108b3a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000108b3e:	48 89 d7             	mov    %rdx,%rdi
ffff800000108b41:	fc                   	cld    
ffff800000108b42:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff800000108b45:	40 f6 c6 04          	test   $0x4,%sil
ffff800000108b49:	74 01                	je     ffff800000108b4c <memset+0x57>
ffff800000108b4b:	ab                   	stos   %eax,%es:(%rdi)
ffff800000108b4c:	40 f6 c6 02          	test   $0x2,%sil
ffff800000108b50:	74 02                	je     ffff800000108b54 <memset+0x5f>
ffff800000108b52:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000108b54:	40 f6 c6 01          	test   $0x1,%sil
ffff800000108b58:	74 01                	je     ffff800000108b5b <memset+0x66>
ffff800000108b5a:	aa                   	stos   %al,%es:(%rdi)
ffff800000108b5b:	89 f8                	mov    %edi,%eax
ffff800000108b5d:	89 ca                	mov    %ecx,%edx
ffff800000108b5f:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108b62:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff800000108b65:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108b69:	5d                   	pop    %rbp
ffff800000108b6a:	c3                   	retq   

ffff800000108b6b <wrmsr>:
ffff800000108b6b:	55                   	push   %rbp
ffff800000108b6c:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b6f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108b73:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108b77:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b7b:	48 c1 e8 20          	shr    $0x20,%rax
ffff800000108b7f:	48 89 c2             	mov    %rax,%rdx
ffff800000108b82:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108b86:	89 c0                	mov    %eax,%eax
ffff800000108b88:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff800000108b8c:	0f 30                	wrmsr  
ffff800000108b8e:	90                   	nop
ffff800000108b8f:	5d                   	pop    %rbp
ffff800000108b90:	c3                   	retq   

ffff800000108b91 <get_current>:
ffff800000108b91:	55                   	push   %rbp
ffff800000108b92:	48 89 e5             	mov    %rsp,%rbp
ffff800000108b95:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108b9c:	00 
ffff800000108b9d:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff800000108ba4:	48 21 e0             	and    %rsp,%rax
ffff800000108ba7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108bab:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108baf:	5d                   	pop    %rbp
ffff800000108bb0:	c3                   	retq   
ffff800000108bb1:	55                   	push   %rbp
ffff800000108bb2:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bb5:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108bb9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108bbd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108bc1:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff800000108bc8:	48 89 c1             	mov    %rax,%rcx
ffff800000108bcb:	48 ba b8 39 11 00 00 	movabs $0xffff8000001139b8,%rdx
ffff800000108bd2:	80 ff ff 
ffff800000108bd5:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108bda:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108bdf:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108be4:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000108beb:	80 ff ff 
ffff800000108bee:	41 ff d0             	callq  *%r8
ffff800000108bf1:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff800000108bf8:	c9                   	leaveq 
ffff800000108bf9:	c3                   	retq   
ffff800000108bfa:	55                   	push   %rbp
ffff800000108bfb:	48 89 e5             	mov    %rsp,%rbp
ffff800000108bfe:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108c02:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c0a:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108c0e:	48 89 c2             	mov    %rax,%rdx
ffff800000108c11:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff800000108c16:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108c1b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108c20:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000108c27:	80 ff ff 
ffff800000108c2a:	ff d1                	callq  *%rcx
ffff800000108c2c:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108c31:	c9                   	leaveq 
ffff800000108c32:	c3                   	retq   
ffff800000108c33:	55                   	push   %rbp
ffff800000108c34:	48 89 e5             	mov    %rsp,%rbp
ffff800000108c37:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108c3b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108c3f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108c43:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000108c47:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108c4b:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000108c4f:	48 ba 30 ae 10 00 00 	movabs $0xffff80000010ae30,%rdx
ffff800000108c56:	80 ff ff 
ffff800000108c59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108c5d:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c60:	48 ba 38 ae 10 00 00 	movabs $0xffff80000010ae38,%rdx
ffff800000108c67:	80 ff ff 
ffff800000108c6a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108c6e:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c71:	48 ba 40 ae 10 00 00 	movabs $0xffff80000010ae40,%rdx
ffff800000108c78:	80 ff ff 
ffff800000108c7b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108c7f:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c82:	48 ba 50 ae 10 00 00 	movabs $0xffff80000010ae50,%rdx
ffff800000108c89:	80 ff ff 
ffff800000108c8c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108c90:	48 89 02             	mov    %rax,(%rdx)
ffff800000108c93:	48 ba 58 ae 10 00 00 	movabs $0xffff80000010ae58,%rdx
ffff800000108c9a:	80 ff ff 
ffff800000108c9d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108ca1:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ca4:	48 ba 60 ae 10 00 00 	movabs $0xffff80000010ae60,%rdx
ffff800000108cab:	80 ff ff 
ffff800000108cae:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108cb2:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cb5:	48 ba 68 ae 10 00 00 	movabs $0xffff80000010ae68,%rdx
ffff800000108cbc:	80 ff ff 
ffff800000108cbf:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000108cc3:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cc6:	48 ba 70 ae 10 00 00 	movabs $0xffff80000010ae70,%rdx
ffff800000108ccd:	80 ff ff 
ffff800000108cd0:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000108cd4:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cd7:	48 ba 78 ae 10 00 00 	movabs $0xffff80000010ae78,%rdx
ffff800000108cde:	80 ff ff 
ffff800000108ce1:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000108ce5:	48 89 02             	mov    %rax,(%rdx)
ffff800000108ce8:	48 ba 80 ae 10 00 00 	movabs $0xffff80000010ae80,%rdx
ffff800000108cef:	80 ff ff 
ffff800000108cf2:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000108cf6:	48 89 02             	mov    %rax,(%rdx)
ffff800000108cf9:	90                   	nop
ffff800000108cfa:	5d                   	pop    %rbp
ffff800000108cfb:	c3                   	retq   

ffff800000108cfc <user_level_function>:
ffff800000108cfc:	55                   	push   %rbp
ffff800000108cfd:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d00:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000108d07:	00 
ffff800000108d08:	48 b8 54 72 69 70 6c 	movabs $0x4820656c70697254,%rax
ffff800000108d0f:	65 20 48 
ffff800000108d12:	48 ba 20 4f 53 20 3e 	movabs $0x203c5f3e20534f20,%rdx
ffff800000108d19:	5f 3c 20 
ffff800000108d1c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000108d20:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108d24:	c7 45 f0 21 21 21 0a 	movl   $0xa212121,-0x10(%rbp)
ffff800000108d2b:	c6 45 f4 00          	movb   $0x0,-0xc(%rbp)
ffff800000108d2f:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108d34:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000108d38:	48 89 d7             	mov    %rdx,%rdi
ffff800000108d3b:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108d47 <sysexit_return_address>
ffff800000108d42:	48 89 e1             	mov    %rsp,%rcx
ffff800000108d45:	0f 34                	sysenter 

ffff800000108d47 <sysexit_return_address>:
ffff800000108d47:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108d4b:	eb fe                	jmp    ffff800000108d4b <sysexit_return_address+0x4>

ffff800000108d4d <do_execve>:
ffff800000108d4d:	55                   	push   %rbp
ffff800000108d4e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108d51:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108d55:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108d59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d5d:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff800000108d64:	00 
ffff800000108d65:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d69:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108d70:	00 
ffff800000108d71:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d75:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
ffff800000108d7c:	01 00 00 00 
ffff800000108d80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d84:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff800000108d8b:	00 
ffff800000108d8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108d90:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff800000108d97:	00 
ffff800000108d98:	48 ba dc 39 11 00 00 	movabs $0xffff8000001139dc,%rdx
ffff800000108d9f:	80 ff ff 
ffff800000108da2:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108da7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108dac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108db1:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000108db8:	80 ff ff 
ffff800000108dbb:	ff d1                	callq  *%rcx
ffff800000108dbd:	ba 00 04 00 00       	mov    $0x400,%edx
ffff800000108dc2:	be 00 00 80 00       	mov    $0x800000,%esi
ffff800000108dc7:	48 bf fc 8c 10 00 00 	movabs $0xffff800000108cfc,%rdi
ffff800000108dce:	80 ff ff 
ffff800000108dd1:	48 b8 9b 8a 10 00 00 	movabs $0xffff800000108a9b,%rax
ffff800000108dd8:	80 ff ff 
ffff800000108ddb:	ff d0                	callq  *%rax
ffff800000108ddd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108de2:	c9                   	leaveq 
ffff800000108de3:	c3                   	retq   

ffff800000108de4 <init>:
ffff800000108de4:	55                   	push   %rbp
ffff800000108de5:	48 89 e5             	mov    %rsp,%rbp
ffff800000108de8:	53                   	push   %rbx
ffff800000108de9:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108ded:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff800000108df1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108df5:	48 89 c1             	mov    %rax,%rcx
ffff800000108df8:	48 ba f8 39 11 00 00 	movabs $0xffff8000001139f8,%rdx
ffff800000108dff:	80 ff ff 
ffff800000108e02:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108e07:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108e0c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e11:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000108e18:	80 ff ff 
ffff800000108e1b:	41 ff d0             	callq  *%r8
ffff800000108e1e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e23:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108e2a:	80 ff ff 
ffff800000108e2d:	ff d2                	callq  *%rdx
ffff800000108e2f:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e33:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff800000108e3a:	80 ff ff 
ffff800000108e3d:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108e41:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e46:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108e4d:	80 ff ff 
ffff800000108e50:	ff d2                	callq  *%rdx
ffff800000108e52:	48 89 c3             	mov    %rax,%rbx
ffff800000108e55:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e5a:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108e61:	80 ff ff 
ffff800000108e64:	ff d2                	callq  *%rdx
ffff800000108e66:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e6a:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
ffff800000108e71:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108e75:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e7a:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108e81:	80 ff ff 
ffff800000108e84:	ff d2                	callq  *%rdx
ffff800000108e86:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108e8a:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000108e8e:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108e92:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108e97:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108e9e:	80 ff ff 
ffff800000108ea1:	ff d2                	callq  *%rdx
ffff800000108ea3:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000108ea7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108eac:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000108eb3:	80 ff ff 
ffff800000108eb6:	ff d2                	callq  *%rdx
ffff800000108eb8:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff800000108ebc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108ec0:	48 89 c7             	mov    %rax,%rdi
ffff800000108ec3:	48 8b 63 10          	mov    0x10(%rbx),%rsp
ffff800000108ec7:	ff 72 08             	pushq  0x8(%rdx)
ffff800000108eca:	e9 7e fe ff ff       	jmpq   ffff800000108d4d <do_execve>
ffff800000108ecf:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108ed4:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000108ed8:	c9                   	leaveq 
ffff800000108ed9:	c3                   	retq   

ffff800000108eda <do_fork>:
ffff800000108eda:	55                   	push   %rbp
ffff800000108edb:	48 89 e5             	mov    %rsp,%rbp
ffff800000108ede:	53                   	push   %rbx
ffff800000108edf:	48 83 ec 48          	sub    $0x48,%rsp
ffff800000108ee3:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108ee7:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108eeb:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108eef:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff800000108ef3:	48 ba 1a 3a 11 00 00 	movabs $0xffff800000113a1a,%rdx
ffff800000108efa:	80 ff ff 
ffff800000108efd:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f02:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108f07:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f0c:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000108f13:	80 ff ff 
ffff800000108f16:	ff d1                	callq  *%rcx
ffff800000108f18:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000108f1f:	00 
ffff800000108f20:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff800000108f27:	00 
ffff800000108f28:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108f2f:	00 
ffff800000108f30:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f37:	80 ff ff 
ffff800000108f3a:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f41:	48 8b 00             	mov    (%rax),%rax
ffff800000108f44:	48 89 c1             	mov    %rax,%rcx
ffff800000108f47:	48 ba 29 3a 11 00 00 	movabs $0xffff800000113a29,%rdx
ffff800000108f4e:	80 ff ff 
ffff800000108f51:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108f56:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108f5b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108f60:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000108f67:	80 ff ff 
ffff800000108f6a:	41 ff d0             	callq  *%r8
ffff800000108f6d:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000108f72:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000108f77:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000108f7c:	48 b8 2a 7c 10 00 00 	movabs $0xffff800000107c2a,%rax
ffff800000108f83:	80 ff ff 
ffff800000108f86:	ff d0                	callq  *%rax
ffff800000108f88:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108f8c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108f93:	80 ff ff 
ffff800000108f96:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108f9d:	48 8b 00             	mov    (%rax),%rax
ffff800000108fa0:	48 89 c1             	mov    %rax,%rcx
ffff800000108fa3:	48 ba 29 3a 11 00 00 	movabs $0xffff800000113a29,%rdx
ffff800000108faa:	80 ff ff 
ffff800000108fad:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108fb2:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108fb7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108fbc:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000108fc3:	80 ff ff 
ffff800000108fc6:	41 ff d0             	callq  *%r8
ffff800000108fc9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108fcd:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000108fd1:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
ffff800000108fd8:	80 ff ff 
ffff800000108fdb:	48 01 d0             	add    %rdx,%rax
ffff800000108fde:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000108fe2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108fe6:	48 89 c1             	mov    %rax,%rcx
ffff800000108fe9:	48 ba 48 3a 11 00 00 	movabs $0xffff800000113a48,%rdx
ffff800000108ff0:	80 ff ff 
ffff800000108ff3:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108ff8:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108ffd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109002:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109009:	80 ff ff 
ffff80000010900c:	41 ff d0             	callq  *%r8
ffff80000010900f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109013:	ba 58 00 00 00       	mov    $0x58,%edx
ffff800000109018:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010901d:	48 89 c7             	mov    %rax,%rdi
ffff800000109020:	48 b8 f5 8a 10 00 00 	movabs $0xffff800000108af5,%rax
ffff800000109027:	80 ff ff 
ffff80000010902a:	ff d0                	callq  *%rax
ffff80000010902c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109031:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000109038:	80 ff ff 
ffff80000010903b:	ff d2                	callq  *%rdx
ffff80000010903d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000109041:	48 8b 08             	mov    (%rax),%rcx
ffff800000109044:	48 8b 58 08          	mov    0x8(%rax),%rbx
ffff800000109048:	48 89 0a             	mov    %rcx,(%rdx)
ffff80000010904b:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
ffff80000010904f:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff800000109053:	48 8b 58 18          	mov    0x18(%rax),%rbx
ffff800000109057:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
ffff80000010905b:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
ffff80000010905f:	48 8b 48 20          	mov    0x20(%rax),%rcx
ffff800000109063:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000109067:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
ffff80000010906b:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
ffff80000010906f:	48 8b 48 30          	mov    0x30(%rax),%rcx
ffff800000109073:	48 8b 58 38          	mov    0x38(%rax),%rbx
ffff800000109077:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
ffff80000010907b:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
ffff80000010907f:	48 8b 48 40          	mov    0x40(%rax),%rcx
ffff800000109083:	48 8b 58 48          	mov    0x48(%rax),%rbx
ffff800000109087:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
ffff80000010908b:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
ffff80000010908f:	48 8b 40 50          	mov    0x50(%rax),%rax
ffff800000109093:	48 89 42 50          	mov    %rax,0x50(%rdx)
ffff800000109097:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010909b:	48 89 c7             	mov    %rax,%rdi
ffff80000010909e:	48 b8 10 8a 10 00 00 	movabs $0xffff800000108a10,%rax
ffff8000001090a5:	80 ff ff 
ffff8000001090a8:	ff d0                	callq  *%rax
ffff8000001090aa:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090ae:	48 89 c6             	mov    %rax,%rsi
ffff8000001090b1:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff8000001090b8:	80 ff ff 
ffff8000001090bb:	48 b8 32 8a 10 00 00 	movabs $0xffff800000108a32,%rax
ffff8000001090c2:	80 ff ff 
ffff8000001090c5:	ff d0                	callq  *%rax
ffff8000001090c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090cb:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001090cf:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001090d3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090d7:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001090db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090df:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001090e6:	00 
ffff8000001090e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090eb:	48 83 c0 58          	add    $0x58,%rax
ffff8000001090ef:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001090f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001090f7:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001090fb:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001090ff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109103:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff800000109109:	48 89 c1             	mov    %rax,%rcx
ffff80000010910c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109110:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109115:	48 89 ce             	mov    %rcx,%rsi
ffff800000109118:	48 89 c7             	mov    %rax,%rdi
ffff80000010911b:	48 b8 9b 8a 10 00 00 	movabs $0xffff800000108a9b,%rax
ffff800000109122:	80 ff ff 
ffff800000109125:	ff d0                	callq  *%rax
ffff800000109127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010912b:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000109132:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109136:	48 89 10             	mov    %rdx,(%rax)
ffff800000109139:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010913d:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109144:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109148:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010914c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109150:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff800000109157:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010915b:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010915f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109163:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109167:	48 89 c1             	mov    %rax,%rcx
ffff80000010916a:	48 ba 6c 3a 11 00 00 	movabs $0xffff800000113a6c,%rdx
ffff800000109171:	80 ff ff 
ffff800000109174:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109179:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010917e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109183:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff80000010918a:	80 ff ff 
ffff80000010918d:	41 ff d0             	callq  *%r8
ffff800000109190:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109194:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000109198:	48 89 c1             	mov    %rax,%rcx
ffff80000010919b:	48 ba 7d 3a 11 00 00 	movabs $0xffff800000113a7d,%rdx
ffff8000001091a2:	80 ff ff 
ffff8000001091a5:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001091aa:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001091af:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001091b4:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff8000001091bb:	80 ff ff 
ffff8000001091be:	41 ff d0             	callq  *%r8
ffff8000001091c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091c5:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff8000001091cc:	00 
ffff8000001091cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001091d1:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
ffff8000001091d8:	00 
ffff8000001091d9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001091dd:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001091e1:	83 e0 01             	and    $0x1,%eax
ffff8000001091e4:	48 85 c0             	test   %rax,%rax
ffff8000001091e7:	75 28                	jne    ffff800000109211 <do_fork+0x337>
ffff8000001091e9:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff8000001091f0:	80 ff ff 
ffff8000001091f3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001091f7:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff8000001091fe:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000109202:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000109209:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010920d:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000109211:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109215:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff80000010921c:	00 
ffff80000010921d:	48 ba 8e 3a 11 00 00 	movabs $0xffff800000113a8e,%rdx
ffff800000109224:	80 ff ff 
ffff800000109227:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010922c:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109231:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109236:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff80000010923d:	80 ff ff 
ffff800000109240:	ff d1                	callq  *%rcx
ffff800000109242:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109247:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010924b:	c9                   	leaveq 
ffff80000010924c:	c3                   	retq   

ffff80000010924d <do_exit>:
ffff80000010924d:	55                   	push   %rbp
ffff80000010924e:	48 89 e5             	mov    %rsp,%rbp
ffff800000109251:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109255:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109259:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010925d:	48 89 c1             	mov    %rax,%rcx
ffff800000109260:	48 ba a0 3a 11 00 00 	movabs $0xffff800000113aa0,%rdx
ffff800000109267:	80 ff ff 
ffff80000010926a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010926f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000109274:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109279:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109280:	80 ff ff 
ffff800000109283:	41 ff d0             	callq  *%r8
ffff800000109286:	eb fe                	jmp    ffff800000109286 <do_exit+0x39>

ffff800000109288 <system_call_function>:
ffff800000109288:	55                   	push   %rbp
ffff800000109289:	48 89 e5             	mov    %rsp,%rbp
ffff80000010928c:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000109290:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000109294:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000109298:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff80000010929f:	48 ba a0 c0 10 00 00 	movabs $0xffff80000010c0a0,%rdx
ffff8000001092a6:	80 ff ff 
ffff8000001092a9:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff8000001092ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001092b1:	48 89 c7             	mov    %rax,%rdi
ffff8000001092b4:	ff d2                	callq  *%rdx
ffff8000001092b6:	c9                   	leaveq 
ffff8000001092b7:	c3                   	retq   

ffff8000001092b8 <kernel_thread_func>:
ffff8000001092b8:	41 5f                	pop    %r15
ffff8000001092ba:	41 5e                	pop    %r14
ffff8000001092bc:	41 5d                	pop    %r13
ffff8000001092be:	41 5c                	pop    %r12
ffff8000001092c0:	41 5b                	pop    %r11
ffff8000001092c2:	41 5a                	pop    %r10
ffff8000001092c4:	41 59                	pop    %r9
ffff8000001092c6:	41 58                	pop    %r8
ffff8000001092c8:	5b                   	pop    %rbx
ffff8000001092c9:	59                   	pop    %rcx
ffff8000001092ca:	5a                   	pop    %rdx
ffff8000001092cb:	5e                   	pop    %rsi
ffff8000001092cc:	5f                   	pop    %rdi
ffff8000001092cd:	5d                   	pop    %rbp
ffff8000001092ce:	58                   	pop    %rax
ffff8000001092cf:	48 8e d8             	mov    %rax,%ds
ffff8000001092d2:	58                   	pop    %rax
ffff8000001092d3:	48 8e c0             	mov    %rax,%es
ffff8000001092d6:	58                   	pop    %rax
ffff8000001092d7:	48 83 c4 38          	add    $0x38,%rsp
ffff8000001092db:	48 89 d7             	mov    %rdx,%rdi
ffff8000001092de:	ff d3                	callq  *%rbx
ffff8000001092e0:	48 89 c7             	mov    %rax,%rdi
ffff8000001092e3:	e8 65 ff ff ff       	callq  ffff80000010924d <do_exit>

ffff8000001092e8 <kernel_thread>:
ffff8000001092e8:	55                   	push   %rbp
ffff8000001092e9:	48 89 e5             	mov    %rsp,%rbp
ffff8000001092ec:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff8000001092f3:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
ffff8000001092fa:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
ffff800000109301:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
ffff800000109308:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff80000010930f:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000109314:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109319:	48 89 c7             	mov    %rax,%rdi
ffff80000010931c:	48 b8 f5 8a 10 00 00 	movabs $0xffff800000108af5,%rax
ffff800000109323:	80 ff ff 
ffff800000109326:	ff d0                	callq  *%rax
ffff800000109328:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
ffff80000010932f:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000109333:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
ffff80000010933a:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff80000010933e:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
ffff800000109345:	00 
ffff800000109346:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
ffff80000010934d:	00 
ffff80000010934e:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
ffff800000109355:	00 
ffff800000109356:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
ffff80000010935d:	00 
ffff80000010935e:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
ffff800000109365:	00 
ffff800000109366:	48 b8 b8 92 10 00 00 	movabs $0xffff8000001092b8,%rax
ffff80000010936d:	80 ff ff 
ffff800000109370:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000109374:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
ffff80000010937b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000109382:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff800000109387:	ba 00 00 00 00       	mov    $0x0,%edx
ffff80000010938c:	48 89 c7             	mov    %rax,%rdi
ffff80000010938f:	48 b8 da 8e 10 00 00 	movabs $0xffff800000108eda,%rax
ffff800000109396:	80 ff ff 
ffff800000109399:	ff d0                	callq  *%rax
ffff80000010939b:	c9                   	leaveq 
ffff80000010939c:	c3                   	retq   

ffff80000010939d <__switch_to>:
ffff80000010939d:	55                   	push   %rbp
ffff80000010939e:	48 89 e5             	mov    %rsp,%rbp
ffff8000001093a1:	53                   	push   %rbx
ffff8000001093a2:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001093a6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001093aa:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001093ae:	48 ba c2 3a 11 00 00 	movabs $0xffff800000113ac2,%rdx
ffff8000001093b5:	80 ff ff 
ffff8000001093b8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001093bd:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001093c2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001093c7:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff8000001093ce:	80 ff ff 
ffff8000001093d1:	ff d1                	callq  *%rcx
ffff8000001093d3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001093d7:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001093db:	48 8b 00             	mov    (%rax),%rax
ffff8000001093de:	48 ba 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rdx
ffff8000001093e5:	80 ff ff 
ffff8000001093e8:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff8000001093ec:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001093f0:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001093f4:	48 8b 00             	mov    (%rax),%rax
ffff8000001093f7:	48 89 c1             	mov    %rax,%rcx
ffff8000001093fa:	48 ba d5 3a 11 00 00 	movabs $0xffff800000113ad5,%rdx
ffff800000109401:	80 ff ff 
ffff800000109404:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109409:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010940e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109413:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff80000010941a:	80 ff ff 
ffff80000010941d:	41 ff d0             	callq  *%r8
ffff800000109420:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109424:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109428:	48 8b 00             	mov    (%rax),%rax
ffff80000010942b:	48 89 c1             	mov    %rax,%rcx
ffff80000010942e:	48 ba f1 3a 11 00 00 	movabs $0xffff800000113af1,%rdx
ffff800000109435:	80 ff ff 
ffff800000109438:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010943d:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109442:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109447:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff80000010944e:	80 ff ff 
ffff800000109451:	41 ff d0             	callq  *%r8
ffff800000109454:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff80000010945b:	80 ff ff 
ffff80000010945e:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff800000109462:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109469:	80 ff ff 
ffff80000010946c:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff800000109470:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109477:	80 ff ff 
ffff80000010947a:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff80000010947e:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109485:	80 ff ff 
ffff800000109488:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff80000010948c:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109493:	80 ff ff 
ffff800000109496:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff80000010949a:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001094a1:	80 ff ff 
ffff8000001094a4:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001094a8:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001094af:	80 ff ff 
ffff8000001094b2:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff8000001094b6:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001094bd:	80 ff ff 
ffff8000001094c0:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff8000001094c4:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001094cb:	80 ff ff 
ffff8000001094ce:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff8000001094d2:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001094d9:	80 ff ff 
ffff8000001094dc:	48 8b 40 04          	mov    0x4(%rax),%rax
ffff8000001094e0:	41 52                	push   %r10
ffff8000001094e2:	41 51                	push   %r9
ffff8000001094e4:	41 50                	push   %r8
ffff8000001094e6:	57                   	push   %rdi
ffff8000001094e7:	49 89 d9             	mov    %rbx,%r9
ffff8000001094ea:	4d 89 d8             	mov    %r11,%r8
ffff8000001094ed:	48 89 c7             	mov    %rax,%rdi
ffff8000001094f0:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff8000001094f7:	80 ff ff 
ffff8000001094fa:	ff d0                	callq  *%rax
ffff8000001094fc:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109500:	48 ba 0d 3b 11 00 00 	movabs $0xffff800000113b0d,%rdx
ffff800000109507:	80 ff ff 
ffff80000010950a:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010950f:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109514:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109519:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000109520:	80 ff ff 
ffff800000109523:	ff d1                	callq  *%rcx
ffff800000109525:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109529:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010952d:	48 8c e0             	mov    %fs,%rax
ffff800000109530:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff800000109534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000109538:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff80000010953c:	48 8c e8             	mov    %gs,%rax
ffff80000010953f:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000109543:	48 ba 1e 3b 11 00 00 	movabs $0xffff800000113b1e,%rdx
ffff80000010954a:	80 ff ff 
ffff80000010954d:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109552:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109557:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010955c:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000109563:	80 ff ff 
ffff800000109566:	ff d1                	callq  *%rcx
ffff800000109568:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010956c:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109570:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000109574:	48 89 c1             	mov    %rax,%rcx
ffff800000109577:	48 ba 2f 3b 11 00 00 	movabs $0xffff800000113b2f,%rdx
ffff80000010957e:	80 ff ff 
ffff800000109581:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109586:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff80000010958b:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109590:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109597:	80 ff ff 
ffff80000010959a:	41 ff d0             	callq  *%r8
ffff80000010959d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095a1:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001095a5:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001095a9:	48 89 c1             	mov    %rax,%rcx
ffff8000001095ac:	48 ba 49 3b 11 00 00 	movabs $0xffff800000113b49,%rdx
ffff8000001095b3:	80 ff ff 
ffff8000001095b6:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095bb:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001095c0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001095c5:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff8000001095cc:	80 ff ff 
ffff8000001095cf:	41 ff d0             	callq  *%r8
ffff8000001095d2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095d6:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001095da:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001095de:	48 8e e0             	mov    %rax,%fs
ffff8000001095e1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001095e5:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001095e9:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001095ed:	48 8e e8             	mov    %rax,%gs
ffff8000001095f0:	48 ba 63 3b 11 00 00 	movabs $0xffff800000113b63,%rdx
ffff8000001095f7:	80 ff ff 
ffff8000001095fa:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001095ff:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109604:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109609:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000109610:	80 ff ff 
ffff800000109613:	ff d1                	callq  *%rcx
ffff800000109615:	90                   	nop
ffff800000109616:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff80000010961a:	c9                   	leaveq 
ffff80000010961b:	c3                   	retq   

ffff80000010961c <task_init>:
ffff80000010961c:	55                   	push   %rbp
ffff80000010961d:	48 89 e5             	mov    %rsp,%rbp
ffff800000109620:	41 56                	push   %r14
ffff800000109622:	41 55                	push   %r13
ffff800000109624:	41 54                	push   %r12
ffff800000109626:	53                   	push   %rbx
ffff800000109627:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010962b:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000109632:	00 
ffff800000109633:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff80000010963a:	80 ff ff 
ffff80000010963d:	48 8b 00             	mov    (%rax),%rax
ffff800000109640:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109647:	80 ff ff 
ffff80000010964a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010964d:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109654:	80 ff ff 
ffff800000109657:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff80000010965e:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109665:	80 ff ff 
ffff800000109668:	48 89 42 08          	mov    %rax,0x8(%rdx)
ffff80000010966c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000109673:	80 ff ff 
ffff800000109676:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
ffff80000010967d:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109684:	80 ff ff 
ffff800000109687:	48 89 42 10          	mov    %rax,0x10(%rdx)
ffff80000010968b:	48 ba 80 9d 10 00 00 	movabs $0xffff800000109d80,%rdx
ffff800000109692:	80 ff ff 
ffff800000109695:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff80000010969c:	80 ff ff 
ffff80000010969f:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff8000001096a3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001096aa:	80 ff ff 
ffff8000001096ad:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
ffff8000001096b4:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff8000001096bb:	80 ff ff 
ffff8000001096be:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff8000001096c2:	48 ba 60 2b 11 00 00 	movabs $0xffff800000112b60,%rdx
ffff8000001096c9:	80 ff ff 
ffff8000001096cc:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096d3:	80 ff ff 
ffff8000001096d6:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001096da:	48 ba 9d 3c 11 00 00 	movabs $0xffff800000113c9d,%rdx
ffff8000001096e1:	80 ff ff 
ffff8000001096e4:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096eb:	80 ff ff 
ffff8000001096ee:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff8000001096f2:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff8000001096f9:	80 ff ff 
ffff8000001096fc:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000109703:	00 
ffff800000109704:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010970b:	80 ff ff 
ffff80000010970e:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000109715:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff80000010971c:	80 ff ff 
ffff80000010971f:	48 89 42 40          	mov    %rax,0x40(%rdx)
ffff800000109723:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff80000010972a:	80 ff ff 
ffff80000010972d:	48 8b 00             	mov    (%rax),%rax
ffff800000109730:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000109737:	80 ff ff 
ffff80000010973a:	48 89 42 48          	mov    %rax,0x48(%rdx)
ffff80000010973e:	be 08 00 00 00       	mov    $0x8,%esi
ffff800000109743:	bf 74 01 00 00       	mov    $0x174,%edi
ffff800000109748:	48 b8 6b 8b 10 00 00 	movabs $0xffff800000108b6b,%rax
ffff80000010974f:	80 ff ff 
ffff800000109752:	ff d0                	callq  *%rax
ffff800000109754:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109759:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff800000109760:	80 ff ff 
ffff800000109763:	ff d2                	callq  *%rdx
ffff800000109765:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000109769:	48 8b 00             	mov    (%rax),%rax
ffff80000010976c:	48 89 c6             	mov    %rax,%rsi
ffff80000010976f:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000109774:	48 b8 6b 8b 10 00 00 	movabs $0xffff800000108b6b,%rax
ffff80000010977b:	80 ff ff 
ffff80000010977e:	ff d0                	callq  *%rax
ffff800000109780:	48 b8 27 40 10 00 00 	movabs $0xffff800000104027,%rax
ffff800000109787:	80 ff ff 
ffff80000010978a:	48 89 c6             	mov    %rax,%rsi
ffff80000010978d:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000109792:	48 b8 6b 8b 10 00 00 	movabs $0xffff800000108b6b,%rax
ffff800000109799:	80 ff ff 
ffff80000010979c:	ff d0                	callq  *%rax
ffff80000010979e:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097a5:	80 ff ff 
ffff8000001097a8:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff8000001097ac:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097b3:	80 ff ff 
ffff8000001097b6:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff8000001097ba:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097c1:	80 ff ff 
ffff8000001097c4:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff8000001097c8:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097cf:	80 ff ff 
ffff8000001097d2:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff8000001097d6:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097dd:	80 ff ff 
ffff8000001097e0:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff8000001097e4:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097eb:	80 ff ff 
ffff8000001097ee:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff8000001097f2:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff8000001097f9:	80 ff ff 
ffff8000001097fc:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff800000109800:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109807:	80 ff ff 
ffff80000010980a:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff80000010980e:	48 b8 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rax
ffff800000109815:	80 ff ff 
ffff800000109818:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff80000010981c:	48 b8 a0 be 10 00 00 	movabs $0xffff80000010bea0,%rax
ffff800000109823:	80 ff ff 
ffff800000109826:	48 8b 00             	mov    (%rax),%rax
ffff800000109829:	41 52                	push   %r10
ffff80000010982b:	41 51                	push   %r9
ffff80000010982d:	41 50                	push   %r8
ffff80000010982f:	57                   	push   %rdi
ffff800000109830:	49 89 d9             	mov    %rbx,%r9
ffff800000109833:	4d 89 d8             	mov    %r11,%r8
ffff800000109836:	48 89 c7             	mov    %rax,%rdi
ffff800000109839:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000109840:	80 ff ff 
ffff800000109843:	ff d0                	callq  *%rax
ffff800000109845:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109849:	48 b8 a0 be 10 00 00 	movabs $0xffff80000010bea0,%rax
ffff800000109850:	80 ff ff 
ffff800000109853:	48 8b 00             	mov    (%rax),%rax
ffff800000109856:	48 ba 00 bf 10 00 00 	movabs $0xffff80000010bf00,%rdx
ffff80000010985d:	80 ff ff 
ffff800000109860:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000109864:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff80000010986b:	80 ff ff 
ffff80000010986e:	48 b8 10 8a 10 00 00 	movabs $0xffff800000108a10,%rax
ffff800000109875:	80 ff ff 
ffff800000109878:	ff d0                	callq  *%rax
ffff80000010987a:	ba 07 00 00 00       	mov    $0x7,%edx
ffff80000010987f:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000109884:	48 bf e4 8d 10 00 00 	movabs $0xffff800000108de4,%rdi
ffff80000010988b:	80 ff ff 
ffff80000010988e:	48 b8 e8 92 10 00 00 	movabs $0xffff8000001092e8,%rax
ffff800000109895:	80 ff ff 
ffff800000109898:	ff d0                	callq  *%rax
ffff80000010989a:	48 b8 00 80 11 00 00 	movabs $0xffff800000118000,%rax
ffff8000001098a1:	80 ff ff 
ffff8000001098a4:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff8000001098ab:	00 
ffff8000001098ac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098b1:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff8000001098b8:	80 ff ff 
ffff8000001098bb:	ff d2                	callq  *%rdx
ffff8000001098bd:	48 89 c7             	mov    %rax,%rdi
ffff8000001098c0:	48 b8 75 8a 10 00 00 	movabs $0xffff800000108a75,%rax
ffff8000001098c7:	80 ff ff 
ffff8000001098ca:	ff d0                	callq  *%rax
ffff8000001098cc:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff8000001098d0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001098d4:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001098d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098dd:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff8000001098e4:	80 ff ff 
ffff8000001098e7:	ff d2                	callq  *%rdx
ffff8000001098e9:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001098ed:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001098f2:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff8000001098f9:	80 ff ff 
ffff8000001098fc:	ff d2                	callq  *%rdx
ffff8000001098fe:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff800000109902:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109906:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff80000010990a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010990e:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000109912:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109917:	48 ba 91 8b 10 00 00 	movabs $0xffff800000108b91,%rdx
ffff80000010991e:	80 ff ff 
ffff800000109921:	ff d2                	callq  *%rdx
ffff800000109923:	48 89 c2             	mov    %rax,%rdx
ffff800000109926:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010992a:	48 89 d7             	mov    %rdx,%rdi
ffff80000010992d:	48 89 c6             	mov    %rax,%rsi
ffff800000109930:	55                   	push   %rbp
ffff800000109931:	50                   	push   %rax
ffff800000109932:	48 89 63 10          	mov    %rsp,0x10(%rbx)
ffff800000109936:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff80000010993b:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff80000010994f <task_init+0x333>
ffff800000109942:	49 89 46 08          	mov    %rax,0x8(%r14)
ffff800000109946:	41 ff 75 08          	pushq  0x8(%r13)
ffff80000010994a:	e9 4e fa ff ff       	jmpq   ffff80000010939d <__switch_to>
ffff80000010994f:	58                   	pop    %rax
ffff800000109950:	5d                   	pop    %rbp
ffff800000109951:	90                   	nop
ffff800000109952:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
ffff800000109956:	5b                   	pop    %rbx
ffff800000109957:	41 5c                	pop    %r12
ffff800000109959:	41 5d                	pop    %r13
ffff80000010995b:	41 5e                	pop    %r14
ffff80000010995d:	5d                   	pop    %rbp
ffff80000010995e:	c3                   	retq   

ffff80000010995f <get_cpuid>:
ffff80000010995f:	55                   	push   %rbp
ffff800000109960:	48 89 e5             	mov    %rsp,%rbp
ffff800000109963:	53                   	push   %rbx
ffff800000109964:	89 7d f4             	mov    %edi,-0xc(%rbp)
ffff800000109967:	89 75 f0             	mov    %esi,-0x10(%rbp)
ffff80000010996a:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff80000010996e:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000109972:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000109976:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff80000010997a:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff80000010997d:	8b 55 f0             	mov    -0x10(%rbp),%edx
ffff800000109980:	89 d1                	mov    %edx,%ecx
ffff800000109982:	0f a2                	cpuid  
ffff800000109984:	89 de                	mov    %ebx,%esi
ffff800000109986:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
ffff80000010998a:	89 07                	mov    %eax,(%rdi)
ffff80000010998c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000109990:	89 30                	mov    %esi,(%rax)
ffff800000109992:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000109996:	89 08                	mov    %ecx,(%rax)
ffff800000109998:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff80000010999c:	89 10                	mov    %edx,(%rax)
ffff80000010999e:	90                   	nop
ffff80000010999f:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001099a3:	c9                   	leaveq 
ffff8000001099a4:	c3                   	retq   

ffff8000001099a5 <init_cpu>:
ffff8000001099a5:	55                   	push   %rbp
ffff8000001099a6:	48 89 e5             	mov    %rsp,%rbp
ffff8000001099a9:	48 83 ec 40          	sub    $0x40,%rsp
ffff8000001099ad:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
ffff8000001099b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
ffff8000001099bb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
ffff8000001099c2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
ffff8000001099c9:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
ffff8000001099d0:	00 
ffff8000001099d1:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
ffff8000001099d8:	00 
ffff8000001099d9:	c6 45 d0 00          	movb   $0x0,-0x30(%rbp)
ffff8000001099dd:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff8000001099e1:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff8000001099e5:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff8000001099e9:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff8000001099ed:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff8000001099f1:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff8000001099f5:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff8000001099f9:	49 89 f1             	mov    %rsi,%r9
ffff8000001099fc:	49 89 c8             	mov    %rcx,%r8
ffff8000001099ff:	48 89 d1             	mov    %rdx,%rcx
ffff800000109a02:	48 89 c2             	mov    %rax,%rdx
ffff800000109a05:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109a0a:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109a0f:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109a16:	80 ff ff 
ffff800000109a19:	ff d0                	callq  *%rax
ffff800000109a1b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109a1f:	8b 55 e4             	mov    -0x1c(%rbp),%edx
ffff800000109a22:	89 10                	mov    %edx,(%rax)
ffff800000109a24:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109a28:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109a2c:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000109a2f:	89 02                	mov    %eax,(%rdx)
ffff800000109a31:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109a35:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109a39:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000109a3c:	89 02                	mov    %eax,(%rdx)
ffff800000109a3e:	c6 45 cc 00          	movb   $0x0,-0x34(%rbp)
ffff800000109a42:	8b 55 e8             	mov    -0x18(%rbp),%edx
ffff800000109a45:	8b 75 ec             	mov    -0x14(%rbp),%esi
ffff800000109a48:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
ffff800000109a4b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109a4f:	48 83 ec 08          	sub    $0x8,%rsp
ffff800000109a53:	52                   	push   %rdx
ffff800000109a54:	41 89 f1             	mov    %esi,%r9d
ffff800000109a57:	41 89 c8             	mov    %ecx,%r8d
ffff800000109a5a:	48 89 c1             	mov    %rax,%rcx
ffff800000109a5d:	48 ba 78 3b 11 00 00 	movabs $0xffff800000113b78,%rdx
ffff800000109a64:	80 ff ff 
ffff800000109a67:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109a6c:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000109a71:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109a76:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000109a7d:	80 ff ff 
ffff800000109a80:	41 ff d2             	callq  *%r10
ffff800000109a83:	48 83 c4 10          	add    $0x10,%rsp
ffff800000109a87:	c7 45 fc 02 00 00 80 	movl   $0x80000002,-0x4(%rbp)
ffff800000109a8e:	e9 9d 00 00 00       	jmpq   ffff800000109b30 <init_cpu+0x18b>
ffff800000109a93:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000109a96:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000109a9a:	48 8d 7a 0c          	lea    0xc(%rdx),%rdi
ffff800000109a9e:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000109aa2:	48 8d 72 08          	lea    0x8(%rdx),%rsi
ffff800000109aa6:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000109aaa:	48 8d 4a 04          	lea    0x4(%rdx),%rcx
ffff800000109aae:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
ffff800000109ab2:	49 89 f9             	mov    %rdi,%r9
ffff800000109ab5:	49 89 f0             	mov    %rsi,%r8
ffff800000109ab8:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109abd:	89 c7                	mov    %eax,%edi
ffff800000109abf:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109ac6:	80 ff ff 
ffff800000109ac9:	ff d0                	callq  *%rax
ffff800000109acb:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109acf:	8b 55 e0             	mov    -0x20(%rbp),%edx
ffff800000109ad2:	89 10                	mov    %edx,(%rax)
ffff800000109ad4:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109ad8:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109adc:	8b 45 e4             	mov    -0x1c(%rbp),%eax
ffff800000109adf:	89 02                	mov    %eax,(%rdx)
ffff800000109ae1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109ae5:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000109ae9:	8b 45 e8             	mov    -0x18(%rbp),%eax
ffff800000109aec:	89 02                	mov    %eax,(%rdx)
ffff800000109aee:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109af2:	48 8d 50 0c          	lea    0xc(%rax),%rdx
ffff800000109af6:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff800000109af9:	89 02                	mov    %eax,(%rdx)
ffff800000109afb:	c6 45 d0 00          	movb   $0x0,-0x30(%rbp)
ffff800000109aff:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
ffff800000109b03:	48 89 c1             	mov    %rax,%rcx
ffff800000109b06:	48 ba 91 3b 11 00 00 	movabs $0xffff800000113b91,%rdx
ffff800000109b0d:	80 ff ff 
ffff800000109b10:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b15:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000109b1a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b1f:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109b26:	80 ff ff 
ffff800000109b29:	41 ff d0             	callq  *%r8
ffff800000109b2c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000109b30:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000109b33:	3d 04 00 00 80       	cmp    $0x80000004,%eax
ffff800000109b38:	0f 86 55 ff ff ff    	jbe    ffff800000109a93 <init_cpu+0xee>
ffff800000109b3e:	48 ba 94 3b 11 00 00 	movabs $0xffff800000113b94,%rdx
ffff800000109b45:	80 ff ff 
ffff800000109b48:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b4d:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000109b52:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109b57:	48 b9 35 53 10 00 00 	movabs $0xffff800000105335,%rcx
ffff800000109b5e:	80 ff ff 
ffff800000109b61:	ff d1                	callq  *%rcx
ffff800000109b63:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109b67:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109b6b:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109b6f:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109b73:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109b77:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109b7b:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109b7f:	49 89 f1             	mov    %rsi,%r9
ffff800000109b82:	49 89 c8             	mov    %rcx,%r8
ffff800000109b85:	48 89 d1             	mov    %rdx,%rcx
ffff800000109b88:	48 89 c2             	mov    %rax,%rdx
ffff800000109b8b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109b90:	bf 01 00 00 00       	mov    $0x1,%edi
ffff800000109b95:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109b9c:	80 ff ff 
ffff800000109b9f:	ff d0                	callq  *%rax
ffff800000109ba1:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109ba4:	83 e0 0f             	and    $0xf,%eax
ffff800000109ba7:	89 c6                	mov    %eax,%esi
ffff800000109ba9:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109bac:	c1 e8 0c             	shr    $0xc,%eax
ffff800000109baf:	83 e0 03             	and    $0x3,%eax
ffff800000109bb2:	89 c1                	mov    %eax,%ecx
ffff800000109bb4:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109bb7:	c1 e8 10             	shr    $0x10,%eax
ffff800000109bba:	83 e0 0f             	and    $0xf,%eax
ffff800000109bbd:	89 c2                	mov    %eax,%edx
ffff800000109bbf:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109bc2:	c1 e8 04             	shr    $0x4,%eax
ffff800000109bc5:	83 e0 0f             	and    $0xf,%eax
ffff800000109bc8:	41 89 c0             	mov    %eax,%r8d
ffff800000109bcb:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109bce:	c1 e8 14             	shr    $0x14,%eax
ffff800000109bd1:	0f b6 f8             	movzbl %al,%edi
ffff800000109bd4:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109bd7:	c1 e8 08             	shr    $0x8,%eax
ffff800000109bda:	83 e0 0f             	and    $0xf,%eax
ffff800000109bdd:	48 83 ec 08          	sub    $0x8,%rsp
ffff800000109be1:	56                   	push   %rsi
ffff800000109be2:	51                   	push   %rcx
ffff800000109be3:	52                   	push   %rdx
ffff800000109be4:	45 89 c1             	mov    %r8d,%r9d
ffff800000109be7:	41 89 f8             	mov    %edi,%r8d
ffff800000109bea:	89 c1                	mov    %eax,%ecx
ffff800000109bec:	48 ba 98 3b 11 00 00 	movabs $0xffff800000113b98,%rdx
ffff800000109bf3:	80 ff ff 
ffff800000109bf6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109bfb:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000109c00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c05:	49 ba 35 53 10 00 00 	movabs $0xffff800000105335,%r10
ffff800000109c0c:	80 ff ff 
ffff800000109c0f:	41 ff d2             	callq  *%r10
ffff800000109c12:	48 83 c4 20          	add    $0x20,%rsp
ffff800000109c16:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c1a:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109c1e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c22:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109c26:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c2a:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109c2e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c32:	49 89 f1             	mov    %rsi,%r9
ffff800000109c35:	49 89 c8             	mov    %rcx,%r8
ffff800000109c38:	48 89 d1             	mov    %rdx,%rcx
ffff800000109c3b:	48 89 c2             	mov    %rax,%rdx
ffff800000109c3e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109c43:	bf 08 00 00 80       	mov    $0x80000008,%edi
ffff800000109c48:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109c4f:	80 ff ff 
ffff800000109c52:	ff d0                	callq  *%rax
ffff800000109c54:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109c57:	c1 e8 08             	shr    $0x8,%eax
ffff800000109c5a:	0f b6 d0             	movzbl %al,%edx
ffff800000109c5d:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109c60:	0f b6 c0             	movzbl %al,%eax
ffff800000109c63:	41 89 d0             	mov    %edx,%r8d
ffff800000109c66:	89 c1                	mov    %eax,%ecx
ffff800000109c68:	48 ba 18 3c 11 00 00 	movabs $0xffff800000113c18,%rdx
ffff800000109c6f:	80 ff ff 
ffff800000109c72:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109c77:	bf 00 ff ff 00       	mov    $0xffff00,%edi
ffff800000109c7c:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109c81:	49 b9 35 53 10 00 00 	movabs $0xffff800000105335,%r9
ffff800000109c88:	80 ff ff 
ffff800000109c8b:	41 ff d1             	callq  *%r9
ffff800000109c8e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c92:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109c96:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109c9a:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109c9e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109ca2:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109ca6:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109caa:	49 89 f1             	mov    %rsi,%r9
ffff800000109cad:	49 89 c8             	mov    %rcx,%r8
ffff800000109cb0:	48 89 d1             	mov    %rdx,%rcx
ffff800000109cb3:	48 89 c2             	mov    %rax,%rdx
ffff800000109cb6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109cbb:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000109cc0:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109cc7:	80 ff ff 
ffff800000109cca:	ff d0                	callq  *%rax
ffff800000109ccc:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109ccf:	89 c1                	mov    %eax,%ecx
ffff800000109cd1:	48 ba 50 3c 11 00 00 	movabs $0xffff800000113c50,%rdx
ffff800000109cd8:	80 ff ff 
ffff800000109cdb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109ce0:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109ce5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109cea:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109cf1:	80 ff ff 
ffff800000109cf4:	41 ff d0             	callq  *%r8
ffff800000109cf7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109cfb:	48 8d 70 0c          	lea    0xc(%rax),%rsi
ffff800000109cff:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109d03:	48 8d 48 08          	lea    0x8(%rax),%rcx
ffff800000109d07:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109d0b:	48 8d 50 04          	lea    0x4(%rax),%rdx
ffff800000109d0f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
ffff800000109d13:	49 89 f1             	mov    %rsi,%r9
ffff800000109d16:	49 89 c8             	mov    %rcx,%r8
ffff800000109d19:	48 89 d1             	mov    %rdx,%rcx
ffff800000109d1c:	48 89 c2             	mov    %rax,%rdx
ffff800000109d1f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109d24:	bf 00 00 00 80       	mov    $0x80000000,%edi
ffff800000109d29:	48 b8 5f 99 10 00 00 	movabs $0xffff80000010995f,%rax
ffff800000109d30:	80 ff ff 
ffff800000109d33:	ff d0                	callq  *%rax
ffff800000109d35:	8b 45 e0             	mov    -0x20(%rbp),%eax
ffff800000109d38:	89 c1                	mov    %eax,%ecx
ffff800000109d3a:	48 ba 78 3c 11 00 00 	movabs $0xffff800000113c78,%rdx
ffff800000109d41:	80 ff ff 
ffff800000109d44:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000109d49:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000109d4e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000109d53:	49 b8 35 53 10 00 00 	movabs $0xffff800000105335,%r8
ffff800000109d5a:	80 ff ff 
ffff800000109d5d:	41 ff d0             	callq  *%r8
ffff800000109d60:	90                   	nop
ffff800000109d61:	c9                   	leaveq 
ffff800000109d62:	c3                   	retq   

Disassembly of section .data:

ffff800000109d80 <GDT_Table>:
	...
ffff800000109d8c:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
ffff800000109d92:	00 00                	add    %al,(%rax)
ffff800000109d94:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
ffff800000109daa:	00 00                	add    %al,(%rax)
ffff800000109dac:	00 f8                	add    %bh,%al
ffff800000109dae:	20 00                	and    %al,(%rax)
ffff800000109db0:	00 00                	add    %al,(%rax)
ffff800000109db2:	00 00                	add    %al,(%rax)
ffff800000109db4:	00 f2                	add    %dh,%dl
ffff800000109db6:	00 00                	add    %al,(%rax)
ffff800000109db8:	ff                   	(bad)  
ffff800000109db9:	ff 00                	incl   (%rax)
ffff800000109dbb:	00 00                	add    %al,(%rax)
ffff800000109dbd:	9a                   	(bad)  
ffff800000109dbe:	cf                   	iret   
ffff800000109dbf:	00 ff                	add    %bh,%bh
ffff800000109dc1:	ff 00                	incl   (%rax)
ffff800000109dc3:	00 00                	add    %al,(%rax)
ffff800000109dc5:	92                   	xchg   %eax,%edx
ffff800000109dc6:	cf                   	iret   
	...

ffff800000109e18 <GDT_END>:
ffff800000109e18:	97                   	xchg   %eax,%edi
	...

ffff800000109e1a <GDT_BASE>:
ffff800000109e1a:	80 9d 10 00 00 80 ff 	sbbb   $0xff,-0x7ffffff0(%rbp)
ffff800000109e21:	ff                 	incl   (%rax)

ffff800000109e22 <IDT_Table>:
	...

ffff80000010ae22 <IDT_END>:
ffff80000010ae22:	ff 0f                	decl   (%rdi)

ffff80000010ae24 <IDT_BASE>:
ffff80000010ae24:	22 9e 10 00 00 80    	and    -0x7ffffff0(%rsi),%bl
ffff80000010ae2a:	ff                   	(bad)  
ffff80000010ae2b:	ff                 	incl   (%rax)

ffff80000010ae2c <TSS64_Table>:
	...

ffff80000010ae94 <TSS64_END>:
ffff80000010ae94:	67 00            	add    %ch,(%esi,%ebp,4)

ffff80000010ae96 <TSS64_BASE>:
ffff80000010ae96:	2c ae                	sub    $0xae,%al
ffff80000010ae98:	10 00                	adc    %al,(%rax)
ffff80000010ae9a:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff80000010aea0 <font_ascii>:
	...
ffff80000010b0b0:	00 10                	add    %dl,(%rax)
ffff80000010b0b2:	10 10                	adc    %dl,(%rax)
ffff80000010b0b4:	10 10                	adc    %dl,(%rax)
ffff80000010b0b6:	10 10                	adc    %dl,(%rax)
ffff80000010b0b8:	10 10                	adc    %dl,(%rax)
ffff80000010b0ba:	00 00                	add    %al,(%rax)
ffff80000010b0bc:	10 10                	adc    %dl,(%rax)
ffff80000010b0be:	00 00                	add    %al,(%rax)
ffff80000010b0c0:	28 28                	sub    %ch,(%rax)
ffff80000010b0c2:	28 00                	sub    %al,(%rax)
	...
ffff80000010b0d0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010b0d4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010b0d8:	44                   	rex.R
ffff80000010b0d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010b0de:	00 00                	add    %al,(%rax)
ffff80000010b0e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010b0e2:	56                   	push   %rsi
ffff80000010b0e3:	92                   	xchg   %eax,%edx
ffff80000010b0e4:	92                   	xchg   %eax,%edx
ffff80000010b0e5:	90                   	nop
ffff80000010b0e6:	50                   	push   %rax
ffff80000010b0e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010b0ea:	92                   	xchg   %eax,%edx
ffff80000010b0eb:	92                   	xchg   %eax,%edx
ffff80000010b0ec:	d4                   	(bad)  
ffff80000010b0ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010b0f2:	94                   	xchg   %eax,%esp
ffff80000010b0f3:	94                   	xchg   %eax,%esp
ffff80000010b0f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010b0f9:	2c 52                	sub    $0x52,%al
ffff80000010b0fb:	52                   	push   %rdx
ffff80000010b0fc:	92                   	xchg   %eax,%edx
ffff80000010b0fd:	8c 00                	mov    %es,(%rax)
ffff80000010b0ff:	00 00                	add    %al,(%rax)
ffff80000010b101:	70 88                	jo     ffff80000010b08b <font_ascii+0x1eb>
ffff80000010b103:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010b109:	92                   	xchg   %eax,%edx
ffff80000010b10a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010b111:	08 10                	or     %dl,(%rax)
	...
ffff80000010b11f:	00 02                	add    %al,(%rdx)
ffff80000010b121:	04 08                	add    $0x8,%al
ffff80000010b123:	08 10                	or     %dl,(%rax)
ffff80000010b125:	10 10                	adc    %dl,(%rax)
ffff80000010b127:	10 10                	adc    %dl,(%rax)
ffff80000010b129:	10 10                	adc    %dl,(%rax)
ffff80000010b12b:	08 08                	or     %cl,(%rax)
ffff80000010b12d:	04 02                	add    $0x2,%al
ffff80000010b12f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010b135:	10 10                	adc    %dl,(%rax)
ffff80000010b137:	10 10                	adc    %dl,(%rax)
ffff80000010b139:	10 10                	adc    %dl,(%rax)
ffff80000010b13b:	20 20                	and    %ah,(%rax)
ffff80000010b13d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b141:	00 00                	add    %al,(%rax)
ffff80000010b143:	00 00                	add    %al,(%rax)
ffff80000010b145:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010b14b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b155:	10 10                	adc    %dl,(%rax)
ffff80000010b157:	10 fe                	adc    %bh,%dh
ffff80000010b159:	10 10                	adc    %dl,(%rax)
ffff80000010b15b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b169:	00 00                	add    %al,(%rax)
ffff80000010b16b:	18 18                	sbb    %bl,(%rax)
ffff80000010b16d:	08 08                	or     %cl,(%rax)
ffff80000010b16f:	10 00                	adc    %al,(%rax)
ffff80000010b171:	00 00                	add    %al,(%rax)
ffff80000010b173:	00 00                	add    %al,(%rax)
ffff80000010b175:	00 00                	add    %al,(%rax)
ffff80000010b177:	00 fe                	add    %bh,%dh
	...
ffff80000010b189:	00 00                	add    %al,(%rax)
ffff80000010b18b:	00 18                	add    %bl,(%rax)
ffff80000010b18d:	18 00                	sbb    %al,(%rax)
ffff80000010b18f:	00 02                	add    %al,(%rdx)
ffff80000010b191:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010b194:	08 08                	or     %cl,(%rax)
ffff80000010b196:	08 10                	or     %dl,(%rax)
ffff80000010b198:	10 20                	adc    %ah,(%rax)
ffff80000010b19a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b19d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010b1a4:	42 
ffff80000010b1a5:	42                   	rex.X
ffff80000010b1a6:	42                   	rex.X
ffff80000010b1a7:	42                   	rex.X
ffff80000010b1a8:	42                   	rex.X
ffff80000010b1a9:	42                   	rex.X
ffff80000010b1aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010b1ad:	18 00                	sbb    %al,(%rax)
ffff80000010b1af:	00 00                	add    %al,(%rax)
ffff80000010b1b1:	08 18                	or     %bl,(%rax)
ffff80000010b1b3:	28 08                	sub    %cl,(%rax)
ffff80000010b1b5:	08 08                	or     %cl,(%rax)
ffff80000010b1b7:	08 08                	or     %cl,(%rax)
ffff80000010b1b9:	08 08                	or     %cl,(%rax)
ffff80000010b1bb:	08 08                	or     %cl,(%rax)
ffff80000010b1bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010b1c0:	00 18                	add    %bl,(%rax)
ffff80000010b1c2:	24 42                	and    $0x42,%al
ffff80000010b1c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010b1c8:	10 20                	adc    %ah,(%rax)
ffff80000010b1ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b1cd:	7e 00                	jle    ffff80000010b1cf <font_ascii+0x32f>
ffff80000010b1cf:	00 00                	add    %al,(%rax)
ffff80000010b1d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010b1d4:	02 02                	add    (%rdx),%al
ffff80000010b1d6:	04 18                	add    $0x18,%al
ffff80000010b1d8:	04 02                	add    $0x2,%al
ffff80000010b1da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010b1dd:	18 00                	sbb    %al,(%rax)
ffff80000010b1df:	00 00                	add    %al,(%rax)
ffff80000010b1e1:	0c 0c                	or     $0xc,%al
ffff80000010b1e3:	0c 14                	or     $0x14,%al
ffff80000010b1e5:	14 14                	adc    $0x14,%al
ffff80000010b1e7:	24 24                	and    $0x24,%al
ffff80000010b1e9:	44 7e 04             	rex.R jle ffff80000010b1f0 <font_ascii+0x350>
ffff80000010b1ec:	04 1e                	add    $0x1e,%al
ffff80000010b1ee:	00 00                	add    %al,(%rax)
ffff80000010b1f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010b1f4:	40 58                	rex pop %rax
ffff80000010b1f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010b1f9:	02 02                	add    (%rdx),%al
ffff80000010b1fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b1fe:	00 00                	add    %al,(%rax)
ffff80000010b200:	00 18                	add    %bl,(%rax)
ffff80000010b202:	24 42                	and    $0x42,%al
ffff80000010b204:	40 58                	rex pop %rax
ffff80000010b206:	64 42                	fs rex.X
ffff80000010b208:	42                   	rex.X
ffff80000010b209:	42                   	rex.X
ffff80000010b20a:	42                   	rex.X
ffff80000010b20b:	42 24 18             	rex.X and $0x18,%al
ffff80000010b20e:	00 00                	add    %al,(%rax)
ffff80000010b210:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010b213:	42 04 04             	rex.X add $0x4,%al
ffff80000010b216:	08 08                	or     %cl,(%rax)
ffff80000010b218:	08 10                	or     %dl,(%rax)
ffff80000010b21a:	10 10                	adc    %dl,(%rax)
ffff80000010b21c:	10 38                	adc    %bh,(%rax)
ffff80000010b21e:	00 00                	add    %al,(%rax)
ffff80000010b220:	00 18                	add    %bl,(%rax)
ffff80000010b222:	24 42                	and    $0x42,%al
ffff80000010b224:	42                   	rex.X
ffff80000010b225:	42 24 18             	rex.X and $0x18,%al
ffff80000010b228:	24 42                	and    $0x42,%al
ffff80000010b22a:	42                   	rex.X
ffff80000010b22b:	42 24 18             	rex.X and $0x18,%al
ffff80000010b22e:	00 00                	add    %al,(%rax)
ffff80000010b230:	00 18                	add    %bl,(%rax)
ffff80000010b232:	24 42                	and    $0x42,%al
ffff80000010b234:	42                   	rex.X
ffff80000010b235:	42                   	rex.X
ffff80000010b236:	42                   	rex.X
ffff80000010b237:	42                   	rex.X
ffff80000010b238:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010b23b:	42 24 18             	rex.X and $0x18,%al
ffff80000010b23e:	00 00                	add    %al,(%rax)
ffff80000010b240:	00 00                	add    %al,(%rax)
ffff80000010b242:	00 00                	add    %al,(%rax)
ffff80000010b244:	00 18                	add    %bl,(%rax)
ffff80000010b246:	18 00                	sbb    %al,(%rax)
ffff80000010b248:	00 00                	add    %al,(%rax)
ffff80000010b24a:	00 00                	add    %al,(%rax)
ffff80000010b24c:	18 18                	sbb    %bl,(%rax)
ffff80000010b24e:	00 00                	add    %al,(%rax)
ffff80000010b250:	00 00                	add    %al,(%rax)
ffff80000010b252:	00 00                	add    %al,(%rax)
ffff80000010b254:	00 18                	add    %bl,(%rax)
ffff80000010b256:	18 00                	sbb    %al,(%rax)
ffff80000010b258:	00 00                	add    %al,(%rax)
ffff80000010b25a:	00 18                	add    %bl,(%rax)
ffff80000010b25c:	18 08                	sbb    %cl,(%rax)
ffff80000010b25e:	08 10                	or     %dl,(%rax)
ffff80000010b260:	00 02                	add    %al,(%rdx)
ffff80000010b262:	04 08                	add    $0x8,%al
ffff80000010b264:	10 20                	adc    %ah,(%rax)
ffff80000010b266:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010b26d:	04 
ffff80000010b26e:	02 00                	add    (%rax),%al
ffff80000010b270:	00 00                	add    %al,(%rax)
ffff80000010b272:	00 00                	add    %al,(%rax)
ffff80000010b274:	00 00                	add    %al,(%rax)
ffff80000010b276:	fe 00                	incb   (%rax)
ffff80000010b278:	00 fe                	add    %bh,%dh
ffff80000010b27a:	00 00                	add    %al,(%rax)
ffff80000010b27c:	00 00                	add    %al,(%rax)
ffff80000010b27e:	00 00                	add    %al,(%rax)
ffff80000010b280:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010b286:	04 02                	add    $0x2,%al
ffff80000010b288:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010b28b:	10 20                	adc    %ah,(%rax)
ffff80000010b28d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b291:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b295:	82                   	(bad)  
ffff80000010b296:	04 08                	add    $0x8,%al
ffff80000010b298:	10 10                	adc    %dl,(%rax)
ffff80000010b29a:	00 00                	add    %al,(%rax)
ffff80000010b29c:	18 18                	sbb    %bl,(%rax)
ffff80000010b29e:	00 00                	add    %al,(%rax)
ffff80000010b2a0:	00 38                	add    %bh,(%rax)
ffff80000010b2a2:	44 82                	rex.R (bad) 
ffff80000010b2a4:	9a                   	(bad)  
ffff80000010b2a5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b2a6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b2a7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b2a8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b2a9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010b2aa:	9c                   	pushfq 
ffff80000010b2ab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010b2af:	00 00                	add    %al,(%rax)
ffff80000010b2b1:	18 18                	sbb    %bl,(%rax)
ffff80000010b2b3:	18 18                	sbb    %bl,(%rax)
ffff80000010b2b5:	24 24                	and    $0x24,%al
ffff80000010b2b7:	24 24                	and    $0x24,%al
ffff80000010b2b9:	7e 42                	jle    ffff80000010b2fd <font_ascii+0x45d>
ffff80000010b2bb:	42                   	rex.X
ffff80000010b2bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b2bf:	00 00                	add    %al,(%rax)
ffff80000010b2c1:	f0 48                	lock rex.W
ffff80000010b2c3:	44                   	rex.R
ffff80000010b2c4:	44                   	rex.R
ffff80000010b2c5:	44                   	rex.R
ffff80000010b2c6:	48 78 44             	rex.W js ffff80000010b30d <font_ascii+0x46d>
ffff80000010b2c9:	42                   	rex.X
ffff80000010b2ca:	42                   	rex.X
ffff80000010b2cb:	42                   	rex.X
ffff80000010b2cc:	44 f8                	rex.R clc 
ffff80000010b2ce:	00 00                	add    %al,(%rax)
ffff80000010b2d0:	00 3a                	add    %bh,(%rdx)
ffff80000010b2d2:	46                   	rex.RX
ffff80000010b2d3:	42 82                	rex.X (bad) 
ffff80000010b2d5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010b2dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b2df:	00 00                	add    %al,(%rax)
ffff80000010b2e1:	f8                   	clc    
ffff80000010b2e2:	44                   	rex.R
ffff80000010b2e3:	44                   	rex.R
ffff80000010b2e4:	42                   	rex.X
ffff80000010b2e5:	42                   	rex.X
ffff80000010b2e6:	42                   	rex.X
ffff80000010b2e7:	42                   	rex.X
ffff80000010b2e8:	42                   	rex.X
ffff80000010b2e9:	42                   	rex.X
ffff80000010b2ea:	42                   	rex.X
ffff80000010b2eb:	44                   	rex.R
ffff80000010b2ec:	44 f8                	rex.R clc 
ffff80000010b2ee:	00 00                	add    %al,(%rax)
ffff80000010b2f0:	00 fe                	add    %bh,%dh
ffff80000010b2f2:	42                   	rex.X
ffff80000010b2f3:	42                   	rex.X
ffff80000010b2f4:	40                   	rex
ffff80000010b2f5:	40                   	rex
ffff80000010b2f6:	44 7c 44             	rex.R jl ffff80000010b33d <font_ascii+0x49d>
ffff80000010b2f9:	40                   	rex
ffff80000010b2fa:	40                   	rex
ffff80000010b2fb:	42                   	rex.X
ffff80000010b2fc:	42 fe 00             	rex.X incb (%rax)
ffff80000010b2ff:	00 00                	add    %al,(%rax)
ffff80000010b301:	fe 42 42             	incb   0x42(%rdx)
ffff80000010b304:	40                   	rex
ffff80000010b305:	40                   	rex
ffff80000010b306:	44 7c 44             	rex.R jl ffff80000010b34d <font_ascii+0x4ad>
ffff80000010b309:	44                   	rex.R
ffff80000010b30a:	40                   	rex
ffff80000010b30b:	40                   	rex
ffff80000010b30c:	40                   	rex
ffff80000010b30d:	f0 00 00             	lock add %al,(%rax)
ffff80000010b310:	00 3a                	add    %bh,(%rdx)
ffff80000010b312:	46                   	rex.RX
ffff80000010b313:	42 82                	rex.X (bad) 
ffff80000010b315:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010b31c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010b31f:	00 00                	add    %al,(%rax)
ffff80000010b321:	e7 42                	out    %eax,$0x42
ffff80000010b323:	42                   	rex.X
ffff80000010b324:	42                   	rex.X
ffff80000010b325:	42                   	rex.X
ffff80000010b326:	42 7e 42             	rex.X jle ffff80000010b36b <font_ascii+0x4cb>
ffff80000010b329:	42                   	rex.X
ffff80000010b32a:	42                   	rex.X
ffff80000010b32b:	42                   	rex.X
ffff80000010b32c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b32f:	00 00                	add    %al,(%rax)
ffff80000010b331:	7c 10                	jl     ffff80000010b343 <font_ascii+0x4a3>
ffff80000010b333:	10 10                	adc    %dl,(%rax)
ffff80000010b335:	10 10                	adc    %dl,(%rax)
ffff80000010b337:	10 10                	adc    %dl,(%rax)
ffff80000010b339:	10 10                	adc    %dl,(%rax)
ffff80000010b33b:	10 10                	adc    %dl,(%rax)
ffff80000010b33d:	7c 00                	jl     ffff80000010b33f <font_ascii+0x49f>
ffff80000010b33f:	00 00                	add    %al,(%rax)
ffff80000010b341:	1f                   	(bad)  
ffff80000010b342:	04 04                	add    $0x4,%al
ffff80000010b344:	04 04                	add    $0x4,%al
ffff80000010b346:	04 04                	add    $0x4,%al
ffff80000010b348:	04 04                	add    $0x4,%al
ffff80000010b34a:	04 04                	add    $0x4,%al
ffff80000010b34c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010b34f:	00 00                	add    %al,(%rax)
ffff80000010b351:	e7 42                	out    %eax,$0x42
ffff80000010b353:	44                   	rex.R
ffff80000010b354:	48 50                	rex.W push %rax
ffff80000010b356:	50                   	push   %rax
ffff80000010b357:	60                   	(bad)  
ffff80000010b358:	50                   	push   %rax
ffff80000010b359:	50                   	push   %rax
ffff80000010b35a:	48                   	rex.W
ffff80000010b35b:	44                   	rex.R
ffff80000010b35c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b35f:	00 00                	add    %al,(%rax)
ffff80000010b361:	f0 40                	lock rex
ffff80000010b363:	40                   	rex
ffff80000010b364:	40                   	rex
ffff80000010b365:	40                   	rex
ffff80000010b366:	40                   	rex
ffff80000010b367:	40                   	rex
ffff80000010b368:	40                   	rex
ffff80000010b369:	40                   	rex
ffff80000010b36a:	40                   	rex
ffff80000010b36b:	42                   	rex.X
ffff80000010b36c:	42 fe 00             	rex.X incb (%rax)
ffff80000010b36f:	00 00                	add    %al,(%rax)
ffff80000010b371:	c3                   	retq   
ffff80000010b372:	42                   	rex.X
ffff80000010b373:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010b377:	5a                   	pop    %rdx
ffff80000010b378:	5a                   	pop    %rdx
ffff80000010b379:	42                   	rex.X
ffff80000010b37a:	42                   	rex.X
ffff80000010b37b:	42                   	rex.X
ffff80000010b37c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b37f:	00 00                	add    %al,(%rax)
ffff80000010b381:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010b388:	4a                   	rex.WX
ffff80000010b389:	4a                   	rex.WX
ffff80000010b38a:	4a                   	rex.WX
ffff80000010b38b:	46                   	rex.RX
ffff80000010b38c:	46 e2 00             	rex.RX loop ffff80000010b38f <font_ascii+0x4ef>
ffff80000010b38f:	00 00                	add    %al,(%rax)
ffff80000010b391:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b395:	82                   	(bad)  
ffff80000010b396:	82                   	(bad)  
ffff80000010b397:	82                   	(bad)  
ffff80000010b398:	82                   	(bad)  
ffff80000010b399:	82                   	(bad)  
ffff80000010b39a:	82                   	(bad)  
ffff80000010b39b:	82                   	(bad)  
ffff80000010b39c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b39f:	00 00                	add    %al,(%rax)
ffff80000010b3a1:	f8                   	clc    
ffff80000010b3a2:	44                   	rex.R
ffff80000010b3a3:	42                   	rex.X
ffff80000010b3a4:	42                   	rex.X
ffff80000010b3a5:	42                   	rex.X
ffff80000010b3a6:	44 78 40             	rex.R js ffff80000010b3e9 <font_ascii+0x549>
ffff80000010b3a9:	40                   	rex
ffff80000010b3aa:	40                   	rex
ffff80000010b3ab:	40                   	rex
ffff80000010b3ac:	40                   	rex
ffff80000010b3ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010b3b0:	00 38                	add    %bh,(%rax)
ffff80000010b3b2:	44 82                	rex.R (bad) 
ffff80000010b3b4:	82                   	(bad)  
ffff80000010b3b5:	82                   	(bad)  
ffff80000010b3b6:	82                   	(bad)  
ffff80000010b3b7:	82                   	(bad)  
ffff80000010b3b8:	82                   	(bad)  
ffff80000010b3b9:	82                   	(bad)  
ffff80000010b3ba:	92                   	xchg   %eax,%edx
ffff80000010b3bb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010b3bf:	00 00                	add    %al,(%rax)
ffff80000010b3c1:	fc                   	cld    
ffff80000010b3c2:	42                   	rex.X
ffff80000010b3c3:	42                   	rex.X
ffff80000010b3c4:	42                   	rex.X
ffff80000010b3c5:	42 7c 44             	rex.X jl ffff80000010b40c <font_ascii+0x56c>
ffff80000010b3c8:	42                   	rex.X
ffff80000010b3c9:	42                   	rex.X
ffff80000010b3ca:	42                   	rex.X
ffff80000010b3cb:	42                   	rex.X
ffff80000010b3cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b3cf:	00 00                	add    %al,(%rax)
ffff80000010b3d1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010b3d4:	82                   	(bad)  
ffff80000010b3d5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010b3d9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010b3df:	00 00                	add    %al,(%rax)
ffff80000010b3e1:	fe                   	(bad)  
ffff80000010b3e2:	92                   	xchg   %eax,%edx
ffff80000010b3e3:	92                   	xchg   %eax,%edx
ffff80000010b3e4:	10 10                	adc    %dl,(%rax)
ffff80000010b3e6:	10 10                	adc    %dl,(%rax)
ffff80000010b3e8:	10 10                	adc    %dl,(%rax)
ffff80000010b3ea:	10 10                	adc    %dl,(%rax)
ffff80000010b3ec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010b3f0:	00 e7                	add    %ah,%bh
ffff80000010b3f2:	42                   	rex.X
ffff80000010b3f3:	42                   	rex.X
ffff80000010b3f4:	42                   	rex.X
ffff80000010b3f5:	42                   	rex.X
ffff80000010b3f6:	42                   	rex.X
ffff80000010b3f7:	42                   	rex.X
ffff80000010b3f8:	42                   	rex.X
ffff80000010b3f9:	42                   	rex.X
ffff80000010b3fa:	42                   	rex.X
ffff80000010b3fb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010b3fe:	00 00                	add    %al,(%rax)
ffff80000010b400:	00 e7                	add    %ah,%bh
ffff80000010b402:	42                   	rex.X
ffff80000010b403:	42                   	rex.X
ffff80000010b404:	42                   	rex.X
ffff80000010b405:	42 24 24             	rex.X and $0x24,%al
ffff80000010b408:	24 24                	and    $0x24,%al
ffff80000010b40a:	18 18                	sbb    %bl,(%rax)
ffff80000010b40c:	18 18                	sbb    %bl,(%rax)
ffff80000010b40e:	00 00                	add    %al,(%rax)
ffff80000010b410:	00 e7                	add    %ah,%bh
ffff80000010b412:	42                   	rex.X
ffff80000010b413:	42                   	rex.X
ffff80000010b414:	42 5a                	rex.X pop %rdx
ffff80000010b416:	5a                   	pop    %rdx
ffff80000010b417:	5a                   	pop    %rdx
ffff80000010b418:	5a                   	pop    %rdx
ffff80000010b419:	24 24                	and    $0x24,%al
ffff80000010b41b:	24 24                	and    $0x24,%al
ffff80000010b41d:	24 00                	and    $0x0,%al
ffff80000010b41f:	00 00                	add    %al,(%rax)
ffff80000010b421:	e7 42                	out    %eax,$0x42
ffff80000010b423:	42 24 24             	rex.X and $0x24,%al
ffff80000010b426:	24 18                	and    $0x18,%al
ffff80000010b428:	24 24                	and    $0x24,%al
ffff80000010b42a:	24 42                	and    $0x42,%al
ffff80000010b42c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010b42f:	00 00                	add    %al,(%rax)
ffff80000010b431:	ee                   	out    %al,(%dx)
ffff80000010b432:	44                   	rex.R
ffff80000010b433:	44                   	rex.R
ffff80000010b434:	44 28 28             	sub    %r13b,(%rax)
ffff80000010b437:	28 10                	sub    %dl,(%rax)
ffff80000010b439:	10 10                	adc    %dl,(%rax)
ffff80000010b43b:	10 10                	adc    %dl,(%rax)
ffff80000010b43d:	7c 00                	jl     ffff80000010b43f <font_ascii+0x59f>
ffff80000010b43f:	00 00                	add    %al,(%rax)
ffff80000010b441:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010b448:	20 20                	and    %ah,(%rax)
ffff80000010b44a:	40                   	rex
ffff80000010b44b:	42 82                	rex.X (bad) 
ffff80000010b44d:	fe 00                	incb   (%rax)
ffff80000010b44f:	00 00                	add    %al,(%rax)
ffff80000010b451:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010b454:	20 20                	and    %ah,(%rax)
ffff80000010b456:	20 20                	and    %ah,(%rax)
ffff80000010b458:	20 20                	and    %ah,(%rax)
ffff80000010b45a:	20 20                	and    %ah,(%rax)
ffff80000010b45c:	20 20                	and    %ah,(%rax)
ffff80000010b45e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010b465:	20 20                	and    %ah,(%rax)
ffff80000010b467:	10 10                	adc    %dl,(%rax)
ffff80000010b469:	08 08                	or     %cl,(%rax)
ffff80000010b46b:	04 04                	add    $0x4,%al
ffff80000010b46d:	04 02                	add    $0x2,%al
ffff80000010b46f:	02 00                	add    (%rax),%al
ffff80000010b471:	7c 04                	jl     ffff80000010b477 <font_ascii+0x5d7>
ffff80000010b473:	04 04                	add    $0x4,%al
ffff80000010b475:	04 04                	add    $0x4,%al
ffff80000010b477:	04 04                	add    $0x4,%al
ffff80000010b479:	04 04                	add    $0x4,%al
ffff80000010b47b:	04 04                	add    $0x4,%al
ffff80000010b47d:	04 7c                	add    $0x7c,%al
ffff80000010b47f:	00 00                	add    %al,(%rax)
ffff80000010b481:	10 28                	adc    %ch,(%rax)
ffff80000010b483:	44 82                	rex.R (bad) 
	...
ffff80000010b49d:	00 fe                	add    %bh,%dh
ffff80000010b49f:	00 10                	add    %dl,(%rax)
ffff80000010b4a1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010b4b4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010b4b7:	04 3c                	add    $0x3c,%al
ffff80000010b4b9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010b4c0:	c0 
ffff80000010b4c1:	40                   	rex
ffff80000010b4c2:	40                   	rex
ffff80000010b4c3:	40                   	rex
ffff80000010b4c4:	40 58                	rex pop %rax
ffff80000010b4c6:	64 42                	fs rex.X
ffff80000010b4c8:	42                   	rex.X
ffff80000010b4c9:	42                   	rex.X
ffff80000010b4ca:	42                   	rex.X
ffff80000010b4cb:	42                   	rex.X
ffff80000010b4cc:	64 58                	fs pop %rax
ffff80000010b4ce:	00 00                	add    %al,(%rax)
ffff80000010b4d0:	00 00                	add    %al,(%rax)
ffff80000010b4d2:	00 00                	add    %al,(%rax)
ffff80000010b4d4:	00 30                	add    %dh,(%rax)
ffff80000010b4d6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010b4dd:	38 
ffff80000010b4de:	00 00                	add    %al,(%rax)
ffff80000010b4e0:	0c 04                	or     $0x4,%al
ffff80000010b4e2:	04 04                	add    $0x4,%al
ffff80000010b4e4:	04 34                	add    $0x34,%al
ffff80000010b4e6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010b4ed:	36 
ffff80000010b4ee:	00 00                	add    %al,(%rax)
ffff80000010b4f0:	00 00                	add    %al,(%rax)
ffff80000010b4f2:	00 00                	add    %al,(%rax)
ffff80000010b4f4:	00 38                	add    %bh,(%rax)
ffff80000010b4f6:	44 82                	rex.R (bad) 
ffff80000010b4f8:	82                   	(bad)  
ffff80000010b4f9:	fc                   	cld    
ffff80000010b4fa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010b501:	10 10                	adc    %dl,(%rax)
ffff80000010b503:	10 10                	adc    %dl,(%rax)
ffff80000010b505:	7c 10                	jl     ffff80000010b517 <font_ascii+0x677>
ffff80000010b507:	10 10                	adc    %dl,(%rax)
ffff80000010b509:	10 10                	adc    %dl,(%rax)
ffff80000010b50b:	10 10                	adc    %dl,(%rax)
ffff80000010b50d:	7c 00                	jl     ffff80000010b50f <font_ascii+0x66f>
ffff80000010b50f:	00 00                	add    %al,(%rax)
ffff80000010b511:	00 00                	add    %al,(%rax)
ffff80000010b513:	00 00                	add    %al,(%rax)
ffff80000010b515:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010b51c:	34 04 
ffff80000010b51e:	04 38                	add    $0x38,%al
ffff80000010b520:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010b524:	40 58                	rex pop %rax
ffff80000010b526:	64 42                	fs rex.X
ffff80000010b528:	42                   	rex.X
ffff80000010b529:	42                   	rex.X
ffff80000010b52a:	42                   	rex.X
ffff80000010b52b:	42                   	rex.X
ffff80000010b52c:	42 e3 00             	rex.X jrcxz ffff80000010b52f <font_ascii+0x68f>
ffff80000010b52f:	00 00                	add    %al,(%rax)
ffff80000010b531:	10 10                	adc    %dl,(%rax)
ffff80000010b533:	00 00                	add    %al,(%rax)
ffff80000010b535:	30 10                	xor    %dl,(%rax)
ffff80000010b537:	10 10                	adc    %dl,(%rax)
ffff80000010b539:	10 10                	adc    %dl,(%rax)
ffff80000010b53b:	10 10                	adc    %dl,(%rax)
ffff80000010b53d:	38 00                	cmp    %al,(%rax)
ffff80000010b53f:	00 00                	add    %al,(%rax)
ffff80000010b541:	04 04                	add    $0x4,%al
ffff80000010b543:	00 00                	add    %al,(%rax)
ffff80000010b545:	0c 04                	or     $0x4,%al
ffff80000010b547:	04 04                	add    $0x4,%al
ffff80000010b549:	04 04                	add    $0x4,%al
ffff80000010b54b:	04 04                	add    $0x4,%al
ffff80000010b54d:	08 08                	or     %cl,(%rax)
ffff80000010b54f:	30 c0                	xor    %al,%al
ffff80000010b551:	40                   	rex
ffff80000010b552:	40                   	rex
ffff80000010b553:	40                   	rex
ffff80000010b554:	40                   	rex
ffff80000010b555:	4e                   	rex.WRX
ffff80000010b556:	44                   	rex.R
ffff80000010b557:	48 50                	rex.W push %rax
ffff80000010b559:	60                   	(bad)  
ffff80000010b55a:	50                   	push   %rax
ffff80000010b55b:	48                   	rex.W
ffff80000010b55c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010b55f:	00 30                	add    %dh,(%rax)
ffff80000010b561:	10 10                	adc    %dl,(%rax)
ffff80000010b563:	10 10                	adc    %dl,(%rax)
ffff80000010b565:	10 10                	adc    %dl,(%rax)
ffff80000010b567:	10 10                	adc    %dl,(%rax)
ffff80000010b569:	10 10                	adc    %dl,(%rax)
ffff80000010b56b:	10 10                	adc    %dl,(%rax)
ffff80000010b56d:	38 00                	cmp    %al,(%rax)
ffff80000010b56f:	00 00                	add    %al,(%rax)
ffff80000010b571:	00 00                	add    %al,(%rax)
ffff80000010b573:	00 00                	add    %al,(%rax)
ffff80000010b575:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010b579:	49                   	rex.WB
ffff80000010b57a:	49                   	rex.WB
ffff80000010b57b:	49                   	rex.WB
ffff80000010b57c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010b57f:	00 00                	add    %al,(%rax)
ffff80000010b581:	00 00                	add    %al,(%rax)
ffff80000010b583:	00 00                	add    %al,(%rax)
ffff80000010b585:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010b589:	42                   	rex.X
ffff80000010b58a:	42                   	rex.X
ffff80000010b58b:	42                   	rex.X
ffff80000010b58c:	42 e3 00             	rex.X jrcxz ffff80000010b58f <font_ascii+0x6ef>
ffff80000010b58f:	00 00                	add    %al,(%rax)
ffff80000010b591:	00 00                	add    %al,(%rax)
ffff80000010b593:	00 00                	add    %al,(%rax)
ffff80000010b595:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010b599:	82                   	(bad)  
ffff80000010b59a:	82                   	(bad)  
ffff80000010b59b:	82                   	(bad)  
ffff80000010b59c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010b59f:	00 00                	add    %al,(%rax)
ffff80000010b5a1:	00 00                	add    %al,(%rax)
ffff80000010b5a3:	00 d8                	add    %bl,%al
ffff80000010b5a5:	64 42                	fs rex.X
ffff80000010b5a7:	42                   	rex.X
ffff80000010b5a8:	42                   	rex.X
ffff80000010b5a9:	42                   	rex.X
ffff80000010b5aa:	42                   	rex.X
ffff80000010b5ab:	64 58                	fs pop %rax
ffff80000010b5ad:	40                   	rex
ffff80000010b5ae:	40 e0 00             	rex loopne ffff80000010b5b1 <font_ascii+0x711>
ffff80000010b5b1:	00 00                	add    %al,(%rax)
ffff80000010b5b3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010b5b6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010b5bd:	04 04                	add    $0x4,%al
ffff80000010b5bf:	0e                   	(bad)  
ffff80000010b5c0:	00 00                	add    %al,(%rax)
ffff80000010b5c2:	00 00                	add    %al,(%rax)
ffff80000010b5c4:	00 dc                	add    %bl,%ah
ffff80000010b5c6:	62 42                	(bad)  
ffff80000010b5c8:	40                   	rex
ffff80000010b5c9:	40                   	rex
ffff80000010b5ca:	40                   	rex
ffff80000010b5cb:	40                   	rex
ffff80000010b5cc:	40 e0 00             	rex loopne ffff80000010b5cf <font_ascii+0x72f>
ffff80000010b5cf:	00 00                	add    %al,(%rax)
ffff80000010b5d1:	00 00                	add    %al,(%rax)
ffff80000010b5d3:	00 00                	add    %al,(%rax)
ffff80000010b5d5:	7a 86                	jp     ffff80000010b55d <font_ascii+0x6bd>
ffff80000010b5d7:	82                   	(bad)  
ffff80000010b5d8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010b5db:	82                   	(bad)  
ffff80000010b5dc:	c2 bc 00             	retq   $0xbc
ffff80000010b5df:	00 00                	add    %al,(%rax)
ffff80000010b5e1:	00 10                	add    %dl,(%rax)
ffff80000010b5e3:	10 10                	adc    %dl,(%rax)
ffff80000010b5e5:	7c 10                	jl     ffff80000010b5f7 <font_ascii+0x757>
ffff80000010b5e7:	10 10                	adc    %dl,(%rax)
ffff80000010b5e9:	10 10                	adc    %dl,(%rax)
ffff80000010b5eb:	10 10                	adc    %dl,(%rax)
ffff80000010b5ed:	0e                   	(bad)  
ffff80000010b5ee:	00 00                	add    %al,(%rax)
ffff80000010b5f0:	00 00                	add    %al,(%rax)
ffff80000010b5f2:	00 00                	add    %al,(%rax)
ffff80000010b5f4:	00 c6                	add    %al,%dh
ffff80000010b5f6:	42                   	rex.X
ffff80000010b5f7:	42                   	rex.X
ffff80000010b5f8:	42                   	rex.X
ffff80000010b5f9:	42                   	rex.X
ffff80000010b5fa:	42                   	rex.X
ffff80000010b5fb:	42                   	rex.X
ffff80000010b5fc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010b5ff:	00 00                	add    %al,(%rax)
ffff80000010b601:	00 00                	add    %al,(%rax)
ffff80000010b603:	00 00                	add    %al,(%rax)
ffff80000010b605:	e7 42                	out    %eax,$0x42
ffff80000010b607:	42                   	rex.X
ffff80000010b608:	42 24 24             	rex.X and $0x24,%al
ffff80000010b60b:	24 18                	and    $0x18,%al
ffff80000010b60d:	18 00                	sbb    %al,(%rax)
ffff80000010b60f:	00 00                	add    %al,(%rax)
ffff80000010b611:	00 00                	add    %al,(%rax)
ffff80000010b613:	00 00                	add    %al,(%rax)
ffff80000010b615:	e7 42                	out    %eax,$0x42
ffff80000010b617:	42 5a                	rex.X pop %rdx
ffff80000010b619:	5a                   	pop    %rdx
ffff80000010b61a:	5a                   	pop    %rdx
ffff80000010b61b:	24 24                	and    $0x24,%al
ffff80000010b61d:	24 00                	and    $0x0,%al
ffff80000010b61f:	00 00                	add    %al,(%rax)
ffff80000010b621:	00 00                	add    %al,(%rax)
ffff80000010b623:	00 00                	add    %al,(%rax)
ffff80000010b625:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010b62a:	28 28                	sub    %ch,(%rax)
ffff80000010b62c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010b630:	00 00                	add    %al,(%rax)
ffff80000010b632:	00 00                	add    %al,(%rax)
ffff80000010b634:	00 e7                	add    %ah,%bh
ffff80000010b636:	42                   	rex.X
ffff80000010b637:	42 24 24             	rex.X and $0x24,%al
ffff80000010b63a:	24 18                	and    $0x18,%al
ffff80000010b63c:	18 10                	sbb    %dl,(%rax)
ffff80000010b63e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b641:	00 00                	add    %al,(%rax)
ffff80000010b643:	00 00                	add    %al,(%rax)
ffff80000010b645:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010b64b:	42 82                	rex.X (bad) 
ffff80000010b64d:	fe 00                	incb   (%rax)
ffff80000010b64f:	00 00                	add    %al,(%rax)
ffff80000010b651:	06                   	(bad)  
ffff80000010b652:	08 10                	or     %dl,(%rax)
ffff80000010b654:	10 10                	adc    %dl,(%rax)
ffff80000010b656:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010b659:	10 10                	adc    %dl,(%rax)
ffff80000010b65b:	10 08                	adc    %cl,(%rax)
ffff80000010b65d:	06                   	(bad)  
ffff80000010b65e:	00 00                	add    %al,(%rax)
ffff80000010b660:	10 10                	adc    %dl,(%rax)
ffff80000010b662:	10 10                	adc    %dl,(%rax)
ffff80000010b664:	10 10                	adc    %dl,(%rax)
ffff80000010b666:	10 10                	adc    %dl,(%rax)
ffff80000010b668:	10 10                	adc    %dl,(%rax)
ffff80000010b66a:	10 10                	adc    %dl,(%rax)
ffff80000010b66c:	10 10                	adc    %dl,(%rax)
ffff80000010b66e:	10 10                	adc    %dl,(%rax)
ffff80000010b670:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010b673:	08 08                	or     %cl,(%rax)
ffff80000010b675:	08 08                	or     %cl,(%rax)
ffff80000010b677:	06                   	(bad)  
ffff80000010b678:	08 08                	or     %cl,(%rax)
ffff80000010b67a:	08 08                	or     %cl,(%rax)
ffff80000010b67c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010b67f:	00 00                	add    %al,(%rax)
ffff80000010b681:	72 8c                	jb     ffff80000010b60f <font_ascii+0x76f>
	...

ffff80000010bea0 <init_thread>:
ffff80000010bea0:	00 00                	add    %al,(%rax)
ffff80000010bea2:	12 00                	adc    (%rax),%al
ffff80000010bea4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010beb2:	12 00                	adc    (%rax),%al
ffff80000010beb4:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010beba:	00 00                	add    %al,(%rax)
ffff80000010bebc:	00 00                	add    %al,(%rax)
ffff80000010bebe:	00 00                	add    %al,(%rax)
ffff80000010bec0:	10 00                	adc    %al,(%rax)
	...

ffff80000010bee0 <init_task>:
ffff80000010bee0:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010bee6:	ff                   	(bad)  
ffff80000010bee7:	ff 00                	incl   (%rax)
	...

ffff80000010bf00 <init_tss>:
ffff80000010bf00:	00 00                	add    %al,(%rax)
ffff80000010bf02:	00 00                	add    %al,(%rax)
ffff80000010bf04:	00 00                	add    %al,(%rax)
ffff80000010bf06:	12 00                	adc    (%rax),%al
ffff80000010bf08:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf0e:	12 00                	adc    (%rax),%al
ffff80000010bf10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf16:	12 00                	adc    (%rax),%al
ffff80000010bf18:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf1e:	00 00                	add    %al,(%rax)
ffff80000010bf20:	00 00                	add    %al,(%rax)
ffff80000010bf22:	00 00                	add    %al,(%rax)
ffff80000010bf24:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bf28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf2e:	00 00                	add    %al,(%rax)
ffff80000010bf30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf36:	00 00                	add    %al,(%rax)
ffff80000010bf38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf3e:	00 00                	add    %al,(%rax)
ffff80000010bf40:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf46:	00 00                	add    %al,(%rax)
ffff80000010bf48:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf4e:	00 00                	add    %al,(%rax)
ffff80000010bf50:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf56:	00 00                	add    %al,(%rax)
ffff80000010bf58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bf6e:	12 00                	adc    (%rax),%al
ffff80000010bf70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf76:	12 00                	adc    (%rax),%al
ffff80000010bf78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf7e:	12 00                	adc    (%rax),%al
ffff80000010bf80:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bf86:	00 00                	add    %al,(%rax)
ffff80000010bf88:	00 00                	add    %al,(%rax)
ffff80000010bf8a:	00 00                	add    %al,(%rax)
ffff80000010bf8c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bf90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf96:	00 00                	add    %al,(%rax)
ffff80000010bf98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bf9e:	00 00                	add    %al,(%rax)
ffff80000010bfa0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfa6:	00 00                	add    %al,(%rax)
ffff80000010bfa8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfae:	00 00                	add    %al,(%rax)
ffff80000010bfb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfb6:	00 00                	add    %al,(%rax)
ffff80000010bfb8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bfbe:	00 00                	add    %al,(%rax)
ffff80000010bfc0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010bfd6:	12 00                	adc    (%rax),%al
ffff80000010bfd8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bfde:	12 00                	adc    (%rax),%al
ffff80000010bfe0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bfe6:	12 00                	adc    (%rax),%al
ffff80000010bfe8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010bfee:	00 00                	add    %al,(%rax)
ffff80000010bff0:	00 00                	add    %al,(%rax)
ffff80000010bff2:	00 00                	add    %al,(%rax)
ffff80000010bff4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010bff8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010bffe:	00 00                	add    %al,(%rax)
ffff80000010c000:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c006:	00 00                	add    %al,(%rax)
ffff80000010c008:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c00e:	00 00                	add    %al,(%rax)
ffff80000010c010:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c016:	00 00                	add    %al,(%rax)
ffff80000010c018:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c01e:	00 00                	add    %al,(%rax)
ffff80000010c020:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c026:	00 00                	add    %al,(%rax)
ffff80000010c028:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c03e:	12 00                	adc    (%rax),%al
ffff80000010c040:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c046:	12 00                	adc    (%rax),%al
ffff80000010c048:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c04e:	12 00                	adc    (%rax),%al
ffff80000010c050:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010c056:	00 00                	add    %al,(%rax)
ffff80000010c058:	00 00                	add    %al,(%rax)
ffff80000010c05a:	00 00                	add    %al,(%rax)
ffff80000010c05c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010c060:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c066:	00 00                	add    %al,(%rax)
ffff80000010c068:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c06e:	00 00                	add    %al,(%rax)
ffff80000010c070:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c076:	00 00                	add    %al,(%rax)
ffff80000010c078:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c07e:	00 00                	add    %al,(%rax)
ffff80000010c080:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c086:	00 00                	add    %al,(%rax)
ffff80000010c088:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010c08e:	00 00                	add    %al,(%rax)
ffff80000010c090:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010c0a0 <system_call_table>:
ffff80000010c0a0:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff80000010c0a4:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
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
ffff80000010c23c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c242:	10 00                	adc    %al,(%rax)
ffff80000010c244:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c24a:	10 00                	adc    %al,(%rax)
ffff80000010c24c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c252:	10 00                	adc    %al,(%rax)
ffff80000010c254:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c25a:	10 00                	adc    %al,(%rax)
ffff80000010c25c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c262:	10 00                	adc    %al,(%rax)
ffff80000010c264:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c26a:	10 00                	adc    %al,(%rax)
ffff80000010c26c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c272:	10 00                	adc    %al,(%rax)
ffff80000010c274:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c27a:	10 00                	adc    %al,(%rax)
ffff80000010c27c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c282:	10 00                	adc    %al,(%rax)
ffff80000010c284:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c28a:	10 00                	adc    %al,(%rax)
ffff80000010c28c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c292:	10 00                	adc    %al,(%rax)
ffff80000010c294:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c29a:	10 00                	adc    %al,(%rax)
ffff80000010c29c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2a2:	10 00                	adc    %al,(%rax)
ffff80000010c2a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2aa:	10 00                	adc    %al,(%rax)
ffff80000010c2ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2b2:	10 00                	adc    %al,(%rax)
ffff80000010c2b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2ba:	10 00                	adc    %al,(%rax)
ffff80000010c2bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2c2:	10 00                	adc    %al,(%rax)
ffff80000010c2c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2ca:	10 00                	adc    %al,(%rax)
ffff80000010c2cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2d2:	10 00                	adc    %al,(%rax)
ffff80000010c2d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2da:	10 00                	adc    %al,(%rax)
ffff80000010c2dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2e2:	10 00                	adc    %al,(%rax)
ffff80000010c2e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2ea:	10 00                	adc    %al,(%rax)
ffff80000010c2ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2f2:	10 00                	adc    %al,(%rax)
ffff80000010c2f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c2fa:	10 00                	adc    %al,(%rax)
ffff80000010c2fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c302:	10 00                	adc    %al,(%rax)
ffff80000010c304:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c30a:	10 00                	adc    %al,(%rax)
ffff80000010c30c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c312:	10 00                	adc    %al,(%rax)
ffff80000010c314:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c31a:	10 00                	adc    %al,(%rax)
ffff80000010c31c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c322:	10 00                	adc    %al,(%rax)
ffff80000010c324:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c32a:	10 00                	adc    %al,(%rax)
ffff80000010c32c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c332:	10 00                	adc    %al,(%rax)
ffff80000010c334:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c33a:	10 00                	adc    %al,(%rax)
ffff80000010c33c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c342:	10 00                	adc    %al,(%rax)
ffff80000010c344:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c34a:	10 00                	adc    %al,(%rax)
ffff80000010c34c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c352:	10 00                	adc    %al,(%rax)
ffff80000010c354:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c35a:	10 00                	adc    %al,(%rax)
ffff80000010c35c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c362:	10 00                	adc    %al,(%rax)
ffff80000010c364:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c36a:	10 00                	adc    %al,(%rax)
ffff80000010c36c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c372:	10 00                	adc    %al,(%rax)
ffff80000010c374:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c37a:	10 00                	adc    %al,(%rax)
ffff80000010c37c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c382:	10 00                	adc    %al,(%rax)
ffff80000010c384:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c38a:	10 00                	adc    %al,(%rax)
ffff80000010c38c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c392:	10 00                	adc    %al,(%rax)
ffff80000010c394:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c39a:	10 00                	adc    %al,(%rax)
ffff80000010c39c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3a2:	10 00                	adc    %al,(%rax)
ffff80000010c3a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3aa:	10 00                	adc    %al,(%rax)
ffff80000010c3ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3b2:	10 00                	adc    %al,(%rax)
ffff80000010c3b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3ba:	10 00                	adc    %al,(%rax)
ffff80000010c3bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3c2:	10 00                	adc    %al,(%rax)
ffff80000010c3c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3ca:	10 00                	adc    %al,(%rax)
ffff80000010c3cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3d2:	10 00                	adc    %al,(%rax)
ffff80000010c3d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3da:	10 00                	adc    %al,(%rax)
ffff80000010c3dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3e2:	10 00                	adc    %al,(%rax)
ffff80000010c3e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3ea:	10 00                	adc    %al,(%rax)
ffff80000010c3ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3f2:	10 00                	adc    %al,(%rax)
ffff80000010c3f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c3fa:	10 00                	adc    %al,(%rax)
ffff80000010c3fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c402:	10 00                	adc    %al,(%rax)
ffff80000010c404:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c40a:	10 00                	adc    %al,(%rax)
ffff80000010c40c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c412:	10 00                	adc    %al,(%rax)
ffff80000010c414:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c41a:	10 00                	adc    %al,(%rax)
ffff80000010c41c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c422:	10 00                	adc    %al,(%rax)
ffff80000010c424:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c42a:	10 00                	adc    %al,(%rax)
ffff80000010c42c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c432:	10 00                	adc    %al,(%rax)
ffff80000010c434:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c43a:	10 00                	adc    %al,(%rax)
ffff80000010c43c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c442:	10 00                	adc    %al,(%rax)
ffff80000010c444:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c44a:	10 00                	adc    %al,(%rax)
ffff80000010c44c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c452:	10 00                	adc    %al,(%rax)
ffff80000010c454:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c45a:	10 00                	adc    %al,(%rax)
ffff80000010c45c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c462:	10 00                	adc    %al,(%rax)
ffff80000010c464:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c46a:	10 00                	adc    %al,(%rax)
ffff80000010c46c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c472:	10 00                	adc    %al,(%rax)
ffff80000010c474:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c47a:	10 00                	adc    %al,(%rax)
ffff80000010c47c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c482:	10 00                	adc    %al,(%rax)
ffff80000010c484:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c48a:	10 00                	adc    %al,(%rax)
ffff80000010c48c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c492:	10 00                	adc    %al,(%rax)
ffff80000010c494:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010c49a:	10 00                	adc    %al,(%rax)
ffff80000010c49c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010c6ae:	00 00                	add    %al,(%rax)
ffff80000010c6b0:	00 10                	add    %dl,(%rax)
ffff80000010c6b2:	10 10                	adc    %dl,(%rax)
ffff80000010c6b4:	10 10                	adc    %dl,(%rax)
ffff80000010c6b6:	10 10                	adc    %dl,(%rax)
ffff80000010c6b8:	10 10                	adc    %dl,(%rax)
ffff80000010c6ba:	00 00                	add    %al,(%rax)
ffff80000010c6bc:	10 10                	adc    %dl,(%rax)
ffff80000010c6be:	00 00                	add    %al,(%rax)
ffff80000010c6c0:	28 28                	sub    %ch,(%rax)
ffff80000010c6c2:	28 00                	sub    %al,(%rax)
	...
ffff80000010c6d0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010c6d4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010c6d8:	44                   	rex.R
ffff80000010c6d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c6de:	00 00                	add    %al,(%rax)
ffff80000010c6e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010c6e2:	56                   	push   %rsi
ffff80000010c6e3:	92                   	xchg   %eax,%edx
ffff80000010c6e4:	92                   	xchg   %eax,%edx
ffff80000010c6e5:	90                   	nop
ffff80000010c6e6:	50                   	push   %rax
ffff80000010c6e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010c6ea:	92                   	xchg   %eax,%edx
ffff80000010c6eb:	92                   	xchg   %eax,%edx
ffff80000010c6ec:	d4                   	(bad)  
ffff80000010c6ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010c6f2:	94                   	xchg   %eax,%esp
ffff80000010c6f3:	94                   	xchg   %eax,%esp
ffff80000010c6f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010c6f9:	2c 52                	sub    $0x52,%al
ffff80000010c6fb:	52                   	push   %rdx
ffff80000010c6fc:	92                   	xchg   %eax,%edx
ffff80000010c6fd:	8c 00                	mov    %es,(%rax)
ffff80000010c6ff:	00 00                	add    %al,(%rax)
ffff80000010c701:	70 88                	jo     ffff80000010c68b <system_call_table+0x5eb>
ffff80000010c703:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010c709:	92                   	xchg   %eax,%edx
ffff80000010c70a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010c711:	08 10                	or     %dl,(%rax)
	...
ffff80000010c71f:	00 02                	add    %al,(%rdx)
ffff80000010c721:	04 08                	add    $0x8,%al
ffff80000010c723:	08 10                	or     %dl,(%rax)
ffff80000010c725:	10 10                	adc    %dl,(%rax)
ffff80000010c727:	10 10                	adc    %dl,(%rax)
ffff80000010c729:	10 10                	adc    %dl,(%rax)
ffff80000010c72b:	08 08                	or     %cl,(%rax)
ffff80000010c72d:	04 02                	add    $0x2,%al
ffff80000010c72f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010c735:	10 10                	adc    %dl,(%rax)
ffff80000010c737:	10 10                	adc    %dl,(%rax)
ffff80000010c739:	10 10                	adc    %dl,(%rax)
ffff80000010c73b:	20 20                	and    %ah,(%rax)
ffff80000010c73d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c741:	00 00                	add    %al,(%rax)
ffff80000010c743:	00 00                	add    %al,(%rax)
ffff80000010c745:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010c74b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c755:	10 10                	adc    %dl,(%rax)
ffff80000010c757:	10 fe                	adc    %bh,%dh
ffff80000010c759:	10 10                	adc    %dl,(%rax)
ffff80000010c75b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c769:	00 00                	add    %al,(%rax)
ffff80000010c76b:	18 18                	sbb    %bl,(%rax)
ffff80000010c76d:	08 08                	or     %cl,(%rax)
ffff80000010c76f:	10 00                	adc    %al,(%rax)
ffff80000010c771:	00 00                	add    %al,(%rax)
ffff80000010c773:	00 00                	add    %al,(%rax)
ffff80000010c775:	00 00                	add    %al,(%rax)
ffff80000010c777:	00 fe                	add    %bh,%dh
	...
ffff80000010c789:	00 00                	add    %al,(%rax)
ffff80000010c78b:	00 18                	add    %bl,(%rax)
ffff80000010c78d:	18 00                	sbb    %al,(%rax)
ffff80000010c78f:	00 02                	add    %al,(%rdx)
ffff80000010c791:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010c794:	08 08                	or     %cl,(%rax)
ffff80000010c796:	08 10                	or     %dl,(%rax)
ffff80000010c798:	10 20                	adc    %ah,(%rax)
ffff80000010c79a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c79d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010c7a4:	42 
ffff80000010c7a5:	42                   	rex.X
ffff80000010c7a6:	42                   	rex.X
ffff80000010c7a7:	42                   	rex.X
ffff80000010c7a8:	42                   	rex.X
ffff80000010c7a9:	42                   	rex.X
ffff80000010c7aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010c7ad:	18 00                	sbb    %al,(%rax)
ffff80000010c7af:	00 00                	add    %al,(%rax)
ffff80000010c7b1:	08 18                	or     %bl,(%rax)
ffff80000010c7b3:	28 08                	sub    %cl,(%rax)
ffff80000010c7b5:	08 08                	or     %cl,(%rax)
ffff80000010c7b7:	08 08                	or     %cl,(%rax)
ffff80000010c7b9:	08 08                	or     %cl,(%rax)
ffff80000010c7bb:	08 08                	or     %cl,(%rax)
ffff80000010c7bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010c7c0:	00 18                	add    %bl,(%rax)
ffff80000010c7c2:	24 42                	and    $0x42,%al
ffff80000010c7c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010c7c8:	10 20                	adc    %ah,(%rax)
ffff80000010c7ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c7cd:	7e 00                	jle    ffff80000010c7cf <system_call_table+0x72f>
ffff80000010c7cf:	00 00                	add    %al,(%rax)
ffff80000010c7d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010c7d4:	02 02                	add    (%rdx),%al
ffff80000010c7d6:	04 18                	add    $0x18,%al
ffff80000010c7d8:	04 02                	add    $0x2,%al
ffff80000010c7da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010c7dd:	18 00                	sbb    %al,(%rax)
ffff80000010c7df:	00 00                	add    %al,(%rax)
ffff80000010c7e1:	0c 0c                	or     $0xc,%al
ffff80000010c7e3:	0c 14                	or     $0x14,%al
ffff80000010c7e5:	14 14                	adc    $0x14,%al
ffff80000010c7e7:	24 24                	and    $0x24,%al
ffff80000010c7e9:	44 7e 04             	rex.R jle ffff80000010c7f0 <system_call_table+0x750>
ffff80000010c7ec:	04 1e                	add    $0x1e,%al
ffff80000010c7ee:	00 00                	add    %al,(%rax)
ffff80000010c7f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010c7f4:	40 58                	rex pop %rax
ffff80000010c7f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010c7f9:	02 02                	add    (%rdx),%al
ffff80000010c7fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c7fe:	00 00                	add    %al,(%rax)
ffff80000010c800:	00 18                	add    %bl,(%rax)
ffff80000010c802:	24 42                	and    $0x42,%al
ffff80000010c804:	40 58                	rex pop %rax
ffff80000010c806:	64 42                	fs rex.X
ffff80000010c808:	42                   	rex.X
ffff80000010c809:	42                   	rex.X
ffff80000010c80a:	42                   	rex.X
ffff80000010c80b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c80e:	00 00                	add    %al,(%rax)
ffff80000010c810:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010c813:	42 04 04             	rex.X add $0x4,%al
ffff80000010c816:	08 08                	or     %cl,(%rax)
ffff80000010c818:	08 10                	or     %dl,(%rax)
ffff80000010c81a:	10 10                	adc    %dl,(%rax)
ffff80000010c81c:	10 38                	adc    %bh,(%rax)
ffff80000010c81e:	00 00                	add    %al,(%rax)
ffff80000010c820:	00 18                	add    %bl,(%rax)
ffff80000010c822:	24 42                	and    $0x42,%al
ffff80000010c824:	42                   	rex.X
ffff80000010c825:	42 24 18             	rex.X and $0x18,%al
ffff80000010c828:	24 42                	and    $0x42,%al
ffff80000010c82a:	42                   	rex.X
ffff80000010c82b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c82e:	00 00                	add    %al,(%rax)
ffff80000010c830:	00 18                	add    %bl,(%rax)
ffff80000010c832:	24 42                	and    $0x42,%al
ffff80000010c834:	42                   	rex.X
ffff80000010c835:	42                   	rex.X
ffff80000010c836:	42                   	rex.X
ffff80000010c837:	42                   	rex.X
ffff80000010c838:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010c83b:	42 24 18             	rex.X and $0x18,%al
ffff80000010c83e:	00 00                	add    %al,(%rax)
ffff80000010c840:	00 00                	add    %al,(%rax)
ffff80000010c842:	00 00                	add    %al,(%rax)
ffff80000010c844:	00 18                	add    %bl,(%rax)
ffff80000010c846:	18 00                	sbb    %al,(%rax)
ffff80000010c848:	00 00                	add    %al,(%rax)
ffff80000010c84a:	00 00                	add    %al,(%rax)
ffff80000010c84c:	18 18                	sbb    %bl,(%rax)
ffff80000010c84e:	00 00                	add    %al,(%rax)
ffff80000010c850:	00 00                	add    %al,(%rax)
ffff80000010c852:	00 00                	add    %al,(%rax)
ffff80000010c854:	00 18                	add    %bl,(%rax)
ffff80000010c856:	18 00                	sbb    %al,(%rax)
ffff80000010c858:	00 00                	add    %al,(%rax)
ffff80000010c85a:	00 18                	add    %bl,(%rax)
ffff80000010c85c:	18 08                	sbb    %cl,(%rax)
ffff80000010c85e:	08 10                	or     %dl,(%rax)
ffff80000010c860:	00 02                	add    %al,(%rdx)
ffff80000010c862:	04 08                	add    $0x8,%al
ffff80000010c864:	10 20                	adc    %ah,(%rax)
ffff80000010c866:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010c86d:	04 
ffff80000010c86e:	02 00                	add    (%rax),%al
ffff80000010c870:	00 00                	add    %al,(%rax)
ffff80000010c872:	00 00                	add    %al,(%rax)
ffff80000010c874:	00 00                	add    %al,(%rax)
ffff80000010c876:	fe 00                	incb   (%rax)
ffff80000010c878:	00 fe                	add    %bh,%dh
ffff80000010c87a:	00 00                	add    %al,(%rax)
ffff80000010c87c:	00 00                	add    %al,(%rax)
ffff80000010c87e:	00 00                	add    %al,(%rax)
ffff80000010c880:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010c886:	04 02                	add    $0x2,%al
ffff80000010c888:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010c88b:	10 20                	adc    %ah,(%rax)
ffff80000010c88d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c891:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c895:	82                   	(bad)  
ffff80000010c896:	04 08                	add    $0x8,%al
ffff80000010c898:	10 10                	adc    %dl,(%rax)
ffff80000010c89a:	00 00                	add    %al,(%rax)
ffff80000010c89c:	18 18                	sbb    %bl,(%rax)
ffff80000010c89e:	00 00                	add    %al,(%rax)
ffff80000010c8a0:	00 38                	add    %bh,(%rax)
ffff80000010c8a2:	44 82                	rex.R (bad) 
ffff80000010c8a4:	9a                   	(bad)  
ffff80000010c8a5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c8a6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c8a7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c8a8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c8a9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010c8aa:	9c                   	pushfq 
ffff80000010c8ab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010c8af:	00 00                	add    %al,(%rax)
ffff80000010c8b1:	18 18                	sbb    %bl,(%rax)
ffff80000010c8b3:	18 18                	sbb    %bl,(%rax)
ffff80000010c8b5:	24 24                	and    $0x24,%al
ffff80000010c8b7:	24 24                	and    $0x24,%al
ffff80000010c8b9:	7e 42                	jle    ffff80000010c8fd <system_call_table+0x85d>
ffff80000010c8bb:	42                   	rex.X
ffff80000010c8bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c8bf:	00 00                	add    %al,(%rax)
ffff80000010c8c1:	f0 48                	lock rex.W
ffff80000010c8c3:	44                   	rex.R
ffff80000010c8c4:	44                   	rex.R
ffff80000010c8c5:	44                   	rex.R
ffff80000010c8c6:	48 78 44             	rex.W js ffff80000010c90d <system_call_table+0x86d>
ffff80000010c8c9:	42                   	rex.X
ffff80000010c8ca:	42                   	rex.X
ffff80000010c8cb:	42                   	rex.X
ffff80000010c8cc:	44 f8                	rex.R clc 
ffff80000010c8ce:	00 00                	add    %al,(%rax)
ffff80000010c8d0:	00 3a                	add    %bh,(%rdx)
ffff80000010c8d2:	46                   	rex.RX
ffff80000010c8d3:	42 82                	rex.X (bad) 
ffff80000010c8d5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010c8dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c8df:	00 00                	add    %al,(%rax)
ffff80000010c8e1:	f8                   	clc    
ffff80000010c8e2:	44                   	rex.R
ffff80000010c8e3:	44                   	rex.R
ffff80000010c8e4:	42                   	rex.X
ffff80000010c8e5:	42                   	rex.X
ffff80000010c8e6:	42                   	rex.X
ffff80000010c8e7:	42                   	rex.X
ffff80000010c8e8:	42                   	rex.X
ffff80000010c8e9:	42                   	rex.X
ffff80000010c8ea:	42                   	rex.X
ffff80000010c8eb:	44                   	rex.R
ffff80000010c8ec:	44 f8                	rex.R clc 
ffff80000010c8ee:	00 00                	add    %al,(%rax)
ffff80000010c8f0:	00 fe                	add    %bh,%dh
ffff80000010c8f2:	42                   	rex.X
ffff80000010c8f3:	42                   	rex.X
ffff80000010c8f4:	40                   	rex
ffff80000010c8f5:	40                   	rex
ffff80000010c8f6:	44 7c 44             	rex.R jl ffff80000010c93d <system_call_table+0x89d>
ffff80000010c8f9:	40                   	rex
ffff80000010c8fa:	40                   	rex
ffff80000010c8fb:	42                   	rex.X
ffff80000010c8fc:	42 fe 00             	rex.X incb (%rax)
ffff80000010c8ff:	00 00                	add    %al,(%rax)
ffff80000010c901:	fe 42 42             	incb   0x42(%rdx)
ffff80000010c904:	40                   	rex
ffff80000010c905:	40                   	rex
ffff80000010c906:	44 7c 44             	rex.R jl ffff80000010c94d <system_call_table+0x8ad>
ffff80000010c909:	44                   	rex.R
ffff80000010c90a:	40                   	rex
ffff80000010c90b:	40                   	rex
ffff80000010c90c:	40                   	rex
ffff80000010c90d:	f0 00 00             	lock add %al,(%rax)
ffff80000010c910:	00 3a                	add    %bh,(%rdx)
ffff80000010c912:	46                   	rex.RX
ffff80000010c913:	42 82                	rex.X (bad) 
ffff80000010c915:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010c91c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010c91f:	00 00                	add    %al,(%rax)
ffff80000010c921:	e7 42                	out    %eax,$0x42
ffff80000010c923:	42                   	rex.X
ffff80000010c924:	42                   	rex.X
ffff80000010c925:	42                   	rex.X
ffff80000010c926:	42 7e 42             	rex.X jle ffff80000010c96b <system_call_table+0x8cb>
ffff80000010c929:	42                   	rex.X
ffff80000010c92a:	42                   	rex.X
ffff80000010c92b:	42                   	rex.X
ffff80000010c92c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c92f:	00 00                	add    %al,(%rax)
ffff80000010c931:	7c 10                	jl     ffff80000010c943 <system_call_table+0x8a3>
ffff80000010c933:	10 10                	adc    %dl,(%rax)
ffff80000010c935:	10 10                	adc    %dl,(%rax)
ffff80000010c937:	10 10                	adc    %dl,(%rax)
ffff80000010c939:	10 10                	adc    %dl,(%rax)
ffff80000010c93b:	10 10                	adc    %dl,(%rax)
ffff80000010c93d:	7c 00                	jl     ffff80000010c93f <system_call_table+0x89f>
ffff80000010c93f:	00 00                	add    %al,(%rax)
ffff80000010c941:	1f                   	(bad)  
ffff80000010c942:	04 04                	add    $0x4,%al
ffff80000010c944:	04 04                	add    $0x4,%al
ffff80000010c946:	04 04                	add    $0x4,%al
ffff80000010c948:	04 04                	add    $0x4,%al
ffff80000010c94a:	04 04                	add    $0x4,%al
ffff80000010c94c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010c94f:	00 00                	add    %al,(%rax)
ffff80000010c951:	e7 42                	out    %eax,$0x42
ffff80000010c953:	44                   	rex.R
ffff80000010c954:	48 50                	rex.W push %rax
ffff80000010c956:	50                   	push   %rax
ffff80000010c957:	60                   	(bad)  
ffff80000010c958:	50                   	push   %rax
ffff80000010c959:	50                   	push   %rax
ffff80000010c95a:	48                   	rex.W
ffff80000010c95b:	44                   	rex.R
ffff80000010c95c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c95f:	00 00                	add    %al,(%rax)
ffff80000010c961:	f0 40                	lock rex
ffff80000010c963:	40                   	rex
ffff80000010c964:	40                   	rex
ffff80000010c965:	40                   	rex
ffff80000010c966:	40                   	rex
ffff80000010c967:	40                   	rex
ffff80000010c968:	40                   	rex
ffff80000010c969:	40                   	rex
ffff80000010c96a:	40                   	rex
ffff80000010c96b:	42                   	rex.X
ffff80000010c96c:	42 fe 00             	rex.X incb (%rax)
ffff80000010c96f:	00 00                	add    %al,(%rax)
ffff80000010c971:	c3                   	retq   
ffff80000010c972:	42                   	rex.X
ffff80000010c973:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010c977:	5a                   	pop    %rdx
ffff80000010c978:	5a                   	pop    %rdx
ffff80000010c979:	42                   	rex.X
ffff80000010c97a:	42                   	rex.X
ffff80000010c97b:	42                   	rex.X
ffff80000010c97c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c97f:	00 00                	add    %al,(%rax)
ffff80000010c981:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010c988:	4a                   	rex.WX
ffff80000010c989:	4a                   	rex.WX
ffff80000010c98a:	4a                   	rex.WX
ffff80000010c98b:	46                   	rex.RX
ffff80000010c98c:	46 e2 00             	rex.RX loop ffff80000010c98f <system_call_table+0x8ef>
ffff80000010c98f:	00 00                	add    %al,(%rax)
ffff80000010c991:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010c995:	82                   	(bad)  
ffff80000010c996:	82                   	(bad)  
ffff80000010c997:	82                   	(bad)  
ffff80000010c998:	82                   	(bad)  
ffff80000010c999:	82                   	(bad)  
ffff80000010c99a:	82                   	(bad)  
ffff80000010c99b:	82                   	(bad)  
ffff80000010c99c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010c99f:	00 00                	add    %al,(%rax)
ffff80000010c9a1:	f8                   	clc    
ffff80000010c9a2:	44                   	rex.R
ffff80000010c9a3:	42                   	rex.X
ffff80000010c9a4:	42                   	rex.X
ffff80000010c9a5:	42                   	rex.X
ffff80000010c9a6:	44 78 40             	rex.R js ffff80000010c9e9 <system_call_table+0x949>
ffff80000010c9a9:	40                   	rex
ffff80000010c9aa:	40                   	rex
ffff80000010c9ab:	40                   	rex
ffff80000010c9ac:	40                   	rex
ffff80000010c9ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010c9b0:	00 38                	add    %bh,(%rax)
ffff80000010c9b2:	44 82                	rex.R (bad) 
ffff80000010c9b4:	82                   	(bad)  
ffff80000010c9b5:	82                   	(bad)  
ffff80000010c9b6:	82                   	(bad)  
ffff80000010c9b7:	82                   	(bad)  
ffff80000010c9b8:	82                   	(bad)  
ffff80000010c9b9:	82                   	(bad)  
ffff80000010c9ba:	92                   	xchg   %eax,%edx
ffff80000010c9bb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010c9bf:	00 00                	add    %al,(%rax)
ffff80000010c9c1:	fc                   	cld    
ffff80000010c9c2:	42                   	rex.X
ffff80000010c9c3:	42                   	rex.X
ffff80000010c9c4:	42                   	rex.X
ffff80000010c9c5:	42 7c 44             	rex.X jl ffff80000010ca0c <system_call_table+0x96c>
ffff80000010c9c8:	42                   	rex.X
ffff80000010c9c9:	42                   	rex.X
ffff80000010c9ca:	42                   	rex.X
ffff80000010c9cb:	42                   	rex.X
ffff80000010c9cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010c9cf:	00 00                	add    %al,(%rax)
ffff80000010c9d1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010c9d4:	82                   	(bad)  
ffff80000010c9d5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010c9d9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010c9df:	00 00                	add    %al,(%rax)
ffff80000010c9e1:	fe                   	(bad)  
ffff80000010c9e2:	92                   	xchg   %eax,%edx
ffff80000010c9e3:	92                   	xchg   %eax,%edx
ffff80000010c9e4:	10 10                	adc    %dl,(%rax)
ffff80000010c9e6:	10 10                	adc    %dl,(%rax)
ffff80000010c9e8:	10 10                	adc    %dl,(%rax)
ffff80000010c9ea:	10 10                	adc    %dl,(%rax)
ffff80000010c9ec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010c9f0:	00 e7                	add    %ah,%bh
ffff80000010c9f2:	42                   	rex.X
ffff80000010c9f3:	42                   	rex.X
ffff80000010c9f4:	42                   	rex.X
ffff80000010c9f5:	42                   	rex.X
ffff80000010c9f6:	42                   	rex.X
ffff80000010c9f7:	42                   	rex.X
ffff80000010c9f8:	42                   	rex.X
ffff80000010c9f9:	42                   	rex.X
ffff80000010c9fa:	42                   	rex.X
ffff80000010c9fb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010c9fe:	00 00                	add    %al,(%rax)
ffff80000010ca00:	00 e7                	add    %ah,%bh
ffff80000010ca02:	42                   	rex.X
ffff80000010ca03:	42                   	rex.X
ffff80000010ca04:	42                   	rex.X
ffff80000010ca05:	42 24 24             	rex.X and $0x24,%al
ffff80000010ca08:	24 24                	and    $0x24,%al
ffff80000010ca0a:	18 18                	sbb    %bl,(%rax)
ffff80000010ca0c:	18 18                	sbb    %bl,(%rax)
ffff80000010ca0e:	00 00                	add    %al,(%rax)
ffff80000010ca10:	00 e7                	add    %ah,%bh
ffff80000010ca12:	42                   	rex.X
ffff80000010ca13:	42                   	rex.X
ffff80000010ca14:	42 5a                	rex.X pop %rdx
ffff80000010ca16:	5a                   	pop    %rdx
ffff80000010ca17:	5a                   	pop    %rdx
ffff80000010ca18:	5a                   	pop    %rdx
ffff80000010ca19:	24 24                	and    $0x24,%al
ffff80000010ca1b:	24 24                	and    $0x24,%al
ffff80000010ca1d:	24 00                	and    $0x0,%al
ffff80000010ca1f:	00 00                	add    %al,(%rax)
ffff80000010ca21:	e7 42                	out    %eax,$0x42
ffff80000010ca23:	42 24 24             	rex.X and $0x24,%al
ffff80000010ca26:	24 18                	and    $0x18,%al
ffff80000010ca28:	24 24                	and    $0x24,%al
ffff80000010ca2a:	24 42                	and    $0x42,%al
ffff80000010ca2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ca2f:	00 00                	add    %al,(%rax)
ffff80000010ca31:	ee                   	out    %al,(%dx)
ffff80000010ca32:	44                   	rex.R
ffff80000010ca33:	44                   	rex.R
ffff80000010ca34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010ca37:	28 10                	sub    %dl,(%rax)
ffff80000010ca39:	10 10                	adc    %dl,(%rax)
ffff80000010ca3b:	10 10                	adc    %dl,(%rax)
ffff80000010ca3d:	7c 00                	jl     ffff80000010ca3f <system_call_table+0x99f>
ffff80000010ca3f:	00 00                	add    %al,(%rax)
ffff80000010ca41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010ca48:	20 20                	and    %ah,(%rax)
ffff80000010ca4a:	40                   	rex
ffff80000010ca4b:	42 82                	rex.X (bad) 
ffff80000010ca4d:	fe 00                	incb   (%rax)
ffff80000010ca4f:	00 00                	add    %al,(%rax)
ffff80000010ca51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010ca54:	20 20                	and    %ah,(%rax)
ffff80000010ca56:	20 20                	and    %ah,(%rax)
ffff80000010ca58:	20 20                	and    %ah,(%rax)
ffff80000010ca5a:	20 20                	and    %ah,(%rax)
ffff80000010ca5c:	20 20                	and    %ah,(%rax)
ffff80000010ca5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010ca65:	20 20                	and    %ah,(%rax)
ffff80000010ca67:	10 10                	adc    %dl,(%rax)
ffff80000010ca69:	08 08                	or     %cl,(%rax)
ffff80000010ca6b:	04 04                	add    $0x4,%al
ffff80000010ca6d:	04 02                	add    $0x2,%al
ffff80000010ca6f:	02 00                	add    (%rax),%al
ffff80000010ca71:	7c 04                	jl     ffff80000010ca77 <system_call_table+0x9d7>
ffff80000010ca73:	04 04                	add    $0x4,%al
ffff80000010ca75:	04 04                	add    $0x4,%al
ffff80000010ca77:	04 04                	add    $0x4,%al
ffff80000010ca79:	04 04                	add    $0x4,%al
ffff80000010ca7b:	04 04                	add    $0x4,%al
ffff80000010ca7d:	04 7c                	add    $0x7c,%al
ffff80000010ca7f:	00 00                	add    %al,(%rax)
ffff80000010ca81:	10 28                	adc    %ch,(%rax)
ffff80000010ca83:	44 82                	rex.R (bad) 
	...
ffff80000010ca9d:	00 fe                	add    %bh,%dh
ffff80000010ca9f:	00 10                	add    %dl,(%rax)
ffff80000010caa1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010cab4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010cab7:	04 3c                	add    $0x3c,%al
ffff80000010cab9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010cac0:	c0 
ffff80000010cac1:	40                   	rex
ffff80000010cac2:	40                   	rex
ffff80000010cac3:	40                   	rex
ffff80000010cac4:	40 58                	rex pop %rax
ffff80000010cac6:	64 42                	fs rex.X
ffff80000010cac8:	42                   	rex.X
ffff80000010cac9:	42                   	rex.X
ffff80000010caca:	42                   	rex.X
ffff80000010cacb:	42                   	rex.X
ffff80000010cacc:	64 58                	fs pop %rax
ffff80000010cace:	00 00                	add    %al,(%rax)
ffff80000010cad0:	00 00                	add    %al,(%rax)
ffff80000010cad2:	00 00                	add    %al,(%rax)
ffff80000010cad4:	00 30                	add    %dh,(%rax)
ffff80000010cad6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010cadd:	38 
ffff80000010cade:	00 00                	add    %al,(%rax)
ffff80000010cae0:	0c 04                	or     $0x4,%al
ffff80000010cae2:	04 04                	add    $0x4,%al
ffff80000010cae4:	04 34                	add    $0x34,%al
ffff80000010cae6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010caed:	36 
ffff80000010caee:	00 00                	add    %al,(%rax)
ffff80000010caf0:	00 00                	add    %al,(%rax)
ffff80000010caf2:	00 00                	add    %al,(%rax)
ffff80000010caf4:	00 38                	add    %bh,(%rax)
ffff80000010caf6:	44 82                	rex.R (bad) 
ffff80000010caf8:	82                   	(bad)  
ffff80000010caf9:	fc                   	cld    
ffff80000010cafa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010cb01:	10 10                	adc    %dl,(%rax)
ffff80000010cb03:	10 10                	adc    %dl,(%rax)
ffff80000010cb05:	7c 10                	jl     ffff80000010cb17 <system_call_table+0xa77>
ffff80000010cb07:	10 10                	adc    %dl,(%rax)
ffff80000010cb09:	10 10                	adc    %dl,(%rax)
ffff80000010cb0b:	10 10                	adc    %dl,(%rax)
ffff80000010cb0d:	7c 00                	jl     ffff80000010cb0f <system_call_table+0xa6f>
ffff80000010cb0f:	00 00                	add    %al,(%rax)
ffff80000010cb11:	00 00                	add    %al,(%rax)
ffff80000010cb13:	00 00                	add    %al,(%rax)
ffff80000010cb15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010cb1c:	34 04 
ffff80000010cb1e:	04 38                	add    $0x38,%al
ffff80000010cb20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010cb24:	40 58                	rex pop %rax
ffff80000010cb26:	64 42                	fs rex.X
ffff80000010cb28:	42                   	rex.X
ffff80000010cb29:	42                   	rex.X
ffff80000010cb2a:	42                   	rex.X
ffff80000010cb2b:	42                   	rex.X
ffff80000010cb2c:	42 e3 00             	rex.X jrcxz ffff80000010cb2f <system_call_table+0xa8f>
ffff80000010cb2f:	00 00                	add    %al,(%rax)
ffff80000010cb31:	10 10                	adc    %dl,(%rax)
ffff80000010cb33:	00 00                	add    %al,(%rax)
ffff80000010cb35:	30 10                	xor    %dl,(%rax)
ffff80000010cb37:	10 10                	adc    %dl,(%rax)
ffff80000010cb39:	10 10                	adc    %dl,(%rax)
ffff80000010cb3b:	10 10                	adc    %dl,(%rax)
ffff80000010cb3d:	38 00                	cmp    %al,(%rax)
ffff80000010cb3f:	00 00                	add    %al,(%rax)
ffff80000010cb41:	04 04                	add    $0x4,%al
ffff80000010cb43:	00 00                	add    %al,(%rax)
ffff80000010cb45:	0c 04                	or     $0x4,%al
ffff80000010cb47:	04 04                	add    $0x4,%al
ffff80000010cb49:	04 04                	add    $0x4,%al
ffff80000010cb4b:	04 04                	add    $0x4,%al
ffff80000010cb4d:	08 08                	or     %cl,(%rax)
ffff80000010cb4f:	30 c0                	xor    %al,%al
ffff80000010cb51:	40                   	rex
ffff80000010cb52:	40                   	rex
ffff80000010cb53:	40                   	rex
ffff80000010cb54:	40                   	rex
ffff80000010cb55:	4e                   	rex.WRX
ffff80000010cb56:	44                   	rex.R
ffff80000010cb57:	48 50                	rex.W push %rax
ffff80000010cb59:	60                   	(bad)  
ffff80000010cb5a:	50                   	push   %rax
ffff80000010cb5b:	48                   	rex.W
ffff80000010cb5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010cb5f:	00 30                	add    %dh,(%rax)
ffff80000010cb61:	10 10                	adc    %dl,(%rax)
ffff80000010cb63:	10 10                	adc    %dl,(%rax)
ffff80000010cb65:	10 10                	adc    %dl,(%rax)
ffff80000010cb67:	10 10                	adc    %dl,(%rax)
ffff80000010cb69:	10 10                	adc    %dl,(%rax)
ffff80000010cb6b:	10 10                	adc    %dl,(%rax)
ffff80000010cb6d:	38 00                	cmp    %al,(%rax)
ffff80000010cb6f:	00 00                	add    %al,(%rax)
ffff80000010cb71:	00 00                	add    %al,(%rax)
ffff80000010cb73:	00 00                	add    %al,(%rax)
ffff80000010cb75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010cb79:	49                   	rex.WB
ffff80000010cb7a:	49                   	rex.WB
ffff80000010cb7b:	49                   	rex.WB
ffff80000010cb7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010cb7f:	00 00                	add    %al,(%rax)
ffff80000010cb81:	00 00                	add    %al,(%rax)
ffff80000010cb83:	00 00                	add    %al,(%rax)
ffff80000010cb85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010cb89:	42                   	rex.X
ffff80000010cb8a:	42                   	rex.X
ffff80000010cb8b:	42                   	rex.X
ffff80000010cb8c:	42 e3 00             	rex.X jrcxz ffff80000010cb8f <system_call_table+0xaef>
ffff80000010cb8f:	00 00                	add    %al,(%rax)
ffff80000010cb91:	00 00                	add    %al,(%rax)
ffff80000010cb93:	00 00                	add    %al,(%rax)
ffff80000010cb95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010cb99:	82                   	(bad)  
ffff80000010cb9a:	82                   	(bad)  
ffff80000010cb9b:	82                   	(bad)  
ffff80000010cb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010cb9f:	00 00                	add    %al,(%rax)
ffff80000010cba1:	00 00                	add    %al,(%rax)
ffff80000010cba3:	00 d8                	add    %bl,%al
ffff80000010cba5:	64 42                	fs rex.X
ffff80000010cba7:	42                   	rex.X
ffff80000010cba8:	42                   	rex.X
ffff80000010cba9:	42                   	rex.X
ffff80000010cbaa:	42                   	rex.X
ffff80000010cbab:	64 58                	fs pop %rax
ffff80000010cbad:	40                   	rex
ffff80000010cbae:	40 e0 00             	rex loopne ffff80000010cbb1 <system_call_table+0xb11>
ffff80000010cbb1:	00 00                	add    %al,(%rax)
ffff80000010cbb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010cbb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010cbbd:	04 04                	add    $0x4,%al
ffff80000010cbbf:	0e                   	(bad)  
ffff80000010cbc0:	00 00                	add    %al,(%rax)
ffff80000010cbc2:	00 00                	add    %al,(%rax)
ffff80000010cbc4:	00 dc                	add    %bl,%ah
ffff80000010cbc6:	62 42                	(bad)  
ffff80000010cbc8:	40                   	rex
ffff80000010cbc9:	40                   	rex
ffff80000010cbca:	40                   	rex
ffff80000010cbcb:	40                   	rex
ffff80000010cbcc:	40 e0 00             	rex loopne ffff80000010cbcf <system_call_table+0xb2f>
ffff80000010cbcf:	00 00                	add    %al,(%rax)
ffff80000010cbd1:	00 00                	add    %al,(%rax)
ffff80000010cbd3:	00 00                	add    %al,(%rax)
ffff80000010cbd5:	7a 86                	jp     ffff80000010cb5d <system_call_table+0xabd>
ffff80000010cbd7:	82                   	(bad)  
ffff80000010cbd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010cbdb:	82                   	(bad)  
ffff80000010cbdc:	c2 bc 00             	retq   $0xbc
ffff80000010cbdf:	00 00                	add    %al,(%rax)
ffff80000010cbe1:	00 10                	add    %dl,(%rax)
ffff80000010cbe3:	10 10                	adc    %dl,(%rax)
ffff80000010cbe5:	7c 10                	jl     ffff80000010cbf7 <system_call_table+0xb57>
ffff80000010cbe7:	10 10                	adc    %dl,(%rax)
ffff80000010cbe9:	10 10                	adc    %dl,(%rax)
ffff80000010cbeb:	10 10                	adc    %dl,(%rax)
ffff80000010cbed:	0e                   	(bad)  
ffff80000010cbee:	00 00                	add    %al,(%rax)
ffff80000010cbf0:	00 00                	add    %al,(%rax)
ffff80000010cbf2:	00 00                	add    %al,(%rax)
ffff80000010cbf4:	00 c6                	add    %al,%dh
ffff80000010cbf6:	42                   	rex.X
ffff80000010cbf7:	42                   	rex.X
ffff80000010cbf8:	42                   	rex.X
ffff80000010cbf9:	42                   	rex.X
ffff80000010cbfa:	42                   	rex.X
ffff80000010cbfb:	42                   	rex.X
ffff80000010cbfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010cbff:	00 00                	add    %al,(%rax)
ffff80000010cc01:	00 00                	add    %al,(%rax)
ffff80000010cc03:	00 00                	add    %al,(%rax)
ffff80000010cc05:	e7 42                	out    %eax,$0x42
ffff80000010cc07:	42                   	rex.X
ffff80000010cc08:	42 24 24             	rex.X and $0x24,%al
ffff80000010cc0b:	24 18                	and    $0x18,%al
ffff80000010cc0d:	18 00                	sbb    %al,(%rax)
ffff80000010cc0f:	00 00                	add    %al,(%rax)
ffff80000010cc11:	00 00                	add    %al,(%rax)
ffff80000010cc13:	00 00                	add    %al,(%rax)
ffff80000010cc15:	e7 42                	out    %eax,$0x42
ffff80000010cc17:	42 5a                	rex.X pop %rdx
ffff80000010cc19:	5a                   	pop    %rdx
ffff80000010cc1a:	5a                   	pop    %rdx
ffff80000010cc1b:	24 24                	and    $0x24,%al
ffff80000010cc1d:	24 00                	and    $0x0,%al
ffff80000010cc1f:	00 00                	add    %al,(%rax)
ffff80000010cc21:	00 00                	add    %al,(%rax)
ffff80000010cc23:	00 00                	add    %al,(%rax)
ffff80000010cc25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010cc2a:	28 28                	sub    %ch,(%rax)
ffff80000010cc2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010cc30:	00 00                	add    %al,(%rax)
ffff80000010cc32:	00 00                	add    %al,(%rax)
ffff80000010cc34:	00 e7                	add    %ah,%bh
ffff80000010cc36:	42                   	rex.X
ffff80000010cc37:	42 24 24             	rex.X and $0x24,%al
ffff80000010cc3a:	24 18                	and    $0x18,%al
ffff80000010cc3c:	18 10                	sbb    %dl,(%rax)
ffff80000010cc3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010cc41:	00 00                	add    %al,(%rax)
ffff80000010cc43:	00 00                	add    %al,(%rax)
ffff80000010cc45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010cc4b:	42 82                	rex.X (bad) 
ffff80000010cc4d:	fe 00                	incb   (%rax)
ffff80000010cc4f:	00 00                	add    %al,(%rax)
ffff80000010cc51:	06                   	(bad)  
ffff80000010cc52:	08 10                	or     %dl,(%rax)
ffff80000010cc54:	10 10                	adc    %dl,(%rax)
ffff80000010cc56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010cc59:	10 10                	adc    %dl,(%rax)
ffff80000010cc5b:	10 08                	adc    %cl,(%rax)
ffff80000010cc5d:	06                   	(bad)  
ffff80000010cc5e:	00 00                	add    %al,(%rax)
ffff80000010cc60:	10 10                	adc    %dl,(%rax)
ffff80000010cc62:	10 10                	adc    %dl,(%rax)
ffff80000010cc64:	10 10                	adc    %dl,(%rax)
ffff80000010cc66:	10 10                	adc    %dl,(%rax)
ffff80000010cc68:	10 10                	adc    %dl,(%rax)
ffff80000010cc6a:	10 10                	adc    %dl,(%rax)
ffff80000010cc6c:	10 10                	adc    %dl,(%rax)
ffff80000010cc6e:	10 10                	adc    %dl,(%rax)
ffff80000010cc70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010cc73:	08 08                	or     %cl,(%rax)
ffff80000010cc75:	08 08                	or     %cl,(%rax)
ffff80000010cc77:	06                   	(bad)  
ffff80000010cc78:	08 08                	or     %cl,(%rax)
ffff80000010cc7a:	08 08                	or     %cl,(%rax)
ffff80000010cc7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010cc7f:	00 00                	add    %al,(%rax)
ffff80000010cc81:	72 8c                	jb     ffff80000010cc0f <system_call_table+0xb6f>
	...
ffff80000010d6af:	00 00                	add    %al,(%rax)
ffff80000010d6b1:	10 10                	adc    %dl,(%rax)
ffff80000010d6b3:	10 10                	adc    %dl,(%rax)
ffff80000010d6b5:	10 10                	adc    %dl,(%rax)
ffff80000010d6b7:	10 10                	adc    %dl,(%rax)
ffff80000010d6b9:	10 00                	adc    %al,(%rax)
ffff80000010d6bb:	00 10                	add    %dl,(%rax)
ffff80000010d6bd:	10 00                	adc    %al,(%rax)
ffff80000010d6bf:	00 28                	add    %ch,(%rax)
ffff80000010d6c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010d6cf:	00 00                	add    %al,(%rax)
ffff80000010d6d1:	44                   	rex.R
ffff80000010d6d2:	44                   	rex.R
ffff80000010d6d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d6d8:	44                   	rex.R
ffff80000010d6d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d6de:	00 00                	add    %al,(%rax)
ffff80000010d6e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010d6e2:	56                   	push   %rsi
ffff80000010d6e3:	92                   	xchg   %eax,%edx
ffff80000010d6e4:	92                   	xchg   %eax,%edx
ffff80000010d6e5:	90                   	nop
ffff80000010d6e6:	50                   	push   %rax
ffff80000010d6e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010d6ea:	92                   	xchg   %eax,%edx
ffff80000010d6eb:	92                   	xchg   %eax,%edx
ffff80000010d6ec:	d4                   	(bad)  
ffff80000010d6ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010d6f2:	94                   	xchg   %eax,%esp
ffff80000010d6f3:	94                   	xchg   %eax,%esp
ffff80000010d6f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010d6f9:	2c 52                	sub    $0x52,%al
ffff80000010d6fb:	52                   	push   %rdx
ffff80000010d6fc:	92                   	xchg   %eax,%edx
ffff80000010d6fd:	8c 00                	mov    %es,(%rax)
ffff80000010d6ff:	00 00                	add    %al,(%rax)
ffff80000010d701:	70 88                	jo     ffff80000010d68b <system_call_table+0x15eb>
ffff80000010d703:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010d709:	92                   	xchg   %eax,%edx
ffff80000010d70a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010d711:	08 10                	or     %dl,(%rax)
	...
ffff80000010d71f:	00 02                	add    %al,(%rdx)
ffff80000010d721:	04 08                	add    $0x8,%al
ffff80000010d723:	08 10                	or     %dl,(%rax)
ffff80000010d725:	10 10                	adc    %dl,(%rax)
ffff80000010d727:	10 10                	adc    %dl,(%rax)
ffff80000010d729:	10 10                	adc    %dl,(%rax)
ffff80000010d72b:	08 08                	or     %cl,(%rax)
ffff80000010d72d:	04 02                	add    $0x2,%al
ffff80000010d72f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010d735:	10 10                	adc    %dl,(%rax)
ffff80000010d737:	10 10                	adc    %dl,(%rax)
ffff80000010d739:	10 10                	adc    %dl,(%rax)
ffff80000010d73b:	20 20                	and    %ah,(%rax)
ffff80000010d73d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d741:	00 00                	add    %al,(%rax)
ffff80000010d743:	00 00                	add    %al,(%rax)
ffff80000010d745:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010d74b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d755:	10 10                	adc    %dl,(%rax)
ffff80000010d757:	10 fe                	adc    %bh,%dh
ffff80000010d759:	10 10                	adc    %dl,(%rax)
ffff80000010d75b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d769:	00 00                	add    %al,(%rax)
ffff80000010d76b:	18 18                	sbb    %bl,(%rax)
ffff80000010d76d:	08 08                	or     %cl,(%rax)
ffff80000010d76f:	10 00                	adc    %al,(%rax)
ffff80000010d771:	00 00                	add    %al,(%rax)
ffff80000010d773:	00 00                	add    %al,(%rax)
ffff80000010d775:	00 00                	add    %al,(%rax)
ffff80000010d777:	00 fe                	add    %bh,%dh
	...
ffff80000010d789:	00 00                	add    %al,(%rax)
ffff80000010d78b:	00 18                	add    %bl,(%rax)
ffff80000010d78d:	18 00                	sbb    %al,(%rax)
ffff80000010d78f:	00 02                	add    %al,(%rdx)
ffff80000010d791:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010d794:	08 08                	or     %cl,(%rax)
ffff80000010d796:	08 10                	or     %dl,(%rax)
ffff80000010d798:	10 20                	adc    %ah,(%rax)
ffff80000010d79a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d79d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010d7a4:	42 
ffff80000010d7a5:	42                   	rex.X
ffff80000010d7a6:	42                   	rex.X
ffff80000010d7a7:	42                   	rex.X
ffff80000010d7a8:	42                   	rex.X
ffff80000010d7a9:	42                   	rex.X
ffff80000010d7aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010d7ad:	18 00                	sbb    %al,(%rax)
ffff80000010d7af:	00 00                	add    %al,(%rax)
ffff80000010d7b1:	08 18                	or     %bl,(%rax)
ffff80000010d7b3:	28 08                	sub    %cl,(%rax)
ffff80000010d7b5:	08 08                	or     %cl,(%rax)
ffff80000010d7b7:	08 08                	or     %cl,(%rax)
ffff80000010d7b9:	08 08                	or     %cl,(%rax)
ffff80000010d7bb:	08 08                	or     %cl,(%rax)
ffff80000010d7bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010d7c0:	00 18                	add    %bl,(%rax)
ffff80000010d7c2:	24 42                	and    $0x42,%al
ffff80000010d7c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010d7c8:	10 20                	adc    %ah,(%rax)
ffff80000010d7ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d7cd:	7e 00                	jle    ffff80000010d7cf <system_call_table+0x172f>
ffff80000010d7cf:	00 00                	add    %al,(%rax)
ffff80000010d7d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010d7d4:	02 02                	add    (%rdx),%al
ffff80000010d7d6:	04 18                	add    $0x18,%al
ffff80000010d7d8:	04 02                	add    $0x2,%al
ffff80000010d7da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010d7dd:	18 00                	sbb    %al,(%rax)
ffff80000010d7df:	00 00                	add    %al,(%rax)
ffff80000010d7e1:	0c 0c                	or     $0xc,%al
ffff80000010d7e3:	0c 14                	or     $0x14,%al
ffff80000010d7e5:	14 14                	adc    $0x14,%al
ffff80000010d7e7:	24 24                	and    $0x24,%al
ffff80000010d7e9:	44 7e 04             	rex.R jle ffff80000010d7f0 <system_call_table+0x1750>
ffff80000010d7ec:	04 1e                	add    $0x1e,%al
ffff80000010d7ee:	00 00                	add    %al,(%rax)
ffff80000010d7f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010d7f4:	40 58                	rex pop %rax
ffff80000010d7f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010d7f9:	02 02                	add    (%rdx),%al
ffff80000010d7fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d7fe:	00 00                	add    %al,(%rax)
ffff80000010d800:	00 18                	add    %bl,(%rax)
ffff80000010d802:	24 42                	and    $0x42,%al
ffff80000010d804:	40 58                	rex pop %rax
ffff80000010d806:	64 42                	fs rex.X
ffff80000010d808:	42                   	rex.X
ffff80000010d809:	42                   	rex.X
ffff80000010d80a:	42                   	rex.X
ffff80000010d80b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d80e:	00 00                	add    %al,(%rax)
ffff80000010d810:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010d813:	42 04 04             	rex.X add $0x4,%al
ffff80000010d816:	08 08                	or     %cl,(%rax)
ffff80000010d818:	08 10                	or     %dl,(%rax)
ffff80000010d81a:	10 10                	adc    %dl,(%rax)
ffff80000010d81c:	10 38                	adc    %bh,(%rax)
ffff80000010d81e:	00 00                	add    %al,(%rax)
ffff80000010d820:	00 18                	add    %bl,(%rax)
ffff80000010d822:	24 42                	and    $0x42,%al
ffff80000010d824:	42                   	rex.X
ffff80000010d825:	42 24 18             	rex.X and $0x18,%al
ffff80000010d828:	24 42                	and    $0x42,%al
ffff80000010d82a:	42                   	rex.X
ffff80000010d82b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d82e:	00 00                	add    %al,(%rax)
ffff80000010d830:	00 18                	add    %bl,(%rax)
ffff80000010d832:	24 42                	and    $0x42,%al
ffff80000010d834:	42                   	rex.X
ffff80000010d835:	42                   	rex.X
ffff80000010d836:	42                   	rex.X
ffff80000010d837:	42                   	rex.X
ffff80000010d838:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010d83b:	42 24 18             	rex.X and $0x18,%al
ffff80000010d83e:	00 00                	add    %al,(%rax)
ffff80000010d840:	00 00                	add    %al,(%rax)
ffff80000010d842:	00 00                	add    %al,(%rax)
ffff80000010d844:	00 18                	add    %bl,(%rax)
ffff80000010d846:	18 00                	sbb    %al,(%rax)
ffff80000010d848:	00 00                	add    %al,(%rax)
ffff80000010d84a:	00 00                	add    %al,(%rax)
ffff80000010d84c:	18 18                	sbb    %bl,(%rax)
ffff80000010d84e:	00 00                	add    %al,(%rax)
ffff80000010d850:	00 00                	add    %al,(%rax)
ffff80000010d852:	00 00                	add    %al,(%rax)
ffff80000010d854:	00 18                	add    %bl,(%rax)
ffff80000010d856:	18 00                	sbb    %al,(%rax)
ffff80000010d858:	00 00                	add    %al,(%rax)
ffff80000010d85a:	00 18                	add    %bl,(%rax)
ffff80000010d85c:	18 08                	sbb    %cl,(%rax)
ffff80000010d85e:	08 10                	or     %dl,(%rax)
ffff80000010d860:	00 02                	add    %al,(%rdx)
ffff80000010d862:	04 08                	add    $0x8,%al
ffff80000010d864:	10 20                	adc    %ah,(%rax)
ffff80000010d866:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010d86d:	04 
ffff80000010d86e:	02 00                	add    (%rax),%al
ffff80000010d870:	00 00                	add    %al,(%rax)
ffff80000010d872:	00 00                	add    %al,(%rax)
ffff80000010d874:	00 00                	add    %al,(%rax)
ffff80000010d876:	fe 00                	incb   (%rax)
ffff80000010d878:	00 fe                	add    %bh,%dh
ffff80000010d87a:	00 00                	add    %al,(%rax)
ffff80000010d87c:	00 00                	add    %al,(%rax)
ffff80000010d87e:	00 00                	add    %al,(%rax)
ffff80000010d880:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010d886:	04 02                	add    $0x2,%al
ffff80000010d888:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010d88b:	10 20                	adc    %ah,(%rax)
ffff80000010d88d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d891:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d895:	82                   	(bad)  
ffff80000010d896:	04 08                	add    $0x8,%al
ffff80000010d898:	10 10                	adc    %dl,(%rax)
ffff80000010d89a:	00 00                	add    %al,(%rax)
ffff80000010d89c:	18 18                	sbb    %bl,(%rax)
ffff80000010d89e:	00 00                	add    %al,(%rax)
ffff80000010d8a0:	00 38                	add    %bh,(%rax)
ffff80000010d8a2:	44 82                	rex.R (bad) 
ffff80000010d8a4:	9a                   	(bad)  
ffff80000010d8a5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d8a6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d8a7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d8a8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d8a9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010d8aa:	9c                   	pushfq 
ffff80000010d8ab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010d8af:	00 00                	add    %al,(%rax)
ffff80000010d8b1:	18 18                	sbb    %bl,(%rax)
ffff80000010d8b3:	18 18                	sbb    %bl,(%rax)
ffff80000010d8b5:	24 24                	and    $0x24,%al
ffff80000010d8b7:	24 24                	and    $0x24,%al
ffff80000010d8b9:	7e 42                	jle    ffff80000010d8fd <system_call_table+0x185d>
ffff80000010d8bb:	42                   	rex.X
ffff80000010d8bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d8bf:	00 00                	add    %al,(%rax)
ffff80000010d8c1:	f0 48                	lock rex.W
ffff80000010d8c3:	44                   	rex.R
ffff80000010d8c4:	44                   	rex.R
ffff80000010d8c5:	44                   	rex.R
ffff80000010d8c6:	48 78 44             	rex.W js ffff80000010d90d <system_call_table+0x186d>
ffff80000010d8c9:	42                   	rex.X
ffff80000010d8ca:	42                   	rex.X
ffff80000010d8cb:	42                   	rex.X
ffff80000010d8cc:	44 f8                	rex.R clc 
ffff80000010d8ce:	00 00                	add    %al,(%rax)
ffff80000010d8d0:	00 3a                	add    %bh,(%rdx)
ffff80000010d8d2:	46                   	rex.RX
ffff80000010d8d3:	42 82                	rex.X (bad) 
ffff80000010d8d5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010d8dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d8df:	00 00                	add    %al,(%rax)
ffff80000010d8e1:	f8                   	clc    
ffff80000010d8e2:	44                   	rex.R
ffff80000010d8e3:	44                   	rex.R
ffff80000010d8e4:	42                   	rex.X
ffff80000010d8e5:	42                   	rex.X
ffff80000010d8e6:	42                   	rex.X
ffff80000010d8e7:	42                   	rex.X
ffff80000010d8e8:	42                   	rex.X
ffff80000010d8e9:	42                   	rex.X
ffff80000010d8ea:	42                   	rex.X
ffff80000010d8eb:	44                   	rex.R
ffff80000010d8ec:	44 f8                	rex.R clc 
ffff80000010d8ee:	00 00                	add    %al,(%rax)
ffff80000010d8f0:	00 fe                	add    %bh,%dh
ffff80000010d8f2:	42                   	rex.X
ffff80000010d8f3:	42                   	rex.X
ffff80000010d8f4:	40                   	rex
ffff80000010d8f5:	40                   	rex
ffff80000010d8f6:	44 7c 44             	rex.R jl ffff80000010d93d <system_call_table+0x189d>
ffff80000010d8f9:	40                   	rex
ffff80000010d8fa:	40                   	rex
ffff80000010d8fb:	42                   	rex.X
ffff80000010d8fc:	42 fe 00             	rex.X incb (%rax)
ffff80000010d8ff:	00 00                	add    %al,(%rax)
ffff80000010d901:	fe 42 42             	incb   0x42(%rdx)
ffff80000010d904:	40                   	rex
ffff80000010d905:	40                   	rex
ffff80000010d906:	44 7c 44             	rex.R jl ffff80000010d94d <system_call_table+0x18ad>
ffff80000010d909:	44                   	rex.R
ffff80000010d90a:	40                   	rex
ffff80000010d90b:	40                   	rex
ffff80000010d90c:	40                   	rex
ffff80000010d90d:	f0 00 00             	lock add %al,(%rax)
ffff80000010d910:	00 3a                	add    %bh,(%rdx)
ffff80000010d912:	46                   	rex.RX
ffff80000010d913:	42 82                	rex.X (bad) 
ffff80000010d915:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010d91c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010d91f:	00 00                	add    %al,(%rax)
ffff80000010d921:	e7 42                	out    %eax,$0x42
ffff80000010d923:	42                   	rex.X
ffff80000010d924:	42                   	rex.X
ffff80000010d925:	42                   	rex.X
ffff80000010d926:	42 7e 42             	rex.X jle ffff80000010d96b <system_call_table+0x18cb>
ffff80000010d929:	42                   	rex.X
ffff80000010d92a:	42                   	rex.X
ffff80000010d92b:	42                   	rex.X
ffff80000010d92c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d92f:	00 00                	add    %al,(%rax)
ffff80000010d931:	7c 10                	jl     ffff80000010d943 <system_call_table+0x18a3>
ffff80000010d933:	10 10                	adc    %dl,(%rax)
ffff80000010d935:	10 10                	adc    %dl,(%rax)
ffff80000010d937:	10 10                	adc    %dl,(%rax)
ffff80000010d939:	10 10                	adc    %dl,(%rax)
ffff80000010d93b:	10 10                	adc    %dl,(%rax)
ffff80000010d93d:	7c 00                	jl     ffff80000010d93f <system_call_table+0x189f>
ffff80000010d93f:	00 00                	add    %al,(%rax)
ffff80000010d941:	1f                   	(bad)  
ffff80000010d942:	04 04                	add    $0x4,%al
ffff80000010d944:	04 04                	add    $0x4,%al
ffff80000010d946:	04 04                	add    $0x4,%al
ffff80000010d948:	04 04                	add    $0x4,%al
ffff80000010d94a:	04 04                	add    $0x4,%al
ffff80000010d94c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010d94f:	00 00                	add    %al,(%rax)
ffff80000010d951:	e7 42                	out    %eax,$0x42
ffff80000010d953:	44                   	rex.R
ffff80000010d954:	48 50                	rex.W push %rax
ffff80000010d956:	50                   	push   %rax
ffff80000010d957:	60                   	(bad)  
ffff80000010d958:	50                   	push   %rax
ffff80000010d959:	50                   	push   %rax
ffff80000010d95a:	48                   	rex.W
ffff80000010d95b:	44                   	rex.R
ffff80000010d95c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d95f:	00 00                	add    %al,(%rax)
ffff80000010d961:	f0 40                	lock rex
ffff80000010d963:	40                   	rex
ffff80000010d964:	40                   	rex
ffff80000010d965:	40                   	rex
ffff80000010d966:	40                   	rex
ffff80000010d967:	40                   	rex
ffff80000010d968:	40                   	rex
ffff80000010d969:	40                   	rex
ffff80000010d96a:	40                   	rex
ffff80000010d96b:	42                   	rex.X
ffff80000010d96c:	42 fe 00             	rex.X incb (%rax)
ffff80000010d96f:	00 00                	add    %al,(%rax)
ffff80000010d971:	c3                   	retq   
ffff80000010d972:	42                   	rex.X
ffff80000010d973:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010d977:	5a                   	pop    %rdx
ffff80000010d978:	5a                   	pop    %rdx
ffff80000010d979:	42                   	rex.X
ffff80000010d97a:	42                   	rex.X
ffff80000010d97b:	42                   	rex.X
ffff80000010d97c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d97f:	00 00                	add    %al,(%rax)
ffff80000010d981:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010d988:	4a                   	rex.WX
ffff80000010d989:	4a                   	rex.WX
ffff80000010d98a:	4a                   	rex.WX
ffff80000010d98b:	46                   	rex.RX
ffff80000010d98c:	46 e2 00             	rex.RX loop ffff80000010d98f <system_call_table+0x18ef>
ffff80000010d98f:	00 00                	add    %al,(%rax)
ffff80000010d991:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010d995:	82                   	(bad)  
ffff80000010d996:	82                   	(bad)  
ffff80000010d997:	82                   	(bad)  
ffff80000010d998:	82                   	(bad)  
ffff80000010d999:	82                   	(bad)  
ffff80000010d99a:	82                   	(bad)  
ffff80000010d99b:	82                   	(bad)  
ffff80000010d99c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010d99f:	00 00                	add    %al,(%rax)
ffff80000010d9a1:	f8                   	clc    
ffff80000010d9a2:	44                   	rex.R
ffff80000010d9a3:	42                   	rex.X
ffff80000010d9a4:	42                   	rex.X
ffff80000010d9a5:	42                   	rex.X
ffff80000010d9a6:	44 78 40             	rex.R js ffff80000010d9e9 <system_call_table+0x1949>
ffff80000010d9a9:	40                   	rex
ffff80000010d9aa:	40                   	rex
ffff80000010d9ab:	40                   	rex
ffff80000010d9ac:	40                   	rex
ffff80000010d9ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010d9b0:	00 38                	add    %bh,(%rax)
ffff80000010d9b2:	44 82                	rex.R (bad) 
ffff80000010d9b4:	82                   	(bad)  
ffff80000010d9b5:	82                   	(bad)  
ffff80000010d9b6:	82                   	(bad)  
ffff80000010d9b7:	82                   	(bad)  
ffff80000010d9b8:	82                   	(bad)  
ffff80000010d9b9:	82                   	(bad)  
ffff80000010d9ba:	92                   	xchg   %eax,%edx
ffff80000010d9bb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010d9bf:	00 00                	add    %al,(%rax)
ffff80000010d9c1:	fc                   	cld    
ffff80000010d9c2:	42                   	rex.X
ffff80000010d9c3:	42                   	rex.X
ffff80000010d9c4:	42                   	rex.X
ffff80000010d9c5:	42 7c 44             	rex.X jl ffff80000010da0c <system_call_table+0x196c>
ffff80000010d9c8:	42                   	rex.X
ffff80000010d9c9:	42                   	rex.X
ffff80000010d9ca:	42                   	rex.X
ffff80000010d9cb:	42                   	rex.X
ffff80000010d9cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010d9cf:	00 00                	add    %al,(%rax)
ffff80000010d9d1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010d9d4:	82                   	(bad)  
ffff80000010d9d5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010d9d9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010d9df:	00 00                	add    %al,(%rax)
ffff80000010d9e1:	fe                   	(bad)  
ffff80000010d9e2:	92                   	xchg   %eax,%edx
ffff80000010d9e3:	92                   	xchg   %eax,%edx
ffff80000010d9e4:	10 10                	adc    %dl,(%rax)
ffff80000010d9e6:	10 10                	adc    %dl,(%rax)
ffff80000010d9e8:	10 10                	adc    %dl,(%rax)
ffff80000010d9ea:	10 10                	adc    %dl,(%rax)
ffff80000010d9ec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010d9f0:	00 e7                	add    %ah,%bh
ffff80000010d9f2:	42                   	rex.X
ffff80000010d9f3:	42                   	rex.X
ffff80000010d9f4:	42                   	rex.X
ffff80000010d9f5:	42                   	rex.X
ffff80000010d9f6:	42                   	rex.X
ffff80000010d9f7:	42                   	rex.X
ffff80000010d9f8:	42                   	rex.X
ffff80000010d9f9:	42                   	rex.X
ffff80000010d9fa:	42                   	rex.X
ffff80000010d9fb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010d9fe:	00 00                	add    %al,(%rax)
ffff80000010da00:	00 e7                	add    %ah,%bh
ffff80000010da02:	42                   	rex.X
ffff80000010da03:	42                   	rex.X
ffff80000010da04:	42                   	rex.X
ffff80000010da05:	42 24 24             	rex.X and $0x24,%al
ffff80000010da08:	24 24                	and    $0x24,%al
ffff80000010da0a:	18 18                	sbb    %bl,(%rax)
ffff80000010da0c:	18 18                	sbb    %bl,(%rax)
ffff80000010da0e:	00 00                	add    %al,(%rax)
ffff80000010da10:	00 e7                	add    %ah,%bh
ffff80000010da12:	42                   	rex.X
ffff80000010da13:	42                   	rex.X
ffff80000010da14:	42 5a                	rex.X pop %rdx
ffff80000010da16:	5a                   	pop    %rdx
ffff80000010da17:	5a                   	pop    %rdx
ffff80000010da18:	5a                   	pop    %rdx
ffff80000010da19:	24 24                	and    $0x24,%al
ffff80000010da1b:	24 24                	and    $0x24,%al
ffff80000010da1d:	24 00                	and    $0x0,%al
ffff80000010da1f:	00 00                	add    %al,(%rax)
ffff80000010da21:	e7 42                	out    %eax,$0x42
ffff80000010da23:	42 24 24             	rex.X and $0x24,%al
ffff80000010da26:	24 18                	and    $0x18,%al
ffff80000010da28:	24 24                	and    $0x24,%al
ffff80000010da2a:	24 42                	and    $0x42,%al
ffff80000010da2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010da2f:	00 00                	add    %al,(%rax)
ffff80000010da31:	ee                   	out    %al,(%dx)
ffff80000010da32:	44                   	rex.R
ffff80000010da33:	44                   	rex.R
ffff80000010da34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010da37:	28 10                	sub    %dl,(%rax)
ffff80000010da39:	10 10                	adc    %dl,(%rax)
ffff80000010da3b:	10 10                	adc    %dl,(%rax)
ffff80000010da3d:	7c 00                	jl     ffff80000010da3f <system_call_table+0x199f>
ffff80000010da3f:	00 00                	add    %al,(%rax)
ffff80000010da41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010da48:	20 20                	and    %ah,(%rax)
ffff80000010da4a:	40                   	rex
ffff80000010da4b:	42 82                	rex.X (bad) 
ffff80000010da4d:	fe 00                	incb   (%rax)
ffff80000010da4f:	00 00                	add    %al,(%rax)
ffff80000010da51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010da54:	20 20                	and    %ah,(%rax)
ffff80000010da56:	20 20                	and    %ah,(%rax)
ffff80000010da58:	20 20                	and    %ah,(%rax)
ffff80000010da5a:	20 20                	and    %ah,(%rax)
ffff80000010da5c:	20 20                	and    %ah,(%rax)
ffff80000010da5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010da65:	20 20                	and    %ah,(%rax)
ffff80000010da67:	10 10                	adc    %dl,(%rax)
ffff80000010da69:	08 08                	or     %cl,(%rax)
ffff80000010da6b:	04 04                	add    $0x4,%al
ffff80000010da6d:	04 02                	add    $0x2,%al
ffff80000010da6f:	02 00                	add    (%rax),%al
ffff80000010da71:	7c 04                	jl     ffff80000010da77 <system_call_table+0x19d7>
ffff80000010da73:	04 04                	add    $0x4,%al
ffff80000010da75:	04 04                	add    $0x4,%al
ffff80000010da77:	04 04                	add    $0x4,%al
ffff80000010da79:	04 04                	add    $0x4,%al
ffff80000010da7b:	04 04                	add    $0x4,%al
ffff80000010da7d:	04 7c                	add    $0x7c,%al
ffff80000010da7f:	00 00                	add    %al,(%rax)
ffff80000010da81:	10 28                	adc    %ch,(%rax)
ffff80000010da83:	44 82                	rex.R (bad) 
	...
ffff80000010da9d:	00 fe                	add    %bh,%dh
ffff80000010da9f:	00 10                	add    %dl,(%rax)
ffff80000010daa1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010dab4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010dab7:	04 3c                	add    $0x3c,%al
ffff80000010dab9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010dac0:	c0 
ffff80000010dac1:	40                   	rex
ffff80000010dac2:	40                   	rex
ffff80000010dac3:	40                   	rex
ffff80000010dac4:	40 58                	rex pop %rax
ffff80000010dac6:	64 42                	fs rex.X
ffff80000010dac8:	42                   	rex.X
ffff80000010dac9:	42                   	rex.X
ffff80000010daca:	42                   	rex.X
ffff80000010dacb:	42                   	rex.X
ffff80000010dacc:	64 58                	fs pop %rax
ffff80000010dace:	00 00                	add    %al,(%rax)
ffff80000010dad0:	00 00                	add    %al,(%rax)
ffff80000010dad2:	00 00                	add    %al,(%rax)
ffff80000010dad4:	00 30                	add    %dh,(%rax)
ffff80000010dad6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010dadd:	38 
ffff80000010dade:	00 00                	add    %al,(%rax)
ffff80000010dae0:	0c 04                	or     $0x4,%al
ffff80000010dae2:	04 04                	add    $0x4,%al
ffff80000010dae4:	04 34                	add    $0x34,%al
ffff80000010dae6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010daed:	36 
ffff80000010daee:	00 00                	add    %al,(%rax)
ffff80000010daf0:	00 00                	add    %al,(%rax)
ffff80000010daf2:	00 00                	add    %al,(%rax)
ffff80000010daf4:	00 38                	add    %bh,(%rax)
ffff80000010daf6:	44 82                	rex.R (bad) 
ffff80000010daf8:	82                   	(bad)  
ffff80000010daf9:	fc                   	cld    
ffff80000010dafa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010db01:	10 10                	adc    %dl,(%rax)
ffff80000010db03:	10 10                	adc    %dl,(%rax)
ffff80000010db05:	7c 10                	jl     ffff80000010db17 <system_call_table+0x1a77>
ffff80000010db07:	10 10                	adc    %dl,(%rax)
ffff80000010db09:	10 10                	adc    %dl,(%rax)
ffff80000010db0b:	10 10                	adc    %dl,(%rax)
ffff80000010db0d:	7c 00                	jl     ffff80000010db0f <system_call_table+0x1a6f>
ffff80000010db0f:	00 00                	add    %al,(%rax)
ffff80000010db11:	00 00                	add    %al,(%rax)
ffff80000010db13:	00 00                	add    %al,(%rax)
ffff80000010db15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010db1c:	34 04 
ffff80000010db1e:	04 38                	add    $0x38,%al
ffff80000010db20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010db24:	40 58                	rex pop %rax
ffff80000010db26:	64 42                	fs rex.X
ffff80000010db28:	42                   	rex.X
ffff80000010db29:	42                   	rex.X
ffff80000010db2a:	42                   	rex.X
ffff80000010db2b:	42                   	rex.X
ffff80000010db2c:	42 e3 00             	rex.X jrcxz ffff80000010db2f <system_call_table+0x1a8f>
ffff80000010db2f:	00 00                	add    %al,(%rax)
ffff80000010db31:	10 10                	adc    %dl,(%rax)
ffff80000010db33:	00 00                	add    %al,(%rax)
ffff80000010db35:	30 10                	xor    %dl,(%rax)
ffff80000010db37:	10 10                	adc    %dl,(%rax)
ffff80000010db39:	10 10                	adc    %dl,(%rax)
ffff80000010db3b:	10 10                	adc    %dl,(%rax)
ffff80000010db3d:	38 00                	cmp    %al,(%rax)
ffff80000010db3f:	00 00                	add    %al,(%rax)
ffff80000010db41:	04 04                	add    $0x4,%al
ffff80000010db43:	00 00                	add    %al,(%rax)
ffff80000010db45:	0c 04                	or     $0x4,%al
ffff80000010db47:	04 04                	add    $0x4,%al
ffff80000010db49:	04 04                	add    $0x4,%al
ffff80000010db4b:	04 04                	add    $0x4,%al
ffff80000010db4d:	08 08                	or     %cl,(%rax)
ffff80000010db4f:	30 c0                	xor    %al,%al
ffff80000010db51:	40                   	rex
ffff80000010db52:	40                   	rex
ffff80000010db53:	40                   	rex
ffff80000010db54:	40                   	rex
ffff80000010db55:	4e                   	rex.WRX
ffff80000010db56:	44                   	rex.R
ffff80000010db57:	48 50                	rex.W push %rax
ffff80000010db59:	60                   	(bad)  
ffff80000010db5a:	50                   	push   %rax
ffff80000010db5b:	48                   	rex.W
ffff80000010db5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010db5f:	00 30                	add    %dh,(%rax)
ffff80000010db61:	10 10                	adc    %dl,(%rax)
ffff80000010db63:	10 10                	adc    %dl,(%rax)
ffff80000010db65:	10 10                	adc    %dl,(%rax)
ffff80000010db67:	10 10                	adc    %dl,(%rax)
ffff80000010db69:	10 10                	adc    %dl,(%rax)
ffff80000010db6b:	10 10                	adc    %dl,(%rax)
ffff80000010db6d:	38 00                	cmp    %al,(%rax)
ffff80000010db6f:	00 00                	add    %al,(%rax)
ffff80000010db71:	00 00                	add    %al,(%rax)
ffff80000010db73:	00 00                	add    %al,(%rax)
ffff80000010db75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010db79:	49                   	rex.WB
ffff80000010db7a:	49                   	rex.WB
ffff80000010db7b:	49                   	rex.WB
ffff80000010db7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010db7f:	00 00                	add    %al,(%rax)
ffff80000010db81:	00 00                	add    %al,(%rax)
ffff80000010db83:	00 00                	add    %al,(%rax)
ffff80000010db85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010db89:	42                   	rex.X
ffff80000010db8a:	42                   	rex.X
ffff80000010db8b:	42                   	rex.X
ffff80000010db8c:	42 e3 00             	rex.X jrcxz ffff80000010db8f <system_call_table+0x1aef>
ffff80000010db8f:	00 00                	add    %al,(%rax)
ffff80000010db91:	00 00                	add    %al,(%rax)
ffff80000010db93:	00 00                	add    %al,(%rax)
ffff80000010db95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010db99:	82                   	(bad)  
ffff80000010db9a:	82                   	(bad)  
ffff80000010db9b:	82                   	(bad)  
ffff80000010db9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010db9f:	00 00                	add    %al,(%rax)
ffff80000010dba1:	00 00                	add    %al,(%rax)
ffff80000010dba3:	00 d8                	add    %bl,%al
ffff80000010dba5:	64 42                	fs rex.X
ffff80000010dba7:	42                   	rex.X
ffff80000010dba8:	42                   	rex.X
ffff80000010dba9:	42                   	rex.X
ffff80000010dbaa:	42                   	rex.X
ffff80000010dbab:	64 58                	fs pop %rax
ffff80000010dbad:	40                   	rex
ffff80000010dbae:	40 e0 00             	rex loopne ffff80000010dbb1 <system_call_table+0x1b11>
ffff80000010dbb1:	00 00                	add    %al,(%rax)
ffff80000010dbb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010dbb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010dbbd:	04 04                	add    $0x4,%al
ffff80000010dbbf:	0e                   	(bad)  
ffff80000010dbc0:	00 00                	add    %al,(%rax)
ffff80000010dbc2:	00 00                	add    %al,(%rax)
ffff80000010dbc4:	00 dc                	add    %bl,%ah
ffff80000010dbc6:	62 42                	(bad)  
ffff80000010dbc8:	40                   	rex
ffff80000010dbc9:	40                   	rex
ffff80000010dbca:	40                   	rex
ffff80000010dbcb:	40                   	rex
ffff80000010dbcc:	40 e0 00             	rex loopne ffff80000010dbcf <system_call_table+0x1b2f>
ffff80000010dbcf:	00 00                	add    %al,(%rax)
ffff80000010dbd1:	00 00                	add    %al,(%rax)
ffff80000010dbd3:	00 00                	add    %al,(%rax)
ffff80000010dbd5:	7a 86                	jp     ffff80000010db5d <system_call_table+0x1abd>
ffff80000010dbd7:	82                   	(bad)  
ffff80000010dbd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010dbdb:	82                   	(bad)  
ffff80000010dbdc:	c2 bc 00             	retq   $0xbc
ffff80000010dbdf:	00 00                	add    %al,(%rax)
ffff80000010dbe1:	00 10                	add    %dl,(%rax)
ffff80000010dbe3:	10 10                	adc    %dl,(%rax)
ffff80000010dbe5:	7c 10                	jl     ffff80000010dbf7 <system_call_table+0x1b57>
ffff80000010dbe7:	10 10                	adc    %dl,(%rax)
ffff80000010dbe9:	10 10                	adc    %dl,(%rax)
ffff80000010dbeb:	10 10                	adc    %dl,(%rax)
ffff80000010dbed:	0e                   	(bad)  
ffff80000010dbee:	00 00                	add    %al,(%rax)
ffff80000010dbf0:	00 00                	add    %al,(%rax)
ffff80000010dbf2:	00 00                	add    %al,(%rax)
ffff80000010dbf4:	00 c6                	add    %al,%dh
ffff80000010dbf6:	42                   	rex.X
ffff80000010dbf7:	42                   	rex.X
ffff80000010dbf8:	42                   	rex.X
ffff80000010dbf9:	42                   	rex.X
ffff80000010dbfa:	42                   	rex.X
ffff80000010dbfb:	42                   	rex.X
ffff80000010dbfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010dbff:	00 00                	add    %al,(%rax)
ffff80000010dc01:	00 00                	add    %al,(%rax)
ffff80000010dc03:	00 00                	add    %al,(%rax)
ffff80000010dc05:	e7 42                	out    %eax,$0x42
ffff80000010dc07:	42                   	rex.X
ffff80000010dc08:	42 24 24             	rex.X and $0x24,%al
ffff80000010dc0b:	24 18                	and    $0x18,%al
ffff80000010dc0d:	18 00                	sbb    %al,(%rax)
ffff80000010dc0f:	00 00                	add    %al,(%rax)
ffff80000010dc11:	00 00                	add    %al,(%rax)
ffff80000010dc13:	00 00                	add    %al,(%rax)
ffff80000010dc15:	e7 42                	out    %eax,$0x42
ffff80000010dc17:	42 5a                	rex.X pop %rdx
ffff80000010dc19:	5a                   	pop    %rdx
ffff80000010dc1a:	5a                   	pop    %rdx
ffff80000010dc1b:	24 24                	and    $0x24,%al
ffff80000010dc1d:	24 00                	and    $0x0,%al
ffff80000010dc1f:	00 00                	add    %al,(%rax)
ffff80000010dc21:	00 00                	add    %al,(%rax)
ffff80000010dc23:	00 00                	add    %al,(%rax)
ffff80000010dc25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010dc2a:	28 28                	sub    %ch,(%rax)
ffff80000010dc2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010dc30:	00 00                	add    %al,(%rax)
ffff80000010dc32:	00 00                	add    %al,(%rax)
ffff80000010dc34:	00 e7                	add    %ah,%bh
ffff80000010dc36:	42                   	rex.X
ffff80000010dc37:	42 24 24             	rex.X and $0x24,%al
ffff80000010dc3a:	24 18                	and    $0x18,%al
ffff80000010dc3c:	18 10                	sbb    %dl,(%rax)
ffff80000010dc3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010dc41:	00 00                	add    %al,(%rax)
ffff80000010dc43:	00 00                	add    %al,(%rax)
ffff80000010dc45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010dc4b:	42 82                	rex.X (bad) 
ffff80000010dc4d:	fe 00                	incb   (%rax)
ffff80000010dc4f:	00 00                	add    %al,(%rax)
ffff80000010dc51:	06                   	(bad)  
ffff80000010dc52:	08 10                	or     %dl,(%rax)
ffff80000010dc54:	10 10                	adc    %dl,(%rax)
ffff80000010dc56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010dc59:	10 10                	adc    %dl,(%rax)
ffff80000010dc5b:	10 08                	adc    %cl,(%rax)
ffff80000010dc5d:	06                   	(bad)  
ffff80000010dc5e:	00 00                	add    %al,(%rax)
ffff80000010dc60:	10 10                	adc    %dl,(%rax)
ffff80000010dc62:	10 10                	adc    %dl,(%rax)
ffff80000010dc64:	10 10                	adc    %dl,(%rax)
ffff80000010dc66:	10 10                	adc    %dl,(%rax)
ffff80000010dc68:	10 10                	adc    %dl,(%rax)
ffff80000010dc6a:	10 10                	adc    %dl,(%rax)
ffff80000010dc6c:	10 10                	adc    %dl,(%rax)
ffff80000010dc6e:	10 10                	adc    %dl,(%rax)
ffff80000010dc70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010dc73:	08 08                	or     %cl,(%rax)
ffff80000010dc75:	08 08                	or     %cl,(%rax)
ffff80000010dc77:	06                   	(bad)  
ffff80000010dc78:	08 08                	or     %cl,(%rax)
ffff80000010dc7a:	08 08                	or     %cl,(%rax)
ffff80000010dc7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010dc7f:	00 00                	add    %al,(%rax)
ffff80000010dc81:	72 8c                	jb     ffff80000010dc0f <system_call_table+0x1b6f>
	...
ffff80000010e6af:	00 00                	add    %al,(%rax)
ffff80000010e6b1:	10 10                	adc    %dl,(%rax)
ffff80000010e6b3:	10 10                	adc    %dl,(%rax)
ffff80000010e6b5:	10 10                	adc    %dl,(%rax)
ffff80000010e6b7:	10 10                	adc    %dl,(%rax)
ffff80000010e6b9:	10 00                	adc    %al,(%rax)
ffff80000010e6bb:	00 10                	add    %dl,(%rax)
ffff80000010e6bd:	10 00                	adc    %al,(%rax)
ffff80000010e6bf:	00 28                	add    %ch,(%rax)
ffff80000010e6c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010e6cf:	00 00                	add    %al,(%rax)
ffff80000010e6d1:	44                   	rex.R
ffff80000010e6d2:	44                   	rex.R
ffff80000010e6d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e6d8:	44                   	rex.R
ffff80000010e6d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e6de:	00 00                	add    %al,(%rax)
ffff80000010e6e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010e6e2:	56                   	push   %rsi
ffff80000010e6e3:	92                   	xchg   %eax,%edx
ffff80000010e6e4:	92                   	xchg   %eax,%edx
ffff80000010e6e5:	90                   	nop
ffff80000010e6e6:	50                   	push   %rax
ffff80000010e6e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010e6ea:	92                   	xchg   %eax,%edx
ffff80000010e6eb:	92                   	xchg   %eax,%edx
ffff80000010e6ec:	d4                   	(bad)  
ffff80000010e6ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010e6f2:	94                   	xchg   %eax,%esp
ffff80000010e6f3:	94                   	xchg   %eax,%esp
ffff80000010e6f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010e6f9:	2c 52                	sub    $0x52,%al
ffff80000010e6fb:	52                   	push   %rdx
ffff80000010e6fc:	92                   	xchg   %eax,%edx
ffff80000010e6fd:	8c 00                	mov    %es,(%rax)
ffff80000010e6ff:	00 00                	add    %al,(%rax)
ffff80000010e701:	70 88                	jo     ffff80000010e68b <system_call_table+0x25eb>
ffff80000010e703:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010e709:	92                   	xchg   %eax,%edx
ffff80000010e70a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010e711:	08 10                	or     %dl,(%rax)
	...
ffff80000010e71f:	00 02                	add    %al,(%rdx)
ffff80000010e721:	04 08                	add    $0x8,%al
ffff80000010e723:	08 10                	or     %dl,(%rax)
ffff80000010e725:	10 10                	adc    %dl,(%rax)
ffff80000010e727:	10 10                	adc    %dl,(%rax)
ffff80000010e729:	10 10                	adc    %dl,(%rax)
ffff80000010e72b:	08 08                	or     %cl,(%rax)
ffff80000010e72d:	04 02                	add    $0x2,%al
ffff80000010e72f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010e735:	10 10                	adc    %dl,(%rax)
ffff80000010e737:	10 10                	adc    %dl,(%rax)
ffff80000010e739:	10 10                	adc    %dl,(%rax)
ffff80000010e73b:	20 20                	and    %ah,(%rax)
ffff80000010e73d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e741:	00 00                	add    %al,(%rax)
ffff80000010e743:	00 00                	add    %al,(%rax)
ffff80000010e745:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010e74b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e755:	10 10                	adc    %dl,(%rax)
ffff80000010e757:	10 fe                	adc    %bh,%dh
ffff80000010e759:	10 10                	adc    %dl,(%rax)
ffff80000010e75b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e769:	00 00                	add    %al,(%rax)
ffff80000010e76b:	18 18                	sbb    %bl,(%rax)
ffff80000010e76d:	08 08                	or     %cl,(%rax)
ffff80000010e76f:	10 00                	adc    %al,(%rax)
ffff80000010e771:	00 00                	add    %al,(%rax)
ffff80000010e773:	00 00                	add    %al,(%rax)
ffff80000010e775:	00 00                	add    %al,(%rax)
ffff80000010e777:	00 fe                	add    %bh,%dh
	...
ffff80000010e789:	00 00                	add    %al,(%rax)
ffff80000010e78b:	00 18                	add    %bl,(%rax)
ffff80000010e78d:	18 00                	sbb    %al,(%rax)
ffff80000010e78f:	00 02                	add    %al,(%rdx)
ffff80000010e791:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010e794:	08 08                	or     %cl,(%rax)
ffff80000010e796:	08 10                	or     %dl,(%rax)
ffff80000010e798:	10 20                	adc    %ah,(%rax)
ffff80000010e79a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e79d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010e7a4:	42 
ffff80000010e7a5:	42                   	rex.X
ffff80000010e7a6:	42                   	rex.X
ffff80000010e7a7:	42                   	rex.X
ffff80000010e7a8:	42                   	rex.X
ffff80000010e7a9:	42                   	rex.X
ffff80000010e7aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010e7ad:	18 00                	sbb    %al,(%rax)
ffff80000010e7af:	00 00                	add    %al,(%rax)
ffff80000010e7b1:	08 18                	or     %bl,(%rax)
ffff80000010e7b3:	28 08                	sub    %cl,(%rax)
ffff80000010e7b5:	08 08                	or     %cl,(%rax)
ffff80000010e7b7:	08 08                	or     %cl,(%rax)
ffff80000010e7b9:	08 08                	or     %cl,(%rax)
ffff80000010e7bb:	08 08                	or     %cl,(%rax)
ffff80000010e7bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010e7c0:	00 18                	add    %bl,(%rax)
ffff80000010e7c2:	24 42                	and    $0x42,%al
ffff80000010e7c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010e7c8:	10 20                	adc    %ah,(%rax)
ffff80000010e7ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e7cd:	7e 00                	jle    ffff80000010e7cf <system_call_table+0x272f>
ffff80000010e7cf:	00 00                	add    %al,(%rax)
ffff80000010e7d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010e7d4:	02 02                	add    (%rdx),%al
ffff80000010e7d6:	04 18                	add    $0x18,%al
ffff80000010e7d8:	04 02                	add    $0x2,%al
ffff80000010e7da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010e7dd:	18 00                	sbb    %al,(%rax)
ffff80000010e7df:	00 00                	add    %al,(%rax)
ffff80000010e7e1:	0c 0c                	or     $0xc,%al
ffff80000010e7e3:	0c 14                	or     $0x14,%al
ffff80000010e7e5:	14 14                	adc    $0x14,%al
ffff80000010e7e7:	24 24                	and    $0x24,%al
ffff80000010e7e9:	44 7e 04             	rex.R jle ffff80000010e7f0 <system_call_table+0x2750>
ffff80000010e7ec:	04 1e                	add    $0x1e,%al
ffff80000010e7ee:	00 00                	add    %al,(%rax)
ffff80000010e7f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010e7f4:	40 58                	rex pop %rax
ffff80000010e7f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010e7f9:	02 02                	add    (%rdx),%al
ffff80000010e7fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e7fe:	00 00                	add    %al,(%rax)
ffff80000010e800:	00 18                	add    %bl,(%rax)
ffff80000010e802:	24 42                	and    $0x42,%al
ffff80000010e804:	40 58                	rex pop %rax
ffff80000010e806:	64 42                	fs rex.X
ffff80000010e808:	42                   	rex.X
ffff80000010e809:	42                   	rex.X
ffff80000010e80a:	42                   	rex.X
ffff80000010e80b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e80e:	00 00                	add    %al,(%rax)
ffff80000010e810:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010e813:	42 04 04             	rex.X add $0x4,%al
ffff80000010e816:	08 08                	or     %cl,(%rax)
ffff80000010e818:	08 10                	or     %dl,(%rax)
ffff80000010e81a:	10 10                	adc    %dl,(%rax)
ffff80000010e81c:	10 38                	adc    %bh,(%rax)
ffff80000010e81e:	00 00                	add    %al,(%rax)
ffff80000010e820:	00 18                	add    %bl,(%rax)
ffff80000010e822:	24 42                	and    $0x42,%al
ffff80000010e824:	42                   	rex.X
ffff80000010e825:	42 24 18             	rex.X and $0x18,%al
ffff80000010e828:	24 42                	and    $0x42,%al
ffff80000010e82a:	42                   	rex.X
ffff80000010e82b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e82e:	00 00                	add    %al,(%rax)
ffff80000010e830:	00 18                	add    %bl,(%rax)
ffff80000010e832:	24 42                	and    $0x42,%al
ffff80000010e834:	42                   	rex.X
ffff80000010e835:	42                   	rex.X
ffff80000010e836:	42                   	rex.X
ffff80000010e837:	42                   	rex.X
ffff80000010e838:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010e83b:	42 24 18             	rex.X and $0x18,%al
ffff80000010e83e:	00 00                	add    %al,(%rax)
ffff80000010e840:	00 00                	add    %al,(%rax)
ffff80000010e842:	00 00                	add    %al,(%rax)
ffff80000010e844:	00 18                	add    %bl,(%rax)
ffff80000010e846:	18 00                	sbb    %al,(%rax)
ffff80000010e848:	00 00                	add    %al,(%rax)
ffff80000010e84a:	00 00                	add    %al,(%rax)
ffff80000010e84c:	18 18                	sbb    %bl,(%rax)
ffff80000010e84e:	00 00                	add    %al,(%rax)
ffff80000010e850:	00 00                	add    %al,(%rax)
ffff80000010e852:	00 00                	add    %al,(%rax)
ffff80000010e854:	00 18                	add    %bl,(%rax)
ffff80000010e856:	18 00                	sbb    %al,(%rax)
ffff80000010e858:	00 00                	add    %al,(%rax)
ffff80000010e85a:	00 18                	add    %bl,(%rax)
ffff80000010e85c:	18 08                	sbb    %cl,(%rax)
ffff80000010e85e:	08 10                	or     %dl,(%rax)
ffff80000010e860:	00 02                	add    %al,(%rdx)
ffff80000010e862:	04 08                	add    $0x8,%al
ffff80000010e864:	10 20                	adc    %ah,(%rax)
ffff80000010e866:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010e86d:	04 
ffff80000010e86e:	02 00                	add    (%rax),%al
ffff80000010e870:	00 00                	add    %al,(%rax)
ffff80000010e872:	00 00                	add    %al,(%rax)
ffff80000010e874:	00 00                	add    %al,(%rax)
ffff80000010e876:	fe 00                	incb   (%rax)
ffff80000010e878:	00 fe                	add    %bh,%dh
ffff80000010e87a:	00 00                	add    %al,(%rax)
ffff80000010e87c:	00 00                	add    %al,(%rax)
ffff80000010e87e:	00 00                	add    %al,(%rax)
ffff80000010e880:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010e886:	04 02                	add    $0x2,%al
ffff80000010e888:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010e88b:	10 20                	adc    %ah,(%rax)
ffff80000010e88d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e891:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e895:	82                   	(bad)  
ffff80000010e896:	04 08                	add    $0x8,%al
ffff80000010e898:	10 10                	adc    %dl,(%rax)
ffff80000010e89a:	00 00                	add    %al,(%rax)
ffff80000010e89c:	18 18                	sbb    %bl,(%rax)
ffff80000010e89e:	00 00                	add    %al,(%rax)
ffff80000010e8a0:	00 38                	add    %bh,(%rax)
ffff80000010e8a2:	44 82                	rex.R (bad) 
ffff80000010e8a4:	9a                   	(bad)  
ffff80000010e8a5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e8a6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e8a7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e8a8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e8a9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010e8aa:	9c                   	pushfq 
ffff80000010e8ab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010e8af:	00 00                	add    %al,(%rax)
ffff80000010e8b1:	18 18                	sbb    %bl,(%rax)
ffff80000010e8b3:	18 18                	sbb    %bl,(%rax)
ffff80000010e8b5:	24 24                	and    $0x24,%al
ffff80000010e8b7:	24 24                	and    $0x24,%al
ffff80000010e8b9:	7e 42                	jle    ffff80000010e8fd <system_call_table+0x285d>
ffff80000010e8bb:	42                   	rex.X
ffff80000010e8bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e8bf:	00 00                	add    %al,(%rax)
ffff80000010e8c1:	f0 48                	lock rex.W
ffff80000010e8c3:	44                   	rex.R
ffff80000010e8c4:	44                   	rex.R
ffff80000010e8c5:	44                   	rex.R
ffff80000010e8c6:	48 78 44             	rex.W js ffff80000010e90d <system_call_table+0x286d>
ffff80000010e8c9:	42                   	rex.X
ffff80000010e8ca:	42                   	rex.X
ffff80000010e8cb:	42                   	rex.X
ffff80000010e8cc:	44 f8                	rex.R clc 
ffff80000010e8ce:	00 00                	add    %al,(%rax)
ffff80000010e8d0:	00 3a                	add    %bh,(%rdx)
ffff80000010e8d2:	46                   	rex.RX
ffff80000010e8d3:	42 82                	rex.X (bad) 
ffff80000010e8d5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010e8dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e8df:	00 00                	add    %al,(%rax)
ffff80000010e8e1:	f8                   	clc    
ffff80000010e8e2:	44                   	rex.R
ffff80000010e8e3:	44                   	rex.R
ffff80000010e8e4:	42                   	rex.X
ffff80000010e8e5:	42                   	rex.X
ffff80000010e8e6:	42                   	rex.X
ffff80000010e8e7:	42                   	rex.X
ffff80000010e8e8:	42                   	rex.X
ffff80000010e8e9:	42                   	rex.X
ffff80000010e8ea:	42                   	rex.X
ffff80000010e8eb:	44                   	rex.R
ffff80000010e8ec:	44 f8                	rex.R clc 
ffff80000010e8ee:	00 00                	add    %al,(%rax)
ffff80000010e8f0:	00 fe                	add    %bh,%dh
ffff80000010e8f2:	42                   	rex.X
ffff80000010e8f3:	42                   	rex.X
ffff80000010e8f4:	40                   	rex
ffff80000010e8f5:	40                   	rex
ffff80000010e8f6:	44 7c 44             	rex.R jl ffff80000010e93d <system_call_table+0x289d>
ffff80000010e8f9:	40                   	rex
ffff80000010e8fa:	40                   	rex
ffff80000010e8fb:	42                   	rex.X
ffff80000010e8fc:	42 fe 00             	rex.X incb (%rax)
ffff80000010e8ff:	00 00                	add    %al,(%rax)
ffff80000010e901:	fe 42 42             	incb   0x42(%rdx)
ffff80000010e904:	40                   	rex
ffff80000010e905:	40                   	rex
ffff80000010e906:	44 7c 44             	rex.R jl ffff80000010e94d <system_call_table+0x28ad>
ffff80000010e909:	44                   	rex.R
ffff80000010e90a:	40                   	rex
ffff80000010e90b:	40                   	rex
ffff80000010e90c:	40                   	rex
ffff80000010e90d:	f0 00 00             	lock add %al,(%rax)
ffff80000010e910:	00 3a                	add    %bh,(%rdx)
ffff80000010e912:	46                   	rex.RX
ffff80000010e913:	42 82                	rex.X (bad) 
ffff80000010e915:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010e91c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010e91f:	00 00                	add    %al,(%rax)
ffff80000010e921:	e7 42                	out    %eax,$0x42
ffff80000010e923:	42                   	rex.X
ffff80000010e924:	42                   	rex.X
ffff80000010e925:	42                   	rex.X
ffff80000010e926:	42 7e 42             	rex.X jle ffff80000010e96b <system_call_table+0x28cb>
ffff80000010e929:	42                   	rex.X
ffff80000010e92a:	42                   	rex.X
ffff80000010e92b:	42                   	rex.X
ffff80000010e92c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e92f:	00 00                	add    %al,(%rax)
ffff80000010e931:	7c 10                	jl     ffff80000010e943 <system_call_table+0x28a3>
ffff80000010e933:	10 10                	adc    %dl,(%rax)
ffff80000010e935:	10 10                	adc    %dl,(%rax)
ffff80000010e937:	10 10                	adc    %dl,(%rax)
ffff80000010e939:	10 10                	adc    %dl,(%rax)
ffff80000010e93b:	10 10                	adc    %dl,(%rax)
ffff80000010e93d:	7c 00                	jl     ffff80000010e93f <system_call_table+0x289f>
ffff80000010e93f:	00 00                	add    %al,(%rax)
ffff80000010e941:	1f                   	(bad)  
ffff80000010e942:	04 04                	add    $0x4,%al
ffff80000010e944:	04 04                	add    $0x4,%al
ffff80000010e946:	04 04                	add    $0x4,%al
ffff80000010e948:	04 04                	add    $0x4,%al
ffff80000010e94a:	04 04                	add    $0x4,%al
ffff80000010e94c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010e94f:	00 00                	add    %al,(%rax)
ffff80000010e951:	e7 42                	out    %eax,$0x42
ffff80000010e953:	44                   	rex.R
ffff80000010e954:	48 50                	rex.W push %rax
ffff80000010e956:	50                   	push   %rax
ffff80000010e957:	60                   	(bad)  
ffff80000010e958:	50                   	push   %rax
ffff80000010e959:	50                   	push   %rax
ffff80000010e95a:	48                   	rex.W
ffff80000010e95b:	44                   	rex.R
ffff80000010e95c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e95f:	00 00                	add    %al,(%rax)
ffff80000010e961:	f0 40                	lock rex
ffff80000010e963:	40                   	rex
ffff80000010e964:	40                   	rex
ffff80000010e965:	40                   	rex
ffff80000010e966:	40                   	rex
ffff80000010e967:	40                   	rex
ffff80000010e968:	40                   	rex
ffff80000010e969:	40                   	rex
ffff80000010e96a:	40                   	rex
ffff80000010e96b:	42                   	rex.X
ffff80000010e96c:	42 fe 00             	rex.X incb (%rax)
ffff80000010e96f:	00 00                	add    %al,(%rax)
ffff80000010e971:	c3                   	retq   
ffff80000010e972:	42                   	rex.X
ffff80000010e973:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010e977:	5a                   	pop    %rdx
ffff80000010e978:	5a                   	pop    %rdx
ffff80000010e979:	42                   	rex.X
ffff80000010e97a:	42                   	rex.X
ffff80000010e97b:	42                   	rex.X
ffff80000010e97c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e97f:	00 00                	add    %al,(%rax)
ffff80000010e981:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010e988:	4a                   	rex.WX
ffff80000010e989:	4a                   	rex.WX
ffff80000010e98a:	4a                   	rex.WX
ffff80000010e98b:	46                   	rex.RX
ffff80000010e98c:	46 e2 00             	rex.RX loop ffff80000010e98f <system_call_table+0x28ef>
ffff80000010e98f:	00 00                	add    %al,(%rax)
ffff80000010e991:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010e995:	82                   	(bad)  
ffff80000010e996:	82                   	(bad)  
ffff80000010e997:	82                   	(bad)  
ffff80000010e998:	82                   	(bad)  
ffff80000010e999:	82                   	(bad)  
ffff80000010e99a:	82                   	(bad)  
ffff80000010e99b:	82                   	(bad)  
ffff80000010e99c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010e99f:	00 00                	add    %al,(%rax)
ffff80000010e9a1:	f8                   	clc    
ffff80000010e9a2:	44                   	rex.R
ffff80000010e9a3:	42                   	rex.X
ffff80000010e9a4:	42                   	rex.X
ffff80000010e9a5:	42                   	rex.X
ffff80000010e9a6:	44 78 40             	rex.R js ffff80000010e9e9 <system_call_table+0x2949>
ffff80000010e9a9:	40                   	rex
ffff80000010e9aa:	40                   	rex
ffff80000010e9ab:	40                   	rex
ffff80000010e9ac:	40                   	rex
ffff80000010e9ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010e9b0:	00 38                	add    %bh,(%rax)
ffff80000010e9b2:	44 82                	rex.R (bad) 
ffff80000010e9b4:	82                   	(bad)  
ffff80000010e9b5:	82                   	(bad)  
ffff80000010e9b6:	82                   	(bad)  
ffff80000010e9b7:	82                   	(bad)  
ffff80000010e9b8:	82                   	(bad)  
ffff80000010e9b9:	82                   	(bad)  
ffff80000010e9ba:	92                   	xchg   %eax,%edx
ffff80000010e9bb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010e9bf:	00 00                	add    %al,(%rax)
ffff80000010e9c1:	fc                   	cld    
ffff80000010e9c2:	42                   	rex.X
ffff80000010e9c3:	42                   	rex.X
ffff80000010e9c4:	42                   	rex.X
ffff80000010e9c5:	42 7c 44             	rex.X jl ffff80000010ea0c <system_call_table+0x296c>
ffff80000010e9c8:	42                   	rex.X
ffff80000010e9c9:	42                   	rex.X
ffff80000010e9ca:	42                   	rex.X
ffff80000010e9cb:	42                   	rex.X
ffff80000010e9cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010e9cf:	00 00                	add    %al,(%rax)
ffff80000010e9d1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010e9d4:	82                   	(bad)  
ffff80000010e9d5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010e9d9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010e9df:	00 00                	add    %al,(%rax)
ffff80000010e9e1:	fe                   	(bad)  
ffff80000010e9e2:	92                   	xchg   %eax,%edx
ffff80000010e9e3:	92                   	xchg   %eax,%edx
ffff80000010e9e4:	10 10                	adc    %dl,(%rax)
ffff80000010e9e6:	10 10                	adc    %dl,(%rax)
ffff80000010e9e8:	10 10                	adc    %dl,(%rax)
ffff80000010e9ea:	10 10                	adc    %dl,(%rax)
ffff80000010e9ec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010e9f0:	00 e7                	add    %ah,%bh
ffff80000010e9f2:	42                   	rex.X
ffff80000010e9f3:	42                   	rex.X
ffff80000010e9f4:	42                   	rex.X
ffff80000010e9f5:	42                   	rex.X
ffff80000010e9f6:	42                   	rex.X
ffff80000010e9f7:	42                   	rex.X
ffff80000010e9f8:	42                   	rex.X
ffff80000010e9f9:	42                   	rex.X
ffff80000010e9fa:	42                   	rex.X
ffff80000010e9fb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010e9fe:	00 00                	add    %al,(%rax)
ffff80000010ea00:	00 e7                	add    %ah,%bh
ffff80000010ea02:	42                   	rex.X
ffff80000010ea03:	42                   	rex.X
ffff80000010ea04:	42                   	rex.X
ffff80000010ea05:	42 24 24             	rex.X and $0x24,%al
ffff80000010ea08:	24 24                	and    $0x24,%al
ffff80000010ea0a:	18 18                	sbb    %bl,(%rax)
ffff80000010ea0c:	18 18                	sbb    %bl,(%rax)
ffff80000010ea0e:	00 00                	add    %al,(%rax)
ffff80000010ea10:	00 e7                	add    %ah,%bh
ffff80000010ea12:	42                   	rex.X
ffff80000010ea13:	42                   	rex.X
ffff80000010ea14:	42 5a                	rex.X pop %rdx
ffff80000010ea16:	5a                   	pop    %rdx
ffff80000010ea17:	5a                   	pop    %rdx
ffff80000010ea18:	5a                   	pop    %rdx
ffff80000010ea19:	24 24                	and    $0x24,%al
ffff80000010ea1b:	24 24                	and    $0x24,%al
ffff80000010ea1d:	24 00                	and    $0x0,%al
ffff80000010ea1f:	00 00                	add    %al,(%rax)
ffff80000010ea21:	e7 42                	out    %eax,$0x42
ffff80000010ea23:	42 24 24             	rex.X and $0x24,%al
ffff80000010ea26:	24 18                	and    $0x18,%al
ffff80000010ea28:	24 24                	and    $0x24,%al
ffff80000010ea2a:	24 42                	and    $0x42,%al
ffff80000010ea2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ea2f:	00 00                	add    %al,(%rax)
ffff80000010ea31:	ee                   	out    %al,(%dx)
ffff80000010ea32:	44                   	rex.R
ffff80000010ea33:	44                   	rex.R
ffff80000010ea34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010ea37:	28 10                	sub    %dl,(%rax)
ffff80000010ea39:	10 10                	adc    %dl,(%rax)
ffff80000010ea3b:	10 10                	adc    %dl,(%rax)
ffff80000010ea3d:	7c 00                	jl     ffff80000010ea3f <system_call_table+0x299f>
ffff80000010ea3f:	00 00                	add    %al,(%rax)
ffff80000010ea41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010ea48:	20 20                	and    %ah,(%rax)
ffff80000010ea4a:	40                   	rex
ffff80000010ea4b:	42 82                	rex.X (bad) 
ffff80000010ea4d:	fe 00                	incb   (%rax)
ffff80000010ea4f:	00 00                	add    %al,(%rax)
ffff80000010ea51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010ea54:	20 20                	and    %ah,(%rax)
ffff80000010ea56:	20 20                	and    %ah,(%rax)
ffff80000010ea58:	20 20                	and    %ah,(%rax)
ffff80000010ea5a:	20 20                	and    %ah,(%rax)
ffff80000010ea5c:	20 20                	and    %ah,(%rax)
ffff80000010ea5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010ea65:	20 20                	and    %ah,(%rax)
ffff80000010ea67:	10 10                	adc    %dl,(%rax)
ffff80000010ea69:	08 08                	or     %cl,(%rax)
ffff80000010ea6b:	04 04                	add    $0x4,%al
ffff80000010ea6d:	04 02                	add    $0x2,%al
ffff80000010ea6f:	02 00                	add    (%rax),%al
ffff80000010ea71:	7c 04                	jl     ffff80000010ea77 <system_call_table+0x29d7>
ffff80000010ea73:	04 04                	add    $0x4,%al
ffff80000010ea75:	04 04                	add    $0x4,%al
ffff80000010ea77:	04 04                	add    $0x4,%al
ffff80000010ea79:	04 04                	add    $0x4,%al
ffff80000010ea7b:	04 04                	add    $0x4,%al
ffff80000010ea7d:	04 7c                	add    $0x7c,%al
ffff80000010ea7f:	00 00                	add    %al,(%rax)
ffff80000010ea81:	10 28                	adc    %ch,(%rax)
ffff80000010ea83:	44 82                	rex.R (bad) 
	...
ffff80000010ea9d:	00 fe                	add    %bh,%dh
ffff80000010ea9f:	00 10                	add    %dl,(%rax)
ffff80000010eaa1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010eab4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010eab7:	04 3c                	add    $0x3c,%al
ffff80000010eab9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010eac0:	c0 
ffff80000010eac1:	40                   	rex
ffff80000010eac2:	40                   	rex
ffff80000010eac3:	40                   	rex
ffff80000010eac4:	40 58                	rex pop %rax
ffff80000010eac6:	64 42                	fs rex.X
ffff80000010eac8:	42                   	rex.X
ffff80000010eac9:	42                   	rex.X
ffff80000010eaca:	42                   	rex.X
ffff80000010eacb:	42                   	rex.X
ffff80000010eacc:	64 58                	fs pop %rax
ffff80000010eace:	00 00                	add    %al,(%rax)
ffff80000010ead0:	00 00                	add    %al,(%rax)
ffff80000010ead2:	00 00                	add    %al,(%rax)
ffff80000010ead4:	00 30                	add    %dh,(%rax)
ffff80000010ead6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010eadd:	38 
ffff80000010eade:	00 00                	add    %al,(%rax)
ffff80000010eae0:	0c 04                	or     $0x4,%al
ffff80000010eae2:	04 04                	add    $0x4,%al
ffff80000010eae4:	04 34                	add    $0x34,%al
ffff80000010eae6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010eaed:	36 
ffff80000010eaee:	00 00                	add    %al,(%rax)
ffff80000010eaf0:	00 00                	add    %al,(%rax)
ffff80000010eaf2:	00 00                	add    %al,(%rax)
ffff80000010eaf4:	00 38                	add    %bh,(%rax)
ffff80000010eaf6:	44 82                	rex.R (bad) 
ffff80000010eaf8:	82                   	(bad)  
ffff80000010eaf9:	fc                   	cld    
ffff80000010eafa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010eb01:	10 10                	adc    %dl,(%rax)
ffff80000010eb03:	10 10                	adc    %dl,(%rax)
ffff80000010eb05:	7c 10                	jl     ffff80000010eb17 <system_call_table+0x2a77>
ffff80000010eb07:	10 10                	adc    %dl,(%rax)
ffff80000010eb09:	10 10                	adc    %dl,(%rax)
ffff80000010eb0b:	10 10                	adc    %dl,(%rax)
ffff80000010eb0d:	7c 00                	jl     ffff80000010eb0f <system_call_table+0x2a6f>
ffff80000010eb0f:	00 00                	add    %al,(%rax)
ffff80000010eb11:	00 00                	add    %al,(%rax)
ffff80000010eb13:	00 00                	add    %al,(%rax)
ffff80000010eb15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010eb1c:	34 04 
ffff80000010eb1e:	04 38                	add    $0x38,%al
ffff80000010eb20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010eb24:	40 58                	rex pop %rax
ffff80000010eb26:	64 42                	fs rex.X
ffff80000010eb28:	42                   	rex.X
ffff80000010eb29:	42                   	rex.X
ffff80000010eb2a:	42                   	rex.X
ffff80000010eb2b:	42                   	rex.X
ffff80000010eb2c:	42 e3 00             	rex.X jrcxz ffff80000010eb2f <system_call_table+0x2a8f>
ffff80000010eb2f:	00 00                	add    %al,(%rax)
ffff80000010eb31:	10 10                	adc    %dl,(%rax)
ffff80000010eb33:	00 00                	add    %al,(%rax)
ffff80000010eb35:	30 10                	xor    %dl,(%rax)
ffff80000010eb37:	10 10                	adc    %dl,(%rax)
ffff80000010eb39:	10 10                	adc    %dl,(%rax)
ffff80000010eb3b:	10 10                	adc    %dl,(%rax)
ffff80000010eb3d:	38 00                	cmp    %al,(%rax)
ffff80000010eb3f:	00 00                	add    %al,(%rax)
ffff80000010eb41:	04 04                	add    $0x4,%al
ffff80000010eb43:	00 00                	add    %al,(%rax)
ffff80000010eb45:	0c 04                	or     $0x4,%al
ffff80000010eb47:	04 04                	add    $0x4,%al
ffff80000010eb49:	04 04                	add    $0x4,%al
ffff80000010eb4b:	04 04                	add    $0x4,%al
ffff80000010eb4d:	08 08                	or     %cl,(%rax)
ffff80000010eb4f:	30 c0                	xor    %al,%al
ffff80000010eb51:	40                   	rex
ffff80000010eb52:	40                   	rex
ffff80000010eb53:	40                   	rex
ffff80000010eb54:	40                   	rex
ffff80000010eb55:	4e                   	rex.WRX
ffff80000010eb56:	44                   	rex.R
ffff80000010eb57:	48 50                	rex.W push %rax
ffff80000010eb59:	60                   	(bad)  
ffff80000010eb5a:	50                   	push   %rax
ffff80000010eb5b:	48                   	rex.W
ffff80000010eb5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010eb5f:	00 30                	add    %dh,(%rax)
ffff80000010eb61:	10 10                	adc    %dl,(%rax)
ffff80000010eb63:	10 10                	adc    %dl,(%rax)
ffff80000010eb65:	10 10                	adc    %dl,(%rax)
ffff80000010eb67:	10 10                	adc    %dl,(%rax)
ffff80000010eb69:	10 10                	adc    %dl,(%rax)
ffff80000010eb6b:	10 10                	adc    %dl,(%rax)
ffff80000010eb6d:	38 00                	cmp    %al,(%rax)
ffff80000010eb6f:	00 00                	add    %al,(%rax)
ffff80000010eb71:	00 00                	add    %al,(%rax)
ffff80000010eb73:	00 00                	add    %al,(%rax)
ffff80000010eb75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010eb79:	49                   	rex.WB
ffff80000010eb7a:	49                   	rex.WB
ffff80000010eb7b:	49                   	rex.WB
ffff80000010eb7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010eb7f:	00 00                	add    %al,(%rax)
ffff80000010eb81:	00 00                	add    %al,(%rax)
ffff80000010eb83:	00 00                	add    %al,(%rax)
ffff80000010eb85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010eb89:	42                   	rex.X
ffff80000010eb8a:	42                   	rex.X
ffff80000010eb8b:	42                   	rex.X
ffff80000010eb8c:	42 e3 00             	rex.X jrcxz ffff80000010eb8f <system_call_table+0x2aef>
ffff80000010eb8f:	00 00                	add    %al,(%rax)
ffff80000010eb91:	00 00                	add    %al,(%rax)
ffff80000010eb93:	00 00                	add    %al,(%rax)
ffff80000010eb95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010eb99:	82                   	(bad)  
ffff80000010eb9a:	82                   	(bad)  
ffff80000010eb9b:	82                   	(bad)  
ffff80000010eb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010eb9f:	00 00                	add    %al,(%rax)
ffff80000010eba1:	00 00                	add    %al,(%rax)
ffff80000010eba3:	00 d8                	add    %bl,%al
ffff80000010eba5:	64 42                	fs rex.X
ffff80000010eba7:	42                   	rex.X
ffff80000010eba8:	42                   	rex.X
ffff80000010eba9:	42                   	rex.X
ffff80000010ebaa:	42                   	rex.X
ffff80000010ebab:	64 58                	fs pop %rax
ffff80000010ebad:	40                   	rex
ffff80000010ebae:	40 e0 00             	rex loopne ffff80000010ebb1 <system_call_table+0x2b11>
ffff80000010ebb1:	00 00                	add    %al,(%rax)
ffff80000010ebb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010ebb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010ebbd:	04 04                	add    $0x4,%al
ffff80000010ebbf:	0e                   	(bad)  
ffff80000010ebc0:	00 00                	add    %al,(%rax)
ffff80000010ebc2:	00 00                	add    %al,(%rax)
ffff80000010ebc4:	00 dc                	add    %bl,%ah
ffff80000010ebc6:	62 42                	(bad)  
ffff80000010ebc8:	40                   	rex
ffff80000010ebc9:	40                   	rex
ffff80000010ebca:	40                   	rex
ffff80000010ebcb:	40                   	rex
ffff80000010ebcc:	40 e0 00             	rex loopne ffff80000010ebcf <system_call_table+0x2b2f>
ffff80000010ebcf:	00 00                	add    %al,(%rax)
ffff80000010ebd1:	00 00                	add    %al,(%rax)
ffff80000010ebd3:	00 00                	add    %al,(%rax)
ffff80000010ebd5:	7a 86                	jp     ffff80000010eb5d <system_call_table+0x2abd>
ffff80000010ebd7:	82                   	(bad)  
ffff80000010ebd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010ebdb:	82                   	(bad)  
ffff80000010ebdc:	c2 bc 00             	retq   $0xbc
ffff80000010ebdf:	00 00                	add    %al,(%rax)
ffff80000010ebe1:	00 10                	add    %dl,(%rax)
ffff80000010ebe3:	10 10                	adc    %dl,(%rax)
ffff80000010ebe5:	7c 10                	jl     ffff80000010ebf7 <system_call_table+0x2b57>
ffff80000010ebe7:	10 10                	adc    %dl,(%rax)
ffff80000010ebe9:	10 10                	adc    %dl,(%rax)
ffff80000010ebeb:	10 10                	adc    %dl,(%rax)
ffff80000010ebed:	0e                   	(bad)  
ffff80000010ebee:	00 00                	add    %al,(%rax)
ffff80000010ebf0:	00 00                	add    %al,(%rax)
ffff80000010ebf2:	00 00                	add    %al,(%rax)
ffff80000010ebf4:	00 c6                	add    %al,%dh
ffff80000010ebf6:	42                   	rex.X
ffff80000010ebf7:	42                   	rex.X
ffff80000010ebf8:	42                   	rex.X
ffff80000010ebf9:	42                   	rex.X
ffff80000010ebfa:	42                   	rex.X
ffff80000010ebfb:	42                   	rex.X
ffff80000010ebfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010ebff:	00 00                	add    %al,(%rax)
ffff80000010ec01:	00 00                	add    %al,(%rax)
ffff80000010ec03:	00 00                	add    %al,(%rax)
ffff80000010ec05:	e7 42                	out    %eax,$0x42
ffff80000010ec07:	42                   	rex.X
ffff80000010ec08:	42 24 24             	rex.X and $0x24,%al
ffff80000010ec0b:	24 18                	and    $0x18,%al
ffff80000010ec0d:	18 00                	sbb    %al,(%rax)
ffff80000010ec0f:	00 00                	add    %al,(%rax)
ffff80000010ec11:	00 00                	add    %al,(%rax)
ffff80000010ec13:	00 00                	add    %al,(%rax)
ffff80000010ec15:	e7 42                	out    %eax,$0x42
ffff80000010ec17:	42 5a                	rex.X pop %rdx
ffff80000010ec19:	5a                   	pop    %rdx
ffff80000010ec1a:	5a                   	pop    %rdx
ffff80000010ec1b:	24 24                	and    $0x24,%al
ffff80000010ec1d:	24 00                	and    $0x0,%al
ffff80000010ec1f:	00 00                	add    %al,(%rax)
ffff80000010ec21:	00 00                	add    %al,(%rax)
ffff80000010ec23:	00 00                	add    %al,(%rax)
ffff80000010ec25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010ec2a:	28 28                	sub    %ch,(%rax)
ffff80000010ec2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010ec30:	00 00                	add    %al,(%rax)
ffff80000010ec32:	00 00                	add    %al,(%rax)
ffff80000010ec34:	00 e7                	add    %ah,%bh
ffff80000010ec36:	42                   	rex.X
ffff80000010ec37:	42 24 24             	rex.X and $0x24,%al
ffff80000010ec3a:	24 18                	and    $0x18,%al
ffff80000010ec3c:	18 10                	sbb    %dl,(%rax)
ffff80000010ec3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ec41:	00 00                	add    %al,(%rax)
ffff80000010ec43:	00 00                	add    %al,(%rax)
ffff80000010ec45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010ec4b:	42 82                	rex.X (bad) 
ffff80000010ec4d:	fe 00                	incb   (%rax)
ffff80000010ec4f:	00 00                	add    %al,(%rax)
ffff80000010ec51:	06                   	(bad)  
ffff80000010ec52:	08 10                	or     %dl,(%rax)
ffff80000010ec54:	10 10                	adc    %dl,(%rax)
ffff80000010ec56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010ec59:	10 10                	adc    %dl,(%rax)
ffff80000010ec5b:	10 08                	adc    %cl,(%rax)
ffff80000010ec5d:	06                   	(bad)  
ffff80000010ec5e:	00 00                	add    %al,(%rax)
ffff80000010ec60:	10 10                	adc    %dl,(%rax)
ffff80000010ec62:	10 10                	adc    %dl,(%rax)
ffff80000010ec64:	10 10                	adc    %dl,(%rax)
ffff80000010ec66:	10 10                	adc    %dl,(%rax)
ffff80000010ec68:	10 10                	adc    %dl,(%rax)
ffff80000010ec6a:	10 10                	adc    %dl,(%rax)
ffff80000010ec6c:	10 10                	adc    %dl,(%rax)
ffff80000010ec6e:	10 10                	adc    %dl,(%rax)
ffff80000010ec70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ec73:	08 08                	or     %cl,(%rax)
ffff80000010ec75:	08 08                	or     %cl,(%rax)
ffff80000010ec77:	06                   	(bad)  
ffff80000010ec78:	08 08                	or     %cl,(%rax)
ffff80000010ec7a:	08 08                	or     %cl,(%rax)
ffff80000010ec7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ec7f:	00 00                	add    %al,(%rax)
ffff80000010ec81:	72 8c                	jb     ffff80000010ec0f <system_call_table+0x2b6f>
	...
ffff80000010f6af:	00 00                	add    %al,(%rax)
ffff80000010f6b1:	10 10                	adc    %dl,(%rax)
ffff80000010f6b3:	10 10                	adc    %dl,(%rax)
ffff80000010f6b5:	10 10                	adc    %dl,(%rax)
ffff80000010f6b7:	10 10                	adc    %dl,(%rax)
ffff80000010f6b9:	10 00                	adc    %al,(%rax)
ffff80000010f6bb:	00 10                	add    %dl,(%rax)
ffff80000010f6bd:	10 00                	adc    %al,(%rax)
ffff80000010f6bf:	00 28                	add    %ch,(%rax)
ffff80000010f6c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010f6cf:	00 00                	add    %al,(%rax)
ffff80000010f6d1:	44                   	rex.R
ffff80000010f6d2:	44                   	rex.R
ffff80000010f6d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f6d8:	44                   	rex.R
ffff80000010f6d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f6de:	00 00                	add    %al,(%rax)
ffff80000010f6e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010f6e2:	56                   	push   %rsi
ffff80000010f6e3:	92                   	xchg   %eax,%edx
ffff80000010f6e4:	92                   	xchg   %eax,%edx
ffff80000010f6e5:	90                   	nop
ffff80000010f6e6:	50                   	push   %rax
ffff80000010f6e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010f6ea:	92                   	xchg   %eax,%edx
ffff80000010f6eb:	92                   	xchg   %eax,%edx
ffff80000010f6ec:	d4                   	(bad)  
ffff80000010f6ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010f6f2:	94                   	xchg   %eax,%esp
ffff80000010f6f3:	94                   	xchg   %eax,%esp
ffff80000010f6f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010f6f9:	2c 52                	sub    $0x52,%al
ffff80000010f6fb:	52                   	push   %rdx
ffff80000010f6fc:	92                   	xchg   %eax,%edx
ffff80000010f6fd:	8c 00                	mov    %es,(%rax)
ffff80000010f6ff:	00 00                	add    %al,(%rax)
ffff80000010f701:	70 88                	jo     ffff80000010f68b <system_call_table+0x35eb>
ffff80000010f703:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010f709:	92                   	xchg   %eax,%edx
ffff80000010f70a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010f711:	08 10                	or     %dl,(%rax)
	...
ffff80000010f71f:	00 02                	add    %al,(%rdx)
ffff80000010f721:	04 08                	add    $0x8,%al
ffff80000010f723:	08 10                	or     %dl,(%rax)
ffff80000010f725:	10 10                	adc    %dl,(%rax)
ffff80000010f727:	10 10                	adc    %dl,(%rax)
ffff80000010f729:	10 10                	adc    %dl,(%rax)
ffff80000010f72b:	08 08                	or     %cl,(%rax)
ffff80000010f72d:	04 02                	add    $0x2,%al
ffff80000010f72f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010f735:	10 10                	adc    %dl,(%rax)
ffff80000010f737:	10 10                	adc    %dl,(%rax)
ffff80000010f739:	10 10                	adc    %dl,(%rax)
ffff80000010f73b:	20 20                	and    %ah,(%rax)
ffff80000010f73d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f741:	00 00                	add    %al,(%rax)
ffff80000010f743:	00 00                	add    %al,(%rax)
ffff80000010f745:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010f74b:	10 00                	adc    %al,(%rax)
	...
ffff80000010f755:	10 10                	adc    %dl,(%rax)
ffff80000010f757:	10 fe                	adc    %bh,%dh
ffff80000010f759:	10 10                	adc    %dl,(%rax)
ffff80000010f75b:	10 00                	adc    %al,(%rax)
	...
ffff80000010f769:	00 00                	add    %al,(%rax)
ffff80000010f76b:	18 18                	sbb    %bl,(%rax)
ffff80000010f76d:	08 08                	or     %cl,(%rax)
ffff80000010f76f:	10 00                	adc    %al,(%rax)
ffff80000010f771:	00 00                	add    %al,(%rax)
ffff80000010f773:	00 00                	add    %al,(%rax)
ffff80000010f775:	00 00                	add    %al,(%rax)
ffff80000010f777:	00 fe                	add    %bh,%dh
	...
ffff80000010f789:	00 00                	add    %al,(%rax)
ffff80000010f78b:	00 18                	add    %bl,(%rax)
ffff80000010f78d:	18 00                	sbb    %al,(%rax)
ffff80000010f78f:	00 02                	add    %al,(%rdx)
ffff80000010f791:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010f794:	08 08                	or     %cl,(%rax)
ffff80000010f796:	08 10                	or     %dl,(%rax)
ffff80000010f798:	10 20                	adc    %ah,(%rax)
ffff80000010f79a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f79d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010f7a4:	42 
ffff80000010f7a5:	42                   	rex.X
ffff80000010f7a6:	42                   	rex.X
ffff80000010f7a7:	42                   	rex.X
ffff80000010f7a8:	42                   	rex.X
ffff80000010f7a9:	42                   	rex.X
ffff80000010f7aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010f7ad:	18 00                	sbb    %al,(%rax)
ffff80000010f7af:	00 00                	add    %al,(%rax)
ffff80000010f7b1:	08 18                	or     %bl,(%rax)
ffff80000010f7b3:	28 08                	sub    %cl,(%rax)
ffff80000010f7b5:	08 08                	or     %cl,(%rax)
ffff80000010f7b7:	08 08                	or     %cl,(%rax)
ffff80000010f7b9:	08 08                	or     %cl,(%rax)
ffff80000010f7bb:	08 08                	or     %cl,(%rax)
ffff80000010f7bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010f7c0:	00 18                	add    %bl,(%rax)
ffff80000010f7c2:	24 42                	and    $0x42,%al
ffff80000010f7c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010f7c8:	10 20                	adc    %ah,(%rax)
ffff80000010f7ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010f7cd:	7e 00                	jle    ffff80000010f7cf <system_call_table+0x372f>
ffff80000010f7cf:	00 00                	add    %al,(%rax)
ffff80000010f7d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010f7d4:	02 02                	add    (%rdx),%al
ffff80000010f7d6:	04 18                	add    $0x18,%al
ffff80000010f7d8:	04 02                	add    $0x2,%al
ffff80000010f7da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010f7dd:	18 00                	sbb    %al,(%rax)
ffff80000010f7df:	00 00                	add    %al,(%rax)
ffff80000010f7e1:	0c 0c                	or     $0xc,%al
ffff80000010f7e3:	0c 14                	or     $0x14,%al
ffff80000010f7e5:	14 14                	adc    $0x14,%al
ffff80000010f7e7:	24 24                	and    $0x24,%al
ffff80000010f7e9:	44 7e 04             	rex.R jle ffff80000010f7f0 <system_call_table+0x3750>
ffff80000010f7ec:	04 1e                	add    $0x1e,%al
ffff80000010f7ee:	00 00                	add    %al,(%rax)
ffff80000010f7f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010f7f4:	40 58                	rex pop %rax
ffff80000010f7f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010f7f9:	02 02                	add    (%rdx),%al
ffff80000010f7fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010f7fe:	00 00                	add    %al,(%rax)
ffff80000010f800:	00 18                	add    %bl,(%rax)
ffff80000010f802:	24 42                	and    $0x42,%al
ffff80000010f804:	40 58                	rex pop %rax
ffff80000010f806:	64 42                	fs rex.X
ffff80000010f808:	42                   	rex.X
ffff80000010f809:	42                   	rex.X
ffff80000010f80a:	42                   	rex.X
ffff80000010f80b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f80e:	00 00                	add    %al,(%rax)
ffff80000010f810:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010f813:	42 04 04             	rex.X add $0x4,%al
ffff80000010f816:	08 08                	or     %cl,(%rax)
ffff80000010f818:	08 10                	or     %dl,(%rax)
ffff80000010f81a:	10 10                	adc    %dl,(%rax)
ffff80000010f81c:	10 38                	adc    %bh,(%rax)
ffff80000010f81e:	00 00                	add    %al,(%rax)
ffff80000010f820:	00 18                	add    %bl,(%rax)
ffff80000010f822:	24 42                	and    $0x42,%al
ffff80000010f824:	42                   	rex.X
ffff80000010f825:	42 24 18             	rex.X and $0x18,%al
ffff80000010f828:	24 42                	and    $0x42,%al
ffff80000010f82a:	42                   	rex.X
ffff80000010f82b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f82e:	00 00                	add    %al,(%rax)
ffff80000010f830:	00 18                	add    %bl,(%rax)
ffff80000010f832:	24 42                	and    $0x42,%al
ffff80000010f834:	42                   	rex.X
ffff80000010f835:	42                   	rex.X
ffff80000010f836:	42                   	rex.X
ffff80000010f837:	42                   	rex.X
ffff80000010f838:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010f83b:	42 24 18             	rex.X and $0x18,%al
ffff80000010f83e:	00 00                	add    %al,(%rax)
ffff80000010f840:	00 00                	add    %al,(%rax)
ffff80000010f842:	00 00                	add    %al,(%rax)
ffff80000010f844:	00 18                	add    %bl,(%rax)
ffff80000010f846:	18 00                	sbb    %al,(%rax)
ffff80000010f848:	00 00                	add    %al,(%rax)
ffff80000010f84a:	00 00                	add    %al,(%rax)
ffff80000010f84c:	18 18                	sbb    %bl,(%rax)
ffff80000010f84e:	00 00                	add    %al,(%rax)
ffff80000010f850:	00 00                	add    %al,(%rax)
ffff80000010f852:	00 00                	add    %al,(%rax)
ffff80000010f854:	00 18                	add    %bl,(%rax)
ffff80000010f856:	18 00                	sbb    %al,(%rax)
ffff80000010f858:	00 00                	add    %al,(%rax)
ffff80000010f85a:	00 18                	add    %bl,(%rax)
ffff80000010f85c:	18 08                	sbb    %cl,(%rax)
ffff80000010f85e:	08 10                	or     %dl,(%rax)
ffff80000010f860:	00 02                	add    %al,(%rdx)
ffff80000010f862:	04 08                	add    $0x8,%al
ffff80000010f864:	10 20                	adc    %ah,(%rax)
ffff80000010f866:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010f86d:	04 
ffff80000010f86e:	02 00                	add    (%rax),%al
ffff80000010f870:	00 00                	add    %al,(%rax)
ffff80000010f872:	00 00                	add    %al,(%rax)
ffff80000010f874:	00 00                	add    %al,(%rax)
ffff80000010f876:	fe 00                	incb   (%rax)
ffff80000010f878:	00 fe                	add    %bh,%dh
ffff80000010f87a:	00 00                	add    %al,(%rax)
ffff80000010f87c:	00 00                	add    %al,(%rax)
ffff80000010f87e:	00 00                	add    %al,(%rax)
ffff80000010f880:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010f886:	04 02                	add    $0x2,%al
ffff80000010f888:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010f88b:	10 20                	adc    %ah,(%rax)
ffff80000010f88d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010f891:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f895:	82                   	(bad)  
ffff80000010f896:	04 08                	add    $0x8,%al
ffff80000010f898:	10 10                	adc    %dl,(%rax)
ffff80000010f89a:	00 00                	add    %al,(%rax)
ffff80000010f89c:	18 18                	sbb    %bl,(%rax)
ffff80000010f89e:	00 00                	add    %al,(%rax)
ffff80000010f8a0:	00 38                	add    %bh,(%rax)
ffff80000010f8a2:	44 82                	rex.R (bad) 
ffff80000010f8a4:	9a                   	(bad)  
ffff80000010f8a5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f8a6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f8a7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f8a8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f8a9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010f8aa:	9c                   	pushfq 
ffff80000010f8ab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010f8af:	00 00                	add    %al,(%rax)
ffff80000010f8b1:	18 18                	sbb    %bl,(%rax)
ffff80000010f8b3:	18 18                	sbb    %bl,(%rax)
ffff80000010f8b5:	24 24                	and    $0x24,%al
ffff80000010f8b7:	24 24                	and    $0x24,%al
ffff80000010f8b9:	7e 42                	jle    ffff80000010f8fd <system_call_table+0x385d>
ffff80000010f8bb:	42                   	rex.X
ffff80000010f8bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f8bf:	00 00                	add    %al,(%rax)
ffff80000010f8c1:	f0 48                	lock rex.W
ffff80000010f8c3:	44                   	rex.R
ffff80000010f8c4:	44                   	rex.R
ffff80000010f8c5:	44                   	rex.R
ffff80000010f8c6:	48 78 44             	rex.W js ffff80000010f90d <system_call_table+0x386d>
ffff80000010f8c9:	42                   	rex.X
ffff80000010f8ca:	42                   	rex.X
ffff80000010f8cb:	42                   	rex.X
ffff80000010f8cc:	44 f8                	rex.R clc 
ffff80000010f8ce:	00 00                	add    %al,(%rax)
ffff80000010f8d0:	00 3a                	add    %bh,(%rdx)
ffff80000010f8d2:	46                   	rex.RX
ffff80000010f8d3:	42 82                	rex.X (bad) 
ffff80000010f8d5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010f8dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f8df:	00 00                	add    %al,(%rax)
ffff80000010f8e1:	f8                   	clc    
ffff80000010f8e2:	44                   	rex.R
ffff80000010f8e3:	44                   	rex.R
ffff80000010f8e4:	42                   	rex.X
ffff80000010f8e5:	42                   	rex.X
ffff80000010f8e6:	42                   	rex.X
ffff80000010f8e7:	42                   	rex.X
ffff80000010f8e8:	42                   	rex.X
ffff80000010f8e9:	42                   	rex.X
ffff80000010f8ea:	42                   	rex.X
ffff80000010f8eb:	44                   	rex.R
ffff80000010f8ec:	44 f8                	rex.R clc 
ffff80000010f8ee:	00 00                	add    %al,(%rax)
ffff80000010f8f0:	00 fe                	add    %bh,%dh
ffff80000010f8f2:	42                   	rex.X
ffff80000010f8f3:	42                   	rex.X
ffff80000010f8f4:	40                   	rex
ffff80000010f8f5:	40                   	rex
ffff80000010f8f6:	44 7c 44             	rex.R jl ffff80000010f93d <system_call_table+0x389d>
ffff80000010f8f9:	40                   	rex
ffff80000010f8fa:	40                   	rex
ffff80000010f8fb:	42                   	rex.X
ffff80000010f8fc:	42 fe 00             	rex.X incb (%rax)
ffff80000010f8ff:	00 00                	add    %al,(%rax)
ffff80000010f901:	fe 42 42             	incb   0x42(%rdx)
ffff80000010f904:	40                   	rex
ffff80000010f905:	40                   	rex
ffff80000010f906:	44 7c 44             	rex.R jl ffff80000010f94d <system_call_table+0x38ad>
ffff80000010f909:	44                   	rex.R
ffff80000010f90a:	40                   	rex
ffff80000010f90b:	40                   	rex
ffff80000010f90c:	40                   	rex
ffff80000010f90d:	f0 00 00             	lock add %al,(%rax)
ffff80000010f910:	00 3a                	add    %bh,(%rdx)
ffff80000010f912:	46                   	rex.RX
ffff80000010f913:	42 82                	rex.X (bad) 
ffff80000010f915:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010f91c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010f91f:	00 00                	add    %al,(%rax)
ffff80000010f921:	e7 42                	out    %eax,$0x42
ffff80000010f923:	42                   	rex.X
ffff80000010f924:	42                   	rex.X
ffff80000010f925:	42                   	rex.X
ffff80000010f926:	42 7e 42             	rex.X jle ffff80000010f96b <system_call_table+0x38cb>
ffff80000010f929:	42                   	rex.X
ffff80000010f92a:	42                   	rex.X
ffff80000010f92b:	42                   	rex.X
ffff80000010f92c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f92f:	00 00                	add    %al,(%rax)
ffff80000010f931:	7c 10                	jl     ffff80000010f943 <system_call_table+0x38a3>
ffff80000010f933:	10 10                	adc    %dl,(%rax)
ffff80000010f935:	10 10                	adc    %dl,(%rax)
ffff80000010f937:	10 10                	adc    %dl,(%rax)
ffff80000010f939:	10 10                	adc    %dl,(%rax)
ffff80000010f93b:	10 10                	adc    %dl,(%rax)
ffff80000010f93d:	7c 00                	jl     ffff80000010f93f <system_call_table+0x389f>
ffff80000010f93f:	00 00                	add    %al,(%rax)
ffff80000010f941:	1f                   	(bad)  
ffff80000010f942:	04 04                	add    $0x4,%al
ffff80000010f944:	04 04                	add    $0x4,%al
ffff80000010f946:	04 04                	add    $0x4,%al
ffff80000010f948:	04 04                	add    $0x4,%al
ffff80000010f94a:	04 04                	add    $0x4,%al
ffff80000010f94c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010f94f:	00 00                	add    %al,(%rax)
ffff80000010f951:	e7 42                	out    %eax,$0x42
ffff80000010f953:	44                   	rex.R
ffff80000010f954:	48 50                	rex.W push %rax
ffff80000010f956:	50                   	push   %rax
ffff80000010f957:	60                   	(bad)  
ffff80000010f958:	50                   	push   %rax
ffff80000010f959:	50                   	push   %rax
ffff80000010f95a:	48                   	rex.W
ffff80000010f95b:	44                   	rex.R
ffff80000010f95c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f95f:	00 00                	add    %al,(%rax)
ffff80000010f961:	f0 40                	lock rex
ffff80000010f963:	40                   	rex
ffff80000010f964:	40                   	rex
ffff80000010f965:	40                   	rex
ffff80000010f966:	40                   	rex
ffff80000010f967:	40                   	rex
ffff80000010f968:	40                   	rex
ffff80000010f969:	40                   	rex
ffff80000010f96a:	40                   	rex
ffff80000010f96b:	42                   	rex.X
ffff80000010f96c:	42 fe 00             	rex.X incb (%rax)
ffff80000010f96f:	00 00                	add    %al,(%rax)
ffff80000010f971:	c3                   	retq   
ffff80000010f972:	42                   	rex.X
ffff80000010f973:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010f977:	5a                   	pop    %rdx
ffff80000010f978:	5a                   	pop    %rdx
ffff80000010f979:	42                   	rex.X
ffff80000010f97a:	42                   	rex.X
ffff80000010f97b:	42                   	rex.X
ffff80000010f97c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f97f:	00 00                	add    %al,(%rax)
ffff80000010f981:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010f988:	4a                   	rex.WX
ffff80000010f989:	4a                   	rex.WX
ffff80000010f98a:	4a                   	rex.WX
ffff80000010f98b:	46                   	rex.RX
ffff80000010f98c:	46 e2 00             	rex.RX loop ffff80000010f98f <system_call_table+0x38ef>
ffff80000010f98f:	00 00                	add    %al,(%rax)
ffff80000010f991:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010f995:	82                   	(bad)  
ffff80000010f996:	82                   	(bad)  
ffff80000010f997:	82                   	(bad)  
ffff80000010f998:	82                   	(bad)  
ffff80000010f999:	82                   	(bad)  
ffff80000010f99a:	82                   	(bad)  
ffff80000010f99b:	82                   	(bad)  
ffff80000010f99c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010f99f:	00 00                	add    %al,(%rax)
ffff80000010f9a1:	f8                   	clc    
ffff80000010f9a2:	44                   	rex.R
ffff80000010f9a3:	42                   	rex.X
ffff80000010f9a4:	42                   	rex.X
ffff80000010f9a5:	42                   	rex.X
ffff80000010f9a6:	44 78 40             	rex.R js ffff80000010f9e9 <system_call_table+0x3949>
ffff80000010f9a9:	40                   	rex
ffff80000010f9aa:	40                   	rex
ffff80000010f9ab:	40                   	rex
ffff80000010f9ac:	40                   	rex
ffff80000010f9ad:	f0 00 00             	lock add %al,(%rax)
ffff80000010f9b0:	00 38                	add    %bh,(%rax)
ffff80000010f9b2:	44 82                	rex.R (bad) 
ffff80000010f9b4:	82                   	(bad)  
ffff80000010f9b5:	82                   	(bad)  
ffff80000010f9b6:	82                   	(bad)  
ffff80000010f9b7:	82                   	(bad)  
ffff80000010f9b8:	82                   	(bad)  
ffff80000010f9b9:	82                   	(bad)  
ffff80000010f9ba:	92                   	xchg   %eax,%edx
ffff80000010f9bb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010f9bf:	00 00                	add    %al,(%rax)
ffff80000010f9c1:	fc                   	cld    
ffff80000010f9c2:	42                   	rex.X
ffff80000010f9c3:	42                   	rex.X
ffff80000010f9c4:	42                   	rex.X
ffff80000010f9c5:	42 7c 44             	rex.X jl ffff80000010fa0c <system_call_table+0x396c>
ffff80000010f9c8:	42                   	rex.X
ffff80000010f9c9:	42                   	rex.X
ffff80000010f9ca:	42                   	rex.X
ffff80000010f9cb:	42                   	rex.X
ffff80000010f9cc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010f9cf:	00 00                	add    %al,(%rax)
ffff80000010f9d1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010f9d4:	82                   	(bad)  
ffff80000010f9d5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010f9d9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010f9df:	00 00                	add    %al,(%rax)
ffff80000010f9e1:	fe                   	(bad)  
ffff80000010f9e2:	92                   	xchg   %eax,%edx
ffff80000010f9e3:	92                   	xchg   %eax,%edx
ffff80000010f9e4:	10 10                	adc    %dl,(%rax)
ffff80000010f9e6:	10 10                	adc    %dl,(%rax)
ffff80000010f9e8:	10 10                	adc    %dl,(%rax)
ffff80000010f9ea:	10 10                	adc    %dl,(%rax)
ffff80000010f9ec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010f9f0:	00 e7                	add    %ah,%bh
ffff80000010f9f2:	42                   	rex.X
ffff80000010f9f3:	42                   	rex.X
ffff80000010f9f4:	42                   	rex.X
ffff80000010f9f5:	42                   	rex.X
ffff80000010f9f6:	42                   	rex.X
ffff80000010f9f7:	42                   	rex.X
ffff80000010f9f8:	42                   	rex.X
ffff80000010f9f9:	42                   	rex.X
ffff80000010f9fa:	42                   	rex.X
ffff80000010f9fb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010f9fe:	00 00                	add    %al,(%rax)
ffff80000010fa00:	00 e7                	add    %ah,%bh
ffff80000010fa02:	42                   	rex.X
ffff80000010fa03:	42                   	rex.X
ffff80000010fa04:	42                   	rex.X
ffff80000010fa05:	42 24 24             	rex.X and $0x24,%al
ffff80000010fa08:	24 24                	and    $0x24,%al
ffff80000010fa0a:	18 18                	sbb    %bl,(%rax)
ffff80000010fa0c:	18 18                	sbb    %bl,(%rax)
ffff80000010fa0e:	00 00                	add    %al,(%rax)
ffff80000010fa10:	00 e7                	add    %ah,%bh
ffff80000010fa12:	42                   	rex.X
ffff80000010fa13:	42                   	rex.X
ffff80000010fa14:	42 5a                	rex.X pop %rdx
ffff80000010fa16:	5a                   	pop    %rdx
ffff80000010fa17:	5a                   	pop    %rdx
ffff80000010fa18:	5a                   	pop    %rdx
ffff80000010fa19:	24 24                	and    $0x24,%al
ffff80000010fa1b:	24 24                	and    $0x24,%al
ffff80000010fa1d:	24 00                	and    $0x0,%al
ffff80000010fa1f:	00 00                	add    %al,(%rax)
ffff80000010fa21:	e7 42                	out    %eax,$0x42
ffff80000010fa23:	42 24 24             	rex.X and $0x24,%al
ffff80000010fa26:	24 18                	and    $0x18,%al
ffff80000010fa28:	24 24                	and    $0x24,%al
ffff80000010fa2a:	24 42                	and    $0x42,%al
ffff80000010fa2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fa2f:	00 00                	add    %al,(%rax)
ffff80000010fa31:	ee                   	out    %al,(%dx)
ffff80000010fa32:	44                   	rex.R
ffff80000010fa33:	44                   	rex.R
ffff80000010fa34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010fa37:	28 10                	sub    %dl,(%rax)
ffff80000010fa39:	10 10                	adc    %dl,(%rax)
ffff80000010fa3b:	10 10                	adc    %dl,(%rax)
ffff80000010fa3d:	7c 00                	jl     ffff80000010fa3f <system_call_table+0x399f>
ffff80000010fa3f:	00 00                	add    %al,(%rax)
ffff80000010fa41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010fa48:	20 20                	and    %ah,(%rax)
ffff80000010fa4a:	40                   	rex
ffff80000010fa4b:	42 82                	rex.X (bad) 
ffff80000010fa4d:	fe 00                	incb   (%rax)
ffff80000010fa4f:	00 00                	add    %al,(%rax)
ffff80000010fa51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010fa54:	20 20                	and    %ah,(%rax)
ffff80000010fa56:	20 20                	and    %ah,(%rax)
ffff80000010fa58:	20 20                	and    %ah,(%rax)
ffff80000010fa5a:	20 20                	and    %ah,(%rax)
ffff80000010fa5c:	20 20                	and    %ah,(%rax)
ffff80000010fa5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010fa65:	20 20                	and    %ah,(%rax)
ffff80000010fa67:	10 10                	adc    %dl,(%rax)
ffff80000010fa69:	08 08                	or     %cl,(%rax)
ffff80000010fa6b:	04 04                	add    $0x4,%al
ffff80000010fa6d:	04 02                	add    $0x2,%al
ffff80000010fa6f:	02 00                	add    (%rax),%al
ffff80000010fa71:	7c 04                	jl     ffff80000010fa77 <system_call_table+0x39d7>
ffff80000010fa73:	04 04                	add    $0x4,%al
ffff80000010fa75:	04 04                	add    $0x4,%al
ffff80000010fa77:	04 04                	add    $0x4,%al
ffff80000010fa79:	04 04                	add    $0x4,%al
ffff80000010fa7b:	04 04                	add    $0x4,%al
ffff80000010fa7d:	04 7c                	add    $0x7c,%al
ffff80000010fa7f:	00 00                	add    %al,(%rax)
ffff80000010fa81:	10 28                	adc    %ch,(%rax)
ffff80000010fa83:	44 82                	rex.R (bad) 
	...
ffff80000010fa9d:	00 fe                	add    %bh,%dh
ffff80000010fa9f:	00 10                	add    %dl,(%rax)
ffff80000010faa1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010fab4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010fab7:	04 3c                	add    $0x3c,%al
ffff80000010fab9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010fac0:	c0 
ffff80000010fac1:	40                   	rex
ffff80000010fac2:	40                   	rex
ffff80000010fac3:	40                   	rex
ffff80000010fac4:	40 58                	rex pop %rax
ffff80000010fac6:	64 42                	fs rex.X
ffff80000010fac8:	42                   	rex.X
ffff80000010fac9:	42                   	rex.X
ffff80000010faca:	42                   	rex.X
ffff80000010facb:	42                   	rex.X
ffff80000010facc:	64 58                	fs pop %rax
ffff80000010face:	00 00                	add    %al,(%rax)
ffff80000010fad0:	00 00                	add    %al,(%rax)
ffff80000010fad2:	00 00                	add    %al,(%rax)
ffff80000010fad4:	00 30                	add    %dh,(%rax)
ffff80000010fad6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010fadd:	38 
ffff80000010fade:	00 00                	add    %al,(%rax)
ffff80000010fae0:	0c 04                	or     $0x4,%al
ffff80000010fae2:	04 04                	add    $0x4,%al
ffff80000010fae4:	04 34                	add    $0x34,%al
ffff80000010fae6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010faed:	36 
ffff80000010faee:	00 00                	add    %al,(%rax)
ffff80000010faf0:	00 00                	add    %al,(%rax)
ffff80000010faf2:	00 00                	add    %al,(%rax)
ffff80000010faf4:	00 38                	add    %bh,(%rax)
ffff80000010faf6:	44 82                	rex.R (bad) 
ffff80000010faf8:	82                   	(bad)  
ffff80000010faf9:	fc                   	cld    
ffff80000010fafa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010fb01:	10 10                	adc    %dl,(%rax)
ffff80000010fb03:	10 10                	adc    %dl,(%rax)
ffff80000010fb05:	7c 10                	jl     ffff80000010fb17 <system_call_table+0x3a77>
ffff80000010fb07:	10 10                	adc    %dl,(%rax)
ffff80000010fb09:	10 10                	adc    %dl,(%rax)
ffff80000010fb0b:	10 10                	adc    %dl,(%rax)
ffff80000010fb0d:	7c 00                	jl     ffff80000010fb0f <system_call_table+0x3a6f>
ffff80000010fb0f:	00 00                	add    %al,(%rax)
ffff80000010fb11:	00 00                	add    %al,(%rax)
ffff80000010fb13:	00 00                	add    %al,(%rax)
ffff80000010fb15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010fb1c:	34 04 
ffff80000010fb1e:	04 38                	add    $0x38,%al
ffff80000010fb20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010fb24:	40 58                	rex pop %rax
ffff80000010fb26:	64 42                	fs rex.X
ffff80000010fb28:	42                   	rex.X
ffff80000010fb29:	42                   	rex.X
ffff80000010fb2a:	42                   	rex.X
ffff80000010fb2b:	42                   	rex.X
ffff80000010fb2c:	42 e3 00             	rex.X jrcxz ffff80000010fb2f <system_call_table+0x3a8f>
ffff80000010fb2f:	00 00                	add    %al,(%rax)
ffff80000010fb31:	10 10                	adc    %dl,(%rax)
ffff80000010fb33:	00 00                	add    %al,(%rax)
ffff80000010fb35:	30 10                	xor    %dl,(%rax)
ffff80000010fb37:	10 10                	adc    %dl,(%rax)
ffff80000010fb39:	10 10                	adc    %dl,(%rax)
ffff80000010fb3b:	10 10                	adc    %dl,(%rax)
ffff80000010fb3d:	38 00                	cmp    %al,(%rax)
ffff80000010fb3f:	00 00                	add    %al,(%rax)
ffff80000010fb41:	04 04                	add    $0x4,%al
ffff80000010fb43:	00 00                	add    %al,(%rax)
ffff80000010fb45:	0c 04                	or     $0x4,%al
ffff80000010fb47:	04 04                	add    $0x4,%al
ffff80000010fb49:	04 04                	add    $0x4,%al
ffff80000010fb4b:	04 04                	add    $0x4,%al
ffff80000010fb4d:	08 08                	or     %cl,(%rax)
ffff80000010fb4f:	30 c0                	xor    %al,%al
ffff80000010fb51:	40                   	rex
ffff80000010fb52:	40                   	rex
ffff80000010fb53:	40                   	rex
ffff80000010fb54:	40                   	rex
ffff80000010fb55:	4e                   	rex.WRX
ffff80000010fb56:	44                   	rex.R
ffff80000010fb57:	48 50                	rex.W push %rax
ffff80000010fb59:	60                   	(bad)  
ffff80000010fb5a:	50                   	push   %rax
ffff80000010fb5b:	48                   	rex.W
ffff80000010fb5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010fb5f:	00 30                	add    %dh,(%rax)
ffff80000010fb61:	10 10                	adc    %dl,(%rax)
ffff80000010fb63:	10 10                	adc    %dl,(%rax)
ffff80000010fb65:	10 10                	adc    %dl,(%rax)
ffff80000010fb67:	10 10                	adc    %dl,(%rax)
ffff80000010fb69:	10 10                	adc    %dl,(%rax)
ffff80000010fb6b:	10 10                	adc    %dl,(%rax)
ffff80000010fb6d:	38 00                	cmp    %al,(%rax)
ffff80000010fb6f:	00 00                	add    %al,(%rax)
ffff80000010fb71:	00 00                	add    %al,(%rax)
ffff80000010fb73:	00 00                	add    %al,(%rax)
ffff80000010fb75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010fb79:	49                   	rex.WB
ffff80000010fb7a:	49                   	rex.WB
ffff80000010fb7b:	49                   	rex.WB
ffff80000010fb7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010fb7f:	00 00                	add    %al,(%rax)
ffff80000010fb81:	00 00                	add    %al,(%rax)
ffff80000010fb83:	00 00                	add    %al,(%rax)
ffff80000010fb85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010fb89:	42                   	rex.X
ffff80000010fb8a:	42                   	rex.X
ffff80000010fb8b:	42                   	rex.X
ffff80000010fb8c:	42 e3 00             	rex.X jrcxz ffff80000010fb8f <system_call_table+0x3aef>
ffff80000010fb8f:	00 00                	add    %al,(%rax)
ffff80000010fb91:	00 00                	add    %al,(%rax)
ffff80000010fb93:	00 00                	add    %al,(%rax)
ffff80000010fb95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010fb99:	82                   	(bad)  
ffff80000010fb9a:	82                   	(bad)  
ffff80000010fb9b:	82                   	(bad)  
ffff80000010fb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010fb9f:	00 00                	add    %al,(%rax)
ffff80000010fba1:	00 00                	add    %al,(%rax)
ffff80000010fba3:	00 d8                	add    %bl,%al
ffff80000010fba5:	64 42                	fs rex.X
ffff80000010fba7:	42                   	rex.X
ffff80000010fba8:	42                   	rex.X
ffff80000010fba9:	42                   	rex.X
ffff80000010fbaa:	42                   	rex.X
ffff80000010fbab:	64 58                	fs pop %rax
ffff80000010fbad:	40                   	rex
ffff80000010fbae:	40 e0 00             	rex loopne ffff80000010fbb1 <system_call_table+0x3b11>
ffff80000010fbb1:	00 00                	add    %al,(%rax)
ffff80000010fbb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010fbb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010fbbd:	04 04                	add    $0x4,%al
ffff80000010fbbf:	0e                   	(bad)  
ffff80000010fbc0:	00 00                	add    %al,(%rax)
ffff80000010fbc2:	00 00                	add    %al,(%rax)
ffff80000010fbc4:	00 dc                	add    %bl,%ah
ffff80000010fbc6:	62 42                	(bad)  
ffff80000010fbc8:	40                   	rex
ffff80000010fbc9:	40                   	rex
ffff80000010fbca:	40                   	rex
ffff80000010fbcb:	40                   	rex
ffff80000010fbcc:	40 e0 00             	rex loopne ffff80000010fbcf <system_call_table+0x3b2f>
ffff80000010fbcf:	00 00                	add    %al,(%rax)
ffff80000010fbd1:	00 00                	add    %al,(%rax)
ffff80000010fbd3:	00 00                	add    %al,(%rax)
ffff80000010fbd5:	7a 86                	jp     ffff80000010fb5d <system_call_table+0x3abd>
ffff80000010fbd7:	82                   	(bad)  
ffff80000010fbd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010fbdb:	82                   	(bad)  
ffff80000010fbdc:	c2 bc 00             	retq   $0xbc
ffff80000010fbdf:	00 00                	add    %al,(%rax)
ffff80000010fbe1:	00 10                	add    %dl,(%rax)
ffff80000010fbe3:	10 10                	adc    %dl,(%rax)
ffff80000010fbe5:	7c 10                	jl     ffff80000010fbf7 <system_call_table+0x3b57>
ffff80000010fbe7:	10 10                	adc    %dl,(%rax)
ffff80000010fbe9:	10 10                	adc    %dl,(%rax)
ffff80000010fbeb:	10 10                	adc    %dl,(%rax)
ffff80000010fbed:	0e                   	(bad)  
ffff80000010fbee:	00 00                	add    %al,(%rax)
ffff80000010fbf0:	00 00                	add    %al,(%rax)
ffff80000010fbf2:	00 00                	add    %al,(%rax)
ffff80000010fbf4:	00 c6                	add    %al,%dh
ffff80000010fbf6:	42                   	rex.X
ffff80000010fbf7:	42                   	rex.X
ffff80000010fbf8:	42                   	rex.X
ffff80000010fbf9:	42                   	rex.X
ffff80000010fbfa:	42                   	rex.X
ffff80000010fbfb:	42                   	rex.X
ffff80000010fbfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010fbff:	00 00                	add    %al,(%rax)
ffff80000010fc01:	00 00                	add    %al,(%rax)
ffff80000010fc03:	00 00                	add    %al,(%rax)
ffff80000010fc05:	e7 42                	out    %eax,$0x42
ffff80000010fc07:	42                   	rex.X
ffff80000010fc08:	42 24 24             	rex.X and $0x24,%al
ffff80000010fc0b:	24 18                	and    $0x18,%al
ffff80000010fc0d:	18 00                	sbb    %al,(%rax)
ffff80000010fc0f:	00 00                	add    %al,(%rax)
ffff80000010fc11:	00 00                	add    %al,(%rax)
ffff80000010fc13:	00 00                	add    %al,(%rax)
ffff80000010fc15:	e7 42                	out    %eax,$0x42
ffff80000010fc17:	42 5a                	rex.X pop %rdx
ffff80000010fc19:	5a                   	pop    %rdx
ffff80000010fc1a:	5a                   	pop    %rdx
ffff80000010fc1b:	24 24                	and    $0x24,%al
ffff80000010fc1d:	24 00                	and    $0x0,%al
ffff80000010fc1f:	00 00                	add    %al,(%rax)
ffff80000010fc21:	00 00                	add    %al,(%rax)
ffff80000010fc23:	00 00                	add    %al,(%rax)
ffff80000010fc25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010fc2a:	28 28                	sub    %ch,(%rax)
ffff80000010fc2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010fc30:	00 00                	add    %al,(%rax)
ffff80000010fc32:	00 00                	add    %al,(%rax)
ffff80000010fc34:	00 e7                	add    %ah,%bh
ffff80000010fc36:	42                   	rex.X
ffff80000010fc37:	42 24 24             	rex.X and $0x24,%al
ffff80000010fc3a:	24 18                	and    $0x18,%al
ffff80000010fc3c:	18 10                	sbb    %dl,(%rax)
ffff80000010fc3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010fc41:	00 00                	add    %al,(%rax)
ffff80000010fc43:	00 00                	add    %al,(%rax)
ffff80000010fc45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010fc4b:	42 82                	rex.X (bad) 
ffff80000010fc4d:	fe 00                	incb   (%rax)
ffff80000010fc4f:	00 00                	add    %al,(%rax)
ffff80000010fc51:	06                   	(bad)  
ffff80000010fc52:	08 10                	or     %dl,(%rax)
ffff80000010fc54:	10 10                	adc    %dl,(%rax)
ffff80000010fc56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010fc59:	10 10                	adc    %dl,(%rax)
ffff80000010fc5b:	10 08                	adc    %cl,(%rax)
ffff80000010fc5d:	06                   	(bad)  
ffff80000010fc5e:	00 00                	add    %al,(%rax)
ffff80000010fc60:	10 10                	adc    %dl,(%rax)
ffff80000010fc62:	10 10                	adc    %dl,(%rax)
ffff80000010fc64:	10 10                	adc    %dl,(%rax)
ffff80000010fc66:	10 10                	adc    %dl,(%rax)
ffff80000010fc68:	10 10                	adc    %dl,(%rax)
ffff80000010fc6a:	10 10                	adc    %dl,(%rax)
ffff80000010fc6c:	10 10                	adc    %dl,(%rax)
ffff80000010fc6e:	10 10                	adc    %dl,(%rax)
ffff80000010fc70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010fc73:	08 08                	or     %cl,(%rax)
ffff80000010fc75:	08 08                	or     %cl,(%rax)
ffff80000010fc77:	06                   	(bad)  
ffff80000010fc78:	08 08                	or     %cl,(%rax)
ffff80000010fc7a:	08 08                	or     %cl,(%rax)
ffff80000010fc7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010fc7f:	00 00                	add    %al,(%rax)
ffff80000010fc81:	72 8c                	jb     ffff80000010fc0f <system_call_table+0x3b6f>
	...

ffff8000001104a0 <interrupt>:
ffff8000001104a0:	f5                   	cmc    
ffff8000001104a1:	80 10 00             	adcb   $0x0,(%rax)
ffff8000001104a4:	00 80 ff ff 3f 81    	add    %al,-0x7ec00001(%rax)
ffff8000001104aa:	10 00                	adc    %al,(%rax)
ffff8000001104ac:	00 80 ff ff 89 81    	add    %al,-0x7e760001(%rax)
ffff8000001104b2:	10 00                	adc    %al,(%rax)
ffff8000001104b4:	00 80 ff ff d3 81    	add    %al,-0x7e2c0001(%rax)
ffff8000001104ba:	10 00                	adc    %al,(%rax)
ffff8000001104bc:	00 80 ff ff 1d 82    	add    %al,-0x7de20001(%rax)
ffff8000001104c2:	10 00                	adc    %al,(%rax)
ffff8000001104c4:	00 80 ff ff 67 82    	add    %al,-0x7d980001(%rax)
ffff8000001104ca:	10 00                	adc    %al,(%rax)
ffff8000001104cc:	00 80 ff ff b1 82    	add    %al,-0x7d4e0001(%rax)
ffff8000001104d2:	10 00                	adc    %al,(%rax)
ffff8000001104d4:	00 80 ff ff fb 82    	add    %al,-0x7d040001(%rax)
ffff8000001104da:	10 00                	adc    %al,(%rax)
ffff8000001104dc:	00 80 ff ff 45 83    	add    %al,-0x7cba0001(%rax)
ffff8000001104e2:	10 00                	adc    %al,(%rax)
ffff8000001104e4:	00 80 ff ff 8f 83    	add    %al,-0x7c700001(%rax)
ffff8000001104ea:	10 00                	adc    %al,(%rax)
ffff8000001104ec:	00 80 ff ff d9 83    	add    %al,-0x7c260001(%rax)
ffff8000001104f2:	10 00                	adc    %al,(%rax)
ffff8000001104f4:	00 80 ff ff 23 84    	add    %al,-0x7bdc0001(%rax)
ffff8000001104fa:	10 00                	adc    %al,(%rax)
ffff8000001104fc:	00 80 ff ff 6d 84    	add    %al,-0x7b920001(%rax)
ffff800000110502:	10 00                	adc    %al,(%rax)
ffff800000110504:	00 80 ff ff b7 84    	add    %al,-0x7b480001(%rax)
ffff80000011050a:	10 00                	adc    %al,(%rax)
ffff80000011050c:	00 80 ff ff 01 85    	add    %al,-0x7afe0001(%rax)
ffff800000110512:	10 00                	adc    %al,(%rax)
ffff800000110514:	00 80 ff ff 4b 85    	add    %al,-0x7ab40001(%rax)
ffff80000011051a:	10 00                	adc    %al,(%rax)
ffff80000011051c:	00 80 ff ff 95 85    	add    %al,-0x7a6a0001(%rax)
ffff800000110522:	10 00                	adc    %al,(%rax)
ffff800000110524:	00 80 ff ff df 85    	add    %al,-0x7a200001(%rax)
ffff80000011052a:	10 00                	adc    %al,(%rax)
ffff80000011052c:	00 80 ff ff 29 86    	add    %al,-0x79d60001(%rax)
ffff800000110532:	10 00                	adc    %al,(%rax)
ffff800000110534:	00 80 ff ff 73 86    	add    %al,-0x798c0001(%rax)
ffff80000011053a:	10 00                	adc    %al,(%rax)
ffff80000011053c:	00 80 ff ff bd 86    	add    %al,-0x79420001(%rax)
ffff800000110542:	10 00                	adc    %al,(%rax)
ffff800000110544:	00 80 ff ff 07 87    	add    %al,-0x78f80001(%rax)
ffff80000011054a:	10 00                	adc    %al,(%rax)
ffff80000011054c:	00 80 ff ff 51 87    	add    %al,-0x78ae0001(%rax)
ffff800000110552:	10 00                	adc    %al,(%rax)
ffff800000110554:	00 80 ff ff 9b 87    	add    %al,-0x78640001(%rax)
ffff80000011055a:	10 00                	adc    %al,(%rax)
ffff80000011055c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011076e:	00 00                	add    %al,(%rax)
ffff800000110770:	00 10                	add    %dl,(%rax)
ffff800000110772:	10 10                	adc    %dl,(%rax)
ffff800000110774:	10 10                	adc    %dl,(%rax)
ffff800000110776:	10 10                	adc    %dl,(%rax)
ffff800000110778:	10 10                	adc    %dl,(%rax)
ffff80000011077a:	00 00                	add    %al,(%rax)
ffff80000011077c:	10 10                	adc    %dl,(%rax)
ffff80000011077e:	00 00                	add    %al,(%rax)
ffff800000110780:	28 28                	sub    %ch,(%rax)
ffff800000110782:	28 00                	sub    %al,(%rax)
	...
ffff800000110790:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff800000110794:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff800000110798:	44                   	rex.R
ffff800000110799:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000011079e:	00 00                	add    %al,(%rax)
ffff8000001107a0:	10 3a                	adc    %bh,(%rdx)
ffff8000001107a2:	56                   	push   %rsi
ffff8000001107a3:	92                   	xchg   %eax,%edx
ffff8000001107a4:	92                   	xchg   %eax,%edx
ffff8000001107a5:	90                   	nop
ffff8000001107a6:	50                   	push   %rax
ffff8000001107a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff8000001107aa:	92                   	xchg   %eax,%edx
ffff8000001107ab:	92                   	xchg   %eax,%edx
ffff8000001107ac:	d4                   	(bad)  
ffff8000001107ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff8000001107b2:	94                   	xchg   %eax,%esp
ffff8000001107b3:	94                   	xchg   %eax,%esp
ffff8000001107b4:	68 08 10 10 20       	pushq  $0x20101008
ffff8000001107b9:	2c 52                	sub    $0x52,%al
ffff8000001107bb:	52                   	push   %rdx
ffff8000001107bc:	92                   	xchg   %eax,%edx
ffff8000001107bd:	8c 00                	mov    %es,(%rax)
ffff8000001107bf:	00 00                	add    %al,(%rax)
ffff8000001107c1:	70 88                	jo     ffff80000011074b <interrupt+0x2ab>
ffff8000001107c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff8000001107c9:	92                   	xchg   %eax,%edx
ffff8000001107ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff8000001107d1:	08 10                	or     %dl,(%rax)
	...
ffff8000001107df:	00 02                	add    %al,(%rdx)
ffff8000001107e1:	04 08                	add    $0x8,%al
ffff8000001107e3:	08 10                	or     %dl,(%rax)
ffff8000001107e5:	10 10                	adc    %dl,(%rax)
ffff8000001107e7:	10 10                	adc    %dl,(%rax)
ffff8000001107e9:	10 10                	adc    %dl,(%rax)
ffff8000001107eb:	08 08                	or     %cl,(%rax)
ffff8000001107ed:	04 02                	add    $0x2,%al
ffff8000001107ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff8000001107f5:	10 10                	adc    %dl,(%rax)
ffff8000001107f7:	10 10                	adc    %dl,(%rax)
ffff8000001107f9:	10 10                	adc    %dl,(%rax)
ffff8000001107fb:	20 20                	and    %ah,(%rax)
ffff8000001107fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000110801:	00 00                	add    %al,(%rax)
ffff800000110803:	00 00                	add    %al,(%rax)
ffff800000110805:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000011080b:	10 00                	adc    %al,(%rax)
	...
ffff800000110815:	10 10                	adc    %dl,(%rax)
ffff800000110817:	10 fe                	adc    %bh,%dh
ffff800000110819:	10 10                	adc    %dl,(%rax)
ffff80000011081b:	10 00                	adc    %al,(%rax)
	...
ffff800000110829:	00 00                	add    %al,(%rax)
ffff80000011082b:	18 18                	sbb    %bl,(%rax)
ffff80000011082d:	08 08                	or     %cl,(%rax)
ffff80000011082f:	10 00                	adc    %al,(%rax)
ffff800000110831:	00 00                	add    %al,(%rax)
ffff800000110833:	00 00                	add    %al,(%rax)
ffff800000110835:	00 00                	add    %al,(%rax)
ffff800000110837:	00 fe                	add    %bh,%dh
	...
ffff800000110849:	00 00                	add    %al,(%rax)
ffff80000011084b:	00 18                	add    %bl,(%rax)
ffff80000011084d:	18 00                	sbb    %al,(%rax)
ffff80000011084f:	00 02                	add    %al,(%rdx)
ffff800000110851:	02 04 04             	add    (%rsp,%rax,1),%al
ffff800000110854:	08 08                	or     %cl,(%rax)
ffff800000110856:	08 10                	or     %dl,(%rax)
ffff800000110858:	10 20                	adc    %ah,(%rax)
ffff80000011085a:	20 40 40             	and    %al,0x40(%rax)
ffff80000011085d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff800000110864:	42 
ffff800000110865:	42                   	rex.X
ffff800000110866:	42                   	rex.X
ffff800000110867:	42                   	rex.X
ffff800000110868:	42                   	rex.X
ffff800000110869:	42                   	rex.X
ffff80000011086a:	42 24 24             	rex.X and $0x24,%al
ffff80000011086d:	18 00                	sbb    %al,(%rax)
ffff80000011086f:	00 00                	add    %al,(%rax)
ffff800000110871:	08 18                	or     %bl,(%rax)
ffff800000110873:	28 08                	sub    %cl,(%rax)
ffff800000110875:	08 08                	or     %cl,(%rax)
ffff800000110877:	08 08                	or     %cl,(%rax)
ffff800000110879:	08 08                	or     %cl,(%rax)
ffff80000011087b:	08 08                	or     %cl,(%rax)
ffff80000011087d:	3e 00 00             	add    %al,%ds:(%rax)
ffff800000110880:	00 18                	add    %bl,(%rax)
ffff800000110882:	24 42                	and    $0x42,%al
ffff800000110884:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff800000110888:	10 20                	adc    %ah,(%rax)
ffff80000011088a:	20 40 40             	and    %al,0x40(%rax)
ffff80000011088d:	7e 00                	jle    ffff80000011088f <interrupt+0x3ef>
ffff80000011088f:	00 00                	add    %al,(%rax)
ffff800000110891:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff800000110894:	02 02                	add    (%rdx),%al
ffff800000110896:	04 18                	add    $0x18,%al
ffff800000110898:	04 02                	add    $0x2,%al
ffff80000011089a:	02 42 24             	add    0x24(%rdx),%al
ffff80000011089d:	18 00                	sbb    %al,(%rax)
ffff80000011089f:	00 00                	add    %al,(%rax)
ffff8000001108a1:	0c 0c                	or     $0xc,%al
ffff8000001108a3:	0c 14                	or     $0x14,%al
ffff8000001108a5:	14 14                	adc    $0x14,%al
ffff8000001108a7:	24 24                	and    $0x24,%al
ffff8000001108a9:	44 7e 04             	rex.R jle ffff8000001108b0 <interrupt+0x410>
ffff8000001108ac:	04 1e                	add    $0x1e,%al
ffff8000001108ae:	00 00                	add    %al,(%rax)
ffff8000001108b0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff8000001108b4:	40 58                	rex pop %rax
ffff8000001108b6:	64 02 02             	add    %fs:(%rdx),%al
ffff8000001108b9:	02 02                	add    (%rdx),%al
ffff8000001108bb:	42 24 18             	rex.X and $0x18,%al
ffff8000001108be:	00 00                	add    %al,(%rax)
ffff8000001108c0:	00 18                	add    %bl,(%rax)
ffff8000001108c2:	24 42                	and    $0x42,%al
ffff8000001108c4:	40 58                	rex pop %rax
ffff8000001108c6:	64 42                	fs rex.X
ffff8000001108c8:	42                   	rex.X
ffff8000001108c9:	42                   	rex.X
ffff8000001108ca:	42                   	rex.X
ffff8000001108cb:	42 24 18             	rex.X and $0x18,%al
ffff8000001108ce:	00 00                	add    %al,(%rax)
ffff8000001108d0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff8000001108d3:	42 04 04             	rex.X add $0x4,%al
ffff8000001108d6:	08 08                	or     %cl,(%rax)
ffff8000001108d8:	08 10                	or     %dl,(%rax)
ffff8000001108da:	10 10                	adc    %dl,(%rax)
ffff8000001108dc:	10 38                	adc    %bh,(%rax)
ffff8000001108de:	00 00                	add    %al,(%rax)
ffff8000001108e0:	00 18                	add    %bl,(%rax)
ffff8000001108e2:	24 42                	and    $0x42,%al
ffff8000001108e4:	42                   	rex.X
ffff8000001108e5:	42 24 18             	rex.X and $0x18,%al
ffff8000001108e8:	24 42                	and    $0x42,%al
ffff8000001108ea:	42                   	rex.X
ffff8000001108eb:	42 24 18             	rex.X and $0x18,%al
ffff8000001108ee:	00 00                	add    %al,(%rax)
ffff8000001108f0:	00 18                	add    %bl,(%rax)
ffff8000001108f2:	24 42                	and    $0x42,%al
ffff8000001108f4:	42                   	rex.X
ffff8000001108f5:	42                   	rex.X
ffff8000001108f6:	42                   	rex.X
ffff8000001108f7:	42                   	rex.X
ffff8000001108f8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff8000001108fb:	42 24 18             	rex.X and $0x18,%al
ffff8000001108fe:	00 00                	add    %al,(%rax)
ffff800000110900:	00 00                	add    %al,(%rax)
ffff800000110902:	00 00                	add    %al,(%rax)
ffff800000110904:	00 18                	add    %bl,(%rax)
ffff800000110906:	18 00                	sbb    %al,(%rax)
ffff800000110908:	00 00                	add    %al,(%rax)
ffff80000011090a:	00 00                	add    %al,(%rax)
ffff80000011090c:	18 18                	sbb    %bl,(%rax)
ffff80000011090e:	00 00                	add    %al,(%rax)
ffff800000110910:	00 00                	add    %al,(%rax)
ffff800000110912:	00 00                	add    %al,(%rax)
ffff800000110914:	00 18                	add    %bl,(%rax)
ffff800000110916:	18 00                	sbb    %al,(%rax)
ffff800000110918:	00 00                	add    %al,(%rax)
ffff80000011091a:	00 18                	add    %bl,(%rax)
ffff80000011091c:	18 08                	sbb    %cl,(%rax)
ffff80000011091e:	08 10                	or     %dl,(%rax)
ffff800000110920:	00 02                	add    %al,(%rdx)
ffff800000110922:	04 08                	add    $0x8,%al
ffff800000110924:	10 20                	adc    %ah,(%rax)
ffff800000110926:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000011092d:	04 
ffff80000011092e:	02 00                	add    (%rax),%al
ffff800000110930:	00 00                	add    %al,(%rax)
ffff800000110932:	00 00                	add    %al,(%rax)
ffff800000110934:	00 00                	add    %al,(%rax)
ffff800000110936:	fe 00                	incb   (%rax)
ffff800000110938:	00 fe                	add    %bh,%dh
ffff80000011093a:	00 00                	add    %al,(%rax)
ffff80000011093c:	00 00                	add    %al,(%rax)
ffff80000011093e:	00 00                	add    %al,(%rax)
ffff800000110940:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff800000110946:	04 02                	add    $0x2,%al
ffff800000110948:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000011094b:	10 20                	adc    %ah,(%rax)
ffff80000011094d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000110951:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110955:	82                   	(bad)  
ffff800000110956:	04 08                	add    $0x8,%al
ffff800000110958:	10 10                	adc    %dl,(%rax)
ffff80000011095a:	00 00                	add    %al,(%rax)
ffff80000011095c:	18 18                	sbb    %bl,(%rax)
ffff80000011095e:	00 00                	add    %al,(%rax)
ffff800000110960:	00 38                	add    %bh,(%rax)
ffff800000110962:	44 82                	rex.R (bad) 
ffff800000110964:	9a                   	(bad)  
ffff800000110965:	aa                   	stos   %al,%es:(%rdi)
ffff800000110966:	aa                   	stos   %al,%es:(%rdi)
ffff800000110967:	aa                   	stos   %al,%es:(%rdi)
ffff800000110968:	aa                   	stos   %al,%es:(%rdi)
ffff800000110969:	aa                   	stos   %al,%es:(%rdi)
ffff80000011096a:	9c                   	pushfq 
ffff80000011096b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000011096f:	00 00                	add    %al,(%rax)
ffff800000110971:	18 18                	sbb    %bl,(%rax)
ffff800000110973:	18 18                	sbb    %bl,(%rax)
ffff800000110975:	24 24                	and    $0x24,%al
ffff800000110977:	24 24                	and    $0x24,%al
ffff800000110979:	7e 42                	jle    ffff8000001109bd <interrupt+0x51d>
ffff80000011097b:	42                   	rex.X
ffff80000011097c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011097f:	00 00                	add    %al,(%rax)
ffff800000110981:	f0 48                	lock rex.W
ffff800000110983:	44                   	rex.R
ffff800000110984:	44                   	rex.R
ffff800000110985:	44                   	rex.R
ffff800000110986:	48 78 44             	rex.W js ffff8000001109cd <interrupt+0x52d>
ffff800000110989:	42                   	rex.X
ffff80000011098a:	42                   	rex.X
ffff80000011098b:	42                   	rex.X
ffff80000011098c:	44 f8                	rex.R clc 
ffff80000011098e:	00 00                	add    %al,(%rax)
ffff800000110990:	00 3a                	add    %bh,(%rdx)
ffff800000110992:	46                   	rex.RX
ffff800000110993:	42 82                	rex.X (bad) 
ffff800000110995:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000011099c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011099f:	00 00                	add    %al,(%rax)
ffff8000001109a1:	f8                   	clc    
ffff8000001109a2:	44                   	rex.R
ffff8000001109a3:	44                   	rex.R
ffff8000001109a4:	42                   	rex.X
ffff8000001109a5:	42                   	rex.X
ffff8000001109a6:	42                   	rex.X
ffff8000001109a7:	42                   	rex.X
ffff8000001109a8:	42                   	rex.X
ffff8000001109a9:	42                   	rex.X
ffff8000001109aa:	42                   	rex.X
ffff8000001109ab:	44                   	rex.R
ffff8000001109ac:	44 f8                	rex.R clc 
ffff8000001109ae:	00 00                	add    %al,(%rax)
ffff8000001109b0:	00 fe                	add    %bh,%dh
ffff8000001109b2:	42                   	rex.X
ffff8000001109b3:	42                   	rex.X
ffff8000001109b4:	40                   	rex
ffff8000001109b5:	40                   	rex
ffff8000001109b6:	44 7c 44             	rex.R jl ffff8000001109fd <interrupt+0x55d>
ffff8000001109b9:	40                   	rex
ffff8000001109ba:	40                   	rex
ffff8000001109bb:	42                   	rex.X
ffff8000001109bc:	42 fe 00             	rex.X incb (%rax)
ffff8000001109bf:	00 00                	add    %al,(%rax)
ffff8000001109c1:	fe 42 42             	incb   0x42(%rdx)
ffff8000001109c4:	40                   	rex
ffff8000001109c5:	40                   	rex
ffff8000001109c6:	44 7c 44             	rex.R jl ffff800000110a0d <interrupt+0x56d>
ffff8000001109c9:	44                   	rex.R
ffff8000001109ca:	40                   	rex
ffff8000001109cb:	40                   	rex
ffff8000001109cc:	40                   	rex
ffff8000001109cd:	f0 00 00             	lock add %al,(%rax)
ffff8000001109d0:	00 3a                	add    %bh,(%rdx)
ffff8000001109d2:	46                   	rex.RX
ffff8000001109d3:	42 82                	rex.X (bad) 
ffff8000001109d5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff8000001109dc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff8000001109df:	00 00                	add    %al,(%rax)
ffff8000001109e1:	e7 42                	out    %eax,$0x42
ffff8000001109e3:	42                   	rex.X
ffff8000001109e4:	42                   	rex.X
ffff8000001109e5:	42                   	rex.X
ffff8000001109e6:	42 7e 42             	rex.X jle ffff800000110a2b <interrupt+0x58b>
ffff8000001109e9:	42                   	rex.X
ffff8000001109ea:	42                   	rex.X
ffff8000001109eb:	42                   	rex.X
ffff8000001109ec:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001109ef:	00 00                	add    %al,(%rax)
ffff8000001109f1:	7c 10                	jl     ffff800000110a03 <interrupt+0x563>
ffff8000001109f3:	10 10                	adc    %dl,(%rax)
ffff8000001109f5:	10 10                	adc    %dl,(%rax)
ffff8000001109f7:	10 10                	adc    %dl,(%rax)
ffff8000001109f9:	10 10                	adc    %dl,(%rax)
ffff8000001109fb:	10 10                	adc    %dl,(%rax)
ffff8000001109fd:	7c 00                	jl     ffff8000001109ff <interrupt+0x55f>
ffff8000001109ff:	00 00                	add    %al,(%rax)
ffff800000110a01:	1f                   	(bad)  
ffff800000110a02:	04 04                	add    $0x4,%al
ffff800000110a04:	04 04                	add    $0x4,%al
ffff800000110a06:	04 04                	add    $0x4,%al
ffff800000110a08:	04 04                	add    $0x4,%al
ffff800000110a0a:	04 04                	add    $0x4,%al
ffff800000110a0c:	84 48 30             	test   %cl,0x30(%rax)
ffff800000110a0f:	00 00                	add    %al,(%rax)
ffff800000110a11:	e7 42                	out    %eax,$0x42
ffff800000110a13:	44                   	rex.R
ffff800000110a14:	48 50                	rex.W push %rax
ffff800000110a16:	50                   	push   %rax
ffff800000110a17:	60                   	(bad)  
ffff800000110a18:	50                   	push   %rax
ffff800000110a19:	50                   	push   %rax
ffff800000110a1a:	48                   	rex.W
ffff800000110a1b:	44                   	rex.R
ffff800000110a1c:	42 e7 00             	rex.X out %eax,$0x0
ffff800000110a1f:	00 00                	add    %al,(%rax)
ffff800000110a21:	f0 40                	lock rex
ffff800000110a23:	40                   	rex
ffff800000110a24:	40                   	rex
ffff800000110a25:	40                   	rex
ffff800000110a26:	40                   	rex
ffff800000110a27:	40                   	rex
ffff800000110a28:	40                   	rex
ffff800000110a29:	40                   	rex
ffff800000110a2a:	40                   	rex
ffff800000110a2b:	42                   	rex.X
ffff800000110a2c:	42 fe 00             	rex.X incb (%rax)
ffff800000110a2f:	00 00                	add    %al,(%rax)
ffff800000110a31:	c3                   	retq   
ffff800000110a32:	42                   	rex.X
ffff800000110a33:	66 66 66 5a          	data16 data16 pop %dx
ffff800000110a37:	5a                   	pop    %rdx
ffff800000110a38:	5a                   	pop    %rdx
ffff800000110a39:	42                   	rex.X
ffff800000110a3a:	42                   	rex.X
ffff800000110a3b:	42                   	rex.X
ffff800000110a3c:	42 e7 00             	rex.X out %eax,$0x0
ffff800000110a3f:	00 00                	add    %al,(%rax)
ffff800000110a41:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff800000110a48:	4a                   	rex.WX
ffff800000110a49:	4a                   	rex.WX
ffff800000110a4a:	4a                   	rex.WX
ffff800000110a4b:	46                   	rex.RX
ffff800000110a4c:	46 e2 00             	rex.RX loop ffff800000110a4f <interrupt+0x5af>
ffff800000110a4f:	00 00                	add    %al,(%rax)
ffff800000110a51:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110a55:	82                   	(bad)  
ffff800000110a56:	82                   	(bad)  
ffff800000110a57:	82                   	(bad)  
ffff800000110a58:	82                   	(bad)  
ffff800000110a59:	82                   	(bad)  
ffff800000110a5a:	82                   	(bad)  
ffff800000110a5b:	82                   	(bad)  
ffff800000110a5c:	44 38 00             	cmp    %r8b,(%rax)
ffff800000110a5f:	00 00                	add    %al,(%rax)
ffff800000110a61:	f8                   	clc    
ffff800000110a62:	44                   	rex.R
ffff800000110a63:	42                   	rex.X
ffff800000110a64:	42                   	rex.X
ffff800000110a65:	42                   	rex.X
ffff800000110a66:	44 78 40             	rex.R js ffff800000110aa9 <interrupt+0x609>
ffff800000110a69:	40                   	rex
ffff800000110a6a:	40                   	rex
ffff800000110a6b:	40                   	rex
ffff800000110a6c:	40                   	rex
ffff800000110a6d:	f0 00 00             	lock add %al,(%rax)
ffff800000110a70:	00 38                	add    %bh,(%rax)
ffff800000110a72:	44 82                	rex.R (bad) 
ffff800000110a74:	82                   	(bad)  
ffff800000110a75:	82                   	(bad)  
ffff800000110a76:	82                   	(bad)  
ffff800000110a77:	82                   	(bad)  
ffff800000110a78:	82                   	(bad)  
ffff800000110a79:	82                   	(bad)  
ffff800000110a7a:	92                   	xchg   %eax,%edx
ffff800000110a7b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff800000110a7f:	00 00                	add    %al,(%rax)
ffff800000110a81:	fc                   	cld    
ffff800000110a82:	42                   	rex.X
ffff800000110a83:	42                   	rex.X
ffff800000110a84:	42                   	rex.X
ffff800000110a85:	42 7c 44             	rex.X jl ffff800000110acc <interrupt+0x62c>
ffff800000110a88:	42                   	rex.X
ffff800000110a89:	42                   	rex.X
ffff800000110a8a:	42                   	rex.X
ffff800000110a8b:	42                   	rex.X
ffff800000110a8c:	42 e7 00             	rex.X out %eax,$0x0
ffff800000110a8f:	00 00                	add    %al,(%rax)
ffff800000110a91:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff800000110a94:	82                   	(bad)  
ffff800000110a95:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff800000110a99:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff800000110a9f:	00 00                	add    %al,(%rax)
ffff800000110aa1:	fe                   	(bad)  
ffff800000110aa2:	92                   	xchg   %eax,%edx
ffff800000110aa3:	92                   	xchg   %eax,%edx
ffff800000110aa4:	10 10                	adc    %dl,(%rax)
ffff800000110aa6:	10 10                	adc    %dl,(%rax)
ffff800000110aa8:	10 10                	adc    %dl,(%rax)
ffff800000110aaa:	10 10                	adc    %dl,(%rax)
ffff800000110aac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff800000110ab0:	00 e7                	add    %ah,%bh
ffff800000110ab2:	42                   	rex.X
ffff800000110ab3:	42                   	rex.X
ffff800000110ab4:	42                   	rex.X
ffff800000110ab5:	42                   	rex.X
ffff800000110ab6:	42                   	rex.X
ffff800000110ab7:	42                   	rex.X
ffff800000110ab8:	42                   	rex.X
ffff800000110ab9:	42                   	rex.X
ffff800000110aba:	42                   	rex.X
ffff800000110abb:	42 24 3c             	rex.X and $0x3c,%al
ffff800000110abe:	00 00                	add    %al,(%rax)
ffff800000110ac0:	00 e7                	add    %ah,%bh
ffff800000110ac2:	42                   	rex.X
ffff800000110ac3:	42                   	rex.X
ffff800000110ac4:	42                   	rex.X
ffff800000110ac5:	42 24 24             	rex.X and $0x24,%al
ffff800000110ac8:	24 24                	and    $0x24,%al
ffff800000110aca:	18 18                	sbb    %bl,(%rax)
ffff800000110acc:	18 18                	sbb    %bl,(%rax)
ffff800000110ace:	00 00                	add    %al,(%rax)
ffff800000110ad0:	00 e7                	add    %ah,%bh
ffff800000110ad2:	42                   	rex.X
ffff800000110ad3:	42                   	rex.X
ffff800000110ad4:	42 5a                	rex.X pop %rdx
ffff800000110ad6:	5a                   	pop    %rdx
ffff800000110ad7:	5a                   	pop    %rdx
ffff800000110ad8:	5a                   	pop    %rdx
ffff800000110ad9:	24 24                	and    $0x24,%al
ffff800000110adb:	24 24                	and    $0x24,%al
ffff800000110add:	24 00                	and    $0x0,%al
ffff800000110adf:	00 00                	add    %al,(%rax)
ffff800000110ae1:	e7 42                	out    %eax,$0x42
ffff800000110ae3:	42 24 24             	rex.X and $0x24,%al
ffff800000110ae6:	24 18                	and    $0x18,%al
ffff800000110ae8:	24 24                	and    $0x24,%al
ffff800000110aea:	24 42                	and    $0x42,%al
ffff800000110aec:	42 e7 00             	rex.X out %eax,$0x0
ffff800000110aef:	00 00                	add    %al,(%rax)
ffff800000110af1:	ee                   	out    %al,(%dx)
ffff800000110af2:	44                   	rex.R
ffff800000110af3:	44                   	rex.R
ffff800000110af4:	44 28 28             	sub    %r13b,(%rax)
ffff800000110af7:	28 10                	sub    %dl,(%rax)
ffff800000110af9:	10 10                	adc    %dl,(%rax)
ffff800000110afb:	10 10                	adc    %dl,(%rax)
ffff800000110afd:	7c 00                	jl     ffff800000110aff <interrupt+0x65f>
ffff800000110aff:	00 00                	add    %al,(%rax)
ffff800000110b01:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff800000110b08:	20 20                	and    %ah,(%rax)
ffff800000110b0a:	40                   	rex
ffff800000110b0b:	42 82                	rex.X (bad) 
ffff800000110b0d:	fe 00                	incb   (%rax)
ffff800000110b0f:	00 00                	add    %al,(%rax)
ffff800000110b11:	3e 20 20             	and    %ah,%ds:(%rax)
ffff800000110b14:	20 20                	and    %ah,(%rax)
ffff800000110b16:	20 20                	and    %ah,(%rax)
ffff800000110b18:	20 20                	and    %ah,(%rax)
ffff800000110b1a:	20 20                	and    %ah,(%rax)
ffff800000110b1c:	20 20                	and    %ah,(%rax)
ffff800000110b1e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff800000110b25:	20 20                	and    %ah,(%rax)
ffff800000110b27:	10 10                	adc    %dl,(%rax)
ffff800000110b29:	08 08                	or     %cl,(%rax)
ffff800000110b2b:	04 04                	add    $0x4,%al
ffff800000110b2d:	04 02                	add    $0x2,%al
ffff800000110b2f:	02 00                	add    (%rax),%al
ffff800000110b31:	7c 04                	jl     ffff800000110b37 <interrupt+0x697>
ffff800000110b33:	04 04                	add    $0x4,%al
ffff800000110b35:	04 04                	add    $0x4,%al
ffff800000110b37:	04 04                	add    $0x4,%al
ffff800000110b39:	04 04                	add    $0x4,%al
ffff800000110b3b:	04 04                	add    $0x4,%al
ffff800000110b3d:	04 7c                	add    $0x7c,%al
ffff800000110b3f:	00 00                	add    %al,(%rax)
ffff800000110b41:	10 28                	adc    %ch,(%rax)
ffff800000110b43:	44 82                	rex.R (bad) 
	...
ffff800000110b5d:	00 fe                	add    %bh,%dh
ffff800000110b5f:	00 10                	add    %dl,(%rax)
ffff800000110b61:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff800000110b74:	00 70 08             	add    %dh,0x8(%rax)
ffff800000110b77:	04 3c                	add    $0x3c,%al
ffff800000110b79:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff800000110b80:	c0 
ffff800000110b81:	40                   	rex
ffff800000110b82:	40                   	rex
ffff800000110b83:	40                   	rex
ffff800000110b84:	40 58                	rex pop %rax
ffff800000110b86:	64 42                	fs rex.X
ffff800000110b88:	42                   	rex.X
ffff800000110b89:	42                   	rex.X
ffff800000110b8a:	42                   	rex.X
ffff800000110b8b:	42                   	rex.X
ffff800000110b8c:	64 58                	fs pop %rax
ffff800000110b8e:	00 00                	add    %al,(%rax)
ffff800000110b90:	00 00                	add    %al,(%rax)
ffff800000110b92:	00 00                	add    %al,(%rax)
ffff800000110b94:	00 30                	add    %dh,(%rax)
ffff800000110b96:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff800000110b9d:	38 
ffff800000110b9e:	00 00                	add    %al,(%rax)
ffff800000110ba0:	0c 04                	or     $0x4,%al
ffff800000110ba2:	04 04                	add    $0x4,%al
ffff800000110ba4:	04 34                	add    $0x34,%al
ffff800000110ba6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff800000110bad:	36 
ffff800000110bae:	00 00                	add    %al,(%rax)
ffff800000110bb0:	00 00                	add    %al,(%rax)
ffff800000110bb2:	00 00                	add    %al,(%rax)
ffff800000110bb4:	00 38                	add    %bh,(%rax)
ffff800000110bb6:	44 82                	rex.R (bad) 
ffff800000110bb8:	82                   	(bad)  
ffff800000110bb9:	fc                   	cld    
ffff800000110bba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff800000110bc1:	10 10                	adc    %dl,(%rax)
ffff800000110bc3:	10 10                	adc    %dl,(%rax)
ffff800000110bc5:	7c 10                	jl     ffff800000110bd7 <interrupt+0x737>
ffff800000110bc7:	10 10                	adc    %dl,(%rax)
ffff800000110bc9:	10 10                	adc    %dl,(%rax)
ffff800000110bcb:	10 10                	adc    %dl,(%rax)
ffff800000110bcd:	7c 00                	jl     ffff800000110bcf <interrupt+0x72f>
ffff800000110bcf:	00 00                	add    %al,(%rax)
ffff800000110bd1:	00 00                	add    %al,(%rax)
ffff800000110bd3:	00 00                	add    %al,(%rax)
ffff800000110bd5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff800000110bdc:	34 04 
ffff800000110bde:	04 38                	add    $0x38,%al
ffff800000110be0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff800000110be4:	40 58                	rex pop %rax
ffff800000110be6:	64 42                	fs rex.X
ffff800000110be8:	42                   	rex.X
ffff800000110be9:	42                   	rex.X
ffff800000110bea:	42                   	rex.X
ffff800000110beb:	42                   	rex.X
ffff800000110bec:	42 e3 00             	rex.X jrcxz ffff800000110bef <interrupt+0x74f>
ffff800000110bef:	00 00                	add    %al,(%rax)
ffff800000110bf1:	10 10                	adc    %dl,(%rax)
ffff800000110bf3:	00 00                	add    %al,(%rax)
ffff800000110bf5:	30 10                	xor    %dl,(%rax)
ffff800000110bf7:	10 10                	adc    %dl,(%rax)
ffff800000110bf9:	10 10                	adc    %dl,(%rax)
ffff800000110bfb:	10 10                	adc    %dl,(%rax)
ffff800000110bfd:	38 00                	cmp    %al,(%rax)
ffff800000110bff:	00 00                	add    %al,(%rax)
ffff800000110c01:	04 04                	add    $0x4,%al
ffff800000110c03:	00 00                	add    %al,(%rax)
ffff800000110c05:	0c 04                	or     $0x4,%al
ffff800000110c07:	04 04                	add    $0x4,%al
ffff800000110c09:	04 04                	add    $0x4,%al
ffff800000110c0b:	04 04                	add    $0x4,%al
ffff800000110c0d:	08 08                	or     %cl,(%rax)
ffff800000110c0f:	30 c0                	xor    %al,%al
ffff800000110c11:	40                   	rex
ffff800000110c12:	40                   	rex
ffff800000110c13:	40                   	rex
ffff800000110c14:	40                   	rex
ffff800000110c15:	4e                   	rex.WRX
ffff800000110c16:	44                   	rex.R
ffff800000110c17:	48 50                	rex.W push %rax
ffff800000110c19:	60                   	(bad)  
ffff800000110c1a:	50                   	push   %rax
ffff800000110c1b:	48                   	rex.W
ffff800000110c1c:	44 e6 00             	rex.R out %al,$0x0
ffff800000110c1f:	00 30                	add    %dh,(%rax)
ffff800000110c21:	10 10                	adc    %dl,(%rax)
ffff800000110c23:	10 10                	adc    %dl,(%rax)
ffff800000110c25:	10 10                	adc    %dl,(%rax)
ffff800000110c27:	10 10                	adc    %dl,(%rax)
ffff800000110c29:	10 10                	adc    %dl,(%rax)
ffff800000110c2b:	10 10                	adc    %dl,(%rax)
ffff800000110c2d:	38 00                	cmp    %al,(%rax)
ffff800000110c2f:	00 00                	add    %al,(%rax)
ffff800000110c31:	00 00                	add    %al,(%rax)
ffff800000110c33:	00 00                	add    %al,(%rax)
ffff800000110c35:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff800000110c39:	49                   	rex.WB
ffff800000110c3a:	49                   	rex.WB
ffff800000110c3b:	49                   	rex.WB
ffff800000110c3c:	49 db 00             	rex.WB fildl (%r8)
ffff800000110c3f:	00 00                	add    %al,(%rax)
ffff800000110c41:	00 00                	add    %al,(%rax)
ffff800000110c43:	00 00                	add    %al,(%rax)
ffff800000110c45:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff800000110c49:	42                   	rex.X
ffff800000110c4a:	42                   	rex.X
ffff800000110c4b:	42                   	rex.X
ffff800000110c4c:	42 e3 00             	rex.X jrcxz ffff800000110c4f <interrupt+0x7af>
ffff800000110c4f:	00 00                	add    %al,(%rax)
ffff800000110c51:	00 00                	add    %al,(%rax)
ffff800000110c53:	00 00                	add    %al,(%rax)
ffff800000110c55:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000110c59:	82                   	(bad)  
ffff800000110c5a:	82                   	(bad)  
ffff800000110c5b:	82                   	(bad)  
ffff800000110c5c:	44 38 00             	cmp    %r8b,(%rax)
ffff800000110c5f:	00 00                	add    %al,(%rax)
ffff800000110c61:	00 00                	add    %al,(%rax)
ffff800000110c63:	00 d8                	add    %bl,%al
ffff800000110c65:	64 42                	fs rex.X
ffff800000110c67:	42                   	rex.X
ffff800000110c68:	42                   	rex.X
ffff800000110c69:	42                   	rex.X
ffff800000110c6a:	42                   	rex.X
ffff800000110c6b:	64 58                	fs pop %rax
ffff800000110c6d:	40                   	rex
ffff800000110c6e:	40 e0 00             	rex loopne ffff800000110c71 <interrupt+0x7d1>
ffff800000110c71:	00 00                	add    %al,(%rax)
ffff800000110c73:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff800000110c76:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff800000110c7d:	04 04                	add    $0x4,%al
ffff800000110c7f:	0e                   	(bad)  
ffff800000110c80:	00 00                	add    %al,(%rax)
ffff800000110c82:	00 00                	add    %al,(%rax)
ffff800000110c84:	00 dc                	add    %bl,%ah
ffff800000110c86:	62 42                	(bad)  
ffff800000110c88:	40                   	rex
ffff800000110c89:	40                   	rex
ffff800000110c8a:	40                   	rex
ffff800000110c8b:	40                   	rex
ffff800000110c8c:	40 e0 00             	rex loopne ffff800000110c8f <interrupt+0x7ef>
ffff800000110c8f:	00 00                	add    %al,(%rax)
ffff800000110c91:	00 00                	add    %al,(%rax)
ffff800000110c93:	00 00                	add    %al,(%rax)
ffff800000110c95:	7a 86                	jp     ffff800000110c1d <interrupt+0x77d>
ffff800000110c97:	82                   	(bad)  
ffff800000110c98:	c0 38 06             	sarb   $0x6,(%rax)
ffff800000110c9b:	82                   	(bad)  
ffff800000110c9c:	c2 bc 00             	retq   $0xbc
ffff800000110c9f:	00 00                	add    %al,(%rax)
ffff800000110ca1:	00 10                	add    %dl,(%rax)
ffff800000110ca3:	10 10                	adc    %dl,(%rax)
ffff800000110ca5:	7c 10                	jl     ffff800000110cb7 <interrupt+0x817>
ffff800000110ca7:	10 10                	adc    %dl,(%rax)
ffff800000110ca9:	10 10                	adc    %dl,(%rax)
ffff800000110cab:	10 10                	adc    %dl,(%rax)
ffff800000110cad:	0e                   	(bad)  
ffff800000110cae:	00 00                	add    %al,(%rax)
ffff800000110cb0:	00 00                	add    %al,(%rax)
ffff800000110cb2:	00 00                	add    %al,(%rax)
ffff800000110cb4:	00 c6                	add    %al,%dh
ffff800000110cb6:	42                   	rex.X
ffff800000110cb7:	42                   	rex.X
ffff800000110cb8:	42                   	rex.X
ffff800000110cb9:	42                   	rex.X
ffff800000110cba:	42                   	rex.X
ffff800000110cbb:	42                   	rex.X
ffff800000110cbc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff800000110cbf:	00 00                	add    %al,(%rax)
ffff800000110cc1:	00 00                	add    %al,(%rax)
ffff800000110cc3:	00 00                	add    %al,(%rax)
ffff800000110cc5:	e7 42                	out    %eax,$0x42
ffff800000110cc7:	42                   	rex.X
ffff800000110cc8:	42 24 24             	rex.X and $0x24,%al
ffff800000110ccb:	24 18                	and    $0x18,%al
ffff800000110ccd:	18 00                	sbb    %al,(%rax)
ffff800000110ccf:	00 00                	add    %al,(%rax)
ffff800000110cd1:	00 00                	add    %al,(%rax)
ffff800000110cd3:	00 00                	add    %al,(%rax)
ffff800000110cd5:	e7 42                	out    %eax,$0x42
ffff800000110cd7:	42 5a                	rex.X pop %rdx
ffff800000110cd9:	5a                   	pop    %rdx
ffff800000110cda:	5a                   	pop    %rdx
ffff800000110cdb:	24 24                	and    $0x24,%al
ffff800000110cdd:	24 00                	and    $0x0,%al
ffff800000110cdf:	00 00                	add    %al,(%rax)
ffff800000110ce1:	00 00                	add    %al,(%rax)
ffff800000110ce3:	00 00                	add    %al,(%rax)
ffff800000110ce5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff800000110cea:	28 28                	sub    %ch,(%rax)
ffff800000110cec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff800000110cf0:	00 00                	add    %al,(%rax)
ffff800000110cf2:	00 00                	add    %al,(%rax)
ffff800000110cf4:	00 e7                	add    %ah,%bh
ffff800000110cf6:	42                   	rex.X
ffff800000110cf7:	42 24 24             	rex.X and $0x24,%al
ffff800000110cfa:	24 18                	and    $0x18,%al
ffff800000110cfc:	18 10                	sbb    %dl,(%rax)
ffff800000110cfe:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000110d01:	00 00                	add    %al,(%rax)
ffff800000110d03:	00 00                	add    %al,(%rax)
ffff800000110d05:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff800000110d0b:	42 82                	rex.X (bad) 
ffff800000110d0d:	fe 00                	incb   (%rax)
ffff800000110d0f:	00 00                	add    %al,(%rax)
ffff800000110d11:	06                   	(bad)  
ffff800000110d12:	08 10                	or     %dl,(%rax)
ffff800000110d14:	10 10                	adc    %dl,(%rax)
ffff800000110d16:	10 60 10             	adc    %ah,0x10(%rax)
ffff800000110d19:	10 10                	adc    %dl,(%rax)
ffff800000110d1b:	10 08                	adc    %cl,(%rax)
ffff800000110d1d:	06                   	(bad)  
ffff800000110d1e:	00 00                	add    %al,(%rax)
ffff800000110d20:	10 10                	adc    %dl,(%rax)
ffff800000110d22:	10 10                	adc    %dl,(%rax)
ffff800000110d24:	10 10                	adc    %dl,(%rax)
ffff800000110d26:	10 10                	adc    %dl,(%rax)
ffff800000110d28:	10 10                	adc    %dl,(%rax)
ffff800000110d2a:	10 10                	adc    %dl,(%rax)
ffff800000110d2c:	10 10                	adc    %dl,(%rax)
ffff800000110d2e:	10 10                	adc    %dl,(%rax)
ffff800000110d30:	00 60 10             	add    %ah,0x10(%rax)
ffff800000110d33:	08 08                	or     %cl,(%rax)
ffff800000110d35:	08 08                	or     %cl,(%rax)
ffff800000110d37:	06                   	(bad)  
ffff800000110d38:	08 08                	or     %cl,(%rax)
ffff800000110d3a:	08 08                	or     %cl,(%rax)
ffff800000110d3c:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000110d3f:	00 00                	add    %al,(%rax)
ffff800000110d41:	72 8c                	jb     ffff800000110ccf <interrupt+0x82f>
	...
ffff80000011155f:	00 00                	add    %al,(%rax)
ffff800000111561:	00 12                	add    %dl,(%rdx)
ffff800000111563:	00 00                	add    %al,(%rax)
ffff800000111565:	80 ff ff             	cmp    $0xff,%bh
	...
ffff800000111570:	00 00                	add    %al,(%rax)
ffff800000111572:	12 00                	adc    (%rax),%al
ffff800000111574:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000011157a:	00 00                	add    %al,(%rax)
ffff80000011157c:	00 00                	add    %al,(%rax)
ffff80000011157e:	00 00                	add    %al,(%rax)
ffff800000111580:	10 00                	adc    %al,(%rax)
	...
ffff80000011159e:	00 00                	add    %al,(%rax)
ffff8000001115a0:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff8000001115a6:	ff                   	(bad)  
ffff8000001115a7:	ff 00                	incl   (%rax)
	...
ffff8000001115c5:	00 12                	add    %dl,(%rdx)
ffff8000001115c7:	00 00                	add    %al,(%rax)
ffff8000001115c9:	80 ff ff             	cmp    $0xff,%bh
ffff8000001115cc:	00 00                	add    %al,(%rax)
ffff8000001115ce:	12 00                	adc    (%rax),%al
ffff8000001115d0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001115d6:	12 00                	adc    (%rax),%al
ffff8000001115d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001115de:	00 00                	add    %al,(%rax)
ffff8000001115e0:	00 00                	add    %al,(%rax)
ffff8000001115e2:	00 00                	add    %al,(%rax)
ffff8000001115e4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001115e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115ee:	00 00                	add    %al,(%rax)
ffff8000001115f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115f6:	00 00                	add    %al,(%rax)
ffff8000001115f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001115fe:	00 00                	add    %al,(%rax)
ffff800000111600:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111606:	00 00                	add    %al,(%rax)
ffff800000111608:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011160e:	00 00                	add    %al,(%rax)
ffff800000111610:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111616:	00 00                	add    %al,(%rax)
ffff800000111618:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011162e:	12 00                	adc    (%rax),%al
ffff800000111630:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111636:	12 00                	adc    (%rax),%al
ffff800000111638:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011163e:	12 00                	adc    (%rax),%al
ffff800000111640:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111646:	00 00                	add    %al,(%rax)
ffff800000111648:	00 00                	add    %al,(%rax)
ffff80000011164a:	00 00                	add    %al,(%rax)
ffff80000011164c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111650:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111656:	00 00                	add    %al,(%rax)
ffff800000111658:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011165e:	00 00                	add    %al,(%rax)
ffff800000111660:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111666:	00 00                	add    %al,(%rax)
ffff800000111668:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011166e:	00 00                	add    %al,(%rax)
ffff800000111670:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111676:	00 00                	add    %al,(%rax)
ffff800000111678:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011167e:	00 00                	add    %al,(%rax)
ffff800000111680:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111696:	12 00                	adc    (%rax),%al
ffff800000111698:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011169e:	12 00                	adc    (%rax),%al
ffff8000001116a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001116a6:	12 00                	adc    (%rax),%al
ffff8000001116a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001116ae:	00 00                	add    %al,(%rax)
ffff8000001116b0:	00 00                	add    %al,(%rax)
ffff8000001116b2:	00 00                	add    %al,(%rax)
ffff8000001116b4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001116b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116be:	00 00                	add    %al,(%rax)
ffff8000001116c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116c6:	00 00                	add    %al,(%rax)
ffff8000001116c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116ce:	00 00                	add    %al,(%rax)
ffff8000001116d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116d6:	00 00                	add    %al,(%rax)
ffff8000001116d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116de:	00 00                	add    %al,(%rax)
ffff8000001116e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001116e6:	00 00                	add    %al,(%rax)
ffff8000001116e8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001116fe:	12 00                	adc    (%rax),%al
ffff800000111700:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111706:	12 00                	adc    (%rax),%al
ffff800000111708:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011170e:	12 00                	adc    (%rax),%al
ffff800000111710:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000111716:	00 00                	add    %al,(%rax)
ffff800000111718:	00 00                	add    %al,(%rax)
ffff80000011171a:	00 00                	add    %al,(%rax)
ffff80000011171c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000111720:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111726:	00 00                	add    %al,(%rax)
ffff800000111728:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011172e:	00 00                	add    %al,(%rax)
ffff800000111730:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111736:	00 00                	add    %al,(%rax)
ffff800000111738:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011173e:	00 00                	add    %al,(%rax)
ffff800000111740:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000111746:	00 00                	add    %al,(%rax)
ffff800000111748:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011174e:	00 00                	add    %al,(%rax)
ffff800000111750:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011175e:	00 00                	add    %al,(%rax)
ffff800000111760:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff800000111764:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
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
ffff800000111abc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111ac2:	10 00                	adc    %al,(%rax)
ffff800000111ac4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111aca:	10 00                	adc    %al,(%rax)
ffff800000111acc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111ad2:	10 00                	adc    %al,(%rax)
ffff800000111ad4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111ada:	10 00                	adc    %al,(%rax)
ffff800000111adc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111ae2:	10 00                	adc    %al,(%rax)
ffff800000111ae4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111aea:	10 00                	adc    %al,(%rax)
ffff800000111aec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111af2:	10 00                	adc    %al,(%rax)
ffff800000111af4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111afa:	10 00                	adc    %al,(%rax)
ffff800000111afc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b02:	10 00                	adc    %al,(%rax)
ffff800000111b04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b0a:	10 00                	adc    %al,(%rax)
ffff800000111b0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b12:	10 00                	adc    %al,(%rax)
ffff800000111b14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b1a:	10 00                	adc    %al,(%rax)
ffff800000111b1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b22:	10 00                	adc    %al,(%rax)
ffff800000111b24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b2a:	10 00                	adc    %al,(%rax)
ffff800000111b2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b32:	10 00                	adc    %al,(%rax)
ffff800000111b34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b3a:	10 00                	adc    %al,(%rax)
ffff800000111b3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b42:	10 00                	adc    %al,(%rax)
ffff800000111b44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b4a:	10 00                	adc    %al,(%rax)
ffff800000111b4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b52:	10 00                	adc    %al,(%rax)
ffff800000111b54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000111b5a:	10 00                	adc    %al,(%rax)
ffff800000111b5c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000111d6e:	00 00                	add    %al,(%rax)
ffff800000111d70:	00 10                	add    %dl,(%rax)
ffff800000111d72:	10 10                	adc    %dl,(%rax)
ffff800000111d74:	10 10                	adc    %dl,(%rax)
ffff800000111d76:	10 10                	adc    %dl,(%rax)
ffff800000111d78:	10 10                	adc    %dl,(%rax)
ffff800000111d7a:	00 00                	add    %al,(%rax)
ffff800000111d7c:	10 10                	adc    %dl,(%rax)
ffff800000111d7e:	00 00                	add    %al,(%rax)
ffff800000111d80:	28 28                	sub    %ch,(%rax)
ffff800000111d82:	28 00                	sub    %al,(%rax)
	...
ffff800000111d90:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff800000111d94:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff800000111d98:	44                   	rex.R
ffff800000111d99:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff800000111d9e:	00 00                	add    %al,(%rax)
ffff800000111da0:	10 3a                	adc    %bh,(%rdx)
ffff800000111da2:	56                   	push   %rsi
ffff800000111da3:	92                   	xchg   %eax,%edx
ffff800000111da4:	92                   	xchg   %eax,%edx
ffff800000111da5:	90                   	nop
ffff800000111da6:	50                   	push   %rax
ffff800000111da7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff800000111daa:	92                   	xchg   %eax,%edx
ffff800000111dab:	92                   	xchg   %eax,%edx
ffff800000111dac:	d4                   	(bad)  
ffff800000111dad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff800000111db2:	94                   	xchg   %eax,%esp
ffff800000111db3:	94                   	xchg   %eax,%esp
ffff800000111db4:	68 08 10 10 20       	pushq  $0x20101008
ffff800000111db9:	2c 52                	sub    $0x52,%al
ffff800000111dbb:	52                   	push   %rdx
ffff800000111dbc:	92                   	xchg   %eax,%edx
ffff800000111dbd:	8c 00                	mov    %es,(%rax)
ffff800000111dbf:	00 00                	add    %al,(%rax)
ffff800000111dc1:	70 88                	jo     ffff800000111d4b <interrupt+0x18ab>
ffff800000111dc3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff800000111dc9:	92                   	xchg   %eax,%edx
ffff800000111dca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff800000111dd1:	08 10                	or     %dl,(%rax)
	...
ffff800000111ddf:	00 02                	add    %al,(%rdx)
ffff800000111de1:	04 08                	add    $0x8,%al
ffff800000111de3:	08 10                	or     %dl,(%rax)
ffff800000111de5:	10 10                	adc    %dl,(%rax)
ffff800000111de7:	10 10                	adc    %dl,(%rax)
ffff800000111de9:	10 10                	adc    %dl,(%rax)
ffff800000111deb:	08 08                	or     %cl,(%rax)
ffff800000111ded:	04 02                	add    $0x2,%al
ffff800000111def:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff800000111df5:	10 10                	adc    %dl,(%rax)
ffff800000111df7:	10 10                	adc    %dl,(%rax)
ffff800000111df9:	10 10                	adc    %dl,(%rax)
ffff800000111dfb:	20 20                	and    %ah,(%rax)
ffff800000111dfd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000111e01:	00 00                	add    %al,(%rax)
ffff800000111e03:	00 00                	add    %al,(%rax)
ffff800000111e05:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff800000111e0b:	10 00                	adc    %al,(%rax)
	...
ffff800000111e15:	10 10                	adc    %dl,(%rax)
ffff800000111e17:	10 fe                	adc    %bh,%dh
ffff800000111e19:	10 10                	adc    %dl,(%rax)
ffff800000111e1b:	10 00                	adc    %al,(%rax)
	...
ffff800000111e29:	00 00                	add    %al,(%rax)
ffff800000111e2b:	18 18                	sbb    %bl,(%rax)
ffff800000111e2d:	08 08                	or     %cl,(%rax)
ffff800000111e2f:	10 00                	adc    %al,(%rax)
ffff800000111e31:	00 00                	add    %al,(%rax)
ffff800000111e33:	00 00                	add    %al,(%rax)
ffff800000111e35:	00 00                	add    %al,(%rax)
ffff800000111e37:	00 fe                	add    %bh,%dh
	...
ffff800000111e49:	00 00                	add    %al,(%rax)
ffff800000111e4b:	00 18                	add    %bl,(%rax)
ffff800000111e4d:	18 00                	sbb    %al,(%rax)
ffff800000111e4f:	00 02                	add    %al,(%rdx)
ffff800000111e51:	02 04 04             	add    (%rsp,%rax,1),%al
ffff800000111e54:	08 08                	or     %cl,(%rax)
ffff800000111e56:	08 10                	or     %dl,(%rax)
ffff800000111e58:	10 20                	adc    %ah,(%rax)
ffff800000111e5a:	20 40 40             	and    %al,0x40(%rax)
ffff800000111e5d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff800000111e64:	42 
ffff800000111e65:	42                   	rex.X
ffff800000111e66:	42                   	rex.X
ffff800000111e67:	42                   	rex.X
ffff800000111e68:	42                   	rex.X
ffff800000111e69:	42                   	rex.X
ffff800000111e6a:	42 24 24             	rex.X and $0x24,%al
ffff800000111e6d:	18 00                	sbb    %al,(%rax)
ffff800000111e6f:	00 00                	add    %al,(%rax)
ffff800000111e71:	08 18                	or     %bl,(%rax)
ffff800000111e73:	28 08                	sub    %cl,(%rax)
ffff800000111e75:	08 08                	or     %cl,(%rax)
ffff800000111e77:	08 08                	or     %cl,(%rax)
ffff800000111e79:	08 08                	or     %cl,(%rax)
ffff800000111e7b:	08 08                	or     %cl,(%rax)
ffff800000111e7d:	3e 00 00             	add    %al,%ds:(%rax)
ffff800000111e80:	00 18                	add    %bl,(%rax)
ffff800000111e82:	24 42                	and    $0x42,%al
ffff800000111e84:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff800000111e88:	10 20                	adc    %ah,(%rax)
ffff800000111e8a:	20 40 40             	and    %al,0x40(%rax)
ffff800000111e8d:	7e 00                	jle    ffff800000111e8f <interrupt+0x19ef>
ffff800000111e8f:	00 00                	add    %al,(%rax)
ffff800000111e91:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff800000111e94:	02 02                	add    (%rdx),%al
ffff800000111e96:	04 18                	add    $0x18,%al
ffff800000111e98:	04 02                	add    $0x2,%al
ffff800000111e9a:	02 42 24             	add    0x24(%rdx),%al
ffff800000111e9d:	18 00                	sbb    %al,(%rax)
ffff800000111e9f:	00 00                	add    %al,(%rax)
ffff800000111ea1:	0c 0c                	or     $0xc,%al
ffff800000111ea3:	0c 14                	or     $0x14,%al
ffff800000111ea5:	14 14                	adc    $0x14,%al
ffff800000111ea7:	24 24                	and    $0x24,%al
ffff800000111ea9:	44 7e 04             	rex.R jle ffff800000111eb0 <interrupt+0x1a10>
ffff800000111eac:	04 1e                	add    $0x1e,%al
ffff800000111eae:	00 00                	add    %al,(%rax)
ffff800000111eb0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff800000111eb4:	40 58                	rex pop %rax
ffff800000111eb6:	64 02 02             	add    %fs:(%rdx),%al
ffff800000111eb9:	02 02                	add    (%rdx),%al
ffff800000111ebb:	42 24 18             	rex.X and $0x18,%al
ffff800000111ebe:	00 00                	add    %al,(%rax)
ffff800000111ec0:	00 18                	add    %bl,(%rax)
ffff800000111ec2:	24 42                	and    $0x42,%al
ffff800000111ec4:	40 58                	rex pop %rax
ffff800000111ec6:	64 42                	fs rex.X
ffff800000111ec8:	42                   	rex.X
ffff800000111ec9:	42                   	rex.X
ffff800000111eca:	42                   	rex.X
ffff800000111ecb:	42 24 18             	rex.X and $0x18,%al
ffff800000111ece:	00 00                	add    %al,(%rax)
ffff800000111ed0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff800000111ed3:	42 04 04             	rex.X add $0x4,%al
ffff800000111ed6:	08 08                	or     %cl,(%rax)
ffff800000111ed8:	08 10                	or     %dl,(%rax)
ffff800000111eda:	10 10                	adc    %dl,(%rax)
ffff800000111edc:	10 38                	adc    %bh,(%rax)
ffff800000111ede:	00 00                	add    %al,(%rax)
ffff800000111ee0:	00 18                	add    %bl,(%rax)
ffff800000111ee2:	24 42                	and    $0x42,%al
ffff800000111ee4:	42                   	rex.X
ffff800000111ee5:	42 24 18             	rex.X and $0x18,%al
ffff800000111ee8:	24 42                	and    $0x42,%al
ffff800000111eea:	42                   	rex.X
ffff800000111eeb:	42 24 18             	rex.X and $0x18,%al
ffff800000111eee:	00 00                	add    %al,(%rax)
ffff800000111ef0:	00 18                	add    %bl,(%rax)
ffff800000111ef2:	24 42                	and    $0x42,%al
ffff800000111ef4:	42                   	rex.X
ffff800000111ef5:	42                   	rex.X
ffff800000111ef6:	42                   	rex.X
ffff800000111ef7:	42                   	rex.X
ffff800000111ef8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff800000111efb:	42 24 18             	rex.X and $0x18,%al
ffff800000111efe:	00 00                	add    %al,(%rax)
ffff800000111f00:	00 00                	add    %al,(%rax)
ffff800000111f02:	00 00                	add    %al,(%rax)
ffff800000111f04:	00 18                	add    %bl,(%rax)
ffff800000111f06:	18 00                	sbb    %al,(%rax)
ffff800000111f08:	00 00                	add    %al,(%rax)
ffff800000111f0a:	00 00                	add    %al,(%rax)
ffff800000111f0c:	18 18                	sbb    %bl,(%rax)
ffff800000111f0e:	00 00                	add    %al,(%rax)
ffff800000111f10:	00 00                	add    %al,(%rax)
ffff800000111f12:	00 00                	add    %al,(%rax)
ffff800000111f14:	00 18                	add    %bl,(%rax)
ffff800000111f16:	18 00                	sbb    %al,(%rax)
ffff800000111f18:	00 00                	add    %al,(%rax)
ffff800000111f1a:	00 18                	add    %bl,(%rax)
ffff800000111f1c:	18 08                	sbb    %cl,(%rax)
ffff800000111f1e:	08 10                	or     %dl,(%rax)
ffff800000111f20:	00 02                	add    %al,(%rdx)
ffff800000111f22:	04 08                	add    $0x8,%al
ffff800000111f24:	10 20                	adc    %ah,(%rax)
ffff800000111f26:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff800000111f2d:	04 
ffff800000111f2e:	02 00                	add    (%rax),%al
ffff800000111f30:	00 00                	add    %al,(%rax)
ffff800000111f32:	00 00                	add    %al,(%rax)
ffff800000111f34:	00 00                	add    %al,(%rax)
ffff800000111f36:	fe 00                	incb   (%rax)
ffff800000111f38:	00 fe                	add    %bh,%dh
ffff800000111f3a:	00 00                	add    %al,(%rax)
ffff800000111f3c:	00 00                	add    %al,(%rax)
ffff800000111f3e:	00 00                	add    %al,(%rax)
ffff800000111f40:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff800000111f46:	04 02                	add    $0x2,%al
ffff800000111f48:	02 04 08             	add    (%rax,%rcx,1),%al
ffff800000111f4b:	10 20                	adc    %ah,(%rax)
ffff800000111f4d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff800000111f51:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000111f55:	82                   	(bad)  
ffff800000111f56:	04 08                	add    $0x8,%al
ffff800000111f58:	10 10                	adc    %dl,(%rax)
ffff800000111f5a:	00 00                	add    %al,(%rax)
ffff800000111f5c:	18 18                	sbb    %bl,(%rax)
ffff800000111f5e:	00 00                	add    %al,(%rax)
ffff800000111f60:	00 38                	add    %bh,(%rax)
ffff800000111f62:	44 82                	rex.R (bad) 
ffff800000111f64:	9a                   	(bad)  
ffff800000111f65:	aa                   	stos   %al,%es:(%rdi)
ffff800000111f66:	aa                   	stos   %al,%es:(%rdi)
ffff800000111f67:	aa                   	stos   %al,%es:(%rdi)
ffff800000111f68:	aa                   	stos   %al,%es:(%rdi)
ffff800000111f69:	aa                   	stos   %al,%es:(%rdi)
ffff800000111f6a:	9c                   	pushfq 
ffff800000111f6b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff800000111f6f:	00 00                	add    %al,(%rax)
ffff800000111f71:	18 18                	sbb    %bl,(%rax)
ffff800000111f73:	18 18                	sbb    %bl,(%rax)
ffff800000111f75:	24 24                	and    $0x24,%al
ffff800000111f77:	24 24                	and    $0x24,%al
ffff800000111f79:	7e 42                	jle    ffff800000111fbd <interrupt+0x1b1d>
ffff800000111f7b:	42                   	rex.X
ffff800000111f7c:	42 e7 00             	rex.X out %eax,$0x0
ffff800000111f7f:	00 00                	add    %al,(%rax)
ffff800000111f81:	f0 48                	lock rex.W
ffff800000111f83:	44                   	rex.R
ffff800000111f84:	44                   	rex.R
ffff800000111f85:	44                   	rex.R
ffff800000111f86:	48 78 44             	rex.W js ffff800000111fcd <interrupt+0x1b2d>
ffff800000111f89:	42                   	rex.X
ffff800000111f8a:	42                   	rex.X
ffff800000111f8b:	42                   	rex.X
ffff800000111f8c:	44 f8                	rex.R clc 
ffff800000111f8e:	00 00                	add    %al,(%rax)
ffff800000111f90:	00 3a                	add    %bh,(%rdx)
ffff800000111f92:	46                   	rex.RX
ffff800000111f93:	42 82                	rex.X (bad) 
ffff800000111f95:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff800000111f9c:	44 38 00             	cmp    %r8b,(%rax)
ffff800000111f9f:	00 00                	add    %al,(%rax)
ffff800000111fa1:	f8                   	clc    
ffff800000111fa2:	44                   	rex.R
ffff800000111fa3:	44                   	rex.R
ffff800000111fa4:	42                   	rex.X
ffff800000111fa5:	42                   	rex.X
ffff800000111fa6:	42                   	rex.X
ffff800000111fa7:	42                   	rex.X
ffff800000111fa8:	42                   	rex.X
ffff800000111fa9:	42                   	rex.X
ffff800000111faa:	42                   	rex.X
ffff800000111fab:	44                   	rex.R
ffff800000111fac:	44 f8                	rex.R clc 
ffff800000111fae:	00 00                	add    %al,(%rax)
ffff800000111fb0:	00 fe                	add    %bh,%dh
ffff800000111fb2:	42                   	rex.X
ffff800000111fb3:	42                   	rex.X
ffff800000111fb4:	40                   	rex
ffff800000111fb5:	40                   	rex
ffff800000111fb6:	44 7c 44             	rex.R jl ffff800000111ffd <interrupt+0x1b5d>
ffff800000111fb9:	40                   	rex
ffff800000111fba:	40                   	rex
ffff800000111fbb:	42                   	rex.X
ffff800000111fbc:	42 fe 00             	rex.X incb (%rax)
ffff800000111fbf:	00 00                	add    %al,(%rax)
ffff800000111fc1:	fe 42 42             	incb   0x42(%rdx)
ffff800000111fc4:	40                   	rex
ffff800000111fc5:	40                   	rex
ffff800000111fc6:	44 7c 44             	rex.R jl ffff80000011200d <interrupt+0x1b6d>
ffff800000111fc9:	44                   	rex.R
ffff800000111fca:	40                   	rex
ffff800000111fcb:	40                   	rex
ffff800000111fcc:	40                   	rex
ffff800000111fcd:	f0 00 00             	lock add %al,(%rax)
ffff800000111fd0:	00 3a                	add    %bh,(%rdx)
ffff800000111fd2:	46                   	rex.RX
ffff800000111fd3:	42 82                	rex.X (bad) 
ffff800000111fd5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff800000111fdc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff800000111fdf:	00 00                	add    %al,(%rax)
ffff800000111fe1:	e7 42                	out    %eax,$0x42
ffff800000111fe3:	42                   	rex.X
ffff800000111fe4:	42                   	rex.X
ffff800000111fe5:	42                   	rex.X
ffff800000111fe6:	42 7e 42             	rex.X jle ffff80000011202b <interrupt+0x1b8b>
ffff800000111fe9:	42                   	rex.X
ffff800000111fea:	42                   	rex.X
ffff800000111feb:	42                   	rex.X
ffff800000111fec:	42 e7 00             	rex.X out %eax,$0x0
ffff800000111fef:	00 00                	add    %al,(%rax)
ffff800000111ff1:	7c 10                	jl     ffff800000112003 <interrupt+0x1b63>
ffff800000111ff3:	10 10                	adc    %dl,(%rax)
ffff800000111ff5:	10 10                	adc    %dl,(%rax)
ffff800000111ff7:	10 10                	adc    %dl,(%rax)
ffff800000111ff9:	10 10                	adc    %dl,(%rax)
ffff800000111ffb:	10 10                	adc    %dl,(%rax)
ffff800000111ffd:	7c 00                	jl     ffff800000111fff <interrupt+0x1b5f>
ffff800000111fff:	00 00                	add    %al,(%rax)
ffff800000112001:	1f                   	(bad)  
ffff800000112002:	04 04                	add    $0x4,%al
ffff800000112004:	04 04                	add    $0x4,%al
ffff800000112006:	04 04                	add    $0x4,%al
ffff800000112008:	04 04                	add    $0x4,%al
ffff80000011200a:	04 04                	add    $0x4,%al
ffff80000011200c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000011200f:	00 00                	add    %al,(%rax)
ffff800000112011:	e7 42                	out    %eax,$0x42
ffff800000112013:	44                   	rex.R
ffff800000112014:	48 50                	rex.W push %rax
ffff800000112016:	50                   	push   %rax
ffff800000112017:	60                   	(bad)  
ffff800000112018:	50                   	push   %rax
ffff800000112019:	50                   	push   %rax
ffff80000011201a:	48                   	rex.W
ffff80000011201b:	44                   	rex.R
ffff80000011201c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011201f:	00 00                	add    %al,(%rax)
ffff800000112021:	f0 40                	lock rex
ffff800000112023:	40                   	rex
ffff800000112024:	40                   	rex
ffff800000112025:	40                   	rex
ffff800000112026:	40                   	rex
ffff800000112027:	40                   	rex
ffff800000112028:	40                   	rex
ffff800000112029:	40                   	rex
ffff80000011202a:	40                   	rex
ffff80000011202b:	42                   	rex.X
ffff80000011202c:	42 fe 00             	rex.X incb (%rax)
ffff80000011202f:	00 00                	add    %al,(%rax)
ffff800000112031:	c3                   	retq   
ffff800000112032:	42                   	rex.X
ffff800000112033:	66 66 66 5a          	data16 data16 pop %dx
ffff800000112037:	5a                   	pop    %rdx
ffff800000112038:	5a                   	pop    %rdx
ffff800000112039:	42                   	rex.X
ffff80000011203a:	42                   	rex.X
ffff80000011203b:	42                   	rex.X
ffff80000011203c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011203f:	00 00                	add    %al,(%rax)
ffff800000112041:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff800000112048:	4a                   	rex.WX
ffff800000112049:	4a                   	rex.WX
ffff80000011204a:	4a                   	rex.WX
ffff80000011204b:	46                   	rex.RX
ffff80000011204c:	46 e2 00             	rex.RX loop ffff80000011204f <interrupt+0x1baf>
ffff80000011204f:	00 00                	add    %al,(%rax)
ffff800000112051:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000112055:	82                   	(bad)  
ffff800000112056:	82                   	(bad)  
ffff800000112057:	82                   	(bad)  
ffff800000112058:	82                   	(bad)  
ffff800000112059:	82                   	(bad)  
ffff80000011205a:	82                   	(bad)  
ffff80000011205b:	82                   	(bad)  
ffff80000011205c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011205f:	00 00                	add    %al,(%rax)
ffff800000112061:	f8                   	clc    
ffff800000112062:	44                   	rex.R
ffff800000112063:	42                   	rex.X
ffff800000112064:	42                   	rex.X
ffff800000112065:	42                   	rex.X
ffff800000112066:	44 78 40             	rex.R js ffff8000001120a9 <interrupt+0x1c09>
ffff800000112069:	40                   	rex
ffff80000011206a:	40                   	rex
ffff80000011206b:	40                   	rex
ffff80000011206c:	40                   	rex
ffff80000011206d:	f0 00 00             	lock add %al,(%rax)
ffff800000112070:	00 38                	add    %bh,(%rax)
ffff800000112072:	44 82                	rex.R (bad) 
ffff800000112074:	82                   	(bad)  
ffff800000112075:	82                   	(bad)  
ffff800000112076:	82                   	(bad)  
ffff800000112077:	82                   	(bad)  
ffff800000112078:	82                   	(bad)  
ffff800000112079:	82                   	(bad)  
ffff80000011207a:	92                   	xchg   %eax,%edx
ffff80000011207b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000011207f:	00 00                	add    %al,(%rax)
ffff800000112081:	fc                   	cld    
ffff800000112082:	42                   	rex.X
ffff800000112083:	42                   	rex.X
ffff800000112084:	42                   	rex.X
ffff800000112085:	42 7c 44             	rex.X jl ffff8000001120cc <interrupt+0x1c2c>
ffff800000112088:	42                   	rex.X
ffff800000112089:	42                   	rex.X
ffff80000011208a:	42                   	rex.X
ffff80000011208b:	42                   	rex.X
ffff80000011208c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000011208f:	00 00                	add    %al,(%rax)
ffff800000112091:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff800000112094:	82                   	(bad)  
ffff800000112095:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff800000112099:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000011209f:	00 00                	add    %al,(%rax)
ffff8000001120a1:	fe                   	(bad)  
ffff8000001120a2:	92                   	xchg   %eax,%edx
ffff8000001120a3:	92                   	xchg   %eax,%edx
ffff8000001120a4:	10 10                	adc    %dl,(%rax)
ffff8000001120a6:	10 10                	adc    %dl,(%rax)
ffff8000001120a8:	10 10                	adc    %dl,(%rax)
ffff8000001120aa:	10 10                	adc    %dl,(%rax)
ffff8000001120ac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff8000001120b0:	00 e7                	add    %ah,%bh
ffff8000001120b2:	42                   	rex.X
ffff8000001120b3:	42                   	rex.X
ffff8000001120b4:	42                   	rex.X
ffff8000001120b5:	42                   	rex.X
ffff8000001120b6:	42                   	rex.X
ffff8000001120b7:	42                   	rex.X
ffff8000001120b8:	42                   	rex.X
ffff8000001120b9:	42                   	rex.X
ffff8000001120ba:	42                   	rex.X
ffff8000001120bb:	42 24 3c             	rex.X and $0x3c,%al
ffff8000001120be:	00 00                	add    %al,(%rax)
ffff8000001120c0:	00 e7                	add    %ah,%bh
ffff8000001120c2:	42                   	rex.X
ffff8000001120c3:	42                   	rex.X
ffff8000001120c4:	42                   	rex.X
ffff8000001120c5:	42 24 24             	rex.X and $0x24,%al
ffff8000001120c8:	24 24                	and    $0x24,%al
ffff8000001120ca:	18 18                	sbb    %bl,(%rax)
ffff8000001120cc:	18 18                	sbb    %bl,(%rax)
ffff8000001120ce:	00 00                	add    %al,(%rax)
ffff8000001120d0:	00 e7                	add    %ah,%bh
ffff8000001120d2:	42                   	rex.X
ffff8000001120d3:	42                   	rex.X
ffff8000001120d4:	42 5a                	rex.X pop %rdx
ffff8000001120d6:	5a                   	pop    %rdx
ffff8000001120d7:	5a                   	pop    %rdx
ffff8000001120d8:	5a                   	pop    %rdx
ffff8000001120d9:	24 24                	and    $0x24,%al
ffff8000001120db:	24 24                	and    $0x24,%al
ffff8000001120dd:	24 00                	and    $0x0,%al
ffff8000001120df:	00 00                	add    %al,(%rax)
ffff8000001120e1:	e7 42                	out    %eax,$0x42
ffff8000001120e3:	42 24 24             	rex.X and $0x24,%al
ffff8000001120e6:	24 18                	and    $0x18,%al
ffff8000001120e8:	24 24                	and    $0x24,%al
ffff8000001120ea:	24 42                	and    $0x42,%al
ffff8000001120ec:	42 e7 00             	rex.X out %eax,$0x0
ffff8000001120ef:	00 00                	add    %al,(%rax)
ffff8000001120f1:	ee                   	out    %al,(%dx)
ffff8000001120f2:	44                   	rex.R
ffff8000001120f3:	44                   	rex.R
ffff8000001120f4:	44 28 28             	sub    %r13b,(%rax)
ffff8000001120f7:	28 10                	sub    %dl,(%rax)
ffff8000001120f9:	10 10                	adc    %dl,(%rax)
ffff8000001120fb:	10 10                	adc    %dl,(%rax)
ffff8000001120fd:	7c 00                	jl     ffff8000001120ff <interrupt+0x1c5f>
ffff8000001120ff:	00 00                	add    %al,(%rax)
ffff800000112101:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff800000112108:	20 20                	and    %ah,(%rax)
ffff80000011210a:	40                   	rex
ffff80000011210b:	42 82                	rex.X (bad) 
ffff80000011210d:	fe 00                	incb   (%rax)
ffff80000011210f:	00 00                	add    %al,(%rax)
ffff800000112111:	3e 20 20             	and    %ah,%ds:(%rax)
ffff800000112114:	20 20                	and    %ah,(%rax)
ffff800000112116:	20 20                	and    %ah,(%rax)
ffff800000112118:	20 20                	and    %ah,(%rax)
ffff80000011211a:	20 20                	and    %ah,(%rax)
ffff80000011211c:	20 20                	and    %ah,(%rax)
ffff80000011211e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff800000112125:	20 20                	and    %ah,(%rax)
ffff800000112127:	10 10                	adc    %dl,(%rax)
ffff800000112129:	08 08                	or     %cl,(%rax)
ffff80000011212b:	04 04                	add    $0x4,%al
ffff80000011212d:	04 02                	add    $0x2,%al
ffff80000011212f:	02 00                	add    (%rax),%al
ffff800000112131:	7c 04                	jl     ffff800000112137 <interrupt+0x1c97>
ffff800000112133:	04 04                	add    $0x4,%al
ffff800000112135:	04 04                	add    $0x4,%al
ffff800000112137:	04 04                	add    $0x4,%al
ffff800000112139:	04 04                	add    $0x4,%al
ffff80000011213b:	04 04                	add    $0x4,%al
ffff80000011213d:	04 7c                	add    $0x7c,%al
ffff80000011213f:	00 00                	add    %al,(%rax)
ffff800000112141:	10 28                	adc    %ch,(%rax)
ffff800000112143:	44 82                	rex.R (bad) 
	...
ffff80000011215d:	00 fe                	add    %bh,%dh
ffff80000011215f:	00 10                	add    %dl,(%rax)
ffff800000112161:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff800000112174:	00 70 08             	add    %dh,0x8(%rax)
ffff800000112177:	04 3c                	add    $0x3c,%al
ffff800000112179:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff800000112180:	c0 
ffff800000112181:	40                   	rex
ffff800000112182:	40                   	rex
ffff800000112183:	40                   	rex
ffff800000112184:	40 58                	rex pop %rax
ffff800000112186:	64 42                	fs rex.X
ffff800000112188:	42                   	rex.X
ffff800000112189:	42                   	rex.X
ffff80000011218a:	42                   	rex.X
ffff80000011218b:	42                   	rex.X
ffff80000011218c:	64 58                	fs pop %rax
ffff80000011218e:	00 00                	add    %al,(%rax)
ffff800000112190:	00 00                	add    %al,(%rax)
ffff800000112192:	00 00                	add    %al,(%rax)
ffff800000112194:	00 30                	add    %dh,(%rax)
ffff800000112196:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000011219d:	38 
ffff80000011219e:	00 00                	add    %al,(%rax)
ffff8000001121a0:	0c 04                	or     $0x4,%al
ffff8000001121a2:	04 04                	add    $0x4,%al
ffff8000001121a4:	04 34                	add    $0x34,%al
ffff8000001121a6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff8000001121ad:	36 
ffff8000001121ae:	00 00                	add    %al,(%rax)
ffff8000001121b0:	00 00                	add    %al,(%rax)
ffff8000001121b2:	00 00                	add    %al,(%rax)
ffff8000001121b4:	00 38                	add    %bh,(%rax)
ffff8000001121b6:	44 82                	rex.R (bad) 
ffff8000001121b8:	82                   	(bad)  
ffff8000001121b9:	fc                   	cld    
ffff8000001121ba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff8000001121c1:	10 10                	adc    %dl,(%rax)
ffff8000001121c3:	10 10                	adc    %dl,(%rax)
ffff8000001121c5:	7c 10                	jl     ffff8000001121d7 <interrupt+0x1d37>
ffff8000001121c7:	10 10                	adc    %dl,(%rax)
ffff8000001121c9:	10 10                	adc    %dl,(%rax)
ffff8000001121cb:	10 10                	adc    %dl,(%rax)
ffff8000001121cd:	7c 00                	jl     ffff8000001121cf <interrupt+0x1d2f>
ffff8000001121cf:	00 00                	add    %al,(%rax)
ffff8000001121d1:	00 00                	add    %al,(%rax)
ffff8000001121d3:	00 00                	add    %al,(%rax)
ffff8000001121d5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff8000001121dc:	34 04 
ffff8000001121de:	04 38                	add    $0x38,%al
ffff8000001121e0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff8000001121e4:	40 58                	rex pop %rax
ffff8000001121e6:	64 42                	fs rex.X
ffff8000001121e8:	42                   	rex.X
ffff8000001121e9:	42                   	rex.X
ffff8000001121ea:	42                   	rex.X
ffff8000001121eb:	42                   	rex.X
ffff8000001121ec:	42 e3 00             	rex.X jrcxz ffff8000001121ef <interrupt+0x1d4f>
ffff8000001121ef:	00 00                	add    %al,(%rax)
ffff8000001121f1:	10 10                	adc    %dl,(%rax)
ffff8000001121f3:	00 00                	add    %al,(%rax)
ffff8000001121f5:	30 10                	xor    %dl,(%rax)
ffff8000001121f7:	10 10                	adc    %dl,(%rax)
ffff8000001121f9:	10 10                	adc    %dl,(%rax)
ffff8000001121fb:	10 10                	adc    %dl,(%rax)
ffff8000001121fd:	38 00                	cmp    %al,(%rax)
ffff8000001121ff:	00 00                	add    %al,(%rax)
ffff800000112201:	04 04                	add    $0x4,%al
ffff800000112203:	00 00                	add    %al,(%rax)
ffff800000112205:	0c 04                	or     $0x4,%al
ffff800000112207:	04 04                	add    $0x4,%al
ffff800000112209:	04 04                	add    $0x4,%al
ffff80000011220b:	04 04                	add    $0x4,%al
ffff80000011220d:	08 08                	or     %cl,(%rax)
ffff80000011220f:	30 c0                	xor    %al,%al
ffff800000112211:	40                   	rex
ffff800000112212:	40                   	rex
ffff800000112213:	40                   	rex
ffff800000112214:	40                   	rex
ffff800000112215:	4e                   	rex.WRX
ffff800000112216:	44                   	rex.R
ffff800000112217:	48 50                	rex.W push %rax
ffff800000112219:	60                   	(bad)  
ffff80000011221a:	50                   	push   %rax
ffff80000011221b:	48                   	rex.W
ffff80000011221c:	44 e6 00             	rex.R out %al,$0x0
ffff80000011221f:	00 30                	add    %dh,(%rax)
ffff800000112221:	10 10                	adc    %dl,(%rax)
ffff800000112223:	10 10                	adc    %dl,(%rax)
ffff800000112225:	10 10                	adc    %dl,(%rax)
ffff800000112227:	10 10                	adc    %dl,(%rax)
ffff800000112229:	10 10                	adc    %dl,(%rax)
ffff80000011222b:	10 10                	adc    %dl,(%rax)
ffff80000011222d:	38 00                	cmp    %al,(%rax)
ffff80000011222f:	00 00                	add    %al,(%rax)
ffff800000112231:	00 00                	add    %al,(%rax)
ffff800000112233:	00 00                	add    %al,(%rax)
ffff800000112235:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff800000112239:	49                   	rex.WB
ffff80000011223a:	49                   	rex.WB
ffff80000011223b:	49                   	rex.WB
ffff80000011223c:	49 db 00             	rex.WB fildl (%r8)
ffff80000011223f:	00 00                	add    %al,(%rax)
ffff800000112241:	00 00                	add    %al,(%rax)
ffff800000112243:	00 00                	add    %al,(%rax)
ffff800000112245:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff800000112249:	42                   	rex.X
ffff80000011224a:	42                   	rex.X
ffff80000011224b:	42                   	rex.X
ffff80000011224c:	42 e3 00             	rex.X jrcxz ffff80000011224f <interrupt+0x1daf>
ffff80000011224f:	00 00                	add    %al,(%rax)
ffff800000112251:	00 00                	add    %al,(%rax)
ffff800000112253:	00 00                	add    %al,(%rax)
ffff800000112255:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff800000112259:	82                   	(bad)  
ffff80000011225a:	82                   	(bad)  
ffff80000011225b:	82                   	(bad)  
ffff80000011225c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000011225f:	00 00                	add    %al,(%rax)
ffff800000112261:	00 00                	add    %al,(%rax)
ffff800000112263:	00 d8                	add    %bl,%al
ffff800000112265:	64 42                	fs rex.X
ffff800000112267:	42                   	rex.X
ffff800000112268:	42                   	rex.X
ffff800000112269:	42                   	rex.X
ffff80000011226a:	42                   	rex.X
ffff80000011226b:	64 58                	fs pop %rax
ffff80000011226d:	40                   	rex
ffff80000011226e:	40 e0 00             	rex loopne ffff800000112271 <interrupt+0x1dd1>
ffff800000112271:	00 00                	add    %al,(%rax)
ffff800000112273:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff800000112276:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000011227d:	04 04                	add    $0x4,%al
ffff80000011227f:	0e                   	(bad)  
ffff800000112280:	00 00                	add    %al,(%rax)
ffff800000112282:	00 00                	add    %al,(%rax)
ffff800000112284:	00 dc                	add    %bl,%ah
ffff800000112286:	62 42                	(bad)  
ffff800000112288:	40                   	rex
ffff800000112289:	40                   	rex
ffff80000011228a:	40                   	rex
ffff80000011228b:	40                   	rex
ffff80000011228c:	40 e0 00             	rex loopne ffff80000011228f <interrupt+0x1def>
ffff80000011228f:	00 00                	add    %al,(%rax)
ffff800000112291:	00 00                	add    %al,(%rax)
ffff800000112293:	00 00                	add    %al,(%rax)
ffff800000112295:	7a 86                	jp     ffff80000011221d <interrupt+0x1d7d>
ffff800000112297:	82                   	(bad)  
ffff800000112298:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000011229b:	82                   	(bad)  
ffff80000011229c:	c2 bc 00             	retq   $0xbc
ffff80000011229f:	00 00                	add    %al,(%rax)
ffff8000001122a1:	00 10                	add    %dl,(%rax)
ffff8000001122a3:	10 10                	adc    %dl,(%rax)
ffff8000001122a5:	7c 10                	jl     ffff8000001122b7 <interrupt+0x1e17>
ffff8000001122a7:	10 10                	adc    %dl,(%rax)
ffff8000001122a9:	10 10                	adc    %dl,(%rax)
ffff8000001122ab:	10 10                	adc    %dl,(%rax)
ffff8000001122ad:	0e                   	(bad)  
ffff8000001122ae:	00 00                	add    %al,(%rax)
ffff8000001122b0:	00 00                	add    %al,(%rax)
ffff8000001122b2:	00 00                	add    %al,(%rax)
ffff8000001122b4:	00 c6                	add    %al,%dh
ffff8000001122b6:	42                   	rex.X
ffff8000001122b7:	42                   	rex.X
ffff8000001122b8:	42                   	rex.X
ffff8000001122b9:	42                   	rex.X
ffff8000001122ba:	42                   	rex.X
ffff8000001122bb:	42                   	rex.X
ffff8000001122bc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff8000001122bf:	00 00                	add    %al,(%rax)
ffff8000001122c1:	00 00                	add    %al,(%rax)
ffff8000001122c3:	00 00                	add    %al,(%rax)
ffff8000001122c5:	e7 42                	out    %eax,$0x42
ffff8000001122c7:	42                   	rex.X
ffff8000001122c8:	42 24 24             	rex.X and $0x24,%al
ffff8000001122cb:	24 18                	and    $0x18,%al
ffff8000001122cd:	18 00                	sbb    %al,(%rax)
ffff8000001122cf:	00 00                	add    %al,(%rax)
ffff8000001122d1:	00 00                	add    %al,(%rax)
ffff8000001122d3:	00 00                	add    %al,(%rax)
ffff8000001122d5:	e7 42                	out    %eax,$0x42
ffff8000001122d7:	42 5a                	rex.X pop %rdx
ffff8000001122d9:	5a                   	pop    %rdx
ffff8000001122da:	5a                   	pop    %rdx
ffff8000001122db:	24 24                	and    $0x24,%al
ffff8000001122dd:	24 00                	and    $0x0,%al
ffff8000001122df:	00 00                	add    %al,(%rax)
ffff8000001122e1:	00 00                	add    %al,(%rax)
ffff8000001122e3:	00 00                	add    %al,(%rax)
ffff8000001122e5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff8000001122ea:	28 28                	sub    %ch,(%rax)
ffff8000001122ec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff8000001122f0:	00 00                	add    %al,(%rax)
ffff8000001122f2:	00 00                	add    %al,(%rax)
ffff8000001122f4:	00 e7                	add    %ah,%bh
ffff8000001122f6:	42                   	rex.X
ffff8000001122f7:	42 24 24             	rex.X and $0x24,%al
ffff8000001122fa:	24 18                	and    $0x18,%al
ffff8000001122fc:	18 10                	sbb    %dl,(%rax)
ffff8000001122fe:	10 60 00             	adc    %ah,0x0(%rax)
ffff800000112301:	00 00                	add    %al,(%rax)
ffff800000112303:	00 00                	add    %al,(%rax)
ffff800000112305:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000011230b:	42 82                	rex.X (bad) 
ffff80000011230d:	fe 00                	incb   (%rax)
ffff80000011230f:	00 00                	add    %al,(%rax)
ffff800000112311:	06                   	(bad)  
ffff800000112312:	08 10                	or     %dl,(%rax)
ffff800000112314:	10 10                	adc    %dl,(%rax)
ffff800000112316:	10 60 10             	adc    %ah,0x10(%rax)
ffff800000112319:	10 10                	adc    %dl,(%rax)
ffff80000011231b:	10 08                	adc    %cl,(%rax)
ffff80000011231d:	06                   	(bad)  
ffff80000011231e:	00 00                	add    %al,(%rax)
ffff800000112320:	10 10                	adc    %dl,(%rax)
ffff800000112322:	10 10                	adc    %dl,(%rax)
ffff800000112324:	10 10                	adc    %dl,(%rax)
ffff800000112326:	10 10                	adc    %dl,(%rax)
ffff800000112328:	10 10                	adc    %dl,(%rax)
ffff80000011232a:	10 10                	adc    %dl,(%rax)
ffff80000011232c:	10 10                	adc    %dl,(%rax)
ffff80000011232e:	10 10                	adc    %dl,(%rax)
ffff800000112330:	00 60 10             	add    %ah,0x10(%rax)
ffff800000112333:	08 08                	or     %cl,(%rax)
ffff800000112335:	08 08                	or     %cl,(%rax)
ffff800000112337:	06                   	(bad)  
ffff800000112338:	08 08                	or     %cl,(%rax)
ffff80000011233a:	08 08                	or     %cl,(%rax)
ffff80000011233c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000011233f:	00 00                	add    %al,(%rax)
ffff800000112341:	72 8c                	jb     ffff8000001122cf <interrupt+0x1e2f>
	...

Disassembly of section .rodata:

ffff800000112b60 <_rodata>:
ffff800000112b60:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112b61:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112b62:	5f                   	pop    %rdi
ffff800000112b63:	73 79                	jae    ffff800000112bde <_rodata+0x7e>
ffff800000112b65:	73 74                	jae    ffff800000112bdb <_rodata+0x7b>
ffff800000112b67:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000112b69:	5f                   	pop    %rdi
ffff800000112b6a:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000112b6d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112b6e:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000112b71:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000112b74:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112b75:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112b76:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000112b7d:	25 23 30 34 78       	and    $0x78343023,%eax
ffff800000112b82:	0a 00                	or     (%rax),%al
ffff800000112b84:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112b85:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000112b87:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112b88:	72 79                	jb     ffff800000112c03 <_rodata+0xa3>
ffff800000112b8a:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000112b8d:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
ffff800000112b94:	74 
ffff800000112b95:	65 72 72             	gs jb  ffff800000112c0a <_rodata+0xaa>
ffff800000112b98:	75 70                	jne    ffff800000112c0a <_rodata+0xaa>
ffff800000112b9a:	74 20                	je     ffff800000112bbc <_rodata+0x5c>
ffff800000112b9c:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000112ba3:	74 61                	je     ffff800000112c06 <_rodata+0xa6>
ffff800000112ba5:	73 6b                	jae    ffff800000112c12 <_rodata+0xb2>
ffff800000112ba7:	5f                   	pop    %rdi
ffff800000112ba8:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000112baf:	00 30                	add    %dh,(%rax)
ffff800000112bb1:	31 32                	xor    %esi,(%rdx)
ffff800000112bb3:	33 34 35 36 37 38 39 	xor    0x39383736(,%rsi,1),%esi
ffff800000112bba:	41                   	rex.B
ffff800000112bbb:	42                   	rex.X
ffff800000112bbc:	43                   	rex.XB
ffff800000112bbd:	44                   	rex.R
ffff800000112bbe:	45                   	rex.RB
ffff800000112bbf:	46                   	rex.RX
ffff800000112bc0:	47                   	rex.RXB
ffff800000112bc1:	48                   	rex.W
ffff800000112bc2:	49                   	rex.WB
ffff800000112bc3:	4a                   	rex.WX
ffff800000112bc4:	4b                   	rex.WXB
ffff800000112bc5:	4c                   	rex.WR
ffff800000112bc6:	4d                   	rex.WRB
ffff800000112bc7:	4e                   	rex.WRX
ffff800000112bc8:	4f 50                	rex.WRXB push %r8
ffff800000112bca:	51                   	push   %rcx
ffff800000112bcb:	52                   	push   %rdx
ffff800000112bcc:	53                   	push   %rbx
ffff800000112bcd:	54                   	push   %rsp
ffff800000112bce:	55                   	push   %rbp
ffff800000112bcf:	56                   	push   %rsi
ffff800000112bd0:	57                   	push   %rdi
ffff800000112bd1:	58                   	pop    %rax
ffff800000112bd2:	59                   	pop    %rcx
ffff800000112bd3:	5a                   	pop    %rdx
ffff800000112bd4:	00 00                	add    %al,(%rax)
ffff800000112bd6:	00 00                	add    %al,(%rax)
ffff800000112bd8:	30 31                	xor    %dh,(%rcx)
ffff800000112bda:	32 33                	xor    (%rbx),%dh
ffff800000112bdc:	34 35                	xor    $0x35,%al
ffff800000112bde:	36 37                	ss (bad) 
ffff800000112be0:	38 39                	cmp    %bh,(%rcx)
ffff800000112be2:	61                   	(bad)  
ffff800000112be3:	62 63 64 65 66       	(bad)
ffff800000112be8:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
ffff800000112bee:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112bef:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112bf0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112bf1:	70 71                	jo     ffff800000112c64 <_rodata+0x104>
ffff800000112bf3:	72 73                	jb     ffff800000112c68 <_rodata+0x108>
ffff800000112bf5:	74 75                	je     ffff800000112c6c <_rodata+0x10c>
ffff800000112bf7:	76 77                	jbe    ffff800000112c70 <_rodata+0x110>
ffff800000112bf9:	78 79                	js     ffff800000112c74 <_rodata+0x114>
ffff800000112bfb:	7a 00                	jp     ffff800000112bfd <_rodata+0x9d>
ffff800000112bfd:	00 00                	add    %al,(%rax)
ffff800000112bff:	00 cf                	add    %cl,%bh
ffff800000112c01:	4a 10 00             	rex.WX adc %al,(%rax)
ffff800000112c04:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c0a:	10 00                	adc    %al,(%rax)
ffff800000112c0c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c12:	10 00                	adc    %al,(%rax)
ffff800000112c14:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000112c1a:	10 00                	adc    %al,(%rax)
ffff800000112c1c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c22:	10 00                	adc    %al,(%rax)
ffff800000112c24:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c2a:	10 00                	adc    %al,(%rax)
ffff800000112c2c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c32:	10 00                	adc    %al,(%rax)
ffff800000112c34:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c3a:	10 00                	adc    %al,(%rax)
ffff800000112c3c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c42:	10 00                	adc    %al,(%rax)
ffff800000112c44:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c4a:	10 00                	adc    %al,(%rax)
ffff800000112c4c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c52:	10 00                	adc    %al,(%rax)
ffff800000112c54:	00 80 ff ff c9 4a    	add    %al,0x4ac9ffff(%rax)
ffff800000112c5a:	10 00                	adc    %al,(%rax)
ffff800000112c5c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c62:	10 00                	adc    %al,(%rax)
ffff800000112c64:	00 80 ff ff c3 4a    	add    %al,0x4ac3ffff(%rax)
ffff800000112c6a:	10 00                	adc    %al,(%rax)
ffff800000112c6c:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c72:	10 00                	adc    %al,(%rax)
ffff800000112c74:	00 80 ff ff e1 4a    	add    %al,0x4ae1ffff(%rax)
ffff800000112c7a:	10 00                	adc    %al,(%rax)
ffff800000112c7c:	00 80 ff ff db 4a    	add    %al,0x4adbffff(%rax)
ffff800000112c82:	10 00                	adc    %al,(%rax)
ffff800000112c84:	00 80 ff ff ba 52    	add    %al,0x52baffff(%rax)
ffff800000112c8a:	10 00                	adc    %al,(%rax)
ffff800000112c8c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112c92:	10 00                	adc    %al,(%rax)
ffff800000112c94:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112c9a:	10 00                	adc    %al,(%rax)
ffff800000112c9c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112ca2:	10 00                	adc    %al,(%rax)
ffff800000112ca4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112caa:	10 00                	adc    %al,(%rax)
ffff800000112cac:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cb2:	10 00                	adc    %al,(%rax)
ffff800000112cb4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cba:	10 00                	adc    %al,(%rax)
ffff800000112cbc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cc2:	10 00                	adc    %al,(%rax)
ffff800000112cc4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cca:	10 00                	adc    %al,(%rax)
ffff800000112ccc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cd2:	10 00                	adc    %al,(%rax)
ffff800000112cd4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cda:	10 00                	adc    %al,(%rax)
ffff800000112cdc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112ce2:	10 00                	adc    %al,(%rax)
ffff800000112ce4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cea:	10 00                	adc    %al,(%rax)
ffff800000112cec:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cf2:	10 00                	adc    %al,(%rax)
ffff800000112cf4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112cfa:	10 00                	adc    %al,(%rax)
ffff800000112cfc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d02:	10 00                	adc    %al,(%rax)
ffff800000112d04:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d0a:	10 00                	adc    %al,(%rax)
ffff800000112d0c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d12:	10 00                	adc    %al,(%rax)
ffff800000112d14:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d1a:	10 00                	adc    %al,(%rax)
ffff800000112d1c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d22:	10 00                	adc    %al,(%rax)
ffff800000112d24:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d2a:	10 00                	adc    %al,(%rax)
ffff800000112d2c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d32:	10 00                	adc    %al,(%rax)
ffff800000112d34:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d3a:	10 00                	adc    %al,(%rax)
ffff800000112d3c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d42:	10 00                	adc    %al,(%rax)
ffff800000112d44:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d4a:	10 00                	adc    %al,(%rax)
ffff800000112d4c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d52:	10 00                	adc    %al,(%rax)
ffff800000112d54:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d5a:	10 00                	adc    %al,(%rax)
ffff800000112d5c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d62:	10 00                	adc    %al,(%rax)
ffff800000112d64:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d6a:	10 00                	adc    %al,(%rax)
ffff800000112d6c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d72:	10 00                	adc    %al,(%rax)
ffff800000112d74:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d7a:	10 00                	adc    %al,(%rax)
ffff800000112d7c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d82:	10 00                	adc    %al,(%rax)
ffff800000112d84:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d8a:	10 00                	adc    %al,(%rax)
ffff800000112d8c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d92:	10 00                	adc    %al,(%rax)
ffff800000112d94:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112d9a:	10 00                	adc    %al,(%rax)
ffff800000112d9c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112da2:	10 00                	adc    %al,(%rax)
ffff800000112da4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112daa:	10 00                	adc    %al,(%rax)
ffff800000112dac:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112db2:	10 00                	adc    %al,(%rax)
ffff800000112db4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dba:	10 00                	adc    %al,(%rax)
ffff800000112dbc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dc2:	10 00                	adc    %al,(%rax)
ffff800000112dc4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dca:	10 00                	adc    %al,(%rax)
ffff800000112dcc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dd2:	10 00                	adc    %al,(%rax)
ffff800000112dd4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dda:	10 00                	adc    %al,(%rax)
ffff800000112ddc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112de2:	10 00                	adc    %al,(%rax)
ffff800000112de4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dea:	10 00                	adc    %al,(%rax)
ffff800000112dec:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112df2:	10 00                	adc    %al,(%rax)
ffff800000112df4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112dfa:	10 00                	adc    %al,(%rax)
ffff800000112dfc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e02:	10 00                	adc    %al,(%rax)
ffff800000112e04:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e0a:	10 00                	adc    %al,(%rax)
ffff800000112e0c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e12:	10 00                	adc    %al,(%rax)
ffff800000112e14:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e1a:	10 00                	adc    %al,(%rax)
ffff800000112e1c:	00 80 ff ff f3 4f    	add    %al,0x4ff3ffff(%rax)
ffff800000112e22:	10 00                	adc    %al,(%rax)
ffff800000112e24:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e2a:	10 00                	adc    %al,(%rax)
ffff800000112e2c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e32:	10 00                	adc    %al,(%rax)
ffff800000112e34:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e3a:	10 00                	adc    %al,(%rax)
ffff800000112e3c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e42:	10 00                	adc    %al,(%rax)
ffff800000112e44:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e4a:	10 00                	adc    %al,(%rax)
ffff800000112e4c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e52:	10 00                	adc    %al,(%rax)
ffff800000112e54:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e5a:	10 00                	adc    %al,(%rax)
ffff800000112e5c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e62:	10 00                	adc    %al,(%rax)
ffff800000112e64:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e6a:	10 00                	adc    %al,(%rax)
ffff800000112e6c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e72:	10 00                	adc    %al,(%rax)
ffff800000112e74:	00 80 ff ff bc 4c    	add    %al,0x4cbcffff(%rax)
ffff800000112e7a:	10 00                	adc    %al,(%rax)
ffff800000112e7c:	00 80 ff ff f3 50    	add    %al,0x50f3ffff(%rax)
ffff800000112e82:	10 00                	adc    %al,(%rax)
ffff800000112e84:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e8a:	10 00                	adc    %al,(%rax)
ffff800000112e8c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e92:	10 00                	adc    %al,(%rax)
ffff800000112e94:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112e9a:	10 00                	adc    %al,(%rax)
ffff800000112e9c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112ea2:	10 00                	adc    %al,(%rax)
ffff800000112ea4:	00 80 ff ff f3 50    	add    %al,0x50f3ffff(%rax)
ffff800000112eaa:	10 00                	adc    %al,(%rax)
ffff800000112eac:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112eb2:	10 00                	adc    %al,(%rax)
ffff800000112eb4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112eba:	10 00                	adc    %al,(%rax)
ffff800000112ebc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112ec2:	10 00                	adc    %al,(%rax)
ffff800000112ec4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112eca:	10 00                	adc    %al,(%rax)
ffff800000112ecc:	00 80 ff ff f7 51    	add    %al,0x51f7ffff(%rax)
ffff800000112ed2:	10 00                	adc    %al,(%rax)
ffff800000112ed4:	00 80 ff ff 60 4e    	add    %al,0x4e60ffff(%rax)
ffff800000112eda:	10 00                	adc    %al,(%rax)
ffff800000112edc:	00 80 ff ff 60 4f    	add    %al,0x4f60ffff(%rax)
ffff800000112ee2:	10 00                	adc    %al,(%rax)
ffff800000112ee4:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112eea:	10 00                	adc    %al,(%rax)
ffff800000112eec:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112ef2:	10 00                	adc    %al,(%rax)
ffff800000112ef4:	00 80 ff ff 56 4d    	add    %al,0x4d56ffff(%rax)
ffff800000112efa:	10 00                	adc    %al,(%rax)
ffff800000112efc:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112f02:	10 00                	adc    %al,(%rax)
ffff800000112f04:	00 80 ff ff f7 50    	add    %al,0x50f7ffff(%rax)
ffff800000112f0a:	10 00                	adc    %al,(%rax)
ffff800000112f0c:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112f12:	10 00                	adc    %al,(%rax)
ffff800000112f14:	00 80 ff ff cb 52    	add    %al,0x52cbffff(%rax)
ffff800000112f1a:	10 00                	adc    %al,(%rax)
ffff800000112f1c:	00 80 ff ff ef 4f    	add    %al,0x4fefffff(%rax)
ffff800000112f22:	10 00                	adc    %al,(%rax)
ffff800000112f24:	00 80 ff ff 64 6f    	add    %al,0x6f64ffff(%rax)
ffff800000112f2a:	5f                   	pop    %rdi
ffff800000112f2b:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
ffff800000112f32:	65 
ffff800000112f33:	72 72                	jb     ffff800000112fa7 <_rodata+0x447>
ffff800000112f35:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000112f36:	72 28                	jb     ffff800000112f60 <_rodata+0x400>
ffff800000112f38:	30 29                	xor    %ch,(%rcx)
ffff800000112f3a:	2c 45                	sub    $0x45,%al
ffff800000112f3c:	52                   	push   %rdx
ffff800000112f3d:	52                   	push   %rdx
ffff800000112f3e:	4f 52                	rex.WRXB push %r10
ffff800000112f40:	5f                   	pop    %rdi
ffff800000112f41:	43                   	rex.XB
ffff800000112f42:	4f                   	rex.WRXB
ffff800000112f43:	44                   	rex.R
ffff800000112f44:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425f6e <_ebss+0x382f6a06>
ffff800000112f4b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f4c:	78 2c                	js     ffff800000112f7a <_rodata+0x41a>
ffff800000112f4e:	52                   	push   %rdx
ffff800000112f4f:	53                   	push   %rbx
ffff800000112f50:	50                   	push   %rax
ffff800000112f51:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425f7a <_ebss+0x382f6a12>
ffff800000112f57:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f58:	78 2c                	js     ffff800000112f86 <_rodata+0x426>
ffff800000112f5a:	52                   	push   %rdx
ffff800000112f5b:	49 50                	rex.WB push %r8
ffff800000112f5d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425f86 <_ebss+0x382f6a1e>
ffff800000112f63:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f64:	78 0a                	js     ffff800000112f70 <_rodata+0x410>
ffff800000112f66:	00 00                	add    %al,(%rax)
ffff800000112f68:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000112f6a:	5f                   	pop    %rdi
ffff800000112f6b:	64 65 62             	fs gs (bad) 
ffff800000112f6e:	75 67                	jne    ffff800000112fd7 <_rodata+0x477>
ffff800000112f70:	28 31                	sub    %dh,(%rcx)
ffff800000112f72:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000112f79:	5f                   	pop    %rdi
ffff800000112f7a:	43                   	rex.XB
ffff800000112f7b:	4f                   	rex.WRXB
ffff800000112f7c:	44                   	rex.R
ffff800000112f7d:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425fa7 <_ebss+0x382f6a3f>
ffff800000112f84:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f85:	78 2c                	js     ffff800000112fb3 <_rodata+0x453>
ffff800000112f87:	52                   	push   %rdx
ffff800000112f88:	53                   	push   %rbx
ffff800000112f89:	50                   	push   %rax
ffff800000112f8a:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425fb3 <_ebss+0x382f6a4b>
ffff800000112f90:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f91:	78 2c                	js     ffff800000112fbf <_rodata+0x45f>
ffff800000112f93:	52                   	push   %rdx
ffff800000112f94:	49 50                	rex.WB push %r8
ffff800000112f96:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425fbf <_ebss+0x382f6a57>
ffff800000112f9c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112f9d:	78 0a                	js     ffff800000112fa9 <_rodata+0x449>
ffff800000112f9f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112fa3:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000112fa4:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112fa5:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
ffff800000112fab:	52                   	push   %rdx
ffff800000112fac:	52                   	push   %rdx
ffff800000112fad:	4f 52                	rex.WRXB push %r10
ffff800000112faf:	5f                   	pop    %rdi
ffff800000112fb0:	43                   	rex.XB
ffff800000112fb1:	4f                   	rex.WRXB
ffff800000112fb2:	44                   	rex.R
ffff800000112fb3:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038425fdd <_ebss+0x382f6a75>
ffff800000112fba:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112fbb:	78 2c                	js     ffff800000112fe9 <_rodata+0x489>
ffff800000112fbd:	52                   	push   %rdx
ffff800000112fbe:	53                   	push   %rbx
ffff800000112fbf:	50                   	push   %rax
ffff800000112fc0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425fe9 <_ebss+0x382f6a81>
ffff800000112fc6:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112fc7:	78 2c                	js     ffff800000112ff5 <_rodata+0x495>
ffff800000112fc9:	52                   	push   %rdx
ffff800000112fca:	49 50                	rex.WB push %r8
ffff800000112fcc:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038425ff5 <_ebss+0x382f6a8d>
ffff800000112fd2:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112fd3:	78 0a                	js     ffff800000112fdf <_rodata+0x47f>
ffff800000112fd5:	00 00                	add    %al,(%rax)
ffff800000112fd7:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000112fdb:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
ffff800000112fe2:	2c 45                	sub    $0x45,%al
ffff800000112fe4:	52                   	push   %rdx
ffff800000112fe5:	52                   	push   %rdx
ffff800000112fe6:	4f 52                	rex.WRXB push %r10
ffff800000112fe8:	5f                   	pop    %rdi
ffff800000112fe9:	43                   	rex.XB
ffff800000112fea:	4f                   	rex.WRXB
ffff800000112feb:	44                   	rex.R
ffff800000112fec:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426016 <_ebss+0x382f6aae>
ffff800000112ff3:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000112ff4:	78 2c                	js     ffff800000113022 <_rodata+0x4c2>
ffff800000112ff6:	52                   	push   %rdx
ffff800000112ff7:	53                   	push   %rbx
ffff800000112ff8:	50                   	push   %rax
ffff800000112ff9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426022 <_ebss+0x382f6aba>
ffff800000112fff:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113000:	78 2c                	js     ffff80000011302e <_rodata+0x4ce>
ffff800000113002:	52                   	push   %rdx
ffff800000113003:	49 50                	rex.WB push %r8
ffff800000113005:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842602e <_ebss+0x382f6ac6>
ffff80000011300b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011300c:	78 0a                	js     ffff800000113018 <_rodata+0x4b8>
ffff80000011300e:	00 00                	add    %al,(%rax)
ffff800000113010:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113012:	5f                   	pop    %rdi
ffff800000113013:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113014:	76 65                	jbe    ffff80000011307b <_rodata+0x51b>
ffff800000113016:	72 66                	jb     ffff80000011307e <_rodata+0x51e>
ffff800000113018:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113019:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011301a:	77 28                	ja     ffff800000113044 <_rodata+0x4e4>
ffff80000011301c:	34 29                	xor    $0x29,%al
ffff80000011301e:	2c 45                	sub    $0x45,%al
ffff800000113020:	52                   	push   %rdx
ffff800000113021:	52                   	push   %rdx
ffff800000113022:	4f 52                	rex.WRXB push %r10
ffff800000113024:	5f                   	pop    %rdi
ffff800000113025:	43                   	rex.XB
ffff800000113026:	4f                   	rex.WRXB
ffff800000113027:	44                   	rex.R
ffff800000113028:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426052 <_ebss+0x382f6aea>
ffff80000011302f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113030:	78 2c                	js     ffff80000011305e <_rodata+0x4fe>
ffff800000113032:	52                   	push   %rdx
ffff800000113033:	53                   	push   %rbx
ffff800000113034:	50                   	push   %rax
ffff800000113035:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842605e <_ebss+0x382f6af6>
ffff80000011303b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011303c:	78 2c                	js     ffff80000011306a <_rodata+0x50a>
ffff80000011303e:	52                   	push   %rdx
ffff80000011303f:	49 50                	rex.WB push %r8
ffff800000113041:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842606a <_ebss+0x382f6b02>
ffff800000113047:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113048:	78 0a                	js     ffff800000113054 <_rodata+0x4f4>
ffff80000011304a:	00 00                	add    %al,(%rax)
ffff80000011304c:	00 00                	add    %al,(%rax)
ffff80000011304e:	00 00                	add    %al,(%rax)
ffff800000113050:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113052:	5f                   	pop    %rdi
ffff800000113053:	62                   	(bad)  
ffff800000113054:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113055:	75 6e                	jne    ffff8000001130c5 <_rodata+0x565>
ffff800000113057:	64 73 28             	fs jae ffff800000113082 <_rodata+0x522>
ffff80000011305a:	35 29 2c 45 52       	xor    $0x52452c29,%eax
ffff80000011305f:	52                   	push   %rdx
ffff800000113060:	4f 52                	rex.WRXB push %r10
ffff800000113062:	5f                   	pop    %rdi
ffff800000113063:	43                   	rex.XB
ffff800000113064:	4f                   	rex.WRXB
ffff800000113065:	44                   	rex.R
ffff800000113066:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426090 <_ebss+0x382f6b28>
ffff80000011306d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011306e:	78 2c                	js     ffff80000011309c <_rodata+0x53c>
ffff800000113070:	52                   	push   %rdx
ffff800000113071:	53                   	push   %rbx
ffff800000113072:	50                   	push   %rax
ffff800000113073:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842609c <_ebss+0x382f6b34>
ffff800000113079:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011307a:	78 2c                	js     ffff8000001130a8 <_rodata+0x548>
ffff80000011307c:	52                   	push   %rdx
ffff80000011307d:	49 50                	rex.WB push %r8
ffff80000011307f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384260a8 <_ebss+0x382f6b40>
ffff800000113085:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113086:	78 0a                	js     ffff800000113092 <_rodata+0x532>
	...
ffff800000113090:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113092:	5f                   	pop    %rdi
ffff800000113093:	75 6e                	jne    ffff800000113103 <_rodata+0x5a3>
ffff800000113095:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
ffff80000011309c:	5f 
ffff80000011309d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011309e:	70 63                	jo     ffff800000113103 <_rodata+0x5a3>
ffff8000001130a0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001130a1:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
ffff8000001130a5:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001130ac:	5f                   	pop    %rdi
ffff8000001130ad:	43                   	rex.XB
ffff8000001130ae:	4f                   	rex.WRXB
ffff8000001130af:	44                   	rex.R
ffff8000001130b0:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384260da <_ebss+0x382f6b72>
ffff8000001130b7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001130b8:	78 2c                	js     ffff8000001130e6 <_rodata+0x586>
ffff8000001130ba:	52                   	push   %rdx
ffff8000001130bb:	53                   	push   %rbx
ffff8000001130bc:	50                   	push   %rax
ffff8000001130bd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384260e6 <_ebss+0x382f6b7e>
ffff8000001130c3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001130c4:	78 2c                	js     ffff8000001130f2 <_rodata+0x592>
ffff8000001130c6:	52                   	push   %rdx
ffff8000001130c7:	49 50                	rex.WB push %r8
ffff8000001130c9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384260f2 <_ebss+0x382f6b8a>
ffff8000001130cf:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001130d0:	78 0a                	js     ffff8000001130dc <_rodata+0x57c>
ffff8000001130d2:	00 00                	add    %al,(%rax)
ffff8000001130d4:	00 00                	add    %al,(%rax)
ffff8000001130d6:	00 00                	add    %al,(%rax)
ffff8000001130d8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001130da:	5f                   	pop    %rdi
ffff8000001130db:	64 65 76 5f          	fs gs jbe ffff80000011313e <_rodata+0x5de>
ffff8000001130df:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001130e0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001130e1:	74 5f                	je     ffff800000113142 <_rodata+0x5e2>
ffff8000001130e3:	61                   	(bad)  
ffff8000001130e4:	76 61                	jbe    ffff800000113147 <_rodata+0x5e7>
ffff8000001130e6:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
ffff8000001130ed:	37 
ffff8000001130ee:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001130f5:	5f                   	pop    %rdi
ffff8000001130f6:	43                   	rex.XB
ffff8000001130f7:	4f                   	rex.WRXB
ffff8000001130f8:	44                   	rex.R
ffff8000001130f9:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426123 <_ebss+0x382f6bbb>
ffff800000113100:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113101:	78 2c                	js     ffff80000011312f <_rodata+0x5cf>
ffff800000113103:	52                   	push   %rdx
ffff800000113104:	53                   	push   %rbx
ffff800000113105:	50                   	push   %rax
ffff800000113106:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842612f <_ebss+0x382f6bc7>
ffff80000011310c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011310d:	78 2c                	js     ffff80000011313b <_rodata+0x5db>
ffff80000011310f:	52                   	push   %rdx
ffff800000113110:	49 50                	rex.WB push %r8
ffff800000113112:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842613b <_ebss+0x382f6bd3>
ffff800000113118:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113119:	78 0a                	js     ffff800000113125 <_rodata+0x5c5>
ffff80000011311b:	00 00                	add    %al,(%rax)
ffff80000011311d:	00 00                	add    %al,(%rax)
ffff80000011311f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000113123:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113125:	75 62                	jne    ffff800000113189 <_rodata+0x629>
ffff800000113127:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113128:	65 5f                	gs pop %rdi
ffff80000011312a:	66 61                	data16 (bad) 
ffff80000011312c:	75 6c                	jne    ffff80000011319a <_rodata+0x63a>
ffff80000011312e:	74 28                	je     ffff800000113158 <_rodata+0x5f8>
ffff800000113130:	38 29                	cmp    %ch,(%rcx)
ffff800000113132:	2c 45                	sub    $0x45,%al
ffff800000113134:	52                   	push   %rdx
ffff800000113135:	52                   	push   %rdx
ffff800000113136:	4f 52                	rex.WRXB push %r10
ffff800000113138:	5f                   	pop    %rdi
ffff800000113139:	43                   	rex.XB
ffff80000011313a:	4f                   	rex.WRXB
ffff80000011313b:	44                   	rex.R
ffff80000011313c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426166 <_ebss+0x382f6bfe>
ffff800000113143:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113144:	78 2c                	js     ffff800000113172 <_rodata+0x612>
ffff800000113146:	52                   	push   %rdx
ffff800000113147:	53                   	push   %rbx
ffff800000113148:	50                   	push   %rax
ffff800000113149:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426172 <_ebss+0x382f6c0a>
ffff80000011314f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113150:	78 2c                	js     ffff80000011317e <_rodata+0x61e>
ffff800000113152:	52                   	push   %rdx
ffff800000113153:	49 50                	rex.WB push %r8
ffff800000113155:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842617e <_ebss+0x382f6c16>
ffff80000011315b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011315c:	78 0a                	js     ffff800000113168 <_rodata+0x608>
ffff80000011315e:	00 00                	add    %al,(%rax)
ffff800000113160:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113162:	5f                   	pop    %rdi
ffff800000113163:	63 6f 70             	movsxd 0x70(%rdi),%ebp
ffff800000113166:	72 6f                	jb     ffff8000001131d7 <_rodata+0x677>
ffff800000113168:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff80000011316b:	73 6f                	jae    ffff8000001131dc <_rodata+0x67c>
ffff80000011316d:	72 5f                	jb     ffff8000001131ce <_rodata+0x66e>
ffff80000011316f:	73 65                	jae    ffff8000001131d6 <_rodata+0x676>
ffff800000113171:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000113173:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113175:	74 5f                	je     ffff8000001131d6 <_rodata+0x676>
ffff800000113177:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113178:	76 65                	jbe    ffff8000001131df <_rodata+0x67f>
ffff80000011317a:	72 72                	jb     ffff8000001131ee <_rodata+0x68e>
ffff80000011317c:	75 6e                	jne    ffff8000001131ec <_rodata+0x68c>
ffff80000011317e:	28 39                	sub    %bh,(%rcx)
ffff800000113180:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000113187:	5f                   	pop    %rdi
ffff800000113188:	43                   	rex.XB
ffff800000113189:	4f                   	rex.WRXB
ffff80000011318a:	44                   	rex.R
ffff80000011318b:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384261b5 <_ebss+0x382f6c4d>
ffff800000113192:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113193:	78 2c                	js     ffff8000001131c1 <_rodata+0x661>
ffff800000113195:	52                   	push   %rdx
ffff800000113196:	53                   	push   %rbx
ffff800000113197:	50                   	push   %rax
ffff800000113198:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384261c1 <_ebss+0x382f6c59>
ffff80000011319e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011319f:	78 2c                	js     ffff8000001131cd <_rodata+0x66d>
ffff8000001131a1:	52                   	push   %rdx
ffff8000001131a2:	49 50                	rex.WB push %r8
ffff8000001131a4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384261cd <_ebss+0x382f6c65>
ffff8000001131aa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001131ab:	78 0a                	js     ffff8000001131b7 <_rodata+0x657>
ffff8000001131ad:	00 00                	add    %al,(%rax)
ffff8000001131af:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001131b3:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
ffff8000001131ba:	5f                   	pop    %rdi
ffff8000001131bb:	54                   	push   %rsp
ffff8000001131bc:	53                   	push   %rbx
ffff8000001131bd:	53                   	push   %rbx
ffff8000001131be:	28 31                	sub    %dh,(%rcx)
ffff8000001131c0:	30 29                	xor    %ch,(%rcx)
ffff8000001131c2:	2c 45                	sub    $0x45,%al
ffff8000001131c4:	52                   	push   %rdx
ffff8000001131c5:	52                   	push   %rdx
ffff8000001131c6:	4f 52                	rex.WRXB push %r10
ffff8000001131c8:	5f                   	pop    %rdi
ffff8000001131c9:	43                   	rex.XB
ffff8000001131ca:	4f                   	rex.WRXB
ffff8000001131cb:	44                   	rex.R
ffff8000001131cc:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384261f6 <_ebss+0x382f6c8e>
ffff8000001131d3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001131d4:	78 2c                	js     ffff800000113202 <_rodata+0x6a2>
ffff8000001131d6:	52                   	push   %rdx
ffff8000001131d7:	53                   	push   %rbx
ffff8000001131d8:	50                   	push   %rax
ffff8000001131d9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426202 <_ebss+0x382f6c9a>
ffff8000001131df:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001131e0:	78 2c                	js     ffff80000011320e <_rodata+0x6ae>
ffff8000001131e2:	52                   	push   %rdx
ffff8000001131e3:	49 50                	rex.WB push %r8
ffff8000001131e5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842620e <_ebss+0x382f6ca6>
ffff8000001131eb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001131ec:	78 0a                	js     ffff8000001131f8 <_rodata+0x698>
ffff8000001131ee:	00 00                	add    %al,(%rax)
ffff8000001131f0:	54                   	push   %rsp
ffff8000001131f1:	68 65 20 65 78       	pushq  $0x78652065
ffff8000001131f6:	63 65 70             	movsxd 0x70(%rbp),%esp
ffff8000001131f9:	74 69                	je     ffff800000113264 <_rodata+0x704>
ffff8000001131fb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001131fc:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001131fd:	20 6f 63             	and    %ch,0x63(%rdi)
ffff800000113200:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000113203:	72 65                	jb     ffff80000011326a <_rodata+0x70a>
ffff800000113205:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff80000011320a:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff800000113211:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff800000113218:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff80000011321c:	20 65 76             	and    %ah,0x76(%rbp)
ffff80000011321f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113221:	74 20                	je     ffff800000113243 <_rodata+0x6e3>
ffff800000113223:	65 78 74             	gs js  ffff80000011329a <_rodata+0x73a>
ffff800000113226:	65 72 6e             	gs jb  ffff800000113297 <_rodata+0x737>
ffff800000113229:	61                   	(bad)  
ffff80000011322a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011322b:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011322f:	74 68                	je     ffff800000113299 <_rodata+0x739>
ffff800000113231:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff800000113235:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113236:	67 72 61             	addr32 jb ffff80000011329a <_rodata+0x73a>
ffff800000113239:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011323a:	2c 73                	sub    $0x73,%al
ffff80000011323c:	75 63                	jne    ffff8000001132a1 <_rodata+0x741>
ffff80000011323e:	68 20 61 73 20       	pushq  $0x20736120
ffff800000113243:	61                   	(bad)  
ffff800000113244:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113245:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000113248:	74 65                	je     ffff8000001132af <_rodata+0x74f>
ffff80000011324a:	72 72                	jb     ffff8000001132be <_rodata+0x75e>
ffff80000011324c:	75 70                	jne    ffff8000001132be <_rodata+0x75e>
ffff80000011324e:	74 20                	je     ffff800000113270 <_rodata+0x710>
ffff800000113250:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113251:	72 20                	jb     ffff800000113273 <_rodata+0x713>
ffff800000113253:	61                   	(bad)  
ffff800000113254:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113255:	20 65 61             	and    %ah,0x61(%rbp)
ffff800000113258:	72 6c                	jb     ffff8000001132c6 <_rodata+0x766>
ffff80000011325a:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff800000113261:	65 70 74             	gs jo  ffff8000001132d8 <_rodata+0x778>
ffff800000113264:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000011326b:	00 00                	add    %al,(%rax)
ffff80000011326d:	00 00                	add    %al,(%rax)
ffff80000011326f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000113272:	66 65 72 73          	data16 gs jb ffff8000001132e9 <_rodata+0x789>
ffff800000113276:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011327a:	61                   	(bad)  
ffff80000011327b:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000011327e:	74 65                	je     ffff8000001132e5 <_rodata+0x785>
ffff800000113280:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000113284:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000113287:	70 74                	jo     ffff8000001132fd <_rodata+0x79d>
ffff800000113289:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011328a:	72 20                	jb     ffff8000001132ac <_rodata+0x74c>
ffff80000011328c:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000113293:	49                   	rex.WB
ffff800000113294:	44 54                	rex.R push %rsp
ffff800000113296:	3b 0a                	cmp    (%rdx),%ecx
	...
ffff8000001132a0:	52                   	push   %rdx
ffff8000001132a1:	65 66 65 72 73       	gs data16 gs jb ffff800000113319 <_rodata+0x7b9>
ffff8000001132a6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001132aa:	61                   	(bad)  
ffff8000001132ab:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001132af:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001132b2:	70 74                	jo     ffff800000113328 <_rodata+0x7c8>
ffff8000001132b4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001132b5:	72 20                	jb     ffff8000001132d7 <_rodata+0x777>
ffff8000001132b7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001132be:	47                   	rex.RXB
ffff8000001132bf:	44 54                	rex.R push %rsp
ffff8000001132c1:	20 6f 72             	and    %ch,0x72(%rdi)
ffff8000001132c4:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff8000001132c8:	20 63 75             	and    %ah,0x75(%rbx)
ffff8000001132cb:	72 72                	jb     ffff80000011333f <_rodata+0x7df>
ffff8000001132cd:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001132cf:	74 20                	je     ffff8000001132f1 <_rodata+0x791>
ffff8000001132d1:	4c                   	rex.WR
ffff8000001132d2:	44 54                	rex.R push %rsp
ffff8000001132d4:	3b 0a                	cmp    (%rdx),%ecx
ffff8000001132d6:	00 00                	add    %al,(%rax)
ffff8000001132d8:	52                   	push   %rdx
ffff8000001132d9:	65 66 65 72 73       	gs data16 gs jb ffff800000113351 <_rodata+0x7f1>
ffff8000001132de:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001132e2:	61                   	(bad)  
ffff8000001132e3:	20 73 65             	and    %dh,0x65(%rbx)
ffff8000001132e6:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001132e8:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001132ea:	74 20                	je     ffff80000011330c <_rodata+0x7ac>
ffff8000001132ec:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001132ed:	72 20                	jb     ffff80000011330f <_rodata+0x7af>
ffff8000001132ef:	67 61                	addr32 (bad) 
ffff8000001132f1:	74 65                	je     ffff800000113358 <_rodata+0x7f8>
ffff8000001132f3:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001132f7:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001132fa:	70 74                	jo     ffff800000113370 <_rodata+0x810>
ffff8000001132fc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001132fd:	72 20                	jb     ffff80000011331f <_rodata+0x7bf>
ffff8000001132ff:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000113306:	4c                   	rex.WR
ffff800000113307:	44 54                	rex.R push %rsp
ffff800000113309:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011330b:	00 00                	add    %al,(%rax)
ffff80000011330d:	00 00                	add    %al,(%rax)
ffff80000011330f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000113312:	66 65 72 73          	data16 gs jb ffff800000113389 <_rodata+0x829>
ffff800000113316:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011331a:	61                   	(bad)  
ffff80000011331b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011331f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000113322:	70 74                	jo     ffff800000113398 <_rodata+0x838>
ffff800000113324:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113325:	72 20                	jb     ffff800000113347 <_rodata+0x7e7>
ffff800000113327:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011332e:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff800000113331:	72 65                	jb     ffff800000113398 <_rodata+0x838>
ffff800000113333:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113334:	74 20                	je     ffff800000113356 <_rodata+0x7f6>
ffff800000113336:	47                   	rex.RXB
ffff800000113337:	44 54                	rex.R push %rsp
ffff800000113339:	3b 0a                	cmp    (%rdx),%ecx
ffff80000011333b:	00 00                	add    %al,(%rax)
ffff80000011333d:	00 00                	add    %al,(%rax)
ffff80000011333f:	00 53 65             	add    %dl,0x65(%rbx)
ffff800000113342:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000113344:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113346:	74 20                	je     ffff800000113368 <_rodata+0x808>
ffff800000113348:	53                   	push   %rbx
ffff800000113349:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000011334b:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
ffff800000113350:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff800000113353:	64 65 78 3a          	fs gs js ffff800000113391 <_rodata+0x831>
ffff800000113357:	25 23 30 31 30       	and    $0x30313023,%eax
ffff80000011335c:	78 0a                	js     ffff800000113368 <_rodata+0x808>
ffff80000011335e:	00 00                	add    %al,(%rax)
ffff800000113360:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000113362:	5f                   	pop    %rdi
ffff800000113363:	73 65                	jae    ffff8000001133ca <_rodata+0x86a>
ffff800000113365:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000113367:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113369:	74 5f                	je     ffff8000001133ca <_rodata+0x86a>
ffff80000011336b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011336c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011336d:	74 5f                	je     ffff8000001133ce <_rodata+0x86e>
ffff80000011336f:	70 72                	jo     ffff8000001133e3 <_rodata+0x883>
ffff800000113371:	65 73 65             	gs jae ffff8000001133d9 <_rodata+0x879>
ffff800000113374:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113375:	74 28                	je     ffff80000011339f <_rodata+0x83f>
ffff800000113377:	31 31                	xor    %esi,(%rcx)
ffff800000113379:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000113380:	5f                   	pop    %rdi
ffff800000113381:	43                   	rex.XB
ffff800000113382:	4f                   	rex.WRXB
ffff800000113383:	44                   	rex.R
ffff800000113384:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384263ae <_ebss+0x382f6e46>
ffff80000011338b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011338c:	78 2c                	js     ffff8000001133ba <_rodata+0x85a>
ffff80000011338e:	52                   	push   %rdx
ffff80000011338f:	53                   	push   %rbx
ffff800000113390:	50                   	push   %rax
ffff800000113391:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384263ba <_ebss+0x382f6e52>
ffff800000113397:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113398:	78 2c                	js     ffff8000001133c6 <_rodata+0x866>
ffff80000011339a:	52                   	push   %rdx
ffff80000011339b:	49 50                	rex.WB push %r8
ffff80000011339d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384263c6 <_ebss+0x382f6e5e>
ffff8000001133a3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001133a4:	78 0a                	js     ffff8000001133b0 <_rodata+0x850>
ffff8000001133a6:	00 00                	add    %al,(%rax)
ffff8000001133a8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001133aa:	5f                   	pop    %rdi
ffff8000001133ab:	73 74                	jae    ffff800000113421 <_rodata+0x8c1>
ffff8000001133ad:	61                   	(bad)  
ffff8000001133ae:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
ffff8000001133b1:	73 65                	jae    ffff800000113418 <_rodata+0x8b8>
ffff8000001133b3:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001133b5:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001133b7:	74 5f                	je     ffff800000113418 <_rodata+0x8b8>
ffff8000001133b9:	66 61                	data16 (bad) 
ffff8000001133bb:	75 6c                	jne    ffff800000113429 <_rodata+0x8c9>
ffff8000001133bd:	74 28                	je     ffff8000001133e7 <_rodata+0x887>
ffff8000001133bf:	31 32                	xor    %esi,(%rdx)
ffff8000001133c1:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001133c8:	5f                   	pop    %rdi
ffff8000001133c9:	43                   	rex.XB
ffff8000001133ca:	4f                   	rex.WRXB
ffff8000001133cb:	44                   	rex.R
ffff8000001133cc:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384263f6 <_ebss+0x382f6e8e>
ffff8000001133d3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001133d4:	78 2c                	js     ffff800000113402 <_rodata+0x8a2>
ffff8000001133d6:	52                   	push   %rdx
ffff8000001133d7:	53                   	push   %rbx
ffff8000001133d8:	50                   	push   %rax
ffff8000001133d9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426402 <_ebss+0x382f6e9a>
ffff8000001133df:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001133e0:	78 2c                	js     ffff80000011340e <_rodata+0x8ae>
ffff8000001133e2:	52                   	push   %rdx
ffff8000001133e3:	49 50                	rex.WB push %r8
ffff8000001133e5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842640e <_ebss+0x382f6ea6>
ffff8000001133eb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001133ec:	78 0a                	js     ffff8000001133f8 <_rodata+0x898>
ffff8000001133ee:	00 00                	add    %al,(%rax)
ffff8000001133f0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001133f2:	5f                   	pop    %rdi
ffff8000001133f3:	67 65 6e             	outsb  %gs:(%esi),(%dx)
ffff8000001133f6:	65 72 61             	gs jb  ffff80000011345a <_rodata+0x8fa>
ffff8000001133f9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001133fa:	5f                   	pop    %rdi
ffff8000001133fb:	70 72                	jo     ffff80000011346f <_rodata+0x90f>
ffff8000001133fd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001133fe:	74 65                	je     ffff800000113465 <_rodata+0x905>
ffff800000113400:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff800000113404:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113405:	28 31                	sub    %dh,(%rcx)
ffff800000113407:	33 29                	xor    (%rcx),%ebp
ffff800000113409:	2c 45                	sub    $0x45,%al
ffff80000011340b:	52                   	push   %rdx
ffff80000011340c:	52                   	push   %rdx
ffff80000011340d:	4f 52                	rex.WRXB push %r10
ffff80000011340f:	5f                   	pop    %rdi
ffff800000113410:	43                   	rex.XB
ffff800000113411:	4f                   	rex.WRXB
ffff800000113412:	44                   	rex.R
ffff800000113413:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842643d <_ebss+0x382f6ed5>
ffff80000011341a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011341b:	78 2c                	js     ffff800000113449 <_rodata+0x8e9>
ffff80000011341d:	52                   	push   %rdx
ffff80000011341e:	53                   	push   %rbx
ffff80000011341f:	50                   	push   %rax
ffff800000113420:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426449 <_ebss+0x382f6ee1>
ffff800000113426:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113427:	78 2c                	js     ffff800000113455 <_rodata+0x8f5>
ffff800000113429:	52                   	push   %rdx
ffff80000011342a:	49 50                	rex.WB push %r8
ffff80000011342c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426455 <_ebss+0x382f6eed>
ffff800000113432:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113433:	78 0a                	js     ffff80000011343f <_rodata+0x8df>
ffff800000113435:	00 00                	add    %al,(%rax)
ffff800000113437:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff80000011343b:	70 61                	jo     ffff80000011349e <_rodata+0x93e>
ffff80000011343d:	67 65 5f             	addr32 gs pop %rdi
ffff800000113440:	66 61                	data16 (bad) 
ffff800000113442:	75 6c                	jne    ffff8000001134b0 <_rodata+0x950>
ffff800000113444:	74 28                	je     ffff80000011346e <_rodata+0x90e>
ffff800000113446:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
ffff800000113449:	2c 45                	sub    $0x45,%al
ffff80000011344b:	52                   	push   %rdx
ffff80000011344c:	52                   	push   %rdx
ffff80000011344d:	4f 52                	rex.WRXB push %r10
ffff80000011344f:	5f                   	pop    %rdi
ffff800000113450:	43                   	rex.XB
ffff800000113451:	4f                   	rex.WRXB
ffff800000113452:	44                   	rex.R
ffff800000113453:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842647d <_ebss+0x382f6f15>
ffff80000011345a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011345b:	78 2c                	js     ffff800000113489 <_rodata+0x929>
ffff80000011345d:	52                   	push   %rdx
ffff80000011345e:	53                   	push   %rbx
ffff80000011345f:	50                   	push   %rax
ffff800000113460:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426489 <_ebss+0x382f6f21>
ffff800000113466:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113467:	78 2c                	js     ffff800000113495 <_rodata+0x935>
ffff800000113469:	52                   	push   %rdx
ffff80000011346a:	49 50                	rex.WB push %r8
ffff80000011346c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426495 <_ebss+0x382f6f2d>
ffff800000113472:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113473:	78 0a                	js     ffff80000011347f <_rodata+0x91f>
ffff800000113475:	00 50 61             	add    %dl,0x61(%rax)
ffff800000113478:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000011347d:	74 2d                	je     ffff8000001134ac <_rodata+0x94c>
ffff80000011347f:	50                   	push   %rax
ffff800000113480:	72 65                	jb     ffff8000001134e7 <_rodata+0x987>
ffff800000113482:	73 65                	jae    ffff8000001134e9 <_rodata+0x989>
ffff800000113484:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113485:	74 2c                	je     ffff8000001134b3 <_rodata+0x953>
ffff800000113487:	09 00                	or     %eax,(%rax)
ffff800000113489:	57                   	push   %rdi
ffff80000011348a:	72 69                	jb     ffff8000001134f5 <_rodata+0x995>
ffff80000011348c:	74 65                	je     ffff8000001134f3 <_rodata+0x993>
ffff80000011348e:	20 43 61             	and    %al,0x61(%rbx)
ffff800000113491:	75 73                	jne    ffff800000113506 <_rodata+0x9a6>
ffff800000113493:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000113497:	75 6c                	jne    ffff800000113505 <_rodata+0x9a5>
ffff800000113499:	74 2c                	je     ffff8000001134c7 <_rodata+0x967>
ffff80000011349b:	09 00                	or     %eax,(%rax)
ffff80000011349d:	52                   	push   %rdx
ffff80000011349e:	65 61                	gs (bad) 
ffff8000001134a0:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff8000001134a4:	75 73                	jne    ffff800000113519 <_rodata+0x9b9>
ffff8000001134a6:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001134aa:	75 6c                	jne    ffff800000113518 <_rodata+0x9b8>
ffff8000001134ac:	74 2c                	je     ffff8000001134da <_rodata+0x97a>
ffff8000001134ae:	09 00                	or     %eax,(%rax)
ffff8000001134b0:	46 61                	rex.RX (bad) 
ffff8000001134b2:	75 6c                	jne    ffff800000113520 <_rodata+0x9c0>
ffff8000001134b4:	74 20                	je     ffff8000001134d6 <_rodata+0x976>
ffff8000001134b6:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff8000001134bd:	28 33                	sub    %dh,(%rbx)
ffff8000001134bf:	29 09                	sub    %ecx,(%rcx)
ffff8000001134c1:	00 46 61             	add    %al,0x61(%rsi)
ffff8000001134c4:	75 6c                	jne    ffff800000113532 <_rodata+0x9d2>
ffff8000001134c6:	74 20                	je     ffff8000001134e8 <_rodata+0x988>
ffff8000001134c8:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff8000001134cf:	72 76                	jb     ffff800000113547 <_rodata+0x9e7>
ffff8000001134d1:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff8000001134d8:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff8000001134db:	29 09                	sub    %ecx,(%rcx)
ffff8000001134dd:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
ffff8000001134e0:	65 73 65             	gs jae ffff800000113548 <_rodata+0x9e8>
ffff8000001134e3:	72 76                	jb     ffff80000011355b <_rodata+0x9fb>
ffff8000001134e5:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff8000001134ea:	74 20                	je     ffff80000011350c <_rodata+0x9ac>
ffff8000001134ec:	43 61                	rex.XB (bad) 
ffff8000001134ee:	75 73                	jne    ffff800000113563 <_rodata+0xa03>
ffff8000001134f0:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001134f4:	75 6c                	jne    ffff800000113562 <_rodata+0xa02>
ffff8000001134f6:	74 09                	je     ffff800000113501 <_rodata+0x9a1>
	...
ffff800000113500:	2c 49                	sub    $0x49,%al
ffff800000113502:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113503:	73 74                	jae    ffff800000113579 <_rodata+0xa19>
ffff800000113505:	72 75                	jb     ffff80000011357c <_rodata+0xa1c>
ffff800000113507:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff80000011350b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011350c:	20 66 65             	and    %ah,0x65(%rsi)
ffff80000011350f:	74 63                	je     ffff800000113574 <_rodata+0xa14>
ffff800000113511:	68 20 43 61 75       	pushq  $0x75614320
ffff800000113516:	73 65                	jae    ffff80000011357d <_rodata+0xa1d>
ffff800000113518:	20 46 61             	and    %al,0x61(%rsi)
ffff80000011351b:	75 6c                	jne    ffff800000113589 <_rodata+0xa29>
ffff80000011351d:	74 00                	je     ffff80000011351f <_rodata+0x9bf>
ffff80000011351f:	0a 00                	or     (%rax),%al
ffff800000113521:	43 52                	rex.XB push %r10
ffff800000113523:	32 3a                	xor    (%rdx),%bh
ffff800000113525:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011352a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011352b:	78 0a                	js     ffff800000113537 <_rodata+0x9d7>
ffff80000011352d:	00 00                	add    %al,(%rax)
ffff80000011352f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000113533:	78 38                	js     ffff80000011356d <_rodata+0xa0d>
ffff800000113535:	37                   	(bad)  
ffff800000113536:	5f                   	pop    %rdi
ffff800000113537:	46 50                	rex.RX push %rax
ffff800000113539:	55                   	push   %rbp
ffff80000011353a:	5f                   	pop    %rdi
ffff80000011353b:	65 72 72             	gs jb  ffff8000001135b0 <_rodata+0xa50>
ffff80000011353e:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011353f:	72 28                	jb     ffff800000113569 <_rodata+0xa09>
ffff800000113541:	31 36                	xor    %esi,(%rsi)
ffff800000113543:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011354a:	5f                   	pop    %rdi
ffff80000011354b:	43                   	rex.XB
ffff80000011354c:	4f                   	rex.WRXB
ffff80000011354d:	44                   	rex.R
ffff80000011354e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426578 <_ebss+0x382f7010>
ffff800000113555:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113556:	78 2c                	js     ffff800000113584 <_rodata+0xa24>
ffff800000113558:	52                   	push   %rdx
ffff800000113559:	53                   	push   %rbx
ffff80000011355a:	50                   	push   %rax
ffff80000011355b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426584 <_ebss+0x382f701c>
ffff800000113561:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113562:	78 2c                	js     ffff800000113590 <_rodata+0xa30>
ffff800000113564:	52                   	push   %rdx
ffff800000113565:	49 50                	rex.WB push %r8
ffff800000113567:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426590 <_ebss+0x382f7028>
ffff80000011356d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011356e:	78 0a                	js     ffff80000011357a <_rodata+0xa1a>
	...
ffff800000113578:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011357a:	5f                   	pop    %rdi
ffff80000011357b:	61                   	(bad)  
ffff80000011357c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011357d:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff800000113584:	5f                   	pop    %rdi
ffff800000113585:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff800000113588:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff80000011358b:	31 37                	xor    %esi,(%rdi)
ffff80000011358d:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000113594:	5f                   	pop    %rdi
ffff800000113595:	43                   	rex.XB
ffff800000113596:	4f                   	rex.WRXB
ffff800000113597:	44                   	rex.R
ffff800000113598:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384265c2 <_ebss+0x382f705a>
ffff80000011359f:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135a0:	78 2c                	js     ffff8000001135ce <_rodata+0xa6e>
ffff8000001135a2:	52                   	push   %rdx
ffff8000001135a3:	53                   	push   %rbx
ffff8000001135a4:	50                   	push   %rax
ffff8000001135a5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384265ce <_ebss+0x382f7066>
ffff8000001135ab:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135ac:	78 2c                	js     ffff8000001135da <_rodata+0xa7a>
ffff8000001135ae:	52                   	push   %rdx
ffff8000001135af:	49 50                	rex.WB push %r8
ffff8000001135b1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384265da <_ebss+0x382f7072>
ffff8000001135b7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135b8:	78 0a                	js     ffff8000001135c4 <_rodata+0xa64>
ffff8000001135ba:	00 00                	add    %al,(%rax)
ffff8000001135bc:	00 00                	add    %al,(%rax)
ffff8000001135be:	00 00                	add    %al,(%rax)
ffff8000001135c0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001135c2:	5f                   	pop    %rdi
ffff8000001135c3:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001135c4:	61                   	(bad)  
ffff8000001135c5:	63 68 69             	movsxd 0x69(%rax),%ebp
ffff8000001135c8:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001135c9:	65 5f                	gs pop %rdi
ffff8000001135cb:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff8000001135ce:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff8000001135d1:	31 38                	xor    %edi,(%rax)
ffff8000001135d3:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001135da:	5f                   	pop    %rdi
ffff8000001135db:	43                   	rex.XB
ffff8000001135dc:	4f                   	rex.WRXB
ffff8000001135dd:	44                   	rex.R
ffff8000001135de:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426608 <_ebss+0x382f70a0>
ffff8000001135e5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135e6:	78 2c                	js     ffff800000113614 <_rodata+0xab4>
ffff8000001135e8:	52                   	push   %rdx
ffff8000001135e9:	53                   	push   %rbx
ffff8000001135ea:	50                   	push   %rax
ffff8000001135eb:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426614 <_ebss+0x382f70ac>
ffff8000001135f1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135f2:	78 2c                	js     ffff800000113620 <_rodata+0xac0>
ffff8000001135f4:	52                   	push   %rdx
ffff8000001135f5:	49 50                	rex.WB push %r8
ffff8000001135f7:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426620 <_ebss+0x382f70b8>
ffff8000001135fd:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001135fe:	78 0a                	js     ffff80000011360a <_rodata+0xaaa>
	...
ffff800000113608:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011360a:	5f                   	pop    %rdi
ffff80000011360b:	53                   	push   %rbx
ffff80000011360c:	49                   	rex.WB
ffff80000011360d:	4d                   	rex.WRB
ffff80000011360e:	44 5f                	rex.R pop %rdi
ffff800000113610:	65 78 63             	gs js  ffff800000113676 <_rodata+0xb16>
ffff800000113613:	65 70 74             	gs jo  ffff80000011368a <_rodata+0xb2a>
ffff800000113616:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
ffff80000011361d:	2c 45                	sub    $0x45,%al
ffff80000011361f:	52                   	push   %rdx
ffff800000113620:	52                   	push   %rdx
ffff800000113621:	4f 52                	rex.WRXB push %r10
ffff800000113623:	5f                   	pop    %rdi
ffff800000113624:	43                   	rex.XB
ffff800000113625:	4f                   	rex.WRXB
ffff800000113626:	44                   	rex.R
ffff800000113627:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038426651 <_ebss+0x382f70e9>
ffff80000011362e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011362f:	78 2c                	js     ffff80000011365d <_rodata+0xafd>
ffff800000113631:	52                   	push   %rdx
ffff800000113632:	53                   	push   %rbx
ffff800000113633:	50                   	push   %rax
ffff800000113634:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842665d <_ebss+0x382f70f5>
ffff80000011363a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011363b:	78 2c                	js     ffff800000113669 <_rodata+0xb09>
ffff80000011363d:	52                   	push   %rdx
ffff80000011363e:	49 50                	rex.WB push %r8
ffff800000113640:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426669 <_ebss+0x382f7101>
ffff800000113646:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113647:	78 0a                	js     ffff800000113653 <_rodata+0xaf3>
ffff800000113649:	00 00                	add    %al,(%rax)
ffff80000011364b:	00 00                	add    %al,(%rax)
ffff80000011364d:	00 00                	add    %al,(%rax)
ffff80000011364f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000113653:	76 69                	jbe    ffff8000001136be <_rodata+0xb5e>
ffff800000113655:	72 74                	jb     ffff8000001136cb <_rodata+0xb6b>
ffff800000113657:	75 61                	jne    ffff8000001136ba <_rodata+0xb5a>
ffff800000113659:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011365a:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff800000113661:	5f                   	pop    %rdi
ffff800000113662:	65 78 63             	gs js  ffff8000001136c8 <_rodata+0xb68>
ffff800000113665:	65 70 74             	gs jo  ffff8000001136dc <_rodata+0xb7c>
ffff800000113668:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
ffff80000011366f:	2c 45                	sub    $0x45,%al
ffff800000113671:	52                   	push   %rdx
ffff800000113672:	52                   	push   %rdx
ffff800000113673:	4f 52                	rex.WRXB push %r10
ffff800000113675:	5f                   	pop    %rdi
ffff800000113676:	43                   	rex.XB
ffff800000113677:	4f                   	rex.WRXB
ffff800000113678:	44                   	rex.R
ffff800000113679:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384266a3 <_ebss+0x382f713b>
ffff800000113680:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113681:	78 2c                	js     ffff8000001136af <_rodata+0xb4f>
ffff800000113683:	52                   	push   %rdx
ffff800000113684:	53                   	push   %rbx
ffff800000113685:	50                   	push   %rax
ffff800000113686:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384266af <_ebss+0x382f7147>
ffff80000011368c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011368d:	78 2c                	js     ffff8000001136bb <_rodata+0xb5b>
ffff80000011368f:	52                   	push   %rdx
ffff800000113690:	49 50                	rex.WB push %r8
ffff800000113692:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384266bb <_ebss+0x382f7153>
ffff800000113698:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113699:	78 0a                	js     ffff8000001136a5 <_rodata+0xb45>
ffff80000011369b:	00 00                	add    %al,(%rax)
ffff80000011369d:	00 00                	add    %al,(%rax)
ffff80000011369f:	00 44 69 73          	add    %al,0x73(%rcx,%rbp,2)
ffff8000001136a3:	70 6c                	jo     ffff800000113711 <_rodata+0xbb1>
ffff8000001136a5:	61                   	(bad)  
ffff8000001136a6:	79 20                	jns    ffff8000001136c8 <_rodata+0xb68>
ffff8000001136a8:	50                   	push   %rax
ffff8000001136a9:	68 79 73 69 63       	pushq  $0x63697379
ffff8000001136ae:	73 20                	jae    ffff8000001136d0 <_rodata+0xb70>
ffff8000001136b0:	41                   	rex.B
ffff8000001136b1:	64 64 72 65          	fs fs jb ffff80000011371a <_rodata+0xbba>
ffff8000001136b5:	73 73                	jae    ffff80000011372a <_rodata+0xbca>
ffff8000001136b7:	20 4d 41             	and    %cl,0x41(%rbp)
ffff8000001136ba:	50                   	push   %rax
ffff8000001136bb:	2c 54                	sub    $0x54,%al
ffff8000001136bd:	79 70                	jns    ffff80000011372f <_rodata+0xbcf>
ffff8000001136bf:	65 28 31             	sub    %dh,%gs:(%rcx)
ffff8000001136c2:	3a 52 41             	cmp    0x41(%rdx),%dl
ffff8000001136c5:	4d 2c 32             	rex.WRB sub $0x32,%al
ffff8000001136c8:	3a 52 4f             	cmp    0x4f(%rdx),%dl
ffff8000001136cb:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
ffff8000001136cf:	20 52 65             	and    %dl,0x65(%rdx)
ffff8000001136d2:	73 65                	jae    ffff800000113739 <_rodata+0xbd9>
ffff8000001136d4:	72 76                	jb     ffff80000011374c <_rodata+0xbec>
ffff8000001136d6:	65 64 2c 33          	gs fs sub $0x33,%al
ffff8000001136da:	3a 41 43             	cmp    0x43(%rcx),%al
ffff8000001136dd:	50                   	push   %rax
ffff8000001136de:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
ffff8000001136e2:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
ffff8000001136e6:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001136e7:	20 4d 65             	and    %cl,0x65(%rbp)
ffff8000001136ea:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001136eb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001136ec:	72 79                	jb     ffff800000113767 <_rodata+0xc07>
ffff8000001136ee:	2c 34                	sub    $0x34,%al
ffff8000001136f0:	3a 41 43             	cmp    0x43(%rcx),%al
ffff8000001136f3:	50                   	push   %rax
ffff8000001136f4:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
ffff8000001136f8:	53                   	push   %rbx
ffff8000001136f9:	20 4d 65             	and    %cl,0x65(%rbp)
ffff8000001136fc:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001136fd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001136fe:	72 79                	jb     ffff800000113779 <_rodata+0xc19>
ffff800000113700:	2c 4f                	sub    $0x4f,%al
ffff800000113702:	74 68                	je     ffff80000011376c <_rodata+0xc0c>
ffff800000113704:	65 72 73             	gs jb  ffff80000011377a <_rodata+0xc1a>
ffff800000113707:	3a 55 6e             	cmp    0x6e(%rbp),%dl
ffff80000011370a:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
ffff800000113711:	0a 
ffff800000113712:	00 00                	add    %al,(%rax)
ffff800000113714:	00 00                	add    %al,(%rax)
ffff800000113716:	00 00                	add    %al,(%rax)
ffff800000113718:	4f 53                	rex.WRXB push %r11
ffff80000011371a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011371d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011371e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000113721:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000113727:	61                   	(bad)  
ffff800000113728:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113729:	20 52 41             	and    %dl,0x41(%rdx)
ffff80000011372c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff800038426756 <_ebss+0x382f71ee>
ffff800000113733:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113734:	78 0a                	js     ffff800000113740 <_rodata+0xbe0>
ffff800000113736:	00 00                	add    %al,(%rax)
ffff800000113738:	4f 53                	rex.WRXB push %r11
ffff80000011373a:	20 43 61             	and    %al,0x61(%rbx)
ffff80000011373d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011373e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000113741:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000113747:	61                   	(bad)  
ffff800000113748:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113749:	20 32                	and    %dh,(%rdx)
ffff80000011374b:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
ffff80000011374f:	47                   	rex.RXB
ffff800000113750:	45 73 3a             	rex.RB jae ffff80000011378d <_rodata+0xc2d>
ffff800000113753:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113758:	78 3d                	js     ffff800000113797 <_rodata+0xc37>
ffff80000011375a:	25 30 31 30 64       	and    $0x64303130,%eax
ffff80000011375f:	0a 00                	or     (%rax),%al
ffff800000113761:	00 00                	add    %al,(%rax)
ffff800000113763:	00 00                	add    %al,(%rax)
ffff800000113765:	00 00                	add    %al,(%rax)
ffff800000113767:	00 62 69             	add    %ah,0x69(%rdx)
ffff80000011376a:	74 73                	je     ffff8000001137df <_rodata+0xc7f>
ffff80000011376c:	5f                   	pop    %rdi
ffff80000011376d:	6d                   	insl   (%dx),%es:(%rdi)
ffff80000011376e:	61                   	(bad)  
ffff80000011376f:	70 3a                	jo     ffff8000001137ab <_rodata+0xc4b>
ffff800000113771:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113776:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113777:	78 2c                	js     ffff8000001137a5 <_rodata+0xc45>
ffff800000113779:	62                   	(bad)  
ffff80000011377a:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
ffff800000113781:	65 
ffff800000113782:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384267ab <_ebss+0x382f7243>
ffff800000113788:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113789:	78 2c                	js     ffff8000001137b7 <_rodata+0xc57>
ffff80000011378b:	62                   	(bad)  
ffff80000011378c:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
ffff800000113793:	67 
ffff800000113794:	74 68                	je     ffff8000001137fe <_rodata+0xc9e>
ffff800000113796:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384267bf <_ebss+0x382f7257>
ffff80000011379c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011379d:	78 0a                	js     ffff8000001137a9 <_rodata+0xc49>
ffff80000011379f:	00 70 61             	add    %dh,0x61(%rax)
ffff8000001137a2:	67 65 73 5f          	addr32 gs jae ffff800000113805 <_rodata+0xca5>
ffff8000001137a6:	73 74                	jae    ffff80000011381c <_rodata+0xcbc>
ffff8000001137a8:	72 75                	jb     ffff80000011381f <_rodata+0xcbf>
ffff8000001137aa:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff8000001137ae:	23 30                	and    (%rax),%esi
ffff8000001137b0:	31 38                	xor    %edi,(%rax)
ffff8000001137b2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001137b3:	78 2c                	js     ffff8000001137e1 <_rodata+0xc81>
ffff8000001137b5:	70 61                	jo     ffff800000113818 <_rodata+0xcb8>
ffff8000001137b7:	67 65 73 5f          	addr32 gs jae ffff80000011381a <_rodata+0xcba>
ffff8000001137bb:	73 69                	jae    ffff800000113826 <_rodata+0xcc6>
ffff8000001137bd:	7a 65                	jp     ffff800000113824 <_rodata+0xcc4>
ffff8000001137bf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384267e8 <_ebss+0x382f7280>
ffff8000001137c5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001137c6:	78 2c                	js     ffff8000001137f4 <_rodata+0xc94>
ffff8000001137c8:	70 61                	jo     ffff80000011382b <_rodata+0xccb>
ffff8000001137ca:	67 65 73 5f          	addr32 gs jae ffff80000011382d <_rodata+0xccd>
ffff8000001137ce:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001137cf:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001137d1:	67 74 68             	addr32 je ffff80000011383c <_rodata+0xcdc>
ffff8000001137d4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384267fd <_ebss+0x382f7295>
ffff8000001137da:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001137db:	78 0a                	js     ffff8000001137e7 <_rodata+0xc87>
ffff8000001137dd:	00 00                	add    %al,(%rax)
ffff8000001137df:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff8000001137e2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001137e3:	65 73 5f             	gs jae ffff800000113845 <_rodata+0xce5>
ffff8000001137e6:	73 74                	jae    ffff80000011385c <_rodata+0xcfc>
ffff8000001137e8:	72 75                	jb     ffff80000011385f <_rodata+0xcff>
ffff8000001137ea:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff8000001137ee:	23 30                	and    (%rax),%esi
ffff8000001137f0:	31 38                	xor    %edi,(%rax)
ffff8000001137f2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001137f3:	78 2c                	js     ffff800000113821 <_rodata+0xcc1>
ffff8000001137f5:	7a 6f                	jp     ffff800000113866 <_rodata+0xd06>
ffff8000001137f7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001137f8:	65 73 5f             	gs jae ffff80000011385a <_rodata+0xcfa>
ffff8000001137fb:	73 69                	jae    ffff800000113866 <_rodata+0xd06>
ffff8000001137fd:	7a 65                	jp     ffff800000113864 <_rodata+0xd04>
ffff8000001137ff:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426828 <_ebss+0x382f72c0>
ffff800000113805:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113806:	78 2c                	js     ffff800000113834 <_rodata+0xcd4>
ffff800000113808:	7a 6f                	jp     ffff800000113879 <_rodata+0xd19>
ffff80000011380a:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011380b:	65 73 5f             	gs jae ffff80000011386d <_rodata+0xd0d>
ffff80000011380e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011380f:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113811:	67 74 68             	addr32 je ffff80000011387c <_rodata+0xd1c>
ffff800000113814:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842683d <_ebss+0x382f72d5>
ffff80000011381a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011381b:	78 0a                	js     ffff800000113827 <_rodata+0xcc7>
ffff80000011381d:	00 00                	add    %al,(%rax)
ffff80000011381f:	00 7a 6f             	add    %bh,0x6f(%rdx)
ffff800000113822:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113823:	65 5f                	gs pop %rdi
ffff800000113825:	73 74                	jae    ffff80000011389b <_rodata+0xd3b>
ffff800000113827:	61                   	(bad)  
ffff800000113828:	72 74                	jb     ffff80000011389e <_rodata+0xd3e>
ffff80000011382a:	5f                   	pop    %rdi
ffff80000011382b:	61                   	(bad)  
ffff80000011382c:	64 64 72 65          	fs fs jb ffff800000113895 <_rodata+0xd35>
ffff800000113830:	73 73                	jae    ffff8000001138a5 <_rodata+0xd45>
ffff800000113832:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842685b <_ebss+0x382f72f3>
ffff800000113838:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113839:	78 2c                	js     ffff800000113867 <_rodata+0xd07>
ffff80000011383b:	7a 6f                	jp     ffff8000001138ac <_rodata+0xd4c>
ffff80000011383d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011383e:	65 5f                	gs pop %rdi
ffff800000113840:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113842:	64 5f                	fs pop %rdi
ffff800000113844:	61                   	(bad)  
ffff800000113845:	64 64 72 65          	fs fs jb ffff8000001138ae <_rodata+0xd4e>
ffff800000113849:	73 73                	jae    ffff8000001138be <_rodata+0xd5e>
ffff80000011384b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426874 <_ebss+0x382f730c>
ffff800000113851:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113852:	78 2c                	js     ffff800000113880 <_rodata+0xd20>
ffff800000113854:	7a 6f                	jp     ffff8000001138c5 <_rodata+0xd65>
ffff800000113856:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113857:	65 5f                	gs pop %rdi
ffff800000113859:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011385a:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011385c:	67 74 68             	addr32 je ffff8000001138c7 <_rodata+0xd67>
ffff80000011385f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426888 <_ebss+0x382f7320>
ffff800000113865:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113866:	78 2c                	js     ffff800000113894 <_rodata+0xd34>
ffff800000113868:	70 61                	jo     ffff8000001138cb <_rodata+0xd6b>
ffff80000011386a:	67 65 73 5f          	addr32 gs jae ffff8000001138cd <_rodata+0xd6d>
ffff80000011386e:	67 72 6f             	addr32 jb ffff8000001138e0 <_rodata+0xd80>
ffff800000113871:	75 70                	jne    ffff8000001138e3 <_rodata+0xd83>
ffff800000113873:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842689c <_ebss+0x382f7334>
ffff800000113879:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011387a:	78 2c                	js     ffff8000001138a8 <_rodata+0xd48>
ffff80000011387c:	70 61                	jo     ffff8000001138df <_rodata+0xd7f>
ffff80000011387e:	67 65 73 5f          	addr32 gs jae ffff8000001138e1 <_rodata+0xd81>
ffff800000113882:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113883:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113885:	67 74 68             	addr32 je ffff8000001138f0 <_rodata+0xd90>
ffff800000113888:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384268b1 <_ebss+0x382f7349>
ffff80000011388e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011388f:	78 0a                	js     ffff80000011389b <_rodata+0xd3b>
ffff800000113891:	00 00                	add    %al,(%rax)
ffff800000113893:	00 00                	add    %al,(%rax)
ffff800000113895:	00 00                	add    %al,(%rax)
ffff800000113897:	00 73 74             	add    %dh,0x74(%rbx)
ffff80000011389a:	61                   	(bad)  
ffff80000011389b:	72 74                	jb     ffff800000113911 <_rodata+0xdb1>
ffff80000011389d:	5f                   	pop    %rdi
ffff80000011389e:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff8000001138a1:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff8000384268cb <_ebss+0x382f7363>
ffff8000001138a8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001138a9:	78 2c                	js     ffff8000001138d7 <_rodata+0xd77>
ffff8000001138ab:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001138ad:	64 5f                	fs pop %rdi
ffff8000001138af:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff8000001138b2:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff8000384268dc <_ebss+0x382f7374>
ffff8000001138b9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001138ba:	78 2c                	js     ffff8000001138e8 <_rodata+0xd88>
ffff8000001138bc:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001138be:	64 5f                	fs pop %rdi
ffff8000001138c0:	64 61                	fs (bad) 
ffff8000001138c2:	74 61                	je     ffff800000113925 <_rodata+0xdc5>
ffff8000001138c4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384268ed <_ebss+0x382f7385>
ffff8000001138ca:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001138cb:	78 2c                	js     ffff8000001138f9 <_rodata+0xd99>
ffff8000001138cd:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001138cf:	64 5f                	fs pop %rdi
ffff8000001138d1:	62 72                	(bad)  
ffff8000001138d3:	6b 3a 25             	imul   $0x25,(%rdx),%edi
ffff8000001138d6:	23 30                	and    (%rax),%esi
ffff8000001138d8:	31 38                	xor    %edi,(%rax)
ffff8000001138da:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001138db:	78 2c                	js     ffff800000113909 <_rodata+0xda9>
ffff8000001138dd:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001138df:	64 5f                	fs pop %rdi
ffff8000001138e1:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001138e2:	66 5f                	pop    %di
ffff8000001138e4:	73 74                	jae    ffff80000011395a <_rodata+0xdfa>
ffff8000001138e6:	72 75                	jb     ffff80000011395d <_rodata+0xdfd>
ffff8000001138e8:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
ffff8000001138ec:	23 30                	and    (%rax),%esi
ffff8000001138ee:	31 38                	xor    %edi,(%rax)
ffff8000001138f0:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001138f1:	78 0a                	js     ffff8000001138fd <_rodata+0xd9d>
ffff8000001138f3:	00 47 6c             	add    %al,0x6c(%rdi)
ffff8000001138f6:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001138f7:	62 61 6c 5f 43       	(bad)
ffff8000001138fc:	52                   	push   %rdx
ffff8000001138fd:	33 09                	xor    (%rcx),%ecx
ffff8000001138ff:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426928 <_ebss+0x382f73c0>
ffff800000113905:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113906:	78 0a                	js     ffff800000113912 <_rodata+0xdb2>
ffff800000113908:	00 2a                	add    %ch,(%rdx)
ffff80000011390a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
ffff80000011390c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011390d:	62 61 6c 5f 43       	(bad)
ffff800000113912:	52                   	push   %rdx
ffff800000113913:	33 09                	xor    (%rcx),%ecx
ffff800000113915:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842693e <_ebss+0x382f73d6>
ffff80000011391b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011391c:	78 0a                	js     ffff800000113928 <_rodata+0xdc8>
ffff80000011391e:	00 2a                	add    %ch,(%rdx)
ffff800000113920:	2a 47 6c             	sub    0x6c(%rdi),%al
ffff800000113923:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113924:	62 61 6c 5f 43       	(bad)
ffff800000113929:	52                   	push   %rdx
ffff80000011392a:	33 09                	xor    (%rcx),%ecx
ffff80000011392c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426955 <_ebss+0x382f73ed>
ffff800000113932:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113933:	78 0a                	js     ffff80000011393f <_rodata+0xddf>
ffff800000113935:	00 00                	add    %al,(%rax)
ffff800000113937:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff80000011393a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011393b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011393c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff80000011393f:	61                   	(bad)  
ffff800000113940:	67 65 73 20          	addr32 gs jae ffff800000113964 <_rodata+0xe04>
ffff800000113944:	65 72 72             	gs jb  ffff8000001139b9 <_rodata+0xe59>
ffff800000113947:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113948:	72 20                	jb     ffff80000011396a <_rodata+0xe0a>
ffff80000011394a:	7a 6f                	jp     ffff8000001139bb <_rodata+0xe5b>
ffff80000011394c:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011394d:	65 5f                	gs pop %rdi
ffff80000011394f:	73 65                	jae    ffff8000001139b6 <_rodata+0xe56>
ffff800000113951:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113952:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
ffff800000113957:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113958:	64 65 78 0a          	fs gs js ffff800000113966 <_rodata+0xe06>
ffff80000011395c:	00 00                	add    %al,(%rax)
ffff80000011395e:	00 00                	add    %al,(%rax)
ffff800000113960:	38 32                	cmp    %dh,(%rdx)
ffff800000113962:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff800000113967:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113968:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
ffff80000011396f:	5f 
ffff800000113970:	49 52                	rex.WB push %r10
ffff800000113972:	51                   	push   %rcx
ffff800000113973:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842699c <_ebss+0x382f7434>
ffff800000113979:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011397a:	78 09                	js     ffff800000113985 <_rodata+0xe25>
ffff80000011397c:	00 6b 65             	add    %ch,0x65(%rbx)
ffff80000011397f:	79 20                	jns    ffff8000001139a1 <_rodata+0xe41>
ffff800000113981:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000113984:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff8000384269ae <_ebss+0x382f7446>
ffff80000011398b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011398c:	78 09                	js     ffff800000113997 <_rodata+0xe37>
ffff80000011398e:	00 00                	add    %al,(%rax)
ffff800000113990:	72 65                	jb     ffff8000001139f7 <_rodata+0xe97>
ffff800000113992:	67 73 3a             	addr32 jae ffff8000001139cf <_rodata+0xe6f>
ffff800000113995:	25 23 30 31 38       	and    $0x38313023,%eax
ffff80000011399a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011399b:	78 09                	js     ffff8000001139a6 <_rodata+0xe46>
ffff80000011399d:	3c 52                	cmp    $0x52,%al
ffff80000011399f:	49 50                	rex.WB push %r8
ffff8000001139a1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384269ca <_ebss+0x382f7462>
ffff8000001139a7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001139a8:	78 09                	js     ffff8000001139b3 <_rodata+0xe53>
ffff8000001139aa:	52                   	push   %rdx
ffff8000001139ab:	53                   	push   %rbx
ffff8000001139ac:	50                   	push   %rax
ffff8000001139ad:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384269d6 <_ebss+0x382f746e>
ffff8000001139b3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001139b4:	78 3e                	js     ffff8000001139f4 <_rodata+0xe94>
ffff8000001139b6:	0a 00                	or     (%rax),%al
ffff8000001139b8:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001139b9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001139ba:	5f                   	pop    %rdi
ffff8000001139bb:	73 79                	jae    ffff800000113a36 <_rodata+0xed6>
ffff8000001139bd:	73 74                	jae    ffff800000113a33 <_rodata+0xed3>
ffff8000001139bf:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff8000001139c1:	5f                   	pop    %rdi
ffff8000001139c2:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff8000001139c5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001139c6:	20 69 73             	and    %ch,0x73(%rcx)
ffff8000001139c9:	20 63 61             	and    %ah,0x61(%rbx)
ffff8000001139cc:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001139cd:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001139ce:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff8000001139d5:	25 23 30 34 78       	and    $0x78343023,%eax
ffff8000001139da:	0a 00                	or     (%rax),%al
ffff8000001139dc:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001139de:	5f                   	pop    %rdi
ffff8000001139df:	65 78 65             	gs js  ffff800000113a47 <_rodata+0xee7>
ffff8000001139e2:	63 76 65             	movsxd 0x65(%rsi),%esi
ffff8000001139e5:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff8000001139e9:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff8000001139ec:	73 20                	jae    ffff800000113a0e <_rodata+0xeae>
ffff8000001139ee:	72 75                	jb     ffff800000113a65 <_rodata+0xf05>
ffff8000001139f0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001139f1:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001139f2:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
ffff8000001139f9:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001139fa:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000113a01:	20 
ffff800000113a02:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000113a09:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000113a10:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426a39 <_ebss+0x382f74d1>
ffff800000113a16:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a17:	78 0a                	js     ffff800000113a23 <_rodata+0xec3>
ffff800000113a19:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff800000113a1d:	46                   	rex.RX
ffff800000113a1e:	4f 52                	rex.WRXB push %r10
ffff800000113a20:	4b 20 53 54          	rex.WXB and %dl,0x54(%r11)
ffff800000113a24:	41 52                	push   %r10
ffff800000113a26:	54                   	push   %rsp
ffff800000113a27:	0a 00                	or     (%rax),%al
ffff800000113a29:	61                   	(bad)  
ffff800000113a2a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a2b:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a2c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113a2d:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff800000113a30:	61                   	(bad)  
ffff800000113a31:	67 65 73 2c          	addr32 gs jae ffff800000113a61 <_rodata+0xf01>
ffff800000113a35:	62                   	(bad)  
ffff800000113a36:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
ffff800000113a3d:	23 
ffff800000113a3e:	30 31                	xor    %dh,(%rcx)
ffff800000113a40:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
ffff800000113a44:	00 00                	add    %al,(%rax)
ffff800000113a46:	00 00                	add    %al,(%rax)
ffff800000113a48:	73 74                	jae    ffff800000113abe <_rodata+0xf5e>
ffff800000113a4a:	72 75                	jb     ffff800000113ac1 <_rodata+0xf61>
ffff800000113a4c:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
ffff800000113a50:	61                   	(bad)  
ffff800000113a51:	73 6b                	jae    ffff800000113abe <_rodata+0xf5e>
ffff800000113a53:	5f                   	pop    %rdi
ffff800000113a54:	73 74                	jae    ffff800000113aca <_rodata+0xf6a>
ffff800000113a56:	72 75                	jb     ffff800000113acd <_rodata+0xf6d>
ffff800000113a58:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
ffff800000113a5c:	64 64 72 65          	fs fs jb ffff800000113ac5 <_rodata+0xf65>
ffff800000113a60:	73 73                	jae    ffff800000113ad5 <_rodata+0xf75>
ffff800000113a62:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426a8b <_ebss+0x382f7523>
ffff800000113a68:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a69:	78 0a                	js     ffff800000113a75 <_rodata+0xf15>
ffff800000113a6b:	00 74 68 64          	add    %dh,0x64(%rax,%rbp,2)
ffff800000113a6f:	2d 3e 66 73 3a       	sub    $0x3a73663e,%eax
ffff800000113a74:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113a79:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a7a:	78 0a                	js     ffff800000113a86 <_rodata+0xf26>
ffff800000113a7c:	00 74 68 64          	add    %dh,0x64(%rax,%rbp,2)
ffff800000113a80:	2d 3e 67 73 3a       	sub    $0x3a73673e,%eax
ffff800000113a85:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113a8a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113a8b:	78 0a                	js     ffff800000113a97 <_rodata+0xf37>
ffff800000113a8d:	00 44 4f 20          	add    %al,0x20(%rdi,%rcx,2)
ffff800000113a91:	46                   	rex.RX
ffff800000113a92:	4f 52                	rex.WRXB push %r10
ffff800000113a94:	4b 20 46 49          	rex.WXB and %al,0x49(%r14)
ffff800000113a98:	4e                   	rex.WRX
ffff800000113a99:	49 53                	rex.WB push %r11
ffff800000113a9b:	48 0a 00             	rex.W or (%rax),%al
ffff800000113a9e:	00 00                	add    %al,(%rax)
ffff800000113aa0:	65 78 69             	gs js  ffff800000113b0c <_rodata+0xfac>
ffff800000113aa3:	74 20                	je     ffff800000113ac5 <_rodata+0xf65>
ffff800000113aa5:	74 61                	je     ffff800000113b08 <_rodata+0xfa8>
ffff800000113aa7:	73 6b                	jae    ffff800000113b14 <_rodata+0xfb4>
ffff800000113aa9:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000113aac:	20 72 75             	and    %dh,0x75(%rdx)
ffff800000113aaf:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113ab0:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113ab1:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000113ab8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038426ae1 <_ebss+0x382f7579>
ffff800000113abe:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113abf:	78 0a                	js     ffff800000113acb <_rodata+0xf6b>
ffff800000113ac1:	00 5f 5f             	add    %bl,0x5f(%rdi)
ffff800000113ac4:	53                   	push   %rbx
ffff800000113ac5:	57                   	push   %rdi
ffff800000113ac6:	49 54                	rex.WB push %r12
ffff800000113ac8:	43                   	rex.XB
ffff800000113ac9:	48 5f                	rex.W pop %rdi
ffff800000113acb:	54                   	push   %rsp
ffff800000113acc:	4f 20 53 54          	rex.WRXB and %r10b,0x54(%r11)
ffff800000113ad0:	41 52                	push   %r10
ffff800000113ad2:	54                   	push   %rsp
ffff800000113ad3:	0a 00                	or     (%rax),%al
ffff800000113ad5:	70 72                	jo     ffff800000113b49 <_rodata+0xfe9>
ffff800000113ad7:	65 76 2d             	gs jbe ffff800000113b07 <_rodata+0xfa7>
ffff800000113ada:	3e 74 68             	je,pt  ffff800000113b45 <_rodata+0xfe5>
ffff800000113add:	72 65                	jb     ffff800000113b44 <_rodata+0xfe4>
ffff800000113adf:	61                   	(bad)  
ffff800000113ae0:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000113ae6:	30 3a                	xor    %bh,(%rdx)
ffff800000113ae8:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113aed:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113aee:	78 0a                	js     ffff800000113afa <_rodata+0xf9a>
ffff800000113af0:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000113af3:	78 74                	js     ffff800000113b69 <_rodata+0x1009>
ffff800000113af5:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000113afa:	65 61                	gs (bad) 
ffff800000113afc:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000113b02:	30 3a                	xor    %bh,(%rdx)
ffff800000113b04:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113b09:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113b0a:	78 0a                	js     ffff800000113b16 <_rodata+0xfb6>
ffff800000113b0c:	00 53 41             	add    %dl,0x41(%rbx)
ffff800000113b0f:	56                   	push   %rsi
ffff800000113b10:	45 20 50 52          	and    %r10b,0x52(%r8)
ffff800000113b14:	45 56                	rex.RB push %r14
ffff800000113b16:	20 46 53             	and    %al,0x53(%rsi)
ffff800000113b19:	20 47 53             	and    %al,0x53(%rdi)
ffff800000113b1c:	0a 00                	or     (%rax),%al
ffff800000113b1e:	4c                   	rex.WR
ffff800000113b1f:	4f                   	rex.WRXB
ffff800000113b20:	41                   	rex.B
ffff800000113b21:	44 20 4e 45          	and    %r9b,0x45(%rsi)
ffff800000113b25:	58                   	pop    %rax
ffff800000113b26:	54                   	push   %rsp
ffff800000113b27:	20 46 53             	and    %al,0x53(%rsi)
ffff800000113b2a:	20 47 53             	and    %al,0x53(%rdi)
ffff800000113b2d:	0a 00                	or     (%rax),%al
ffff800000113b2f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113b30:	65 78 74             	gs js  ffff800000113ba7 <_rodata+0x1047>
ffff800000113b33:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000113b38:	65 61                	gs (bad) 
ffff800000113b3a:	64 2d 3e 66 73 3a    	fs sub $0x3a73663e,%eax
ffff800000113b40:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113b45:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113b46:	78 0a                	js     ffff800000113b52 <_rodata+0xff2>
ffff800000113b48:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000113b4b:	78 74                	js     ffff800000113bc1 <_rodata+0x1061>
ffff800000113b4d:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000113b52:	65 61                	gs (bad) 
ffff800000113b54:	64 2d 3e 67 73 3a    	fs sub $0x3a73673e,%eax
ffff800000113b5a:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000113b5f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000113b60:	78 0a                	js     ffff800000113b6c <_rodata+0x100c>
ffff800000113b62:	00 5f 5f             	add    %bl,0x5f(%rdi)
ffff800000113b65:	53                   	push   %rbx
ffff800000113b66:	57                   	push   %rdi
ffff800000113b67:	49 54                	rex.WB push %r12
ffff800000113b69:	43                   	rex.XB
ffff800000113b6a:	48 5f                	rex.W pop %rdi
ffff800000113b6c:	54                   	push   %rsp
ffff800000113b6d:	4f 20 46 49          	rex.WRXB and %r8b,0x49(%r14)
ffff800000113b71:	4e                   	rex.WRX
ffff800000113b72:	49 53                	rex.WB push %r11
ffff800000113b74:	48 0a 00             	rex.W or (%rax),%al
ffff800000113b77:	00 25 73 09 25 23    	add    %ah,0x23250973(%rip)        # ffff8000233644f0 <_ebss+0x23234f88>
ffff800000113b7d:	30 31                	xor    %dh,(%rcx)
ffff800000113b7f:	30 78 09             	xor    %bh,0x9(%rax)
ffff800000113b82:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113b87:	78 09                	js     ffff800000113b92 <_rodata+0x1032>
ffff800000113b89:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113b8e:	78 0a                	js     ffff800000113b9a <_rodata+0x103a>
ffff800000113b90:	00 25 73 00 0a 00    	add    %ah,0xa0073(%rip)        # ffff8000001b3c09 <_ebss+0x846a1>
ffff800000113b96:	00 00                	add    %al,(%rax)
ffff800000113b98:	46 61                	rex.RX (bad) 
ffff800000113b9a:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000113b9b:	69 6c 79 20 43 6f 64 	imul   $0x65646f43,0x20(%rcx,%rdi,2),%ebp
ffff800000113ba2:	65 
ffff800000113ba3:	3a 25 23 30 31 30    	cmp    0x30313023(%rip),%ah        # ffff800030426bcc <_ebss+0x302f7664>
ffff800000113ba9:	78 2c                	js     ffff800000113bd7 <_rodata+0x1077>
ffff800000113bab:	45 78 74             	rex.RB js ffff800000113c22 <_rodata+0x10c2>
ffff800000113bae:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113bb0:	64 65 64 20 46 61    	fs gs and %al,%fs:0x61(%rsi)
ffff800000113bb6:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000113bb7:	69 6c 79 3a 25 23 30 	imul   $0x31302325,0x3a(%rcx,%rdi,2),%ebp
ffff800000113bbe:	31 
ffff800000113bbf:	30 78 2c             	xor    %bh,0x2c(%rax)
ffff800000113bc2:	4d 6f                	rex.WRB outsl %ds:(%rsi),(%dx)
ffff800000113bc4:	64 65 6c             	fs gs insb (%dx),%es:(%rdi)
ffff800000113bc7:	20 4e 75             	and    %cl,0x75(%rsi)
ffff800000113bca:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000113bcb:	62                   	(bad)  
ffff800000113bcc:	65 72 3a             	gs jb  ffff800000113c09 <_rodata+0x10a9>
ffff800000113bcf:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113bd4:	78 2c                	js     ffff800000113c02 <_rodata+0x10a2>
ffff800000113bd6:	45 78 74             	rex.RB js ffff800000113c4d <_rodata+0x10ed>
ffff800000113bd9:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000113bdb:	64 65 64 20 4d 6f    	fs gs and %cl,%fs:0x6f(%rbp)
ffff800000113be1:	64 65 6c             	fs gs insb (%dx),%es:(%rdi)
ffff800000113be4:	3a 25 23 30 31 30    	cmp    0x30313023(%rip),%ah        # ffff800030426c0d <_ebss+0x302f76a5>
ffff800000113bea:	78 2c                	js     ffff800000113c18 <_rodata+0x10b8>
ffff800000113bec:	50                   	push   %rax
ffff800000113bed:	72 6f                	jb     ffff800000113c5e <_rodata+0x10fe>
ffff800000113bef:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff800000113bf2:	73 6f                	jae    ffff800000113c63 <_rodata+0x1103>
ffff800000113bf4:	72 20                	jb     ffff800000113c16 <_rodata+0x10b6>
ffff800000113bf6:	54                   	push   %rsp
ffff800000113bf7:	79 70                	jns    ffff800000113c69 <_rodata+0x1109>
ffff800000113bf9:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # ffff800030426c23 <_ebss+0x302f76bb>
ffff800000113c00:	78 2c                	js     ffff800000113c2e <_rodata+0x10ce>
ffff800000113c02:	53                   	push   %rbx
ffff800000113c03:	74 65                	je     ffff800000113c6a <_rodata+0x110a>
ffff800000113c05:	70 70                	jo     ffff800000113c77 <_rodata+0x1117>
ffff800000113c07:	69 6e 67 20 49 44 3a 	imul   $0x3a444920,0x67(%rsi),%ebp
ffff800000113c0e:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113c13:	78 0a                	js     ffff800000113c1f <_rodata+0x10bf>
ffff800000113c15:	00 00                	add    %al,(%rax)
ffff800000113c17:	00 50 68             	add    %dl,0x68(%rax)
ffff800000113c1a:	79 73                	jns    ffff800000113c8f <_rodata+0x112f>
ffff800000113c1c:	69 63 61 6c 20 41 64 	imul   $0x6441206c,0x61(%rbx),%esp
ffff800000113c23:	64 72 65             	fs jb  ffff800000113c8b <_rodata+0x112b>
ffff800000113c26:	73 73                	jae    ffff800000113c9b <_rodata+0x113b>
ffff800000113c28:	20 73 69             	and    %dh,0x69(%rbx)
ffff800000113c2b:	7a 65                	jp     ffff800000113c92 <_rodata+0x1132>
ffff800000113c2d:	3a 25 30 38 64 2c    	cmp    0x2c643830(%rip),%ah        # ffff80002c757463 <_ebss+0x2c627efb>
ffff800000113c33:	4c 69 6e 65 61 72 20 	imul   $0x41207261,0x65(%rsi),%r13
ffff800000113c3a:	41 
ffff800000113c3b:	64 64 72 65          	fs fs jb ffff800000113ca4 <_erodata+0x7>
ffff800000113c3f:	73 73                	jae    ffff800000113cb4 <_erodata+0x17>
ffff800000113c41:	20 73 69             	and    %dh,0x69(%rbx)
ffff800000113c44:	7a 65                	jp     ffff800000113cab <_erodata+0xe>
ffff800000113c46:	3a 25 30 38 64 0a    	cmp    0xa643830(%rip),%ah        # ffff80000a75747c <_ebss+0xa627f14>
ffff800000113c4c:	00 00                	add    %al,(%rax)
ffff800000113c4e:	00 00                	add    %al,(%rax)
ffff800000113c50:	4d                   	rex.WRB
ffff800000113c51:	41 58                	pop    %r8
ffff800000113c53:	20 42 61             	and    %al,0x61(%rdx)
ffff800000113c56:	73 69                	jae    ffff800000113cc1 <_erodata+0x24>
ffff800000113c58:	63 20                	movsxd (%rax),%esp
ffff800000113c5a:	4f 70 65             	rex.WRXB jo ffff800000113cc2 <_erodata+0x25>
ffff800000113c5d:	72 61                	jb     ffff800000113cc0 <_erodata+0x23>
ffff800000113c5f:	74 69                	je     ffff800000113cca <_erodata+0x2d>
ffff800000113c61:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113c62:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113c63:	20 43 6f             	and    %al,0x6f(%rbx)
ffff800000113c66:	64 65 20 3a          	fs and %bh,%gs:(%rdx)
ffff800000113c6a:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113c6f:	78 09                	js     ffff800000113c7a <_rodata+0x111a>
ffff800000113c71:	00 00                	add    %al,(%rax)
ffff800000113c73:	00 00                	add    %al,(%rax)
ffff800000113c75:	00 00                	add    %al,(%rax)
ffff800000113c77:	00 4d 41             	add    %cl,0x41(%rbp)
ffff800000113c7a:	58                   	pop    %rax
ffff800000113c7b:	20 45 78             	and    %al,0x78(%rbp)
ffff800000113c7e:	74 65                	je     ffff800000113ce5 <_erodata+0x48>
ffff800000113c80:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113c81:	64 65 64 20 4f 70    	fs gs and %cl,%fs:0x70(%rdi)
ffff800000113c87:	65 72 61             	gs jb  ffff800000113ceb <_erodata+0x4e>
ffff800000113c8a:	74 69                	je     ffff800000113cf5 <_erodata+0x58>
ffff800000113c8c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000113c8d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000113c8e:	20 43 6f             	and    %al,0x6f(%rbx)
ffff800000113c91:	64 65 20 3a          	fs and %bh,%gs:(%rdx)
ffff800000113c95:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000113c9a:	78 0a                	js     ffff800000113ca6 <_erodata+0x9>
	...

Disassembly of section .eh_frame:

ffff800000113ca0 <.eh_frame>:
ffff800000113ca0:	14 00                	adc    $0x0,%al
ffff800000113ca2:	00 00                	add    %al,(%rax)
ffff800000113ca4:	00 00                	add    %al,(%rax)
ffff800000113ca6:	00 00                	add    %al,(%rax)
ffff800000113ca8:	01 7a 52             	add    %edi,0x52(%rdx)
ffff800000113cab:	00 01                	add    %al,(%rcx)
ffff800000113cad:	78 10                	js     ffff800000113cbf <_erodata+0x22>
ffff800000113caf:	01 1b                	add    %ebx,(%rbx)
ffff800000113cb1:	0c 07                	or     $0x7,%al
ffff800000113cb3:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff800000113cb9:	00 00                	add    %al,(%rax)
ffff800000113cbb:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113cbe:	00 00                	add    %al,(%rax)
ffff800000113cc0:	b5 05                	mov    $0x5,%ch
ffff800000113cc2:	ff                   	(bad)  
ffff800000113cc3:	ff c9                	dec    %ecx
ffff800000113cc5:	00 00                	add    %al,(%rax)
ffff800000113cc7:	00 00                	add    %al,(%rax)
ffff800000113cc9:	41 0e                	rex.B (bad) 
ffff800000113ccb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113cd1:	02 c4                	add    %ah,%al
ffff800000113cd3:	0c 07                	or     $0x7,%al
ffff800000113cd5:	08 00                	or     %al,(%rax)
ffff800000113cd7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113cda:	00 00                	add    %al,(%rax)
ffff800000113cdc:	3c 00                	cmp    $0x0,%al
ffff800000113cde:	00 00                	add    %al,(%rax)
ffff800000113ce0:	5e                   	pop    %rsi
ffff800000113ce1:	06                   	(bad)  
ffff800000113ce2:	ff                   	(bad)  
ffff800000113ce3:	ff 49 00             	decl   0x0(%rcx)
ffff800000113ce6:	00 00                	add    %al,(%rax)
ffff800000113ce8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113ceb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113cf1:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000113cf5:	08 00                	or     %al,(%rax)
ffff800000113cf7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113cfa:	00 00                	add    %al,(%rax)
ffff800000113cfc:	5c                   	pop    %rsp
ffff800000113cfd:	00 00                	add    %al,(%rax)
ffff800000113cff:	00 87 06 ff ff 39    	add    %al,0x39ffff06(%rdi)
ffff800000113d05:	00 00                	add    %al,(%rax)
ffff800000113d07:	00 00                	add    %al,(%rax)
ffff800000113d09:	41 0e                	rex.B (bad) 
ffff800000113d0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113d11:	74 0c                	je     ffff800000113d1f <_erodata+0x82>
ffff800000113d13:	07                   	(bad)  
ffff800000113d14:	08 00                	or     %al,(%rax)
ffff800000113d16:	00 00                	add    %al,(%rax)
ffff800000113d18:	1c 00                	sbb    $0x0,%al
ffff800000113d1a:	00 00                	add    %al,(%rax)
ffff800000113d1c:	7c 00                	jl     ffff800000113d1e <_erodata+0x81>
ffff800000113d1e:	00 00                	add    %al,(%rax)
ffff800000113d20:	a0 06 ff ff 88 02 00 	movabs 0x288ffff06,%al
ffff800000113d27:	00 00 
ffff800000113d29:	41 0e                	rex.B (bad) 
ffff800000113d2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113d31:	00 00                	add    %al,(%rax)
ffff800000113d33:	00 00                	add    %al,(%rax)
ffff800000113d35:	00 00                	add    %al,(%rax)
ffff800000113d37:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113d3a:	00 00                	add    %al,(%rax)
ffff800000113d3c:	9c                   	pushfq 
ffff800000113d3d:	00 00                	add    %al,(%rax)
ffff800000113d3f:	00 08                	add    %cl,(%rax)
ffff800000113d41:	09 ff                	or     %edi,%edi
ffff800000113d43:	ff 2f                	ljmp   *(%rdi)
ffff800000113d45:	00 00                	add    %al,(%rax)
ffff800000113d47:	00 00                	add    %al,(%rax)
ffff800000113d49:	41 0e                	rex.B (bad) 
ffff800000113d4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113d51:	41 83 03 69          	addl   $0x69,(%r11)
ffff800000113d55:	0c 07                	or     $0x7,%al
ffff800000113d57:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff800000113d5a:	00 00                	add    %al,(%rax)
ffff800000113d5c:	bc 00 00 00 17       	mov    $0x17000000,%esp
ffff800000113d61:	09 ff                	or     %edi,%edi
ffff800000113d63:	ff                   	(bad)  
ffff800000113d64:	ef                   	out    %eax,(%dx)
ffff800000113d65:	00 00                	add    %al,(%rax)
ffff800000113d67:	00 00                	add    %al,(%rax)
ffff800000113d69:	41 0e                	rex.B (bad) 
ffff800000113d6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113d71:	02 ea                	add    %dl,%ch
ffff800000113d73:	0c 07                	or     $0x7,%al
ffff800000113d75:	08 00                	or     %al,(%rax)
ffff800000113d77:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113d7a:	00 00                	add    %al,(%rax)
ffff800000113d7c:	dc 00                	faddl  (%rax)
ffff800000113d7e:	00 00                	add    %al,(%rax)
ffff800000113d80:	e6 09                	out    %al,$0x9
ffff800000113d82:	ff                   	(bad)  
ffff800000113d83:	ff 60 00             	jmpq   *0x0(%rax)
ffff800000113d86:	00 00                	add    %al,(%rax)
ffff800000113d88:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113d8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113d91:	02 5b 0c             	add    0xc(%rbx),%bl
ffff800000113d94:	07                   	(bad)  
ffff800000113d95:	08 00                	or     %al,(%rax)
ffff800000113d97:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113d9a:	00 00                	add    %al,(%rax)
ffff800000113d9c:	fc                   	cld    
ffff800000113d9d:	00 00                	add    %al,(%rax)
ffff800000113d9f:	00 26                	add    %ah,(%rsi)
ffff800000113da1:	0a ff                	or     %bh,%bh
ffff800000113da3:	ff 76 02             	pushq  0x2(%rsi)
ffff800000113da6:	00 00                	add    %al,(%rax)
ffff800000113da8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113dab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113db1:	03 71 02             	add    0x2(%rcx),%esi
ffff800000113db4:	0c 07                	or     $0x7,%al
ffff800000113db6:	08 00                	or     %al,(%rax)
ffff800000113db8:	1c 00                	sbb    $0x0,%al
ffff800000113dba:	00 00                	add    %al,(%rax)
ffff800000113dbc:	1c 01                	sbb    $0x1,%al
ffff800000113dbe:	00 00                	add    %al,(%rax)
ffff800000113dc0:	7c 0c                	jl     ffff800000113dce <_erodata+0x131>
ffff800000113dc2:	ff                   	(bad)  
ffff800000113dc3:	ff                   	(bad)  
ffff800000113dc4:	f9                   	stc    
ffff800000113dc5:	08 00                	or     %al,(%rax)
ffff800000113dc7:	00 00                	add    %al,(%rax)
ffff800000113dc9:	41 0e                	rex.B (bad) 
ffff800000113dcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113dd1:	03 f4                	add    %esp,%esi
ffff800000113dd3:	08 0c 07             	or     %cl,(%rdi,%rax,1)
ffff800000113dd6:	08 00                	or     %al,(%rax)
ffff800000113dd8:	1c 00                	sbb    $0x0,%al
ffff800000113dda:	00 00                	add    %al,(%rax)
ffff800000113ddc:	3c 01                	cmp    $0x1,%al
ffff800000113dde:	00 00                	add    %al,(%rax)
ffff800000113de0:	55                   	push   %rbp
ffff800000113de1:	15 ff ff 29 05       	adc    $0x529ffff,%eax
ffff800000113de6:	00 00                	add    %al,(%rax)
ffff800000113de8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113deb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113df1:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
ffff800000113df8:	1c 00                	sbb    $0x0,%al
ffff800000113dfa:	00 00                	add    %al,(%rax)
ffff800000113dfc:	5c                   	pop    %rsp
ffff800000113dfd:	01 00                	add    %eax,(%rax)
ffff800000113dff:	00 5e 1a             	add    %bl,0x1a(%rsi)
ffff800000113e02:	ff                   	(bad)  
ffff800000113e03:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000113e09:	41 0e                	rex.B (bad) 
ffff800000113e0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113e11:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000113e17:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113e1a:	00 00                	add    %al,(%rax)
ffff800000113e1c:	7c 01                	jl     ffff800000113e1f <_erodata+0x182>
ffff800000113e1e:	00 00                	add    %al,(%rax)
ffff800000113e20:	cd 1a                	int    $0x1a
ffff800000113e22:	ff                   	(bad)  
ffff800000113e23:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000113e29:	41 0e                	rex.B (bad) 
ffff800000113e2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113e31:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000113e37:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113e3a:	00 00                	add    %al,(%rax)
ffff800000113e3c:	9c                   	pushfq 
ffff800000113e3d:	01 00                	add    %eax,(%rax)
ffff800000113e3f:	00 3c 1b             	add    %bh,(%rbx,%rbx,1)
ffff800000113e42:	ff                   	(bad)  
ffff800000113e43:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000113e49:	41 0e                	rex.B (bad) 
ffff800000113e4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113e51:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000113e57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000113e5a:	00 00                	add    %al,(%rax)
ffff800000113e5c:	bc 01 00 00 ab       	mov    $0xab000001,%esp
ffff800000113e61:	1b ff                	sbb    %edi,%edi
ffff800000113e63:	ff c9                	dec    %ecx
ffff800000113e65:	00 00                	add    %al,(%rax)
ffff800000113e67:	00 00                	add    %al,(%rax)
ffff800000113e69:	41 0e                	rex.B (bad) 
ffff800000113e6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113e71:	02 c4                	add    %ah,%al
ffff800000113e73:	0c 07                	or     $0x7,%al
ffff800000113e75:	08 00                	or     %al,(%rax)
ffff800000113e77:	00 18                	add    %bl,(%rax)
ffff800000113e79:	00 00                	add    %al,(%rax)
ffff800000113e7b:	00 dc                	add    %bl,%ah
ffff800000113e7d:	01 00                	add    %eax,(%rax)
ffff800000113e7f:	00 54 1c ff          	add    %dl,-0x1(%rsp,%rbx,1)
ffff800000113e83:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113e86:	00 00                	add    %al,(%rax)
ffff800000113e88:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113e8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113e91:	00 00                	add    %al,(%rax)
ffff800000113e93:	00 18                	add    %bl,(%rax)
ffff800000113e95:	00 00                	add    %al,(%rax)
ffff800000113e97:	00 f8                	add    %bh,%al
ffff800000113e99:	01 00                	add    %eax,(%rax)
ffff800000113e9b:	00 93 1c ff ff 5b    	add    %dl,0x5bffff1c(%rbx)
ffff800000113ea1:	00 00                	add    %al,(%rax)
ffff800000113ea3:	00 00                	add    %al,(%rax)
ffff800000113ea5:	41 0e                	rex.B (bad) 
ffff800000113ea7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113ead:	00 00                	add    %al,(%rax)
ffff800000113eaf:	00 18                	add    %bl,(%rax)
ffff800000113eb1:	00 00                	add    %al,(%rax)
ffff800000113eb3:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff800000113eb6:	00 00                	add    %al,(%rax)
ffff800000113eb8:	d2 1c ff             	rcrb   %cl,(%rdi,%rdi,8)
ffff800000113ebb:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113ebe:	00 00                	add    %al,(%rax)
ffff800000113ec0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113ec3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113ec9:	00 00                	add    %al,(%rax)
ffff800000113ecb:	00 18                	add    %bl,(%rax)
ffff800000113ecd:	00 00                	add    %al,(%rax)
ffff800000113ecf:	00 30                	add    %dh,(%rax)
ffff800000113ed1:	02 00                	add    (%rax),%al
ffff800000113ed3:	00 11                	add    %dl,(%rcx)
ffff800000113ed5:	1d ff ff 5b 00       	sbb    $0x5bffff,%eax
ffff800000113eda:	00 00                	add    %al,(%rax)
ffff800000113edc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113edf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113ee5:	00 00                	add    %al,(%rax)
ffff800000113ee7:	00 18                	add    %bl,(%rax)
ffff800000113ee9:	00 00                	add    %al,(%rax)
ffff800000113eeb:	00 4c 02 00          	add    %cl,0x0(%rdx,%rax,1)
ffff800000113eef:	00 50 1d             	add    %dl,0x1d(%rax)
ffff800000113ef2:	ff                   	(bad)  
ffff800000113ef3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113ef6:	00 00                	add    %al,(%rax)
ffff800000113ef8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113efb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f01:	00 00                	add    %al,(%rax)
ffff800000113f03:	00 18                	add    %bl,(%rax)
ffff800000113f05:	00 00                	add    %al,(%rax)
ffff800000113f07:	00 68 02             	add    %ch,0x2(%rax)
ffff800000113f0a:	00 00                	add    %al,(%rax)
ffff800000113f0c:	8f                   	(bad)  
ffff800000113f0d:	1d ff ff 5b 00       	sbb    $0x5bffff,%eax
ffff800000113f12:	00 00                	add    %al,(%rax)
ffff800000113f14:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113f17:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f1d:	00 00                	add    %al,(%rax)
ffff800000113f1f:	00 18                	add    %bl,(%rax)
ffff800000113f21:	00 00                	add    %al,(%rax)
ffff800000113f23:	00 84 02 00 00 ce 1d 	add    %al,0x1dce0000(%rdx,%rax,1)
ffff800000113f2a:	ff                   	(bad)  
ffff800000113f2b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113f2e:	00 00                	add    %al,(%rax)
ffff800000113f30:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113f33:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f39:	00 00                	add    %al,(%rax)
ffff800000113f3b:	00 18                	add    %bl,(%rax)
ffff800000113f3d:	00 00                	add    %al,(%rax)
ffff800000113f3f:	00 a0 02 00 00 0d    	add    %ah,0xd000002(%rax)
ffff800000113f45:	1e                   	(bad)  
ffff800000113f46:	ff                   	(bad)  
ffff800000113f47:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113f4a:	00 00                	add    %al,(%rax)
ffff800000113f4c:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113f4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f55:	00 00                	add    %al,(%rax)
ffff800000113f57:	00 18                	add    %bl,(%rax)
ffff800000113f59:	00 00                	add    %al,(%rax)
ffff800000113f5b:	00 bc 02 00 00 4c 1e 	add    %bh,0x1e4c0000(%rdx,%rax,1)
ffff800000113f62:	ff                   	(bad)  
ffff800000113f63:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000113f66:	00 00                	add    %al,(%rax)
ffff800000113f68:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113f6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f71:	00 00                	add    %al,(%rax)
ffff800000113f73:	00 18                	add    %bl,(%rax)
ffff800000113f75:	00 00                	add    %al,(%rax)
ffff800000113f77:	00 d8                	add    %bl,%al
ffff800000113f79:	02 00                	add    (%rax),%al
ffff800000113f7b:	00 8b 1e ff ff 5b    	add    %cl,0x5bffff1e(%rbx)
ffff800000113f81:	00 00                	add    %al,(%rax)
ffff800000113f83:	00 00                	add    %al,(%rax)
ffff800000113f85:	41 0e                	rex.B (bad) 
ffff800000113f87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113f8d:	00 00                	add    %al,(%rax)
ffff800000113f8f:	00 18                	add    %bl,(%rax)
ffff800000113f91:	00 00                	add    %al,(%rax)
ffff800000113f93:	00 f4                	add    %dh,%ah
ffff800000113f95:	02 00                	add    (%rax),%al
ffff800000113f97:	00 ca                	add    %cl,%dl
ffff800000113f99:	1e                   	(bad)  
ffff800000113f9a:	ff                   	(bad)  
ffff800000113f9b:	ff                   	(bad)  
ffff800000113f9c:	7a 01                	jp     ffff800000113f9f <_erodata+0x302>
ffff800000113f9e:	00 00                	add    %al,(%rax)
ffff800000113fa0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113fa3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113fa9:	00 00                	add    %al,(%rax)
ffff800000113fab:	00 18                	add    %bl,(%rax)
ffff800000113fad:	00 00                	add    %al,(%rax)
ffff800000113faf:	00 10                	add    %dl,(%rax)
ffff800000113fb1:	03 00                	add    (%rax),%eax
ffff800000113fb3:	00 28                	add    %ch,(%rax)
ffff800000113fb5:	20 ff                	and    %bh,%bh
ffff800000113fb7:	ff                   	(bad)  
ffff800000113fb8:	7a 01                	jp     ffff800000113fbb <_erodata+0x31e>
ffff800000113fba:	00 00                	add    %al,(%rax)
ffff800000113fbc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113fbf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113fc5:	00 00                	add    %al,(%rax)
ffff800000113fc7:	00 18                	add    %bl,(%rax)
ffff800000113fc9:	00 00                	add    %al,(%rax)
ffff800000113fcb:	00 2c 03             	add    %ch,(%rbx,%rax,1)
ffff800000113fce:	00 00                	add    %al,(%rax)
ffff800000113fd0:	86 21                	xchg   %ah,(%rcx)
ffff800000113fd2:	ff                   	(bad)  
ffff800000113fd3:	ff                   	(bad)  
ffff800000113fd4:	7a 01                	jp     ffff800000113fd7 <_erodata+0x33a>
ffff800000113fd6:	00 00                	add    %al,(%rax)
ffff800000113fd8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113fdb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113fe1:	00 00                	add    %al,(%rax)
ffff800000113fe3:	00 18                	add    %bl,(%rax)
ffff800000113fe5:	00 00                	add    %al,(%rax)
ffff800000113fe7:	00 48 03             	add    %cl,0x3(%rax)
ffff800000113fea:	00 00                	add    %al,(%rax)
ffff800000113fec:	e4 22                	in     $0x22,%al
ffff800000113fee:	ff                   	(bad)  
ffff800000113fef:	ff                   	(bad)  
ffff800000113ff0:	7a 01                	jp     ffff800000113ff3 <_erodata+0x356>
ffff800000113ff2:	00 00                	add    %al,(%rax)
ffff800000113ff4:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000113ff7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000113ffd:	00 00                	add    %al,(%rax)
ffff800000113fff:	00 18                	add    %bl,(%rax)
ffff800000114001:	00 00                	add    %al,(%rax)
ffff800000114003:	00 64 03 00          	add    %ah,0x0(%rbx,%rax,1)
ffff800000114007:	00 42 24             	add    %al,0x24(%rdx)
ffff80000011400a:	ff                   	(bad)  
ffff80000011400b:	ff                   	(bad)  
ffff80000011400c:	ff 01                	incl   (%rcx)
ffff80000011400e:	00 00                	add    %al,(%rax)
ffff800000114010:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000114013:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114019:	00 00                	add    %al,(%rax)
ffff80000011401b:	00 18                	add    %bl,(%rax)
ffff80000011401d:	00 00                	add    %al,(%rax)
ffff80000011401f:	00 80 03 00 00 25    	add    %al,0x25000003(%rax)
ffff800000114025:	26 ff                	es (bad) 
ffff800000114027:	ff 5b 00             	lcall  *0x0(%rbx)
ffff80000011402a:	00 00                	add    %al,(%rax)
ffff80000011402c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011402f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114035:	00 00                	add    %al,(%rax)
ffff800000114037:	00 18                	add    %bl,(%rax)
ffff800000114039:	00 00                	add    %al,(%rax)
ffff80000011403b:	00 9c 03 00 00 64 26 	add    %bl,0x26640000(%rbx,%rax,1)
ffff800000114042:	ff                   	(bad)  
ffff800000114043:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000114046:	00 00                	add    %al,(%rax)
ffff800000114048:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011404b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114051:	00 00                	add    %al,(%rax)
ffff800000114053:	00 18                	add    %bl,(%rax)
ffff800000114055:	00 00                	add    %al,(%rax)
ffff800000114057:	00 b8 03 00 00 a3    	add    %bh,-0x5cfffffd(%rax)
ffff80000011405d:	26 ff                	es (bad) 
ffff80000011405f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000114062:	00 00                	add    %al,(%rax)
ffff800000114064:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000114067:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011406d:	00 00                	add    %al,(%rax)
ffff80000011406f:	00 18                	add    %bl,(%rax)
ffff800000114071:	00 00                	add    %al,(%rax)
ffff800000114073:	00 d4                	add    %dl,%ah
ffff800000114075:	03 00                	add    (%rax),%eax
ffff800000114077:	00 e2                	add    %ah,%dl
ffff800000114079:	26 ff                	es (bad) 
ffff80000011407b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff80000011407e:	00 00                	add    %al,(%rax)
ffff800000114080:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000114083:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114089:	00 00                	add    %al,(%rax)
ffff80000011408b:	00 18                	add    %bl,(%rax)
ffff80000011408d:	00 00                	add    %al,(%rax)
ffff80000011408f:	00 f0                	add    %dh,%al
ffff800000114091:	03 00                	add    (%rax),%eax
ffff800000114093:	00 21                	add    %ah,(%rcx)
ffff800000114095:	27                   	(bad)  
ffff800000114096:	ff                   	(bad)  
ffff800000114097:	ff 5b 00             	lcall  *0x0(%rbx)
ffff80000011409a:	00 00                	add    %al,(%rax)
ffff80000011409c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011409f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001140a5:	00 00                	add    %al,(%rax)
ffff8000001140a7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001140aa:	00 00                	add    %al,(%rax)
ffff8000001140ac:	0c 04                	or     $0x4,%al
ffff8000001140ae:	00 00                	add    %al,(%rax)
ffff8000001140b0:	60                   	(bad)  
ffff8000001140b1:	27                   	(bad)  
ffff8000001140b2:	ff                   	(bad)  
ffff8000001140b3:	ff 87 02 00 00 00    	incl   0x2(%rdi)
ffff8000001140b9:	41 0e                	rex.B (bad) 
ffff8000001140bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001140c1:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
ffff8000001140c7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001140ca:	00 00                	add    %al,(%rax)
ffff8000001140cc:	2c 04                	sub    $0x4,%al
ffff8000001140ce:	00 00                	add    %al,(%rax)
ffff8000001140d0:	c7                   	(bad)  
ffff8000001140d1:	29 ff                	sub    %edi,%edi
ffff8000001140d3:	ff 76 00             	pushq  0x0(%rsi)
ffff8000001140d6:	00 00                	add    %al,(%rax)
ffff8000001140d8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001140db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001140e1:	02 71 0c             	add    0xc(%rcx),%dh
ffff8000001140e4:	07                   	(bad)  
ffff8000001140e5:	08 00                	or     %al,(%rax)
ffff8000001140e7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001140ea:	00 00                	add    %al,(%rax)
ffff8000001140ec:	4c 04 00             	rex.WR add $0x0,%al
ffff8000001140ef:	00 1d 2a ff ff 11    	add    %bl,0x11ffff2a(%rip)        # ffff80001211401f <_ebss+0x11fe4ab7>
ffff8000001140f5:	00 00                	add    %al,(%rax)
ffff8000001140f7:	00 00                	add    %al,(%rax)
ffff8000001140f9:	41 0e                	rex.B (bad) 
ffff8000001140fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114101:	4c 0c 07             	rex.WR or $0x7,%al
ffff800000114104:	08 00                	or     %al,(%rax)
ffff800000114106:	00 00                	add    %al,(%rax)
ffff800000114108:	1c 00                	sbb    $0x0,%al
ffff80000011410a:	00 00                	add    %al,(%rax)
ffff80000011410c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011410d:	04 00                	add    $0x0,%al
ffff80000011410f:	00 0e                	add    %cl,(%rsi)
ffff800000114111:	2a ff                	sub    %bh,%bh
ffff800000114113:	ff                   	(bad)  
ffff800000114114:	ec                   	in     (%dx),%al
ffff800000114115:	01 00                	add    %eax,(%rax)
ffff800000114117:	00 00                	add    %al,(%rax)
ffff800000114119:	41 0e                	rex.B (bad) 
ffff80000011411b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114121:	03 e7                	add    %edi,%esp
ffff800000114123:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000114126:	08 00                	or     %al,(%rax)
ffff800000114128:	1c 00                	sbb    $0x0,%al
ffff80000011412a:	00 00                	add    %al,(%rax)
ffff80000011412c:	8c 04 00             	mov    %es,(%rax,%rax,1)
ffff80000011412f:	00 da                	add    %bl,%dl
ffff800000114131:	2b ff                	sub    %edi,%edi
ffff800000114133:	ff 82 01 00 00 00    	incl   0x1(%rdx)
ffff800000114139:	41 0e                	rex.B (bad) 
ffff80000011413b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114141:	03 7d 01             	add    0x1(%rbp),%edi
ffff800000114144:	0c 07                	or     $0x7,%al
ffff800000114146:	08 00                	or     %al,(%rax)
ffff800000114148:	1c 00                	sbb    $0x0,%al
ffff80000011414a:	00 00                	add    %al,(%rax)
ffff80000011414c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011414d:	04 00                	add    $0x0,%al
ffff80000011414f:	00 3c 2d ff ff 9e 0d 	add    %bh,0xd9effff(,%rbp,1)
ffff800000114156:	00 00                	add    %al,(%rax)
ffff800000114158:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011415b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114161:	03 99 0d 0c 07 08    	add    0x8070c0d(%rcx),%ebx
ffff800000114167:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011416a:	00 00                	add    %al,(%rax)
ffff80000011416c:	cc                   	int3   
ffff80000011416d:	04 00                	add    $0x0,%al
ffff80000011416f:	00 ba 3a ff ff 32    	add    %bh,0x32ffff3a(%rdx)
ffff800000114175:	03 00                	add    (%rax),%eax
ffff800000114177:	00 00                	add    %al,(%rax)
ffff800000114179:	41 0e                	rex.B (bad) 
ffff80000011417b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114181:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # ffff800008184d8a <_ebss+0x8055822>
ffff800000114187:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011418a:	00 00                	add    %al,(%rax)
ffff80000011418c:	ec                   	in     (%dx),%al
ffff80000011418d:	04 00                	add    $0x0,%al
ffff80000011418f:	00 cc                	add    %cl,%ah
ffff800000114191:	3d ff ff 21 00       	cmp    $0x21ffff,%eax
ffff800000114196:	00 00                	add    %al,(%rax)
ffff800000114198:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011419b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001141a1:	5c                   	pop    %rsp
ffff8000001141a2:	0c 07                	or     $0x7,%al
ffff8000001141a4:	08 00                	or     %al,(%rax)
ffff8000001141a6:	00 00                	add    %al,(%rax)
ffff8000001141a8:	1c 00                	sbb    $0x0,%al
ffff8000001141aa:	00 00                	add    %al,(%rax)
ffff8000001141ac:	0c 05                	or     $0x5,%al
ffff8000001141ae:	00 00                	add    %al,(%rax)
ffff8000001141b0:	cd 3d                	int    $0x3d
ffff8000001141b2:	ff                   	(bad)  
ffff8000001141b3:	ff 20                	jmpq   *(%rax)
ffff8000001141b5:	00 00                	add    %al,(%rax)
ffff8000001141b7:	00 00                	add    %al,(%rax)
ffff8000001141b9:	41 0e                	rex.B (bad) 
ffff8000001141bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001141c1:	5b                   	pop    %rbx
ffff8000001141c2:	0c 07                	or     $0x7,%al
ffff8000001141c4:	08 00                	or     %al,(%rax)
ffff8000001141c6:	00 00                	add    %al,(%rax)
ffff8000001141c8:	1c 00                	sbb    $0x0,%al
ffff8000001141ca:	00 00                	add    %al,(%rax)
ffff8000001141cc:	2c 05                	sub    $0x5,%al
ffff8000001141ce:	00 00                	add    %al,(%rax)
ffff8000001141d0:	cd 3d                	int    $0x3d
ffff8000001141d2:	ff                   	(bad)  
ffff8000001141d3:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff8000001141d9:	41 0e                	rex.B (bad) 
ffff8000001141db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001141e1:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff8000001141e7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001141ea:	00 00                	add    %al,(%rax)
ffff8000001141ec:	4c 05 00 00 3c 3e    	rex.WR add $0x3e3c0000,%rax
ffff8000001141f2:	ff                   	(bad)  
ffff8000001141f3:	ff c9                	dec    %ecx
ffff8000001141f5:	00 00                	add    %al,(%rax)
ffff8000001141f7:	00 00                	add    %al,(%rax)
ffff8000001141f9:	41 0e                	rex.B (bad) 
ffff8000001141fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114201:	02 c4                	add    %ah,%al
ffff800000114203:	0c 07                	or     $0x7,%al
ffff800000114205:	08 00                	or     %al,(%rax)
ffff800000114207:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011420a:	00 00                	add    %al,(%rax)
ffff80000011420c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011420d:	05 00 00 d5 45       	add    $0x45d50000,%eax
ffff800000114212:	ff                   	(bad)  
ffff800000114213:	ff 4c 01 00          	decl   0x0(%rcx,%rax,1)
ffff800000114217:	00 00                	add    %al,(%rax)
ffff800000114219:	41 0e                	rex.B (bad) 
ffff80000011421b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114221:	03 47 01             	add    0x1(%rdi),%eax
ffff800000114224:	0c 07                	or     $0x7,%al
ffff800000114226:	08 00                	or     %al,(%rax)
ffff800000114228:	1c 00                	sbb    $0x0,%al
ffff80000011422a:	00 00                	add    %al,(%rax)
ffff80000011422c:	8c 05 00 00 01 47    	mov    %es,0x47010000(%rip)        # ffff800047124232 <_ebss+0x46ff4cca>
ffff800000114232:	ff                   	(bad)  
ffff800000114233:	ff                   	(bad)  
ffff800000114234:	df 00                	filds  (%rax)
ffff800000114236:	00 00                	add    %al,(%rax)
ffff800000114238:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011423b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114241:	02 da                	add    %dl,%bl
ffff800000114243:	0c 07                	or     $0x7,%al
ffff800000114245:	08 00                	or     %al,(%rax)
ffff800000114247:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011424a:	00 00                	add    %al,(%rax)
ffff80000011424c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011424d:	05 00 00 c0 47       	add    $0x47c00000,%eax
ffff800000114252:	ff                   	(bad)  
ffff800000114253:	ff 22                	jmpq   *(%rdx)
ffff800000114255:	00 00                	add    %al,(%rax)
ffff800000114257:	00 00                	add    %al,(%rax)
ffff800000114259:	41 0e                	rex.B (bad) 
ffff80000011425b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114261:	5d                   	pop    %rbp
ffff800000114262:	0c 07                	or     $0x7,%al
ffff800000114264:	08 00                	or     %al,(%rax)
ffff800000114266:	00 00                	add    %al,(%rax)
ffff800000114268:	1c 00                	sbb    $0x0,%al
ffff80000011426a:	00 00                	add    %al,(%rax)
ffff80000011426c:	cc                   	int3   
ffff80000011426d:	05 00 00 c2 47       	add    $0x47c20000,%eax
ffff800000114272:	ff                   	(bad)  
ffff800000114273:	ff 43 00             	incl   0x0(%rbx)
ffff800000114276:	00 00                	add    %al,(%rax)
ffff800000114278:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011427b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114281:	7e 0c                	jle    ffff80000011428f <_erodata+0x5f2>
ffff800000114283:	07                   	(bad)  
ffff800000114284:	08 00                	or     %al,(%rax)
ffff800000114286:	00 00                	add    %al,(%rax)
ffff800000114288:	1c 00                	sbb    $0x0,%al
ffff80000011428a:	00 00                	add    %al,(%rax)
ffff80000011428c:	ec                   	in     (%dx),%al
ffff80000011428d:	05 00 00 e5 47       	add    $0x47e50000,%eax
ffff800000114292:	ff                   	(bad)  
ffff800000114293:	ff 26                	jmpq   *(%rsi)
ffff800000114295:	00 00                	add    %al,(%rax)
ffff800000114297:	00 00                	add    %al,(%rax)
ffff800000114299:	41 0e                	rex.B (bad) 
ffff80000011429b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001142a1:	61                   	(bad)  
ffff8000001142a2:	0c 07                	or     $0x7,%al
ffff8000001142a4:	08 00                	or     %al,(%rax)
ffff8000001142a6:	00 00                	add    %al,(%rax)
ffff8000001142a8:	1c 00                	sbb    $0x0,%al
ffff8000001142aa:	00 00                	add    %al,(%rax)
ffff8000001142ac:	0c 06                	or     $0x6,%al
ffff8000001142ae:	00 00                	add    %al,(%rax)
ffff8000001142b0:	eb 47                	jmp    ffff8000001142f9 <_erodata+0x65c>
ffff8000001142b2:	ff                   	(bad)  
ffff8000001142b3:	ff 5a 00             	lcall  *0x0(%rdx)
ffff8000001142b6:	00 00                	add    %al,(%rax)
ffff8000001142b8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001142bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001142c1:	02 55 0c             	add    0xc(%rbp),%dl
ffff8000001142c4:	07                   	(bad)  
ffff8000001142c5:	08 00                	or     %al,(%rax)
ffff8000001142c7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001142ca:	00 00                	add    %al,(%rax)
ffff8000001142cc:	2c 06                	sub    $0x6,%al
ffff8000001142ce:	00 00                	add    %al,(%rax)
ffff8000001142d0:	25 48 ff ff 76       	and    $0x76ffff48,%eax
ffff8000001142d5:	00 00                	add    %al,(%rax)
ffff8000001142d7:	00 00                	add    %al,(%rax)
ffff8000001142d9:	41 0e                	rex.B (bad) 
ffff8000001142db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001142e1:	02 71 0c             	add    0xc(%rcx),%dh
ffff8000001142e4:	07                   	(bad)  
ffff8000001142e5:	08 00                	or     %al,(%rax)
ffff8000001142e7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001142ea:	00 00                	add    %al,(%rax)
ffff8000001142ec:	4c 06                	rex.WR (bad) 
ffff8000001142ee:	00 00                	add    %al,(%rax)
ffff8000001142f0:	7b 48                	jnp    ffff80000011433a <_erodata+0x69d>
ffff8000001142f2:	ff                   	(bad)  
ffff8000001142f3:	ff 26                	jmpq   *(%rsi)
ffff8000001142f5:	00 00                	add    %al,(%rax)
ffff8000001142f7:	00 00                	add    %al,(%rax)
ffff8000001142f9:	41 0e                	rex.B (bad) 
ffff8000001142fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114301:	61                   	(bad)  
ffff800000114302:	0c 07                	or     $0x7,%al
ffff800000114304:	08 00                	or     %al,(%rax)
ffff800000114306:	00 00                	add    %al,(%rax)
ffff800000114308:	1c 00                	sbb    $0x0,%al
ffff80000011430a:	00 00                	add    %al,(%rax)
ffff80000011430c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011430d:	06                   	(bad)  
ffff80000011430e:	00 00                	add    %al,(%rax)
ffff800000114310:	81 48 ff ff 20 00 00 	orl    $0x20ff,-0x1(%rax)
ffff800000114317:	00 00                	add    %al,(%rax)
ffff800000114319:	41 0e                	rex.B (bad) 
ffff80000011431b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114321:	5b                   	pop    %rbx
ffff800000114322:	0c 07                	or     $0x7,%al
ffff800000114324:	08 00                	or     %al,(%rax)
ffff800000114326:	00 00                	add    %al,(%rax)
ffff800000114328:	1c 00                	sbb    $0x0,%al
ffff80000011432a:	00 00                	add    %al,(%rax)
ffff80000011432c:	8c 06                	mov    %es,(%rsi)
ffff80000011432e:	00 00                	add    %al,(%rax)
ffff800000114330:	81 48 ff ff 49 00 00 	orl    $0x49ff,-0x1(%rax)
ffff800000114337:	00 00                	add    %al,(%rax)
ffff800000114339:	41 0e                	rex.B (bad) 
ffff80000011433b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114341:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000114345:	08 00                	or     %al,(%rax)
ffff800000114347:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011434a:	00 00                	add    %al,(%rax)
ffff80000011434c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011434d:	06                   	(bad)  
ffff80000011434e:	00 00                	add    %al,(%rax)
ffff800000114350:	aa                   	stos   %al,%es:(%rdi)
ffff800000114351:	48 ff                	rex.W (bad) 
ffff800000114353:	ff                   	(bad)  
ffff800000114354:	39 00                	cmp    %eax,(%rax)
ffff800000114356:	00 00                	add    %al,(%rax)
ffff800000114358:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011435b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114361:	74 0c                	je     ffff80000011436f <_erodata+0x6d2>
ffff800000114363:	07                   	(bad)  
ffff800000114364:	08 00                	or     %al,(%rax)
ffff800000114366:	00 00                	add    %al,(%rax)
ffff800000114368:	1c 00                	sbb    $0x0,%al
ffff80000011436a:	00 00                	add    %al,(%rax)
ffff80000011436c:	cc                   	int3   
ffff80000011436d:	06                   	(bad)  
ffff80000011436e:	00 00                	add    %al,(%rax)
ffff800000114370:	c3                   	retq   
ffff800000114371:	48 ff                	rex.W (bad) 
ffff800000114373:	ff c9                	dec    %ecx
ffff800000114375:	00 00                	add    %al,(%rax)
ffff800000114377:	00 00                	add    %al,(%rax)
ffff800000114379:	41 0e                	rex.B (bad) 
ffff80000011437b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114381:	02 c4                	add    %ah,%al
ffff800000114383:	0c 07                	or     $0x7,%al
ffff800000114385:	08 00                	or     %al,(%rax)
ffff800000114387:	00 18                	add    %bl,(%rax)
ffff800000114389:	00 00                	add    %al,(%rax)
ffff80000011438b:	00 ec                	add    %ch,%ah
ffff80000011438d:	06                   	(bad)  
ffff80000011438e:	00 00                	add    %al,(%rax)
ffff800000114390:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000114391:	49 ff                	rex.WB (bad) 
ffff800000114393:	ff 51 00             	callq  *0x0(%rcx)
ffff800000114396:	00 00                	add    %al,(%rax)
ffff800000114398:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011439b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001143a1:	00 00                	add    %al,(%rax)
ffff8000001143a3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001143a6:	00 00                	add    %al,(%rax)
ffff8000001143a8:	08 07                	or     %al,(%rdi)
ffff8000001143aa:	00 00                	add    %al,(%rax)
ffff8000001143ac:	a1 49 ff ff 97 00 00 	movabs 0x97ffff49,%eax
ffff8000001143b3:	00 00 
ffff8000001143b5:	41 0e                	rex.B (bad) 
ffff8000001143b7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001143bd:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
ffff8000001143c3:	00 20                	add    %ah,(%rax)
ffff8000001143c5:	00 00                	add    %al,(%rax)
ffff8000001143c7:	00 28                	add    %ch,(%rax)
ffff8000001143c9:	07                   	(bad)  
ffff8000001143ca:	00 00                	add    %al,(%rax)
ffff8000001143cc:	18 4a ff             	sbb    %cl,-0x1(%rdx)
ffff8000001143cf:	ff f6                	push   %rsi
ffff8000001143d1:	00 00                	add    %al,(%rax)
ffff8000001143d3:	00 00                	add    %al,(%rax)
ffff8000001143d5:	41 0e                	rex.B (bad) 
ffff8000001143d7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001143dd:	45 83 03 02          	rex.RB addl $0x2,(%r11)
ffff8000001143e1:	ec                   	in     (%dx),%al
ffff8000001143e2:	0c 07                	or     $0x7,%al
ffff8000001143e4:	08 00                	or     %al,(%rax)
ffff8000001143e6:	00 00                	add    %al,(%rax)
ffff8000001143e8:	20 00                	and    %al,(%rax)
ffff8000001143ea:	00 00                	add    %al,(%rax)
ffff8000001143ec:	4c 07                	rex.WR (bad) 
ffff8000001143ee:	00 00                	add    %al,(%rax)
ffff8000001143f0:	ea                   	(bad)  
ffff8000001143f1:	4a ff                	rex.WX (bad) 
ffff8000001143f3:	ff 73 03             	pushq  0x3(%rbx)
ffff8000001143f6:	00 00                	add    %al,(%rax)
ffff8000001143f8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001143fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114401:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff800000114405:	69 03 0c 07 08 00    	imul   $0x8070c,(%rbx),%eax
ffff80000011440b:	00 18                	add    %bl,(%rax)
ffff80000011440d:	00 00                	add    %al,(%rax)
ffff80000011440f:	00 70 07             	add    %dh,0x7(%rax)
ffff800000114412:	00 00                	add    %al,(%rax)
ffff800000114414:	39 4e ff             	cmp    %ecx,-0x1(%rsi)
ffff800000114417:	ff                   	(bad)  
ffff800000114418:	3b 00                	cmp    (%rax),%eax
ffff80000011441a:	00 00                	add    %al,(%rax)
ffff80000011441c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011441f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114425:	00 00                	add    %al,(%rax)
ffff800000114427:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011442a:	00 00                	add    %al,(%rax)
ffff80000011442c:	8c 07                	mov    %es,(%rdi)
ffff80000011442e:	00 00                	add    %al,(%rax)
ffff800000114430:	58                   	pop    %rax
ffff800000114431:	4e ff                	rex.WRX (bad) 
ffff800000114433:	ff 30                	pushq  (%rax)
ffff800000114435:	00 00                	add    %al,(%rax)
ffff800000114437:	00 00                	add    %al,(%rax)
ffff800000114439:	41 0e                	rex.B (bad) 
ffff80000011443b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114441:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
ffff800000114445:	00 00                	add    %al,(%rax)
ffff800000114447:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011444a:	00 00                	add    %al,(%rax)
ffff80000011444c:	ac                   	lods   %ds:(%rsi),%al
ffff80000011444d:	07                   	(bad)  
ffff80000011444e:	00 00                	add    %al,(%rax)
ffff800000114450:	98                   	cwtl   
ffff800000114451:	4e ff                	rex.WRX (bad) 
ffff800000114453:	ff b5 00 00 00 00    	pushq  0x0(%rbp)
ffff800000114459:	41 0e                	rex.B (bad) 
ffff80000011445b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114461:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
ffff800000114467:	00 20                	add    %ah,(%rax)
ffff800000114469:	00 00                	add    %al,(%rax)
ffff80000011446b:	00 cc                	add    %cl,%ah
ffff80000011446d:	07                   	(bad)  
ffff80000011446e:	00 00                	add    %al,(%rax)
ffff800000114470:	2d 4f ff ff 7f       	sub    $0x7fffff4f,%eax
ffff800000114475:	02 00                	add    (%rax),%al
ffff800000114477:	00 00                	add    %al,(%rax)
ffff800000114479:	41 0e                	rex.B (bad) 
ffff80000011447b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000114481:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff800000114485:	75 02                	jne    ffff800000114489 <_erodata+0x7ec>
ffff800000114487:	0c 07                	or     $0x7,%al
ffff800000114489:	08 00                	or     %al,(%rax)
ffff80000011448b:	00 28                	add    %ch,(%rax)
ffff80000011448d:	00 00                	add    %al,(%rax)
ffff80000011448f:	00 f0                	add    %dh,%al
ffff800000114491:	07                   	(bad)  
ffff800000114492:	00 00                	add    %al,(%rax)
ffff800000114494:	88 51 ff             	mov    %dl,-0x1(%rcx)
ffff800000114497:	ff 43 03             	incl   0x3(%rbx)
ffff80000011449a:	00 00                	add    %al,(%rax)
ffff80000011449c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011449f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001144a5:	4b 8e 03             	rex.WXB mov (%r11),%es
ffff8000001144a8:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
ffff8000001144ab:	05 83 06 03 33       	add    $0x33030683,%eax
ffff8000001144b0:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff8000001144b3:	08 00                	or     %al,(%rax)
ffff8000001144b5:	00 00                	add    %al,(%rax)
ffff8000001144b7:	00 20                	add    %ah,(%rax)
ffff8000001144b9:	00 00                	add    %al,(%rax)
ffff8000001144bb:	00 1c 08             	add    %bl,(%rax,%rcx,1)
ffff8000001144be:	00 00                	add    %al,(%rax)
ffff8000001144c0:	9f                   	lahf   
ffff8000001144c1:	54                   	push   %rsp
ffff8000001144c2:	ff                   	(bad)  
ffff8000001144c3:	ff 46 00             	incl   0x0(%rsi)
ffff8000001144c6:	00 00                	add    %al,(%rax)
ffff8000001144c8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001144cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001144d1:	41 83 03 02          	addl   $0x2,(%r11)
ffff8000001144d5:	40 0c 07             	or     $0x7,%al
ffff8000001144d8:	08 00                	or     %al,(%rax)
ffff8000001144da:	00 00                	add    %al,(%rax)
ffff8000001144dc:	1c 00                	sbb    $0x0,%al
ffff8000001144de:	00 00                	add    %al,(%rax)
ffff8000001144e0:	40 08 00             	or     %al,(%rax)
ffff8000001144e3:	00 c1                	add    %al,%cl
ffff8000001144e5:	54                   	push   %rsp
ffff8000001144e6:	ff                   	(bad)  
ffff8000001144e7:	ff                   	(bad)  
ffff8000001144e8:	be 03 00 00 00       	mov    $0x3,%esi
ffff8000001144ed:	41 0e                	rex.B (bad) 
ffff8000001144ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001144f5:	03 b9 03 0c 07 08    	add    0x8070c03(%rcx),%edi
	...

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
ffff800000118024:	00 80 ff ff a0 be    	add    %al,-0x415f0001(%rax)
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
ffff800000120024:	00 80 ff ff a0 be    	add    %al,-0x415f0001(%rax)
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
