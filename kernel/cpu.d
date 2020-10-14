
cpu.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <get_cpuid>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	53                   	push   %rbx
   5:	89 7d f4             	mov    %edi,-0xc(%rbp)
   8:	89 75 f0             	mov    %esi,-0x10(%rbp)
   b:	48 89 55 e8          	mov    %rdx,-0x18(%rbp)
   f:	48 89 4d e0          	mov    %rcx,-0x20(%rbp)
  13:	4c 89 45 d8          	mov    %r8,-0x28(%rbp)
  17:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  1b:	8b 45 f4             	mov    -0xc(%rbp),%eax
  1e:	8b 55 f0             	mov    -0x10(%rbp),%edx
  21:	89 d1                	mov    %edx,%ecx
  23:	0f a2                	cpuid  
  25:	89 de                	mov    %ebx,%esi
  27:	48 8b 7d e8          	mov    -0x18(%rbp),%rdi
  2b:	89 07                	mov    %eax,(%rdi)
  2d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  31:	89 30                	mov    %esi,(%rax)
  33:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  37:	89 08                	mov    %ecx,(%rax)
  39:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  3d:	89 10                	mov    %edx,(%rax)
  3f:	90                   	nop
  40:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  44:	c9                   	leaveq 
  45:	c3                   	retq   

