	.file	"decomment.c"
	.text
	.globl	state
	.bss
	.align 4
	.type	state, @object
	.size	state, 4
state:
	.zero	4
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
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$1, -20(%rbp)
	movl	$-1, -24(%rbp)
.L17:
	movl	$0, -16(%rbp)
	call	getchar@PLT
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L2
	movl	-24(%rbp), %eax
	movl	%eax, %edi
	call	func_END
	jmp	.L18
.L2:
	movl	-12(%rbp), %eax
	movb	%al, -25(%rbp)
	movl	state(%rip), %eax
	cmpl	$6, %eax
	ja	.L21
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L6(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L6(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L6:
	.long	.L12-.L6
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L22-.L6
	.text
.L12:
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	func_Code
	jmp	.L13
.L11:
	movsbl	-25(%rbp), %eax
	leaq	-24(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	func_Poss_comm
	jmp	.L13
.L10:
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	func_Single_comm
	jmp	.L13
.L9:
	movsbl	-26(%rbp), %edx
	movsbl	-25(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	func_Multi_comm
	jmp	.L13
.L8:
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	func_In_string
	jmp	.L13
.L7:
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	func_In_char
	jmp	.L13
.L21:
	nop
	jmp	.L13
.L22:
	nop
.L13:
	cmpb	$10, -25(%rbp)
	jne	.L14
	addl	$1, -20(%rbp)
.L14:
	cmpl	$0, -16(%rbp)
	jne	.L23
	movzbl	-25(%rbp), %eax
	movb	%al, -26(%rbp)
	jmp	.L17
.L23:
	nop
	movl	$0, %eax
.L18:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	func_Code
	.type	func_Code, @function
func_Code:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	je	.L25
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
.L25:
	cmpb	$47, -4(%rbp)
	jne	.L26
	movl	$1, state(%rip)
.L26:
	cmpb	$34, -4(%rbp)
	jne	.L27
	movl	$4, state(%rip)
.L27:
	cmpb	$39, -4(%rbp)
	jne	.L29
	movl	$5, state(%rip)
.L29:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	func_Code, .-func_Code
	.globl	func_Poss_comm
	.type	func_Poss_comm, @function
func_Poss_comm:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movb	%al, -4(%rbp)
	cmpb	$47, -4(%rbp)
	jne	.L31
	movq	-16(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	movl	$2, state(%rip)
	jmp	.L34
.L31:
	cmpb	$42, -4(%rbp)
	jne	.L33
	movq	-16(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$32, %edi
	call	fputc@PLT
	movl	$3, state(%rip)
	jmp	.L34
.L33:
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$47, %edi
	call	fputc@PLT
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	movl	$0, state(%rip)
.L34:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	func_Poss_comm, .-func_Poss_comm
	.globl	func_Single_comm
	.type	func_Single_comm, @function
func_Single_comm:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$10, -4(%rbp)
	jne	.L37
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	movl	$0, state(%rip)
.L37:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	func_Single_comm, .-func_Single_comm
	.globl	func_Multi_comm
	.type	func_Multi_comm, @function
func_Multi_comm:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	cmpb	$10, -4(%rbp)
	jne	.L39
	movq	stdout(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
.L39:
	cmpb	$42, -8(%rbp)
	jne	.L41
	cmpb	$47, -4(%rbp)
	jne	.L41
	movl	$0, state(%rip)
.L41:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	func_Multi_comm, .-func_Multi_comm
	.globl	func_In_string
	.type	func_In_string, @function
func_In_string:
.LFB5:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	cmpb	$34, -4(%rbp)
	jne	.L44
	movl	$0, state(%rip)
.L44:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	func_In_string, .-func_In_string
	.globl	func_In_char
	.type	func_In_char, @function
func_In_char:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	movsbl	-4(%rbp), %eax
	movq	stdout(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	fputc@PLT
	cmpb	$39, -4(%rbp)
	jne	.L47
	movl	$0, state(%rip)
.L47:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	func_In_char, .-func_In_char
	.section	.rodata
	.align 8
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.globl	func_END
	.type	func_END, @function
func_END:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	state(%rip), %eax
	cmpl	$2, %eax
	je	.L49
	movl	state(%rip), %eax
	cmpl	$3, %eax
	jne	.L50
.L49:
	movq	stderr(%rip), %rax
	movl	-4(%rbp), %edx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L51
.L50:
	movl	$0, %eax
.L51:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	func_END, .-func_END
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
