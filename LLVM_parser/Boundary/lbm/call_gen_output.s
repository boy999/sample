

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
	.type	LBM_initializeGrid,@function
LBM_initializeGrid:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$8, %rsp
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r15d
	movl	$1, cg_caller_id_var
	movl	$1, %edx
	movl	%r15d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	xorl	%r12d, %r12d
.LBB5_1:	# bb
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$8, cg_caller_id_var
	movl	$8, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	leal	-400000(%r12), %eax
	movslq	%eax, %rax
	movabsq	$4599676419421066581, %rcx
	movq	%rcx, (%rbx,%rax,8)
	leal	-399999(%r12), %eax
	movslq	%eax, %rax
	movabsq	$4588167220373341980, %rcx
	movq	%rcx, (%rbx,%rax,8)
	leal	-399998(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399997(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399996(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399995(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399994(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399993(%r12), %eax
	movslq	%eax, %rax
	movabsq	$4583663620745971484, %rcx
	movq	%rcx, (%rbx,%rax,8)
	leal	-399992(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399991(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399990(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399989(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399988(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399987(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399986(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399985(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399984(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399983(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399982(%r12), %eax
	movslq	%eax, %rax
	movq	%rcx, (%rbx,%rax,8)
	leal	-399981(%r12), %eax
	movslq	%eax, %rax
	movl	$0, (%rbx,%rax,8)
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	addl	$20, %r12d
	cmpl	$26800000, %r12d
	jne	.LBB5_1	# bb
.LBB5_2:	# return
	movl	%r14d, cg_caller_call_site_var
	movl	%r15d, cg_caller_id_var
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
	subq	$56, %rsp
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rbx
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 52(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 48(%rsp)
	movl	$2, cg_caller_id_var
	movl	$2, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, cg_caller_call_site_var
	movl	$2, cg_caller_id_var
	leaq	.str17, %rsi
	movq	%rbx, %rdi
	call	fopen
	movl	$0, 44(%rsp)
	movq	%rax, %rbx
.LBB6_1:	# bb38.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 40(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 36(%rsp)
	movl	$9, cg_caller_id_var
	movl	$9, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	44(%rsp), %eax
	leal	19(%rax), %eax
	movl	%eax, 32(%rsp)
	movl	$0, 28(%rsp)
.LBB6_2:	# bb28.preheader.us
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 24(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 20(%rsp)
	movl	$10, cg_caller_id_var
	movl	$10, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, cg_caller_call_site_var
	movl	$10, cg_caller_id_var
	movq	%rbx, %rdi
	call	fgetc
	movl	32(%rsp), %ecx
	movl	28(%rsp), %edx
	leal	(%rcx,%rdx), %r14d
	xorl	%r15d, %r15d
	jmp	.LBB6_7	# bb4.us
.LBB6_3:	# bb33.us
	movl	24(%rsp), %r14d
	movl	%r14d, cg_caller_call_site_var
	movl	20(%rsp), %r14d
	movl	%r14d, cg_caller_id_var
	movl	28(%rsp), %r14d
	addl	$2000, %r14d
	movl	%r14d, 28(%rsp)
	cmpl	$200000, %r14d
	jne	.LBB6_2	# bb28.preheader.us
.LBB6_4:	# bb43
	movl	$0, cg_caller_call_site_var
	movl	$9, cg_caller_id_var
	movq	%rbx, %rdi
	call	fgetc
	movl	40(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	36(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	44(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 44(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB6_1	# bb38.outer
.LBB6_5:	# bb53
	movl	$4, cg_caller_call_site_var
	movl	$2, cg_caller_id_var
	movq	%rbx, %rdi
	call	fclose
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
.LBB6_6:	# cond_next.us
	movl	$0, cg_caller_call_site_var
	movl	$11, cg_caller_id_var
	movq	%rbx, %rdi
	call	fgetc
	movl	%r13d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	addl	$20, %r15d
	cmpl	$2000, %r15d
	je	.LBB6_3	# bb33.us
.LBB6_7:	# bb4.us
	movl	%eax, %ebp
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %r12d
	movl	$11, cg_caller_id_var
	movl	$11, %edx
	movl	%r12d, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	cmpl	$46, %ebp
	je	.LBB6_6	# cond_next.us
.LBB6_8:	# cond_true.us
	leal	(%r14,%r15), %eax
	movslq	%eax, %rax
	movq	8(%rsp), %rcx
	orl	$1, (%rcx,%rax,8)
	jmp	.LBB6_6	# cond_next.us
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
	subq	$56, %rsp
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 52(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 48(%rsp)
	movl	$3, cg_caller_id_var
	movl	$3, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	xorl	%eax, %eax
	movl	%eax, 24(%rsp)
	movl	%eax, %r14d
.LBB7_1:	# bb124.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 44(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 40(%rsp)
	movl	$12, cg_caller_id_var
	movl	$12, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	24(%rsp), %eax
	leal	-20000(%rax), %eax
	movl	%eax, 36(%rsp)
	xorl	%eax, %eax
	movl	%eax, 20(%rsp)
	movl	%eax, 12(%rsp)
.LBB7_2:	# bb116.preheader
	movl	cg_caller_call_site_var, %r15d
	movl	%r15d, 28(%rsp)
	movl	cg_caller_id_var, %eax
	movl	%eax, 32(%rsp)
	movl	$13, cg_caller_id_var
	movl	$13, %edx
	movl	%eax, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	36(%rsp), %r15d
	movl	20(%rsp), %eax
	leal	(%r15,%rax), %r15d
	movl	%r15d, 16(%rsp)
	movl	12(%rsp), %r15d
	leal	-2(%r15), %r15d
	movl	%r15d, 8(%rsp)
	xorl	%r15d, %r15d
	jmp	.LBB7_12	# bb116
.LBB7_3:	# bb2
	movl	$15, cg_caller_id_var
	movl	$15, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	testl	%r15d, %r15d
	je	.LBB7_18	# bb36
.LBB7_4:	# bb2
	cmpl	$99, %r15d
	je	.LBB7_18	# bb36
.LBB7_5:	# cond_next
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	cmpl	$129, %r14d
	jg	.LBB7_16	# cond_next
.LBB7_6:	# cond_next
	cmpl	$2, %r14d
	je	.LBB7_18	# bb36
.LBB7_7:	# cond_next
	cmpl	$3, %r14d
	jne	.LBB7_11	# bb113
.LBB7_8:	# cond_true66
	leal	-2(%r15), %r12d
	cmpl	$95, %r12d
	ja	.LBB7_11	# bb113
.LBB7_9:	# cond_true66
	cmpl	$95, 8(%rsp)
	ja	.LBB7_11	# bb113
.LBB7_10:	# cond_true91
	movl	16(%rsp), %r12d
	leal	(%r12,%r15), %r12d
	imull	$20, %r12d, %r12d
	addl	$19, %r12d
	movslq	%r12d, %rax
	orl	$2, (%rbx,%rax,8)
.LBB7_11:	# bb113
	incl	%r15d
.LBB7_12:	# bb116
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$14, cg_caller_id_var
	movl	$14, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	cmpl	$99, %r15d
	jg	.LBB7_23	# bb121
.LBB7_13:	# bb2.preheader
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	cmpl	$0, 12(%rsp)
	je	.LBB7_19	# bb2.us.loopexit
.LBB7_14:	# bb2.preheader
	cmpl	$99, 12(%rsp)
	je	.LBB7_21	# bb2.us167.loopexit
.LBB7_15:	# bb2.preheader1
	movl	24(%rsp), %ebp
	movl	20(%rsp), %eax
	leal	(%rbp,%rax), %ebp
	addl	%r15d, %ebp
	imull	$20, %ebp, %ebp
	addl	$4294567315, %ebp
	jmp	.LBB7_3	# bb2
.LBB7_16:	# cond_next
	cmpl	$130, %r14d
	je	.LBB7_8	# cond_true66
.LBB7_17:	# cond_next
	cmpl	$131, %r14d
	jne	.LBB7_11	# bb113
.LBB7_18:	# bb36
	movslq	%ebp, %rax
	orl	$1, (%rbx,%rax,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	addl	$20, %ebp
	incl	%r15d
	cmpl	$99, %r15d
	jle	.LBB7_3	# bb2
	jmp	.LBB7_23	# bb121
.LBB7_19:	# bb2.us.loopexit
	movl	36(%rsp), %ecx
	movl	20(%rsp), %eax
	leal	(%rcx,%rax), %eax
	addl	%r15d, %eax
	imull	$20, %eax, %eax
	addl	$19, %eax
	movl	%eax, 4(%rsp)
	imull	$20, %r15d, %r15d
	xorl	%ebp, %ebp
.LBB7_20:	# bb2.us
	movl	$16, cg_caller_id_var
	movl	$16, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	4(%rsp), %eax
	leal	(%rax,%rbp), %eax
	movslq	%eax, %rax
	orl	$1, (%rbx,%rax,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	leal	20(%r15,%rbp), %eax
	addl	$20, %ebp
	cmpl	$2000, %eax
	jl	.LBB7_20	# bb2.us
	jmp	.LBB7_23	# bb121
.LBB7_21:	# bb2.us167.loopexit
	movl	36(%rsp), %eax
	movl	20(%rsp), %ecx
	leal	(%rax,%rcx), %eax
	addl	%r15d, %eax
	imull	$20, %eax, %eax
	addl	$19, %eax
	movl	%eax, (%rsp)
	imull	$20, %r15d, %r15d
	xorl	%ebp, %ebp
.LBB7_22:	# bb2.us167
	movl	$17, cg_caller_id_var
	movl	$17, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	(%rsp), %eax
	leal	(%rax,%rbp), %eax
	movslq	%eax, %rax
	orl	$1, (%rbx,%rax,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	leal	20(%r15,%rbp), %eax
	addl	$20, %ebp
	cmpl	$2000, %eax
	jl	.LBB7_22	# bb2.us167
.LBB7_23:	# bb121
	movl	28(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	32(%rsp), %r15d
	movl	%r15d, cg_caller_id_var
	addl	$100, 20(%rsp)
	movl	12(%rsp), %r15d
	incl	%r15d
	movl	%r15d, 12(%rsp)
	cmpl	$100, %r15d
	jne	.LBB7_2	# bb116.preheader
.LBB7_24:	# bb129
	movl	44(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	40(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addl	$10000, 24(%rsp)
	incl	%r14d
	cmpl	$134, %r14d
	jne	.LBB7_1	# bb124.outer
.LBB7_25:	# return.split
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
	.size	LBM_initializeSpecialCellsForLDC, .-LBM_initializeSpecialCellsForLDC


	.align	16
	.type	LBM_initializeSpecialCellsForChannel,@function
LBM_initializeSpecialCellsForChannel:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 36(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 32(%rsp)
	movl	$4, cg_caller_id_var
	movl	$4, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	$0, 28(%rsp)
.LBB8_1:	# bb104.outer
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 24(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 20(%rsp)
	movl	$18, cg_caller_id_var
	movl	$18, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	28(%rsp), %eax
	leal	-399981(%rax), %eax
	movl	%eax, 16(%rsp)
	xorl	%r14d, %r14d
.LBB8_2:	# bb96.preheader
	movl	cg_caller_call_site_var, %r15d
	movl	%r15d, 8(%rsp)
	movl	cg_caller_id_var, %r12d
	movl	%r12d, 12(%rsp)
	movl	$19, cg_caller_id_var
	movl	$19, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	imull	$2000, %r14d, %r15d
	addl	16(%rsp), %r15d
	xorl	%r12d, %r12d
.LBB8_3:	# bb2
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$20, cg_caller_id_var
	movl	$20, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	testl	%r12d, %r12d
	je	.LBB8_7	# bb23
.LBB8_4:	# bb2
	cmpl	$99, %r12d
	je	.LBB8_7	# bb23
.LBB8_5:	# cond_next
	testl	%r14d, %r14d
	je	.LBB8_7	# bb23
.LBB8_6:	# cond_next
	cmpl	$99, %r14d
	jne	.LBB8_8	# bb93
.LBB8_7:	# bb23
	movslq	%r15d, %rax
	orl	$1, (%rbx,%rax,8)
.LBB8_8:	# bb93
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	addl	$20, %r15d
	incl	%r12d
	cmpl	$100, %r12d
	jne	.LBB8_3	# bb2
.LBB8_9:	# bb101
	movl	8(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	12(%rsp), %r15d
	movl	%r15d, cg_caller_id_var
	incl	%r14d
	cmpl	$100, %r14d
	jne	.LBB8_2	# bb96.preheader
.LBB8_10:	# bb109
	movl	24(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	20(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	28(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 28(%rsp)
	cmpl	$26800000, %eax
	jne	.LBB8_1	# bb104.outer
.LBB8_11:	# return.split
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
	.size	LBM_initializeSpecialCellsForChannel, .-LBM_initializeSpecialCellsForChannel


	.section	.rodata.cst4,"aM",@progbits,4
	.align	16
.LCPI9_2:					#  float
	.long	1069547520	# float 1.5
.LCPI9_3:					#  float
	.long	1065353216	# float 1
	.zero	16
.LCPI9_6:					#  float
	.long	1083179008	# float 4.5
.LCPI9_7:					#  float
	.long	1077936128	# float 3
	.section	.rodata.cst8,"aM",@progbits,8
	.align	16
.LCPI9_0:					#  double
	.quad	4566758108544739836	# double value: 0.002
.LCPI9_1:					#  double
	.quad	4572414629676717179	# double value: 0.005
	.zero	8
.LCPI9_4:					#  double
	.quad	4604029899060858060	# double value: 0.65
.LCPI9_5:					#  double
	.quad	13830104095692056166	# double value: -0.95
	.zero	8
.LCPI9_8:					#  double
	.quad	4592470660017273787	# double value: 0.108333
.LCPI9_9:					#  double
	.quad	4587967060389903291	# double value: 0.0541667
	.section	.rodata.cst16,"aM",@progbits,16
	.align	16
.LCPI9_10:					#  <2 x double>
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
	subq	$120, %rsp
	movq	%rdi, %rbx
	movq	%rsi, %r14
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 116(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 112(%rsp)
	movl	$5, cg_caller_id_var
	movl	$5, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	xorl	%r15d, %r15d
.LBB9_1:	# bb
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 104(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 108(%rsp)
	movl	$21, cg_caller_id_var
	movl	$21, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movslq	%r15d, %rax
	addl	$19, %r15d
	movslq	%r15d, %rcx
	movl	(%rbx,%rcx,8), %r15d
	testl	$1, %r15d
	movsd	(%rbx,%rax,8), %xmm0
	movsd	%xmm0, 32(%rsp)
	je	.LBB9_5	# cond_next
.LBB9_2:	# cond_true
	movsd	32(%rsp), %xmm0
	movsd	%xmm0, (%r14,%rax,8)
	movl	%eax, %r15d
	incl	%r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-1998(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	2(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	2001(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	3(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-16(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	4(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	23(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	5(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-199994(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	6(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	200005(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	7(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-2010(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	8(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-1971(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	9(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	1988(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	10(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	2027(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	11(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-201986(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	12(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	198013(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	13(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-197988(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	14(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	202011(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	15(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-200002(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	16(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	199997(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	17(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	-199964(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
	leal	18(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	leal	200035(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm0, (%r14,%rcx,8)
.LBB9_3:	# cond_true
	movl	104(%rsp), %r15d
	movl	%r15d, cg_caller_call_site_var
	movl	108(%rsp), %r15d
	movl	%r15d, cg_caller_id_var
	movl	%eax, %r15d
	addl	$20, %r15d
	cmpl	$25999999, %r15d
	jle	.LBB9_1	# bb
.LBB9_4:	# return
	movl	116(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	112(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB9_5:	# cond_next
	leal	2(%rax), %ecx
	movslq	%ecx, %rcx
	movsd	(%rbx,%rcx,8), %xmm0
	movsd	%xmm0, 16(%rsp)
	movl	%eax, %edx
	incl	%edx
	movslq	%edx, %rdx
	movsd	(%rbx,%rdx,8), %xmm0
	movsd	32(%rsp), %xmm1
	addsd	%xmm0, %xmm1
	addsd	16(%rsp), %xmm1
	leal	3(%rax), %esi
	movslq	%esi, %rsi
	movsd	(%rbx,%rsi,8), %xmm2
	addsd	%xmm2, %xmm1
	leal	4(%rax), %edi
	movslq	%edi, %rdi
	movsd	(%rbx,%rdi,8), %xmm3
	movsd	%xmm3, 48(%rsp)
	addsd	%xmm3, %xmm1
	leal	5(%rax), %r8d
	movslq	%r8d, %r8
	movsd	(%rbx,%r8,8), %xmm3
	addsd	%xmm3, %xmm1
	leal	6(%rax), %r9d
	movslq	%r9d, %r9
	movsd	(%rbx,%r9,8), %xmm4
	movsd	%xmm4, 64(%rsp)
	addsd	%xmm4, %xmm1
	leal	7(%rax), %r10d
	movslq	%r10d, %r10
	movsd	(%rbx,%r10,8), %xmm4
	addsd	%xmm4, %xmm1
	leal	8(%rax), %r11d
	movslq	%r11d, %r11
	movsd	(%rbx,%r11,8), %xmm5
	addsd	%xmm5, %xmm1
	leal	9(%rax), %r12d
	movslq	%r12d, %r12
	movsd	(%rbx,%r12,8), %xmm6
	addsd	%xmm6, %xmm1
	leal	10(%rax), %r13d
	movslq	%r13d, %r13
	movsd	(%rbx,%r13,8), %xmm7
	addsd	%xmm7, %xmm1
	leal	11(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 96(%rsp)
	movsd	(%rbx,%rbp,8), %xmm8
	movsd	%xmm8, 8(%rsp)
	addsd	%xmm8, %xmm1
	leal	12(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 88(%rsp)
	movsd	(%rbx,%rbp,8), %xmm9
	addsd	%xmm9, %xmm1
	leal	13(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 80(%rsp)
	movsd	(%rbx,%rbp,8), %xmm10
	addsd	%xmm10, %xmm1
	leal	14(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 72(%rsp)
	movsd	(%rbx,%rbp,8), %xmm11
	addsd	%xmm11, %xmm1
	leal	15(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 56(%rsp)
	movsd	(%rbx,%rbp,8), %xmm12
	addsd	%xmm12, %xmm1
	leal	16(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 40(%rsp)
	movsd	(%rbx,%rbp,8), %xmm13
	addsd	%xmm13, %xmm1
	leal	17(%rax), %ebp
	movslq	%ebp, %rbp
	movq	%rbp, 24(%rsp)
	movsd	(%rbx,%rbp,8), %xmm14
	addsd	%xmm14, %xmm1
	leal	18(%rax), %ebp
	movslq	%ebp, %rbp
	movsd	(%rbx,%rbp,8), %xmm15
	addsd	%xmm15, %xmm1
	subsd	16(%rsp), %xmm0
	addsd	%xmm4, %xmm0
	addsd	%xmm5, %xmm0
	subsd	%xmm6, %xmm0
	subsd	%xmm7, %xmm0
	addsd	%xmm8, %xmm0
	addsd	%xmm9, %xmm0
	subsd	%xmm10, %xmm0
	subsd	%xmm11, %xmm0
	divsd	%xmm1, %xmm0
	testl	$2, %r15d
	movsd	.LCPI9_0(%rip), %xmm8
	je	.LBB9_7	# cond_next
.LBB9_6:	# cond_next
	movapd	%xmm8, %xmm0
.LBB9_7:	# cond_next
	movapd	%xmm0, %xmm8
	mulsd	%xmm8, %xmm8
	subsd	48(%rsp), %xmm2
	addsd	%xmm4, %xmm2
	subsd	%xmm5, %xmm2
	addsd	%xmm6, %xmm2
	subsd	%xmm7, %xmm2
	addsd	%xmm12, %xmm2
	addsd	%xmm13, %xmm2
	subsd	%xmm14, %xmm2
	subsd	%xmm15, %xmm2
	divsd	%xmm1, %xmm2
	movsd	.LCPI9_1(%rip), %xmm4
	je	.LBB9_9	# cond_next
.LBB9_8:	# cond_next
	movapd	%xmm4, %xmm2
.LBB9_9:	# cond_next
	movapd	%xmm2, %xmm4
	mulsd	%xmm4, %xmm4
	addsd	%xmm8, %xmm4
	subsd	64(%rsp), %xmm3
	addsd	8(%rsp), %xmm3
	subsd	%xmm9, %xmm3
	addsd	%xmm10, %xmm3
	subsd	%xmm11, %xmm3
	addsd	%xmm12, %xmm3
	subsd	%xmm13, %xmm3
	addsd	%xmm14, %xmm3
	subsd	%xmm15, %xmm3
	divsd	%xmm1, %xmm3
	pxor	%xmm5, %xmm5
	je	.LBB9_11	# cond_next
.LBB9_10:	# cond_next
	movapd	%xmm5, %xmm3
.LBB9_11:	# cond_next
	movapd	%xmm3, %xmm5
	mulsd	%xmm5, %xmm5
	addsd	%xmm5, %xmm4
	cvtss2sd	.LCPI9_2(%rip), %xmm5
	mulsd	%xmm5, %xmm4
	cvtss2sd	.LCPI9_3(%rip), %xmm5
	movapd	%xmm5, %xmm6
	subsd	%xmm4, %xmm6
	movapd	%xmm1, %xmm7
	mulsd	.LCPI9_4(%rip), %xmm7
	mulsd	%xmm6, %xmm7
	movsd	.LCPI9_5(%rip), %xmm6
	movsd	32(%rsp), %xmm8
	mulsd	%xmm6, %xmm8
	addsd	%xmm7, %xmm8
	movsd	%xmm8, (%r14,%rax,8)
	cvtss2sd	.LCPI9_6(%rip), %xmm7
	movapd	%xmm0, %xmm8
	mulsd	%xmm7, %xmm8
	cvtss2sd	.LCPI9_7(%rip), %xmm9
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm0, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	movapd	%xmm1, %xmm11
	mulsd	.LCPI9_8(%rip), %xmm11
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%rdx,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	2001(%rax), %r15d
	movslq	%r15d, %rdx
	movsd	%xmm12, (%r14,%rdx,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm0, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm11, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%rcx,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	-1998(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm10, (%r14,%rcx,8)
	movapd	%xmm2, %xmm8
	mulsd	%xmm7, %xmm8
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm2, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%rsi,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	23(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm2, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm11, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%rdi,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	-16(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm10, (%r14,%rcx,8)
	movapd	%xmm3, %xmm8
	mulsd	%xmm7, %xmm8
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm11, %xmm10
	movapd	%xmm6, %xmm12
	mulsd	(%rbx,%r8,8), %xmm12
	addsd	%xmm10, %xmm12
	leal	200005(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
	subsd	%xmm9, %xmm8
	mulsd	%xmm3, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	%xmm8, %xmm11
	movapd	%xmm6, %xmm8
	mulsd	(%rbx,%r9,8), %xmm8
	addsd	%xmm11, %xmm8
	leal	-199994(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm8, (%r14,%rcx,8)
	movapd	%xmm2, %xmm8
	addsd	%xmm0, %xmm8
	movapd	%xmm8, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm8
	addsd	%xmm5, %xmm8
	subsd	%xmm4, %xmm8
	mulsd	.LCPI9_9(%rip), %xmm1
	mulsd	%xmm1, %xmm8
	movapd	%xmm6, %xmm10
	mulsd	(%rbx,%r10,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	2027(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm10, (%r14,%rcx,8)
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
	mulsd	(%rbx,%r11,8), %xmm10
	addsd	%xmm8, %xmm10
	leal	1988(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm10, (%r14,%rcx,8)
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
	leal	-1971(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm10, (%r14,%rcx,8)
	movsd	.LCPI9_10(%rip), %xmm8
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
	leal	-2010(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
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
	movq	96(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	202011(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
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
	movq	88(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	-197988(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
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
	movq	80(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm12
	addsd	%xmm11, %xmm12
	leal	198013(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm12, (%r14,%rcx,8)
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
	movq	72(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	-201986(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm8, (%r14,%rcx,8)
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
	movq	56(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	200035(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm8, (%r14,%rcx,8)
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
	movq	40(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm8
	addsd	%xmm0, %xmm8
	leal	-199964(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm8, (%r14,%rcx,8)
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
	movq	24(%rsp), %rcx
	mulsd	(%rbx,%rcx,8), %xmm2
	addsd	%xmm0, %xmm2
	leal	199997(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm2, (%r14,%rcx,8)
	subsd	%xmm3, %xmm10
	mulsd	%xmm10, %xmm7
	addsd	%xmm9, %xmm7
	mulsd	%xmm7, %xmm10
	addsd	%xmm5, %xmm10
	subsd	%xmm4, %xmm10
	mulsd	%xmm10, %xmm1
	mulsd	(%rbx,%rbp,8), %xmm6
	addsd	%xmm1, %xmm6
	leal	-200002(%rax), %r15d
	movslq	%r15d, %rcx
	movsd	%xmm6, (%r14,%rcx,8)
	jmp	.LBB9_3	# cond_true
	.size	LBM_performStreamCollide, .-LBM_performStreamCollide


	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI10_0:					#  double
	.quad	5055640609639927018	# double value: 1e+30
.LCPI10_1:					#  double
	.quad	14279012646494702826	# double value: -1e+30
	.text
	.align	16
	.type	LBM_showGridStatistics,@function
LBM_showGridStatistics:
	pushq	%rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	movq	%rdi, %rbx
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 44(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 40(%rsp)
	movl	$6, cg_caller_id_var
	movl	$6, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movsd	.LCPI10_0(%rip), %xmm0
	movsd	%xmm0, 80(%rsp)
	xorl	%r14d, %r14d
	movsd	.LCPI10_1(%rip), %xmm1
	movsd	%xmm1, 72(%rsp)
	pxor	%xmm2, %xmm2
	movsd	%xmm2, 64(%rsp)
	movsd	%xmm0, 56(%rsp)
	movsd	%xmm1, 48(%rsp)
	movl	%r14d, %r15d
	movl	%r14d, 36(%rsp)
	movl	%r14d, %r12d
.LBB10_1:	# bb
	movl	cg_caller_call_site_var, %r13d
	movl	cg_caller_id_var, %ebp
	movl	$22, cg_caller_id_var
	movl	$22, %edx
	movl	%ebp, %edi
	movl	%r13d, %esi
	call	CallEdgeProfiler
	movl	%r14d, %eax
	incl	%eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm0
	movslq	%r14d, %rax
	movapd	%xmm0, %xmm1
	addsd	(%rbx,%rax,8), %xmm1
	leal	2(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm2
	movsd	%xmm2, 8(%rsp)
	addsd	%xmm2, %xmm1
	leal	3(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm2
	addsd	%xmm2, %xmm1
	leal	4(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm3
	movsd	%xmm3, 16(%rsp)
	addsd	%xmm3, %xmm1
	leal	5(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm3
	addsd	%xmm3, %xmm1
	leal	6(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm4
	movsd	%xmm4, 24(%rsp)
	addsd	%xmm4, %xmm1
	leal	7(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm4
	addsd	%xmm4, %xmm1
	leal	8(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm5
	addsd	%xmm5, %xmm1
	leal	9(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm6
	addsd	%xmm6, %xmm1
	leal	10(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm7
	addsd	%xmm7, %xmm1
	leal	11(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm8
	movsd	%xmm8, (%rsp)
	addsd	%xmm8, %xmm1
	leal	12(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm8
	addsd	%xmm8, %xmm1
	leal	13(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm9
	addsd	%xmm9, %xmm1
	leal	14(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm10
	addsd	%xmm10, %xmm1
	leal	15(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm11
	addsd	%xmm11, %xmm1
	leal	16(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm12
	addsd	%xmm12, %xmm1
	leal	17(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm13
	addsd	%xmm13, %xmm1
	leal	18(%r14), %eax
	movslq	%eax, %rax
	movsd	(%rbx,%rax,8), %xmm14
	addsd	%xmm14, %xmm1
	ucomisd	48(%rsp), %xmm1
	movapd	%xmm1, %xmm15
	ja	.LBB10_3	# bb
.LBB10_2:	# bb
	movsd	48(%rsp), %xmm15
.LBB10_3:	# bb
	movsd	%xmm15, 48(%rsp)
	movsd	64(%rsp), %xmm15
	addsd	%xmm1, %xmm15
	movsd	%xmm15, 64(%rsp)
	movapd	%xmm1, %xmm15
	minsd	56(%rsp), %xmm15
	leal	19(%r14), %eax
	movslq	%eax, %rax
	movl	(%rbx,%rax,8), %eax
	testl	$1, %eax
	jne	.LBB10_10	# cond_true159
.LBB10_4:	# cond_false
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
	ucomisd	72(%rsp), %xmm2
	movapd	%xmm2, %xmm0
	ja	.LBB10_6	# cond_false
.LBB10_5:	# cond_false
	movsd	72(%rsp), %xmm0
.LBB10_6:	# cond_false
	minsd	80(%rsp), %xmm2
	shrl	%eax
	andl	$1, %eax
	addl	%eax, 36(%rsp)
	xorl	$1, %eax
	addl	%r15d, %eax
	movsd	%xmm0, 72(%rsp)
	movsd	%xmm2, 80(%rsp)
	movl	%eax, %r15d
.LBB10_7:	# bb421
	movl	%r13d, cg_caller_call_site_var
	movl	%ebp, cg_caller_id_var
	addl	$20, %r14d
	cmpl	$26000000, %r14d
	je	.LBB10_9	# bb426
.LBB10_8:	# bb421.bb_crit_edge
	movsd	%xmm15, 56(%rsp)
	jmp	.LBB10_1	# bb
.LBB10_9:	# bb426
	movl	$2, cg_caller_call_site_var
	movl	$6, cg_caller_id_var
	sqrtsd	80(%rsp), %xmm3
	sqrtsd	72(%rsp), %xmm4
	leaq	.str28, %rdi
	movb	$5, %al
	movl	%r12d, %esi
	movl	36(%rsp), %edx
	movl	%r15d, %ecx
	movapd	%xmm15, %xmm0
	movsd	48(%rsp), %xmm1
	movsd	64(%rsp), %xmm2
	call	printf
	movl	44(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	40(%rsp), %eax
	movl	%eax, cg_caller_id_var
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB10_10:	# cond_true159
	incl	%r12d
	jmp	.LBB10_7	# bb421
	.size	LBM_showGridStatistics, .-LBM_showGridStatistics


	.section	.rodata.cst4,"aM",@progbits,4
	.align	8
.LCPI11_1:					#  float
	.long	1129084864	# float 204.468
.LCPI11_2:					#  float
	.long	1111883776	# float 49.5
.LCPI11_3:					#  float
	.long	1065353216	# float 1
	.zero	12
.LCPI11_5:					#  float
	.long	1069547520	# float 1.5
	.zero	20
.LCPI11_8:					#  float
	.long	1083179008	# float 4.5
.LCPI11_9:					#  float
	.long	1077936128	# float 3
	.zero	8
.LCPI11_11:					#  float
	.long	4048155338	# float -1e+30
	.section	.rodata.cst8,"aM",@progbits,8
	.align	8
.LCPI11_0:					#  double
	.quad	4608533498688228556	# double value: 1.3
	.zero	16
.LCPI11_4:					#  double
	.quad	4576918229304087675	# double value: 0.01
	.zero	8
.LCPI11_6:					#  double
	.quad	4599676419421066581	# double value: 0.333333
.LCPI11_7:					#  double
	.quad	4588167220373341980	# double value: 0.0555556
	.zero	8
.LCPI11_10:					#  double
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
	subq	$984, %rsp
	movl	$7, cg_caller_id_var
	leal	-5(%rdi), %eax
	cmpl	$2, %eax
	movq	%rsi, %rbx
	movl	%edi, 796(%rsp)
	jb	.LBB11_4	# cond_next.i
.LBB11_1:	# cond_true.i
	movl	$0, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	leaq	.str26, %rdi
	call	puts
	call	CallProfPrinter
	movl	$1, %ecx
.LBB11_2:	# cond_true.i
	movl	%ecx, %eax
.LBB11_3:	# cond_true.i
	addq	$984, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.LBB11_4:	# cond_next.i
	movq	8(%rbx), %rdi
	movl	$1, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	xorl	%r14d, %r14d
	movl	$10, %r15d
	xorl	%r12d, %r12d
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%r14d, %ecx
	call	__strtol_internal
	movq	%rax, %r13
	movq	24(%rbx), %rdi
	movq	16(%rbx), %rax
	movq	%rax, 800(%rsp)
	movl	$2, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%r14d, %ecx
	call	__strtol_internal
	movq	%rax, %rbp
	movq	32(%rbx), %rdi
	movl	$3, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r12, %rsi
	movl	%r15d, %edx
	movl	%r14d, %ecx
	call	__strtol_internal
	movl	%r13d, %ecx
	movl	%ecx, 788(%rsp)
	movl	%ebp, %ecx
	movl	%ecx, 792(%rsp)
	movl	%eax, %r14d
	cmpl	$6, 796(%rsp)
	movq	%rax, %r15
	jne	.LBB11_52	# cond_next.i.cond_next131.i_crit_edge
.LBB11_5:	# cond_true88.i
	movq	40(%rbx), %rbx
	movl	$4, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	leaq	816(%rsp), %rdx
	movl	$1, %edi
	movq	%rbx, %rsi
	call	__xstat
	testl	%eax, %eax
	je	.LBB11_9	# cond_next113.i
.LBB11_6:	# cond_true107.i
	movl	$5, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	xorb	%al, %al
	leaq	.str37, %rdi
	movq	%rbx, %rsi
.LBB11_7:	# cond_true107.i
	call	printf
.LBB11_8:	# cond_true107.i
	call	CallProfPrinter
	movl	$1, %r14d
	movl	%r14d, %eax
	jmp	.LBB11_3	# cond_true.i
.LBB11_9:	# cond_next113.i
	movq	864(%rsp), %rdx
	cmpq	$1313130, %rdx
	jne	.LBB11_53	# cond_true119.i
.LBB11_10:	# cond_next131.i
	cmpl	$1, 792(%rsp)
	jne	.LBB11_12	# MAIN_parseCommandLine.exit
.LBB11_11:	# cond_true138.i
	movl	$7, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	leaq	816(%rsp), %rdx
	movl	$1, %edi
	movq	800(%rsp), %rsi
	call	__xstat
	testl	%eax, %eax
	jne	.LBB11_54	# cond_true154.i
.LBB11_12:	# MAIN_parseCommandLine.exit
	movl	$9, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movl	$4294967295, %eax
	andq	%rax, %r15
	shlq	$5, %r15
	leaq	simTypeString.2843(%r15), %rcx
	movq	%rcx, 8(%rsp)
	testq	%rbx, %rbx
	leaq	.str410, %rcx
	cmovne	%rbx, %rcx
	movq	%rcx, 16(%rsp)
	andq	%rax, %rbp
	shlq	$5, %rbp
	leaq	actionString.2842(%rbp), %rax
	movq	%rax, (%rsp)
	movl	$130, %ecx
	leaq	.str15, %rdi
	movl	$100, %edx
	movb	$1, %al
	movsd	.LCPI11_0(%rip), %xmm0
	movl	%edx, %esi
	movl	788(%rsp), %r8d
	movq	800(%rsp), %r9
	call	printf
	movl	$214400000, %edi
	call	malloc
	testq	%rax, %rax
	movq	%rax, %r15
	jne	.LBB11_15	# LBM_allocateGrid.exit
.LBB11_13:	# cond_true.i1
	movl	$10, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movb	$1, %al
	leaq	.str6, %rdi
	cvtss2sd	.LCPI11_1(%rip), %xmm0
	call	printf
	movl	$11, cg_caller_call_site_var
.LBB11_14:	# cond_true.i1
	movl	$7, cg_caller_id_var
	call	CallProfPrinter
	movl	$1, %r14d
	movl	%r14d, %edi
	call	exit
.LBB11_15:	# LBM_allocateGrid.exit
	movl	$214400000, %edi
	call	malloc
	addq	$3200000, %r15
	testq	%rax, %rax
	movq	%rax, 584(%rsp)
	je	.LBB11_55	# cond_true.i126
.LBB11_16:	# LBM_allocateGrid.exit129
	movl	$14, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	call	LBM_initializeGrid
	movl	$15, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	584(%rsp), %rax
	addq	$3200000, %rax
	movq	%rax, 584(%rsp)
	movq	%rax, %rdi
	call	LBM_initializeGrid
	testq	%rbx, %rbx
	je	.LBB11_18	# cond_next.i106
.LBB11_17:	# cond_true.i104
	movl	$16, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	movq	%rbx, %rsi
	call	LBM_loadObstacleFile
	movl	$17, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	584(%rsp), %rdi
	movq	%rbx, %rsi
	call	LBM_loadObstacleFile
.LBB11_18:	# cond_next.i106
	cmpl	$1, %r14d
	je	.LBB11_56	# cond_true25.i
.LBB11_19:	# cond_false.i108
	movl	$20, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	call	LBM_initializeSpecialCellsForLDC
	movl	$21, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	584(%rsp), %rdi
	call	LBM_initializeSpecialCellsForLDC
.LBB11_20:	# MAIN_initialize.exit
	movl	$22, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	call	LBM_showGridStatistics
	cmpl	$0, 788(%rsp)
	jle	.LBB11_32	# bb68
.LBB11_21:	# bb.preheader
	cmpl	$1, %r14d
	jne	.LBB11_57	# bb.preheader.bb_crit_edge
.LBB11_22:	# bb.preheader.bb.us_crit_edge
	movl	$1, %ebx
.LBB11_23:	# bb.us
	movq	%r15, %r14
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 784(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 780(%rsp)
	movl	$29, cg_caller_id_var
	movl	$29, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	xorl	%r15d, %r15d
.LBB11_24:	# bb.i
	movl	cg_caller_call_site_var, %r12d
	movl	cg_caller_id_var, %r13d
	movl	$31, cg_caller_id_var
	movl	$31, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	movl	$274877907, %ecx
	movl	%r15d, %eax
	imull	%ecx
	movl	%edx, %ecx
	shrl	$31, %ecx
	sarl	$7, %edx
	movl	%edx, %esi
	addl	%ecx, %esi
	movl	$1374389535, %ecx
	movl	%esi, %eax
	imull	%ecx
	movl	%edx, %edi
	movl	$1717986919, %r8d
	movl	%r15d, %eax
	imull	%r8d
	movl	%edx, %r8d
	shrl	$31, %r8d
	sarl	$3, %edx
	movl	%edx, %r9d
	addl	%r8d, %r9d
	movl	%r9d, %eax
	imull	%ecx
	movl	%edx, %eax
	shrl	$31, %eax
	sarl	$5, %edx
	addl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %r9d
	cvtsi2sd	%r9d, %xmm0
	cvtss2sd	.LCPI11_2(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtss2sd	.LCPI11_3(%rip), %xmm2
	subsd	%xmm2, %xmm0
	movl	%edi, %eax
	shrl	$31, %eax
	sarl	$5, %edi
	addl	%eax, %edi
	imull	$100, %edi, %eax
	subl	%eax, %esi
	cvtsi2sd	%esi, %xmm3
	divsd	%xmm1, %xmm3
	subsd	%xmm2, %xmm3
	mulsd	%xmm3, %xmm3
	movapd	%xmm2, %xmm1
	subsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm0
	movapd	%xmm2, %xmm3
	subsd	%xmm0, %xmm3
	mulsd	.LCPI11_4(%rip), %xmm3
	mulsd	%xmm1, %xmm3
	movapd	%xmm3, %xmm0
	mulsd	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cvtss2sd	.LCPI11_5(%rip), %xmm4
	mulsd	%xmm4, %xmm0
	movapd	%xmm2, %xmm4
	subsd	%xmm0, %xmm4
	leal	400000(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	leal	400001(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400002(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400003(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400004(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400005(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400006(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400007(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400008(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400009(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400010(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400011(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400012(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400013(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400014(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400015(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400016(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400017(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	400018(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm5
	leal	200000(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm6
	leal	200001(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200002(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200003(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200004(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200005(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200006(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200007(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200008(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200009(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200010(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200011(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200012(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200013(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200014(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200015(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200016(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200017(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	leal	200018(%r15), %eax
	movslq	%eax, %rax
	addsd	(%r14,%rax,8), %xmm6
	addsd	%xmm6, %xmm6
	subsd	%xmm5, %xmm6
	movapd	%xmm6, %xmm5
	mulsd	.LCPI11_6(%rip), %xmm5
	mulsd	%xmm4, %xmm5
	movslq	%r15d, %rax
	movsd	%xmm5, (%r14,%rax,8)
	movapd	%xmm6, %xmm5
	mulsd	.LCPI11_7(%rip), %xmm5
	movapd	%xmm5, %xmm7
	mulsd	%xmm4, %xmm7
	movl	%r15d, %eax
	incl	%eax
	movslq	%eax, %rax
	movsd	%xmm7, (%r14,%rax,8)
	leal	2(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm7, (%r14,%rax,8)
	leal	3(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm7, (%r14,%rax,8)
	leal	4(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm7, (%r14,%rax,8)
	cvtss2sd	.LCPI11_8(%rip), %xmm7
	movapd	%xmm3, %xmm8
	mulsd	%xmm7, %xmm8
	cvtss2sd	.LCPI11_9(%rip), %xmm9
	movapd	%xmm8, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm2, %xmm10
	subsd	%xmm0, %xmm10
	mulsd	%xmm5, %xmm10
	leal	5(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm10, (%r14,%rax,8)
	movapd	%xmm8, %xmm10
	subsd	%xmm9, %xmm10
	mulsd	%xmm3, %xmm10
	addsd	%xmm2, %xmm10
	subsd	%xmm0, %xmm10
	mulsd	%xmm10, %xmm5
	leal	6(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm5, (%r14,%rax,8)
	mulsd	.LCPI11_10(%rip), %xmm6
	mulsd	%xmm6, %xmm4
	leal	7(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	leal	8(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	leal	9(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	leal	10(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
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
	leal	11(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm1, (%r14,%rax,8)
	movapd	%xmm5, %xmm10
	mulsd	%xmm7, %xmm10
	addsd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm5
	addsd	%xmm2, %xmm5
	subsd	%xmm0, %xmm5
	mulsd	%xmm6, %xmm5
	leal	12(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm5, (%r14,%rax,8)
	mulsd	%xmm4, %xmm7
	addsd	%xmm9, %xmm7
	mulsd	%xmm7, %xmm4
	addsd	%xmm2, %xmm4
	subsd	%xmm0, %xmm4
	mulsd	%xmm6, %xmm4
	leal	13(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	subsd	%xmm8, %xmm9
	mulsd	%xmm3, %xmm9
	subsd	%xmm9, %xmm2
	subsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm6
	leal	14(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm6, (%r14,%rax,8)
	leal	15(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm1, (%r14,%rax,8)
	leal	16(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm5, (%r14,%rax,8)
	leal	17(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	leal	18(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm6, (%r14,%rax,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	addl	$20, %r15d
	cmpl	$200000, %r15d
	jne	.LBB11_24	# bb.i
.LBB11_25:	# bb.i.bb662.i_crit_edge
	xorl	%r15d, %r15d
.LBB11_26:	# bb662.i
	movl	$30, cg_caller_id_var
	movl	$30, %edx
	movl	%r13d, %edi
	movl	%r12d, %esi
	call	CallEdgeProfiler
	leal	25400002(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm0
	leal	25400001(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm1
	leal	25400000(%r15), %eax
	movslq	%eax, %rax
	movapd	%xmm1, %xmm2
	addsd	(%r14,%rax,8), %xmm2
	addsd	%xmm0, %xmm2
	leal	25400003(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm3
	addsd	%xmm3, %xmm2
	leal	25400004(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm4
	movsd	%xmm4, 760(%rsp)
	addsd	%xmm4, %xmm2
	leal	25400005(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm4
	addsd	%xmm4, %xmm2
	leal	25400006(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 768(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400007(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 680(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400008(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 672(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400009(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 664(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400010(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 656(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400011(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 752(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400012(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 744(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400013(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 736(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400014(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 728(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400015(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 720(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400016(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 712(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400017(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 696(%rsp)
	addsd	%xmm5, %xmm2
	leal	25400018(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	movsd	%xmm5, 688(%rsp)
	addsd	%xmm5, %xmm2
	subsd	%xmm0, %xmm1
	addsd	680(%rsp), %xmm1
	addsd	672(%rsp), %xmm1
	subsd	664(%rsp), %xmm1
	subsd	656(%rsp), %xmm1
	addsd	752(%rsp), %xmm1
	addsd	744(%rsp), %xmm1
	subsd	736(%rsp), %xmm1
	subsd	728(%rsp), %xmm1
	divsd	%xmm2, %xmm1
	leal	25600002(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm0
	leal	25600001(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm5
	leal	25600000(%r15), %eax
	movslq	%eax, %rax
	movapd	%xmm5, %xmm6
	addsd	(%r14,%rax,8), %xmm6
	addsd	%xmm0, %xmm6
	leal	25600003(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm7
	addsd	%xmm7, %xmm6
	leal	25600004(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm8
	movsd	%xmm8, 648(%rsp)
	addsd	%xmm8, %xmm6
	leal	25600005(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm8
	addsd	%xmm8, %xmm6
	leal	25600006(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm9
	movsd	%xmm9, 704(%rsp)
	addsd	%xmm9, %xmm6
	leal	25600007(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm9
	addsd	%xmm9, %xmm6
	leal	25600008(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm10
	addsd	%xmm10, %xmm6
	leal	25600009(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm11
	addsd	%xmm11, %xmm6
	leal	25600010(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm12
	addsd	%xmm12, %xmm6
	leal	25600011(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 640(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600012(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 632(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600013(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 624(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600014(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 616(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600015(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 608(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600016(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	movsd	%xmm13, 600(%rsp)
	addsd	%xmm13, %xmm6
	leal	25600017(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm13
	addsd	%xmm13, %xmm6
	leal	25600018(%r15), %eax
	movslq	%eax, %rax
	movsd	(%r14,%rax,8), %xmm14
	addsd	%xmm14, %xmm6
	subsd	%xmm0, %xmm5
	addsd	%xmm9, %xmm5
	addsd	%xmm10, %xmm5
	subsd	%xmm11, %xmm5
	subsd	%xmm12, %xmm5
	addsd	640(%rsp), %xmm5
	addsd	632(%rsp), %xmm5
	subsd	624(%rsp), %xmm5
	subsd	616(%rsp), %xmm5
	divsd	%xmm6, %xmm5
	addsd	%xmm5, %xmm5
	movapd	%xmm5, %xmm0
	subsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm15
	mulsd	%xmm15, %xmm15
	subsd	760(%rsp), %xmm3
	addsd	680(%rsp), %xmm3
	subsd	672(%rsp), %xmm3
	addsd	664(%rsp), %xmm3
	subsd	656(%rsp), %xmm3
	addsd	720(%rsp), %xmm3
	addsd	712(%rsp), %xmm3
	subsd	696(%rsp), %xmm3
	subsd	688(%rsp), %xmm3
	divsd	%xmm2, %xmm3
	subsd	648(%rsp), %xmm7
	addsd	%xmm9, %xmm7
	subsd	%xmm10, %xmm7
	addsd	%xmm11, %xmm7
	subsd	%xmm12, %xmm7
	addsd	608(%rsp), %xmm7
	addsd	600(%rsp), %xmm7
	subsd	%xmm13, %xmm7
	subsd	%xmm14, %xmm7
	divsd	%xmm6, %xmm7
	addsd	%xmm7, %xmm7
	movapd	%xmm7, %xmm9
	subsd	%xmm3, %xmm9
	movapd	%xmm9, %xmm10
	mulsd	%xmm10, %xmm10
	addsd	%xmm15, %xmm10
	subsd	768(%rsp), %xmm4
	addsd	752(%rsp), %xmm4
	subsd	744(%rsp), %xmm4
	addsd	736(%rsp), %xmm4
	subsd	728(%rsp), %xmm4
	addsd	720(%rsp), %xmm4
	subsd	712(%rsp), %xmm4
	addsd	696(%rsp), %xmm4
	subsd	688(%rsp), %xmm4
	divsd	%xmm2, %xmm4
	subsd	704(%rsp), %xmm8
	addsd	640(%rsp), %xmm8
	subsd	632(%rsp), %xmm8
	addsd	624(%rsp), %xmm8
	subsd	616(%rsp), %xmm8
	addsd	608(%rsp), %xmm8
	subsd	600(%rsp), %xmm8
	addsd	%xmm13, %xmm8
	subsd	%xmm14, %xmm8
	divsd	%xmm6, %xmm8
	addsd	%xmm8, %xmm8
	subsd	%xmm4, %xmm8
	movapd	%xmm8, %xmm2
	mulsd	%xmm2, %xmm2
	addsd	%xmm2, %xmm10
	cvtss2sd	.LCPI11_5(%rip), %xmm2
	mulsd	%xmm2, %xmm10
	cvtss2sd	.LCPI11_8(%rip), %xmm2
	movapd	%xmm0, %xmm4
	mulsd	%xmm2, %xmm4
	cvtss2sd	.LCPI11_9(%rip), %xmm6
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm0, %xmm11
	cvtss2sd	.LCPI11_3(%rip), %xmm12
	addsd	%xmm12, %xmm11
	subsd	%xmm6, %xmm4
	mulsd	%xmm0, %xmm4
	addsd	%xmm12, %xmm4
	movapd	%xmm12, %xmm13
	subsd	%xmm10, %xmm13
	mulsd	.LCPI11_6(%rip), %xmm13
	leal	25800000(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm13, (%r14,%rax,8)
	subsd	%xmm10, %xmm11
	movsd	.LCPI11_7(%rip), %xmm13
	mulsd	%xmm13, %xmm11
	leal	25800001(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm11, (%r14,%rax,8)
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800002(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	movapd	%xmm9, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm9, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm13, %xmm11
	leal	25800003(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm11, (%r14,%rax,8)
	subsd	%xmm6, %xmm4
	mulsd	%xmm9, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800004(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	movapd	%xmm8, %xmm4
	mulsd	%xmm2, %xmm4
	movapd	%xmm4, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm8, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm13, %xmm11
	leal	25800005(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm11, (%r14,%rax,8)
	subsd	%xmm6, %xmm4
	mulsd	%xmm8, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm13, %xmm4
	leal	25800006(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
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
	movsd	.LCPI11_10(%rip), %xmm14
	mulsd	%xmm14, %xmm13
	leal	25800007(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm13, (%r14,%rax,8)
	movapd	%xmm11, %xmm13
	mulsd	%xmm2, %xmm13
	addsd	%xmm6, %xmm13
	mulsd	%xmm13, %xmm11
	addsd	%xmm12, %xmm11
	subsd	%xmm10, %xmm11
	mulsd	%xmm14, %xmm11
	leal	25800008(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm11, (%r14,%rax,8)
	movapd	%xmm4, %xmm11
	mulsd	%xmm2, %xmm11
	addsd	%xmm6, %xmm11
	mulsd	%xmm11, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800009(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
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
	leal	25800010(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	movapd	%xmm0, %xmm4
	addsd	%xmm8, %xmm4
	movapd	%xmm4, %xmm7
	mulsd	%xmm2, %xmm7
	addsd	%xmm6, %xmm7
	mulsd	%xmm7, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800011(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
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
	leal	25800012(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	movapd	%xmm4, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm0, %xmm4
	addsd	%xmm12, %xmm4
	subsd	%xmm10, %xmm4
	mulsd	%xmm14, %xmm4
	leal	25800013(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm4, (%r14,%rax,8)
	movapd	%xmm1, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm6, %xmm0
	mulsd	%xmm0, %xmm1
	addsd	%xmm12, %xmm1
	subsd	%xmm10, %xmm1
	mulsd	%xmm14, %xmm1
	leal	25800014(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm1, (%r14,%rax,8)
	movapd	%xmm9, %xmm0
	addsd	%xmm8, %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm12, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm14, %xmm0
	leal	25800015(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
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
	leal	25800016(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm9, (%r14,%rax,8)
	movapd	%xmm0, %xmm1
	mulsd	%xmm2, %xmm1
	addsd	%xmm6, %xmm1
	mulsd	%xmm1, %xmm0
	addsd	%xmm12, %xmm0
	subsd	%xmm10, %xmm0
	mulsd	%xmm14, %xmm0
	leal	25800017(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm0, (%r14,%rax,8)
	mulsd	%xmm3, %xmm2
	addsd	%xmm6, %xmm2
	mulsd	%xmm2, %xmm3
	addsd	%xmm12, %xmm3
	subsd	%xmm10, %xmm3
	mulsd	%xmm14, %xmm3
	leal	25800018(%r15), %eax
	movslq	%eax, %rax
	movsd	%xmm3, (%r14,%rax,8)
	movl	%r12d, cg_caller_call_site_var
	movl	%r13d, cg_caller_id_var
	addl	$20, %r15d
	cmpl	$200000, %r15d
	jne	.LBB11_26	# bb662.i
.LBB11_27:	# LBM_handleInOutFlow.exit
	movl	$0, cg_caller_call_site_var
	movl	$29, cg_caller_id_var
	movq	%r14, %rdi
	movq	584(%rsp), %rsi
	call	LBM_performStreamCollide
	testl	$63, %ebx
	je	.LBB11_30	# cond_true52.us
.LBB11_28:	# bb61.us
	movl	784(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	780(%rsp), %eax
	movl	%eax, cg_caller_id_var
	incl	%ebx
	movl	788(%rsp), %eax
	cmpl	%ebx, %eax
	jl	.LBB11_31	# bb61.us.bb68_crit_edge
.LBB11_29:	# bb61.us.bb.us_crit_edge
	movq	584(%rsp), %r15
	movq	%r14, 584(%rsp)
	jmp	.LBB11_23	# bb.us
.LBB11_30:	# cond_true52.us
	movl	$1, cg_caller_call_site_var
	movl	$29, cg_caller_id_var
	xorb	%al, %al
	leaq	.str610, %rdi
	movl	%ebx, %esi
	call	printf
	movl	$2, cg_caller_call_site_var
	movl	$29, cg_caller_id_var
	movq	584(%rsp), %rdi
	call	LBM_showGridStatistics
	jmp	.LBB11_28	# bb61.us
.LBB11_31:	# bb61.us.bb68_crit_edge
	movq	584(%rsp), %r15
	movq	%r14, 584(%rsp)
.LBB11_32:	# bb68
	movl	$29, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	call	LBM_showGridStatistics
	cmpl	$2, 792(%rsp)
	je	.LBB11_43	# cond_true91
.LBB11_33:	# bb68
	cmpl	$1, 792(%rsp)
	jne	.LBB11_51	# cond_next97
.LBB11_34:	# cond_true78
	movl	$30, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	leaq	.str17, %rsi
	movq	800(%rsp), %rdi
	call	fopen
	movss	.LCPI11_11(%rip), %xmm0
	movss	%xmm0, 596(%rsp)
	movl	$0, 500(%rsp)
	movq	%rax, 240(%rsp)
.LBB11_35:	# bb883.outer.i
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 580(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 576(%rsp)
	movl	$23, cg_caller_id_var
	movl	$23, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	500(%rsp), %eax
	leal	12(%rax), %ecx
	movl	%ecx, 572(%rsp)
	leal	13(%rax), %ecx
	movl	%ecx, 568(%rsp)
	leal	4(%rax), %ecx
	movl	%ecx, 564(%rsp)
	leal	14(%rax), %ecx
	movl	%ecx, 560(%rsp)
	leal	5(%rax), %ecx
	movl	%ecx, 556(%rsp)
	leal	18(%rax), %ecx
	movl	%ecx, 552(%rsp)
	movl	%eax, %ecx
	incl	%ecx
	movl	%ecx, 504(%rsp)
	leal	7(%rax), %ecx
	movl	%ecx, 548(%rsp)
	leal	16(%rax), %ecx
	movl	%ecx, 544(%rsp)
	leal	8(%rax), %ecx
	movl	%ecx, 540(%rsp)
	leal	15(%rax), %ecx
	movl	%ecx, 536(%rsp)
	leal	6(%rax), %ecx
	movl	%ecx, 532(%rsp)
	leal	9(%rax), %ecx
	movl	%ecx, 528(%rsp)
	leal	2(%rax), %ecx
	movl	%ecx, 524(%rsp)
	leal	10(%rax), %ecx
	movl	%ecx, 520(%rsp)
	leal	11(%rax), %ecx
	movl	%ecx, 516(%rsp)
	leal	3(%rax), %ecx
	movl	%ecx, 512(%rsp)
	leal	17(%rax), %eax
	movl	%eax, 508(%rsp)
	movl	$0, 252(%rsp)
.LBB11_36:	# bb875.preheader.i
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 452(%rsp)
	movl	cg_caller_id_var, %eax
	movl	%eax, 432(%rsp)
	movl	$24, cg_caller_id_var
	movl	$24, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	572(%rsp), %ebx
	movl	252(%rsp), %eax
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 492(%rsp)
	movl	568(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 488(%rsp)
	movl	564(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 440(%rsp)
	movl	536(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 496(%rsp)
	movl	560(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 484(%rsp)
	movl	556(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 448(%rsp)
	movl	500(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 460(%rsp)
	movl	504(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 464(%rsp)
	movl	548(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 436(%rsp)
	movl	508(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 480(%rsp)
	movl	540(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 428(%rsp)
	movl	544(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 476(%rsp)
	movl	532(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 444(%rsp)
	movl	528(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 472(%rsp)
	movl	524(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 468(%rsp)
	movl	520(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 456(%rsp)
	movl	516(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 424(%rsp)
	movl	512(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 416(%rsp)
	movl	552(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 412(%rsp)
	xorl	%ebx, %ebx
	movss	596(%rsp), %xmm0
	movss	%xmm0, 420(%rsp)
.LBB11_37:	# bb9.i119
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r12d
	movl	$25, cg_caller_id_var
	movl	$25, %edx
	movl	%r12d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movl	464(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 400(%rsp)
	movl	460(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	addsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 392(%rsp)
	movl	488(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 384(%rsp)
	movl	412(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 376(%rsp)
	movl	472(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 368(%rsp)
	movl	424(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 360(%rsp)
	movl	480(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 352(%rsp)
	movl	476(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 344(%rsp)
	movl	456(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 336(%rsp)
	movl	492(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 328(%rsp)
	movl	428(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 320(%rsp)
	movl	484(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 312(%rsp)
	movl	496(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 304(%rsp)
	movl	436(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 296(%rsp)
	movl	468(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 288(%rsp)
	movl	440(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 280(%rsp)
	movl	448(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 272(%rsp)
	movl	444(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 264(%rsp)
	movl	416(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movsd	%xmm0, 256(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$25, cg_caller_id_var
	movl	$1, %r13d
	movl	$4, %ebp
	leaq	980(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	240(%rsp), %rcx
	call	fread
	movl	$1, cg_caller_call_site_var
	movl	$25, cg_caller_id_var
	leaq	976(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	240(%rsp), %rcx
	call	fread
	movl	$2, cg_caller_call_site_var
	movl	$25, cg_caller_id_var
	leaq	972(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	240(%rsp), %rcx
	call	fread
	cvtss2sd	980(%rsp), %xmm0
	cvtss2sd	976(%rsp), %xmm1
	cvtss2sd	972(%rsp), %xmm2
	movl	%r14d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	movsd	392(%rsp), %xmm3
	addsd	288(%rsp), %xmm3
	addsd	256(%rsp), %xmm3
	addsd	280(%rsp), %xmm3
	addsd	272(%rsp), %xmm3
	addsd	264(%rsp), %xmm3
	addsd	296(%rsp), %xmm3
	addsd	320(%rsp), %xmm3
	addsd	368(%rsp), %xmm3
	addsd	336(%rsp), %xmm3
	addsd	360(%rsp), %xmm3
	addsd	328(%rsp), %xmm3
	addsd	384(%rsp), %xmm3
	addsd	312(%rsp), %xmm3
	addsd	304(%rsp), %xmm3
	addsd	344(%rsp), %xmm3
	addsd	352(%rsp), %xmm3
	addsd	376(%rsp), %xmm3
	movsd	%xmm3, 392(%rsp)
	movsd	400(%rsp), %xmm3
	subsd	288(%rsp), %xmm3
	addsd	296(%rsp), %xmm3
	addsd	320(%rsp), %xmm3
	subsd	368(%rsp), %xmm3
	subsd	336(%rsp), %xmm3
	addsd	360(%rsp), %xmm3
	addsd	328(%rsp), %xmm3
	subsd	384(%rsp), %xmm3
	subsd	312(%rsp), %xmm3
	divsd	392(%rsp), %xmm3
	subsd	%xmm1, %xmm3
	movsd	%xmm3, 400(%rsp)
	cvtsd2ss	%xmm3, %xmm1
	mulss	%xmm1, %xmm1
	movsd	256(%rsp), %xmm3
	subsd	280(%rsp), %xmm3
	addsd	296(%rsp), %xmm3
	subsd	320(%rsp), %xmm3
	addsd	368(%rsp), %xmm3
	subsd	336(%rsp), %xmm3
	addsd	304(%rsp), %xmm3
	addsd	344(%rsp), %xmm3
	subsd	352(%rsp), %xmm3
	subsd	376(%rsp), %xmm3
	divsd	392(%rsp), %xmm3
	subsd	%xmm0, %xmm3
	movsd	%xmm3, 256(%rsp)
	cvtsd2ss	%xmm3, %xmm0
	mulss	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movsd	272(%rsp), %xmm1
	subsd	264(%rsp), %xmm1
	addsd	360(%rsp), %xmm1
	subsd	328(%rsp), %xmm1
	addsd	384(%rsp), %xmm1
	subsd	312(%rsp), %xmm1
	addsd	304(%rsp), %xmm1
	subsd	344(%rsp), %xmm1
	addsd	352(%rsp), %xmm1
	subsd	376(%rsp), %xmm1
	divsd	392(%rsp), %xmm1
	subsd	%xmm2, %xmm1
	movsd	%xmm1, 272(%rsp)
	cvtsd2ss	%xmm1, %xmm1
	mulss	%xmm1, %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, 596(%rsp)
	ucomiss	420(%rsp), %xmm0
	ja	.LBB11_39	# bb9.i119
.LBB11_38:	# bb9.i119
	movss	420(%rsp), %xmm0
	movss	%xmm0, 596(%rsp)
.LBB11_39:	# bb9.i119
	addl	$20, %ebx
	cmpl	$2000, %ebx
	movss	596(%rsp), %xmm0
	movss	%xmm0, 420(%rsp)
	jne	.LBB11_37	# bb9.i119
.LBB11_40:	# bb880.i
	movl	452(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	432(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	252(%rsp), %ebx
	addl	$2000, %ebx
	movl	%ebx, 252(%rsp)
	cmpl	$200000, %ebx
	jne	.LBB11_36	# bb875.preheader.i
.LBB11_41:	# bb891.i
	movl	580(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	576(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	500(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 500(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB11_35	# bb883.outer.i
.LBB11_42:	# LBM_compareVelocityField.exit
	movl	$35, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	cvtss2sd	596(%rsp), %xmm0
	sqrtsd	%xmm0, %xmm0
	movb	$1, %al
	leaq	.str69, %rdi
	call	printf
	movl	$36, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	240(%rsp), %rdi
	jmp	.LBB11_50	# LBM_storeVelocityField.exit
.LBB11_43:	# cond_true91
	movl	$37, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	leaq	.str7, %rsi
	movq	800(%rsp), %rdi
	call	fopen
	movl	$0, 156(%rsp)
	movq	%rax, 32(%rsp)
.LBB11_44:	# bb852.outer.i
	movl	cg_caller_call_site_var, %eax
	movl	%eax, 236(%rsp)
	movl	cg_caller_id_var, %ecx
	movl	%ecx, 232(%rsp)
	movl	$26, cg_caller_id_var
	movl	$26, %edx
	movl	%ecx, %edi
	movl	%eax, %esi
	call	CallEdgeProfiler
	movl	156(%rsp), %eax
	leal	12(%rax), %ecx
	movl	%ecx, 228(%rsp)
	leal	13(%rax), %ecx
	movl	%ecx, 224(%rsp)
	leal	4(%rax), %ecx
	movl	%ecx, 220(%rsp)
	leal	14(%rax), %ecx
	movl	%ecx, 216(%rsp)
	leal	5(%rax), %ecx
	movl	%ecx, 212(%rsp)
	leal	18(%rax), %ecx
	movl	%ecx, 208(%rsp)
	movl	%eax, %ecx
	incl	%ecx
	movl	%ecx, 160(%rsp)
	leal	7(%rax), %ecx
	movl	%ecx, 204(%rsp)
	leal	16(%rax), %ecx
	movl	%ecx, 200(%rsp)
	leal	8(%rax), %ecx
	movl	%ecx, 196(%rsp)
	leal	15(%rax), %ecx
	movl	%ecx, 192(%rsp)
	leal	6(%rax), %ecx
	movl	%ecx, 188(%rsp)
	leal	9(%rax), %ecx
	movl	%ecx, 184(%rsp)
	leal	2(%rax), %ecx
	movl	%ecx, 180(%rsp)
	leal	10(%rax), %ecx
	movl	%ecx, 176(%rsp)
	leal	11(%rax), %ecx
	movl	%ecx, 172(%rsp)
	leal	3(%rax), %ecx
	movl	%ecx, 168(%rsp)
	leal	17(%rax), %eax
	movl	%eax, 164(%rsp)
	movl	$0, 44(%rsp)
.LBB11_45:	# bb844.preheader.i
	movl	cg_caller_call_site_var, %ebx
	movl	%ebx, 120(%rsp)
	movl	cg_caller_id_var, %eax
	movl	%eax, 96(%rsp)
	movl	$27, cg_caller_id_var
	movl	$27, %edx
	movl	%eax, %edi
	movl	%ebx, %esi
	call	CallEdgeProfiler
	movl	228(%rsp), %ebx
	movl	44(%rsp), %eax
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 136(%rsp)
	movl	224(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 152(%rsp)
	movl	220(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 124(%rsp)
	movl	192(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 148(%rsp)
	movl	216(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 80(%rsp)
	movl	212(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 116(%rsp)
	movl	156(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 140(%rsp)
	movl	160(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 88(%rsp)
	movl	204(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 108(%rsp)
	movl	164(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 144(%rsp)
	movl	196(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 104(%rsp)
	movl	200(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 132(%rsp)
	movl	188(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 112(%rsp)
	movl	184(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 128(%rsp)
	movl	180(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 100(%rsp)
	movl	176(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 92(%rsp)
	movl	172(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 84(%rsp)
	movl	168(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 76(%rsp)
	movl	208(%rsp), %ebx
	leal	(%rbx,%rax), %ebx
	movl	%ebx, 72(%rsp)
	xorl	%ebx, %ebx
.LBB11_46:	# bb9.i
	movl	cg_caller_call_site_var, %r14d
	movl	cg_caller_id_var, %r12d
	movl	$28, cg_caller_id_var
	movl	$28, %edx
	movl	%r12d, %edi
	movl	%r14d, %esi
	call	CallEdgeProfiler
	movl	88(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm0
	movl	140(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movapd	%xmm0, %xmm1
	addsd	(%r15,%rax,8), %xmm1
	movl	100(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm2
	movsd	%xmm2, 56(%rsp)
	addsd	%xmm2, %xmm1
	movl	76(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm2
	addsd	%xmm2, %xmm1
	movl	124(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm3
	movsd	%xmm3, 48(%rsp)
	addsd	%xmm3, %xmm1
	movl	116(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm3
	addsd	%xmm3, %xmm1
	movl	112(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm4
	movsd	%xmm4, 64(%rsp)
	addsd	%xmm4, %xmm1
	movl	108(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm4
	addsd	%xmm4, %xmm1
	movl	104(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm5
	addsd	%xmm5, %xmm1
	movl	128(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm6
	addsd	%xmm6, %xmm1
	movl	92(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm7
	addsd	%xmm7, %xmm1
	movl	84(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm8
	addsd	%xmm8, %xmm1
	movl	136(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm9
	addsd	%xmm9, %xmm1
	movl	152(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm10
	addsd	%xmm10, %xmm1
	movl	80(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm11
	addsd	%xmm11, %xmm1
	movl	148(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm12
	addsd	%xmm12, %xmm1
	movl	132(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm13
	addsd	%xmm13, %xmm1
	movl	144(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm14
	addsd	%xmm14, %xmm1
	movl	72(%rsp), %eax
	leal	(%rax,%rbx), %eax
	movslq	%eax, %rax
	movsd	(%r15,%rax,8), %xmm15
	addsd	%xmm15, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	subsd	48(%rsp), %xmm2
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
	movss	%xmm2, 968(%rsp)
	subsd	56(%rsp), %xmm0
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
	movss	%xmm0, 964(%rsp)
	subsd	64(%rsp), %xmm3
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
	movss	%xmm0, 960(%rsp)
	movl	$0, cg_caller_call_site_var
	movl	$28, cg_caller_id_var
	movl	$1, %r13d
	movl	$4, %ebp
	leaq	968(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	32(%rsp), %rcx
	call	fwrite
	movl	$1, cg_caller_call_site_var
	movl	$28, cg_caller_id_var
	leaq	964(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	32(%rsp), %rcx
	call	fwrite
	movl	$2, cg_caller_call_site_var
	movl	$28, cg_caller_id_var
	leaq	960(%rsp), %rdi
	movq	%rbp, %rsi
	movq	%r13, %rdx
	movq	32(%rsp), %rcx
	call	fwrite
	movl	%r14d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	addl	$20, %ebx
	cmpl	$2000, %ebx
	jl	.LBB11_46	# bb9.i
.LBB11_47:	# bb849.i
	movl	120(%rsp), %ebx
	movl	%ebx, cg_caller_call_site_var
	movl	96(%rsp), %ebx
	movl	%ebx, cg_caller_id_var
	movl	44(%rsp), %ebx
	addl	$2000, %ebx
	movl	%ebx, 44(%rsp)
	cmpl	$200000, %ebx
	jne	.LBB11_45	# bb844.preheader.i
.LBB11_48:	# bb857.i
	movl	236(%rsp), %eax
	movl	%eax, cg_caller_call_site_var
	movl	232(%rsp), %eax
	movl	%eax, cg_caller_id_var
	movl	156(%rsp), %eax
	addl	$200000, %eax
	movl	%eax, 156(%rsp)
	cmpl	$26000000, %eax
	jne	.LBB11_44	# bb852.outer.i
.LBB11_49:	# LBM_storeVelocityField.exit
	movl	$41, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	32(%rsp), %rdi
.LBB11_50:	# LBM_storeVelocityField.exit
	call	fclose
.LBB11_51:	# cond_next97
	movq	%r15, %rdi
	addq	$-3200000, %rdi
	call	free
	movq	584(%rsp), %rdi
	addq	$-3200000, %rdi
	call	free
	call	CallProfPrinter
	xorl	%ecx, %ecx
	jmp	.LBB11_2	# cond_true.i
.LBB11_52:	# cond_next.i.cond_next131.i_crit_edge
	xorl	%ebx, %ebx
	jmp	.LBB11_10	# cond_next131.i
.LBB11_53:	# cond_true119.i
	movl	$6, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movl	$1313130, %ecx
	xorb	%al, %al
	leaq	.str48, %rdi
	movq	%rbx, %rsi
	call	printf
	jmp	.LBB11_8	# cond_true107.i
.LBB11_54:	# cond_true154.i
	movl	$8, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	xorb	%al, %al
	leaq	.str59, %rdi
	movq	800(%rsp), %rsi
	jmp	.LBB11_7	# cond_true107.i
.LBB11_55:	# cond_true.i126
	movl	$12, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movb	$1, %al
	leaq	.str6, %rdi
	cvtss2sd	.LCPI11_1(%rip), %xmm0
	call	printf
	movl	$13, cg_caller_call_site_var
	jmp	.LBB11_14	# cond_true.i1
.LBB11_56:	# cond_true25.i
	movl	$18, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	%r15, %rdi
	call	LBM_initializeSpecialCellsForChannel
	movl	$19, cg_caller_call_site_var
	movl	$7, cg_caller_id_var
	movq	584(%rsp), %rdi
	call	LBM_initializeSpecialCellsForChannel
	jmp	.LBB11_20	# MAIN_initialize.exit
.LBB11_57:	# bb.preheader.bb_crit_edge
	movl	$1, %ebx
.LBB11_58:	# bb
	movq	%r15, %r14
	movl	cg_caller_call_site_var, %r15d
	movl	cg_caller_id_var, %r12d
	movl	$32, cg_caller_id_var
	movl	$32, %edx
	movl	%r12d, %edi
	movl	%r15d, %esi
	call	CallEdgeProfiler
	movl	$0, cg_caller_call_site_var
	movl	$32, cg_caller_id_var
	movq	%r14, %rdi
	movq	584(%rsp), %rsi
	call	LBM_performStreamCollide
	testl	$63, %ebx
	jne	.LBB11_60	# bb61
.LBB11_59:	# cond_true52
	movl	$1, cg_caller_call_site_var
	movl	$32, cg_caller_id_var
	xorb	%al, %al
	leaq	.str610, %rdi
	movl	%ebx, %esi
	call	printf
	movl	$2, cg_caller_call_site_var
	movl	$32, cg_caller_id_var
	movq	584(%rsp), %rdi
	call	LBM_showGridStatistics
.LBB11_60:	# bb61
	movl	%r15d, cg_caller_call_site_var
	movl	%r12d, cg_caller_id_var
	incl	%ebx
	movl	788(%rsp), %eax
	cmpl	%ebx, %eax
	jl	.LBB11_31	# bb61.us.bb68_crit_edge
.LBB11_61:	# bb61.bb_crit_edge
	movq	584(%rsp), %r15
	movq	%r14, 584(%rsp)
	jmp	.LBB11_58	# bb
	.size	main, .-main
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
	.size	.str6, 49
	.asciz	"LBM_allocateGrid: could not allocate %.1f MByte\n"
	.type	.str17,@object
.str17:				# .str17
	.size	.str17, 3
	.asciz	"rb"
	.type	.str28,@object
	.align	16
.str28:				# .str28
	.size	.str28, 138
	.asciz	"LBM_showGridStatistics:\n\tnObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\n\tminRho: %8.4f maxRho: %8.4f mass: %e\n\tminU: %e maxU: %e\n\n"
	.type	.str69,@object
	.align	16
.str69:				# .str69
	.size	.str69, 43
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
	.type	.str410,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.str410:				# .str410
	.size	.str410, 7
	.asciz	"<none>"
	.type	.str15,@object
	.align	16
.str15:				# .str15
	.size	.str15, 174
	.asciz	"MAIN_printInfo:\n\tgrid size      : %i x %i x %i = %.2f * 10^6 Cells\n\tnTimeSteps     : %i\n\tresult file    : %s\n\taction         : %s\n\tsimulation type: %s\n\tobstacle file  : %s\n\n"
	.type	.str26,@object
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

