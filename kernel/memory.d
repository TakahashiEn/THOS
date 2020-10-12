
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
     447:	e9 85 01 00 00       	jmpq   5d1 <init_memory+0x1dc>
     44c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     450:	8b 48 10             	mov    0x10(%rax),%ecx
     453:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     457:	48 8b 50 08          	mov    0x8(%rax),%rdx
     45b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     45f:	48 8b 00             	mov    (%rax),%rax
     462:	41 89 c9             	mov    %ecx,%r9d
     465:	49 89 d0             	mov    %rdx,%r8
     468:	48 89 c1             	mov    %rax,%rcx
     46b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     472:	00 00 00 
     475:	be 00 00 00 00       	mov    $0x0,%esi
     47a:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     47f:	b8 00 00 00 00       	mov    $0x0,%eax
     484:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     48b:	00 00 00 
     48e:	41 ff d2             	callq  *%r10
     491:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
     498:	00 
     499:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     49d:	8b 40 10             	mov    0x10(%rax),%eax
     4a0:	83 f8 01             	cmp    $0x1,%eax
     4a3:	75 0c                	jne    4b1 <init_memory+0xbc>
     4a5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     4a9:	48 8b 40 08          	mov    0x8(%rax),%rax
     4ad:	48 01 45 f0          	add    %rax,-0x10(%rbp)
     4b1:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     4b8:	00 00 00 
     4bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
     4be:	48 63 d0             	movslq %eax,%rdx
     4c1:	48 89 d0             	mov    %rdx,%rax
     4c4:	48 c1 e0 02          	shl    $0x2,%rax
     4c8:	48 01 d0             	add    %rdx,%rax
     4cb:	48 c1 e0 02          	shl    $0x2,%rax
     4cf:	48 01 c8             	add    %rcx,%rax
     4d2:	48 8b 10             	mov    (%rax),%rdx
     4d5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     4d9:	48 8b 00             	mov    (%rax),%rax
     4dc:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     4e0:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     4e7:	00 00 00 
     4ea:	8b 45 fc             	mov    -0x4(%rbp),%eax
     4ed:	48 63 d0             	movslq %eax,%rdx
     4f0:	48 89 d0             	mov    %rdx,%rax
     4f3:	48 c1 e0 02          	shl    $0x2,%rax
     4f7:	48 01 d0             	add    %rdx,%rax
     4fa:	48 c1 e0 02          	shl    $0x2,%rax
     4fe:	48 01 f0             	add    %rsi,%rax
     501:	48 89 08             	mov    %rcx,(%rax)
     504:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     50b:	00 00 00 
     50e:	8b 45 fc             	mov    -0x4(%rbp),%eax
     511:	48 63 d0             	movslq %eax,%rdx
     514:	48 89 d0             	mov    %rdx,%rax
     517:	48 c1 e0 02          	shl    $0x2,%rax
     51b:	48 01 d0             	add    %rdx,%rax
     51e:	48 c1 e0 02          	shl    $0x2,%rax
     522:	48 01 c8             	add    %rcx,%rax
     525:	48 83 c0 08          	add    $0x8,%rax
     529:	48 8b 10             	mov    (%rax),%rdx
     52c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     530:	48 8b 40 08          	mov    0x8(%rax),%rax
     534:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     538:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     53f:	00 00 00 
     542:	8b 45 fc             	mov    -0x4(%rbp),%eax
     545:	48 63 d0             	movslq %eax,%rdx
     548:	48 89 d0             	mov    %rdx,%rax
     54b:	48 c1 e0 02          	shl    $0x2,%rax
     54f:	48 01 d0             	add    %rdx,%rax
     552:	48 c1 e0 02          	shl    $0x2,%rax
     556:	48 01 f0             	add    %rsi,%rax
     559:	48 83 c0 08          	add    $0x8,%rax
     55d:	48 89 08             	mov    %rcx,(%rax)
     560:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     564:	8b 50 10             	mov    0x10(%rax),%edx
     567:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     56e:	00 00 00 
     571:	8b 45 fc             	mov    -0x4(%rbp),%eax
     574:	48 63 c8             	movslq %eax,%rcx
     577:	48 89 c8             	mov    %rcx,%rax
     57a:	48 c1 e0 02          	shl    $0x2,%rax
     57e:	48 01 c8             	add    %rcx,%rax
     581:	48 c1 e0 02          	shl    $0x2,%rax
     585:	48 01 f0             	add    %rsi,%rax
     588:	48 83 c0 10          	add    $0x10,%rax
     58c:	89 10                	mov    %edx,(%rax)
     58e:	8b 45 fc             	mov    -0x4(%rbp),%eax
     591:	48 98                	cltq   
     593:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     59a:	00 00 00 
     59d:	48 89 82 80 02 00 00 	mov    %rax,0x280(%rdx)
     5a4:	48 83 45 e8 14       	addq   $0x14,-0x18(%rbp)
     5a9:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5ad:	8b 40 10             	mov    0x10(%rax),%eax
     5b0:	83 f8 04             	cmp    $0x4,%eax
     5b3:	77 26                	ja     5db <init_memory+0x1e6>
     5b5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5b9:	48 8b 40 08          	mov    0x8(%rax),%rax
     5bd:	48 85 c0             	test   %rax,%rax
     5c0:	74 19                	je     5db <init_memory+0x1e6>
     5c2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     5c6:	8b 40 10             	mov    0x10(%rax),%eax
     5c9:	85 c0                	test   %eax,%eax
     5cb:	74 0e                	je     5db <init_memory+0x1e6>
     5cd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     5d1:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%rbp)
     5d5:	0f 8e 71 fe ff ff    	jle    44c <init_memory+0x57>
     5db:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     5df:	48 89 c1             	mov    %rax,%rcx
     5e2:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     5e9:	00 00 00 
     5ec:	be 00 00 00 00       	mov    $0x0,%esi
     5f1:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     5f6:	b8 00 00 00 00       	mov    $0x0,%eax
     5fb:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     602:	00 00 00 
     605:	41 ff d0             	callq  *%r8
     608:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     60f:	00 
     610:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     617:	e9 e1 00 00 00       	jmpq   6fd <init_memory+0x308>
     61c:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     623:	00 00 00 
     626:	8b 45 fc             	mov    -0x4(%rbp),%eax
     629:	48 63 d0             	movslq %eax,%rdx
     62c:	48 89 d0             	mov    %rdx,%rax
     62f:	48 c1 e0 02          	shl    $0x2,%rax
     633:	48 01 d0             	add    %rdx,%rax
     636:	48 c1 e0 02          	shl    $0x2,%rax
     63a:	48 01 c8             	add    %rcx,%rax
     63d:	48 83 c0 10          	add    $0x10,%rax
     641:	8b 00                	mov    (%rax),%eax
     643:	83 f8 01             	cmp    $0x1,%eax
     646:	0f 85 a9 00 00 00    	jne    6f5 <init_memory+0x300>
     64c:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     653:	00 00 00 
     656:	8b 45 fc             	mov    -0x4(%rbp),%eax
     659:	48 63 d0             	movslq %eax,%rdx
     65c:	48 89 d0             	mov    %rdx,%rax
     65f:	48 c1 e0 02          	shl    $0x2,%rax
     663:	48 01 d0             	add    %rdx,%rax
     666:	48 c1 e0 02          	shl    $0x2,%rax
     66a:	48 01 c8             	add    %rcx,%rax
     66d:	48 8b 00             	mov    (%rax),%rax
     670:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
     676:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     67c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
     680:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     687:	00 00 00 
     68a:	8b 45 fc             	mov    -0x4(%rbp),%eax
     68d:	48 63 d0             	movslq %eax,%rdx
     690:	48 89 d0             	mov    %rdx,%rax
     693:	48 c1 e0 02          	shl    $0x2,%rax
     697:	48 01 d0             	add    %rdx,%rax
     69a:	48 c1 e0 02          	shl    $0x2,%rax
     69e:	48 01 c8             	add    %rcx,%rax
     6a1:	48 8b 08             	mov    (%rax),%rcx
     6a4:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     6ab:	00 00 00 
     6ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
     6b1:	48 63 d0             	movslq %eax,%rdx
     6b4:	48 89 d0             	mov    %rdx,%rax
     6b7:	48 c1 e0 02          	shl    $0x2,%rax
     6bb:	48 01 d0             	add    %rdx,%rax
     6be:	48 c1 e0 02          	shl    $0x2,%rax
     6c2:	48 01 f0             	add    %rsi,%rax
     6c5:	48 83 c0 08          	add    $0x8,%rax
     6c9:	48 8b 00             	mov    (%rax),%rax
     6cc:	48 01 c8             	add    %rcx,%rax
     6cf:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     6d5:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
     6d9:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     6dd:	48 3b 45 a8          	cmp    -0x58(%rbp),%rax
     6e1:	76 15                	jbe    6f8 <init_memory+0x303>
     6e3:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     6e7:	48 2b 45 a8          	sub    -0x58(%rbp),%rax
     6eb:	48 c1 e8 15          	shr    $0x15,%rax
     6ef:	48 01 45 f0          	add    %rax,-0x10(%rbp)
     6f3:	eb 04                	jmp    6f9 <init_memory+0x304>
     6f5:	90                   	nop
     6f6:	eb 01                	jmp    6f9 <init_memory+0x304>
     6f8:	90                   	nop
     6f9:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     6fd:	8b 45 fc             	mov    -0x4(%rbp),%eax
     700:	48 63 d0             	movslq %eax,%rdx
     703:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     70a:	00 00 00 
     70d:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
     714:	48 39 c2             	cmp    %rax,%rdx
     717:	0f 86 ff fe ff ff    	jbe    61c <init_memory+0x227>
     71d:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     721:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     725:	49 89 d0             	mov    %rdx,%r8
     728:	48 89 c1             	mov    %rax,%rcx
     72b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     732:	00 00 00 
     735:	be 00 00 00 00       	mov    $0x0,%esi
     73a:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     73f:	b8 00 00 00 00       	mov    $0x0,%eax
     744:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
     74b:	00 00 00 
     74e:	41 ff d1             	callq  *%r9
     751:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     758:	00 00 00 
     75b:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
     762:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     769:	00 00 00 
     76c:	48 89 d0             	mov    %rdx,%rax
     76f:	48 c1 e0 02          	shl    $0x2,%rax
     773:	48 01 d0             	add    %rdx,%rax
     776:	48 c1 e0 02          	shl    $0x2,%rax
     77a:	48 01 c8             	add    %rcx,%rax
     77d:	48 8b 08             	mov    (%rax),%rcx
     780:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     787:	00 00 00 
     78a:	48 8b 90 80 02 00 00 	mov    0x280(%rax),%rdx
     791:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     798:	00 00 00 
     79b:	48 89 d0             	mov    %rdx,%rax
     79e:	48 c1 e0 02          	shl    $0x2,%rax
     7a2:	48 01 d0             	add    %rdx,%rax
     7a5:	48 c1 e0 02          	shl    $0x2,%rax
     7a9:	48 01 f0             	add    %rsi,%rax
     7ac:	48 83 c0 08          	add    $0x8,%rax
     7b0:	48 8b 00             	mov    (%rax),%rax
     7b3:	48 01 c8             	add    %rcx,%rax
     7b6:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     7ba:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7c1:	00 00 00 
     7c4:	48 8b 80 e8 02 00 00 	mov    0x2e8(%rax),%rax
     7cb:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     7d1:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     7d7:	48 89 c2             	mov    %rax,%rdx
     7da:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7e1:	00 00 00 
     7e4:	48 89 90 88 02 00 00 	mov    %rdx,0x288(%rax)
     7eb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     7ef:	48 c1 e8 15          	shr    $0x15,%rax
     7f3:	48 89 c2             	mov    %rax,%rdx
     7f6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     7fd:	00 00 00 
     800:	48 89 90 90 02 00 00 	mov    %rdx,0x290(%rax)
     807:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     80b:	48 c1 e8 15          	shr    $0x15,%rax
     80f:	48 83 c0 3f          	add    $0x3f,%rax
     813:	48 c1 e8 03          	shr    $0x3,%rax
     817:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     81b:	48 89 c2             	mov    %rax,%rdx
     81e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     825:	00 00 00 
     828:	48 89 90 98 02 00 00 	mov    %rdx,0x298(%rax)
     82f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     836:	00 00 00 
     839:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
     840:	48 89 c2             	mov    %rax,%rdx
     843:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     84a:	00 00 00 
     84d:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     854:	be ff 00 00 00       	mov    $0xff,%esi
     859:	48 89 c7             	mov    %rax,%rdi
     85c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     863:	00 00 00 
     866:	ff d0                	callq  *%rax
     868:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     86f:	00 00 00 
     872:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     879:	48 89 c2             	mov    %rax,%rdx
     87c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     883:	00 00 00 
     886:	48 8b 80 98 02 00 00 	mov    0x298(%rax),%rax
     88d:	48 01 d0             	add    %rdx,%rax
     890:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     896:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     89c:	48 89 c2             	mov    %rax,%rdx
     89f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8a6:	00 00 00 
     8a9:	48 89 90 a0 02 00 00 	mov    %rdx,0x2a0(%rax)
     8b0:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     8b4:	48 c1 e8 15          	shr    $0x15,%rax
     8b8:	48 89 c2             	mov    %rax,%rdx
     8bb:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8c2:	00 00 00 
     8c5:	48 89 90 a8 02 00 00 	mov    %rdx,0x2a8(%rax)
     8cc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     8d0:	48 c1 e8 15          	shr    $0x15,%rax
     8d4:	48 89 c2             	mov    %rax,%rdx
     8d7:	48 89 d0             	mov    %rdx,%rax
     8da:	48 c1 e0 02          	shl    $0x2,%rax
     8de:	48 01 d0             	add    %rdx,%rax
     8e1:	48 c1 e0 03          	shl    $0x3,%rax
     8e5:	48 83 c0 07          	add    $0x7,%rax
     8e9:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     8ed:	48 89 c2             	mov    %rax,%rdx
     8f0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     8f7:	00 00 00 
     8fa:	48 89 90 b0 02 00 00 	mov    %rdx,0x2b0(%rax)
     901:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     908:	00 00 00 
     90b:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
     912:	48 89 c2             	mov    %rax,%rdx
     915:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     91c:	00 00 00 
     91f:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     926:	be 00 00 00 00       	mov    $0x0,%esi
     92b:	48 89 c7             	mov    %rax,%rdi
     92e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     935:	00 00 00 
     938:	ff d0                	callq  *%rax
     93a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     941:	00 00 00 
     944:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     94b:	48 89 c2             	mov    %rax,%rdx
     94e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     955:	00 00 00 
     958:	48 8b 80 b0 02 00 00 	mov    0x2b0(%rax),%rax
     95f:	48 01 d0             	add    %rdx,%rax
     962:	48 05 ff 0f 00 00    	add    $0xfff,%rax
     968:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
     96e:	48 89 c2             	mov    %rax,%rdx
     971:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     978:	00 00 00 
     97b:	48 89 90 b8 02 00 00 	mov    %rdx,0x2b8(%rax)
     982:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     989:	00 00 00 
     98c:	48 c7 80 c0 02 00 00 	movq   $0x0,0x2c0(%rax)
     993:	00 00 00 00 
     997:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     99e:	00 00 00 
     9a1:	48 c7 80 c8 02 00 00 	movq   $0x190,0x2c8(%rax)
     9a8:	90 01 00 00 
     9ac:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     9b3:	00 00 00 
     9b6:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
     9bd:	48 89 c2             	mov    %rax,%rdx
     9c0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     9c7:	00 00 00 
     9ca:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     9d1:	be 00 00 00 00       	mov    $0x0,%esi
     9d6:	48 89 c7             	mov    %rax,%rdi
     9d9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     9e0:	00 00 00 
     9e3:	ff d0                	callq  *%rax
     9e5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     9ec:	e9 e1 02 00 00       	jmpq   cd2 <init_memory+0x8dd>
     9f1:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     9f8:	00 00 00 
     9fb:	8b 45 fc             	mov    -0x4(%rbp),%eax
     9fe:	48 63 d0             	movslq %eax,%rdx
     a01:	48 89 d0             	mov    %rdx,%rax
     a04:	48 c1 e0 02          	shl    $0x2,%rax
     a08:	48 01 d0             	add    %rdx,%rax
     a0b:	48 c1 e0 02          	shl    $0x2,%rax
     a0f:	48 01 c8             	add    %rcx,%rax
     a12:	48 83 c0 10          	add    $0x10,%rax
     a16:	8b 00                	mov    (%rax),%eax
     a18:	83 f8 01             	cmp    $0x1,%eax
     a1b:	0f 85 a9 02 00 00    	jne    cca <init_memory+0x8d5>
     a21:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     a28:	00 00 00 
     a2b:	8b 45 fc             	mov    -0x4(%rbp),%eax
     a2e:	48 63 d0             	movslq %eax,%rdx
     a31:	48 89 d0             	mov    %rdx,%rax
     a34:	48 c1 e0 02          	shl    $0x2,%rax
     a38:	48 01 d0             	add    %rdx,%rax
     a3b:	48 c1 e0 02          	shl    $0x2,%rax
     a3f:	48 01 c8             	add    %rcx,%rax
     a42:	48 8b 00             	mov    (%rax),%rax
     a45:	48 05 ff ff 1f 00    	add    $0x1fffff,%rax
     a4b:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     a51:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
     a55:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     a5c:	00 00 00 
     a5f:	8b 45 fc             	mov    -0x4(%rbp),%eax
     a62:	48 63 d0             	movslq %eax,%rdx
     a65:	48 89 d0             	mov    %rdx,%rax
     a68:	48 c1 e0 02          	shl    $0x2,%rax
     a6c:	48 01 d0             	add    %rdx,%rax
     a6f:	48 c1 e0 02          	shl    $0x2,%rax
     a73:	48 01 c8             	add    %rcx,%rax
     a76:	48 8b 08             	mov    (%rax),%rcx
     a79:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
     a80:	00 00 00 
     a83:	8b 45 fc             	mov    -0x4(%rbp),%eax
     a86:	48 63 d0             	movslq %eax,%rdx
     a89:	48 89 d0             	mov    %rdx,%rax
     a8c:	48 c1 e0 02          	shl    $0x2,%rax
     a90:	48 01 d0             	add    %rdx,%rax
     a93:	48 c1 e0 02          	shl    $0x2,%rax
     a97:	48 01 f0             	add    %rsi,%rax
     a9a:	48 83 c0 08          	add    $0x8,%rax
     a9e:	48 8b 00             	mov    (%rax),%rax
     aa1:	48 01 c8             	add    %rcx,%rax
     aa4:	48 25 00 00 e0 ff    	and    $0xffffffffffe00000,%rax
     aaa:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
     aae:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     ab2:	48 3b 45 c0          	cmp    -0x40(%rbp),%rax
     ab6:	0f 86 11 02 00 00    	jbe    ccd <init_memory+0x8d8>
     abc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ac3:	00 00 00 
     ac6:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
     acd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ad4:	00 00 00 
     ad7:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     ade:	48 89 d0             	mov    %rdx,%rax
     ae1:	48 c1 e0 02          	shl    $0x2,%rax
     ae5:	48 01 d0             	add    %rdx,%rax
     ae8:	48 c1 e0 04          	shl    $0x4,%rax
     aec:	48 01 c8             	add    %rcx,%rax
     aef:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     af3:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     afa:	00 00 00 
     afd:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
     b04:	48 8d 50 01          	lea    0x1(%rax),%rdx
     b08:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     b0f:	00 00 00 
     b12:	48 89 90 c0 02 00 00 	mov    %rdx,0x2c0(%rax)
     b19:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b1d:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
     b21:	48 89 50 10          	mov    %rdx,0x10(%rax)
     b25:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b29:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
     b2d:	48 89 50 18          	mov    %rdx,0x18(%rax)
     b31:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     b35:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     b39:	48 89 c2             	mov    %rax,%rdx
     b3c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b40:	48 89 50 20          	mov    %rdx,0x20(%rax)
     b44:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b48:	48 c7 40 38 00 00 00 	movq   $0x0,0x38(%rax)
     b4f:	00 
     b50:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     b54:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     b58:	48 c1 e8 15          	shr    $0x15,%rax
     b5c:	48 89 c2             	mov    %rax,%rdx
     b5f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b63:	48 89 50 40          	mov    %rdx,0x40(%rax)
     b67:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b6b:	48 c7 40 48 00 00 00 	movq   $0x0,0x48(%rax)
     b72:	00 
     b73:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b77:	48 c7 40 28 00 00 00 	movq   $0x0,0x28(%rax)
     b7e:	00 
     b7f:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     b83:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
     b8a:	00 00 00 
     b8d:	48 89 78 30          	mov    %rdi,0x30(%rax)
     b91:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     b95:	48 2b 45 c0          	sub    -0x40(%rbp),%rax
     b99:	48 c1 e8 15          	shr    $0x15,%rax
     b9d:	48 89 c2             	mov    %rax,%rdx
     ba0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     ba4:	48 89 50 08          	mov    %rdx,0x8(%rax)
     ba8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     baf:	00 00 00 
     bb2:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
     bb9:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     bbd:	48 c1 e8 15          	shr    $0x15,%rax
     bc1:	48 89 c2             	mov    %rax,%rdx
     bc4:	48 89 d0             	mov    %rdx,%rax
     bc7:	48 c1 e0 02          	shl    $0x2,%rax
     bcb:	48 01 d0             	add    %rdx,%rax
     bce:	48 c1 e0 03          	shl    $0x3,%rax
     bd2:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
     bd6:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     bda:	48 89 10             	mov    %rdx,(%rax)
     bdd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     be1:	48 8b 00             	mov    (%rax),%rax
     be4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
     be8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
     bef:	e9 bd 00 00 00       	jmpq   cb1 <init_memory+0x8bc>
     bf4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     bf8:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     bfc:	48 89 10             	mov    %rdx,(%rax)
     bff:	8b 45 f8             	mov    -0x8(%rbp),%eax
     c02:	48 98                	cltq   
     c04:	48 c1 e0 15          	shl    $0x15,%rax
     c08:	48 89 c2             	mov    %rax,%rdx
     c0b:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
     c0f:	48 01 c2             	add    %rax,%rdx
     c12:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c16:	48 89 50 08          	mov    %rdx,0x8(%rax)
     c1a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c1e:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     c25:	00 
     c26:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c2a:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
     c31:	00 
     c32:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c36:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
     c3d:	00 
     c3e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c45:	00 00 00 
     c48:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
     c4f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c53:	48 8b 40 08          	mov    0x8(%rax),%rax
     c57:	48 c1 e8 1b          	shr    $0x1b,%rax
     c5b:	48 c1 e0 03          	shl    $0x3,%rax
     c5f:	48 01 d0             	add    %rdx,%rax
     c62:	48 8b 10             	mov    (%rax),%rdx
     c65:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c69:	48 8b 40 08          	mov    0x8(%rax),%rax
     c6d:	48 c1 e8 15          	shr    $0x15,%rax
     c71:	83 e0 3f             	and    $0x3f,%eax
     c74:	be 01 00 00 00       	mov    $0x1,%esi
     c79:	89 c1                	mov    %eax,%ecx
     c7b:	48 d3 e6             	shl    %cl,%rsi
     c7e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     c85:	00 00 00 
     c88:	48 8b 88 88 02 00 00 	mov    0x288(%rax),%rcx
     c8f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c93:	48 8b 40 08          	mov    0x8(%rax),%rax
     c97:	48 c1 e8 1b          	shr    $0x1b,%rax
     c9b:	48 c1 e0 03          	shl    $0x3,%rax
     c9f:	48 01 c8             	add    %rcx,%rax
     ca2:	48 31 f2             	xor    %rsi,%rdx
     ca5:	48 89 10             	mov    %rdx,(%rax)
     ca8:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
     cac:	48 83 45 e0 28       	addq   $0x28,-0x20(%rbp)
     cb1:	8b 45 f8             	mov    -0x8(%rbp),%eax
     cb4:	48 63 d0             	movslq %eax,%rdx
     cb7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     cbb:	48 8b 40 08          	mov    0x8(%rax),%rax
     cbf:	48 39 c2             	cmp    %rax,%rdx
     cc2:	0f 82 2c ff ff ff    	jb     bf4 <init_memory+0x7ff>
     cc8:	eb 04                	jmp    cce <init_memory+0x8d9>
     cca:	90                   	nop
     ccb:	eb 01                	jmp    cce <init_memory+0x8d9>
     ccd:	90                   	nop
     cce:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     cd2:	8b 45 fc             	mov    -0x4(%rbp),%eax
     cd5:	48 63 d0             	movslq %eax,%rdx
     cd8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     cdf:	00 00 00 
     ce2:	48 8b 80 80 02 00 00 	mov    0x280(%rax),%rax
     ce9:	48 39 c2             	cmp    %rax,%rdx
     cec:	0f 86 ff fc ff ff    	jbe    9f1 <init_memory+0x5fc>
     cf2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     cf9:	00 00 00 
     cfc:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     d03:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d0a:	00 00 00 
     d0d:	48 8b 92 b8 02 00 00 	mov    0x2b8(%rdx),%rdx
     d14:	48 89 10             	mov    %rdx,(%rax)
     d17:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d1e:	00 00 00 
     d21:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     d28:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
     d2f:	00 
     d30:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d37:	00 00 00 
     d3a:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     d41:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     d48:	00 
     d49:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d50:	00 00 00 
     d53:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     d5a:	48 c7 40 18 00 00 00 	movq   $0x0,0x18(%rax)
     d61:	00 
     d62:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d69:	00 00 00 
     d6c:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     d73:	48 c7 40 20 00 00 00 	movq   $0x0,0x20(%rax)
     d7a:	00 
     d7b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     d82:	00 00 00 
     d85:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     d8c:	48 89 d0             	mov    %rdx,%rax
     d8f:	48 c1 e0 02          	shl    $0x2,%rax
     d93:	48 01 d0             	add    %rdx,%rax
     d96:	48 c1 e0 04          	shl    $0x4,%rax
     d9a:	48 83 c0 07          	add    $0x7,%rax
     d9e:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
     da2:	48 89 c2             	mov    %rax,%rdx
     da5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     dac:	00 00 00 
     daf:	48 89 90 c8 02 00 00 	mov    %rdx,0x2c8(%rax)
     db6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     dbd:	00 00 00 
     dc0:	48 8b 88 98 02 00 00 	mov    0x298(%rax),%rcx
     dc7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     dce:	00 00 00 
     dd1:	48 8b 90 90 02 00 00 	mov    0x290(%rax),%rdx
     dd8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ddf:	00 00 00 
     de2:	48 8b 80 88 02 00 00 	mov    0x288(%rax),%rax
     de9:	49 89 c9             	mov    %rcx,%r9
     dec:	49 89 d0             	mov    %rdx,%r8
     def:	48 89 c1             	mov    %rax,%rcx
     df2:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     df9:	00 00 00 
     dfc:	be 00 00 00 00       	mov    $0x0,%esi
     e01:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     e06:	b8 00 00 00 00       	mov    $0x0,%eax
     e0b:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     e12:	00 00 00 
     e15:	41 ff d2             	callq  *%r10
     e18:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e1f:	00 00 00 
     e22:	48 8b 88 b0 02 00 00 	mov    0x2b0(%rax),%rcx
     e29:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e30:	00 00 00 
     e33:	48 8b 90 a8 02 00 00 	mov    0x2a8(%rax),%rdx
     e3a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e41:	00 00 00 
     e44:	48 8b 80 a0 02 00 00 	mov    0x2a0(%rax),%rax
     e4b:	49 89 c9             	mov    %rcx,%r9
     e4e:	49 89 d0             	mov    %rdx,%r8
     e51:	48 89 c1             	mov    %rax,%rcx
     e54:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e5b:	00 00 00 
     e5e:	be 00 00 00 00       	mov    $0x0,%esi
     e63:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     e68:	b8 00 00 00 00       	mov    $0x0,%eax
     e6d:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     e74:	00 00 00 
     e77:	41 ff d2             	callq  *%r10
     e7a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e81:	00 00 00 
     e84:	48 8b 88 c8 02 00 00 	mov    0x2c8(%rax),%rcx
     e8b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e92:	00 00 00 
     e95:	48 8b 90 c0 02 00 00 	mov    0x2c0(%rax),%rdx
     e9c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ea3:	00 00 00 
     ea6:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     ead:	49 89 c9             	mov    %rcx,%r9
     eb0:	49 89 d0             	mov    %rdx,%r8
     eb3:	48 89 c1             	mov    %rax,%rcx
     eb6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     ebd:	00 00 00 
     ec0:	be 00 00 00 00       	mov    $0x0,%esi
     ec5:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     eca:	b8 00 00 00 00       	mov    $0x0,%eax
     ecf:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     ed6:	00 00 00 
     ed9:	41 ff d2             	callq  *%r10
     edc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ee3:	00 00 00 
     ee6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
     eec:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ef3:	00 00 00 
     ef6:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
     efc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     f03:	e9 b2 00 00 00       	jmpq   fba <init_memory+0xbc5>
     f08:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f0f:	00 00 00 
     f12:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
     f19:	8b 45 fc             	mov    -0x4(%rbp),%eax
     f1c:	48 63 d0             	movslq %eax,%rdx
     f1f:	48 89 d0             	mov    %rdx,%rax
     f22:	48 c1 e0 02          	shl    $0x2,%rax
     f26:	48 01 d0             	add    %rdx,%rax
     f29:	48 c1 e0 04          	shl    $0x4,%rax
     f2d:	48 01 c8             	add    %rcx,%rax
     f30:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     f34:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f38:	48 8b 48 08          	mov    0x8(%rax),%rcx
     f3c:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f40:	48 8b 10             	mov    (%rax),%rdx
     f43:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f47:	48 8b 78 20          	mov    0x20(%rax),%rdi
     f4b:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f4f:	48 8b 70 18          	mov    0x18(%rax),%rsi
     f53:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f57:	48 8b 40 10          	mov    0x10(%rax),%rax
     f5b:	51                   	push   %rcx
     f5c:	52                   	push   %rdx
     f5d:	49 89 f9             	mov    %rdi,%r9
     f60:	49 89 f0             	mov    %rsi,%r8
     f63:	48 89 c1             	mov    %rax,%rcx
     f66:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     f6d:	00 00 00 
     f70:	be 00 00 00 00       	mov    $0x0,%esi
     f75:	bf 00 80 ff 00       	mov    $0xff8000,%edi
     f7a:	b8 00 00 00 00       	mov    $0x0,%eax
     f7f:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     f86:	00 00 00 
     f89:	41 ff d2             	callq  *%r10
     f8c:	48 83 c4 10          	add    $0x10,%rsp
     f90:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     f94:	48 8b 40 10          	mov    0x10(%rax),%rax
     f98:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
     f9f:	00 00 00 
     fa2:	48 39 d0             	cmp    %rdx,%rax
     fa5:	75 0f                	jne    fb6 <init_memory+0xbc1>
     fa7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     fae:	00 00 00 
     fb1:	8b 45 fc             	mov    -0x4(%rbp),%eax
     fb4:	89 02                	mov    %eax,(%rdx)
     fb6:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     fba:	8b 45 fc             	mov    -0x4(%rbp),%eax
     fbd:	48 63 d0             	movslq %eax,%rdx
     fc0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fc7:	00 00 00 
     fca:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
     fd1:	48 39 c2             	cmp    %rax,%rdx
     fd4:	0f 82 2e ff ff ff    	jb     f08 <init_memory+0xb13>
     fda:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fe1:	00 00 00 
     fe4:	48 8b 80 b8 02 00 00 	mov    0x2b8(%rax),%rax
     feb:	48 89 c2             	mov    %rax,%rdx
     fee:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ff5:	00 00 00 
     ff8:	48 8b 80 c8 02 00 00 	mov    0x2c8(%rax),%rax
     fff:	48 01 d0             	add    %rdx,%rax
    1002:	48 05 00 01 00 00    	add    $0x100,%rax
    1008:	48 83 e0 f8          	and    $0xfffffffffffffff8,%rax
    100c:	48 89 c2             	mov    %rax,%rdx
    100f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1016:	00 00 00 
    1019:	48 89 90 f0 02 00 00 	mov    %rdx,0x2f0(%rax)
    1020:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1027:	00 00 00 
    102a:	48 8b 88 f0 02 00 00 	mov    0x2f0(%rax),%rcx
    1031:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1038:	00 00 00 
    103b:	48 8b 90 e8 02 00 00 	mov    0x2e8(%rax),%rdx
    1042:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1049:	00 00 00 
    104c:	48 8b b8 e0 02 00 00 	mov    0x2e0(%rax),%rdi
    1053:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    105a:	00 00 00 
    105d:	48 8b b0 d8 02 00 00 	mov    0x2d8(%rax),%rsi
    1064:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    106b:	00 00 00 
    106e:	48 8b 80 d0 02 00 00 	mov    0x2d0(%rax),%rax
    1075:	51                   	push   %rcx
    1076:	52                   	push   %rdx
    1077:	49 89 f9             	mov    %rdi,%r9
    107a:	49 89 f0             	mov    %rsi,%r8
    107d:	48 89 c1             	mov    %rax,%rcx
    1080:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1087:	00 00 00 
    108a:	be 00 00 00 00       	mov    $0x0,%esi
    108f:	bf 00 80 ff 00       	mov    $0xff8000,%edi
    1094:	b8 00 00 00 00       	mov    $0x0,%eax
    1099:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
    10a0:	00 00 00 
    10a3:	41 ff d2             	callq  *%r10
    10a6:	48 83 c4 10          	add    $0x10,%rsp
    10aa:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10b1:	00 00 00 
    10b4:	48 8b 80 f0 02 00 00 	mov    0x2f0(%rax),%rax
    10bb:	48 ba 00 00 00 00 00 	movabs $0x800000000000,%rdx
    10c2:	80 00 00 
    10c5:	48 01 d0             	add    %rdx,%rax
    10c8:	48 c1 e8 15          	shr    $0x15,%rax
    10cc:	89 45 fc             	mov    %eax,-0x4(%rbp)
    10cf:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    10d6:	eb 40                	jmp    1118 <init_memory+0xd23>
    10d8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10df:	00 00 00 
    10e2:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    10e9:	8b 45 f8             	mov    -0x8(%rbp),%eax
    10ec:	48 63 d0             	movslq %eax,%rdx
    10ef:	48 89 d0             	mov    %rdx,%rax
    10f2:	48 c1 e0 02          	shl    $0x2,%rax
    10f6:	48 01 d0             	add    %rdx,%rax
    10f9:	48 c1 e0 03          	shl    $0x3,%rax
    10fd:	48 01 c8             	add    %rcx,%rax
    1100:	be 93 00 00 00       	mov    $0x93,%esi
    1105:	48 89 c7             	mov    %rax,%rdi
    1108:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    110f:	00 00 00 
    1112:	ff d0                	callq  *%rax
    1114:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    1118:	8b 45 f8             	mov    -0x8(%rbp),%eax
    111b:	3b 45 fc             	cmp    -0x4(%rbp),%eax
    111e:	7e b8                	jle    10d8 <init_memory+0xce3>
    1120:	b8 00 00 00 00       	mov    $0x0,%eax
    1125:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    112c:	00 00 00 
    112f:	ff d2                	callq  *%rdx
    1131:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1138:	00 00 00 
    113b:	48 89 02             	mov    %rax,(%rdx)
    113e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1145:	00 00 00 
    1148:	48 8b 00             	mov    (%rax),%rax
    114b:	48 89 c1             	mov    %rax,%rcx
    114e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1155:	00 00 00 
    1158:	be 00 00 00 00       	mov    $0x0,%esi
    115d:	bf ff ff 00 00       	mov    $0xffff,%edi
    1162:	b8 00 00 00 00       	mov    $0x0,%eax
    1167:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    116e:	00 00 00 
    1171:	41 ff d0             	callq  *%r8
    1174:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    117b:	00 00 00 
    117e:	48 8b 00             	mov    (%rax),%rax
    1181:	48 89 c2             	mov    %rax,%rdx
    1184:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    118b:	80 ff ff 
    118e:	48 01 d0             	add    %rdx,%rax
    1191:	48 8b 00             	mov    (%rax),%rax
    1194:	b0 00                	mov    $0x0,%al
    1196:	48 89 c1             	mov    %rax,%rcx
    1199:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    11a0:	00 00 00 
    11a3:	be 00 00 00 00       	mov    $0x0,%esi
    11a8:	bf ff ff 00 00       	mov    $0xffff,%edi
    11ad:	b8 00 00 00 00       	mov    $0x0,%eax
    11b2:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    11b9:	00 00 00 
    11bc:	41 ff d0             	callq  *%r8
    11bf:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11c6:	00 00 00 
    11c9:	48 8b 00             	mov    (%rax),%rax
    11cc:	48 89 c2             	mov    %rax,%rdx
    11cf:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    11d6:	80 ff ff 
    11d9:	48 01 d0             	add    %rdx,%rax
    11dc:	48 8b 00             	mov    (%rax),%rax
    11df:	b0 00                	mov    $0x0,%al
    11e1:	48 89 c2             	mov    %rax,%rdx
    11e4:	48 b8 00 00 00 00 00 	movabs $0xffff800000000000,%rax
    11eb:	80 ff ff 
    11ee:	48 01 d0             	add    %rdx,%rax
    11f1:	48 8b 00             	mov    (%rax),%rax
    11f4:	b0 00                	mov    $0x0,%al
    11f6:	48 89 c1             	mov    %rax,%rcx
    11f9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    1200:	00 00 00 
    1203:	be 00 00 00 00       	mov    $0x0,%esi
    1208:	bf ff 00 80 00       	mov    $0x8000ff,%edi
    120d:	b8 00 00 00 00       	mov    $0x0,%eax
    1212:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
    1219:	00 00 00 
    121c:	41 ff d0             	callq  *%r8
    121f:	0f 20 d8             	mov    %cr3,%rax
    1222:	0f 22 d8             	mov    %rax,%cr3
    1225:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1229:	90                   	nop
    122a:	c9                   	leaveq 
    122b:	c3                   	retq   

