
memory.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <memset>:
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
       8:	89 f0                	mov    %esi,%eax
       a:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
       e:	88 45 e4             	mov    %al,-0x1c(%rbp)
      11:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
      15:	48 ba 01 01 01 01 01 	movabs $0x101010101010101,%rdx
      1c:	01 01 01 
      1f:	48 0f af c2          	imul   %rdx,%rax
      23:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      27:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      2b:	48 8d 50 07          	lea    0x7(%rax),%rdx
      2f:	48 85 c0             	test   %rax,%rax
      32:	48 0f 48 c2          	cmovs  %rdx,%rax
      36:	48 c1 f8 03          	sar    $0x3,%rax
      3a:	48 89 c1             	mov    %rax,%rcx
      3d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      41:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
      45:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
      49:	48 89 d7             	mov    %rdx,%rdi
      4c:	fc                   	cld    
      4d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
      50:	40 f6 c6 04          	test   $0x4,%sil
      54:	74 01                	je     57 <memset+0x57>
      56:	ab                   	stos   %eax,%es:(%rdi)
      57:	40 f6 c6 02          	test   $0x2,%sil
      5b:	74 02                	je     5f <memset+0x5f>
      5d:	66 ab                	stos   %ax,%es:(%rdi)
      5f:	40 f6 c6 01          	test   $0x1,%sil
      63:	74 01                	je     66 <memset+0x66>
      65:	aa                   	stos   %al,%es:(%rdi)
      66:	89 f8                	mov    %edi,%eax
      68:	89 ca                	mov    %ecx,%edx
      6a:	89 55 f4             	mov    %edx,-0xc(%rbp)
      6d:	89 45 f0             	mov    %eax,-0x10(%rbp)
      70:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      74:	5d                   	pop    %rbp
      75:	c3                   	retq   

0000000000000076 <Get_gdt>:
      76:	55                   	push   %rbp
      77:	48 89 e5             	mov    %rsp,%rbp
      7a:	0f 20 d8             	mov    %cr3,%rax
      7d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      81:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      85:	5d                   	pop    %rbp
      86:	c3                   	retq   

0000000000000087 <page_init>:
      87:	55                   	push   %rbp
      88:	48 89 e5             	mov    %rsp,%rbp
      8b:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
      8f:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
      93:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      97:	48 8b 40 10          	mov    0x10(%rax),%rax
      9b:	48 85 c0             	test   %rax,%rax
      9e:	0f 85 c8 00 00 00    	jne    16c <page_init+0xe5>
      a4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      ab:	00 00 00 
      ae:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
      b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      b9:	48 8b 40 08          	mov    0x8(%rax),%rax
      bd:	48 c1 e8 1b          	shr    $0x1b,%rax
      c1:	48 c1 e0 03          	shl    $0x3,%rax
      c5:	48 01 d0             	add    %rdx,%rax
      c8:	48 8b 10             	mov    (%rax),%rdx
      cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      cf:	48 8b 40 08          	mov    0x8(%rax),%rax
      d3:	48 c1 e8 15          	shr    $0x15,%rax
      d7:	83 e0 3f             	and    $0x3f,%eax
      da:	be 01 00 00 00       	mov    $0x1,%esi
      df:	89 c1                	mov    %eax,%ecx
      e1:	48 d3 e6             	shl    %cl,%rsi
      e4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      eb:	00 00 00 
      ee:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
      f5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
      f9:	48 8b 40 08          	mov    0x8(%rax),%rax
      fd:	48 c1 e8 1b          	shr    $0x1b,%rax
     101:	48 c1 e0 03          	shl    $0x3,%rax
     105:	48 01 c8             	add    %rcx,%rax
     108:	48 09 f2             	or     %rsi,%rdx
     10b:	48 89 10             	mov    %rdx,(%rax)
     10e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     112:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     116:	48 89 50 10          	mov    %rdx,0x10(%rax)
     11a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     11e:	48 8b 40 18          	mov    0x18(%rax),%rax
     122:	48 8d 50 01          	lea    0x1(%rax),%rdx
     126:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     12a:	48 89 50 18          	mov    %rdx,0x18(%rax)
     12e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     132:	48 8b 00             	mov    (%rax),%rax
     135:	48 8b 50 38          	mov    0x38(%rax),%rdx
     139:	48 83 c2 01          	add    $0x1,%rdx
     13d:	48 89 50 38          	mov    %rdx,0x38(%rax)
     141:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     145:	48 8b 00             	mov    (%rax),%rax
     148:	48 8b 50 40          	mov    0x40(%rax),%rdx
     14c:	48 83 ea 01          	sub    $0x1,%rdx
     150:	48 89 50 40          	mov    %rdx,0x40(%rax)
     154:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     158:	48 8b 00             	mov    (%rax),%rax
     15b:	48 8b 50 48          	mov    0x48(%rax),%rdx
     15f:	48 83 c2 01          	add    $0x1,%rdx
     163:	48 89 50 48          	mov    %rdx,0x48(%rax)
     167:	e9 00 01 00 00       	jmpq   26c <page_init+0x1e5>
     16c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     170:	48 8b 40 10          	mov    0x10(%rax),%rax
     174:	83 e0 04             	and    $0x4,%eax
     177:	48 85 c0             	test   %rax,%rax
     17a:	75 2c                	jne    1a8 <page_init+0x121>
     17c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     180:	48 8b 40 10          	mov    0x10(%rax),%rax
     184:	25 00 01 00 00       	and    $0x100,%eax
     189:	48 85 c0             	test   %rax,%rax
     18c:	75 1a                	jne    1a8 <page_init+0x121>
     18e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     192:	83 e0 04             	and    $0x4,%eax
     195:	48 85 c0             	test   %rax,%rax
     198:	75 0e                	jne    1a8 <page_init+0x121>
     19a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     19e:	25 00 01 00 00       	and    $0x100,%eax
     1a3:	48 85 c0             	test   %rax,%rax
     1a6:	74 43                	je     1eb <page_init+0x164>
     1a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1ac:	48 8b 40 10          	mov    0x10(%rax),%rax
     1b0:	48 0b 45 f0          	or     -0x10(%rbp),%rax
     1b4:	48 89 c2             	mov    %rax,%rdx
     1b7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1bb:	48 89 50 10          	mov    %rdx,0x10(%rax)
     1bf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1c3:	48 8b 40 18          	mov    0x18(%rax),%rax
     1c7:	48 8d 50 01          	lea    0x1(%rax),%rdx
     1cb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1cf:	48 89 50 18          	mov    %rdx,0x18(%rax)
     1d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1d7:	48 8b 00             	mov    (%rax),%rax
     1da:	48 8b 50 48          	mov    0x48(%rax),%rdx
     1de:	48 83 c2 01          	add    $0x1,%rdx
     1e2:	48 89 50 48          	mov    %rdx,0x48(%rax)
     1e6:	e9 81 00 00 00       	jmpq   26c <page_init+0x1e5>
     1eb:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     1f2:	00 00 00 
     1f5:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
     1fc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     200:	48 8b 40 08          	mov    0x8(%rax),%rax
     204:	48 c1 e8 1b          	shr    $0x1b,%rax
     208:	48 c1 e0 03          	shl    $0x3,%rax
     20c:	48 01 d0             	add    %rdx,%rax
     20f:	48 8b 10             	mov    (%rax),%rdx
     212:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     216:	48 8b 40 08          	mov    0x8(%rax),%rax
     21a:	48 c1 e8 15          	shr    $0x15,%rax
     21e:	83 e0 3f             	and    $0x3f,%eax
     221:	be 01 00 00 00       	mov    $0x1,%esi
     226:	89 c1                	mov    %eax,%ecx
     228:	48 d3 e6             	shl    %cl,%rsi
     22b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     232:	00 00 00 
     235:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
     23c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     240:	48 8b 40 08          	mov    0x8(%rax),%rax
     244:	48 c1 e8 1b          	shr    $0x1b,%rax
     248:	48 c1 e0 03          	shl    $0x3,%rax
     24c:	48 01 c8             	add    %rcx,%rax
     24f:	48 09 f2             	or     %rsi,%rdx
     252:	48 89 10             	mov    %rdx,(%rax)
     255:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     259:	48 8b 40 10          	mov    0x10(%rax),%rax
     25d:	48 0b 45 f0          	or     -0x10(%rbp),%rax
     261:	48 89 c2             	mov    %rax,%rdx
     264:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     268:	48 89 50 10          	mov    %rdx,0x10(%rax)
     26c:	b8 00 00 00 00       	mov    $0x0,%eax
     271:	5d                   	pop    %rbp
     272:	c3                   	retq   

