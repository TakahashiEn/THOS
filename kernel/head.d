
head.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <_start>:
       0:	66 b8 10 00          	mov    $0x10,%ax
       4:	8e d8                	mov    %eax,%ds
       6:	8e c0                	mov    %eax,%es
       8:	8e e0                	mov    %eax,%fs
       a:	8e d0                	mov    %eax,%ss
       c:	bc 00 7e 00 00       	mov    $0x7e00,%esp
      11:	0f 01 15 00 00 00 00 	lgdt   0x0(%rip)        # 18 <_start+0x18>
      18:	0f 01 1d 00 00 00 00 	lidt   0x0(%rip)        # 1f <_start+0x1f>
      1f:	66 b8 10 00          	mov    $0x10,%ax
      23:	8e d8                	mov    %eax,%ds
      25:	8e c0                	mov    %eax,%es
      27:	8e e0                	mov    %eax,%fs
      29:	8e e8                	mov    %eax,%gs
      2b:	8e d0                	mov    %eax,%ss
      2d:	48 c7 c4 00 7e 00 00 	mov    $0x7e00,%rsp
      34:	48 c7 c0 00 10 10 00 	mov    $0x101000,%rax
      3b:	0f 22 d8             	mov    %rax,%cr3
      3e:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # 4a <switch_seg>
      45:	6a 08                	pushq  $0x8
      47:	50                   	push   %rax
      48:	48 cb                	lretq  

000000000000004a <switch_seg>:
	...

0000000000000052 <entry64>:
      52:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
      59:	48 8e d8             	mov    %rax,%ds
      5c:	48 8e c0             	mov    %rax,%es
      5f:	48 8e e8             	mov    %rax,%gs
      62:	48 8e d0             	mov    %rax,%ss
      65:	48 8b 25 00 00 00 00 	mov    0x0(%rip),%rsp        # 6c <setup_IDT>

000000000000006c <setup_IDT>:
      6c:	48 8d 15 a6 00 00 00 	lea    0xa6(%rip),%rdx        # 119 <ignore_int>
      73:	48 c7 c0 00 00 08 00 	mov    $0x80000,%rax
      7a:	66 89 d0             	mov    %dx,%ax
      7d:	48 b9 00 00 00 00 00 	movabs $0x8e0000000000,%rcx
      84:	8e 00 00 
      87:	48 01 c8             	add    %rcx,%rax
      8a:	89 d1                	mov    %edx,%ecx
      8c:	c1 e9 10             	shr    $0x10,%ecx
      8f:	48 c1 e1 30          	shl    $0x30,%rcx
      93:	48 01 c8             	add    %rcx,%rax
      96:	48 c1 ea 20          	shr    $0x20,%rdx
      9a:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # a1 <setup_IDT+0x35>
      a1:	48 c7 c1 00 01 00 00 	mov    $0x100,%rcx

00000000000000a8 <rp_sidt>:
      a8:	48 89 07             	mov    %rax,(%rdi)
      ab:	48 89 57 08          	mov    %rdx,0x8(%rdi)
      af:	48 83 c7 10          	add    $0x10,%rdi
      b3:	48 ff c9             	dec    %rcx
      b6:	75 f0                	jne    a8 <rp_sidt>

00000000000000b8 <setup_TSS64>:
      b8:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # bf <setup_TSS64+0x7>
      bf:	48 31 c0             	xor    %rax,%rax
      c2:	48 31 c9             	xor    %rcx,%rcx
      c5:	48 c7 c0 89 00 00 00 	mov    $0x89,%rax
      cc:	48 c1 e0 28          	shl    $0x28,%rax
      d0:	89 d1                	mov    %edx,%ecx
      d2:	c1 e9 18             	shr    $0x18,%ecx
      d5:	48 c1 e1 38          	shl    $0x38,%rcx
      d9:	48 01 c8             	add    %rcx,%rax
      dc:	48 31 c9             	xor    %rcx,%rcx
      df:	89 d1                	mov    %edx,%ecx
      e1:	81 e1 ff ff ff 00    	and    $0xffffff,%ecx
      e7:	48 c1 e1 10          	shl    $0x10,%rcx
      eb:	48 01 c8             	add    %rcx,%rax
      ee:	48 83 c0 67          	add    $0x67,%rax
      f2:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # f9 <setup_TSS64+0x41>
      f9:	48 89 47 50          	mov    %rax,0x50(%rdi)
      fd:	48 c1 ea 20          	shr    $0x20,%rdx
     101:	48 89 57 58          	mov    %rdx,0x58(%rdi)
     105:	48 8b 05 05 00 00 00 	mov    0x5(%rip),%rax        # 111 <go_to_kernel>
     10c:	6a 08                	pushq  $0x8
     10e:	50                   	push   %rax
     10f:	48 cb                	lretq  

