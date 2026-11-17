	.file	"pool_core.c"
	.text
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"Error al crear el archivo %s\n"
	.align 8
.LC2:
	.string	"Archivo %s creado exitosamente.\n"
	.text
	.globl	crear_file
	.type	crear_file, @function
crear_file:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC1(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L2:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	crear_file, .-crear_file
	.section	.rodata
.LC3:
	.string	"a"
	.align 8
.LC4:
	.string	"Error al escribir en el archivo %s\n"
.LC5:
	.string	"%s\n"
	.text
	.globl	escribir
	.type	escribir, @function
escribir:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC3(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	movq	stderr(%rip), %rax
	movq	-24(%rbp), %rdx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L4:
	movq	-32(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	escribir, .-escribir
	.section	.rodata
.LC6:
	.string	"r"
.LC7:
	.string	"Error al leer el archivo %s\n"
	.align 8
.LC8:
	.string	"Error al asignar memoria para leer el archivo %s\n"
	.align 8
.LC9:
	.string	"Error al reasignar memoria para leer el archivo %s\n"
	.align 8
.LC10:
	.string	"Error durante la lectura del archivo %s\n"
	.text
	.globl	leer
	.type	leer, @function
leer:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L6
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC7(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L7
.L6:
	movl	$1, %edi
	call	malloc@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L8
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L7
.L8:
	movq	$0, -24(%rbp)
	jmp	.L9
.L11:
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L10
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L7
.L10:
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-24(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -24(%rbp)
	movq	-32(%rbp), %rdx
	addq	%rdx, %rax
	movl	-36(%rbp), %edx
	movb	%dl, (%rax)
.L9:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, -36(%rbp)
	cmpl	$-1, -36(%rbp)
	jne	.L11
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	ferror@PLT
	testl	%eax, %eax
	je	.L12
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	stderr(%rip), %rax
	movq	-56(%rbp), %rdx
	leaq	.LC10(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L7
.L12:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-32(%rbp), %rax
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	leer, .-leer
	.section	.rodata
	.align 8
.LC11:
	.string	"Archivo %s eliminado exitosamente.\n"
	.align 8
.LC12:
	.string	"Error al eliminar el archivo %s\n"
	.text
	.globl	eliminar
	.type	eliminar, @function
eliminar:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	testl	%eax, %eax
	jne	.L14
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L16
.L14:
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC12(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L16:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	eliminar, .-eliminar
	.globl	archivo_existe
	.type	archivo_existe, @function
archivo_existe:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L18
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$1, %eax
	jmp	.L19
.L18:
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	archivo_existe, .-archivo_existe
	.section	.rodata
	.align 8
.LC13:
	.string	"Archivo renombrado de %s a %s exitosamente.\n"
	.align 8
.LC14:
	.string	"Error al renombrar el archivo %s a %s\n"
	.text
	.globl	renombrar_archivo
	.type	renombrar_archivo, @function
renombrar_archivo:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	rename@PLT
	testl	%eax, %eax
	jne	.L21
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L23
.L21:
	movq	stderr(%rip), %rax
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L23:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	renombrar_archivo, .-renombrar_archivo
	.section	.rodata
	.align 8
.LC15:
	.string	"Error al abrir el archivo de origen %s\n"
	.align 8
.LC16:
	.string	"Error al crear el archivo de destino %s\n"
	.align 8
.LC17:
	.string	"Archivo copiado de %s a %s exitosamente.\n"
	.text
	.globl	copiar
	.type	copiar, @function
copiar:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movq	%rdi, -1080(%rbp)
	movq	%rsi, -1088(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-1080(%rbp), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1064(%rbp)
	cmpq	$0, -1064(%rbp)
	jne	.L25
	movq	stderr(%rip), %rax
	movq	-1080(%rbp), %rdx
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L24
.L25:
	movq	-1088(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	jne	.L28
	movq	stderr(%rip), %rax
	movq	-1088(%rbp), %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L24
.L29:
	movq	-1056(%rbp), %rcx
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
.L28:
	movq	-1064(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -1048(%rbp)
	cmpq	$0, -1048(%rbp)
	jne	.L29
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-1088(%rbp), %rdx
	movq	-1080(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L24:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L31
	call	__stack_chk_fail@PLT
.L31:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	copiar, .-copiar
	.section	.rodata
	.align 8
.LC18:
	.string	"Archivos unidos en %s exitosamente.\n"
	.text
	.globl	unir_archivos
	.type	unir_archivos, @function
unir_archivos:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1104, %rsp
	movq	%rdi, -1080(%rbp)
	movq	%rsi, -1088(%rbp)
	movq	%rdx, -1096(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-1088(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1064(%rbp)
	cmpq	$0, -1064(%rbp)
	jne	.L33
	movq	stderr(%rip), %rax
	movq	-1088(%rbp), %rdx
	leaq	.LC16(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L32
.L33:
	movq	$0, -1072(%rbp)
	jmp	.L35
.L40:
	movq	-1072(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-1080(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	.LC6(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1056(%rbp)
	cmpq	$0, -1056(%rbp)
	jne	.L38
	movq	-1072(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-1080(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L37
.L39:
	movq	-1064(%rbp), %rcx
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
.L38:
	movq	-1056(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movq	%rax, -1048(%rbp)
	cmpq	$0, -1048(%rbp)
	jne	.L39
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L37:
	addq	$1, -1072(%rbp)
.L35:
	movq	-1072(%rbp), %rax
	cmpq	-1096(%rbp), %rax
	jb	.L40
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-1088(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L32:
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L41
	call	__stack_chk_fail@PLT
.L41:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	unir_archivos, .-unir_archivos
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
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
