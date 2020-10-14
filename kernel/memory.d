
memory.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <page_init>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10:	48 8b 40 10          	mov    0x10(%rax),%rax
  14:	48 85 c0             	test   %rax,%rax
  17:	0f 85 c8 00 00 00    	jne    e5 <page_init+0xe5>
  1d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
  24:	00 00 00 
  27:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
  2e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  32:	48 8b 40 08          	mov    0x8(%rax),%rax
  36:	48 c1 e8 1b          	shr    $0x1b,%rax
  3a:	48 c1 e0 03          	shl    $0x3,%rax
  3e:	48 01 d0             	add    %rdx,%rax
  41:	48 8b 10             	mov    (%rax),%rdx
  44:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  48:	48 8b 40 08          	mov    0x8(%rax),%rax
  4c:	48 c1 e8 15          	shr    $0x15,%rax
  50:	83 e0 3f             	and    $0x3f,%eax
  53:	be 01 00 00 00       	mov    $0x1,%esi
  58:	89 c1                	mov    %eax,%ecx
  5a:	48 d3 e6             	shl    %cl,%rsi
  5d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
  64:	00 00 00 
  67:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
  6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  72:	48 8b 40 08          	mov    0x8(%rax),%rax
  76:	48 c1 e8 1b          	shr    $0x1b,%rax
  7a:	48 c1 e0 03          	shl    $0x3,%rax
  7e:	48 01 c8             	add    %rcx,%rax
  81:	48 09 f2             	or     %rsi,%rdx
  84:	48 89 10             	mov    %rdx,(%rax)
  87:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  8b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  8f:	48 89 50 10          	mov    %rdx,0x10(%rax)
  93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  97:	48 8b 40 18          	mov    0x18(%rax),%rax
  9b:	48 8d 50 01          	lea    0x1(%rax),%rdx
  9f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  a3:	48 89 50 18          	mov    %rdx,0x18(%rax)
  a7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  ab:	48 8b 00             	mov    (%rax),%rax
  ae:	48 8b 50 38          	mov    0x38(%rax),%rdx
  b2:	48 83 c2 01          	add    $0x1,%rdx
  b6:	48 89 50 38          	mov    %rdx,0x38(%rax)
  ba:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  be:	48 8b 00             	mov    (%rax),%rax
  c1:	48 8b 50 40          	mov    0x40(%rax),%rdx
  c5:	48 83 ea 01          	sub    $0x1,%rdx
  c9:	48 89 50 40          	mov    %rdx,0x40(%rax)
  cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  d1:	48 8b 00             	mov    (%rax),%rax
  d4:	48 8b 50 48          	mov    0x48(%rax),%rdx
  d8:	48 83 c2 01          	add    $0x1,%rdx
  dc:	48 89 50 48          	mov    %rdx,0x48(%rax)
  e0:	e9 00 01 00 00       	jmpq   1e5 <page_init+0x1e5>
  e5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  e9:	48 8b 40 10          	mov    0x10(%rax),%rax
  ed:	83 e0 04             	and    $0x4,%eax
  f0:	48 85 c0             	test   %rax,%rax
  f3:	75 2c                	jne    121 <page_init+0x121>
  f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  f9:	48 8b 40 10          	mov    0x10(%rax),%rax
  fd:	25 00 01 00 00       	and    $0x100,%eax
 102:	48 85 c0             	test   %rax,%rax
 105:	75 1a                	jne    121 <page_init+0x121>
 107:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 10b:	83 e0 04             	and    $0x4,%eax
 10e:	48 85 c0             	test   %rax,%rax
 111:	75 0e                	jne    121 <page_init+0x121>
 113:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 117:	25 00 01 00 00       	and    $0x100,%eax
 11c:	48 85 c0             	test   %rax,%rax
 11f:	74 43                	je     164 <page_init+0x164>
 121:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 125:	48 8b 40 10          	mov    0x10(%rax),%rax
 129:	48 0b 45 f0          	or     -0x10(%rbp),%rax
 12d:	48 89 c2             	mov    %rax,%rdx
 130:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 134:	48 89 50 10          	mov    %rdx,0x10(%rax)
 138:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 13c:	48 8b 40 18          	mov    0x18(%rax),%rax
 140:	48 8d 50 01          	lea    0x1(%rax),%rdx
 144:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 148:	48 89 50 18          	mov    %rdx,0x18(%rax)
 14c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 150:	48 8b 00             	mov    (%rax),%rax
 153:	48 8b 50 48          	mov    0x48(%rax),%rdx
 157:	48 83 c2 01          	add    $0x1,%rdx
 15b:	48 89 50 48          	mov    %rdx,0x48(%rax)
 15f:	e9 81 00 00 00       	jmpq   1e5 <page_init+0x1e5>
 164:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 16b:	00 00 00 
 16e:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
 175:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 179:	48 8b 40 08          	mov    0x8(%rax),%rax
 17d:	48 c1 e8 1b          	shr    $0x1b,%rax
 181:	48 c1 e0 03          	shl    $0x3,%rax
 185:	48 01 d0             	add    %rdx,%rax
 188:	48 8b 10             	mov    (%rax),%rdx
 18b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 18f:	48 8b 40 08          	mov    0x8(%rax),%rax
 193:	48 c1 e8 15          	shr    $0x15,%rax
 197:	83 e0 3f             	and    $0x3f,%eax
 19a:	be 01 00 00 00       	mov    $0x1,%esi
 19f:	89 c1                	mov    %eax,%ecx
 1a1:	48 d3 e6             	shl    %cl,%rsi
 1a4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1ab:	00 00 00 
 1ae:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
 1b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1b9:	48 8b 40 08          	mov    0x8(%rax),%rax
 1bd:	48 c1 e8 1b          	shr    $0x1b,%rax
 1c1:	48 c1 e0 03          	shl    $0x3,%rax
 1c5:	48 01 c8             	add    %rcx,%rax
 1c8:	48 09 f2             	or     %rsi,%rdx
 1cb:	48 89 10             	mov    %rdx,(%rax)
 1ce:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1d2:	48 8b 40 10          	mov    0x10(%rax),%rax
 1d6:	48 0b 45 f0          	or     -0x10(%rbp),%rax
 1da:	48 89 c2             	mov    %rax,%rdx
 1dd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1e1:	48 89 50 10          	mov    %rdx,0x10(%rax)
 1e5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ea:	5d                   	pop    %rbp
 1eb:	c3                   	retq   

