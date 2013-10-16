; ModuleID = 'call_output2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
	%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
	%struct.MAIN_Param = type { i32, i8*, i32, i32, i8* }
	%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
	%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
	%struct.timespec = type { i64, i64 }
@.str = internal constant [49 x i8] c"LBM_allocateGrid: could not allocate %.1f MByte\0A\00"		; <[49 x i8]*> [#uses=1]
@.str1 = internal constant [3 x i8] c"rb\00"		; <[3 x i8]*> [#uses=1]
@.str2 = internal constant [138 x i8] c"LBM_showGridStatistics:\0A\09nObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\0A\09minRho: %8.4f maxRho: %8.4f mass: %e\0A\09minU: %e maxU: %e\0A\0A\00"		; <[138 x i8]*> [#uses=1]
@.str6 = internal constant [43 x i8] c"LBM_compareVelocityField: maxDiff = %e  \0A\0A\00"		; <[43 x i8]*> [#uses=1]
@.str7 = internal constant [3 x i8] c"wb\00"		; <[3 x i8]*> [#uses=1]
@actionString.2842 = internal constant [3 x [32 x i8]] [ [32 x i8] c"nothing\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"compare\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"store\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" ], align 32		; <[3 x [32 x i8]]*> [#uses=1]
@simTypeString.2843 = internal constant [3 x [32 x i8]] [ [32 x i8] c"lid-driven cavity\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"channel flow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] zeroinitializer ], align 32		; <[3 x [32 x i8]]*> [#uses=1]
@.str4 = internal constant [7 x i8] c"<none>\00"		; <[7 x i8]*> [#uses=1]
@.str15 = internal constant [174 x i8] c"MAIN_printInfo:\0A\09grid size      : %i x %i x %i = %.2f * 10^6 Cells\0A\09nTimeSteps     : %i\0A\09result file    : %s\0A\09action         : %s\0A\09simulation type: %s\0A\09obstacle file  : %s\0A\0A\00"		; <[174 x i8]*> [#uses=1]
@srcGrid = internal global [26000000 x double]* null		; <[26000000 x double]**> [#uses=14]
@dstGrid = internal global [26000000 x double]* null		; <[26000000 x double]**> [#uses=11]
@.str26 = internal constant [108 x i8] c"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]\00"		; <[108 x i8]*> [#uses=1]
@.str37 = internal constant [55 x i8] c"MAIN_parseCommandLine: cannot stat obstacle file '%s'\0A\00"		; <[55 x i8]*> [#uses=1]
@.str48 = internal constant [82 x i8] c"MAIN_parseCommandLine:\0A\09size of file '%s' is %i bytes\0A\09expected size is %i bytes\0A\00"		; <[82 x i8]*> [#uses=1]
@.str59 = internal constant [53 x i8] c"MAIN_parseCommandLine: cannot stat result file '%s'\0A\00"		; <[53 x i8]*> [#uses=1]
@.str610 = internal constant [14 x i8] c"timestep: %i\0A\00"		; <[14 x i8]*> [#uses=1]
@cg_caller_id_var = weak global i32 1		; <i32*> [#uses=181]
@cg_caller_call_site_var = weak global i32 0		; <i32*> [#uses=149]

declare i32 @printf(i8*, ...) nounwind 

declare void @exit(i32) noreturn nounwind 

define internal fastcc void @LBM_initializeGrid(double* %grid) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 1, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 1 )
	br label %bb

bb:		; preds = %bb, %entry
	%indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 8, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 8 )
	%tmp = mul i32 %indvar, 20		; <i32> [#uses=20]
	%i.0.reg2mem.0 = add i32 %tmp, -400000		; <i32> [#uses=1]
	%tmp12 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp3 = getelementptr double* %grid, i64 %tmp12		; <double*> [#uses=1]
	store double 0x3FD5555555555555, double* %tmp3, align 8
	%tmp5 = add i32 %tmp, -399999		; <i32> [#uses=1]
	%tmp57 = sext i32 %tmp5 to i64		; <i64> [#uses=1]
	%tmp8 = getelementptr double* %grid, i64 %tmp57		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp8, align 8
	%tmp10 = add i32 %tmp, -399998		; <i32> [#uses=1]
	%tmp1012 = sext i32 %tmp10 to i64		; <i64> [#uses=1]
	%tmp13 = getelementptr double* %grid, i64 %tmp1012		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp13, align 8
	%tmp15 = add i32 %tmp, -399997		; <i32> [#uses=1]
	%tmp1517 = sext i32 %tmp15 to i64		; <i64> [#uses=1]
	%tmp18 = getelementptr double* %grid, i64 %tmp1517		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp18, align 8
	%tmp20 = add i32 %tmp, -399996		; <i32> [#uses=1]
	%tmp2022 = sext i32 %tmp20 to i64		; <i64> [#uses=1]
	%tmp23 = getelementptr double* %grid, i64 %tmp2022		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp23, align 8
	%tmp25 = add i32 %tmp, -399995		; <i32> [#uses=1]
	%tmp2527 = sext i32 %tmp25 to i64		; <i64> [#uses=1]
	%tmp28 = getelementptr double* %grid, i64 %tmp2527		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp28, align 8
	%tmp30 = add i32 %tmp, -399994		; <i32> [#uses=1]
	%tmp3032 = sext i32 %tmp30 to i64		; <i64> [#uses=1]
	%tmp33 = getelementptr double* %grid, i64 %tmp3032		; <double*> [#uses=1]
	store double 0x3FAC71C71C71C71C, double* %tmp33, align 8
	%tmp35 = add i32 %tmp, -399993		; <i32> [#uses=1]
	%tmp3537 = sext i32 %tmp35 to i64		; <i64> [#uses=1]
	%tmp38 = getelementptr double* %grid, i64 %tmp3537		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp38, align 8
	%tmp40 = add i32 %tmp, -399992		; <i32> [#uses=1]
	%tmp4042 = sext i32 %tmp40 to i64		; <i64> [#uses=1]
	%tmp43 = getelementptr double* %grid, i64 %tmp4042		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp43, align 8
	%tmp45 = add i32 %tmp, -399991		; <i32> [#uses=1]
	%tmp4547 = sext i32 %tmp45 to i64		; <i64> [#uses=1]
	%tmp48 = getelementptr double* %grid, i64 %tmp4547		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp48, align 8
	%tmp50 = add i32 %tmp, -399990		; <i32> [#uses=1]
	%tmp5052 = sext i32 %tmp50 to i64		; <i64> [#uses=1]
	%tmp53 = getelementptr double* %grid, i64 %tmp5052		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp53, align 8
	%tmp55 = add i32 %tmp, -399989		; <i32> [#uses=1]
	%tmp5557 = sext i32 %tmp55 to i64		; <i64> [#uses=1]
	%tmp58 = getelementptr double* %grid, i64 %tmp5557		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp58, align 8
	%tmp60 = add i32 %tmp, -399988		; <i32> [#uses=1]
	%tmp6062 = sext i32 %tmp60 to i64		; <i64> [#uses=1]
	%tmp63 = getelementptr double* %grid, i64 %tmp6062		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp63, align 8
	%tmp65 = add i32 %tmp, -399987		; <i32> [#uses=1]
	%tmp6567 = sext i32 %tmp65 to i64		; <i64> [#uses=1]
	%tmp68 = getelementptr double* %grid, i64 %tmp6567		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp68, align 8
	%tmp70 = add i32 %tmp, -399986		; <i32> [#uses=1]
	%tmp7072 = sext i32 %tmp70 to i64		; <i64> [#uses=1]
	%tmp73 = getelementptr double* %grid, i64 %tmp7072		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp73, align 8
	%tmp75 = add i32 %tmp, -399985		; <i32> [#uses=1]
	%tmp7577 = sext i32 %tmp75 to i64		; <i64> [#uses=1]
	%tmp78 = getelementptr double* %grid, i64 %tmp7577		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp78, align 8
	%tmp80 = add i32 %tmp, -399984		; <i32> [#uses=1]
	%tmp8082 = sext i32 %tmp80 to i64		; <i64> [#uses=1]
	%tmp83 = getelementptr double* %grid, i64 %tmp8082		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp83, align 8
	%tmp85 = add i32 %tmp, -399983		; <i32> [#uses=1]
	%tmp8587 = sext i32 %tmp85 to i64		; <i64> [#uses=1]
	%tmp88 = getelementptr double* %grid, i64 %tmp8587		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp88, align 8
	%tmp90 = add i32 %tmp, -399982		; <i32> [#uses=1]
	%tmp9092 = sext i32 %tmp90 to i64		; <i64> [#uses=1]
	%tmp93 = getelementptr double* %grid, i64 %tmp9092		; <double*> [#uses=1]
	store double 0x3F9C71C71C71C71C, double* %tmp93, align 8
	%tmp95 = add i32 %tmp, -399981		; <i32> [#uses=1]
	%tmp9597 = sext i32 %tmp95 to i64		; <i64> [#uses=1]
	%tmp98 = getelementptr double* %grid, i64 %tmp9597		; <double*> [#uses=1]
	%tmp9899 = bitcast double* %tmp98 to i32*		; <i32*> [#uses=1]
	store i32 0, i32* %tmp9899, align 4
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 1340000		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %return, label %bb

return:		; preds = %bb
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @LBM_loadObstacleFile(double* %grid, i8* %filename) {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 2, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 2 )
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	%tmp2 = tail call %struct.FILE* @fopen( i8* noalias  %filename, i8* noalias  getelementptr ([3 x i8]* @.str1, i32 0, i64 0) )		; <%struct.FILE*> [#uses=4]
	br label %bb38.outer

bb38.outer:		; preds = %bb43, %entry
	%z.0.reg2mem.0.ph = phi i32 [ 0, %entry ], [ %indvar.next70, %bb43 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 9, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 9 )
	%tmp12 = mul i32 %z.0.reg2mem.0.ph, 10000		; <i32> [#uses=1]
	br label %bb28.preheader.us

bb28.preheader.us:		; preds = %bb33.us, %bb38.outer
	%y.064.us = phi i32 [ 0, %bb38.outer ], [ %indvar.next68, %bb33.us ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 10, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 10 )
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 9, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 10, i32* @cg_caller_id_var, align 4
	%tmp662.us = tail call i32 @fgetc( %struct.FILE* %tmp2 )		; <i32> [#uses=1]
	%tmp10.us = mul i32 %y.064.us, 100		; <i32> [#uses=1]
	%tmp13.us = add i32 %tmp10.us, %tmp12		; <i32> [#uses=1]
	br label %bb4.us

bb33.us:		; preds = %cond_next.us
	%indvar.next68 = add i32 %y.064.us, 1		; <i32> [#uses=2]
	%exitcond69 = icmp eq i32 %indvar.next68, 100		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond69, label %bb43, label %bb28.preheader.us

cond_next.us:		; preds = %bb4.us, %cond_true.us
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 9, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 10, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 11, i32* @cg_caller_id_var, align 4
	%tmp6.us = tail call i32 @fgetc( %struct.FILE* %tmp2 )		; <i32> [#uses=1]
	%indvar.next = add i32 %x.060.us, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 100		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb33.us, label %bb4.us

cond_true.us:		; preds = %bb4.us
	%tmp15.us = add i32 %tmp13.us, %x.060.us		; <i32> [#uses=1]
	%tmp16.us = mul i32 %tmp15.us, 20		; <i32> [#uses=1]
	%tmp17.us = add i32 %tmp16.us, 19		; <i32> [#uses=1]
	%tmp1719.us = sext i32 %tmp17.us to i64		; <i64> [#uses=1]
	%tmp20.us = getelementptr double* %grid, i64 %tmp1719.us		; <double*> [#uses=1]
	%tmp2021.us = bitcast double* %tmp20.us to i32*		; <i32*> [#uses=2]
	%tmp23.us = load i32* %tmp2021.us, align 4		; <i32> [#uses=1]
	%tmp24.us = or i32 %tmp23.us, 1		; <i32> [#uses=1]
	store i32 %tmp24.us, i32* %tmp2021.us, align 4
	br label %cond_next.us

bb4.us:		; preds = %cond_next.us, %bb28.preheader.us
	%x.060.us = phi i32 [ 0, %bb28.preheader.us ], [ %indvar.next, %cond_next.us ]		; <i32> [#uses=2]
	%tmp663.us = phi i32 [ %tmp662.us, %bb28.preheader.us ], [ %tmp6.us, %cond_next.us ]		; <i32> [#uses=1]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 11, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 11 )
	%tmp7.us = icmp eq i32 %tmp663.us, 46		; <i1> [#uses=1]
	br i1 %tmp7.us, label %cond_next.us, label %cond_true.us

bb43:		; preds = %bb33.us
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 9, i32* @cg_caller_id_var, align 4
	%tmp45 = tail call i32 @fgetc( %struct.FILE* %tmp2 )		; <i32> [#uses=0]
	%indvar.next70 = add i32 %z.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond71 = icmp eq i32 %indvar.next70, 130		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond71, label %bb53, label %bb38.outer

bb53:		; preds = %bb43
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	%tmp55 = tail call i32 @fclose( %struct.FILE* %tmp2 )		; <i32> [#uses=0]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare %struct.FILE* @fopen(i8* noalias , i8* noalias )

declare i32 @fgetc(%struct.FILE*)

declare i32 @fclose(%struct.FILE*)

define internal fastcc void @LBM_initializeSpecialCellsForLDC(double* %grid) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 3, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 3 )
	br label %bb124.outer

bb124.outer:		; preds = %bb129, %entry
	%indvar211 = phi i32 [ 0, %entry ], [ %indvar.next212, %bb129 ]		; <i32> [#uses=3]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 12, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 12 )
	%tmp215 = mul i32 %indvar211, 10000		; <i32> [#uses=1]
	%tmp40 = add i32 %tmp215, -20000		; <i32> [#uses=1]
	br label %bb116.preheader

bb2:		; preds = %bb2.preheader, %bb36
	%indvar206 = phi i32 [ %indvar.next207, %bb36 ], [ 0, %bb2.preheader ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 15, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 15 )
	%x.0.reg2mem.0 = add i32 %indvar206, %x.0		; <i32> [#uses=6]
	switch i32 %x.0.reg2mem.0, label %cond_next [
		 i32 0, label %bb36
		 i32 99, label %bb36
	]

cond_next:		; preds = %bb2
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	switch i32 %indvar211, label %bb113 [
		 i32 2, label %bb36
		 i32 131, label %bb36
		 i32 3, label %cond_true66
		 i32 130, label %cond_true66
	]

bb36:		; preds = %cond_next, %cond_next, %bb2, %bb2
	%tmp43 = add i32 %tmp41, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp44 = mul i32 %tmp43, 20		; <i32> [#uses=1]
	%tmp45 = add i32 %tmp44, 19		; <i32> [#uses=1]
	%tmp4547 = sext i32 %tmp45 to i64		; <i64> [#uses=1]
	%tmp48 = getelementptr double* %grid, i64 %tmp4547		; <double*> [#uses=1]
	%tmp4849 = bitcast double* %tmp48 to i32*		; <i32*> [#uses=2]
	%tmp51 = load i32* %tmp4849, align 4		; <i32> [#uses=1]
	%tmp52 = or i32 %tmp51, 1		; <i32> [#uses=1]
	store i32 %tmp52, i32* %tmp4849, align 4
	%tmp115144 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp118152 = icmp slt i32 %tmp115144, 100		; <i1> [#uses=1]
	%indvar.next207 = add i32 %indvar206, 1		; <i32> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp118152, label %bb2, label %bb121

cond_true66:		; preds = %cond_next, %cond_next
	%x.0.off = add i32 %x.0.reg2mem.0, -2		; <i32> [#uses=1]
	%tmp76 = icmp ult i32 %x.0.off, 96		; <i1> [#uses=1]
	%brmerge.demorgan = and i1 %tmp76, %tmp88		; <i1> [#uses=1]
	br i1 %brmerge.demorgan, label %cond_true91, label %bb113

cond_true91:		; preds = %cond_true66
	%tmp99 = add i32 %tmp41, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp100 = mul i32 %tmp99, 20		; <i32> [#uses=1]
	%tmp101 = add i32 %tmp100, 19		; <i32> [#uses=1]
	%tmp101103 = sext i32 %tmp101 to i64		; <i64> [#uses=1]
	%tmp104 = getelementptr double* %grid, i64 %tmp101103		; <double*> [#uses=1]
	%tmp104105 = bitcast double* %tmp104 to i32*		; <i32*> [#uses=2]
	%tmp107 = load i32* %tmp104105, align 4		; <i32> [#uses=1]
	%tmp108 = or i32 %tmp107, 2		; <i32> [#uses=1]
	store i32 %tmp108, i32* %tmp104105, align 4
	br label %bb113

bb113:		; preds = %cond_true91, %cond_true66, %cond_next
	%tmp115 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb116

bb116:		; preds = %bb116.preheader, %bb113
	%x.0 = phi i32 [ %tmp115, %bb113 ], [ 0, %bb116.preheader ]		; <i32> [#uses=4]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 14, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 14 )
	%tmp118 = icmp slt i32 %x.0, 100		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp118, label %bb2.preheader, label %bb121

bb2.preheader:		; preds = %bb116
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	switch i32 %y.0191, label %bb2 [
		 i32 0, label %bb2.us
		 i32 99, label %bb2.us167
	]

bb2.us:		; preds = %bb2.us, %bb2.preheader
	%indvar200 = phi i32 [ %indvar.next201, %bb2.us ], [ 0, %bb2.preheader ]		; <i32> [#uses=2]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 16, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 16 )
	%x.0.reg2mem.0.us = add i32 %indvar200, %x.0		; <i32> [#uses=2]
	%tmp43.us = add i32 %tmp41, %x.0.reg2mem.0.us		; <i32> [#uses=1]
	%tmp44.us = mul i32 %tmp43.us, 20		; <i32> [#uses=1]
	%tmp45.us = add i32 %tmp44.us, 19		; <i32> [#uses=1]
	%tmp4547.us = sext i32 %tmp45.us to i64		; <i64> [#uses=1]
	%tmp48.us = getelementptr double* %grid, i64 %tmp4547.us		; <double*> [#uses=1]
	%tmp4849.us = bitcast double* %tmp48.us to i32*		; <i32*> [#uses=2]
	%tmp51.us = load i32* %tmp4849.us, align 4		; <i32> [#uses=1]
	%tmp52.us = or i32 %tmp51.us, 1		; <i32> [#uses=1]
	store i32 %tmp52.us, i32* %tmp4849.us, align 4
	%tmp115144.us = add i32 %x.0.reg2mem.0.us, 1		; <i32> [#uses=1]
	%tmp118152.us = icmp slt i32 %tmp115144.us, 100		; <i1> [#uses=1]
	%indvar.next201 = add i32 %indvar200, 1		; <i32> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %tmp118152.us, label %bb2.us, label %bb121

bb2.us167:		; preds = %bb2.us167, %bb2.preheader
	%indvar = phi i32 [ %indvar.next, %bb2.us167 ], [ 0, %bb2.preheader ]		; <i32> [#uses=2]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 17, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 17 )
	%x.0.reg2mem.0.us168 = add i32 %indvar, %x.0		; <i32> [#uses=2]
	%tmp43.us170 = add i32 %tmp41, %x.0.reg2mem.0.us168		; <i32> [#uses=1]
	%tmp44.us171 = mul i32 %tmp43.us170, 20		; <i32> [#uses=1]
	%tmp45.us172 = add i32 %tmp44.us171, 19		; <i32> [#uses=1]
	%tmp4547.us173 = sext i32 %tmp45.us172 to i64		; <i64> [#uses=1]
	%tmp48.us174 = getelementptr double* %grid, i64 %tmp4547.us173		; <double*> [#uses=1]
	%tmp4849.us175 = bitcast double* %tmp48.us174 to i32*		; <i32*> [#uses=2]
	%tmp51.us176 = load i32* %tmp4849.us175, align 4		; <i32> [#uses=1]
	%tmp52.us177 = or i32 %tmp51.us176, 1		; <i32> [#uses=1]
	store i32 %tmp52.us177, i32* %tmp4849.us175, align 4
	%tmp115144.us178 = add i32 %x.0.reg2mem.0.us168, 1		; <i32> [#uses=1]
	%tmp118152.us179 = icmp slt i32 %tmp115144.us178, 100		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp118152.us179, label %bb2.us167, label %bb121

bb121:		; preds = %bb2.us167, %bb2.us, %bb116, %bb36
	%indvar.next210 = add i32 %y.0191, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next210, 100		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb129, label %bb116.preheader

bb116.preheader:		; preds = %bb121, %bb124.outer
	%y.0191 = phi i32 [ 0, %bb124.outer ], [ %indvar.next210, %bb121 ]		; <i32> [#uses=4]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 13, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 13 )
	%tmp38 = mul i32 %y.0191, 100		; <i32> [#uses=1]
	%tmp41 = add i32 %tmp38, %tmp40		; <i32> [#uses=4]
	%y.0.off = add i32 %y.0191, -2		; <i32> [#uses=1]
	%tmp88 = icmp ult i32 %y.0.off, 96		; <i1> [#uses=1]
	br label %bb116

bb129:		; preds = %bb121
	%indvar.next212 = add i32 %indvar211, 1		; <i32> [#uses=2]
	%exitcond213 = icmp eq i32 %indvar.next212, 134		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond213, label %return.split, label %bb124.outer

return.split:		; preds = %bb129
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @LBM_initializeSpecialCellsForChannel(double* %grid) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 4, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 4 )
	br label %bb104.outer

bb104.outer:		; preds = %bb109, %entry
	%indvar = phi i32 [ 0, %entry ], [ %indvar.next136, %bb109 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 18, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 18 )
	%tmp = mul i32 %indvar, 10000		; <i32> [#uses=1]
	%tmp27 = add i32 %tmp, -20000		; <i32> [#uses=1]
	br label %bb96.preheader

bb2:		; preds = %bb96.preheader, %bb93
	%x.0128 = phi i32 [ 0, %bb96.preheader ], [ %indvar.next, %bb93 ]		; <i32> [#uses=3]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 20, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 20 )
	switch i32 %x.0128, label %cond_next [
		 i32 0, label %bb23
		 i32 99, label %bb23
	]

cond_next:		; preds = %bb2
	switch i32 %y.0130, label %bb93 [
		 i32 0, label %bb23
		 i32 99, label %bb23
	]

bb23:		; preds = %cond_next, %cond_next, %bb2, %bb2
	%tmp30 = add i32 %tmp28, %x.0128		; <i32> [#uses=1]
	%tmp31 = mul i32 %tmp30, 20		; <i32> [#uses=1]
	%tmp32 = add i32 %tmp31, 19		; <i32> [#uses=1]
	%tmp3234 = sext i32 %tmp32 to i64		; <i64> [#uses=1]
	%tmp35 = getelementptr double* %grid, i64 %tmp3234		; <double*> [#uses=1]
	%tmp3536 = bitcast double* %tmp35 to i32*		; <i32*> [#uses=2]
	%tmp38 = load i32* %tmp3536, align 4		; <i32> [#uses=1]
	%tmp39 = or i32 %tmp38, 1		; <i32> [#uses=1]
	store i32 %tmp39, i32* %tmp3536, align 4
	br label %bb93

bb93:		; preds = %bb23, %cond_next
	%indvar.next = add i32 %x.0128, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 100		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb101, label %bb2

bb101:		; preds = %bb93
	%indvar.next134 = add i32 %y.0130, 1		; <i32> [#uses=2]
	%exitcond135 = icmp eq i32 %indvar.next134, 100		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond135, label %bb109, label %bb96.preheader

bb96.preheader:		; preds = %bb101, %bb104.outer
	%y.0130 = phi i32 [ 0, %bb104.outer ], [ %indvar.next134, %bb101 ]		; <i32> [#uses=3]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 19, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 19 )
	%tmp25 = mul i32 %y.0130, 100		; <i32> [#uses=1]
	%tmp28 = add i32 %tmp25, %tmp27		; <i32> [#uses=1]
	br label %bb2

bb109:		; preds = %bb101
	%indvar.next136 = add i32 %indvar, 1		; <i32> [#uses=2]
	%exitcond137 = icmp eq i32 %indvar.next136, 134		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond137, label %return.split, label %bb104.outer

return.split:		; preds = %bb109
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @LBM_performStreamCollide(double* %srcGrid, double* %dstGrid) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 5, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 5 )
	br label %bb

bb:		; preds = %cond_next, %cond_true, %entry
	%i.0.reg2mem.0 = phi i32 [ 0, %entry ], [ %tmp10961237, %cond_true ], [ %tmp1096, %cond_next ]		; <i32> [#uses=76]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 21, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 21 )
	%tmp1 = add i32 %i.0.reg2mem.0, 19		; <i32> [#uses=1]
	%tmp13 = sext i32 %tmp1 to i64		; <i64> [#uses=1]
	%tmp4 = getelementptr double* %srcGrid, i64 %tmp13		; <double*> [#uses=1]
	%tmp45 = bitcast double* %tmp4 to i32*		; <i32*> [#uses=1]
	%tmp6 = load i32* %tmp45, align 4		; <i32> [#uses=2]
	%tmp781106 = and i32 %tmp6, 1		; <i32> [#uses=1]
	%toBool = icmp eq i32 %tmp781106, 0		; <i1> [#uses=1]
	%tmp1011 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=3]
	%tmp12 = getelementptr double* %srcGrid, i64 %tmp1011		; <double*> [#uses=1]
	%tmp14 = load double* %tmp12, align 8		; <double> [#uses=3]
	br i1 %toBool, label %cond_next, label %cond_true

cond_true:		; preds = %bb
	%tmp18 = getelementptr double* %dstGrid, i64 %tmp1011		; <double*> [#uses=1]
	store double %tmp14, double* %tmp18, align 8
	%tmp20 = add i32 %i.0.reg2mem.0, -1998		; <i32> [#uses=1]
	%tmp22 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp2224 = sext i32 %tmp22 to i64		; <i64> [#uses=1]
	%tmp25 = getelementptr double* %srcGrid, i64 %tmp2224		; <double*> [#uses=1]
	%tmp26 = load double* %tmp25, align 8		; <double> [#uses=1]
	%tmp2028 = sext i32 %tmp20 to i64		; <i64> [#uses=1]
	%tmp29 = getelementptr double* %dstGrid, i64 %tmp2028		; <double*> [#uses=1]
	store double %tmp26, double* %tmp29, align 8
	%tmp31 = add i32 %i.0.reg2mem.0, 2001		; <i32> [#uses=1]
	%tmp33 = add i32 %i.0.reg2mem.0, 2		; <i32> [#uses=1]
	%tmp3335 = sext i32 %tmp33 to i64		; <i64> [#uses=1]
	%tmp36 = getelementptr double* %srcGrid, i64 %tmp3335		; <double*> [#uses=1]
	%tmp37 = load double* %tmp36, align 8		; <double> [#uses=1]
	%tmp3139 = sext i32 %tmp31 to i64		; <i64> [#uses=1]
	%tmp40 = getelementptr double* %dstGrid, i64 %tmp3139		; <double*> [#uses=1]
	store double %tmp37, double* %tmp40, align 8
	%tmp42 = add i32 %i.0.reg2mem.0, -16		; <i32> [#uses=1]
	%tmp44 = add i32 %i.0.reg2mem.0, 3		; <i32> [#uses=1]
	%tmp4447 = sext i32 %tmp44 to i64		; <i64> [#uses=1]
	%tmp48 = getelementptr double* %srcGrid, i64 %tmp4447		; <double*> [#uses=1]
	%tmp49 = load double* %tmp48, align 8		; <double> [#uses=1]
	%tmp4251 = sext i32 %tmp42 to i64		; <i64> [#uses=1]
	%tmp52 = getelementptr double* %dstGrid, i64 %tmp4251		; <double*> [#uses=1]
	store double %tmp49, double* %tmp52, align 8
	%tmp54 = add i32 %i.0.reg2mem.0, 23		; <i32> [#uses=1]
	%tmp56 = add i32 %i.0.reg2mem.0, 4		; <i32> [#uses=1]
	%tmp5658 = sext i32 %tmp56 to i64		; <i64> [#uses=1]
	%tmp59 = getelementptr double* %srcGrid, i64 %tmp5658		; <double*> [#uses=1]
	%tmp60 = load double* %tmp59, align 8		; <double> [#uses=1]
	%tmp5462 = sext i32 %tmp54 to i64		; <i64> [#uses=1]
	%tmp63 = getelementptr double* %dstGrid, i64 %tmp5462		; <double*> [#uses=1]
	store double %tmp60, double* %tmp63, align 8
	%tmp65 = add i32 %i.0.reg2mem.0, -199994		; <i32> [#uses=1]
	%tmp67 = add i32 %i.0.reg2mem.0, 5		; <i32> [#uses=1]
	%tmp6769 = sext i32 %tmp67 to i64		; <i64> [#uses=1]
	%tmp70 = getelementptr double* %srcGrid, i64 %tmp6769		; <double*> [#uses=1]
	%tmp71 = load double* %tmp70, align 8		; <double> [#uses=1]
	%tmp6573 = sext i32 %tmp65 to i64		; <i64> [#uses=1]
	%tmp74 = getelementptr double* %dstGrid, i64 %tmp6573		; <double*> [#uses=1]
	store double %tmp71, double* %tmp74, align 8
	%tmp76 = add i32 %i.0.reg2mem.0, 200005		; <i32> [#uses=1]
	%tmp79 = add i32 %i.0.reg2mem.0, 6		; <i32> [#uses=1]
	%tmp7981 = sext i32 %tmp79 to i64		; <i64> [#uses=1]
	%tmp82 = getelementptr double* %srcGrid, i64 %tmp7981		; <double*> [#uses=1]
	%tmp83 = load double* %tmp82, align 8		; <double> [#uses=1]
	%tmp7685 = sext i32 %tmp76 to i64		; <i64> [#uses=1]
	%tmp86 = getelementptr double* %dstGrid, i64 %tmp7685		; <double*> [#uses=1]
	store double %tmp83, double* %tmp86, align 8
	%tmp88 = add i32 %i.0.reg2mem.0, -2010		; <i32> [#uses=1]
	%tmp90 = add i32 %i.0.reg2mem.0, 7		; <i32> [#uses=1]
	%tmp9092 = sext i32 %tmp90 to i64		; <i64> [#uses=1]
	%tmp93 = getelementptr double* %srcGrid, i64 %tmp9092		; <double*> [#uses=1]
	%tmp94 = load double* %tmp93, align 8		; <double> [#uses=1]
	%tmp8896 = sext i32 %tmp88 to i64		; <i64> [#uses=1]
	%tmp97 = getelementptr double* %dstGrid, i64 %tmp8896		; <double*> [#uses=1]
	store double %tmp94, double* %tmp97, align 8
	%tmp99 = add i32 %i.0.reg2mem.0, -1971		; <i32> [#uses=1]
	%tmp101 = add i32 %i.0.reg2mem.0, 8		; <i32> [#uses=1]
	%tmp101103 = sext i32 %tmp101 to i64		; <i64> [#uses=1]
	%tmp104 = getelementptr double* %srcGrid, i64 %tmp101103		; <double*> [#uses=1]
	%tmp105 = load double* %tmp104, align 8		; <double> [#uses=1]
	%tmp99107 = sext i32 %tmp99 to i64		; <i64> [#uses=1]
	%tmp108 = getelementptr double* %dstGrid, i64 %tmp99107		; <double*> [#uses=1]
	store double %tmp105, double* %tmp108, align 8
	%tmp110 = add i32 %i.0.reg2mem.0, 1988		; <i32> [#uses=1]
	%tmp112 = add i32 %i.0.reg2mem.0, 9		; <i32> [#uses=1]
	%tmp112114 = sext i32 %tmp112 to i64		; <i64> [#uses=1]
	%tmp115 = getelementptr double* %srcGrid, i64 %tmp112114		; <double*> [#uses=1]
	%tmp116 = load double* %tmp115, align 8		; <double> [#uses=1]
	%tmp110118 = sext i32 %tmp110 to i64		; <i64> [#uses=1]
	%tmp119 = getelementptr double* %dstGrid, i64 %tmp110118		; <double*> [#uses=1]
	store double %tmp116, double* %tmp119, align 8
	%tmp121 = add i32 %i.0.reg2mem.0, 2027		; <i32> [#uses=1]
	%tmp123 = add i32 %i.0.reg2mem.0, 10		; <i32> [#uses=1]
	%tmp123125 = sext i32 %tmp123 to i64		; <i64> [#uses=1]
	%tmp126 = getelementptr double* %srcGrid, i64 %tmp123125		; <double*> [#uses=1]
	%tmp127 = load double* %tmp126, align 8		; <double> [#uses=1]
	%tmp121129 = sext i32 %tmp121 to i64		; <i64> [#uses=1]
	%tmp130 = getelementptr double* %dstGrid, i64 %tmp121129		; <double*> [#uses=1]
	store double %tmp127, double* %tmp130, align 8
	%tmp132 = add i32 %i.0.reg2mem.0, -201986		; <i32> [#uses=1]
	%tmp134 = add i32 %i.0.reg2mem.0, 11		; <i32> [#uses=1]
	%tmp134136 = sext i32 %tmp134 to i64		; <i64> [#uses=1]
	%tmp137 = getelementptr double* %srcGrid, i64 %tmp134136		; <double*> [#uses=1]
	%tmp138 = load double* %tmp137, align 8		; <double> [#uses=1]
	%tmp132140 = sext i32 %tmp132 to i64		; <i64> [#uses=1]
	%tmp141 = getelementptr double* %dstGrid, i64 %tmp132140		; <double*> [#uses=1]
	store double %tmp138, double* %tmp141, align 8
	%tmp143 = add i32 %i.0.reg2mem.0, 198013		; <i32> [#uses=1]
	%tmp145 = add i32 %i.0.reg2mem.0, 12		; <i32> [#uses=1]
	%tmp145147 = sext i32 %tmp145 to i64		; <i64> [#uses=1]
	%tmp148 = getelementptr double* %srcGrid, i64 %tmp145147		; <double*> [#uses=1]
	%tmp149 = load double* %tmp148, align 8		; <double> [#uses=1]
	%tmp143151 = sext i32 %tmp143 to i64		; <i64> [#uses=1]
	%tmp152 = getelementptr double* %dstGrid, i64 %tmp143151		; <double*> [#uses=1]
	store double %tmp149, double* %tmp152, align 8
	%tmp154 = add i32 %i.0.reg2mem.0, -197988		; <i32> [#uses=1]
	%tmp156 = add i32 %i.0.reg2mem.0, 13		; <i32> [#uses=1]
	%tmp156158 = sext i32 %tmp156 to i64		; <i64> [#uses=1]
	%tmp159 = getelementptr double* %srcGrid, i64 %tmp156158		; <double*> [#uses=1]
	%tmp160 = load double* %tmp159, align 8		; <double> [#uses=1]
	%tmp154162 = sext i32 %tmp154 to i64		; <i64> [#uses=1]
	%tmp163 = getelementptr double* %dstGrid, i64 %tmp154162		; <double*> [#uses=1]
	store double %tmp160, double* %tmp163, align 8
	%tmp165 = add i32 %i.0.reg2mem.0, 202011		; <i32> [#uses=1]
	%tmp167 = add i32 %i.0.reg2mem.0, 14		; <i32> [#uses=1]
	%tmp167169 = sext i32 %tmp167 to i64		; <i64> [#uses=1]
	%tmp170 = getelementptr double* %srcGrid, i64 %tmp167169		; <double*> [#uses=1]
	%tmp171 = load double* %tmp170, align 8		; <double> [#uses=1]
	%tmp165173 = sext i32 %tmp165 to i64		; <i64> [#uses=1]
	%tmp174 = getelementptr double* %dstGrid, i64 %tmp165173		; <double*> [#uses=1]
	store double %tmp171, double* %tmp174, align 8
	%tmp176 = add i32 %i.0.reg2mem.0, -200002		; <i32> [#uses=1]
	%tmp178 = add i32 %i.0.reg2mem.0, 15		; <i32> [#uses=1]
	%tmp178180 = sext i32 %tmp178 to i64		; <i64> [#uses=1]
	%tmp181 = getelementptr double* %srcGrid, i64 %tmp178180		; <double*> [#uses=1]
	%tmp182 = load double* %tmp181, align 8		; <double> [#uses=1]
	%tmp176184 = sext i32 %tmp176 to i64		; <i64> [#uses=1]
	%tmp185 = getelementptr double* %dstGrid, i64 %tmp176184		; <double*> [#uses=1]
	store double %tmp182, double* %tmp185, align 8
	%tmp187 = add i32 %i.0.reg2mem.0, 199997		; <i32> [#uses=1]
	%tmp189 = add i32 %i.0.reg2mem.0, 16		; <i32> [#uses=1]
	%tmp189191 = sext i32 %tmp189 to i64		; <i64> [#uses=1]
	%tmp192 = getelementptr double* %srcGrid, i64 %tmp189191		; <double*> [#uses=1]
	%tmp193 = load double* %tmp192, align 8		; <double> [#uses=1]
	%tmp187195 = sext i32 %tmp187 to i64		; <i64> [#uses=1]
	%tmp196 = getelementptr double* %dstGrid, i64 %tmp187195		; <double*> [#uses=1]
	store double %tmp193, double* %tmp196, align 8
	%tmp198 = add i32 %i.0.reg2mem.0, -199964		; <i32> [#uses=1]
	%tmp200 = add i32 %i.0.reg2mem.0, 17		; <i32> [#uses=1]
	%tmp200202 = sext i32 %tmp200 to i64		; <i64> [#uses=1]
	%tmp203 = getelementptr double* %srcGrid, i64 %tmp200202		; <double*> [#uses=1]
	%tmp204 = load double* %tmp203, align 8		; <double> [#uses=1]
	%tmp198206 = sext i32 %tmp198 to i64		; <i64> [#uses=1]
	%tmp207 = getelementptr double* %dstGrid, i64 %tmp198206		; <double*> [#uses=1]
	store double %tmp204, double* %tmp207, align 8
	%tmp209 = add i32 %i.0.reg2mem.0, 200035		; <i32> [#uses=1]
	%tmp211 = add i32 %i.0.reg2mem.0, 18		; <i32> [#uses=1]
	%tmp211213 = sext i32 %tmp211 to i64		; <i64> [#uses=1]
	%tmp214 = getelementptr double* %srcGrid, i64 %tmp211213		; <double*> [#uses=1]
	%tmp215 = load double* %tmp214, align 8		; <double> [#uses=1]
	%tmp209217 = sext i32 %tmp209 to i64		; <i64> [#uses=1]
	%tmp218 = getelementptr double* %dstGrid, i64 %tmp209217		; <double*> [#uses=1]
	store double %tmp215, double* %tmp218, align 8
	%tmp10961237 = add i32 %i.0.reg2mem.0, 20		; <i32> [#uses=2]
	%tmp10991240 = icmp slt i32 %tmp10961237, 26000000		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp10991240, label %bb, label %return

cond_next:		; preds = %bb
	%tmp225 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp225227 = sext i32 %tmp225 to i64		; <i64> [#uses=1]
	%tmp228 = getelementptr double* %srcGrid, i64 %tmp225227		; <double*> [#uses=2]
	%tmp229 = load double* %tmp228, align 8		; <double> [#uses=2]
	%tmp230 = add double %tmp14, %tmp229		; <double> [#uses=1]
	%tmp232 = add i32 %i.0.reg2mem.0, 2		; <i32> [#uses=1]
	%tmp232234 = sext i32 %tmp232 to i64		; <i64> [#uses=1]
	%tmp235 = getelementptr double* %srcGrid, i64 %tmp232234		; <double*> [#uses=2]
	%tmp236 = load double* %tmp235, align 8		; <double> [#uses=2]
	%tmp237 = add double %tmp230, %tmp236		; <double> [#uses=1]
	%tmp239 = add i32 %i.0.reg2mem.0, 3		; <i32> [#uses=1]
	%tmp239241 = sext i32 %tmp239 to i64		; <i64> [#uses=1]
	%tmp242 = getelementptr double* %srcGrid, i64 %tmp239241		; <double*> [#uses=2]
	%tmp243 = load double* %tmp242, align 8		; <double> [#uses=2]
	%tmp244 = add double %tmp237, %tmp243		; <double> [#uses=1]
	%tmp246 = add i32 %i.0.reg2mem.0, 4		; <i32> [#uses=1]
	%tmp246248 = sext i32 %tmp246 to i64		; <i64> [#uses=1]
	%tmp249 = getelementptr double* %srcGrid, i64 %tmp246248		; <double*> [#uses=2]
	%tmp250 = load double* %tmp249, align 8		; <double> [#uses=2]
	%tmp251 = add double %tmp244, %tmp250		; <double> [#uses=1]
	%tmp253 = add i32 %i.0.reg2mem.0, 5		; <i32> [#uses=1]
	%tmp253255 = sext i32 %tmp253 to i64		; <i64> [#uses=1]
	%tmp256 = getelementptr double* %srcGrid, i64 %tmp253255		; <double*> [#uses=2]
	%tmp257 = load double* %tmp256, align 8		; <double> [#uses=2]
	%tmp258 = add double %tmp251, %tmp257		; <double> [#uses=1]
	%tmp260 = add i32 %i.0.reg2mem.0, 6		; <i32> [#uses=1]
	%tmp260262 = sext i32 %tmp260 to i64		; <i64> [#uses=1]
	%tmp263 = getelementptr double* %srcGrid, i64 %tmp260262		; <double*> [#uses=2]
	%tmp264 = load double* %tmp263, align 8		; <double> [#uses=2]
	%tmp265 = add double %tmp258, %tmp264		; <double> [#uses=1]
	%tmp267 = add i32 %i.0.reg2mem.0, 7		; <i32> [#uses=1]
	%tmp267269 = sext i32 %tmp267 to i64		; <i64> [#uses=1]
	%tmp270 = getelementptr double* %srcGrid, i64 %tmp267269		; <double*> [#uses=2]
	%tmp271 = load double* %tmp270, align 8		; <double> [#uses=3]
	%tmp272 = add double %tmp265, %tmp271		; <double> [#uses=1]
	%tmp274 = add i32 %i.0.reg2mem.0, 8		; <i32> [#uses=1]
	%tmp274276 = sext i32 %tmp274 to i64		; <i64> [#uses=1]
	%tmp277 = getelementptr double* %srcGrid, i64 %tmp274276		; <double*> [#uses=2]
	%tmp278 = load double* %tmp277, align 8		; <double> [#uses=3]
	%tmp279 = add double %tmp272, %tmp278		; <double> [#uses=1]
	%tmp281 = add i32 %i.0.reg2mem.0, 9		; <i32> [#uses=1]
	%tmp281283 = sext i32 %tmp281 to i64		; <i64> [#uses=1]
	%tmp284 = getelementptr double* %srcGrid, i64 %tmp281283		; <double*> [#uses=2]
	%tmp285 = load double* %tmp284, align 8		; <double> [#uses=3]
	%tmp286 = add double %tmp279, %tmp285		; <double> [#uses=1]
	%tmp288 = add i32 %i.0.reg2mem.0, 10		; <i32> [#uses=1]
	%tmp288290 = sext i32 %tmp288 to i64		; <i64> [#uses=1]
	%tmp291 = getelementptr double* %srcGrid, i64 %tmp288290		; <double*> [#uses=2]
	%tmp292 = load double* %tmp291, align 8		; <double> [#uses=3]
	%tmp293 = add double %tmp286, %tmp292		; <double> [#uses=1]
	%tmp295 = add i32 %i.0.reg2mem.0, 11		; <i32> [#uses=1]
	%tmp295297 = sext i32 %tmp295 to i64		; <i64> [#uses=1]
	%tmp298 = getelementptr double* %srcGrid, i64 %tmp295297		; <double*> [#uses=2]
	%tmp299 = load double* %tmp298, align 8		; <double> [#uses=3]
	%tmp300 = add double %tmp293, %tmp299		; <double> [#uses=1]
	%tmp302 = add i32 %i.0.reg2mem.0, 12		; <i32> [#uses=1]
	%tmp302304 = sext i32 %tmp302 to i64		; <i64> [#uses=1]
	%tmp305 = getelementptr double* %srcGrid, i64 %tmp302304		; <double*> [#uses=2]
	%tmp306 = load double* %tmp305, align 8		; <double> [#uses=3]
	%tmp307 = add double %tmp300, %tmp306		; <double> [#uses=1]
	%tmp309 = add i32 %i.0.reg2mem.0, 13		; <i32> [#uses=1]
	%tmp309311 = sext i32 %tmp309 to i64		; <i64> [#uses=1]
	%tmp312 = getelementptr double* %srcGrid, i64 %tmp309311		; <double*> [#uses=2]
	%tmp313 = load double* %tmp312, align 8		; <double> [#uses=3]
	%tmp314 = add double %tmp307, %tmp313		; <double> [#uses=1]
	%tmp316 = add i32 %i.0.reg2mem.0, 14		; <i32> [#uses=1]
	%tmp316318 = sext i32 %tmp316 to i64		; <i64> [#uses=1]
	%tmp319 = getelementptr double* %srcGrid, i64 %tmp316318		; <double*> [#uses=2]
	%tmp320 = load double* %tmp319, align 8		; <double> [#uses=3]
	%tmp321 = add double %tmp314, %tmp320		; <double> [#uses=1]
	%tmp323 = add i32 %i.0.reg2mem.0, 15		; <i32> [#uses=1]
	%tmp323325 = sext i32 %tmp323 to i64		; <i64> [#uses=1]
	%tmp326 = getelementptr double* %srcGrid, i64 %tmp323325		; <double*> [#uses=2]
	%tmp327 = load double* %tmp326, align 8		; <double> [#uses=3]
	%tmp328 = add double %tmp321, %tmp327		; <double> [#uses=1]
	%tmp330 = add i32 %i.0.reg2mem.0, 16		; <i32> [#uses=1]
	%tmp330332 = sext i32 %tmp330 to i64		; <i64> [#uses=1]
	%tmp333 = getelementptr double* %srcGrid, i64 %tmp330332		; <double*> [#uses=2]
	%tmp334 = load double* %tmp333, align 8		; <double> [#uses=3]
	%tmp335 = add double %tmp328, %tmp334		; <double> [#uses=1]
	%tmp337 = add i32 %i.0.reg2mem.0, 17		; <i32> [#uses=1]
	%tmp337339 = sext i32 %tmp337 to i64		; <i64> [#uses=1]
	%tmp340 = getelementptr double* %srcGrid, i64 %tmp337339		; <double*> [#uses=2]
	%tmp341 = load double* %tmp340, align 8		; <double> [#uses=3]
	%tmp342 = add double %tmp335, %tmp341		; <double> [#uses=1]
	%tmp344 = add i32 %i.0.reg2mem.0, 18		; <i32> [#uses=1]
	%tmp344346 = sext i32 %tmp344 to i64		; <i64> [#uses=1]
	%tmp347 = getelementptr double* %srcGrid, i64 %tmp344346		; <double*> [#uses=2]
	%tmp348 = load double* %tmp347, align 8		; <double> [#uses=3]
	%tmp349 = add double %tmp342, %tmp348		; <double> [#uses=6]
	%tmp362 = sub double %tmp243, %tmp250		; <double> [#uses=1]
	%tmp369 = add double %tmp362, %tmp271		; <double> [#uses=1]
	%tmp376 = sub double %tmp369, %tmp278		; <double> [#uses=1]
	%tmp383 = add double %tmp376, %tmp285		; <double> [#uses=1]
	%tmp390 = sub double %tmp383, %tmp292		; <double> [#uses=1]
	%tmp397 = add double %tmp390, %tmp327		; <double> [#uses=1]
	%tmp404 = add double %tmp397, %tmp334		; <double> [#uses=1]
	%tmp411 = sub double %tmp404, %tmp341		; <double> [#uses=1]
	%tmp418 = sub double %tmp411, %tmp348		; <double> [#uses=1]
	%tmp431 = sub double %tmp229, %tmp236		; <double> [#uses=1]
	%tmp438 = add double %tmp431, %tmp271		; <double> [#uses=1]
	%tmp445 = add double %tmp438, %tmp278		; <double> [#uses=1]
	%tmp452 = sub double %tmp445, %tmp285		; <double> [#uses=1]
	%tmp459 = sub double %tmp452, %tmp292		; <double> [#uses=1]
	%tmp466 = add double %tmp459, %tmp299		; <double> [#uses=1]
	%tmp473 = add double %tmp466, %tmp306		; <double> [#uses=1]
	%tmp480 = sub double %tmp473, %tmp313		; <double> [#uses=1]
	%tmp487 = sub double %tmp480, %tmp320		; <double> [#uses=1]
	%tmp500 = sub double %tmp257, %tmp264		; <double> [#uses=1]
	%tmp507 = add double %tmp500, %tmp299		; <double> [#uses=1]
	%tmp514 = sub double %tmp507, %tmp306		; <double> [#uses=1]
	%tmp521 = add double %tmp514, %tmp313		; <double> [#uses=1]
	%tmp528 = sub double %tmp521, %tmp320		; <double> [#uses=1]
	%tmp535 = add double %tmp528, %tmp327		; <double> [#uses=1]
	%tmp542 = sub double %tmp535, %tmp334		; <double> [#uses=1]
	%tmp549 = add double %tmp542, %tmp341		; <double> [#uses=1]
	%tmp556 = sub double %tmp549, %tmp348		; <double> [#uses=1]
	%tmp559 = fdiv double %tmp418, %tmp349		; <double> [#uses=1]
	%tmp562 = fdiv double %tmp487, %tmp349		; <double> [#uses=1]
	%tmp565 = fdiv double %tmp556, %tmp349		; <double> [#uses=1]
	%tmp5745751104 = and i32 %tmp6, 2		; <i32> [#uses=1]
	%toBool576 = icmp eq i32 %tmp5745751104, 0		; <i1> [#uses=3]
	%ux.0 = select i1 %toBool576, double %tmp559, double 5.000000e-03		; <double> [#uses=12]
	%uy.0 = select i1 %toBool576, double %tmp562, double 2.000000e-03		; <double> [#uses=13]
	%uz.0 = select i1 %toBool576, double %tmp565, double 0.000000e+00		; <double> [#uses=13]
	%tmp581 = mul double %ux.0, %ux.0		; <double> [#uses=1]
	%tmp584 = mul double %uy.0, %uy.0		; <double> [#uses=1]
	%tmp585 = add double %tmp581, %tmp584		; <double> [#uses=1]
	%tmp588 = mul double %uz.0, %uz.0		; <double> [#uses=1]
	%tmp589 = add double %tmp585, %tmp588		; <double> [#uses=1]
	%tmp590 = mul double %tmp589, 1.500000e+00		; <double> [#uses=19]
	%tmp596 = mul double %tmp14, -9.500000e-01		; <double> [#uses=1]
	%tmp598 = mul double %tmp349, 0x3FE4CCCCCCCCCCCC		; <double> [#uses=1]
	%tmp600 = sub double 1.000000e+00, %tmp590		; <double> [#uses=1]
	%tmp601 = mul double %tmp598, %tmp600		; <double> [#uses=1]
	%tmp602 = add double %tmp596, %tmp601		; <double> [#uses=1]
	%tmp606 = getelementptr double* %dstGrid, i64 %tmp1011		; <double*> [#uses=1]
	store double %tmp602, double* %tmp606, align 8
	%tmp608 = add i32 %i.0.reg2mem.0, 2001		; <i32> [#uses=1]
	%tmp614 = load double* %tmp228, align 8		; <double> [#uses=1]
	%tmp615 = mul double %tmp614, -9.500000e-01		; <double> [#uses=1]
	%tmp617 = mul double %tmp349, 0x3FBBBBBBBBBBBBBB		; <double> [#uses=6]
	%tmp619 = mul double %uy.0, 4.500000e+00		; <double> [#uses=2]
	%tmp620 = add double %tmp619, 3.000000e+00		; <double> [#uses=1]
	%tmp622 = mul double %tmp620, %uy.0		; <double> [#uses=1]
	%tmp623 = add double %tmp622, 1.000000e+00		; <double> [#uses=1]
	%tmp625 = sub double %tmp623, %tmp590		; <double> [#uses=1]
	%tmp626 = mul double %tmp617, %tmp625		; <double> [#uses=1]
	%tmp627 = add double %tmp615, %tmp626		; <double> [#uses=1]
	%tmp608629 = sext i32 %tmp608 to i64		; <i64> [#uses=1]
	%tmp630 = getelementptr double* %dstGrid, i64 %tmp608629		; <double*> [#uses=1]
	store double %tmp627, double* %tmp630, align 8
	%tmp632 = add i32 %i.0.reg2mem.0, -1998		; <i32> [#uses=1]
	%tmp638 = load double* %tmp235, align 8		; <double> [#uses=1]
	%tmp639 = mul double %tmp638, -9.500000e-01		; <double> [#uses=1]
	%tmp644 = sub double %tmp619, 3.000000e+00		; <double> [#uses=1]
	%tmp646 = mul double %tmp644, %uy.0		; <double> [#uses=1]
	%tmp647 = add double %tmp646, 1.000000e+00		; <double> [#uses=1]
	%tmp649 = sub double %tmp647, %tmp590		; <double> [#uses=1]
	%tmp650 = mul double %tmp617, %tmp649		; <double> [#uses=1]
	%tmp651 = add double %tmp639, %tmp650		; <double> [#uses=1]
	%tmp632653 = sext i32 %tmp632 to i64		; <i64> [#uses=1]
	%tmp654 = getelementptr double* %dstGrid, i64 %tmp632653		; <double*> [#uses=1]
	store double %tmp651, double* %tmp654, align 8
	%tmp656 = add i32 %i.0.reg2mem.0, 23		; <i32> [#uses=1]
	%tmp662 = load double* %tmp242, align 8		; <double> [#uses=1]
	%tmp663 = mul double %tmp662, -9.500000e-01		; <double> [#uses=1]
	%tmp667 = mul double %ux.0, 4.500000e+00		; <double> [#uses=2]
	%tmp668 = add double %tmp667, 3.000000e+00		; <double> [#uses=1]
	%tmp670 = mul double %tmp668, %ux.0		; <double> [#uses=1]
	%tmp671 = add double %tmp670, 1.000000e+00		; <double> [#uses=1]
	%tmp673 = sub double %tmp671, %tmp590		; <double> [#uses=1]
	%tmp674 = mul double %tmp617, %tmp673		; <double> [#uses=1]
	%tmp675 = add double %tmp663, %tmp674		; <double> [#uses=1]
	%tmp656677 = sext i32 %tmp656 to i64		; <i64> [#uses=1]
	%tmp678 = getelementptr double* %dstGrid, i64 %tmp656677		; <double*> [#uses=1]
	store double %tmp675, double* %tmp678, align 8
	%tmp680 = add i32 %i.0.reg2mem.0, -16		; <i32> [#uses=1]
	%tmp686 = load double* %tmp249, align 8		; <double> [#uses=1]
	%tmp687 = mul double %tmp686, -9.500000e-01		; <double> [#uses=1]
	%tmp692 = sub double %tmp667, 3.000000e+00		; <double> [#uses=1]
	%tmp694 = mul double %tmp692, %ux.0		; <double> [#uses=1]
	%tmp695 = add double %tmp694, 1.000000e+00		; <double> [#uses=1]
	%tmp697 = sub double %tmp695, %tmp590		; <double> [#uses=1]
	%tmp698 = mul double %tmp617, %tmp697		; <double> [#uses=1]
	%tmp699 = add double %tmp687, %tmp698		; <double> [#uses=1]
	%tmp680701 = sext i32 %tmp680 to i64		; <i64> [#uses=1]
	%tmp702 = getelementptr double* %dstGrid, i64 %tmp680701		; <double*> [#uses=1]
	store double %tmp699, double* %tmp702, align 8
	%tmp704 = add i32 %i.0.reg2mem.0, 200005		; <i32> [#uses=1]
	%tmp710 = load double* %tmp256, align 8		; <double> [#uses=1]
	%tmp711 = mul double %tmp710, -9.500000e-01		; <double> [#uses=1]
	%tmp715 = mul double %uz.0, 4.500000e+00		; <double> [#uses=2]
	%tmp716 = add double %tmp715, 3.000000e+00		; <double> [#uses=1]
	%tmp718 = mul double %tmp716, %uz.0		; <double> [#uses=1]
	%tmp719 = add double %tmp718, 1.000000e+00		; <double> [#uses=1]
	%tmp721 = sub double %tmp719, %tmp590		; <double> [#uses=1]
	%tmp722 = mul double %tmp617, %tmp721		; <double> [#uses=1]
	%tmp723 = add double %tmp711, %tmp722		; <double> [#uses=1]
	%tmp704725 = sext i32 %tmp704 to i64		; <i64> [#uses=1]
	%tmp726 = getelementptr double* %dstGrid, i64 %tmp704725		; <double*> [#uses=1]
	store double %tmp723, double* %tmp726, align 8
	%tmp728 = add i32 %i.0.reg2mem.0, -199994		; <i32> [#uses=1]
	%tmp734 = load double* %tmp263, align 8		; <double> [#uses=1]
	%tmp735 = mul double %tmp734, -9.500000e-01		; <double> [#uses=1]
	%tmp740 = sub double %tmp715, 3.000000e+00		; <double> [#uses=1]
	%tmp742 = mul double %tmp740, %uz.0		; <double> [#uses=1]
	%tmp743 = add double %tmp742, 1.000000e+00		; <double> [#uses=1]
	%tmp745 = sub double %tmp743, %tmp590		; <double> [#uses=1]
	%tmp746 = mul double %tmp617, %tmp745		; <double> [#uses=1]
	%tmp747 = add double %tmp735, %tmp746		; <double> [#uses=1]
	%tmp728749 = sext i32 %tmp728 to i64		; <i64> [#uses=1]
	%tmp750 = getelementptr double* %dstGrid, i64 %tmp728749		; <double*> [#uses=1]
	store double %tmp747, double* %tmp750, align 8
	%tmp752 = add i32 %i.0.reg2mem.0, 2027		; <i32> [#uses=1]
	%tmp758 = load double* %tmp270, align 8		; <double> [#uses=1]
	%tmp759 = mul double %tmp758, -9.500000e-01		; <double> [#uses=1]
	%tmp761 = mul double %tmp349, 0x3FABBBBBBBBBBBBB		; <double> [#uses=12]
	%tmp764 = add double %ux.0, %uy.0		; <double> [#uses=2]
	%tmp768 = mul double %tmp764, 4.500000e+00		; <double> [#uses=1]
	%tmp769 = add double %tmp768, 3.000000e+00		; <double> [#uses=1]
	%tmp770 = mul double %tmp764, %tmp769		; <double> [#uses=1]
	%tmp771 = add double %tmp770, 1.000000e+00		; <double> [#uses=1]
	%tmp773 = sub double %tmp771, %tmp590		; <double> [#uses=1]
	%tmp774 = mul double %tmp761, %tmp773		; <double> [#uses=1]
	%tmp775 = add double %tmp759, %tmp774		; <double> [#uses=1]
	%tmp752777 = sext i32 %tmp752 to i64		; <i64> [#uses=1]
	%tmp778 = getelementptr double* %dstGrid, i64 %tmp752777		; <double*> [#uses=1]
	store double %tmp775, double* %tmp778, align 8
	%tmp780 = add i32 %i.0.reg2mem.0, 1988		; <i32> [#uses=1]
	%tmp786 = load double* %tmp277, align 8		; <double> [#uses=1]
	%tmp787 = mul double %tmp786, -9.500000e-01		; <double> [#uses=1]
	%tmp792 = sub double %uy.0, %ux.0		; <double> [#uses=2]
	%tmp796 = mul double %tmp792, 4.500000e+00		; <double> [#uses=1]
	%tmp797 = add double %tmp796, 3.000000e+00		; <double> [#uses=1]
	%tmp798 = mul double %tmp792, %tmp797		; <double> [#uses=1]
	%tmp799 = add double %tmp798, 1.000000e+00		; <double> [#uses=1]
	%tmp801 = sub double %tmp799, %tmp590		; <double> [#uses=1]
	%tmp802 = mul double %tmp761, %tmp801		; <double> [#uses=1]
	%tmp803 = add double %tmp787, %tmp802		; <double> [#uses=1]
	%tmp780805 = sext i32 %tmp780 to i64		; <i64> [#uses=1]
	%tmp806 = getelementptr double* %dstGrid, i64 %tmp780805		; <double*> [#uses=1]
	store double %tmp803, double* %tmp806, align 8
	%tmp808 = add i32 %i.0.reg2mem.0, -1971		; <i32> [#uses=1]
	%tmp814 = load double* %tmp284, align 8		; <double> [#uses=1]
	%tmp815 = mul double %tmp814, -9.500000e-01		; <double> [#uses=1]
	%tmp820 = sub double %ux.0, %uy.0		; <double> [#uses=2]
	%tmp824 = mul double %tmp820, 4.500000e+00		; <double> [#uses=1]
	%tmp825 = add double %tmp824, 3.000000e+00		; <double> [#uses=1]
	%tmp826 = mul double %tmp820, %tmp825		; <double> [#uses=1]
	%tmp827 = add double %tmp826, 1.000000e+00		; <double> [#uses=1]
	%tmp829 = sub double %tmp827, %tmp590		; <double> [#uses=1]
	%tmp830 = mul double %tmp761, %tmp829		; <double> [#uses=1]
	%tmp831 = add double %tmp815, %tmp830		; <double> [#uses=1]
	%tmp808833 = sext i32 %tmp808 to i64		; <i64> [#uses=1]
	%tmp834 = getelementptr double* %dstGrid, i64 %tmp808833		; <double*> [#uses=1]
	store double %tmp831, double* %tmp834, align 8
	%tmp836 = add i32 %i.0.reg2mem.0, -2010		; <i32> [#uses=1]
	%tmp842 = load double* %tmp291, align 8		; <double> [#uses=1]
	%tmp843 = mul double %tmp842, -9.500000e-01		; <double> [#uses=1]
	%tmp847 = sub double -0.000000e+00, %ux.0		; <double> [#uses=2]
	%tmp849 = sub double %tmp847, %uy.0		; <double> [#uses=2]
	%tmp854 = mul double %tmp849, 4.500000e+00		; <double> [#uses=1]
	%tmp855 = add double %tmp854, 3.000000e+00		; <double> [#uses=1]
	%tmp856 = mul double %tmp849, %tmp855		; <double> [#uses=1]
	%tmp857 = add double %tmp856, 1.000000e+00		; <double> [#uses=1]
	%tmp859 = sub double %tmp857, %tmp590		; <double> [#uses=1]
	%tmp860 = mul double %tmp761, %tmp859		; <double> [#uses=1]
	%tmp861 = add double %tmp843, %tmp860		; <double> [#uses=1]
	%tmp836863 = sext i32 %tmp836 to i64		; <i64> [#uses=1]
	%tmp864 = getelementptr double* %dstGrid, i64 %tmp836863		; <double*> [#uses=1]
	store double %tmp861, double* %tmp864, align 8
	%tmp866 = add i32 %i.0.reg2mem.0, 202011		; <i32> [#uses=1]
	%tmp872 = load double* %tmp298, align 8		; <double> [#uses=1]
	%tmp873 = mul double %tmp872, -9.500000e-01		; <double> [#uses=1]
	%tmp878 = add double %uy.0, %uz.0		; <double> [#uses=2]
	%tmp882 = mul double %tmp878, 4.500000e+00		; <double> [#uses=1]
	%tmp883 = add double %tmp882, 3.000000e+00		; <double> [#uses=1]
	%tmp884 = mul double %tmp878, %tmp883		; <double> [#uses=1]
	%tmp885 = add double %tmp884, 1.000000e+00		; <double> [#uses=1]
	%tmp887 = sub double %tmp885, %tmp590		; <double> [#uses=1]
	%tmp888 = mul double %tmp761, %tmp887		; <double> [#uses=1]
	%tmp889 = add double %tmp873, %tmp888		; <double> [#uses=1]
	%tmp866891 = sext i32 %tmp866 to i64		; <i64> [#uses=1]
	%tmp892 = getelementptr double* %dstGrid, i64 %tmp866891		; <double*> [#uses=1]
	store double %tmp889, double* %tmp892, align 8
	%tmp894 = add i32 %i.0.reg2mem.0, -197988		; <i32> [#uses=1]
	%tmp900 = load double* %tmp305, align 8		; <double> [#uses=1]
	%tmp901 = mul double %tmp900, -9.500000e-01		; <double> [#uses=1]
	%tmp906 = sub double %uy.0, %uz.0		; <double> [#uses=2]
	%tmp910 = mul double %tmp906, 4.500000e+00		; <double> [#uses=1]
	%tmp911 = add double %tmp910, 3.000000e+00		; <double> [#uses=1]
	%tmp912 = mul double %tmp906, %tmp911		; <double> [#uses=1]
	%tmp913 = add double %tmp912, 1.000000e+00		; <double> [#uses=1]
	%tmp915 = sub double %tmp913, %tmp590		; <double> [#uses=1]
	%tmp916 = mul double %tmp761, %tmp915		; <double> [#uses=1]
	%tmp917 = add double %tmp901, %tmp916		; <double> [#uses=1]
	%tmp894919 = sext i32 %tmp894 to i64		; <i64> [#uses=1]
	%tmp920 = getelementptr double* %dstGrid, i64 %tmp894919		; <double*> [#uses=1]
	store double %tmp917, double* %tmp920, align 8
	%tmp922 = add i32 %i.0.reg2mem.0, 198013		; <i32> [#uses=1]
	%tmp928 = load double* %tmp312, align 8		; <double> [#uses=1]
	%tmp929 = mul double %tmp928, -9.500000e-01		; <double> [#uses=1]
	%tmp934 = sub double %uz.0, %uy.0		; <double> [#uses=2]
	%tmp938 = mul double %tmp934, 4.500000e+00		; <double> [#uses=1]
	%tmp939 = add double %tmp938, 3.000000e+00		; <double> [#uses=1]
	%tmp940 = mul double %tmp934, %tmp939		; <double> [#uses=1]
	%tmp941 = add double %tmp940, 1.000000e+00		; <double> [#uses=1]
	%tmp943 = sub double %tmp941, %tmp590		; <double> [#uses=1]
	%tmp944 = mul double %tmp761, %tmp943		; <double> [#uses=1]
	%tmp945 = add double %tmp929, %tmp944		; <double> [#uses=1]
	%tmp922947 = sext i32 %tmp922 to i64		; <i64> [#uses=1]
	%tmp948 = getelementptr double* %dstGrid, i64 %tmp922947		; <double*> [#uses=1]
	store double %tmp945, double* %tmp948, align 8
	%tmp950 = add i32 %i.0.reg2mem.0, -201986		; <i32> [#uses=1]
	%tmp956 = load double* %tmp319, align 8		; <double> [#uses=1]
	%tmp957 = mul double %tmp956, -9.500000e-01		; <double> [#uses=1]
	%tmp961 = sub double -0.000000e+00, %uy.0		; <double> [#uses=1]
	%tmp963 = sub double %tmp961, %uz.0		; <double> [#uses=2]
	%tmp968 = mul double %tmp963, 4.500000e+00		; <double> [#uses=1]
	%tmp969 = add double %tmp968, 3.000000e+00		; <double> [#uses=1]
	%tmp970 = mul double %tmp963, %tmp969		; <double> [#uses=1]
	%tmp971 = add double %tmp970, 1.000000e+00		; <double> [#uses=1]
	%tmp973 = sub double %tmp971, %tmp590		; <double> [#uses=1]
	%tmp974 = mul double %tmp761, %tmp973		; <double> [#uses=1]
	%tmp975 = add double %tmp957, %tmp974		; <double> [#uses=1]
	%tmp950977 = sext i32 %tmp950 to i64		; <i64> [#uses=1]
	%tmp978 = getelementptr double* %dstGrid, i64 %tmp950977		; <double*> [#uses=1]
	store double %tmp975, double* %tmp978, align 8
	%tmp980 = add i32 %i.0.reg2mem.0, 200035		; <i32> [#uses=1]
	%tmp986 = load double* %tmp326, align 8		; <double> [#uses=1]
	%tmp987 = mul double %tmp986, -9.500000e-01		; <double> [#uses=1]
	%tmp992 = add double %ux.0, %uz.0		; <double> [#uses=2]
	%tmp996 = mul double %tmp992, 4.500000e+00		; <double> [#uses=1]
	%tmp997 = add double %tmp996, 3.000000e+00		; <double> [#uses=1]
	%tmp998 = mul double %tmp992, %tmp997		; <double> [#uses=1]
	%tmp999 = add double %tmp998, 1.000000e+00		; <double> [#uses=1]
	%tmp1001 = sub double %tmp999, %tmp590		; <double> [#uses=1]
	%tmp1002 = mul double %tmp761, %tmp1001		; <double> [#uses=1]
	%tmp1003 = add double %tmp987, %tmp1002		; <double> [#uses=1]
	%tmp9801005 = sext i32 %tmp980 to i64		; <i64> [#uses=1]
	%tmp1006 = getelementptr double* %dstGrid, i64 %tmp9801005		; <double*> [#uses=1]
	store double %tmp1003, double* %tmp1006, align 8
	%tmp1008 = add i32 %i.0.reg2mem.0, -199964		; <i32> [#uses=1]
	%tmp1015 = load double* %tmp333, align 8		; <double> [#uses=1]
	%tmp1016 = mul double %tmp1015, -9.500000e-01		; <double> [#uses=1]
	%tmp1021 = sub double %ux.0, %uz.0		; <double> [#uses=2]
	%tmp1025 = mul double %tmp1021, 4.500000e+00		; <double> [#uses=1]
	%tmp1026 = add double %tmp1025, 3.000000e+00		; <double> [#uses=1]
	%tmp1027 = mul double %tmp1021, %tmp1026		; <double> [#uses=1]
	%tmp1028 = add double %tmp1027, 1.000000e+00		; <double> [#uses=1]
	%tmp1030 = sub double %tmp1028, %tmp590		; <double> [#uses=1]
	%tmp1031 = mul double %tmp761, %tmp1030		; <double> [#uses=1]
	%tmp1032 = add double %tmp1016, %tmp1031		; <double> [#uses=1]
	%tmp10081034 = sext i32 %tmp1008 to i64		; <i64> [#uses=1]
	%tmp1035 = getelementptr double* %dstGrid, i64 %tmp10081034		; <double*> [#uses=1]
	store double %tmp1032, double* %tmp1035, align 8
	%tmp1037 = add i32 %i.0.reg2mem.0, 199997		; <i32> [#uses=1]
	%tmp1043 = load double* %tmp340, align 8		; <double> [#uses=1]
	%tmp1044 = mul double %tmp1043, -9.500000e-01		; <double> [#uses=1]
	%tmp1049 = sub double %uz.0, %ux.0		; <double> [#uses=2]
	%tmp1053 = mul double %tmp1049, 4.500000e+00		; <double> [#uses=1]
	%tmp1054 = add double %tmp1053, 3.000000e+00		; <double> [#uses=1]
	%tmp1055 = mul double %tmp1049, %tmp1054		; <double> [#uses=1]
	%tmp1056 = add double %tmp1055, 1.000000e+00		; <double> [#uses=1]
	%tmp1058 = sub double %tmp1056, %tmp590		; <double> [#uses=1]
	%tmp1059 = mul double %tmp761, %tmp1058		; <double> [#uses=1]
	%tmp1060 = add double %tmp1044, %tmp1059		; <double> [#uses=1]
	%tmp10371062 = sext i32 %tmp1037 to i64		; <i64> [#uses=1]
	%tmp1063 = getelementptr double* %dstGrid, i64 %tmp10371062		; <double*> [#uses=1]
	store double %tmp1060, double* %tmp1063, align 8
	%tmp1065 = add i32 %i.0.reg2mem.0, -200002		; <i32> [#uses=1]
	%tmp1071 = load double* %tmp347, align 8		; <double> [#uses=1]
	%tmp1072 = mul double %tmp1071, -9.500000e-01		; <double> [#uses=1]
	%tmp1078 = sub double %tmp847, %uz.0		; <double> [#uses=2]
	%tmp1083 = mul double %tmp1078, 4.500000e+00		; <double> [#uses=1]
	%tmp1084 = add double %tmp1083, 3.000000e+00		; <double> [#uses=1]
	%tmp1085 = mul double %tmp1078, %tmp1084		; <double> [#uses=1]
	%tmp1086 = add double %tmp1085, 1.000000e+00		; <double> [#uses=1]
	%tmp1088 = sub double %tmp1086, %tmp590		; <double> [#uses=1]
	%tmp1089 = mul double %tmp761, %tmp1088		; <double> [#uses=1]
	%tmp1090 = add double %tmp1072, %tmp1089		; <double> [#uses=1]
	%tmp10651092 = sext i32 %tmp1065 to i64		; <i64> [#uses=1]
	%tmp1093 = getelementptr double* %dstGrid, i64 %tmp10651092		; <double*> [#uses=1]
	store double %tmp1090, double* %tmp1093, align 8
	%tmp1096 = add i32 %i.0.reg2mem.0, 20		; <i32> [#uses=2]
	%tmp1099 = icmp slt i32 %tmp1096, 26000000		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp1099, label %bb, label %return

return:		; preds = %cond_next, %cond_true
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @LBM_showGridStatistics(double* %grid) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 6, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 6 )
	br label %bb

bb:		; preds = %bb421, %entry
	%indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb421 ]		; <i32> [#uses=2]
	%maxU2.1.reg2mem.0 = phi double [ -1.000000e+30, %entry ], [ %maxU2.0.reg2mem.0, %bb421 ]		; <double> [#uses=3]
	%minU2.2.reg2mem.0 = phi double [ 1.000000e+30, %entry ], [ %minU2.1.reg2mem.0, %bb421 ]		; <double> [#uses=3]
	%minRho.1.reg2mem.0 = phi double [ 1.000000e+30, %entry ], [ %minRho.0, %bb421 ]		; <double> [#uses=2]
	%maxRho.1.reg2mem.0 = phi double [ -1.000000e+30, %entry ], [ %maxRho.0, %bb421 ]		; <double> [#uses=2]
	%mass.0.reg2mem.0 = phi double [ 0.000000e+00, %entry ], [ %tmp148, %bb421 ]		; <double> [#uses=1]
	%nFluidCells.2.reg2mem.0 = phi i32 [ 0, %entry ], [ %nFluidCells.1.reg2mem.0, %bb421 ]		; <i32> [#uses=2]
	%nAccelCells.2.reg2mem.0 = phi i32 [ 0, %entry ], [ %nAccelCells.1.reg2mem.0, %bb421 ]		; <i32> [#uses=2]
	%nObstacleCells.1.reg2mem.0 = phi i32 [ 0, %entry ], [ %nObstacleCells.0.reg2mem.0, %bb421 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 22, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 22 )
	%i.0.reg2mem.0 = mul i32 %indvar, 20		; <i32> [#uses=20]
	%tmp12 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp3 = getelementptr double* %grid, i64 %tmp12		; <double*> [#uses=1]
	%tmp4 = load double* %tmp3, align 8		; <double> [#uses=1]
	%tmp6 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp68 = sext i32 %tmp6 to i64		; <i64> [#uses=1]
	%tmp9 = getelementptr double* %grid, i64 %tmp68		; <double*> [#uses=1]
	%tmp10 = load double* %tmp9, align 8		; <double> [#uses=2]
	%tmp11 = add double %tmp4, %tmp10		; <double> [#uses=1]
	%tmp14 = add i32 %i.0.reg2mem.0, 2		; <i32> [#uses=1]
	%tmp1416 = sext i32 %tmp14 to i64		; <i64> [#uses=1]
	%tmp17 = getelementptr double* %grid, i64 %tmp1416		; <double*> [#uses=1]
	%tmp18 = load double* %tmp17, align 8		; <double> [#uses=2]
	%tmp19 = add double %tmp11, %tmp18		; <double> [#uses=1]
	%tmp21 = add i32 %i.0.reg2mem.0, 3		; <i32> [#uses=1]
	%tmp2123 = sext i32 %tmp21 to i64		; <i64> [#uses=1]
	%tmp24 = getelementptr double* %grid, i64 %tmp2123		; <double*> [#uses=1]
	%tmp25 = load double* %tmp24, align 8		; <double> [#uses=2]
	%tmp26 = add double %tmp19, %tmp25		; <double> [#uses=1]
	%tmp28 = add i32 %i.0.reg2mem.0, 4		; <i32> [#uses=1]
	%tmp2830 = sext i32 %tmp28 to i64		; <i64> [#uses=1]
	%tmp31 = getelementptr double* %grid, i64 %tmp2830		; <double*> [#uses=1]
	%tmp32 = load double* %tmp31, align 8		; <double> [#uses=2]
	%tmp33 = add double %tmp26, %tmp32		; <double> [#uses=1]
	%tmp35 = add i32 %i.0.reg2mem.0, 5		; <i32> [#uses=1]
	%tmp3537 = sext i32 %tmp35 to i64		; <i64> [#uses=1]
	%tmp38 = getelementptr double* %grid, i64 %tmp3537		; <double*> [#uses=1]
	%tmp39 = load double* %tmp38, align 8		; <double> [#uses=2]
	%tmp40 = add double %tmp33, %tmp39		; <double> [#uses=1]
	%tmp42 = add i32 %i.0.reg2mem.0, 6		; <i32> [#uses=1]
	%tmp4244 = sext i32 %tmp42 to i64		; <i64> [#uses=1]
	%tmp45 = getelementptr double* %grid, i64 %tmp4244		; <double*> [#uses=1]
	%tmp46 = load double* %tmp45, align 8		; <double> [#uses=2]
	%tmp47 = add double %tmp40, %tmp46		; <double> [#uses=1]
	%tmp49 = add i32 %i.0.reg2mem.0, 7		; <i32> [#uses=1]
	%tmp4951 = sext i32 %tmp49 to i64		; <i64> [#uses=1]
	%tmp52 = getelementptr double* %grid, i64 %tmp4951		; <double*> [#uses=1]
	%tmp53 = load double* %tmp52, align 8		; <double> [#uses=3]
	%tmp54 = add double %tmp47, %tmp53		; <double> [#uses=1]
	%tmp56 = add i32 %i.0.reg2mem.0, 8		; <i32> [#uses=1]
	%tmp5658 = sext i32 %tmp56 to i64		; <i64> [#uses=1]
	%tmp59 = getelementptr double* %grid, i64 %tmp5658		; <double*> [#uses=1]
	%tmp60 = load double* %tmp59, align 8		; <double> [#uses=3]
	%tmp61 = add double %tmp54, %tmp60		; <double> [#uses=1]
	%tmp63 = add i32 %i.0.reg2mem.0, 9		; <i32> [#uses=1]
	%tmp6365 = sext i32 %tmp63 to i64		; <i64> [#uses=1]
	%tmp66 = getelementptr double* %grid, i64 %tmp6365		; <double*> [#uses=1]
	%tmp67 = load double* %tmp66, align 8		; <double> [#uses=3]
	%tmp69 = add double %tmp61, %tmp67		; <double> [#uses=1]
	%tmp71 = add i32 %i.0.reg2mem.0, 10		; <i32> [#uses=1]
	%tmp7173 = sext i32 %tmp71 to i64		; <i64> [#uses=1]
	%tmp74 = getelementptr double* %grid, i64 %tmp7173		; <double*> [#uses=1]
	%tmp75 = load double* %tmp74, align 8		; <double> [#uses=3]
	%tmp76 = add double %tmp69, %tmp75		; <double> [#uses=1]
	%tmp78 = add i32 %i.0.reg2mem.0, 11		; <i32> [#uses=1]
	%tmp7880 = sext i32 %tmp78 to i64		; <i64> [#uses=1]
	%tmp81 = getelementptr double* %grid, i64 %tmp7880		; <double*> [#uses=1]
	%tmp82 = load double* %tmp81, align 8		; <double> [#uses=3]
	%tmp83 = add double %tmp76, %tmp82		; <double> [#uses=1]
	%tmp85 = add i32 %i.0.reg2mem.0, 12		; <i32> [#uses=1]
	%tmp8587 = sext i32 %tmp85 to i64		; <i64> [#uses=1]
	%tmp88 = getelementptr double* %grid, i64 %tmp8587		; <double*> [#uses=1]
	%tmp89 = load double* %tmp88, align 8		; <double> [#uses=3]
	%tmp90 = add double %tmp83, %tmp89		; <double> [#uses=1]
	%tmp92 = add i32 %i.0.reg2mem.0, 13		; <i32> [#uses=1]
	%tmp9294 = sext i32 %tmp92 to i64		; <i64> [#uses=1]
	%tmp95 = getelementptr double* %grid, i64 %tmp9294		; <double*> [#uses=1]
	%tmp96 = load double* %tmp95, align 8		; <double> [#uses=3]
	%tmp97 = add double %tmp90, %tmp96		; <double> [#uses=1]
	%tmp99 = add i32 %i.0.reg2mem.0, 14		; <i32> [#uses=1]
	%tmp99101 = sext i32 %tmp99 to i64		; <i64> [#uses=1]
	%tmp102 = getelementptr double* %grid, i64 %tmp99101		; <double*> [#uses=1]
	%tmp103 = load double* %tmp102, align 8		; <double> [#uses=3]
	%tmp104 = add double %tmp97, %tmp103		; <double> [#uses=1]
	%tmp106 = add i32 %i.0.reg2mem.0, 15		; <i32> [#uses=1]
	%tmp106108 = sext i32 %tmp106 to i64		; <i64> [#uses=1]
	%tmp109 = getelementptr double* %grid, i64 %tmp106108		; <double*> [#uses=1]
	%tmp110 = load double* %tmp109, align 8		; <double> [#uses=3]
	%tmp111 = add double %tmp104, %tmp110		; <double> [#uses=1]
	%tmp113 = add i32 %i.0.reg2mem.0, 16		; <i32> [#uses=1]
	%tmp113115 = sext i32 %tmp113 to i64		; <i64> [#uses=1]
	%tmp116 = getelementptr double* %grid, i64 %tmp113115		; <double*> [#uses=1]
	%tmp117 = load double* %tmp116, align 8		; <double> [#uses=3]
	%tmp118 = add double %tmp111, %tmp117		; <double> [#uses=1]
	%tmp120 = add i32 %i.0.reg2mem.0, 17		; <i32> [#uses=1]
	%tmp120122 = sext i32 %tmp120 to i64		; <i64> [#uses=1]
	%tmp123 = getelementptr double* %grid, i64 %tmp120122		; <double*> [#uses=1]
	%tmp124 = load double* %tmp123, align 8		; <double> [#uses=3]
	%tmp125 = add double %tmp118, %tmp124		; <double> [#uses=1]
	%tmp127 = add i32 %i.0.reg2mem.0, 18		; <i32> [#uses=1]
	%tmp127129 = sext i32 %tmp127 to i64		; <i64> [#uses=1]
	%tmp130 = getelementptr double* %grid, i64 %tmp127129		; <double*> [#uses=1]
	%tmp131 = load double* %tmp130, align 8		; <double> [#uses=3]
	%tmp132 = add double %tmp125, %tmp131		; <double> [#uses=7]
	%tmp135 = fcmp olt double %tmp132, %minRho.1.reg2mem.0		; <i1> [#uses=1]
	%minRho.0 = select i1 %tmp135, double %tmp132, double %minRho.1.reg2mem.0		; <double> [#uses=2]
	%tmp140 = fcmp ogt double %tmp132, %maxRho.1.reg2mem.0		; <i1> [#uses=1]
	%maxRho.0 = select i1 %tmp140, double %tmp132, double %maxRho.1.reg2mem.0		; <double> [#uses=2]
	%tmp148 = add double %mass.0.reg2mem.0, %tmp132		; <double> [#uses=2]
	%tmp150 = add i32 %i.0.reg2mem.0, 19		; <i32> [#uses=1]
	%tmp150152 = sext i32 %tmp150 to i64		; <i64> [#uses=1]
	%tmp153 = getelementptr double* %grid, i64 %tmp150152		; <double*> [#uses=1]
	%tmp153154 = bitcast double* %tmp153 to i32*		; <i32*> [#uses=1]
	%tmp155 = load i32* %tmp153154, align 4		; <i32> [#uses=2]
	%tmp156157442 = and i32 %tmp155, 1		; <i32> [#uses=1]
	%toBool158 = icmp eq i32 %tmp156157442, 0		; <i1> [#uses=1]
	br i1 %toBool158, label %cond_false, label %cond_true159

cond_true159:		; preds = %bb
	%tmp161 = add i32 %nObstacleCells.1.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb421

cond_false:		; preds = %bb
	%tmp170171440 = lshr i32 %tmp155, 1		; <i32> [#uses=1]
	%tmp170171440.lobit444 = and i32 %tmp170171440, 1		; <i32> [#uses=2]
	%tmp = xor i32 %tmp170171440.lobit444, 1		; <i32> [#uses=1]
	%nFluidCells.0 = add i32 %tmp, %nFluidCells.2.reg2mem.0		; <i32> [#uses=1]
	%nAccelCells.0 = add i32 %tmp170171440.lobit444, %nAccelCells.2.reg2mem.0		; <i32> [#uses=1]
	%tmp192 = sub double %tmp25, %tmp32		; <double> [#uses=1]
	%tmp199 = add double %tmp192, %tmp53		; <double> [#uses=1]
	%tmp206 = sub double %tmp199, %tmp60		; <double> [#uses=1]
	%tmp213 = add double %tmp206, %tmp67		; <double> [#uses=1]
	%tmp220 = sub double %tmp213, %tmp75		; <double> [#uses=1]
	%tmp227 = add double %tmp220, %tmp110		; <double> [#uses=1]
	%tmp234 = add double %tmp227, %tmp117		; <double> [#uses=1]
	%tmp241 = sub double %tmp234, %tmp124		; <double> [#uses=1]
	%tmp248 = sub double %tmp241, %tmp131		; <double> [#uses=2]
	%tmp261 = sub double %tmp10, %tmp18		; <double> [#uses=1]
	%tmp268 = add double %tmp261, %tmp53		; <double> [#uses=1]
	%tmp275 = add double %tmp268, %tmp60		; <double> [#uses=1]
	%tmp282 = sub double %tmp275, %tmp67		; <double> [#uses=1]
	%tmp289 = sub double %tmp282, %tmp75		; <double> [#uses=1]
	%tmp296 = add double %tmp289, %tmp82		; <double> [#uses=1]
	%tmp303 = add double %tmp296, %tmp89		; <double> [#uses=1]
	%tmp310 = sub double %tmp303, %tmp96		; <double> [#uses=1]
	%tmp317 = sub double %tmp310, %tmp103		; <double> [#uses=2]
	%tmp330 = sub double %tmp39, %tmp46		; <double> [#uses=1]
	%tmp337 = add double %tmp330, %tmp82		; <double> [#uses=1]
	%tmp344 = sub double %tmp337, %tmp89		; <double> [#uses=1]
	%tmp351 = add double %tmp344, %tmp96		; <double> [#uses=1]
	%tmp358 = sub double %tmp351, %tmp103		; <double> [#uses=1]
	%tmp365 = add double %tmp358, %tmp110		; <double> [#uses=1]
	%tmp372 = sub double %tmp365, %tmp117		; <double> [#uses=1]
	%tmp379 = add double %tmp372, %tmp124		; <double> [#uses=1]
	%tmp386 = sub double %tmp379, %tmp131		; <double> [#uses=2]
	%tmp389 = mul double %tmp248, %tmp248		; <double> [#uses=1]
	%tmp392 = mul double %tmp317, %tmp317		; <double> [#uses=1]
	%tmp393 = add double %tmp389, %tmp392		; <double> [#uses=1]
	%tmp396 = mul double %tmp386, %tmp386		; <double> [#uses=1]
	%tmp397 = add double %tmp393, %tmp396		; <double> [#uses=1]
	%tmp400 = mul double %tmp132, %tmp132		; <double> [#uses=1]
	%tmp401 = fdiv double %tmp397, %tmp400		; <double> [#uses=4]
	%tmp404 = fcmp olt double %tmp401, %minU2.2.reg2mem.0		; <i1> [#uses=1]
	%minU2.0 = select i1 %tmp404, double %tmp401, double %minU2.2.reg2mem.0		; <double> [#uses=1]
	%tmp412 = fcmp ogt double %tmp401, %maxU2.1.reg2mem.0		; <i1> [#uses=1]
	%maxU2.0 = select i1 %tmp412, double %tmp401, double %maxU2.1.reg2mem.0		; <double> [#uses=1]
	br label %bb421

bb421:		; preds = %cond_false, %cond_true159
	%maxU2.0.reg2mem.0 = phi double [ %maxU2.1.reg2mem.0, %cond_true159 ], [ %maxU2.0, %cond_false ]		; <double> [#uses=2]
	%minU2.1.reg2mem.0 = phi double [ %minU2.2.reg2mem.0, %cond_true159 ], [ %minU2.0, %cond_false ]		; <double> [#uses=2]
	%nFluidCells.1.reg2mem.0 = phi i32 [ %nFluidCells.2.reg2mem.0, %cond_true159 ], [ %nFluidCells.0, %cond_false ]		; <i32> [#uses=2]
	%nAccelCells.1.reg2mem.0 = phi i32 [ %nAccelCells.2.reg2mem.0, %cond_true159 ], [ %nAccelCells.0, %cond_false ]		; <i32> [#uses=2]
	%nObstacleCells.0.reg2mem.0 = phi i32 [ %tmp161, %cond_true159 ], [ %nObstacleCells.1.reg2mem.0, %cond_false ]		; <i32> [#uses=2]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 1300000		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb426, label %bb

bb426:		; preds = %bb421
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 6, i32* @cg_caller_id_var, align 4
	%tmp428 = tail call double @llvm.sqrt.f64( double %maxU2.0.reg2mem.0 )		; <double> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 6, i32* @cg_caller_id_var, align 4
	%tmp430 = tail call double @llvm.sqrt.f64( double %minU2.1.reg2mem.0 )		; <double> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 6, i32* @cg_caller_id_var, align 4
	%tmp438 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([138 x i8]* @.str2, i32 0, i64 0), i32 %nObstacleCells.0.reg2mem.0, i32 %nAccelCells.1.reg2mem.0, i32 %nFluidCells.1.reg2mem.0, double %minRho.0, double %maxRho.0, double %tmp148, double %tmp430, double %tmp428 ) nounwind 		; <i32> [#uses=0]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare double @llvm.sqrt.f64(double) nounwind readnone 

declare i64 @fread(i8* noalias , i64, i64, %struct.FILE* noalias )

declare i64 @fwrite(i8* noalias , i64, i64, %struct.FILE* noalias )

define i32 @main(i32 %nArgs, i8** %arg) {
entry:
	store i32 7, i32* @cg_caller_id_var, align 4
	%fileUx.i = alloca float		; <float*> [#uses=2]
	%fileUy.i = alloca float		; <float*> [#uses=2]
	%fileUz.i = alloca float		; <float*> [#uses=2]
	%ux.i = alloca float		; <float*> [#uses=2]
	%uy.i = alloca float		; <float*> [#uses=2]
	%uz.i = alloca float		; <float*> [#uses=2]
	%fileStat.i = alloca %struct.stat		; <%struct.stat*> [#uses=3]
	%tmp6.i = add i32 %nArgs, -5		; <i32> [#uses=1]
	%tmp7.i = icmp ugt i32 %tmp6.i, 1		; <i1> [#uses=1]
	br i1 %tmp7.i, label %cond_true.i, label %cond_next.i

cond_true.i:		; preds = %entry
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp10.i = call i32 @puts( i8* getelementptr ([108 x i8]* @.str26, i32 0, i64 0) )		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

cond_next.i:		; preds = %entry
	%tmp12.i = getelementptr i8** %arg, i64 1		; <i8**> [#uses=1]
	%tmp13.i = load i8** %tmp12.i, align 8		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp22.i = call i64 @__strtol_internal( i8* noalias  %tmp13.i, i8** noalias  null, i32 10, i32 0 ) nounwind 		; <i64> [#uses=1]
	%tmp2425.i = trunc i64 %tmp22.i to i32		; <i32> [#uses=4]
	%tmp32.i = getelementptr i8** %arg, i64 2		; <i8**> [#uses=1]
	%tmp33.i = load i8** %tmp32.i, align 8		; <i8*> [#uses=5]
	%tmp37.i = getelementptr i8** %arg, i64 3		; <i8**> [#uses=1]
	%tmp38.i = load i8** %tmp37.i, align 8		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp50.i = call i64 @__strtol_internal( i8* noalias  %tmp38.i, i8** noalias  null, i32 10, i32 0 ) nounwind 		; <i64> [#uses=2]
	%tmp5354.i = trunc i64 %tmp50.i to i32		; <i32> [#uses=2]
	%tmp61.i = getelementptr i8** %arg, i64 4		; <i8**> [#uses=1]
	%tmp62.i = load i8** %tmp61.i, align 8		; <i8*> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp74.i = call i64 @__strtol_internal( i8* noalias  %tmp62.i, i8** noalias  null, i32 10, i32 0 ) nounwind 		; <i64> [#uses=2]
	%tmp7778.i = trunc i64 %tmp74.i to i32		; <i32> [#uses=1]
	%tmp85.i = icmp eq i32 %nArgs, 6		; <i1> [#uses=1]
	br i1 %tmp85.i, label %cond_true88.i, label %cond_next131.i

cond_true88.i:		; preds = %cond_next.i
	%tmp90.i = getelementptr i8** %arg, i64 5		; <i8**> [#uses=1]
	%tmp91.i = load i8** %tmp90.i, align 8		; <i8*> [#uses=4]
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp100.i = call i32 @__xstat( i32 1, i8* %tmp91.i, %struct.stat* %fileStat.i ) nounwind 		; <i32> [#uses=1]
	%tmp104.i = icmp eq i32 %tmp100.i, 0		; <i1> [#uses=1]
	br i1 %tmp104.i, label %cond_next113.i, label %cond_true107.i

cond_true107.i:		; preds = %cond_true88.i
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp112.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([55 x i8]* @.str37, i32 0, i64 0), i8* %tmp91.i ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

cond_next113.i:		; preds = %cond_true88.i
	%tmp114.i = getelementptr %struct.stat* %fileStat.i, i32 0, i32 8		; <i64*> [#uses=1]
	%tmp115.i = load i64* %tmp114.i, align 8		; <i64> [#uses=2]
	%tmp116.i = icmp eq i64 %tmp115.i, 1313130		; <i1> [#uses=1]
	br i1 %tmp116.i, label %cond_next131.i, label %cond_true119.i

cond_true119.i:		; preds = %cond_next113.i
	%tmp121122.i = trunc i64 %tmp115.i to i32		; <i32> [#uses=1]
	store i32 6, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp127.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([82 x i8]* @.str48, i32 0, i64 0), i8* %tmp91.i, i32 %tmp121122.i, i32 1313130 ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

cond_next131.i:		; preds = %cond_next113.i, %cond_next.i
	%param.4.0 = phi i8* [ null, %cond_next.i ], [ %tmp91.i, %cond_next113.i ]		; <i8*> [#uses=4]
	%tmp135.i = icmp eq i32 %tmp5354.i, 1		; <i1> [#uses=1]
	br i1 %tmp135.i, label %cond_true138.i, label %MAIN_parseCommandLine.exit

cond_true138.i:		; preds = %cond_next131.i
	store i32 7, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp147.i = call i32 @__xstat( i32 1, i8* %tmp33.i, %struct.stat* %fileStat.i ) nounwind 		; <i32> [#uses=1]
	%tmp151.i = icmp eq i32 %tmp147.i, 0		; <i1> [#uses=1]
	br i1 %tmp151.i, label %MAIN_parseCommandLine.exit, label %cond_true154.i

cond_true154.i:		; preds = %cond_true138.i
	store i32 8, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp159.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([53 x i8]* @.str59, i32 0, i64 0), i8* %tmp33.i ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

MAIN_parseCommandLine.exit:		; preds = %cond_true138.i, %cond_next131.i
	%tmp7 = icmp eq i8* %param.4.0, null		; <i1> [#uses=2]
	%iftmp.25.0 = select i1 %tmp7, i8* getelementptr ([7 x i8]* @.str4, i32 0, i64 0), i8* %param.4.0		; <i8*> [#uses=1]
	%tmp1516 = and i64 %tmp74.i, 4294967295		; <i64> [#uses=1]
	%tmp18 = getelementptr [3 x [32 x i8]]* @simTypeString.2843, i32 0, i64 %tmp1516, i64 0		; <i8*> [#uses=1]
	%tmp2122 = and i64 %tmp50.i, 4294967295		; <i64> [#uses=1]
	%tmp24 = getelementptr [3 x [32 x i8]]* @actionString.2842, i32 0, i64 %tmp2122, i64 0		; <i8*> [#uses=1]
	store i32 9, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp33 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([174 x i8]* @.str15, i32 0, i64 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %tmp2425.i, i8* %tmp33.i, i8* %tmp24, i8* %tmp18, i8* %iftmp.25.0 ) nounwind 		; <i32> [#uses=0]
	%tmp14.i = malloc [26800000 x double]		; <[26800000 x double]*> [#uses=3]
	%tmp14.sub.i.c = bitcast [26800000 x double]* %tmp14.i to [26000000 x double]*		; <[26000000 x double]*> [#uses=1]
	store [26000000 x double]* %tmp14.sub.i.c, [26000000 x double]** @srcGrid, align 8
	%tmp5.i = icmp eq [26800000 x double]* %tmp14.i, null		; <i1> [#uses=1]
	br i1 %tmp5.i, label %cond_true.i1, label %LBM_allocateGrid.exit

cond_true.i1:		; preds = %MAIN_parseCommandLine.exit
	store i32 10, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp8.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([49 x i8]* @.str, i32 0, i64 0), double 0x40698EF800000000 ) nounwind 		; <i32> [#uses=0]
	store i32 11, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call void @CallProfPrinter( )
	call void @exit( i32 1 ) noreturn nounwind 
	unreachable

LBM_allocateGrid.exit:		; preds = %MAIN_parseCommandLine.exit
	%tmp11.i = getelementptr [26800000 x double]* %tmp14.i, i32 0, i64 400000		; <double*> [#uses=3]
	%tmp11.i.c = bitcast double* %tmp11.i to [26000000 x double]*		; <[26000000 x double]*> [#uses=1]
	store [26000000 x double]* %tmp11.i.c, [26000000 x double]** @srcGrid, align 8
	%tmp14.i122 = malloc [26800000 x double]		; <[26800000 x double]*> [#uses=3]
	%tmp14.sub.i123.c = bitcast [26800000 x double]* %tmp14.i122 to [26000000 x double]*		; <[26000000 x double]*> [#uses=1]
	store [26000000 x double]* %tmp14.sub.i123.c, [26000000 x double]** @dstGrid, align 8
	%tmp5.i124 = icmp eq [26800000 x double]* %tmp14.i122, null		; <i1> [#uses=1]
	br i1 %tmp5.i124, label %cond_true.i126, label %LBM_allocateGrid.exit129

cond_true.i126:		; preds = %LBM_allocateGrid.exit
	store i32 12, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp8.i125 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([49 x i8]* @.str, i32 0, i64 0), double 0x40698EF800000000 ) nounwind 		; <i32> [#uses=0]
	store i32 13, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call void @CallProfPrinter( )
	call void @exit( i32 1 ) noreturn nounwind 
	unreachable

LBM_allocateGrid.exit129:		; preds = %LBM_allocateGrid.exit
	%tmp11.i127 = getelementptr [26800000 x double]* %tmp14.i122, i32 0, i64 400000		; <double*> [#uses=2]
	%tmp11.i127.c = bitcast double* %tmp11.i127 to [26000000 x double]*		; <[26000000 x double]*> [#uses=1]
	store [26000000 x double]* %tmp11.i127.c, [26000000 x double]** @dstGrid, align 8
	store i32 14, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeGrid( double* %tmp11.i )
	store i32 15, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeGrid( double* %tmp11.i127 )
	br i1 %tmp7, label %cond_next.i106, label %cond_true.i104

cond_true.i104:		; preds = %LBM_allocateGrid.exit129
	store i32 16, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_loadObstacleFile( double* %tmp11.i, i8* %param.4.0 )
	%tmp17.i = load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp1718.i = getelementptr [26000000 x double]* %tmp17.i, i32 0, i32 0		; <double*> [#uses=1]
	store i32 17, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_loadObstacleFile( double* %tmp1718.i, i8* %param.4.0 )
	br label %cond_next.i106

cond_next.i106:		; preds = %cond_true.i104, %LBM_allocateGrid.exit129
	%tmp22.i105 = icmp eq i32 %tmp7778.i, 1		; <i1> [#uses=2]
	%tmp26.i = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp2627.i = getelementptr [26000000 x double]* %tmp26.i, i32 0, i32 0		; <double*> [#uses=3]
	br i1 %tmp22.i105, label %cond_true25.i, label %cond_false.i108

cond_true25.i:		; preds = %cond_next.i106
	store i32 18, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeSpecialCellsForChannel( double* %tmp2627.i )
	%tmp28.i = load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp2829.i = getelementptr [26000000 x double]* %tmp28.i, i32 0, i32 0		; <double*> [#uses=1]
	store i32 19, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeSpecialCellsForChannel( double* %tmp2829.i )
	br label %MAIN_initialize.exit

cond_false.i108:		; preds = %cond_next.i106
	store i32 20, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeSpecialCellsForLDC( double* %tmp2627.i )
	%tmp32.i107 = load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp3233.i = getelementptr [26000000 x double]* %tmp32.i107, i32 0, i32 0		; <double*> [#uses=1]
	store i32 21, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_initializeSpecialCellsForLDC( double* %tmp3233.i )
	br label %MAIN_initialize.exit

MAIN_initialize.exit:		; preds = %cond_false.i108, %cond_true25.i
	store i32 22, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_showGridStatistics( double* %tmp2627.i )
	%tmp65116 = icmp slt i32 %tmp2425.i, 1		; <i1> [#uses=1]
	br i1 %tmp65116, label %bb68, label %bb.preheader

bb.preheader:		; preds = %MAIN_initialize.exit
	br i1 %tmp22.i105, label %bb.us, label %bb

bb.us:		; preds = %bb61.us, %bb.preheader
	%indvar = phi i32 [ %t.0.reg2mem.0.us, %bb61.us ], [ 0, %bb.preheader ]		; <i32> [#uses=2]
	%val311 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val412 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 29, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val311, i32 %val412, i32 29 )
	%t.0.reg2mem.0.us = add i32 %indvar, 1		; <i32> [#uses=3]
	%tmp40.us = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=116]
	br label %bb.i

bb.i:		; preds = %bb.i, %bb.us
	%indvar1808.i = phi i32 [ 0, %bb.us ], [ %indvar.next1809.i, %bb.i ]		; <i32> [#uses=2]
	%val315 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val416 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 31, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val315, i32 %val416, i32 31 )
	%i.0.reg2mem.0.i = mul i32 %indvar1808.i, 20		; <i32> [#uses=59]
	%tmp1.i130 = add i32 %i.0.reg2mem.0.i, 200000		; <i32> [#uses=1]
	%tmp13.i131 = sext i32 %tmp1.i130 to i64		; <i64> [#uses=1]
	%tmp4.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp13.i131		; <double*> [#uses=1]
	%tmp5.i132 = load double* %tmp4.i, align 8		; <double> [#uses=1]
	%tmp7.i133 = add i32 %i.0.reg2mem.0.i, 200001		; <i32> [#uses=1]
	%tmp79.i = sext i32 %tmp7.i133 to i64		; <i64> [#uses=1]
	%tmp10.i134 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp79.i		; <double*> [#uses=1]
	%tmp11.i135 = load double* %tmp10.i134, align 8		; <double> [#uses=1]
	%tmp12.i136 = add double %tmp5.i132, %tmp11.i135		; <double> [#uses=1]
	%tmp15.i137 = add i32 %i.0.reg2mem.0.i, 200002		; <i32> [#uses=1]
	%tmp1517.i = sext i32 %tmp15.i137 to i64		; <i64> [#uses=1]
	%tmp18.i138 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp1517.i		; <double*> [#uses=1]
	%tmp19.i = load double* %tmp18.i138, align 8		; <double> [#uses=1]
	%tmp20.i = add double %tmp12.i136, %tmp19.i		; <double> [#uses=1]
	%tmp22.i139 = add i32 %i.0.reg2mem.0.i, 200003		; <i32> [#uses=1]
	%tmp2224.i = sext i32 %tmp22.i139 to i64		; <i64> [#uses=1]
	%tmp25.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp2224.i		; <double*> [#uses=1]
	%tmp26.i140 = load double* %tmp25.i, align 8		; <double> [#uses=1]
	%tmp27.i = add double %tmp20.i, %tmp26.i140		; <double> [#uses=1]
	%tmp29.i = add i32 %i.0.reg2mem.0.i, 200004		; <i32> [#uses=1]
	%tmp2931.i = sext i32 %tmp29.i to i64		; <i64> [#uses=1]
	%tmp32.i141 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp2931.i		; <double*> [#uses=1]
	%tmp33.i142 = load double* %tmp32.i141, align 8		; <double> [#uses=1]
	%tmp34.i143 = add double %tmp27.i, %tmp33.i142		; <double> [#uses=1]
	%tmp36.i144 = add i32 %i.0.reg2mem.0.i, 200005		; <i32> [#uses=1]
	%tmp3638.i = sext i32 %tmp36.i144 to i64		; <i64> [#uses=1]
	%tmp39.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp3638.i		; <double*> [#uses=1]
	%tmp40.i = load double* %tmp39.i, align 8		; <double> [#uses=1]
	%tmp41.i = add double %tmp34.i143, %tmp40.i		; <double> [#uses=1]
	%tmp43.i = add i32 %i.0.reg2mem.0.i, 200006		; <i32> [#uses=1]
	%tmp4345.i = sext i32 %tmp43.i to i64		; <i64> [#uses=1]
	%tmp46.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp4345.i		; <double*> [#uses=1]
	%tmp47.i = load double* %tmp46.i, align 8		; <double> [#uses=1]
	%tmp48.i145 = add double %tmp41.i, %tmp47.i		; <double> [#uses=1]
	%tmp50.i146 = add i32 %i.0.reg2mem.0.i, 200007		; <i32> [#uses=1]
	%tmp5052.i = sext i32 %tmp50.i146 to i64		; <i64> [#uses=1]
	%tmp53.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp5052.i		; <double*> [#uses=1]
	%tmp54.i = load double* %tmp53.i, align 8		; <double> [#uses=1]
	%tmp55.i = add double %tmp48.i145, %tmp54.i		; <double> [#uses=1]
	%tmp57.i = add i32 %i.0.reg2mem.0.i, 200008		; <i32> [#uses=1]
	%tmp5759.i = sext i32 %tmp57.i to i64		; <i64> [#uses=1]
	%tmp60.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp5759.i		; <double*> [#uses=1]
	%tmp61.i147 = load double* %tmp60.i, align 8		; <double> [#uses=1]
	%tmp62.i148 = add double %tmp55.i, %tmp61.i147		; <double> [#uses=1]
	%tmp64.i149 = add i32 %i.0.reg2mem.0.i, 200009		; <i32> [#uses=1]
	%tmp6466.i = sext i32 %tmp64.i149 to i64		; <i64> [#uses=1]
	%tmp67.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp6466.i		; <double*> [#uses=1]
	%tmp68.i = load double* %tmp67.i, align 8		; <double> [#uses=1]
	%tmp69.i = add double %tmp62.i148, %tmp68.i		; <double> [#uses=1]
	%tmp71.i = add i32 %i.0.reg2mem.0.i, 200010		; <i32> [#uses=1]
	%tmp7173.i = sext i32 %tmp71.i to i64		; <i64> [#uses=1]
	%tmp74.i150 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp7173.i		; <double*> [#uses=1]
	%tmp75.i = load double* %tmp74.i150, align 8		; <double> [#uses=1]
	%tmp76.i151 = add double %tmp69.i, %tmp75.i		; <double> [#uses=1]
	%tmp78.i152 = add i32 %i.0.reg2mem.0.i, 200011		; <i32> [#uses=1]
	%tmp7881.i = sext i32 %tmp78.i152 to i64		; <i64> [#uses=1]
	%tmp82.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp7881.i		; <double*> [#uses=1]
	%tmp83.i = load double* %tmp82.i, align 8		; <double> [#uses=1]
	%tmp84.i = add double %tmp76.i151, %tmp83.i		; <double> [#uses=1]
	%tmp86.i = add i32 %i.0.reg2mem.0.i, 200012		; <i32> [#uses=1]
	%tmp8688.i = sext i32 %tmp86.i to i64		; <i64> [#uses=1]
	%tmp89.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp8688.i		; <double*> [#uses=1]
	%tmp90.i153 = load double* %tmp89.i, align 8		; <double> [#uses=1]
	%tmp91.i154 = add double %tmp84.i, %tmp90.i153		; <double> [#uses=1]
	%tmp93.i = add i32 %i.0.reg2mem.0.i, 200013		; <i32> [#uses=1]
	%tmp9395.i = sext i32 %tmp93.i to i64		; <i64> [#uses=1]
	%tmp96.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp9395.i		; <double*> [#uses=1]
	%tmp97.i = load double* %tmp96.i, align 8		; <double> [#uses=1]
	%tmp98.i = add double %tmp91.i154, %tmp97.i		; <double> [#uses=1]
	%tmp100.i155 = add i32 %i.0.reg2mem.0.i, 200014		; <i32> [#uses=1]
	%tmp100102.i = sext i32 %tmp100.i155 to i64		; <i64> [#uses=1]
	%tmp103.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp100102.i		; <double*> [#uses=1]
	%tmp104.i156 = load double* %tmp103.i, align 8		; <double> [#uses=1]
	%tmp105.i157 = add double %tmp98.i, %tmp104.i156		; <double> [#uses=1]
	%tmp107.i = add i32 %i.0.reg2mem.0.i, 200015		; <i32> [#uses=1]
	%tmp107109.i = sext i32 %tmp107.i to i64		; <i64> [#uses=1]
	%tmp110.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp107109.i		; <double*> [#uses=1]
	%tmp111.i = load double* %tmp110.i, align 8		; <double> [#uses=1]
	%tmp112.i158 = add double %tmp105.i157, %tmp111.i		; <double> [#uses=1]
	%tmp114.i159 = add i32 %i.0.reg2mem.0.i, 200016		; <i32> [#uses=1]
	%tmp114116.i = sext i32 %tmp114.i159 to i64		; <i64> [#uses=1]
	%tmp117.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp114116.i		; <double*> [#uses=1]
	%tmp118.i160 = load double* %tmp117.i, align 8		; <double> [#uses=1]
	%tmp119.i161 = add double %tmp112.i158, %tmp118.i160		; <double> [#uses=1]
	%tmp121.i = add i32 %i.0.reg2mem.0.i, 200017		; <i32> [#uses=1]
	%tmp121123.i = sext i32 %tmp121.i to i64		; <i64> [#uses=1]
	%tmp124.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp121123.i		; <double*> [#uses=1]
	%tmp125.i = load double* %tmp124.i, align 8		; <double> [#uses=1]
	%tmp126.i = add double %tmp119.i161, %tmp125.i		; <double> [#uses=1]
	%tmp128.i = add i32 %i.0.reg2mem.0.i, 200018		; <i32> [#uses=1]
	%tmp128130.i = sext i32 %tmp128.i to i64		; <i64> [#uses=1]
	%tmp131.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp128130.i		; <double*> [#uses=1]
	%tmp132.i162 = load double* %tmp131.i, align 8		; <double> [#uses=1]
	%tmp133.i163 = add double %tmp126.i, %tmp132.i162		; <double> [#uses=1]
	%tmp135.i164 = add i32 %i.0.reg2mem.0.i, 400000		; <i32> [#uses=1]
	%tmp135137.i = sext i32 %tmp135.i164 to i64		; <i64> [#uses=1]
	%tmp138.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp135137.i		; <double*> [#uses=1]
	%tmp139.i = load double* %tmp138.i, align 8		; <double> [#uses=1]
	%tmp141.i = add i32 %i.0.reg2mem.0.i, 400001		; <i32> [#uses=1]
	%tmp141143.i = sext i32 %tmp141.i to i64		; <i64> [#uses=1]
	%tmp144.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp141143.i		; <double*> [#uses=1]
	%tmp145.i = load double* %tmp144.i, align 8		; <double> [#uses=1]
	%tmp146.i165 = add double %tmp139.i, %tmp145.i		; <double> [#uses=1]
	%tmp148.i166 = add i32 %i.0.reg2mem.0.i, 400002		; <i32> [#uses=1]
	%tmp148150.i = sext i32 %tmp148.i166 to i64		; <i64> [#uses=1]
	%tmp151.i167 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp148150.i		; <double*> [#uses=1]
	%tmp152.i = load double* %tmp151.i167, align 8		; <double> [#uses=1]
	%tmp153.i = add double %tmp146.i165, %tmp152.i		; <double> [#uses=1]
	%tmp155.i = add i32 %i.0.reg2mem.0.i, 400003		; <i32> [#uses=1]
	%tmp155157.i = sext i32 %tmp155.i to i64		; <i64> [#uses=1]
	%tmp158.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp155157.i		; <double*> [#uses=1]
	%tmp159.i168 = load double* %tmp158.i, align 8		; <double> [#uses=1]
	%tmp160.i169 = add double %tmp153.i, %tmp159.i168		; <double> [#uses=1]
	%tmp162.i170 = add i32 %i.0.reg2mem.0.i, 400004		; <i32> [#uses=1]
	%tmp162164.i = sext i32 %tmp162.i170 to i64		; <i64> [#uses=1]
	%tmp165.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp162164.i		; <double*> [#uses=1]
	%tmp166.i = load double* %tmp165.i, align 8		; <double> [#uses=1]
	%tmp167.i = add double %tmp160.i169, %tmp166.i		; <double> [#uses=1]
	%tmp169.i = add i32 %i.0.reg2mem.0.i, 400005		; <i32> [#uses=1]
	%tmp169171.i = sext i32 %tmp169.i to i64		; <i64> [#uses=1]
	%tmp172.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp169171.i		; <double*> [#uses=1]
	%tmp173.i = load double* %tmp172.i, align 8		; <double> [#uses=1]
	%tmp174.i171 = add double %tmp167.i, %tmp173.i		; <double> [#uses=1]
	%tmp176.i172 = add i32 %i.0.reg2mem.0.i, 400006		; <i32> [#uses=1]
	%tmp176178.i = sext i32 %tmp176.i172 to i64		; <i64> [#uses=1]
	%tmp179.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp176178.i		; <double*> [#uses=1]
	%tmp180.i = load double* %tmp179.i, align 8		; <double> [#uses=1]
	%tmp181.i = add double %tmp174.i171, %tmp180.i		; <double> [#uses=1]
	%tmp183.i = add i32 %i.0.reg2mem.0.i, 400007		; <i32> [#uses=1]
	%tmp183185.i = sext i32 %tmp183.i to i64		; <i64> [#uses=1]
	%tmp186.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp183185.i		; <double*> [#uses=1]
	%tmp187.i = load double* %tmp186.i, align 8		; <double> [#uses=1]
	%tmp188.i173 = add double %tmp181.i, %tmp187.i		; <double> [#uses=1]
	%tmp190.i174 = add i32 %i.0.reg2mem.0.i, 400008		; <i32> [#uses=1]
	%tmp190192.i = sext i32 %tmp190.i174 to i64		; <i64> [#uses=1]
	%tmp193.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp190192.i		; <double*> [#uses=1]
	%tmp194.i = load double* %tmp193.i, align 8		; <double> [#uses=1]
	%tmp195.i = add double %tmp188.i173, %tmp194.i		; <double> [#uses=1]
	%tmp197.i = add i32 %i.0.reg2mem.0.i, 400009		; <i32> [#uses=1]
	%tmp197199.i = sext i32 %tmp197.i to i64		; <i64> [#uses=1]
	%tmp200.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp197199.i		; <double*> [#uses=1]
	%tmp201.i = load double* %tmp200.i, align 8		; <double> [#uses=1]
	%tmp202.i175 = add double %tmp195.i, %tmp201.i		; <double> [#uses=1]
	%tmp204.i176 = add i32 %i.0.reg2mem.0.i, 400010		; <i32> [#uses=1]
	%tmp204206.i = sext i32 %tmp204.i176 to i64		; <i64> [#uses=1]
	%tmp207.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp204206.i		; <double*> [#uses=1]
	%tmp208.i = load double* %tmp207.i, align 8		; <double> [#uses=1]
	%tmp209.i = add double %tmp202.i175, %tmp208.i		; <double> [#uses=1]
	%tmp211.i = add i32 %i.0.reg2mem.0.i, 400011		; <i32> [#uses=1]
	%tmp211213.i = sext i32 %tmp211.i to i64		; <i64> [#uses=1]
	%tmp214.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp211213.i		; <double*> [#uses=1]
	%tmp215.i = load double* %tmp214.i, align 8		; <double> [#uses=1]
	%tmp216.i177 = add double %tmp209.i, %tmp215.i		; <double> [#uses=1]
	%tmp218.i178 = add i32 %i.0.reg2mem.0.i, 400012		; <i32> [#uses=1]
	%tmp218220.i = sext i32 %tmp218.i178 to i64		; <i64> [#uses=1]
	%tmp221.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp218220.i		; <double*> [#uses=1]
	%tmp222.i = load double* %tmp221.i, align 8		; <double> [#uses=1]
	%tmp223.i = add double %tmp216.i177, %tmp222.i		; <double> [#uses=1]
	%tmp225.i = add i32 %i.0.reg2mem.0.i, 400013		; <i32> [#uses=1]
	%tmp225227.i = sext i32 %tmp225.i to i64		; <i64> [#uses=1]
	%tmp228.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp225227.i		; <double*> [#uses=1]
	%tmp229.i = load double* %tmp228.i, align 8		; <double> [#uses=1]
	%tmp230.i179 = add double %tmp223.i, %tmp229.i		; <double> [#uses=1]
	%tmp232.i180 = add i32 %i.0.reg2mem.0.i, 400014		; <i32> [#uses=1]
	%tmp232234.i = sext i32 %tmp232.i180 to i64		; <i64> [#uses=1]
	%tmp235.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp232234.i		; <double*> [#uses=1]
	%tmp236.i = load double* %tmp235.i, align 8		; <double> [#uses=1]
	%tmp237.i = add double %tmp230.i179, %tmp236.i		; <double> [#uses=1]
	%tmp239.i = add i32 %i.0.reg2mem.0.i, 400015		; <i32> [#uses=1]
	%tmp239241.i = sext i32 %tmp239.i to i64		; <i64> [#uses=1]
	%tmp242.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp239241.i		; <double*> [#uses=1]
	%tmp243.i = load double* %tmp242.i, align 8		; <double> [#uses=1]
	%tmp244.i181 = add double %tmp237.i, %tmp243.i		; <double> [#uses=1]
	%tmp246.i182 = add i32 %i.0.reg2mem.0.i, 400016		; <i32> [#uses=1]
	%tmp246248.i = sext i32 %tmp246.i182 to i64		; <i64> [#uses=1]
	%tmp249.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp246248.i		; <double*> [#uses=1]
	%tmp250.i = load double* %tmp249.i, align 8		; <double> [#uses=1]
	%tmp251.i = add double %tmp244.i181, %tmp250.i		; <double> [#uses=1]
	%tmp253.i = add i32 %i.0.reg2mem.0.i, 400017		; <i32> [#uses=1]
	%tmp253255.i = sext i32 %tmp253.i to i64		; <i64> [#uses=1]
	%tmp256.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp253255.i		; <double*> [#uses=1]
	%tmp257.i = load double* %tmp256.i, align 8		; <double> [#uses=1]
	%tmp258.i183 = add double %tmp251.i, %tmp257.i		; <double> [#uses=1]
	%tmp260.i184 = add i32 %i.0.reg2mem.0.i, 400018		; <i32> [#uses=1]
	%tmp260262.i = sext i32 %tmp260.i184 to i64		; <i64> [#uses=1]
	%tmp263.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp260262.i		; <double*> [#uses=1]
	%tmp264.i = load double* %tmp263.i, align 8		; <double> [#uses=1]
	%tmp265.i = add double %tmp258.i183, %tmp264.i		; <double> [#uses=1]
	%tmp267.i = mul double %tmp133.i163, 2.000000e+00		; <double> [#uses=1]
	%tmp269.i185 = sub double %tmp267.i, %tmp265.i		; <double> [#uses=3]
	%tmp271.i = sdiv i32 %i.0.reg2mem.0.i, 20		; <i32> [#uses=1]
	%tmp272.i186 = srem i32 %tmp271.i, 100		; <i32> [#uses=1]
	%tmp272273.i = sitofp i32 %tmp272.i186 to double		; <double> [#uses=1]
	%tmp274.i187 = fdiv double %tmp272273.i, 4.950000e+01		; <double> [#uses=1]
	%tmp275.i = sub double %tmp274.i187, 1.000000e+00		; <double> [#uses=2]
	%tmp277.i = sdiv i32 %i.0.reg2mem.0.i, 2000		; <i32> [#uses=1]
	%tmp278.i = srem i32 %tmp277.i, 100		; <i32> [#uses=1]
	%tmp278279.i = sitofp i32 %tmp278.i to double		; <double> [#uses=1]
	%tmp280.i = fdiv double %tmp278279.i, 4.950000e+01		; <double> [#uses=1]
	%tmp281.i = sub double %tmp280.i, 1.000000e+00		; <double> [#uses=2]
	%tmp284.i = mul double %tmp275.i, %tmp275.i		; <double> [#uses=1]
	%tmp285.i = sub double 1.000000e+00, %tmp284.i		; <double> [#uses=1]
	%tmp286.i = mul double %tmp285.i, 1.000000e-02		; <double> [#uses=1]
	%tmp289.i = mul double %tmp281.i, %tmp281.i		; <double> [#uses=1]
	%tmp290.i = sub double 1.000000e+00, %tmp289.i		; <double> [#uses=1]
	%tmp291.i = mul double %tmp286.i, %tmp290.i		; <double> [#uses=9]
	%tmp301.i188 = mul double %tmp291.i, %tmp291.i		; <double> [#uses=1]
	%tmp302.i189 = add double %tmp301.i188, 0.000000e+00		; <double> [#uses=1]
	%tmp303.i = mul double %tmp302.i189, 1.500000e+00		; <double> [#uses=7]
	%tmp305.i = mul double %tmp269.i185, 0x3FD5555555555555		; <double> [#uses=1]
	%tmp307.i = sub double 1.000000e+00, %tmp303.i		; <double> [#uses=3]
	%tmp308.i = mul double %tmp305.i, %tmp307.i		; <double> [#uses=1]
	%tmp310311.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp312.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp310311.i		; <double*> [#uses=1]
	store double %tmp308.i, double* %tmp312.i, align 8
	%tmp314.i = add i32 %i.0.reg2mem.0.i, 1		; <i32> [#uses=1]
	%tmp316.i190 = mul double %tmp269.i185, 0x3FAC71C71C71C71C		; <double> [#uses=3]
	%tmp325.i = mul double %tmp316.i190, %tmp307.i		; <double> [#uses=4]
	%tmp314327.i = sext i32 %tmp314.i to i64		; <i64> [#uses=1]
	%tmp328.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp314327.i		; <double*> [#uses=1]
	store double %tmp325.i, double* %tmp328.i, align 8
	%tmp330.i191 = add i32 %i.0.reg2mem.0.i, 2		; <i32> [#uses=1]
	%tmp330343.i = sext i32 %tmp330.i191 to i64		; <i64> [#uses=1]
	%tmp344.i192 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp330343.i		; <double*> [#uses=1]
	store double %tmp325.i, double* %tmp344.i192, align 8
	%tmp346.i = add i32 %i.0.reg2mem.0.i, 3		; <i32> [#uses=1]
	%tmp346359.i = sext i32 %tmp346.i to i64		; <i64> [#uses=1]
	%tmp360.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp346359.i		; <double*> [#uses=1]
	store double %tmp325.i, double* %tmp360.i, align 8
	%tmp362.i = add i32 %i.0.reg2mem.0.i, 4		; <i32> [#uses=1]
	%tmp362375.i = sext i32 %tmp362.i to i64		; <i64> [#uses=1]
	%tmp376.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp362375.i		; <double*> [#uses=1]
	store double %tmp325.i, double* %tmp376.i, align 8
	%tmp378.i = add i32 %i.0.reg2mem.0.i, 5		; <i32> [#uses=1]
	%tmp382.i = mul double %tmp291.i, 4.500000e+00		; <double> [#uses=2]
	%tmp383.i = add double %tmp382.i, 3.000000e+00		; <double> [#uses=1]
	%tmp385.i193 = mul double %tmp383.i, %tmp291.i		; <double> [#uses=1]
	%tmp386.i194 = add double %tmp385.i193, 1.000000e+00		; <double> [#uses=1]
	%tmp388.i = sub double %tmp386.i194, %tmp303.i		; <double> [#uses=1]
	%tmp389.i = mul double %tmp316.i190, %tmp388.i		; <double> [#uses=1]
	%tmp378391.i = sext i32 %tmp378.i to i64		; <i64> [#uses=1]
	%tmp392.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp378391.i		; <double*> [#uses=1]
	store double %tmp389.i, double* %tmp392.i, align 8
	%tmp394.i = add i32 %i.0.reg2mem.0.i, 6		; <i32> [#uses=1]
	%tmp399.i195 = sub double %tmp382.i, 3.000000e+00		; <double> [#uses=1]
	%tmp401.i = mul double %tmp399.i195, %tmp291.i		; <double> [#uses=1]
	%tmp402.i = add double %tmp401.i, 1.000000e+00		; <double> [#uses=1]
	%tmp404.i = sub double %tmp402.i, %tmp303.i		; <double> [#uses=1]
	%tmp405.i = mul double %tmp316.i190, %tmp404.i		; <double> [#uses=1]
	%tmp394407.i = sext i32 %tmp394.i to i64		; <i64> [#uses=1]
	%tmp408.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp394407.i		; <double*> [#uses=1]
	store double %tmp405.i, double* %tmp408.i, align 8
	%tmp410.i = add i32 %i.0.reg2mem.0.i, 7		; <i32> [#uses=1]
	%tmp412.i = mul double %tmp269.i185, 0x3F9C71C71C71C71C		; <double> [#uses=5]
	%tmp425.i = mul double %tmp412.i, %tmp307.i		; <double> [#uses=4]
	%tmp410427.i = sext i32 %tmp410.i to i64		; <i64> [#uses=1]
	%tmp428.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp410427.i		; <double*> [#uses=1]
	store double %tmp425.i, double* %tmp428.i, align 8
	%tmp430.i = add i32 %i.0.reg2mem.0.i, 8		; <i32> [#uses=1]
	%tmp430447.i = sext i32 %tmp430.i to i64		; <i64> [#uses=1]
	%tmp448.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp430447.i		; <double*> [#uses=1]
	store double %tmp425.i, double* %tmp448.i, align 8
	%tmp450.i = add i32 %i.0.reg2mem.0.i, 9		; <i32> [#uses=1]
	%tmp450467.i = sext i32 %tmp450.i to i64		; <i64> [#uses=1]
	%tmp468.i196 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp450467.i		; <double*> [#uses=1]
	store double %tmp425.i, double* %tmp468.i196, align 8
	%tmp470.i197 = add i32 %i.0.reg2mem.0.i, 10		; <i32> [#uses=1]
	%tmp470489.i = sext i32 %tmp470.i197 to i64		; <i64> [#uses=1]
	%tmp490.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp470489.i		; <double*> [#uses=1]
	store double %tmp425.i, double* %tmp490.i, align 8
	%tmp492.i = add i32 %i.0.reg2mem.0.i, 11		; <i32> [#uses=1]
	%tmp497.i = add double %tmp291.i, 0.000000e+00		; <double> [#uses=2]
	%tmp501.i = mul double %tmp497.i, 4.500000e+00		; <double> [#uses=1]
	%tmp502.i = add double %tmp501.i, 3.000000e+00		; <double> [#uses=1]
	%tmp503.i = mul double %tmp497.i, %tmp502.i		; <double> [#uses=1]
	%tmp504.i = add double %tmp503.i, 1.000000e+00		; <double> [#uses=1]
	%tmp506.i = sub double %tmp504.i, %tmp303.i		; <double> [#uses=1]
	%tmp507.i = mul double %tmp412.i, %tmp506.i		; <double> [#uses=2]
	%tmp492509.i = sext i32 %tmp492.i to i64		; <i64> [#uses=1]
	%tmp510.i198 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp492509.i		; <double*> [#uses=1]
	store double %tmp507.i, double* %tmp510.i198, align 8
	%tmp512.i199 = add i32 %i.0.reg2mem.0.i, 12		; <i32> [#uses=1]
	%tmp517.i = sub double 0.000000e+00, %tmp291.i		; <double> [#uses=2]
	%tmp521.i = mul double %tmp517.i, 4.500000e+00		; <double> [#uses=1]
	%tmp522.i = add double %tmp521.i, 3.000000e+00		; <double> [#uses=1]
	%tmp523.i = mul double %tmp517.i, %tmp522.i		; <double> [#uses=1]
	%tmp524.i200 = add double %tmp523.i, 1.000000e+00		; <double> [#uses=1]
	%tmp526.i201 = sub double %tmp524.i200, %tmp303.i		; <double> [#uses=1]
	%tmp527.i = mul double %tmp412.i, %tmp526.i201		; <double> [#uses=2]
	%tmp512529.i = sext i32 %tmp512.i199 to i64		; <i64> [#uses=1]
	%tmp530.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp512529.i		; <double*> [#uses=1]
	store double %tmp527.i, double* %tmp530.i, align 8
	%tmp532.i = add i32 %i.0.reg2mem.0.i, 13		; <i32> [#uses=1]
	%tmp537.i = sub double %tmp291.i, 0.000000e+00		; <double> [#uses=2]
	%tmp541.i = mul double %tmp537.i, 4.500000e+00		; <double> [#uses=1]
	%tmp542.i = add double %tmp541.i, 3.000000e+00		; <double> [#uses=1]
	%tmp543.i = mul double %tmp537.i, %tmp542.i		; <double> [#uses=1]
	%tmp544.i = add double %tmp543.i, 1.000000e+00		; <double> [#uses=1]
	%tmp546.i = sub double %tmp544.i, %tmp303.i		; <double> [#uses=1]
	%tmp547.i = mul double %tmp412.i, %tmp546.i		; <double> [#uses=2]
	%tmp532549.i = sext i32 %tmp532.i to i64		; <i64> [#uses=1]
	%tmp550.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp532549.i		; <double*> [#uses=1]
	store double %tmp547.i, double* %tmp550.i, align 8
	%tmp552.i202 = add i32 %i.0.reg2mem.0.i, 14		; <i32> [#uses=1]
	%tmp558.i = sub double -0.000000e+00, %tmp291.i		; <double> [#uses=2]
	%tmp563.i = mul double %tmp558.i, 4.500000e+00		; <double> [#uses=1]
	%tmp564.i = add double %tmp563.i, 3.000000e+00		; <double> [#uses=1]
	%tmp565.i = mul double %tmp564.i, %tmp558.i		; <double> [#uses=1]
	%tmp566.i = add double %tmp565.i, 1.000000e+00		; <double> [#uses=1]
	%tmp568.i = sub double %tmp566.i, %tmp303.i		; <double> [#uses=1]
	%tmp569.i = mul double %tmp412.i, %tmp568.i		; <double> [#uses=2]
	%tmp552571.i = sext i32 %tmp552.i202 to i64		; <i64> [#uses=1]
	%tmp572.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp552571.i		; <double*> [#uses=1]
	store double %tmp569.i, double* %tmp572.i, align 8
	%tmp574.i = add i32 %i.0.reg2mem.0.i, 15		; <i32> [#uses=1]
	%tmp574591.i = sext i32 %tmp574.i to i64		; <i64> [#uses=1]
	%tmp592.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp574591.i		; <double*> [#uses=1]
	store double %tmp507.i, double* %tmp592.i, align 8
	%tmp594.i = add i32 %i.0.reg2mem.0.i, 16		; <i32> [#uses=1]
	%tmp594611.i = sext i32 %tmp594.i to i64		; <i64> [#uses=1]
	%tmp612.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp594611.i		; <double*> [#uses=1]
	store double %tmp527.i, double* %tmp612.i, align 8
	%tmp614.i = add i32 %i.0.reg2mem.0.i, 17		; <i32> [#uses=1]
	%tmp614631.i = sext i32 %tmp614.i to i64		; <i64> [#uses=1]
	%tmp632.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp614631.i		; <double*> [#uses=1]
	store double %tmp547.i, double* %tmp632.i, align 8
	%tmp634.i = add i32 %i.0.reg2mem.0.i, 18		; <i32> [#uses=1]
	%tmp634653.i = sext i32 %tmp634.i to i64		; <i64> [#uses=1]
	%tmp654.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp634653.i		; <double*> [#uses=1]
	store double %tmp569.i, double* %tmp654.i, align 8
	%indvar.next1809.i = add i32 %indvar1808.i, 1		; <i32> [#uses=2]
	%exitcond1810.i = icmp eq i32 %indvar.next1809.i, 10000		; <i1> [#uses=1]
	store i32 %val416, i32* @cg_caller_call_site_var, align 4
	store i32 %val315, i32* @cg_caller_id_var, align 4
	br i1 %exitcond1810.i, label %bb662.i, label %bb.i

bb662.i:		; preds = %bb662.i, %bb.i
	%indvar.i = phi i32 [ %indvar.next.i, %bb662.i ], [ 0, %bb.i ]		; <i32> [#uses=2]
	%val313 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val414 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 30, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val313, i32 %val414, i32 30 )
	%tmp.i203 = mul i32 %indvar.i, 20		; <i32> [#uses=57]
	%i.11805.i = add i32 %tmp.i203, 25800000		; <i32> [#uses=1]
	%tmp664.i = add i32 %tmp.i203, 25600000		; <i32> [#uses=1]
	%tmp664666.i = sext i32 %tmp664.i to i64		; <i64> [#uses=1]
	%tmp667.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp664666.i		; <double*> [#uses=1]
	%tmp668.i = load double* %tmp667.i, align 8		; <double> [#uses=1]
	%tmp670.i = add i32 %tmp.i203, 25600001		; <i32> [#uses=1]
	%tmp670672.i = sext i32 %tmp670.i to i64		; <i64> [#uses=1]
	%tmp673.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp670672.i		; <double*> [#uses=1]
	%tmp674.i = load double* %tmp673.i, align 8		; <double> [#uses=2]
	%tmp675.i = add double %tmp668.i, %tmp674.i		; <double> [#uses=1]
	%tmp677.i204 = add i32 %tmp.i203, 25600002		; <i32> [#uses=1]
	%tmp677679.i = sext i32 %tmp677.i204 to i64		; <i64> [#uses=1]
	%tmp680.i205 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp677679.i		; <double*> [#uses=1]
	%tmp681.i = load double* %tmp680.i205, align 8		; <double> [#uses=2]
	%tmp682.i = add double %tmp675.i, %tmp681.i		; <double> [#uses=1]
	%tmp684.i = add i32 %tmp.i203, 25600003		; <i32> [#uses=1]
	%tmp684686.i = sext i32 %tmp684.i to i64		; <i64> [#uses=1]
	%tmp687.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp684686.i		; <double*> [#uses=1]
	%tmp688.i = load double* %tmp687.i, align 8		; <double> [#uses=2]
	%tmp689.i = add double %tmp682.i, %tmp688.i		; <double> [#uses=1]
	%tmp691.i206 = add i32 %tmp.i203, 25600004		; <i32> [#uses=1]
	%tmp691693.i = sext i32 %tmp691.i206 to i64		; <i64> [#uses=1]
	%tmp694.i207 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp691693.i		; <double*> [#uses=1]
	%tmp695.i = load double* %tmp694.i207, align 8		; <double> [#uses=2]
	%tmp696.i = add double %tmp689.i, %tmp695.i		; <double> [#uses=1]
	%tmp698.i208 = add i32 %tmp.i203, 25600005		; <i32> [#uses=1]
	%tmp698700.i = sext i32 %tmp698.i208 to i64		; <i64> [#uses=1]
	%tmp701.i209 = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp698700.i		; <double*> [#uses=1]
	%tmp702.i = load double* %tmp701.i209, align 8		; <double> [#uses=2]
	%tmp703.i = add double %tmp696.i, %tmp702.i		; <double> [#uses=1]
	%tmp705.i = add i32 %tmp.i203, 25600006		; <i32> [#uses=1]
	%tmp705707.i = sext i32 %tmp705.i to i64		; <i64> [#uses=1]
	%tmp708.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp705707.i		; <double*> [#uses=1]
	%tmp709.i = load double* %tmp708.i, align 8		; <double> [#uses=2]
	%tmp710.i = add double %tmp703.i, %tmp709.i		; <double> [#uses=1]
	%tmp712.i = add i32 %tmp.i203, 25600007		; <i32> [#uses=1]
	%tmp712714.i = sext i32 %tmp712.i to i64		; <i64> [#uses=1]
	%tmp715.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp712714.i		; <double*> [#uses=1]
	%tmp716.i = load double* %tmp715.i, align 8		; <double> [#uses=3]
	%tmp717.i = add double %tmp710.i, %tmp716.i		; <double> [#uses=1]
	%tmp719.i = add i32 %tmp.i203, 25600008		; <i32> [#uses=1]
	%tmp719721.i = sext i32 %tmp719.i to i64		; <i64> [#uses=1]
	%tmp722.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp719721.i		; <double*> [#uses=1]
	%tmp723.i = load double* %tmp722.i, align 8		; <double> [#uses=3]
	%tmp724.i = add double %tmp717.i, %tmp723.i		; <double> [#uses=1]
	%tmp726.i = add i32 %tmp.i203, 25600009		; <i32> [#uses=1]
	%tmp726728.i = sext i32 %tmp726.i to i64		; <i64> [#uses=1]
	%tmp729.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp726728.i		; <double*> [#uses=1]
	%tmp730.i = load double* %tmp729.i, align 8		; <double> [#uses=3]
	%tmp731.i = add double %tmp724.i, %tmp730.i		; <double> [#uses=1]
	%tmp733.i = add i32 %tmp.i203, 25600010		; <i32> [#uses=1]
	%tmp733735.i = sext i32 %tmp733.i to i64		; <i64> [#uses=1]
	%tmp736.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp733735.i		; <double*> [#uses=1]
	%tmp737.i = load double* %tmp736.i, align 8		; <double> [#uses=3]
	%tmp738.i = add double %tmp731.i, %tmp737.i		; <double> [#uses=1]
	%tmp740.i = add i32 %tmp.i203, 25600011		; <i32> [#uses=1]
	%tmp740742.i = sext i32 %tmp740.i to i64		; <i64> [#uses=1]
	%tmp743.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp740742.i		; <double*> [#uses=1]
	%tmp744.i = load double* %tmp743.i, align 8		; <double> [#uses=3]
	%tmp745.i210 = add double %tmp738.i, %tmp744.i		; <double> [#uses=1]
	%tmp747.i = add i32 %tmp.i203, 25600012		; <i32> [#uses=1]
	%tmp747749.i = sext i32 %tmp747.i to i64		; <i64> [#uses=1]
	%tmp750.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp747749.i		; <double*> [#uses=1]
	%tmp751.i = load double* %tmp750.i, align 8		; <double> [#uses=3]
	%tmp752.i = add double %tmp745.i210, %tmp751.i		; <double> [#uses=1]
	%tmp754.i = add i32 %tmp.i203, 25600013		; <i32> [#uses=1]
	%tmp754756.i = sext i32 %tmp754.i to i64		; <i64> [#uses=1]
	%tmp757.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp754756.i		; <double*> [#uses=1]
	%tmp758.i = load double* %tmp757.i, align 8		; <double> [#uses=3]
	%tmp759.i = add double %tmp752.i, %tmp758.i		; <double> [#uses=1]
	%tmp761.i = add i32 %tmp.i203, 25600014		; <i32> [#uses=1]
	%tmp761763.i = sext i32 %tmp761.i to i64		; <i64> [#uses=1]
	%tmp764.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp761763.i		; <double*> [#uses=1]
	%tmp765.i = load double* %tmp764.i, align 8		; <double> [#uses=3]
	%tmp766.i = add double %tmp759.i, %tmp765.i		; <double> [#uses=1]
	%tmp768.i = add i32 %tmp.i203, 25600015		; <i32> [#uses=1]
	%tmp768770.i = sext i32 %tmp768.i to i64		; <i64> [#uses=1]
	%tmp771.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp768770.i		; <double*> [#uses=1]
	%tmp772.i = load double* %tmp771.i, align 8		; <double> [#uses=3]
	%tmp773.i = add double %tmp766.i, %tmp772.i		; <double> [#uses=1]
	%tmp775.i = add i32 %tmp.i203, 25600016		; <i32> [#uses=1]
	%tmp775777.i = sext i32 %tmp775.i to i64		; <i64> [#uses=1]
	%tmp778.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp775777.i		; <double*> [#uses=1]
	%tmp779.i = load double* %tmp778.i, align 8		; <double> [#uses=3]
	%tmp780.i = add double %tmp773.i, %tmp779.i		; <double> [#uses=1]
	%tmp782.i = add i32 %tmp.i203, 25600017		; <i32> [#uses=1]
	%tmp782784.i = sext i32 %tmp782.i to i64		; <i64> [#uses=1]
	%tmp785.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp782784.i		; <double*> [#uses=1]
	%tmp786.i = load double* %tmp785.i, align 8		; <double> [#uses=3]
	%tmp787.i211 = add double %tmp780.i, %tmp786.i		; <double> [#uses=1]
	%tmp789.i = add i32 %tmp.i203, 25600018		; <i32> [#uses=1]
	%tmp789791.i = sext i32 %tmp789.i to i64		; <i64> [#uses=1]
	%tmp792.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp789791.i		; <double*> [#uses=1]
	%tmp793.i = load double* %tmp792.i, align 8		; <double> [#uses=3]
	%tmp794.i = add double %tmp787.i211, %tmp793.i		; <double> [#uses=3]
	%tmp807.i = sub double %tmp688.i, %tmp695.i		; <double> [#uses=1]
	%tmp814.i = add double %tmp807.i, %tmp716.i		; <double> [#uses=1]
	%tmp821.i = sub double %tmp814.i, %tmp723.i		; <double> [#uses=1]
	%tmp828.i = add double %tmp821.i, %tmp730.i		; <double> [#uses=1]
	%tmp835.i = sub double %tmp828.i, %tmp737.i		; <double> [#uses=1]
	%tmp842.i212 = add double %tmp835.i, %tmp772.i		; <double> [#uses=1]
	%tmp849.i213 = add double %tmp842.i212, %tmp779.i		; <double> [#uses=1]
	%tmp856.i214 = sub double %tmp849.i213, %tmp786.i		; <double> [#uses=1]
	%tmp863.i215 = sub double %tmp856.i214, %tmp793.i		; <double> [#uses=1]
	%tmp876.i = sub double %tmp674.i, %tmp681.i		; <double> [#uses=1]
	%tmp883.i = add double %tmp876.i, %tmp716.i		; <double> [#uses=1]
	%tmp890.i = add double %tmp883.i, %tmp723.i		; <double> [#uses=1]
	%tmp897.i = sub double %tmp890.i, %tmp730.i		; <double> [#uses=1]
	%tmp904.i = sub double %tmp897.i, %tmp737.i		; <double> [#uses=1]
	%tmp911.i = add double %tmp904.i, %tmp744.i		; <double> [#uses=1]
	%tmp918.i = add double %tmp911.i, %tmp751.i		; <double> [#uses=1]
	%tmp925.i = sub double %tmp918.i, %tmp758.i		; <double> [#uses=1]
	%tmp932.i = sub double %tmp925.i, %tmp765.i		; <double> [#uses=1]
	%tmp945.i = sub double %tmp702.i, %tmp709.i		; <double> [#uses=1]
	%tmp952.i = add double %tmp945.i, %tmp744.i		; <double> [#uses=1]
	%tmp959.i = sub double %tmp952.i, %tmp751.i		; <double> [#uses=1]
	%tmp966.i = add double %tmp959.i, %tmp758.i		; <double> [#uses=1]
	%tmp973.i = sub double %tmp966.i, %tmp765.i		; <double> [#uses=1]
	%tmp980.i = add double %tmp973.i, %tmp772.i		; <double> [#uses=1]
	%tmp987.i = sub double %tmp980.i, %tmp779.i		; <double> [#uses=1]
	%tmp994.i = add double %tmp987.i, %tmp786.i		; <double> [#uses=1]
	%tmp1001.i = sub double %tmp994.i, %tmp793.i		; <double> [#uses=1]
	%tmp1004.i = fdiv double %tmp863.i215, %tmp794.i		; <double> [#uses=1]
	%tmp1007.i = fdiv double %tmp932.i, %tmp794.i		; <double> [#uses=1]
	%tmp1010.i = fdiv double %tmp1001.i, %tmp794.i		; <double> [#uses=1]
	%tmp1012.i = add i32 %tmp.i203, 25400000		; <i32> [#uses=1]
	%tmp10121014.i = sext i32 %tmp1012.i to i64		; <i64> [#uses=1]
	%tmp1015.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10121014.i		; <double*> [#uses=1]
	%tmp1016.i = load double* %tmp1015.i, align 8		; <double> [#uses=1]
	%tmp1018.i = add i32 %tmp.i203, 25400001		; <i32> [#uses=1]
	%tmp10181020.i = sext i32 %tmp1018.i to i64		; <i64> [#uses=1]
	%tmp1021.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10181020.i		; <double*> [#uses=1]
	%tmp1022.i = load double* %tmp1021.i, align 8		; <double> [#uses=2]
	%tmp1023.i = add double %tmp1016.i, %tmp1022.i		; <double> [#uses=1]
	%tmp1025.i = add i32 %tmp.i203, 25400002		; <i32> [#uses=1]
	%tmp10251027.i = sext i32 %tmp1025.i to i64		; <i64> [#uses=1]
	%tmp1028.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10251027.i		; <double*> [#uses=1]
	%tmp1029.i = load double* %tmp1028.i, align 8		; <double> [#uses=2]
	%tmp1030.i = add double %tmp1023.i, %tmp1029.i		; <double> [#uses=1]
	%tmp1032.i = add i32 %tmp.i203, 25400003		; <i32> [#uses=1]
	%tmp10321034.i = sext i32 %tmp1032.i to i64		; <i64> [#uses=1]
	%tmp1035.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10321034.i		; <double*> [#uses=1]
	%tmp1036.i = load double* %tmp1035.i, align 8		; <double> [#uses=2]
	%tmp1037.i = add double %tmp1030.i, %tmp1036.i		; <double> [#uses=1]
	%tmp1039.i = add i32 %tmp.i203, 25400004		; <i32> [#uses=1]
	%tmp10391041.i = sext i32 %tmp1039.i to i64		; <i64> [#uses=1]
	%tmp1042.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10391041.i		; <double*> [#uses=1]
	%tmp1043.i = load double* %tmp1042.i, align 8		; <double> [#uses=2]
	%tmp1044.i = add double %tmp1037.i, %tmp1043.i		; <double> [#uses=1]
	%tmp1046.i = add i32 %tmp.i203, 25400005		; <i32> [#uses=1]
	%tmp10461048.i = sext i32 %tmp1046.i to i64		; <i64> [#uses=1]
	%tmp1049.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10461048.i		; <double*> [#uses=1]
	%tmp1050.i = load double* %tmp1049.i, align 8		; <double> [#uses=2]
	%tmp1051.i = add double %tmp1044.i, %tmp1050.i		; <double> [#uses=1]
	%tmp1053.i = add i32 %tmp.i203, 25400006		; <i32> [#uses=1]
	%tmp10531055.i = sext i32 %tmp1053.i to i64		; <i64> [#uses=1]
	%tmp1056.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10531055.i		; <double*> [#uses=1]
	%tmp1057.i = load double* %tmp1056.i, align 8		; <double> [#uses=2]
	%tmp1058.i = add double %tmp1051.i, %tmp1057.i		; <double> [#uses=1]
	%tmp1060.i = add i32 %tmp.i203, 25400007		; <i32> [#uses=1]
	%tmp10601062.i = sext i32 %tmp1060.i to i64		; <i64> [#uses=1]
	%tmp1063.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10601062.i		; <double*> [#uses=1]
	%tmp1064.i = load double* %tmp1063.i, align 8		; <double> [#uses=3]
	%tmp1065.i = add double %tmp1058.i, %tmp1064.i		; <double> [#uses=1]
	%tmp1067.i = add i32 %tmp.i203, 25400008		; <i32> [#uses=1]
	%tmp10671069.i = sext i32 %tmp1067.i to i64		; <i64> [#uses=1]
	%tmp1070.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10671069.i		; <double*> [#uses=1]
	%tmp1071.i = load double* %tmp1070.i, align 8		; <double> [#uses=3]
	%tmp1072.i = add double %tmp1065.i, %tmp1071.i		; <double> [#uses=1]
	%tmp1074.i = add i32 %tmp.i203, 25400009		; <i32> [#uses=1]
	%tmp10741076.i = sext i32 %tmp1074.i to i64		; <i64> [#uses=1]
	%tmp1077.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10741076.i		; <double*> [#uses=1]
	%tmp1078.i = load double* %tmp1077.i, align 8		; <double> [#uses=3]
	%tmp1079.i = add double %tmp1072.i, %tmp1078.i		; <double> [#uses=1]
	%tmp1081.i = add i32 %tmp.i203, 25400010		; <i32> [#uses=1]
	%tmp10811083.i = sext i32 %tmp1081.i to i64		; <i64> [#uses=1]
	%tmp1084.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10811083.i		; <double*> [#uses=1]
	%tmp1085.i = load double* %tmp1084.i, align 8		; <double> [#uses=3]
	%tmp1086.i = add double %tmp1079.i, %tmp1085.i		; <double> [#uses=1]
	%tmp1088.i = add i32 %tmp.i203, 25400011		; <i32> [#uses=1]
	%tmp10881090.i = sext i32 %tmp1088.i to i64		; <i64> [#uses=1]
	%tmp1091.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10881090.i		; <double*> [#uses=1]
	%tmp1092.i = load double* %tmp1091.i, align 8		; <double> [#uses=3]
	%tmp1093.i = add double %tmp1086.i, %tmp1092.i		; <double> [#uses=1]
	%tmp1095.i = add i32 %tmp.i203, 25400012		; <i32> [#uses=1]
	%tmp10951097.i = sext i32 %tmp1095.i to i64		; <i64> [#uses=1]
	%tmp1098.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp10951097.i		; <double*> [#uses=1]
	%tmp1099.i = load double* %tmp1098.i, align 8		; <double> [#uses=3]
	%tmp1100.i = add double %tmp1093.i, %tmp1099.i		; <double> [#uses=1]
	%tmp1102.i = add i32 %tmp.i203, 25400013		; <i32> [#uses=1]
	%tmp11021104.i = sext i32 %tmp1102.i to i64		; <i64> [#uses=1]
	%tmp1105.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11021104.i		; <double*> [#uses=1]
	%tmp1106.i = load double* %tmp1105.i, align 8		; <double> [#uses=3]
	%tmp1107.i = add double %tmp1100.i, %tmp1106.i		; <double> [#uses=1]
	%tmp1109.i = add i32 %tmp.i203, 25400014		; <i32> [#uses=1]
	%tmp11091111.i = sext i32 %tmp1109.i to i64		; <i64> [#uses=1]
	%tmp1112.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11091111.i		; <double*> [#uses=1]
	%tmp1113.i = load double* %tmp1112.i, align 8		; <double> [#uses=3]
	%tmp1114.i = add double %tmp1107.i, %tmp1113.i		; <double> [#uses=1]
	%tmp1116.i = add i32 %tmp.i203, 25400015		; <i32> [#uses=1]
	%tmp11161118.i = sext i32 %tmp1116.i to i64		; <i64> [#uses=1]
	%tmp1119.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11161118.i		; <double*> [#uses=1]
	%tmp1120.i = load double* %tmp1119.i, align 8		; <double> [#uses=3]
	%tmp1121.i = add double %tmp1114.i, %tmp1120.i		; <double> [#uses=1]
	%tmp1123.i = add i32 %tmp.i203, 25400016		; <i32> [#uses=1]
	%tmp11231125.i = sext i32 %tmp1123.i to i64		; <i64> [#uses=1]
	%tmp1126.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11231125.i		; <double*> [#uses=1]
	%tmp1127.i = load double* %tmp1126.i, align 8		; <double> [#uses=3]
	%tmp1128.i = add double %tmp1121.i, %tmp1127.i		; <double> [#uses=1]
	%tmp1130.i = add i32 %tmp.i203, 25400017		; <i32> [#uses=1]
	%tmp11301132.i = sext i32 %tmp1130.i to i64		; <i64> [#uses=1]
	%tmp1133.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11301132.i		; <double*> [#uses=1]
	%tmp1134.i = load double* %tmp1133.i, align 8		; <double> [#uses=3]
	%tmp1135.i = add double %tmp1128.i, %tmp1134.i		; <double> [#uses=1]
	%tmp1137.i = add i32 %tmp.i203, 25400018		; <i32> [#uses=1]
	%tmp11371139.i = sext i32 %tmp1137.i to i64		; <i64> [#uses=1]
	%tmp1140.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp11371139.i		; <double*> [#uses=1]
	%tmp1141.i = load double* %tmp1140.i, align 8		; <double> [#uses=3]
	%tmp1142.i = add double %tmp1135.i, %tmp1141.i		; <double> [#uses=3]
	%tmp1155.i = sub double %tmp1036.i, %tmp1043.i		; <double> [#uses=1]
	%tmp1162.i = add double %tmp1155.i, %tmp1064.i		; <double> [#uses=1]
	%tmp1169.i = sub double %tmp1162.i, %tmp1071.i		; <double> [#uses=1]
	%tmp1176.i = add double %tmp1169.i, %tmp1078.i		; <double> [#uses=1]
	%tmp1183.i = sub double %tmp1176.i, %tmp1085.i		; <double> [#uses=1]
	%tmp1190.i = add double %tmp1183.i, %tmp1120.i		; <double> [#uses=1]
	%tmp1197.i = add double %tmp1190.i, %tmp1127.i		; <double> [#uses=1]
	%tmp1204.i = sub double %tmp1197.i, %tmp1134.i		; <double> [#uses=1]
	%tmp1211.i = sub double %tmp1204.i, %tmp1141.i		; <double> [#uses=1]
	%tmp1224.i = sub double %tmp1022.i, %tmp1029.i		; <double> [#uses=1]
	%tmp1231.i = add double %tmp1224.i, %tmp1064.i		; <double> [#uses=1]
	%tmp1238.i = add double %tmp1231.i, %tmp1071.i		; <double> [#uses=1]
	%tmp1245.i = sub double %tmp1238.i, %tmp1078.i		; <double> [#uses=1]
	%tmp1252.i = sub double %tmp1245.i, %tmp1085.i		; <double> [#uses=1]
	%tmp1259.i = add double %tmp1252.i, %tmp1092.i		; <double> [#uses=1]
	%tmp1266.i = add double %tmp1259.i, %tmp1099.i		; <double> [#uses=1]
	%tmp1273.i = sub double %tmp1266.i, %tmp1106.i		; <double> [#uses=1]
	%tmp1280.i = sub double %tmp1273.i, %tmp1113.i		; <double> [#uses=1]
	%tmp1293.i = sub double %tmp1050.i, %tmp1057.i		; <double> [#uses=1]
	%tmp1300.i = add double %tmp1293.i, %tmp1092.i		; <double> [#uses=1]
	%tmp1307.i = sub double %tmp1300.i, %tmp1099.i		; <double> [#uses=1]
	%tmp1314.i = add double %tmp1307.i, %tmp1106.i		; <double> [#uses=1]
	%tmp1321.i = sub double %tmp1314.i, %tmp1113.i		; <double> [#uses=1]
	%tmp1328.i = add double %tmp1321.i, %tmp1120.i		; <double> [#uses=1]
	%tmp1335.i = sub double %tmp1328.i, %tmp1127.i		; <double> [#uses=1]
	%tmp1342.i = add double %tmp1335.i, %tmp1134.i		; <double> [#uses=1]
	%tmp1349.i = sub double %tmp1342.i, %tmp1141.i		; <double> [#uses=1]
	%tmp1352.i = fdiv double %tmp1211.i, %tmp1142.i		; <double> [#uses=1]
	%tmp1355.i = fdiv double %tmp1280.i, %tmp1142.i		; <double> [#uses=1]
	%tmp1358.i = fdiv double %tmp1349.i, %tmp1142.i		; <double> [#uses=1]
	%tmp1360.i = mul double %tmp1004.i, 2.000000e+00		; <double> [#uses=1]
	%tmp1362.i = sub double %tmp1360.i, %tmp1352.i		; <double> [#uses=12]
	%tmp1364.i = mul double %tmp1007.i, 2.000000e+00		; <double> [#uses=1]
	%tmp1366.i = sub double %tmp1364.i, %tmp1355.i		; <double> [#uses=13]
	%tmp1368.i = mul double %tmp1010.i, 2.000000e+00		; <double> [#uses=1]
	%tmp1370.i = sub double %tmp1368.i, %tmp1358.i		; <double> [#uses=13]
	%tmp1373.i = mul double %tmp1362.i, %tmp1362.i		; <double> [#uses=1]
	%tmp1376.i = mul double %tmp1366.i, %tmp1366.i		; <double> [#uses=1]
	%tmp1377.i = add double %tmp1373.i, %tmp1376.i		; <double> [#uses=1]
	%tmp1380.i = mul double %tmp1370.i, %tmp1370.i		; <double> [#uses=1]
	%tmp1381.i = add double %tmp1377.i, %tmp1380.i		; <double> [#uses=1]
	%tmp1382.i = mul double %tmp1381.i, 1.500000e+00		; <double> [#uses=19]
	%tmp1386.i = sub double 1.000000e+00, %tmp1382.i		; <double> [#uses=1]
	%tmp1387.i = mul double %tmp1386.i, 0x3FD5555555555555		; <double> [#uses=1]
	%tmp13891390.i = sext i32 %i.11805.i to i64		; <i64> [#uses=1]
	%tmp1391.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp13891390.i		; <double*> [#uses=1]
	store double %tmp1387.i, double* %tmp1391.i, align 8
	%tmp1393.i = add i32 %tmp.i203, 25800001		; <i32> [#uses=1]
	%tmp1397.i = mul double %tmp1366.i, 4.500000e+00		; <double> [#uses=2]
	%tmp1398.i = add double %tmp1397.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1400.i = mul double %tmp1398.i, %tmp1366.i		; <double> [#uses=1]
	%tmp1401.i = add double %tmp1400.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1403.i = sub double %tmp1401.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1404.i = mul double %tmp1403.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp13931406.i = sext i32 %tmp1393.i to i64		; <i64> [#uses=1]
	%tmp1407.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp13931406.i		; <double*> [#uses=1]
	store double %tmp1404.i, double* %tmp1407.i, align 8
	%tmp1409.i = add i32 %tmp.i203, 25800002		; <i32> [#uses=1]
	%tmp1414.i = sub double %tmp1397.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1416.i = mul double %tmp1414.i, %tmp1366.i		; <double> [#uses=1]
	%tmp1417.i = add double %tmp1416.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1419.i = sub double %tmp1417.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1420.i = mul double %tmp1419.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp14091422.i = sext i32 %tmp1409.i to i64		; <i64> [#uses=1]
	%tmp1423.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14091422.i		; <double*> [#uses=1]
	store double %tmp1420.i, double* %tmp1423.i, align 8
	%tmp1425.i = add i32 %tmp.i203, 25800003		; <i32> [#uses=1]
	%tmp1429.i = mul double %tmp1362.i, 4.500000e+00		; <double> [#uses=2]
	%tmp1430.i = add double %tmp1429.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1432.i = mul double %tmp1430.i, %tmp1362.i		; <double> [#uses=1]
	%tmp1433.i = add double %tmp1432.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1435.i = sub double %tmp1433.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1436.i = mul double %tmp1435.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp14251438.i = sext i32 %tmp1425.i to i64		; <i64> [#uses=1]
	%tmp1439.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14251438.i		; <double*> [#uses=1]
	store double %tmp1436.i, double* %tmp1439.i, align 8
	%tmp1441.i = add i32 %tmp.i203, 25800004		; <i32> [#uses=1]
	%tmp1446.i = sub double %tmp1429.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1448.i = mul double %tmp1446.i, %tmp1362.i		; <double> [#uses=1]
	%tmp1449.i = add double %tmp1448.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1451.i = sub double %tmp1449.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1452.i = mul double %tmp1451.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp14411454.i = sext i32 %tmp1441.i to i64		; <i64> [#uses=1]
	%tmp1455.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14411454.i		; <double*> [#uses=1]
	store double %tmp1452.i, double* %tmp1455.i, align 8
	%tmp1457.i = add i32 %tmp.i203, 25800005		; <i32> [#uses=1]
	%tmp1461.i = mul double %tmp1370.i, 4.500000e+00		; <double> [#uses=2]
	%tmp1462.i = add double %tmp1461.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1464.i = mul double %tmp1462.i, %tmp1370.i		; <double> [#uses=1]
	%tmp1465.i = add double %tmp1464.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1467.i = sub double %tmp1465.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1468.i = mul double %tmp1467.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp14571470.i = sext i32 %tmp1457.i to i64		; <i64> [#uses=1]
	%tmp1471.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14571470.i		; <double*> [#uses=1]
	store double %tmp1468.i, double* %tmp1471.i, align 8
	%tmp1473.i = add i32 %tmp.i203, 25800006		; <i32> [#uses=1]
	%tmp1478.i = sub double %tmp1461.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1480.i = mul double %tmp1478.i, %tmp1370.i		; <double> [#uses=1]
	%tmp1481.i = add double %tmp1480.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1483.i = sub double %tmp1481.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1484.i = mul double %tmp1483.i, 0x3FAC71C71C71C71C		; <double> [#uses=1]
	%tmp14731486.i = sext i32 %tmp1473.i to i64		; <i64> [#uses=1]
	%tmp1487.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14731486.i		; <double*> [#uses=1]
	store double %tmp1484.i, double* %tmp1487.i, align 8
	%tmp1489.i = add i32 %tmp.i203, 25800007		; <i32> [#uses=1]
	%tmp1494.i = add double %tmp1362.i, %tmp1366.i		; <double> [#uses=2]
	%tmp1498.i = mul double %tmp1494.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1499.i = add double %tmp1498.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1500.i = mul double %tmp1494.i, %tmp1499.i		; <double> [#uses=1]
	%tmp1501.i = add double %tmp1500.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1503.i = sub double %tmp1501.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1504.i = mul double %tmp1503.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp14891506.i = sext i32 %tmp1489.i to i64		; <i64> [#uses=1]
	%tmp1507.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp14891506.i		; <double*> [#uses=1]
	store double %tmp1504.i, double* %tmp1507.i, align 8
	%tmp1509.i = add i32 %tmp.i203, 25800008		; <i32> [#uses=1]
	%tmp1514.i = sub double %tmp1366.i, %tmp1362.i		; <double> [#uses=2]
	%tmp1519.i = mul double %tmp1514.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1520.i = add double %tmp1519.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1521.i = mul double %tmp1514.i, %tmp1520.i		; <double> [#uses=1]
	%tmp1522.i = add double %tmp1521.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1524.i = sub double %tmp1522.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1525.i = mul double %tmp1524.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp15091527.i = sext i32 %tmp1509.i to i64		; <i64> [#uses=1]
	%tmp1528.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp15091527.i		; <double*> [#uses=1]
	store double %tmp1525.i, double* %tmp1528.i, align 8
	%tmp1530.i = add i32 %tmp.i203, 25800009		; <i32> [#uses=1]
	%tmp1535.i = sub double %tmp1362.i, %tmp1366.i		; <double> [#uses=2]
	%tmp1539.i = mul double %tmp1535.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1540.i = add double %tmp1539.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1541.i = mul double %tmp1535.i, %tmp1540.i		; <double> [#uses=1]
	%tmp1542.i = add double %tmp1541.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1544.i = sub double %tmp1542.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1545.i = mul double %tmp1544.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp15301547.i = sext i32 %tmp1530.i to i64		; <i64> [#uses=1]
	%tmp1548.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp15301547.i		; <double*> [#uses=1]
	store double %tmp1545.i, double* %tmp1548.i, align 8
	%tmp1550.i = add i32 %tmp.i203, 25800010		; <i32> [#uses=1]
	%tmp1554.i = sub double -0.000000e+00, %tmp1362.i		; <double> [#uses=2]
	%tmp1556.i = sub double %tmp1554.i, %tmp1366.i		; <double> [#uses=2]
	%tmp1561.i = mul double %tmp1556.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1562.i = add double %tmp1561.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1563.i = mul double %tmp1556.i, %tmp1562.i		; <double> [#uses=1]
	%tmp1564.i = add double %tmp1563.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1566.i = sub double %tmp1564.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1567.i = mul double %tmp1566.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp15501569.i = sext i32 %tmp1550.i to i64		; <i64> [#uses=1]
	%tmp1570.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp15501569.i		; <double*> [#uses=1]
	store double %tmp1567.i, double* %tmp1570.i, align 8
	%tmp1572.i = add i32 %tmp.i203, 25800011		; <i32> [#uses=1]
	%tmp1577.i = add double %tmp1366.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1581.i = mul double %tmp1577.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1582.i = add double %tmp1581.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1583.i = mul double %tmp1577.i, %tmp1582.i		; <double> [#uses=1]
	%tmp1584.i = add double %tmp1583.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1586.i = sub double %tmp1584.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1587.i = mul double %tmp1586.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp15721589.i = sext i32 %tmp1572.i to i64		; <i64> [#uses=1]
	%tmp1590.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp15721589.i		; <double*> [#uses=1]
	store double %tmp1587.i, double* %tmp1590.i, align 8
	%tmp1592.i = add i32 %tmp.i203, 25800012		; <i32> [#uses=1]
	%tmp1597.i = sub double %tmp1366.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1601.i = mul double %tmp1597.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1602.i = add double %tmp1601.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1603.i = mul double %tmp1597.i, %tmp1602.i		; <double> [#uses=1]
	%tmp1604.i = add double %tmp1603.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1606.i = sub double %tmp1604.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1607.i = mul double %tmp1606.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp15921609.i = sext i32 %tmp1592.i to i64		; <i64> [#uses=1]
	%tmp1610.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp15921609.i		; <double*> [#uses=1]
	store double %tmp1607.i, double* %tmp1610.i, align 8
	%tmp1612.i = add i32 %tmp.i203, 25800013		; <i32> [#uses=1]
	%tmp1617.i = sub double %tmp1370.i, %tmp1366.i		; <double> [#uses=2]
	%tmp1621.i = mul double %tmp1617.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1622.i = add double %tmp1621.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1623.i = mul double %tmp1617.i, %tmp1622.i		; <double> [#uses=1]
	%tmp1624.i = add double %tmp1623.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1626.i = sub double %tmp1624.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1627.i = mul double %tmp1626.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp16121629.i = sext i32 %tmp1612.i to i64		; <i64> [#uses=1]
	%tmp1630.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp16121629.i		; <double*> [#uses=1]
	store double %tmp1627.i, double* %tmp1630.i, align 8
	%tmp1632.i = add i32 %tmp.i203, 25800014		; <i32> [#uses=1]
	%tmp1636.i = sub double -0.000000e+00, %tmp1366.i		; <double> [#uses=1]
	%tmp1638.i = sub double %tmp1636.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1643.i = mul double %tmp1638.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1644.i = add double %tmp1643.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1645.i = mul double %tmp1638.i, %tmp1644.i		; <double> [#uses=1]
	%tmp1646.i = add double %tmp1645.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1648.i = sub double %tmp1646.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1649.i = mul double %tmp1648.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp16321651.i = sext i32 %tmp1632.i to i64		; <i64> [#uses=1]
	%tmp1652.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp16321651.i		; <double*> [#uses=1]
	store double %tmp1649.i, double* %tmp1652.i, align 8
	%tmp1654.i = add i32 %tmp.i203, 25800015		; <i32> [#uses=1]
	%tmp1659.i = add double %tmp1362.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1663.i = mul double %tmp1659.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1664.i = add double %tmp1663.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1665.i = mul double %tmp1659.i, %tmp1664.i		; <double> [#uses=1]
	%tmp1666.i = add double %tmp1665.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1668.i = sub double %tmp1666.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1669.i = mul double %tmp1668.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp16541671.i = sext i32 %tmp1654.i to i64		; <i64> [#uses=1]
	%tmp1672.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp16541671.i		; <double*> [#uses=1]
	store double %tmp1669.i, double* %tmp1672.i, align 8
	%tmp1674.i = add i32 %tmp.i203, 25800016		; <i32> [#uses=1]
	%tmp1679.i = sub double %tmp1362.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1683.i = mul double %tmp1679.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1684.i = add double %tmp1683.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1685.i = mul double %tmp1679.i, %tmp1684.i		; <double> [#uses=1]
	%tmp1686.i = add double %tmp1685.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1688.i = sub double %tmp1686.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1689.i = mul double %tmp1688.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp16741691.i = sext i32 %tmp1674.i to i64		; <i64> [#uses=1]
	%tmp1692.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp16741691.i		; <double*> [#uses=1]
	store double %tmp1689.i, double* %tmp1692.i, align 8
	%tmp1694.i = add i32 %tmp.i203, 25800017		; <i32> [#uses=1]
	%tmp1699.i = sub double %tmp1370.i, %tmp1362.i		; <double> [#uses=2]
	%tmp1703.i = mul double %tmp1699.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1704.i = add double %tmp1703.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1705.i = mul double %tmp1699.i, %tmp1704.i		; <double> [#uses=1]
	%tmp1706.i = add double %tmp1705.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1708.i = sub double %tmp1706.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1709.i = mul double %tmp1708.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp16941711.i = sext i32 %tmp1694.i to i64		; <i64> [#uses=1]
	%tmp1712.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp16941711.i		; <double*> [#uses=1]
	store double %tmp1709.i, double* %tmp1712.i, align 8
	%tmp1714.i = add i32 %tmp.i203, 25800018		; <i32> [#uses=1]
	%tmp1720.i = sub double %tmp1554.i, %tmp1370.i		; <double> [#uses=2]
	%tmp1725.i = mul double %tmp1720.i, 4.500000e+00		; <double> [#uses=1]
	%tmp1726.i = add double %tmp1725.i, 3.000000e+00		; <double> [#uses=1]
	%tmp1727.i = mul double %tmp1720.i, %tmp1726.i		; <double> [#uses=1]
	%tmp1728.i = add double %tmp1727.i, 1.000000e+00		; <double> [#uses=1]
	%tmp1730.i = sub double %tmp1728.i, %tmp1382.i		; <double> [#uses=1]
	%tmp1731.i = mul double %tmp1730.i, 0x3F9C71C71C71C71C		; <double> [#uses=1]
	%tmp17141733.i = sext i32 %tmp1714.i to i64		; <i64> [#uses=1]
	%tmp1734.i = getelementptr [26000000 x double]* %tmp40.us, i32 0, i64 %tmp17141733.i		; <double*> [#uses=1]
	store double %tmp1731.i, double* %tmp1734.i, align 8
	%indvar.next.i = add i32 %indvar.i, 1		; <i32> [#uses=2]
	%exitcond.i216 = icmp eq i32 %indvar.next.i, 10000		; <i1> [#uses=1]
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i216, label %LBM_handleInOutFlow.exit, label %bb662.i

LBM_handleInOutFlow.exit:		; preds = %bb662.i
	%tmp43.us = load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*> [#uses=2]
	%tmp4344.us = getelementptr [26000000 x double]* %tmp43.us, i32 0, i32 0		; <double*> [#uses=1]
	%tmp4546.us = getelementptr [26000000 x double]* %tmp40.us, i32 0, i32 0		; <double*> [#uses=1]
	store i32 23, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 29, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_performStreamCollide( double* %tmp4546.us, double* %tmp4344.us )
	store [26000000 x double]* %tmp43.us, [26000000 x double]** @srcGrid, align 8
	store [26000000 x double]* %tmp40.us, [26000000 x double]** @dstGrid, align 8
	%tmp48.us = and i32 %t.0.reg2mem.0.us, 63		; <i32> [#uses=1]
	%tmp49.us = icmp eq i32 %tmp48.us, 0		; <i1> [#uses=1]
	br i1 %tmp49.us, label %cond_true52.us, label %bb61.us

bb61.us:		; preds = %cond_true52.us, %LBM_handleInOutFlow.exit
	%tmp60.us = add i32 %indvar, 2		; <i32> [#uses=1]
	%tmp65.us = icmp slt i32 %tmp2425.i, %tmp60.us		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp65.us, label %bb68, label %bb.us

cond_true52.us:		; preds = %LBM_handleInOutFlow.exit
	store i32 24, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 29, i32* @cg_caller_id_var, align 4
	%tmp55.us = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([14 x i8]* @.str610, i32 0, i64 0), i32 %t.0.reg2mem.0.us ) nounwind 		; <i32> [#uses=0]
	%tmp56.us = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp5657.us = getelementptr [26000000 x double]* %tmp56.us, i32 0, i32 0		; <double*> [#uses=1]
	store i32 25, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 29, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_showGridStatistics( double* %tmp5657.us )
	br label %bb61.us

bb:		; preds = %bb61, %bb.preheader
	%indvar117 = phi i32 [ %t.0.reg2mem.0, %bb61 ], [ 0, %bb.preheader ]		; <i32> [#uses=2]
	%val317 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val418 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 32, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val317, i32 %val418, i32 32 )
	%t.0.reg2mem.0 = add i32 %indvar117, 1		; <i32> [#uses=3]
	%tmp43 = load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*> [#uses=2]
	%tmp4344 = getelementptr [26000000 x double]* %tmp43, i32 0, i32 0		; <double*> [#uses=1]
	%tmp45 = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=2]
	%tmp4546 = getelementptr [26000000 x double]* %tmp45, i32 0, i32 0		; <double*> [#uses=1]
	store i32 26, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 32, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_performStreamCollide( double* %tmp4546, double* %tmp4344 )
	store [26000000 x double]* %tmp43, [26000000 x double]** @srcGrid, align 8
	store [26000000 x double]* %tmp45, [26000000 x double]** @dstGrid, align 8
	%tmp48 = and i32 %t.0.reg2mem.0, 63		; <i32> [#uses=1]
	%tmp49 = icmp eq i32 %tmp48, 0		; <i1> [#uses=1]
	br i1 %tmp49, label %cond_true52, label %bb61

cond_true52:		; preds = %bb
	store i32 27, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 32, i32* @cg_caller_id_var, align 4
	%tmp55 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([14 x i8]* @.str610, i32 0, i64 0), i32 %t.0.reg2mem.0 ) nounwind 		; <i32> [#uses=0]
	%tmp56 = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp5657 = getelementptr [26000000 x double]* %tmp56, i32 0, i32 0		; <double*> [#uses=1]
	store i32 28, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 32, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_showGridStatistics( double* %tmp5657 )
	br label %bb61

bb61:		; preds = %cond_true52, %bb
	%tmp60 = add i32 %indvar117, 2		; <i32> [#uses=1]
	%tmp65 = icmp slt i32 %tmp2425.i, %tmp60		; <i1> [#uses=1]
	store i32 %val418, i32* @cg_caller_call_site_var, align 4
	store i32 %val317, i32* @cg_caller_id_var, align 4
	br i1 %tmp65, label %bb68, label %bb

bb68:		; preds = %bb61, %bb61.us, %MAIN_initialize.exit
	%tmp70 = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=1]
	%tmp7071 = getelementptr [26000000 x double]* %tmp70, i32 0, i32 0		; <double*> [#uses=1]
	store i32 29, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @LBM_showGridStatistics( double* %tmp7071 )
	switch i32 %tmp5354.i, label %cond_next97 [
		 i32 1, label %cond_true78
		 i32 2, label %cond_true91
	]

cond_true78:		; preds = %bb68
	%tmp82 = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=19]
	store i32 30, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp7.i19 = call %struct.FILE* @fopen( i8* noalias  %tmp33.i, i8* noalias  getelementptr ([3 x i8]* @.str1, i32 0, i64 0) )		; <%struct.FILE*> [#uses=4]
	%tmp714715.i = bitcast float* %fileUx.i to i8*		; <i8*> [#uses=1]
	%tmp756757.i = bitcast float* %fileUy.i to i8*		; <i8*> [#uses=1]
	%tmp798799.i = bitcast float* %fileUz.i to i8*		; <i8*> [#uses=1]
	br label %bb883.outer.i

bb883.outer.i:		; preds = %bb891.i, %cond_true78
	%z.0.reg2mem.0.ph.i20 = phi i32 [ 0, %cond_true78 ], [ %indvar.next979.i, %bb891.i ]		; <i32> [#uses=2]
	%maxDiff2.2.ph.i = phi float [ 0xC6293E5940000000, %cond_true78 ], [ %maxDiff2.0.i, %bb891.i ]		; <float> [#uses=1]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 23, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 23 )
	%tmp14.i21 = mul i32 %z.0.reg2mem.0.ph.i20, 10000		; <i32> [#uses=1]
	br label %bb875.preheader.i

bb9.i119:		; preds = %bb875.preheader.i, %bb9.i119
	%x.0965.i = phi i32 [ 0, %bb875.preheader.i ], [ %indvar.next975.i, %bb9.i119 ]		; <i32> [#uses=2]
	%maxDiff2.1964.i = phi float [ %maxDiff2.2968.i, %bb875.preheader.i ], [ %maxDiff2.0.i, %bb9.i119 ]		; <float> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 25, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 25 )
	%tmp17.i22 = add i32 %tmp15.i121, %x.0965.i		; <i32> [#uses=1]
	%tmp18.i23 = mul i32 %tmp17.i22, 20		; <i32> [#uses=19]
	%tmp1820.i24 = sext i32 %tmp18.i23 to i64		; <i64> [#uses=1]
	%tmp21.i25 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp1820.i24		; <double*> [#uses=1]
	%tmp22.i26 = load double* %tmp21.i25, align 8		; <double> [#uses=1]
	%tmp31.i27 = add i32 %tmp18.i23, 1		; <i32> [#uses=1]
	%tmp3133.i28 = sext i32 %tmp31.i27 to i64		; <i64> [#uses=1]
	%tmp34.i29 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp3133.i28		; <double*> [#uses=1]
	%tmp35.i30 = load double* %tmp34.i29, align 8		; <double> [#uses=2]
	%tmp36.i31 = add double %tmp22.i26, %tmp35.i30		; <double> [#uses=1]
	%tmp45.i32 = add i32 %tmp18.i23, 2		; <i32> [#uses=1]
	%tmp4547.i33 = sext i32 %tmp45.i32 to i64		; <i64> [#uses=1]
	%tmp48.i34 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp4547.i33		; <double*> [#uses=1]
	%tmp49.i35 = load double* %tmp48.i34, align 8		; <double> [#uses=2]
	%tmp50.i36 = add double %tmp36.i31, %tmp49.i35		; <double> [#uses=1]
	%tmp59.i37 = add i32 %tmp18.i23, 3		; <i32> [#uses=1]
	%tmp5961.i38 = sext i32 %tmp59.i37 to i64		; <i64> [#uses=1]
	%tmp62.i39 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp5961.i38		; <double*> [#uses=1]
	%tmp63.i40 = load double* %tmp62.i39, align 8		; <double> [#uses=2]
	%tmp64.i41 = add double %tmp50.i36, %tmp63.i40		; <double> [#uses=1]
	%tmp73.i42 = add i32 %tmp18.i23, 4		; <i32> [#uses=1]
	%tmp7375.i43 = sext i32 %tmp73.i42 to i64		; <i64> [#uses=1]
	%tmp76.i44 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp7375.i43		; <double*> [#uses=1]
	%tmp77.i45 = load double* %tmp76.i44, align 8		; <double> [#uses=2]
	%tmp78.i46 = add double %tmp64.i41, %tmp77.i45		; <double> [#uses=1]
	%tmp87.i47 = add i32 %tmp18.i23, 5		; <i32> [#uses=1]
	%tmp8789.i48 = sext i32 %tmp87.i47 to i64		; <i64> [#uses=1]
	%tmp90.i49 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp8789.i48		; <double*> [#uses=1]
	%tmp91.i50 = load double* %tmp90.i49, align 8		; <double> [#uses=2]
	%tmp92.i51 = add double %tmp78.i46, %tmp91.i50		; <double> [#uses=1]
	%tmp101.i52 = add i32 %tmp18.i23, 6		; <i32> [#uses=1]
	%tmp101103.i53 = sext i32 %tmp101.i52 to i64		; <i64> [#uses=1]
	%tmp104.i54 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp101103.i53		; <double*> [#uses=1]
	%tmp105.i55 = load double* %tmp104.i54, align 8		; <double> [#uses=2]
	%tmp106.i56 = add double %tmp92.i51, %tmp105.i55		; <double> [#uses=1]
	%tmp115.i57 = add i32 %tmp18.i23, 7		; <i32> [#uses=1]
	%tmp115117.i58 = sext i32 %tmp115.i57 to i64		; <i64> [#uses=1]
	%tmp118.i59 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp115117.i58		; <double*> [#uses=1]
	%tmp119.i60 = load double* %tmp118.i59, align 8		; <double> [#uses=3]
	%tmp120.i61 = add double %tmp106.i56, %tmp119.i60		; <double> [#uses=1]
	%tmp129.i62 = add i32 %tmp18.i23, 8		; <i32> [#uses=1]
	%tmp129131.i63 = sext i32 %tmp129.i62 to i64		; <i64> [#uses=1]
	%tmp132.i64 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp129131.i63		; <double*> [#uses=1]
	%tmp133.i65 = load double* %tmp132.i64, align 8		; <double> [#uses=3]
	%tmp134.i66 = add double %tmp120.i61, %tmp133.i65		; <double> [#uses=1]
	%tmp143.i67 = add i32 %tmp18.i23, 9		; <i32> [#uses=1]
	%tmp143145.i68 = sext i32 %tmp143.i67 to i64		; <i64> [#uses=1]
	%tmp146.i69 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp143145.i68		; <double*> [#uses=1]
	%tmp147.i70 = load double* %tmp146.i69, align 8		; <double> [#uses=3]
	%tmp148.i71 = add double %tmp134.i66, %tmp147.i70		; <double> [#uses=1]
	%tmp157.i72 = add i32 %tmp18.i23, 10		; <i32> [#uses=1]
	%tmp157159.i73 = sext i32 %tmp157.i72 to i64		; <i64> [#uses=1]
	%tmp160.i74 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp157159.i73		; <double*> [#uses=1]
	%tmp161.i75 = load double* %tmp160.i74, align 8		; <double> [#uses=3]
	%tmp162.i76 = add double %tmp148.i71, %tmp161.i75		; <double> [#uses=1]
	%tmp171.i77 = add i32 %tmp18.i23, 11		; <i32> [#uses=1]
	%tmp171173.i78 = sext i32 %tmp171.i77 to i64		; <i64> [#uses=1]
	%tmp174.i79 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp171173.i78		; <double*> [#uses=1]
	%tmp175.i80 = load double* %tmp174.i79, align 8		; <double> [#uses=3]
	%tmp176.i81 = add double %tmp162.i76, %tmp175.i80		; <double> [#uses=1]
	%tmp185.i82 = add i32 %tmp18.i23, 12		; <i32> [#uses=1]
	%tmp185187.i83 = sext i32 %tmp185.i82 to i64		; <i64> [#uses=1]
	%tmp188.i84 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp185187.i83		; <double*> [#uses=1]
	%tmp189.i85 = load double* %tmp188.i84, align 8		; <double> [#uses=3]
	%tmp190.i86 = add double %tmp176.i81, %tmp189.i85		; <double> [#uses=1]
	%tmp199.i87 = add i32 %tmp18.i23, 13		; <i32> [#uses=1]
	%tmp199201.i88 = sext i32 %tmp199.i87 to i64		; <i64> [#uses=1]
	%tmp202.i89 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp199201.i88		; <double*> [#uses=1]
	%tmp203.i90 = load double* %tmp202.i89, align 8		; <double> [#uses=3]
	%tmp204.i91 = add double %tmp190.i86, %tmp203.i90		; <double> [#uses=1]
	%tmp213.i92 = add i32 %tmp18.i23, 14		; <i32> [#uses=1]
	%tmp213215.i93 = sext i32 %tmp213.i92 to i64		; <i64> [#uses=1]
	%tmp216.i94 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp213215.i93		; <double*> [#uses=1]
	%tmp217.i95 = load double* %tmp216.i94, align 8		; <double> [#uses=3]
	%tmp218.i96 = add double %tmp204.i91, %tmp217.i95		; <double> [#uses=1]
	%tmp227.i97 = add i32 %tmp18.i23, 15		; <i32> [#uses=1]
	%tmp227229.i98 = sext i32 %tmp227.i97 to i64		; <i64> [#uses=1]
	%tmp230.i99 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp227229.i98		; <double*> [#uses=1]
	%tmp231.i100 = load double* %tmp230.i99, align 8		; <double> [#uses=3]
	%tmp232.i101 = add double %tmp218.i96, %tmp231.i100		; <double> [#uses=1]
	%tmp241.i102 = add i32 %tmp18.i23, 16		; <i32> [#uses=1]
	%tmp241243.i103 = sext i32 %tmp241.i102 to i64		; <i64> [#uses=1]
	%tmp244.i104 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp241243.i103		; <double*> [#uses=1]
	%tmp245.i105 = load double* %tmp244.i104, align 8		; <double> [#uses=3]
	%tmp246.i106 = add double %tmp232.i101, %tmp245.i105		; <double> [#uses=1]
	%tmp255.i107 = add i32 %tmp18.i23, 17		; <i32> [#uses=1]
	%tmp255257.i108 = sext i32 %tmp255.i107 to i64		; <i64> [#uses=1]
	%tmp258.i109 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp255257.i108		; <double*> [#uses=1]
	%tmp259.i110 = load double* %tmp258.i109, align 8		; <double> [#uses=3]
	%tmp260.i111 = add double %tmp246.i106, %tmp259.i110		; <double> [#uses=1]
	%tmp269.i112 = add i32 %tmp18.i23, 18		; <i32> [#uses=1]
	%tmp269271.i113 = sext i32 %tmp269.i112 to i64		; <i64> [#uses=1]
	%tmp272.i114 = getelementptr [26000000 x double]* %tmp82, i32 0, i64 %tmp269271.i113		; <double*> [#uses=1]
	%tmp273.i115 = load double* %tmp272.i114, align 8		; <double> [#uses=3]
	%tmp274.i116 = add double %tmp260.i111, %tmp273.i115		; <double> [#uses=3]
	%tmp301.i = sub double %tmp63.i40, %tmp77.i45		; <double> [#uses=1]
	%tmp315.i = add double %tmp301.i, %tmp119.i60		; <double> [#uses=1]
	%tmp329.i = sub double %tmp315.i, %tmp133.i65		; <double> [#uses=1]
	%tmp343.i = add double %tmp329.i, %tmp147.i70		; <double> [#uses=1]
	%tmp357.i = sub double %tmp343.i, %tmp161.i75		; <double> [#uses=1]
	%tmp371.i = add double %tmp357.i, %tmp231.i100		; <double> [#uses=1]
	%tmp385.i = add double %tmp371.i, %tmp245.i105		; <double> [#uses=1]
	%tmp399.i = sub double %tmp385.i, %tmp259.i110		; <double> [#uses=1]
	%tmp413.i = sub double %tmp399.i, %tmp273.i115		; <double> [#uses=1]
	%tmp440.i = sub double %tmp35.i30, %tmp49.i35		; <double> [#uses=1]
	%tmp454.i = add double %tmp440.i, %tmp119.i60		; <double> [#uses=1]
	%tmp468.i = add double %tmp454.i, %tmp133.i65		; <double> [#uses=1]
	%tmp482.i = sub double %tmp468.i, %tmp147.i70		; <double> [#uses=1]
	%tmp496.i = sub double %tmp482.i, %tmp161.i75		; <double> [#uses=1]
	%tmp510.i = add double %tmp496.i, %tmp175.i80		; <double> [#uses=1]
	%tmp524.i = add double %tmp510.i, %tmp189.i85		; <double> [#uses=1]
	%tmp538.i = sub double %tmp524.i, %tmp203.i90		; <double> [#uses=1]
	%tmp552.i = sub double %tmp538.i, %tmp217.i95		; <double> [#uses=1]
	%tmp579.i = sub double %tmp91.i50, %tmp105.i55		; <double> [#uses=1]
	%tmp593.i = add double %tmp579.i, %tmp175.i80		; <double> [#uses=1]
	%tmp607.i = sub double %tmp593.i, %tmp189.i85		; <double> [#uses=1]
	%tmp621.i = add double %tmp607.i, %tmp203.i90		; <double> [#uses=1]
	%tmp635.i = sub double %tmp621.i, %tmp217.i95		; <double> [#uses=1]
	%tmp649.i = add double %tmp635.i, %tmp231.i100		; <double> [#uses=1]
	%tmp663.i = sub double %tmp649.i, %tmp245.i105		; <double> [#uses=1]
	%tmp677.i = add double %tmp663.i, %tmp259.i110		; <double> [#uses=1]
	%tmp691.i = sub double %tmp677.i, %tmp273.i115		; <double> [#uses=1]
	%tmp694.i117 = fdiv double %tmp413.i, %tmp274.i116		; <double> [#uses=1]
	%tmp697.i = fdiv double %tmp552.i, %tmp274.i116		; <double> [#uses=1]
	%tmp700.i = fdiv double %tmp691.i, %tmp274.i116		; <double> [#uses=1]
	store i32 31, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 23, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 25, i32* @cg_caller_id_var, align 4
	%tmp741.i = call i64 @fread( i8* noalias  %tmp714715.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i19 )		; <i64> [#uses=0]
	store i32 32, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 23, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 25, i32* @cg_caller_id_var, align 4
	%tmp783.i = call i64 @fread( i8* noalias  %tmp756757.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i19 )		; <i64> [#uses=0]
	store i32 33, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 23, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 25, i32* @cg_caller_id_var, align 4
	%tmp825.i = call i64 @fread( i8* noalias  %tmp798799.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i19 )		; <i64> [#uses=0]
	%tmp839.i = load float* %fileUx.i, align 4		; <float> [#uses=1]
	%tmp839840.i = fpext float %tmp839.i to double		; <double> [#uses=1]
	%tmp842.i = sub double %tmp694.i117, %tmp839840.i		; <double> [#uses=1]
	%tmp842843.i = fptrunc double %tmp842.i to float		; <float> [#uses=2]
	%tmp844.i = load float* %fileUy.i, align 4		; <float> [#uses=1]
	%tmp844845.i = fpext float %tmp844.i to double		; <double> [#uses=1]
	%tmp847.i = sub double %tmp697.i, %tmp844845.i		; <double> [#uses=1]
	%tmp847848.i = fptrunc double %tmp847.i to float		; <float> [#uses=2]
	%tmp849.i = load float* %fileUz.i, align 4		; <float> [#uses=1]
	%tmp849850.i = fpext float %tmp849.i to double		; <double> [#uses=1]
	%tmp852.i = sub double %tmp700.i, %tmp849850.i		; <double> [#uses=1]
	%tmp852853.i = fptrunc double %tmp852.i to float		; <float> [#uses=2]
	%tmp856.i = mul float %tmp842843.i, %tmp842843.i		; <float> [#uses=1]
	%tmp859.i = mul float %tmp847848.i, %tmp847848.i		; <float> [#uses=1]
	%tmp860.i = add float %tmp856.i, %tmp859.i		; <float> [#uses=1]
	%tmp863.i = mul float %tmp852853.i, %tmp852853.i		; <float> [#uses=1]
	%tmp864.i = add float %tmp860.i, %tmp863.i		; <float> [#uses=2]
	%tmp867.i118 = fcmp ogt float %tmp864.i, %maxDiff2.1964.i		; <i1> [#uses=1]
	%maxDiff2.0.i = select i1 %tmp867.i118, float %tmp864.i, float %maxDiff2.1964.i		; <float> [#uses=4]
	%indvar.next975.i = add i32 %x.0965.i, 1		; <i32> [#uses=2]
	%exitcond976.i = icmp eq i32 %indvar.next975.i, 100		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond976.i, label %bb880.i, label %bb9.i119

bb880.i:		; preds = %bb9.i119
	%indvar.next977.i = add i32 %y.0969.i, 1		; <i32> [#uses=2]
	%exitcond978.i = icmp eq i32 %indvar.next977.i, 100		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond978.i, label %bb891.i, label %bb875.preheader.i

bb875.preheader.i:		; preds = %bb880.i, %bb883.outer.i
	%y.0969.i = phi i32 [ 0, %bb883.outer.i ], [ %indvar.next977.i, %bb880.i ]		; <i32> [#uses=2]
	%maxDiff2.2968.i = phi float [ %maxDiff2.2.ph.i, %bb883.outer.i ], [ %maxDiff2.0.i, %bb880.i ]		; <float> [#uses=1]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 24, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 24 )
	%tmp11.i120 = mul i32 %y.0969.i, 100		; <i32> [#uses=1]
	%tmp15.i121 = add i32 %tmp11.i120, %tmp14.i21		; <i32> [#uses=1]
	br label %bb9.i119

bb891.i:		; preds = %bb880.i
	%indvar.next979.i = add i32 %z.0.reg2mem.0.ph.i20, 1		; <i32> [#uses=2]
	%exitcond980.i = icmp eq i32 %indvar.next979.i, 130		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond980.i, label %LBM_compareVelocityField.exit, label %bb883.outer.i

LBM_compareVelocityField.exit:		; preds = %bb891.i
	%tmp897898.i = fpext float %maxDiff2.0.i to double		; <double> [#uses=1]
	store i32 34, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp899.i = call double @llvm.sqrt.f64( double %tmp897898.i )		; <double> [#uses=1]
	store i32 35, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp901.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([43 x i8]* @.str6, i32 0, i64 0), double %tmp899.i ) nounwind 		; <i32> [#uses=0]
	store i32 36, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp903.i = call i32 @fclose( %struct.FILE* %tmp7.i19 )		; <i32> [#uses=0]
	br label %cond_next97

cond_true91:		; preds = %bb68
	%tmp95 = load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*> [#uses=19]
	store i32 37, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp7.i7 = call %struct.FILE* @fopen( i8* noalias  %tmp33.i, i8* noalias  getelementptr ([3 x i8]* @.str7, i32 0, i64 0) )		; <%struct.FILE*> [#uses=4]
	%tmp718719.i = bitcast float* %ux.i to i8*		; <i8*> [#uses=1]
	%tmp760761.i = bitcast float* %uy.i to i8*		; <i8*> [#uses=1]
	%tmp802803.i = bitcast float* %uz.i to i8*		; <i8*> [#uses=1]
	br label %bb852.outer.i

bb852.outer.i:		; preds = %bb857.i, %cond_true91
	%z.0.reg2mem.0.ph.i = phi i32 [ 0, %cond_true91 ], [ %indvar.next988.i, %bb857.i ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 26, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 26 )
	%tmp14.i8 = mul i32 %z.0.reg2mem.0.ph.i, 10000		; <i32> [#uses=1]
	br label %bb844.preheader.i

bb9.i:		; preds = %bb844.preheader.i, %bb9.i
	%indvar983.i = phi i32 [ %tmp843.i, %bb9.i ], [ 0, %bb844.preheader.i ]		; <i32> [#uses=2]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 28, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 28 )
	%tmp17.i9 = add i32 %tmp15.i, %indvar983.i		; <i32> [#uses=1]
	%tmp18.i = mul i32 %tmp17.i9, 20		; <i32> [#uses=19]
	%tmp1820.i = sext i32 %tmp18.i to i64		; <i64> [#uses=1]
	%tmp21.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp1820.i		; <double*> [#uses=1]
	%tmp22.i10 = load double* %tmp21.i, align 8		; <double> [#uses=1]
	%tmp31.i = add i32 %tmp18.i, 1		; <i32> [#uses=1]
	%tmp3133.i = sext i32 %tmp31.i to i64		; <i64> [#uses=1]
	%tmp34.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp3133.i		; <double*> [#uses=1]
	%tmp35.i = load double* %tmp34.i, align 8		; <double> [#uses=2]
	%tmp36.i = add double %tmp22.i10, %tmp35.i		; <double> [#uses=1]
	%tmp45.i = add i32 %tmp18.i, 2		; <i32> [#uses=1]
	%tmp4547.i = sext i32 %tmp45.i to i64		; <i64> [#uses=1]
	%tmp48.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp4547.i		; <double*> [#uses=1]
	%tmp49.i = load double* %tmp48.i, align 8		; <double> [#uses=2]
	%tmp50.i11 = add double %tmp36.i, %tmp49.i		; <double> [#uses=1]
	%tmp59.i = add i32 %tmp18.i, 3		; <i32> [#uses=1]
	%tmp5961.i = sext i32 %tmp59.i to i64		; <i64> [#uses=1]
	%tmp62.i12 = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp5961.i		; <double*> [#uses=1]
	%tmp63.i = load double* %tmp62.i12, align 8		; <double> [#uses=2]
	%tmp64.i = add double %tmp50.i11, %tmp63.i		; <double> [#uses=1]
	%tmp73.i = add i32 %tmp18.i, 4		; <i32> [#uses=1]
	%tmp7375.i = sext i32 %tmp73.i to i64		; <i64> [#uses=1]
	%tmp76.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp7375.i		; <double*> [#uses=1]
	%tmp77.i = load double* %tmp76.i, align 8		; <double> [#uses=2]
	%tmp78.i = add double %tmp64.i, %tmp77.i		; <double> [#uses=1]
	%tmp87.i = add i32 %tmp18.i, 5		; <i32> [#uses=1]
	%tmp8789.i = sext i32 %tmp87.i to i64		; <i64> [#uses=1]
	%tmp90.i13 = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp8789.i		; <double*> [#uses=1]
	%tmp91.i14 = load double* %tmp90.i13, align 8		; <double> [#uses=2]
	%tmp92.i = add double %tmp78.i, %tmp91.i14		; <double> [#uses=1]
	%tmp101.i = add i32 %tmp18.i, 6		; <i32> [#uses=1]
	%tmp101103.i = sext i32 %tmp101.i to i64		; <i64> [#uses=1]
	%tmp104.i15 = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp101103.i		; <double*> [#uses=1]
	%tmp105.i = load double* %tmp104.i15, align 8		; <double> [#uses=2]
	%tmp106.i = add double %tmp92.i, %tmp105.i		; <double> [#uses=1]
	%tmp115.i16 = add i32 %tmp18.i, 7		; <i32> [#uses=1]
	%tmp115117.i = sext i32 %tmp115.i16 to i64		; <i64> [#uses=1]
	%tmp118.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp115117.i		; <double*> [#uses=1]
	%tmp119.i = load double* %tmp118.i, align 8		; <double> [#uses=3]
	%tmp120.i = add double %tmp106.i, %tmp119.i		; <double> [#uses=1]
	%tmp129.i = add i32 %tmp18.i, 8		; <i32> [#uses=1]
	%tmp129131.i = sext i32 %tmp129.i to i64		; <i64> [#uses=1]
	%tmp132.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp129131.i		; <double*> [#uses=1]
	%tmp133.i = load double* %tmp132.i, align 8		; <double> [#uses=3]
	%tmp134.i = add double %tmp120.i, %tmp133.i		; <double> [#uses=1]
	%tmp143.i = add i32 %tmp18.i, 9		; <i32> [#uses=1]
	%tmp143145.i = sext i32 %tmp143.i to i64		; <i64> [#uses=1]
	%tmp146.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp143145.i		; <double*> [#uses=1]
	%tmp147.i17 = load double* %tmp146.i, align 8		; <double> [#uses=3]
	%tmp148.i = add double %tmp134.i, %tmp147.i17		; <double> [#uses=1]
	%tmp157.i = add i32 %tmp18.i, 10		; <i32> [#uses=1]
	%tmp157159.i = sext i32 %tmp157.i to i64		; <i64> [#uses=1]
	%tmp160.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp157159.i		; <double*> [#uses=1]
	%tmp161.i = load double* %tmp160.i, align 8		; <double> [#uses=3]
	%tmp162.i = add double %tmp148.i, %tmp161.i		; <double> [#uses=1]
	%tmp171.i = add i32 %tmp18.i, 11		; <i32> [#uses=1]
	%tmp171173.i = sext i32 %tmp171.i to i64		; <i64> [#uses=1]
	%tmp174.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp171173.i		; <double*> [#uses=1]
	%tmp175.i = load double* %tmp174.i, align 8		; <double> [#uses=3]
	%tmp176.i = add double %tmp162.i, %tmp175.i		; <double> [#uses=1]
	%tmp185.i = add i32 %tmp18.i, 12		; <i32> [#uses=1]
	%tmp185187.i = sext i32 %tmp185.i to i64		; <i64> [#uses=1]
	%tmp188.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp185187.i		; <double*> [#uses=1]
	%tmp189.i = load double* %tmp188.i, align 8		; <double> [#uses=3]
	%tmp190.i = add double %tmp176.i, %tmp189.i		; <double> [#uses=1]
	%tmp199.i = add i32 %tmp18.i, 13		; <i32> [#uses=1]
	%tmp199201.i = sext i32 %tmp199.i to i64		; <i64> [#uses=1]
	%tmp202.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp199201.i		; <double*> [#uses=1]
	%tmp203.i = load double* %tmp202.i, align 8		; <double> [#uses=3]
	%tmp204.i = add double %tmp190.i, %tmp203.i		; <double> [#uses=1]
	%tmp213.i = add i32 %tmp18.i, 14		; <i32> [#uses=1]
	%tmp213215.i = sext i32 %tmp213.i to i64		; <i64> [#uses=1]
	%tmp216.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp213215.i		; <double*> [#uses=1]
	%tmp217.i = load double* %tmp216.i, align 8		; <double> [#uses=3]
	%tmp218.i = add double %tmp204.i, %tmp217.i		; <double> [#uses=1]
	%tmp227.i = add i32 %tmp18.i, 15		; <i32> [#uses=1]
	%tmp227229.i = sext i32 %tmp227.i to i64		; <i64> [#uses=1]
	%tmp230.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp227229.i		; <double*> [#uses=1]
	%tmp231.i = load double* %tmp230.i, align 8		; <double> [#uses=3]
	%tmp232.i = add double %tmp218.i, %tmp231.i		; <double> [#uses=1]
	%tmp241.i = add i32 %tmp18.i, 16		; <i32> [#uses=1]
	%tmp241243.i = sext i32 %tmp241.i to i64		; <i64> [#uses=1]
	%tmp244.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp241243.i		; <double*> [#uses=1]
	%tmp245.i = load double* %tmp244.i, align 8		; <double> [#uses=3]
	%tmp246.i = add double %tmp232.i, %tmp245.i		; <double> [#uses=1]
	%tmp255.i = add i32 %tmp18.i, 17		; <i32> [#uses=1]
	%tmp255257.i = sext i32 %tmp255.i to i64		; <i64> [#uses=1]
	%tmp258.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp255257.i		; <double*> [#uses=1]
	%tmp259.i = load double* %tmp258.i, align 8		; <double> [#uses=3]
	%tmp260.i = add double %tmp246.i, %tmp259.i		; <double> [#uses=1]
	%tmp269.i = add i32 %tmp18.i, 18		; <i32> [#uses=1]
	%tmp269271.i = sext i32 %tmp269.i to i64		; <i64> [#uses=1]
	%tmp272.i = getelementptr [26000000 x double]* %tmp95, i32 0, i64 %tmp269271.i		; <double*> [#uses=1]
	%tmp273.i = load double* %tmp272.i, align 8		; <double> [#uses=3]
	%tmp274.i = add double %tmp260.i, %tmp273.i		; <double> [#uses=1]
	%tmp274275.i = fptrunc double %tmp274.i to float		; <float> [#uses=3]
	%tmp302.i = sub double %tmp63.i, %tmp77.i		; <double> [#uses=1]
	%tmp316.i = add double %tmp302.i, %tmp119.i		; <double> [#uses=1]
	%tmp330.i = sub double %tmp316.i, %tmp133.i		; <double> [#uses=1]
	%tmp344.i = add double %tmp330.i, %tmp147.i17		; <double> [#uses=1]
	%tmp358.i = sub double %tmp344.i, %tmp161.i		; <double> [#uses=1]
	%tmp372.i = add double %tmp358.i, %tmp231.i		; <double> [#uses=1]
	%tmp386.i = add double %tmp372.i, %tmp245.i		; <double> [#uses=1]
	%tmp400.i = sub double %tmp386.i, %tmp259.i		; <double> [#uses=1]
	%tmp414.i = sub double %tmp400.i, %tmp273.i		; <double> [#uses=1]
	%tmp414415.i = fptrunc double %tmp414.i to float		; <float> [#uses=1]
	%tmp442.i = sub double %tmp35.i, %tmp49.i		; <double> [#uses=1]
	%tmp456.i = add double %tmp442.i, %tmp119.i		; <double> [#uses=1]
	%tmp470.i = add double %tmp456.i, %tmp133.i		; <double> [#uses=1]
	%tmp484.i = sub double %tmp470.i, %tmp147.i17		; <double> [#uses=1]
	%tmp498.i = sub double %tmp484.i, %tmp161.i		; <double> [#uses=1]
	%tmp512.i = add double %tmp498.i, %tmp175.i		; <double> [#uses=1]
	%tmp526.i = add double %tmp512.i, %tmp189.i		; <double> [#uses=1]
	%tmp540.i = sub double %tmp526.i, %tmp203.i		; <double> [#uses=1]
	%tmp554.i = sub double %tmp540.i, %tmp217.i		; <double> [#uses=1]
	%tmp554555.i = fptrunc double %tmp554.i to float		; <float> [#uses=1]
	%tmp582.i = sub double %tmp91.i14, %tmp105.i		; <double> [#uses=1]
	%tmp596.i = add double %tmp582.i, %tmp175.i		; <double> [#uses=1]
	%tmp610.i = sub double %tmp596.i, %tmp189.i		; <double> [#uses=1]
	%tmp624.i = add double %tmp610.i, %tmp203.i		; <double> [#uses=1]
	%tmp638.i = sub double %tmp624.i, %tmp217.i		; <double> [#uses=1]
	%tmp652.i = add double %tmp638.i, %tmp231.i		; <double> [#uses=1]
	%tmp666.i = sub double %tmp652.i, %tmp245.i		; <double> [#uses=1]
	%tmp680.i = add double %tmp666.i, %tmp259.i		; <double> [#uses=1]
	%tmp694.i = sub double %tmp680.i, %tmp273.i		; <double> [#uses=1]
	%tmp694695.i = fptrunc double %tmp694.i to float		; <float> [#uses=1]
	%tmp698.i = fdiv float %tmp414415.i, %tmp274275.i		; <float> [#uses=1]
	store float %tmp698.i, float* %ux.i, align 4
	%tmp701.i = fdiv float %tmp554555.i, %tmp274275.i		; <float> [#uses=1]
	store float %tmp701.i, float* %uy.i, align 4
	%tmp704.i = fdiv float %tmp694695.i, %tmp274275.i		; <float> [#uses=1]
	store float %tmp704.i, float* %uz.i, align 4
	%tmp843.i = add i32 %indvar983.i, 1		; <i32> [#uses=2]
	store i32 38, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 26, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 27, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 28, i32* @cg_caller_id_var, align 4
	%tmp745.i = call i64 @fwrite( i8* noalias  %tmp718719.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i7 )		; <i64> [#uses=0]
	store i32 39, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 26, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 27, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 28, i32* @cg_caller_id_var, align 4
	%tmp787.i = call i64 @fwrite( i8* noalias  %tmp760761.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i7 )		; <i64> [#uses=0]
	store i32 40, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 26, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 27, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 28, i32* @cg_caller_id_var, align 4
	%tmp829.i = call i64 @fwrite( i8* noalias  %tmp802803.i, i64 4, i64 1, %struct.FILE* noalias  %tmp7.i7 )		; <i64> [#uses=0]
	%tmp846977.i = icmp slt i32 %tmp843.i, 100		; <i1> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp846977.i, label %bb9.i, label %bb849.i

bb849.i:		; preds = %bb9.i
	%indvar.next986.i = add i32 %y.0980.i, 1		; <i32> [#uses=2]
	%exitcond.i = icmp eq i32 %indvar.next986.i, 100		; <i1> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i, label %bb857.i, label %bb844.preheader.i

bb844.preheader.i:		; preds = %bb849.i, %bb852.outer.i
	%y.0980.i = phi i32 [ 0, %bb852.outer.i ], [ %indvar.next986.i, %bb849.i ]		; <i32> [#uses=2]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 27, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 27 )
	%tmp11.i18 = mul i32 %y.0980.i, 100		; <i32> [#uses=1]
	%tmp15.i = add i32 %tmp11.i18, %tmp14.i8		; <i32> [#uses=1]
	br label %bb9.i

bb857.i:		; preds = %bb849.i
	%indvar.next988.i = add i32 %z.0.reg2mem.0.ph.i, 1		; <i32> [#uses=2]
	%exitcond989.i = icmp eq i32 %indvar.next988.i, 130		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %exitcond989.i, label %LBM_storeVelocityField.exit, label %bb852.outer.i

LBM_storeVelocityField.exit:		; preds = %bb857.i
	store i32 41, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp867.i = call i32 @fclose( %struct.FILE* %tmp7.i7 )		; <i32> [#uses=0]
	br label %cond_next97

cond_next97:		; preds = %LBM_storeVelocityField.exit, %LBM_compareVelocityField.exit, %bb68
	load [26000000 x double]** @srcGrid, align 8		; <[26000000 x double]*>:0 [#uses=1]
	%tmp2.i6221 = getelementptr [26000000 x double]* %0, i32 0, i64 -400000		; <double*> [#uses=1]
	free double* %tmp2.i6221
	store [26000000 x double]* null, [26000000 x double]** @srcGrid, align 8
	load [26000000 x double]** @dstGrid, align 8		; <[26000000 x double]*>:1 [#uses=1]
	%tmp2.i4220 = getelementptr [26000000 x double]* %1, i32 0, i64 -400000		; <double*> [#uses=1]
	free double* %tmp2.i4220
	store [26000000 x double]* null, [26000000 x double]** @dstGrid, align 8
	call void @CallProfPrinter( )
	ret i32 0
}

declare i32 @puts(i8*)

declare i64 @__strtol_internal(i8* noalias , i8** noalias , i32, i32) nounwind 

declare i32 @__xstat(i32, i8*, %struct.stat*) nounwind 

declare void @CallEdgeProfiler(i32, i32, i32)

declare void @CallProfPrinter()
