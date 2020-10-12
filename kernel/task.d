
task.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <list_init>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
   c:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  10:	48 89 10             	mov    %rdx,(%rax)
  13:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  17:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  1b:	48 89 50 08          	mov    %rdx,0x8(%rax)
  1f:	90                   	nop
  20:	5d                   	pop    %rbp
  21:	c3                   	retq   

0000000000000022 <list_add_to_before>:
  22:	55                   	push   %rbp
  23:	48 89 e5             	mov    %rsp,%rbp
  26:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  2a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  2e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  32:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
  36:	48 89 50 08          	mov    %rdx,0x8(%rax)
  3a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  3e:	48 8b 00             	mov    (%rax),%rax
  41:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  45:	48 89 50 08          	mov    %rdx,0x8(%rax)
  49:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4d:	48 8b 10             	mov    (%rax),%rdx
  50:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  54:	48 89 10             	mov    %rdx,(%rax)
  57:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  5b:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
  5f:	48 89 10             	mov    %rdx,(%rax)
  62:	90                   	nop
  63:	5d                   	pop    %rbp
  64:	c3                   	retq   

0000000000000065 <list_next>:
  65:	55                   	push   %rbp
  66:	48 89 e5             	mov    %rsp,%rbp
  69:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  6d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  71:	48 8b 40 08          	mov    0x8(%rax),%rax
  75:	48 85 c0             	test   %rax,%rax
  78:	74 0a                	je     84 <list_next+0x1f>
  7a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  7e:	48 8b 40 08          	mov    0x8(%rax),%rax
  82:	eb 05                	jmp    89 <list_next+0x24>
  84:	b8 00 00 00 00       	mov    $0x0,%eax
  89:	5d                   	pop    %rbp
  8a:	c3                   	retq   

000000000000008b <memcpy>:
  8b:	55                   	push   %rbp
  8c:	48 89 e5             	mov    %rsp,%rbp
  8f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  93:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  97:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  9b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  9f:	48 8d 50 07          	lea    0x7(%rax),%rdx
  a3:	48 85 c0             	test   %rax,%rax
  a6:	48 0f 48 c2          	cmovs  %rdx,%rax
  aa:	48 c1 f8 03          	sar    $0x3,%rax
  ae:	48 89 c1             	mov    %rax,%rcx
  b1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  b5:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  b9:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
  bd:	48 89 d7             	mov    %rdx,%rdi
  c0:	fc                   	cld    
  c1:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  c4:	a8 04                	test   $0x4,%al
  c6:	74 01                	je     c9 <memcpy+0x3e>
  c8:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
  c9:	a8 02                	test   $0x2,%al
  cb:	74 02                	je     cf <memcpy+0x44>
  cd:	66 a5                	movsw  %ds:(%rsi),%es:(%rdi)
  cf:	a8 01                	test   $0x1,%al
  d1:	74 01                	je     d4 <memcpy+0x49>
  d3:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
  d4:	89 f2                	mov    %esi,%edx
  d6:	89 4d fc             	mov    %ecx,-0x4(%rbp)
  d9:	89 7d f8             	mov    %edi,-0x8(%rbp)
  dc:	89 55 f4             	mov    %edx,-0xc(%rbp)
  df:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  e3:	5d                   	pop    %rbp
  e4:	c3                   	retq   

00000000000000e5 <memset>:
  e5:	55                   	push   %rbp
  e6:	48 89 e5             	mov    %rsp,%rbp
  e9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  ed:	89 f0                	mov    %esi,%eax
  ef:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  f3:	88 45 e4             	mov    %al,-0x1c(%rbp)
  f6:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
  fa:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
 101:	01 01 01 
 104:	48 0f af c2          	imul   %rdx,%rax
 108:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 10c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 110:	48 8d 50 07          	lea    0x7(%rax),%rdx
 114:	48 85 c0             	test   %rax,%rax
 117:	48 0f 48 c2          	cmovs  %rdx,%rax
 11b:	48 c1 f8 03          	sar    $0x3,%rax
 11f:	48 89 c1             	mov    %rax,%rcx
 122:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 126:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
 12a:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 12e:	48 89 d7             	mov    %rdx,%rdi
 131:	fc                   	cld    
 132:	f3 48 ab             	rep stos %rax,%es:(%rdi)
 135:	40 f6 c6 04          	test   $0x4,%sil
 139:	74 01                	je     13c <memset+0x57>
 13b:	ab                   	stos   %eax,%es:(%rdi)
 13c:	40 f6 c6 02          	test   $0x2,%sil
 140:	74 02                	je     144 <memset+0x5f>
 142:	66 ab                	stos   %ax,%es:(%rdi)
 144:	40 f6 c6 01          	test   $0x1,%sil
 148:	74 01                	je     14b <memset+0x66>
 14a:	aa                   	stos   %al,%es:(%rdi)
 14b:	89 f8                	mov    %edi,%eax
 14d:	89 ca                	mov    %ecx,%edx
 14f:	89 55 f4             	mov    %edx,-0xc(%rbp)
 152:	89 45 f0             	mov    %eax,-0x10(%rbp)
 155:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 159:	5d                   	pop    %rbp
 15a:	c3                   	retq   

000000000000015b <wrmsr>:
 15b:	55                   	push   %rbp
 15c:	48 89 e5             	mov    %rsp,%rbp
 15f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 163:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 167:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 16b:	48 c1 e8 20          	shr    $0x20,%rax
 16f:	48 89 c2             	mov    %rax,%rdx
 172:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 176:	89 c0                	mov    %eax,%eax
 178:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 17c:	0f 30                	wrmsr  
 17e:	90                   	nop
 17f:	5d                   	pop    %rbp
 180:	c3                   	retq   

0000000000000181 <get_current>:
 181:	55                   	push   %rbp
 182:	48 89 e5             	mov    %rsp,%rbp
 185:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 18c:	00 
 18d:	48 c7 c0 00 80 ff ff 	mov    $0xffffffffffff8000,%rax
 194:	48 21 e0             	and    %rsp,%rax
 197:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 19b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 19f:	5d                   	pop    %rbp
 1a0:	c3                   	retq   

00000000000001a1 <no_system_call>:
 1a1:	55                   	push   %rbp
 1a2:	48 89 e5             	mov    %rsp,%rbp
 1a5:	48 83 ec 10          	sub    $0x10,%rsp
 1a9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1ad:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1b1:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
 1b8:	48 89 c1             	mov    %rax,%rcx
 1bb:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 1c2:	00 00 00 
 1c5:	be 00 00 00 00       	mov    $0x0,%esi
 1ca:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 1cf:	b8 00 00 00 00       	mov    $0x0,%eax
 1d4:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 1db:	00 00 00 
 1de:	41 ff d0             	callq  *%r8
 1e1:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
 1e8:	c9                   	leaveq 
 1e9:	c3                   	retq   

00000000000001ea <sys_printf>:
 1ea:	55                   	push   %rbp
 1eb:	48 89 e5             	mov    %rsp,%rbp
 1ee:	48 83 ec 10          	sub    $0x10,%rsp
 1f2:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 1f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 1fa:	48 8b 40 60          	mov    0x60(%rax),%rax
 1fe:	48 89 c2             	mov    %rax,%rdx
 201:	be ff ff ff 00       	mov    $0xffffff,%esi
 206:	bf 00 00 00 00       	mov    $0x0,%edi
 20b:	b8 00 00 00 00       	mov    $0x0,%eax
 210:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 217:	00 00 00 
 21a:	ff d1                	callq  *%rcx
 21c:	b8 01 00 00 00       	mov    $0x1,%eax
 221:	c9                   	leaveq 
 222:	c3                   	retq   

