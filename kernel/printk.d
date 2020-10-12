
printk.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <strlen>:
       0:	55                   	push   %rbp
       1:	48 89 e5             	mov    %rsp,%rbp
       4:	53                   	push   %rbx
       5:	48 89 7d f0          	mov    %rdi,-0x10(%rbp)
       9:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
       d:	b8 00 00 00 00       	mov    $0x0,%eax
      12:	ba ff ff ff ff       	mov    $0xffffffff,%edx
      17:	89 d1                	mov    %edx,%ecx
      19:	48 89 f7             	mov    %rsi,%rdi
      1c:	fc                   	cld    
      1d:	f2 ae                	repnz scas %es:(%rdi),%al
      1f:	f7 d1                	not    %ecx
      21:	ff c9                	dec    %ecx
      23:	89 ca                	mov    %ecx,%edx
      25:	89 d3                	mov    %edx,%ebx
      27:	89 d8                	mov    %ebx,%eax
      29:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
      2d:	c9                   	leaveq 
      2e:	c3                   	retq   

000000000000002f <putchar>:
      2f:	55                   	push   %rbp
      30:	48 89 e5             	mov    %rsp,%rbp
      33:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
      37:	89 75 d4             	mov    %esi,-0x2c(%rbp)
      3a:	89 55 d0             	mov    %edx,-0x30(%rbp)
      3d:	89 4d cc             	mov    %ecx,-0x34(%rbp)
      40:	44 89 45 c8          	mov    %r8d,-0x38(%rbp)
      44:	44 89 4d c4          	mov    %r9d,-0x3c(%rbp)
      48:	8b 45 10             	mov    0x10(%rbp),%eax
      4b:	88 45 c0             	mov    %al,-0x40(%rbp)
      4e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
      55:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
      5c:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
      63:	00 
      64:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
      6b:	00 
      6c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
      73:	0f b6 45 c0          	movzbl -0x40(%rbp),%eax
      77:	48 98                	cltq   
      79:	48 c1 e0 04          	shl    $0x4,%rax
      7d:	48 89 c2             	mov    %rax,%rdx
      80:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
      87:	00 00 00 
      8a:	48 01 d0             	add    %rdx,%rax
      8d:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
      91:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
      98:	eb 7a                	jmp    114 <putchar+0xe5>
      9a:	8b 55 cc             	mov    -0x34(%rbp),%edx
      9d:	8b 45 fc             	mov    -0x4(%rbp),%eax
      a0:	01 d0                	add    %edx,%eax
      a2:	0f af 45 d4          	imul   -0x2c(%rbp),%eax
      a6:	48 63 d0             	movslq %eax,%rdx
      a9:	8b 45 d0             	mov    -0x30(%rbp),%eax
      ac:	48 98                	cltq   
      ae:	48 01 d0             	add    %rdx,%rax
      b1:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
      b8:	00 
      b9:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
      bd:	48 01 d0             	add    %rdx,%rax
      c0:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
      c4:	c7 45 e4 00 01 00 00 	movl   $0x100,-0x1c(%rbp)
      cb:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
      d2:	eb 31                	jmp    105 <putchar+0xd6>
      d4:	d1 7d e4             	sarl   -0x1c(%rbp)
      d7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
      db:	0f b6 00             	movzbl (%rax),%eax
      de:	0f b6 c0             	movzbl %al,%eax
      e1:	23 45 e4             	and    -0x1c(%rbp),%eax
      e4:	85 c0                	test   %eax,%eax
      e6:	74 0b                	je     f3 <putchar+0xc4>
      e8:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
      ec:	8b 55 c8             	mov    -0x38(%rbp),%edx
      ef:	89 10                	mov    %edx,(%rax)
      f1:	eb 09                	jmp    fc <putchar+0xcd>
      f3:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
      f7:	8b 55 c4             	mov    -0x3c(%rbp),%edx
      fa:	89 10                	mov    %edx,(%rax)
      fc:	48 83 45 f0 04       	addq   $0x4,-0x10(%rbp)
     101:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
     105:	83 7d f8 07          	cmpl   $0x7,-0x8(%rbp)
     109:	7e c9                	jle    d4 <putchar+0xa5>
     10b:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
     110:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     114:	83 7d fc 0f          	cmpl   $0xf,-0x4(%rbp)
     118:	7e 80                	jle    9a <putchar+0x6b>
     11a:	90                   	nop
     11b:	90                   	nop
     11c:	5d                   	pop    %rbp
     11d:	c3                   	retq   

000000000000011e <skip_atoi>:
     11e:	55                   	push   %rbp
     11f:	48 89 e5             	mov    %rsp,%rbp
     122:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
     126:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     12d:	eb 2e                	jmp    15d <skip_atoi+0x3f>
     12f:	8b 55 fc             	mov    -0x4(%rbp),%edx
     132:	89 d0                	mov    %edx,%eax
     134:	c1 e0 02             	shl    $0x2,%eax
     137:	01 d0                	add    %edx,%eax
     139:	01 c0                	add    %eax,%eax
     13b:	89 c6                	mov    %eax,%esi
     13d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     141:	48 8b 00             	mov    (%rax),%rax
     144:	48 8d 48 01          	lea    0x1(%rax),%rcx
     148:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     14c:	48 89 0a             	mov    %rcx,(%rdx)
     14f:	0f b6 00             	movzbl (%rax),%eax
     152:	0f be c0             	movsbl %al,%eax
     155:	01 f0                	add    %esi,%eax
     157:	83 e8 30             	sub    $0x30,%eax
     15a:	89 45 fc             	mov    %eax,-0x4(%rbp)
     15d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     161:	48 8b 00             	mov    (%rax),%rax
     164:	0f b6 00             	movzbl (%rax),%eax
     167:	3c 2f                	cmp    $0x2f,%al
     169:	7e 0e                	jle    179 <skip_atoi+0x5b>
     16b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
     16f:	48 8b 00             	mov    (%rax),%rax
     172:	0f b6 00             	movzbl (%rax),%eax
     175:	3c 39                	cmp    $0x39,%al
     177:	7e b6                	jle    12f <skip_atoi+0x11>
     179:	8b 45 fc             	mov    -0x4(%rbp),%eax
     17c:	5d                   	pop    %rbp
     17d:	c3                   	retq   

