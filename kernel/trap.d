
trap.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <set_intr_gate>:
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	89 7d ec             	mov    %edi,-0x14(%rbp)
       7:	89 f0                	mov    %esi,%eax
       9:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
       d:	88 45 e8             	mov    %al,-0x18(%rbp)
      10:	8b 45 ec             	mov    -0x14(%rbp),%eax
      13:	48 c1 e0 04          	shl    $0x4,%rax
      17:	48 89 c2             	mov    %rax,%rdx
      1a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      21:	00 00 00 
      24:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
      28:	8b 45 ec             	mov    -0x14(%rbp),%eax
      2b:	48 c1 e0 04          	shl    $0x4,%rax
      2f:	48 8d 50 08          	lea    0x8(%rax),%rdx
      33:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      3a:	00 00 00 
      3d:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
      41:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      45:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
      4b:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
      4f:	48 89 c2             	mov    %rax,%rdx
      52:	44 89 c0             	mov    %r8d,%eax
      55:	66 89 d0             	mov    %dx,%ax
      58:	48 83 e1 07          	and    $0x7,%rcx
      5c:	48 81 c1 00 8e 00 00 	add    $0x8e00,%rcx
      63:	48 c1 e1 20          	shl    $0x20,%rcx
      67:	48 01 c8             	add    %rcx,%rax
      6a:	48 31 c9             	xor    %rcx,%rcx
      6d:	89 d1                	mov    %edx,%ecx
      6f:	48 c1 e9 10          	shr    $0x10,%rcx
      73:	48 c1 e1 30          	shl    $0x30,%rcx
      77:	48 01 c8             	add    %rcx,%rax
      7a:	48 89 06             	mov    %rax,(%rsi)
      7d:	48 c1 ea 20          	shr    $0x20,%rdx
      81:	48 89 17             	mov    %rdx,(%rdi)
      84:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
      88:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
      8c:	90                   	nop
      8d:	5d                   	pop    %rbp
      8e:	c3                   	retq   

000000000000008f <set_trap_gate>:
      8f:	55                   	push   %rbp
      90:	48 89 e5             	mov    %rsp,%rbp
      93:	89 7d ec             	mov    %edi,-0x14(%rbp)
      96:	89 f0                	mov    %esi,%eax
      98:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
      9c:	88 45 e8             	mov    %al,-0x18(%rbp)
      9f:	8b 45 ec             	mov    -0x14(%rbp),%eax
      a2:	48 c1 e0 04          	shl    $0x4,%rax
      a6:	48 89 c2             	mov    %rax,%rdx
      a9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      b0:	00 00 00 
      b3:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
      b7:	8b 45 ec             	mov    -0x14(%rbp),%eax
      ba:	48 c1 e0 04          	shl    $0x4,%rax
      be:	48 8d 50 08          	lea    0x8(%rax),%rdx
      c2:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      c9:	00 00 00 
      cc:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
      d0:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
      d4:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
      da:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
      de:	48 89 c2             	mov    %rax,%rdx
      e1:	44 89 c0             	mov    %r8d,%eax
      e4:	66 89 d0             	mov    %dx,%ax
      e7:	48 83 e1 07          	and    $0x7,%rcx
      eb:	48 81 c1 00 8f 00 00 	add    $0x8f00,%rcx
      f2:	48 c1 e1 20          	shl    $0x20,%rcx
      f6:	48 01 c8             	add    %rcx,%rax
      f9:	48 31 c9             	xor    %rcx,%rcx
      fc:	89 d1                	mov    %edx,%ecx
      fe:	48 c1 e9 10          	shr    $0x10,%rcx
     102:	48 c1 e1 30          	shl    $0x30,%rcx
     106:	48 01 c8             	add    %rcx,%rax
     109:	48 89 06             	mov    %rax,(%rsi)
     10c:	48 c1 ea 20          	shr    $0x20,%rdx
     110:	48 89 17             	mov    %rdx,(%rdi)
     113:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     117:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
     11b:	90                   	nop
     11c:	5d                   	pop    %rbp
     11d:	c3                   	retq   

000000000000011e <set_system_gate>:
     11e:	55                   	push   %rbp
     11f:	48 89 e5             	mov    %rsp,%rbp
     122:	89 7d ec             	mov    %edi,-0x14(%rbp)
     125:	89 f0                	mov    %esi,%eax
     127:	48 89 55 e0          	mov    %rdx,-0x20(%rbp)
     12b:	88 45 e8             	mov    %al,-0x18(%rbp)
     12e:	8b 45 ec             	mov    -0x14(%rbp),%eax
     131:	48 c1 e0 04          	shl    $0x4,%rax
     135:	48 89 c2             	mov    %rax,%rdx
     138:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     13f:	00 00 00 
     142:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
     146:	8b 45 ec             	mov    -0x14(%rbp),%eax
     149:	48 c1 e0 04          	shl    $0x4,%rax
     14d:	48 8d 50 08          	lea    0x8(%rax),%rdx
     151:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     158:	00 00 00 
     15b:	48 8d 3c 02          	lea    (%rdx,%rax,1),%rdi
     15f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     163:	41 b8 00 00 08 00    	mov    $0x80000,%r8d
     169:	0f b6 4d e8          	movzbl -0x18(%rbp),%ecx
     16d:	48 89 c2             	mov    %rax,%rdx
     170:	44 89 c0             	mov    %r8d,%eax
     173:	66 89 d0             	mov    %dx,%ax
     176:	48 83 e1 07          	and    $0x7,%rcx
     17a:	48 81 c1 00 ef 00 00 	add    $0xef00,%rcx
     181:	48 c1 e1 20          	shl    $0x20,%rcx
     185:	48 01 c8             	add    %rcx,%rax
     188:	48 31 c9             	xor    %rcx,%rcx
     18b:	89 d1                	mov    %edx,%ecx
     18d:	48 c1 e9 10          	shr    $0x10,%rcx
     191:	48 c1 e1 30          	shl    $0x30,%rcx
     195:	48 01 c8             	add    %rcx,%rax
     198:	48 89 06             	mov    %rax,(%rsi)
     19b:	48 c1 ea 20          	shr    $0x20,%rdx
     19f:	48 89 17             	mov    %rdx,(%rdi)
     1a2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     1a6:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
     1aa:	90                   	nop
     1ab:	5d                   	pop    %rbp
     1ac:	c3                   	retq   

00000000000001ad <set_tss64>:
     1ad:	55                   	push   %rbp
     1ae:	48 89 e5             	mov    %rsp,%rbp
     1b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     1b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     1b9:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
     1bd:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
     1c1:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
     1c5:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
     1c9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     1d0:	00 00 00 
     1d3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     1d7:	48 89 02             	mov    %rax,(%rdx)
     1da:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     1e1:	00 00 00 
     1e4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     1e8:	48 89 02             	mov    %rax,(%rdx)
     1eb:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     1f2:	00 00 00 
     1f5:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     1f9:	48 89 02             	mov    %rax,(%rdx)
     1fc:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     203:	00 00 00 
     206:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     20a:	48 89 02             	mov    %rax,(%rdx)
     20d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     214:	00 00 00 
     217:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
     21b:	48 89 02             	mov    %rax,(%rdx)
     21e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     225:	00 00 00 
     228:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     22c:	48 89 02             	mov    %rax,(%rdx)
     22f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     236:	00 00 00 
     239:	48 8b 45 10          	mov    0x10(%rbp),%rax
     23d:	48 89 02             	mov    %rax,(%rdx)
     240:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     247:	00 00 00 
     24a:	48 8b 45 18          	mov    0x18(%rbp),%rax
     24e:	48 89 02             	mov    %rax,(%rdx)
     251:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     258:	00 00 00 
     25b:	48 8b 45 20          	mov    0x20(%rbp),%rax
     25f:	48 89 02             	mov    %rax,(%rdx)
     262:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     269:	00 00 00 
     26c:	48 8b 45 28          	mov    0x28(%rbp),%rax
     270:	48 89 02             	mov    %rax,(%rdx)
     273:	90                   	nop
     274:	5d                   	pop    %rbp
     275:	c3                   	retq   

0000000000000276 <do_divide_error>:
     276:	55                   	push   %rbp
     277:	48 89 e5             	mov    %rsp,%rbp
     27a:	48 83 ec 10          	sub    $0x10,%rsp
     27e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     282:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     286:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     28a:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     291:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     295:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     29c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     2a0:	49 89 c9             	mov    %rcx,%r9
     2a3:	49 89 d0             	mov    %rdx,%r8
     2a6:	48 89 c1             	mov    %rax,%rcx
     2a9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     2b0:	00 00 00 
     2b3:	be 00 00 00 00       	mov    $0x0,%esi
     2b8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     2bd:	b8 00 00 00 00       	mov    $0x0,%eax
     2c2:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     2c9:	00 00 00 
     2cc:	41 ff d2             	callq  *%r10
     2cf:	eb fe                	jmp    2cf <do_divide_error+0x59>

00000000000002d1 <do_debug>:
     2d1:	55                   	push   %rbp
     2d2:	48 89 e5             	mov    %rsp,%rbp
     2d5:	48 83 ec 10          	sub    $0x10,%rsp
     2d9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     2dd:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     2e1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2e5:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     2ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     2f0:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     2f7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     2fb:	49 89 c9             	mov    %rcx,%r9
     2fe:	49 89 d0             	mov    %rdx,%r8
     301:	48 89 c1             	mov    %rax,%rcx
     304:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     30b:	00 00 00 
     30e:	be 00 00 00 00       	mov    $0x0,%esi
     313:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     318:	b8 00 00 00 00       	mov    $0x0,%eax
     31d:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     324:	00 00 00 
     327:	41 ff d2             	callq  *%r10
     32a:	eb fe                	jmp    32a <do_debug+0x59>

000000000000032c <do_nmi>:
     32c:	55                   	push   %rbp
     32d:	48 89 e5             	mov    %rsp,%rbp
     330:	48 83 ec 10          	sub    $0x10,%rsp
     334:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     338:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     33c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     340:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     347:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     34b:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     352:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     356:	49 89 c9             	mov    %rcx,%r9
     359:	49 89 d0             	mov    %rdx,%r8
     35c:	48 89 c1             	mov    %rax,%rcx
     35f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     366:	00 00 00 
     369:	be 00 00 00 00       	mov    $0x0,%esi
     36e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     373:	b8 00 00 00 00       	mov    $0x0,%eax
     378:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     37f:	00 00 00 
     382:	41 ff d2             	callq  *%r10
     385:	eb fe                	jmp    385 <do_nmi+0x59>

0000000000000387 <do_int3>:
     387:	55                   	push   %rbp
     388:	48 89 e5             	mov    %rsp,%rbp
     38b:	48 83 ec 10          	sub    $0x10,%rsp
     38f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     393:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     397:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     39b:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     3a2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3a6:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     3ad:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     3b1:	49 89 c9             	mov    %rcx,%r9
     3b4:	49 89 d0             	mov    %rdx,%r8
     3b7:	48 89 c1             	mov    %rax,%rcx
     3ba:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     3c1:	00 00 00 
     3c4:	be 00 00 00 00       	mov    $0x0,%esi
     3c9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     3ce:	b8 00 00 00 00       	mov    $0x0,%eax
     3d3:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     3da:	00 00 00 
     3dd:	41 ff d2             	callq  *%r10
     3e0:	eb fe                	jmp    3e0 <do_int3+0x59>

00000000000003e2 <do_overflow>:
     3e2:	55                   	push   %rbp
     3e3:	48 89 e5             	mov    %rsp,%rbp
     3e6:	48 83 ec 10          	sub    $0x10,%rsp
     3ea:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     3ee:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     3f2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     3f6:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     3fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     401:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     408:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     40c:	49 89 c9             	mov    %rcx,%r9
     40f:	49 89 d0             	mov    %rdx,%r8
     412:	48 89 c1             	mov    %rax,%rcx
     415:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     41c:	00 00 00 
     41f:	be 00 00 00 00       	mov    $0x0,%esi
     424:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     429:	b8 00 00 00 00       	mov    $0x0,%eax
     42e:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     435:	00 00 00 
     438:	41 ff d2             	callq  *%r10
     43b:	eb fe                	jmp    43b <do_overflow+0x59>

000000000000043d <do_bounds>:
     43d:	55                   	push   %rbp
     43e:	48 89 e5             	mov    %rsp,%rbp
     441:	48 83 ec 10          	sub    $0x10,%rsp
     445:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     449:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     44d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     451:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     458:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     45c:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     463:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     467:	49 89 c9             	mov    %rcx,%r9
     46a:	49 89 d0             	mov    %rdx,%r8
     46d:	48 89 c1             	mov    %rax,%rcx
     470:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     477:	00 00 00 
     47a:	be 00 00 00 00       	mov    $0x0,%esi
     47f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     484:	b8 00 00 00 00       	mov    $0x0,%eax
     489:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     490:	00 00 00 
     493:	41 ff d2             	callq  *%r10
     496:	eb fe                	jmp    496 <do_bounds+0x59>