0000000000000223 <set_tss64>:
 223:	55                   	push   %rbp
 224:	48 89 e5             	mov    %rsp,%rbp
 227:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 22b:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 22f:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
 233:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
 237:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
 23b:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
 23f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 246:	00 00 00 
 249:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 24d:	48 89 02             	mov    %rax,(%rdx)
 250:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 257:	00 00 00 
 25a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 25e:	48 89 02             	mov    %rax,(%rdx)
 261:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 268:	00 00 00 
 26b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 26f:	48 89 02             	mov    %rax,(%rdx)
 272:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 279:	00 00 00 
 27c:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 280:	48 89 02             	mov    %rax,(%rdx)
 283:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 28a:	00 00 00 
 28d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 291:	48 89 02             	mov    %rax,(%rdx)
 294:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 29b:	00 00 00 
 29e:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 2a2:	48 89 02             	mov    %rax,(%rdx)
 2a5:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2ac:	00 00 00 
 2af:	48 8b 45 10          	mov    0x10(%rbp),%rax
 2b3:	48 89 02             	mov    %rax,(%rdx)
 2b6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2bd:	00 00 00 
 2c0:	48 8b 45 18          	mov    0x18(%rbp),%rax
 2c4:	48 89 02             	mov    %rax,(%rdx)
 2c7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2ce:	00 00 00 
 2d1:	48 8b 45 20          	mov    0x20(%rbp),%rax
 2d5:	48 89 02             	mov    %rax,(%rdx)
 2d8:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2df:	00 00 00 
 2e2:	48 8b 45 28          	mov    0x28(%rbp),%rax
 2e6:	48 89 02             	mov    %rax,(%rdx)
 2e9:	90                   	nop
 2ea:	5d                   	pop    %rbp
 2eb:	c3                   	retq   

00000000000002ec <user_level_function>:
 2ec:	55                   	push   %rbp
 2ed:	48 89 e5             	mov    %rsp,%rbp
 2f0:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 2f7:	00 
 2f8:	48 b8 48 65 6c 6c 6f 	movabs $0x6f57206f6c6c6548,%rax
 2ff:	20 57 6f 
 302:	48 89 45 ea          	mov    %rax,-0x16(%rbp)
 306:	c7 45 f2 72 6c 64 21 	movl   $0x21646c72,-0xe(%rbp)
 30d:	66 c7 45 f6 0a 00    	movw   $0xa,-0xa(%rbp)
 313:	b8 01 00 00 00       	mov    $0x1,%eax
 318:	48 8d 55 ea          	lea    -0x16(%rbp),%rdx
 31c:	48 89 d7             	mov    %rdx,%rdi
 31f:	48 8d 15 05 00 00 00 	lea    0x5(%rip),%rdx        # 32b <sysexit_return_address>
 326:	48 89 e1             	mov    %rsp,%rcx
 329:	0f 34                	sysenter 

000000000000032b <sysexit_return_address>:
 32b:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 32f:	eb fe                	jmp    32f <sysexit_return_address+0x4>

0000000000000331 <do_execve>:
 331:	55                   	push   %rbp
 332:	48 89 e5             	mov    %rsp,%rbp
 335:	48 83 ec 10          	sub    $0x10,%rsp
 339:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 33d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 341:	48 c7 40 50 00 00 80 	movq   $0x800000,0x50(%rax)
 348:	00 
 349:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 34d:	48 c7 40 48 00 00 a0 	movq   $0xa00000,0x48(%rax)
 354:	00 
 355:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 359:	48 c7 80 80 00 00 00 	movq   $0x1,0x80(%rax)
 360:	01 00 00 00 
 364:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 368:	48 c7 40 70 00 00 00 	movq   $0x0,0x70(%rax)
 36f:	00 
 370:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 374:	48 c7 40 78 00 00 00 	movq   $0x0,0x78(%rax)
 37b:	00 
 37c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 383:	00 00 00 
 386:	be 00 00 00 00       	mov    $0x0,%esi
 38b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 390:	b8 00 00 00 00       	mov    $0x0,%eax
 395:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 39c:	00 00 00 
 39f:	ff d1                	callq  *%rcx
 3a1:	ba 00 04 00 00       	mov    $0x400,%edx
 3a6:	be 00 00 80 00       	mov    $0x800000,%esi
 3ab:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
 3b2:	00 00 00 
 3b5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 3bc:	00 00 00 
 3bf:	ff d0                	callq  *%rax
 3c1:	b8 00 00 00 00       	mov    $0x0,%eax
 3c6:	c9                   	leaveq 
 3c7:	c3                   	retq   

00000000000003c8 <init>:
 3c8:	55                   	push   %rbp
 3c9:	48 89 e5             	mov    %rsp,%rbp
 3cc:	53                   	push   %rbx
 3cd:	48 83 ec 28          	sub    $0x28,%rsp
 3d1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
 3d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3d9:	48 89 c1             	mov    %rax,%rcx
 3dc:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 3e3:	00 00 00 
 3e6:	be 00 00 00 00       	mov    $0x0,%esi
 3eb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 3f0:	b8 00 00 00 00       	mov    $0x0,%eax
 3f5:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 3fc:	00 00 00 
 3ff:	41 ff d0             	callq  *%r8
 402:	b8 00 00 00 00       	mov    $0x0,%eax
 407:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 40e:	00 00 00 
 411:	ff d2                	callq  *%rdx
 413:	48 8b 40 28          	mov    0x28(%rax),%rax
 417:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 41e:	00 00 00 
 421:	48 89 50 08          	mov    %rdx,0x8(%rax)
 425:	b8 00 00 00 00       	mov    $0x0,%eax
 42a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 431:	00 00 00 
 434:	ff d2                	callq  *%rdx
 436:	48 89 c3             	mov    %rax,%rbx
 439:	b8 00 00 00 00       	mov    $0x0,%eax
 43e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 445:	00 00 00 
 448:	ff d2                	callq  *%rdx
 44a:	48 8b 40 28          	mov    0x28(%rax),%rax
 44e:	48 8d 93 40 7f 00 00 	lea    0x7f40(%rbx),%rdx
 455:	48 89 50 10          	mov    %rdx,0x10(%rax)
 459:	b8 00 00 00 00       	mov    $0x0,%eax
 45e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 465:	00 00 00 
 468:	ff d2                	callq  *%rdx
 46a:	48 8b 40 28          	mov    0x28(%rax),%rax
 46e:	48 8b 40 10          	mov    0x10(%rax),%rax
 472:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 476:	b8 00 00 00 00       	mov    $0x0,%eax
 47b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 482:	00 00 00 
 485:	ff d2                	callq  *%rdx
 487:	48 8b 58 28          	mov    0x28(%rax),%rbx
 48b:	b8 00 00 00 00       	mov    $0x0,%eax
 490:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 497:	00 00 00 
 49a:	ff d2                	callq  *%rdx
 49c:	48 8b 50 28          	mov    0x28(%rax),%rdx
 4a0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 4a4:	48 89 c7             	mov    %rax,%rdi
 4a7:	48 8b 63 10          	mov    0x10(%rbx),%rsp
 4ab:	ff 72 08             	pushq  0x8(%rdx)
 4ae:	e9 7e fe ff ff       	jmpq   331 <do_execve>
 4b3:	b8 01 00 00 00       	mov    $0x1,%eax
 4b8:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
 4bc:	c9                   	leaveq 
 4bd:	c3                   	retq   

