
main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <set_tss64>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
   8:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
   c:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
  10:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  14:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
  18:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  1c:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  23:	00 00 00 
  26:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  2a:	48 89 02             	mov    %rax,(%rdx)
  2d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  34:	00 00 00 
  37:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  3b:	48 89 02             	mov    %rax,(%rdx)
  3e:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  45:	00 00 00 
  48:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4c:	48 89 02             	mov    %rax,(%rdx)
  4f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  56:	00 00 00 
  59:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  5d:	48 89 02             	mov    %rax,(%rdx)
  60:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  67:	00 00 00 
  6a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  6e:	48 89 02             	mov    %rax,(%rdx)
  71:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  78:	00 00 00 
  7b:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  7f:	48 89 02             	mov    %rax,(%rdx)
  82:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  89:	00 00 00 
  8c:	48 8b 45 10          	mov    0x10(%rbp),%rax
  90:	48 89 02             	mov    %rax,(%rdx)
  93:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  9a:	00 00 00 
  9d:	48 8b 45 18          	mov    0x18(%rbp),%rax
  a1:	48 89 02             	mov    %rax,(%rdx)
  a4:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  ab:	00 00 00 
  ae:	48 8b 45 20          	mov    0x20(%rbp),%rax
  b2:	48 89 02             	mov    %rax,(%rdx)
  b5:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  bc:	00 00 00 
  bf:	48 8b 45 28          	mov    0x28(%rbp),%rax
  c3:	48 89 02             	mov    %rax,(%rdx)
  c6:	90                   	nop
  c7:	5d                   	pop    %rbp
  c8:	c3                   	retq   

00000000000000c9 <no_system_call>:
  c9:	55                   	push   %rbp
  ca:	48 89 e5             	mov    %rsp,%rbp
  cd:	48 83 ec 10          	sub    $0x10,%rsp
  d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  d9:	48 8b 80 80 00 00 00 	mov    0x80(%rax),%rax
  e0:	48 89 c1             	mov    %rax,%rcx
  e3:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  ea:	00 00 00 
  ed:	be 00 00 00 00       	mov    $0x0,%esi
  f2:	bf 00 00 ff 00       	mov    $0xff0000,%edi
  f7:	b8 00 00 00 00       	mov    $0x0,%eax
  fc:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 103:	00 00 00 
 106:	41 ff d0             	callq  *%r8
 109:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
 110:	c9                   	leaveq 
 111:	c3                   	retq   

0000000000000112 <sys_printf>:
 112:	55                   	push   %rbp
 113:	48 89 e5             	mov    %rsp,%rbp
 116:	48 83 ec 10          	sub    $0x10,%rsp
 11a:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 11e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 122:	48 8b 40 60          	mov    0x60(%rax),%rax
 126:	48 89 c2             	mov    %rax,%rdx
 129:	be ff ff ff 00       	mov    $0xffffff,%esi
 12e:	bf 00 00 00 00       	mov    $0x0,%edi
 133:	b8 00 00 00 00       	mov    $0x0,%eax
 138:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 13f:	00 00 00 
 142:	ff d1                	callq  *%rcx
 144:	b8 01 00 00 00       	mov    $0x1,%eax
 149:	c9                   	leaveq 
 14a:	c3                   	retq   

