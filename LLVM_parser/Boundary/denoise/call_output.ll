; ModuleID = 'call_output.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
	%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
	%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
@.str = internal constant [24 x i8] c"m = %d; n = %d; p = %d\0A\00"		; <[24 x i8]*> [#uses=1]
@.str1 = internal constant [17 x i8] c"Now at denoise \0D\00"		; <[17 x i8]*> [#uses=1]
@.str2 = internal constant [11 x i8] c"iter = %d\0A\00"		; <[11 x i8]*> [#uses=1]
@.str3 = internal constant [11 x i8] c"data/T.img\00"		; <[11 x i8]*> [#uses=1]
@.str4 = internal constant [3 x i8] c"rb\00"		; <[3 x i8]*> [#uses=1]
@.str5 = internal constant [14 x i8] c"reading error\00"		; <[14 x i8]*> [#uses=1]

define void @denoise_CPU_stage1(float* %T0, float* %g, float* %u) nounwind  {
entry:
	br label %bb390.outer

bb390.outer:		; preds = %bb397, %entry
	%indvar448 = phi i32 [ 0, %entry ], [ %p.0.reg2mem.0.ph, %bb397 ]		; <i32> [#uses=1]
	%p.0.reg2mem.0.ph = add i32 %indvar448, 1		; <i32> [#uses=4]
	%tmp5 = shl i32 %p.0.reg2mem.0.ph, 4		; <i32> [#uses=1]
	br label %bb381.preheader

bb2:		; preds = %bb381.preheader, %bb2
	%indvar = phi i32 [ 0, %bb381.preheader ], [ %m.0437, %bb2 ]		; <i32> [#uses=1]
	%m.0437 = add i32 %indvar, 1		; <i32> [#uses=10]
	%tmp11 = add i32 %m.0437, %tmp9		; <i32> [#uses=1]
	%tmp2022 = sext i32 %tmp11 to i64		; <i64> [#uses=2]
	%tmp23 = getelementptr float* %u, i64 %tmp2022		; <float*> [#uses=1]
	%tmp24 = load float* %tmp23, align 4		; <float> [#uses=6]
	%tmp35 = add i32 %tmp33, %m.0437		; <i32> [#uses=1]
	%tmp3537 = sext i32 %tmp35 to i64		; <i64> [#uses=1]
	%tmp38 = getelementptr float* %u, i64 %tmp3537		; <float*> [#uses=1]
	%tmp39 = load float* %tmp38, align 4		; <float> [#uses=1]
	%tmp40 = sub float %tmp24, %tmp39		; <float> [#uses=2]
	%tmp70 = mul float %tmp40, %tmp40		; <float> [#uses=1]
	%tmp72 = add float %tmp70, 0x3F0A36E2E0000000		; <float> [#uses=1]
	%tmp96 = add i32 %tmp94, %m.0437		; <i32> [#uses=1]
	%tmp9698 = sext i32 %tmp96 to i64		; <i64> [#uses=1]
	%tmp99 = getelementptr float* %u, i64 %tmp9698		; <float*> [#uses=1]
	%tmp100 = load float* %tmp99, align 4		; <float> [#uses=1]
	%tmp101 = sub float %tmp24, %tmp100		; <float> [#uses=2]
	%tmp131 = mul float %tmp101, %tmp101		; <float> [#uses=1]
	%tmp132 = add float %tmp72, %tmp131		; <float> [#uses=1]
	%tmp155 = add i32 %tmp154444, %m.0437		; <i32> [#uses=1]
	%tmp155157 = sext i32 %tmp155 to i64		; <i64> [#uses=1]
	%tmp158 = getelementptr float* %u, i64 %tmp155157		; <float*> [#uses=1]
	%tmp159 = load float* %tmp158, align 4		; <float> [#uses=1]
	%tmp160 = sub float %tmp24, %tmp159		; <float> [#uses=2]
	%tmp189 = mul float %tmp160, %tmp160		; <float> [#uses=1]
	%tmp190 = add float %tmp132, %tmp189		; <float> [#uses=1]
	%tmp213 = add i32 %tmp212, %m.0437		; <i32> [#uses=1]
	%tmp213215 = sext i32 %tmp213 to i64		; <i64> [#uses=1]
	%tmp216 = getelementptr float* %u, i64 %tmp213215		; <float*> [#uses=1]
	%tmp217 = load float* %tmp216, align 4		; <float> [#uses=1]
	%tmp218 = sub float %tmp24, %tmp217		; <float> [#uses=2]
	%tmp247 = mul float %tmp218, %tmp218		; <float> [#uses=1]
	%tmp248 = add float %tmp190, %tmp247		; <float> [#uses=1]
	%tmp272 = add i32 %tmp270, %m.0437		; <i32> [#uses=1]
	%tmp272274 = sext i32 %tmp272 to i64		; <i64> [#uses=1]
	%tmp275 = getelementptr float* %u, i64 %tmp272274		; <float*> [#uses=1]
	%tmp276 = load float* %tmp275, align 4		; <float> [#uses=1]
	%tmp277 = sub float %tmp24, %tmp276		; <float> [#uses=2]
	%tmp307 = mul float %tmp277, %tmp277		; <float> [#uses=1]
	%tmp308 = add float %tmp248, %tmp307		; <float> [#uses=1]
	%tmp332 = add i32 %tmp330, %m.0437		; <i32> [#uses=1]
	%tmp332334 = sext i32 %tmp332 to i64		; <i64> [#uses=1]
	%tmp335 = getelementptr float* %u, i64 %tmp332334		; <float*> [#uses=1]
	%tmp336 = load float* %tmp335, align 4		; <float> [#uses=1]
	%tmp337 = sub float %tmp24, %tmp336		; <float> [#uses=2]
	%tmp367 = mul float %tmp337, %tmp337		; <float> [#uses=1]
	%tmp368 = add float %tmp308, %tmp367		; <float> [#uses=1]
	%tmp369 = tail call float @llvm.sqrt.f32( float %tmp368 )		; <float> [#uses=1]
	%tmp370 = fdiv float 1.000000e+00, %tmp369		; <float> [#uses=1]
	%tmp373 = getelementptr float* %g, i64 %tmp2022		; <float*> [#uses=1]
	store float %tmp370, float* %tmp373, align 4
	%tmp378 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([24 x i8]* @.str, i32 0, i64 0), i32 %m.0437, i32 %n.0439, i32 %p.0.reg2mem.0.ph ) nounwind 		; <i32> [#uses=0]
	%exitcond = icmp eq i32 %m.0437, 14		; <i1> [#uses=1]
	br i1 %exitcond, label %bb387, label %bb2

bb387:		; preds = %bb2
	%exitcond447 = icmp eq i32 %n.0439, 14		; <i1> [#uses=1]
	br i1 %exitcond447, label %bb397, label %bb381.preheader

bb381.preheader:		; preds = %bb387, %bb390.outer
	%indvar445 = phi i32 [ 0, %bb390.outer ], [ %n.0439, %bb387 ]		; <i32> [#uses=1]
	%n.0439 = add i32 %indvar445, 1		; <i32> [#uses=4]
	%tmp7 = add i32 %tmp5, %n.0439		; <i32> [#uses=1]
	%tmp9 = shl i32 %tmp7, 4		; <i32> [#uses=7]
	%tmp33 = add i32 %tmp9, 16		; <i32> [#uses=1]
	%tmp94 = add i32 %tmp9, -16		; <i32> [#uses=1]
	%tmp154444 = or i32 %tmp9, 1		; <i32> [#uses=1]
	%tmp212 = add i32 %tmp9, -1		; <i32> [#uses=1]
	%tmp270 = add i32 %tmp9, 256		; <i32> [#uses=1]
	%tmp330 = add i32 %tmp9, -256		; <i32> [#uses=1]
	br label %bb2

bb397:		; preds = %bb387
	%exitcond450 = icmp eq i32 %p.0.reg2mem.0.ph, 14		; <i1> [#uses=1]
	br i1 %exitcond450, label %return.split, label %bb390.outer

return.split:		; preds = %bb397
	ret void
}

declare float @llvm.sqrt.f32(float) nounwind readnone 

declare i32 @printf(i8*, ...) nounwind 

define void @denoise_CPU_stage2(float* %T0, float* %g, float* %u) nounwind  {
entry:
	br label %bb404.outer

bb404.outer:		; preds = %bb411, %entry
	%indvar461 = phi i32 [ 0, %entry ], [ %p.0.reg2mem.0.ph, %bb411 ]		; <i32> [#uses=1]
	%p.0.reg2mem.0.ph = add i32 %indvar461, 1		; <i32> [#uses=4]
	%tmp13 = shl i32 %p.0.reg2mem.0.ph, 4		; <i32> [#uses=1]
	br label %bb395.preheader

bb10:		; preds = %bb395.preheader, %bb10
	%indvar = phi i32 [ 0, %bb395.preheader ], [ %m.0449, %bb10 ]		; <i32> [#uses=1]
	%m.0449 = add i32 %indvar, 1		; <i32> [#uses=10]
	%tmp19 = add i32 %m.0449, %tmp17		; <i32> [#uses=1]
	%tmp1921 = sext i32 %tmp19 to i64		; <i64> [#uses=2]
	%tmp22 = getelementptr float* %u, i64 %tmp1921		; <float*> [#uses=2]
	%tmp23 = load float* %tmp22, align 4		; <float> [#uses=2]
	%tmp35 = getelementptr float* %T0, i64 %tmp1921		; <float*> [#uses=1]
	%tmp36 = load float* %tmp35, align 4		; <float> [#uses=2]
	%tmp37 = mul float %tmp23, %tmp36		; <float> [#uses=1]
	%tmp39 = fdiv float %tmp37, 0x3F647AE160000000		; <float> [#uses=6]
	%tmp41 = add float %tmp39, 0x3FEE66B400000000		; <float> [#uses=1]
	%tmp43 = mul float %tmp41, %tmp39		; <float> [#uses=1]
	%tmp44 = add float %tmp43, 0x40031D92C0000000		; <float> [#uses=1]
	%tmp46 = mul float %tmp44, %tmp39		; <float> [#uses=1]
	%tmp48 = add float %tmp39, 0x3FF7D475A0000000		; <float> [#uses=1]
	%tmp50 = mul float %tmp48, %tmp39		; <float> [#uses=1]
	%tmp51 = add float %tmp50, 0x40049A7080000000		; <float> [#uses=1]
	%tmp53 = mul float %tmp51, %tmp39		; <float> [#uses=1]
	%tmp54 = add float %tmp53, 0x40129CD0C0000000		; <float> [#uses=1]
	%tmp55 = fdiv float %tmp46, %tmp54		; <float> [#uses=1]
	%tmp88 = add i32 %tmp86, %m.0449		; <i32> [#uses=1]
	%tmp8890 = sext i32 %tmp88 to i64		; <i64> [#uses=2]
	%tmp91 = getelementptr float* %u, i64 %tmp8890		; <float*> [#uses=1]
	%tmp92 = load float* %tmp91, align 4		; <float> [#uses=1]
	%tmp106 = getelementptr float* %g, i64 %tmp8890		; <float*> [#uses=1]
	%tmp107 = load float* %tmp106, align 4		; <float> [#uses=2]
	%tmp108 = mul float %tmp92, %tmp107		; <float> [#uses=1]
	%tmp119 = add i32 %tmp117, %m.0449		; <i32> [#uses=1]
	%tmp119121 = sext i32 %tmp119 to i64		; <i64> [#uses=2]
	%tmp122 = getelementptr float* %u, i64 %tmp119121		; <float*> [#uses=1]
	%tmp123 = load float* %tmp122, align 4		; <float> [#uses=1]
	%tmp137 = getelementptr float* %g, i64 %tmp119121		; <float*> [#uses=1]
	%tmp138 = load float* %tmp137, align 4		; <float> [#uses=2]
	%tmp139 = mul float %tmp123, %tmp138		; <float> [#uses=1]
	%tmp140 = add float %tmp108, %tmp139		; <float> [#uses=1]
	%tmp150 = add i32 %tmp149457, %m.0449		; <i32> [#uses=1]
	%tmp150152 = sext i32 %tmp150 to i64		; <i64> [#uses=2]
	%tmp153 = getelementptr float* %u, i64 %tmp150152		; <float*> [#uses=1]
	%tmp154 = load float* %tmp153, align 4		; <float> [#uses=1]
	%tmp167 = getelementptr float* %g, i64 %tmp150152		; <float*> [#uses=1]
	%tmp168 = load float* %tmp167, align 4		; <float> [#uses=2]
	%tmp169 = mul float %tmp154, %tmp168		; <float> [#uses=1]
	%tmp170 = add float %tmp140, %tmp169		; <float> [#uses=1]
	%tmp180 = add i32 %tmp179, %m.0449		; <i32> [#uses=1]
	%tmp180182 = sext i32 %tmp180 to i64		; <i64> [#uses=2]
	%tmp183 = getelementptr float* %u, i64 %tmp180182		; <float*> [#uses=1]
	%tmp184 = load float* %tmp183, align 4		; <float> [#uses=1]
	%tmp197 = getelementptr float* %g, i64 %tmp180182		; <float*> [#uses=1]
	%tmp198 = load float* %tmp197, align 4		; <float> [#uses=2]
	%tmp199 = mul float %tmp184, %tmp198		; <float> [#uses=1]
	%tmp200 = add float %tmp170, %tmp199		; <float> [#uses=1]
	%tmp211 = add i32 %tmp209, %m.0449		; <i32> [#uses=1]
	%tmp211213 = sext i32 %tmp211 to i64		; <i64> [#uses=2]
	%tmp214 = getelementptr float* %u, i64 %tmp211213		; <float*> [#uses=1]
	%tmp215 = load float* %tmp214, align 4		; <float> [#uses=1]
	%tmp229 = getelementptr float* %g, i64 %tmp211213		; <float*> [#uses=1]
	%tmp230 = load float* %tmp229, align 4		; <float> [#uses=2]
	%tmp231 = mul float %tmp215, %tmp230		; <float> [#uses=1]
	%tmp232 = add float %tmp200, %tmp231		; <float> [#uses=1]
	%tmp243 = add i32 %tmp241, %m.0449		; <i32> [#uses=1]
	%tmp243245 = sext i32 %tmp243 to i64		; <i64> [#uses=2]
	%tmp246 = getelementptr float* %u, i64 %tmp243245		; <float*> [#uses=1]
	%tmp247 = load float* %tmp246, align 4		; <float> [#uses=1]
	%tmp261 = getelementptr float* %g, i64 %tmp243245		; <float*> [#uses=1]
	%tmp262 = load float* %tmp261, align 4		; <float> [#uses=2]
	%tmp263 = mul float %tmp247, %tmp262		; <float> [#uses=1]
	%tmp264 = add float %tmp232, %tmp263		; <float> [#uses=1]
	%tmp279 = mul float %tmp36, 0x4039FFFFE0000000		; <float> [#uses=1]
	%tmp281 = mul float %tmp279, %tmp55		; <float> [#uses=1]
	%tmp282 = add float %tmp264, %tmp281		; <float> [#uses=1]
	%tmp284 = mul float %tmp282, 5.000000e+00		; <float> [#uses=1]
	%tmp285 = add float %tmp23, %tmp284		; <float> [#uses=1]
	%tmp316 = add float %tmp107, %tmp138		; <float> [#uses=1]
	%tmp331 = add float %tmp316, %tmp168		; <float> [#uses=1]
	%tmp346 = add float %tmp331, %tmp198		; <float> [#uses=1]
	%tmp362 = add float %tmp346, %tmp230		; <float> [#uses=1]
	%tmp378 = add float %tmp362, %tmp262		; <float> [#uses=1]
	%tmp380 = add float %tmp378, 0x4039FFFFE0000000		; <float> [#uses=1]
	%tmp382 = mul float %tmp380, 5.000000e+00		; <float> [#uses=1]
	%tmp383 = add float %tmp382, 1.000000e+00		; <float> [#uses=1]
	%tmp384 = fdiv float %tmp285, %tmp383		; <float> [#uses=1]
	store float %tmp384, float* %tmp22, align 4
	%tmp392 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([24 x i8]* @.str, i32 0, i64 0), i32 %m.0449, i32 %n.0451, i32 %p.0.reg2mem.0.ph ) nounwind 		; <i32> [#uses=0]
	%exitcond = icmp eq i32 %m.0449, 14		; <i1> [#uses=1]
	br i1 %exitcond, label %bb401, label %bb10

bb401:		; preds = %bb10
	%exitcond460 = icmp eq i32 %n.0451, 14		; <i1> [#uses=1]
	br i1 %exitcond460, label %bb411, label %bb395.preheader

bb395.preheader:		; preds = %bb401, %bb404.outer
	%indvar458 = phi i32 [ 0, %bb404.outer ], [ %n.0451, %bb401 ]		; <i32> [#uses=1]
	%n.0451 = add i32 %indvar458, 1		; <i32> [#uses=4]
	%tmp15 = add i32 %tmp13, %n.0451		; <i32> [#uses=1]
	%tmp17 = shl i32 %tmp15, 4		; <i32> [#uses=7]
	%tmp86 = add i32 %tmp17, 16		; <i32> [#uses=1]
	%tmp117 = add i32 %tmp17, -16		; <i32> [#uses=1]
	%tmp149457 = or i32 %tmp17, 1		; <i32> [#uses=1]
	%tmp179 = add i32 %tmp17, -1		; <i32> [#uses=1]
	%tmp209 = add i32 %tmp17, 256		; <i32> [#uses=1]
	%tmp241 = add i32 %tmp17, -256		; <i32> [#uses=1]
	br label %bb10

bb411:		; preds = %bb401
	%exitcond463 = icmp eq i32 %p.0.reg2mem.0.ph, 14		; <i1> [#uses=1]
	br i1 %exitcond463, label %return.split, label %bb404.outer

return.split:		; preds = %bb411
	ret void
}

define void @denoise(float* %T0) {
entry:
	%tmp1 = tail call i32 @puts( i8* getelementptr ([17 x i8]* @.str1, i32 0, i64 0) )		; <i32> [#uses=0]
	%tmp9 = tail call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=4]
	%tmp910 = bitcast i8* %tmp9 to float*		; <float*> [#uses=6]
	%tmp2123 = bitcast float* %T0 to i8*		; <i8*> [#uses=2]
	tail call void @llvm.memcpy.i64( i8* %tmp9, i8* %tmp2123, i64 16384, i32 4 )
	%tmp30 = tail call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp3031 = bitcast i8* %tmp30 to float*		; <float*> [#uses=6]
	tail call void @denoise_CPU_stage1( float* %T0, float* %tmp3031, float* %tmp910 )
	tail call void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	%tmp40 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str2, i32 0, i64 0), i32 0 ) nounwind 		; <i32> [#uses=0]
	tail call void @denoise_CPU_stage1( float* %T0, float* %tmp3031, float* %tmp910 )
	tail call void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	%tmp40.1 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str2, i32 0, i64 0), i32 1 ) nounwind 		; <i32> [#uses=0]
	tail call void @denoise_CPU_stage1( float* %T0, float* %tmp3031, float* %tmp910 )
	tail call void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	%tmp40.2 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str2, i32 0, i64 0), i32 2 ) nounwind 		; <i32> [#uses=0]
	tail call void @llvm.memcpy.i64( i8* %tmp2123, i8* %tmp9, i64 16384, i32 4 )
	free i8* %tmp9
	free i8* %tmp30
	ret void
}

declare i32 @puts(i8*)

declare i8* @calloc(i64, i64) nounwind 

declare void @llvm.memcpy.i64(i8*, i8*, i64, i32) nounwind 

define i32 @main(i32 %argc, i8** %argv) {
entry:
	%num = alloca i16		; <i16*> [#uses=2]
	%tmp8 = call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp89 = bitcast i8* %tmp8 to float*		; <float*> [#uses=1]
	%tmp16 = call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp1617 = bitcast i8* %tmp16 to float*		; <float*> [#uses=1]
	%tmp20 = call %struct.FILE* @fopen( i8* noalias  getelementptr ([11 x i8]* @.str3, i32 0, i64 0), i8* noalias  getelementptr ([3 x i8]* @.str4, i32 0, i64 0) )		; <%struct.FILE*> [#uses=3]
	%tmp22 = icmp eq %struct.FILE* %tmp20, null		; <i1> [#uses=1]
	br i1 %tmp22, label %cond_true, label %bb70.preheader

bb70.preheader:		; preds = %entry
	%num28 = bitcast i16* %num to i8*		; <i8*> [#uses=1]
	br label %bb60.preheader

cond_true:		; preds = %entry
	%tmp25 = call i32 @puts( i8* getelementptr ([14 x i8]* @.str5, i32 0, i64 0) )		; <i32> [#uses=0]
	ret i32 1

bb27:		; preds = %bb51.preheader, %bb27
	%i.093 = phi i32 [ 0, %bb51.preheader ], [ %indvar.next, %bb27 ]		; <i32> [#uses=2]
	%tmp30 = call i64 @fread( i8* noalias  %num28, i64 2, i64 1, %struct.FILE* noalias  %tmp20 )		; <i64> [#uses=0]
	%tmp31 = load i16* %num, align 2		; <i16> [#uses=1]
	%tmp3132 = uitofp i16 %tmp31 to float		; <float> [#uses=1]
	%tmp34 = fdiv float %tmp3132, 8.180000e+03		; <float> [#uses=1]
	%tmp35 = mul float %tmp34, 2.550000e+02		; <float> [#uses=1]
	%tmp38 = shl i32 %i.093, 4		; <i32> [#uses=1]
	%tmp40 = add i32 %tmp38, %j.095		; <i32> [#uses=1]
	%tmp42 = shl i32 %tmp40, 4		; <i32> [#uses=1]
	%tmp44 = add i32 %tmp42, %k.098		; <i32> [#uses=1]
	%tmp4446 = sext i32 %tmp44 to i64		; <i64> [#uses=1]
	%tmp47 = getelementptr float* %tmp89, i64 %tmp4446		; <float*> [#uses=1]
	store float %tmp35, float* %tmp47, align 4
	%indvar.next = add i32 %i.093, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 16		; <i1> [#uses=1]
	br i1 %exitcond, label %bb57, label %bb27

bb57:		; preds = %bb27
	%indvar.next103 = add i32 %j.095, 1		; <i32> [#uses=2]
	%exitcond104 = icmp eq i32 %indvar.next103, 16		; <i1> [#uses=1]
	br i1 %exitcond104, label %bb66, label %bb51.preheader

bb51.preheader:		; preds = %bb60.preheader, %bb57
	%j.095 = phi i32 [ 0, %bb60.preheader ], [ %indvar.next103, %bb57 ]		; <i32> [#uses=2]
	br label %bb27

bb66:		; preds = %bb57
	%indvar.next105 = add i32 %k.098, 1		; <i32> [#uses=2]
	%exitcond106 = icmp eq i32 %indvar.next105, 16		; <i1> [#uses=1]
	br i1 %exitcond106, label %bb76, label %bb60.preheader

bb60.preheader:		; preds = %bb66, %bb70.preheader
	%k.098 = phi i32 [ 0, %bb70.preheader ], [ %indvar.next105, %bb66 ]		; <i32> [#uses=2]
	br label %bb51.preheader

bb76:		; preds = %bb66
	%tmp78 = call i32 @fclose( %struct.FILE* %tmp20 )		; <i32> [#uses=0]
	call void @llvm.memcpy.i64( i8* %tmp16, i8* %tmp8, i64 16384, i32 4 )
	call void @denoise( float* %tmp1617 )
	ret i32 0
}

declare %struct.FILE* @fopen(i8* noalias , i8* noalias )

declare i64 @fread(i8* noalias , i64, i64, %struct.FILE* noalias )

declare i32 @fclose(%struct.FILE*)
