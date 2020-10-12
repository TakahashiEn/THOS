
entry.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <RESTORE_ALL>:
   0:	41 5f                	pop    %r15
   2:	41 5e                	pop    %r14
   4:	41 5d                	pop    %r13
   6:	41 5c                	pop    %r12
   8:	41 5b                	pop    %r11
   a:	41 5a                	pop    %r10
   c:	41 59                	pop    %r9
   e:	41 58                	pop    %r8
  10:	5b                   	pop    %rbx
  11:	59                   	pop    %rcx
  12:	5a                   	pop    %rdx
  13:	5e                   	pop    %rsi
  14:	5f                   	pop    %rdi
  15:	5d                   	pop    %rbp
  16:	58                   	pop    %rax
  17:	48 8e d8             	mov    %rax,%ds
  1a:	58                   	pop    %rax
  1b:	48 8e c0             	mov    %rax,%es
  1e:	58                   	pop    %rax
  1f:	48 83 c4 10          	add    $0x10,%rsp
  23:	48 cf                	iretq  

0000000000000025 <ret_from_intr>:
  25:	eb d9                	jmp    0 <RESTORE_ALL>

0000000000000027 <system_call>:
  27:	fb                   	sti    
  28:	48 83 ec 38          	sub    $0x38,%rsp
  2c:	fc                   	cld    
  2d:	50                   	push   %rax
  2e:	48 8c c0             	mov    %es,%rax
  31:	50                   	push   %rax
  32:	48 8c d8             	mov    %ds,%rax
  35:	50                   	push   %rax
  36:	48 31 c0             	xor    %rax,%rax
  39:	55                   	push   %rbp
  3a:	57                   	push   %rdi
  3b:	56                   	push   %rsi
  3c:	52                   	push   %rdx
  3d:	51                   	push   %rcx
  3e:	53                   	push   %rbx
  3f:	41 50                	push   %r8
  41:	41 51                	push   %r9
  43:	41 52                	push   %r10
  45:	41 53                	push   %r11
  47:	41 54                	push   %r12
  49:	41 55                	push   %r13
  4b:	41 56                	push   %r14
  4d:	41 57                	push   %r15
  4f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
  56:	48 8e da             	mov    %rdx,%ds
  59:	48 8e c2             	mov    %rdx,%es
  5c:	48 89 e7             	mov    %rsp,%rdi
  5f:	e8 00 00 00 00       	callq  64 <ret_system_call>

0000000000000064 <ret_system_call>:
  64:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
  6b:	00 
  6c:	41 5f                	pop    %r15
  6e:	41 5e                	pop    %r14
  70:	41 5d                	pop    %r13
  72:	41 5c                	pop    %r12
  74:	41 5b                	pop    %r11
  76:	41 5a                	pop    %r10
  78:	41 59                	pop    %r9
  7a:	41 58                	pop    %r8
  7c:	5b                   	pop    %rbx
  7d:	59                   	pop    %rcx
  7e:	5a                   	pop    %rdx
  7f:	5e                   	pop    %rsi
  80:	5f                   	pop    %rdi
  81:	5d                   	pop    %rbp
  82:	58                   	pop    %rax
  83:	48 8e d8             	mov    %rax,%ds
  86:	58                   	pop    %rax
  87:	48 8e c0             	mov    %rax,%es
  8a:	58                   	pop    %rax
  8b:	48 83 c4 38          	add    $0x38,%rsp
  8f:	48 0f 35             	rex.W sysexit 

0000000000000092 <divide_error>:
  92:	6a 00                	pushq  $0x0
  94:	50                   	push   %rax
  95:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 9c <divide_error+0xa>
  9c:	48 87 04 24          	xchg   %rax,(%rsp)