0000000000000498 <do_undefined_opcode>:
     498:	55                   	push   %rbp
     499:	48 89 e5             	mov    %rsp,%rbp
     49c:	48 83 ec 10          	sub    $0x10,%rsp
     4a0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     4a4:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     4a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     4ac:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     4b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     4b7:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     4be:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     4c2:	49 89 c9             	mov    %rcx,%r9
     4c5:	49 89 d0             	mov    %rdx,%r8
     4c8:	48 89 c1             	mov    %rax,%rcx
     4cb:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     4d2:	00 00 00 
     4d5:	be 00 00 00 00       	mov    $0x0,%esi
     4da:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     4df:	b8 00 00 00 00       	mov    $0x0,%eax
     4e4:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     4eb:	00 00 00 
     4ee:	41 ff d2             	callq  *%r10
     4f1:	eb fe                	jmp    4f1 <do_undefined_opcode+0x59>

00000000000004f3 <do_dev_not_available>:
     4f3:	55                   	push   %rbp
     4f4:	48 89 e5             	mov    %rsp,%rbp
     4f7:	48 83 ec 10          	sub    $0x10,%rsp
     4fb:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     4ff:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     503:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     507:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     50e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     512:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     519:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     51d:	49 89 c9             	mov    %rcx,%r9
     520:	49 89 d0             	mov    %rdx,%r8
     523:	48 89 c1             	mov    %rax,%rcx
     526:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     52d:	00 00 00 
     530:	be 00 00 00 00       	mov    $0x0,%esi
     535:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     53a:	b8 00 00 00 00       	mov    $0x0,%eax
     53f:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     546:	00 00 00 
     549:	41 ff d2             	callq  *%r10
     54c:	eb fe                	jmp    54c <do_dev_not_available+0x59>

000000000000054e <do_double_fault>:
     54e:	55                   	push   %rbp
     54f:	48 89 e5             	mov    %rsp,%rbp
     552:	48 83 ec 10          	sub    $0x10,%rsp
     556:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     55a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     55e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     562:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     569:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     56d:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     574:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     578:	49 89 c9             	mov    %rcx,%r9
     57b:	49 89 d0             	mov    %rdx,%r8
     57e:	48 89 c1             	mov    %rax,%rcx
     581:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     588:	00 00 00 
     58b:	be 00 00 00 00       	mov    $0x0,%esi
     590:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     595:	b8 00 00 00 00       	mov    $0x0,%eax
     59a:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     5a1:	00 00 00 
     5a4:	41 ff d2             	callq  *%r10
     5a7:	eb fe                	jmp    5a7 <do_double_fault+0x59>

00000000000005a9 <do_coprocessor_segment_overrun>:
     5a9:	55                   	push   %rbp
     5aa:	48 89 e5             	mov    %rsp,%rbp
     5ad:	48 83 ec 10          	sub    $0x10,%rsp
     5b1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     5b5:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     5b9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     5bd:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     5c4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     5c8:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     5cf:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     5d3:	49 89 c9             	mov    %rcx,%r9
     5d6:	49 89 d0             	mov    %rdx,%r8
     5d9:	48 89 c1             	mov    %rax,%rcx
     5dc:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     5e3:	00 00 00 
     5e6:	be 00 00 00 00       	mov    $0x0,%esi
     5eb:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     5f0:	b8 00 00 00 00       	mov    $0x0,%eax
     5f5:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     5fc:	00 00 00 
     5ff:	41 ff d2             	callq  *%r10
     602:	eb fe                	jmp    602 <do_coprocessor_segment_overrun+0x59>

0000000000000604 <do_invalid_TSS>:
     604:	55                   	push   %rbp
     605:	48 89 e5             	mov    %rsp,%rbp
     608:	48 83 ec 10          	sub    $0x10,%rsp
     60c:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     610:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     614:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     618:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     61f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     623:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     62a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     62e:	49 89 c9             	mov    %rcx,%r9
     631:	49 89 d0             	mov    %rdx,%r8
     634:	48 89 c1             	mov    %rax,%rcx
     637:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     63e:	00 00 00 
     641:	be 00 00 00 00       	mov    $0x0,%esi
     646:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     64b:	b8 00 00 00 00       	mov    $0x0,%eax
     650:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     657:	00 00 00 
     65a:	41 ff d2             	callq  *%r10
     65d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     661:	83 e0 01             	and    $0x1,%eax
     664:	48 85 c0             	test   %rax,%rax
     667:	74 25                	je     68e <do_invalid_TSS+0x8a>
     669:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     670:	00 00 00 
     673:	be 00 00 00 00       	mov    $0x0,%esi
     678:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     67d:	b8 00 00 00 00       	mov    $0x0,%eax
     682:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     689:	00 00 00 
     68c:	ff d1                	callq  *%rcx
     68e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     692:	83 e0 02             	and    $0x2,%eax
     695:	48 85 c0             	test   %rax,%rax
     698:	74 27                	je     6c1 <do_invalid_TSS+0xbd>
     69a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     6a1:	00 00 00 
     6a4:	be 00 00 00 00       	mov    $0x0,%esi
     6a9:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     6ae:	b8 00 00 00 00       	mov    $0x0,%eax
     6b3:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     6ba:	00 00 00 
     6bd:	ff d1                	callq  *%rcx
     6bf:	eb 25                	jmp    6e6 <do_invalid_TSS+0xe2>
     6c1:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     6c8:	00 00 00 
     6cb:	be 00 00 00 00       	mov    $0x0,%esi
     6d0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     6d5:	b8 00 00 00 00       	mov    $0x0,%eax
     6da:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     6e1:	00 00 00 
     6e4:	ff d1                	callq  *%rcx
     6e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     6ea:	83 e0 02             	and    $0x2,%eax
     6ed:	48 85 c0             	test   %rax,%rax
     6f0:	75 58                	jne    74a <do_invalid_TSS+0x146>
     6f2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     6f6:	83 e0 04             	and    $0x4,%eax
     6f9:	48 85 c0             	test   %rax,%rax
     6fc:	74 27                	je     725 <do_invalid_TSS+0x121>
     6fe:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     705:	00 00 00 
     708:	be 00 00 00 00       	mov    $0x0,%esi
     70d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     712:	b8 00 00 00 00       	mov    $0x0,%eax
     717:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     71e:	00 00 00 
     721:	ff d1                	callq  *%rcx
     723:	eb 25                	jmp    74a <do_invalid_TSS+0x146>
     725:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     72c:	00 00 00 
     72f:	be 00 00 00 00       	mov    $0x0,%esi
     734:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     739:	b8 00 00 00 00       	mov    $0x0,%eax
     73e:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     745:	00 00 00 
     748:	ff d1                	callq  *%rcx
     74a:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     74e:	25 f8 ff 00 00       	and    $0xfff8,%eax
     753:	48 89 c1             	mov    %rax,%rcx
     756:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     75d:	00 00 00 
     760:	be 00 00 00 00       	mov    $0x0,%esi
     765:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     76a:	b8 00 00 00 00       	mov    $0x0,%eax
     76f:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     776:	00 00 00 
     779:	41 ff d0             	callq  *%r8
     77c:	eb fe                	jmp    77c <do_invalid_TSS+0x178>

000000000000077e <do_segment_not_present>:
     77e:	55                   	push   %rbp
     77f:	48 89 e5             	mov    %rsp,%rbp
     782:	48 83 ec 10          	sub    $0x10,%rsp
     786:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     78a:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     78e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     792:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     799:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     79d:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     7a4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     7a8:	49 89 c9             	mov    %rcx,%r9
     7ab:	49 89 d0             	mov    %rdx,%r8
     7ae:	48 89 c1             	mov    %rax,%rcx
     7b1:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     7b8:	00 00 00 
     7bb:	be 00 00 00 00       	mov    $0x0,%esi
     7c0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     7c5:	b8 00 00 00 00       	mov    $0x0,%eax
     7ca:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     7d1:	00 00 00 
     7d4:	41 ff d2             	callq  *%r10
     7d7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     7db:	83 e0 01             	and    $0x1,%eax
     7de:	48 85 c0             	test   %rax,%rax
     7e1:	74 25                	je     808 <do_segment_not_present+0x8a>
     7e3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     7ea:	00 00 00 
     7ed:	be 00 00 00 00       	mov    $0x0,%esi
     7f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     7f7:	b8 00 00 00 00       	mov    $0x0,%eax
     7fc:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     803:	00 00 00 
     806:	ff d1                	callq  *%rcx
     808:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     80c:	83 e0 02             	and    $0x2,%eax
     80f:	48 85 c0             	test   %rax,%rax
     812:	74 27                	je     83b <do_segment_not_present+0xbd>
     814:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     81b:	00 00 00 
     81e:	be 00 00 00 00       	mov    $0x0,%esi
     823:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     828:	b8 00 00 00 00       	mov    $0x0,%eax
     82d:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     834:	00 00 00 
     837:	ff d1                	callq  *%rcx
     839:	eb 25                	jmp    860 <do_segment_not_present+0xe2>
     83b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     842:	00 00 00 
     845:	be 00 00 00 00       	mov    $0x0,%esi
     84a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     84f:	b8 00 00 00 00       	mov    $0x0,%eax
     854:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     85b:	00 00 00 
     85e:	ff d1                	callq  *%rcx
     860:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     864:	83 e0 02             	and    $0x2,%eax
     867:	48 85 c0             	test   %rax,%rax
     86a:	75 58                	jne    8c4 <do_segment_not_present+0x146>
     86c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     870:	83 e0 04             	and    $0x4,%eax
     873:	48 85 c0             	test   %rax,%rax
     876:	74 27                	je     89f <do_segment_not_present+0x121>
     878:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     87f:	00 00 00 
     882:	be 00 00 00 00       	mov    $0x0,%esi
     887:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     88c:	b8 00 00 00 00       	mov    $0x0,%eax
     891:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     898:	00 00 00 
     89b:	ff d1                	callq  *%rcx
     89d:	eb 25                	jmp    8c4 <do_segment_not_present+0x146>
     89f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     8a6:	00 00 00 
     8a9:	be 00 00 00 00       	mov    $0x0,%esi
     8ae:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     8b3:	b8 00 00 00 00       	mov    $0x0,%eax
     8b8:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     8bf:	00 00 00 
     8c2:	ff d1                	callq  *%rcx
     8c4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     8c8:	25 f8 ff 00 00       	and    $0xfff8,%eax
     8cd:	48 89 c1             	mov    %rax,%rcx
     8d0:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     8d7:	00 00 00 
     8da:	be 00 00 00 00       	mov    $0x0,%esi
     8df:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     8e4:	b8 00 00 00 00       	mov    $0x0,%eax
     8e9:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     8f0:	00 00 00 
     8f3:	41 ff d0             	callq  *%r8
     8f6:	eb fe                	jmp    8f6 <do_segment_not_present+0x178>

00000000000008f8 <do_stack_segment_fault>:
     8f8:	55                   	push   %rbp
     8f9:	48 89 e5             	mov    %rsp,%rbp
     8fc:	48 83 ec 10          	sub    $0x10,%rsp
     900:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     904:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     908:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     90c:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     913:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     917:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     91e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     922:	49 89 c9             	mov    %rcx,%r9
     925:	49 89 d0             	mov    %rdx,%r8
     928:	48 89 c1             	mov    %rax,%rcx
     92b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     932:	00 00 00 
     935:	be 00 00 00 00       	mov    $0x0,%esi
     93a:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     93f:	b8 00 00 00 00       	mov    $0x0,%eax
     944:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     94b:	00 00 00 
     94e:	41 ff d2             	callq  *%r10
     951:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     955:	83 e0 01             	and    $0x1,%eax
     958:	48 85 c0             	test   %rax,%rax
     95b:	74 25                	je     982 <do_stack_segment_fault+0x8a>
     95d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     964:	00 00 00 
     967:	be 00 00 00 00       	mov    $0x0,%esi
     96c:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     971:	b8 00 00 00 00       	mov    $0x0,%eax
     976:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     97d:	00 00 00 
     980:	ff d1                	callq  *%rcx
     982:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     986:	83 e0 02             	and    $0x2,%eax
     989:	48 85 c0             	test   %rax,%rax
     98c:	74 27                	je     9b5 <do_stack_segment_fault+0xbd>
     98e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     995:	00 00 00 
     998:	be 00 00 00 00       	mov    $0x0,%esi
     99d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     9a2:	b8 00 00 00 00       	mov    $0x0,%eax
     9a7:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     9ae:	00 00 00 
     9b1:	ff d1                	callq  *%rcx
     9b3:	eb 25                	jmp    9da <do_stack_segment_fault+0xe2>
     9b5:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     9bc:	00 00 00 
     9bf:	be 00 00 00 00       	mov    $0x0,%esi
     9c4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     9c9:	b8 00 00 00 00       	mov    $0x0,%eax
     9ce:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     9d5:	00 00 00 
     9d8:	ff d1                	callq  *%rcx
     9da:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     9de:	83 e0 02             	and    $0x2,%eax
     9e1:	48 85 c0             	test   %rax,%rax
     9e4:	75 58                	jne    a3e <do_stack_segment_fault+0x146>
     9e6:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     9ea:	83 e0 04             	and    $0x4,%eax
     9ed:	48 85 c0             	test   %rax,%rax
     9f0:	74 27                	je     a19 <do_stack_segment_fault+0x121>
     9f2:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     9f9:	00 00 00 
     9fc:	be 00 00 00 00       	mov    $0x0,%esi
     a01:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     a06:	b8 00 00 00 00       	mov    $0x0,%eax
     a0b:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     a12:	00 00 00 
     a15:	ff d1                	callq  *%rcx
     a17:	eb 25                	jmp    a3e <do_stack_segment_fault+0x146>
     a19:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     a20:	00 00 00 
     a23:	be 00 00 00 00       	mov    $0x0,%esi
     a28:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     a2d:	b8 00 00 00 00       	mov    $0x0,%eax
     a32:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     a39:	00 00 00 
     a3c:	ff d1                	callq  *%rcx
     a3e:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a42:	25 f8 ff 00 00       	and    $0xfff8,%eax
     a47:	48 89 c1             	mov    %rax,%rcx
     a4a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     a51:	00 00 00 
     a54:	be 00 00 00 00       	mov    $0x0,%esi
     a59:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     a5e:	b8 00 00 00 00       	mov    $0x0,%eax
     a63:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     a6a:	00 00 00 
     a6d:	41 ff d0             	callq  *%r8
     a70:	eb fe                	jmp    a70 <do_stack_segment_fault+0x178>

