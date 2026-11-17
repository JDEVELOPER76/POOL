	.file	"pool.c"
	.text
	.section	.rodata
.LC0:
	.string	"Uso: %s <comando>\n"
.LC1:
	.string	"Comandos disponibles:"
	.align 8
.LC2:
	.string	"  --crear <archivo> - Crea un archivo vac\303\255o."
	.align 8
.LC3:
	.string	"  --escribir <archivo> <contenido> - Escribe contenido en un archivo."
	.align 8
.LC4:
	.string	"  --leer <archivo> - Lee y muestra el contenido de un archivo."
	.align 8
.LC5:
	.string	"  --ayuda - Muestra esta ayuda."
	.align 8
.LC6:
	.string	"  --version - Muestra la versi\303\263n del programa."
	.align 8
.LC7:
	.string	"  --eliminar <archivo> - Elimina un archivo."
	.align 8
.LC8:
	.string	"  --existe <archivo> - Verificar si un archivo existe."
	.align 8
.LC9:
	.string	"  --renombrar <archivo_actual> <nuevo_nombre> - Renombra un archivo."
	.align 8
.LC10:
	.string	"  --copiar <archivo_origen> <archivo_destino> - Copia un archivo."
	.align 8
.LC11:
	.string	"  --unir <archivo1> ... <archivoN> <destino> - Une varios archivos."
.LC12:
	.string	"--crear"
.LC13:
	.string	"Uso: %s --crear <archivo>\n"
.LC14:
	.string	"--escribir"
	.align 8
.LC15:
	.string	"Uso: %s --escribir <archivo> <contenido>\n"
.LC16:
	.string	"--leer"
.LC17:
	.string	"Uso: %s --leer <archivo>\n"
.LC18:
	.string	"Contenido de %s:\n%s\n"
.LC19:
	.string	"--eliminar"
.LC20:
	.string	"Uso: %s --eliminar <archivo>\n"
.LC21:
	.string	"--existe"
.LC22:
	.string	"Uso: %s --existe <archivo>\n"
.LC23:
	.string	"El archivo %s existe.\n"
.LC24:
	.string	"El archivo %s no existe.\n"
.LC25:
	.string	"--renombrar"
	.align 8
.LC26:
	.string	"Uso: %s --renombrar <archivo_actual> <nuevo_nombre>\n"
.LC27:
	.string	"--copiar"
	.align 8
.LC28:
	.string	"Uso: %s --copiar <archivo_origen> <archivo_destino>\n"
.LC29:
	.string	"--unir"
	.align 8
.LC30:
	.string	"Uso: %s --unir <archivo1> ... <archivoN> <destino>\n"
.LC31:
	.string	"--ayuda"
.LC32:
	.string	"APPNAME : POOL"
.LC33:
	.string	"--version"
.LC34:
	.string	"1.0.1"
.LC35:
	.string	"Versi\303\263n %s\n"
.LC36:
	.string	"Comando no reconocido: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	cmpl	$1, -84(%rbp)
	jg	.L2
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L3
.L2:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC12(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	cmpl	$2, -84(%rbp)
	jg	.L5
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC13(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L5:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	crear_file@PLT
	jmp	.L6
.L4:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC14(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
	cmpl	$3, -84(%rbp)
	jg	.L8
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC15(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L8:
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	escribir@PLT
	jmp	.L6
.L7:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	cmpl	$2, -84(%rbp)
	jg	.L10
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L10:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	leer@PLT
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	je	.L6
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rdx
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	jmp	.L6
.L9:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC19(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L11
	cmpl	$2, -84(%rbp)
	jg	.L12
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC20(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L12:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	eliminar@PLT
	jmp	.L6
.L11:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC21(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	cmpl	$2, -84(%rbp)
	jg	.L14
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC22(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L14:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	archivo_existe@PLT
	movb	%al, -65(%rbp)
	cmpb	$0, -65(%rbp)
	je	.L15
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L15:
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L13:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC25(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	cmpl	$3, -84(%rbp)
	jg	.L17
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC26(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L17:
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	renombrar_archivo@PLT
	jmp	.L6
.L16:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC27(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L18
	cmpl	$3, -84(%rbp)
	jg	.L19
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC28(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L19:
	movq	-96(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	copiar@PLT
	jmp	.L6
.L18:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC29(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L20
	movq	%rsp, %rax
	movq	%rax, %rbx
	cmpl	$3, -84(%rbp)
	jg	.L21
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC30(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	movq	%rbx, %rsp
	jmp	.L3
.L21:
	movl	-84(%rbp), %eax
	subl	$3, %eax
	cltq
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -48(%rbp)
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rcx
	andq	$-4096, %rcx
	movq	%rsp, %rdx
	subq	%rcx, %rdx
.L22:
	cmpq	%rdx, %rsp
	je	.L23
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L22
.L23:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L24
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L24:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -40(%rbp)
	movq	$0, -64(%rbp)
	jmp	.L25
.L26:
	movq	-64(%rbp), %rax
	addq	$2, %rax
	leaq	0(,%rax,8), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	-40(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rcx, (%rax,%rdx,8)
	addq	$1, -64(%rbp)
.L25:
	movq	-64(%rbp), %rax
	cmpq	-56(%rbp), %rax
	jb	.L26
	movl	-84(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-96(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movq	-56(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	unir_archivos@PLT
	movq	%rbx, %rsp
	jmp	.L6
.L20:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC31(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L27
	movq	-96(%rbp), %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	leaq	.LC32(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L6
.L27:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC33(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L28
	leaq	.LC34(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC35(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L28:
	movq	-96(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC36(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %eax
	jmp	.L3
.L6:
	movl	$0, %eax
.L3:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
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
