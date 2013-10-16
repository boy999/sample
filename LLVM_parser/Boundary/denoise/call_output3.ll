; ModuleID = 'call_output3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
	%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
	%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
	%struct.csEdgeStruct = type { i8, i64, [8 x i32], [8 x i32] }
	%struct.csStruct = type { i8, i64, [8 x i32] }
@gCSEdgeTableSize = internal global i32 0		; <i32*> [#uses=5]
@gCSEdgeKeyOffset.b = internal global i1 false		; <i1*> [#uses=2]
@gCSEdgeValidOffset.b = internal global i1 false		; <i1*> [#uses=2]
@.str = internal constant [57 x i8] c"0 && \22Same call site calls too many different functions\22\00"		; <[57 x i8]*> [#uses=1]
@.str1 = internal constant [11 x i8] c"callsite.c\00"		; <[11 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.2597 = internal constant [17 x i8] c"CallEdgeProfiler\00", align 16		; <[17 x i8]*> [#uses=1]
@gCSEdgeTable = internal global %struct.csEdgeStruct* null		; <%struct.csEdgeStruct**> [#uses=7]
@.str2 = internal constant [20 x i8] c"call_profile_by.log\00"		; <[20 x i8]*> [#uses=1]
@.str3 = internal constant [2 x i8] c"w\00"		; <[2 x i8]*> [#uses=1]
@.str4 = internal constant [6 x i8] c"%u %u\00"		; <[6 x i8]*> [#uses=1]
@.str5 = internal constant [7 x i8] c" %u %u\00"		; <[7 x i8]*> [#uses=1]
@gNumConflicts = internal global i64 0		; <i64*> [#uses=6]
@gNumHashFind = internal global i64 0		; <i64*> [#uses=8]
@.str6 = internal constant [24 x i8] c"m = %d; n = %d; p = %d\0A\00"		; <[24 x i8]*> [#uses=1]
@.str17 = internal constant [17 x i8] c"Now at denoise \0D\00"		; <[17 x i8]*> [#uses=1]
@.str28 = internal constant [11 x i8] c"iter = %d\0A\00"		; <[11 x i8]*> [#uses=1]
@.str39 = internal constant [11 x i8] c"data/T.img\00"		; <[11 x i8]*> [#uses=1]
@.str410 = internal constant [3 x i8] c"rb\00"		; <[3 x i8]*> [#uses=1]
@.str511 = internal constant [14 x i8] c"reading error\00"		; <[14 x i8]*> [#uses=1]
@cg_caller_id_var = internal global i32 1		; <i32*> [#uses=60]
@cg_caller_call_site_var = internal global i32 0		; <i32*> [#uses=48]

define internal fastcc i8* @hash_insert(i64 %key, i32 %keyOffSet, i32 %validOffSet) nounwind  {
entry:
	%key46 = alloca i64		; <i64*> [#uses=2]
	%key230 = alloca i64		; <i64*> [#uses=3]
	%key349 = alloca i64		; <i64*> [#uses=2]
	%tmp5 = load i32* @gCSEdgeTableSize, align 4		; <i32> [#uses=2]
	load %struct.csEdgeStruct** @gCSEdgeTable, align 8		; <%struct.csEdgeStruct*>:0 [#uses=1]
	%tmp7 = getelementptr %struct.csEdgeStruct* %0, i32 0, i32 0		; <i8*> [#uses=1]
	%tmp9 = icmp eq i32 %tmp5, 0		; <i1> [#uses=1]
	br i1 %tmp9, label %cond_true, label %cond_next

cond_true:		; preds = %entry
	%tmp181 = malloc [7 x %struct.csEdgeStruct]		; <[7 x %struct.csEdgeStruct]*> [#uses=2]
	%tmp181.sub = getelementptr [7 x %struct.csEdgeStruct]* %tmp181, i32 0, i32 0		; <%struct.csEdgeStruct*> [#uses=1]
	%tmpcast = getelementptr [7 x %struct.csEdgeStruct]* %tmp181, i32 0, i32 0, i32 0		; <i8*> [#uses=1]
	store %struct.csEdgeStruct* %tmp181.sub, %struct.csEdgeStruct** @gCSEdgeTable, align 8
	call void @llvm.memset.i64( i8* %tmpcast, i8 0, i64 560, i32 8 )
	load %struct.csEdgeStruct** @gCSEdgeTable, align 8		; <%struct.csEdgeStruct*>:1 [#uses=1]
	%tmp25 = getelementptr %struct.csEdgeStruct* %1, i32 0, i32 0		; <i8*> [#uses=1]
	store i32 7, i32* @gCSEdgeTableSize, align 4
	br label %cond_next

cond_next:		; preds = %cond_true, %entry
	%basePtr.0 = phi i8* [ %tmp25, %cond_true ], [ %tmp7, %entry ]		; <i8*> [#uses=11]
	%numElems.0 = phi i32 [ 7, %cond_true ], [ %tmp5, %entry ]		; <i32> [#uses=8]
	store i64 %key, i64* %key46, align 8
	%key4649 = bitcast i64* %key46 to i8*		; <i8*> [#uses=1]
	%tmp50 = call fastcc i32 @APHash( i8* %key4649 )		; <i32> [#uses=1]
	%tmp55 = load i64* @gNumHashFind, align 8		; <i64> [#uses=1]
	%tmp56 = add i64 %tmp55, 1		; <i64> [#uses=1]
	store i64 %tmp56, i64* @gNumHashFind, align 8
	%tmp106445 = icmp eq i32 %numElems.0, 0		; <i1> [#uses=2]
	br i1 %tmp106445, label %bb112, label %bb57.preheader

bb57.preheader:		; preds = %cond_next
	%tmp7071 = zext i32 %validOffSet to i64		; <i64> [#uses=1]
	%tmp6566 = zext i32 %keyOffSet to i64		; <i64> [#uses=1]
	%gNumConflicts.promoted5 = load i64* @gNumConflicts, align 8		; <i64> [#uses=1]
	br label %bb57

bb57:		; preds = %cond_next93, %bb57.preheader
	%gNumConflicts.tmp.06 = phi i64 [ %gNumConflicts.promoted5, %bb57.preheader ], [ %tmp95, %cond_next93 ]		; <i64> [#uses=3]
	%i.0.reg2mem.0 = phi i32 [ 0, %bb57.preheader ], [ %tmp102, %cond_next93 ]		; <i32> [#uses=1]
	%tmp50.pn = phi i32 [ %tmp50, %bb57.preheader ], [ %tmp97, %cond_next93 ]		; <i32> [#uses=1]
	%hashVal.0.reg2mem.0 = urem i32 %tmp50.pn, %numElems.0		; <i32> [#uses=2]
	%tmp60 = mul i32 %hashVal.0.reg2mem.0, 80		; <i32> [#uses=1]
	%tmp6062 = zext i32 %tmp60 to i64		; <i64> [#uses=3]
	%tmp63 = getelementptr i8* %basePtr.0, i64 %tmp6062		; <i8*> [#uses=2]
	%tmp63.sum = add i64 %tmp6062, %tmp7071		; <i64> [#uses=1]
	%tmp72 = getelementptr i8* %basePtr.0, i64 %tmp63.sum		; <i8*> [#uses=1]
	%tmp74 = load i8* %tmp72, align 1		; <i8> [#uses=1]
	%tmp75 = icmp eq i8 %tmp74, 0		; <i1> [#uses=1]
	br i1 %tmp75, label %bb112.loopexit, label %cond_next82

cond_next82:		; preds = %bb57
	%tmp63.sum435 = add i64 %tmp6062, %tmp6566		; <i64> [#uses=1]
	%tmp67 = getelementptr i8* %basePtr.0, i64 %tmp63.sum435		; <i8*> [#uses=1]
	%tmp6768 = bitcast i8* %tmp67 to i64*		; <i64*> [#uses=1]
	%tmp84 = load i64* %tmp6768, align 8		; <i64> [#uses=1]
	%tmp86 = icmp eq i64 %tmp84, %key		; <i1> [#uses=1]
	br i1 %tmp86, label %bb112.loopexit, label %cond_next93

cond_next93:		; preds = %cond_next82
	%tmp95 = add i64 %gNumConflicts.tmp.06, 1		; <i64> [#uses=2]
	%tmp97 = add i32 %hashVal.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp102 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp106 = icmp ult i32 %tmp102, %numElems.0		; <i1> [#uses=1]
	br i1 %tmp106, label %bb57, label %bb112.loopexit

bb112.loopexit:		; preds = %cond_next93, %cond_next82, %bb57
	%gNumConflicts.tmp.17 = phi i64 [ %tmp95, %cond_next93 ], [ %gNumConflicts.tmp.06, %cond_next82 ], [ %gNumConflicts.tmp.06, %bb57 ]		; <i64> [#uses=1]
	%foundValidData.0.ph = phi i8 [ 0, %cond_next93 ], [ 1, %cond_next82 ], [ 0, %bb57 ]		; <i8> [#uses=1]
	%tmp1.0.ph = phi i8* [ null, %cond_next93 ], [ %tmp63, %cond_next82 ], [ %tmp63, %bb57 ]		; <i8*> [#uses=1]
	store i64 %gNumConflicts.tmp.17, i64* @gNumConflicts, align 8
	br label %bb112

bb112:		; preds = %bb112.loopexit, %cond_next
	%foundValidData.0 = phi i8 [ 0, %cond_next ], [ %foundValidData.0.ph, %bb112.loopexit ]		; <i8> [#uses=2]
	%tmp1.0 = phi i8* [ null, %cond_next ], [ %tmp1.0.ph, %bb112.loopexit ]		; <i8*> [#uses=5]
	%tmp115.not = icmp ne i8* %tmp1.0, null		; <i1> [#uses=2]
	%tmp120 = icmp eq i8 %foundValidData.0, 1		; <i1> [#uses=1]
	%bothcond = and i1 %tmp115.not, %tmp120		; <i1> [#uses=1]
	br i1 %bothcond, label %UnifiedReturnBlock, label %cond_next127

cond_next127:		; preds = %bb112
	%tmp134 = icmp eq i8 %foundValidData.0, 0		; <i1> [#uses=1]
	%bothcond440 = and i1 %tmp115.not, %tmp134		; <i1> [#uses=1]
	br i1 %bothcond440, label %cond_true137, label %cond_next153

cond_true137:		; preds = %cond_next127
	%tmp139140 = zext i32 %keyOffSet to i64		; <i64> [#uses=1]
	%tmp141 = getelementptr i8* %tmp1.0, i64 %tmp139140		; <i8*> [#uses=1]
	%tmp141142 = bitcast i8* %tmp141 to i64*		; <i64*> [#uses=1]
	%tmp144145 = zext i32 %validOffSet to i64		; <i64> [#uses=1]
	%tmp146 = getelementptr i8* %tmp1.0, i64 %tmp144145		; <i8*> [#uses=1]
	store i8 1, i8* %tmp146, align 1
	store i64 %key, i64* %tmp141142, align 8
	ret i8* %tmp1.0

cond_next153:		; preds = %cond_next127
	%tmp = shl i32 %numElems.0, 1		; <i32> [#uses=8]
	%tmp159 = malloc %struct.csEdgeStruct, i32 %tmp		; <%struct.csEdgeStruct*> [#uses=2]
	%tmpcast2 = getelementptr %struct.csEdgeStruct* %tmp159, i32 0, i32 0		; <i8*> [#uses=7]
	store i32 %tmp, i32* @gCSEdgeTableSize, align 4
	%tmp184 = mul i32 %numElems.0, 160		; <i32> [#uses=1]
	%tmp184185 = zext i32 %tmp184 to i64		; <i64> [#uses=1]
	call void @llvm.memset.i64( i8* %tmpcast2, i8 0, i64 %tmp184185, i32 8 )
	br i1 %tmp106445, label %bb312, label %bb187.preheader

bb187.preheader:		; preds = %cond_next153
	%tmp195196 = zext i32 %validOffSet to i64		; <i64> [#uses=3]
	%tmp205206 = zext i32 %keyOffSet to i64		; <i64> [#uses=3]
	%key230233 = bitcast i64* %key230 to i8*		; <i8*> [#uses=2]
	%tmp291454 = icmp eq i32 %tmp, 0		; <i1> [#uses=1]
	br i1 %tmp291454, label %bb187.us, label %bb187

bb187.us:		; preds = %cond_next303.us, %bb187.preheader
	%i176.0.reg2mem.0.us = phi i32 [ %indvar.next, %cond_next303.us ], [ 0, %bb187.preheader ]		; <i32> [#uses=2]
	%tmp190.us = mul i32 %i176.0.reg2mem.0.us, 80		; <i32> [#uses=1]
	%tmp190192.us = zext i32 %tmp190.us to i64		; <i64> [#uses=3]
	%tmp193.sum437.us = add i64 %tmp190192.us, %tmp195196		; <i64> [#uses=1]
	%tmp197.us = getelementptr i8* %basePtr.0, i64 %tmp193.sum437.us		; <i8*> [#uses=1]
	%tmp199.us = load i8* %tmp197.us, align 1		; <i8> [#uses=1]
	%tmp200.us = icmp eq i8 %tmp199.us, 1		; <i1> [#uses=1]
	br i1 %tmp200.us, label %cond_true203.us, label %cond_next303.us

cond_next303.us:		; preds = %cond_true203.us, %bb187.us
	%indvar.next = add i32 %i176.0.reg2mem.0.us, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, %numElems.0		; <i1> [#uses=1]
	br i1 %exitcond, label %bb312, label %bb187.us

cond_true203.us:		; preds = %bb187.us
	%tmp193.us = getelementptr i8* %basePtr.0, i64 %tmp190192.us		; <i8*> [#uses=1]
	%tmp193.sum.us = add i64 %tmp190192.us, %tmp205206		; <i64> [#uses=1]
	%tmp207.us = getelementptr i8* %basePtr.0, i64 %tmp193.sum.us		; <i8*> [#uses=1]
	%tmp207208.us = bitcast i8* %tmp207.us to i64*		; <i64*> [#uses=1]
	%tmp210.us = load i64* %tmp207208.us, align 8		; <i64> [#uses=1]
	store i64 %tmp210.us, i64* %key230, align 8
	call fastcc i32 @APHash( i8* %key230233 )		; <i32>:2 [#uses=0]
	%tmp240.us = load i64* @gNumHashFind, align 8		; <i64> [#uses=1]
	%tmp241.us = add i64 %tmp240.us, 1		; <i64> [#uses=1]
	store i64 %tmp241.us, i64* @gNumHashFind, align 8
	call void @llvm.memcpy.i64( i8* null, i8* %tmp193.us, i64 80, i32 1 )
	br label %cond_next303.us

bb187:		; preds = %cond_next303, %bb187.preheader
	%i176.0.reg2mem.0 = phi i32 [ %indvar.next467, %cond_next303 ], [ 0, %bb187.preheader ]		; <i32> [#uses=2]
	%tmp190 = mul i32 %i176.0.reg2mem.0, 80		; <i32> [#uses=1]
	%tmp190192 = zext i32 %tmp190 to i64		; <i64> [#uses=3]
	%tmp193 = getelementptr i8* %basePtr.0, i64 %tmp190192		; <i8*> [#uses=1]
	%tmp193.sum437 = add i64 %tmp190192, %tmp195196		; <i64> [#uses=1]
	%tmp197 = getelementptr i8* %basePtr.0, i64 %tmp193.sum437		; <i8*> [#uses=1]
	%tmp199 = load i8* %tmp197, align 1		; <i8> [#uses=1]
	%tmp200 = icmp eq i8 %tmp199, 1		; <i1> [#uses=1]
	br i1 %tmp200, label %cond_true203, label %cond_next303

cond_true203:		; preds = %bb187
	%tmp193.sum = add i64 %tmp190192, %tmp205206		; <i64> [#uses=1]
	%tmp207 = getelementptr i8* %basePtr.0, i64 %tmp193.sum		; <i8*> [#uses=1]
	%tmp207208 = bitcast i8* %tmp207 to i64*		; <i64*> [#uses=1]
	%tmp210 = load i64* %tmp207208, align 8		; <i64> [#uses=2]
	store i64 %tmp210, i64* %key230, align 8
	%tmp234 = call fastcc i32 @APHash( i8* %key230233 )		; <i32> [#uses=1]
	%tmp240 = load i64* @gNumHashFind, align 8		; <i64> [#uses=1]
	%tmp241 = add i64 %tmp240, 1		; <i64> [#uses=1]
	store i64 %tmp241, i64* @gNumHashFind, align 8
	%gNumConflicts.promoted = load i64* @gNumConflicts, align 8		; <i64> [#uses=1]
	br label %bb242

bb242:		; preds = %cond_next278, %cond_true203
	%indvar = phi i64 [ 0, %cond_true203 ], [ %indvar.next464, %cond_next278 ]		; <i64> [#uses=3]
	%tmp234.pn = phi i32 [ %tmp234, %cond_true203 ], [ %tmp282, %cond_next278 ]		; <i32> [#uses=1]
	%i225.0.reg2mem.0 = trunc i64 %indvar to i32		; <i32> [#uses=1]
	%gNumConflicts.tmp.0 = add i64 %indvar, %gNumConflicts.promoted		; <i64> [#uses=3]
	%hashVal229.0.reg2mem.0 = urem i32 %tmp234.pn, %tmp		; <i32> [#uses=2]
	%tmp245 = mul i32 %hashVal229.0.reg2mem.0, 80		; <i32> [#uses=1]
	%tmp245247 = zext i32 %tmp245 to i64		; <i64> [#uses=3]
	%tmp248 = getelementptr i8* %tmpcast2, i64 %tmp245247		; <i8*> [#uses=2]
	%tmp248.sum = add i64 %tmp245247, %tmp195196		; <i64> [#uses=1]
	%tmp257 = getelementptr i8* %tmpcast2, i64 %tmp248.sum		; <i8*> [#uses=1]
	%tmp259 = load i8* %tmp257, align 1		; <i8> [#uses=1]
	%tmp260 = icmp eq i8 %tmp259, 0		; <i1> [#uses=1]
	br i1 %tmp260, label %bb297.loopexit, label %cond_next267

cond_next267:		; preds = %bb242
	%tmp248.sum436 = add i64 %tmp245247, %tmp205206		; <i64> [#uses=1]
	%tmp252 = getelementptr i8* %tmpcast2, i64 %tmp248.sum436		; <i8*> [#uses=1]
	%tmp252253 = bitcast i8* %tmp252 to i64*		; <i64*> [#uses=1]
	%tmp269 = load i64* %tmp252253, align 8		; <i64> [#uses=1]
	%tmp271 = icmp eq i64 %tmp269, %tmp210		; <i1> [#uses=1]
	br i1 %tmp271, label %bb297.loopexit, label %cond_next278

cond_next278:		; preds = %cond_next267
	%tmp280 = add i64 %gNumConflicts.tmp.0, 1		; <i64> [#uses=1]
	%tmp282 = add i32 %hashVal229.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp287 = add i32 %i225.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp291 = icmp ult i32 %tmp287, %tmp		; <i1> [#uses=1]
	%indvar.next464 = add i64 %indvar, 1		; <i64> [#uses=1]
	br i1 %tmp291, label %bb242, label %bb297.loopexit

bb297.loopexit:		; preds = %cond_next278, %cond_next267, %bb242
	%gNumConflicts.tmp.1 = phi i64 [ %gNumConflicts.tmp.0, %bb242 ], [ %gNumConflicts.tmp.0, %cond_next267 ], [ %tmp280, %cond_next278 ]		; <i64> [#uses=1]
	%tmp175.0.ph = phi i8* [ %tmp248, %bb242 ], [ %tmp248, %cond_next267 ], [ null, %cond_next278 ]		; <i8*> [#uses=1]
	store i64 %gNumConflicts.tmp.1, i64* @gNumConflicts, align 8
	call void @llvm.memcpy.i64( i8* %tmp175.0.ph, i8* %tmp193, i64 80, i32 1 )
	br label %cond_next303

cond_next303:		; preds = %bb297.loopexit, %bb187
	%indvar.next467 = add i32 %i176.0.reg2mem.0, 1		; <i32> [#uses=2]
	%exitcond468 = icmp eq i32 %indvar.next467, %numElems.0		; <i1> [#uses=1]
	br i1 %exitcond468, label %bb312, label %bb187

bb312:		; preds = %cond_next303, %cond_next303.us, %cond_next153
	%tmp314 = icmp ne i8* %basePtr.0, null		; <i1> [#uses=1]
	%tmp317 = icmp ne i32 %numElems.0, 0		; <i1> [#uses=1]
	%tmp321 = and i1 %tmp317, %tmp314		; <i1> [#uses=1]
	br i1 %tmp321, label %cond_true324, label %cond_next327

cond_true324:		; preds = %bb312
	free i8* %basePtr.0
	br label %cond_next327

cond_next327:		; preds = %cond_true324, %bb312
	store i64 %key, i64* %key349, align 8
	%key349352 = bitcast i64* %key349 to i8*		; <i8*> [#uses=1]
	%tmp353 = call fastcc i32 @APHash( i8* %key349352 )		; <i32> [#uses=1]
	%tmp359 = load i64* @gNumHashFind, align 8		; <i64> [#uses=1]
	%tmp360 = add i64 %tmp359, 1		; <i64> [#uses=1]
	store i64 %tmp360, i64* @gNumHashFind, align 8
	%tmp410459 = icmp eq i32 %tmp, 0		; <i1> [#uses=1]
	br i1 %tmp410459, label %bb416, label %bb361.preheader

bb361.preheader:		; preds = %cond_next327
	%tmp374375 = zext i32 %validOffSet to i64		; <i64> [#uses=1]
	%tmp369370 = zext i32 %keyOffSet to i64		; <i64> [#uses=1]
	%gNumConflicts.promoted460 = load i64* @gNumConflicts, align 8		; <i64> [#uses=1]
	br label %bb361

bb361:		; preds = %cond_next397, %bb361.preheader
	%indvar469 = phi i64 [ 0, %bb361.preheader ], [ %indvar.next470, %cond_next397 ]		; <i64> [#uses=3]
	%tmp353.pn = phi i32 [ %tmp353, %bb361.preheader ], [ %tmp401, %cond_next397 ]		; <i32> [#uses=1]
	%i344.0.reg2mem.0 = trunc i64 %indvar469 to i32		; <i32> [#uses=1]
	%gNumConflicts.tmp.0461 = add i64 %indvar469, %gNumConflicts.promoted460		; <i64> [#uses=3]
	%hashVal348.0.reg2mem.0 = urem i32 %tmp353.pn, %tmp		; <i32> [#uses=2]
	%tmp364 = mul i32 %hashVal348.0.reg2mem.0, 80		; <i32> [#uses=1]
	%tmp364366 = zext i32 %tmp364 to i64		; <i64> [#uses=3]
	%tmp367 = getelementptr i8* %tmpcast2, i64 %tmp364366		; <i8*> [#uses=2]
	%tmp367.sum = add i64 %tmp364366, %tmp374375		; <i64> [#uses=1]
	%tmp376 = getelementptr i8* %tmpcast2, i64 %tmp367.sum		; <i8*> [#uses=1]
	%tmp378 = load i8* %tmp376, align 1		; <i8> [#uses=1]
	%tmp379 = icmp eq i8 %tmp378, 0		; <i1> [#uses=1]
	br i1 %tmp379, label %bb416.loopexit, label %cond_next386

cond_next386:		; preds = %bb361
	%tmp367.sum438 = add i64 %tmp364366, %tmp369370		; <i64> [#uses=1]
	%tmp371 = getelementptr i8* %tmpcast2, i64 %tmp367.sum438		; <i8*> [#uses=1]
	%tmp371372 = bitcast i8* %tmp371 to i64*		; <i64*> [#uses=1]
	%tmp388 = load i64* %tmp371372, align 8		; <i64> [#uses=1]
	%tmp390 = icmp eq i64 %tmp388, %key		; <i1> [#uses=1]
	br i1 %tmp390, label %bb416.loopexit, label %cond_next397

cond_next397:		; preds = %cond_next386
	%tmp399 = add i64 %gNumConflicts.tmp.0461, 1		; <i64> [#uses=1]
	%tmp401 = add i32 %hashVal348.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp406 = add i32 %i344.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp410 = icmp ult i32 %tmp406, %tmp		; <i1> [#uses=1]
	%indvar.next470 = add i64 %indvar469, 1		; <i64> [#uses=1]
	br i1 %tmp410, label %bb361, label %bb416.loopexit

bb416.loopexit:		; preds = %cond_next397, %cond_next386, %bb361
	%gNumConflicts.tmp.1462 = phi i64 [ %gNumConflicts.tmp.0461, %bb361 ], [ %gNumConflicts.tmp.0461, %cond_next386 ], [ %tmp399, %cond_next397 ]		; <i64> [#uses=1]
	%tmp3.0.ph = phi i8* [ %tmp367, %bb361 ], [ %tmp367, %cond_next386 ], [ null, %cond_next397 ]		; <i8*> [#uses=1]
	store i64 %gNumConflicts.tmp.1462, i64* @gNumConflicts, align 8
	br label %bb416

bb416:		; preds = %bb416.loopexit, %cond_next327
	%tmp3.0 = phi i8* [ %tmp3.0.ph, %bb416.loopexit ], [ null, %cond_next327 ]		; <i8*> [#uses=3]
	%tmp419420 = zext i32 %keyOffSet to i64		; <i64> [#uses=1]
	%tmp421 = getelementptr i8* %tmp3.0, i64 %tmp419420		; <i8*> [#uses=1]
	%tmp421422 = bitcast i8* %tmp421 to i64*		; <i64*> [#uses=1]
	%tmp424425 = zext i32 %validOffSet to i64		; <i64> [#uses=1]
	%tmp426 = getelementptr i8* %tmp3.0, i64 %tmp424425		; <i8*> [#uses=1]
	store i8 1, i8* %tmp426, align 1
	store i64 %key, i64* %tmp421422, align 8
	store %struct.csEdgeStruct* %tmp159, %struct.csEdgeStruct** @gCSEdgeTable, align 8
	ret i8* %tmp3.0

UnifiedReturnBlock:		; preds = %bb112
	ret i8* %tmp1.0
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind 

define internal fastcc void @CallEdgeProfiler(i32 %functionId, i32 %callSiteId, i32 %calleeId) nounwind  {
entry:
	%tmp.b = load i1* @gCSEdgeValidOffset.b, align 1		; <i1> [#uses=1]
	%tmp = select i1 %tmp.b, i32 0, i32 1000000		; <i32> [#uses=2]
	%tmp1 = icmp eq i32 %tmp, 1000000		; <i1> [#uses=1]
	br i1 %tmp1, label %cond_true, label %cond_next

cond_true:		; preds = %entry
	store i1 true, i1* @gCSEdgeValidOffset.b, align 1
	store i1 true, i1* @gCSEdgeKeyOffset.b, align 1
	br label %cond_next

cond_next:		; preds = %cond_true, %entry
	%tmp9.rle = phi i32 [ 0, %cond_true ], [ %tmp, %entry ]		; <i32> [#uses=1]
	%tmp34 = zext i32 %functionId to i64		; <i64> [#uses=1]
	%tmp5 = shl i64 %tmp34, 32		; <i64> [#uses=1]
	%tmp67 = zext i32 %callSiteId to i64		; <i64> [#uses=1]
	%tmp8 = or i64 %tmp5, %tmp67		; <i64> [#uses=1]
	%tmp10.b = load i1* @gCSEdgeKeyOffset.b, align 1		; <i1> [#uses=1]
	%tmp10 = select i1 %tmp10.b, i32 8, i32 1000000		; <i32> [#uses=1]
	%tmp13 = tail call fastcc i8* @hash_insert( i64 %tmp8, i32 %tmp10, i32 %tmp9.rle )		; <i8*> [#uses=1]
	%tmp1314 = bitcast i8* %tmp13 to %struct.csEdgeStruct*		; <%struct.csEdgeStruct*> [#uses=3]
	br label %bb

bb:		; preds = %cond_next61, %cond_next
	%i.0.reg2mem.0 = phi i32 [ 0, %cond_next ], [ %tmp63, %cond_next61 ]		; <i32> [#uses=2]
	%tmp1518 = zext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=3]
	%tmp19 = getelementptr %struct.csEdgeStruct* %tmp1314, i32 0, i32 2, i64 %tmp1518		; <i32*> [#uses=2]
	%tmp20 = load i32* %tmp19, align 4		; <i32> [#uses=2]
	%tmp22 = icmp eq i32 %tmp20, %calleeId		; <i1> [#uses=1]
	br i1 %tmp22, label %cond_true25, label %cond_next39

cond_true25:		; preds = %bb
	%tmp31 = getelementptr %struct.csEdgeStruct* %tmp1314, i32 0, i32 3, i64 %tmp1518		; <i32*> [#uses=2]
	%tmp32 = load i32* %tmp31, align 4		; <i32> [#uses=1]
	%tmp33 = add i32 %tmp32, 1		; <i32> [#uses=1]
	store i32 %tmp33, i32* %tmp31, align 4
	ret void

cond_next39:		; preds = %bb
	%tmp46 = icmp eq i32 %tmp20, 0		; <i1> [#uses=1]
	br i1 %tmp46, label %cond_true49, label %cond_next61

cond_true49:		; preds = %cond_next39
	store i32 %calleeId, i32* %tmp19, align 4
	%tmp60 = getelementptr %struct.csEdgeStruct* %tmp1314, i32 0, i32 3, i64 %tmp1518		; <i32*> [#uses=1]
	store i32 1, i32* %tmp60, align 4
	ret void

cond_next61:		; preds = %cond_next39
	%tmp63 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp66 = icmp ult i32 %tmp63, 8		; <i1> [#uses=1]
	br i1 %tmp66, label %bb, label %bb69

bb69:		; preds = %cond_next61
	tail call void @__assert_fail( i8* getelementptr ([57 x i8]* @.str, i32 0, i64 0), i8* getelementptr ([11 x i8]* @.str1, i32 0, i64 0), i32 95, i8* getelementptr ([17 x i8]* @__PRETTY_FUNCTION__.2597, i32 0, i32 0) ) noreturn nounwind 
	unreachable
}

define internal fastcc void @CallProfPrinter() {
entry:
	%tmp2 = tail call %struct.FILE* @fopen( i8* noalias  getelementptr ([20 x i8]* @.str2, i32 0, i64 0), i8* noalias  getelementptr ([2 x i8]* @.str3, i32 0, i64 0) )		; <%struct.FILE*> [#uses=4]
	%tmp7997 = load i32* @gCSEdgeTableSize, align 4		; <i32> [#uses=1]
	%tmp8199 = icmp eq i32 %tmp7997, 0		; <i1> [#uses=1]
	%tmp3100 = load %struct.csEdgeStruct** @gCSEdgeTable, align 8		; <%struct.csEdgeStruct*> [#uses=3]
	br i1 %tmp8199, label %bb84, label %bb.preheader

bb.preheader:		; preds = %entry
	%tmp7273 = bitcast %struct.FILE* %tmp2 to i8*		; <i8*> [#uses=1]
	br label %bb

bb:		; preds = %bb78, %bb.preheader
	%tmp11.rle = phi %struct.csEdgeStruct* [ %tmp3100, %bb.preheader ], [ %tmp3, %bb78 ]		; <%struct.csEdgeStruct*> [#uses=1]
	%i.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp77, %bb78 ]		; <i32> [#uses=2]
	%tmp3.reg2mem.0 = phi %struct.csEdgeStruct* [ %tmp3100, %bb.preheader ], [ %tmp3, %bb78 ]		; <%struct.csEdgeStruct*> [#uses=1]
	%tmp45 = zext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=4]
	%tmp7 = getelementptr %struct.csEdgeStruct* %tmp3.reg2mem.0, i64 %tmp45, i32 0		; <i8*> [#uses=1]
	%tmp8 = load i8* %tmp7, align 8		; <i8> [#uses=1]
	%tmp9 = icmp eq i8 %tmp8, 0		; <i1> [#uses=1]
	br i1 %tmp9, label %bb78, label %cond_true

cond_true:		; preds = %bb
	%tmp15 = getelementptr %struct.csEdgeStruct* %tmp11.rle, i64 %tmp45, i32 1		; <i64*> [#uses=1]
	%tmp16 = load i64* %tmp15, align 8		; <i64> [#uses=2]
	%tmp1617 = trunc i64 %tmp16 to i32		; <i32> [#uses=1]
	%tmp24 = lshr i64 %tmp16, 32		; <i64> [#uses=1]
	%tmp2425 = trunc i64 %tmp24 to i32		; <i32> [#uses=1]
	%tmp28 = tail call i32 (%struct.FILE*, i8*, ...)* @fprintf( %struct.FILE* noalias  %tmp2, i8* noalias  getelementptr ([6 x i8]* @.str4, i32 0, i64 0), i32 %tmp2425, i32 %tmp1617 ) nounwind 		; <i32> [#uses=0]
	br label %bb29

bb29:		; preds = %cond_true42, %cond_true
	%j.0.reg2mem.0 = phi i32 [ 0, %cond_true ], [ %tmp65, %cond_true42 ]		; <i32> [#uses=2]
	%tmp30 = load %struct.csEdgeStruct** @gCSEdgeTable, align 8		; <%struct.csEdgeStruct*> [#uses=2]
	%tmp3436 = zext i32 %j.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp37 = getelementptr %struct.csEdgeStruct* %tmp30, i64 %tmp45, i32 2, i64 %tmp3436		; <i32*> [#uses=1]
	%tmp38 = load i32* %tmp37, align 4		; <i32> [#uses=2]
	%tmp39 = icmp eq i32 %tmp38, 0		; <i1> [#uses=1]
	br i1 %tmp39, label %bb71, label %cond_true42

cond_true42:		; preds = %bb29
	%tmp50 = getelementptr %struct.csEdgeStruct* %tmp30, i64 %tmp45, i32 3, i64 %tmp3436		; <i32*> [#uses=1]
	%tmp51 = load i32* %tmp50, align 4		; <i32> [#uses=1]
	%tmp63 = tail call i32 (%struct.FILE*, i8*, ...)* @fprintf( %struct.FILE* noalias  %tmp2, i8* noalias  getelementptr ([7 x i8]* @.str5, i32 0, i64 0), i32 %tmp38, i32 %tmp51 ) nounwind 		; <i32> [#uses=0]
	%tmp65 = add i32 %j.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp68 = icmp ult i32 %tmp65, 8		; <i1> [#uses=1]
	br i1 %tmp68, label %bb29, label %bb71

bb71:		; preds = %cond_true42, %bb29
	%tmp74 = tail call i32 @fputc( i32 10, i8* %tmp7273 )		; <i32> [#uses=0]
	br label %bb78

bb78:		; preds = %bb71, %bb
	%tmp77 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp79 = load i32* @gCSEdgeTableSize, align 4		; <i32> [#uses=1]
	%tmp81 = icmp ult i32 %tmp77, %tmp79		; <i1> [#uses=1]
	%tmp3 = load %struct.csEdgeStruct** @gCSEdgeTable, align 8		; <%struct.csEdgeStruct*> [#uses=3]
	br i1 %tmp81, label %bb, label %bb84

bb84:		; preds = %bb78, %entry
	%tmp3.reg2mem.1 = phi %struct.csEdgeStruct* [ %tmp3100, %entry ], [ %tmp3, %bb78 ]		; <%struct.csEdgeStruct*> [#uses=1]
	free %struct.csEdgeStruct* %tmp3.reg2mem.1
	%tmp88 = tail call i32 @fclose( %struct.FILE* %tmp2 )		; <i32> [#uses=0]
	ret void
}

declare %struct.FILE* @fopen(i8* noalias , i8* noalias )

declare i32 @fprintf(%struct.FILE* noalias , i8* noalias , ...) nounwind 

declare i32 @fputc(i32, i8*)

declare i32 @fclose(%struct.FILE*)

define internal fastcc i32 @APHash(i8* %str) nounwind  {
entry:
	br label %bb

bb:		; preds = %bb30, %entry
	%str_addr.0.reg2mem.0.rec = phi i64 [ %indvar.next, %bb30 ], [ 0, %entry ]		; <i64> [#uses=3]
	%hash.0.reg2mem.0 = phi i32 [ %tmp25, %bb30 ], [ -1431655766, %entry ]		; <i32> [#uses=5]
	%str_addr.0.reg2mem.0 = getelementptr i8* %str, i64 %str_addr.0.reg2mem.0.rec		; <i8*> [#uses=2]
	%tmp255 = and i64 %str_addr.0.reg2mem.0.rec, 1		; <i64> [#uses=1]
	%toBool = icmp eq i64 %tmp255, 0		; <i1> [#uses=1]
	br i1 %toBool, label %cond_true, label %cond_false

cond_true:		; preds = %bb
	%tmp6 = shl i32 %hash.0.reg2mem.0, 7		; <i32> [#uses=1]
	%tmp8 = load i8* %str_addr.0.reg2mem.0, align 1		; <i8> [#uses=1]
	%tmp89 = sext i8 %tmp8 to i32		; <i32> [#uses=1]
	%tmp11 = lshr i32 %hash.0.reg2mem.0, 3		; <i32> [#uses=1]
	%tmp12 = mul i32 %tmp89, %tmp11		; <i32> [#uses=1]
	%tmp13 = xor i32 %tmp12, %tmp6		; <i32> [#uses=1]
	br label %bb30

cond_false:		; preds = %bb
	%tmp15 = shl i32 %hash.0.reg2mem.0, 11		; <i32> [#uses=1]
	%tmp17 = load i8* %str_addr.0.reg2mem.0, align 1		; <i8> [#uses=1]
	%tmp1718 = sext i8 %tmp17 to i32		; <i32> [#uses=1]
	%tmp20 = lshr i32 %hash.0.reg2mem.0, 5		; <i32> [#uses=1]
	%tmp21 = xor i32 %tmp1718, %tmp20		; <i32> [#uses=1]
	%tmp22 = add i32 %tmp21, %tmp15		; <i32> [#uses=1]
	%tmp22not = xor i32 %tmp22, -1		; <i32> [#uses=1]
	br label %bb30

bb30:		; preds = %cond_false, %cond_true
	%iftmp.17.0 = phi i32 [ %tmp22not, %cond_false ], [ %tmp13, %cond_true ]		; <i32> [#uses=1]
	%tmp25 = xor i32 %iftmp.17.0, %hash.0.reg2mem.0		; <i32> [#uses=2]
	%indvar.next = add i64 %str_addr.0.reg2mem.0.rec, 1		; <i64> [#uses=2]
	%exitcond = icmp eq i64 %indvar.next, 8		; <i1> [#uses=1]
	br i1 %exitcond, label %bb36, label %bb

bb36:		; preds = %bb30
	ret i32 %tmp25
}

declare void @llvm.memset.i64(i8*, i8, i64, i32) nounwind 

declare void @llvm.memcpy.i64(i8*, i8*, i64, i32) nounwind 

define internal fastcc void @denoise_CPU_stage1(float* %g, float* %u) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 1, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val, i32 %val2, i32 1 )
	br label %bb390.outer

bb390.outer:		; preds = %bb397, %entry
	%indvar448 = phi i32 [ 0, %entry ], [ %p.0.reg2mem.0.ph, %bb397 ]		; <i32> [#uses=1]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 5, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 5 )
	%p.0.reg2mem.0.ph = add i32 %indvar448, 1		; <i32> [#uses=4]
	%tmp5 = shl i32 %p.0.reg2mem.0.ph, 4		; <i32> [#uses=1]
	br label %bb381.preheader

bb2:		; preds = %bb381.preheader, %bb2
	%indvar = phi i32 [ 0, %bb381.preheader ], [ %m.0437, %bb2 ]		; <i32> [#uses=1]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 7, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 7 )
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
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	%tmp378 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([24 x i8]* @.str6, i32 0, i64 0), i32 %m.0437, i32 %n.0439, i32 %p.0.reg2mem.0.ph ) nounwind 		; <i32> [#uses=0]
	%exitcond = icmp eq i32 %m.0437, 14		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb387, label %bb2

bb387:		; preds = %bb2
	%exitcond447 = icmp eq i32 %n.0439, 14		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond447, label %bb397, label %bb381.preheader

bb381.preheader:		; preds = %bb387, %bb390.outer
	%indvar445 = phi i32 [ 0, %bb390.outer ], [ %n.0439, %bb387 ]		; <i32> [#uses=1]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 6, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 6 )
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
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond450, label %return.split, label %bb390.outer

return.split:		; preds = %bb397
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare float @llvm.sqrt.f32(float) nounwind readnone 

declare i32 @printf(i8*, ...) nounwind 

define internal fastcc void @denoise_CPU_stage2(float* %T0, float* %g, float* %u) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 2, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val, i32 %val2, i32 2 )
	br label %bb404.outer

bb404.outer:		; preds = %bb411, %entry
	%indvar461 = phi i32 [ 0, %entry ], [ %p.0.reg2mem.0.ph, %bb411 ]		; <i32> [#uses=1]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 8, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 8 )
	%p.0.reg2mem.0.ph = add i32 %indvar461, 1		; <i32> [#uses=4]
	%tmp13 = shl i32 %p.0.reg2mem.0.ph, 4		; <i32> [#uses=1]
	br label %bb395.preheader

bb10:		; preds = %bb395.preheader, %bb10
	%indvar = phi i32 [ 0, %bb395.preheader ], [ %m.0449, %bb10 ]		; <i32> [#uses=1]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 10, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 10 )
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
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 10, i32* @cg_caller_id_var, align 4
	%tmp392 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([24 x i8]* @.str6, i32 0, i64 0), i32 %m.0449, i32 %n.0451, i32 %p.0.reg2mem.0.ph ) nounwind 		; <i32> [#uses=0]
	%exitcond = icmp eq i32 %m.0449, 14		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb401, label %bb10

bb401:		; preds = %bb10
	%exitcond460 = icmp eq i32 %n.0451, 14		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond460, label %bb411, label %bb395.preheader

bb395.preheader:		; preds = %bb401, %bb404.outer
	%indvar458 = phi i32 [ 0, %bb404.outer ], [ %n.0451, %bb401 ]		; <i32> [#uses=1]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 9, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 9 )
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
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond463, label %return.split, label %bb404.outer

return.split:		; preds = %bb411
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @denoise(float* %T0) {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 3, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val, i32 %val2, i32 3 )
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp1 = tail call i32 @puts( i8* getelementptr ([17 x i8]* @.str17, i32 0, i64 0) )		; <i32> [#uses=0]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp9 = tail call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=4]
	%tmp910 = bitcast i8* %tmp9 to float*		; <float*> [#uses=6]
	%tmp2123 = bitcast float* %T0 to i8*		; <i8*> [#uses=2]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmp9, i8* %tmp2123, i64 16384, i32 4 )
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp30 = tail call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp3031 = bitcast i8* %tmp30 to float*		; <float*> [#uses=6]
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage1( float* %tmp3031, float* %tmp910 )
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	store i32 6, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp40 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str28, i32 0, i64 0), i32 0 ) nounwind 		; <i32> [#uses=0]
	store i32 7, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage1( float* %tmp3031, float* %tmp910 )
	store i32 8, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	store i32 9, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp40.1 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str28, i32 0, i64 0), i32 1 ) nounwind 		; <i32> [#uses=0]
	store i32 10, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage1( float* %tmp3031, float* %tmp910 )
	store i32 11, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call fastcc void @denoise_CPU_stage2( float* %T0, float* %tmp3031, float* %tmp910 )
	store i32 12, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	%tmp40.2 = tail call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([11 x i8]* @.str28, i32 0, i64 0), i32 2 ) nounwind 		; <i32> [#uses=0]
	store i32 13, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmp2123, i8* %tmp9, i64 16384, i32 4 )
	free i8* %tmp9
	free i8* %tmp30
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare i32 @puts(i8*)

declare i8* @calloc(i64, i64) nounwind 

define i32 @main(i32 %argc, i8** %argv) {
entry:
	%num = alloca i16		; <i16*> [#uses=2]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	%tmp8 = call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp89 = bitcast i8* %tmp8 to float*		; <float*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	%tmp16 = call i8* @calloc( i64 4096, i64 4 ) nounwind 		; <i8*> [#uses=2]
	%tmp1617 = bitcast i8* %tmp16 to float*		; <float*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	%tmp20 = call %struct.FILE* @fopen( i8* noalias  getelementptr ([11 x i8]* @.str39, i32 0, i64 0), i8* noalias  getelementptr ([3 x i8]* @.str410, i32 0, i64 0) )		; <%struct.FILE*> [#uses=3]
	%tmp22 = icmp eq %struct.FILE* %tmp20, null		; <i1> [#uses=1]
	br i1 %tmp22, label %cond_true, label %bb70.preheader

bb70.preheader:		; preds = %entry
	%num28 = bitcast i16* %num to i8*		; <i8*> [#uses=1]
	br label %bb60.preheader

cond_true:		; preds = %entry
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	%tmp25 = call i32 @puts( i8* getelementptr ([14 x i8]* @.str511, i32 0, i64 0) )		; <i32> [#uses=0]
	call fastcc void @CallProfPrinter( )
	ret i32 1

bb27:		; preds = %bb51.preheader, %bb27
	%i.093 = phi i32 [ 0, %bb51.preheader ], [ %indvar.next, %bb27 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 13, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 13 )
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 13, i32* @cg_caller_id_var, align 4
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
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb57, label %bb27

bb57:		; preds = %bb27
	%indvar.next103 = add i32 %j.095, 1		; <i32> [#uses=2]
	%exitcond104 = icmp eq i32 %indvar.next103, 16		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond104, label %bb66, label %bb51.preheader

bb51.preheader:		; preds = %bb60.preheader, %bb57
	%j.095 = phi i32 [ 0, %bb60.preheader ], [ %indvar.next103, %bb57 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 12, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 12 )
	br label %bb27

bb66:		; preds = %bb57
	%indvar.next105 = add i32 %k.098, 1		; <i32> [#uses=2]
	%exitcond106 = icmp eq i32 %indvar.next105, 16		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond106, label %bb76, label %bb60.preheader

bb60.preheader:		; preds = %bb66, %bb70.preheader
	%k.098 = phi i32 [ 0, %bb70.preheader ], [ %indvar.next105, %bb66 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 11, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 11 )
	br label %bb51.preheader

bb76:		; preds = %bb66
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	%tmp78 = call i32 @fclose( %struct.FILE* %tmp20 )		; <i32> [#uses=0]
	store i32 6, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	call void @llvm.memcpy.i64( i8* %tmp16, i8* %tmp8, i64 16384, i32 4 )
	store i32 7, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	call fastcc void @denoise( float* %tmp1617 )
	call fastcc void @CallProfPrinter( )
	ret i32 0
}

declare i64 @fread(i8* noalias , i64, i64, %struct.FILE* noalias )
