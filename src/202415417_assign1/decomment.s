	.file	"decomment.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$1, -20(%rbp)
	movl	$-1, -16(%rbp)
	movl	$0, -12(%rbp)
.L31:
	movl	$0, -8(%rbp)
	call	getchar@PLT
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L2
	cmpl	$2, -12(%rbp)
	je	.L3
	cmpl	$3, -12(%rbp)
	jne	.L4
.L3:
	movq	stderr(%rip), %rax
	movl	-16(%rbp), %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L5
.L4:
	movl	$0, %eax
	jmp	.L5
.L2:
	movl	-4(%rbp), %eax
	movb	%al, -21(%rbp)
	cmpl	$6, -12(%rbp)
	ja	.L33
	movl	-12(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L8(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L8(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L8:
	.long	.L14-.L8
	.long	.L13-.L8
	.long	.L12-.L8
	.long	.L11-.L8
	.long	.L10-.L8
	.long	.L9-.L8
	.long	.L34-.L8
	.text
.L14:
	cmpb	$47, -21(%rbp)
	je	.L15
	movsbl	-21(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
.L15:
	cmpb	$47, -21(%rbp)
	jne	.L16
	movl	$1, -12(%rbp)
.L16:
	cmpb	$34, -21(%rbp)
	jne	.L17
	movl	$4, -12(%rbp)
.L17:
	cmpb	$39, -21(%rbp)
	jne	.L35
	movl	$5, -12(%rbp)
	jmp	.L35
.L13:
	cmpb	$47, -21(%rbp)
	jne	.L20
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	movl	$2, -12(%rbp)
	jmp	.L19
.L20:
	cmpb	$42, -21(%rbp)
	jne	.L22
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	movl	$3, -12(%rbp)
	jmp	.L19
.L22:
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$47, %edi
	call	fputc@PLT
	movsbl	-21(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	movl	$0, -12(%rbp)
	jmp	.L19
.L12:
	cmpb	$10, -21(%rbp)
	jne	.L36
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$0, -12(%rbp)
	jmp	.L36
.L11:
	cmpb	$10, -21(%rbp)
	jne	.L24
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
.L24:
	cmpb	$42, -22(%rbp)
	jne	.L37
	cmpb	$47, -21(%rbp)
	jne	.L37
	movl	$0, -12(%rbp)
	jmp	.L37
.L10:
	movsbl	-21(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	cmpb	$34, -21(%rbp)
	jne	.L38
	movl	$0, -12(%rbp)
	jmp	.L38
.L9:
	movsbl	-21(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	cmpb	$39, -21(%rbp)
	jne	.L39
	movl	$0, -12(%rbp)
	jmp	.L39
.L33:
	nop
	jmp	.L19
.L34:
	nop
	jmp	.L19
.L35:
	nop
	jmp	.L19
.L36:
	nop
	jmp	.L19
.L37:
	nop
	jmp	.L19
.L38:
	nop
	jmp	.L19
.L39:
	nop
.L19:
	cmpb	$10, -21(%rbp)
	jne	.L28
	addl	$1, -20(%rbp)
.L28:
	cmpl	$0, -8(%rbp)
	jne	.L40
	movzbl	-21(%rbp), %eax
	movb	%al, -22(%rbp)
	jmp	.L31
.L40:
	nop
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
