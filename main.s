	.file	"main.c"
	.text
	.globl	strcount
	.def	strcount;	.scl	2;	.type	32;	.endef
	.seh_proc	strcount
strcount:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, %eax
	movb	%al, 24(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, 24(%rbp)
	sete	%al
	movzbl	%al, %eax
	addl	%eax, -4(%rbp)
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	fsize
	.def	fsize;	.scl	2;	.type	32;	.endef
	.seh_proc	fsize
fsize:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rcx
	call	ftell
	movl	%eax, -4(%rbp)
	movl	$2, %r8d
	movl	$0, %edx
	movq	16(%rbp), %rcx
	call	fseek
	movq	16(%rbp), %rcx
	call	ftell
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	fseek
	movl	-8(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Help about this program:\12TODO\12List of the options available:\12--help | -h [topic]\12-to-c <input file> <output file>\12--exec | -e <input file> |<program in a string>\0"
.LC1:
	.ascii "--help\0"
.LC2:
	.ascii "-h\0"
	.align 8
.LC3:
	.ascii "Help for the option \"--help\":\12TODO\0"
.LC4:
	.ascii "-to-c\0"
	.align 8
.LC5:
	.ascii "Help for the option \"-to-c\":\12TODO\0"
.LC6:
	.ascii "-exec\0"
.LC7:
	.ascii "-e\0"
	.align 8
.LC8:
	.ascii "Help for the option \"--exec\":\12TODO\0"
.LC9:
	.ascii "--help: Not a topic: %s\12\0"
	.text
	.globl	cli_help
	.def	cli_help;	.scl	2;	.type	32;	.endef
	.seh_proc	cli_help
cli_help:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	jne	.L8
	leaq	.LC0(%rip), %rcx
	call	puts
	movl	$0, %eax
	jmp	.L9
.L8:
	leaq	.LC1(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L10
	leaq	.LC2(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L11
.L10:
	leaq	.LC3(%rip), %rcx
	call	puts
	movl	$0, %eax
	jmp	.L9
.L11:
	leaq	.LC4(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L12
	leaq	.LC5(%rip), %rcx
	call	puts
	movl	$0, %eax
	jmp	.L9
.L12:
	leaq	.LC6(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L13
	leaq	.LC7(%rip), %rdx
	movq	16(%rbp), %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L14
.L13:
	leaq	.LC8(%rip), %rcx
	call	puts
	movl	$0, %eax
	jmp	.L9
.L14:
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movq	16(%rbp), %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
.L9:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "ERROR:%li: no '[' found\0"
	.text
	.globl	exec
	.def	exec;	.scl	2;	.type	32;	.endef
	.seh_proc	exec
exec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L16
.L17:
	movl	-4(%rbp), %eax
	cltq
	movb	$0, -26(%rbp,%rax)
	addl	$1, -4(%rbp)
.L16:
	cmpl	$8, -4(%rbp)
	jle	.L17
	movl	$0, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	$-1, -16(%rbp)
.L32:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$43, %eax
	cmpl	$50, %eax
	ja	.L34
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L20(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L20(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L20:
	.long	.L27-.L20
	.long	.L26-.L20
	.long	.L25-.L20
	.long	.L24-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L23-.L20
	.long	.L34-.L20
	.long	.L22-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L34-.L20
	.long	.L21-.L20
	.long	.L34-.L20
	.long	.L19-.L20
	.text
.L27:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-26(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	movzbl	%dl, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	cltq
	movb	%dl, -26(%rbp,%rax)
	jmp	.L28
.L25:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-26(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	movzbl	%dl, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	cltq
	movb	%dl, -26(%rbp,%rax)
	jmp	.L28
.L22:
	movl	-8(%rbp), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	jmp	.L28
.L23:
	movl	-8(%rbp), %eax
	leal	-1(%rax), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -8(%rbp)
	jmp	.L28
.L21:
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L28
.L19:
	cmpl	$-1, -16(%rbp)
	jne	.L29
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	-12(%rbp), %edx
	movl	%edx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L33
.L29:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-26(%rbp,%rax), %eax
	testb	%al, %al
	je	.L35
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L35
.L24:
	movl	-8(%rbp), %eax
	cltq
	movzbl	-26(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	putchar
	jmp	.L28
.L26:
	call	getchar
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	cltq
	movb	%dl, -26(%rbp,%rax)
	jmp	.L28
.L34:
	nop
	jmp	.L28
.L35:
	nop
.L28:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$-1, %al
	jne	.L32
	movl	$0, %eax
.L33:
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	execf
	.def	execf;	.scl	2;	.type	32;	.endef
	.seh_proc	execf
execf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -32(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L37
.L38:
	movl	-68(%rbp), %eax
	cltq
	movb	$0, -91(%rbp,%rax)
	addl	$1, -68(%rbp)
.L37:
	cmpl	$8, -68(%rbp)
	jle	.L38
	movl	$0, -72(%rbp)
	movl	$0, %r8d
	movl	$0, %edx
	movq	-32(%rbp), %rcx
	call	fseek
	movl	$-1, -76(%rbp)
	movl	$0, -80(%rbp)
.L54:
	movq	-32(%rbp), %rcx
	call	getc
	movb	%al, -81(%rbp)
	movsbl	-81(%rbp), %eax
	subl	$43, %eax
	cmpl	$50, %eax
	ja	.L56
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L41(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L41(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L41:
	.long	.L48-.L41
	.long	.L47-.L41
	.long	.L46-.L41
	.long	.L45-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L44-.L41
	.long	.L56-.L41
	.long	.L43-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L56-.L41
	.long	.L42-.L41
	.long	.L56-.L41
	.long	.L40-.L41
	.text
.L48:
	movl	-72(%rbp), %eax
	cltq
	movzbl	-91(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	movzbl	%dl, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-72(%rbp), %eax
	cltq
	movb	%dl, -91(%rbp,%rax)
	jmp	.L49
.L46:
	movl	-72(%rbp), %eax
	cltq
	movzbl	-91(%rbp,%rax), %eax
	movsbl	%al, %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	movzbl	%dl, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-72(%rbp), %eax
	cltq
	movb	%dl, -91(%rbp,%rax)
	jmp	.L49
.L43:
	movl	-72(%rbp), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -72(%rbp)
	jmp	.L49
.L44:
	movl	-72(%rbp), %eax
	leal	-1(%rax), %edx
	movslq	%edx, %rax
	imulq	$1717986919, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$2, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %ecx
	movl	%ecx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	addl	%eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -72(%rbp)
	jmp	.L49
.L42:
	movq	-32(%rbp), %rcx
	call	ftell
	movl	%eax, -76(%rbp)
	jmp	.L49
.L40:
	cmpl	$-1, -76(%rbp)
	jne	.L50
	movq	-32(%rbp), %rcx
	call	ftell
	movl	%eax, %ebx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	%ebx, %r8d
	leaq	.LC10(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L55
.L50:
	movl	-72(%rbp), %eax
	cltq
	movzbl	-91(%rbp,%rax), %eax
	testb	%al, %al
	je	.L57
	movl	-76(%rbp), %eax
	movl	$0, %r8d
	movl	%eax, %edx
	movq	-32(%rbp), %rcx
	call	fseek
	jmp	.L57
.L45:
	movl	-72(%rbp), %eax
	cltq
	movzbl	-91(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	putchar
	jmp	.L49
.L47:
	call	getchar
	movl	%eax, %edx
	movl	-72(%rbp), %eax
	cltq
	movb	%dl, -91(%rbp,%rax)
	jmp	.L49
.L57:
	nop
.L49:
	addl	$1, -80(%rbp)
	jmp	.L53
.L56:
	nop
.L53:
	cmpb	$-1, -81(%rbp)
	jne	.L54
	movl	$0, %eax
.L55:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "The following brainf program in 'demo.bf' will\12display the numbers from 0 to 9 separated by a space:\0"
	.align 8
.LC12:
	.ascii "++++++++++>++++++++++++++++++++++++++++++++++++++++++++++++>++++++++++++++++++++++++++++++++<<[>.+>.<<-]\0"
.LC13:
	.ascii "%s\12%s\12\12\0"
.LC14:
	.ascii "w\0"
.LC15:
	.ascii "demo.bf\0"
.LC16:
	.ascii "Can't open file '%s': %i\12\0"
.LC17:
	.ascii "r\0"
.LC18:
	.ascii "Executing...\0"
	.text
	.globl	cli_demo
	.def	cli_demo;	.scl	2;	.type	32;	.endef
	.seh_proc	cli_demo
cli_demo:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, -32(%rbp)
	movq	%rdx, -24(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -72(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC13(%rip), %rcx
	call	printf
	leaq	.LC14(%rip), %rdx
	leaq	.LC15(%rip), %rcx
	call	fopen
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L59
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %ebx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	%ebx, %r9d
	leaq	.LC15(%rip), %r8
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L60
.L59:
	movq	-88(%rbp), %rdx
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	fputs
	movq	-88(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	leaq	.LC17(%rip), %rdx
	leaq	.LC15(%rip), %rcx
	call	fopen
	movq	%rax, -96(%rbp)
	cmpq	$0, -96(%rbp)
	jne	.L61
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %ebx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	%ebx, %r9d
	leaq	.LC15(%rip), %r8
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L60
.L61:
	leaq	.LC18(%rip), %rcx
	call	puts
	movq	-96(%rbp), %rax
	movq	%rax, %rcx
	call	execf
.L60:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "# include <stdio.h>\12# define MEM_SIZE 1024\12\12int main(void) {\12    char mem[MEM_SIZE];\12    for (int i = 0; i < MEM_SIZE; i++) mem[i] = 0;\12    int ptr = 0;\12\12\12\0"
.LC20:
	.ascii "mem[ptr]--;\0"
.LC21:
	.ascii "%s\12\0"
.LC22:
	.ascii "mem[ptr]++;\0"
.LC23:
	.ascii "ptr--;\0"
.LC24:
	.ascii "ptr++;\0"
.LC25:
	.ascii "do {\0"
.LC26:
	.ascii "} while (mem[ptr]);\0"
.LC27:
	.ascii "putchar(mem[ptr]);\0"
.LC28:
	.ascii "mem[ptr] = (char)getchar();\0"
.LC29:
	.ascii "\12}\12\0"
	.text
	.globl	brainf2c
	.def	brainf2c;	.scl	2;	.type	32;	.endef
	.seh_proc	brainf2c
brainf2c:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$0, %r8d
	movl	$0, %edx
	movq	16(%rbp), %rcx
	call	fseek
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$155, %r8d
	movl	$1, %edx
	leaq	.LC19(%rip), %rcx
	call	fwrite
	movl	$0, -4(%rbp)
.L74:
	movq	16(%rbp), %rcx
	call	getc
	movb	%al, -5(%rbp)
	movsbl	-5(%rbp), %eax
	subl	$43, %eax
	cmpl	$50, %eax
	ja	.L76
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L65(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L65(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L65:
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L68-.L65
	.long	.L76-.L65
	.long	.L67-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L76-.L65
	.long	.L66-.L65
	.long	.L76-.L65
	.long	.L64-.L65
	.text
.L70:
	movq	24(%rbp), %rax
	leaq	.LC20(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L72:
	movq	24(%rbp), %rax
	leaq	.LC22(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L68:
	movq	24(%rbp), %rax
	leaq	.LC23(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L67:
	movq	24(%rbp), %rax
	leaq	.LC24(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L66:
	movq	24(%rbp), %rax
	leaq	.LC25(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L64:
	movq	24(%rbp), %rax
	leaq	.LC26(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L69:
	movq	24(%rbp), %rax
	leaq	.LC27(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L71:
	movq	24(%rbp), %rax
	leaq	.LC28(%rip), %r8
	leaq	.LC21(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	jmp	.L73
.L76:
	nop
.L73:
	addl	$1, -4(%rbp)
	cmpb	$-1, -5(%rbp)
	jne	.L74
	movq	24(%rbp), %rax
	movq	%rax, %r9
	movl	$3, %r8d
	movl	$1, %edx
	leaq	.LC29(%rip), %rcx
	call	fwrite
	movl	$0, %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "-to-c: You must provide 4 arguments as the following syntax:\12%s -to-c <input file> <output file>\12\0"
	.text
	.globl	cli_brainf_to_c
	.def	cli_brainf_to_c;	.scl	2;	.type	32;	.endef
	.seh_proc	cli_brainf_to_c
cli_brainf_to_c:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, -32(%rbp)
	movq	%rdx, -24(%rbp)
	cmpl	$4, -32(%rbp)
	jne	.L78
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rax, %rcx
	call	brainf2c
	movl	%eax, -84(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	-84(%rbp), %eax
	jmp	.L79
.L78:
	movq	-24(%rbp), %rax
	movq	(%rax), %rbx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movq	%rbx, %r8
	leaq	.LC30(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
.L79:
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC31:
	.ascii "-f\0"
.LC32:
	.ascii "-s\0"
	.align 8
.LC33:
	.ascii "Invalid option for --exec: %s\12\0"
	.align 8
.LC34:
	.ascii "The option --exec needs 4 arguments, not %d.\12\0"
	.text
	.globl	cli_exec
	.def	cli_exec;	.scl	2;	.type	32;	.endef
	.seh_proc	cli_exec
cli_exec:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	cmpl	$4, 32(%rbp)
	jne	.L81
	movq	40(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L82
	movq	40(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L83
	movq	__imp__errno(%rip), %rax
	call	*%rax
	movl	(%rax), %esi
	movq	40(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rbx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	%esi, %r9d
	movq	%rbx, %r8
	leaq	.LC16(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L84
.L83:
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	execf
	jmp	.L84
.L82:
	movq	40(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	leaq	.LC32(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L85
	movq	40(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	exec
	jmp	.L84
.L85:
	movq	40(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rbx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movq	%rbx, %r8
	leaq	.LC33(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
	jmp	.L84
.L81:
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movl	32(%rbp), %r8d
	leaq	.LC34(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, %eax
.L84:
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC35:
	.ascii "Use '%s --help' for more informations.\12\0"
.LC36:
	.ascii "--demo\0"
.LC37:
	.ascii "--exec\0"
.LC38:
	.ascii "main: Invalid option: %s\12\0"
	.text
	.globl	cli
	.def	cli;	.scl	2;	.type	32;	.endef
	.seh_proc	cli
cli:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movl	%ecx, -64(%rbp)
	movq	%rdx, -56(%rbp)
	cmpl	$1, -64(%rbp)
	jg	.L87
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rcx
	call	printf
	movl	$0, %eax
	jmp	.L88
.L87:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L89
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L90
.L89:
	movq	-56(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	cli_help
	jmp	.L88
.L90:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC36(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L91
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	-64(%rbp), %ecx
	call	cli_demo
	jmp	.L88
.L91:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L92
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	-64(%rbp), %ecx
	call	cli_brainf_to_c
	jmp	.L88
.L92:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC37(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	je	.L93
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	strcmp
	testl	%eax, %eax
	jne	.L94
.L93:
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	movl	-64(%rbp), %ecx
	call	cli_exec
	jmp	.L88
.L94:
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rbx
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	addq	$96, %rax
	movq	%rbx, %r8
	leaq	.LC38(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$1, %eax
.L88:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	call	__main
	movq	24(%rbp), %rax
	movq	%rax, %rdx
	movl	16(%rbp), %ecx
	call	cli
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 9.2.0"
	.def	ftell;	.scl	2;	.type	32;	.endef
	.def	fseek;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	getc;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