000000000000017e <number>:
     17e:	55                   	push   %rbp
     17f:	48 89 e5             	mov    %rsp,%rbp
     182:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
     186:	48 89 75 a0          	mov    %rsi,-0x60(%rbp)
     18a:	89 55 9c             	mov    %edx,-0x64(%rbp)
     18d:	89 4d 98             	mov    %ecx,-0x68(%rbp)
     190:	44 89 45 94          	mov    %r8d,-0x6c(%rbp)
     194:	44 89 4d 90          	mov    %r9d,-0x70(%rbp)
     198:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     19f:	00 00 00 
     1a2:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     1a6:	8b 45 90             	mov    -0x70(%rbp),%eax
     1a9:	83 e0 40             	and    $0x40,%eax
     1ac:	85 c0                	test   %eax,%eax
     1ae:	74 0e                	je     1be <number+0x40>
     1b0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     1b7:	00 00 00 
     1ba:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     1be:	8b 45 90             	mov    -0x70(%rbp),%eax
     1c1:	83 e0 10             	and    $0x10,%eax
     1c4:	85 c0                	test   %eax,%eax
     1c6:	74 04                	je     1cc <number+0x4e>
     1c8:	83 65 90 fe          	andl   $0xfffffffe,-0x70(%rbp)
     1cc:	83 7d 9c 01          	cmpl   $0x1,-0x64(%rbp)
     1d0:	7e 06                	jle    1d8 <number+0x5a>
     1d2:	83 7d 9c 24          	cmpl   $0x24,-0x64(%rbp)
     1d6:	7e 0a                	jle    1e2 <number+0x64>
     1d8:	b8 00 00 00 00       	mov    $0x0,%eax
     1dd:	e9 10 02 00 00       	jmpq   3f2 <number+0x274>
     1e2:	8b 45 90             	mov    -0x70(%rbp),%eax
     1e5:	83 e0 01             	and    $0x1,%eax
     1e8:	85 c0                	test   %eax,%eax
     1ea:	74 07                	je     1f3 <number+0x75>
     1ec:	b8 30 00 00 00       	mov    $0x30,%eax
     1f1:	eb 05                	jmp    1f8 <number+0x7a>
     1f3:	b8 20 00 00 00       	mov    $0x20,%eax
     1f8:	88 45 eb             	mov    %al,-0x15(%rbp)
     1fb:	c6 45 ff 00          	movb   $0x0,-0x1(%rbp)
     1ff:	8b 45 90             	mov    -0x70(%rbp),%eax
     202:	83 e0 02             	and    $0x2,%eax
     205:	85 c0                	test   %eax,%eax
     207:	74 11                	je     21a <number+0x9c>
     209:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
     20e:	79 0a                	jns    21a <number+0x9c>
     210:	c6 45 ff 2d          	movb   $0x2d,-0x1(%rbp)
     214:	48 f7 5d a0          	negq   -0x60(%rbp)
     218:	eb 1d                	jmp    237 <number+0xb9>
     21a:	8b 45 90             	mov    -0x70(%rbp),%eax
     21d:	83 e0 04             	and    $0x4,%eax
     220:	85 c0                	test   %eax,%eax
     222:	75 0b                	jne    22f <number+0xb1>
     224:	8b 45 90             	mov    -0x70(%rbp),%eax
     227:	c1 e0 02             	shl    $0x2,%eax
     22a:	83 e0 20             	and    $0x20,%eax
     22d:	eb 05                	jmp    234 <number+0xb6>
     22f:	b8 2b 00 00 00       	mov    $0x2b,%eax
     234:	88 45 ff             	mov    %al,-0x1(%rbp)
     237:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
     23b:	74 04                	je     241 <number+0xc3>
     23d:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
     241:	8b 45 90             	mov    -0x70(%rbp),%eax
     244:	83 e0 20             	and    $0x20,%eax
     247:	85 c0                	test   %eax,%eax
     249:	74 16                	je     261 <number+0xe3>
     24b:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
     24f:	75 06                	jne    257 <number+0xd9>
     251:	83 6d 98 02          	subl   $0x2,-0x68(%rbp)
     255:	eb 0a                	jmp    261 <number+0xe3>
     257:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
     25b:	75 04                	jne    261 <number+0xe3>
     25d:	83 6d 98 01          	subl   $0x1,-0x68(%rbp)
     261:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     268:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
     26d:	75 48                	jne    2b7 <number+0x139>
     26f:	8b 45 ec             	mov    -0x14(%rbp),%eax
     272:	8d 50 01             	lea    0x1(%rax),%edx
     275:	89 55 ec             	mov    %edx,-0x14(%rbp)
     278:	48 98                	cltq   
     27a:	c6 44 05 b0 30       	movb   $0x30,-0x50(%rbp,%rax,1)
     27f:	eb 3d                	jmp    2be <number+0x140>
     281:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
     285:	ba 00 00 00 00       	mov    $0x0,%edx
     28a:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
     28d:	48 f7 f1             	div    %rcx
     290:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
     294:	89 55 e4             	mov    %edx,-0x1c(%rbp)
     297:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     29a:	48 63 d0             	movslq %eax,%rdx
     29d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     2a1:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     2a5:	8b 45 ec             	mov    -0x14(%rbp),%eax
     2a8:	8d 50 01             	lea    0x1(%rax),%edx
     2ab:	89 55 ec             	mov    %edx,-0x14(%rbp)
     2ae:	0f b6 11             	movzbl (%rcx),%edx
     2b1:	48 98                	cltq   
     2b3:	88 54 05 b0          	mov    %dl,-0x50(%rbp,%rax,1)
     2b7:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
     2bc:	75 c3                	jne    281 <number+0x103>
     2be:	8b 45 ec             	mov    -0x14(%rbp),%eax
     2c1:	3b 45 94             	cmp    -0x6c(%rbp),%eax
     2c4:	7e 06                	jle    2cc <number+0x14e>
     2c6:	8b 45 ec             	mov    -0x14(%rbp),%eax
     2c9:	89 45 94             	mov    %eax,-0x6c(%rbp)
     2cc:	8b 45 94             	mov    -0x6c(%rbp),%eax
     2cf:	29 45 98             	sub    %eax,-0x68(%rbp)
     2d2:	8b 45 90             	mov    -0x70(%rbp),%eax
     2d5:	83 e0 11             	and    $0x11,%eax
     2d8:	85 c0                	test   %eax,%eax
     2da:	75 1e                	jne    2fa <number+0x17c>
     2dc:	eb 0f                	jmp    2ed <number+0x16f>
     2de:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     2e2:	48 8d 50 01          	lea    0x1(%rax),%rdx
     2e6:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     2ea:	c6 00 20             	movb   $0x20,(%rax)
     2ed:	8b 45 98             	mov    -0x68(%rbp),%eax
     2f0:	8d 50 ff             	lea    -0x1(%rax),%edx
     2f3:	89 55 98             	mov    %edx,-0x68(%rbp)
     2f6:	85 c0                	test   %eax,%eax
     2f8:	7f e4                	jg     2de <number+0x160>
     2fa:	80 7d ff 00          	cmpb   $0x0,-0x1(%rbp)
     2fe:	74 12                	je     312 <number+0x194>
     300:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     304:	48 8d 50 01          	lea    0x1(%rax),%rdx
     308:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     30c:	0f b6 55 ff          	movzbl -0x1(%rbp),%edx
     310:	88 10                	mov    %dl,(%rax)
     312:	8b 45 90             	mov    -0x70(%rbp),%eax
     315:	83 e0 20             	and    $0x20,%eax
     318:	85 c0                	test   %eax,%eax
     31a:	74 42                	je     35e <number+0x1e0>
     31c:	83 7d 9c 08          	cmpl   $0x8,-0x64(%rbp)
     320:	75 11                	jne    333 <number+0x1b5>
     322:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     326:	48 8d 50 01          	lea    0x1(%rax),%rdx
     32a:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     32e:	c6 00 30             	movb   $0x30,(%rax)
     331:	eb 2b                	jmp    35e <number+0x1e0>
     333:	83 7d 9c 10          	cmpl   $0x10,-0x64(%rbp)
     337:	75 25                	jne    35e <number+0x1e0>
     339:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     33d:	48 8d 50 01          	lea    0x1(%rax),%rdx
     341:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     345:	c6 00 30             	movb   $0x30,(%rax)
     348:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     34c:	48 8d 50 01          	lea    0x1(%rax),%rdx
     350:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     354:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     358:	0f b6 52 21          	movzbl 0x21(%rdx),%edx
     35c:	88 10                	mov    %dl,(%rax)
     35e:	8b 45 90             	mov    -0x70(%rbp),%eax
     361:	83 e0 10             	and    $0x10,%eax
     364:	85 c0                	test   %eax,%eax
     366:	75 32                	jne    39a <number+0x21c>
     368:	eb 12                	jmp    37c <number+0x1fe>
     36a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     36e:	48 8d 50 01          	lea    0x1(%rax),%rdx
     372:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     376:	0f b6 55 eb          	movzbl -0x15(%rbp),%edx
     37a:	88 10                	mov    %dl,(%rax)
     37c:	8b 45 98             	mov    -0x68(%rbp),%eax
     37f:	8d 50 ff             	lea    -0x1(%rax),%edx
     382:	89 55 98             	mov    %edx,-0x68(%rbp)
     385:	85 c0                	test   %eax,%eax
     387:	7f e1                	jg     36a <number+0x1ec>
     389:	eb 0f                	jmp    39a <number+0x21c>
     38b:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     38f:	48 8d 50 01          	lea    0x1(%rax),%rdx
     393:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     397:	c6 00 30             	movb   $0x30,(%rax)
     39a:	8b 45 94             	mov    -0x6c(%rbp),%eax
     39d:	8d 50 ff             	lea    -0x1(%rax),%edx
     3a0:	89 55 94             	mov    %edx,-0x6c(%rbp)
     3a3:	39 45 ec             	cmp    %eax,-0x14(%rbp)
     3a6:	7c e3                	jl     38b <number+0x20d>
     3a8:	eb 19                	jmp    3c3 <number+0x245>
     3aa:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     3ae:	48 8d 50 01          	lea    0x1(%rax),%rdx
     3b2:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     3b6:	8b 55 ec             	mov    -0x14(%rbp),%edx
     3b9:	48 63 d2             	movslq %edx,%rdx
     3bc:	0f b6 54 15 b0       	movzbl -0x50(%rbp,%rdx,1),%edx
     3c1:	88 10                	mov    %dl,(%rax)
     3c3:	8b 45 ec             	mov    -0x14(%rbp),%eax
     3c6:	8d 50 ff             	lea    -0x1(%rax),%edx
     3c9:	89 55 ec             	mov    %edx,-0x14(%rbp)
     3cc:	85 c0                	test   %eax,%eax
     3ce:	7f da                	jg     3aa <number+0x22c>
     3d0:	eb 0f                	jmp    3e1 <number+0x263>
     3d2:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     3d6:	48 8d 50 01          	lea    0x1(%rax),%rdx
     3da:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     3de:	c6 00 20             	movb   $0x20,(%rax)
     3e1:	8b 45 98             	mov    -0x68(%rbp),%eax
     3e4:	8d 50 ff             	lea    -0x1(%rax),%edx
     3e7:	89 55 98             	mov    %edx,-0x68(%rbp)
     3ea:	85 c0                	test   %eax,%eax
     3ec:	7f e4                	jg     3d2 <number+0x254>
     3ee:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     3f2:	5d                   	pop    %rbp
     3f3:	c3                   	retq   