00000000000004be <do_fork>:
 4be:	55                   	push   %rbp
 4bf:	48 89 e5             	mov    %rsp,%rbp
 4c2:	53                   	push   %rbx
 4c3:	48 83 ec 48          	sub    $0x48,%rsp
 4c7:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
 4cb:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
 4cf:	48 89 55 b8          	mov    %rdx,-0x48(%rbp)
 4d3:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
 4d7:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
 4de:	00 
 4df:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
 4e6:	00 
 4e7:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
 4ee:	00 
 4ef:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 4f6:	00 00 00 
 4f9:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
 500:	48 8b 00             	mov    (%rax),%rax
 503:	48 89 c1             	mov    %rax,%rcx
 506:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 50d:	00 00 00 
 510:	be 00 00 00 00       	mov    $0x0,%esi
 515:	bf ff ff ff 00       	mov    $0xffffff,%edi
 51a:	b8 00 00 00 00       	mov    $0x0,%eax
 51f:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 526:	00 00 00 
 529:	41 ff d0             	callq  *%r8
 52c:	ba 91 00 00 00       	mov    $0x91,%edx
 531:	be 01 00 00 00       	mov    $0x1,%esi
 536:	bf 02 00 00 00       	mov    $0x2,%edi
 53b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 542:	00 00 00 
 545:	ff d0                	callq  *%rax
 547:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 54b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 552:	00 00 00 
 555:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
 55c:	48 8b 00             	mov    (%rax),%rax
 55f:	48 89 c1             	mov    %rax,%rcx
 562:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 569:	00 00 00 
 56c:	be 00 00 00 00       	mov    $0x0,%esi
 571:	bf ff ff ff 00       	mov    $0xffffff,%edi
 576:	b8 00 00 00 00       	mov    $0x0,%eax
 57b:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 582:	00 00 00 
 585:	41 ff d0             	callq  *%r8
 588:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 58c:	48 8b 40 08          	mov    0x8(%rax),%rax
 590:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
 597:	80 ff ff 
 59a:	48 01 d0             	add    %rdx,%rax
 59d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 5a1:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5a5:	48 89 c1             	mov    %rax,%rcx
 5a8:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 5af:	00 00 00 
 5b2:	be 00 00 00 00       	mov    $0x0,%esi
 5b7:	bf ff ff ff 00       	mov    $0xffffff,%edi
 5bc:	b8 00 00 00 00       	mov    $0x0,%eax
 5c1:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 5c8:	00 00 00 
 5cb:	41 ff d0             	callq  *%r8
 5ce:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5d2:	ba 58 00 00 00       	mov    $0x58,%edx
 5d7:	be 00 00 00 00       	mov    $0x0,%esi
 5dc:	48 89 c7             	mov    %rax,%rdi
 5df:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 5e6:	00 00 00 
 5e9:	ff d0                	callq  *%rax
 5eb:	b8 00 00 00 00       	mov    $0x0,%eax
 5f0:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 5f7:	00 00 00 
 5fa:	ff d2                	callq  *%rdx
 5fc:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
 600:	48 8b 08             	mov    (%rax),%rcx
 603:	48 8b 58 08          	mov    0x8(%rax),%rbx
 607:	48 89 0a             	mov    %rcx,(%rdx)
 60a:	48 89 5a 08          	mov    %rbx,0x8(%rdx)
 60e:	48 8b 48 10          	mov    0x10(%rax),%rcx
 612:	48 8b 58 18          	mov    0x18(%rax),%rbx
 616:	48 89 4a 10          	mov    %rcx,0x10(%rdx)
 61a:	48 89 5a 18          	mov    %rbx,0x18(%rdx)
 61e:	48 8b 48 20          	mov    0x20(%rax),%rcx
 622:	48 8b 58 28          	mov    0x28(%rax),%rbx
 626:	48 89 4a 20          	mov    %rcx,0x20(%rdx)
 62a:	48 89 5a 28          	mov    %rbx,0x28(%rdx)
 62e:	48 8b 48 30          	mov    0x30(%rax),%rcx
 632:	48 8b 58 38          	mov    0x38(%rax),%rbx
 636:	48 89 4a 30          	mov    %rcx,0x30(%rdx)
 63a:	48 89 5a 38          	mov    %rbx,0x38(%rdx)
 63e:	48 8b 48 40          	mov    0x40(%rax),%rcx
 642:	48 8b 58 48          	mov    0x48(%rax),%rbx
 646:	48 89 4a 40          	mov    %rcx,0x40(%rdx)
 64a:	48 89 5a 48          	mov    %rbx,0x48(%rdx)
 64e:	48 8b 40 50          	mov    0x50(%rax),%rax
 652:	48 89 42 50          	mov    %rax,0x50(%rdx)
 656:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 65a:	48 89 c7             	mov    %rax,%rdi
 65d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 664:	00 00 00 
 667:	ff d0                	callq  *%rax
 669:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 66d:	48 89 c6             	mov    %rax,%rsi
 670:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
 677:	00 00 00 
 67a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 681:	00 00 00 
 684:	ff d0                	callq  *%rax
 686:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 68a:	48 8b 40 38          	mov    0x38(%rax),%rax
 68e:	48 8d 50 01          	lea    0x1(%rax),%rdx
 692:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 696:	48 89 50 38          	mov    %rdx,0x38(%rax)
 69a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 69e:	48 c7 40 10 04 00 00 	movq   $0x4,0x10(%rax)
 6a5:	00 
 6a6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 6aa:	48 83 c0 58          	add    $0x58,%rax
 6ae:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 6b2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 6b6:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
 6ba:	48 89 50 28          	mov    %rdx,0x28(%rax)
 6be:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 6c2:	48 05 40 7f 00 00    	add    $0x7f40,%rax
 6c8:	48 89 c1             	mov    %rax,%rcx
 6cb:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 6cf:	ba c0 00 00 00       	mov    $0xc0,%edx
 6d4:	48 89 ce             	mov    %rcx,%rsi
 6d7:	48 89 c7             	mov    %rax,%rdi
 6da:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 6e1:	00 00 00 
 6e4:	ff d0                	callq  *%rax
 6e6:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 6ea:	48 8d 90 00 80 00 00 	lea    0x8000(%rax),%rdx
 6f1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 6f5:	48 89 10             	mov    %rdx,(%rax)
 6f8:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 6fc:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
 703:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 707:	48 89 50 08          	mov    %rdx,0x8(%rax)
 70b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 70f:	48 8d 90 40 7f 00 00 	lea    0x7f40(%rax),%rdx
 716:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 71a:	48 89 50 10          	mov    %rdx,0x10(%rax)
 71e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 722:	48 8b 40 18          	mov    0x18(%rax),%rax
 726:	83 e0 01             	and    $0x1,%eax
 729:	48 85 c0             	test   %rax,%rax
 72c:	75 28                	jne    756 <do_fork+0x298>
 72e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 735:	00 00 00 
 738:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 73c:	48 89 90 98 00 00 00 	mov    %rdx,0x98(%rax)
 743:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
 747:	48 8b 90 98 00 00 00 	mov    0x98(%rax),%rdx
 74e:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 752:	48 89 50 08          	mov    %rdx,0x8(%rax)
 756:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 75a:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
 761:	00 
 762:	b8 00 00 00 00       	mov    $0x0,%eax
 767:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
 76b:	c9                   	leaveq 
 76c:	c3                   	retq   

000000000000076d <do_exit>:
 76d:	55                   	push   %rbp
 76e:	48 89 e5             	mov    %rsp,%rbp
 771:	48 83 ec 10          	sub    $0x10,%rsp
 775:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 779:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 77d:	48 89 c1             	mov    %rax,%rcx
 780:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 787:	00 00 00 
 78a:	be 00 00 00 00       	mov    $0x0,%esi
 78f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 794:	b8 00 00 00 00       	mov    $0x0,%eax
 799:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 7a0:	00 00 00 
 7a3:	41 ff d0             	callq  *%r8
 7a6:	eb fe                	jmp    7a6 <do_exit+0x39>

00000000000007a8 <system_call_function>:
 7a8:	55                   	push   %rbp
 7a9:	48 89 e5             	mov    %rsp,%rbp
 7ac:	48 83 ec 10          	sub    $0x10,%rsp
 7b0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 7b4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7b8:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
 7bf:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 7c6:	00 00 00 
 7c9:	48 8b 14 c2          	mov    (%rdx,%rax,8),%rdx
 7cd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 7d1:	48 89 c7             	mov    %rax,%rdi
 7d4:	ff d2                	callq  *%rdx
 7d6:	c9                   	leaveq 
 7d7:	c3                   	retq   