00000000000001ec <page_clean>:
 1ec:	55                   	push   %rbp
 1ed:	48 89 e5             	mov    %rsp,%rbp
 1f0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1f4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1f8:	48 8b 40 10          	mov    0x10(%rax),%rax
 1fc:	48 85 c0             	test   %rax,%rax
 1ff:	75 11                	jne    212 <page_clean+0x26>
 201:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 205:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
 20c:	00 
 20d:	e9 55 01 00 00       	jmpq   367 <page_clean+0x17b>
 212:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 216:	48 8b 40 10          	mov    0x10(%rax),%rax
 21a:	83 e0 04             	and    $0x4,%eax
 21d:	48 85 c0             	test   %rax,%rax
 220:	75 12                	jne    234 <page_clean+0x48>
 222:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 226:	48 8b 40 10          	mov    0x10(%rax),%rax
 22a:	25 00 01 00 00       	and    $0x100,%eax
 22f:	48 85 c0             	test   %rax,%rax
 232:	74 6f                	je     2a3 <page_clean+0xb7>
 234:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 238:	48 8b 40 18          	mov    0x18(%rax),%rax
 23c:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
 240:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 244:	48 89 50 18          	mov    %rdx,0x18(%rax)
 248:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 24c:	48 8b 00             	mov    (%rax),%rax
 24f:	48 8b 50 48          	mov    0x48(%rax),%rdx
 253:	48 83 ea 01          	sub    $0x1,%rdx
 257:	48 89 50 48          	mov    %rdx,0x48(%rax)
 25b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 25f:	48 8b 40 18          	mov    0x18(%rax),%rax
 263:	48 85 c0             	test   %rax,%rax
 266:	0f 85 fb 00 00 00    	jne    367 <page_clean+0x17b>
 26c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 270:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
 277:	00 
 278:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 27c:	48 8b 00             	mov    (%rax),%rax
 27f:	48 8b 50 38          	mov    0x38(%rax),%rdx
 283:	48 83 ea 01          	sub    $0x1,%rdx
 287:	48 89 50 38          	mov    %rdx,0x38(%rax)
 28b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 28f:	48 8b 00             	mov    (%rax),%rax
 292:	48 8b 50 40          	mov    0x40(%rax),%rdx
 296:	48 83 c2 01          	add    $0x1,%rdx
 29a:	48 89 50 40          	mov    %rdx,0x40(%rax)
 29e:	e9 c4 00 00 00       	jmpq   367 <page_clean+0x17b>
 2a3:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2aa:	00 00 00 
 2ad:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
 2b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 2b8:	48 8b 40 08          	mov    0x8(%rax),%rax
 2bc:	48 c1 e8 1b          	shr    $0x1b,%rax
 2c0:	48 c1 e0 03          	shl    $0x3,%rax
 2c4:	48 01 d0             	add    %rdx,%rax
 2c7:	48 8b 10             	mov    (%rax),%rdx
 2ca:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 2ce:	48 8b 40 08          	mov    0x8(%rax),%rax
 2d2:	48 c1 e8 15          	shr    $0x15,%rax
 2d6:	83 e0 3f             	and    $0x3f,%eax
 2d9:	be 01 00 00 00       	mov    $0x1,%esi
 2de:	89 c1                	mov    %eax,%ecx
 2e0:	48 d3 e6             	shl    %cl,%rsi
 2e3:	48 89 f0             	mov    %rsi,%rax
 2e6:	48 f7 d0             	not    %rax
 2e9:	48 89 c6             	mov    %rax,%rsi
 2ec:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2f3:	00 00 00 
 2f6:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
 2fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 301:	48 8b 40 08          	mov    0x8(%rax),%rax
 305:	48 c1 e8 1b          	shr    $0x1b,%rax
 309:	48 c1 e0 03          	shl    $0x3,%rax
 30d:	48 01 c8             	add    %rcx,%rax
 310:	48 21 f2             	and    %rsi,%rdx
 313:	48 89 10             	mov    %rdx,(%rax)
 316:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 31a:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
 321:	00 
 322:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 326:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
 32d:	00 
 32e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 332:	48 8b 00             	mov    (%rax),%rax
 335:	48 8b 50 38          	mov    0x38(%rax),%rdx
 339:	48 83 ea 01          	sub    $0x1,%rdx
 33d:	48 89 50 38          	mov    %rdx,0x38(%rax)
 341:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 345:	48 8b 00             	mov    (%rax),%rax
 348:	48 8b 50 40          	mov    0x40(%rax),%rdx
 34c:	48 83 c2 01          	add    $0x1,%rdx
 350:	48 89 50 40          	mov    %rdx,0x40(%rax)
 354:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 358:	48 8b 00             	mov    (%rax),%rax
 35b:	48 8b 50 48          	mov    0x48(%rax),%rdx
 35f:	48 83 ea 01          	sub    $0x1,%rdx
 363:	48 89 50 48          	mov    %rdx,0x48(%rax)
 367:	b8 00 00 00 00       	mov    $0x0,%eax
 36c:	5d                   	pop    %rbp
 36d:	c3                   	retq   