0000000000000a72 <do_general_protection>:
     a72:	55                   	push   %rbp
     a73:	48 89 e5             	mov    %rsp,%rbp
     a76:	48 83 ec 10          	sub    $0x10,%rsp
     a7a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     a7e:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     a82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     a86:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     a8d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     a91:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     a98:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     a9c:	49 89 c9             	mov    %rcx,%r9
     a9f:	49 89 d0             	mov    %rdx,%r8
     aa2:	48 89 c1             	mov    %rax,%rcx
     aa5:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     aac:	00 00 00 
     aaf:	be 00 00 00 00       	mov    $0x0,%esi
     ab4:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     ab9:	b8 00 00 00 00       	mov    $0x0,%eax
     abe:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     ac5:	00 00 00 
     ac8:	41 ff d2             	callq  *%r10
     acb:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     acf:	83 e0 01             	and    $0x1,%eax
     ad2:	48 85 c0             	test   %rax,%rax
     ad5:	74 25                	je     afc <do_general_protection+0x8a>
     ad7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     ade:	00 00 00 
     ae1:	be 00 00 00 00       	mov    $0x0,%esi
     ae6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     aeb:	b8 00 00 00 00       	mov    $0x0,%eax
     af0:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     af7:	00 00 00 
     afa:	ff d1                	callq  *%rcx
     afc:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b00:	83 e0 02             	and    $0x2,%eax
     b03:	48 85 c0             	test   %rax,%rax
     b06:	74 27                	je     b2f <do_general_protection+0xbd>
     b08:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     b0f:	00 00 00 
     b12:	be 00 00 00 00       	mov    $0x0,%esi
     b17:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     b1c:	b8 00 00 00 00       	mov    $0x0,%eax
     b21:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     b28:	00 00 00 
     b2b:	ff d1                	callq  *%rcx
     b2d:	eb 25                	jmp    b54 <do_general_protection+0xe2>
     b2f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     b36:	00 00 00 
     b39:	be 00 00 00 00       	mov    $0x0,%esi
     b3e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     b43:	b8 00 00 00 00       	mov    $0x0,%eax
     b48:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     b4f:	00 00 00 
     b52:	ff d1                	callq  *%rcx
     b54:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b58:	83 e0 02             	and    $0x2,%eax
     b5b:	48 85 c0             	test   %rax,%rax
     b5e:	75 58                	jne    bb8 <do_general_protection+0x146>
     b60:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     b64:	83 e0 04             	and    $0x4,%eax
     b67:	48 85 c0             	test   %rax,%rax
     b6a:	74 27                	je     b93 <do_general_protection+0x121>
     b6c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     b73:	00 00 00 
     b76:	be 00 00 00 00       	mov    $0x0,%esi
     b7b:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     b80:	b8 00 00 00 00       	mov    $0x0,%eax
     b85:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     b8c:	00 00 00 
     b8f:	ff d1                	callq  *%rcx
     b91:	eb 25                	jmp    bb8 <do_general_protection+0x146>
     b93:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     b9a:	00 00 00 
     b9d:	be 00 00 00 00       	mov    $0x0,%esi
     ba2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     ba7:	b8 00 00 00 00       	mov    $0x0,%eax
     bac:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     bb3:	00 00 00 
     bb6:	ff d1                	callq  *%rcx
     bb8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     bbc:	25 f8 ff 00 00       	and    $0xfff8,%eax
     bc1:	48 89 c1             	mov    %rax,%rcx
     bc4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     bcb:	00 00 00 
     bce:	be 00 00 00 00       	mov    $0x0,%esi
     bd3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     bd8:	b8 00 00 00 00       	mov    $0x0,%eax
     bdd:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     be4:	00 00 00 
     be7:	41 ff d0             	callq  *%r8
     bea:	eb fe                	jmp    bea <do_general_protection+0x178>

0000000000000bec <do_page_fault>:
     bec:	55                   	push   %rbp
     bed:	48 89 e5             	mov    %rsp,%rbp
     bf0:	48 83 ec 20          	sub    $0x20,%rsp
     bf4:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     bf8:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
     bfc:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
     c03:	00 
     c04:	0f 20 d0             	mov    %cr2,%rax
     c07:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     c0b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     c0f:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     c16:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     c1a:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     c21:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c25:	49 89 c9             	mov    %rcx,%r9
     c28:	49 89 d0             	mov    %rdx,%r8
     c2b:	48 89 c1             	mov    %rax,%rcx
     c2e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     c35:	00 00 00 
     c38:	be 00 00 00 00       	mov    $0x0,%esi
     c3d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     c42:	b8 00 00 00 00       	mov    $0x0,%eax
     c47:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     c4e:	00 00 00 
     c51:	41 ff d2             	callq  *%r10
     c54:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c58:	83 e0 01             	and    $0x1,%eax
     c5b:	48 85 c0             	test   %rax,%rax
     c5e:	75 25                	jne    c85 <do_page_fault+0x99>
     c60:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     c67:	00 00 00 
     c6a:	be 00 00 00 00       	mov    $0x0,%esi
     c6f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     c74:	b8 00 00 00 00       	mov    $0x0,%eax
     c79:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     c80:	00 00 00 
     c83:	ff d1                	callq  *%rcx
     c85:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     c89:	83 e0 02             	and    $0x2,%eax
     c8c:	48 85 c0             	test   %rax,%rax
     c8f:	74 27                	je     cb8 <do_page_fault+0xcc>
     c91:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     c98:	00 00 00 
     c9b:	be 00 00 00 00       	mov    $0x0,%esi
     ca0:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     ca5:	b8 00 00 00 00       	mov    $0x0,%eax
     caa:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     cb1:	00 00 00 
     cb4:	ff d1                	callq  *%rcx
     cb6:	eb 25                	jmp    cdd <do_page_fault+0xf1>
     cb8:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     cbf:	00 00 00 
     cc2:	be 00 00 00 00       	mov    $0x0,%esi
     cc7:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     ccc:	b8 00 00 00 00       	mov    $0x0,%eax
     cd1:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     cd8:	00 00 00 
     cdb:	ff d1                	callq  *%rcx
     cdd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     ce1:	83 e0 04             	and    $0x4,%eax
     ce4:	48 85 c0             	test   %rax,%rax
     ce7:	74 27                	je     d10 <do_page_fault+0x124>
     ce9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     cf0:	00 00 00 
     cf3:	be 00 00 00 00       	mov    $0x0,%esi
     cf8:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     cfd:	b8 00 00 00 00       	mov    $0x0,%eax
     d02:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     d09:	00 00 00 
     d0c:	ff d1                	callq  *%rcx
     d0e:	eb 25                	jmp    d35 <do_page_fault+0x149>
     d10:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d17:	00 00 00 
     d1a:	be 00 00 00 00       	mov    $0x0,%esi
     d1f:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     d24:	b8 00 00 00 00       	mov    $0x0,%eax
     d29:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     d30:	00 00 00 
     d33:	ff d1                	callq  *%rcx
     d35:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     d39:	83 e0 08             	and    $0x8,%eax
     d3c:	48 85 c0             	test   %rax,%rax
     d3f:	74 25                	je     d66 <do_page_fault+0x17a>
     d41:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d48:	00 00 00 
     d4b:	be 00 00 00 00       	mov    $0x0,%esi
     d50:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     d55:	b8 00 00 00 00       	mov    $0x0,%eax
     d5a:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     d61:	00 00 00 
     d64:	ff d1                	callq  *%rcx
     d66:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
     d6a:	83 e0 10             	and    $0x10,%eax
     d6d:	48 85 c0             	test   %rax,%rax
     d70:	74 25                	je     d97 <do_page_fault+0x1ab>
     d72:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d79:	00 00 00 
     d7c:	be 00 00 00 00       	mov    $0x0,%esi
     d81:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     d86:	b8 00 00 00 00       	mov    $0x0,%eax
     d8b:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     d92:	00 00 00 
     d95:	ff d1                	callq  *%rcx
     d97:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     d9e:	00 00 00 
     da1:	be 00 00 00 00       	mov    $0x0,%esi
     da6:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     dab:	b8 00 00 00 00       	mov    $0x0,%eax
     db0:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
     db7:	00 00 00 
     dba:	ff d1                	callq  *%rcx
     dbc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dc0:	48 89 c1             	mov    %rax,%rcx
     dc3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     dca:	00 00 00 
     dcd:	be 00 00 00 00       	mov    $0x0,%esi
     dd2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     dd7:	b8 00 00 00 00       	mov    $0x0,%eax
     ddc:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
     de3:	00 00 00 
     de6:	41 ff d0             	callq  *%r8
     de9:	eb fe                	jmp    de9 <do_page_fault+0x1fd>

0000000000000deb <do_x87_FPU_error>:
     deb:	55                   	push   %rbp
     dec:	48 89 e5             	mov    %rsp,%rbp
     def:	48 83 ec 10          	sub    $0x10,%rsp
     df3:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     df7:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     dfb:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     dff:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     e06:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e0a:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     e11:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e15:	49 89 c9             	mov    %rcx,%r9
     e18:	49 89 d0             	mov    %rdx,%r8
     e1b:	48 89 c1             	mov    %rax,%rcx
     e1e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e25:	00 00 00 
     e28:	be 00 00 00 00       	mov    $0x0,%esi
     e2d:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     e32:	b8 00 00 00 00       	mov    $0x0,%eax
     e37:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     e3e:	00 00 00 
     e41:	41 ff d2             	callq  *%r10
     e44:	eb fe                	jmp    e44 <do_x87_FPU_error+0x59>

0000000000000e46 <do_alignment_check>:
     e46:	55                   	push   %rbp
     e47:	48 89 e5             	mov    %rsp,%rbp
     e4a:	48 83 ec 10          	sub    $0x10,%rsp
     e4e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     e52:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     e56:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e5a:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     e61:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     e65:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     e6c:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     e70:	49 89 c9             	mov    %rcx,%r9
     e73:	49 89 d0             	mov    %rdx,%r8
     e76:	48 89 c1             	mov    %rax,%rcx
     e79:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e80:	00 00 00 
     e83:	be 00 00 00 00       	mov    $0x0,%esi
     e88:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     e8d:	b8 00 00 00 00       	mov    $0x0,%eax
     e92:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     e99:	00 00 00 
     e9c:	41 ff d2             	callq  *%r10
     e9f:	eb fe                	jmp    e9f <do_alignment_check+0x59>

0000000000000ea1 <do_machine_check>:
     ea1:	55                   	push   %rbp
     ea2:	48 89 e5             	mov    %rsp,%rbp
     ea5:	48 83 ec 10          	sub    $0x10,%rsp
     ea9:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     ead:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     eb1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     eb5:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     ebc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ec0:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     ec7:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     ecb:	49 89 c9             	mov    %rcx,%r9
     ece:	49 89 d0             	mov    %rdx,%r8
     ed1:	48 89 c1             	mov    %rax,%rcx
     ed4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     edb:	00 00 00 
     ede:	be 00 00 00 00       	mov    $0x0,%esi
     ee3:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     ee8:	b8 00 00 00 00       	mov    $0x0,%eax
     eed:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     ef4:	00 00 00 
     ef7:	41 ff d2             	callq  *%r10
     efa:	eb fe                	jmp    efa <do_machine_check+0x59>

0000000000000efc <do_SIMD_exception>:
     efc:	55                   	push   %rbp
     efd:	48 89 e5             	mov    %rsp,%rbp
     f00:	48 83 ec 10          	sub    $0x10,%rsp
     f04:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f08:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     f0c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f10:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     f17:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f1b:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     f22:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f26:	49 89 c9             	mov    %rcx,%r9
     f29:	49 89 d0             	mov    %rdx,%r8
     f2c:	48 89 c1             	mov    %rax,%rcx
     f2f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     f36:	00 00 00 
     f39:	be 00 00 00 00       	mov    $0x0,%esi
     f3e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     f43:	b8 00 00 00 00       	mov    $0x0,%eax
     f48:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     f4f:	00 00 00 
     f52:	41 ff d2             	callq  *%r10
     f55:	eb fe                	jmp    f55 <do_SIMD_exception+0x59>