00000000000003f4 <vsprintf>:
     3f4:	55                   	push   %rbp
     3f5:	48 89 e5             	mov    %rsp,%rbp
     3f8:	48 83 ec 58          	sub    $0x58,%rsp
     3fc:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
     400:	48 89 75 b0          	mov    %rsi,-0x50(%rbp)
     404:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
     408:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
     40c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     410:	e9 b8 08 00 00       	jmpq   ccd <vsprintf+0x8d9>
     415:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     419:	0f b6 00             	movzbl (%rax),%eax
     41c:	3c 25                	cmp    $0x25,%al
     41e:	74 1a                	je     43a <vsprintf+0x46>
     420:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     424:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     428:	48 8d 48 01          	lea    0x1(%rax),%rcx
     42c:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     430:	0f b6 12             	movzbl (%rdx),%edx
     433:	88 10                	mov    %dl,(%rax)
     435:	e9 87 08 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     43a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     441:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     445:	48 83 c0 01          	add    $0x1,%rax
     449:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     44d:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     451:	0f b6 00             	movzbl (%rax),%eax
     454:	0f be c0             	movsbl %al,%eax
     457:	83 e8 20             	sub    $0x20,%eax
     45a:	83 f8 10             	cmp    $0x10,%eax
     45d:	77 3a                	ja     499 <vsprintf+0xa5>
     45f:	89 c0                	mov    %eax,%eax
     461:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
     468:	00 
     469:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     470:	00 00 00 
     473:	48 01 d0             	add    %rdx,%rax
     476:	48 8b 00             	mov    (%rax),%rax
     479:	ff e0                	jmpq   *%rax
     47b:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
     47f:	eb c0                	jmp    441 <vsprintf+0x4d>
     481:	83 4d ec 04          	orl    $0x4,-0x14(%rbp)
     485:	eb ba                	jmp    441 <vsprintf+0x4d>
     487:	83 4d ec 08          	orl    $0x8,-0x14(%rbp)
     48b:	eb b4                	jmp    441 <vsprintf+0x4d>
     48d:	83 4d ec 20          	orl    $0x20,-0x14(%rbp)
     491:	eb ae                	jmp    441 <vsprintf+0x4d>
     493:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
     497:	eb a8                	jmp    441 <vsprintf+0x4d>
     499:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%rbp)
     4a0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     4a4:	0f b6 00             	movzbl (%rax),%eax
     4a7:	3c 2f                	cmp    $0x2f,%al
     4a9:	7e 23                	jle    4ce <vsprintf+0xda>
     4ab:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     4af:	0f b6 00             	movzbl (%rax),%eax
     4b2:	3c 39                	cmp    $0x39,%al
     4b4:	7f 18                	jg     4ce <vsprintf+0xda>
     4b6:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
     4ba:	48 89 c7             	mov    %rax,%rdi
     4bd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     4c4:	00 00 00 
     4c7:	ff d0                	callq  *%rax
     4c9:	89 45 e8             	mov    %eax,-0x18(%rbp)
     4cc:	eb 6c                	jmp    53a <vsprintf+0x146>
     4ce:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     4d2:	0f b6 00             	movzbl (%rax),%eax
     4d5:	3c 2a                	cmp    $0x2a,%al
     4d7:	75 61                	jne    53a <vsprintf+0x146>
     4d9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     4dd:	48 83 c0 01          	add    $0x1,%rax
     4e1:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     4e5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     4e9:	8b 00                	mov    (%rax),%eax
     4eb:	83 f8 2f             	cmp    $0x2f,%eax
     4ee:	77 24                	ja     514 <vsprintf+0x120>
     4f0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     4f4:	48 8b 50 10          	mov    0x10(%rax),%rdx
     4f8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     4fc:	8b 00                	mov    (%rax),%eax
     4fe:	89 c0                	mov    %eax,%eax
     500:	48 01 d0             	add    %rdx,%rax
     503:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     507:	8b 12                	mov    (%rdx),%edx
     509:	8d 4a 08             	lea    0x8(%rdx),%ecx
     50c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     510:	89 0a                	mov    %ecx,(%rdx)
     512:	eb 14                	jmp    528 <vsprintf+0x134>
     514:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     518:	48 8b 40 08          	mov    0x8(%rax),%rax
     51c:	48 8d 48 08          	lea    0x8(%rax),%rcx
     520:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     524:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     528:	8b 00                	mov    (%rax),%eax
     52a:	89 45 e8             	mov    %eax,-0x18(%rbp)
     52d:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
     531:	79 07                	jns    53a <vsprintf+0x146>
     533:	f7 5d e8             	negl   -0x18(%rbp)
     536:	83 4d ec 10          	orl    $0x10,-0x14(%rbp)
     53a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%rbp)
     541:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     545:	0f b6 00             	movzbl (%rax),%eax
     548:	3c 2e                	cmp    $0x2e,%al
     54a:	0f 85 a6 00 00 00    	jne    5f6 <vsprintf+0x202>
     550:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     554:	48 83 c0 01          	add    $0x1,%rax
     558:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     55c:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     560:	0f b6 00             	movzbl (%rax),%eax
     563:	3c 2f                	cmp    $0x2f,%al
     565:	7e 23                	jle    58a <vsprintf+0x196>
     567:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     56b:	0f b6 00             	movzbl (%rax),%eax
     56e:	3c 39                	cmp    $0x39,%al
     570:	7f 18                	jg     58a <vsprintf+0x196>
     572:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
     576:	48 89 c7             	mov    %rax,%rdi
     579:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     580:	00 00 00 
     583:	ff d0                	callq  *%rax
     585:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     588:	eb 5f                	jmp    5e9 <vsprintf+0x1f5>
     58a:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     58e:	0f b6 00             	movzbl (%rax),%eax
     591:	3c 2a                	cmp    $0x2a,%al
     593:	75 54                	jne    5e9 <vsprintf+0x1f5>
     595:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     599:	48 83 c0 01          	add    $0x1,%rax
     59d:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     5a1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     5a5:	8b 00                	mov    (%rax),%eax
     5a7:	83 f8 2f             	cmp    $0x2f,%eax
     5aa:	77 24                	ja     5d0 <vsprintf+0x1dc>
     5ac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     5b0:	48 8b 50 10          	mov    0x10(%rax),%rdx
     5b4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     5b8:	8b 00                	mov    (%rax),%eax
     5ba:	89 c0                	mov    %eax,%eax
     5bc:	48 01 d0             	add    %rdx,%rax
     5bf:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     5c3:	8b 12                	mov    (%rdx),%edx
     5c5:	8d 4a 08             	lea    0x8(%rdx),%ecx
     5c8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     5cc:	89 0a                	mov    %ecx,(%rdx)
     5ce:	eb 14                	jmp    5e4 <vsprintf+0x1f0>
     5d0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     5d4:	48 8b 40 08          	mov    0x8(%rax),%rax
     5d8:	48 8d 48 08          	lea    0x8(%rax),%rcx
     5dc:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     5e0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     5e4:	8b 00                	mov    (%rax),%eax
     5e6:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     5e9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     5ed:	79 07                	jns    5f6 <vsprintf+0x202>
     5ef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
     5f6:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%rbp)
     5fd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     601:	0f b6 00             	movzbl (%rax),%eax
     604:	3c 68                	cmp    $0x68,%al
     606:	74 21                	je     629 <vsprintf+0x235>
     608:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     60c:	0f b6 00             	movzbl (%rax),%eax
     60f:	3c 6c                	cmp    $0x6c,%al
     611:	74 16                	je     629 <vsprintf+0x235>
     613:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     617:	0f b6 00             	movzbl (%rax),%eax
     61a:	3c 4c                	cmp    $0x4c,%al
     61c:	74 0b                	je     629 <vsprintf+0x235>
     61e:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     622:	0f b6 00             	movzbl (%rax),%eax
     625:	3c 5a                	cmp    $0x5a,%al
     627:	75 19                	jne    642 <vsprintf+0x24e>
     629:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     62d:	0f b6 00             	movzbl (%rax),%eax
     630:	0f be c0             	movsbl %al,%eax
     633:	89 45 d8             	mov    %eax,-0x28(%rbp)
     636:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     63a:	48 83 c0 01          	add    $0x1,%rax
     63e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     642:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     646:	0f b6 00             	movzbl (%rax),%eax
     649:	0f be c0             	movsbl %al,%eax
     64c:	83 e8 25             	sub    $0x25,%eax
     64f:	83 f8 53             	cmp    $0x53,%eax
     652:	0f 87 2b 06 00 00    	ja     c83 <vsprintf+0x88f>
     658:	89 c0                	mov    %eax,%eax
     65a:	48 8d 14 c5 00 00 00 	lea    0x0(,%rax,8),%rdx
     661:	00 
     662:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     669:	00 00 00 
     66c:	48 01 d0             	add    %rdx,%rax
     66f:	48 8b 00             	mov    (%rax),%rax
     672:	ff e0                	jmpq   *%rax
     674:	8b 45 ec             	mov    -0x14(%rbp),%eax
     677:	83 e0 10             	and    $0x10,%eax
     67a:	85 c0                	test   %eax,%eax
     67c:	75 1b                	jne    699 <vsprintf+0x2a5>
     67e:	eb 0f                	jmp    68f <vsprintf+0x29b>
     680:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     684:	48 8d 50 01          	lea    0x1(%rax),%rdx
     688:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     68c:	c6 00 20             	movb   $0x20,(%rax)
     68f:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
     693:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
     697:	7f e7                	jg     680 <vsprintf+0x28c>
     699:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     69d:	8b 00                	mov    (%rax),%eax
     69f:	83 f8 2f             	cmp    $0x2f,%eax
     6a2:	77 24                	ja     6c8 <vsprintf+0x2d4>
     6a4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     6a8:	48 8b 50 10          	mov    0x10(%rax),%rdx
     6ac:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     6b0:	8b 00                	mov    (%rax),%eax
     6b2:	89 c0                	mov    %eax,%eax
     6b4:	48 01 d0             	add    %rdx,%rax
     6b7:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     6bb:	8b 12                	mov    (%rdx),%edx
     6bd:	8d 4a 08             	lea    0x8(%rdx),%ecx
     6c0:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     6c4:	89 0a                	mov    %ecx,(%rdx)
     6c6:	eb 14                	jmp    6dc <vsprintf+0x2e8>
     6c8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     6cc:	48 8b 40 08          	mov    0x8(%rax),%rax
     6d0:	48 8d 48 08          	lea    0x8(%rax),%rcx
     6d4:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     6d8:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     6dc:	8b 08                	mov    (%rax),%ecx
     6de:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     6e2:	48 8d 50 01          	lea    0x1(%rax),%rdx
     6e6:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     6ea:	89 ca                	mov    %ecx,%edx
     6ec:	88 10                	mov    %dl,(%rax)
     6ee:	eb 0f                	jmp    6ff <vsprintf+0x30b>
     6f0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     6f4:	48 8d 50 01          	lea    0x1(%rax),%rdx
     6f8:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     6fc:	c6 00 20             	movb   $0x20,(%rax)
     6ff:	83 6d e8 01          	subl   $0x1,-0x18(%rbp)
     703:	83 7d e8 00          	cmpl   $0x0,-0x18(%rbp)
     707:	7f e7                	jg     6f0 <vsprintf+0x2fc>
     709:	e9 b3 05 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     70e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     712:	8b 00                	mov    (%rax),%eax
     714:	83 f8 2f             	cmp    $0x2f,%eax
     717:	77 24                	ja     73d <vsprintf+0x349>
     719:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     71d:	48 8b 50 10          	mov    0x10(%rax),%rdx
     721:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     725:	8b 00                	mov    (%rax),%eax
     727:	89 c0                	mov    %eax,%eax
     729:	48 01 d0             	add    %rdx,%rax
     72c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     730:	8b 12                	mov    (%rdx),%edx
     732:	8d 4a 08             	lea    0x8(%rdx),%ecx
     735:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     739:	89 0a                	mov    %ecx,(%rdx)
     73b:	eb 14                	jmp    751 <vsprintf+0x35d>
     73d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     741:	48 8b 40 08          	mov    0x8(%rax),%rax
     745:	48 8d 48 08          	lea    0x8(%rax),%rcx
     749:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     74d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     751:	48 8b 00             	mov    (%rax),%rax
     754:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     758:	48 83 7d f0 00       	cmpq   $0x0,-0x10(%rbp)
     75d:	75 08                	jne    767 <vsprintf+0x373>
     75f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
     766:	00 
     767:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
     76b:	48 89 c7             	mov    %rax,%rdi
     76e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     775:	00 00 00 
     778:	ff d0                	callq  *%rax
     77a:	89 45 e0             	mov    %eax,-0x20(%rbp)
     77d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%rbp)
     781:	79 08                	jns    78b <vsprintf+0x397>
     783:	8b 45 e0             	mov    -0x20(%rbp),%eax
     786:	89 45 e4             	mov    %eax,-0x1c(%rbp)
     789:	eb 0e                	jmp    799 <vsprintf+0x3a5>
     78b:	8b 45 e0             	mov    -0x20(%rbp),%eax
     78e:	3b 45 e4             	cmp    -0x1c(%rbp),%eax
     791:	7e 06                	jle    799 <vsprintf+0x3a5>
     793:	8b 45 e4             	mov    -0x1c(%rbp),%eax
     796:	89 45 e0             	mov    %eax,-0x20(%rbp)
     799:	8b 45 ec             	mov    -0x14(%rbp),%eax
     79c:	83 e0 10             	and    $0x10,%eax
     79f:	85 c0                	test   %eax,%eax
     7a1:	75 1f                	jne    7c2 <vsprintf+0x3ce>
     7a3:	eb 0f                	jmp    7b4 <vsprintf+0x3c0>
     7a5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     7a9:	48 8d 50 01          	lea    0x1(%rax),%rdx
     7ad:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     7b1:	c6 00 20             	movb   $0x20,(%rax)
     7b4:	8b 45 e8             	mov    -0x18(%rbp),%eax
     7b7:	8d 50 ff             	lea    -0x1(%rax),%edx
     7ba:	89 55 e8             	mov    %edx,-0x18(%rbp)
     7bd:	39 45 e0             	cmp    %eax,-0x20(%rbp)
     7c0:	7c e3                	jl     7a5 <vsprintf+0x3b1>
     7c2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     7c9:	eb 21                	jmp    7ec <vsprintf+0x3f8>
     7cb:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
     7cf:	48 8d 42 01          	lea    0x1(%rdx),%rax
     7d3:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     7d7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     7db:	48 8d 48 01          	lea    0x1(%rax),%rcx
     7df:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     7e3:	0f b6 12             	movzbl (%rdx),%edx
     7e6:	88 10                	mov    %dl,(%rax)
     7e8:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
     7ec:	8b 45 dc             	mov    -0x24(%rbp),%eax
     7ef:	3b 45 e0             	cmp    -0x20(%rbp),%eax
     7f2:	7c d7                	jl     7cb <vsprintf+0x3d7>
     7f4:	eb 0f                	jmp    805 <vsprintf+0x411>
     7f6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     7fa:	48 8d 50 01          	lea    0x1(%rax),%rdx
     7fe:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     802:	c6 00 20             	movb   $0x20,(%rax)
     805:	8b 45 e8             	mov    -0x18(%rbp),%eax
     808:	8d 50 ff             	lea    -0x1(%rax),%edx
     80b:	89 55 e8             	mov    %edx,-0x18(%rbp)
     80e:	39 45 e0             	cmp    %eax,-0x20(%rbp)
     811:	7c e3                	jl     7f6 <vsprintf+0x402>
     813:	e9 a9 04 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     818:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
     81c:	75 7e                	jne    89c <vsprintf+0x4a8>
     81e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     822:	8b 00                	mov    (%rax),%eax
     824:	83 f8 2f             	cmp    $0x2f,%eax
     827:	77 24                	ja     84d <vsprintf+0x459>
     829:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     82d:	48 8b 50 10          	mov    0x10(%rax),%rdx
     831:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     835:	8b 00                	mov    (%rax),%eax
     837:	89 c0                	mov    %eax,%eax
     839:	48 01 d0             	add    %rdx,%rax
     83c:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     840:	8b 12                	mov    (%rdx),%edx
     842:	8d 4a 08             	lea    0x8(%rdx),%ecx
     845:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     849:	89 0a                	mov    %ecx,(%rdx)
     84b:	eb 14                	jmp    861 <vsprintf+0x46d>
     84d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     851:	48 8b 40 08          	mov    0x8(%rax),%rax
     855:	48 8d 48 08          	lea    0x8(%rax),%rcx
     859:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     85d:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     861:	48 8b 00             	mov    (%rax),%rax
     864:	48 89 c7             	mov    %rax,%rdi
     867:	8b 75 ec             	mov    -0x14(%rbp),%esi
     86a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     86d:	8b 55 e8             	mov    -0x18(%rbp),%edx
     870:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     874:	41 89 f1             	mov    %esi,%r9d
     877:	41 89 c8             	mov    %ecx,%r8d
     87a:	89 d1                	mov    %edx,%ecx
     87c:	ba 08 00 00 00       	mov    $0x8,%edx
     881:	48 89 fe             	mov    %rdi,%rsi
     884:	48 89 c7             	mov    %rax,%rdi
     887:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     88e:	00 00 00 
     891:	ff d0                	callq  *%rax
     893:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     897:	e9 25 04 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     89c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     8a0:	8b 00                	mov    (%rax),%eax
     8a2:	83 f8 2f             	cmp    $0x2f,%eax
     8a5:	77 24                	ja     8cb <vsprintf+0x4d7>
     8a7:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     8ab:	48 8b 50 10          	mov    0x10(%rax),%rdx
     8af:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     8b3:	8b 00                	mov    (%rax),%eax
     8b5:	89 c0                	mov    %eax,%eax
     8b7:	48 01 d0             	add    %rdx,%rax
     8ba:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     8be:	8b 12                	mov    (%rdx),%edx
     8c0:	8d 4a 08             	lea    0x8(%rdx),%ecx
     8c3:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     8c7:	89 0a                	mov    %ecx,(%rdx)
     8c9:	eb 14                	jmp    8df <vsprintf+0x4eb>
     8cb:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     8cf:	48 8b 40 08          	mov    0x8(%rax),%rax
     8d3:	48 8d 48 08          	lea    0x8(%rax),%rcx
     8d7:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     8db:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     8df:	8b 00                	mov    (%rax),%eax
     8e1:	89 c7                	mov    %eax,%edi
     8e3:	8b 75 ec             	mov    -0x14(%rbp),%esi
     8e6:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     8e9:	8b 55 e8             	mov    -0x18(%rbp),%edx
     8ec:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     8f0:	41 89 f1             	mov    %esi,%r9d
     8f3:	41 89 c8             	mov    %ecx,%r8d
     8f6:	89 d1                	mov    %edx,%ecx
     8f8:	ba 08 00 00 00       	mov    $0x8,%edx
     8fd:	48 89 fe             	mov    %rdi,%rsi
     900:	48 89 c7             	mov    %rax,%rdi
     903:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     90a:	00 00 00 
     90d:	ff d0                	callq  *%rax
     90f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     913:	e9 a9 03 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     918:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%rbp)
     91c:	75 0b                	jne    929 <vsprintf+0x535>
     91e:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%rbp)
     925:	83 4d ec 01          	orl    $0x1,-0x14(%rbp)
     929:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     92d:	8b 00                	mov    (%rax),%eax
     92f:	83 f8 2f             	cmp    $0x2f,%eax
     932:	77 24                	ja     958 <vsprintf+0x564>
     934:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     938:	48 8b 50 10          	mov    0x10(%rax),%rdx
     93c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     940:	8b 00                	mov    (%rax),%eax
     942:	89 c0                	mov    %eax,%eax
     944:	48 01 d0             	add    %rdx,%rax
     947:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     94b:	8b 12                	mov    (%rdx),%edx
     94d:	8d 4a 08             	lea    0x8(%rdx),%ecx
     950:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     954:	89 0a                	mov    %ecx,(%rdx)
     956:	eb 14                	jmp    96c <vsprintf+0x578>
     958:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     95c:	48 8b 40 08          	mov    0x8(%rax),%rax
     960:	48 8d 48 08          	lea    0x8(%rax),%rcx
     964:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     968:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     96c:	48 8b 00             	mov    (%rax),%rax
     96f:	48 89 c7             	mov    %rax,%rdi
     972:	8b 75 ec             	mov    -0x14(%rbp),%esi
     975:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     978:	8b 55 e8             	mov    -0x18(%rbp),%edx
     97b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     97f:	41 89 f1             	mov    %esi,%r9d
     982:	41 89 c8             	mov    %ecx,%r8d
     985:	89 d1                	mov    %edx,%ecx
     987:	ba 10 00 00 00       	mov    $0x10,%edx
     98c:	48 89 fe             	mov    %rdi,%rsi
     98f:	48 89 c7             	mov    %rax,%rdi
     992:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     999:	00 00 00 
     99c:	ff d0                	callq  *%rax
     99e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     9a2:	e9 1a 03 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     9a7:	83 4d ec 40          	orl    $0x40,-0x14(%rbp)
     9ab:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
     9af:	75 7e                	jne    a2f <vsprintf+0x63b>
     9b1:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     9b5:	8b 00                	mov    (%rax),%eax
     9b7:	83 f8 2f             	cmp    $0x2f,%eax
     9ba:	77 24                	ja     9e0 <vsprintf+0x5ec>
     9bc:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     9c0:	48 8b 50 10          	mov    0x10(%rax),%rdx
     9c4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     9c8:	8b 00                	mov    (%rax),%eax
     9ca:	89 c0                	mov    %eax,%eax
     9cc:	48 01 d0             	add    %rdx,%rax
     9cf:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     9d3:	8b 12                	mov    (%rdx),%edx
     9d5:	8d 4a 08             	lea    0x8(%rdx),%ecx
     9d8:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     9dc:	89 0a                	mov    %ecx,(%rdx)
     9de:	eb 14                	jmp    9f4 <vsprintf+0x600>
     9e0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     9e4:	48 8b 40 08          	mov    0x8(%rax),%rax
     9e8:	48 8d 48 08          	lea    0x8(%rax),%rcx
     9ec:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     9f0:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     9f4:	48 8b 00             	mov    (%rax),%rax
     9f7:	48 89 c7             	mov    %rax,%rdi
     9fa:	8b 75 ec             	mov    -0x14(%rbp),%esi
     9fd:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     a00:	8b 55 e8             	mov    -0x18(%rbp),%edx
     a03:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     a07:	41 89 f1             	mov    %esi,%r9d
     a0a:	41 89 c8             	mov    %ecx,%r8d
     a0d:	89 d1                	mov    %edx,%ecx
     a0f:	ba 10 00 00 00       	mov    $0x10,%edx
     a14:	48 89 fe             	mov    %rdi,%rsi
     a17:	48 89 c7             	mov    %rax,%rdi
     a1a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a21:	00 00 00 
     a24:	ff d0                	callq  *%rax
     a26:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     a2a:	e9 92 02 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     a2f:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     a33:	8b 00                	mov    (%rax),%eax
     a35:	83 f8 2f             	cmp    $0x2f,%eax
     a38:	77 24                	ja     a5e <vsprintf+0x66a>
     a3a:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     a3e:	48 8b 50 10          	mov    0x10(%rax),%rdx
     a42:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     a46:	8b 00                	mov    (%rax),%eax
     a48:	89 c0                	mov    %eax,%eax
     a4a:	48 01 d0             	add    %rdx,%rax
     a4d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     a51:	8b 12                	mov    (%rdx),%edx
     a53:	8d 4a 08             	lea    0x8(%rdx),%ecx
     a56:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     a5a:	89 0a                	mov    %ecx,(%rdx)
     a5c:	eb 14                	jmp    a72 <vsprintf+0x67e>
     a5e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     a62:	48 8b 40 08          	mov    0x8(%rax),%rax
     a66:	48 8d 48 08          	lea    0x8(%rax),%rcx
     a6a:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     a6e:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     a72:	8b 00                	mov    (%rax),%eax
     a74:	89 c7                	mov    %eax,%edi
     a76:	8b 75 ec             	mov    -0x14(%rbp),%esi
     a79:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     a7c:	8b 55 e8             	mov    -0x18(%rbp),%edx
     a7f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     a83:	41 89 f1             	mov    %esi,%r9d
     a86:	41 89 c8             	mov    %ecx,%r8d
     a89:	89 d1                	mov    %edx,%ecx
     a8b:	ba 10 00 00 00       	mov    $0x10,%edx
     a90:	48 89 fe             	mov    %rdi,%rsi
     a93:	48 89 c7             	mov    %rax,%rdi
     a96:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     a9d:	00 00 00 
     aa0:	ff d0                	callq  *%rax
     aa2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     aa6:	e9 16 02 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     aab:	83 4d ec 02          	orl    $0x2,-0x14(%rbp)
     aaf:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
     ab3:	75 7e                	jne    b33 <vsprintf+0x73f>
     ab5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     ab9:	8b 00                	mov    (%rax),%eax
     abb:	83 f8 2f             	cmp    $0x2f,%eax
     abe:	77 24                	ja     ae4 <vsprintf+0x6f0>
     ac0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     ac4:	48 8b 50 10          	mov    0x10(%rax),%rdx
     ac8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     acc:	8b 00                	mov    (%rax),%eax
     ace:	89 c0                	mov    %eax,%eax
     ad0:	48 01 d0             	add    %rdx,%rax
     ad3:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     ad7:	8b 12                	mov    (%rdx),%edx
     ad9:	8d 4a 08             	lea    0x8(%rdx),%ecx
     adc:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     ae0:	89 0a                	mov    %ecx,(%rdx)
     ae2:	eb 14                	jmp    af8 <vsprintf+0x704>
     ae4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     ae8:	48 8b 40 08          	mov    0x8(%rax),%rax
     aec:	48 8d 48 08          	lea    0x8(%rax),%rcx
     af0:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     af4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     af8:	48 8b 00             	mov    (%rax),%rax
     afb:	48 89 c7             	mov    %rax,%rdi
     afe:	8b 75 ec             	mov    -0x14(%rbp),%esi
     b01:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     b04:	8b 55 e8             	mov    -0x18(%rbp),%edx
     b07:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b0b:	41 89 f1             	mov    %esi,%r9d
     b0e:	41 89 c8             	mov    %ecx,%r8d
     b11:	89 d1                	mov    %edx,%ecx
     b13:	ba 0a 00 00 00       	mov    $0xa,%edx
     b18:	48 89 fe             	mov    %rdi,%rsi
     b1b:	48 89 c7             	mov    %rax,%rdi
     b1e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     b25:	00 00 00 
     b28:	ff d0                	callq  *%rax
     b2a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     b2e:	e9 8e 01 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     b33:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     b37:	8b 00                	mov    (%rax),%eax
     b39:	83 f8 2f             	cmp    $0x2f,%eax
     b3c:	77 24                	ja     b62 <vsprintf+0x76e>
     b3e:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     b42:	48 8b 50 10          	mov    0x10(%rax),%rdx
     b46:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     b4a:	8b 00                	mov    (%rax),%eax
     b4c:	89 c0                	mov    %eax,%eax
     b4e:	48 01 d0             	add    %rdx,%rax
     b51:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     b55:	8b 12                	mov    (%rdx),%edx
     b57:	8d 4a 08             	lea    0x8(%rdx),%ecx
     b5a:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     b5e:	89 0a                	mov    %ecx,(%rdx)
     b60:	eb 14                	jmp    b76 <vsprintf+0x782>
     b62:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     b66:	48 8b 40 08          	mov    0x8(%rax),%rax
     b6a:	48 8d 48 08          	lea    0x8(%rax),%rcx
     b6e:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     b72:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     b76:	8b 00                	mov    (%rax),%eax
     b78:	89 c7                	mov    %eax,%edi
     b7a:	8b 75 ec             	mov    -0x14(%rbp),%esi
     b7d:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
     b80:	8b 55 e8             	mov    -0x18(%rbp),%edx
     b83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     b87:	41 89 f1             	mov    %esi,%r9d
     b8a:	41 89 c8             	mov    %ecx,%r8d
     b8d:	89 d1                	mov    %edx,%ecx
     b8f:	ba 0a 00 00 00       	mov    $0xa,%edx
     b94:	48 89 fe             	mov    %rdi,%rsi
     b97:	48 89 c7             	mov    %rax,%rdi
     b9a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ba1:	00 00 00 
     ba4:	ff d0                	callq  *%rax
     ba6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     baa:	e9 12 01 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     baf:	83 7d d8 6c          	cmpl   $0x6c,-0x28(%rbp)
     bb3:	75 61                	jne    c16 <vsprintf+0x822>
     bb5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     bb9:	8b 00                	mov    (%rax),%eax
     bbb:	83 f8 2f             	cmp    $0x2f,%eax
     bbe:	77 24                	ja     be4 <vsprintf+0x7f0>
     bc0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     bc4:	48 8b 50 10          	mov    0x10(%rax),%rdx
     bc8:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     bcc:	8b 00                	mov    (%rax),%eax
     bce:	89 c0                	mov    %eax,%eax
     bd0:	48 01 d0             	add    %rdx,%rax
     bd3:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     bd7:	8b 12                	mov    (%rdx),%edx
     bd9:	8d 4a 08             	lea    0x8(%rdx),%ecx
     bdc:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     be0:	89 0a                	mov    %ecx,(%rdx)
     be2:	eb 14                	jmp    bf8 <vsprintf+0x804>
     be4:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     be8:	48 8b 40 08          	mov    0x8(%rax),%rax
     bec:	48 8d 48 08          	lea    0x8(%rax),%rcx
     bf0:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     bf4:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     bf8:	48 8b 00             	mov    (%rax),%rax
     bfb:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
     bff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c03:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
     c07:	48 89 c2             	mov    %rax,%rdx
     c0a:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
     c0e:	48 89 10             	mov    %rdx,(%rax)
     c11:	e9 ab 00 00 00       	jmpq   cc1 <vsprintf+0x8cd>
     c16:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     c1a:	8b 00                	mov    (%rax),%eax
     c1c:	83 f8 2f             	cmp    $0x2f,%eax
     c1f:	77 24                	ja     c45 <vsprintf+0x851>
     c21:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     c25:	48 8b 50 10          	mov    0x10(%rax),%rdx
     c29:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     c2d:	8b 00                	mov    (%rax),%eax
     c2f:	89 c0                	mov    %eax,%eax
     c31:	48 01 d0             	add    %rdx,%rax
     c34:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     c38:	8b 12                	mov    (%rdx),%edx
     c3a:	8d 4a 08             	lea    0x8(%rdx),%ecx
     c3d:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     c41:	89 0a                	mov    %ecx,(%rdx)
     c43:	eb 14                	jmp    c59 <vsprintf+0x865>
     c45:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
     c49:	48 8b 40 08          	mov    0x8(%rax),%rax
     c4d:	48 8d 48 08          	lea    0x8(%rax),%rcx
     c51:	48 8b 55 a8          	mov    -0x58(%rbp),%rdx
     c55:	48 89 4a 08          	mov    %rcx,0x8(%rdx)
     c59:	48 8b 00             	mov    (%rax),%rax
     c5c:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
     c60:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c64:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
     c68:	89 c2                	mov    %eax,%edx
     c6a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
     c6e:	89 10                	mov    %edx,(%rax)
     c70:	eb 4f                	jmp    cc1 <vsprintf+0x8cd>
     c72:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c76:	48 8d 50 01          	lea    0x1(%rax),%rdx
     c7a:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     c7e:	c6 00 25             	movb   $0x25,(%rax)
     c81:	eb 3e                	jmp    cc1 <vsprintf+0x8cd>
     c83:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     c87:	48 8d 50 01          	lea    0x1(%rax),%rdx
     c8b:	48 89 55 f8          	mov    %rdx,-0x8(%rbp)
     c8f:	c6 00 25             	movb   $0x25,(%rax)
     c92:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     c96:	0f b6 00             	movzbl (%rax),%eax
     c99:	84 c0                	test   %al,%al
     c9b:	74 17                	je     cb4 <vsprintf+0x8c0>
     c9d:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
     ca1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ca5:	48 8d 48 01          	lea    0x1(%rax),%rcx
     ca9:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
     cad:	0f b6 12             	movzbl (%rdx),%edx
     cb0:	88 10                	mov    %dl,(%rax)
     cb2:	eb 0c                	jmp    cc0 <vsprintf+0x8cc>
     cb4:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     cb8:	48 83 e8 01          	sub    $0x1,%rax
     cbc:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     cc0:	90                   	nop
     cc1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     cc5:	48 83 c0 01          	add    $0x1,%rax
     cc9:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
     ccd:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
     cd1:	0f b6 00             	movzbl (%rax),%eax
     cd4:	84 c0                	test   %al,%al
     cd6:	0f 85 39 f7 ff ff    	jne    415 <vsprintf+0x21>
     cdc:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ce0:	c6 00 00             	movb   $0x0,(%rax)
     ce3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     ce7:	48 2b 45 b8          	sub    -0x48(%rbp),%rax
     ceb:	c9                   	leaveq 
     cec:	c3                   	retq   