000000000000122c <alloc_pages>:
    122c:	55                   	push   %rbp
    122d:	48 89 e5             	mov    %rsp,%rbp
    1230:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    1234:	89 7d 8c             	mov    %edi,-0x74(%rbp)
    1237:	89 75 88             	mov    %esi,-0x78(%rbp)
    123a:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
    123e:	48 c7 45 d0 00 00 00 	movq   $0x0,-0x30(%rbp)
    1245:	00 
    1246:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    124d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1254:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
    1258:	74 4c                	je     12a6 <alloc_pages+0x7a>
    125a:	83 7d 8c 04          	cmpl   $0x4,-0x74(%rbp)
    125e:	7f 6e                	jg     12ce <alloc_pages+0xa2>
    1260:	83 7d 8c 01          	cmpl   $0x1,-0x74(%rbp)
    1264:	74 08                	je     126e <alloc_pages+0x42>
    1266:	83 7d 8c 02          	cmpl   $0x2,-0x74(%rbp)
    126a:	74 1a                	je     1286 <alloc_pages+0x5a>
    126c:	eb 60                	jmp    12ce <alloc_pages+0xa2>
    126e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1275:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    127c:	00 00 00 
    127f:	8b 00                	mov    (%rax),%eax
    1281:	89 45 f4             	mov    %eax,-0xc(%rbp)
    1284:	eb 77                	jmp    12fd <alloc_pages+0xd1>
    1286:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    128d:	00 00 00 
    1290:	8b 00                	mov    (%rax),%eax
    1292:	89 45 f8             	mov    %eax,-0x8(%rbp)
    1295:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    129c:	00 00 00 
    129f:	8b 00                	mov    (%rax),%eax
    12a1:	89 45 f4             	mov    %eax,-0xc(%rbp)
    12a4:	eb 57                	jmp    12fd <alloc_pages+0xd1>
    12a6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    12ad:	00 00 00 
    12b0:	8b 00                	mov    (%rax),%eax
    12b2:	89 45 f8             	mov    %eax,-0x8(%rbp)
    12b5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    12bc:	00 00 00 
    12bf:	48 8b 80 c0 02 00 00 	mov    0x2c0(%rax),%rax
    12c6:	83 e8 01             	sub    $0x1,%eax
    12c9:	89 45 f4             	mov    %eax,-0xc(%rbp)
    12cc:	eb 2f                	jmp    12fd <alloc_pages+0xd1>
    12ce:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    12d5:	00 00 00 
    12d8:	be 00 00 00 00       	mov    $0x0,%esi
    12dd:	bf 00 00 ff 00       	mov    $0xff0000,%edi
    12e2:	b8 00 00 00 00       	mov    $0x0,%eax
    12e7:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
    12ee:	00 00 00 
    12f1:	ff d1                	callq  *%rcx
    12f3:	b8 00 00 00 00       	mov    $0x0,%eax
    12f8:	e9 5f 02 00 00       	jmpq   155c <alloc_pages+0x330>
    12fd:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1300:	89 45 fc             	mov    %eax,-0x4(%rbp)
    1303:	e9 1b 02 00 00       	jmpq   1523 <alloc_pages+0x2f7>
    1308:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    130f:	00 00 00 
    1312:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
    1319:	8b 45 fc             	mov    -0x4(%rbp),%eax
    131c:	48 63 d0             	movslq %eax,%rdx
    131f:	48 89 d0             	mov    %rdx,%rax
    1322:	48 c1 e0 02          	shl    $0x2,%rax
    1326:	48 01 d0             	add    %rdx,%rax
    1329:	48 c1 e0 04          	shl    $0x4,%rax
    132d:	48 01 c8             	add    %rcx,%rax
    1330:	48 8b 50 40          	mov    0x40(%rax),%rdx
    1334:	8b 45 88             	mov    -0x78(%rbp),%eax
    1337:	48 98                	cltq   
    1339:	48 39 c2             	cmp    %rax,%rdx
    133c:	0f 82 dc 01 00 00    	jb     151e <alloc_pages+0x2f2>
    1342:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1349:	00 00 00 
    134c:	48 8b 88 b8 02 00 00 	mov    0x2b8(%rax),%rcx
    1353:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1356:	48 63 d0             	movslq %eax,%rdx
    1359:	48 89 d0             	mov    %rdx,%rax
    135c:	48 c1 e0 02          	shl    $0x2,%rax
    1360:	48 01 d0             	add    %rdx,%rax
    1363:	48 c1 e0 04          	shl    $0x4,%rax
    1367:	48 01 c8             	add    %rcx,%rax
    136a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    136e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1372:	48 8b 40 10          	mov    0x10(%rax),%rax
    1376:	48 c1 e8 15          	shr    $0x15,%rax
    137a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    137e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1382:	48 8b 40 18          	mov    0x18(%rax),%rax
    1386:	48 c1 e8 15          	shr    $0x15,%rax
    138a:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    138e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    1392:	48 8b 40 20          	mov    0x20(%rax),%rax
    1396:	48 c1 e8 15          	shr    $0x15,%rax
    139a:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    139e:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    13a2:	83 e0 3f             	and    $0x3f,%eax
    13a5:	48 89 c2             	mov    %rax,%rdx
    13a8:	b8 40 00 00 00       	mov    $0x40,%eax
    13ad:	48 29 d0             	sub    %rdx,%rax
    13b0:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
    13b4:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    13b8:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    13bc:	e9 4d 01 00 00       	jmpq   150e <alloc_pages+0x2e2>
    13c1:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    13c8:	00 00 00 
    13cb:	48 8b 90 88 02 00 00 	mov    0x288(%rax),%rdx
    13d2:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13d6:	48 c1 e8 06          	shr    $0x6,%rax
    13da:	48 c1 e0 03          	shl    $0x3,%rax
    13de:	48 01 d0             	add    %rdx,%rax
    13e1:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
    13e5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    13e9:	83 e0 3f             	and    $0x3f,%eax
    13ec:	48 89 45 98          	mov    %rax,-0x68(%rbp)
    13f0:	48 8b 45 98          	mov    -0x68(%rbp),%rax
    13f4:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13f8:	e9 e3 00 00 00       	jmpq   14e0 <alloc_pages+0x2b4>
    13fd:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1401:	48 8b 00             	mov    (%rax),%rax
    1404:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
    1408:	89 d1                	mov    %edx,%ecx
    140a:	48 d3 e8             	shr    %cl,%rax
    140d:	48 89 c6             	mov    %rax,%rsi
    1410:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
    1414:	48 83 c0 08          	add    $0x8,%rax
    1418:	48 8b 10             	mov    (%rax),%rdx
    141b:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    141f:	89 c1                	mov    %eax,%ecx
    1421:	b8 40 00 00 00       	mov    $0x40,%eax
    1426:	29 c8                	sub    %ecx,%eax
    1428:	89 c1                	mov    %eax,%ecx
    142a:	48 d3 e2             	shl    %cl,%rdx
    142d:	48 89 d0             	mov    %rdx,%rax
    1430:	48 09 c6             	or     %rax,%rsi
    1433:	48 89 f2             	mov    %rsi,%rdx
    1436:	83 7d 88 40          	cmpl   $0x40,-0x78(%rbp)
    143a:	74 16                	je     1452 <alloc_pages+0x226>
    143c:	8b 45 88             	mov    -0x78(%rbp),%eax
    143f:	be 01 00 00 00       	mov    $0x1,%esi
    1444:	89 c1                	mov    %eax,%ecx
    1446:	48 d3 e6             	shl    %cl,%rsi
    1449:	48 89 f0             	mov    %rsi,%rax
    144c:	48 83 e8 01          	sub    $0x1,%rax
    1450:	eb 07                	jmp    1459 <alloc_pages+0x22d>
    1452:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1459:	48 21 d0             	and    %rdx,%rax
    145c:	48 85 c0             	test   %rax,%rax
    145f:	75 7a                	jne    14db <alloc_pages+0x2af>
    1461:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1465:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1469:	48 01 d0             	add    %rdx,%rax
    146c:	48 83 e8 01          	sub    $0x1,%rax
    1470:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1474:	48 c7 45 d8 00 00 00 	movq   $0x0,-0x28(%rbp)
    147b:	00 
    147c:	eb 50                	jmp    14ce <alloc_pages+0x2a2>
    147e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1485:	00 00 00 
    1488:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    148f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    1493:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1497:	48 01 c2             	add    %rax,%rdx
    149a:	48 89 d0             	mov    %rdx,%rax
    149d:	48 c1 e0 02          	shl    $0x2,%rax
    14a1:	48 01 d0             	add    %rdx,%rax
    14a4:	48 c1 e0 03          	shl    $0x3,%rax
    14a8:	48 01 c8             	add    %rcx,%rax
    14ab:	48 89 45 90          	mov    %rax,-0x70(%rbp)
    14af:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
    14b3:	48 8b 45 90          	mov    -0x70(%rbp),%rax
    14b7:	48 89 d6             	mov    %rdx,%rsi
    14ba:	48 89 c7             	mov    %rax,%rdi
    14bd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    14c4:	00 00 00 
    14c7:	ff d0                	callq  *%rax
    14c9:	48 83 45 d8 01       	addq   $0x1,-0x28(%rbp)
    14ce:	8b 45 88             	mov    -0x78(%rbp),%eax
    14d1:	48 98                	cltq   
    14d3:	48 39 45 d8          	cmp    %rax,-0x28(%rbp)
    14d7:	72 a5                	jb     147e <alloc_pages+0x252>
    14d9:	eb 5b                	jmp    1536 <alloc_pages+0x30a>
    14db:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
    14e0:	b8 40 00 00 00       	mov    $0x40,%eax
    14e5:	48 2b 45 98          	sub    -0x68(%rbp),%rax
    14e9:	48 39 45 e0          	cmp    %rax,-0x20(%rbp)
    14ed:	0f 82 0a ff ff ff    	jb     13fd <alloc_pages+0x1d1>
    14f3:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    14f7:	83 e0 3f             	and    $0x3f,%eax
    14fa:	48 85 c0             	test   %rax,%rax
    14fd:	74 06                	je     1505 <alloc_pages+0x2d9>
    14ff:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    1503:	eb 05                	jmp    150a <alloc_pages+0x2de>
    1505:	b8 40 00 00 00       	mov    $0x40,%eax
    150a:	48 01 45 e8          	add    %rax,-0x18(%rbp)
    150e:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1512:	48 3b 45 b8          	cmp    -0x48(%rbp),%rax
    1516:	0f 86 a5 fe ff ff    	jbe    13c1 <alloc_pages+0x195>
    151c:	eb 01                	jmp    151f <alloc_pages+0x2f3>
    151e:	90                   	nop
    151f:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1523:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1526:	3b 45 f4             	cmp    -0xc(%rbp),%eax
    1529:	0f 8e d9 fd ff ff    	jle    1308 <alloc_pages+0xdc>
    152f:	b8 00 00 00 00       	mov    $0x0,%eax
    1534:	eb 26                	jmp    155c <alloc_pages+0x330>
    1536:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    153d:	00 00 00 
    1540:	48 8b 88 a0 02 00 00 	mov    0x2a0(%rax),%rcx
    1547:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
    154b:	48 89 d0             	mov    %rdx,%rax
    154e:	48 c1 e0 02          	shl    $0x2,%rax
    1552:	48 01 d0             	add    %rdx,%rax
    1555:	48 c1 e0 03          	shl    $0x3,%rax
    1559:	48 01 c8             	add    %rcx,%rax
    155c:	c9                   	leaveq 
    155d:	c3                   	retq   

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
  7f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130a8 <alloc_pages+0x38311e7c>
  85:	6c                   	insb   (%dx),%es:(%rdi)
  86:	78 09                	js     91 <.rodata+0x91>
  88:	4c                   	rex.WR
  89:	65 6e                	outsb  %gs:(%rsi),(%dx)
  8b:	67 74 68             	addr32 je f6 <.rodata+0xf6>
  8e:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130b7 <alloc_pages+0x38311e8b>
  94:	6c                   	insb   (%dx),%es:(%rdi)
  95:	78 09                	js     a0 <.rodata+0xa0>
  97:	54                   	push   %rsp
  98:	79 70                	jns    10a <.rodata+0x10a>
  9a:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # 303130c4 <alloc_pages+0x30311e98>
  a1:	78 0a                	js     ad <.rodata+0xad>
  a3:	00 00                	add    %al,(%rax)
  a5:	00 00                	add    %al,(%rax)
  a7:	00 4f 53             	add    %cl,0x53(%rdi)
  aa:	20 43 61             	and    %al,0x61(%rbx)
  ad:	6e                   	outsb  %ds:(%rsi),(%dx)
  ae:	20 55 73             	and    %dl,0x73(%rbp)
  b1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
  b7:	61                   	(bad)  
  b8:	6c                   	insb   (%dx),%es:(%rdi)
  b9:	20 52 41             	and    %dl,0x41(%rdx)
  bc:	4d 3a 25 23 30 31 38 	rex.WRB cmp 0x38313023(%rip),%r12b        # 383130e6 <alloc_pages+0x38311eba>
  c3:	6c                   	insb   (%dx),%es:(%rdi)
  c4:	78 0a                	js     d0 <.rodata+0xd0>
  c6:	00 00                	add    %al,(%rax)
  c8:	4f 53                	rex.WRXB push %r11
  ca:	20 43 61             	and    %al,0x61(%rbx)
  cd:	6e                   	outsb  %ds:(%rsi),(%dx)
  ce:	20 55 73             	and    %dl,0x73(%rbp)
  d1:	65 64 20 54 6f 74    	gs and %dl,%fs:0x74(%rdi,%rbp,2)
  d7:	61                   	(bad)  
  d8:	6c                   	insb   (%dx),%es:(%rdi)
  d9:	20 32                	and    %dh,(%rdx)
  db:	4d 20 50 41          	rex.WRB and %r10b,0x41(%r8)
  df:	47                   	rex.RXB
  e0:	45 73 3a             	rex.RB jae 11d <.rodata+0x11d>
  e3:	25 23 30 31 30       	and    $0x30313023,%eax
  e8:	78 3d                	js     127 <.rodata+0x127>
  ea:	25 30 31 30 64       	and    $0x64303130,%eax
  ef:	0a 00                	or     (%rax),%al
  f1:	00 00                	add    %al,(%rax)
  f3:	00 00                	add    %al,(%rax)
  f5:	00 00                	add    %al,(%rax)
  f7:	00 62 69             	add    %ah,0x69(%rdx)
  fa:	74 73                	je     16f <.rodata+0x16f>
  fc:	5f                   	pop    %rdi
  fd:	6d                   	insl   (%dx),%es:(%rdi)
  fe:	61                   	(bad)  
  ff:	70 3a                	jo     13b <.rodata+0x13b>
 101:	25 23 30 31 38       	and    $0x38313023,%eax
 106:	6c                   	insb   (%dx),%es:(%rdi)
 107:	78 2c                	js     135 <.rodata+0x135>
 109:	62                   	(bad)  
 10a:	69 74 73 5f 73 69 7a 	imul   $0x657a6973,0x5f(%rbx,%rsi,2),%esi
 111:	65 
 112:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831313b <alloc_pages+0x38311f0f>
 118:	6c                   	insb   (%dx),%es:(%rdi)
 119:	78 2c                	js     147 <.rodata+0x147>
 11b:	62                   	(bad)  
 11c:	69 74 73 5f 6c 65 6e 	imul   $0x676e656c,0x5f(%rbx,%rsi,2),%esi
 123:	67 
 124:	74 68                	je     18e <.rodata+0x18e>
 126:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831314f <alloc_pages+0x38311f23>
 12c:	6c                   	insb   (%dx),%es:(%rdi)
 12d:	78 0a                	js     139 <.rodata+0x139>
 12f:	00 70 61             	add    %dh,0x61(%rax)
 132:	67 65 73 5f          	addr32 gs jae 195 <.rodata+0x195>
 136:	73 74                	jae    1ac <.rodata+0x1ac>
 138:	72 75                	jb     1af <.rodata+0x1af>
 13a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 13e:	23 30                	and    (%rax),%esi
 140:	31 38                	xor    %edi,(%rax)
 142:	6c                   	insb   (%dx),%es:(%rdi)
 143:	78 2c                	js     171 <.rodata+0x171>
 145:	70 61                	jo     1a8 <.rodata+0x1a8>
 147:	67 65 73 5f          	addr32 gs jae 1aa <.rodata+0x1aa>
 14b:	73 69                	jae    1b6 <.rodata+0x1b6>
 14d:	7a 65                	jp     1b4 <.rodata+0x1b4>
 14f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313178 <alloc_pages+0x38311f4c>
 155:	6c                   	insb   (%dx),%es:(%rdi)
 156:	78 2c                	js     184 <.rodata+0x184>
 158:	70 61                	jo     1bb <.rodata+0x1bb>
 15a:	67 65 73 5f          	addr32 gs jae 1bd <.rodata+0x1bd>
 15e:	6c                   	insb   (%dx),%es:(%rdi)
 15f:	65 6e                	outsb  %gs:(%rsi),(%dx)
 161:	67 74 68             	addr32 je 1cc <.rodata+0x1cc>
 164:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831318d <alloc_pages+0x38311f61>
 16a:	6c                   	insb   (%dx),%es:(%rdi)
 16b:	78 0a                	js     177 <.rodata+0x177>
 16d:	00 00                	add    %al,(%rax)
 16f:	00 7a 6f             	add    %bh,0x6f(%rdx)
 172:	6e                   	outsb  %ds:(%rsi),(%dx)
 173:	65 73 5f             	gs jae 1d5 <.rodata+0x1d5>
 176:	73 74                	jae    1ec <.rodata+0x1ec>
 178:	72 75                	jb     1ef <.rodata+0x1ef>
 17a:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 17e:	23 30                	and    (%rax),%esi
 180:	31 38                	xor    %edi,(%rax)
 182:	6c                   	insb   (%dx),%es:(%rdi)
 183:	78 2c                	js     1b1 <.rodata+0x1b1>
 185:	7a 6f                	jp     1f6 <.rodata+0x1f6>
 187:	6e                   	outsb  %ds:(%rsi),(%dx)
 188:	65 73 5f             	gs jae 1ea <.rodata+0x1ea>
 18b:	73 69                	jae    1f6 <.rodata+0x1f6>
 18d:	7a 65                	jp     1f4 <.rodata+0x1f4>
 18f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131b8 <alloc_pages+0x38311f8c>
 195:	6c                   	insb   (%dx),%es:(%rdi)
 196:	78 2c                	js     1c4 <.rodata+0x1c4>
 198:	7a 6f                	jp     209 <.rodata+0x209>
 19a:	6e                   	outsb  %ds:(%rsi),(%dx)
 19b:	65 73 5f             	gs jae 1fd <.rodata+0x1fd>
 19e:	6c                   	insb   (%dx),%es:(%rdi)
 19f:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1a1:	67 74 68             	addr32 je 20c <.rodata+0x20c>
 1a4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131cd <alloc_pages+0x38311fa1>
 1aa:	6c                   	insb   (%dx),%es:(%rdi)
 1ab:	78 0a                	js     1b7 <.rodata+0x1b7>
 1ad:	00 00                	add    %al,(%rax)
 1af:	00 7a 6f             	add    %bh,0x6f(%rdx)
 1b2:	6e                   	outsb  %ds:(%rsi),(%dx)
 1b3:	65 5f                	gs pop %rdi
 1b5:	73 74                	jae    22b <.rodata+0x22b>
 1b7:	61                   	(bad)  
 1b8:	72 74                	jb     22e <.rodata+0x22e>
 1ba:	5f                   	pop    %rdi
 1bb:	61                   	(bad)  
 1bc:	64 64 72 65          	fs fs jb 225 <.rodata+0x225>
 1c0:	73 73                	jae    235 <.rodata+0x235>
 1c2:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131eb <alloc_pages+0x38311fbf>
 1c8:	6c                   	insb   (%dx),%es:(%rdi)
 1c9:	78 2c                	js     1f7 <.rodata+0x1f7>
 1cb:	7a 6f                	jp     23c <.rodata+0x23c>
 1cd:	6e                   	outsb  %ds:(%rsi),(%dx)
 1ce:	65 5f                	gs pop %rdi
 1d0:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1d2:	64 5f                	fs pop %rdi
 1d4:	61                   	(bad)  
 1d5:	64 64 72 65          	fs fs jb 23e <.rodata+0x23e>
 1d9:	73 73                	jae    24e <.rodata+0x24e>
 1db:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313204 <alloc_pages+0x38311fd8>
 1e1:	6c                   	insb   (%dx),%es:(%rdi)
 1e2:	78 2c                	js     210 <.rodata+0x210>
 1e4:	7a 6f                	jp     255 <.rodata+0x255>
 1e6:	6e                   	outsb  %ds:(%rsi),(%dx)
 1e7:	65 5f                	gs pop %rdi
 1e9:	6c                   	insb   (%dx),%es:(%rdi)
 1ea:	65 6e                	outsb  %gs:(%rsi),(%dx)
 1ec:	67 74 68             	addr32 je 257 <.rodata+0x257>
 1ef:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313218 <alloc_pages+0x38311fec>
 1f5:	6c                   	insb   (%dx),%es:(%rdi)
 1f6:	78 2c                	js     224 <.rodata+0x224>
 1f8:	70 61                	jo     25b <.rodata+0x25b>
 1fa:	67 65 73 5f          	addr32 gs jae 25d <.rodata+0x25d>
 1fe:	67 72 6f             	addr32 jb 270 <.rodata+0x270>
 201:	75 70                	jne    273 <.rodata+0x273>
 203:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831322c <alloc_pages+0x38312000>
 209:	6c                   	insb   (%dx),%es:(%rdi)
 20a:	78 2c                	js     238 <.rodata+0x238>
 20c:	70 61                	jo     26f <.rodata+0x26f>
 20e:	67 65 73 5f          	addr32 gs jae 271 <.rodata+0x271>
 212:	6c                   	insb   (%dx),%es:(%rdi)
 213:	65 6e                	outsb  %gs:(%rsi),(%dx)
 215:	67 74 68             	addr32 je 280 <.rodata+0x280>
 218:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313241 <alloc_pages+0x38312015>
 21e:	6c                   	insb   (%dx),%es:(%rdi)
 21f:	78 0a                	js     22b <.rodata+0x22b>
 221:	00 00                	add    %al,(%rax)
 223:	00 00                	add    %al,(%rax)
 225:	00 00                	add    %al,(%rax)
 227:	00 73 74             	add    %dh,0x74(%rbx)
 22a:	61                   	(bad)  
 22b:	72 74                	jb     2a1 <.rodata+0x2a1>
 22d:	5f                   	pop    %rdi
 22e:	63 6f 64             	movsxd 0x64(%rdi),%ebp
 231:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # 3831325b <alloc_pages+0x3831202f>
 238:	6c                   	insb   (%dx),%es:(%rdi)
 239:	78 2c                	js     267 <.rodata+0x267>
 23b:	65 6e                	outsb  %gs:(%rsi),(%dx)
 23d:	64 5f                	fs pop %rdi
 23f:	63 6f 64             	movsxd 0x64(%rdi),%ebp
 242:	65 3a 25 23 30 31 38 	cmp    %gs:0x38313023(%rip),%ah        # 3831326c <alloc_pages+0x38312040>
 249:	6c                   	insb   (%dx),%es:(%rdi)
 24a:	78 2c                	js     278 <.rodata+0x278>
 24c:	65 6e                	outsb  %gs:(%rsi),(%dx)
 24e:	64 5f                	fs pop %rdi
 250:	64 61                	fs (bad) 
 252:	74 61                	je     2b5 <.rodata+0x2b5>
 254:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831327d <alloc_pages+0x38312051>
 25a:	6c                   	insb   (%dx),%es:(%rdi)
 25b:	78 2c                	js     289 <.rodata+0x289>
 25d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 25f:	64 5f                	fs pop %rdi
 261:	62 72                	(bad)  
 263:	6b 3a 25             	imul   $0x25,(%rdx),%edi
 266:	23 30                	and    (%rax),%esi
 268:	31 38                	xor    %edi,(%rax)
 26a:	6c                   	insb   (%dx),%es:(%rdi)
 26b:	78 2c                	js     299 <.rodata+0x299>
 26d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 26f:	64 5f                	fs pop %rdi
 271:	6f                   	outsl  %ds:(%rsi),(%dx)
 272:	66 5f                	pop    %di
 274:	73 74                	jae    2ea <.rodata+0x2ea>
 276:	72 75                	jb     2ed <page_clean+0x7a>
 278:	63 74 3a 25          	movsxd 0x25(%rdx,%rdi,1),%esi
 27c:	23 30                	and    (%rax),%esi
 27e:	31 38                	xor    %edi,(%rax)
 280:	6c                   	insb   (%dx),%es:(%rdi)
 281:	78 0a                	js     28d <.rodata+0x28d>
 283:	00 47 6c             	add    %al,0x6c(%rdi)
 286:	6f                   	outsl  %ds:(%rsi),(%dx)
 287:	62 61 6c 5f 43       	(bad)
 28c:	52                   	push   %rdx
 28d:	33 09                	xor    (%rcx),%ecx
 28f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132b8 <alloc_pages+0x3831208c>
 295:	6c                   	insb   (%dx),%es:(%rdi)
 296:	78 0a                	js     2a2 <.rodata+0x2a2>
 298:	00 2a                	add    %ch,(%rdx)
 29a:	47 6c                	rex.RXB insb (%dx),%es:(%rdi)
 29c:	6f                   	outsl  %ds:(%rsi),(%dx)
 29d:	62 61 6c 5f 43       	(bad)
 2a2:	52                   	push   %rdx
 2a3:	33 09                	xor    (%rcx),%ecx
 2a5:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132ce <alloc_pages+0x383120a2>
 2ab:	6c                   	insb   (%dx),%es:(%rdi)
 2ac:	78 0a                	js     2b8 <.rodata+0x2b8>
 2ae:	00 2a                	add    %ch,(%rdx)
 2b0:	2a 47 6c             	sub    0x6c(%rdi),%al
 2b3:	6f                   	outsl  %ds:(%rsi),(%dx)
 2b4:	62 61 6c 5f 43       	(bad)
 2b9:	52                   	push   %rdx
 2ba:	33 09                	xor    (%rcx),%ecx
 2bc:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132e5 <alloc_pages+0x383120b9>
 2c2:	6c                   	insb   (%dx),%es:(%rdi)
 2c3:	78 0a                	js     2cf <.rodata+0x2cf>
 2c5:	00 00                	add    %al,(%rax)
 2c7:	00 61 6c             	add    %ah,0x6c(%rcx)
 2ca:	6c                   	insb   (%dx),%es:(%rdi)
 2cb:	6f                   	outsl  %ds:(%rsi),(%dx)
 2cc:	63 5f 70             	movsxd 0x70(%rdi),%ebx
 2cf:	61                   	(bad)  
 2d0:	67 65 73 20          	addr32 gs jae 2f4 <page_clean+0x81>
 2d4:	65 72 72             	gs jb  349 <page_clean+0xd6>
 2d7:	6f                   	outsl  %ds:(%rsi),(%dx)
 2d8:	72 20                	jb     2fa <page_clean+0x87>
 2da:	7a 6f                	jp     34b <page_clean+0xd8>
 2dc:	6e                   	outsb  %ds:(%rsi),(%dx)
 2dd:	65 5f                	gs pop %rdi
 2df:	73 65                	jae    346 <page_clean+0xd3>
 2e1:	6c                   	insb   (%dx),%es:(%rdi)
 2e2:	65 63 74 20 69       	movsxd %gs:0x69(%rax,%riz,1),%esi
 2e7:	6e                   	outsb  %ds:(%rsi),(%dx)
 2e8:	64 65 78 0a          	fs gs js 2f6 <page_clean+0x83>
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
  a3:	00 37                	add    %dh,(%rdi)
  a5:	0e                   	(bad)  
  a6:	00 00                	add    %al,(%rax)
  a8:	00 41 0e             	add    %al,0xe(%rcx)
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	03 32                	add    (%rdx),%esi
  b3:	0e                   	(bad)  
  b4:	0c 07                	or     $0x7,%al
  b6:	08 00                	or     %al,(%rax)
  b8:	1c 00                	sbb    $0x0,%al
  ba:	00 00                	add    %al,(%rax)
  bc:	bc 00 00 00 00       	mov    $0x0,%esp
  c1:	00 00                	add    %al,(%rax)
  c3:	00 32                	add    %dh,(%rdx)
  c5:	03 00                	add    (%rax),%eax
  c7:	00 00                	add    %al,(%rax)
  c9:	41 0e                	rex.B (bad) 
  cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  d1:	03 2d 03 0c 07 08    	add    0x8070c03(%rip),%ebp        # 8070cda <alloc_pages+0x806faae>
	...
