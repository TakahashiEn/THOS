
interrupt.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <io_in8>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	89 f8                	mov    %edi,%eax
   6:	66 89 45 ec          	mov    %ax,-0x14(%rbp)
   a:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
   e:	0f b7 45 ec          	movzwl -0x14(%rbp),%eax
  12:	89 c2                	mov    %eax,%edx
  14:	ec                   	in     (%dx),%al
  15:	0f ae f0             	mfence 
  18:	88 45 ff             	mov    %al,-0x1(%rbp)
  1b:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
  1f:	5d                   	pop    %rbp
  20:	c3                   	retq   

0000000000000021 <io_out8>:
  21:	55                   	push   %rbp
  22:	48 89 e5             	mov    %rsp,%rbp
  25:	89 f8                	mov    %edi,%eax
  27:	89 f2                	mov    %esi,%edx
  29:	66 89 45 fc          	mov    %ax,-0x4(%rbp)
  2d:	89 d0                	mov    %edx,%eax
  2f:	88 45 f8             	mov    %al,-0x8(%rbp)
  32:	0f b6 45 f8          	movzbl -0x8(%rbp),%eax
  36:	0f b7 55 fc          	movzwl -0x4(%rbp),%edx
  3a:	ee                   	out    %al,(%dx)
  3b:	0f ae f0             	mfence 
  3e:	90                   	nop
  3f:	5d                   	pop    %rbp
  40:	c3                   	retq   

0000000000000041 <set_intr_gate>:
  41:	55                   	push   %rbp
  42:	48 89 e5             	mov    %rsp,%rbp
  45:	89 7d ec             	mov    %edi,-0x14(%rbp)
  48:	89 f0                	mov    %esi,%eax
  4a:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
  4e:	88 45 e8             	mov    %al,-0x18(%rbp)
  51:	8b 45 ec             	mov    -0x14(%rbp),%eax
  54:	48 c1 e0 04          	shl    $0x4,%rax
  58:	48 89 c2             	mov    %rax,%rdx
  5b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
  62:	00 00 00 
  65:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
  69:	8b 45 ec             	mov    -0x14(%rbp),%eax
  6c:	48 c1 e0 04          	shl    $0x4,%rax
  70:	48 8d 50 08          	lea    0x8(%rax),%rdx
  74:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
  7b:	00 00 00 
  7e:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
  82:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  86:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
  8c:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
  90:	48 89 c2             	mov    %rax,%rdx
  93:	44 89 c0             	mov    %r8d,%eax
  96:	66 89 d0             	mov    %dx,%ax
  99:	48 83 e1 07          	and    $0x7,%rcx
  9d:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
  a4:	48 c1 e1 20          	shl    $0x20,%rcx
  a8:	48 01 c8             	add    %rcx,%rax
  ab:	48 31 c9             	xor    %rcx,%rcx
  ae:	89 d1                	mov    %edx,%ecx
  b0:	48 c1 e9 10          	shr    $0x10,%rcx
  b4:	48 c1 e1 30          	shl    $0x30,%rcx
  b8:	48 01 c8             	add    %rcx,%rax
  bb:	48 89 06             	mov    %rax,(%rsi)
  be:	48 c1 ea 20          	shr    $0x20,%rdx
  c2:	48 89 17             	mov    %rdx,(%rdi)
  c5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  c9:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
  cd:	90                   	nop
  ce:	5d                   	pop    %rbp
  cf:	c3                   	retq   

00000000000000d0 <set_tss64>:
  d0:	55                   	push   %rbp
  d1:	48 89 e5             	mov    %rsp,%rbp
  d4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  d8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  dc:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  e0:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  e4:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
  e8:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  ec:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  f3:	00 00 00 
  f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  fa:	48 89 02             	mov    %rax,(%rdx)
  fd:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 104:	00 00 00 
 107:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 10b:	48 89 02             	mov    %rax,(%rdx)
 10e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 115:	00 00 00 
 118:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 11c:	48 89 02             	mov    %rax,(%rdx)
 11f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 126:	00 00 00 
 129:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 12d:	48 89 02             	mov    %rax,(%rdx)
 130:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 137:	00 00 00 
 13a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 13e:	48 89 02             	mov    %rax,(%rdx)
 141:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 148:	00 00 00 
 14b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 14f:	48 89 02             	mov    %rax,(%rdx)
 152:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 159:	00 00 00 
 15c:	48 8b 45 10          	mov    0x10(%rbp),%rax
 160:	48 89 02             	mov    %rax,(%rdx)
 163:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 16a:	00 00 00 
 16d:	48 8b 45 18          	mov    0x18(%rbp),%rax
 171:	48 89 02             	mov    %rax,(%rdx)
 174:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 17b:	00 00 00 
 17e:	48 8b 45 20          	mov    0x20(%rbp),%rax
 182:	48 89 02             	mov    %rax,(%rdx)
 185:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 18c:	00 00 00 
 18f:	48 8b 45 28          	mov    0x28(%rbp),%rax
 193:	48 89 02             	mov    %rax,(%rdx)
 196:	90                   	nop
 197:	5d                   	pop    %rbp
 198:	c3                   	retq   

0000000000000199 <IRQ0x20_interrupt>:
 199:	6a 00                	pushq  $0x0
 19b:	fc                   	cld    
 19c:	50                   	push   %rax
 19d:	50                   	push   %rax
 19e:	48 8c c0             	mov    %es,%rax
 1a1:	50                   	push   %rax
 1a2:	48 8c d8             	mov    %ds,%rax
 1a5:	50                   	push   %rax
 1a6:	48 31 c0             	xor    %rax,%rax
 1a9:	55                   	push   %rbp
 1aa:	57                   	push   %rdi
 1ab:	56                   	push   %rsi
 1ac:	52                   	push   %rdx
 1ad:	51                   	push   %rcx
 1ae:	53                   	push   %rbx
 1af:	41 50                	push   %r8
 1b1:	41 51                	push   %r9
 1b3:	41 52                	push   %r10
 1b5:	41 53                	push   %r11
 1b7:	41 54                	push   %r12
 1b9:	41 55                	push   %r13
 1bb:	41 56                	push   %r14
 1bd:	41 57                	push   %r15
 1bf:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 1c6:	48 8e da             	mov    %rdx,%ds
 1c9:	48 8e c2             	mov    %rdx,%es
 1cc:	48 89 e7             	mov    %rsp,%rdi
 1cf:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 1d6 <IRQ0x20_interrupt+0x3d>
 1d6:	50                   	push   %rax
 1d7:	48 c7 c6 20 00 00 00 	mov    $0x20,%rsi
 1de:	e9 f2 07 00 00       	jmpq   9d5 <do_IRQ>

00000000000001e3 <IRQ0x21_interrupt>:
 1e3:	6a 00                	pushq  $0x0
 1e5:	fc                   	cld    
 1e6:	50                   	push   %rax
 1e7:	50                   	push   %rax
 1e8:	48 8c c0             	mov    %es,%rax
 1eb:	50                   	push   %rax
 1ec:	48 8c d8             	mov    %ds,%rax
 1ef:	50                   	push   %rax
 1f0:	48 31 c0             	xor    %rax,%rax
 1f3:	55                   	push   %rbp
 1f4:	57                   	push   %rdi
 1f5:	56                   	push   %rsi
 1f6:	52                   	push   %rdx
 1f7:	51                   	push   %rcx
 1f8:	53                   	push   %rbx
 1f9:	41 50                	push   %r8
 1fb:	41 51                	push   %r9
 1fd:	41 52                	push   %r10
 1ff:	41 53                	push   %r11
 201:	41 54                	push   %r12
 203:	41 55                	push   %r13
 205:	41 56                	push   %r14
 207:	41 57                	push   %r15
 209:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 210:	48 8e da             	mov    %rdx,%ds
 213:	48 8e c2             	mov    %rdx,%es
 216:	48 89 e7             	mov    %rsp,%rdi
 219:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 220 <IRQ0x21_interrupt+0x3d>
 220:	50                   	push   %rax
 221:	48 c7 c6 21 00 00 00 	mov    $0x21,%rsi
 228:	e9 a8 07 00 00       	jmpq   9d5 <do_IRQ>

000000000000022d <IRQ0x22_interrupt>:
 22d:	6a 00                	pushq  $0x0
 22f:	fc                   	cld    
 230:	50                   	push   %rax
 231:	50                   	push   %rax
 232:	48 8c c0             	mov    %es,%rax
 235:	50                   	push   %rax
 236:	48 8c d8             	mov    %ds,%rax
 239:	50                   	push   %rax
 23a:	48 31 c0             	xor    %rax,%rax
 23d:	55                   	push   %rbp
 23e:	57                   	push   %rdi
 23f:	56                   	push   %rsi
 240:	52                   	push   %rdx
 241:	51                   	push   %rcx
 242:	53                   	push   %rbx
 243:	41 50                	push   %r8
 245:	41 51                	push   %r9
 247:	41 52                	push   %r10
 249:	41 53                	push   %r11
 24b:	41 54                	push   %r12
 24d:	41 55                	push   %r13
 24f:	41 56                	push   %r14
 251:	41 57                	push   %r15
 253:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 25a:	48 8e da             	mov    %rdx,%ds
 25d:	48 8e c2             	mov    %rdx,%es
 260:	48 89 e7             	mov    %rsp,%rdi
 263:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 26a <IRQ0x22_interrupt+0x3d>
 26a:	50                   	push   %rax
 26b:	48 c7 c6 22 00 00 00 	mov    $0x22,%rsi
 272:	e9 5e 07 00 00       	jmpq   9d5 <do_IRQ>

0000000000000277 <IRQ0x23_interrupt>:
 277:	6a 00                	pushq  $0x0
 279:	fc                   	cld    
 27a:	50                   	push   %rax
 27b:	50                   	push   %rax
 27c:	48 8c c0             	mov    %es,%rax
 27f:	50                   	push   %rax
 280:	48 8c d8             	mov    %ds,%rax
 283:	50                   	push   %rax
 284:	48 31 c0             	xor    %rax,%rax
 287:	55                   	push   %rbp
 288:	57                   	push   %rdi
 289:	56                   	push   %rsi
 28a:	52                   	push   %rdx
 28b:	51                   	push   %rcx
 28c:	53                   	push   %rbx
 28d:	41 50                	push   %r8
 28f:	41 51                	push   %r9
 291:	41 52                	push   %r10
 293:	41 53                	push   %r11
 295:	41 54                	push   %r12
 297:	41 55                	push   %r13
 299:	41 56                	push   %r14
 29b:	41 57                	push   %r15
 29d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 2a4:	48 8e da             	mov    %rdx,%ds
 2a7:	48 8e c2             	mov    %rdx,%es
 2aa:	48 89 e7             	mov    %rsp,%rdi
 2ad:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 2b4 <IRQ0x23_interrupt+0x3d>
 2b4:	50                   	push   %rax
 2b5:	48 c7 c6 23 00 00 00 	mov    $0x23,%rsi
 2bc:	e9 14 07 00 00       	jmpq   9d5 <do_IRQ>

