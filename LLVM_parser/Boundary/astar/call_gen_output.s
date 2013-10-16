

	.text
	.align	16
	.type	hash_insert,@function
hash_insert:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$72, %rsp
	movl	gCSEdgeTableSize, %eax
	movl	%eax, 28(%rsp)
	testl	%eax, %eax
	movq	gCSEdgeTable, %rax
	movq	%rax, (%rsp)
	movl	%edx, 40(%rsp)
	movl	%esi, 44(%rsp)
	movq	%rdi, 32(%rsp)
	jne	.LBB1_2	# cond_next
.LBB1_1:	# cond_true
	movl	$560, %ebx
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, gCSEdgeTable
	xorl	%ecx, %ecx
	movq	%rax, %rdi
	movl	%ecx, %esi
	movq	%rbx, %rdx
	call	memset
	movq	gCSEdgeTable, %rax
	movq	%rax, (%rsp)
	movl	$7, gCSEdgeTableSize
	movl	$7, 28(%rsp)
.LBB1_2:	# cond_next
	movq	32(%rsp), %rax
	movq	%rax, 64(%rsp)
	leaq	64(%rsp), %rdi
	call	APHash
	incq	gNumHashFind
	cmpl	$0, 28(%rsp)
	je	.LBB1_31	# cond_next.bb112_crit_edge
.LBB1_3:	# bb57.preheader
	movl	44(%rsp), %ecx
	movl	40(%rsp), %esi
	xorl	%edi, %edi
	movq	gNumConflicts, %r8
.LBB1_4:	# bb57
	xorl	%edx, %edx
	divl	28(%rsp)
	imull	$80, %edx, %eax
	# ZERO-EXTEND 
	movl	%eax, %r9d
	movq	(%rsp), %r10
	leaq	(%r10,%r9), %rax
	leaq	(%rsi,%r9), %r11
	cmpb	$0, (%r10,%r11)
	je	.LBB1_8	# bb57.bb112.loopexit_crit_edge
.LBB1_5:	# cond_next82
	addq	%rcx, %r9
	movq	32(%rsp), %r11
	movq	(%rsp), %r10
	cmpq	%r11, (%r10,%r9)
	je	.LBB1_37	# cond_next82.bb112.loopexit_crit_edge
.LBB1_6:	# cond_next93
	incq	%r8
	incl	%edx
	incl	%edi
	cmpl	28(%rsp), %edi
	jb	.LBB1_10	# cond_next93.bb57_crit_edge
.LBB1_7:	# cond_next93.bb112.loopexit_crit_edge
	xorl	%eax, %eax
.LBB1_8:	# bb57.bb112.loopexit_crit_edge
	xorb	%cl, %cl
.LBB1_9:	# bb112.loopexit
	movq	%r8, gNumConflicts
	jmp	.LBB1_32	# bb112
.LBB1_10:	# cond_next93.bb57_crit_edge
	movl	%edx, %eax
	jmp	.LBB1_4	# bb57
.LBB1_11:	# cond_next153
	movl	28(%rsp), %ebx
	leal	(%rbx,%rbx), %r14d
	# ZERO-EXTEND 
	movl	%r14d, %eax
	imulq	$80, %rax, %rdi
	call	malloc
	movq	%rax, %r15
	movl	%r14d, gCSEdgeTableSize
	imull	$160, %ebx, %ecx
	# ZERO-EXTEND 
	movl	%ecx, %ecx
	movq	%rcx, %rdx
	andq	$3, %rdx
	shrq	$2, %rcx
	xorl	%eax, %eax
	movq	%r15, %rdi
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	testl	%ebx, %ebx
	je	.LBB1_16	# bb312
.LBB1_12:	# bb187.preheader
	testl	%r14d, %r14d
	movl	44(%rsp), %ebx
	movl	40(%rsp), %r12d
	jne	.LBB1_38	# bb187.preheader.bb187_crit_edge
.LBB1_13:	# bb187.preheader.bb187.us_crit_edge
	xorl	%eax, %eax
	movl	%eax, 24(%rsp)
.LBB1_14:	# bb187.us
	# ZERO-EXTEND 
	movl	%eax, %r13d
	leaq	(%r12,%r13), %rax
	movq	(%rsp), %rcx
	cmpb	$1, (%rcx,%rax)
	je	.LBB1_21	# cond_true203.us
.LBB1_15:	# cond_next303.us
	movl	%r13d, %eax
	addl	$80, %eax
	movl	24(%rsp), %ecx
	incl	%ecx
	movl	%ecx, 24(%rsp)
	cmpl	28(%rsp), %ecx
	jne	.LBB1_14	# bb187.us
.LBB1_16:	# bb312
	cmpl	$0, 28(%rsp)
	je	.LBB1_19	# cond_next327
.LBB1_17:	# bb312
	cmpq	$0, (%rsp)
	je	.LBB1_19	# cond_next327
.LBB1_18:	# cond_true324
	movq	(%rsp), %rdi
	call	free
.LBB1_19:	# cond_next327
	movq	32(%rsp), %rax
	movq	%rax, 48(%rsp)
	leaq	48(%rsp), %rdi
	call	APHash
	incq	gNumHashFind
	testl	%r14d, %r14d
	jne	.LBB1_23	# bb361.preheader
.LBB1_20:	# cond_next327.bb416_crit_edge
	xorl	%eax, %eax
	jmp	.LBB1_29	# bb416
.LBB1_21:	# cond_true203.us
	leaq	(%rbx,%r13), %rax
	movq	(%rsp), %rbp
	movq	(%rbp,%rax), %rax
	movq	%rax, 56(%rsp)
	leaq	56(%rsp), %rdi
	call	APHash
	incq	gNumHashFind
	movq	64(%rbp,%r13), %rax
	movq	%rax, 64
	movq	40(%rbp,%r13), %rax
	movq	%rax, 40
	movq	72(%rbp,%r13), %rax
	movq	%rax, 72
	movq	8(%rbp,%r13), %rax
	movq	%rax, 8
	movq	16(%rbp,%r13), %rax
	movq	%rax, 16
	movq	56(%rbp,%r13), %rax
	movq	%rax, 56
	movq	24(%rbp,%r13), %rax
	movq	%rax, 24
	movq	32(%rbp,%r13), %rax
	movq	%rax, 32
	movq	48(%rbp,%r13), %rax
	movq	%rax, 48
	movq	(%rbp,%r13), %rax
	movq	%rax, 0
	jmp	.LBB1_15	# cond_next303.us
.LBB1_22:	# cond_next278.bb242_crit_edge
	movl	%edx, %eax
	jmp	.LBB1_41	# bb242
.LBB1_23:	# bb361.preheader
	movl	44(%rsp), %ecx
	movl	40(%rsp), %esi
	xorl	%edi, %edi
	movq	gNumConflicts, %r8
.LBB1_24:	# bb361
	xorl	%edx, %edx
	divl	%r14d
	imull	$80, %edx, %eax
	# ZERO-EXTEND 
	movl	%eax, %r9d
	leaq	(%r15,%r9), %rax
	leaq	(%rsi,%r9), %r10
	cmpb	$0, (%r15,%r10)
	je	.LBB1_28	# bb416.loopexit
.LBB1_25:	# cond_next386
	addq	%rcx, %r9
	movq	32(%rsp), %r10
	cmpq	%r10, (%r15,%r9)
	je	.LBB1_28	# bb416.loopexit
.LBB1_26:	# cond_next397
	incq	%r8
	incl	%edx
	incl	%edi
	cmpl	%r14d, %edi
	jb	.LBB1_47	# cond_next397.bb361_crit_edge
.LBB1_27:	# cond_next397.bb416.loopexit_crit_edge
	xorl	%eax, %eax
.LBB1_28:	# bb416.loopexit
	movq	%r8, gNumConflicts
.LBB1_29:	# bb416
	movl	40(%rsp), %ecx
	movb	$1, (%rax,%rcx)
	movl	44(%rsp), %ecx
	movq	32(%rsp), %rdx
	movq	%rdx, (%rax,%rcx)
	movq	%r15, gCSEdgeTable
.LBB1_30:	# UnifiedReturnBlock
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB1_31:	# cond_next.bb112_crit_edge
	xorl	%eax, %eax
	xorb	%cl, %cl
.LBB1_32:	# bb112
	testq	%rax, %rax
	je	.LBB1_34	# cond_next127
.LBB1_33:	# bb112
	cmpb	$1, %cl
	je	.LBB1_30	# UnifiedReturnBlock
.LBB1_34:	# cond_next127
	testq	%rax, %rax
	je	.LBB1_11	# cond_next153
.LBB1_35:	# cond_next127
	testb	%cl, %cl
	jne	.LBB1_11	# cond_next153
.LBB1_36:	# cond_true137
	movl	40(%rsp), %ecx
	movb	$1, (%rax,%rcx)
	movl	44(%rsp), %ecx
	movq	32(%rsp), %rdx
	movq	%rdx, (%rax,%rcx)
	jmp	.LBB1_30	# UnifiedReturnBlock
.LBB1_37:	# cond_next82.bb112.loopexit_crit_edge
	movb	$1, %cl
	jmp	.LBB1_9	# bb112.loopexit
.LBB1_38:	# bb187.preheader.bb187_crit_edge
	xorl	%eax, %eax
	movl	%eax, 20(%rsp)
.LBB1_39:	# bb187
	# ZERO-EXTEND 
	movl	%eax, %eax
	movq	%rax, 8(%rsp)
	movq	(%rsp), %rcx
	leaq	(%rcx,%rax), %r13
	leaq	(%r12,%rax), %rax
	cmpb	$1, (%rcx,%rax)
	jne	.LBB1_46	# cond_next303
.LBB1_40:	# cond_true203
	movq	8(%rsp), %rax
	leaq	(%rax,%rbx), %rax
	movq	(%rsp), %rcx
	movq	(%rcx,%rax), %rbp
	movq	%rbp, 56(%rsp)
	leaq	56(%rsp), %rdi
	call	APHash
	incq	gNumHashFind
	xorl	%ecx, %ecx
	movq	gNumConflicts, %rsi
.LBB1_41:	# bb242
	xorl	%edx, %edx
	divl	%r14d
	imull	$80, %edx, %eax
	# ZERO-EXTEND 
	movl	%eax, %eax
	leaq	(%r15,%rax), %rdi
	leaq	(%r12,%rax), %r8
	cmpb	$0, (%r15,%r8)
	je	.LBB1_45	# bb297.loopexit
.LBB1_42:	# cond_next267
	addq	%rbx, %rax
	cmpq	%rbp, (%r15,%rax)
	je	.LBB1_45	# bb297.loopexit
.LBB1_43:	# cond_next278
	incq	%rsi
	incl	%edx
	incl	%ecx
	cmpl	%r14d, %ecx
	jb	.LBB1_22	# cond_next278.bb242_crit_edge
.LBB1_44:	# cond_next278.bb297.loopexit_crit_edge
	xorl	%edi, %edi
.LBB1_45:	# bb297.loopexit
	movq	%rsi, gNumConflicts
	movq	64(%r13), %rax
	movq	%rax, 64(%rdi)
	movq	40(%r13), %rax
	movq	%rax, 40(%rdi)
	movq	72(%r13), %rax
	movq	%rax, 72(%rdi)
	movq	8(%r13), %rax
	movq	%rax, 8(%rdi)
	movq	16(%r13), %rax
	movq	%rax, 16(%rdi)
	movq	56(%r13), %rax
	movq	%rax, 56(%rdi)
	movq	24(%r13), %rax
	movq	%rax, 24(%rdi)
	movq	32(%r13), %rax
	movq	%rax, 32(%rdi)
	movq	48(%r13), %rax
	movq	%rax, 48(%rdi)
	movq	(%r13), %rax
	movq	%rax, (%rdi)
.LBB1_46:	# cond_next303
	movq	8(%rsp), %rax
	addl	$80, %eax
	movl	20(%rsp), %ecx
	incl	%ecx
	movl	%ecx, 20(%rsp)
	cmpl	28(%rsp), %ecx
	je	.LBB1_16	# bb312
	jmp	.LBB1_39	# bb187
.LBB1_47:	# cond_next397.bb361_crit_edge
	movl	%edx, %eax
	jmp	.LBB1_24	# bb361
	.size	hash_insert, .-hash_insert


	.align	16
	.type	CallEdgeProfiler,@function
CallEdgeProfiler:
	pushq	%rbx
	xorl	%eax, %eax
	movb	gCSEdgeValidOffset.b, %cl
	testb	%cl, %cl
	movl	$1000000, %ecx
	cmovne	%eax, %ecx
	cmpl	$1000000, %ecx
	movl	%edx, %ebx
	jne	.LBB2_2	# cond_next
.LBB2_1:	# cond_true
	movb	$1, gCSEdgeValidOffset.b
	movb	$1, gCSEdgeKeyOffset.b
	xorl	%ecx, %ecx
.LBB2_2:	# cond_next
	movl	%ecx, %edx
	movb	gCSEdgeKeyOffset.b, %al
	testb	%al, %al
	movl	$8, %eax
	movl	$1000000, %ecx
	cmovne	%eax, %ecx
	shlq	$32, %rdi
	# ZERO-EXTEND 
	movl	%esi, %eax
	orq	%rax, %rdi
	movl	%ecx, %esi
	call	hash_insert
	xorl	%ecx, %ecx
.LBB2_3:	# bb
	# ZERO-EXTEND 
	movl	%ecx, %ecx
	movl	16(%rax,%rcx,4), %edx
	cmpl	%ebx, %edx
	jne	.LBB2_6	# cond_next39
.LBB2_4:	# cond_true25
	incl	48(%rax,%rcx,4)
.LBB2_5:	# cond_true25
	popq	%rbx
	ret
.LBB2_6:	# cond_next39
	testl	%edx, %edx
	je	.LBB2_9	# cond_true49
.LBB2_7:	# cond_next61
	incl	%ecx
	cmpl	$7, %ecx
	jbe	.LBB2_3	# bb
.LBB2_8:	# bb69
	movl	$95, %edx
	leaq	__PRETTY_FUNCTION__.2597, %rcx
	leaq	.str1, %rsi
	leaq	.str, %rdi
	call	__assert_fail
.LBB2_9:	# cond_true49
	movl	%ebx, 16(%rax,%rcx,4)
	movl	$1, 48(%rax,%rcx,4)
	jmp	.LBB2_5	# cond_true25
	.size	CallEdgeProfiler, .-CallEdgeProfiler


	.align	16
	.type	CallProfPrinter,@function
CallProfPrinter:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	leaq	.str3, %rsi
	leaq	.str2, %rdi
	call	fopen
	cmpl	$0, gCSEdgeTableSize
	movq	gCSEdgeTable, %rdi
	movq	%rax, %rbx
	je	.LBB3_9	# bb84
.LBB3_1:	# bb.preheader
	xorl	%eax, %eax
	jmp	.LBB3_8	# bb78.bb_crit_edge
.LBB3_2:	# bb
	# ZERO-EXTEND 
	movl	%eax, %r14d
	imulq	$80, %r14, %rax
	cmpb	$0, (%rcx,%rax)
	je	.LBB3_7	# bb78
.LBB3_3:	# cond_true
	imulq	$80, %r14, %rcx
	movq	8(%rdi,%rcx), %rdx
	movl	%edx, %ecx
	shrq	$32, %rdx
	xorb	%al, %al
	leaq	.str4, %rsi
	movq	%rbx, %rdi
	call	fprintf
	xorl	%eax, %eax
.LBB3_4:	# bb29
	imulq	$80, %r14, %rcx
	movq	gCSEdgeTable, %rsi
	addq	%rsi, %rcx
	# ZERO-EXTEND 
	movl	%eax, %r15d
	movl	16(%rcx,%r15,4), %edx
	testl	%edx, %edx
	je	.LBB3_6	# bb71
.LBB3_5:	# cond_true42
	imulq	$80, %r14, %rcx
	addq	%rcx, %rsi
	movl	48(%rsi,%r15,4), %ecx
	xorb	%al, %al
	leaq	.str5, %rsi
	movq	%rbx, %rdi
	call	fprintf
	movl	%r15d, %eax
	incl	%eax
	cmpl	$7, %eax
	jbe	.LBB3_4	# bb29
.LBB3_6:	# bb71
	movl	$10, %edi
	movq	%rbx, %rsi
	call	fputc
.LBB3_7:	# bb78
	movl	%r14d, %eax
	incl	%eax
	cmpl	gCSEdgeTableSize, %eax
	movq	gCSEdgeTable, %rdi
	jae	.LBB3_9	# bb84
.LBB3_8:	# bb78.bb_crit_edge
	movq	%rdi, %rcx
	jmp	.LBB3_2	# bb
.LBB3_9:	# bb84
	call	free
	movq	%rbx, %rdi
	call	fclose
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
	.size	CallProfPrinter, .-CallProfPrinter


	.align	16
	.type	APHash,@function
APHash:
	xorl	%ecx, %ecx
	movl	$2863311530, %edx
.LBB4_1:	# bb
	testq	$1, %rcx
	je	.LBB4_6	# cond_true
.LBB4_2:	# cond_false
	movsbl	(%rdi,%rcx), %eax
	movl	%edx, %esi
	shrl	$5, %esi
	xorl	%esi, %eax
	movl	%edx, %esi
	shll	$11, %esi
	addl	%esi, %eax
	notl	%eax
.LBB4_3:	# bb30
	xorl	%edx, %eax
	incq	%rcx
	cmpq	$8, %rcx
	je	.LBB4_5	# bb36
.LBB4_4:	# bb30.bb_crit_edge
	movl	%eax, %edx
	jmp	.LBB4_1	# bb
.LBB4_5:	# bb36
	ret
.LBB4_6:	# cond_true
	movsbl	(%rdi,%rcx), %eax
	movl	%edx, %esi
	shrl	$3, %esi
	imull	%esi, %eax
	movl	%edx, %esi
	shll	$7, %esi
	xorl	%esi, %eax
	jmp	.LBB4_3	# bb30
	.size	APHash, .-APHash


	.align	16
	.type	_ZN6wayobj9createwayEiiiiRP8point16tRi,@function