0000000000000111 <go_to_kernel>:
	...

0000000000000119 <ignore_int>:
     119:	fc                   	cld    
     11a:	50                   	push   %rax
     11b:	53                   	push   %rbx
     11c:	51                   	push   %rcx
     11d:	52                   	push   %rdx
     11e:	55                   	push   %rbp
     11f:	57                   	push   %rdi
     120:	56                   	push   %rsi
     121:	41 50                	push   %r8
     123:	41 51                	push   %r9
     125:	41 52                	push   %r10
     127:	41 53                	push   %r11
     129:	41 54                	push   %r12
     12b:	41 55                	push   %r13
     12d:	41 56                	push   %r14
     12f:	41 57                	push   %r15
     131:	48 8c c0             	mov    %es,%rax
     134:	50                   	push   %rax
     135:	48 8c d8             	mov    %ds,%rax
     138:	50                   	push   %rax
     139:	48 c7 c0 10 00 00 00 	mov    $0x10,%rax
     140:	48 8e d8             	mov    %rax,%ds
     143:	48 8e c0             	mov    %rax,%es
     146:	48 8d 05 45 00 00 00 	lea    0x45(%rip),%rax        # 192 <int_msg>
     14d:	50                   	push   %rax
     14e:	48 89 c2             	mov    %rax,%rdx
     151:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
     158:	48 c7 c7 00 00 ff 00 	mov    $0xff0000,%rdi
     15f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax
     166:	e8 00 00 00 00       	callq  16b <ignore_int+0x52>
     16b:	48 83 c4 08          	add    $0x8,%rsp

000000000000016f <Loop>:
     16f:	eb fe                	jmp    16f <Loop>
     171:	58                   	pop    %rax
     172:	48 8e d8             	mov    %rax,%ds
     175:	58                   	pop    %rax
     176:	48 8e c0             	mov    %rax,%es
     179:	41 5f                	pop    %r15
     17b:	41 5e                	pop    %r14
     17d:	41 5d                	pop    %r13
     17f:	41 5c                	pop    %r12
     181:	41 5b                	pop    %r11
     183:	41 5a                	pop    %r10
     185:	41 59                	pop    %r9
     187:	41 58                	pop    %r8
     189:	5e                   	pop    %rsi
     18a:	5f                   	pop    %rdi
     18b:	5d                   	pop    %rbp
     18c:	5a                   	pop    %rdx
     18d:	59                   	pop    %rcx
     18e:	5b                   	pop    %rbx
     18f:	58                   	pop    %rax
     190:	48 cf                	iretq  

0000000000000192 <int_msg>:
     192:	55                   	push   %rbp
     193:	6e                   	outsb  %ds:(%rsi),(%dx)
     194:	6b 6e 6f 77          	imul   $0x77,0x6f(%rsi),%ebp
     198:	6e                   	outsb  %ds:(%rsi),(%dx)
     199:	20 69 6e             	and    %ch,0x6e(%rcx)
     19c:	74 65                	je     203 <_stack_start+0x4e>
     19e:	72 72                	jb     212 <_stack_start+0x5d>
     1a0:	75 70                	jne    212 <_stack_start+0x5d>
     1a2:	74 20                	je     1c4 <_stack_start+0xf>
     1a4:	6f                   	outsl  %ds:(%rsi),(%dx)
     1a5:	72 20                	jb     1c7 <_stack_start+0x12>
     1a7:	66 61                	data16 (bad) 
     1a9:	75 6c                	jne    217 <_stack_start+0x62>
     1ab:	74 20                	je     1cd <_stack_start+0x18>
     1ad:	61                   	(bad)  
     1ae:	74 20                	je     1d0 <_stack_start+0x1b>
     1b0:	52                   	push   %rdx
     1b1:	49 50                	rex.WB push %r8
     1b3:	0a 00                	or     (%rax),%al