00000000000007d8 <kernel_thread_func>:
 7d8:	41 5f                	pop    %r15
 7da:	41 5e                	pop    %r14
 7dc:	41 5d                	pop    %r13
 7de:	41 5c                	pop    %r12
 7e0:	41 5b                	pop    %r11
 7e2:	41 5a                	pop    %r10
 7e4:	41 59                	pop    %r9
 7e6:	41 58                	pop    %r8
 7e8:	5b                   	pop    %rbx
 7e9:	59                   	pop    %rcx
 7ea:	5a                   	pop    %rdx
 7eb:	5e                   	pop    %rsi
 7ec:	5f                   	pop    %rdi
 7ed:	5d                   	pop    %rbp
 7ee:	58                   	pop    %rax
 7ef:	48 8e d8             	mov    %rax,%ds
 7f2:	58                   	pop    %rax
 7f3:	48 8e c0             	mov    %rax,%es
 7f6:	58                   	pop    %rax
 7f7:	48 83 c4 38          	add    $0x38,%rsp
 7fb:	48 89 d7             	mov    %rdx,%rdi
 7fe:	ff d3                	callq  *%rbx
 800:	48 89 c7             	mov    %rax,%rdi
 803:	e8 00 00 00 00       	callq  808 <kernel_thread>

0000000000000808 <kernel_thread>:
 808:	55                   	push   %rbp
 809:	48 89 e5             	mov    %rsp,%rbp
 80c:	48 81 ec e0 00 00 00 	sub    $0xe0,%rsp
 813:	48 89 bd 38 ff ff ff 	mov    %rdi,-0xc8(%rbp)
 81a:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
 821:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
 828:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
 82f:	ba c0 00 00 00       	mov    $0xc0,%edx
 834:	be 00 00 00 00       	mov    $0x0,%esi
 839:	48 89 c7             	mov    %rax,%rdi
 83c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 843:	00 00 00 
 846:	ff d0                	callq  *%rax
 848:	48 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%rax
 84f:	48 89 45 80          	mov    %rax,-0x80(%rbp)
 853:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
 85a:	48 89 45 90          	mov    %rax,-0x70(%rbp)
 85e:	48 c7 45 b0 10 00 00 	movq   $0x10,-0x50(%rbp)
 865:	00 
 866:	48 c7 45 b8 10 00 00 	movq   $0x10,-0x48(%rbp)
 86d:	00 
 86e:	48 c7 45 e0 08 00 00 	movq   $0x8,-0x20(%rbp)
 875:	00 
 876:	48 c7 45 f8 10 00 00 	movq   $0x10,-0x8(%rbp)
 87d:	00 
 87e:	48 c7 45 e8 00 02 00 	movq   $0x200,-0x18(%rbp)
 885:	00 
 886:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 88d:	00 00 00 
 890:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 894:	48 8b b5 28 ff ff ff 	mov    -0xd8(%rbp),%rsi
 89b:	48 8d 85 40 ff ff ff 	lea    -0xc0(%rbp),%rax
 8a2:	b9 00 00 00 00       	mov    $0x0,%ecx
 8a7:	ba 00 00 00 00       	mov    $0x0,%edx
 8ac:	48 89 c7             	mov    %rax,%rdi
 8af:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8b6:	00 00 00 
 8b9:	ff d0                	callq  *%rax
 8bb:	c9                   	leaveq 
 8bc:	c3                   	retq   

00000000000008bd <__switch_to>:
 8bd:	55                   	push   %rbp
 8be:	48 89 e5             	mov    %rsp,%rbp
 8c1:	53                   	push   %rbx
 8c2:	48 83 ec 18          	sub    $0x18,%rsp
 8c6:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 8ca:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 8ce:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 8d2:	48 8b 40 28          	mov    0x28(%rax),%rax
 8d6:	48 8b 00             	mov    (%rax),%rax
 8d9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 8e0:	00 00 00 
 8e3:	48 89 42 04          	mov    %rax,0x4(%rdx)
 8e7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8ee:	00 00 00 
 8f1:	4c 8b 50 54          	mov    0x54(%rax),%r10
 8f5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 8fc:	00 00 00 
 8ff:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
 903:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 90a:	00 00 00 
 90d:	4c 8b 40 44          	mov    0x44(%rax),%r8
 911:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 918:	00 00 00 
 91b:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
 91f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 926:	00 00 00 
 929:	48 8b 58 34          	mov    0x34(%rax),%rbx
 92d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 934:	00 00 00 
 937:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
 93b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 942:	00 00 00 
 945:	48 8b 48 24          	mov    0x24(%rax),%rcx
 949:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 950:	00 00 00 
 953:	48 8b 50 14          	mov    0x14(%rax),%rdx
 957:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 95e:	00 00 00 
 961:	48 8b 70 0c          	mov    0xc(%rax),%rsi
 965:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 96c:	00 00 00 
 96f:	48 8b 40 04          	mov    0x4(%rax),%rax
 973:	41 52                	push   %r10
 975:	41 51                	push   %r9
 977:	41 50                	push   %r8
 979:	57                   	push   %rdi
 97a:	49 89 d9             	mov    %rbx,%r9
 97d:	4d 89 d8             	mov    %r11,%r8
 980:	48 89 c7             	mov    %rax,%rdi
 983:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 98a:	00 00 00 
 98d:	ff d0                	callq  *%rax
 98f:	48 83 c4 20          	add    $0x20,%rsp
 993:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 997:	48 8b 50 28          	mov    0x28(%rax),%rdx
 99b:	48 8c e0             	mov    %fs,%rax
 99e:	48 89 42 18          	mov    %rax,0x18(%rdx)
 9a2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 9a6:	48 8b 50 28          	mov    0x28(%rax),%rdx
 9aa:	48 8c e8             	mov    %gs,%rax
 9ad:	48 89 42 20          	mov    %rax,0x20(%rdx)
 9b1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 9b5:	48 8b 40 28          	mov    0x28(%rax),%rax
 9b9:	48 8b 40 18          	mov    0x18(%rax),%rax
 9bd:	48 8e e0             	mov    %rax,%fs
 9c0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 9c4:	48 8b 40 28          	mov    0x28(%rax),%rax
 9c8:	48 8b 40 20          	mov    0x20(%rax),%rax
 9cc:	48 8e e8             	mov    %rax,%gs
 9cf:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 9d3:	48 8b 40 28          	mov    0x28(%rax),%rax
 9d7:	48 8b 00             	mov    (%rax),%rax
 9da:	48 89 c1             	mov    %rax,%rcx
 9dd:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 9e4:	00 00 00 
 9e7:	be 00 00 00 00       	mov    $0x0,%esi
 9ec:	bf ff ff ff 00       	mov    $0xffffff,%edi
 9f1:	b8 00 00 00 00       	mov    $0x0,%eax
 9f6:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 9fd:	00 00 00 
 a00:	41 ff d0             	callq  *%r8
 a03:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 a07:	48 8b 40 28          	mov    0x28(%rax),%rax
 a0b:	48 8b 00             	mov    (%rax),%rax
 a0e:	48 89 c1             	mov    %rax,%rcx
 a11:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 a18:	00 00 00 
 a1b:	be 00 00 00 00       	mov    $0x0,%esi
 a20:	bf ff ff ff 00       	mov    $0xffffff,%edi
 a25:	b8 00 00 00 00       	mov    $0x0,%eax
 a2a:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 a31:	00 00 00 
 a34:	41 ff d0             	callq  *%r8
 a37:	90                   	nop
 a38:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
 a3c:	c9                   	leaveq 
 a3d:	c3                   	retq   