0000000000000046 <init_cpu>:
  46:	55                   	push   %rbp
  47:	48 89 e5             	mov    %rsp,%rbp
  4a:	48 83 ec 40          	sub    $0x40,%rsp
  4e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
  55:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
  5c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
  63:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
  6a:	48 c7 45 c0 00 00 00 	movq   $0x0,-0x40(%rbp)
  71:	00 
  72:	48 c7 45 c8 00 00 00 	movq   $0x0,-0x38(%rbp)
  79:	00 
  7a:	c6 45 d0 00          	movb   $0x0,-0x30(%rbp)
  7e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  82:	48 8d 70 0c          	lea    0xc(%rax),%rsi
  86:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  8a:	48 8d 48 08          	lea    0x8(%rax),%rcx
  8e:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  92:	48 8d 50 04          	lea    0x4(%rax),%rdx
  96:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  9a:	49 89 f1             	mov    %rsi,%r9
  9d:	49 89 c8             	mov    %rcx,%r8
  a0:	48 89 d1             	mov    %rdx,%rcx
  a3:	48 89 c2             	mov    %rax,%rdx
  a6:	be 00 00 00 00       	mov    $0x0,%esi
  ab:	bf 00 00 00 00       	mov    $0x0,%edi
  b0:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
  b7:	00 00 00 
  ba:	ff d0                	callq  *%rax
  bc:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  c0:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  c3:	89 10                	mov    %edx,(%rax)
  c5:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  c9:	48 8d 50 04          	lea    0x4(%rax),%rdx
  cd:	8b 45 ec             	mov    -0x14(%rbp),%eax
  d0:	89 02                	mov    %eax,(%rdx)
  d2:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  d6:	48 8d 50 08          	lea    0x8(%rax),%rdx
  da:	8b 45 e8             	mov    -0x18(%rbp),%eax
  dd:	89 02                	mov    %eax,(%rdx)
  df:	c6 45 cc 00          	movb   $0x0,-0x34(%rbp)
  e3:	8b 55 e8             	mov    -0x18(%rbp),%edx
  e6:	8b 75 ec             	mov    -0x14(%rbp),%esi
  e9:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
  ec:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
  f0:	48 83 ec 08          	sub    $0x8,%rsp
  f4:	52                   	push   %rdx
  f5:	41 89 f1             	mov    %esi,%r9d
  f8:	41 89 c8             	mov    %ecx,%r8d
  fb:	48 89 c1             	mov    %rax,%rcx
  fe:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 105:	00 00 00 
 108:	be 00 00 00 00       	mov    $0x0,%esi
 10d:	bf 00 ff ff 00       	mov    $0xffff00,%edi
 112:	b8 00 00 00 00       	mov    $0x0,%eax
 117:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
 11e:	00 00 00 
 121:	41 ff d2             	callq  *%r10
 124:	48 83 c4 10          	add    $0x10,%rsp
 128:	c7 45 fc 02 00 00 80 	movl   $0x80000002,-0x4(%rbp)
 12f:	e9 9d 00 00 00       	jmpq   1d1 <init_cpu+0x18b>
 134:	8b 45 fc             	mov    -0x4(%rbp),%eax
 137:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
 13b:	48 8d 7a 0c          	lea    0xc(%rdx),%rdi
 13f:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
 143:	48 8d 72 08          	lea    0x8(%rdx),%rsi
 147:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
 14b:	48 8d 4a 04          	lea    0x4(%rdx),%rcx
 14f:	48 8d 55 e0          	lea    -0x20(%rbp),%rdx
 153:	49 89 f9             	mov    %rdi,%r9
 156:	49 89 f0             	mov    %rsi,%r8
 159:	be 00 00 00 00       	mov    $0x0,%esi
 15e:	89 c7                	mov    %eax,%edi
 160:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 167:	00 00 00 
 16a:	ff d0                	callq  *%rax
 16c:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 170:	8b 55 e0             	mov    -0x20(%rbp),%edx
 173:	89 10                	mov    %edx,(%rax)
 175:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 179:	48 8d 50 04          	lea    0x4(%rax),%rdx
 17d:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 180:	89 02                	mov    %eax,(%rdx)
 182:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 186:	48 8d 50 08          	lea    0x8(%rax),%rdx
 18a:	8b 45 e8             	mov    -0x18(%rbp),%eax
 18d:	89 02                	mov    %eax,(%rdx)
 18f:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 193:	48 8d 50 0c          	lea    0xc(%rax),%rdx
 197:	8b 45 ec             	mov    -0x14(%rbp),%eax
 19a:	89 02                	mov    %eax,(%rdx)
 19c:	c6 45 d0 00          	movb   $0x0,-0x30(%rbp)
 1a0:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 1a4:	48 89 c1             	mov    %rax,%rcx
 1a7:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 1ae:	00 00 00 
 1b1:	be 00 00 00 00       	mov    $0x0,%esi
 1b6:	bf 00 ff ff 00       	mov    $0xffff00,%edi
 1bb:	b8 00 00 00 00       	mov    $0x0,%eax
 1c0:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 1c7:	00 00 00 
 1ca:	41 ff d0             	callq  *%r8
 1cd:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 1d1:	8b 45 fc             	mov    -0x4(%rbp),%eax
 1d4:	3d 04 00 00 80       	cmp    $0x80000004,%eax
 1d9:	0f 86 55 ff ff ff    	jbe    134 <init_cpu+0xee>
 1df:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 1e6:	00 00 00 
 1e9:	be 00 00 00 00       	mov    $0x0,%esi
 1ee:	bf 00 ff ff 00       	mov    $0xffff00,%edi
 1f3:	b8 00 00 00 00       	mov    $0x0,%eax
 1f8:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
 1ff:	00 00 00 
 202:	ff d1                	callq  *%rcx
 204:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 208:	48 8d 70 0c          	lea    0xc(%rax),%rsi
 20c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 210:	48 8d 48 08          	lea    0x8(%rax),%rcx
 214:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 218:	48 8d 50 04          	lea    0x4(%rax),%rdx
 21c:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 220:	49 89 f1             	mov    %rsi,%r9
 223:	49 89 c8             	mov    %rcx,%r8
 226:	48 89 d1             	mov    %rdx,%rcx
 229:	48 89 c2             	mov    %rax,%rdx
 22c:	be 00 00 00 00       	mov    $0x0,%esi
 231:	bf 01 00 00 00       	mov    $0x1,%edi
 236:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 23d:	00 00 00 
 240:	ff d0                	callq  *%rax
 242:	8b 45 e0             	mov    -0x20(%rbp),%eax
 245:	83 e0 0f             	and    $0xf,%eax
 248:	89 c6                	mov    %eax,%esi
 24a:	8b 45 e0             	mov    -0x20(%rbp),%eax
 24d:	c1 e8 0c             	shr    $0xc,%eax
 250:	83 e0 03             	and    $0x3,%eax
 253:	89 c1                	mov    %eax,%ecx
 255:	8b 45 e0             	mov    -0x20(%rbp),%eax
 258:	c1 e8 10             	shr    $0x10,%eax
 25b:	83 e0 0f             	and    $0xf,%eax
 25e:	89 c2                	mov    %eax,%edx
 260:	8b 45 e0             	mov    -0x20(%rbp),%eax
 263:	c1 e8 04             	shr    $0x4,%eax
 266:	83 e0 0f             	and    $0xf,%eax
 269:	41 89 c0             	mov    %eax,%r8d
 26c:	8b 45 e0             	mov    -0x20(%rbp),%eax
 26f:	c1 e8 14             	shr    $0x14,%eax
 272:	0f b6 f8             	movzbl %al,%edi
 275:	8b 45 e0             	mov    -0x20(%rbp),%eax
 278:	c1 e8 08             	shr    $0x8,%eax
 27b:	83 e0 0f             	and    $0xf,%eax
 27e:	48 83 ec 08          	sub    $0x8,%rsp
 282:	56                   	push   %rsi
 283:	51                   	push   %rcx
 284:	52                   	push   %rdx
 285:	45 89 c1             	mov    %r8d,%r9d
 288:	41 89 f8             	mov    %edi,%r8d
 28b:	89 c1                	mov    %eax,%ecx
 28d:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 294:	00 00 00 
 297:	be 00 00 00 00       	mov    $0x0,%esi
 29c:	bf 00 ff ff 00       	mov    $0xffff00,%edi
 2a1:	b8 00 00 00 00       	mov    $0x0,%eax
 2a6:	49 ba 00 00 00 00 00 	movabs $0x0,%r10
 2ad:	00 00 00 
 2b0:	41 ff d2             	callq  *%r10
 2b3:	48 83 c4 20          	add    $0x20,%rsp
 2b7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 2bb:	48 8d 70 0c          	lea    0xc(%rax),%rsi
 2bf:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 2c3:	48 8d 48 08          	lea    0x8(%rax),%rcx
 2c7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 2cb:	48 8d 50 04          	lea    0x4(%rax),%rdx
 2cf:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 2d3:	49 89 f1             	mov    %rsi,%r9
 2d6:	49 89 c8             	mov    %rcx,%r8
 2d9:	48 89 d1             	mov    %rdx,%rcx
 2dc:	48 89 c2             	mov    %rax,%rdx
 2df:	be 00 00 00 00       	mov    $0x0,%esi
 2e4:	bf 08 00 00 80       	mov    $0x80000008,%edi
 2e9:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 2f0:	00 00 00 
 2f3:	ff d0                	callq  *%rax
 2f5:	8b 45 e0             	mov    -0x20(%rbp),%eax
 2f8:	c1 e8 08             	shr    $0x8,%eax
 2fb:	0f b6 d0             	movzbl %al,%edx
 2fe:	8b 45 e0             	mov    -0x20(%rbp),%eax
 301:	0f b6 c0             	movzbl %al,%eax
 304:	41 89 d0             	mov    %edx,%r8d
 307:	89 c1                	mov    %eax,%ecx
 309:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 310:	00 00 00 
 313:	be 00 00 00 00       	mov    $0x0,%esi
 318:	bf 00 ff ff 00       	mov    $0xffff00,%edi
 31d:	b8 00 00 00 00       	mov    $0x0,%eax
 322:	49 b9 00 00 00 00 00 	movabs $0x0,%r9
 329:	00 00 00 
 32c:	41 ff d1             	callq  *%r9
 32f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 333:	48 8d 70 0c          	lea    0xc(%rax),%rsi
 337:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 33b:	48 8d 48 08          	lea    0x8(%rax),%rcx
 33f:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 343:	48 8d 50 04          	lea    0x4(%rax),%rdx
 347:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 34b:	49 89 f1             	mov    %rsi,%r9
 34e:	49 89 c8             	mov    %rcx,%r8
 351:	48 89 d1             	mov    %rdx,%rcx
 354:	48 89 c2             	mov    %rax,%rdx
 357:	be 00 00 00 00       	mov    $0x0,%esi
 35c:	bf 00 00 00 00       	mov    $0x0,%edi
 361:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 368:	00 00 00 
 36b:	ff d0                	callq  *%rax
 36d:	8b 45 e0             	mov    -0x20(%rbp),%eax
 370:	89 c1                	mov    %eax,%ecx
 372:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 379:	00 00 00 
 37c:	be 00 00 00 00       	mov    $0x0,%esi
 381:	bf ff ff ff 00       	mov    $0xffffff,%edi
 386:	b8 00 00 00 00       	mov    $0x0,%eax
 38b:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 392:	00 00 00 
 395:	41 ff d0             	callq  *%r8
 398:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 39c:	48 8d 70 0c          	lea    0xc(%rax),%rsi
 3a0:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 3a4:	48 8d 48 08          	lea    0x8(%rax),%rcx
 3a8:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 3ac:	48 8d 50 04          	lea    0x4(%rax),%rdx
 3b0:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
 3b4:	49 89 f1             	mov    %rsi,%r9
 3b7:	49 89 c8             	mov    %rcx,%r8
 3ba:	48 89 d1             	mov    %rdx,%rcx
 3bd:	48 89 c2             	mov    %rax,%rdx
 3c0:	be 00 00 00 00       	mov    $0x0,%esi
 3c5:	bf 00 00 00 80       	mov    $0x80000000,%edi
 3ca:	48 b8 00 00 00 00 00 	movabs $0x0,%rax
 3d1:	00 00 00 
 3d4:	ff d0                	callq  *%rax
 3d6:	8b 45 e0             	mov    -0x20(%rbp),%eax
 3d9:	89 c1                	mov    %eax,%ecx
 3db:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
 3e2:	00 00 00 
 3e5:	be 00 00 00 00       	mov    $0x0,%esi
 3ea:	bf ff ff ff 00       	mov    $0xffffff,%edi
 3ef:	b8 00 00 00 00       	mov    $0x0,%eax
 3f4:	49 b8 00 00 00 00 00 	movabs $0x0,%r8
 3fb:	00 00 00 
 3fe:	41 ff d0             	callq  *%r8
 401:	90                   	nop
 402:	c9                   	leaveq 
 403:	c3                   	retq   

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
   0:	25 73 09 25 23       	and    $0x23250973,%eax
   5:	30 31                	xor    %dh,(%rcx)
   7:	30 78 09             	xor    %bh,0x9(%rax)
   a:	25 23 30 31 30       	and    $0x30313023,%eax
   f:	78 09                	js     1a <.rodata+0x1a>
  11:	25 23 30 31 30       	and    $0x30313023,%eax
  16:	78 0a                	js     22 <.rodata+0x22>
  18:	00 25 73 00 0a 00    	add    %ah,0xa0073(%rip)        # a0091 <Pos+0x9f091>
  1e:	00 00                	add    %al,(%rax)
  20:	46 61                	rex.RX (bad) 
  22:	6d                   	insl   (%dx),%es:(%rdi)
  23:	69 6c 79 20 43 6f 64 	imul   $0x65646f43,0x20(%rcx,%rdi,2),%ebp
  2a:	65 
  2b:	3a 25 23 30 31 30    	cmp    0x30313023(%rip),%ah        # 30313054 <Pos+0x30312054>
  31:	78 2c                	js     5f <.rodata+0x5f>
  33:	45 78 74             	rex.RB js aa <.rodata+0xaa>
  36:	65 6e                	outsb  %gs:(%rsi),(%dx)
  38:	64 65 64 20 46 61    	fs gs and %al,%fs:0x61(%rsi)
  3e:	6d                   	insl   (%dx),%es:(%rdi)
  3f:	69 6c 79 3a 25 23 30 	imul   $0x31302325,0x3a(%rcx,%rdi,2),%ebp
  46:	31 
  47:	30 78 2c             	xor    %bh,0x2c(%rax)
  4a:	4d 6f                	rex.WRB outsl %ds:(%rsi),(%dx)
  4c:	64 65 6c             	fs gs insb (%dx),%es:(%rdi)
  4f:	20 4e 75             	and    %cl,0x75(%rsi)
  52:	6d                   	insl   (%dx),%es:(%rdi)
  53:	62                   	(bad)  
  54:	65 72 3a             	gs jb  91 <.rodata+0x91>
  57:	25 23 30 31 30       	and    $0x30313023,%eax
  5c:	78 2c                	js     8a <.rodata+0x8a>
  5e:	45 78 74             	rex.RB js d5 <.rodata+0xd5>
  61:	65 6e                	outsb  %gs:(%rsi),(%dx)
  63:	64 65 64 20 4d 6f    	fs gs and %cl,%fs:0x6f(%rbp)
  69:	64 65 6c             	fs gs insb (%dx),%es:(%rdi)
  6c:	3a 25 23 30 31 30    	cmp    0x30313023(%rip),%ah        # 30313095 <Pos+0x30312095>
  72:	78 2c                	js     a0 <.rodata+0xa0>
  74:	50                   	push   %rax
  75:	72 6f                	jb     e6 <.rodata+0xe6>
  77:	63 65 73             	movsxd 0x73(%rbp),%esp
  7a:	73 6f                	jae    eb <.rodata+0xeb>
  7c:	72 20                	jb     9e <.rodata+0x9e>
  7e:	54                   	push   %rsp
  7f:	79 70                	jns    f1 <.rodata+0xf1>
  81:	65 3a 25 23 30 31 30 	cmp    %gs:0x30313023(%rip),%ah        # 303130ab <Pos+0x303120ab>
  88:	78 2c                	js     b6 <.rodata+0xb6>
  8a:	53                   	push   %rbx
  8b:	74 65                	je     f2 <.rodata+0xf2>
  8d:	70 70                	jo     ff <.rodata+0xff>
  8f:	69 6e 67 20 49 44 3a 	imul   $0x3a444920,0x67(%rsi),%ebp
  96:	25 23 30 31 30       	and    $0x30313023,%eax
  9b:	78 0a                	js     a7 <.rodata+0xa7>
  9d:	00 00                	add    %al,(%rax)
  9f:	00 50 68             	add    %dl,0x68(%rax)
  a2:	79 73                	jns    117 <.rodata+0x117>
  a4:	69 63 61 6c 20 41 64 	imul   $0x6441206c,0x61(%rbx),%esp
  ab:	64 72 65             	fs jb  113 <.rodata+0x113>
  ae:	73 73                	jae    123 <.rodata+0x123>
  b0:	20 73 69             	and    %dh,0x69(%rbx)
  b3:	7a 65                	jp     11a <.rodata+0x11a>
  b5:	3a 25 30 38 64 2c    	cmp    0x2c643830(%rip),%ah        # 2c6438eb <Pos+0x2c6428eb>
  bb:	4c 69 6e 65 61 72 20 	imul   $0x41207261,0x65(%rsi),%r13
  c2:	41 
  c3:	64 64 72 65          	fs fs jb 12c <init_cpu+0xe6>
  c7:	73 73                	jae    13c <init_cpu+0xf6>
  c9:	20 73 69             	and    %dh,0x69(%rbx)
  cc:	7a 65                	jp     133 <init_cpu+0xed>
  ce:	3a 25 30 38 64 0a    	cmp    0xa643830(%rip),%ah        # a643904 <Pos+0xa642904>
  d4:	00 00                	add    %al,(%rax)
  d6:	00 00                	add    %al,(%rax)
  d8:	4d                   	rex.WRB
  d9:	41 58                	pop    %r8
  db:	20 42 61             	and    %al,0x61(%rdx)
  de:	73 69                	jae    149 <init_cpu+0x103>
  e0:	63 20                	movsxd (%rax),%esp
  e2:	4f 70 65             	rex.WRXB jo 14a <init_cpu+0x104>
  e5:	72 61                	jb     148 <init_cpu+0x102>
  e7:	74 69                	je     152 <init_cpu+0x10c>
  e9:	6f                   	outsl  %ds:(%rsi),(%dx)
  ea:	6e                   	outsb  %ds:(%rsi),(%dx)
  eb:	20 43 6f             	and    %al,0x6f(%rbx)
  ee:	64 65 20 3a          	fs and %bh,%gs:(%rdx)
  f2:	25 23 30 31 30       	and    $0x30313023,%eax
  f7:	78 09                	js     102 <.rodata+0x102>
  f9:	00 00                	add    %al,(%rax)
  fb:	00 00                	add    %al,(%rax)
  fd:	00 00                	add    %al,(%rax)
  ff:	00 4d 41             	add    %cl,0x41(%rbp)
 102:	58                   	pop    %rax
 103:	20 45 78             	and    %al,0x78(%rbp)
 106:	74 65                	je     16d <init_cpu+0x127>
 108:	6e                   	outsb  %ds:(%rsi),(%dx)
 109:	64 65 64 20 4f 70    	fs gs and %cl,%fs:0x70(%rdi)
 10f:	65 72 61             	gs jb  173 <init_cpu+0x12d>
 112:	74 69                	je     17d <init_cpu+0x137>
 114:	6f                   	outsl  %ds:(%rsi),(%dx)
 115:	6e                   	outsb  %ds:(%rsi),(%dx)
 116:	20 43 6f             	and    %al,0x6f(%rbx)
 119:	64 65 20 3a          	fs and %bh,%gs:(%rdx)
 11d:	25 23 30 31 30       	and    $0x30313023,%eax
 122:	78 0a                	js     12e <init_cpu+0xe8>
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
  13:	08 90 01 00 00 20    	or     %dl,0x20000001(%rax)
  19:	00 00                	add    %al,(%rax)
  1b:	00 1c 00             	add    %bl,(%rax,%rax,1)
  1e:	00 00                	add    %al,(%rax)
  20:	00 00                	add    %al,(%rax)
  22:	00 00                	add    %al,(%rax)
  24:	46 00 00             	rex.RX add %r8b,(%rax)
  27:	00 00                	add    %al,(%rax)
  29:	41 0e                	rex.B (bad) 
  2b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  31:	41 83 03 02          	addl   $0x2,(%r11)
  35:	40 0c 07             	or     $0x7,%al
  38:	08 00                	or     %al,(%rax)
  3a:	00 00                	add    %al,(%rax)
  3c:	20 00                	and    %al,(%rax)
  3e:	00 00                	add    %al,(%rax)
  40:	40 00 00             	add    %al,(%rax)
  43:	00 00                	add    %al,(%rax)
  45:	00 00                	add    %al,(%rax)
  47:	00 be 03 00 00 00    	add    %bh,0x3(%rsi)
  4d:	41 0e                	rex.B (bad) 
  4f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
  55:	03 b9 03 0c 07 08    	add    0x8070c03(%rcx),%edi
  5b:	00 00                	add    %al,(%rax)
  5d:	00 00                	add    %al,(%rax)
	...