00000000000002c1 <IRQ0x24_interrupt>:
 2c1:	6a 00                	pushq  $0x0
 2c3:	fc                   	cld    
 2c4:	50                   	push   %rax
 2c5:	50                   	push   %rax
 2c6:	48 8c c0             	mov    %es,%rax
 2c9:	50                   	push   %rax
 2ca:	48 8c d8             	mov    %ds,%rax
 2cd:	50                   	push   %rax
 2ce:	48 31 c0             	xor    %rax,%rax
 2d1:	55                   	push   %rbp
 2d2:	57                   	push   %rdi
 2d3:	56                   	push   %rsi
 2d4:	52                   	push   %rdx
 2d5:	51                   	push   %rcx
 2d6:	53                   	push   %rbx
 2d7:	41 50                	push   %r8
 2d9:	41 51                	push   %r9
 2db:	41 52                	push   %r10
 2dd:	41 53                	push   %r11
 2df:	41 54                	push   %r12
 2e1:	41 55                	push   %r13
 2e3:	41 56                	push   %r14
 2e5:	41 57                	push   %r15
 2e7:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 2ee:	48 8e da             	mov    %rdx,%ds
 2f1:	48 8e c2             	mov    %rdx,%es
 2f4:	48 89 e7             	mov    %rsp,%rdi
 2f7:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 2fe <IRQ0x24_interrupt+0x3d>
 2fe:	50                   	push   %rax
 2ff:	48 c7 c6 24 00 00 00 	mov    $0x24,%rsi
 306:	e9 ca 06 00 00       	jmpq   9d5 <do_IRQ>

000000000000030b <IRQ0x25_interrupt>:
 30b:	6a 00                	pushq  $0x0
 30d:	fc                   	cld    
 30e:	50                   	push   %rax
 30f:	50                   	push   %rax
 310:	48 8c c0             	mov    %es,%rax
 313:	50                   	push   %rax
 314:	48 8c d8             	mov    %ds,%rax
 317:	50                   	push   %rax
 318:	48 31 c0             	xor    %rax,%rax
 31b:	55                   	push   %rbp
 31c:	57                   	push   %rdi
 31d:	56                   	push   %rsi
 31e:	52                   	push   %rdx
 31f:	51                   	push   %rcx
 320:	53                   	push   %rbx
 321:	41 50                	push   %r8
 323:	41 51                	push   %r9
 325:	41 52                	push   %r10
 327:	41 53                	push   %r11
 329:	41 54                	push   %r12
 32b:	41 55                	push   %r13
 32d:	41 56                	push   %r14
 32f:	41 57                	push   %r15
 331:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 338:	48 8e da             	mov    %rdx,%ds
 33b:	48 8e c2             	mov    %rdx,%es
 33e:	48 89 e7             	mov    %rsp,%rdi
 341:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 348 <IRQ0x25_interrupt+0x3d>
 348:	50                   	push   %rax
 349:	48 c7 c6 25 00 00 00 	mov    $0x25,%rsi
 350:	e9 80 06 00 00       	jmpq   9d5 <do_IRQ>

0000000000000355 <IRQ0x26_interrupt>:
 355:	6a 00                	pushq  $0x0
 357:	fc                   	cld    
 358:	50                   	push   %rax
 359:	50                   	push   %rax
 35a:	48 8c c0             	mov    %es,%rax
 35d:	50                   	push   %rax
 35e:	48 8c d8             	mov    %ds,%rax
 361:	50                   	push   %rax
 362:	48 31 c0             	xor    %rax,%rax
 365:	55                   	push   %rbp
 366:	57                   	push   %rdi
 367:	56                   	push   %rsi
 368:	52                   	push   %rdx
 369:	51                   	push   %rcx
 36a:	53                   	push   %rbx
 36b:	41 50                	push   %r8
 36d:	41 51                	push   %r9
 36f:	41 52                	push   %r10
 371:	41 53                	push   %r11
 373:	41 54                	push   %r12
 375:	41 55                	push   %r13
 377:	41 56                	push   %r14
 379:	41 57                	push   %r15
 37b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 382:	48 8e da             	mov    %rdx,%ds
 385:	48 8e c2             	mov    %rdx,%es
 388:	48 89 e7             	mov    %rsp,%rdi
 38b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 392 <IRQ0x26_interrupt+0x3d>
 392:	50                   	push   %rax
 393:	48 c7 c6 26 00 00 00 	mov    $0x26,%rsi
 39a:	e9 36 06 00 00       	jmpq   9d5 <do_IRQ>

000000000000039f <IRQ0x27_interrupt>:
 39f:	6a 00                	pushq  $0x0
 3a1:	fc                   	cld    
 3a2:	50                   	push   %rax
 3a3:	50                   	push   %rax
 3a4:	48 8c c0             	mov    %es,%rax
 3a7:	50                   	push   %rax
 3a8:	48 8c d8             	mov    %ds,%rax
 3ab:	50                   	push   %rax
 3ac:	48 31 c0             	xor    %rax,%rax
 3af:	55                   	push   %rbp
 3b0:	57                   	push   %rdi
 3b1:	56                   	push   %rsi
 3b2:	52                   	push   %rdx
 3b3:	51                   	push   %rcx
 3b4:	53                   	push   %rbx
 3b5:	41 50                	push   %r8
 3b7:	41 51                	push   %r9
 3b9:	41 52                	push   %r10
 3bb:	41 53                	push   %r11
 3bd:	41 54                	push   %r12
 3bf:	41 55                	push   %r13
 3c1:	41 56                	push   %r14
 3c3:	41 57                	push   %r15
 3c5:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 3cc:	48 8e da             	mov    %rdx,%ds
 3cf:	48 8e c2             	mov    %rdx,%es
 3d2:	48 89 e7             	mov    %rsp,%rdi
 3d5:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 3dc <IRQ0x27_interrupt+0x3d>
 3dc:	50                   	push   %rax
 3dd:	48 c7 c6 27 00 00 00 	mov    $0x27,%rsi
 3e4:	e9 ec 05 00 00       	jmpq   9d5 <do_IRQ>

00000000000003e9 <IRQ0x28_interrupt>:
 3e9:	6a 00                	pushq  $0x0
 3eb:	fc                   	cld    
 3ec:	50                   	push   %rax
 3ed:	50                   	push   %rax
 3ee:	48 8c c0             	mov    %es,%rax
 3f1:	50                   	push   %rax
 3f2:	48 8c d8             	mov    %ds,%rax
 3f5:	50                   	push   %rax
 3f6:	48 31 c0             	xor    %rax,%rax
 3f9:	55                   	push   %rbp
 3fa:	57                   	push   %rdi
 3fb:	56                   	push   %rsi
 3fc:	52                   	push   %rdx
 3fd:	51                   	push   %rcx
 3fe:	53                   	push   %rbx
 3ff:	41 50                	push   %r8
 401:	41 51                	push   %r9
 403:	41 52                	push   %r10
 405:	41 53                	push   %r11
 407:	41 54                	push   %r12
 409:	41 55                	push   %r13
 40b:	41 56                	push   %r14
 40d:	41 57                	push   %r15
 40f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 416:	48 8e da             	mov    %rdx,%ds
 419:	48 8e c2             	mov    %rdx,%es
 41c:	48 89 e7             	mov    %rsp,%rdi
 41f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 426 <IRQ0x28_interrupt+0x3d>
 426:	50                   	push   %rax
 427:	48 c7 c6 28 00 00 00 	mov    $0x28,%rsi
 42e:	e9 a2 05 00 00       	jmpq   9d5 <do_IRQ>

0000000000000433 <IRQ0x29_interrupt>:
 433:	6a 00                	pushq  $0x0
 435:	fc                   	cld    
 436:	50                   	push   %rax
 437:	50                   	push   %rax
 438:	48 8c c0             	mov    %es,%rax
 43b:	50                   	push   %rax
 43c:	48 8c d8             	mov    %ds,%rax
 43f:	50                   	push   %rax
 440:	48 31 c0             	xor    %rax,%rax
 443:	55                   	push   %rbp
 444:	57                   	push   %rdi
 445:	56                   	push   %rsi
 446:	52                   	push   %rdx
 447:	51                   	push   %rcx
 448:	53                   	push   %rbx
 449:	41 50                	push   %r8
 44b:	41 51                	push   %r9
 44d:	41 52                	push   %r10
 44f:	41 53                	push   %r11
 451:	41 54                	push   %r12
 453:	41 55                	push   %r13
 455:	41 56                	push   %r14
 457:	41 57                	push   %r15
 459:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 460:	48 8e da             	mov    %rdx,%ds
 463:	48 8e c2             	mov    %rdx,%es
 466:	48 89 e7             	mov    %rsp,%rdi
 469:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 470 <IRQ0x29_interrupt+0x3d>
 470:	50                   	push   %rax
 471:	48 c7 c6 29 00 00 00 	mov    $0x29,%rsi
 478:	e9 58 05 00 00       	jmpq   9d5 <do_IRQ>

000000000000047d <IRQ0x2a_interrupt>:
 47d:	6a 00                	pushq  $0x0
 47f:	fc                   	cld    
 480:	50                   	push   %rax
 481:	50                   	push   %rax
 482:	48 8c c0             	mov    %es,%rax
 485:	50                   	push   %rax
 486:	48 8c d8             	mov    %ds,%rax
 489:	50                   	push   %rax
 48a:	48 31 c0             	xor    %rax,%rax
 48d:	55                   	push   %rbp
 48e:	57                   	push   %rdi
 48f:	56                   	push   %rsi
 490:	52                   	push   %rdx
 491:	51                   	push   %rcx
 492:	53                   	push   %rbx
 493:	41 50                	push   %r8
 495:	41 51                	push   %r9
 497:	41 52                	push   %r10
 499:	41 53                	push   %r11
 49b:	41 54                	push   %r12
 49d:	41 55                	push   %r13
 49f:	41 56                	push   %r14
 4a1:	41 57                	push   %r15
 4a3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 4aa:	48 8e da             	mov    %rdx,%ds
 4ad:	48 8e c2             	mov    %rdx,%es
 4b0:	48 89 e7             	mov    %rsp,%rdi
 4b3:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 4ba <IRQ0x2a_interrupt+0x3d>
 4ba:	50                   	push   %rax
 4bb:	48 c7 c6 2a 00 00 00 	mov    $0x2a,%rsi
 4c2:	e9 0e 05 00 00       	jmpq   9d5 <do_IRQ>

00000000000004c7 <IRQ0x2b_interrupt>:
 4c7:	6a 00                	pushq  $0x0
 4c9:	fc                   	cld    
 4ca:	50                   	push   %rax
 4cb:	50                   	push   %rax
 4cc:	48 8c c0             	mov    %es,%rax
 4cf:	50                   	push   %rax
 4d0:	48 8c d8             	mov    %ds,%rax
 4d3:	50                   	push   %rax
 4d4:	48 31 c0             	xor    %rax,%rax
 4d7:	55                   	push   %rbp
 4d8:	57                   	push   %rdi
 4d9:	56                   	push   %rsi
 4da:	52                   	push   %rdx
 4db:	51                   	push   %rcx
 4dc:	53                   	push   %rbx
 4dd:	41 50                	push   %r8
 4df:	41 51                	push   %r9
 4e1:	41 52                	push   %r10
 4e3:	41 53                	push   %r11
 4e5:	41 54                	push   %r12
 4e7:	41 55                	push   %r13
 4e9:	41 56                	push   %r14
 4eb:	41 57                	push   %r15
 4ed:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 4f4:	48 8e da             	mov    %rdx,%ds
 4f7:	48 8e c2             	mov    %rdx,%es
 4fa:	48 89 e7             	mov    %rsp,%rdi
 4fd:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 504 <IRQ0x2b_interrupt+0x3d>
 504:	50                   	push   %rax
 505:	48 c7 c6 2b 00 00 00 	mov    $0x2b,%rsi
 50c:	e9 c4 04 00 00       	jmpq   9d5 <do_IRQ>