00000000000000a0 <error_code>:
  a0:	50                   	push   %rax
  a1:	48 8c c0             	mov    %es,%rax
  a4:	50                   	push   %rax
  a5:	48 8c d8             	mov    %ds,%rax
  a8:	50                   	push   %rax
  a9:	48 31 c0             	xor    %rax,%rax
  ac:	55                   	push   %rbp
  ad:	57                   	push   %rdi
  ae:	56                   	push   %rsi
  af:	52                   	push   %rdx
  b0:	51                   	push   %rcx
  b1:	53                   	push   %rbx
  b2:	41 50                	push   %r8
  b4:	41 51                	push   %r9
  b6:	41 52                	push   %r10
  b8:	41 53                	push   %r11
  ba:	41 54                	push   %r12
  bc:	41 55                	push   %r13
  be:	41 56                	push   %r14
  c0:	41 57                	push   %r15
  c2:	fc                   	cld    
  c3:	48 8b b4 24 90 00 00 	mov    0x90(%rsp),%rsi
  ca:	00 
  cb:	48 8b 94 24 88 00 00 	mov    0x88(%rsp),%rdx
  d2:	00 
  d3:	48 c7 c7 10 00 00 00 	mov    $0x10,%rdi
  da:	48 8e df             	mov    %rdi,%ds
  dd:	48 8e c7             	mov    %rdi,%es
  e0:	48 89 e7             	mov    %rsp,%rdi
  e3:	ff d2                	callq  *%rdx
  e5:	e9 3b ff ff ff       	jmpq   25 <ret_from_intr>

00000000000000ea <debug>:
  ea:	6a 00                	pushq  $0x0
  ec:	50                   	push   %rax
  ed:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # f4 <debug+0xa>
  f4:	48 87 04 24          	xchg   %rax,(%rsp)
  f8:	eb a6                	jmp    a0 <error_code>

00000000000000fa <nmi>:
  fa:	50                   	push   %rax
  fb:	fc                   	cld    
  fc:	50                   	push   %rax
  fd:	50                   	push   %rax
  fe:	48 8c c0             	mov    %es,%rax
 101:	50                   	push   %rax
 102:	48 8c d8             	mov    %ds,%rax
 105:	50                   	push   %rax
 106:	48 31 c0             	xor    %rax,%rax
 109:	55                   	push   %rbp
 10a:	57                   	push   %rdi
 10b:	56                   	push   %rsi
 10c:	52                   	push   %rdx
 10d:	51                   	push   %rcx
 10e:	53                   	push   %rbx
 10f:	41 50                	push   %r8
 111:	41 51                	push   %r9
 113:	41 52                	push   %r10
 115:	41 53                	push   %r11
 117:	41 54                	push   %r12
 119:	41 55                	push   %r13
 11b:	41 56                	push   %r14
 11d:	41 57                	push   %r15
 11f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 126:	48 8e da             	mov    %rdx,%ds
 129:	48 8e c2             	mov    %rdx,%es
 12c:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 133:	48 89 e7             	mov    %rsp,%rdi
 136:	e8 00 00 00 00       	callq  13b <nmi+0x41>
 13b:	e9 c0 fe ff ff       	jmpq   0 <RESTORE_ALL>

0000000000000140 <int3>:
 140:	6a 00                	pushq  $0x0
 142:	50                   	push   %rax
 143:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 14a <int3+0xa>
 14a:	48 87 04 24          	xchg   %rax,(%rsp)
 14e:	e9 4d ff ff ff       	jmpq   a0 <error_code>

0000000000000153 <overflow>:
 153:	6a 00                	pushq  $0x0
 155:	50                   	push   %rax
 156:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 15d <overflow+0xa>
 15d:	48 87 04 24          	xchg   %rax,(%rsp)
 161:	e9 3a ff ff ff       	jmpq   a0 <error_code>

0000000000000166 <bounds>:
 166:	6a 00                	pushq  $0x0
 168:	50                   	push   %rax
 169:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 170 <bounds+0xa>
 170:	48 87 04 24          	xchg   %rax,(%rsp)
 174:	e9 27 ff ff ff       	jmpq   a0 <error_code>

0000000000000179 <undefined_opcode>:
 179:	6a 00                	pushq  $0x0
 17b:	50                   	push   %rax
 17c:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 183 <undefined_opcode+0xa>
 183:	48 87 04 24          	xchg   %rax,(%rsp)
 187:	e9 14 ff ff ff       	jmpq   a0 <error_code>