0000000000000f57 <do_virtualization_exception>:
     f57:	55                   	push   %rbp
     f58:	48 89 e5             	mov    %rsp,%rbp
     f5b:	48 83 ec 10          	sub    $0x10,%rsp
     f5f:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
     f63:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
     f67:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f6b:	48 8b 88 98 00 00 00 	mov    0x98(%rax),%rcx
     f72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f76:	48 8b 90 b0 00 00 00 	mov    0xb0(%rax),%rdx
     f7d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     f81:	49 89 c9             	mov    %rcx,%r9
     f84:	49 89 d0             	mov    %rdx,%r8
     f87:	48 89 c1             	mov    %rax,%rcx
     f8a:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     f91:	00 00 00 
     f94:	be 00 00 00 00       	mov    $0x0,%esi
     f99:	bf 00 00 ff 00       	mov    $0xff0000,%edi
     f9e:	b8 00 00 00 00       	mov    $0x0,%eax
     fa3:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
     faa:	00 00 00 
     fad:	41 ff d2             	callq  *%r10
     fb0:	eb fe                	jmp    fb0 <do_virtualization_exception+0x59>

0000000000000fb2 <sys_vector_init>:
     fb2:	55                   	push   %rbp
     fb3:	48 89 e5             	mov    %rsp,%rbp
     fb6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     fbd:	00 00 00 
     fc0:	be 01 00 00 00       	mov    $0x1,%esi
     fc5:	bf 00 00 00 00       	mov    $0x0,%edi
     fca:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fd1:	00 00 00 
     fd4:	ff d0                	callq  *%rax
     fd6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     fdd:	00 00 00 
     fe0:	be 01 00 00 00       	mov    $0x1,%esi
     fe5:	bf 01 00 00 00       	mov    $0x1,%edi
     fea:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ff1:	00 00 00 
     ff4:	ff d0                	callq  *%rax
     ff6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     ffd:	00 00 00 
    1000:	be 01 00 00 00       	mov    $0x1,%esi
    1005:	bf 02 00 00 00       	mov    $0x2,%edi
    100a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1011:	00 00 00 
    1014:	ff d0                	callq  *%rax
    1016:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    101d:	00 00 00 
    1020:	be 01 00 00 00       	mov    $0x1,%esi
    1025:	bf 03 00 00 00       	mov    $0x3,%edi
    102a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1031:	00 00 00 
    1034:	ff d0                	callq  *%rax
    1036:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    103d:	00 00 00 
    1040:	be 01 00 00 00       	mov    $0x1,%esi
    1045:	bf 04 00 00 00       	mov    $0x4,%edi
    104a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1051:	00 00 00 
    1054:	ff d0                	callq  *%rax
    1056:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    105d:	00 00 00 
    1060:	be 01 00 00 00       	mov    $0x1,%esi
    1065:	bf 05 00 00 00       	mov    $0x5,%edi
    106a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1071:	00 00 00 
    1074:	ff d0                	callq  *%rax
    1076:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    107d:	00 00 00 
    1080:	be 01 00 00 00       	mov    $0x1,%esi
    1085:	bf 06 00 00 00       	mov    $0x6,%edi
    108a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1091:	00 00 00 
    1094:	ff d0                	callq  *%rax
    1096:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    109d:	00 00 00 
    10a0:	be 01 00 00 00       	mov    $0x1,%esi
    10a5:	bf 07 00 00 00       	mov    $0x7,%edi
    10aa:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10b1:	00 00 00 
    10b4:	ff d0                	callq  *%rax
    10b6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    10bd:	00 00 00 
    10c0:	be 01 00 00 00       	mov    $0x1,%esi
    10c5:	bf 08 00 00 00       	mov    $0x8,%edi
    10ca:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10d1:	00 00 00 
    10d4:	ff d0                	callq  *%rax
    10d6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    10dd:	00 00 00 
    10e0:	be 01 00 00 00       	mov    $0x1,%esi
    10e5:	bf 09 00 00 00       	mov    $0x9,%edi
    10ea:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10f1:	00 00 00 
    10f4:	ff d0                	callq  *%rax
    10f6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    10fd:	00 00 00 
    1100:	be 01 00 00 00       	mov    $0x1,%esi
    1105:	bf 0a 00 00 00       	mov    $0xa,%edi
    110a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1111:	00 00 00 
    1114:	ff d0                	callq  *%rax
    1116:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    111d:	00 00 00 
    1120:	be 01 00 00 00       	mov    $0x1,%esi
    1125:	bf 0b 00 00 00       	mov    $0xb,%edi
    112a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1131:	00 00 00 
    1134:	ff d0                	callq  *%rax
    1136:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    113d:	00 00 00 
    1140:	be 01 00 00 00       	mov    $0x1,%esi
    1145:	bf 0c 00 00 00       	mov    $0xc,%edi
    114a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1151:	00 00 00 
    1154:	ff d0                	callq  *%rax
    1156:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    115d:	00 00 00 
    1160:	be 01 00 00 00       	mov    $0x1,%esi
    1165:	bf 0d 00 00 00       	mov    $0xd,%edi
    116a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1171:	00 00 00 
    1174:	ff d0                	callq  *%rax
    1176:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    117d:	00 00 00 
    1180:	be 01 00 00 00       	mov    $0x1,%esi
    1185:	bf 0e 00 00 00       	mov    $0xe,%edi
    118a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1191:	00 00 00 
    1194:	ff d0                	callq  *%rax
    1196:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    119d:	00 00 00 
    11a0:	be 01 00 00 00       	mov    $0x1,%esi
    11a5:	bf 10 00 00 00       	mov    $0x10,%edi
    11aa:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11b1:	00 00 00 
    11b4:	ff d0                	callq  *%rax
    11b6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    11bd:	00 00 00 
    11c0:	be 01 00 00 00       	mov    $0x1,%esi
    11c5:	bf 11 00 00 00       	mov    $0x11,%edi
    11ca:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11d1:	00 00 00 
    11d4:	ff d0                	callq  *%rax
    11d6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    11dd:	00 00 00 
    11e0:	be 01 00 00 00       	mov    $0x1,%esi
    11e5:	bf 12 00 00 00       	mov    $0x12,%edi
    11ea:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11f1:	00 00 00 
    11f4:	ff d0                	callq  *%rax
    11f6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    11fd:	00 00 00 
    1200:	be 01 00 00 00       	mov    $0x1,%esi
    1205:	bf 13 00 00 00       	mov    $0x13,%edi
    120a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1211:	00 00 00 
    1214:	ff d0                	callq  *%rax
    1216:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    121d:	00 00 00 
    1220:	be 01 00 00 00       	mov    $0x1,%esi
    1225:	bf 14 00 00 00       	mov    $0x14,%edi
    122a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1231:	00 00 00 
    1234:	ff d0                	callq  *%rax
    1236:	90                   	nop
    1237:	5d                   	pop    %rbp
    1238:	c3                   	retq   

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

Disassembly of section .rodata:

0000000000000000 <.rodata>:
   0:	64 6f                	outsl  %fs:(%rsi),(%dx)
   2:	5f                   	pop    %rdi
   3:	64 69 76 69 64 65 5f 	imul   $0x655f6564,%fs:0x69(%rsi),%esi
   a:	65 
   b:	72 72                	jb     7f <.rodata+0x7f>
   d:	6f                   	outsl  %ds:(%rsi),(%dx)
   e:	72 28                	jb     38 <.rodata+0x38>
  10:	30 29                	xor    %ch,(%rcx)
  12:	2c 45                	sub    $0x45,%al
  14:	52                   	push   %rdx
  15:	52                   	push   %rdx
  16:	4f 52                	rex.WRXB push %r10
  18:	5f                   	pop    %rdi
  19:	43                   	rex.XB
  1a:	4f                   	rex.WRXB
  1b:	44                   	rex.R
  1c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313046 <Pos+0x38312046>
  23:	6c                   	insb   (%dx),%es:(%rdi)
  24:	78 2c                	js     52 <.rodata+0x52>
  26:	52                   	push   %rdx
  27:	53                   	push   %rbx
  28:	50                   	push   %rax
  29:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313052 <Pos+0x38312052>
  2f:	6c                   	insb   (%dx),%es:(%rdi)
  30:	78 2c                	js     5e <.rodata+0x5e>
  32:	52                   	push   %rdx
  33:	49 50                	rex.WB push %r8
  35:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831305e <Pos+0x3831205e>
  3b:	6c                   	insb   (%dx),%es:(%rdi)
  3c:	78 0a                	js     48 <.rodata+0x48>
  3e:	00 00                	add    %al,(%rax)
  40:	64 6f                	outsl  %fs:(%rsi),(%dx)
  42:	5f                   	pop    %rdi
  43:	64 65 62             	fs gs (bad) 
  46:	75 67                	jne    af <.rodata+0xaf>
  48:	28 31                	sub    %dh,(%rcx)
  4a:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
  51:	5f                   	pop    %rdi
  52:	43                   	rex.XB
  53:	4f                   	rex.WRXB
  54:	44                   	rex.R
  55:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831307f <Pos+0x3831207f>
  5c:	6c                   	insb   (%dx),%es:(%rdi)
  5d:	78 2c                	js     8b <.rodata+0x8b>
  5f:	52                   	push   %rdx
  60:	53                   	push   %rbx
  61:	50                   	push   %rax
  62:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831308b <Pos+0x3831208b>
  68:	6c                   	insb   (%dx),%es:(%rdi)
  69:	78 2c                	js     97 <.rodata+0x97>
  6b:	52                   	push   %rdx
  6c:	49 50                	rex.WB push %r8
  6e:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313097 <Pos+0x38312097>
  74:	6c                   	insb   (%dx),%es:(%rdi)
  75:	78 0a                	js     81 <.rodata+0x81>
  77:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
  7b:	6e                   	outsb  %ds:(%rsi),(%dx)
  7c:	6d                   	insl   (%dx),%es:(%rdi)
  7d:	69 28 32 29 2c 45    	imul   $0x452c2932,(%rax),%ebp
  83:	52                   	push   %rdx
  84:	52                   	push   %rdx
  85:	4f 52                	rex.WRXB push %r10
  87:	5f                   	pop    %rdi
  88:	43                   	rex.XB
  89:	4f                   	rex.WRXB
  8a:	44                   	rex.R
  8b:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383130b5 <Pos+0x383120b5>
  92:	6c                   	insb   (%dx),%es:(%rdi)
  93:	78 2c                	js     c1 <.rodata+0xc1>
  95:	52                   	push   %rdx
  96:	53                   	push   %rbx
  97:	50                   	push   %rax
  98:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130c1 <Pos+0x383120c1>
  9e:	6c                   	insb   (%dx),%es:(%rdi)
  9f:	78 2c                	js     cd <.rodata+0xcd>
  a1:	52                   	push   %rdx
  a2:	49 50                	rex.WB push %r8
  a4:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130cd <Pos+0x383120cd>
  aa:	6c                   	insb   (%dx),%es:(%rdi)
  ab:	78 0a                	js     b7 <.rodata+0xb7>
  ad:	00 00                	add    %al,(%rax)
  af:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
  b3:	69 6e 74 33 28 33 29 	imul   $0x29332833,0x74(%rsi),%ebp
  ba:	2c 45                	sub    $0x45,%al
  bc:	52                   	push   %rdx
  bd:	52                   	push   %rdx
  be:	4f 52                	rex.WRXB push %r10
  c0:	5f                   	pop    %rdi
  c1:	43                   	rex.XB
  c2:	4f                   	rex.WRXB
  c3:	44                   	rex.R
  c4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383130ee <Pos+0x383120ee>
  cb:	6c                   	insb   (%dx),%es:(%rdi)
  cc:	78 2c                	js     fa <.rodata+0xfa>
  ce:	52                   	push   %rdx
  cf:	53                   	push   %rbx
  d0:	50                   	push   %rax
  d1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383130fa <Pos+0x383120fa>
  d7:	6c                   	insb   (%dx),%es:(%rdi)
  d8:	78 2c                	js     106 <.rodata+0x106>
  da:	52                   	push   %rdx
  db:	49 50                	rex.WB push %r8
  dd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313106 <Pos+0x38312106>
  e3:	6c                   	insb   (%dx),%es:(%rdi)
  e4:	78 0a                	js     f0 <.rodata+0xf0>
  e6:	00 00                	add    %al,(%rax)
  e8:	64 6f                	outsl  %fs:(%rsi),(%dx)
  ea:	5f                   	pop    %rdi
  eb:	6f                   	outsl  %ds:(%rsi),(%dx)
  ec:	76 65                	jbe    153 <.rodata+0x153>
  ee:	72 66                	jb     156 <.rodata+0x156>
  f0:	6c                   	insb   (%dx),%es:(%rdi)
  f1:	6f                   	outsl  %ds:(%rsi),(%dx)
  f2:	77 28                	ja     11c <.rodata+0x11c>
  f4:	34 29                	xor    $0x29,%al
  f6:	2c 45                	sub    $0x45,%al
  f8:	52                   	push   %rdx
  f9:	52                   	push   %rdx
  fa:	4f 52                	rex.WRXB push %r10
  fc:	5f                   	pop    %rdi
  fd:	43                   	rex.XB
  fe:	4f                   	rex.WRXB
  ff:	44                   	rex.R
 100:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831312a <Pos+0x3831212a>
 107:	6c                   	insb   (%dx),%es:(%rdi)
 108:	78 2c                	js     136 <.rodata+0x136>
 10a:	52                   	push   %rdx
 10b:	53                   	push   %rbx
 10c:	50                   	push   %rax
 10d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313136 <Pos+0x38312136>
 113:	6c                   	insb   (%dx),%es:(%rdi)
 114:	78 2c                	js     142 <.rodata+0x142>
 116:	52                   	push   %rdx
 117:	49 50                	rex.WB push %r8
 119:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313142 <Pos+0x38312142>
 11f:	6c                   	insb   (%dx),%es:(%rdi)
 120:	78 0a                	js     12c <.rodata+0x12c>
 122:	00 00                	add    %al,(%rax)
 124:	00 00                	add    %al,(%rax)
 126:	00 00                	add    %al,(%rax)
 128:	64 6f                	outsl  %fs:(%rsi),(%dx)
 12a:	5f                   	pop    %rdi
 12b:	62                   	(bad)  
 12c:	6f                   	outsl  %ds:(%rsi),(%dx)
 12d:	75 6e                	jne    19d <.rodata+0x19d>
 12f:	64 73 28             	fs jae 15a <.rodata+0x15a>
 132:	35 29 2c 45 52       	xor    $0x52452c29,%eax
 137:	52                   	push   %rdx
 138:	4f 52                	rex.WRXB push %r10
 13a:	5f                   	pop    %rdi
 13b:	43                   	rex.XB
 13c:	4f                   	rex.WRXB
 13d:	44                   	rex.R
 13e:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313168 <Pos+0x38312168>
 145:	6c                   	insb   (%dx),%es:(%rdi)
 146:	78 2c                	js     174 <.rodata+0x174>
 148:	52                   	push   %rdx
 149:	53                   	push   %rbx
 14a:	50                   	push   %rax
 14b:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313174 <Pos+0x38312174>
 151:	6c                   	insb   (%dx),%es:(%rdi)
 152:	78 2c                	js     180 <.rodata+0x180>
 154:	52                   	push   %rdx
 155:	49 50                	rex.WB push %r8
 157:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313180 <Pos+0x38312180>
 15d:	6c                   	insb   (%dx),%es:(%rdi)
 15e:	78 0a                	js     16a <.rodata+0x16a>
	...
 168:	64 6f                	outsl  %fs:(%rsi),(%dx)
 16a:	5f                   	pop    %rdi
 16b:	75 6e                	jne    1db <.rodata+0x1db>
 16d:	64 65 66 69 6e 65 64 	fs imul $0x5f64,%gs:0x65(%rsi),%bp
 174:	5f 
 175:	6f                   	outsl  %ds:(%rsi),(%dx)
 176:	70 63                	jo     1db <.rodata+0x1db>
 178:	6f                   	outsl  %ds:(%rsi),(%dx)
 179:	64 65 28 36          	fs sub %dh,%gs:(%rsi)
 17d:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 184:	5f                   	pop    %rdi
 185:	43                   	rex.XB
 186:	4f                   	rex.WRXB
 187:	44                   	rex.R
 188:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383131b2 <Pos+0x383121b2>
 18f:	6c                   	insb   (%dx),%es:(%rdi)
 190:	78 2c                	js     1be <.rodata+0x1be>
 192:	52                   	push   %rdx
 193:	53                   	push   %rbx
 194:	50                   	push   %rax
 195:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131be <Pos+0x383121be>
 19b:	6c                   	insb   (%dx),%es:(%rdi)
 19c:	78 2c                	js     1ca <.rodata+0x1ca>
 19e:	52                   	push   %rdx
 19f:	49 50                	rex.WB push %r8
 1a1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383131ca <Pos+0x383121ca>
 1a7:	6c                   	insb   (%dx),%es:(%rdi)
 1a8:	78 0a                	js     1b4 <.rodata+0x1b4>
 1aa:	00 00                	add    %al,(%rax)
 1ac:	00 00                	add    %al,(%rax)
 1ae:	00 00                	add    %al,(%rax)
 1b0:	64 6f                	outsl  %fs:(%rsi),(%dx)
 1b2:	5f                   	pop    %rdi
 1b3:	64 65 76 5f          	fs gs jbe 216 <.rodata+0x216>
 1b7:	6e                   	outsb  %ds:(%rsi),(%dx)
 1b8:	6f                   	outsl  %ds:(%rsi),(%dx)
 1b9:	74 5f                	je     21a <.rodata+0x21a>
 1bb:	61                   	(bad)  
 1bc:	76 61                	jbe    21f <.rodata+0x21f>
 1be:	69 6c 61 62 6c 65 28 	imul   $0x3728656c,0x62(%rcx,%riz,2),%ebp
 1c5:	37 
 1c6:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 1cd:	5f                   	pop    %rdi
 1ce:	43                   	rex.XB
 1cf:	4f                   	rex.WRXB
 1d0:	44                   	rex.R
 1d1:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383131fb <Pos+0x383121fb>
 1d8:	6c                   	insb   (%dx),%es:(%rdi)
 1d9:	78 2c                	js     207 <.rodata+0x207>
 1db:	52                   	push   %rdx
 1dc:	53                   	push   %rbx
 1dd:	50                   	push   %rax
 1de:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313207 <Pos+0x38312207>
 1e4:	6c                   	insb   (%dx),%es:(%rdi)
 1e5:	78 2c                	js     213 <.rodata+0x213>
 1e7:	52                   	push   %rdx
 1e8:	49 50                	rex.WB push %r8
 1ea:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313213 <Pos+0x38312213>
 1f0:	6c                   	insb   (%dx),%es:(%rdi)
 1f1:	78 0a                	js     1fd <.rodata+0x1fd>
 1f3:	00 00                	add    %al,(%rax)
 1f5:	00 00                	add    %al,(%rax)
 1f7:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
 1fb:	64 6f                	outsl  %fs:(%rsi),(%dx)
 1fd:	75 62                	jne    261 <.rodata+0x261>
 1ff:	6c                   	insb   (%dx),%es:(%rdi)
 200:	65 5f                	gs pop %rdi
 202:	66 61                	data16 (bad) 
 204:	75 6c                	jne    272 <.rodata+0x272>
 206:	74 28                	je     230 <.rodata+0x230>
 208:	38 29                	cmp    %ch,(%rcx)
 20a:	2c 45                	sub    $0x45,%al
 20c:	52                   	push   %rdx
 20d:	52                   	push   %rdx
 20e:	4f 52                	rex.WRXB push %r10
 210:	5f                   	pop    %rdi
 211:	43                   	rex.XB
 212:	4f                   	rex.WRXB
 213:	44                   	rex.R
 214:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831323e <Pos+0x3831223e>
 21b:	6c                   	insb   (%dx),%es:(%rdi)
 21c:	78 2c                	js     24a <.rodata+0x24a>
 21e:	52                   	push   %rdx
 21f:	53                   	push   %rbx
 220:	50                   	push   %rax
 221:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831324a <Pos+0x3831224a>
 227:	6c                   	insb   (%dx),%es:(%rdi)
 228:	78 2c                	js     256 <.rodata+0x256>
 22a:	52                   	push   %rdx
 22b:	49 50                	rex.WB push %r8
 22d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313256 <Pos+0x38312256>
 233:	6c                   	insb   (%dx),%es:(%rdi)
 234:	78 0a                	js     240 <.rodata+0x240>
 236:	00 00                	add    %al,(%rax)
 238:	64 6f                	outsl  %fs:(%rsi),(%dx)
 23a:	5f                   	pop    %rdi
 23b:	63 6f 70             	movsxd 0x70(%rdi),%ebp
 23e:	72 6f                	jb     2af <.rodata+0x2af>
 240:	63 65 73             	movsxd 0x73(%rbp),%esp
 243:	73 6f                	jae    2b4 <.rodata+0x2b4>
 245:	72 5f                	jb     2a6 <.rodata+0x2a6>
 247:	73 65                	jae    2ae <.rodata+0x2ae>
 249:	67 6d                	insl   (%dx),%es:(%edi)
 24b:	65 6e                	outsb  %gs:(%rsi),(%dx)
 24d:	74 5f                	je     2ae <.rodata+0x2ae>
 24f:	6f                   	outsl  %ds:(%rsi),(%dx)
 250:	76 65                	jbe    2b7 <.rodata+0x2b7>
 252:	72 72                	jb     2c6 <.rodata+0x2c6>
 254:	75 6e                	jne    2c4 <.rodata+0x2c4>
 256:	28 39                	sub    %bh,(%rcx)
 258:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 25f:	5f                   	pop    %rdi
 260:	43                   	rex.XB
 261:	4f                   	rex.WRXB
 262:	44                   	rex.R
 263:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831328d <Pos+0x3831228d>
 26a:	6c                   	insb   (%dx),%es:(%rdi)
 26b:	78 2c                	js     299 <.rodata+0x299>
 26d:	52                   	push   %rdx
 26e:	53                   	push   %rbx
 26f:	50                   	push   %rax
 270:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313299 <Pos+0x38312299>
 276:	6c                   	insb   (%dx),%es:(%rdi)
 277:	78 2c                	js     2a5 <.rodata+0x2a5>
 279:	52                   	push   %rdx
 27a:	49 50                	rex.WB push %r8
 27c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132a5 <Pos+0x383122a5>
 282:	6c                   	insb   (%dx),%es:(%rdi)
 283:	78 0a                	js     28f <.rodata+0x28f>
 285:	00 00                	add    %al,(%rax)
 287:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
 28b:	69 6e 76 61 6c 69 64 	imul   $0x64696c61,0x76(%rsi),%ebp
 292:	5f                   	pop    %rdi
 293:	54                   	push   %rsp
 294:	53                   	push   %rbx
 295:	53                   	push   %rbx
 296:	28 31                	sub    %dh,(%rcx)
 298:	30 29                	xor    %ch,(%rcx)
 29a:	2c 45                	sub    $0x45,%al
 29c:	52                   	push   %rdx
 29d:	52                   	push   %rdx
 29e:	4f 52                	rex.WRXB push %r10
 2a0:	5f                   	pop    %rdi
 2a1:	43                   	rex.XB
 2a2:	4f                   	rex.WRXB
 2a3:	44                   	rex.R
 2a4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383132ce <Pos+0x383122ce>
 2ab:	6c                   	insb   (%dx),%es:(%rdi)
 2ac:	78 2c                	js     2da <.rodata+0x2da>
 2ae:	52                   	push   %rdx
 2af:	53                   	push   %rbx
 2b0:	50                   	push   %rax
 2b1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132da <Pos+0x383122da>
 2b7:	6c                   	insb   (%dx),%es:(%rdi)
 2b8:	78 2c                	js     2e6 <.rodata+0x2e6>
 2ba:	52                   	push   %rdx
 2bb:	49 50                	rex.WB push %r8
 2bd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383132e6 <Pos+0x383122e6>
 2c3:	6c                   	insb   (%dx),%es:(%rdi)
 2c4:	78 0a                	js     2d0 <.rodata+0x2d0>
 2c6:	00 00                	add    %al,(%rax)
 2c8:	54                   	push   %rsp
 2c9:	68 65 20 65 78       	pushq  $0x78652065
 2ce:	63 65 70             	movsxd 0x70(%rbp),%esp
 2d1:	74 69                	je     33c <.rodata+0x33c>
 2d3:	6f                   	outsl  %ds:(%rsi),(%dx)
 2d4:	6e                   	outsb  %ds:(%rsi),(%dx)
 2d5:	20 6f 63             	and    %ch,0x63(%rdi)
 2d8:	63 75 72             	movsxd 0x72(%rbp),%esi
 2db:	72 65                	jb     342 <.rodata+0x342>
 2dd:	64 20 64 75 72       	and    %ah,%fs:0x72(%rbp,%rsi,2)
 2e2:	69 6e 67 20 64 65 6c 	imul   $0x6c656420,0x67(%rsi),%ebp
 2e9:	69 76 65 72 79 20 6f 	imul   $0x6f207972,0x65(%rsi),%esi
 2f0:	66 20 61 6e          	data16 and %ah,0x6e(%rcx)
 2f4:	20 65 76             	and    %ah,0x76(%rbp)
 2f7:	65 6e                	outsb  %gs:(%rsi),(%dx)
 2f9:	74 20                	je     31b <.rodata+0x31b>
 2fb:	65 78 74             	gs js  372 <.rodata+0x372>
 2fe:	65 72 6e             	gs jb  36f <.rodata+0x36f>
 301:	61                   	(bad)  
 302:	6c                   	insb   (%dx),%es:(%rdi)
 303:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 307:	74 68                	je     371 <.rodata+0x371>
 309:	65 20 70 72          	and    %dh,%gs:0x72(%rax)
 30d:	6f                   	outsl  %ds:(%rsi),(%dx)
 30e:	67 72 61             	addr32 jb 372 <.rodata+0x372>
 311:	6d                   	insl   (%dx),%es:(%rdi)
 312:	2c 73                	sub    $0x73,%al
 314:	75 63                	jne    379 <.rodata+0x379>
 316:	68 20 61 73 20       	pushq  $0x20736120
 31b:	61                   	(bad)  
 31c:	6e                   	outsb  %ds:(%rsi),(%dx)
 31d:	20 69 6e             	and    %ch,0x6e(%rcx)
 320:	74 65                	je     387 <.rodata+0x387>
 322:	72 72                	jb     396 <.rodata+0x396>
 324:	75 70                	jne    396 <.rodata+0x396>
 326:	74 20                	je     348 <.rodata+0x348>
 328:	6f                   	outsl  %ds:(%rsi),(%dx)
 329:	72 20                	jb     34b <.rodata+0x34b>
 32b:	61                   	(bad)  
 32c:	6e                   	outsb  %ds:(%rsi),(%dx)
 32d:	20 65 61             	and    %ah,0x61(%rbp)
 330:	72 6c                	jb     39e <.rodata+0x39e>
 332:	69 65 72 20 65 78 63 	imul   $0x63786520,0x72(%rbp),%esp
 339:	65 70 74             	gs jo  3b0 <.rodata+0x3b0>
 33c:	69 6f 6e 2e 0a 00 00 	imul   $0xa2e,0x6e(%rdi),%ebp
 343:	00 00                	add    %al,(%rax)
 345:	00 00                	add    %al,(%rax)
 347:	00 52 65             	add    %dl,0x65(%rdx)
 34a:	66 65 72 73          	data16 gs jb 3c1 <.rodata+0x3c1>
 34e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 352:	61                   	(bad)  
 353:	20 67 61             	and    %ah,0x61(%rdi)
 356:	74 65                	je     3bd <.rodata+0x3bd>
 358:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
 35c:	63 72 69             	movsxd 0x69(%rdx),%esi
 35f:	70 74                	jo     3d5 <.rodata+0x3d5>
 361:	6f                   	outsl  %ds:(%rsi),(%dx)
 362:	72 20                	jb     384 <.rodata+0x384>
 364:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
 36b:	49                   	rex.WB
 36c:	44 54                	rex.R push %rsp
 36e:	3b 0a                	cmp    (%rdx),%ecx
	...
 378:	52                   	push   %rdx
 379:	65 66 65 72 73       	gs data16 gs jb 3f1 <.rodata+0x3f1>
 37e:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 382:	61                   	(bad)  
 383:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
 387:	63 72 69             	movsxd 0x69(%rdx),%esi
 38a:	70 74                	jo     400 <.rodata+0x400>
 38c:	6f                   	outsl  %ds:(%rsi),(%dx)
 38d:	72 20                	jb     3af <.rodata+0x3af>
 38f:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
 396:	47                   	rex.RXB
 397:	44 54                	rex.R push %rsp
 399:	20 6f 72             	and    %ch,0x72(%rdi)
 39c:	20 74 68 65          	and    %dh,0x65(%rax,%rbp,2)
 3a0:	20 63 75             	and    %ah,0x75(%rbx)
 3a3:	72 72                	jb     417 <.rodata+0x417>
 3a5:	65 6e                	outsb  %gs:(%rsi),(%dx)
 3a7:	74 20                	je     3c9 <.rodata+0x3c9>
 3a9:	4c                   	rex.WR
 3aa:	44 54                	rex.R push %rsp
 3ac:	3b 0a                	cmp    (%rdx),%ecx
 3ae:	00 00                	add    %al,(%rax)
 3b0:	52                   	push   %rdx
 3b1:	65 66 65 72 73       	gs data16 gs jb 429 <.rodata+0x429>
 3b6:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 3ba:	61                   	(bad)  
 3bb:	20 73 65             	and    %dh,0x65(%rbx)
 3be:	67 6d                	insl   (%dx),%es:(%edi)
 3c0:	65 6e                	outsb  %gs:(%rsi),(%dx)
 3c2:	74 20                	je     3e4 <.rodata+0x3e4>
 3c4:	6f                   	outsl  %ds:(%rsi),(%dx)
 3c5:	72 20                	jb     3e7 <.rodata+0x3e7>
 3c7:	67 61                	addr32 (bad) 
 3c9:	74 65                	je     430 <.rodata+0x430>
 3cb:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
 3cf:	63 72 69             	movsxd 0x69(%rdx),%esi
 3d2:	70 74                	jo     448 <.rodata+0x448>
 3d4:	6f                   	outsl  %ds:(%rsi),(%dx)
 3d5:	72 20                	jb     3f7 <.rodata+0x3f7>
 3d7:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
 3de:	4c                   	rex.WR
 3df:	44 54                	rex.R push %rsp
 3e1:	3b 0a                	cmp    (%rdx),%ecx
 3e3:	00 00                	add    %al,(%rax)
 3e5:	00 00                	add    %al,(%rax)
 3e7:	00 52 65             	add    %dl,0x65(%rdx)
 3ea:	66 65 72 73          	data16 gs jb 461 <.rodata+0x461>
 3ee:	20 74 6f 20          	and    %dh,0x20(%rdi,%rbp,2)
 3f2:	61                   	(bad)  
 3f3:	20 64 65 73          	and    %ah,0x73(%rbp,%riz,2)
 3f7:	63 72 69             	movsxd 0x69(%rdx),%esi
 3fa:	70 74                	jo     470 <.rodata+0x470>
 3fc:	6f                   	outsl  %ds:(%rsi),(%dx)
 3fd:	72 20                	jb     41f <.rodata+0x41f>
 3ff:	69 6e 20 74 68 65 20 	imul   $0x20656874,0x20(%rsi),%ebp
 406:	63 75 72             	movsxd 0x72(%rbp),%esi
 409:	72 65                	jb     470 <.rodata+0x470>
 40b:	6e                   	outsb  %ds:(%rsi),(%dx)
 40c:	74 20                	je     42e <.rodata+0x42e>
 40e:	47                   	rex.RXB
 40f:	44 54                	rex.R push %rsp
 411:	3b 0a                	cmp    (%rdx),%ecx
 413:	00 00                	add    %al,(%rax)
 415:	00 00                	add    %al,(%rax)
 417:	00 53 65             	add    %dl,0x65(%rbx)
 41a:	67 6d                	insl   (%dx),%es:(%edi)
 41c:	65 6e                	outsb  %gs:(%rsi),(%dx)
 41e:	74 20                	je     440 <.rodata+0x440>
 420:	53                   	push   %rbx
 421:	65 6c                	gs insb (%dx),%es:(%rdi)
 423:	65 63 74 6f 72       	movsxd %gs:0x72(%rdi,%rbp,2),%esi
 428:	20 49 6e             	and    %cl,0x6e(%rcx)
 42b:	64 65 78 3a          	fs gs js 469 <.rodata+0x469>
 42f:	25 23 30 31 30       	and    $0x30313023,%eax
 434:	78 0a                	js     440 <.rodata+0x440>
 436:	00 00                	add    %al,(%rax)
 438:	64 6f                	outsl  %fs:(%rsi),(%dx)
 43a:	5f                   	pop    %rdi
 43b:	73 65                	jae    4a2 <.rodata+0x4a2>
 43d:	67 6d                	insl   (%dx),%es:(%edi)
 43f:	65 6e                	outsb  %gs:(%rsi),(%dx)
 441:	74 5f                	je     4a2 <.rodata+0x4a2>
 443:	6e                   	outsb  %ds:(%rsi),(%dx)
 444:	6f                   	outsl  %ds:(%rsi),(%dx)
 445:	74 5f                	je     4a6 <.rodata+0x4a6>
 447:	70 72                	jo     4bb <.rodata+0x4bb>
 449:	65 73 65             	gs jae 4b1 <.rodata+0x4b1>
 44c:	6e                   	outsb  %ds:(%rsi),(%dx)
 44d:	74 28                	je     477 <.rodata+0x477>
 44f:	31 31                	xor    %esi,(%rcx)
 451:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 458:	5f                   	pop    %rdi
 459:	43                   	rex.XB
 45a:	4f                   	rex.WRXB
 45b:	44                   	rex.R
 45c:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313486 <Pos+0x38312486>
 463:	6c                   	insb   (%dx),%es:(%rdi)
 464:	78 2c                	js     492 <.rodata+0x492>
 466:	52                   	push   %rdx
 467:	53                   	push   %rbx
 468:	50                   	push   %rax
 469:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313492 <Pos+0x38312492>
 46f:	6c                   	insb   (%dx),%es:(%rdi)
 470:	78 2c                	js     49e <.rodata+0x49e>
 472:	52                   	push   %rdx
 473:	49 50                	rex.WB push %r8
 475:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831349e <Pos+0x3831249e>
 47b:	6c                   	insb   (%dx),%es:(%rdi)
 47c:	78 0a                	js     488 <.rodata+0x488>
 47e:	00 00                	add    %al,(%rax)
 480:	64 6f                	outsl  %fs:(%rsi),(%dx)
 482:	5f                   	pop    %rdi
 483:	73 74                	jae    4f9 <.rodata+0x4f9>
 485:	61                   	(bad)  
 486:	63 6b 5f             	movsxd 0x5f(%rbx),%ebp
 489:	73 65                	jae    4f0 <.rodata+0x4f0>
 48b:	67 6d                	insl   (%dx),%es:(%edi)
 48d:	65 6e                	outsb  %gs:(%rsi),(%dx)
 48f:	74 5f                	je     4f0 <.rodata+0x4f0>
 491:	66 61                	data16 (bad) 
 493:	75 6c                	jne    501 <.rodata+0x501>
 495:	74 28                	je     4bf <.rodata+0x4bf>
 497:	31 32                	xor    %esi,(%rdx)
 499:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 4a0:	5f                   	pop    %rdi
 4a1:	43                   	rex.XB
 4a2:	4f                   	rex.WRXB
 4a3:	44                   	rex.R
 4a4:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383134ce <Pos+0x383124ce>
 4ab:	6c                   	insb   (%dx),%es:(%rdi)
 4ac:	78 2c                	js     4da <.rodata+0x4da>
 4ae:	52                   	push   %rdx
 4af:	53                   	push   %rbx
 4b0:	50                   	push   %rax
 4b1:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383134da <Pos+0x383124da>
 4b7:	6c                   	insb   (%dx),%es:(%rdi)
 4b8:	78 2c                	js     4e6 <.rodata+0x4e6>
 4ba:	52                   	push   %rdx
 4bb:	49 50                	rex.WB push %r8
 4bd:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383134e6 <Pos+0x383124e6>
 4c3:	6c                   	insb   (%dx),%es:(%rdi)
 4c4:	78 0a                	js     4d0 <.rodata+0x4d0>
 4c6:	00 00                	add    %al,(%rax)
 4c8:	64 6f                	outsl  %fs:(%rsi),(%dx)
 4ca:	5f                   	pop    %rdi
 4cb:	67 65 6e             	outsb  %gs:(%esi),(%dx)
 4ce:	65 72 61             	gs jb  532 <.rodata+0x532>
 4d1:	6c                   	insb   (%dx),%es:(%rdi)
 4d2:	5f                   	pop    %rdi
 4d3:	70 72                	jo     547 <.rodata+0x547>
 4d5:	6f                   	outsl  %ds:(%rsi),(%dx)
 4d6:	74 65                	je     53d <.rodata+0x53d>
 4d8:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
 4dc:	6e                   	outsb  %ds:(%rsi),(%dx)
 4dd:	28 31                	sub    %dh,(%rcx)
 4df:	33 29                	xor    (%rcx),%ebp
 4e1:	2c 45                	sub    $0x45,%al
 4e3:	52                   	push   %rdx
 4e4:	52                   	push   %rdx
 4e5:	4f 52                	rex.WRXB push %r10
 4e7:	5f                   	pop    %rdi
 4e8:	43                   	rex.XB
 4e9:	4f                   	rex.WRXB
 4ea:	44                   	rex.R
 4eb:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313515 <Pos+0x38312515>
 4f2:	6c                   	insb   (%dx),%es:(%rdi)
 4f3:	78 2c                	js     521 <.rodata+0x521>
 4f5:	52                   	push   %rdx
 4f6:	53                   	push   %rbx
 4f7:	50                   	push   %rax
 4f8:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313521 <Pos+0x38312521>
 4fe:	6c                   	insb   (%dx),%es:(%rdi)
 4ff:	78 2c                	js     52d <.rodata+0x52d>
 501:	52                   	push   %rdx
 502:	49 50                	rex.WB push %r8
 504:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831352d <Pos+0x3831252d>
 50a:	6c                   	insb   (%dx),%es:(%rdi)
 50b:	78 0a                	js     517 <.rodata+0x517>
 50d:	00 00                	add    %al,(%rax)
 50f:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
 513:	70 61                	jo     576 <.rodata+0x576>
 515:	67 65 5f             	addr32 gs pop %rdi
 518:	66 61                	data16 (bad) 
 51a:	75 6c                	jne    588 <.rodata+0x588>
 51c:	74 28                	je     546 <.rodata+0x546>
 51e:	31 34 29             	xor    %esi,(%rcx,%rbp,1)
 521:	2c 45                	sub    $0x45,%al
 523:	52                   	push   %rdx
 524:	52                   	push   %rdx
 525:	4f 52                	rex.WRXB push %r10
 527:	5f                   	pop    %rdi
 528:	43                   	rex.XB
 529:	4f                   	rex.WRXB
 52a:	44                   	rex.R
 52b:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313555 <Pos+0x38312555>
 532:	6c                   	insb   (%dx),%es:(%rdi)
 533:	78 2c                	js     561 <.rodata+0x561>
 535:	52                   	push   %rdx
 536:	53                   	push   %rbx
 537:	50                   	push   %rax
 538:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313561 <Pos+0x38312561>
 53e:	6c                   	insb   (%dx),%es:(%rdi)
 53f:	78 2c                	js     56d <.rodata+0x56d>
 541:	52                   	push   %rdx
 542:	49 50                	rex.WB push %r8
 544:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831356d <Pos+0x3831256d>
 54a:	6c                   	insb   (%dx),%es:(%rdi)
 54b:	78 0a                	js     557 <.rodata+0x557>
 54d:	00 50 61             	add    %dl,0x61(%rax)
 550:	67 65 20 4e 6f       	and    %cl,%gs:0x6f(%esi)
 555:	74 2d                	je     584 <.rodata+0x584>
 557:	50                   	push   %rax
 558:	72 65                	jb     5bf <.rodata+0x5bf>
 55a:	73 65                	jae    5c1 <.rodata+0x5c1>
 55c:	6e                   	outsb  %ds:(%rsi),(%dx)
 55d:	74 2c                	je     58b <.rodata+0x58b>
 55f:	09 00                	or     %eax,(%rax)
 561:	57                   	push   %rdi
 562:	72 69                	jb     5cd <.rodata+0x5cd>
 564:	74 65                	je     5cb <.rodata+0x5cb>
 566:	20 43 61             	and    %al,0x61(%rbx)
 569:	75 73                	jne    5de <.rodata+0x5de>
 56b:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
 56f:	75 6c                	jne    5dd <.rodata+0x5dd>
 571:	74 2c                	je     59f <.rodata+0x59f>
 573:	09 00                	or     %eax,(%rax)
 575:	52                   	push   %rdx
 576:	65 61                	gs (bad) 
 578:	64 20 43 61          	and    %al,%fs:0x61(%rbx)
 57c:	75 73                	jne    5f1 <.rodata+0x5f1>
 57e:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
 582:	75 6c                	jne    5f0 <.rodata+0x5f0>
 584:	74 2c                	je     5b2 <.rodata+0x5b2>
 586:	09 00                	or     %eax,(%rax)
 588:	46 61                	rex.RX (bad) 
 58a:	75 6c                	jne    5f8 <.rodata+0x5f8>
 58c:	74 20                	je     5ae <.rodata+0x5ae>
 58e:	69 6e 20 75 73 65 72 	imul   $0x72657375,0x20(%rsi),%ebp
 595:	28 33                	sub    %dh,(%rbx)
 597:	29 09                	sub    %ecx,(%rcx)
 599:	00 46 61             	add    %al,0x61(%rsi)
 59c:	75 6c                	jne    60a <.rodata+0x60a>
 59e:	74 20                	je     5c0 <.rodata+0x5c0>
 5a0:	69 6e 20 73 75 70 65 	imul   $0x65707573,0x20(%rsi),%ebp
 5a7:	72 76                	jb     61f <.rodata+0x61f>
 5a9:	69 73 6f 72 28 30 2c 	imul   $0x2c302872,0x6f(%rbx),%esi
 5b0:	31 2c 32             	xor    %ebp,(%rdx,%rsi,1)
 5b3:	29 09                	sub    %ecx,(%rcx)
 5b5:	00 2c 52             	add    %ch,(%rdx,%rdx,2)
 5b8:	65 73 65             	gs jae 620 <.rodata+0x620>
 5bb:	72 76                	jb     633 <.rodata+0x633>
 5bd:	65 64 20 42 69       	gs and %al,%fs:0x69(%rdx)
 5c2:	74 20                	je     5e4 <.rodata+0x5e4>
 5c4:	43 61                	rex.XB (bad) 
 5c6:	75 73                	jne    63b <.rodata+0x63b>
 5c8:	65 20 46 61          	and    %al,%gs:0x61(%rsi)
 5cc:	75 6c                	jne    63a <.rodata+0x63a>
 5ce:	74 09                	je     5d9 <.rodata+0x5d9>
	...
 5d8:	2c 49                	sub    $0x49,%al
 5da:	6e                   	outsb  %ds:(%rsi),(%dx)
 5db:	73 74                	jae    651 <.rodata+0x651>
 5dd:	72 75                	jb     654 <.rodata+0x654>
 5df:	63 74 69 6f          	movsxd 0x6f(%rcx,%rbp,2),%esi
 5e3:	6e                   	outsb  %ds:(%rsi),(%dx)
 5e4:	20 66 65             	and    %ah,0x65(%rsi)
 5e7:	74 63                	je     64c <.rodata+0x64c>
 5e9:	68 20 43 61 75       	pushq  $0x75614320
 5ee:	73 65                	jae    655 <.rodata+0x655>
 5f0:	20 46 61             	and    %al,0x61(%rsi)
 5f3:	75 6c                	jne    661 <.rodata+0x661>
 5f5:	74 00                	je     5f7 <.rodata+0x5f7>
 5f7:	0a 00                	or     (%rax),%al
 5f9:	43 52                	rex.XB push %r10
 5fb:	32 3a                	xor    (%rdx),%bh
 5fd:	25 23 30 31 38       	and    $0x38313023,%eax
 602:	6c                   	insb   (%dx),%es:(%rdi)
 603:	78 0a                	js     60f <.rodata+0x60f>
 605:	00 00                	add    %al,(%rax)
 607:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
 60b:	78 38                	js     645 <.rodata+0x645>
 60d:	37                   	(bad)  
 60e:	5f                   	pop    %rdi
 60f:	46 50                	rex.RX push %rax
 611:	55                   	push   %rbp
 612:	5f                   	pop    %rdi
 613:	65 72 72             	gs jb  688 <.rodata+0x688>
 616:	6f                   	outsl  %ds:(%rsi),(%dx)
 617:	72 28                	jb     641 <.rodata+0x641>
 619:	31 36                	xor    %esi,(%rsi)
 61b:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 622:	5f                   	pop    %rdi
 623:	43                   	rex.XB
 624:	4f                   	rex.WRXB
 625:	44                   	rex.R
 626:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313650 <Pos+0x38312650>
 62d:	6c                   	insb   (%dx),%es:(%rdi)
 62e:	78 2c                	js     65c <.rodata+0x65c>
 630:	52                   	push   %rdx
 631:	53                   	push   %rbx
 632:	50                   	push   %rax
 633:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 3831365c <Pos+0x3831265c>
 639:	6c                   	insb   (%dx),%es:(%rdi)
 63a:	78 2c                	js     668 <.rodata+0x668>
 63c:	52                   	push   %rdx
 63d:	49 50                	rex.WB push %r8
 63f:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313668 <Pos+0x38312668>
 645:	6c                   	insb   (%dx),%es:(%rdi)
 646:	78 0a                	js     652 <.rodata+0x652>
	...
 650:	64 6f                	outsl  %fs:(%rsi),(%dx)
 652:	5f                   	pop    %rdi
 653:	61                   	(bad)  
 654:	6c                   	insb   (%dx),%es:(%rdi)
 655:	69 67 6e 6d 65 6e 74 	imul   $0x746e656d,0x6e(%rdi),%esp
 65c:	5f                   	pop    %rdi
 65d:	63 68 65             	movsxd 0x65(%rax),%ebp
 660:	63 6b 28             	movsxd 0x28(%rbx),%ebp
 663:	31 37                	xor    %esi,(%rdi)
 665:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 66c:	5f                   	pop    %rdi
 66d:	43                   	rex.XB
 66e:	4f                   	rex.WRXB
 66f:	44                   	rex.R
 670:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831369a <Pos+0x3831269a>
 677:	6c                   	insb   (%dx),%es:(%rdi)
 678:	78 2c                	js     6a6 <.rodata+0x6a6>
 67a:	52                   	push   %rdx
 67b:	53                   	push   %rbx
 67c:	50                   	push   %rax
 67d:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383136a6 <Pos+0x383126a6>
 683:	6c                   	insb   (%dx),%es:(%rdi)
 684:	78 2c                	js     6b2 <.rodata+0x6b2>
 686:	52                   	push   %rdx
 687:	49 50                	rex.WB push %r8
 689:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383136b2 <Pos+0x383126b2>
 68f:	6c                   	insb   (%dx),%es:(%rdi)
 690:	78 0a                	js     69c <.rodata+0x69c>
 692:	00 00                	add    %al,(%rax)
 694:	00 00                	add    %al,(%rax)
 696:	00 00                	add    %al,(%rax)
 698:	64 6f                	outsl  %fs:(%rsi),(%dx)
 69a:	5f                   	pop    %rdi
 69b:	6d                   	insl   (%dx),%es:(%rdi)
 69c:	61                   	(bad)  
 69d:	63 68 69             	movsxd 0x69(%rax),%ebp
 6a0:	6e                   	outsb  %ds:(%rsi),(%dx)
 6a1:	65 5f                	gs pop %rdi
 6a3:	63 68 65             	movsxd 0x65(%rax),%ebp
 6a6:	63 6b 28             	movsxd 0x28(%rbx),%ebp
 6a9:	31 38                	xor    %edi,(%rax)
 6ab:	29 2c 45 52 52 4f 52 	sub    %ebp,0x524f5252(,%rax,2)
 6b2:	5f                   	pop    %rdi
 6b3:	43                   	rex.XB
 6b4:	4f                   	rex.WRXB
 6b5:	44                   	rex.R
 6b6:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 383136e0 <Pos+0x383126e0>
 6bd:	6c                   	insb   (%dx),%es:(%rdi)
 6be:	78 2c                	js     6ec <.rodata+0x6ec>
 6c0:	52                   	push   %rdx
 6c1:	53                   	push   %rbx
 6c2:	50                   	push   %rax
 6c3:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383136ec <Pos+0x383126ec>
 6c9:	6c                   	insb   (%dx),%es:(%rdi)
 6ca:	78 2c                	js     6f8 <.rodata+0x6f8>
 6cc:	52                   	push   %rdx
 6cd:	49 50                	rex.WB push %r8
 6cf:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 383136f8 <Pos+0x383126f8>
 6d5:	6c                   	insb   (%dx),%es:(%rdi)
 6d6:	78 0a                	js     6e2 <.rodata+0x6e2>
	...
 6e0:	64 6f                	outsl  %fs:(%rsi),(%dx)
 6e2:	5f                   	pop    %rdi
 6e3:	53                   	push   %rbx
 6e4:	49                   	rex.WB
 6e5:	4d                   	rex.WRB
 6e6:	44 5f                	rex.R pop %rdi
 6e8:	65 78 63             	gs js  74e <.rodata+0x74e>
 6eb:	65 70 74             	gs jo  762 <.rodata+0x762>
 6ee:	69 6f 6e 28 31 39 29 	imul   $0x29393128,0x6e(%rdi),%ebp
 6f5:	2c 45                	sub    $0x45,%al
 6f7:	52                   	push   %rdx
 6f8:	52                   	push   %rdx
 6f9:	4f 52                	rex.WRXB push %r10
 6fb:	5f                   	pop    %rdi
 6fc:	43                   	rex.XB
 6fd:	4f                   	rex.WRXB
 6fe:	44                   	rex.R
 6ff:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 38313729 <Pos+0x38312729>
 706:	6c                   	insb   (%dx),%es:(%rdi)
 707:	78 2c                	js     735 <.rodata+0x735>
 709:	52                   	push   %rdx
 70a:	53                   	push   %rbx
 70b:	50                   	push   %rax
 70c:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313735 <Pos+0x38312735>
 712:	6c                   	insb   (%dx),%es:(%rdi)
 713:	78 2c                	js     741 <.rodata+0x741>
 715:	52                   	push   %rdx
 716:	49 50                	rex.WB push %r8
 718:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313741 <Pos+0x38312741>
 71e:	6c                   	insb   (%dx),%es:(%rdi)
 71f:	78 0a                	js     72b <.rodata+0x72b>
 721:	00 00                	add    %al,(%rax)
 723:	00 00                	add    %al,(%rax)
 725:	00 00                	add    %al,(%rax)
 727:	00 64 6f 5f          	add    %ah,0x5f(%rdi,%rbp,2)
 72b:	76 69                	jbe    796 <do_segment_not_present+0x18>
 72d:	72 74                	jb     7a3 <do_segment_not_present+0x25>
 72f:	75 61                	jne    792 <do_segment_not_present+0x14>
 731:	6c                   	insb   (%dx),%es:(%rdi)
 732:	69 7a 61 74 69 6f 6e 	imul   $0x6e6f6974,0x61(%rdx),%edi
 739:	5f                   	pop    %rdi
 73a:	65 78 63             	gs js  7a0 <do_segment_not_present+0x22>
 73d:	65 70 74             	gs jo  7b4 <do_segment_not_present+0x36>
 740:	69 6f 6e 28 32 30 29 	imul   $0x29303228,0x6e(%rdi),%ebp
 747:	2c 45                	sub    $0x45,%al
 749:	52                   	push   %rdx
 74a:	52                   	push   %rdx
 74b:	4f 52                	rex.WRXB push %r10
 74d:	5f                   	pop    %rdi
 74e:	43                   	rex.XB
 74f:	4f                   	rex.WRXB
 750:	44                   	rex.R
 751:	45 3a 25 23 30 31 38 	cmp    0x38313023(%rip),%r12b        # 3831377b <Pos+0x3831277b>
 758:	6c                   	insb   (%dx),%es:(%rdi)
 759:	78 2c                	js     787 <do_segment_not_present+0x9>
 75b:	52                   	push   %rdx
 75c:	53                   	push   %rbx
 75d:	50                   	push   %rax
 75e:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313787 <Pos+0x38312787>
 764:	6c                   	insb   (%dx),%es:(%rdi)
 765:	78 2c                	js     793 <do_segment_not_present+0x15>
 767:	52                   	push   %rdx
 768:	49 50                	rex.WB push %r8
 76a:	3a 25 23 30 31 38    	cmp    0x38313023(%rip),%ah        # 38313793 <Pos+0x38312793>
 770:	6c                   	insb   (%dx),%es:(%rdi)
 771:	78 0a                	js     77d <do_invalid_TSS+0x179>
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
  24:	8f 00                	popq   (%rax)
  26:	00 00                	add    %al,(%rax)
  28:	00 41 0e             	add    %al,0xe(%rcx)
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
  37:	00 1c 00             	add    %bl,(%rax,%rax,1)
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	8f 00                	popq   (%rax)
  46:	00 00                	add    %al,(%rax)
  48:	00 41 0e             	add    %al,0xe(%rcx)
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	02 8a 0c 07 08 00    	add    0x8070c(%rdx),%cl
  57:	00 1c 00             	add    %bl,(%rax,%rax,1)
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
  97:	00 18                	add    %bl,(%rax)
  99:	00 00                	add    %al,(%rax)
  9b:	00 9c 00 00 00 00 00 	add    %bl,0x0(%rax,%rax,1)
  a2:	00 00                	add    %al,(%rax)
  a4:	5b                   	pop    %rbx
  a5:	00 00                	add    %al,(%rax)
  a7:	00 00                	add    %al,(%rax)
  a9:	41 0e                	rex.B (bad) 
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	00 00                	add    %al,(%rax)
  b3:	00 18                	add    %bl,(%rax)
  b5:	00 00                	add    %al,(%rax)
  b7:	00 b8 00 00 00 00    	add    %bh,0x0(%rax)
  bd:	00 00                	add    %al,(%rax)
  bf:	00 5b 00             	add    %bl,0x0(%rbx)
  c2:	00 00                	add    %al,(%rax)
  c4:	00 41 0e             	add    %al,0xe(%rcx)
  c7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  cd:	00 00                	add    %al,(%rax)
  cf:	00 18                	add    %bl,(%rax)
  d1:	00 00                	add    %al,(%rax)
  d3:	00 d4                	add    %dl,%ah
  d5:	00 00                	add    %al,(%rax)
  d7:	00 00                	add    %al,(%rax)
  d9:	00 00                	add    %al,(%rax)
  db:	00 5b 00             	add    %bl,0x0(%rbx)
  de:	00 00                	add    %al,(%rax)
  e0:	00 41 0e             	add    %al,0xe(%rcx)
  e3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  e9:	00 00                	add    %al,(%rax)
  eb:	00 18                	add    %bl,(%rax)
  ed:	00 00                	add    %al,(%rax)
  ef:	00 f0                	add    %dh,%al
  f1:	00 00                	add    %al,(%rax)
  f3:	00 00                	add    %al,(%rax)
  f5:	00 00                	add    %al,(%rax)
  f7:	00 5b 00             	add    %bl,0x0(%rbx)
  fa:	00 00                	add    %al,(%rax)
  fc:	00 41 0e             	add    %al,0xe(%rcx)
  ff:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 105:	00 00                	add    %al,(%rax)
 107:	00 18                	add    %bl,(%rax)
 109:	00 00                	add    %al,(%rax)
 10b:	00 0c 01             	add    %cl,(%rcx,%rax,1)
 10e:	00 00                	add    %al,(%rax)
 110:	00 00                	add    %al,(%rax)
 112:	00 00                	add    %al,(%rax)
 114:	5b                   	pop    %rbx
 115:	00 00                	add    %al,(%rax)
 117:	00 00                	add    %al,(%rax)
 119:	41 0e                	rex.B (bad) 
 11b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 121:	00 00                	add    %al,(%rax)
 123:	00 18                	add    %bl,(%rax)
 125:	00 00                	add    %al,(%rax)
 127:	00 28                	add    %ch,(%rax)
 129:	01 00                	add    %eax,(%rax)
 12b:	00 00                	add    %al,(%rax)
 12d:	00 00                	add    %al,(%rax)
 12f:	00 5b 00             	add    %bl,0x0(%rbx)
 132:	00 00                	add    %al,(%rax)
 134:	00 41 0e             	add    %al,0xe(%rcx)
 137:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 13d:	00 00                	add    %al,(%rax)
 13f:	00 18                	add    %bl,(%rax)
 141:	00 00                	add    %al,(%rax)
 143:	00 44 01 00          	add    %al,0x0(%rcx,%rax,1)
 147:	00 00                	add    %al,(%rax)
 149:	00 00                	add    %al,(%rax)
 14b:	00 5b 00             	add    %bl,0x0(%rbx)
 14e:	00 00                	add    %al,(%rax)
 150:	00 41 0e             	add    %al,0xe(%rcx)
 153:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 159:	00 00                	add    %al,(%rax)
 15b:	00 18                	add    %bl,(%rax)
 15d:	00 00                	add    %al,(%rax)
 15f:	00 60 01             	add    %ah,0x1(%rax)
 162:	00 00                	add    %al,(%rax)
 164:	00 00                	add    %al,(%rax)
 166:	00 00                	add    %al,(%rax)
 168:	5b                   	pop    %rbx
 169:	00 00                	add    %al,(%rax)
 16b:	00 00                	add    %al,(%rax)
 16d:	41 0e                	rex.B (bad) 
 16f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 175:	00 00                	add    %al,(%rax)
 177:	00 18                	add    %bl,(%rax)
 179:	00 00                	add    %al,(%rax)
 17b:	00 7c 01 00          	add    %bh,0x0(%rcx,%rax,1)
 17f:	00 00                	add    %al,(%rax)
 181:	00 00                	add    %al,(%rax)
 183:	00 5b 00             	add    %bl,0x0(%rbx)
 186:	00 00                	add    %al,(%rax)
 188:	00 41 0e             	add    %al,0xe(%rcx)
 18b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 191:	00 00                	add    %al,(%rax)
 193:	00 18                	add    %bl,(%rax)
 195:	00 00                	add    %al,(%rax)
 197:	00 98 01 00 00 00    	add    %bl,0x1(%rax)
 19d:	00 00                	add    %al,(%rax)
 19f:	00 5b 00             	add    %bl,0x0(%rbx)
 1a2:	00 00                	add    %al,(%rax)
 1a4:	00 41 0e             	add    %al,0xe(%rcx)
 1a7:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1ad:	00 00                	add    %al,(%rax)
 1af:	00 18                	add    %bl,(%rax)
 1b1:	00 00                	add    %al,(%rax)
 1b3:	00 b4 01 00 00 00 00 	add    %dh,0x0(%rcx,%rax,1)
 1ba:	00 00                	add    %al,(%rax)
 1bc:	7a 01                	jp     1bf <.eh_frame+0x1bf>
 1be:	00 00                	add    %al,(%rax)
 1c0:	00 41 0e             	add    %al,0xe(%rcx)
 1c3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1c9:	00 00                	add    %al,(%rax)
 1cb:	00 18                	add    %bl,(%rax)
 1cd:	00 00                	add    %al,(%rax)
 1cf:	00 d0                	add    %dl,%al
 1d1:	01 00                	add    %eax,(%rax)
 1d3:	00 00                	add    %al,(%rax)
 1d5:	00 00                	add    %al,(%rax)
 1d7:	00 7a 01             	add    %bh,0x1(%rdx)
 1da:	00 00                	add    %al,(%rax)
 1dc:	00 41 0e             	add    %al,0xe(%rcx)
 1df:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 1e5:	00 00                	add    %al,(%rax)
 1e7:	00 18                	add    %bl,(%rax)
 1e9:	00 00                	add    %al,(%rax)
 1eb:	00 ec                	add    %ch,%ah
 1ed:	01 00                	add    %eax,(%rax)
 1ef:	00 00                	add    %al,(%rax)
 1f1:	00 00                	add    %al,(%rax)
 1f3:	00 7a 01             	add    %bh,0x1(%rdx)
 1f6:	00 00                	add    %al,(%rax)
 1f8:	00 41 0e             	add    %al,0xe(%rcx)
 1fb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 201:	00 00                	add    %al,(%rax)
 203:	00 18                	add    %bl,(%rax)
 205:	00 00                	add    %al,(%rax)
 207:	00 08                	add    %cl,(%rax)
 209:	02 00                	add    (%rax),%al
 20b:	00 00                	add    %al,(%rax)
 20d:	00 00                	add    %al,(%rax)
 20f:	00 7a 01             	add    %bh,0x1(%rdx)
 212:	00 00                	add    %al,(%rax)
 214:	00 41 0e             	add    %al,0xe(%rcx)
 217:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 21d:	00 00                	add    %al,(%rax)
 21f:	00 18                	add    %bl,(%rax)
 221:	00 00                	add    %al,(%rax)
 223:	00 24 02             	add    %ah,(%rdx,%rax,1)
 226:	00 00                	add    %al,(%rax)
 228:	00 00                	add    %al,(%rax)
 22a:	00 00                	add    %al,(%rax)
 22c:	ff 01                	incl   (%rcx)
 22e:	00 00                	add    %al,(%rax)
 230:	00 41 0e             	add    %al,0xe(%rcx)
 233:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 239:	00 00                	add    %al,(%rax)
 23b:	00 18                	add    %bl,(%rax)
 23d:	00 00                	add    %al,(%rax)
 23f:	00 40 02             	add    %al,0x2(%rax)
 242:	00 00                	add    %al,(%rax)
 244:	00 00                	add    %al,(%rax)
 246:	00 00                	add    %al,(%rax)
 248:	5b                   	pop    %rbx
 249:	00 00                	add    %al,(%rax)
 24b:	00 00                	add    %al,(%rax)
 24d:	41 0e                	rex.B (bad) 
 24f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 255:	00 00                	add    %al,(%rax)
 257:	00 18                	add    %bl,(%rax)
 259:	00 00                	add    %al,(%rax)
 25b:	00 5c 02 00          	add    %bl,0x0(%rdx,%rax,1)
 25f:	00 00                	add    %al,(%rax)
 261:	00 00                	add    %al,(%rax)
 263:	00 5b 00             	add    %bl,0x0(%rbx)
 266:	00 00                	add    %al,(%rax)
 268:	00 41 0e             	add    %al,0xe(%rcx)
 26b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 271:	00 00                	add    %al,(%rax)
 273:	00 18                	add    %bl,(%rax)
 275:	00 00                	add    %al,(%rax)
 277:	00 78 02             	add    %bh,0x2(%rax)
 27a:	00 00                	add    %al,(%rax)
 27c:	00 00                	add    %al,(%rax)
 27e:	00 00                	add    %al,(%rax)
 280:	5b                   	pop    %rbx
 281:	00 00                	add    %al,(%rax)
 283:	00 00                	add    %al,(%rax)
 285:	41 0e                	rex.B (bad) 
 287:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 28d:	00 00                	add    %al,(%rax)
 28f:	00 18                	add    %bl,(%rax)
 291:	00 00                	add    %al,(%rax)
 293:	00 94 02 00 00 00 00 	add    %dl,0x0(%rdx,%rax,1)
 29a:	00 00                	add    %al,(%rax)
 29c:	5b                   	pop    %rbx
 29d:	00 00                	add    %al,(%rax)
 29f:	00 00                	add    %al,(%rax)
 2a1:	41 0e                	rex.B (bad) 
 2a3:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 2a9:	00 00                	add    %al,(%rax)
 2ab:	00 18                	add    %bl,(%rax)
 2ad:	00 00                	add    %al,(%rax)
 2af:	00 b0 02 00 00 00    	add    %dh,0x2(%rax)
 2b5:	00 00                	add    %al,(%rax)
 2b7:	00 5b 00             	add    %bl,0x0(%rbx)
 2ba:	00 00                	add    %al,(%rax)
 2bc:	00 41 0e             	add    %al,0xe(%rcx)
 2bf:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 2c5:	00 00                	add    %al,(%rax)
 2c7:	00 1c 00             	add    %bl,(%rax,%rax,1)
 2ca:	00 00                	add    %al,(%rax)
 2cc:	cc                   	int3   
 2cd:	02 00                	add    (%rax),%al
 2cf:	00 00                	add    %al,(%rax)
 2d1:	00 00                	add    %al,(%rax)
 2d3:	00 87 02 00 00 00    	add    %al,0x2(%rdi)
 2d9:	41 0e                	rex.B (bad) 
 2db:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
 2e1:	03 82 02 0c 07 08    	add    0x8070c02(%rdx),%eax
	...