0000000000000a3e <task_init>:
 a3e:	55                   	push   %rbp
 a3f:	48 89 e5             	mov    %rsp,%rbp
 a42:	41 56                	push   %r14
 a44:	41 55                	push   %r13
 a46:	41 54                	push   %r12
 a48:	53                   	push   %rbx
 a49:	48 83 ec 10          	sub    $0x10,%rsp
 a4d:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
 a54:	00 
 a55:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a5c:	00 00 00 
 a5f:	48 8b 00             	mov    (%rax),%rax
 a62:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 a69:	00 00 00 
 a6c:	48 89 02             	mov    %rax,(%rdx)
 a6f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a76:	00 00 00 
 a79:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
 a80:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 a87:	00 00 00 
 a8a:	48 89 42 08          	mov    %rax,0x8(%rdx)
 a8e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 a95:	00 00 00 
 a98:	48 8b 80 d8 02 00 00 	mov    0x2d8(%rax),%rax
 a9f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 aa6:	00 00 00 
 aa9:	48 89 42 10          	mov    %rax,0x10(%rdx)
 aad:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 ab4:	00 00 00 
 ab7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 abe:	00 00 00 
 ac1:	48 89 50 18          	mov    %rdx,0x18(%rax)
 ac5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 acc:	00 00 00 
 acf:	48 8b 80 e0 02 00 00 	mov    0x2e0(%rax),%rax
 ad6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 add:	00 00 00 
 ae0:	48 89 42 20          	mov    %rax,0x20(%rdx)
 ae4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 aeb:	00 00 00 
 aee:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 af5:	00 00 00 
 af8:	48 89 50 28          	mov    %rdx,0x28(%rax)
 afc:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 b03:	00 00 00 
 b06:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b0d:	00 00 00 
 b10:	48 89 50 30          	mov    %rdx,0x30(%rax)
 b14:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b1b:	00 00 00 
 b1e:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
 b25:	00 
 b26:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b2d:	00 00 00 
 b30:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
 b37:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 b3e:	00 00 00 
 b41:	48 89 42 40          	mov    %rax,0x40(%rdx)
 b45:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b4c:	00 00 00 
 b4f:	48 8b 00             	mov    (%rax),%rax
 b52:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 b59:	00 00 00 
 b5c:	48 89 42 48          	mov    %rax,0x48(%rdx)
 b60:	be 08 00 00 00       	mov    $0x8,%esi
 b65:	bf 74 01 00 00       	mov    $0x174,%edi
 b6a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b71:	00 00 00 
 b74:	ff d0                	callq  *%rax
 b76:	b8 00 00 00 00       	mov    $0x0,%eax
 b7b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 b82:	00 00 00 
 b85:	ff d2                	callq  *%rdx
 b87:	48 8b 40 28          	mov    0x28(%rax),%rax
 b8b:	48 8b 00             	mov    (%rax),%rax
 b8e:	48 89 c6             	mov    %rax,%rsi
 b91:	bf 75 01 00 00       	mov    $0x175,%edi
 b96:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 b9d:	00 00 00 
 ba0:	ff d0                	callq  *%rax
 ba2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 ba9:	00 00 00 
 bac:	48 89 c6             	mov    %rax,%rsi
 baf:	bf 76 01 00 00       	mov    $0x176,%edi
 bb4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 bbb:	00 00 00 
 bbe:	ff d0                	callq  *%rax
 bc0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 bc7:	00 00 00 
 bca:	4c 8b 50 54          	mov    0x54(%rax),%r10
 bce:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 bd5:	00 00 00 
 bd8:	4c 8b 48 4c          	mov    0x4c(%rax),%r9
 bdc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 be3:	00 00 00 
 be6:	4c 8b 40 44          	mov    0x44(%rax),%r8
 bea:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 bf1:	00 00 00 
 bf4:	48 8b 78 3c          	mov    0x3c(%rax),%rdi
 bf8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 bff:	00 00 00 
 c02:	48 8b 58 34          	mov    0x34(%rax),%rbx
 c06:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c0d:	00 00 00 
 c10:	4c 8b 58 2c          	mov    0x2c(%rax),%r11
 c14:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c1b:	00 00 00 
 c1e:	48 8b 48 24          	mov    0x24(%rax),%rcx
 c22:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c29:	00 00 00 
 c2c:	48 8b 50 14          	mov    0x14(%rax),%rdx
 c30:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c37:	00 00 00 
 c3a:	48 8b 70 0c          	mov    0xc(%rax),%rsi
 c3e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c45:	00 00 00 
 c48:	48 8b 00             	mov    (%rax),%rax
 c4b:	41 52                	push   %r10
 c4d:	41 51                	push   %r9
 c4f:	41 50                	push   %r8
 c51:	57                   	push   %rdi
 c52:	49 89 d9             	mov    %rbx,%r9
 c55:	4d 89 d8             	mov    %r11,%r8
 c58:	48 89 c7             	mov    %rax,%rdi
 c5b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c62:	00 00 00 
 c65:	ff d0                	callq  *%rax
 c67:	48 83 c4 20          	add    $0x20,%rsp
 c6b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c72:	00 00 00 
 c75:	48 8b 00             	mov    (%rax),%rax
 c78:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 c7f:	00 00 00 
 c82:	48 89 42 04          	mov    %rax,0x4(%rdx)
 c86:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
 c8d:	00 00 00 
 c90:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 c97:	00 00 00 
 c9a:	ff d0                	callq  *%rax
 c9c:	ba 07 00 00 00       	mov    $0x7,%edx
 ca1:	be 0a 00 00 00       	mov    $0xa,%esi
 ca6:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
 cad:	00 00 00 
 cb0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 cb7:	00 00 00 
 cba:	ff d0                	callq  *%rax
 cbc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 cc3:	00 00 00 
 cc6:	48 c7 40 10 01 00 00 	movq   $0x1,0x10(%rax)
 ccd:	00 
 cce:	b8 00 00 00 00       	mov    $0x0,%eax
 cd3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 cda:	00 00 00 
 cdd:	ff d2                	callq  *%rdx
 cdf:	48 89 c7             	mov    %rax,%rdi
 ce2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 ce9:	00 00 00 
 cec:	ff d0                	callq  *%rax
 cee:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
 cf2:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
 cf6:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 cfa:	b8 00 00 00 00       	mov    $0x0,%eax
 cff:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 d06:	00 00 00 
 d09:	ff d2                	callq  *%rdx
 d0b:	48 8b 58 28          	mov    0x28(%rax),%rbx
 d0f:	b8 00 00 00 00       	mov    $0x0,%eax
 d14:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 d1b:	00 00 00 
 d1e:	ff d2                	callq  *%rdx
 d20:	4c 8b 70 28          	mov    0x28(%rax),%r14
 d24:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 d28:	4c 8b 60 28          	mov    0x28(%rax),%r12
 d2c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 d30:	4c 8b 68 28          	mov    0x28(%rax),%r13
 d34:	b8 00 00 00 00       	mov    $0x0,%eax
 d39:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 d40:	00 00 00 
 d43:	ff d2                	callq  *%rdx
 d45:	48 89 c2             	mov    %rax,%rdx
 d48:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 d4c:	48 89 d7             	mov    %rdx,%rdi
 d4f:	48 89 c6             	mov    %rax,%rsi
 d52:	55                   	push   %rbp
 d53:	50                   	push   %rax
 d54:	48 89 63 10          	mov    %rsp,0x10(%rbx)
 d58:	49 8b 64 24 10       	mov    0x10(%r12),%rsp
 d5d:	48 8d 05 0d 00 00 00 	lea    0xd(%rip),%rax        # d71 <task_init+0x333>
 d64:	49 89 46 08          	mov    %rax,0x8(%r14)
 d68:	41 ff 75 08          	pushq  0x8(%r13)
 d6c:	e9 4c fb ff ff       	jmpq   8bd <__switch_to>
 d71:	58                   	pop    %rax
 d72:	5d                   	pop    %rbp
 d73:	90                   	nop
 d74:	48 8d 65 e0          	lea    -0x20(%rbp),%rsp
 d78:	5b                   	pop    %rbx
 d79:	41 5c                	pop    %r12
 d7b:	41 5d                	pop    %r13
 d7d:	41 5e                	pop    %r14
 d7f:	5d                   	pop    %rbp
 d80:	c3                   	retq   

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

