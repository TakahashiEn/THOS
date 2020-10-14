
system.o:     file format elf64-x86-64


Disassembly of section .text:

ffff800000100000 <_start>:
ffff800000100000:	66 b8 10 00          	mov    $0x10,%ax
ffff800000100004:	8e d8                	mov    %eax,%ds
ffff800000100006:	8e c0                	mov    %eax,%es
ffff800000100008:	8e e0                	mov    %eax,%fs
ffff80000010000a:	8e d0                	mov    %eax,%ss
ffff80000010000c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
ffff800000100011:	0f 01 15 40 8e 00 00 	lgdt   0x8e40(%rip)        # ffff800000108e58 <GDT_END>
ffff800000100018:	0f 01 1d 43 9e 00 00 	lidt   0x9e43(%rip)        # ffff800000109e62 <IDT_END>
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
ffff80000010009a:	48 8d 3d c1 8d 00 00 	lea    0x8dc1(%rip),%rdi        # ffff800000108e62 <IDT_Table>
ffff8000001000a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

ffff8000001000a8 <rp_sidt>:
ffff8000001000a8:	48 89 07             	mov    %rax,(%rdi)
ffff8000001000ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
ffff8000001000af:	48 83 c7 10          	add    $0x10,%rdi
ffff8000001000b3:	48 ff c9             	dec    %rcx
ffff8000001000b6:	75 f0                	jne    ffff8000001000a8 <rp_sidt>

ffff8000001000b8 <setup_TSS64>:
ffff8000001000b8:	48 8d 15 ad 9d 00 00 	lea    0x9dad(%rip),%rdx        # ffff800000109e6c <TSS64_Table>
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
ffff8000001000f2:	48 8d 3d c7 8c 00 00 	lea    0x8cc7(%rip),%rdi        # ffff800000108dc0 <GDT_Table>
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
ffff80000010405f:	e8 79 47 00 00       	callq  ffff8000001087dd <system_call_function>

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
ffff800000104291:	48 ba 70 9e 10 00 00 	movabs $0xffff800000109e70,%rdx
ffff800000104298:	80 ff ff 
ffff80000010429b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010429f:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042a2:	48 ba 78 9e 10 00 00 	movabs $0xffff800000109e78,%rdx
ffff8000001042a9:	80 ff ff 
ffff8000001042ac:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001042b0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042b3:	48 ba 80 9e 10 00 00 	movabs $0xffff800000109e80,%rdx
ffff8000001042ba:	80 ff ff 
ffff8000001042bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001042c1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042c4:	48 ba 90 9e 10 00 00 	movabs $0xffff800000109e90,%rdx
ffff8000001042cb:	80 ff ff 
ffff8000001042ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001042d2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042d5:	48 ba 98 9e 10 00 00 	movabs $0xffff800000109e98,%rdx
ffff8000001042dc:	80 ff ff 
ffff8000001042df:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001042e3:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042e6:	48 ba a0 9e 10 00 00 	movabs $0xffff800000109ea0,%rdx
ffff8000001042ed:	80 ff ff 
ffff8000001042f0:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001042f4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001042f7:	48 ba a8 9e 10 00 00 	movabs $0xffff800000109ea8,%rdx
ffff8000001042fe:	80 ff ff 
ffff800000104301:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000104305:	48 89 02             	mov    %rax,(%rdx)
ffff800000104308:	48 ba b0 9e 10 00 00 	movabs $0xffff800000109eb0,%rdx
ffff80000010430f:	80 ff ff 
ffff800000104312:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000104316:	48 89 02             	mov    %rax,(%rdx)
ffff800000104319:	48 ba b8 9e 10 00 00 	movabs $0xffff800000109eb8,%rdx
ffff800000104320:	80 ff ff 
ffff800000104323:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000104327:	48 89 02             	mov    %rax,(%rdx)
ffff80000010432a:	48 ba c0 9e 10 00 00 	movabs $0xffff800000109ec0,%rdx
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
ffff800000104358:	48 ba 20 0f 11 00 00 	movabs $0xffff800000110f20,%rdx
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
ffff800000104547:	48 ba b6 8d 10 00 00 	movabs $0xffff800000108db6,%rdx
ffff80000010454e:	80 ff ff 
ffff800000104551:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104558:	80 ff ff 
ffff80000010455b:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
ffff800000104562:	48 ba 20 0f 11 00 00 	movabs $0xffff800000110f20,%rdx
ffff800000104569:	80 ff ff 
ffff80000010456c:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000104573:	80 ff ff 
ffff800000104576:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
ffff80000010457d:	48 ba 30 e5 12 00 00 	movabs $0xffff80000012e530,%rdx
ffff800000104584:	80 ff ff 
ffff800000104587:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010458e:	80 ff ff 
ffff800000104591:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
ffff800000104598:	48 ba 44 0f 11 00 00 	movabs $0xffff800000110f44,%rdx
ffff80000010459f:	80 ff ff 
ffff8000001045a2:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045a7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045ac:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045b1:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001045b8:	80 ff ff 
ffff8000001045bb:	ff d1                	callq  *%rcx
ffff8000001045bd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045c2:	48 ba f9 6d 10 00 00 	movabs $0xffff800000106df9,%rdx
ffff8000001045c9:	80 ff ff 
ffff8000001045cc:	ff d2                	callq  *%rdx
ffff8000001045ce:	48 ba 52 0f 11 00 00 	movabs $0xffff800000110f52,%rdx
ffff8000001045d5:	80 ff ff 
ffff8000001045d8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001045dd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001045e2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045e7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001045ee:	80 ff ff 
ffff8000001045f1:	ff d1                	callq  *%rcx
ffff8000001045f3:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001045f8:	48 ba 0a 7e 10 00 00 	movabs $0xffff800000107e0a,%rdx
ffff8000001045ff:	80 ff ff 
ffff800000104602:	ff d2                	callq  *%rdx
ffff800000104604:	48 ba 63 0f 11 00 00 	movabs $0xffff800000110f63,%rdx
ffff80000010460b:	80 ff ff 
ffff80000010460e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000104613:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000104618:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010461d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000104624:	80 ff ff 
ffff800000104627:	ff d1                	callq  *%rcx
ffff800000104629:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010462e:	48 ba 73 8a 10 00 00 	movabs $0xffff800000108a73,%rdx
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
ffff8000001046bc:	48 b8 e0 9e 10 00 00 	movabs $0xffff800000109ee0,%rax
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
ffff8000001047d4:	48 b8 70 0f 11 00 00 	movabs $0xffff800000110f70,%rax
ffff8000001047db:	80 ff ff 
ffff8000001047de:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
ffff8000001047e2:	8b 45 90             	mov    -0x70(%rbp),%eax
ffff8000001047e5:	83 e0 40             	and    $0x40,%eax
ffff8000001047e8:	85 c0                	test   %eax,%eax
ffff8000001047ea:	74 0e                	je     ffff8000001047fa <number+0x40>
ffff8000001047ec:	48 b8 98 0f 11 00 00 	movabs $0xffff800000110f98,%rax
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
ffff800000104aa5:	48 b8 c0 0f 11 00 00 	movabs $0xffff800000110fc0,%rax
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
ffff800000104c9e:	48 b8 48 10 11 00 00 	movabs $0xffff800000111048,%rax
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
ffff80000010586c:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
ffff800000105873:	80 ff ff 
ffff800000105876:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff80000010587a:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010587d:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105881:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105885:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
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
ffff8000001058fb:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
ffff800000105902:	80 ff ff 
ffff800000105905:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105909:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010590c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000105910:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff800000105914:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
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
ffff80000010598a:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
ffff800000105991:	80 ff ff 
ffff800000105994:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff800000105998:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff80000010599b:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010599f:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001059a3:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
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
ffff800000105a1b:	48 ba 70 9e 10 00 00 	movabs $0xffff800000109e70,%rdx
ffff800000105a22:	80 ff ff 
ffff800000105a25:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000105a29:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a2c:	48 ba 78 9e 10 00 00 	movabs $0xffff800000109e78,%rdx
ffff800000105a33:	80 ff ff 
ffff800000105a36:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000105a3a:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a3d:	48 ba 80 9e 10 00 00 	movabs $0xffff800000109e80,%rdx
ffff800000105a44:	80 ff ff 
ffff800000105a47:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000105a4b:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a4e:	48 ba 90 9e 10 00 00 	movabs $0xffff800000109e90,%rdx
ffff800000105a55:	80 ff ff 
ffff800000105a58:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000105a5c:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a5f:	48 ba 98 9e 10 00 00 	movabs $0xffff800000109e98,%rdx
ffff800000105a66:	80 ff ff 
ffff800000105a69:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000105a6d:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a70:	48 ba a0 9e 10 00 00 	movabs $0xffff800000109ea0,%rdx
ffff800000105a77:	80 ff ff 
ffff800000105a7a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000105a7e:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a81:	48 ba a8 9e 10 00 00 	movabs $0xffff800000109ea8,%rdx
ffff800000105a88:	80 ff ff 
ffff800000105a8b:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff800000105a8f:	48 89 02             	mov    %rax,(%rdx)
ffff800000105a92:	48 ba b0 9e 10 00 00 	movabs $0xffff800000109eb0,%rdx
ffff800000105a99:	80 ff ff 
ffff800000105a9c:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff800000105aa0:	48 89 02             	mov    %rax,(%rdx)
ffff800000105aa3:	48 ba b8 9e 10 00 00 	movabs $0xffff800000109eb8,%rdx
ffff800000105aaa:	80 ff ff 
ffff800000105aad:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000105ab1:	48 89 02             	mov    %rax,(%rdx)
ffff800000105ab4:	48 ba c0 9e 10 00 00 	movabs $0xffff800000109ec0,%rdx
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
ffff800000105afb:	48 ba e8 12 11 00 00 	movabs $0xffff8000001112e8,%rdx
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
ffff800000105b56:	48 ba 28 13 11 00 00 	movabs $0xffff800000111328,%rdx
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
ffff800000105bb1:	48 ba 60 13 11 00 00 	movabs $0xffff800000111360,%rdx
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
ffff800000105c0c:	48 ba 98 13 11 00 00 	movabs $0xffff800000111398,%rdx
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
ffff800000105c67:	48 ba d0 13 11 00 00 	movabs $0xffff8000001113d0,%rdx
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
ffff800000105cc2:	48 ba 10 14 11 00 00 	movabs $0xffff800000111410,%rdx
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
ffff800000105d1d:	48 ba 50 14 11 00 00 	movabs $0xffff800000111450,%rdx
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
ffff800000105d78:	48 ba 98 14 11 00 00 	movabs $0xffff800000111498,%rdx
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
ffff800000105dd3:	48 ba e0 14 11 00 00 	movabs $0xffff8000001114e0,%rdx
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
ffff800000105e2e:	48 ba 20 15 11 00 00 	movabs $0xffff800000111520,%rdx
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
ffff800000105e89:	48 ba 70 15 11 00 00 	movabs $0xffff800000111570,%rdx
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
ffff800000105ebb:	48 ba b0 15 11 00 00 	movabs $0xffff8000001115b0,%rdx
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
ffff800000105eec:	48 ba 30 16 11 00 00 	movabs $0xffff800000111630,%rdx
ffff800000105ef3:	80 ff ff 
ffff800000105ef6:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105efb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f00:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f05:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f0c:	80 ff ff 
ffff800000105f0f:	ff d1                	callq  *%rcx
ffff800000105f11:	eb 25                	jmp    ffff800000105f38 <do_invalid_TSS+0xe2>
ffff800000105f13:	48 ba 60 16 11 00 00 	movabs $0xffff800000111660,%rdx
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
ffff800000105f50:	48 ba 98 16 11 00 00 	movabs $0xffff800000111698,%rdx
ffff800000105f57:	80 ff ff 
ffff800000105f5a:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000105f5f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000105f64:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000105f69:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000105f70:	80 ff ff 
ffff800000105f73:	ff d1                	callq  *%rcx
ffff800000105f75:	eb 25                	jmp    ffff800000105f9c <do_invalid_TSS+0x146>
ffff800000105f77:	48 ba d0 16 11 00 00 	movabs $0xffff8000001116d0,%rdx
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
ffff800000105fa8:	48 ba 00 17 11 00 00 	movabs $0xffff800000111700,%rdx
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
ffff800000106003:	48 ba 20 17 11 00 00 	movabs $0xffff800000111720,%rdx
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
ffff800000106035:	48 ba b0 15 11 00 00 	movabs $0xffff8000001115b0,%rdx
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
ffff800000106066:	48 ba 30 16 11 00 00 	movabs $0xffff800000111630,%rdx
ffff80000010606d:	80 ff ff 
ffff800000106070:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106075:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010607a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010607f:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106086:	80 ff ff 
ffff800000106089:	ff d1                	callq  *%rcx
ffff80000010608b:	eb 25                	jmp    ffff8000001060b2 <do_segment_not_present+0xe2>
ffff80000010608d:	48 ba 60 16 11 00 00 	movabs $0xffff800000111660,%rdx
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
ffff8000001060ca:	48 ba 98 16 11 00 00 	movabs $0xffff800000111698,%rdx
ffff8000001060d1:	80 ff ff 
ffff8000001060d4:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001060d9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001060de:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001060e3:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001060ea:	80 ff ff 
ffff8000001060ed:	ff d1                	callq  *%rcx
ffff8000001060ef:	eb 25                	jmp    ffff800000106116 <do_segment_not_present+0x146>
ffff8000001060f1:	48 ba d0 16 11 00 00 	movabs $0xffff8000001116d0,%rdx
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
ffff800000106122:	48 ba 00 17 11 00 00 	movabs $0xffff800000111700,%rdx
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
ffff80000010617d:	48 ba 68 17 11 00 00 	movabs $0xffff800000111768,%rdx
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
ffff8000001061af:	48 ba b0 15 11 00 00 	movabs $0xffff8000001115b0,%rdx
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
ffff8000001061e0:	48 ba 30 16 11 00 00 	movabs $0xffff800000111630,%rdx
ffff8000001061e7:	80 ff ff 
ffff8000001061ea:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001061ef:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001061f4:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001061f9:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106200:	80 ff ff 
ffff800000106203:	ff d1                	callq  *%rcx
ffff800000106205:	eb 25                	jmp    ffff80000010622c <do_stack_segment_fault+0xe2>
ffff800000106207:	48 ba 60 16 11 00 00 	movabs $0xffff800000111660,%rdx
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
ffff800000106244:	48 ba 98 16 11 00 00 	movabs $0xffff800000111698,%rdx
ffff80000010624b:	80 ff ff 
ffff80000010624e:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106253:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106258:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010625d:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106264:	80 ff ff 
ffff800000106267:	ff d1                	callq  *%rcx
ffff800000106269:	eb 25                	jmp    ffff800000106290 <do_stack_segment_fault+0x146>
ffff80000010626b:	48 ba d0 16 11 00 00 	movabs $0xffff8000001116d0,%rdx
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
ffff80000010629c:	48 ba 00 17 11 00 00 	movabs $0xffff800000111700,%rdx
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
ffff8000001062f7:	48 ba b0 17 11 00 00 	movabs $0xffff8000001117b0,%rdx
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
ffff800000106329:	48 ba b0 15 11 00 00 	movabs $0xffff8000001115b0,%rdx
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
ffff80000010635a:	48 ba 30 16 11 00 00 	movabs $0xffff800000111630,%rdx
ffff800000106361:	80 ff ff 
ffff800000106364:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106369:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010636e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106373:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010637a:	80 ff ff 
ffff80000010637d:	ff d1                	callq  *%rcx
ffff80000010637f:	eb 25                	jmp    ffff8000001063a6 <do_general_protection+0xe2>
ffff800000106381:	48 ba 60 16 11 00 00 	movabs $0xffff800000111660,%rdx
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
ffff8000001063be:	48 ba 98 16 11 00 00 	movabs $0xffff800000111698,%rdx
ffff8000001063c5:	80 ff ff 
ffff8000001063c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001063cd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001063d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001063d7:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001063de:	80 ff ff 
ffff8000001063e1:	ff d1                	callq  *%rcx
ffff8000001063e3:	eb 25                	jmp    ffff80000010640a <do_general_protection+0x146>
ffff8000001063e5:	48 ba d0 16 11 00 00 	movabs $0xffff8000001116d0,%rdx
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
ffff800000106416:	48 ba 00 17 11 00 00 	movabs $0xffff800000111700,%rdx
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
ffff800000106480:	48 ba f8 17 11 00 00 	movabs $0xffff8000001117f8,%rdx
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
ffff8000001064b2:	48 ba 36 18 11 00 00 	movabs $0xffff800000111836,%rdx
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
ffff8000001064e3:	48 ba 49 18 11 00 00 	movabs $0xffff800000111849,%rdx
ffff8000001064ea:	80 ff ff 
ffff8000001064ed:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001064f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001064f7:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001064fc:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106503:	80 ff ff 
ffff800000106506:	ff d1                	callq  *%rcx
ffff800000106508:	eb 25                	jmp    ffff80000010652f <do_page_fault+0xf1>
ffff80000010650a:	48 ba 5d 18 11 00 00 	movabs $0xffff80000011185d,%rdx
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
ffff80000010653b:	48 ba 70 18 11 00 00 	movabs $0xffff800000111870,%rdx
ffff800000106542:	80 ff ff 
ffff800000106545:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010654a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff80000010654f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106554:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010655b:	80 ff ff 
ffff80000010655e:	ff d1                	callq  *%rcx
ffff800000106560:	eb 25                	jmp    ffff800000106587 <do_page_fault+0x149>
ffff800000106562:	48 ba 82 18 11 00 00 	movabs $0xffff800000111882,%rdx
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
ffff800000106593:	48 ba 9e 18 11 00 00 	movabs $0xffff80000011189e,%rdx
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
ffff8000001065c4:	48 ba c0 18 11 00 00 	movabs $0xffff8000001118c0,%rdx
ffff8000001065cb:	80 ff ff 
ffff8000001065ce:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065d3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065d8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001065dd:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001065e4:	80 ff ff 
ffff8000001065e7:	ff d1                	callq  *%rcx
ffff8000001065e9:	48 ba df 18 11 00 00 	movabs $0xffff8000001118df,%rdx
ffff8000001065f0:	80 ff ff 
ffff8000001065f3:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001065f8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001065fd:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106602:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106609:	80 ff ff 
ffff80000010660c:	ff d1                	callq  *%rcx
ffff80000010660e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106612:	48 89 c1             	mov    %rax,%rcx
ffff800000106615:	48 ba e1 18 11 00 00 	movabs $0xffff8000001118e1,%rdx
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
ffff800000106670:	48 ba f0 18 11 00 00 	movabs $0xffff8000001118f0,%rdx
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
ffff8000001066cb:	48 ba 38 19 11 00 00 	movabs $0xffff800000111938,%rdx
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
ffff800000106726:	48 ba 80 19 11 00 00 	movabs $0xffff800000111980,%rdx
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
ffff800000106781:	48 ba c8 19 11 00 00 	movabs $0xffff8000001119c8,%rdx
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
ffff8000001067dc:	48 ba 10 1a 11 00 00 	movabs $0xffff800000111a10,%rdx
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

ffff800000106a8b <page_init>:
ffff800000106a8b:	55                   	push   %rbp
ffff800000106a8c:	48 89 e5             	mov    %rsp,%rbp
ffff800000106a8f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106a93:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000106a97:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106a9b:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106a9f:	48 85 c0             	test   %rax,%rax
ffff800000106aa2:	0f 85 c8 00 00 00    	jne    ffff800000106b70 <page_init+0xe5>
ffff800000106aa8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106aaf:	80 ff ff 
ffff800000106ab2:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106ab9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106abd:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ac1:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106ac5:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106ac9:	48 01 d0             	add    %rdx,%rax
ffff800000106acc:	48 8b 10             	mov    (%rax),%rdx
ffff800000106acf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ad3:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ad7:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106adb:	83 e0 3f             	and    $0x3f,%eax
ffff800000106ade:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106ae3:	89 c1                	mov    %eax,%ecx
ffff800000106ae5:	48 d3 e6             	shl    %cl,%rsi
ffff800000106ae8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106aef:	80 ff ff 
ffff800000106af2:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106af9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106afd:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106b01:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106b05:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106b09:	48 01 c8             	add    %rcx,%rax
ffff800000106b0c:	48 09 f2             	or     %rsi,%rdx
ffff800000106b0f:	48 89 10             	mov    %rdx,(%rax)
ffff800000106b12:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b16:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000106b1a:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106b1e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b22:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106b26:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106b2a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b2e:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106b32:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b36:	48 8b 00             	mov    (%rax),%rax
ffff800000106b39:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106b3d:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106b41:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106b45:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b49:	48 8b 00             	mov    (%rax),%rax
ffff800000106b4c:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106b50:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106b54:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106b58:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b5c:	48 8b 00             	mov    (%rax),%rax
ffff800000106b5f:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106b63:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106b67:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106b6b:	e9 00 01 00 00       	jmpq   ffff800000106c70 <page_init+0x1e5>
ffff800000106b70:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b74:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106b78:	83 e0 04             	and    $0x4,%eax
ffff800000106b7b:	48 85 c0             	test   %rax,%rax
ffff800000106b7e:	75 2c                	jne    ffff800000106bac <page_init+0x121>
ffff800000106b80:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106b84:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106b88:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106b8d:	48 85 c0             	test   %rax,%rax
ffff800000106b90:	75 1a                	jne    ffff800000106bac <page_init+0x121>
ffff800000106b92:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106b96:	83 e0 04             	and    $0x4,%eax
ffff800000106b99:	48 85 c0             	test   %rax,%rax
ffff800000106b9c:	75 0e                	jne    ffff800000106bac <page_init+0x121>
ffff800000106b9e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000106ba2:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106ba7:	48 85 c0             	test   %rax,%rax
ffff800000106baa:	74 43                	je     ffff800000106bef <page_init+0x164>
ffff800000106bac:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bb0:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106bb4:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106bb8:	48 89 c2             	mov    %rax,%rdx
ffff800000106bbb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bbf:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106bc3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bc7:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106bcb:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff800000106bcf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bd3:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106bd7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106bdb:	48 8b 00             	mov    (%rax),%rax
ffff800000106bde:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106be2:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106be6:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106bea:	e9 81 00 00 00       	jmpq   ffff800000106c70 <page_init+0x1e5>
ffff800000106bef:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106bf6:	80 ff ff 
ffff800000106bf9:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106c00:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c04:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c08:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106c0c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106c10:	48 01 d0             	add    %rdx,%rax
ffff800000106c13:	48 8b 10             	mov    (%rax),%rdx
ffff800000106c16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c1a:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c1e:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106c22:	83 e0 3f             	and    $0x3f,%eax
ffff800000106c25:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106c2a:	89 c1                	mov    %eax,%ecx
ffff800000106c2c:	48 d3 e6             	shl    %cl,%rsi
ffff800000106c2f:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106c36:	80 ff ff 
ffff800000106c39:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106c40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c44:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106c48:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106c4c:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106c50:	48 01 c8             	add    %rcx,%rax
ffff800000106c53:	48 09 f2             	or     %rsi,%rdx
ffff800000106c56:	48 89 10             	mov    %rdx,(%rax)
ffff800000106c59:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c5d:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c61:	48 0b 45 f0          	or     -0x10(%rbp),%rax
ffff800000106c65:	48 89 c2             	mov    %rax,%rdx
ffff800000106c68:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c6c:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000106c70:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106c75:	5d                   	pop    %rbp
ffff800000106c76:	c3                   	retq   

ffff800000106c77 <page_clean>:
ffff800000106c77:	55                   	push   %rbp
ffff800000106c78:	48 89 e5             	mov    %rsp,%rbp
ffff800000106c7b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000106c7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c83:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106c87:	48 85 c0             	test   %rax,%rax
ffff800000106c8a:	75 11                	jne    ffff800000106c9d <page_clean+0x26>
ffff800000106c8c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106c90:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106c97:	00 
ffff800000106c98:	e9 55 01 00 00       	jmpq   ffff800000106df2 <page_clean+0x17b>
ffff800000106c9d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ca1:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106ca5:	83 e0 04             	and    $0x4,%eax
ffff800000106ca8:	48 85 c0             	test   %rax,%rax
ffff800000106cab:	75 12                	jne    ffff800000106cbf <page_clean+0x48>
ffff800000106cad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cb1:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000106cb5:	25 00 01 00 00       	and    $0x100,%eax
ffff800000106cba:	48 85 c0             	test   %rax,%rax
ffff800000106cbd:	74 6f                	je     ffff800000106d2e <page_clean+0xb7>
ffff800000106cbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cc3:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106cc7:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffff800000106ccb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106ccf:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000106cd3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cd7:	48 8b 00             	mov    (%rax),%rax
ffff800000106cda:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106cde:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106ce2:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106ce6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cea:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff800000106cee:	48 85 c0             	test   %rax,%rax
ffff800000106cf1:	0f 85 fb 00 00 00    	jne    ffff800000106df2 <page_clean+0x17b>
ffff800000106cf7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106cfb:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106d02:	00 
ffff800000106d03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d07:	48 8b 00             	mov    (%rax),%rax
ffff800000106d0a:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106d0e:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106d12:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106d16:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d1a:	48 8b 00             	mov    (%rax),%rax
ffff800000106d1d:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106d21:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106d25:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106d29:	e9 c4 00 00 00       	jmpq   ffff800000106df2 <page_clean+0x17b>
ffff800000106d2e:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106d35:	80 ff ff 
ffff800000106d38:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff800000106d3f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d43:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106d47:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106d4b:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106d4f:	48 01 d0             	add    %rdx,%rax
ffff800000106d52:	48 8b 10             	mov    (%rax),%rdx
ffff800000106d55:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d59:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106d5d:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000106d61:	83 e0 3f             	and    $0x3f,%eax
ffff800000106d64:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000106d69:	89 c1                	mov    %eax,%ecx
ffff800000106d6b:	48 d3 e6             	shl    %cl,%rsi
ffff800000106d6e:	48 89 f0             	mov    %rsi,%rax
ffff800000106d71:	48 f7 d0             	not    %rax
ffff800000106d74:	48 89 c6             	mov    %rax,%rsi
ffff800000106d77:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000106d7e:	80 ff ff 
ffff800000106d81:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
ffff800000106d88:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106d8c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106d90:	48 c1 e8 1b          	shr    $0x1b,%rax
ffff800000106d94:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000106d98:	48 01 c8             	add    %rcx,%rax
ffff800000106d9b:	48 21 f2             	and    %rsi,%rdx
ffff800000106d9e:	48 89 10             	mov    %rdx,(%rax)
ffff800000106da1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106da5:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
ffff800000106dac:	00 
ffff800000106dad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106db1:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
ffff800000106db8:	00 
ffff800000106db9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dbd:	48 8b 00             	mov    (%rax),%rax
ffff800000106dc0:	48 8b 50 38          	mov    0x38(%rax),%rdx
ffff800000106dc4:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106dc8:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff800000106dcc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106dd0:	48 8b 00             	mov    (%rax),%rax
ffff800000106dd3:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000106dd7:	48 83 c2 01          	add    $0x1,%rdx
ffff800000106ddb:	48 89 50 40          	mov    %rdx,0x40(%rax)
ffff800000106ddf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106de3:	48 8b 00             	mov    (%rax),%rax
ffff800000106de6:	48 8b 50 48          	mov    0x48(%rax),%rdx
ffff800000106dea:	48 83 ea 01          	sub    $0x1,%rdx
ffff800000106dee:	48 89 50 48          	mov    %rdx,0x48(%rax)
ffff800000106df2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106df7:	5d                   	pop    %rbp
ffff800000106df8:	c3                   	retq   

ffff800000106df9 <init_memory>:
ffff800000106df9:	55                   	push   %rbp
ffff800000106dfa:	48 89 e5             	mov    %rsp,%rbp
ffff800000106dfd:	48 83 ec 30          	sub    $0x30,%rsp
ffff800000106e01:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff800000106e08:	00 
ffff800000106e09:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000106e10:	00 
ffff800000106e11:	48 ba 60 1a 11 00 00 	movabs $0xffff800000111a60,%rdx
ffff800000106e18:	80 ff ff 
ffff800000106e1b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106e20:	bf ff 00 00 00       	mov    $0xff,%edi
ffff800000106e25:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106e2a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000106e31:	80 ff ff 
ffff800000106e34:	ff d1                	callq  *%rcx
ffff800000106e36:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
ffff800000106e3d:	80 ff ff 
ffff800000106e40:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff800000106e44:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff800000106e4b:	e9 14 02 00 00       	jmpq   ffff800000107064 <init_memory+0x26b>
ffff800000106e50:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e54:	8b 48 10             	mov    0x10(%rax),%ecx
ffff800000106e57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e5b:	48 8b 50 08          	mov    0x8(%rax),%rdx
ffff800000106e5f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106e63:	48 8b 00             	mov    (%rax),%rax
ffff800000106e66:	41 89 c9             	mov    %ecx,%r9d
ffff800000106e69:	49 89 d0             	mov    %rdx,%r8
ffff800000106e6c:	48 89 c1             	mov    %rax,%rcx
ffff800000106e6f:	48 ba d8 1a 11 00 00 	movabs $0xffff800000111ad8,%rdx
ffff800000106e76:	80 ff ff 
ffff800000106e79:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106e7e:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000106e83:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106e88:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff800000106e8f:	80 ff ff 
ffff800000106e92:	41 ff d2             	callq  *%r10
ffff800000106e95:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000106e9c:	00 
ffff800000106e9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ea1:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000106ea4:	83 f8 01             	cmp    $0x1,%eax
ffff800000106ea7:	0f 85 97 00 00 00    	jne    ffff800000106f44 <init_memory+0x14b>
ffff800000106ead:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106eb1:	48 89 c1             	mov    %rax,%rcx
ffff800000106eb4:	48 ba 04 1b 11 00 00 	movabs $0xffff800000111b04,%rdx
ffff800000106ebb:	80 ff ff 
ffff800000106ebe:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106ec3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106ec8:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106ecd:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106ed4:	80 ff ff 
ffff800000106ed7:	41 ff d0             	callq  *%r8
ffff800000106eda:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ede:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106ee2:	48 89 c1             	mov    %rax,%rcx
ffff800000106ee5:	48 ba 1e 1b 11 00 00 	movabs $0xffff800000111b1e,%rdx
ffff800000106eec:	80 ff ff 
ffff800000106eef:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106ef4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106ef9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106efe:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106f05:	80 ff ff 
ffff800000106f08:	41 ff d0             	callq  *%r8
ffff800000106f0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f0f:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106f13:	48 01 45 f8          	add    %rax,-0x8(%rbp)
ffff800000106f17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000106f1b:	48 89 c1             	mov    %rax,%rcx
ffff800000106f1e:	48 ba 2e 1b 11 00 00 	movabs $0xffff800000111b2e,%rdx
ffff800000106f25:	80 ff ff 
ffff800000106f28:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000106f2d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000106f32:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000106f37:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000106f3e:	80 ff ff 
ffff800000106f41:	41 ff d0             	callq  *%r8
ffff800000106f44:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000106f4b:	80 ff ff 
ffff800000106f4e:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000106f51:	48 63 d0             	movslq %eax,%rdx
ffff800000106f54:	48 89 d0             	mov    %rdx,%rax
ffff800000106f57:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f5b:	48 01 d0             	add    %rdx,%rax
ffff800000106f5e:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f62:	48 01 c8             	add    %rcx,%rax
ffff800000106f65:	48 8b 10             	mov    (%rax),%rdx
ffff800000106f68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106f6c:	48 8b 00             	mov    (%rax),%rax
ffff800000106f6f:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000106f73:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106f7a:	80 ff ff 
ffff800000106f7d:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000106f80:	48 63 d0             	movslq %eax,%rdx
ffff800000106f83:	48 89 d0             	mov    %rdx,%rax
ffff800000106f86:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f8a:	48 01 d0             	add    %rdx,%rax
ffff800000106f8d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106f91:	48 01 f0             	add    %rsi,%rax
ffff800000106f94:	48 89 08             	mov    %rcx,(%rax)
ffff800000106f97:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff800000106f9e:	80 ff ff 
ffff800000106fa1:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000106fa4:	48 63 d0             	movslq %eax,%rdx
ffff800000106fa7:	48 89 d0             	mov    %rdx,%rax
ffff800000106faa:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fae:	48 01 d0             	add    %rdx,%rax
ffff800000106fb1:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fb5:	48 01 c8             	add    %rcx,%rax
ffff800000106fb8:	48 83 c0 08          	add    $0x8,%rax
ffff800000106fbc:	48 8b 10             	mov    (%rax),%rdx
ffff800000106fbf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106fc3:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000106fc7:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
ffff800000106fcb:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000106fd2:	80 ff ff 
ffff800000106fd5:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000106fd8:	48 63 d0             	movslq %eax,%rdx
ffff800000106fdb:	48 89 d0             	mov    %rdx,%rax
ffff800000106fde:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fe2:	48 01 d0             	add    %rdx,%rax
ffff800000106fe5:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000106fe9:	48 01 f0             	add    %rsi,%rax
ffff800000106fec:	48 83 c0 08          	add    $0x8,%rax
ffff800000106ff0:	48 89 08             	mov    %rcx,(%rax)
ffff800000106ff3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000106ff7:	8b 50 10             	mov    0x10(%rax),%edx
ffff800000106ffa:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff800000107001:	80 ff ff 
ffff800000107004:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000107007:	48 63 c8             	movslq %eax,%rcx
ffff80000010700a:	48 89 c8             	mov    %rcx,%rax
ffff80000010700d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107011:	48 01 c8             	add    %rcx,%rax
ffff800000107014:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107018:	48 01 f0             	add    %rsi,%rax
ffff80000010701b:	48 83 c0 10          	add    $0x10,%rax
ffff80000010701f:	89 10                	mov    %edx,(%rax)
ffff800000107021:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000107024:	48 98                	cltq   
ffff800000107026:	48 ba a0 90 12 00 00 	movabs $0xffff8000001290a0,%rdx
ffff80000010702d:	80 ff ff 
ffff800000107030:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
ffff800000107037:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
ffff80000010703c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107040:	8b 40 10             	mov    0x10(%rax),%eax
ffff800000107043:	83 f8 04             	cmp    $0x4,%eax
ffff800000107046:	77 26                	ja     ffff80000010706e <init_memory+0x275>
ffff800000107048:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010704c:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff800000107050:	48 85 c0             	test   %rax,%rax
ffff800000107053:	74 19                	je     ffff80000010706e <init_memory+0x275>
ffff800000107055:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107059:	8b 40 10             	mov    0x10(%rax),%eax
ffff80000010705c:	85 c0                	test   %eax,%eax
ffff80000010705e:	74 0e                	je     ffff80000010706e <init_memory+0x275>
ffff800000107060:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
ffff800000107064:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
ffff800000107068:	0f 8e e2 fd ff ff    	jle    ffff800000106e50 <init_memory+0x57>
ffff80000010706e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000107072:	48 89 c1             	mov    %rax,%rcx
ffff800000107075:	48 ba 48 1b 11 00 00 	movabs $0xffff800000111b48,%rdx
ffff80000010707c:	80 ff ff 
ffff80000010707f:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107084:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff800000107089:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010708e:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107095:	80 ff ff 
ffff800000107098:	41 ff d0             	callq  *%r8
ffff80000010709b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff8000001070a2:	00 
ffff8000001070a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff8000001070aa:	e9 e1 00 00 00       	jmpq   ffff800000107190 <init_memory+0x397>
ffff8000001070af:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001070b6:	80 ff ff 
ffff8000001070b9:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001070bc:	48 63 d0             	movslq %eax,%rdx
ffff8000001070bf:	48 89 d0             	mov    %rdx,%rax
ffff8000001070c2:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070c6:	48 01 d0             	add    %rdx,%rax
ffff8000001070c9:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070cd:	48 01 c8             	add    %rcx,%rax
ffff8000001070d0:	48 83 c0 10          	add    $0x10,%rax
ffff8000001070d4:	8b 00                	mov    (%rax),%eax
ffff8000001070d6:	83 f8 01             	cmp    $0x1,%eax
ffff8000001070d9:	0f 85 a9 00 00 00    	jne    ffff800000107188 <init_memory+0x38f>
ffff8000001070df:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001070e6:	80 ff ff 
ffff8000001070e9:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff8000001070ec:	48 63 d0             	movslq %eax,%rdx
ffff8000001070ef:	48 89 d0             	mov    %rdx,%rax
ffff8000001070f2:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070f6:	48 01 d0             	add    %rdx,%rax
ffff8000001070f9:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001070fd:	48 01 c8             	add    %rcx,%rax
ffff800000107100:	48 8b 00             	mov    (%rax),%rax
ffff800000107103:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
ffff800000107109:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff80000010710f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff800000107113:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff80000010711a:	80 ff ff 
ffff80000010711d:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000107120:	48 63 d0             	movslq %eax,%rdx
ffff800000107123:	48 89 d0             	mov    %rdx,%rax
ffff800000107126:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010712a:	48 01 d0             	add    %rdx,%rax
ffff80000010712d:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107131:	48 01 c8             	add    %rcx,%rax
ffff800000107134:	48 8b 08             	mov    (%rax),%rcx
ffff800000107137:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010713e:	80 ff ff 
ffff800000107141:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000107144:	48 63 d0             	movslq %eax,%rdx
ffff800000107147:	48 89 d0             	mov    %rdx,%rax
ffff80000010714a:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010714e:	48 01 d0             	add    %rdx,%rax
ffff800000107151:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107155:	48 01 f0             	add    %rsi,%rax
ffff800000107158:	48 83 c0 08          	add    $0x8,%rax
ffff80000010715c:	48 8b 00             	mov    (%rax),%rax
ffff80000010715f:	48 01 c8             	add    %rcx,%rax
ffff800000107162:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
ffff800000107168:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff80000010716c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000107170:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
ffff800000107174:	76 15                	jbe    ffff80000010718b <init_memory+0x392>
ffff800000107176:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010717a:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
ffff80000010717e:	48 c1 e8 15          	shr    $0x15,%rax
ffff800000107182:	48 01 45 f8          	add    %rax,-0x8(%rbp)
ffff800000107186:	eb 04                	jmp    ffff80000010718c <init_memory+0x393>
ffff800000107188:	90                   	nop
ffff800000107189:	eb 01                	jmp    ffff80000010718c <init_memory+0x393>
ffff80000010718b:	90                   	nop
ffff80000010718c:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
ffff800000107190:	8b 45 f4             	mov    -0xc(%rbp),%eax
ffff800000107193:	48 63 d0             	movslq %eax,%rdx
ffff800000107196:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010719d:	80 ff ff 
ffff8000001071a0:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
ffff8000001071a7:	48 39 c2             	cmp    %rax,%rdx
ffff8000001071aa:	0f 86 ff fe ff ff    	jbe    ffff8000001070af <init_memory+0x2b6>
ffff8000001071b0:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff8000001071b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001071b8:	49 89 d0             	mov    %rdx,%r8
ffff8000001071bb:	48 89 c1             	mov    %rax,%rcx
ffff8000001071be:	48 ba 68 1b 11 00 00 	movabs $0xffff800000111b68,%rdx
ffff8000001071c5:	80 ff ff 
ffff8000001071c8:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001071cd:	bf 00 80 ff 00       	mov    $0xff8000,%edi
ffff8000001071d2:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001071d7:	49 b9 29 53 10 00 00 	movabs $0xffff800000105329,%r9
ffff8000001071de:	80 ff ff 
ffff8000001071e1:	41 ff d1             	callq  *%r9
ffff8000001071e4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001071eb:	80 ff ff 
ffff8000001071ee:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff8000001071f5:	48 b9 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rcx
ffff8000001071fc:	80 ff ff 
ffff8000001071ff:	48 89 d0             	mov    %rdx,%rax
ffff800000107202:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107206:	48 01 d0             	add    %rdx,%rax
ffff800000107209:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010720d:	48 01 c8             	add    %rcx,%rax
ffff800000107210:	48 8b 08             	mov    (%rax),%rcx
ffff800000107213:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010721a:	80 ff ff 
ffff80000010721d:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
ffff800000107224:	48 be a0 90 12 00 00 	movabs $0xffff8000001290a0,%rsi
ffff80000010722b:	80 ff ff 
ffff80000010722e:	48 89 d0             	mov    %rdx,%rax
ffff800000107231:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107235:	48 01 d0             	add    %rdx,%rax
ffff800000107238:	48 c1 e0 02          	shl    $0x2,%rax
ffff80000010723c:	48 01 f0             	add    %rsi,%rax
ffff80000010723f:	48 83 c0 08          	add    $0x8,%rax
ffff800000107243:	48 8b 00             	mov    (%rax),%rax
ffff800000107246:	48 01 c8             	add    %rcx,%rax
ffff800000107249:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010724d:	eb fe                	jmp    ffff80000010724d <init_memory+0x454>

ffff80000010724f <alloc_pages>:
ffff80000010724f:	55                   	push   %rbp
ffff800000107250:	48 89 e5             	mov    %rsp,%rbp
ffff800000107253:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
ffff800000107257:	89 7d 8c             	mov    %edi,-0x74(%rbp)
ffff80000010725a:	89 75 88             	mov    %esi,-0x78(%rbp)
ffff80000010725d:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
ffff800000107261:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
ffff800000107268:	00 
ffff800000107269:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107270:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
ffff800000107277:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff80000010727b:	74 4c                	je     ffff8000001072c9 <alloc_pages+0x7a>
ffff80000010727d:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
ffff800000107281:	7f 6e                	jg     ffff8000001072f1 <alloc_pages+0xa2>
ffff800000107283:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
ffff800000107287:	74 08                	je     ffff800000107291 <alloc_pages+0x42>
ffff800000107289:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
ffff80000010728d:	74 1a                	je     ffff8000001072a9 <alloc_pages+0x5a>
ffff80000010728f:	eb 60                	jmp    ffff8000001072f1 <alloc_pages+0xa2>
ffff800000107291:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
ffff800000107298:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff80000010729f:	80 ff ff 
ffff8000001072a2:	8b 00                	mov    (%rax),%eax
ffff8000001072a4:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff8000001072a7:	eb 77                	jmp    ffff800000107320 <alloc_pages+0xd1>
ffff8000001072a9:	48 b8 30 90 12 00 00 	movabs $0xffff800000129030,%rax
ffff8000001072b0:	80 ff ff 
ffff8000001072b3:	8b 00                	mov    (%rax),%eax
ffff8000001072b5:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff8000001072b8:	48 b8 34 90 12 00 00 	movabs $0xffff800000129034,%rax
ffff8000001072bf:	80 ff ff 
ffff8000001072c2:	8b 00                	mov    (%rax),%eax
ffff8000001072c4:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff8000001072c7:	eb 57                	jmp    ffff800000107320 <alloc_pages+0xd1>
ffff8000001072c9:	48 b8 38 90 12 00 00 	movabs $0xffff800000129038,%rax
ffff8000001072d0:	80 ff ff 
ffff8000001072d3:	8b 00                	mov    (%rax),%eax
ffff8000001072d5:	89 45 f8             	mov    %eax,-0x8(%rbp)
ffff8000001072d8:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001072df:	80 ff ff 
ffff8000001072e2:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
ffff8000001072e9:	83 e8 01             	sub    $0x1,%eax
ffff8000001072ec:	89 45 f4             	mov    %eax,-0xc(%rbp)
ffff8000001072ef:	eb 2f                	jmp    ffff800000107320 <alloc_pages+0xd1>
ffff8000001072f1:	48 ba 98 1b 11 00 00 	movabs $0xffff800000111b98,%rdx
ffff8000001072f8:	80 ff ff 
ffff8000001072fb:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107300:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107305:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010730a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000107311:	80 ff ff 
ffff800000107314:	ff d1                	callq  *%rcx
ffff800000107316:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010731b:	e9 5f 02 00 00       	jmpq   ffff80000010757f <alloc_pages+0x330>
ffff800000107320:	8b 45 f8             	mov    -0x8(%rbp),%eax
ffff800000107323:	89 45 fc             	mov    %eax,-0x4(%rbp)
ffff800000107326:	e9 1b 02 00 00       	jmpq   ffff800000107546 <alloc_pages+0x2f7>
ffff80000010732b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107332:	80 ff ff 
ffff800000107335:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff80000010733c:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff80000010733f:	48 63 d0             	movslq %eax,%rdx
ffff800000107342:	48 89 d0             	mov    %rdx,%rax
ffff800000107345:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107349:	48 01 d0             	add    %rdx,%rax
ffff80000010734c:	48 c1 e0 04          	shl    $0x4,%rax
ffff800000107350:	48 01 c8             	add    %rcx,%rax
ffff800000107353:	48 8b 50 40          	mov    0x40(%rax),%rdx
ffff800000107357:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff80000010735a:	48 98                	cltq   
ffff80000010735c:	48 39 c2             	cmp    %rax,%rdx
ffff80000010735f:	0f 82 dc 01 00 00    	jb     ffff800000107541 <alloc_pages+0x2f2>
ffff800000107365:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010736c:	80 ff ff 
ffff80000010736f:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
ffff800000107376:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107379:	48 63 d0             	movslq %eax,%rdx
ffff80000010737c:	48 89 d0             	mov    %rdx,%rax
ffff80000010737f:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107383:	48 01 d0             	add    %rdx,%rax
ffff800000107386:	48 c1 e0 04          	shl    $0x4,%rax
ffff80000010738a:	48 01 c8             	add    %rcx,%rax
ffff80000010738d:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
ffff800000107391:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000107395:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff800000107399:	48 c1 e8 15          	shr    $0x15,%rax
ffff80000010739d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
ffff8000001073a1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001073a5:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001073a9:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001073ad:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
ffff8000001073b1:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff8000001073b5:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff8000001073b9:	48 c1 e8 15          	shr    $0x15,%rax
ffff8000001073bd:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
ffff8000001073c1:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001073c5:	83 e0 3f             	and    $0x3f,%eax
ffff8000001073c8:	48 89 c2             	mov    %rax,%rdx
ffff8000001073cb:	b8 40 00 00 00       	mov    $0x40,%eax
ffff8000001073d0:	48 29 d0             	sub    %rdx,%rax
ffff8000001073d3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
ffff8000001073d7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
ffff8000001073db:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001073df:	e9 4d 01 00 00       	jmpq   ffff800000107531 <alloc_pages+0x2e2>
ffff8000001073e4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001073eb:	80 ff ff 
ffff8000001073ee:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
ffff8000001073f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001073f9:	48 c1 e8 06          	shr    $0x6,%rax
ffff8000001073fd:	48 c1 e0 03          	shl    $0x3,%rax
ffff800000107401:	48 01 d0             	add    %rdx,%rax
ffff800000107404:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
ffff800000107408:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010740c:	83 e0 3f             	and    $0x3f,%eax
ffff80000010740f:	48 89 45 98          	mov    %rax,-0x68(%rbp)
ffff800000107413:	48 8b 45 98          	mov    -0x68(%rbp),%rax
ffff800000107417:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff80000010741b:	e9 e3 00 00 00       	jmpq   ffff800000107503 <alloc_pages+0x2b4>
ffff800000107420:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107424:	48 8b 00             	mov    (%rax),%rax
ffff800000107427:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff80000010742b:	89 d1                	mov    %edx,%ecx
ffff80000010742d:	48 d3 e8             	shr    %cl,%rax
ffff800000107430:	48 89 c6             	mov    %rax,%rsi
ffff800000107433:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
ffff800000107437:	48 83 c0 08          	add    $0x8,%rax
ffff80000010743b:	48 8b 10             	mov    (%rax),%rdx
ffff80000010743e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107442:	89 c1                	mov    %eax,%ecx
ffff800000107444:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107449:	29 c8                	sub    %ecx,%eax
ffff80000010744b:	89 c1                	mov    %eax,%ecx
ffff80000010744d:	48 d3 e2             	shl    %cl,%rdx
ffff800000107450:	48 89 d0             	mov    %rdx,%rax
ffff800000107453:	48 09 c6             	or     %rax,%rsi
ffff800000107456:	48 89 f2             	mov    %rsi,%rdx
ffff800000107459:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
ffff80000010745d:	74 16                	je     ffff800000107475 <alloc_pages+0x226>
ffff80000010745f:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff800000107462:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107467:	89 c1                	mov    %eax,%ecx
ffff800000107469:	48 d3 e6             	shl    %cl,%rsi
ffff80000010746c:	48 89 f0             	mov    %rsi,%rax
ffff80000010746f:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107473:	eb 07                	jmp    ffff80000010747c <alloc_pages+0x22d>
ffff800000107475:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff80000010747c:	48 21 d0             	and    %rdx,%rax
ffff80000010747f:	48 85 c0             	test   %rax,%rax
ffff800000107482:	75 7a                	jne    ffff8000001074fe <alloc_pages+0x2af>
ffff800000107484:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000107488:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010748c:	48 01 d0             	add    %rdx,%rax
ffff80000010748f:	48 83 e8 01          	sub    $0x1,%rax
ffff800000107493:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000107497:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff80000010749e:	00 
ffff80000010749f:	eb 50                	jmp    ffff8000001074f1 <alloc_pages+0x2a2>
ffff8000001074a1:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff8000001074a8:	80 ff ff 
ffff8000001074ab:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff8000001074b2:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff8000001074b6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001074ba:	48 01 c2             	add    %rax,%rdx
ffff8000001074bd:	48 89 d0             	mov    %rdx,%rax
ffff8000001074c0:	48 c1 e0 02          	shl    $0x2,%rax
ffff8000001074c4:	48 01 d0             	add    %rdx,%rax
ffff8000001074c7:	48 c1 e0 03          	shl    $0x3,%rax
ffff8000001074cb:	48 01 c8             	add    %rcx,%rax
ffff8000001074ce:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff8000001074d2:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
ffff8000001074d6:	48 8b 45 90          	mov    -0x70(%rbp),%rax
ffff8000001074da:	48 89 d6             	mov    %rdx,%rsi
ffff8000001074dd:	48 89 c7             	mov    %rax,%rdi
ffff8000001074e0:	48 b8 8b 6a 10 00 00 	movabs $0xffff800000106a8b,%rax
ffff8000001074e7:	80 ff ff 
ffff8000001074ea:	ff d0                	callq  *%rax
ffff8000001074ec:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
ffff8000001074f1:	8b 45 88             	mov    -0x78(%rbp),%eax
ffff8000001074f4:	48 98                	cltq   
ffff8000001074f6:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
ffff8000001074fa:	72 a5                	jb     ffff8000001074a1 <alloc_pages+0x252>
ffff8000001074fc:	eb 5b                	jmp    ffff800000107559 <alloc_pages+0x30a>
ffff8000001074fe:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
ffff800000107503:	b8 40 00 00 00       	mov    $0x40,%eax
ffff800000107508:	48 2b 45 98          	sub    -0x68(%rbp),%rax
ffff80000010750c:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
ffff800000107510:	0f 82 0a ff ff ff    	jb     ffff800000107420 <alloc_pages+0x1d1>
ffff800000107516:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010751a:	83 e0 3f             	and    $0x3f,%eax
ffff80000010751d:	48 85 c0             	test   %rax,%rax
ffff800000107520:	74 06                	je     ffff800000107528 <alloc_pages+0x2d9>
ffff800000107522:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
ffff800000107526:	eb 05                	jmp    ffff80000010752d <alloc_pages+0x2de>
ffff800000107528:	b8 40 00 00 00       	mov    $0x40,%eax
ffff80000010752d:	48 01 45 e8          	add    %rax,-0x18(%rbp)
ffff800000107531:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107535:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
ffff800000107539:	0f 86 a5 fe ff ff    	jbe    ffff8000001073e4 <alloc_pages+0x195>
ffff80000010753f:	eb 01                	jmp    ffff800000107542 <alloc_pages+0x2f3>
ffff800000107541:	90                   	nop
ffff800000107542:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107546:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107549:	3b 45 f4             	cmp    -0xc(%rbp),%eax
ffff80000010754c:	0f 8e d9 fd ff ff    	jle    ffff80000010732b <alloc_pages+0xdc>
ffff800000107552:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107557:	eb 26                	jmp    ffff80000010757f <alloc_pages+0x330>
ffff800000107559:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000107560:	80 ff ff 
ffff800000107563:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
ffff80000010756a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
ffff80000010756e:	48 89 d0             	mov    %rdx,%rax
ffff800000107571:	48 c1 e0 02          	shl    $0x2,%rax
ffff800000107575:	48 01 d0             	add    %rdx,%rax
ffff800000107578:	48 c1 e0 03          	shl    $0x3,%rax
ffff80000010757c:	48 01 c8             	add    %rcx,%rax
ffff80000010757f:	c9                   	leaveq 
ffff800000107580:	c3                   	retq   

ffff800000107581 <io_in8>:
ffff800000107581:	55                   	push   %rbp
ffff800000107582:	48 89 e5             	mov    %rsp,%rbp
ffff800000107585:	89 f8                	mov    %edi,%eax
ffff800000107587:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
ffff80000010758b:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
ffff80000010758f:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
ffff800000107593:	89 c2                	mov    %eax,%edx
ffff800000107595:	ec                   	in     (%dx),%al
ffff800000107596:	0f ae f0             	mfence 
ffff800000107599:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff80000010759c:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff8000001075a0:	5d                   	pop    %rbp
ffff8000001075a1:	c3                   	retq   

ffff8000001075a2 <io_out8>:
ffff8000001075a2:	55                   	push   %rbp
ffff8000001075a3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001075a6:	89 f8                	mov    %edi,%eax
ffff8000001075a8:	89 f2                	mov    %esi,%edx
ffff8000001075aa:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
ffff8000001075ae:	89 d0                	mov    %edx,%eax
ffff8000001075b0:	88 45 f8             	mov    %al,-0x8(%rbp)
ffff8000001075b3:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
ffff8000001075b7:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
ffff8000001075bb:	ee                   	out    %al,(%dx)
ffff8000001075bc:	0f ae f0             	mfence 
ffff8000001075bf:	90                   	nop
ffff8000001075c0:	5d                   	pop    %rbp
ffff8000001075c1:	c3                   	retq   

ffff8000001075c2 <set_intr_gate>:
ffff8000001075c2:	55                   	push   %rbp
ffff8000001075c3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001075c6:	89 7d ec             	mov    %edi,-0x14(%rbp)
ffff8000001075c9:	89 f0                	mov    %esi,%eax
ffff8000001075cb:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
ffff8000001075cf:	88 45 e8             	mov    %al,-0x18(%rbp)
ffff8000001075d2:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001075d5:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001075d9:	48 89 c2             	mov    %rax,%rdx
ffff8000001075dc:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
ffff8000001075e3:	80 ff ff 
ffff8000001075e6:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffff8000001075ea:	8b 45 ec             	mov    -0x14(%rbp),%eax
ffff8000001075ed:	48 c1 e0 04          	shl    $0x4,%rax
ffff8000001075f1:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffff8000001075f5:	48 b8 62 8e 10 00 00 	movabs $0xffff800000108e62,%rax
ffff8000001075fc:	80 ff ff 
ffff8000001075ff:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
ffff800000107603:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107607:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
ffff80000010760d:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
ffff800000107611:	48 89 c2             	mov    %rax,%rdx
ffff800000107614:	44 89 c0             	mov    %r8d,%eax
ffff800000107617:	66 89 d0             	mov    %dx,%ax
ffff80000010761a:	48 83 e1 07          	and    $0x7,%rcx
ffff80000010761e:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
ffff800000107625:	48 c1 e1 20          	shl    $0x20,%rcx
ffff800000107629:	48 01 c8             	add    %rcx,%rax
ffff80000010762c:	48 31 c9             	xor    %rcx,%rcx
ffff80000010762f:	89 d1                	mov    %edx,%ecx
ffff800000107631:	48 c1 e9 10          	shr    $0x10,%rcx
ffff800000107635:	48 c1 e1 30          	shl    $0x30,%rcx
ffff800000107639:	48 01 c8             	add    %rcx,%rax
ffff80000010763c:	48 89 06             	mov    %rax,(%rsi)
ffff80000010763f:	48 c1 ea 20          	shr    $0x20,%rdx
ffff800000107643:	48 89 17             	mov    %rdx,(%rdi)
ffff800000107646:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff80000010764a:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
ffff80000010764e:	90                   	nop
ffff80000010764f:	5d                   	pop    %rbp
ffff800000107650:	c3                   	retq   
ffff800000107651:	55                   	push   %rbp
ffff800000107652:	48 89 e5             	mov    %rsp,%rbp
ffff800000107655:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000107659:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010765d:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000107661:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff800000107665:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000107669:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff80000010766d:	48 ba 70 9e 10 00 00 	movabs $0xffff800000109e70,%rdx
ffff800000107674:	80 ff ff 
ffff800000107677:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010767b:	48 89 02             	mov    %rax,(%rdx)
ffff80000010767e:	48 ba 78 9e 10 00 00 	movabs $0xffff800000109e78,%rdx
ffff800000107685:	80 ff ff 
ffff800000107688:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff80000010768c:	48 89 02             	mov    %rax,(%rdx)
ffff80000010768f:	48 ba 80 9e 10 00 00 	movabs $0xffff800000109e80,%rdx
ffff800000107696:	80 ff ff 
ffff800000107699:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010769d:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076a0:	48 ba 90 9e 10 00 00 	movabs $0xffff800000109e90,%rdx
ffff8000001076a7:	80 ff ff 
ffff8000001076aa:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001076ae:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076b1:	48 ba 98 9e 10 00 00 	movabs $0xffff800000109e98,%rdx
ffff8000001076b8:	80 ff ff 
ffff8000001076bb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001076bf:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076c2:	48 ba a0 9e 10 00 00 	movabs $0xffff800000109ea0,%rdx
ffff8000001076c9:	80 ff ff 
ffff8000001076cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001076d0:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076d3:	48 ba a8 9e 10 00 00 	movabs $0xffff800000109ea8,%rdx
ffff8000001076da:	80 ff ff 
ffff8000001076dd:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff8000001076e1:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076e4:	48 ba b0 9e 10 00 00 	movabs $0xffff800000109eb0,%rdx
ffff8000001076eb:	80 ff ff 
ffff8000001076ee:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff8000001076f2:	48 89 02             	mov    %rax,(%rdx)
ffff8000001076f5:	48 ba b8 9e 10 00 00 	movabs $0xffff800000109eb8,%rdx
ffff8000001076fc:	80 ff ff 
ffff8000001076ff:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff800000107703:	48 89 02             	mov    %rax,(%rdx)
ffff800000107706:	48 ba c0 9e 10 00 00 	movabs $0xffff800000109ec0,%rdx
ffff80000010770d:	80 ff ff 
ffff800000107710:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff800000107714:	48 89 02             	mov    %rax,(%rdx)
ffff800000107717:	90                   	nop
ffff800000107718:	5d                   	pop    %rbp
ffff800000107719:	c3                   	retq   

ffff80000010771a <IRQ0x20_interrupt>:
ffff80000010771a:	6a 00                	pushq  $0x0
ffff80000010771c:	fc                   	cld    
ffff80000010771d:	50                   	push   %rax
ffff80000010771e:	50                   	push   %rax
ffff80000010771f:	48 8c c0             	mov    %es,%rax
ffff800000107722:	50                   	push   %rax
ffff800000107723:	48 8c d8             	mov    %ds,%rax
ffff800000107726:	50                   	push   %rax
ffff800000107727:	48 31 c0             	xor    %rax,%rax
ffff80000010772a:	55                   	push   %rbp
ffff80000010772b:	57                   	push   %rdi
ffff80000010772c:	56                   	push   %rsi
ffff80000010772d:	52                   	push   %rdx
ffff80000010772e:	51                   	push   %rcx
ffff80000010772f:	53                   	push   %rbx
ffff800000107730:	41 50                	push   %r8
ffff800000107732:	41 51                	push   %r9
ffff800000107734:	41 52                	push   %r10
ffff800000107736:	41 53                	push   %r11
ffff800000107738:	41 54                	push   %r12
ffff80000010773a:	41 55                	push   %r13
ffff80000010773c:	41 56                	push   %r14
ffff80000010773e:	41 57                	push   %r15
ffff800000107740:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107747:	48 8e da             	mov    %rdx,%ds
ffff80000010774a:	48 8e c2             	mov    %rdx,%es
ffff80000010774d:	48 89 e7             	mov    %rsp,%rdi
ffff800000107750:	48 8d 05 ce c8 ff ff 	lea    -0x3732(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107757:	50                   	push   %rax
ffff800000107758:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
ffff80000010775f:	e9 f2 07 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107764 <IRQ0x21_interrupt>:
ffff800000107764:	6a 00                	pushq  $0x0
ffff800000107766:	fc                   	cld    
ffff800000107767:	50                   	push   %rax
ffff800000107768:	50                   	push   %rax
ffff800000107769:	48 8c c0             	mov    %es,%rax
ffff80000010776c:	50                   	push   %rax
ffff80000010776d:	48 8c d8             	mov    %ds,%rax
ffff800000107770:	50                   	push   %rax
ffff800000107771:	48 31 c0             	xor    %rax,%rax
ffff800000107774:	55                   	push   %rbp
ffff800000107775:	57                   	push   %rdi
ffff800000107776:	56                   	push   %rsi
ffff800000107777:	52                   	push   %rdx
ffff800000107778:	51                   	push   %rcx
ffff800000107779:	53                   	push   %rbx
ffff80000010777a:	41 50                	push   %r8
ffff80000010777c:	41 51                	push   %r9
ffff80000010777e:	41 52                	push   %r10
ffff800000107780:	41 53                	push   %r11
ffff800000107782:	41 54                	push   %r12
ffff800000107784:	41 55                	push   %r13
ffff800000107786:	41 56                	push   %r14
ffff800000107788:	41 57                	push   %r15
ffff80000010778a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107791:	48 8e da             	mov    %rdx,%ds
ffff800000107794:	48 8e c2             	mov    %rdx,%es
ffff800000107797:	48 89 e7             	mov    %rsp,%rdi
ffff80000010779a:	48 8d 05 84 c8 ff ff 	lea    -0x377c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001077a1:	50                   	push   %rax
ffff8000001077a2:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
ffff8000001077a9:	e9 a8 07 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff8000001077ae <IRQ0x22_interrupt>:
ffff8000001077ae:	6a 00                	pushq  $0x0
ffff8000001077b0:	fc                   	cld    
ffff8000001077b1:	50                   	push   %rax
ffff8000001077b2:	50                   	push   %rax
ffff8000001077b3:	48 8c c0             	mov    %es,%rax
ffff8000001077b6:	50                   	push   %rax
ffff8000001077b7:	48 8c d8             	mov    %ds,%rax
ffff8000001077ba:	50                   	push   %rax
ffff8000001077bb:	48 31 c0             	xor    %rax,%rax
ffff8000001077be:	55                   	push   %rbp
ffff8000001077bf:	57                   	push   %rdi
ffff8000001077c0:	56                   	push   %rsi
ffff8000001077c1:	52                   	push   %rdx
ffff8000001077c2:	51                   	push   %rcx
ffff8000001077c3:	53                   	push   %rbx
ffff8000001077c4:	41 50                	push   %r8
ffff8000001077c6:	41 51                	push   %r9
ffff8000001077c8:	41 52                	push   %r10
ffff8000001077ca:	41 53                	push   %r11
ffff8000001077cc:	41 54                	push   %r12
ffff8000001077ce:	41 55                	push   %r13
ffff8000001077d0:	41 56                	push   %r14
ffff8000001077d2:	41 57                	push   %r15
ffff8000001077d4:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001077db:	48 8e da             	mov    %rdx,%ds
ffff8000001077de:	48 8e c2             	mov    %rdx,%es
ffff8000001077e1:	48 89 e7             	mov    %rsp,%rdi
ffff8000001077e4:	48 8d 05 3a c8 ff ff 	lea    -0x37c6(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001077eb:	50                   	push   %rax
ffff8000001077ec:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
ffff8000001077f3:	e9 5e 07 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff8000001077f8 <IRQ0x23_interrupt>:
ffff8000001077f8:	6a 00                	pushq  $0x0
ffff8000001077fa:	fc                   	cld    
ffff8000001077fb:	50                   	push   %rax
ffff8000001077fc:	50                   	push   %rax
ffff8000001077fd:	48 8c c0             	mov    %es,%rax
ffff800000107800:	50                   	push   %rax
ffff800000107801:	48 8c d8             	mov    %ds,%rax
ffff800000107804:	50                   	push   %rax
ffff800000107805:	48 31 c0             	xor    %rax,%rax
ffff800000107808:	55                   	push   %rbp
ffff800000107809:	57                   	push   %rdi
ffff80000010780a:	56                   	push   %rsi
ffff80000010780b:	52                   	push   %rdx
ffff80000010780c:	51                   	push   %rcx
ffff80000010780d:	53                   	push   %rbx
ffff80000010780e:	41 50                	push   %r8
ffff800000107810:	41 51                	push   %r9
ffff800000107812:	41 52                	push   %r10
ffff800000107814:	41 53                	push   %r11
ffff800000107816:	41 54                	push   %r12
ffff800000107818:	41 55                	push   %r13
ffff80000010781a:	41 56                	push   %r14
ffff80000010781c:	41 57                	push   %r15
ffff80000010781e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107825:	48 8e da             	mov    %rdx,%ds
ffff800000107828:	48 8e c2             	mov    %rdx,%es
ffff80000010782b:	48 89 e7             	mov    %rsp,%rdi
ffff80000010782e:	48 8d 05 f0 c7 ff ff 	lea    -0x3810(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107835:	50                   	push   %rax
ffff800000107836:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
ffff80000010783d:	e9 14 07 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107842 <IRQ0x24_interrupt>:
ffff800000107842:	6a 00                	pushq  $0x0
ffff800000107844:	fc                   	cld    
ffff800000107845:	50                   	push   %rax
ffff800000107846:	50                   	push   %rax
ffff800000107847:	48 8c c0             	mov    %es,%rax
ffff80000010784a:	50                   	push   %rax
ffff80000010784b:	48 8c d8             	mov    %ds,%rax
ffff80000010784e:	50                   	push   %rax
ffff80000010784f:	48 31 c0             	xor    %rax,%rax
ffff800000107852:	55                   	push   %rbp
ffff800000107853:	57                   	push   %rdi
ffff800000107854:	56                   	push   %rsi
ffff800000107855:	52                   	push   %rdx
ffff800000107856:	51                   	push   %rcx
ffff800000107857:	53                   	push   %rbx
ffff800000107858:	41 50                	push   %r8
ffff80000010785a:	41 51                	push   %r9
ffff80000010785c:	41 52                	push   %r10
ffff80000010785e:	41 53                	push   %r11
ffff800000107860:	41 54                	push   %r12
ffff800000107862:	41 55                	push   %r13
ffff800000107864:	41 56                	push   %r14
ffff800000107866:	41 57                	push   %r15
ffff800000107868:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010786f:	48 8e da             	mov    %rdx,%ds
ffff800000107872:	48 8e c2             	mov    %rdx,%es
ffff800000107875:	48 89 e7             	mov    %rsp,%rdi
ffff800000107878:	48 8d 05 a6 c7 ff ff 	lea    -0x385a(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010787f:	50                   	push   %rax
ffff800000107880:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
ffff800000107887:	e9 ca 06 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff80000010788c <IRQ0x25_interrupt>:
ffff80000010788c:	6a 00                	pushq  $0x0
ffff80000010788e:	fc                   	cld    
ffff80000010788f:	50                   	push   %rax
ffff800000107890:	50                   	push   %rax
ffff800000107891:	48 8c c0             	mov    %es,%rax
ffff800000107894:	50                   	push   %rax
ffff800000107895:	48 8c d8             	mov    %ds,%rax
ffff800000107898:	50                   	push   %rax
ffff800000107899:	48 31 c0             	xor    %rax,%rax
ffff80000010789c:	55                   	push   %rbp
ffff80000010789d:	57                   	push   %rdi
ffff80000010789e:	56                   	push   %rsi
ffff80000010789f:	52                   	push   %rdx
ffff8000001078a0:	51                   	push   %rcx
ffff8000001078a1:	53                   	push   %rbx
ffff8000001078a2:	41 50                	push   %r8
ffff8000001078a4:	41 51                	push   %r9
ffff8000001078a6:	41 52                	push   %r10
ffff8000001078a8:	41 53                	push   %r11
ffff8000001078aa:	41 54                	push   %r12
ffff8000001078ac:	41 55                	push   %r13
ffff8000001078ae:	41 56                	push   %r14
ffff8000001078b0:	41 57                	push   %r15
ffff8000001078b2:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001078b9:	48 8e da             	mov    %rdx,%ds
ffff8000001078bc:	48 8e c2             	mov    %rdx,%es
ffff8000001078bf:	48 89 e7             	mov    %rsp,%rdi
ffff8000001078c2:	48 8d 05 5c c7 ff ff 	lea    -0x38a4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001078c9:	50                   	push   %rax
ffff8000001078ca:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
ffff8000001078d1:	e9 80 06 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff8000001078d6 <IRQ0x26_interrupt>:
ffff8000001078d6:	6a 00                	pushq  $0x0
ffff8000001078d8:	fc                   	cld    
ffff8000001078d9:	50                   	push   %rax
ffff8000001078da:	50                   	push   %rax
ffff8000001078db:	48 8c c0             	mov    %es,%rax
ffff8000001078de:	50                   	push   %rax
ffff8000001078df:	48 8c d8             	mov    %ds,%rax
ffff8000001078e2:	50                   	push   %rax
ffff8000001078e3:	48 31 c0             	xor    %rax,%rax
ffff8000001078e6:	55                   	push   %rbp
ffff8000001078e7:	57                   	push   %rdi
ffff8000001078e8:	56                   	push   %rsi
ffff8000001078e9:	52                   	push   %rdx
ffff8000001078ea:	51                   	push   %rcx
ffff8000001078eb:	53                   	push   %rbx
ffff8000001078ec:	41 50                	push   %r8
ffff8000001078ee:	41 51                	push   %r9
ffff8000001078f0:	41 52                	push   %r10
ffff8000001078f2:	41 53                	push   %r11
ffff8000001078f4:	41 54                	push   %r12
ffff8000001078f6:	41 55                	push   %r13
ffff8000001078f8:	41 56                	push   %r14
ffff8000001078fa:	41 57                	push   %r15
ffff8000001078fc:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107903:	48 8e da             	mov    %rdx,%ds
ffff800000107906:	48 8e c2             	mov    %rdx,%es
ffff800000107909:	48 89 e7             	mov    %rsp,%rdi
ffff80000010790c:	48 8d 05 12 c7 ff ff 	lea    -0x38ee(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107913:	50                   	push   %rax
ffff800000107914:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
ffff80000010791b:	e9 36 06 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107920 <IRQ0x27_interrupt>:
ffff800000107920:	6a 00                	pushq  $0x0
ffff800000107922:	fc                   	cld    
ffff800000107923:	50                   	push   %rax
ffff800000107924:	50                   	push   %rax
ffff800000107925:	48 8c c0             	mov    %es,%rax
ffff800000107928:	50                   	push   %rax
ffff800000107929:	48 8c d8             	mov    %ds,%rax
ffff80000010792c:	50                   	push   %rax
ffff80000010792d:	48 31 c0             	xor    %rax,%rax
ffff800000107930:	55                   	push   %rbp
ffff800000107931:	57                   	push   %rdi
ffff800000107932:	56                   	push   %rsi
ffff800000107933:	52                   	push   %rdx
ffff800000107934:	51                   	push   %rcx
ffff800000107935:	53                   	push   %rbx
ffff800000107936:	41 50                	push   %r8
ffff800000107938:	41 51                	push   %r9
ffff80000010793a:	41 52                	push   %r10
ffff80000010793c:	41 53                	push   %r11
ffff80000010793e:	41 54                	push   %r12
ffff800000107940:	41 55                	push   %r13
ffff800000107942:	41 56                	push   %r14
ffff800000107944:	41 57                	push   %r15
ffff800000107946:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff80000010794d:	48 8e da             	mov    %rdx,%ds
ffff800000107950:	48 8e c2             	mov    %rdx,%es
ffff800000107953:	48 89 e7             	mov    %rsp,%rdi
ffff800000107956:	48 8d 05 c8 c6 ff ff 	lea    -0x3938(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff80000010795d:	50                   	push   %rax
ffff80000010795e:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
ffff800000107965:	e9 ec 05 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff80000010796a <IRQ0x28_interrupt>:
ffff80000010796a:	6a 00                	pushq  $0x0
ffff80000010796c:	fc                   	cld    
ffff80000010796d:	50                   	push   %rax
ffff80000010796e:	50                   	push   %rax
ffff80000010796f:	48 8c c0             	mov    %es,%rax
ffff800000107972:	50                   	push   %rax
ffff800000107973:	48 8c d8             	mov    %ds,%rax
ffff800000107976:	50                   	push   %rax
ffff800000107977:	48 31 c0             	xor    %rax,%rax
ffff80000010797a:	55                   	push   %rbp
ffff80000010797b:	57                   	push   %rdi
ffff80000010797c:	56                   	push   %rsi
ffff80000010797d:	52                   	push   %rdx
ffff80000010797e:	51                   	push   %rcx
ffff80000010797f:	53                   	push   %rbx
ffff800000107980:	41 50                	push   %r8
ffff800000107982:	41 51                	push   %r9
ffff800000107984:	41 52                	push   %r10
ffff800000107986:	41 53                	push   %r11
ffff800000107988:	41 54                	push   %r12
ffff80000010798a:	41 55                	push   %r13
ffff80000010798c:	41 56                	push   %r14
ffff80000010798e:	41 57                	push   %r15
ffff800000107990:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107997:	48 8e da             	mov    %rdx,%ds
ffff80000010799a:	48 8e c2             	mov    %rdx,%es
ffff80000010799d:	48 89 e7             	mov    %rsp,%rdi
ffff8000001079a0:	48 8d 05 7e c6 ff ff 	lea    -0x3982(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001079a7:	50                   	push   %rax
ffff8000001079a8:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
ffff8000001079af:	e9 a2 05 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff8000001079b4 <IRQ0x29_interrupt>:
ffff8000001079b4:	6a 00                	pushq  $0x0
ffff8000001079b6:	fc                   	cld    
ffff8000001079b7:	50                   	push   %rax
ffff8000001079b8:	50                   	push   %rax
ffff8000001079b9:	48 8c c0             	mov    %es,%rax
ffff8000001079bc:	50                   	push   %rax
ffff8000001079bd:	48 8c d8             	mov    %ds,%rax
ffff8000001079c0:	50                   	push   %rax
ffff8000001079c1:	48 31 c0             	xor    %rax,%rax
ffff8000001079c4:	55                   	push   %rbp
ffff8000001079c5:	57                   	push   %rdi
ffff8000001079c6:	56                   	push   %rsi
ffff8000001079c7:	52                   	push   %rdx
ffff8000001079c8:	51                   	push   %rcx
ffff8000001079c9:	53                   	push   %rbx
ffff8000001079ca:	41 50                	push   %r8
ffff8000001079cc:	41 51                	push   %r9
ffff8000001079ce:	41 52                	push   %r10
ffff8000001079d0:	41 53                	push   %r11
ffff8000001079d2:	41 54                	push   %r12
ffff8000001079d4:	41 55                	push   %r13
ffff8000001079d6:	41 56                	push   %r14
ffff8000001079d8:	41 57                	push   %r15
ffff8000001079da:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff8000001079e1:	48 8e da             	mov    %rdx,%ds
ffff8000001079e4:	48 8e c2             	mov    %rdx,%es
ffff8000001079e7:	48 89 e7             	mov    %rsp,%rdi
ffff8000001079ea:	48 8d 05 34 c6 ff ff 	lea    -0x39cc(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff8000001079f1:	50                   	push   %rax
ffff8000001079f2:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
ffff8000001079f9:	e9 58 05 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff8000001079fe <IRQ0x2a_interrupt>:
ffff8000001079fe:	6a 00                	pushq  $0x0
ffff800000107a00:	fc                   	cld    
ffff800000107a01:	50                   	push   %rax
ffff800000107a02:	50                   	push   %rax
ffff800000107a03:	48 8c c0             	mov    %es,%rax
ffff800000107a06:	50                   	push   %rax
ffff800000107a07:	48 8c d8             	mov    %ds,%rax
ffff800000107a0a:	50                   	push   %rax
ffff800000107a0b:	48 31 c0             	xor    %rax,%rax
ffff800000107a0e:	55                   	push   %rbp
ffff800000107a0f:	57                   	push   %rdi
ffff800000107a10:	56                   	push   %rsi
ffff800000107a11:	52                   	push   %rdx
ffff800000107a12:	51                   	push   %rcx
ffff800000107a13:	53                   	push   %rbx
ffff800000107a14:	41 50                	push   %r8
ffff800000107a16:	41 51                	push   %r9
ffff800000107a18:	41 52                	push   %r10
ffff800000107a1a:	41 53                	push   %r11
ffff800000107a1c:	41 54                	push   %r12
ffff800000107a1e:	41 55                	push   %r13
ffff800000107a20:	41 56                	push   %r14
ffff800000107a22:	41 57                	push   %r15
ffff800000107a24:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107a2b:	48 8e da             	mov    %rdx,%ds
ffff800000107a2e:	48 8e c2             	mov    %rdx,%es
ffff800000107a31:	48 89 e7             	mov    %rsp,%rdi
ffff800000107a34:	48 8d 05 ea c5 ff ff 	lea    -0x3a16(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107a3b:	50                   	push   %rax
ffff800000107a3c:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
ffff800000107a43:	e9 0e 05 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107a48 <IRQ0x2b_interrupt>:
ffff800000107a48:	6a 00                	pushq  $0x0
ffff800000107a4a:	fc                   	cld    
ffff800000107a4b:	50                   	push   %rax
ffff800000107a4c:	50                   	push   %rax
ffff800000107a4d:	48 8c c0             	mov    %es,%rax
ffff800000107a50:	50                   	push   %rax
ffff800000107a51:	48 8c d8             	mov    %ds,%rax
ffff800000107a54:	50                   	push   %rax
ffff800000107a55:	48 31 c0             	xor    %rax,%rax
ffff800000107a58:	55                   	push   %rbp
ffff800000107a59:	57                   	push   %rdi
ffff800000107a5a:	56                   	push   %rsi
ffff800000107a5b:	52                   	push   %rdx
ffff800000107a5c:	51                   	push   %rcx
ffff800000107a5d:	53                   	push   %rbx
ffff800000107a5e:	41 50                	push   %r8
ffff800000107a60:	41 51                	push   %r9
ffff800000107a62:	41 52                	push   %r10
ffff800000107a64:	41 53                	push   %r11
ffff800000107a66:	41 54                	push   %r12
ffff800000107a68:	41 55                	push   %r13
ffff800000107a6a:	41 56                	push   %r14
ffff800000107a6c:	41 57                	push   %r15
ffff800000107a6e:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107a75:	48 8e da             	mov    %rdx,%ds
ffff800000107a78:	48 8e c2             	mov    %rdx,%es
ffff800000107a7b:	48 89 e7             	mov    %rsp,%rdi
ffff800000107a7e:	48 8d 05 a0 c5 ff ff 	lea    -0x3a60(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107a85:	50                   	push   %rax
ffff800000107a86:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
ffff800000107a8d:	e9 c4 04 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107a92 <IRQ0x2c_interrupt>:
ffff800000107a92:	6a 00                	pushq  $0x0
ffff800000107a94:	fc                   	cld    
ffff800000107a95:	50                   	push   %rax
ffff800000107a96:	50                   	push   %rax
ffff800000107a97:	48 8c c0             	mov    %es,%rax
ffff800000107a9a:	50                   	push   %rax
ffff800000107a9b:	48 8c d8             	mov    %ds,%rax
ffff800000107a9e:	50                   	push   %rax
ffff800000107a9f:	48 31 c0             	xor    %rax,%rax
ffff800000107aa2:	55                   	push   %rbp
ffff800000107aa3:	57                   	push   %rdi
ffff800000107aa4:	56                   	push   %rsi
ffff800000107aa5:	52                   	push   %rdx
ffff800000107aa6:	51                   	push   %rcx
ffff800000107aa7:	53                   	push   %rbx
ffff800000107aa8:	41 50                	push   %r8
ffff800000107aaa:	41 51                	push   %r9
ffff800000107aac:	41 52                	push   %r10
ffff800000107aae:	41 53                	push   %r11
ffff800000107ab0:	41 54                	push   %r12
ffff800000107ab2:	41 55                	push   %r13
ffff800000107ab4:	41 56                	push   %r14
ffff800000107ab6:	41 57                	push   %r15
ffff800000107ab8:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107abf:	48 8e da             	mov    %rdx,%ds
ffff800000107ac2:	48 8e c2             	mov    %rdx,%es
ffff800000107ac5:	48 89 e7             	mov    %rsp,%rdi
ffff800000107ac8:	48 8d 05 56 c5 ff ff 	lea    -0x3aaa(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107acf:	50                   	push   %rax
ffff800000107ad0:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
ffff800000107ad7:	e9 7a 04 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107adc <IRQ0x2d_interrupt>:
ffff800000107adc:	6a 00                	pushq  $0x0
ffff800000107ade:	fc                   	cld    
ffff800000107adf:	50                   	push   %rax
ffff800000107ae0:	50                   	push   %rax
ffff800000107ae1:	48 8c c0             	mov    %es,%rax
ffff800000107ae4:	50                   	push   %rax
ffff800000107ae5:	48 8c d8             	mov    %ds,%rax
ffff800000107ae8:	50                   	push   %rax
ffff800000107ae9:	48 31 c0             	xor    %rax,%rax
ffff800000107aec:	55                   	push   %rbp
ffff800000107aed:	57                   	push   %rdi
ffff800000107aee:	56                   	push   %rsi
ffff800000107aef:	52                   	push   %rdx
ffff800000107af0:	51                   	push   %rcx
ffff800000107af1:	53                   	push   %rbx
ffff800000107af2:	41 50                	push   %r8
ffff800000107af4:	41 51                	push   %r9
ffff800000107af6:	41 52                	push   %r10
ffff800000107af8:	41 53                	push   %r11
ffff800000107afa:	41 54                	push   %r12
ffff800000107afc:	41 55                	push   %r13
ffff800000107afe:	41 56                	push   %r14
ffff800000107b00:	41 57                	push   %r15
ffff800000107b02:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107b09:	48 8e da             	mov    %rdx,%ds
ffff800000107b0c:	48 8e c2             	mov    %rdx,%es
ffff800000107b0f:	48 89 e7             	mov    %rsp,%rdi
ffff800000107b12:	48 8d 05 0c c5 ff ff 	lea    -0x3af4(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107b19:	50                   	push   %rax
ffff800000107b1a:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
ffff800000107b21:	e9 30 04 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107b26 <IRQ0x2e_interrupt>:
ffff800000107b26:	6a 00                	pushq  $0x0
ffff800000107b28:	fc                   	cld    
ffff800000107b29:	50                   	push   %rax
ffff800000107b2a:	50                   	push   %rax
ffff800000107b2b:	48 8c c0             	mov    %es,%rax
ffff800000107b2e:	50                   	push   %rax
ffff800000107b2f:	48 8c d8             	mov    %ds,%rax
ffff800000107b32:	50                   	push   %rax
ffff800000107b33:	48 31 c0             	xor    %rax,%rax
ffff800000107b36:	55                   	push   %rbp
ffff800000107b37:	57                   	push   %rdi
ffff800000107b38:	56                   	push   %rsi
ffff800000107b39:	52                   	push   %rdx
ffff800000107b3a:	51                   	push   %rcx
ffff800000107b3b:	53                   	push   %rbx
ffff800000107b3c:	41 50                	push   %r8
ffff800000107b3e:	41 51                	push   %r9
ffff800000107b40:	41 52                	push   %r10
ffff800000107b42:	41 53                	push   %r11
ffff800000107b44:	41 54                	push   %r12
ffff800000107b46:	41 55                	push   %r13
ffff800000107b48:	41 56                	push   %r14
ffff800000107b4a:	41 57                	push   %r15
ffff800000107b4c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107b53:	48 8e da             	mov    %rdx,%ds
ffff800000107b56:	48 8e c2             	mov    %rdx,%es
ffff800000107b59:	48 89 e7             	mov    %rsp,%rdi
ffff800000107b5c:	48 8d 05 c2 c4 ff ff 	lea    -0x3b3e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107b63:	50                   	push   %rax
ffff800000107b64:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
ffff800000107b6b:	e9 e6 03 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107b70 <IRQ0x2f_interrupt>:
ffff800000107b70:	6a 00                	pushq  $0x0
ffff800000107b72:	fc                   	cld    
ffff800000107b73:	50                   	push   %rax
ffff800000107b74:	50                   	push   %rax
ffff800000107b75:	48 8c c0             	mov    %es,%rax
ffff800000107b78:	50                   	push   %rax
ffff800000107b79:	48 8c d8             	mov    %ds,%rax
ffff800000107b7c:	50                   	push   %rax
ffff800000107b7d:	48 31 c0             	xor    %rax,%rax
ffff800000107b80:	55                   	push   %rbp
ffff800000107b81:	57                   	push   %rdi
ffff800000107b82:	56                   	push   %rsi
ffff800000107b83:	52                   	push   %rdx
ffff800000107b84:	51                   	push   %rcx
ffff800000107b85:	53                   	push   %rbx
ffff800000107b86:	41 50                	push   %r8
ffff800000107b88:	41 51                	push   %r9
ffff800000107b8a:	41 52                	push   %r10
ffff800000107b8c:	41 53                	push   %r11
ffff800000107b8e:	41 54                	push   %r12
ffff800000107b90:	41 55                	push   %r13
ffff800000107b92:	41 56                	push   %r14
ffff800000107b94:	41 57                	push   %r15
ffff800000107b96:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107b9d:	48 8e da             	mov    %rdx,%ds
ffff800000107ba0:	48 8e c2             	mov    %rdx,%es
ffff800000107ba3:	48 89 e7             	mov    %rsp,%rdi
ffff800000107ba6:	48 8d 05 78 c4 ff ff 	lea    -0x3b88(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107bad:	50                   	push   %rax
ffff800000107bae:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
ffff800000107bb5:	e9 9c 03 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107bba <IRQ0x30_interrupt>:
ffff800000107bba:	6a 00                	pushq  $0x0
ffff800000107bbc:	fc                   	cld    
ffff800000107bbd:	50                   	push   %rax
ffff800000107bbe:	50                   	push   %rax
ffff800000107bbf:	48 8c c0             	mov    %es,%rax
ffff800000107bc2:	50                   	push   %rax
ffff800000107bc3:	48 8c d8             	mov    %ds,%rax
ffff800000107bc6:	50                   	push   %rax
ffff800000107bc7:	48 31 c0             	xor    %rax,%rax
ffff800000107bca:	55                   	push   %rbp
ffff800000107bcb:	57                   	push   %rdi
ffff800000107bcc:	56                   	push   %rsi
ffff800000107bcd:	52                   	push   %rdx
ffff800000107bce:	51                   	push   %rcx
ffff800000107bcf:	53                   	push   %rbx
ffff800000107bd0:	41 50                	push   %r8
ffff800000107bd2:	41 51                	push   %r9
ffff800000107bd4:	41 52                	push   %r10
ffff800000107bd6:	41 53                	push   %r11
ffff800000107bd8:	41 54                	push   %r12
ffff800000107bda:	41 55                	push   %r13
ffff800000107bdc:	41 56                	push   %r14
ffff800000107bde:	41 57                	push   %r15
ffff800000107be0:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107be7:	48 8e da             	mov    %rdx,%ds
ffff800000107bea:	48 8e c2             	mov    %rdx,%es
ffff800000107bed:	48 89 e7             	mov    %rsp,%rdi
ffff800000107bf0:	48 8d 05 2e c4 ff ff 	lea    -0x3bd2(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107bf7:	50                   	push   %rax
ffff800000107bf8:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
ffff800000107bff:	e9 52 03 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107c04 <IRQ0x31_interrupt>:
ffff800000107c04:	6a 00                	pushq  $0x0
ffff800000107c06:	fc                   	cld    
ffff800000107c07:	50                   	push   %rax
ffff800000107c08:	50                   	push   %rax
ffff800000107c09:	48 8c c0             	mov    %es,%rax
ffff800000107c0c:	50                   	push   %rax
ffff800000107c0d:	48 8c d8             	mov    %ds,%rax
ffff800000107c10:	50                   	push   %rax
ffff800000107c11:	48 31 c0             	xor    %rax,%rax
ffff800000107c14:	55                   	push   %rbp
ffff800000107c15:	57                   	push   %rdi
ffff800000107c16:	56                   	push   %rsi
ffff800000107c17:	52                   	push   %rdx
ffff800000107c18:	51                   	push   %rcx
ffff800000107c19:	53                   	push   %rbx
ffff800000107c1a:	41 50                	push   %r8
ffff800000107c1c:	41 51                	push   %r9
ffff800000107c1e:	41 52                	push   %r10
ffff800000107c20:	41 53                	push   %r11
ffff800000107c22:	41 54                	push   %r12
ffff800000107c24:	41 55                	push   %r13
ffff800000107c26:	41 56                	push   %r14
ffff800000107c28:	41 57                	push   %r15
ffff800000107c2a:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107c31:	48 8e da             	mov    %rdx,%ds
ffff800000107c34:	48 8e c2             	mov    %rdx,%es
ffff800000107c37:	48 89 e7             	mov    %rsp,%rdi
ffff800000107c3a:	48 8d 05 e4 c3 ff ff 	lea    -0x3c1c(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107c41:	50                   	push   %rax
ffff800000107c42:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
ffff800000107c49:	e9 08 03 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107c4e <IRQ0x32_interrupt>:
ffff800000107c4e:	6a 00                	pushq  $0x0
ffff800000107c50:	fc                   	cld    
ffff800000107c51:	50                   	push   %rax
ffff800000107c52:	50                   	push   %rax
ffff800000107c53:	48 8c c0             	mov    %es,%rax
ffff800000107c56:	50                   	push   %rax
ffff800000107c57:	48 8c d8             	mov    %ds,%rax
ffff800000107c5a:	50                   	push   %rax
ffff800000107c5b:	48 31 c0             	xor    %rax,%rax
ffff800000107c5e:	55                   	push   %rbp
ffff800000107c5f:	57                   	push   %rdi
ffff800000107c60:	56                   	push   %rsi
ffff800000107c61:	52                   	push   %rdx
ffff800000107c62:	51                   	push   %rcx
ffff800000107c63:	53                   	push   %rbx
ffff800000107c64:	41 50                	push   %r8
ffff800000107c66:	41 51                	push   %r9
ffff800000107c68:	41 52                	push   %r10
ffff800000107c6a:	41 53                	push   %r11
ffff800000107c6c:	41 54                	push   %r12
ffff800000107c6e:	41 55                	push   %r13
ffff800000107c70:	41 56                	push   %r14
ffff800000107c72:	41 57                	push   %r15
ffff800000107c74:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107c7b:	48 8e da             	mov    %rdx,%ds
ffff800000107c7e:	48 8e c2             	mov    %rdx,%es
ffff800000107c81:	48 89 e7             	mov    %rsp,%rdi
ffff800000107c84:	48 8d 05 9a c3 ff ff 	lea    -0x3c66(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107c8b:	50                   	push   %rax
ffff800000107c8c:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
ffff800000107c93:	e9 be 02 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107c98 <IRQ0x33_interrupt>:
ffff800000107c98:	6a 00                	pushq  $0x0
ffff800000107c9a:	fc                   	cld    
ffff800000107c9b:	50                   	push   %rax
ffff800000107c9c:	50                   	push   %rax
ffff800000107c9d:	48 8c c0             	mov    %es,%rax
ffff800000107ca0:	50                   	push   %rax
ffff800000107ca1:	48 8c d8             	mov    %ds,%rax
ffff800000107ca4:	50                   	push   %rax
ffff800000107ca5:	48 31 c0             	xor    %rax,%rax
ffff800000107ca8:	55                   	push   %rbp
ffff800000107ca9:	57                   	push   %rdi
ffff800000107caa:	56                   	push   %rsi
ffff800000107cab:	52                   	push   %rdx
ffff800000107cac:	51                   	push   %rcx
ffff800000107cad:	53                   	push   %rbx
ffff800000107cae:	41 50                	push   %r8
ffff800000107cb0:	41 51                	push   %r9
ffff800000107cb2:	41 52                	push   %r10
ffff800000107cb4:	41 53                	push   %r11
ffff800000107cb6:	41 54                	push   %r12
ffff800000107cb8:	41 55                	push   %r13
ffff800000107cba:	41 56                	push   %r14
ffff800000107cbc:	41 57                	push   %r15
ffff800000107cbe:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107cc5:	48 8e da             	mov    %rdx,%ds
ffff800000107cc8:	48 8e c2             	mov    %rdx,%es
ffff800000107ccb:	48 89 e7             	mov    %rsp,%rdi
ffff800000107cce:	48 8d 05 50 c3 ff ff 	lea    -0x3cb0(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107cd5:	50                   	push   %rax
ffff800000107cd6:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
ffff800000107cdd:	e9 74 02 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107ce2 <IRQ0x34_interrupt>:
ffff800000107ce2:	6a 00                	pushq  $0x0
ffff800000107ce4:	fc                   	cld    
ffff800000107ce5:	50                   	push   %rax
ffff800000107ce6:	50                   	push   %rax
ffff800000107ce7:	48 8c c0             	mov    %es,%rax
ffff800000107cea:	50                   	push   %rax
ffff800000107ceb:	48 8c d8             	mov    %ds,%rax
ffff800000107cee:	50                   	push   %rax
ffff800000107cef:	48 31 c0             	xor    %rax,%rax
ffff800000107cf2:	55                   	push   %rbp
ffff800000107cf3:	57                   	push   %rdi
ffff800000107cf4:	56                   	push   %rsi
ffff800000107cf5:	52                   	push   %rdx
ffff800000107cf6:	51                   	push   %rcx
ffff800000107cf7:	53                   	push   %rbx
ffff800000107cf8:	41 50                	push   %r8
ffff800000107cfa:	41 51                	push   %r9
ffff800000107cfc:	41 52                	push   %r10
ffff800000107cfe:	41 53                	push   %r11
ffff800000107d00:	41 54                	push   %r12
ffff800000107d02:	41 55                	push   %r13
ffff800000107d04:	41 56                	push   %r14
ffff800000107d06:	41 57                	push   %r15
ffff800000107d08:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107d0f:	48 8e da             	mov    %rdx,%ds
ffff800000107d12:	48 8e c2             	mov    %rdx,%es
ffff800000107d15:	48 89 e7             	mov    %rsp,%rdi
ffff800000107d18:	48 8d 05 06 c3 ff ff 	lea    -0x3cfa(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107d1f:	50                   	push   %rax
ffff800000107d20:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
ffff800000107d27:	e9 2a 02 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107d2c <IRQ0x35_interrupt>:
ffff800000107d2c:	6a 00                	pushq  $0x0
ffff800000107d2e:	fc                   	cld    
ffff800000107d2f:	50                   	push   %rax
ffff800000107d30:	50                   	push   %rax
ffff800000107d31:	48 8c c0             	mov    %es,%rax
ffff800000107d34:	50                   	push   %rax
ffff800000107d35:	48 8c d8             	mov    %ds,%rax
ffff800000107d38:	50                   	push   %rax
ffff800000107d39:	48 31 c0             	xor    %rax,%rax
ffff800000107d3c:	55                   	push   %rbp
ffff800000107d3d:	57                   	push   %rdi
ffff800000107d3e:	56                   	push   %rsi
ffff800000107d3f:	52                   	push   %rdx
ffff800000107d40:	51                   	push   %rcx
ffff800000107d41:	53                   	push   %rbx
ffff800000107d42:	41 50                	push   %r8
ffff800000107d44:	41 51                	push   %r9
ffff800000107d46:	41 52                	push   %r10
ffff800000107d48:	41 53                	push   %r11
ffff800000107d4a:	41 54                	push   %r12
ffff800000107d4c:	41 55                	push   %r13
ffff800000107d4e:	41 56                	push   %r14
ffff800000107d50:	41 57                	push   %r15
ffff800000107d52:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107d59:	48 8e da             	mov    %rdx,%ds
ffff800000107d5c:	48 8e c2             	mov    %rdx,%es
ffff800000107d5f:	48 89 e7             	mov    %rsp,%rdi
ffff800000107d62:	48 8d 05 bc c2 ff ff 	lea    -0x3d44(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107d69:	50                   	push   %rax
ffff800000107d6a:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
ffff800000107d71:	e9 e0 01 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107d76 <IRQ0x36_interrupt>:
ffff800000107d76:	6a 00                	pushq  $0x0
ffff800000107d78:	fc                   	cld    
ffff800000107d79:	50                   	push   %rax
ffff800000107d7a:	50                   	push   %rax
ffff800000107d7b:	48 8c c0             	mov    %es,%rax
ffff800000107d7e:	50                   	push   %rax
ffff800000107d7f:	48 8c d8             	mov    %ds,%rax
ffff800000107d82:	50                   	push   %rax
ffff800000107d83:	48 31 c0             	xor    %rax,%rax
ffff800000107d86:	55                   	push   %rbp
ffff800000107d87:	57                   	push   %rdi
ffff800000107d88:	56                   	push   %rsi
ffff800000107d89:	52                   	push   %rdx
ffff800000107d8a:	51                   	push   %rcx
ffff800000107d8b:	53                   	push   %rbx
ffff800000107d8c:	41 50                	push   %r8
ffff800000107d8e:	41 51                	push   %r9
ffff800000107d90:	41 52                	push   %r10
ffff800000107d92:	41 53                	push   %r11
ffff800000107d94:	41 54                	push   %r12
ffff800000107d96:	41 55                	push   %r13
ffff800000107d98:	41 56                	push   %r14
ffff800000107d9a:	41 57                	push   %r15
ffff800000107d9c:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107da3:	48 8e da             	mov    %rdx,%ds
ffff800000107da6:	48 8e c2             	mov    %rdx,%es
ffff800000107da9:	48 89 e7             	mov    %rsp,%rdi
ffff800000107dac:	48 8d 05 72 c2 ff ff 	lea    -0x3d8e(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107db3:	50                   	push   %rax
ffff800000107db4:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
ffff800000107dbb:	e9 96 01 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107dc0 <IRQ0x37_interrupt>:
ffff800000107dc0:	6a 00                	pushq  $0x0
ffff800000107dc2:	fc                   	cld    
ffff800000107dc3:	50                   	push   %rax
ffff800000107dc4:	50                   	push   %rax
ffff800000107dc5:	48 8c c0             	mov    %es,%rax
ffff800000107dc8:	50                   	push   %rax
ffff800000107dc9:	48 8c d8             	mov    %ds,%rax
ffff800000107dcc:	50                   	push   %rax
ffff800000107dcd:	48 31 c0             	xor    %rax,%rax
ffff800000107dd0:	55                   	push   %rbp
ffff800000107dd1:	57                   	push   %rdi
ffff800000107dd2:	56                   	push   %rsi
ffff800000107dd3:	52                   	push   %rdx
ffff800000107dd4:	51                   	push   %rcx
ffff800000107dd5:	53                   	push   %rbx
ffff800000107dd6:	41 50                	push   %r8
ffff800000107dd8:	41 51                	push   %r9
ffff800000107dda:	41 52                	push   %r10
ffff800000107ddc:	41 53                	push   %r11
ffff800000107dde:	41 54                	push   %r12
ffff800000107de0:	41 55                	push   %r13
ffff800000107de2:	41 56                	push   %r14
ffff800000107de4:	41 57                	push   %r15
ffff800000107de6:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
ffff800000107ded:	48 8e da             	mov    %rdx,%ds
ffff800000107df0:	48 8e c2             	mov    %rdx,%es
ffff800000107df3:	48 89 e7             	mov    %rsp,%rdi
ffff800000107df6:	48 8d 05 28 c2 ff ff 	lea    -0x3dd8(%rip),%rax        # ffff800000104025 <ret_from_intr>
ffff800000107dfd:	50                   	push   %rax
ffff800000107dfe:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
ffff800000107e05:	e9 4c 01 00 00       	jmpq   ffff800000107f56 <do_IRQ>

ffff800000107e0a <init_interrupt>:
ffff800000107e0a:	55                   	push   %rbp
ffff800000107e0b:	48 89 e5             	mov    %rsp,%rbp
ffff800000107e0e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000107e12:	c7 45 fc 20 00 00 00 	movl   $0x20,-0x4(%rbp)
ffff800000107e19:	eb 30                	jmp    ffff800000107e4b <init_interrupt+0x41>
ffff800000107e1b:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107e1e:	83 e8 20             	sub    $0x20,%eax
ffff800000107e21:	48 ba a0 f6 10 00 00 	movabs $0xffff80000010f6a0,%rdx
ffff800000107e28:	80 ff ff 
ffff800000107e2b:	48 98                	cltq   
ffff800000107e2d:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff800000107e31:	8b 45 fc             	mov    -0x4(%rbp),%eax
ffff800000107e34:	be 02 00 00 00       	mov    $0x2,%esi
ffff800000107e39:	89 c7                	mov    %eax,%edi
ffff800000107e3b:	48 b8 c2 75 10 00 00 	movabs $0xffff8000001075c2,%rax
ffff800000107e42:	80 ff ff 
ffff800000107e45:	ff d0                	callq  *%rax
ffff800000107e47:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
ffff800000107e4b:	83 7d fc 37          	cmpl   $0x37,-0x4(%rbp)
ffff800000107e4f:	7e ca                	jle    ffff800000107e1b <init_interrupt+0x11>
ffff800000107e51:	48 ba c0 1b 11 00 00 	movabs $0xffff800000111bc0,%rdx
ffff800000107e58:	80 ff ff 
ffff800000107e5b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107e60:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107e65:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107e6a:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff800000107e71:	80 ff ff 
ffff800000107e74:	ff d1                	callq  *%rcx
ffff800000107e76:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000107e7b:	bf 20 00 00 00       	mov    $0x20,%edi
ffff800000107e80:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107e87:	80 ff ff 
ffff800000107e8a:	ff d0                	callq  *%rax
ffff800000107e8c:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000107e91:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000107e96:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107e9d:	80 ff ff 
ffff800000107ea0:	ff d0                	callq  *%rax
ffff800000107ea2:	be 04 00 00 00       	mov    $0x4,%esi
ffff800000107ea7:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000107eac:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107eb3:	80 ff ff 
ffff800000107eb6:	ff d0                	callq  *%rax
ffff800000107eb8:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107ebd:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000107ec2:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107ec9:	80 ff ff 
ffff800000107ecc:	ff d0                	callq  *%rax
ffff800000107ece:	be 11 00 00 00       	mov    $0x11,%esi
ffff800000107ed3:	bf a0 00 00 00       	mov    $0xa0,%edi
ffff800000107ed8:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107edf:	80 ff ff 
ffff800000107ee2:	ff d0                	callq  *%rax
ffff800000107ee4:	be 28 00 00 00       	mov    $0x28,%esi
ffff800000107ee9:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000107eee:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107ef5:	80 ff ff 
ffff800000107ef8:	ff d0                	callq  *%rax
ffff800000107efa:	be 02 00 00 00       	mov    $0x2,%esi
ffff800000107eff:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000107f04:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107f0b:	80 ff ff 
ffff800000107f0e:	ff d0                	callq  *%rax
ffff800000107f10:	be 01 00 00 00       	mov    $0x1,%esi
ffff800000107f15:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000107f1a:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107f21:	80 ff ff 
ffff800000107f24:	ff d0                	callq  *%rax
ffff800000107f26:	be fd 00 00 00       	mov    $0xfd,%esi
ffff800000107f2b:	bf 21 00 00 00       	mov    $0x21,%edi
ffff800000107f30:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107f37:	80 ff ff 
ffff800000107f3a:	ff d0                	callq  *%rax
ffff800000107f3c:	be ff 00 00 00       	mov    $0xff,%esi
ffff800000107f41:	bf a1 00 00 00       	mov    $0xa1,%edi
ffff800000107f46:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107f4d:	80 ff ff 
ffff800000107f50:	ff d0                	callq  *%rax
ffff800000107f52:	fb                   	sti    
ffff800000107f53:	90                   	nop
ffff800000107f54:	c9                   	leaveq 
ffff800000107f55:	c3                   	retq   

ffff800000107f56 <do_IRQ>:
ffff800000107f56:	55                   	push   %rbp
ffff800000107f57:	48 89 e5             	mov    %rsp,%rbp
ffff800000107f5a:	48 83 ec 20          	sub    $0x20,%rsp
ffff800000107f5e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000107f62:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000107f66:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000107f6a:	48 89 c1             	mov    %rax,%rcx
ffff800000107f6d:	48 ba cd 1b 11 00 00 	movabs $0xffff800000111bcd,%rdx
ffff800000107f74:	80 ff ff 
ffff800000107f77:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107f7c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107f81:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107f86:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107f8d:	80 ff ff 
ffff800000107f90:	41 ff d0             	callq  *%r8
ffff800000107f93:	bf 60 00 00 00       	mov    $0x60,%edi
ffff800000107f98:	48 b8 81 75 10 00 00 	movabs $0xffff800000107581,%rax
ffff800000107f9f:	80 ff ff 
ffff800000107fa2:	ff d0                	callq  *%rax
ffff800000107fa4:	88 45 ff             	mov    %al,-0x1(%rbp)
ffff800000107fa7:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
ffff800000107fab:	89 c1                	mov    %eax,%ecx
ffff800000107fad:	48 ba dd 1b 11 00 00 	movabs $0xffff800000111bdd,%rdx
ffff800000107fb4:	80 ff ff 
ffff800000107fb7:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000107fbc:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000107fc1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000107fc6:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000107fcd:	80 ff ff 
ffff800000107fd0:	41 ff d0             	callq  *%r8
ffff800000107fd3:	be 20 00 00 00       	mov    $0x20,%esi
ffff800000107fd8:	bf 20 00 00 00       	mov    $0x20,%edi
ffff800000107fdd:	48 b8 a2 75 10 00 00 	movabs $0xffff8000001075a2,%rax
ffff800000107fe4:	80 ff ff 
ffff800000107fe7:	ff d0                	callq  *%rax
ffff800000107fe9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107fed:	48 8b 88 b0 00 00 00 	mov    0xb0(%rax),%rcx
ffff800000107ff4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000107ff8:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000107fff:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108003:	49 89 c9             	mov    %rcx,%r9
ffff800000108006:	49 89 d0             	mov    %rdx,%r8
ffff800000108009:	48 89 c1             	mov    %rax,%rcx
ffff80000010800c:	48 ba f0 1b 11 00 00 	movabs $0xffff800000111bf0,%rdx
ffff800000108013:	80 ff ff 
ffff800000108016:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010801b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108020:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108025:	49 ba 29 53 10 00 00 	movabs $0xffff800000105329,%r10
ffff80000010802c:	80 ff ff 
ffff80000010802f:	41 ff d2             	callq  *%r10
ffff800000108032:	90                   	nop
ffff800000108033:	c9                   	leaveq 
ffff800000108034:	c3                   	retq   

ffff800000108035 <list_init>:
ffff800000108035:	55                   	push   %rbp
ffff800000108036:	48 89 e5             	mov    %rsp,%rbp
ffff800000108039:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010803d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108041:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108045:	48 89 10             	mov    %rdx,(%rax)
ffff800000108048:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010804c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff800000108050:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108054:	90                   	nop
ffff800000108055:	5d                   	pop    %rbp
ffff800000108056:	c3                   	retq   

ffff800000108057 <list_add_to_before>:
ffff800000108057:	55                   	push   %rbp
ffff800000108058:	48 89 e5             	mov    %rsp,%rbp
ffff80000010805b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010805f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108063:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108067:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
ffff80000010806b:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010806f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108073:	48 8b 00             	mov    (%rax),%rax
ffff800000108076:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff80000010807a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010807e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108082:	48 8b 10             	mov    (%rax),%rdx
ffff800000108085:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108089:	48 89 10             	mov    %rdx,(%rax)
ffff80000010808c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108090:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
ffff800000108094:	48 89 10             	mov    %rdx,(%rax)
ffff800000108097:	90                   	nop
ffff800000108098:	5d                   	pop    %rbp
ffff800000108099:	c3                   	retq   

ffff80000010809a <list_next>:
ffff80000010809a:	55                   	push   %rbp
ffff80000010809b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010809e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001080a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001080a6:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001080aa:	48 85 c0             	test   %rax,%rax
ffff8000001080ad:	74 0a                	je     ffff8000001080b9 <list_next+0x1f>
ffff8000001080af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001080b3:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001080b7:	eb 05                	jmp    ffff8000001080be <list_next+0x24>
ffff8000001080b9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001080be:	5d                   	pop    %rbp
ffff8000001080bf:	c3                   	retq   

ffff8000001080c0 <memcpy>:
ffff8000001080c0:	55                   	push   %rbp
ffff8000001080c1:	48 89 e5             	mov    %rsp,%rbp
ffff8000001080c4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001080c8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff8000001080cc:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff8000001080d0:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001080d4:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff8000001080d8:	48 85 c0             	test   %rax,%rax
ffff8000001080db:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff8000001080df:	48 c1 f8 03          	sar    $0x3,%rax
ffff8000001080e3:	48 89 c1             	mov    %rax,%rcx
ffff8000001080e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001080ea:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001080ee:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
ffff8000001080f2:	48 89 d7             	mov    %rdx,%rdi
ffff8000001080f5:	fc                   	cld    
ffff8000001080f6:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
ffff8000001080f9:	a8 04                	test   $0x4,%al
ffff8000001080fb:	74 01                	je     ffff8000001080fe <memcpy+0x3e>
ffff8000001080fd:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff8000001080fe:	a8 02                	test   $0x2,%al
ffff800000108100:	74 02                	je     ffff800000108104 <memcpy+0x44>
ffff800000108102:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
ffff800000108104:	a8 01                	test   $0x1,%al
ffff800000108106:	74 01                	je     ffff800000108109 <memcpy+0x49>
ffff800000108108:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
ffff800000108109:	89 f2                	mov    %esi,%edx
ffff80000010810b:	89 4d fc             	mov    %ecx,-0x4(%rbp)
ffff80000010810e:	89 7d f8             	mov    %edi,-0x8(%rbp)
ffff800000108111:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108114:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108118:	5d                   	pop    %rbp
ffff800000108119:	c3                   	retq   

ffff80000010811a <memset>:
ffff80000010811a:	55                   	push   %rbp
ffff80000010811b:	48 89 e5             	mov    %rsp,%rbp
ffff80000010811e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff800000108122:	89 f0                	mov    %esi,%eax
ffff800000108124:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
ffff800000108128:	88 45 e4             	mov    %al,-0x1c(%rbp)
ffff80000010812b:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
ffff80000010812f:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
ffff800000108136:	01 01 01 
ffff800000108139:	48 0f af c2          	imul   %rdx,%rax
ffff80000010813d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108141:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108145:	48 8d 50 07          	lea    0x7(%rax),%rdx
ffff800000108149:	48 85 c0             	test   %rax,%rax
ffff80000010814c:	48 0f 48 c2          	cmovs  %rdx,%rax
ffff800000108150:	48 c1 f8 03          	sar    $0x3,%rax
ffff800000108154:	48 89 c1             	mov    %rax,%rcx
ffff800000108157:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010815b:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
ffff80000010815f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000108163:	48 89 d7             	mov    %rdx,%rdi
ffff800000108166:	fc                   	cld    
ffff800000108167:	f3 48 ab             	rep stos %rax,%es:(%rdi)
ffff80000010816a:	40 f6 c6 04          	test   $0x4,%sil
ffff80000010816e:	74 01                	je     ffff800000108171 <memset+0x57>
ffff800000108170:	ab                   	stos   %eax,%es:(%rdi)
ffff800000108171:	40 f6 c6 02          	test   $0x2,%sil
ffff800000108175:	74 02                	je     ffff800000108179 <memset+0x5f>
ffff800000108177:	66 ab                	stos   %ax,%es:(%rdi)
ffff800000108179:	40 f6 c6 01          	test   $0x1,%sil
ffff80000010817d:	74 01                	je     ffff800000108180 <memset+0x66>
ffff80000010817f:	aa                   	stos   %al,%es:(%rdi)
ffff800000108180:	89 f8                	mov    %edi,%eax
ffff800000108182:	89 ca                	mov    %ecx,%edx
ffff800000108184:	89 55 f4             	mov    %edx,-0xc(%rbp)
ffff800000108187:	89 45 f0             	mov    %eax,-0x10(%rbp)
ffff80000010818a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010818e:	5d                   	pop    %rbp
ffff80000010818f:	c3                   	retq   

ffff800000108190 <wrmsr>:
ffff800000108190:	55                   	push   %rbp
ffff800000108191:	48 89 e5             	mov    %rsp,%rbp
ffff800000108194:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108198:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff80000010819c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001081a0:	48 c1 e8 20          	shr    $0x20,%rax
ffff8000001081a4:	48 89 c2             	mov    %rax,%rdx
ffff8000001081a7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff8000001081ab:	89 c0                	mov    %eax,%eax
ffff8000001081ad:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
ffff8000001081b1:	0f 30                	wrmsr  
ffff8000001081b3:	90                   	nop
ffff8000001081b4:	5d                   	pop    %rbp
ffff8000001081b5:	c3                   	retq   

ffff8000001081b6 <get_current>:
ffff8000001081b6:	55                   	push   %rbp
ffff8000001081b7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001081ba:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff8000001081c1:	00 
ffff8000001081c2:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
ffff8000001081c9:	48 21 e0             	and    %rsp,%rax
ffff8000001081cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff8000001081d0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001081d4:	5d                   	pop    %rbp
ffff8000001081d5:	c3                   	retq   
ffff8000001081d6:	55                   	push   %rbp
ffff8000001081d7:	48 89 e5             	mov    %rsp,%rbp
ffff8000001081da:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001081de:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001081e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001081e6:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff8000001081ed:	48 89 c1             	mov    %rax,%rcx
ffff8000001081f0:	48 ba 18 1c 11 00 00 	movabs $0xffff800000111c18,%rdx
ffff8000001081f7:	80 ff ff 
ffff8000001081fa:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001081ff:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108204:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108209:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108210:	80 ff ff 
ffff800000108213:	41 ff d0             	callq  *%r8
ffff800000108216:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffff80000010821d:	c9                   	leaveq 
ffff80000010821e:	c3                   	retq   
ffff80000010821f:	55                   	push   %rbp
ffff800000108220:	48 89 e5             	mov    %rsp,%rbp
ffff800000108223:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108227:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff80000010822b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010822f:	48 8b 40 60          	mov    0x60(%rax),%rax
ffff800000108233:	48 89 c2             	mov    %rax,%rdx
ffff800000108236:	be ff ff ff 00       	mov    $0xffffff,%esi
ffff80000010823b:	bf 00 00 00 00       	mov    $0x0,%edi
ffff800000108240:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108245:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff80000010824c:	80 ff ff 
ffff80000010824f:	ff d1                	callq  *%rcx
ffff800000108251:	b8 01 00 00 00       	mov    $0x1,%eax
ffff800000108256:	c9                   	leaveq 
ffff800000108257:	c3                   	retq   
ffff800000108258:	55                   	push   %rbp
ffff800000108259:	48 89 e5             	mov    %rsp,%rbp
ffff80000010825c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108260:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
ffff800000108264:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
ffff800000108268:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
ffff80000010826c:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
ffff800000108270:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
ffff800000108274:	48 ba 70 9e 10 00 00 	movabs $0xffff800000109e70,%rdx
ffff80000010827b:	80 ff ff 
ffff80000010827e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108282:	48 89 02             	mov    %rax,(%rdx)
ffff800000108285:	48 ba 78 9e 10 00 00 	movabs $0xffff800000109e78,%rdx
ffff80000010828c:	80 ff ff 
ffff80000010828f:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
ffff800000108293:	48 89 02             	mov    %rax,(%rdx)
ffff800000108296:	48 ba 80 9e 10 00 00 	movabs $0xffff800000109e80,%rdx
ffff80000010829d:	80 ff ff 
ffff8000001082a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001082a4:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082a7:	48 ba 90 9e 10 00 00 	movabs $0xffff800000109e90,%rdx
ffff8000001082ae:	80 ff ff 
ffff8000001082b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001082b5:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082b8:	48 ba 98 9e 10 00 00 	movabs $0xffff800000109e98,%rdx
ffff8000001082bf:	80 ff ff 
ffff8000001082c2:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001082c6:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082c9:	48 ba a0 9e 10 00 00 	movabs $0xffff800000109ea0,%rdx
ffff8000001082d0:	80 ff ff 
ffff8000001082d3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff8000001082d7:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082da:	48 ba a8 9e 10 00 00 	movabs $0xffff800000109ea8,%rdx
ffff8000001082e1:	80 ff ff 
ffff8000001082e4:	48 8b 45 10          	mov    0x10(%rbp),%rax
ffff8000001082e8:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082eb:	48 ba b0 9e 10 00 00 	movabs $0xffff800000109eb0,%rdx
ffff8000001082f2:	80 ff ff 
ffff8000001082f5:	48 8b 45 18          	mov    0x18(%rbp),%rax
ffff8000001082f9:	48 89 02             	mov    %rax,(%rdx)
ffff8000001082fc:	48 ba b8 9e 10 00 00 	movabs $0xffff800000109eb8,%rdx
ffff800000108303:	80 ff ff 
ffff800000108306:	48 8b 45 20          	mov    0x20(%rbp),%rax
ffff80000010830a:	48 89 02             	mov    %rax,(%rdx)
ffff80000010830d:	48 ba c0 9e 10 00 00 	movabs $0xffff800000109ec0,%rdx
ffff800000108314:	80 ff ff 
ffff800000108317:	48 8b 45 28          	mov    0x28(%rbp),%rax
ffff80000010831b:	48 89 02             	mov    %rax,(%rdx)
ffff80000010831e:	90                   	nop
ffff80000010831f:	5d                   	pop    %rbp
ffff800000108320:	c3                   	retq   

ffff800000108321 <user_level_function>:
ffff800000108321:	55                   	push   %rbp
ffff800000108322:	48 89 e5             	mov    %rsp,%rbp
ffff800000108325:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
ffff80000010832c:	00 
ffff80000010832d:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
ffff800000108334:	20 57 6f 
ffff800000108337:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
ffff80000010833b:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
ffff800000108342:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
ffff800000108348:	b8 01 00 00 00       	mov    $0x1,%eax
ffff80000010834d:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
ffff800000108351:	48 89 d7             	mov    %rdx,%rdi
ffff800000108354:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # ffff800000108360 <sysexit_return_address>
ffff80000010835b:	48 89 e1             	mov    %rsp,%rcx
ffff80000010835e:	0f 34                	sysenter 

ffff800000108360 <sysexit_return_address>:
ffff800000108360:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
ffff800000108364:	eb fe                	jmp    ffff800000108364 <sysexit_return_address+0x4>

ffff800000108366 <do_execve>:
ffff800000108366:	55                   	push   %rbp
ffff800000108367:	48 89 e5             	mov    %rsp,%rbp
ffff80000010836a:	48 83 ec 10          	sub    $0x10,%rsp
ffff80000010836e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff800000108372:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108376:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
ffff80000010837d:	00 
ffff80000010837e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108382:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
ffff800000108389:	00 
ffff80000010838a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010838e:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
ffff800000108395:	01 00 00 00 
ffff800000108399:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff80000010839d:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
ffff8000001083a4:	00 
ffff8000001083a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001083a9:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
ffff8000001083b0:	00 
ffff8000001083b1:	48 ba 3c 1c 11 00 00 	movabs $0xffff800000111c3c,%rdx
ffff8000001083b8:	80 ff ff 
ffff8000001083bb:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001083c0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001083c5:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001083ca:	48 b9 29 53 10 00 00 	movabs $0xffff800000105329,%rcx
ffff8000001083d1:	80 ff ff 
ffff8000001083d4:	ff d1                	callq  *%rcx
ffff8000001083d6:	ba 00 04 00 00       	mov    $0x400,%edx
ffff8000001083db:	be 00 00 80 00       	mov    $0x800000,%esi
ffff8000001083e0:	48 bf 21 83 10 00 00 	movabs $0xffff800000108321,%rdi
ffff8000001083e7:	80 ff ff 
ffff8000001083ea:	48 b8 c0 80 10 00 00 	movabs $0xffff8000001080c0,%rax
ffff8000001083f1:	80 ff ff 
ffff8000001083f4:	ff d0                	callq  *%rax
ffff8000001083f6:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001083fb:	c9                   	leaveq 
ffff8000001083fc:	c3                   	retq   

ffff8000001083fd <init>:
ffff8000001083fd:	55                   	push   %rbp
ffff8000001083fe:	48 89 e5             	mov    %rsp,%rbp
ffff800000108401:	53                   	push   %rbx
ffff800000108402:	48 83 ec 28          	sub    $0x28,%rsp
ffff800000108406:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
ffff80000010840a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff80000010840e:	48 89 c1             	mov    %rax,%rcx
ffff800000108411:	48 ba 58 1c 11 00 00 	movabs $0xffff800000111c58,%rdx
ffff800000108418:	80 ff ff 
ffff80000010841b:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108420:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff800000108425:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010842a:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108431:	80 ff ff 
ffff800000108434:	41 ff d0             	callq  *%r8
ffff800000108437:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010843c:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108443:	80 ff ff 
ffff800000108446:	ff d2                	callq  *%rdx
ffff800000108448:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010844c:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff800000108453:	80 ff ff 
ffff800000108456:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010845a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010845f:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108466:	80 ff ff 
ffff800000108469:	ff d2                	callq  *%rdx
ffff80000010846b:	48 89 c3             	mov    %rax,%rbx
ffff80000010846e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108473:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff80000010847a:	80 ff ff 
ffff80000010847d:	ff d2                	callq  *%rdx
ffff80000010847f:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108483:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
ffff80000010848a:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff80000010848e:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108493:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff80000010849a:	80 ff ff 
ffff80000010849d:	ff d2                	callq  *%rdx
ffff80000010849f:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001084a3:	48 8b 40 10          	mov    0x10(%rax),%rax
ffff8000001084a7:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001084ab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001084b0:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff8000001084b7:	80 ff ff 
ffff8000001084ba:	ff d2                	callq  *%rdx
ffff8000001084bc:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff8000001084c0:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001084c5:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff8000001084cc:	80 ff ff 
ffff8000001084cf:	ff d2                	callq  *%rdx
ffff8000001084d1:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001084d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001084d9:	48 89 c7             	mov    %rax,%rdi
ffff8000001084dc:	48 8b 63 10          	mov    0x10(%rbx),%rsp
ffff8000001084e0:	ff 72 08             	pushq  0x8(%rdx)
ffff8000001084e3:	e9 7e fe ff ff       	jmpq   ffff800000108366 <do_execve>
ffff8000001084e8:	b8 01 00 00 00       	mov    $0x1,%eax
ffff8000001084ed:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001084f1:	c9                   	leaveq 
ffff8000001084f2:	c3                   	retq   

ffff8000001084f3 <do_fork>:
ffff8000001084f3:	55                   	push   %rbp
ffff8000001084f4:	48 89 e5             	mov    %rsp,%rbp
ffff8000001084f7:	53                   	push   %rbx
ffff8000001084f8:	48 83 ec 48          	sub    $0x48,%rsp
ffff8000001084fc:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
ffff800000108500:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
ffff800000108504:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
ffff800000108508:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
ffff80000010850c:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
ffff800000108513:	00 
ffff800000108514:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
ffff80000010851b:	00 
ffff80000010851c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108523:	00 
ffff800000108524:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff80000010852b:	80 ff ff 
ffff80000010852e:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108535:	48 8b 00             	mov    (%rax),%rax
ffff800000108538:	48 89 c1             	mov    %rax,%rcx
ffff80000010853b:	48 ba 7a 1c 11 00 00 	movabs $0xffff800000111c7a,%rdx
ffff800000108542:	80 ff ff 
ffff800000108545:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010854a:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff80000010854f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108554:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff80000010855b:	80 ff ff 
ffff80000010855e:	41 ff d0             	callq  *%r8
ffff800000108561:	ba 91 00 00 00       	mov    $0x91,%edx
ffff800000108566:	be 01 00 00 00       	mov    $0x1,%esi
ffff80000010856b:	bf 02 00 00 00       	mov    $0x2,%edi
ffff800000108570:	48 b8 4f 72 10 00 00 	movabs $0xffff80000010724f,%rax
ffff800000108577:	80 ff ff 
ffff80000010857a:	ff d0                	callq  *%rax
ffff80000010857c:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108580:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108587:	80 ff ff 
ffff80000010858a:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
ffff800000108591:	48 8b 00             	mov    (%rax),%rax
ffff800000108594:	48 89 c1             	mov    %rax,%rcx
ffff800000108597:	48 ba 7a 1c 11 00 00 	movabs $0xffff800000111c7a,%rdx
ffff80000010859e:	80 ff ff 
ffff8000001085a1:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001085a6:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001085ab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001085b0:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001085b7:	80 ff ff 
ffff8000001085ba:	41 ff d0             	callq  *%r8
ffff8000001085bd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff8000001085c1:	48 8b 40 08          	mov    0x8(%rax),%rax
ffff8000001085c5:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
ffff8000001085cc:	80 ff ff 
ffff8000001085cf:	48 01 d0             	add    %rdx,%rax
ffff8000001085d2:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
ffff8000001085d6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001085da:	48 89 c1             	mov    %rax,%rcx
ffff8000001085dd:	48 ba 98 1c 11 00 00 	movabs $0xffff800000111c98,%rdx
ffff8000001085e4:	80 ff ff 
ffff8000001085e7:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001085ec:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff8000001085f1:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001085f6:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001085fd:	80 ff ff 
ffff800000108600:	41 ff d0             	callq  *%r8
ffff800000108603:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108607:	ba 58 00 00 00       	mov    $0x58,%edx
ffff80000010860c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108611:	48 89 c7             	mov    %rax,%rdi
ffff800000108614:	48 b8 1a 81 10 00 00 	movabs $0xffff80000010811a,%rax
ffff80000010861b:	80 ff ff 
ffff80000010861e:	ff d0                	callq  *%rax
ffff800000108620:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108625:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff80000010862c:	80 ff ff 
ffff80000010862f:	ff d2                	callq  *%rdx
ffff800000108631:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
ffff800000108635:	48 8b 08             	mov    (%rax),%rcx
ffff800000108638:	48 8b 58 08          	mov    0x8(%rax),%rbx
ffff80000010863c:	48 89 0a             	mov    %rcx,(%rdx)
ffff80000010863f:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
ffff800000108643:	48 8b 48 10          	mov    0x10(%rax),%rcx
ffff800000108647:	48 8b 58 18          	mov    0x18(%rax),%rbx
ffff80000010864b:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
ffff80000010864f:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
ffff800000108653:	48 8b 48 20          	mov    0x20(%rax),%rcx
ffff800000108657:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff80000010865b:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
ffff80000010865f:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
ffff800000108663:	48 8b 48 30          	mov    0x30(%rax),%rcx
ffff800000108667:	48 8b 58 38          	mov    0x38(%rax),%rbx
ffff80000010866b:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
ffff80000010866f:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
ffff800000108673:	48 8b 48 40          	mov    0x40(%rax),%rcx
ffff800000108677:	48 8b 58 48          	mov    0x48(%rax),%rbx
ffff80000010867b:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
ffff80000010867f:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
ffff800000108683:	48 8b 40 50          	mov    0x50(%rax),%rax
ffff800000108687:	48 89 42 50          	mov    %rax,0x50(%rdx)
ffff80000010868b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010868f:	48 89 c7             	mov    %rax,%rdi
ffff800000108692:	48 b8 35 80 10 00 00 	movabs $0xffff800000108035,%rax
ffff800000108699:	80 ff ff 
ffff80000010869c:	ff d0                	callq  *%rax
ffff80000010869e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086a2:	48 89 c6             	mov    %rax,%rsi
ffff8000001086a5:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff8000001086ac:	80 ff ff 
ffff8000001086af:	48 b8 57 80 10 00 00 	movabs $0xffff800000108057,%rax
ffff8000001086b6:	80 ff ff 
ffff8000001086b9:	ff d0                	callq  *%rax
ffff8000001086bb:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086bf:	48 8b 40 38          	mov    0x38(%rax),%rax
ffff8000001086c3:	48 8d 50 01          	lea    0x1(%rax),%rdx
ffff8000001086c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086cb:	48 89 50 38          	mov    %rdx,0x38(%rax)
ffff8000001086cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086d3:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
ffff8000001086da:	00 
ffff8000001086db:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086df:	48 83 c0 58          	add    $0x58,%rax
ffff8000001086e3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
ffff8000001086e7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086eb:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
ffff8000001086ef:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff8000001086f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001086f7:	48 05 40 7f 00 00    	add    $0x7f40,%rax
ffff8000001086fd:	48 89 c1             	mov    %rax,%rcx
ffff800000108700:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108704:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000108709:	48 89 ce             	mov    %rcx,%rsi
ffff80000010870c:	48 89 c7             	mov    %rax,%rdi
ffff80000010870f:	48 b8 c0 80 10 00 00 	movabs $0xffff8000001080c0,%rax
ffff800000108716:	80 ff ff 
ffff800000108719:	ff d0                	callq  *%rax
ffff80000010871b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010871f:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
ffff800000108726:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010872a:	48 89 10             	mov    %rdx,(%rax)
ffff80000010872d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108731:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000108738:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010873c:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff800000108740:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108744:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
ffff80000010874b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff80000010874f:	48 89 50 10          	mov    %rdx,0x10(%rax)
ffff800000108753:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108757:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff80000010875b:	83 e0 01             	and    $0x1,%eax
ffff80000010875e:	48 85 c0             	test   %rax,%rax
ffff800000108761:	75 28                	jne    ffff80000010878b <do_fork+0x298>
ffff800000108763:	48 ba 64 40 10 00 00 	movabs $0xffff800000104064,%rdx
ffff80000010876a:	80 ff ff 
ffff80000010876d:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff800000108771:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
ffff800000108778:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
ffff80000010877c:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
ffff800000108783:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108787:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffff80000010878b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff80000010878f:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff800000108796:	00 
ffff800000108797:	b8 00 00 00 00       	mov    $0x0,%eax
ffff80000010879c:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff8000001087a0:	c9                   	leaveq 
ffff8000001087a1:	c3                   	retq   

ffff8000001087a2 <do_exit>:
ffff8000001087a2:	55                   	push   %rbp
ffff8000001087a3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001087a6:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001087aa:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001087ae:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001087b2:	48 89 c1             	mov    %rax,%rcx
ffff8000001087b5:	48 ba c0 1c 11 00 00 	movabs $0xffff800000111cc0,%rdx
ffff8000001087bc:	80 ff ff 
ffff8000001087bf:	be 00 00 00 00       	mov    $0x0,%esi
ffff8000001087c4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
ffff8000001087c9:	b8 00 00 00 00       	mov    $0x0,%eax
ffff8000001087ce:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff8000001087d5:	80 ff ff 
ffff8000001087d8:	41 ff d0             	callq  *%r8
ffff8000001087db:	eb fe                	jmp    ffff8000001087db <do_exit+0x39>

ffff8000001087dd <system_call_function>:
ffff8000001087dd:	55                   	push   %rbp
ffff8000001087de:	48 89 e5             	mov    %rsp,%rbp
ffff8000001087e1:	48 83 ec 10          	sub    $0x10,%rsp
ffff8000001087e5:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
ffff8000001087e9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff8000001087ed:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
ffff8000001087f4:	48 ba a0 b2 10 00 00 	movabs $0xffff80000010b2a0,%rdx
ffff8000001087fb:	80 ff ff 
ffff8000001087fe:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
ffff800000108802:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
ffff800000108806:	48 89 c7             	mov    %rax,%rdi
ffff800000108809:	ff d2                	callq  *%rdx
ffff80000010880b:	c9                   	leaveq 
ffff80000010880c:	c3                   	retq   

ffff80000010880d <kernel_thread_func>:
ffff80000010880d:	41 5f                	pop    %r15
ffff80000010880f:	41 5e                	pop    %r14
ffff800000108811:	41 5d                	pop    %r13
ffff800000108813:	41 5c                	pop    %r12
ffff800000108815:	41 5b                	pop    %r11
ffff800000108817:	41 5a                	pop    %r10
ffff800000108819:	41 59                	pop    %r9
ffff80000010881b:	41 58                	pop    %r8
ffff80000010881d:	5b                   	pop    %rbx
ffff80000010881e:	59                   	pop    %rcx
ffff80000010881f:	5a                   	pop    %rdx
ffff800000108820:	5e                   	pop    %rsi
ffff800000108821:	5f                   	pop    %rdi
ffff800000108822:	5d                   	pop    %rbp
ffff800000108823:	58                   	pop    %rax
ffff800000108824:	48 8e d8             	mov    %rax,%ds
ffff800000108827:	58                   	pop    %rax
ffff800000108828:	48 8e c0             	mov    %rax,%es
ffff80000010882b:	58                   	pop    %rax
ffff80000010882c:	48 83 c4 38          	add    $0x38,%rsp
ffff800000108830:	48 89 d7             	mov    %rdx,%rdi
ffff800000108833:	ff d3                	callq  *%rbx
ffff800000108835:	48 89 c7             	mov    %rax,%rdi
ffff800000108838:	e8 65 ff ff ff       	callq  ffff8000001087a2 <do_exit>

ffff80000010883d <kernel_thread>:
ffff80000010883d:	55                   	push   %rbp
ffff80000010883e:	48 89 e5             	mov    %rsp,%rbp
ffff800000108841:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
ffff800000108848:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
ffff80000010884f:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
ffff800000108856:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
ffff80000010885d:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff800000108864:	ba c0 00 00 00       	mov    $0xc0,%edx
ffff800000108869:	be 00 00 00 00       	mov    $0x0,%esi
ffff80000010886e:	48 89 c7             	mov    %rax,%rdi
ffff800000108871:	48 b8 1a 81 10 00 00 	movabs $0xffff80000010811a,%rax
ffff800000108878:	80 ff ff 
ffff80000010887b:	ff d0                	callq  *%rax
ffff80000010887d:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
ffff800000108884:	48 89 45 80          	mov    %rax,-0x80(%rbp)
ffff800000108888:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
ffff80000010888f:	48 89 45 90          	mov    %rax,-0x70(%rbp)
ffff800000108893:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
ffff80000010889a:	00 
ffff80000010889b:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
ffff8000001088a2:	00 
ffff8000001088a3:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
ffff8000001088aa:	00 
ffff8000001088ab:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
ffff8000001088b2:	00 
ffff8000001088b3:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
ffff8000001088ba:	00 
ffff8000001088bb:	48 b8 0d 88 10 00 00 	movabs $0xffff80000010880d,%rax
ffff8000001088c2:	80 ff ff 
ffff8000001088c5:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff8000001088c9:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
ffff8000001088d0:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
ffff8000001088d7:	b9 00 00 00 00       	mov    $0x0,%ecx
ffff8000001088dc:	ba 00 00 00 00       	mov    $0x0,%edx
ffff8000001088e1:	48 89 c7             	mov    %rax,%rdi
ffff8000001088e4:	48 b8 f3 84 10 00 00 	movabs $0xffff8000001084f3,%rax
ffff8000001088eb:	80 ff ff 
ffff8000001088ee:	ff d0                	callq  *%rax
ffff8000001088f0:	c9                   	leaveq 
ffff8000001088f1:	c3                   	retq   

ffff8000001088f2 <__switch_to>:
ffff8000001088f2:	55                   	push   %rbp
ffff8000001088f3:	48 89 e5             	mov    %rsp,%rbp
ffff8000001088f6:	53                   	push   %rbx
ffff8000001088f7:	48 83 ec 18          	sub    $0x18,%rsp
ffff8000001088fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
ffff8000001088ff:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
ffff800000108903:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108907:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff80000010890b:	48 8b 00             	mov    (%rax),%rax
ffff80000010890e:	48 ba 60 af 10 00 00 	movabs $0xffff80000010af60,%rdx
ffff800000108915:	80 ff ff 
ffff800000108918:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff80000010891c:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108923:	80 ff ff 
ffff800000108926:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff80000010892a:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108931:	80 ff ff 
ffff800000108934:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff800000108938:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff80000010893f:	80 ff ff 
ffff800000108942:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff800000108946:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff80000010894d:	80 ff ff 
ffff800000108950:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff800000108954:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff80000010895b:	80 ff ff 
ffff80000010895e:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff800000108962:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108969:	80 ff ff 
ffff80000010896c:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff800000108970:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108977:	80 ff ff 
ffff80000010897a:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff80000010897e:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108985:	80 ff ff 
ffff800000108988:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff80000010898c:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108993:	80 ff ff 
ffff800000108996:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff80000010899a:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff8000001089a1:	80 ff ff 
ffff8000001089a4:	48 8b 40 04          	mov    0x4(%rax),%rax
ffff8000001089a8:	41 52                	push   %r10
ffff8000001089aa:	41 51                	push   %r9
ffff8000001089ac:	41 50                	push   %r8
ffff8000001089ae:	57                   	push   %rdi
ffff8000001089af:	49 89 d9             	mov    %rbx,%r9
ffff8000001089b2:	4d 89 d8             	mov    %r11,%r8
ffff8000001089b5:	48 89 c7             	mov    %rax,%rdi
ffff8000001089b8:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff8000001089bf:	80 ff ff 
ffff8000001089c2:	ff d0                	callq  *%rax
ffff8000001089c4:	48 83 c4 20          	add    $0x20,%rsp
ffff8000001089c8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089cc:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001089d0:	48 8c e0             	mov    %fs,%rax
ffff8000001089d3:	48 89 42 18          	mov    %rax,0x18(%rdx)
ffff8000001089d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff8000001089db:	48 8b 50 28          	mov    0x28(%rax),%rdx
ffff8000001089df:	48 8c e8             	mov    %gs,%rax
ffff8000001089e2:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff8000001089e6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001089ea:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001089ee:	48 8b 40 18          	mov    0x18(%rax),%rax
ffff8000001089f2:	48 8e e0             	mov    %rax,%fs
ffff8000001089f5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff8000001089f9:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff8000001089fd:	48 8b 40 20          	mov    0x20(%rax),%rax
ffff800000108a01:	48 8e e8             	mov    %rax,%gs
ffff800000108a04:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
ffff800000108a08:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108a0c:	48 8b 00             	mov    (%rax),%rax
ffff800000108a0f:	48 89 c1             	mov    %rax,%rcx
ffff800000108a12:	48 ba e2 1c 11 00 00 	movabs $0xffff800000111ce2,%rdx
ffff800000108a19:	80 ff ff 
ffff800000108a1c:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a21:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108a26:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a2b:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108a32:	80 ff ff 
ffff800000108a35:	41 ff d0             	callq  *%r8
ffff800000108a38:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
ffff800000108a3c:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108a40:	48 8b 00             	mov    (%rax),%rax
ffff800000108a43:	48 89 c1             	mov    %rax,%rcx
ffff800000108a46:	48 ba fe 1c 11 00 00 	movabs $0xffff800000111cfe,%rdx
ffff800000108a4d:	80 ff ff 
ffff800000108a50:	be 00 00 00 00       	mov    $0x0,%esi
ffff800000108a55:	bf ff ff ff 00       	mov    $0xffffff,%edi
ffff800000108a5a:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108a5f:	49 b8 29 53 10 00 00 	movabs $0xffff800000105329,%r8
ffff800000108a66:	80 ff ff 
ffff800000108a69:	41 ff d0             	callq  *%r8
ffff800000108a6c:	90                   	nop
ffff800000108a6d:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
ffff800000108a71:	c9                   	leaveq 
ffff800000108a72:	c3                   	retq   

ffff800000108a73 <task_init>:
ffff800000108a73:	55                   	push   %rbp
ffff800000108a74:	48 89 e5             	mov    %rsp,%rbp
ffff800000108a77:	41 56                	push   %r14
ffff800000108a79:	41 55                	push   %r13
ffff800000108a7b:	41 54                	push   %r12
ffff800000108a7d:	53                   	push   %rbx
ffff800000108a7e:	48 83 ec 10          	sub    $0x10,%rsp
ffff800000108a82:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
ffff800000108a89:	00 
ffff800000108a8a:	48 b8 28 90 12 00 00 	movabs $0xffff800000129028,%rax
ffff800000108a91:	80 ff ff 
ffff800000108a94:	48 8b 00             	mov    (%rax),%rax
ffff800000108a97:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108a9e:	80 ff ff 
ffff800000108aa1:	48 89 02             	mov    %rax,(%rdx)
ffff800000108aa4:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108aab:	80 ff ff 
ffff800000108aae:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
ffff800000108ab5:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108abc:	80 ff ff 
ffff800000108abf:	48 89 42 08          	mov    %rax,0x8(%rdx)
ffff800000108ac3:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108aca:	80 ff ff 
ffff800000108acd:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
ffff800000108ad4:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108adb:	80 ff ff 
ffff800000108ade:	48 89 42 10          	mov    %rax,0x10(%rdx)
ffff800000108ae2:	48 ba c0 8d 10 00 00 	movabs $0xffff800000108dc0,%rdx
ffff800000108ae9:	80 ff ff 
ffff800000108aec:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000108af3:	80 ff ff 
ffff800000108af6:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffff800000108afa:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108b01:	80 ff ff 
ffff800000108b04:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
ffff800000108b0b:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108b12:	80 ff ff 
ffff800000108b15:	48 89 42 20          	mov    %rax,0x20(%rdx)
ffff800000108b19:	48 ba 20 0f 11 00 00 	movabs $0xffff800000110f20,%rdx
ffff800000108b20:	80 ff ff 
ffff800000108b23:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000108b2a:	80 ff ff 
ffff800000108b2d:	48 89 50 28          	mov    %rdx,0x28(%rax)
ffff800000108b31:	48 ba 1a 1d 11 00 00 	movabs $0xffff800000111d1a,%rdx
ffff800000108b38:	80 ff ff 
ffff800000108b3b:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000108b42:	80 ff ff 
ffff800000108b45:	48 89 50 30          	mov    %rdx,0x30(%rax)
ffff800000108b49:	48 b8 40 90 12 00 00 	movabs $0xffff800000129040,%rax
ffff800000108b50:	80 ff ff 
ffff800000108b53:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
ffff800000108b5a:	00 
ffff800000108b5b:	48 b8 a0 90 12 00 00 	movabs $0xffff8000001290a0,%rax
ffff800000108b62:	80 ff ff 
ffff800000108b65:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
ffff800000108b6c:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108b73:	80 ff ff 
ffff800000108b76:	48 89 42 40          	mov    %rax,0x40(%rdx)
ffff800000108b7a:	48 b8 b5 01 10 00 00 	movabs $0xffff8000001001b5,%rax
ffff800000108b81:	80 ff ff 
ffff800000108b84:	48 8b 00             	mov    (%rax),%rax
ffff800000108b87:	48 ba 40 90 12 00 00 	movabs $0xffff800000129040,%rdx
ffff800000108b8e:	80 ff ff 
ffff800000108b91:	48 89 42 48          	mov    %rax,0x48(%rdx)
ffff800000108b95:	be 08 00 00 00       	mov    $0x8,%esi
ffff800000108b9a:	bf 74 01 00 00       	mov    $0x174,%edi
ffff800000108b9f:	48 b8 90 81 10 00 00 	movabs $0xffff800000108190,%rax
ffff800000108ba6:	80 ff ff 
ffff800000108ba9:	ff d0                	callq  *%rax
ffff800000108bab:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108bb0:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108bb7:	80 ff ff 
ffff800000108bba:	ff d2                	callq  *%rdx
ffff800000108bbc:	48 8b 40 28          	mov    0x28(%rax),%rax
ffff800000108bc0:	48 8b 00             	mov    (%rax),%rax
ffff800000108bc3:	48 89 c6             	mov    %rax,%rsi
ffff800000108bc6:	bf 75 01 00 00       	mov    $0x175,%edi
ffff800000108bcb:	48 b8 90 81 10 00 00 	movabs $0xffff800000108190,%rax
ffff800000108bd2:	80 ff ff 
ffff800000108bd5:	ff d0                	callq  *%rax
ffff800000108bd7:	48 b8 27 40 10 00 00 	movabs $0xffff800000104027,%rax
ffff800000108bde:	80 ff ff 
ffff800000108be1:	48 89 c6             	mov    %rax,%rsi
ffff800000108be4:	bf 76 01 00 00       	mov    $0x176,%edi
ffff800000108be9:	48 b8 90 81 10 00 00 	movabs $0xffff800000108190,%rax
ffff800000108bf0:	80 ff ff 
ffff800000108bf3:	ff d0                	callq  *%rax
ffff800000108bf5:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108bfc:	80 ff ff 
ffff800000108bff:	4c 8b 50 54          	mov    0x54(%rax),%r10
ffff800000108c03:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c0a:	80 ff ff 
ffff800000108c0d:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
ffff800000108c11:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c18:	80 ff ff 
ffff800000108c1b:	4c 8b 40 44          	mov    0x44(%rax),%r8
ffff800000108c1f:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c26:	80 ff ff 
ffff800000108c29:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
ffff800000108c2d:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c34:	80 ff ff 
ffff800000108c37:	48 8b 58 34          	mov    0x34(%rax),%rbx
ffff800000108c3b:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c42:	80 ff ff 
ffff800000108c45:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
ffff800000108c49:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c50:	80 ff ff 
ffff800000108c53:	48 8b 48 24          	mov    0x24(%rax),%rcx
ffff800000108c57:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c5e:	80 ff ff 
ffff800000108c61:	48 8b 50 14          	mov    0x14(%rax),%rdx
ffff800000108c65:	48 b8 60 af 10 00 00 	movabs $0xffff80000010af60,%rax
ffff800000108c6c:	80 ff ff 
ffff800000108c6f:	48 8b 70 0c          	mov    0xc(%rax),%rsi
ffff800000108c73:	48 b8 e0 ae 10 00 00 	movabs $0xffff80000010aee0,%rax
ffff800000108c7a:	80 ff ff 
ffff800000108c7d:	48 8b 00             	mov    (%rax),%rax
ffff800000108c80:	41 52                	push   %r10
ffff800000108c82:	41 51                	push   %r9
ffff800000108c84:	41 50                	push   %r8
ffff800000108c86:	57                   	push   %rdi
ffff800000108c87:	49 89 d9             	mov    %rbx,%r9
ffff800000108c8a:	4d 89 d8             	mov    %r11,%r8
ffff800000108c8d:	48 89 c7             	mov    %rax,%rdi
ffff800000108c90:	48 b8 75 42 10 00 00 	movabs $0xffff800000104275,%rax
ffff800000108c97:	80 ff ff 
ffff800000108c9a:	ff d0                	callq  *%rax
ffff800000108c9c:	48 83 c4 20          	add    $0x20,%rsp
ffff800000108ca0:	48 b8 e0 ae 10 00 00 	movabs $0xffff80000010aee0,%rax
ffff800000108ca7:	80 ff ff 
ffff800000108caa:	48 8b 00             	mov    (%rax),%rax
ffff800000108cad:	48 ba 60 af 10 00 00 	movabs $0xffff80000010af60,%rdx
ffff800000108cb4:	80 ff ff 
ffff800000108cb7:	48 89 42 04          	mov    %rax,0x4(%rdx)
ffff800000108cbb:	48 bf 00 80 11 00 00 	movabs $0xffff800000118000,%rdi
ffff800000108cc2:	80 ff ff 
ffff800000108cc5:	48 b8 35 80 10 00 00 	movabs $0xffff800000108035,%rax
ffff800000108ccc:	80 ff ff 
ffff800000108ccf:	ff d0                	callq  *%rax
ffff800000108cd1:	ba 07 00 00 00       	mov    $0x7,%edx
ffff800000108cd6:	be 0a 00 00 00       	mov    $0xa,%esi
ffff800000108cdb:	48 bf fd 83 10 00 00 	movabs $0xffff8000001083fd,%rdi
ffff800000108ce2:	80 ff ff 
ffff800000108ce5:	48 b8 3d 88 10 00 00 	movabs $0xffff80000010883d,%rax
ffff800000108cec:	80 ff ff 
ffff800000108cef:	ff d0                	callq  *%rax
ffff800000108cf1:	48 b8 00 80 11 00 00 	movabs $0xffff800000118000,%rax
ffff800000108cf8:	80 ff ff 
ffff800000108cfb:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
ffff800000108d02:	00 
ffff800000108d03:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d08:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108d0f:	80 ff ff 
ffff800000108d12:	ff d2                	callq  *%rdx
ffff800000108d14:	48 89 c7             	mov    %rax,%rdi
ffff800000108d17:	48 b8 9a 80 10 00 00 	movabs $0xffff80000010809a,%rax
ffff800000108d1e:	80 ff ff 
ffff800000108d21:	ff d0                	callq  *%rax
ffff800000108d23:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
ffff800000108d27:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
ffff800000108d2b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
ffff800000108d2f:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d34:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108d3b:	80 ff ff 
ffff800000108d3e:	ff d2                	callq  *%rdx
ffff800000108d40:	48 8b 58 28          	mov    0x28(%rax),%rbx
ffff800000108d44:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d49:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108d50:	80 ff ff 
ffff800000108d53:	ff d2                	callq  *%rdx
ffff800000108d55:	4c 8b 70 28          	mov    0x28(%rax),%r14
ffff800000108d59:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108d5d:	4c 8b 60 28          	mov    0x28(%rax),%r12
ffff800000108d61:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108d65:	4c 8b 68 28          	mov    0x28(%rax),%r13
ffff800000108d69:	b8 00 00 00 00       	mov    $0x0,%eax
ffff800000108d6e:	48 ba b6 81 10 00 00 	movabs $0xffff8000001081b6,%rdx
ffff800000108d75:	80 ff ff 
ffff800000108d78:	ff d2                	callq  *%rdx
ffff800000108d7a:	48 89 c2             	mov    %rax,%rdx
ffff800000108d7d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
ffff800000108d81:	48 89 d7             	mov    %rdx,%rdi
ffff800000108d84:	48 89 c6             	mov    %rax,%rsi
ffff800000108d87:	55                   	push   %rbp
ffff800000108d88:	50                   	push   %rax
ffff800000108d89:	48 89 63 10          	mov    %rsp,0x10(%rbx)
ffff800000108d8d:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
ffff800000108d92:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # ffff800000108da6 <task_init+0x333>
ffff800000108d99:	49 89 46 08          	mov    %rax,0x8(%r14)
ffff800000108d9d:	41 ff 75 08          	pushq  0x8(%r13)
ffff800000108da1:	e9 4c fb ff ff       	jmpq   ffff8000001088f2 <__switch_to>
ffff800000108da6:	58                   	pop    %rax
ffff800000108da7:	5d                   	pop    %rbp
ffff800000108da8:	90                   	nop
ffff800000108da9:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
ffff800000108dad:	5b                   	pop    %rbx
ffff800000108dae:	41 5c                	pop    %r12
ffff800000108db0:	41 5d                	pop    %r13
ffff800000108db2:	41 5e                	pop    %r14
ffff800000108db4:	5d                   	pop    %rbp
ffff800000108db5:	c3                   	retq   

Disassembly of section .data:

ffff800000108dc0 <GDT_Table>:
	...
ffff800000108dcc:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
ffff800000108dd2:	00 00                	add    %al,(%rax)
ffff800000108dd4:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
ffff800000108dea:	00 00                	add    %al,(%rax)
ffff800000108dec:	00 f8                	add    %bh,%al
ffff800000108dee:	20 00                	and    %al,(%rax)
ffff800000108df0:	00 00                	add    %al,(%rax)
ffff800000108df2:	00 00                	add    %al,(%rax)
ffff800000108df4:	00 f2                	add    %dh,%dl
ffff800000108df6:	00 00                	add    %al,(%rax)
ffff800000108df8:	ff                   	(bad)  
ffff800000108df9:	ff 00                	incl   (%rax)
ffff800000108dfb:	00 00                	add    %al,(%rax)
ffff800000108dfd:	9a                   	(bad)  
ffff800000108dfe:	cf                   	iret   
ffff800000108dff:	00 ff                	add    %bh,%bh
ffff800000108e01:	ff 00                	incl   (%rax)
ffff800000108e03:	00 00                	add    %al,(%rax)
ffff800000108e05:	92                   	xchg   %eax,%edx
ffff800000108e06:	cf                   	iret   
	...

ffff800000108e58 <GDT_END>:
ffff800000108e58:	97                   	xchg   %eax,%edi
	...

ffff800000108e5a <GDT_BASE>:
ffff800000108e5a:	c0 8d 10 00 00 80 ff 	rorb   $0xff,-0x7ffffff0(%rbp)
ffff800000108e61:	ff                 	incl   (%rax)

ffff800000108e62 <IDT_Table>:
	...

ffff800000109e62 <IDT_END>:
ffff800000109e62:	ff 0f                	decl   (%rdi)

ffff800000109e64 <IDT_BASE>:
ffff800000109e64:	62                   	(bad)  
ffff800000109e65:	8e 10                	mov    (%rax),%ss
ffff800000109e67:	00 00                	add    %al,(%rax)
ffff800000109e69:	80 ff ff             	cmp    $0xff,%bh

ffff800000109e6c <TSS64_Table>:
	...

ffff800000109ed4 <TSS64_END>:
ffff800000109ed4:	67 00          	add    %ch,0x10(%esi,%ebx,4)

ffff800000109ed6 <TSS64_BASE>:
ffff800000109ed6:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000109ed7:	9e                   	sahf   
ffff800000109ed8:	10 00                	adc    %al,(%rax)
ffff800000109eda:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)

ffff800000109ee0 <font_ascii>:
	...
ffff80000010a0f0:	00 10                	add    %dl,(%rax)
ffff80000010a0f2:	10 10                	adc    %dl,(%rax)
ffff80000010a0f4:	10 10                	adc    %dl,(%rax)
ffff80000010a0f6:	10 10                	adc    %dl,(%rax)
ffff80000010a0f8:	10 10                	adc    %dl,(%rax)
ffff80000010a0fa:	00 00                	add    %al,(%rax)
ffff80000010a0fc:	10 10                	adc    %dl,(%rax)
ffff80000010a0fe:	00 00                	add    %al,(%rax)
ffff80000010a100:	28 28                	sub    %ch,(%rax)
ffff80000010a102:	28 00                	sub    %al,(%rax)
	...
ffff80000010a110:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010a114:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010a118:	44                   	rex.R
ffff80000010a119:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010a11e:	00 00                	add    %al,(%rax)
ffff80000010a120:	10 3a                	adc    %bh,(%rdx)
ffff80000010a122:	56                   	push   %rsi
ffff80000010a123:	92                   	xchg   %eax,%edx
ffff80000010a124:	92                   	xchg   %eax,%edx
ffff80000010a125:	90                   	nop
ffff80000010a126:	50                   	push   %rax
ffff80000010a127:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010a12a:	92                   	xchg   %eax,%edx
ffff80000010a12b:	92                   	xchg   %eax,%edx
ffff80000010a12c:	d4                   	(bad)  
ffff80000010a12d:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010a132:	94                   	xchg   %eax,%esp
ffff80000010a133:	94                   	xchg   %eax,%esp
ffff80000010a134:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010a139:	2c 52                	sub    $0x52,%al
ffff80000010a13b:	52                   	push   %rdx
ffff80000010a13c:	92                   	xchg   %eax,%edx
ffff80000010a13d:	8c 00                	mov    %es,(%rax)
ffff80000010a13f:	00 00                	add    %al,(%rax)
ffff80000010a141:	70 88                	jo     ffff80000010a0cb <font_ascii+0x1eb>
ffff80000010a143:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010a149:	92                   	xchg   %eax,%edx
ffff80000010a14a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010a151:	08 10                	or     %dl,(%rax)
	...
ffff80000010a15f:	00 02                	add    %al,(%rdx)
ffff80000010a161:	04 08                	add    $0x8,%al
ffff80000010a163:	08 10                	or     %dl,(%rax)
ffff80000010a165:	10 10                	adc    %dl,(%rax)
ffff80000010a167:	10 10                	adc    %dl,(%rax)
ffff80000010a169:	10 10                	adc    %dl,(%rax)
ffff80000010a16b:	08 08                	or     %cl,(%rax)
ffff80000010a16d:	04 02                	add    $0x2,%al
ffff80000010a16f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010a175:	10 10                	adc    %dl,(%rax)
ffff80000010a177:	10 10                	adc    %dl,(%rax)
ffff80000010a179:	10 10                	adc    %dl,(%rax)
ffff80000010a17b:	20 20                	and    %ah,(%rax)
ffff80000010a17d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010a181:	00 00                	add    %al,(%rax)
ffff80000010a183:	00 00                	add    %al,(%rax)
ffff80000010a185:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010a18b:	10 00                	adc    %al,(%rax)
	...
ffff80000010a195:	10 10                	adc    %dl,(%rax)
ffff80000010a197:	10 fe                	adc    %bh,%dh
ffff80000010a199:	10 10                	adc    %dl,(%rax)
ffff80000010a19b:	10 00                	adc    %al,(%rax)
	...
ffff80000010a1a9:	00 00                	add    %al,(%rax)
ffff80000010a1ab:	18 18                	sbb    %bl,(%rax)
ffff80000010a1ad:	08 08                	or     %cl,(%rax)
ffff80000010a1af:	10 00                	adc    %al,(%rax)
ffff80000010a1b1:	00 00                	add    %al,(%rax)
ffff80000010a1b3:	00 00                	add    %al,(%rax)
ffff80000010a1b5:	00 00                	add    %al,(%rax)
ffff80000010a1b7:	00 fe                	add    %bh,%dh
	...
ffff80000010a1c9:	00 00                	add    %al,(%rax)
ffff80000010a1cb:	00 18                	add    %bl,(%rax)
ffff80000010a1cd:	18 00                	sbb    %al,(%rax)
ffff80000010a1cf:	00 02                	add    %al,(%rdx)
ffff80000010a1d1:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010a1d4:	08 08                	or     %cl,(%rax)
ffff80000010a1d6:	08 10                	or     %dl,(%rax)
ffff80000010a1d8:	10 20                	adc    %ah,(%rax)
ffff80000010a1da:	20 40 40             	and    %al,0x40(%rax)
ffff80000010a1dd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010a1e4:	42 
ffff80000010a1e5:	42                   	rex.X
ffff80000010a1e6:	42                   	rex.X
ffff80000010a1e7:	42                   	rex.X
ffff80000010a1e8:	42                   	rex.X
ffff80000010a1e9:	42                   	rex.X
ffff80000010a1ea:	42 24 24             	rex.X and $0x24,%al
ffff80000010a1ed:	18 00                	sbb    %al,(%rax)
ffff80000010a1ef:	00 00                	add    %al,(%rax)
ffff80000010a1f1:	08 18                	or     %bl,(%rax)
ffff80000010a1f3:	28 08                	sub    %cl,(%rax)
ffff80000010a1f5:	08 08                	or     %cl,(%rax)
ffff80000010a1f7:	08 08                	or     %cl,(%rax)
ffff80000010a1f9:	08 08                	or     %cl,(%rax)
ffff80000010a1fb:	08 08                	or     %cl,(%rax)
ffff80000010a1fd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010a200:	00 18                	add    %bl,(%rax)
ffff80000010a202:	24 42                	and    $0x42,%al
ffff80000010a204:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010a208:	10 20                	adc    %ah,(%rax)
ffff80000010a20a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010a20d:	7e 00                	jle    ffff80000010a20f <font_ascii+0x32f>
ffff80000010a20f:	00 00                	add    %al,(%rax)
ffff80000010a211:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010a214:	02 02                	add    (%rdx),%al
ffff80000010a216:	04 18                	add    $0x18,%al
ffff80000010a218:	04 02                	add    $0x2,%al
ffff80000010a21a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010a21d:	18 00                	sbb    %al,(%rax)
ffff80000010a21f:	00 00                	add    %al,(%rax)
ffff80000010a221:	0c 0c                	or     $0xc,%al
ffff80000010a223:	0c 14                	or     $0x14,%al
ffff80000010a225:	14 14                	adc    $0x14,%al
ffff80000010a227:	24 24                	and    $0x24,%al
ffff80000010a229:	44 7e 04             	rex.R jle ffff80000010a230 <font_ascii+0x350>
ffff80000010a22c:	04 1e                	add    $0x1e,%al
ffff80000010a22e:	00 00                	add    %al,(%rax)
ffff80000010a230:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010a234:	40 58                	rex pop %rax
ffff80000010a236:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010a239:	02 02                	add    (%rdx),%al
ffff80000010a23b:	42 24 18             	rex.X and $0x18,%al
ffff80000010a23e:	00 00                	add    %al,(%rax)
ffff80000010a240:	00 18                	add    %bl,(%rax)
ffff80000010a242:	24 42                	and    $0x42,%al
ffff80000010a244:	40 58                	rex pop %rax
ffff80000010a246:	64 42                	fs rex.X
ffff80000010a248:	42                   	rex.X
ffff80000010a249:	42                   	rex.X
ffff80000010a24a:	42                   	rex.X
ffff80000010a24b:	42 24 18             	rex.X and $0x18,%al
ffff80000010a24e:	00 00                	add    %al,(%rax)
ffff80000010a250:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010a253:	42 04 04             	rex.X add $0x4,%al
ffff80000010a256:	08 08                	or     %cl,(%rax)
ffff80000010a258:	08 10                	or     %dl,(%rax)
ffff80000010a25a:	10 10                	adc    %dl,(%rax)
ffff80000010a25c:	10 38                	adc    %bh,(%rax)
ffff80000010a25e:	00 00                	add    %al,(%rax)
ffff80000010a260:	00 18                	add    %bl,(%rax)
ffff80000010a262:	24 42                	and    $0x42,%al
ffff80000010a264:	42                   	rex.X
ffff80000010a265:	42 24 18             	rex.X and $0x18,%al
ffff80000010a268:	24 42                	and    $0x42,%al
ffff80000010a26a:	42                   	rex.X
ffff80000010a26b:	42 24 18             	rex.X and $0x18,%al
ffff80000010a26e:	00 00                	add    %al,(%rax)
ffff80000010a270:	00 18                	add    %bl,(%rax)
ffff80000010a272:	24 42                	and    $0x42,%al
ffff80000010a274:	42                   	rex.X
ffff80000010a275:	42                   	rex.X
ffff80000010a276:	42                   	rex.X
ffff80000010a277:	42                   	rex.X
ffff80000010a278:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010a27b:	42 24 18             	rex.X and $0x18,%al
ffff80000010a27e:	00 00                	add    %al,(%rax)
ffff80000010a280:	00 00                	add    %al,(%rax)
ffff80000010a282:	00 00                	add    %al,(%rax)
ffff80000010a284:	00 18                	add    %bl,(%rax)
ffff80000010a286:	18 00                	sbb    %al,(%rax)
ffff80000010a288:	00 00                	add    %al,(%rax)
ffff80000010a28a:	00 00                	add    %al,(%rax)
ffff80000010a28c:	18 18                	sbb    %bl,(%rax)
ffff80000010a28e:	00 00                	add    %al,(%rax)
ffff80000010a290:	00 00                	add    %al,(%rax)
ffff80000010a292:	00 00                	add    %al,(%rax)
ffff80000010a294:	00 18                	add    %bl,(%rax)
ffff80000010a296:	18 00                	sbb    %al,(%rax)
ffff80000010a298:	00 00                	add    %al,(%rax)
ffff80000010a29a:	00 18                	add    %bl,(%rax)
ffff80000010a29c:	18 08                	sbb    %cl,(%rax)
ffff80000010a29e:	08 10                	or     %dl,(%rax)
ffff80000010a2a0:	00 02                	add    %al,(%rdx)
ffff80000010a2a2:	04 08                	add    $0x8,%al
ffff80000010a2a4:	10 20                	adc    %ah,(%rax)
ffff80000010a2a6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010a2ad:	04 
ffff80000010a2ae:	02 00                	add    (%rax),%al
ffff80000010a2b0:	00 00                	add    %al,(%rax)
ffff80000010a2b2:	00 00                	add    %al,(%rax)
ffff80000010a2b4:	00 00                	add    %al,(%rax)
ffff80000010a2b6:	fe 00                	incb   (%rax)
ffff80000010a2b8:	00 fe                	add    %bh,%dh
ffff80000010a2ba:	00 00                	add    %al,(%rax)
ffff80000010a2bc:	00 00                	add    %al,(%rax)
ffff80000010a2be:	00 00                	add    %al,(%rax)
ffff80000010a2c0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010a2c6:	04 02                	add    $0x2,%al
ffff80000010a2c8:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010a2cb:	10 20                	adc    %ah,(%rax)
ffff80000010a2cd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010a2d1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010a2d5:	82                   	(bad)  
ffff80000010a2d6:	04 08                	add    $0x8,%al
ffff80000010a2d8:	10 10                	adc    %dl,(%rax)
ffff80000010a2da:	00 00                	add    %al,(%rax)
ffff80000010a2dc:	18 18                	sbb    %bl,(%rax)
ffff80000010a2de:	00 00                	add    %al,(%rax)
ffff80000010a2e0:	00 38                	add    %bh,(%rax)
ffff80000010a2e2:	44 82                	rex.R (bad) 
ffff80000010a2e4:	9a                   	(bad)  
ffff80000010a2e5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010a2e6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010a2e7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010a2e8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010a2e9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010a2ea:	9c                   	pushfq 
ffff80000010a2eb:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010a2ef:	00 00                	add    %al,(%rax)
ffff80000010a2f1:	18 18                	sbb    %bl,(%rax)
ffff80000010a2f3:	18 18                	sbb    %bl,(%rax)
ffff80000010a2f5:	24 24                	and    $0x24,%al
ffff80000010a2f7:	24 24                	and    $0x24,%al
ffff80000010a2f9:	7e 42                	jle    ffff80000010a33d <font_ascii+0x45d>
ffff80000010a2fb:	42                   	rex.X
ffff80000010a2fc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a2ff:	00 00                	add    %al,(%rax)
ffff80000010a301:	f0 48                	lock rex.W
ffff80000010a303:	44                   	rex.R
ffff80000010a304:	44                   	rex.R
ffff80000010a305:	44                   	rex.R
ffff80000010a306:	48 78 44             	rex.W js ffff80000010a34d <font_ascii+0x46d>
ffff80000010a309:	42                   	rex.X
ffff80000010a30a:	42                   	rex.X
ffff80000010a30b:	42                   	rex.X
ffff80000010a30c:	44 f8                	rex.R clc 
ffff80000010a30e:	00 00                	add    %al,(%rax)
ffff80000010a310:	00 3a                	add    %bh,(%rdx)
ffff80000010a312:	46                   	rex.RX
ffff80000010a313:	42 82                	rex.X (bad) 
ffff80000010a315:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010a31c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010a31f:	00 00                	add    %al,(%rax)
ffff80000010a321:	f8                   	clc    
ffff80000010a322:	44                   	rex.R
ffff80000010a323:	44                   	rex.R
ffff80000010a324:	42                   	rex.X
ffff80000010a325:	42                   	rex.X
ffff80000010a326:	42                   	rex.X
ffff80000010a327:	42                   	rex.X
ffff80000010a328:	42                   	rex.X
ffff80000010a329:	42                   	rex.X
ffff80000010a32a:	42                   	rex.X
ffff80000010a32b:	44                   	rex.R
ffff80000010a32c:	44 f8                	rex.R clc 
ffff80000010a32e:	00 00                	add    %al,(%rax)
ffff80000010a330:	00 fe                	add    %bh,%dh
ffff80000010a332:	42                   	rex.X
ffff80000010a333:	42                   	rex.X
ffff80000010a334:	40                   	rex
ffff80000010a335:	40                   	rex
ffff80000010a336:	44 7c 44             	rex.R jl ffff80000010a37d <font_ascii+0x49d>
ffff80000010a339:	40                   	rex
ffff80000010a33a:	40                   	rex
ffff80000010a33b:	42                   	rex.X
ffff80000010a33c:	42 fe 00             	rex.X incb (%rax)
ffff80000010a33f:	00 00                	add    %al,(%rax)
ffff80000010a341:	fe 42 42             	incb   0x42(%rdx)
ffff80000010a344:	40                   	rex
ffff80000010a345:	40                   	rex
ffff80000010a346:	44 7c 44             	rex.R jl ffff80000010a38d <font_ascii+0x4ad>
ffff80000010a349:	44                   	rex.R
ffff80000010a34a:	40                   	rex
ffff80000010a34b:	40                   	rex
ffff80000010a34c:	40                   	rex
ffff80000010a34d:	f0 00 00             	lock add %al,(%rax)
ffff80000010a350:	00 3a                	add    %bh,(%rdx)
ffff80000010a352:	46                   	rex.RX
ffff80000010a353:	42 82                	rex.X (bad) 
ffff80000010a355:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010a35c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010a35f:	00 00                	add    %al,(%rax)
ffff80000010a361:	e7 42                	out    %eax,$0x42
ffff80000010a363:	42                   	rex.X
ffff80000010a364:	42                   	rex.X
ffff80000010a365:	42                   	rex.X
ffff80000010a366:	42 7e 42             	rex.X jle ffff80000010a3ab <font_ascii+0x4cb>
ffff80000010a369:	42                   	rex.X
ffff80000010a36a:	42                   	rex.X
ffff80000010a36b:	42                   	rex.X
ffff80000010a36c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a36f:	00 00                	add    %al,(%rax)
ffff80000010a371:	7c 10                	jl     ffff80000010a383 <font_ascii+0x4a3>
ffff80000010a373:	10 10                	adc    %dl,(%rax)
ffff80000010a375:	10 10                	adc    %dl,(%rax)
ffff80000010a377:	10 10                	adc    %dl,(%rax)
ffff80000010a379:	10 10                	adc    %dl,(%rax)
ffff80000010a37b:	10 10                	adc    %dl,(%rax)
ffff80000010a37d:	7c 00                	jl     ffff80000010a37f <font_ascii+0x49f>
ffff80000010a37f:	00 00                	add    %al,(%rax)
ffff80000010a381:	1f                   	(bad)  
ffff80000010a382:	04 04                	add    $0x4,%al
ffff80000010a384:	04 04                	add    $0x4,%al
ffff80000010a386:	04 04                	add    $0x4,%al
ffff80000010a388:	04 04                	add    $0x4,%al
ffff80000010a38a:	04 04                	add    $0x4,%al
ffff80000010a38c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010a38f:	00 00                	add    %al,(%rax)
ffff80000010a391:	e7 42                	out    %eax,$0x42
ffff80000010a393:	44                   	rex.R
ffff80000010a394:	48 50                	rex.W push %rax
ffff80000010a396:	50                   	push   %rax
ffff80000010a397:	60                   	(bad)  
ffff80000010a398:	50                   	push   %rax
ffff80000010a399:	50                   	push   %rax
ffff80000010a39a:	48                   	rex.W
ffff80000010a39b:	44                   	rex.R
ffff80000010a39c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a39f:	00 00                	add    %al,(%rax)
ffff80000010a3a1:	f0 40                	lock rex
ffff80000010a3a3:	40                   	rex
ffff80000010a3a4:	40                   	rex
ffff80000010a3a5:	40                   	rex
ffff80000010a3a6:	40                   	rex
ffff80000010a3a7:	40                   	rex
ffff80000010a3a8:	40                   	rex
ffff80000010a3a9:	40                   	rex
ffff80000010a3aa:	40                   	rex
ffff80000010a3ab:	42                   	rex.X
ffff80000010a3ac:	42 fe 00             	rex.X incb (%rax)
ffff80000010a3af:	00 00                	add    %al,(%rax)
ffff80000010a3b1:	c3                   	retq   
ffff80000010a3b2:	42                   	rex.X
ffff80000010a3b3:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010a3b7:	5a                   	pop    %rdx
ffff80000010a3b8:	5a                   	pop    %rdx
ffff80000010a3b9:	42                   	rex.X
ffff80000010a3ba:	42                   	rex.X
ffff80000010a3bb:	42                   	rex.X
ffff80000010a3bc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a3bf:	00 00                	add    %al,(%rax)
ffff80000010a3c1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010a3c8:	4a                   	rex.WX
ffff80000010a3c9:	4a                   	rex.WX
ffff80000010a3ca:	4a                   	rex.WX
ffff80000010a3cb:	46                   	rex.RX
ffff80000010a3cc:	46 e2 00             	rex.RX loop ffff80000010a3cf <font_ascii+0x4ef>
ffff80000010a3cf:	00 00                	add    %al,(%rax)
ffff80000010a3d1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010a3d5:	82                   	(bad)  
ffff80000010a3d6:	82                   	(bad)  
ffff80000010a3d7:	82                   	(bad)  
ffff80000010a3d8:	82                   	(bad)  
ffff80000010a3d9:	82                   	(bad)  
ffff80000010a3da:	82                   	(bad)  
ffff80000010a3db:	82                   	(bad)  
ffff80000010a3dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010a3df:	00 00                	add    %al,(%rax)
ffff80000010a3e1:	f8                   	clc    
ffff80000010a3e2:	44                   	rex.R
ffff80000010a3e3:	42                   	rex.X
ffff80000010a3e4:	42                   	rex.X
ffff80000010a3e5:	42                   	rex.X
ffff80000010a3e6:	44 78 40             	rex.R js ffff80000010a429 <font_ascii+0x549>
ffff80000010a3e9:	40                   	rex
ffff80000010a3ea:	40                   	rex
ffff80000010a3eb:	40                   	rex
ffff80000010a3ec:	40                   	rex
ffff80000010a3ed:	f0 00 00             	lock add %al,(%rax)
ffff80000010a3f0:	00 38                	add    %bh,(%rax)
ffff80000010a3f2:	44 82                	rex.R (bad) 
ffff80000010a3f4:	82                   	(bad)  
ffff80000010a3f5:	82                   	(bad)  
ffff80000010a3f6:	82                   	(bad)  
ffff80000010a3f7:	82                   	(bad)  
ffff80000010a3f8:	82                   	(bad)  
ffff80000010a3f9:	82                   	(bad)  
ffff80000010a3fa:	92                   	xchg   %eax,%edx
ffff80000010a3fb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010a3ff:	00 00                	add    %al,(%rax)
ffff80000010a401:	fc                   	cld    
ffff80000010a402:	42                   	rex.X
ffff80000010a403:	42                   	rex.X
ffff80000010a404:	42                   	rex.X
ffff80000010a405:	42 7c 44             	rex.X jl ffff80000010a44c <font_ascii+0x56c>
ffff80000010a408:	42                   	rex.X
ffff80000010a409:	42                   	rex.X
ffff80000010a40a:	42                   	rex.X
ffff80000010a40b:	42                   	rex.X
ffff80000010a40c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a40f:	00 00                	add    %al,(%rax)
ffff80000010a411:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010a414:	82                   	(bad)  
ffff80000010a415:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010a419:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010a41f:	00 00                	add    %al,(%rax)
ffff80000010a421:	fe                   	(bad)  
ffff80000010a422:	92                   	xchg   %eax,%edx
ffff80000010a423:	92                   	xchg   %eax,%edx
ffff80000010a424:	10 10                	adc    %dl,(%rax)
ffff80000010a426:	10 10                	adc    %dl,(%rax)
ffff80000010a428:	10 10                	adc    %dl,(%rax)
ffff80000010a42a:	10 10                	adc    %dl,(%rax)
ffff80000010a42c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010a430:	00 e7                	add    %ah,%bh
ffff80000010a432:	42                   	rex.X
ffff80000010a433:	42                   	rex.X
ffff80000010a434:	42                   	rex.X
ffff80000010a435:	42                   	rex.X
ffff80000010a436:	42                   	rex.X
ffff80000010a437:	42                   	rex.X
ffff80000010a438:	42                   	rex.X
ffff80000010a439:	42                   	rex.X
ffff80000010a43a:	42                   	rex.X
ffff80000010a43b:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010a43e:	00 00                	add    %al,(%rax)
ffff80000010a440:	00 e7                	add    %ah,%bh
ffff80000010a442:	42                   	rex.X
ffff80000010a443:	42                   	rex.X
ffff80000010a444:	42                   	rex.X
ffff80000010a445:	42 24 24             	rex.X and $0x24,%al
ffff80000010a448:	24 24                	and    $0x24,%al
ffff80000010a44a:	18 18                	sbb    %bl,(%rax)
ffff80000010a44c:	18 18                	sbb    %bl,(%rax)
ffff80000010a44e:	00 00                	add    %al,(%rax)
ffff80000010a450:	00 e7                	add    %ah,%bh
ffff80000010a452:	42                   	rex.X
ffff80000010a453:	42                   	rex.X
ffff80000010a454:	42 5a                	rex.X pop %rdx
ffff80000010a456:	5a                   	pop    %rdx
ffff80000010a457:	5a                   	pop    %rdx
ffff80000010a458:	5a                   	pop    %rdx
ffff80000010a459:	24 24                	and    $0x24,%al
ffff80000010a45b:	24 24                	and    $0x24,%al
ffff80000010a45d:	24 00                	and    $0x0,%al
ffff80000010a45f:	00 00                	add    %al,(%rax)
ffff80000010a461:	e7 42                	out    %eax,$0x42
ffff80000010a463:	42 24 24             	rex.X and $0x24,%al
ffff80000010a466:	24 18                	and    $0x18,%al
ffff80000010a468:	24 24                	and    $0x24,%al
ffff80000010a46a:	24 42                	and    $0x42,%al
ffff80000010a46c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010a46f:	00 00                	add    %al,(%rax)
ffff80000010a471:	ee                   	out    %al,(%dx)
ffff80000010a472:	44                   	rex.R
ffff80000010a473:	44                   	rex.R
ffff80000010a474:	44 28 28             	sub    %r13b,(%rax)
ffff80000010a477:	28 10                	sub    %dl,(%rax)
ffff80000010a479:	10 10                	adc    %dl,(%rax)
ffff80000010a47b:	10 10                	adc    %dl,(%rax)
ffff80000010a47d:	7c 00                	jl     ffff80000010a47f <font_ascii+0x59f>
ffff80000010a47f:	00 00                	add    %al,(%rax)
ffff80000010a481:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010a488:	20 20                	and    %ah,(%rax)
ffff80000010a48a:	40                   	rex
ffff80000010a48b:	42 82                	rex.X (bad) 
ffff80000010a48d:	fe 00                	incb   (%rax)
ffff80000010a48f:	00 00                	add    %al,(%rax)
ffff80000010a491:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010a494:	20 20                	and    %ah,(%rax)
ffff80000010a496:	20 20                	and    %ah,(%rax)
ffff80000010a498:	20 20                	and    %ah,(%rax)
ffff80000010a49a:	20 20                	and    %ah,(%rax)
ffff80000010a49c:	20 20                	and    %ah,(%rax)
ffff80000010a49e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010a4a5:	20 20                	and    %ah,(%rax)
ffff80000010a4a7:	10 10                	adc    %dl,(%rax)
ffff80000010a4a9:	08 08                	or     %cl,(%rax)
ffff80000010a4ab:	04 04                	add    $0x4,%al
ffff80000010a4ad:	04 02                	add    $0x2,%al
ffff80000010a4af:	02 00                	add    (%rax),%al
ffff80000010a4b1:	7c 04                	jl     ffff80000010a4b7 <font_ascii+0x5d7>
ffff80000010a4b3:	04 04                	add    $0x4,%al
ffff80000010a4b5:	04 04                	add    $0x4,%al
ffff80000010a4b7:	04 04                	add    $0x4,%al
ffff80000010a4b9:	04 04                	add    $0x4,%al
ffff80000010a4bb:	04 04                	add    $0x4,%al
ffff80000010a4bd:	04 7c                	add    $0x7c,%al
ffff80000010a4bf:	00 00                	add    %al,(%rax)
ffff80000010a4c1:	10 28                	adc    %ch,(%rax)
ffff80000010a4c3:	44 82                	rex.R (bad) 
	...
ffff80000010a4dd:	00 fe                	add    %bh,%dh
ffff80000010a4df:	00 10                	add    %dl,(%rax)
ffff80000010a4e1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010a4f4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010a4f7:	04 3c                	add    $0x3c,%al
ffff80000010a4f9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010a500:	c0 
ffff80000010a501:	40                   	rex
ffff80000010a502:	40                   	rex
ffff80000010a503:	40                   	rex
ffff80000010a504:	40 58                	rex pop %rax
ffff80000010a506:	64 42                	fs rex.X
ffff80000010a508:	42                   	rex.X
ffff80000010a509:	42                   	rex.X
ffff80000010a50a:	42                   	rex.X
ffff80000010a50b:	42                   	rex.X
ffff80000010a50c:	64 58                	fs pop %rax
ffff80000010a50e:	00 00                	add    %al,(%rax)
ffff80000010a510:	00 00                	add    %al,(%rax)
ffff80000010a512:	00 00                	add    %al,(%rax)
ffff80000010a514:	00 30                	add    %dh,(%rax)
ffff80000010a516:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010a51d:	38 
ffff80000010a51e:	00 00                	add    %al,(%rax)
ffff80000010a520:	0c 04                	or     $0x4,%al
ffff80000010a522:	04 04                	add    $0x4,%al
ffff80000010a524:	04 34                	add    $0x34,%al
ffff80000010a526:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010a52d:	36 
ffff80000010a52e:	00 00                	add    %al,(%rax)
ffff80000010a530:	00 00                	add    %al,(%rax)
ffff80000010a532:	00 00                	add    %al,(%rax)
ffff80000010a534:	00 38                	add    %bh,(%rax)
ffff80000010a536:	44 82                	rex.R (bad) 
ffff80000010a538:	82                   	(bad)  
ffff80000010a539:	fc                   	cld    
ffff80000010a53a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010a541:	10 10                	adc    %dl,(%rax)
ffff80000010a543:	10 10                	adc    %dl,(%rax)
ffff80000010a545:	7c 10                	jl     ffff80000010a557 <font_ascii+0x677>
ffff80000010a547:	10 10                	adc    %dl,(%rax)
ffff80000010a549:	10 10                	adc    %dl,(%rax)
ffff80000010a54b:	10 10                	adc    %dl,(%rax)
ffff80000010a54d:	7c 00                	jl     ffff80000010a54f <font_ascii+0x66f>
ffff80000010a54f:	00 00                	add    %al,(%rax)
ffff80000010a551:	00 00                	add    %al,(%rax)
ffff80000010a553:	00 00                	add    %al,(%rax)
ffff80000010a555:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010a55c:	34 04 
ffff80000010a55e:	04 38                	add    $0x38,%al
ffff80000010a560:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010a564:	40 58                	rex pop %rax
ffff80000010a566:	64 42                	fs rex.X
ffff80000010a568:	42                   	rex.X
ffff80000010a569:	42                   	rex.X
ffff80000010a56a:	42                   	rex.X
ffff80000010a56b:	42                   	rex.X
ffff80000010a56c:	42 e3 00             	rex.X jrcxz ffff80000010a56f <font_ascii+0x68f>
ffff80000010a56f:	00 00                	add    %al,(%rax)
ffff80000010a571:	10 10                	adc    %dl,(%rax)
ffff80000010a573:	00 00                	add    %al,(%rax)
ffff80000010a575:	30 10                	xor    %dl,(%rax)
ffff80000010a577:	10 10                	adc    %dl,(%rax)
ffff80000010a579:	10 10                	adc    %dl,(%rax)
ffff80000010a57b:	10 10                	adc    %dl,(%rax)
ffff80000010a57d:	38 00                	cmp    %al,(%rax)
ffff80000010a57f:	00 00                	add    %al,(%rax)
ffff80000010a581:	04 04                	add    $0x4,%al
ffff80000010a583:	00 00                	add    %al,(%rax)
ffff80000010a585:	0c 04                	or     $0x4,%al
ffff80000010a587:	04 04                	add    $0x4,%al
ffff80000010a589:	04 04                	add    $0x4,%al
ffff80000010a58b:	04 04                	add    $0x4,%al
ffff80000010a58d:	08 08                	or     %cl,(%rax)
ffff80000010a58f:	30 c0                	xor    %al,%al
ffff80000010a591:	40                   	rex
ffff80000010a592:	40                   	rex
ffff80000010a593:	40                   	rex
ffff80000010a594:	40                   	rex
ffff80000010a595:	4e                   	rex.WRX
ffff80000010a596:	44                   	rex.R
ffff80000010a597:	48 50                	rex.W push %rax
ffff80000010a599:	60                   	(bad)  
ffff80000010a59a:	50                   	push   %rax
ffff80000010a59b:	48                   	rex.W
ffff80000010a59c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010a59f:	00 30                	add    %dh,(%rax)
ffff80000010a5a1:	10 10                	adc    %dl,(%rax)
ffff80000010a5a3:	10 10                	adc    %dl,(%rax)
ffff80000010a5a5:	10 10                	adc    %dl,(%rax)
ffff80000010a5a7:	10 10                	adc    %dl,(%rax)
ffff80000010a5a9:	10 10                	adc    %dl,(%rax)
ffff80000010a5ab:	10 10                	adc    %dl,(%rax)
ffff80000010a5ad:	38 00                	cmp    %al,(%rax)
ffff80000010a5af:	00 00                	add    %al,(%rax)
ffff80000010a5b1:	00 00                	add    %al,(%rax)
ffff80000010a5b3:	00 00                	add    %al,(%rax)
ffff80000010a5b5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010a5b9:	49                   	rex.WB
ffff80000010a5ba:	49                   	rex.WB
ffff80000010a5bb:	49                   	rex.WB
ffff80000010a5bc:	49 db 00             	rex.WB fildl (%r8)
ffff80000010a5bf:	00 00                	add    %al,(%rax)
ffff80000010a5c1:	00 00                	add    %al,(%rax)
ffff80000010a5c3:	00 00                	add    %al,(%rax)
ffff80000010a5c5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010a5c9:	42                   	rex.X
ffff80000010a5ca:	42                   	rex.X
ffff80000010a5cb:	42                   	rex.X
ffff80000010a5cc:	42 e3 00             	rex.X jrcxz ffff80000010a5cf <font_ascii+0x6ef>
ffff80000010a5cf:	00 00                	add    %al,(%rax)
ffff80000010a5d1:	00 00                	add    %al,(%rax)
ffff80000010a5d3:	00 00                	add    %al,(%rax)
ffff80000010a5d5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010a5d9:	82                   	(bad)  
ffff80000010a5da:	82                   	(bad)  
ffff80000010a5db:	82                   	(bad)  
ffff80000010a5dc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010a5df:	00 00                	add    %al,(%rax)
ffff80000010a5e1:	00 00                	add    %al,(%rax)
ffff80000010a5e3:	00 d8                	add    %bl,%al
ffff80000010a5e5:	64 42                	fs rex.X
ffff80000010a5e7:	42                   	rex.X
ffff80000010a5e8:	42                   	rex.X
ffff80000010a5e9:	42                   	rex.X
ffff80000010a5ea:	42                   	rex.X
ffff80000010a5eb:	64 58                	fs pop %rax
ffff80000010a5ed:	40                   	rex
ffff80000010a5ee:	40 e0 00             	rex loopne ffff80000010a5f1 <font_ascii+0x711>
ffff80000010a5f1:	00 00                	add    %al,(%rax)
ffff80000010a5f3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010a5f6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010a5fd:	04 04                	add    $0x4,%al
ffff80000010a5ff:	0e                   	(bad)  
ffff80000010a600:	00 00                	add    %al,(%rax)
ffff80000010a602:	00 00                	add    %al,(%rax)
ffff80000010a604:	00 dc                	add    %bl,%ah
ffff80000010a606:	62 42                	(bad)  
ffff80000010a608:	40                   	rex
ffff80000010a609:	40                   	rex
ffff80000010a60a:	40                   	rex
ffff80000010a60b:	40                   	rex
ffff80000010a60c:	40 e0 00             	rex loopne ffff80000010a60f <font_ascii+0x72f>
ffff80000010a60f:	00 00                	add    %al,(%rax)
ffff80000010a611:	00 00                	add    %al,(%rax)
ffff80000010a613:	00 00                	add    %al,(%rax)
ffff80000010a615:	7a 86                	jp     ffff80000010a59d <font_ascii+0x6bd>
ffff80000010a617:	82                   	(bad)  
ffff80000010a618:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010a61b:	82                   	(bad)  
ffff80000010a61c:	c2 bc 00             	retq   $0xbc
ffff80000010a61f:	00 00                	add    %al,(%rax)
ffff80000010a621:	00 10                	add    %dl,(%rax)
ffff80000010a623:	10 10                	adc    %dl,(%rax)
ffff80000010a625:	7c 10                	jl     ffff80000010a637 <font_ascii+0x757>
ffff80000010a627:	10 10                	adc    %dl,(%rax)
ffff80000010a629:	10 10                	adc    %dl,(%rax)
ffff80000010a62b:	10 10                	adc    %dl,(%rax)
ffff80000010a62d:	0e                   	(bad)  
ffff80000010a62e:	00 00                	add    %al,(%rax)
ffff80000010a630:	00 00                	add    %al,(%rax)
ffff80000010a632:	00 00                	add    %al,(%rax)
ffff80000010a634:	00 c6                	add    %al,%dh
ffff80000010a636:	42                   	rex.X
ffff80000010a637:	42                   	rex.X
ffff80000010a638:	42                   	rex.X
ffff80000010a639:	42                   	rex.X
ffff80000010a63a:	42                   	rex.X
ffff80000010a63b:	42                   	rex.X
ffff80000010a63c:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010a63f:	00 00                	add    %al,(%rax)
ffff80000010a641:	00 00                	add    %al,(%rax)
ffff80000010a643:	00 00                	add    %al,(%rax)
ffff80000010a645:	e7 42                	out    %eax,$0x42
ffff80000010a647:	42                   	rex.X
ffff80000010a648:	42 24 24             	rex.X and $0x24,%al
ffff80000010a64b:	24 18                	and    $0x18,%al
ffff80000010a64d:	18 00                	sbb    %al,(%rax)
ffff80000010a64f:	00 00                	add    %al,(%rax)
ffff80000010a651:	00 00                	add    %al,(%rax)
ffff80000010a653:	00 00                	add    %al,(%rax)
ffff80000010a655:	e7 42                	out    %eax,$0x42
ffff80000010a657:	42 5a                	rex.X pop %rdx
ffff80000010a659:	5a                   	pop    %rdx
ffff80000010a65a:	5a                   	pop    %rdx
ffff80000010a65b:	24 24                	and    $0x24,%al
ffff80000010a65d:	24 00                	and    $0x0,%al
ffff80000010a65f:	00 00                	add    %al,(%rax)
ffff80000010a661:	00 00                	add    %al,(%rax)
ffff80000010a663:	00 00                	add    %al,(%rax)
ffff80000010a665:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010a66a:	28 28                	sub    %ch,(%rax)
ffff80000010a66c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010a670:	00 00                	add    %al,(%rax)
ffff80000010a672:	00 00                	add    %al,(%rax)
ffff80000010a674:	00 e7                	add    %ah,%bh
ffff80000010a676:	42                   	rex.X
ffff80000010a677:	42 24 24             	rex.X and $0x24,%al
ffff80000010a67a:	24 18                	and    $0x18,%al
ffff80000010a67c:	18 10                	sbb    %dl,(%rax)
ffff80000010a67e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010a681:	00 00                	add    %al,(%rax)
ffff80000010a683:	00 00                	add    %al,(%rax)
ffff80000010a685:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010a68b:	42 82                	rex.X (bad) 
ffff80000010a68d:	fe 00                	incb   (%rax)
ffff80000010a68f:	00 00                	add    %al,(%rax)
ffff80000010a691:	06                   	(bad)  
ffff80000010a692:	08 10                	or     %dl,(%rax)
ffff80000010a694:	10 10                	adc    %dl,(%rax)
ffff80000010a696:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010a699:	10 10                	adc    %dl,(%rax)
ffff80000010a69b:	10 08                	adc    %cl,(%rax)
ffff80000010a69d:	06                   	(bad)  
ffff80000010a69e:	00 00                	add    %al,(%rax)
ffff80000010a6a0:	10 10                	adc    %dl,(%rax)
ffff80000010a6a2:	10 10                	adc    %dl,(%rax)
ffff80000010a6a4:	10 10                	adc    %dl,(%rax)
ffff80000010a6a6:	10 10                	adc    %dl,(%rax)
ffff80000010a6a8:	10 10                	adc    %dl,(%rax)
ffff80000010a6aa:	10 10                	adc    %dl,(%rax)
ffff80000010a6ac:	10 10                	adc    %dl,(%rax)
ffff80000010a6ae:	10 10                	adc    %dl,(%rax)
ffff80000010a6b0:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010a6b3:	08 08                	or     %cl,(%rax)
ffff80000010a6b5:	08 08                	or     %cl,(%rax)
ffff80000010a6b7:	06                   	(bad)  
ffff80000010a6b8:	08 08                	or     %cl,(%rax)
ffff80000010a6ba:	08 08                	or     %cl,(%rax)
ffff80000010a6bc:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010a6bf:	00 00                	add    %al,(%rax)
ffff80000010a6c1:	72 8c                	jb     ffff80000010a64f <font_ascii+0x76f>
	...

ffff80000010aee0 <init_thread>:
ffff80000010aee0:	00 00                	add    %al,(%rax)
ffff80000010aee2:	12 00                	adc    (%rax),%al
ffff80000010aee4:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010aef2:	12 00                	adc    (%rax),%al
ffff80000010aef4:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000010aefa:	00 00                	add    %al,(%rax)
ffff80000010aefc:	00 00                	add    %al,(%rax)
ffff80000010aefe:	00 00                	add    %al,(%rax)
ffff80000010af00:	10 00                	adc    %al,(%rax)
	...

ffff80000010af20 <init_task>:
ffff80000010af20:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff80000010af26:	ff                   	(bad)  
ffff80000010af27:	ff 00                	incl   (%rax)
	...

ffff80000010af60 <init_tss>:
ffff80000010af60:	00 00                	add    %al,(%rax)
ffff80000010af62:	00 00                	add    %al,(%rax)
ffff80000010af64:	00 00                	add    %al,(%rax)
ffff80000010af66:	12 00                	adc    (%rax),%al
ffff80000010af68:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010af6e:	12 00                	adc    (%rax),%al
ffff80000010af70:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010af76:	12 00                	adc    (%rax),%al
ffff80000010af78:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010af7e:	00 00                	add    %al,(%rax)
ffff80000010af80:	00 00                	add    %al,(%rax)
ffff80000010af82:	00 00                	add    %al,(%rax)
ffff80000010af84:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010af88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010af8e:	00 00                	add    %al,(%rax)
ffff80000010af90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010af96:	00 00                	add    %al,(%rax)
ffff80000010af98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010af9e:	00 00                	add    %al,(%rax)
ffff80000010afa0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010afa6:	00 00                	add    %al,(%rax)
ffff80000010afa8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010afae:	00 00                	add    %al,(%rax)
ffff80000010afb0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010afb6:	00 00                	add    %al,(%rax)
ffff80000010afb8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010afce:	12 00                	adc    (%rax),%al
ffff80000010afd0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010afd6:	12 00                	adc    (%rax),%al
ffff80000010afd8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010afde:	12 00                	adc    (%rax),%al
ffff80000010afe0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010afe6:	00 00                	add    %al,(%rax)
ffff80000010afe8:	00 00                	add    %al,(%rax)
ffff80000010afea:	00 00                	add    %al,(%rax)
ffff80000010afec:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010aff0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010aff6:	00 00                	add    %al,(%rax)
ffff80000010aff8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010affe:	00 00                	add    %al,(%rax)
ffff80000010b000:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b006:	00 00                	add    %al,(%rax)
ffff80000010b008:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b00e:	00 00                	add    %al,(%rax)
ffff80000010b010:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b016:	00 00                	add    %al,(%rax)
ffff80000010b018:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b01e:	00 00                	add    %al,(%rax)
ffff80000010b020:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b036:	12 00                	adc    (%rax),%al
ffff80000010b038:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b03e:	12 00                	adc    (%rax),%al
ffff80000010b040:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b046:	12 00                	adc    (%rax),%al
ffff80000010b048:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b04e:	00 00                	add    %al,(%rax)
ffff80000010b050:	00 00                	add    %al,(%rax)
ffff80000010b052:	00 00                	add    %al,(%rax)
ffff80000010b054:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b058:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b05e:	00 00                	add    %al,(%rax)
ffff80000010b060:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b066:	00 00                	add    %al,(%rax)
ffff80000010b068:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b06e:	00 00                	add    %al,(%rax)
ffff80000010b070:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b076:	00 00                	add    %al,(%rax)
ffff80000010b078:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b07e:	00 00                	add    %al,(%rax)
ffff80000010b080:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b086:	00 00                	add    %al,(%rax)
ffff80000010b088:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b09e:	12 00                	adc    (%rax),%al
ffff80000010b0a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b0a6:	12 00                	adc    (%rax),%al
ffff80000010b0a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b0ae:	12 00                	adc    (%rax),%al
ffff80000010b0b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b0b6:	00 00                	add    %al,(%rax)
ffff80000010b0b8:	00 00                	add    %al,(%rax)
ffff80000010b0ba:	00 00                	add    %al,(%rax)
ffff80000010b0bc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b0c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0c6:	00 00                	add    %al,(%rax)
ffff80000010b0c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0ce:	00 00                	add    %al,(%rax)
ffff80000010b0d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0d6:	00 00                	add    %al,(%rax)
ffff80000010b0d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0de:	00 00                	add    %al,(%rax)
ffff80000010b0e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0e6:	00 00                	add    %al,(%rax)
ffff80000010b0e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b0ee:	00 00                	add    %al,(%rax)
ffff80000010b0f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b106:	12 00                	adc    (%rax),%al
ffff80000010b108:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b10e:	12 00                	adc    (%rax),%al
ffff80000010b110:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b116:	12 00                	adc    (%rax),%al
ffff80000010b118:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b11e:	00 00                	add    %al,(%rax)
ffff80000010b120:	00 00                	add    %al,(%rax)
ffff80000010b122:	00 00                	add    %al,(%rax)
ffff80000010b124:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b128:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b12e:	00 00                	add    %al,(%rax)
ffff80000010b130:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b136:	00 00                	add    %al,(%rax)
ffff80000010b138:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b13e:	00 00                	add    %al,(%rax)
ffff80000010b140:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b146:	00 00                	add    %al,(%rax)
ffff80000010b148:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b14e:	00 00                	add    %al,(%rax)
ffff80000010b150:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b156:	00 00                	add    %al,(%rax)
ffff80000010b158:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b16e:	12 00                	adc    (%rax),%al
ffff80000010b170:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b176:	12 00                	adc    (%rax),%al
ffff80000010b178:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b17e:	12 00                	adc    (%rax),%al
ffff80000010b180:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b186:	00 00                	add    %al,(%rax)
ffff80000010b188:	00 00                	add    %al,(%rax)
ffff80000010b18a:	00 00                	add    %al,(%rax)
ffff80000010b18c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b190:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b196:	00 00                	add    %al,(%rax)
ffff80000010b198:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b19e:	00 00                	add    %al,(%rax)
ffff80000010b1a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b1a6:	00 00                	add    %al,(%rax)
ffff80000010b1a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b1ae:	00 00                	add    %al,(%rax)
ffff80000010b1b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b1b6:	00 00                	add    %al,(%rax)
ffff80000010b1b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b1be:	00 00                	add    %al,(%rax)
ffff80000010b1c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b1d6:	12 00                	adc    (%rax),%al
ffff80000010b1d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b1de:	12 00                	adc    (%rax),%al
ffff80000010b1e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b1e6:	12 00                	adc    (%rax),%al
ffff80000010b1e8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b1ee:	00 00                	add    %al,(%rax)
ffff80000010b1f0:	00 00                	add    %al,(%rax)
ffff80000010b1f2:	00 00                	add    %al,(%rax)
ffff80000010b1f4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b1f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b1fe:	00 00                	add    %al,(%rax)
ffff80000010b200:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b206:	00 00                	add    %al,(%rax)
ffff80000010b208:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b20e:	00 00                	add    %al,(%rax)
ffff80000010b210:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b216:	00 00                	add    %al,(%rax)
ffff80000010b218:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b21e:	00 00                	add    %al,(%rax)
ffff80000010b220:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b226:	00 00                	add    %al,(%rax)
ffff80000010b228:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b23e:	12 00                	adc    (%rax),%al
ffff80000010b240:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b246:	12 00                	adc    (%rax),%al
ffff80000010b248:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b24e:	12 00                	adc    (%rax),%al
ffff80000010b250:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000010b256:	00 00                	add    %al,(%rax)
ffff80000010b258:	00 00                	add    %al,(%rax)
ffff80000010b25a:	00 00                	add    %al,(%rax)
ffff80000010b25c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff80000010b260:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b266:	00 00                	add    %al,(%rax)
ffff80000010b268:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b26e:	00 00                	add    %al,(%rax)
ffff80000010b270:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b276:	00 00                	add    %al,(%rax)
ffff80000010b278:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b27e:	00 00                	add    %al,(%rax)
ffff80000010b280:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b286:	00 00                	add    %al,(%rax)
ffff80000010b288:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000010b28e:	00 00                	add    %al,(%rax)
ffff80000010b290:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

ffff80000010b2a0 <system_call_table>:
ffff80000010b2a0:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff80000010b2a4:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff80000010b2aa:	10 00                	adc    %al,(%rax)
ffff80000010b2ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2b2:	10 00                	adc    %al,(%rax)
ffff80000010b2b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2ba:	10 00                	adc    %al,(%rax)
ffff80000010b2bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2c2:	10 00                	adc    %al,(%rax)
ffff80000010b2c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2ca:	10 00                	adc    %al,(%rax)
ffff80000010b2cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2d2:	10 00                	adc    %al,(%rax)
ffff80000010b2d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2da:	10 00                	adc    %al,(%rax)
ffff80000010b2dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2e2:	10 00                	adc    %al,(%rax)
ffff80000010b2e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2ea:	10 00                	adc    %al,(%rax)
ffff80000010b2ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2f2:	10 00                	adc    %al,(%rax)
ffff80000010b2f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b2fa:	10 00                	adc    %al,(%rax)
ffff80000010b2fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b302:	10 00                	adc    %al,(%rax)
ffff80000010b304:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b30a:	10 00                	adc    %al,(%rax)
ffff80000010b30c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b312:	10 00                	adc    %al,(%rax)
ffff80000010b314:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b31a:	10 00                	adc    %al,(%rax)
ffff80000010b31c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b322:	10 00                	adc    %al,(%rax)
ffff80000010b324:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b32a:	10 00                	adc    %al,(%rax)
ffff80000010b32c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b332:	10 00                	adc    %al,(%rax)
ffff80000010b334:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b33a:	10 00                	adc    %al,(%rax)
ffff80000010b33c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b342:	10 00                	adc    %al,(%rax)
ffff80000010b344:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b34a:	10 00                	adc    %al,(%rax)
ffff80000010b34c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b352:	10 00                	adc    %al,(%rax)
ffff80000010b354:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b35a:	10 00                	adc    %al,(%rax)
ffff80000010b35c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b362:	10 00                	adc    %al,(%rax)
ffff80000010b364:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b36a:	10 00                	adc    %al,(%rax)
ffff80000010b36c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b372:	10 00                	adc    %al,(%rax)
ffff80000010b374:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b37a:	10 00                	adc    %al,(%rax)
ffff80000010b37c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b382:	10 00                	adc    %al,(%rax)
ffff80000010b384:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b38a:	10 00                	adc    %al,(%rax)
ffff80000010b38c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b392:	10 00                	adc    %al,(%rax)
ffff80000010b394:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b39a:	10 00                	adc    %al,(%rax)
ffff80000010b39c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3a2:	10 00                	adc    %al,(%rax)
ffff80000010b3a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3aa:	10 00                	adc    %al,(%rax)
ffff80000010b3ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3b2:	10 00                	adc    %al,(%rax)
ffff80000010b3b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3ba:	10 00                	adc    %al,(%rax)
ffff80000010b3bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3c2:	10 00                	adc    %al,(%rax)
ffff80000010b3c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3ca:	10 00                	adc    %al,(%rax)
ffff80000010b3cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3d2:	10 00                	adc    %al,(%rax)
ffff80000010b3d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3da:	10 00                	adc    %al,(%rax)
ffff80000010b3dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3e2:	10 00                	adc    %al,(%rax)
ffff80000010b3e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3ea:	10 00                	adc    %al,(%rax)
ffff80000010b3ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3f2:	10 00                	adc    %al,(%rax)
ffff80000010b3f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b3fa:	10 00                	adc    %al,(%rax)
ffff80000010b3fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b402:	10 00                	adc    %al,(%rax)
ffff80000010b404:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b40a:	10 00                	adc    %al,(%rax)
ffff80000010b40c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b412:	10 00                	adc    %al,(%rax)
ffff80000010b414:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b41a:	10 00                	adc    %al,(%rax)
ffff80000010b41c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b422:	10 00                	adc    %al,(%rax)
ffff80000010b424:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b42a:	10 00                	adc    %al,(%rax)
ffff80000010b42c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b432:	10 00                	adc    %al,(%rax)
ffff80000010b434:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b43a:	10 00                	adc    %al,(%rax)
ffff80000010b43c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b442:	10 00                	adc    %al,(%rax)
ffff80000010b444:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b44a:	10 00                	adc    %al,(%rax)
ffff80000010b44c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b452:	10 00                	adc    %al,(%rax)
ffff80000010b454:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b45a:	10 00                	adc    %al,(%rax)
ffff80000010b45c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b462:	10 00                	adc    %al,(%rax)
ffff80000010b464:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b46a:	10 00                	adc    %al,(%rax)
ffff80000010b46c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b472:	10 00                	adc    %al,(%rax)
ffff80000010b474:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b47a:	10 00                	adc    %al,(%rax)
ffff80000010b47c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b482:	10 00                	adc    %al,(%rax)
ffff80000010b484:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b48a:	10 00                	adc    %al,(%rax)
ffff80000010b48c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b492:	10 00                	adc    %al,(%rax)
ffff80000010b494:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b49a:	10 00                	adc    %al,(%rax)
ffff80000010b49c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4a2:	10 00                	adc    %al,(%rax)
ffff80000010b4a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4aa:	10 00                	adc    %al,(%rax)
ffff80000010b4ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4b2:	10 00                	adc    %al,(%rax)
ffff80000010b4b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4ba:	10 00                	adc    %al,(%rax)
ffff80000010b4bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4c2:	10 00                	adc    %al,(%rax)
ffff80000010b4c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4ca:	10 00                	adc    %al,(%rax)
ffff80000010b4cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4d2:	10 00                	adc    %al,(%rax)
ffff80000010b4d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4da:	10 00                	adc    %al,(%rax)
ffff80000010b4dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4e2:	10 00                	adc    %al,(%rax)
ffff80000010b4e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4ea:	10 00                	adc    %al,(%rax)
ffff80000010b4ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4f2:	10 00                	adc    %al,(%rax)
ffff80000010b4f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b4fa:	10 00                	adc    %al,(%rax)
ffff80000010b4fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b502:	10 00                	adc    %al,(%rax)
ffff80000010b504:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b50a:	10 00                	adc    %al,(%rax)
ffff80000010b50c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b512:	10 00                	adc    %al,(%rax)
ffff80000010b514:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b51a:	10 00                	adc    %al,(%rax)
ffff80000010b51c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b522:	10 00                	adc    %al,(%rax)
ffff80000010b524:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b52a:	10 00                	adc    %al,(%rax)
ffff80000010b52c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b532:	10 00                	adc    %al,(%rax)
ffff80000010b534:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b53a:	10 00                	adc    %al,(%rax)
ffff80000010b53c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b542:	10 00                	adc    %al,(%rax)
ffff80000010b544:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b54a:	10 00                	adc    %al,(%rax)
ffff80000010b54c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b552:	10 00                	adc    %al,(%rax)
ffff80000010b554:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b55a:	10 00                	adc    %al,(%rax)
ffff80000010b55c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b562:	10 00                	adc    %al,(%rax)
ffff80000010b564:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b56a:	10 00                	adc    %al,(%rax)
ffff80000010b56c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b572:	10 00                	adc    %al,(%rax)
ffff80000010b574:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b57a:	10 00                	adc    %al,(%rax)
ffff80000010b57c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b582:	10 00                	adc    %al,(%rax)
ffff80000010b584:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b58a:	10 00                	adc    %al,(%rax)
ffff80000010b58c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b592:	10 00                	adc    %al,(%rax)
ffff80000010b594:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b59a:	10 00                	adc    %al,(%rax)
ffff80000010b59c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5a2:	10 00                	adc    %al,(%rax)
ffff80000010b5a4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5aa:	10 00                	adc    %al,(%rax)
ffff80000010b5ac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5b2:	10 00                	adc    %al,(%rax)
ffff80000010b5b4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5ba:	10 00                	adc    %al,(%rax)
ffff80000010b5bc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5c2:	10 00                	adc    %al,(%rax)
ffff80000010b5c4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5ca:	10 00                	adc    %al,(%rax)
ffff80000010b5cc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5d2:	10 00                	adc    %al,(%rax)
ffff80000010b5d4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5da:	10 00                	adc    %al,(%rax)
ffff80000010b5dc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5e2:	10 00                	adc    %al,(%rax)
ffff80000010b5e4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5ea:	10 00                	adc    %al,(%rax)
ffff80000010b5ec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5f2:	10 00                	adc    %al,(%rax)
ffff80000010b5f4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b5fa:	10 00                	adc    %al,(%rax)
ffff80000010b5fc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b602:	10 00                	adc    %al,(%rax)
ffff80000010b604:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b60a:	10 00                	adc    %al,(%rax)
ffff80000010b60c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b612:	10 00                	adc    %al,(%rax)
ffff80000010b614:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b61a:	10 00                	adc    %al,(%rax)
ffff80000010b61c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b622:	10 00                	adc    %al,(%rax)
ffff80000010b624:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b62a:	10 00                	adc    %al,(%rax)
ffff80000010b62c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b632:	10 00                	adc    %al,(%rax)
ffff80000010b634:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b63a:	10 00                	adc    %al,(%rax)
ffff80000010b63c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b642:	10 00                	adc    %al,(%rax)
ffff80000010b644:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b64a:	10 00                	adc    %al,(%rax)
ffff80000010b64c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b652:	10 00                	adc    %al,(%rax)
ffff80000010b654:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b65a:	10 00                	adc    %al,(%rax)
ffff80000010b65c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b662:	10 00                	adc    %al,(%rax)
ffff80000010b664:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b66a:	10 00                	adc    %al,(%rax)
ffff80000010b66c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b672:	10 00                	adc    %al,(%rax)
ffff80000010b674:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b67a:	10 00                	adc    %al,(%rax)
ffff80000010b67c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b682:	10 00                	adc    %al,(%rax)
ffff80000010b684:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b68a:	10 00                	adc    %al,(%rax)
ffff80000010b68c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b692:	10 00                	adc    %al,(%rax)
ffff80000010b694:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff80000010b69a:	10 00                	adc    %al,(%rax)
ffff80000010b69c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010b8ae:	00 00                	add    %al,(%rax)
ffff80000010b8b0:	00 10                	add    %dl,(%rax)
ffff80000010b8b2:	10 10                	adc    %dl,(%rax)
ffff80000010b8b4:	10 10                	adc    %dl,(%rax)
ffff80000010b8b6:	10 10                	adc    %dl,(%rax)
ffff80000010b8b8:	10 10                	adc    %dl,(%rax)
ffff80000010b8ba:	00 00                	add    %al,(%rax)
ffff80000010b8bc:	10 10                	adc    %dl,(%rax)
ffff80000010b8be:	00 00                	add    %al,(%rax)
ffff80000010b8c0:	28 28                	sub    %ch,(%rax)
ffff80000010b8c2:	28 00                	sub    %al,(%rax)
	...
ffff80000010b8d0:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010b8d4:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010b8d8:	44                   	rex.R
ffff80000010b8d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010b8de:	00 00                	add    %al,(%rax)
ffff80000010b8e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010b8e2:	56                   	push   %rsi
ffff80000010b8e3:	92                   	xchg   %eax,%edx
ffff80000010b8e4:	92                   	xchg   %eax,%edx
ffff80000010b8e5:	90                   	nop
ffff80000010b8e6:	50                   	push   %rax
ffff80000010b8e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010b8ea:	92                   	xchg   %eax,%edx
ffff80000010b8eb:	92                   	xchg   %eax,%edx
ffff80000010b8ec:	d4                   	(bad)  
ffff80000010b8ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010b8f2:	94                   	xchg   %eax,%esp
ffff80000010b8f3:	94                   	xchg   %eax,%esp
ffff80000010b8f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010b8f9:	2c 52                	sub    $0x52,%al
ffff80000010b8fb:	52                   	push   %rdx
ffff80000010b8fc:	92                   	xchg   %eax,%edx
ffff80000010b8fd:	8c 00                	mov    %es,(%rax)
ffff80000010b8ff:	00 00                	add    %al,(%rax)
ffff80000010b901:	70 88                	jo     ffff80000010b88b <system_call_table+0x5eb>
ffff80000010b903:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010b909:	92                   	xchg   %eax,%edx
ffff80000010b90a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010b911:	08 10                	or     %dl,(%rax)
	...
ffff80000010b91f:	00 02                	add    %al,(%rdx)
ffff80000010b921:	04 08                	add    $0x8,%al
ffff80000010b923:	08 10                	or     %dl,(%rax)
ffff80000010b925:	10 10                	adc    %dl,(%rax)
ffff80000010b927:	10 10                	adc    %dl,(%rax)
ffff80000010b929:	10 10                	adc    %dl,(%rax)
ffff80000010b92b:	08 08                	or     %cl,(%rax)
ffff80000010b92d:	04 02                	add    $0x2,%al
ffff80000010b92f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010b935:	10 10                	adc    %dl,(%rax)
ffff80000010b937:	10 10                	adc    %dl,(%rax)
ffff80000010b939:	10 10                	adc    %dl,(%rax)
ffff80000010b93b:	20 20                	and    %ah,(%rax)
ffff80000010b93d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010b941:	00 00                	add    %al,(%rax)
ffff80000010b943:	00 00                	add    %al,(%rax)
ffff80000010b945:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010b94b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b955:	10 10                	adc    %dl,(%rax)
ffff80000010b957:	10 fe                	adc    %bh,%dh
ffff80000010b959:	10 10                	adc    %dl,(%rax)
ffff80000010b95b:	10 00                	adc    %al,(%rax)
	...
ffff80000010b969:	00 00                	add    %al,(%rax)
ffff80000010b96b:	18 18                	sbb    %bl,(%rax)
ffff80000010b96d:	08 08                	or     %cl,(%rax)
ffff80000010b96f:	10 00                	adc    %al,(%rax)
ffff80000010b971:	00 00                	add    %al,(%rax)
ffff80000010b973:	00 00                	add    %al,(%rax)
ffff80000010b975:	00 00                	add    %al,(%rax)
ffff80000010b977:	00 fe                	add    %bh,%dh
	...
ffff80000010b989:	00 00                	add    %al,(%rax)
ffff80000010b98b:	00 18                	add    %bl,(%rax)
ffff80000010b98d:	18 00                	sbb    %al,(%rax)
ffff80000010b98f:	00 02                	add    %al,(%rdx)
ffff80000010b991:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010b994:	08 08                	or     %cl,(%rax)
ffff80000010b996:	08 10                	or     %dl,(%rax)
ffff80000010b998:	10 20                	adc    %ah,(%rax)
ffff80000010b99a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b99d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010b9a4:	42 
ffff80000010b9a5:	42                   	rex.X
ffff80000010b9a6:	42                   	rex.X
ffff80000010b9a7:	42                   	rex.X
ffff80000010b9a8:	42                   	rex.X
ffff80000010b9a9:	42                   	rex.X
ffff80000010b9aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010b9ad:	18 00                	sbb    %al,(%rax)
ffff80000010b9af:	00 00                	add    %al,(%rax)
ffff80000010b9b1:	08 18                	or     %bl,(%rax)
ffff80000010b9b3:	28 08                	sub    %cl,(%rax)
ffff80000010b9b5:	08 08                	or     %cl,(%rax)
ffff80000010b9b7:	08 08                	or     %cl,(%rax)
ffff80000010b9b9:	08 08                	or     %cl,(%rax)
ffff80000010b9bb:	08 08                	or     %cl,(%rax)
ffff80000010b9bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010b9c0:	00 18                	add    %bl,(%rax)
ffff80000010b9c2:	24 42                	and    $0x42,%al
ffff80000010b9c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010b9c8:	10 20                	adc    %ah,(%rax)
ffff80000010b9ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010b9cd:	7e 00                	jle    ffff80000010b9cf <system_call_table+0x72f>
ffff80000010b9cf:	00 00                	add    %al,(%rax)
ffff80000010b9d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010b9d4:	02 02                	add    (%rdx),%al
ffff80000010b9d6:	04 18                	add    $0x18,%al
ffff80000010b9d8:	04 02                	add    $0x2,%al
ffff80000010b9da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010b9dd:	18 00                	sbb    %al,(%rax)
ffff80000010b9df:	00 00                	add    %al,(%rax)
ffff80000010b9e1:	0c 0c                	or     $0xc,%al
ffff80000010b9e3:	0c 14                	or     $0x14,%al
ffff80000010b9e5:	14 14                	adc    $0x14,%al
ffff80000010b9e7:	24 24                	and    $0x24,%al
ffff80000010b9e9:	44 7e 04             	rex.R jle ffff80000010b9f0 <system_call_table+0x750>
ffff80000010b9ec:	04 1e                	add    $0x1e,%al
ffff80000010b9ee:	00 00                	add    %al,(%rax)
ffff80000010b9f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010b9f4:	40 58                	rex pop %rax
ffff80000010b9f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010b9f9:	02 02                	add    (%rdx),%al
ffff80000010b9fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010b9fe:	00 00                	add    %al,(%rax)
ffff80000010ba00:	00 18                	add    %bl,(%rax)
ffff80000010ba02:	24 42                	and    $0x42,%al
ffff80000010ba04:	40 58                	rex pop %rax
ffff80000010ba06:	64 42                	fs rex.X
ffff80000010ba08:	42                   	rex.X
ffff80000010ba09:	42                   	rex.X
ffff80000010ba0a:	42                   	rex.X
ffff80000010ba0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ba0e:	00 00                	add    %al,(%rax)
ffff80000010ba10:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010ba13:	42 04 04             	rex.X add $0x4,%al
ffff80000010ba16:	08 08                	or     %cl,(%rax)
ffff80000010ba18:	08 10                	or     %dl,(%rax)
ffff80000010ba1a:	10 10                	adc    %dl,(%rax)
ffff80000010ba1c:	10 38                	adc    %bh,(%rax)
ffff80000010ba1e:	00 00                	add    %al,(%rax)
ffff80000010ba20:	00 18                	add    %bl,(%rax)
ffff80000010ba22:	24 42                	and    $0x42,%al
ffff80000010ba24:	42                   	rex.X
ffff80000010ba25:	42 24 18             	rex.X and $0x18,%al
ffff80000010ba28:	24 42                	and    $0x42,%al
ffff80000010ba2a:	42                   	rex.X
ffff80000010ba2b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ba2e:	00 00                	add    %al,(%rax)
ffff80000010ba30:	00 18                	add    %bl,(%rax)
ffff80000010ba32:	24 42                	and    $0x42,%al
ffff80000010ba34:	42                   	rex.X
ffff80000010ba35:	42                   	rex.X
ffff80000010ba36:	42                   	rex.X
ffff80000010ba37:	42                   	rex.X
ffff80000010ba38:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010ba3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ba3e:	00 00                	add    %al,(%rax)
ffff80000010ba40:	00 00                	add    %al,(%rax)
ffff80000010ba42:	00 00                	add    %al,(%rax)
ffff80000010ba44:	00 18                	add    %bl,(%rax)
ffff80000010ba46:	18 00                	sbb    %al,(%rax)
ffff80000010ba48:	00 00                	add    %al,(%rax)
ffff80000010ba4a:	00 00                	add    %al,(%rax)
ffff80000010ba4c:	18 18                	sbb    %bl,(%rax)
ffff80000010ba4e:	00 00                	add    %al,(%rax)
ffff80000010ba50:	00 00                	add    %al,(%rax)
ffff80000010ba52:	00 00                	add    %al,(%rax)
ffff80000010ba54:	00 18                	add    %bl,(%rax)
ffff80000010ba56:	18 00                	sbb    %al,(%rax)
ffff80000010ba58:	00 00                	add    %al,(%rax)
ffff80000010ba5a:	00 18                	add    %bl,(%rax)
ffff80000010ba5c:	18 08                	sbb    %cl,(%rax)
ffff80000010ba5e:	08 10                	or     %dl,(%rax)
ffff80000010ba60:	00 02                	add    %al,(%rdx)
ffff80000010ba62:	04 08                	add    $0x8,%al
ffff80000010ba64:	10 20                	adc    %ah,(%rax)
ffff80000010ba66:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ba6d:	04 
ffff80000010ba6e:	02 00                	add    (%rax),%al
ffff80000010ba70:	00 00                	add    %al,(%rax)
ffff80000010ba72:	00 00                	add    %al,(%rax)
ffff80000010ba74:	00 00                	add    %al,(%rax)
ffff80000010ba76:	fe 00                	incb   (%rax)
ffff80000010ba78:	00 fe                	add    %bh,%dh
ffff80000010ba7a:	00 00                	add    %al,(%rax)
ffff80000010ba7c:	00 00                	add    %al,(%rax)
ffff80000010ba7e:	00 00                	add    %al,(%rax)
ffff80000010ba80:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ba86:	04 02                	add    $0x2,%al
ffff80000010ba88:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ba8b:	10 20                	adc    %ah,(%rax)
ffff80000010ba8d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ba91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ba95:	82                   	(bad)  
ffff80000010ba96:	04 08                	add    $0x8,%al
ffff80000010ba98:	10 10                	adc    %dl,(%rax)
ffff80000010ba9a:	00 00                	add    %al,(%rax)
ffff80000010ba9c:	18 18                	sbb    %bl,(%rax)
ffff80000010ba9e:	00 00                	add    %al,(%rax)
ffff80000010baa0:	00 38                	add    %bh,(%rax)
ffff80000010baa2:	44 82                	rex.R (bad) 
ffff80000010baa4:	9a                   	(bad)  
ffff80000010baa5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010baa6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010baa7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010baa8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010baa9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010baaa:	9c                   	pushfq 
ffff80000010baab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010baaf:	00 00                	add    %al,(%rax)
ffff80000010bab1:	18 18                	sbb    %bl,(%rax)
ffff80000010bab3:	18 18                	sbb    %bl,(%rax)
ffff80000010bab5:	24 24                	and    $0x24,%al
ffff80000010bab7:	24 24                	and    $0x24,%al
ffff80000010bab9:	7e 42                	jle    ffff80000010bafd <system_call_table+0x85d>
ffff80000010babb:	42                   	rex.X
ffff80000010babc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010babf:	00 00                	add    %al,(%rax)
ffff80000010bac1:	f0 48                	lock rex.W
ffff80000010bac3:	44                   	rex.R
ffff80000010bac4:	44                   	rex.R
ffff80000010bac5:	44                   	rex.R
ffff80000010bac6:	48 78 44             	rex.W js ffff80000010bb0d <system_call_table+0x86d>
ffff80000010bac9:	42                   	rex.X
ffff80000010baca:	42                   	rex.X
ffff80000010bacb:	42                   	rex.X
ffff80000010bacc:	44 f8                	rex.R clc 
ffff80000010bace:	00 00                	add    %al,(%rax)
ffff80000010bad0:	00 3a                	add    %bh,(%rdx)
ffff80000010bad2:	46                   	rex.RX
ffff80000010bad3:	42 82                	rex.X (bad) 
ffff80000010bad5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010badc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010badf:	00 00                	add    %al,(%rax)
ffff80000010bae1:	f8                   	clc    
ffff80000010bae2:	44                   	rex.R
ffff80000010bae3:	44                   	rex.R
ffff80000010bae4:	42                   	rex.X
ffff80000010bae5:	42                   	rex.X
ffff80000010bae6:	42                   	rex.X
ffff80000010bae7:	42                   	rex.X
ffff80000010bae8:	42                   	rex.X
ffff80000010bae9:	42                   	rex.X
ffff80000010baea:	42                   	rex.X
ffff80000010baeb:	44                   	rex.R
ffff80000010baec:	44 f8                	rex.R clc 
ffff80000010baee:	00 00                	add    %al,(%rax)
ffff80000010baf0:	00 fe                	add    %bh,%dh
ffff80000010baf2:	42                   	rex.X
ffff80000010baf3:	42                   	rex.X
ffff80000010baf4:	40                   	rex
ffff80000010baf5:	40                   	rex
ffff80000010baf6:	44 7c 44             	rex.R jl ffff80000010bb3d <system_call_table+0x89d>
ffff80000010baf9:	40                   	rex
ffff80000010bafa:	40                   	rex
ffff80000010bafb:	42                   	rex.X
ffff80000010bafc:	42 fe 00             	rex.X incb (%rax)
ffff80000010baff:	00 00                	add    %al,(%rax)
ffff80000010bb01:	fe 42 42             	incb   0x42(%rdx)
ffff80000010bb04:	40                   	rex
ffff80000010bb05:	40                   	rex
ffff80000010bb06:	44 7c 44             	rex.R jl ffff80000010bb4d <system_call_table+0x8ad>
ffff80000010bb09:	44                   	rex.R
ffff80000010bb0a:	40                   	rex
ffff80000010bb0b:	40                   	rex
ffff80000010bb0c:	40                   	rex
ffff80000010bb0d:	f0 00 00             	lock add %al,(%rax)
ffff80000010bb10:	00 3a                	add    %bh,(%rdx)
ffff80000010bb12:	46                   	rex.RX
ffff80000010bb13:	42 82                	rex.X (bad) 
ffff80000010bb15:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010bb1c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010bb1f:	00 00                	add    %al,(%rax)
ffff80000010bb21:	e7 42                	out    %eax,$0x42
ffff80000010bb23:	42                   	rex.X
ffff80000010bb24:	42                   	rex.X
ffff80000010bb25:	42                   	rex.X
ffff80000010bb26:	42 7e 42             	rex.X jle ffff80000010bb6b <system_call_table+0x8cb>
ffff80000010bb29:	42                   	rex.X
ffff80000010bb2a:	42                   	rex.X
ffff80000010bb2b:	42                   	rex.X
ffff80000010bb2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010bb2f:	00 00                	add    %al,(%rax)
ffff80000010bb31:	7c 10                	jl     ffff80000010bb43 <system_call_table+0x8a3>
ffff80000010bb33:	10 10                	adc    %dl,(%rax)
ffff80000010bb35:	10 10                	adc    %dl,(%rax)
ffff80000010bb37:	10 10                	adc    %dl,(%rax)
ffff80000010bb39:	10 10                	adc    %dl,(%rax)
ffff80000010bb3b:	10 10                	adc    %dl,(%rax)
ffff80000010bb3d:	7c 00                	jl     ffff80000010bb3f <system_call_table+0x89f>
ffff80000010bb3f:	00 00                	add    %al,(%rax)
ffff80000010bb41:	1f                   	(bad)  
ffff80000010bb42:	04 04                	add    $0x4,%al
ffff80000010bb44:	04 04                	add    $0x4,%al
ffff80000010bb46:	04 04                	add    $0x4,%al
ffff80000010bb48:	04 04                	add    $0x4,%al
ffff80000010bb4a:	04 04                	add    $0x4,%al
ffff80000010bb4c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010bb4f:	00 00                	add    %al,(%rax)
ffff80000010bb51:	e7 42                	out    %eax,$0x42
ffff80000010bb53:	44                   	rex.R
ffff80000010bb54:	48 50                	rex.W push %rax
ffff80000010bb56:	50                   	push   %rax
ffff80000010bb57:	60                   	(bad)  
ffff80000010bb58:	50                   	push   %rax
ffff80000010bb59:	50                   	push   %rax
ffff80000010bb5a:	48                   	rex.W
ffff80000010bb5b:	44                   	rex.R
ffff80000010bb5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010bb5f:	00 00                	add    %al,(%rax)
ffff80000010bb61:	f0 40                	lock rex
ffff80000010bb63:	40                   	rex
ffff80000010bb64:	40                   	rex
ffff80000010bb65:	40                   	rex
ffff80000010bb66:	40                   	rex
ffff80000010bb67:	40                   	rex
ffff80000010bb68:	40                   	rex
ffff80000010bb69:	40                   	rex
ffff80000010bb6a:	40                   	rex
ffff80000010bb6b:	42                   	rex.X
ffff80000010bb6c:	42 fe 00             	rex.X incb (%rax)
ffff80000010bb6f:	00 00                	add    %al,(%rax)
ffff80000010bb71:	c3                   	retq   
ffff80000010bb72:	42                   	rex.X
ffff80000010bb73:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010bb77:	5a                   	pop    %rdx
ffff80000010bb78:	5a                   	pop    %rdx
ffff80000010bb79:	42                   	rex.X
ffff80000010bb7a:	42                   	rex.X
ffff80000010bb7b:	42                   	rex.X
ffff80000010bb7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010bb7f:	00 00                	add    %al,(%rax)
ffff80000010bb81:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010bb88:	4a                   	rex.WX
ffff80000010bb89:	4a                   	rex.WX
ffff80000010bb8a:	4a                   	rex.WX
ffff80000010bb8b:	46                   	rex.RX
ffff80000010bb8c:	46 e2 00             	rex.RX loop ffff80000010bb8f <system_call_table+0x8ef>
ffff80000010bb8f:	00 00                	add    %al,(%rax)
ffff80000010bb91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010bb95:	82                   	(bad)  
ffff80000010bb96:	82                   	(bad)  
ffff80000010bb97:	82                   	(bad)  
ffff80000010bb98:	82                   	(bad)  
ffff80000010bb99:	82                   	(bad)  
ffff80000010bb9a:	82                   	(bad)  
ffff80000010bb9b:	82                   	(bad)  
ffff80000010bb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010bb9f:	00 00                	add    %al,(%rax)
ffff80000010bba1:	f8                   	clc    
ffff80000010bba2:	44                   	rex.R
ffff80000010bba3:	42                   	rex.X
ffff80000010bba4:	42                   	rex.X
ffff80000010bba5:	42                   	rex.X
ffff80000010bba6:	44 78 40             	rex.R js ffff80000010bbe9 <system_call_table+0x949>
ffff80000010bba9:	40                   	rex
ffff80000010bbaa:	40                   	rex
ffff80000010bbab:	40                   	rex
ffff80000010bbac:	40                   	rex
ffff80000010bbad:	f0 00 00             	lock add %al,(%rax)
ffff80000010bbb0:	00 38                	add    %bh,(%rax)
ffff80000010bbb2:	44 82                	rex.R (bad) 
ffff80000010bbb4:	82                   	(bad)  
ffff80000010bbb5:	82                   	(bad)  
ffff80000010bbb6:	82                   	(bad)  
ffff80000010bbb7:	82                   	(bad)  
ffff80000010bbb8:	82                   	(bad)  
ffff80000010bbb9:	82                   	(bad)  
ffff80000010bbba:	92                   	xchg   %eax,%edx
ffff80000010bbbb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010bbbf:	00 00                	add    %al,(%rax)
ffff80000010bbc1:	fc                   	cld    
ffff80000010bbc2:	42                   	rex.X
ffff80000010bbc3:	42                   	rex.X
ffff80000010bbc4:	42                   	rex.X
ffff80000010bbc5:	42 7c 44             	rex.X jl ffff80000010bc0c <system_call_table+0x96c>
ffff80000010bbc8:	42                   	rex.X
ffff80000010bbc9:	42                   	rex.X
ffff80000010bbca:	42                   	rex.X
ffff80000010bbcb:	42                   	rex.X
ffff80000010bbcc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010bbcf:	00 00                	add    %al,(%rax)
ffff80000010bbd1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010bbd4:	82                   	(bad)  
ffff80000010bbd5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010bbd9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010bbdf:	00 00                	add    %al,(%rax)
ffff80000010bbe1:	fe                   	(bad)  
ffff80000010bbe2:	92                   	xchg   %eax,%edx
ffff80000010bbe3:	92                   	xchg   %eax,%edx
ffff80000010bbe4:	10 10                	adc    %dl,(%rax)
ffff80000010bbe6:	10 10                	adc    %dl,(%rax)
ffff80000010bbe8:	10 10                	adc    %dl,(%rax)
ffff80000010bbea:	10 10                	adc    %dl,(%rax)
ffff80000010bbec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010bbf0:	00 e7                	add    %ah,%bh
ffff80000010bbf2:	42                   	rex.X
ffff80000010bbf3:	42                   	rex.X
ffff80000010bbf4:	42                   	rex.X
ffff80000010bbf5:	42                   	rex.X
ffff80000010bbf6:	42                   	rex.X
ffff80000010bbf7:	42                   	rex.X
ffff80000010bbf8:	42                   	rex.X
ffff80000010bbf9:	42                   	rex.X
ffff80000010bbfa:	42                   	rex.X
ffff80000010bbfb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010bbfe:	00 00                	add    %al,(%rax)
ffff80000010bc00:	00 e7                	add    %ah,%bh
ffff80000010bc02:	42                   	rex.X
ffff80000010bc03:	42                   	rex.X
ffff80000010bc04:	42                   	rex.X
ffff80000010bc05:	42 24 24             	rex.X and $0x24,%al
ffff80000010bc08:	24 24                	and    $0x24,%al
ffff80000010bc0a:	18 18                	sbb    %bl,(%rax)
ffff80000010bc0c:	18 18                	sbb    %bl,(%rax)
ffff80000010bc0e:	00 00                	add    %al,(%rax)
ffff80000010bc10:	00 e7                	add    %ah,%bh
ffff80000010bc12:	42                   	rex.X
ffff80000010bc13:	42                   	rex.X
ffff80000010bc14:	42 5a                	rex.X pop %rdx
ffff80000010bc16:	5a                   	pop    %rdx
ffff80000010bc17:	5a                   	pop    %rdx
ffff80000010bc18:	5a                   	pop    %rdx
ffff80000010bc19:	24 24                	and    $0x24,%al
ffff80000010bc1b:	24 24                	and    $0x24,%al
ffff80000010bc1d:	24 00                	and    $0x0,%al
ffff80000010bc1f:	00 00                	add    %al,(%rax)
ffff80000010bc21:	e7 42                	out    %eax,$0x42
ffff80000010bc23:	42 24 24             	rex.X and $0x24,%al
ffff80000010bc26:	24 18                	and    $0x18,%al
ffff80000010bc28:	24 24                	and    $0x24,%al
ffff80000010bc2a:	24 42                	and    $0x42,%al
ffff80000010bc2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010bc2f:	00 00                	add    %al,(%rax)
ffff80000010bc31:	ee                   	out    %al,(%dx)
ffff80000010bc32:	44                   	rex.R
ffff80000010bc33:	44                   	rex.R
ffff80000010bc34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010bc37:	28 10                	sub    %dl,(%rax)
ffff80000010bc39:	10 10                	adc    %dl,(%rax)
ffff80000010bc3b:	10 10                	adc    %dl,(%rax)
ffff80000010bc3d:	7c 00                	jl     ffff80000010bc3f <system_call_table+0x99f>
ffff80000010bc3f:	00 00                	add    %al,(%rax)
ffff80000010bc41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010bc48:	20 20                	and    %ah,(%rax)
ffff80000010bc4a:	40                   	rex
ffff80000010bc4b:	42 82                	rex.X (bad) 
ffff80000010bc4d:	fe 00                	incb   (%rax)
ffff80000010bc4f:	00 00                	add    %al,(%rax)
ffff80000010bc51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010bc54:	20 20                	and    %ah,(%rax)
ffff80000010bc56:	20 20                	and    %ah,(%rax)
ffff80000010bc58:	20 20                	and    %ah,(%rax)
ffff80000010bc5a:	20 20                	and    %ah,(%rax)
ffff80000010bc5c:	20 20                	and    %ah,(%rax)
ffff80000010bc5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010bc65:	20 20                	and    %ah,(%rax)
ffff80000010bc67:	10 10                	adc    %dl,(%rax)
ffff80000010bc69:	08 08                	or     %cl,(%rax)
ffff80000010bc6b:	04 04                	add    $0x4,%al
ffff80000010bc6d:	04 02                	add    $0x2,%al
ffff80000010bc6f:	02 00                	add    (%rax),%al
ffff80000010bc71:	7c 04                	jl     ffff80000010bc77 <system_call_table+0x9d7>
ffff80000010bc73:	04 04                	add    $0x4,%al
ffff80000010bc75:	04 04                	add    $0x4,%al
ffff80000010bc77:	04 04                	add    $0x4,%al
ffff80000010bc79:	04 04                	add    $0x4,%al
ffff80000010bc7b:	04 04                	add    $0x4,%al
ffff80000010bc7d:	04 7c                	add    $0x7c,%al
ffff80000010bc7f:	00 00                	add    %al,(%rax)
ffff80000010bc81:	10 28                	adc    %ch,(%rax)
ffff80000010bc83:	44 82                	rex.R (bad) 
	...
ffff80000010bc9d:	00 fe                	add    %bh,%dh
ffff80000010bc9f:	00 10                	add    %dl,(%rax)
ffff80000010bca1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010bcb4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010bcb7:	04 3c                	add    $0x3c,%al
ffff80000010bcb9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010bcc0:	c0 
ffff80000010bcc1:	40                   	rex
ffff80000010bcc2:	40                   	rex
ffff80000010bcc3:	40                   	rex
ffff80000010bcc4:	40 58                	rex pop %rax
ffff80000010bcc6:	64 42                	fs rex.X
ffff80000010bcc8:	42                   	rex.X
ffff80000010bcc9:	42                   	rex.X
ffff80000010bcca:	42                   	rex.X
ffff80000010bccb:	42                   	rex.X
ffff80000010bccc:	64 58                	fs pop %rax
ffff80000010bcce:	00 00                	add    %al,(%rax)
ffff80000010bcd0:	00 00                	add    %al,(%rax)
ffff80000010bcd2:	00 00                	add    %al,(%rax)
ffff80000010bcd4:	00 30                	add    %dh,(%rax)
ffff80000010bcd6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010bcdd:	38 
ffff80000010bcde:	00 00                	add    %al,(%rax)
ffff80000010bce0:	0c 04                	or     $0x4,%al
ffff80000010bce2:	04 04                	add    $0x4,%al
ffff80000010bce4:	04 34                	add    $0x34,%al
ffff80000010bce6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010bced:	36 
ffff80000010bcee:	00 00                	add    %al,(%rax)
ffff80000010bcf0:	00 00                	add    %al,(%rax)
ffff80000010bcf2:	00 00                	add    %al,(%rax)
ffff80000010bcf4:	00 38                	add    %bh,(%rax)
ffff80000010bcf6:	44 82                	rex.R (bad) 
ffff80000010bcf8:	82                   	(bad)  
ffff80000010bcf9:	fc                   	cld    
ffff80000010bcfa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010bd01:	10 10                	adc    %dl,(%rax)
ffff80000010bd03:	10 10                	adc    %dl,(%rax)
ffff80000010bd05:	7c 10                	jl     ffff80000010bd17 <system_call_table+0xa77>
ffff80000010bd07:	10 10                	adc    %dl,(%rax)
ffff80000010bd09:	10 10                	adc    %dl,(%rax)
ffff80000010bd0b:	10 10                	adc    %dl,(%rax)
ffff80000010bd0d:	7c 00                	jl     ffff80000010bd0f <system_call_table+0xa6f>
ffff80000010bd0f:	00 00                	add    %al,(%rax)
ffff80000010bd11:	00 00                	add    %al,(%rax)
ffff80000010bd13:	00 00                	add    %al,(%rax)
ffff80000010bd15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010bd1c:	34 04 
ffff80000010bd1e:	04 38                	add    $0x38,%al
ffff80000010bd20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010bd24:	40 58                	rex pop %rax
ffff80000010bd26:	64 42                	fs rex.X
ffff80000010bd28:	42                   	rex.X
ffff80000010bd29:	42                   	rex.X
ffff80000010bd2a:	42                   	rex.X
ffff80000010bd2b:	42                   	rex.X
ffff80000010bd2c:	42 e3 00             	rex.X jrcxz ffff80000010bd2f <system_call_table+0xa8f>
ffff80000010bd2f:	00 00                	add    %al,(%rax)
ffff80000010bd31:	10 10                	adc    %dl,(%rax)
ffff80000010bd33:	00 00                	add    %al,(%rax)
ffff80000010bd35:	30 10                	xor    %dl,(%rax)
ffff80000010bd37:	10 10                	adc    %dl,(%rax)
ffff80000010bd39:	10 10                	adc    %dl,(%rax)
ffff80000010bd3b:	10 10                	adc    %dl,(%rax)
ffff80000010bd3d:	38 00                	cmp    %al,(%rax)
ffff80000010bd3f:	00 00                	add    %al,(%rax)
ffff80000010bd41:	04 04                	add    $0x4,%al
ffff80000010bd43:	00 00                	add    %al,(%rax)
ffff80000010bd45:	0c 04                	or     $0x4,%al
ffff80000010bd47:	04 04                	add    $0x4,%al
ffff80000010bd49:	04 04                	add    $0x4,%al
ffff80000010bd4b:	04 04                	add    $0x4,%al
ffff80000010bd4d:	08 08                	or     %cl,(%rax)
ffff80000010bd4f:	30 c0                	xor    %al,%al
ffff80000010bd51:	40                   	rex
ffff80000010bd52:	40                   	rex
ffff80000010bd53:	40                   	rex
ffff80000010bd54:	40                   	rex
ffff80000010bd55:	4e                   	rex.WRX
ffff80000010bd56:	44                   	rex.R
ffff80000010bd57:	48 50                	rex.W push %rax
ffff80000010bd59:	60                   	(bad)  
ffff80000010bd5a:	50                   	push   %rax
ffff80000010bd5b:	48                   	rex.W
ffff80000010bd5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010bd5f:	00 30                	add    %dh,(%rax)
ffff80000010bd61:	10 10                	adc    %dl,(%rax)
ffff80000010bd63:	10 10                	adc    %dl,(%rax)
ffff80000010bd65:	10 10                	adc    %dl,(%rax)
ffff80000010bd67:	10 10                	adc    %dl,(%rax)
ffff80000010bd69:	10 10                	adc    %dl,(%rax)
ffff80000010bd6b:	10 10                	adc    %dl,(%rax)
ffff80000010bd6d:	38 00                	cmp    %al,(%rax)
ffff80000010bd6f:	00 00                	add    %al,(%rax)
ffff80000010bd71:	00 00                	add    %al,(%rax)
ffff80000010bd73:	00 00                	add    %al,(%rax)
ffff80000010bd75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010bd79:	49                   	rex.WB
ffff80000010bd7a:	49                   	rex.WB
ffff80000010bd7b:	49                   	rex.WB
ffff80000010bd7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010bd7f:	00 00                	add    %al,(%rax)
ffff80000010bd81:	00 00                	add    %al,(%rax)
ffff80000010bd83:	00 00                	add    %al,(%rax)
ffff80000010bd85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010bd89:	42                   	rex.X
ffff80000010bd8a:	42                   	rex.X
ffff80000010bd8b:	42                   	rex.X
ffff80000010bd8c:	42 e3 00             	rex.X jrcxz ffff80000010bd8f <system_call_table+0xaef>
ffff80000010bd8f:	00 00                	add    %al,(%rax)
ffff80000010bd91:	00 00                	add    %al,(%rax)
ffff80000010bd93:	00 00                	add    %al,(%rax)
ffff80000010bd95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010bd99:	82                   	(bad)  
ffff80000010bd9a:	82                   	(bad)  
ffff80000010bd9b:	82                   	(bad)  
ffff80000010bd9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010bd9f:	00 00                	add    %al,(%rax)
ffff80000010bda1:	00 00                	add    %al,(%rax)
ffff80000010bda3:	00 d8                	add    %bl,%al
ffff80000010bda5:	64 42                	fs rex.X
ffff80000010bda7:	42                   	rex.X
ffff80000010bda8:	42                   	rex.X
ffff80000010bda9:	42                   	rex.X
ffff80000010bdaa:	42                   	rex.X
ffff80000010bdab:	64 58                	fs pop %rax
ffff80000010bdad:	40                   	rex
ffff80000010bdae:	40 e0 00             	rex loopne ffff80000010bdb1 <system_call_table+0xb11>
ffff80000010bdb1:	00 00                	add    %al,(%rax)
ffff80000010bdb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010bdb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010bdbd:	04 04                	add    $0x4,%al
ffff80000010bdbf:	0e                   	(bad)  
ffff80000010bdc0:	00 00                	add    %al,(%rax)
ffff80000010bdc2:	00 00                	add    %al,(%rax)
ffff80000010bdc4:	00 dc                	add    %bl,%ah
ffff80000010bdc6:	62 42                	(bad)  
ffff80000010bdc8:	40                   	rex
ffff80000010bdc9:	40                   	rex
ffff80000010bdca:	40                   	rex
ffff80000010bdcb:	40                   	rex
ffff80000010bdcc:	40 e0 00             	rex loopne ffff80000010bdcf <system_call_table+0xb2f>
ffff80000010bdcf:	00 00                	add    %al,(%rax)
ffff80000010bdd1:	00 00                	add    %al,(%rax)
ffff80000010bdd3:	00 00                	add    %al,(%rax)
ffff80000010bdd5:	7a 86                	jp     ffff80000010bd5d <system_call_table+0xabd>
ffff80000010bdd7:	82                   	(bad)  
ffff80000010bdd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010bddb:	82                   	(bad)  
ffff80000010bddc:	c2 bc 00             	retq   $0xbc
ffff80000010bddf:	00 00                	add    %al,(%rax)
ffff80000010bde1:	00 10                	add    %dl,(%rax)
ffff80000010bde3:	10 10                	adc    %dl,(%rax)
ffff80000010bde5:	7c 10                	jl     ffff80000010bdf7 <system_call_table+0xb57>
ffff80000010bde7:	10 10                	adc    %dl,(%rax)
ffff80000010bde9:	10 10                	adc    %dl,(%rax)
ffff80000010bdeb:	10 10                	adc    %dl,(%rax)
ffff80000010bded:	0e                   	(bad)  
ffff80000010bdee:	00 00                	add    %al,(%rax)
ffff80000010bdf0:	00 00                	add    %al,(%rax)
ffff80000010bdf2:	00 00                	add    %al,(%rax)
ffff80000010bdf4:	00 c6                	add    %al,%dh
ffff80000010bdf6:	42                   	rex.X
ffff80000010bdf7:	42                   	rex.X
ffff80000010bdf8:	42                   	rex.X
ffff80000010bdf9:	42                   	rex.X
ffff80000010bdfa:	42                   	rex.X
ffff80000010bdfb:	42                   	rex.X
ffff80000010bdfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010bdff:	00 00                	add    %al,(%rax)
ffff80000010be01:	00 00                	add    %al,(%rax)
ffff80000010be03:	00 00                	add    %al,(%rax)
ffff80000010be05:	e7 42                	out    %eax,$0x42
ffff80000010be07:	42                   	rex.X
ffff80000010be08:	42 24 24             	rex.X and $0x24,%al
ffff80000010be0b:	24 18                	and    $0x18,%al
ffff80000010be0d:	18 00                	sbb    %al,(%rax)
ffff80000010be0f:	00 00                	add    %al,(%rax)
ffff80000010be11:	00 00                	add    %al,(%rax)
ffff80000010be13:	00 00                	add    %al,(%rax)
ffff80000010be15:	e7 42                	out    %eax,$0x42
ffff80000010be17:	42 5a                	rex.X pop %rdx
ffff80000010be19:	5a                   	pop    %rdx
ffff80000010be1a:	5a                   	pop    %rdx
ffff80000010be1b:	24 24                	and    $0x24,%al
ffff80000010be1d:	24 00                	and    $0x0,%al
ffff80000010be1f:	00 00                	add    %al,(%rax)
ffff80000010be21:	00 00                	add    %al,(%rax)
ffff80000010be23:	00 00                	add    %al,(%rax)
ffff80000010be25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010be2a:	28 28                	sub    %ch,(%rax)
ffff80000010be2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010be30:	00 00                	add    %al,(%rax)
ffff80000010be32:	00 00                	add    %al,(%rax)
ffff80000010be34:	00 e7                	add    %ah,%bh
ffff80000010be36:	42                   	rex.X
ffff80000010be37:	42 24 24             	rex.X and $0x24,%al
ffff80000010be3a:	24 18                	and    $0x18,%al
ffff80000010be3c:	18 10                	sbb    %dl,(%rax)
ffff80000010be3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010be41:	00 00                	add    %al,(%rax)
ffff80000010be43:	00 00                	add    %al,(%rax)
ffff80000010be45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010be4b:	42 82                	rex.X (bad) 
ffff80000010be4d:	fe 00                	incb   (%rax)
ffff80000010be4f:	00 00                	add    %al,(%rax)
ffff80000010be51:	06                   	(bad)  
ffff80000010be52:	08 10                	or     %dl,(%rax)
ffff80000010be54:	10 10                	adc    %dl,(%rax)
ffff80000010be56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010be59:	10 10                	adc    %dl,(%rax)
ffff80000010be5b:	10 08                	adc    %cl,(%rax)
ffff80000010be5d:	06                   	(bad)  
ffff80000010be5e:	00 00                	add    %al,(%rax)
ffff80000010be60:	10 10                	adc    %dl,(%rax)
ffff80000010be62:	10 10                	adc    %dl,(%rax)
ffff80000010be64:	10 10                	adc    %dl,(%rax)
ffff80000010be66:	10 10                	adc    %dl,(%rax)
ffff80000010be68:	10 10                	adc    %dl,(%rax)
ffff80000010be6a:	10 10                	adc    %dl,(%rax)
ffff80000010be6c:	10 10                	adc    %dl,(%rax)
ffff80000010be6e:	10 10                	adc    %dl,(%rax)
ffff80000010be70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010be73:	08 08                	or     %cl,(%rax)
ffff80000010be75:	08 08                	or     %cl,(%rax)
ffff80000010be77:	06                   	(bad)  
ffff80000010be78:	08 08                	or     %cl,(%rax)
ffff80000010be7a:	08 08                	or     %cl,(%rax)
ffff80000010be7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010be7f:	00 00                	add    %al,(%rax)
ffff80000010be81:	72 8c                	jb     ffff80000010be0f <system_call_table+0xb6f>
	...
ffff80000010c8af:	00 00                	add    %al,(%rax)
ffff80000010c8b1:	10 10                	adc    %dl,(%rax)
ffff80000010c8b3:	10 10                	adc    %dl,(%rax)
ffff80000010c8b5:	10 10                	adc    %dl,(%rax)
ffff80000010c8b7:	10 10                	adc    %dl,(%rax)
ffff80000010c8b9:	10 00                	adc    %al,(%rax)
ffff80000010c8bb:	00 10                	add    %dl,(%rax)
ffff80000010c8bd:	10 00                	adc    %al,(%rax)
ffff80000010c8bf:	00 28                	add    %ch,(%rax)
ffff80000010c8c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010c8cf:	00 00                	add    %al,(%rax)
ffff80000010c8d1:	44                   	rex.R
ffff80000010c8d2:	44                   	rex.R
ffff80000010c8d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c8d8:	44                   	rex.R
ffff80000010c8d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010c8de:	00 00                	add    %al,(%rax)
ffff80000010c8e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010c8e2:	56                   	push   %rsi
ffff80000010c8e3:	92                   	xchg   %eax,%edx
ffff80000010c8e4:	92                   	xchg   %eax,%edx
ffff80000010c8e5:	90                   	nop
ffff80000010c8e6:	50                   	push   %rax
ffff80000010c8e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010c8ea:	92                   	xchg   %eax,%edx
ffff80000010c8eb:	92                   	xchg   %eax,%edx
ffff80000010c8ec:	d4                   	(bad)  
ffff80000010c8ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010c8f2:	94                   	xchg   %eax,%esp
ffff80000010c8f3:	94                   	xchg   %eax,%esp
ffff80000010c8f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010c8f9:	2c 52                	sub    $0x52,%al
ffff80000010c8fb:	52                   	push   %rdx
ffff80000010c8fc:	92                   	xchg   %eax,%edx
ffff80000010c8fd:	8c 00                	mov    %es,(%rax)
ffff80000010c8ff:	00 00                	add    %al,(%rax)
ffff80000010c901:	70 88                	jo     ffff80000010c88b <system_call_table+0x15eb>
ffff80000010c903:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010c909:	92                   	xchg   %eax,%edx
ffff80000010c90a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010c911:	08 10                	or     %dl,(%rax)
	...
ffff80000010c91f:	00 02                	add    %al,(%rdx)
ffff80000010c921:	04 08                	add    $0x8,%al
ffff80000010c923:	08 10                	or     %dl,(%rax)
ffff80000010c925:	10 10                	adc    %dl,(%rax)
ffff80000010c927:	10 10                	adc    %dl,(%rax)
ffff80000010c929:	10 10                	adc    %dl,(%rax)
ffff80000010c92b:	08 08                	or     %cl,(%rax)
ffff80000010c92d:	04 02                	add    $0x2,%al
ffff80000010c92f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010c935:	10 10                	adc    %dl,(%rax)
ffff80000010c937:	10 10                	adc    %dl,(%rax)
ffff80000010c939:	10 10                	adc    %dl,(%rax)
ffff80000010c93b:	20 20                	and    %ah,(%rax)
ffff80000010c93d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010c941:	00 00                	add    %al,(%rax)
ffff80000010c943:	00 00                	add    %al,(%rax)
ffff80000010c945:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010c94b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c955:	10 10                	adc    %dl,(%rax)
ffff80000010c957:	10 fe                	adc    %bh,%dh
ffff80000010c959:	10 10                	adc    %dl,(%rax)
ffff80000010c95b:	10 00                	adc    %al,(%rax)
	...
ffff80000010c969:	00 00                	add    %al,(%rax)
ffff80000010c96b:	18 18                	sbb    %bl,(%rax)
ffff80000010c96d:	08 08                	or     %cl,(%rax)
ffff80000010c96f:	10 00                	adc    %al,(%rax)
ffff80000010c971:	00 00                	add    %al,(%rax)
ffff80000010c973:	00 00                	add    %al,(%rax)
ffff80000010c975:	00 00                	add    %al,(%rax)
ffff80000010c977:	00 fe                	add    %bh,%dh
	...
ffff80000010c989:	00 00                	add    %al,(%rax)
ffff80000010c98b:	00 18                	add    %bl,(%rax)
ffff80000010c98d:	18 00                	sbb    %al,(%rax)
ffff80000010c98f:	00 02                	add    %al,(%rdx)
ffff80000010c991:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010c994:	08 08                	or     %cl,(%rax)
ffff80000010c996:	08 10                	or     %dl,(%rax)
ffff80000010c998:	10 20                	adc    %ah,(%rax)
ffff80000010c99a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c99d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010c9a4:	42 
ffff80000010c9a5:	42                   	rex.X
ffff80000010c9a6:	42                   	rex.X
ffff80000010c9a7:	42                   	rex.X
ffff80000010c9a8:	42                   	rex.X
ffff80000010c9a9:	42                   	rex.X
ffff80000010c9aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010c9ad:	18 00                	sbb    %al,(%rax)
ffff80000010c9af:	00 00                	add    %al,(%rax)
ffff80000010c9b1:	08 18                	or     %bl,(%rax)
ffff80000010c9b3:	28 08                	sub    %cl,(%rax)
ffff80000010c9b5:	08 08                	or     %cl,(%rax)
ffff80000010c9b7:	08 08                	or     %cl,(%rax)
ffff80000010c9b9:	08 08                	or     %cl,(%rax)
ffff80000010c9bb:	08 08                	or     %cl,(%rax)
ffff80000010c9bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010c9c0:	00 18                	add    %bl,(%rax)
ffff80000010c9c2:	24 42                	and    $0x42,%al
ffff80000010c9c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010c9c8:	10 20                	adc    %ah,(%rax)
ffff80000010c9ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010c9cd:	7e 00                	jle    ffff80000010c9cf <system_call_table+0x172f>
ffff80000010c9cf:	00 00                	add    %al,(%rax)
ffff80000010c9d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010c9d4:	02 02                	add    (%rdx),%al
ffff80000010c9d6:	04 18                	add    $0x18,%al
ffff80000010c9d8:	04 02                	add    $0x2,%al
ffff80000010c9da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010c9dd:	18 00                	sbb    %al,(%rax)
ffff80000010c9df:	00 00                	add    %al,(%rax)
ffff80000010c9e1:	0c 0c                	or     $0xc,%al
ffff80000010c9e3:	0c 14                	or     $0x14,%al
ffff80000010c9e5:	14 14                	adc    $0x14,%al
ffff80000010c9e7:	24 24                	and    $0x24,%al
ffff80000010c9e9:	44 7e 04             	rex.R jle ffff80000010c9f0 <system_call_table+0x1750>
ffff80000010c9ec:	04 1e                	add    $0x1e,%al
ffff80000010c9ee:	00 00                	add    %al,(%rax)
ffff80000010c9f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010c9f4:	40 58                	rex pop %rax
ffff80000010c9f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010c9f9:	02 02                	add    (%rdx),%al
ffff80000010c9fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010c9fe:	00 00                	add    %al,(%rax)
ffff80000010ca00:	00 18                	add    %bl,(%rax)
ffff80000010ca02:	24 42                	and    $0x42,%al
ffff80000010ca04:	40 58                	rex pop %rax
ffff80000010ca06:	64 42                	fs rex.X
ffff80000010ca08:	42                   	rex.X
ffff80000010ca09:	42                   	rex.X
ffff80000010ca0a:	42                   	rex.X
ffff80000010ca0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ca0e:	00 00                	add    %al,(%rax)
ffff80000010ca10:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010ca13:	42 04 04             	rex.X add $0x4,%al
ffff80000010ca16:	08 08                	or     %cl,(%rax)
ffff80000010ca18:	08 10                	or     %dl,(%rax)
ffff80000010ca1a:	10 10                	adc    %dl,(%rax)
ffff80000010ca1c:	10 38                	adc    %bh,(%rax)
ffff80000010ca1e:	00 00                	add    %al,(%rax)
ffff80000010ca20:	00 18                	add    %bl,(%rax)
ffff80000010ca22:	24 42                	and    $0x42,%al
ffff80000010ca24:	42                   	rex.X
ffff80000010ca25:	42 24 18             	rex.X and $0x18,%al
ffff80000010ca28:	24 42                	and    $0x42,%al
ffff80000010ca2a:	42                   	rex.X
ffff80000010ca2b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ca2e:	00 00                	add    %al,(%rax)
ffff80000010ca30:	00 18                	add    %bl,(%rax)
ffff80000010ca32:	24 42                	and    $0x42,%al
ffff80000010ca34:	42                   	rex.X
ffff80000010ca35:	42                   	rex.X
ffff80000010ca36:	42                   	rex.X
ffff80000010ca37:	42                   	rex.X
ffff80000010ca38:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010ca3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ca3e:	00 00                	add    %al,(%rax)
ffff80000010ca40:	00 00                	add    %al,(%rax)
ffff80000010ca42:	00 00                	add    %al,(%rax)
ffff80000010ca44:	00 18                	add    %bl,(%rax)
ffff80000010ca46:	18 00                	sbb    %al,(%rax)
ffff80000010ca48:	00 00                	add    %al,(%rax)
ffff80000010ca4a:	00 00                	add    %al,(%rax)
ffff80000010ca4c:	18 18                	sbb    %bl,(%rax)
ffff80000010ca4e:	00 00                	add    %al,(%rax)
ffff80000010ca50:	00 00                	add    %al,(%rax)
ffff80000010ca52:	00 00                	add    %al,(%rax)
ffff80000010ca54:	00 18                	add    %bl,(%rax)
ffff80000010ca56:	18 00                	sbb    %al,(%rax)
ffff80000010ca58:	00 00                	add    %al,(%rax)
ffff80000010ca5a:	00 18                	add    %bl,(%rax)
ffff80000010ca5c:	18 08                	sbb    %cl,(%rax)
ffff80000010ca5e:	08 10                	or     %dl,(%rax)
ffff80000010ca60:	00 02                	add    %al,(%rdx)
ffff80000010ca62:	04 08                	add    $0x8,%al
ffff80000010ca64:	10 20                	adc    %ah,(%rax)
ffff80000010ca66:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ca6d:	04 
ffff80000010ca6e:	02 00                	add    (%rax),%al
ffff80000010ca70:	00 00                	add    %al,(%rax)
ffff80000010ca72:	00 00                	add    %al,(%rax)
ffff80000010ca74:	00 00                	add    %al,(%rax)
ffff80000010ca76:	fe 00                	incb   (%rax)
ffff80000010ca78:	00 fe                	add    %bh,%dh
ffff80000010ca7a:	00 00                	add    %al,(%rax)
ffff80000010ca7c:	00 00                	add    %al,(%rax)
ffff80000010ca7e:	00 00                	add    %al,(%rax)
ffff80000010ca80:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ca86:	04 02                	add    $0x2,%al
ffff80000010ca88:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ca8b:	10 20                	adc    %ah,(%rax)
ffff80000010ca8d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ca91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ca95:	82                   	(bad)  
ffff80000010ca96:	04 08                	add    $0x8,%al
ffff80000010ca98:	10 10                	adc    %dl,(%rax)
ffff80000010ca9a:	00 00                	add    %al,(%rax)
ffff80000010ca9c:	18 18                	sbb    %bl,(%rax)
ffff80000010ca9e:	00 00                	add    %al,(%rax)
ffff80000010caa0:	00 38                	add    %bh,(%rax)
ffff80000010caa2:	44 82                	rex.R (bad) 
ffff80000010caa4:	9a                   	(bad)  
ffff80000010caa5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010caa6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010caa7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010caa8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010caa9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010caaa:	9c                   	pushfq 
ffff80000010caab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010caaf:	00 00                	add    %al,(%rax)
ffff80000010cab1:	18 18                	sbb    %bl,(%rax)
ffff80000010cab3:	18 18                	sbb    %bl,(%rax)
ffff80000010cab5:	24 24                	and    $0x24,%al
ffff80000010cab7:	24 24                	and    $0x24,%al
ffff80000010cab9:	7e 42                	jle    ffff80000010cafd <system_call_table+0x185d>
ffff80000010cabb:	42                   	rex.X
ffff80000010cabc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cabf:	00 00                	add    %al,(%rax)
ffff80000010cac1:	f0 48                	lock rex.W
ffff80000010cac3:	44                   	rex.R
ffff80000010cac4:	44                   	rex.R
ffff80000010cac5:	44                   	rex.R
ffff80000010cac6:	48 78 44             	rex.W js ffff80000010cb0d <system_call_table+0x186d>
ffff80000010cac9:	42                   	rex.X
ffff80000010caca:	42                   	rex.X
ffff80000010cacb:	42                   	rex.X
ffff80000010cacc:	44 f8                	rex.R clc 
ffff80000010cace:	00 00                	add    %al,(%rax)
ffff80000010cad0:	00 3a                	add    %bh,(%rdx)
ffff80000010cad2:	46                   	rex.RX
ffff80000010cad3:	42 82                	rex.X (bad) 
ffff80000010cad5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010cadc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010cadf:	00 00                	add    %al,(%rax)
ffff80000010cae1:	f8                   	clc    
ffff80000010cae2:	44                   	rex.R
ffff80000010cae3:	44                   	rex.R
ffff80000010cae4:	42                   	rex.X
ffff80000010cae5:	42                   	rex.X
ffff80000010cae6:	42                   	rex.X
ffff80000010cae7:	42                   	rex.X
ffff80000010cae8:	42                   	rex.X
ffff80000010cae9:	42                   	rex.X
ffff80000010caea:	42                   	rex.X
ffff80000010caeb:	44                   	rex.R
ffff80000010caec:	44 f8                	rex.R clc 
ffff80000010caee:	00 00                	add    %al,(%rax)
ffff80000010caf0:	00 fe                	add    %bh,%dh
ffff80000010caf2:	42                   	rex.X
ffff80000010caf3:	42                   	rex.X
ffff80000010caf4:	40                   	rex
ffff80000010caf5:	40                   	rex
ffff80000010caf6:	44 7c 44             	rex.R jl ffff80000010cb3d <system_call_table+0x189d>
ffff80000010caf9:	40                   	rex
ffff80000010cafa:	40                   	rex
ffff80000010cafb:	42                   	rex.X
ffff80000010cafc:	42 fe 00             	rex.X incb (%rax)
ffff80000010caff:	00 00                	add    %al,(%rax)
ffff80000010cb01:	fe 42 42             	incb   0x42(%rdx)
ffff80000010cb04:	40                   	rex
ffff80000010cb05:	40                   	rex
ffff80000010cb06:	44 7c 44             	rex.R jl ffff80000010cb4d <system_call_table+0x18ad>
ffff80000010cb09:	44                   	rex.R
ffff80000010cb0a:	40                   	rex
ffff80000010cb0b:	40                   	rex
ffff80000010cb0c:	40                   	rex
ffff80000010cb0d:	f0 00 00             	lock add %al,(%rax)
ffff80000010cb10:	00 3a                	add    %bh,(%rdx)
ffff80000010cb12:	46                   	rex.RX
ffff80000010cb13:	42 82                	rex.X (bad) 
ffff80000010cb15:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010cb1c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010cb1f:	00 00                	add    %al,(%rax)
ffff80000010cb21:	e7 42                	out    %eax,$0x42
ffff80000010cb23:	42                   	rex.X
ffff80000010cb24:	42                   	rex.X
ffff80000010cb25:	42                   	rex.X
ffff80000010cb26:	42 7e 42             	rex.X jle ffff80000010cb6b <system_call_table+0x18cb>
ffff80000010cb29:	42                   	rex.X
ffff80000010cb2a:	42                   	rex.X
ffff80000010cb2b:	42                   	rex.X
ffff80000010cb2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cb2f:	00 00                	add    %al,(%rax)
ffff80000010cb31:	7c 10                	jl     ffff80000010cb43 <system_call_table+0x18a3>
ffff80000010cb33:	10 10                	adc    %dl,(%rax)
ffff80000010cb35:	10 10                	adc    %dl,(%rax)
ffff80000010cb37:	10 10                	adc    %dl,(%rax)
ffff80000010cb39:	10 10                	adc    %dl,(%rax)
ffff80000010cb3b:	10 10                	adc    %dl,(%rax)
ffff80000010cb3d:	7c 00                	jl     ffff80000010cb3f <system_call_table+0x189f>
ffff80000010cb3f:	00 00                	add    %al,(%rax)
ffff80000010cb41:	1f                   	(bad)  
ffff80000010cb42:	04 04                	add    $0x4,%al
ffff80000010cb44:	04 04                	add    $0x4,%al
ffff80000010cb46:	04 04                	add    $0x4,%al
ffff80000010cb48:	04 04                	add    $0x4,%al
ffff80000010cb4a:	04 04                	add    $0x4,%al
ffff80000010cb4c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010cb4f:	00 00                	add    %al,(%rax)
ffff80000010cb51:	e7 42                	out    %eax,$0x42
ffff80000010cb53:	44                   	rex.R
ffff80000010cb54:	48 50                	rex.W push %rax
ffff80000010cb56:	50                   	push   %rax
ffff80000010cb57:	60                   	(bad)  
ffff80000010cb58:	50                   	push   %rax
ffff80000010cb59:	50                   	push   %rax
ffff80000010cb5a:	48                   	rex.W
ffff80000010cb5b:	44                   	rex.R
ffff80000010cb5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cb5f:	00 00                	add    %al,(%rax)
ffff80000010cb61:	f0 40                	lock rex
ffff80000010cb63:	40                   	rex
ffff80000010cb64:	40                   	rex
ffff80000010cb65:	40                   	rex
ffff80000010cb66:	40                   	rex
ffff80000010cb67:	40                   	rex
ffff80000010cb68:	40                   	rex
ffff80000010cb69:	40                   	rex
ffff80000010cb6a:	40                   	rex
ffff80000010cb6b:	42                   	rex.X
ffff80000010cb6c:	42 fe 00             	rex.X incb (%rax)
ffff80000010cb6f:	00 00                	add    %al,(%rax)
ffff80000010cb71:	c3                   	retq   
ffff80000010cb72:	42                   	rex.X
ffff80000010cb73:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010cb77:	5a                   	pop    %rdx
ffff80000010cb78:	5a                   	pop    %rdx
ffff80000010cb79:	42                   	rex.X
ffff80000010cb7a:	42                   	rex.X
ffff80000010cb7b:	42                   	rex.X
ffff80000010cb7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cb7f:	00 00                	add    %al,(%rax)
ffff80000010cb81:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010cb88:	4a                   	rex.WX
ffff80000010cb89:	4a                   	rex.WX
ffff80000010cb8a:	4a                   	rex.WX
ffff80000010cb8b:	46                   	rex.RX
ffff80000010cb8c:	46 e2 00             	rex.RX loop ffff80000010cb8f <system_call_table+0x18ef>
ffff80000010cb8f:	00 00                	add    %al,(%rax)
ffff80000010cb91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010cb95:	82                   	(bad)  
ffff80000010cb96:	82                   	(bad)  
ffff80000010cb97:	82                   	(bad)  
ffff80000010cb98:	82                   	(bad)  
ffff80000010cb99:	82                   	(bad)  
ffff80000010cb9a:	82                   	(bad)  
ffff80000010cb9b:	82                   	(bad)  
ffff80000010cb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010cb9f:	00 00                	add    %al,(%rax)
ffff80000010cba1:	f8                   	clc    
ffff80000010cba2:	44                   	rex.R
ffff80000010cba3:	42                   	rex.X
ffff80000010cba4:	42                   	rex.X
ffff80000010cba5:	42                   	rex.X
ffff80000010cba6:	44 78 40             	rex.R js ffff80000010cbe9 <system_call_table+0x1949>
ffff80000010cba9:	40                   	rex
ffff80000010cbaa:	40                   	rex
ffff80000010cbab:	40                   	rex
ffff80000010cbac:	40                   	rex
ffff80000010cbad:	f0 00 00             	lock add %al,(%rax)
ffff80000010cbb0:	00 38                	add    %bh,(%rax)
ffff80000010cbb2:	44 82                	rex.R (bad) 
ffff80000010cbb4:	82                   	(bad)  
ffff80000010cbb5:	82                   	(bad)  
ffff80000010cbb6:	82                   	(bad)  
ffff80000010cbb7:	82                   	(bad)  
ffff80000010cbb8:	82                   	(bad)  
ffff80000010cbb9:	82                   	(bad)  
ffff80000010cbba:	92                   	xchg   %eax,%edx
ffff80000010cbbb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010cbbf:	00 00                	add    %al,(%rax)
ffff80000010cbc1:	fc                   	cld    
ffff80000010cbc2:	42                   	rex.X
ffff80000010cbc3:	42                   	rex.X
ffff80000010cbc4:	42                   	rex.X
ffff80000010cbc5:	42 7c 44             	rex.X jl ffff80000010cc0c <system_call_table+0x196c>
ffff80000010cbc8:	42                   	rex.X
ffff80000010cbc9:	42                   	rex.X
ffff80000010cbca:	42                   	rex.X
ffff80000010cbcb:	42                   	rex.X
ffff80000010cbcc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cbcf:	00 00                	add    %al,(%rax)
ffff80000010cbd1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010cbd4:	82                   	(bad)  
ffff80000010cbd5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010cbd9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010cbdf:	00 00                	add    %al,(%rax)
ffff80000010cbe1:	fe                   	(bad)  
ffff80000010cbe2:	92                   	xchg   %eax,%edx
ffff80000010cbe3:	92                   	xchg   %eax,%edx
ffff80000010cbe4:	10 10                	adc    %dl,(%rax)
ffff80000010cbe6:	10 10                	adc    %dl,(%rax)
ffff80000010cbe8:	10 10                	adc    %dl,(%rax)
ffff80000010cbea:	10 10                	adc    %dl,(%rax)
ffff80000010cbec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010cbf0:	00 e7                	add    %ah,%bh
ffff80000010cbf2:	42                   	rex.X
ffff80000010cbf3:	42                   	rex.X
ffff80000010cbf4:	42                   	rex.X
ffff80000010cbf5:	42                   	rex.X
ffff80000010cbf6:	42                   	rex.X
ffff80000010cbf7:	42                   	rex.X
ffff80000010cbf8:	42                   	rex.X
ffff80000010cbf9:	42                   	rex.X
ffff80000010cbfa:	42                   	rex.X
ffff80000010cbfb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010cbfe:	00 00                	add    %al,(%rax)
ffff80000010cc00:	00 e7                	add    %ah,%bh
ffff80000010cc02:	42                   	rex.X
ffff80000010cc03:	42                   	rex.X
ffff80000010cc04:	42                   	rex.X
ffff80000010cc05:	42 24 24             	rex.X and $0x24,%al
ffff80000010cc08:	24 24                	and    $0x24,%al
ffff80000010cc0a:	18 18                	sbb    %bl,(%rax)
ffff80000010cc0c:	18 18                	sbb    %bl,(%rax)
ffff80000010cc0e:	00 00                	add    %al,(%rax)
ffff80000010cc10:	00 e7                	add    %ah,%bh
ffff80000010cc12:	42                   	rex.X
ffff80000010cc13:	42                   	rex.X
ffff80000010cc14:	42 5a                	rex.X pop %rdx
ffff80000010cc16:	5a                   	pop    %rdx
ffff80000010cc17:	5a                   	pop    %rdx
ffff80000010cc18:	5a                   	pop    %rdx
ffff80000010cc19:	24 24                	and    $0x24,%al
ffff80000010cc1b:	24 24                	and    $0x24,%al
ffff80000010cc1d:	24 00                	and    $0x0,%al
ffff80000010cc1f:	00 00                	add    %al,(%rax)
ffff80000010cc21:	e7 42                	out    %eax,$0x42
ffff80000010cc23:	42 24 24             	rex.X and $0x24,%al
ffff80000010cc26:	24 18                	and    $0x18,%al
ffff80000010cc28:	24 24                	and    $0x24,%al
ffff80000010cc2a:	24 42                	and    $0x42,%al
ffff80000010cc2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010cc2f:	00 00                	add    %al,(%rax)
ffff80000010cc31:	ee                   	out    %al,(%dx)
ffff80000010cc32:	44                   	rex.R
ffff80000010cc33:	44                   	rex.R
ffff80000010cc34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010cc37:	28 10                	sub    %dl,(%rax)
ffff80000010cc39:	10 10                	adc    %dl,(%rax)
ffff80000010cc3b:	10 10                	adc    %dl,(%rax)
ffff80000010cc3d:	7c 00                	jl     ffff80000010cc3f <system_call_table+0x199f>
ffff80000010cc3f:	00 00                	add    %al,(%rax)
ffff80000010cc41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010cc48:	20 20                	and    %ah,(%rax)
ffff80000010cc4a:	40                   	rex
ffff80000010cc4b:	42 82                	rex.X (bad) 
ffff80000010cc4d:	fe 00                	incb   (%rax)
ffff80000010cc4f:	00 00                	add    %al,(%rax)
ffff80000010cc51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010cc54:	20 20                	and    %ah,(%rax)
ffff80000010cc56:	20 20                	and    %ah,(%rax)
ffff80000010cc58:	20 20                	and    %ah,(%rax)
ffff80000010cc5a:	20 20                	and    %ah,(%rax)
ffff80000010cc5c:	20 20                	and    %ah,(%rax)
ffff80000010cc5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010cc65:	20 20                	and    %ah,(%rax)
ffff80000010cc67:	10 10                	adc    %dl,(%rax)
ffff80000010cc69:	08 08                	or     %cl,(%rax)
ffff80000010cc6b:	04 04                	add    $0x4,%al
ffff80000010cc6d:	04 02                	add    $0x2,%al
ffff80000010cc6f:	02 00                	add    (%rax),%al
ffff80000010cc71:	7c 04                	jl     ffff80000010cc77 <system_call_table+0x19d7>
ffff80000010cc73:	04 04                	add    $0x4,%al
ffff80000010cc75:	04 04                	add    $0x4,%al
ffff80000010cc77:	04 04                	add    $0x4,%al
ffff80000010cc79:	04 04                	add    $0x4,%al
ffff80000010cc7b:	04 04                	add    $0x4,%al
ffff80000010cc7d:	04 7c                	add    $0x7c,%al
ffff80000010cc7f:	00 00                	add    %al,(%rax)
ffff80000010cc81:	10 28                	adc    %ch,(%rax)
ffff80000010cc83:	44 82                	rex.R (bad) 
	...
ffff80000010cc9d:	00 fe                	add    %bh,%dh
ffff80000010cc9f:	00 10                	add    %dl,(%rax)
ffff80000010cca1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010ccb4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010ccb7:	04 3c                	add    $0x3c,%al
ffff80000010ccb9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010ccc0:	c0 
ffff80000010ccc1:	40                   	rex
ffff80000010ccc2:	40                   	rex
ffff80000010ccc3:	40                   	rex
ffff80000010ccc4:	40 58                	rex pop %rax
ffff80000010ccc6:	64 42                	fs rex.X
ffff80000010ccc8:	42                   	rex.X
ffff80000010ccc9:	42                   	rex.X
ffff80000010ccca:	42                   	rex.X
ffff80000010cccb:	42                   	rex.X
ffff80000010cccc:	64 58                	fs pop %rax
ffff80000010ccce:	00 00                	add    %al,(%rax)
ffff80000010ccd0:	00 00                	add    %al,(%rax)
ffff80000010ccd2:	00 00                	add    %al,(%rax)
ffff80000010ccd4:	00 30                	add    %dh,(%rax)
ffff80000010ccd6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010ccdd:	38 
ffff80000010ccde:	00 00                	add    %al,(%rax)
ffff80000010cce0:	0c 04                	or     $0x4,%al
ffff80000010cce2:	04 04                	add    $0x4,%al
ffff80000010cce4:	04 34                	add    $0x34,%al
ffff80000010cce6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010cced:	36 
ffff80000010ccee:	00 00                	add    %al,(%rax)
ffff80000010ccf0:	00 00                	add    %al,(%rax)
ffff80000010ccf2:	00 00                	add    %al,(%rax)
ffff80000010ccf4:	00 38                	add    %bh,(%rax)
ffff80000010ccf6:	44 82                	rex.R (bad) 
ffff80000010ccf8:	82                   	(bad)  
ffff80000010ccf9:	fc                   	cld    
ffff80000010ccfa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010cd01:	10 10                	adc    %dl,(%rax)
ffff80000010cd03:	10 10                	adc    %dl,(%rax)
ffff80000010cd05:	7c 10                	jl     ffff80000010cd17 <system_call_table+0x1a77>
ffff80000010cd07:	10 10                	adc    %dl,(%rax)
ffff80000010cd09:	10 10                	adc    %dl,(%rax)
ffff80000010cd0b:	10 10                	adc    %dl,(%rax)
ffff80000010cd0d:	7c 00                	jl     ffff80000010cd0f <system_call_table+0x1a6f>
ffff80000010cd0f:	00 00                	add    %al,(%rax)
ffff80000010cd11:	00 00                	add    %al,(%rax)
ffff80000010cd13:	00 00                	add    %al,(%rax)
ffff80000010cd15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010cd1c:	34 04 
ffff80000010cd1e:	04 38                	add    $0x38,%al
ffff80000010cd20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010cd24:	40 58                	rex pop %rax
ffff80000010cd26:	64 42                	fs rex.X
ffff80000010cd28:	42                   	rex.X
ffff80000010cd29:	42                   	rex.X
ffff80000010cd2a:	42                   	rex.X
ffff80000010cd2b:	42                   	rex.X
ffff80000010cd2c:	42 e3 00             	rex.X jrcxz ffff80000010cd2f <system_call_table+0x1a8f>
ffff80000010cd2f:	00 00                	add    %al,(%rax)
ffff80000010cd31:	10 10                	adc    %dl,(%rax)
ffff80000010cd33:	00 00                	add    %al,(%rax)
ffff80000010cd35:	30 10                	xor    %dl,(%rax)
ffff80000010cd37:	10 10                	adc    %dl,(%rax)
ffff80000010cd39:	10 10                	adc    %dl,(%rax)
ffff80000010cd3b:	10 10                	adc    %dl,(%rax)
ffff80000010cd3d:	38 00                	cmp    %al,(%rax)
ffff80000010cd3f:	00 00                	add    %al,(%rax)
ffff80000010cd41:	04 04                	add    $0x4,%al
ffff80000010cd43:	00 00                	add    %al,(%rax)
ffff80000010cd45:	0c 04                	or     $0x4,%al
ffff80000010cd47:	04 04                	add    $0x4,%al
ffff80000010cd49:	04 04                	add    $0x4,%al
ffff80000010cd4b:	04 04                	add    $0x4,%al
ffff80000010cd4d:	08 08                	or     %cl,(%rax)
ffff80000010cd4f:	30 c0                	xor    %al,%al
ffff80000010cd51:	40                   	rex
ffff80000010cd52:	40                   	rex
ffff80000010cd53:	40                   	rex
ffff80000010cd54:	40                   	rex
ffff80000010cd55:	4e                   	rex.WRX
ffff80000010cd56:	44                   	rex.R
ffff80000010cd57:	48 50                	rex.W push %rax
ffff80000010cd59:	60                   	(bad)  
ffff80000010cd5a:	50                   	push   %rax
ffff80000010cd5b:	48                   	rex.W
ffff80000010cd5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010cd5f:	00 30                	add    %dh,(%rax)
ffff80000010cd61:	10 10                	adc    %dl,(%rax)
ffff80000010cd63:	10 10                	adc    %dl,(%rax)
ffff80000010cd65:	10 10                	adc    %dl,(%rax)
ffff80000010cd67:	10 10                	adc    %dl,(%rax)
ffff80000010cd69:	10 10                	adc    %dl,(%rax)
ffff80000010cd6b:	10 10                	adc    %dl,(%rax)
ffff80000010cd6d:	38 00                	cmp    %al,(%rax)
ffff80000010cd6f:	00 00                	add    %al,(%rax)
ffff80000010cd71:	00 00                	add    %al,(%rax)
ffff80000010cd73:	00 00                	add    %al,(%rax)
ffff80000010cd75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010cd79:	49                   	rex.WB
ffff80000010cd7a:	49                   	rex.WB
ffff80000010cd7b:	49                   	rex.WB
ffff80000010cd7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010cd7f:	00 00                	add    %al,(%rax)
ffff80000010cd81:	00 00                	add    %al,(%rax)
ffff80000010cd83:	00 00                	add    %al,(%rax)
ffff80000010cd85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010cd89:	42                   	rex.X
ffff80000010cd8a:	42                   	rex.X
ffff80000010cd8b:	42                   	rex.X
ffff80000010cd8c:	42 e3 00             	rex.X jrcxz ffff80000010cd8f <system_call_table+0x1aef>
ffff80000010cd8f:	00 00                	add    %al,(%rax)
ffff80000010cd91:	00 00                	add    %al,(%rax)
ffff80000010cd93:	00 00                	add    %al,(%rax)
ffff80000010cd95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010cd99:	82                   	(bad)  
ffff80000010cd9a:	82                   	(bad)  
ffff80000010cd9b:	82                   	(bad)  
ffff80000010cd9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010cd9f:	00 00                	add    %al,(%rax)
ffff80000010cda1:	00 00                	add    %al,(%rax)
ffff80000010cda3:	00 d8                	add    %bl,%al
ffff80000010cda5:	64 42                	fs rex.X
ffff80000010cda7:	42                   	rex.X
ffff80000010cda8:	42                   	rex.X
ffff80000010cda9:	42                   	rex.X
ffff80000010cdaa:	42                   	rex.X
ffff80000010cdab:	64 58                	fs pop %rax
ffff80000010cdad:	40                   	rex
ffff80000010cdae:	40 e0 00             	rex loopne ffff80000010cdb1 <system_call_table+0x1b11>
ffff80000010cdb1:	00 00                	add    %al,(%rax)
ffff80000010cdb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010cdb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010cdbd:	04 04                	add    $0x4,%al
ffff80000010cdbf:	0e                   	(bad)  
ffff80000010cdc0:	00 00                	add    %al,(%rax)
ffff80000010cdc2:	00 00                	add    %al,(%rax)
ffff80000010cdc4:	00 dc                	add    %bl,%ah
ffff80000010cdc6:	62 42                	(bad)  
ffff80000010cdc8:	40                   	rex
ffff80000010cdc9:	40                   	rex
ffff80000010cdca:	40                   	rex
ffff80000010cdcb:	40                   	rex
ffff80000010cdcc:	40 e0 00             	rex loopne ffff80000010cdcf <system_call_table+0x1b2f>
ffff80000010cdcf:	00 00                	add    %al,(%rax)
ffff80000010cdd1:	00 00                	add    %al,(%rax)
ffff80000010cdd3:	00 00                	add    %al,(%rax)
ffff80000010cdd5:	7a 86                	jp     ffff80000010cd5d <system_call_table+0x1abd>
ffff80000010cdd7:	82                   	(bad)  
ffff80000010cdd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010cddb:	82                   	(bad)  
ffff80000010cddc:	c2 bc 00             	retq   $0xbc
ffff80000010cddf:	00 00                	add    %al,(%rax)
ffff80000010cde1:	00 10                	add    %dl,(%rax)
ffff80000010cde3:	10 10                	adc    %dl,(%rax)
ffff80000010cde5:	7c 10                	jl     ffff80000010cdf7 <system_call_table+0x1b57>
ffff80000010cde7:	10 10                	adc    %dl,(%rax)
ffff80000010cde9:	10 10                	adc    %dl,(%rax)
ffff80000010cdeb:	10 10                	adc    %dl,(%rax)
ffff80000010cded:	0e                   	(bad)  
ffff80000010cdee:	00 00                	add    %al,(%rax)
ffff80000010cdf0:	00 00                	add    %al,(%rax)
ffff80000010cdf2:	00 00                	add    %al,(%rax)
ffff80000010cdf4:	00 c6                	add    %al,%dh
ffff80000010cdf6:	42                   	rex.X
ffff80000010cdf7:	42                   	rex.X
ffff80000010cdf8:	42                   	rex.X
ffff80000010cdf9:	42                   	rex.X
ffff80000010cdfa:	42                   	rex.X
ffff80000010cdfb:	42                   	rex.X
ffff80000010cdfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010cdff:	00 00                	add    %al,(%rax)
ffff80000010ce01:	00 00                	add    %al,(%rax)
ffff80000010ce03:	00 00                	add    %al,(%rax)
ffff80000010ce05:	e7 42                	out    %eax,$0x42
ffff80000010ce07:	42                   	rex.X
ffff80000010ce08:	42 24 24             	rex.X and $0x24,%al
ffff80000010ce0b:	24 18                	and    $0x18,%al
ffff80000010ce0d:	18 00                	sbb    %al,(%rax)
ffff80000010ce0f:	00 00                	add    %al,(%rax)
ffff80000010ce11:	00 00                	add    %al,(%rax)
ffff80000010ce13:	00 00                	add    %al,(%rax)
ffff80000010ce15:	e7 42                	out    %eax,$0x42
ffff80000010ce17:	42 5a                	rex.X pop %rdx
ffff80000010ce19:	5a                   	pop    %rdx
ffff80000010ce1a:	5a                   	pop    %rdx
ffff80000010ce1b:	24 24                	and    $0x24,%al
ffff80000010ce1d:	24 00                	and    $0x0,%al
ffff80000010ce1f:	00 00                	add    %al,(%rax)
ffff80000010ce21:	00 00                	add    %al,(%rax)
ffff80000010ce23:	00 00                	add    %al,(%rax)
ffff80000010ce25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010ce2a:	28 28                	sub    %ch,(%rax)
ffff80000010ce2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010ce30:	00 00                	add    %al,(%rax)
ffff80000010ce32:	00 00                	add    %al,(%rax)
ffff80000010ce34:	00 e7                	add    %ah,%bh
ffff80000010ce36:	42                   	rex.X
ffff80000010ce37:	42 24 24             	rex.X and $0x24,%al
ffff80000010ce3a:	24 18                	and    $0x18,%al
ffff80000010ce3c:	18 10                	sbb    %dl,(%rax)
ffff80000010ce3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ce41:	00 00                	add    %al,(%rax)
ffff80000010ce43:	00 00                	add    %al,(%rax)
ffff80000010ce45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010ce4b:	42 82                	rex.X (bad) 
ffff80000010ce4d:	fe 00                	incb   (%rax)
ffff80000010ce4f:	00 00                	add    %al,(%rax)
ffff80000010ce51:	06                   	(bad)  
ffff80000010ce52:	08 10                	or     %dl,(%rax)
ffff80000010ce54:	10 10                	adc    %dl,(%rax)
ffff80000010ce56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010ce59:	10 10                	adc    %dl,(%rax)
ffff80000010ce5b:	10 08                	adc    %cl,(%rax)
ffff80000010ce5d:	06                   	(bad)  
ffff80000010ce5e:	00 00                	add    %al,(%rax)
ffff80000010ce60:	10 10                	adc    %dl,(%rax)
ffff80000010ce62:	10 10                	adc    %dl,(%rax)
ffff80000010ce64:	10 10                	adc    %dl,(%rax)
ffff80000010ce66:	10 10                	adc    %dl,(%rax)
ffff80000010ce68:	10 10                	adc    %dl,(%rax)
ffff80000010ce6a:	10 10                	adc    %dl,(%rax)
ffff80000010ce6c:	10 10                	adc    %dl,(%rax)
ffff80000010ce6e:	10 10                	adc    %dl,(%rax)
ffff80000010ce70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ce73:	08 08                	or     %cl,(%rax)
ffff80000010ce75:	08 08                	or     %cl,(%rax)
ffff80000010ce77:	06                   	(bad)  
ffff80000010ce78:	08 08                	or     %cl,(%rax)
ffff80000010ce7a:	08 08                	or     %cl,(%rax)
ffff80000010ce7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ce7f:	00 00                	add    %al,(%rax)
ffff80000010ce81:	72 8c                	jb     ffff80000010ce0f <system_call_table+0x1b6f>
	...
ffff80000010d8af:	00 00                	add    %al,(%rax)
ffff80000010d8b1:	10 10                	adc    %dl,(%rax)
ffff80000010d8b3:	10 10                	adc    %dl,(%rax)
ffff80000010d8b5:	10 10                	adc    %dl,(%rax)
ffff80000010d8b7:	10 10                	adc    %dl,(%rax)
ffff80000010d8b9:	10 00                	adc    %al,(%rax)
ffff80000010d8bb:	00 10                	add    %dl,(%rax)
ffff80000010d8bd:	10 00                	adc    %al,(%rax)
ffff80000010d8bf:	00 28                	add    %ch,(%rax)
ffff80000010d8c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010d8cf:	00 00                	add    %al,(%rax)
ffff80000010d8d1:	44                   	rex.R
ffff80000010d8d2:	44                   	rex.R
ffff80000010d8d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d8d8:	44                   	rex.R
ffff80000010d8d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010d8de:	00 00                	add    %al,(%rax)
ffff80000010d8e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010d8e2:	56                   	push   %rsi
ffff80000010d8e3:	92                   	xchg   %eax,%edx
ffff80000010d8e4:	92                   	xchg   %eax,%edx
ffff80000010d8e5:	90                   	nop
ffff80000010d8e6:	50                   	push   %rax
ffff80000010d8e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010d8ea:	92                   	xchg   %eax,%edx
ffff80000010d8eb:	92                   	xchg   %eax,%edx
ffff80000010d8ec:	d4                   	(bad)  
ffff80000010d8ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010d8f2:	94                   	xchg   %eax,%esp
ffff80000010d8f3:	94                   	xchg   %eax,%esp
ffff80000010d8f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010d8f9:	2c 52                	sub    $0x52,%al
ffff80000010d8fb:	52                   	push   %rdx
ffff80000010d8fc:	92                   	xchg   %eax,%edx
ffff80000010d8fd:	8c 00                	mov    %es,(%rax)
ffff80000010d8ff:	00 00                	add    %al,(%rax)
ffff80000010d901:	70 88                	jo     ffff80000010d88b <system_call_table+0x25eb>
ffff80000010d903:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010d909:	92                   	xchg   %eax,%edx
ffff80000010d90a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010d911:	08 10                	or     %dl,(%rax)
	...
ffff80000010d91f:	00 02                	add    %al,(%rdx)
ffff80000010d921:	04 08                	add    $0x8,%al
ffff80000010d923:	08 10                	or     %dl,(%rax)
ffff80000010d925:	10 10                	adc    %dl,(%rax)
ffff80000010d927:	10 10                	adc    %dl,(%rax)
ffff80000010d929:	10 10                	adc    %dl,(%rax)
ffff80000010d92b:	08 08                	or     %cl,(%rax)
ffff80000010d92d:	04 02                	add    $0x2,%al
ffff80000010d92f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010d935:	10 10                	adc    %dl,(%rax)
ffff80000010d937:	10 10                	adc    %dl,(%rax)
ffff80000010d939:	10 10                	adc    %dl,(%rax)
ffff80000010d93b:	20 20                	and    %ah,(%rax)
ffff80000010d93d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010d941:	00 00                	add    %al,(%rax)
ffff80000010d943:	00 00                	add    %al,(%rax)
ffff80000010d945:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010d94b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d955:	10 10                	adc    %dl,(%rax)
ffff80000010d957:	10 fe                	adc    %bh,%dh
ffff80000010d959:	10 10                	adc    %dl,(%rax)
ffff80000010d95b:	10 00                	adc    %al,(%rax)
	...
ffff80000010d969:	00 00                	add    %al,(%rax)
ffff80000010d96b:	18 18                	sbb    %bl,(%rax)
ffff80000010d96d:	08 08                	or     %cl,(%rax)
ffff80000010d96f:	10 00                	adc    %al,(%rax)
ffff80000010d971:	00 00                	add    %al,(%rax)
ffff80000010d973:	00 00                	add    %al,(%rax)
ffff80000010d975:	00 00                	add    %al,(%rax)
ffff80000010d977:	00 fe                	add    %bh,%dh
	...
ffff80000010d989:	00 00                	add    %al,(%rax)
ffff80000010d98b:	00 18                	add    %bl,(%rax)
ffff80000010d98d:	18 00                	sbb    %al,(%rax)
ffff80000010d98f:	00 02                	add    %al,(%rdx)
ffff80000010d991:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010d994:	08 08                	or     %cl,(%rax)
ffff80000010d996:	08 10                	or     %dl,(%rax)
ffff80000010d998:	10 20                	adc    %ah,(%rax)
ffff80000010d99a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d99d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010d9a4:	42 
ffff80000010d9a5:	42                   	rex.X
ffff80000010d9a6:	42                   	rex.X
ffff80000010d9a7:	42                   	rex.X
ffff80000010d9a8:	42                   	rex.X
ffff80000010d9a9:	42                   	rex.X
ffff80000010d9aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010d9ad:	18 00                	sbb    %al,(%rax)
ffff80000010d9af:	00 00                	add    %al,(%rax)
ffff80000010d9b1:	08 18                	or     %bl,(%rax)
ffff80000010d9b3:	28 08                	sub    %cl,(%rax)
ffff80000010d9b5:	08 08                	or     %cl,(%rax)
ffff80000010d9b7:	08 08                	or     %cl,(%rax)
ffff80000010d9b9:	08 08                	or     %cl,(%rax)
ffff80000010d9bb:	08 08                	or     %cl,(%rax)
ffff80000010d9bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010d9c0:	00 18                	add    %bl,(%rax)
ffff80000010d9c2:	24 42                	and    $0x42,%al
ffff80000010d9c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010d9c8:	10 20                	adc    %ah,(%rax)
ffff80000010d9ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010d9cd:	7e 00                	jle    ffff80000010d9cf <system_call_table+0x272f>
ffff80000010d9cf:	00 00                	add    %al,(%rax)
ffff80000010d9d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010d9d4:	02 02                	add    (%rdx),%al
ffff80000010d9d6:	04 18                	add    $0x18,%al
ffff80000010d9d8:	04 02                	add    $0x2,%al
ffff80000010d9da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010d9dd:	18 00                	sbb    %al,(%rax)
ffff80000010d9df:	00 00                	add    %al,(%rax)
ffff80000010d9e1:	0c 0c                	or     $0xc,%al
ffff80000010d9e3:	0c 14                	or     $0x14,%al
ffff80000010d9e5:	14 14                	adc    $0x14,%al
ffff80000010d9e7:	24 24                	and    $0x24,%al
ffff80000010d9e9:	44 7e 04             	rex.R jle ffff80000010d9f0 <system_call_table+0x2750>
ffff80000010d9ec:	04 1e                	add    $0x1e,%al
ffff80000010d9ee:	00 00                	add    %al,(%rax)
ffff80000010d9f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010d9f4:	40 58                	rex pop %rax
ffff80000010d9f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010d9f9:	02 02                	add    (%rdx),%al
ffff80000010d9fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010d9fe:	00 00                	add    %al,(%rax)
ffff80000010da00:	00 18                	add    %bl,(%rax)
ffff80000010da02:	24 42                	and    $0x42,%al
ffff80000010da04:	40 58                	rex pop %rax
ffff80000010da06:	64 42                	fs rex.X
ffff80000010da08:	42                   	rex.X
ffff80000010da09:	42                   	rex.X
ffff80000010da0a:	42                   	rex.X
ffff80000010da0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010da0e:	00 00                	add    %al,(%rax)
ffff80000010da10:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010da13:	42 04 04             	rex.X add $0x4,%al
ffff80000010da16:	08 08                	or     %cl,(%rax)
ffff80000010da18:	08 10                	or     %dl,(%rax)
ffff80000010da1a:	10 10                	adc    %dl,(%rax)
ffff80000010da1c:	10 38                	adc    %bh,(%rax)
ffff80000010da1e:	00 00                	add    %al,(%rax)
ffff80000010da20:	00 18                	add    %bl,(%rax)
ffff80000010da22:	24 42                	and    $0x42,%al
ffff80000010da24:	42                   	rex.X
ffff80000010da25:	42 24 18             	rex.X and $0x18,%al
ffff80000010da28:	24 42                	and    $0x42,%al
ffff80000010da2a:	42                   	rex.X
ffff80000010da2b:	42 24 18             	rex.X and $0x18,%al
ffff80000010da2e:	00 00                	add    %al,(%rax)
ffff80000010da30:	00 18                	add    %bl,(%rax)
ffff80000010da32:	24 42                	and    $0x42,%al
ffff80000010da34:	42                   	rex.X
ffff80000010da35:	42                   	rex.X
ffff80000010da36:	42                   	rex.X
ffff80000010da37:	42                   	rex.X
ffff80000010da38:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010da3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010da3e:	00 00                	add    %al,(%rax)
ffff80000010da40:	00 00                	add    %al,(%rax)
ffff80000010da42:	00 00                	add    %al,(%rax)
ffff80000010da44:	00 18                	add    %bl,(%rax)
ffff80000010da46:	18 00                	sbb    %al,(%rax)
ffff80000010da48:	00 00                	add    %al,(%rax)
ffff80000010da4a:	00 00                	add    %al,(%rax)
ffff80000010da4c:	18 18                	sbb    %bl,(%rax)
ffff80000010da4e:	00 00                	add    %al,(%rax)
ffff80000010da50:	00 00                	add    %al,(%rax)
ffff80000010da52:	00 00                	add    %al,(%rax)
ffff80000010da54:	00 18                	add    %bl,(%rax)
ffff80000010da56:	18 00                	sbb    %al,(%rax)
ffff80000010da58:	00 00                	add    %al,(%rax)
ffff80000010da5a:	00 18                	add    %bl,(%rax)
ffff80000010da5c:	18 08                	sbb    %cl,(%rax)
ffff80000010da5e:	08 10                	or     %dl,(%rax)
ffff80000010da60:	00 02                	add    %al,(%rdx)
ffff80000010da62:	04 08                	add    $0x8,%al
ffff80000010da64:	10 20                	adc    %ah,(%rax)
ffff80000010da66:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010da6d:	04 
ffff80000010da6e:	02 00                	add    (%rax),%al
ffff80000010da70:	00 00                	add    %al,(%rax)
ffff80000010da72:	00 00                	add    %al,(%rax)
ffff80000010da74:	00 00                	add    %al,(%rax)
ffff80000010da76:	fe 00                	incb   (%rax)
ffff80000010da78:	00 fe                	add    %bh,%dh
ffff80000010da7a:	00 00                	add    %al,(%rax)
ffff80000010da7c:	00 00                	add    %al,(%rax)
ffff80000010da7e:	00 00                	add    %al,(%rax)
ffff80000010da80:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010da86:	04 02                	add    $0x2,%al
ffff80000010da88:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010da8b:	10 20                	adc    %ah,(%rax)
ffff80000010da8d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010da91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010da95:	82                   	(bad)  
ffff80000010da96:	04 08                	add    $0x8,%al
ffff80000010da98:	10 10                	adc    %dl,(%rax)
ffff80000010da9a:	00 00                	add    %al,(%rax)
ffff80000010da9c:	18 18                	sbb    %bl,(%rax)
ffff80000010da9e:	00 00                	add    %al,(%rax)
ffff80000010daa0:	00 38                	add    %bh,(%rax)
ffff80000010daa2:	44 82                	rex.R (bad) 
ffff80000010daa4:	9a                   	(bad)  
ffff80000010daa5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010daa6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010daa7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010daa8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010daa9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010daaa:	9c                   	pushfq 
ffff80000010daab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010daaf:	00 00                	add    %al,(%rax)
ffff80000010dab1:	18 18                	sbb    %bl,(%rax)
ffff80000010dab3:	18 18                	sbb    %bl,(%rax)
ffff80000010dab5:	24 24                	and    $0x24,%al
ffff80000010dab7:	24 24                	and    $0x24,%al
ffff80000010dab9:	7e 42                	jle    ffff80000010dafd <system_call_table+0x285d>
ffff80000010dabb:	42                   	rex.X
ffff80000010dabc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010dabf:	00 00                	add    %al,(%rax)
ffff80000010dac1:	f0 48                	lock rex.W
ffff80000010dac3:	44                   	rex.R
ffff80000010dac4:	44                   	rex.R
ffff80000010dac5:	44                   	rex.R
ffff80000010dac6:	48 78 44             	rex.W js ffff80000010db0d <system_call_table+0x286d>
ffff80000010dac9:	42                   	rex.X
ffff80000010daca:	42                   	rex.X
ffff80000010dacb:	42                   	rex.X
ffff80000010dacc:	44 f8                	rex.R clc 
ffff80000010dace:	00 00                	add    %al,(%rax)
ffff80000010dad0:	00 3a                	add    %bh,(%rdx)
ffff80000010dad2:	46                   	rex.RX
ffff80000010dad3:	42 82                	rex.X (bad) 
ffff80000010dad5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010dadc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010dadf:	00 00                	add    %al,(%rax)
ffff80000010dae1:	f8                   	clc    
ffff80000010dae2:	44                   	rex.R
ffff80000010dae3:	44                   	rex.R
ffff80000010dae4:	42                   	rex.X
ffff80000010dae5:	42                   	rex.X
ffff80000010dae6:	42                   	rex.X
ffff80000010dae7:	42                   	rex.X
ffff80000010dae8:	42                   	rex.X
ffff80000010dae9:	42                   	rex.X
ffff80000010daea:	42                   	rex.X
ffff80000010daeb:	44                   	rex.R
ffff80000010daec:	44 f8                	rex.R clc 
ffff80000010daee:	00 00                	add    %al,(%rax)
ffff80000010daf0:	00 fe                	add    %bh,%dh
ffff80000010daf2:	42                   	rex.X
ffff80000010daf3:	42                   	rex.X
ffff80000010daf4:	40                   	rex
ffff80000010daf5:	40                   	rex
ffff80000010daf6:	44 7c 44             	rex.R jl ffff80000010db3d <system_call_table+0x289d>
ffff80000010daf9:	40                   	rex
ffff80000010dafa:	40                   	rex
ffff80000010dafb:	42                   	rex.X
ffff80000010dafc:	42 fe 00             	rex.X incb (%rax)
ffff80000010daff:	00 00                	add    %al,(%rax)
ffff80000010db01:	fe 42 42             	incb   0x42(%rdx)
ffff80000010db04:	40                   	rex
ffff80000010db05:	40                   	rex
ffff80000010db06:	44 7c 44             	rex.R jl ffff80000010db4d <system_call_table+0x28ad>
ffff80000010db09:	44                   	rex.R
ffff80000010db0a:	40                   	rex
ffff80000010db0b:	40                   	rex
ffff80000010db0c:	40                   	rex
ffff80000010db0d:	f0 00 00             	lock add %al,(%rax)
ffff80000010db10:	00 3a                	add    %bh,(%rdx)
ffff80000010db12:	46                   	rex.RX
ffff80000010db13:	42 82                	rex.X (bad) 
ffff80000010db15:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010db1c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010db1f:	00 00                	add    %al,(%rax)
ffff80000010db21:	e7 42                	out    %eax,$0x42
ffff80000010db23:	42                   	rex.X
ffff80000010db24:	42                   	rex.X
ffff80000010db25:	42                   	rex.X
ffff80000010db26:	42 7e 42             	rex.X jle ffff80000010db6b <system_call_table+0x28cb>
ffff80000010db29:	42                   	rex.X
ffff80000010db2a:	42                   	rex.X
ffff80000010db2b:	42                   	rex.X
ffff80000010db2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010db2f:	00 00                	add    %al,(%rax)
ffff80000010db31:	7c 10                	jl     ffff80000010db43 <system_call_table+0x28a3>
ffff80000010db33:	10 10                	adc    %dl,(%rax)
ffff80000010db35:	10 10                	adc    %dl,(%rax)
ffff80000010db37:	10 10                	adc    %dl,(%rax)
ffff80000010db39:	10 10                	adc    %dl,(%rax)
ffff80000010db3b:	10 10                	adc    %dl,(%rax)
ffff80000010db3d:	7c 00                	jl     ffff80000010db3f <system_call_table+0x289f>
ffff80000010db3f:	00 00                	add    %al,(%rax)
ffff80000010db41:	1f                   	(bad)  
ffff80000010db42:	04 04                	add    $0x4,%al
ffff80000010db44:	04 04                	add    $0x4,%al
ffff80000010db46:	04 04                	add    $0x4,%al
ffff80000010db48:	04 04                	add    $0x4,%al
ffff80000010db4a:	04 04                	add    $0x4,%al
ffff80000010db4c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010db4f:	00 00                	add    %al,(%rax)
ffff80000010db51:	e7 42                	out    %eax,$0x42
ffff80000010db53:	44                   	rex.R
ffff80000010db54:	48 50                	rex.W push %rax
ffff80000010db56:	50                   	push   %rax
ffff80000010db57:	60                   	(bad)  
ffff80000010db58:	50                   	push   %rax
ffff80000010db59:	50                   	push   %rax
ffff80000010db5a:	48                   	rex.W
ffff80000010db5b:	44                   	rex.R
ffff80000010db5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010db5f:	00 00                	add    %al,(%rax)
ffff80000010db61:	f0 40                	lock rex
ffff80000010db63:	40                   	rex
ffff80000010db64:	40                   	rex
ffff80000010db65:	40                   	rex
ffff80000010db66:	40                   	rex
ffff80000010db67:	40                   	rex
ffff80000010db68:	40                   	rex
ffff80000010db69:	40                   	rex
ffff80000010db6a:	40                   	rex
ffff80000010db6b:	42                   	rex.X
ffff80000010db6c:	42 fe 00             	rex.X incb (%rax)
ffff80000010db6f:	00 00                	add    %al,(%rax)
ffff80000010db71:	c3                   	retq   
ffff80000010db72:	42                   	rex.X
ffff80000010db73:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010db77:	5a                   	pop    %rdx
ffff80000010db78:	5a                   	pop    %rdx
ffff80000010db79:	42                   	rex.X
ffff80000010db7a:	42                   	rex.X
ffff80000010db7b:	42                   	rex.X
ffff80000010db7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010db7f:	00 00                	add    %al,(%rax)
ffff80000010db81:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010db88:	4a                   	rex.WX
ffff80000010db89:	4a                   	rex.WX
ffff80000010db8a:	4a                   	rex.WX
ffff80000010db8b:	46                   	rex.RX
ffff80000010db8c:	46 e2 00             	rex.RX loop ffff80000010db8f <system_call_table+0x28ef>
ffff80000010db8f:	00 00                	add    %al,(%rax)
ffff80000010db91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010db95:	82                   	(bad)  
ffff80000010db96:	82                   	(bad)  
ffff80000010db97:	82                   	(bad)  
ffff80000010db98:	82                   	(bad)  
ffff80000010db99:	82                   	(bad)  
ffff80000010db9a:	82                   	(bad)  
ffff80000010db9b:	82                   	(bad)  
ffff80000010db9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010db9f:	00 00                	add    %al,(%rax)
ffff80000010dba1:	f8                   	clc    
ffff80000010dba2:	44                   	rex.R
ffff80000010dba3:	42                   	rex.X
ffff80000010dba4:	42                   	rex.X
ffff80000010dba5:	42                   	rex.X
ffff80000010dba6:	44 78 40             	rex.R js ffff80000010dbe9 <system_call_table+0x2949>
ffff80000010dba9:	40                   	rex
ffff80000010dbaa:	40                   	rex
ffff80000010dbab:	40                   	rex
ffff80000010dbac:	40                   	rex
ffff80000010dbad:	f0 00 00             	lock add %al,(%rax)
ffff80000010dbb0:	00 38                	add    %bh,(%rax)
ffff80000010dbb2:	44 82                	rex.R (bad) 
ffff80000010dbb4:	82                   	(bad)  
ffff80000010dbb5:	82                   	(bad)  
ffff80000010dbb6:	82                   	(bad)  
ffff80000010dbb7:	82                   	(bad)  
ffff80000010dbb8:	82                   	(bad)  
ffff80000010dbb9:	82                   	(bad)  
ffff80000010dbba:	92                   	xchg   %eax,%edx
ffff80000010dbbb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010dbbf:	00 00                	add    %al,(%rax)
ffff80000010dbc1:	fc                   	cld    
ffff80000010dbc2:	42                   	rex.X
ffff80000010dbc3:	42                   	rex.X
ffff80000010dbc4:	42                   	rex.X
ffff80000010dbc5:	42 7c 44             	rex.X jl ffff80000010dc0c <system_call_table+0x296c>
ffff80000010dbc8:	42                   	rex.X
ffff80000010dbc9:	42                   	rex.X
ffff80000010dbca:	42                   	rex.X
ffff80000010dbcb:	42                   	rex.X
ffff80000010dbcc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010dbcf:	00 00                	add    %al,(%rax)
ffff80000010dbd1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010dbd4:	82                   	(bad)  
ffff80000010dbd5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010dbd9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010dbdf:	00 00                	add    %al,(%rax)
ffff80000010dbe1:	fe                   	(bad)  
ffff80000010dbe2:	92                   	xchg   %eax,%edx
ffff80000010dbe3:	92                   	xchg   %eax,%edx
ffff80000010dbe4:	10 10                	adc    %dl,(%rax)
ffff80000010dbe6:	10 10                	adc    %dl,(%rax)
ffff80000010dbe8:	10 10                	adc    %dl,(%rax)
ffff80000010dbea:	10 10                	adc    %dl,(%rax)
ffff80000010dbec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010dbf0:	00 e7                	add    %ah,%bh
ffff80000010dbf2:	42                   	rex.X
ffff80000010dbf3:	42                   	rex.X
ffff80000010dbf4:	42                   	rex.X
ffff80000010dbf5:	42                   	rex.X
ffff80000010dbf6:	42                   	rex.X
ffff80000010dbf7:	42                   	rex.X
ffff80000010dbf8:	42                   	rex.X
ffff80000010dbf9:	42                   	rex.X
ffff80000010dbfa:	42                   	rex.X
ffff80000010dbfb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010dbfe:	00 00                	add    %al,(%rax)
ffff80000010dc00:	00 e7                	add    %ah,%bh
ffff80000010dc02:	42                   	rex.X
ffff80000010dc03:	42                   	rex.X
ffff80000010dc04:	42                   	rex.X
ffff80000010dc05:	42 24 24             	rex.X and $0x24,%al
ffff80000010dc08:	24 24                	and    $0x24,%al
ffff80000010dc0a:	18 18                	sbb    %bl,(%rax)
ffff80000010dc0c:	18 18                	sbb    %bl,(%rax)
ffff80000010dc0e:	00 00                	add    %al,(%rax)
ffff80000010dc10:	00 e7                	add    %ah,%bh
ffff80000010dc12:	42                   	rex.X
ffff80000010dc13:	42                   	rex.X
ffff80000010dc14:	42 5a                	rex.X pop %rdx
ffff80000010dc16:	5a                   	pop    %rdx
ffff80000010dc17:	5a                   	pop    %rdx
ffff80000010dc18:	5a                   	pop    %rdx
ffff80000010dc19:	24 24                	and    $0x24,%al
ffff80000010dc1b:	24 24                	and    $0x24,%al
ffff80000010dc1d:	24 00                	and    $0x0,%al
ffff80000010dc1f:	00 00                	add    %al,(%rax)
ffff80000010dc21:	e7 42                	out    %eax,$0x42
ffff80000010dc23:	42 24 24             	rex.X and $0x24,%al
ffff80000010dc26:	24 18                	and    $0x18,%al
ffff80000010dc28:	24 24                	and    $0x24,%al
ffff80000010dc2a:	24 42                	and    $0x42,%al
ffff80000010dc2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010dc2f:	00 00                	add    %al,(%rax)
ffff80000010dc31:	ee                   	out    %al,(%dx)
ffff80000010dc32:	44                   	rex.R
ffff80000010dc33:	44                   	rex.R
ffff80000010dc34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010dc37:	28 10                	sub    %dl,(%rax)
ffff80000010dc39:	10 10                	adc    %dl,(%rax)
ffff80000010dc3b:	10 10                	adc    %dl,(%rax)
ffff80000010dc3d:	7c 00                	jl     ffff80000010dc3f <system_call_table+0x299f>
ffff80000010dc3f:	00 00                	add    %al,(%rax)
ffff80000010dc41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010dc48:	20 20                	and    %ah,(%rax)
ffff80000010dc4a:	40                   	rex
ffff80000010dc4b:	42 82                	rex.X (bad) 
ffff80000010dc4d:	fe 00                	incb   (%rax)
ffff80000010dc4f:	00 00                	add    %al,(%rax)
ffff80000010dc51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010dc54:	20 20                	and    %ah,(%rax)
ffff80000010dc56:	20 20                	and    %ah,(%rax)
ffff80000010dc58:	20 20                	and    %ah,(%rax)
ffff80000010dc5a:	20 20                	and    %ah,(%rax)
ffff80000010dc5c:	20 20                	and    %ah,(%rax)
ffff80000010dc5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010dc65:	20 20                	and    %ah,(%rax)
ffff80000010dc67:	10 10                	adc    %dl,(%rax)
ffff80000010dc69:	08 08                	or     %cl,(%rax)
ffff80000010dc6b:	04 04                	add    $0x4,%al
ffff80000010dc6d:	04 02                	add    $0x2,%al
ffff80000010dc6f:	02 00                	add    (%rax),%al
ffff80000010dc71:	7c 04                	jl     ffff80000010dc77 <system_call_table+0x29d7>
ffff80000010dc73:	04 04                	add    $0x4,%al
ffff80000010dc75:	04 04                	add    $0x4,%al
ffff80000010dc77:	04 04                	add    $0x4,%al
ffff80000010dc79:	04 04                	add    $0x4,%al
ffff80000010dc7b:	04 04                	add    $0x4,%al
ffff80000010dc7d:	04 7c                	add    $0x7c,%al
ffff80000010dc7f:	00 00                	add    %al,(%rax)
ffff80000010dc81:	10 28                	adc    %ch,(%rax)
ffff80000010dc83:	44 82                	rex.R (bad) 
	...
ffff80000010dc9d:	00 fe                	add    %bh,%dh
ffff80000010dc9f:	00 10                	add    %dl,(%rax)
ffff80000010dca1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010dcb4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010dcb7:	04 3c                	add    $0x3c,%al
ffff80000010dcb9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010dcc0:	c0 
ffff80000010dcc1:	40                   	rex
ffff80000010dcc2:	40                   	rex
ffff80000010dcc3:	40                   	rex
ffff80000010dcc4:	40 58                	rex pop %rax
ffff80000010dcc6:	64 42                	fs rex.X
ffff80000010dcc8:	42                   	rex.X
ffff80000010dcc9:	42                   	rex.X
ffff80000010dcca:	42                   	rex.X
ffff80000010dccb:	42                   	rex.X
ffff80000010dccc:	64 58                	fs pop %rax
ffff80000010dcce:	00 00                	add    %al,(%rax)
ffff80000010dcd0:	00 00                	add    %al,(%rax)
ffff80000010dcd2:	00 00                	add    %al,(%rax)
ffff80000010dcd4:	00 30                	add    %dh,(%rax)
ffff80000010dcd6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010dcdd:	38 
ffff80000010dcde:	00 00                	add    %al,(%rax)
ffff80000010dce0:	0c 04                	or     $0x4,%al
ffff80000010dce2:	04 04                	add    $0x4,%al
ffff80000010dce4:	04 34                	add    $0x34,%al
ffff80000010dce6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010dced:	36 
ffff80000010dcee:	00 00                	add    %al,(%rax)
ffff80000010dcf0:	00 00                	add    %al,(%rax)
ffff80000010dcf2:	00 00                	add    %al,(%rax)
ffff80000010dcf4:	00 38                	add    %bh,(%rax)
ffff80000010dcf6:	44 82                	rex.R (bad) 
ffff80000010dcf8:	82                   	(bad)  
ffff80000010dcf9:	fc                   	cld    
ffff80000010dcfa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010dd01:	10 10                	adc    %dl,(%rax)
ffff80000010dd03:	10 10                	adc    %dl,(%rax)
ffff80000010dd05:	7c 10                	jl     ffff80000010dd17 <system_call_table+0x2a77>
ffff80000010dd07:	10 10                	adc    %dl,(%rax)
ffff80000010dd09:	10 10                	adc    %dl,(%rax)
ffff80000010dd0b:	10 10                	adc    %dl,(%rax)
ffff80000010dd0d:	7c 00                	jl     ffff80000010dd0f <system_call_table+0x2a6f>
ffff80000010dd0f:	00 00                	add    %al,(%rax)
ffff80000010dd11:	00 00                	add    %al,(%rax)
ffff80000010dd13:	00 00                	add    %al,(%rax)
ffff80000010dd15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010dd1c:	34 04 
ffff80000010dd1e:	04 38                	add    $0x38,%al
ffff80000010dd20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010dd24:	40 58                	rex pop %rax
ffff80000010dd26:	64 42                	fs rex.X
ffff80000010dd28:	42                   	rex.X
ffff80000010dd29:	42                   	rex.X
ffff80000010dd2a:	42                   	rex.X
ffff80000010dd2b:	42                   	rex.X
ffff80000010dd2c:	42 e3 00             	rex.X jrcxz ffff80000010dd2f <system_call_table+0x2a8f>
ffff80000010dd2f:	00 00                	add    %al,(%rax)
ffff80000010dd31:	10 10                	adc    %dl,(%rax)
ffff80000010dd33:	00 00                	add    %al,(%rax)
ffff80000010dd35:	30 10                	xor    %dl,(%rax)
ffff80000010dd37:	10 10                	adc    %dl,(%rax)
ffff80000010dd39:	10 10                	adc    %dl,(%rax)
ffff80000010dd3b:	10 10                	adc    %dl,(%rax)
ffff80000010dd3d:	38 00                	cmp    %al,(%rax)
ffff80000010dd3f:	00 00                	add    %al,(%rax)
ffff80000010dd41:	04 04                	add    $0x4,%al
ffff80000010dd43:	00 00                	add    %al,(%rax)
ffff80000010dd45:	0c 04                	or     $0x4,%al
ffff80000010dd47:	04 04                	add    $0x4,%al
ffff80000010dd49:	04 04                	add    $0x4,%al
ffff80000010dd4b:	04 04                	add    $0x4,%al
ffff80000010dd4d:	08 08                	or     %cl,(%rax)
ffff80000010dd4f:	30 c0                	xor    %al,%al
ffff80000010dd51:	40                   	rex
ffff80000010dd52:	40                   	rex
ffff80000010dd53:	40                   	rex
ffff80000010dd54:	40                   	rex
ffff80000010dd55:	4e                   	rex.WRX
ffff80000010dd56:	44                   	rex.R
ffff80000010dd57:	48 50                	rex.W push %rax
ffff80000010dd59:	60                   	(bad)  
ffff80000010dd5a:	50                   	push   %rax
ffff80000010dd5b:	48                   	rex.W
ffff80000010dd5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010dd5f:	00 30                	add    %dh,(%rax)
ffff80000010dd61:	10 10                	adc    %dl,(%rax)
ffff80000010dd63:	10 10                	adc    %dl,(%rax)
ffff80000010dd65:	10 10                	adc    %dl,(%rax)
ffff80000010dd67:	10 10                	adc    %dl,(%rax)
ffff80000010dd69:	10 10                	adc    %dl,(%rax)
ffff80000010dd6b:	10 10                	adc    %dl,(%rax)
ffff80000010dd6d:	38 00                	cmp    %al,(%rax)
ffff80000010dd6f:	00 00                	add    %al,(%rax)
ffff80000010dd71:	00 00                	add    %al,(%rax)
ffff80000010dd73:	00 00                	add    %al,(%rax)
ffff80000010dd75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010dd79:	49                   	rex.WB
ffff80000010dd7a:	49                   	rex.WB
ffff80000010dd7b:	49                   	rex.WB
ffff80000010dd7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010dd7f:	00 00                	add    %al,(%rax)
ffff80000010dd81:	00 00                	add    %al,(%rax)
ffff80000010dd83:	00 00                	add    %al,(%rax)
ffff80000010dd85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010dd89:	42                   	rex.X
ffff80000010dd8a:	42                   	rex.X
ffff80000010dd8b:	42                   	rex.X
ffff80000010dd8c:	42 e3 00             	rex.X jrcxz ffff80000010dd8f <system_call_table+0x2aef>
ffff80000010dd8f:	00 00                	add    %al,(%rax)
ffff80000010dd91:	00 00                	add    %al,(%rax)
ffff80000010dd93:	00 00                	add    %al,(%rax)
ffff80000010dd95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010dd99:	82                   	(bad)  
ffff80000010dd9a:	82                   	(bad)  
ffff80000010dd9b:	82                   	(bad)  
ffff80000010dd9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010dd9f:	00 00                	add    %al,(%rax)
ffff80000010dda1:	00 00                	add    %al,(%rax)
ffff80000010dda3:	00 d8                	add    %bl,%al
ffff80000010dda5:	64 42                	fs rex.X
ffff80000010dda7:	42                   	rex.X
ffff80000010dda8:	42                   	rex.X
ffff80000010dda9:	42                   	rex.X
ffff80000010ddaa:	42                   	rex.X
ffff80000010ddab:	64 58                	fs pop %rax
ffff80000010ddad:	40                   	rex
ffff80000010ddae:	40 e0 00             	rex loopne ffff80000010ddb1 <system_call_table+0x2b11>
ffff80000010ddb1:	00 00                	add    %al,(%rax)
ffff80000010ddb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010ddb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010ddbd:	04 04                	add    $0x4,%al
ffff80000010ddbf:	0e                   	(bad)  
ffff80000010ddc0:	00 00                	add    %al,(%rax)
ffff80000010ddc2:	00 00                	add    %al,(%rax)
ffff80000010ddc4:	00 dc                	add    %bl,%ah
ffff80000010ddc6:	62 42                	(bad)  
ffff80000010ddc8:	40                   	rex
ffff80000010ddc9:	40                   	rex
ffff80000010ddca:	40                   	rex
ffff80000010ddcb:	40                   	rex
ffff80000010ddcc:	40 e0 00             	rex loopne ffff80000010ddcf <system_call_table+0x2b2f>
ffff80000010ddcf:	00 00                	add    %al,(%rax)
ffff80000010ddd1:	00 00                	add    %al,(%rax)
ffff80000010ddd3:	00 00                	add    %al,(%rax)
ffff80000010ddd5:	7a 86                	jp     ffff80000010dd5d <system_call_table+0x2abd>
ffff80000010ddd7:	82                   	(bad)  
ffff80000010ddd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010dddb:	82                   	(bad)  
ffff80000010dddc:	c2 bc 00             	retq   $0xbc
ffff80000010dddf:	00 00                	add    %al,(%rax)
ffff80000010dde1:	00 10                	add    %dl,(%rax)
ffff80000010dde3:	10 10                	adc    %dl,(%rax)
ffff80000010dde5:	7c 10                	jl     ffff80000010ddf7 <system_call_table+0x2b57>
ffff80000010dde7:	10 10                	adc    %dl,(%rax)
ffff80000010dde9:	10 10                	adc    %dl,(%rax)
ffff80000010ddeb:	10 10                	adc    %dl,(%rax)
ffff80000010dded:	0e                   	(bad)  
ffff80000010ddee:	00 00                	add    %al,(%rax)
ffff80000010ddf0:	00 00                	add    %al,(%rax)
ffff80000010ddf2:	00 00                	add    %al,(%rax)
ffff80000010ddf4:	00 c6                	add    %al,%dh
ffff80000010ddf6:	42                   	rex.X
ffff80000010ddf7:	42                   	rex.X
ffff80000010ddf8:	42                   	rex.X
ffff80000010ddf9:	42                   	rex.X
ffff80000010ddfa:	42                   	rex.X
ffff80000010ddfb:	42                   	rex.X
ffff80000010ddfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010ddff:	00 00                	add    %al,(%rax)
ffff80000010de01:	00 00                	add    %al,(%rax)
ffff80000010de03:	00 00                	add    %al,(%rax)
ffff80000010de05:	e7 42                	out    %eax,$0x42
ffff80000010de07:	42                   	rex.X
ffff80000010de08:	42 24 24             	rex.X and $0x24,%al
ffff80000010de0b:	24 18                	and    $0x18,%al
ffff80000010de0d:	18 00                	sbb    %al,(%rax)
ffff80000010de0f:	00 00                	add    %al,(%rax)
ffff80000010de11:	00 00                	add    %al,(%rax)
ffff80000010de13:	00 00                	add    %al,(%rax)
ffff80000010de15:	e7 42                	out    %eax,$0x42
ffff80000010de17:	42 5a                	rex.X pop %rdx
ffff80000010de19:	5a                   	pop    %rdx
ffff80000010de1a:	5a                   	pop    %rdx
ffff80000010de1b:	24 24                	and    $0x24,%al
ffff80000010de1d:	24 00                	and    $0x0,%al
ffff80000010de1f:	00 00                	add    %al,(%rax)
ffff80000010de21:	00 00                	add    %al,(%rax)
ffff80000010de23:	00 00                	add    %al,(%rax)
ffff80000010de25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010de2a:	28 28                	sub    %ch,(%rax)
ffff80000010de2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010de30:	00 00                	add    %al,(%rax)
ffff80000010de32:	00 00                	add    %al,(%rax)
ffff80000010de34:	00 e7                	add    %ah,%bh
ffff80000010de36:	42                   	rex.X
ffff80000010de37:	42 24 24             	rex.X and $0x24,%al
ffff80000010de3a:	24 18                	and    $0x18,%al
ffff80000010de3c:	18 10                	sbb    %dl,(%rax)
ffff80000010de3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010de41:	00 00                	add    %al,(%rax)
ffff80000010de43:	00 00                	add    %al,(%rax)
ffff80000010de45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010de4b:	42 82                	rex.X (bad) 
ffff80000010de4d:	fe 00                	incb   (%rax)
ffff80000010de4f:	00 00                	add    %al,(%rax)
ffff80000010de51:	06                   	(bad)  
ffff80000010de52:	08 10                	or     %dl,(%rax)
ffff80000010de54:	10 10                	adc    %dl,(%rax)
ffff80000010de56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010de59:	10 10                	adc    %dl,(%rax)
ffff80000010de5b:	10 08                	adc    %cl,(%rax)
ffff80000010de5d:	06                   	(bad)  
ffff80000010de5e:	00 00                	add    %al,(%rax)
ffff80000010de60:	10 10                	adc    %dl,(%rax)
ffff80000010de62:	10 10                	adc    %dl,(%rax)
ffff80000010de64:	10 10                	adc    %dl,(%rax)
ffff80000010de66:	10 10                	adc    %dl,(%rax)
ffff80000010de68:	10 10                	adc    %dl,(%rax)
ffff80000010de6a:	10 10                	adc    %dl,(%rax)
ffff80000010de6c:	10 10                	adc    %dl,(%rax)
ffff80000010de6e:	10 10                	adc    %dl,(%rax)
ffff80000010de70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010de73:	08 08                	or     %cl,(%rax)
ffff80000010de75:	08 08                	or     %cl,(%rax)
ffff80000010de77:	06                   	(bad)  
ffff80000010de78:	08 08                	or     %cl,(%rax)
ffff80000010de7a:	08 08                	or     %cl,(%rax)
ffff80000010de7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010de7f:	00 00                	add    %al,(%rax)
ffff80000010de81:	72 8c                	jb     ffff80000010de0f <system_call_table+0x2b6f>
	...
ffff80000010e8af:	00 00                	add    %al,(%rax)
ffff80000010e8b1:	10 10                	adc    %dl,(%rax)
ffff80000010e8b3:	10 10                	adc    %dl,(%rax)
ffff80000010e8b5:	10 10                	adc    %dl,(%rax)
ffff80000010e8b7:	10 10                	adc    %dl,(%rax)
ffff80000010e8b9:	10 00                	adc    %al,(%rax)
ffff80000010e8bb:	00 10                	add    %dl,(%rax)
ffff80000010e8bd:	10 00                	adc    %al,(%rax)
ffff80000010e8bf:	00 28                	add    %ch,(%rax)
ffff80000010e8c1:	28 28                	sub    %ch,(%rax)
	...
ffff80000010e8cf:	00 00                	add    %al,(%rax)
ffff80000010e8d1:	44                   	rex.R
ffff80000010e8d2:	44                   	rex.R
ffff80000010e8d3:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e8d8:	44                   	rex.R
ffff80000010e8d9:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010e8de:	00 00                	add    %al,(%rax)
ffff80000010e8e0:	10 3a                	adc    %bh,(%rdx)
ffff80000010e8e2:	56                   	push   %rsi
ffff80000010e8e3:	92                   	xchg   %eax,%edx
ffff80000010e8e4:	92                   	xchg   %eax,%edx
ffff80000010e8e5:	90                   	nop
ffff80000010e8e6:	50                   	push   %rax
ffff80000010e8e7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010e8ea:	92                   	xchg   %eax,%edx
ffff80000010e8eb:	92                   	xchg   %eax,%edx
ffff80000010e8ec:	d4                   	(bad)  
ffff80000010e8ed:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010e8f2:	94                   	xchg   %eax,%esp
ffff80000010e8f3:	94                   	xchg   %eax,%esp
ffff80000010e8f4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010e8f9:	2c 52                	sub    $0x52,%al
ffff80000010e8fb:	52                   	push   %rdx
ffff80000010e8fc:	92                   	xchg   %eax,%edx
ffff80000010e8fd:	8c 00                	mov    %es,(%rax)
ffff80000010e8ff:	00 00                	add    %al,(%rax)
ffff80000010e901:	70 88                	jo     ffff80000010e88b <system_call_table+0x35eb>
ffff80000010e903:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010e909:	92                   	xchg   %eax,%edx
ffff80000010e90a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010e911:	08 10                	or     %dl,(%rax)
	...
ffff80000010e91f:	00 02                	add    %al,(%rdx)
ffff80000010e921:	04 08                	add    $0x8,%al
ffff80000010e923:	08 10                	or     %dl,(%rax)
ffff80000010e925:	10 10                	adc    %dl,(%rax)
ffff80000010e927:	10 10                	adc    %dl,(%rax)
ffff80000010e929:	10 10                	adc    %dl,(%rax)
ffff80000010e92b:	08 08                	or     %cl,(%rax)
ffff80000010e92d:	04 02                	add    $0x2,%al
ffff80000010e92f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010e935:	10 10                	adc    %dl,(%rax)
ffff80000010e937:	10 10                	adc    %dl,(%rax)
ffff80000010e939:	10 10                	adc    %dl,(%rax)
ffff80000010e93b:	20 20                	and    %ah,(%rax)
ffff80000010e93d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010e941:	00 00                	add    %al,(%rax)
ffff80000010e943:	00 00                	add    %al,(%rax)
ffff80000010e945:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010e94b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e955:	10 10                	adc    %dl,(%rax)
ffff80000010e957:	10 fe                	adc    %bh,%dh
ffff80000010e959:	10 10                	adc    %dl,(%rax)
ffff80000010e95b:	10 00                	adc    %al,(%rax)
	...
ffff80000010e969:	00 00                	add    %al,(%rax)
ffff80000010e96b:	18 18                	sbb    %bl,(%rax)
ffff80000010e96d:	08 08                	or     %cl,(%rax)
ffff80000010e96f:	10 00                	adc    %al,(%rax)
ffff80000010e971:	00 00                	add    %al,(%rax)
ffff80000010e973:	00 00                	add    %al,(%rax)
ffff80000010e975:	00 00                	add    %al,(%rax)
ffff80000010e977:	00 fe                	add    %bh,%dh
	...
ffff80000010e989:	00 00                	add    %al,(%rax)
ffff80000010e98b:	00 18                	add    %bl,(%rax)
ffff80000010e98d:	18 00                	sbb    %al,(%rax)
ffff80000010e98f:	00 02                	add    %al,(%rdx)
ffff80000010e991:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010e994:	08 08                	or     %cl,(%rax)
ffff80000010e996:	08 10                	or     %dl,(%rax)
ffff80000010e998:	10 20                	adc    %ah,(%rax)
ffff80000010e99a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e99d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010e9a4:	42 
ffff80000010e9a5:	42                   	rex.X
ffff80000010e9a6:	42                   	rex.X
ffff80000010e9a7:	42                   	rex.X
ffff80000010e9a8:	42                   	rex.X
ffff80000010e9a9:	42                   	rex.X
ffff80000010e9aa:	42 24 24             	rex.X and $0x24,%al
ffff80000010e9ad:	18 00                	sbb    %al,(%rax)
ffff80000010e9af:	00 00                	add    %al,(%rax)
ffff80000010e9b1:	08 18                	or     %bl,(%rax)
ffff80000010e9b3:	28 08                	sub    %cl,(%rax)
ffff80000010e9b5:	08 08                	or     %cl,(%rax)
ffff80000010e9b7:	08 08                	or     %cl,(%rax)
ffff80000010e9b9:	08 08                	or     %cl,(%rax)
ffff80000010e9bb:	08 08                	or     %cl,(%rax)
ffff80000010e9bd:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010e9c0:	00 18                	add    %bl,(%rax)
ffff80000010e9c2:	24 42                	and    $0x42,%al
ffff80000010e9c4:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010e9c8:	10 20                	adc    %ah,(%rax)
ffff80000010e9ca:	20 40 40             	and    %al,0x40(%rax)
ffff80000010e9cd:	7e 00                	jle    ffff80000010e9cf <system_call_table+0x372f>
ffff80000010e9cf:	00 00                	add    %al,(%rax)
ffff80000010e9d1:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010e9d4:	02 02                	add    (%rdx),%al
ffff80000010e9d6:	04 18                	add    $0x18,%al
ffff80000010e9d8:	04 02                	add    $0x2,%al
ffff80000010e9da:	02 42 24             	add    0x24(%rdx),%al
ffff80000010e9dd:	18 00                	sbb    %al,(%rax)
ffff80000010e9df:	00 00                	add    %al,(%rax)
ffff80000010e9e1:	0c 0c                	or     $0xc,%al
ffff80000010e9e3:	0c 14                	or     $0x14,%al
ffff80000010e9e5:	14 14                	adc    $0x14,%al
ffff80000010e9e7:	24 24                	and    $0x24,%al
ffff80000010e9e9:	44 7e 04             	rex.R jle ffff80000010e9f0 <system_call_table+0x3750>
ffff80000010e9ec:	04 1e                	add    $0x1e,%al
ffff80000010e9ee:	00 00                	add    %al,(%rax)
ffff80000010e9f0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010e9f4:	40 58                	rex pop %rax
ffff80000010e9f6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010e9f9:	02 02                	add    (%rdx),%al
ffff80000010e9fb:	42 24 18             	rex.X and $0x18,%al
ffff80000010e9fe:	00 00                	add    %al,(%rax)
ffff80000010ea00:	00 18                	add    %bl,(%rax)
ffff80000010ea02:	24 42                	and    $0x42,%al
ffff80000010ea04:	40 58                	rex pop %rax
ffff80000010ea06:	64 42                	fs rex.X
ffff80000010ea08:	42                   	rex.X
ffff80000010ea09:	42                   	rex.X
ffff80000010ea0a:	42                   	rex.X
ffff80000010ea0b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ea0e:	00 00                	add    %al,(%rax)
ffff80000010ea10:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010ea13:	42 04 04             	rex.X add $0x4,%al
ffff80000010ea16:	08 08                	or     %cl,(%rax)
ffff80000010ea18:	08 10                	or     %dl,(%rax)
ffff80000010ea1a:	10 10                	adc    %dl,(%rax)
ffff80000010ea1c:	10 38                	adc    %bh,(%rax)
ffff80000010ea1e:	00 00                	add    %al,(%rax)
ffff80000010ea20:	00 18                	add    %bl,(%rax)
ffff80000010ea22:	24 42                	and    $0x42,%al
ffff80000010ea24:	42                   	rex.X
ffff80000010ea25:	42 24 18             	rex.X and $0x18,%al
ffff80000010ea28:	24 42                	and    $0x42,%al
ffff80000010ea2a:	42                   	rex.X
ffff80000010ea2b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ea2e:	00 00                	add    %al,(%rax)
ffff80000010ea30:	00 18                	add    %bl,(%rax)
ffff80000010ea32:	24 42                	and    $0x42,%al
ffff80000010ea34:	42                   	rex.X
ffff80000010ea35:	42                   	rex.X
ffff80000010ea36:	42                   	rex.X
ffff80000010ea37:	42                   	rex.X
ffff80000010ea38:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010ea3b:	42 24 18             	rex.X and $0x18,%al
ffff80000010ea3e:	00 00                	add    %al,(%rax)
ffff80000010ea40:	00 00                	add    %al,(%rax)
ffff80000010ea42:	00 00                	add    %al,(%rax)
ffff80000010ea44:	00 18                	add    %bl,(%rax)
ffff80000010ea46:	18 00                	sbb    %al,(%rax)
ffff80000010ea48:	00 00                	add    %al,(%rax)
ffff80000010ea4a:	00 00                	add    %al,(%rax)
ffff80000010ea4c:	18 18                	sbb    %bl,(%rax)
ffff80000010ea4e:	00 00                	add    %al,(%rax)
ffff80000010ea50:	00 00                	add    %al,(%rax)
ffff80000010ea52:	00 00                	add    %al,(%rax)
ffff80000010ea54:	00 18                	add    %bl,(%rax)
ffff80000010ea56:	18 00                	sbb    %al,(%rax)
ffff80000010ea58:	00 00                	add    %al,(%rax)
ffff80000010ea5a:	00 18                	add    %bl,(%rax)
ffff80000010ea5c:	18 08                	sbb    %cl,(%rax)
ffff80000010ea5e:	08 10                	or     %dl,(%rax)
ffff80000010ea60:	00 02                	add    %al,(%rdx)
ffff80000010ea62:	04 08                	add    $0x8,%al
ffff80000010ea64:	10 20                	adc    %ah,(%rax)
ffff80000010ea66:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010ea6d:	04 
ffff80000010ea6e:	02 00                	add    (%rax),%al
ffff80000010ea70:	00 00                	add    %al,(%rax)
ffff80000010ea72:	00 00                	add    %al,(%rax)
ffff80000010ea74:	00 00                	add    %al,(%rax)
ffff80000010ea76:	fe 00                	incb   (%rax)
ffff80000010ea78:	00 fe                	add    %bh,%dh
ffff80000010ea7a:	00 00                	add    %al,(%rax)
ffff80000010ea7c:	00 00                	add    %al,(%rax)
ffff80000010ea7e:	00 00                	add    %al,(%rax)
ffff80000010ea80:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010ea86:	04 02                	add    $0x2,%al
ffff80000010ea88:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010ea8b:	10 20                	adc    %ah,(%rax)
ffff80000010ea8d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010ea91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ea95:	82                   	(bad)  
ffff80000010ea96:	04 08                	add    $0x8,%al
ffff80000010ea98:	10 10                	adc    %dl,(%rax)
ffff80000010ea9a:	00 00                	add    %al,(%rax)
ffff80000010ea9c:	18 18                	sbb    %bl,(%rax)
ffff80000010ea9e:	00 00                	add    %al,(%rax)
ffff80000010eaa0:	00 38                	add    %bh,(%rax)
ffff80000010eaa2:	44 82                	rex.R (bad) 
ffff80000010eaa4:	9a                   	(bad)  
ffff80000010eaa5:	aa                   	stos   %al,%es:(%rdi)
ffff80000010eaa6:	aa                   	stos   %al,%es:(%rdi)
ffff80000010eaa7:	aa                   	stos   %al,%es:(%rdi)
ffff80000010eaa8:	aa                   	stos   %al,%es:(%rdi)
ffff80000010eaa9:	aa                   	stos   %al,%es:(%rdi)
ffff80000010eaaa:	9c                   	pushfq 
ffff80000010eaab:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010eaaf:	00 00                	add    %al,(%rax)
ffff80000010eab1:	18 18                	sbb    %bl,(%rax)
ffff80000010eab3:	18 18                	sbb    %bl,(%rax)
ffff80000010eab5:	24 24                	and    $0x24,%al
ffff80000010eab7:	24 24                	and    $0x24,%al
ffff80000010eab9:	7e 42                	jle    ffff80000010eafd <system_call_table+0x385d>
ffff80000010eabb:	42                   	rex.X
ffff80000010eabc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010eabf:	00 00                	add    %al,(%rax)
ffff80000010eac1:	f0 48                	lock rex.W
ffff80000010eac3:	44                   	rex.R
ffff80000010eac4:	44                   	rex.R
ffff80000010eac5:	44                   	rex.R
ffff80000010eac6:	48 78 44             	rex.W js ffff80000010eb0d <system_call_table+0x386d>
ffff80000010eac9:	42                   	rex.X
ffff80000010eaca:	42                   	rex.X
ffff80000010eacb:	42                   	rex.X
ffff80000010eacc:	44 f8                	rex.R clc 
ffff80000010eace:	00 00                	add    %al,(%rax)
ffff80000010ead0:	00 3a                	add    %bh,(%rdx)
ffff80000010ead2:	46                   	rex.RX
ffff80000010ead3:	42 82                	rex.X (bad) 
ffff80000010ead5:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010eadc:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010eadf:	00 00                	add    %al,(%rax)
ffff80000010eae1:	f8                   	clc    
ffff80000010eae2:	44                   	rex.R
ffff80000010eae3:	44                   	rex.R
ffff80000010eae4:	42                   	rex.X
ffff80000010eae5:	42                   	rex.X
ffff80000010eae6:	42                   	rex.X
ffff80000010eae7:	42                   	rex.X
ffff80000010eae8:	42                   	rex.X
ffff80000010eae9:	42                   	rex.X
ffff80000010eaea:	42                   	rex.X
ffff80000010eaeb:	44                   	rex.R
ffff80000010eaec:	44 f8                	rex.R clc 
ffff80000010eaee:	00 00                	add    %al,(%rax)
ffff80000010eaf0:	00 fe                	add    %bh,%dh
ffff80000010eaf2:	42                   	rex.X
ffff80000010eaf3:	42                   	rex.X
ffff80000010eaf4:	40                   	rex
ffff80000010eaf5:	40                   	rex
ffff80000010eaf6:	44 7c 44             	rex.R jl ffff80000010eb3d <system_call_table+0x389d>
ffff80000010eaf9:	40                   	rex
ffff80000010eafa:	40                   	rex
ffff80000010eafb:	42                   	rex.X
ffff80000010eafc:	42 fe 00             	rex.X incb (%rax)
ffff80000010eaff:	00 00                	add    %al,(%rax)
ffff80000010eb01:	fe 42 42             	incb   0x42(%rdx)
ffff80000010eb04:	40                   	rex
ffff80000010eb05:	40                   	rex
ffff80000010eb06:	44 7c 44             	rex.R jl ffff80000010eb4d <system_call_table+0x38ad>
ffff80000010eb09:	44                   	rex.R
ffff80000010eb0a:	40                   	rex
ffff80000010eb0b:	40                   	rex
ffff80000010eb0c:	40                   	rex
ffff80000010eb0d:	f0 00 00             	lock add %al,(%rax)
ffff80000010eb10:	00 3a                	add    %bh,(%rdx)
ffff80000010eb12:	46                   	rex.RX
ffff80000010eb13:	42 82                	rex.X (bad) 
ffff80000010eb15:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010eb1c:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010eb1f:	00 00                	add    %al,(%rax)
ffff80000010eb21:	e7 42                	out    %eax,$0x42
ffff80000010eb23:	42                   	rex.X
ffff80000010eb24:	42                   	rex.X
ffff80000010eb25:	42                   	rex.X
ffff80000010eb26:	42 7e 42             	rex.X jle ffff80000010eb6b <system_call_table+0x38cb>
ffff80000010eb29:	42                   	rex.X
ffff80000010eb2a:	42                   	rex.X
ffff80000010eb2b:	42                   	rex.X
ffff80000010eb2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010eb2f:	00 00                	add    %al,(%rax)
ffff80000010eb31:	7c 10                	jl     ffff80000010eb43 <system_call_table+0x38a3>
ffff80000010eb33:	10 10                	adc    %dl,(%rax)
ffff80000010eb35:	10 10                	adc    %dl,(%rax)
ffff80000010eb37:	10 10                	adc    %dl,(%rax)
ffff80000010eb39:	10 10                	adc    %dl,(%rax)
ffff80000010eb3b:	10 10                	adc    %dl,(%rax)
ffff80000010eb3d:	7c 00                	jl     ffff80000010eb3f <system_call_table+0x389f>
ffff80000010eb3f:	00 00                	add    %al,(%rax)
ffff80000010eb41:	1f                   	(bad)  
ffff80000010eb42:	04 04                	add    $0x4,%al
ffff80000010eb44:	04 04                	add    $0x4,%al
ffff80000010eb46:	04 04                	add    $0x4,%al
ffff80000010eb48:	04 04                	add    $0x4,%al
ffff80000010eb4a:	04 04                	add    $0x4,%al
ffff80000010eb4c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010eb4f:	00 00                	add    %al,(%rax)
ffff80000010eb51:	e7 42                	out    %eax,$0x42
ffff80000010eb53:	44                   	rex.R
ffff80000010eb54:	48 50                	rex.W push %rax
ffff80000010eb56:	50                   	push   %rax
ffff80000010eb57:	60                   	(bad)  
ffff80000010eb58:	50                   	push   %rax
ffff80000010eb59:	50                   	push   %rax
ffff80000010eb5a:	48                   	rex.W
ffff80000010eb5b:	44                   	rex.R
ffff80000010eb5c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010eb5f:	00 00                	add    %al,(%rax)
ffff80000010eb61:	f0 40                	lock rex
ffff80000010eb63:	40                   	rex
ffff80000010eb64:	40                   	rex
ffff80000010eb65:	40                   	rex
ffff80000010eb66:	40                   	rex
ffff80000010eb67:	40                   	rex
ffff80000010eb68:	40                   	rex
ffff80000010eb69:	40                   	rex
ffff80000010eb6a:	40                   	rex
ffff80000010eb6b:	42                   	rex.X
ffff80000010eb6c:	42 fe 00             	rex.X incb (%rax)
ffff80000010eb6f:	00 00                	add    %al,(%rax)
ffff80000010eb71:	c3                   	retq   
ffff80000010eb72:	42                   	rex.X
ffff80000010eb73:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010eb77:	5a                   	pop    %rdx
ffff80000010eb78:	5a                   	pop    %rdx
ffff80000010eb79:	42                   	rex.X
ffff80000010eb7a:	42                   	rex.X
ffff80000010eb7b:	42                   	rex.X
ffff80000010eb7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010eb7f:	00 00                	add    %al,(%rax)
ffff80000010eb81:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010eb88:	4a                   	rex.WX
ffff80000010eb89:	4a                   	rex.WX
ffff80000010eb8a:	4a                   	rex.WX
ffff80000010eb8b:	46                   	rex.RX
ffff80000010eb8c:	46 e2 00             	rex.RX loop ffff80000010eb8f <system_call_table+0x38ef>
ffff80000010eb8f:	00 00                	add    %al,(%rax)
ffff80000010eb91:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010eb95:	82                   	(bad)  
ffff80000010eb96:	82                   	(bad)  
ffff80000010eb97:	82                   	(bad)  
ffff80000010eb98:	82                   	(bad)  
ffff80000010eb99:	82                   	(bad)  
ffff80000010eb9a:	82                   	(bad)  
ffff80000010eb9b:	82                   	(bad)  
ffff80000010eb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010eb9f:	00 00                	add    %al,(%rax)
ffff80000010eba1:	f8                   	clc    
ffff80000010eba2:	44                   	rex.R
ffff80000010eba3:	42                   	rex.X
ffff80000010eba4:	42                   	rex.X
ffff80000010eba5:	42                   	rex.X
ffff80000010eba6:	44 78 40             	rex.R js ffff80000010ebe9 <system_call_table+0x3949>
ffff80000010eba9:	40                   	rex
ffff80000010ebaa:	40                   	rex
ffff80000010ebab:	40                   	rex
ffff80000010ebac:	40                   	rex
ffff80000010ebad:	f0 00 00             	lock add %al,(%rax)
ffff80000010ebb0:	00 38                	add    %bh,(%rax)
ffff80000010ebb2:	44 82                	rex.R (bad) 
ffff80000010ebb4:	82                   	(bad)  
ffff80000010ebb5:	82                   	(bad)  
ffff80000010ebb6:	82                   	(bad)  
ffff80000010ebb7:	82                   	(bad)  
ffff80000010ebb8:	82                   	(bad)  
ffff80000010ebb9:	82                   	(bad)  
ffff80000010ebba:	92                   	xchg   %eax,%edx
ffff80000010ebbb:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010ebbf:	00 00                	add    %al,(%rax)
ffff80000010ebc1:	fc                   	cld    
ffff80000010ebc2:	42                   	rex.X
ffff80000010ebc3:	42                   	rex.X
ffff80000010ebc4:	42                   	rex.X
ffff80000010ebc5:	42 7c 44             	rex.X jl ffff80000010ec0c <system_call_table+0x396c>
ffff80000010ebc8:	42                   	rex.X
ffff80000010ebc9:	42                   	rex.X
ffff80000010ebca:	42                   	rex.X
ffff80000010ebcb:	42                   	rex.X
ffff80000010ebcc:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ebcf:	00 00                	add    %al,(%rax)
ffff80000010ebd1:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010ebd4:	82                   	(bad)  
ffff80000010ebd5:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010ebd9:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010ebdf:	00 00                	add    %al,(%rax)
ffff80000010ebe1:	fe                   	(bad)  
ffff80000010ebe2:	92                   	xchg   %eax,%edx
ffff80000010ebe3:	92                   	xchg   %eax,%edx
ffff80000010ebe4:	10 10                	adc    %dl,(%rax)
ffff80000010ebe6:	10 10                	adc    %dl,(%rax)
ffff80000010ebe8:	10 10                	adc    %dl,(%rax)
ffff80000010ebea:	10 10                	adc    %dl,(%rax)
ffff80000010ebec:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010ebf0:	00 e7                	add    %ah,%bh
ffff80000010ebf2:	42                   	rex.X
ffff80000010ebf3:	42                   	rex.X
ffff80000010ebf4:	42                   	rex.X
ffff80000010ebf5:	42                   	rex.X
ffff80000010ebf6:	42                   	rex.X
ffff80000010ebf7:	42                   	rex.X
ffff80000010ebf8:	42                   	rex.X
ffff80000010ebf9:	42                   	rex.X
ffff80000010ebfa:	42                   	rex.X
ffff80000010ebfb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010ebfe:	00 00                	add    %al,(%rax)
ffff80000010ec00:	00 e7                	add    %ah,%bh
ffff80000010ec02:	42                   	rex.X
ffff80000010ec03:	42                   	rex.X
ffff80000010ec04:	42                   	rex.X
ffff80000010ec05:	42 24 24             	rex.X and $0x24,%al
ffff80000010ec08:	24 24                	and    $0x24,%al
ffff80000010ec0a:	18 18                	sbb    %bl,(%rax)
ffff80000010ec0c:	18 18                	sbb    %bl,(%rax)
ffff80000010ec0e:	00 00                	add    %al,(%rax)
ffff80000010ec10:	00 e7                	add    %ah,%bh
ffff80000010ec12:	42                   	rex.X
ffff80000010ec13:	42                   	rex.X
ffff80000010ec14:	42 5a                	rex.X pop %rdx
ffff80000010ec16:	5a                   	pop    %rdx
ffff80000010ec17:	5a                   	pop    %rdx
ffff80000010ec18:	5a                   	pop    %rdx
ffff80000010ec19:	24 24                	and    $0x24,%al
ffff80000010ec1b:	24 24                	and    $0x24,%al
ffff80000010ec1d:	24 00                	and    $0x0,%al
ffff80000010ec1f:	00 00                	add    %al,(%rax)
ffff80000010ec21:	e7 42                	out    %eax,$0x42
ffff80000010ec23:	42 24 24             	rex.X and $0x24,%al
ffff80000010ec26:	24 18                	and    $0x18,%al
ffff80000010ec28:	24 24                	and    $0x24,%al
ffff80000010ec2a:	24 42                	and    $0x42,%al
ffff80000010ec2c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010ec2f:	00 00                	add    %al,(%rax)
ffff80000010ec31:	ee                   	out    %al,(%dx)
ffff80000010ec32:	44                   	rex.R
ffff80000010ec33:	44                   	rex.R
ffff80000010ec34:	44 28 28             	sub    %r13b,(%rax)
ffff80000010ec37:	28 10                	sub    %dl,(%rax)
ffff80000010ec39:	10 10                	adc    %dl,(%rax)
ffff80000010ec3b:	10 10                	adc    %dl,(%rax)
ffff80000010ec3d:	7c 00                	jl     ffff80000010ec3f <system_call_table+0x399f>
ffff80000010ec3f:	00 00                	add    %al,(%rax)
ffff80000010ec41:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010ec48:	20 20                	and    %ah,(%rax)
ffff80000010ec4a:	40                   	rex
ffff80000010ec4b:	42 82                	rex.X (bad) 
ffff80000010ec4d:	fe 00                	incb   (%rax)
ffff80000010ec4f:	00 00                	add    %al,(%rax)
ffff80000010ec51:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010ec54:	20 20                	and    %ah,(%rax)
ffff80000010ec56:	20 20                	and    %ah,(%rax)
ffff80000010ec58:	20 20                	and    %ah,(%rax)
ffff80000010ec5a:	20 20                	and    %ah,(%rax)
ffff80000010ec5c:	20 20                	and    %ah,(%rax)
ffff80000010ec5e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010ec65:	20 20                	and    %ah,(%rax)
ffff80000010ec67:	10 10                	adc    %dl,(%rax)
ffff80000010ec69:	08 08                	or     %cl,(%rax)
ffff80000010ec6b:	04 04                	add    $0x4,%al
ffff80000010ec6d:	04 02                	add    $0x2,%al
ffff80000010ec6f:	02 00                	add    (%rax),%al
ffff80000010ec71:	7c 04                	jl     ffff80000010ec77 <system_call_table+0x39d7>
ffff80000010ec73:	04 04                	add    $0x4,%al
ffff80000010ec75:	04 04                	add    $0x4,%al
ffff80000010ec77:	04 04                	add    $0x4,%al
ffff80000010ec79:	04 04                	add    $0x4,%al
ffff80000010ec7b:	04 04                	add    $0x4,%al
ffff80000010ec7d:	04 7c                	add    $0x7c,%al
ffff80000010ec7f:	00 00                	add    %al,(%rax)
ffff80000010ec81:	10 28                	adc    %ch,(%rax)
ffff80000010ec83:	44 82                	rex.R (bad) 
	...
ffff80000010ec9d:	00 fe                	add    %bh,%dh
ffff80000010ec9f:	00 10                	add    %dl,(%rax)
ffff80000010eca1:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010ecb4:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010ecb7:	04 3c                	add    $0x3c,%al
ffff80000010ecb9:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010ecc0:	c0 
ffff80000010ecc1:	40                   	rex
ffff80000010ecc2:	40                   	rex
ffff80000010ecc3:	40                   	rex
ffff80000010ecc4:	40 58                	rex pop %rax
ffff80000010ecc6:	64 42                	fs rex.X
ffff80000010ecc8:	42                   	rex.X
ffff80000010ecc9:	42                   	rex.X
ffff80000010ecca:	42                   	rex.X
ffff80000010eccb:	42                   	rex.X
ffff80000010eccc:	64 58                	fs pop %rax
ffff80000010ecce:	00 00                	add    %al,(%rax)
ffff80000010ecd0:	00 00                	add    %al,(%rax)
ffff80000010ecd2:	00 00                	add    %al,(%rax)
ffff80000010ecd4:	00 30                	add    %dh,(%rax)
ffff80000010ecd6:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010ecdd:	38 
ffff80000010ecde:	00 00                	add    %al,(%rax)
ffff80000010ece0:	0c 04                	or     $0x4,%al
ffff80000010ece2:	04 04                	add    $0x4,%al
ffff80000010ece4:	04 34                	add    $0x34,%al
ffff80000010ece6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010eced:	36 
ffff80000010ecee:	00 00                	add    %al,(%rax)
ffff80000010ecf0:	00 00                	add    %al,(%rax)
ffff80000010ecf2:	00 00                	add    %al,(%rax)
ffff80000010ecf4:	00 38                	add    %bh,(%rax)
ffff80000010ecf6:	44 82                	rex.R (bad) 
ffff80000010ecf8:	82                   	(bad)  
ffff80000010ecf9:	fc                   	cld    
ffff80000010ecfa:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010ed01:	10 10                	adc    %dl,(%rax)
ffff80000010ed03:	10 10                	adc    %dl,(%rax)
ffff80000010ed05:	7c 10                	jl     ffff80000010ed17 <system_call_table+0x3a77>
ffff80000010ed07:	10 10                	adc    %dl,(%rax)
ffff80000010ed09:	10 10                	adc    %dl,(%rax)
ffff80000010ed0b:	10 10                	adc    %dl,(%rax)
ffff80000010ed0d:	7c 00                	jl     ffff80000010ed0f <system_call_table+0x3a6f>
ffff80000010ed0f:	00 00                	add    %al,(%rax)
ffff80000010ed11:	00 00                	add    %al,(%rax)
ffff80000010ed13:	00 00                	add    %al,(%rax)
ffff80000010ed15:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010ed1c:	34 04 
ffff80000010ed1e:	04 38                	add    $0x38,%al
ffff80000010ed20:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010ed24:	40 58                	rex pop %rax
ffff80000010ed26:	64 42                	fs rex.X
ffff80000010ed28:	42                   	rex.X
ffff80000010ed29:	42                   	rex.X
ffff80000010ed2a:	42                   	rex.X
ffff80000010ed2b:	42                   	rex.X
ffff80000010ed2c:	42 e3 00             	rex.X jrcxz ffff80000010ed2f <system_call_table+0x3a8f>
ffff80000010ed2f:	00 00                	add    %al,(%rax)
ffff80000010ed31:	10 10                	adc    %dl,(%rax)
ffff80000010ed33:	00 00                	add    %al,(%rax)
ffff80000010ed35:	30 10                	xor    %dl,(%rax)
ffff80000010ed37:	10 10                	adc    %dl,(%rax)
ffff80000010ed39:	10 10                	adc    %dl,(%rax)
ffff80000010ed3b:	10 10                	adc    %dl,(%rax)
ffff80000010ed3d:	38 00                	cmp    %al,(%rax)
ffff80000010ed3f:	00 00                	add    %al,(%rax)
ffff80000010ed41:	04 04                	add    $0x4,%al
ffff80000010ed43:	00 00                	add    %al,(%rax)
ffff80000010ed45:	0c 04                	or     $0x4,%al
ffff80000010ed47:	04 04                	add    $0x4,%al
ffff80000010ed49:	04 04                	add    $0x4,%al
ffff80000010ed4b:	04 04                	add    $0x4,%al
ffff80000010ed4d:	08 08                	or     %cl,(%rax)
ffff80000010ed4f:	30 c0                	xor    %al,%al
ffff80000010ed51:	40                   	rex
ffff80000010ed52:	40                   	rex
ffff80000010ed53:	40                   	rex
ffff80000010ed54:	40                   	rex
ffff80000010ed55:	4e                   	rex.WRX
ffff80000010ed56:	44                   	rex.R
ffff80000010ed57:	48 50                	rex.W push %rax
ffff80000010ed59:	60                   	(bad)  
ffff80000010ed5a:	50                   	push   %rax
ffff80000010ed5b:	48                   	rex.W
ffff80000010ed5c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010ed5f:	00 30                	add    %dh,(%rax)
ffff80000010ed61:	10 10                	adc    %dl,(%rax)
ffff80000010ed63:	10 10                	adc    %dl,(%rax)
ffff80000010ed65:	10 10                	adc    %dl,(%rax)
ffff80000010ed67:	10 10                	adc    %dl,(%rax)
ffff80000010ed69:	10 10                	adc    %dl,(%rax)
ffff80000010ed6b:	10 10                	adc    %dl,(%rax)
ffff80000010ed6d:	38 00                	cmp    %al,(%rax)
ffff80000010ed6f:	00 00                	add    %al,(%rax)
ffff80000010ed71:	00 00                	add    %al,(%rax)
ffff80000010ed73:	00 00                	add    %al,(%rax)
ffff80000010ed75:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010ed79:	49                   	rex.WB
ffff80000010ed7a:	49                   	rex.WB
ffff80000010ed7b:	49                   	rex.WB
ffff80000010ed7c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010ed7f:	00 00                	add    %al,(%rax)
ffff80000010ed81:	00 00                	add    %al,(%rax)
ffff80000010ed83:	00 00                	add    %al,(%rax)
ffff80000010ed85:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010ed89:	42                   	rex.X
ffff80000010ed8a:	42                   	rex.X
ffff80000010ed8b:	42                   	rex.X
ffff80000010ed8c:	42 e3 00             	rex.X jrcxz ffff80000010ed8f <system_call_table+0x3aef>
ffff80000010ed8f:	00 00                	add    %al,(%rax)
ffff80000010ed91:	00 00                	add    %al,(%rax)
ffff80000010ed93:	00 00                	add    %al,(%rax)
ffff80000010ed95:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010ed99:	82                   	(bad)  
ffff80000010ed9a:	82                   	(bad)  
ffff80000010ed9b:	82                   	(bad)  
ffff80000010ed9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010ed9f:	00 00                	add    %al,(%rax)
ffff80000010eda1:	00 00                	add    %al,(%rax)
ffff80000010eda3:	00 d8                	add    %bl,%al
ffff80000010eda5:	64 42                	fs rex.X
ffff80000010eda7:	42                   	rex.X
ffff80000010eda8:	42                   	rex.X
ffff80000010eda9:	42                   	rex.X
ffff80000010edaa:	42                   	rex.X
ffff80000010edab:	64 58                	fs pop %rax
ffff80000010edad:	40                   	rex
ffff80000010edae:	40 e0 00             	rex loopne ffff80000010edb1 <system_call_table+0x3b11>
ffff80000010edb1:	00 00                	add    %al,(%rax)
ffff80000010edb3:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010edb6:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010edbd:	04 04                	add    $0x4,%al
ffff80000010edbf:	0e                   	(bad)  
ffff80000010edc0:	00 00                	add    %al,(%rax)
ffff80000010edc2:	00 00                	add    %al,(%rax)
ffff80000010edc4:	00 dc                	add    %bl,%ah
ffff80000010edc6:	62 42                	(bad)  
ffff80000010edc8:	40                   	rex
ffff80000010edc9:	40                   	rex
ffff80000010edca:	40                   	rex
ffff80000010edcb:	40                   	rex
ffff80000010edcc:	40 e0 00             	rex loopne ffff80000010edcf <system_call_table+0x3b2f>
ffff80000010edcf:	00 00                	add    %al,(%rax)
ffff80000010edd1:	00 00                	add    %al,(%rax)
ffff80000010edd3:	00 00                	add    %al,(%rax)
ffff80000010edd5:	7a 86                	jp     ffff80000010ed5d <system_call_table+0x3abd>
ffff80000010edd7:	82                   	(bad)  
ffff80000010edd8:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010eddb:	82                   	(bad)  
ffff80000010eddc:	c2 bc 00             	retq   $0xbc
ffff80000010eddf:	00 00                	add    %al,(%rax)
ffff80000010ede1:	00 10                	add    %dl,(%rax)
ffff80000010ede3:	10 10                	adc    %dl,(%rax)
ffff80000010ede5:	7c 10                	jl     ffff80000010edf7 <system_call_table+0x3b57>
ffff80000010ede7:	10 10                	adc    %dl,(%rax)
ffff80000010ede9:	10 10                	adc    %dl,(%rax)
ffff80000010edeb:	10 10                	adc    %dl,(%rax)
ffff80000010eded:	0e                   	(bad)  
ffff80000010edee:	00 00                	add    %al,(%rax)
ffff80000010edf0:	00 00                	add    %al,(%rax)
ffff80000010edf2:	00 00                	add    %al,(%rax)
ffff80000010edf4:	00 c6                	add    %al,%dh
ffff80000010edf6:	42                   	rex.X
ffff80000010edf7:	42                   	rex.X
ffff80000010edf8:	42                   	rex.X
ffff80000010edf9:	42                   	rex.X
ffff80000010edfa:	42                   	rex.X
ffff80000010edfb:	42                   	rex.X
ffff80000010edfc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010edff:	00 00                	add    %al,(%rax)
ffff80000010ee01:	00 00                	add    %al,(%rax)
ffff80000010ee03:	00 00                	add    %al,(%rax)
ffff80000010ee05:	e7 42                	out    %eax,$0x42
ffff80000010ee07:	42                   	rex.X
ffff80000010ee08:	42 24 24             	rex.X and $0x24,%al
ffff80000010ee0b:	24 18                	and    $0x18,%al
ffff80000010ee0d:	18 00                	sbb    %al,(%rax)
ffff80000010ee0f:	00 00                	add    %al,(%rax)
ffff80000010ee11:	00 00                	add    %al,(%rax)
ffff80000010ee13:	00 00                	add    %al,(%rax)
ffff80000010ee15:	e7 42                	out    %eax,$0x42
ffff80000010ee17:	42 5a                	rex.X pop %rdx
ffff80000010ee19:	5a                   	pop    %rdx
ffff80000010ee1a:	5a                   	pop    %rdx
ffff80000010ee1b:	24 24                	and    $0x24,%al
ffff80000010ee1d:	24 00                	and    $0x0,%al
ffff80000010ee1f:	00 00                	add    %al,(%rax)
ffff80000010ee21:	00 00                	add    %al,(%rax)
ffff80000010ee23:	00 00                	add    %al,(%rax)
ffff80000010ee25:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010ee2a:	28 28                	sub    %ch,(%rax)
ffff80000010ee2c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010ee30:	00 00                	add    %al,(%rax)
ffff80000010ee32:	00 00                	add    %al,(%rax)
ffff80000010ee34:	00 e7                	add    %ah,%bh
ffff80000010ee36:	42                   	rex.X
ffff80000010ee37:	42 24 24             	rex.X and $0x24,%al
ffff80000010ee3a:	24 18                	and    $0x18,%al
ffff80000010ee3c:	18 10                	sbb    %dl,(%rax)
ffff80000010ee3e:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ee41:	00 00                	add    %al,(%rax)
ffff80000010ee43:	00 00                	add    %al,(%rax)
ffff80000010ee45:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010ee4b:	42 82                	rex.X (bad) 
ffff80000010ee4d:	fe 00                	incb   (%rax)
ffff80000010ee4f:	00 00                	add    %al,(%rax)
ffff80000010ee51:	06                   	(bad)  
ffff80000010ee52:	08 10                	or     %dl,(%rax)
ffff80000010ee54:	10 10                	adc    %dl,(%rax)
ffff80000010ee56:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010ee59:	10 10                	adc    %dl,(%rax)
ffff80000010ee5b:	10 08                	adc    %cl,(%rax)
ffff80000010ee5d:	06                   	(bad)  
ffff80000010ee5e:	00 00                	add    %al,(%rax)
ffff80000010ee60:	10 10                	adc    %dl,(%rax)
ffff80000010ee62:	10 10                	adc    %dl,(%rax)
ffff80000010ee64:	10 10                	adc    %dl,(%rax)
ffff80000010ee66:	10 10                	adc    %dl,(%rax)
ffff80000010ee68:	10 10                	adc    %dl,(%rax)
ffff80000010ee6a:	10 10                	adc    %dl,(%rax)
ffff80000010ee6c:	10 10                	adc    %dl,(%rax)
ffff80000010ee6e:	10 10                	adc    %dl,(%rax)
ffff80000010ee70:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ee73:	08 08                	or     %cl,(%rax)
ffff80000010ee75:	08 08                	or     %cl,(%rax)
ffff80000010ee77:	06                   	(bad)  
ffff80000010ee78:	08 08                	or     %cl,(%rax)
ffff80000010ee7a:	08 08                	or     %cl,(%rax)
ffff80000010ee7c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ee7f:	00 00                	add    %al,(%rax)
ffff80000010ee81:	72 8c                	jb     ffff80000010ee0f <system_call_table+0x3b6f>
	...

ffff80000010f6a0 <interrupt>:
ffff80000010f6a0:	1a 77 10             	sbb    0x10(%rdi),%dh
ffff80000010f6a3:	00 00                	add    %al,(%rax)
ffff80000010f6a5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6a8:	64 77 10             	fs ja  ffff80000010f6bb <interrupt+0x1b>
ffff80000010f6ab:	00 00                	add    %al,(%rax)
ffff80000010f6ad:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6b0:	ae                   	scas   %es:(%rdi),%al
ffff80000010f6b1:	77 10                	ja     ffff80000010f6c3 <interrupt+0x23>
ffff80000010f6b3:	00 00                	add    %al,(%rax)
ffff80000010f6b5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6b8:	f8                   	clc    
ffff80000010f6b9:	77 10                	ja     ffff80000010f6cb <interrupt+0x2b>
ffff80000010f6bb:	00 00                	add    %al,(%rax)
ffff80000010f6bd:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6c0:	42 78 10             	rex.X js ffff80000010f6d3 <interrupt+0x33>
ffff80000010f6c3:	00 00                	add    %al,(%rax)
ffff80000010f6c5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6c8:	8c 78 10             	mov    %?,0x10(%rax)
ffff80000010f6cb:	00 00                	add    %al,(%rax)
ffff80000010f6cd:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6d0:	d6                   	(bad)  
ffff80000010f6d1:	78 10                	js     ffff80000010f6e3 <interrupt+0x43>
ffff80000010f6d3:	00 00                	add    %al,(%rax)
ffff80000010f6d5:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6d8:	20 79 10             	and    %bh,0x10(%rcx)
ffff80000010f6db:	00 00                	add    %al,(%rax)
ffff80000010f6dd:	80 ff ff             	cmp    $0xff,%bh
ffff80000010f6e0:	6a 79                	pushq  $0x79
ffff80000010f6e2:	10 00                	adc    %al,(%rax)
ffff80000010f6e4:	00 80 ff ff b4 79    	add    %al,0x79b4ffff(%rax)
ffff80000010f6ea:	10 00                	adc    %al,(%rax)
ffff80000010f6ec:	00 80 ff ff fe 79    	add    %al,0x79feffff(%rax)
ffff80000010f6f2:	10 00                	adc    %al,(%rax)
ffff80000010f6f4:	00 80 ff ff 48 7a    	add    %al,0x7a48ffff(%rax)
ffff80000010f6fa:	10 00                	adc    %al,(%rax)
ffff80000010f6fc:	00 80 ff ff 92 7a    	add    %al,0x7a92ffff(%rax)
ffff80000010f702:	10 00                	adc    %al,(%rax)
ffff80000010f704:	00 80 ff ff dc 7a    	add    %al,0x7adcffff(%rax)
ffff80000010f70a:	10 00                	adc    %al,(%rax)
ffff80000010f70c:	00 80 ff ff 26 7b    	add    %al,0x7b26ffff(%rax)
ffff80000010f712:	10 00                	adc    %al,(%rax)
ffff80000010f714:	00 80 ff ff 70 7b    	add    %al,0x7b70ffff(%rax)
ffff80000010f71a:	10 00                	adc    %al,(%rax)
ffff80000010f71c:	00 80 ff ff ba 7b    	add    %al,0x7bbaffff(%rax)
ffff80000010f722:	10 00                	adc    %al,(%rax)
ffff80000010f724:	00 80 ff ff 04 7c    	add    %al,0x7c04ffff(%rax)
ffff80000010f72a:	10 00                	adc    %al,(%rax)
ffff80000010f72c:	00 80 ff ff 4e 7c    	add    %al,0x7c4effff(%rax)
ffff80000010f732:	10 00                	adc    %al,(%rax)
ffff80000010f734:	00 80 ff ff 98 7c    	add    %al,0x7c98ffff(%rax)
ffff80000010f73a:	10 00                	adc    %al,(%rax)
ffff80000010f73c:	00 80 ff ff e2 7c    	add    %al,0x7ce2ffff(%rax)
ffff80000010f742:	10 00                	adc    %al,(%rax)
ffff80000010f744:	00 80 ff ff 2c 7d    	add    %al,0x7d2cffff(%rax)
ffff80000010f74a:	10 00                	adc    %al,(%rax)
ffff80000010f74c:	00 80 ff ff 76 7d    	add    %al,0x7d76ffff(%rax)
ffff80000010f752:	10 00                	adc    %al,(%rax)
ffff80000010f754:	00 80 ff ff c0 7d    	add    %al,0x7dc0ffff(%rax)
ffff80000010f75a:	10 00                	adc    %al,(%rax)
ffff80000010f75c:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000010f96e:	00 00                	add    %al,(%rax)
ffff80000010f970:	00 10                	add    %dl,(%rax)
ffff80000010f972:	10 10                	adc    %dl,(%rax)
ffff80000010f974:	10 10                	adc    %dl,(%rax)
ffff80000010f976:	10 10                	adc    %dl,(%rax)
ffff80000010f978:	10 10                	adc    %dl,(%rax)
ffff80000010f97a:	00 00                	add    %al,(%rax)
ffff80000010f97c:	10 10                	adc    %dl,(%rax)
ffff80000010f97e:	00 00                	add    %al,(%rax)
ffff80000010f980:	28 28                	sub    %ch,(%rax)
ffff80000010f982:	28 00                	sub    %al,(%rax)
	...
ffff80000010f990:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
ffff80000010f994:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
ffff80000010f998:	44                   	rex.R
ffff80000010f999:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
ffff80000010f99e:	00 00                	add    %al,(%rax)
ffff80000010f9a0:	10 3a                	adc    %bh,(%rdx)
ffff80000010f9a2:	56                   	push   %rsi
ffff80000010f9a3:	92                   	xchg   %eax,%edx
ffff80000010f9a4:	92                   	xchg   %eax,%edx
ffff80000010f9a5:	90                   	nop
ffff80000010f9a6:	50                   	push   %rax
ffff80000010f9a7:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
ffff80000010f9aa:	92                   	xchg   %eax,%edx
ffff80000010f9ab:	92                   	xchg   %eax,%edx
ffff80000010f9ac:	d4                   	(bad)  
ffff80000010f9ad:	b8 10 10 62 92       	mov    $0x92621010,%eax
ffff80000010f9b2:	94                   	xchg   %eax,%esp
ffff80000010f9b3:	94                   	xchg   %eax,%esp
ffff80000010f9b4:	68 08 10 10 20       	pushq  $0x20101008
ffff80000010f9b9:	2c 52                	sub    $0x52,%al
ffff80000010f9bb:	52                   	push   %rdx
ffff80000010f9bc:	92                   	xchg   %eax,%edx
ffff80000010f9bd:	8c 00                	mov    %es,(%rax)
ffff80000010f9bf:	00 00                	add    %al,(%rax)
ffff80000010f9c1:	70 88                	jo     ffff80000010f94b <interrupt+0x2ab>
ffff80000010f9c3:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
ffff80000010f9c9:	92                   	xchg   %eax,%edx
ffff80000010f9ca:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
ffff80000010f9d1:	08 10                	or     %dl,(%rax)
	...
ffff80000010f9df:	00 02                	add    %al,(%rdx)
ffff80000010f9e1:	04 08                	add    $0x8,%al
ffff80000010f9e3:	08 10                	or     %dl,(%rax)
ffff80000010f9e5:	10 10                	adc    %dl,(%rax)
ffff80000010f9e7:	10 10                	adc    %dl,(%rax)
ffff80000010f9e9:	10 10                	adc    %dl,(%rax)
ffff80000010f9eb:	08 08                	or     %cl,(%rax)
ffff80000010f9ed:	04 02                	add    $0x2,%al
ffff80000010f9ef:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
ffff80000010f9f5:	10 10                	adc    %dl,(%rax)
ffff80000010f9f7:	10 10                	adc    %dl,(%rax)
ffff80000010f9f9:	10 10                	adc    %dl,(%rax)
ffff80000010f9fb:	20 20                	and    %ah,(%rax)
ffff80000010f9fd:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010fa01:	00 00                	add    %al,(%rax)
ffff80000010fa03:	00 00                	add    %al,(%rax)
ffff80000010fa05:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
ffff80000010fa0b:	10 00                	adc    %al,(%rax)
	...
ffff80000010fa15:	10 10                	adc    %dl,(%rax)
ffff80000010fa17:	10 fe                	adc    %bh,%dh
ffff80000010fa19:	10 10                	adc    %dl,(%rax)
ffff80000010fa1b:	10 00                	adc    %al,(%rax)
	...
ffff80000010fa29:	00 00                	add    %al,(%rax)
ffff80000010fa2b:	18 18                	sbb    %bl,(%rax)
ffff80000010fa2d:	08 08                	or     %cl,(%rax)
ffff80000010fa2f:	10 00                	adc    %al,(%rax)
ffff80000010fa31:	00 00                	add    %al,(%rax)
ffff80000010fa33:	00 00                	add    %al,(%rax)
ffff80000010fa35:	00 00                	add    %al,(%rax)
ffff80000010fa37:	00 fe                	add    %bh,%dh
	...
ffff80000010fa49:	00 00                	add    %al,(%rax)
ffff80000010fa4b:	00 18                	add    %bl,(%rax)
ffff80000010fa4d:	18 00                	sbb    %al,(%rax)
ffff80000010fa4f:	00 02                	add    %al,(%rdx)
ffff80000010fa51:	02 04 04             	add    (%rsp,%rax,1),%al
ffff80000010fa54:	08 08                	or     %cl,(%rax)
ffff80000010fa56:	08 10                	or     %dl,(%rax)
ffff80000010fa58:	10 20                	adc    %ah,(%rax)
ffff80000010fa5a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010fa5d:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
ffff80000010fa64:	42 
ffff80000010fa65:	42                   	rex.X
ffff80000010fa66:	42                   	rex.X
ffff80000010fa67:	42                   	rex.X
ffff80000010fa68:	42                   	rex.X
ffff80000010fa69:	42                   	rex.X
ffff80000010fa6a:	42 24 24             	rex.X and $0x24,%al
ffff80000010fa6d:	18 00                	sbb    %al,(%rax)
ffff80000010fa6f:	00 00                	add    %al,(%rax)
ffff80000010fa71:	08 18                	or     %bl,(%rax)
ffff80000010fa73:	28 08                	sub    %cl,(%rax)
ffff80000010fa75:	08 08                	or     %cl,(%rax)
ffff80000010fa77:	08 08                	or     %cl,(%rax)
ffff80000010fa79:	08 08                	or     %cl,(%rax)
ffff80000010fa7b:	08 08                	or     %cl,(%rax)
ffff80000010fa7d:	3e 00 00             	add    %al,%ds:(%rax)
ffff80000010fa80:	00 18                	add    %bl,(%rax)
ffff80000010fa82:	24 42                	and    $0x42,%al
ffff80000010fa84:	42 02 04 08          	add    (%rax,%r9,1),%al
ffff80000010fa88:	10 20                	adc    %ah,(%rax)
ffff80000010fa8a:	20 40 40             	and    %al,0x40(%rax)
ffff80000010fa8d:	7e 00                	jle    ffff80000010fa8f <interrupt+0x3ef>
ffff80000010fa8f:	00 00                	add    %al,(%rax)
ffff80000010fa91:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
ffff80000010fa94:	02 02                	add    (%rdx),%al
ffff80000010fa96:	04 18                	add    $0x18,%al
ffff80000010fa98:	04 02                	add    $0x2,%al
ffff80000010fa9a:	02 42 24             	add    0x24(%rdx),%al
ffff80000010fa9d:	18 00                	sbb    %al,(%rax)
ffff80000010fa9f:	00 00                	add    %al,(%rax)
ffff80000010faa1:	0c 0c                	or     $0xc,%al
ffff80000010faa3:	0c 14                	or     $0x14,%al
ffff80000010faa5:	14 14                	adc    $0x14,%al
ffff80000010faa7:	24 24                	and    $0x24,%al
ffff80000010faa9:	44 7e 04             	rex.R jle ffff80000010fab0 <interrupt+0x410>
ffff80000010faac:	04 1e                	add    $0x1e,%al
ffff80000010faae:	00 00                	add    %al,(%rax)
ffff80000010fab0:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
ffff80000010fab4:	40 58                	rex pop %rax
ffff80000010fab6:	64 02 02             	add    %fs:(%rdx),%al
ffff80000010fab9:	02 02                	add    (%rdx),%al
ffff80000010fabb:	42 24 18             	rex.X and $0x18,%al
ffff80000010fabe:	00 00                	add    %al,(%rax)
ffff80000010fac0:	00 18                	add    %bl,(%rax)
ffff80000010fac2:	24 42                	and    $0x42,%al
ffff80000010fac4:	40 58                	rex pop %rax
ffff80000010fac6:	64 42                	fs rex.X
ffff80000010fac8:	42                   	rex.X
ffff80000010fac9:	42                   	rex.X
ffff80000010faca:	42                   	rex.X
ffff80000010facb:	42 24 18             	rex.X and $0x18,%al
ffff80000010face:	00 00                	add    %al,(%rax)
ffff80000010fad0:	00 7e 42             	add    %bh,0x42(%rsi)
ffff80000010fad3:	42 04 04             	rex.X add $0x4,%al
ffff80000010fad6:	08 08                	or     %cl,(%rax)
ffff80000010fad8:	08 10                	or     %dl,(%rax)
ffff80000010fada:	10 10                	adc    %dl,(%rax)
ffff80000010fadc:	10 38                	adc    %bh,(%rax)
ffff80000010fade:	00 00                	add    %al,(%rax)
ffff80000010fae0:	00 18                	add    %bl,(%rax)
ffff80000010fae2:	24 42                	and    $0x42,%al
ffff80000010fae4:	42                   	rex.X
ffff80000010fae5:	42 24 18             	rex.X and $0x18,%al
ffff80000010fae8:	24 42                	and    $0x42,%al
ffff80000010faea:	42                   	rex.X
ffff80000010faeb:	42 24 18             	rex.X and $0x18,%al
ffff80000010faee:	00 00                	add    %al,(%rax)
ffff80000010faf0:	00 18                	add    %bl,(%rax)
ffff80000010faf2:	24 42                	and    $0x42,%al
ffff80000010faf4:	42                   	rex.X
ffff80000010faf5:	42                   	rex.X
ffff80000010faf6:	42                   	rex.X
ffff80000010faf7:	42                   	rex.X
ffff80000010faf8:	26 1a 02             	sbb    %es:(%rdx),%al
ffff80000010fafb:	42 24 18             	rex.X and $0x18,%al
ffff80000010fafe:	00 00                	add    %al,(%rax)
ffff80000010fb00:	00 00                	add    %al,(%rax)
ffff80000010fb02:	00 00                	add    %al,(%rax)
ffff80000010fb04:	00 18                	add    %bl,(%rax)
ffff80000010fb06:	18 00                	sbb    %al,(%rax)
ffff80000010fb08:	00 00                	add    %al,(%rax)
ffff80000010fb0a:	00 00                	add    %al,(%rax)
ffff80000010fb0c:	18 18                	sbb    %bl,(%rax)
ffff80000010fb0e:	00 00                	add    %al,(%rax)
ffff80000010fb10:	00 00                	add    %al,(%rax)
ffff80000010fb12:	00 00                	add    %al,(%rax)
ffff80000010fb14:	00 18                	add    %bl,(%rax)
ffff80000010fb16:	18 00                	sbb    %al,(%rax)
ffff80000010fb18:	00 00                	add    %al,(%rax)
ffff80000010fb1a:	00 18                	add    %bl,(%rax)
ffff80000010fb1c:	18 08                	sbb    %cl,(%rax)
ffff80000010fb1e:	08 10                	or     %dl,(%rax)
ffff80000010fb20:	00 02                	add    %al,(%rdx)
ffff80000010fb22:	04 08                	add    $0x8,%al
ffff80000010fb24:	10 20                	adc    %ah,(%rax)
ffff80000010fb26:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
ffff80000010fb2d:	04 
ffff80000010fb2e:	02 00                	add    (%rax),%al
ffff80000010fb30:	00 00                	add    %al,(%rax)
ffff80000010fb32:	00 00                	add    %al,(%rax)
ffff80000010fb34:	00 00                	add    %al,(%rax)
ffff80000010fb36:	fe 00                	incb   (%rax)
ffff80000010fb38:	00 fe                	add    %bh,%dh
ffff80000010fb3a:	00 00                	add    %al,(%rax)
ffff80000010fb3c:	00 00                	add    %al,(%rax)
ffff80000010fb3e:	00 00                	add    %al,(%rax)
ffff80000010fb40:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
ffff80000010fb46:	04 02                	add    $0x2,%al
ffff80000010fb48:	02 04 08             	add    (%rax,%rcx,1),%al
ffff80000010fb4b:	10 20                	adc    %ah,(%rax)
ffff80000010fb4d:	40 80 00 00          	rex addb $0x0,(%rax)
ffff80000010fb51:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010fb55:	82                   	(bad)  
ffff80000010fb56:	04 08                	add    $0x8,%al
ffff80000010fb58:	10 10                	adc    %dl,(%rax)
ffff80000010fb5a:	00 00                	add    %al,(%rax)
ffff80000010fb5c:	18 18                	sbb    %bl,(%rax)
ffff80000010fb5e:	00 00                	add    %al,(%rax)
ffff80000010fb60:	00 38                	add    %bh,(%rax)
ffff80000010fb62:	44 82                	rex.R (bad) 
ffff80000010fb64:	9a                   	(bad)  
ffff80000010fb65:	aa                   	stos   %al,%es:(%rdi)
ffff80000010fb66:	aa                   	stos   %al,%es:(%rdi)
ffff80000010fb67:	aa                   	stos   %al,%es:(%rdi)
ffff80000010fb68:	aa                   	stos   %al,%es:(%rdi)
ffff80000010fb69:	aa                   	stos   %al,%es:(%rdi)
ffff80000010fb6a:	9c                   	pushfq 
ffff80000010fb6b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
ffff80000010fb6f:	00 00                	add    %al,(%rax)
ffff80000010fb71:	18 18                	sbb    %bl,(%rax)
ffff80000010fb73:	18 18                	sbb    %bl,(%rax)
ffff80000010fb75:	24 24                	and    $0x24,%al
ffff80000010fb77:	24 24                	and    $0x24,%al
ffff80000010fb79:	7e 42                	jle    ffff80000010fbbd <interrupt+0x51d>
ffff80000010fb7b:	42                   	rex.X
ffff80000010fb7c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fb7f:	00 00                	add    %al,(%rax)
ffff80000010fb81:	f0 48                	lock rex.W
ffff80000010fb83:	44                   	rex.R
ffff80000010fb84:	44                   	rex.R
ffff80000010fb85:	44                   	rex.R
ffff80000010fb86:	48 78 44             	rex.W js ffff80000010fbcd <interrupt+0x52d>
ffff80000010fb89:	42                   	rex.X
ffff80000010fb8a:	42                   	rex.X
ffff80000010fb8b:	42                   	rex.X
ffff80000010fb8c:	44 f8                	rex.R clc 
ffff80000010fb8e:	00 00                	add    %al,(%rax)
ffff80000010fb90:	00 3a                	add    %bh,(%rdx)
ffff80000010fb92:	46                   	rex.RX
ffff80000010fb93:	42 82                	rex.X (bad) 
ffff80000010fb95:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
ffff80000010fb9c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010fb9f:	00 00                	add    %al,(%rax)
ffff80000010fba1:	f8                   	clc    
ffff80000010fba2:	44                   	rex.R
ffff80000010fba3:	44                   	rex.R
ffff80000010fba4:	42                   	rex.X
ffff80000010fba5:	42                   	rex.X
ffff80000010fba6:	42                   	rex.X
ffff80000010fba7:	42                   	rex.X
ffff80000010fba8:	42                   	rex.X
ffff80000010fba9:	42                   	rex.X
ffff80000010fbaa:	42                   	rex.X
ffff80000010fbab:	44                   	rex.R
ffff80000010fbac:	44 f8                	rex.R clc 
ffff80000010fbae:	00 00                	add    %al,(%rax)
ffff80000010fbb0:	00 fe                	add    %bh,%dh
ffff80000010fbb2:	42                   	rex.X
ffff80000010fbb3:	42                   	rex.X
ffff80000010fbb4:	40                   	rex
ffff80000010fbb5:	40                   	rex
ffff80000010fbb6:	44 7c 44             	rex.R jl ffff80000010fbfd <interrupt+0x55d>
ffff80000010fbb9:	40                   	rex
ffff80000010fbba:	40                   	rex
ffff80000010fbbb:	42                   	rex.X
ffff80000010fbbc:	42 fe 00             	rex.X incb (%rax)
ffff80000010fbbf:	00 00                	add    %al,(%rax)
ffff80000010fbc1:	fe 42 42             	incb   0x42(%rdx)
ffff80000010fbc4:	40                   	rex
ffff80000010fbc5:	40                   	rex
ffff80000010fbc6:	44 7c 44             	rex.R jl ffff80000010fc0d <interrupt+0x56d>
ffff80000010fbc9:	44                   	rex.R
ffff80000010fbca:	40                   	rex
ffff80000010fbcb:	40                   	rex
ffff80000010fbcc:	40                   	rex
ffff80000010fbcd:	f0 00 00             	lock add %al,(%rax)
ffff80000010fbd0:	00 3a                	add    %bh,(%rdx)
ffff80000010fbd2:	46                   	rex.RX
ffff80000010fbd3:	42 82                	rex.X (bad) 
ffff80000010fbd5:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
ffff80000010fbdc:	46 38 00             	rex.RX cmp %r8b,(%rax)
ffff80000010fbdf:	00 00                	add    %al,(%rax)
ffff80000010fbe1:	e7 42                	out    %eax,$0x42
ffff80000010fbe3:	42                   	rex.X
ffff80000010fbe4:	42                   	rex.X
ffff80000010fbe5:	42                   	rex.X
ffff80000010fbe6:	42 7e 42             	rex.X jle ffff80000010fc2b <interrupt+0x58b>
ffff80000010fbe9:	42                   	rex.X
ffff80000010fbea:	42                   	rex.X
ffff80000010fbeb:	42                   	rex.X
ffff80000010fbec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fbef:	00 00                	add    %al,(%rax)
ffff80000010fbf1:	7c 10                	jl     ffff80000010fc03 <interrupt+0x563>
ffff80000010fbf3:	10 10                	adc    %dl,(%rax)
ffff80000010fbf5:	10 10                	adc    %dl,(%rax)
ffff80000010fbf7:	10 10                	adc    %dl,(%rax)
ffff80000010fbf9:	10 10                	adc    %dl,(%rax)
ffff80000010fbfb:	10 10                	adc    %dl,(%rax)
ffff80000010fbfd:	7c 00                	jl     ffff80000010fbff <interrupt+0x55f>
ffff80000010fbff:	00 00                	add    %al,(%rax)
ffff80000010fc01:	1f                   	(bad)  
ffff80000010fc02:	04 04                	add    $0x4,%al
ffff80000010fc04:	04 04                	add    $0x4,%al
ffff80000010fc06:	04 04                	add    $0x4,%al
ffff80000010fc08:	04 04                	add    $0x4,%al
ffff80000010fc0a:	04 04                	add    $0x4,%al
ffff80000010fc0c:	84 48 30             	test   %cl,0x30(%rax)
ffff80000010fc0f:	00 00                	add    %al,(%rax)
ffff80000010fc11:	e7 42                	out    %eax,$0x42
ffff80000010fc13:	44                   	rex.R
ffff80000010fc14:	48 50                	rex.W push %rax
ffff80000010fc16:	50                   	push   %rax
ffff80000010fc17:	60                   	(bad)  
ffff80000010fc18:	50                   	push   %rax
ffff80000010fc19:	50                   	push   %rax
ffff80000010fc1a:	48                   	rex.W
ffff80000010fc1b:	44                   	rex.R
ffff80000010fc1c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fc1f:	00 00                	add    %al,(%rax)
ffff80000010fc21:	f0 40                	lock rex
ffff80000010fc23:	40                   	rex
ffff80000010fc24:	40                   	rex
ffff80000010fc25:	40                   	rex
ffff80000010fc26:	40                   	rex
ffff80000010fc27:	40                   	rex
ffff80000010fc28:	40                   	rex
ffff80000010fc29:	40                   	rex
ffff80000010fc2a:	40                   	rex
ffff80000010fc2b:	42                   	rex.X
ffff80000010fc2c:	42 fe 00             	rex.X incb (%rax)
ffff80000010fc2f:	00 00                	add    %al,(%rax)
ffff80000010fc31:	c3                   	retq   
ffff80000010fc32:	42                   	rex.X
ffff80000010fc33:	66 66 66 5a          	data16 data16 pop %dx
ffff80000010fc37:	5a                   	pop    %rdx
ffff80000010fc38:	5a                   	pop    %rdx
ffff80000010fc39:	42                   	rex.X
ffff80000010fc3a:	42                   	rex.X
ffff80000010fc3b:	42                   	rex.X
ffff80000010fc3c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fc3f:	00 00                	add    %al,(%rax)
ffff80000010fc41:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
ffff80000010fc48:	4a                   	rex.WX
ffff80000010fc49:	4a                   	rex.WX
ffff80000010fc4a:	4a                   	rex.WX
ffff80000010fc4b:	46                   	rex.RX
ffff80000010fc4c:	46 e2 00             	rex.RX loop ffff80000010fc4f <interrupt+0x5af>
ffff80000010fc4f:	00 00                	add    %al,(%rax)
ffff80000010fc51:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010fc55:	82                   	(bad)  
ffff80000010fc56:	82                   	(bad)  
ffff80000010fc57:	82                   	(bad)  
ffff80000010fc58:	82                   	(bad)  
ffff80000010fc59:	82                   	(bad)  
ffff80000010fc5a:	82                   	(bad)  
ffff80000010fc5b:	82                   	(bad)  
ffff80000010fc5c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010fc5f:	00 00                	add    %al,(%rax)
ffff80000010fc61:	f8                   	clc    
ffff80000010fc62:	44                   	rex.R
ffff80000010fc63:	42                   	rex.X
ffff80000010fc64:	42                   	rex.X
ffff80000010fc65:	42                   	rex.X
ffff80000010fc66:	44 78 40             	rex.R js ffff80000010fca9 <interrupt+0x609>
ffff80000010fc69:	40                   	rex
ffff80000010fc6a:	40                   	rex
ffff80000010fc6b:	40                   	rex
ffff80000010fc6c:	40                   	rex
ffff80000010fc6d:	f0 00 00             	lock add %al,(%rax)
ffff80000010fc70:	00 38                	add    %bh,(%rax)
ffff80000010fc72:	44 82                	rex.R (bad) 
ffff80000010fc74:	82                   	(bad)  
ffff80000010fc75:	82                   	(bad)  
ffff80000010fc76:	82                   	(bad)  
ffff80000010fc77:	82                   	(bad)  
ffff80000010fc78:	82                   	(bad)  
ffff80000010fc79:	82                   	(bad)  
ffff80000010fc7a:	92                   	xchg   %eax,%edx
ffff80000010fc7b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
ffff80000010fc7f:	00 00                	add    %al,(%rax)
ffff80000010fc81:	fc                   	cld    
ffff80000010fc82:	42                   	rex.X
ffff80000010fc83:	42                   	rex.X
ffff80000010fc84:	42                   	rex.X
ffff80000010fc85:	42 7c 44             	rex.X jl ffff80000010fccc <interrupt+0x62c>
ffff80000010fc88:	42                   	rex.X
ffff80000010fc89:	42                   	rex.X
ffff80000010fc8a:	42                   	rex.X
ffff80000010fc8b:	42                   	rex.X
ffff80000010fc8c:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fc8f:	00 00                	add    %al,(%rax)
ffff80000010fc91:	3a 46 82             	cmp    -0x7e(%rsi),%al
ffff80000010fc94:	82                   	(bad)  
ffff80000010fc95:	80 40 38 04          	addb   $0x4,0x38(%rax)
ffff80000010fc99:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
ffff80000010fc9f:	00 00                	add    %al,(%rax)
ffff80000010fca1:	fe                   	(bad)  
ffff80000010fca2:	92                   	xchg   %eax,%edx
ffff80000010fca3:	92                   	xchg   %eax,%edx
ffff80000010fca4:	10 10                	adc    %dl,(%rax)
ffff80000010fca6:	10 10                	adc    %dl,(%rax)
ffff80000010fca8:	10 10                	adc    %dl,(%rax)
ffff80000010fcaa:	10 10                	adc    %dl,(%rax)
ffff80000010fcac:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
ffff80000010fcb0:	00 e7                	add    %ah,%bh
ffff80000010fcb2:	42                   	rex.X
ffff80000010fcb3:	42                   	rex.X
ffff80000010fcb4:	42                   	rex.X
ffff80000010fcb5:	42                   	rex.X
ffff80000010fcb6:	42                   	rex.X
ffff80000010fcb7:	42                   	rex.X
ffff80000010fcb8:	42                   	rex.X
ffff80000010fcb9:	42                   	rex.X
ffff80000010fcba:	42                   	rex.X
ffff80000010fcbb:	42 24 3c             	rex.X and $0x3c,%al
ffff80000010fcbe:	00 00                	add    %al,(%rax)
ffff80000010fcc0:	00 e7                	add    %ah,%bh
ffff80000010fcc2:	42                   	rex.X
ffff80000010fcc3:	42                   	rex.X
ffff80000010fcc4:	42                   	rex.X
ffff80000010fcc5:	42 24 24             	rex.X and $0x24,%al
ffff80000010fcc8:	24 24                	and    $0x24,%al
ffff80000010fcca:	18 18                	sbb    %bl,(%rax)
ffff80000010fccc:	18 18                	sbb    %bl,(%rax)
ffff80000010fcce:	00 00                	add    %al,(%rax)
ffff80000010fcd0:	00 e7                	add    %ah,%bh
ffff80000010fcd2:	42                   	rex.X
ffff80000010fcd3:	42                   	rex.X
ffff80000010fcd4:	42 5a                	rex.X pop %rdx
ffff80000010fcd6:	5a                   	pop    %rdx
ffff80000010fcd7:	5a                   	pop    %rdx
ffff80000010fcd8:	5a                   	pop    %rdx
ffff80000010fcd9:	24 24                	and    $0x24,%al
ffff80000010fcdb:	24 24                	and    $0x24,%al
ffff80000010fcdd:	24 00                	and    $0x0,%al
ffff80000010fcdf:	00 00                	add    %al,(%rax)
ffff80000010fce1:	e7 42                	out    %eax,$0x42
ffff80000010fce3:	42 24 24             	rex.X and $0x24,%al
ffff80000010fce6:	24 18                	and    $0x18,%al
ffff80000010fce8:	24 24                	and    $0x24,%al
ffff80000010fcea:	24 42                	and    $0x42,%al
ffff80000010fcec:	42 e7 00             	rex.X out %eax,$0x0
ffff80000010fcef:	00 00                	add    %al,(%rax)
ffff80000010fcf1:	ee                   	out    %al,(%dx)
ffff80000010fcf2:	44                   	rex.R
ffff80000010fcf3:	44                   	rex.R
ffff80000010fcf4:	44 28 28             	sub    %r13b,(%rax)
ffff80000010fcf7:	28 10                	sub    %dl,(%rax)
ffff80000010fcf9:	10 10                	adc    %dl,(%rax)
ffff80000010fcfb:	10 10                	adc    %dl,(%rax)
ffff80000010fcfd:	7c 00                	jl     ffff80000010fcff <interrupt+0x65f>
ffff80000010fcff:	00 00                	add    %al,(%rax)
ffff80000010fd01:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
ffff80000010fd08:	20 20                	and    %ah,(%rax)
ffff80000010fd0a:	40                   	rex
ffff80000010fd0b:	42 82                	rex.X (bad) 
ffff80000010fd0d:	fe 00                	incb   (%rax)
ffff80000010fd0f:	00 00                	add    %al,(%rax)
ffff80000010fd11:	3e 20 20             	and    %ah,%ds:(%rax)
ffff80000010fd14:	20 20                	and    %ah,(%rax)
ffff80000010fd16:	20 20                	and    %ah,(%rax)
ffff80000010fd18:	20 20                	and    %ah,(%rax)
ffff80000010fd1a:	20 20                	and    %ah,(%rax)
ffff80000010fd1c:	20 20                	and    %ah,(%rax)
ffff80000010fd1e:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
ffff80000010fd25:	20 20                	and    %ah,(%rax)
ffff80000010fd27:	10 10                	adc    %dl,(%rax)
ffff80000010fd29:	08 08                	or     %cl,(%rax)
ffff80000010fd2b:	04 04                	add    $0x4,%al
ffff80000010fd2d:	04 02                	add    $0x2,%al
ffff80000010fd2f:	02 00                	add    (%rax),%al
ffff80000010fd31:	7c 04                	jl     ffff80000010fd37 <interrupt+0x697>
ffff80000010fd33:	04 04                	add    $0x4,%al
ffff80000010fd35:	04 04                	add    $0x4,%al
ffff80000010fd37:	04 04                	add    $0x4,%al
ffff80000010fd39:	04 04                	add    $0x4,%al
ffff80000010fd3b:	04 04                	add    $0x4,%al
ffff80000010fd3d:	04 7c                	add    $0x7c,%al
ffff80000010fd3f:	00 00                	add    %al,(%rax)
ffff80000010fd41:	10 28                	adc    %ch,(%rax)
ffff80000010fd43:	44 82                	rex.R (bad) 
	...
ffff80000010fd5d:	00 fe                	add    %bh,%dh
ffff80000010fd5f:	00 10                	add    %dl,(%rax)
ffff80000010fd61:	08 04 00             	or     %al,(%rax,%rax,1)
	...
ffff80000010fd74:	00 70 08             	add    %dh,0x8(%rax)
ffff80000010fd77:	04 3c                	add    $0x3c,%al
ffff80000010fd79:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
ffff80000010fd80:	c0 
ffff80000010fd81:	40                   	rex
ffff80000010fd82:	40                   	rex
ffff80000010fd83:	40                   	rex
ffff80000010fd84:	40 58                	rex pop %rax
ffff80000010fd86:	64 42                	fs rex.X
ffff80000010fd88:	42                   	rex.X
ffff80000010fd89:	42                   	rex.X
ffff80000010fd8a:	42                   	rex.X
ffff80000010fd8b:	42                   	rex.X
ffff80000010fd8c:	64 58                	fs pop %rax
ffff80000010fd8e:	00 00                	add    %al,(%rax)
ffff80000010fd90:	00 00                	add    %al,(%rax)
ffff80000010fd92:	00 00                	add    %al,(%rax)
ffff80000010fd94:	00 30                	add    %dh,(%rax)
ffff80000010fd96:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
ffff80000010fd9d:	38 
ffff80000010fd9e:	00 00                	add    %al,(%rax)
ffff80000010fda0:	0c 04                	or     $0x4,%al
ffff80000010fda2:	04 04                	add    $0x4,%al
ffff80000010fda4:	04 34                	add    $0x34,%al
ffff80000010fda6:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
ffff80000010fdad:	36 
ffff80000010fdae:	00 00                	add    %al,(%rax)
ffff80000010fdb0:	00 00                	add    %al,(%rax)
ffff80000010fdb2:	00 00                	add    %al,(%rax)
ffff80000010fdb4:	00 38                	add    %bh,(%rax)
ffff80000010fdb6:	44 82                	rex.R (bad) 
ffff80000010fdb8:	82                   	(bad)  
ffff80000010fdb9:	fc                   	cld    
ffff80000010fdba:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
ffff80000010fdc1:	10 10                	adc    %dl,(%rax)
ffff80000010fdc3:	10 10                	adc    %dl,(%rax)
ffff80000010fdc5:	7c 10                	jl     ffff80000010fdd7 <interrupt+0x737>
ffff80000010fdc7:	10 10                	adc    %dl,(%rax)
ffff80000010fdc9:	10 10                	adc    %dl,(%rax)
ffff80000010fdcb:	10 10                	adc    %dl,(%rax)
ffff80000010fdcd:	7c 00                	jl     ffff80000010fdcf <interrupt+0x72f>
ffff80000010fdcf:	00 00                	add    %al,(%rax)
ffff80000010fdd1:	00 00                	add    %al,(%rax)
ffff80000010fdd3:	00 00                	add    %al,(%rax)
ffff80000010fdd5:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
ffff80000010fddc:	34 04 
ffff80000010fdde:	04 38                	add    $0x38,%al
ffff80000010fde0:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
ffff80000010fde4:	40 58                	rex pop %rax
ffff80000010fde6:	64 42                	fs rex.X
ffff80000010fde8:	42                   	rex.X
ffff80000010fde9:	42                   	rex.X
ffff80000010fdea:	42                   	rex.X
ffff80000010fdeb:	42                   	rex.X
ffff80000010fdec:	42 e3 00             	rex.X jrcxz ffff80000010fdef <interrupt+0x74f>
ffff80000010fdef:	00 00                	add    %al,(%rax)
ffff80000010fdf1:	10 10                	adc    %dl,(%rax)
ffff80000010fdf3:	00 00                	add    %al,(%rax)
ffff80000010fdf5:	30 10                	xor    %dl,(%rax)
ffff80000010fdf7:	10 10                	adc    %dl,(%rax)
ffff80000010fdf9:	10 10                	adc    %dl,(%rax)
ffff80000010fdfb:	10 10                	adc    %dl,(%rax)
ffff80000010fdfd:	38 00                	cmp    %al,(%rax)
ffff80000010fdff:	00 00                	add    %al,(%rax)
ffff80000010fe01:	04 04                	add    $0x4,%al
ffff80000010fe03:	00 00                	add    %al,(%rax)
ffff80000010fe05:	0c 04                	or     $0x4,%al
ffff80000010fe07:	04 04                	add    $0x4,%al
ffff80000010fe09:	04 04                	add    $0x4,%al
ffff80000010fe0b:	04 04                	add    $0x4,%al
ffff80000010fe0d:	08 08                	or     %cl,(%rax)
ffff80000010fe0f:	30 c0                	xor    %al,%al
ffff80000010fe11:	40                   	rex
ffff80000010fe12:	40                   	rex
ffff80000010fe13:	40                   	rex
ffff80000010fe14:	40                   	rex
ffff80000010fe15:	4e                   	rex.WRX
ffff80000010fe16:	44                   	rex.R
ffff80000010fe17:	48 50                	rex.W push %rax
ffff80000010fe19:	60                   	(bad)  
ffff80000010fe1a:	50                   	push   %rax
ffff80000010fe1b:	48                   	rex.W
ffff80000010fe1c:	44 e6 00             	rex.R out %al,$0x0
ffff80000010fe1f:	00 30                	add    %dh,(%rax)
ffff80000010fe21:	10 10                	adc    %dl,(%rax)
ffff80000010fe23:	10 10                	adc    %dl,(%rax)
ffff80000010fe25:	10 10                	adc    %dl,(%rax)
ffff80000010fe27:	10 10                	adc    %dl,(%rax)
ffff80000010fe29:	10 10                	adc    %dl,(%rax)
ffff80000010fe2b:	10 10                	adc    %dl,(%rax)
ffff80000010fe2d:	38 00                	cmp    %al,(%rax)
ffff80000010fe2f:	00 00                	add    %al,(%rax)
ffff80000010fe31:	00 00                	add    %al,(%rax)
ffff80000010fe33:	00 00                	add    %al,(%rax)
ffff80000010fe35:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
ffff80000010fe39:	49                   	rex.WB
ffff80000010fe3a:	49                   	rex.WB
ffff80000010fe3b:	49                   	rex.WB
ffff80000010fe3c:	49 db 00             	rex.WB fildl (%r8)
ffff80000010fe3f:	00 00                	add    %al,(%rax)
ffff80000010fe41:	00 00                	add    %al,(%rax)
ffff80000010fe43:	00 00                	add    %al,(%rax)
ffff80000010fe45:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
ffff80000010fe49:	42                   	rex.X
ffff80000010fe4a:	42                   	rex.X
ffff80000010fe4b:	42                   	rex.X
ffff80000010fe4c:	42 e3 00             	rex.X jrcxz ffff80000010fe4f <interrupt+0x7af>
ffff80000010fe4f:	00 00                	add    %al,(%rax)
ffff80000010fe51:	00 00                	add    %al,(%rax)
ffff80000010fe53:	00 00                	add    %al,(%rax)
ffff80000010fe55:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
ffff80000010fe59:	82                   	(bad)  
ffff80000010fe5a:	82                   	(bad)  
ffff80000010fe5b:	82                   	(bad)  
ffff80000010fe5c:	44 38 00             	cmp    %r8b,(%rax)
ffff80000010fe5f:	00 00                	add    %al,(%rax)
ffff80000010fe61:	00 00                	add    %al,(%rax)
ffff80000010fe63:	00 d8                	add    %bl,%al
ffff80000010fe65:	64 42                	fs rex.X
ffff80000010fe67:	42                   	rex.X
ffff80000010fe68:	42                   	rex.X
ffff80000010fe69:	42                   	rex.X
ffff80000010fe6a:	42                   	rex.X
ffff80000010fe6b:	64 58                	fs pop %rax
ffff80000010fe6d:	40                   	rex
ffff80000010fe6e:	40 e0 00             	rex loopne ffff80000010fe71 <interrupt+0x7d1>
ffff80000010fe71:	00 00                	add    %al,(%rax)
ffff80000010fe73:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
ffff80000010fe76:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
ffff80000010fe7d:	04 04                	add    $0x4,%al
ffff80000010fe7f:	0e                   	(bad)  
ffff80000010fe80:	00 00                	add    %al,(%rax)
ffff80000010fe82:	00 00                	add    %al,(%rax)
ffff80000010fe84:	00 dc                	add    %bl,%ah
ffff80000010fe86:	62 42                	(bad)  
ffff80000010fe88:	40                   	rex
ffff80000010fe89:	40                   	rex
ffff80000010fe8a:	40                   	rex
ffff80000010fe8b:	40                   	rex
ffff80000010fe8c:	40 e0 00             	rex loopne ffff80000010fe8f <interrupt+0x7ef>
ffff80000010fe8f:	00 00                	add    %al,(%rax)
ffff80000010fe91:	00 00                	add    %al,(%rax)
ffff80000010fe93:	00 00                	add    %al,(%rax)
ffff80000010fe95:	7a 86                	jp     ffff80000010fe1d <interrupt+0x77d>
ffff80000010fe97:	82                   	(bad)  
ffff80000010fe98:	c0 38 06             	sarb   $0x6,(%rax)
ffff80000010fe9b:	82                   	(bad)  
ffff80000010fe9c:	c2 bc 00             	retq   $0xbc
ffff80000010fe9f:	00 00                	add    %al,(%rax)
ffff80000010fea1:	00 10                	add    %dl,(%rax)
ffff80000010fea3:	10 10                	adc    %dl,(%rax)
ffff80000010fea5:	7c 10                	jl     ffff80000010feb7 <interrupt+0x817>
ffff80000010fea7:	10 10                	adc    %dl,(%rax)
ffff80000010fea9:	10 10                	adc    %dl,(%rax)
ffff80000010feab:	10 10                	adc    %dl,(%rax)
ffff80000010fead:	0e                   	(bad)  
ffff80000010feae:	00 00                	add    %al,(%rax)
ffff80000010feb0:	00 00                	add    %al,(%rax)
ffff80000010feb2:	00 00                	add    %al,(%rax)
ffff80000010feb4:	00 c6                	add    %al,%dh
ffff80000010feb6:	42                   	rex.X
ffff80000010feb7:	42                   	rex.X
ffff80000010feb8:	42                   	rex.X
ffff80000010feb9:	42                   	rex.X
ffff80000010feba:	42                   	rex.X
ffff80000010febb:	42                   	rex.X
ffff80000010febc:	46 3b 00             	rex.RX cmp (%rax),%r8d
ffff80000010febf:	00 00                	add    %al,(%rax)
ffff80000010fec1:	00 00                	add    %al,(%rax)
ffff80000010fec3:	00 00                	add    %al,(%rax)
ffff80000010fec5:	e7 42                	out    %eax,$0x42
ffff80000010fec7:	42                   	rex.X
ffff80000010fec8:	42 24 24             	rex.X and $0x24,%al
ffff80000010fecb:	24 18                	and    $0x18,%al
ffff80000010fecd:	18 00                	sbb    %al,(%rax)
ffff80000010fecf:	00 00                	add    %al,(%rax)
ffff80000010fed1:	00 00                	add    %al,(%rax)
ffff80000010fed3:	00 00                	add    %al,(%rax)
ffff80000010fed5:	e7 42                	out    %eax,$0x42
ffff80000010fed7:	42 5a                	rex.X pop %rdx
ffff80000010fed9:	5a                   	pop    %rdx
ffff80000010feda:	5a                   	pop    %rdx
ffff80000010fedb:	24 24                	and    $0x24,%al
ffff80000010fedd:	24 00                	and    $0x0,%al
ffff80000010fedf:	00 00                	add    %al,(%rax)
ffff80000010fee1:	00 00                	add    %al,(%rax)
ffff80000010fee3:	00 00                	add    %al,(%rax)
ffff80000010fee5:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
ffff80000010feea:	28 28                	sub    %ch,(%rax)
ffff80000010feec:	44 c6 00 00          	rex.R movb $0x0,(%rax)
ffff80000010fef0:	00 00                	add    %al,(%rax)
ffff80000010fef2:	00 00                	add    %al,(%rax)
ffff80000010fef4:	00 e7                	add    %ah,%bh
ffff80000010fef6:	42                   	rex.X
ffff80000010fef7:	42 24 24             	rex.X and $0x24,%al
ffff80000010fefa:	24 18                	and    $0x18,%al
ffff80000010fefc:	18 10                	sbb    %dl,(%rax)
ffff80000010fefe:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ff01:	00 00                	add    %al,(%rax)
ffff80000010ff03:	00 00                	add    %al,(%rax)
ffff80000010ff05:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
ffff80000010ff0b:	42 82                	rex.X (bad) 
ffff80000010ff0d:	fe 00                	incb   (%rax)
ffff80000010ff0f:	00 00                	add    %al,(%rax)
ffff80000010ff11:	06                   	(bad)  
ffff80000010ff12:	08 10                	or     %dl,(%rax)
ffff80000010ff14:	10 10                	adc    %dl,(%rax)
ffff80000010ff16:	10 60 10             	adc    %ah,0x10(%rax)
ffff80000010ff19:	10 10                	adc    %dl,(%rax)
ffff80000010ff1b:	10 08                	adc    %cl,(%rax)
ffff80000010ff1d:	06                   	(bad)  
ffff80000010ff1e:	00 00                	add    %al,(%rax)
ffff80000010ff20:	10 10                	adc    %dl,(%rax)
ffff80000010ff22:	10 10                	adc    %dl,(%rax)
ffff80000010ff24:	10 10                	adc    %dl,(%rax)
ffff80000010ff26:	10 10                	adc    %dl,(%rax)
ffff80000010ff28:	10 10                	adc    %dl,(%rax)
ffff80000010ff2a:	10 10                	adc    %dl,(%rax)
ffff80000010ff2c:	10 10                	adc    %dl,(%rax)
ffff80000010ff2e:	10 10                	adc    %dl,(%rax)
ffff80000010ff30:	00 60 10             	add    %ah,0x10(%rax)
ffff80000010ff33:	08 08                	or     %cl,(%rax)
ffff80000010ff35:	08 08                	or     %cl,(%rax)
ffff80000010ff37:	06                   	(bad)  
ffff80000010ff38:	08 08                	or     %cl,(%rax)
ffff80000010ff3a:	08 08                	or     %cl,(%rax)
ffff80000010ff3c:	10 60 00             	adc    %ah,0x0(%rax)
ffff80000010ff3f:	00 00                	add    %al,(%rax)
ffff80000010ff41:	72 8c                	jb     ffff80000010fecf <interrupt+0x82f>
	...
ffff80000011075f:	00 00                	add    %al,(%rax)
ffff800000110761:	00 12                	add    %dl,(%rdx)
ffff800000110763:	00 00                	add    %al,(%rax)
ffff800000110765:	80 ff ff             	cmp    $0xff,%bh
	...
ffff800000110770:	00 00                	add    %al,(%rax)
ffff800000110772:	12 00                	adc    (%rax),%al
ffff800000110774:	00 80 ff ff 10 00    	add    %al,0x10ffff(%rax)
ffff80000011077a:	00 00                	add    %al,(%rax)
ffff80000011077c:	00 00                	add    %al,(%rax)
ffff80000011077e:	00 00                	add    %al,(%rax)
ffff800000110780:	10 00                	adc    %al,(%rax)
	...
ffff80000011079e:	00 00                	add    %al,(%rax)
ffff8000001107a0:	00 80 11 00 00 80    	add    %al,-0x7fffffef(%rax)
ffff8000001107a6:	ff                   	(bad)  
ffff8000001107a7:	ff 00                	incl   (%rax)
	...
ffff8000001107e5:	00 12                	add    %dl,(%rdx)
ffff8000001107e7:	00 00                	add    %al,(%rax)
ffff8000001107e9:	80 ff ff             	cmp    $0xff,%bh
ffff8000001107ec:	00 00                	add    %al,(%rax)
ffff8000001107ee:	12 00                	adc    (%rax),%al
ffff8000001107f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001107f6:	12 00                	adc    (%rax),%al
ffff8000001107f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001107fe:	00 00                	add    %al,(%rax)
ffff800000110800:	00 00                	add    %al,(%rax)
ffff800000110802:	00 00                	add    %al,(%rax)
ffff800000110804:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110808:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011080e:	00 00                	add    %al,(%rax)
ffff800000110810:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110816:	00 00                	add    %al,(%rax)
ffff800000110818:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011081e:	00 00                	add    %al,(%rax)
ffff800000110820:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110826:	00 00                	add    %al,(%rax)
ffff800000110828:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011082e:	00 00                	add    %al,(%rax)
ffff800000110830:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110836:	00 00                	add    %al,(%rax)
ffff800000110838:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011084e:	12 00                	adc    (%rax),%al
ffff800000110850:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110856:	12 00                	adc    (%rax),%al
ffff800000110858:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011085e:	12 00                	adc    (%rax),%al
ffff800000110860:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110866:	00 00                	add    %al,(%rax)
ffff800000110868:	00 00                	add    %al,(%rax)
ffff80000011086a:	00 00                	add    %al,(%rax)
ffff80000011086c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110870:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110876:	00 00                	add    %al,(%rax)
ffff800000110878:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011087e:	00 00                	add    %al,(%rax)
ffff800000110880:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110886:	00 00                	add    %al,(%rax)
ffff800000110888:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011088e:	00 00                	add    %al,(%rax)
ffff800000110890:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110896:	00 00                	add    %al,(%rax)
ffff800000110898:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011089e:	00 00                	add    %al,(%rax)
ffff8000001108a0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001108b6:	12 00                	adc    (%rax),%al
ffff8000001108b8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001108be:	12 00                	adc    (%rax),%al
ffff8000001108c0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001108c6:	12 00                	adc    (%rax),%al
ffff8000001108c8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001108ce:	00 00                	add    %al,(%rax)
ffff8000001108d0:	00 00                	add    %al,(%rax)
ffff8000001108d2:	00 00                	add    %al,(%rax)
ffff8000001108d4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001108d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001108de:	00 00                	add    %al,(%rax)
ffff8000001108e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001108e6:	00 00                	add    %al,(%rax)
ffff8000001108e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001108ee:	00 00                	add    %al,(%rax)
ffff8000001108f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001108f6:	00 00                	add    %al,(%rax)
ffff8000001108f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001108fe:	00 00                	add    %al,(%rax)
ffff800000110900:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110906:	00 00                	add    %al,(%rax)
ffff800000110908:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff80000011091e:	12 00                	adc    (%rax),%al
ffff800000110920:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110926:	12 00                	adc    (%rax),%al
ffff800000110928:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011092e:	12 00                	adc    (%rax),%al
ffff800000110930:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110936:	00 00                	add    %al,(%rax)
ffff800000110938:	00 00                	add    %al,(%rax)
ffff80000011093a:	00 00                	add    %al,(%rax)
ffff80000011093c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110940:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110946:	00 00                	add    %al,(%rax)
ffff800000110948:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011094e:	00 00                	add    %al,(%rax)
ffff800000110950:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110956:	00 00                	add    %al,(%rax)
ffff800000110958:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011095e:	00 00                	add    %al,(%rax)
ffff800000110960:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110966:	00 00                	add    %al,(%rax)
ffff800000110968:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff80000011096e:	00 00                	add    %al,(%rax)
ffff800000110970:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000110986:	12 00                	adc    (%rax),%al
ffff800000110988:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011098e:	12 00                	adc    (%rax),%al
ffff800000110990:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110996:	12 00                	adc    (%rax),%al
ffff800000110998:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff80000011099e:	00 00                	add    %al,(%rax)
ffff8000001109a0:	00 00                	add    %al,(%rax)
ffff8000001109a2:	00 00                	add    %al,(%rax)
ffff8000001109a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff8000001109a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109ae:	00 00                	add    %al,(%rax)
ffff8000001109b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109b6:	00 00                	add    %al,(%rax)
ffff8000001109b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109be:	00 00                	add    %al,(%rax)
ffff8000001109c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109c6:	00 00                	add    %al,(%rax)
ffff8000001109c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109ce:	00 00                	add    %al,(%rax)
ffff8000001109d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff8000001109d6:	00 00                	add    %al,(%rax)
ffff8000001109d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff8000001109ee:	12 00                	adc    (%rax),%al
ffff8000001109f0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001109f6:	12 00                	adc    (%rax),%al
ffff8000001109f8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff8000001109fe:	12 00                	adc    (%rax),%al
ffff800000110a00:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110a06:	00 00                	add    %al,(%rax)
ffff800000110a08:	00 00                	add    %al,(%rax)
ffff800000110a0a:	00 00                	add    %al,(%rax)
ffff800000110a0c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110a10:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a16:	00 00                	add    %al,(%rax)
ffff800000110a18:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a1e:	00 00                	add    %al,(%rax)
ffff800000110a20:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a26:	00 00                	add    %al,(%rax)
ffff800000110a28:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a2e:	00 00                	add    %al,(%rax)
ffff800000110a30:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a36:	00 00                	add    %al,(%rax)
ffff800000110a38:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a3e:	00 00                	add    %al,(%rax)
ffff800000110a40:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000110a56:	12 00                	adc    (%rax),%al
ffff800000110a58:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110a5e:	12 00                	adc    (%rax),%al
ffff800000110a60:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110a66:	12 00                	adc    (%rax),%al
ffff800000110a68:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110a6e:	00 00                	add    %al,(%rax)
ffff800000110a70:	00 00                	add    %al,(%rax)
ffff800000110a72:	00 00                	add    %al,(%rax)
ffff800000110a74:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110a78:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a7e:	00 00                	add    %al,(%rax)
ffff800000110a80:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a86:	00 00                	add    %al,(%rax)
ffff800000110a88:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a8e:	00 00                	add    %al,(%rax)
ffff800000110a90:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a96:	00 00                	add    %al,(%rax)
ffff800000110a98:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110a9e:	00 00                	add    %al,(%rax)
ffff800000110aa0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110aa6:	00 00                	add    %al,(%rax)
ffff800000110aa8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000110abe:	12 00                	adc    (%rax),%al
ffff800000110ac0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110ac6:	12 00                	adc    (%rax),%al
ffff800000110ac8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110ace:	12 00                	adc    (%rax),%al
ffff800000110ad0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
ffff800000110ad6:	00 00                	add    %al,(%rax)
ffff800000110ad8:	00 00                	add    %al,(%rax)
ffff800000110ada:	00 00                	add    %al,(%rax)
ffff800000110adc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
ffff800000110ae0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110ae6:	00 00                	add    %al,(%rax)
ffff800000110ae8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110aee:	00 00                	add    %al,(%rax)
ffff800000110af0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110af6:	00 00                	add    %al,(%rax)
ffff800000110af8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110afe:	00 00                	add    %al,(%rax)
ffff800000110b00:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110b06:	00 00                	add    %al,(%rax)
ffff800000110b08:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
ffff800000110b0e:	00 00                	add    %al,(%rax)
ffff800000110b10:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
ffff800000110b1e:	00 00                	add    %al,(%rax)
ffff800000110b20:	3e 43 10 00          	rex.XB adc %al,%ds:(%r8)
ffff800000110b24:	00 80 ff ff 87 43    	add    %al,0x4387ffff(%rax)
ffff800000110b2a:	10 00                	adc    %al,(%rax)
ffff800000110b2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b32:	10 00                	adc    %al,(%rax)
ffff800000110b34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b3a:	10 00                	adc    %al,(%rax)
ffff800000110b3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b42:	10 00                	adc    %al,(%rax)
ffff800000110b44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b4a:	10 00                	adc    %al,(%rax)
ffff800000110b4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b52:	10 00                	adc    %al,(%rax)
ffff800000110b54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b5a:	10 00                	adc    %al,(%rax)
ffff800000110b5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b62:	10 00                	adc    %al,(%rax)
ffff800000110b64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b6a:	10 00                	adc    %al,(%rax)
ffff800000110b6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b72:	10 00                	adc    %al,(%rax)
ffff800000110b74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b7a:	10 00                	adc    %al,(%rax)
ffff800000110b7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b82:	10 00                	adc    %al,(%rax)
ffff800000110b84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b8a:	10 00                	adc    %al,(%rax)
ffff800000110b8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b92:	10 00                	adc    %al,(%rax)
ffff800000110b94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110b9a:	10 00                	adc    %al,(%rax)
ffff800000110b9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ba2:	10 00                	adc    %al,(%rax)
ffff800000110ba4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110baa:	10 00                	adc    %al,(%rax)
ffff800000110bac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bb2:	10 00                	adc    %al,(%rax)
ffff800000110bb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bba:	10 00                	adc    %al,(%rax)
ffff800000110bbc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bc2:	10 00                	adc    %al,(%rax)
ffff800000110bc4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bca:	10 00                	adc    %al,(%rax)
ffff800000110bcc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bd2:	10 00                	adc    %al,(%rax)
ffff800000110bd4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bda:	10 00                	adc    %al,(%rax)
ffff800000110bdc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110be2:	10 00                	adc    %al,(%rax)
ffff800000110be4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bea:	10 00                	adc    %al,(%rax)
ffff800000110bec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bf2:	10 00                	adc    %al,(%rax)
ffff800000110bf4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110bfa:	10 00                	adc    %al,(%rax)
ffff800000110bfc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c02:	10 00                	adc    %al,(%rax)
ffff800000110c04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c0a:	10 00                	adc    %al,(%rax)
ffff800000110c0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c12:	10 00                	adc    %al,(%rax)
ffff800000110c14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c1a:	10 00                	adc    %al,(%rax)
ffff800000110c1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c22:	10 00                	adc    %al,(%rax)
ffff800000110c24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c2a:	10 00                	adc    %al,(%rax)
ffff800000110c2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c32:	10 00                	adc    %al,(%rax)
ffff800000110c34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c3a:	10 00                	adc    %al,(%rax)
ffff800000110c3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c42:	10 00                	adc    %al,(%rax)
ffff800000110c44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c4a:	10 00                	adc    %al,(%rax)
ffff800000110c4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c52:	10 00                	adc    %al,(%rax)
ffff800000110c54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c5a:	10 00                	adc    %al,(%rax)
ffff800000110c5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c62:	10 00                	adc    %al,(%rax)
ffff800000110c64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c6a:	10 00                	adc    %al,(%rax)
ffff800000110c6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c72:	10 00                	adc    %al,(%rax)
ffff800000110c74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c7a:	10 00                	adc    %al,(%rax)
ffff800000110c7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c82:	10 00                	adc    %al,(%rax)
ffff800000110c84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c8a:	10 00                	adc    %al,(%rax)
ffff800000110c8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c92:	10 00                	adc    %al,(%rax)
ffff800000110c94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110c9a:	10 00                	adc    %al,(%rax)
ffff800000110c9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ca2:	10 00                	adc    %al,(%rax)
ffff800000110ca4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110caa:	10 00                	adc    %al,(%rax)
ffff800000110cac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cb2:	10 00                	adc    %al,(%rax)
ffff800000110cb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cba:	10 00                	adc    %al,(%rax)
ffff800000110cbc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cc2:	10 00                	adc    %al,(%rax)
ffff800000110cc4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cca:	10 00                	adc    %al,(%rax)
ffff800000110ccc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cd2:	10 00                	adc    %al,(%rax)
ffff800000110cd4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cda:	10 00                	adc    %al,(%rax)
ffff800000110cdc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ce2:	10 00                	adc    %al,(%rax)
ffff800000110ce4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cea:	10 00                	adc    %al,(%rax)
ffff800000110cec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cf2:	10 00                	adc    %al,(%rax)
ffff800000110cf4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110cfa:	10 00                	adc    %al,(%rax)
ffff800000110cfc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d02:	10 00                	adc    %al,(%rax)
ffff800000110d04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d0a:	10 00                	adc    %al,(%rax)
ffff800000110d0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d12:	10 00                	adc    %al,(%rax)
ffff800000110d14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d1a:	10 00                	adc    %al,(%rax)
ffff800000110d1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d22:	10 00                	adc    %al,(%rax)
ffff800000110d24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d2a:	10 00                	adc    %al,(%rax)
ffff800000110d2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d32:	10 00                	adc    %al,(%rax)
ffff800000110d34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d3a:	10 00                	adc    %al,(%rax)
ffff800000110d3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d42:	10 00                	adc    %al,(%rax)
ffff800000110d44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d4a:	10 00                	adc    %al,(%rax)
ffff800000110d4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d52:	10 00                	adc    %al,(%rax)
ffff800000110d54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d5a:	10 00                	adc    %al,(%rax)
ffff800000110d5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d62:	10 00                	adc    %al,(%rax)
ffff800000110d64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d6a:	10 00                	adc    %al,(%rax)
ffff800000110d6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d72:	10 00                	adc    %al,(%rax)
ffff800000110d74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d7a:	10 00                	adc    %al,(%rax)
ffff800000110d7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d82:	10 00                	adc    %al,(%rax)
ffff800000110d84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d8a:	10 00                	adc    %al,(%rax)
ffff800000110d8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d92:	10 00                	adc    %al,(%rax)
ffff800000110d94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110d9a:	10 00                	adc    %al,(%rax)
ffff800000110d9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110da2:	10 00                	adc    %al,(%rax)
ffff800000110da4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110daa:	10 00                	adc    %al,(%rax)
ffff800000110dac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110db2:	10 00                	adc    %al,(%rax)
ffff800000110db4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dba:	10 00                	adc    %al,(%rax)
ffff800000110dbc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dc2:	10 00                	adc    %al,(%rax)
ffff800000110dc4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dca:	10 00                	adc    %al,(%rax)
ffff800000110dcc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dd2:	10 00                	adc    %al,(%rax)
ffff800000110dd4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dda:	10 00                	adc    %al,(%rax)
ffff800000110ddc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110de2:	10 00                	adc    %al,(%rax)
ffff800000110de4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dea:	10 00                	adc    %al,(%rax)
ffff800000110dec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110df2:	10 00                	adc    %al,(%rax)
ffff800000110df4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110dfa:	10 00                	adc    %al,(%rax)
ffff800000110dfc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e02:	10 00                	adc    %al,(%rax)
ffff800000110e04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e0a:	10 00                	adc    %al,(%rax)
ffff800000110e0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e12:	10 00                	adc    %al,(%rax)
ffff800000110e14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e1a:	10 00                	adc    %al,(%rax)
ffff800000110e1c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e22:	10 00                	adc    %al,(%rax)
ffff800000110e24:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e2a:	10 00                	adc    %al,(%rax)
ffff800000110e2c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e32:	10 00                	adc    %al,(%rax)
ffff800000110e34:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e3a:	10 00                	adc    %al,(%rax)
ffff800000110e3c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e42:	10 00                	adc    %al,(%rax)
ffff800000110e44:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e4a:	10 00                	adc    %al,(%rax)
ffff800000110e4c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e52:	10 00                	adc    %al,(%rax)
ffff800000110e54:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e5a:	10 00                	adc    %al,(%rax)
ffff800000110e5c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e62:	10 00                	adc    %al,(%rax)
ffff800000110e64:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e6a:	10 00                	adc    %al,(%rax)
ffff800000110e6c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e72:	10 00                	adc    %al,(%rax)
ffff800000110e74:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e7a:	10 00                	adc    %al,(%rax)
ffff800000110e7c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e82:	10 00                	adc    %al,(%rax)
ffff800000110e84:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e8a:	10 00                	adc    %al,(%rax)
ffff800000110e8c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e92:	10 00                	adc    %al,(%rax)
ffff800000110e94:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110e9a:	10 00                	adc    %al,(%rax)
ffff800000110e9c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ea2:	10 00                	adc    %al,(%rax)
ffff800000110ea4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eaa:	10 00                	adc    %al,(%rax)
ffff800000110eac:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eb2:	10 00                	adc    %al,(%rax)
ffff800000110eb4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eba:	10 00                	adc    %al,(%rax)
ffff800000110ebc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ec2:	10 00                	adc    %al,(%rax)
ffff800000110ec4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eca:	10 00                	adc    %al,(%rax)
ffff800000110ecc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ed2:	10 00                	adc    %al,(%rax)
ffff800000110ed4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eda:	10 00                	adc    %al,(%rax)
ffff800000110edc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ee2:	10 00                	adc    %al,(%rax)
ffff800000110ee4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110eea:	10 00                	adc    %al,(%rax)
ffff800000110eec:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110ef2:	10 00                	adc    %al,(%rax)
ffff800000110ef4:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110efa:	10 00                	adc    %al,(%rax)
ffff800000110efc:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110f02:	10 00                	adc    %al,(%rax)
ffff800000110f04:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110f0a:	10 00                	adc    %al,(%rax)
ffff800000110f0c:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110f12:	10 00                	adc    %al,(%rax)
ffff800000110f14:	00 80 ff ff 3e 43    	add    %al,0x433effff(%rax)
ffff800000110f1a:	10 00                	adc    %al,(%rax)
ffff800000110f1c:	00                   	.byte 0x0
ffff800000110f1d:	80 ff ff             	cmp    $0xff,%bh

Disassembly of section .rodata:

ffff800000110f20 <_rodata>:
ffff800000110f20:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110f21:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110f22:	5f                   	pop    %rdi
ffff800000110f23:	73 79                	jae    ffff800000110f9e <_rodata+0x7e>
ffff800000110f25:	73 74                	jae    ffff800000110f9b <_rodata+0x7b>
ffff800000110f27:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000110f29:	5f                   	pop    %rdi
ffff800000110f2a:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000110f2d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110f2e:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000110f31:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000110f34:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110f35:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000110f36:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000110f3d:	25 23 30 34 78       	and    $0x78343023,%eax
ffff800000110f42:	0a 00                	or     (%rax),%al
ffff800000110f44:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110f45:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000110f47:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110f48:	72 79                	jb     ffff800000110fc3 <_rodata+0xa3>
ffff800000110f4a:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000110f4d:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
ffff800000110f54:	74 
ffff800000110f55:	65 72 72             	gs jb  ffff800000110fca <_rodata+0xaa>
ffff800000110f58:	75 70                	jne    ffff800000110fca <_rodata+0xaa>
ffff800000110f5a:	74 20                	je     ffff800000110f7c <_rodata+0x5c>
ffff800000110f5c:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000110f63:	74 61                	je     ffff800000110fc6 <_rodata+0xa6>
ffff800000110f65:	73 6b                	jae    ffff800000110fd2 <_rodata+0xb2>
ffff800000110f67:	5f                   	pop    %rdi
ffff800000110f68:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
ffff800000110f6f:	00 30                	add    %dh,(%rax)
ffff800000110f71:	31 32                	xor    %esi,(%rdx)
ffff800000110f73:	33 34 35 36 37 38 39 	xor    0x39383736(,%rsi,1),%esi
ffff800000110f7a:	41                   	rex.B
ffff800000110f7b:	42                   	rex.X
ffff800000110f7c:	43                   	rex.XB
ffff800000110f7d:	44                   	rex.R
ffff800000110f7e:	45                   	rex.RB
ffff800000110f7f:	46                   	rex.RX
ffff800000110f80:	47                   	rex.RXB
ffff800000110f81:	48                   	rex.W
ffff800000110f82:	49                   	rex.WB
ffff800000110f83:	4a                   	rex.WX
ffff800000110f84:	4b                   	rex.WXB
ffff800000110f85:	4c                   	rex.WR
ffff800000110f86:	4d                   	rex.WRB
ffff800000110f87:	4e                   	rex.WRX
ffff800000110f88:	4f 50                	rex.WRXB push %r8
ffff800000110f8a:	51                   	push   %rcx
ffff800000110f8b:	52                   	push   %rdx
ffff800000110f8c:	53                   	push   %rbx
ffff800000110f8d:	54                   	push   %rsp
ffff800000110f8e:	55                   	push   %rbp
ffff800000110f8f:	56                   	push   %rsi
ffff800000110f90:	57                   	push   %rdi
ffff800000110f91:	58                   	pop    %rax
ffff800000110f92:	59                   	pop    %rcx
ffff800000110f93:	5a                   	pop    %rdx
ffff800000110f94:	00 00                	add    %al,(%rax)
ffff800000110f96:	00 00                	add    %al,(%rax)
ffff800000110f98:	30 31                	xor    %dh,(%rcx)
ffff800000110f9a:	32 33                	xor    (%rbx),%dh
ffff800000110f9c:	34 35                	xor    $0x35,%al
ffff800000110f9e:	36 37                	ss (bad) 
ffff800000110fa0:	38 39                	cmp    %bh,(%rcx)
ffff800000110fa2:	61                   	(bad)  
ffff800000110fa3:	62 63 64 65 66       	(bad)
ffff800000110fa8:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
ffff800000110fae:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000110faf:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000110fb0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000110fb1:	70 71                	jo     ffff800000111024 <_rodata+0x104>
ffff800000110fb3:	72 73                	jb     ffff800000111028 <_rodata+0x108>
ffff800000110fb5:	74 75                	je     ffff80000011102c <_rodata+0x10c>
ffff800000110fb7:	76 77                	jbe    ffff800000111030 <_rodata+0x110>
ffff800000110fb9:	78 79                	js     ffff800000111034 <_rodata+0x114>
ffff800000110fbb:	7a 00                	jp     ffff800000110fbd <_rodata+0x9d>
ffff800000110fbd:	00 00                	add    %al,(%rax)
ffff800000110fbf:	00 c3                	add    %al,%bl
ffff800000110fc1:	4a 10 00             	rex.WX adc %al,(%rax)
ffff800000110fc4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110fca:	10 00                	adc    %al,(%rax)
ffff800000110fcc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110fd2:	10 00                	adc    %al,(%rax)
ffff800000110fd4:	00 80 ff ff c9 4a    	add    %al,0x4ac9ffff(%rax)
ffff800000110fda:	10 00                	adc    %al,(%rax)
ffff800000110fdc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110fe2:	10 00                	adc    %al,(%rax)
ffff800000110fe4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110fea:	10 00                	adc    %al,(%rax)
ffff800000110fec:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110ff2:	10 00                	adc    %al,(%rax)
ffff800000110ff4:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000110ffa:	10 00                	adc    %al,(%rax)
ffff800000110ffc:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111002:	10 00                	adc    %al,(%rax)
ffff800000111004:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff80000011100a:	10 00                	adc    %al,(%rax)
ffff80000011100c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111012:	10 00                	adc    %al,(%rax)
ffff800000111014:	00 80 ff ff bd 4a    	add    %al,0x4abdffff(%rax)
ffff80000011101a:	10 00                	adc    %al,(%rax)
ffff80000011101c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111022:	10 00                	adc    %al,(%rax)
ffff800000111024:	00 80 ff ff b7 4a    	add    %al,0x4ab7ffff(%rax)
ffff80000011102a:	10 00                	adc    %al,(%rax)
ffff80000011102c:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff800000111032:	10 00                	adc    %al,(%rax)
ffff800000111034:	00 80 ff ff d5 4a    	add    %al,0x4ad5ffff(%rax)
ffff80000011103a:	10 00                	adc    %al,(%rax)
ffff80000011103c:	00 80 ff ff cf 4a    	add    %al,0x4acfffff(%rax)
ffff800000111042:	10 00                	adc    %al,(%rax)
ffff800000111044:	00 80 ff ff ae 52    	add    %al,0x52aeffff(%rax)
ffff80000011104a:	10 00                	adc    %al,(%rax)
ffff80000011104c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111052:	10 00                	adc    %al,(%rax)
ffff800000111054:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011105a:	10 00                	adc    %al,(%rax)
ffff80000011105c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111062:	10 00                	adc    %al,(%rax)
ffff800000111064:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011106a:	10 00                	adc    %al,(%rax)
ffff80000011106c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111072:	10 00                	adc    %al,(%rax)
ffff800000111074:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011107a:	10 00                	adc    %al,(%rax)
ffff80000011107c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111082:	10 00                	adc    %al,(%rax)
ffff800000111084:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011108a:	10 00                	adc    %al,(%rax)
ffff80000011108c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111092:	10 00                	adc    %al,(%rax)
ffff800000111094:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011109a:	10 00                	adc    %al,(%rax)
ffff80000011109c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110a2:	10 00                	adc    %al,(%rax)
ffff8000001110a4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110aa:	10 00                	adc    %al,(%rax)
ffff8000001110ac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110b2:	10 00                	adc    %al,(%rax)
ffff8000001110b4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110ba:	10 00                	adc    %al,(%rax)
ffff8000001110bc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110c2:	10 00                	adc    %al,(%rax)
ffff8000001110c4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110ca:	10 00                	adc    %al,(%rax)
ffff8000001110cc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110d2:	10 00                	adc    %al,(%rax)
ffff8000001110d4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110da:	10 00                	adc    %al,(%rax)
ffff8000001110dc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110e2:	10 00                	adc    %al,(%rax)
ffff8000001110e4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110ea:	10 00                	adc    %al,(%rax)
ffff8000001110ec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110f2:	10 00                	adc    %al,(%rax)
ffff8000001110f4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001110fa:	10 00                	adc    %al,(%rax)
ffff8000001110fc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111102:	10 00                	adc    %al,(%rax)
ffff800000111104:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011110a:	10 00                	adc    %al,(%rax)
ffff80000011110c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111112:	10 00                	adc    %al,(%rax)
ffff800000111114:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011111a:	10 00                	adc    %al,(%rax)
ffff80000011111c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111122:	10 00                	adc    %al,(%rax)
ffff800000111124:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011112a:	10 00                	adc    %al,(%rax)
ffff80000011112c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111132:	10 00                	adc    %al,(%rax)
ffff800000111134:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011113a:	10 00                	adc    %al,(%rax)
ffff80000011113c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111142:	10 00                	adc    %al,(%rax)
ffff800000111144:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011114a:	10 00                	adc    %al,(%rax)
ffff80000011114c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111152:	10 00                	adc    %al,(%rax)
ffff800000111154:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011115a:	10 00                	adc    %al,(%rax)
ffff80000011115c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111162:	10 00                	adc    %al,(%rax)
ffff800000111164:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011116a:	10 00                	adc    %al,(%rax)
ffff80000011116c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111172:	10 00                	adc    %al,(%rax)
ffff800000111174:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011117a:	10 00                	adc    %al,(%rax)
ffff80000011117c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111182:	10 00                	adc    %al,(%rax)
ffff800000111184:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011118a:	10 00                	adc    %al,(%rax)
ffff80000011118c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111192:	10 00                	adc    %al,(%rax)
ffff800000111194:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011119a:	10 00                	adc    %al,(%rax)
ffff80000011119c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111a2:	10 00                	adc    %al,(%rax)
ffff8000001111a4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111aa:	10 00                	adc    %al,(%rax)
ffff8000001111ac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111b2:	10 00                	adc    %al,(%rax)
ffff8000001111b4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111ba:	10 00                	adc    %al,(%rax)
ffff8000001111bc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111c2:	10 00                	adc    %al,(%rax)
ffff8000001111c4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111ca:	10 00                	adc    %al,(%rax)
ffff8000001111cc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111d2:	10 00                	adc    %al,(%rax)
ffff8000001111d4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111da:	10 00                	adc    %al,(%rax)
ffff8000001111dc:	00 80 ff ff e7 4f    	add    %al,0x4fe7ffff(%rax)
ffff8000001111e2:	10 00                	adc    %al,(%rax)
ffff8000001111e4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111ea:	10 00                	adc    %al,(%rax)
ffff8000001111ec:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111f2:	10 00                	adc    %al,(%rax)
ffff8000001111f4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001111fa:	10 00                	adc    %al,(%rax)
ffff8000001111fc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111202:	10 00                	adc    %al,(%rax)
ffff800000111204:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011120a:	10 00                	adc    %al,(%rax)
ffff80000011120c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111212:	10 00                	adc    %al,(%rax)
ffff800000111214:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011121a:	10 00                	adc    %al,(%rax)
ffff80000011121c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111222:	10 00                	adc    %al,(%rax)
ffff800000111224:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011122a:	10 00                	adc    %al,(%rax)
ffff80000011122c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111232:	10 00                	adc    %al,(%rax)
ffff800000111234:	00 80 ff ff b0 4c    	add    %al,0x4cb0ffff(%rax)
ffff80000011123a:	10 00                	adc    %al,(%rax)
ffff80000011123c:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff800000111242:	10 00                	adc    %al,(%rax)
ffff800000111244:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011124a:	10 00                	adc    %al,(%rax)
ffff80000011124c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111252:	10 00                	adc    %al,(%rax)
ffff800000111254:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011125a:	10 00                	adc    %al,(%rax)
ffff80000011125c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111262:	10 00                	adc    %al,(%rax)
ffff800000111264:	00 80 ff ff e7 50    	add    %al,0x50e7ffff(%rax)
ffff80000011126a:	10 00                	adc    %al,(%rax)
ffff80000011126c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111272:	10 00                	adc    %al,(%rax)
ffff800000111274:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011127a:	10 00                	adc    %al,(%rax)
ffff80000011127c:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff800000111282:	10 00                	adc    %al,(%rax)
ffff800000111284:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff80000011128a:	10 00                	adc    %al,(%rax)
ffff80000011128c:	00 80 ff ff eb 51    	add    %al,0x51ebffff(%rax)
ffff800000111292:	10 00                	adc    %al,(%rax)
ffff800000111294:	00 80 ff ff 54 4e    	add    %al,0x4e54ffff(%rax)
ffff80000011129a:	10 00                	adc    %al,(%rax)
ffff80000011129c:	00 80 ff ff 54 4f    	add    %al,0x4f54ffff(%rax)
ffff8000001112a2:	10 00                	adc    %al,(%rax)
ffff8000001112a4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001112aa:	10 00                	adc    %al,(%rax)
ffff8000001112ac:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001112b2:	10 00                	adc    %al,(%rax)
ffff8000001112b4:	00 80 ff ff 4a 4d    	add    %al,0x4d4affff(%rax)
ffff8000001112ba:	10 00                	adc    %al,(%rax)
ffff8000001112bc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001112c2:	10 00                	adc    %al,(%rax)
ffff8000001112c4:	00 80 ff ff eb 50    	add    %al,0x50ebffff(%rax)
ffff8000001112ca:	10 00                	adc    %al,(%rax)
ffff8000001112cc:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001112d2:	10 00                	adc    %al,(%rax)
ffff8000001112d4:	00 80 ff ff bf 52    	add    %al,0x52bfffff(%rax)
ffff8000001112da:	10 00                	adc    %al,(%rax)
ffff8000001112dc:	00 80 ff ff e3 4f    	add    %al,0x4fe3ffff(%rax)
ffff8000001112e2:	10 00                	adc    %al,(%rax)
ffff8000001112e4:	00 80 ff ff 64 6f    	add    %al,0x6f64ffff(%rax)
ffff8000001112ea:	5f                   	pop    %rdi
ffff8000001112eb:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
ffff8000001112f2:	65 
ffff8000001112f3:	72 72                	jb     ffff800000111367 <_rodata+0x447>
ffff8000001112f5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001112f6:	72 28                	jb     ffff800000111320 <_rodata+0x400>
ffff8000001112f8:	30 29                	xor    %ch,(%rcx)
ffff8000001112fa:	2c 45                	sub    $0x45,%al
ffff8000001112fc:	52                   	push   %rdx
ffff8000001112fd:	52                   	push   %rdx
ffff8000001112fe:	4f 52                	rex.WRXB push %r10
ffff800000111300:	5f                   	pop    %rdi
ffff800000111301:	43                   	rex.XB
ffff800000111302:	4f                   	rex.WRXB
ffff800000111303:	44                   	rex.R
ffff800000111304:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842432e <_ebss+0x382f5dfe>
ffff80000011130b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011130c:	78 2c                	js     ffff80000011133a <_rodata+0x41a>
ffff80000011130e:	52                   	push   %rdx
ffff80000011130f:	53                   	push   %rbx
ffff800000111310:	50                   	push   %rax
ffff800000111311:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842433a <_ebss+0x382f5e0a>
ffff800000111317:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111318:	78 2c                	js     ffff800000111346 <_rodata+0x426>
ffff80000011131a:	52                   	push   %rdx
ffff80000011131b:	49 50                	rex.WB push %r8
ffff80000011131d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424346 <_ebss+0x382f5e16>
ffff800000111323:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111324:	78 0a                	js     ffff800000111330 <_rodata+0x410>
ffff800000111326:	00 00                	add    %al,(%rax)
ffff800000111328:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011132a:	5f                   	pop    %rdi
ffff80000011132b:	64 65 62             	fs gs (bad) 
ffff80000011132e:	75 67                	jne    ffff800000111397 <_rodata+0x477>
ffff800000111330:	28 31                	sub    %dh,(%rcx)
ffff800000111332:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111339:	5f                   	pop    %rdi
ffff80000011133a:	43                   	rex.XB
ffff80000011133b:	4f                   	rex.WRXB
ffff80000011133c:	44                   	rex.R
ffff80000011133d:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424367 <_ebss+0x382f5e37>
ffff800000111344:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111345:	78 2c                	js     ffff800000111373 <_rodata+0x453>
ffff800000111347:	52                   	push   %rdx
ffff800000111348:	53                   	push   %rbx
ffff800000111349:	50                   	push   %rax
ffff80000011134a:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424373 <_ebss+0x382f5e43>
ffff800000111350:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111351:	78 2c                	js     ffff80000011137f <_rodata+0x45f>
ffff800000111353:	52                   	push   %rdx
ffff800000111354:	49 50                	rex.WB push %r8
ffff800000111356:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842437f <_ebss+0x382f5e4f>
ffff80000011135c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011135d:	78 0a                	js     ffff800000111369 <_rodata+0x449>
ffff80000011135f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111363:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111364:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111365:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
ffff80000011136b:	52                   	push   %rdx
ffff80000011136c:	52                   	push   %rdx
ffff80000011136d:	4f 52                	rex.WRXB push %r10
ffff80000011136f:	5f                   	pop    %rdi
ffff800000111370:	43                   	rex.XB
ffff800000111371:	4f                   	rex.WRXB
ffff800000111372:	44                   	rex.R
ffff800000111373:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842439d <_ebss+0x382f5e6d>
ffff80000011137a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011137b:	78 2c                	js     ffff8000001113a9 <_rodata+0x489>
ffff80000011137d:	52                   	push   %rdx
ffff80000011137e:	53                   	push   %rbx
ffff80000011137f:	50                   	push   %rax
ffff800000111380:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384243a9 <_ebss+0x382f5e79>
ffff800000111386:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111387:	78 2c                	js     ffff8000001113b5 <_rodata+0x495>
ffff800000111389:	52                   	push   %rdx
ffff80000011138a:	49 50                	rex.WB push %r8
ffff80000011138c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384243b5 <_ebss+0x382f5e85>
ffff800000111392:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111393:	78 0a                	js     ffff80000011139f <_rodata+0x47f>
ffff800000111395:	00 00                	add    %al,(%rax)
ffff800000111397:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff80000011139b:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
ffff8000001113a2:	2c 45                	sub    $0x45,%al
ffff8000001113a4:	52                   	push   %rdx
ffff8000001113a5:	52                   	push   %rdx
ffff8000001113a6:	4f 52                	rex.WRXB push %r10
ffff8000001113a8:	5f                   	pop    %rdi
ffff8000001113a9:	43                   	rex.XB
ffff8000001113aa:	4f                   	rex.WRXB
ffff8000001113ab:	44                   	rex.R
ffff8000001113ac:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384243d6 <_ebss+0x382f5ea6>
ffff8000001113b3:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113b4:	78 2c                	js     ffff8000001113e2 <_rodata+0x4c2>
ffff8000001113b6:	52                   	push   %rdx
ffff8000001113b7:	53                   	push   %rbx
ffff8000001113b8:	50                   	push   %rax
ffff8000001113b9:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384243e2 <_ebss+0x382f5eb2>
ffff8000001113bf:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113c0:	78 2c                	js     ffff8000001113ee <_rodata+0x4ce>
ffff8000001113c2:	52                   	push   %rdx
ffff8000001113c3:	49 50                	rex.WB push %r8
ffff8000001113c5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384243ee <_ebss+0x382f5ebe>
ffff8000001113cb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113cc:	78 0a                	js     ffff8000001113d8 <_rodata+0x4b8>
ffff8000001113ce:	00 00                	add    %al,(%rax)
ffff8000001113d0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001113d2:	5f                   	pop    %rdi
ffff8000001113d3:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001113d4:	76 65                	jbe    ffff80000011143b <_rodata+0x51b>
ffff8000001113d6:	72 66                	jb     ffff80000011143e <_rodata+0x51e>
ffff8000001113d8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113d9:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001113da:	77 28                	ja     ffff800000111404 <_rodata+0x4e4>
ffff8000001113dc:	34 29                	xor    $0x29,%al
ffff8000001113de:	2c 45                	sub    $0x45,%al
ffff8000001113e0:	52                   	push   %rdx
ffff8000001113e1:	52                   	push   %rdx
ffff8000001113e2:	4f 52                	rex.WRXB push %r10
ffff8000001113e4:	5f                   	pop    %rdi
ffff8000001113e5:	43                   	rex.XB
ffff8000001113e6:	4f                   	rex.WRXB
ffff8000001113e7:	44                   	rex.R
ffff8000001113e8:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424412 <_ebss+0x382f5ee2>
ffff8000001113ef:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113f0:	78 2c                	js     ffff80000011141e <_rodata+0x4fe>
ffff8000001113f2:	52                   	push   %rdx
ffff8000001113f3:	53                   	push   %rbx
ffff8000001113f4:	50                   	push   %rax
ffff8000001113f5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842441e <_ebss+0x382f5eee>
ffff8000001113fb:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001113fc:	78 2c                	js     ffff80000011142a <_rodata+0x50a>
ffff8000001113fe:	52                   	push   %rdx
ffff8000001113ff:	49 50                	rex.WB push %r8
ffff800000111401:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842442a <_ebss+0x382f5efa>
ffff800000111407:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111408:	78 0a                	js     ffff800000111414 <_rodata+0x4f4>
ffff80000011140a:	00 00                	add    %al,(%rax)
ffff80000011140c:	00 00                	add    %al,(%rax)
ffff80000011140e:	00 00                	add    %al,(%rax)
ffff800000111410:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111412:	5f                   	pop    %rdi
ffff800000111413:	62                   	(bad)  
ffff800000111414:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111415:	75 6e                	jne    ffff800000111485 <_rodata+0x565>
ffff800000111417:	64 73 28             	fs jae ffff800000111442 <_rodata+0x522>
ffff80000011141a:	35 29 2c 45 52       	xor    $0x52452c29,%eax
ffff80000011141f:	52                   	push   %rdx
ffff800000111420:	4f 52                	rex.WRXB push %r10
ffff800000111422:	5f                   	pop    %rdi
ffff800000111423:	43                   	rex.XB
ffff800000111424:	4f                   	rex.WRXB
ffff800000111425:	44                   	rex.R
ffff800000111426:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424450 <_ebss+0x382f5f20>
ffff80000011142d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011142e:	78 2c                	js     ffff80000011145c <_rodata+0x53c>
ffff800000111430:	52                   	push   %rdx
ffff800000111431:	53                   	push   %rbx
ffff800000111432:	50                   	push   %rax
ffff800000111433:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842445c <_ebss+0x382f5f2c>
ffff800000111439:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011143a:	78 2c                	js     ffff800000111468 <_rodata+0x548>
ffff80000011143c:	52                   	push   %rdx
ffff80000011143d:	49 50                	rex.WB push %r8
ffff80000011143f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424468 <_ebss+0x382f5f38>
ffff800000111445:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111446:	78 0a                	js     ffff800000111452 <_rodata+0x532>
	...
ffff800000111450:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111452:	5f                   	pop    %rdi
ffff800000111453:	75 6e                	jne    ffff8000001114c3 <_rodata+0x5a3>
ffff800000111455:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
ffff80000011145c:	5f 
ffff80000011145d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011145e:	70 63                	jo     ffff8000001114c3 <_rodata+0x5a3>
ffff800000111460:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111461:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
ffff800000111465:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011146c:	5f                   	pop    %rdi
ffff80000011146d:	43                   	rex.XB
ffff80000011146e:	4f                   	rex.WRXB
ffff80000011146f:	44                   	rex.R
ffff800000111470:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842449a <_ebss+0x382f5f6a>
ffff800000111477:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111478:	78 2c                	js     ffff8000001114a6 <_rodata+0x586>
ffff80000011147a:	52                   	push   %rdx
ffff80000011147b:	53                   	push   %rbx
ffff80000011147c:	50                   	push   %rax
ffff80000011147d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384244a6 <_ebss+0x382f5f76>
ffff800000111483:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111484:	78 2c                	js     ffff8000001114b2 <_rodata+0x592>
ffff800000111486:	52                   	push   %rdx
ffff800000111487:	49 50                	rex.WB push %r8
ffff800000111489:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384244b2 <_ebss+0x382f5f82>
ffff80000011148f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111490:	78 0a                	js     ffff80000011149c <_rodata+0x57c>
ffff800000111492:	00 00                	add    %al,(%rax)
ffff800000111494:	00 00                	add    %al,(%rax)
ffff800000111496:	00 00                	add    %al,(%rax)
ffff800000111498:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011149a:	5f                   	pop    %rdi
ffff80000011149b:	64 65 76 5f          	fs gs jbe ffff8000001114fe <_rodata+0x5de>
ffff80000011149f:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001114a0:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001114a1:	74 5f                	je     ffff800000111502 <_rodata+0x5e2>
ffff8000001114a3:	61                   	(bad)  
ffff8000001114a4:	76 61                	jbe    ffff800000111507 <_rodata+0x5e7>
ffff8000001114a6:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
ffff8000001114ad:	37 
ffff8000001114ae:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff8000001114b5:	5f                   	pop    %rdi
ffff8000001114b6:	43                   	rex.XB
ffff8000001114b7:	4f                   	rex.WRXB
ffff8000001114b8:	44                   	rex.R
ffff8000001114b9:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384244e3 <_ebss+0x382f5fb3>
ffff8000001114c0:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001114c1:	78 2c                	js     ffff8000001114ef <_rodata+0x5cf>
ffff8000001114c3:	52                   	push   %rdx
ffff8000001114c4:	53                   	push   %rbx
ffff8000001114c5:	50                   	push   %rax
ffff8000001114c6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384244ef <_ebss+0x382f5fbf>
ffff8000001114cc:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001114cd:	78 2c                	js     ffff8000001114fb <_rodata+0x5db>
ffff8000001114cf:	52                   	push   %rdx
ffff8000001114d0:	49 50                	rex.WB push %r8
ffff8000001114d2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384244fb <_ebss+0x382f5fcb>
ffff8000001114d8:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001114d9:	78 0a                	js     ffff8000001114e5 <_rodata+0x5c5>
ffff8000001114db:	00 00                	add    %al,(%rax)
ffff8000001114dd:	00 00                	add    %al,(%rax)
ffff8000001114df:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001114e3:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001114e5:	75 62                	jne    ffff800000111549 <_rodata+0x629>
ffff8000001114e7:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001114e8:	65 5f                	gs pop %rdi
ffff8000001114ea:	66 61                	data16 (bad) 
ffff8000001114ec:	75 6c                	jne    ffff80000011155a <_rodata+0x63a>
ffff8000001114ee:	74 28                	je     ffff800000111518 <_rodata+0x5f8>
ffff8000001114f0:	38 29                	cmp    %ch,(%rcx)
ffff8000001114f2:	2c 45                	sub    $0x45,%al
ffff8000001114f4:	52                   	push   %rdx
ffff8000001114f5:	52                   	push   %rdx
ffff8000001114f6:	4f 52                	rex.WRXB push %r10
ffff8000001114f8:	5f                   	pop    %rdi
ffff8000001114f9:	43                   	rex.XB
ffff8000001114fa:	4f                   	rex.WRXB
ffff8000001114fb:	44                   	rex.R
ffff8000001114fc:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424526 <_ebss+0x382f5ff6>
ffff800000111503:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111504:	78 2c                	js     ffff800000111532 <_rodata+0x612>
ffff800000111506:	52                   	push   %rdx
ffff800000111507:	53                   	push   %rbx
ffff800000111508:	50                   	push   %rax
ffff800000111509:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424532 <_ebss+0x382f6002>
ffff80000011150f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111510:	78 2c                	js     ffff80000011153e <_rodata+0x61e>
ffff800000111512:	52                   	push   %rdx
ffff800000111513:	49 50                	rex.WB push %r8
ffff800000111515:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842453e <_ebss+0x382f600e>
ffff80000011151b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011151c:	78 0a                	js     ffff800000111528 <_rodata+0x608>
ffff80000011151e:	00 00                	add    %al,(%rax)
ffff800000111520:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111522:	5f                   	pop    %rdi
ffff800000111523:	63 6f 70             	movsxd 0x70(%rdi),%ebp
ffff800000111526:	72 6f                	jb     ffff800000111597 <_rodata+0x677>
ffff800000111528:	63 65 73             	movsxd 0x73(%rbp),%esp
ffff80000011152b:	73 6f                	jae    ffff80000011159c <_rodata+0x67c>
ffff80000011152d:	72 5f                	jb     ffff80000011158e <_rodata+0x66e>
ffff80000011152f:	73 65                	jae    ffff800000111596 <_rodata+0x676>
ffff800000111531:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111533:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111535:	74 5f                	je     ffff800000111596 <_rodata+0x676>
ffff800000111537:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111538:	76 65                	jbe    ffff80000011159f <_rodata+0x67f>
ffff80000011153a:	72 72                	jb     ffff8000001115ae <_rodata+0x68e>
ffff80000011153c:	75 6e                	jne    ffff8000001115ac <_rodata+0x68c>
ffff80000011153e:	28 39                	sub    %bh,(%rcx)
ffff800000111540:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111547:	5f                   	pop    %rdi
ffff800000111548:	43                   	rex.XB
ffff800000111549:	4f                   	rex.WRXB
ffff80000011154a:	44                   	rex.R
ffff80000011154b:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424575 <_ebss+0x382f6045>
ffff800000111552:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111553:	78 2c                	js     ffff800000111581 <_rodata+0x661>
ffff800000111555:	52                   	push   %rdx
ffff800000111556:	53                   	push   %rbx
ffff800000111557:	50                   	push   %rax
ffff800000111558:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424581 <_ebss+0x382f6051>
ffff80000011155e:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011155f:	78 2c                	js     ffff80000011158d <_rodata+0x66d>
ffff800000111561:	52                   	push   %rdx
ffff800000111562:	49 50                	rex.WB push %r8
ffff800000111564:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842458d <_ebss+0x382f605d>
ffff80000011156a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011156b:	78 0a                	js     ffff800000111577 <_rodata+0x657>
ffff80000011156d:	00 00                	add    %al,(%rax)
ffff80000011156f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111573:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
ffff80000011157a:	5f                   	pop    %rdi
ffff80000011157b:	54                   	push   %rsp
ffff80000011157c:	53                   	push   %rbx
ffff80000011157d:	53                   	push   %rbx
ffff80000011157e:	28 31                	sub    %dh,(%rcx)
ffff800000111580:	30 29                	xor    %ch,(%rcx)
ffff800000111582:	2c 45                	sub    $0x45,%al
ffff800000111584:	52                   	push   %rdx
ffff800000111585:	52                   	push   %rdx
ffff800000111586:	4f 52                	rex.WRXB push %r10
ffff800000111588:	5f                   	pop    %rdi
ffff800000111589:	43                   	rex.XB
ffff80000011158a:	4f                   	rex.WRXB
ffff80000011158b:	44                   	rex.R
ffff80000011158c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384245b6 <_ebss+0x382f6086>
ffff800000111593:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111594:	78 2c                	js     ffff8000001115c2 <_rodata+0x6a2>
ffff800000111596:	52                   	push   %rdx
ffff800000111597:	53                   	push   %rbx
ffff800000111598:	50                   	push   %rax
ffff800000111599:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384245c2 <_ebss+0x382f6092>
ffff80000011159f:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001115a0:	78 2c                	js     ffff8000001115ce <_rodata+0x6ae>
ffff8000001115a2:	52                   	push   %rdx
ffff8000001115a3:	49 50                	rex.WB push %r8
ffff8000001115a5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384245ce <_ebss+0x382f609e>
ffff8000001115ab:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001115ac:	78 0a                	js     ffff8000001115b8 <_rodata+0x698>
ffff8000001115ae:	00 00                	add    %al,(%rax)
ffff8000001115b0:	54                   	push   %rsp
ffff8000001115b1:	68 65 20 65 78       	pushq  $0x78652065
ffff8000001115b6:	63 65 70             	movsxd 0x70(%rbp),%esp
ffff8000001115b9:	74 69                	je     ffff800000111624 <_rodata+0x704>
ffff8000001115bb:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001115bc:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001115bd:	20 6f 63             	and    %ch,0x63(%rdi)
ffff8000001115c0:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff8000001115c3:	72 65                	jb     ffff80000011162a <_rodata+0x70a>
ffff8000001115c5:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
ffff8000001115ca:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
ffff8000001115d1:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
ffff8000001115d8:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
ffff8000001115dc:	20 65 76             	and    %ah,0x76(%rbp)
ffff8000001115df:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001115e1:	74 20                	je     ffff800000111603 <_rodata+0x6e3>
ffff8000001115e3:	65 78 74             	gs js  ffff80000011165a <_rodata+0x73a>
ffff8000001115e6:	65 72 6e             	gs jb  ffff800000111657 <_rodata+0x737>
ffff8000001115e9:	61                   	(bad)  
ffff8000001115ea:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001115eb:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001115ef:	74 68                	je     ffff800000111659 <_rodata+0x739>
ffff8000001115f1:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
ffff8000001115f5:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001115f6:	67 72 61             	addr32 jb ffff80000011165a <_rodata+0x73a>
ffff8000001115f9:	6d                   	insl   (%dx),%es:(%rdi)
ffff8000001115fa:	2c 73                	sub    $0x73,%al
ffff8000001115fc:	75 63                	jne    ffff800000111661 <_rodata+0x741>
ffff8000001115fe:	68 20 61 73 20       	pushq  $0x20736120
ffff800000111603:	61                   	(bad)  
ffff800000111604:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111605:	20 69 6e             	and    %ch,0x6e(%rcx)
ffff800000111608:	74 65                	je     ffff80000011166f <_rodata+0x74f>
ffff80000011160a:	72 72                	jb     ffff80000011167e <_rodata+0x75e>
ffff80000011160c:	75 70                	jne    ffff80000011167e <_rodata+0x75e>
ffff80000011160e:	74 20                	je     ffff800000111630 <_rodata+0x710>
ffff800000111610:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111611:	72 20                	jb     ffff800000111633 <_rodata+0x713>
ffff800000111613:	61                   	(bad)  
ffff800000111614:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111615:	20 65 61             	and    %ah,0x61(%rbp)
ffff800000111618:	72 6c                	jb     ffff800000111686 <_rodata+0x766>
ffff80000011161a:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
ffff800000111621:	65 70 74             	gs jo  ffff800000111698 <_rodata+0x778>
ffff800000111624:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
ffff80000011162b:	00 00                	add    %al,(%rax)
ffff80000011162d:	00 00                	add    %al,(%rax)
ffff80000011162f:	00 52 65             	add    %dl,0x65(%rdx)
ffff800000111632:	66 65 72 73          	data16 gs jb ffff8000001116a9 <_rodata+0x789>
ffff800000111636:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011163a:	61                   	(bad)  
ffff80000011163b:	20 67 61             	and    %ah,0x61(%rdi)
ffff80000011163e:	74 65                	je     ffff8000001116a5 <_rodata+0x785>
ffff800000111640:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff800000111644:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000111647:	70 74                	jo     ffff8000001116bd <_rodata+0x79d>
ffff800000111649:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011164a:	72 20                	jb     ffff80000011166c <_rodata+0x74c>
ffff80000011164c:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff800000111653:	49                   	rex.WB
ffff800000111654:	44 54                	rex.R push %rsp
ffff800000111656:	3b 0a                	cmp    (%rdx),%ecx
	...
ffff800000111660:	52                   	push   %rdx
ffff800000111661:	65 66 65 72 73       	gs data16 gs jb ffff8000001116d9 <_rodata+0x7b9>
ffff800000111666:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff80000011166a:	61                   	(bad)  
ffff80000011166b:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff80000011166f:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff800000111672:	70 74                	jo     ffff8000001116e8 <_rodata+0x7c8>
ffff800000111674:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111675:	72 20                	jb     ffff800000111697 <_rodata+0x777>
ffff800000111677:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff80000011167e:	47                   	rex.RXB
ffff80000011167f:	44 54                	rex.R push %rsp
ffff800000111681:	20 6f 72             	and    %ch,0x72(%rdi)
ffff800000111684:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
ffff800000111688:	20 63 75             	and    %ah,0x75(%rbx)
ffff80000011168b:	72 72                	jb     ffff8000001116ff <_rodata+0x7df>
ffff80000011168d:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff80000011168f:	74 20                	je     ffff8000001116b1 <_rodata+0x791>
ffff800000111691:	4c                   	rex.WR
ffff800000111692:	44 54                	rex.R push %rsp
ffff800000111694:	3b 0a                	cmp    (%rdx),%ecx
ffff800000111696:	00 00                	add    %al,(%rax)
ffff800000111698:	52                   	push   %rdx
ffff800000111699:	65 66 65 72 73       	gs data16 gs jb ffff800000111711 <_rodata+0x7f1>
ffff80000011169e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001116a2:	61                   	(bad)  
ffff8000001116a3:	20 73 65             	and    %dh,0x65(%rbx)
ffff8000001116a6:	67 6d                	insl   (%dx),%es:(%edi)
ffff8000001116a8:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff8000001116aa:	74 20                	je     ffff8000001116cc <_rodata+0x7ac>
ffff8000001116ac:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001116ad:	72 20                	jb     ffff8000001116cf <_rodata+0x7af>
ffff8000001116af:	67 61                	addr32 (bad) 
ffff8000001116b1:	74 65                	je     ffff800000111718 <_rodata+0x7f8>
ffff8000001116b3:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001116b7:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001116ba:	70 74                	jo     ffff800000111730 <_rodata+0x810>
ffff8000001116bc:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001116bd:	72 20                	jb     ffff8000001116df <_rodata+0x7bf>
ffff8000001116bf:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001116c6:	4c                   	rex.WR
ffff8000001116c7:	44 54                	rex.R push %rsp
ffff8000001116c9:	3b 0a                	cmp    (%rdx),%ecx
ffff8000001116cb:	00 00                	add    %al,(%rax)
ffff8000001116cd:	00 00                	add    %al,(%rax)
ffff8000001116cf:	00 52 65             	add    %dl,0x65(%rdx)
ffff8000001116d2:	66 65 72 73          	data16 gs jb ffff800000111749 <_rodata+0x829>
ffff8000001116d6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
ffff8000001116da:	61                   	(bad)  
ffff8000001116db:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
ffff8000001116df:	63 72 69             	movsxd 0x69(%rdx),%esi
ffff8000001116e2:	70 74                	jo     ffff800000111758 <_rodata+0x838>
ffff8000001116e4:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001116e5:	72 20                	jb     ffff800000111707 <_rodata+0x7e7>
ffff8000001116e7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
ffff8000001116ee:	63 75 72             	movsxd 0x72(%rbp),%esi
ffff8000001116f1:	72 65                	jb     ffff800000111758 <_rodata+0x838>
ffff8000001116f3:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001116f4:	74 20                	je     ffff800000111716 <_rodata+0x7f6>
ffff8000001116f6:	47                   	rex.RXB
ffff8000001116f7:	44 54                	rex.R push %rsp
ffff8000001116f9:	3b 0a                	cmp    (%rdx),%ecx
ffff8000001116fb:	00 00                	add    %al,(%rax)
ffff8000001116fd:	00 00                	add    %al,(%rax)
ffff8000001116ff:	00 53 65             	add    %dl,0x65(%rbx)
ffff800000111702:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111704:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111706:	74 20                	je     ffff800000111728 <_rodata+0x808>
ffff800000111708:	53                   	push   %rbx
ffff800000111709:	65 6c                	gs insb (%dx),%es:(%rdi)
ffff80000011170b:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
ffff800000111710:	20 49 6e             	and    %cl,0x6e(%rcx)
ffff800000111713:	64 65 78 3a          	fs gs js ffff800000111751 <_rodata+0x831>
ffff800000111717:	25 23 30 31 30       	and    $0x30313023,%eax
ffff80000011171c:	78 0a                	js     ffff800000111728 <_rodata+0x808>
ffff80000011171e:	00 00                	add    %al,(%rax)
ffff800000111720:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111722:	5f                   	pop    %rdi
ffff800000111723:	73 65                	jae    ffff80000011178a <_rodata+0x86a>
ffff800000111725:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111727:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111729:	74 5f                	je     ffff80000011178a <_rodata+0x86a>
ffff80000011172b:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff80000011172c:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff80000011172d:	74 5f                	je     ffff80000011178e <_rodata+0x86e>
ffff80000011172f:	70 72                	jo     ffff8000001117a3 <_rodata+0x883>
ffff800000111731:	65 73 65             	gs jae ffff800000111799 <_rodata+0x879>
ffff800000111734:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111735:	74 28                	je     ffff80000011175f <_rodata+0x83f>
ffff800000111737:	31 31                	xor    %esi,(%rcx)
ffff800000111739:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111740:	5f                   	pop    %rdi
ffff800000111741:	43                   	rex.XB
ffff800000111742:	4f                   	rex.WRXB
ffff800000111743:	44                   	rex.R
ffff800000111744:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842476e <_ebss+0x382f623e>
ffff80000011174b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011174c:	78 2c                	js     ffff80000011177a <_rodata+0x85a>
ffff80000011174e:	52                   	push   %rdx
ffff80000011174f:	53                   	push   %rbx
ffff800000111750:	50                   	push   %rax
ffff800000111751:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842477a <_ebss+0x382f624a>
ffff800000111757:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111758:	78 2c                	js     ffff800000111786 <_rodata+0x866>
ffff80000011175a:	52                   	push   %rdx
ffff80000011175b:	49 50                	rex.WB push %r8
ffff80000011175d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424786 <_ebss+0x382f6256>
ffff800000111763:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111764:	78 0a                	js     ffff800000111770 <_rodata+0x850>
ffff800000111766:	00 00                	add    %al,(%rax)
ffff800000111768:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011176a:	5f                   	pop    %rdi
ffff80000011176b:	73 74                	jae    ffff8000001117e1 <_rodata+0x8c1>
ffff80000011176d:	61                   	(bad)  
ffff80000011176e:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
ffff800000111771:	73 65                	jae    ffff8000001117d8 <_rodata+0x8b8>
ffff800000111773:	67 6d                	insl   (%dx),%es:(%edi)
ffff800000111775:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111777:	74 5f                	je     ffff8000001117d8 <_rodata+0x8b8>
ffff800000111779:	66 61                	data16 (bad) 
ffff80000011177b:	75 6c                	jne    ffff8000001117e9 <_rodata+0x8c9>
ffff80000011177d:	74 28                	je     ffff8000001117a7 <_rodata+0x887>
ffff80000011177f:	31 32                	xor    %esi,(%rdx)
ffff800000111781:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111788:	5f                   	pop    %rdi
ffff800000111789:	43                   	rex.XB
ffff80000011178a:	4f                   	rex.WRXB
ffff80000011178b:	44                   	rex.R
ffff80000011178c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384247b6 <_ebss+0x382f6286>
ffff800000111793:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111794:	78 2c                	js     ffff8000001117c2 <_rodata+0x8a2>
ffff800000111796:	52                   	push   %rdx
ffff800000111797:	53                   	push   %rbx
ffff800000111798:	50                   	push   %rax
ffff800000111799:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384247c2 <_ebss+0x382f6292>
ffff80000011179f:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117a0:	78 2c                	js     ffff8000001117ce <_rodata+0x8ae>
ffff8000001117a2:	52                   	push   %rdx
ffff8000001117a3:	49 50                	rex.WB push %r8
ffff8000001117a5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384247ce <_ebss+0x382f629e>
ffff8000001117ab:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117ac:	78 0a                	js     ffff8000001117b8 <_rodata+0x898>
ffff8000001117ae:	00 00                	add    %al,(%rax)
ffff8000001117b0:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001117b2:	5f                   	pop    %rdi
ffff8000001117b3:	67 65 6e             	outsb  %gs:(%esi),(%dx)
ffff8000001117b6:	65 72 61             	gs jb  ffff80000011181a <_rodata+0x8fa>
ffff8000001117b9:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117ba:	5f                   	pop    %rdi
ffff8000001117bb:	70 72                	jo     ffff80000011182f <_rodata+0x90f>
ffff8000001117bd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001117be:	74 65                	je     ffff800000111825 <_rodata+0x905>
ffff8000001117c0:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff8000001117c4:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001117c5:	28 31                	sub    %dh,(%rcx)
ffff8000001117c7:	33 29                	xor    (%rcx),%ebp
ffff8000001117c9:	2c 45                	sub    $0x45,%al
ffff8000001117cb:	52                   	push   %rdx
ffff8000001117cc:	52                   	push   %rdx
ffff8000001117cd:	4f 52                	rex.WRXB push %r10
ffff8000001117cf:	5f                   	pop    %rdi
ffff8000001117d0:	43                   	rex.XB
ffff8000001117d1:	4f                   	rex.WRXB
ffff8000001117d2:	44                   	rex.R
ffff8000001117d3:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384247fd <_ebss+0x382f62cd>
ffff8000001117da:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117db:	78 2c                	js     ffff800000111809 <_rodata+0x8e9>
ffff8000001117dd:	52                   	push   %rdx
ffff8000001117de:	53                   	push   %rbx
ffff8000001117df:	50                   	push   %rax
ffff8000001117e0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424809 <_ebss+0x382f62d9>
ffff8000001117e6:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117e7:	78 2c                	js     ffff800000111815 <_rodata+0x8f5>
ffff8000001117e9:	52                   	push   %rdx
ffff8000001117ea:	49 50                	rex.WB push %r8
ffff8000001117ec:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424815 <_ebss+0x382f62e5>
ffff8000001117f2:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001117f3:	78 0a                	js     ffff8000001117ff <_rodata+0x8df>
ffff8000001117f5:	00 00                	add    %al,(%rax)
ffff8000001117f7:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001117fb:	70 61                	jo     ffff80000011185e <_rodata+0x93e>
ffff8000001117fd:	67 65 5f             	addr32 gs pop %rdi
ffff800000111800:	66 61                	data16 (bad) 
ffff800000111802:	75 6c                	jne    ffff800000111870 <_rodata+0x950>
ffff800000111804:	74 28                	je     ffff80000011182e <_rodata+0x90e>
ffff800000111806:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
ffff800000111809:	2c 45                	sub    $0x45,%al
ffff80000011180b:	52                   	push   %rdx
ffff80000011180c:	52                   	push   %rdx
ffff80000011180d:	4f 52                	rex.WRXB push %r10
ffff80000011180f:	5f                   	pop    %rdi
ffff800000111810:	43                   	rex.XB
ffff800000111811:	4f                   	rex.WRXB
ffff800000111812:	44                   	rex.R
ffff800000111813:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff80003842483d <_ebss+0x382f630d>
ffff80000011181a:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011181b:	78 2c                	js     ffff800000111849 <_rodata+0x929>
ffff80000011181d:	52                   	push   %rdx
ffff80000011181e:	53                   	push   %rbx
ffff80000011181f:	50                   	push   %rax
ffff800000111820:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424849 <_ebss+0x382f6319>
ffff800000111826:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111827:	78 2c                	js     ffff800000111855 <_rodata+0x935>
ffff800000111829:	52                   	push   %rdx
ffff80000011182a:	49 50                	rex.WB push %r8
ffff80000011182c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424855 <_ebss+0x382f6325>
ffff800000111832:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111833:	78 0a                	js     ffff80000011183f <_rodata+0x91f>
ffff800000111835:	00 50 61             	add    %dl,0x61(%rax)
ffff800000111838:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
ffff80000011183d:	74 2d                	je     ffff80000011186c <_rodata+0x94c>
ffff80000011183f:	50                   	push   %rax
ffff800000111840:	72 65                	jb     ffff8000001118a7 <_rodata+0x987>
ffff800000111842:	73 65                	jae    ffff8000001118a9 <_rodata+0x989>
ffff800000111844:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111845:	74 2c                	je     ffff800000111873 <_rodata+0x953>
ffff800000111847:	09 00                	or     %eax,(%rax)
ffff800000111849:	57                   	push   %rdi
ffff80000011184a:	72 69                	jb     ffff8000001118b5 <_rodata+0x995>
ffff80000011184c:	74 65                	je     ffff8000001118b3 <_rodata+0x993>
ffff80000011184e:	20 43 61             	and    %al,0x61(%rbx)
ffff800000111851:	75 73                	jne    ffff8000001118c6 <_rodata+0x9a6>
ffff800000111853:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff800000111857:	75 6c                	jne    ffff8000001118c5 <_rodata+0x9a5>
ffff800000111859:	74 2c                	je     ffff800000111887 <_rodata+0x967>
ffff80000011185b:	09 00                	or     %eax,(%rax)
ffff80000011185d:	52                   	push   %rdx
ffff80000011185e:	65 61                	gs (bad) 
ffff800000111860:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
ffff800000111864:	75 73                	jne    ffff8000001118d9 <_rodata+0x9b9>
ffff800000111866:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff80000011186a:	75 6c                	jne    ffff8000001118d8 <_rodata+0x9b8>
ffff80000011186c:	74 2c                	je     ffff80000011189a <_rodata+0x97a>
ffff80000011186e:	09 00                	or     %eax,(%rax)
ffff800000111870:	46 61                	rex.RX (bad) 
ffff800000111872:	75 6c                	jne    ffff8000001118e0 <_rodata+0x9c0>
ffff800000111874:	74 20                	je     ffff800000111896 <_rodata+0x976>
ffff800000111876:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
ffff80000011187d:	28 33                	sub    %dh,(%rbx)
ffff80000011187f:	29 09                	sub    %ecx,(%rcx)
ffff800000111881:	00 46 61             	add    %al,0x61(%rsi)
ffff800000111884:	75 6c                	jne    ffff8000001118f2 <_rodata+0x9d2>
ffff800000111886:	74 20                	je     ffff8000001118a8 <_rodata+0x988>
ffff800000111888:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
ffff80000011188f:	72 76                	jb     ffff800000111907 <_rodata+0x9e7>
ffff800000111891:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
ffff800000111898:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
ffff80000011189b:	29 09                	sub    %ecx,(%rcx)
ffff80000011189d:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
ffff8000001118a0:	65 73 65             	gs jae ffff800000111908 <_rodata+0x9e8>
ffff8000001118a3:	72 76                	jb     ffff80000011191b <_rodata+0x9fb>
ffff8000001118a5:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
ffff8000001118aa:	74 20                	je     ffff8000001118cc <_rodata+0x9ac>
ffff8000001118ac:	43 61                	rex.XB (bad) 
ffff8000001118ae:	75 73                	jne    ffff800000111923 <_rodata+0xa03>
ffff8000001118b0:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
ffff8000001118b4:	75 6c                	jne    ffff800000111922 <_rodata+0xa02>
ffff8000001118b6:	74 09                	je     ffff8000001118c1 <_rodata+0x9a1>
	...
ffff8000001118c0:	2c 49                	sub    $0x49,%al
ffff8000001118c2:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001118c3:	73 74                	jae    ffff800000111939 <_rodata+0xa19>
ffff8000001118c5:	72 75                	jb     ffff80000011193c <_rodata+0xa1c>
ffff8000001118c7:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
ffff8000001118cb:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff8000001118cc:	20 66 65             	and    %ah,0x65(%rsi)
ffff8000001118cf:	74 63                	je     ffff800000111934 <_rodata+0xa14>
ffff8000001118d1:	68 20 43 61 75       	pushq  $0x75614320
ffff8000001118d6:	73 65                	jae    ffff80000011193d <_rodata+0xa1d>
ffff8000001118d8:	20 46 61             	and    %al,0x61(%rsi)
ffff8000001118db:	75 6c                	jne    ffff800000111949 <_rodata+0xa29>
ffff8000001118dd:	74 00                	je     ffff8000001118df <_rodata+0x9bf>
ffff8000001118df:	0a 00                	or     (%rax),%al
ffff8000001118e1:	43 52                	rex.XB push %r10
ffff8000001118e3:	32 3a                	xor    (%rdx),%bh
ffff8000001118e5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff8000001118ea:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001118eb:	78 0a                	js     ffff8000001118f7 <_rodata+0x9d7>
ffff8000001118ed:	00 00                	add    %al,(%rax)
ffff8000001118ef:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff8000001118f3:	78 38                	js     ffff80000011192d <_rodata+0xa0d>
ffff8000001118f5:	37                   	(bad)  
ffff8000001118f6:	5f                   	pop    %rdi
ffff8000001118f7:	46 50                	rex.RX push %rax
ffff8000001118f9:	55                   	push   %rbp
ffff8000001118fa:	5f                   	pop    %rdi
ffff8000001118fb:	65 72 72             	gs jb  ffff800000111970 <_rodata+0xa50>
ffff8000001118fe:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff8000001118ff:	72 28                	jb     ffff800000111929 <_rodata+0xa09>
ffff800000111901:	31 36                	xor    %esi,(%rsi)
ffff800000111903:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011190a:	5f                   	pop    %rdi
ffff80000011190b:	43                   	rex.XB
ffff80000011190c:	4f                   	rex.WRXB
ffff80000011190d:	44                   	rex.R
ffff80000011190e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424938 <_ebss+0x382f6408>
ffff800000111915:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111916:	78 2c                	js     ffff800000111944 <_rodata+0xa24>
ffff800000111918:	52                   	push   %rdx
ffff800000111919:	53                   	push   %rbx
ffff80000011191a:	50                   	push   %rax
ffff80000011191b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424944 <_ebss+0x382f6414>
ffff800000111921:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111922:	78 2c                	js     ffff800000111950 <_rodata+0xa30>
ffff800000111924:	52                   	push   %rdx
ffff800000111925:	49 50                	rex.WB push %r8
ffff800000111927:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424950 <_ebss+0x382f6420>
ffff80000011192d:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011192e:	78 0a                	js     ffff80000011193a <_rodata+0xa1a>
	...
ffff800000111938:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff80000011193a:	5f                   	pop    %rdi
ffff80000011193b:	61                   	(bad)  
ffff80000011193c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011193d:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
ffff800000111944:	5f                   	pop    %rdi
ffff800000111945:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff800000111948:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff80000011194b:	31 37                	xor    %esi,(%rdi)
ffff80000011194d:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff800000111954:	5f                   	pop    %rdi
ffff800000111955:	43                   	rex.XB
ffff800000111956:	4f                   	rex.WRXB
ffff800000111957:	44                   	rex.R
ffff800000111958:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424982 <_ebss+0x382f6452>
ffff80000011195f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111960:	78 2c                	js     ffff80000011198e <_rodata+0xa6e>
ffff800000111962:	52                   	push   %rdx
ffff800000111963:	53                   	push   %rbx
ffff800000111964:	50                   	push   %rax
ffff800000111965:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842498e <_ebss+0x382f645e>
ffff80000011196b:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011196c:	78 2c                	js     ffff80000011199a <_rodata+0xa7a>
ffff80000011196e:	52                   	push   %rdx
ffff80000011196f:	49 50                	rex.WB push %r8
ffff800000111971:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff80003842499a <_ebss+0x382f646a>
ffff800000111977:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111978:	78 0a                	js     ffff800000111984 <_rodata+0xa64>
ffff80000011197a:	00 00                	add    %al,(%rax)
ffff80000011197c:	00 00                	add    %al,(%rax)
ffff80000011197e:	00 00                	add    %al,(%rax)
ffff800000111980:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111982:	5f                   	pop    %rdi
ffff800000111983:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111984:	61                   	(bad)  
ffff800000111985:	63 68 69             	movsxd 0x69(%rax),%ebp
ffff800000111988:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111989:	65 5f                	gs pop %rdi
ffff80000011198b:	63 68 65             	movsxd 0x65(%rax),%ebp
ffff80000011198e:	63 6b 28             	movsxd 0x28(%rbx),%ebp
ffff800000111991:	31 38                	xor    %edi,(%rax)
ffff800000111993:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
ffff80000011199a:	5f                   	pop    %rdi
ffff80000011199b:	43                   	rex.XB
ffff80000011199c:	4f                   	rex.WRXB
ffff80000011199d:	44                   	rex.R
ffff80000011199e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff8000384249c8 <_ebss+0x382f6498>
ffff8000001119a5:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119a6:	78 2c                	js     ffff8000001119d4 <_rodata+0xab4>
ffff8000001119a8:	52                   	push   %rdx
ffff8000001119a9:	53                   	push   %rbx
ffff8000001119aa:	50                   	push   %rax
ffff8000001119ab:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384249d4 <_ebss+0x382f64a4>
ffff8000001119b1:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119b2:	78 2c                	js     ffff8000001119e0 <_rodata+0xac0>
ffff8000001119b4:	52                   	push   %rdx
ffff8000001119b5:	49 50                	rex.WB push %r8
ffff8000001119b7:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff8000384249e0 <_ebss+0x382f64b0>
ffff8000001119bd:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119be:	78 0a                	js     ffff8000001119ca <_rodata+0xaaa>
	...
ffff8000001119c8:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff8000001119ca:	5f                   	pop    %rdi
ffff8000001119cb:	53                   	push   %rbx
ffff8000001119cc:	49                   	rex.WB
ffff8000001119cd:	4d                   	rex.WRB
ffff8000001119ce:	44 5f                	rex.R pop %rdi
ffff8000001119d0:	65 78 63             	gs js  ffff800000111a36 <_rodata+0xb16>
ffff8000001119d3:	65 70 74             	gs jo  ffff800000111a4a <_rodata+0xb2a>
ffff8000001119d6:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
ffff8000001119dd:	2c 45                	sub    $0x45,%al
ffff8000001119df:	52                   	push   %rdx
ffff8000001119e0:	52                   	push   %rdx
ffff8000001119e1:	4f 52                	rex.WRXB push %r10
ffff8000001119e3:	5f                   	pop    %rdi
ffff8000001119e4:	43                   	rex.XB
ffff8000001119e5:	4f                   	rex.WRXB
ffff8000001119e6:	44                   	rex.R
ffff8000001119e7:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424a11 <_ebss+0x382f64e1>
ffff8000001119ee:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119ef:	78 2c                	js     ffff800000111a1d <_rodata+0xafd>
ffff8000001119f1:	52                   	push   %rdx
ffff8000001119f2:	53                   	push   %rbx
ffff8000001119f3:	50                   	push   %rax
ffff8000001119f4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424a1d <_ebss+0x382f64ed>
ffff8000001119fa:	6c                   	insb   (%dx),%es:(%rdi)
ffff8000001119fb:	78 2c                	js     ffff800000111a29 <_rodata+0xb09>
ffff8000001119fd:	52                   	push   %rdx
ffff8000001119fe:	49 50                	rex.WB push %r8
ffff800000111a00:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424a29 <_ebss+0x382f64f9>
ffff800000111a06:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111a07:	78 0a                	js     ffff800000111a13 <_rodata+0xaf3>
ffff800000111a09:	00 00                	add    %al,(%rax)
ffff800000111a0b:	00 00                	add    %al,(%rax)
ffff800000111a0d:	00 00                	add    %al,(%rax)
ffff800000111a0f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
ffff800000111a13:	76 69                	jbe    ffff800000111a7e <_rodata+0xb5e>
ffff800000111a15:	72 74                	jb     ffff800000111a8b <_rodata+0xb6b>
ffff800000111a17:	75 61                	jne    ffff800000111a7a <_rodata+0xb5a>
ffff800000111a19:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111a1a:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
ffff800000111a21:	5f                   	pop    %rdi
ffff800000111a22:	65 78 63             	gs js  ffff800000111a88 <_rodata+0xb68>
ffff800000111a25:	65 70 74             	gs jo  ffff800000111a9c <_rodata+0xb7c>
ffff800000111a28:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
ffff800000111a2f:	2c 45                	sub    $0x45,%al
ffff800000111a31:	52                   	push   %rdx
ffff800000111a32:	52                   	push   %rdx
ffff800000111a33:	4f 52                	rex.WRXB push %r10
ffff800000111a35:	5f                   	pop    %rdi
ffff800000111a36:	43                   	rex.XB
ffff800000111a37:	4f                   	rex.WRXB
ffff800000111a38:	44                   	rex.R
ffff800000111a39:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # ffff800038424a63 <_ebss+0x382f6533>
ffff800000111a40:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111a41:	78 2c                	js     ffff800000111a6f <_rodata+0xb4f>
ffff800000111a43:	52                   	push   %rdx
ffff800000111a44:	53                   	push   %rbx
ffff800000111a45:	50                   	push   %rax
ffff800000111a46:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424a6f <_ebss+0x382f653f>
ffff800000111a4c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111a4d:	78 2c                	js     ffff800000111a7b <_rodata+0xb5b>
ffff800000111a4f:	52                   	push   %rdx
ffff800000111a50:	49 50                	rex.WB push %r8
ffff800000111a52:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424a7b <_ebss+0x382f654b>
ffff800000111a58:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111a59:	78 0a                	js     ffff800000111a65 <_rodata+0xb45>
ffff800000111a5b:	00 00                	add    %al,(%rax)
ffff800000111a5d:	00 00                	add    %al,(%rax)
ffff800000111a5f:	00 44 69 73          	add    %al,0x73(%rcx,%rbp,2)
ffff800000111a63:	70 6c                	jo     ffff800000111ad1 <_rodata+0xbb1>
ffff800000111a65:	61                   	(bad)  
ffff800000111a66:	79 20                	jns    ffff800000111a88 <_rodata+0xb68>
ffff800000111a68:	50                   	push   %rax
ffff800000111a69:	68 79 73 69 63       	pushq  $0x63697379
ffff800000111a6e:	73 20                	jae    ffff800000111a90 <_rodata+0xb70>
ffff800000111a70:	41                   	rex.B
ffff800000111a71:	64 64 72 65          	fs fs jb ffff800000111ada <_rodata+0xbba>
ffff800000111a75:	73 73                	jae    ffff800000111aea <_rodata+0xbca>
ffff800000111a77:	20 4d 41             	and    %cl,0x41(%rbp)
ffff800000111a7a:	50                   	push   %rax
ffff800000111a7b:	2c 54                	sub    $0x54,%al
ffff800000111a7d:	79 70                	jns    ffff800000111aef <_rodata+0xbcf>
ffff800000111a7f:	65 28 31             	sub    %dh,%gs:(%rcx)
ffff800000111a82:	3a 52 41             	cmp    0x41(%rdx),%dl
ffff800000111a85:	4d 2c 32             	rex.WRB sub $0x32,%al
ffff800000111a88:	3a 52 4f             	cmp    0x4f(%rdx),%dl
ffff800000111a8b:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
ffff800000111a8f:	20 52 65             	and    %dl,0x65(%rdx)
ffff800000111a92:	73 65                	jae    ffff800000111af9 <_rodata+0xbd9>
ffff800000111a94:	72 76                	jb     ffff800000111b0c <_rodata+0xbec>
ffff800000111a96:	65 64 2c 33          	gs fs sub $0x33,%al
ffff800000111a9a:	3a 41 43             	cmp    0x43(%rcx),%al
ffff800000111a9d:	50                   	push   %rax
ffff800000111a9e:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
ffff800000111aa2:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
ffff800000111aa6:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111aa7:	20 4d 65             	and    %cl,0x65(%rbp)
ffff800000111aaa:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111aab:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111aac:	72 79                	jb     ffff800000111b27 <_rodata+0xc07>
ffff800000111aae:	2c 34                	sub    $0x34,%al
ffff800000111ab0:	3a 41 43             	cmp    0x43(%rcx),%al
ffff800000111ab3:	50                   	push   %rax
ffff800000111ab4:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
ffff800000111ab8:	53                   	push   %rbx
ffff800000111ab9:	20 4d 65             	and    %cl,0x65(%rbp)
ffff800000111abc:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000111abd:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111abe:	72 79                	jb     ffff800000111b39 <_rodata+0xc19>
ffff800000111ac0:	2c 4f                	sub    $0x4f,%al
ffff800000111ac2:	74 68                	je     ffff800000111b2c <_rodata+0xc0c>
ffff800000111ac4:	65 72 73             	gs jb  ffff800000111b3a <_rodata+0xc1a>
ffff800000111ac7:	3a 55 6e             	cmp    0x6e(%rbp),%dl
ffff800000111aca:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
ffff800000111ad1:	0a 
ffff800000111ad2:	00 00                	add    %al,(%rax)
ffff800000111ad4:	00 00                	add    %al,(%rax)
ffff800000111ad6:	00 00                	add    %al,(%rax)
ffff800000111ad8:	41                   	rex.B
ffff800000111ad9:	64 64 72 65          	fs fs jb ffff800000111b42 <_rodata+0xc22>
ffff800000111add:	73 73                	jae    ffff800000111b52 <_rodata+0xc32>
ffff800000111adf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424b08 <_ebss+0x382f65d8>
ffff800000111ae5:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111ae6:	78 09                	js     ffff800000111af1 <_rodata+0xbd1>
ffff800000111ae8:	4c                   	rex.WR
ffff800000111ae9:	65 6e                	outsb  %gs:(%rsi),(%dx)
ffff800000111aeb:	67 74 68             	addr32 je ffff800000111b56 <_rodata+0xc36>
ffff800000111aee:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424b17 <_ebss+0x382f65e7>
ffff800000111af4:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111af5:	78 09                	js     ffff800000111b00 <_rodata+0xbe0>
ffff800000111af7:	54                   	push   %rsp
ffff800000111af8:	79 70                	jns    ffff800000111b6a <_rodata+0xc4a>
ffff800000111afa:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # ffff800030424b24 <_ebss+0x302f65f4>
ffff800000111b01:	78 0a                	js     ffff800000111b0d <_rodata+0xbed>
ffff800000111b03:	00 42 65             	add    %al,0x65(%rdx)
ffff800000111b06:	66 6f                	outsw  %ds:(%rsi),(%dx)
ffff800000111b08:	72 65                	jb     ffff800000111b6f <_rodata+0xc4f>
ffff800000111b0a:	20 54 6f 74          	and    %dl,0x74(%rdi,%rbp,2)
ffff800000111b0e:	61                   	(bad)  
ffff800000111b0f:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b10:	20 52 41             	and    %dl,0x41(%rdx)
ffff800000111b13:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff800038424b3d <_ebss+0x382f660d>
ffff800000111b1a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b1b:	78 0a                	js     ffff800000111b27 <_rodata+0xc07>
ffff800000111b1d:	00 4c 65 6e          	add    %cl,0x6e(%rbp,%riz,2)
ffff800000111b21:	67 74 68             	addr32 je ffff800000111b8c <_rodata+0xc6c>
ffff800000111b24:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424b4d <_ebss+0x382f661d>
ffff800000111b2a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b2b:	78 0a                	js     ffff800000111b37 <_rodata+0xc17>
ffff800000111b2d:	00 41 66             	add    %al,0x66(%rcx)
ffff800000111b30:	74 65                	je     ffff800000111b97 <_rodata+0xc77>
ffff800000111b32:	72 20                	jb     ffff800000111b54 <_rodata+0xc34>
ffff800000111b34:	54                   	push   %rsp
ffff800000111b35:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111b36:	74 61                	je     ffff800000111b99 <_rodata+0xc79>
ffff800000111b38:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b39:	20 52 41             	and    %dl,0x41(%rdx)
ffff800000111b3c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff800038424b66 <_ebss+0x382f6636>
ffff800000111b43:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b44:	78 0a                	js     ffff800000111b50 <_rodata+0xc30>
ffff800000111b46:	00 00                	add    %al,(%rax)
ffff800000111b48:	4f 53                	rex.WRXB push %r11
ffff800000111b4a:	20 43 61             	and    %al,0x61(%rbx)
ffff800000111b4d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111b4e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000111b51:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000111b57:	61                   	(bad)  
ffff800000111b58:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b59:	20 52 41             	and    %dl,0x41(%rdx)
ffff800000111b5c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # ffff800038424b86 <_ebss+0x382f6656>
ffff800000111b63:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b64:	78 0a                	js     ffff800000111b70 <_rodata+0xc50>
ffff800000111b66:	00 00                	add    %al,(%rax)
ffff800000111b68:	4f 53                	rex.WRXB push %r11
ffff800000111b6a:	20 43 61             	and    %al,0x61(%rbx)
ffff800000111b6d:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111b6e:	20 55 73             	and    %dl,0x73(%rbp)
ffff800000111b71:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
ffff800000111b77:	61                   	(bad)  
ffff800000111b78:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b79:	20 32                	and    %dh,(%rdx)
ffff800000111b7b:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
ffff800000111b7f:	47                   	rex.RXB
ffff800000111b80:	45 73 3a             	rex.RB jae ffff800000111bbd <_rodata+0xc9d>
ffff800000111b83:	25 23 30 31 30       	and    $0x30313023,%eax
ffff800000111b88:	78 3d                	js     ffff800000111bc7 <_rodata+0xca7>
ffff800000111b8a:	25 30 31 30 64       	and    $0x64303130,%eax
ffff800000111b8f:	0a 00                	or     (%rax),%al
ffff800000111b91:	00 00                	add    %al,(%rax)
ffff800000111b93:	00 00                	add    %al,(%rax)
ffff800000111b95:	00 00                	add    %al,(%rax)
ffff800000111b97:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff800000111b9a:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111b9b:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111b9c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff800000111b9f:	61                   	(bad)  
ffff800000111ba0:	67 65 73 20          	addr32 gs jae ffff800000111bc4 <_rodata+0xca4>
ffff800000111ba4:	65 72 72             	gs jb  ffff800000111c19 <_rodata+0xcf9>
ffff800000111ba7:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111ba8:	72 20                	jb     ffff800000111bca <_rodata+0xcaa>
ffff800000111baa:	7a 6f                	jp     ffff800000111c1b <_rodata+0xcfb>
ffff800000111bac:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111bad:	65 5f                	gs pop %rdi
ffff800000111baf:	73 65                	jae    ffff800000111c16 <_rodata+0xcf6>
ffff800000111bb1:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111bb2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
ffff800000111bb7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111bb8:	64 65 78 0a          	fs gs js ffff800000111bc6 <_rodata+0xca6>
ffff800000111bbc:	00 00                	add    %al,(%rax)
ffff800000111bbe:	00 00                	add    %al,(%rax)
ffff800000111bc0:	38 32                	cmp    %dh,(%rdx)
ffff800000111bc2:	35 39 41 20 69       	xor    $0x69204139,%eax
ffff800000111bc7:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111bc8:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
ffff800000111bcf:	5f 
ffff800000111bd0:	49 52                	rex.WB push %r10
ffff800000111bd2:	51                   	push   %rcx
ffff800000111bd3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424bfc <_ebss+0x382f66cc>
ffff800000111bd9:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111bda:	78 09                	js     ffff800000111be5 <_rodata+0xcc5>
ffff800000111bdc:	00 6b 65             	add    %ch,0x65(%rbx)
ffff800000111bdf:	79 20                	jns    ffff800000111c01 <_rodata+0xce1>
ffff800000111be1:	63 6f 64             	movsxd 0x64(%rdi),%ebp
ffff800000111be4:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # ffff800038424c0e <_ebss+0x382f66de>
ffff800000111beb:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111bec:	78 09                	js     ffff800000111bf7 <_rodata+0xcd7>
ffff800000111bee:	00 00                	add    %al,(%rax)
ffff800000111bf0:	72 65                	jb     ffff800000111c57 <_rodata+0xd37>
ffff800000111bf2:	67 73 3a             	addr32 jae ffff800000111c2f <_rodata+0xd0f>
ffff800000111bf5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000111bfa:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111bfb:	78 09                	js     ffff800000111c06 <_rodata+0xce6>
ffff800000111bfd:	3c 52                	cmp    $0x52,%al
ffff800000111bff:	49 50                	rex.WB push %r8
ffff800000111c01:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424c2a <_ebss+0x382f66fa>
ffff800000111c07:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c08:	78 09                	js     ffff800000111c13 <_rodata+0xcf3>
ffff800000111c0a:	52                   	push   %rdx
ffff800000111c0b:	53                   	push   %rbx
ffff800000111c0c:	50                   	push   %rax
ffff800000111c0d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424c36 <_ebss+0x382f6706>
ffff800000111c13:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c14:	78 3e                	js     ffff800000111c54 <_rodata+0xd34>
ffff800000111c16:	0a 00                	or     (%rax),%al
ffff800000111c18:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111c19:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111c1a:	5f                   	pop    %rdi
ffff800000111c1b:	73 79                	jae    ffff800000111c96 <_rodata+0xd76>
ffff800000111c1d:	73 74                	jae    ffff800000111c93 <_rodata+0xd73>
ffff800000111c1f:	65 6d                	gs insl (%dx),%es:(%rdi)
ffff800000111c21:	5f                   	pop    %rdi
ffff800000111c22:	63 61 6c             	movsxd 0x6c(%rcx),%esp
ffff800000111c25:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c26:	20 69 73             	and    %ch,0x73(%rcx)
ffff800000111c29:	20 63 61             	and    %ah,0x61(%rbx)
ffff800000111c2c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c2d:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c2e:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
ffff800000111c35:	25 23 30 34 78       	and    $0x78343023,%eax
ffff800000111c3a:	0a 00                	or     (%rax),%al
ffff800000111c3c:	64 6f                	outsl  %fs:(%rsi),(%dx)
ffff800000111c3e:	5f                   	pop    %rdi
ffff800000111c3f:	65 78 65             	gs js  ffff800000111ca7 <_rodata+0xd87>
ffff800000111c42:	63 76 65             	movsxd 0x65(%rsi),%esi
ffff800000111c45:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
ffff800000111c49:	6b 20 69             	imul   $0x69,(%rax),%esp
ffff800000111c4c:	73 20                	jae    ffff800000111c6e <_rodata+0xd4e>
ffff800000111c4e:	72 75                	jb     ffff800000111cc5 <_rodata+0xda5>
ffff800000111c50:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111c51:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111c52:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
ffff800000111c59:	6e                   	outsb  %ds:(%rsi),(%dx)
ffff800000111c5a:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000111c61:	20 
ffff800000111c62:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000111c69:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000111c70:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424c99 <_ebss+0x382f6769>
ffff800000111c76:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c77:	78 0a                	js     ffff800000111c83 <_rodata+0xd63>
ffff800000111c79:	00 61 6c             	add    %ah,0x6c(%rcx)
ffff800000111c7c:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111c7d:	6f                   	outsl  %ds:(%rsi),(%dx)
ffff800000111c7e:	63 5f 70             	movsxd 0x70(%rdi),%ebx
ffff800000111c81:	61                   	(bad)  
ffff800000111c82:	67 65 73 2c          	addr32 gs jae ffff800000111cb2 <_rodata+0xd92>
ffff800000111c86:	62                   	(bad)  
ffff800000111c87:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
ffff800000111c8e:	23 
ffff800000111c8f:	30 31                	xor    %dh,(%rcx)
ffff800000111c91:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
ffff800000111c95:	00 00                	add    %al,(%rax)
ffff800000111c97:	00 73 74             	add    %dh,0x74(%rbx)
ffff800000111c9a:	72 75                	jb     ffff800000111d11 <_rodata+0xdf1>
ffff800000111c9c:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
ffff800000111ca0:	61                   	(bad)  
ffff800000111ca1:	73 6b                	jae    ffff800000111d0e <_rodata+0xdee>
ffff800000111ca3:	5f                   	pop    %rdi
ffff800000111ca4:	73 74                	jae    ffff800000111d1a <_erodata>
ffff800000111ca6:	72 75                	jb     ffff800000111d1d <_erodata+0x3>
ffff800000111ca8:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
ffff800000111cac:	64 64 72 65          	fs fs jb ffff800000111d15 <_rodata+0xdf5>
ffff800000111cb0:	73 73                	jae    ffff800000111d25 <_erodata+0xb>
ffff800000111cb2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424cdb <_ebss+0x382f67ab>
ffff800000111cb8:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111cb9:	78 0a                	js     ffff800000111cc5 <_rodata+0xda5>
ffff800000111cbb:	00 00                	add    %al,(%rax)
ffff800000111cbd:	00 00                	add    %al,(%rax)
ffff800000111cbf:	00 65 78             	add    %ah,0x78(%rbp)
ffff800000111cc2:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
ffff800000111cc9:	20 
ffff800000111cca:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
ffff800000111cd1:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
ffff800000111cd8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # ffff800038424d01 <_ebss+0x382f67d1>
ffff800000111cde:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111cdf:	78 0a                	js     ffff800000111ceb <_rodata+0xdcb>
ffff800000111ce1:	00 70 72             	add    %dh,0x72(%rax)
ffff800000111ce4:	65 76 2d             	gs jbe ffff800000111d14 <_rodata+0xdf4>
ffff800000111ce7:	3e 74 68             	je,pt  ffff800000111d52 <_erodata+0x38>
ffff800000111cea:	72 65                	jb     ffff800000111d51 <_erodata+0x37>
ffff800000111cec:	61                   	(bad)  
ffff800000111ced:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000111cf3:	30 3a                	xor    %bh,(%rdx)
ffff800000111cf5:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000111cfa:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111cfb:	78 0a                	js     ffff800000111d07 <_rodata+0xde7>
ffff800000111cfd:	00 6e 65             	add    %ch,0x65(%rsi)
ffff800000111d00:	78 74                	js     ffff800000111d76 <_erodata+0x5c>
ffff800000111d02:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
ffff800000111d07:	65 61                	gs (bad) 
ffff800000111d09:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
ffff800000111d0f:	30 3a                	xor    %bh,(%rdx)
ffff800000111d11:	25 23 30 31 38       	and    $0x38313023,%eax
ffff800000111d16:	6c                   	insb   (%dx),%es:(%rdi)
ffff800000111d17:	78 0a                	js     ffff800000111d23 <_erodata+0x9>
	...

Disassembly of section .eh_frame:

ffff800000111d20 <.eh_frame>:
ffff800000111d20:	14 00                	adc    $0x0,%al
ffff800000111d22:	00 00                	add    %al,(%rax)
ffff800000111d24:	00 00                	add    %al,(%rax)
ffff800000111d26:	00 00                	add    %al,(%rax)
ffff800000111d28:	01 7a 52             	add    %edi,0x52(%rdx)
ffff800000111d2b:	00 01                	add    %al,(%rcx)
ffff800000111d2d:	78 10                	js     ffff800000111d3f <_erodata+0x25>
ffff800000111d2f:	01 1b                	add    %ebx,(%rbx)
ffff800000111d31:	0c 07                	or     $0x7,%al
ffff800000111d33:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
ffff800000111d39:	00 00                	add    %al,(%rax)
ffff800000111d3b:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111d3e:	00 00                	add    %al,(%rax)
ffff800000111d40:	35 25 ff ff c9       	xor    $0xc9ffff25,%eax
ffff800000111d45:	00 00                	add    %al,(%rax)
ffff800000111d47:	00 00                	add    %al,(%rax)
ffff800000111d49:	41 0e                	rex.B (bad) 
ffff800000111d4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111d51:	02 c4                	add    %ah,%al
ffff800000111d53:	0c 07                	or     $0x7,%al
ffff800000111d55:	08 00                	or     %al,(%rax)
ffff800000111d57:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111d5a:	00 00                	add    %al,(%rax)
ffff800000111d5c:	3c 00                	cmp    $0x0,%al
ffff800000111d5e:	00 00                	add    %al,(%rax)
ffff800000111d60:	de 25 ff ff 49 00    	fisubs 0x49ffff(%rip)        # ffff8000005b1d65 <_ebss+0x483835>
ffff800000111d66:	00 00                	add    %al,(%rax)
ffff800000111d68:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111d6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111d71:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000111d75:	08 00                	or     %al,(%rax)
ffff800000111d77:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111d7a:	00 00                	add    %al,(%rax)
ffff800000111d7c:	5c                   	pop    %rsp
ffff800000111d7d:	00 00                	add    %al,(%rax)
ffff800000111d7f:	00 07                	add    %al,(%rdi)
ffff800000111d81:	26 ff                	es (bad) 
ffff800000111d83:	ff                   	(bad)  
ffff800000111d84:	39 00                	cmp    %eax,(%rax)
ffff800000111d86:	00 00                	add    %al,(%rax)
ffff800000111d88:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111d8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111d91:	74 0c                	je     ffff800000111d9f <_erodata+0x85>
ffff800000111d93:	07                   	(bad)  
ffff800000111d94:	08 00                	or     %al,(%rax)
ffff800000111d96:	00 00                	add    %al,(%rax)
ffff800000111d98:	1c 00                	sbb    $0x0,%al
ffff800000111d9a:	00 00                	add    %al,(%rax)
ffff800000111d9c:	7c 00                	jl     ffff800000111d9e <_erodata+0x84>
ffff800000111d9e:	00 00                	add    %al,(%rax)
ffff800000111da0:	20 26                	and    %ah,(%rsi)
ffff800000111da2:	ff                   	(bad)  
ffff800000111da3:	ff                   	(bad)  
ffff800000111da4:	7c 02                	jl     ffff800000111da8 <_erodata+0x8e>
ffff800000111da6:	00 00                	add    %al,(%rax)
ffff800000111da8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111dab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111db1:	00 00                	add    %al,(%rax)
ffff800000111db3:	00 00                	add    %al,(%rax)
ffff800000111db5:	00 00                	add    %al,(%rax)
ffff800000111db7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111dba:	00 00                	add    %al,(%rax)
ffff800000111dbc:	9c                   	pushfq 
ffff800000111dbd:	00 00                	add    %al,(%rax)
ffff800000111dbf:	00 7c 28 ff          	add    %bh,-0x1(%rax,%rbp,1)
ffff800000111dc3:	ff 2f                	ljmp   *(%rdi)
ffff800000111dc5:	00 00                	add    %al,(%rax)
ffff800000111dc7:	00 00                	add    %al,(%rax)
ffff800000111dc9:	41 0e                	rex.B (bad) 
ffff800000111dcb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111dd1:	41 83 03 69          	addl   $0x69,(%r11)
ffff800000111dd5:	0c 07                	or     $0x7,%al
ffff800000111dd7:	08 1c 00             	or     %bl,(%rax,%rax,1)
ffff800000111dda:	00 00                	add    %al,(%rax)
ffff800000111ddc:	bc 00 00 00 8b       	mov    $0x8b000000,%esp
ffff800000111de1:	28 ff                	sub    %bh,%bh
ffff800000111de3:	ff                   	(bad)  
ffff800000111de4:	ef                   	out    %eax,(%dx)
ffff800000111de5:	00 00                	add    %al,(%rax)
ffff800000111de7:	00 00                	add    %al,(%rax)
ffff800000111de9:	41 0e                	rex.B (bad) 
ffff800000111deb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111df1:	02 ea                	add    %dl,%ch
ffff800000111df3:	0c 07                	or     $0x7,%al
ffff800000111df5:	08 00                	or     %al,(%rax)
ffff800000111df7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111dfa:	00 00                	add    %al,(%rax)
ffff800000111dfc:	dc 00                	faddl  (%rax)
ffff800000111dfe:	00 00                	add    %al,(%rax)
ffff800000111e00:	5a                   	pop    %rdx
ffff800000111e01:	29 ff                	sub    %edi,%edi
ffff800000111e03:	ff 60 00             	jmpq   *0x0(%rax)
ffff800000111e06:	00 00                	add    %al,(%rax)
ffff800000111e08:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111e0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111e11:	02 5b 0c             	add    0xc(%rbx),%bl
ffff800000111e14:	07                   	(bad)  
ffff800000111e15:	08 00                	or     %al,(%rax)
ffff800000111e17:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111e1a:	00 00                	add    %al,(%rax)
ffff800000111e1c:	fc                   	cld    
ffff800000111e1d:	00 00                	add    %al,(%rax)
ffff800000111e1f:	00 9a 29 ff ff 76    	add    %bl,0x76ffff29(%rdx)
ffff800000111e25:	02 00                	add    (%rax),%al
ffff800000111e27:	00 00                	add    %al,(%rax)
ffff800000111e29:	41 0e                	rex.B (bad) 
ffff800000111e2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111e31:	03 71 02             	add    0x2(%rcx),%esi
ffff800000111e34:	0c 07                	or     $0x7,%al
ffff800000111e36:	08 00                	or     %al,(%rax)
ffff800000111e38:	1c 00                	sbb    $0x0,%al
ffff800000111e3a:	00 00                	add    %al,(%rax)
ffff800000111e3c:	1c 01                	sbb    $0x1,%al
ffff800000111e3e:	00 00                	add    %al,(%rax)
ffff800000111e40:	f0 2b ff             	lock sub %edi,%edi
ffff800000111e43:	ff                   	(bad)  
ffff800000111e44:	f9                   	stc    
ffff800000111e45:	08 00                	or     %al,(%rax)
ffff800000111e47:	00 00                	add    %al,(%rax)
ffff800000111e49:	41 0e                	rex.B (bad) 
ffff800000111e4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111e51:	03 f4                	add    %esp,%esi
ffff800000111e53:	08 0c 07             	or     %cl,(%rdi,%rax,1)
ffff800000111e56:	08 00                	or     %al,(%rax)
ffff800000111e58:	1c 00                	sbb    $0x0,%al
ffff800000111e5a:	00 00                	add    %al,(%rax)
ffff800000111e5c:	3c 01                	cmp    $0x1,%al
ffff800000111e5e:	00 00                	add    %al,(%rax)
ffff800000111e60:	c9                   	leaveq 
ffff800000111e61:	34 ff                	xor    $0xff,%al
ffff800000111e63:	ff 29                	ljmp   *(%rcx)
ffff800000111e65:	05 00 00 00 41       	add    $0x41000000,%eax
ffff800000111e6a:	0e                   	(bad)  
ffff800000111e6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111e71:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
ffff800000111e78:	1c 00                	sbb    $0x0,%al
ffff800000111e7a:	00 00                	add    %al,(%rax)
ffff800000111e7c:	5c                   	pop    %rsp
ffff800000111e7d:	01 00                	add    %eax,(%rax)
ffff800000111e7f:	00 d2                	add    %dl,%dl
ffff800000111e81:	39 ff                	cmp    %edi,%edi
ffff800000111e83:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000111e89:	41 0e                	rex.B (bad) 
ffff800000111e8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111e91:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000111e97:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111e9a:	00 00                	add    %al,(%rax)
ffff800000111e9c:	7c 01                	jl     ffff800000111e9f <_erodata+0x185>
ffff800000111e9e:	00 00                	add    %al,(%rax)
ffff800000111ea0:	41 3a ff             	cmp    %r15b,%dil
ffff800000111ea3:	ff 8f 00 00 00 00    	decl   0x0(%rdi)
ffff800000111ea9:	41 0e                	rex.B (bad) 
ffff800000111eab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111eb1:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000111eb7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111eba:	00 00                	add    %al,(%rax)
ffff800000111ebc:	9c                   	pushfq 
ffff800000111ebd:	01 00                	add    %eax,(%rax)
ffff800000111ebf:	00 b0 3a ff ff 8f    	add    %dh,-0x700000c6(%rax)
ffff800000111ec5:	00 00                	add    %al,(%rax)
ffff800000111ec7:	00 00                	add    %al,(%rax)
ffff800000111ec9:	41 0e                	rex.B (bad) 
ffff800000111ecb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111ed1:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000111ed7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff800000111eda:	00 00                	add    %al,(%rax)
ffff800000111edc:	bc 01 00 00 1f       	mov    $0x1f000001,%esp
ffff800000111ee1:	3b ff                	cmp    %edi,%edi
ffff800000111ee3:	ff c9                	dec    %ecx
ffff800000111ee5:	00 00                	add    %al,(%rax)
ffff800000111ee7:	00 00                	add    %al,(%rax)
ffff800000111ee9:	41 0e                	rex.B (bad) 
ffff800000111eeb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111ef1:	02 c4                	add    %ah,%al
ffff800000111ef3:	0c 07                	or     $0x7,%al
ffff800000111ef5:	08 00                	or     %al,(%rax)
ffff800000111ef7:	00 18                	add    %bl,(%rax)
ffff800000111ef9:	00 00                	add    %al,(%rax)
ffff800000111efb:	00 dc                	add    %bl,%ah
ffff800000111efd:	01 00                	add    %eax,(%rax)
ffff800000111eff:	00 c8                	add    %cl,%al
ffff800000111f01:	3b ff                	cmp    %edi,%edi
ffff800000111f03:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111f06:	00 00                	add    %al,(%rax)
ffff800000111f08:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111f0b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f11:	00 00                	add    %al,(%rax)
ffff800000111f13:	00 18                	add    %bl,(%rax)
ffff800000111f15:	00 00                	add    %al,(%rax)
ffff800000111f17:	00 f8                	add    %bh,%al
ffff800000111f19:	01 00                	add    %eax,(%rax)
ffff800000111f1b:	00 07                	add    %al,(%rdi)
ffff800000111f1d:	3c ff                	cmp    $0xff,%al
ffff800000111f1f:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111f22:	00 00                	add    %al,(%rax)
ffff800000111f24:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111f27:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f2d:	00 00                	add    %al,(%rax)
ffff800000111f2f:	00 18                	add    %bl,(%rax)
ffff800000111f31:	00 00                	add    %al,(%rax)
ffff800000111f33:	00 14 02             	add    %dl,(%rdx,%rax,1)
ffff800000111f36:	00 00                	add    %al,(%rax)
ffff800000111f38:	46 3c ff             	rex.RX cmp $0xff,%al
ffff800000111f3b:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111f3e:	00 00                	add    %al,(%rax)
ffff800000111f40:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111f43:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f49:	00 00                	add    %al,(%rax)
ffff800000111f4b:	00 18                	add    %bl,(%rax)
ffff800000111f4d:	00 00                	add    %al,(%rax)
ffff800000111f4f:	00 30                	add    %dh,(%rax)
ffff800000111f51:	02 00                	add    (%rax),%al
ffff800000111f53:	00 85 3c ff ff 5b    	add    %al,0x5bffff3c(%rbp)
ffff800000111f59:	00 00                	add    %al,(%rax)
ffff800000111f5b:	00 00                	add    %al,(%rax)
ffff800000111f5d:	41 0e                	rex.B (bad) 
ffff800000111f5f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f65:	00 00                	add    %al,(%rax)
ffff800000111f67:	00 18                	add    %bl,(%rax)
ffff800000111f69:	00 00                	add    %al,(%rax)
ffff800000111f6b:	00 4c 02 00          	add    %cl,0x0(%rdx,%rax,1)
ffff800000111f6f:	00 c4                	add    %al,%ah
ffff800000111f71:	3c ff                	cmp    $0xff,%al
ffff800000111f73:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111f76:	00 00                	add    %al,(%rax)
ffff800000111f78:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111f7b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f81:	00 00                	add    %al,(%rax)
ffff800000111f83:	00 18                	add    %bl,(%rax)
ffff800000111f85:	00 00                	add    %al,(%rax)
ffff800000111f87:	00 68 02             	add    %ch,0x2(%rax)
ffff800000111f8a:	00 00                	add    %al,(%rax)
ffff800000111f8c:	03 3d ff ff 5b 00    	add    0x5bffff(%rip),%edi        # ffff8000006d1f91 <_ebss+0x5a3a61>
ffff800000111f92:	00 00                	add    %al,(%rax)
ffff800000111f94:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111f97:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111f9d:	00 00                	add    %al,(%rax)
ffff800000111f9f:	00 18                	add    %bl,(%rax)
ffff800000111fa1:	00 00                	add    %al,(%rax)
ffff800000111fa3:	00 84 02 00 00 42 3d 	add    %al,0x3d420000(%rdx,%rax,1)
ffff800000111faa:	ff                   	(bad)  
ffff800000111fab:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111fae:	00 00                	add    %al,(%rax)
ffff800000111fb0:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111fb3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111fb9:	00 00                	add    %al,(%rax)
ffff800000111fbb:	00 18                	add    %bl,(%rax)
ffff800000111fbd:	00 00                	add    %al,(%rax)
ffff800000111fbf:	00 a0 02 00 00 81    	add    %ah,-0x7efffffe(%rax)
ffff800000111fc5:	3d ff ff 5b 00       	cmp    $0x5bffff,%eax
ffff800000111fca:	00 00                	add    %al,(%rax)
ffff800000111fcc:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111fcf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111fd5:	00 00                	add    %al,(%rax)
ffff800000111fd7:	00 18                	add    %bl,(%rax)
ffff800000111fd9:	00 00                	add    %al,(%rax)
ffff800000111fdb:	00 bc 02 00 00 c0 3d 	add    %bh,0x3dc00000(%rdx,%rax,1)
ffff800000111fe2:	ff                   	(bad)  
ffff800000111fe3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff800000111fe6:	00 00                	add    %al,(%rax)
ffff800000111fe8:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000111feb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000111ff1:	00 00                	add    %al,(%rax)
ffff800000111ff3:	00 18                	add    %bl,(%rax)
ffff800000111ff5:	00 00                	add    %al,(%rax)
ffff800000111ff7:	00 d8                	add    %bl,%al
ffff800000111ff9:	02 00                	add    (%rax),%al
ffff800000111ffb:	00 ff                	add    %bh,%bh
ffff800000111ffd:	3d ff ff 5b 00       	cmp    $0x5bffff,%eax
ffff800000112002:	00 00                	add    %al,(%rax)
ffff800000112004:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112007:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011200d:	00 00                	add    %al,(%rax)
ffff80000011200f:	00 18                	add    %bl,(%rax)
ffff800000112011:	00 00                	add    %al,(%rax)
ffff800000112013:	00 f4                	add    %dh,%ah
ffff800000112015:	02 00                	add    (%rax),%al
ffff800000112017:	00 3e                	add    %bh,(%rsi)
ffff800000112019:	3e ff                	ds (bad) 
ffff80000011201b:	ff                   	(bad)  
ffff80000011201c:	7a 01                	jp     ffff80000011201f <_erodata+0x305>
ffff80000011201e:	00 00                	add    %al,(%rax)
ffff800000112020:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112023:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112029:	00 00                	add    %al,(%rax)
ffff80000011202b:	00 18                	add    %bl,(%rax)
ffff80000011202d:	00 00                	add    %al,(%rax)
ffff80000011202f:	00 10                	add    %dl,(%rax)
ffff800000112031:	03 00                	add    (%rax),%eax
ffff800000112033:	00 9c 3f ff ff 7a 01 	add    %bl,0x17affff(%rdi,%rdi,1)
ffff80000011203a:	00 00                	add    %al,(%rax)
ffff80000011203c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011203f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112045:	00 00                	add    %al,(%rax)
ffff800000112047:	00 18                	add    %bl,(%rax)
ffff800000112049:	00 00                	add    %al,(%rax)
ffff80000011204b:	00 2c 03             	add    %ch,(%rbx,%rax,1)
ffff80000011204e:	00 00                	add    %al,(%rax)
ffff800000112050:	fa                   	cli    
ffff800000112051:	40 ff                	rex (bad) 
ffff800000112053:	ff                   	(bad)  
ffff800000112054:	7a 01                	jp     ffff800000112057 <_erodata+0x33d>
ffff800000112056:	00 00                	add    %al,(%rax)
ffff800000112058:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011205b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112061:	00 00                	add    %al,(%rax)
ffff800000112063:	00 18                	add    %bl,(%rax)
ffff800000112065:	00 00                	add    %al,(%rax)
ffff800000112067:	00 48 03             	add    %cl,0x3(%rax)
ffff80000011206a:	00 00                	add    %al,(%rax)
ffff80000011206c:	58                   	pop    %rax
ffff80000011206d:	42 ff                	rex.X (bad) 
ffff80000011206f:	ff                   	(bad)  
ffff800000112070:	7a 01                	jp     ffff800000112073 <_erodata+0x359>
ffff800000112072:	00 00                	add    %al,(%rax)
ffff800000112074:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112077:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011207d:	00 00                	add    %al,(%rax)
ffff80000011207f:	00 18                	add    %bl,(%rax)
ffff800000112081:	00 00                	add    %al,(%rax)
ffff800000112083:	00 64 03 00          	add    %ah,0x0(%rbx,%rax,1)
ffff800000112087:	00 b6 43 ff ff ff    	add    %dh,-0xbd(%rsi)
ffff80000011208d:	01 00                	add    %eax,(%rax)
ffff80000011208f:	00 00                	add    %al,(%rax)
ffff800000112091:	41 0e                	rex.B (bad) 
ffff800000112093:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112099:	00 00                	add    %al,(%rax)
ffff80000011209b:	00 18                	add    %bl,(%rax)
ffff80000011209d:	00 00                	add    %al,(%rax)
ffff80000011209f:	00 80 03 00 00 99    	add    %al,-0x66fffffd(%rax)
ffff8000001120a5:	45 ff                	rex.RB (bad) 
ffff8000001120a7:	ff 5b 00             	lcall  *0x0(%rbx)
ffff8000001120aa:	00 00                	add    %al,(%rax)
ffff8000001120ac:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001120af:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001120b5:	00 00                	add    %al,(%rax)
ffff8000001120b7:	00 18                	add    %bl,(%rax)
ffff8000001120b9:	00 00                	add    %al,(%rax)
ffff8000001120bb:	00 9c 03 00 00 d8 45 	add    %bl,0x45d80000(%rbx,%rax,1)
ffff8000001120c2:	ff                   	(bad)  
ffff8000001120c3:	ff 5b 00             	lcall  *0x0(%rbx)
ffff8000001120c6:	00 00                	add    %al,(%rax)
ffff8000001120c8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001120cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001120d1:	00 00                	add    %al,(%rax)
ffff8000001120d3:	00 18                	add    %bl,(%rax)
ffff8000001120d5:	00 00                	add    %al,(%rax)
ffff8000001120d7:	00 b8 03 00 00 17    	add    %bh,0x17000003(%rax)
ffff8000001120dd:	46 ff                	rex.RX (bad) 
ffff8000001120df:	ff 5b 00             	lcall  *0x0(%rbx)
ffff8000001120e2:	00 00                	add    %al,(%rax)
ffff8000001120e4:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001120e7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001120ed:	00 00                	add    %al,(%rax)
ffff8000001120ef:	00 18                	add    %bl,(%rax)
ffff8000001120f1:	00 00                	add    %al,(%rax)
ffff8000001120f3:	00 d4                	add    %dl,%ah
ffff8000001120f5:	03 00                	add    (%rax),%eax
ffff8000001120f7:	00 56 46             	add    %dl,0x46(%rsi)
ffff8000001120fa:	ff                   	(bad)  
ffff8000001120fb:	ff 5b 00             	lcall  *0x0(%rbx)
ffff8000001120fe:	00 00                	add    %al,(%rax)
ffff800000112100:	00 41 0e             	add    %al,0xe(%rcx)
ffff800000112103:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112109:	00 00                	add    %al,(%rax)
ffff80000011210b:	00 18                	add    %bl,(%rax)
ffff80000011210d:	00 00                	add    %al,(%rax)
ffff80000011210f:	00 f0                	add    %dh,%al
ffff800000112111:	03 00                	add    (%rax),%eax
ffff800000112113:	00 95 46 ff ff 5b    	add    %dl,0x5bffff46(%rbp)
ffff800000112119:	00 00                	add    %al,(%rax)
ffff80000011211b:	00 00                	add    %al,(%rax)
ffff80000011211d:	41 0e                	rex.B (bad) 
ffff80000011211f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112125:	00 00                	add    %al,(%rax)
ffff800000112127:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011212a:	00 00                	add    %al,(%rax)
ffff80000011212c:	0c 04                	or     $0x4,%al
ffff80000011212e:	00 00                	add    %al,(%rax)
ffff800000112130:	d4                   	(bad)  
ffff800000112131:	46 ff                	rex.RX (bad) 
ffff800000112133:	ff 87 02 00 00 00    	incl   0x2(%rdi)
ffff800000112139:	41 0e                	rex.B (bad) 
ffff80000011213b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112141:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
ffff800000112147:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011214a:	00 00                	add    %al,(%rax)
ffff80000011214c:	2c 04                	sub    $0x4,%al
ffff80000011214e:	00 00                	add    %al,(%rax)
ffff800000112150:	3b 49 ff             	cmp    -0x1(%rcx),%ecx
ffff800000112153:	ff                   	(bad)  
ffff800000112154:	ec                   	in     (%dx),%al
ffff800000112155:	01 00                	add    %eax,(%rax)
ffff800000112157:	00 00                	add    %al,(%rax)
ffff800000112159:	41 0e                	rex.B (bad) 
ffff80000011215b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112161:	03 e7                	add    %edi,%esp
ffff800000112163:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
ffff800000112166:	08 00                	or     %al,(%rax)
ffff800000112168:	1c 00                	sbb    $0x0,%al
ffff80000011216a:	00 00                	add    %al,(%rax)
ffff80000011216c:	4c 04 00             	rex.WR add $0x0,%al
ffff80000011216f:	00 07                	add    %al,(%rdi)
ffff800000112171:	4b ff                	rex.WXB (bad) 
ffff800000112173:	ff 82 01 00 00 00    	incl   0x1(%rdx)
ffff800000112179:	41 0e                	rex.B (bad) 
ffff80000011217b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112181:	03 7d 01             	add    0x1(%rbp),%edi
ffff800000112184:	0c 07                	or     $0x7,%al
ffff800000112186:	08 00                	or     %al,(%rax)
ffff800000112188:	18 00                	sbb    %al,(%rax)
ffff80000011218a:	00 00                	add    %al,(%rax)
ffff80000011218c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011218d:	04 00                	add    $0x0,%al
ffff80000011218f:	00 69 4c             	add    %ch,0x4c(%rcx)
ffff800000112192:	ff                   	(bad)  
ffff800000112193:	ff 56 04             	callq  *0x4(%rsi)
ffff800000112196:	00 00                	add    %al,(%rax)
ffff800000112198:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011219b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001121a1:	00 00                	add    %al,(%rax)
ffff8000001121a3:	00 20                	add    %ah,(%rax)
ffff8000001121a5:	00 00                	add    %al,(%rax)
ffff8000001121a7:	00 88 04 00 00 a3    	add    %cl,-0x5cfffffc(%rax)
ffff8000001121ad:	50                   	push   %rax
ffff8000001121ae:	ff                   	(bad)  
ffff8000001121af:	ff 32                	pushq  (%rdx)
ffff8000001121b1:	03 00                	add    (%rax),%eax
ffff8000001121b3:	00 00                	add    %al,(%rax)
ffff8000001121b5:	41 0e                	rex.B (bad) 
ffff8000001121b7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001121bd:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # ffff800008182dc6 <_ebss+0x8054896>
ffff8000001121c3:	00 00                	add    %al,(%rax)
ffff8000001121c5:	00 00                	add    %al,(%rax)
ffff8000001121c7:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001121ca:	00 00                	add    %al,(%rax)
ffff8000001121cc:	ac                   	lods   %ds:(%rsi),%al
ffff8000001121cd:	04 00                	add    $0x0,%al
ffff8000001121cf:	00 b1 53 ff ff 21    	add    %dh,0x21ffff53(%rcx)
ffff8000001121d5:	00 00                	add    %al,(%rax)
ffff8000001121d7:	00 00                	add    %al,(%rax)
ffff8000001121d9:	41 0e                	rex.B (bad) 
ffff8000001121db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001121e1:	5c                   	pop    %rsp
ffff8000001121e2:	0c 07                	or     $0x7,%al
ffff8000001121e4:	08 00                	or     %al,(%rax)
ffff8000001121e6:	00 00                	add    %al,(%rax)
ffff8000001121e8:	1c 00                	sbb    $0x0,%al
ffff8000001121ea:	00 00                	add    %al,(%rax)
ffff8000001121ec:	cc                   	int3   
ffff8000001121ed:	04 00                	add    $0x0,%al
ffff8000001121ef:	00 b2 53 ff ff 20    	add    %dh,0x20ffff53(%rdx)
ffff8000001121f5:	00 00                	add    %al,(%rax)
ffff8000001121f7:	00 00                	add    %al,(%rax)
ffff8000001121f9:	41 0e                	rex.B (bad) 
ffff8000001121fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112201:	5b                   	pop    %rbx
ffff800000112202:	0c 07                	or     $0x7,%al
ffff800000112204:	08 00                	or     %al,(%rax)
ffff800000112206:	00 00                	add    %al,(%rax)
ffff800000112208:	1c 00                	sbb    $0x0,%al
ffff80000011220a:	00 00                	add    %al,(%rax)
ffff80000011220c:	ec                   	in     (%dx),%al
ffff80000011220d:	04 00                	add    $0x0,%al
ffff80000011220f:	00 b2 53 ff ff 8f    	add    %dh,-0x700000ad(%rdx)
ffff800000112215:	00 00                	add    %al,(%rax)
ffff800000112217:	00 00                	add    %al,(%rax)
ffff800000112219:	41 0e                	rex.B (bad) 
ffff80000011221b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112221:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
ffff800000112227:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011222a:	00 00                	add    %al,(%rax)
ffff80000011222c:	0c 05                	or     $0x5,%al
ffff80000011222e:	00 00                	add    %al,(%rax)
ffff800000112230:	21 54 ff ff          	and    %edx,-0x1(%rdi,%rdi,8)
ffff800000112234:	c9                   	leaveq 
ffff800000112235:	00 00                	add    %al,(%rax)
ffff800000112237:	00 00                	add    %al,(%rax)
ffff800000112239:	41 0e                	rex.B (bad) 
ffff80000011223b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112241:	02 c4                	add    %ah,%al
ffff800000112243:	0c 07                	or     $0x7,%al
ffff800000112245:	08 00                	or     %al,(%rax)
ffff800000112247:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011224a:	00 00                	add    %al,(%rax)
ffff80000011224c:	2c 05                	sub    $0x5,%al
ffff80000011224e:	00 00                	add    %al,(%rax)
ffff800000112250:	ba 5b ff ff 4c       	mov    $0x4cffff5b,%edx
ffff800000112255:	01 00                	add    %eax,(%rax)
ffff800000112257:	00 00                	add    %al,(%rax)
ffff800000112259:	41 0e                	rex.B (bad) 
ffff80000011225b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112261:	03 47 01             	add    0x1(%rdi),%eax
ffff800000112264:	0c 07                	or     $0x7,%al
ffff800000112266:	08 00                	or     %al,(%rax)
ffff800000112268:	1c 00                	sbb    $0x0,%al
ffff80000011226a:	00 00                	add    %al,(%rax)
ffff80000011226c:	4c 05 00 00 e6 5c    	rex.WR add $0x5ce60000,%rax
ffff800000112272:	ff                   	(bad)  
ffff800000112273:	ff                   	(bad)  
ffff800000112274:	df 00                	filds  (%rax)
ffff800000112276:	00 00                	add    %al,(%rax)
ffff800000112278:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011227b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112281:	02 da                	add    %dl,%bl
ffff800000112283:	0c 07                	or     $0x7,%al
ffff800000112285:	08 00                	or     %al,(%rax)
ffff800000112287:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011228a:	00 00                	add    %al,(%rax)
ffff80000011228c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011228d:	05 00 00 a5 5d       	add    $0x5da50000,%eax
ffff800000112292:	ff                   	(bad)  
ffff800000112293:	ff 22                	jmpq   *(%rdx)
ffff800000112295:	00 00                	add    %al,(%rax)
ffff800000112297:	00 00                	add    %al,(%rax)
ffff800000112299:	41 0e                	rex.B (bad) 
ffff80000011229b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001122a1:	5d                   	pop    %rbp
ffff8000001122a2:	0c 07                	or     $0x7,%al
ffff8000001122a4:	08 00                	or     %al,(%rax)
ffff8000001122a6:	00 00                	add    %al,(%rax)
ffff8000001122a8:	1c 00                	sbb    $0x0,%al
ffff8000001122aa:	00 00                	add    %al,(%rax)
ffff8000001122ac:	8c 05 00 00 a7 5d    	mov    %es,0x5da70000(%rip)        # ffff80005db822b2 <_ebss+0x5da53d82>
ffff8000001122b2:	ff                   	(bad)  
ffff8000001122b3:	ff 43 00             	incl   0x0(%rbx)
ffff8000001122b6:	00 00                	add    %al,(%rax)
ffff8000001122b8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001122bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001122c1:	7e 0c                	jle    ffff8000001122cf <_erodata+0x5b5>
ffff8000001122c3:	07                   	(bad)  
ffff8000001122c4:	08 00                	or     %al,(%rax)
ffff8000001122c6:	00 00                	add    %al,(%rax)
ffff8000001122c8:	1c 00                	sbb    $0x0,%al
ffff8000001122ca:	00 00                	add    %al,(%rax)
ffff8000001122cc:	ac                   	lods   %ds:(%rsi),%al
ffff8000001122cd:	05 00 00 ca 5d       	add    $0x5dca0000,%eax
ffff8000001122d2:	ff                   	(bad)  
ffff8000001122d3:	ff 26                	jmpq   *(%rsi)
ffff8000001122d5:	00 00                	add    %al,(%rax)
ffff8000001122d7:	00 00                	add    %al,(%rax)
ffff8000001122d9:	41 0e                	rex.B (bad) 
ffff8000001122db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001122e1:	61                   	(bad)  
ffff8000001122e2:	0c 07                	or     $0x7,%al
ffff8000001122e4:	08 00                	or     %al,(%rax)
ffff8000001122e6:	00 00                	add    %al,(%rax)
ffff8000001122e8:	1c 00                	sbb    $0x0,%al
ffff8000001122ea:	00 00                	add    %al,(%rax)
ffff8000001122ec:	cc                   	int3   
ffff8000001122ed:	05 00 00 d0 5d       	add    $0x5dd00000,%eax
ffff8000001122f2:	ff                   	(bad)  
ffff8000001122f3:	ff 5a 00             	lcall  *0x0(%rdx)
ffff8000001122f6:	00 00                	add    %al,(%rax)
ffff8000001122f8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001122fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112301:	02 55 0c             	add    0xc(%rbp),%dl
ffff800000112304:	07                   	(bad)  
ffff800000112305:	08 00                	or     %al,(%rax)
ffff800000112307:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011230a:	00 00                	add    %al,(%rax)
ffff80000011230c:	ec                   	in     (%dx),%al
ffff80000011230d:	05 00 00 0a 5e       	add    $0x5e0a0000,%eax
ffff800000112312:	ff                   	(bad)  
ffff800000112313:	ff 76 00             	pushq  0x0(%rsi)
ffff800000112316:	00 00                	add    %al,(%rax)
ffff800000112318:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011231b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112321:	02 71 0c             	add    0xc(%rcx),%dh
ffff800000112324:	07                   	(bad)  
ffff800000112325:	08 00                	or     %al,(%rax)
ffff800000112327:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011232a:	00 00                	add    %al,(%rax)
ffff80000011232c:	0c 06                	or     $0x6,%al
ffff80000011232e:	00 00                	add    %al,(%rax)
ffff800000112330:	60                   	(bad)  
ffff800000112331:	5e                   	pop    %rsi
ffff800000112332:	ff                   	(bad)  
ffff800000112333:	ff 26                	jmpq   *(%rsi)
ffff800000112335:	00 00                	add    %al,(%rax)
ffff800000112337:	00 00                	add    %al,(%rax)
ffff800000112339:	41 0e                	rex.B (bad) 
ffff80000011233b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112341:	61                   	(bad)  
ffff800000112342:	0c 07                	or     $0x7,%al
ffff800000112344:	08 00                	or     %al,(%rax)
ffff800000112346:	00 00                	add    %al,(%rax)
ffff800000112348:	1c 00                	sbb    $0x0,%al
ffff80000011234a:	00 00                	add    %al,(%rax)
ffff80000011234c:	2c 06                	sub    $0x6,%al
ffff80000011234e:	00 00                	add    %al,(%rax)
ffff800000112350:	66 5e                	pop    %si
ffff800000112352:	ff                   	(bad)  
ffff800000112353:	ff 20                	jmpq   *(%rax)
ffff800000112355:	00 00                	add    %al,(%rax)
ffff800000112357:	00 00                	add    %al,(%rax)
ffff800000112359:	41 0e                	rex.B (bad) 
ffff80000011235b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112361:	5b                   	pop    %rbx
ffff800000112362:	0c 07                	or     $0x7,%al
ffff800000112364:	08 00                	or     %al,(%rax)
ffff800000112366:	00 00                	add    %al,(%rax)
ffff800000112368:	1c 00                	sbb    $0x0,%al
ffff80000011236a:	00 00                	add    %al,(%rax)
ffff80000011236c:	4c 06                	rex.WR (bad) 
ffff80000011236e:	00 00                	add    %al,(%rax)
ffff800000112370:	66 5e                	pop    %si
ffff800000112372:	ff                   	(bad)  
ffff800000112373:	ff 49 00             	decl   0x0(%rcx)
ffff800000112376:	00 00                	add    %al,(%rax)
ffff800000112378:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011237b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112381:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
ffff800000112385:	08 00                	or     %al,(%rax)
ffff800000112387:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011238a:	00 00                	add    %al,(%rax)
ffff80000011238c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011238d:	06                   	(bad)  
ffff80000011238e:	00 00                	add    %al,(%rax)
ffff800000112390:	8f                   	(bad)  
ffff800000112391:	5e                   	pop    %rsi
ffff800000112392:	ff                   	(bad)  
ffff800000112393:	ff                   	(bad)  
ffff800000112394:	39 00                	cmp    %eax,(%rax)
ffff800000112396:	00 00                	add    %al,(%rax)
ffff800000112398:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011239b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001123a1:	74 0c                	je     ffff8000001123af <_erodata+0x695>
ffff8000001123a3:	07                   	(bad)  
ffff8000001123a4:	08 00                	or     %al,(%rax)
ffff8000001123a6:	00 00                	add    %al,(%rax)
ffff8000001123a8:	1c 00                	sbb    $0x0,%al
ffff8000001123aa:	00 00                	add    %al,(%rax)
ffff8000001123ac:	8c 06                	mov    %es,(%rsi)
ffff8000001123ae:	00 00                	add    %al,(%rax)
ffff8000001123b0:	a8 5e                	test   $0x5e,%al
ffff8000001123b2:	ff                   	(bad)  
ffff8000001123b3:	ff c9                	dec    %ecx
ffff8000001123b5:	00 00                	add    %al,(%rax)
ffff8000001123b7:	00 00                	add    %al,(%rax)
ffff8000001123b9:	41 0e                	rex.B (bad) 
ffff8000001123bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001123c1:	02 c4                	add    %ah,%al
ffff8000001123c3:	0c 07                	or     $0x7,%al
ffff8000001123c5:	08 00                	or     %al,(%rax)
ffff8000001123c7:	00 18                	add    %bl,(%rax)
ffff8000001123c9:	00 00                	add    %al,(%rax)
ffff8000001123cb:	00 ac 06 00 00 51 5f 	add    %ch,0x5f510000(%rsi,%rax,1)
ffff8000001123d2:	ff                   	(bad)  
ffff8000001123d3:	ff 45 00             	incl   0x0(%rbp)
ffff8000001123d6:	00 00                	add    %al,(%rax)
ffff8000001123d8:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001123db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001123e1:	00 00                	add    %al,(%rax)
ffff8000001123e3:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff8000001123e6:	00 00                	add    %al,(%rax)
ffff8000001123e8:	c8 06 00 00          	enterq $0x6,$0x0
ffff8000001123ec:	7a 5f                	jp     ffff80000011244d <_erodata+0x733>
ffff8000001123ee:	ff                   	(bad)  
ffff8000001123ef:	ff 97 00 00 00 00    	callq  *0x0(%rdi)
ffff8000001123f5:	41 0e                	rex.B (bad) 
ffff8000001123f7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001123fd:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
ffff800000112403:	00 20                	add    %ah,(%rax)
ffff800000112405:	00 00                	add    %al,(%rax)
ffff800000112407:	00 e8                	add    %ch,%al
ffff800000112409:	06                   	(bad)  
ffff80000011240a:	00 00                	add    %al,(%rax)
ffff80000011240c:	f1                   	icebp  
ffff80000011240d:	5f                   	pop    %rdi
ffff80000011240e:	ff                   	(bad)  
ffff80000011240f:	ff f6                	push   %rsi
ffff800000112411:	00 00                	add    %al,(%rax)
ffff800000112413:	00 00                	add    %al,(%rax)
ffff800000112415:	41 0e                	rex.B (bad) 
ffff800000112417:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff80000011241d:	45 83 03 02          	rex.RB addl $0x2,(%r11)
ffff800000112421:	ec                   	in     (%dx),%al
ffff800000112422:	0c 07                	or     $0x7,%al
ffff800000112424:	08 00                	or     %al,(%rax)
ffff800000112426:	00 00                	add    %al,(%rax)
ffff800000112428:	20 00                	and    %al,(%rax)
ffff80000011242a:	00 00                	add    %al,(%rax)
ffff80000011242c:	0c 07                	or     $0x7,%al
ffff80000011242e:	00 00                	add    %al,(%rax)
ffff800000112430:	c3                   	retq   
ffff800000112431:	60                   	(bad)  
ffff800000112432:	ff                   	(bad)  
ffff800000112433:	ff af 02 00 00 00    	ljmp   *0x2(%rdi)
ffff800000112439:	41 0e                	rex.B (bad) 
ffff80000011243b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112441:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff800000112445:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
ffff800000112446:	02 0c 07             	add    (%rdi,%rax,1),%cl
ffff800000112449:	08 00                	or     %al,(%rax)
ffff80000011244b:	00 18                	add    %bl,(%rax)
ffff80000011244d:	00 00                	add    %al,(%rax)
ffff80000011244f:	00 30                	add    %dh,(%rax)
ffff800000112451:	07                   	(bad)  
ffff800000112452:	00 00                	add    %al,(%rax)
ffff800000112454:	4e 63 ff             	rex.WRX movslq %edi,%r15
ffff800000112457:	ff                   	(bad)  
ffff800000112458:	3b 00                	cmp    (%rax),%eax
ffff80000011245a:	00 00                	add    %al,(%rax)
ffff80000011245c:	00 41 0e             	add    %al,0xe(%rcx)
ffff80000011245f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112465:	00 00                	add    %al,(%rax)
ffff800000112467:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011246a:	00 00                	add    %al,(%rax)
ffff80000011246c:	4c 07                	rex.WR (bad) 
ffff80000011246e:	00 00                	add    %al,(%rax)
ffff800000112470:	6d                   	insl   (%dx),%es:(%rdi)
ffff800000112471:	63 ff                	movsxd %edi,%edi
ffff800000112473:	ff 30                	pushq  (%rax)
ffff800000112475:	00 00                	add    %al,(%rax)
ffff800000112477:	00 00                	add    %al,(%rax)
ffff800000112479:	41 0e                	rex.B (bad) 
ffff80000011247b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff800000112481:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
ffff800000112485:	00 00                	add    %al,(%rax)
ffff800000112487:	00 1c 00             	add    %bl,(%rax,%rax,1)
ffff80000011248a:	00 00                	add    %al,(%rax)
ffff80000011248c:	6c                   	insb   (%dx),%es:(%rdi)
ffff80000011248d:	07                   	(bad)  
ffff80000011248e:	00 00                	add    %al,(%rax)
ffff800000112490:	ad                   	lods   %ds:(%rsi),%eax
ffff800000112491:	63 ff                	movsxd %edi,%edi
ffff800000112493:	ff b5 00 00 00 00    	pushq  0x0(%rbp)
ffff800000112499:	41 0e                	rex.B (bad) 
ffff80000011249b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001124a1:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
ffff8000001124a7:	00 20                	add    %ah,(%rax)
ffff8000001124a9:	00 00                	add    %al,(%rax)
ffff8000001124ab:	00 8c 07 00 00 42 64 	add    %cl,0x64420000(%rdi,%rax,1)
ffff8000001124b2:	ff                   	(bad)  
ffff8000001124b3:	ff 81 01 00 00 00    	incl   0x1(%rcx)
ffff8000001124b9:	41 0e                	rex.B (bad) 
ffff8000001124bb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001124c1:	45 83 03 03          	rex.RB addl $0x3,(%r11)
ffff8000001124c5:	77 01                	ja     ffff8000001124c8 <_erodata+0x7ae>
ffff8000001124c7:	0c 07                	or     $0x7,%al
ffff8000001124c9:	08 00                	or     %al,(%rax)
ffff8000001124cb:	00 24 00             	add    %ah,(%rax,%rax,1)
ffff8000001124ce:	00 00                	add    %al,(%rax)
ffff8000001124d0:	b0 07                	mov    $0x7,%al
ffff8000001124d2:	00 00                	add    %al,(%rax)
ffff8000001124d4:	9f                   	lahf   
ffff8000001124d5:	65 ff                	gs (bad) 
ffff8000001124d7:	ff 43 03             	incl   0x3(%rbx)
ffff8000001124da:	00 00                	add    %al,(%rax)
ffff8000001124dc:	00 41 0e             	add    %al,0xe(%rcx)
ffff8000001124df:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
ffff8000001124e5:	4b 8e 03             	rex.WXB mov (%r11),%es
ffff8000001124e8:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
ffff8000001124eb:	05 83 06 03 33       	add    $0x33030683,%eax
ffff8000001124f0:	03 0c 07             	add    (%rdi,%rax,1),%ecx
ffff8000001124f3:	08                   	.byte 0x8

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
ffff800000118024:	00 80 ff ff e0 ae    	add    %al,-0x511f0001(%rax)
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
ffff800000120024:	00 80 ff ff e0 ae    	add    %al,-0x511f0001(%rax)
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