000000000000036e <init_memory>:
 36e:	55                   	push   %rbp
 36f:	48 89 e5             	mov    %rsp,%rbp
 372:	48 83 ec 30          	sub    $0x30,%rsp
 376:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 37d:	00 
 37e:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
 385:	00 
 386:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 38d:	00 00 00 
 390:	be 00 00 00 00       	mov    $0x0,%esi
 395:	bf ff 00 00 00       	mov    $0xff,%edi
 39a:	b8 00 00 00 00       	mov    $0x0,%eax
 39f:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 3a6:	00 00 00 
 3a9:	ff d1                	callq  *%rcx
 3ab:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
 3b2:	80 ff ff 
 3b5:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 3b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 3c0:	e9 14 02 00 00       	jmpq   5d9 <init_memory+0x26b>
 3c5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3c9:	8b 48 10             	mov    0x10(%rax),%ecx
 3cc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3d0:	48 8b 50 08          	mov    0x8(%rax),%rdx
 3d4:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 3d8:	48 8b 00             	mov    (%rax),%rax
 3db:	41 89 c9             	mov    %ecx,%r9d
 3de:	49 89 d0             	mov    %rdx,%r8
 3e1:	48 89 c1             	mov    %rax,%rcx
 3e4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 3eb:	00 00 00 
 3ee:	be 00 00 00 00       	mov    $0x0,%esi
 3f3:	bf 00 80 ff 00       	mov    $0xff8000,%edi
 3f8:	b8 00 00 00 00       	mov    $0x0,%eax
 3fd:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
 404:	00 00 00 
 407:	41 ff d2             	callq  *%r10
 40a:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
 411:	00 
 412:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 416:	8b 40 10             	mov    0x10(%rax),%eax
 419:	83 f8 01             	cmp    $0x1,%eax
 41c:	0f 85 97 00 00 00    	jne    4b9 <init_memory+0x14b>
 422:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 426:	48 89 c1             	mov    %rax,%rcx
 429:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 430:	00 00 00 
 433:	be 00 00 00 00       	mov    $0x0,%esi
 438:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 43d:	b8 00 00 00 00       	mov    $0x0,%eax
 442:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 449:	00 00 00 
 44c:	41 ff d0             	callq  *%r8
 44f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 453:	48 8b 40 08          	mov    0x8(%rax),%rax
 457:	48 89 c1             	mov    %rax,%rcx
 45a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 461:	00 00 00 
 464:	be 00 00 00 00       	mov    $0x0,%esi
 469:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 46e:	b8 00 00 00 00       	mov    $0x0,%eax
 473:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 47a:	00 00 00 
 47d:	41 ff d0             	callq  *%r8
 480:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 484:	48 8b 40 08          	mov    0x8(%rax),%rax
 488:	48 01 45 f8          	add    %rax,-0x8(%rbp)
 48c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 490:	48 89 c1             	mov    %rax,%rcx
 493:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 49a:	00 00 00 
 49d:	be 00 00 00 00       	mov    $0x0,%esi
 4a2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 4a7:	b8 00 00 00 00       	mov    $0x0,%eax
 4ac:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 4b3:	00 00 00 
 4b6:	41 ff d0             	callq  *%r8
 4b9:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 4c0:	00 00 00 
 4c3:	8b 45 f4             	mov    -0xc(%rbp),%eax
 4c6:	48 63 d0             	movslq %eax,%rdx
 4c9:	48 89 d0             	mov    %rdx,%rax
 4cc:	48 c1 e0 02          	shl    $0x2,%rax
 4d0:	48 01 d0             	add    %rdx,%rax
 4d3:	48 c1 e0 02          	shl    $0x2,%rax
 4d7:	48 01 c8             	add    %rcx,%rax
 4da:	48 8b 10             	mov    (%rax),%rdx
 4dd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 4e1:	48 8b 00             	mov    (%rax),%rax
 4e4:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
 4e8:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
 4ef:	00 00 00 
 4f2:	8b 45 f4             	mov    -0xc(%rbp),%eax
 4f5:	48 63 d0             	movslq %eax,%rdx
 4f8:	48 89 d0             	mov    %rdx,%rax
 4fb:	48 c1 e0 02          	shl    $0x2,%rax
 4ff:	48 01 d0             	add    %rdx,%rax
 502:	48 c1 e0 02          	shl    $0x2,%rax
 506:	48 01 f0             	add    %rsi,%rax
 509:	48 89 08             	mov    %rcx,(%rax)
 50c:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 513:	00 00 00 
 516:	8b 45 f4             	mov    -0xc(%rbp),%eax
 519:	48 63 d0             	movslq %eax,%rdx
 51c:	48 89 d0             	mov    %rdx,%rax
 51f:	48 c1 e0 02          	shl    $0x2,%rax
 523:	48 01 d0             	add    %rdx,%rax
 526:	48 c1 e0 02          	shl    $0x2,%rax
 52a:	48 01 c8             	add    %rcx,%rax
 52d:	48 83 c0 08          	add    $0x8,%rax
 531:	48 8b 10             	mov    (%rax),%rdx
 534:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 538:	48 8b 40 08          	mov    0x8(%rax),%rax
 53c:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
 540:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
 547:	00 00 00 
 54a:	8b 45 f4             	mov    -0xc(%rbp),%eax
 54d:	48 63 d0             	movslq %eax,%rdx
 550:	48 89 d0             	mov    %rdx,%rax
 553:	48 c1 e0 02          	shl    $0x2,%rax
 557:	48 01 d0             	add    %rdx,%rax
 55a:	48 c1 e0 02          	shl    $0x2,%rax
 55e:	48 01 f0             	add    %rsi,%rax
 561:	48 83 c0 08          	add    $0x8,%rax
 565:	48 89 08             	mov    %rcx,(%rax)
 568:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 56c:	8b 50 10             	mov    0x10(%rax),%edx
 56f:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
 576:	00 00 00 
 579:	8b 45 f4             	mov    -0xc(%rbp),%eax
 57c:	48 63 c8             	movslq %eax,%rcx
 57f:	48 89 c8             	mov    %rcx,%rax
 582:	48 c1 e0 02          	shl    $0x2,%rax
 586:	48 01 c8             	add    %rcx,%rax
 589:	48 c1 e0 02          	shl    $0x2,%rax
 58d:	48 01 f0             	add    %rsi,%rax
 590:	48 83 c0 10          	add    $0x10,%rax
 594:	89 10                	mov    %edx,(%rax)
 596:	8b 45 f4             	mov    -0xc(%rbp),%eax
 599:	48 98                	cltq   
 59b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 5a2:	00 00 00 
 5a5:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
 5ac:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
 5b1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5b5:	8b 40 10             	mov    0x10(%rax),%eax
 5b8:	83 f8 04             	cmp    $0x4,%eax
 5bb:	77 26                	ja     5e3 <init_memory+0x275>
 5bd:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5c1:	48 8b 40 08          	mov    0x8(%rax),%rax
 5c5:	48 85 c0             	test   %rax,%rax
 5c8:	74 19                	je     5e3 <init_memory+0x275>
 5ca:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5ce:	8b 40 10             	mov    0x10(%rax),%eax
 5d1:	85 c0                	test   %eax,%eax
 5d3:	74 0e                	je     5e3 <init_memory+0x275>
 5d5:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
 5d9:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%rbp)
 5dd:	0f 8e e2 fd ff ff    	jle    3c5 <init_memory+0x57>
 5e3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 5e7:	48 89 c1             	mov    %rax,%rcx
 5ea:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 5f1:	00 00 00 
 5f4:	be 00 00 00 00       	mov    $0x0,%esi
 5f9:	bf 00 80 ff 00       	mov    $0xff8000,%edi
 5fe:	b8 00 00 00 00       	mov    $0x0,%eax
 603:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 60a:	00 00 00 
 60d:	41 ff d0             	callq  *%r8
 610:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 617:	00 
 618:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 61f:	e9 e1 00 00 00       	jmpq   705 <init_memory+0x397>
 624:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 62b:	00 00 00 
 62e:	8b 45 f4             	mov    -0xc(%rbp),%eax
 631:	48 63 d0             	movslq %eax,%rdx
 634:	48 89 d0             	mov    %rdx,%rax
 637:	48 c1 e0 02          	shl    $0x2,%rax
 63b:	48 01 d0             	add    %rdx,%rax
 63e:	48 c1 e0 02          	shl    $0x2,%rax
 642:	48 01 c8             	add    %rcx,%rax
 645:	48 83 c0 10          	add    $0x10,%rax
 649:	8b 00                	mov    (%rax),%eax
 64b:	83 f8 01             	cmp    $0x1,%eax
 64e:	0f 85 a9 00 00 00    	jne    6fd <init_memory+0x38f>
 654:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 65b:	00 00 00 
 65e:	8b 45 f4             	mov    -0xc(%rbp),%eax
 661:	48 63 d0             	movslq %eax,%rdx
 664:	48 89 d0             	mov    %rdx,%rax
 667:	48 c1 e0 02          	shl    $0x2,%rax
 66b:	48 01 d0             	add    %rdx,%rax
 66e:	48 c1 e0 02          	shl    $0x2,%rax
 672:	48 01 c8             	add    %rcx,%rax
 675:	48 8b 00             	mov    (%rax),%rax
 678:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
 67e:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
 684:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 688:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 68f:	00 00 00 
 692:	8b 45 f4             	mov    -0xc(%rbp),%eax
 695:	48 63 d0             	movslq %eax,%rdx
 698:	48 89 d0             	mov    %rdx,%rax
 69b:	48 c1 e0 02          	shl    $0x2,%rax
 69f:	48 01 d0             	add    %rdx,%rax
 6a2:	48 c1 e0 02          	shl    $0x2,%rax
 6a6:	48 01 c8             	add    %rcx,%rax
 6a9:	48 8b 08             	mov    (%rax),%rcx
 6ac:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
 6b3:	00 00 00 
 6b6:	8b 45 f4             	mov    -0xc(%rbp),%eax
 6b9:	48 63 d0             	movslq %eax,%rdx
 6bc:	48 89 d0             	mov    %rdx,%rax
 6bf:	48 c1 e0 02          	shl    $0x2,%rax
 6c3:	48 01 d0             	add    %rdx,%rax
 6c6:	48 c1 e0 02          	shl    $0x2,%rax
 6ca:	48 01 f0             	add    %rsi,%rax
 6cd:	48 83 c0 08          	add    $0x8,%rax
 6d1:	48 8b 00             	mov    (%rax),%rax
 6d4:	48 01 c8             	add    %rcx,%rax
 6d7:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
 6dd:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 6e1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 6e5:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
 6e9:	76 15                	jbe    700 <init_memory+0x392>
 6eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 6ef:	48 2b 45 e0          	sub    -0x20(%rbp),%rax
 6f3:	48 c1 e8 15          	shr    $0x15,%rax
 6f7:	48 01 45 f8          	add    %rax,-0x8(%rbp)
 6fb:	eb 04                	jmp    701 <init_memory+0x393>
 6fd:	90                   	nop
 6fe:	eb 01                	jmp    701 <init_memory+0x393>
 700:	90                   	nop
 701:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
 705:	8b 45 f4             	mov    -0xc(%rbp),%eax
 708:	48 63 d0             	movslq %eax,%rdx
 70b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 712:	00 00 00 
 715:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
 71c:	48 39 c2             	cmp    %rax,%rdx
 71f:	0f 86 ff fe ff ff    	jbe    624 <init_memory+0x2b6>
 725:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
 729:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 72d:	49 89 d0             	mov    %rdx,%r8
 730:	48 89 c1             	mov    %rax,%rcx
 733:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 73a:	00 00 00 
 73d:	be 00 00 00 00       	mov    $0x0,%esi
 742:	bf 00 80 ff 00       	mov    $0xff8000,%edi
 747:	b8 00 00 00 00       	mov    $0x0,%eax
 74c:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
 753:	00 00 00 
 756:	41 ff d1             	callq  *%r9
 759:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 760:	00 00 00 
 763:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
 76a:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 771:	00 00 00 
 774:	48 89 d0             	mov    %rdx,%rax
 777:	48 c1 e0 02          	shl    $0x2,%rax
 77b:	48 01 d0             	add    %rdx,%rax
 77e:	48 c1 e0 02          	shl    $0x2,%rax
 782:	48 01 c8             	add    %rcx,%rax
 785:	48 8b 08             	mov    (%rax),%rcx
 788:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 78f:	00 00 00 
 792:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
 799:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
 7a0:	00 00 00 
 7a3:	48 89 d0             	mov    %rdx,%rax
 7a6:	48 c1 e0 02          	shl    $0x2,%rax
 7aa:	48 01 d0             	add    %rdx,%rax
 7ad:	48 c1 e0 02          	shl    $0x2,%rax
 7b1:	48 01 f0             	add    %rsi,%rax
 7b4:	48 83 c0 08          	add    $0x8,%rax
 7b8:	48 8b 00             	mov    (%rax),%rax
 7bb:	48 01 c8             	add    %rcx,%rax
 7be:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 7c2:	eb fe                	jmp    7c2 <init_memory+0x454>