000000000000018c <dev_not_available>:
 18c:	6a 00                	pushq  $0x0
 18e:	50                   	push   %rax
 18f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 196 <dev_not_available+0xa>
 196:	48 87 04 24          	xchg   %rax,(%rsp)
 19a:	e9 01 ff ff ff       	jmpq   a0 <error_code>

000000000000019f <double_fault>:
 19f:	50                   	push   %rax
 1a0:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1a7 <double_fault+0x8>
 1a7:	48 87 04 24          	xchg   %rax,(%rsp)
 1ab:	e9 f0 fe ff ff       	jmpq   a0 <error_code>

00000000000001b0 <coprocessor_segment_overrun>:
 1b0:	6a 00                	pushq  $0x0
 1b2:	50                   	push   %rax
 1b3:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1ba <coprocessor_segment_overrun+0xa>
 1ba:	48 87 04 24          	xchg   %rax,(%rsp)
 1be:	e9 dd fe ff ff       	jmpq   a0 <error_code>

00000000000001c3 <invalid_TSS>:
 1c3:	50                   	push   %rax
 1c4:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1cb <invalid_TSS+0x8>
 1cb:	48 87 04 24          	xchg   %rax,(%rsp)
 1cf:	e9 cc fe ff ff       	jmpq   a0 <error_code>

00000000000001d4 <segment_not_present>:
 1d4:	50                   	push   %rax
 1d5:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1dc <segment_not_present+0x8>
 1dc:	48 87 04 24          	xchg   %rax,(%rsp)
 1e0:	e9 bb fe ff ff       	jmpq   a0 <error_code>

00000000000001e5 <stack_segment_fault>:
 1e5:	50                   	push   %rax
 1e6:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1ed <stack_segment_fault+0x8>
 1ed:	48 87 04 24          	xchg   %rax,(%rsp)
 1f1:	e9 aa fe ff ff       	jmpq   a0 <error_code>

00000000000001f6 <general_protection>:
 1f6:	50                   	push   %rax
 1f7:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1fe <general_protection+0x8>
 1fe:	48 87 04 24          	xchg   %rax,(%rsp)
 202:	e9 99 fe ff ff       	jmpq   a0 <error_code>

0000000000000207 <page_fault>:
 207:	50                   	push   %rax
 208:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 20f <page_fault+0x8>
 20f:	48 87 04 24          	xchg   %rax,(%rsp)
 213:	e9 88 fe ff ff       	jmpq   a0 <error_code>

0000000000000218 <x87_FPU_error>:
 218:	6a 00                	pushq  $0x0
 21a:	50                   	push   %rax
 21b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 222 <x87_FPU_error+0xa>
 222:	48 87 04 24          	xchg   %rax,(%rsp)
 226:	e9 75 fe ff ff       	jmpq   a0 <error_code>

000000000000022b <alignment_check>:
 22b:	50                   	push   %rax
 22c:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 233 <alignment_check+0x8>
 233:	48 87 04 24          	xchg   %rax,(%rsp)
 237:	e9 64 fe ff ff       	jmpq   a0 <error_code>

000000000000023c <machine_check>:
 23c:	6a 00                	pushq  $0x0
 23e:	50                   	push   %rax
 23f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 246 <machine_check+0xa>
 246:	48 87 04 24          	xchg   %rax,(%rsp)
 24a:	e9 51 fe ff ff       	jmpq   a0 <error_code>

000000000000024f <SIMD_exception>:
 24f:	6a 00                	pushq  $0x0
 251:	50                   	push   %rax
 252:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 259 <SIMD_exception+0xa>
 259:	48 87 04 24          	xchg   %rax,(%rsp)
 25d:	e9 3e fe ff ff       	jmpq   a0 <error_code>

0000000000000262 <virtualization_exception>:
 262:	6a 00                	pushq  $0x0
 264:	50                   	push   %rax
 265:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 26c <virtualization_exception+0xa>
 26c:	48 87 04 24          	xchg   %rax,(%rsp)
 270:	e9 2b fe ff ff       	jmpq   a0 <error_code>