0000000000000273 <page_clean>:
     273:	55                   	push   %rbp
     274:	48 89 e5             	mov    %rsp,%rbp
     277:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     27b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     27f:	48 8b 40 10          	mov    0x10(%rax),%rax
     283:	48 85 c0             	test   %rax,%rax
     286:	75 11                	jne    299 <page_clean+0x26>
     288:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     28c:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     293:	00 
     294:	e9 55 01 00 00       	jmpq   3ee <page_clean+0x17b>
     299:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     29d:	48 8b 40 10          	mov    0x10(%rax),%rax
     2a1:	83 e0 04             	and    $0x4,%eax
     2a4:	48 85 c0             	test   %rax,%rax
     2a7:	75 12                	jne    2bb <page_clean+0x48>
     2a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2ad:	48 8b 40 10          	mov    0x10(%rax),%rax
     2b1:	25 00 01 00 00       	and    $0x100,%eax
     2b6:	48 85 c0             	test   %rax,%rax
     2b9:	74 6f                	je     32a <page_clean+0xb7>
     2bb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2bf:	48 8b 40 18          	mov    0x18(%rax),%rax
     2c3:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
     2c7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2cb:	48 89 50 18          	mov    %rdx,0x18(%rax)
     2cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2d3:	48 8b 00             	mov    (%rax),%rax
     2d6:	48 8b 50 48          	mov    0x48(%rax),%rdx
     2da:	48 83 ea 01          	sub    $0x1,%rdx
     2de:	48 89 50 48          	mov    %rdx,0x48(%rax)
     2e2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2e6:	48 8b 40 18          	mov    0x18(%rax),%rax
     2ea:	48 85 c0             	test   %rax,%rax
     2ed:	0f 85 fb 00 00 00    	jne    3ee <page_clean+0x17b>
     2f3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2f7:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     2fe:	00 
     2ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     303:	48 8b 00             	mov    (%rax),%rax
     306:	48 8b 50 38          	mov    0x38(%rax),%rdx
     30a:	48 83 ea 01          	sub    $0x1,%rdx
     30e:	48 89 50 38          	mov    %rdx,0x38(%rax)
     312:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     316:	48 8b 00             	mov    (%rax),%rax
     319:	48 8b 50 40          	mov    0x40(%rax),%rdx
     31d:	48 83 c2 01          	add    $0x1,%rdx
     321:	48 89 50 40          	mov    %rdx,0x40(%rax)
     325:	e9 c4 00 00 00       	jmpq   3ee <page_clean+0x17b>
     32a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     331:	00 00 00 
     334:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
     33b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     33f:	48 8b 40 08          	mov    0x8(%rax),%rax
     343:	48 c1 e8 1b          	shr    $0x1b,%rax
     347:	48 c1 e0 03          	shl    $0x3,%rax
     34b:	48 01 d0             	add    %rdx,%rax
     34e:	48 8b 10             	mov    (%rax),%rdx
     351:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     355:	48 8b 40 08          	mov    0x8(%rax),%rax
     359:	48 c1 e8 15          	shr    $0x15,%rax
     35d:	83 e0 3f             	and    $0x3f,%eax
     360:	be 01 00 00 00       	mov    $0x1,%esi
     365:	89 c1                	mov    %eax,%ecx
     367:	48 d3 e6             	shl    %cl,%rsi
     36a:	48 89 f0             	mov    %rsi,%rax
     36d:	48 f7 d0             	not    %rax
     370:	48 89 c6             	mov    %rax,%rsi
     373:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     37a:	00 00 00 
     37d:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
     384:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     388:	48 8b 40 08          	mov    0x8(%rax),%rax
     38c:	48 c1 e8 1b          	shr    $0x1b,%rax
     390:	48 c1 e0 03          	shl    $0x3,%rax
     394:	48 01 c8             	add    %rcx,%rax
     397:	48 21 f2             	and    %rsi,%rdx
     39a:	48 89 10             	mov    %rdx,(%rax)
     39d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3a1:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     3a8:	00 
     3a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3ad:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
     3b4:	00 
     3b5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3b9:	48 8b 00             	mov    (%rax),%rax
     3bc:	48 8b 50 38          	mov    0x38(%rax),%rdx
     3c0:	48 83 ea 01          	sub    $0x1,%rdx
     3c4:	48 89 50 38          	mov    %rdx,0x38(%rax)
     3c8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3cc:	48 8b 00             	mov    (%rax),%rax
     3cf:	48 8b 50 40          	mov    0x40(%rax),%rdx
     3d3:	48 83 c2 01          	add    $0x1,%rdx
     3d7:	48 89 50 40          	mov    %rdx,0x40(%rax)
     3db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3df:	48 8b 00             	mov    (%rax),%rax
     3e2:	48 8b 50 48          	mov    0x48(%rax),%rdx
     3e6:	48 83 ea 01          	sub    $0x1,%rdx
     3ea:	48 89 50 48          	mov    %rdx,0x48(%rax)
     3ee:	b8 00 00 00 00       	mov    $0x0,%eax
     3f3:	5d                   	pop    %rbp
     3f4:	c3                   	retq   