000000000000014b <Start_Kernel>:
 14b:	55                   	push   %rbp
 14c:	48 89 e5             	mov    %rsp,%rbp
 14f:	48 83 ec 10          	sub    $0x10,%rsp
 153:	48 bf 00 00 a0 00 00 	movabs $0xffff800000a00000,%rdi
 15a:	80 ff ff 
 15d:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 161:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 168:	00 00 00 
 16b:	c7 00 a0 05 00 00    	movl   $0x5a0,(%rax)
 171:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 178:	00 00 00 
 17b:	c7 40 04 84 03 00 00 	movl   $0x384,0x4(%rax)
 182:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 189:	00 00 00 
 18c:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
 193:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 19a:	00 00 00 
 19d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
 1a4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1ab:	00 00 00 
 1ae:	c7 40 10 08 00 00 00 	movl   $0x8,0x10(%rax)
 1b5:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1bc:	00 00 00 
 1bf:	c7 40 14 10 00 00 00 	movl   $0x10,0x14(%rax)
 1c6:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1cd:	00 00 00 
 1d0:	48 89 78 18          	mov    %rdi,0x18(%rax)
 1d4:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1db:	00 00 00 
 1de:	8b 10                	mov    (%rax),%edx
 1e0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 1e7:	00 00 00 
 1ea:	8b 40 04             	mov    0x4(%rax),%eax
 1ed:	0f af c2             	imul   %edx,%eax
 1f0:	c1 e0 02             	shl    $0x2,%eax
 1f3:	48 98                	cltq   
 1f5:	48 05 ff 0f 00 00    	add    $0xfff,%rax
 1fb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
 201:	48 89 c2             	mov    %rax,%rdx
 204:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 20b:	00 00 00 
 20e:	48 89 50 20          	mov    %rdx,0x20(%rax)
 212:	b8 50 00 00 00       	mov    $0x50,%eax
 217:	0f 00 d8             	ltr    %ax
 21a:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 221:	00 00 00 
 224:	48 8b 10             	mov    (%rax),%rdx
 227:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 22e:	00 00 00 
 231:	48 8b 30             	mov    (%rax),%rsi
 234:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 23b:	00 00 00 
 23e:	48 8b 00             	mov    (%rax),%rax
 241:	68 00 7c 00 00       	pushq  $0x7c00
 246:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
 24d:	ff 
 24e:	68 00 7c 00 00       	pushq  $0x7c00
 253:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
 25a:	ff 
 25b:	68 00 7c 00 00       	pushq  $0x7c00
 260:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
 267:	ff 
 268:	68 00 7c 00 00       	pushq  $0x7c00
 26d:	c7 44 24 04 00 80 ff 	movl   $0xffff8000,0x4(%rsp)
 274:	ff 
 275:	49 b9 00 7c 00 00 00 	movabs $0xffff800000007c00,%r9
 27c:	80 ff ff 
 27f:	49 b8 00 7c 00 00 00 	movabs $0xffff800000007c00,%r8
 286:	80 ff ff 
 289:	48 b9 00 7c 00 00 00 	movabs $0xffff800000007c00,%rcx
 290:	80 ff ff 
 293:	48 89 c7             	mov    %rax,%rdi
 296:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 29d:	00 00 00 
 2a0:	ff d0                	callq  *%rax
 2a2:	48 83 c4 20          	add    $0x20,%rsp
 2a6:	b8 00 00 00 00       	mov    $0x0,%eax
 2ab:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2b2:	00 00 00 
 2b5:	ff d2                	callq  *%rdx
 2b7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2be:	00 00 00 
 2c1:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2c8:	00 00 00 
 2cb:	48 89 90 d0 02 00 00 	mov    %rdx,0x2d0(%rax)
 2d2:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2d9:	00 00 00 
 2dc:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2e3:	00 00 00 
 2e6:	48 89 90 d8 02 00 00 	mov    %rdx,0x2d8(%rax)
 2ed:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 2f4:	00 00 00 
 2f7:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2fe:	00 00 00 
 301:	48 89 90 e0 02 00 00 	mov    %rdx,0x2e0(%rax)
 308:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 30f:	00 00 00 
 312:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 319:	00 00 00 
 31c:	48 89 90 e8 02 00 00 	mov    %rdx,0x2e8(%rax)
 323:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 32a:	00 00 00 
 32d:	be 00 00 00 00       	mov    $0x0,%esi
 332:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 337:	b8 00 00 00 00       	mov    $0x0,%eax
 33c:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 343:	00 00 00 
 346:	ff d1                	callq  *%rcx
 348:	b8 00 00 00 00       	mov    $0x0,%eax
 34d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 354:	00 00 00 
 357:	ff d2                	callq  *%rdx
 359:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 360:	00 00 00 
 363:	be 00 00 00 00       	mov    $0x0,%esi
 368:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 36d:	b8 00 00 00 00       	mov    $0x0,%eax
 372:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 379:	00 00 00 
 37c:	ff d1                	callq  *%rcx
 37e:	b8 00 00 00 00       	mov    $0x0,%eax
 383:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 38a:	00 00 00 
 38d:	ff d2                	callq  *%rdx
 38f:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 396:	00 00 00 
 399:	be 00 00 00 00       	mov    $0x0,%esi
 39e:	bf 00 00 ff 00       	mov    $0xff0000,%edi
 3a3:	b8 00 00 00 00       	mov    $0x0,%eax
 3a8:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 3af:	00 00 00 
 3b2:	ff d1                	callq  *%rcx
 3b4:	b8 00 00 00 00       	mov    $0x0,%eax
 3b9:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 3c0:	00 00 00 
 3c3:	ff d2                	callq  *%rdx
 3c5:	eb fe                	jmp    3c5 <Start_Kernel+0x27a>

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