00000000000007c4 <alloc_pages>:
 7c4:	55                   	push   %rbp
 7c5:	48 89 e5             	mov    %rsp,%rbp
 7c8:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
 7cc:	89 7d 8c             	mov    %edi,-0x74(%rbp)
 7cf:	89 75 88             	mov    %esi,-0x78(%rbp)
 7d2:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
 7d6:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
 7dd:	00 
 7de:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 7e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
 7ec:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
 7f0:	74 4c                	je     83e <alloc_pages+0x7a>
 7f2:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
 7f6:	7f 6e                	jg     866 <alloc_pages+0xa2>
 7f8:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
 7fc:	74 08                	je     806 <alloc_pages+0x42>
 7fe:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
 802:	74 1a                	je     81e <alloc_pages+0x5a>
 804:	eb 60                	jmp    866 <alloc_pages+0xa2>
 806:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
 80d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 814:	00 00 00 
 817:	8b 00                	mov    (%rax),%eax
 819:	89 45 f4             	mov    %eax,-0xc(%rbp)
 81c:	eb 77                	jmp    895 <alloc_pages+0xd1>
 81e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 825:	00 00 00 
 828:	8b 00                	mov    (%rax),%eax
 82a:	89 45 f8             	mov    %eax,-0x8(%rbp)
 82d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 834:	00 00 00 
 837:	8b 00                	mov    (%rax),%eax
 839:	89 45 f4             	mov    %eax,-0xc(%rbp)
 83c:	eb 57                	jmp    895 <alloc_pages+0xd1>
 83e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 845:	00 00 00 
 848:	8b 00                	mov    (%rax),%eax
 84a:	89 45 f8             	mov    %eax,-0x8(%rbp)
 84d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 854:	00 00 00 
 857:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
 85e:	83 e8 01             	sub    $0x1,%eax
 861:	89 45 f4             	mov    %eax,-0xc(%rbp)
 864:	eb 2f                	jmp    895 <alloc_pages+0xd1>
 866:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 86d:	00 00 00 
 870:	be 00 00 00 00       	mov    $0x0,%esi
 875:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 87a:	b8 00 00 00 00       	mov    $0x0,%eax
 87f:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 886:	00 00 00 
 889:	ff d1                	callq  *%rcx
 88b:	b8 00 00 00 00       	mov    $0x0,%eax
 890:	e9 5f 02 00 00       	jmpq   af4 <alloc_pages+0x330>
 895:	8b 45 f8             	mov    -0x8(%rbp),%eax
 898:	89 45 fc             	mov    %eax,-0x4(%rbp)
 89b:	e9 1b 02 00 00       	jmpq   abb <alloc_pages+0x2f7>
 8a0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8a7:	00 00 00 
 8aa:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
 8b1:	8b 45 fc             	mov    -0x4(%rbp),%eax
 8b4:	48 63 d0             	movslq %eax,%rdx
 8b7:	48 89 d0             	mov    %rdx,%rax
 8ba:	48 c1 e0 02          	shl    $0x2,%rax
 8be:	48 01 d0             	add    %rdx,%rax
 8c1:	48 c1 e0 04          	shl    $0x4,%rax
 8c5:	48 01 c8             	add    %rcx,%rax
 8c8:	48 8b 50 40          	mov    0x40(%rax),%rdx
 8cc:	8b 45 88             	mov    -0x78(%rbp),%eax
 8cf:	48 98                	cltq   
 8d1:	48 39 c2             	cmp    %rax,%rdx
 8d4:	0f 82 dc 01 00 00    	jb     ab6 <alloc_pages+0x2f2>
 8da:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8e1:	00 00 00 
 8e4:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
 8eb:	8b 45 fc             	mov    -0x4(%rbp),%eax
 8ee:	48 63 d0             	movslq %eax,%rdx
 8f1:	48 89 d0             	mov    %rdx,%rax
 8f4:	48 c1 e0 02          	shl    $0x2,%rax
 8f8:	48 01 d0             	add    %rdx,%rax
 8fb:	48 c1 e0 04          	shl    $0x4,%rax
 8ff:	48 01 c8             	add    %rcx,%rax
 902:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
 906:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 90a:	48 8b 40 10          	mov    0x10(%rax),%rax
 90e:	48 c1 e8 15          	shr    $0x15,%rax
 912:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
 916:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 91a:	48 8b 40 18          	mov    0x18(%rax),%rax
 91e:	48 c1 e8 15          	shr    $0x15,%rax
 922:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
 926:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 92a:	48 8b 40 20          	mov    0x20(%rax),%rax
 92e:	48 c1 e8 15          	shr    $0x15,%rax
 932:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 936:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 93a:	83 e0 3f             	and    $0x3f,%eax
 93d:	48 89 c2             	mov    %rax,%rdx
 940:	b8 40 00 00 00       	mov    $0x40,%eax
 945:	48 29 d0             	sub    %rdx,%rax
 948:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
 94c:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
 950:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 954:	e9 4d 01 00 00       	jmpq   aa6 <alloc_pages+0x2e2>
 959:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 960:	00 00 00 
 963:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
 96a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 96e:	48 c1 e8 06          	shr    $0x6,%rax
 972:	48 c1 e0 03          	shl    $0x3,%rax
 976:	48 01 d0             	add    %rdx,%rax
 979:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
 97d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 981:	83 e0 3f             	and    $0x3f,%eax
 984:	48 89 45 98          	mov    %rax,-0x68(%rbp)
 988:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 98c:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 990:	e9 e3 00 00 00       	jmpq   a78 <alloc_pages+0x2b4>
 995:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 999:	48 8b 00             	mov    (%rax),%rax
 99c:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 9a0:	89 d1                	mov    %edx,%ecx
 9a2:	48 d3 e8             	shr    %cl,%rax
 9a5:	48 89 c6             	mov    %rax,%rsi
 9a8:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9ac:	48 83 c0 08          	add    $0x8,%rax
 9b0:	48 8b 10             	mov    (%rax),%rdx
 9b3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 9b7:	89 c1                	mov    %eax,%ecx
 9b9:	b8 40 00 00 00       	mov    $0x40,%eax
 9be:	29 c8                	sub    %ecx,%eax
 9c0:	89 c1                	mov    %eax,%ecx
 9c2:	48 d3 e2             	shl    %cl,%rdx
 9c5:	48 89 d0             	mov    %rdx,%rax
 9c8:	48 09 c6             	or     %rax,%rsi
 9cb:	48 89 f2             	mov    %rsi,%rdx
 9ce:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
 9d2:	74 16                	je     9ea <alloc_pages+0x226>
 9d4:	8b 45 88             	mov    -0x78(%rbp),%eax
 9d7:	be 01 00 00 00       	mov    $0x1,%esi
 9dc:	89 c1                	mov    %eax,%ecx
 9de:	48 d3 e6             	shl    %cl,%rsi
 9e1:	48 89 f0             	mov    %rsi,%rax
 9e4:	48 83 e8 01          	sub    $0x1,%rax
 9e8:	eb 07                	jmp    9f1 <alloc_pages+0x22d>
 9ea:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
 9f1:	48 21 d0             	and    %rdx,%rax
 9f4:	48 85 c0             	test   %rax,%rax
 9f7:	75 7a                	jne    a73 <alloc_pages+0x2af>
 9f9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 9fd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 a01:	48 01 d0             	add    %rdx,%rax
 a04:	48 83 e8 01          	sub    $0x1,%rax
 a08:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
 a0c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
 a13:	00 
 a14:	eb 50                	jmp    a66 <alloc_pages+0x2a2>
 a16:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a1d:	00 00 00 
 a20:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
 a27:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
 a2b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 a2f:	48 01 c2             	add    %rax,%rdx
 a32:	48 89 d0             	mov    %rdx,%rax
 a35:	48 c1 e0 02          	shl    $0x2,%rax
 a39:	48 01 d0             	add    %rdx,%rax
 a3c:	48 c1 e0 03          	shl    $0x3,%rax
 a40:	48 01 c8             	add    %rcx,%rax
 a43:	48 89 45 90          	mov    %rax,-0x70(%rbp)
 a47:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
 a4b:	48 8b 45 90          	mov    -0x70(%rbp),%rax
 a4f:	48 89 d6             	mov    %rdx,%rsi
 a52:	48 89 c7             	mov    %rax,%rdi
 a55:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a5c:	00 00 00 
 a5f:	ff d0                	callq  *%rax
 a61:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
 a66:	8b 45 88             	mov    -0x78(%rbp),%eax
 a69:	48 98                	cltq   
 a6b:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
 a6f:	72 a5                	jb     a16 <alloc_pages+0x252>
 a71:	eb 5b                	jmp    ace <alloc_pages+0x30a>
 a73:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
 a78:	b8 40 00 00 00       	mov    $0x40,%eax
 a7d:	48 2b 45 98          	sub    -0x68(%rbp),%rax
 a81:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
 a85:	0f 82 0a ff ff ff    	jb     995 <alloc_pages+0x1d1>
 a8b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 a8f:	83 e0 3f             	and    $0x3f,%eax
 a92:	48 85 c0             	test   %rax,%rax
 a95:	74 06                	je     a9d <alloc_pages+0x2d9>
 a97:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 a9b:	eb 05                	jmp    aa2 <alloc_pages+0x2de>
 a9d:	b8 40 00 00 00       	mov    $0x40,%eax
 aa2:	48 01 45 e8          	add    %rax,-0x18(%rbp)
 aa6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 aaa:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
 aae:	0f 86 a5 fe ff ff    	jbe    959 <alloc_pages+0x195>
 ab4:	eb 01                	jmp    ab7 <alloc_pages+0x2f3>
 ab6:	90                   	nop
 ab7:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 abb:	8b 45 fc             	mov    -0x4(%rbp),%eax
 abe:	3b 45 f4             	cmp    -0xc(%rbp),%eax
 ac1:	0f 8e d9 fd ff ff    	jle    8a0 <alloc_pages+0xdc>
 ac7:	b8 00 00 00 00       	mov    $0x0,%eax
 acc:	eb 26                	jmp    af4 <alloc_pages+0x330>
 ace:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 ad5:	00 00 00 
 ad8:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
 adf:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
 ae3:	48 89 d0             	mov    %rdx,%rax
 ae6:	48 c1 e0 02          	shl    $0x2,%rax
 aea:	48 01 d0             	add    %rdx,%rax
 aed:	48 c1 e0 03          	shl    $0x3,%rax
 af1:	48 01 c8             	add    %rcx,%rax
 af4:	c9                   	leaveq 
 af5:	c3                   	retq   

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
   0:	44 69 73 70 6c 61 79 	imul   $0x2079616c,0x70(%rbx),%r14d
   7:	20 
   8:	50                   	push   %rax
   9:	68 79 73 69 63       	pushq  $0x63697379
   e:	73 20                	jae    30 <.rodata+0x30>
  10:	41                   	rex.B
  11:	64 64 72 65          	fs fs jb 7a <.rodata+0x7a>
  15:	73 73                	jae    8a <.rodata+0x8a>
  17:	20 4d 41             	and    %cl,0x41(%rbp)
  1a:	50                   	push   %rax
  1b:	2c 54                	sub    $0x54,%al
  1d:	79 70                	jns    8f <.rodata+0x8f>
  1f:	65 28 31             	sub    %dh,%gs:(%rcx)
  22:	3a 52 41             	cmp    0x41(%rdx),%dl
  25:	4d 2c 32             	rex.WRB sub $0x32,%al
  28:	3a 52 4f             	cmp    0x4f(%rdx),%dl
  2b:	4d 20 6f 72          	rex.WRB and %r13b,0x72(%r15)
  2f:	20 52 65             	and    %dl,0x65(%rdx)
  32:	73 65                	jae    99 <.rodata+0x99>
  34:	72 76                	jb     ac <.rodata+0xac>
  36:	65 64 2c 33          	gs fs sub $0x33,%al
  3a:	3a 41 43             	cmp    0x43(%rcx),%al
  3d:	50                   	push   %rax
  3e:	49 20 52 65          	rex.WB and %dl,0x65(%r10)
  42:	63 6c 61 69          	movsxd 0x69(%rcx,%riz,2),%ebp
  46:	6d                   	insl   (%dx),%es:(%rdi)
  47:	20 4d 65             	and    %cl,0x65(%rbp)
  4a:	6d                   	insl   (%dx),%es:(%rdi)
  4b:	6f                   	outsl  %ds:(%rsi),(%dx)
  4c:	72 79                	jb     c7 <.rodata+0xc7>
  4e:	2c 34                	sub    $0x34,%al
  50:	3a 41 43             	cmp    0x43(%rcx),%al
  53:	50                   	push   %rax
  54:	49 20 4e 56          	rex.WB and %cl,0x56(%r14)
  58:	53                   	push   %rbx
  59:	20 4d 65             	and    %cl,0x65(%rbp)
  5c:	6d                   	insl   (%dx),%es:(%rdi)
  5d:	6f                   	outsl  %ds:(%rsi),(%dx)
  5e:	72 79                	jb     d9 <.rodata+0xd9>
  60:	2c 4f                	sub    $0x4f,%al
  62:	74 68                	je     cc <.rodata+0xcc>
  64:	65 72 73             	gs jb  da <.rodata+0xda>
  67:	3a 55 6e             	cmp    0x6e(%rbp),%dl
  6a:	64 65 66 69 6e 65 29 	fs imul $0xa29,%gs:0x65(%rsi),%bp
  71:	0a 
  72:	00 00                	add    %al,(%rax)
  74:	00 00                	add    %al,(%rax)
  76:	00 00                	add    %al,(%rax)
  78:	41                   	rex.B
  79:	64 64 72 65          	fs fs jb e2 <.rodata+0xe2>
  7d:	73 73                	jae    f2 <.rodata+0xf2>
  7f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130a8 <ZONE_UNMAPED_INDEX+0x38312070>
  85:	6c                   	insb   (%dx),%es:(%rdi)
  86:	78 09                	js     91 <.rodata+0x91>
  88:	4c                   	rex.WR
  89:	65 6e                	outsb  %gs:(%rsi),(%dx)
  8b:	67 74 68             	addr32 je f6 <.rodata+0xf6>
  8e:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130b7 <ZONE_UNMAPED_INDEX+0x3831207f>
  94:	6c                   	insb   (%dx),%es:(%rdi)
  95:	78 09                	js     a0 <.rodata+0xa0>
  97:	54                   	push   %rsp
  98:	79 70                	jns    10a <.rodata+0x10a>
  9a:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # 303130c4 <ZONE_UNMAPED_INDEX+0x3031208c>
  a1:	78 0a                	js     ad <.rodata+0xad>
  a3:	00 42 65             	add    %al,0x65(%rdx)
  a6:	66 6f                	outsw  %ds:(%rsi),(%dx)
  a8:	72 65                	jb     10f <.rodata+0x10f>
  aa:	20 54 6f 74          	and    %dl,0x74(%rdi,%rbp,2)
  ae:	61                   	(bad)  
  af:	6c                   	insb   (%dx),%es:(%rdi)
  b0:	20 52 41             	and    %dl,0x41(%rdx)
  b3:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # 383130dd <ZONE_UNMAPED_INDEX+0x383120a5>
  ba:	6c                   	insb   (%dx),%es:(%rdi)
  bb:	78 0a                	js     c7 <.rodata+0xc7>
  bd:	00 4c 65 6e          	add    %cl,0x6e(%rbp,%riz,2)
  c1:	67 74 68             	addr32 je 12c <.rodata+0x12c>
  c4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130ed <ZONE_UNMAPED_INDEX+0x383120b5>
  ca:	6c                   	insb   (%dx),%es:(%rdi)
  cb:	78 0a                	js     d7 <.rodata+0xd7>
  cd:	00 41 66             	add    %al,0x66(%rcx)
  d0:	74 65                	je     137 <.rodata+0x137>
  d2:	72 20                	jb     f4 <.rodata+0xf4>
  d4:	54                   	push   %rsp
  d5:	6f                   	outsl  %ds:(%rsi),(%dx)
  d6:	74 61                	je     139 <.rodata+0x139>
  d8:	6c                   	insb   (%dx),%es:(%rdi)
  d9:	20 52 41             	and    %dl,0x41(%rdx)
  dc:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # 38313106 <ZONE_UNMAPED_INDEX+0x383120ce>
  e3:	6c                   	insb   (%dx),%es:(%rdi)
  e4:	78 0a                	js     f0 <.rodata+0xf0>
  e6:	00 00                	add    %al,(%rax)
  e8:	4f 53                	rex.WRXB push %r11
  ea:	20 43 61             	and    %al,0x61(%rbx)
  ed:	6e                   	outsb  %ds:(%rsi),(%dx)
  ee:	20 55 73             	and    %dl,0x73(%rbp)
  f1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
  f7:	61                   	(bad)  
  f8:	6c                   	insb   (%dx),%es:(%rdi)
  f9:	20 52 41             	and    %dl,0x41(%rdx)
  fc:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # 38313126 <ZONE_UNMAPED_INDEX+0x383120ee>
 103:	6c                   	insb   (%dx),%es:(%rdi)
 104:	78 0a                	js     110 <.rodata+0x110>
 106:	00 00                	add    %al,(%rax)
 108:	4f 53                	rex.WRXB push %r11
 10a:	20 43 61             	and    %al,0x61(%rbx)
 10d:	6e                   	outsb  %ds:(%rsi),(%dx)
 10e:	20 55 73             	and    %dl,0x73(%rbp)
 111:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
 117:	61                   	(bad)  
 118:	6c                   	insb   (%dx),%es:(%rdi)
 119:	20 32                	and    %dh,(%rdx)
 11b:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
 11f:	47                   	rex.RXB
 120:	45 73 3a             	rex.RB jae 15d <page_init+0x15d>
 123:	25 23 30 31 30       	and    $0x30313023,%eax
 128:	78 3d                	js     167 <page_init+0x167>
 12a:	25 30 31 30 64       	and    $0x64303130,%eax
 12f:	0a 00                	or     (%rax),%al
 131:	00 00                	add    %al,(%rax)
 133:	00 00                	add    %al,(%rax)
 135:	00 00                	add    %al,(%rax)
 137:	00 61 6c             	add    %ah,0x6c(%rcx)
 13a:	6c                   	insb   (%dx),%es:(%rdi)
 13b:	6f                   	outsl  %ds:(%rsi),(%dx)
 13c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
 13f:	61                   	(bad)  
 140:	67 65 73 20          	addr32 gs jae 164 <page_init+0x164>
 144:	65 72 72             	gs jb  1b9 <page_init+0x1b9>
 147:	6f                   	outsl  %ds:(%rsi),(%dx)
 148:	72 20                	jb     16a <page_init+0x16a>
 14a:	7a 6f                	jp     1bb <page_init+0x1bb>
 14c:	6e                   	outsb  %ds:(%rsi),(%dx)
 14d:	65 5f                	gs pop %rdi
 14f:	73 65                	jae    1b6 <page_init+0x1b6>
 151:	6c                   	insb   (%dx),%es:(%rdi)
 152:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
 157:	6e                   	outsb  %ds:(%rsi),(%dx)
 158:	64 65 78 0a          	fs gs js 166 <page_init+0x166>
	...

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
  24:	ec                   	in     (%dx),%al
  25:	01 00                	add    %eax,(%rax)
  27:	00 00                	add    %al,(%rax)
  29:	41 0e                	rex.B (bad) 
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	03 e7                	add    %edi,%esp
  33:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
  36:	08 00                	or     %al,(%rax)
  38:	1c 00                	sbb    $0x0,%al
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	82                   	(bad)  
  45:	01 00                	add    %eax,(%rax)
  47:	00 00                	add    %al,(%rax)
  49:	41 0e                	rex.B (bad) 
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	03 7d 01             	add    0x1(%rbp),%edi
  54:	0c 07                	or     $0x7,%al
  56:	08 00                	or     %al,(%rax)
  58:	18 00                	sbb    %al,(%rax)
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 56 04             	add    %dl,0x4(%rsi)
  66:	00 00                	add    %al,(%rax)
  68:	00 41 0e             	add    %al,0xe(%rcx)
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	00 00                	add    %al,(%rax)
  73:	00 20                	add    %ah,(%rax)
  75:	00 00                	add    %al,(%rax)
  77:	00 78 00             	add    %bh,0x0(%rax)
  7a:	00 00                	add    %al,(%rax)
  7c:	00 00                	add    %al,(%rax)
  7e:	00 00                	add    %al,(%rax)
  80:	32 03                	xor    (%rbx),%al
  82:	00 00                	add    %al,(%rax)
  84:	00 41 0e             	add    %al,0xe(%rcx)
  87:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  8d:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # 8070c96 <ZONE_UNMAPED_INDEX+0x806fc5e>
  93:	00 00                	add    %al,(%rax)
  95:	00 00                	add    %al,(%rax)
	...