00000000000003f5 <init_memory>:
     3f5:	55                   	push   %rbp
     3f6:	48 89 e5             	mov    %rsp,%rbp
     3f9:	48 83 ec 60          	sub    $0x60,%rsp
     3fd:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     404:	00 
     405:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
     40c:	00 
     40d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     414:	00 00 00 
     417:	be 00 00 00 00       	mov    $0x0,%esi
     41c:	bf ff 00 00 00       	mov    $0xff,%edi
     421:	b8 00 00 00 00       	mov    $0x0,%eax
     426:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     42d:	00 00 00 
     430:	ff d1                	callq  *%rcx
     432:	48 b8 00 7e 00 00 00 	movabs $0xffff800000007e00,%rax
     439:	80 ff ff 
     43c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     440:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     447:	e9 ec 00 00 00       	jmpq   538 <init_memory+0x143>
     44c:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
     453:	00 
     454:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     458:	8b 40 10             	mov    0x10(%rax),%eax
     45b:	83 f8 01             	cmp    $0x1,%eax
     45e:	75 0c                	jne    46c <init_memory+0x77>
     460:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     464:	48 8b 40 08          	mov    0x8(%rax),%rax
     468:	48 01 45 f0          	add    %rax,-0x10(%rbp)
     46c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     470:	48 8b 10             	mov    (%rax),%rdx
     473:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     47a:	00 00 00 
     47d:	8b 45 fc             	mov    -0x4(%rbp),%eax
     480:	48 63 c8             	movslq %eax,%rcx
     483:	48 89 c8             	mov    %rcx,%rax
     486:	48 c1 e0 02          	shl    $0x2,%rax
     48a:	48 01 c8             	add    %rcx,%rax
     48d:	48 c1 e0 02          	shl    $0x2,%rax
     491:	48 01 f0             	add    %rsi,%rax
     494:	48 89 10             	mov    %rdx,(%rax)
     497:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     49b:	48 8b 50 08          	mov    0x8(%rax),%rdx
     49f:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     4a6:	00 00 00 
     4a9:	8b 45 fc             	mov    -0x4(%rbp),%eax
     4ac:	48 63 c8             	movslq %eax,%rcx
     4af:	48 89 c8             	mov    %rcx,%rax
     4b2:	48 c1 e0 02          	shl    $0x2,%rax
     4b6:	48 01 c8             	add    %rcx,%rax
     4b9:	48 c1 e0 02          	shl    $0x2,%rax
     4bd:	48 01 f0             	add    %rsi,%rax
     4c0:	48 83 c0 08          	add    $0x8,%rax
     4c4:	48 89 10             	mov    %rdx,(%rax)
     4c7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     4cb:	8b 50 10             	mov    0x10(%rax),%edx
     4ce:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     4d5:	00 00 00 
     4d8:	8b 45 fc             	mov    -0x4(%rbp),%eax
     4db:	48 63 c8             	movslq %eax,%rcx
     4de:	48 89 c8             	mov    %rcx,%rax
     4e1:	48 c1 e0 02          	shl    $0x2,%rax
     4e5:	48 01 c8             	add    %rcx,%rax
     4e8:	48 c1 e0 02          	shl    $0x2,%rax
     4ec:	48 01 f0             	add    %rsi,%rax
     4ef:	48 83 c0 10          	add    $0x10,%rax
     4f3:	89 10                	mov    %edx,(%rax)
     4f5:	8b 45 fc             	mov    -0x4(%rbp),%eax
     4f8:	48 98                	cltq   
     4fa:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     501:	00 00 00 
     504:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
     50b:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
     510:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     514:	8b 40 10             	mov    0x10(%rax),%eax
     517:	83 f8 04             	cmp    $0x4,%eax
     51a:	77 26                	ja     542 <init_memory+0x14d>
     51c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     520:	48 8b 40 08          	mov    0x8(%rax),%rax
     524:	48 85 c0             	test   %rax,%rax
     527:	74 19                	je     542 <init_memory+0x14d>
     529:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     52d:	8b 40 10             	mov    0x10(%rax),%eax
     530:	85 c0                	test   %eax,%eax
     532:	74 0e                	je     542 <init_memory+0x14d>
     534:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     538:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
     53c:	0f 8e 0a ff ff ff    	jle    44c <init_memory+0x57>
     542:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     546:	48 89 c1             	mov    %rax,%rcx
     549:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     550:	00 00 00 
     553:	be 00 00 00 00       	mov    $0x0,%esi
     558:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     55d:	b8 00 00 00 00       	mov    $0x0,%eax
     562:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     569:	00 00 00 
     56c:	41 ff d0             	callq  *%r8
     56f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     576:	00 
     577:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     57e:	e9 e1 00 00 00       	jmpq   664 <init_memory+0x26f>
     583:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     58a:	00 00 00 
     58d:	8b 45 fc             	mov    -0x4(%rbp),%eax
     590:	48 63 d0             	movslq %eax,%rdx
     593:	48 89 d0             	mov    %rdx,%rax
     596:	48 c1 e0 02          	shl    $0x2,%rax
     59a:	48 01 d0             	add    %rdx,%rax
     59d:	48 c1 e0 02          	shl    $0x2,%rax
     5a1:	48 01 c8             	add    %rcx,%rax
     5a4:	48 83 c0 10          	add    $0x10,%rax
     5a8:	8b 00                	mov    (%rax),%eax
     5aa:	83 f8 01             	cmp    $0x1,%eax
     5ad:	0f 85 a9 00 00 00    	jne    65c <init_memory+0x267>
     5b3:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     5ba:	00 00 00 
     5bd:	8b 45 fc             	mov    -0x4(%rbp),%eax
     5c0:	48 63 d0             	movslq %eax,%rdx
     5c3:	48 89 d0             	mov    %rdx,%rax
     5c6:	48 c1 e0 02          	shl    $0x2,%rax
     5ca:	48 01 d0             	add    %rdx,%rax
     5cd:	48 c1 e0 02          	shl    $0x2,%rax
     5d1:	48 01 c8             	add    %rcx,%rax
     5d4:	48 8b 00             	mov    (%rax),%rax
     5d7:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
     5dd:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     5e3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     5e7:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     5ee:	00 00 00 
     5f1:	8b 45 fc             	mov    -0x4(%rbp),%eax
     5f4:	48 63 d0             	movslq %eax,%rdx
     5f7:	48 89 d0             	mov    %rdx,%rax
     5fa:	48 c1 e0 02          	shl    $0x2,%rax
     5fe:	48 01 d0             	add    %rdx,%rax
     601:	48 c1 e0 02          	shl    $0x2,%rax
     605:	48 01 c8             	add    %rcx,%rax
     608:	48 8b 08             	mov    (%rax),%rcx
     60b:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     612:	00 00 00 
     615:	8b 45 fc             	mov    -0x4(%rbp),%eax
     618:	48 63 d0             	movslq %eax,%rdx
     61b:	48 89 d0             	mov    %rdx,%rax
     61e:	48 c1 e0 02          	shl    $0x2,%rax
     622:	48 01 d0             	add    %rdx,%rax
     625:	48 c1 e0 02          	shl    $0x2,%rax
     629:	48 01 f0             	add    %rsi,%rax
     62c:	48 83 c0 08          	add    $0x8,%rax
     630:	48 8b 00             	mov    (%rax),%rax
     633:	48 01 c8             	add    %rcx,%rax
     636:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     63c:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
     640:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     644:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
     648:	76 15                	jbe    65f <init_memory+0x26a>
     64a:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     64e:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
     652:	48 c1 e8 15          	shr    $0x15,%rax
     656:	48 01 45 f0          	add    %rax,-0x10(%rbp)
     65a:	eb 04                	jmp    660 <init_memory+0x26b>
     65c:	90                   	nop
     65d:	eb 01                	jmp    660 <init_memory+0x26b>
     65f:	90                   	nop
     660:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     664:	8b 45 fc             	mov    -0x4(%rbp),%eax
     667:	48 63 d0             	movslq %eax,%rdx
     66a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     671:	00 00 00 
     674:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
     67b:	48 39 c2             	cmp    %rax,%rdx
     67e:	0f 86 ff fe ff ff    	jbe    583 <init_memory+0x18e>
     684:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     688:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     68c:	49 89 d0             	mov    %rdx,%r8
     68f:	48 89 c1             	mov    %rax,%rcx
     692:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     699:	00 00 00 
     69c:	be 00 00 00 00       	mov    $0x0,%esi
     6a1:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     6a6:	b8 00 00 00 00       	mov    $0x0,%eax
     6ab:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
     6b2:	00 00 00 
     6b5:	41 ff d1             	callq  *%r9
     6b8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     6bf:	00 00 00 
     6c2:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
     6c9:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     6d0:	00 00 00 
     6d3:	48 89 d0             	mov    %rdx,%rax
     6d6:	48 c1 e0 02          	shl    $0x2,%rax
     6da:	48 01 d0             	add    %rdx,%rax
     6dd:	48 c1 e0 02          	shl    $0x2,%rax
     6e1:	48 01 c8             	add    %rcx,%rax
     6e4:	48 8b 08             	mov    (%rax),%rcx
     6e7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     6ee:	00 00 00 
     6f1:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
     6f8:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     6ff:	00 00 00 
     702:	48 89 d0             	mov    %rdx,%rax
     705:	48 c1 e0 02          	shl    $0x2,%rax
     709:	48 01 d0             	add    %rdx,%rax
     70c:	48 c1 e0 02          	shl    $0x2,%rax
     710:	48 01 f0             	add    %rsi,%rax
     713:	48 83 c0 08          	add    $0x8,%rax
     717:	48 8b 00             	mov    (%rax),%rax
     71a:	48 01 c8             	add    %rcx,%rax
     71d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     721:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     728:	00 00 00 
     72b:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
     732:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     738:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     73e:	48 89 c2             	mov    %rax,%rdx
     741:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     748:	00 00 00 
     74b:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
     752:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     756:	48 c1 e8 15          	shr    $0x15,%rax
     75a:	48 89 c2             	mov    %rax,%rdx
     75d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     764:	00 00 00 
     767:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
     76e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     772:	48 c1 e8 15          	shr    $0x15,%rax
     776:	48 83 c0 3f          	add    $0x3f,%rax
     77a:	48 c1 e8 03          	shr    $0x3,%rax
     77e:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     782:	48 89 c2             	mov    %rax,%rdx
     785:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     78c:	00 00 00 
     78f:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
     796:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     79d:	00 00 00 
     7a0:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
     7a7:	48 89 c2             	mov    %rax,%rdx
     7aa:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7b1:	00 00 00 
     7b4:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     7bb:	be ff 00 00 00       	mov    $0xff,%esi
     7c0:	48 89 c7             	mov    %rax,%rdi
     7c3:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7ca:	00 00 00 
     7cd:	ff d0                	callq  *%rax
     7cf:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7d6:	00 00 00 
     7d9:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     7e0:	48 89 c2             	mov    %rax,%rdx
     7e3:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7ea:	00 00 00 
     7ed:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
     7f4:	48 01 d0             	add    %rdx,%rax
     7f7:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     7fd:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     803:	48 89 c2             	mov    %rax,%rdx
     806:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     80d:	00 00 00 
     810:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
     817:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     81b:	48 c1 e8 15          	shr    $0x15,%rax
     81f:	48 89 c2             	mov    %rax,%rdx
     822:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     829:	00 00 00 
     82c:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
     833:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     837:	48 c1 e8 15          	shr    $0x15,%rax
     83b:	48 89 c2             	mov    %rax,%rdx
     83e:	48 89 d0             	mov    %rdx,%rax
     841:	48 c1 e0 02          	shl    $0x2,%rax
     845:	48 01 d0             	add    %rdx,%rax
     848:	48 c1 e0 03          	shl    $0x3,%rax
     84c:	48 83 c0 07          	add    $0x7,%rax
     850:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     854:	48 89 c2             	mov    %rax,%rdx
     857:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     85e:	00 00 00 
     861:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
     868:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     86f:	00 00 00 
     872:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
     879:	48 89 c2             	mov    %rax,%rdx
     87c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     883:	00 00 00 
     886:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     88d:	be 00 00 00 00       	mov    $0x0,%esi
     892:	48 89 c7             	mov    %rax,%rdi
     895:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     89c:	00 00 00 
     89f:	ff d0                	callq  *%rax
     8a1:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8a8:	00 00 00 
     8ab:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     8b2:	48 89 c2             	mov    %rax,%rdx
     8b5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8bc:	00 00 00 
     8bf:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
     8c6:	48 01 d0             	add    %rdx,%rax
     8c9:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     8cf:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     8d5:	48 89 c2             	mov    %rax,%rdx
     8d8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8df:	00 00 00 
     8e2:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
     8e9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8f0:	00 00 00 
     8f3:	48 c7 80 c0 02 00 00 	movq   $0x0,0x2c0(%rax)
     8fa:	00 00 00 00 
     8fe:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     905:	00 00 00 
     908:	48 c7 80 c8 02 00 00 	movq   $0x190,0x2c8(%rax)
     90f:	90 01 00 00 
     913:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     91a:	00 00 00 
     91d:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
     924:	48 89 c2             	mov    %rax,%rdx
     927:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     92e:	00 00 00 
     931:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     938:	be 00 00 00 00       	mov    $0x0,%esi
     93d:	48 89 c7             	mov    %rax,%rdi
     940:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     947:	00 00 00 
     94a:	ff d0                	callq  *%rax
     94c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     953:	e9 e1 02 00 00       	jmpq   c39 <init_memory+0x844>
     958:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     95f:	00 00 00 
     962:	8b 45 fc             	mov    -0x4(%rbp),%eax
     965:	48 63 d0             	movslq %eax,%rdx
     968:	48 89 d0             	mov    %rdx,%rax
     96b:	48 c1 e0 02          	shl    $0x2,%rax
     96f:	48 01 d0             	add    %rdx,%rax
     972:	48 c1 e0 02          	shl    $0x2,%rax
     976:	48 01 c8             	add    %rcx,%rax
     979:	48 83 c0 10          	add    $0x10,%rax
     97d:	8b 00                	mov    (%rax),%eax
     97f:	83 f8 01             	cmp    $0x1,%eax
     982:	0f 85 a9 02 00 00    	jne    c31 <init_memory+0x83c>
     988:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     98f:	00 00 00 
     992:	8b 45 fc             	mov    -0x4(%rbp),%eax
     995:	48 63 d0             	movslq %eax,%rdx
     998:	48 89 d0             	mov    %rdx,%rax
     99b:	48 c1 e0 02          	shl    $0x2,%rax
     99f:	48 01 d0             	add    %rdx,%rax
     9a2:	48 c1 e0 02          	shl    $0x2,%rax
     9a6:	48 01 c8             	add    %rcx,%rax
     9a9:	48 8b 00             	mov    (%rax),%rax
     9ac:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
     9b2:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     9b8:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     9bc:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     9c3:	00 00 00 
     9c6:	8b 45 fc             	mov    -0x4(%rbp),%eax
     9c9:	48 63 d0             	movslq %eax,%rdx
     9cc:	48 89 d0             	mov    %rdx,%rax
     9cf:	48 c1 e0 02          	shl    $0x2,%rax
     9d3:	48 01 d0             	add    %rdx,%rax
     9d6:	48 c1 e0 02          	shl    $0x2,%rax
     9da:	48 01 c8             	add    %rcx,%rax
     9dd:	48 8b 08             	mov    (%rax),%rcx
     9e0:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     9e7:	00 00 00 
     9ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
     9ed:	48 63 d0             	movslq %eax,%rdx
     9f0:	48 89 d0             	mov    %rdx,%rax
     9f3:	48 c1 e0 02          	shl    $0x2,%rax
     9f7:	48 01 d0             	add    %rdx,%rax
     9fa:	48 c1 e0 02          	shl    $0x2,%rax
     9fe:	48 01 f0             	add    %rsi,%rax
     a01:	48 83 c0 08          	add    $0x8,%rax
     a05:	48 8b 00             	mov    (%rax),%rax
     a08:	48 01 c8             	add    %rcx,%rax
     a0b:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     a11:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     a15:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     a19:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
     a1d:	0f 86 11 02 00 00    	jbe    c34 <init_memory+0x83f>
     a23:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a2a:	00 00 00 
     a2d:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
     a34:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a3b:	00 00 00 
     a3e:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     a45:	48 89 d0             	mov    %rdx,%rax
     a48:	48 c1 e0 02          	shl    $0x2,%rax
     a4c:	48 01 d0             	add    %rdx,%rax
     a4f:	48 c1 e0 04          	shl    $0x4,%rax
     a53:	48 01 c8             	add    %rcx,%rax
     a56:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     a5a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a61:	00 00 00 
     a64:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
     a6b:	48 8d 50 01          	lea    0x1(%rax),%rdx
     a6f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a76:	00 00 00 
     a79:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
     a80:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     a84:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
     a88:	48 89 50 10          	mov    %rdx,0x10(%rax)
     a8c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     a90:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
     a94:	48 89 50 18          	mov    %rdx,0x18(%rax)
     a98:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     a9c:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     aa0:	48 89 c2             	mov    %rax,%rdx
     aa3:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     aa7:	48 89 50 20          	mov    %rdx,0x20(%rax)
     aab:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     aaf:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
     ab6:	00 
     ab7:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     abb:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     abf:	48 c1 e8 15          	shr    $0x15,%rax
     ac3:	48 89 c2             	mov    %rax,%rdx
     ac6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     aca:	48 89 50 40          	mov    %rdx,0x40(%rax)
     ace:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     ad2:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
     ad9:	00 
     ada:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     ade:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
     ae5:	00 
     ae6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     aea:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
     af1:	00 00 00 
     af4:	48 89 78 30          	mov    %rdi,0x30(%rax)
     af8:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     afc:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     b00:	48 c1 e8 15          	shr    $0x15,%rax
     b04:	48 89 c2             	mov    %rax,%rdx
     b07:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b0b:	48 89 50 08          	mov    %rdx,0x8(%rax)
     b0f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     b16:	00 00 00 
     b19:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
     b20:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     b24:	48 c1 e8 15          	shr    $0x15,%rax
     b28:	48 89 c2             	mov    %rax,%rdx
     b2b:	48 89 d0             	mov    %rdx,%rax
     b2e:	48 c1 e0 02          	shl    $0x2,%rax
     b32:	48 01 d0             	add    %rdx,%rax
     b35:	48 c1 e0 03          	shl    $0x3,%rax
     b39:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
     b3d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b41:	48 89 10             	mov    %rdx,(%rax)
     b44:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b48:	48 8b 00             	mov    (%rax),%rax
     b4b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     b4f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
     b56:	e9 bd 00 00 00       	jmpq   c18 <init_memory+0x823>
     b5b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     b5f:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     b63:	48 89 10             	mov    %rdx,(%rax)
     b66:	8b 45 f8             	mov    -0x8(%rbp),%eax
     b69:	48 98                	cltq   
     b6b:	48 c1 e0 15          	shl    $0x15,%rax
     b6f:	48 89 c2             	mov    %rax,%rdx
     b72:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     b76:	48 01 c2             	add    %rax,%rdx
     b79:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     b7d:	48 89 50 08          	mov    %rdx,0x8(%rax)
     b81:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     b85:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     b8c:	00 
     b8d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     b91:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
     b98:	00 
     b99:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     b9d:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
     ba4:	00 
     ba5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     bac:	00 00 00 
     baf:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
     bb6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     bba:	48 8b 40 08          	mov    0x8(%rax),%rax
     bbe:	48 c1 e8 1b          	shr    $0x1b,%rax
     bc2:	48 c1 e0 03          	shl    $0x3,%rax
     bc6:	48 01 d0             	add    %rdx,%rax
     bc9:	48 8b 10             	mov    (%rax),%rdx
     bcc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     bd0:	48 8b 40 08          	mov    0x8(%rax),%rax
     bd4:	48 c1 e8 15          	shr    $0x15,%rax
     bd8:	83 e0 3f             	and    $0x3f,%eax
     bdb:	be 01 00 00 00       	mov    $0x1,%esi
     be0:	89 c1                	mov    %eax,%ecx
     be2:	48 d3 e6             	shl    %cl,%rsi
     be5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     bec:	00 00 00 
     bef:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
     bf6:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     bfa:	48 8b 40 08          	mov    0x8(%rax),%rax
     bfe:	48 c1 e8 1b          	shr    $0x1b,%rax
     c02:	48 c1 e0 03          	shl    $0x3,%rax
     c06:	48 01 c8             	add    %rcx,%rax
     c09:	48 31 f2             	xor    %rsi,%rdx
     c0c:	48 89 10             	mov    %rdx,(%rax)
     c0f:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
     c13:	48 83 45 e0 28       	addq   $0x28,-0x20(%rbp)
     c18:	8b 45 f8             	mov    -0x8(%rbp),%eax
     c1b:	48 63 d0             	movslq %eax,%rdx
     c1e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     c22:	48 8b 40 08          	mov    0x8(%rax),%rax
     c26:	48 39 c2             	cmp    %rax,%rdx
     c29:	0f 82 2c ff ff ff    	jb     b5b <init_memory+0x766>
     c2f:	eb 04                	jmp    c35 <init_memory+0x840>
     c31:	90                   	nop
     c32:	eb 01                	jmp    c35 <init_memory+0x840>
     c34:	90                   	nop
     c35:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     c39:	8b 45 fc             	mov    -0x4(%rbp),%eax
     c3c:	48 63 d0             	movslq %eax,%rdx
     c3f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c46:	00 00 00 
     c49:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
     c50:	48 39 c2             	cmp    %rax,%rdx
     c53:	0f 86 ff fc ff ff    	jbe    958 <init_memory+0x563>
     c59:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c60:	00 00 00 
     c63:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     c6a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     c71:	00 00 00 
     c74:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
     c7b:	48 89 10             	mov    %rdx,(%rax)
     c7e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c85:	00 00 00 
     c88:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     c8f:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
     c96:	00 
     c97:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c9e:	00 00 00 
     ca1:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     ca8:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     caf:	00 
     cb0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     cb7:	00 00 00 
     cba:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     cc1:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
     cc8:	00 
     cc9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     cd0:	00 00 00 
     cd3:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     cda:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
     ce1:	00 
     ce2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ce9:	00 00 00 
     cec:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     cf3:	48 89 d0             	mov    %rdx,%rax
     cf6:	48 c1 e0 02          	shl    $0x2,%rax
     cfa:	48 01 d0             	add    %rdx,%rax
     cfd:	48 c1 e0 04          	shl    $0x4,%rax
     d01:	48 83 c0 07          	add    $0x7,%rax
     d05:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     d09:	48 89 c2             	mov    %rax,%rdx
     d0c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d13:	00 00 00 
     d16:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
     d1d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d24:	00 00 00 
     d27:	48 8b 88 98 02 00 00 	mov    0x298(%rax),%rcx
     d2e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d35:	00 00 00 
     d38:	48 8b 90 90 02 00 00 	mov    0x290(%rax),%rdx
     d3f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d46:	00 00 00 
     d49:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     d50:	49 89 c9             	mov    %rcx,%r9
     d53:	49 89 d0             	mov    %rdx,%r8
     d56:	48 89 c1             	mov    %rax,%rcx
     d59:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d60:	00 00 00 
     d63:	be 00 00 00 00       	mov    $0x0,%esi
     d68:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     d6d:	b8 00 00 00 00       	mov    $0x0,%eax
     d72:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     d79:	00 00 00 
     d7c:	41 ff d2             	callq  *%r10
     d7f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d86:	00 00 00 
     d89:	48 8b 88 b0 02 00 00 	mov    0x2b0(%rax),%rcx
     d90:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d97:	00 00 00 
     d9a:	48 8b 90 a8 02 00 00 	mov    0x2a8(%rax),%rdx
     da1:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     da8:	00 00 00 
     dab:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     db2:	49 89 c9             	mov    %rcx,%r9
     db5:	49 89 d0             	mov    %rdx,%r8
     db8:	48 89 c1             	mov    %rax,%rcx
     dbb:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     dc2:	00 00 00 
     dc5:	be 00 00 00 00       	mov    $0x0,%esi
     dca:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     dcf:	b8 00 00 00 00       	mov    $0x0,%eax
     dd4:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     ddb:	00 00 00 
     dde:	41 ff d2             	callq  *%r10
     de1:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     de8:	00 00 00 
     deb:	48 8b 88 c8 02 00 00 	mov    0x2c8(%rax),%rcx
     df2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     df9:	00 00 00 
     dfc:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     e03:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e0a:	00 00 00 
     e0d:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     e14:	49 89 c9             	mov    %rcx,%r9
     e17:	49 89 d0             	mov    %rdx,%r8
     e1a:	48 89 c1             	mov    %rax,%rcx
     e1d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e24:	00 00 00 
     e27:	be 00 00 00 00       	mov    $0x0,%esi
     e2c:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     e31:	b8 00 00 00 00       	mov    $0x0,%eax
     e36:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     e3d:	00 00 00 
     e40:	41 ff d2             	callq  *%r10
     e43:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e4a:	00 00 00 
     e4d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
     e53:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e5a:	00 00 00 
     e5d:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
     e63:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     e6a:	e9 b2 00 00 00       	jmpq   f21 <init_memory+0xb2c>
     e6f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e76:	00 00 00 
     e79:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
     e80:	8b 45 fc             	mov    -0x4(%rbp),%eax
     e83:	48 63 d0             	movslq %eax,%rdx
     e86:	48 89 d0             	mov    %rdx,%rax
     e89:	48 c1 e0 02          	shl    $0x2,%rax
     e8d:	48 01 d0             	add    %rdx,%rax
     e90:	48 c1 e0 04          	shl    $0x4,%rax
     e94:	48 01 c8             	add    %rcx,%rax
     e97:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     e9b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     e9f:	48 8b 48 08          	mov    0x8(%rax),%rcx
     ea3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ea7:	48 8b 10             	mov    (%rax),%rdx
     eaa:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     eae:	48 8b 78 20          	mov    0x20(%rax),%rdi
     eb2:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     eb6:	48 8b 70 18          	mov    0x18(%rax),%rsi
     eba:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     ebe:	48 8b 40 10          	mov    0x10(%rax),%rax
     ec2:	51                   	push   %rcx
     ec3:	52                   	push   %rdx
     ec4:	49 89 f9             	mov    %rdi,%r9
     ec7:	49 89 f0             	mov    %rsi,%r8
     eca:	48 89 c1             	mov    %rax,%rcx
     ecd:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     ed4:	00 00 00 
     ed7:	be 00 00 00 00       	mov    $0x0,%esi
     edc:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     ee1:	b8 00 00 00 00       	mov    $0x0,%eax
     ee6:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     eed:	00 00 00 
     ef0:	41 ff d2             	callq  *%r10
     ef3:	48 83 c4 10          	add    $0x10,%rsp
     ef7:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     efb:	48 8b 40 10          	mov    0x10(%rax),%rax
     eff:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
     f06:	00 00 00 
     f09:	48 39 d0             	cmp    %rdx,%rax
     f0c:	75 0f                	jne    f1d <init_memory+0xb28>
     f0e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     f15:	00 00 00 
     f18:	8b 45 fc             	mov    -0x4(%rbp),%eax
     f1b:	89 02                	mov    %eax,(%rdx)
     f1d:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     f21:	8b 45 fc             	mov    -0x4(%rbp),%eax
     f24:	48 63 d0             	movslq %eax,%rdx
     f27:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f2e:	00 00 00 
     f31:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
     f38:	48 39 c2             	cmp    %rax,%rdx
     f3b:	0f 82 2e ff ff ff    	jb     e6f <init_memory+0xa7a>
     f41:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f48:	00 00 00 
     f4b:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     f52:	48 89 c2             	mov    %rax,%rdx
     f55:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f5c:	00 00 00 
     f5f:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
     f66:	48 01 d0             	add    %rdx,%rax
     f69:	48 05 00 01 00 00    	add    $0x100,%rax
     f6f:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     f73:	48 89 c2             	mov    %rax,%rdx
     f76:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f7d:	00 00 00 
     f80:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
     f87:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f8e:	00 00 00 
     f91:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
     f98:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f9f:	00 00 00 
     fa2:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
     fa9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fb0:	00 00 00 
     fb3:	48 8b b8 e0 02 00 00 	mov    0x2e0(%rax),%rdi
     fba:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fc1:	00 00 00 
     fc4:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
     fcb:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fd2:	00 00 00 
     fd5:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
     fdc:	51                   	push   %rcx
     fdd:	52                   	push   %rdx
     fde:	49 89 f9             	mov    %rdi,%r9
     fe1:	49 89 f0             	mov    %rsi,%r8
     fe4:	48 89 c1             	mov    %rax,%rcx
     fe7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     fee:	00 00 00 
     ff1:	be 00 00 00 00       	mov    $0x0,%esi
     ff6:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     ffb:	b8 00 00 00 00       	mov    $0x0,%eax
    1000:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
    1007:	00 00 00 
    100a:	41 ff d2             	callq  *%r10
    100d:	48 83 c4 10          	add    $0x10,%rsp
    1011:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1018:	00 00 00 
    101b:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
    1022:	48 ba 00 00 00 00 00 	movabs $0x800000000000,%rdx
    1029:	80 00 00 
    102c:	48 01 d0             	add    %rdx,%rax
    102f:	48 c1 e8 15          	shr    $0x15,%rax
    1033:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1036:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    103d:	eb 40                	jmp    107f <init_memory+0xc8a>
    103f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1046:	00 00 00 
    1049:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    1050:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1053:	48 63 d0             	movslq %eax,%rdx
    1056:	48 89 d0             	mov    %rdx,%rax
    1059:	48 c1 e0 02          	shl    $0x2,%rax
    105d:	48 01 d0             	add    %rdx,%rax
    1060:	48 c1 e0 03          	shl    $0x3,%rax
    1064:	48 01 c8             	add    %rcx,%rax
    1067:	be 93 00 00 00       	mov    $0x93,%esi
    106c:	48 89 c7             	mov    %rax,%rdi
    106f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1076:	00 00 00 
    1079:	ff d0                	callq  *%rax
    107b:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    107f:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1082:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    1085:	7e b8                	jle    103f <init_memory+0xc4a>
    1087:	b8 00 00 00 00       	mov    $0x0,%eax
    108c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1093:	00 00 00 
    1096:	ff d2                	callq  *%rdx
    1098:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    109f:	00 00 00 
    10a2:	48 89 02             	mov    %rax,(%rdx)
    10a5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10ac:	00 00 00 
    10af:	48 8b 00             	mov    (%rax),%rax
    10b2:	48 89 c1             	mov    %rax,%rcx
    10b5:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    10bc:	00 00 00 
    10bf:	be 00 00 00 00       	mov    $0x0,%esi
    10c4:	bf ff ff 00 00       	mov    $0xffff,%edi
    10c9:	b8 00 00 00 00       	mov    $0x0,%eax
    10ce:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    10d5:	00 00 00 
    10d8:	41 ff d0             	callq  *%r8
    10db:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10e2:	00 00 00 
    10e5:	48 8b 00             	mov    (%rax),%rax
    10e8:	48 89 c2             	mov    %rax,%rdx
    10eb:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    10f2:	80 ff ff 
    10f5:	48 01 d0             	add    %rdx,%rax
    10f8:	48 8b 00             	mov    (%rax),%rax
    10fb:	b0 00                	mov    $0x0,%al
    10fd:	48 89 c1             	mov    %rax,%rcx
    1100:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1107:	00 00 00 
    110a:	be 00 00 00 00       	mov    $0x0,%esi
    110f:	bf ff ff 00 00       	mov    $0xffff,%edi
    1114:	b8 00 00 00 00       	mov    $0x0,%eax
    1119:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    1120:	00 00 00 
    1123:	41 ff d0             	callq  *%r8
    1126:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    112d:	00 00 00 
    1130:	48 8b 00             	mov    (%rax),%rax
    1133:	48 89 c2             	mov    %rax,%rdx
    1136:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    113d:	80 ff ff 
    1140:	48 01 d0             	add    %rdx,%rax
    1143:	48 8b 00             	mov    (%rax),%rax
    1146:	b0 00                	mov    $0x0,%al
    1148:	48 89 c2             	mov    %rax,%rdx
    114b:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    1152:	80 ff ff 
    1155:	48 01 d0             	add    %rdx,%rax
    1158:	48 8b 00             	mov    (%rax),%rax
    115b:	b0 00                	mov    $0x0,%al
    115d:	48 89 c1             	mov    %rax,%rcx
    1160:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1167:	00 00 00 
    116a:	be 00 00 00 00       	mov    $0x0,%esi
    116f:	bf ff 00 80 00       	mov    $0x8000ff,%edi
    1174:	b8 00 00 00 00       	mov    $0x0,%eax
    1179:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    1180:	00 00 00 
    1183:	41 ff d0             	callq  *%r8
    1186:	0f 20 d8             	mov    %cr3,%rax
    1189:	0f 22 d8             	mov    %rax,%cr3
    118c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1190:	90                   	nop
    1191:	c9                   	leaveq 
    1192:	c3                   	retq   