0000000000000511 <IRQ0x2c_interrupt>:
 511:	6a 00                	pushq  $0x0
 513:	fc                   	cld    
 514:	50                   	push   %rax
 515:	50                   	push   %rax
 516:	48 8c c0             	mov    %es,%rax
 519:	50                   	push   %rax
 51a:	48 8c d8             	mov    %ds,%rax
 51d:	50                   	push   %rax
 51e:	48 31 c0             	xor    %rax,%rax
 521:	55                   	push   %rbp
 522:	57                   	push   %rdi
 523:	56                   	push   %rsi
 524:	52                   	push   %rdx
 525:	51                   	push   %rcx
 526:	53                   	push   %rbx
 527:	41 50                	push   %r8
 529:	41 51                	push   %r9
 52b:	41 52                	push   %r10
 52d:	41 53                	push   %r11
 52f:	41 54                	push   %r12
 531:	41 55                	push   %r13
 533:	41 56                	push   %r14
 535:	41 57                	push   %r15
 537:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 53e:	48 8e da             	mov    %rdx,%ds
 541:	48 8e c2             	mov    %rdx,%es
 544:	48 89 e7             	mov    %rsp,%rdi
 547:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 54e <IRQ0x2c_interrupt+0x3d>
 54e:	50                   	push   %rax
 54f:	48 c7 c6 2c 00 00 00 	mov    $0x2c,%rsi
 556:	e9 7a 04 00 00       	jmpq   9d5 <do_IRQ>

000000000000055b <IRQ0x2d_interrupt>:
 55b:	6a 00                	pushq  $0x0
 55d:	fc                   	cld    
 55e:	50                   	push   %rax
 55f:	50                   	push   %rax
 560:	48 8c c0             	mov    %es,%rax
 563:	50                   	push   %rax
 564:	48 8c d8             	mov    %ds,%rax
 567:	50                   	push   %rax
 568:	48 31 c0             	xor    %rax,%rax
 56b:	55                   	push   %rbp
 56c:	57                   	push   %rdi
 56d:	56                   	push   %rsi
 56e:	52                   	push   %rdx
 56f:	51                   	push   %rcx
 570:	53                   	push   %rbx
 571:	41 50                	push   %r8
 573:	41 51                	push   %r9
 575:	41 52                	push   %r10
 577:	41 53                	push   %r11
 579:	41 54                	push   %r12
 57b:	41 55                	push   %r13
 57d:	41 56                	push   %r14
 57f:	41 57                	push   %r15
 581:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 588:	48 8e da             	mov    %rdx,%ds
 58b:	48 8e c2             	mov    %rdx,%es
 58e:	48 89 e7             	mov    %rsp,%rdi
 591:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 598 <IRQ0x2d_interrupt+0x3d>
 598:	50                   	push   %rax
 599:	48 c7 c6 2d 00 00 00 	mov    $0x2d,%rsi
 5a0:	e9 30 04 00 00       	jmpq   9d5 <do_IRQ>

00000000000005a5 <IRQ0x2e_interrupt>:
 5a5:	6a 00                	pushq  $0x0
 5a7:	fc                   	cld    
 5a8:	50                   	push   %rax
 5a9:	50                   	push   %rax
 5aa:	48 8c c0             	mov    %es,%rax
 5ad:	50                   	push   %rax
 5ae:	48 8c d8             	mov    %ds,%rax
 5b1:	50                   	push   %rax
 5b2:	48 31 c0             	xor    %rax,%rax
 5b5:	55                   	push   %rbp
 5b6:	57                   	push   %rdi
 5b7:	56                   	push   %rsi
 5b8:	52                   	push   %rdx
 5b9:	51                   	push   %rcx
 5ba:	53                   	push   %rbx
 5bb:	41 50                	push   %r8
 5bd:	41 51                	push   %r9
 5bf:	41 52                	push   %r10
 5c1:	41 53                	push   %r11
 5c3:	41 54                	push   %r12
 5c5:	41 55                	push   %r13
 5c7:	41 56                	push   %r14
 5c9:	41 57                	push   %r15
 5cb:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 5d2:	48 8e da             	mov    %rdx,%ds
 5d5:	48 8e c2             	mov    %rdx,%es
 5d8:	48 89 e7             	mov    %rsp,%rdi
 5db:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 5e2 <IRQ0x2e_interrupt+0x3d>
 5e2:	50                   	push   %rax
 5e3:	48 c7 c6 2e 00 00 00 	mov    $0x2e,%rsi
 5ea:	e9 e6 03 00 00       	jmpq   9d5 <do_IRQ>

00000000000005ef <IRQ0x2f_interrupt>:
 5ef:	6a 00                	pushq  $0x0
 5f1:	fc                   	cld    
 5f2:	50                   	push   %rax
 5f3:	50                   	push   %rax
 5f4:	48 8c c0             	mov    %es,%rax
 5f7:	50                   	push   %rax
 5f8:	48 8c d8             	mov    %ds,%rax
 5fb:	50                   	push   %rax
 5fc:	48 31 c0             	xor    %rax,%rax
 5ff:	55                   	push   %rbp
 600:	57                   	push   %rdi
 601:	56                   	push   %rsi
 602:	52                   	push   %rdx
 603:	51                   	push   %rcx
 604:	53                   	push   %rbx
 605:	41 50                	push   %r8
 607:	41 51                	push   %r9
 609:	41 52                	push   %r10
 60b:	41 53                	push   %r11
 60d:	41 54                	push   %r12
 60f:	41 55                	push   %r13
 611:	41 56                	push   %r14
 613:	41 57                	push   %r15
 615:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 61c:	48 8e da             	mov    %rdx,%ds
 61f:	48 8e c2             	mov    %rdx,%es
 622:	48 89 e7             	mov    %rsp,%rdi
 625:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 62c <IRQ0x2f_interrupt+0x3d>
 62c:	50                   	push   %rax
 62d:	48 c7 c6 2f 00 00 00 	mov    $0x2f,%rsi
 634:	e9 9c 03 00 00       	jmpq   9d5 <do_IRQ>

0000000000000639 <IRQ0x30_interrupt>:
 639:	6a 00                	pushq  $0x0
 63b:	fc                   	cld    
 63c:	50                   	push   %rax
 63d:	50                   	push   %rax
 63e:	48 8c c0             	mov    %es,%rax
 641:	50                   	push   %rax
 642:	48 8c d8             	mov    %ds,%rax
 645:	50                   	push   %rax
 646:	48 31 c0             	xor    %rax,%rax
 649:	55                   	push   %rbp
 64a:	57                   	push   %rdi
 64b:	56                   	push   %rsi
 64c:	52                   	push   %rdx
 64d:	51                   	push   %rcx
 64e:	53                   	push   %rbx
 64f:	41 50                	push   %r8
 651:	41 51                	push   %r9
 653:	41 52                	push   %r10
 655:	41 53                	push   %r11
 657:	41 54                	push   %r12
 659:	41 55                	push   %r13
 65b:	41 56                	push   %r14
 65d:	41 57                	push   %r15
 65f:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 666:	48 8e da             	mov    %rdx,%ds
 669:	48 8e c2             	mov    %rdx,%es
 66c:	48 89 e7             	mov    %rsp,%rdi
 66f:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 676 <IRQ0x30_interrupt+0x3d>
 676:	50                   	push   %rax
 677:	48 c7 c6 30 00 00 00 	mov    $0x30,%rsi
 67e:	e9 52 03 00 00       	jmpq   9d5 <do_IRQ>

0000000000000683 <IRQ0x31_interrupt>:
 683:	6a 00                	pushq  $0x0
 685:	fc                   	cld    
 686:	50                   	push   %rax
 687:	50                   	push   %rax
 688:	48 8c c0             	mov    %es,%rax
 68b:	50                   	push   %rax
 68c:	48 8c d8             	mov    %ds,%rax
 68f:	50                   	push   %rax
 690:	48 31 c0             	xor    %rax,%rax
 693:	55                   	push   %rbp
 694:	57                   	push   %rdi
 695:	56                   	push   %rsi
 696:	52                   	push   %rdx
 697:	51                   	push   %rcx
 698:	53                   	push   %rbx
 699:	41 50                	push   %r8
 69b:	41 51                	push   %r9
 69d:	41 52                	push   %r10
 69f:	41 53                	push   %r11
 6a1:	41 54                	push   %r12
 6a3:	41 55                	push   %r13
 6a5:	41 56                	push   %r14
 6a7:	41 57                	push   %r15
 6a9:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 6b0:	48 8e da             	mov    %rdx,%ds
 6b3:	48 8e c2             	mov    %rdx,%es
 6b6:	48 89 e7             	mov    %rsp,%rdi
 6b9:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 6c0 <IRQ0x31_interrupt+0x3d>
 6c0:	50                   	push   %rax
 6c1:	48 c7 c6 31 00 00 00 	mov    $0x31,%rsi
 6c8:	e9 08 03 00 00       	jmpq   9d5 <do_IRQ>

00000000000006cd <IRQ0x32_interrupt>:
 6cd:	6a 00                	pushq  $0x0
 6cf:	fc                   	cld    
 6d0:	50                   	push   %rax
 6d1:	50                   	push   %rax
 6d2:	48 8c c0             	mov    %es,%rax
 6d5:	50                   	push   %rax
 6d6:	48 8c d8             	mov    %ds,%rax
 6d9:	50                   	push   %rax
 6da:	48 31 c0             	xor    %rax,%rax
 6dd:	55                   	push   %rbp
 6de:	57                   	push   %rdi
 6df:	56                   	push   %rsi
 6e0:	52                   	push   %rdx
 6e1:	51                   	push   %rcx
 6e2:	53                   	push   %rbx
 6e3:	41 50                	push   %r8
 6e5:	41 51                	push   %r9
 6e7:	41 52                	push   %r10
 6e9:	41 53                	push   %r11
 6eb:	41 54                	push   %r12
 6ed:	41 55                	push   %r13
 6ef:	41 56                	push   %r14
 6f1:	41 57                	push   %r15
 6f3:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 6fa:	48 8e da             	mov    %rdx,%ds
 6fd:	48 8e c2             	mov    %rdx,%es
 700:	48 89 e7             	mov    %rsp,%rdi
 703:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 70a <IRQ0x32_interrupt+0x3d>
 70a:	50                   	push   %rax
 70b:	48 c7 c6 32 00 00 00 	mov    $0x32,%rsi
 712:	e9 be 02 00 00       	jmpq   9d5 <do_IRQ>