0000000000001000 <init_thread>:
	...
    1018:	10 00                	adc    %al,(%rax)
    101a:	00 00                	add    %al,(%rax)
    101c:	00 00                	add    %al,(%rax)
    101e:	00 00                	add    %al,(%rax)
    1020:	10 00                	adc    %al,(%rax)
	...

0000000000001040 <init_task>:
	...

0000000000001080 <init_tss>:
	...
    10a4:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    10a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10ae:	00 00                	add    %al,(%rax)
    10b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10b6:	00 00                	add    %al,(%rax)
    10b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10be:	00 00                	add    %al,(%rax)
    10c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10c6:	00 00                	add    %al,(%rax)
    10c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10ce:	00 00                	add    %al,(%rax)
    10d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    10d6:	00 00                	add    %al,(%rax)
    10d8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    110a:	00 00                	add    %al,(%rax)
    110c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    1110:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1116:	00 00                	add    %al,(%rax)
    1118:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    111e:	00 00                	add    %al,(%rax)
    1120:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1126:	00 00                	add    %al,(%rax)
    1128:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    112e:	00 00                	add    %al,(%rax)
    1130:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1136:	00 00                	add    %al,(%rax)
    1138:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    113e:	00 00                	add    %al,(%rax)
    1140:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    1172:	00 00                	add    %al,(%rax)
    1174:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    1178:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    117e:	00 00                	add    %al,(%rax)
    1180:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1186:	00 00                	add    %al,(%rax)
    1188:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    118e:	00 00                	add    %al,(%rax)
    1190:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1196:	00 00                	add    %al,(%rax)
    1198:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    119e:	00 00                	add    %al,(%rax)
    11a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    11a6:	00 00                	add    %al,(%rax)
    11a8:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    11da:	00 00                	add    %al,(%rax)
    11dc:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    11e0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    11e6:	00 00                	add    %al,(%rax)
    11e8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    11ee:	00 00                	add    %al,(%rax)
    11f0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    11f6:	00 00                	add    %al,(%rax)
    11f8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    11fe:	00 00                	add    %al,(%rax)
    1200:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1206:	00 00                	add    %al,(%rax)
    1208:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    120e:	00 00                	add    %al,(%rax)
    1210:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    1242:	00 00                	add    %al,(%rax)
    1244:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    1248:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    124e:	00 00                	add    %al,(%rax)
    1250:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1256:	00 00                	add    %al,(%rax)
    1258:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    125e:	00 00                	add    %al,(%rax)
    1260:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1266:	00 00                	add    %al,(%rax)
    1268:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    126e:	00 00                	add    %al,(%rax)
    1270:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1276:	00 00                	add    %al,(%rax)
    1278:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    12aa:	00 00                	add    %al,(%rax)
    12ac:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    12b0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12b6:	00 00                	add    %al,(%rax)
    12b8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12be:	00 00                	add    %al,(%rax)
    12c0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12c6:	00 00                	add    %al,(%rax)
    12c8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12ce:	00 00                	add    %al,(%rax)
    12d0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12d6:	00 00                	add    %al,(%rax)
    12d8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    12de:	00 00                	add    %al,(%rax)
    12e0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    1312:	00 00                	add    %al,(%rax)
    1314:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    1318:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    131e:	00 00                	add    %al,(%rax)
    1320:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1326:	00 00                	add    %al,(%rax)
    1328:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    132e:	00 00                	add    %al,(%rax)
    1330:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1336:	00 00                	add    %al,(%rax)
    1338:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    133e:	00 00                	add    %al,(%rax)
    1340:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1346:	00 00                	add    %al,(%rax)
    1348:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...
    137a:	00 00                	add    %al,(%rax)
    137c:	00 7c 00 00          	add    %bh,0x0(%rax,%rax,1)
    1380:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1386:	00 00                	add    %al,(%rax)
    1388:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    138e:	00 00                	add    %al,(%rax)
    1390:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    1396:	00 00                	add    %al,(%rax)
    1398:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    139e:	00 00                	add    %al,(%rax)
    13a0:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    13a6:	00 00                	add    %al,(%rax)
    13a8:	00 80 ff ff 00 7c    	add    %al,0x7c00ffff(%rax)
    13ae:	00 00                	add    %al,(%rax)
    13b0:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
	...

00000000000013c0 <system_call_table>:
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
	...

0000000000001040 <init_mm>:
	...

Disassembly of section .data.init_task:

0000000000000000 <init_task_union>:
	...
      10:	04 00                	add    $0x0,%al
      12:	00 00                	add    %al,(%rax)
      14:	00 00                	add    %al,(%rax)
      16:	00 00                	add    %al,(%rax)
      18:	01 00                	add    %eax,(%rax)
	...
      32:	00 00                	add    %al,(%rax)
      34:	00 80 ff ff 00 00    	add    %al,0xffff(%rax)
      3a:	00 00                	add    %al,(%rax)
      3c:	00 00                	add    %al,(%rax)
      3e:	00 00                	add    %al,(%rax)
      40:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .rodata:

0000000000000000 <.rodata>:
   0:	6e                   	outsb  %ds:(%rsi),(%dx)
   1:	6f                   	outsl  %ds:(%rsi),(%dx)
   2:	5f                   	pop    %rdi
   3:	73 79                	jae    7e <.rodata+0x7e>
   5:	73 74                	jae    7b <.rodata+0x7b>
   7:	65 6d                	gs insl (%dx),%es:(%rdi)
   9:	5f                   	pop    %rdi
   a:	63 61 6c             	movsxd 0x6c(%rcx),%esp
   d:	6c                   	insb   (%dx),%es:(%rdi)
   e:	20 69 73             	and    %ch,0x73(%rcx)
  11:	20 63 61             	and    %ah,0x61(%rbx)
  14:	6c                   	insb   (%dx),%es:(%rdi)
  15:	6c                   	insb   (%dx),%es:(%rdi)
  16:	69 6e 67 2c 4e 52 3a 	imul   $0x3a524e2c,0x67(%rsi),%ebp
  1d:	25 23 30 34 78       	and    $0x78343023,%eax
  22:	0a 00                	or     (%rax),%al
  24:	64 6f                	outsl  %fs:(%rsi),(%dx)
  26:	5f                   	pop    %rdi
  27:	65 78 65             	gs js  8f <.rodata+0x8f>
  2a:	63 76 65             	movsxd 0x65(%rsi),%esi
  2d:	20 74 61 73          	and    %dh,0x73(%rcx,%riz,2)
  31:	6b 20 69             	imul   $0x69,(%rax),%esp
  34:	73 20                	jae    56 <.rodata+0x56>
  36:	72 75                	jb     ad <.rodata+0xad>
  38:	6e                   	outsb  %ds:(%rsi),(%dx)
  39:	6e                   	outsb  %ds:(%rsi),(%dx)
  3a:	69 6e 67 0a 00 00 69 	imul   $0x6900000a,0x67(%rsi),%ebp
  41:	6e                   	outsb  %ds:(%rsi),(%dx)
  42:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
  49:	20 
  4a:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
  51:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
  58:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313081 <system_call_table+0x38311cc1>
  5e:	6c                   	insb   (%dx),%es:(%rdi)
  5f:	78 0a                	js     6b <.rodata+0x6b>
  61:	00 61 6c             	add    %ah,0x6c(%rcx)
  64:	6c                   	insb   (%dx),%es:(%rdi)
  65:	6f                   	outsl  %ds:(%rsi),(%dx)
  66:	63 5f 70             	movsxd 0x70(%rdi),%ebx
  69:	61                   	(bad)  
  6a:	67 65 73 2c          	addr32 gs jae 9a <.rodata+0x9a>
  6e:	62                   	(bad)  
  6f:	69 74 6d 61 70 3a 25 	imul   $0x23253a70,0x61(%rbp,%rbp,2),%esi
  76:	23 
  77:	30 31                	xor    %dh,(%rcx)
  79:	38 6c 78 0a          	cmp    %ch,0xa(%rax,%rdi,2)
  7d:	00 00                	add    %al,(%rax)
  7f:	00 73 74             	add    %dh,0x74(%rbx)
  82:	72 75                	jb     f9 <.rodata+0xf9>
  84:	63 74 20 74          	movsxd 0x74(%rax,%riz,1),%esi
  88:	61                   	(bad)  
  89:	73 6b                	jae    f6 <.rodata+0xf6>
  8b:	5f                   	pop    %rdi
  8c:	73 74                	jae    102 <memset+0x1d>
  8e:	72 75                	jb     105 <memset+0x20>
  90:	63 74 20 61          	movsxd 0x61(%rax,%riz,1),%esi
  94:	64 64 72 65          	fs fs jb fd <.rodata+0xfd>
  98:	73 73                	jae    10d <memset+0x28>
  9a:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130c3 <system_call_table+0x38311d03>
  a0:	6c                   	insb   (%dx),%es:(%rdi)
  a1:	78 0a                	js     ad <.rodata+0xad>
  a3:	00 00                	add    %al,(%rax)
  a5:	00 00                	add    %al,(%rax)
  a7:	00 65 78             	add    %ah,0x78(%rbp)
  aa:	69 74 20 74 61 73 6b 	imul   $0x206b7361,0x74(%rax,%riz,1),%esi
  b1:	20 
  b2:	69 73 20 72 75 6e 6e 	imul   $0x6e6e7572,0x20(%rbx),%esi
  b9:	69 6e 67 2c 61 72 67 	imul   $0x6772612c,0x67(%rsi),%ebp
  c0:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130e9 <system_call_table+0x38311d29>
  c6:	6c                   	insb   (%dx),%es:(%rdi)
  c7:	78 0a                	js     d3 <.rodata+0xd3>
  c9:	00 70 72             	add    %dh,0x72(%rax)
  cc:	65 76 2d             	gs jbe fc <.rodata+0xfc>
  cf:	3e 74 68             	je,pt  13a <memset+0x55>
  d2:	72 65                	jb     139 <memset+0x54>
  d4:	61                   	(bad)  
  d5:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
  db:	30 3a                	xor    %bh,(%rdx)
  dd:	25 23 30 31 38       	and    $0x38313023,%eax
  e2:	6c                   	insb   (%dx),%es:(%rdi)
  e3:	78 0a                	js     ef <.rodata+0xef>
  e5:	00 6e 65             	add    %ch,0x65(%rsi)
  e8:	78 74                	js     15e <wrmsr+0x3>
  ea:	2d 3e 74 68 72       	sub    $0x7268743e,%eax
  ef:	65 61                	gs (bad) 
  f1:	64 2d 3e 72 73 70    	fs sub $0x7073723e,%eax
  f7:	30 3a                	xor    %bh,(%rdx)
  f9:	25 23 30 31 38       	and    $0x38313023,%eax
  fe:	6c                   	insb   (%dx),%es:(%rdi)
  ff:	78 0a                	js     10b <memset+0x26>
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
  24:	22 00                	and    (%rax),%al
  26:	00 00                	add    %al,(%rax)
  28:	00 41 0e             	add    %al,0xe(%rcx)
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	5d                   	pop    %rbp
  32:	0c 07                	or     $0x7,%al
  34:	08 00                	or     %al,(%rax)
  36:	00 00                	add    %al,(%rax)
  38:	1c 00                	sbb    $0x0,%al
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	43 00 00             	rex.XB add %al,(%r8)
  47:	00 00                	add    %al,(%rax)
  49:	41 0e                	rex.B (bad) 
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	7e 0c                	jle    5f <.eh_frame+0x5f>
  53:	07                   	(bad)  
  54:	08 00                	or     %al,(%rax)
  56:	00 00                	add    %al,(%rax)
  58:	1c 00                	sbb    $0x0,%al
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 26                	add    %ah,(%rsi)
  65:	00 00                	add    %al,(%rax)
  67:	00 00                	add    %al,(%rax)
  69:	41 0e                	rex.B (bad) 
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	61                   	(bad)  
  72:	0c 07                	or     $0x7,%al
  74:	08 00                	or     %al,(%rax)
  76:	00 00                	add    %al,(%rax)
  78:	1c 00                	sbb    $0x0,%al
  7a:	00 00                	add    %al,(%rax)
  7c:	7c 00                	jl     7e <.eh_frame+0x7e>
  7e:	00 00                	add    %al,(%rax)
  80:	00 00                	add    %al,(%rax)
  82:	00 00                	add    %al,(%rax)
  84:	5a                   	pop    %rdx
  85:	00 00                	add    %al,(%rax)
  87:	00 00                	add    %al,(%rax)
  89:	41 0e                	rex.B (bad) 
  8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  91:	02 55 0c             	add    0xc(%rbp),%dl
  94:	07                   	(bad)  
  95:	08 00                	or     %al,(%rax)
  97:	00 1c 00             	add    %bl,(%rax,%rax,1)
  9a:	00 00                	add    %al,(%rax)
  9c:	9c                   	pushfq 
  9d:	00 00                	add    %al,(%rax)
  9f:	00 00                	add    %al,(%rax)
  a1:	00 00                	add    %al,(%rax)
  a3:	00 76 00             	add    %dh,0x0(%rsi)
  a6:	00 00                	add    %al,(%rax)
  a8:	00 41 0e             	add    %al,0xe(%rcx)
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	02 71 0c             	add    0xc(%rcx),%dh
  b4:	07                   	(bad)  
  b5:	08 00                	or     %al,(%rax)
  b7:	00 1c 00             	add    %bl,(%rax,%rax,1)
  ba:	00 00                	add    %al,(%rax)
  bc:	bc 00 00 00 00       	mov    $0x0,%esp
  c1:	00 00                	add    %al,(%rax)
  c3:	00 26                	add    %ah,(%rsi)
  c5:	00 00                	add    %al,(%rax)
  c7:	00 00                	add    %al,(%rax)
  c9:	41 0e                	rex.B (bad) 
  cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  d1:	61                   	(bad)  
  d2:	0c 07                	or     $0x7,%al
  d4:	08 00                	or     %al,(%rax)
  d6:	00 00                	add    %al,(%rax)
  d8:	1c 00                	sbb    $0x0,%al
  da:	00 00                	add    %al,(%rax)
  dc:	dc 00                	faddl  (%rax)
  de:	00 00                	add    %al,(%rax)
  e0:	00 00                	add    %al,(%rax)
  e2:	00 00                	add    %al,(%rax)
  e4:	20 00                	and    %al,(%rax)
  e6:	00 00                	add    %al,(%rax)
  e8:	00 41 0e             	add    %al,0xe(%rcx)
  eb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  f1:	5b                   	pop    %rbx
  f2:	0c 07                	or     $0x7,%al
  f4:	08 00                	or     %al,(%rax)
  f6:	00 00                	add    %al,(%rax)
  f8:	1c 00                	sbb    $0x0,%al
  fa:	00 00                	add    %al,(%rax)
  fc:	fc                   	cld    
  fd:	00 00                	add    %al,(%rax)
  ff:	00 00                	add    %al,(%rax)
 101:	00 00                	add    %al,(%rax)
 103:	00 49 00             	add    %cl,0x0(%rcx)
 106:	00 00                	add    %al,(%rax)
 108:	00 41 0e             	add    %al,0xe(%rcx)
 10b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 111:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
 115:	08 00                	or     %al,(%rax)
 117:	00 1c 00             	add    %bl,(%rax,%rax,1)
 11a:	00 00                	add    %al,(%rax)
 11c:	1c 01                	sbb    $0x1,%al
 11e:	00 00                	add    %al,(%rax)
 120:	00 00                	add    %al,(%rax)
 122:	00 00                	add    %al,(%rax)
 124:	39 00                	cmp    %eax,(%rax)
 126:	00 00                	add    %al,(%rax)
 128:	00 41 0e             	add    %al,0xe(%rcx)
 12b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 131:	74 0c                	je     13f <.eh_frame+0x13f>
 133:	07                   	(bad)  
 134:	08 00                	or     %al,(%rax)
 136:	00 00                	add    %al,(%rax)
 138:	1c 00                	sbb    $0x0,%al
 13a:	00 00                	add    %al,(%rax)
 13c:	3c 01                	cmp    $0x1,%al
 13e:	00 00                	add    %al,(%rax)
 140:	00 00                	add    %al,(%rax)
 142:	00 00                	add    %al,(%rax)
 144:	c9                   	leaveq 
 145:	00 00                	add    %al,(%rax)
 147:	00 00                	add    %al,(%rax)
 149:	41 0e                	rex.B (bad) 
 14b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 151:	02 c4                	add    %ah,%al
 153:	0c 07                	or     $0x7,%al
 155:	08 00                	or     %al,(%rax)
 157:	00 18                	add    %bl,(%rax)
 159:	00 00                	add    %al,(%rax)
 15b:	00 5c 01 00          	add    %bl,0x0(%rcx,%rax,1)
 15f:	00 00                	add    %al,(%rax)
 161:	00 00                	add    %al,(%rax)
 163:	00 45 00             	add    %al,0x0(%rbp)
 166:	00 00                	add    %al,(%rax)
 168:	00 41 0e             	add    %al,0xe(%rcx)
 16b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 171:	00 00                	add    %al,(%rax)
 173:	00 1c 00             	add    %bl,(%rax,%rax,1)
 176:	00 00                	add    %al,(%rax)
 178:	78 01                	js     17b <.eh_frame+0x17b>
 17a:	00 00                	add    %al,(%rax)
 17c:	00 00                	add    %al,(%rax)
 17e:	00 00                	add    %al,(%rax)
 180:	97                   	xchg   %eax,%edi
 181:	00 00                	add    %al,(%rax)
 183:	00 00                	add    %al,(%rax)
 185:	41 0e                	rex.B (bad) 
 187:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 18d:	02 92 0c 07 08 00    	add    0x8070c(%rdx),%dl
 193:	00 20                	add    %ah,(%rax)
 195:	00 00                	add    %al,(%rax)
 197:	00 98 01 00 00 00    	add    %bl,0x1(%rax)
 19d:	00 00                	add    %al,(%rax)
 19f:	00 f6                	add    %dh,%dh
 1a1:	00 00                	add    %al,(%rax)
 1a3:	00 00                	add    %al,(%rax)
 1a5:	41 0e                	rex.B (bad) 
 1a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1ad:	45 83 03 02          	rex.RB addl $0x2,(%r11)
 1b1:	ec                   	in     (%dx),%al
 1b2:	0c 07                	or     $0x7,%al
 1b4:	08 00                	or     %al,(%rax)
 1b6:	00 00                	add    %al,(%rax)
 1b8:	20 00                	and    %al,(%rax)
 1ba:	00 00                	add    %al,(%rax)
 1bc:	bc 01 00 00 00       	mov    $0x1,%esp
 1c1:	00 00                	add    %al,(%rax)
 1c3:	00 af 02 00 00 00    	add    %ch,0x2(%rdi)
 1c9:	41 0e                	rex.B (bad) 
 1cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1d1:	45 83 03 03          	rex.RB addl $0x3,(%r11)
 1d5:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
 1d6:	02 0c 07             	add    (%rdi,%rax,1),%cl
 1d9:	08 00                	or     %al,(%rax)
 1db:	00 18                	add    %bl,(%rax)
 1dd:	00 00                	add    %al,(%rax)
 1df:	00 e0                	add    %ah,%al
 1e1:	01 00                	add    %eax,(%rax)
 1e3:	00 00                	add    %al,(%rax)
 1e5:	00 00                	add    %al,(%rax)
 1e7:	00 3b                	add    %bh,(%rbx)
 1e9:	00 00                	add    %al,(%rax)
 1eb:	00 00                	add    %al,(%rax)
 1ed:	41 0e                	rex.B (bad) 
 1ef:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1f5:	00 00                	add    %al,(%rax)
 1f7:	00 1c 00             	add    %bl,(%rax,%rax,1)
 1fa:	00 00                	add    %al,(%rax)
 1fc:	fc                   	cld    
 1fd:	01 00                	add    %eax,(%rax)
 1ff:	00 00                	add    %al,(%rax)
 201:	00 00                	add    %al,(%rax)
 203:	00 30                	add    %dh,(%rax)
 205:	00 00                	add    %al,(%rax)
 207:	00 00                	add    %al,(%rax)
 209:	41 0e                	rex.B (bad) 
 20b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 211:	6b 0c 07 08          	imul   $0x8,(%rdi,%rax,1),%ecx
 215:	00 00                	add    %al,(%rax)
 217:	00 1c 00             	add    %bl,(%rax,%rax,1)
 21a:	00 00                	add    %al,(%rax)
 21c:	1c 02                	sbb    $0x2,%al
 21e:	00 00                	add    %al,(%rax)
 220:	00 00                	add    %al,(%rax)
 222:	00 00                	add    %al,(%rax)
 224:	b5 00                	mov    $0x0,%ch
 226:	00 00                	add    %al,(%rax)
 228:	00 41 0e             	add    %al,0xe(%rcx)
 22b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 231:	02 b0 0c 07 08 00    	add    0x8070c(%rax),%dh
 237:	00 20                	add    %ah,(%rax)
 239:	00 00                	add    %al,(%rax)
 23b:	00 3c 02             	add    %bh,(%rdx,%rax,1)
 23e:	00 00                	add    %al,(%rax)
 240:	00 00                	add    %al,(%rax)
 242:	00 00                	add    %al,(%rax)
 244:	81 01 00 00 00 41    	addl   $0x41000000,(%rcx)
 24a:	0e                   	(bad)  
 24b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 251:	45 83 03 03          	rex.RB addl $0x3,(%r11)
 255:	77 01                	ja     258 <.eh_frame+0x258>
 257:	0c 07                	or     $0x7,%al
 259:	08 00                	or     %al,(%rax)
 25b:	00 28                	add    %ch,(%rax)
 25d:	00 00                	add    %al,(%rax)
 25f:	00 60 02             	add    %ah,0x2(%rax)
 262:	00 00                	add    %al,(%rax)
 264:	00 00                	add    %al,(%rax)
 266:	00 00                	add    %al,(%rax)
 268:	43 03 00             	rex.XB add (%r8),%eax
 26b:	00 00                	add    %al,(%rax)
 26d:	41 0e                	rex.B (bad) 
 26f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 275:	4b 8e 03             	rex.WXB mov (%r11),%es
 278:	8d 04 8c             	lea    (%rsp,%rcx,4),%eax
 27b:	05 83 06 03 33       	add    $0x33030683,%eax
 280:	03 0c 07             	add    (%rdi,%rax,1),%ecx
 283:	08 00                	or     %al,(%rax)
 285:	00 00                	add    %al,(%rax)
	...