0000000000001193 <alloc_pages>:
    1193:	55                   	push   %rbp
    1194:	48 89 e5             	mov    %rsp,%rbp
    1197:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    119b:	89 7d 8c             	mov    %edi,-0x74(%rbp)
    119e:	89 75 88             	mov    %esi,-0x78(%rbp)
    11a1:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
    11a5:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
    11ac:	00 
    11ad:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    11b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    11bb:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
    11bf:	74 4c                	je     120d <alloc_pages+0x7a>
    11c1:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
    11c5:	7f 6e                	jg     1235 <alloc_pages+0xa2>
    11c7:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
    11cb:	74 08                	je     11d5 <alloc_pages+0x42>
    11cd:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
    11d1:	74 1a                	je     11ed <alloc_pages+0x5a>
    11d3:	eb 60                	jmp    1235 <alloc_pages+0xa2>
    11d5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    11dc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11e3:	00 00 00 
    11e6:	8b 00                	mov    (%rax),%eax
    11e8:	89 45 f4             	mov    %eax,-0xc(%rbp)
    11eb:	eb 77                	jmp    1264 <alloc_pages+0xd1>
    11ed:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11f4:	00 00 00 
    11f7:	8b 00                	mov    (%rax),%eax
    11f9:	89 45 f8             	mov    %eax,-0x8(%rbp)
    11fc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1203:	00 00 00 
    1206:	8b 00                	mov    (%rax),%eax
    1208:	89 45 f4             	mov    %eax,-0xc(%rbp)
    120b:	eb 57                	jmp    1264 <alloc_pages+0xd1>
    120d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1214:	00 00 00 
    1217:	8b 00                	mov    (%rax),%eax
    1219:	89 45 f8             	mov    %eax,-0x8(%rbp)
    121c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1223:	00 00 00 
    1226:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
    122d:	83 e8 01             	sub    $0x1,%eax
    1230:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1233:	eb 2f                	jmp    1264 <alloc_pages+0xd1>
    1235:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    123c:	00 00 00 
    123f:	be 00 00 00 00       	mov    $0x0,%esi
    1244:	bf 00 00 ff 00       	mov    $0xff0000,%edi
    1249:	b8 00 00 00 00       	mov    $0x0,%eax
    124e:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
    1255:	00 00 00 
    1258:	ff d1                	callq  *%rcx
    125a:	b8 00 00 00 00       	mov    $0x0,%eax
    125f:	e9 5f 02 00 00       	jmpq   14c3 <alloc_pages+0x330>
    1264:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1267:	89 45 fc             	mov    %eax,-0x4(%rbp)
    126a:	e9 1b 02 00 00       	jmpq   148a <alloc_pages+0x2f7>
    126f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1276:	00 00 00 
    1279:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
    1280:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1283:	48 63 d0             	movslq %eax,%rdx
    1286:	48 89 d0             	mov    %rdx,%rax
    1289:	48 c1 e0 02          	shl    $0x2,%rax
    128d:	48 01 d0             	add    %rdx,%rax
    1290:	48 c1 e0 04          	shl    $0x4,%rax
    1294:	48 01 c8             	add    %rcx,%rax
    1297:	48 8b 50 40          	mov    0x40(%rax),%rdx
    129b:	8b 45 88             	mov    -0x78(%rbp),%eax
    129e:	48 98                	cltq   
    12a0:	48 39 c2             	cmp    %rax,%rdx
    12a3:	0f 82 dc 01 00 00    	jb     1485 <alloc_pages+0x2f2>
    12a9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    12b0:	00 00 00 
    12b3:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
    12ba:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12bd:	48 63 d0             	movslq %eax,%rdx
    12c0:	48 89 d0             	mov    %rdx,%rax
    12c3:	48 c1 e0 02          	shl    $0x2,%rax
    12c7:	48 01 d0             	add    %rdx,%rax
    12ca:	48 c1 e0 04          	shl    $0x4,%rax
    12ce:	48 01 c8             	add    %rcx,%rax
    12d1:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    12d5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12d9:	48 8b 40 10          	mov    0x10(%rax),%rax
    12dd:	48 c1 e8 15          	shr    $0x15,%rax
    12e1:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    12e5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12e9:	48 8b 40 18          	mov    0x18(%rax),%rax
    12ed:	48 c1 e8 15          	shr    $0x15,%rax
    12f1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    12f5:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12f9:	48 8b 40 20          	mov    0x20(%rax),%rax
    12fd:	48 c1 e8 15          	shr    $0x15,%rax
    1301:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    1305:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1309:	83 e0 3f             	and    $0x3f,%eax
    130c:	48 89 c2             	mov    %rax,%rdx
    130f:	b8 40 00 00 00       	mov    $0x40,%eax
    1314:	48 29 d0             	sub    %rdx,%rax
    1317:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    131b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    131f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1323:	e9 4d 01 00 00       	jmpq   1475 <alloc_pages+0x2e2>
    1328:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    132f:	00 00 00 
    1332:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
    1339:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    133d:	48 c1 e8 06          	shr    $0x6,%rax
    1341:	48 c1 e0 03          	shl    $0x3,%rax
    1345:	48 01 d0             	add    %rdx,%rax
    1348:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    134c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1350:	83 e0 3f             	and    $0x3f,%eax
    1353:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    1357:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    135b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    135f:	e9 e3 00 00 00       	jmpq   1447 <alloc_pages+0x2b4>
    1364:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1368:	48 8b 00             	mov    (%rax),%rax
    136b:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    136f:	89 d1                	mov    %edx,%ecx
    1371:	48 d3 e8             	shr    %cl,%rax
    1374:	48 89 c6             	mov    %rax,%rsi
    1377:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    137b:	48 83 c0 08          	add    $0x8,%rax
    137f:	48 8b 10             	mov    (%rax),%rdx
    1382:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1386:	89 c1                	mov    %eax,%ecx
    1388:	b8 40 00 00 00       	mov    $0x40,%eax
    138d:	29 c8                	sub    %ecx,%eax
    138f:	89 c1                	mov    %eax,%ecx
    1391:	48 d3 e2             	shl    %cl,%rdx
    1394:	48 89 d0             	mov    %rdx,%rax
    1397:	48 09 c6             	or     %rax,%rsi
    139a:	48 89 f2             	mov    %rsi,%rdx
    139d:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
    13a1:	74 16                	je     13b9 <alloc_pages+0x226>
    13a3:	8b 45 88             	mov    -0x78(%rbp),%eax
    13a6:	be 01 00 00 00       	mov    $0x1,%esi
    13ab:	89 c1                	mov    %eax,%ecx
    13ad:	48 d3 e6             	shl    %cl,%rsi
    13b0:	48 89 f0             	mov    %rsi,%rax
    13b3:	48 83 e8 01          	sub    $0x1,%rax
    13b7:	eb 07                	jmp    13c0 <alloc_pages+0x22d>
    13b9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    13c0:	48 21 d0             	and    %rdx,%rax
    13c3:	48 85 c0             	test   %rax,%rax
    13c6:	75 7a                	jne    1442 <alloc_pages+0x2af>
    13c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    13cc:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13d0:	48 01 d0             	add    %rdx,%rax
    13d3:	48 83 e8 01          	sub    $0x1,%rax
    13d7:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    13db:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
    13e2:	00 
    13e3:	eb 50                	jmp    1435 <alloc_pages+0x2a2>
    13e5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    13ec:	00 00 00 
    13ef:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    13f6:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    13fa:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    13fe:	48 01 c2             	add    %rax,%rdx
    1401:	48 89 d0             	mov    %rdx,%rax
    1404:	48 c1 e0 02          	shl    $0x2,%rax
    1408:	48 01 d0             	add    %rdx,%rax
    140b:	48 c1 e0 03          	shl    $0x3,%rax
    140f:	48 01 c8             	add    %rcx,%rax
    1412:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    1416:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
    141a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    141e:	48 89 d6             	mov    %rdx,%rsi
    1421:	48 89 c7             	mov    %rax,%rdi
    1424:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    142b:	00 00 00 
    142e:	ff d0                	callq  *%rax
    1430:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
    1435:	8b 45 88             	mov    -0x78(%rbp),%eax
    1438:	48 98                	cltq   
    143a:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    143e:	72 a5                	jb     13e5 <alloc_pages+0x252>
    1440:	eb 5b                	jmp    149d <alloc_pages+0x30a>
    1442:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
    1447:	b8 40 00 00 00       	mov    $0x40,%eax
    144c:	48 2b 45 98          	sub    -0x68(%rbp),%rax
    1450:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    1454:	0f 82 0a ff ff ff    	jb     1364 <alloc_pages+0x1d1>
    145a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    145e:	83 e0 3f             	and    $0x3f,%eax
    1461:	48 85 c0             	test   %rax,%rax
    1464:	74 06                	je     146c <alloc_pages+0x2d9>
    1466:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    146a:	eb 05                	jmp    1471 <alloc_pages+0x2de>
    146c:	b8 40 00 00 00       	mov    $0x40,%eax
    1471:	48 01 45 e8          	add    %rax,-0x18(%rbp)
    1475:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1479:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
    147d:	0f 86 a5 fe ff ff    	jbe    1328 <alloc_pages+0x195>
    1483:	eb 01                	jmp    1486 <alloc_pages+0x2f3>
    1485:	90                   	nop
    1486:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    148a:	8b 45 fc             	mov    -0x4(%rbp),%eax
    148d:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    1490:	0f 8e d9 fd ff ff    	jle    126f <alloc_pages+0xdc>
    1496:	b8 00 00 00 00       	mov    $0x0,%eax
    149b:	eb 26                	jmp    14c3 <alloc_pages+0x330>
    149d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    14a4:	00 00 00 
    14a7:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    14ae:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    14b2:	48 89 d0             	mov    %rdx,%rax
    14b5:	48 c1 e0 02          	shl    $0x2,%rax
    14b9:	48 01 d0             	add    %rdx,%rax
    14bc:	48 c1 e0 03          	shl    $0x3,%rax
    14c0:	48 01 c8             	add    %rcx,%rax
    14c3:	c9                   	leaveq 
    14c4:	c3                   	retq   

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
  78:	4f 53                	rex.WRXB push %r11
  7a:	20 43 61             	and    %al,0x61(%rbx)
  7d:	6e                   	outsb  %ds:(%rsi),(%dx)
  7e:	20 55 73             	and    %dl,0x73(%rbp)
  81:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
  87:	61                   	(bad)  
  88:	6c                   	insb   (%dx),%es:(%rdi)
  89:	20 52 41             	and    %dl,0x41(%rdx)
  8c:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # 383130b6 <alloc_pages+0x38311f23>
  93:	6c                   	insb   (%dx),%es:(%rdi)
  94:	78 0a                	js     a0 <.rodata+0xa0>
  96:	00 00                	add    %al,(%rax)
  98:	4f 53                	rex.WRXB push %r11
  9a:	20 43 61             	and    %al,0x61(%rbx)
  9d:	6e                   	outsb  %ds:(%rsi),(%dx)
  9e:	20 55 73             	and    %dl,0x73(%rbp)
  a1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
  a7:	61                   	(bad)  
  a8:	6c                   	insb   (%dx),%es:(%rdi)
  a9:	20 32                	and    %dh,(%rdx)
  ab:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
  af:	47                   	rex.RXB
  b0:	45 73 3a             	rex.RB jae ed <.rodata+0xed>
  b3:	25 23 30 31 30       	and    $0x30313023,%eax
  b8:	78 3d                	js     f7 <.rodata+0xf7>
  ba:	25 30 31 30 64       	and    $0x64303130,%eax
  bf:	0a 00                	or     (%rax),%al
  c1:	00 00                	add    %al,(%rax)
  c3:	00 00                	add    %al,(%rax)
  c5:	00 00                	add    %al,(%rax)
  c7:	00 62 69             	add    %ah,0x69(%rdx)
  ca:	74 73                	je     13f <.rodata+0x13f>
  cc:	5f                   	pop    %rdi
  cd:	6d                   	insl   (%dx),%es:(%rdi)
  ce:	61                   	(bad)  
  cf:	70 3a                	jo     10b <.rodata+0x10b>
  d1:	25 23 30 31 38       	and    $0x38313023,%eax
  d6:	6c                   	insb   (%dx),%es:(%rdi)
  d7:	78 2c                	js     105 <.rodata+0x105>
  d9:	62                   	(bad)  
  da:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
  e1:	65 
  e2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831310b <alloc_pages+0x38311f78>
  e8:	6c                   	insb   (%dx),%es:(%rdi)
  e9:	78 2c                	js     117 <.rodata+0x117>
  eb:	62                   	(bad)  
  ec:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
  f3:	67 
  f4:	74 68                	je     15e <.rodata+0x15e>
  f6:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831311f <alloc_pages+0x38311f8c>
  fc:	6c                   	insb   (%dx),%es:(%rdi)
  fd:	78 0a                	js     109 <.rodata+0x109>
  ff:	00 70 61             	add    %dh,0x61(%rax)
 102:	67 65 73 5f          	addr32 gs jae 165 <.rodata+0x165>
 106:	73 74                	jae    17c <.rodata+0x17c>
 108:	72 75                	jb     17f <.rodata+0x17f>
 10a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 10e:	23 30                	and    (%rax),%esi
 110:	31 38                	xor    %edi,(%rax)
 112:	6c                   	insb   (%dx),%es:(%rdi)
 113:	78 2c                	js     141 <.rodata+0x141>
 115:	70 61                	jo     178 <.rodata+0x178>
 117:	67 65 73 5f          	addr32 gs jae 17a <.rodata+0x17a>
 11b:	73 69                	jae    186 <.rodata+0x186>
 11d:	7a 65                	jp     184 <.rodata+0x184>
 11f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313148 <alloc_pages+0x38311fb5>
 125:	6c                   	insb   (%dx),%es:(%rdi)
 126:	78 2c                	js     154 <.rodata+0x154>
 128:	70 61                	jo     18b <.rodata+0x18b>
 12a:	67 65 73 5f          	addr32 gs jae 18d <.rodata+0x18d>
 12e:	6c                   	insb   (%dx),%es:(%rdi)
 12f:	65 6e                	outsb  %gs:(%rsi),(%dx)
 131:	67 74 68             	addr32 je 19c <.rodata+0x19c>
 134:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831315d <alloc_pages+0x38311fca>
 13a:	6c                   	insb   (%dx),%es:(%rdi)
 13b:	78 0a                	js     147 <.rodata+0x147>
 13d:	00 00                	add    %al,(%rax)
 13f:	00 7a 6f             	add    %bh,0x6f(%rdx)
 142:	6e                   	outsb  %ds:(%rsi),(%dx)
 143:	65 73 5f             	gs jae 1a5 <.rodata+0x1a5>
 146:	73 74                	jae    1bc <.rodata+0x1bc>
 148:	72 75                	jb     1bf <.rodata+0x1bf>
 14a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 14e:	23 30                	and    (%rax),%esi
 150:	31 38                	xor    %edi,(%rax)
 152:	6c                   	insb   (%dx),%es:(%rdi)
 153:	78 2c                	js     181 <.rodata+0x181>
 155:	7a 6f                	jp     1c6 <.rodata+0x1c6>
 157:	6e                   	outsb  %ds:(%rsi),(%dx)
 158:	65 73 5f             	gs jae 1ba <.rodata+0x1ba>
 15b:	73 69                	jae    1c6 <.rodata+0x1c6>
 15d:	7a 65                	jp     1c4 <.rodata+0x1c4>
 15f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313188 <alloc_pages+0x38311ff5>
 165:	6c                   	insb   (%dx),%es:(%rdi)
 166:	78 2c                	js     194 <.rodata+0x194>
 168:	7a 6f                	jp     1d9 <.rodata+0x1d9>
 16a:	6e                   	outsb  %ds:(%rsi),(%dx)
 16b:	65 73 5f             	gs jae 1cd <.rodata+0x1cd>
 16e:	6c                   	insb   (%dx),%es:(%rdi)
 16f:	65 6e                	outsb  %gs:(%rsi),(%dx)
 171:	67 74 68             	addr32 je 1dc <.rodata+0x1dc>
 174:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831319d <alloc_pages+0x3831200a>
 17a:	6c                   	insb   (%dx),%es:(%rdi)
 17b:	78 0a                	js     187 <.rodata+0x187>
 17d:	00 00                	add    %al,(%rax)
 17f:	00 7a 6f             	add    %bh,0x6f(%rdx)
 182:	6e                   	outsb  %ds:(%rsi),(%dx)
 183:	65 5f                	gs pop %rdi
 185:	73 74                	jae    1fb <.rodata+0x1fb>
 187:	61                   	(bad)  
 188:	72 74                	jb     1fe <.rodata+0x1fe>
 18a:	5f                   	pop    %rdi
 18b:	61                   	(bad)  
 18c:	64 64 72 65          	fs fs jb 1f5 <.rodata+0x1f5>
 190:	73 73                	jae    205 <.rodata+0x205>
 192:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131bb <alloc_pages+0x38312028>
 198:	6c                   	insb   (%dx),%es:(%rdi)
 199:	78 2c                	js     1c7 <.rodata+0x1c7>
 19b:	7a 6f                	jp     20c <.rodata+0x20c>
 19d:	6e                   	outsb  %ds:(%rsi),(%dx)
 19e:	65 5f                	gs pop %rdi
 1a0:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1a2:	64 5f                	fs pop %rdi
 1a4:	61                   	(bad)  
 1a5:	64 64 72 65          	fs fs jb 20e <.rodata+0x20e>
 1a9:	73 73                	jae    21e <.rodata+0x21e>
 1ab:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131d4 <alloc_pages+0x38312041>
 1b1:	6c                   	insb   (%dx),%es:(%rdi)
 1b2:	78 2c                	js     1e0 <.rodata+0x1e0>
 1b4:	7a 6f                	jp     225 <.rodata+0x225>
 1b6:	6e                   	outsb  %ds:(%rsi),(%dx)
 1b7:	65 5f                	gs pop %rdi
 1b9:	6c                   	insb   (%dx),%es:(%rdi)
 1ba:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1bc:	67 74 68             	addr32 je 227 <.rodata+0x227>
 1bf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131e8 <alloc_pages+0x38312055>
 1c5:	6c                   	insb   (%dx),%es:(%rdi)
 1c6:	78 2c                	js     1f4 <.rodata+0x1f4>
 1c8:	70 61                	jo     22b <.rodata+0x22b>
 1ca:	67 65 73 5f          	addr32 gs jae 22d <.rodata+0x22d>
 1ce:	67 72 6f             	addr32 jb 240 <.rodata+0x240>
 1d1:	75 70                	jne    243 <.rodata+0x243>
 1d3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131fc <alloc_pages+0x38312069>
 1d9:	6c                   	insb   (%dx),%es:(%rdi)
 1da:	78 2c                	js     208 <.rodata+0x208>
 1dc:	70 61                	jo     23f <.rodata+0x23f>
 1de:	67 65 73 5f          	addr32 gs jae 241 <.rodata+0x241>
 1e2:	6c                   	insb   (%dx),%es:(%rdi)
 1e3:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1e5:	67 74 68             	addr32 je 250 <.rodata+0x250>
 1e8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313211 <alloc_pages+0x3831207e>
 1ee:	6c                   	insb   (%dx),%es:(%rdi)
 1ef:	78 0a                	js     1fb <.rodata+0x1fb>
 1f1:	00 00                	add    %al,(%rax)
 1f3:	00 00                	add    %al,(%rax)
 1f5:	00 00                	add    %al,(%rax)
 1f7:	00 73 74             	add    %dh,0x74(%rbx)
 1fa:	61                   	(bad)  
 1fb:	72 74                	jb     271 <.rodata+0x271>
 1fd:	5f                   	pop    %rdi
 1fe:	63 6f 64             	movsxd 0x64(%rdi),%ebp
 201:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # 3831322b <alloc_pages+0x38312098>
 208:	6c                   	insb   (%dx),%es:(%rdi)
 209:	78 2c                	js     237 <.rodata+0x237>
 20b:	65 6e                	outsb  %gs:(%rsi),(%dx)
 20d:	64 5f                	fs pop %rdi
 20f:	63 6f 64             	movsxd 0x64(%rdi),%ebp
 212:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # 3831323c <alloc_pages+0x383120a9>
 219:	6c                   	insb   (%dx),%es:(%rdi)
 21a:	78 2c                	js     248 <.rodata+0x248>
 21c:	65 6e                	outsb  %gs:(%rsi),(%dx)
 21e:	64 5f                	fs pop %rdi
 220:	64 61                	fs (bad) 
 222:	74 61                	je     285 <.rodata+0x285>
 224:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831324d <alloc_pages+0x383120ba>
 22a:	6c                   	insb   (%dx),%es:(%rdi)
 22b:	78 2c                	js     259 <.rodata+0x259>
 22d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 22f:	64 5f                	fs pop %rdi
 231:	62 72                	(bad)  
 233:	6b 3a 25             	imul   $0x25,(%rdx),%edi
 236:	23 30                	and    (%rax),%esi
 238:	31 38                	xor    %edi,(%rax)
 23a:	6c                   	insb   (%dx),%es:(%rdi)
 23b:	78 2c                	js     269 <.rodata+0x269>
 23d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 23f:	64 5f                	fs pop %rdi
 241:	6f                   	outsl  %ds:(%rsi),(%dx)
 242:	66 5f                	pop    %di
 244:	73 74                	jae    2ba <.rodata+0x2ba>
 246:	72 75                	jb     2bd <page_clean+0x4a>
 248:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 24c:	23 30                	and    (%rax),%esi
 24e:	31 38                	xor    %edi,(%rax)
 250:	6c                   	insb   (%dx),%es:(%rdi)
 251:	78 0a                	js     25d <.rodata+0x25d>
 253:	00 47 6c             	add    %al,0x6c(%rdi)
 256:	6f                   	outsl  %ds:(%rsi),(%dx)
 257:	62 61 6c 5f 43       	(bad)
 25c:	52                   	push   %rdx
 25d:	33 09                	xor    (%rcx),%ecx
 25f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313288 <alloc_pages+0x383120f5>
 265:	6c                   	insb   (%dx),%es:(%rdi)
 266:	78 0a                	js     272 <.rodata+0x272>
 268:	00 2a                	add    %ch,(%rdx)
 26a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
 26c:	6f                   	outsl  %ds:(%rsi),(%dx)
 26d:	62 61 6c 5f 43       	(bad)
 272:	52                   	push   %rdx
 273:	33 09                	xor    (%rcx),%ecx
 275:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831329e <alloc_pages+0x3831210b>
 27b:	6c                   	insb   (%dx),%es:(%rdi)
 27c:	78 0a                	js     288 <.rodata+0x288>
 27e:	00 2a                	add    %ch,(%rdx)
 280:	2a 47 6c             	sub    0x6c(%rdi),%al
 283:	6f                   	outsl  %ds:(%rsi),(%dx)
 284:	62 61 6c 5f 43       	(bad)
 289:	52                   	push   %rdx
 28a:	33 09                	xor    (%rcx),%ecx
 28c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132b5 <alloc_pages+0x38312122>
 292:	6c                   	insb   (%dx),%es:(%rdi)
 293:	78 0a                	js     29f <.rodata+0x29f>
 295:	00 00                	add    %al,(%rax)
 297:	00 61 6c             	add    %ah,0x6c(%rcx)
 29a:	6c                   	insb   (%dx),%es:(%rdi)
 29b:	6f                   	outsl  %ds:(%rsi),(%dx)
 29c:	63 5f 70             	movsxd 0x70(%rdi),%ebx
 29f:	61                   	(bad)  
 2a0:	67 65 73 20          	addr32 gs jae 2c4 <page_clean+0x51>
 2a4:	65 72 72             	gs jb  319 <page_clean+0xa6>
 2a7:	6f                   	outsl  %ds:(%rsi),(%dx)
 2a8:	72 20                	jb     2ca <page_clean+0x57>
 2aa:	7a 6f                	jp     31b <page_clean+0xa8>
 2ac:	6e                   	outsb  %ds:(%rsi),(%dx)
 2ad:	65 5f                	gs pop %rdi
 2af:	73 65                	jae    316 <page_clean+0xa3>
 2b1:	6c                   	insb   (%dx),%es:(%rdi)
 2b2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
 2b7:	6e                   	outsb  %ds:(%rsi),(%dx)
 2b8:	64 65 78 0a          	fs gs js 2c6 <page_clean+0x53>
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
  24:	76 00                	jbe    26 <.eh_frame+0x26>
  26:	00 00                	add    %al,(%rax)
  28:	00 41 0e             	add    %al,0xe(%rcx)
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	02 71 0c             	add    0xc(%rcx),%dh
  34:	07                   	(bad)  
  35:	08 00                	or     %al,(%rax)
  37:	00 1c 00             	add    %bl,(%rax,%rax,1)
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	11 00                	adc    %eax,(%rax)
  46:	00 00                	add    %al,(%rax)
  48:	00 41 0e             	add    %al,0xe(%rcx)
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	4c 0c 07             	rex.WR or $0x7,%al
  54:	08 00                	or     %al,(%rax)
  56:	00 00                	add    %al,(%rax)
  58:	1c 00                	sbb    $0x0,%al
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 ec                	add    %ch,%ah
  65:	01 00                	add    %eax,(%rax)
  67:	00 00                	add    %al,(%rax)
  69:	41 0e                	rex.B (bad) 
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	03 e7                	add    %edi,%esp
  73:	01 0c 07             	add    %ecx,(%rdi,%rax,1)
  76:	08 00                	or     %al,(%rax)
  78:	1c 00                	sbb    $0x0,%al
  7a:	00 00                	add    %al,(%rax)
  7c:	7c 00                	jl     7e <.eh_frame+0x7e>
  7e:	00 00                	add    %al,(%rax)
  80:	00 00                	add    %al,(%rax)
  82:	00 00                	add    %al,(%rax)
  84:	82                   	(bad)  
  85:	01 00                	add    %eax,(%rax)
  87:	00 00                	add    %al,(%rax)
  89:	41 0e                	rex.B (bad) 
  8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  91:	03 7d 01             	add    0x1(%rbp),%edi
  94:	0c 07                	or     $0x7,%al
  96:	08 00                	or     %al,(%rax)
  98:	1c 00                	sbb    $0x0,%al
  9a:	00 00                	add    %al,(%rax)
  9c:	9c                   	pushfq 
  9d:	00 00                	add    %al,(%rax)
  9f:	00 00                	add    %al,(%rax)
  a1:	00 00                	add    %al,(%rax)
  a3:	00 9e 0d 00 00 00    	add    %bl,0xd(%rsi)
  a9:	41 0e                	rex.B (bad) 
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	03 99 0d 0c 07 08    	add    0x8070c0d(%rcx),%ebx
  b7:	00 1c 00             	add    %bl,(%rax,%rax,1)
  ba:	00 00                	add    %al,(%rax)
  bc:	bc 00 00 00 00       	mov    $0x0,%esp
  c1:	00 00                	add    %al,(%rax)
  c3:	00 32                	add    %dh,(%rdx)
  c5:	03 00                	add    (%rax),%eax
  c7:	00 00                	add    %al,(%rax)
  c9:	41 0e                	rex.B (bad) 
  cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  d1:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # 8070cda <alloc_pages+0x806fb47>
	...
