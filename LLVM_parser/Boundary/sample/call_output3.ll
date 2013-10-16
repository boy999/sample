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
@cg_caller_id_var = internal global i32 1		; <i32*> [#uses=18]
@cg_caller_call_site_var.b = internal global i1 false		; <i1*> [#uses=13]

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

define internal fastcc float @func2(i32 %a, i32 %b) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2.b = load i1* @cg_caller_call_site_var.b, align 1		; <i1> [#uses=2]
	%val2 = zext i1 %val2.b to i32		; <i32> [#uses=1]
	store i32 1, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val, i32 %val2, i32 1 )
	%tmp3 = icmp sgt i32 %a, %b		; <i1> [#uses=1]
	%tmp = sub i32 0, %b		; <i32> [#uses=1]
	%retval.0.in.p = select i1 %tmp3, i32 %b, i32 %tmp		; <i32> [#uses=1]
	%retval.0.in = add i32 %retval.0.in.p, %a		; <i32> [#uses=1]
	%retval.0 = sitofp i32 %retval.0.in to float		; <float> [#uses=1]
	store i1 %val2.b, i1* @cg_caller_call_site_var.b, align 1
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret float %retval.0
}

define internal fastcc void @func1(float* %a, i32 %m, i32 %n, i32 %p) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2.b = load i1* @cg_caller_call_site_var.b, align 1		; <i1> [#uses=2]
	%val2 = zext i1 %val2.b to i32		; <i32> [#uses=1]
	store i32 2, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val, i32 %val2, i32 2 )
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
	%tmp58 = add i32 %n, -1		; <i32> [#uses=1]
	%tmp59 = icmp slt i32 %tmp58, 0		; <i1> [#uses=1]
	%tmp61 = select i1 %tmp59, i32 1, i32 %n		; <i32> [#uses=1]
	%tmp = add i32 %p, -1		; <i32> [#uses=1]
	%tmp55 = icmp slt i32 %tmp, 0		; <i1> [#uses=1]
	%tmp56 = select i1 %tmp55, i32 1, i32 %p		; <i32> [#uses=1]
	br label %bb27.outer

bb27.outer:		; preds = %bb33, %bb27.preheader.split
	%i.0.reg2mem.0.ph = phi i32 [ 0, %bb27.preheader.split ], [ %indvar.next63, %bb33 ]		; <i32> [#uses=3]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4.b = load i1* @cg_caller_call_site_var.b, align 1		; <i1> [#uses=2]
	%val4 = zext i1 %val4.b to i32		; <i32> [#uses=1]
	store i32 4, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 4 )
	%tmp34 = sext i32 %i.0.reg2mem.0.ph to i64		; <i64> [#uses=1]
	%tmp5 = getelementptr float* %a, i64 %tmp34		; <float*> [#uses=2]
	br i1 %tmp2251, label %bb19.preheader, label %bb33

bb2:		; preds = %bb19.preheader, %bb2
	%k.050 = phi i32 [ 0, %bb19.preheader ], [ %indvar.next, %bb2 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44.b = load i1* @cg_caller_call_site_var.b, align 1		; <i1> [#uses=2]
	%val44 = zext i1 %val44.b to i32		; <i32> [#uses=1]
	store i32 6, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 6 )
	%tmp6 = load float* %tmp5, align 4		; <float> [#uses=1]
	%tmp9 = add i32 %k.050, %j.052		; <i32> [#uses=1]
	store i1 false, i1* @cg_caller_call_site_var.b, align 1
	store i32 6, i32* @cg_caller_id_var, align 4
	%tmp11 = tail call fastcc float @func2( i32 %i.0.reg2mem.0.ph, i32 %tmp9 )		; <float> [#uses=1]
	%tmp12 = add float %tmp6, %tmp11		; <float> [#uses=1]
	store float %tmp12, float* %tmp5, align 4
	%indvar.next = add i32 %k.050, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, %tmp56		; <i1> [#uses=1]
	store i1 %val44.b, i1* @cg_caller_call_site_var.b, align 1
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb24, label %bb2

bb24:		; preds = %bb2
	%indvar.next57 = add i32 %j.052, 1		; <i32> [#uses=2]
	%exitcond62 = icmp eq i32 %indvar.next57, %tmp61		; <i1> [#uses=1]
	store i1 %val42.b, i1* @cg_caller_call_site_var.b, align 1
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond62, label %bb33, label %bb19.preheader

bb19.preheader:		; preds = %bb24, %bb27.outer
	%j.052 = phi i32 [ %indvar.next57, %bb24 ], [ 0, %bb27.outer ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42.b = load i1* @cg_caller_call_site_var.b, align 1		; <i1> [#uses=2]
	%val42 = zext i1 %val42.b to i32		; <i32> [#uses=1]
	store i32 5, i32* @cg_caller_id_var, align 4
	call fastcc void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 5 )
	br label %bb2

bb33:		; preds = %bb24, %bb27.outer
	%indvar.next63 = add i32 %i.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond68 = icmp eq i32 %indvar.next63, %tmp67		; <i1> [#uses=1]
	store i1 %val4.b, i1* @cg_caller_call_site_var.b, align 1
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond68, label %return, label %bb27.outer

return:		; preds = %bb33, %bb27.preheader, %entry
	store i1 %val2.b, i1* @cg_caller_call_site_var.b, align 1
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define i32 @main() nounwind  {
entry:
	%A = alloca [10 x float]		; <[10 x float]*> [#uses=2]
	%B = alloca [100 x float]		; <[100 x float]*> [#uses=2]
	%A1 = getelementptr [10 x float]* %A, i32 0, i32 0		; <float*> [#uses=1]
	store i1 false, i1* @cg_caller_call_site_var.b, align 1
	store i32 3, i32* @cg_caller_id_var, align 4
	call fastcc void @func1( float* %A1, i32 10, i32 10, i32 10 )
	%B2 = getelementptr [100 x float]* %B, i32 0, i32 0		; <float*> [#uses=1]
	store i1 true, i1* @cg_caller_call_site_var.b, align 1
	store i32 3, i32* @cg_caller_id_var, align 4
	call fastcc void @func1( float* %B2, i32 100, i32 100, i32 100 )
	%tmp3 = getelementptr [10 x float]* %A, i32 0, i64 0		; <float*> [#uses=1]
	%tmp4 = load float* %tmp3, align 4		; <float> [#uses=1]
	%tmp5 = getelementptr [100 x float]* %B, i32 0, i64 0		; <float*> [#uses=1]
	%tmp6 = load float* %tmp5, align 4		; <float> [#uses=1]
	%tmp7 = add float %tmp4, %tmp6		; <float> [#uses=1]
	%tmp78 = fptosi float %tmp7 to i32		; <i32> [#uses=1]
	call fastcc void @CallProfPrinter( )
	ret i32 %tmp78
}