0000000000000717 <IRQ0x33_interrupt>:
 717:	6a 00                	pushq  $0x0
 719:	fc                   	cld    
 71a:	50                   	push   %rax
 71b:	50                   	push   %rax
 71c:	48 8c c0             	mov    %es,%rax
 71f:	50                   	push   %rax
 720:	48 8c d8             	mov    %ds,%rax
 723:	50                   	push   %rax
 724:	48 31 c0             	xor    %rax,%rax
 727:	55                   	push   %rbp
 728:	57                   	push   %rdi
 729:	56                   	push   %rsi
 72a:	52                   	push   %rdx
 72b:	51                   	push   %rcx
 72c:	53                   	push   %rbx
 72d:	41 50                	push   %r8
 72f:	41 51                	push   %r9
 731:	41 52                	push   %r10
 733:	41 53                	push   %r11
 735:	41 54                	push   %r12
 737:	41 55                	push   %r13
 739:	41 56                	push   %r14
 73b:	41 57                	push   %r15
 73d:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 744:	48 8e da             	mov    %rdx,%ds
 747:	48 8e c2             	mov    %rdx,%es
 74a:	48 89 e7             	mov    %rsp,%rdi
 74d:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 754 <IRQ0x33_interrupt+0x3d>
 754:	50                   	push   %rax
 755:	48 c7 c6 33 00 00 00 	mov    $0x33,%rsi
 75c:	e9 74 02 00 00       	jmpq   9d5 <do_IRQ>

0000000000000761 <IRQ0x34_interrupt>:
 761:	6a 00                	pushq  $0x0
 763:	fc                   	cld    
 764:	50                   	push   %rax
 765:	50                   	push   %rax
 766:	48 8c c0             	mov    %es,%rax
 769:	50                   	push   %rax
 76a:	48 8c d8             	mov    %ds,%rax
 76d:	50                   	push   %rax
 76e:	48 31 c0             	xor    %rax,%rax
 771:	55                   	push   %rbp
 772:	57                   	push   %rdi
 773:	56                   	push   %rsi
 774:	52                   	push   %rdx
 775:	51                   	push   %rcx
 776:	53                   	push   %rbx
 777:	41 50                	push   %r8
 779:	41 51                	push   %r9
 77b:	41 52                	push   %r10
 77d:	41 53                	push   %r11
 77f:	41 54                	push   %r12
 781:	41 55                	push   %r13
 783:	41 56                	push   %r14
 785:	41 57                	push   %r15
 787:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 78e:	48 8e da             	mov    %rdx,%ds
 791:	48 8e c2             	mov    %rdx,%es
 794:	48 89 e7             	mov    %rsp,%rdi
 797:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 79e <IRQ0x34_interrupt+0x3d>
 79e:	50                   	push   %rax
 79f:	48 c7 c6 34 00 00 00 	mov    $0x34,%rsi
 7a6:	e9 2a 02 00 00       	jmpq   9d5 <do_IRQ>

00000000000007ab <IRQ0x35_interrupt>:
 7ab:	6a 00                	pushq  $0x0
 7ad:	fc                   	cld    
 7ae:	50                   	push   %rax
 7af:	50                   	push   %rax
 7b0:	48 8c c0             	mov    %es,%rax
 7b3:	50                   	push   %rax
 7b4:	48 8c d8             	mov    %ds,%rax
 7b7:	50                   	push   %rax
 7b8:	48 31 c0             	xor    %rax,%rax
 7bb:	55                   	push   %rbp
 7bc:	57                   	push   %rdi
 7bd:	56                   	push   %rsi
 7be:	52                   	push   %rdx
 7bf:	51                   	push   %rcx
 7c0:	53                   	push   %rbx
 7c1:	41 50                	push   %r8
 7c3:	41 51                	push   %r9
 7c5:	41 52                	push   %r10
 7c7:	41 53                	push   %r11
 7c9:	41 54                	push   %r12
 7cb:	41 55                	push   %r13
 7cd:	41 56                	push   %r14
 7cf:	41 57                	push   %r15
 7d1:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 7d8:	48 8e da             	mov    %rdx,%ds
 7db:	48 8e c2             	mov    %rdx,%es
 7de:	48 89 e7             	mov    %rsp,%rdi
 7e1:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 7e8 <IRQ0x35_interrupt+0x3d>
 7e8:	50                   	push   %rax
 7e9:	48 c7 c6 35 00 00 00 	mov    $0x35,%rsi
 7f0:	e9 e0 01 00 00       	jmpq   9d5 <do_IRQ>

00000000000007f5 <IRQ0x36_interrupt>:
 7f5:	6a 00                	pushq  $0x0
 7f7:	fc                   	cld    
 7f8:	50                   	push   %rax
 7f9:	50                   	push   %rax
 7fa:	48 8c c0             	mov    %es,%rax
 7fd:	50                   	push   %rax
 7fe:	48 8c d8             	mov    %ds,%rax
 801:	50                   	push   %rax
 802:	48 31 c0             	xor    %rax,%rax
 805:	55                   	push   %rbp
 806:	57                   	push   %rdi
 807:	56                   	push   %rsi
 808:	52                   	push   %rdx
 809:	51                   	push   %rcx
 80a:	53                   	push   %rbx
 80b:	41 50                	push   %r8
 80d:	41 51                	push   %r9
 80f:	41 52                	push   %r10
 811:	41 53                	push   %r11
 813:	41 54                	push   %r12
 815:	41 55                	push   %r13
 817:	41 56                	push   %r14
 819:	41 57                	push   %r15
 81b:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 822:	48 8e da             	mov    %rdx,%ds
 825:	48 8e c2             	mov    %rdx,%es
 828:	48 89 e7             	mov    %rsp,%rdi
 82b:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 832 <IRQ0x36_interrupt+0x3d>
 832:	50                   	push   %rax
 833:	48 c7 c6 36 00 00 00 	mov    $0x36,%rsi
 83a:	e9 96 01 00 00       	jmpq   9d5 <do_IRQ>

000000000000083f <IRQ0x37_interrupt>:
 83f:	6a 00                	pushq  $0x0
 841:	fc                   	cld    
 842:	50                   	push   %rax
 843:	50                   	push   %rax
 844:	48 8c c0             	mov    %es,%rax
 847:	50                   	push   %rax
 848:	48 8c d8             	mov    %ds,%rax
 84b:	50                   	push   %rax
 84c:	48 31 c0             	xor    %rax,%rax
 84f:	55                   	push   %rbp
 850:	57                   	push   %rdi
 851:	56                   	push   %rsi
 852:	52                   	push   %rdx
 853:	51                   	push   %rcx
 854:	53                   	push   %rbx
 855:	41 50                	push   %r8
 857:	41 51                	push   %r9
 859:	41 52                	push   %r10
 85b:	41 53                	push   %r11
 85d:	41 54                	push   %r12
 85f:	41 55                	push   %r13
 861:	41 56                	push   %r14
 863:	41 57                	push   %r15
 865:	48 c7 c2 10 00 00 00 	mov    $0x10,%rdx
 86c:	48 8e da             	mov    %rdx,%ds
 86f:	48 8e c2             	mov    %rdx,%es
 872:	48 89 e7             	mov    %rsp,%rdi
 875:	48 8d 05 00 00 00 00 	lea    0x0(%rip),%rax        # 87c <IRQ0x37_interrupt+0x3d>
 87c:	50                   	push   %rax
 87d:	48 c7 c6 37 00 00 00 	mov    $0x37,%rsi
 884:	e9 4c 01 00 00       	jmpq   9d5 <do_IRQ>

0000000000000889 <init_interrupt>:
 889:	55                   	push   %rbp
 88a:	48 89 e5             	mov    %rsp,%rbp
 88d:	48 83 ec 10          	sub    $0x10,%rsp
 891:	c7 45 fc 20 00 00 00 	movl   $0x20,-0x4(%rbp)
 898:	eb 30                	jmp    8ca <init_interrupt+0x41>
 89a:	8b 45 fc             	mov    -0x4(%rbp),%eax
 89d:	83 e8 20             	sub    $0x20,%eax
 8a0:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 8a7:	00 00 00 
 8aa:	48 98                	cltq   
 8ac:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
 8b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
 8b3:	be 02 00 00 00       	mov    $0x2,%esi
 8b8:	89 c7                	mov    %eax,%edi
 8ba:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8c1:	00 00 00 
 8c4:	ff d0                	callq  *%rax
 8c6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 8ca:	83 7d fc 37          	cmpl   $0x37,-0x4(%rbp)
 8ce:	7e ca                	jle    89a <init_interrupt+0x11>
 8d0:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 8d7:	00 00 00 
 8da:	be 00 00 00 00       	mov    $0x0,%esi
 8df:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 8e4:	b8 00 00 00 00       	mov    $0x0,%eax
 8e9:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 8f0:	00 00 00 
 8f3:	ff d1                	callq  *%rcx
 8f5:	be 11 00 00 00       	mov    $0x11,%esi
 8fa:	bf 20 00 00 00       	mov    $0x20,%edi
 8ff:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 906:	00 00 00 
 909:	ff d0                	callq  *%rax
 90b:	be 20 00 00 00       	mov    $0x20,%esi
 910:	bf 21 00 00 00       	mov    $0x21,%edi
 915:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 91c:	00 00 00 
 91f:	ff d0                	callq  *%rax
 921:	be 04 00 00 00       	mov    $0x4,%esi
 926:	bf 21 00 00 00       	mov    $0x21,%edi
 92b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 932:	00 00 00 
 935:	ff d0                	callq  *%rax
 937:	be 01 00 00 00       	mov    $0x1,%esi
 93c:	bf 21 00 00 00       	mov    $0x21,%edi
 941:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 948:	00 00 00 
 94b:	ff d0                	callq  *%rax
 94d:	be 11 00 00 00       	mov    $0x11,%esi
 952:	bf a0 00 00 00       	mov    $0xa0,%edi
 957:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 95e:	00 00 00 
 961:	ff d0                	callq  *%rax
 963:	be 28 00 00 00       	mov    $0x28,%esi
 968:	bf a1 00 00 00       	mov    $0xa1,%edi
 96d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 974:	00 00 00 
 977:	ff d0                	callq  *%rax
 979:	be 02 00 00 00       	mov    $0x2,%esi
 97e:	bf a1 00 00 00       	mov    $0xa1,%edi
 983:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 98a:	00 00 00 
 98d:	ff d0                	callq  *%rax
 98f:	be 01 00 00 00       	mov    $0x1,%esi
 994:	bf a1 00 00 00       	mov    $0xa1,%edi
 999:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 9a0:	00 00 00 
 9a3:	ff d0                	callq  *%rax
 9a5:	be fd 00 00 00       	mov    $0xfd,%esi
 9aa:	bf 21 00 00 00       	mov    $0x21,%edi
 9af:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 9b6:	00 00 00 
 9b9:	ff d0                	callq  *%rax
 9bb:	be ff 00 00 00       	mov    $0xff,%esi
 9c0:	bf a1 00 00 00       	mov    $0xa1,%edi
 9c5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 9cc:	00 00 00 
 9cf:	ff d0                	callq  *%rax
 9d1:	fb                   	sti    
 9d2:	90                   	nop
 9d3:	c9                   	leaveq 
 9d4:	c3                   	retq   