00000000000001b5 <_stack_start>:
	...
     1bd:	0f 1f 00             	nopl   (%rax)
	...

0000000000001000 <__PML4E>:
    1000:	07                   	(bad)  
    1001:	20 10                	and    %dl,(%rax)
	...
    17ff:	00 07                	add    %al,(%rdi)
    1801:	20 10                	and    %dl,(%rax)
	...

0000000000002000 <__PDPTE>:
    2000:	07                   	(bad)  
    2001:	30 10                	xor    %dl,(%rax)
	...

0000000000003000 <__PDE>:
    3000:	87 00                	xchg   %eax,(%rax)
    3002:	00 00                	add    %al,(%rax)
    3004:	00 00                	add    %al,(%rax)
    3006:	00 00                	add    %al,(%rax)
    3008:	87 00                	xchg   %eax,(%rax)
    300a:	20 00                	and    %al,(%rax)
    300c:	00 00                	add    %al,(%rax)
    300e:	00 00                	add    %al,(%rax)
    3010:	87 00                	xchg   %eax,(%rax)
    3012:	40 00 00             	add    %al,(%rax)
    3015:	00 00                	add    %al,(%rax)
    3017:	00 87 00 60 00 00    	add    %al,0x6000(%rdi)
    301d:	00 00                	add    %al,(%rax)
    301f:	00 87 00 80 00 00    	add    %al,0x8000(%rdi)
    3025:	00 00                	add    %al,(%rax)
    3027:	00 87 00 00 e0 00    	add    %al,0xe00000(%rdi)
    302d:	00 00                	add    %al,(%rax)
    302f:	00 87 00 20 e0 00    	add    %al,0xe02000(%rdi)
    3035:	00 00                	add    %al,(%rax)
    3037:	00 87 00 40 e0 00    	add    %al,0xe04000(%rdi)
    303d:	00 00                	add    %al,(%rax)
    303f:	00 87 00 60 e0 00    	add    %al,0xe06000(%rdi)
    3045:	00 00                	add    %al,(%rax)
    3047:	00 87 00 80 e0 00    	add    %al,0xe08000(%rdi)
    304d:	00 00                	add    %al,(%rax)
    304f:	00 87 00 a0 e0 00    	add    %al,0xe0a000(%rdi)
    3055:	00 00                	add    %al,(%rax)
    3057:	00 87 00 c0 e0 00    	add    %al,0xe0c000(%rdi)
    305d:	00 00                	add    %al,(%rax)
    305f:	00 87 00 e0 e0 00    	add    %al,0xe0e000(%rdi)
	...

Disassembly of section .data:

0000000000000000 <GDT_Table>:
	...
       c:	00 98 20 00 00 00    	add    %bl,0x20(%rax)
      12:	00 00                	add    %al,(%rax)
      14:	00 92 00 00 00 00    	add    %dl,0x0(%rdx)
	...
      2a:	00 00                	add    %al,(%rax)
      2c:	00 f8                	add    %bh,%al
      2e:	20 00                	and    %al,(%rax)
      30:	00 00                	add    %al,(%rax)
      32:	00 00                	add    %al,(%rax)
      34:	00 f2                	add    %dh,%dl
      36:	00 00                	add    %al,(%rax)
      38:	ff                   	(bad)  
      39:	ff 00                	incl   (%rax)
      3b:	00 00                	add    %al,(%rax)
      3d:	9a                   	(bad)  
      3e:	cf                   	iret   
      3f:	00 ff                	add    %bh,%bh
      41:	ff 00                	incl   (%rax)
      43:	00 00                	add    %al,(%rax)
      45:	92                   	xchg   %eax,%edx
      46:	cf                   	iret   
	...

0000000000000098 <GDT_END>:
      98:	97                   	xchg   %eax,%edi
	...

000000000000009a <GDT_BASE>:
	...

00000000000000a2 <IDT_Table>:
	...

00000000000010a2 <IDT_END>:
    10a2:	ff 0f                	decl   (%rdi)

00000000000010a4 <IDT_BASE>:
	...

00000000000010ac <TSS64_Table>:
	...

0000000000001114 <TSS64_END>:
    1114:	67 00              	add    %al,(%eax)

0000000000001116 <TSS64_BASE>:
	...