0000000000000ced <color_printk>:
     ced:	55                   	push   %rbp
     cee:	48 89 e5             	mov    %rsp,%rbp
     cf1:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
     cf8:	89 bd 1c ff ff ff    	mov    %edi,-0xe4(%rbp)
     cfe:	89 b5 18 ff ff ff    	mov    %esi,-0xe8(%rbp)
     d04:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
     d0b:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
     d12:	4c 89 85 70 ff ff ff 	mov    %r8,-0x90(%rbp)
     d19:	4c 89 8d 78 ff ff ff 	mov    %r9,-0x88(%rbp)
     d20:	84 c0                	test   %al,%al
     d22:	74 20                	je     d44 <color_printk+0x57>
     d24:	0f 29 45 80          	movaps %xmm0,-0x80(%rbp)
     d28:	0f 29 4d 90          	movaps %xmm1,-0x70(%rbp)
     d2c:	0f 29 55 a0          	movaps %xmm2,-0x60(%rbp)
     d30:	0f 29 5d b0          	movaps %xmm3,-0x50(%rbp)
     d34:	0f 29 65 c0          	movaps %xmm4,-0x40(%rbp)
     d38:	0f 29 6d d0          	movaps %xmm5,-0x30(%rbp)
     d3c:	0f 29 75 e0          	movaps %xmm6,-0x20(%rbp)
     d40:	0f 29 7d f0          	movaps %xmm7,-0x10(%rbp)
     d44:	c7 85 44 ff ff ff 00 	movl   $0x0,-0xbc(%rbp)
     d4b:	00 00 00 
     d4e:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
     d55:	00 00 00 
     d58:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%rbp)
     d5f:	00 00 00 
     d62:	c7 85 28 ff ff ff 18 	movl   $0x18,-0xd8(%rbp)
     d69:	00 00 00 
     d6c:	c7 85 2c ff ff ff 30 	movl   $0x30,-0xd4(%rbp)
     d73:	00 00 00 
     d76:	48 8d 45 10          	lea    0x10(%rbp),%rax
     d7a:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
     d81:	48 8d 85 50 ff ff ff 	lea    -0xb0(%rbp),%rax
     d88:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
     d8f:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
     d96:	48 8b 85 10 ff ff ff 	mov    -0xf0(%rbp),%rax
     d9d:	48 89 c6             	mov    %rax,%rsi
     da0:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
     da7:	00 00 00 
     daa:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     db1:	00 00 00 
     db4:	ff d0                	callq  *%rax
     db6:	89 85 44 ff ff ff    	mov    %eax,-0xbc(%rbp)
     dbc:	c7 85 4c ff ff ff 00 	movl   $0x0,-0xb4(%rbp)
     dc3:	00 00 00 
     dc6:	e9 24 04 00 00       	jmpq   11ef <color_printk+0x502>
     dcb:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
     dd2:	7e 0c                	jle    de0 <color_printk+0xf3>
     dd4:	83 ad 4c ff ff ff 01 	subl   $0x1,-0xb4(%rbp)
     ddb:	e9 17 02 00 00       	jmpq   ff7 <color_printk+0x30a>
     de0:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
     de6:	48 98                	cltq   
     de8:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     def:	00 00 00 
     df2:	48 01 d0             	add    %rdx,%rax
     df5:	0f b6 00             	movzbl (%rax),%eax
     df8:	3c 0a                	cmp    $0xa,%al
     dfa:	75 33                	jne    e2f <color_printk+0x142>
     dfc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e03:	00 00 00 
     e06:	8b 40 0c             	mov    0xc(%rax),%eax
     e09:	8d 50 01             	lea    0x1(%rax),%edx
     e0c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e13:	00 00 00 
     e16:	89 50 0c             	mov    %edx,0xc(%rax)
     e19:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e20:	00 00 00 
     e23:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
     e2a:	e9 1f 03 00 00       	jmpq   114e <color_printk+0x461>
     e2f:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
     e35:	48 98                	cltq   
     e37:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e3e:	00 00 00 
     e41:	48 01 d0             	add    %rdx,%rax
     e44:	0f b6 00             	movzbl (%rax),%eax
     e47:	3c 08                	cmp    $0x8,%al
     e49:	0f 85 5c 01 00 00    	jne    fab <color_printk+0x2be>
     e4f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e56:	00 00 00 
     e59:	8b 40 08             	mov    0x8(%rax),%eax
     e5c:	8d 50 ff             	lea    -0x1(%rax),%edx
     e5f:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e66:	00 00 00 
     e69:	89 50 08             	mov    %edx,0x8(%rax)
     e6c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e73:	00 00 00 
     e76:	8b 40 08             	mov    0x8(%rax),%eax
     e79:	85 c0                	test   %eax,%eax
     e7b:	0f 89 a7 00 00 00    	jns    f28 <color_printk+0x23b>
     e81:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     e88:	00 00 00 
     e8b:	8b 00                	mov    (%rax),%eax
     e8d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     e94:	00 00 00 
     e97:	8b 72 10             	mov    0x10(%rdx),%esi
     e9a:	99                   	cltd   
     e9b:	f7 fe                	idiv   %esi
     e9d:	8d 50 ff             	lea    -0x1(%rax),%edx
     ea0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ea7:	00 00 00 
     eaa:	8b 40 10             	mov    0x10(%rax),%eax
     ead:	0f af c2             	imul   %edx,%eax
     eb0:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     eb7:	00 00 00 
     eba:	89 42 08             	mov    %eax,0x8(%rdx)
     ebd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ec4:	00 00 00 
     ec7:	8b 40 0c             	mov    0xc(%rax),%eax
     eca:	8d 50 ff             	lea    -0x1(%rax),%edx
     ecd:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ed4:	00 00 00 
     ed7:	89 50 0c             	mov    %edx,0xc(%rax)
     eda:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ee1:	00 00 00 
     ee4:	8b 40 0c             	mov    0xc(%rax),%eax
     ee7:	85 c0                	test   %eax,%eax
     ee9:	79 3d                	jns    f28 <color_printk+0x23b>
     eeb:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     ef2:	00 00 00 
     ef5:	8b 40 04             	mov    0x4(%rax),%eax
     ef8:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     eff:	00 00 00 
     f02:	8b 7a 14             	mov    0x14(%rdx),%edi
     f05:	99                   	cltd   
     f06:	f7 ff                	idiv   %edi
     f08:	8d 50 ff             	lea    -0x1(%rax),%edx
     f0b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f12:	00 00 00 
     f15:	8b 40 14             	mov    0x14(%rax),%eax
     f18:	0f af c2             	imul   %edx,%eax
     f1b:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     f22:	00 00 00 
     f25:	89 42 0c             	mov    %eax,0xc(%rdx)
     f28:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f2f:	00 00 00 
     f32:	8b 50 0c             	mov    0xc(%rax),%edx
     f35:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f3c:	00 00 00 
     f3f:	8b 40 14             	mov    0x14(%rax),%eax
     f42:	89 d1                	mov    %edx,%ecx
     f44:	0f af c8             	imul   %eax,%ecx
     f47:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f4e:	00 00 00 
     f51:	8b 50 08             	mov    0x8(%rax),%edx
     f54:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f5b:	00 00 00 
     f5e:	8b 40 10             	mov    0x10(%rax),%eax
     f61:	0f af d0             	imul   %eax,%edx
     f64:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f6b:	00 00 00 
     f6e:	8b 30                	mov    (%rax),%esi
     f70:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f77:	00 00 00 
     f7a:	48 8b 40 18          	mov    0x18(%rax),%rax
     f7e:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
     f85:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
     f8b:	6a 20                	pushq  $0x20
     f8d:	45 89 c1             	mov    %r8d,%r9d
     f90:	41 89 f8             	mov    %edi,%r8d
     f93:	48 89 c7             	mov    %rax,%rdi
     f96:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     f9d:	00 00 00 
     fa0:	ff d0                	callq  *%rax
     fa2:	48 83 c4 08          	add    $0x8,%rsp
     fa6:	e9 a3 01 00 00       	jmpq   114e <color_printk+0x461>
     fab:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
     fb1:	48 98                	cltq   
     fb3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
     fba:	00 00 00 
     fbd:	48 01 d0             	add    %rdx,%rax
     fc0:	0f b6 00             	movzbl (%rax),%eax
     fc3:	3c 09                	cmp    $0x9,%al
     fc5:	0f 85 d3 00 00 00    	jne    109e <color_printk+0x3b1>
     fcb:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fd2:	00 00 00 
     fd5:	8b 40 08             	mov    0x8(%rax),%eax
     fd8:	83 c0 08             	add    $0x8,%eax
     fdb:	83 e0 f8             	and    $0xfffffff8,%eax
     fde:	89 c2                	mov    %eax,%edx
     fe0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
     fe7:	00 00 00 
     fea:	8b 48 08             	mov    0x8(%rax),%ecx
     fed:	89 d0                	mov    %edx,%eax
     fef:	29 c8                	sub    %ecx,%eax
     ff1:	89 85 48 ff ff ff    	mov    %eax,-0xb8(%rbp)
     ff7:	83 ad 48 ff ff ff 01 	subl   $0x1,-0xb8(%rbp)
     ffe:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1005:	00 00 00 
    1008:	8b 50 0c             	mov    0xc(%rax),%edx
    100b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1012:	00 00 00 
    1015:	8b 40 14             	mov    0x14(%rax),%eax
    1018:	89 d1                	mov    %edx,%ecx
    101a:	0f af c8             	imul   %eax,%ecx
    101d:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1024:	00 00 00 
    1027:	8b 50 08             	mov    0x8(%rax),%edx
    102a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1031:	00 00 00 
    1034:	8b 40 10             	mov    0x10(%rax),%eax
    1037:	0f af d0             	imul   %eax,%edx
    103a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1041:	00 00 00 
    1044:	8b 30                	mov    (%rax),%esi
    1046:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    104d:	00 00 00 
    1050:	48 8b 40 18          	mov    0x18(%rax),%rax
    1054:	44 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%r8d
    105b:	8b bd 1c ff ff ff    	mov    -0xe4(%rbp),%edi
    1061:	6a 20                	pushq  $0x20
    1063:	45 89 c1             	mov    %r8d,%r9d
    1066:	41 89 f8             	mov    %edi,%r8d
    1069:	48 89 c7             	mov    %rax,%rdi
    106c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1073:	00 00 00 
    1076:	ff d0                	callq  *%rax
    1078:	48 83 c4 08          	add    $0x8,%rsp
    107c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1083:	00 00 00 
    1086:	8b 40 08             	mov    0x8(%rax),%eax
    1089:	8d 50 01             	lea    0x1(%rax),%edx
    108c:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1093:	00 00 00 
    1096:	89 50 08             	mov    %edx,0x8(%rax)
    1099:	e9 b0 00 00 00       	jmpq   114e <color_printk+0x461>
    109e:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
    10a4:	48 98                	cltq   
    10a6:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    10ad:	00 00 00 
    10b0:	48 01 d0             	add    %rdx,%rax
    10b3:	0f b6 00             	movzbl (%rax),%eax
    10b6:	0f b6 f8             	movzbl %al,%edi
    10b9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10c0:	00 00 00 
    10c3:	8b 50 0c             	mov    0xc(%rax),%edx
    10c6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10cd:	00 00 00 
    10d0:	8b 40 14             	mov    0x14(%rax),%eax
    10d3:	89 d1                	mov    %edx,%ecx
    10d5:	0f af c8             	imul   %eax,%ecx
    10d8:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10df:	00 00 00 
    10e2:	8b 50 08             	mov    0x8(%rax),%edx
    10e5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10ec:	00 00 00 
    10ef:	8b 40 10             	mov    0x10(%rax),%eax
    10f2:	0f af d0             	imul   %eax,%edx
    10f5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    10fc:	00 00 00 
    10ff:	8b 30                	mov    (%rax),%esi
    1101:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1108:	00 00 00 
    110b:	48 8b 40 18          	mov    0x18(%rax),%rax
    110f:	44 8b 8d 18 ff ff ff 	mov    -0xe8(%rbp),%r9d
    1116:	44 8b 85 1c ff ff ff 	mov    -0xe4(%rbp),%r8d
    111d:	57                   	push   %rdi
    111e:	48 89 c7             	mov    %rax,%rdi
    1121:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1128:	00 00 00 
    112b:	ff d0                	callq  *%rax
    112d:	48 83 c4 08          	add    $0x8,%rsp
    1131:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1138:	00 00 00 
    113b:	8b 40 08             	mov    0x8(%rax),%eax
    113e:	8d 50 01             	lea    0x1(%rax),%edx
    1141:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1148:	00 00 00 
    114b:	89 50 08             	mov    %edx,0x8(%rax)
    114e:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1155:	00 00 00 
    1158:	8b 48 08             	mov    0x8(%rax),%ecx
    115b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1162:	00 00 00 
    1165:	8b 00                	mov    (%rax),%eax
    1167:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    116e:	00 00 00 
    1171:	8b 72 10             	mov    0x10(%rdx),%esi
    1174:	99                   	cltd   
    1175:	f7 fe                	idiv   %esi
    1177:	39 c1                	cmp    %eax,%ecx
    1179:	7c 2e                	jl     11a9 <color_printk+0x4bc>
    117b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1182:	00 00 00 
    1185:	8b 40 0c             	mov    0xc(%rax),%eax
    1188:	8d 50 01             	lea    0x1(%rax),%edx
    118b:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    1192:	00 00 00 
    1195:	89 50 0c             	mov    %edx,0xc(%rax)
    1198:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    119f:	00 00 00 
    11a2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
    11a9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11b0:	00 00 00 
    11b3:	8b 48 0c             	mov    0xc(%rax),%ecx
    11b6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11bd:	00 00 00 
    11c0:	8b 40 04             	mov    0x4(%rax),%eax
    11c3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
    11ca:	00 00 00 
    11cd:	8b 7a 14             	mov    0x14(%rdx),%edi
    11d0:	99                   	cltd   
    11d1:	f7 ff                	idiv   %edi
    11d3:	39 c1                	cmp    %eax,%ecx
    11d5:	7c 11                	jl     11e8 <color_printk+0x4fb>
    11d7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
    11de:	00 00 00 
    11e1:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
    11e8:	83 85 4c ff ff ff 01 	addl   $0x1,-0xb4(%rbp)
    11ef:	8b 85 4c ff ff ff    	mov    -0xb4(%rbp),%eax
    11f5:	3b 85 44 ff ff ff    	cmp    -0xbc(%rbp),%eax
    11fb:	0f 8c ca fb ff ff    	jl     dcb <color_printk+0xde>
    1201:	83 bd 48 ff ff ff 00 	cmpl   $0x0,-0xb8(%rbp)
    1208:	0f 85 bd fb ff ff    	jne    dcb <color_printk+0xde>
    120e:	8b 85 44 ff ff ff    	mov    -0xbc(%rbp),%eax
    1214:	c9                   	leaveq 
    1215:	c3                   	retq   

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
   0:	30 31                	xor    %dh,(%rcx)
   2:	32 33                	xor    (%rbx),%dh
   4:	34 35                	xor    $0x35,%al
   6:	36 37                	ss (bad) 
   8:	38 39                	cmp    %bh,(%rcx)
   a:	41                   	rex.B
   b:	42                   	rex.X
   c:	43                   	rex.XB
   d:	44                   	rex.R
   e:	45                   	rex.RB
   f:	46                   	rex.RX
  10:	47                   	rex.RXB
  11:	48                   	rex.W
  12:	49                   	rex.WB
  13:	4a                   	rex.WX
  14:	4b                   	rex.WXB
  15:	4c                   	rex.WR
  16:	4d                   	rex.WRB
  17:	4e                   	rex.WRX
  18:	4f 50                	rex.WRXB push %r8
  1a:	51                   	push   %rcx
  1b:	52                   	push   %rdx
  1c:	53                   	push   %rbx
  1d:	54                   	push   %rsp
  1e:	55                   	push   %rbp
  1f:	56                   	push   %rsi
  20:	57                   	push   %rdi
  21:	58                   	pop    %rax
  22:	59                   	pop    %rcx
  23:	5a                   	pop    %rdx
  24:	00 00                	add    %al,(%rax)
  26:	00 00                	add    %al,(%rax)
  28:	30 31                	xor    %dh,(%rcx)
  2a:	32 33                	xor    (%rbx),%dh
  2c:	34 35                	xor    $0x35,%al
  2e:	36 37                	ss (bad) 
  30:	38 39                	cmp    %bh,(%rcx)
  32:	61                   	(bad)  
  33:	62 63 64 65 66       	(bad)
  38:	67 68 69 6a 6b 6c    	addr32 pushq $0x6c6b6a69
  3e:	6d                   	insl   (%dx),%es:(%rdi)
  3f:	6e                   	outsb  %ds:(%rsi),(%dx)
  40:	6f                   	outsl  %ds:(%rsi),(%dx)
  41:	70 71                	jo     b4 <.rodata+0xb4>
  43:	72 73                	jb     b8 <.rodata+0xb8>
  45:	74 75                	je     bc <.rodata+0xbc>
  47:	76 77                	jbe    c0 <.rodata+0xc0>
  49:	78 79                	js     c4 <.rodata+0xc4>
  4b:	7a 00                	jp     4d <.rodata+0x4d>
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
  24:	2f                   	(bad)  
  25:	00 00                	add    %al,(%rax)
  27:	00 00                	add    %al,(%rax)
  29:	41 0e                	rex.B (bad) 
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	41 83 03 69          	addl   $0x69,(%r11)
  35:	0c 07                	or     $0x7,%al
  37:	08 1c 00             	or     %bl,(%rax,%rax,1)
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	ef                   	out    %eax,(%dx)
  45:	00 00                	add    %al,(%rax)
  47:	00 00                	add    %al,(%rax)
  49:	41 0e                	rex.B (bad) 
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	02 ea                	add    %dl,%ch
  53:	0c 07                	or     $0x7,%al
  55:	08 00                	or     %al,(%rax)
  57:	00 1c 00             	add    %bl,(%rax,%rax,1)
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 60 00             	add    %ah,0x0(%rax)
  66:	00 00                	add    %al,(%rax)
  68:	00 41 0e             	add    %al,0xe(%rcx)
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	02 5b 0c             	add    0xc(%rbx),%bl
  74:	07                   	(bad)  
  75:	08 00                	or     %al,(%rax)
  77:	00 1c 00             	add    %bl,(%rax,%rax,1)
  7a:	00 00                	add    %al,(%rax)
  7c:	7c 00                	jl     7e <.eh_frame+0x7e>
  7e:	00 00                	add    %al,(%rax)
  80:	00 00                	add    %al,(%rax)
  82:	00 00                	add    %al,(%rax)
  84:	76 02                	jbe    88 <.eh_frame+0x88>
  86:	00 00                	add    %al,(%rax)
  88:	00 41 0e             	add    %al,0xe(%rcx)
  8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  91:	03 71 02             	add    0x2(%rcx),%esi
  94:	0c 07                	or     $0x7,%al
  96:	08 00                	or     %al,(%rax)
  98:	1c 00                	sbb    $0x0,%al
  9a:	00 00                	add    %al,(%rax)
  9c:	9c                   	pushfq 
  9d:	00 00                	add    %al,(%rax)
  9f:	00 00                	add    %al,(%rax)
  a1:	00 00                	add    %al,(%rax)
  a3:	00 f9                	add    %bh,%cl
  a5:	08 00                	or     %al,(%rax)
  a7:	00 00                	add    %al,(%rax)
  a9:	41 0e                	rex.B (bad) 
  ab:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  b1:	03 f4                	add    %esp,%esi
  b3:	08 0c 07             	or     %cl,(%rdi,%rax,1)
  b6:	08 00                	or     %al,(%rax)
  b8:	1c 00                	sbb    $0x0,%al
  ba:	00 00                	add    %al,(%rax)
  bc:	bc 00 00 00 00       	mov    $0x0,%esp
  c1:	00 00                	add    %al,(%rax)
  c3:	00 29                	add    %ch,(%rcx)
  c5:	05 00 00 00 41       	add    $0x41000000,%eax
  ca:	0e                   	(bad)  
  cb:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  d1:	03 24 05 0c 07 08 00 	add    0x8070c(,%rax,1),%esp