00000000000009d5 <do_IRQ>:
 9d5:	55                   	push   %rbp
 9d6:	48 89 e5             	mov    %rsp,%rbp
 9d9:	48 83 ec 20          	sub    $0x20,%rsp
 9dd:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 9e1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 9e5:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 9e9:	48 89 c1             	mov    %rax,%rcx
 9ec:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 9f3:	00 00 00 
 9f6:	be 00 00 00 00       	mov    $0x0,%esi
 9fb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 a00:	b8 00 00 00 00       	mov    $0x0,%eax
 a05:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 a0c:	00 00 00 
 a0f:	41 ff d0             	callq  *%r8
 a12:	bf 60 00 00 00       	mov    $0x60,%edi
 a17:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a1e:	00 00 00 
 a21:	ff d0                	callq  *%rax
 a23:	88 45 ff             	mov    %al,-0x1(%rbp)
 a26:	0f b6 45 ff          	movzbl -0x1(%rbp),%eax
 a2a:	89 c1                	mov    %eax,%ecx
 a2c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 a33:	00 00 00 
 a36:	be 00 00 00 00       	mov    $0x0,%esi
 a3b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 a40:	b8 00 00 00 00       	mov    $0x0,%eax
 a45:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 a4c:	00 00 00 
 a4f:	41 ff d0             	callq  *%r8
 a52:	be 20 00 00 00       	mov    $0x20,%esi
 a57:	bf 20 00 00 00       	mov    $0x20,%edi
 a5c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a63:	00 00 00 
 a66:	ff d0                	callq  *%rax
 a68:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 a6c:	48 8b 88 b0 00 00 00 	mov    0xb0(%rax),%rcx
 a73:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 a77:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
 a7e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 a82:	49 89 c9             	mov    %rcx,%r9
 a85:	49 89 d0             	mov    %rdx,%r8
 a88:	48 89 c1             	mov    %rax,%rcx
 a8b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 a92:	00 00 00 
 a95:	be 00 00 00 00       	mov    $0x0,%esi
 a9a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 a9f:	b8 00 00 00 00       	mov    $0x0,%eax
 aa4:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
 aab:	00 00 00 
 aae:	41 ff d2             	callq  *%r10
 ab1:	90                   	nop
 ab2:	c9                   	leaveq 
 ab3:	c3                   	retq   

Disassembly of section .data:

0000000000000000 <font_ascii>:
	...
     210:	00 10                	add    %dl,(%rax)
     212:	10 10                	adc    %dl,(%rax)
     214:	10 10                	adc    %dl,(%rax)
     216:	10 10                	adc    %dl,(%rax)
     218:	10 10                	adc    %dl,(%rax)
     21a:	00 00                	add    %al,(%rax)
     21c:	10 10                	adc    %dl,(%rax)
     21e:	00 00                	add    %al,(%rax)
     220:	28 28                	sub    %ch,(%rax)
     222:	28 00                	sub    %al,(%rax)
	...
     230:	00 44 44 44          	add    %al,0x44(%rsp,%rax,2)
     234:	fe 44 44 44          	incb   0x44(%rsp,%rax,2)
     238:	44                   	rex.R
     239:	44 fe 44 44 44       	rex.R incb 0x44(%rsp,%rax,2)
     23e:	00 00                	add    %al,(%rax)
     240:	10 3a                	adc    %bh,(%rdx)
     242:	56                   	push   %rsi
     243:	92                   	xchg   %eax,%edx
     244:	92                   	xchg   %eax,%edx
     245:	90                   	nop
     246:	50                   	push   %rax
     247:	38 14 12             	cmp    %dl,(%rdx,%rdx,1)
     24a:	92                   	xchg   %eax,%edx
     24b:	92                   	xchg   %eax,%edx
     24c:	d4                   	(bad)  
     24d:	b8 10 10 62 92       	mov    $0x92621010,%eax
     252:	94                   	xchg   %eax,%esp
     253:	94                   	xchg   %eax,%esp
     254:	68 08 10 10 20       	pushq  $0x20101008
     259:	2c 52                	sub    $0x52,%al
     25b:	52                   	push   %rdx
     25c:	92                   	xchg   %eax,%edx
     25d:	8c 00                	mov    %es,(%rax)
     25f:	00 00                	add    %al,(%rax)
     261:	70 88                	jo     1eb <font_ascii+0x1eb>
     263:	88 88 90 60 47 a2    	mov    %cl,-0x5db89f70(%rax)
     269:	92                   	xchg   %eax,%edx
     26a:	8a 84 46 39 00 00 04 	mov    0x4000039(%rsi,%rax,2),%al
     271:	08 10                	or     %dl,(%rax)
	...
     27f:	00 02                	add    %al,(%rdx)
     281:	04 08                	add    $0x8,%al
     283:	08 10                	or     %dl,(%rax)
     285:	10 10                	adc    %dl,(%rax)
     287:	10 10                	adc    %dl,(%rax)
     289:	10 10                	adc    %dl,(%rax)
     28b:	08 08                	or     %cl,(%rax)
     28d:	04 02                	add    $0x2,%al
     28f:	00 80 40 20 20 10    	add    %al,0x10202040(%rax)
     295:	10 10                	adc    %dl,(%rax)
     297:	10 10                	adc    %dl,(%rax)
     299:	10 10                	adc    %dl,(%rax)
     29b:	20 20                	and    %ah,(%rax)
     29d:	40 80 00 00          	rex addb $0x0,(%rax)
     2a1:	00 00                	add    %al,(%rax)
     2a3:	00 00                	add    %al,(%rax)
     2a5:	10 92 54 38 54 92    	adc    %dl,-0x6dabc7ac(%rdx)
     2ab:	10 00                	adc    %al,(%rax)
	...
     2b5:	10 10                	adc    %dl,(%rax)
     2b7:	10 fe                	adc    %bh,%dh
     2b9:	10 10                	adc    %dl,(%rax)
     2bb:	10 00                	adc    %al,(%rax)
	...
     2c9:	00 00                	add    %al,(%rax)
     2cb:	18 18                	sbb    %bl,(%rax)
     2cd:	08 08                	or     %cl,(%rax)
     2cf:	10 00                	adc    %al,(%rax)
     2d1:	00 00                	add    %al,(%rax)
     2d3:	00 00                	add    %al,(%rax)
     2d5:	00 00                	add    %al,(%rax)
     2d7:	00 fe                	add    %bh,%dh
	...
     2e9:	00 00                	add    %al,(%rax)
     2eb:	00 18                	add    %bl,(%rax)
     2ed:	18 00                	sbb    %al,(%rax)
     2ef:	00 02                	add    %al,(%rdx)
     2f1:	02 04 04             	add    (%rsp,%rax,1),%al
     2f4:	08 08                	or     %cl,(%rax)
     2f6:	08 10                	or     %dl,(%rax)
     2f8:	10 20                	adc    %ah,(%rax)
     2fa:	20 40 40             	and    %al,0x40(%rax)
     2fd:	40 80 80 00 18 24 24 	rex addb $0x42,0x24241800(%rax)
     304:	42 
     305:	42                   	rex.X
     306:	42                   	rex.X
     307:	42                   	rex.X
     308:	42                   	rex.X
     309:	42                   	rex.X
     30a:	42 24 24             	rex.X and $0x24,%al
     30d:	18 00                	sbb    %al,(%rax)
     30f:	00 00                	add    %al,(%rax)
     311:	08 18                	or     %bl,(%rax)
     313:	28 08                	sub    %cl,(%rax)
     315:	08 08                	or     %cl,(%rax)
     317:	08 08                	or     %cl,(%rax)
     319:	08 08                	or     %cl,(%rax)
     31b:	08 08                	or     %cl,(%rax)
     31d:	3e 00 00             	add    %al,%ds:(%rax)
     320:	00 18                	add    %bl,(%rax)
     322:	24 42                	and    $0x42,%al
     324:	42 02 04 08          	add    (%rax,%r9,1),%al
     328:	10 20                	adc    %ah,(%rax)
     32a:	20 40 40             	and    %al,0x40(%rax)
     32d:	7e 00                	jle    32f <font_ascii+0x32f>
     32f:	00 00                	add    %al,(%rax)
     331:	18 24 42             	sbb    %ah,(%rdx,%rax,2)
     334:	02 02                	add    (%rdx),%al
     336:	04 18                	add    $0x18,%al
     338:	04 02                	add    $0x2,%al
     33a:	02 42 24             	add    0x24(%rdx),%al
     33d:	18 00                	sbb    %al,(%rax)
     33f:	00 00                	add    %al,(%rax)
     341:	0c 0c                	or     $0xc,%al
     343:	0c 14                	or     $0x14,%al
     345:	14 14                	adc    $0x14,%al
     347:	24 24                	and    $0x24,%al
     349:	44 7e 04             	rex.R jle 350 <font_ascii+0x350>
     34c:	04 1e                	add    $0x1e,%al
     34e:	00 00                	add    %al,(%rax)
     350:	00 7c 40 40          	add    %bh,0x40(%rax,%rax,2)
     354:	40 58                	rex pop %rax
     356:	64 02 02             	add    %fs:(%rdx),%al
     359:	02 02                	add    (%rdx),%al
     35b:	42 24 18             	rex.X and $0x18,%al
     35e:	00 00                	add    %al,(%rax)
     360:	00 18                	add    %bl,(%rax)
     362:	24 42                	and    $0x42,%al
     364:	40 58                	rex pop %rax
     366:	64 42                	fs rex.X
     368:	42                   	rex.X
     369:	42                   	rex.X
     36a:	42                   	rex.X
     36b:	42 24 18             	rex.X and $0x18,%al
     36e:	00 00                	add    %al,(%rax)
     370:	00 7e 42             	add    %bh,0x42(%rsi)
     373:	42 04 04             	rex.X add $0x4,%al
     376:	08 08                	or     %cl,(%rax)
     378:	08 10                	or     %dl,(%rax)
     37a:	10 10                	adc    %dl,(%rax)
     37c:	10 38                	adc    %bh,(%rax)
     37e:	00 00                	add    %al,(%rax)
     380:	00 18                	add    %bl,(%rax)
     382:	24 42                	and    $0x42,%al
     384:	42                   	rex.X
     385:	42 24 18             	rex.X and $0x18,%al
     388:	24 42                	and    $0x42,%al
     38a:	42                   	rex.X
     38b:	42 24 18             	rex.X and $0x18,%al
     38e:	00 00                	add    %al,(%rax)
     390:	00 18                	add    %bl,(%rax)
     392:	24 42                	and    $0x42,%al
     394:	42                   	rex.X
     395:	42                   	rex.X
     396:	42                   	rex.X
     397:	42                   	rex.X
     398:	26 1a 02             	sbb    %es:(%rdx),%al
     39b:	42 24 18             	rex.X and $0x18,%al
     39e:	00 00                	add    %al,(%rax)
     3a0:	00 00                	add    %al,(%rax)
     3a2:	00 00                	add    %al,(%rax)
     3a4:	00 18                	add    %bl,(%rax)
     3a6:	18 00                	sbb    %al,(%rax)
     3a8:	00 00                	add    %al,(%rax)
     3aa:	00 00                	add    %al,(%rax)
     3ac:	18 18                	sbb    %bl,(%rax)
     3ae:	00 00                	add    %al,(%rax)
     3b0:	00 00                	add    %al,(%rax)
     3b2:	00 00                	add    %al,(%rax)
     3b4:	00 18                	add    %bl,(%rax)
     3b6:	18 00                	sbb    %al,(%rax)
     3b8:	00 00                	add    %al,(%rax)
     3ba:	00 18                	add    %bl,(%rax)
     3bc:	18 08                	sbb    %cl,(%rax)
     3be:	08 10                	or     %dl,(%rax)
     3c0:	00 02                	add    %al,(%rdx)
     3c2:	04 08                	add    $0x8,%al
     3c4:	10 20                	adc    %ah,(%rax)
     3c6:	40 80 80 40 20 10 08 	rex addb $0x4,0x8102040(%rax)
     3cd:	04 
     3ce:	02 00                	add    (%rax),%al
     3d0:	00 00                	add    %al,(%rax)
     3d2:	00 00                	add    %al,(%rax)
     3d4:	00 00                	add    %al,(%rax)
     3d6:	fe 00                	incb   (%rax)
     3d8:	00 fe                	add    %bh,%dh
     3da:	00 00                	add    %al,(%rax)
     3dc:	00 00                	add    %al,(%rax)
     3de:	00 00                	add    %al,(%rax)
     3e0:	00 80 40 20 10 08    	add    %al,0x8102040(%rax)
     3e6:	04 02                	add    $0x2,%al
     3e8:	02 04 08             	add    (%rax,%rcx,1),%al
     3eb:	10 20                	adc    %ah,(%rax)
     3ed:	40 80 00 00          	rex addb $0x0,(%rax)
     3f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
     3f5:	82                   	(bad)  
     3f6:	04 08                	add    $0x8,%al
     3f8:	10 10                	adc    %dl,(%rax)
     3fa:	00 00                	add    %al,(%rax)
     3fc:	18 18                	sbb    %bl,(%rax)
     3fe:	00 00                	add    %al,(%rax)
     400:	00 38                	add    %bh,(%rax)
     402:	44 82                	rex.R (bad) 
     404:	9a                   	(bad)  
     405:	aa                   	stos   %al,%es:(%rdi)
     406:	aa                   	stos   %al,%es:(%rdi)
     407:	aa                   	stos   %al,%es:(%rdi)
     408:	aa                   	stos   %al,%es:(%rdi)
     409:	aa                   	stos   %al,%es:(%rdi)
     40a:	9c                   	pushfq 
     40b:	80 46 38 00          	addb   $0x0,0x38(%rsi)
     40f:	00 00                	add    %al,(%rax)
     411:	18 18                	sbb    %bl,(%rax)
     413:	18 18                	sbb    %bl,(%rax)
     415:	24 24                	and    $0x24,%al
     417:	24 24                	and    $0x24,%al
     419:	7e 42                	jle    45d <font_ascii+0x45d>
     41b:	42                   	rex.X
     41c:	42 e7 00             	rex.X out %eax,$0x0
     41f:	00 00                	add    %al,(%rax)
     421:	f0 48                	lock rex.W
     423:	44                   	rex.R
     424:	44                   	rex.R
     425:	44                   	rex.R
     426:	48 78 44             	rex.W js 46d <font_ascii+0x46d>
     429:	42                   	rex.X
     42a:	42                   	rex.X
     42b:	42                   	rex.X
     42c:	44 f8                	rex.R clc 
     42e:	00 00                	add    %al,(%rax)
     430:	00 3a                	add    %bh,(%rdx)
     432:	46                   	rex.RX
     433:	42 82                	rex.X (bad) 
     435:	80 80 80 80 80 82 42 	addb   $0x42,-0x7d7f7f80(%rax)
     43c:	44 38 00             	cmp    %r8b,(%rax)
     43f:	00 00                	add    %al,(%rax)
     441:	f8                   	clc    
     442:	44                   	rex.R
     443:	44                   	rex.R
     444:	42                   	rex.X
     445:	42                   	rex.X
     446:	42                   	rex.X
     447:	42                   	rex.X
     448:	42                   	rex.X
     449:	42                   	rex.X
     44a:	42                   	rex.X
     44b:	44                   	rex.R
     44c:	44 f8                	rex.R clc 
     44e:	00 00                	add    %al,(%rax)
     450:	00 fe                	add    %bh,%dh
     452:	42                   	rex.X
     453:	42                   	rex.X
     454:	40                   	rex
     455:	40                   	rex
     456:	44 7c 44             	rex.R jl 49d <font_ascii+0x49d>
     459:	40                   	rex
     45a:	40                   	rex
     45b:	42                   	rex.X
     45c:	42 fe 00             	rex.X incb (%rax)
     45f:	00 00                	add    %al,(%rax)
     461:	fe 42 42             	incb   0x42(%rdx)
     464:	40                   	rex
     465:	40                   	rex
     466:	44 7c 44             	rex.R jl 4ad <font_ascii+0x4ad>
     469:	44                   	rex.R
     46a:	40                   	rex
     46b:	40                   	rex
     46c:	40                   	rex
     46d:	f0 00 00             	lock add %al,(%rax)
     470:	00 3a                	add    %bh,(%rdx)
     472:	46                   	rex.RX
     473:	42 82                	rex.X (bad) 
     475:	80 80 9e 82 82 82 42 	addb   $0x42,-0x7d7d7d62(%rax)
     47c:	46 38 00             	rex.RX cmp %r8b,(%rax)
     47f:	00 00                	add    %al,(%rax)
     481:	e7 42                	out    %eax,$0x42
     483:	42                   	rex.X
     484:	42                   	rex.X
     485:	42                   	rex.X
     486:	42 7e 42             	rex.X jle 4cb <font_ascii+0x4cb>
     489:	42                   	rex.X
     48a:	42                   	rex.X
     48b:	42                   	rex.X
     48c:	42 e7 00             	rex.X out %eax,$0x0
     48f:	00 00                	add    %al,(%rax)
     491:	7c 10                	jl     4a3 <font_ascii+0x4a3>
     493:	10 10                	adc    %dl,(%rax)
     495:	10 10                	adc    %dl,(%rax)
     497:	10 10                	adc    %dl,(%rax)
     499:	10 10                	adc    %dl,(%rax)
     49b:	10 10                	adc    %dl,(%rax)
     49d:	7c 00                	jl     49f <font_ascii+0x49f>
     49f:	00 00                	add    %al,(%rax)
     4a1:	1f                   	(bad)  
     4a2:	04 04                	add    $0x4,%al
     4a4:	04 04                	add    $0x4,%al
     4a6:	04 04                	add    $0x4,%al
     4a8:	04 04                	add    $0x4,%al
     4aa:	04 04                	add    $0x4,%al
     4ac:	84 48 30             	test   %cl,0x30(%rax)
     4af:	00 00                	add    %al,(%rax)
     4b1:	e7 42                	out    %eax,$0x42
     4b3:	44                   	rex.R
     4b4:	48 50                	rex.W push %rax
     4b6:	50                   	push   %rax
     4b7:	60                   	(bad)  
     4b8:	50                   	push   %rax
     4b9:	50                   	push   %rax
     4ba:	48                   	rex.W
     4bb:	44                   	rex.R
     4bc:	42 e7 00             	rex.X out %eax,$0x0
     4bf:	00 00                	add    %al,(%rax)
     4c1:	f0 40                	lock rex
     4c3:	40                   	rex
     4c4:	40                   	rex
     4c5:	40                   	rex
     4c6:	40                   	rex
     4c7:	40                   	rex
     4c8:	40                   	rex
     4c9:	40                   	rex
     4ca:	40                   	rex
     4cb:	42                   	rex.X
     4cc:	42 fe 00             	rex.X incb (%rax)
     4cf:	00 00                	add    %al,(%rax)
     4d1:	c3                   	retq   
     4d2:	42                   	rex.X
     4d3:	66 66 66 5a          	data16 data16 pop %dx
     4d7:	5a                   	pop    %rdx
     4d8:	5a                   	pop    %rdx
     4d9:	42                   	rex.X
     4da:	42                   	rex.X
     4db:	42                   	rex.X
     4dc:	42 e7 00             	rex.X out %eax,$0x0
     4df:	00 00                	add    %al,(%rax)
     4e1:	c7 42 62 62 52 52 52 	movl   $0x52525262,0x62(%rdx)
     4e8:	4a                   	rex.WX
     4e9:	4a                   	rex.WX
     4ea:	4a                   	rex.WX
     4eb:	46                   	rex.RX
     4ec:	46 e2 00             	rex.RX loop 4ef <font_ascii+0x4ef>
     4ef:	00 00                	add    %al,(%rax)
     4f1:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
     4f5:	82                   	(bad)  
     4f6:	82                   	(bad)  
     4f7:	82                   	(bad)  
     4f8:	82                   	(bad)  
     4f9:	82                   	(bad)  
     4fa:	82                   	(bad)  
     4fb:	82                   	(bad)  
     4fc:	44 38 00             	cmp    %r8b,(%rax)
     4ff:	00 00                	add    %al,(%rax)
     501:	f8                   	clc    
     502:	44                   	rex.R
     503:	42                   	rex.X
     504:	42                   	rex.X
     505:	42                   	rex.X
     506:	44 78 40             	rex.R js 549 <font_ascii+0x549>
     509:	40                   	rex
     50a:	40                   	rex
     50b:	40                   	rex
     50c:	40                   	rex
     50d:	f0 00 00             	lock add %al,(%rax)
     510:	00 38                	add    %bh,(%rax)
     512:	44 82                	rex.R (bad) 
     514:	82                   	(bad)  
     515:	82                   	(bad)  
     516:	82                   	(bad)  
     517:	82                   	(bad)  
     518:	82                   	(bad)  
     519:	82                   	(bad)  
     51a:	92                   	xchg   %eax,%edx
     51b:	8a 44 3a 00          	mov    0x0(%rdx,%rdi,1),%al
     51f:	00 00                	add    %al,(%rax)
     521:	fc                   	cld    
     522:	42                   	rex.X
     523:	42                   	rex.X
     524:	42                   	rex.X
     525:	42 7c 44             	rex.X jl 56c <font_ascii+0x56c>
     528:	42                   	rex.X
     529:	42                   	rex.X
     52a:	42                   	rex.X
     52b:	42                   	rex.X
     52c:	42 e7 00             	rex.X out %eax,$0x0
     52f:	00 00                	add    %al,(%rax)
     531:	3a 46 82             	cmp    -0x7e(%rsi),%al
     534:	82                   	(bad)  
     535:	80 40 38 04          	addb   $0x4,0x38(%rax)
     539:	02 82 82 c4 b8 00    	add    0xb8c482(%rdx),%al
     53f:	00 00                	add    %al,(%rax)
     541:	fe                   	(bad)  
     542:	92                   	xchg   %eax,%edx
     543:	92                   	xchg   %eax,%edx
     544:	10 10                	adc    %dl,(%rax)
     546:	10 10                	adc    %dl,(%rax)
     548:	10 10                	adc    %dl,(%rax)
     54a:	10 10                	adc    %dl,(%rax)
     54c:	10 7c 00 00          	adc    %bh,0x0(%rax,%rax,1)
     550:	00 e7                	add    %ah,%bh
     552:	42                   	rex.X
     553:	42                   	rex.X
     554:	42                   	rex.X
     555:	42                   	rex.X
     556:	42                   	rex.X
     557:	42                   	rex.X
     558:	42                   	rex.X
     559:	42                   	rex.X
     55a:	42                   	rex.X
     55b:	42 24 3c             	rex.X and $0x3c,%al
     55e:	00 00                	add    %al,(%rax)
     560:	00 e7                	add    %ah,%bh
     562:	42                   	rex.X
     563:	42                   	rex.X
     564:	42                   	rex.X
     565:	42 24 24             	rex.X and $0x24,%al
     568:	24 24                	and    $0x24,%al
     56a:	18 18                	sbb    %bl,(%rax)
     56c:	18 18                	sbb    %bl,(%rax)
     56e:	00 00                	add    %al,(%rax)
     570:	00 e7                	add    %ah,%bh
     572:	42                   	rex.X
     573:	42                   	rex.X
     574:	42 5a                	rex.X pop %rdx
     576:	5a                   	pop    %rdx
     577:	5a                   	pop    %rdx
     578:	5a                   	pop    %rdx
     579:	24 24                	and    $0x24,%al
     57b:	24 24                	and    $0x24,%al
     57d:	24 00                	and    $0x0,%al
     57f:	00 00                	add    %al,(%rax)
     581:	e7 42                	out    %eax,$0x42
     583:	42 24 24             	rex.X and $0x24,%al
     586:	24 18                	and    $0x18,%al
     588:	24 24                	and    $0x24,%al
     58a:	24 42                	and    $0x42,%al
     58c:	42 e7 00             	rex.X out %eax,$0x0
     58f:	00 00                	add    %al,(%rax)
     591:	ee                   	out    %al,(%dx)
     592:	44                   	rex.R
     593:	44                   	rex.R
     594:	44 28 28             	sub    %r13b,(%rax)
     597:	28 10                	sub    %dl,(%rax)
     599:	10 10                	adc    %dl,(%rax)
     59b:	10 10                	adc    %dl,(%rax)
     59d:	7c 00                	jl     59f <font_ascii+0x59f>
     59f:	00 00                	add    %al,(%rax)
     5a1:	fe 84 84 08 08 10 10 	incb   0x10100808(%rsp,%rax,4)
     5a8:	20 20                	and    %ah,(%rax)
     5aa:	40                   	rex
     5ab:	42 82                	rex.X (bad) 
     5ad:	fe 00                	incb   (%rax)
     5af:	00 00                	add    %al,(%rax)
     5b1:	3e 20 20             	and    %ah,%ds:(%rax)
     5b4:	20 20                	and    %ah,(%rax)
     5b6:	20 20                	and    %ah,(%rax)
     5b8:	20 20                	and    %ah,(%rax)
     5ba:	20 20                	and    %ah,(%rax)
     5bc:	20 20                	and    %ah,(%rax)
     5be:	3e 00 80 80 40 40 20 	add    %al,%ds:0x20404080(%rax)
     5c5:	20 20                	and    %ah,(%rax)
     5c7:	10 10                	adc    %dl,(%rax)
     5c9:	08 08                	or     %cl,(%rax)
     5cb:	04 04                	add    $0x4,%al
     5cd:	04 02                	add    $0x2,%al
     5cf:	02 00                	add    (%rax),%al
     5d1:	7c 04                	jl     5d7 <font_ascii+0x5d7>
     5d3:	04 04                	add    $0x4,%al
     5d5:	04 04                	add    $0x4,%al
     5d7:	04 04                	add    $0x4,%al
     5d9:	04 04                	add    $0x4,%al
     5db:	04 04                	add    $0x4,%al
     5dd:	04 7c                	add    $0x7c,%al
     5df:	00 00                	add    %al,(%rax)
     5e1:	10 28                	adc    %ch,(%rax)
     5e3:	44 82                	rex.R (bad) 
	...
     5fd:	00 fe                	add    %bh,%dh
     5ff:	00 10                	add    %dl,(%rax)
     601:	08 04 00             	or     %al,(%rax,%rax,1)
	...
     614:	00 70 08             	add    %dh,0x8(%rax)
     617:	04 3c                	add    $0x3c,%al
     619:	44 84 84 8c 76 00 00 	test   %r8b,-0x3fffff8a(%rsp,%rcx,4)
     620:	c0 
     621:	40                   	rex
     622:	40                   	rex
     623:	40                   	rex
     624:	40 58                	rex pop %rax
     626:	64 42                	fs rex.X
     628:	42                   	rex.X
     629:	42                   	rex.X
     62a:	42                   	rex.X
     62b:	42                   	rex.X
     62c:	64 58                	fs pop %rax
     62e:	00 00                	add    %al,(%rax)
     630:	00 00                	add    %al,(%rax)
     632:	00 00                	add    %al,(%rax)
     634:	00 30                	add    %dh,(%rax)
     636:	4c 84 84 80 80 82 44 	rex.WR test %r8b,0x38448280(%rax,%rax,4)
     63d:	38 
     63e:	00 00                	add    %al,(%rax)
     640:	0c 04                	or     $0x4,%al
     642:	04 04                	add    $0x4,%al
     644:	04 34                	add    $0x34,%al
     646:	4c 84 84 84 84 84 4c 	rex.WR test %r8b,0x364c8484(%rsp,%rax,4)
     64d:	36 
     64e:	00 00                	add    %al,(%rax)
     650:	00 00                	add    %al,(%rax)
     652:	00 00                	add    %al,(%rax)
     654:	00 38                	add    %bh,(%rax)
     656:	44 82                	rex.R (bad) 
     658:	82                   	(bad)  
     659:	fc                   	cld    
     65a:	80 82 42 3c 00 00 0e 	addb   $0xe,0x3c42(%rdx)
     661:	10 10                	adc    %dl,(%rax)
     663:	10 10                	adc    %dl,(%rax)
     665:	7c 10                	jl     677 <font_ascii+0x677>
     667:	10 10                	adc    %dl,(%rax)
     669:	10 10                	adc    %dl,(%rax)
     66b:	10 10                	adc    %dl,(%rax)
     66d:	7c 00                	jl     66f <font_ascii+0x66f>
     66f:	00 00                	add    %al,(%rax)
     671:	00 00                	add    %al,(%rax)
     673:	00 00                	add    %al,(%rax)
     675:	36 4c 84 84 84 84 4c 	rex.WR test %r8b,%ss:0x4344c84(%rsp,%rax,4)
     67c:	34 04 
     67e:	04 38                	add    $0x38,%al
     680:	c0 40 40 40          	rolb   $0x40,0x40(%rax)
     684:	40 58                	rex pop %rax
     686:	64 42                	fs rex.X
     688:	42                   	rex.X
     689:	42                   	rex.X
     68a:	42                   	rex.X
     68b:	42                   	rex.X
     68c:	42 e3 00             	rex.X jrcxz 68f <font_ascii+0x68f>
     68f:	00 00                	add    %al,(%rax)
     691:	10 10                	adc    %dl,(%rax)
     693:	00 00                	add    %al,(%rax)
     695:	30 10                	xor    %dl,(%rax)
     697:	10 10                	adc    %dl,(%rax)
     699:	10 10                	adc    %dl,(%rax)
     69b:	10 10                	adc    %dl,(%rax)
     69d:	38 00                	cmp    %al,(%rax)
     69f:	00 00                	add    %al,(%rax)
     6a1:	04 04                	add    $0x4,%al
     6a3:	00 00                	add    %al,(%rax)
     6a5:	0c 04                	or     $0x4,%al
     6a7:	04 04                	add    $0x4,%al
     6a9:	04 04                	add    $0x4,%al
     6ab:	04 04                	add    $0x4,%al
     6ad:	08 08                	or     %cl,(%rax)
     6af:	30 c0                	xor    %al,%al
     6b1:	40                   	rex
     6b2:	40                   	rex
     6b3:	40                   	rex
     6b4:	40                   	rex
     6b5:	4e                   	rex.WRX
     6b6:	44                   	rex.R
     6b7:	48 50                	rex.W push %rax
     6b9:	60                   	(bad)  
     6ba:	50                   	push   %rax
     6bb:	48                   	rex.W
     6bc:	44 e6 00             	rex.R out %al,$0x0
     6bf:	00 30                	add    %dh,(%rax)
     6c1:	10 10                	adc    %dl,(%rax)
     6c3:	10 10                	adc    %dl,(%rax)
     6c5:	10 10                	adc    %dl,(%rax)
     6c7:	10 10                	adc    %dl,(%rax)
     6c9:	10 10                	adc    %dl,(%rax)
     6cb:	10 10                	adc    %dl,(%rax)
     6cd:	38 00                	cmp    %al,(%rax)
     6cf:	00 00                	add    %al,(%rax)
     6d1:	00 00                	add    %al,(%rax)
     6d3:	00 00                	add    %al,(%rax)
     6d5:	f6 49 49 49          	testb  $0x49,0x49(%rcx)
     6d9:	49                   	rex.WB
     6da:	49                   	rex.WB
     6db:	49                   	rex.WB
     6dc:	49 db 00             	rex.WB fildl (%r8)
     6df:	00 00                	add    %al,(%rax)
     6e1:	00 00                	add    %al,(%rax)
     6e3:	00 00                	add    %al,(%rax)
     6e5:	d8 64 42 42          	fsubs  0x42(%rdx,%rax,2)
     6e9:	42                   	rex.X
     6ea:	42                   	rex.X
     6eb:	42                   	rex.X
     6ec:	42 e3 00             	rex.X jrcxz 6ef <font_ascii+0x6ef>
     6ef:	00 00                	add    %al,(%rax)
     6f1:	00 00                	add    %al,(%rax)
     6f3:	00 00                	add    %al,(%rax)
     6f5:	38 44 82 82          	cmp    %al,-0x7e(%rdx,%rax,4)
     6f9:	82                   	(bad)  
     6fa:	82                   	(bad)  
     6fb:	82                   	(bad)  
     6fc:	44 38 00             	cmp    %r8b,(%rax)
     6ff:	00 00                	add    %al,(%rax)
     701:	00 00                	add    %al,(%rax)
     703:	00 d8                	add    %bl,%al
     705:	64 42                	fs rex.X
     707:	42                   	rex.X
     708:	42                   	rex.X
     709:	42                   	rex.X
     70a:	42                   	rex.X
     70b:	64 58                	fs pop %rax
     70d:	40                   	rex
     70e:	40 e0 00             	rex loopne 711 <font_ascii+0x711>
     711:	00 00                	add    %al,(%rax)
     713:	00 34 4c             	add    %dh,(%rsp,%rcx,2)
     716:	84 84 84 84 84 4c 34 	test   %al,0x344c8484(%rsp,%rax,4)
     71d:	04 04                	add    $0x4,%al
     71f:	0e                   	(bad)  
     720:	00 00                	add    %al,(%rax)
     722:	00 00                	add    %al,(%rax)
     724:	00 dc                	add    %bl,%ah
     726:	62 42                	(bad)  
     728:	40                   	rex
     729:	40                   	rex
     72a:	40                   	rex
     72b:	40                   	rex
     72c:	40 e0 00             	rex loopne 72f <font_ascii+0x72f>
     72f:	00 00                	add    %al,(%rax)
     731:	00 00                	add    %al,(%rax)
     733:	00 00                	add    %al,(%rax)
     735:	7a 86                	jp     6bd <font_ascii+0x6bd>
     737:	82                   	(bad)  
     738:	c0 38 06             	sarb   $0x6,(%rax)
     73b:	82                   	(bad)  
     73c:	c2 bc 00             	retq   $0xbc
     73f:	00 00                	add    %al,(%rax)
     741:	00 10                	add    %dl,(%rax)
     743:	10 10                	adc    %dl,(%rax)
     745:	7c 10                	jl     757 <font_ascii+0x757>
     747:	10 10                	adc    %dl,(%rax)
     749:	10 10                	adc    %dl,(%rax)
     74b:	10 10                	adc    %dl,(%rax)
     74d:	0e                   	(bad)  
     74e:	00 00                	add    %al,(%rax)
     750:	00 00                	add    %al,(%rax)
     752:	00 00                	add    %al,(%rax)
     754:	00 c6                	add    %al,%dh
     756:	42                   	rex.X
     757:	42                   	rex.X
     758:	42                   	rex.X
     759:	42                   	rex.X
     75a:	42                   	rex.X
     75b:	42                   	rex.X
     75c:	46 3b 00             	rex.RX cmp (%rax),%r8d
     75f:	00 00                	add    %al,(%rax)
     761:	00 00                	add    %al,(%rax)
     763:	00 00                	add    %al,(%rax)
     765:	e7 42                	out    %eax,$0x42
     767:	42                   	rex.X
     768:	42 24 24             	rex.X and $0x24,%al
     76b:	24 18                	and    $0x18,%al
     76d:	18 00                	sbb    %al,(%rax)
     76f:	00 00                	add    %al,(%rax)
     771:	00 00                	add    %al,(%rax)
     773:	00 00                	add    %al,(%rax)
     775:	e7 42                	out    %eax,$0x42
     777:	42 5a                	rex.X pop %rdx
     779:	5a                   	pop    %rdx
     77a:	5a                   	pop    %rdx
     77b:	24 24                	and    $0x24,%al
     77d:	24 00                	and    $0x0,%al
     77f:	00 00                	add    %al,(%rax)
     781:	00 00                	add    %al,(%rax)
     783:	00 00                	add    %al,(%rax)
     785:	c6 44 28 28 10       	movb   $0x10,0x28(%rax,%rbp,1)
     78a:	28 28                	sub    %ch,(%rax)
     78c:	44 c6 00 00          	rex.R movb $0x0,(%rax)
     790:	00 00                	add    %al,(%rax)
     792:	00 00                	add    %al,(%rax)
     794:	00 e7                	add    %ah,%bh
     796:	42                   	rex.X
     797:	42 24 24             	rex.X and $0x24,%al
     79a:	24 18                	and    $0x18,%al
     79c:	18 10                	sbb    %dl,(%rax)
     79e:	10 60 00             	adc    %ah,0x0(%rax)
     7a1:	00 00                	add    %al,(%rax)
     7a3:	00 00                	add    %al,(%rax)
     7a5:	fe 82 84 08 10 20    	incb   0x20100884(%rdx)
     7ab:	42 82                	rex.X (bad) 
     7ad:	fe 00                	incb   (%rax)
     7af:	00 00                	add    %al,(%rax)
     7b1:	06                   	(bad)  
     7b2:	08 10                	or     %dl,(%rax)
     7b4:	10 10                	adc    %dl,(%rax)
     7b6:	10 60 10             	adc    %ah,0x10(%rax)
     7b9:	10 10                	adc    %dl,(%rax)
     7bb:	10 08                	adc    %cl,(%rax)
     7bd:	06                   	(bad)  
     7be:	00 00                	add    %al,(%rax)
     7c0:	10 10                	adc    %dl,(%rax)
     7c2:	10 10                	adc    %dl,(%rax)
     7c4:	10 10                	adc    %dl,(%rax)
     7c6:	10 10                	adc    %dl,(%rax)
     7c8:	10 10                	adc    %dl,(%rax)
     7ca:	10 10                	adc    %dl,(%rax)
     7cc:	10 10                	adc    %dl,(%rax)
     7ce:	10 10                	adc    %dl,(%rax)
     7d0:	00 60 10             	add    %ah,0x10(%rax)
     7d3:	08 08                	or     %cl,(%rax)
     7d5:	08 08                	or     %cl,(%rax)
     7d7:	06                   	(bad)  
     7d8:	08 08                	or     %cl,(%rax)
     7da:	08 08                	or     %cl,(%rax)
     7dc:	10 60 00             	adc    %ah,0x0(%rax)
     7df:	00 00                	add    %al,(%rax)
     7e1:	72 8c                	jb     76f <font_ascii+0x76f>
	...

