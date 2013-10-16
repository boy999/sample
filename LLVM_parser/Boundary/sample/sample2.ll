; ModuleID = 'sample2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"

define float @func2(i32 %a, i32 %b) nounwind  {
entry:
	%tmp3 = icmp sgt i32 %a, %b		; <i1> [#uses=1]
	%tmp = sub i32 0, %b		; <i32> [#uses=1]
	%retval.0.in.p = select i1 %tmp3, i32 %b, i32 %tmp		; <i32> [#uses=1]
	%retval.0.in = add i32 %retval.0.in.p, %a		; <i32> [#uses=1]
	%retval.0 = sitofp i32 %retval.0.in to float		; <float> [#uses=1]
	ret float %retval.0
}

define void @func1(float* %a, i32 %m, i32 %n) nounwind  {
entry:
	%tmp2837 = icmp sgt i32 %m, 0		; <i1> [#uses=1]
	%tmp1939 = icmp sgt i32 %n, 0		; <i1> [#uses=1]
	%bothcond = and i1 %tmp2837, %tmp1939		; <i1> [#uses=1]
	br i1 %bothcond, label %bb16.preheader.split, label %return

bb16.preheader.split:		; preds = %entry
	%tmp43 = add i32 %m, -1		; <i32> [#uses=1]
	%tmp44 = icmp slt i32 %tmp43, 0		; <i1> [#uses=1]
	%tmp46 = select i1 %tmp44, i32 1, i32 %m		; <i32> [#uses=1]
	br label %bb16.outer

bb16.outer:		; preds = %bb21, %bb16.preheader.split
	%i.0.reg2mem.0.ph = phi i32 [ 0, %bb16.preheader.split ], [ %indvar.next42, %bb21 ]		; <i32> [#uses=3]
	%tmp23 = sext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=1]
	%tmp4 = getelementptr float* %a, i64 %tmp23		; <float*> [#uses=2]
	%tmp = add i32 %n, -1		; <i32> [#uses=1]
	%tmp40 = icmp slt i32 %tmp, 0		; <i1> [#uses=1]
	%tmp41 = select i1 %tmp40, i32 1, i32 %n		; <i32> [#uses=1]
	br label %bb1

bb1:		; preds = %bb1, %bb16.outer
	%j.038 = phi i32 [ 0, %bb16.outer ], [ %indvar.next, %bb1 ]		; <i32> [#uses=2]
	%tmp5 = load float* %tmp4, align 4		; <float> [#uses=1]
	%tmp8 = tail call float @func2( i32 %i.0.reg2mem.0.ph, i32 %j.038 )		; <float> [#uses=1]
	%tmp9 = add float %tmp5, %tmp8		; <float> [#uses=1]
	store float %tmp9, float* %tmp4, align 4
	%indvar.next = add i32 %j.038, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, %tmp41		; <i1> [#uses=1]
	br i1 %exitcond, label %bb21, label %bb1

bb21:		; preds = %bb1
	%indvar.next42 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond47 = icmp eq i32 %indvar.next42, %tmp46		; <i1> [#uses=1]
	br i1 %exitcond47, label %return, label %bb16.outer

return:		; preds = %bb21, %entry
	ret void
}

define i32 @main() nounwind  {
entry:
	%A = alloca [1000 x float]		; <[1000 x float]*> [#uses=2]
	%B = alloca [1000 x float]		; <[1000 x float]*> [#uses=2]
	%A1 = getelementptr [1000 x float]* %A, i32 0, i32 0		; <float*> [#uses=1]
	%B4 = getelementptr [1000 x float]* %B, i32 0, i32 0		; <float*> [#uses=1]
	br label %bb

bb:		; preds = %bb, %entry
	%indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ]		; <i32> [#uses=2]
	%tmp = mul i32 %indvar, 10		; <i32> [#uses=1]
	%k.0.reg2mem.0 = add i32 %tmp, 10		; <i32> [#uses=4]
	call void @func1( float* %A1, i32 %k.0.reg2mem.0, i32 %k.0.reg2mem.0 )
	call void @func1( float* %B4, i32 %k.0.reg2mem.0, i32 %k.0.reg2mem.0 )
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 100		; <i1> [#uses=1]
	br i1 %exitcond, label %bb13, label %bb

bb13:		; preds = %bb
	%tmp14 = getelementptr [1000 x float]* %A, i32 0, i64 0		; <float*> [#uses=1]
	%tmp15 = load float* %tmp14, align 4		; <float> [#uses=1]
	%tmp16 = getelementptr [1000 x float]* %B, i32 0, i64 0		; <float*> [#uses=1]
	%tmp17 = load float* %tmp16, align 4		; <float> [#uses=1]
	%tmp18 = add float %tmp15, %tmp17		; <float> [#uses=1]
	%tmp1819 = fptosi float %tmp18 to i32		; <i32> [#uses=1]
	ret i32 %tmp1819
}
