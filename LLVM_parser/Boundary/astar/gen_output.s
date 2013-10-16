

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
	.type	_ZN6wayobj9createwayEiiiiRP8point16tRi,@function
_ZN6wayobj9createwayEiiiiRP8point16tRi:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movl	%r14d, 24(%rsp)
	movl	%edx, %r15d
	movl	%ecx, 28(%rsp)
	movq	%r8, %r12
	movq	%r9, 32(%rsp)
	xorb	%al, %al
	movl	$2, %edi
	call	func_enter
	testl	%r14d, %r14d
	jle	.LBB2_55	# cond_true21
.LBB2_1:	# entry
	testl	%ebx, %ebx
	jle	.LBB2_55	# cond_true21
.LBB2_2:	# cond_next11.i
	cmpl	%ebx, way.5
	jl	.LBB2_55	# cond_true21
.LBB2_3:	# cond_next21.i
	movl	24(%rsp), %eax
	cmpl	%eax, way.6
	jl	.LBB2_55	# cond_true21
.LBB2_4:	# cond_next
	cmpl	$0, 28(%rsp)
	jle	.LBB2_55	# cond_true21
.LBB2_5:	# cond_next
	testl	%r15d, %r15d
	jle	.LBB2_55	# cond_true21
.LBB2_6:	# cond_next11.i15
	cmpl	%r15d, way.5
	jl	.LBB2_55	# cond_true21
.LBB2_7:	# cond_next21.i19
	movl	28(%rsp), %eax
	cmpl	%eax, way.6
	jl	.LBB2_55	# cond_true21
.LBB2_8:	# bb16
	movb	way.2, %cl
	movl	28(%rsp), %eax
	shll	%cl, %eax
	orl	%r15d, %eax
	movslq	%eax, %rax
	movq	way.16, %rcx
	cmpw	$0, (%rcx,%rax,2)
	jne	.LBB2_55	# cond_true21
.LBB2_9:	# cond_next55
	movl	24(%rsp), %eax
	cmpl	28(%rsp), %eax
	jne	.LBB2_13	# cond_next75
.LBB2_10:	# cond_next55
	cmpl	%r15d, %ebx
	jne	.LBB2_13	# cond_next75
.LBB2_11:	# cond_true69
	movl	$4, %edi
	call	malloc
	movq	%rax, (%r12)
	movq	32(%rsp), %r12
	movl	$1, (%r12)
	movl	$1, %eax
.LBB2_12:	# cond_true69
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB2_13:	# cond_next75
	movw	way.25, %ax
	movw	%ax, 22(%rsp)
	cmpw	$65535, %ax
	jne	.LBB2_15	# cond_next.i
.LBB2_14:	# cond_true.i
	movb	way.0, %cl
	movb	way.1, %al
	movq	way.17, %rdi
	movl	$1, %edx
	shll	%cl, %edx
	movb	%al, %cl
	shll	%cl, %edx
	movslq	%edx, %rdx
	shlq	$2, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$0, way.25
	movw	$0, 22(%rsp)
.LBB2_15:	# cond_next.i
	movw	22(%rsp), %ax
	incw	%ax
	movw	%ax, 22(%rsp)
	movw	%ax, way.25
	movl	way.2, %ecx
	movl	%ecx, 16(%rsp)
	movl	24(%rsp), %edx
	shll	%cl, %edx
	orl	%ebx, %edx
	movl	%edx, 24(%rsp)
	movq	way.18, %rbx
	movl	%edx, (%rbx)
	movslq	%edx, %rdx
	movq	way.17, %r14
	movw	%ax, (%r14,%rdx,4)
	movw	$0, 2(%r14,%rdx,4)
	movb	$0, way.22.b
	movl	28(%rsp), %eax
	shll	%cl, %eax
	orl	%r15d, %eax
	movl	%eax, 28(%rsp)
	movl	%eax, way.23
	movw	$1, way.24
	movq	way.19, %r15
	xorb	%r13b, %r13b
	movl	$32, %edi
	movb	%r13b, %al
	call	loop_enter
	xorw	%bp, %bp
	movl	$1, %eax
	jmp	.LBB2_19	# cond_next139.i
.LBB2_16:	# bb101.i
	testb	%r13b, %r13b
	je	.LBB2_56	# cond_true107.i
.LBB2_17:	# cond_false.i8
	movq	%r15, %rdi
	movq	%rbx, %rdx
	call	_ZN6wayobj10makebound2EPiiS0_
	xorb	%r13b, %r13b
.LBB2_18:	# bb133.i
	movw	%bp, %cx
	addw	$2, %cx
	movw	%cx, way.24
	incw	%bp
	testl	%eax, %eax
	je	.LBB2_20	# bb133.i._ZN6wayobj4fillEiiii.exit_crit_edge
.LBB2_19:	# cond_next139.i
	movl	%eax, %esi
	movb	way.22.b, %al
	xorb	$1, %al
	testb	$1, %al
	jne	.LBB2_16	# bb101.i
.LBB2_20:	# bb133.i._ZN6wayobj4fillEiiii.exit_crit_edge
	incw	%bp
.LBB2_21:	# _ZN6wayobj4fillEiiii.exit
	movb	way.22.b, %al
	testb	%al, %al
	je	.LBB2_57	# cond_true86
.LBB2_22:	# cond_next90
	movw	$65535, 40(%rsp)
	movw	$1, 42(%rsp)
	movw	$0, 44(%rsp)
	movw	$1, 46(%rsp)
	movw	$1, 48(%rsp)
	movw	$1, 50(%rsp)
	movw	$1, 52(%rsp)
	movw	$0, 54(%rsp)
	movw	$1, 56(%rsp)
	movw	$65535, 58(%rsp)
	movw	$0, 60(%rsp)
	movw	$65535, 62(%rsp)
	movw	$65535, 64(%rsp)
	movw	$65535, 66(%rsp)
	movw	$65535, 68(%rsp)
	movw	$0, 70(%rsp)
	movswl	%bp, %ebx
	movl	%ebx, 4(%rsp)
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, (%r12)
	movl	way.21, %r15d
	xorb	%al, %al
	movl	$33, %ecx
	movl	%ecx, %edi
	call	loop_enter
	movl	16(%rsp), %eax
	movb	%al, %cl
	movl	24(%rsp), %eax
	movl	%eax, %edx
	sarl	%cl, %edx
	movl	%edx, (%rsp)
	andl	%r15d, %eax
	leal	-2(%rbx), %ecx
	testl	%ecx, %ecx
	jle	.LBB2_54	# bb567.i
.LBB2_23:	# bb174.i.preheader
	movswl	%bp, %edx
	addl	$4294967294, %edx
	movl	%r15d, 12(%rsp)
	movl	16(%rsp), %ecx
	movl	%ecx, 8(%rsp)
	movl	28(%rsp), %esi
.LBB2_24:	# bb174.i
	movl	16(%rsp), %ecx
	movl	%esi, %edi
	sarl	%cl, %edi
	movl	(%rsp), %ecx
	subl	%edi, %ecx
	andl	%r15d, %esi
	movl	%eax, %r8d
	subl	%esi, %r8d
	testl	%r8d, %r8d
	jg	.LBB2_60	# bb174.i.cond_next215.i_crit_edge
.LBB2_25:	# cond_false.i
	testl	%r8d, %r8d
	jns	.LBB2_27	# cond_next215.i
.LBB2_26:	# cond_true214.i
	movl	$4294967295, %r8d
.LBB2_27:	# cond_next215.i
	testl	%ecx, %ecx
	jg	.LBB2_61	# cond_next215.i.cond_next228.i_crit_edge
.LBB2_28:	# cond_false221.i
	testl	%ecx, %ecx
	jns	.LBB2_30	# cond_next228.i
.LBB2_29:	# cond_true226.i
	movl	$4294967295, %ecx
.LBB2_30:	# cond_next228.i
	imull	$100, %ecx, %ecx
	imull	$4294967256, %r8d, %r9d
	cmpl	%r9d, %ecx
	movl	$4294967295, %r9d
	movl	$1, %r10d
	movl	%r10d, %r11d
	cmovl	%r9d, %r11d
	imull	$4294967056, %r8d, %ebx
	cmpl	%ebx, %ecx
	movl	%r10d, %ebx
	cmovl	%r9d, %ebx
	imull	$41, %r8d, %r13d
	cmpl	%r13d, %ecx
	movl	%r10d, %r13d
	cmovl	%r9d, %r13d
	imull	$241, %r8d, %r8d
	cmpl	%r8d, %ecx
	cmovl	%r9d, %r10d
	cmpl	$1, %r10d
	jne	.LBB2_32	# cond_next285.i
.LBB2_31:	# cond_next228.i
	cmpl	$1, %ebx
	je	.LBB2_62	# cond_next228.i.bb549.i_crit_edge
.LBB2_32:	# cond_next285.i
	cmpl	$1, %r13d
	jne	.LBB2_34	# cond_next298.i
.LBB2_33:	# cond_next285.i
	cmpl	$4294967295, %r10d
	je	.LBB2_63	# cond_next285.i.bb549.i_crit_edge
.LBB2_34:	# cond_next298.i
	cmpl	$1, %r11d
	jne	.LBB2_36	# cond_next311.i
.LBB2_35:	# cond_next298.i
	cmpl	$4294967295, %r13d
	je	.LBB2_64	# cond_next298.i.bb549.i_crit_edge
.LBB2_36:	# cond_next311.i
	cmpl	$1, %ebx
	jne	.LBB2_38	# cond_next324.i
.LBB2_37:	# cond_next311.i
	cmpl	$4294967295, %r11d
	je	.LBB2_65	# cond_next311.i.bb549.i_crit_edge
.LBB2_38:	# cond_next324.i
	cmpl	$4294967295, %r10d
	jne	.LBB2_40	# cond_next337.i
.LBB2_39:	# cond_next324.i
	cmpl	$4294967295, %ebx
	je	.LBB2_66	# cond_next324.i.bb549.i_crit_edge
.LBB2_40:	# cond_next337.i
	cmpl	$1, %r10d
	jne	.LBB2_42	# cond_next350.i
.LBB2_41:	# cond_next337.i
	cmpl	$4294967295, %r13d
	je	.LBB2_67	# cond_next337.i.bb549.i_crit_edge
.LBB2_42:	# cond_next350.i
	cmpl	$1, %r13d
	jne	.LBB2_44	# cond_next363.i
.LBB2_43:	# cond_next350.i
	cmpl	$4294967295, %r11d
	je	.LBB2_68	# cond_next350.i.bb549.i_crit_edge
.LBB2_44:	# cond_next363.i
	cmpl	$1, %r11d
	jne	.LBB2_46	# cond_next363.i.bb381.i_crit_edge
.LBB2_45:	# cond_next363.i
	cmpl	$4294967295, %ebx
	je	.LBB2_69	# cond_next363.i.bb549.i_crit_edge
.LBB2_46:	# cond_next363.i.bb381.i_crit_edge
	movl	$7, %r10d
	xorl	%r11d, %r11d
	movl	$6, %ebx
.LBB2_47:	# bb381.i
	movslq	%ebx, %r8
	movswl	42(%rsp,%r8,4), %r9d
	addl	%edi, %r9d
	movl	16(%rsp), %ecx
	movl	%r9d, %r13d
	shll	%cl, %r13d
	movswl	40(%rsp,%r8,4), %ecx
	addl	%esi, %ecx
	orl	%ecx, %r13d
	movslq	%r13d, %r8
	movw	22(%rsp), %bp
	cmpw	%bp, (%r14,%r8,4)
	jne	.LBB2_49	# cond_next458.i
.LBB2_48:	# cond_true427.i
	movzwl	2(%r14,%r8,4), %r8d
	cmpl	%edx, %r8d
	je	.LBB2_70	# cond_true439.i
.LBB2_49:	# cond_next458.i
	# ZERO-EXTEND 
	movl	%r10d, %r8d
	movswl	42(%rsp,%r8,4), %r9d
	addl	%edi, %r9d
	movl	16(%rsp), %r13d
	movb	%r13b, %cl
	movl	%r9d, %r13d
	shll	%cl, %r13d
	movswl	40(%rsp,%r8,4), %ecx
	addl	%esi, %ecx
	orl	%ecx, %r13d
	movslq	%r13d, %r8
	movw	22(%rsp), %bp
	cmpw	%bp, (%r14,%r8,4)
	jne	.LBB2_51	# cond_next535.i
.LBB2_50:	# cond_true504.i
	movzwl	2(%r14,%r8,4), %r8d
	cmpl	%edx, %r8d
	je	.LBB2_70	# cond_true439.i
.LBB2_51:	# cond_next535.i
	decl	%ebx
	testl	%ebx, %ebx
	movl	$7, %r13d
	cmovs	%r13d, %ebx
	incl	%r10d
	andl	$7, %r10d
	incl	%r11d
.LBB2_52:	# bb549.i
	cmpl	$3, %r11d
	jle	.LBB2_47	# bb381.i
.LBB2_53:	# bb554.i
	movq	(%r12), %rdi
	call	free
	movq	$0, (%r12)
	movq	32(%rsp), %r14
	movl	$0, (%r14)
	xorl	%edx, %edx
	movl	%edx, %eax
	jmp	.LBB2_12	# cond_true69
.LBB2_54:	# bb567.i
	movl	%r15d, %eax
	movl	24(%rsp), %edx
	andl	%edx, %eax
	movq	(%r12), %rsi
	movw	%ax, (%rsi)
	movl	16(%rsp), %eax
	movb	%al, %cl
	sarl	%cl, %edx
	movw	%dx, 2(%rsi)
	movl	28(%rsp), %eax
	andl	%eax, %r15d
	movl	4(%rsp), %edx
	movl	%edx, %esi
	decl	%esi
	movslq	%esi, %rsi
	movq	(%r12), %rdi
	movw	%r15w, (%rdi,%rsi,4)
	sarl	%cl, %eax
	movw	%ax, 2(%rdi,%rsi,4)
	movq	32(%rsp), %rax
	movl	%edx, (%rax)
	movl	$1, %eax
	jmp	.LBB2_59	# cond_true86
.LBB2_55:	# cond_true21
	movq	$0, (%r12)
	movq	32(%rsp), %r12
	movl	$0, (%r12)
	jmp	.LBB2_58	# cond_true86
.LBB2_56:	# cond_true107.i
	movq	%rbx, %rdi
	movq	%r15, %rdx
	call	_ZN6wayobj10makebound2EPiiS0_
	movb	$1, %r13b
	jmp	.LBB2_18	# bb133.i
.LBB2_57:	# cond_true86
	movq	$0, (%r12)
	movq	32(%rsp), %r14
	movl	$0, (%r14)
.LBB2_58:	# cond_true86
	xorl	%eax, %eax
.LBB2_59:	# cond_true86
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB2_60:	# bb174.i.cond_next215.i_crit_edge
	movl	$1, %r8d
	jmp	.LBB2_27	# cond_next215.i
.LBB2_61:	# cond_next215.i.cond_next228.i_crit_edge
	movl	$1, %ecx
	jmp	.LBB2_30	# cond_next228.i
.LBB2_62:	# cond_next228.i.bb549.i_crit_edge
	movl	$2, %r10d
	xorl	%r11d, %r11d
	movl	$1, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_63:	# cond_next285.i.bb549.i_crit_edge
	movl	$3, %r10d
	xorl	%r11d, %r11d
	movl	$2, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_64:	# cond_next298.i.bb549.i_crit_edge
	movl	$4, %r10d
	xorl	%r11d, %r11d
	movl	$3, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_65:	# cond_next311.i.bb549.i_crit_edge
	movl	$5, %r10d
	xorl	%r11d, %r11d
	movl	$4, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_66:	# cond_next324.i.bb549.i_crit_edge
	movl	$6, %r10d
	xorl	%r11d, %r11d
	movl	$5, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_67:	# cond_next337.i.bb549.i_crit_edge
	movl	$7, %r10d
	xorl	%r11d, %r11d
	movl	$6, %ebx
	jmp	.LBB2_52	# bb549.i
.LBB2_68:	# cond_next350.i.bb549.i_crit_edge
	xorl	%r10d, %r10d
	movl	$7, %ebx
	movl	%r10d, %r11d
	jmp	.LBB2_52	# bb549.i
.LBB2_69:	# cond_next363.i.bb549.i_crit_edge
	movl	$1, %r10d
	xorl	%ebx, %ebx
	movl	%ebx, %r11d
	jmp	.LBB2_52	# bb549.i
.LBB2_70:	# cond_true439.i
	movslq	%edx, %rsi
	movq	(%r12), %rdi
	movw	%cx, (%rdi,%rsi,4)
	movq	(%r12), %rcx
	movw	%r9w, 2(%rcx,%rsi,4)
.LBB2_71:	# bb562.i
	decl	%edx
	testl	%edx, %edx
	jle	.LBB2_54	# bb567.i
.LBB2_72:	# bb562.i.bb174.i_crit_edge
	movl	%r13d, %esi
	jmp	.LBB2_24	# bb174.i
	.size	_ZN6wayobj9createwayEiiiiRP8point16tRi, .-_ZN6wayobj9createwayEiiiiRP8point16tRi


	.align	16
	.type	_ZN6wayobj13findfreepointEiiRiS0_,@function
_ZN6wayobj13findfreepointEiiRiS0_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movq	%rdx, %r15
	movq	%rcx, (%rsp)
	xorb	%al, %al
	movl	$3, %edi
	call	func_enter
	testl	%r14d, %r14d
	jle	.LBB3_4	# cond_true49
.LBB3_1:	# entry
	testl	%ebx, %ebx
	jle	.LBB3_4	# cond_true49
.LBB3_2:	# cond_next21
	cmpl	%ebx, way.5
	jl	.LBB3_4	# cond_true49
.LBB3_3:	# cond_next31
	cmpl	%r14d, way.6
	jge	.LBB3_11	# cond_next41
.LBB3_4:	# cond_true49
	movl	%ebx, (%r15)
	movq	(%rsp), %r15
	movl	%r14d, (%r15)
	movl	$1, %eax
.LBB3_5:	# cond_true49
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB3_6:	# bb174
	testb	%r13b, %r13b
	je	.LBB3_15	# cond_true180
.LBB3_7:	# cond_false
	movq	%r14, %rdi
	movq	%rbx, %rdx
	call	_ZN6wayobj18makeobstaclebound2EPiiS0_
	xorb	%r13b, %r13b
.LBB3_8:	# bb206
	movw	%bp, way.24
	incw	%bp
	testl	%eax, %eax
	je	.LBB3_10	# bb220
.LBB3_9:	# cond_next212
	movl	%eax, %esi
	movb	way.22.b, %al
	xorb	$1, %al
	testb	$1, %al
	jne	.LBB3_6	# bb174
.LBB3_10:	# bb220
	movl	way.23, %eax
	movl	%eax, %ecx
	andl	way.21, %ecx
	movl	%ecx, (%r15)
	movb	%r12b, %cl
	sarl	%cl, %eax
	movq	(%rsp), %rcx
	movl	%eax, (%rcx)
	movzbl	way.22.b, %eax
	jmp	.LBB3_5	# cond_true49
.LBB3_11:	# cond_next41
	movb	way.2, %cl
	movl	%r14d, %eax
	shll	%cl, %eax
	orl	%ebx, %eax
	movslq	%eax, %rax
	movq	way.16, %rcx
	cmpw	$0, (%rcx,%rax,2)
	je	.LBB3_4	# cond_true49
.LBB3_12:	# cond_next89
	movw	way.25, %ax
	cmpw	$65535, %ax
	jne	.LBB3_14	# cond_next113
.LBB3_13:	# cond_true96
	movb	way.0, %cl
	movb	way.1, %al
	movq	way.17, %rdi
	movl	$1, %edx
	shll	%cl, %edx
	movb	%al, %cl
	shll	%cl, %edx
	movslq	%edx, %rdx
	shlq	$2, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$0, way.25
	xorw	%ax, %ax
.LBB3_14:	# cond_next113
	incw	%ax
	movw	%ax, way.25
	movl	way.2, %r12d
	movb	%r12b, %cl
	shll	%cl, %r14d
	orl	%ebx, %r14d
	movq	way.18, %rbx
	movl	%r14d, (%rbx)
	movslq	%r14d, %rcx
	movq	way.17, %rdx
	movw	%ax, (%rdx,%rcx,4)
	movw	$0, 2(%rdx,%rcx,4)
	movb	$0, way.22.b
	movw	$1, way.24
	movq	way.19, %r14
	xorb	%r13b, %r13b
	movl	$34, %edi
	movb	%r13b, %al
	call	loop_enter
	movw	$2, %bp
	movl	$1, %eax
	jmp	.LBB3_9	# cond_next212
.LBB3_15:	# cond_true180
	movq	%rbx, %rdi
	movq	%r14, %rdx
	call	_ZN6wayobj18makeobstaclebound2EPiiS0_
	movb	$1, %r13b
	jmp	.LBB3_8	# bb206
	.size	_ZN6wayobj13findfreepointEiiRiS0_, .-_ZN6wayobj13findfreepointEiiRiS0_


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI4_0:					#  float
	.long	1056964608	# float 0.5
	.text
	.align	16
	.type	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii,@function
_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movl	%edx, %r15d
	movl	%r15d, (%rsp)
	movl	%ecx, %r12d
	xorb	%al, %al
	movl	$4, %edi
	call	func_enter
	movl	80(%rbx), %eax
	imull	%r12d, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	72(%rbx), %rcx
	movzbq	(%rcx,%rax), %rcx
	movq	96(%rbx), %rdx
	cmpb	$0, 48(%rdx,%rcx)
	je	.LBB4_5	# cond_false
.LBB4_1:	# cond_true
	movl	(%rsp), %eax
	subl	48(%rbx), %eax
	imull	%eax, %eax
	movl	%r12d, %ecx
	subl	52(%rbx), %ecx
	imull	%ecx, %ecx
	addl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	addss	.LCPI4_0(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	cmpl	60(%rbx), %eax
	jg	.LBB4_6	# UnifiedReturnBlock
.LBB4_2:	# cond_true83
	movl	12(%r14), %r15d
	cmpl	%r15d, 8(%r14)
	jne	.LBB4_4	# cond_next147
.LBB4_3:	# cond_true102
	leal	(%r15,%r15), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r14), %rsi
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r14), %rdi
	call	free
	movq	%rbp, (%r14)
	movl	%r13d, 12(%r14)
.LBB4_4:	# cond_next147
	movslq	8(%r14), %rax
	movq	(%r14), %rcx
	movl	(%rsp), %edx
	movl	%edx, (%rcx,%rax,8)
	movl	%r12d, 4(%rcx,%rax,8)
	incl	8(%r14)
	movl	80(%rbx), %eax
	imull	%r12d, %eax
	addl	%edx, %eax
	movslq	%eax, %rax
	movq	64(%rbx), %rcx
	movq	40(%rbx), %rdx
	movq	%rdx, (%rcx,%rax,8)
	movq	40(%rbx), %rax
	incl	16(%rax)
	jmp	.LBB4_6	# UnifiedReturnBlock
.LBB4_5:	# cond_false
	movq	64(%rbx), %rcx
	movq	$0, (%rcx,%rax,8)
.LBB4_6:	# UnifiedReturnBlock
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii, .-_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii


	.align	16
	.type	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_,@function
_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r14, 16(%rsp)
	movq	%rdx, %r15
	xorb	%al, %al
	movl	$5, %edi
	call	func_enter
	movl	$0, 8(%r15)
	cmpl	$0, 8(%r14)
	jle	.LBB5_12	# return
.LBB5_1:	# bb.preheader
	xorb	%al, %al
	movl	$35, %edi
	call	loop_enter
	movl	$0, 12(%rsp)