0000000000001000 <interrupt>:
	...

Disassembly of section .bss:

0000000000000000 <buf>:
	...

0000000000001000 <Pos>:
	...

0000000000001028 <Global_CR3>:
	...

0000000000001030 <ZONE_DMA_INDEX>:
    1030:	00 00                	add    %al,(%rax)
	...

0000000000001034 <ZONE_NORMAL_INDEX>:
    1034:	00 00                	add    %al,(%rax)
	...

0000000000001038 <ZONE_UNMAPED_INDEX>:
    1038:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rodata:

0000000000000000 <.rodata>:
   0:	38 32                	cmp    %dh,(%rdx)
   2:	35 39 41 20 69       	xor    $0x69204139,%eax
   7:	6e                   	outsb  %ds:(%rsi),(%dx)
   8:	69 74 20 0a 00 64 6f 	imul   $0x5f6f6400,0xa(%rax,%riz,1),%esi
   f:	5f 
  10:	49 52                	rex.WB push %r10
  12:	51                   	push   %rcx
  13:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831303c <ZONE_UNMAPED_INDEX+0x38312004>
  19:	6c                   	insb   (%dx),%es:(%rdi)
  1a:	78 09                	js     25 <.rodata+0x25>
  1c:	00 6b 65             	add    %ch,0x65(%rbx)
  1f:	79 20                	jns    41 <.rodata+0x41>
  21:	63 6f 64             	movsxd 0x64(%rdi),%ebp
  24:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # 3831304e <ZONE_UNMAPED_INDEX+0x38312016>
  2b:	6c                   	insb   (%dx),%es:(%rdi)
  2c:	78 09                	js     37 <.rodata+0x37>
  2e:	00 00                	add    %al,(%rax)
  30:	72 65                	jb     97 <set_intr_gate+0x56>
  32:	67 73 3a             	addr32 jae 6f <set_intr_gate+0x2e>
  35:	25 23 30 31 38       	and    $0x38313023,%eax
  3a:	6c                   	insb   (%dx),%es:(%rdi)
  3b:	78 09                	js     46 <.rodata+0x46>
  3d:	3c 52                	cmp    $0x52,%al
  3f:	49 50                	rex.WB push %r8
  41:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831306a <ZONE_UNMAPED_INDEX+0x38312032>
  47:	6c                   	insb   (%dx),%es:(%rdi)
  48:	78 09                	js     53 <.rodata+0x53>
  4a:	52                   	push   %rdx
  4b:	53                   	push   %rbx
  4c:	50                   	push   %rax
  4d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313076 <ZONE_UNMAPED_INDEX+0x3831203e>
  53:	6c                   	insb   (%dx),%es:(%rdi)
  54:	78 3e                	js     94 <set_intr_gate+0x53>
  56:	0a 00                	or     (%rax),%al

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	00 47 43             	add    %al,0x43(%rdi)
   3:	43 3a 20             	rex.XB cmp (%r8),%spl
   6:	28 47 4e             	sub    %al,0x4e(%rdi)
   9:	55                   	push   %rbp
   a:	29 20                	sub    %esp,(%rax)
   c:	31 30                	xor    %esi,(%rax)
   e:	2e 32 2e             	xor    %cs:(%rsi),%ch
  11:	30 00                	xor    %al,(%rax)

