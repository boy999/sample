; ModuleID = 'call_output2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
@cg_caller_id_var = weak global i32 1		; <i32*> [#uses=22]
@cg_caller_call_site_var = weak global i32 0		; <i32*> [#uses=16]

define float @func2(i32 %a, i32 %b) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 1, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 1 )
	%tmp3 = icmp sgt i32 %a, %b		; <i1> [#uses=1]
	%tmp = sub i32 0, %b		; <i32> [#uses=1]
	%retval.0.in.p = select i1 %tmp3, i32 %b, i32 %tmp		; <i32> [#uses=1]
	%retval.0.in = add i32 %retval.0.in.p, %a		; <i32> [#uses=1]
	%retval.0 = sitofp i32 %retval.0.in to float		; <float> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret float %retval.0
}

define void @func1(float* %a, i32 %m, i32 %n, i32 %p) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 2, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 2 )
	%tmp4049 = icmp sgt i32 %m, 0		; <i1> [#uses=1]
	br i1 %tmp4049, label %bb27.preheader, label %return

bb27.preheader:		; preds = %entry
	%tmp3053 = icmp sgt i32 %n, 0		; <i1> [#uses=1]
	%tmp2251 = icmp sgt i32 %p, 0		; <i1> [#uses=1]
	br i1 %tmp3053, label %bb27.preheader.split, label %return

bb27.preheader.split:		; preds = %bb27.preheader
	%tmp64 = add i32 %m, -1		; <i32> [#uses=1]
	%tmp65 = icmp slt i32 %tmp64, 0		; <i1> [#uses=1]
	%tmp67 = select i1 %tmp65, i32 1, i32 %m		; <i32> [#uses=1]
	br label %bb27.outer

bb27.outer:		; preds = %bb33, %bb27.preheader.split
	%i.0.reg2mem.0.ph = phi i32 [ 0, %bb27.preheader.split ], [ %indvar.next63, %bb33 ]		; <i32> [#uses=3]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 4, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 4 )
	%tmp34 = sext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=1]
	%tmp5 = getelementptr float* %a, i64 %tmp34		; <float*> [#uses=2]
	br i1 %tmp2251, label %bb.nph54.split, label %bb33

bb2:		; preds = %bb19.preheader, %bb2
	%k.050 = phi i32 [ 0, %bb19.preheader ], [ %indvar.next, %bb2 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 6, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 6 )
	%tmp6 = load float* %tmp5, align 4		; <float> [#uses=1]
	%tmp9 = add i32 %k.050, %j.052		; <i32> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 5, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 6, i32* @cg_caller_id_var, align 4
	%tmp11 = tail call float @func2( i32 %i.0.reg2mem.0.ph, i32 %tmp9 )		; <float> [#uses=1]
	%tmp12 = add float %tmp6, %tmp11		; <float> [#uses=1]
	store float %tmp12, float* %tmp5, align 4
	%indvar.next = add i32 %k.050, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, %tmp56		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb24, label %bb2

bb24:		; preds = %bb2
	%indvar.next57 = add i32 %j.052, 1		; <i32> [#uses=2]
	%exitcond62 = icmp eq i32 %indvar.next57, %tmp61		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond62, label %bb33, label %bb19.preheader

bb.nph54.split:		; preds = %bb27.outer
	%tmp58 = add i32 %n, -1		; <i32> [#uses=1]
	%tmp59 = icmp slt i32 %tmp58, 0		; <i1> [#uses=1]
	%tmp61 = select i1 %tmp59, i32 1, i32 %n		; <i32> [#uses=1]
	br label %bb19.preheader

bb19.preheader:		; preds = %bb.nph54.split, %bb24
	%j.052 = phi i32 [ 0, %bb.nph54.split ], [ %indvar.next57, %bb24 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 5, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 5 )
	%tmp = add i32 %p, -1		; <i32> [#uses=1]
	%tmp55 = icmp slt i32 %tmp, 0		; <i1> [#uses=1]
	%tmp56 = select i1 %tmp55, i32 1, i32 %p		; <i32> [#uses=1]
	br label %bb2

bb33:		; preds = %bb24, %bb27.outer
	%indvar.next63 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond68 = icmp eq i32 %indvar.next63, %tmp67		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond68, label %return, label %bb27.outer

return:		; preds = %bb33, %bb27.preheader, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define i32 @main() nounwind  {
entry:
	store i32 3, i32* @cg_caller_id_var, align 4
	%A = alloca [10 x float]		; <[10 x float]*> [#uses=2]
	%B = alloca [100 x float]		; <[100 x float]*> [#uses=2]
	%A1 = getelementptr [10 x float]* %A, i32 0, i32 0		; <float*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	call void @func1( float* %A1, i32 10, i32 10, i32 10 )
	%B2 = getelementptr [100 x float]* %B, i32 0, i32 0		; <float*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	call void @func1( float* %B2, i32 100, i32 100, i32 100 )
	%tmp3 = getelementptr [10 x float]* %A, i32 0, i64 0		; <float*> [#uses=1]
	%tmp4 = load float* %tmp3, align 4		; <float> [#uses=1]
	%tmp5 = getelementptr [100 x float]* %B, i32 0, i64 0		; <float*> [#uses=1]
	%tmp6 = load float* %tmp5, align 4		; <float> [#uses=1]
	%tmp7 = add float %tmp4, %tmp6		; <float> [#uses=1]
	%tmp78 = fptosi float %tmp7 to i32		; <i32> [#uses=1]
	call void @CallProfPrinter( )
	ret i32 %tmp78
}

declare void @CallEdgeProfiler(i32, i32, i32)

declare void @CallProfPrinter()
