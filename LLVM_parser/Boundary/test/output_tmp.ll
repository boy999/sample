; ModuleID = 'output_tmp.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
@B = weak global [100 x i32] zeroinitializer, align 32		; <[100 x i32]*> [#uses=6]
@A = weak global [200 x i32] zeroinitializer, align 32		; <[200 x i32]*> [#uses=5]
@.str = internal constant [25 x i8] c"The value of A[99] : %d\0A\00"		; <[25 x i8]*> [#uses=1]
@.str1 = internal constant [25 x i8] c"The value of B[99] : %d\0A\00"		; <[25 x i8]*> [#uses=1]

define void @foo(i32 %i) {
entry:
	%tmp1 = tail call i32 (...)* @loop_enter( i32 %i )		; <i32> [#uses=0]
	ret void
}

declare i32 @loop_enter(...)

define i32 @func(i32 %val) nounwind  {
entry:
	%tmp1530 = icmp sgt i32 %val, 1		; <i1> [#uses=1]
	br i1 %tmp1530, label %bb.preheader, label %bb17

bb.preheader:		; preds = %entry
	%tmp33 = add i32 %val, -2		; <i32> [#uses=1]
	%tmp35 = icmp slt i32 %tmp33, 0		; <i1> [#uses=2]
	%tmp33.op = add i32 %val, -1		; <i32> [#uses=1]
	%tmp37 = select i1 %tmp35, i32 1, i32 %tmp33.op		; <i32> [#uses=1]
	call i32 (...)* @loop_enter( i32 1 )		; <i32>:0 [#uses=0]
	br label %bb

bb:		; preds = %bb, %bb.preheader
	%indvar = phi i32 [ 0, %bb.preheader ], [ %i.0.reg2mem.0, %bb ]		; <i32> [#uses=3]
	%zext = zext i32 %indvar to i64		; <i64> [#uses=0]
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
	call i32 (...)* @loop_enter( i32 2 )		; <i32>:0 [#uses=0]
	br label %bb25.outer

bb25.outer:		; preds = %bb29, %entry
	%i.0.reg2mem.0.ph = phi i32 [ 0, %entry ], [ %indvar.next58, %bb29 ]		; <i32> [#uses=4]
	%zext = zext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=0]
	%tmp67 = sext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=1]
	%tmp8 = getelementptr [200 x i32]* @A, i32 0, i64 %tmp67		; <i32*> [#uses=2]
	%tmp15 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	%tmp1521 = sext i32 %tmp15 to i64		; <i64> [#uses=1]
	%tmp22 = getelementptr [200 x i32]* @A, i32 0, i64 %tmp1521		; <i32*> [#uses=1]
	call i32 (...)* @loop_enter( i32 3 )		; <i32>:1 [#uses=0]
	br label %bb3

bb3:		; preds = %bb3, %bb25.outer
	%j.056 = phi i32 [ 0, %bb25.outer ], [ %tmp5, %bb3 ]		; <i32> [#uses=3]
	%zext2 = zext i32 %j.056 to i64		; <i64> [#uses=0]
	%zext1 = zext i32 %j.056 to i64		; <i64> [#uses=0]
	%tmp5 = add i32 %j.056, 1		; <i32> [#uses=3]
	%tmp9 = load i32* %tmp8, align 4		; <i32> [#uses=1]
	%tmp10 = add i32 %tmp9, 1		; <i32> [#uses=1]
	%tmp11 = tail call i32 @func( i32 %tmp10 )		; <i32> [#uses=1]
	%tmp512 = sext i32 %tmp5 to i64		; <i64> [#uses=1]
	%tmp13 = getelementptr [100 x i32]* @B, i32 0, i64 %tmp512		; <i32*> [#uses=1]
	store i32 %tmp11, i32* %tmp13, align 4
	%tmp19 = load i32* %tmp8, align 4		; <i32> [#uses=1]
	%tmp20 = add i32 %tmp19, 1		; <i32> [#uses=1]
	store i32 %tmp20, i32* %tmp22, align 4
	%exitcond = icmp eq i32 %tmp5, 100		; <i1> [#uses=1]
	br i1 %exitcond, label %bb29, label %bb3

bb29:		; preds = %bb3
	%indvar.next58 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond59 = icmp eq i32 %indvar.next58, 100		; <i1> [#uses=1]
	br i1 %exitcond59, label %bb37.split, label %bb25.outer

bb37.split:		; preds = %bb29
	%tmp39 = load i32* getelementptr ([200 x i32]* @A, i32 0, i64 99), align 4		; <i32> [#uses=1]
	%tmp41 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str, i32 0, i64 0), i32 %tmp39 ) nounwind 		; <i32> [#uses=0]
	%tmp43 = load i32* getelementptr ([100 x i32]* @B, i32 0, i64 99), align 4		; <i32> [#uses=1]
	%tmp45 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str1, i32 0, i64 0), i32 %tmp43 ) nounwind 		; <i32> [#uses=0]
	%tmp47 = load i32* getelementptr ([200 x i32]* @A, i32 0, i64 100), align 4		; <i32> [#uses=1]
	ret i32 %tmp47
}

declare i32 @printf(i8*, ...) nounwind 