Disassembly of section .eh_frame:

0000000000000000 <.eh_frame>:
   0:	14 00                	adc    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	00 00                	add    %al,(%rax)
   6:	00 00                	add    %al,(%rax)
   8:	01 7a 52             	add    %edi,0x52(%rdx)
   b:	00 01                	add    %al,(%rcx)
   d:	78 10                	js     1f <.eh_frame+0x1f>
   f:	01 1b                	add    %ebx,(%rbx)
  11:	0c 07                	or     $0x7,%al
  13:	08 90 01 00 00 1c    	or     %dl,0x1c000001(%rax)
  19:	00 00                	add    %al,(%rax)
  1b:	00 1c 00             	add    %bl,(%rax,%rax,1)
  1e:	00 00                	add    %al,(%rax)
  20:	00 00                	add    %al,(%rax)
  22:	00 00                	add    %al,(%rax)
  24:	21 00                	and    %eax,(%rax)
  26:	00 00                	add    %al,(%rax)
  28:	00 41 0e             	add    %al,0xe(%rcx)
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	5c                   	pop    %rsp
  32:	0c 07                	or     $0x7,%al
  34:	08 00                	or     %al,(%rax)
  36:	00 00                	add    %al,(%rax)
  38:	1c 00                	sbb    $0x0,%al
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	20 00                	and    %al,(%rax)
  46:	00 00                	add    %al,(%rax)
  48:	00 41 0e             	add    %al,0xe(%rcx)
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	5b                   	pop    %rbx
  52:	0c 07                	or     $0x7,%al
  54:	08 00                	or     %al,(%rax)
  56:	00 00                	add    %al,(%rax)
  58:	1c 00                	sbb    $0x0,%al
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 8f 00 00 00 00    	add    %cl,0x0(%rdi)
  69:	41 0e                	rex.B (bad) 
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
  77:	00 1c 00             	add    %bl,(%rax,%rax,1)
  7a:	00 00                	add    %al,(%rax)
  7c:	7c 00                	jl     7e <.eh_frame+0x7e>
  7e:	00 00                	add    %al,(%rax)
  80:	00 00                	add    %al,(%rax)
  82:	00 00                	add    %al,(%rax)
  84:	c9                   	leaveq 
  85:	00 00                	add    %al,(%rax)
  87:	00 00                	add    %al,(%rax)
  89:	41 0e                	rex.B (bad) 
  8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  91:	02 c4                	add    %ah,%al
  93:	0c 07                	or     $0x7,%al
  95:	08 00                	or     %al,(%rax)
  97:	00 1c 00             	add    %bl,(%rax,%rax,1)
  9a:	00 00                	add    %al,(%rax)
  9c:	9c                   	pushfq 
  9d:	00 00                	add    %al,(%rax)
  9f:	00 00                	add    %al,(%rax)
  a1:	00 00                	add    %al,(%rax)
  a3:	00 4c 01 00          	add    %cl,0x0(%rcx,%rax,1)
  a7:	00 00                	add    %al,(%rax)
  a9:	41 0e                	rex.B (bad) 
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	03 47 01             	add    0x1(%rdi),%eax
  b4:	0c 07                	or     $0x7,%al
  b6:	08 00                	or     %al,(%rax)
  b8:	1c 00                	sbb    $0x0,%al
  ba:	00 00                	add    %al,(%rax)
  bc:	bc 00 00 00 00       	mov    $0x0,%esp
  c1:	00 00                	add    %al,(%rax)
  c3:	00 df                	add    %bl,%bh
  c5:	00 00                	add    %al,(%rax)
  c7:	00 00                	add    %al,(%rax)
  c9:	41 0e                	rex.B (bad) 
  cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  d1:	02 da                	add    %dl,%bl
  d3:	0c 07                	or     $0x7,%al
  d5:	08 00                	or     %al,(%rax)
	...
