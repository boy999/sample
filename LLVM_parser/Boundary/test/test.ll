; ModuleID = 'test.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
@B = weak global [100 x i32] zeroinitializer, align 32		; <[100 x i32]*> [#uses=9]
@A = weak global [200 x i32] zeroinitializer, align 32		; <[200 x i32]*> [#uses=5]
@.str = internal constant [25 x i8] c"The value of A[99] : %d\0A\00"		; <[25 x i8]*> [#uses=1]
@.str1 = internal constant [25 x i8] c"The value of B[99] : %d\0A\00"		; <[25 x i8]*> [#uses=1]

define i32 @func(i32 %val) nounwind  {
entry:
	%tmp1530 = icmp sgt i32 %val, 1		; <i1> [#uses=1]
	br i1 %tmp1530, label %bb.preheader, label %bb17

bb.preheader:		; preds = %entry
	%tmp33 = add i32 %val, -2		; <i32> [#uses=1]
	%tmp35 = icmp slt i32 %tmp33, 0		; <i1> [#uses=2]
	%tmp33.op = add i32 %val, -1		; <i32> [#uses=1]
	%tmp37 = select i1 %tmp35, i32 1, i32 %tmp33.op		; <i32> [#uses=1]
	br label %bb

bb:		; preds = %bb, %bb.preheader
	%indvar = phi i32 [ 0, %bb.preheader ], [ %i.0.reg2mem.0, %bb ]		; <i32> [#uses=2]
	%i.0.reg2mem.0 = add i32 %indvar, 1		; <i32> [#uses=3]
	%tmp34 = sext i32 %indvar to i64		; <i64> [#uses=1]
	%tmp5 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp34		; <i32*> [#uses=1]
	%tmp6 = load i32* %tmp5, align 4		; <i32> [#uses=1]
	%tmp7 = add i32 %tmp6, 1		; <i32> [#uses=1]
	%tmp18 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp9 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp18		; <i32*> [#uses=1]
	store i32 %tmp7, i32* %tmp9, align 4
	%exitcond = icmp eq i32 %i.0.reg2mem.0, %tmp37		; <i1> [#uses=1]
	br i1 %exitcond, label %bb17.loopexit, label %bb

bb17.loopexit:		; preds = %bb
	%tmp.op.cast = sext i32 %val to i64		; <i64> [#uses=1]
	%phitmp = select i1 %tmp35, i64 2, i64 %tmp.op.cast		; <i64> [#uses=1]
	br label %bb17

bb17:		; preds = %bb17.loopexit, %entry
	%i.0.reg2mem.1 = phi i64 [ %phitmp, %bb17.loopexit ], [ 1, %entry ]		; <i64> [#uses=1]
	%tmp21 = getelementptr [100 x i32]* @B, i32 0, i64 %i.0.reg2mem.1		; <i32*> [#uses=1]
	%tmp22 = load i32* %tmp21, align 4		; <i32> [#uses=1]
	ret i32 %tmp22
}

define i32 @main() nounwind  {
entry:
	store i32 1, i32* getelementptr ([200 x i32]* @A, i32 0, i64 0), align 32
	store i32 1, i32* getelementptr ([100 x i32]* @B, i32 0, i64 0), align 32
	br label %bb53.outer

bb53.outer:		; preds = %bb58, %entry
	%i.0.reg2mem.0.ph = phi i32 [ 0, %entry ], [ %indvar.next105, %bb58 ]		; <i32> [#uses=3]
	%tmp78 = sext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=1]
	%tmp9 = getelementptr [200 x i32]* @A, i32 0, i64 %tmp78		; <i32*> [#uses=1]
	%tmp43 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	%tmp4349 = sext i32 %tmp43 to i64		; <i64> [#uses=1]
	%tmp50 = getelementptr [200 x i32]* @A, i32 0, i64 %tmp4349		; <i32*> [#uses=1]
	br label %bb4

bb4:		; preds = %bb32, %bb53.outer
	%j.091 = phi i32 [ 0, %bb53.outer ], [ %tmp6, %bb32 ]		; <i32> [#uses=1]
	%tmp6 = add i32 %j.091, 1		; <i32> [#uses=3]
	%tmp10 = load i32* %tmp9, align 4		; <i32> [#uses=3]
	%tmp11 = add i32 %tmp10, 1		; <i32> [#uses=3]
	%tmp3090 = icmp sgt i32 %tmp11, 1		; <i1> [#uses=1]
	br i1 %tmp3090, label %bb15.preheader, label %bb32

bb15.preheader:		; preds = %bb4
	%tmp96 = add i32 %tmp10, -1		; <i32> [#uses=1]
	%tmp97 = icmp slt i32 %tmp96, 0		; <i1> [#uses=2]
	%tmp99 = select i1 %tmp97, i32 1, i32 %tmp10		; <i32> [#uses=1]
	br label %bb15

bb15:		; preds = %bb15, %bb15.preheader
	%indvar = phi i32 [ 0, %bb15.preheader ], [ %i14.0.reg2mem.0, %bb15 ]		; <i32> [#uses=2]
	%i14.0.reg2mem.0 = add i32 %indvar, 1		; <i32> [#uses=3]
	%tmp1819 = sext i32 %indvar to i64		; <i64> [#uses=1]
	%tmp20 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp1819		; <i32*> [#uses=1]
	%tmp21 = load i32* %tmp20, align 4		; <i32> [#uses=1]
	%tmp22 = add i32 %tmp21, 1		; <i32> [#uses=1]
	%tmp1623 = sext i32 %i14.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp24 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp1623		; <i32*> [#uses=1]
	store i32 %tmp22, i32* %tmp24, align 4
	%exitcond = icmp eq i32 %i14.0.reg2mem.0, %tmp99		; <i1> [#uses=1]
	br i1 %exitcond, label %bb32.loopexit, label %bb15

bb32.loopexit:		; preds = %bb15
	%tmp.op.cast = sext i32 %tmp11 to i64		; <i64> [#uses=1]
	%phitmp93 = select i1 %tmp97, i64 2, i64 %tmp.op.cast		; <i64> [#uses=1]
	br label %bb32

bb32:		; preds = %bb32.loopexit, %bb4
	%i14.0.reg2mem.1 = phi i64 [ %phitmp93, %bb32.loopexit ], [ 1, %bb4 ]		; <i64> [#uses=1]
	%tmp35 = getelementptr [100 x i32]* @B, i32 0, i64 %i14.0.reg2mem.1		; <i32*> [#uses=1]
	%tmp36 = load i32* %tmp35, align 4		; <i32> [#uses=1]
	%tmp639 = sext i32 %tmp6 to i64		; <i64> [#uses=1]
	%tmp40 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp639		; <i32*> [#uses=1]
	store i32 %tmp36, i32* %tmp40, align 4
	store i32 %tmp11, i32* %tmp50, align 4
	%exitcond103 = icmp eq i32 %tmp6, 100		; <i1> [#uses=1]
	br i1 %exitcond103, label %bb58, label %bb4

bb58:		; preds = %bb32
	%indvar.next105 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond106 = icmp eq i32 %indvar.next105, 100		; <i1> [#uses=1]
	br i1 %exitcond106, label %bb66.split, label %bb53.outer

bb66.split:		; preds = %bb58
	%tmp68 = load i32* getelementptr ([200 x i32]* @A, i32 0, i64 99), align 4		; <i32> [#uses=1]
	%tmp70 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str, i32 0, i64 0), i32 %tmp68 ) nounwind 		; <i32> [#uses=0]
	%tmp72 = load i32* getelementptr ([100 x i32]* @B, i32 0, i64 99), align 4		; <i32> [#uses=1]
	%tmp74 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str1, i32 0, i64 0), i32 %tmp72 ) nounwind 		; <i32> [#uses=0]
	%tmp76 = load i32* getelementptr ([200 x i32]* @A, i32 0, i64 100), align 4		; <i32> [#uses=1]
	ret i32 %tmp76
}

declare i32 @printf(i8*, ...) nounwind 