_ZN6wayobj9createwayEiiiiRP8point16tRi:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$104, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movl	%r14d, 48(%rsp)
	movl	%edx, %r15d
	movl	%ecx, 52(%rsp)
	movq	%r8, 32(%rsp)
	movq	%r9, 64(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 56(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 60(%rsp)
	movl	$1, cg_caller_id_var
	movl	$1, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	testl	%r14d, %r14d
	jle	.LBB5_55	# cond_true21
.LBB5_1:	# entry
	testl	%ebx, %ebx
	jle	.LBB5_55	# cond_true21
.LBB5_2:	# cond_next11.i
	movl	way.5, %eax
	cmpl	%ebx, %eax
	jl	.LBB5_55	# cond_true21
.LBB5_3:	# cond_next21.i
	movl	way.6, %ecx
	cmpl	48(%rsp), %ecx
	jl	.LBB5_55	# cond_true21
.LBB5_4:	# cond_next
	cmpl	$0, 52(%rsp)
	jle	.LBB5_55	# cond_true21
.LBB5_5:	# cond_next
	testl	%r15d, %r15d
	jle	.LBB5_55	# cond_true21
.LBB5_6:	# cond_next
	cmpl	%r15d, %eax
	jl	.LBB5_55	# cond_true21
.LBB5_7:	# cond_next
	cmpl	52(%rsp), %ecx
	jl	.LBB5_55	# cond_true21
.LBB5_8:	# bb16
	movb	way.2, %cl
	movl	52(%rsp), %eax
	shll	%cl, %eax
	orl	%r15d, %eax
	movslq	%eax, %rax
	movq	way.16, %rcx
	cmpw	$0, (%rcx,%rax,2)
	jne	.LBB5_55	# cond_true21
.LBB5_9:	# cond_next55
	movl	48(%rsp), %eax
	cmpl	52(%rsp), %eax
	jne	.LBB5_13	# cond_next75
.LBB5_10:	# cond_next55
	cmpl	%r15d, %ebx
	jne	.LBB5_13	# cond_next75
.LBB5_11:	# cond_true69
	movl	$4, %edi
	call	malloc
	movq	32(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	64(%rsp), %rcx
	movl	$1, (%rcx)
	movl	56(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	60(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	$1, %eax
.LBB5_12:	# cond_true69
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB5_13:	# cond_next75
	movw	way.25, %ax
	movw	%ax, 46(%rsp)
	cmpw	$65535, %ax
	jne	.LBB5_15	# cond_next.i
.LBB5_14:	# cond_true.i
	movq	way.17, %rdi
	movb	way.1, %al
	movb	way.0, %cl
	movl	$0, cg_caller_call_site_var
	movl	$1, cg_caller_id_var
	movl	$1, %edx
	shll	%cl, %edx
	movb	%al, %cl
	shll	%cl, %edx
	movslq	%edx, %rdx
	shlq	$2, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$0, way.25
	movw	$0, 46(%rsp)
.LBB5_15:	# cond_next.i
	movw	46(%rsp), %ax
	incw	%ax
	movw	%ax, 46(%rsp)
	movw	%ax, way.25
	movl	way.2, %ecx
	movl	%ecx, 40(%rsp)
	movl	48(%rsp), %edx
	shll	%cl, %edx
	orl	%ebx, %edx
	movl	%edx, 48(%rsp)
	movq	way.18, %rbx
	movl	%edx, (%rbx)
	movslq	%edx, %rdx
	movq	way.17, %rsi
	movq	%rsi, 24(%rsp)
	movw	%ax, (%rsi,%rdx,4)
	movw	$0, 2(%rsi,%rdx,4)
	movb	$0, way.22.b
	movl	52(%rsp), %eax
	shll	%cl, %eax
	orl	%r15d, %eax
	movl	%eax, 52(%rsp)
	movl	%eax, way.23
	movw	$1, way.24
	movq	way.19, %r14
	movw	$0, 14(%rsp)
	xorb	%r15b, %r15b
	movl	$1, %eax
	jmp	.LBB5_19	# cond_next139.i
.LBB5_16:	# bb101.i
	testb	%r15b, %r15b
	je	.LBB5_56	# cond_true107.i
.LBB5_17:	# cond_false.i8
	movl	$1, cg_caller_call_site_var
	movl	$31, cg_caller_id_var
	movq	%r14, %rdi
	movl	%r12d, %esi
	movq	%rbx, %rdx
	call	_ZN6wayobj10makebound2EPiiS0_
	xorb	%r15b, %r15b
.LBB5_18:	# bb133.i
	movw	14(%rsp), %cx
	movw	%cx, %dx
	addw	$2, %dx
	movw	%dx, way.24
	movl	20(%rsp), %r12d
	movl	%r12d, cg_caller_call_site_var
	movl	16(%rsp), %r12d
	movl	%r12d, cg_caller_id_var
	incw	%cx
	movw	%cx, 14(%rsp)
	testl	%eax, %eax
	je	.LBB5_20	# bb133.i._ZN6wayobj4fillEiiii.exit_crit_edge
.LBB5_19:	# cond_next139.i
	movl	%eax, %r12d
	movl	cg_caller_call_site_var, %r13d
	movl	%r13d, 20(%rsp)
	movl	cg_caller_id_var, %ebp
	movl	%ebp, 16(%rsp)
	movl	$31, cg_caller_id_var
	movl	$31, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movb	way.22.b, %al
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	xorb	$1, %al
	testb	$1, %al
	jne	.LBB5_16	# bb101.i
.LBB5_20:	# bb133.i._ZN6wayobj4fillEiiii.exit_crit_edge
	incw	14(%rsp)
.LBB5_21:	# _ZN6wayobj4fillEiiii.exit
	movb	way.22.b, %al
	testb	%al, %al
	je	.LBB5_57	# cond_true86
.LBB5_22:	# cond_next90
	movw	$65535, 72(%rsp)
	movw	$1, 74(%rsp)
	movw	$0, 76(%rsp)
	movw	$1, 78(%rsp)
	movw	$1, 80(%rsp)
	movw	$1, 82(%rsp)
	movw	$1, 84(%rsp)
	movw	$0, 86(%rsp)
	movw	$1, 88(%rsp)
	movw	$65535, 90(%rsp)
	movw	$0, 92(%rsp)
	movw	$65535, 94(%rsp)
	movw	$65535, 96(%rsp)
	movw	$65535, 98(%rsp)
	movw	$65535, 100(%rsp)
	movw	$0, 102(%rsp)
	movswl	14(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$2, %rdi
	call	malloc
	movq	32(%rsp), %rdx
	movq	%rax, (%rdx)
	movl	40(%rsp), %eax
	movb	%al, %cl
	movl	48(%rsp), %eax
	movl	%eax, %r14d
	sarl	%cl, %r14d
	movl	way.21, %r15d
	andl	%r15d, %eax
	movl	%eax, 48(%rsp)
	leal	-2(%rbx), %eax
	testl	%eax, %eax
	jle	.LBB5_54	# bb567.i
.LBB5_23:	# bb174.i.preheader
	movswl	14(%rsp), %r12d
	addl	$4294967294, %r12d
	movl	%r15d, 8(%rsp)
	movl	40(%rsp), %eax
	movl	%eax, 4(%rsp)
	movl	52(%rsp), %r13d
.LBB5_24:	# bb174.i
	movl	$32, cg_caller_id_var
	movl	$32, %edx
	movl	16(%rsp), %edi
	movl	20(%rsp), %esi
	call	CallEdgeProfiler
	movl	40(%rsp), %eax
	movb	%al, %cl
	movl	%r13d, %eax
	sarl	%cl, %eax
	movl	%r14d, %ecx
	subl	%eax, %ecx
	andl	%r15d, %r13d
	movl	48(%rsp), %edx
	subl	%r13d, %edx
	testl	%edx, %edx
	jg	.LBB5_60	# bb174.i.cond_next215.i_crit_edge
.LBB5_25:	# cond_false.i
	testl	%edx, %edx
	jns	.LBB5_27	# cond_next215.i
.LBB5_26:	# cond_true214.i
	movl	$4294967295, %edx
.LBB5_27:	# cond_next215.i
	testl	%ecx, %ecx
	jg	.LBB5_61	# cond_next215.i.cond_next228.i_crit_edge
.LBB5_28:	# cond_false221.i
	testl	%ecx, %ecx
	jns	.LBB5_30	# cond_next228.i
.LBB5_29:	# cond_true226.i
	movl	$4294967295, %ecx
.LBB5_30:	# cond_next228.i
	imull	$100, %ecx, %ecx
	imull	$4294967256, %edx, %esi
	cmpl	%esi, %ecx
	movl	$4294967295, %esi
	movl	$1, %edi
	movl	%edi, %r8d
	cmovl	%esi, %r8d
	imull	$4294967056, %edx, %r9d
	cmpl	%r9d, %ecx
	movl	%edi, %r9d
	cmovl	%esi, %r9d
	imull	$41, %edx, %r10d
	cmpl	%r10d, %ecx
	movl	%edi, %r10d
	cmovl	%esi, %r10d
	imull	$241, %edx, %edx
	cmpl	%edx, %ecx
	cmovl	%esi, %edi
	cmpl	$1, %edi
	jne	.LBB5_32	# cond_next285.i
.LBB5_31:	# cond_next228.i
	cmpl	$1, %r9d
	je	.LBB5_62	# cond_next228.i.bb549.i_crit_edge
.LBB5_32:	# cond_next285.i
	cmpl	$1, %r10d
	jne	.LBB5_34	# cond_next298.i
.LBB5_33:	# cond_next285.i
	cmpl	$4294967295, %edi
	je	.LBB5_63	# cond_next285.i.bb549.i_crit_edge
.LBB5_34:	# cond_next298.i
	cmpl	$1, %r8d
	jne	.LBB5_36	# cond_next311.i
.LBB5_35:	# cond_next298.i
	cmpl	$4294967295, %r10d
	je	.LBB5_64	# cond_next298.i.bb549.i_crit_edge
.LBB5_36:	# cond_next311.i
	cmpl	$1, %r9d
	jne	.LBB5_38	# cond_next324.i
.LBB5_37:	# cond_next311.i
	cmpl	$4294967295, %r8d
	je	.LBB5_65	# cond_next311.i.bb549.i_crit_edge
.LBB5_38:	# cond_next324.i
	cmpl	$4294967295, %edi
	jne	.LBB5_40	# cond_next337.i
.LBB5_39:	# cond_next324.i
	cmpl	$4294967295, %r9d
	je	.LBB5_66	# cond_next324.i.bb549.i_crit_edge
.LBB5_40:	# cond_next337.i
	cmpl	$1, %edi
	jne	.LBB5_42	# cond_next350.i
.LBB5_41:	# cond_next337.i
	cmpl	$4294967295, %r10d
	je	.LBB5_67	# cond_next337.i.bb549.i_crit_edge
.LBB5_42:	# cond_next350.i
	cmpl	$1, %r10d
	jne	.LBB5_44	# cond_next363.i
.LBB5_43:	# cond_next350.i
	cmpl	$4294967295, %r8d
	je	.LBB5_68	# cond_next350.i.bb549.i_crit_edge
.LBB5_44:	# cond_next363.i
	cmpl	$1, %r8d
	jne	.LBB5_46	# cond_next363.i.bb381.i_crit_edge
.LBB5_45:	# cond_next363.i
	cmpl	$4294967295, %r9d
	je	.LBB5_69	# cond_next363.i.bb549.i_crit_edge
.LBB5_46:	# cond_next363.i.bb381.i_crit_edge
	movl	$7, %edi
	xorl	%r8d, %r8d
	movl	$6, %r9d
.LBB5_47:	# bb381.i
	movslq	%r9d, %rdx
	movswl	74(%rsp,%rdx,4), %esi
	addl	%eax, %esi
	movl	40(%rsp), %ecx
	movl	%esi, %r10d
	shll	%cl, %r10d
	movswl	72(%rsp,%rdx,4), %ecx
	addl	%r13d, %ecx
	orl	%ecx, %r10d
	movslq	%r10d, %rdx
	movw	46(%rsp), %r11w
	movq	24(%rsp), %rbp
	cmpw	%r11w, (%rbp,%rdx,4)
	jne	.LBB5_49	# cond_next458.i
.LBB5_48:	# cond_true427.i
	movq	24(%rsp), %r11
	movzwl	2(%r11,%rdx,4), %edx
	cmpl	%r12d, %edx
	je	.LBB5_70	# cond_true439.i
.LBB5_49:	# cond_next458.i
	# ZERO-EXTEND 
	movl	%edi, %edx
	movswl	74(%rsp,%rdx,4), %esi
	addl	%eax, %esi
	movl	40(%rsp), %r10d
	movb	%r10b, %cl
	movl	%esi, %r10d
	shll	%cl, %r10d
	movswl	72(%rsp,%rdx,4), %ecx
	addl	%r13d, %ecx
	orl	%ecx, %r10d
	movslq	%r10d, %rdx
	movw	46(%rsp), %r11w
	movq	24(%rsp), %rbp
	cmpw	%r11w, (%rbp,%rdx,4)
	jne	.LBB5_51	# cond_next535.i
.LBB5_50:	# cond_true504.i
	movq	24(%rsp), %r11
	movzwl	2(%r11,%rdx,4), %edx
	cmpl	%r12d, %edx
	je	.LBB5_70	# cond_true439.i
.LBB5_51:	# cond_next535.i
	decl	%r9d
	testl	%r9d, %r9d
	movl	$7, %r10d
	cmovs	%r10d, %r9d
	incl	%edi
	andl	$7, %edi
	incl	%r8d
.LBB5_52:	# bb549.i
	movl	20(%rsp), %r10d
	movl	%r10d, cg_caller_call_site_var
	movl	16(%rsp), %r10d
	movl	%r10d, cg_caller_id_var
	cmpl	$3, %r8d
	jle	.LBB5_47	# bb381.i
.LBB5_53:	# bb554.i
	movq	32(%rsp), %rbx
	movq	(%rbx), %rdi
	call	free
	movq	$0, (%rbx)
	movq	64(%rsp), %rcx
	movl	$0, (%rcx)
	movl	56(%rsp), %r10d
	movl	%r10d, cg_caller_call_site_var
	movl	60(%rsp), %r10d
	movl	%r10d, cg_caller_id_var
	xorl	%r10d, %r10d
	movl	%r10d, %eax
	jmp	.LBB5_12	# cond_true69
.LBB5_54:	# bb567.i
	movq	32(%rsp), %rax
	movq	(%rax), %rcx
	movl	48(%rsp), %edx
	movw	%dx, (%rcx)
	movw	%r14w, 2(%rcx)
	movl	52(%rsp), %edx
	andl	%edx, %r15d
	movl	%ebx, %ecx
	decl	%ecx
	movslq	%ecx, %rsi
	movq	(%rax), %rax
	movw	%r15w, (%rax,%rsi,4)
	movl	40(%rsp), %ecx
	sarl	%cl, %edx
	movw	%dx, 2(%rax,%rsi,4)
	movq	64(%rsp), %rax
	movl	%ebx, (%rax)
	movl	56(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	60(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	$1, %eax
	jmp	.LBB5_59	# cond_true86
.LBB5_55:	# cond_true21
	movq	32(%rsp), %rax
	movq	$0, (%rax)
	movq	64(%rsp), %rax
	movl	$0, (%rax)
	movl	56(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	60(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	jmp	.LBB5_58	# cond_true86
.LBB5_56:	# cond_true107.i
	movl	$0, cg_caller_call_site_var
	movl	$31, cg_caller_id_var
	movq	%rbx, %rdi
	movl	%r12d, %esi
	movq	%r14, %rdx
	call	_ZN6wayobj10makebound2EPiiS0_
	movb	$1, %r15b
	jmp	.LBB5_18	# bb133.i
.LBB5_57:	# cond_true86
	movq	32(%rsp), %rax
	movq	$0, (%rax)
	movq	64(%rsp), %rax
	movl	$0, (%rax)
	movl	56(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	60(%rsp), %eax
	movl	%eax, cg_caller_id_var
.LBB5_58:	# cond_true86
	xorl	%eax, %eax
.LBB5_59:	# cond_true86
	addq	$104, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB5_60:	# bb174.i.cond_next215.i_crit_edge
	movl	$1, %edx
	jmp	.LBB5_27	# cond_next215.i
.LBB5_61:	# cond_next215.i.cond_next228.i_crit_edge
	movl	$1, %ecx
	jmp	.LBB5_30	# cond_next228.i
.LBB5_62:	# cond_next228.i.bb549.i_crit_edge
	movl	$2, %edi
	xorl	%r8d, %r8d
	movl	$1, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_63:	# cond_next285.i.bb549.i_crit_edge
	movl	$3, %edi
	xorl	%r8d, %r8d
	movl	$2, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_64:	# cond_next298.i.bb549.i_crit_edge
	movl	$4, %edi
	xorl	%r8d, %r8d
	movl	$3, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_65:	# cond_next311.i.bb549.i_crit_edge
	movl	$5, %edi
	xorl	%r8d, %r8d
	movl	$4, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_66:	# cond_next324.i.bb549.i_crit_edge
	movl	$6, %edi
	xorl	%r8d, %r8d
	movl	$5, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_67:	# cond_next337.i.bb549.i_crit_edge
	movl	$7, %edi
	xorl	%r8d, %r8d
	movl	$6, %r9d
	jmp	.LBB5_52	# bb549.i
.LBB5_68:	# cond_next350.i.bb549.i_crit_edge
	xorl	%edi, %edi
	movl	$7, %r9d
	movl	%edi, %r8d
	jmp	.LBB5_52	# bb549.i
.LBB5_69:	# cond_next363.i.bb549.i_crit_edge
	movl	$1, %edi
	xorl	%r9d, %r9d
	movl	%r9d, %r8d
	jmp	.LBB5_52	# bb549.i
.LBB5_70:	# cond_true439.i
	movslq	%r12d, %rax
	movq	32(%rsp), %rdx
	movq	(%rdx), %rdi
	movw	%cx, (%rdi,%rax,4)
	movq	(%rdx), %rcx
	movw	%si, 2(%rcx,%rax,4)
.LBB5_71:	# bb562.i
	movl	20(%rsp), %r13d
	movl	%r13d, cg_caller_call_site_var
	movl	16(%rsp), %r13d
	movl	%r13d, cg_caller_id_var
	decl	%r12d
	testl	%r12d, %r12d
	jle	.LBB5_54	# bb567.i
.LBB5_72:	# bb562.i.bb174.i_crit_edge
	movl	%r10d, %r13d
	jmp	.LBB5_24	# bb174.i
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
	subq	$40, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 16(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 20(%rsp)
	movl	$2, cg_caller_id_var
	movl	$2, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	testl	%r14d, %r14d
	jle	.LBB6_4	# cond_true49
.LBB6_1:	# entry
	testl	%ebx, %ebx
	jle	.LBB6_4	# cond_true49
.LBB6_2:	# cond_next21
	cmpl	%ebx, way.5
	jl	.LBB6_4	# cond_true49
.LBB6_3:	# cond_next31
	cmpl	%r14d, way.6
	jge	.LBB6_11	# cond_next41
.LBB6_4:	# cond_true49
	movq	24(%rsp), %rax
	movl	%ebx, (%rax)
	movq	32(%rsp), %rax
	movl	%r14d, (%rax)
	movl	16(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	20(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	$1, %eax
.LBB6_5:	# cond_true49
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB6_6:	# bb174
	testb	%bl, %bl
	je	.LBB6_15	# cond_true180
.LBB6_7:	# cond_false
	movl	$1, cg_caller_call_site_var
	movl	$33, cg_caller_id_var
	movq	%r14, %rdi
	movl	%r13d, %esi
	movq	(%rsp), %rdx
	call	_ZN6wayobj18makeobstaclebound2EPiiS0_
	xorb	%bl, %bl
.LBB6_8:	# bb206
	movw	%r15w, way.24
	movl	%r12d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incw	%r15w
	testl	%eax, %eax
	je	.LBB6_10	# bb220
.LBB6_9:	# cond_next212
	movl	%eax, %r13d
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %ebp
	movl	$33, cg_caller_id_var
	movl	$33, %edx
	movl	%ebp, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movb	way.22.b, %al
	movl	%r12d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	xorb	$1, %al
	testb	$1, %al
	jne	.LBB6_6	# bb174
.LBB6_10:	# bb220
	movl	way.23, %eax
	movl	%eax, %ecx
	andl	way.21, %ecx
	movq	24(%rsp), %rdx
	movl	%ecx, (%rdx)
	movl	12(%rsp), %ecx
	sarl	%cl, %eax
	movq	32(%rsp), %rcx
	movl	%eax, (%rcx)
	movzbl	way.22.b, %eax
	movl	16(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	20(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	jmp	.LBB6_5	# cond_true49
.LBB6_11:	# cond_next41
	movb	way.2, %cl
	movl	%r14d, %eax
	shll	%cl, %eax
	orl	%ebx, %eax
	movslq	%eax, %rax
	movq	way.16, %rcx
	cmpw	$0, (%rcx,%rax,2)
	je	.LBB6_4	# cond_true49
.LBB6_12:	# cond_next89
	movw	way.25, %ax
	cmpw	$65535, %ax
	jne	.LBB6_14	# cond_next113
.LBB6_13:	# cond_true96
	movq	way.17, %rdi
	movb	way.1, %al
	movb	way.0, %cl
	movl	$0, cg_caller_call_site_var
	movl	$2, cg_caller_id_var
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
.LBB6_14:	# cond_next113
	incw	%ax
	movw	%ax, way.25
	movl	way.2, %ecx
	movl	%ecx, 12(%rsp)
	shll	%cl, %r14d
	orl	%ebx, %r14d
	movq	way.18, %rcx
	movq	%rcx, (%rsp)
	movl	%r14d, (%rcx)
	movslq	%r14d, %rcx
	movq	way.17, %rdx
	movw	%ax, (%rdx,%rcx,4)
	movw	$0, 2(%rdx,%rcx,4)
	movb	$0, way.22.b
	movw	$1, way.24
	xorb	%bl, %bl
	movq	way.19, %r14
	movw	$2, %r15w
	movl	$1, %eax
	jmp	.LBB6_9	# cond_next212
.LBB6_15:	# cond_true180
	movl	$0, cg_caller_call_site_var
	movl	$33, cg_caller_id_var
	movq	(%rsp), %rdi
	movl	%r13d, %esi
	movq	%r14, %rdx
	call	_ZN6wayobj18makeobstaclebound2EPiiS0_
	movb	$1, %bl
	jmp	.LBB6_8	# bb206
	.size	_ZN6wayobj13findfreepointEiiRiS0_, .-_ZN6wayobj13findfreepointEiiRiS0_


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI7_0:					#  float
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
	subq	$24, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movl	%edx, %r15d
	movl	%r15d, 8(%rsp)
	movl	%ecx, %r12d
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 12(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 16(%rsp)
	movl	$3, cg_caller_id_var
	movl	$3, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	80(%rbx), %eax
	imull	%r12d, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	72(%rbx), %rcx
	movzbq	(%rcx,%rax), %rcx
	movq	96(%rbx), %rdx
	cmpb	$0, 48(%rdx,%rcx)
	je	.LBB7_5	# cond_false
.LBB7_1:	# cond_true
	movl	8(%rsp), %eax
	subl	48(%rbx), %eax
	imull	%eax, %eax
	movl	%r12d, %ecx
	subl	52(%rbx), %ecx
	imull	%ecx, %ecx
	addl	%eax, %ecx
	cvtsi2ss	%ecx, %xmm0
	addss	.LCPI7_0(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	cmpl	60(%rbx), %eax
	jg	.LBB7_6	# UnifiedReturnBlock
.LBB7_2:	# cond_true83
	movl	12(%r14), %r15d
	cmpl	%r15d, 8(%r14)
	jne	.LBB7_4	# cond_next147
.LBB7_3:	# cond_true102
	leal	(%r15,%r15), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r14), %rsi
	movl	$0, cg_caller_call_site_var
	movl	$3, cg_caller_id_var
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r14), %rdi
	call	free
	movq	%rbp, (%r14)
	movl	%r13d, 12(%r14)
.LBB7_4:	# cond_next147
	movslq	8(%r14), %rax
	movq	(%r14), %rcx
	movl	8(%rsp), %edx
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
	jmp	.LBB7_6	# UnifiedReturnBlock
.LBB7_5:	# cond_false
	movq	64(%rbx), %rcx
	movq	$0, (%rcx,%rax,8)
.LBB7_6:	# UnifiedReturnBlock
	movl	12(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$24, %rsp
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
	subq	$56, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r14, 40(%rsp)
	movq	%rdx, %r15
	movq	%r15, 8(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 52(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 48(%rsp)
	movl	$4, cg_caller_id_var
	movl	$4, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, 8(%r15)
	cmpl	$0, 8(%r14)
	jle	.LBB8_12	# return
.LBB8_1:	# bb.preheader
	movl	$0, 36(%rsp)
.LBB8_2:	# bb
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 32(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 28(%rsp)
	movl	$34, cg_caller_id_var
	movl	$34, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	36(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,8), %edx
	movl	%edx, 24(%rsp)
	movl	%edx, %r14d
	incl	%r14d
	movl	88(%rbx), %esi
	cmpl	%r14d, %esi
	cmovl	%esi, %r14d
	movl	4(%rcx,%rax,8), %eax
	movl	%eax, %r15d
	decl	%r15d
	xorl	%ecx, %ecx
	testl	%r15d, %r15d
	cmovs	%ecx, %r15d
	decl	%edx
	testl	%edx, %edx
	cmovs	%ecx, %edx
	movl	%edx, 20(%rsp)
	incl	%eax
	movl	92(%rbx), %ecx
	movl	%ecx, 4(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB8_10	# bb157
.LBB8_3:	# cond_true104
	cmpl	4(%rsp), %r15d
	jg	.LBB8_11	# bb166
.LBB8_4:	# bb148.preheader
	movl	20(%rsp), %eax
	cmpl	%r14d, %eax
	jg	.LBB8_9	# bb154
.LBB8_5:	# bb112.preheader
	movl	24(%rsp), %r12d
	decl	%r12d
	xorl	%eax, %eax
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
.LBB8_6:	# bb112
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$35, cg_caller_id_var
	movl	$35, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	80(%rbx), %eax
	imull	%r15d, %eax
	addl	%r12d, %eax
	movslq	%eax, %rax
	movq	64(%rbx), %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB8_8	# cond_next145
.LBB8_7:	# cond_true140
	movl	$0, cg_caller_call_site_var
	movl	$35, cg_caller_id_var
	movq	%rbx, %rdi
	movq	8(%rsp), %rsi
	movl	%r12d, %edx
	movl	%r15d, %ecx
	call	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii
.LBB8_8:	# cond_next145
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r12d
	cmpl	%r14d, %r12d
	jle	.LBB8_6	# bb112
.LBB8_9:	# bb154
	incl	%r15d
	movl	4(%rsp), %eax
.LBB8_10:	# bb157
	cmpl	%eax, %r15d
	jle	.LBB8_13	# bb157.bb148.preheader_crit_edge
.LBB8_11:	# bb166
	movl	36(%rsp), %eax
	incl	%eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jg	.LBB8_2	# bb
.LBB8_12:	# return
	movl	52(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	48(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB8_13:	# bb157.bb148.preheader_crit_edge
	movl	%eax, 4(%rsp)
	jmp	.LBB8_4	# bb148.preheader
	.size	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_, .-_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_


	.align	16
	.type	_ZN11regboundobj4stepEv,@function
_ZN11regboundobj4stepEv:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$5, cg_caller_id_var
	movl	$5, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	cmpl	$0, 36(%rbx)
	je	.LBB9_6	# UnifiedReturnBlock
.LBB9_1:	# cond_next
	cmpb	$0, 104(%rbx)
	je	.LBB9_6	# UnifiedReturnBlock
.LBB9_2:	# bb14
	cmpb	$0, 32(%rbx)
	jne	.LBB9_5	# cond_false
.LBB9_3:	# cond_true22
	movl	$0, cg_caller_call_site_var
	movl	$5, cg_caller_id_var
	leaq	16(%rbx), %rdx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	call	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_
	movl	24(%rbx), %ecx
	movl	%ecx, 36(%rbx)
	movb	$1, 32(%rbx)
.LBB9_4:	# cond_true22
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	testl	%ecx, %ecx
	setne	%cl
	movzbl	%cl, %r14d
	movl	%r14d, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
.LBB9_5:	# cond_false
	movl	$1, cg_caller_call_site_var
	movl	$5, cg_caller_id_var
	leaq	16(%rbx), %rsi
	movq	%rbx, %rdi
	movq	%rbx, %rdx
	call	_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_
	movl	8(%rbx), %ecx
	movl	%ecx, 36(%rbx)
	movb	$0, 32(%rbx)
	jmp	.LBB9_4	# cond_true22
.LBB9_6:	# UnifiedReturnBlock
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
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
	subq	$24, %rsp
	movq	%rdi, %rbx
	movl	%esi, %r14d
	movl	%r14d, 12(%rsp)
	movl	%edx, %r15d
	movq	%rcx, %r12
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 16(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 20(%rsp)
	movl	$6, cg_caller_id_var
	movl	$6, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
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
	jne	.LBB10_3	# cond_next
.LBB10_1:	# cond_true
	movl	$0, 36(%rbx)
	movl	16(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	20(%rsp), %r15d
	movl	%r15d, cg_caller_id_var
.LBB10_2:	# cond_true
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB10_3:	# cond_next
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
	movl	12(%rsp), %ecx
	movl	%ecx, %edx
	decl	%edx
	testl	%edx, %edx
	cmovs	%eax, %edx
	movl	%edx, 8(%rsp)
	movl	%ecx, %r12d
	incl	%r12d
	movl	88(%rbx), %eax
	cmpl	%r12d, %eax
	cmovl	%eax, %r12d
	movl	92(%rbx), %eax
	movl	%eax, 4(%rsp)
	incl	%r15d
	cmpl	%r15d, %eax
	jge	.LBB10_11	# bb228
.LBB10_4:	# cond_true174
	cmpl	4(%rsp), %r14d
	jg	.LBB10_13	# bb234
.LBB10_5:	# bb219.preheader
	movl	8(%rsp), %r15d
	cmpl	%r12d, %r15d
	jg	.LBB10_10	# bb225
.LBB10_6:	# bb.nph
	movl	12(%rsp), %r15d
	decl	%r15d
	xorl	%eax, %eax
	testl	%r15d, %r15d
	cmovs	%eax, %r15d
.LBB10_7:	# bb182
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$36, cg_caller_id_var
	movl	$36, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	80(%rbx), %eax
	imull	%r14d, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	64(%rbx), %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB10_9	# cond_next216
.LBB10_8:	# cond_true210
	movl	$0, cg_caller_call_site_var
	movl	$36, cg_caller_id_var
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	movl	%r15d, %edx
	movl	%r14d, %ecx
	call	_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii
.LBB10_9:	# cond_next216
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r15d
	cmpl	%r12d, %r15d
	jle	.LBB10_7	# bb182
.LBB10_10:	# bb225
	incl	%r14d
	movl	4(%rsp), %r15d
.LBB10_11:	# bb228
	cmpl	%r15d, %r14d
	jg	.LBB10_13	# bb234
.LBB10_12:	# bb228.bb219.preheader_crit_edge
	movl	%r15d, 4(%rsp)
	jmp	.LBB10_5	# bb219.preheader
.LBB10_13:	# bb234
	movb	$0, 32(%rbx)
	movl	8(%rbx), %eax
	movl	%eax, 36(%rbx)
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jmp	.LBB10_2	# cond_true
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
	subq	$56, %rsp
	movq	%rdi, %rbx
	movq	%rbx, 40(%rsp)
	movq	%rsi, %r14
	movq	%r14, 8(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 52(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 48(%rsp)
	movl	$7, cg_caller_id_var
	movl	$7, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, 8(%r14)
	cmpl	$0, 8(%rbx)
	jle	.LBB11_13	# return
.LBB11_1:	# bb.preheader
	movl	$0, 36(%rsp)
.LBB11_2:	# bb
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 32(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 28(%rsp)
	movl	$37, cg_caller_id_var
	movl	$37, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	36(%rsp), %rax
	movq	40(%rsp), %rcx
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
	jge	.LBB11_11	# bb319
.LBB11_3:	# cond_true104
	cmpl	20(%rsp), %ebx
	jg	.LBB11_12	# bb328
.LBB11_4:	# bb310.preheader
	movl	24(%rsp), %r14d
	jmp	.LBB11_20	# bb310
.LBB11_5:	# bb112
	movl	$39, cg_caller_id_var
	movl	$39, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	je	.LBB11_19	# cond_next307
.LBB11_6:	# cond_true132
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	movb	regmng+48(%rax), %al
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	testb	%al, %al
	je	.LBB11_15	# cond_true197
.LBB11_7:	# cond_true174
	cmpb	$0, regmng+20
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jne	.LBB11_14	# cond_next192
.LBB11_8:	# cond_true182
	movl	%r14d, regmng+12
	movl	%ebx, regmng+16
	movb	$1, regmng+20
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	incl	%r14d
.LBB11_9:	# cond_true182
	cmpl	4(%rsp), %r14d
	jle	.LBB11_5	# bb112
.LBB11_10:	# bb316
	incl	%ebx
	movl	20(%rsp), %eax
.LBB11_11:	# bb319
	cmpl	%eax, %ebx
	jle	.LBB11_21	# bb319.bb310.preheader_crit_edge
.LBB11_12:	# bb328
	movl	36(%rsp), %eax
	incl	%eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jg	.LBB11_2	# bb
.LBB11_13:	# return
	movl	52(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	48(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB11_14:	# cond_next192
	testb	%al, %al
	jne	.LBB11_18	# cond_next290
.LBB11_15:	# cond_true197
	movq	8(%rsp), %rax
	movl	12(%rax), %r15d
	cmpl	%r15d, 8(%rax)
	jne	.LBB11_17	# cond_next262
.LBB11_16:	# cond_true216
	leal	(%r15,%r15), %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r13
	movq	8(%rsp), %rbp
	movq	(%rbp), %rsi
	movl	$0, cg_caller_call_site_var
	movl	$38, cg_caller_id_var
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r13, %rdi
	call	memcpy
	movq	(%rbp), %rdi
	call	free
	movq	%r13, (%rbp)
	movl	%r12d, 12(%rbp)
.LBB11_17:	# cond_next262
	movq	8(%rsp), %rax
	movslq	8(%rax), %rcx
	movq	(%rax), %rdx
	movl	%r14d, (%rdx,%rcx,8)
	movl	%ebx, 4(%rdx,%rcx,8)
	incl	8(%rax)
.LBB11_18:	# cond_next290
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	movw	%cx, (%rdx,%rax,2)
.LBB11_19:	# cond_next307
	incl	%r14d
.LBB11_20:	# bb310
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$38, cg_caller_id_var
	movl	$38, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jmp	.LBB11_9	# cond_true182
.LBB11_21:	# bb319.bb310.preheader_crit_edge
	movl	%eax, 20(%rsp)
	jmp	.LBB11_4	# bb310.preheader
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
	subq	$72, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 36(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 32(%rsp)
	movl	$8, cg_caller_id_var
	movl	$8, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movb	$0, regmng+20
	movw	$1, %ax
	addw	regmng+8, %ax
	movw	%ax, regmng+8
	cmpw	$65535, %ax
	jne	.LBB12_2	# cond_next
.LBB12_1:	# cond_true
	movq	regmng, %rdi
	movl	regmng+336, %eax
	movl	regmng+332, %ecx
	movl	$0, cg_caller_call_site_var
	movl	$8, cg_caller_id_var
	imull	%ecx, %eax
	movslq	%eax, %rdx
	addq	%rdx, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$1, regmng+8
.LBB12_2:	# cond_next
	movq	16(%rsp), %rax
	movl	$4294967295, (%rax)
	movq	24(%rsp), %rax
	movl	$4294967295, (%rax)
	movl	$4294967295, regmng+12
	movl	$4294967295, regmng+16
	movl	$128, 68(%rsp)
	movl	$0, 64(%rsp)
	movl	$1024, %r15d
	movq	%r15, %rdi
	call	malloc
	movq	%rax, %r12
	movq	%r12, 56(%rsp)
	movl	$128, 52(%rsp)
	movl	$0, 48(%rsp)
	movq	%r15, %rdi
	call	malloc
	movq	%rax, 40(%rsp)
	testl	%r14d, %r14d
	js	.LBB12_12	# cond_next285
.LBB12_3:	# cond_next
	testl	%ebx, %ebx
	js	.LBB12_12	# cond_next285
.LBB12_4:	# cond_true86
	cmpl	%ebx, regmng+316
	jl	.LBB12_12	# cond_next285
.LBB12_5:	# cond_true94
	cmpl	%r14d, regmng+320
	jl	.LBB12_12	# cond_next285
.LBB12_6:	# cond_true102
	movl	regmng+332, %eax
	imull	%r14d, %eax
	addl	%ebx, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	je	.LBB12_12	# cond_next285
.LBB12_7:	# cond_true122
	movq	regmng+40, %rsi
	movzbq	(%rsi,%rax), %rsi
	movb	regmng+48(%rsi), %sil
	testb	%sil, %sil
	je	.LBB12_10	# cond_next241
.LBB12_8:	# cond_true163
	cmpb	$0, regmng+20
	je	.LBB12_37	# cond_true171
.LBB12_9:	# cond_next181
	testb	%sil, %sil
	jne	.LBB12_11	# cond_next265
.LBB12_10:	# cond_next241
	movl	%ebx, (%r12)
	movl	%r14d, 4(%r12)
	movl	$1, 64(%rsp)
.LBB12_11:	# cond_next265
	movw	%cx, (%rdx,%rax,2)
.LBB12_12:	# cond_next285
	movl	%r14d, %r15d
	decl	%r15d
	xorl	%eax, %eax
	testl	%r15d, %r15d
	cmovs	%eax, %r15d
	movl	%ebx, %ecx
	decl	%ecx
	testl	%ecx, %ecx
	cmovs	%eax, %ecx
	movl	%ecx, 12(%rsp)
	incl	%ebx
	movl	regmng+316, %eax
	cmpl	%ebx, %eax
	cmovl	%eax, %ebx
	incl	%r14d
	movl	regmng+320, %eax
	movl	%eax, 8(%rsp)
	cmpl	%r14d, %eax
	jge	.LBB12_21	# bb533
.LBB12_13:	# cond_true325
	cmpl	8(%rsp), %r15d
	jg	.LBB12_22	# bb539
.LBB12_14:	# bb524.preheader
	movl	12(%rsp), %r14d
	jmp	.LBB12_31	# bb524
.LBB12_15:	# bb333
	movl	$42, cg_caller_id_var
	movl	$42, %edx
	movl	%r12d, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%r15d, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	cmpw	%cx, (%rdx,%rax,2)
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	je	.LBB12_30	# cond_next521
.LBB12_16:	# cond_true353
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	movb	regmng+48(%rax), %al
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	testb	%al, %al
	je	.LBB12_26	# cond_true418
.LBB12_17:	# cond_true395
	cmpb	$0, regmng+20
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jne	.LBB12_25	# cond_next413
.LBB12_18:	# cond_true403
	movl	%r14d, regmng+12
	movl	%r15d, regmng+16
	movb	$1, regmng+20
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	incl	%r14d
.LBB12_19:	# cond_true403
	cmpl	%ebx, %r14d
	jle	.LBB12_15	# bb333
.LBB12_20:	# bb530
	incl	%r15d
	movl	8(%rsp), %r14d
.LBB12_21:	# bb533
	cmpl	%r14d, %r15d
	jle	.LBB12_38	# bb533.bb524.preheader_crit_edge
.LBB12_22:	# bb539
	cmpl	$0, 64(%rsp)
.LBB12_23:	# bb539
	je	.LBB12_36	# bb571
.LBB12_24:	# bb539.cond_next563_crit_edge
	movb	$1, %bl
	jmp	.LBB12_35	# cond_next563
.LBB12_25:	# cond_next413
	testb	%al, %al
	jne	.LBB12_29	# cond_next504
.LBB12_26:	# cond_true418
	movl	68(%rsp), %r12d
	cmpl	%r12d, 64(%rsp)
	jne	.LBB12_28	# cond_next480
.LBB12_27:	# cond_true436
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	56(%rsp), %rsi
	movl	$0, cg_caller_call_site_var
	movl	$41, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	56(%rsp), %rdi
	call	free
	movq	%rbp, 56(%rsp)
	movl	%r13d, 68(%rsp)
.LBB12_28:	# cond_next480
	movslq	64(%rsp), %rax
	movq	56(%rsp), %rcx
	movl	%r14d, (%rcx,%rax,8)
	movl	%r15d, 4(%rcx,%rax,8)
	incl	64(%rsp)
.LBB12_29:	# cond_next504
	movl	regmng+332, %r12d
	imull	%r15d, %r12d
	addl	%r14d, %r12d
	movslq	%r12d, %rax
	movw	regmng+8, %cx
	movq	regmng, %rdx
	movw	%cx, (%rdx,%rax,2)
.LBB12_30:	# cond_next521
	incl	%r14d
.LBB12_31:	# bb524
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %r12d
	movl	$41, cg_caller_id_var
	movl	$41, %edx
	movl	%r12d, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jmp	.LBB12_19	# cond_true403
.LBB12_32:	# bb542
	xorb	$1, %bl
	testb	$1, %bl
	jne	.LBB12_39	# cond_false
.LBB12_33:	# cond_true548
	movl	$0, cg_caller_call_site_var
	movl	$40, cg_caller_id_var
	leaq	40(%rsp), %rsi
	leaq	56(%rsp), %rdi
	call	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, 48(%rsp)
	movl	%r15d, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	je	.LBB12_36	# bb571
.LBB12_34:	# cond_true548.cond_next563_crit_edge
	xorb	%bl, %bl
.LBB12_35:	# cond_next563
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r14d
	movl	$40, cg_caller_id_var
	movl	$40, %edx
	movl	%r14d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	cmpb	$0, regmng+20
	movl	%r15d, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	je	.LBB12_32	# bb542
.LBB12_36:	# bb571
	movq	56(%rsp), %rdi
	call	free
	movq	40(%rsp), %rdi
	call	free
	movl	regmng+12, %ecx
	movq	16(%rsp), %rdx
	movl	%ecx, (%rdx)
	movl	regmng+16, %ecx
	movq	24(%rsp), %rdx
	movl	%ecx, (%rdx)
	movzbl	regmng+20, %ecx
	movl	36(%rsp), %edx
	movl	%edx, cg_caller_call_site_var
	movl	32(%rsp), %edx
	movl	%edx, cg_caller_id_var
	movl	%ecx, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB12_37:	# cond_true171
	movl	%ebx, regmng+12
	movl	%r14d, regmng+16
	movb	$1, regmng+20
	jmp	.LBB12_12	# cond_next285
.LBB12_38:	# bb533.bb524.preheader_crit_edge
	movl	%r14d, 8(%rsp)
	jmp	.LBB12_14	# bb524.preheader
.LBB12_39:	# cond_false
	movl	$1, cg_caller_call_site_var
	movl	$40, cg_caller_id_var
	leaq	56(%rsp), %rsi
	leaq	40(%rsp), %rdi
	call	_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, 64(%rsp)
	movl	%r15d, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jmp	.LBB12_23	# bb539
	.size	_ZN9regmngobj13findfreeplaceEiiRiS0_, .-_ZN9regmngobj13findfreeplaceEiiRiS0_


	.align	16
	.type	_ZN9regmngobj6createEv,@function
_ZN9regmngobj6createEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 4(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, (%rsp)
	movl	$9, cg_caller_id_var
	movl	$9, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$16, regmng+404
	movl	$0, regmng+400
	movl	$128, %edi
	call	malloc
	movq	%rax, regmng+344
	movl	$16, regmng+380
	movl	$0, regmng+376
	movl	$64, %ebx
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, regmng+368
	movl	$16, regmng+396
	movl	$0, regmng+392
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, regmng+384
	movl	$16, regmng+364
	movl	$0, regmng+360
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, regmng+352
	xorl	%ebx, %ebx
	movl	%ebx, %r14d
.LBB13_1:	# bb94.i
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$43, cg_caller_id_var
	movl	$43, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	regmng+364, %r13d
	cmpl	%r13d, %r14d
	jne	.LBB13_3	# cond_next.i
.LBB13_2:	# cond_true.i
	leal	(%r13,%r13), %r14d
	# ZERO-EXTEND 
	movl	%r14d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	regmng+352, %rsi
	movl	$0, cg_caller_call_site_var
	movl	$43, cg_caller_id_var
	movslq	%r13d, %rdx
	shlq	$2, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%rbp, regmng+352
	movl	%r14d, regmng+364
.LBB13_3:	# cond_next.i
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%ebx, (%rcx,%rax,4)
	movl	$1, %r14d
	addl	regmng+360, %r14d
	movl	%r14d, regmng+360
	incl	%ebx
	cmpl	%ebx, regmng+404
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jg	.LBB13_1	# bb94.i
.LBB13_4:	# _ZN15largesolidarrayIP6regobjE6createEi.exit
	movq	$0, regmng+32
	movq	$0, regmng+40
	movq	$0, regmng
	movl	$0, regmng+24
	movl	4(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN9regmngobj6createEv, .-_ZN9regmngobj6createEv


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI14_0:					#  float
	.long	1056964608	# float 0.5
	.text
	.align	16
	.type	_ZN9regmngobj20definemiddleregpointEv,@function
_ZN9regmngobj20definemiddleregpointEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 8(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 4(%rsp)
	movl	$10, cg_caller_id_var
	movl	$10, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+400
	jle	.LBB14_3	# bb112
.LBB14_1:	# entry.bb_crit_edge
	xorl	%ebx, %ebx
.LBB14_2:	# bb
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$44, cg_caller_id_var
	movl	$44, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rcx
	movl	$0, 20(%rcx)
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	$0, 24(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB14_2	# bb
.LBB14_3:	# bb112
	cmpl	$0, regmng+320
	js	.LBB14_11	# bb192.preheader
.LBB14_4:	# bb112.bb101.outer_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB14_9	# bb101.outer
.LBB14_5:	# bb53
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$47, cg_caller_id_var
	movl	$47, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r12d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %rax
	testq	%rax, %rax
	je	.LBB14_7	# cond_next
.LBB14_6:	# cond_true
	addl	%r12d, 20(%rax)
	addl	%ebx, 24(%rax)
.LBB14_7:	# cond_next
	incl	%r12d
	cmpl	%r12d, regmng+316
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	jge	.LBB14_5	# bb53
.LBB14_8:	# bb109
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jl	.LBB14_11	# bb192.preheader
.LBB14_9:	# bb101.outer
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$46, cg_caller_id_var
	movl	$46, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB14_8	# bb109
.LBB14_10:	# bb101.outer.bb53_crit_edge
	xorl	%r12d, %r12d
	jmp	.LBB14_5	# bb53
.LBB14_11:	# bb192.preheader
	cmpl	$0, regmng+400
	jle	.LBB14_16	# return
.LBB14_12:	# bb192.preheader.bb121_crit_edge
	xorl	%ebx, %ebx
.LBB14_13:	# bb121
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$45, cg_caller_id_var
	movl	$45, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	16(%rax), %ecx
	testl	%ecx, %ecx
	jle	.LBB14_15	# cond_next189
.LBB14_14:	# cond_true144
	cvtsi2sd	%ecx, %xmm0
	cvtsi2sd	20(%rax), %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	.LCPI14_0(%rip), %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %ecx
	movl	%ecx, 20(%rax)
	cvtsi2sd	24(%rax), %xmm1
	divsd	%xmm0, %xmm1
	cvtsd2ss	%xmm1, %xmm0
	addss	%xmm2, %xmm0
	cvttss2si	%xmm0, %ecx
	movl	%ecx, 24(%rax)
.LBB14_15:	# cond_next189
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB14_13	# bb121
.LBB14_16:	# return
	movl	8(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	4(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.size	_ZN9regmngobj20definemiddleregpointEv, .-_ZN9regmngobj20definemiddleregpointEv


	.align	16
	.type	_ZN9regmngobj7destroyEv,@function
_ZN9regmngobj7destroyEv:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$11, cg_caller_id_var
	movl	$11, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+400
	jle	.LBB15_3	# bb46
.LBB15_1:	# entry.bb_crit_edge
	xorl	%r15d, %r15d
.LBB15_2:	# bb
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$48, cg_caller_id_var
	movl	$48, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movslq	%r15d, %rbp
	movq	regmng+344, %rax
	movq	(%rax,%rbp,8), %rax
	movq	40(%rax), %rdi
	call	free
	movq	regmng+344, %rax
	movq	(%rax,%rbp,8), %rdi
	movl	$0, cg_caller_call_site_var
	movl	$48, cg_caller_id_var
	call	_ZdlPv
	incl	%r15d
	cmpl	%r15d, regmng+400
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jg	.LBB15_2	# bb
.LBB15_3:	# bb46
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
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
	subq	$24, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 20(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 16(%rsp)
	movl	$12, cg_caller_id_var
	movl	$12, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$1792, %edi
	call	malloc
	cmpl	$0, regmng+400
	jle	.LBB16_17	# entry.bb199.preheader_crit_edge
.LBB16_1:	# entry.bb24_crit_edge
	xorl	%ebx, %ebx
	movl	$16, %r14d
	movl	%ebx, 12(%rsp)
	movq	%rax, %r15
.LBB16_2:	# bb24
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 8(%rsp)
	movl	cg_caller_id_var, %r12d
	movl	$49, cg_caller_id_var
	movl	$49, %edx
	movl	%r12d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rbx
	movq	regmng+344, %rax
	movq	(%rax,%rbx,8), %rax
	cmpb	$0, 5(%rax)
	je	.LBB16_6	# bb166
.LBB16_3:	# cond_true
	movl	12(%rsp), %eax
	cmpl	%r14d, %eax
	jne	.LBB16_5	# cond_next90
.LBB16_4:	# cond_true51
	leal	(%r14,%r14), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %eax
	imulq	$112, %rax, %rdi
	call	malloc
	movq	%rax, %rbp
	movl	$1, cg_caller_call_site_var
	movl	$49, cg_caller_id_var
	movslq	%r14d, %rax
	imulq	$112, %rax, %rdx
	movq	%rbp, %rdi
	movq	%r15, %rsi
	call	memcpy
	movq	%r15, %rdi
	call	free
	movl	%r13d, %r14d
	movq	%rbp, %r15
.LBB16_5:	# cond_next90
	movl	12(%rsp), %eax
	incl	%eax
	movl	%eax, 12(%rsp)
	movslq	%eax, %rax
	imulq	$112, %rax, %rax
	movb	$1, -8(%rax,%r15)
	movq	regmng+344, %rcx
	movq	(%rcx,%rbx,8), %rcx
	movl	20(%rcx), %esi
	movl	24(%rcx), %edx
	movl	$0, cg_caller_call_site_var
	movl	$49, cg_caller_id_var
	leaq	-112(%rax,%r15), %rdi
	call	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj
.LBB16_6:	# bb166
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	8(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	jg	.LBB16_2	# bb24
.LBB16_7:	# bb166.bb199.preheader_crit_edge
	movq	%r15, %rax
.LBB16_8:	# bb199.preheader
	movq	%rax, %r15
.LBB16_9:	# bb206.bb199_crit_edge
	movb	$1, %bl
	xorl	%r14d, %r14d
	jmp	.LBB16_11	# bb199
.LBB16_10:	# bb177
	movl	$0, cg_caller_call_site_var
	movl	$50, cg_caller_id_var
	movslq	%r14d, %rax
	imulq	$112, %rax, %rdi
	addq	%r15, %rdi
	call	_ZN11regboundobj4stepEv
	xorw	%cx, %cx
	cmpb	$1, %al
	movb	%bl, %al
	cmove	%cx, %ax
	incl	%r14d
	movb	%al, %bl
.LBB16_11:	# bb199
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$50, cg_caller_id_var
	movl	$50, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	12(%rsp), %eax
	cmpl	%r14d, %eax
	jg	.LBB16_10	# bb177
.LBB16_12:	# bb206
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	testb	%bl, %bl
	je	.LBB16_9	# bb206.bb199_crit_edge
.LBB16_13:	# bb227.loopexit
	cmpl	$0, 12(%rsp)
	jle	.LBB16_16	# bb234
.LBB16_14:	# bb227.loopexit.bb213_crit_edge
	xorl	%ebx, %ebx
.LBB16_15:	# bb213
	movl	$51, cg_caller_id_var
	movl	$51, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	imulq	$112, %rax, %r14
	movq	(%r15,%r14), %rdi
	call	free
	movq	16(%r15,%r14), %rdi
	call	free
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%ebx
	movl	12(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.LBB16_15	# bb213
.LBB16_16:	# bb234
	movq	%r15, %rdi
	call	free
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB16_17:	# entry.bb199.preheader_crit_edge
	movl	$0, 12(%rsp)
	jmp	.LBB16_8	# bb199.preheader
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
	subq	$40, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 36(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 32(%rsp)
	movl	$13, cg_caller_id_var
	movl	$13, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$128, %edi
	call	malloc
	cmpl	$0, regmng+400
	jle	.LBB17_14	# entry.bb318.preheader_crit_edge
.LBB17_1:	# entry.bb23_crit_edge
	xorl	%ebx, %ebx
	movl	$16, %r14d
	movl	%ebx, 28(%rsp)
	movq	%rax, %r15
.LBB17_2:	# bb23
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 24(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 20(%rsp)
	movl	$52, cg_caller_id_var
	movl	$52, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rbx
	movq	regmng+344, %r12
	movq	(%r12,%rbx,8), %rax
	cmpb	$0, 4(%rax)
	jne	.LBB17_6	# bb122
.LBB17_3:	# cond_true
	movl	28(%rsp), %eax
	cmpl	%r14d, %eax
	jne	.LBB17_5	# cond_next106
.LBB17_4:	# cond_true67
	leal	(%r14,%r14), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movl	$0, cg_caller_call_site_var
	movl	$52, cg_caller_id_var
	movslq	%r14d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	movq	%r15, %rsi
	call	memcpy
	movq	%r15, %rdi
	call	free
	movl	%r13d, %r14d
	movq	%rbp, %r15
.LBB17_5:	# cond_next106
	movq	(%r12,%rbx,8), %rax
	movl	28(%rsp), %ecx
	movslq	%ecx, %rdx
	movq	%rax, (%r15,%rdx,8)
	incl	%ecx
	movl	%ecx, 28(%rsp)
.LBB17_6:	# bb122
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	24(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jg	.LBB17_2	# bb23
.LBB17_7:	# bb122.bb318.preheader_crit_edge
	movq	%r15, %rax
	jmp	.LBB17_15	# bb318.preheader
.LBB17_8:	# bb132
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 4(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	$53, cg_caller_id_var
	movl	$53, %edx
	movl	%r14d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rbx
	movq	8(%rsp), %rax
	movq	(%rax,%rbx,8), %rax
	movl	(%rax), %r15d
	movslq	%r15d, %rax
	movq	regmng+368, %rcx
	movl	(%rcx,%rax,4), %eax
	movl	$4294967295, %ecx
	addl	regmng+400, %ecx
	cmpl	%eax, %ecx
	je	.LBB17_10	# cond_next219
.LBB17_9:	# cond_true166
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
.LBB17_10:	# cond_next219
	movl	regmng+364, %r12d
	cmpl	%r12d, regmng+360
	jne	.LBB17_12	# cond_next268
.LBB17_11:	# cond_true233
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	regmng+352, %rsi
	movl	$1, cg_caller_call_site_var
	movl	$53, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$2, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%rbp, regmng+352
	movl	%r13d, regmng+364
.LBB17_12:	# cond_next268
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%r15d, (%rcx,%rax,4)
	incl	regmng+360
	decl	regmng+400
	movq	8(%rsp), %r15
	movq	(%r15,%rbx,8), %rax
	movq	40(%rax), %rdi
	call	free
	movq	(%r15,%rbx,8), %rdi
	movl	$0, cg_caller_call_site_var
	movl	$53, cg_caller_id_var
	call	_ZdlPv
	movl	4(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	incl	%ebx
	movl	28(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.LBB17_8	# bb132
.LBB17_13:	# bb325
	movq	8(%rsp), %rdi
	call	free
	movl	36(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB17_14:	# entry.bb318.preheader_crit_edge
	movl	$0, 28(%rsp)
.LBB17_15:	# bb318.preheader
	movq	%rax, 8(%rsp)
	cmpl	$0, 28(%rsp)
	jle	.LBB17_13	# bb325
.LBB17_16:	# bb318.preheader.bb132_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB17_8	# bb132
	.size	_ZN9regmngobj13deleteregionsEv, .-_ZN9regmngobj13deleteregionsEv


	.align	16
	.type	_ZN9regmngobj18enlargeneighborsesEi,@function
_ZN9regmngobj18enlargeneighborsesEi:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	movl	%edi, 12(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 20(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 16(%rsp)
	movl	$14, cg_caller_id_var
	movl	$14, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	regmng+400, %eax
	testl	%eax, %eax
	jle	.LBB18_3	# bb142
.LBB18_1:	# entry.bb_crit_edge
	xorl	%ebx, %ebx
.LBB18_2:	# bb
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$54, cg_caller_id_var
	movl	$54, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movb	$0, 5(%rax)
	movl	regmng+400, %eax
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jg	.LBB18_2	# bb
.LBB18_3:	# bb142
	testl	%eax, %eax
	jle	.LBB18_10	# bb219
.LBB18_4:	# bb142.bb38_crit_edge
	xorl	%ebx, %ebx
.LBB18_5:	# bb38
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 8(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	$55, cg_caller_id_var
	movl	$55, %edx
	movl	%r14d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rbx
	movq	regmng+344, %rax
	movq	(%rax,%rbx,8), %rax
	movl	12(%rsp), %ecx
	cmpl	%ecx, 16(%rax)
	jge	.LBB18_9	# cond_next
.LBB18_6:	# cond_true
	movb	$0, 4(%rax)
	movq	regmng+344, %r15
	movq	(%r15,%rbx,8), %rax
	cmpl	$0, 48(%rax)
	jle	.LBB18_9	# cond_next
.LBB18_7:	# cond_true.bb79_crit_edge
	xorl	%r12d, %r12d
.LBB18_8:	# bb79
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$56, cg_caller_id_var
	movl	$56, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movq	(%r15,%rbx,8), %r15
	movq	40(%r15), %r15
	movslq	%r12d, %rax
	movq	(%r15,%rax,8), %r15
	movb	$1, 5(%r15)
	movq	regmng+344, %r15
	movq	(%r15,%rbx,8), %rax
	incl	%r12d
	cmpl	%r12d, 48(%rax)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	jg	.LBB18_8	# bb79
.LBB18_9:	# cond_next
	movl	regmng+400, %eax
	movl	8(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jg	.LBB18_5	# bb38
.LBB18_10:	# bb219
	testl	%eax, %eax
	jle	.LBB18_16	# bb310.preheader
.LBB18_11:	# bb219.bb152_crit_edge
	xorl	%ebx, %ebx
.LBB18_12:	# bb152
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$57, cg_caller_id_var
	movl	$57, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	cmpb	$0, 5(%rax)
	je	.LBB18_15	# cond_next216
.LBB18_13:	# cond_true173
	cmpb	$0, 4(%rax)
	jne	.LBB18_15	# cond_next216
.LBB18_14:	# cond_true197
	movb	$0, 5(%rax)
.LBB18_15:	# cond_next216
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB18_12	# bb152
.LBB18_16:	# bb310.preheader
	cmpl	$0, regmng+320
	js	.LBB18_26	# bb318
.LBB18_17:	# bb310.preheader.bb299.preheader_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB18_24	# bb299.preheader
.LBB18_18:	# bb230
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$59, cg_caller_id_var
	movl	$59, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %rdx
	testq	%rdx, %rdx
	je	.LBB18_22	# cond_next296
.LBB18_19:	# cond_true258
	cmpb	$0, 5(%rdx)
	jne	.LBB18_21	# bb272
.LBB18_20:	# cond_next264
	cmpb	$0, 4(%rdx)
	jne	.LBB18_22	# cond_next296
.LBB18_21:	# bb272
	movq	$0, (%rcx,%rax,8)
.LBB18_22:	# cond_next296
	incl	%r14d
	cmpl	%r14d, regmng+316
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	jge	.LBB18_18	# bb230
.LBB18_23:	# bb307
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jl	.LBB18_26	# bb318
.LBB18_24:	# bb299.preheader
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r15d
	movl	$58, cg_caller_id_var
	movl	$58, %edx
	movl	%r15d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB18_23	# bb307
.LBB18_25:	# bb299.preheader.bb230_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB18_18	# bb230
.LBB18_26:	# bb318
	movl	$0, cg_caller_call_site_var
	movl	$14, cg_caller_id_var
	call	_ZN9regmngobj13deleteregionsEv
	movl	$1, cg_caller_call_site_var
	movl	$14, cg_caller_id_var
	call	_ZN9regmngobj15redefineregionsEv
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
	subq	$88, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 84(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 80(%rsp)
	movl	$15, cg_caller_id_var
	movl	$15, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	regmng+400, %eax
	testl	%eax, %eax
	jle	.LBB19_3	# bb56
.LBB19_1:	# entry.bb_crit_edge
	xorl	%ebx, %ebx
.LBB19_2:	# bb
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$60, cg_caller_id_var
	movl	$60, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	%ebx, 28(%rax)
	movl	regmng+400, %eax
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jg	.LBB19_2	# bb
.LBB19_3:	# bb56
	testl	%eax, %eax
	jle	.LBB19_6	# bb370.preheader
.LBB19_4:	# bb56.bb33_crit_edge
	xorl	%ebx, %ebx
.LBB19_5:	# bb33
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$61, cg_caller_id_var
	movl	$61, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	$0, 48(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB19_5	# bb33
.LBB19_6:	# bb370.preheader
	movl	$4294967295, %eax
	addl	regmng+320, %eax
	testl	%eax, %eax
	jle	.LBB19_30	# return
.LBB19_7:	# bb370.preheader.bb358.preheader_crit_edge
	xorl	%eax, %eax
	movl	%eax, 32(%rsp)
	movl	%eax, 76(%rsp)
	jmp	.LBB19_29	# bb358.preheader
.LBB19_8:	# bb.nph
	movl	32(%rsp), %eax
	leal	2(%rax), %eax
	movl	%eax, 48(%rsp)
	xorl	%eax, %eax
	movl	%eax, 44(%rsp)
	movl	%eax, %ebx
.LBB19_9:	# bb67
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 60(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 56(%rsp)
	movl	$63, cg_caller_id_var
	movl	$63, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	32(%rsp), %eax
	incl	%eax
	movl	regmng+332, %ecx
	imull	%eax, %ecx
	movl	44(%rsp), %eax
	leal	1(%rax,%rcx), %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %r14
	movl	%ebx, %eax
	incl	%eax
	movl	%eax, 52(%rsp)
	testq	%r14, %r14
	je	.LBB19_27	# bb355
.LBB19_10:	# bb67
	movl	48(%rsp), %eax
	cmpl	64(%rsp), %eax
	jl	.LBB19_27	# bb355
.LBB19_11:	# bb97.preheader
	movl	44(%rsp), %eax
	leal	2(%rax), %ecx
	movl	%ecx, 28(%rsp)
	addl	$2, %ebx
	cmpl	%eax, %ebx
	jl	.LBB19_27	# bb355
.LBB19_12:	# bb97.preheader.bb97_crit_edge
	movl	$0, 24(%rsp)
.LBB19_13:	# bb97
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 40(%rsp)
	movl	cg_caller_id_var, %eax
	movl	%eax, 36(%rsp)
	movl	$64, cg_caller_id_var
	movl	$64, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	44(%rsp), %ebx
	movl	%ebx, 20(%rsp)
.LBB19_14:	# bb100
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 16(%rsp)
	movl	cg_caller_id_var, %eax
	movl	%eax, 12(%rsp)
	movl	$65, cg_caller_id_var
	movl	$65, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	32(%rsp), %ebx
	movl	24(%rsp), %eax
	leal	(%rax,%rbx), %ebx
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	20(%rsp), %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	movq	(%rcx,%rax,8), %rbx
	testq	%rbx, %rbx
	je	.LBB19_25	# bb337
.LBB19_15:	# bb100
	cmpq	%rbx, %r14
	je	.LBB19_25	# bb337
.LBB19_16:	# bb161.preheader
	movl	48(%r14), %r15d
	xorl	%r12d, %r12d
	jmp	.LBB19_19	# bb161
.LBB19_17:	# bb135
	movq	40(%r14), %rax
	movslq	%r12d, %rcx
	cmpq	%rbx, (%rax,%rcx,8)
	movl	%ebp, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	je	.LBB19_25	# bb337
.LBB19_18:	# cond_next158
	incl	%r12d
.LBB19_19:	# bb161
	movl	cg_caller_call_site_var, %ebp
	movl	cg_caller_id_var, %r13d
	movl	$66, cg_caller_id_var
	movl	$66, %edx
	movl	%r13d, %edi
	movl	%ebp, %esi
	call	CallEdgeProfiler
	movl	%ebp, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	cmpl	%r12d, %r15d
	jg	.LBB19_17	# bb135
.LBB19_20:	# cond_next174.critedge
	movl	52(%r14), %r12d
	cmpl	%r12d, %r15d
	jne	.LBB19_22	# cond_next233
.LBB19_21:	# cond_true187
	addl	%r12d, %r12d
	# ZERO-EXTEND 
	movl	%r12d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movq	40(%r14), %rsi
	movslq	52(%r14), %rdx
	movl	$0, cg_caller_call_site_var
	movl	$65, cg_caller_id_var
	shlq	$3, %rdx
	movq	%r15, %rdi
	call	memcpy
	movq	40(%r14), %rdi
	call	free
	movq	%r15, 40(%r14)
	movl	%r12d, 52(%r14)
.LBB19_22:	# cond_next233
	movslq	48(%r14), %rax
	movq	40(%r14), %rcx
	movq	%rbx, (%rcx,%rax,8)
	incl	48(%r14)
	movl	52(%rbx), %r15d
	cmpl	%r15d, 48(%rbx)
	jne	.LBB19_24	# cond_next315
.LBB19_23:	# cond_true263
	addl	%r15d, %r15d
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r12
	movq	40(%rbx), %rsi
	movslq	52(%rbx), %rdx
	movl	$1, cg_caller_call_site_var
	movl	$65, cg_caller_id_var
	shlq	$3, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	40(%rbx), %rdi
	call	free
	movq	%r12, 40(%rbx)
	movl	%r15d, 52(%rbx)
.LBB19_24:	# cond_next315
	movslq	48(%rbx), %rax
	movq	40(%rbx), %rcx
	movq	%r14, (%rcx,%rax,8)
	incl	48(%rbx)
.LBB19_25:	# bb337
	movl	16(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	12(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	20(%rsp), %ebx
	incl	%ebx
	movl	%ebx, 20(%rsp)
	movl	28(%rsp), %eax
	cmpl	%ebx, %eax
	jge	.LBB19_14	# bb100
.LBB19_26:	# bb347
	movl	40(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	36(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	32(%rsp), %eax
	movl	24(%rsp), %ebx
	leal	1(%rax,%rbx), %eax
	incl	%ebx
	movl	%ebx, 24(%rsp)
	movl	48(%rsp), %ebx
	cmpl	%eax, %ebx
	jge	.LBB19_13	# bb97
.LBB19_27:	# bb355
	movl	$4294967295, %ebx
	addl	regmng+316, %ebx
	movl	60(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	56(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	44(%rsp), %eax
	leal	2(%rax), %ecx
	incl	%eax
	movl	%eax, 44(%rsp)
	cmpl	%ecx, %ebx
	jge	.LBB19_31	# bb355.bb67_crit_edge
.LBB19_28:	# bb367
	movl	$4294967295, %eax
	addl	regmng+320, %eax
	movl	72(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	68(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	movl	32(%rsp), %ecx
	leal	2(%rcx), %edx
	incl	%ecx
	movl	%ecx, 32(%rsp)
	cmpl	%edx, %eax
	jl	.LBB19_30	# return
.LBB19_29:	# bb358.preheader
	movl	76(%rsp), %ebx
	movl	%ebx, 64(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 72(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 68(%rsp)
	movl	$62, cg_caller_id_var
	movl	$62, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	incl	%ebx
	movl	%ebx, 76(%rsp)
	movl	$4294967295, %eax
	addl	regmng+316, %eax
	testl	%eax, %eax
	jg	.LBB19_8	# bb.nph
	jmp	.LBB19_28	# bb367
.LBB19_30:	# return
	movl	84(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	80(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB19_31:	# bb355.bb67_crit_edge
	movl	52(%rsp), %ebx
	jmp	.LBB19_9	# bb67
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
	subq	$24, %rsp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 20(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 16(%rsp)
	movl	$16, cg_caller_id_var
	movl	$16, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	regmng+404, %ebx
	leal	(%rbx,%rbx), %r14d
	movl	%r14d, 12(%rsp)
	# ZERO-EXTEND 
	movl	%r14d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movq	regmng+344, %rsi
	movl	$0, cg_caller_call_site_var
	movl	$16, cg_caller_id_var
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
	movl	$1, cg_caller_call_site_var
	movl	$16, cg_caller_id_var
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
	movl	$2, cg_caller_call_site_var
	movl	$16, cg_caller_id_var
	movslq	%ebx, %rdx
	shlq	$2, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	regmng+384, %rdi
	call	free
	movq	%r12, regmng+384
	movl	%r15d, regmng+396
	movl	regmng+404, %eax
	movl	%eax, 8(%rsp)
	cmpl	%r14d, %eax
	jge	.LBB20_5	# bb200
.LBB20_1:	# bb127.preheader
	movl	12(%rsp), %eax
	subl	8(%rsp), %eax
	movl	%eax, %ecx
	decl	%ecx
	testl	%ecx, %ecx
	movl	$1, %ecx
	cmovs	%ecx, %eax
	movl	%eax, 4(%rsp)
	movl	$0, (%rsp)
.LBB20_2:	# bb127
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$67, cg_caller_id_var
	movl	$67, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	8(%rsp), %ecx
	movl	(%rsp), %eax
	leal	(%rcx,%rax), %r15d
	movl	regmng+364, %r12d
	cmpl	%r12d, regmng+360
	jne	.LBB20_4	# cond_next176
.LBB20_3:	# cond_true141
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	regmng+352, %rsi
	movl	$0, cg_caller_call_site_var
	movl	$67, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$2, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	regmng+352, %rdi
	call	free
	movq	%rbp, regmng+352
	movl	%r13d, regmng+364
.LBB20_4:	# cond_next176
	movslq	regmng+360, %rax
	movq	regmng+352, %rcx
	movl	%r15d, (%rcx,%rax,4)
	incl	regmng+360
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	movl	(%rsp), %eax
	incl	%eax
	movl	%eax, (%rsp)
	cmpl	4(%rsp), %eax
	jne	.LBB20_2	# bb127
.LBB20_5:	# bb200
	movl	12(%rsp), %eax
	movl	%eax, regmng+404
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$24, %rsp
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
.LCPI21_0:					#  float
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
	subq	$40, %rsp
	movq	%rdi, %rbx
	movq	%rbx, 8(%rsp)
	movl	%esi, %r14d
	movl	%edx, %r15d
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 28(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 32(%rsp)
	movl	$17, cg_caller_id_var
	movl	$17, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
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
	movl	%r14d, %eax
	decl	%eax
	xorl	%ecx, %ecx
	testl	%eax, %eax
	cmovs	%ecx, %eax
	movl	%eax, 24(%rsp)
	movl	%r15d, %eax
	decl	%eax
	testl	%eax, %eax
	cmovs	%ecx, %eax
	movl	%eax, 4(%rsp)
	movq	8(%rbx), %rax
	movl	316(%rax), %ecx
	incl	%r14d
	cmpl	%r14d, %ecx
	cmovl	%ecx, %r14d
	movl	%r14d, 16(%rsp)
	movl	320(%rax), %eax
	movl	%eax, 20(%rsp)
	incl	%r15d
	cmpl	%r15d, %eax
	jge	.LBB21_13	# bb175
.LBB21_1:	# cond_true119
	movl	4(%rsp), %r15d
	cmpl	20(%rsp), %r15d
	jg	.LBB21_14	# bb181
.LBB21_2:	# bb166.preheader
	movl	24(%rsp), %r15d
	jmp	.LBB21_10	# bb166
.LBB21_3:	# bb129
	movl	$70, cg_caller_id_var
	movl	$70, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movl	332(%rax), %ecx
	imull	4(%rsp), %ecx
	addl	%r15d, %ecx
	movslq	%ecx, %rcx
	movq	32(%rax), %rdx
	cmpq	$0, (%rdx,%rcx,8)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jne	.LBB21_9	# cond_next163
.LBB21_4:	# cond_true159
	movq	40(%rax), %rdx
	movzbq	(%rdx,%rcx), %rcx
	cmpb	$0, 48(%rax,%rcx)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	je	.LBB21_9	# cond_next163
.LBB21_5:	# cond_true.i
	movl	%r15d, %ecx
	movq	8(%rsp), %rdx
	subl	20(%rdx), %ecx
	imull	%ecx, %ecx
	movl	4(%rsp), %esi
	subl	24(%rdx), %esi
	imull	%esi, %esi
	addl	%ecx, %esi
	cvtsi2ss	%esi, %xmm0
	addss	.LCPI21_0(%rip), %xmm0
	cvttss2si	%xmm0, %ecx
	cmpl	308(%rax), %ecx
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jg	.LBB21_9	# cond_next163
.LBB21_6:	# cond_true88.i
	movl	_ZN6regobj9bound1arpE+12, %r12d
	cmpl	%r12d, _ZN6regobj9bound1arpE+8
	jne	.LBB21_8	# cond_next152.i
.LBB21_7:	# cond_true107.i
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	_ZN6regobj9bound1arpE, %rsi
	movl	$0, cg_caller_call_site_var
	movl	$70, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	_ZN6regobj9bound1arpE, %rdi
	call	free
	movq	%rbp, _ZN6regobj9bound1arpE
	movl	%r13d, _ZN6regobj9bound1arpE+12
.LBB21_8:	# cond_next152.i
	movslq	_ZN6regobj9bound1arpE+8, %rax
	movq	_ZN6regobj9bound1arpE, %rcx
	movl	%r15d, (%rcx,%rax,8)
	movl	4(%rsp), %edx
	movl	%edx, 4(%rcx,%rax,8)
	incl	_ZN6regobj9bound1arpE+8
	movq	8(%rsp), %rax
	movq	8(%rax), %rcx
	movl	332(%rcx), %esi
	imull	%edx, %esi
	addl	%r15d, %esi
	movslq	%esi, %rdx
	movq	32(%rcx), %rcx
	movq	%rax, (%rcx,%rdx,8)
	incl	16(%rax)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	incl	%r15d
	jmp	.LBB21_11	# bb166
.LBB21_9:	# cond_next163
	incl	%r15d
.LBB21_10:	# bb166
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$69, cg_caller_id_var
	movl	$69, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
.LBB21_11:	# bb166
	cmpl	16(%rsp), %r15d
	jle	.LBB21_3	# bb129
.LBB21_12:	# bb172
	incl	4(%rsp)
	movl	20(%rsp), %r15d
.LBB21_13:	# bb175
	movl	4(%rsp), %eax
	cmpl	%r15d, %eax
	jle	.LBB21_19	# bb175.bb166.preheader_crit_edge
.LBB21_14:	# bb181
	cmpl	$0, _ZN6regobj9bound1arpE+8
	je	.LBB21_20	# cond_false
.LBB21_15:	# cond_true188
	movq	8(%rsp), %rax
	movb	$1, 4(%rax)
.LBB21_16:	# cond_true209
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$68, cg_caller_id_var
	movl	$68, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	$0, cg_caller_call_site_var
	movl	$68, cg_caller_id_var
	leaq	_ZN6regobj9bound2arpE, %rdx
	leaq	_ZN6regobj9bound1arpE, %rsi
	movq	8(%rsp), %rdi
	call	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, _ZN6regobj9bound2arpE+8
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	je	.LBB21_18	# bb224
.LBB21_17:	# cond_false213.critedge
	movl	$1, cg_caller_call_site_var
	movl	$68, cg_caller_id_var
	leaq	_ZN6regobj9bound1arpE, %rdx
	leaq	_ZN6regobj9bound2arpE, %rsi
	movq	8(%rsp), %rdi
	call	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_
	cmpl	$0, _ZN6regobj9bound1arpE+8
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jne	.LBB21_16	# cond_true209
.LBB21_18:	# bb224
	movq	_ZN6regobj9bound1arpE, %rdi
	call	free
	movq	_ZN6regobj9bound2arpE, %rdi
	call	free
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB21_19:	# bb175.bb166.preheader_crit_edge
	movl	%r15d, 20(%rsp)
	jmp	.LBB21_2	# bb166.preheader
.LBB21_20:	# cond_false
	movq	8(%rsp), %rax
	movb	$0, 4(%rax)
	jmp	.LBB21_18	# bb224
	.size	_ZN6regobj6createEii, .-_ZN6regobj6createEii


	.section	.rodata.cst4,"aM",@progbits,4
	.align	8
.LCPI22_0:					#  float
	.long	1101004800	# float 20
.LCPI22_1:					#  float
	.long	1092616192	# float 10
.LCPI22_2:					#  float
	.long	1134198784	# float 309
.LCPI22_3:					#  float
	.long	1056964608	# float 0.5
	.zero	8
.LCPI22_5:					#  float
	.long	1142620160	# float 620
.LCPI22_6:					#  float
	.long	1107820544	# float 34
.LCPI22_7:					#  float
	.long	1121320960	# float 107
.LCPI22_8:					#  float
	.long	1100480512	# float 19
.LCPI22_9:					#  float
	.long	940216657	# float 3.30371e-05
.LCPI22_10:					#  float
	.long	940205271	# float 3.29957e-05
.LCPI22_11:					#  float
	.long	940200485	# float 3.29783e-05
.LCPI22_12:					#  float
	.long	1107296256	# float 32
.LCPI22_13:					#  float
	.long	1117126656	# float 75
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI22_4:					#  double
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
	subq	$152, %rsp
	movl	%edi, %ebx
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 76(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 72(%rsp)
	movl	$18, cg_caller_id_var
	movl	$18, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %ecx
	movl	regmng+336, %esi
	movq	regmng+32, %rdi
	movl	$0, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	imull	%ecx, %esi
	movslq	%esi, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%esi, %esi
	xorl	%r14d, %r14d
	movl	%r14d, %eax
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
	divss	.LCPI22_0(%rip), %xmm0
	movss	%xmm0, 80(%rsp)
	movss	%xmm0, regmng+312
	mulss	.LCPI22_1(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, regmng+304
	imull	%eax, %eax
	movl	%eax, regmng+308
	movl	$1792, %edi
	call	malloc
	movq	%rax, %rbx
	movl	regmng+320, %eax
	cvtsi2ss	%eax, %xmm0
	divss	.LCPI22_2(%rip), %xmm0
	mulss	.LCPI22_0(%rip), %xmm0
	divss	80(%rsp), %xmm0
	movss	.LCPI22_3(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %ecx
	cvtsi2ss	%ecx, %xmm0
	incl	%eax
	cvtsi2ss	%eax, %xmm2
	divss	%xmm0, %xmm2
	cvtss2sd	%xmm2, %xmm2
	movsd	.LCPI22_4(%rip), %xmm3
	mulsd	%xmm3, %xmm2
	cvtss2sd	.LCPI22_3(%rip), %xmm4
	mulsd	%xmm4, %xmm2
	cvtsd2ss	%xmm2, %xmm2
	addss	%xmm1, %xmm2
	cvttss2si	%xmm2, %eax
	movl	%eax, 64(%rsp)
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	sarl	%ecx
	movl	%ecx, 52(%rsp)
	movl	regmng+316, %eax
	cvtsi2ss	%eax, %xmm2
	divss	.LCPI22_5(%rip), %xmm2
	mulss	.LCPI22_6(%rip), %xmm2
	divss	80(%rsp), %xmm2
	addss	%xmm1, %xmm2
	cvttss2si	%xmm2, %ecx
	movl	%ecx, 60(%rsp)
	cvtsi2ss	%ecx, %xmm2
	decl	%ecx
	movl	%ecx, 68(%rsp)
	incl	%eax
	cvtsi2ss	%eax, %xmm4
	divss	%xmm2, %xmm4
	addss	%xmm1, %xmm4
	cvttss2si	%xmm4, %eax
	movl	%eax, 32(%rsp)
	addss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	divsd	%xmm3, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	addl	$3, %eax
	movl	%eax, 56(%rsp)
	movl	$16, 36(%rsp)
	movl	%r14d, 24(%rsp)
	movl	%r14d, 28(%rsp)
.LBB22_1:	# bb100.i
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 48(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 44(%rsp)
	movl	$71, cg_caller_id_var
	movl	$71, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	28(%rsp), %eax
	movl	%eax, %ecx
	andl	$1, %ecx
	movl	%ecx, 40(%rsp)
	testl	$1, %eax
	jne	.LBB22_104	# cond_true.i
.LBB22_2:	# cond_false.i
	movl	24(%rsp), %edi
	movl	32(%rsp), %ecx
	imull	%ecx, %edi
	movl	%ecx, %eax
	shrl	$31, %eax
	addl	%ecx, %eax
	sarl	%eax
.LBB22_3:	# cond_next.i
	movl	$0, cg_caller_call_site_var
	movl	$71, cg_caller_id_var
	movl	28(%rsp), %esi
	imull	64(%rsp), %esi
	addl	52(%rsp), %esi
	addl	%eax, %edi
	leaq	144(%rsp), %rcx
	leaq	148(%rsp), %rdx
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB22_10	# next.i
.LBB22_4:	# cond_false131.i
	movl	144(%rsp), %eax
	movl	regmng+332, %ecx
	imull	%eax, %ecx
	addl	148(%rsp), %ecx
	movslq	%ecx, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_10	# next.i
.LBB22_5:	# cond_next161.i
	movl	$2, cg_caller_call_site_var
	movl	$71, cg_caller_id_var
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %r15
	jne	.LBB22_7	# cond_next191.i
.LBB22_6:	# cond_true189.i
	movl	$3, cg_caller_call_site_var
	movl	$71, cg_caller_id_var
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB22_7:	# cond_next191.i
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
	movl	148(%rsp), %eax
	movl	%eax, 20(%r15)
	movl	144(%rsp), %eax
	movl	%eax, 24(%r15)
	cmpl	36(%rsp), %r14d
	jne	.LBB22_9	# cond_next314.i
.LBB22_8:	# cond_true274.i
	movl	36(%rsp), %r12d
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %eax
	imulq	$112, %rax, %rdi
	call	malloc
	movq	%rax, %rbp
	movl	$4, cg_caller_call_site_var
	movl	$71, cg_caller_id_var
	movslq	%r12d, %rax
	imulq	$112, %rax, %rdx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	memcpy
	movq	%rbx, %rdi
	call	free
	movl	%r13d, 36(%rsp)
	movq	%rbp, %rbx
.LBB22_9:	# cond_next314.i
	incl	%r14d
	movslq	%r14d, %rax
	imulq	$112, %rax, %rax
	movb	$1, -8(%rax,%rbx)
	movl	148(%rsp), %esi
	movl	144(%rsp), %edx
	movl	$1, cg_caller_call_site_var
	movl	$71, cg_caller_id_var
	leaq	-112(%rax,%rbx), %rdi
	movq	%r15, %rcx
	call	_ZN11regboundobj9firststepEiiP6regobjP9regmngobj
.LBB22_10:	# next.i
	incl	24(%rsp)
	cmpl	$0, 40(%rsp)
	je	.LBB22_107	# cond_false353.i
.LBB22_11:	# cond_true342.i
	movl	68(%rsp), %eax
	cmpl	24(%rsp), %eax
.LBB22_12:	# cond_true342.i
	jne	.LBB22_14	# cond_next363.i
.LBB22_13:	# cond_true349.i
	incl	28(%rsp)
	movl	$0, 24(%rsp)
.LBB22_14:	# cond_next363.i
	movl	48(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	44(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	56(%rsp), %eax
	cmpl	28(%rsp), %eax
	jg	.LBB22_1	# bb100.i
.LBB22_15:	# cond_next363.i.bb407.i_crit_edge
	movb	$1, %r15b
	xorl	%r12d, %r12d
	jmp	.LBB22_17	# bb407.i
.LBB22_16:	# bb386.i
	movl	$0, cg_caller_call_site_var
	movl	$72, cg_caller_id_var
	movslq	%r12d, %rax
	imulq	$112, %rax, %rdi
	addq	%rbx, %rdi
	call	_ZN11regboundobj4stepEv
	xorw	%cx, %cx
	cmpb	$1, %al
	movb	%r15b, %al
	cmove	%cx, %ax
	incl	%r12d
	movb	%al, %r15b
.LBB22_17:	# bb407.i
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$72, cg_caller_id_var
	movl	$72, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	cmpl	%r12d, %r14d
	jg	.LBB22_16	# bb386.i
.LBB22_18:	# bb414.i
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testb	%r15b, %r15b
	je	.LBB22_15	# cond_next363.i.bb407.i_crit_edge
.LBB22_19:	# bb435.loopexit.i
	testl	%r14d, %r14d
	jle	.LBB22_22	# _ZN9regmngobj13defineregionsEv.exit
.LBB22_20:	# bb435.loopexit.i.bb421.i_crit_edge
	xorl	%r15d, %r15d
.LBB22_21:	# bb421.i
	movl	$73, cg_caller_id_var
	movl	$73, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r15d, %rax
	imulq	$112, %rax, %r12
	movq	(%rbx,%r12), %rdi
	call	free
	movq	16(%rbx,%r12), %rdi
	call	free
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r15d
	cmpl	%r15d, %r14d
	jg	.LBB22_21	# bb421.i
.LBB22_22:	# _ZN9regmngobj13defineregionsEv.exit
	movq	%rbx, %rdi
	call	free
	cvtss2sd	regmng+312, %xmm0
	cvtss2sd	.LCPI22_7(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %ebx
	movl	regmng+400, %eax
	testl	%eax, %eax
	jle	.LBB22_25	# bb103.preheader.i
.LBB22_23:	# _ZN9regmngobj13defineregionsEv.exit.bb.i_crit_edge
	xorl	%r14d, %r14d
.LBB22_24:	# bb.i
	movl	$74, cg_caller_id_var
	movl	$74, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r14d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movb	$1, 5(%rax)
	movl	regmng+400, %eax
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	cmpl	%r14d, %eax
	jg	.LBB22_24	# bb.i
.LBB22_25:	# bb103.preheader.i
	testl	%eax, %eax
	jle	.LBB22_30	# _ZN9regmngobj14enlargeregionsEv.exit
.LBB22_26:	# bb103.preheader.i.bb42.i_crit_edge
	xorl	%r14d, %r14d
.LBB22_27:	# bb42.i
	movl	$75, cg_caller_id_var
	movl	$75, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r14d, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rcx
	cmpl	%ebx, 16(%rcx)
	jge	.LBB22_29	# cond_next.i10
.LBB22_28:	# cond_true.i9
	movb	$0, 5(%rcx)
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rcx
	movb	$0, 4(%rcx)
.LBB22_29:	# cond_next.i10
	movl	%eax, %r14d
	incl	%r14d
	cmpl	%r14d, regmng+400
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	jg	.LBB22_27	# bb42.i
.LBB22_30:	# _ZN9regmngobj14enlargeregionsEv.exit
	movl	$7, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj13deleteregionsEv
	movl	regmng+332, %ecx
	movl	regmng+336, %edx
	movq	regmng+32, %rdi
	movl	$8, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	imull	%ecx, %edx
	movslq	%edx, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%esi, %esi
	movl	%esi, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movl	$9, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj15redefineregionsEv
	movss	regmng+312, %xmm0
	mulss	.LCPI22_8(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	movl	%eax, regmng+304
	imull	%eax, %eax
	movl	%eax, regmng+308
	movl	regmng+320, %eax
	testl	%eax, %eax
	js	.LBB22_105	# bb202.i
.LBB22_31:	# _ZN9regmngobj14enlargeregionsEv.exit.bb183.preheader.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB22_40	# bb183.preheader.i
.LBB22_32:	# bb6.i
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$90, cg_caller_id_var
	movl	$90, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_38	# cond_next180.i
.LBB22_33:	# cond_true.i20
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB22_38	# cond_next180.i
.LBB22_34:	# cond_true66.i
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
	mulss	.LCPI22_9(%rip), %xmm0
	cvtsi2ss	%esi, %xmm1
	mulss	.LCPI22_10(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm1
	mulss	.LCPI22_11(%rip), %xmm1
	addss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm0
	mulss	.LCPI22_12(%rip), %xmm0
	cvttss2si	%xmm0, %eax
	cmpl	$1, %eax
	jne	.LBB22_38	# cond_next180.i
.LBB22_35:	# cond_true72.i
	movl	$1, cg_caller_call_site_var
	movl	$90, cg_caller_id_var
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %rbp
	jne	.LBB22_37	# cond_next.i32
.LBB22_36:	# cond_true107.i
	movl	$2, cg_caller_call_site_var
	movl	$90, cg_caller_id_var
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB22_37:	# cond_next.i32
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%rbp, (%rcx,%rax,8)
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
	movl	%eax, (%rbp)
	movl	$0, cg_caller_call_site_var
	movl	$90, cg_caller_id_var
	movq	%rbp, %rdi
	movl	%r14d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB22_38:	# cond_next180.i
	incl	%r14d
	cmpl	%r14d, regmng+316
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jge	.LBB22_32	# bb6.i
.LBB22_39:	# bb191.i
	movl	regmng+320, %eax
	movl	20(%rsp), %r14d
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jl	.LBB22_105	# bb202.i
.LBB22_40:	# bb183.preheader.i
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 20(%rsp)
	movl	cg_caller_id_var, %r15d
	movl	$89, cg_caller_id_var
	movl	$89, %edx
	movl	%r15d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB22_39	# bb191.i
.LBB22_41:	# bb183.preheader.i.bb6.i_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB22_32	# bb6.i
.LBB22_42:	# bb217.i
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$88, cg_caller_id_var
	movl	$88, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_47	# cond_next394.i
.LBB22_43:	# cond_true245.i
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB22_47	# cond_next394.i
.LBB22_44:	# cond_true279.i
	movl	$1, cg_caller_call_site_var
	movl	$88, cg_caller_id_var
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %rbp
	jne	.LBB22_46	# cond_next323.i
.LBB22_45:	# cond_true321.i
	movl	$2, cg_caller_call_site_var
	movl	$88, cg_caller_id_var
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB22_46:	# cond_next323.i
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%rbp, (%rcx,%rax,8)
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
	movl	%eax, (%rbp)
	movl	$0, cg_caller_call_site_var
	movl	$88, cg_caller_id_var
	movq	%rbp, %rdi
	movl	%r15d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB22_47:	# cond_next394.i
	incl	%r15d
	cmpl	%r15d, regmng+316
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jge	.LBB22_42	# bb217.i
.LBB22_48:	# bb405.i
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	16(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jl	.LBB22_51	# _ZN9regmngobj10addregionsEv.exit
.LBB22_49:	# bb397.preheader.i
	movl	cg_caller_call_site_var, %r15d
	movl	%r15d, 16(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	$87, cg_caller_id_var
	movl	$87, %edx
	movl	%r14d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB22_48	# bb405.i
.LBB22_50:	# bb397.preheader.i.bb217.i_crit_edge
	xorl	%r15d, %r15d
	jmp	.LBB22_42	# bb217.i
.LBB22_51:	# _ZN9regmngobj10addregionsEv.exit
	movl	regmng+316, %eax
	leal	(%rax,%rax,4), %eax
	movl	%eax, regmng+304
	imull	%eax, %eax
	movl	%eax, regmng+308
	movl	$16, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj19defineneighborhood1Ev
	movss	regmng+312, %xmm0
	movl	$17, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	movaps	%xmm0, %xmm1
	mulss	.LCPI22_13(%rip), %xmm1
	mulss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	movl	%eax, %edi
	call	_ZN9regmngobj18enlargeneighborsesEi
	movl	$18, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj19defineneighborhood1Ev
	cvtss2sd	regmng+312, %xmm0
	movl	$19, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	cvtss2sd	.LCPI22_13(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	cvttsd2si	%xmm1, %eax
	movl	%eax, %edi
	call	_ZN9regmngobj18enlargeneighborsesEi
	cmpl	$0, regmng+320
	js	.LBB22_62	# bb314
.LBB22_52:	# _ZN9regmngobj10addregionsEv.exit.bb295.outer_crit_edge
	xorl	%ebx, %ebx
.LBB22_53:	# bb295.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 12(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	$85, cg_caller_id_var
	movl	$85, %edx
	movl	%r14d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB22_61	# bb306
.LBB22_54:	# bb295.outer.bb122_crit_edge
	xorl	%r15d, %r15d
.LBB22_55:	# bb122
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$86, cg_caller_id_var
	movl	$86, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_60	# cond_next292
.LBB22_56:	# cond_true150
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB22_60	# cond_next292
.LBB22_57:	# cond_true184
	movl	$1, cg_caller_call_site_var
	movl	$86, cg_caller_id_var
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %rbp
	jne	.LBB22_59	# cond_next221
.LBB22_58:	# cond_true219
	movl	$2, cg_caller_call_site_var
	movl	$86, cg_caller_id_var
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB22_59:	# cond_next221
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%rbp, (%rcx,%rax,8)
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
	movl	%eax, (%rbp)
	movl	$0, cg_caller_call_site_var
	movl	$86, cg_caller_id_var
	movq	%rbp, %rdi
	movl	%r15d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB22_60:	# cond_next292
	incl	%r15d
	cmpl	%r15d, regmng+316
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jge	.LBB22_55	# bb122
.LBB22_61:	# bb306
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	12(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jge	.LBB22_53	# bb295.outer
.LBB22_62:	# bb314
	movl	$23, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj13deleteregionsEv
	cmpl	$0, regmng+320
	jle	.LBB22_71	# bb405
.LBB22_63:	# bb314.bb386.outer_crit_edge
	xorl	%ebx, %ebx
.LBB22_64:	# bb386.outer
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$76, cg_caller_id_var
	movl	$76, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	jle	.LBB22_70	# bb397
.LBB22_65:	# bb386.outer.bb317_crit_edge
	xorl	%r12d, %r12d
.LBB22_66:	# bb317
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$77, cg_caller_id_var
	movl	$77, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r12d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_69	# cond_next383
.LBB22_67:	# cond_true345
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB22_69	# cond_next383
.LBB22_68:	# cond_true379
	movl	$0, cg_caller_call_site_var
	movl	$77, cg_caller_id_var
	xorb	%al, %al
	leaq	.str6, %rdi
	call	printf
.LBB22_69:	# cond_next383
	incl	%r12d
	cmpl	%r12d, regmng+316
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	jg	.LBB22_66	# bb317
.LBB22_70:	# bb397
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB22_64	# bb386.outer
.LBB22_71:	# bb405
	movl	$25, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj19defineneighborhood1Ev
	movl	$26, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj20definemiddleregpointEv
	movl	regmng+400, %eax
	testl	%eax, %eax
	jle	.LBB22_76	# bb485.preheader
.LBB22_72:	# bb405.bb415_crit_edge
	xorl	%ebx, %ebx
.LBB22_73:	# bb415
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$78, cg_caller_id_var
	movl	$78, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %r12
	movl	20(%r12), %eax
	movl	24(%r12), %r8d
	movl	$0, cg_caller_call_site_var
	movl	$78, cg_caller_id_var
	leaq	136(%rsp), %rcx
	leaq	140(%rsp), %rdx
	movl	%eax, %edi
	movl	%r8d, %esi
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB22_75	# bb455
.LBB22_74:	# cond_true443
	movl	140(%rsp), %eax
	movl	%eax, 20(%r12)
	movl	136(%rsp), %eax
	movl	%eax, 24(%r12)
.LBB22_75:	# bb455
	movl	regmng+400, %eax
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jg	.LBB22_73	# bb415
.LBB22_76:	# bb485.preheader
	testl	%eax, %eax
	jle	.LBB22_79	# bb494
.LBB22_77:	# bb485.preheader.bb465_crit_edge
	xorl	%ebx, %ebx
.LBB22_78:	# bb465
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$79, cg_caller_id_var
	movl	$79, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movb	$1, 5(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB22_78	# bb465
.LBB22_79:	# bb494
	movl	regmng+332, %eax
	movl	regmng+336, %ecx
	movq	regmng+32, %rdi
	movl	$28, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	imull	%eax, %ecx
	movslq	%ecx, %rcx
	shlq	$3, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movl	$29, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj15redefineregionsEv
	cmpl	$0, regmng+400
	jle	.LBB22_84	# bb567
.LBB22_80:	# bb494.bb514_crit_edge
	xorl	%ebx, %ebx
.LBB22_81:	# bb514
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$80, cg_caller_id_var
	movl	$80, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	cmpl	$0, 16(%rax)
	jne	.LBB22_83	# bb558
.LBB22_82:	# cond_true537
	movb	$0, 4(%rax)
.LBB22_83:	# bb558
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB22_81	# bb514
.LBB22_84:	# bb567
	movl	$30, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj13deleteregionsEv
	cmpl	$0, regmng+320
	js	.LBB22_95	# bb776
.LBB22_85:	# bb567.bb757.outer_crit_edge
	xorl	%ebx, %ebx
.LBB22_86:	# bb757.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 8(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	$83, cg_caller_id_var
	movl	$83, %edx
	movl	%r14d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpl	$0, regmng+316
	js	.LBB22_94	# bb768
.LBB22_87:	# bb757.outer.bb577_crit_edge
	xorl	%r15d, %r15d
.LBB22_88:	# bb577
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$84, cg_caller_id_var
	movl	$84, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	regmng+332, %eax
	imull	%ebx, %eax
	addl	%r15d, %eax
	movslq	%eax, %rax
	movq	regmng+32, %rcx
	cmpq	$0, (%rcx,%rax,8)
	jne	.LBB22_93	# cond_next754
.LBB22_89:	# cond_true605
	movq	regmng+40, %rcx
	movzbq	(%rcx,%rax), %rax
	cmpb	$0, regmng+48(%rax)
	je	.LBB22_93	# cond_next754
.LBB22_90:	# cond_true639
	movl	$1, cg_caller_call_site_var
	movl	$84, cg_caller_id_var
	movl	$56, %edi
	call	_Znwm
	movq	$regmng, 8(%rax)
	movl	regmng+404, %ecx
	cmpl	%ecx, regmng+400
	movq	%rax, %rbp
	jne	.LBB22_92	# cond_next683
.LBB22_91:	# cond_true681
	movl	$2, cg_caller_call_site_var
	movl	$84, cg_caller_id_var
	call	_ZN15largesolidarrayIP6regobjE8doublingEv
.LBB22_92:	# cond_next683
	movslq	regmng+400, %rax
	movq	regmng+344, %rcx
	movq	%rbp, (%rcx,%rax,8)
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
	movl	%eax, (%rbp)
	movl	$0, cg_caller_call_site_var
	movl	$84, cg_caller_id_var
	movq	%rbp, %rdi
	movl	%r15d, %esi
	movl	%ebx, %edx
	call	_ZN6regobj6createEii
.LBB22_93:	# cond_next754
	incl	%r15d
	cmpl	%r15d, regmng+316
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jge	.LBB22_88	# bb577
.LBB22_94:	# bb768
	incl	%ebx
	cmpl	%ebx, regmng+320
	movl	8(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jge	.LBB22_86	# bb757.outer
.LBB22_95:	# bb776
	movl	$34, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj19defineneighborhood1Ev
	movl	$35, cg_caller_call_site_var
	movl	$18, cg_caller_id_var
	call	_ZN9regmngobj20definemiddleregpointEv
	movl	regmng+400, %eax
	testl	%eax, %eax
	jle	.LBB22_100	# bb861.preheader
.LBB22_96:	# bb776.bb787_crit_edge
	xorl	%ebx, %ebx
.LBB22_97:	# bb787
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$81, cg_caller_id_var
	movl	$81, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %r12
	movl	20(%r12), %eax
	movl	24(%r12), %r8d
	movl	$0, cg_caller_call_site_var
	movl	$81, cg_caller_id_var
	leaq	128(%rsp), %rcx
	leaq	132(%rsp), %rdx
	movl	%eax, %edi
	movl	%r8d, %esi
	call	_ZN9regmngobj13findfreeplaceEiiRiS0_
	testb	%al, %al
	je	.LBB22_99	# bb828
.LBB22_98:	# cond_true816
	movl	132(%rsp), %eax
	movl	%eax, 20(%r12)
	movl	128(%rsp), %eax
	movl	%eax, 24(%r12)
.LBB22_99:	# bb828
	movl	regmng+400, %eax
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %eax
	jg	.LBB22_97	# bb787
.LBB22_100:	# bb861.preheader
	testl	%eax, %eax
	jle	.LBB22_103	# return
.LBB22_101:	# bb861.preheader.bb838_crit_edge
	xorl	%ebx, %ebx
.LBB22_102:	# bb838
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$82, cg_caller_id_var
	movl	$82, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movq	regmng+344, %rcx
	movq	(%rcx,%rax,8), %rax
	movl	regmng+24, %ecx
	movl	%ecx, 32(%rax)
	incl	%ebx
	cmpl	%ebx, regmng+400
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB22_102	# bb838
.LBB22_103:	# return
	movl	76(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	72(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB22_104:	# cond_true.i
	movl	24(%rsp), %eax
	movl	32(%rsp), %ecx
	imull	%ecx, %eax
	movl	%ecx, %edi
	jmp	.LBB22_3	# cond_next.i
.LBB22_105:	# bb202.i
	testl	%eax, %eax
	js	.LBB22_51	# _ZN9regmngobj10addregionsEv.exit
.LBB22_106:	# bb202.i.bb397.preheader.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB22_49	# bb397.preheader.i
.LBB22_107:	# cond_false353.i
	movl	24(%rsp), %eax
	cmpl	60(%rsp), %eax
	jmp	.LBB22_12	# cond_true342.i
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
	subq	$216, %rsp
	movl	%edi, %ebx
	movl	%ebx, 196(%rsp)
	movl	%esi, %r14d
	movl	%r14d, 192(%rsp)
	movl	%edx, %r15d
	movl	%ecx, %r12d
	movq	%r8, %r13
	movq	%r9, 200(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 212(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 208(%rsp)
	movl	$19, cg_caller_id_var
	movl	$19, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	%ebx, way2+4396
	movl	%r14d, way2+4400
	movl	%r15d, way2+4388
	movl	%r12d, way2+4392
	xorl	%ebx, %ebx
.LBB23_1:	# bb
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %ebp
	movl	$91, cg_caller_id_var
	movl	$91, %edx
	movl	%ebp, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	movb	(%r13,%rax), %cl
	movb	%cl, way2+18(%rax)
	movl	%r14d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%ebx
	cmpl	$256, %ebx
	jne	.LBB23_1	# bb
.LBB23_2:	# bb29
	movl	192(%rsp), %eax
	cmpl	%r12d, %eax
	jne	.LBB23_4	# bb29.bb.i_crit_edge
.LBB23_3:	# bb29
	movl	196(%rsp), %eax
	cmpl	%r15d, %eax
	je	.LBB23_77	# cond_true
.LBB23_4:	# bb29.bb.i_crit_edge
	xorl	%ebx, %ebx
.LBB23_5:	# bb.i
	movl	$92, cg_caller_id_var
	movl	$92, %edx
	movl	%ebp, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	shlq	$4, %rax
	movl	$0, way2+288(%rax)
	movl	%r14d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%ebx
	cmpl	$256, %ebx
	jne	.LBB23_5	# bb.i
.LBB23_6:	# bb16.i
	movw	$1, %ax
	addw	way2+16, %ax
	movw	%ax, way2+16
	cmpw	$65535, %ax
	jne	.LBB23_8	# cond_next.i
.LBB23_7:	# cond_true.i
	movq	way2+8, %rdi
	movl	way2+4428, %eax
	movl	way2+4424, %ecx
	movl	$0, cg_caller_call_site_var
	movl	$19, cg_caller_id_var
	imull	%ecx, %eax
	movslq	%eax, %rdx
	shlq	$2, %rdx
	xorl	%esi, %esi
	call	memset
	movw	$1, way2+16
.LBB23_8:	# cond_next.i
	movb	$0, way2+4404
	movl	$0, way2+4380
	movl	way2+292, %ebx
	cmpl	%ebx, way2+288
	jne	.LBB23_10	# cond_next115.i
.LBB23_9:	# cond_true69.i
	leal	(%rbx,%rbx), %r14d
	# ZERO-EXTEND 
	movl	%r14d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movq	way2+280, %rsi
	movl	$1, cg_caller_call_site_var
	movl	$19, cg_caller_id_var
	movslq	%ebx, %rdx
	shlq	$3, %rdx
	movq	%r15, %rdi
	call	memcpy
	movq	way2+280, %rdi
	call	free
	movq	%r15, way2+280
	movl	%r14d, way2+292
.LBB23_10:	# cond_next115.i
	movslq	way2+288, %rax
	movq	way2+280, %rcx
	movl	196(%rsp), %edx
	movl	%edx, (%rcx,%rax,8)
	movl	192(%rsp), %esi
	movl	%esi, 4(%rcx,%rax,8)
	incl	way2+288
	movl	way2+4424, %eax
	imull	%esi, %eax
	addl	%edx, %eax
	movslq	%eax, %rax
	movq	way2+8, %rcx
	movw	$0, 2(%rcx,%rax,4)
	movl	$0, way2+4376
	movl	$0, way2+4384
	movb	way2+4404, %al
	movb	%al, 191(%rsp)
	testb	%al, %al
	jne	.LBB23_20	# _ZN7way2obj4fillEii.exit
.LBB23_11:	# cond_next115.i.cond_next282.i.outer_crit_edge
	xorl	%ebx, %ebx
	movl	%ebx, %r14d
	movl	%ebx, 180(%rsp)
.LBB23_12:	# cond_next282.i.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 176(%rsp)
	movl	cg_caller_id_var, %r15d
	movl	%r15d, 184(%rsp)
	movl	$93, cg_caller_id_var
	movl	$93, %edx
	movl	%r15d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	xorl	%r15d, %r15d
	movl	way2+4380, %eax
	movl	%eax, 168(%rsp)
	movl	180(%rsp), %eax
	jmp	.LBB23_16	# cond_next282.i
.LBB23_13:	# bb160.i
	movl	%ebx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%ebx, %eax
	andl	$4294967040, %eax
	subl	%eax, %ebx
	movslq	%ebx, %r12
	movq	%r12, %rax
	shlq	$4, %rax
	movl	way2+288(%rax), %eax
	movl	%eax, 164(%rsp)
	movl	148(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	152(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	testl	%eax, %eax
	jne	.LBB23_22	# cond_false.i
.LBB23_14:	# cond_true184.i
	movl	148(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	152(%rsp), %eax
	movl	%eax, cg_caller_id_var
	incl	%r15d
	incl	%r14d
	cmpb	$0, 191(%rsp)
	jne	.LBB23_18	# cond_true184.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
.LBB23_15:	# cond_true184.i.cond_next282.i_crit_edge
	movl	%r14d, %eax
.LBB23_16:	# cond_next282.i
	movl	%ebx, %r12d
	movl	%r14d, 172(%rsp)
	movl	%eax, %r14d
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 148(%rsp)
	movl	cg_caller_id_var, %r13d
	movl	%r13d, 152(%rsp)
	movl	$94, cg_caller_id_var
	movl	$94, %edx
	movl	%r13d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	%ebx, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	movl	180(%rsp), %ebx
	leal	(%rbx,%r15), %ebx
	movl	168(%rsp), %eax
	leal	(%rax,%r15), %eax
	cmpl	$265, %eax
	jl	.LBB23_13	# bb160.i
.LBB23_17:	# cond_next282.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
	addl	%r15d, 168(%rsp)
	movl	%r12d, %ebx
	movl	172(%rsp), %eax
	movl	%eax, 180(%rsp)
	jmp	.LBB23_19	# _ZN7way2obj4fillEii.exit.loopexit.loopexit
.LBB23_18:	# cond_true184.i._ZN7way2obj4fillEii.exit.loopexit.loopexit_crit_edge
	addl	%r15d, 180(%rsp)
	addl	%r15d, 168(%rsp)
.LBB23_19:	# _ZN7way2obj4fillEii.exit.loopexit.loopexit
	movl	168(%rsp), %eax
	movl	%eax, way2+4380
	movl	180(%rsp), %eax
	movl	%eax, way2+4384
	movl	%ebx, way2+4376
.LBB23_20:	# _ZN7way2obj4fillEii.exit
	cmpb	$0, 191(%rsp)
	jne	.LBB23_45	# cond_next60
.LBB23_21:	# cond_true56
	movq	200(%rsp), %rax
	movq	$0, (%rax)
	movq	272(%rsp), %rax
	movl	$0, (%rax)
	movl	212(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	208(%rsp), %eax
	movl	%eax, cg_caller_id_var
	xorl	%eax, %eax
	addq	$216, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB23_22:	# cond_false.i
	movl	172(%rsp), %eax
	movl	%eax, way2+4384
	movl	%ebx, way2+4376
	movl	$0, way2+4380
	movl	164(%rsp), %eax
	decl	%eax
	testl	%eax, %eax
	js	.LBB23_86	# bb255.i
.LBB23_23:	# bb203.preheader.i
	testl	%eax, %eax
	movl	164(%rsp), %eax
	movl	$1, %r14d
	cmovns	%eax, %r14d
	movl	%r14d, 160(%rsp)
	decl	%eax
	movl	%eax, 164(%rsp)
	movl	$0, 156(%rsp)
.LBB23_24:	# bb203.i
	movl	$95, cg_caller_id_var
	movl	$95, %edx
	movl	152(%rsp), %edi
	movl	148(%rsp), %esi
	call	CallEdgeProfiler
	movslq	164(%rsp), %rax
	movslq	%ebx, %rcx
	shlq	$4, %rcx
	movq	way2+280(%rcx), %rcx
	movl	(%rcx,%rax,8), %ebx
	movl	%ebx, 132(%rsp)
	shlq	$4, %r12
	movq	way2+280(%r12), %r12
	movl	4(%r12,%rax,8), %eax
	movl	%eax, 136(%rsp)
	movl	way2+4424, %r14d
	imull	%eax, %r14d
	addl	%ebx, %r14d
	movslq	%r14d, %r12
	movw	way2+16, %ax
	movq	way2+8, %rcx
	cmpw	%ax, (%rcx,%r12,4)
	je	.LBB23_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB23_25:	# cond_next.i.i
	movw	%ax, (%rcx,%r12,4)
	movl	136(%rsp), %eax
	movl	%eax, %ebx
	decl	%ebx
	xorl	%r14d, %r14d
	testl	%ebx, %ebx
	cmovs	%r14d, %ebx
	movl	%ebx, 128(%rsp)
	movl	132(%rsp), %ebx
	movl	%ebx, %r15d
	decl	%r15d
	testl	%r15d, %r15d
	cmovs	%r14d, %r15d
	movl	%r15d, 144(%rsp)
	incl	%ebx
	movl	way2+4408, %r14d
	cmpl	%ebx, %r14d
	cmovl	%r14d, %ebx
	movl	%ebx, 120(%rsp)
	incl	%eax
	movl	way2+4412, %ebx
	movl	%ebx, 140(%rsp)
	cmpl	%eax, %ebx
	jge	.LBB23_78	# cond_next.i.i.bb352.i.i_crit_edge
.LBB23_26:	# cond_true79.i.i
	movl	128(%rsp), %eax
	cmpl	140(%rsp), %eax
	jg	.LBB23_79	# cond_true79.i.i.bb358.i.i_crit_edge
.LBB23_27:	# cond_true79.i.i.bb343.preheader.i.i_crit_edge
	movb	$1, 127(%rsp)
	movl	$10000000, 96(%rsp)
.LBB23_28:	# bb343.preheader.i.i
	movl	144(%rsp), %r14d
.LBB23_29:	# bb343.i.i
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r15d
	movl	$96, cg_caller_id_var
	movl	$96, %edx
	movl	%r15d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	cmpl	120(%rsp), %r14d
	jle	.LBB23_36	# bb86.preheader.i.i
.LBB23_30:	# bb343.i.i.bb349.i.i_crit_edge
	movl	96(%rsp), %ebx
	jmp	.LBB23_42	# bb349.i.i
.LBB23_31:	# bb86.i.i
	movl	$97, cg_caller_id_var
	movl	$97, %edx
	movl	%r15d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	cmpl	132(%rsp), %r14d
	je	.LBB23_92	# cond_next340.i.i
.LBB23_32:	# cond_true100.i.i
	movl	way2+4424, %r13d
	movl	128(%rsp), %eax
	imull	%r13d, %eax
	addl	%r14d, %eax
	movslq	%eax, %rax
	movw	way2+16, %cx
	movq	way2+8, %rdx
	cmpw	%cx, (%rdx,%rax,4)
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jne	.LBB23_88	# cond_false.split.i.i
.LBB23_33:	# cond_true121.i.i
	movzwl	2(%rdx,%rax,4), %ebx
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	cmpl	96(%rsp), %ebx
	jge	.LBB23_92	# cond_next340.i.i
.LBB23_34:	# cond_true142.i.i
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%r14d
	cmpl	120(%rsp), %r14d
	jg	.LBB23_41	# cond_true142.i.i.bb349.i.i_crit_edge
.LBB23_35:	# cond_true142.i.i.bb86.i.i_crit_edge
	movb	$0, 127(%rsp)
	movl	%ebx, 96(%rsp)
	jmp	.LBB23_31	# bb86.i.i
.LBB23_36:	# bb86.preheader.i.i
	movl	128(%rsp), %eax
	cmpl	136(%rsp), %eax
	je	.LBB23_31	# bb86.i.i
.LBB23_37:	# bb86.us.i.i.preheader
	movl	way2+4424, %r13d
	movl	128(%rsp), %eax
	imull	%r13d, %eax
	movl	%eax, 88(%rsp)
	movw	way2+16, %ax
	movw	%ax, 94(%rsp)
	movq	way2+8, %rbp
.LBB23_38:	# bb86.us.i.i
	movl	$98, cg_caller_id_var
	movl	$98, %edx
	movl	%r15d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	88(%rsp), %eax
	leal	(%rax,%r14), %eax
	movslq	%eax, %rax
	movw	94(%rsp), %cx
	cmpw	%cx, (%rbp,%rax,4)
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jne	.LBB23_88	# cond_false.split.i.i
.LBB23_39:	# cond_true121.us.i.i
	movzwl	2(%rbp,%rax,4), %ebx
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	cmpl	96(%rsp), %ebx
	jge	.LBB23_92	# cond_next340.i.i
.LBB23_40:	# cond_true142.us.i.i
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%r14d
	cmpl	120(%rsp), %r14d
	jle	.LBB23_95	# cond_true142.us.i.i.bb86.us.i.i_crit_edge
.LBB23_41:	# cond_true142.i.i.bb349.i.i_crit_edge
	movb	$0, 127(%rsp)
.LBB23_42:	# bb349.i.i
	incl	128(%rsp)
	movl	140(%rsp), %eax
.LBB23_43:	# bb352.i.i
	movl	128(%rsp), %r14d
	cmpl	%eax, %r14d
	jg	.LBB23_80	# bb358.i.i
.LBB23_44:	# bb352.i.i.bb343.preheader.i.i_crit_edge
	movl	%eax, 140(%rsp)
	movl	%ebx, 96(%rsp)
	jmp	.LBB23_28	# bb343.preheader.i.i
.LBB23_45:	# cond_next60
	movl	way2+4424, %ebx
	movl	%ebx, 80(%rsp)
	leal	(,%rbx,8), %eax
	# ZERO-EXTEND 
	movl	%eax, %edi
	call	malloc
	testl	%ebx, %ebx
	movl	way2+4388, %ebx
	movl	way2+4392, %r14d
	movq	%rax, 40(%rsp)
	jne	.LBB23_47	# cond_next88.i
.LBB23_46:	# cond_true.i3
	movl	80(%rsp), %r15d
	movl	%r15d, %eax
	shll	$4, %eax
	# ZERO-EXTEND 
	movl	%eax, %edi
	call	malloc
	movq	%rax, %r12
	movl	$3, cg_caller_call_site_var
	movl	$19, cg_caller_id_var
	movslq	%r15d, %rdx
	shlq	$3, %rdx
	movq	%r12, %rdi
	movq	40(%rsp), %r13
	movq	%r13, %rsi
	call	memcpy
	movq	%r13, %rdi
	call	free
	addl	%r15d, %r15d
	movl	%r15d, 80(%rsp)
	movq	%r12, 40(%rsp)
.LBB23_47:	# cond_next88.i
	movq	40(%rsp), %rax
	movl	%ebx, (%rax)
	movl	%r14d, 4(%rax)
	movq	272(%rsp), %rax
	movl	$1, (%rax)
	movb	$0, 87(%rsp)
	xorl	%eax, %eax
	movl	%eax, 72(%rsp)
	movl	%eax, 24(%rsp)
	movl	%eax, 20(%rsp)
	jmp	.LBB23_67	# cond_next496.i
.LBB23_48:	# bb113.i
	movq	272(%rsp), %rax
	movl	(%rax), %eax
	movl	%eax, 64(%rsp)
	decl	%eax
	movslq	%eax, %rax
	movq	40(%rsp), %rcx
	movl	(%rcx,%rax,8), %edx
	movl	%edx, 60(%rsp)
	movl	%edx, %esi
	incl	%esi
	movl	way2+4408, %edi
	cmpl	%esi, %edi
	cmovl	%edi, %esi
	movl	%esi, 28(%rsp)
	movl	4(%rcx,%rax,8), %eax
	movl	%eax, %ebx
	decl	%ebx
	xorl	%ecx, %ecx
	testl	%ebx, %ebx
	cmovs	%ecx, %ebx
	decl	%edx
	testl	%edx, %edx
	cmovs	%ecx, %edx
	movl	%edx, 36(%rsp)
	incl	%eax
	movl	way2+4412, %ecx
	movl	%ecx, 32(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB23_93	# bb113.i.bb373.i_crit_edge
.LBB23_49:	# cond_true209.i
	cmpl	32(%rsp), %ebx
	jg	.LBB23_61	# bb379.i
.LBB23_50:	# cond_true209.i.bb364.preheader.i_crit_edge
	movl	$100000000, %r14d
	movl	56(%rsp), %eax
	movl	%eax, 8(%rsp)
	movl	52(%rsp), %r15d
.LBB23_51:	# bb364.preheader.i
	movl	36(%rsp), %eax
	cmpl	28(%rsp), %eax
	jg	.LBB23_59	# bb370.i
.LBB23_52:	# bb.nph.i
	movl	60(%rsp), %r12d
	decl	%r12d
	xorl	%eax, %eax
	testl	%r12d, %r12d
	cmovs	%eax, %r12d
	movl	%r12d, %r13d
	negl	%r13d
	movl	%ebx, %eax
	imull	76(%rsp), %eax
	movl	%eax, 16(%rsp)
	movw	way2+16, %ax
	movw	%ax, 14(%rsp)
	movq	way2+8, %rbp
.LBB23_53:	# bb217.i
	movl	$100, cg_caller_id_var
	movl	$100, %edx
	movl	%r15d, %edi
	movl	8(%rsp), %esi
	call	CallEdgeProfiler
	movl	16(%rsp), %eax
	leal	(%rax,%r12), %eax
	movslq	%eax, %rax
	movw	14(%rsp), %cx
	cmpw	%cx, (%rbp,%rax,4)
	jne	.LBB23_58	# cond_next361.i
.LBB23_54:	# cond_true238.i
	movzwl	2(%rbp,%rax,4), %eax
	cmpl	%r14d, %eax
	jl	.LBB23_94	# cond_true238.i.cond_next361.i_crit_edge
.LBB23_55:	# cond_false.i8
	cmpl	%r14d, %eax
	jne	.LBB23_58	# cond_next361.i
.LBB23_56:	# cond_true295.i
	movl	way2+4396, %eax
	leal	(%r13,%rax), %ecx
	subl	24(%rsp), %eax
	imull	%eax, %eax
	movl	way2+4400, %edx
	movl	%edx, %esi
	subl	20(%rsp), %esi
	imull	%esi, %esi
	addl	%eax, %esi
	imull	%ecx, %ecx
	subl	%ebx, %edx
	imull	%edx, %edx
	addl	%ecx, %edx
	cmpl	%esi, %edx
	jge	.LBB23_58	# cond_next361.i
.LBB23_57:	# cond_true355.i
	movl	%r12d, 24(%rsp)
	movl	%ebx, 20(%rsp)
.LBB23_58:	# cond_next361.i
	movl	8(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	decl	%r13d
	incl	%r12d
	cmpl	28(%rsp), %r12d
	jle	.LBB23_53	# bb217.i
.LBB23_59:	# bb370.i
	incl	%ebx
	movl	32(%rsp), %eax
.LBB23_60:	# bb373.i
	cmpl	%eax, %ebx
	jle	.LBB23_96	# bb373.i.bb364.preheader.i_crit_edge
.LBB23_61:	# bb379.i
	movl	64(%rsp), %eax
	incl	%eax
	movq	272(%rsp), %rcx
	movl	%eax, (%rcx)
	movl	68(%rsp), %eax
	cmpl	80(%rsp), %eax
	jne	.LBB23_63	# cond_next447.i
.LBB23_62:	# cond_true403.i
	movl	80(%rsp), %ebx
	leal	(%rbx,%rbx), %r14d
	# ZERO-EXTEND 
	movl	%r14d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movl	$0, cg_caller_call_site_var
	movl	$99, cg_caller_id_var
	movslq	%ebx, %rdx
	shlq	$3, %rdx
	movq	%r15, %rdi
	movq	40(%rsp), %rbx
	movq	%rbx, %rsi
	call	memcpy
	movq	%rbx, %rdi
	call	free
	movq	%r15, 40(%rsp)
	movl	%r14d, 80(%rsp)
.LBB23_63:	# cond_next447.i
	movslq	68(%rsp), %rax
	movq	40(%rsp), %rcx
	movl	24(%rsp), %edx
	movl	%edx, (%rcx,%rax,8)
	movl	20(%rsp), %esi
	movl	%esi, 4(%rcx,%rax,8)
	cmpl	%edx, way2+4396
	jne	.LBB23_66	# bb489.i
.LBB23_64:	# cond_true478.i
	movl	20(%rsp), %eax
	cmpl	%eax, way2+4400
	jne	.LBB23_66	# bb489.i
.LBB23_65:	# cond_true486.i
	movb	$1, 87(%rsp)
.LBB23_66:	# bb489.i
	movl	56(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	52(%rsp), %eax
	movl	%eax, cg_caller_id_var
	incl	72(%rsp)
	cmpb	$0, 87(%rsp)
	jne	.LBB23_69	# bb508.i.cond_next523.i_crit_edge
.LBB23_67:	# cond_next496.i
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 56(%rsp)
	movl	cg_caller_id_var, %r14d
	movl	%r14d, 52(%rsp)
	movl	$99, cg_caller_id_var
	movl	$99, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	way2+4428, %eax
	movl	way2+4424, %ecx
	movl	%ecx, 76(%rsp)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	imull	%ecx, %eax
	movl	72(%rsp), %ecx
	movl	%ecx, %edx
	incl	%edx
	movl	%edx, 68(%rsp)
	cmpl	%ecx, %eax
	jg	.LBB23_48	# bb113.i
.LBB23_68:	# bb508.i
	cmpb	$0, 87(%rsp)
	je	.LBB23_74	# cond_true514.i
.LBB23_69:	# bb508.i.cond_next523.i_crit_edge
	incl	72(%rsp)
.LBB23_70:	# cond_next523.i
	movl	72(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$3, %rdi
	call	malloc
	movq	200(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	%ebx, %eax
	decl	%eax
	testl	%eax, %eax
	js	.LBB23_73	# bb574.i
.LBB23_71:	# bb534.preheader.i
	testl	%eax, %eax
	movl	$1, %ebx
	movl	72(%rsp), %eax
	cmovns	%eax, %ebx
	decl	%eax
	movl	%eax, 72(%rsp)
	xorl	%r14d, %r14d
.LBB23_72:	# bb534.i
	movl	$101, cg_caller_id_var
	movl	$101, %edx
	movl	52(%rsp), %r15d
	movl	%r15d, %edi
	movl	56(%rsp), %r12d
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	72(%rsp), %eax
	movslq	%eax, %rcx
	movq	40(%rsp), %rdx
	movl	4(%rdx,%rcx,8), %esi
	movl	(%rdx,%rcx,8), %ecx
	movslq	%r14d, %rdx
	movq	200(%rsp), %rdi
	movq	(%rdi), %rdi
	movl	%ecx, (%rdi,%rdx,8)
	movl	%esi, 4(%rdi,%rdx,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	decl	%eax
	movl	%eax, 72(%rsp)
	incl	%r14d
	cmpl	%ebx, %r14d
	jne	.LBB23_72	# bb534.i
.LBB23_73:	# bb574.i
	movq	40(%rsp), %rdi
	call	free
	movl	212(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	208(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	movl	$1, %ecx
	jmp	.LBB23_75	# bb574.i
.LBB23_74:	# cond_true514.i
	movq	40(%rsp), %rdi
	call	free
	movq	200(%rsp), %rcx
	movq	$0, (%rcx)
	movq	272(%rsp), %rcx
	movl	$0, (%rcx)
	movl	212(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	208(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	xorl	%ecx, %ecx
.LBB23_75:	# bb574.i
	movl	%ecx, %eax
.LBB23_76:	# bb574.i
	addq	$216, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB23_77:	# cond_true
	movl	$8, %edi
	call	malloc
	movq	200(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	272(%rsp), %rcx
	movl	$0, (%rcx)
	movl	212(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	208(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	$1, %eax
	jmp	.LBB23_76	# bb574.i
.LBB23_78:	# cond_next.i.i.bb352.i.i_crit_edge
	movb	$1, 127(%rsp)
	movl	$10000000, %ebx
	jmp	.LBB23_43	# bb352.i.i
.LBB23_79:	# cond_true79.i.i.bb358.i.i_crit_edge
	movb	$1, 127(%rsp)
	movl	$10000000, %ebx
.LBB23_80:	# bb358.i.i
	movl	way2+4424, %eax
	imull	136(%rsp), %eax
	addl	132(%rsp), %eax
	movslq	%eax, %r12
	movq	way2, %rax
	movzbq	(%rax,%r12), %rax
	movzbw	way2+18(%rax), %ax
	cmpb	$0, 127(%rsp)
	movq	way2+8, %rcx
	jne	.LBB23_82	# cond_false413.i.i
.LBB23_81:	# cond_true364.i.i
	addw	%bx, %ax
.LBB23_82:	# cond_false413.i.i
	movw	%ax, 2(%rcx,%r12,4)
	movl	132(%rsp), %eax
	cmpl	%eax, way2+4388
	jne	.LBB23_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB23_83:	# cond_true467.i.i
	movl	136(%rsp), %eax
	cmpl	%eax, way2+4392
	jne	.LBB23_85	# _ZN7way2obj12releasepointEii.exit.i
.LBB23_84:	# cond_true475.i.i
	movb	$1, way2+4404
.LBB23_85:	# _ZN7way2obj12releasepointEii.exit.i
	movl	way2+4376, %ebx
	movl	148(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	152(%rsp), %eax
	movl	%eax, cg_caller_id_var
	decl	164(%rsp)
	movl	156(%rsp), %eax
	incl	%eax
	movl	%eax, 156(%rsp)
	cmpl	160(%rsp), %eax
	movslq	%ebx, %r12
	jne	.LBB23_24	# bb203.i
.LBB23_86:	# bb255.i
	shlq	$4, %r12
	movl	$0, way2+288(%r12)
	movl	$1, %r14d
	addl	way2+4384, %r14d
	movl	%r14d, way2+4384
	movb	way2+4404, %al
	movb	%al, 191(%rsp)
	movl	176(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	184(%rsp), %r15d
	movl	%r15d, cg_caller_id_var
	testb	%al, %al
	jne	.LBB23_20	# _ZN7way2obj4fillEii.exit
.LBB23_87:	# bb255.i.cond_next282.i.outer_crit_edge
	movl	%r14d, 180(%rsp)
	jmp	.LBB23_12	# cond_next282.i.outer
.LBB23_88:	# cond_false.split.i.i
	imull	128(%rsp), %r13d
	addl	%r14d, %r13d
	movslq	%r13d, %r12
	movq	way2, %rax
	movzbq	(%rax,%r12), %r12
	movb	way2+18(%r12), %al
	testb	%al, %al
	je	.LBB23_92	# cond_next340.i.i
.LBB23_89:	# cond_true197.critedge.i.i
	movzbl	%al, %eax
	addl	way2+4384, %eax
	movl	%eax, %ebx
	sarl	$31, %ebx
	shrl	$24, %ebx
	addl	%eax, %ebx
	andl	$4294967040, %ebx
	subl	%ebx, %eax
	movslq	%eax, %r12
	movq	%r12, %rax
	shlq	$4, %rax
	movl	way2+292(%rax), %ebx
	cmpl	%ebx, way2+288(%rax)
	leaq	way2+288(%rax), %rcx
	movq	%rcx, 104(%rsp)
	leaq	way2+292(%rax), %rax
	movq	%rax, 112(%rsp)
	jne	.LBB23_91	# cond_next310.i.i
.LBB23_90:	# cond_true264.i.i
	leal	(%rbx,%rbx), %eax
	movl	%eax, 100(%rsp)
	# ZERO-EXTEND 
	movl	%eax, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r15
	movq	%r12, %r13
	shlq	$4, %r13
	movq	way2+280(%r13), %rsi
	movl	$0, cg_caller_call_site_var
	movl	$96, cg_caller_id_var
	movslq	%ebx, %rdx
	shlq	$3, %rdx
	movq	%r15, %rdi
	call	memcpy
	movq	way2+280(%r13), %rdi
	call	free
	movq	%r15, way2+280(%r13)
	movq	112(%rsp), %rcx
	movl	100(%rsp), %eax
	movl	%eax, (%rcx)
.LBB23_91:	# cond_next310.i.i
	shlq	$4, %r12
	movq	way2+280(%r12), %r12
	movq	104(%rsp), %rax
	movslq	(%rax), %rcx
	movl	%r14d, (%r12,%rcx,8)
	movl	128(%rsp), %ebx
	movl	%ebx, 4(%r12,%rcx,8)
	incl	(%rax)
.LBB23_92:	# cond_next340.i.i
	incl	%r14d
	jmp	.LBB23_29	# bb343.i.i
.LBB23_93:	# bb113.i.bb373.i_crit_edge
	movl	$100000000, %r14d
	movl	56(%rsp), %ecx
	movl	%ecx, 8(%rsp)
	movl	52(%rsp), %r15d
	jmp	.LBB23_60	# bb373.i
.LBB23_94:	# cond_true238.i.cond_next361.i_crit_edge
	movl	%r12d, 24(%rsp)
	movl	%ebx, 20(%rsp)
	movl	%eax, %r14d
	jmp	.LBB23_58	# cond_next361.i
.LBB23_95:	# cond_true142.us.i.i.bb86.us.i.i_crit_edge
	movb	$0, 127(%rsp)
	movl	%ebx, 96(%rsp)
	jmp	.LBB23_38	# bb86.us.i.i
.LBB23_96:	# bb373.i.bb364.preheader.i_crit_edge
	movl	%eax, 32(%rsp)
	jmp	.LBB23_51	# bb364.preheader.i
	.size	_ZN7way2obj9createwayEiiiiPhRP6pointtRi, .-_ZN7way2obj9createwayEiiiiPhRP6pointtRi


	.align	16
	.type	_ZN6wayobj7destroyEv,@function
_ZN6wayobj7destroyEv:
	pushq	%r14
	pushq	%rbx
	subq	$8, %rsp
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$20, cg_caller_id_var
	movl	$20, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movq	way.19, %rdi
	testq	%rdi, %rdi
	je	.LBB24_2	# cond_next
.LBB24_1:	# cond_true
	movl	$0, cg_caller_call_site_var
	movl	$20, cg_caller_id_var
	call	_ZdaPv
.LBB24_2:	# cond_next
	movq	way.18, %rdi
	testq	%rdi, %rdi
	je	.LBB24_4	# cond_next20
.LBB24_3:	# cond_true15
	movl	$1, cg_caller_call_site_var
	movl	$20, cg_caller_id_var
	call	_ZdaPv
.LBB24_4:	# cond_next20
	movq	way.17, %rdi
	testq	%rdi, %rdi
	je	.LBB24_6	# cond_next32
.LBB24_5:	# cond_true27
	movl	$2, cg_caller_call_site_var
	movl	$20, cg_caller_id_var
	call	_ZdaPv
.LBB24_6:	# cond_next32
	movq	way.16, %rdi
	testq	%rdi, %rdi
	je	.LBB24_8	# UnifiedReturnBlock
.LBB24_7:	# cond_true40
	movl	$3, cg_caller_call_site_var
	movl	$20, cg_caller_id_var
	call	_ZdaPv
.LBB24_8:	# UnifiedReturnBlock
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
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
	subq	$56, %rsp
	movl	%edi, %ebx
	movl	%esi, %r14d
	movl	%edx, %r15d
	movl	%ecx, %r12d
	movl	%r8d, %r13d
	movl	%r9d, %ebp
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 20(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 16(%rsp)
	movl	$21, cg_caller_id_var
	movl	$21, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	%ebx, 24(%rsp)
	movl	%r14d, 28(%rsp)
	movl	%r15d, 32(%rsp)
	movl	%r12d, 36(%rsp)
	movl	%r13d, 40(%rsp)
	movl	%ebp, 44(%rsp)
	movl	112(%rsp), %eax
	movl	%eax, 48(%rsp)
	movl	120(%rsp), %eax
	movl	%eax, 52(%rsp)
	movl	40(%rsp), %eax
	movl	44(%rsp), %edx
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
	movl	$0, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
	shll	%cl, %eax
	movslq	%eax, %r14
	leaq	(%r14,%r14), %rdi
	call	_Znam
	movq	%rax, way.16
	movl	$1, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
	movq	%r14, %rdi
	shlq	$2, %rdi
	call	_Znam
	movq	%rax, way.17
	movq	way.16, %rdi
	movb	way.1, %al
	movb	way.0, %dl
	movl	$2, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
	movb	%dl, %cl
	shll	%cl, %ebx
	movb	%al, %cl
	shll	%cl, %ebx
	movslq	%ebx, %rbx
	leaq	(%rbx,%rbx), %rdx
	xorl	%r14d, %r14d
	movl	%r14d, %esi
	call	memset
	movq	way.17, %rdi
	movl	$3, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
	movq	%rbx, %rdx
	shlq	$2, %rdx
	movl	%r14d, %esi
	call	memset
	movl	way.8, %eax
	movl	%eax, 12(%rsp)
	testl	%eax, %eax
	jle	.LBB25_6	# bb293
.LBB25_1:	# bb.preheader
	xorl	%ebx, %ebx
	movl	way.2, %r14d
	movq	way.16, %r15
.LBB25_2:	# bb
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$102, cg_caller_id_var
	movl	$102, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movb	%r14b, %cl
	movl	%ebx, %eax
	shll	%cl, %eax
	movslq	%eax, %rax
	movw	$65535, (%r15,%rax,2)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%ebx
	movl	12(%rsp), %eax
	cmpl	%ebx, %eax
	jg	.LBB25_2	# bb
.LBB25_3:	# bb275
	cmpl	$0, 12(%rsp)
	jle	.LBB25_6	# bb293
.LBB25_4:	# bb258.preheader
	xorl	%r15d, %r15d
	movl	way.3, %r14d
	movl	way.2, %ebx
	movq	way.16, %rbp
.LBB25_5:	# bb258
	movl	$103, cg_caller_id_var
	movl	$103, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movb	%bl, %cl
	movl	%r15d, %eax
	shll	%cl, %eax
	orl	%r14d, %eax
	movslq	%eax, %rax
	movw	$65535, (%rbp,%rax,2)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%r15d
	movl	12(%rsp), %eax
	cmpl	%r15d, %eax
	jg	.LBB25_5	# bb258
.LBB25_6:	# bb293
	movl	way.7, %r15d
	testl	%r15d, %r15d
	jle	.LBB25_12	# bb327
.LBB25_7:	# bb284.preheader
	xorl	%r14d, %r14d
	movq	way.16, %rbx
.LBB25_8:	# bb284
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$104, cg_caller_id_var
	movl	$104, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movslq	%r14d, %rax
	movw	$65535, (%rbx,%rax,2)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%r14d
	cmpl	%r14d, %r15d
	jg	.LBB25_8	# bb284
.LBB25_9:	# bb319.preheader
	testl	%r15d, %r15d
	jle	.LBB25_12	# bb327
.LBB25_10:	# bb302.preheader
	movl	way.4, %r14d
	movb	way.2, %cl
	shll	%cl, %r14d
	xorl	%ebx, %ebx
	movq	way.16, %rbp
.LBB25_11:	# bb302
	movl	$105, cg_caller_id_var
	movl	$105, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	%r14d, %eax
	orl	%ebx, %eax
	movslq	%eax, %rax
	movw	$65535, (%rbp,%rax,2)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%ebx
	cmpl	%ebx, %r15d
	jg	.LBB25_11	# bb302
.LBB25_12:	# bb327
	movl	12(%rsp), %eax
	addl	%r15d, %eax
	imull	$12, %eax, %eax
	movl	%eax, way.20
	movl	$4, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
	movslq	%eax, %rdi
	shlq	$2, %rdi
	call	_Znam
	movq	%rax, way.18
	movslq	way.20, %rdi
	movl	$5, cg_caller_call_site_var
	movl	$21, cg_caller_id_var
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
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	16(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$56, %rsp
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
.LCPI26_1:					#  float
	.long	1056964608	# float 0.5
.LCPI26_2:					#  float
	.long	940205271	# float 3.29957e-05
.LCPI26_3:					#  float
	.long	940216657	# float 3.30371e-05
.LCPI26_4:					#  float
	.long	940200485	# float 3.29783e-05
.LCPI26_5:					#  float
	.long	2147483648	# float -0
.LCPI26_6:					#  float
	.long	1065353216	# float 1
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI26_0:					#  double
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
	subq	$5512, %rsp
	movl	%edi, %ebx
	movq	%rsi, %r14
	movl	$0, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str13, %rdi
	call	puts
	movl	$1, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str14, %rdi
	call	puts
	cmpl	$2, %ebx
	je	.LBB26_4	# cond_next
.LBB26_1:	# cond_true
	movl	$2, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str15, %rdi
.LBB26_2:	# cond_true
	call	puts
	call	CallProfPrinter
	movl	$1, %ecx
.LBB26_3:	# cond_true
	movl	%ecx, %eax
	addq	$5512, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB26_4:	# cond_next
	movq	8(%r14), %rdi
	movl	$3, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str16, %rsi
	call	fopen
	testq	%rax, %rax
	movq	%rax, %rbx
	je	.LBB26_90	# cond_true37
.LBB26_5:	# cond_next41
	movl	$5, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorb	%r14b, %r14b
	leaq	1288(%rsp), %r15
	leaq	.str18, %rsi
	movq	%rbx, %rdi
	movq	%r15, %rdx
	movb	%r14b, %al
	call	fscanf
	movl	$6, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str19, %r12
	leaq	5384(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$7, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5388(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$8, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5392(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$9, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5396(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$10, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5400(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$11, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5404(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$12, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5408(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$13, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5412(%rsp), %rdx
	leaq	.str20, %rsi
	movq	%rbx, %rdi
	movb	%r14b, %al
	call	fscanf
	movl	$14, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5416(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$15, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5420(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$16, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5424(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movb	%r14b, %al
	call	fscanf
	movl	$17, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movq	%rbx, %rdi
	call	fclose
	movl	$18, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str21, %rdi
	call	puts
	movl	$19, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movq	%r15, %rdi
	call	puts
	movl	$20, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
	movl	$21, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%ecx, %ecx
	movq	%r15, %rdi
	movl	%ecx, %esi
	movb	%r14b, %al
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, 228(%rsp)
	je	.LBB26_13	# _ZN6wayobj7loadmapEPKc.exit
.LBB26_6:	# cond_next.i
	movl	$22, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	$1, %ebx
	leaq	5472(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$23, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5473(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$24, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5474(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$25, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5475(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$26, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5464(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$27, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5465(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$28, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5466(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	$29, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	5467(%rsp), %rsi
	movl	228(%rsp), %edi
	movq	%rbx, %rdx
	call	read
	movl	5464(%rsp), %ebx
	movl	5472(%rsp), %eax
	movl	%eax, 224(%rsp)
	movl	$3296329728, 5432(%rsp)
	movl	$3296329728, 5440(%rsp)
	movl	$1148846080, 5436(%rsp)
	movl	$1148846080, 5444(%rsp)
	movl	$30, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	cvtsi2sd	%eax, %xmm0
	call	log
	divsd	.LCPI26_0(%rip), %xmm0
	cvtss2sd	.LCPI26_1(%rip), %xmm1
	movsd	%xmm1, 232(%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5448(%rsp)
	movl	$31, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	cvtsi2sd	%ebx, %xmm0
	call	log
	divsd	.LCPI26_0(%rip), %xmm0
	addsd	232(%rsp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5452(%rsp)
	movl	$0, 5456(%rsp)
	movl	$1203982336, 5460(%rsp)
	movl	5444(%rsp), %eax
	movl	5436(%rsp), %r10d
	movl	5448(%rsp), %r11d
	movl	5456(%rsp), %r14d
	movl	5452(%rsp), %r15d
	movl	5440(%rsp), %r12d
	movl	5432(%rsp), %r13d
	movl	$32, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r14d, (%rsp)
	movl	$1203982336, 8(%rsp)
	movl	%r13d, %edi
	movl	%r10d, %esi
	movl	%r12d, %edx
	movl	%eax, %ecx
	movl	%r11d, %r8d
	movl	%r15d, %r9d
	call	_ZN6wayobj6createE17createwaymnginfot
	imull	224(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	call	malloc
	movq	%rax, 192(%rsp)
	movl	$33, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movslq	%ebx, %rdx
	movl	228(%rsp), %edi
	movq	%rax, %rsi
	call	read
	movl	way.4, %eax
	movl	%eax, 220(%rsp)
	cmpl	$2, %eax
	jl	.LBB26_12	# bb152.i
.LBB26_7:	# bb133.preheader.i
	movl	$1, 212(%rsp)
	movl	way.2, %eax
	movl	%eax, 216(%rsp)
	movq	way.16, %rbx
	movl	way.3, %r14d
.LBB26_8:	# bb133.outer.i
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 208(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 204(%rsp)
	movl	$121, cg_caller_id_var
	movl	$121, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpl	$2, %r14d
	jl	.LBB26_11	# bb144.i
.LBB26_9:	# bb106.i.preheader
	movl	216(%rsp), %eax
	movb	%al, %cl
	movl	212(%rsp), %r15d
	shll	%cl, %r15d
	movl	$1, %r12d
.LBB26_10:	# bb106.i
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$122, cg_caller_id_var
	movl	$122, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	%r15d, %eax
	orl	%r12d, %eax
	movslq	%eax, %rax
	movq	192(%rsp), %rcx
	movzbw	(%rcx,%rax), %cx
	movw	%cx, (%rbx,%rax,2)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r12d
	cmpl	%r12d, %r14d
	jg	.LBB26_10	# bb106.i
.LBB26_11:	# bb144.i
	movl	208(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	204(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	212(%rsp), %eax
	incl	%eax
	movl	%eax, 212(%rsp)
	movl	220(%rsp), %ecx
	cmpl	%eax, %ecx
	jg	.LBB26_8	# bb133.outer.i
.LBB26_12:	# bb152.i
	movq	192(%rsp), %rdi
	call	free
	movl	$34, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	228(%rsp), %edi
	call	close
.LBB26_13:	# _ZN6wayobj7loadmapEPKc.exit
	movl	$35, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorb	%al, %al
	xorl	%esi, %esi
	leaq	1288(%rsp), %rdi
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, %ebx
	je	.LBB26_17	# _ZN9regmngobj7loadmapEPKc.exit
.LBB26_14:	# cond_next.i30
	movl	$36, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	$1, %r14d
	leaq	regmng+324, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$37, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+325, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$38, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+326, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$39, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+327, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$40, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+328, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$41, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+329, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$42, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	regmng+330, %rsi
	movl	%ebx, %edi
	movq	%r14, %rdx
	call	read
	movl	$43, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
	movl	$44, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
	movl	$45, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	imull	%ecx, %eax
	movslq	%eax, %rdx
	movl	%ebx, %edi
	call	read
.LBB26_15:	# bb.i
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$120, cg_caller_id_var
	movl	$120, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movslq	%r14d, %rax
	movb	$0, regmng+48(%rax)
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	incl	%r14d
	cmpl	$256, %r14d
	jne	.LBB26_15	# bb.i
.LBB26_16:	# bb164.i
	movb	$1, regmng+48
	movl	$46, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%ebx, %edi
	call	close
.LBB26_17:	# _ZN9regmngobj7loadmapEPKc.exit
	movl	5384(%rsp), %edi
	movl	$47, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN9regmngobj13createregionsEi
	movl	$48, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%edi, %edi
	call	time
	cmpl	$0, 5388(%rsp)
	jle	.LBB26_91	# _ZN9regmngobj7loadmapEPKc.exit.bb183_crit_edge
.LBB26_18:	# _ZN9regmngobj7loadmapEPKc.exit.bb_crit_edge
	xorl	%eax, %eax
	movq	%rax, 184(%rsp)
	movl	$0, 172(%rsp)
	movq	%rax, 176(%rsp)
.LBB26_19:	# bb
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$106, cg_caller_id_var
	movl	$106, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	$0, 1260(%rsp)
	movq	$0, 1264(%rsp)
	movl	y3rnd, %ecx
	imull	$170, %ecx, %ecx
	movl	$2320639257, %r8d
	movl	%ecx, %eax
	imull	%r8d
	movl	%edx, %r9d
	movl	y1rnd, %r10d
	imull	$171, %r10d, %r10d
	movl	$1162389643, %r11d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %r15d
	movl	y2rnd, %r12d
	imull	$172, %r12d, %r12d
	movl	$1160932197, %r13d
	movl	%r12d, %eax
	imull	%r13d
	movl	%edx, %ebp
	shrl	$31, %ebp
	sarl	$13, %edx
	addl	%ebp, %edx
	imull	$30307, %edx, %ebp
	subl	%ebp, %r12d
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r15d, %ebp
	shrl	$31, %ebp
	sarl	$13, %r15d
	addl	%ebp, %r15d
	imull	$30269, %r15d, %r15d
	subl	%r15d, %r10d
	cvtsi2ss	%r10d, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %r9d
	movl	%r9d, %r15d
	shrl	$31, %r15d
	sarl	$14, %r9d
	addl	%r15d, %r9d
	imull	$30323, %r9d, %r9d
	subl	%r9d, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %r9d
	cvtsi2ss	%r9d, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %r9d
	incl	%r9d
	movl	%r9d, 1284(%rsp)
	imull	$171, %r10d, %r10d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %r11d
	shrl	$31, %r11d
	sarl	$13, %edx
	addl	%r11d, %edx
	imull	$30269, %edx, %r11d
	subl	%r11d, %r10d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r10d, y1rnd
	imull	$172, %r12d, %r11d
	movl	%r11d, %eax
	imull	%r13d
	movl	%edx, %r15d
	shrl	$31, %r15d
	sarl	$13, %edx
	addl	%r15d, %edx
	imull	$30307, %edx, %r15d
	subl	%r15d, %r11d
	movl	%r11d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%r8d
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r11d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r10d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	incl	%eax
	movl	%eax, 1280(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$106, cg_caller_id_var
	leaq	1280(%rsp), %rcx
	leaq	1284(%rsp), %rdx
	movl	%r9d, %edi
	movl	%eax, %esi
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB26_92	# bb.cond_next159_crit_edge
.LBB26_20:	# cond_true132
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
	movl	$1160932197, %r15d
	movl	%r11d, %eax
	imull	%r15d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
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
	movss	.LCPI26_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 1276(%rsp)
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
	imull	%r15d
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
	movl	%esi, 1272(%rsp)
	movl	$1, cg_caller_call_site_var
	movl	$106, cg_caller_id_var
	leaq	1272(%rsp), %rcx
	leaq	1276(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB26_93	# cond_true132.cond_next150_crit_edge
.LBB26_21:	# cond_true144
	movl	1284(%rsp), %edi
	movl	1276(%rsp), %edx
	movl	1280(%rsp), %esi
	movl	1272(%rsp), %ecx
	movl	$2, cg_caller_call_site_var
	movl	$106, cg_caller_id_var
	leaq	1260(%rsp), %r9
	leaq	1264(%rsp), %r8
	call	_ZN6wayobj9createwayEiiiiRP8point16tRi
.LBB26_22:	# cond_next150
	movb	%al, %r15b
	movq	1264(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB26_24	# cond_next159
.LBB26_23:	# cond_true155
	call	free
.LBB26_24:	# cond_next159
	testb	%r15b, %r15b
	je	.LBB26_26	# bb176
.LBB26_25:	# cond_true162
	movslq	1260(%rsp), %rax
	addq	176(%rsp), %rax
	incq	184(%rsp)
	movq	%rax, 176(%rsp)
.LBB26_26:	# bb176
	movl	172(%rsp), %eax
	incl	%eax
	movl	%eax, 172(%rsp)
	cmpl	%eax, 5388(%rsp)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jg	.LBB26_19	# bb
.LBB26_27:	# bb183
	movl	$52, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%edi, %edi
	call	time
	cmpl	$0, 5400(%rsp)
	jle	.LBB26_94	# bb183.bb278_crit_edge
.LBB26_28:	# bb183.bb186_crit_edge
	xorl	%eax, %eax
	movq	%rax, 160(%rsp)
	xorl	%ebx, %ebx
	movq	%rax, 152(%rsp)
.LBB26_29:	# bb186
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$107, cg_caller_id_var
	movl	$107, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movl	y1rnd, %ecx
	imull	$171, %ecx, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	shrl	$31, %edi
	sarl	$13, %edx
	addl	%edi, %edx
	imull	$30269, %edx, %edi
	subl	%edi, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %esi
	shrl	$31, %esi
	sarl	$13, %edx
	addl	%esi, %edx
	imull	$30269, %edx, %esi
	subl	%esi, %edi
	movl	$4294967295, %esi
	addl	regmng+400, %esi
	movl	y3rnd, %r8d
	movl	y2rnd, %r9d
	movl	%edi, y1rnd
	imull	$172, %r9d, %r9d
	movl	$1160932197, %r10d
	movl	%r9d, %eax
	imull	%r10d
	movl	%edx, %r11d
	shrl	$31, %r11d
	sarl	$13, %edx
	addl	%r11d, %edx
	imull	$30307, %edx, %r11d
	subl	%r11d, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%r10d
	movl	%edx, %r10d
	shrl	$31, %r10d
	sarl	$13, %edx
	addl	%r10d, %edx
	imull	$30307, %edx, %r10d
	subl	%r10d, %r11d
	movl	%r11d, y2rnd
	imull	$170, %r8d, %r8d
	movl	$2320639257, %r10d
	movl	%r8d, %eax
	imull	%r10d
	addl	%r8d, %edx
	movl	%edx, %r12d
	shrl	$31, %r12d
	sarl	$14, %edx
	addl	%r12d, %edx
	imull	$30323, %edx, %r12d
	subl	%r12d, %r8d
	imull	$170, %r8d, %r12d
	movl	%r12d, %eax
	imull	%r10d
	addl	%r12d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r12d
	movl	%r12d, y3rnd
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
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
	je	.LBB26_35	# bb271
.LBB26_30:	# cond_next220
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	movslq	%eax, %rax
	movq	(%rcx,%rax,8), %rsi
	cmpl	$0, 48(%rsi)
	je	.LBB26_35	# bb271
.LBB26_31:	# cond_next242
	movq	$0, 1248(%rsp)
	movl	$0, 1244(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$107, cg_caller_id_var
	leaq	1248(%rsp), %rdx
	leaq	1244(%rsp), %rcx
	call	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri
	movq	1248(%rsp), %rdi
	testq	%rdi, %rdi
	movb	%al, %r12b
	je	.LBB26_33	# cond_next253
.LBB26_32:	# cond_true250
	call	free
.LBB26_33:	# cond_next253
	testb	%r12b, %r12b
	je	.LBB26_35	# bb271
.LBB26_34:	# cond_true256
	movslq	1244(%rsp), %rax
	addq	152(%rsp), %rax
	incq	160(%rsp)
	movq	%rax, 152(%rsp)
.LBB26_35:	# bb271
	incl	%ebx
	cmpl	%ebx, 5400(%rsp)
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB26_29	# bb186
.LBB26_36:	# bb278
	movq	regway+8, %rdi
	call	free
	movq	regway+24, %rdi
	call	free
	movl	$54, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN9regmngobj7destroyEv
	movl	$55, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN6wayobj7destroyEv
	movq	$0, way2+8
	movq	$0, way2
	movl	$56, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorb	%cl, %cl
	xorl	%edx, %edx
	leaq	1288(%rsp), %rdi
	movl	%edx, %esi
	movb	%cl, %al
	call	open
	cmpl	$4294967295, %eax
	movl	%eax, 148(%rsp)
	je	.LBB26_40	# _ZN7way2obj7loadmapEPKc.exit
.LBB26_37:	# cond_next.i580
	movl	$57, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	$1, %ebx
	leaq	way2+4416, %rsi
	movl	148(%rsp), %r14d
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$58, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4417, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$59, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4418, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$60, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4419, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$61, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4420, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$62, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4421, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$63, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4422, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	$64, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	way2+4423, %rsi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	call	read
	movl	way2+4416, %ebx
	movl	%ebx, way2+4424
	movl	way2+4420, %r14d
	movl	%r14d, way2+4428
	xorl	%r15d, %r15d
.LBB26_38:	# bb.i586
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$119, cg_caller_id_var
	movl	$119, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movslq	%r15d, %rbp
	shlq	$4, %rbp
	movl	$128, way2+292(%rbp)
	movl	$0, way2+288(%rbp)
	movl	$1024, %edi
	call	malloc
	movq	%rax, way2+280(%rbp)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%r15d
	cmpl	$256, %r15d
	jne	.LBB26_38	# bb.i586
.LBB26_39:	# bb110.i
	movl	%r14d, %r15d
	imull	%ebx, %r15d
	decl	%ebx
	movl	%ebx, way2+4408
	decl	%r14d
	movl	%r14d, way2+4412
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$2, %rdi
	call	malloc
	movq	%rax, %rdi
	movq	%rdi, way2+8
	movl	$65, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movslq	%r15d, %rcx
	shlq	$2, %rcx
	shrq	$2, %rcx
	xorl	%edx, %edx
	xorl	%eax, %eax
	rep;stosl
	movq	%rdx, %rcx
	rep;stosb
	movw	$0, way2+16
	movl	way2+4428, %ebx
	movl	way2+4424, %eax
	imull	%eax, %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	call	malloc
	movq	%rax, way2
	movl	$66, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movslq	%ebx, %rdx
	movl	148(%rsp), %ebx
	movl	%ebx, %edi
	movq	%rax, %rsi
	call	read
	movl	$67, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%ebx, %edi
	call	close
.LBB26_40:	# _ZN7way2obj7loadmapEPKc.exit
	cmpl	$0, 5392(%rsp)
	jle	.LBB26_95	# _ZN7way2obj7loadmapEPKc.exit.bb445_crit_edge
.LBB26_41:	# bb299.preheader
	xorl	%eax, %eax
	movq	%rax, 136(%rsp)
	xorl	%ebx, %ebx
	movq	%rax, 128(%rsp)
.LBB26_42:	# bb299.outer
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$108, cg_caller_id_var
	movl	$108, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	xorl	%r12d, %r12d
.LBB26_43:	# bb291
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$109, cg_caller_id_var
	movl	$109, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r12d, %rax
	movb	%r12b, 972(%rsp,%rax)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r12d
	cmpl	$256, %r12d
	jne	.LBB26_43	# bb291
.LBB26_44:	# bb304
	movb	$255, 972(%rsp)
	movb	$1, 973(%rsp)
	movb	$255, 974(%rsp)
	movl	$0, 1228(%rsp)
	movq	$0, 1232(%rsp)
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
	imull	$172, %r10d, %r12d
	movl	%r12d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r12d
	movl	%r12d, y2rnd
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
	imull	$170, %r9d, %r13d
	movl	%r13d, %eax
	imull	%r11d
	addl	%r13d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r13d
	movl	%r13d, y3rnd
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%r13d, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
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
	cmpb	$0, 972(%rsp,%rax)
	je	.LBB26_47	# bb438
.LBB26_45:	# cond_true357
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
	imull	$172, %r12d, %r9d
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
	imull	$170, %r13d, %r12d
	movl	$2320639257, %ecx
	movl	%r12d, %eax
	imull	%ecx
	addl	%r12d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r12d
	imull	$170, %r12d, %r13d
	movl	%r13d, %eax
	imull	%ecx
	addl	%r13d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r13d
	movl	%r13d, y3rnd
	movl	$0, cg_caller_call_site_var
	movl	$108, cg_caller_id_var
	leaq	1228(%rsp), %rax
	movq	%rax, (%rsp)
	cvtsi2ss	%r11d, %xmm1
	movss	.LCPI26_2(%rip), %xmm3
	mulss	%xmm3, %xmm1
	cvtsi2ss	%r8d, %xmm4
	movss	.LCPI26_3(%rip), %xmm5
	mulss	%xmm5, %xmm4
	addss	%xmm1, %xmm4
	cvtsi2ss	%r13d, %xmm1
	movss	.LCPI26_4(%rip), %xmm6
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
	cvtsi2ss	%r12d, %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	%xmm1, %xmm2
	cvttss2si	%xmm2, %edx
	incl	%edx
	leaq	1232(%rsp), %r9
	leaq	972(%rsp), %r8
	movl	%r10d, %edi
	call	_ZN7way2obj9createwayEiiiiPhRP6pointtRi
	movb	%al, %r12b
	movq	1232(%rsp), %rdi
	call	free
	testb	%r12b, %r12b
	je	.LBB26_47	# bb438
.LBB26_46:	# cond_true424
	movslq	1228(%rsp), %rax
	addq	128(%rsp), %rax
	incq	136(%rsp)
	movq	%rax, 128(%rsp)
.LBB26_47:	# bb438
	incl	%ebx
	cmpl	%ebx, 5392(%rsp)
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB26_42	# bb299.outer
.LBB26_48:	# bb445
	movl	$69, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%edi, %edi
	call	time
	cmpl	$0, 5396(%rsp)
	jle	.LBB26_96	# bb445.bb616_crit_edge
.LBB26_49:	# bb466.preheader
	xorl	%eax, %eax
	movq	%rax, 120(%rsp)
	xorl	%ebx, %ebx
	movq	%rax, 112(%rsp)
.LBB26_50:	# bb466.outer
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$110, cg_caller_id_var
	movl	$110, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	xorl	%r12d, %r12d
.LBB26_51:	# bb458
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$111, cg_caller_id_var
	movl	$111, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r12d, %rax
	movb	%r12b, 700(%rsp,%rax)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r12d
	cmpl	$256, %r12d
	jne	.LBB26_51	# bb458
.LBB26_52:	# bb471
	movb	$1, 700(%rsp)
	movb	$255, 701(%rsp)
	movb	$255, 702(%rsp)
	movl	$0, 956(%rsp)
	movq	$0, 960(%rsp)
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
	imull	$172, %r10d, %r12d
	movl	%r12d, %eax
	imull	%r11d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r12d
	movl	%r12d, y2rnd
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
	imull	$170, %r9d, %r13d
	movl	%r13d, %eax
	imull	%r11d
	addl	%r13d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r13d
	movl	%r13d, y3rnd
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%r13d, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
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
	cmpb	$0, 700(%rsp,%rax)
	je	.LBB26_55	# bb609
.LBB26_53:	# cond_true528
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
	imull	$172, %r12d, %r9d
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
	imull	$170, %r13d, %r12d
	movl	$2320639257, %ecx
	movl	%r12d, %eax
	imull	%ecx
	addl	%r12d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r12d
	imull	$170, %r12d, %r13d
	movl	%r13d, %eax
	imull	%ecx
	addl	%r13d, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %r13d
	movl	%r13d, y3rnd
	movl	$0, cg_caller_call_site_var
	movl	$110, cg_caller_id_var
	leaq	956(%rsp), %rax
	movq	%rax, (%rsp)
	cvtsi2ss	%r11d, %xmm1
	movss	.LCPI26_2(%rip), %xmm3
	mulss	%xmm3, %xmm1
	cvtsi2ss	%r8d, %xmm4
	movss	.LCPI26_3(%rip), %xmm5
	mulss	%xmm5, %xmm4
	addss	%xmm1, %xmm4
	cvtsi2ss	%r13d, %xmm1
	movss	.LCPI26_4(%rip), %xmm6
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
	cvtsi2ss	%r12d, %xmm0
	mulss	%xmm6, %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	%xmm1, %xmm2
	cvttss2si	%xmm2, %edx
	incl	%edx
	leaq	960(%rsp), %r9
	leaq	700(%rsp), %r8
	movl	%r10d, %edi
	call	_ZN7way2obj9createwayEiiiiPhRP6pointtRi
	movb	%al, %r12b
	movq	960(%rsp), %rdi
	call	free
	testb	%r12b, %r12b
	je	.LBB26_55	# bb609
.LBB26_54:	# cond_true595
	movslq	956(%rsp), %rax
	addq	112(%rsp), %rax
	incq	120(%rsp)
	movq	%rax, 112(%rsp)
.LBB26_55:	# bb609
	incl	%ebx
	cmpl	%ebx, 5396(%rsp)
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	jg	.LBB26_50	# bb466.outer
.LBB26_56:	# bb616
	xorl	%ebx, %ebx
.LBB26_57:	# bb.i349
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$112, cg_caller_id_var
	movl	$112, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movslq	%ebx, %rax
	shlq	$4, %rax
	movq	way2+280(%rax), %rdi
	call	free
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	$256, %ebx
	jne	.LBB26_57	# bb.i349
.LBB26_58:	# _ZN7way2obj7destroyEv.exit
	movq	way2, %rdi
	call	free
	movq	way2+8, %rdi
	call	free
	movl	$71, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movb	$1, %bl
	leaq	.str17, %rdi
	pxor	%xmm0, %xmm0
	movb	%bl, %al
	call	printf
	movl	$72, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	$10, %r14d
	movl	%r14d, %edi
	call	putchar
	movl	$73, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str12, %rdi
	pxor	%xmm0, %xmm0
	movb	%bl, %al
	call	printf
	movl	$74, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorb	%r15b, %r15b
	leaq	.str28, %rdi
	movq	184(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$75, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str39, %rdi
	movq	176(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$76, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r14d, %edi
	call	putchar
	movl	$77, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str410, %rdi
	pxor	%xmm0, %xmm0
	movb	%bl, %al
	call	printf
	movl	$78, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str511, %rdi
	movq	160(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$79, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str612, %rdi
	movq	152(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$80, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r14d, %edi
	call	putchar
	movl	$81, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str7, %rdi
	pxor	%xmm0, %xmm0
	movb	%bl, %al
	call	printf
	movl	$82, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str8, %rdi
	movq	136(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$83, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str9, %rdi
	movq	128(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$84, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str10, %rdi
	pxor	%xmm0, %xmm0
	movb	%bl, %al
	call	printf
	movl	$85, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str11, %rdi
	movq	120(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$86, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str123, %rdi
	movq	112(%rsp), %rsi
	movb	%r15b, %al
	call	printf
	movl	$87, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r14d, %edi
	call	putchar
	movl	$88, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str21, %rdi
	call	puts
	movl	$89, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str22, %rdi
	call	puts
	movl	$90, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
	movl	5404(%rsp), %ebx
	movl	%ebx, 60(%rsp)
	movl	5408(%rsp), %eax
	movl	%eax, 92(%rsp)
	movss	5412(%rsp), %xmm0
	movss	%xmm0, 108(%rsp)
	movl	$3296329728, 5480(%rsp)
	movl	$3296329728, 5488(%rsp)
	movl	$1148846080, 5484(%rsp)
	movl	$1148846080, 5492(%rsp)
	movl	$91, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	cvtsi2sd	%ebx, %xmm0
	call	log
	divsd	.LCPI26_0(%rip), %xmm0
	cvtss2sd	.LCPI26_1(%rip), %xmm1
	movsd	%xmm1, 96(%rsp)
	addsd	%xmm1, %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5496(%rsp)
	movl	$92, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	cvtsi2sd	92(%rsp), %xmm0
	call	log
	divsd	.LCPI26_0(%rip), %xmm0
	addsd	96(%rsp), %xmm0
	cvttsd2si	%xmm0, %eax
	movl	%eax, 5500(%rsp)
	movl	$0, 5504(%rsp)
	movl	$1203982336, 5508(%rsp)
	movl	5492(%rsp), %eax
	movl	5484(%rsp), %r10d
	movl	5496(%rsp), %r11d
	movl	5504(%rsp), %r14d
	movl	5500(%rsp), %r15d
	movl	5488(%rsp), %r12d
	movl	5480(%rsp), %r13d
	movl	$93, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
	movl	92(%rsp), %eax
	movl	%eax, regmng+336
	movl	%ebx, %eax
	decl	%eax
	movl	%eax, regmng+316
	movl	92(%rsp), %r14d
	imull	%ebx, %r14d
	movl	92(%rsp), %ebx
	decl	%ebx
	movl	%ebx, regmng+320
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
	movl	$94, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
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
.LBB26_59:	# bb.i285
	movl	cg_caller_call_site_var, %r15d
	movl	%r15d, 84(%rsp)
	movl	cg_caller_id_var, %r12d
	movl	%r12d, 80(%rsp)
	movl	$113, cg_caller_id_var
	movl	$113, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movslq	%r14d, %rax
	movb	$0, regmng+48(%rax)
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	incl	%r14d
	cmpl	$256, %r14d
	jne	.LBB26_59	# bb.i285
.LBB26_60:	# _ZN9regmngobj7initmapEii.exit
	movb	$1, regmng+48
	cmpl	$0, 92(%rsp)
	movq	regmng+40, %rax
	movq	%rax, 48(%rsp)
	jle	.LBB26_68	# bb684
.LBB26_61:	# bb669.preheader
	testl	%ebx, %ebx
	movl	$1, %eax
	movl	92(%rsp), %ecx
	cmovs	%eax, %ecx
	movl	%ecx, 92(%rsp)
	movss	108(%rsp), %xmm0
	addss	.LCPI26_5(%rip), %xmm0
	movss	%xmm0, 108(%rsp)
	movl	y1rnd, %ebx
	movl	way.2, %eax
	movl	%eax, 88(%rsp)
	movl	y3rnd, %r14d
	movl	y2rnd, %r15d
	movq	way.16, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movl	%eax, 56(%rsp)
	movl	%eax, 68(%rsp)
.LBB26_62:	# bb669.outer
	movl	$114, cg_caller_id_var
	movl	$114, %edx
	movl	80(%rsp), %edi
	movl	84(%rsp), %esi
	call	CallEdgeProfiler
	movl	88(%rsp), %eax
	movb	%al, %cl
	movl	68(%rsp), %eax
	shll	%cl, %eax
	movl	%eax, 64(%rsp)
	xorl	%r12d, %r12d
	jmp	.LBB26_89	# bb669
.LBB26_63:	# bb640
	movl	$116, cg_caller_id_var
	movl	$116, %edx
	movl	%r13d, %edi
	movl	%ebp, %esi
	call	CallEdgeProfiler
	movl	%ebp, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	imull	$170, %r14d, %r14d
	movl	$2320639257, %ecx
	movl	%r14d, %eax
	imull	%ecx
	movl	%edx, %ecx
	imull	$171, %ebx, %ebx
	movl	$1162389643, %esi
	movl	%ebx, %eax
	imull	%esi
	movl	%edx, %esi
	imull	$172, %r15d, %r15d
	movl	$1160932197, %edi
	movl	%r15d, %eax
	imull	%edi
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r15d
	cvtsi2ss	%r15d, %xmm0
	mulss	.LCPI26_2(%rip), %xmm0
	movl	%esi, %eax
	shrl	$31, %eax
	sarl	$13, %esi
	addl	%eax, %esi
	imull	$30269, %esi, %eax
	subl	%eax, %ebx
	cvtsi2ss	%ebx, %xmm1
	mulss	.LCPI26_3(%rip), %xmm1
	addss	%xmm0, %xmm1
	addl	%r14d, %ecx
	movl	%ecx, %eax
	shrl	$31, %eax
	sarl	$14, %ecx
	addl	%eax, %ecx
	imull	$30323, %ecx, %eax
	subl	%eax, %r14d
	cvtsi2ss	%r14d, %xmm0
	mulss	.LCPI26_4(%rip), %xmm0
	addss	%xmm0, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm1
	mulss	108(%rsp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm0, %xmm1
	movl	56(%rsp), %eax
	leal	(%rax,%r12), %eax
	movss	.LCPI26_6(%rip), %xmm0
	ucomiss	%xmm1, %xmm0
	movslq	%eax, %rax
	jb	.LBB26_87	# cond_false
.LBB26_64:	# cond_true647
	movq	48(%rsp), %rcx
	movb	$0, (%rax,%rcx)
	movl	%ebp, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	incl	%r12d
.LBB26_65:	# cond_true647
	cmpl	60(%rsp), %r12d
	jl	.LBB26_63	# bb640
.LBB26_66:	# bb675
	movl	84(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	80(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	56(%rsp), %eax
	addl	60(%rsp), %eax
	movl	%eax, 56(%rsp)
	movl	68(%rsp), %eax
	incl	%eax
	movl	%eax, 68(%rsp)
	cmpl	92(%rsp), %eax
	jne	.LBB26_62	# bb669.outer
.LBB26_67:	# bb684.loopexit
	movl	%ebx, y1rnd
	movl	%r15d, y2rnd
	movl	%r14d, y3rnd
.LBB26_68:	# bb684
	movl	5416(%rsp), %edi
	movl	$95, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN9regmngobj13createregionsEi
	movl	$96, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%edi, %edi
	call	time
	cmpl	$0, 5420(%rsp)
	jle	.LBB26_98	# bb684.bb772_crit_edge
.LBB26_69:	# bb684.bb702_crit_edge
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)
	movl	$0, 28(%rsp)
	movq	%rax, 32(%rsp)
.LBB26_70:	# bb702
	movl	cg_caller_call_site_var, %ebx
	movl	cg_caller_id_var, %r14d
	movl	$117, cg_caller_id_var
	movl	$117, %edx
	movl	%r14d, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	$0, 668(%rsp)
	movq	$0, 672(%rsp)
	movl	y3rnd, %ecx
	imull	$170, %ecx, %ecx
	movl	$2320639257, %r8d
	movl	%ecx, %eax
	imull	%r8d
	movl	%edx, %r9d
	movl	y1rnd, %r10d
	imull	$171, %r10d, %r10d
	movl	$1162389643, %r11d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %r15d
	movl	y2rnd, %r12d
	imull	$172, %r12d, %r12d
	movl	$1160932197, %r13d
	movl	%r12d, %eax
	imull	%r13d
	movl	%edx, %ebp
	shrl	$31, %ebp
	sarl	$13, %edx
	addl	%ebp, %edx
	imull	$30307, %edx, %ebp
	subl	%ebp, %r12d
	cvtsi2ss	%r12d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r15d, %ebp
	shrl	$31, %ebp
	sarl	$13, %r15d
	addl	%ebp, %r15d
	imull	$30269, %r15d, %r15d
	subl	%r15d, %r10d
	cvtsi2ss	%r10d, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	addl	%ecx, %r9d
	movl	%r9d, %r15d
	shrl	$31, %r15d
	sarl	$14, %r9d
	addl	%r15d, %r9d
	imull	$30323, %r9d, %r9d
	subl	%r9d, %ecx
	cvtsi2ss	%ecx, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %r9d
	cvtsi2ss	%r9d, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %r9d
	incl	%r9d
	movl	%r9d, 696(%rsp)
	imull	$171, %r10d, %r10d
	movl	%r10d, %eax
	imull	%r11d
	movl	%edx, %r11d
	shrl	$31, %r11d
	sarl	$13, %edx
	addl	%r11d, %edx
	imull	$30269, %edx, %r11d
	subl	%r11d, %r10d
	cvtsi2ss	regmng+320, %xmm0
	movl	%r10d, y1rnd
	imull	$172, %r12d, %r11d
	movl	%r11d, %eax
	imull	%r13d
	movl	%edx, %r15d
	shrl	$31, %r15d
	sarl	$13, %edx
	addl	%r15d, %edx
	imull	$30307, %edx, %r15d
	subl	%r15d, %r11d
	movl	%r11d, y2rnd
	imull	$170, %ecx, %ecx
	movl	%ecx, %eax
	imull	%r8d
	addl	%ecx, %edx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$14, %edx
	addl	%eax, %edx
	imull	$30323, %edx, %eax
	subl	%eax, %ecx
	movl	%ecx, y3rnd
	cvtsi2ss	%r11d, %xmm2
	mulss	%xmm1, %xmm2
	cvtsi2ss	%r10d, %xmm1
	mulss	%xmm3, %xmm1
	addss	%xmm2, %xmm1
	cvtsi2ss	%ecx, %xmm2
	mulss	%xmm4, %xmm2
	addss	%xmm2, %xmm1
	cvttss2si	%xmm1, %eax
	cvtsi2ss	%eax, %xmm2
	subss	%xmm2, %xmm1
	mulss	%xmm1, %xmm0
	cvttss2si	%xmm0, %eax
	incl	%eax
	movl	%eax, 692(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$117, cg_caller_id_var
	leaq	692(%rsp), %rcx
	leaq	696(%rsp), %rdx
	movl	%r9d, %edi
	movl	%eax, %esi
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB26_99	# bb702.cond_next748_crit_edge
.LBB26_71:	# cond_true721
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
	movl	$1160932197, %r15d
	movl	%r11d, %eax
	imull	%r15d
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$13, %edx
	addl	%eax, %edx
	imull	$30307, %edx, %eax
	subl	%eax, %r11d
	cvtsi2ss	%r11d, %xmm0
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movl	%r10d, %eax
	shrl	$31, %eax
	sarl	$13, %r10d
	addl	%eax, %r10d
	imull	$30269, %r10d, %eax
	subl	%eax, %r8d
	cvtsi2ss	%r8d, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
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
	movss	.LCPI26_4(%rip), %xmm4
	mulss	%xmm4, %xmm0
	addss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm0
	subss	%xmm0, %xmm2
	cvtsi2ss	regmng+316, %xmm0
	mulss	%xmm2, %xmm0
	cvttss2si	%xmm0, %edi
	incl	%edi
	movl	%edi, 688(%rsp)
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
	imull	%r15d
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
	movl	%esi, 684(%rsp)
	movl	$1, cg_caller_call_site_var
	movl	$117, cg_caller_id_var
	leaq	684(%rsp), %rcx
	leaq	688(%rsp), %rdx
	call	_ZN6wayobj13findfreepointEiiRiS0_
	testb	%al, %al
	je	.LBB26_100	# cond_true721.cond_next739_crit_edge
.LBB26_72:	# cond_true733
	movl	696(%rsp), %edi
	movl	688(%rsp), %edx
	movl	692(%rsp), %esi
	movl	684(%rsp), %ecx
	movl	$2, cg_caller_call_site_var
	movl	$117, cg_caller_id_var
	leaq	668(%rsp), %r9
	leaq	672(%rsp), %r8
	call	_ZN6wayobj9createwayEiiiiRP8point16tRi
.LBB26_73:	# cond_next739
	movb	%al, %r15b
	movq	672(%rsp), %rdi
	testq	%rdi, %rdi
	je	.LBB26_75	# cond_next748
.LBB26_74:	# cond_true744
	call	free
.LBB26_75:	# cond_next748
	testb	%r15b, %r15b
	je	.LBB26_77	# bb765
.LBB26_76:	# cond_true751
	movslq	668(%rsp), %rax
	addq	32(%rsp), %rax
	incq	40(%rsp)
	movq	%rax, 32(%rsp)
.LBB26_77:	# bb765
	movl	28(%rsp), %eax
	incl	%eax
	movl	%eax, 28(%rsp)
	cmpl	%eax, 5420(%rsp)
	movl	%ebx, cg_caller_call_site_var
	movl	%r14d, cg_caller_id_var
	jg	.LBB26_70	# bb702
.LBB26_78:	# bb772
	cmpl	$0, 5424(%rsp)
	jle	.LBB26_101	# bb772.bb871_crit_edge
.LBB26_79:	# bb772.bb774_crit_edge
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
	movq	%rbx, %r14
.LBB26_80:	# bb774
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$118, cg_caller_id_var
	movl	$118, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	y1rnd, %ecx
	imull	$171, %ecx, %ecx
	movl	$1162389643, %esi
	movl	%ecx, %eax
	imull	%esi
	movl	%edx, %edi
	shrl	$31, %edi
	sarl	$13, %edx
	addl	%edi, %edx
	imull	$30269, %edx, %edi
	subl	%edi, %ecx
	imull	$171, %ecx, %edi
	movl	%edi, %eax
	imull	%esi
	movl	%edx, %esi
	shrl	$31, %esi
	sarl	$13, %edx
	addl	%esi, %edx
	imull	$30269, %edx, %esi
	subl	%esi, %edi
	movl	$4294967295, %esi
	addl	regmng+400, %esi
	movl	y3rnd, %r8d
	movl	y2rnd, %r9d
	movl	%edi, y1rnd
	imull	$172, %r9d, %r9d
	movl	$1160932197, %r10d
	movl	%r9d, %eax
	imull	%r10d
	movl	%edx, %r11d
	shrl	$31, %r11d
	sarl	$13, %edx
	addl	%r11d, %edx
	imull	$30307, %edx, %r11d
	subl	%r11d, %r9d
	imull	$172, %r9d, %r11d
	movl	%r11d, %eax
	imull	%r10d
	movl	%edx, %r10d
	shrl	$31, %r10d
	sarl	$13, %edx
	addl	%r10d, %edx
	imull	$30307, %edx, %r10d
	subl	%r10d, %r11d
	movl	%r11d, y2rnd
	imull	$170, %r8d, %r8d
	movl	$2320639257, %r10d
	movl	%r8d, %eax
	imull	%r10d
	addl	%r8d, %edx
	movl	%edx, %ebp
	shrl	$31, %ebp
	sarl	$14, %edx
	addl	%ebp, %edx
	imull	$30323, %edx, %ebp
	subl	%ebp, %r8d
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
	movss	.LCPI26_2(%rip), %xmm1
	mulss	%xmm1, %xmm0
	cvtsi2ss	%edi, %xmm2
	movss	.LCPI26_3(%rip), %xmm3
	mulss	%xmm3, %xmm2
	addss	%xmm0, %xmm2
	cvtsi2ss	%ebp, %xmm0
	movss	.LCPI26_4(%rip), %xmm4
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
	je	.LBB26_86	# bb864
.LBB26_81:	# cond_next813
	cvttss2si	%xmm2, %eax
	cvtsi2ss	%eax, %xmm1
	subss	%xmm1, %xmm2
	mulss	%xmm0, %xmm2
	cvttss2si	%xmm2, %eax
	movslq	%eax, %rax
	movq	(%rcx,%rax,8), %rsi
	cmpl	$0, 48(%rsi)
	je	.LBB26_86	# bb864
.LBB26_82:	# cond_next835
	movq	$0, 656(%rsp)
	movl	$0, 652(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$118, cg_caller_id_var
	leaq	656(%rsp), %rdx
	leaq	652(%rsp), %rcx
	call	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri
	movq	656(%rsp), %rdi
	testq	%rdi, %rdi
	movb	%al, %bpl
	je	.LBB26_84	# cond_next846
.LBB26_83:	# cond_true843
	call	free
.LBB26_84:	# cond_next846
	testb	%bpl, %bpl
	je	.LBB26_86	# bb864
.LBB26_85:	# cond_true849
	movslq	652(%rsp), %rax
	addq	%r14, %rax
	incq	%rbx
	movq	%rax, %r14
.LBB26_86:	# bb864
	incl	%r15d
	cmpl	%r15d, 5424(%rsp)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jg	.LBB26_80	# bb774
	jmp	.LBB26_102	# bb871
.LBB26_87:	# cond_false
	movq	48(%rsp), %rcx
	movb	$1, (%rax,%rcx)
	movl	64(%rsp), %r13d
	orl	%r12d, %r13d
	movslq	%r13d, %rax
	movq	72(%rsp), %rcx
	movw	(%rcx,%rax,2), %cx
	testw	%cx, %cx
	jns	.LBB26_97	# cond_true.i
.LBB26_88:	# bb669.backedge
	incl	%r12d
.LBB26_89:	# bb669
	movl	cg_caller_call_site_var, %ebp
	movl	cg_caller_id_var, %r13d
	movl	$115, cg_caller_id_var
	movl	$115, %edx
	movl	%r13d, %edi
	movl	%ebp, %esi
	call	CallEdgeProfiler
	movl	%ebp, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	jmp	.LBB26_65	# cond_true647
.LBB26_90:	# cond_true37
	movl	$4, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str1713, %rdi
	jmp	.LBB26_2	# cond_true
.LBB26_91:	# _ZN9regmngobj7loadmapEPKc.exit.bb183_crit_edge
	xorl	%eax, %eax
	movq	%rax, 184(%rsp)
	movq	%rax, 176(%rsp)
	jmp	.LBB26_27	# bb183
.LBB26_92:	# bb.cond_next159_crit_edge
	xorb	%r15b, %r15b
	jmp	.LBB26_24	# cond_next159
.LBB26_93:	# cond_true132.cond_next150_crit_edge
	xorb	%al, %al
	jmp	.LBB26_22	# cond_next150
.LBB26_94:	# bb183.bb278_crit_edge
	xorl	%eax, %eax
	movq	%rax, 160(%rsp)
	movq	%rax, 152(%rsp)
	jmp	.LBB26_36	# bb278
.LBB26_95:	# _ZN7way2obj7loadmapEPKc.exit.bb445_crit_edge
	xorl	%eax, %eax
	movq	%rax, 136(%rsp)
	movq	%rax, 128(%rsp)
	jmp	.LBB26_48	# bb445
.LBB26_96:	# bb445.bb616_crit_edge
	xorl	%eax, %eax
	movq	%rax, 120(%rsp)
	movq	%rax, 112(%rsp)
	jmp	.LBB26_56	# bb616
.LBB26_97:	# cond_true.i
	incw	%cx
	movq	72(%rsp), %rdx
	movw	%cx, (%rdx,%rax,2)
	jmp	.LBB26_88	# bb669.backedge
.LBB26_98:	# bb684.bb772_crit_edge
	xorl	%eax, %eax
	movq	%rax, 40(%rsp)
	movq	%rax, 32(%rsp)
	jmp	.LBB26_78	# bb772
.LBB26_99:	# bb702.cond_next748_crit_edge
	xorb	%r15b, %r15b
	jmp	.LBB26_75	# cond_next748
.LBB26_100:	# cond_true721.cond_next739_crit_edge
	xorb	%al, %al
	jmp	.LBB26_73	# cond_next739
.LBB26_101:	# bb772.bb871_crit_edge
	xorl	%ebx, %ebx
	movq	%rbx, %r14
.LBB26_102:	# bb871
	movq	regway+8, %rdi
	call	free
	movq	regway+24, %rdi
	call	free
	movl	$101, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN9regmngobj7destroyEv
	movl	$102, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	call	_ZN6wayobj7destroyEv
	movl	$103, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movb	$1, %r15b
	leaq	.str17, %rdi
	pxor	%xmm0, %xmm0
	movb	%r15b, %al
	call	printf
	movl	$104, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	$10, %r12d
	movl	%r12d, %edi
	call	putchar
	movl	$105, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str12, %rdi
	pxor	%xmm0, %xmm0
	movb	%r15b, %al
	call	printf
	movl	$106, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorb	%r13b, %r13b
	leaq	.str28, %rdi
	movq	40(%rsp), %rsi
	movb	%r13b, %al
	call	printf
	movl	$107, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str39, %rdi
	movq	32(%rsp), %rsi
	movb	%r13b, %al
	call	printf
	movl	$108, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r12d, %edi
	call	putchar
	movl	$109, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str410, %rdi
	pxor	%xmm0, %xmm0
	movb	%r15b, %al
	call	printf
	movl	$110, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str511, %rdi
	movq	%rbx, %rsi
	movb	%r13b, %al
	call	printf
	movl	$111, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str612, %rdi
	movq	%r14, %rsi
	movb	%r13b, %al
	call	printf
	movl	$112, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r12d, %edi
	call	putchar
	movl	$113, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str7, %rdi
	pxor	%xmm0, %xmm0
	movb	%r15b, %al
	call	printf
	movl	$114, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	xorl	%ebx, %ebx
	leaq	.str8, %rdi
	movq	%rbx, %rsi
	movb	%r13b, %al
	call	printf
	movl	$115, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str9, %rdi
	movq	%rbx, %rsi
	movb	%r13b, %al
	call	printf
	movl	$116, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str10, %rdi
	pxor	%xmm0, %xmm0
	movb	%r15b, %al
	call	printf
	movl	$117, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str11, %rdi
	movq	%rbx, %rsi
	movb	%r13b, %al
	call	printf
	movl	$118, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	leaq	.str123, %rdi
	movq	%rbx, %rsi
	movb	%r13b, %al
	call	printf
	movl	$119, cg_caller_call_site_var
	movl	$22, cg_caller_id_var
	movl	%r12d, %edi
	call	putchar
	call	CallProfPrinter
	xorl	%ecx, %ecx
	jmp	.LBB26_3	# cond_true
	.size	main, .-main


	.align	16
	.type	_ZN9regwayobj6createEP9regmngobj,@function
_ZN9regwayobj6createEP9regmngobj:
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$23, cg_caller_id_var
	movl	$23, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movq	%r14, 48(%rbx)
	movl	$1, %r13d
	movl	%r13d, %eax
	addl	400(%r14), %eax
	movl	%eax, 20(%rbx)
	movl	$0, 16(%rbx)
	# ZERO-EXTEND 
	movl	%eax, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, 8(%rbx)
	addl	400(%r14), %r13d
	movl	%r13d, 36(%rbx)
	movl	$0, 32(%rbx)
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, 24(%rbx)
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
	.size	_ZN9regwayobj6createEP9regmngobj, .-_ZN9regwayobj6createEP9regmngobj


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI28_0:					#  float
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
	subq	$88, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movq	%r14, 16(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 72(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 64(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 68(%rsp)
	movl	$24, cg_caller_id_var
	movl	$24, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	cmpq	%r14, %rbx
	jne	.LBB28_3	# cond_next
.LBB28_1:	# cond_true
	movl	$8, %edi
	call	malloc
	movq	56(%rsp), %rcx
	movq	%rax, (%rcx)
	movq	%rbx, (%rax)
	movq	72(%rsp), %rbx
	movl	$1, (%rbx)
	movl	64(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	68(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	movl	$1, %eax
.LBB28_2:	# cond_true
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB28_3:	# cond_next
	movb	$0, regway+56
	movq	16(%rsp), %rax
	movq	%rax, regway+64
	movq	%rbx, regway+72
	movq	regway+48, %rax
	movl	$1, %ecx
	addl	24(%rax), %ecx
	movl	%ecx, 24(%rax)
	cmpl	$1073741824, %ecx
	jne	.LBB28_33	# cond_next.bb33.i.i_crit_edge
.LBB28_4:	# cond_true.i.i
	movl	$1, 24(%rax)
	cmpl	$0, 400(%rax)
	jle	.LBB28_8	# _ZN9regmngobj13getregfillnumEv.exit.i
.LBB28_5:	# cond_true.i.i.bb.i.i_crit_edge
	xorl	%ecx, %ecx
.LBB28_6:	# bb.i.i
	movslq	%ecx, %rdx
	movq	344(%rax), %rsi
	movq	(%rsi,%rdx,8), %rdx
	movl	$0, 32(%rdx)
	incl	%ecx
.LBB28_7:	# bb33.i.i
	cmpl	%ecx, 400(%rax)
	jg	.LBB28_6	# bb.i.i
.LBB28_8:	# _ZN9regmngobj13getregfillnumEv.exit.i
	movl	24(%rax), %eax
	movl	%eax, regway+44
	movl	%eax, 32(%rbx)
	movl	$0, 36(%rbx)
	movl	$0, regway+16
	movl	regway+20, %r14d
	testl	%r14d, %r14d
	jne	.LBB28_10	# cond_next81.i
.LBB28_9:	# cond_true.i
	leal	(%r14,%r14), %r15d
	# ZERO-EXTEND 
	movl	%r15d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %r12
	movq	regway+8, %rsi
	movl	$0, cg_caller_call_site_var
	movl	$24, cg_caller_id_var
	movslq	%r14d, %rdx
	shlq	$3, %rdx
	movq	%r12, %rdi
	call	memcpy
	movq	regway+8, %rdi
	call	free
	movq	%r12, regway+8
	movl	%r15d, regway+20
.LBB28_10:	# cond_next81.i
	movslq	regway+16, %rax
	movq	regway+8, %rcx
	movq	%rbx, (%rcx,%rax,8)
	incl	regway+16
	movl	$1, regway+40
	xorb	%bl, %bl
	movl	$1, 52(%rsp)
	jmp	.LBB28_14	# cond_next139.i
.LBB28_11:	# bb100.i
	testb	%bl, %bl
	je	.LBB28_34	# cond_true106.i
.LBB28_12:	# cond_false.i
	movl	$1, cg_caller_call_site_var
	movl	$123, cg_caller_id_var
	leaq	regway+8, %rsi
	leaq	regway+24, %rdi
	call	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_
	leaq	regway+16, %rax
	xorb	%bl, %bl
.LBB28_13:	# cond_next125.i
	movl	$1, %ecx
	addl	regway+40, %ecx
	movl	%ecx, 52(%rsp)
	cmpl	$0, (%rax)
	movl	%ecx, regway+40
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_id_var
	je	.LBB28_15	# _ZN9regwayobj4fillEP6regobjS1_.exit
.LBB28_14:	# cond_next139.i
	movl	cg_caller_call_site_var, %r14d
	movl	%r14d, 32(%rsp)
	movl	cg_caller_id_var, %r15d
	movl	%r15d, 28(%rsp)
	movl	$123, cg_caller_id_var
	movl	$123, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	cmpb	$0, regway+56
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	je	.LBB28_11	# bb100.i
.LBB28_15:	# _ZN9regwayobj4fillEP6regobjS1_.exit
	cmpb	$0, regway+56
	je	.LBB28_35	# cond_true22
.LBB28_16:	# cond_next26
	movl	52(%rsp), %ebx
	# ZERO-EXTEND 
	movl	%ebx, %edi
	shlq	$3, %rdi
	call	malloc
	movq	56(%rsp), %rcx
	movq	%rax, (%rcx)
	movl	%ebx, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	movq	16(%rsp), %rsi
	movq	%rsi, (%rax,%rdx,8)
	testl	%ecx, %ecx
	jle	.LBB28_29	# bb203.i
.LBB28_17:	# bb.preheader.i
	movl	52(%rsp), %ecx
	movl	%ecx, 36(%rsp)
	movq	%rax, 40(%rsp)
	movq	%rax, %rbx
.LBB28_18:	# bb.i
	movl	$124, cg_caller_id_var
	movl	$124, %edx
	movl	28(%rsp), %edi
	movl	32(%rsp), %esi
	call	CallEdgeProfiler
	movl	36(%rsp), %eax
	decl	%eax
	movslq	%eax, %rax
	movq	(%rbx,%rax,8), %rbx
	movl	48(%rbx), %r14d
	testl	%r14d, %r14d
	jle	.LBB28_36	# bb.i.bb181.i_crit_edge
.LBB28_19:	# bb28.preheader.i
	movl	36(%rsp), %eax
	leal	-2(%rax), %eax
	movl	%eax, 8(%rsp)
	movq	40(%rbx), %rbx
	movq	%rbx, (%rsp)
	movl	regway+44, %r15d
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	movss	.LCPI28_0(%rip), %xmm0
	movss	%xmm0, 12(%rsp)
.LBB28_20:	# bb28.i
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$125, cg_caller_id_var
	movl	$125, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	%r12d, %rax
	movq	(%rsp), %rcx
	movq	(%rcx,%rax,8), %rax
	cmpl	%r15d, 32(%rax)
	jne	.LBB28_25	# bb172.i
.LBB28_21:	# cond_true.i4
	movl	8(%rsp), %ecx
	cmpl	%ecx, 36(%rax)
	jne	.LBB28_25	# bb172.i
.LBB28_22:	# cond_true60.i
	movl	24(%rax), %ecx
	movq	16(%rsp), %rdx
	subl	24(%rdx), %ecx
	cvtsi2ss	%ecx, %xmm0
	mulss	%xmm0, %xmm0
	movl	20(%rax), %ecx
	subl	20(%rdx), %ecx
	cvtsi2ss	%ecx, %xmm1
	mulss	%xmm1, %xmm1
	addss	%xmm0, %xmm1
	testq	%rbx, %rbx
	je	.LBB28_24	# cond_true164.i
.LBB28_23:	# cond_false.i7
	movss	12(%rsp), %xmm0
	ucomiss	%xmm1, %xmm0
	jbe	.LBB28_25	# bb172.i
.LBB28_24:	# cond_true164.i
	movss	%xmm1, 12(%rsp)
	movq	%rax, %rbx
.LBB28_25:	# bb172.i
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r12d
	cmpl	%r12d, %r14d
	jg	.LBB28_20	# bb28.i
.LBB28_26:	# bb181.i
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_id_var
	testq	%rbx, %rbx
	je	.LBB28_37	# bb181.i._ZN9regwayobj6getwayEP6regobjRPS1_.exit_crit_edge
.LBB28_27:	# cond_next188.i
	movl	36(%rsp), %eax
	leal	-2(%rax), %ecx
	movslq	%ecx, %rdx
	movq	40(%rsp), %rsi
	movq	%rbx, (%rsi,%rdx,8)
	movq	56(%rsp), %rbx
	movq	(%rbx), %rbx
	movq	%rbx, 40(%rsp)
	movl	32(%rsp), %edx
	movl	%edx, cg_caller_call_site_var
	movl	28(%rsp), %edx
	movl	%edx, cg_caller_id_var
	decl	%eax
	movl	%eax, 36(%rsp)
	testl	%ecx, %ecx
	jg	.LBB28_38	# cond_next188.i.bb.i_crit_edge
.LBB28_28:	# cond_next188.i.bb203.i_crit_edge
	movq	40(%rsp), %rax
.LBB28_29:	# bb203.i
	movq	regway+72, %rcx
	movq	%rcx, (%rax)
.LBB28_30:	# _ZN9regwayobj6getwayEP6regobjRPS1_.exit
	movq	72(%rsp), %rcx
	movl	52(%rsp), %eax
	movl	%eax, (%rcx)
	cmpl	$4294967295, %eax
	je	.LBB28_39	# cond_true38
.LBB28_31:	# UnifiedReturnBlock
	movl	64(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	68(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	$1, %eax
.LBB28_32:	# UnifiedReturnBlock
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB28_33:	# cond_next.bb33.i.i_crit_edge
	xorl	%ecx, %ecx
	jmp	.LBB28_7	# bb33.i.i
.LBB28_34:	# cond_true106.i
	movl	$0, cg_caller_call_site_var
	movl	$123, cg_caller_id_var
	leaq	regway+24, %rsi
	leaq	regway+8, %rdi
	call	_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_
	leaq	regway+32, %rax
	movb	$1, %bl
	jmp	.LBB28_13	# cond_next125.i
.LBB28_35:	# cond_true22
	movq	56(%rsp), %rax
	movq	$0, (%rax)
	movq	72(%rsp), %rax
	movl	$0, (%rax)
	movl	64(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	68(%rsp), %eax
	movl	%eax, cg_caller_id_var
	xorl	%eax, %eax
	jmp	.LBB28_32	# UnifiedReturnBlock
.LBB28_36:	# bb.i.bb181.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB28_26	# bb181.i
.LBB28_37:	# bb181.i._ZN9regwayobj6getwayEP6regobjRPS1_.exit_crit_edge
	movl	$4294967295, 52(%rsp)
	jmp	.LBB28_30	# _ZN9regwayobj6getwayEP6regobjRPS1_.exit
.LBB28_38:	# cond_next188.i.bb.i_crit_edge
	movq	40(%rsp), %rbx
	jmp	.LBB28_18	# bb.i
.LBB28_39:	# cond_true38
	movq	56(%rsp), %rbx
	movq	(%rbx), %rdi
	call	free
	movq	$0, (%rbx)
	movq	72(%rsp), %rcx
	movl	$0, (%rcx)
	movl	64(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	68(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	xorl	%ecx, %ecx
	movl	%ecx, %eax
	jmp	.LBB28_2	# cond_true
	.size	_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri, .-_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri


	.align	16
	.type	_ZN9regwayobj7destroyEv,@function
_ZN9regwayobj7destroyEv:
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$25, cg_caller_id_var
	movl	$25, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movq	8(%rbx), %rdi
	call	free
	movq	24(%rbx), %rdi
	call	free
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	popq	%rbx
	popq	%r14
	popq	%r15
	ret
	.size	_ZN9regwayobj7destroyEv, .-_ZN9regwayobj7destroyEv


	.section	.rodata.cst4,"aM",@progbits,4
	.align	4
.LCPI30_0:					#  float
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
	subq	$72, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rbx
	movq	%rbx, 48(%rsp)
	movq	%rdx, %r14
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 64(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 60(%rsp)
	movl	$26, cg_caller_id_var
	movl	$26, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, 8(%r14)
	cmpl	$0, 8(%rbx)
	jle	.LBB30_16	# return
.LBB30_1:	# bb.preheader
	movl	$0, 44(%rsp)
.LBB30_2:	# bb
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 40(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 36(%rsp)
	movl	$126, cg_caller_id_var
	movl	$126, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	44(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	(%rcx), %rcx
	movl	(%rcx,%rax,8), %edx
	movl	%edx, 32(%rsp)
	movl	%edx, %esi
	incl	%esi
	movq	8(%rsp), %rdi
	movq	8(%rdi), %rdi
	movl	316(%rdi), %r8d
	cmpl	%esi, %r8d
	cmovl	%r8d, %esi
	movl	%esi, 20(%rsp)
	movl	4(%rcx,%rax,8), %eax
	movl	%eax, %ecx
	decl	%ecx
	xorl	%esi, %esi
	testl	%ecx, %ecx
	cmovs	%esi, %ecx
	movl	%ecx, 4(%rsp)
	movl	%edx, %ecx
	decl	%ecx
	testl	%ecx, %ecx
	cmovs	%esi, %ecx
	movl	%ecx, 28(%rsp)
	incl	%eax
	movl	320(%rdi), %ecx
	movl	%ecx, 24(%rsp)
	cmpl	%eax, %ecx
	jge	.LBB30_14	# bb167
.LBB30_3:	# cond_true110
	movl	4(%rsp), %eax
	cmpl	24(%rsp), %eax
	jg	.LBB30_15	# bb176
.LBB30_4:	# bb158.preheader
	movl	28(%rsp), %eax
	cmpl	20(%rsp), %eax
	jg	.LBB30_13	# bb164
.LBB30_5:	# bb120.preheader
	movl	32(%rsp), %ebx
	decl	%ebx
	xorl	%eax, %eax
	testl	%ebx, %ebx
	cmovs	%eax, %ebx
.LBB30_6:	# bb120
	movl	cg_caller_call_site_var, %eax
	movl	%eax, (%rsp)
	movl	cg_caller_id_var, %r15d
	movl	$127, cg_caller_id_var
	movl	$127, %edx
	movl	%r15d, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movl	332(%rax), %ecx
	imull	4(%rsp), %ecx
	addl	%ebx, %ecx
	movslq	%ecx, %rcx
	movq	32(%rax), %rdx
	cmpq	$0, (%rdx,%rcx,8)
	jne	.LBB30_12	# cond_next155
.LBB30_7:	# cond_true150
	movq	40(%rax), %rdx
	movzbq	(%rdx,%rcx), %rcx
	cmpb	$0, 48(%rax,%rcx)
	je	.LBB30_12	# cond_next155
.LBB30_8:	# cond_true.i
	movl	%ebx, %ecx
	movq	8(%rsp), %rdx
	subl	20(%rdx), %ecx
	imull	%ecx, %ecx
	movl	4(%rsp), %esi
	subl	24(%rdx), %esi
	imull	%esi, %esi
	addl	%ecx, %esi
	cvtsi2ss	%esi, %xmm0
	addss	.LCPI30_0(%rip), %xmm0
	cvttss2si	%xmm0, %ecx
	cmpl	308(%rax), %ecx
	jg	.LBB30_12	# cond_next155
.LBB30_9:	# cond_true88.i
	movl	12(%r14), %r12d
	cmpl	%r12d, 8(%r14)
	jne	.LBB30_11	# cond_next152.i
.LBB30_10:	# cond_true107.i
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r14), %rsi
	movl	$0, cg_caller_call_site_var
	movl	$127, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r14), %rdi
	call	free
	movq	%rbp, (%r14)
	movl	%r13d, 12(%r14)
.LBB30_11:	# cond_next152.i
	movslq	8(%r14), %rax
	movq	(%r14), %rcx
	movl	%ebx, (%rcx,%rax,8)
	movl	4(%rsp), %edx
	movl	%edx, 4(%rcx,%rax,8)
	incl	8(%r14)
	movq	8(%rsp), %rax
	movq	8(%rax), %rcx
	movl	332(%rcx), %esi
	imull	%edx, %esi
	addl	%ebx, %esi
	movslq	%esi, %rdx
	movq	32(%rcx), %rcx
	movq	%rax, (%rcx,%rdx,8)
	incl	16(%rax)
.LBB30_12:	# cond_next155
	movl	(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	incl	%ebx
	cmpl	20(%rsp), %ebx
	jle	.LBB30_6	# bb120
.LBB30_13:	# bb164
	incl	4(%rsp)
	movl	24(%rsp), %eax
.LBB30_14:	# bb167
	movl	4(%rsp), %ecx
	cmpl	%eax, %ecx
	jle	.LBB30_17	# bb167.bb158.preheader_crit_edge
.LBB30_15:	# bb176
	movl	44(%rsp), %eax
	incl	%eax
	movl	%eax, 44(%rsp)
	movq	48(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	movl	40(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	36(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jg	.LBB30_2	# bb
.LBB30_16:	# return
	movl	64(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	60(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB30_17:	# bb167.bb158.preheader_crit_edge
	movl	%eax, 24(%rsp)
	jmp	.LBB30_4	# bb158.preheader
	.size	_ZN6regobj10makebound2ER9flexarrayI6pointtES3_, .-_ZN6regobj10makebound2ER9flexarrayI6pointtES3_


	.align	16
	.type	_ZN9regwayobj12isaddtoboundEP6regobjS1_,@function
_ZN9regwayobj12isaddtoboundEP6regobjS1_:
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movq	%rdx, %r14
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$27, cg_caller_id_var
	movl	$27, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	44(%rbx), %ecx
	cmpl	%ecx, 32(%r14)
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	setne	%cl
	movzbl	%cl, %ecx
	movl	%ecx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
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
	subq	$56, %rsp
	movq	%rdi, %rbx
	movq	%rbx, 40(%rsp)
	movq	%rsi, %r14
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 52(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 48(%rsp)
	movl	$28, cg_caller_id_var
	movl	$28, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, 8(%r14)
	cmpl	$0, 8(%rbx)
	jle	.LBB32_12	# return
.LBB32_1:	# bb.preheader
	movl	$0, 36(%rsp)
.LBB32_2:	# bb
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 32(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 28(%rsp)
	movl	$128, cg_caller_id_var
	movl	$128, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	36(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	(%rcx), %rcx
	movq	(%rcx,%rax,8), %rax
	movq	%rax, 16(%rsp)
	cmpl	$0, 48(%rax)
	jle	.LBB32_11	# bb161
.LBB32_3:	# bb20.preheader
	movl	$0, 12(%rsp)
.LBB32_4:	# bb20
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 8(%rsp)
	movl	cg_caller_id_var, %ebx
	movl	$129, cg_caller_id_var
	movl	$129, %edx
	movl	%ebx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	12(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	40(%rcx), %rdx
	movq	(%rdx,%rax,8), %r15
	movq	regway, %rax
	movq	(%rax), %rax
	movl	$0, cg_caller_call_site_var
	movl	$129, cg_caller_id_var
	leaq	regway, %rdi
	movq	%rcx, %rsi
	movq	%r15, %rdx
	call	*%rax
	testb	%al, %al
	je	.LBB32_10	# bb149
.LBB32_5:	# cond_true
	movl	regway+44, %eax
	movl	%eax, 32(%r15)
	movl	regway+40, %eax
	movl	%eax, 36(%r15)
	cmpq	%r15, regway+64
	jne	.LBB32_7	# cond_next
.LBB32_6:	# cond_true69
	movb	$1, regway+56
.LBB32_7:	# cond_next
	movl	12(%r14), %r12d
	cmpl	%r12d, 8(%r14)
	jne	.LBB32_9	# cond_next129
.LBB32_8:	# cond_true83
	leal	(%r12,%r12), %r13d
	# ZERO-EXTEND 
	movl	%r13d, %edi
	shlq	$3, %rdi
	call	malloc
	movq	%rax, %rbp
	movq	(%r14), %rsi
	movl	$1, cg_caller_call_site_var
	movl	$129, cg_caller_id_var
	movslq	%r12d, %rdx
	shlq	$3, %rdx
	movq	%rbp, %rdi
	call	memcpy
	movq	(%r14), %rdi
	call	free
	movq	%rbp, (%r14)
	movl	%r13d, 12(%r14)
.LBB32_9:	# cond_next129
	movslq	8(%r14), %rax
	movq	(%r14), %rcx
	movq	%r15, (%rcx,%rax,8)
	incl	8(%r14)
.LBB32_10:	# bb149
	movl	12(%rsp), %eax
	incl	%eax
	movl	%eax, 12(%rsp)
	movq	16(%rsp), %rcx
	cmpl	%eax, 48(%rcx)
	movl	8(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	%ebx, cg_caller_id_var
	jg	.LBB32_4	# bb20
.LBB32_11:	# bb161
	movl	36(%rsp), %eax
	incl	%eax
	movl	%eax, 36(%rsp)
	movq	40(%rsp), %rcx
	cmpl	%eax, 8(%rcx)
	movl	32(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	28(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jg	.LBB32_2	# bb
.LBB32_12:	# return
	movl	52(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	48(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$56, %rsp
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
	subq	$72, %rsp
	movq	%rdi, 56(%rsp)
	movl	%esi, %ebx
	movl	%ebx, 52(%rsp)
	movq	%rdx, 24(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 64(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 68(%rsp)
	movl	$29, cg_caller_id_var
	movl	$29, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	testl	%ebx, %ebx
	movq	way.17, %rbx
	movl	way.8, %eax
	movl	%eax, 32(%rsp)
	jle	.LBB33_29	# entry.UnifiedReturnBlock_crit_edge
.LBB33_1:	# bb.preheader
	movl	way.20, %r14d
	movl	%r14d, 48(%rsp)
	decl	%r14d
	movl	%r14d, 44(%rsp)
	movl	32(%rsp), %r14d
	movl	%r14d, %eax
	incl	%eax
	movl	%eax, 40(%rsp)
	decl	%r14d
	movl	%r14d, 36(%rsp)
	movq	way.16, %rax
	movq	%rax, 8(%rsp)
	movl	way.23, %r14d
	movl	%r14d, 4(%rsp)
	movw	way.24, %r15w
	movw	way.25, %r12w
	xorl	%r14d, %r14d
	movl	%r14d, 20(%rsp)
.LBB33_2:	# bb
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$130, cg_caller_id_var
	movl	$130, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	20(%rsp), %rax
	movq	56(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, %ecx
	subl	32(%rsp), %ecx
	movl	%ecx, %edx
	decl	%edx
	movslq	%edx, %rsi
	cmpw	%r12w, (%rbx,%rsi,4)
	je	.LBB33_5	# cond_next74
.LBB33_3:	# cond_true
	movq	8(%rsp), %rdi
	cmpw	$0, (%rdi,%rsi,2)
	jne	.LBB33_5	# cond_next74
.LBB33_4:	# cond_true37
	movslq	%r14d, %rdi
	movq	24(%rsp), %r8
	movl	%edx, (%r8,%rdi,4)
	movw	%r12w, (%rbx,%rsi,4)
	movw	%r15w, 2(%rbx,%rsi,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %esi
	cmpl	%edx, %esi
	je	.LBB33_31	# cond_true68
.LBB33_5:	# cond_next74
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_8	# cond_next139
.LBB33_6:	# cond_true90
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_8	# cond_next139
.LBB33_7:	# cond_true101
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_8:	# cond_next139
	incl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_11	# cond_next205
.LBB33_9:	# cond_true156
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_11	# cond_next205
.LBB33_10:	# cond_true167
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_11:	# cond_next205
	movl	%eax, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_14	# cond_next269
.LBB33_12:	# cond_true220
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_14	# cond_next269
.LBB33_13:	# cond_true231
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_14:	# cond_next269
	movl	%eax, %ecx
	incl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_17	# cond_next333
.LBB33_15:	# cond_true284
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_17	# cond_next333
.LBB33_16:	# cond_true295
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_17:	# cond_next333
	movl	36(%rsp), %ecx
	leal	(%rcx,%rax), %ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_20	# cond_next399
.LBB33_18:	# cond_true350
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_20	# cond_next399
.LBB33_19:	# cond_true361
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_20:	# cond_next399
	movl	32(%rsp), %ecx
	leal	(%rax,%rcx), %ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB33_23	# cond_next464
.LBB33_21:	# cond_true415
	movq	8(%rsp), %rsi
	cmpw	$0, (%rsi,%rdx,2)
	jne	.LBB33_23	# cond_next464
.LBB33_22:	# cond_true426
	movslq	%r14d, %rsi
	movq	24(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %edx
	cmpl	%ecx, %edx
	je	.LBB33_31	# cond_true68
.LBB33_23:	# cond_next464
	addl	40(%rsp), %eax
	movslq	%eax, %rcx
	cmpw	%r12w, (%rbx,%rcx,4)
	je	.LBB33_32	# cond_next530
.LBB33_24:	# cond_true481
	movq	8(%rsp), %rdx
	cmpw	$0, (%rdx,%rcx,2)
	jne	.LBB33_32	# cond_next530
.LBB33_25:	# cond_true492
	movslq	%r14d, %rdx
	movq	24(%rsp), %rsi
	movl	%eax, (%rsi,%rdx,4)
	movw	%r12w, (%rbx,%rcx,4)
	movw	%r15w, 2(%rbx,%rcx,4)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	incl	%r14d
	movl	4(%rsp), %ecx
	cmpl	%eax, %ecx
	jne	.LBB33_32	# cond_next530
.LBB33_26:	# cond_true523
	movb	$1, way.22.b
	movl	64(%rsp), %r13d
	movl	%r13d, cg_caller_call_site_var
	movl	68(%rsp), %r13d
	movl	%r13d, cg_caller_id_var
.LBB33_27:	# cond_true523
	movl	%r14d, %eax
.LBB33_28:	# cond_true523
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB33_29:	# entry.UnifiedReturnBlock_crit_edge
	xorl	%r14d, %r14d
.LBB33_30:	# UnifiedReturnBlock
	movl	%r14d, %eax
	movl	64(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	68(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	jmp	.LBB33_28	# cond_true523
.LBB33_31:	# cond_true68
	movb	$1, way.22.b
	movl	64(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	68(%rsp), %eax
	movl	%eax, cg_caller_id_var
	jmp	.LBB33_27	# cond_true523
.LBB33_32:	# cond_next530
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	movl	48(%rsp), %eax
	cmpl	%r14d, %eax
	cmovle	44(%rsp), %r14d
	movl	20(%rsp), %eax
	incl	%eax
	movl	%eax, 20(%rsp)
	cmpl	52(%rsp), %eax
	jl	.LBB33_2	# bb
	jmp	.LBB33_30	# UnifiedReturnBlock
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
	subq	$72, %rsp
	movq	%rdi, 56(%rsp)
	movl	%esi, %ebx
	movl	%ebx, 52(%rsp)
	movq	%rdx, 16(%rsp)
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 64(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 68(%rsp)
	movl	$30, cg_caller_id_var
	movl	$30, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	testl	%ebx, %ebx
	movq	way.17, %rbx
	movl	way.8, %eax
	movl	%eax, 32(%rsp)
	jle	.LBB34_27	# entry.UnifiedReturnBlock_crit_edge
.LBB34_1:	# bb.preheader
	movl	way.20, %r14d
	movl	%r14d, 36(%rsp)
	decl	%r14d
	movl	%r14d, 48(%rsp)
	movl	32(%rsp), %r14d
	movl	%r14d, %eax
	incl	%eax
	movl	%eax, 44(%rsp)
	decl	%r14d
	movl	%r14d, 40(%rsp)
	movq	way.16, %rax
	movq	%rax, 8(%rsp)
	movw	way.24, %r15w
	movw	way.25, %r12w
	xorl	%r14d, %r14d
	movl	%r14d, 28(%rsp)
.LBB34_2:	# bb
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$131, cg_caller_id_var
	movl	$131, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movslq	28(%rsp), %rax
	movq	56(%rsp), %rcx
	movl	(%rcx,%rax,4), %eax
	movl	%eax, %ecx
	subl	32(%rsp), %ecx
	movl	%ecx, %edx
	decl	%edx
	movslq	%edx, %rsi
	cmpw	%r12w, (%rbx,%rsi,4)
	je	.LBB34_29	# cond_next80
.LBB34_3:	# cond_true
	movq	8(%rsp), %rdi
	movw	(%rdi,%rsi,2), %di
	testw	%di, %di
	jg	.LBB34_28	# cond_true37
.LBB34_4:	# cond_false
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%di, %di
	jne	.LBB34_29	# cond_next80
.LBB34_5:	# cond_true71
	movb	$1, way.22.b
	movl	%edx, way.23
.LBB34_6:	# cond_true71
	movl	64(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	68(%rsp), %eax
	movl	%eax, cg_caller_id_var
.LBB34_7:	# cond_true71
	movl	%r14d, %eax
.LBB34_8:	# cond_true71
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB34_9:	# cond_false132
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	je	.LBB34_13	# cond_true143
.LBB34_10:	# cond_next153
	incl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_33	# cond_next226
.LBB34_11:	# cond_true170
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jg	.LBB34_32	# cond_true181
.LBB34_12:	# cond_false205
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	jne	.LBB34_33	# cond_next226
.LBB34_13:	# cond_true143
	movb	$1, way.22.b
	movl	%ecx, way.23
	jmp	.LBB34_6	# cond_true71
.LBB34_14:	# cond_false276
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	je	.LBB34_13	# cond_true143
.LBB34_15:	# cond_next297
	movl	%eax, %ecx
	incl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_37	# cond_next368
.LBB34_16:	# cond_true312
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jg	.LBB34_36	# cond_true323
.LBB34_17:	# cond_false347
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	je	.LBB34_13	# cond_true143
	jmp	.LBB34_37	# cond_next368
.LBB34_18:	# cond_false420
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	je	.LBB34_13	# cond_true143
.LBB34_19:	# cond_next441
	movl	32(%rsp), %ecx
	leal	(%rax,%rcx), %ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_41	# cond_next513
.LBB34_20:	# cond_true457
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jg	.LBB34_40	# cond_true468
.LBB34_21:	# cond_false492
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%si, %si
	je	.LBB34_13	# cond_true143
	jmp	.LBB34_41	# cond_next513
.LBB34_22:	# cond_false565
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	testw	%dx, %dx
	je	.LBB34_44	# cond_true576
.LBB34_23:	# cond_next586
	movl	36(%rsp), %eax
	cmpl	%r14d, %eax
	jg	.LBB34_25	# bb602
.LBB34_24:	# cond_true594
	movl	48(%rsp), %r14d
.LBB34_25:	# bb602
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	movl	28(%rsp), %eax
	incl	%eax
	movl	%eax, 28(%rsp)
	cmpl	52(%rsp), %eax
	jl	.LBB34_2	# bb
.LBB34_26:	# UnifiedReturnBlock
	movl	%r14d, %eax
	movl	64(%rsp), %ecx
	movl	%ecx, cg_caller_call_site_var
	movl	68(%rsp), %ecx
	movl	%ecx, cg_caller_id_var
	jmp	.LBB34_8	# cond_true71
.LBB34_27:	# entry.UnifiedReturnBlock_crit_edge
	xorl	%r14d, %r14d
	jmp	.LBB34_26	# UnifiedReturnBlock
.LBB34_28:	# cond_true37
	movslq	%r14d, %rdi
	movq	16(%rsp), %r8
	movl	%edx, (%r8,%rdi,4)
	movw	%r12w, (%rbx,%rsi,4)
	movw	%r15w, 2(%rbx,%rsi,4)
	incl	%r14d
.LBB34_29:	# cond_next80
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_10	# cond_next153
.LBB34_30:	# cond_true97
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jle	.LBB34_9	# cond_false132
.LBB34_31:	# cond_true108
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
	jmp	.LBB34_10	# cond_next153
.LBB34_32:	# cond_true181
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
.LBB34_33:	# cond_next226
	movl	%eax, %ecx
	decl	%ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_15	# cond_next297
.LBB34_34:	# cond_true241
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jle	.LBB34_14	# cond_false276
.LBB34_35:	# cond_true252
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
	jmp	.LBB34_15	# cond_next297
.LBB34_36:	# cond_true323
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
.LBB34_37:	# cond_next368
	movl	40(%rsp), %ecx
	leal	(%rcx,%rax), %ecx
	movslq	%ecx, %rdx
	cmpw	%r12w, (%rbx,%rdx,4)
	je	.LBB34_19	# cond_next441
.LBB34_38:	# cond_true385
	movq	8(%rsp), %rsi
	movw	(%rsi,%rdx,2), %si
	testw	%si, %si
	jle	.LBB34_18	# cond_false420
.LBB34_39:	# cond_true396
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
	jmp	.LBB34_19	# cond_next441
.LBB34_40:	# cond_true468
	movslq	%r14d, %rsi
	movq	16(%rsp), %rdi
	movl	%ecx, (%rdi,%rsi,4)
	movw	%r12w, (%rbx,%rdx,4)
	movw	%r15w, 2(%rbx,%rdx,4)
	incl	%r14d
.LBB34_41:	# cond_next513
	addl	44(%rsp), %eax
	movslq	%eax, %rcx
	cmpw	%r12w, (%rbx,%rcx,4)
	je	.LBB34_23	# cond_next586
.LBB34_42:	# cond_true530
	movq	8(%rsp), %rdx
	movw	(%rdx,%rcx,2), %dx
	testw	%dx, %dx
	jle	.LBB34_22	# cond_false565
.LBB34_43:	# cond_true541
	movslq	%r14d, %rdx
	movq	16(%rsp), %rsi
	movl	%eax, (%rsi,%rdx,4)
	movw	%r12w, (%rbx,%rcx,4)
	movw	%r15w, 2(%rbx,%rcx,4)
	incl	%r14d
	jmp	.LBB34_23	# cond_next586
.LBB34_44:	# cond_true576
	movb	$1, way.22.b
	movl	%eax, way.23
	movl	64(%rsp), %r13d
	movl	%r13d, cg_caller_call_site_var
	movl	68(%rsp), %r13d
	movl	%r13d, cg_caller_id_var
	jmp	.LBB34_7	# cond_true71
	.size	_ZN6wayobj18makeobstaclebound2EPiiS0_, .-_ZN6wayobj18makeobstaclebound2EPiiS0_
	.type	gCSEdgeTableSize,@object
	.bss
	.local	gCSEdgeTableSize
	.comm	gCSEdgeTableSize,4,4		# gCSEdgeTableSize
	.type	gCSEdgeKeyOffset.b,@object
	.local	gCSEdgeKeyOffset.b
	.comm	gCSEdgeKeyOffset.b,1,1		# gCSEdgeKeyOffset.b
	.type	gCSEdgeValidOffset.b,@object
	.local	gCSEdgeValidOffset.b
	.comm	gCSEdgeValidOffset.b,1,1		# gCSEdgeValidOffset.b
	.type	.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str:				# .str
	.size	.str, 57
	.asciz	"0 && \"Same call site calls too many different functions\""
	.type	.str1,@object
.str1:				# .str1
	.size	.str1, 11
	.asciz	"callsite.c"
	.type	__PRETTY_FUNCTION__.2597,@object
	.align	16
__PRETTY_FUNCTION__.2597:				# __PRETTY_FUNCTION__.2597
	.size	__PRETTY_FUNCTION__.2597, 17
	.asciz	"CallEdgeProfiler"
	.type	gCSEdgeTable,@object
	.bss
	.local	gCSEdgeTable
	.comm	gCSEdgeTable,8,8		# gCSEdgeTable
	.type	.str2,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str2:				# .str2
	.size	.str2, 20
	.asciz	"call_profile_by.log"
	.type	.str3,@object
.str3:				# .str3
	.size	.str3, 2
	.asciz	"w"
	.type	.str4,@object
.str4:				# .str4
	.size	.str4, 6
	.asciz	"%u %u"
	.type	.str5,@object
.str5:				# .str5
	.size	.str5, 7
	.asciz	" %u %u"
	.type	gNumConflicts,@object
	.bss
	.local	gNumConflicts
	.comm	gNumConflicts,8,8		# gNumConflicts
	.type	gNumHashFind,@object
	.local	gNumHashFind
	.comm	gNumHashFind,8,8		# gNumHashFind
	.type	.str6,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str6:				# .str6
	.size	.str6, 23
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
	.type	.str17,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
	.align	16
.str17:				# .str17
	.size	.str17, 33
	.asciz	"Create regional map time : %.0f\n"
	.type	.str12,@object
	.align	16
.str12:				# .str12
	.size	.str12, 25
	.asciz	"Create ways time : %.0f\n"
	.type	.str28,@object
	.align	16
.str28:				# .str28
	.size	.str28, 22
	.asciz	"Ways quantity : %lld\n"
	.type	.str39,@object
	.align	16
.str39:				# .str39
	.size	.str39, 25
	.asciz	"Total way length : %lld\n"
	.type	.str410,@object
	.align	16
.str410:				# .str410
	.size	.str410, 29
	.asciz	"Create reg ways time : %.0f\n"
	.type	.str511,@object
	.align	16
.str511:				# .str511
	.size	.str511, 26
	.asciz	"Reg ways quantity : %lld\n"
	.type	.str612,@object
	.align	16
.str612:				# .str612
	.size	.str612, 29
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
	.type	.str1713,@object
	.align	16
.str1713:				# .str1713
	.size	.str1713, 31
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
	.type	cg_caller_id_var,@object
	.data
	.align	4
cg_caller_id_var:				# cg_caller_id_var
	.size	cg_caller_id_var, 4
	.long	1
	.type	cg_caller_call_site_var,@object
	.bss
	.local	cg_caller_call_site_var
	.comm	cg_caller_call_site_var,4,4		# cg_caller_call_site_var