00000000000010a0 <memory_management_struct>:
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
   3:	73 79                	jae    7e <set_tss64+0x7e>
   5:	73 74                	jae    7b <set_tss64+0x7b>
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
  24:	6d                   	insl   (%dx),%es:(%rdi)
  25:	65 6d                	gs insl (%dx),%es:(%rdi)
  27:	6f                   	outsl  %ds:(%rsi),(%dx)
  28:	72 79                	jb     a3 <set_tss64+0xa3>
  2a:	20 69 6e             	and    %ch,0x6e(%rcx)
  2d:	69 74 20 0a 00 69 6e 	imul   $0x746e6900,0xa(%rax,%riz,1),%esi
  34:	74 
  35:	65 72 72             	gs jb  aa <set_tss64+0xaa>
  38:	75 70                	jne    aa <set_tss64+0xaa>
  3a:	74 20                	je     5c <set_tss64+0x5c>
  3c:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp
  43:	74 61                	je     a6 <set_tss64+0xa6>
  45:	73 6b                	jae    b2 <set_tss64+0xb2>
  47:	5f                   	pop    %rdi
  48:	69 6e 69 74 20 0a 00 	imul   $0xa2074,0x69(%rsi),%ebp

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
  24:	c9                   	leaveq 
  25:	00 00                	add    %al,(%rax)
  27:	00 00                	add    %al,(%rax)
  29:	41 0e                	rex.B (bad) 
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	02 c4                	add    %ah,%al
  33:	0c 07                	or     $0x7,%al
  35:	08 00                	or     %al,(%rax)
  37:	00 1c 00             	add    %bl,(%rax,%rax,1)
  3a:	00 00                	add    %al,(%rax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%rax)
  40:	00 00                	add    %al,(%rax)
  42:	00 00                	add    %al,(%rax)
  44:	49 00 00             	rex.WB add %al,(%r8)
  47:	00 00                	add    %al,(%rax)
  49:	41 0e                	rex.B (bad) 
  4b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  51:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
  55:	08 00                	or     %al,(%rax)
  57:	00 1c 00             	add    %bl,(%rax,%rax,1)
  5a:	00 00                	add    %al,(%rax)
  5c:	5c                   	pop    %rsp
  5d:	00 00                	add    %al,(%rax)
  5f:	00 00                	add    %al,(%rax)
  61:	00 00                	add    %al,(%rax)
  63:	00 39                	add    %bh,(%rcx)
  65:	00 00                	add    %al,(%rax)
  67:	00 00                	add    %al,(%rax)
  69:	41 0e                	rex.B (bad) 
  6b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  71:	74 0c                	je     7f <.eh_frame+0x7f>
  73:	07                   	(bad)  
  74:	08 00                	or     %al,(%rax)
  76:	00 00                	add    %al,(%rax)
  78:	1c 00                	sbb    $0x0,%al
  7a:	00 00                	add    %al,(%rax)
  7c:	7c 00                	jl     7e <.eh_frame+0x7e>
  7e:	00 00                	add    %al,(%rax)
  80:	00 00                	add    %al,(%rax)
  82:	00 00                	add    %al,(%rax)
  84:	7c 02                	jl     88 <.eh_frame+0x88>
  86:	00 00                	add    %al,(%rax)
  88:	00 41 0e             	add    %al,0xe(%rcx)
  8b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  91:	00 00                	add    %al,(%rax)
  93:	00 00                	add    %al,(%rax)
  95:	00 00                	add    %al,(%rax)
	...
