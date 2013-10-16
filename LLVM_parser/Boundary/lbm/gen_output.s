

	.text
	.align	16
	.globl	foo
	.type	foo,@function
foo:
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	xorb	%r14b, %r14b
	movl	$1, %edi
	movb	%r14b, %al
	call	func_enter
	movl	%ebx, %edi
	movb	%r14b, %al
	call	func_enter
	movl	%ebx, %edi
	movb	%r14b, %al
	call	loop_enter
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
	.size	foo, .-foo


	.align	16
	.type	LBM_initializeGrid,@function
LBM_initializeGrid:
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	xorb	%r14b, %r14b
	movl	$2, %edi
	movb	%r14b, %al
	call	func_enter
	movl	$9, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	xorl	%eax, %eax
.LBB2_1:	# bb
	leal	-400000(%rax), %ecx
	movslq	%ecx, %rcx
	movabsq	$4599676419421066581, %rdx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399999(%rax), %ecx
	movslq	%ecx, %rcx
	movabsq	$4588167220373341980, %rdx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399998(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399997(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399996(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399995(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399994(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399993(%rax), %ecx
	movslq	%ecx, %rcx
	movabsq	$4583663620745971484, %rdx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399992(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399991(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399990(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399989(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399988(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399987(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399986(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399985(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399984(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399983(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399982(%rax), %ecx
	movslq	%ecx, %rcx
	movq	%rdx, (%rbx,%rcx,8)
	leal	-399981(%rax), %ecx
	movslq	%ecx, %rcx
	movl	$0, (%rbx,%rcx,8)
	addl	$20, %eax
	cmpl	$26800000, %eax
	jne	.LBB2_1	# bb
.LBB2_2:	# return
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
	.size	LBM_initializeGrid, .-LBM_initializeGrid


	.align	16
	.type	LBM_loadObstacleFile,@function
LBM_loadObstacleFile:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	xorb	%r15b, %r15b
	movl	$3, %edi
	movb	%r15b, %al
	call	func_enter
	leaq	.str1, %rsi
	movq	%r14, %rdi
	call	fopen
	movq	%rax, %r14
	movl	$10, %ecx
	movl	%ecx, %edi
	movb	%r15b, %al
	call	loop_enter
	movl	$0, 4(%rsp)
.LBB3_1:	# bb38.outer
	xorb	%al, %al
	movl	$12, %edi
	call	loop_enter
	movl	4(%rsp), %eax
	leal	19(%rax), %eax
	movl	%eax, (%rsp)
	xorl	%r15d, %r15d
.LBB3_2:	# bb28.preheader.us
	movq	%r14, %rdi
	call	fgetc
	movl	%eax, %r12d
	xorb	%al, %al
	movl	$11, %ecx
	movl	%ecx, %edi
	call	loop_enter
	movl	(%rsp), %eax
	leal	(%rax,%r15), %r13d
	xorl	%ebp, %ebp
	movl	%r12d, %eax
	jmp	.LBB3_7	# bb4.us
.LBB3_3:	# bb33.us
	addl	$2000, %r15d
	cmpl	$200000, %r15d
	jne	.LBB3_2	# bb28.preheader.us
.LBB3_4:	# bb43
	movq	%r14, %rdi
	call	fgetc
	movl	4(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 4(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB3_1	# bb38.outer
.LBB3_5:	# bb53
	movq	%r14, %rdi
	call	fclose
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB3_6:	# cond_next.us
	movq	%r14, %rdi
	call	fgetc
	addl	$20, %ebp
	cmpl	$2000, %ebp
	je	.LBB3_3	# bb33.us
.LBB3_7:	# bb4.us
	cmpl	$46, %eax
	je	.LBB3_6	# cond_next.us
.LBB3_8:	# cond_true.us
	leal	(%r13,%rbp), %eax
	movslq	%eax, %rax
	orl	$1, (%rbx,%rax,8)
	jmp	.LBB3_6	# cond_next.us
	.size	LBM_loadObstacleFile, .-LBM_loadObstacleFile


	.align	16
	.type	LBM_initializeSpecialCellsForLDC,@function
LBM_initializeSpecialCellsForLDC:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	xorb	%r14b, %r14b
	movl	$4, %edi
	movb	%r14b, %al
	call	func_enter
	movl	$15, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	xorl	%eax, %eax
	movl	%eax, 16(%rsp)
	movl	%eax, %r14d
.LBB4_1:	# bb124.outer
	xorb	%al, %al
	movl	$16, %edi
	call	loop_enter
	movl	16(%rsp), %eax
	leal	-20000(%rax), %eax
	movl	%eax, 20(%rsp)
	xorl	%eax, %eax
	movl	%eax, 12(%rsp)
	movl	%eax, %r15d
.LBB4_2:	# bb116.preheader
	xorb	%al, %al
	movl	$14, %edi
	call	loop_enter
	movl	20(%rsp), %r12d
	movl	12(%rsp), %r13d
	leal	(%r12,%r13), %r12d
	movl	%r12d, 8(%rsp)
	leal	-2(%r15), %r13d
	xorl	%r12d, %r12d
	jmp	.LBB4_12	# bb116
.LBB4_3:	# bb2
	testl	%r12d, %r12d
	je	.LBB4_18	# bb36
.LBB4_4:	# bb2
	cmpl	$99, %r12d
	je	.LBB4_18	# bb36
.LBB4_5:	# cond_next
	cmpl	$129, %r14d
	jg	.LBB4_16	# cond_next
.LBB4_6:	# cond_next
	cmpl	$2, %r14d
	je	.LBB4_18	# bb36
.LBB4_7:	# cond_next
	cmpl	$3, %r14d
	jne	.LBB4_11	# bb113
.LBB4_8:	# cond_true66
	leal	-2(%r12), %eax
	cmpl	$95, %eax
	ja	.LBB4_11	# bb113
.LBB4_9:	# cond_true66
	cmpl	$95, %r13d
	ja	.LBB4_11	# bb113
.LBB4_10:	# cond_true91
	movl	8(%rsp), %eax
	leal	(%rax,%r12), %eax
	imull	$20, %eax, %eax
	addl	$19, %eax
	movslq	%eax, %rax
	orl	$2, (%rbx,%rax,8)
.LBB4_11:	# bb113
	incl	%r12d
.LBB4_12:	# bb116
	cmpl	$99, %r12d
	jg	.LBB4_23	# bb121
.LBB4_13:	# bb2.preheader
	xorb	%bpl, %bpl
	movl	$13, %edi
	movb	%bpl, %al
	call	loop_enter
	movl	$17, %ecx
	movl	%ecx, %edi
	movb	%bpl, %al
	call	loop_enter
	movl	$18, %ecx
	movl	%ecx, %edi
	movb	%bpl, %al
	call	loop_enter
	testl	%r15d, %r15d
	je	.LBB4_19	# bb2.us.loopexit
.LBB4_14:	# bb2.preheader
	cmpl	$99, %r15d
	je	.LBB4_21	# bb2.us167.loopexit
.LBB4_15:	# bb2.preheader1
	movl	16(%rsp), %ecx
	movl	12(%rsp), %eax
	leal	(%rcx,%rax), %eax
	addl	%r12d, %eax
	imull	$20, %eax, %eax
	addl	$4294567315, %eax
	jmp	.LBB4_3	# bb2
.LBB4_16:	# cond_next
	cmpl	$130, %r14d
	je	.LBB4_8	# cond_true66
.LBB4_17:	# cond_next
	cmpl	$131, %r14d
	jne	.LBB4_11	# bb113
.LBB4_18:	# bb36
	movslq	%eax, %rcx
	orl	$1, (%rbx,%rcx,8)
	addl	$20, %eax
	incl	%r12d
	cmpl	$99, %r12d
	jle	.LBB4_3	# bb2
	jmp	.LBB4_23	# bb121
.LBB4_19:	# bb2.us.loopexit
	movl	20(%rsp), %r13d
	movl	12(%rsp), %eax
	leal	(%r13,%rax), %r13d
	addl	%r12d, %r13d
	imull	$20, %r13d, %r13d
	addl	$19, %r13d
	imull	$20, %r12d, %r12d
	xorl	%eax, %eax
.LBB4_20:	# bb2.us
	leal	(%r13,%rax), %ecx
	movslq	%ecx, %rcx
	orl	$1, (%rbx,%rcx,8)
	leal	20(%r12,%rax), %ecx
	addl	$20, %eax
	cmpl	$2000, %ecx
	jl	.LBB4_20	# bb2.us
	jmp	.LBB4_23	# bb121
.LBB4_21:	# bb2.us167.loopexit
	movl	20(%rsp), %eax
	movl	12(%rsp), %r13d
	leal	(%rax,%r13), %r13d
	addl	%r12d, %r13d
	imull	$20, %r13d, %r13d
	addl	$19, %r13d
	imull	$20, %r12d, %r12d
	xorl	%eax, %eax
.LBB4_22:	# bb2.us167
	leal	(%r13,%rax), %ecx
	movslq	%ecx, %rcx
	orl	$1, (%rbx,%rcx,8)
	leal	20(%r12,%rax), %ecx
	addl	$20, %eax
	cmpl	$2000, %ecx
	jl	.LBB4_22	# bb2.us167
.LBB4_23:	# bb121
	addl	$100, 12(%rsp)
	incl	%r15d
	cmpl	$100, %r15d
	jne	.LBB4_2	# bb116.preheader
.LBB4_24:	# bb129
	addl	$10000, 16(%rsp)
	incl	%r14d
	cmpl	$134, %r14d
	jne	.LBB4_1	# bb124.outer
.LBB4_25:	# return.split
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	LBM_initializeSpecialCellsForLDC, .-LBM_initializeSpecialCellsForLDC


	.align	16
	.type	LBM_initializeSpecialCellsForChannel,@function
LBM_initializeSpecialCellsForChannel:
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	xorb	%r14b, %r14b
	movl	$5, %edi
	movb	%r14b, %al
	call	func_enter
	movl	$20, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	xorl	%r14d, %r14d
.LBB5_1:	# bb104.outer
	xorb	%al, %al
	movl	$19, %edi
	call	loop_enter
	leal	-399981(%r14), %r15d
	xorl	%r12d, %r12d
.LBB5_2:	# bb96.preheader
	xorb	%al, %al
	movl	$21, %edi
	call	loop_enter
	imull	$2000, %r12d, %ecx
	addl	%r15d, %ecx
	xorl	%eax, %eax
.LBB5_3:	# bb2
	testl	%eax, %eax
	je	.LBB5_7	# bb23
.LBB5_4:	# bb2
	cmpl	$99, %eax
	je	.LBB5_7	# bb23
.LBB5_5:	# cond_next
	testl	%r12d, %r12d
	je	.LBB5_7	# bb23
.LBB5_6:	# cond_next
	cmpl	$99, %r12d
	jne	.LBB5_8	# bb93
.LBB5_7:	# bb23
	movslq	%ecx, %rdx
	orl	$1, (%rbx,%rdx,8)
.LBB5_8:	# bb93
	addl	$20, %ecx
	incl	%eax
	cmpl	$100, %eax
	jne	.LBB5_3	# bb2
.LBB5_9:	# bb101
	incl	%r12d
	cmpl	$100, %r12d
	jne	.LBB5_2	# bb96.preheader
.LBB5_10:	# bb109
	addl	$200000, %r14d
	cmpl	$26800000, %r14d
	jne	.LBB5_1	# bb104.outer
.LBB5_11:	# return.split
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
	.size	LBM_initializeSpecialCellsForChannel, .-LBM_initializeSpecialCellsForChannel


	.section	.rodata.cst4,"aM",@progbits,4
	.align	16
.LCPI6_2:					#  float
	.long	1069547520	# float 1.5
.LCPI6_3:					#  float
	.long	1065353216	# float 1
	.zero	16
.LCPI6_6:					#  float
	.long	1083179008	# float 4.5
.LCPI6_7:					#  float
	.long	1077936128	# float 3
	.section	.rodata.cst8,"aM",@progbits,8
	.align	16
.LCPI6_0:					#  double
	.quad	4566758108544739836	# double value: 0.002
.LCPI6_1:					#  double
	.quad	4572414629676717179	# double value: 0.005
	.zero	8
.LCPI6_4:					#  double
	.quad	4604029899060858060	# double value: 0.65
.LCPI6_5:					#  double
	.quad	13830104095692056166	# double value: -0.95
	.zero	8
.LCPI6_8:					#  double
	.quad	4592470660017273787	# double value: 0.108333
.LCPI6_9:					#  double
	.quad	4587967060389903291	# double value: 0.0541667
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI6_10:					#  <2 x double>
	.quad	9223372036854775808	# double value: -0
	.quad	9223372036854775808	# double value: -0
	.text
	.align	16
	.type	LBM_performStreamCollide,@function
LBM_performStreamCollide:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	xorb	%r15b, %r15b
	movl	$6, %edi
	movb	%r15b, %al
	call	func_enter
	movl	$22, %ecx
	movl	%ecx, %edi
	movb	%r15b, %al
	call	loop_enter
	movq	$0, 96(%rsp)
	xorl	%eax, %eax
.LBB6_1:	# bb
	movslq	%eax, %rcx
	addl	$19, %eax
	movslq	%eax, %rax
	movl	(%rbx,%rax,8), %eax
	incq	96(%rsp)
	testl	$1, %eax
	movsd	(%rbx,%rcx,8), %xmm0
	movsd	%xmm0, 24(%rsp)
	je	.LBB6_5	# cond_next
.LBB6_2:	# cond_true
	movsd	24(%rsp), %xmm0
	movsd	%xmm0, (%r14,%rcx,8)
	movl	%ecx, %eax
	incl	%eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-1998(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	2(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	2001(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	3(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-16(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	4(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	23(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	5(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-199994(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	6(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	200005(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	7(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-2010(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	8(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-1971(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	9(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	1988(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	10(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	2027(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	11(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-201986(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	12(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	198013(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	13(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-197988(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	14(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	202011(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	15(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-200002(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	16(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	199997(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	17(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	-199964(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	leal	18(%rcx), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	leal	200035(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
.LBB6_3:	# cond_true
	movl	%ecx, %eax
	addl	$20, %eax
	cmpl	$25999999, %eax
	jle	.LBB6_1	# bb
.LBB6_4:	# return
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB6_5:	# cond_next
	leal	2(%rcx), %edx
	movslq	%edx, %rdx
	movsd	(%rbx,%rdx,8), %xmm0
	movsd	%xmm0, 8(%rsp)
	movl	%ecx, %esi
	incl	%esi
	movslq	%esi, %rsi
	movsd	(%rbx,%rsi,8), %xmm0
	movsd	24(%rsp), %xmm1
	addsd	%xmm0, %xmm1
	addsd	8(%rsp), %xmm1
	leal	3(%rcx), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm2
	addsd	%xmm2, %xmm1
	leal	4(%rcx), %r8d
	movslq	%r8d, %r8
	movsd	(%rbx,%r8,8), %xmm3
	movsd	%xmm3, 40(%rsp)
	addsd	%xmm3, %xmm1
	leal	5(%rcx), %r9d
	movslq	%r9d, %r9
	movsd	(%rbx,%r9,8), %xmm3
	addsd	%xmm3, %xmm1
	leal	6(%rcx), %r10d
	movslq	%r10d, %r10
	movsd	(%rbx,%r10,8), %xmm4
	movsd	%xmm4, 56(%rsp)
	addsd	%xmm4, %xmm1
	leal	7(%rcx), %r11d
	movslq	%r11d, %r11
	movsd	(%rbx,%r11,8), %xmm4
	addsd	%xmm4, %xmm1
	leal	8(%rcx), %r15d
	movslq	%r15d, %r15
	movsd	(%rbx,%r15,8), %xmm5
	addsd	%xmm5, %xmm1
	leal	9(%rcx), %r12d
	movslq	%r12d, %r12
	movsd	(%rbx,%r12,8), %xmm6
	addsd	%xmm6, %xmm1
	leal	10(%rcx), %r13d
	movslq	%r13d, %r13
	movsd	(%rbx,%r13,8), %xmm7
	addsd	%xmm7, %xmm1
	leal	11(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 88(%rsp)
	movsd	(%rbx,%rbp,8), %xmm8
	movsd	%xmm8, (%rsp)
	addsd	%xmm8, %xmm1
	leal	12(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 80(%rsp)
	movsd	(%rbx,%rbp,8), %xmm9
	addsd	%xmm9, %xmm1
	leal	13(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 72(%rsp)
	movsd	(%rbx,%rbp,8), %xmm10
	addsd	%xmm10, %xmm1
	leal	14(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 64(%rsp)
	movsd	(%rbx,%rbp,8), %xmm11
	addsd	%xmm11, %xmm1
	leal	15(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 48(%rsp)
	movsd	(%rbx,%rbp,8), %xmm12
	addsd	%xmm12, %xmm1
	leal	16(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 32(%rsp)
	movsd	(%rbx,%rbp,8), %xmm13
	addsd	%xmm13, %xmm1
	leal	17(%rcx), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 16(%rsp)
	movsd	(%rbx,%rbp,8), %xmm14
	addsd	%xmm14, %xmm1
	leal	18(%rcx), %ebp
	movslq	%ebp, %rbp
	movsd	(%rbx,%rbp,8), %xmm15
	addsd	%xmm15, %xmm1
	subsd	8(%rsp), %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm6, %xmm0
	subsd	%xmm7, %xmm0
	addsd	%xmm8, %xmm0
	addsd	%xmm9, %xmm0
	subsd	%xmm10, %xmm0
	subsd	%xmm11, %xmm0
	divsd	%xmm1, %xmm0
	testl	$2, %eax
	movsd	.LCPI6_0(%rip), %xmm8
	je	.LBB6_7	# cond_next
.LBB6_6:	# cond_next
	movapd	%xmm8, %xmm0
.LBB6_7:	# cond_next
	movapd	%xmm0, %xmm8
	mulsd	%xmm8, %xmm8
	subsd	40(%rsp), %xmm2
	addsd	%xmm4, %xmm2
	subsd	%xmm5, %xmm2
	addsd	%xmm6, %xmm2
	subsd	%xmm7, %xmm2
	addsd	%xmm12, %xmm2
	addsd	%xmm13, %xmm2
	subsd	%xmm14, %xmm2
	subsd	%xmm15, %xmm2
	divsd	%xmm1, %xmm2
	movsd	.LCPI6_1(%rip), %xmm4
	je	.LBB6_9	# cond_next
.LBB6_8:	# cond_next
	movapd	%xmm4, %xmm2
.LBB6_9:	# cond_next
	movapd	%xmm2, %xmm4
	mulsd	%xmm4, %xmm4
	addsd	%xmm8, %xmm4
	subsd	56(%rsp), %xmm3
	addsd	(%rsp), %xmm3
	subsd	%xmm9, %xmm3
	addsd	%xmm10, %xmm3
	subsd	%xmm11, %xmm3
	addsd	%xmm12, %xmm3
	subsd	%xmm13, %xmm3
	addsd	%xmm14, %xmm3
	subsd	%xmm15, %xmm3
	divsd	%xmm1, %xmm3
	pxor	%xmm5, %xmm5
	je	.LBB6_11	# cond_next
.LBB6_10:	# cond_next
	movapd	%xmm5, %xmm3
.LBB6_11:	# cond_next
	movapd	%xmm3, %xmm5
	mulsd	%xmm5, %xmm5
	addsd	%xmm5, %xmm4
	cvtss2sd	.LCPI6_2(%rip), %xmm5
	mulsd	%xmm5, %xmm4
	cvtss2sd	.LCPI6_3(%rip), %xmm5
	movapd	%xmm5, %xmm6
	subsd	%xmm4, %xmm6
	movapd	%xmm1, %xmm7
	mulsd	.LCPI6_4(%rip), %xmm7
	mulsd	%xmm6, %xmm7
	movsd	.LCPI6_5(%rip), %xmm6
	movsd	24(%rsp), %xmm8
	mulsd	%xmm6, %xmm8
	addsd	%xmm7, %xmm8
	movsd	%xmm8, (%r14,%rcx,8)
	cvtss2sd	.LCPI6_6(%rip), %xmm7
	movapd	%xmm0, %xmm8
	mulsd	%xmm7, %xmm8
	cvtss2sd	.LCPI6_7(%rip), %xmm9
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm0, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	movapd	%xmm1, %xmm11
	mulsd	.LCPI6_8(%rip), %xmm11
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%rsi,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	2001(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm0, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm11, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%rdx,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	-1998(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movapd	%xmm2, %xmm8
	mulsd	%xmm7, %xmm8
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm2, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%rdi,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	23(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm2, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm11, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%r8,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	-16(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movapd	%xmm3, %xmm8
	mulsd	%xmm7, %xmm8
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%r9,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	200005(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm3, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm8, %xmm11
	movapd	%xmm6, %xmm8
	mulsd	(%rbx,%r10,8), %xmm8
	addsd	%xmm11, %xmm8
	leal	-199994(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm8, (%r14,%rax,8)
	movapd	%xmm2, %xmm8
	addsd	%xmm0, %xmm8
	movapd	%xmm8, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	.LCPI6_9(%rip), %xmm1
	mulsd	%xmm1, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%r11,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	2027(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movapd	%xmm0, %xmm8
	subsd	%xmm2, %xmm8
	movapd	%xmm8, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm1, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%r15,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	1988(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movapd	%xmm2, %xmm8
	subsd	%xmm0, %xmm8
	movapd	%xmm8, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm1, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%r12,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	-1971(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movsd	.LCPI6_10(%rip), %xmm8
	movapd	%xmm2, %xmm10
	xorpd	%xmm8, %xmm10
	movapd	%xmm10, %xmm11
	subsd	%xmm0, %xmm11
	movapd	%xmm11, %xmm12
	mulsd	%xmm7, %xmm12
	addsd	%xmm9, %xmm12
	mulsd	%xmm12, %xmm11
	addsd	%xmm5, %xmm11
	subsd	%xmm4, %xmm11
	mulsd	%xmm1, %xmm11
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%r13,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	-2010(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	movapd	%xmm0, %xmm11
	addsd	%xmm3, %xmm11
	movapd	%xmm11, %xmm12
	mulsd	%xmm7, %xmm12
	addsd	%xmm9, %xmm12
	mulsd	%xmm12, %xmm11
	addsd	%xmm5, %xmm11
	subsd	%xmm4, %xmm11
	mulsd	%xmm1, %xmm11
	movapd	%xmm6, %xmm12
	movq	88(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	202011(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	movapd	%xmm0, %xmm11
	subsd	%xmm3, %xmm11
	movapd	%xmm11, %xmm12
	mulsd	%xmm7, %xmm12
	addsd	%xmm9, %xmm12
	mulsd	%xmm12, %xmm11
	addsd	%xmm5, %xmm11
	subsd	%xmm4, %xmm11
	mulsd	%xmm1, %xmm11
	movapd	%xmm6, %xmm12
	movq	80(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	-197988(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	movapd	%xmm3, %xmm11
	subsd	%xmm0, %xmm11
	movapd	%xmm11, %xmm12
	mulsd	%xmm7, %xmm12
	addsd	%xmm9, %xmm12
	mulsd	%xmm12, %xmm11
	addsd	%xmm5, %xmm11
	subsd	%xmm4, %xmm11
	mulsd	%xmm1, %xmm11
	movapd	%xmm6, %xmm12
	movq	72(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	198013(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm12, (%r14,%rax,8)
	xorpd	%xmm8, %xmm0
	subsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm8
	mulsd	%xmm7, %xmm8
	addsd	%xmm9, %xmm8
	mulsd	%xmm8, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm4, %xmm0
	mulsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm8
	movq	64(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	-201986(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm8, (%r14,%rax,8)
	movapd	%xmm2, %xmm0
	addsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm8
	mulsd	%xmm7, %xmm8
	addsd	%xmm9, %xmm8
	mulsd	%xmm8, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm4, %xmm0
	mulsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm8
	movq	48(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	200035(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm8, (%r14,%rax,8)
	movapd	%xmm2, %xmm0
	subsd	%xmm3, %xmm0
	movapd	%xmm0, %xmm8
	mulsd	%xmm7, %xmm8
	addsd	%xmm9, %xmm8
	mulsd	%xmm8, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm4, %xmm0
	mulsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm8
	movq	32(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	-199964(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm8, (%r14,%rax,8)
	movapd	%xmm3, %xmm0
	subsd	%xmm2, %xmm0
	movapd	%xmm0, %xmm2
	mulsd	%xmm7, %xmm2
	addsd	%xmm9, %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm4, %xmm0
	mulsd	%xmm1, %xmm0
	movapd	%xmm6, %xmm2
	movq	16(%rsp), %rax
	mulsd	(%rbx,%rax,8), %xmm2
	addsd	%xmm0, %xmm2
	leal	199997(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm2, (%r14,%rax,8)
	subsd	%xmm3, %xmm10
	mulsd	%xmm10, %xmm7
	addsd	%xmm9, %xmm7
	mulsd	%xmm7, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm10, %xmm1
	mulsd	(%rbx,%rbp,8), %xmm6
	addsd	%xmm1, %xmm6
	leal	-200002(%rcx), %eax
	movslq	%eax, %rax
	movsd	%xmm6, (%r14,%rax,8)
	jmp	.LBB6_3	# cond_true
	.size	LBM_performStreamCollide, .-LBM_performStreamCollide


	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI7_0:					#  double
	.quad	14279012646494702826	# double value: -1e+30
.LCPI7_1:					#  double
	.quad	5055640609639927018	# double value: 1e+30
	.text
	.align	16
	.type	LBM_showGridStatistics,@function
LBM_showGridStatistics:
	pushq	%r14
	pushq	%rbx
	subq	$72, %rsp
	movq	%rdi, %rbx
	xorb	%r14b, %r14b
	movl	$7, %edi
	movb	%r14b, %al
	call	func_enter
	movl	$23, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	xorl	%eax, %eax
	movsd	.LCPI7_0(%rip), %xmm0
	movsd	%xmm0, 40(%rsp)
	movsd	.LCPI7_1(%rip), %xmm1
	movsd	%xmm1, 56(%rsp)
	pxor	%xmm2, %xmm2
	movsd	%xmm2, 64(%rsp)
	movsd	%xmm1, 32(%rsp)
	movsd	%xmm0, 48(%rsp)
	movl	%eax, %ecx
	movl	%eax, %edx
	movl	%eax, %esi
.LBB7_1:	# bb
	movl	%eax, %edi
	incl	%edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm0
	movslq	%eax, %rdi
	movapd	%xmm0, %xmm1
	addsd	(%rbx,%rdi,8), %xmm1
	leal	2(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm2
	movsd	%xmm2, 8(%rsp)
	addsd	%xmm2, %xmm1
	leal	3(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm2
	addsd	%xmm2, %xmm1
	leal	4(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm3
	movsd	%xmm3, 16(%rsp)
	addsd	%xmm3, %xmm1
	leal	5(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm3
	addsd	%xmm3, %xmm1
	leal	6(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm4
	movsd	%xmm4, 24(%rsp)
	addsd	%xmm4, %xmm1
	leal	7(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm4
	addsd	%xmm4, %xmm1
	leal	8(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm5
	addsd	%xmm5, %xmm1
	leal	9(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm6
	addsd	%xmm6, %xmm1
	leal	10(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm7
	addsd	%xmm7, %xmm1
	leal	11(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm8
	movsd	%xmm8, (%rsp)
	addsd	%xmm8, %xmm1
	leal	12(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm8
	addsd	%xmm8, %xmm1
	leal	13(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm9
	addsd	%xmm9, %xmm1
	leal	14(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm10
	addsd	%xmm10, %xmm1
	leal	15(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm11
	addsd	%xmm11, %xmm1
	leal	16(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm12
	addsd	%xmm12, %xmm1
	leal	17(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm13
	addsd	%xmm13, %xmm1
	leal	18(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm14
	addsd	%xmm14, %xmm1
	ucomisd	48(%rsp), %xmm1
	movapd	%xmm1, %xmm15
	ja	.LBB7_3	# bb
.LBB7_2:	# bb
	movsd	48(%rsp), %xmm15
.LBB7_3:	# bb
	movsd	%xmm15, 48(%rsp)
	movsd	64(%rsp), %xmm15
	addsd	%xmm1, %xmm15
	movsd	%xmm15, 64(%rsp)
	movapd	%xmm1, %xmm15
	minsd	32(%rsp), %xmm15
	leal	19(%rax), %edi
	movslq	%edi, %rdi
	movl	(%rbx,%rdi,8), %edi
	testl	$1, %edi
	jne	.LBB7_10	# cond_true159
.LBB7_4:	# cond_false
	subsd	8(%rsp), %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm6, %xmm0
	subsd	%xmm7, %xmm0
	addsd	(%rsp), %xmm0
	addsd	%xmm8, %xmm0
	subsd	%xmm9, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm0, %xmm0
	subsd	16(%rsp), %xmm2
	addsd	%xmm4, %xmm2
	subsd	%xmm5, %xmm2
	addsd	%xmm6, %xmm2
	subsd	%xmm7, %xmm2
	addsd	%xmm11, %xmm2
	addsd	%xmm12, %xmm2
	subsd	%xmm13, %xmm2
	subsd	%xmm14, %xmm2
	mulsd	%xmm2, %xmm2
	addsd	%xmm0, %xmm2
	subsd	24(%rsp), %xmm3
	addsd	(%rsp), %xmm3
	subsd	%xmm8, %xmm3
	addsd	%xmm9, %xmm3
	subsd	%xmm10, %xmm3
	addsd	%xmm11, %xmm3
	subsd	%xmm12, %xmm3
	addsd	%xmm13, %xmm3
	subsd	%xmm14, %xmm3
	mulsd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	mulsd	%xmm1, %xmm1
	divsd	%xmm1, %xmm2
	ucomisd	40(%rsp), %xmm2
	movapd	%xmm2, %xmm0
	ja	.LBB7_6	# cond_false
.LBB7_5:	# cond_false
	movsd	40(%rsp), %xmm0
.LBB7_6:	# cond_false
	minsd	56(%rsp), %xmm2
	shrl	%edi
	andl	$1, %edi
	addl	%edi, %edx
	xorl	$1, %edi
	addl	%ecx, %edi
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm2, 56(%rsp)
	movl	%edi, %ecx
.LBB7_7:	# bb421
	addl	$20, %eax
	cmpl	$26000000, %eax
	je	.LBB7_9	# bb426
.LBB7_8:	# bb421.bb_crit_edge
	movsd	%xmm15, 32(%rsp)
	jmp	.LBB7_1	# bb
.LBB7_9:	# bb426
	sqrtsd	56(%rsp), %xmm3
	sqrtsd	40(%rsp), %xmm4
	leaq	.str2, %rdi
	movb	$5, %al
	movapd	%xmm15, %xmm0
	movsd	48(%rsp), %xmm1
	movsd	64(%rsp), %xmm2
	call	printf
	addq	$72, %rsp
	popq	%rbx
	popq	%r14
	ret
.LBB7_10:	# cond_true159
	incl	%esi
	jmp	.LBB7_7	# bb421
	.size	LBM_showGridStatistics, .-LBM_showGridStatistics


	.section	.rodata.cst4,"aM",@progbits,4
	.align	8
.LCPI8_1:					#  float
	.long	1129084864	# float 204.468
.LCPI8_2:					#  float
	.long	1111883776	# float 49.5
.LCPI8_3:					#  float
	.long	1065353216	# float 1
	.zero	12
.LCPI8_5:					#  float
	.long	1069547520	# float 1.5
	.zero	20
.LCPI8_8:					#  float
	.long	1083179008	# float 4.5
.LCPI8_9:					#  float
	.long	1077936128	# float 3
	.zero	8
.LCPI8_11:					#  float
	.long	4048155338	# float -1e+30
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI8_0:					#  double
	.quad	4608533498688228556	# double value: 1.3
	.zero	16
.LCPI8_4:					#  double
	.quad	4576918229304087675	# double value: 0.01
	.zero	8
.LCPI8_6:					#  double
	.quad	4599676419421066581	# double value: 0.333333
.LCPI8_7:					#  double
	.quad	4588167220373341980	# double value: 0.0555556
	.zero	8
.LCPI8_10:					#  double
	.quad	4583663620745971484	# double value: 0.0277778
	.text
	.align	16
	.globl	main
	.type	main,@function
main:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$888, %rsp
	movl	%edi, %ebx
	movl	%ebx, 700(%rsp)
	movq	%rsi, %r14
	xorb	%al, %al
	movl	$8, %edi
	call	func_enter
	leal	-5(%rbx), %eax
	cmpl	$2, %eax
	jae	.LBB8_44	# cond_true.i
.LBB8_1:	# cond_next.i
	movq	8(%r14), %rdi
	xorl	%ebx, %ebx
	movl	$10, %r15d
	xorl	%r12d, %r12d
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%ebx, %ecx
	call	__strtol_internal
	movq	%rax, %r13
	movq	24(%r14), %rdi
	movq	16(%r14), %rax
	movq	%rax, 704(%rsp)
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%ebx, %ecx
	call	__strtol_internal
	movq	%rax, %rbp
	movq	32(%r14), %rdi
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%ebx, %ecx
	call	__strtol_internal
	movl	%r13d, %ebx
	movl	%ebp, %r15d
	movl	%eax, %r12d
	cmpl	$6, 700(%rsp)
	movq	%rax, %r13
	jne	.LBB8_45	# cond_next.i.cond_next131.i_crit_edge
.LBB8_2:	# cond_true88.i
	movq	40(%r14), %r14
	leaq	720(%rsp), %rdx
	movl	$1, %edi
	movq	%r14, %rsi
	call	__xstat
	testl	%eax, %eax
	je	.LBB8_7	# cond_next113.i
.LBB8_3:	# cond_true107.i
	xorb	%al, %al
	leaq	.str37, %rdi
	movq	%r14, %rsi
.LBB8_4:	# cond_true107.i
	call	printf
.LBB8_5:	# cond_true107.i
	movl	$1, %eax
.LBB8_6:	# cond_true107.i
	addq	$888, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB8_7:	# cond_next113.i
	movq	768(%rsp), %rdx
	cmpq	$1313130, %rdx
	jne	.LBB8_46	# cond_true119.i
.LBB8_8:	# cond_next131.i
	cmpl	$1, %r15d
	jne	.LBB8_10	# MAIN_parseCommandLine.exit
.LBB8_9:	# cond_true138.i
	leaq	720(%rsp), %rdx
	movl	$1, %edi
	movq	704(%rsp), %rsi
	call	__xstat
	testl	%eax, %eax
	jne	.LBB8_47	# cond_true154.i
.LBB8_10:	# MAIN_parseCommandLine.exit
	testq	%r14, %r14
	leaq	.str4, %rax
	cmovne	%r14, %rax
	movq	%rax, 16(%rsp)
	movl	$4294967295, %eax
	andq	%rax, %r13
	shlq	$5, %r13
	leaq	simTypeString.2843(%r13), %rdx
	movq	%rdx, 8(%rsp)
	andq	%rax, %rbp
	shlq	$5, %rbp
	leaq	actionString.2842(%rbp), %rax
	movq	%rax, (%rsp)
	movl	$130, %ecx
	leaq	.str15, %rdi
	movl	$100, %edx
	movb	$1, %al
	movsd	.LCPI8_0(%rip), %xmm0
	movl	%edx, %esi
	movl	%ebx, %r8d
	movq	704(%rsp), %r9
	call	printf
	movl	$214400000, %edi
	call	malloc
	movq	%rax, srcGrid
	testq	%rax, %rax
	je	.LBB8_48	# cond_true.i1
.LBB8_11:	# LBM_allocateGrid.exit
	movq	%rax, %r13
	addq	$3200000, %r13
	movq	%r13, srcGrid
	movl	$214400000, %edi
	call	malloc
	movq	%rax, dstGrid
	testq	%rax, %rax
	je	.LBB8_48	# cond_true.i1
.LBB8_12:	# LBM_allocateGrid.exit129
	movq	%rax, %rbp
	addq	$3200000, %rbp
	movq	%rbp, dstGrid
	movq	%r13, %rdi
	call	LBM_initializeGrid
	movq	%rbp, %rdi
	call	LBM_initializeGrid
	testq	%r14, %r14
	je	.LBB8_14	# cond_next.i106
.LBB8_13:	# cond_true.i104
	movq	%r13, %rdi
	movq	%r14, %rsi
	call	LBM_loadObstacleFile
	movq	dstGrid, %rdi
	movq	%r14, %rsi
	call	LBM_loadObstacleFile
.LBB8_14:	# cond_next.i106
	cmpl	$1, %r12d
	movq	srcGrid, %r14
	je	.LBB8_49	# cond_true25.i
.LBB8_15:	# cond_false.i108
	movq	%r14, %rdi
	call	LBM_initializeSpecialCellsForLDC
	movq	dstGrid, %rdi
	call	LBM_initializeSpecialCellsForLDC
.LBB8_16:	# MAIN_initialize.exit
	movq	%r14, %rdi
	call	LBM_showGridStatistics
	testl	%ebx, %ebx
	jle	.LBB8_25	# bb68
.LBB8_17:	# bb.preheader
	xorb	%r14b, %r14b
	movl	$31, %edi
	movb	%r14b, %al
	call	loop_enter
	movl	$32, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	cmpl	$1, %r12d
	jne	.LBB8_50	# bb.preheader.bb_crit_edge
.LBB8_18:	# bb.preheader.bb.us_crit_edge
	movl	$1, %r14d
.LBB8_19:	# bb.us
	movq	srcGrid, %r12
	xorb	%al, %al
	movl	$33, %edi
	call	loop_enter
	xorl	%r13d, %r13d
.LBB8_20:	# bb.i
	movl	$274877907, %ecx
	movl	%r13d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$7, %edx
	movl	%edx, %ecx
	addl	%eax, %ecx
	movl	$1374389535, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	movl	$1717986919, %edx
	movl	%r13d, %eax
	imull	%edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$3, %edx
	movl	%edx, %r8d
	addl	%eax, %r8d
	movl	%r8d, %eax
	imull	%esi
	movl	%edx, %esi
	shrl	$31, %esi
	sarl	$5, %edx
	addl	%esi, %edx
	imull	$100, %edx, %edx
	subl	%edx, %r8d
	cvtsi2sd	%r8d, %xmm0
	cvtss2sd	.LCPI8_2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtss2sd	.LCPI8_3(%rip), %xmm2
	subsd	%xmm2, %xmm0
	movl	%edi, %edx
	shrl	$31, %edx
	sarl	$5, %edi
	addl	%edx, %edi
	imull	$100, %edi, %edx
	subl	%edx, %ecx
	cvtsi2sd	%ecx, %xmm3
	divsd	%xmm1, %xmm3
	subsd	%xmm2, %xmm3
	mulsd	%xmm3, %xmm3
	movapd	%xmm2, %xmm1
	subsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	subsd	%xmm0, %xmm3
	mulsd	.LCPI8_4(%rip), %xmm3
	mulsd	%xmm1, %xmm3
	movapd	%xmm3, %xmm0
	mulsd	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cvtss2sd	.LCPI8_5(%rip), %xmm4
	mulsd	%xmm4, %xmm0
	movapd	%xmm2, %xmm4
	subsd	%xmm0, %xmm4
	leal	400000(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	leal	400001(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400002(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400003(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400004(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400005(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400006(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400007(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400008(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400009(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400010(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400011(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400012(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400013(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400014(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400015(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400016(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400017(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	400018(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm5
	leal	200000(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm6
	leal	200001(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200002(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200003(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200004(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200005(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200006(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200007(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200008(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200009(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200010(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200011(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200012(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200013(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200014(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200015(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200016(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200017(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	leal	200018(%r13), %ecx
	movslq	%ecx, %rcx
	addsd	(%r12,%rcx,8), %xmm6
	addsd	%xmm6, %xmm6
	subsd	%xmm5, %xmm6
	movapd	%xmm6, %xmm5
	mulsd	.LCPI8_6(%rip), %xmm5
	mulsd	%xmm4, %xmm5
	movslq	%r13d, %rcx
	movsd	%xmm5, (%r12,%rcx,8)
	movapd	%xmm6, %xmm5
	mulsd	.LCPI8_7(%rip), %xmm5
	movapd	%xmm5, %xmm7
	mulsd	%xmm4, %xmm7
	movl	%r13d, %ecx
	incl	%ecx
	movslq	%ecx, %rcx
	movsd	%xmm7, (%r12,%rcx,8)
	leal	2(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm7, (%r12,%rcx,8)
	leal	3(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm7, (%r12,%rcx,8)
	leal	4(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm7, (%r12,%rcx,8)
	cvtss2sd	.LCPI8_8(%rip), %xmm7
	movapd	%xmm3, %xmm8
	mulsd	%xmm7, %xmm8
	cvtss2sd	.LCPI8_9(%rip), %xmm9
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm2, %xmm10
	subsd	%xmm0, %xmm10
	mulsd	%xmm5, %xmm10
	leal	5(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm10, (%r12,%rcx,8)
	movapd	%xmm8, %xmm10
	subsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm2, %xmm10
	subsd	%xmm0, %xmm10
	mulsd	%xmm10, %xmm5
	leal	6(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm5, (%r12,%rcx,8)
	mulsd	.LCPI8_10(%rip), %xmm6
	mulsd	%xmm6, %xmm4
	leal	7(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	leal	8(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	leal	9(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	leal	10(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm3, %xmm4
	subsd	%xmm1, %xmm4
	movapd	%xmm1, %xmm5
	subsd	%xmm3, %xmm5
	addsd	%xmm3, %xmm1
	movapd	%xmm1, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm1
	addsd	%xmm2, %xmm1
	subsd	%xmm0, %xmm1
	mulsd	%xmm6, %xmm1
	leal	11(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm1, (%r12,%rcx,8)
	movapd	%xmm5, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm5
	addsd	%xmm2, %xmm5
	subsd	%xmm0, %xmm5
	mulsd	%xmm6, %xmm5
	leal	12(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm5, (%r12,%rcx,8)
	mulsd	%xmm4, %xmm7
	addsd	%xmm9, %xmm7
	mulsd	%xmm7, %xmm4
	addsd	%xmm2, %xmm4
	subsd	%xmm0, %xmm4
	mulsd	%xmm6, %xmm4
	leal	13(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	subsd	%xmm8, %xmm9
	mulsd	%xmm3, %xmm9
	subsd	%xmm9, %xmm2
	subsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm6
	leal	14(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm6, (%r12,%rcx,8)
	leal	15(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm1, (%r12,%rcx,8)
	leal	16(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm5, (%r12,%rcx,8)
	leal	17(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	leal	18(%r13), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm6, (%r12,%rcx,8)
	xorb	%cl, %cl
	movl	$27, %edi
	movb	%cl, %al
	call	loop_enter
	addl	$20, %r13d
	cmpl	$200000, %r13d
	jne	.LBB8_20	# bb.i
.LBB8_21:	# bb.i.bb662.i_crit_edge
	xorl	%eax, %eax
.LBB8_22:	# bb662.i
	leal	25400002(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm0
	leal	25400001(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm1
	leal	25400000(%rax), %ecx
	movslq	%ecx, %rcx
	movapd	%xmm1, %xmm2
	addsd	(%r12,%rcx,8), %xmm2
	addsd	%xmm0, %xmm2
	leal	25400003(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm3
	addsd	%xmm3, %xmm2
	leal	25400004(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm4
	movsd	%xmm4, 680(%rsp)
	addsd	%xmm4, %xmm2
	leal	25400005(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm4
	addsd	%xmm4, %xmm2
	leal	25400006(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 688(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400007(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 600(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400008(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 592(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400009(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 584(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400010(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 576(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400011(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 672(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400012(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 664(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400013(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 656(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400014(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 648(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400015(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 640(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400016(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 632(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400017(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 616(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400018(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	movsd	%xmm5, 608(%rsp)
	addsd	%xmm5, %xmm2
	subsd	%xmm0, %xmm1
	addsd	600(%rsp), %xmm1
	addsd	592(%rsp), %xmm1
	subsd	584(%rsp), %xmm1
	subsd	576(%rsp), %xmm1
	addsd	672(%rsp), %xmm1
	addsd	664(%rsp), %xmm1
	subsd	656(%rsp), %xmm1
	subsd	648(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	leal	25600002(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm0
	leal	25600001(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm5
	leal	25600000(%rax), %ecx
	movslq	%ecx, %rcx
	movapd	%xmm5, %xmm6
	addsd	(%r12,%rcx,8), %xmm6
	addsd	%xmm0, %xmm6
	leal	25600003(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm7
	addsd	%xmm7, %xmm6
	leal	25600004(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm8
	movsd	%xmm8, 568(%rsp)
	addsd	%xmm8, %xmm6
	leal	25600005(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm8
	addsd	%xmm8, %xmm6
	leal	25600006(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm9
	movsd	%xmm9, 624(%rsp)
	addsd	%xmm9, %xmm6
	leal	25600007(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm9
	addsd	%xmm9, %xmm6
	leal	25600008(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm10
	addsd	%xmm10, %xmm6
	leal	25600009(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm11
	addsd	%xmm11, %xmm6
	leal	25600010(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm12
	addsd	%xmm12, %xmm6
	leal	25600011(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 560(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600012(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 552(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600013(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 544(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600014(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 536(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600015(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 528(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600016(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	movsd	%xmm13, 520(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600017(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm13
	addsd	%xmm13, %xmm6
	leal	25600018(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%r12,%rcx,8), %xmm14
	addsd	%xmm14, %xmm6
	subsd	%xmm0, %xmm5
	addsd	%xmm9, %xmm5
	addsd	%xmm10, %xmm5
	subsd	%xmm11, %xmm5
	subsd	%xmm12, %xmm5
	addsd	560(%rsp), %xmm5
	addsd	552(%rsp), %xmm5
	subsd	544(%rsp), %xmm5
	subsd	536(%rsp), %xmm5
	divsd	%xmm6, %xmm5
	addsd	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm15
	mulsd	%xmm15, %xmm15
	subsd	680(%rsp), %xmm3
	addsd	600(%rsp), %xmm3
	subsd	592(%rsp), %xmm3
	addsd	584(%rsp), %xmm3
	subsd	576(%rsp), %xmm3
	addsd	640(%rsp), %xmm3
	addsd	632(%rsp), %xmm3
	subsd	616(%rsp), %xmm3
	subsd	608(%rsp), %xmm3
	divsd	%xmm2, %xmm3
	subsd	568(%rsp), %xmm7
	addsd	%xmm9, %xmm7
	subsd	%xmm10, %xmm7
	addsd	%xmm11, %xmm7
	subsd	%xmm12, %xmm7
	addsd	528(%rsp), %xmm7
	addsd	520(%rsp), %xmm7
	subsd	%xmm13, %xmm7
	subsd	%xmm14, %xmm7
	divsd	%xmm6, %xmm7
	addsd	%xmm7, %xmm7
	movapd	%xmm7, %xmm9
	subsd	%xmm3, %xmm9
	movapd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm10
	addsd	%xmm15, %xmm10
	subsd	688(%rsp), %xmm4
	addsd	672(%rsp), %xmm4
	subsd	664(%rsp), %xmm4
	addsd	656(%rsp), %xmm4
	subsd	648(%rsp), %xmm4
	addsd	640(%rsp), %xmm4
	subsd	632(%rsp), %xmm4
	addsd	616(%rsp), %xmm4
	subsd	608(%rsp), %xmm4
	divsd	%xmm2, %xmm4
	subsd	624(%rsp), %xmm8
	addsd	560(%rsp), %xmm8
	subsd	552(%rsp), %xmm8
	addsd	544(%rsp), %xmm8
	subsd	536(%rsp), %xmm8
	addsd	528(%rsp), %xmm8
	subsd	520(%rsp), %xmm8
	addsd	%xmm13, %xmm8
	subsd	%xmm14, %xmm8
	divsd	%xmm6, %xmm8
	addsd	%xmm8, %xmm8
	subsd	%xmm4, %xmm8
	movapd	%xmm8, %xmm2
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm10
	cvtss2sd	.LCPI8_5(%rip), %xmm2
	mulsd	%xmm2, %xmm10
	cvtss2sd	.LCPI8_8(%rip), %xmm2
	movapd	%xmm0, %xmm4
	mulsd	%xmm2, %xmm4
	cvtss2sd	.LCPI8_9(%rip), %xmm6
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm0, %xmm11
	cvtss2sd	.LCPI8_3(%rip), %xmm12
	addsd	%xmm12, %xmm11
	subsd	%xmm6, %xmm4
	mulsd	%xmm0, %xmm4
	addsd	%xmm12, %xmm4
	movapd	%xmm12, %xmm13
	subsd	%xmm10, %xmm13
	mulsd	.LCPI8_6(%rip), %xmm13
	leal	25800000(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm13, (%r12,%rcx,8)
	subsd	%xmm10, %xmm11
	movsd	.LCPI8_7(%rip), %xmm13
	mulsd	%xmm13, %xmm11
	leal	25800001(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm11, (%r12,%rcx,8)
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800002(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm9, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm9, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm13, %xmm11
	leal	25800003(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm11, (%r12,%rcx,8)
	subsd	%xmm6, %xmm4
	mulsd	%xmm9, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800004(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm8, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm8, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm13, %xmm11
	leal	25800005(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm11, (%r12,%rcx,8)
	subsd	%xmm6, %xmm4
	mulsd	%xmm8, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800006(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm9, %xmm4
	subsd	%xmm0, %xmm4
	movapd	%xmm0, %xmm11
	subsd	%xmm9, %xmm11
	movapd	%xmm9, %xmm13
	addsd	%xmm0, %xmm13
	movapd	%xmm13, %xmm14
	mulsd	%xmm2, %xmm14
	addsd	%xmm6, %xmm14
	mulsd	%xmm14, %xmm13
	addsd	%xmm12, %xmm13
	subsd	%xmm10, %xmm13
	movsd	.LCPI8_10(%rip), %xmm14
	mulsd	%xmm14, %xmm13
	leal	25800007(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm13, (%r12,%rcx,8)
	movapd	%xmm11, %xmm13
	mulsd	%xmm2, %xmm13
	addsd	%xmm6, %xmm13
	mulsd	%xmm13, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm14, %xmm11
	leal	25800008(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm11, (%r12,%rcx,8)
	movapd	%xmm4, %xmm11
	mulsd	%xmm2, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm11, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800009(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	subsd	%xmm7, %xmm3
	movapd	%xmm3, %xmm4
	subsd	%xmm0, %xmm4
	movapd	%xmm4, %xmm7
	mulsd	%xmm2, %xmm7
	addsd	%xmm6, %xmm7
	mulsd	%xmm7, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800010(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm0, %xmm4
	addsd	%xmm8, %xmm4
	movapd	%xmm4, %xmm7
	mulsd	%xmm2, %xmm7
	addsd	%xmm6, %xmm7
	mulsd	%xmm7, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800011(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	subsd	%xmm5, %xmm1
	subsd	%xmm8, %xmm1
	movapd	%xmm8, %xmm4
	subsd	%xmm0, %xmm4
	subsd	%xmm8, %xmm0
	movapd	%xmm0, %xmm5
	mulsd	%xmm2, %xmm5
	addsd	%xmm6, %xmm5
	mulsd	%xmm5, %xmm0
	addsd	%xmm12, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm14, %xmm0
	leal	25800012(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm0, (%r12,%rcx,8)
	movapd	%xmm4, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm0, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800013(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm4, (%r12,%rcx,8)
	movapd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm0, %xmm1
	addsd	%xmm12, %xmm1
	subsd	%xmm10, %xmm1
	mulsd	%xmm14, %xmm1
	leal	25800014(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm1, (%r12,%rcx,8)
	movapd	%xmm9, %xmm0
	addsd	%xmm8, %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm12, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm14, %xmm0
	leal	25800015(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm0, (%r12,%rcx,8)
	subsd	%xmm8, %xmm3
	movapd	%xmm8, %xmm0
	subsd	%xmm9, %xmm0
	subsd	%xmm8, %xmm9
	movapd	%xmm9, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm1
	mulsd	%xmm1, %xmm9
	addsd	%xmm12, %xmm9
	subsd	%xmm10, %xmm9
	mulsd	%xmm14, %xmm9
	leal	25800016(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm9, (%r12,%rcx,8)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm12, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm14, %xmm0
	leal	25800017(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm0, (%r12,%rcx,8)
	mulsd	%xmm3, %xmm2
	addsd	%xmm6, %xmm2
	mulsd	%xmm2, %xmm3
	addsd	%xmm12, %xmm3
	subsd	%xmm10, %xmm3
	mulsd	%xmm14, %xmm3
	leal	25800018(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	%xmm3, (%r12,%rcx,8)
	addl	$20, %eax
	cmpl	$200000, %eax
	jne	.LBB8_22	# bb662.i
.LBB8_23:	# LBM_handleInOutFlow.exit
	movq	dstGrid, %r13
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	LBM_performStreamCollide
	movq	%r13, srcGrid
	movq	%r12, dstGrid
	testl	$63, %r14d
	je	.LBB8_54	# cond_true52.us
.LBB8_24:	# bb61.us
	incl	%r14d
	cmpl	%r14d, %ebx
	jge	.LBB8_19	# bb.us
.LBB8_25:	# bb68
	movq	srcGrid, %rdi
	call	LBM_showGridStatistics
	cmpl	$2, %r15d
	je	.LBB8_36	# cond_true91
.LBB8_26:	# bb68
	cmpl	$1, %r15d
	jne	.LBB8_43	# cond_next97
.LBB8_27:	# cond_true78
	movq	srcGrid, %rbx
	leaq	.str1, %rsi
	movq	704(%rsp), %rdi
	call	fopen
	movq	%rax, %r14
	xorb	%al, %al
	movl	$26, %ecx
	movl	%ecx, %edi
	call	loop_enter
	movss	.LCPI8_11(%rip), %xmm0
	movss	%xmm0, 516(%rsp)
	movl	$0, 440(%rsp)
.LBB8_28:	# bb883.outer.i
	xorb	%al, %al
	movl	$30, %edi
	call	loop_enter
	movl	440(%rsp), %eax
	leal	14(%rax), %ecx
	movl	%ecx, 512(%rsp)
	leal	15(%rax), %ecx
	movl	%ecx, 508(%rsp)
	leal	6(%rax), %ecx
	movl	%ecx, 504(%rsp)
	leal	2(%rax), %ecx
	movl	%ecx, 500(%rsp)
	leal	18(%rax), %ecx
	movl	%ecx, 496(%rsp)
	leal	8(%rax), %ecx
	movl	%ecx, 492(%rsp)
	leal	9(%rax), %ecx
	movl	%ecx, 488(%rsp)
	leal	3(%rax), %ecx
	movl	%ecx, 484(%rsp)
	leal	12(%rax), %ecx
	movl	%ecx, 480(%rsp)
	leal	16(%rax), %ecx
	movl	%ecx, 476(%rsp)
	leal	7(%rax), %ecx
	movl	%ecx, 472(%rsp)
	leal	10(%rax), %ecx
	movl	%ecx, 468(%rsp)
	leal	11(%rax), %ecx
	movl	%ecx, 464(%rsp)
	leal	4(%rax), %ecx
	movl	%ecx, 460(%rsp)
	leal	13(%rax), %ecx
	movl	%ecx, 456(%rsp)
	leal	5(%rax), %ecx
	movl	%ecx, 452(%rsp)
	movl	%eax, %ecx
	incl	%ecx
	movl	%ecx, 444(%rsp)
	leal	17(%rax), %eax
	movl	%eax, 448(%rsp)
	xorl	%r15d, %r15d
.LBB8_29:	# bb875.preheader.i
	xorb	%al, %al
	movl	$24, %edi
	call	loop_enter
	movl	512(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 436(%rsp)
	movl	508(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 400(%rsp)
	movl	504(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 404(%rsp)
	movl	476(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 432(%rsp)
	movl	472(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 408(%rsp)
	movl	500(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 380(%rsp)
	movl	484(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 384(%rsp)
	movl	488(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 424(%rsp)
	movl	440(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 368(%rsp)
	movl	480(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 412(%rsp)
	movl	448(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 428(%rsp)
	movl	492(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 420(%rsp)
	movl	468(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 416(%rsp)
	movl	464(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 396(%rsp)
	movl	460(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 388(%rsp)
	movl	456(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 376(%rsp)
	movl	452(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 372(%rsp)
	movl	444(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 212(%rsp)
	movl	496(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 208(%rsp)
	xorl	%r12d, %r12d
	movss	516(%rsp), %xmm0
	movss	%xmm0, 392(%rsp)
.LBB8_30:	# bb9.i119
	movl	212(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 360(%rsp)
	movl	368(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	addsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 352(%rsp)
	movl	408(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 344(%rsp)
	movl	420(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 336(%rsp)
	movl	424(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 328(%rsp)
	movl	416(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 320(%rsp)
	movl	396(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 312(%rsp)
	movl	428(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 304(%rsp)
	movl	208(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 296(%rsp)
	movl	432(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 288(%rsp)
	movl	412(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 280(%rsp)
	movl	376(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 272(%rsp)
	movl	400(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 264(%rsp)
	movl	436(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 256(%rsp)
	movl	380(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 248(%rsp)
	movl	384(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 240(%rsp)
	movl	388(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 232(%rsp)
	movl	372(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 224(%rsp)
	movl	404(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 216(%rsp)
	movl	$1, %r13d
	movl	$4, %ebp
	leaq	884(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fread
	leaq	880(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fread
	leaq	876(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fread
	movsd	352(%rsp), %xmm0
	addsd	248(%rsp), %xmm0
	addsd	240(%rsp), %xmm0
	addsd	232(%rsp), %xmm0
	addsd	224(%rsp), %xmm0
	addsd	216(%rsp), %xmm0
	addsd	344(%rsp), %xmm0
	addsd	336(%rsp), %xmm0
	addsd	328(%rsp), %xmm0
	addsd	320(%rsp), %xmm0
	addsd	312(%rsp), %xmm0
	addsd	280(%rsp), %xmm0
	addsd	272(%rsp), %xmm0
	addsd	256(%rsp), %xmm0
	addsd	264(%rsp), %xmm0
	addsd	288(%rsp), %xmm0
	addsd	304(%rsp), %xmm0
	addsd	296(%rsp), %xmm0
	movsd	%xmm0, 352(%rsp)
	movsd	360(%rsp), %xmm0
	subsd	248(%rsp), %xmm0
	addsd	344(%rsp), %xmm0
	addsd	336(%rsp), %xmm0
	subsd	328(%rsp), %xmm0
	subsd	320(%rsp), %xmm0
	addsd	312(%rsp), %xmm0
	addsd	280(%rsp), %xmm0
	subsd	272(%rsp), %xmm0
	subsd	256(%rsp), %xmm0
	divsd	352(%rsp), %xmm0
	movsd	%xmm0, 360(%rsp)
	cvtss2sd	880(%rsp), %xmm0
	movsd	360(%rsp), %xmm1
	subsd	%xmm0, %xmm1
	movsd	%xmm1, 360(%rsp)
	cvtsd2ss	%xmm1, %xmm0
	mulss	%xmm0, %xmm0
	movsd	240(%rsp), %xmm1
	subsd	232(%rsp), %xmm1
	addsd	344(%rsp), %xmm1
	subsd	336(%rsp), %xmm1
	addsd	328(%rsp), %xmm1
	subsd	320(%rsp), %xmm1
	addsd	264(%rsp), %xmm1
	addsd	288(%rsp), %xmm1
	subsd	304(%rsp), %xmm1
	subsd	296(%rsp), %xmm1
	divsd	352(%rsp), %xmm1
	movsd	%xmm1, 240(%rsp)
	cvtss2sd	884(%rsp), %xmm1
	movsd	240(%rsp), %xmm2
	subsd	%xmm1, %xmm2
	movsd	%xmm2, 240(%rsp)
	cvtsd2ss	%xmm2, %xmm1
	mulss	%xmm1, %xmm1
	addss	%xmm0, %xmm1
	movsd	224(%rsp), %xmm0
	subsd	216(%rsp), %xmm0
	addsd	312(%rsp), %xmm0
	subsd	280(%rsp), %xmm0
	addsd	272(%rsp), %xmm0
	subsd	256(%rsp), %xmm0
	addsd	264(%rsp), %xmm0
	subsd	288(%rsp), %xmm0
	addsd	304(%rsp), %xmm0
	subsd	296(%rsp), %xmm0
	divsd	352(%rsp), %xmm0
	movsd	%xmm0, 224(%rsp)
	cvtss2sd	876(%rsp), %xmm0
	movsd	224(%rsp), %xmm2
	subsd	%xmm0, %xmm2
	movsd	%xmm2, 224(%rsp)
	cvtsd2ss	%xmm2, %xmm0
	mulss	%xmm0, %xmm0
	addss	%xmm0, %xmm1
	movss	%xmm1, 516(%rsp)
	ucomiss	392(%rsp), %xmm1
	ja	.LBB8_32	# bb9.i119
.LBB8_31:	# bb9.i119
	movss	392(%rsp), %xmm0
	movss	%xmm0, 516(%rsp)
.LBB8_32:	# bb9.i119
	addl	$20, %r12d
	cmpl	$2000, %r12d
	movss	516(%rsp), %xmm0
	movss	%xmm0, 392(%rsp)
	jne	.LBB8_30	# bb9.i119
.LBB8_33:	# bb880.i
	addl	$2000, %r15d
	cmpl	$200000, %r15d
	jne	.LBB8_29	# bb875.preheader.i
.LBB8_34:	# bb891.i
	movl	440(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 440(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB8_28	# bb883.outer.i
.LBB8_35:	# LBM_compareVelocityField.exit
	cvtss2sd	516(%rsp), %xmm0
	sqrtsd	%xmm0, %xmm0
	movb	$1, %al
	leaq	.str6, %rdi
	call	printf
	jmp	.LBB8_42	# LBM_storeVelocityField.exit
.LBB8_36:	# cond_true91
	movq	srcGrid, %rbx
	leaq	.str7, %rsi
	movq	704(%rsp), %rdi
	call	fopen
	movq	%rax, %r14
	xorb	%al, %al
	movl	$29, %ecx
	movl	%ecx, %edi
	call	loop_enter
	movl	$0, 132(%rsp)
.LBB8_37:	# bb852.outer.i
	xorb	%al, %al
	movl	$25, %edi
	call	loop_enter
	movl	132(%rsp), %eax
	leal	14(%rax), %ecx
	movl	%ecx, 204(%rsp)
	leal	15(%rax), %ecx
	movl	%ecx, 200(%rsp)
	leal	6(%rax), %ecx
	movl	%ecx, 196(%rsp)
	leal	2(%rax), %ecx
	movl	%ecx, 192(%rsp)
	leal	18(%rax), %ecx
	movl	%ecx, 188(%rsp)
	leal	8(%rax), %ecx
	movl	%ecx, 184(%rsp)
	leal	9(%rax), %ecx
	movl	%ecx, 180(%rsp)
	leal	3(%rax), %ecx
	movl	%ecx, 176(%rsp)
	leal	12(%rax), %ecx
	movl	%ecx, 172(%rsp)
	leal	16(%rax), %ecx
	movl	%ecx, 168(%rsp)
	leal	7(%rax), %ecx
	movl	%ecx, 164(%rsp)
	leal	10(%rax), %ecx
	movl	%ecx, 160(%rsp)
	leal	11(%rax), %ecx
	movl	%ecx, 156(%rsp)
	leal	4(%rax), %ecx
	movl	%ecx, 152(%rsp)
	leal	13(%rax), %ecx
	movl	%ecx, 148(%rsp)
	leal	5(%rax), %ecx
	movl	%ecx, 144(%rsp)
	movl	%eax, %ecx
	incl	%ecx
	movl	%ecx, 136(%rsp)
	leal	17(%rax), %eax
	movl	%eax, 140(%rsp)
	xorl	%r15d, %r15d
.LBB8_38:	# bb844.preheader.i
	xorb	%al, %al
	movl	$28, %edi
	call	loop_enter
	movl	204(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 124(%rsp)
	movl	200(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 96(%rsp)
	movl	196(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 80(%rsp)
	movl	168(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 120(%rsp)
	movl	164(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 112(%rsp)
	movl	192(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 64(%rsp)
	movl	176(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 116(%rsp)
	movl	180(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 104(%rsp)
	movl	132(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 68(%rsp)
	movl	172(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 76(%rsp)
	movl	140(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 128(%rsp)
	movl	184(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 88(%rsp)
	movl	160(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 100(%rsp)
	movl	156(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 92(%rsp)
	movl	152(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 108(%rsp)
	movl	148(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 84(%rsp)
	movl	144(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 72(%rsp)
	movl	136(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 36(%rsp)
	movl	188(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	movl	%r12d, 32(%rsp)
	xorl	%r12d, %r12d
.LBB8_39:	# bb9.i
	movl	36(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movl	68(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movapd	%xmm0, %xmm1
	addsd	(%rbx,%rax,8), %xmm1
	movl	64(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm2
	movsd	%xmm2, 48(%rsp)
	addsd	%xmm2, %xmm1
	movl	116(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm2
	addsd	%xmm2, %xmm1
	movl	108(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm3
	movsd	%xmm3, 40(%rsp)
	addsd	%xmm3, %xmm1
	movl	72(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm3
	addsd	%xmm3, %xmm1
	movl	80(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm4
	movsd	%xmm4, 56(%rsp)
	addsd	%xmm4, %xmm1
	movl	112(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm4
	addsd	%xmm4, %xmm1
	movl	88(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm5
	addsd	%xmm5, %xmm1
	movl	104(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm6
	addsd	%xmm6, %xmm1
	movl	100(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm7
	addsd	%xmm7, %xmm1
	movl	92(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm8
	addsd	%xmm8, %xmm1
	movl	76(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm9
	addsd	%xmm9, %xmm1
	movl	84(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm10
	addsd	%xmm10, %xmm1
	movl	124(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm11
	addsd	%xmm11, %xmm1
	movl	96(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm12
	addsd	%xmm12, %xmm1
	movl	120(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm13
	addsd	%xmm13, %xmm1
	movl	128(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm14
	addsd	%xmm14, %xmm1
	movl	32(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm15
	addsd	%xmm15, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	subsd	40(%rsp), %xmm2
	addsd	%xmm4, %xmm2
	subsd	%xmm5, %xmm2
	addsd	%xmm6, %xmm2
	subsd	%xmm7, %xmm2
	addsd	%xmm12, %xmm2
	addsd	%xmm13, %xmm2
	subsd	%xmm14, %xmm2
	subsd	%xmm15, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	divss	%xmm1, %xmm2
	movss	%xmm2, 872(%rsp)
	subsd	48(%rsp), %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm6, %xmm0
	subsd	%xmm7, %xmm0
	addsd	%xmm8, %xmm0
	addsd	%xmm9, %xmm0
	subsd	%xmm10, %xmm0
	subsd	%xmm11, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, 868(%rsp)
	subsd	56(%rsp), %xmm3
	addsd	%xmm8, %xmm3
	subsd	%xmm9, %xmm3
	addsd	%xmm10, %xmm3
	subsd	%xmm11, %xmm3
	addsd	%xmm12, %xmm3
	subsd	%xmm13, %xmm3
	addsd	%xmm14, %xmm3
	subsd	%xmm15, %xmm3
	cvtsd2ss	%xmm3, %xmm0
	divss	%xmm1, %xmm0
	movss	%xmm0, 864(%rsp)
	movl	$1, %r13d
	movl	$4, %ebp
	leaq	872(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fwrite
	leaq	868(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fwrite
	leaq	864(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	%r14, %rcx
	call	fwrite
	addl	$20, %r12d
	cmpl	$2000, %r12d
	jl	.LBB8_39	# bb9.i
.LBB8_40:	# bb849.i
	addl	$2000, %r15d
	cmpl	$200000, %r15d
	jne	.LBB8_38	# bb844.preheader.i
.LBB8_41:	# bb857.i
	movl	132(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 132(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB8_37	# bb852.outer.i
.LBB8_42:	# LBM_storeVelocityField.exit
	movq	%r14, %rdi
	call	fclose
.LBB8_43:	# cond_next97
	movq	$-3200000, %rbx
	movq	%rbx, %rdi
	addq	srcGrid, %rdi
	call	free
	movq	$0, srcGrid
	movq	%rbx, %rdi
	addq	dstGrid, %rdi
	call	free
	movq	$0, dstGrid
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	jmp	.LBB8_6	# cond_true107.i
.LBB8_44:	# cond_true.i
	leaq	.str26, %rdi
	call	puts
	jmp	.LBB8_5	# cond_true107.i
.LBB8_45:	# cond_next.i.cond_next131.i_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB8_8	# cond_next131.i
.LBB8_46:	# cond_true119.i
	movl	$1313130, %ecx
	xorb	%al, %al
	leaq	.str48, %rdi
	movq	%r14, %rsi
	call	printf
	jmp	.LBB8_5	# cond_true107.i
.LBB8_47:	# cond_true154.i
	xorb	%al, %al
	leaq	.str59, %rdi
	movq	704(%rsp), %rsi
	jmp	.LBB8_4	# cond_true107.i
.LBB8_48:	# cond_true.i1
	movb	$1, %al
	leaq	.str, %rdi
	cvtss2sd	.LCPI8_1(%rip), %xmm0
	call	printf
	movl	$1, %ebx
	movl	%ebx, %edi
	call	exit
.LBB8_49:	# cond_true25.i
	movq	%r14, %rdi
	call	LBM_initializeSpecialCellsForChannel
	movq	dstGrid, %rdi
	call	LBM_initializeSpecialCellsForChannel
	jmp	.LBB8_16	# MAIN_initialize.exit
.LBB8_50:	# bb.preheader.bb_crit_edge
	movl	$1, %r14d
.LBB8_51:	# bb
	movq	srcGrid, %r12
	movq	dstGrid, %r13
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	LBM_performStreamCollide
	movq	%r13, srcGrid
	movq	%r12, dstGrid
	testl	$63, %r14d
	jne	.LBB8_53	# bb61
.LBB8_52:	# cond_true52
	xorb	%al, %al
	leaq	.str610, %rdi
	movl	%r14d, %esi
	call	printf
	movq	srcGrid, %rdi
	call	LBM_showGridStatistics
.LBB8_53:	# bb61
	incl	%r14d
	cmpl	%r14d, %ebx
	jl	.LBB8_25	# bb68
	jmp	.LBB8_51	# bb
.LBB8_54:	# cond_true52.us
	xorb	%al, %al
	leaq	.str610, %rdi
	movl	%r14d, %esi
	call	printf
	movq	srcGrid, %rdi
	call	LBM_showGridStatistics
	jmp	.LBB8_24	# bb61.us
	.size	main, .-main
	.type	.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str:				# .str
	.size	.str, 49
	.asciz	"LBM_allocateGrid: could not allocate %.1f MByte\n"
	.type	.str1,@object
.str1:				# .str1
	.size	.str1, 3
	.asciz	"rb"
	.type	.str2,@object
	.align	16
.str2:				# .str2
	.size	.str2, 138
	.asciz	"LBM_showGridStatistics:\n\tnObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\n\tminRho: %8.4f maxRho: %8.4f mass: %e\n\tminU: %e maxU: %e\n\n"
	.type	.str6,@object
	.align	16
.str6:				# .str6
	.size	.str6, 43
	.asciz	"LBM_compareVelocityField: maxDiff = %e  \n\n"
	.type	.str7,@object
.str7:				# .str7
	.size	.str7, 3
	.asciz	"wb"
	.type	actionString.2842,@object
	.section	.rodata
	.align	32
actionString.2842:				# actionString.2842
	.size	actionString.2842, 96
	.asciz	"nothing\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"compare\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"store\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.type	simTypeString.2843,@object
	.align	32
simTypeString.2843:				# simTypeString.2843
	.size	simTypeString.2843, 96
	.asciz	"lid-driven cavity\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.asciz	"channel flow\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.zero	32
	.type	.str4,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.str4:				# .str4
	.size	.str4, 7
	.asciz	"<none>"
	.type	.str15,@object
	.align	16
.str15:				# .str15
	.size	.str15, 174
	.asciz	"MAIN_printInfo:\n\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n\tnTimeSteps     : %i\n\tresult file    : %s\n\taction         : %s\n\tsimulation type: %s\n\tobstacle file  : %s\n\n"
	.type	srcGrid,@object
	.bss
	.local	srcGrid
	.comm	srcGrid,8,8		# srcGrid
	.type	dstGrid,@object
	.local	dstGrid
	.comm	dstGrid,8,8		# dstGrid
	.type	.str26,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str26:				# .str26
	.size	.str26, 108
	.asciz	"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]"
	.type	.str37,@object
	.align	16
.str37:				# .str37
	.size	.str37, 55
	.asciz	"MAIN_parseCommandLine: cannot stat obstacle file '%s'\n"
	.type	.str48,@object
	.align	16
.str48:				# .str48
	.size	.str48, 82
	.asciz	"MAIN_parseCommandLine:\n\tsize of file '%s' is %i bytes\n\texpected size is %i bytes\n"
	.type	.str59,@object
	.align	16
.str59:				# .str59
	.size	.str59, 53
	.asciz	"MAIN_parseCommandLine: cannot stat result file '%s'\n"
	.type	.str610,@object
.str610:				# .str610
	.size	.str610, 14
	.asciz	"timestep: %i\n"