.LBB5_2:	# bb
	movslq	12(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	(%rcx), %rcx
	movl	4(%rcx,%rax,8), %edx
	movl	%edx, %r14d
	decl	%r14d
	xorl	%esi, %esi
	testl	%r14d, %r14d
	cmovs	%esi, %r14d
	movl	(%rcx,%rax,8), %eax
	movl	%eax, 8(%rsp)
	movl	%eax, %r12d
	incl	%r12d
	movl	88(%rbx), %ecx
	cmpl	%r12d, %ecx
	cmovl	%ecx, %r12d
	decl	%eax
	testl	%eax, %eax
	cmovs	%esi, %eax
	movl	%eax, 4(%rsp)
	incl	%edx
	movl	92(%rbx), %r13d
	cmpl	%edx, %r13d
	jge	.LBB5_10	# bb157
.LBB5_3:	# cond_true104
	cmpl	%r13d, %r14d
	jg	.LBB5_11	# bb166
.LBB5_4:	# bb148.preheader
	xorb	%al, %al
	movl	$36, %edi
	call	loop_enter
	movl	4(%rsp), %edx
	cmpl	%r12d, %edx
	jg	.LBB5_9	# bb154
.LBB5_5:	# bb112.preheader
	movl	8(%rsp), %ebp
	decl	%ebp
	xorl	%edx, %edx
	testl	%ebp, %ebp
	cmovs	%edx, %ebp
.LBB5_6:	# bb112
	movl	80(%rbx), %edx
	imull	%r14d, %edx
	addl	%ebp, %edx
	movslq	%edx, %rax
	movq	64(%rbx), %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB5_8	# cond_next145
.LBB5_7:	# cond_true140
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	%ebp, %edx
	movl	%r14d, %ecx
	call	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii
.LBB5_8:	# cond_next145
	incl	%ebp
	cmpl	%r12d, %ebp
	jle	.LBB5_6	# bb112
.LBB5_9:	# bb154
	incl	%r14d
	movl	%r13d, %edx
.LBB5_10:	# bb157
	cmpl	%edx, %r14d
	jle	.LBB5_13	# bb157.bb148.preheader_crit_edge
.LBB5_11:	# bb166
	movl	12(%rsp), %eax
	incl	%eax
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	jg	.LBB5_2	# bb
.LBB5_12:	# return
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB5_13:	# bb157.bb148.preheader_crit_edge
	movl	%edx, %r13d
	jmp	.LBB5_4	# bb148.preheader
	.size	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_, .-_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_


	.align	16
	.type	_ZN11regboundobj4stepEv,@function
_ZN11regboundobj4stepEv:
	pushq	%rbx
	movq	%rdi, %rbx
	xorb	%al, %al
	movl	$6, %edi
	call	func_enter
	cmpl	$0, 36(%rbx)
	je	.LBB6_6	# UnifiedReturnBlock
.LBB6_1:	# cond_next
	cmpb	$0, 104(%rbx)
	je	.LBB6_6	# UnifiedReturnBlock
.LBB6_2:	# bb14
	cmpb	$0, 32(%rbx)
	jne	.LBB6_5	# cond_false
.LBB6_3:	# cond_true22
	leaq	16(%rbx), %rdx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	call	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_
	movl	24(%rbx), %ecx
	movl	%ecx, 36(%rbx)
	movb	$1, 32(%rbx)
.LBB6_4:	# cond_true22
	testl	%ecx, %ecx
	setne	%cl
	movzbl	%cl, %ecx
	movl	%ecx, %eax
	popq	%rbx
	ret
.LBB6_5:	# cond_false
	leaq	16(%rbx), %rsi
	movq	%rbx, %rdi
	movq	%rbx, %rdx
	call	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_
	movl	8(%rbx), %ecx
	movl	%ecx, 36(%rbx)
	movb	$0, 32(%rbx)
	jmp	.LBB6_4	# cond_true22
.LBB6_6:	# UnifiedReturnBlock
	xorl	%eax, %eax
	popq	%rbx
	ret
	.size	_ZN11regboundobj4stepEv, .-_ZN11regboundobj4stepEv


	.align	16
	.type	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj,@function
_ZN11regboundobj9firststepEiiP6regobjP9regmngobj:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movl	%esi, %r14d
	movl	%r14d, 4(%rsp)
	movl	%edx, %r15d
	movq	%rcx, %r12
	xorb	%al, %al
	movl	$7, %edi
	call	func_enter
	movl	%r14d, 48(%rbx)
	movl	%r15d, 52(%rbx)
	movq	%r12, 40(%rbx)
	movq	$regmng, 96(%rbx)
	movq	regmng+32, %rax
	movq	%rax, 64(%rbx)
	movq	regmng+40, %rax
	movq	%rax, 72(%rbx)
	movl	regmng+332, %eax
	movl	%eax, 80(%rbx)
	movl	regmng+336, %eax
	movl	%eax, 84(%rbx)
	movl	regmng+316, %eax
	movl	%eax, 88(%rbx)
	movl	regmng+320, %eax
	movl	%eax, 92(%rbx)
	movq	96(%rbx), %rax
	movl	304(%rax), %eax
	movl	%eax, 56(%rbx)
	imull	%eax, %eax
	movl	%eax, 60(%rbx)
	cmpb	$0, 104(%rbx)
	jne	.LBB7_3	# cond_next
.LBB7_1:	# cond_true
	movl	$0, 36(%rbx)
.LBB7_2:	# cond_true
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB7_3:	# cond_next
	movl	$0, 16(%r12)
	movl	$128, 12(%rbx)
	movl	$0, 8(%rbx)
	movl	$1024, %r14d
	movq	%r14, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movl	$128, 28(%rbx)
	movl	$0, 24(%rbx)
	movq	%r14, %rdi
	call	malloc
	movq	%rax, 16(%rbx)
	movl	%r15d, %r14d
	decl	%r14d
	xorl	%eax, %eax
	testl	%r14d, %r14d
	cmovs	%eax, %r14d
	movl	4(%rsp), %ecx
	movl	%ecx, %r12d
	decl	%r12d
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
	movl	%ecx, %r13d
	incl	%r13d
	movl	88(%rbx), %eax
	cmpl	%r13d, %eax
	cmovl	%eax, %r13d
	movl	92(%rbx), %ebp
	incl	%r15d
	cmpl	%r15d, %ebp
	jge	.LBB7_11	# bb228
.LBB7_4:	# cond_true174
	cmpl	%ebp, %r14d
	jg	.LBB7_13	# bb234
.LBB7_5:	# bb219.preheader
	cmpl	%r13d, %r12d
	jg	.LBB7_10	# bb225
.LBB7_6:	# bb.nph
	xorb	%al, %al
	movl	$37, %edi
	call	loop_enter
	movl	4(%rsp), %r15d
	decl	%r15d
	xorl	%eax, %eax
	testl	%r15d, %r15d
	cmovs	%eax, %r15d
.LBB7_7:	# bb182
	movl	80(%rbx), %eax
	imull	%r14d, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	64(%rbx), %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB7_9	# cond_next216
.LBB7_8:	# cond_true210
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movl	%r15d, %edx
	movl	%r14d, %ecx
	call	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii
.LBB7_9:	# cond_next216
	incl	%r15d
	cmpl	%r13d, %r15d
	jle	.LBB7_7	# bb182
.LBB7_10:	# bb225
	incl	%r14d
	movl	%ebp, %r15d
.LBB7_11:	# bb228
	cmpl	%r15d, %r14d
	jg	.LBB7_13	# bb234
.LBB7_12:	# bb228.bb219.preheader_crit_edge
	movl	%r15d, %ebp
	jmp	.LBB7_5	# bb219.preheader
.LBB7_13:	# bb234
	movb	$0, 32(%rbx)
	movl	8(%rbx), %eax
	movl	%eax, 36(%rbx)
	jmp	.LBB7_2	# cond_true
	.size	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj, .-_ZN11regboundobj9firststepEiiP6regobjP9regmngobj


	.align	16
	.type	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_,@function
_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %rbx
	movq	%rbx, 32(%rsp)
	movq	%rsi, %r14
	movq	%r14, 8(%rsp)
	xorb	%al, %al
	movl	$8, %edi
	call	func_enter
	movl	$0, 8(%r14)
	cmpl	$0, 8(%rbx)
	jle	.LBB8_13	# return
.LBB8_1:	# bb.preheader
	xorb	%al, %al
	movl	$39, %edi
	call	loop_enter
	movl	$0, 28(%rsp)
.LBB8_2:	# bb
	movslq	28(%rsp), %rax
	movq	32(%rsp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,8), %edx
	movl	%edx, %esi
	incl	%esi
	movl	regmng+316, %edi
	cmpl	%esi, %edi
	cmovl	%edi, %esi
	movl	%esi, 4(%rsp)
	movl	4(%rcx,%rax,8), %eax
	movl	%eax, %ebx
	decl	%ebx
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	cmovs	%ecx, %ebx
	decl	%edx
	testl	%edx, %edx
	cmovs	%ecx, %edx
	movl	%edx, 24(%rsp)
	incl	%eax
	movl	regmng+320, %ecx
	movl	%ecx, 20(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB8_11	# bb319
.LBB8_3:	# cond_true104
	cmpl	20(%rsp), %ebx
	jg	.LBB8_12	# bb328
.LBB8_4:	# bb310.preheader
	xorb	%al, %al
	movl	$40, %edi
	call	loop_enter
	movl	24(%rsp), %r14d
	jmp	.LBB8_20	# bb310
.LBB8_5:	# bb112
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	je	.LBB8_19	# cond_next307
.LBB8_6:	# cond_true132
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	movb	regmng+48(%rax), %al
	testb	%al, %al
	je	.LBB8_15	# cond_true197
.LBB8_7:	# cond_true174
	cmpb	$0, regmng+20
	jne	.LBB8_14	# cond_next192
.LBB8_8:	# cond_true182
	movl	%r14d, regmng+12
	movl	%ebx, regmng+16
	movb	$1, regmng+20
	incl	%r14d
.LBB8_9:	# cond_true182
	cmpl	4(%rsp), %r14d
	jle	.LBB8_5	# bb112
.LBB8_10:	# bb316
	incl	%ebx
	movl	20(%rsp), %eax
.LBB8_11:	# bb319
	cmpl	%eax, %ebx
	jle	.LBB8_21	# bb319.bb310.preheader_crit_edge
.LBB8_12:	# bb328
	movl	28(%rsp), %eax
	incl	%eax
	movl	%eax, 28(%rsp)
	movq	32(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	jg	.LBB8_2	# bb
.LBB8_13:	# return
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB8_14:	# cond_next192
	testb	%al, %al
	jne	.LBB8_18	# cond_next290
.LBB8_15:	# cond_true197
	movq	8(%rsp), %rax
	movl	12(%rax), %r15d
	cmpl	%r15d, 8(%rax)
	jne	.LBB8_17	# cond_next262
.LBB8_16:	# cond_true216
	leal	(%r15,%r15), %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movq	8(%rsp), %rbp
	movq	(%rbp), %rsi
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	call	memcpy
	movq	(%rbp), %rdi
	call	free
	movq	%r13, (%rbp)
	movl	%r12d, 12(%rbp)
.LBB8_17:	# cond_next262
	movq	8(%rsp), %rax
	movslq	8(%rax), %rcx
	movq	(%rax), %rdx
	movl	%r14d, (%rdx,%rcx,8)
	movl	%ebx, 4(%rdx,%rcx,8)
	incl	8(%rax)
.LBB8_18:	# cond_next290
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	movw	%cx, (%rdx,%rax,2)
.LBB8_19:	# cond_next307
	incl	%r14d
.LBB8_20:	# bb310
	xorb	%al, %al
	movl	$38, %edi
	call	loop_enter
	jmp	.LBB8_9	# cond_true182
.LBB8_21:	# bb319.bb310.preheader_crit_edge
	movl	%eax, 20(%rsp)
	jmp	.LBB8_4	# bb310.preheader
	.size	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_, .-_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_


	.align	16
	.type	_ZN9regmngobj13findfreeplaceEiiRiS0_,@function
_ZN9regmngobj13findfreeplaceEiiRiS0_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	xorb	%al, %al
	movl	$9, %edi
	call	func_enter
	movb	$0, regmng+20
	movw	$1, %ax
	addw	regmng+8, %ax
	movw	%ax, regmng+8
	cmpw	$65535, %ax
	jne	.LBB9_2	# cond_next
.LBB9_1:	# cond_true
	movl	regmng+332, %eax
	movl	regmng+336, %ecx
	movq	regmng, %rdi
	imull	%eax, %ecx
	movslq	%ecx, %rdx
	addq	%rdx, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$1, regmng+8
.LBB9_2:	# cond_next
	movq	8(%rsp), %rax
	movl	$4294967295, (%rax)
	movq	16(%rsp), %rax
	movl	$4294967295, (%rax)
	movl	$4294967295, regmng+12
	movl	$4294967295, regmng+16
	movl	$128, 52(%rsp)
	movl	$0, 48(%rsp)
	movl	$1024, %r15d
	movq	%r15, %rdi
	call	malloc
	movq	%rax, %r12
	movq	%r12, 40(%rsp)
	movl	$128, 36(%rsp)
	movl	$0, 32(%rsp)
	movq	%r15, %rdi
	call	malloc
	movq	%rax, 24(%rsp)
	testl	%r14d, %r14d
	js	.LBB9_12	# cond_next285
.LBB9_3:	# cond_next
	testl	%ebx, %ebx
	js	.LBB9_12	# cond_next285
.LBB9_4:	# cond_true86
	cmpl	%ebx, regmng+316
	jl	.LBB9_12	# cond_next285
.LBB9_5:	# cond_true94
	cmpl	%r14d, regmng+320
	jl	.LBB9_12	# cond_next285
.LBB9_6:	# cond_true102
	movl	regmng+332, %eax
	imull	%r14d, %eax
	addl	%ebx, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	je	.LBB9_12	# cond_next285
.LBB9_7:	# cond_true122
	movq	regmng+40, %rsi
	movzbq	(%rsi,%rax), %rsi
	movb	regmng+48(%rsi), %sil
	testb	%sil, %sil
	je	.LBB9_10	# cond_next241
.LBB9_8:	# cond_true163
	cmpb	$0, regmng+20
	je	.LBB9_38	# cond_true171
.LBB9_9:	# cond_next181
	testb	%sil, %sil
	jne	.LBB9_11	# cond_next265
.LBB9_10:	# cond_next241
	movl	%ebx, (%r12)
	movl	%r14d, 4(%r12)
	movl	$1, 48(%rsp)
.LBB9_11:	# cond_next265
	movw	%cx, (%rdx,%rax,2)
.LBB9_12:	# cond_next285
	movl	%r14d, %r15d
	decl	%r15d
	xorl	%eax, %eax
	testl	%r15d, %r15d
	cmovs	%eax, %r15d
	movl	%ebx, %ecx
	decl	%ecx
	testl	%ecx, %ecx
	cmovs	%eax, %ecx
	movl	%ecx, 4(%rsp)
	incl	%ebx
	movl	regmng+316, %eax
	cmpl	%ebx, %eax
	cmovl	%eax, %ebx
	incl	%r14d
	movl	regmng+320, %eax
	movl	%eax, (%rsp)
	cmpl	%r14d, %eax
	jge	.LBB9_21	# bb533
.LBB9_13:	# cond_true325
	cmpl	(%rsp), %r15d
	jg	.LBB9_22	# bb539
.LBB9_14:	# bb524.preheader
	xorb	%al, %al
	movl	$43, %edi
	call	loop_enter
	movl	4(%rsp), %r14d
	jmp	.LBB9_30	# bb524
.LBB9_15:	# bb333
	movl	regmng+332, %eax
	imull	%r15d, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	je	.LBB9_29	# cond_next521
.LBB9_16:	# cond_true353
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	movb	regmng+48(%rax), %al
	testb	%al, %al
	je	.LBB9_25	# cond_true418
.LBB9_17:	# cond_true395
	cmpb	$0, regmng+20
	jne	.LBB9_24	# cond_next413
.LBB9_18:	# cond_true403
	movl	%r14d, regmng+12
	movl	%r15d, regmng+16
	movb	$1, regmng+20
	incl	%r14d
.LBB9_19:	# cond_true403
	cmpl	%ebx, %r14d
	jle	.LBB9_15	# bb333
.LBB9_20:	# bb530
	incl	%r15d
	movl	(%rsp), %r14d
.LBB9_21:	# bb533
	cmpl	%r14d, %r15d
	jle	.LBB9_39	# bb533.bb524.preheader_crit_edge
.LBB9_22:	# bb539
	movl	48(%rsp), %ebx
	xorb	%al, %al
	movl	$41, %edi
	call	loop_enter
	cmpl	$0, %ebx
	je	.LBB9_37	# bb571
.LBB9_23:	# bb539.cond_next563_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB9_35	# cond_false.cond_next563_crit_edge
.LBB9_24:	# cond_next413
	testb	%al, %al
	jne	.LBB9_28	# cond_next504
.LBB9_25:	# cond_true418
	movl	52(%rsp), %r12d
	cmpl	%r12d, 48(%rsp)
	jne	.LBB9_27	# cond_next480
.LBB9_26:	# cond_true436
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	40(%rsp), %rsi
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	40(%rsp), %rdi
	call	free
	movq	%rbp, 40(%rsp)
	movl	%r13d, 52(%rsp)
.LBB9_27:	# cond_next480
	movslq	48(%rsp), %rax
	movq	40(%rsp), %rcx
	movl	%r14d, (%rcx,%rax,8)
	movl	%r15d, 4(%rcx,%rax,8)
	incl	48(%rsp)
.LBB9_28:	# cond_next504
	movl	regmng+332, %eax
	imull	%r15d, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	movw	%cx, (%rdx,%rax,2)
.LBB9_29:	# cond_next521
	incl	%r14d
.LBB9_30:	# bb524
	xorb	%al, %al
	movl	$42, %edi
	call	loop_enter
	jmp	.LBB9_19	# cond_true403
.LBB9_31:	# bb542
	xorb	$1, %al
	testb	$1, %al
	jne	.LBB9_34	# cond_false
.LBB9_32:	# cond_true548
	leaq	24(%rsp), %rsi
	leaq	40(%rsp), %rdi
	call	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, 32(%rsp)
	je	.LBB9_37	# bb571
.LBB9_33:	# cond_true548.cond_next563_crit_edge
	xorb	%al, %al
	jmp	.LBB9_36	# cond_next563
.LBB9_34:	# cond_false
	leaq	40(%rsp), %rsi
	leaq	24(%rsp), %rdi
	call	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, 48(%rsp)
	je	.LBB9_37	# bb571
.LBB9_35:	# cond_false.cond_next563_crit_edge
	movb	$1, %al
.LBB9_36:	# cond_next563
	incq	%rbx
	cmpb	$0, regmng+20
	je	.LBB9_31	# bb542
.LBB9_37:	# bb571
	movq	40(%rsp), %rdi
	call	free
	movq	24(%rsp), %rdi
	call	free
	movl	regmng+12, %ecx
	movq	8(%rsp), %rdx
	movl	%ecx, (%rdx)
	movl	regmng+16, %ecx
	movq	16(%rsp), %rdx
	movl	%ecx, (%rdx)
	movzbl	regmng+20, %ecx
	movl	%ecx, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB9_38:	# cond_true171
	movl	%ebx, regmng+12
	movl	%r14d, regmng+16
	movb	$1, regmng+20
	jmp	.LBB9_12	# cond_next285
.LBB9_39:	# bb533.bb524.preheader_crit_edge
	movl	%r14d, (%rsp)
	jmp	.LBB9_14	# bb524.preheader
	.size	_ZN9regmngobj13findfreeplaceEiiRiS0_, .-_ZN9regmngobj13findfreeplaceEiiRiS0_


	.align	16
	.type	_ZN9regmngobj6createEv,@function
_ZN9regmngobj6createEv:
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	xorb	%bl, %bl
	movl	$10, %edi
	movb	%bl, %al
	call	func_enter
	movl	$16, regmng+404
	movl	$0, regmng+400
	movl	$128, %edi
	call	malloc
	movq	%rax, regmng+344
	movl	$16, regmng+380
	movl	$0, regmng+376
	movl	$64, %r14d
	movq	%r14, %rdi
	call	malloc
	movq	%rax, regmng+368
	movl	$16, regmng+396
	movl	$0, regmng+392
	movq	%r14, %rdi
	call	malloc
	movq	%rax, regmng+384
	movl	$16, regmng+364
	movl	$0, regmng+360
	movq	%r14, %rdi
	call	malloc
	movq	%rax, regmng+352
	movl	$44, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	xorl	%ebx, %ebx
	movl	%ebx, %eax
.LBB10_1:	# bb94.i
	movl	regmng+364, %r14d
	cmpl	%r14d, %eax
	jne	.LBB10_3	# cond_next.i
.LBB10_2:	# cond_true.i
	leal	(%r14,%r14), %r15d
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %r12
	movq	regmng+352, %rsi
	movslq	%r14d, %rdx
	shlq	$2, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%r12, regmng+352
	movl	%r15d, regmng+364
.LBB10_3:	# cond_next.i
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%ebx, (%rcx,%rax,4)
	movl	$1, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	incl	%ebx
	cmpl	%ebx, regmng+404
	jg	.LBB10_1	# bb94.i
.LBB10_4:	# _ZN15largesolidarrayIP6regobjE6createEi.exit
	movq	$0, regmng+32
	movq	$0, regmng+40
	movq	$0, regmng
	movl	$0, regmng+24
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
	.size	_ZN9regmngobj6createEv, .-_ZN9regmngobj6createEv


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI11_0:					#  float
	.long	1056964608	# float 0.5
	.text
	.align	16
	.type	_ZN9regmngobj20definemiddleregpointEv,@function
_ZN9regmngobj20definemiddleregpointEv:
	pushq	%r14
	pushq	%rbx
	subq	$24, %rsp
	xorb	%bl, %bl
	movl	$11, %edi
	movb	%bl, %al
	call	func_enter
	movl	regmng+400, %r14d
	movl	$47, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	cmpl	$0, %r14d
	jle	.LBB11_3	# bb112
.LBB11_1:	# entry.bb_crit_edge
	xorl	%eax, %eax
.LBB11_2:	# bb
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rdx
	movl	$0, 20(%rdx)
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movl	$0, 24(%rcx)
	incl	%eax
	cmpl	%eax, regmng+400
	jg	.LBB11_2	# bb
.LBB11_3:	# bb112
	movl	regmng+320, %ebx
	xorb	%al, %al
	movl	$45, %edi
	call	loop_enter
	cmpl	$0, %ebx
	js	.LBB11_11	# bb192.preheader
.LBB11_4:	# bb112.bb101.outer_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB11_9	# bb101.outer
.LBB11_5:	# bb53
	movl	regmng+332, %ecx
	imull	%ebx, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	movq	regmng+32, %rdx
	movq	(%rdx,%rcx,8), %rcx
	testq	%rcx, %rcx
	je	.LBB11_7	# cond_next
.LBB11_6:	# cond_true
	addl	%eax, 20(%rcx)
	addl	%ebx, 24(%rcx)
.LBB11_7:	# cond_next
	incl	%eax
	cmpl	%eax, regmng+316
	jge	.LBB11_5	# bb53
.LBB11_8:	# bb109
	incl	%ebx
	cmpl	%ebx, regmng+320
	jl	.LBB11_11	# bb192.preheader
.LBB11_9:	# bb101.outer
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$48, %edi
	call	loop_enter
	cmpl	$0, %r14d
	js	.LBB11_8	# bb109
.LBB11_10:	# bb101.outer.bb53_crit_edge
	xorl	%eax, %eax
	jmp	.LBB11_5	# bb53
.LBB11_11:	# bb192.preheader
	movl	regmng+400, %ebx
	xorb	%al, %al
	movl	$46, %edi
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB11_16	# return
.LBB11_12:	# bb192.preheader.bb121_crit_edge
	xorl	%eax, %eax
.LBB11_13:	# bb121
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movl	16(%rcx), %edx
	testl	%edx, %edx
	jle	.LBB11_15	# cond_next189
.LBB11_14:	# cond_true144
	cvtsi2sd	%edx, %xmm0
	cvtsi2sd	20(%rcx), %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	.LCPI11_0(%rip), %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %edx
	movl	%edx, 20(%rcx)
	cvtsi2sd	24(%rcx), %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edx
	movl	%edx, 24(%rcx)
.LBB11_15:	# cond_next189
	incl	%eax
	cmpl	%eax, regmng+400
	jg	.LBB11_13	# bb121
.LBB11_16:	# return
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	ret
	.size	_ZN9regmngobj20definemiddleregpointEv, .-_ZN9regmngobj20definemiddleregpointEv


	.align	16
	.type	_ZN9regmngobj7destroyEv,@function
_ZN9regmngobj7destroyEv:
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
	xorb	%bl, %bl
	movl	$12, %edi
	movb	%bl, %al
	call	func_enter
	movl	regmng+400, %r14d
	movl	$49, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	cmpl	$0, %r14d
	jle	.LBB12_3	# bb46
.LBB12_1:	# entry.bb_crit_edge
	xorl	%ebx, %ebx
.LBB12_2:	# bb
	movslq	%ebx, %r14
	movq	regmng+344, %rax
	movq	(%rax,%r14,8), %rax
	movq	40(%rax), %rdi
	call	free
	movq	regmng+344, %rax
	movq	(%rax,%r14,8), %rdi
	call	_ZdlPv
	incl	%ebx
	cmpl	%ebx, regmng+400
	jg	.LBB12_2	# bb
.LBB12_3:	# bb46
	movq	regmng+384, %rdi
	call	free
	movq	regmng+368, %rdi
	call	free
	movq	regmng+352, %rdi
	call	free
	movq	regmng+344, %rdi
	call	free
	movq	regmng+32, %rdi
	call	free
	movq	$0, regmng+32
	movq	regmng+40, %rdi
	call	free
	movq	$0, regmng+40
	movq	regmng, %rdi
	call	free
	movq	$0, regmng
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
	.size	_ZN9regmngobj7destroyEv, .-_ZN9regmngobj7destroyEv


	.align	16
	.type	_ZN9regmngobj15redefineregionsEv,@function
_ZN9regmngobj15redefineregionsEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	xorb	%bl, %bl
	movl	$13, %edi
	movb	%bl, %al
	call	func_enter
	movl	$1792, %edi
	call	malloc
	movq	%rax, %r14
	movl	regmng+400, %r15d
	movl	$51, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	cmpl	$0, %r15d
	jle	.LBB13_15	# entry.bb199.preheader_crit_edge
.LBB13_1:	# entry.bb24_crit_edge
	xorl	%eax, %eax
	movl	$16, %r15d
	movl	%eax, %ebx
.LBB13_2:	# bb24
	movslq	%eax, %r12
	movq	regmng+344, %rax
	movq	(%rax,%r12,8), %rax
	cmpb	$0, 5(%rax)
	je	.LBB13_6	# bb166
.LBB13_3:	# cond_true
	cmpl	%r15d, %ebx
	jne	.LBB13_5	# cond_next90
.LBB13_4:	# cond_true51
	leal	(%r15,%r15), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %eax
	imulq	$112, %rax, %rdi
	call	malloc
	movq	%rax, %rbp
	movslq	%r15d, %rax
	imulq	$112, %rax, %rdx
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	memcpy
	movq	%r14, %rdi
	call	free
	movl	%r13d, %r15d
	movq	%rbp, %r14
.LBB13_5:	# cond_next90
	incl	%ebx
	movslq	%ebx, %rax
	imulq	$112, %rax, %rax
	movb	$1, -8(%rax,%r14)
	movq	regmng+344, %rcx
	movq	(%rcx,%r12,8), %rcx
	movl	20(%rcx), %esi
	movl	24(%rcx), %edx
	leaq	-112(%rax,%r14), %rdi
	call	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj
.LBB13_6:	# bb166
	movl	%r12d, %eax
	incl	%eax
	cmpl	%eax, regmng+400
	jg	.LBB13_2	# bb24
.LBB13_7:	# bb199.preheader
	xorb	%al, %al
	movl	$50, %edi
	call	loop_enter
	movb	$1, %r15b
	xorl	%r12d, %r12d
.LBB13_8:	# bb199.preheader
	xorl	%r13d, %r13d
.LBB13_9:	# bb199
	incq	%r12
	cmpl	%r13d, %ebx
	jg	.LBB13_16	# bb177
.LBB13_10:	# bb206
	testb	%r15b, %r15b
	je	.LBB13_17	# bb206.bb199_crit_edge
.LBB13_11:	# bb227.loopexit
	xorb	%al, %al
	movl	$52, %edi
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB13_14	# bb234
.LBB13_12:	# bb227.loopexit.bb213_crit_edge
	xorl	%r15d, %r15d
.LBB13_13:	# bb213
	movslq	%r15d, %rax
	imulq	$112, %rax, %r12
	movq	(%r14,%r12), %rdi
	call	free
	movq	16(%r14,%r12), %rdi
	call	free
	incl	%r15d
	cmpl	%r15d, %ebx
	jg	.LBB13_13	# bb213
.LBB13_14:	# bb234
	movq	%r14, %rdi
	call	free
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB13_15:	# entry.bb199.preheader_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB13_7	# bb199.preheader
.LBB13_16:	# bb177
	movslq	%r13d, %rax
	imulq	$112, %rax, %rdi
	addq	%r14, %rdi
	call	_ZN11regboundobj4stepEv
	xorw	%cx, %cx
	cmpb	$1, %al
	movb	%r15b, %al
	cmove	%cx, %ax
	incl	%r13d
	movb	%al, %r15b
	jmp	.LBB13_9	# bb199
.LBB13_17:	# bb206.bb199_crit_edge
	movb	$1, %r15b
	jmp	.LBB13_8	# bb199.preheader
	.size	_ZN9regmngobj15redefineregionsEv, .-_ZN9regmngobj15redefineregionsEv


	.align	16
	.type	_ZN9regmngobj13deleteregionsEv,@function
_ZN9regmngobj13deleteregionsEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	xorb	%bl, %bl
	movl	$14, %edi
	movb	%bl, %al
	call	func_enter
	movl	$128, %edi
	call	malloc
	movq	%rax, %r14
	movl	regmng+400, %r15d
	movl	$53, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	cmpl	$0, %r15d
	jle	.LBB14_13	# entry.bb318.preheader_crit_edge
.LBB14_1:	# entry.bb23_crit_edge
	xorl	%eax, %eax
	movl	$16, %ebx
	movl	%eax, 4(%rsp)
.LBB14_2:	# bb23
	movslq	%eax, %r15
	movq	regmng+344, %r12
	movq	(%r12,%r15,8), %rax
	cmpb	$0, 4(%rax)
	jne	.LBB14_6	# bb122
.LBB14_3:	# cond_true
	movl	4(%rsp), %eax
	cmpl	%ebx, %eax
	jne	.LBB14_5	# cond_next106
.LBB14_4:	# cond_true67
	leal	(%rbx,%rbx), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movslq	%ebx, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	movq	%r14, %rsi
	call	memcpy
	movq	%r14, %rdi
	call	free
	movl	%r13d, %ebx
	movq	%rbp, %r14
.LBB14_5:	# cond_next106
	movq	(%r12,%r15,8), %rax
	movl	4(%rsp), %ecx
	movslq	%ecx, %rdx
	movq	%rax, (%r14,%rdx,8)
	incl	%ecx
	movl	%ecx, 4(%rsp)
.LBB14_6:	# bb122
	movl	%r15d, %eax
	incl	%eax
	cmpl	%eax, regmng+400
	jg	.LBB14_2	# bb23
	jmp	.LBB14_14	# bb318.preheader
.LBB14_7:	# bb132
	movslq	%eax, %rbx
	movq	(%r14,%rbx,8), %rax
	movl	(%rax), %r15d
	movslq	%r15d, %rax
	movq	regmng+368, %rcx
	movl	(%rcx,%rax,4), %eax
	movl	$4294967295, %ecx
	addl	regmng+400, %ecx
	cmpl	%eax, %ecx
	je	.LBB14_9	# cond_next219
.LBB14_8:	# cond_true166
	movslq	%ecx, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movslq	%eax, %rsi
	movq	%rcx, (%rdx,%rsi,8)
	movl	$4294967295, %ecx
	movl	%ecx, %edx
	addl	regmng+400, %edx
	movslq	%edx, %rdx
	movq	regmng+384, %rdi
	movslq	(%rdi,%rdx,4), %rdx
	movq	regmng+368, %rdi
	movl	%eax, (%rdi,%rdx,4)
	addl	regmng+400, %ecx
	movslq	%ecx, %rax
	movq	regmng+384, %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, (%rcx,%rsi,4)
.LBB14_9:	# cond_next219
	movl	regmng+364, %r12d
	cmpl	%r12d, regmng+360
	jne	.LBB14_11	# cond_next268
.LBB14_10:	# cond_true233
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	regmng+352, %rsi
	movslq	%r12d, %rdx
	shlq	$2, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%rbp, regmng+352
	movl	%r13d, regmng+364
.LBB14_11:	# cond_next268
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%r15d, (%rcx,%rax,4)
	incl	regmng+360
	decl	regmng+400
	movq	(%r14,%rbx,8), %rax
	movq	40(%rax), %rdi
	call	free
	movq	(%r14,%rbx,8), %rdi
	call	_ZdlPv
	movl	%ebx, %eax
	incl	%eax
	movl	4(%rsp), %ecx
	cmpl	%eax, %ecx
	jg	.LBB14_7	# bb132
.LBB14_12:	# bb325
	movq	%r14, %rdi
	call	free
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB14_13:	# entry.bb318.preheader_crit_edge
	movl	$0, 4(%rsp)
.LBB14_14:	# bb318.preheader
	xorb	%al, %al
	movl	$54, %edi
	call	loop_enter
	cmpl	$0, 4(%rsp)
	jle	.LBB14_12	# bb325
.LBB14_15:	# bb318.preheader.bb132_crit_edge
	xorl	%eax, %eax
	jmp	.LBB14_7	# bb132
	.size	_ZN9regmngobj13deleteregionsEv, .-_ZN9regmngobj13deleteregionsEv


	.align	16
	.type	_ZN9regmngobj18enlargeneighborsesEi,@function
_ZN9regmngobj18enlargeneighborsesEi:
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movl	%edi, %ebx
	xorb	%r14b, %r14b
	movl	$15, %edi
	movb	%r14b, %al
	call	func_enter
	movl	regmng+400, %r15d
	movl	$55, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	testl	%r15d, %r15d
	jle	.LBB15_3	# bb142
.LBB15_1:	# entry.bb_crit_edge
	xorl	%eax, %eax
.LBB15_2:	# bb
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movb	$0, 5(%rcx)
	incl	%eax
	movl	regmng+400, %r15d
	cmpl	%eax, %r15d
	jg	.LBB15_2	# bb
.LBB15_3:	# bb142
	xorb	%al, %al
	movl	$56, %edi
	call	loop_enter
	testl	%r15d, %r15d
	jle	.LBB15_10	# bb219
.LBB15_4:	# bb142.bb38_crit_edge
	xorl	%eax, %eax
.LBB15_5:	# bb38
	movslq	%eax, %r14
	movq	regmng+344, %rax
	movq	(%rax,%r14,8), %rax
	cmpl	%ebx, 16(%rax)
	jge	.LBB15_9	# cond_next
.LBB15_6:	# cond_true
	movb	$0, 4(%rax)
	movq	regmng+344, %r15
	movq	(%r15,%r14,8), %rax
	movl	48(%rax), %r12d
	xorb	%al, %al
	movl	$57, %edi
	call	loop_enter
	cmpl	$0, %r12d
	jle	.LBB15_9	# cond_next
.LBB15_7:	# cond_true.bb79_crit_edge
	xorl	%eax, %eax
.LBB15_8:	# bb79
	movq	(%r15,%r14,8), %r15
	movq	40(%r15), %r15
	movslq	%eax, %rcx
	movq	(%r15,%rcx,8), %r15
	movb	$1, 5(%r15)
	movq	regmng+344, %r15
	movq	(%r15,%r14,8), %rcx
	incl	%eax
	cmpl	%eax, 48(%rcx)
	jg	.LBB15_8	# bb79
.LBB15_9:	# cond_next
	movl	%r14d, %eax
	incl	%eax
	movl	regmng+400, %r15d
	cmpl	%eax, %r15d
	jg	.LBB15_5	# bb38
.LBB15_10:	# bb219
	xorb	%al, %al
	movl	$58, %edi
	call	loop_enter
	testl	%r15d, %r15d
	jle	.LBB15_16	# bb310.preheader
.LBB15_11:	# bb219.bb152_crit_edge
	xorl	%r15d, %r15d
.LBB15_12:	# bb152
	movslq	%r15d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	cmpb	$0, 5(%rax)
	je	.LBB15_15	# cond_next216
.LBB15_13:	# cond_true173
	cmpb	$0, 4(%rax)
	jne	.LBB15_15	# cond_next216
.LBB15_14:	# cond_true197
	movb	$0, 5(%rax)
.LBB15_15:	# cond_next216
	incl	%r15d
	cmpl	%r15d, regmng+400
	jg	.LBB15_12	# bb152
.LBB15_16:	# bb310.preheader
	movl	regmng+320, %ebx
	xorb	%al, %al
	movl	$59, %edi
	call	loop_enter
	cmpl	$0, %ebx
	js	.LBB15_26	# bb318
.LBB15_17:	# bb310.preheader.bb299.preheader_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB15_24	# bb299.preheader
.LBB15_18:	# bb230
	movl	regmng+332, %ecx
	imull	%ebx, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	movq	regmng+32, %rdx
	movq	(%rdx,%rcx,8), %rsi
	testq	%rsi, %rsi
	je	.LBB15_22	# cond_next296
.LBB15_19:	# cond_true258
	cmpb	$0, 5(%rsi)
	jne	.LBB15_21	# bb272
.LBB15_20:	# cond_next264
	cmpb	$0, 4(%rsi)
	jne	.LBB15_22	# cond_next296
.LBB15_21:	# bb272
	movq	$0, (%rdx,%rcx,8)
.LBB15_22:	# cond_next296
	incl	%eax
	cmpl	%eax, regmng+316
	jge	.LBB15_18	# bb230
.LBB15_23:	# bb307
	incl	%ebx
	cmpl	%ebx, regmng+320
	jl	.LBB15_26	# bb318
.LBB15_24:	# bb299.preheader
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$60, %edi
	call	loop_enter
	cmpl	$0, %r14d
	js	.LBB15_23	# bb307
.LBB15_25:	# bb299.preheader.bb230_crit_edge
	xorl	%eax, %eax
	jmp	.LBB15_18	# bb230
.LBB15_26:	# bb318
	call	_ZN9regmngobj13deleteregionsEv
	call	_ZN9regmngobj15redefineregionsEv
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	ret
	.size	_ZN9regmngobj18enlargeneighborsesEi, .-_ZN9regmngobj18enlargeneighborsesEi


	.align	16
	.type	_ZN9regmngobj19defineneighborhood1Ev,@function
_ZN9regmngobj19defineneighborhood1Ev:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	xorb	%bl, %bl
	movl	$16, %edi
	movb	%bl, %al
	call	func_enter
	movl	regmng+400, %r14d
	movl	$63, %ecx
	movl	%ecx, %edi
	movb	%bl, %al
	call	loop_enter
	testl	%r14d, %r14d
	jle	.LBB16_3	# bb56
.LBB16_1:	# entry.bb_crit_edge
	xorl	%eax, %eax
.LBB16_2:	# bb
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movl	%eax, 28(%rcx)
	incl	%eax
	movl	regmng+400, %r14d
	cmpl	%eax, %r14d
	jg	.LBB16_2	# bb
.LBB16_3:	# bb56
	xorb	%al, %al
	movl	$61, %edi
	call	loop_enter
	testl	%r14d, %r14d
	jle	.LBB16_6	# bb370.preheader
.LBB16_4:	# bb56.bb33_crit_edge
	xorl	%r14d, %r14d
.LBB16_5:	# bb33
	movslq	%r14d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	$0, 48(%rax)
	incl	%r14d
	cmpl	%r14d, regmng+400
	jg	.LBB16_5	# bb33
.LBB16_6:	# bb370.preheader
	movl	$4294967295, %ebx
	addl	regmng+320, %ebx
	xorb	%al, %al
	movl	$65, %edi
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB16_30	# return
.LBB16_7:	# bb370.preheader.bb358.preheader_crit_edge
	xorl	%eax, %eax
	movl	%eax, 16(%rsp)
	movl	%eax, 36(%rsp)
	jmp	.LBB16_29	# bb358.preheader
.LBB16_8:	# bb.nph
	xorb	%al, %al
	movl	$66, %edi
	call	loop_enter
	movl	16(%rsp), %eax
	leal	2(%rax), %eax
	movl	%eax, 24(%rsp)
	xorl	%eax, %eax
	movl	%eax, 20(%rsp)
	movl	%eax, %ebx
.LBB16_9:	# bb67
	movl	16(%rsp), %eax
	incl	%eax
	movl	regmng+332, %ecx
	imull	%eax, %ecx
	movl	20(%rsp), %eax
	leal	1(%rax,%rcx), %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %r14
	movl	%ebx, %eax
	incl	%eax
	movl	%eax, 28(%rsp)
	testq	%r14, %r14
	je	.LBB16_27	# bb355
.LBB16_10:	# bb67
	movl	24(%rsp), %eax
	cmpl	32(%rsp), %eax
	jl	.LBB16_27	# bb355
.LBB16_11:	# bb97.preheader
	xorb	%al, %al
	movl	$67, %edi
	call	loop_enter
	movl	20(%rsp), %eax
	leal	2(%rax), %ecx
	movl	%ecx, 12(%rsp)
	addl	$2, %ebx
	cmpl	%eax, %ebx
	jl	.LBB16_27	# bb355
.LBB16_12:	# bb97.preheader.bb97_crit_edge
	xorl	%ebx, %ebx
.LBB16_13:	# bb97
	xorb	%al, %al
	movl	$64, %edi
	call	loop_enter
	movl	20(%rsp), %r15d
.LBB16_14:	# bb100
	movl	16(%rsp), %eax
	leal	(%rbx,%rax), %eax
	movl	regmng+332, %ecx
	imull	%eax, %ecx
	addl	%r15d, %ecx
	movslq	%ecx, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %r12
	testq	%r12, %r12
	je	.LBB16_25	# bb337
.LBB16_15:	# bb100
	cmpq	%r12, %r14
	je	.LBB16_25	# bb337
.LBB16_16:	# bb161.preheader
	movl	48(%r14), %r13d
	xorb	%al, %al
	movl	$62, %edi
	call	loop_enter
	xorl	%eax, %eax
	jmp	.LBB16_19	# bb161
.LBB16_17:	# bb135
	movq	40(%r14), %rcx
	movslq	%eax, %rdx
	cmpq	%r12, (%rcx,%rdx,8)
	je	.LBB16_25	# bb337
.LBB16_18:	# cond_next158
	incl	%eax
.LBB16_19:	# bb161
	cmpl	%eax, %r13d
	jg	.LBB16_17	# bb135
.LBB16_20:	# cond_next174.critedge
	movl	52(%r14), %ebp
	cmpl	%ebp, %r13d
	jne	.LBB16_22	# cond_next233
.LBB16_21:	# cond_true187
	addl	%ebp, %ebp
	# ZERO-EXTEND 
	movl	%ebp, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movq	40(%r14), %rsi
	movslq	52(%r14), %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	call	memcpy
	movq	40(%r14), %rdi
	call	free
	movq	%r13, 40(%r14)
	movl	%ebp, 52(%r14)
.LBB16_22:	# cond_next233
	movslq	48(%r14), %rax
	movq	40(%r14), %rcx
	movq	%r12, (%rcx,%rax,8)
	incl	48(%r14)
	movl	52(%r12), %r13d
	cmpl	%r13d, 48(%r12)
	jne	.LBB16_24	# cond_next315
.LBB16_23:	# cond_true263
	addl	%r13d, %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	40(%r12), %rsi
	movslq	52(%r12), %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	40(%r12), %rdi
	call	free
	movq	%rbp, 40(%r12)
	movl	%r13d, 52(%r12)
.LBB16_24:	# cond_next315
	movslq	48(%r12), %rax
	movq	40(%r12), %rcx
	movq	%r14, (%rcx,%rax,8)
	incl	48(%r12)
.LBB16_25:	# bb337
	incl	%r15d
	movl	12(%rsp), %eax
	cmpl	%r15d, %eax
	jge	.LBB16_14	# bb100
.LBB16_26:	# bb347
	movl	16(%rsp), %eax
	leal	1(%rax,%rbx), %eax
	incl	%ebx
	movl	24(%rsp), %ecx
	cmpl	%eax, %ecx
	jge	.LBB16_13	# bb97
.LBB16_27:	# bb355
	movl	20(%rsp), %ebx
	leal	2(%rbx), %eax
	incl	%ebx
	movl	%ebx, 20(%rsp)
	movl	$4294967295, %ebx
	addl	regmng+316, %ebx
	cmpl	%eax, %ebx
	jge	.LBB16_31	# bb355.bb67_crit_edge
.LBB16_28:	# bb367
	movl	16(%rsp), %eax
	leal	2(%rax), %ecx
	incl	%eax
	movl	%eax, 16(%rsp)
	movl	$4294967295, %eax
	addl	regmng+320, %eax
	cmpl	%ecx, %eax
	jl	.LBB16_30	# return
.LBB16_29:	# bb358.preheader
	movl	36(%rsp), %eax
	movl	%eax, 32(%rsp)
	incl	%eax
	movl	%eax, 36(%rsp)
	movl	$4294967295, %eax
	addl	regmng+316, %eax
	testl	%eax, %eax
	jg	.LBB16_8	# bb.nph
	jmp	.LBB16_28	# bb367
.LBB16_30:	# return
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB16_31:	# bb355.bb67_crit_edge
	movl	28(%rsp), %ebx
	jmp	.LBB16_9	# bb67
	.size	_ZN9regmngobj19defineneighborhood1Ev, .-_ZN9regmngobj19defineneighborhood1Ev


	.align	16
	.type	_ZN15largesolidarrayIP6regobjE8doublingEv,@function
_ZN15largesolidarrayIP6regobjE8doublingEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	xorb	%al, %al
	movl	$17, %edi
	call	func_enter
	movl	regmng+404, %ebx
	leal	(%rbx,%rbx), %r14d
	movl	%r14d, 4(%rsp)
	# ZERO-EXTEND 
	movl	%r14d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movq	regmng+344, %rsi
	movslq	%ebx, %rdx
	shlq	$3, %rdx
	movq	%r15, %rdi
	call	memcpy
	movq	regmng+344, %rdi
	call	free
	movq	%r15, regmng+344
	movl	regmng+380, %ebx
	leal	(%rbx,%rbx), %r15d
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %r12
	movq	regmng+368, %rsi
	movslq	%ebx, %rdx
	shlq	$2, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	regmng+368, %rdi
	call	free
	movq	%r12, regmng+368
	movl	%r15d, regmng+380
	movl	regmng+396, %ebx
	leal	(%rbx,%rbx), %r15d
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %r12
	movq	regmng+384, %rsi
	movslq	%ebx, %rdx
	shlq	$2, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	regmng+384, %rdi
	call	free
	movq	%r12, regmng+384
	movl	%r15d, regmng+396
	movl	regmng+404, %eax
	movl	%eax, (%rsp)
	cmpl	%r14d, %eax
	jge	.LBB17_5	# bb200
.LBB17_1:	# bb127.preheader
	xorb	%al, %al
	movl	$68, %edi
	call	loop_enter
	movl	4(%rsp), %ebx
	subl	(%rsp), %ebx
	movl	%ebx, %eax
	decl	%eax
	testl	%eax, %eax
	movl	$1, %eax
	cmovs	%eax, %ebx
	xorl	%r14d, %r14d
.LBB17_2:	# bb127
	movl	(%rsp), %eax
	leal	(%rax,%r14), %r15d
	movl	regmng+364, %r12d
	cmpl	%r12d, regmng+360
	jne	.LBB17_4	# cond_next176
.LBB17_3:	# cond_true141
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	regmng+352, %rsi
	movslq	%r12d, %rdx
	shlq	$2, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%rbp, regmng+352
	movl	%r13d, regmng+364
.LBB17_4:	# cond_next176
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%r15d, (%rcx,%rax,4)
	incl	regmng+360
	incl	%r14d
	cmpl	%ebx, %r14d
	jne	.LBB17_2	# bb127
.LBB17_5:	# bb200
	movl	4(%rsp), %eax
	movl	%eax, regmng+404
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN15largesolidarrayIP6regobjE8doublingEv, .-_ZN15largesolidarrayIP6regobjE8doublingEv


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI18_0:					#  float
	.long	1056964608	# float 0.5
	.text
	.align	16
	.type	_ZN6regobj6createEii,@function
_ZN6regobj6createEii:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	movl	%esi, %r14d
	movl	%edx, %r15d
	xorb	%al, %al
	movl	$18, %edi
	call	func_enter
	movl	%r14d, 20(%rbx)
	movl	%r15d, 24(%rbx)
	movl	$0, 16(%rbx)
	movl	$128, _ZN6regobj9bound1arpE+12
	movl	$0, _ZN6regobj9bound1arpE+8
	movl	$1024, %r12d
	movq	%r12, %rdi
	call	malloc
	movq	%rax, _ZN6regobj9bound1arpE
	movl	$128, _ZN6regobj9bound2arpE+12
	movl	$0, _ZN6regobj9bound2arpE+8
	movq	%r12, %rdi
	call	malloc
	movq	%rax, _ZN6regobj9bound2arpE
	movl	$4, 52(%rbx)
	movl	$0, 48(%rbx)
	movl	$32, %edi
	call	malloc
	movq	%rax, 40(%rbx)
	movl	%r15d, %r12d
	decl	%r12d
	xorl	%eax, %eax
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
	movl	%r14d, %ecx
	decl	%ecx
	testl	%ecx, %ecx
	cmovs	%eax, %ecx
	movl	%ecx, 16(%rsp)
	movq	8(%rbx), %rax
	movl	316(%rax), %ecx
	incl	%r14d
	cmpl	%r14d, %ecx
	cmovl	%ecx, %r14d
	movl	%r14d, 8(%rsp)
	movl	320(%rax), %eax
	movl	%eax, 12(%rsp)
	incl	%r15d
	cmpl	%r15d, %eax
	jge	.LBB18_13	# bb175
.LBB18_1:	# cond_true119
	cmpl	12(%rsp), %r12d
	jg	.LBB18_14	# bb181
.LBB18_2:	# bb166.preheader
	xorb	%al, %al
	movl	$71, %edi
	call	loop_enter
	movl	16(%rsp), %r15d
	jmp	.LBB18_10	# bb166
.LBB18_3:	# bb129
	movq	8(%rbx), %rax
	movl	332(%rax), %ecx
	imull	%r12d, %ecx
	addl	%r15d, %ecx
	movslq	%ecx, %rcx
	movq	32(%rax), %rdx
	cmpq	$0, (%rdx,%rcx,8)
	jne	.LBB18_9	# cond_next163
.LBB18_4:	# cond_true159
	movq	40(%rax), %rdx
	movzbq	(%rdx,%rcx), %rcx
	cmpb	$0, 48(%rax,%rcx)
	je	.LBB18_9	# cond_next163
.LBB18_5:	# cond_true.i
	movl	%r15d, %ecx
	subl	20(%rbx), %ecx
	imull	%ecx, %ecx
	movl	%r12d, %edx
	subl	24(%rbx), %edx
	imull	%edx, %edx
	addl	%ecx, %edx
	cvtsi2ss	%edx, %xmm0
	addss	.LCPI18_0(%rip), %xmm0
	cvttss2si	%xmm0, %ecx
	cmpl	308(%rax), %ecx
	jg	.LBB18_9	# cond_next163
.LBB18_6:	# cond_true88.i
	movl	_ZN6regobj9bound1arpE+12, %r14d
	cmpl	%r14d, _ZN6regobj9bound1arpE+8
	jne	.LBB18_8	# cond_next152.i
.LBB18_7:	# cond_true107.i
	leal	(%r14,%r14), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	_ZN6regobj9bound1arpE, %rsi
	movslq	%r14d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	_ZN6regobj9bound1arpE, %rdi
	call	free
	movq	%rbp, _ZN6regobj9bound1arpE
	movl	%r13d, _ZN6regobj9bound1arpE+12
.LBB18_8:	# cond_next152.i
	movslq	_ZN6regobj9bound1arpE+8, %rax
	movq	_ZN6regobj9bound1arpE, %rcx
	movl	%r15d, (%rcx,%rax,8)
	movl	%r12d, 4(%rcx,%rax,8)
	incl	_ZN6regobj9bound1arpE+8
	movq	8(%rbx), %rax
	movl	332(%rax), %ecx
	imull	%r12d, %ecx
	addl	%r15d, %ecx
	movslq	%ecx, %rcx
	movq	32(%rax), %rax
	movq	%rbx, (%rax,%rcx,8)
	incl	16(%rbx)
	incl	%r15d
	jmp	.LBB18_11	# bb166
.LBB18_9:	# cond_next163
	incl	%r15d
.LBB18_10:	# bb166
	xorb	%al, %al
	movl	$70, %edi
	call	loop_enter
.LBB18_11:	# bb166
	cmpl	8(%rsp), %r15d
	jle	.LBB18_3	# bb129
.LBB18_12:	# bb172
	incl	%r12d
	movl	12(%rsp), %r15d
.LBB18_13:	# bb175
	cmpl	%r15d, %r12d
	jle	.LBB18_19	# bb175.bb166.preheader_crit_edge
.LBB18_14:	# bb181
	movl	_ZN6regobj9bound1arpE+8, %eax
	movl	%eax, _ZN6regobj6boundlE
	testl	%eax, %eax
	je	.LBB18_20	# cond_false
.LBB18_15:	# cond_true188
	movb	$1, 4(%rbx)
	xorb	%al, %al
	movl	$69, %edi
	call	loop_enter
.LBB18_16:	# cond_true209
	leaq	_ZN6regobj9bound2arpE, %rdx
	leaq	_ZN6regobj9bound1arpE, %rsi
	movq	%rbx, %rdi
	call	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_
	movl	_ZN6regobj9bound2arpE+8, %eax
	movl	%eax, _ZN6regobj6boundlE
	testl	%eax, %eax
	je	.LBB18_18	# bb224
.LBB18_17:	# cond_false213.critedge
	leaq	_ZN6regobj9bound1arpE, %rdx
	leaq	_ZN6regobj9bound2arpE, %rsi
	movq	%rbx, %rdi
	call	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_
	movl	_ZN6regobj9bound1arpE+8, %eax
	movl	%eax, _ZN6regobj6boundlE
	testl	%eax, %eax
	jne	.LBB18_16	# cond_true209
.LBB18_18:	# bb224
	movq	_ZN6regobj9bound1arpE, %rdi
	call	free
	movq	_ZN6regobj9bound2arpE, %rdi
	call	free
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB18_19:	# bb175.bb166.preheader_crit_edge
	movl	%r15d, 12(%rsp)
	jmp	.LBB18_2	# bb166.preheader
.LBB18_20:	# cond_false
	movb	$0, 4(%rbx)
	jmp	.LBB18_18	# bb224
	.size	_ZN6regobj6createEii, .-_ZN6regobj6createEii


	.section	.rodata.cst4,"aM",@progbits,4
	.align	8
.LCPI19_0:					#  float
	.long	1101004800	# float 20
.LCPI19_1:					#  float
	.long	1092616192	# float 10
.LCPI19_2:					#  float
	.long	1134198784	# float 309
.LCPI19_3:					#  float
	.long	1056964608	# float 0.5
	.zero	8
.LCPI19_5:					#  float
	.long	1142620160	# float 620
.LCPI19_6:					#  float
	.long	1107820544	# float 34
.LCPI19_7:					#  float
	.long	1121320960	# float 107
.LCPI19_8:					#  float
	.long	1100480512	# float 19
.LCPI19_9:					#  float
	.long	940216657	# float 3.30371e-05
.LCPI19_10:					#  float
	.long	940205271	# float 3.29957e-05
.LCPI19_11:					#  float
	.long	940200485	# float 3.29783e-05
.LCPI19_12:					#  float
	.long	1107296256	# float 32
.LCPI19_13:					#  float
	.long	1117126656	# float 75
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI19_4:					#  double
	.quad	4610479282544200874	# double value: 1.73205
	.text
	.align	16
	.type	_ZN9regmngobj13createregionsEi,@function
_ZN9regmngobj13createregionsEi:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	movl	%edi, %ebx
	xorb	%r14b, %r14b
	movl	$19, %edi
	movb	%r14b, %al
	call	func_enter
	movl	regmng+332, %ecx
	movl	regmng+336, %esi
	imull	%ecx, %esi
	movslq	%esi, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%esi, %esi
	xorl	%r15d, %r15d
	movl	%r15d, 40(%rsp)
	movq	regmng+32, %rdi
	movl	%r15d, %eax
	rep;stosl
	movq	%rsi, %rcx
	rep;stosb
	movl	$1717986919, %eax
	imull	regmng+332
	cmpl	$6, %ebx
	movl	$6, %eax
	cmovl	%eax, %ebx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	%edx
	addl	%eax, %edx
	cmpl	%ebx, %edx
	cmovl	%edx, %ebx
	cvtsi2ss	%ebx, %xmm0
	divss	.LCPI19_0(%rip), %xmm0
	movss	%xmm0, 64(%rsp)
	movss	%xmm0, regmng+312
	mulss	.LCPI19_1(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, regmng+304
	imull	%eax, %eax
	movl	%eax, regmng+308
	movl	$1792, %edi
	call	malloc
	movq	%rax, 24(%rsp)
	movl	regmng+320, %ebx
	movl	regmng+316, %r12d
	movl	$80, %ecx
	movl	%ecx, %edi
	movb	%r14b, %al
	call	loop_enter
	cvtsi2ss	%ebx, %xmm0
	divss	.LCPI19_2(%rip), %xmm0
	mulss	.LCPI19_0(%rip), %xmm0
	divss	64(%rsp), %xmm0
	movss	.LCPI19_3(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm0
	incl	%ebx
	cvtsi2ss	%ebx, %xmm2
	divss	%xmm0, %xmm2
	cvtss2sd	%xmm2, %xmm2
	movsd	.LCPI19_4(%rip), %xmm3
	mulsd	%xmm3, %xmm2
	cvtss2sd	.LCPI19_3(%rip), %xmm4
	mulsd	%xmm4, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	addss	%xmm1, %xmm2
	cvttss2si	%xmm2, %eax
	movl	%eax, 56(%rsp)
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movl	%ecx, 48(%rsp)
	cvtsi2ss	%r12d, %xmm2
	divss	.LCPI19_5(%rip), %xmm2
	mulss	.LCPI19_6(%rip), %xmm2
	divss	64(%rsp), %xmm2
	addss	%xmm1, %xmm2
	cvttss2si	%xmm2, %eax
	movl	%eax, 52(%rsp)
	cvtsi2ss	%eax, %xmm2
	decl	%eax
	movl	%eax, 60(%rsp)
	incl	%r12d
	cvtsi2ss	%r12d, %xmm4
	divss	%xmm2, %xmm4
	addss	%xmm1, %xmm4
	cvttss2si	%xmm4, %eax
	movl	%eax, 20(%rsp)
	addss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	divsd	%xmm3, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$3, %eax
	movl	%eax, 44(%rsp)
	movl	$16, 32(%rsp)
	movl	%r15d, %ebx
	movl	%r15d, %r14d
.LBB19_1:	# bb100.i
	movl	%r14d, %eax
	andl	$1, %eax
	movl	%eax, 36(%rsp)
	testl	$1, %r14d
	jne	.LBB19_106	# cond_true.i
.LBB19_2:	# cond_false.i
	movl	%ebx, %edi
	movl	20(%rsp), %ecx
	imull	%ecx, %edi
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.LBB19_3:	# cond_next.i
	movl	%r14d, %esi
	imull	56(%rsp), %esi
	addl	48(%rsp), %esi
	addl	%eax, %edi
	leaq	128(%rsp), %rcx
	leaq	132(%rsp), %rdx
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB19_10	# next.i
.LBB19_4:	# cond_false131.i
	movl	128(%rsp), %eax
	movl	regmng+332, %ecx
	imull	%eax, %ecx
	addl	132(%rsp), %ecx
	movslq	%ecx, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_10	# next.i
.LBB19_5:	# cond_next161.i
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB19_7	# cond_next191.i
.LBB19_6:	# cond_true189.i
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB19_7:	# cond_next191.i
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%r15, (%rcx,%rax,8)
	movl	$4294967295, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	movslq	%eax, %rax
	movq	regmng+352, %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	movl	regmng+400, %edx
	movq	regmng+368, %rsi
	movl	%edx, (%rsi,%rcx,4)
	movslq	regmng+400, %rcx
	movq	regmng+384, %rdx
	movl	%eax, (%rdx,%rcx,4)
	incl	regmng+400
	movl	%eax, (%r15)
	movl	$4, 52(%r15)
	movl	$0, 48(%r15)
	movl	$32, %edi
	call	malloc
	movq	%rax, 40(%r15)
	movb	$1, 4(%r15)
	movl	132(%rsp), %eax
	movl	%eax, 20(%r15)
	movl	128(%rsp), %eax
	movl	%eax, 24(%r15)
	movl	40(%rsp), %eax
	cmpl	32(%rsp), %eax
	jne	.LBB19_9	# cond_next314.i
.LBB19_8:	# cond_true274.i
	movl	32(%rsp), %r12d
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %eax
	imulq	$112, %rax, %rdi
	call	malloc
	movq	%rax, %rbp
	movslq	%r12d, %rax
	imulq	$112, %rax, %rdx
	movq	%rbp, %rdi
	movq	24(%rsp), %r12
	movq	%r12, %rsi
	call	memcpy
	movq	%r12, %rdi
	call	free
	movl	%r13d, 32(%rsp)
	movq	%rbp, 24(%rsp)
.LBB19_9:	# cond_next314.i
	movl	40(%rsp), %eax
	incl	%eax
	movl	%eax, 40(%rsp)
	movslq	%eax, %rax
	imulq	$112, %rax, %rax
	movq	24(%rsp), %rcx
	movb	$1, -8(%rax,%rcx)
	movl	132(%rsp), %esi
	movl	128(%rsp), %edx
	leaq	-112(%rax,%rcx), %rdi
	movq	%r15, %rcx
	call	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj
.LBB19_10:	# next.i
	incl	%ebx
	cmpl	$0, 36(%rsp)
	je	.LBB19_109	# cond_false353.i
.LBB19_11:	# cond_true342.i
	movl	60(%rsp), %eax
	cmpl	%ebx, %eax
.LBB19_12:	# cond_true342.i
	jne	.LBB19_14	# cond_next363.i
.LBB19_13:	# cond_true349.i
	incl	%r14d
	xorl	%ebx, %ebx
.LBB19_14:	# cond_next363.i
	xorb	%al, %al
	movl	$88, %edi
	call	loop_enter
	movl	44(%rsp), %eax
	cmpl	%r14d, %eax
	jg	.LBB19_1	# bb100.i
.LBB19_15:	# cond_next363.i.bb407.i_crit_edge
	movb	$1, %bl
	xorl	%r14d, %r14d
	jmp	.LBB19_20	# bb414.i.bb407.i_crit_edge
.LBB19_16:	# bb386.i
	movslq	%r15d, %rax
	imulq	$112, %rax, %rdi
	addq	24(%rsp), %rdi
	call	_ZN11regboundobj4stepEv
	xorw	%cx, %cx
	cmpb	$1, %al
	movb	%bl, %al
	cmove	%cx, %ax
	incl	%r15d
	movb	%al, %bl
.LBB19_17:	# bb407.i
	incq	%r14
	movl	40(%rsp), %eax
	cmpl	%r15d, %eax
	jg	.LBB19_16	# bb386.i
.LBB19_18:	# bb414.i
	testb	%bl, %bl
	jne	.LBB19_21	# bb435.loopexit.i
.LBB19_19:	# bb414.i.bb407.i_crit_edge
	movb	$1, %bl
.LBB19_20:	# bb414.i.bb407.i_crit_edge
	xorl	%r15d, %r15d
	jmp	.LBB19_17	# bb407.i
.LBB19_21:	# bb435.loopexit.i
	xorb	%al, %al
	movl	$76, %edi
	call	loop_enter
	cmpl	$0, 40(%rsp)
	jle	.LBB19_24	# _ZN9regmngobj13defineregionsEv.exit
.LBB19_22:	# bb435.loopexit.i.bb421.i_crit_edge
	xorl	%ebx, %ebx
.LBB19_23:	# bb421.i
	movslq	%ebx, %rax
	imulq	$112, %rax, %r14
	movq	24(%rsp), %r15
	movq	(%r15,%r14), %rdi
	call	free
	movq	16(%r15,%r14), %rdi
	call	free
	incl	%ebx
	movl	40(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.LBB19_23	# bb421.i
.LBB19_24:	# _ZN9regmngobj13defineregionsEv.exit
	movq	24(%rsp), %rdi
	call	free
	cvtss2sd	regmng+312, %xmm0
	movsd	%xmm0, 8(%rsp)
	movl	regmng+400, %ebx
	xorb	%cl, %cl
	movl	$87, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	cvtss2sd	.LCPI19_7(%rip), %xmm0
	mulsd	8(%rsp), %xmm0
	mulsd	8(%rsp), %xmm0
	cvttsd2si	%xmm0, %r14d
	testl	%ebx, %ebx
	jle	.LBB19_27	# bb103.preheader.i
.LBB19_25:	# _ZN9regmngobj13defineregionsEv.exit.bb.i_crit_edge
	xorl	%eax, %eax
.LBB19_26:	# bb.i
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	movb	$1, 5(%rcx)
	incl	%eax
	movl	regmng+400, %ebx
	cmpl	%eax, %ebx
	jg	.LBB19_26	# bb.i
.LBB19_27:	# bb103.preheader.i
	xorb	%al, %al
	movl	$86, %edi
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB19_32	# _ZN9regmngobj14enlargeregionsEv.exit
.LBB19_28:	# bb103.preheader.i.bb42.i_crit_edge
	xorl	%ebx, %ebx
.LBB19_29:	# bb42.i
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rcx
	cmpl	%r14d, 16(%rcx)
	jge	.LBB19_31	# cond_next.i10
.LBB19_30:	# cond_true.i9
	movb	$0, 5(%rcx)
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rcx
	movb	$0, 4(%rcx)
.LBB19_31:	# cond_next.i10
	movl	%eax, %ebx
	incl	%ebx
	cmpl	%ebx, regmng+400
	jg	.LBB19_29	# bb42.i
.LBB19_32:	# _ZN9regmngobj14enlargeregionsEv.exit
	call	_ZN9regmngobj13deleteregionsEv
	movl	regmng+332, %ecx
	movl	regmng+336, %edx
	imull	%ecx, %edx
	movslq	%edx, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movq	regmng+32, %rdi
	movl	%esi, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	call	_ZN9regmngobj15redefineregionsEv
	movss	regmng+312, %xmm0
	mulss	.LCPI19_8(%rip), %xmm0
	cvttss2si	%xmm0, %ecx
	movl	%ecx, regmng+304
	imull	%ecx, %ecx
	movl	%ecx, regmng+308
	movl	regmng+320, %ebx
	xorb	%cl, %cl
	movl	$73, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	testl	%ebx, %ebx
	js	.LBB19_107	# bb202.i
.LBB19_33:	# _ZN9regmngobj14enlargeregionsEv.exit.bb183.preheader.i_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB19_42	# bb183.preheader.i
.LBB19_34:	# bb6.i
	movl	regmng+332, %eax
	imull	%r14d, %eax
	addl	%ebx, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_40	# cond_next180.i
.LBB19_35:	# cond_true.i20
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB19_40	# cond_next180.i
.LBB19_36:	# cond_true66.i
	movl	y1rnd, %eax
	imull	$171, %eax, %ecx
	movl	$1162389643, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y1rnd
	movl	y2rnd, %eax
	imull	$172, %eax, %esi
	movl	$1160932197, %edx
	movl	%esi, %eax
	imull	%edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %esi
	movl	%esi, y2rnd
	movl	y3rnd, %eax
	imull	$170, %eax, %edi
	movl	$2320639257, %edx
	movl	%edi, %eax
	imull	%edx
	addl	%edi, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %edi
	movl	%edi, y3rnd
	cvtsi2ss	%ecx, %xmm0
	mulss	.LCPI19_9(%rip), %xmm0
	cvtsi2ss	%esi, %xmm1
	mulss	.LCPI19_10(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm1
	mulss	.LCPI19_11(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm0
	mulss	.LCPI19_12(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	cmpl	$1, %eax
	jne	.LBB19_40	# cond_next180.i
.LBB19_37:	# cond_true72.i
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB19_39	# cond_next.i32
.LBB19_38:	# cond_true107.i
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB19_39:	# cond_next.i32
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%r15, (%rcx,%rax,8)
	movl	$4294967295, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	movslq	%eax, %rax
	movq	regmng+352, %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	movl	regmng+400, %edx
	movq	regmng+368, %rsi
	movl	%edx, (%rsi,%rcx,4)
	movslq	regmng+400, %rcx
	movq	regmng+384, %rdx
	movl	%eax, (%rdx,%rcx,4)
	incl	regmng+400
	movl	%eax, (%r15)
	movq	%r15, %rdi
	movl	%ebx, %esi
	movl	%r14d, %edx
	call	_ZN6regobj6createEii
.LBB19_40:	# cond_next180.i
	incl	%ebx
	cmpl	%ebx, regmng+316
	jge	.LBB19_34	# bb6.i
.LBB19_41:	# bb191.i
	incl	%r14d
	movl	regmng+320, %ebx
	cmpl	%r14d, %ebx
	jl	.LBB19_107	# bb202.i
.LBB19_42:	# bb183.preheader.i
	movl	regmng+316, %ebx
	xorb	%al, %al
	movl	$91, %edi
	call	loop_enter
	cmpl	$0, %ebx
	js	.LBB19_41	# bb191.i
.LBB19_43:	# bb183.preheader.i.bb6.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB19_34	# bb6.i
.LBB19_44:	# bb217.i
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_49	# cond_next394.i
.LBB19_45:	# cond_true245.i
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB19_49	# cond_next394.i
.LBB19_46:	# cond_true279.i
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB19_48	# cond_next323.i
.LBB19_47:	# cond_true321.i
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB19_48:	# cond_next323.i
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%r15, (%rcx,%rax,8)
	movl	$4294967295, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	movslq	%eax, %rax
	movq	regmng+352, %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	movl	regmng+400, %edx
	movq	regmng+368, %rsi
	movl	%edx, (%rsi,%rcx,4)
	movslq	regmng+400, %rcx
	movq	regmng+384, %rdx
	movl	%eax, (%rdx,%rcx,4)
	incl	regmng+400
	movl	%eax, (%r15)
	movq	%r15, %rdi
	movl	%r14d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB19_49:	# cond_next394.i
	incl	%r14d
	cmpl	%r14d, regmng+316
	jge	.LBB19_44	# bb217.i
.LBB19_50:	# bb405.i
	incl	%ebx
	cmpl	%ebx, regmng+320
	jl	.LBB19_53	# _ZN9regmngobj10addregionsEv.exit
.LBB19_51:	# bb397.preheader.i
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$74, %edi
	call	loop_enter
	cmpl	$0, %r14d
	js	.LBB19_50	# bb405.i
.LBB19_52:	# bb397.preheader.i.bb217.i_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB19_44	# bb217.i
.LBB19_53:	# _ZN9regmngobj10addregionsEv.exit
	movl	regmng+316, %eax
	leal	(%rax,%rax,4), %eax
	movl	%eax, regmng+304
	imull	%eax, %eax
	movl	%eax, regmng+308
	call	_ZN9regmngobj19defineneighborhood1Ev
	movss	regmng+312, %xmm0
	movaps	%xmm0, %xmm1
	mulss	.LCPI19_13(%rip), %xmm1
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movl	%eax, %edi
	call	_ZN9regmngobj18enlargeneighborsesEi
	call	_ZN9regmngobj19defineneighborhood1Ev
	cvtss2sd	regmng+312, %xmm0
	cvtss2sd	.LCPI19_13(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	movl	%eax, %edi
	call	_ZN9regmngobj18enlargeneighborsesEi
	movl	regmng+320, %ebx
	xorb	%cl, %cl
	movl	$89, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	cmpl	$0, %ebx
	js	.LBB19_64	# bb314
.LBB19_54:	# _ZN9regmngobj10addregionsEv.exit.bb295.outer_crit_edge
	xorl	%ebx, %ebx
.LBB19_55:	# bb295.outer
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$90, %edi
	call	loop_enter
	cmpl	$0, %r14d
	js	.LBB19_63	# bb306
.LBB19_56:	# bb295.outer.bb122_crit_edge
	xorl	%r14d, %r14d
.LBB19_57:	# bb122
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_62	# cond_next292
.LBB19_58:	# cond_true150
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB19_62	# cond_next292
.LBB19_59:	# cond_true184
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB19_61	# cond_next221
.LBB19_60:	# cond_true219
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB19_61:	# cond_next221
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%r15, (%rcx,%rax,8)
	movl	$4294967295, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	movslq	%eax, %rax
	movq	regmng+352, %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	movl	regmng+400, %edx
	movq	regmng+368, %rsi
	movl	%edx, (%rsi,%rcx,4)
	movslq	regmng+400, %rcx
	movq	regmng+384, %rdx
	movl	%eax, (%rdx,%rcx,4)
	incl	regmng+400
	movl	%eax, (%r15)
	movq	%r15, %rdi
	movl	%r14d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB19_62:	# cond_next292
	incl	%r14d
	cmpl	%r14d, regmng+316
	jge	.LBB19_57	# bb122
.LBB19_63:	# bb306
	incl	%ebx
	cmpl	%ebx, regmng+320
	jge	.LBB19_55	# bb295.outer
.LBB19_64:	# bb314
	call	_ZN9regmngobj13deleteregionsEv
	movl	regmng+320, %ebx
	xorb	%cl, %cl
	movl	$85, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB19_73	# bb405
.LBB19_65:	# bb314.bb386.outer_crit_edge
	xorl	%ebx, %ebx
.LBB19_66:	# bb386.outer
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$75, %edi
	call	loop_enter
	cmpl	$0, %r14d
	jle	.LBB19_72	# bb397
.LBB19_67:	# bb386.outer.bb317_crit_edge
	xorl	%r14d, %r14d
.LBB19_68:	# bb317
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_71	# cond_next383
.LBB19_69:	# cond_true345
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB19_71	# cond_next383
.LBB19_70:	# cond_true379
	xorb	%al, %al
	leaq	.str, %rdi
	call	printf
.LBB19_71:	# cond_next383
	incl	%r14d
	cmpl	%r14d, regmng+316
	jg	.LBB19_68	# bb317
.LBB19_72:	# bb397
	incl	%ebx
	cmpl	%ebx, regmng+320
	jg	.LBB19_66	# bb386.outer
.LBB19_73:	# bb405
	call	_ZN9regmngobj19defineneighborhood1Ev
	call	_ZN9regmngobj20definemiddleregpointEv
	movl	regmng+400, %ebx
	xorb	%cl, %cl
	movl	$77, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB19_78	# bb485.preheader
.LBB19_74:	# bb405.bb415_crit_edge
	xorl	%r14d, %r14d
.LBB19_75:	# bb415
	movslq	%r14d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rbx
	movl	20(%rbx), %edi
	movl	24(%rbx), %esi
	leaq	120(%rsp), %rcx
	leaq	124(%rsp), %rdx
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB19_77	# bb455
.LBB19_76:	# cond_true443
	movl	124(%rsp), %eax
	movl	%eax, 20(%rbx)
	movl	120(%rsp), %eax
	movl	%eax, 24(%rbx)
.LBB19_77:	# bb455
	incl	%r14d
	movl	regmng+400, %ebx
	cmpl	%r14d, %ebx
	jg	.LBB19_75	# bb415
.LBB19_78:	# bb485.preheader
	xorb	%al, %al
	movl	$84, %edi
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB19_81	# bb494
.LBB19_79:	# bb485.preheader.bb465_crit_edge
	xorl	%ebx, %ebx
.LBB19_80:	# bb465
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movb	$1, 5(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	jg	.LBB19_80	# bb465
.LBB19_81:	# bb494
	movl	regmng+332, %eax
	movl	regmng+336, %ecx
	imull	%eax, %ecx
	movslq	%ecx, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	movq	regmng+32, %rdi
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	call	_ZN9regmngobj15redefineregionsEv
	movl	regmng+400, %ebx
	xorb	%cl, %cl
	movl	$78, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB19_86	# bb567
.LBB19_82:	# bb494.bb514_crit_edge
	xorl	%eax, %eax
.LBB19_83:	# bb514
	movslq	%eax, %rcx
	movq	regmng+344, %rdx
	movq	(%rdx,%rcx,8), %rcx
	cmpl	$0, 16(%rcx)
	jne	.LBB19_85	# bb558
.LBB19_84:	# cond_true537
	movb	$0, 4(%rcx)
.LBB19_85:	# bb558
	incl	%eax
	cmpl	%eax, regmng+400
	jg	.LBB19_83	# bb514
.LBB19_86:	# bb567
	call	_ZN9regmngobj13deleteregionsEv
	movl	regmng+320, %ebx
	xorb	%cl, %cl
	movl	$81, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	cmpl	$0, %ebx
	js	.LBB19_97	# bb776
.LBB19_87:	# bb567.bb757.outer_crit_edge
	xorl	%ebx, %ebx
.LBB19_88:	# bb757.outer
	movl	regmng+316, %r14d
	xorb	%al, %al
	movl	$83, %edi
	call	loop_enter
	cmpl	$0, %r14d
	js	.LBB19_96	# bb768
.LBB19_89:	# bb757.outer.bb577_crit_edge
	xorl	%r14d, %r14d
.LBB19_90:	# bb577
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB19_95	# cond_next754
.LBB19_91:	# cond_true605
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB19_95	# cond_next754
.LBB19_92:	# cond_true639
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB19_94	# cond_next683
.LBB19_93:	# cond_true681
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB19_94:	# cond_next683
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%r15, (%rcx,%rax,8)
	movl	$4294967295, %eax
	addl	regmng+360, %eax
	movl	%eax, regmng+360
	movslq	%eax, %rax
	movq	regmng+352, %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	movl	regmng+400, %edx
	movq	regmng+368, %rsi
	movl	%edx, (%rsi,%rcx,4)
	movslq	regmng+400, %rcx
	movq	regmng+384, %rdx
	movl	%eax, (%rdx,%rcx,4)
	incl	regmng+400
	movl	%eax, (%r15)
	movq	%r15, %rdi
	movl	%r14d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB19_95:	# cond_next754
	incl	%r14d
	cmpl	%r14d, regmng+316
	jge	.LBB19_90	# bb577
.LBB19_96:	# bb768
	incl	%ebx
	cmpl	%ebx, regmng+320
	jge	.LBB19_88	# bb757.outer
.LBB19_97:	# bb776
	call	_ZN9regmngobj19defineneighborhood1Ev
	call	_ZN9regmngobj20definemiddleregpointEv
	movl	regmng+400, %ebx
	xorb	%cl, %cl
	movl	$79, %edx
	movl	%edx, %edi
	movb	%cl, %al
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB19_102	# bb861.preheader
.LBB19_98:	# bb776.bb787_crit_edge
	xorl	%r14d, %r14d
.LBB19_99:	# bb787
	movslq	%r14d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rbx
	movl	20(%rbx), %edi
	movl	24(%rbx), %esi
	leaq	112(%rsp), %rcx
	leaq	116(%rsp), %rdx
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB19_101	# bb828
.LBB19_100:	# cond_true816
	movl	116(%rsp), %eax
	movl	%eax, 20(%rbx)
	movl	112(%rsp), %eax
	movl	%eax, 24(%rbx)
.LBB19_101:	# bb828
	incl	%r14d
	movl	regmng+400, %ebx
	cmpl	%r14d, %ebx
	jg	.LBB19_99	# bb787
.LBB19_102:	# bb861.preheader
	xorb	%al, %al
	movl	$82, %edi
	call	loop_enter
	testl	%ebx, %ebx
	jle	.LBB19_105	# return
.LBB19_103:	# bb861.preheader.bb838_crit_edge
	xorl	%ebx, %ebx
.LBB19_104:	# bb838
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	regmng+24, %ecx
	movl	%ecx, 32(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	jg	.LBB19_104	# bb838
.LBB19_105:	# return
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB19_106:	# cond_true.i
	movl	%ebx, %eax
	movl	20(%rsp), %ecx
	imull	%ecx, %eax
	movl	%ecx, %edi
	jmp	.LBB19_3	# cond_next.i
.LBB19_107:	# bb202.i
	xorb	%al, %al
	movl	$72, %edi
	call	loop_enter
	testl	%ebx, %ebx
	js	.LBB19_53	# _ZN9regmngobj10addregionsEv.exit
.LBB19_108:	# bb202.i.bb397.preheader.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB19_51	# bb397.preheader.i
.LBB19_109:	# cond_false353.i
	cmpl	52(%rsp), %ebx
	jmp	.LBB19_12	# cond_true342.i
	.size	_ZN9regmngobj13createregionsEi, .-_ZN9regmngobj13createregionsEi


	.align	16
	.type	_ZN7way2obj9createwayEiiiiPhRP6pointtRi,@function
_ZN7way2obj9createwayEiiiiPhRP6pointtRi:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$120, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movl	%edx, %r15d
	movl	%ecx, %r12d
	movq	%r8, %r13
	movq	%r9, 112(%rsp)
	xorb	%bpl, %bpl
	movl	$20, %edi
	movb	%bpl, %al
	call	func_enter
	movl	%ebx, way2+4396
	movl	%r14d, way2+4400
	movl	%r15d, way2+4388
	movl	%r12d, way2+4392
	movl	$92, %ecx
	movl	%ecx, %edi
	movb	%bpl, %al
	call	loop_enter
	xorl	%eax, %eax
.LBB20_1:	# bb
	movslq	%eax, %rcx
	movb	(%r13,%rcx), %dl
	movb	%dl, way2+18(%rcx)
	incl	%eax
	cmpl	$256, %eax
	jne	.LBB20_1	# bb
.LBB20_2:	# bb29
	xorb	%al, %al
	movl	$94, %edi
	call	loop_enter
	cmpl	%r12d, %r14d
	jne	.LBB20_4	# bb29.bb.i_crit_edge
.LBB20_3:	# bb29
	cmpl	%r15d, %ebx
	je	.LBB20_77	# cond_true
.LBB20_4:	# bb29.bb.i_crit_edge
	xorl	%eax, %eax
.LBB20_5:	# bb.i
	movslq	%eax, %rcx
	shlq	$4, %rcx
	movl	$0, way2+288(%rcx)
	incl	%eax
	cmpl	$256, %eax
	jne	.LBB20_5	# bb.i
.LBB20_6:	# bb16.i
	movw	$1, %ax
	addw	way2+16, %ax
	movw	%ax, way2+16
	cmpw	$65535, %ax
	jne	.LBB20_8	# cond_next.i
.LBB20_7:	# cond_true.i
	movl	way2+4424, %eax
	movl	way2+4428, %ecx
	movq	way2+8, %rdi
	imull	%eax, %ecx
	movslq	%ecx, %rdx
	shlq	$2, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$1, way2+16
.LBB20_8:	# cond_next.i
	movb	$0, way2+4404
	movl	$0, way2+4380
	movl	way2+292, %r15d
	cmpl	%r15d, way2+288
	jne	.LBB20_10	# cond_next115.i
.LBB20_9:	# cond_true69.i
	leal	(%r15,%r15), %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movq	way2+280, %rsi
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	call	memcpy
	movq	way2+280, %rdi
	call	free
	movq	%r13, way2+280
	movl	%r12d, way2+292
.LBB20_10:	# cond_next115.i
	movslq	way2+288, %rax
	movq	way2+280, %rcx
	movl	%ebx, (%rcx,%rax,8)
	movl	%r14d, 4(%rcx,%rax,8)
	incl	way2+288
	movl	way2+4424, %eax
	imull	%r14d, %eax
	addl	%ebx, %eax
	movslq	%eax, %rax
	movq	way2+8, %rcx
	movw	$0, 2(%rcx,%rax,4)
	movl	$0, way2+4376
	movl	$0, way2+4384
	movb	way2+4404, %bl
	xorb	%al, %al
	movl	$99, %edi
	call	loop_enter
	testb	%bl, %bl
	jne	.LBB20_20	# _ZN7way2obj4fillEii.exit
.LBB20_11:	# cond_next115.i.cond_next282.i.outer_crit_edge
	xorl	%r14d, %r14d
	movl	%r14d, %r15d
	movl	%r14d, %r12d
.LBB20_12:	# cond_next282.i.outer
	movl	way2+4380, %r13d
	xorb	%al, %al
	movl	$98, %edi
	call	loop_enter
	xorl	%ecx, %ecx
	movl	%r12d, %edx
	jmp	.LBB20_16	# cond_next282.i
.LBB20_13:	# bb160.i
	movl	%r14d, %edx
	sarl	$31, %edx
	shrl	$24, %edx
	addl	%r14d, %edx
	andl	$4294967040, %edx
	subl	%edx, %r14d
	movslq	%r14d, %rbp
	movq	%rbp, %rdx
	shlq	$4, %rdx
	movl	way2+288(%rdx), %edx
	movl	%edx, 108(%rsp)
	testl	%edx, %edx
	jne	.LBB20_22	# cond_false.i
.LBB20_14:	# cond_true184.i
	incl	%ecx
	incl	%r15d
	testb	%bl, %bl
	jne	.LBB20_18	# cond_true184.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
.LBB20_15:	# cond_true184.i.cond_next282.i_crit_edge
	movl	%r15d, %edx
.LBB20_16:	# cond_next282.i
	movl	%r14d, %esi
	movl	%r15d, %eax
	movl	%edx, %r15d
	leal	(%r12,%rcx), %r14d
	leal	(%r13,%rcx), %edx
	cmpl	$265, %edx
	jl	.LBB20_13	# bb160.i
.LBB20_17:	# cond_next282.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
	addl	%ecx, %r13d
	movl	%esi, %r14d
	movl	%eax, %r12d
	jmp	.LBB20_19	# _ZN7way2obj4fillEii.exit.loopexit.loopexit
.LBB20_18:	# cond_true184.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
	addl	%ecx, %r12d
	addl	%ecx, %r13d
.LBB20_19:	# _ZN7way2obj4fillEii.exit.loopexit.loopexit
	movl	%r13d, way2+4380
	movl	%r12d, way2+4384
	movl	%r14d, way2+4376
.LBB20_20:	# _ZN7way2obj4fillEii.exit
	testb	%bl, %bl
	jne	.LBB20_45	# cond_next60
.LBB20_21:	# cond_true56
	movq	112(%rsp), %rax
	movq	$0, (%rax)
	movq	176(%rsp), %rax
	movl	$0, (%rax)
	xorl	%eax, %eax
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB20_22:	# cond_false.i
	movl	%eax, way2+4384
	movl	%r14d, way2+4376
	movl	$0, way2+4380
	movl	108(%rsp), %r15d
	decl	%r15d
	testl	%r15d, %r15d
	js	.LBB20_86	# bb255.i
.LBB20_23:	# bb203.preheader.i
	xorb	%al, %al
	movl	$101, %edi
	call	loop_enter
	testl	%r15d, %r15d
	movl	108(%rsp), %eax
	movl	$1, %ecx
	cmovns	%eax, %ecx
	movl	%ecx, 104(%rsp)
	decl	%eax
	movl	%eax, 108(%rsp)
	movl	$0, 100(%rsp)
.LBB20_24:	# bb203.i
	movslq	108(%rsp), %rax
	movslq	%r14d, %rcx
	shlq	$4, %rcx
	movq	way2+280(%rcx), %rcx
	movl	(%rcx,%rax,8), %ecx
	movl	%ecx, 84(%rsp)
	shlq	$4, %rbp
	movq	way2+280(%rbp), %rbp
	movl	4(%rbp,%rax,8), %eax
	movl	%eax, 88(%rsp)
	movl	way2+4424, %edx
	imull	%eax, %edx
	addl	%ecx, %edx
	movslq	%edx, %rbp
	movw	way2+16, %ax
	movq	way2+8, %rcx
	cmpw	%ax, (%rcx,%rbp,4)
	je	.LBB20_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB20_25:	# cond_next.i.i
	movw	%ax, (%rcx,%rbp,4)
	movl	88(%rsp), %eax
	movl	%eax, %ecx
	decl	%ecx
	xorl	%edx, %edx
	testl	%ecx, %ecx
	cmovs	%edx, %ecx
	movl	%ecx, 80(%rsp)
	movl	84(%rsp), %ecx
	movl	%ecx, %r14d
	decl	%r14d
	testl	%r14d, %r14d
	cmovs	%edx, %r14d
	movl	%r14d, 96(%rsp)
	incl	%ecx
	movl	way2+4408, %edx
	cmpl	%ecx, %edx
	cmovl	%edx, %ecx
	movl	%ecx, 56(%rsp)
	incl	%eax
	movl	way2+4412, %ecx
	movl	%ecx, 92(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB20_78	# cond_next.i.i.bb352.i.i_crit_edge
.LBB20_26:	# cond_true79.i.i
	movl	80(%rsp), %eax
	cmpl	92(%rsp), %eax
	jg	.LBB20_79	# cond_true79.i.i.bb358.i.i_crit_edge
.LBB20_27:	# cond_true79.i.i.bb343.preheader.i.i_crit_edge
	movb	$1, 63(%rsp)
	movl	$10000000, %r14d
.LBB20_28:	# bb343.preheader.i.i
	xorb	%al, %al
	movl	$102, %edi
	call	loop_enter
	movl	96(%rsp), %r15d
.LBB20_29:	# bb343.i.i
	cmpl	56(%rsp), %r15d
	jle	.LBB20_36	# bb86.preheader.i.i
.LBB20_30:	# bb343.i.i.bb349.i.i_crit_edge
	movl	%r14d, %ecx
	jmp	.LBB20_42	# bb349.i.i
.LBB20_31:	# bb86.i.i
	cmpl	84(%rsp), %r15d
	je	.LBB20_92	# cond_next340.i.i
.LBB20_32:	# cond_true100.i.i
	movl	way2+4424, %r12d
	movl	80(%rsp), %eax
	imull	%r12d, %eax
	addl	%r15d, %eax
	movslq	%eax, %rbp
	movw	way2+16, %ax
	movq	way2+8, %rcx
	cmpw	%ax, (%rcx,%rbp,4)
	jne	.LBB20_88	# cond_false.split.i.i
.LBB20_33:	# cond_true121.i.i
	movzwl	2(%rcx,%rbp,4), %ecx
	cmpl	%r14d, %ecx
	jge	.LBB20_92	# cond_next340.i.i
.LBB20_34:	# cond_true142.i.i
	incl	%r15d
	cmpl	56(%rsp), %r15d
	jg	.LBB20_41	# cond_true142.i.i.bb349.i.i_crit_edge
.LBB20_35:	# cond_true142.i.i.bb86.i.i_crit_edge
	movb	$0, 63(%rsp)
	movl	%ecx, %r14d
	jmp	.LBB20_31	# bb86.i.i
.LBB20_36:	# bb86.preheader.i.i
	xorb	%al, %al
	movl	$100, %edi
	call	loop_enter
	movl	80(%rsp), %eax
	cmpl	88(%rsp), %eax
	je	.LBB20_31	# bb86.i.i
.LBB20_37:	# bb86.us.i.i.preheader
	movl	way2+4424, %r12d
	movw	way2+16, %bx
	movq	way2+8, %rbp
	xorb	%al, %al
	movl	$97, %edi
	call	loop_enter
	movl	80(%rsp), %eax
	imull	%r12d, %eax
.LBB20_38:	# bb86.us.i.i
	leal	(%rax,%r15), %ecx
	movslq	%ecx, %rcx
	cmpw	%bx, (%rbp,%rcx,4)
	jne	.LBB20_88	# cond_false.split.i.i
.LBB20_39:	# cond_true121.us.i.i
	movzwl	2(%rbp,%rcx,4), %ecx
	cmpl	%r14d, %ecx
	jge	.LBB20_92	# cond_next340.i.i
.LBB20_40:	# cond_true142.us.i.i
	incl	%r15d
	cmpl	56(%rsp), %r15d
	jle	.LBB20_95	# cond_true142.us.i.i.bb86.us.i.i_crit_edge
.LBB20_41:	# cond_true142.i.i.bb349.i.i_crit_edge
	movb	$0, 63(%rsp)
.LBB20_42:	# bb349.i.i
	incl	80(%rsp)
	movl	92(%rsp), %eax
.LBB20_43:	# bb352.i.i
	movl	80(%rsp), %r14d
	cmpl	%eax, %r14d
	jg	.LBB20_80	# bb358.i.i
.LBB20_44:	# bb352.i.i.bb343.preheader.i.i_crit_edge
	movl	%eax, 92(%rsp)
	movl	%ecx, %r14d
	jmp	.LBB20_28	# bb343.preheader.i.i
.LBB20_45:	# cond_next60
	movl	way2+4424, %ebx
	movl	%ebx, 44(%rsp)
	leal	(,%rbx,8), %eax
	# ZERO-EXTEND 
	movl	%eax, %edi
	call	malloc
	testl	%ebx, %ebx
	movl	way2+4388, %ebx
	movl	way2+4392, %r14d
	movq	%rax, 16(%rsp)
	jne	.LBB20_47	# cond_next88.i
.LBB20_46:	# cond_true.i3
	movl	44(%rsp), %r15d
	movl	%r15d, %eax
	shll	$4, %eax
	# ZERO-EXTEND 
	movl	%eax, %edi
	call	malloc
	movq	%rax, %r12
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r12, %rdi
	movq	16(%rsp), %r13
	movq	%r13, %rsi
	call	memcpy
	movq	%r13, %rdi
	call	free
	addl	%r15d, %r15d
	movl	%r15d, 44(%rsp)
	movq	%r12, 16(%rsp)
.LBB20_47:	# cond_next88.i
	movq	16(%rsp), %rax
	movl	%ebx, (%rax)
	movl	%r14d, 4(%rax)
	movq	176(%rsp), %rax
	movl	$1, (%rax)
	xorb	%al, %al
	movb	%al, 51(%rsp)
	movl	$93, %edi
	call	loop_enter
	xorl	%eax, %eax
	movl	%eax, 32(%rsp)
	movl	%eax, %ebx
	movl	%eax, %r14d
	jmp	.LBB20_67	# cond_next496.i
.LBB20_48:	# bb113.i
	movq	176(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 28(%rsp)
	decl	%eax
	movslq	%eax, %rax
	movq	16(%rsp), %rcx
	movl	(%rcx,%rax,8), %edx
	movl	%edx, 24(%rsp)
	movl	%edx, %esi
	incl	%esi
	movl	way2+4408, %edi
	cmpl	%esi, %edi
	cmovl	%edi, %esi
	movl	%esi, 4(%rsp)
	movl	4(%rcx,%rax,8), %eax
	movl	%eax, %r15d
	decl	%r15d
	xorl	%ecx, %ecx
	testl	%r15d, %r15d
	cmovs	%ecx, %r15d
	decl	%edx
	testl	%edx, %edx
	cmovs	%ecx, %edx
	movl	%edx, 12(%rsp)
	incl	%eax
	movl	way2+4412, %ecx
	movl	%ecx, 8(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB20_93	# bb113.i.bb373.i_crit_edge
.LBB20_49:	# cond_true209.i
	cmpl	8(%rsp), %r15d
	jg	.LBB20_61	# bb379.i
.LBB20_50:	# cond_true209.i.bb364.preheader.i_crit_edge
	movl	$100000000, %r12d
.LBB20_51:	# bb364.preheader.i
	movl	12(%rsp), %eax
	cmpl	4(%rsp), %eax
	jg	.LBB20_59	# bb370.i
.LBB20_52:	# bb.nph.i
	movw	way2+16, %r13w
	movq	way2+8, %rbp
	xorb	%al, %al
	movl	$95, %edi
	call	loop_enter
	movl	24(%rsp), %eax
	decl	%eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovs	%ecx, %eax
	movl	%eax, %ecx
	negl	%ecx
	movl	%r15d, %edx
	imull	40(%rsp), %edx
.LBB20_53:	# bb217.i
	leal	(%rdx,%rax), %esi
	movslq	%esi, %rsi
	cmpw	%r13w, (%rbp,%rsi,4)
	jne	.LBB20_58	# cond_next361.i
.LBB20_54:	# cond_true238.i
	movzwl	2(%rbp,%rsi,4), %esi
	cmpl	%r12d, %esi
	jl	.LBB20_94	# cond_true238.i.cond_next361.i_crit_edge
.LBB20_55:	# cond_false.i8
	cmpl	%r12d, %esi
	jne	.LBB20_58	# cond_next361.i
.LBB20_56:	# cond_true295.i
	movl	way2+4396, %esi
	leal	(%rcx,%rsi), %edi
	subl	%ebx, %esi
	imull	%esi, %esi
	movl	way2+4400, %r8d
	movl	%r8d, %r9d
	subl	%r14d, %r9d
	imull	%r9d, %r9d
	addl	%esi, %r9d
	imull	%edi, %edi
	subl	%r15d, %r8d
	imull	%r8d, %r8d
	addl	%edi, %r8d
	cmpl	%r9d, %r8d
	jge	.LBB20_58	# cond_next361.i
.LBB20_57:	# cond_true355.i
	movl	%eax, %ebx
	movl	%r15d, %r14d
.LBB20_58:	# cond_next361.i
	decl	%ecx
	incl	%eax
	cmpl	4(%rsp), %eax
	jle	.LBB20_53	# bb217.i
.LBB20_59:	# bb370.i
	incl	%r15d
	movl	8(%rsp), %eax
.LBB20_60:	# bb373.i
	cmpl	%eax, %r15d
	jle	.LBB20_96	# bb373.i.bb364.preheader.i_crit_edge
.LBB20_61:	# bb379.i
	movl	28(%rsp), %eax
	incl	%eax
	movq	176(%rsp), %rcx
	movl	%eax, (%rcx)
	movl	36(%rsp), %eax
	cmpl	44(%rsp), %eax
	jne	.LBB20_63	# cond_next447.i
.LBB20_62:	# cond_true403.i
	movl	44(%rsp), %r15d
	leal	(%r15,%r15), %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	movq	16(%rsp), %r15
	movq	%r15, %rsi
	call	memcpy
	movq	%r15, %rdi
	call	free
	movq	%r13, 16(%rsp)
	movl	%r12d, 44(%rsp)
.LBB20_63:	# cond_next447.i
	movslq	36(%rsp), %rax
	movq	16(%rsp), %rcx
	movl	%ebx, (%rcx,%rax,8)
	movl	%r14d, 4(%rcx,%rax,8)
	cmpl	%ebx, way2+4396
	jne	.LBB20_66	# bb489.i
.LBB20_64:	# cond_true478.i
	cmpl	%r14d, way2+4400
	jne	.LBB20_66	# bb489.i
.LBB20_65:	# cond_true486.i
	movb	$1, 51(%rsp)
.LBB20_66:	# bb489.i
	incl	32(%rsp)
	cmpb	$0, 51(%rsp)
	jne	.LBB20_69	# bb508.i.cond_next523.i_crit_edge
.LBB20_67:	# cond_next496.i
	movl	way2+4424, %eax
	movl	%eax, 40(%rsp)
	movl	way2+4428, %ecx
	imull	%eax, %ecx
	movl	32(%rsp), %eax
	movl	%eax, %edx
	incl	%edx
	movl	%edx, 36(%rsp)
	cmpl	%eax, %ecx
	jg	.LBB20_48	# bb113.i
.LBB20_68:	# bb508.i
	cmpb	$0, 51(%rsp)
	je	.LBB20_74	# cond_true514.i
.LBB20_69:	# bb508.i.cond_next523.i_crit_edge
	incl	32(%rsp)
.LBB20_70:	# cond_next523.i
	movl	32(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$3, %rdi
	call	malloc
	movq	112(%rsp), %rcx
	movq	%rax, (%rcx)
	decl	%ebx
	testl	%ebx, %ebx
	js	.LBB20_73	# bb574.i
.LBB20_71:	# bb534.preheader.i
	xorb	%al, %al
	movl	$96, %edi
	call	loop_enter
	testl	%ebx, %ebx
	movl	$1, %eax
	movl	32(%rsp), %ecx
	cmovns	%ecx, %eax
	decl	%ecx
	movl	%ecx, 32(%rsp)
	xorl	%ecx, %ecx
.LBB20_72:	# bb534.i
	movl	32(%rsp), %edx
	movslq	%edx, %rsi
	movq	16(%rsp), %rdi
	movl	4(%rdi,%rsi,8), %r8d
	movl	(%rdi,%rsi,8), %esi
	movslq	%ecx, %rdi
	movq	112(%rsp), %r9
	movq	(%r9), %r9
	movl	%esi, (%r9,%rdi,8)
	movl	%r8d, 4(%r9,%rdi,8)
	decl	%edx
	movl	%edx, 32(%rsp)
	incl	%ecx
	cmpl	%eax, %ecx
	jne	.LBB20_72	# bb534.i
.LBB20_73:	# bb574.i
	movq	16(%rsp), %rdi
	call	free
	movl	$1, %ecx
	jmp	.LBB20_75	# bb574.i
.LBB20_74:	# cond_true514.i
	movq	16(%rsp), %rdi
	call	free
	movq	112(%rsp), %rcx
	movq	$0, (%rcx)
	movq	176(%rsp), %rdx
	movl	$0, (%rdx)
	movq	$0, (%rcx)
	movl	$0, (%rdx)
	xorl	%ecx, %ecx
.LBB20_75:	# bb574.i
	movl	%ecx, %eax
.LBB20_76:	# bb574.i
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB20_77:	# cond_true
	movl	$8, %edi
	call	malloc
	movq	112(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	176(%rsp), %rcx
	movl	$0, (%rcx)
	movl	$1, %eax
	jmp	.LBB20_76	# bb574.i
.LBB20_78:	# cond_next.i.i.bb352.i.i_crit_edge
	movb	$1, 63(%rsp)
	movl	$10000000, %ecx
	jmp	.LBB20_43	# bb352.i.i
.LBB20_79:	# cond_true79.i.i.bb358.i.i_crit_edge
	movb	$1, 63(%rsp)
	movl	$10000000, %ecx
.LBB20_80:	# bb358.i.i
	movl	way2+4424, %eax
	imull	88(%rsp), %eax
	addl	84(%rsp), %eax
	movslq	%eax, %rbp
	movq	way2, %rax
	movzbq	(%rax,%rbp), %rax
	movzbw	way2+18(%rax), %ax
	cmpb	$0, 63(%rsp)
	movq	way2+8, %rdx
	jne	.LBB20_82	# cond_false413.i.i
.LBB20_81:	# cond_true364.i.i
	addw	%cx, %ax
.LBB20_82:	# cond_false413.i.i
	movw	%ax, 2(%rdx,%rbp,4)
	movl	84(%rsp), %eax
	cmpl	%eax, way2+4388
	jne	.LBB20_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB20_83:	# cond_true467.i.i
	movl	88(%rsp), %eax
	cmpl	%eax, way2+4392
	jne	.LBB20_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB20_84:	# cond_true475.i.i
	movb	$1, way2+4404
.LBB20_85:	# _ZN7way2obj12releasepointEii.exit.i
	decl	108(%rsp)
	movl	100(%rsp), %eax
	incl	%eax
	movl	%eax, 100(%rsp)
	cmpl	104(%rsp), %eax
	movl	way2+4376, %r14d
	movslq	%r14d, %rbp
	jne	.LBB20_24	# bb203.i
.LBB20_86:	# bb255.i
	shlq	$4, %rbp
	movl	$0, way2+288(%rbp)
	movl	$1, %r15d
	addl	way2+4384, %r15d
	movl	%r15d, way2+4384
	movb	way2+4404, %bl
	testb	%bl, %bl
	jne	.LBB20_20	# _ZN7way2obj4fillEii.exit
.LBB20_87:	# bb255.i.cond_next282.i.outer_crit_edge
	movl	%r15d, %r12d
	jmp	.LBB20_12	# cond_next282.i.outer
.LBB20_88:	# cond_false.split.i.i
	imull	80(%rsp), %r12d
	addl	%r15d, %r12d
	movslq	%r12d, %rbp
	movq	way2, %rax
	movzbq	(%rax,%rbp), %rbp
	movb	way2+18(%rbp), %bl
	testb	%bl, %bl
	je	.LBB20_92	# cond_next340.i.i
.LBB20_89:	# cond_true197.critedge.i.i
	movzbl	%bl, %eax
	addl	way2+4384, %eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	shrl	$24, %ecx
	addl	%eax, %ecx
	andl	$4294967040, %ecx
	subl	%ecx, %eax
	movslq	%eax, %rbp
	movq	%rbp, %rax
	shlq	$4, %rax
	movl	way2+292(%rax), %r12d
	cmpl	%r12d, way2+288(%rax)
	leaq	way2+288(%rax), %rcx
	movq	%rcx, 72(%rsp)
	leaq	way2+292(%rax), %rax
	movq	%rax, 64(%rsp)
	jne	.LBB20_91	# cond_next310.i.i
.LBB20_90:	# cond_true264.i.i
	leal	(%r12,%r12), %eax
	movl	%eax, 52(%rsp)
	# ZERO-EXTEND 
	movl	%eax, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbx
	movq	%rbp, %r13
	shlq	$4, %r13
	movq	way2+280(%r13), %rsi
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbx, %rdi
	call	memcpy
	movq	way2+280(%r13), %rdi
	call	free
	movq	%rbx, way2+280(%r13)
	movq	64(%rsp), %rax
	movl	52(%rsp), %ecx
	movl	%ecx, (%rax)
.LBB20_91:	# cond_next310.i.i
	shlq	$4, %rbp
	movq	way2+280(%rbp), %rbp
	movq	72(%rsp), %rax
	movslq	(%rax), %rcx
	movl	%r15d, (%rbp,%rcx,8)
	movl	80(%rsp), %r12d
	movl	%r12d, 4(%rbp,%rcx,8)
	incl	(%rax)
.LBB20_92:	# cond_next340.i.i
	incl	%r15d
	jmp	.LBB20_29	# bb343.i.i
.LBB20_93:	# bb113.i.bb373.i_crit_edge
	movl	$100000000, %r12d
	jmp	.LBB20_60	# bb373.i
.LBB20_94:	# cond_true238.i.cond_next361.i_crit_edge
	movl	%eax, %ebx
	movl	%r15d, %r14d
	movl	%esi, %r12d
	jmp	.LBB20_58	# cond_next361.i
.LBB20_95:	# cond_true142.us.i.i.bb86.us.i.i_crit_edge
	movb	$0, 63(%rsp)
	movl	%ecx, %r14d
	jmp	.LBB20_38	# bb86.us.i.i
.LBB20_96:	# bb373.i.bb364.preheader.i_crit_edge
	movl	%eax, 8(%rsp)
	jmp	.LBB20_51	# bb364.preheader.i
	.size	_ZN7way2obj9createwayEiiiiPhRP6pointtRi, .-_ZN7way2obj9createwayEiiiiPhRP6pointtRi


	.align	16
	.type	_ZN6wayobj7destroyEv,@function
_ZN6wayobj7destroyEv:
	subq	$8, %rsp
	xorb	%al, %al
	movl	$21, %edi
	call	func_enter
	movq	way.19, %rdi
	testq	%rdi, %rdi
	je	.LBB21_2	# cond_next
.LBB21_1:	# cond_true
	call	_ZdaPv
.LBB21_2:	# cond_next
	movq	way.18, %rdi
	testq	%rdi, %rdi
	je	.LBB21_4	# cond_next20
.LBB21_3:	# cond_true15
	call	_ZdaPv
.LBB21_4:	# cond_next20
	movq	way.17, %rdi
	testq	%rdi, %rdi
	je	.LBB21_6	# cond_next32
.LBB21_5:	# cond_true27
	call	_ZdaPv
.LBB21_6:	# cond_next32
	movq	way.16, %rdi
	testq	%rdi, %rdi
	je	.LBB21_8	# UnifiedReturnBlock
.LBB21_7:	# cond_true40
	call	_ZdaPv
.LBB21_8:	# UnifiedReturnBlock
	addq	$8, %rsp
	ret
	.size	_ZN6wayobj7destroyEv, .-_ZN6wayobj7destroyEv


	.align	16
	.type	_ZN6wayobj6createE17createwaymnginfot,@function
_ZN6wayobj6createE17createwaymnginfot:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movl	%edx, %r15d
	movl	%ecx, %r12d
	movl	%r8d, %r13d
	movl	%r9d, %ebp
	xorb	%al, %al
	movl	$22, %edi
	call	func_enter
	movl	%ebx, 8(%rsp)
	movl	%r14d, 12(%rsp)
	movl	%r15d, 16(%rsp)
	movl	%r12d, 20(%rsp)
	movl	%r13d, 24(%rsp)
	movl	%ebp, 28(%rsp)
	movl	96(%rsp), %eax
	movl	%eax, 32(%rsp)
	movl	104(%rsp), %eax
	movl	%eax, 36(%rsp)
	movl	24(%rsp), %eax
	movl	28(%rsp), %edx
	movl	%eax, way.0
	movl	%edx, way.1
	movl	%eax, way.2
	movl	$1, %ebx
	movb	%al, %cl
	movl	%ebx, %eax
	shll	%cl, %eax
	movl	%eax, %esi
	decl	%esi
	movl	%esi, way.3
	movb	%dl, %cl
	movl	%ebx, %edx
	shll	%cl, %edx
	movl	%edx, %esi
	decl	%esi
	movl	%esi, way.4
	leal	-2(%rax), %esi
	movl	%esi, way.5
	leal	-2(%rdx), %esi
	movl	%esi, way.6
	movl	%eax, way.7
	movl	%edx, way.8
	shll	%cl, %eax
	movslq	%eax, %r14
	leaq	(%r14,%r14), %rdi
	call	_Znam
	movq	%rax, way.16
	movq	%r14, %rdi
	shlq	$2, %rdi
	call	_Znam
	movq	%rax, way.17
	movb	way.0, %al
	movb	way.1, %dl
	movq	way.16, %rdi
	movb	%al, %cl
	shll	%cl, %ebx
	movb	%dl, %cl
	shll	%cl, %ebx
	movslq	%ebx, %rbx
	leaq	(%rbx,%rbx), %rdx
	xorl	%r14d, %r14d
	movl	%r14d, %esi
	call	memset
	movq	way.17, %rdi
	movq	%rbx, %rdx
	shlq	$2, %rdx
	movl	%r14d, %esi
	call	memset
	movl	way.8, %ebx
	testl	%ebx, %ebx
	jle	.LBB22_6	# bb293
.LBB22_1:	# bb.preheader
	movl	way.2, %r14d
	movq	way.16, %r15
	xorb	%al, %al
	movl	$103, %edi
	call	loop_enter
	xorl	%eax, %eax
.LBB22_2:	# bb
	movb	%r14b, %cl
	movl	%eax, %edx
	shll	%cl, %edx
	movslq	%edx, %rcx
	movw	$65535, (%r15,%rcx,2)
	incl	%eax
	cmpl	%eax, %ebx
	jg	.LBB22_2	# bb
.LBB22_3:	# bb275
	testl	%ebx, %ebx
	jle	.LBB22_6	# bb293
.LBB22_4:	# bb258.preheader
	movl	way.3, %r12d
	movl	way.2, %r15d
	movq	way.16, %r14
	xorb	%al, %al
	movl	$105, %edi
	call	loop_enter
	xorl	%eax, %eax
.LBB22_5:	# bb258
	movb	%r15b, %cl
	movl	%eax, %edx
	shll	%cl, %edx
	orl	%r12d, %edx
	movslq	%edx, %rcx
	movw	$65535, (%r14,%rcx,2)
	incl	%eax
	cmpl	%eax, %ebx
	jg	.LBB22_5	# bb258
.LBB22_6:	# bb293
	movl	way.7, %r15d
	testl	%r15d, %r15d
	jle	.LBB22_12	# bb327
.LBB22_7:	# bb284.preheader
	movq	way.16, %r14
	xorb	%al, %al
	movl	$104, %edi
	call	loop_enter
	xorl	%eax, %eax
.LBB22_8:	# bb284
	movslq	%eax, %rcx
	movw	$65535, (%r14,%rcx,2)
	incl	%eax
	cmpl	%eax, %r15d
	jg	.LBB22_8	# bb284
.LBB22_9:	# bb319.preheader
	testl	%r15d, %r15d
	jle	.LBB22_12	# bb327
.LBB22_10:	# bb302.preheader
	movb	way.2, %r13b
	movl	way.4, %r12d
	movq	way.16, %r14
	xorb	%al, %al
	movl	$106, %edi
	call	loop_enter
	movb	%r13b, %cl
	shll	%cl, %r12d
	xorl	%eax, %eax
.LBB22_11:	# bb302
	movl	%r12d, %ecx
	orl	%eax, %ecx
	movslq	%ecx, %rcx
	movw	$65535, (%r14,%rcx,2)
	incl	%eax
	cmpl	%eax, %r15d
	jg	.LBB22_11	# bb302
.LBB22_12:	# bb327
	addl	%r15d, %ebx
	imull	$12, %ebx, %eax
	movl	%eax, way.20
	movslq	%eax, %rdi
	shlq	$2, %rdi
	call	_Znam
	movq	%rax, way.18
	movslq	way.20, %rdi
	shlq	$2, %rdi
	call	_Znam
	movq	%rax, way.19
	movl	$1, %eax
	movb	way.2, %dl
	movb	%dl, %cl
	shll	%cl, %eax
	decl	%eax
	movl	%eax, way.21
	movw	$0, way.25
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN6wayobj6createE17createwaymnginfot, .-_ZN6wayobj6createE17createwaymnginfot


	.section	.rodata.cst4,"aM",@progbits,4
	.align	8
.LCPI23_1:					#  float
	.long	1056964608	# float 0.5
.LCPI23_2:					#  float
	.long	940205271	# float 3.29957e-05
.LCPI23_3:					#  float
	.long	940216657	# float 3.30371e-05
.LCPI23_4:					#  float
	.long	940200485	# float 3.29783e-05
.LCPI23_5:					#  float
	.long	2147483648	# float -0
.LCPI23_6:					#  float
	.long	1065353216	# float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI23_0:					#  double
	.quad	4604418534313441775	# double value: 0.693147
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
	subq	$5416, %rsp
	movl	%edi, %ebx
	movq	%rsi, %r14
	xorb	%al, %al
	movl	$23, %edi
	call	func_enter
	leaq	.str13, %rdi
	call	puts
	leaq	.str14, %rdi
	call	puts
	cmpl	$2, %ebx
	je	.LBB23_4	# cond_next
.LBB23_1:	# cond_true
	leaq	.str15, %rdi
.LBB23_2:	# cond_true
	call	puts
	movl	$1, %eax
.LBB23_3:	# cond_true
	addq	$5416, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB23_4:	# cond_next
	movq	8(%r14), %rdi
	leaq	.str16, %rsi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.LBB23_90	# cond_true37
.LBB23_5:	# cond_next41
	xorb	%r14b, %r14b
	leaq	1192(%rsp), %r15
	leaq	.str18, %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movb	%r14b, %al
	call	fscanf
	leaq	.str19, %r12
	leaq	5288(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5292(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5296(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5300(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5304(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5308(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5312(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5316(%rsp), %rdx
	leaq	.str20, %rsi
	movq	%rbx, %rdi
	movb	%r14b, %al
	call	fscanf
	leaq	5320(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5324(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	leaq	5328(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movq	%rbx, %rdi
	call	fclose
	leaq	.str21, %rdi
	call	puts
	movq	%r15, %rdi
	call	puts
	call	_ZN9regmngobj6createEv
	movq	$regmng, regway+48
	movl	$1, %ebx
	addl	regmng+400, %ebx
	movl	%ebx, regway+20
	movl	$0, regway+16
	# ZERO-EXTEND 
	movl	%ebx, %r12d
	shlq	$3, %r12
	movq	%r12, %rdi
	call	malloc
	movq	%rax, regway+8
	movl	%ebx, regway+36
	movl	$0, regway+32
	movq	%r12, %rdi
	call	malloc
	movq	%rax, regway+24
	xorl	%ecx, %ecx
	movq	%r15, %rdi
	movl	%ecx, %esi
	movb	%r14b, %al
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, 128(%rsp)
	je	.LBB23_13	# _ZN6wayobj7loadmapEPKc.exit
.LBB23_6:	# cond_next.i
	movl	$1, %ebx
	leaq	5376(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5377(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5378(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5379(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5368(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5369(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5370(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	leaq	5371(%rsp), %rsi
	movl	128(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	5368(%rsp), %ebx
	movl	5376(%rsp), %eax
	movl	%eax, 132(%rsp)
	movl	$3296329728, 5336(%rsp)
	movl	$3296329728, 5344(%rsp)
	movl	$1148846080, 5340(%rsp)
	movl	$1148846080, 5348(%rsp)
	cvtsi2sd	%eax, %xmm0
	call	log
	divsd	.LCPI23_0(%rip), %xmm0
	cvtss2sd	.LCPI23_1(%rip), %xmm1
	movsd	%xmm1, 136(%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5352(%rsp)
	cvtsi2sd	%ebx, %xmm0
	call	log
	divsd	.LCPI23_0(%rip), %xmm0
	addsd	136(%rsp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5356(%rsp)
	movl	$0, 5360(%rsp)
	movl	$1203982336, 5364(%rsp)
	movl	5348(%rsp), %eax
	movl	5340(%rsp), %r10d
	movl	5352(%rsp), %r11d
	movl	5360(%rsp), %r14d
	movl	5356(%rsp), %r15d
	movl	5344(%rsp), %r12d
	movl	5336(%rsp), %r13d
	movl	%r14d, (%rsp)
	movl	$1203982336, 8(%rsp)
	movl	%r13d, %edi
	movl	%r10d, %esi
	movl	%r12d, %edx
	movl	%eax, %ecx
	movl	%r11d, %r8d
	movl	%r15d, %r9d
	call	_ZN6wayobj6createE17createwaymnginfot
	imull	132(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	call	malloc
	movq	%rax, %r14
	movslq	%ebx, %rdx
	movl	128(%rsp), %edi
	movq	%r14, %rsi
	call	read
	movl	way.4, %ebx
	cmpl	$2, %ebx
	jl	.LBB23_12	# bb152.i
.LBB23_7:	# bb133.preheader.i
	movl	way.2, %r15d
	movq	way.16, %r12
	movl	way.3, %r13d
	xorb	%al, %al
	movl	$111, %edi
	call	loop_enter
	movl	$1, %ebp
.LBB23_8:	# bb133.outer.i
	cmpl	$2, %r13d
	jl	.LBB23_11	# bb144.i
.LBB23_9:	# bb106.i.preheader
	xorb	%al, %al
	movl	$112, %edi
	call	loop_enter
	movb	%r15b, %cl
	movl	%ebp, %eax
	shll	%cl, %eax
	movl	$1, %ecx
.LBB23_10:	# bb106.i
	movl	%eax, %edx
	orl	%ecx, %edx
	movslq	%edx, %rdx
	movzbw	(%r14,%rdx), %si
	movw	%si, (%r12,%rdx,2)
	incl	%ecx
	cmpl	%ecx, %r13d
	jg	.LBB23_10	# bb106.i
.LBB23_11:	# bb144.i
	incl	%ebp
	cmpl	%ebp, %ebx
	jg	.LBB23_8	# bb133.outer.i
.LBB23_12:	# bb152.i
	movq	%r14, %rdi
	call	free
	movl	128(%rsp), %edi
	call	close
.LBB23_13:	# _ZN6wayobj7loadmapEPKc.exit
	xorb	%al, %al
	xorl	%esi, %esi
	leaq	1192(%rsp), %rdi
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, %ebx
	je	.LBB23_17	# _ZN9regmngobj7loadmapEPKc.exit
.LBB23_14:	# cond_next.i30
	movl	$1, %r14d
	leaq	regmng+324, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+325, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+326, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+327, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+328, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+329, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+330, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	regmng+331, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	regmng+324, %r14d
	movl	%r14d, regmng+332
	movl	regmng+328, %eax
	movl	%eax, regmng+336
	movl	%r14d, %ecx
	decl	%ecx
	movl	%ecx, regmng+316
	imull	%eax, %r14d
	decl	%eax
	movl	%eax, regmng+320
	# ZERO-EXTEND 
	movl	%r14d, %r15d
	leaq	(,%r15,8), %rdi
	call	malloc
	movq	%rax, regmng+32
	movq	%r15, %rdi
	call	malloc
	movq	%rax, regmng+40
	movq	%r15, %rdi
	addq	%rdi, %rdi
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, regmng
	movslq	%r14d, %rcx
	addq	%rcx, %rcx
	movq	%rcx, %rdx
	andq	$2, %rdx
	shrq	$2, %rcx
	xorl	%r14d, %r14d
	movl	%r14d, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movw	$0, regmng+8
	movq	regmng+40, %rsi
	movl	regmng+336, %eax
	movl	regmng+332, %ecx
	imull	%ecx, %eax
	movslq	%eax, %rdx
	movl	%ebx, %edi
	call	read
	xorb	%al, %al
	movl	$110, %ecx
	movl	%ecx, %edi
	call	loop_enter
.LBB23_15:	# bb.i
	movslq	%r14d, %rax
	movb	$0, regmng+48(%rax)
	incl	%r14d
	cmpl	$256, %r14d
	jne	.LBB23_15	# bb.i
.LBB23_16:	# bb164.i
	movb	$1, regmng+48
	movl	%ebx, %edi
	call	close
.LBB23_17:	# _ZN9regmngobj7loadmapEPKc.exit
	movl	5288(%rsp), %edi
	call	_ZN9regmngobj13createregionsEi
	xorl	%edi, %edi
	call	time
	movl	5292(%rsp), %ebx
	xorb	%al, %al
	movl	$114, %ecx
	movl	%ecx, %edi
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB23_91	# _ZN9regmngobj7loadmapEPKc.exit.bb183_crit_edge
.LBB23_18:	# _ZN9regmngobj7loadmapEPKc.exit.bb_crit_edge
	xorl	%eax, %eax
	movq	%rax, 120(%rsp)
	xorl	%ebx, %ebx
	movq	%rax, 104(%rsp)
.LBB23_19:	# bb
	movl	$0, 1164(%rsp)
	movq	$0, 1168(%rsp)
	movl	y3rnd, %eax
	imull	$170, %eax, %ecx
	movl	$2320639257, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	movl	y1rnd, %eax
	imull	$171, %eax, %r8d
	movl	$1162389643, %r9d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %r10d
	movl	y2rnd, %eax
	imull	$172, %eax, %r11d
	movl	$1160932197, %r14d
	movl	%r11d, %eax
	imull	%r14d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$14, %edi
	addl	%eax, %edi
	imull	$30323, %edi, %eax
	subl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 1188(%rsp)
	imull	$171, %r8d, %r8d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r8d, y1rnd
	imull	$172, %r11d, %r9d
	movl	%r9d, %eax
	imull	%r14d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	movl	%r9d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%esi
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r8d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %esi
	incl	%esi
	movl	%esi, 1184(%rsp)
	leaq	1184(%rsp), %rcx
	leaq	1188(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB23_92	# bb.cond_next159_crit_edge
.LBB23_20:	# cond_true132
	movl	y3rnd, %eax
	imull	$170, %eax, %ecx
	movl	$2320639257, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	movl	y1rnd, %eax
	imull	$171, %eax, %r8d
	movl	$1162389643, %r9d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %r10d
	movl	y2rnd, %eax
	imull	$172, %eax, %r11d
	movl	$1160932197, %r14d
	movl	%r11d, %eax
	imull	%r14d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$14, %edi
	addl	%eax, %edi
	imull	$30323, %edi, %eax
	subl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 1180(%rsp)
	imull	$171, %r8d, %r8d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r8d, y1rnd
	imull	$172, %r11d, %r9d
	movl	%r9d, %eax
	imull	%r14d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	movl	%r9d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%esi
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r8d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %esi
	incl	%esi
	movl	%esi, 1176(%rsp)
	leaq	1176(%rsp), %rcx
	leaq	1180(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB23_93	# cond_true132.cond_next150_crit_edge
.LBB23_21:	# cond_true144
	movl	1188(%rsp), %edi
	movl	1180(%rsp), %edx
	movl	1184(%rsp), %esi
	movl	1176(%rsp), %ecx
	leaq	1164(%rsp), %r9
	leaq	1168(%rsp), %r8
	call	_ZN6wayobj9createwayEiiiiRP8point16tRi
.LBB23_22:	# cond_next150
	movb	%al, %r14b
	movq	1168(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB23_24	# cond_next159
.LBB23_23:	# cond_true155
	call	free
.LBB23_24:	# cond_next159
	testb	%r14b, %r14b
	je	.LBB23_26	# bb176
.LBB23_25:	# cond_true162
	movslq	1164(%rsp), %rax
	addq	104(%rsp), %rax
	incq	120(%rsp)
	movq	%rax, 104(%rsp)
.LBB23_26:	# bb176
	incl	%ebx
	cmpl	%ebx, 5292(%rsp)
	jg	.LBB23_19	# bb
.LBB23_27:	# bb183
	xorl	%edi, %edi
	call	time
	movl	5304(%rsp), %ebx
	xorb	%al, %al
	movl	$120, %ecx
	movl	%ecx, %edi
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB23_94	# bb183.bb278_crit_edge
.LBB23_28:	# bb183.bb186_crit_edge
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)
	xorl	%ebx, %ebx
	movq	%rax, 88(%rsp)
.LBB23_29:	# bb186
	movl	y1rnd, %eax
	imull	$171, %eax, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	movl	$4294967295, %esi
	addl	regmng+400, %esi
	movl	y3rnd, %r8d
	movl	y2rnd, %eax
	movl	%edi, y1rnd
	imull	$172, %eax, %r9d
	movl	$1160932197, %r10d
	movl	%r9d, %eax
	imull	%r10d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%r10d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	movl	%r11d, y2rnd
	imull	$170, %r8d, %r8d
	movl	$2320639257, %r10d
	movl	%r8d, %eax
	imull	%r10d
	addl	%r8d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r8d
	imull	$170, %r8d, %r14d
	movl	%r14d, %eax
	imull	%r10d
	addl	%r14d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r14d
	movl	%r14d, y3rnd
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%r14d, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvtsi2ss	%r9d, %xmm0
	mulss	%xmm1, %xmm0
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	cvtsi2ss	%r8d, %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	cvtsi2ss	%esi, %xmm0
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rdi
	cmpl	$0, 48(%rdi)
	je	.LBB23_35	# bb271
.LBB23_30:	# cond_next220
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	movslq	%eax, %rax
	movq	(%rcx,%rax,8), %rsi
	cmpl	$0, 48(%rsi)
	je	.LBB23_35	# bb271
.LBB23_31:	# cond_next242
	movq	$0, 1152(%rsp)
	movl	$0, 1148(%rsp)
	leaq	1152(%rsp), %rdx
	leaq	1148(%rsp), %rcx
	call	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri
	movq	1152(%rsp), %rdi
	testq	%rdi, %rdi
	movb	%al, %r14b
	je	.LBB23_33	# cond_next253
.LBB23_32:	# cond_true250
	call	free
.LBB23_33:	# cond_next253
	testb	%r14b, %r14b
	je	.LBB23_35	# bb271
.LBB23_34:	# cond_true256
	movslq	1148(%rsp), %rax
	addq	88(%rsp), %rax
	incq	112(%rsp)
	movq	%rax, 88(%rsp)
.LBB23_35:	# bb271
	incl	%ebx
	cmpl	%ebx, 5304(%rsp)
	jg	.LBB23_29	# bb186
.LBB23_36:	# bb278
	movq	regway+8, %rdi
	call	free
	movq	regway+24, %rdi
	call	free
	call	_ZN9regmngobj7destroyEv
	call	_ZN6wayobj7destroyEv
	movq	$0, way2+8
	movq	$0, way2
	xorb	%cl, %cl
	xorl	%edx, %edx
	leaq	1192(%rsp), %rdi
	movl	%edx, %esi
	movb	%cl, %al
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, %ebx
	je	.LBB23_40	# _ZN7way2obj7loadmapEPKc.exit
.LBB23_37:	# cond_next.i580
	movl	$1, %r14d
	leaq	way2+4416, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4417, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4418, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4419, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4420, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4421, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4422, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	leaq	way2+4423, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	way2+4416, %r14d
	movl	%r14d, way2+4424
	movl	way2+4420, %r15d
	movl	%r15d, way2+4428
	xorb	%al, %al
	movl	$109, %ecx
	movl	%ecx, %edi
	call	loop_enter
	xorl	%r12d, %r12d
.LBB23_38:	# bb.i586
	movslq	%r12d, %r13
	shlq	$4, %r13
	movl	$128, way2+292(%r13)
	movl	$0, way2+288(%r13)
	movl	$1024, %edi
	call	malloc
	movq	%rax, way2+280(%r13)
	incl	%r12d
	cmpl	$256, %r12d
	jne	.LBB23_38	# bb.i586
.LBB23_39:	# bb110.i
	movl	%r15d, %r12d
	imull	%r14d, %r12d
	decl	%r14d
	movl	%r14d, way2+4408
	decl	%r15d
	movl	%r15d, way2+4412
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, way2+8
	movslq	%r12d, %rcx
	shlq	$2, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movw	$0, way2+16
	movl	way2+4428, %r14d
	movl	way2+4424, %eax
	imull	%eax, %r14d
	# ZERO-EXTEND 
	movl	%r14d, %edi
	call	malloc
	movq	%rax, way2
	movslq	%r14d, %rdx
	movl	%ebx, %edi
	movq	%rax, %rsi
	call	read
	movl	%ebx, %edi
	call	close
.LBB23_40:	# _ZN7way2obj7loadmapEPKc.exit
	cmpl	$0, 5296(%rsp)
	jle	.LBB23_95	# _ZN7way2obj7loadmapEPKc.exit.bb445_crit_edge
.LBB23_41:	# bb299.preheader
	xorb	%al, %al
	movl	$119, %edi
	call	loop_enter
	xorl	%ebx, %ebx
	movq	%rbx, 96(%rsp)
	xorl	%r14d, %r14d
.LBB23_42:	# bb299.outer
	xorb	%al, %al
	movl	$115, %edi
	call	loop_enter
	xorl	%eax, %eax
.LBB23_43:	# bb291
	movslq	%eax, %rcx
	movb	%al, 876(%rsp,%rcx)
	incl	%eax
	cmpl	$256, %eax
	jne	.LBB23_43	# bb291
.LBB23_44:	# bb304
	movb	$255, 876(%rsp)
	movb	$1, 877(%rsp)
	movb	$255, 878(%rsp)
	movl	$0, 1132(%rsp)
	movq	$0, 1136(%rsp)
	movl	y1rnd, %eax
	imull	$171, %eax, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	movl	$4294967295, %esi
	addl	way2+4428, %esi
	movl	way2+4424, %r8d
	movl	y3rnd, %r9d
	movl	y2rnd, %eax
	movl	%edi, y1rnd
	imull	$172, %eax, %r10d
	movl	$1160932197, %r11d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r10d
	imull	$172, %r10d, %r15d
	movl	%r15d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r15d
	movl	%r15d, y2rnd
	imull	$170, %r9d, %r9d
	movl	$2320639257, %r11d
	movl	%r9d, %eax
	imull	%r11d
	addl	%r9d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r9d
	imull	$170, %r9d, %r12d
	movl	%r12d, %eax
	imull	%r11d
	addl	%r12d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r12d
	movl	%r12d, y3rnd
	cvtsi2ss	%r15d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	%esi, %xmm0
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %esi
	incl	%esi
	movl	%r8d, %eax
	imull	%esi, %eax
	cvtsi2ss	%r10d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %ecx
	cvtsi2ss	%ecx, %xmm2
	subss	%xmm2, %xmm1
	decl	%r8d
	cvtsi2ss	%r8d, %xmm2
	mulss	%xmm2, %xmm1
	cvttss2si	%xmm1, %r10d
	leal	1(%rax,%r10), %eax
	movslq	%eax, %rax
	movq	way2, %rcx
	movzbq	(%rcx,%rax), %rax
	incl	%r10d
	cmpb	$0, 876(%rsp,%rax)
	je	.LBB23_47	# bb438
.LBB23_45:	# cond_true357
	imull	$171, %edi, %edi
	movl	$1162389643, %ecx
	movl	%edi, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	imull	$171, %edi, %r8d
	movl	%r8d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	movl	%r8d, y1rnd
	imull	$172, %r15d, %r9d
	movl	$1160932197, %ecx
	movl	%r9d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	movl	%r11d, y2rnd
	imull	$170, %r12d, %r15d
	movl	$2320639257, %ecx
	movl	%r15d, %eax
	imull	%ecx
	addl	%r15d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r15d
	imull	$170, %r15d, %r12d
	movl	%r12d, %eax
	imull	%ecx
	addl	%r12d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r12d
	movl	%r12d, y3rnd
	leaq	1132(%rsp), %rax
	movq	%rax, (%rsp)
	cvtsi2ss	%r11d, %xmm1
	movss	.LCPI23_2(%rip), %xmm3
	mulss	%xmm3, %xmm1
	cvtsi2ss	%r8d, %xmm4
	movss	.LCPI23_3(%rip), %xmm5
	mulss	%xmm5, %xmm4
	addss	%xmm1, %xmm4
	cvtsi2ss	%r12d, %xmm1
	movss	.LCPI23_4(%rip), %xmm6
	mulss	%xmm6, %xmm1
	addss	%xmm1, %xmm4
	cvttss2si	%xmm4, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm4
	mulss	%xmm4, %xmm0
	cvttss2si	%xmm0, %ecx
	incl	%ecx
	cvtsi2ss	%r9d, %xmm0
	mulss	%xmm3, %xmm0
	cvtsi2ss	%edi, %xmm1
	mulss	%xmm5, %xmm1
	addss	%xmm0, %xmm1
	cvtsi2ss	%r15d, %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	%xmm1, %xmm2
	cvttss2si	%xmm2, %edx
	incl	%edx
	leaq	1136(%rsp), %r9
	leaq	876(%rsp), %r8
	movl	%r10d, %edi
	call	_ZN7way2obj9createwayEiiiiPhRP6pointtRi
	movb	%al, %r15b
	movq	1136(%rsp), %rdi
	call	free
	testb	%r15b, %r15b
	je	.LBB23_47	# bb438
.LBB23_46:	# cond_true424
	movslq	1132(%rsp), %rax
	addq	%rbx, %rax
	incq	96(%rsp)
	movq	%rax, %rbx
.LBB23_47:	# bb438
	incl	%r14d
	cmpl	%r14d, 5296(%rsp)
	jg	.LBB23_42	# bb299.outer
.LBB23_48:	# bb445
	xorl	%edi, %edi
	call	time
	cmpl	$0, 5300(%rsp)
	jle	.LBB23_96	# bb445.bb616_crit_edge
.LBB23_49:	# bb466.preheader
	xorb	%al, %al
	movl	$122, %edi
	call	loop_enter
	xorl	%r14d, %r14d
	xorl	%r12d, %r12d
	movq	%r14, %r15
.LBB23_50:	# bb466.outer
	xorb	%al, %al
	movl	$123, %edi
	call	loop_enter
	xorl	%eax, %eax
.LBB23_51:	# bb458
	movslq	%eax, %rcx
	movb	%al, 604(%rsp,%rcx)
	incl	%eax
	cmpl	$256, %eax
	jne	.LBB23_51	# bb458
.LBB23_52:	# bb471
	movb	$1, 604(%rsp)
	movb	$255, 605(%rsp)
	movb	$255, 606(%rsp)
	movl	$0, 860(%rsp)
	movq	$0, 864(%rsp)
	movl	y1rnd, %eax
	imull	$171, %eax, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	movl	$4294967294, %esi
	addl	way2+4428, %esi
	movl	way2+4424, %r8d
	movl	y3rnd, %r9d
	movl	y2rnd, %eax
	movl	%edi, y1rnd
	imull	$172, %eax, %r10d
	movl	$1160932197, %r11d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r10d
	imull	$172, %r10d, %r13d
	movl	%r13d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r13d
	movl	%r13d, y2rnd
	imull	$170, %r9d, %r9d
	movl	$2320639257, %r11d
	movl	%r9d, %eax
	imull	%r11d
	addl	%r9d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r9d
	imull	$170, %r9d, %ebp
	movl	%ebp, %eax
	imull	%r11d
	addl	%ebp, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ebp
	movl	%ebp, y3rnd
	cvtsi2ss	%r13d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%ebp, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	%esi, %xmm0
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %esi
	incl	%esi
	movl	%r8d, %eax
	imull	%esi, %eax
	cvtsi2ss	%r10d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %ecx
	cvtsi2ss	%ecx, %xmm2
	subss	%xmm2, %xmm1
	addl	$4294967294, %r8d
	cvtsi2ss	%r8d, %xmm2
	mulss	%xmm2, %xmm1
	cvttss2si	%xmm1, %r10d
	leal	1(%rax,%r10), %eax
	movslq	%eax, %rax
	movq	way2, %rcx
	movzbq	(%rcx,%rax), %rax
	incl	%r10d
	cmpb	$0, 604(%rsp,%rax)
	je	.LBB23_55	# bb609
.LBB23_53:	# cond_true528
	imull	$171, %edi, %edi
	movl	$1162389643, %ecx
	movl	%edi, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	imull	$171, %edi, %r8d
	movl	%r8d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	movl	%r8d, y1rnd
	imull	$172, %r13d, %r9d
	movl	$1160932197, %ecx
	movl	%r9d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	movl	%r11d, y2rnd
	imull	$170, %ebp, %r13d
	movl	$2320639257, %ecx
	movl	%r13d, %eax
	imull	%ecx
	addl	%r13d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r13d
	imull	$170, %r13d, %ebp
	movl	%ebp, %eax
	imull	%ecx
	addl	%ebp, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ebp
	movl	%ebp, y3rnd
	leaq	860(%rsp), %rax
	movq	%rax, (%rsp)
	cvtsi2ss	%r11d, %xmm1
	movss	.LCPI23_2(%rip), %xmm3
	mulss	%xmm3, %xmm1
	cvtsi2ss	%r8d, %xmm4
	movss	.LCPI23_3(%rip), %xmm5
	mulss	%xmm5, %xmm4
	addss	%xmm1, %xmm4
	cvtsi2ss	%ebp, %xmm1
	movss	.LCPI23_4(%rip), %xmm6
	mulss	%xmm6, %xmm1
	addss	%xmm1, %xmm4
	cvttss2si	%xmm4, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm4
	mulss	%xmm4, %xmm0
	cvttss2si	%xmm0, %ecx
	incl	%ecx
	cvtsi2ss	%r9d, %xmm0
	mulss	%xmm3, %xmm0
	cvtsi2ss	%edi, %xmm1
	mulss	%xmm5, %xmm1
	addss	%xmm0, %xmm1
	cvtsi2ss	%r13d, %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	%xmm1, %xmm2
	cvttss2si	%xmm2, %edx
	incl	%edx
	leaq	864(%rsp), %r9
	leaq	604(%rsp), %r8
	movl	%r10d, %edi
	call	_ZN7way2obj9createwayEiiiiPhRP6pointtRi
	movb	%al, %r13b
	movq	864(%rsp), %rdi
	call	free
	testb	%r13b, %r13b
	je	.LBB23_55	# bb609
.LBB23_54:	# cond_true595
	movslq	860(%rsp), %rax
	addq	%r15, %rax
	incq	%r14
	movq	%rax, %r15
.LBB23_55:	# bb609
	incl	%r12d
	cmpl	%r12d, 5300(%rsp)
	jg	.LBB23_50	# bb466.outer
.LBB23_56:	# bb616
	xorb	%al, %al
	movl	$116, %edi
	call	loop_enter
	xorl	%r12d, %r12d
.LBB23_57:	# bb.i349
	movslq	%r12d, %rax
	shlq	$4, %rax
	movq	way2+280(%rax), %rdi
	call	free
	incl	%r12d
	cmpl	$256, %r12d
	jne	.LBB23_57	# bb.i349
.LBB23_58:	# _ZN7way2obj7destroyEv.exit
	movq	way2, %rdi
	call	free
	movq	way2+8, %rdi
	call	free
	movb	$1, %r12b
	leaq	.str1, %rdi
	pxor	%xmm0, %xmm0
	movb	%r12b, %al
	call	printf
	movl	$10, %r13d
	movl	%r13d, %edi
	call	putchar
	leaq	.str12, %rdi
	pxor	%xmm0, %xmm0
	movb	%r12b, %al
	call	printf
	leaq	.str2, %rdi
	movq	120(%rsp), %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	leaq	.str3, %rdi
	movq	104(%rsp), %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	movl	%r13d, %edi
	call	putchar
	leaq	.str4, %rdi
	pxor	%xmm0, %xmm0
	movb	%r12b, %al
	call	printf
	leaq	.str5, %rdi
	movq	112(%rsp), %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	leaq	.str6, %rdi
	movq	88(%rsp), %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	movl	%r13d, %edi
	call	putchar
	leaq	.str7, %rdi
	pxor	%xmm0, %xmm0
	movb	%r12b, %al
	call	printf
	leaq	.str8, %rdi
	movq	96(%rsp), %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	leaq	.str9, %rdi
	movq	%rbx, %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	leaq	.str10, %rdi
	pxor	%xmm0, %xmm0
	movb	%r12b, %al
	call	printf
	leaq	.str11, %rdi
	movq	%r14, %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	leaq	.str123, %rdi
	movq	%r15, %rsi
	movb	$0, %cl
	movb	%cl, %al
	call	printf
	movl	%r13d, %edi
	call	putchar
	leaq	.str21, %rdi
	call	puts
	leaq	.str22, %rdi
	call	puts
	call	_ZN9regmngobj6createEv
	movq	$regmng, regway+48
	movl	$1, %ebx
	addl	regmng+400, %ebx
	movl	%ebx, regway+20
	movl	$0, regway+16
	# ZERO-EXTEND 
	movl	%ebx, %r14d
	shlq	$3, %r14
	movq	%r14, %rdi
	call	malloc
	movq	%rax, regway+8
	movl	%ebx, regway+36
	movl	$0, regway+32
	movq	%r14, %rdi
	call	malloc
	movq	%rax, regway+24
	movl	5308(%rsp), %ebx
	movl	%ebx, 28(%rsp)
	movl	5312(%rsp), %eax
	movl	%eax, 68(%rsp)
	movss	5316(%rsp), %xmm0
	movss	%xmm0, 84(%rsp)
	movl	$3296329728, 5384(%rsp)
	movl	$3296329728, 5392(%rsp)
	movl	$1148846080, 5388(%rsp)
	movl	$1148846080, 5396(%rsp)
	cvtsi2sd	%ebx, %xmm0
	call	log
	divsd	.LCPI23_0(%rip), %xmm0
	cvtss2sd	.LCPI23_1(%rip), %xmm1
	movsd	%xmm1, 72(%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5400(%rsp)
	cvtsi2sd	68(%rsp), %xmm0
	call	log
	divsd	.LCPI23_0(%rip), %xmm0
	addsd	72(%rsp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5404(%rsp)
	movl	$0, 5408(%rsp)
	movl	$1203982336, 5412(%rsp)
	movl	5396(%rsp), %eax
	movl	5388(%rsp), %r10d
	movl	5400(%rsp), %r11d
	movl	5408(%rsp), %r14d
	movl	5404(%rsp), %r15d
	movl	5392(%rsp), %r12d
	movl	5384(%rsp), %r13d
	movl	%r14d, (%rsp)
	movl	$1203982336, 8(%rsp)
	movl	%r13d, %edi
	movl	%r10d, %esi
	movl	%r12d, %edx
	movl	%eax, %ecx
	movl	%r11d, %r8d
	movl	%r15d, %r9d
	call	_ZN6wayobj6createE17createwaymnginfot
	movl	%ebx, regmng+332
	movl	68(%rsp), %eax
	movl	%eax, regmng+336
	movl	%ebx, %eax
	decl	%eax
	movl	%eax, regmng+316
	movl	68(%rsp), %r14d
	imull	%ebx, %r14d
	movl	68(%rsp), %eax
	decl	%eax
	movl	%eax, 60(%rsp)
	movl	%eax, regmng+320
	# ZERO-EXTEND 
	movl	%r14d, %ebx
	leaq	(,%rbx,8), %rdi
	call	malloc
	movq	%rax, regmng+32
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, regmng+40
	movq	%rbx, %rdi
	addq	%rdi, %rdi
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, regmng
	movslq	%r14d, %rcx
	addq	%rcx, %rcx
	movq	%rcx, %rdx
	andq	$2, %rdx
	shrq	$2, %rcx
	xorl	%ebx, %ebx
	movl	%ebx, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movw	$0, regmng+8
	movl	$108, %edi
	movb	$0, %cl
	movb	%cl, %al
	call	loop_enter
.LBB23_59:	# bb.i285
	movslq	%ebx, %rax
	movb	$0, regmng+48(%rax)
	incl	%ebx
	cmpl	$256, %ebx
	jne	.LBB23_59	# bb.i285
.LBB23_60:	# _ZN9regmngobj7initmapEii.exit
	movb	$1, regmng+48
	cmpl	$0, 68(%rsp)
	movq	regmng+40, %rbx
	jle	.LBB23_68	# bb684
.LBB23_61:	# bb669.preheader
	movl	y2rnd, %r14d
	movl	way.2, %eax
	movl	%eax, 64(%rsp)
	movl	y3rnd, %r15d
	movl	y1rnd, %r12d
	movq	way.16, %rax
	movq	%rax, 48(%rsp)
	xorb	%al, %al
	movl	$121, %edi
	call	loop_enter
	cmpl	$0, 60(%rsp)
	movl	$1, %eax
	movl	68(%rsp), %ecx
	cmovs	%eax, %ecx
	movl	%ecx, 68(%rsp)
	movss	84(%rsp), %xmm0
	addss	.LCPI23_5(%rip), %xmm0
	movss	%xmm0, 84(%rsp)
	xorl	%r13d, %r13d
	movl	%r13d, 44(%rsp)
.LBB23_62:	# bb669.outer
	xorb	%al, %al
	movl	$113, %edi
	call	loop_enter
	movl	64(%rsp), %eax
	movb	%al, %cl
	movl	44(%rsp), %eax
	shll	%cl, %eax
	movl	%eax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rax, 32(%rsp)
	xorl	%ebp, %ebp
	movq	%rax, 16(%rsp)
	jmp	.LBB23_89	# bb669
.LBB23_63:	# bb640
	imull	$170, %r15d, %r15d
	movl	$2320639257, %ecx
	movl	%r15d, %eax
	imull	%ecx
	movl	%edx, %ecx
	imull	$171, %r12d, %r12d
	movl	$1162389643, %edx
	movl	%r12d, %eax
	imull	%edx
	movl	%edx, %esi
	imull	$172, %r14d, %r14d
	movl	$1160932197, %edx
	movl	%r14d, %eax
	imull	%edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r14d
	cvtsi2ss	%r14d, %xmm0
	mulss	.LCPI23_2(%rip), %xmm0
	movl	%esi, %eax
	shrl	$31, %eax
	sarl	$13, %esi
	addl	%eax, %esi
	imull	$30269, %esi, %eax
	subl	%eax, %r12d
	cvtsi2ss	%r12d, %xmm1
	mulss	.LCPI23_3(%rip), %xmm1
	addss	%xmm0, %xmm1
	addl	%r15d, %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	sarl	$14, %ecx
	addl	%eax, %ecx
	imull	$30323, %ecx, %eax
	subl	%eax, %r15d
	cvtsi2ss	%r15d, %xmm0
	mulss	.LCPI23_4(%rip), %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	84(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm0, %xmm1
	leal	(%r13,%rbp), %eax
	movss	.LCPI23_6(%rip), %xmm0
	ucomiss	%xmm1, %xmm0
	movslq	%eax, %rax
	jb	.LBB23_87	# cond_false
.LBB23_64:	# cond_true647
	movb	$0, (%rax,%rbx)
	incl	%ebp
.LBB23_65:	# cond_true647
	cmpl	28(%rsp), %ebp
	jl	.LBB23_63	# bb640
.LBB23_66:	# bb675
	addl	28(%rsp), %r13d
	movl	44(%rsp), %eax
	incl	%eax
	movl	%eax, 44(%rsp)
	cmpl	68(%rsp), %eax
	jne	.LBB23_62	# bb669.outer
.LBB23_67:	# bb684.loopexit
	movl	%r12d, y1rnd
	movl	%r14d, y2rnd
	movl	%r15d, y3rnd
.LBB23_68:	# bb684
	movl	5320(%rsp), %edi
	call	_ZN9regmngobj13createregionsEi
	xorl	%edi, %edi
	call	time
	movl	5324(%rsp), %ebx
	xorb	%al, %al
	movl	$118, %ecx
	movl	%ecx, %edi
	call	loop_enter
	cmpl	$0, %ebx
	jle	.LBB23_98	# bb684.bb772_crit_edge
.LBB23_69:	# bb684.bb702_crit_edge
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	movq	%rbx, %r14
.LBB23_70:	# bb702
	movl	$0, 572(%rsp)
	movq	$0, 576(%rsp)
	movl	y3rnd, %eax
	imull	$170, %eax, %ecx
	movl	$2320639257, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	movl	y1rnd, %eax
	imull	$171, %eax, %r8d
	movl	$1162389643, %r9d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %r10d
	movl	y2rnd, %eax
	imull	$172, %eax, %r11d
	movl	$1160932197, %r12d
	movl	%r11d, %eax
	imull	%r12d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$14, %edi
	addl	%eax, %edi
	imull	$30323, %edi, %eax
	subl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 600(%rsp)
	imull	$171, %r8d, %r8d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r8d, y1rnd
	imull	$172, %r11d, %r9d
	movl	%r9d, %eax
	imull	%r12d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	movl	%r9d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%esi
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r8d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %esi
	incl	%esi
	movl	%esi, 596(%rsp)
	leaq	596(%rsp), %rcx
	leaq	600(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB23_99	# bb702.cond_next748_crit_edge
.LBB23_71:	# cond_true721
	movl	y3rnd, %eax
	imull	$170, %eax, %ecx
	movl	$2320639257, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	movl	y1rnd, %eax
	imull	$171, %eax, %r8d
	movl	$1162389643, %r9d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %r10d
	movl	y2rnd, %eax
	imull	$172, %eax, %r11d
	movl	$1160932197, %r12d
	movl	%r11d, %eax
	imull	%r12d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %edi
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$14, %edi
	addl	%eax, %edi
	imull	$30323, %edi, %eax
	subl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 592(%rsp)
	imull	$171, %r8d, %r8d
	movl	%r8d, %eax
	imull	%r9d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %r8d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r8d, y1rnd
	imull	$172, %r11d, %r9d
	movl	%r9d, %eax
	imull	%r12d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	movl	%r9d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%esi
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r9d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r8d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %esi
	incl	%esi
	movl	%esi, 588(%rsp)
	leaq	588(%rsp), %rcx
	leaq	592(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB23_100	# cond_true721.cond_next739_crit_edge
.LBB23_72:	# cond_true733
	movl	600(%rsp), %edi
	movl	592(%rsp), %edx
	movl	596(%rsp), %esi
	movl	588(%rsp), %ecx
	leaq	572(%rsp), %r9
	leaq	576(%rsp), %r8
	call	_ZN6wayobj9createwayEiiiiRP8point16tRi
.LBB23_73:	# cond_next739
	movb	%al, %r12b
	movq	576(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB23_75	# cond_next748
.LBB23_74:	# cond_true744
	call	free
.LBB23_75:	# cond_next748
	testb	%r12b, %r12b
	je	.LBB23_77	# bb765
.LBB23_76:	# cond_true751
	movslq	572(%rsp), %rax
	addq	%r14, %rax
	incq	%rbx
	movq	%rax, %r14
.LBB23_77:	# bb765
	incl	%r15d
	cmpl	%r15d, 5324(%rsp)
	jg	.LBB23_70	# bb702
.LBB23_78:	# bb772
	movl	5328(%rsp), %r15d
	xorb	%al, %al
	movl	$117, %edi
	call	loop_enter
	cmpl	$0, %r15d
	jle	.LBB23_101	# bb772.bb871_crit_edge
.LBB23_79:	# bb772.bb774_crit_edge
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movq	%r15, %r12
.LBB23_80:	# bb774
	movl	y1rnd, %eax
	imull	$171, %eax, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30269, %edx, %eax
	subl	%eax, %edi
	movl	$4294967295, %esi
	addl	regmng+400, %esi
	movl	y3rnd, %r8d
	movl	y2rnd, %eax
	movl	%edi, y1rnd
	imull	$172, %eax, %r9d
	movl	$1160932197, %r10d
	movl	%r9d, %eax
	imull	%r10d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%r10d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	movl	%r11d, y2rnd
	imull	$170, %r8d, %r8d
	movl	$2320639257, %r10d
	movl	%r8d, %eax
	imull	%r10d
	addl	%r8d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r8d
	imull	$170, %r8d, %ebp
	movl	%ebp, %eax
	imull	%r10d
	addl	%ebp, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ebp
	movl	%ebp, y3rnd
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI23_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI23_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%ebp, %xmm0
	movss	.LCPI23_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvtsi2ss	%r9d, %xmm0
	mulss	%xmm1, %xmm0
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm0, %xmm1
	cvtsi2ss	%r8d, %xmm0
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	cvtsi2ss	%esi, %xmm0
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movslq	%eax, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rdi
	cmpl	$0, 48(%rdi)
	je	.LBB23_86	# bb864
.LBB23_81:	# cond_next813
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	movslq	%eax, %rax
	movq	(%rcx,%rax,8), %rsi
	cmpl	$0, 48(%rsi)
	je	.LBB23_86	# bb864
.LBB23_82:	# cond_next835
	movq	$0, 560(%rsp)
	movl	$0, 556(%rsp)
	leaq	560(%rsp), %rdx
	leaq	556(%rsp), %rcx
	call	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri
	movq	560(%rsp), %rdi
	testq	%rdi, %rdi
	movb	%al, %bpl
	je	.LBB23_84	# cond_next846
.LBB23_83:	# cond_true843
	call	free
.LBB23_84:	# cond_next846
	testb	%bpl, %bpl
	je	.LBB23_86	# bb864
.LBB23_85:	# cond_true849
	movslq	556(%rsp), %rax
	addq	%r12, %rax
	incq	%r15
	movq	%rax, %r12
.LBB23_86:	# bb864
	incl	%r13d
	cmpl	%r13d, 5328(%rsp)
	jg	.LBB23_80	# bb774
	jmp	.LBB23_102	# bb871
.LBB23_87:	# cond_false
	movb	$1, (%rax,%rbx)
	movl	40(%rsp), %eax
	orl	%ebp, %eax
	movslq	%eax, %rax
	movq	48(%rsp), %rcx
	movw	(%rcx,%rax,2), %cx
	testw	%cx, %cx
	jns	.LBB23_97	# cond_true.i
.LBB23_88:	# bb669.backedge
	incl	%ebp
.LBB23_89:	# bb669
	xorb	%al, %al
	movl	$107, %edi
	call	loop_enter
	incq	32(%rsp)
	incq	16(%rsp)
	jmp	.LBB23_65	# cond_true647
.LBB23_90:	# cond_true37
	leaq	.str17, %rdi
	jmp	.LBB23_2	# cond_true
.LBB23_91:	# _ZN9regmngobj7loadmapEPKc.exit.bb183_crit_edge
	xorl	%eax, %eax
	movq	%rax, 120(%rsp)
	movq	%rax, 104(%rsp)
	jmp	.LBB23_27	# bb183
.LBB23_92:	# bb.cond_next159_crit_edge
	xorb	%r14b, %r14b
	jmp	.LBB23_24	# cond_next159
.LBB23_93:	# cond_true132.cond_next150_crit_edge
	xorb	%al, %al
	jmp	.LBB23_22	# cond_next150
.LBB23_94:	# bb183.bb278_crit_edge
	xorl	%eax, %eax
	movq	%rax, 112(%rsp)
	movq	%rax, 88(%rsp)
	jmp	.LBB23_36	# bb278
.LBB23_95:	# _ZN7way2obj7loadmapEPKc.exit.bb445_crit_edge
	xorl	%eax, %eax
	movq	%rax, 96(%rsp)
	movq	%rax, %rbx
	jmp	.LBB23_48	# bb445
.LBB23_96:	# bb445.bb616_crit_edge
	xorl	%r14d, %r14d
	movq	%r14, %r15
	jmp	.LBB23_56	# bb616
.LBB23_97:	# cond_true.i
	incw	%cx
	movq	48(%rsp), %rdx
	movw	%cx, (%rdx,%rax,2)
	jmp	.LBB23_88	# bb669.backedge
.LBB23_98:	# bb684.bb772_crit_edge
	xorl	%ebx, %ebx
	movq	%rbx, %r14
	jmp	.LBB23_78	# bb772
.LBB23_99:	# bb702.cond_next748_crit_edge
	xorb	%r12b, %r12b
	jmp	.LBB23_75	# cond_next748
.LBB23_100:	# cond_true721.cond_next739_crit_edge
	xorb	%al, %al
	jmp	.LBB23_73	# cond_next739
.LBB23_101:	# bb772.bb871_crit_edge
	xorl	%r15d, %r15d
	movq	%r15, %r12
.LBB23_102:	# bb871
	movq	regway+8, %rdi
	call	free
	movq	regway+24, %rdi
	call	free
	call	_ZN9regmngobj7destroyEv
	call	_ZN6wayobj7destroyEv
	movb	$1, %r13b
	leaq	.str1, %rdi
	pxor	%xmm0, %xmm0
	movb	%r13b, %al
	call	printf
	movl	$10, %eax
	movl	%eax, %edi
	call	putchar
	leaq	.str12, %rdi
	pxor	%xmm0, %xmm0
	movb	%r13b, %al
	call	printf
	xorb	%bpl, %bpl
	leaq	.str2, %rdi
	movq	%rbx, %rsi
	movb	%bpl, %al
	call	printf
	leaq	.str3, %rdi
	movq	%r14, %rsi
	movb	%bpl, %al
	call	printf
	movl	$10, %eax
	movl	%eax, %edi
	call	putchar
	leaq	.str4, %rdi
	pxor	%xmm0, %xmm0
	movb	%r13b, %al
	call	printf
	leaq	.str5, %rdi
	movq	%r15, %rsi
	movb	%bpl, %al
	call	printf
	leaq	.str6, %rdi
	movq	%r12, %rsi
	movb	%bpl, %al
	call	printf
	movl	$10, %eax
	movl	%eax, %edi
	call	putchar
	leaq	.str7, %rdi
	pxor	%xmm0, %xmm0
	movb	%r13b, %al
	call	printf
	xorl	%ebx, %ebx
	leaq	.str8, %rdi
	movq	%rbx, %rsi
	movb	%bpl, %al
	call	printf
	leaq	.str9, %rdi
	movq	%rbx, %rsi
	movb	%bpl, %al
	call	printf
	leaq	.str10, %rdi
	pxor	%xmm0, %xmm0
	movb	%r13b, %al
	call	printf
	leaq	.str11, %rdi
	movq	%rbx, %rsi
	movb	%bpl, %al
	call	printf
	leaq	.str123, %rdi
	movq	%rbx, %rsi
	movb	%bpl, %al
	call	printf
	movl	$10, %eax
	movl	%eax, %edi
	call	putchar
	xorl	%eax, %eax
	jmp	.LBB23_3	# cond_true
	.size	main, .-main


	.align	16
	.type	_ZN9regwayobj6createEP9regmngobj,@function
_ZN9regwayobj6createEP9regmngobj:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %r14
	xorb	%al, %al
	movl	$24, %edi
	call	func_enter
	movq	%r14, 48(%rbx)
	movl	$1, %r15d
	movl	%r15d, %eax
	addl	400(%r14), %eax
	movl	%eax, 20(%rbx)
	movl	$0, 16(%rbx)
	# ZERO-EXTEND 
	movl	%eax, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, 8(%rbx)
	addl	400(%r14), %r15d
	movl	%r15d, 36(%rbx)
	movl	$0, 32(%rbx)
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, 24(%rbx)
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
	.size	_ZN9regwayobj6createEP9regmngobj, .-_ZN9regwayobj6createEP9regmngobj


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI25_0:					#  float
	.long	1343554297	# float 1e+10
	.text
	.align	16
	.type	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri,@function
_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	xorb	%al, %al
	movl	$25, %edi
	call	func_enter
	cmpq	%r14, %rbx
	jne	.LBB25_3	# cond_next
.LBB25_1:	# cond_true
	movl	$8, %edi
	call	malloc
	movq	16(%rsp), %r14
	movq	%rax, (%r14)
	movq	%rbx, (%rax)
	movq	24(%rsp), %rbx
	movl	$1, (%rbx)
	movl	$1, %eax
.LBB25_2:	# cond_true
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB25_3:	# cond_next
	movb	$0, regway+56
	movq	%r14, regway+64
	movq	%rbx, regway+72
	movq	regway+48, %rax
	movl	$1, %ecx
	addl	24(%rax), %ecx
	movl	%ecx, 24(%rax)
	cmpl	$1073741824, %ecx
	jne	.LBB25_33	# cond_next.bb33.i.i_crit_edge
.LBB25_4:	# cond_true.i.i
	movl	$1, 24(%rax)
	cmpl	$0, 400(%rax)
	jle	.LBB25_8	# _ZN9regmngobj13getregfillnumEv.exit.i
.LBB25_5:	# cond_true.i.i.bb.i.i_crit_edge
	xorl	%ecx, %ecx
.LBB25_6:	# bb.i.i
	movslq	%ecx, %rdx
	movq	344(%rax), %rsi
	movq	(%rsi,%rdx,8), %rdx
	movl	$0, 32(%rdx)
	incl	%ecx
.LBB25_7:	# bb33.i.i
	cmpl	%ecx, 400(%rax)
	jg	.LBB25_6	# bb.i.i
.LBB25_8:	# _ZN9regmngobj13getregfillnumEv.exit.i
	movl	24(%rax), %eax
	movl	%eax, regway+44
	movl	%eax, 32(%rbx)
	movl	$0, 36(%rbx)
	movl	$0, regway+16
	movl	regway+20, %r15d
	testl	%r15d, %r15d
	jne	.LBB25_10	# cond_next81.i
.LBB25_9:	# cond_true.i
	leal	(%r15,%r15), %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movq	regway+8, %rsi
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	call	memcpy
	movq	regway+8, %rdi
	call	free
	movq	%r13, regway+8
	movl	%r12d, regway+20
.LBB25_10:	# cond_next81.i
	movslq	regway+16, %rax
	movq	regway+8, %rcx
	movq	%rbx, (%rcx,%rax,8)
	incl	regway+16
	movl	$1, regway+40
	xorb	%bl, %bl
	movl	$124, %edi
	movb	%bl, %al
	call	loop_enter
	movl	$1, 12(%rsp)
	jmp	.LBB25_14	# cond_next139.i
.LBB25_11:	# bb100.i
	testb	%bl, %bl
	je	.LBB25_34	# cond_true106.i
.LBB25_12:	# cond_false.i
	leaq	regway+8, %rsi
	leaq	regway+24, %rdi
	call	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_
	leaq	regway+16, %rax
	xorb	%bl, %bl
.LBB25_13:	# cond_next125.i
	movl	$1, %ecx
	addl	regway+40, %ecx
	movl	%ecx, 12(%rsp)
	cmpl	$0, (%rax)
	movl	%ecx, regway+40
	je	.LBB25_15	# _ZN9regwayobj4fillEP6regobjS1_.exit
.LBB25_14:	# cond_next139.i
	cmpb	$0, regway+56
	je	.LBB25_11	# bb100.i
.LBB25_15:	# _ZN9regwayobj4fillEP6regobjS1_.exit
	cmpb	$0, regway+56
	je	.LBB25_35	# cond_true22
.LBB25_16:	# cond_next26
	movl	12(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$3, %rdi
	call	malloc
	movq	16(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	%ebx, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movq	%r14, (%rax,%rdx,8)
	testl	%ecx, %ecx
	movq	%rax, %rbx
	jle	.LBB25_29	# bb203.i
.LBB25_17:	# bb.preheader.i
	xorb	%al, %al
	movl	$126, %edi
	call	loop_enter
	movl	12(%rsp), %r15d
.LBB25_18:	# cond_next188.i.bb.i_crit_edge
	movq	%rbx, %rax
.LBB25_19:	# bb.i
	movl	%r15d, %ecx
	decl	%ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movl	48(%rax), %r12d
	testl	%r12d, %r12d
	jle	.LBB25_36	# bb.i.bb181.i_crit_edge
.LBB25_20:	# bb28.preheader.i
	movq	40(%rax), %r13
	movl	regway+44, %ebp
	xorb	%al, %al
	movl	$125, %edi
	call	loop_enter
	leal	-2(%r15), %ecx
	xorl	%edx, %edx
	xorl	%eax, %eax
	movss	.LCPI25_0(%rip), %xmm0
.LBB25_21:	# bb28.i
	movslq	%edx, %rsi
	movq	(%r13,%rsi,8), %rsi
	cmpl	%ebp, 32(%rsi)
	jne	.LBB25_26	# bb172.i
.LBB25_22:	# cond_true.i4
	cmpl	%ecx, 36(%rsi)
	jne	.LBB25_26	# bb172.i
.LBB25_23:	# cond_true60.i
	movl	24(%rsi), %edi
	subl	24(%r14), %edi
	cvtsi2ss	%edi, %xmm1
	mulss	%xmm1, %xmm1
	movl	20(%rsi), %edi
	subl	20(%r14), %edi
	cvtsi2ss	%edi, %xmm2
	mulss	%xmm2, %xmm2
	addss	%xmm1, %xmm2
	testq	%rax, %rax
	je	.LBB25_25	# cond_true164.i
.LBB25_24:	# cond_false.i7
	ucomiss	%xmm2, %xmm0
	jbe	.LBB25_26	# bb172.i
.LBB25_25:	# cond_true164.i
	movaps	%xmm2, %xmm0
	movq	%rsi, %rax
.LBB25_26:	# bb172.i
	incl	%edx
	cmpl	%edx, %r12d
	jg	.LBB25_21	# bb28.i
.LBB25_27:	# bb181.i
	testq	%rax, %rax
	je	.LBB25_37	# bb181.i._ZN9regwayobj6getwayEP6regobjRPS1_.exit_crit_edge
.LBB25_28:	# cond_next188.i
	leal	-2(%r15), %ecx
	movslq	%ecx, %rdx
	movq	%rax, (%rbx,%rdx,8)
	decl	%r15d
	testl	%ecx, %ecx
	movq	16(%rsp), %rax
	movq	(%rax), %rbx
	jg	.LBB25_18	# cond_next188.i.bb.i_crit_edge
.LBB25_29:	# bb203.i
	movq	regway+72, %rax
	movq	%rax, (%rbx)
.LBB25_30:	# _ZN9regwayobj6getwayEP6regobjRPS1_.exit
	movq	24(%rsp), %rcx
	movl	12(%rsp), %eax
	movl	%eax, (%rcx)
	cmpl	$4294967295, %eax
	je	.LBB25_38	# cond_true38
.LBB25_31:	# UnifiedReturnBlock
	movl	$1, %eax
.LBB25_32:	# UnifiedReturnBlock
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB25_33:	# cond_next.bb33.i.i_crit_edge
	xorl	%ecx, %ecx
	jmp	.LBB25_7	# bb33.i.i
.LBB25_34:	# cond_true106.i
	leaq	regway+24, %rsi
	leaq	regway+8, %rdi
	call	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_
	leaq	regway+32, %rax
	movb	$1, %bl
	jmp	.LBB25_13	# cond_next125.i
.LBB25_35:	# cond_true22
	movq	16(%rsp), %r14
	movq	$0, (%r14)
	movq	24(%rsp), %r14
	movl	$0, (%r14)
	xorl	%eax, %eax
	jmp	.LBB25_32	# UnifiedReturnBlock
.LBB25_36:	# bb.i.bb181.i_crit_edge
	xorl	%eax, %eax
	jmp	.LBB25_27	# bb181.i
.LBB25_37:	# bb181.i._ZN9regwayobj6getwayEP6regobjRPS1_.exit_crit_edge
	movl	$4294967295, 12(%rsp)
	jmp	.LBB25_30	# _ZN9regwayobj6getwayEP6regobjRPS1_.exit
.LBB25_38:	# cond_true38
	movq	16(%rsp), %rbx
	movq	(%rbx), %rdi
	call	free
	movq	$0, (%rbx)
	movq	24(%rsp), %rcx
	movl	$0, (%rcx)
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	jmp	.LBB25_2	# cond_true
	.size	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri, .-_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri


	.align	16
	.type	_ZN9regwayobj7destroyEv,@function
_ZN9regwayobj7destroyEv:
	pushq	%rbx
	movq	%rdi, %rbx
	xorb	%al, %al
	movl	$26, %edi
	call	func_enter
	movq	8(%rbx), %rdi
	call	free
	movq	24(%rbx), %rdi
	call	free
	popq	%rbx
	ret
	.size	_ZN9regwayobj7destroyEv, .-_ZN9regwayobj7destroyEv


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI27_0:					#  float
	.long	1056964608	# float 0.5
	.text
	.align	16
	.type	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_,@function
_ZN6regobj10makebound2ER9flexarrayI6pointtES3_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r14, 24(%rsp)
	movq	%rdx, %r15
	xorb	%al, %al
	movl	$27, %edi
	call	func_enter
	movl	$0, 8(%r15)
	cmpl	$0, 8(%r14)
	jle	.LBB27_16	# return
.LBB27_1:	# bb.preheader
	xorb	%al, %al
	movl	$127, %edi
	call	loop_enter
	movl	$0, 20(%rsp)
.LBB27_2:	# bb
	movslq	20(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	(%rcx), %rcx
	movl	4(%rcx,%rax,8), %edx
	movl	%edx, %esi
	decl	%esi
	xorl	%edi, %edi
	testl	%esi, %esi
	cmovs	%edi, %esi
	movl	%esi, (%rsp)
	movl	(%rcx,%rax,8), %eax
	movl	%eax, 16(%rsp)
	movl	%eax, %ecx
	incl	%ecx
	movq	8(%rbx), %rsi
	movl	316(%rsi), %r8d
	cmpl	%ecx, %r8d
	cmovl	%r8d, %ecx
	movl	%ecx, 4(%rsp)
	decl	%eax
	testl	%eax, %eax
	cmovs	%edi, %eax
	movl	%eax, 12(%rsp)
	incl	%edx
	movl	320(%rsi), %eax
	movl	%eax, 8(%rsp)
	cmpl	%edx, %eax
	jge	.LBB27_14	# bb167
.LBB27_3:	# cond_true110
	movl	(%rsp), %edx
	cmpl	8(%rsp), %edx
	jg	.LBB27_15	# bb176
.LBB27_4:	# bb158.preheader
	xorb	%al, %al
	movl	$128, %edi
	call	loop_enter
	movl	12(%rsp), %edx
	cmpl	4(%rsp), %edx
	jg	.LBB27_13	# bb164
.LBB27_5:	# bb120.preheader
	movl	16(%rsp), %r14d
	decl	%r14d
	xorl	%edx, %edx
	testl	%r14d, %r14d
	cmovs	%edx, %r14d
.LBB27_6:	# bb120
	movq	8(%rbx), %rax
	movl	332(%rax), %edx
	imull	(%rsp), %edx
	addl	%r14d, %edx
	movslq	%edx, %rcx
	movq	32(%rax), %rdx
	cmpq	$0, (%rdx,%rcx,8)
	jne	.LBB27_12	# cond_next155
.LBB27_7:	# cond_true150
	movq	40(%rax), %rdx
	movzbq	(%rdx,%rcx), %rcx
	cmpb	$0, 48(%rax,%rcx)
	je	.LBB27_12	# cond_next155
.LBB27_8:	# cond_true.i
	movl	%r14d, %edx
	subl	20(%rbx), %edx
	imull	%edx, %edx
	movl	(%rsp), %ecx
	subl	24(%rbx), %ecx
	imull	%ecx, %ecx
	addl	%edx, %ecx
	cvtsi2ss	%ecx, %xmm0
	addss	.LCPI27_0(%rip), %xmm0
	cvttss2si	%xmm0, %edx
	cmpl	308(%rax), %edx
	jg	.LBB27_12	# cond_next155
.LBB27_9:	# cond_true88.i
	movl	12(%r15), %r12d
	cmpl	%r12d, 8(%r15)
	jne	.LBB27_11	# cond_next152.i
.LBB27_10:	# cond_true107.i
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r15), %rsi
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r15), %rdi
	call	free
	movq	%rbp, (%r15)
	movl	%r13d, 12(%r15)
.LBB27_11:	# cond_next152.i
	movslq	8(%r15), %rax
	movq	(%r15), %rcx
	movl	%r14d, (%rcx,%rax,8)
	movl	(%rsp), %edx
	movl	%edx, 4(%rcx,%rax,8)
	incl	8(%r15)
	movq	8(%rbx), %rax
	movl	332(%rax), %ecx
	imull	%edx, %ecx
	addl	%r14d, %ecx
	movslq	%ecx, %rcx
	movq	32(%rax), %rax
	movq	%rbx, (%rax,%rcx,8)
	incl	16(%rbx)
.LBB27_12:	# cond_next155
	incl	%r14d
	cmpl	4(%rsp), %r14d
	jle	.LBB27_6	# bb120
.LBB27_13:	# bb164
	incl	(%rsp)
	movl	8(%rsp), %edx
.LBB27_14:	# bb167
	movl	(%rsp), %eax
	cmpl	%edx, %eax
	jle	.LBB27_17	# bb167.bb158.preheader_crit_edge
.LBB27_15:	# bb176
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	movq	24(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	jg	.LBB27_2	# bb
.LBB27_16:	# return
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB27_17:	# bb167.bb158.preheader_crit_edge
	movl	%edx, 8(%rsp)
	jmp	.LBB27_4	# bb158.preheader
	.size	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_, .-_ZN6regobj10makebound2ER9flexarrayI6pointtES3_


	.align	16
	.type	_ZN9regwayobj12isaddtoboundEP6regobjS1_,@function
_ZN9regwayobj12isaddtoboundEP6regobjS1_:
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rdx, %r14
	xorb	%al, %al
	movl	$28, %edi
	call	func_enter
	movl	44(%rbx), %ecx
	cmpl	%ecx, 32(%r14)
	setne	%cl
	movzbl	%cl, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	ret
	.size	_ZN9regwayobj12isaddtoboundEP6regobjS1_, .-_ZN9regwayobj12isaddtoboundEP6regobjS1_


	.align	16
	.type	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_,@function
_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, %rbx
	movq	%rbx, 16(%rsp)
	movq	%rsi, %r14
	xorb	%al, %al
	movl	$29, %edi
	call	func_enter
	movl	$0, 8(%r14)
	cmpl	$0, 8(%rbx)
	jle	.LBB29_12	# return
.LBB29_1:	# bb.preheader
	xorb	%al, %al
	movl	$129, %edi
	call	loop_enter
	movl	$0, 12(%rsp)
.LBB29_2:	# bb
	movslq	12(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	(%rcx), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, (%rsp)
	cmpl	$0, 48(%rax)
	jle	.LBB29_11	# bb161
.LBB29_3:	# bb20.preheader
	xorb	%al, %al
	movl	$130, %edi
	call	loop_enter
	xorl	%ebx, %ebx
.LBB29_4:	# bb20
	movslq	%ebx, %rax
	movq	(%rsp), %rcx
	movq	40(%rcx), %rdx
	movq	(%rdx,%rax,8), %r15
	movq	regway, %rax
	movq	(%rax), %rax
	leaq	regway, %rdi
	movq	%rcx, %rsi
	movq	%r15, %rdx
	call	*%rax
	testb	%al, %al
	je	.LBB29_10	# bb149
.LBB29_5:	# cond_true
	movl	regway+44, %eax
	movl	%eax, 32(%r15)
	movl	regway+40, %eax
	movl	%eax, 36(%r15)
	cmpq	%r15, regway+64
	jne	.LBB29_7	# cond_next
.LBB29_6:	# cond_true69
	movb	$1, regway+56
.LBB29_7:	# cond_next
	movl	12(%r14), %r12d
	cmpl	%r12d, 8(%r14)
	jne	.LBB29_9	# cond_next129
.LBB29_8:	# cond_true83
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r14), %rsi
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r14), %rdi
	call	free
	movq	%rbp, (%r14)
	movl	%r13d, 12(%r14)
.LBB29_9:	# cond_next129
	movslq	8(%r14), %rax
	movq	(%r14), %rcx
	movq	%r15, (%rcx,%rax,8)
	incl	8(%r14)
.LBB29_10:	# bb149
	incl	%ebx
	movq	(%rsp), %rax
	cmpl	%ebx, 48(%rax)
	jg	.LBB29_4	# bb20
.LBB29_11:	# bb161
	movl	12(%rsp), %eax
	incl	%eax
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	jg	.LBB29_2	# bb
.LBB29_12:	# return
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_, .-_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_


	.align	16
	.type	_ZN6wayobj10makebound2EPiiS0_,@function
_ZN6wayobj10makebound2EPiiS0_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, 16(%rsp)
	movl	%esi, %ebx
	movl	%ebx, 12(%rsp)
	movq	%rdx, %r14
	xorb	%al, %al
	movl	$30, %edi
	call	func_enter
	testl	%ebx, %ebx
	movq	way.17, %rbx
	movl	way.8, %eax
	movl	%eax, 4(%rsp)
	jle	.LBB30_28	# entry.UnifiedReturnBlock_crit_edge
.LBB30_1:	# bb.preheader
	movl	way.20, %eax
	movl	%eax, 8(%rsp)
	movl	way.23, %r15d
	movq	way.16, %r12
	movw	way.24, %r13w
	movw	way.25, %bp
	xorb	%al, %al
	movl	$131, %edi
	call	loop_enter
	movl	8(%rsp), %eax
	decl	%eax
	movl	%eax, (%rsp)
	movl	4(%rsp), %eax
	movl	%eax, %ecx
	incl	%ecx
	movl	%eax, %edx
	decl	%edx
	xorl	%esi, %esi
	movl	%esi, %eax
.LBB30_2:	# bb
	movslq	%esi, %rdi
	movq	16(%rsp), %r8
	movl	(%r8,%rdi,4), %edi
	movl	%edi, %r8d
	subl	4(%rsp), %r8d
	movl	%r8d, %r9d
	decl	%r9d
	movslq	%r9d, %r10
	cmpw	%bp, (%rbx,%r10,4)
	je	.LBB30_5	# cond_next74
.LBB30_3:	# cond_true
	cmpw	$0, (%r12,%r10,2)
	jne	.LBB30_5	# cond_next74
.LBB30_4:	# cond_true37
	movslq	%eax, %r11
	movl	%r9d, (%r14,%r11,4)
	movw	%bp, (%rbx,%r10,4)
	movw	%r13w, 2(%rbx,%r10,4)
	incl	%eax
	cmpl	%r9d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_5:	# cond_next74
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_8	# cond_next139
.LBB30_6:	# cond_true90
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_8	# cond_next139
.LBB30_7:	# cond_true101
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_8:	# cond_next139
	incl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_11	# cond_next205
.LBB30_9:	# cond_true156
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_11	# cond_next205
.LBB30_10:	# cond_true167
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_11:	# cond_next205
	movl	%edi, %r8d
	decl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_14	# cond_next269
.LBB30_12:	# cond_true220
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_14	# cond_next269
.LBB30_13:	# cond_true231
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_14:	# cond_next269
	movl	%edi, %r8d
	incl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_17	# cond_next333
.LBB30_15:	# cond_true284
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_17	# cond_next333
.LBB30_16:	# cond_true295
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_17:	# cond_next333
	leal	(%rdx,%rdi), %r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_20	# cond_next399
.LBB30_18:	# cond_true350
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_20	# cond_next399
.LBB30_19:	# cond_true361
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_20:	# cond_next399
	movl	4(%rsp), %r8d
	leal	(%rdi,%r8), %r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB30_23	# cond_next464
.LBB30_21:	# cond_true415
	cmpw	$0, (%r12,%r9,2)
	jne	.LBB30_23	# cond_next464
.LBB30_22:	# cond_true426
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	cmpl	%r8d, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_23:	# cond_next464
	addl	%ecx, %edi
	movslq	%edi, %r8
	cmpw	%bp, (%rbx,%r8,4)
	je	.LBB30_26	# cond_next530
.LBB30_24:	# cond_true481
	cmpw	$0, (%r12,%r8,2)
	jne	.LBB30_26	# cond_next530
.LBB30_25:	# cond_true492
	movslq	%eax, %r9
	movl	%edi, (%r14,%r9,4)
	movw	%bp, (%rbx,%r8,4)
	movw	%r13w, 2(%rbx,%r8,4)
	incl	%eax
	cmpl	%edi, %r15d
	je	.LBB30_29	# cond_true68
.LBB30_26:	# cond_next530
	movl	8(%rsp), %edi
	cmpl	%eax, %edi
	cmovle	(%rsp), %eax
	incl	%esi
	cmpl	12(%rsp), %esi
	jl	.LBB30_2	# bb
.LBB30_27:	# UnifiedReturnBlock
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB30_28:	# entry.UnifiedReturnBlock_crit_edge
	xorl	%eax, %eax
	jmp	.LBB30_27	# UnifiedReturnBlock
.LBB30_29:	# cond_true68
	movb	$1, way.22.b
	jmp	.LBB30_27	# UnifiedReturnBlock
	.size	_ZN6wayobj10makebound2EPiiS0_, .-_ZN6wayobj10makebound2EPiiS0_


	.align	16
	.type	_ZN6wayobj18makeobstaclebound2EPiiS0_,@function
_ZN6wayobj18makeobstaclebound2EPiiS0_:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movq	%rdi, 16(%rsp)
	movl	%esi, %ebx
	movl	%ebx, 12(%rsp)
	movq	%rdx, %r14
	xorb	%al, %al
	movl	$31, %edi
	call	func_enter
	testl	%ebx, %ebx
	movq	way.17, %rbx
	movl	way.8, %eax
	movl	%eax, 8(%rsp)
	jle	.LBB31_24	# entry.UnifiedReturnBlock_crit_edge
.LBB31_1:	# bb.preheader
	movl	way.20, %r15d
	movq	way.16, %r12
	movw	way.24, %r13w
	movw	way.25, %bp
	xorb	%al, %al
	movl	$132, %edi
	call	loop_enter
	movl	8(%rsp), %eax
	movl	%eax, %ecx
	incl	%ecx
	movl	%eax, %edx
	decl	%edx
	xorl	%esi, %esi
	movl	%esi, %eax
.LBB31_2:	# bb
	movslq	%esi, %rdi
	movq	16(%rsp), %r8
	movl	(%r8,%rdi,4), %edi
	movl	%edi, %r8d
	subl	8(%rsp), %r8d
	movl	%r8d, %r9d
	decl	%r9d
	movslq	%r9d, %r10
	cmpw	%bp, (%rbx,%r10,4)
	je	.LBB31_26	# cond_next80
.LBB31_3:	# cond_true
	movw	(%r12,%r10,2), %r11w
	testw	%r11w, %r11w
	jg	.LBB31_25	# cond_true37
.LBB31_4:	# cond_false
	testw	%r11w, %r11w
	jne	.LBB31_26	# cond_next80
.LBB31_5:	# cond_true71
	movb	$1, way.22.b
	movl	%r9d, way.23
	jmp	.LBB31_23	# UnifiedReturnBlock
.LBB31_6:	# cond_false132
	testw	%r10w, %r10w
	je	.LBB31_10	# cond_true143
.LBB31_7:	# cond_next153
	incl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_30	# cond_next226
.LBB31_8:	# cond_true170
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jg	.LBB31_29	# cond_true181
.LBB31_9:	# cond_false205
	testw	%r10w, %r10w
	jne	.LBB31_30	# cond_next226
.LBB31_10:	# cond_true143
	movb	$1, way.22.b
	movl	%r8d, way.23
	jmp	.LBB31_23	# UnifiedReturnBlock
.LBB31_11:	# cond_false276
	testw	%r10w, %r10w
	je	.LBB31_10	# cond_true143
.LBB31_12:	# cond_next297
	movl	%edi, %r8d
	incl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_34	# cond_next368
.LBB31_13:	# cond_true312
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jg	.LBB31_33	# cond_true323
.LBB31_14:	# cond_false347
	testw	%r10w, %r10w
	je	.LBB31_10	# cond_true143
	jmp	.LBB31_34	# cond_next368
.LBB31_15:	# cond_false420
	testw	%r10w, %r10w
	je	.LBB31_10	# cond_true143
.LBB31_16:	# cond_next441
	movl	8(%rsp), %r8d
	leal	(%rdi,%r8), %r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_38	# cond_next513
.LBB31_17:	# cond_true457
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jg	.LBB31_37	# cond_true468
.LBB31_18:	# cond_false492
	testw	%r10w, %r10w
	je	.LBB31_10	# cond_true143
	jmp	.LBB31_38	# cond_next513
.LBB31_19:	# cond_false565
	testw	%r9w, %r9w
	je	.LBB31_41	# cond_true576
.LBB31_20:	# cond_next586
	cmpl	%eax, %r15d
	jg	.LBB31_22	# bb602
.LBB31_21:	# cond_true594
	movl	%r15d, %eax
	decl	%eax
.LBB31_22:	# bb602
	incl	%esi
	cmpl	12(%rsp), %esi
	jl	.LBB31_2	# bb
.LBB31_23:	# UnifiedReturnBlock
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB31_24:	# entry.UnifiedReturnBlock_crit_edge
	xorl	%eax, %eax
	jmp	.LBB31_23	# UnifiedReturnBlock
.LBB31_25:	# cond_true37
	movslq	%eax, %r11
	movl	%r9d, (%r14,%r11,4)
	movw	%bp, (%rbx,%r10,4)
	movw	%r13w, 2(%rbx,%r10,4)
	incl	%eax
.LBB31_26:	# cond_next80
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_7	# cond_next153
.LBB31_27:	# cond_true97
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jle	.LBB31_6	# cond_false132
.LBB31_28:	# cond_true108
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	jmp	.LBB31_7	# cond_next153
.LBB31_29:	# cond_true181
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
.LBB31_30:	# cond_next226
	movl	%edi, %r8d
	decl	%r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_12	# cond_next297
.LBB31_31:	# cond_true241
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jle	.LBB31_11	# cond_false276
.LBB31_32:	# cond_true252
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	jmp	.LBB31_12	# cond_next297
.LBB31_33:	# cond_true323
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
.LBB31_34:	# cond_next368
	leal	(%rdx,%rdi), %r8d
	movslq	%r8d, %r9
	cmpw	%bp, (%rbx,%r9,4)
	je	.LBB31_16	# cond_next441
.LBB31_35:	# cond_true385
	movw	(%r12,%r9,2), %r10w
	testw	%r10w, %r10w
	jle	.LBB31_15	# cond_false420
.LBB31_36:	# cond_true396
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
	jmp	.LBB31_16	# cond_next441
.LBB31_37:	# cond_true468
	movslq	%eax, %r10
	movl	%r8d, (%r14,%r10,4)
	movw	%bp, (%rbx,%r9,4)
	movw	%r13w, 2(%rbx,%r9,4)
	incl	%eax
.LBB31_38:	# cond_next513
	addl	%ecx, %edi
	movslq	%edi, %r8
	cmpw	%bp, (%rbx,%r8,4)
	je	.LBB31_20	# cond_next586
.LBB31_39:	# cond_true530
	movw	(%r12,%r8,2), %r9w
	testw	%r9w, %r9w
	jle	.LBB31_19	# cond_false565
.LBB31_40:	# cond_true541
	movslq	%eax, %r9
	movl	%edi, (%r14,%r9,4)
	movw	%bp, (%rbx,%r8,4)
	movw	%r13w, 2(%rbx,%r8,4)
	incl	%eax
	jmp	.LBB31_20	# cond_next586
.LBB31_41:	# cond_true576
	movb	$1, way.22.b
	movl	%edi, way.23
	jmp	.LBB31_23	# UnifiedReturnBlock
	.size	_ZN6wayobj18makeobstaclebound2EPiiS0_, .-_ZN6wayobj18makeobstaclebound2EPiiS0_
	.type	.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str:				# .str
	.size	.str, 23
	.asciz	"Error in createregions"
	.type	way.0,@object
	.bss
	.local	way.0
	.comm	way.0,4,4		# way.0
	.type	way.1,@object
	.local	way.1
	.comm	way.1,4,4		# way.1
	.type	way.2,@object
	.local	way.2
	.comm	way.2,4,4		# way.2
	.type	way.3,@object
	.local	way.3
	.comm	way.3,4,4		# way.3
	.type	way.4,@object
	.local	way.4
	.comm	way.4,4,4		# way.4
	.type	way.5,@object
	.local	way.5
	.comm	way.5,4,4		# way.5
	.type	way.6,@object
	.local	way.6
	.comm	way.6,4,4		# way.6
	.type	way.7,@object
	.local	way.7
	.comm	way.7,4,4		# way.7
	.type	way.8,@object
	.local	way.8
	.comm	way.8,4,4		# way.8
	.type	way.16,@object
	.local	way.16
	.comm	way.16,8,8		# way.16
	.type	way.17,@object
	.local	way.17
	.comm	way.17,8,8		# way.17
	.type	way.18,@object
	.local	way.18
	.comm	way.18,8,8		# way.18
	.type	way.19,@object
	.local	way.19
	.comm	way.19,8,8		# way.19
	.type	way.20,@object
	.local	way.20
	.comm	way.20,4,4		# way.20
	.type	way.21,@object
	.local	way.21
	.comm	way.21,4,4		# way.21
	.type	way.22.b,@object
	.local	way.22.b
	.comm	way.22.b,1,1		# way.22.b
	.type	way.23,@object
	.local	way.23
	.comm	way.23,4,4		# way.23
	.type	way.24,@object
	.local	way.24
	.comm	way.24,2,2		# way.24
	.type	way.25,@object
	.local	way.25
	.comm	way.25,2,2		# way.25
	.type	regway,@object
	.data
	.align	32
regway:				# regway
	.size	regway, 80
	.quad	(_ZTV9regwayobj) + 16
	.zero	16
	.zero	16
	.zero	4
	.zero	4
	.zero	8
	.zero	1
	.zero	7
	.zero	8
	.zero	8
	.type	regmng,@object
	.bss
	.local	regmng
	.comm	regmng,408,32		# regmng
	.type	way2,@object
	.local	way2
	.comm	way2,4432,32		# way2
	.type	.str1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str1:				# .str1
	.size	.str1, 33
	.asciz	"Create regional map time : %.0f\n"
	.type	.str12,@object
	.align	16
.str12:				# .str12
	.size	.str12, 25
	.asciz	"Create ways time : %.0f\n"
	.type	.str2,@object
	.align	16
.str2:				# .str2
	.size	.str2, 22
	.asciz	"Ways quantity : %lld\n"
	.type	.str3,@object
	.align	16
.str3:				# .str3
	.size	.str3, 25
	.asciz	"Total way length : %lld\n"
	.type	.str4,@object
	.align	16
.str4:				# .str4
	.size	.str4, 29
	.asciz	"Create reg ways time : %.0f\n"
	.type	.str5,@object
	.align	16
.str5:				# .str5
	.size	.str5, 26
	.asciz	"Reg ways quantity : %lld\n"
	.type	.str6,@object
	.align	16
.str6:				# .str6
	.size	.str6, 29
	.asciz	"Total reg way length : %lld\n"
	.type	.str7,@object
	.align	16
.str7:				# .str7
	.size	.str7, 31
	.asciz	"Create river ways time : %.0f\n"
	.type	.str8,@object
	.align	16
.str8:				# .str8
	.size	.str8, 28
	.asciz	"River ways quantity : %lld\n"
	.type	.str9,@object
	.align	16
.str9:				# .str9
	.size	.str9, 31
	.asciz	"Total river way length : %lld\n"
	.type	.str10,@object
	.align	16
.str10:				# .str10
	.size	.str10, 30
	.asciz	"Create land ways time : %.0f\n"
	.type	.str11,@object
	.align	16
.str11:				# .str11
	.size	.str11, 27
	.asciz	"Land ways quantity : %lld\n"
	.type	.str123,@object
	.align	16
.str123:				# .str123
	.size	.str123, 30
	.asciz	"Total land way length : %lld\n"
	.type	_ZTV9regwayobj,@object
	.section	.rodata
	.align	32
_ZTV9regwayobj:				# _ZTV9regwayobj
	.size	_ZTV9regwayobj, 40
	.zero	8
	.quad	_ZTI9regwayobj
	.quad	_ZN9regwayobj12isaddtoboundEP6regobjS1_
	.quad	_ZN9regwayobj6createEP9regmngobj
	.quad	_ZN9regwayobj7destroyEv
	.type	.str13,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str13:				# .str13
	.size	.str13, 27
	.asciz	"Small Path Finding Library"
	.type	.str14,@object
	.align	16
.str14:				# .str14
	.size	.str14, 24
	.asciz	"Read configuration file"
	.type	.str15,@object
	.align	16
.str15:				# .str15
	.size	.str15, 36
	.asciz	"Cannot read configuration file name"
	.type	.str16,@object
.str16:				# .str16
	.size	.str16, 2
	.asciz	"r"
	.type	.str17,@object
	.align	16
.str17:				# .str17
	.size	.str17, 31
	.asciz	"Cannot read configuration file"
	.type	.str18,@object
.str18:				# .str18
	.size	.str18, 3
	.asciz	"%s"
	.type	.str19,@object
.str19:				# .str19
	.size	.str19, 3
	.asciz	"%d"
	.type	.str20,@object
.str20:				# .str20
	.size	.str20, 3
	.asciz	"%f"
	.type	.str21,@object
.str21:				# .str21
	.size	.str21, 12
	.asciz	"Create ways"
	.type	.str22,@object
.str22:				# .str22
	.size	.str22, 11
	.asciz	"Random map"
	.section .ctors,"aw",@progbits
	.align	8
	.type	y3rnd,@object
	.data
	.align	4
y3rnd:				# y3rnd
	.size	y3rnd, 4
	.long	3007
	.type	y2rnd,@object
	.align	4
y2rnd:				# y2rnd
	.size	y2rnd, 4
	.long	11
	.type	y1rnd,@object
	.align	4
y1rnd:				# y1rnd
	.size	y1rnd, 4
	.long	1023
	.type	_ZN6regobj9bound1arpE,@object
	.bss
	.local	_ZN6regobj9bound1arpE
	.comm	_ZN6regobj9bound1arpE,16,16		# _ZN6regobj9bound1arpE
	.type	_ZN6regobj6boundlE,@object
	.local	_ZN6regobj6boundlE
	.comm	_ZN6regobj6boundlE,4,4		# _ZN6regobj6boundlE
	.type	_ZN6regobj9bound2arpE,@object
	.local	_ZN6regobj9bound2arpE
	.comm	_ZN6regobj9bound2arpE,16,16		# _ZN6regobj9bound2arpE
	.type	_ZTI9regwayobj,@object
	.section	.rodata
	.align	16
_ZTI9regwayobj:				# _ZTI9regwayobj
	.size	_ZTI9regwayobj, 16
	.quad	(_ZTVN10__cxxabiv117__class_type_infoE) + (16)
	.quad	_ZTS9regwayobj
	.type	_ZTS9regwayobj,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
_ZTS9regwayobj:				# _ZTS9regwayobj
	.size	_ZTS9regwayobj, 11
	.asciz	"9regwayobj"

