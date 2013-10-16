; ModuleID = 'call_output2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"
	%struct..0._27 = type { i8, i8, i8, i8 }
	%struct..0._30 = type { i8, i8, i8, i8 }
	%struct..0._39 = type { i8, i8, i8, i8 }
	%struct..0._40 = type { i8, i8, i8, i8 }
	%struct..1._29 = type { i8, i8, i8, i8 }
	%struct..1._32 = type { i8, i8, i8, i8 }
	%struct..1._38 = type { i32 }
	%struct..1._41 = type { i8, i8, i8, i8 }
	%struct..1._42 = type { i8, i8, i8, i8 }
	%struct..2._36 = type { i8, i8, i8, i8 }
	%struct..2._41 = type { i8, i8, i8, i8 }
	%struct..3._38 = type { i8, i8, i8, i8 }
	%struct..3._40 = type { i32 }
	%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
	%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }
	%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
	%struct.__type_info_pseudo = type { i8*, i8* }
	%struct.boundart = type { %struct.pointt*, i32, i32 }
	%struct.createwayinfot = type { %struct.rvectort, %struct.rvectort, i8 }
	%struct.createwaymnginfot = type { float, float, float, float, i32, i32, float, float }
	%"struct.flexarray<i32>" = type { i32*, i32, i32 }
	%"struct.flexarray<levelplacet>" = type { %struct.levelplacet*, i32, i32 }
	%"struct.flexarray<pointt>" = type { %struct.pointt*, i32, i32 }
	%"struct.flexarray<regboundobj>" = type { %struct.regboundobj*, i32, i32 }
	%"struct.flexarray<regobj*>" = type { %struct.regobj**, i32, i32 }
	%"struct.flexstack<i32>" = type { i32*, i32, i32 }
	%"struct.largesolidarray<regobj*>" = type { %struct.regobj**, %"struct.flexarray<i32>", %"struct.flexarray<i32>", %"struct.flexarray<i32>", i32, i32 }
	%struct.levelplacet = type { i16, i16, float, float, float }
	%struct.point16t = type { i16, i16 }
	%struct.pointt = type { i32, i32 }
	%struct.regboundart = type { %struct.regobj**, i32, i32 }
	%struct.regboundobj = type { %struct.boundart, %struct.boundart, i8, i32, %struct.regobj*, i32, i32, i32, i32, %struct.regobj**, i8*, i32, i32, i32, i32, %struct.regmngobj*, i8 }
	%struct.regmngobj = type { i16*, i16, i32, i32, i8, i32, %struct.regobj**, i8*, [256 x i8], i32, i32, float, i32, i32, %struct..1._38, %struct..1._38, i32, i32, %"struct.largesolidarray<regobj*>" }
	%"struct.regmngobj::._26" = type { i32 }
	%"struct.regmngobj::._28" = type { i32 }
	%"struct.regmngobj::._38" = type { i32 }
	%"struct.regmngobj::._39" = type { i32 }
	%"struct.regmngobj::._40" = type { i32 }
	%"struct.regmngobj::._41" = type { i32 }
	%struct.regobj = type { i32, i8, i8, %struct.regmngobj*, i32, %struct.pointt, i32, i32, i32, %"struct.flexarray<regobj*>" }
	%struct.regwayobj = type { i32 (...)**, %"struct.flexarray<regobj*>", %"struct.flexarray<regobj*>", i32, i32, %struct.regmngobj*, i8, %struct.regobj*, %struct.regobj* }
	%struct.rvectort = type { float, float, float }
	%struct.statinfot = type { double, double, double, double, double, i64, i64, i64, i64, i64, i64, i64, i64 }
	%struct.way2obj = type { i8*, %struct.point16t*, i16, [256 x i8], [256 x %struct.boundart], i32, i32, i32, i32, i32, i32, i32, i8, i32, i32, %struct..1._38, %struct..1._38, i32, i32 }
	%"struct.way2obj::._29" = type { i32 }
	%"struct.way2obj::._31" = type { i32 }
	%"struct.way2obj::._35" = type { i32 }
	%"struct.way2obj::._37" = type { i32 }
	%"struct.way2obj::waymapcellt" = type { i16, i16 }
	%struct.wayinfot = type { i8, %struct.rvectort*, i32, i8 }
	%struct.waymapcellt = type { i16, i16 }
	%struct.wayobj = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, %struct.createwaymnginfot, %struct.createwayinfot, i16*, %struct.point16t*, i32*, i32*, i32, i32, i8, i32, i16, i16 }
	%struct.workinfot = type { [4096 x i8], i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32 }
@.str = internal constant [23 x i8] c"Error in createregions\00"		; <[23 x i8]*> [#uses=1]
@way.0 = internal global i32 0		; <i32*> [#uses=4]
@way.1 = internal global i32 0		; <i32*> [#uses=4]
@way.2 = internal global i32 0		; <i32*> [#uses=11]
@way.3 = internal global i32 0		; <i32*> [#uses=3]
@way.4 = internal global i32 0		; <i32*> [#uses=3]
@way.5 = internal global i32 0		; <i32*> [#uses=4]
@way.6 = internal global i32 0		; <i32*> [#uses=4]
@way.7 = internal global i32 0		; <i32*> [#uses=2]
@way.8 = internal global i32 0		; <i32*> [#uses=4]
@way.16 = internal global i16* null		; <i16**> [#uses=13]
@way.17 = internal global %struct.point16t* null		; <%struct.point16t**> [#uses=9]
@way.18 = internal global i32* null		; <i32**> [#uses=4]
@way.19 = internal global i32* null		; <i32**> [#uses=4]
@way.20 = internal global i32 0		; <i32*> [#uses=4]
@way.21 = internal global i32 0		; <i32*> [#uses=3]
@way.22.b = internal global i1 false		; <i1*> [#uses=22]
@way.23 = internal global i32 0		; <i32*> [#uses=11]
@way.24 = internal global i16 0		; <i16*> [#uses=6]
@way.25 = internal global i16 0		; <i16*> [#uses=9]
@regway = internal global %struct.regwayobj {
    i32 (...)** getelementptr ([5 x i32 (...)*]* @_ZTV9regwayobj, i32 0, i64 2), 
    %"struct.flexarray<regobj*>" zeroinitializer, 
    %"struct.flexarray<regobj*>" zeroinitializer, 
    i32 0, 
    i32 0, 
    %struct.regmngobj* null, 
    i8 0, 
    %struct.regobj* null, 
    %struct.regobj* null }, align 32		; <%struct.regwayobj*> [#uses=16]
@regmng = internal global %struct.regmngobj zeroinitializer, align 32		; <%struct.regmngobj*> [#uses=50]
@way2 = internal global %struct.way2obj zeroinitializer, align 32		; <%struct.way2obj*> [#uses=38]
@.str1 = internal constant [33 x i8] c"Create regional map time : %.0f\0A\00"		; <[33 x i8]*> [#uses=1]
@.str12 = internal constant [25 x i8] c"Create ways time : %.0f\0A\00"		; <[25 x i8]*> [#uses=1]
@.str2 = internal constant [22 x i8] c"Ways quantity : %lld\0A\00"		; <[22 x i8]*> [#uses=1]
@.str3 = internal constant [25 x i8] c"Total way length : %lld\0A\00"		; <[25 x i8]*> [#uses=1]
@.str4 = internal constant [29 x i8] c"Create reg ways time : %.0f\0A\00"		; <[29 x i8]*> [#uses=1]
@.str5 = internal constant [26 x i8] c"Reg ways quantity : %lld\0A\00"		; <[26 x i8]*> [#uses=1]
@.str6 = internal constant [29 x i8] c"Total reg way length : %lld\0A\00"		; <[29 x i8]*> [#uses=1]
@.str7 = internal constant [31 x i8] c"Create river ways time : %.0f\0A\00"		; <[31 x i8]*> [#uses=1]
@.str8 = internal constant [28 x i8] c"River ways quantity : %lld\0A\00"		; <[28 x i8]*> [#uses=1]
@.str9 = internal constant [31 x i8] c"Total river way length : %lld\0A\00"		; <[31 x i8]*> [#uses=1]
@.str10 = internal constant [30 x i8] c"Create land ways time : %.0f\0A\00"		; <[30 x i8]*> [#uses=1]
@.str11 = internal constant [27 x i8] c"Land ways quantity : %lld\0A\00"		; <[27 x i8]*> [#uses=1]
@.str123 = internal constant [30 x i8] c"Total land way length : %lld\0A\00"		; <[30 x i8]*> [#uses=1]
@_ZTV9regwayobj = internal constant [5 x i32 (...)*] [ i32 (...)* null, i32 (...)* bitcast (%struct.__class_type_info_pseudo* @_ZTI9regwayobj to i32 (...)*), i32 (...)* bitcast (i8 (%struct.regwayobj*, %struct.regobj*, %struct.regobj*)* @_ZN9regwayobj12isaddtoboundEP6regobjS1_ to i32 (...)*), i32 (...)* bitcast (void (%struct.regwayobj*, %struct.regmngobj*)* @_ZN9regwayobj6createEP9regmngobj to i32 (...)*), i32 (...)* bitcast (void (%struct.regwayobj*)* @_ZN9regwayobj7destroyEv to i32 (...)*) ], align 32		; <[5 x i32 (...)*]*> [#uses=1]
@.str13 = internal constant [27 x i8] c"Small Path Finding Library\00"		; <[27 x i8]*> [#uses=1]
@.str14 = internal constant [24 x i8] c"Read configuration file\00"		; <[24 x i8]*> [#uses=1]
@.str15 = internal constant [36 x i8] c"Cannot read configuration file name\00"		; <[36 x i8]*> [#uses=1]
@.str16 = internal constant [2 x i8] c"r\00"		; <[2 x i8]*> [#uses=1]
@.str17 = internal constant [31 x i8] c"Cannot read configuration file\00"		; <[31 x i8]*> [#uses=1]
@.str18 = internal constant [3 x i8] c"%s\00"		; <[3 x i8]*> [#uses=1]
@.str19 = internal constant [3 x i8] c"%d\00"		; <[3 x i8]*> [#uses=1]
@.str20 = internal constant [3 x i8] c"%f\00"		; <[3 x i8]*> [#uses=1]
@.str21 = internal constant [12 x i8] c"Create ways\00"		; <[12 x i8]*> [#uses=1]
@.str22 = internal constant [11 x i8] c"Random map\00"		; <[11 x i8]*> [#uses=1]
@llvm.global_ctors = appending global [0 x { i32, void ()* }] zeroinitializer		; <[0 x { i32, void ()* }]*> [#uses=0]
@y3rnd = internal global i32 3007		; <i32*> [#uses=22]
@y2rnd = internal global i32 11		; <i32*> [#uses=22]
@y1rnd = internal global i32 1023		; <i32*> [#uses=22]
@_ZN6regobj9bound1arpE = internal global %struct.boundart zeroinitializer, align 16		; <%struct.boundart*> [#uses=5]
@_ZN6regobj6boundlE = internal global i32 0		; <i32*> [#uses=3]
@_ZN6regobj9bound2arpE = internal global %struct.boundart zeroinitializer, align 16		; <%struct.boundart*> [#uses=5]
@_ZTI9regwayobj = internal constant %struct.__class_type_info_pseudo { %struct.__type_info_pseudo { i8* inttoptr (i64 add (i64 ptrtoint ([0 x i32 (...)*]* @_ZTVN10__cxxabiv117__class_type_infoE to i64), i64 16) to i8*), i8* getelementptr ([11 x i8]* @_ZTS9regwayobj, i32 0, i32 0) } }, align 16		; <%struct.__class_type_info_pseudo*> [#uses=1]
@_ZTVN10__cxxabiv117__class_type_infoE = external constant [0 x i32 (...)*]		; <[0 x i32 (...)*]*> [#uses=1]
@_ZTS9regwayobj = internal constant [11 x i8] c"9regwayobj\00"		; <[11 x i8]*> [#uses=1]
@cg_caller_id_var = weak global i32 1		; <i32*> [#uses=780]
@cg_caller_call_site_var = weak global i32 0		; <i32*> [#uses=649]

define internal fastcc i8 @_ZN6wayobj9createwayEiiiiRP8point16tRi(i32 %startx, i32 %starty, i32 %endx, i32 %endy, %struct.point16t** %wayar, i32* %waylength) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=7]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=7]
	store i32 1, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 1 )
	%deltaar.i = alloca [8 x %struct.point16t]		; <[8 x %struct.point16t]*> [#uses=20]
	%tmp2.i = icmp slt i32 %startx, 1		; <i1> [#uses=1]
	%tmp6.i = icmp slt i32 %starty, 1		; <i1> [#uses=1]
	%bothcond.i = or i1 %tmp6.i, %tmp2.i		; <i1> [#uses=1]
	br i1 %bothcond.i, label %cond_true21, label %cond_next11.i

cond_next11.i:		; preds = %entry
	%tmp14.i = load i32* @way.5, align 8		; <i32> [#uses=1]
	%tmp16.i = icmp slt i32 %tmp14.i, %startx		; <i1> [#uses=1]
	br i1 %tmp16.i, label %cond_true21, label %cond_next21.i

cond_next21.i:		; preds = %cond_next11.i
	%tmp25.i = load i32* @way.6, align 8		; <i32> [#uses=1]
	%phitmp23 = icmp slt i32 %tmp25.i, %starty		; <i1> [#uses=1]
	br i1 %phitmp23, label %cond_true21, label %cond_next

cond_next:		; preds = %cond_next21.i
	%tmp2.i10 = icmp slt i32 %endx, 1		; <i1> [#uses=1]
	%tmp6.i11 = icmp slt i32 %endy, 1		; <i1> [#uses=1]
	%bothcond.i12 = or i1 %tmp6.i11, %tmp2.i10		; <i1> [#uses=1]
	br i1 %bothcond.i12, label %cond_true21, label %cond_next11.i15

cond_next11.i15:		; preds = %cond_next
	%tmp14.i13 = load i32* @way.5, align 8		; <i32> [#uses=1]
	%tmp16.i14 = icmp slt i32 %tmp14.i13, %endx		; <i1> [#uses=1]
	br i1 %tmp16.i14, label %cond_true21, label %cond_next21.i19

cond_next21.i19:		; preds = %cond_next11.i15
	%tmp25.i16 = load i32* @way.6, align 8		; <i32> [#uses=1]
	%phitmp = icmp slt i32 %tmp25.i16, %endy		; <i1> [#uses=1]
	br i1 %phitmp, label %cond_true21, label %bb16

bb16:		; preds = %cond_next21.i19
	%tmp33 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp36 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%tmp38 = shl i32 %endy, %tmp36		; <i32> [#uses=1]
	%tmp40 = or i32 %tmp38, %endx		; <i32> [#uses=1]
	%tmp4041 = sext i32 %tmp40 to i64		; <i64> [#uses=1]
	%tmp42 = getelementptr i16* %tmp33, i64 %tmp4041		; <i16*> [#uses=1]
	%tmp46 = load i16* %tmp42, align 2		; <i16> [#uses=1]
	%tmp47 = icmp eq i16 %tmp46, 0		; <i1> [#uses=1]
	br i1 %tmp47, label %cond_next55, label %cond_true51

cond_true21:		; preds = %cond_next21.i19, %cond_next11.i15, %cond_next, %cond_next21.i, %cond_next11.i, %entry
	store %struct.point16t* null, %struct.point16t** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_true51:		; preds = %bb16
	store %struct.point16t* null, %struct.point16t** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_next55:		; preds = %bb16
	%tmp58 = icmp eq i32 %startx, %endx		; <i1> [#uses=1]
	%tmp62 = icmp eq i32 %starty, %endy		; <i1> [#uses=1]
	%tmp66 = and i1 %tmp62, %tmp58		; <i1> [#uses=1]
	br i1 %tmp66, label %cond_true69, label %cond_next75

cond_true69:		; preds = %cond_next55
	%tmp70 = malloc %struct.point16t		; <%struct.point16t*> [#uses=1]
	store %struct.point16t* %tmp70, %struct.point16t** %wayar, align 8
	store i32 1, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1

cond_next75:		; preds = %cond_next55
	%tmp5.i = load i16* @way.25, align 8		; <i16> [#uses=2]
	%tmp6.i4 = icmp eq i16 %tmp5.i, -1		; <i1> [#uses=1]
	br i1 %tmp6.i4, label %cond_true.i, label %cond_next.i

cond_true.i:		; preds = %cond_next75
	%tmp10.i = load i32* @way.0, align 32		; <i32> [#uses=1]
	%tmp11.i = shl i32 1, %tmp10.i		; <i32> [#uses=1]
	%tmp14.i5 = load i32* @way.1, align 8		; <i32> [#uses=1]
	%tmp15.i = shl i32 %tmp11.i, %tmp14.i5		; <i32> [#uses=1]
	%tmp1516.i = sext i32 %tmp15.i to i64		; <i64> [#uses=1]
	%tmp17.i = shl i64 %tmp1516.i, 2		; <i64> [#uses=1]
	%tmp20.i = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=1]
	%tmp2021.i = bitcast %struct.point16t* %tmp20.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 1, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memset.i64( i8* %tmp2021.i, i8 0, i64 %tmp17.i, i32 2 ) nounwind 
	store i16 0, i16* @way.25, align 8
	br label %cond_next.i

cond_next.i:		; preds = %cond_true.i, %cond_next75
	%tmp26.rle.i = phi i16 [ 0, %cond_true.i ], [ %tmp5.i, %cond_next75 ]		; <i16> [#uses=1]
	%tmp27.i = add i16 %tmp26.rle.i, 1		; <i16> [#uses=4]
	store i16 %tmp27.i, i16* @way.25, align 8
	%tmp32.i = load i32** @way.18, align 8		; <i32*> [#uses=3]
	%tmp40.i = load i32* @way.2, align 8		; <i32> [#uses=9]
	%tmp42.i = shl i32 %starty, %tmp40.i		; <i32> [#uses=1]
	%tmp44.i = or i32 %tmp42.i, %startx		; <i32> [#uses=6]
	store i32 %tmp44.i, i32* %tmp32.i, align 4
	%tmp50.i6 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=6]
	%tmp5758.i = sext i32 %tmp44.i to i64		; <i64> [#uses=2]
	%tmp63.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp5758.i, i32 0		; <i16*> [#uses=1]
	store i16 %tmp27.i, i16* %tmp63.i, align 2
	%tmp77.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp5758.i, i32 1		; <i16*> [#uses=1]
	store i16 0, i16* %tmp77.i, align 2
	store i1 false, i1* @way.22.b, align 1
	%tmp91.i = shl i32 %endy, %tmp40.i		; <i32> [#uses=1]
	%tmp93.i = or i32 %tmp91.i, %endx		; <i32> [#uses=4]
	store i32 %tmp93.i, i32* @way.23, align 8
	store i16 1, i16* @way.24, align 8
	%tmp110.i = load i32** @way.19, align 8		; <i32*> [#uses=2]
	br label %cond_next139.i

bb101.i:		; preds = %cond_next139.i
	%tmp104.i = icmp eq i8 %flodd.1.reg2mem.0.i, 0		; <i1> [#uses=1]
	br i1 %tmp104.i, label %cond_true107.i, label %cond_false.i8

cond_true107.i:		; preds = %bb101.i
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 1, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 31, i32* @cg_caller_id_var, align 4
	%tmp116.i = tail call fastcc i32 @_ZN6wayobj10makebound2EPiiS0_( i32* %tmp32.i, i32 %boundl.1.reg2mem.0.i, i32* %tmp110.i ) nounwind 		; <i32> [#uses=1]
	br label %bb133.i

cond_false.i8:		; preds = %bb101.i
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 1, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 31, i32* @cg_caller_id_var, align 4
	%tmp125.i = tail call fastcc i32 @_ZN6wayobj10makebound2EPiiS0_( i32* %tmp110.i, i32 %boundl.1.reg2mem.0.i, i32* %tmp32.i ) nounwind 		; <i32> [#uses=1]
	br label %bb133.i

bb133.i:		; preds = %cond_false.i8, %cond_true107.i
	%storemerge162.i = phi i8 [ 1, %cond_true107.i ], [ 0, %cond_false.i8 ]		; <i8> [#uses=1]
	%storemerge161.i = phi i32 [ %tmp116.i, %cond_true107.i ], [ %tmp125.i, %cond_false.i8 ]		; <i32> [#uses=2]
	%storemerge.i9 = add i16 %storemerge.in.i.rle24, 1		; <i16> [#uses=3]
	store i16 %storemerge.i9, i16* @way.24, align 2
	%tmp135.i = icmp eq i32 %storemerge161.i, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp135.i, label %_ZN6wayobj4fillEiiii.exit, label %cond_next139.i

cond_next139.i:		; preds = %bb133.i, %cond_next.i
	%storemerge.in.i.rle24 = phi i16 [ %storemerge.i9, %bb133.i ], [ 1, %cond_next.i ]		; <i16> [#uses=2]
	%flodd.1.reg2mem.0.i = phi i8 [ 0, %cond_next.i ], [ %storemerge162.i, %bb133.i ]		; <i8> [#uses=1]
	%boundl.1.reg2mem.0.i = phi i32 [ 1, %cond_next.i ], [ %storemerge161.i, %bb133.i ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 31, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 31 )
	%tmp142.i.b = load i1* @way.22.b, align 1		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp142.i.b, label %_ZN6wayobj4fillEiiii.exit, label %bb101.i

_ZN6wayobj4fillEiiii.exit:		; preds = %cond_next139.i, %bb133.i
	%tmp132.i.rle = phi i16 [ %storemerge.in.i.rle24, %cond_next139.i ], [ %storemerge.i9, %bb133.i ]		; <i16> [#uses=1]
	%tmp150.i.b = load i1* @way.22.b, align 1		; <i1> [#uses=1]
	br i1 %tmp150.i.b, label %cond_next90, label %cond_true86

cond_true86:		; preds = %_ZN6wayobj4fillEiiii.exit
	store %struct.point16t* null, %struct.point16t** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_next90:		; preds = %_ZN6wayobj4fillEiiii.exit
	%tmp22.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i32 0, i32 0		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp22.i, align 8
	%tmp25.i2 = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i32 0, i32 1		; <i16*> [#uses=1]
	store i16 1, i16* %tmp25.i2, align 2
	%tmp36.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 1, i32 0		; <i16*> [#uses=1]
	store i16 0, i16* %tmp36.i, align 2
	%tmp39.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 1, i32 1		; <i16*> [#uses=1]
	store i16 1, i16* %tmp39.i, align 2
	%tmp50.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 2, i32 0		; <i16*> [#uses=1]
	store i16 1, i16* %tmp50.i, align 2
	%tmp53.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 2, i32 1		; <i16*> [#uses=1]
	store i16 1, i16* %tmp53.i, align 2
	%tmp64.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 3, i32 0		; <i16*> [#uses=1]
	store i16 1, i16* %tmp64.i, align 2
	%tmp67.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 3, i32 1		; <i16*> [#uses=1]
	store i16 0, i16* %tmp67.i, align 2
	%tmp78.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 4, i32 0		; <i16*> [#uses=1]
	store i16 1, i16* %tmp78.i, align 2
	%tmp81.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 4, i32 1		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp81.i, align 2
	%tmp92.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 5, i32 0		; <i16*> [#uses=1]
	store i16 0, i16* %tmp92.i, align 2
	%tmp95.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 5, i32 1		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp95.i, align 2
	%tmp106.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 6, i32 0		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp106.i, align 2
	%tmp109.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 6, i32 1		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp109.i, align 2
	%tmp120.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 7, i32 0		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp120.i, align 2
	%tmp123.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 7, i32 1		; <i16*> [#uses=1]
	store i16 0, i16* %tmp123.i, align 2
	%tmp132133.i = sext i16 %tmp132.i.rle to i32		; <i32> [#uses=4]
	%tmp137.i = malloc %struct.point16t, i32 %tmp132133.i		; <%struct.point16t*> [#uses=1]
	store %struct.point16t* %tmp137.i, %struct.point16t** %wayar, align 8
	%tmp154.i = load i32* @way.21, align 8		; <i32> [#uses=5]
	%tmp156.i = and i32 %tmp154.i, %tmp44.i		; <i32> [#uses=1]
	%tmp168.i = ashr i32 %tmp44.i, %tmp40.i		; <i32> [#uses=1]
	%tmp173.i = add i32 %tmp132133.i, -2		; <i32> [#uses=2]
	%tmp564683.i = icmp sgt i32 %tmp173.i, 0		; <i1> [#uses=1]
	br i1 %tmp564683.i, label %bb174.i, label %bb567.i

bb174.i:		; preds = %bb562.i, %cond_next90
	%tmp592.i.rle55 = phi i32 [ %tmp592.i.rle50, %bb562.i ], [ %tmp154.i, %cond_next90 ]		; <i32> [#uses=9]
	%tmp577.i.rle44 = phi i32 [ %tmp577.i.rle39, %bb562.i ], [ %tmp40.i, %cond_next90 ]		; <i32> [#uses=9]
	%indvar.i = phi i32 [ %indvar.next.i, %bb562.i ], [ 0, %cond_next90 ]		; <i32> [#uses=2]
	%index.1.reg2mem.0.i = phi i32 [ %index.0.reg2mem.0.i, %bb562.i ], [ %tmp93.i, %cond_next90 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 32, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 32 )
	%i.0.reg2mem.0.i = sub i32 %tmp173.i, %indvar.i		; <i32> [#uses=5]
	%tmp184.i = and i32 %tmp154.i, %index.1.reg2mem.0.i		; <i32> [#uses=3]
	%tmp197.i = ashr i32 %index.1.reg2mem.0.i, %tmp40.i		; <i32> [#uses=3]
	%tmp203.i = sub i32 %tmp156.i, %tmp184.i		; <i32> [#uses=3]
	%tmp206.i = sub i32 %tmp168.i, %tmp197.i		; <i32> [#uses=3]
	%tmp208.i = icmp sgt i32 %tmp203.i, 0		; <i1> [#uses=1]
	br i1 %tmp208.i, label %cond_next215.i, label %cond_false.i

cond_false.i:		; preds = %bb174.i
	%tmp211.i = icmp slt i32 %tmp203.i, 0		; <i1> [#uses=1]
	br i1 %tmp211.i, label %cond_true214.i, label %cond_next215.i

cond_true214.i:		; preds = %cond_false.i
	br label %cond_next215.i

cond_next215.i:		; preds = %cond_true214.i, %cond_false.i, %bb174.i
	%dpx.0.i = phi i32 [ -1, %cond_true214.i ], [ 1, %bb174.i ], [ %tmp203.i, %cond_false.i ]		; <i32> [#uses=4]
	%tmp217.i = icmp sgt i32 %tmp206.i, 0		; <i1> [#uses=1]
	br i1 %tmp217.i, label %cond_next228.i, label %cond_false221.i

cond_false221.i:		; preds = %cond_next215.i
	%tmp223.i = icmp slt i32 %tmp206.i, 0		; <i1> [#uses=1]
	br i1 %tmp223.i, label %cond_true226.i, label %cond_next228.i

cond_true226.i:		; preds = %cond_false221.i
	br label %cond_next228.i

cond_next228.i:		; preds = %cond_true226.i, %cond_false221.i, %cond_next215.i
	%dpy.0.i = phi i32 [ -1, %cond_true226.i ], [ 1, %cond_next215.i ], [ %tmp206.i, %cond_false221.i ]		; <i32> [#uses=1]
	%tmp230.i = mul i32 %dpy.0.i, 100		; <i32> [#uses=4]
	%tmp233.i = mul i32 %dpx.0.i, 241		; <i32> [#uses=1]
	%tmp234.i = icmp slt i32 %tmp230.i, %tmp233.i		; <i1> [#uses=1]
	%a.0.i = select i1 %tmp234.i, i32 -1, i32 1		; <i32> [#uses=2]
	%tmp244.i = mul i32 %dpx.0.i, 41		; <i32> [#uses=1]
	%tmp245.i = icmp slt i32 %tmp230.i, %tmp244.i		; <i1> [#uses=1]
	%b.0.i = select i1 %tmp245.i, i32 -1, i32 1		; <i32> [#uses=2]
	%tmp255.i = mul i32 %dpx.0.i, -40		; <i32> [#uses=1]
	%tmp256.i = icmp slt i32 %tmp230.i, %tmp255.i		; <i1> [#uses=1]
	%c.0.i = select i1 %tmp256.i, i32 -1, i32 1		; <i32> [#uses=2]
	%tmp266.i = mul i32 %dpx.0.i, -240		; <i32> [#uses=1]
	%tmp267.i = icmp slt i32 %tmp230.i, %tmp266.i		; <i1> [#uses=1]
	%d.0.i = select i1 %tmp267.i, i32 -1, i32 1		; <i32> [#uses=2]
	%tmp274.i = icmp eq i32 %a.0.i, 1		; <i1> [#uses=2]
	%tmp277.i = icmp eq i32 %d.0.i, 1		; <i1> [#uses=2]
	%tmp281.i = and i1 %tmp274.i, %tmp277.i		; <i1> [#uses=1]
	br i1 %tmp281.i, label %bb549.i, label %cond_next285.i

cond_next285.i:		; preds = %cond_next228.i
	%tmp287.i = icmp eq i32 %b.0.i, 1		; <i1> [#uses=2]
	%tmp290.i = icmp eq i32 %a.0.i, -1		; <i1> [#uses=2]
	%tmp294.i = and i1 %tmp287.i, %tmp290.i		; <i1> [#uses=1]
	br i1 %tmp294.i, label %bb549.i, label %cond_next298.i

cond_next298.i:		; preds = %cond_next285.i
	%tmp300.i = icmp eq i32 %c.0.i, 1		; <i1> [#uses=2]
	%tmp303.i = icmp eq i32 %b.0.i, -1		; <i1> [#uses=2]
	%tmp307.i = and i1 %tmp300.i, %tmp303.i		; <i1> [#uses=1]
	br i1 %tmp307.i, label %bb549.i, label %cond_next311.i

cond_next311.i:		; preds = %cond_next298.i
	%tmp316.i = icmp eq i32 %c.0.i, -1		; <i1> [#uses=2]
	%tmp320.i = and i1 %tmp277.i, %tmp316.i		; <i1> [#uses=1]
	br i1 %tmp320.i, label %bb549.i, label %cond_next324.i

cond_next324.i:		; preds = %cond_next311.i
	%tmp329.i = icmp eq i32 %d.0.i, -1		; <i1> [#uses=2]
	%tmp333.i = and i1 %tmp290.i, %tmp329.i		; <i1> [#uses=1]
	br i1 %tmp333.i, label %bb549.i, label %cond_next337.i

cond_next337.i:		; preds = %cond_next324.i
	%tmp346.i = and i1 %tmp274.i, %tmp303.i		; <i1> [#uses=1]
	br i1 %tmp346.i, label %bb549.i, label %cond_next350.i

cond_next350.i:		; preds = %cond_next337.i
	%tmp359.i = and i1 %tmp287.i, %tmp316.i		; <i1> [#uses=1]
	br i1 %tmp359.i, label %bb549.i, label %cond_next363.i

cond_next363.i:		; preds = %cond_next350.i
	%tmp372.i = and i1 %tmp300.i, %tmp329.i		; <i1> [#uses=1]
	br i1 %tmp372.i, label %bb549.i, label %bb381.i

bb381.i:		; preds = %bb549.i, %cond_next363.i
	%tmp592.i.rle50 = phi i32 [ %tmp592.i.rle51, %bb549.i ], [ %tmp592.i.rle55, %cond_next363.i ]		; <i32> [#uses=2]
	%tmp577.i.rle39 = phi i32 [ %tmp577.i.rle40, %bb549.i ], [ %tmp577.i.rle44, %cond_next363.i ]		; <i32> [#uses=2]
	%delta1num.0.reg2mem.0.i = phi i32 [ 6, %cond_next363.i ], [ %delta1num.0.i, %bb549.i ]		; <i32> [#uses=2]
	%delta2num.0.in.in.reg2mem.0.i = phi i32 [ 7, %cond_next363.i ], [ %delta2num.0.in.in.i, %bb549.i ]		; <i32> [#uses=2]
	%j.0.reg2mem.0.i = phi i32 [ 0, %cond_next363.i ], [ %j.0.i, %bb549.i ]		; <i32> [#uses=1]
	%tmp382383.i = sext i32 %delta1num.0.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp385.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 %tmp382383.i, i32 0		; <i16*> [#uses=1]
	%tmp386.i = load i16* %tmp385.i, align 2		; <i16> [#uses=1]
	%tmp386387.i = sext i16 %tmp386.i to i32		; <i32> [#uses=1]
	%tmp389.i = add i32 %tmp386387.i, %tmp184.i		; <i32> [#uses=2]
	%tmp393.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 %tmp382383.i, i32 1		; <i16*> [#uses=1]
	%tmp394.i = load i16* %tmp393.i, align 2		; <i16> [#uses=1]
	%tmp394395.i = sext i16 %tmp394.i to i32		; <i32> [#uses=1]
	%tmp397.i = add i32 %tmp394395.i, %tmp197.i		; <i32> [#uses=2]
	%tmp409.i = shl i32 %tmp397.i, %tmp40.i		; <i32> [#uses=1]
	%tmp411.i = or i32 %tmp409.i, %tmp389.i		; <i32> [#uses=2]
	%tmp416417.i = sext i32 %tmp411.i to i64		; <i64> [#uses=2]
	%tmp419.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp416417.i, i32 0		; <i16*> [#uses=1]
	%tmp420.i = load i16* %tmp419.i, align 2		; <i16> [#uses=1]
	%tmp424.i = icmp eq i16 %tmp420.i, %tmp27.i		; <i1> [#uses=1]
	br i1 %tmp424.i, label %cond_true427.i, label %cond_next458.i

cond_true427.i:		; preds = %bb381.i
	%tmp432.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp416417.i, i32 1		; <i16*> [#uses=1]
	%tmp433.i = load i16* %tmp432.i, align 2		; <i16> [#uses=1]
	%tmp433434.i = zext i16 %tmp433.i to i32		; <i32> [#uses=1]
	%tmp436.i = icmp eq i32 %tmp433434.i, %i.0.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp436.i, label %cond_true439.i, label %cond_next458.i

cond_true439.i:		; preds = %cond_true427.i
	%tmp441.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=1]
	%tmp442443.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp445446.i = trunc i32 %tmp389.i to i16		; <i16> [#uses=1]
	%tmp447.i = getelementptr %struct.point16t* %tmp441.i, i64 %tmp442443.i, i32 0		; <i16*> [#uses=1]
	store i16 %tmp445446.i, i16* %tmp447.i, align 2
	%tmp449.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=1]
	%tmp453454.i = trunc i32 %tmp397.i to i16		; <i16> [#uses=1]
	%tmp455.i = getelementptr %struct.point16t* %tmp449.i, i64 %tmp442443.i, i32 1		; <i16*> [#uses=1]
	store i16 %tmp453454.i, i16* %tmp455.i, align 2
	br label %bb562.i

cond_next458.i:		; preds = %cond_true427.i, %bb381.i
	%tmp459460671.i = zext i32 %delta2num.0.in.in.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp462.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 %tmp459460671.i, i32 0		; <i16*> [#uses=1]
	%tmp463.i = load i16* %tmp462.i, align 2		; <i16> [#uses=1]
	%tmp463464.i = sext i16 %tmp463.i to i32		; <i32> [#uses=1]
	%tmp466.i = add i32 %tmp463464.i, %tmp184.i		; <i32> [#uses=2]
	%tmp470.i = getelementptr [8 x %struct.point16t]* %deltaar.i, i32 0, i64 %tmp459460671.i, i32 1		; <i16*> [#uses=1]
	%tmp471.i = load i16* %tmp470.i, align 2		; <i16> [#uses=1]
	%tmp471472.i = sext i16 %tmp471.i to i32		; <i32> [#uses=1]
	%tmp474.i = add i32 %tmp471472.i, %tmp197.i		; <i32> [#uses=2]
	%tmp486.i = shl i32 %tmp474.i, %tmp40.i		; <i32> [#uses=1]
	%tmp488.i = or i32 %tmp486.i, %tmp466.i		; <i32> [#uses=2]
	%tmp493494.i = sext i32 %tmp488.i to i64		; <i64> [#uses=2]
	%tmp496.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp493494.i, i32 0		; <i16*> [#uses=1]
	%tmp497.i = load i16* %tmp496.i, align 2		; <i16> [#uses=1]
	%tmp501.i = icmp eq i16 %tmp497.i, %tmp27.i		; <i1> [#uses=1]
	br i1 %tmp501.i, label %cond_true504.i, label %cond_next535.i

cond_true504.i:		; preds = %cond_next458.i
	%tmp509.i = getelementptr %struct.point16t* %tmp50.i6, i64 %tmp493494.i, i32 1		; <i16*> [#uses=1]
	%tmp510.i = load i16* %tmp509.i, align 2		; <i16> [#uses=1]
	%tmp510511.i = zext i16 %tmp510.i to i32		; <i32> [#uses=1]
	%tmp513.i = icmp eq i32 %tmp510511.i, %i.0.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp513.i, label %cond_true516.i, label %cond_next535.i

cond_true516.i:		; preds = %cond_true504.i
	%tmp518.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=1]
	%tmp519520.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp522523.i = trunc i32 %tmp466.i to i16		; <i16> [#uses=1]
	%tmp524.i = getelementptr %struct.point16t* %tmp518.i, i64 %tmp519520.i, i32 0		; <i16*> [#uses=1]
	store i16 %tmp522523.i, i16* %tmp524.i, align 2
	%tmp526.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=1]
	%tmp530531.i = trunc i32 %tmp474.i to i16		; <i16> [#uses=1]
	%tmp532.i = getelementptr %struct.point16t* %tmp526.i, i64 %tmp519520.i, i32 1		; <i16*> [#uses=1]
	store i16 %tmp530531.i, i16* %tmp532.i, align 2
	br label %bb562.i

cond_next535.i:		; preds = %cond_true504.i, %cond_next458.i
	%tmp537.i = add i32 %delta1num.0.reg2mem.0.i, -1		; <i32> [#uses=2]
	%tmp539.i = icmp slt i32 %tmp537.i, 0		; <i1> [#uses=1]
	%delta1num.1.i = select i1 %tmp539.i, i32 7, i32 %tmp537.i		; <i32> [#uses=1]
	%tmp548.i = add i32 %j.0.reg2mem.0.i, 1		; <i32> [#uses=1]
	%phitmp.i = add i32 %delta2num.0.in.in.reg2mem.0.i, 1		; <i32> [#uses=1]
	%phitmp672.i = and i32 %phitmp.i, 7		; <i32> [#uses=1]
	br label %bb549.i

bb549.i:		; preds = %cond_next535.i, %cond_next363.i, %cond_next350.i, %cond_next337.i, %cond_next324.i, %cond_next311.i, %cond_next298.i, %cond_next285.i, %cond_next228.i
	%tmp592.i.rle51 = phi i32 [ %tmp592.i.rle50, %cond_next535.i ], [ %tmp592.i.rle55, %cond_next363.i ], [ %tmp592.i.rle55, %cond_next350.i ], [ %tmp592.i.rle55, %cond_next337.i ], [ %tmp592.i.rle55, %cond_next324.i ], [ %tmp592.i.rle55, %cond_next311.i ], [ %tmp592.i.rle55, %cond_next298.i ], [ %tmp592.i.rle55, %cond_next285.i ], [ %tmp592.i.rle55, %cond_next228.i ]		; <i32> [#uses=1]
	%tmp577.i.rle40 = phi i32 [ %tmp577.i.rle39, %cond_next535.i ], [ %tmp577.i.rle44, %cond_next363.i ], [ %tmp577.i.rle44, %cond_next350.i ], [ %tmp577.i.rle44, %cond_next337.i ], [ %tmp577.i.rle44, %cond_next324.i ], [ %tmp577.i.rle44, %cond_next311.i ], [ %tmp577.i.rle44, %cond_next298.i ], [ %tmp577.i.rle44, %cond_next285.i ], [ %tmp577.i.rle44, %cond_next228.i ]		; <i32> [#uses=1]
	%delta1num.0.i = phi i32 [ %delta1num.1.i, %cond_next535.i ], [ 1, %cond_next228.i ], [ 2, %cond_next285.i ], [ 3, %cond_next298.i ], [ 4, %cond_next311.i ], [ 5, %cond_next324.i ], [ 6, %cond_next337.i ], [ 7, %cond_next350.i ], [ 0, %cond_next363.i ]		; <i32> [#uses=1]
	%delta2num.0.in.in.i = phi i32 [ %phitmp672.i, %cond_next535.i ], [ 2, %cond_next228.i ], [ 3, %cond_next285.i ], [ 4, %cond_next298.i ], [ 5, %cond_next311.i ], [ 6, %cond_next324.i ], [ 7, %cond_next337.i ], [ 0, %cond_next350.i ], [ 1, %cond_next363.i ]		; <i32> [#uses=1]
	%j.0.i = phi i32 [ %tmp548.i, %cond_next535.i ], [ 0, %cond_next228.i ], [ 0, %cond_next285.i ], [ 0, %cond_next298.i ], [ 0, %cond_next311.i ], [ 0, %cond_next324.i ], [ 0, %cond_next337.i ], [ 0, %cond_next350.i ], [ 0, %cond_next363.i ]		; <i32> [#uses=2]
	%tmp551.i = icmp slt i32 %j.0.i, 4		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp551.i, label %bb381.i, label %bb554.i

bb554.i:		; preds = %bb549.i
	%tmp556.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=1]
	free %struct.point16t* %tmp556.i
	store %struct.point16t* null, %struct.point16t** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

bb562.i:		; preds = %cond_true516.i, %cond_true439.i
	%index.0.reg2mem.0.i = phi i32 [ %tmp488.i, %cond_true516.i ], [ %tmp411.i, %cond_true439.i ]		; <i32> [#uses=1]
	%storemerge.i = add i32 %i.0.reg2mem.0.i, -1		; <i32> [#uses=1]
	%tmp564.i = icmp sgt i32 %storemerge.i, 0		; <i1> [#uses=1]
	%indvar.next.i = add i32 %indvar.i, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp564.i, label %bb174.i, label %bb567.i

bb567.i:		; preds = %bb562.i, %cond_next90
	%tmp569.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=2]
	%tmp579.i = ashr i32 %tmp44.i, %tmp40.i		; <i32> [#uses=1]
	%tmp594.i = and i32 %tmp154.i, %tmp44.i		; <i32> [#uses=1]
	%tmp597598599602.i = trunc i32 %tmp594.i to i16		; <i16> [#uses=1]
	%tmp582583584603.i = trunc i32 %tmp579.i to i16		; <i16> [#uses=1]
	%tmp609.i = getelementptr %struct.point16t* %tmp569.i, i32 0, i32 0		; <i16*> [#uses=1]
	store i16 %tmp597598599602.i, i16* %tmp609.i, align 2
	%tmp612.i = getelementptr %struct.point16t* %tmp569.i, i32 0, i32 1		; <i16*> [#uses=1]
	store i16 %tmp582583584603.i, i16* %tmp612.i, align 2
	%tmp616.i = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=2]
	%tmp618.i = add i32 %tmp132133.i, -1		; <i32> [#uses=1]
	%tmp628.i = ashr i32 %tmp93.i, %tmp40.i		; <i32> [#uses=1]
	%tmp643.i = and i32 %tmp154.i, %tmp93.i		; <i32> [#uses=1]
	%tmp646647648651.i = trunc i32 %tmp643.i to i16		; <i16> [#uses=1]
	%tmp631632633652.i = trunc i32 %tmp628.i to i16		; <i16> [#uses=1]
	%tmp618657.i = sext i32 %tmp618.i to i64		; <i64> [#uses=2]
	%tmp659.i = getelementptr %struct.point16t* %tmp616.i, i64 %tmp618657.i, i32 0		; <i16*> [#uses=1]
	store i16 %tmp646647648651.i, i16* %tmp659.i, align 2
	%tmp662.i = getelementptr %struct.point16t* %tmp616.i, i64 %tmp618657.i, i32 1		; <i16*> [#uses=1]
	store i16 %tmp631632633652.i, i16* %tmp662.i, align 2
	store i32 %tmp132133.i, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1
}

declare i8* @_Znam(i64)

declare void @_ZdaPv(i8*) nounwind 

define internal fastcc i8 @_ZN6wayobj13findfreepointEiiRiS0_(i32 %startx, i32 %starty, i32* %freepointx, i32* %freepointy) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 2, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 2 )
	%tmp12 = icmp slt i32 %startx, 1		; <i1> [#uses=1]
	%tmp16 = icmp slt i32 %starty, 1		; <i1> [#uses=1]
	%bothcond = or i1 %tmp16, %tmp12		; <i1> [#uses=1]
	br i1 %bothcond, label %cond_true49, label %cond_next21

cond_next21:		; preds = %entry
	%tmp24 = load i32* @way.5, align 8		; <i32> [#uses=1]
	%tmp26 = icmp slt i32 %tmp24, %startx		; <i1> [#uses=1]
	br i1 %tmp26, label %cond_true49, label %cond_next31

cond_next31:		; preds = %cond_next21
	%tmp34 = load i32* @way.6, align 8		; <i32> [#uses=1]
	%tmp36 = icmp slt i32 %tmp34, %starty		; <i1> [#uses=1]
	br i1 %tmp36, label %cond_true49, label %cond_next41

cond_next41:		; preds = %cond_next31
	%tmp65 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp68 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%tmp70 = shl i32 %starty, %tmp68		; <i32> [#uses=1]
	%tmp72 = or i32 %tmp70, %startx		; <i32> [#uses=1]
	%tmp7273 = sext i32 %tmp72 to i64		; <i64> [#uses=1]
	%tmp74 = getelementptr i16* %tmp65, i64 %tmp7273		; <i16*> [#uses=1]
	%tmp78 = load i16* %tmp74, align 2		; <i16> [#uses=1]
	%tmp79 = icmp eq i16 %tmp78, 0		; <i1> [#uses=1]
	br i1 %tmp79, label %cond_true83, label %cond_next89

cond_true49:		; preds = %cond_next31, %cond_next21, %entry
	store i32 %startx, i32* %freepointx, align 4
	store i32 %starty, i32* %freepointy, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1

cond_true83:		; preds = %cond_next41
	store i32 %startx, i32* %freepointx, align 4
	store i32 %starty, i32* %freepointy, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1

cond_next89:		; preds = %cond_next41
	%tmp92 = load i16* @way.25, align 8		; <i16> [#uses=2]
	%tmp93 = icmp eq i16 %tmp92, -1		; <i1> [#uses=1]
	br i1 %tmp93, label %cond_true96, label %cond_next113

cond_true96:		; preds = %cond_next89
	%tmp99 = load i32* @way.0, align 32		; <i32> [#uses=1]
	%tmp100 = shl i32 1, %tmp99		; <i32> [#uses=1]
	%tmp103 = load i32* @way.1, align 8		; <i32> [#uses=1]
	%tmp104 = shl i32 %tmp100, %tmp103		; <i32> [#uses=1]
	%tmp104105 = sext i32 %tmp104 to i64		; <i64> [#uses=1]
	%tmp106 = shl i64 %tmp104105, 2		; <i64> [#uses=1]
	%tmp109 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=1]
	%tmp109110 = bitcast %struct.point16t* %tmp109 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memset.i64( i8* %tmp109110, i8 0, i64 %tmp106, i32 2 )
	store i16 0, i16* @way.25, align 8
	br label %cond_next113

cond_next113:		; preds = %cond_true96, %cond_next89
	%tmp116.rle = phi i16 [ 0, %cond_true96 ], [ %tmp92, %cond_next89 ]		; <i16> [#uses=1]
	%tmp117 = add i16 %tmp116.rle, 1		; <i16> [#uses=2]
	store i16 %tmp117, i16* @way.25, align 8
	%tmp122 = load i32** @way.18, align 8		; <i32*> [#uses=3]
	%tmp132 = load i32* @way.2, align 8		; <i32> [#uses=2]
	%tmp134 = shl i32 %starty, %tmp132		; <i32> [#uses=1]
	%tmp136 = or i32 %tmp134, %startx		; <i32> [#uses=2]
	store i32 %tmp136, i32* %tmp122, align 4
	%tmp143 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=2]
	%tmp150151 = sext i32 %tmp136 to i64		; <i64> [#uses=2]
	%tmp156 = getelementptr %struct.point16t* %tmp143, i64 %tmp150151, i32 0		; <i16*> [#uses=1]
	store i16 %tmp117, i16* %tmp156, align 2
	%tmp169 = getelementptr %struct.point16t* %tmp143, i64 %tmp150151, i32 1		; <i16*> [#uses=1]
	store i16 0, i16* %tmp169, align 2
	store i1 false, i1* @way.22.b, align 1
	store i16 1, i16* @way.24, align 8
	%tmp183 = load i32** @way.19, align 8		; <i32*> [#uses=2]
	br label %cond_next212

bb174:		; preds = %cond_next212
	%tmp177 = icmp eq i8 %flodd.1.reg2mem.0, 0		; <i1> [#uses=1]
	br i1 %tmp177, label %cond_true180, label %cond_false

cond_true180:		; preds = %bb174
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 33, i32* @cg_caller_id_var, align 4
	%tmp189 = tail call fastcc i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_( i32* %tmp122, i32 %boundl.1.reg2mem.0, i32* %tmp183 ) nounwind 		; <i32> [#uses=1]
	br label %bb206

cond_false:		; preds = %bb174
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 2, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 33, i32* @cg_caller_id_var, align 4
	%tmp198 = tail call fastcc i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_( i32* %tmp183, i32 %boundl.1.reg2mem.0, i32* %tmp122 ) nounwind 		; <i32> [#uses=1]
	br label %bb206

bb206:		; preds = %cond_false, %cond_true180
	%storemerge266 = phi i8 [ 1, %cond_true180 ], [ 0, %cond_false ]		; <i8> [#uses=1]
	%storemerge265 = phi i32 [ %tmp189, %cond_true180 ], [ %tmp198, %cond_false ]		; <i32> [#uses=2]
	%storemerge = add i16 %storemerge.in.rle1, 1		; <i16> [#uses=2]
	store i16 %storemerge, i16* @way.24, align 2
	%tmp208 = icmp eq i32 %storemerge265, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp208, label %bb220, label %cond_next212

cond_next212:		; preds = %bb206, %cond_next113
	%storemerge.in.rle1 = phi i16 [ %storemerge, %bb206 ], [ 1, %cond_next113 ]		; <i16> [#uses=1]
	%flodd.1.reg2mem.0 = phi i8 [ 0, %cond_next113 ], [ %storemerge266, %bb206 ]		; <i8> [#uses=1]
	%boundl.1.reg2mem.0 = phi i32 [ 1, %cond_next113 ], [ %storemerge265, %bb206 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 33, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 33 )
	%tmp215.b = load i1* @way.22.b, align 1		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp215.b, label %bb220, label %bb174

bb220:		; preds = %cond_next212, %bb206
	%tmp223 = load i32* @way.23, align 8		; <i32> [#uses=2]
	%tmp229 = load i32* @way.21, align 8		; <i32> [#uses=1]
	%tmp231 = and i32 %tmp229, %tmp223		; <i32> [#uses=1]
	store i32 %tmp231, i32* %freepointx, align 4
	%tmp247 = ashr i32 %tmp223, %tmp132		; <i32> [#uses=1]
	store i32 %tmp247, i32* %freepointy, align 4
	%tmp254.b = load i1* @way.22.b, align 1		; <i1> [#uses=1]
	%tmp254 = zext i1 %tmp254.b to i8		; <i8> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 %tmp254
}

declare void @llvm.memcpy.i64(i8*, i8*, i64, i32) nounwind 

define internal fastcc void @_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii(%struct.regboundobj* %this, %struct.boundart* %barp, i32 %x, i32 %y) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 3, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 3 )
	%tmp8 = getelementptr %struct.regboundobj* %this, i32 0, i32 15		; <%struct.regmngobj**> [#uses=1]
	%tmp9 = load %struct.regmngobj** %tmp8, align 8		; <%struct.regmngobj*> [#uses=1]
	%tmp18 = getelementptr %struct.regboundobj* %this, i32 0, i32 10		; <i8**> [#uses=1]
	%tmp19 = load i8** %tmp18, align 8		; <i8*> [#uses=1]
	%tmp21 = getelementptr %struct.regboundobj* %this, i32 0, i32 11		; <i32*> [#uses=2]
	%tmp22 = load i32* %tmp21, align 8		; <i32> [#uses=1]
	%tmp24 = mul i32 %tmp22, %y		; <i32> [#uses=1]
	%tmp26 = add i32 %tmp24, %x		; <i32> [#uses=1]
	%tmp2627 = sext i32 %tmp26 to i64		; <i64> [#uses=2]
	%tmp28 = getelementptr i8* %tmp19, i64 %tmp2627		; <i8*> [#uses=1]
	%tmp29 = load i8* %tmp28, align 1		; <i8> [#uses=1]
	%tmp32333436 = zext i8 %tmp29 to i64		; <i64> [#uses=1]
	%tmp37 = getelementptr %struct.regmngobj* %tmp9, i32 0, i32 8, i64 %tmp32333436		; <i8*> [#uses=1]
	%tmp38 = load i8* %tmp37, align 1		; <i8> [#uses=1]
	%toBool = icmp eq i8 %tmp38, 0		; <i1> [#uses=1]
	br i1 %toBool, label %cond_false, label %cond_true

cond_true:		; preds = %entry
	%tmp41 = getelementptr %struct.regboundobj* %this, i32 0, i32 5		; <i32*> [#uses=1]
	%tmp42 = load i32* %tmp41, align 8		; <i32> [#uses=1]
	%tmp44 = sub i32 %x, %tmp42		; <i32> [#uses=2]
	%tmp49 = mul i32 %tmp44, %tmp44		; <i32> [#uses=1]
	%tmp53 = getelementptr %struct.regboundobj* %this, i32 0, i32 6		; <i32*> [#uses=1]
	%tmp54 = load i32* %tmp53, align 8		; <i32> [#uses=1]
	%tmp56 = sub i32 %y, %tmp54		; <i32> [#uses=2]
	%tmp61 = mul i32 %tmp56, %tmp56		; <i32> [#uses=1]
	%tmp66 = add i32 %tmp61, %tmp49		; <i32> [#uses=1]
	%tmp6667 = sitofp i32 %tmp66 to float		; <float> [#uses=1]
	%tmp71 = add float %tmp6667, 5.000000e-01		; <float> [#uses=1]
	%tmp7172 = fptosi float %tmp71 to i32		; <i32> [#uses=1]
	%tmp76 = getelementptr %struct.regboundobj* %this, i32 0, i32 8		; <i32*> [#uses=1]
	%tmp77 = load i32* %tmp76, align 8		; <i32> [#uses=1]
	%tmp79 = icmp sgt i32 %tmp7172, %tmp77		; <i1> [#uses=1]
	br i1 %tmp79, label %UnifiedReturnBlock, label %cond_true83

cond_true83:		; preds = %cond_true
	%tmp94 = getelementptr %struct.boundart* %barp, i32 0, i32 1		; <i32*> [#uses=4]
	%tmp95 = load i32* %tmp94, align 8		; <i32> [#uses=1]
	%tmp97 = getelementptr %struct.boundart* %barp, i32 0, i32 2		; <i32*> [#uses=2]
	%tmp98 = load i32* %tmp97, align 8		; <i32> [#uses=3]
	%tmp99 = icmp eq i32 %tmp95, %tmp98		; <i1> [#uses=1]
	br i1 %tmp99, label %cond_true102, label %cond_next147

cond_true102:		; preds = %cond_true83
	%tmp109 = shl i32 %tmp98, 1		; <i32> [#uses=2]
	%tmp117 = malloc %struct.pointt, i32 %tmp109		; <%struct.pointt*> [#uses=2]
	%tmpcast = bitcast %struct.pointt* %tmp117 to i8*		; <i8*> [#uses=1]
	%tmp127128 = sext i32 %tmp98 to i64		; <i64> [#uses=1]
	%tmp129 = shl i64 %tmp127128, 3		; <i64> [#uses=1]
	%tmp131 = getelementptr %struct.boundart* %barp, i32 0, i32 0		; <%struct.pointt**> [#uses=3]
	%tmp132 = load %struct.pointt** %tmp131, align 8		; <%struct.pointt*> [#uses=1]
	%tmp132135 = bitcast %struct.pointt* %tmp132 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 3, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp132135, i64 %tmp129, i32 4 )
	%tmp138 = load %struct.pointt** %tmp131, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp138
	store %struct.pointt* %tmp117, %struct.pointt** %tmp131, align 8
	store i32 %tmp109, i32* %tmp97, align 8
	br label %cond_next147

cond_next147:		; preds = %cond_true102, %cond_true83
	%tmp149 = getelementptr %struct.boundart* %barp, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp150 = load %struct.pointt** %tmp149, align 8		; <%struct.pointt*> [#uses=2]
	%tmp153 = load i32* %tmp94, align 8		; <i32> [#uses=1]
	%tmp153161 = sext i32 %tmp153 to i64		; <i64> [#uses=2]
	%tmp163 = getelementptr %struct.pointt* %tmp150, i64 %tmp153161, i32 0		; <i32*> [#uses=1]
	store i32 %x, i32* %tmp163, align 4
	%tmp166 = getelementptr %struct.pointt* %tmp150, i64 %tmp153161, i32 1		; <i32*> [#uses=1]
	store i32 %y, i32* %tmp166, align 4
	%tmp171 = load i32* %tmp94, align 8		; <i32> [#uses=1]
	%tmp172 = add i32 %tmp171, 1		; <i32> [#uses=1]
	store i32 %tmp172, i32* %tmp94, align 8
	%tmp176 = getelementptr %struct.regboundobj* %this, i32 0, i32 4		; <%struct.regobj**> [#uses=2]
	%tmp177 = load %struct.regobj** %tmp176, align 8		; <%struct.regobj*> [#uses=1]
	%tmp186 = getelementptr %struct.regboundobj* %this, i32 0, i32 9		; <%struct.regobj***> [#uses=1]
	%tmp187 = load %struct.regobj*** %tmp186, align 8		; <%struct.regobj**> [#uses=1]
	%tmp190 = load i32* %tmp21, align 8		; <i32> [#uses=1]
	%tmp192 = mul i32 %tmp190, %y		; <i32> [#uses=1]
	%tmp194 = add i32 %tmp192, %x		; <i32> [#uses=1]
	%tmp194195 = sext i32 %tmp194 to i64		; <i64> [#uses=1]
	%tmp196 = getelementptr %struct.regobj** %tmp187, i64 %tmp194195		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp177, %struct.regobj** %tmp196, align 8
	%tmp202 = load %struct.regobj** %tmp176, align 8		; <%struct.regobj*> [#uses=1]
	%tmp203 = getelementptr %struct.regobj* %tmp202, i32 0, i32 4		; <i32*> [#uses=2]
	%tmp204 = load i32* %tmp203, align 8		; <i32> [#uses=1]
	%tmp205 = add i32 %tmp204, 1		; <i32> [#uses=1]
	store i32 %tmp205, i32* %tmp203, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void

cond_false:		; preds = %entry
	%tmp216 = getelementptr %struct.regboundobj* %this, i32 0, i32 9		; <%struct.regobj***> [#uses=1]
	%tmp217 = load %struct.regobj*** %tmp216, align 8		; <%struct.regobj**> [#uses=1]
	%tmp226 = getelementptr %struct.regobj** %tmp217, i64 %tmp2627		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* null, %struct.regobj** %tmp226, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void

UnifiedReturnBlock:		; preds = %cond_true
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_(%struct.regboundobj* %this, %struct.boundart* %b1arp, %struct.boundart* %b2arp) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 4, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 4 )
	%tmp8 = getelementptr %struct.boundart* %b2arp, i32 0, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp8, align 8
	%tmp168180 = getelementptr %struct.boundart* %b1arp, i32 0, i32 1		; <i32*> [#uses=2]
	%tmp169181 = load i32* %tmp168180, align 8		; <i32> [#uses=1]
	%tmp171183 = icmp sgt i32 %tmp169181, 0		; <i1> [#uses=1]
	br i1 %tmp171183, label %bb.preheader, label %return

bb.preheader:		; preds = %entry
	%tmp14 = getelementptr %struct.boundart* %b1arp, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp86 = getelementptr %struct.regboundobj* %this, i32 0, i32 13		; <i32*> [#uses=1]
	%tmp98 = getelementptr %struct.regboundobj* %this, i32 0, i32 14		; <i32*> [#uses=1]
	%tmp121 = getelementptr %struct.regboundobj* %this, i32 0, i32 9		; <%struct.regobj***> [#uses=1]
	%tmp124 = getelementptr %struct.regboundobj* %this, i32 0, i32 11		; <i32*> [#uses=1]
	br label %bb

bb:		; preds = %bb166, %bb.preheader
	%j.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp165, %bb166 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 34, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 34 )
	%tmp15 = load %struct.pointt** %tmp14, align 8		; <%struct.pointt*> [#uses=2]
	%tmp1617 = sext i32 %j.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp22 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 0		; <i32*> [#uses=1]
	%tmp23 = load i32* %tmp22, align 4		; <i32> [#uses=2]
	%tmp24 = add i32 %tmp23, -1		; <i32> [#uses=2]
	%tmp39 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 1		; <i32*> [#uses=1]
	%tmp40 = load i32* %tmp39, align 4		; <i32> [#uses=2]
	%tmp41 = add i32 %tmp40, -1		; <i32> [#uses=2]
	%tmp58 = add i32 %tmp23, 1		; <i32> [#uses=2]
	%tmp75 = add i32 %tmp40, 1		; <i32> [#uses=2]
	%tmp77 = icmp slt i32 %tmp24, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp77, i32 0, i32 %tmp24		; <i32> [#uses=2]
	%tmp80 = icmp slt i32 %tmp41, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp80, i32 0, i32 %tmp41		; <i32> [#uses=3]
	%tmp87 = load i32* %tmp86, align 8		; <i32> [#uses=2]
	%tmp89 = icmp slt i32 %tmp87, %tmp58		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp89, i32 %tmp87, i32 %tmp58		; <i32> [#uses=2]
	%tmp99 = load i32* %tmp98, align 8		; <i32> [#uses=3]
	%tmp101 = icmp slt i32 %tmp99, %tmp75		; <i1> [#uses=1]
	br i1 %tmp101, label %cond_true104, label %bb157

cond_true104:		; preds = %bb
	%tmp160190 = icmp sgt i32 %y1.0, %tmp99		; <i1> [#uses=1]
	br i1 %tmp160190, label %bb166, label %bb148.preheader

bb148.preheader:		; preds = %bb157, %cond_true104
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp99, %cond_true104 ], [ %y2.0, %bb157 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true104 ], [ %y.0, %bb157 ]		; <i32> [#uses=3]
	%tmp151192 = icmp sgt i32 %x1.0, %x2.0		; <i1> [#uses=1]
	br i1 %tmp151192, label %bb154, label %bb112

bb112:		; preds = %cond_next145, %bb148.preheader
	%indvar = phi i32 [ %indvar.next, %cond_next145 ], [ 0, %bb148.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 35, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 35 )
	%x.0191 = add i32 %indvar, %x1.0		; <i32> [#uses=3]
	%tmp122 = load %struct.regobj*** %tmp121, align 8		; <%struct.regobj**> [#uses=1]
	%tmp125 = load i32* %tmp124, align 8		; <i32> [#uses=1]
	%tmp127 = mul i32 %tmp125, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp129 = add i32 %tmp127, %x.0191		; <i32> [#uses=1]
	%tmp129130 = sext i32 %tmp129 to i64		; <i64> [#uses=1]
	%tmp131 = getelementptr %struct.regobj** %tmp122, i64 %tmp129130		; <%struct.regobj**> [#uses=1]
	%tmp135 = load %struct.regobj** %tmp131, align 8		; <%struct.regobj*> [#uses=1]
	%tmp136 = icmp eq %struct.regobj* %tmp135, null		; <i1> [#uses=1]
	br i1 %tmp136, label %cond_true140, label %cond_next145

cond_true140:		; preds = %bb112
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 4, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 34, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 35, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii( %struct.regboundobj* %this, %struct.boundart* %b2arp, i32 %x.0191, i32 %y.0.reg2mem.0.ph )
	br label %cond_next145

cond_next145:		; preds = %cond_true140, %bb112
	%tmp147 = add i32 %x.0191, 1		; <i32> [#uses=1]
	%tmp151 = icmp sgt i32 %tmp147, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp151, label %bb154, label %bb112

bb154:		; preds = %cond_next145, %bb148.preheader
	%tmp156 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb157

bb157:		; preds = %bb154, %bb
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb154 ], [ %tmp75, %bb ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp156, %bb154 ], [ %y1.0, %bb ]		; <i32> [#uses=2]
	%tmp160 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp160, label %bb166, label %bb148.preheader

bb166:		; preds = %bb157, %cond_true104
	%tmp165 = add i32 %j.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp169 = load i32* %tmp168180, align 8		; <i32> [#uses=1]
	%tmp171 = icmp sgt i32 %tmp169, %tmp165		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp171, label %bb, label %return

return:		; preds = %bb166, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc i8 @_ZN11regboundobj4stepEv(%struct.regboundobj* %this) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 5, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 5 )
	%tmp2 = getelementptr %struct.regboundobj* %this, i32 0, i32 3		; <i32*> [#uses=3]
	%tmp3 = load i32* %tmp2, align 8		; <i32> [#uses=1]
	%tmp4 = icmp eq i32 %tmp3, 0		; <i1> [#uses=1]
	br i1 %tmp4, label %UnifiedReturnBlock, label %cond_next

cond_next:		; preds = %entry
	%tmp7 = getelementptr %struct.regboundobj* %this, i32 0, i32 16		; <i8*> [#uses=1]
	%tmp8 = load i8* %tmp7, align 8		; <i8> [#uses=1]
	%tmp10 = icmp eq i8 %tmp8, 0		; <i1> [#uses=1]
	br i1 %tmp10, label %UnifiedReturnBlock, label %bb14

bb14:		; preds = %cond_next
	%tmp16 = getelementptr %struct.regboundobj* %this, i32 0, i32 2		; <i8*> [#uses=3]
	%tmp17 = load i8* %tmp16, align 8		; <i8> [#uses=1]
	%tmp19 = icmp eq i8 %tmp17, 0		; <i1> [#uses=1]
	br i1 %tmp19, label %cond_true22, label %cond_false

cond_true22:		; preds = %bb14
	%tmp24 = getelementptr %struct.regboundobj* %this, i32 0, i32 1		; <%struct.boundart*> [#uses=1]
	%tmp26 = getelementptr %struct.regboundobj* %this, i32 0, i32 0		; <%struct.boundart*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 5, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_( %struct.regboundobj* %this, %struct.boundart* %tmp26, %struct.boundart* %tmp24 )
	%tmp30 = getelementptr %struct.regboundobj* %this, i32 0, i32 1, i32 1		; <i32*> [#uses=1]
	%tmp31 = load i32* %tmp30, align 8		; <i32> [#uses=2]
	store i32 %tmp31, i32* %tmp2, align 8
	store i8 1, i8* %tmp16, align 8
	%not.tmp5465 = icmp ne i32 %tmp31, 0		; <i1> [#uses=1]
	%retval66 = zext i1 %not.tmp5465 to i8		; <i8> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 %retval66

cond_false:		; preds = %bb14
	%tmp37 = getelementptr %struct.regboundobj* %this, i32 0, i32 0		; <%struct.boundart*> [#uses=1]
	%tmp39 = getelementptr %struct.regboundobj* %this, i32 0, i32 1		; <%struct.boundart*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 5, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN11regboundobj10makebound2ER9flexarrayI6pointtES3_( %struct.regboundobj* %this, %struct.boundart* %tmp39, %struct.boundart* %tmp37 )
	%tmp43 = getelementptr %struct.regboundobj* %this, i32 0, i32 0, i32 1		; <i32*> [#uses=1]
	%tmp44 = load i32* %tmp43, align 8		; <i32> [#uses=2]
	store i32 %tmp44, i32* %tmp2, align 8
	store i8 0, i8* %tmp16, align 8
	%not.tmp54 = icmp ne i32 %tmp44, 0		; <i1> [#uses=1]
	%retval = zext i1 %not.tmp54 to i8		; <i8> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 %retval

UnifiedReturnBlock:		; preds = %cond_next, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0
}

define internal fastcc void @_ZN11regboundobj9firststepEiiP6regobjP9regmngobj(%struct.regboundobj* %this, i32 %x0, i32 %y0, %struct.regobj* %regionpin) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 6, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 6 )
	%tmp2 = getelementptr %struct.regboundobj* %this, i32 0, i32 5		; <i32*> [#uses=1]
	store i32 %x0, i32* %tmp2, align 8
	%tmp5 = getelementptr %struct.regboundobj* %this, i32 0, i32 6		; <i32*> [#uses=1]
	store i32 %y0, i32* %tmp5, align 8
	%tmp8 = getelementptr %struct.regboundobj* %this, i32 0, i32 4		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %regionpin, %struct.regobj** %tmp8, align 8
	%tmp11 = getelementptr %struct.regboundobj* %this, i32 0, i32 15		; <%struct.regmngobj**> [#uses=2]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp11, align 8
	%tmp17 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp19 = getelementptr %struct.regboundobj* %this, i32 0, i32 9		; <%struct.regobj***> [#uses=2]
	store %struct.regobj** %tmp17, %struct.regobj*** %tmp19, align 8
	%tmp24 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp26 = getelementptr %struct.regboundobj* %this, i32 0, i32 10		; <i8**> [#uses=1]
	store i8* %tmp24, i8** %tmp26, align 8
	%tmp31 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp33 = getelementptr %struct.regboundobj* %this, i32 0, i32 11		; <i32*> [#uses=2]
	store i32 %tmp31, i32* %tmp33, align 8
	%tmp38 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp40 = getelementptr %struct.regboundobj* %this, i32 0, i32 12		; <i32*> [#uses=1]
	store i32 %tmp38, i32* %tmp40, align 8
	%tmp45 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp47 = getelementptr %struct.regboundobj* %this, i32 0, i32 13		; <i32*> [#uses=2]
	store i32 %tmp45, i32* %tmp47, align 8
	%tmp52 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp54 = getelementptr %struct.regboundobj* %this, i32 0, i32 14		; <i32*> [#uses=2]
	store i32 %tmp52, i32* %tmp54, align 8
	%tmp57 = load %struct.regmngobj** %tmp11, align 8		; <%struct.regmngobj*> [#uses=1]
	%tmp58 = getelementptr %struct.regmngobj* %tmp57, i32 0, i32 9		; <i32*> [#uses=1]
	%tmp59 = load i32* %tmp58, align 8		; <i32> [#uses=3]
	%tmp61 = getelementptr %struct.regboundobj* %this, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 %tmp59, i32* %tmp61, align 8
	%tmp68 = mul i32 %tmp59, %tmp59		; <i32> [#uses=1]
	%tmp70 = getelementptr %struct.regboundobj* %this, i32 0, i32 8		; <i32*> [#uses=1]
	store i32 %tmp68, i32* %tmp70, align 8
	%tmp72 = getelementptr %struct.regboundobj* %this, i32 0, i32 16		; <i8*> [#uses=1]
	%tmp73 = load i8* %tmp72, align 8		; <i8> [#uses=1]
	%tmp75 = icmp eq i8 %tmp73, 0		; <i1> [#uses=1]
	br i1 %tmp75, label %cond_true, label %cond_next

cond_true:		; preds = %entry
	%tmp78 = getelementptr %struct.regboundobj* %this, i32 0, i32 3		; <i32*> [#uses=1]
	store i32 0, i32* %tmp78, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void

cond_next:		; preds = %entry
	%tmp82 = getelementptr %struct.regobj* %regionpin, i32 0, i32 4		; <i32*> [#uses=1]
	store i32 0, i32* %tmp82, align 8
	%tmp88 = getelementptr %struct.regboundobj* %this, i32 0, i32 0, i32 2		; <i32*> [#uses=1]
	store i32 128, i32* %tmp88, align 8
	%tmp91 = getelementptr %struct.regboundobj* %this, i32 0, i32 0, i32 1		; <i32*> [#uses=2]
	store i32 0, i32* %tmp91, align 8
	%tmp101258 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp101258.sub = getelementptr [128 x %struct.pointt]* %tmp101258, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	%tmp106 = getelementptr %struct.regboundobj* %this, i32 0, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	store %struct.pointt* %tmp101258.sub, %struct.pointt** %tmp106, align 8
	%tmp113 = getelementptr %struct.regboundobj* %this, i32 0, i32 1, i32 2		; <i32*> [#uses=1]
	store i32 128, i32* %tmp113, align 8
	%tmp116 = getelementptr %struct.regboundobj* %this, i32 0, i32 1, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp116, align 8
	%tmp128257 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp128257.sub = getelementptr [128 x %struct.pointt]* %tmp128257, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	%tmp134 = getelementptr %struct.regboundobj* %this, i32 0, i32 1, i32 0		; <%struct.pointt**> [#uses=1]
	store %struct.pointt* %tmp128257.sub, %struct.pointt** %tmp134, align 8
	%tmp136 = add i32 %x0, -1		; <i32> [#uses=2]
	%tmp138 = add i32 %y0, -1		; <i32> [#uses=2]
	%tmp140 = add i32 %x0, 1		; <i32> [#uses=2]
	%tmp142 = add i32 %y0, 1		; <i32> [#uses=2]
	%tmp144 = icmp slt i32 %tmp136, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp144, i32 0, i32 %tmp136		; <i32> [#uses=2]
	%tmp150 = icmp slt i32 %tmp138, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp150, i32 0, i32 %tmp138		; <i32> [#uses=3]
	%tmp157 = load i32* %tmp47, align 8		; <i32> [#uses=2]
	%tmp159 = icmp slt i32 %tmp157, %tmp140		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp159, i32 %tmp157, i32 %tmp140		; <i32> [#uses=2]
	%tmp169 = load i32* %tmp54, align 8		; <i32> [#uses=3]
	%tmp171 = icmp slt i32 %tmp169, %tmp142		; <i1> [#uses=1]
	br i1 %tmp171, label %cond_true174, label %bb228

cond_true174:		; preds = %cond_next
	%tmp231252 = icmp sgt i32 %y1.0, %tmp169		; <i1> [#uses=1]
	br i1 %tmp231252, label %bb234, label %bb219.preheader

bb219.preheader:		; preds = %bb228, %cond_true174
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp169, %cond_true174 ], [ %y2.0, %bb228 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true174 ], [ %y.0, %bb228 ]		; <i32> [#uses=3]
	%tmp222254 = icmp sgt i32 %x1.0, %x2.0		; <i1> [#uses=1]
	br i1 %tmp222254, label %bb225, label %bb.nph

bb.nph:		; preds = %bb219.preheader
	%tmp212 = getelementptr %struct.regboundobj* %this, i32 0, i32 0		; <%struct.boundart*> [#uses=1]
	br label %bb182

bb182:		; preds = %cond_next216, %bb.nph
	%indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %cond_next216 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 36, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 36 )
	%x.0253 = add i32 %indvar, %x1.0		; <i32> [#uses=3]
	%tmp192 = load %struct.regobj*** %tmp19, align 8		; <%struct.regobj**> [#uses=1]
	%tmp195 = load i32* %tmp33, align 8		; <i32> [#uses=1]
	%tmp197 = mul i32 %tmp195, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp199 = add i32 %tmp197, %x.0253		; <i32> [#uses=1]
	%tmp199200 = sext i32 %tmp199 to i64		; <i64> [#uses=1]
	%tmp201 = getelementptr %struct.regobj** %tmp192, i64 %tmp199200		; <%struct.regobj**> [#uses=1]
	%tmp205 = load %struct.regobj** %tmp201, align 8		; <%struct.regobj*> [#uses=1]
	%tmp206 = icmp eq %struct.regobj* %tmp205, null		; <i1> [#uses=1]
	br i1 %tmp206, label %cond_true210, label %cond_next216

cond_true210:		; preds = %bb182
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 6, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 36, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN11regboundobj10addtoboundER9flexarrayI6pointtEii( %struct.regboundobj* %this, %struct.boundart* %tmp212, i32 %x.0253, i32 %y.0.reg2mem.0.ph )
	br label %cond_next216

cond_next216:		; preds = %cond_true210, %bb182
	%tmp218 = add i32 %x.0253, 1		; <i32> [#uses=1]
	%tmp222 = icmp sgt i32 %tmp218, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp222, label %bb225, label %bb182

bb225:		; preds = %cond_next216, %bb219.preheader
	%tmp227 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb228

bb228:		; preds = %bb225, %cond_next
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb225 ], [ %tmp142, %cond_next ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp227, %bb225 ], [ %y1.0, %cond_next ]		; <i32> [#uses=2]
	%tmp231 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp231, label %bb234, label %bb219.preheader

bb234:		; preds = %bb228, %cond_true174
	%tmp236 = getelementptr %struct.regboundobj* %this, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 0, i8* %tmp236, align 8
	%tmp240 = load i32* %tmp91, align 8		; <i32> [#uses=1]
	%tmp242 = getelementptr %struct.regboundobj* %this, i32 0, i32 3		; <i32*> [#uses=1]
	store i32 %tmp240, i32* %tmp242, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_(%struct.boundart* %b1arp, %struct.boundart* %b2arp) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 7, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 7 )
	%tmp8 = getelementptr %struct.boundart* %b2arp, i32 0, i32 1		; <i32*> [#uses=5]
	store i32 0, i32* %tmp8, align 8
	%tmp330343 = getelementptr %struct.boundart* %b1arp, i32 0, i32 1		; <i32*> [#uses=2]
	%tmp331344 = load i32* %tmp330343, align 8		; <i32> [#uses=1]
	%tmp333346 = icmp sgt i32 %tmp331344, 0		; <i1> [#uses=1]
	br i1 %tmp333346, label %bb.preheader, label %return

bb.preheader:		; preds = %entry
	%tmp14 = getelementptr %struct.boundart* %b1arp, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp211 = getelementptr %struct.boundart* %b2arp, i32 0, i32 2		; <i32*> [#uses=2]
	%tmp245 = getelementptr %struct.boundart* %b2arp, i32 0, i32 0		; <%struct.pointt**> [#uses=4]
	br label %bb

bb:		; preds = %bb328, %bb.preheader
	%j.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp327, %bb328 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 37, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 37 )
	%tmp15 = load %struct.pointt** %tmp14, align 8		; <%struct.pointt*> [#uses=2]
	%tmp1617 = sext i32 %j.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp22 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 0		; <i32*> [#uses=1]
	%tmp23 = load i32* %tmp22, align 4		; <i32> [#uses=2]
	%tmp24 = add i32 %tmp23, -1		; <i32> [#uses=2]
	%tmp39 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 1		; <i32*> [#uses=1]
	%tmp40 = load i32* %tmp39, align 4		; <i32> [#uses=2]
	%tmp41 = add i32 %tmp40, -1		; <i32> [#uses=2]
	%tmp58 = add i32 %tmp23, 1		; <i32> [#uses=2]
	%tmp75 = add i32 %tmp40, 1		; <i32> [#uses=2]
	%tmp77 = icmp slt i32 %tmp24, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp77, i32 0, i32 %tmp24		; <i32> [#uses=1]
	%tmp80 = icmp slt i32 %tmp41, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp80, i32 0, i32 %tmp41		; <i32> [#uses=3]
	%tmp87 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=2]
	%tmp89 = icmp slt i32 %tmp87, %tmp58		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp89, i32 %tmp87, i32 %tmp58		; <i32> [#uses=2]
	%tmp99 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=3]
	%tmp101 = icmp slt i32 %tmp99, %tmp75		; <i1> [#uses=1]
	br i1 %tmp101, label %cond_true104, label %bb319

cond_true104:		; preds = %bb
	%tmp322356 = icmp sgt i32 %y1.0, %tmp99		; <i1> [#uses=1]
	br i1 %tmp322356, label %bb328, label %bb310.preheader

bb310.preheader:		; preds = %bb319, %cond_true104
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp99, %cond_true104 ], [ %y2.0, %bb319 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true104 ], [ %y.0, %bb319 ]		; <i32> [#uses=5]
	br label %bb310

bb112:		; preds = %bb310, %cond_true182
	%indvar = phi i32 [ %indvar.next, %cond_true182 ], [ 0, %bb310 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 39, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 39 )
	%x.0.reg2mem.0 = add i32 %indvar, %x.0		; <i32> [#uses=6]
	%tmp115 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp118 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp120 = mul i32 %tmp118, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp122 = add i32 %tmp120, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp122123 = sext i32 %tmp122 to i64		; <i64> [#uses=2]
	%tmp124 = getelementptr i16* %tmp115, i64 %tmp122123		; <i16*> [#uses=1]
	%tmp125 = load i16* %tmp124, align 2		; <i16> [#uses=1]
	%tmp128 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=1]
	%tmp129 = icmp eq i16 %tmp125, %tmp128		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp129, label %cond_next307, label %cond_true132

cond_true132:		; preds = %bb112
	%tmp150 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp159 = getelementptr i8* %tmp150, i64 %tmp122123		; <i8*> [#uses=1]
	%tmp160 = load i8* %tmp159, align 1		; <i8> [#uses=1]
	%tmp164165166169 = zext i8 %tmp160 to i64		; <i64> [#uses=1]
	%tmp170 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp164165166169		; <i8*> [#uses=1]
	%tmp171 = load i8* %tmp170, align 1		; <i8> [#uses=1]
	%cond = icmp eq i8 %tmp171, 0		; <i1> [#uses=2]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %cond, label %cond_true197, label %cond_true174

cond_true174:		; preds = %cond_true132
	%tmp177 = load i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8		; <i8> [#uses=1]
	%tmp179 = icmp eq i8 %tmp177, 0		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp179, label %cond_true182, label %cond_next192

cond_true182:		; preds = %cond_true174
	store i32 %x.0.reg2mem.0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 2), align 8
	store i32 %y.0.reg2mem.0.ph, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 3), align 8
	store i8 1, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8
	%tmp309357 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp313366 = icmp sgt i32 %tmp309357, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp313366, label %bb316, label %bb112

cond_next192:		; preds = %cond_true174
	br i1 %cond, label %cond_true197, label %cond_next290

cond_true197:		; preds = %cond_next192, %cond_true132
	%tmp209 = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp212 = load i32* %tmp211, align 8		; <i32> [#uses=3]
	%tmp213 = icmp eq i32 %tmp209, %tmp212		; <i1> [#uses=1]
	br i1 %tmp213, label %cond_true216, label %cond_next262

cond_true216:		; preds = %cond_true197
	%tmp223 = shl i32 %tmp212, 1		; <i32> [#uses=2]
	%tmp231 = malloc %struct.pointt, i32 %tmp223		; <%struct.pointt*> [#uses=2]
	%tmpcast = bitcast %struct.pointt* %tmp231 to i8*		; <i8*> [#uses=1]
	%tmp241242 = sext i32 %tmp212 to i64		; <i64> [#uses=1]
	%tmp243 = shl i64 %tmp241242, 3		; <i64> [#uses=1]
	%tmp246 = load %struct.pointt** %tmp245, align 8		; <%struct.pointt*> [#uses=1]
	%tmp246249 = bitcast %struct.pointt* %tmp246 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 7, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 37, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 38, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp246249, i64 %tmp243, i32 4 )
	%tmp253 = load %struct.pointt** %tmp245, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp253
	store %struct.pointt* %tmp231, %struct.pointt** %tmp245, align 8
	store i32 %tmp223, i32* %tmp211, align 8
	br label %cond_next262

cond_next262:		; preds = %cond_true216, %cond_true197
	%tmp265 = load %struct.pointt** %tmp245, align 8		; <%struct.pointt*> [#uses=2]
	%tmp268 = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp268276 = sext i32 %tmp268 to i64		; <i64> [#uses=2]
	%tmp278 = getelementptr %struct.pointt* %tmp265, i64 %tmp268276, i32 0		; <i32*> [#uses=1]
	store i32 %x.0.reg2mem.0, i32* %tmp278, align 4
	%tmp281 = getelementptr %struct.pointt* %tmp265, i64 %tmp268276, i32 1		; <i32*> [#uses=1]
	store i32 %y.0.reg2mem.0.ph, i32* %tmp281, align 4
	%tmp286 = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp287 = add i32 %tmp286, 1		; <i32> [#uses=1]
	store i32 %tmp287, i32* %tmp8, align 8
	br label %cond_next290

cond_next290:		; preds = %cond_next262, %cond_next192
	%tmp293 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp296 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp298 = mul i32 %tmp296, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp300 = add i32 %tmp298, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp303 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=1]
	%tmp300304 = sext i32 %tmp300 to i64		; <i64> [#uses=1]
	%tmp305 = getelementptr i16* %tmp293, i64 %tmp300304		; <i16*> [#uses=1]
	store i16 %tmp303, i16* %tmp305, align 2
	br label %cond_next307

cond_next307:		; preds = %cond_next290, %bb112
	%tmp309 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb310

bb310:		; preds = %cond_next307, %bb310.preheader
	%x.0 = phi i32 [ %tmp309, %cond_next307 ], [ %x1.0, %bb310.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 38, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 38 )
	%tmp313 = icmp sgt i32 %x.0, %x2.0		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp313, label %bb316, label %bb112

bb316:		; preds = %bb310, %cond_true182
	%tmp318 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb319

bb319:		; preds = %bb316, %bb
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb316 ], [ %tmp75, %bb ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp318, %bb316 ], [ %y1.0, %bb ]		; <i32> [#uses=2]
	%tmp322 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp322, label %bb328, label %bb310.preheader

bb328:		; preds = %bb319, %cond_true104
	%tmp327 = add i32 %j.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp331 = load i32* %tmp330343, align 8		; <i32> [#uses=1]
	%tmp333 = icmp sgt i32 %tmp331, %tmp327		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp333, label %bb, label %return

return:		; preds = %bb328, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc i8 @_ZN9regmngobj13findfreeplaceEiiRiS0_(i32 %x0, i32 %y0, i32* %xpl, i32* %ypl) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 8, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 8 )
	%bound1arp = alloca %struct.boundart		; <%struct.boundart*> [#uses=5]
	%bound2arp = alloca %struct.boundart		; <%struct.boundart*> [#uses=5]
	store i8 0, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8
	%tmp7 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=1]
	%tmp8 = add i16 %tmp7, 1		; <i16> [#uses=2]
	store i16 %tmp8, i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8
	%tmp14 = icmp eq i16 %tmp8, -1		; <i1> [#uses=1]
	br i1 %tmp14, label %cond_true, label %cond_next

cond_true:		; preds = %entry
	%tmp18 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp21 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp22 = mul i32 %tmp21, %tmp18		; <i32> [#uses=1]
	%tmp2223 = sext i32 %tmp22 to i64		; <i64> [#uses=1]
	%tmp24 = shl i64 %tmp2223, 1		; <i64> [#uses=1]
	%tmp27 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp2728 = bitcast i16* %tmp27 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 8, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp2728, i8 0, i64 %tmp24, i32 2 )
	store i16 1, i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8
	br label %cond_next

cond_next:		; preds = %cond_true, %entry
	store i32 -1, i32* %xpl, align 4
	store i32 -1, i32* %ypl, align 4
	store i32 -1, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 2), align 8
	store i32 -1, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 3), align 8
	%tmp38 = getelementptr %struct.boundart* %bound1arp, i32 0, i32 2		; <i32*> [#uses=3]
	store i32 128, i32* %tmp38, align 8
	%tmp40 = getelementptr %struct.boundart* %bound1arp, i32 0, i32 1		; <i32*> [#uses=8]
	store i32 0, i32* %tmp40, align 8
	%tmp49651 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=3]
	%tmp49651.sub = getelementptr [128 x %struct.pointt]* %tmp49651, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	%tmp53 = getelementptr %struct.boundart* %bound1arp, i32 0, i32 0		; <%struct.pointt**> [#uses=6]
	store %struct.pointt* %tmp49651.sub, %struct.pointt** %tmp53, align 8
	%tmp56 = getelementptr %struct.boundart* %bound2arp, i32 0, i32 2		; <i32*> [#uses=1]
	store i32 128, i32* %tmp56, align 8
	%tmp58 = getelementptr %struct.boundart* %bound2arp, i32 0, i32 1		; <i32*> [#uses=2]
	store i32 0, i32* %tmp58, align 8
	%tmp69650 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp69650.sub = getelementptr [128 x %struct.pointt]* %tmp69650, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	%tmp74 = getelementptr %struct.boundart* %bound2arp, i32 0, i32 0		; <%struct.pointt**> [#uses=2]
	store %struct.pointt* %tmp69650.sub, %struct.pointt** %tmp74, align 8
	%tmp76 = icmp sgt i32 %x0, -1		; <i1> [#uses=1]
	%tmp79 = icmp sgt i32 %y0, -1		; <i1> [#uses=1]
	%tmp83 = and i1 %tmp79, %tmp76		; <i1> [#uses=1]
	br i1 %tmp83, label %cond_true86, label %cond_next285

cond_true86:		; preds = %cond_next
	%tmp89 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp91 = icmp slt i32 %tmp89, %x0		; <i1> [#uses=1]
	br i1 %tmp91, label %cond_next285, label %cond_true94

cond_true94:		; preds = %cond_true86
	%tmp97 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp99 = icmp slt i32 %tmp97, %y0		; <i1> [#uses=1]
	br i1 %tmp99, label %cond_next285, label %cond_true102

cond_true102:		; preds = %cond_true94
	%tmp105 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp108 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp110 = mul i32 %tmp108, %y0		; <i32> [#uses=1]
	%tmp112 = add i32 %tmp110, %x0		; <i32> [#uses=1]
	%tmp112113 = sext i32 %tmp112 to i64		; <i64> [#uses=2]
	%tmp114 = getelementptr i16* %tmp105, i64 %tmp112113		; <i16*> [#uses=2]
	%tmp115 = load i16* %tmp114, align 2		; <i16> [#uses=1]
	%tmp118 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=2]
	%tmp119 = icmp eq i16 %tmp115, %tmp118		; <i1> [#uses=1]
	br i1 %tmp119, label %cond_next285, label %cond_true122

cond_true122:		; preds = %cond_true102
	%tmp139 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp148 = getelementptr i8* %tmp139, i64 %tmp112113		; <i8*> [#uses=1]
	%tmp149 = load i8* %tmp148, align 1		; <i8> [#uses=1]
	%tmp153154155158 = zext i8 %tmp149 to i64		; <i64> [#uses=1]
	%tmp159 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp153154155158		; <i8*> [#uses=1]
	%tmp160 = load i8* %tmp159, align 1		; <i8> [#uses=1]
	%cond = icmp eq i8 %tmp160, 0		; <i1> [#uses=2]
	br i1 %cond, label %cond_next241, label %cond_true163

cond_true163:		; preds = %cond_true122
	%tmp166 = load i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8		; <i8> [#uses=1]
	%tmp168 = icmp eq i8 %tmp166, 0		; <i1> [#uses=1]
	br i1 %tmp168, label %cond_true171, label %cond_next181

cond_true171:		; preds = %cond_true163
	store i32 %x0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 2), align 8
	store i32 %y0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 3), align 8
	store i8 1, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8
	br label %cond_next285

cond_next181:		; preds = %cond_true163
	br i1 %cond, label %cond_next241, label %cond_next265

cond_next241:		; preds = %cond_next181, %cond_true122
	%tmp255 = getelementptr [128 x %struct.pointt]* %tmp49651, i32 0, i64 0, i32 0		; <i32*> [#uses=1]
	store i32 %x0, i32* %tmp255, align 8
	%tmp258 = getelementptr [128 x %struct.pointt]* %tmp49651, i32 0, i64 0, i32 1		; <i32*> [#uses=1]
	store i32 %y0, i32* %tmp258, align 4
	store i32 1, i32* %tmp40, align 8
	br label %cond_next265

cond_next265:		; preds = %cond_next241, %cond_next181
	store i16 %tmp118, i16* %tmp114, align 2
	br label %cond_next285

cond_next285:		; preds = %cond_next265, %cond_true171, %cond_true102, %cond_true94, %cond_true86, %cond_next
	%tmp287 = add i32 %x0, -1		; <i32> [#uses=2]
	%tmp289 = add i32 %y0, -1		; <i32> [#uses=2]
	%tmp291 = add i32 %x0, 1		; <i32> [#uses=2]
	%tmp293 = add i32 %y0, 1		; <i32> [#uses=2]
	%tmp295 = icmp slt i32 %tmp287, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp295, i32 0, i32 %tmp287		; <i32> [#uses=1]
	%tmp301 = icmp slt i32 %tmp289, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp301, i32 0, i32 %tmp289		; <i32> [#uses=3]
	%tmp308 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=2]
	%tmp310 = icmp slt i32 %tmp308, %tmp291		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp310, i32 %tmp308, i32 %tmp291		; <i32> [#uses=2]
	%tmp320 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=3]
	%tmp322 = icmp slt i32 %tmp320, %tmp293		; <i1> [#uses=1]
	br i1 %tmp322, label %cond_true325, label %bb533

cond_true325:		; preds = %cond_next285
	%tmp536616 = icmp sgt i32 %y1.0, %tmp320		; <i1> [#uses=1]
	br i1 %tmp536616, label %bb539, label %bb524.preheader

bb524.preheader:		; preds = %bb533, %cond_true325
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp320, %cond_true325 ], [ %y2.0, %bb533 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true325 ], [ %y.0, %bb533 ]		; <i32> [#uses=5]
	br label %bb524

bb333:		; preds = %bb524, %cond_true403
	%indvar = phi i32 [ %indvar.next, %cond_true403 ], [ 0, %bb524 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 42, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 42 )
	%x.0.reg2mem.0 = add i32 %indvar, %x.0		; <i32> [#uses=6]
	%tmp336 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp339 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp341 = mul i32 %tmp339, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp343 = add i32 %tmp341, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp343344 = sext i32 %tmp343 to i64		; <i64> [#uses=2]
	%tmp345 = getelementptr i16* %tmp336, i64 %tmp343344		; <i16*> [#uses=1]
	%tmp346 = load i16* %tmp345, align 2		; <i16> [#uses=1]
	%tmp349 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=1]
	%tmp350 = icmp eq i16 %tmp346, %tmp349		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp350, label %cond_next521, label %cond_true353

cond_true353:		; preds = %bb333
	%tmp371 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp380 = getelementptr i8* %tmp371, i64 %tmp343344		; <i8*> [#uses=1]
	%tmp381 = load i8* %tmp380, align 1		; <i8> [#uses=1]
	%tmp385386387390 = zext i8 %tmp381 to i64		; <i64> [#uses=1]
	%tmp391 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp385386387390		; <i8*> [#uses=1]
	%tmp392 = load i8* %tmp391, align 1		; <i8> [#uses=1]
	%cond604 = icmp eq i8 %tmp392, 0		; <i1> [#uses=2]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %cond604, label %cond_true418, label %cond_true395

cond_true395:		; preds = %cond_true353
	%tmp398 = load i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8		; <i8> [#uses=1]
	%tmp400 = icmp eq i8 %tmp398, 0		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp400, label %cond_true403, label %cond_next413

cond_true403:		; preds = %cond_true395
	store i32 %x.0.reg2mem.0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 2), align 8
	store i32 %y.0.reg2mem.0.ph, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 3), align 8
	store i8 1, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8
	%tmp523617 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp527626 = icmp sgt i32 %tmp523617, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp527626, label %bb530, label %bb333

cond_next413:		; preds = %cond_true395
	br i1 %cond604, label %cond_true418, label %cond_next504

cond_true418:		; preds = %cond_next413, %cond_true353
	%tmp430 = load i32* %tmp40, align 8		; <i32> [#uses=1]
	%tmp432 = load i32* %tmp38, align 8		; <i32> [#uses=3]
	%tmp433 = icmp eq i32 %tmp430, %tmp432		; <i1> [#uses=1]
	br i1 %tmp433, label %cond_true436, label %cond_next480

cond_true436:		; preds = %cond_true418
	%tmp443 = shl i32 %tmp432, 1		; <i32> [#uses=2]
	%tmp453 = malloc %struct.pointt, i32 %tmp443		; <%struct.pointt*> [#uses=2]
	%tmpcast606 = bitcast %struct.pointt* %tmp453 to i8*		; <i8*> [#uses=1]
	%tmp462463 = sext i32 %tmp432 to i64		; <i64> [#uses=1]
	%tmp464 = shl i64 %tmp462463, 3		; <i64> [#uses=1]
	%tmp466 = load %struct.pointt** %tmp53, align 8		; <%struct.pointt*> [#uses=1]
	%tmp466469 = bitcast %struct.pointt* %tmp466 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 8, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 41, i32* @cg_caller_id_var, align 4
	call void @llvm.memcpy.i64( i8* %tmpcast606, i8* %tmp466469, i64 %tmp464, i32 4 )
	%tmp472 = load %struct.pointt** %tmp53, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp472
	store %struct.pointt* %tmp453, %struct.pointt** %tmp53, align 8
	store i32 %tmp443, i32* %tmp38, align 8
	br label %cond_next480

cond_next480:		; preds = %cond_true436, %cond_true418
	%tmp482 = load %struct.pointt** %tmp53, align 8		; <%struct.pointt*> [#uses=2]
	%tmp484 = load i32* %tmp40, align 8		; <i32> [#uses=1]
	%tmp484492 = sext i32 %tmp484 to i64		; <i64> [#uses=2]
	%tmp494 = getelementptr %struct.pointt* %tmp482, i64 %tmp484492, i32 0		; <i32*> [#uses=1]
	store i32 %x.0.reg2mem.0, i32* %tmp494, align 4
	%tmp497 = getelementptr %struct.pointt* %tmp482, i64 %tmp484492, i32 1		; <i32*> [#uses=1]
	store i32 %y.0.reg2mem.0.ph, i32* %tmp497, align 4
	%tmp501 = load i32* %tmp40, align 8		; <i32> [#uses=1]
	%tmp502 = add i32 %tmp501, 1		; <i32> [#uses=1]
	store i32 %tmp502, i32* %tmp40, align 8
	br label %cond_next504

cond_next504:		; preds = %cond_next480, %cond_next413
	%tmp507 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	%tmp510 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp512 = mul i32 %tmp510, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp514 = add i32 %tmp512, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp517 = load i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8		; <i16> [#uses=1]
	%tmp514518 = sext i32 %tmp514 to i64		; <i64> [#uses=1]
	%tmp519 = getelementptr i16* %tmp507, i64 %tmp514518		; <i16*> [#uses=1]
	store i16 %tmp517, i16* %tmp519, align 2
	br label %cond_next521

cond_next521:		; preds = %cond_next504, %bb333
	%tmp523 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb524

bb524:		; preds = %cond_next521, %bb524.preheader
	%x.0 = phi i32 [ %tmp523, %cond_next521 ], [ %x1.0, %bb524.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 41, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 41 )
	%tmp527 = icmp sgt i32 %x.0, %x2.0		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp527, label %bb530, label %bb333

bb530:		; preds = %bb524, %cond_true403
	%tmp532 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb533

bb533:		; preds = %bb530, %cond_next285
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb530 ], [ %tmp293, %cond_next285 ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp532, %bb530 ], [ %y1.0, %cond_next285 ]		; <i32> [#uses=2]
	%tmp536 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp536, label %bb539, label %bb524.preheader

bb539:		; preds = %bb533, %cond_true325
	%boundl.1627 = load i32* %tmp40, align 4		; <i32> [#uses=1]
	%tmp559628 = icmp eq i32 %boundl.1627, 0		; <i1> [#uses=1]
	br i1 %tmp559628, label %bb571, label %cond_next563

bb542:		; preds = %cond_next563
	br i1 %flodd.0.reg2mem.0, label %cond_true548, label %cond_false

cond_true548:		; preds = %bb542
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 8, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 40, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_( %struct.boundart* %bound1arp, %struct.boundart* %bound2arp )
	%boundl.1629 = load i32* %tmp58, align 4		; <i32> [#uses=1]
	%tmp559630 = icmp eq i32 %boundl.1629, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp559630, label %bb571, label %cond_next563

cond_false:		; preds = %bb542
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 8, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 40, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj10makebound2ER9flexarrayI6pointtES3_( %struct.boundart* %bound2arp, %struct.boundart* %bound1arp )
	%boundl.1 = load i32* %tmp40, align 4		; <i32> [#uses=1]
	%tmp559 = icmp eq i32 %boundl.1, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp559, label %bb571, label %cond_next563

cond_next563:		; preds = %cond_false, %cond_true548, %bb539
	%flodd.0.reg2mem.0 = phi i1 [ true, %bb539 ], [ false, %cond_true548 ], [ true, %cond_false ]		; <i1> [#uses=1]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 40, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 40 )
	%tmp566 = load i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8		; <i8> [#uses=1]
	%tmp568 = icmp eq i8 %tmp566, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp568, label %bb542, label %bb571

bb571:		; preds = %cond_next563, %cond_false, %cond_true548, %bb539
	%tmp573 = load %struct.pointt** %tmp53, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp573
	%tmp578 = load %struct.pointt** %tmp74, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp578
	%tmp584 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 2), align 8		; <i32> [#uses=1]
	store i32 %tmp584, i32* %xpl, align 4
	%tmp588 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 3), align 8		; <i32> [#uses=1]
	store i32 %tmp588, i32* %ypl, align 4
	%tmp592 = load i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 4), align 8		; <i8> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 %tmp592
}

declare void @llvm.memset.i64(i8*, i8, i64, i32) nounwind 

define internal fastcc void @_ZN9regmngobj6createEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 9, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 9 )
	store i32 16, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8
	store i32 0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp106.i = malloc [16 x %struct.regobj*]		; <[16 x %struct.regobj*]*> [#uses=1]
	%tmp106.sub.i = getelementptr [16 x %struct.regobj*]* %tmp106.i, i32 0, i32 0		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp106.sub.i, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8
	store i32 16, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 1), align 8
	%tmp363.i = malloc [16 x i32]		; <[16 x i32]*> [#uses=1]
	%tmp363.sub.i = getelementptr [16 x i32]* %tmp363.i, i32 0, i32 0		; <i32*> [#uses=1]
	store i32* %tmp363.sub.i, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8
	store i32 16, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 1), align 8
	%tmp662.i = malloc [16 x i32]		; <[16 x i32]*> [#uses=1]
	%tmp662.sub.i = getelementptr [16 x i32]* %tmp662.i, i32 0, i32 0		; <i32*> [#uses=1]
	store i32* %tmp662.sub.i, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8
	store i32 16, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp901.i = malloc [16 x i32]		; <[16 x i32]*> [#uses=1]
	%tmp901.sub.i = getelementptr [16 x i32]* %tmp901.i, i32 0, i32 0		; <i32*> [#uses=1]
	store i32* %tmp901.sub.i, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8
	br label %bb94.i

bb94.i:		; preds = %cond_next.i, %entry
	%tmp101.rle.i = phi i32 [ 0, %entry ], [ %tmp151.i, %cond_next.i ]		; <i32> [#uses=1]
	%i.0.reg2mem.0.i = phi i32 [ 0, %entry ], [ %tmp155.i, %cond_next.i ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 43, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 43 )
	%tmp104.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8		; <i32> [#uses=3]
	%tmp105.i = icmp eq i32 %tmp101.rle.i, %tmp104.i		; <i1> [#uses=1]
	br i1 %tmp105.i, label %cond_true.i, label %cond_next.i

cond_true.i:		; preds = %bb94.i
	%tmp112.i = shl i32 %tmp104.i, 1		; <i32> [#uses=2]
	%tmp116.i = malloc i32, i32 %tmp112.i		; <i32*> [#uses=2]
	%tmpcast.i = bitcast i32* %tmp116.i to i8*		; <i8*> [#uses=1]
	%tmp120121.i = sext i32 %tmp104.i to i64		; <i64> [#uses=1]
	%tmp122.i = shl i64 %tmp120121.i, 2		; <i64> [#uses=1]
	%tmp125.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp125128.i = bitcast i32* %tmp125.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 9, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 43, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp125128.i, i64 %tmp122.i, i32 4 ) nounwind 
	%tmp131.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp131.i
	store i32* %tmp116.i, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8
	store i32 %tmp112.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8
	br label %cond_next.i

cond_next.i:		; preds = %cond_true.i, %bb94.i
	%tmp141.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp144.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp144145.i = sext i32 %tmp144.i to i64		; <i64> [#uses=1]
	%tmp146.i = getelementptr i32* %tmp141.i, i64 %tmp144145.i		; <i32*> [#uses=1]
	store i32 %i.0.reg2mem.0.i, i32* %tmp146.i, align 4
	%tmp150.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp151.i = add i32 %tmp150.i, 1		; <i32> [#uses=2]
	store i32 %tmp151.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp155.i = add i32 %i.0.reg2mem.0.i, 1		; <i32> [#uses=2]
	%tmp159.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp161.i = icmp sgt i32 %tmp159.i, %tmp155.i		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp161.i, label %bb94.i, label %_ZN15largesolidarrayIP6regobjE6createEi.exit

_ZN15largesolidarrayIP6regobjE6createEi.exit:		; preds = %cond_next.i
	store %struct.regobj** null, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8
	store i8* null, i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8
	store i16* null, i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32
	store i32 0, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 5), align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare i32 @open(i8*, i32, ...)

declare i64 @read(i32, i8*, i64)

declare i32 @close(i32)

define internal fastcc void @_ZN9regmngobj20definemiddleregpointEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 10, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 10 )
	%tmp47206 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp49208 = icmp sgt i32 %tmp47206, 0		; <i1> [#uses=1]
	br i1 %tmp49208, label %bb, label %bb112

bb:		; preds = %bb, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp42, %bb ], [ 0, %entry ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 44, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 44 )
	%tmp13 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1415 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp16 = getelementptr %struct.regobj** %tmp13, i64 %tmp1415		; <%struct.regobj**> [#uses=1]
	%tmp20 = load %struct.regobj** %tmp16, align 8		; <%struct.regobj*> [#uses=1]
	%tmp22 = getelementptr %struct.regobj* %tmp20, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	store i32 0, i32* %tmp22, align 8
	%tmp31 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp34 = getelementptr %struct.regobj** %tmp31, i64 %tmp1415		; <%struct.regobj**> [#uses=1]
	%tmp38 = load %struct.regobj** %tmp34, align 8		; <%struct.regobj*> [#uses=1]
	%tmp40 = getelementptr %struct.regobj* %tmp38, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp40, align 8
	%tmp42 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp47 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp49 = icmp sgt i32 %tmp47, %tmp42		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp49, label %bb, label %bb112

bb53:		; preds = %bb101.outer, %cond_next
	%x.0216 = phi i32 [ %tmp100, %cond_next ], [ 0, %bb101.outer ]		; <i32> [#uses=3]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 47, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 47 )
	%tmp63 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp66 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp68 = mul i32 %tmp66, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp70 = add i32 %tmp68, %x.0216		; <i32> [#uses=1]
	%tmp7071 = sext i32 %tmp70 to i64		; <i64> [#uses=1]
	%tmp72 = getelementptr %struct.regobj** %tmp63, i64 %tmp7071		; <%struct.regobj**> [#uses=1]
	%tmp76 = load %struct.regobj** %tmp72, align 8		; <%struct.regobj*> [#uses=3]
	%tmp78 = icmp eq %struct.regobj* %tmp76, null		; <i1> [#uses=1]
	br i1 %tmp78, label %cond_next, label %cond_true

cond_true:		; preds = %bb53
	%tmp83 = getelementptr %struct.regobj* %tmp76, i32 0, i32 5, i32 0		; <i32*> [#uses=2]
	%tmp84 = load i32* %tmp83, align 8		; <i32> [#uses=1]
	%tmp86 = add i32 %tmp84, %x.0216		; <i32> [#uses=1]
	store i32 %tmp86, i32* %tmp83, align 8
	%tmp92 = getelementptr %struct.regobj* %tmp76, i32 0, i32 5, i32 1		; <i32*> [#uses=2]
	%tmp93 = load i32* %tmp92, align 8		; <i32> [#uses=1]
	%tmp95 = add i32 %tmp93, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	store i32 %tmp95, i32* %tmp92, align 8
	br label %cond_next

cond_next:		; preds = %cond_true, %bb53
	%tmp100 = add i32 %x.0216, 1		; <i32> [#uses=2]
	%tmp104 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp106 = icmp slt i32 %tmp104, %tmp100		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp106, label %bb109, label %bb53

bb109:		; preds = %bb101.outer, %cond_next
	%tmp111 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp115213 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp117215 = icmp slt i32 %tmp115213, %tmp111		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp117215, label %bb192.preheader, label %bb101.outer

bb101.outer:		; preds = %bb112, %bb109
	%y.0.reg2mem.0.ph = phi i32 [ %tmp111, %bb109 ], [ 0, %bb112 ]		; <i32> [#uses=3]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 46, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 46 )
	%tmp104218 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp106219 = icmp slt i32 %tmp104218, 0		; <i1> [#uses=1]
	br i1 %tmp106219, label %bb109, label %bb53

bb112:		; preds = %bb, %entry
	%tmp115 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp117 = icmp slt i32 %tmp115, 0		; <i1> [#uses=1]
	br i1 %tmp117, label %bb192.preheader, label %bb101.outer

bb192.preheader:		; preds = %bb112, %bb109
	%tmp196222 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp198223 = icmp sgt i32 %tmp196222, 0		; <i1> [#uses=1]
	br i1 %tmp198223, label %bb121, label %return

bb121:		; preds = %cond_next189, %bb192.preheader
	%i.1220 = phi i32 [ %tmp191, %cond_next189 ], [ 0, %bb192.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 45, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 45 )
	%tmp130 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp131132 = sext i32 %i.1220 to i64		; <i64> [#uses=1]
	%tmp133 = getelementptr %struct.regobj** %tmp130, i64 %tmp131132		; <%struct.regobj**> [#uses=1]
	%tmp137 = load %struct.regobj** %tmp133, align 8		; <%struct.regobj*> [#uses=3]
	%tmp139 = getelementptr %struct.regobj* %tmp137, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp140 = load i32* %tmp139, align 8		; <i32> [#uses=2]
	%tmp141 = icmp sgt i32 %tmp140, 0		; <i1> [#uses=1]
	br i1 %tmp141, label %cond_true144, label %cond_next189

cond_true144:		; preds = %bb121
	%tmp147 = getelementptr %struct.regobj* %tmp137, i32 0, i32 5, i32 0		; <i32*> [#uses=2]
	%tmp148 = load i32* %tmp147, align 8		; <i32> [#uses=1]
	%tmp148149 = sitofp i32 %tmp148 to double		; <double> [#uses=1]
	%tmp152153 = sitofp i32 %tmp140 to double		; <double> [#uses=2]
	%tmp154 = fdiv double %tmp148149, %tmp152153		; <double> [#uses=1]
	%tmp154155 = fptrunc double %tmp154 to float		; <float> [#uses=1]
	%tmp159 = add float %tmp154155, 5.000000e-01		; <float> [#uses=1]
	%tmp159160 = fptosi float %tmp159 to i32		; <i32> [#uses=1]
	store i32 %tmp159160, i32* %tmp147, align 8
	%tmp169 = getelementptr %struct.regobj* %tmp137, i32 0, i32 5, i32 1		; <i32*> [#uses=2]
	%tmp170 = load i32* %tmp169, align 8		; <i32> [#uses=1]
	%tmp170171 = sitofp i32 %tmp170 to double		; <double> [#uses=1]
	%tmp176 = fdiv double %tmp170171, %tmp152153		; <double> [#uses=1]
	%tmp176177 = fptrunc double %tmp176 to float		; <float> [#uses=1]
	%tmp181 = add float %tmp176177, 5.000000e-01		; <float> [#uses=1]
	%tmp181182 = fptosi float %tmp181 to i32		; <i32> [#uses=1]
	store i32 %tmp181182, i32* %tmp169, align 8
	br label %cond_next189

cond_next189:		; preds = %cond_true144, %bb121
	%tmp191 = add i32 %i.1220, 1		; <i32> [#uses=2]
	%tmp196 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp198 = icmp sgt i32 %tmp196, %tmp191		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp198, label %bb121, label %return

return:		; preds = %cond_next189, %bb192.preheader
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj7destroyEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 11, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 11 )
	%tmp4299 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp44101 = icmp sgt i32 %tmp4299, 0		; <i1> [#uses=1]
	br i1 %tmp44101, label %bb, label %bb46

bb:		; preds = %bb, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp37, %bb ], [ 0, %entry ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 48, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 48 )
	%tmp10 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1112 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp13 = getelementptr %struct.regobj** %tmp10, i64 %tmp1112		; <%struct.regobj**> [#uses=1]
	%tmp17 = load %struct.regobj** %tmp13, align 8		; <%struct.regobj*> [#uses=1]
	%tmp4.i = getelementptr %struct.regobj* %tmp17, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp5.i = load %struct.regobj*** %tmp4.i, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp5.i
	%tmp26 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp29 = getelementptr %struct.regobj** %tmp26, i64 %tmp1112		; <%struct.regobj**> [#uses=1]
	%tmp33 = load %struct.regobj** %tmp29, align 8		; <%struct.regobj*> [#uses=1]
	%tmp3435 = bitcast %struct.regobj* %tmp33 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 11, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 48, i32* @cg_caller_id_var, align 4
	tail call void @_ZdlPv( i8* %tmp3435 ) nounwind 
	%tmp37 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp42 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp44 = icmp sgt i32 %tmp42, %tmp37		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp44, label %bb, label %bb46

bb46:		; preds = %bb, %entry
	%tmp55 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp55
	%tmp63 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp63
	%tmp72 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp72
	%tmp76 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp76
	%tmp80 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp80
	store %struct.regobj** null, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8
	%tmp86 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	free i8* %tmp86
	store i8* null, i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8
	%tmp91 = load i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32		; <i16*> [#uses=1]
	free i16* %tmp91
	store i16* null, i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare void @_ZdlPv(i8*) nounwind 

define internal fastcc void @_ZN9regmngobj15redefineregionsEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 12, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 12 )
	%tmp19242 = malloc [16 x %struct.regboundobj]		; <[16 x %struct.regboundobj]*> [#uses=1]
	%tmp19242.sub = getelementptr [16 x %struct.regboundobj]* %tmp19242, i32 0, i32 0		; <%struct.regboundobj*> [#uses=2]
	%tmp170264 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp172266 = icmp sgt i32 %tmp170264, 0		; <i1> [#uses=1]
	br i1 %tmp172266, label %bb24, label %bb199.preheader

bb24:		; preds = %bb166, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp165, %bb166 ], [ 0, %entry ]		; <i32> [#uses=2]
	%rboundarp.2.2.reg2mem.0 = phi i32 [ %rboundarp.2.1, %bb166 ], [ 16, %entry ]		; <i32> [#uses=5]
	%rboundarp.1.1.reg2mem.0 = phi i32 [ %rboundarp.1.0, %bb166 ], [ 0, %entry ]		; <i32> [#uses=3]
	%rboundarp.0.2.reg2mem.0 = phi %struct.regboundobj* [ %rboundarp.0.1, %bb166 ], [ %tmp19242.sub, %entry ]		; <%struct.regboundobj*> [#uses=4]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 49, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 49 )
	%tmp32 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp3334 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp35 = getelementptr %struct.regobj** %tmp32, i64 %tmp3334		; <%struct.regobj**> [#uses=1]
	%tmp39 = load %struct.regobj** %tmp35, align 8		; <%struct.regobj*> [#uses=1]
	%tmp40 = getelementptr %struct.regobj* %tmp39, i32 0, i32 2		; <i8*> [#uses=1]
	%tmp41 = load i8* %tmp40, align 8		; <i8> [#uses=1]
	%toBool = icmp eq i8 %tmp41, 0		; <i1> [#uses=1]
	br i1 %toBool, label %bb166, label %cond_true

cond_true:		; preds = %bb24
	%tmp48 = icmp eq i32 %rboundarp.1.1.reg2mem.0, %rboundarp.2.2.reg2mem.0		; <i1> [#uses=1]
	br i1 %tmp48, label %cond_true51, label %cond_next90

cond_true51:		; preds = %cond_true
	%tmp55 = shl i32 %rboundarp.2.2.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp65 = malloc %struct.regboundobj, i32 %tmp55		; <%struct.regboundobj*> [#uses=2]
	%tmpcast = bitcast %struct.regboundobj* %tmp65 to i8*		; <i8*> [#uses=1]
	%tmp7475 = sext i32 %rboundarp.2.2.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp76 = mul i64 %tmp7475, 112		; <i64> [#uses=1]
	%tmp7881 = bitcast %struct.regboundobj* %rboundarp.0.2.reg2mem.0 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 12, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 49, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp7881, i64 %tmp76, i32 8 )
	free %struct.regboundobj* %rboundarp.0.2.reg2mem.0
	br label %cond_next90

cond_next90:		; preds = %cond_true51, %cond_true
	%rboundarp.2.0 = phi i32 [ %tmp55, %cond_true51 ], [ %rboundarp.2.2.reg2mem.0, %cond_true ]		; <i32> [#uses=1]
	%rboundarp.0.0 = phi %struct.regboundobj* [ %tmp65, %cond_true51 ], [ %rboundarp.0.2.reg2mem.0, %cond_true ]		; <%struct.regboundobj*> [#uses=3]
	%tmp93 = add i32 %rboundarp.1.1.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp9899 = sext i32 %tmp93 to i64		; <i64> [#uses=1]
	%tmp100.sum = add i64 %tmp9899, -1		; <i64> [#uses=2]
	%tmp101 = getelementptr %struct.regboundobj* %rboundarp.0.0, i64 %tmp100.sum		; <%struct.regboundobj*> [#uses=1]
	%tmp106 = getelementptr %struct.regboundobj* %rboundarp.0.0, i64 %tmp100.sum, i32 16		; <i8*> [#uses=1]
	store i8 1, i8* %tmp106, align 8
	%tmp115 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp118 = getelementptr %struct.regobj** %tmp115, i64 %tmp3334		; <%struct.regobj**> [#uses=1]
	%tmp122 = load %struct.regobj** %tmp118, align 8		; <%struct.regobj*> [#uses=3]
	%tmp140 = getelementptr %struct.regobj* %tmp122, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	%tmp141 = load i32* %tmp140, align 8		; <i32> [#uses=1]
	%tmp159 = getelementptr %struct.regobj* %tmp122, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	%tmp160 = load i32* %tmp159, align 8		; <i32> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 12, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 49, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN11regboundobj9firststepEiiP6regobjP9regmngobj( %struct.regboundobj* %tmp101, i32 %tmp160, i32 %tmp141, %struct.regobj* %tmp122 )
	br label %bb166

bb166:		; preds = %cond_next90, %bb24
	%rboundarp.0.1 = phi %struct.regboundobj* [ %rboundarp.0.0, %cond_next90 ], [ %rboundarp.0.2.reg2mem.0, %bb24 ]		; <%struct.regboundobj*> [#uses=2]
	%rboundarp.1.0 = phi i32 [ %tmp93, %cond_next90 ], [ %rboundarp.1.1.reg2mem.0, %bb24 ]		; <i32> [#uses=2]
	%rboundarp.2.1 = phi i32 [ %rboundarp.2.0, %cond_next90 ], [ %rboundarp.2.2.reg2mem.0, %bb24 ]		; <i32> [#uses=1]
	%tmp165 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp170 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp172 = icmp sgt i32 %tmp170, %tmp165		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp172, label %bb24, label %bb199.preheader

bb177:		; preds = %bb199
	%tmp183184 = sext i32 %i.1 to i64		; <i64> [#uses=1]
	%tmp185 = getelementptr %struct.regboundobj* %rboundarp.0.2.reg2mem.1.ph, i64 %tmp183184		; <%struct.regboundobj*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 12, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 50, i32* @cg_caller_id_var, align 4
	%tmp189 = tail call fastcc i8 @_ZN11regboundobj4stepEv( %struct.regboundobj* %tmp185 ) zeroext 		; <i8> [#uses=1]
	%tmp191 = icmp eq i8 %tmp189, 1		; <i1> [#uses=1]
	%fldone.0 = select i1 %tmp191, i8 0, i8 %fldone.1		; <i8> [#uses=1]
	%tmp198 = add i32 %i.1, 1		; <i32> [#uses=1]
	br label %bb199

bb199.preheader:		; preds = %bb166, %entry
	%rboundarp.1.1.reg2mem.1.ph = phi i32 [ 0, %entry ], [ %rboundarp.1.0, %bb166 ]		; <i32> [#uses=3]
	%rboundarp.0.2.reg2mem.1.ph = phi %struct.regboundobj* [ %tmp19242.sub, %entry ], [ %rboundarp.0.1, %bb166 ]		; <%struct.regboundobj*> [#uses=4]
	br label %bb199

bb199:		; preds = %bb206, %bb199.preheader, %bb177
	%i.1 = phi i32 [ 0, %bb199.preheader ], [ %tmp198, %bb177 ], [ 0, %bb206 ]		; <i32> [#uses=3]
	%fldone.1 = phi i8 [ 1, %bb199.preheader ], [ %fldone.0, %bb177 ], [ 1, %bb206 ]		; <i8> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 50, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 50 )
	%tmp203 = icmp sgt i32 %rboundarp.1.1.reg2mem.1.ph, %i.1		; <i1> [#uses=1]
	br i1 %tmp203, label %bb177, label %bb206

bb206:		; preds = %bb199
	%tmp209 = icmp eq i8 %fldone.1, 0		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp209, label %bb199, label %bb227.loopexit

bb213:		; preds = %bb227.loopexit, %bb213
	%i.2267 = phi i32 [ %tmp226, %bb213 ], [ 0, %bb227.loopexit ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 51, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 51 )
	%tmp219220 = sext i32 %i.2267 to i64		; <i64> [#uses=2]
	%tmp4.i = getelementptr %struct.regboundobj* %rboundarp.0.2.reg2mem.1.ph, i64 %tmp219220, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp5.i = load %struct.pointt** %tmp4.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp5.i
	%tmp12.i = getelementptr %struct.regboundobj* %rboundarp.0.2.reg2mem.1.ph, i64 %tmp219220, i32 1, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp13.i = load %struct.pointt** %tmp12.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp13.i
	%tmp226 = add i32 %i.2267, 1		; <i32> [#uses=2]
	%tmp231 = icmp sgt i32 %rboundarp.1.1.reg2mem.1.ph, %tmp226		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp231, label %bb213, label %bb234

bb227.loopexit:		; preds = %bb206
	%tmp231268 = icmp sgt i32 %rboundarp.1.1.reg2mem.1.ph, 0		; <i1> [#uses=1]
	br i1 %tmp231268, label %bb213, label %bb234

bb234:		; preds = %bb227.loopexit, %bb213
	free %struct.regboundobj* %rboundarp.0.2.reg2mem.1.ph
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj13deleteregionsEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 13, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 13 )
	%tmp18336 = malloc [16 x %struct.regobj*]		; <[16 x %struct.regobj*]*> [#uses=1]
	%tmp18336.sub = getelementptr [16 x %struct.regobj*]* %tmp18336, i32 0, i32 0		; <%struct.regobj**> [#uses=2]
	%tmp126359 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp128361 = icmp sgt i32 %tmp126359, 0		; <i1> [#uses=1]
	br i1 %tmp128361, label %bb23, label %bb318.preheader

bb23:		; preds = %bb122, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp121, %bb122 ], [ 0, %entry ]		; <i32> [#uses=2]
	%deletedregions.2.2.reg2mem.0 = phi i32 [ %deletedregions.2.1, %bb122 ], [ 16, %entry ]		; <i32> [#uses=5]
	%deletedregions.1.1.reg2mem.0 = phi i32 [ %deletedregions.1.0, %bb122 ], [ 0, %entry ]		; <i32> [#uses=4]
	%deletedregions.0.2.reg2mem.0 = phi %struct.regobj** [ %deletedregions.0.1, %bb122 ], [ %tmp18336.sub, %entry ]		; <%struct.regobj**> [#uses=4]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 52, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 52 )
	%tmp31 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp3233 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp34 = getelementptr %struct.regobj** %tmp31, i64 %tmp3233		; <%struct.regobj**> [#uses=2]
	%tmp38 = load %struct.regobj** %tmp34, align 8		; <%struct.regobj*> [#uses=1]
	%tmp39 = getelementptr %struct.regobj* %tmp38, i32 0, i32 1		; <i8*> [#uses=1]
	%tmp40 = load i8* %tmp39, align 8		; <i8> [#uses=1]
	%tmp42 = icmp eq i8 %tmp40, 0		; <i1> [#uses=1]
	br i1 %tmp42, label %cond_true, label %bb122

cond_true:		; preds = %bb23
	%tmp64 = icmp eq i32 %deletedregions.1.1.reg2mem.0, %deletedregions.2.2.reg2mem.0		; <i1> [#uses=1]
	br i1 %tmp64, label %cond_true67, label %cond_next106

cond_true67:		; preds = %cond_true
	%tmp71 = shl i32 %deletedregions.2.2.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp81 = malloc %struct.regobj*, i32 %tmp71		; <%struct.regobj**> [#uses=2]
	%tmpcast = bitcast %struct.regobj** %tmp81 to i8*		; <i8*> [#uses=1]
	%tmp9091 = sext i32 %deletedregions.2.2.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp92 = shl i64 %tmp9091, 3		; <i64> [#uses=1]
	%tmp9497 = bitcast %struct.regobj** %deletedregions.0.2.reg2mem.0 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 13, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 52, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp9497, i64 %tmp92, i32 8 )
	free %struct.regobj** %deletedregions.0.2.reg2mem.0
	br label %cond_next106

cond_next106:		; preds = %cond_true67, %cond_true
	%deletedregions.2.0 = phi i32 [ %tmp71, %cond_true67 ], [ %deletedregions.2.2.reg2mem.0, %cond_true ]		; <i32> [#uses=1]
	%deletedregions.0.0 = phi %struct.regobj** [ %tmp81, %cond_true67 ], [ %deletedregions.0.2.reg2mem.0, %cond_true ]		; <%struct.regobj**> [#uses=2]
	%tmp112 = load %struct.regobj** %tmp34, align 8		; <%struct.regobj*> [#uses=1]
	%tmp110113 = sext i32 %deletedregions.1.1.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp114 = getelementptr %struct.regobj** %deletedregions.0.0, i64 %tmp110113		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp112, %struct.regobj** %tmp114, align 8
	%tmp117 = add i32 %deletedregions.1.1.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb122

bb122:		; preds = %cond_next106, %bb23
	%deletedregions.0.1 = phi %struct.regobj** [ %deletedregions.0.0, %cond_next106 ], [ %deletedregions.0.2.reg2mem.0, %bb23 ]		; <%struct.regobj**> [#uses=2]
	%deletedregions.1.0 = phi i32 [ %tmp117, %cond_next106 ], [ %deletedregions.1.1.reg2mem.0, %bb23 ]		; <i32> [#uses=2]
	%deletedregions.2.1 = phi i32 [ %deletedregions.2.0, %cond_next106 ], [ %deletedregions.2.2.reg2mem.0, %bb23 ]		; <i32> [#uses=1]
	%tmp121 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp126 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp128 = icmp sgt i32 %tmp126, %tmp121		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp128, label %bb23, label %bb318.preheader

bb132:		; preds = %bb318.preheader, %cond_next268
	%i.1362 = phi i32 [ %tmp317, %cond_next268 ], [ 0, %bb318.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 53, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 53 )
	%tmp138139 = sext i32 %i.1362 to i64		; <i64> [#uses=1]
	%tmp140 = getelementptr %struct.regobj** %deletedregions.0.2.reg2mem.1.ph, i64 %tmp138139		; <%struct.regobj**> [#uses=3]
	%tmp144 = load %struct.regobj** %tmp140, align 8		; <%struct.regobj*> [#uses=1]
	%tmp145 = getelementptr %struct.regobj* %tmp144, i32 0, i32 0		; <i32*> [#uses=1]
	%tmp146 = load i32* %tmp145, align 8		; <i32> [#uses=2]
	%tmp153 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp154155 = sext i32 %tmp146 to i64		; <i64> [#uses=1]
	%tmp156 = getelementptr i32* %tmp153, i64 %tmp154155		; <i32*> [#uses=1]
	%tmp157 = load i32* %tmp156, align 4		; <i32> [#uses=3]
	%tmp160 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp161 = add i32 %tmp160, -1		; <i32> [#uses=2]
	%tmp163 = icmp eq i32 %tmp161, %tmp157		; <i1> [#uses=1]
	br i1 %tmp163, label %cond_next219, label %cond_true166

cond_true166:		; preds = %bb132
	%tmp169 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=2]
	%tmp176177 = sext i32 %tmp161 to i64		; <i64> [#uses=1]
	%tmp178 = getelementptr %struct.regobj** %tmp169, i64 %tmp176177		; <%struct.regobj**> [#uses=1]
	%tmp179 = load %struct.regobj** %tmp178, align 8		; <%struct.regobj*> [#uses=1]
	%tmp180181 = sext i32 %tmp157 to i64		; <i64> [#uses=2]
	%tmp182 = getelementptr %struct.regobj** %tmp169, i64 %tmp180181		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp179, %struct.regobj** %tmp182, align 8
	%tmp186 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp190 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp193 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp194 = add i32 %tmp193, -1		; <i32> [#uses=1]
	%tmp194195 = sext i32 %tmp194 to i64		; <i64> [#uses=1]
	%tmp196 = getelementptr i32* %tmp190, i64 %tmp194195		; <i32*> [#uses=1]
	%tmp197 = load i32* %tmp196, align 4		; <i32> [#uses=1]
	%tmp197198 = sext i32 %tmp197 to i64		; <i64> [#uses=1]
	%tmp199 = getelementptr i32* %tmp186, i64 %tmp197198		; <i32*> [#uses=1]
	store i32 %tmp157, i32* %tmp199, align 4
	%tmp204 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=2]
	%tmp211 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp212 = add i32 %tmp211, -1		; <i32> [#uses=1]
	%tmp212213 = sext i32 %tmp212 to i64		; <i64> [#uses=1]
	%tmp214 = getelementptr i32* %tmp204, i64 %tmp212213		; <i32*> [#uses=1]
	%tmp215 = load i32* %tmp214, align 4		; <i32> [#uses=1]
	%tmp218 = getelementptr i32* %tmp204, i64 %tmp180181		; <i32*> [#uses=1]
	store i32 %tmp215, i32* %tmp218, align 4
	br label %cond_next219

cond_next219:		; preds = %cond_true166, %bb132
	%tmp226 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp229 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8		; <i32> [#uses=3]
	%tmp230 = icmp eq i32 %tmp226, %tmp229		; <i1> [#uses=1]
	br i1 %tmp230, label %cond_true233, label %cond_next268

cond_true233:		; preds = %cond_next219
	%tmp241 = shl i32 %tmp229, 1		; <i32> [#uses=2]
	%tmp245 = malloc i32, i32 %tmp241		; <i32*> [#uses=2]
	%tmpcast338 = bitcast i32* %tmp245 to i8*		; <i8*> [#uses=1]
	%tmp249250 = sext i32 %tmp229 to i64		; <i64> [#uses=1]
	%tmp251 = shl i64 %tmp249250, 2		; <i64> [#uses=1]
	%tmp254 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp254257 = bitcast i32* %tmp254 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 13, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 53, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast338, i8* %tmp254257, i64 %tmp251, i32 4 )
	%tmp260 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp260
	store i32* %tmp245, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8
	store i32 %tmp241, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8
	br label %cond_next268

cond_next268:		; preds = %cond_true233, %cond_next219
	%tmp271 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp274 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp274275 = sext i32 %tmp274 to i64		; <i64> [#uses=1]
	%tmp276 = getelementptr i32* %tmp271, i64 %tmp274275		; <i32*> [#uses=1]
	store i32 %tmp146, i32* %tmp276, align 4
	%tmp280 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp281 = add i32 %tmp280, 1		; <i32> [#uses=1]
	store i32 %tmp281, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp286 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp287 = add i32 %tmp286, -1		; <i32> [#uses=1]
	store i32 %tmp287, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp301 = load %struct.regobj** %tmp140, align 8		; <%struct.regobj*> [#uses=1]
	%tmp4.i = getelementptr %struct.regobj* %tmp301, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp5.i = load %struct.regobj*** %tmp4.i, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp5.i
	%tmp313 = load %struct.regobj** %tmp140, align 8		; <%struct.regobj*> [#uses=1]
	%tmp314315 = bitcast %struct.regobj* %tmp313 to i8*		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 13, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 53, i32* @cg_caller_id_var, align 4
	tail call void @_ZdlPv( i8* %tmp314315 ) nounwind 
	%tmp317 = add i32 %i.1362, 1		; <i32> [#uses=2]
	%tmp322 = icmp sgt i32 %deletedregions.1.1.reg2mem.1.ph, %tmp317		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp322, label %bb132, label %bb325

bb318.preheader:		; preds = %bb122, %entry
	%deletedregions.1.1.reg2mem.1.ph = phi i32 [ 0, %entry ], [ %deletedregions.1.0, %bb122 ]		; <i32> [#uses=2]
	%deletedregions.0.2.reg2mem.1.ph = phi %struct.regobj** [ %tmp18336.sub, %entry ], [ %deletedregions.0.1, %bb122 ]		; <%struct.regobj**> [#uses=2]
	%tmp322363 = icmp sgt i32 %deletedregions.1.1.reg2mem.1.ph, 0		; <i1> [#uses=1]
	br i1 %tmp322363, label %bb132, label %bb325

bb325:		; preds = %bb318.preheader, %cond_next268
	free %struct.regobj** %deletedregions.0.2.reg2mem.1.ph
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj18enlargeneighborsesEi(i32 %critical) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 14, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 14 )
	%tmp33324 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp35326 = icmp sgt i32 %tmp33324, 0		; <i1> [#uses=1]
	br i1 %tmp35326, label %bb, label %bb142

bb:		; preds = %bb, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp28, %bb ], [ 0, %entry ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 54, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 54 )
	%tmp18 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1920 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp21 = getelementptr %struct.regobj** %tmp18, i64 %tmp1920		; <%struct.regobj**> [#uses=1]
	%tmp25 = load %struct.regobj** %tmp21, align 8		; <%struct.regobj*> [#uses=1]
	%tmp26 = getelementptr %struct.regobj* %tmp25, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 0, i8* %tmp26, align 8
	%tmp28 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp33 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp35 = icmp sgt i32 %tmp33, %tmp28		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp35, label %bb, label %bb142

bb38:		; preds = %bb142, %cond_next
	%i.1.reg2mem.0 = phi i32 [ %tmp141, %cond_next ], [ 0, %bb142 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 55, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 55 )
	%tmp47 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp4849 = sext i32 %i.1.reg2mem.0 to i64		; <i64> [#uses=4]
	%tmp50 = getelementptr %struct.regobj** %tmp47, i64 %tmp4849		; <%struct.regobj**> [#uses=1]
	%tmp54 = load %struct.regobj** %tmp50, align 8		; <%struct.regobj*> [#uses=2]
	%tmp55 = getelementptr %struct.regobj* %tmp54, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp56 = load i32* %tmp55, align 8		; <i32> [#uses=1]
	%tmp58 = icmp slt i32 %tmp56, %critical		; <i1> [#uses=1]
	br i1 %tmp58, label %cond_true, label %cond_next

cond_true:		; preds = %bb38
	%tmp78 = getelementptr %struct.regobj* %tmp54, i32 0, i32 1		; <i8*> [#uses=1]
	store i8 0, i8* %tmp78, align 8
	%tmp123355 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=2]
	%tmp126357 = getelementptr %struct.regobj** %tmp123355, i64 %tmp4849		; <%struct.regobj**> [#uses=1]
	%tmp130358 = load %struct.regobj** %tmp126357, align 8		; <%struct.regobj*> [#uses=1]
	%tmp132359 = getelementptr %struct.regobj* %tmp130358, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp133360 = load i32* %tmp132359, align 8		; <i32> [#uses=1]
	%tmp135361 = icmp sgt i32 %tmp133360, 0		; <i1> [#uses=1]
	br i1 %tmp135361, label %bb79, label %cond_next

bb79:		; preds = %bb79, %cond_true
	%tmp88.rle = phi %struct.regobj** [ %tmp123, %bb79 ], [ %tmp123355, %cond_true ]		; <%struct.regobj**> [#uses=1]
	%i2.0353 = phi i32 [ %tmp113, %bb79 ], [ 0, %cond_true ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 56, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 56 )
	%tmp91 = getelementptr %struct.regobj** %tmp88.rle, i64 %tmp4849		; <%struct.regobj**> [#uses=1]
	%tmp95 = load %struct.regobj** %tmp91, align 8		; <%struct.regobj*> [#uses=1]
	%tmp102 = getelementptr %struct.regobj* %tmp95, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp103 = load %struct.regobj*** %tmp102, align 8		; <%struct.regobj**> [#uses=1]
	%tmp104105 = sext i32 %i2.0353 to i64		; <i64> [#uses=1]
	%tmp106 = getelementptr %struct.regobj** %tmp103, i64 %tmp104105		; <%struct.regobj**> [#uses=1]
	%tmp110 = load %struct.regobj** %tmp106, align 8		; <%struct.regobj*> [#uses=1]
	%tmp111 = getelementptr %struct.regobj* %tmp110, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 1, i8* %tmp111, align 8
	%tmp113 = add i32 %i2.0353, 1		; <i32> [#uses=2]
	%tmp123 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=2]
	%tmp126 = getelementptr %struct.regobj** %tmp123, i64 %tmp4849		; <%struct.regobj**> [#uses=1]
	%tmp130 = load %struct.regobj** %tmp126, align 8		; <%struct.regobj*> [#uses=1]
	%tmp132 = getelementptr %struct.regobj* %tmp130, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp133 = load i32* %tmp132, align 8		; <i32> [#uses=1]
	%tmp135 = icmp sgt i32 %tmp133, %tmp113		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp135, label %bb79, label %cond_next

cond_next:		; preds = %bb79, %cond_true, %bb38
	%tmp141 = add i32 %i.1.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp146333 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp148335 = icmp sgt i32 %tmp146333, %tmp141		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp148335, label %bb38, label %bb219

bb142:		; preds = %bb, %entry
	%tmp146.rle = phi i32 [ %tmp33324, %entry ], [ %tmp33, %bb ]		; <i32> [#uses=2]
	%tmp148 = icmp sgt i32 %tmp146.rle, 0		; <i1> [#uses=1]
	br i1 %tmp148, label %bb38, label %bb219

bb152:		; preds = %bb219, %cond_next216
	%i.2.reg2mem.0 = phi i32 [ %tmp218, %cond_next216 ], [ 0, %bb219 ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 57, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 57 )
	%tmp161 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp162163 = sext i32 %i.2.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp164 = getelementptr %struct.regobj** %tmp161, i64 %tmp162163		; <%struct.regobj**> [#uses=1]
	%tmp168 = load %struct.regobj** %tmp164, align 8		; <%struct.regobj*> [#uses=2]
	%tmp169 = getelementptr %struct.regobj* %tmp168, i32 0, i32 2		; <i8*> [#uses=2]
	%tmp170 = load i8* %tmp169, align 8		; <i8> [#uses=1]
	%toBool172 = icmp eq i8 %tmp170, 0		; <i1> [#uses=1]
	br i1 %toBool172, label %cond_next216, label %cond_true173

cond_true173:		; preds = %bb152
	%tmp190 = getelementptr %struct.regobj* %tmp168, i32 0, i32 1		; <i8*> [#uses=1]
	%tmp191 = load i8* %tmp190, align 8		; <i8> [#uses=1]
	%tmp193 = icmp eq i8 %tmp191, 0		; <i1> [#uses=1]
	br i1 %tmp193, label %cond_true197, label %cond_next216

cond_true197:		; preds = %cond_true173
	store i8 0, i8* %tmp169, align 8
	br label %cond_next216

cond_next216:		; preds = %cond_true197, %cond_true173, %bb152
	%tmp218 = add i32 %i.2.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp223341 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp225343 = icmp sgt i32 %tmp223341, %tmp218		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp225343, label %bb152, label %bb310.preheader

bb219:		; preds = %bb142, %cond_next
	%tmp223.rle = phi i32 [ %tmp146.rle, %bb142 ], [ %tmp146333, %cond_next ]		; <i32> [#uses=1]
	%tmp225 = icmp sgt i32 %tmp223.rle, 0		; <i1> [#uses=1]
	br i1 %tmp225, label %bb152, label %bb310.preheader

bb230:		; preds = %bb299.preheader, %cond_next296
	%x.0344 = phi i32 [ %tmp298, %cond_next296 ], [ 0, %bb299.preheader ]		; <i32> [#uses=2]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 59, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 59 )
	%tmp240 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp243 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp245 = mul i32 %tmp243, %y.0348		; <i32> [#uses=1]
	%tmp247 = add i32 %tmp245, %x.0344		; <i32> [#uses=1]
	%tmp247248 = sext i32 %tmp247 to i64		; <i64> [#uses=1]
	%tmp249 = getelementptr %struct.regobj** %tmp240, i64 %tmp247248		; <%struct.regobj**> [#uses=2]
	%tmp253 = load %struct.regobj** %tmp249, align 8		; <%struct.regobj*> [#uses=3]
	%tmp255 = icmp eq %struct.regobj* %tmp253, null		; <i1> [#uses=1]
	br i1 %tmp255, label %cond_next296, label %cond_true258

cond_true258:		; preds = %bb230
	%tmp260 = getelementptr %struct.regobj* %tmp253, i32 0, i32 2		; <i8*> [#uses=1]
	%tmp261 = load i8* %tmp260, align 8		; <i8> [#uses=1]
	%toBool262 = icmp eq i8 %tmp261, 0		; <i1> [#uses=1]
	br i1 %toBool262, label %cond_next264, label %bb272

cond_next264:		; preds = %cond_true258
	%tmp266 = getelementptr %struct.regobj* %tmp253, i32 0, i32 1		; <i8*> [#uses=1]
	%tmp267 = load i8* %tmp266, align 8		; <i8> [#uses=1]
	%tmp269 = icmp eq i8 %tmp267, 0		; <i1> [#uses=1]
	br i1 %tmp269, label %bb272, label %cond_next296

bb272:		; preds = %cond_next264, %cond_true258
	store %struct.regobj* null, %struct.regobj** %tmp249, align 8
	br label %cond_next296

cond_next296:		; preds = %bb272, %cond_next264, %bb230
	%tmp298 = add i32 %x.0344, 1		; <i32> [#uses=2]
	%tmp302 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp304 = icmp slt i32 %tmp302, %tmp298		; <i1> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp304, label %bb307, label %bb230

bb307:		; preds = %bb299.preheader, %cond_next296
	%tmp309 = add i32 %y.0348, 1		; <i32> [#uses=2]
	%tmp313 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp315 = icmp slt i32 %tmp313, %tmp309		; <i1> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %tmp315, label %bb318, label %bb299.preheader

bb310.preheader:		; preds = %bb219, %cond_next216
	%tmp313350 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp315351 = icmp slt i32 %tmp313350, 0		; <i1> [#uses=1]
	br i1 %tmp315351, label %bb318, label %bb299.preheader

bb299.preheader:		; preds = %bb310.preheader, %bb307
	%y.0348 = phi i32 [ %tmp309, %bb307 ], [ 0, %bb310.preheader ]		; <i32> [#uses=2]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 58, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 58 )
	%tmp302346 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp304347 = icmp slt i32 %tmp302346, 0		; <i1> [#uses=1]
	br i1 %tmp304347, label %bb307, label %bb230

bb318:		; preds = %bb310.preheader, %bb307
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 14, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN9regmngobj13deleteregionsEv( )
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 14, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN9regmngobj15redefineregionsEv( )
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj19defineneighborhood1Ev() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 15, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 15 )
	%tmp28389 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp30391 = icmp sgt i32 %tmp28389, 0		; <i1> [#uses=1]
	br i1 %tmp30391, label %bb, label %bb56

bb:		; preds = %bb, %entry
	%i.0.reg2mem.0 = phi i32 [ %tmp23, %bb ], [ 0, %entry ]		; <i32> [#uses=3]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 60, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 60 )
	%tmp12 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1314 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp15 = getelementptr %struct.regobj** %tmp12, i64 %tmp1314		; <%struct.regobj**> [#uses=1]
	%tmp19 = load %struct.regobj** %tmp15, align 8		; <%struct.regobj*> [#uses=1]
	%tmp20 = getelementptr %struct.regobj* %tmp19, i32 0, i32 6		; <i32*> [#uses=1]
	store i32 %i.0.reg2mem.0, i32* %tmp20, align 8
	%tmp23 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp28 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp30 = icmp sgt i32 %tmp28, %tmp23		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp30, label %bb, label %bb56

bb33:		; preds = %bb56, %bb33
	%i.1.reg2mem.0 = phi i32 [ %tmp55, %bb33 ], [ 0, %bb56 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 61, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 61 )
	%tmp42 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp4344 = sext i32 %i.1.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp45 = getelementptr %struct.regobj** %tmp42, i64 %tmp4344		; <%struct.regobj**> [#uses=1]
	%tmp49 = load %struct.regobj** %tmp45, align 8		; <%struct.regobj*> [#uses=1]
	%tmp53 = getelementptr %struct.regobj* %tmp49, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp53, align 8
	%tmp55 = add i32 %i.1.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp60395 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp62397 = icmp sgt i32 %tmp60395, %tmp55		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp62397, label %bb33, label %bb370.preheader

bb56:		; preds = %bb, %entry
	%tmp60.rle = phi i32 [ %tmp28389, %entry ], [ %tmp28, %bb ]		; <i32> [#uses=1]
	%tmp62 = icmp sgt i32 %tmp60.rle, 0		; <i1> [#uses=1]
	br i1 %tmp62, label %bb33, label %bb370.preheader

bb.nph:		; preds = %bb358.preheader
	%tmp349400 = add i32 %indvar425, 2		; <i32> [#uses=2]
	%tmp351402 = icmp slt i32 %tmp349400, %indvar425		; <i1> [#uses=1]
	br label %bb67

bb67:		; preds = %bb355, %bb.nph
	%indvar420 = phi i32 [ 0, %bb.nph ], [ %x.0408, %bb355 ]		; <i32> [#uses=5]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 63, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 63 )
	%x.0408 = add i32 %indvar420, 1		; <i32> [#uses=2]
	%tmp77 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp80 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp82 = mul i32 %tmp80, %y.0413		; <i32> [#uses=1]
	%tmp84 = add i32 %tmp82, %x.0408		; <i32> [#uses=1]
	%tmp8485 = sext i32 %tmp84 to i64		; <i64> [#uses=1]
	%tmp86 = getelementptr %struct.regobj** %tmp77, i64 %tmp8485		; <%struct.regobj**> [#uses=1]
	%tmp90 = load %struct.regobj** %tmp86, align 8		; <%struct.regobj*> [#uses=6]
	%tmp92 = icmp eq %struct.regobj* %tmp90, null		; <i1> [#uses=1]
	%brmerge = or i1 %tmp92, %tmp351402		; <i1> [#uses=1]
	br i1 %brmerge, label %bb355, label %bb97.preheader

bb97.preheader:		; preds = %bb67
	%tmp339405 = add i32 %indvar420, 2		; <i32> [#uses=2]
	%tmp341407 = icmp slt i32 %tmp339405, %indvar420		; <i1> [#uses=1]
	%tmp164 = getelementptr %struct.regobj* %tmp90, i32 0, i32 9, i32 1		; <i32*> [#uses=4]
	%tmp143 = getelementptr %struct.regobj* %tmp90, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=5]
	%tmp182 = getelementptr %struct.regobj* %tmp90, i32 0, i32 9, i32 2		; <i32*> [#uses=3]
	br i1 %tmp341407, label %bb355, label %bb97

bb97:		; preds = %bb347, %bb97.preheader
	%indvar423 = phi i32 [ %indvar.next424, %bb347 ], [ 0, %bb97.preheader ]		; <i32> [#uses=2]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 64, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 64 )
	%y1.0.reg2mem.0 = add i32 %indvar423, %indvar425		; <i32> [#uses=2]
	br label %bb100

bb100:		; preds = %bb337, %bb97
	%indvar = phi i32 [ 0, %bb97 ], [ %indvar.next419, %bb337 ]		; <i32> [#uses=2]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 65, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 65 )
	%x1.0.reg2mem.0 = add i32 %indvar, %indvar420		; <i32> [#uses=2]
	%tmp110 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp113 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp115 = mul i32 %tmp113, %y1.0.reg2mem.0		; <i32> [#uses=1]
	%tmp117 = add i32 %tmp115, %x1.0.reg2mem.0		; <i32> [#uses=1]
	%tmp117118 = sext i32 %tmp117 to i64		; <i64> [#uses=1]
	%tmp119 = getelementptr %struct.regobj** %tmp110, i64 %tmp117118		; <%struct.regobj**> [#uses=1]
	%tmp123 = load %struct.regobj** %tmp119, align 8		; <%struct.regobj*> [#uses=8]
	%tmp125 = icmp eq %struct.regobj* %tmp123, null		; <i1> [#uses=1]
	%tmp131 = icmp eq %struct.regobj* %tmp90, %tmp123		; <i1> [#uses=1]
	%bothcond = or i1 %tmp125, %tmp131		; <i1> [#uses=1]
	br i1 %bothcond, label %bb337, label %bb161.preheader

bb161.preheader:		; preds = %bb100
	%tmp165 = load i32* %tmp164, align 8		; <i32> [#uses=2]
	br label %bb161

bb135:		; preds = %bb161
	%tmp144 = load %struct.regobj*** %tmp143, align 8		; <%struct.regobj**> [#uses=1]
	%tmp145146 = sext i32 %i.2 to i64		; <i64> [#uses=1]
	%tmp147 = getelementptr %struct.regobj** %tmp144, i64 %tmp145146		; <%struct.regobj**> [#uses=1]
	%tmp151 = load %struct.regobj** %tmp147, align 8		; <%struct.regobj*> [#uses=1]
	%tmp153 = icmp eq %struct.regobj* %tmp151, %tmp123		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp153, label %bb337, label %cond_next158

cond_next158:		; preds = %bb135
	%indvar.next = add i32 %i.2, 1		; <i32> [#uses=1]
	br label %bb161

bb161:		; preds = %cond_next158, %bb161.preheader
	%i.2 = phi i32 [ 0, %bb161.preheader ], [ %indvar.next, %cond_next158 ]		; <i32> [#uses=3]
	%val311 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val412 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 66, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val311, i32 %val412, i32 66 )
	%tmp167 = icmp sgt i32 %tmp165, %i.2		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp167, label %bb135, label %cond_next174.critedge

cond_next174.critedge:		; preds = %bb161
	%tmp183 = load i32* %tmp182, align 8		; <i32> [#uses=2]
	%tmp184 = icmp eq i32 %tmp165, %tmp183		; <i1> [#uses=1]
	br i1 %tmp184, label %cond_true187, label %cond_next233

cond_true187:		; preds = %cond_next174.critedge
	%tmp194 = shl i32 %tmp183, 1		; <i32> [#uses=2]
	%tmp202 = malloc %struct.regobj*, i32 %tmp194		; <%struct.regobj**> [#uses=2]
	%tmpcast = bitcast %struct.regobj** %tmp202 to i8*		; <i8*> [#uses=1]
	%tmp212 = load i32* %tmp182, align 8		; <i32> [#uses=1]
	%tmp212213 = sext i32 %tmp212 to i64		; <i64> [#uses=1]
	%tmp214 = shl i64 %tmp212213, 3		; <i64> [#uses=1]
	%tmp217 = load %struct.regobj*** %tmp143, align 8		; <%struct.regobj**> [#uses=1]
	%tmp217220 = bitcast %struct.regobj** %tmp217 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 15, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 62, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 63, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 64, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 65, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp217220, i64 %tmp214, i32 8 )
	%tmp224 = load %struct.regobj*** %tmp143, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp224
	store %struct.regobj** %tmp202, %struct.regobj*** %tmp143, align 8
	store i32 %tmp194, i32* %tmp182, align 8
	br label %cond_next233

cond_next233:		; preds = %cond_true187, %cond_next174.critedge
	%tmp236 = load %struct.regobj*** %tmp143, align 8		; <%struct.regobj**> [#uses=1]
	%tmp239 = load i32* %tmp164, align 8		; <i32> [#uses=1]
	%tmp239242 = sext i32 %tmp239 to i64		; <i64> [#uses=1]
	%tmp243 = getelementptr %struct.regobj** %tmp236, i64 %tmp239242		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp123, %struct.regobj** %tmp243, align 8
	%tmp246 = load i32* %tmp164, align 8		; <i32> [#uses=1]
	%tmp247 = add i32 %tmp246, 1		; <i32> [#uses=1]
	store i32 %tmp247, i32* %tmp164, align 8
	%tmp255 = getelementptr %struct.regobj* %tmp123, i32 0, i32 9, i32 1		; <i32*> [#uses=4]
	%tmp256 = load i32* %tmp255, align 8		; <i32> [#uses=1]
	%tmp258 = getelementptr %struct.regobj* %tmp123, i32 0, i32 9, i32 2		; <i32*> [#uses=3]
	%tmp259 = load i32* %tmp258, align 8		; <i32> [#uses=2]
	%tmp260 = icmp eq i32 %tmp256, %tmp259		; <i1> [#uses=1]
	br i1 %tmp260, label %cond_true263, label %cond_next315

cond_true263:		; preds = %cond_next233
	%tmp273 = shl i32 %tmp259, 1		; <i32> [#uses=2]
	%tmp283 = malloc %struct.regobj*, i32 %tmp273		; <%struct.regobj**> [#uses=2]
	%tmpcast384 = bitcast %struct.regobj** %tmp283 to i8*		; <i8*> [#uses=1]
	%tmp293 = load i32* %tmp258, align 8		; <i32> [#uses=1]
	%tmp293294 = sext i32 %tmp293 to i64		; <i64> [#uses=1]
	%tmp295 = shl i64 %tmp293294, 3		; <i64> [#uses=1]
	%tmp297 = getelementptr %struct.regobj* %tmp123, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=3]
	%tmp298 = load %struct.regobj*** %tmp297, align 8		; <%struct.regobj**> [#uses=1]
	%tmp298301 = bitcast %struct.regobj** %tmp298 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 15, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 62, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 63, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 64, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 65, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast384, i8* %tmp298301, i64 %tmp295, i32 8 )
	%tmp305 = load %struct.regobj*** %tmp297, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp305
	store %struct.regobj** %tmp283, %struct.regobj*** %tmp297, align 8
	store i32 %tmp273, i32* %tmp258, align 8
	br label %cond_next315

cond_next315:		; preds = %cond_true263, %cond_next233
	%tmp317 = getelementptr %struct.regobj* %tmp123, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp318 = load %struct.regobj*** %tmp317, align 8		; <%struct.regobj**> [#uses=1]
	%tmp321 = load i32* %tmp255, align 8		; <i32> [#uses=1]
	%tmp321324 = sext i32 %tmp321 to i64		; <i64> [#uses=1]
	%tmp325 = getelementptr %struct.regobj** %tmp318, i64 %tmp321324		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp90, %struct.regobj** %tmp325, align 8
	%tmp328 = load i32* %tmp255, align 8		; <i32> [#uses=1]
	%tmp329 = add i32 %tmp328, 1		; <i32> [#uses=1]
	store i32 %tmp329, i32* %tmp255, align 8
	br label %bb337

bb337:		; preds = %cond_next315, %bb135, %bb100
	%tmp336 = add i32 %x1.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp341 = icmp slt i32 %tmp339405, %tmp336		; <i1> [#uses=1]
	%indvar.next419 = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp341, label %bb347, label %bb100

bb347:		; preds = %bb337
	%tmp346 = add i32 %y1.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp351 = icmp slt i32 %tmp349400, %tmp346		; <i1> [#uses=1]
	%indvar.next424 = add i32 %indvar423, 1		; <i32> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %tmp351, label %bb355, label %bb97

bb355:		; preds = %bb347, %bb97.preheader, %bb67
	%tmp357 = add i32 %indvar420, 2		; <i32> [#uses=1]
	%tmp361 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp362 = add i32 %tmp361, -1		; <i32> [#uses=1]
	%tmp364 = icmp slt i32 %tmp362, %tmp357		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp364, label %bb367, label %bb67

bb367:		; preds = %bb358.preheader, %bb355
	%tmp369 = add i32 %indvar425, 2		; <i32> [#uses=1]
	%tmp373 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp374 = add i32 %tmp373, -1		; <i32> [#uses=1]
	%tmp376 = icmp slt i32 %tmp374, %tmp369		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp376, label %return, label %bb358.preheader

bb370.preheader:		; preds = %bb56, %bb33
	%tmp373415 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp374416 = add i32 %tmp373415, -1		; <i32> [#uses=1]
	%tmp376417 = icmp slt i32 %tmp374416, 1		; <i1> [#uses=1]
	br i1 %tmp376417, label %return, label %bb358.preheader

bb358.preheader:		; preds = %bb370.preheader, %bb367
	%indvar425 = phi i32 [ %y.0413, %bb367 ], [ 0, %bb370.preheader ]		; <i32> [#uses=5]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 62, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 62 )
	%y.0413 = add i32 %indvar425, 1		; <i32> [#uses=2]
	%tmp361410 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp362411 = add i32 %tmp361410, -1		; <i32> [#uses=1]
	%tmp364412 = icmp slt i32 %tmp362411, 1		; <i1> [#uses=1]
	br i1 %tmp364412, label %bb367, label %bb.nph

return:		; preds = %bb370.preheader, %bb367
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 16, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 16 )
	%tmp2 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=2]
	%tmp3 = shl i32 %tmp2, 1		; <i32> [#uses=4]
	%tmp7 = malloc %struct.regobj*, i32 %tmp3		; <%struct.regobj**> [#uses=2]
	%tmpcast218 = bitcast %struct.regobj** %tmp7 to i8*		; <i8*> [#uses=1]
	%tmp1112 = sext i32 %tmp2 to i64		; <i64> [#uses=1]
	%tmp13 = shl i64 %tmp1112, 3		; <i64> [#uses=1]
	%tmp16 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1619 = bitcast %struct.regobj** %tmp16 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 16, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast218, i8* %tmp1619, i64 %tmp13, i32 8 )
	%tmp22 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp22
	store %struct.regobj** %tmp7, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8
	%tmp34 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 2), align 8		; <i32> [#uses=2]
	%tmp35 = shl i32 %tmp34, 1		; <i32> [#uses=2]
	%tmp43 = malloc i32, i32 %tmp35		; <i32*> [#uses=2]
	%tmpcast216 = bitcast i32* %tmp43 to i8*		; <i8*> [#uses=1]
	%tmp5152 = sext i32 %tmp34 to i64		; <i64> [#uses=1]
	%tmp53 = shl i64 %tmp5152, 2		; <i64> [#uses=1]
	%tmp56 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp5659 = bitcast i32* %tmp56 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 16, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast216, i8* %tmp5659, i64 %tmp53, i32 4 )
	%tmp62 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp62
	store i32* %tmp43, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8
	store i32 %tmp35, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 2), align 8
	%tmp81 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 2), align 8		; <i32> [#uses=2]
	%tmp82 = shl i32 %tmp81, 1		; <i32> [#uses=2]
	%tmp92 = malloc i32, i32 %tmp82		; <i32*> [#uses=2]
	%tmpcast214 = bitcast i32* %tmp92 to i8*		; <i8*> [#uses=1]
	%tmp102103 = sext i32 %tmp81 to i64		; <i64> [#uses=1]
	%tmp104 = shl i64 %tmp102103, 2		; <i64> [#uses=1]
	%tmp107 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp107110 = bitcast i32* %tmp107 to i8*		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 16, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast214, i8* %tmp107110, i64 %tmp104, i32 4 )
	%tmp114 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp114
	store i32* %tmp92, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8
	store i32 %tmp82, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 2), align 8
	%tmp126 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=3]
	%tmp197222 = icmp slt i32 %tmp126, %tmp3		; <i1> [#uses=1]
	br i1 %tmp197222, label %bb127.preheader, label %bb200

bb127.preheader:		; preds = %entry
	%tmp225 = sub i32 %tmp3, %tmp126		; <i32> [#uses=2]
	%tmp226 = add i32 %tmp225, -1		; <i32> [#uses=1]
	%tmp227 = icmp slt i32 %tmp226, 0		; <i1> [#uses=1]
	%tmp228 = select i1 %tmp227, i32 1, i32 %tmp225		; <i32> [#uses=1]
	br label %bb127

bb127:		; preds = %cond_next176, %bb127.preheader
	%indvar = phi i32 [ 0, %bb127.preheader ], [ %indvar.next, %cond_next176 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 67, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 67 )
	%i.0.reg2mem.0 = add i32 %indvar, %tmp126		; <i32> [#uses=1]
	%tmp134 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp137 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8		; <i32> [#uses=3]
	%tmp138 = icmp eq i32 %tmp134, %tmp137		; <i1> [#uses=1]
	br i1 %tmp138, label %cond_true141, label %cond_next176

cond_true141:		; preds = %bb127
	%tmp149 = shl i32 %tmp137, 1		; <i32> [#uses=2]
	%tmp153 = malloc i32, i32 %tmp149		; <i32*> [#uses=2]
	%tmpcast = bitcast i32* %tmp153 to i8*		; <i8*> [#uses=1]
	%tmp157158 = sext i32 %tmp137 to i64		; <i64> [#uses=1]
	%tmp159 = shl i64 %tmp157158, 2		; <i64> [#uses=1]
	%tmp162 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp162165 = bitcast i32* %tmp162 to i8*		; <i8*> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 16, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 67, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp162165, i64 %tmp159, i32 4 )
	%tmp168 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	free i32* %tmp168
	store i32* %tmp153, i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8
	store i32 %tmp149, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 2), align 8
	br label %cond_next176

cond_next176:		; preds = %cond_true141, %bb127
	%tmp179 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp182 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp182183 = sext i32 %tmp182 to i64		; <i64> [#uses=1]
	%tmp184 = getelementptr i32* %tmp179, i64 %tmp182183		; <i32*> [#uses=1]
	store i32 %i.0.reg2mem.0, i32* %tmp184, align 4
	%tmp188 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp189 = add i32 %tmp188, 1		; <i32> [#uses=1]
	store i32 %tmp189, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, %tmp228		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb200, label %bb127

bb200:		; preds = %cond_next176, %entry
	store i32 %tmp3, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare i8* @_Znwm(i64)

define internal fastcc void @_ZN6regobj6createEii(%struct.regobj* %this, i32 %x0, i32 %y0) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 17, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 17 )
	%tmp3 = getelementptr %struct.regobj* %this, i32 0, i32 5, i32 0		; <i32*> [#uses=2]
	store i32 %x0, i32* %tmp3, align 8
	%tmp7 = getelementptr %struct.regobj* %this, i32 0, i32 5, i32 1		; <i32*> [#uses=2]
	store i32 %y0, i32* %tmp7, align 8
	%tmp10 = getelementptr %struct.regobj* %this, i32 0, i32 4		; <i32*> [#uses=3]
	store i32 0, i32* %tmp10, align 8
	store i32 128, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 2), align 16
	store i32 0, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 16
	%tmp23273 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp23273.sub = getelementptr [128 x %struct.pointt]* %tmp23273, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	store %struct.pointt* %tmp23273.sub, %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16
	store i32 128, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 2), align 16
	store i32 0, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 1), align 16
	%tmp43272 = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp43272.sub = getelementptr [128 x %struct.pointt]* %tmp43272, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	store %struct.pointt* %tmp43272.sub, %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 0), align 16
	%tmp55 = getelementptr %struct.regobj* %this, i32 0, i32 9, i32 2		; <i32*> [#uses=1]
	store i32 4, i32* %tmp55, align 8
	%tmp58 = getelementptr %struct.regobj* %this, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp58, align 8
	%tmp70271 = malloc [4 x %struct.regobj*]		; <[4 x %struct.regobj*]*> [#uses=1]
	%tmp70271.sub = getelementptr [4 x %struct.regobj*]* %tmp70271, i32 0, i32 0		; <%struct.regobj**> [#uses=1]
	%tmp76 = getelementptr %struct.regobj* %this, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	store %struct.regobj** %tmp70271.sub, %struct.regobj*** %tmp76, align 8
	%tmp78 = add i32 %x0, -1		; <i32> [#uses=2]
	%tmp80 = add i32 %y0, -1		; <i32> [#uses=2]
	%tmp82 = add i32 %x0, 1		; <i32> [#uses=2]
	%tmp84 = add i32 %y0, 1		; <i32> [#uses=2]
	%tmp86 = icmp slt i32 %tmp78, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp86, i32 0, i32 %tmp78		; <i32> [#uses=1]
	%tmp89 = icmp slt i32 %tmp80, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp89, i32 0, i32 %tmp80		; <i32> [#uses=3]
	%tmp95 = getelementptr %struct.regobj* %this, i32 0, i32 3		; <%struct.regmngobj**> [#uses=3]
	%tmp96 = load %struct.regmngobj** %tmp95, align 8		; <%struct.regmngobj*> [#uses=2]
	%tmp97 = getelementptr %struct.regmngobj* %tmp96, i32 0, i32 12		; <i32*> [#uses=1]
	%tmp98 = load i32* %tmp97, align 8		; <i32> [#uses=2]
	%tmp100 = icmp slt i32 %tmp98, %tmp82		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp100, i32 %tmp98, i32 %tmp82		; <i32> [#uses=2]
	%tmp113 = getelementptr %struct.regmngobj* %tmp96, i32 0, i32 13		; <i32*> [#uses=1]
	%tmp114 = load i32* %tmp113, align 8		; <i32> [#uses=3]
	%tmp116 = icmp slt i32 %tmp114, %tmp84		; <i1> [#uses=1]
	br i1 %tmp116, label %cond_true119, label %bb175

cond_true119:		; preds = %entry
	%tmp178250 = icmp sgt i32 %y1.0, %tmp114		; <i1> [#uses=1]
	br i1 %tmp178250, label %bb181, label %bb166.preheader

bb166.preheader:		; preds = %bb175, %cond_true119
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp114, %cond_true119 ], [ %y2.0, %bb175 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true119 ], [ %y.0, %bb175 ]		; <i32> [#uses=5]
	br label %bb166

bb129:		; preds = %bb166, %cond_next152.i
	%indvar = phi i32 [ %indvar.next, %cond_next152.i ], [ 0, %bb166 ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 70, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 70 )
	%x.0.reg2mem.0 = add i32 %indvar, %x.0		; <i32> [#uses=6]
	%tmp132 = load %struct.regmngobj** %tmp95, align 8		; <%struct.regmngobj*> [#uses=5]
	%tmp140 = getelementptr %struct.regmngobj* %tmp132, i32 0, i32 6		; <%struct.regobj***> [#uses=1]
	%tmp141 = load %struct.regobj*** %tmp140, align 8		; <%struct.regobj**> [#uses=1]
	%tmp143 = getelementptr %struct.regmngobj* %tmp132, i32 0, i32 16		; <i32*> [#uses=1]
	%tmp144 = load i32* %tmp143, align 8		; <i32> [#uses=1]
	%tmp146 = mul i32 %tmp144, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp148 = add i32 %tmp146, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp148149 = sext i32 %tmp148 to i64		; <i64> [#uses=2]
	%tmp150 = getelementptr %struct.regobj** %tmp141, i64 %tmp148149		; <%struct.regobj**> [#uses=1]
	%tmp154 = load %struct.regobj** %tmp150, align 8		; <%struct.regobj*> [#uses=1]
	%tmp155 = icmp eq %struct.regobj* %tmp154, null		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp155, label %cond_true159, label %cond_next163

cond_true159:		; preds = %bb129
	%tmp19.i = getelementptr %struct.regmngobj* %tmp132, i32 0, i32 7		; <i8**> [#uses=1]
	%tmp20.i = load i8** %tmp19.i, align 8		; <i8*> [#uses=1]
	%tmp29.i = getelementptr i8* %tmp20.i, i64 %tmp148149		; <i8*> [#uses=1]
	%tmp30.i = load i8* %tmp29.i, align 1		; <i8> [#uses=1]
	%tmp33343537.i = zext i8 %tmp30.i to i64		; <i64> [#uses=1]
	%tmp38.i = getelementptr %struct.regmngobj* %tmp132, i32 0, i32 8, i64 %tmp33343537.i		; <i8*> [#uses=1]
	%tmp39.i = load i8* %tmp38.i, align 1		; <i8> [#uses=1]
	%toBool.i = icmp eq i8 %tmp39.i, 0		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %toBool.i, label %cond_next163, label %cond_true.i

cond_true.i:		; preds = %cond_true159
	%tmp44.i = load i32* %tmp3, align 8		; <i32> [#uses=1]
	%tmp46.i = sub i32 %x.0.reg2mem.0, %tmp44.i		; <i32> [#uses=2]
	%tmp51.i = mul i32 %tmp46.i, %tmp46.i		; <i32> [#uses=1]
	%tmp57.i = load i32* %tmp7, align 8		; <i32> [#uses=1]
	%tmp59.i = sub i32 %y.0.reg2mem.0.ph, %tmp57.i		; <i32> [#uses=2]
	%tmp64.i = mul i32 %tmp59.i, %tmp59.i		; <i32> [#uses=1]
	%tmp69.i = add i32 %tmp64.i, %tmp51.i		; <i32> [#uses=1]
	%tmp6970.i = sitofp i32 %tmp69.i to float		; <float> [#uses=1]
	%tmp74.i = add float %tmp6970.i, 5.000000e-01		; <float> [#uses=1]
	%tmp7475.i = fptosi float %tmp74.i to i32		; <i32> [#uses=1]
	%tmp81.i = getelementptr %struct.regmngobj* %tmp132, i32 0, i32 10		; <i32*> [#uses=1]
	%tmp82.i = load i32* %tmp81.i, align 8		; <i32> [#uses=1]
	%tmp84.i = icmp sgt i32 %tmp7475.i, %tmp82.i		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp84.i, label %cond_next163, label %cond_true88.i

cond_true88.i:		; preds = %cond_true.i
	%tmp100.i = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp103.i = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 2), align 8		; <i32> [#uses=3]
	%tmp104.i = icmp eq i32 %tmp100.i, %tmp103.i		; <i1> [#uses=1]
	br i1 %tmp104.i, label %cond_true107.i, label %cond_next152.i

cond_true107.i:		; preds = %cond_true88.i
	%tmp114.i = shl i32 %tmp103.i, 1		; <i32> [#uses=2]
	%tmp122.i = malloc %struct.pointt, i32 %tmp114.i		; <%struct.pointt*> [#uses=2]
	%tmpcast.i = bitcast %struct.pointt* %tmp122.i to i8*		; <i8*> [#uses=1]
	%tmp132133.i = sext i32 %tmp103.i to i64		; <i64> [#uses=1]
	%tmp134.i = shl i64 %tmp132133.i, 3		; <i64> [#uses=1]
	%tmp137.i = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	%tmp137140.i = bitcast %struct.pointt* %tmp137.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 17, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 69, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 70, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp137140.i, i64 %tmp134.i, i32 4 ) nounwind 
	%tmp143.i = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp143.i
	store %struct.pointt* %tmp122.i, %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16
	store i32 %tmp114.i, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 2), align 8
	br label %cond_next152.i

cond_next152.i:		; preds = %cond_true107.i, %cond_true88.i
	%tmp155.i = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=2]
	%tmp158.i = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp158166.i = sext i32 %tmp158.i to i64		; <i64> [#uses=2]
	%tmp168.i = getelementptr %struct.pointt* %tmp155.i, i64 %tmp158166.i, i32 0		; <i32*> [#uses=1]
	store i32 %x.0.reg2mem.0, i32* %tmp168.i, align 4
	%tmp171.i = getelementptr %struct.pointt* %tmp155.i, i64 %tmp158166.i, i32 1		; <i32*> [#uses=1]
	store i32 %y.0.reg2mem.0.ph, i32* %tmp171.i, align 4
	%tmp176.i = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp177.i = add i32 %tmp176.i, 1		; <i32> [#uses=1]
	store i32 %tmp177.i, i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 8
	%tmp182.i = load %struct.regmngobj** %tmp95, align 8		; <%struct.regmngobj*> [#uses=2]
	%tmp190.i = getelementptr %struct.regmngobj* %tmp182.i, i32 0, i32 6		; <%struct.regobj***> [#uses=1]
	%tmp191.i = load %struct.regobj*** %tmp190.i, align 8		; <%struct.regobj**> [#uses=1]
	%tmp193.i = getelementptr %struct.regmngobj* %tmp182.i, i32 0, i32 16		; <i32*> [#uses=1]
	%tmp194.i = load i32* %tmp193.i, align 8		; <i32> [#uses=1]
	%tmp196.i = mul i32 %tmp194.i, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp198.i = add i32 %tmp196.i, %x.0.reg2mem.0		; <i32> [#uses=1]
	%tmp198199.i = sext i32 %tmp198.i to i64		; <i64> [#uses=1]
	%tmp200.i = getelementptr %struct.regobj** %tmp191.i, i64 %tmp198199.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %this, %struct.regobj** %tmp200.i, align 8
	%tmp207.i = load i32* %tmp10, align 8		; <i32> [#uses=1]
	%tmp208.i = add i32 %tmp207.i, 1		; <i32> [#uses=1]
	store i32 %tmp208.i, i32* %tmp10, align 8
	%tmp165251 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	%tmp169260 = icmp sgt i32 %tmp165251, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp169260, label %bb172, label %bb129

cond_next163:		; preds = %cond_true.i, %cond_true159, %bb129
	%tmp165 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=1]
	br label %bb166

bb166:		; preds = %cond_next163, %bb166.preheader
	%x.0 = phi i32 [ %tmp165, %cond_next163 ], [ %x1.0, %bb166.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 69, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 69 )
	%tmp169 = icmp sgt i32 %x.0, %x2.0		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp169, label %bb172, label %bb129

bb172:		; preds = %bb166, %cond_next152.i
	%tmp174 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb175

bb175:		; preds = %bb172, %entry
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb172 ], [ %tmp84, %entry ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp174, %bb172 ], [ %y1.0, %entry ]		; <i32> [#uses=2]
	%tmp178 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp178, label %bb181, label %bb166.preheader

bb181:		; preds = %bb175, %cond_true119
	%tmp183 = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 16		; <i32> [#uses=2]
	store i32 %tmp183, i32* @_ZN6regobj6boundlE, align 4
	%tmp185 = icmp eq i32 %tmp183, 0		; <i1> [#uses=1]
	%tmp190 = getelementptr %struct.regobj* %this, i32 0, i32 1		; <i8*> [#uses=2]
	br i1 %tmp185, label %cond_false, label %cond_true188

cond_true188:		; preds = %bb181
	store i8 1, i8* %tmp190, align 8
	br label %cond_true209

cond_false:		; preds = %bb181
	store i8 0, i8* %tmp190, align 8
	%tmp194 = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp194
	%tmp198 = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp198
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void

cond_true209:		; preds = %cond_false213.critedge, %cond_true188
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 68, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 68 )
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 17, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 68, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN6regobj10makebound2ER9flexarrayI6pointtES3_( %struct.regobj* %this, %struct.boundart* @_ZN6regobj9bound1arpE, %struct.boundart* @_ZN6regobj9bound2arpE )
	%storemerge263 = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 1), align 4		; <i32> [#uses=2]
	store i32 %storemerge263, i32* @_ZN6regobj6boundlE, align 4
	%tmp221266 = icmp eq i32 %storemerge263, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp221266, label %bb224, label %cond_false213.critedge

cond_false213.critedge:		; preds = %cond_true209
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 17, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 68, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN6regobj10makebound2ER9flexarrayI6pointtES3_( %struct.regobj* %this, %struct.boundart* @_ZN6regobj9bound2arpE, %struct.boundart* @_ZN6regobj9bound1arpE )
	%storemerge = load i32* getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 1), align 4		; <i32> [#uses=2]
	store i32 %storemerge, i32* @_ZN6regobj6boundlE, align 4
	%tmp221 = icmp eq i32 %storemerge, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp221, label %bb224, label %cond_true209

bb224:		; preds = %cond_false213.critedge, %cond_true209
	%tmp226 = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound1arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp226
	%tmp231 = load %struct.pointt** getelementptr (%struct.boundart* @_ZN6regobj9bound2arpE, i32 0, i32 0), align 16		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp231
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN9regmngobj13createregionsEi(i32 %regionl) {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 18, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 18 )
	%x.i = alloca i32		; <i32*> [#uses=4]
	%y.i = alloca i32		; <i32*> [#uses=4]
	%x413 = alloca i32		; <i32*> [#uses=2]
	%y414 = alloca i32		; <i32*> [#uses=2]
	%x785 = alloca i32		; <i32*> [#uses=2]
	%y786 = alloca i32		; <i32*> [#uses=2]
	%tmp10 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp13 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp14 = mul i32 %tmp13, %tmp10		; <i32> [#uses=1]
	%tmp1415 = sext i32 %tmp14 to i64		; <i64> [#uses=1]
	%tmp16 = shl i64 %tmp1415, 3		; <i64> [#uses=1]
	%tmp19 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp1920 = bitcast %struct.regobj** %tmp19 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp1920, i8 0, i64 %tmp16, i32 8 )
	%tmp22 = icmp slt i32 %regionl, 6		; <i1> [#uses=1]
	%regionl_addr.0 = select i1 %tmp22, i32 6, i32 %regionl		; <i32> [#uses=2]
	%tmp26 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp27 = sdiv i32 %tmp26, 5		; <i32> [#uses=2]
	%tmp29 = icmp slt i32 %tmp27, %regionl_addr.0		; <i1> [#uses=1]
	%regionl_addr.1 = select i1 %tmp29, i32 %tmp27, i32 %regionl_addr.0		; <i32> [#uses=1]
	%tmp3839 = sitofp i32 %regionl_addr.1 to float		; <float> [#uses=1]
	%tmp40 = fdiv float %tmp3839, 2.000000e+01		; <float> [#uses=4]
	store float %tmp40, float* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 11), align 8
	%tmp46 = mul float %tmp40, 1.000000e+01		; <float> [#uses=1]
	%tmp4647 = fptosi float %tmp46 to i32		; <i32> [#uses=3]
	store i32 %tmp4647, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 9), align 8
	%tmp56 = mul i32 %tmp4647, %tmp4647		; <i32> [#uses=1]
	store i32 %tmp56, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 10), align 8
	%tmp23454.i = malloc [16 x %struct.regboundobj]		; <[16 x %struct.regboundobj]*> [#uses=1]
	%tmp23454.sub.i = getelementptr [16 x %struct.regboundobj]* %tmp23454.i, i32 0, i32 0		; <%struct.regboundobj*> [#uses=1]
	%tmp30.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=2]
	%tmp3031.i = sitofp i32 %tmp30.i to float		; <float> [#uses=1]
	%tmp32.i = fdiv float %tmp3031.i, 6.200000e+02		; <float> [#uses=1]
	%tmp33.i = mul float %tmp32.i, 3.400000e+01		; <float> [#uses=1]
	%tmp37.i = fdiv float %tmp33.i, %tmp40		; <float> [#uses=1]
	%tmp41.i = add float %tmp37.i, 5.000000e-01		; <float> [#uses=1]
	%tmp4142.i = fptosi float %tmp41.i to i32		; <i32> [#uses=3]
	%tmp48.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=2]
	%tmp4849.i = sitofp i32 %tmp48.i to float		; <float> [#uses=1]
	%tmp50.i = fdiv float %tmp4849.i, 3.090000e+02		; <float> [#uses=1]
	%tmp51.i = mul float %tmp50.i, 2.000000e+01		; <float> [#uses=1]
	%tmp55.i = fdiv float %tmp51.i, %tmp40		; <float> [#uses=1]
	%tmp59.i = add float %tmp55.i, 5.000000e-01		; <float> [#uses=1]
	%tmp5960.i = fptosi float %tmp59.i to i32		; <i32> [#uses=1]
	%tmp67.i = add i32 %tmp30.i, 1		; <i32> [#uses=1]
	%tmp6768.i = sitofp i32 %tmp67.i to float		; <float> [#uses=1]
	%tmp6970.i = sitofp i32 %tmp4142.i to float		; <float> [#uses=1]
	%tmp71.i = fdiv float %tmp6768.i, %tmp6970.i		; <float> [#uses=1]
	%tmp75.i = add float %tmp71.i, 5.000000e-01		; <float> [#uses=1]
	%tmp7576.i = fptosi float %tmp75.i to i32		; <i32> [#uses=4]
	%tmp83.i = add i32 %tmp48.i, 1		; <i32> [#uses=1]
	%tmp8384.i = sitofp i32 %tmp83.i to float		; <float> [#uses=1]
	%tmp8586.i = sitofp i32 %tmp5960.i to float		; <float> [#uses=2]
	%tmp87.i = fdiv float %tmp8384.i, %tmp8586.i		; <float> [#uses=1]
	%tmp8788.i = fpext float %tmp87.i to double		; <double> [#uses=1]
	%tmp89.i = mul double %tmp8788.i, 0x3FFBB67AE8584CAA		; <double> [#uses=1]
	%tmp90.i = mul double %tmp89.i, 5.000000e-01		; <double> [#uses=1]
	%tmp9091.i = fptrunc double %tmp90.i to float		; <float> [#uses=1]
	%tmp95.i = add float %tmp9091.i, 5.000000e-01		; <float> [#uses=1]
	%tmp9596.i = fptosi float %tmp95.i to i32		; <i32> [#uses=2]
	%tmp116.i = sdiv i32 %tmp9596.i, 2		; <i32> [#uses=1]
	%tmp344.i = add i32 %tmp4142.i, -1		; <i32> [#uses=1]
	%tmp366.i = mul float %tmp8586.i, 2.000000e+00		; <float> [#uses=1]
	%tmp366367.i = fpext float %tmp366.i to double		; <double> [#uses=1]
	%tmp368.i = fdiv double %tmp366367.i, 0x3FFBB67AE8584CAA		; <double> [#uses=1]
	%tmp368369.i = fptrunc double %tmp368.i to float		; <float> [#uses=1]
	%tmp373.i = add float %tmp368369.i, 5.000000e-01		; <float> [#uses=1]
	%tmp373374.i = fptosi float %tmp373.i to i32		; <i32> [#uses=1]
	%tmp378.i = add i32 %tmp373374.i, 3		; <i32> [#uses=1]
	br label %bb100.i

bb100.i:		; preds = %cond_next363.i, %entry
	%rboundarp.2.2.i = phi i32 [ 16, %entry ], [ %rboundarp.2.1.i, %cond_next363.i ]		; <i32> [#uses=6]
	%rboundarp.1.1.i = phi i32 [ 0, %entry ], [ %rboundarp.1.0.i, %cond_next363.i ]		; <i32> [#uses=4]
	%rboundarp.0.2.i = phi %struct.regboundobj* [ %tmp23454.sub.i, %entry ], [ %rboundarp.0.1.i, %cond_next363.i ]		; <%struct.regboundobj*> [#uses=5]
	%i1.0.i = phi i32 [ 0, %entry ], [ %i1.1.i, %cond_next363.i ]		; <i32> [#uses=3]
	%i2.1.i = phi i32 [ 0, %entry ], [ %i2.0.i, %cond_next363.i ]		; <i32> [#uses=6]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 71, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 71 )
	%tmp102103452.i = and i32 %i2.1.i, 1		; <i32> [#uses=1]
	%toBool.i = icmp eq i32 %tmp102103452.i, 0		; <i1> [#uses=2]
	br i1 %toBool.i, label %cond_false.i, label %cond_true.i

cond_true.i:		; preds = %bb100.i
	%tmp106.i = mul i32 %i1.0.i, %tmp7576.i		; <i32> [#uses=1]
	br label %cond_next.i

cond_false.i:		; preds = %bb100.i
	%tmp110.i = sdiv i32 %tmp7576.i, 2		; <i32> [#uses=1]
	%tmp113.i = mul i32 %i1.0.i, %tmp7576.i		; <i32> [#uses=1]
	br label %cond_next.i

cond_next.i:		; preds = %cond_false.i, %cond_true.i
	%tmp110.pn.i = phi i32 [ %tmp110.i, %cond_false.i ], [ %tmp106.i, %cond_true.i ]		; <i32> [#uses=1]
	%tmp113.pn.i = phi i32 [ %tmp113.i, %cond_false.i ], [ %tmp7576.i, %cond_true.i ]		; <i32> [#uses=1]
	%xx.0.i = add i32 %tmp113.pn.i, %tmp110.pn.i		; <i32> [#uses=1]
	%tmp119.i = mul i32 %i2.1.i, %tmp9596.i		; <i32> [#uses=1]
	%tmp120.i = add i32 %tmp116.i, %tmp119.i		; <i32> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 71, i32* @cg_caller_id_var, align 4
	%tmp124.i = call fastcc i8 @_ZN9regmngobj13findfreeplaceEiiRiS0_( i32 %xx.0.i, i32 %tmp120.i, i32* %x.i, i32* %y.i ) zeroext 		; <i8> [#uses=1]
	%tmp126.i = icmp eq i8 %tmp124.i, 0		; <i1> [#uses=1]
	br i1 %tmp126.i, label %next.i, label %cond_false131.i

cond_false131.i:		; preds = %cond_next.i
	%tmp132.i = load i32* %y.i, align 4		; <i32> [#uses=1]
	%tmp133.i = load i32* %x.i, align 4		; <i32> [#uses=1]
	%tmp141.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp144.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp146.i = mul i32 %tmp144.i, %tmp132.i		; <i32> [#uses=1]
	%tmp148.i = add i32 %tmp146.i, %tmp133.i		; <i32> [#uses=1]
	%tmp148149.i = sext i32 %tmp148.i to i64		; <i64> [#uses=1]
	%tmp150.i = getelementptr %struct.regobj** %tmp141.i, i64 %tmp148149.i		; <%struct.regobj**> [#uses=1]
	%tmp154.i = load %struct.regobj** %tmp150.i, align 8		; <%struct.regobj*> [#uses=1]
	%tmp155.i = icmp eq %struct.regobj* %tmp154.i, null		; <i1> [#uses=1]
	br i1 %tmp155.i, label %cond_next161.i, label %next.i

cond_next161.i:		; preds = %cond_false131.i
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 71, i32* @cg_caller_id_var, align 4
	%tmp162.i = call i8* @_Znwm( i64 56 )		; <i8*> [#uses=2]
	%tmp162163.i = bitcast i8* %tmp162.i to %struct.regobj*		; <%struct.regobj*> [#uses=9]
	%tmp171.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 3		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp171.i, align 8
	%tmp182.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp185.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp186.i = icmp eq i32 %tmp182.i, %tmp185.i		; <i1> [#uses=1]
	br i1 %tmp186.i, label %cond_true189.i, label %cond_next191.i

cond_true189.i:		; preds = %cond_next161.i
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 71, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv( )
	br label %cond_next191.i

cond_next191.i:		; preds = %cond_true189.i, %cond_next161.i
	%tmp194.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp197.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp197200.i = sext i32 %tmp197.i to i64		; <i64> [#uses=1]
	%tmp201.i = getelementptr %struct.regobj** %tmp194.i, i64 %tmp197200.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp162163.i, %struct.regobj** %tmp201.i, align 8
	%tmp208.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp209.i = add i32 %tmp208.i, -1		; <i32> [#uses=2]
	store i32 %tmp209.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp214.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp217218.i = sext i32 %tmp209.i to i64		; <i64> [#uses=1]
	%tmp219.i = getelementptr i32* %tmp214.i, i64 %tmp217218.i		; <i32*> [#uses=1]
	%tmp220.i = load i32* %tmp219.i, align 4		; <i32> [#uses=3]
	%tmp227.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp230.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp231232.i = sext i32 %tmp220.i to i64		; <i64> [#uses=1]
	%tmp233.i = getelementptr i32* %tmp227.i, i64 %tmp231232.i		; <i32*> [#uses=1]
	store i32 %tmp230.i, i32* %tmp233.i, align 4
	%tmp237.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp240.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp240241.i = sext i32 %tmp240.i to i64		; <i64> [#uses=1]
	%tmp242.i = getelementptr i32* %tmp237.i, i64 %tmp240241.i		; <i32*> [#uses=1]
	store i32 %tmp220.i, i32* %tmp242.i, align 4
	%tmp246.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp247.i = add i32 %tmp246.i, 1		; <i32> [#uses=1]
	store i32 %tmp247.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp253.i = bitcast i8* %tmp162.i to i32*		; <i32*> [#uses=1]
	store i32 %tmp220.i, i32* %tmp253.i, align 8
	%tmp5.i.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 9, i32 2		; <i32*> [#uses=1]
	store i32 4, i32* %tmp5.i.i, align 8
	%tmp8.i.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp8.i.i, align 8
	%tmp1827.i.i = malloc [4 x %struct.regobj*]		; <[4 x %struct.regobj*]*> [#uses=1]
	%tmp1827.sub.i.i = getelementptr [4 x %struct.regobj*]* %tmp1827.i.i, i32 0, i32 0		; <%struct.regobj**> [#uses=1]
	%tmp23.i.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	store %struct.regobj** %tmp1827.sub.i.i, %struct.regobj*** %tmp23.i.i, align 8
	%tmp25.i.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 1		; <i8*> [#uses=1]
	store i8 1, i8* %tmp25.i.i, align 8
	%tmp259.i = load i32* %x.i, align 4		; <i32> [#uses=1]
	%tmp261.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	store i32 %tmp259.i, i32* %tmp261.i, align 8
	%tmp263.i = load i32* %y.i, align 4		; <i32> [#uses=1]
	%tmp265.i = getelementptr %struct.regobj* %tmp162163.i, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	store i32 %tmp263.i, i32* %tmp265.i, align 8
	%tmp271.i = icmp eq i32 %rboundarp.1.1.i, %rboundarp.2.2.i		; <i1> [#uses=1]
	br i1 %tmp271.i, label %cond_true274.i, label %cond_next314.i

cond_true274.i:		; preds = %cond_next191.i
	%tmp278.i = shl i32 %rboundarp.2.2.i, 1		; <i32> [#uses=2]
	%tmp288.i = malloc %struct.regboundobj, i32 %tmp278.i		; <%struct.regboundobj*> [#uses=2]
	%tmpcast.i = bitcast %struct.regboundobj* %tmp288.i to i8*		; <i8*> [#uses=1]
	%tmp297298.i = sext i32 %rboundarp.2.2.i to i64		; <i64> [#uses=1]
	%tmp299.i = mul i64 %tmp297298.i, 112		; <i64> [#uses=1]
	%tmp301304.i = bitcast %struct.regboundobj* %rboundarp.0.2.i to i8*		; <i8*> [#uses=1]
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 71, i32* @cg_caller_id_var, align 4
	call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp301304.i, i64 %tmp299.i, i32 8 )
	free %struct.regboundobj* %rboundarp.0.2.i
	br label %cond_next314.i

cond_next314.i:		; preds = %cond_true274.i, %cond_next191.i
	%rboundarp.2.0.i = phi i32 [ %tmp278.i, %cond_true274.i ], [ %rboundarp.2.2.i, %cond_next191.i ]		; <i32> [#uses=1]
	%rboundarp.0.0.i = phi %struct.regboundobj* [ %tmp288.i, %cond_true274.i ], [ %rboundarp.0.2.i, %cond_next191.i ]		; <%struct.regboundobj*> [#uses=3]
	%tmp317.i = add i32 %rboundarp.1.1.i, 1		; <i32> [#uses=2]
	%tmp322323.i = sext i32 %tmp317.i to i64		; <i64> [#uses=1]
	%tmp324.sum.i = add i64 %tmp322323.i, -1		; <i64> [#uses=2]
	%tmp325.i = getelementptr %struct.regboundobj* %rboundarp.0.0.i, i64 %tmp324.sum.i		; <%struct.regboundobj*> [#uses=1]
	%tmp330.i = getelementptr %struct.regboundobj* %rboundarp.0.0.i, i64 %tmp324.sum.i, i32 16		; <i8*> [#uses=1]
	store i8 1, i8* %tmp330.i, align 8
	%tmp332.i = load i32* %y.i, align 4		; <i32> [#uses=1]
	%tmp333.i = load i32* %x.i, align 4		; <i32> [#uses=1]
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 71, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN11regboundobj9firststepEiiP6regobjP9regmngobj( %struct.regboundobj* %tmp325.i, i32 %tmp333.i, i32 %tmp332.i, %struct.regobj* %tmp162163.i )
	br label %next.i

next.i:		; preds = %cond_next314.i, %cond_false131.i, %cond_next.i
	%rboundarp.2.1.i = phi i32 [ %rboundarp.2.0.i, %cond_next314.i ], [ %rboundarp.2.2.i, %cond_next.i ], [ %rboundarp.2.2.i, %cond_false131.i ]		; <i32> [#uses=1]
	%rboundarp.1.0.i = phi i32 [ %tmp317.i, %cond_next314.i ], [ %rboundarp.1.1.i, %cond_next.i ], [ %rboundarp.1.1.i, %cond_false131.i ]		; <i32> [#uses=4]
	%rboundarp.0.1.i = phi %struct.regboundobj* [ %rboundarp.0.0.i, %cond_next314.i ], [ %rboundarp.0.2.i, %cond_next.i ], [ %rboundarp.0.2.i, %cond_false131.i ]		; <%struct.regboundobj*> [#uses=5]
	%tmp337.i = add i32 %i1.0.i, 1		; <i32> [#uses=4]
	br i1 %toBool.i, label %cond_false353.i, label %cond_true342.i

cond_true342.i:		; preds = %next.i
	%tmp346.i = icmp eq i32 %tmp344.i, %tmp337.i		; <i1> [#uses=1]
	br i1 %tmp346.i, label %cond_true349.i, label %cond_next363.i

cond_true349.i:		; preds = %cond_true342.i
	%tmp351.i = add i32 %i2.1.i, 1		; <i32> [#uses=1]
	br label %cond_next363.i

cond_false353.i:		; preds = %next.i
	%tmp356.i = icmp eq i32 %tmp337.i, %tmp4142.i		; <i1> [#uses=1]
	br i1 %tmp356.i, label %cond_true359.i, label %cond_next363.i

cond_true359.i:		; preds = %cond_false353.i
	%tmp361.i = add i32 %i2.1.i, 1		; <i32> [#uses=1]
	br label %cond_next363.i

cond_next363.i:		; preds = %cond_true359.i, %cond_false353.i, %cond_true349.i, %cond_true342.i
	%i1.1.i = phi i32 [ 0, %cond_true359.i ], [ 0, %cond_true349.i ], [ %tmp337.i, %cond_true342.i ], [ %tmp337.i, %cond_false353.i ]		; <i32> [#uses=1]
	%i2.0.i = phi i32 [ %tmp361.i, %cond_true359.i ], [ %tmp351.i, %cond_true349.i ], [ %i2.1.i, %cond_true342.i ], [ %i2.1.i, %cond_false353.i ]		; <i32> [#uses=2]
	%tmp380.i = icmp sgt i32 %tmp378.i, %i2.0.i		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp380.i, label %bb100.i, label %bb407.i

bb386.i:		; preds = %bb407.i
	%tmp391392.i = sext i32 %i.0.i to i64		; <i64> [#uses=1]
	%tmp393.i = getelementptr %struct.regboundobj* %rboundarp.0.1.i, i64 %tmp391392.i		; <%struct.regboundobj*> [#uses=1]
	store i32 6, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 72, i32* @cg_caller_id_var, align 4
	%tmp397.i = call fastcc i8 @_ZN11regboundobj4stepEv( %struct.regboundobj* %tmp393.i ) zeroext 		; <i8> [#uses=1]
	%tmp399.i = icmp eq i8 %tmp397.i, 1		; <i1> [#uses=1]
	%fldone.0.i = select i1 %tmp399.i, i8 0, i8 %fldone.1.i		; <i8> [#uses=1]
	%tmp406.i = add i32 %i.0.i, 1		; <i32> [#uses=1]
	br label %bb407.i

bb407.i:		; preds = %bb414.i, %bb386.i, %cond_next363.i
	%i.0.i = phi i32 [ %tmp406.i, %bb386.i ], [ 0, %bb414.i ], [ 0, %cond_next363.i ]		; <i32> [#uses=3]
	%fldone.1.i = phi i8 [ %fldone.0.i, %bb386.i ], [ 1, %bb414.i ], [ 1, %cond_next363.i ]		; <i8> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 72, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 72 )
	%tmp411.i = icmp sgt i32 %rboundarp.1.0.i, %i.0.i		; <i1> [#uses=1]
	br i1 %tmp411.i, label %bb386.i, label %bb414.i

bb414.i:		; preds = %bb407.i
	%tmp417.i = icmp eq i8 %fldone.1.i, 0		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp417.i, label %bb407.i, label %bb435.loopexit.i

bb421.i:		; preds = %bb435.loopexit.i, %bb421.i
	%i.1455.i = phi i32 [ %tmp434.i, %bb421.i ], [ 0, %bb435.loopexit.i ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 73, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 73 )
	%tmp427428.i = sext i32 %i.1455.i to i64		; <i64> [#uses=2]
	%tmp4.i.i = getelementptr %struct.regboundobj* %rboundarp.0.1.i, i64 %tmp427428.i, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp5.i1.i = load %struct.pointt** %tmp4.i.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp5.i1.i
	%tmp12.i.i = getelementptr %struct.regboundobj* %rboundarp.0.1.i, i64 %tmp427428.i, i32 1, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp13.i.i = load %struct.pointt** %tmp12.i.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp13.i.i
	%tmp434.i = add i32 %i.1455.i, 1		; <i32> [#uses=2]
	%tmp439.i = icmp sgt i32 %rboundarp.1.0.i, %tmp434.i		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp439.i, label %bb421.i, label %_ZN9regmngobj13defineregionsEv.exit

bb435.loopexit.i:		; preds = %bb414.i
	%tmp439456.i = icmp sgt i32 %rboundarp.1.0.i, 0		; <i1> [#uses=1]
	br i1 %tmp439456.i, label %bb421.i, label %_ZN9regmngobj13defineregionsEv.exit

_ZN9regmngobj13defineregionsEv.exit:		; preds = %bb435.loopexit.i, %bb421.i
	free %struct.regboundobj* %rboundarp.0.1.i
	%tmp6.i = load float* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 11), align 8		; <float> [#uses=1]
	%tmp67.i1 = fpext float %tmp6.i to double		; <double> [#uses=2]
	%tmp8.i = mul double %tmp67.i1, 1.070000e+02		; <double> [#uses=1]
	%tmp13.i = mul double %tmp8.i, %tmp67.i1		; <double> [#uses=1]
	%tmp1314.i = fptosi double %tmp13.i to i32		; <i32> [#uses=1]
	%tmp37131.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp39133.i = icmp sgt i32 %tmp37131.i, 0		; <i1> [#uses=1]
	br i1 %tmp39133.i, label %bb.i, label %bb103.preheader.i

bb.i:		; preds = %bb.i, %_ZN9regmngobj13defineregionsEv.exit
	%i.0.reg2mem.0.i = phi i32 [ %tmp32.i3, %bb.i ], [ 0, %_ZN9regmngobj13defineregionsEv.exit ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 74, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 74 )
	%tmp22.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp2324.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp25.i = getelementptr %struct.regobj** %tmp22.i, i64 %tmp2324.i		; <%struct.regobj**> [#uses=1]
	%tmp29.i = load %struct.regobj** %tmp25.i, align 8		; <%struct.regobj*> [#uses=1]
	%tmp30.i2 = getelementptr %struct.regobj* %tmp29.i, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 1, i8* %tmp30.i2, align 8
	%tmp32.i3 = add i32 %i.0.reg2mem.0.i, 1		; <i32> [#uses=2]
	%tmp37.i4 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp39.i = icmp sgt i32 %tmp37.i4, %tmp32.i3		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp39.i, label %bb.i, label %bb103.preheader.i

bb42.i:		; preds = %bb103.preheader.i, %cond_next.i10
	%i.1134.i = phi i32 [ %tmp102.i, %cond_next.i10 ], [ 0, %bb103.preheader.i ]		; <i32> [#uses=2]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 75, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 75 )
	%tmp51.i5 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp5253.i = sext i32 %i.1134.i to i64		; <i64> [#uses=2]
	%tmp54.i = getelementptr %struct.regobj** %tmp51.i5, i64 %tmp5253.i		; <%struct.regobj**> [#uses=1]
	%tmp58.i = load %struct.regobj** %tmp54.i, align 8		; <%struct.regobj*> [#uses=2]
	%tmp59.i6 = getelementptr %struct.regobj* %tmp58.i, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp60.i = load i32* %tmp59.i6, align 8		; <i32> [#uses=1]
	%tmp62.i = icmp slt i32 %tmp60.i, %tmp1314.i		; <i1> [#uses=1]
	br i1 %tmp62.i, label %cond_true.i9, label %cond_next.i10

cond_true.i9:		; preds = %bb42.i
	%tmp83.i7 = getelementptr %struct.regobj* %tmp58.i, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 0, i8* %tmp83.i7, align 8
	%tmp92.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp95.i8 = getelementptr %struct.regobj** %tmp92.i, i64 %tmp5253.i		; <%struct.regobj**> [#uses=1]
	%tmp99.i = load %struct.regobj** %tmp95.i8, align 8		; <%struct.regobj*> [#uses=1]
	%tmp100.i = getelementptr %struct.regobj* %tmp99.i, i32 0, i32 1		; <i8*> [#uses=1]
	store i8 0, i8* %tmp100.i, align 8
	br label %cond_next.i10

cond_next.i10:		; preds = %cond_true.i9, %bb42.i
	%tmp102.i = add i32 %i.1134.i, 1		; <i32> [#uses=2]
	%tmp107.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp109.i = icmp sgt i32 %tmp107.i, %tmp102.i		; <i1> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %tmp109.i, label %bb42.i, label %_ZN9regmngobj14enlargeregionsEv.exit

bb103.preheader.i:		; preds = %bb.i, %_ZN9regmngobj13defineregionsEv.exit
	%tmp107136.rle.i = phi i32 [ %tmp37131.i, %_ZN9regmngobj13defineregionsEv.exit ], [ %tmp37.i4, %bb.i ]		; <i32> [#uses=1]
	%tmp109137.i = icmp sgt i32 %tmp107136.rle.i, 0		; <i1> [#uses=1]
	br i1 %tmp109137.i, label %bb42.i, label %_ZN9regmngobj14enlargeregionsEv.exit

_ZN9regmngobj14enlargeregionsEv.exit:		; preds = %bb103.preheader.i, %cond_next.i10
	store i32 7, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj13deleteregionsEv( ) nounwind 
	%tmp116.i11 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp119.i12 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp120.i13 = mul i32 %tmp119.i12, %tmp116.i11		; <i32> [#uses=1]
	%tmp120121.i = sext i32 %tmp120.i13 to i64		; <i64> [#uses=1]
	%tmp122.i = shl i64 %tmp120121.i, 3		; <i64> [#uses=1]
	%tmp125.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp125126.i = bitcast %struct.regobj** %tmp125.i to i8*		; <i8*> [#uses=1]
	store i32 8, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp125126.i, i8 0, i64 %tmp122.i, i32 8 ) nounwind 
	store i32 9, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj15redefineregionsEv( ) nounwind 
	%tmp63 = load float* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 11), align 8		; <float> [#uses=1]
	%tmp64 = mul float %tmp63, 1.900000e+01		; <float> [#uses=1]
	%tmp6465 = fptosi float %tmp64 to i32		; <i32> [#uses=3]
	store i32 %tmp6465, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 9), align 8
	%tmp74 = mul i32 %tmp6465, %tmp6465		; <i32> [#uses=1]
	store i32 %tmp74, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 10), align 8
	%tmp197436.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=2]
	%tmp199437.i = icmp slt i32 %tmp197436.i, 0		; <i1> [#uses=1]
	br i1 %tmp199437.i, label %bb202.i, label %bb183.preheader.i

bb6.i:		; preds = %bb183.preheader.i, %cond_next180.i
	%x.0429.i = phi i32 [ %tmp182.i33, %cond_next180.i ], [ 0, %bb183.preheader.i ]		; <i32> [#uses=3]
	%val337 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val438 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 90, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val337, i32 %val438, i32 90 )
	%tmp16.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp19.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp21.i = mul i32 %tmp19.i, %y.0434.i		; <i32> [#uses=1]
	%tmp23.i = add i32 %tmp21.i, %x.0429.i		; <i32> [#uses=1]
	%tmp2324.i14 = sext i32 %tmp23.i to i64		; <i64> [#uses=2]
	%tmp25.i15 = getelementptr %struct.regobj** %tmp16.i, i64 %tmp2324.i14		; <%struct.regobj**> [#uses=1]
	%tmp29.i16 = load %struct.regobj** %tmp25.i15, align 8		; <%struct.regobj*> [#uses=1]
	%tmp30.i17 = icmp eq %struct.regobj* %tmp29.i16, null		; <i1> [#uses=1]
	br i1 %tmp30.i17, label %cond_true.i20, label %cond_next180.i

cond_true.i20:		; preds = %bb6.i
	%tmp42.i = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp51.i18 = getelementptr i8* %tmp42.i, i64 %tmp2324.i14		; <i8*> [#uses=1]
	%tmp52.i = load i8* %tmp51.i18, align 1		; <i8> [#uses=1]
	%tmp56575861.i = zext i8 %tmp52.i to i64		; <i64> [#uses=1]
	%tmp62.i19 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp56575861.i		; <i8*> [#uses=1]
	%tmp63.i = load i8* %tmp62.i19, align 1		; <i8> [#uses=1]
	%toBool65.i = icmp eq i8 %tmp63.i, 0		; <i1> [#uses=1]
	br i1 %toBool65.i, label %cond_next180.i, label %cond_true66.i

cond_true66.i:		; preds = %cond_true.i20
	%tmp3.i.i = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp4.i.i21 = mul i32 %tmp3.i.i, 171		; <i32> [#uses=1]
	%tmp5.i.i22 = srem i32 %tmp4.i.i21, 30269		; <i32> [#uses=2]
	store i32 %tmp5.i.i22, i32* @y1rnd, align 4
	%tmp6.i.i = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp7.i.i = mul i32 %tmp6.i.i, 172		; <i32> [#uses=1]
	%tmp8.i.i23 = srem i32 %tmp7.i.i, 30307		; <i32> [#uses=2]
	store i32 %tmp8.i.i23, i32* @y2rnd, align 4
	%tmp9.i.i = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp10.i.i = mul i32 %tmp9.i.i, 170		; <i32> [#uses=1]
	%tmp11.i.i = srem i32 %tmp10.i.i, 30323		; <i32> [#uses=2]
	store i32 %tmp11.i.i, i32* @y3rnd, align 4
	%tmp1213.i.i = sitofp i32 %tmp5.i.i22 to float		; <float> [#uses=1]
	%tmp16.i.i = mul float %tmp1213.i.i, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp1718.i.i = sitofp i32 %tmp8.i.i23 to float		; <float> [#uses=1]
	%tmp21.i.i = mul float %tmp1718.i.i, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2223.i.i = sitofp i32 %tmp11.i.i to float		; <float> [#uses=1]
	%tmp26.i.i = mul float %tmp2223.i.i, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp29.i.i = add float %tmp16.i.i, %tmp21.i.i		; <float> [#uses=1]
	%tmp31.i.i = add float %tmp29.i.i, %tmp26.i.i		; <float> [#uses=2]
	%tmp3637.i.i = fptosi float %tmp31.i.i to i32		; <i32> [#uses=1]
	%tmp363738.i.i = sitofp i32 %tmp3637.i.i to float		; <float> [#uses=1]
	%tmp39.i.i = sub float %tmp31.i.i, %tmp363738.i.i		; <float> [#uses=1]
	%tmp44.i.i = mul float %tmp39.i.i, 3.200000e+01		; <float> [#uses=1]
	%tmp4445.i.i = fptosi float %tmp44.i.i to i32		; <i32> [#uses=1]
	%tmp68.i = icmp eq i32 %tmp4445.i.i, 1		; <i1> [#uses=1]
	br i1 %tmp68.i, label %cond_true72.i, label %cond_next180.i

cond_true72.i:		; preds = %cond_true66.i
	store i32 10, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 89, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 90, i32* @cg_caller_id_var, align 4
	%tmp80.i = call i8* @_Znwm( i64 56 )		; <i8*> [#uses=2]
	%tmp8081.i = bitcast i8* %tmp80.i to %struct.regobj*		; <%struct.regobj*> [#uses=3]
	%tmp89.i24 = getelementptr %struct.regobj* %tmp8081.i, i32 0, i32 3		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp89.i24, align 8
	%tmp100.i25 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp103.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp104.i = icmp eq i32 %tmp100.i25, %tmp103.i		; <i1> [#uses=1]
	br i1 %tmp104.i, label %cond_true107.i, label %cond_next.i32

cond_true107.i:		; preds = %cond_true72.i
	store i32 11, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 89, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 90, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv( )
	br label %cond_next.i32

cond_next.i32:		; preds = %cond_true107.i, %cond_true72.i
	%tmp111.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp114.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp114117.i = sext i32 %tmp114.i to i64		; <i64> [#uses=1]
	%tmp118.i = getelementptr %struct.regobj** %tmp111.i, i64 %tmp114117.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp8081.i, %struct.regobj** %tmp118.i, align 8
	%tmp125.i26 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp126.i27 = add i32 %tmp125.i26, -1		; <i32> [#uses=2]
	store i32 %tmp126.i27, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp131.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp134135.i = sext i32 %tmp126.i27 to i64		; <i64> [#uses=1]
	%tmp136.i = getelementptr i32* %tmp131.i, i64 %tmp134135.i		; <i32*> [#uses=1]
	%tmp137.i = load i32* %tmp136.i, align 4		; <i32> [#uses=3]
	%tmp144.i28 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp147.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp148149.i29 = sext i32 %tmp137.i to i64		; <i64> [#uses=1]
	%tmp150.i30 = getelementptr i32* %tmp144.i28, i64 %tmp148149.i29		; <i32*> [#uses=1]
	store i32 %tmp147.i, i32* %tmp150.i30, align 4
	%tmp154.i31 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp157.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp157158.i = sext i32 %tmp157.i to i64		; <i64> [#uses=1]
	%tmp159.i = getelementptr i32* %tmp154.i31, i64 %tmp157158.i		; <i32*> [#uses=1]
	store i32 %tmp137.i, i32* %tmp159.i, align 4
	%tmp163.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp164.i = add i32 %tmp163.i, 1		; <i32> [#uses=1]
	store i32 %tmp164.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp170.i = bitcast i8* %tmp80.i to i32*		; <i32*> [#uses=1]
	store i32 %tmp137.i, i32* %tmp170.i, align 8
	store i32 12, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 89, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 90, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6regobj6createEii( %struct.regobj* %tmp8081.i, i32 %x.0429.i, i32 %y.0434.i )
	br label %cond_next180.i

cond_next180.i:		; preds = %cond_next.i32, %cond_true66.i, %cond_true.i20, %bb6.i
	%tmp182.i33 = add i32 %x.0429.i, 1		; <i32> [#uses=2]
	%tmp186.i34 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp188.i = icmp slt i32 %tmp186.i34, %tmp182.i33		; <i1> [#uses=1]
	store i32 %val438, i32* @cg_caller_call_site_var, align 4
	store i32 %val337, i32* @cg_caller_id_var, align 4
	br i1 %tmp188.i, label %bb191.i, label %bb6.i

bb191.i:		; preds = %bb183.preheader.i, %cond_next180.i
	%tmp193.i = add i32 %y.0434.i, 1		; <i32> [#uses=2]
	%tmp197.i35 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=2]
	%tmp199.i = icmp slt i32 %tmp197.i35, %tmp193.i		; <i1> [#uses=1]
	store i32 %val436, i32* @cg_caller_call_site_var, align 4
	store i32 %val335, i32* @cg_caller_id_var, align 4
	br i1 %tmp199.i, label %bb202.i, label %bb183.preheader.i

bb183.preheader.i:		; preds = %bb191.i, %_ZN9regmngobj14enlargeregionsEv.exit
	%y.0434.i = phi i32 [ %tmp193.i, %bb191.i ], [ 0, %_ZN9regmngobj14enlargeregionsEv.exit ]		; <i32> [#uses=3]
	%val335 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val436 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 89, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val335, i32 %val436, i32 89 )
	%tmp186431.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp188432.i = icmp slt i32 %tmp186431.i, 0		; <i1> [#uses=1]
	br i1 %tmp188432.i, label %bb191.i, label %bb6.i

bb202.i:		; preds = %bb191.i, %_ZN9regmngobj14enlargeregionsEv.exit
	%tmp411426.rle.i = phi i32 [ %tmp197436.i, %_ZN9regmngobj14enlargeregionsEv.exit ], [ %tmp197.i35, %bb191.i ]		; <i32> [#uses=1]
	%tmp413427.i = icmp slt i32 %tmp411426.rle.i, 0		; <i1> [#uses=1]
	br i1 %tmp413427.i, label %_ZN9regmngobj10addregionsEv.exit, label %bb397.preheader.i

bb217.i:		; preds = %bb397.preheader.i, %cond_next394.i
	%x214.0420.i = phi i32 [ %tmp396.i, %cond_next394.i ], [ 0, %bb397.preheader.i ]		; <i32> [#uses=3]
	%val333 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val434 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 88, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val333, i32 %val434, i32 88 )
	%tmp227.i36 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp230.i37 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp232.i = mul i32 %tmp230.i37, %y215.0424.i		; <i32> [#uses=1]
	%tmp234.i = add i32 %tmp232.i, %x214.0420.i		; <i32> [#uses=1]
	%tmp234235.i = sext i32 %tmp234.i to i64		; <i64> [#uses=2]
	%tmp236.i = getelementptr %struct.regobj** %tmp227.i36, i64 %tmp234235.i		; <%struct.regobj**> [#uses=1]
	%tmp240.i38 = load %struct.regobj** %tmp236.i, align 8		; <%struct.regobj*> [#uses=1]
	%tmp241.i = icmp eq %struct.regobj* %tmp240.i38, null		; <i1> [#uses=1]
	br i1 %tmp241.i, label %cond_true245.i, label %cond_next394.i

cond_true245.i:		; preds = %bb217.i
	%tmp255.i = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp264.i = getelementptr i8* %tmp255.i, i64 %tmp234235.i		; <i8*> [#uses=1]
	%tmp265.i39 = load i8* %tmp264.i, align 1		; <i8> [#uses=1]
	%tmp269270271274.i = zext i8 %tmp265.i39 to i64		; <i64> [#uses=1]
	%tmp275.i = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp269270271274.i		; <i8*> [#uses=1]
	%tmp276.i = load i8* %tmp275.i, align 1		; <i8> [#uses=1]
	%toBool278.i = icmp eq i8 %tmp276.i, 0		; <i1> [#uses=1]
	br i1 %toBool278.i, label %cond_next394.i, label %cond_true279.i

cond_true279.i:		; preds = %cond_true245.i
	store i32 13, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 87, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 88, i32* @cg_caller_id_var, align 4
	%tmp290.i = call i8* @_Znwm( i64 56 )		; <i8*> [#uses=2]
	%tmp290291.i = bitcast i8* %tmp290.i to %struct.regobj*		; <%struct.regobj*> [#uses=3]
	%tmp300.i = getelementptr %struct.regobj* %tmp290291.i, i32 0, i32 3		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp300.i, align 8
	%tmp314.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp317.i40 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp318.i = icmp eq i32 %tmp314.i, %tmp317.i40		; <i1> [#uses=1]
	br i1 %tmp318.i, label %cond_true321.i, label %cond_next323.i

cond_true321.i:		; preds = %cond_true279.i
	store i32 14, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 87, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 88, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv( )
	br label %cond_next323.i

cond_next323.i:		; preds = %cond_true321.i, %cond_true279.i
	%tmp326.i = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp329.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp329332.i = sext i32 %tmp329.i to i64		; <i64> [#uses=1]
	%tmp333.i41 = getelementptr %struct.regobj** %tmp326.i, i64 %tmp329332.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp290291.i, %struct.regobj** %tmp333.i41, align 8
	%tmp340.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp341.i = add i32 %tmp340.i, -1		; <i32> [#uses=2]
	store i32 %tmp341.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp346.i42 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp349350.i = sext i32 %tmp341.i to i64		; <i64> [#uses=1]
	%tmp351.i43 = getelementptr i32* %tmp346.i42, i64 %tmp349350.i		; <i32*> [#uses=1]
	%tmp352.i = load i32* %tmp351.i43, align 4		; <i32> [#uses=3]
	%tmp359.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp362.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp363364.i = sext i32 %tmp352.i to i64		; <i64> [#uses=1]
	%tmp365.i = getelementptr i32* %tmp359.i, i64 %tmp363364.i		; <i32*> [#uses=1]
	store i32 %tmp362.i, i32* %tmp365.i, align 4
	%tmp369.i = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp372.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp372373.i = sext i32 %tmp372.i to i64		; <i64> [#uses=1]
	%tmp374.i = getelementptr i32* %tmp369.i, i64 %tmp372373.i		; <i32*> [#uses=1]
	store i32 %tmp352.i, i32* %tmp374.i, align 4
	%tmp378.i44 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp379.i = add i32 %tmp378.i44, 1		; <i32> [#uses=1]
	store i32 %tmp379.i, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp385.i = bitcast i8* %tmp290.i to i32*		; <i32*> [#uses=1]
	store i32 %tmp352.i, i32* %tmp385.i, align 8
	store i32 15, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 87, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 88, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6regobj6createEii( %struct.regobj* %tmp290291.i, i32 %x214.0420.i, i32 %y215.0424.i )
	br label %cond_next394.i

cond_next394.i:		; preds = %cond_next323.i, %cond_true245.i, %bb217.i
	%tmp396.i = add i32 %x214.0420.i, 1		; <i32> [#uses=2]
	%tmp400.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp402.i = icmp slt i32 %tmp400.i, %tmp396.i		; <i1> [#uses=1]
	store i32 %val434, i32* @cg_caller_call_site_var, align 4
	store i32 %val333, i32* @cg_caller_id_var, align 4
	br i1 %tmp402.i, label %bb405.i, label %bb217.i

bb405.i:		; preds = %bb397.preheader.i, %cond_next394.i
	%tmp407.i = add i32 %y215.0424.i, 1		; <i32> [#uses=2]
	%tmp411.i45 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp413.i = icmp slt i32 %tmp411.i45, %tmp407.i		; <i1> [#uses=1]
	store i32 %val432, i32* @cg_caller_call_site_var, align 4
	store i32 %val331, i32* @cg_caller_id_var, align 4
	br i1 %tmp413.i, label %_ZN9regmngobj10addregionsEv.exit, label %bb397.preheader.i

bb397.preheader.i:		; preds = %bb405.i, %bb202.i
	%y215.0424.i = phi i32 [ %tmp407.i, %bb405.i ], [ 0, %bb202.i ]		; <i32> [#uses=3]
	%val331 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val432 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 87, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val331, i32 %val432, i32 87 )
	%tmp400422.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp402423.i = icmp slt i32 %tmp400422.i, 0		; <i1> [#uses=1]
	br i1 %tmp402423.i, label %bb405.i, label %bb217.i

_ZN9regmngobj10addregionsEv.exit:		; preds = %bb405.i, %bb202.i
	%tmp80 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp81 = mul i32 %tmp80, 5		; <i32> [#uses=3]
	store i32 %tmp81, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 9), align 8
	%tmp90 = mul i32 %tmp81, %tmp81		; <i32> [#uses=1]
	store i32 %tmp90, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 10), align 8
	store i32 16, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj19defineneighborhood1Ev( )
	%tmp96 = load float* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 11), align 8		; <float> [#uses=2]
	%tmp97 = mul float %tmp96, 7.500000e+01		; <float> [#uses=1]
	%tmp101 = mul float %tmp97, %tmp96		; <float> [#uses=1]
	%tmp101102 = fptosi float %tmp101 to i32		; <i32> [#uses=1]
	store i32 17, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj18enlargeneighborsesEi( i32 %tmp101102 )
	store i32 18, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj19defineneighborhood1Ev( )
	%tmp107 = load float* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 11), align 8		; <float> [#uses=1]
	%tmp107108 = fpext float %tmp107 to double		; <double> [#uses=2]
	%tmp109 = mul double %tmp107108, 7.500000e+01		; <double> [#uses=1]
	%tmp114 = mul double %tmp109, %tmp107108		; <double> [#uses=1]
	%tmp114115 = fptosi double %tmp114 to i32		; <i32> [#uses=1]
	store i32 19, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj18enlargeneighborsesEi( i32 %tmp114115 )
	%tmp309876 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp311878 = icmp slt i32 %tmp309876, 0		; <i1> [#uses=1]
	br i1 %tmp311878, label %bb314, label %bb295.outer

bb295.outer:		; preds = %bb306, %_ZN9regmngobj10addregionsEv.exit
	%y121.0.reg2mem.0.ph = phi i32 [ %tmp305, %bb306 ], [ 0, %_ZN9regmngobj10addregionsEv.exit ]		; <i32> [#uses=3]
	%val327 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val428 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 85, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val327, i32 %val428, i32 85 )
	%tmp298915 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp300916 = icmp slt i32 %tmp298915, 0		; <i1> [#uses=1]
	br i1 %tmp300916, label %bb306, label %bb122

bb122:		; preds = %cond_next292, %bb295.outer
	%x120.0913 = phi i32 [ %tmp294, %cond_next292 ], [ 0, %bb295.outer ]		; <i32> [#uses=3]
	%val329 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val430 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 86, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val329, i32 %val430, i32 86 )
	%tmp132 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp135 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp137 = mul i32 %tmp135, %y121.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp139 = add i32 %tmp137, %x120.0913		; <i32> [#uses=1]
	%tmp139140 = sext i32 %tmp139 to i64		; <i64> [#uses=2]
	%tmp141 = getelementptr %struct.regobj** %tmp132, i64 %tmp139140		; <%struct.regobj**> [#uses=1]
	%tmp145 = load %struct.regobj** %tmp141, align 8		; <%struct.regobj*> [#uses=1]
	%tmp146 = icmp eq %struct.regobj* %tmp145, null		; <i1> [#uses=1]
	br i1 %tmp146, label %cond_true150, label %cond_next292

cond_true150:		; preds = %bb122
	%tmp160 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp169 = getelementptr i8* %tmp160, i64 %tmp139140		; <i8*> [#uses=1]
	%tmp170 = load i8* %tmp169, align 1		; <i8> [#uses=1]
	%tmp174175176179 = zext i8 %tmp170 to i64		; <i64> [#uses=1]
	%tmp180 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp174175176179		; <i8*> [#uses=1]
	%tmp181 = load i8* %tmp180, align 1		; <i8> [#uses=1]
	%toBool183 = icmp eq i8 %tmp181, 0		; <i1> [#uses=1]
	br i1 %toBool183, label %cond_next292, label %cond_true184

cond_true184:		; preds = %cond_true150
	store i32 20, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 85, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 86, i32* @cg_caller_id_var, align 4
	%tmp192 = call i8* @_Znwm( i64 56 )		; <i8*> [#uses=2]
	%tmp192193 = bitcast i8* %tmp192 to %struct.regobj*		; <%struct.regobj*> [#uses=3]
	%tmp201 = getelementptr %struct.regobj* %tmp192193, i32 0, i32 3		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp201, align 8
	%tmp212 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp215 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp216 = icmp eq i32 %tmp212, %tmp215		; <i1> [#uses=1]
	br i1 %tmp216, label %cond_true219, label %cond_next221

cond_true219:		; preds = %cond_true184
	store i32 21, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 85, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 86, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv( )
	br label %cond_next221

cond_next221:		; preds = %cond_true219, %cond_true184
	%tmp224 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp227 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp227230 = sext i32 %tmp227 to i64		; <i64> [#uses=1]
	%tmp231 = getelementptr %struct.regobj** %tmp224, i64 %tmp227230		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp192193, %struct.regobj** %tmp231, align 8
	%tmp238 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp239 = add i32 %tmp238, -1		; <i32> [#uses=2]
	store i32 %tmp239, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp244 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp247248 = sext i32 %tmp239 to i64		; <i64> [#uses=1]
	%tmp249 = getelementptr i32* %tmp244, i64 %tmp247248		; <i32*> [#uses=1]
	%tmp250 = load i32* %tmp249, align 4		; <i32> [#uses=3]
	%tmp257 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp260 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp261262 = sext i32 %tmp250 to i64		; <i64> [#uses=1]
	%tmp263 = getelementptr i32* %tmp257, i64 %tmp261262		; <i32*> [#uses=1]
	store i32 %tmp260, i32* %tmp263, align 4
	%tmp267 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp270 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp270271 = sext i32 %tmp270 to i64		; <i64> [#uses=1]
	%tmp272 = getelementptr i32* %tmp267, i64 %tmp270271		; <i32*> [#uses=1]
	store i32 %tmp250, i32* %tmp272, align 4
	%tmp276 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp277 = add i32 %tmp276, 1		; <i32> [#uses=1]
	store i32 %tmp277, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp283 = bitcast i8* %tmp192 to i32*		; <i32*> [#uses=1]
	store i32 %tmp250, i32* %tmp283, align 8
	store i32 22, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 85, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 86, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6regobj6createEii( %struct.regobj* %tmp192193, i32 %x120.0913, i32 %y121.0.reg2mem.0.ph )
	br label %cond_next292

cond_next292:		; preds = %cond_next221, %cond_true150, %bb122
	%tmp294 = add i32 %x120.0913, 1		; <i32> [#uses=2]
	%tmp298 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp300 = icmp slt i32 %tmp298, %tmp294		; <i1> [#uses=1]
	store i32 %val430, i32* @cg_caller_call_site_var, align 4
	store i32 %val329, i32* @cg_caller_id_var, align 4
	br i1 %tmp300, label %bb306, label %bb122

bb306:		; preds = %cond_next292, %bb295.outer
	%tmp305 = add i32 %y121.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp309 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp311 = icmp slt i32 %tmp309, %tmp305		; <i1> [#uses=1]
	store i32 %val428, i32* @cg_caller_call_site_var, align 4
	store i32 %val327, i32* @cg_caller_id_var, align 4
	br i1 %tmp311, label %bb314, label %bb295.outer

bb314:		; preds = %bb306, %_ZN9regmngobj10addregionsEv.exit
	store i32 23, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj13deleteregionsEv( )
	%tmp400883 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp402885 = icmp sgt i32 %tmp400883, 0		; <i1> [#uses=1]
	br i1 %tmp402885, label %bb386.outer, label %bb405

bb386.outer:		; preds = %bb397, %bb314
	%y.0.reg2mem.0.ph = phi i32 [ %tmp396, %bb397 ], [ 0, %bb314 ]		; <i32> [#uses=2]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 76, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 76 )
	%tmp389934 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp391935 = icmp sgt i32 %tmp389934, 0		; <i1> [#uses=1]
	br i1 %tmp391935, label %bb317, label %bb397

bb317:		; preds = %cond_next383, %bb386.outer
	%x.0932 = phi i32 [ %tmp385, %cond_next383 ], [ 0, %bb386.outer ]		; <i32> [#uses=2]
	%val311 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val412 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 77, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val311, i32 %val412, i32 77 )
	%tmp327 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp330 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp332 = mul i32 %tmp330, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp334 = add i32 %tmp332, %x.0932		; <i32> [#uses=1]
	%tmp334335 = sext i32 %tmp334 to i64		; <i64> [#uses=2]
	%tmp336 = getelementptr %struct.regobj** %tmp327, i64 %tmp334335		; <%struct.regobj**> [#uses=1]
	%tmp340 = load %struct.regobj** %tmp336, align 8		; <%struct.regobj*> [#uses=1]
	%tmp341 = icmp eq %struct.regobj* %tmp340, null		; <i1> [#uses=1]
	br i1 %tmp341, label %cond_true345, label %cond_next383

cond_true345:		; preds = %bb317
	%tmp355 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp364 = getelementptr i8* %tmp355, i64 %tmp334335		; <i8*> [#uses=1]
	%tmp365 = load i8* %tmp364, align 1		; <i8> [#uses=1]
	%tmp369370371374 = zext i8 %tmp365 to i64		; <i64> [#uses=1]
	%tmp375 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp369370371374		; <i8*> [#uses=1]
	%tmp376 = load i8* %tmp375, align 1		; <i8> [#uses=1]
	%toBool378 = icmp eq i8 %tmp376, 0		; <i1> [#uses=1]
	br i1 %toBool378, label %cond_next383, label %cond_true379

cond_true379:		; preds = %cond_true345
	store i32 24, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 76, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 77, i32* @cg_caller_id_var, align 4
	%tmp381 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([23 x i8]* @.str, i32 0, i64 0) )		; <i32> [#uses=0]
	br label %cond_next383

cond_next383:		; preds = %cond_true379, %cond_true345, %bb317
	%tmp385 = add i32 %x.0932, 1		; <i32> [#uses=2]
	%tmp389 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp391 = icmp sgt i32 %tmp389, %tmp385		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp391, label %bb317, label %bb397

bb397:		; preds = %cond_next383, %bb386.outer
	%tmp396 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp400 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp402 = icmp sgt i32 %tmp400, %tmp396		; <i1> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp402, label %bb386.outer, label %bb405

bb405:		; preds = %bb397, %bb314
	store i32 25, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj19defineneighborhood1Ev( )
	store i32 26, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj20definemiddleregpointEv( )
	%tmp459889 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp461891 = icmp sgt i32 %tmp459889, 0		; <i1> [#uses=1]
	br i1 %tmp461891, label %bb415, label %bb485.preheader

bb415:		; preds = %bb455, %bb405
	%i412.0.reg2mem.0 = phi i32 [ %tmp454, %bb455 ], [ 0, %bb405 ]		; <i32> [#uses=2]
	%val313 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val414 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 78, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val313, i32 %val414, i32 78 )
	%tmp423 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp424425 = sext i32 %i412.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp426 = getelementptr %struct.regobj** %tmp423, i64 %tmp424425		; <%struct.regobj**> [#uses=1]
	%tmp430 = load %struct.regobj** %tmp426, align 8		; <%struct.regobj*> [#uses=2]
	%tmp433 = getelementptr %struct.regobj* %tmp430, i32 0, i32 5, i32 1		; <i32*> [#uses=2]
	%tmp434 = load i32* %tmp433, align 8		; <i32> [#uses=1]
	%tmp437 = getelementptr %struct.regobj* %tmp430, i32 0, i32 5, i32 0		; <i32*> [#uses=2]
	%tmp438 = load i32* %tmp437, align 8		; <i32> [#uses=1]
	store i32 27, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 78, i32* @cg_caller_id_var, align 4
	%tmp440 = call fastcc i8 @_ZN9regmngobj13findfreeplaceEiiRiS0_( i32 %tmp438, i32 %tmp434, i32* %x413, i32* %y414 ) zeroext 		; <i8> [#uses=1]
	%toBool442 = icmp eq i8 %tmp440, 0		; <i1> [#uses=1]
	br i1 %toBool442, label %bb455, label %cond_true443

cond_true443:		; preds = %bb415
	%tmp444 = load i32* %x413, align 4		; <i32> [#uses=1]
	store i32 %tmp444, i32* %tmp437, align 8
	%tmp448 = load i32* %y414, align 4		; <i32> [#uses=1]
	store i32 %tmp448, i32* %tmp433, align 8
	br label %bb455

bb455:		; preds = %cond_true443, %bb415
	%tmp454 = add i32 %i412.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp459 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp461 = icmp sgt i32 %tmp459, %tmp454		; <i1> [#uses=1]
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %tmp461, label %bb415, label %bb485.preheader

bb465:		; preds = %bb485.preheader, %bb465
	%i.0927 = phi i32 [ %tmp484, %bb465 ], [ 0, %bb485.preheader ]		; <i32> [#uses=2]
	%val315 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val416 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 79, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val315, i32 %val416, i32 79 )
	%tmp474 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp475476 = sext i32 %i.0927 to i64		; <i64> [#uses=1]
	%tmp477 = getelementptr %struct.regobj** %tmp474, i64 %tmp475476		; <%struct.regobj**> [#uses=1]
	%tmp481 = load %struct.regobj** %tmp477, align 8		; <%struct.regobj*> [#uses=1]
	%tmp482 = getelementptr %struct.regobj* %tmp481, i32 0, i32 2		; <i8*> [#uses=1]
	store i8 1, i8* %tmp482, align 8
	%tmp484 = add i32 %i.0927, 1		; <i32> [#uses=2]
	%tmp489 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp491 = icmp sgt i32 %tmp489, %tmp484		; <i1> [#uses=1]
	store i32 %val416, i32* @cg_caller_call_site_var, align 4
	store i32 %val315, i32* @cg_caller_id_var, align 4
	br i1 %tmp491, label %bb465, label %bb494

bb485.preheader:		; preds = %bb455, %bb405
	%tmp489929.rle = phi i32 [ %tmp459889, %bb405 ], [ %tmp459, %bb455 ]		; <i32> [#uses=1]
	%tmp491930 = icmp sgt i32 %tmp489929.rle, 0		; <i1> [#uses=1]
	br i1 %tmp491930, label %bb465, label %bb494

bb494:		; preds = %bb485.preheader, %bb465
	%tmp497 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp500 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp501 = mul i32 %tmp500, %tmp497		; <i32> [#uses=1]
	%tmp501502 = sext i32 %tmp501 to i64		; <i64> [#uses=1]
	%tmp503 = shl i64 %tmp501502, 3		; <i64> [#uses=1]
	%tmp506 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp506507 = bitcast %struct.regobj** %tmp506 to i8*		; <i8*> [#uses=1]
	store i32 28, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp506507, i8 0, i64 %tmp503, i32 8 )
	store i32 29, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj15redefineregionsEv( )
	%tmp562896 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp564898 = icmp sgt i32 %tmp562896, 0		; <i1> [#uses=1]
	br i1 %tmp564898, label %bb514, label %bb567

bb514:		; preds = %bb558, %bb494
	%i513.0.reg2mem.0 = phi i32 [ %tmp557, %bb558 ], [ 0, %bb494 ]		; <i32> [#uses=2]
	%val317 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val418 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 80, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val317, i32 %val418, i32 80 )
	%tmp523 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp524525 = sext i32 %i513.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp526 = getelementptr %struct.regobj** %tmp523, i64 %tmp524525		; <%struct.regobj**> [#uses=1]
	%tmp530 = load %struct.regobj** %tmp526, align 8		; <%struct.regobj*> [#uses=2]
	%tmp531 = getelementptr %struct.regobj* %tmp530, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp532 = load i32* %tmp531, align 8		; <i32> [#uses=1]
	%tmp533 = icmp eq i32 %tmp532, 0		; <i1> [#uses=1]
	br i1 %tmp533, label %cond_true537, label %bb558

cond_true537:		; preds = %bb514
	%tmp554 = getelementptr %struct.regobj* %tmp530, i32 0, i32 1		; <i8*> [#uses=1]
	store i8 0, i8* %tmp554, align 8
	br label %bb558

bb558:		; preds = %cond_true537, %bb514
	%tmp557 = add i32 %i513.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp562 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp564 = icmp sgt i32 %tmp562, %tmp557		; <i1> [#uses=1]
	store i32 %val418, i32* @cg_caller_call_site_var, align 4
	store i32 %val317, i32* @cg_caller_id_var, align 4
	br i1 %tmp564, label %bb514, label %bb567

bb567:		; preds = %bb558, %bb494
	store i32 30, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj13deleteregionsEv( )
	%tmp771904 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp773906 = icmp slt i32 %tmp771904, 0		; <i1> [#uses=1]
	br i1 %tmp773906, label %bb776, label %bb757.outer

bb757.outer:		; preds = %bb768, %bb567
	%y575.0.reg2mem.0.ph = phi i32 [ %tmp767, %bb768 ], [ 0, %bb567 ]		; <i32> [#uses=3]
	%val323 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val424 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 83, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val323, i32 %val424, i32 83 )
	%tmp760919 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp762920 = icmp slt i32 %tmp760919, 0		; <i1> [#uses=1]
	br i1 %tmp762920, label %bb768, label %bb577

bb577:		; preds = %cond_next754, %bb757.outer
	%x574.0917 = phi i32 [ %tmp756, %cond_next754 ], [ 0, %bb757.outer ]		; <i32> [#uses=3]
	%val325 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val426 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 84, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val325, i32 %val426, i32 84 )
	%tmp587 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8		; <%struct.regobj**> [#uses=1]
	%tmp590 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp592 = mul i32 %tmp590, %y575.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp594 = add i32 %tmp592, %x574.0917		; <i32> [#uses=1]
	%tmp594595 = sext i32 %tmp594 to i64		; <i64> [#uses=2]
	%tmp596 = getelementptr %struct.regobj** %tmp587, i64 %tmp594595		; <%struct.regobj**> [#uses=1]
	%tmp600 = load %struct.regobj** %tmp596, align 8		; <%struct.regobj*> [#uses=1]
	%tmp601 = icmp eq %struct.regobj* %tmp600, null		; <i1> [#uses=1]
	br i1 %tmp601, label %cond_true605, label %cond_next754

cond_true605:		; preds = %bb577
	%tmp615 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	%tmp624 = getelementptr i8* %tmp615, i64 %tmp594595		; <i8*> [#uses=1]
	%tmp625 = load i8* %tmp624, align 1		; <i8> [#uses=1]
	%tmp629630631634 = zext i8 %tmp625 to i64		; <i64> [#uses=1]
	%tmp635 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp629630631634		; <i8*> [#uses=1]
	%tmp636 = load i8* %tmp635, align 1		; <i8> [#uses=1]
	%toBool638 = icmp eq i8 %tmp636, 0		; <i1> [#uses=1]
	br i1 %toBool638, label %cond_next754, label %cond_true639

cond_true639:		; preds = %cond_true605
	store i32 31, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 83, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 84, i32* @cg_caller_id_var, align 4
	%tmp650 = call i8* @_Znwm( i64 56 )		; <i8*> [#uses=2]
	%tmp650651 = bitcast i8* %tmp650 to %struct.regobj*		; <%struct.regobj*> [#uses=3]
	%tmp660 = getelementptr %struct.regobj* %tmp650651, i32 0, i32 3		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* @regmng, %struct.regmngobj** %tmp660, align 8
	%tmp674 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp677 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 5), align 8		; <i32> [#uses=1]
	%tmp678 = icmp eq i32 %tmp674, %tmp677		; <i1> [#uses=1]
	br i1 %tmp678, label %cond_true681, label %cond_next683

cond_true681:		; preds = %cond_true639
	store i32 32, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 83, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 84, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN15largesolidarrayIP6regobjE8doublingEv( )
	br label %cond_next683

cond_next683:		; preds = %cond_true681, %cond_true639
	%tmp686 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp689 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp689692 = sext i32 %tmp689 to i64		; <i64> [#uses=1]
	%tmp693 = getelementptr %struct.regobj** %tmp686, i64 %tmp689692		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp650651, %struct.regobj** %tmp693, align 8
	%tmp700 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp701 = add i32 %tmp700, -1		; <i32> [#uses=2]
	store i32 %tmp701, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 1), align 8
	%tmp706 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 1, i32 0), align 8		; <i32*> [#uses=1]
	%tmp709710 = sext i32 %tmp701 to i64		; <i64> [#uses=1]
	%tmp711 = getelementptr i32* %tmp706, i64 %tmp709710		; <i32*> [#uses=1]
	%tmp712 = load i32* %tmp711, align 4		; <i32> [#uses=3]
	%tmp719 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 2, i32 0), align 8		; <i32*> [#uses=1]
	%tmp722 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp723724 = sext i32 %tmp712 to i64		; <i64> [#uses=1]
	%tmp725 = getelementptr i32* %tmp719, i64 %tmp723724		; <i32*> [#uses=1]
	store i32 %tmp722, i32* %tmp725, align 4
	%tmp729 = load i32** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 3, i32 0), align 8		; <i32*> [#uses=1]
	%tmp732 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp732733 = sext i32 %tmp732 to i64		; <i64> [#uses=1]
	%tmp734 = getelementptr i32* %tmp729, i64 %tmp732733		; <i32*> [#uses=1]
	store i32 %tmp712, i32* %tmp734, align 4
	%tmp738 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp739 = add i32 %tmp738, 1		; <i32> [#uses=1]
	store i32 %tmp739, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8
	%tmp745 = bitcast i8* %tmp650 to i32*		; <i32*> [#uses=1]
	store i32 %tmp712, i32* %tmp745, align 8
	store i32 33, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 83, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 84, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6regobj6createEii( %struct.regobj* %tmp650651, i32 %x574.0917, i32 %y575.0.reg2mem.0.ph )
	br label %cond_next754

cond_next754:		; preds = %cond_next683, %cond_true605, %bb577
	%tmp756 = add i32 %x574.0917, 1		; <i32> [#uses=2]
	%tmp760 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8		; <i32> [#uses=1]
	%tmp762 = icmp slt i32 %tmp760, %tmp756		; <i1> [#uses=1]
	store i32 %val426, i32* @cg_caller_call_site_var, align 4
	store i32 %val325, i32* @cg_caller_id_var, align 4
	br i1 %tmp762, label %bb768, label %bb577

bb768:		; preds = %cond_next754, %bb757.outer
	%tmp767 = add i32 %y575.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp771 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8		; <i32> [#uses=1]
	%tmp773 = icmp slt i32 %tmp771, %tmp767		; <i1> [#uses=1]
	store i32 %val424, i32* @cg_caller_call_site_var, align 4
	store i32 %val323, i32* @cg_caller_id_var, align 4
	br i1 %tmp773, label %bb776, label %bb757.outer

bb776:		; preds = %bb768, %bb567
	store i32 34, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj19defineneighborhood1Ev( )
	store i32 35, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj20definemiddleregpointEv( )
	%tmp832910 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp834912 = icmp sgt i32 %tmp832910, 0		; <i1> [#uses=1]
	br i1 %tmp834912, label %bb787, label %bb861.preheader

bb787:		; preds = %bb828, %bb776
	%i784.0.reg2mem.0 = phi i32 [ %tmp827, %bb828 ], [ 0, %bb776 ]		; <i32> [#uses=2]
	%val319 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val420 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 81, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val319, i32 %val420, i32 81 )
	%tmp796 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp797798 = sext i32 %i784.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp799 = getelementptr %struct.regobj** %tmp796, i64 %tmp797798		; <%struct.regobj**> [#uses=1]
	%tmp803 = load %struct.regobj** %tmp799, align 8		; <%struct.regobj*> [#uses=2]
	%tmp806 = getelementptr %struct.regobj* %tmp803, i32 0, i32 5, i32 1		; <i32*> [#uses=2]
	%tmp807 = load i32* %tmp806, align 8		; <i32> [#uses=1]
	%tmp810 = getelementptr %struct.regobj* %tmp803, i32 0, i32 5, i32 0		; <i32*> [#uses=2]
	%tmp811 = load i32* %tmp810, align 8		; <i32> [#uses=1]
	store i32 36, i32* @cg_caller_call_site_var, align 4
	store i32 18, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 81, i32* @cg_caller_id_var, align 4
	%tmp813 = call fastcc i8 @_ZN9regmngobj13findfreeplaceEiiRiS0_( i32 %tmp811, i32 %tmp807, i32* %x785, i32* %y786 ) zeroext 		; <i8> [#uses=1]
	%toBool815 = icmp eq i8 %tmp813, 0		; <i1> [#uses=1]
	br i1 %toBool815, label %bb828, label %cond_true816

cond_true816:		; preds = %bb787
	%tmp817 = load i32* %x785, align 4		; <i32> [#uses=1]
	store i32 %tmp817, i32* %tmp810, align 8
	%tmp821 = load i32* %y786, align 4		; <i32> [#uses=1]
	store i32 %tmp821, i32* %tmp806, align 8
	br label %bb828

bb828:		; preds = %cond_true816, %bb787
	%tmp827 = add i32 %i784.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp832 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=2]
	%tmp834 = icmp sgt i32 %tmp832, %tmp827		; <i1> [#uses=1]
	store i32 %val420, i32* @cg_caller_call_site_var, align 4
	store i32 %val319, i32* @cg_caller_id_var, align 4
	br i1 %tmp834, label %bb787, label %bb861.preheader

bb838:		; preds = %bb861.preheader, %bb838
	%i.1922 = phi i32 [ %tmp860, %bb838 ], [ 0, %bb861.preheader ]		; <i32> [#uses=2]
	%val321 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val422 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 82, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val321, i32 %val422, i32 82 )
	%tmp847 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp848849 = sext i32 %i.1922 to i64		; <i64> [#uses=1]
	%tmp850 = getelementptr %struct.regobj** %tmp847, i64 %tmp848849		; <%struct.regobj**> [#uses=1]
	%tmp854 = load %struct.regobj** %tmp850, align 8		; <%struct.regobj*> [#uses=1]
	%tmp857 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 5), align 8		; <i32> [#uses=1]
	%tmp858 = getelementptr %struct.regobj* %tmp854, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 %tmp857, i32* %tmp858, align 8
	%tmp860 = add i32 %i.1922, 1		; <i32> [#uses=2]
	%tmp865 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp867 = icmp sgt i32 %tmp865, %tmp860		; <i1> [#uses=1]
	store i32 %val422, i32* @cg_caller_call_site_var, align 4
	store i32 %val321, i32* @cg_caller_id_var, align 4
	br i1 %tmp867, label %bb838, label %return

bb861.preheader:		; preds = %bb828, %bb776
	%tmp865924.rle = phi i32 [ %tmp832910, %bb776 ], [ %tmp832, %bb828 ]		; <i32> [#uses=1]
	%tmp867925 = icmp sgt i32 %tmp865924.rle, 0		; <i1> [#uses=1]
	br i1 %tmp867925, label %bb838, label %return

return:		; preds = %bb861.preheader, %bb838
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare i32 @printf(i8* noalias , ...)

define internal fastcc i8 @_ZN7way2obj9createwayEiiiiPhRP6pointtRi(i32 %startx, i32 %starty, i32 %endx, i32 %endy, i8* %movetimearp, %struct.pointt** %wayar, i32* %waylength) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 19, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 19 )
	store i32 %startx, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 10), align 8
	store i32 %starty, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 11), align 8
	store i32 %endx, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 8), align 8
	store i32 %endy, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 9), align 8
	br label %bb

bb:		; preds = %bb, %entry
	%i.0.reg2mem.0 = phi i32 [ 0, %entry ], [ %indvar.next, %bb ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 91, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 91 )
	%tmp1516 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp17 = getelementptr i8* %movetimearp, i64 %tmp1516		; <i8*> [#uses=1]
	%tmp18 = load i8* %tmp17, align 1		; <i8> [#uses=1]
	%tmp22 = getelementptr %struct.way2obj* @way2, i32 0, i32 3, i64 %tmp1516		; <i8*> [#uses=1]
	store i8 %tmp18, i8* %tmp22, align 1
	%indvar.next = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next, 256		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb29, label %bb

bb29:		; preds = %bb
	%tmp32 = icmp eq i32 %startx, %endx		; <i1> [#uses=1]
	%tmp36 = icmp eq i32 %starty, %endy		; <i1> [#uses=1]
	%tmp40 = and i1 %tmp36, %tmp32		; <i1> [#uses=1]
	br i1 %tmp40, label %cond_true, label %bb.i

cond_true:		; preds = %bb29
	%tmp43 = malloc %struct.pointt		; <%struct.pointt*> [#uses=1]
	store %struct.pointt* %tmp43, %struct.pointt** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1

bb.i:		; preds = %bb.i, %bb29
	%i.0.reg2mem.0.i = phi i32 [ %indvar.next328.i, %bb.i ], [ 0, %bb29 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 92, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 92 )
	%tmp25.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp9.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp25.i, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp9.i, align 8
	%indvar.next328.i = add i32 %i.0.reg2mem.0.i, 1		; <i32> [#uses=2]
	%exitcond329.i = icmp eq i32 %indvar.next328.i, 256		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %exitcond329.i, label %bb16.i, label %bb.i

bb16.i:		; preds = %bb.i
	%tmp19.i = load i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8		; <i16> [#uses=1]
	%tmp20.i = add i16 %tmp19.i, 1		; <i16> [#uses=2]
	store i16 %tmp20.i, i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8
	%tmp27.i = icmp eq i16 %tmp20.i, -1		; <i1> [#uses=1]
	br i1 %tmp27.i, label %cond_true.i, label %cond_next.i

cond_true.i:		; preds = %bb16.i
	%tmp32.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp35.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 8		; <i32> [#uses=1]
	%tmp36.i = mul i32 %tmp35.i, %tmp32.i		; <i32> [#uses=1]
	%tmp3637.i = sext i32 %tmp36.i to i64		; <i64> [#uses=1]
	%tmp38.i = shl i64 %tmp3637.i, 2		; <i64> [#uses=1]
	%tmp41.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=1]
	%tmp4142.i = bitcast %struct.point16t* %tmp41.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 19, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memset.i64( i8* %tmp4142.i, i8 0, i64 %tmp38.i, i32 2 ) nounwind 
	store i16 1, i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8
	br label %cond_next.i

cond_next.i:		; preds = %cond_true.i, %bb16.i
	store i8 0, i8* getelementptr (%struct.way2obj* @way2, i32 0, i32 12), align 8
	store i32 0, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 6), align 8
	%tmp62.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp65.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 2), align 8		; <i32> [#uses=3]
	%tmp66.i = icmp eq i32 %tmp62.i, %tmp65.i		; <i1> [#uses=1]
	br i1 %tmp66.i, label %cond_true69.i, label %cond_next115.i

cond_true69.i:		; preds = %cond_next.i
	%tmp76.i = shl i32 %tmp65.i, 1		; <i32> [#uses=2]
	%tmp84.i = malloc %struct.pointt, i32 %tmp76.i		; <%struct.pointt*> [#uses=2]
	%tmpcast.i = bitcast %struct.pointt* %tmp84.i to i8*		; <i8*> [#uses=1]
	%tmp9495.i = sext i32 %tmp65.i to i64		; <i64> [#uses=1]
	%tmp96.i = shl i64 %tmp9495.i, 3		; <i64> [#uses=1]
	%tmp99.i = load %struct.pointt** getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 0), align 8		; <%struct.pointt*> [#uses=1]
	%tmp99102.i = bitcast %struct.pointt* %tmp99.i to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 19, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp99102.i, i64 %tmp96.i, i32 4 ) nounwind 
	%tmp106.i = load %struct.pointt** getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 0), align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp106.i
	store %struct.pointt* %tmp84.i, %struct.pointt** getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 0), align 8
	store i32 %tmp76.i, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 2), align 8
	br label %cond_next115.i

cond_next115.i:		; preds = %cond_true69.i, %cond_next.i
	%tmp118.i = load %struct.pointt** getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 0), align 8		; <%struct.pointt*> [#uses=2]
	%tmp121.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp121129.i = sext i32 %tmp121.i to i64		; <i64> [#uses=2]
	%tmp131.i = getelementptr %struct.pointt* %tmp118.i, i64 %tmp121129.i, i32 0		; <i32*> [#uses=1]
	store i32 %startx, i32* %tmp131.i, align 4
	%tmp134.i = getelementptr %struct.pointt* %tmp118.i, i64 %tmp121129.i, i32 1		; <i32*> [#uses=1]
	store i32 %starty, i32* %tmp134.i, align 4
	%tmp139.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 1), align 8		; <i32> [#uses=1]
	%tmp140.i = add i32 %tmp139.i, 1		; <i32> [#uses=1]
	store i32 %tmp140.i, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 4, i32 0, i32 1), align 8
	%tmp145.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=1]
	%tmp148.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp150.i = mul i32 %tmp148.i, %starty		; <i32> [#uses=1]
	%tmp152.i = add i32 %tmp150.i, %startx		; <i32> [#uses=1]
	%tmp152153.i = sext i32 %tmp152.i to i64		; <i64> [#uses=1]
	%tmp155.i = getelementptr %struct.point16t* %tmp145.i, i64 %tmp152153.i, i32 1		; <i16*> [#uses=1]
	store i16 0, i16* %tmp155.i, align 2
	store i32 0, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 5), align 8
	store i32 0, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 8
	%tmp276303.i = load i8* getelementptr (%struct.way2obj* @way2, i32 0, i32 12), align 8		; <i8> [#uses=3]
	%tmp278304.i = icmp eq i8 %tmp276303.i, 0		; <i1> [#uses=1]
	br i1 %tmp278304.i, label %cond_next282.i.outer, label %_ZN7way2obj4fillEii.exit

bb160.i:		; preds = %cond_next282.i
	%tmp164.i = srem i32 %tmp163.rle.i, 256		; <i32> [#uses=6]
	%tmp174177.i = sext i32 %tmp164.i to i64		; <i64> [#uses=3]
	%tmp179.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp174177.i, i32 1		; <i32*> [#uses=1]
	%tmp180.i = load i32* %tmp179.i, align 8		; <i32> [#uses=3]
	%tmp181.i = icmp eq i32 %tmp180.i, 0		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp181.i, label %cond_true184.i, label %cond_false.i

cond_true184.i:		; preds = %bb160.i
	%tmp188.i = add i32 %.tmp.0, 1		; <i32> [#uses=2]
	%tmp270307.i = add i32 %tmp163.rle.i, 1		; <i32> [#uses=3]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp278311.i, label %cond_next282.i, label %_ZN7way2obj4fillEii.exit.loopexit.loopexit

cond_false.i:		; preds = %bb160.i
	store i32 %.tmp21.0, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 4
	store i32 %tmp164.i, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 5), align 4
	store i32 0, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 6), align 8
	%i171.0316.i = add i32 %tmp180.i, -1		; <i32> [#uses=3]
	%tmp252318.i = icmp sgt i32 %i171.0316.i, -1		; <i1> [#uses=1]
	br i1 %tmp252318.i, label %bb203.preheader.i, label %bb255.i

bb203.preheader.i:		; preds = %cond_false.i
	%tmp323.i = icmp slt i32 %i171.0316.i, 0		; <i1> [#uses=1]
	%tmp324.i = select i1 %tmp323.i, i32 1, i32 %tmp180.i		; <i32> [#uses=1]
	br label %bb203.i

bb203.i:		; preds = %_ZN7way2obj12releasepointEii.exit.i, %bb203.preheader.i
	%tmp227.rle.i = phi i32 [ %tmp164.i, %bb203.preheader.i ], [ %tmp206.i, %_ZN7way2obj12releasepointEii.exit.i ]		; <i32> [#uses=1]
	%indvar.i = phi i32 [ 0, %bb203.preheader.i ], [ %indvar.next.i, %_ZN7way2obj12releasepointEii.exit.i ]		; <i32> [#uses=2]
	%tmp206209.reg2mem.0.i = phi i64 [ %tmp174177.i, %bb203.preheader.i ], [ %tmp206209.i, %_ZN7way2obj12releasepointEii.exit.i ]		; <i64> [#uses=1]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 95, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 95 )
	%i171.0.reg2mem.0.i = sub i32 %i171.0316.i, %indvar.i		; <i32> [#uses=1]
	%tmp215.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp206209.reg2mem.0.i, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp216.i = load %struct.pointt** %tmp215.i, align 8		; <%struct.pointt*> [#uses=1]
	%tmp217218.i = sext i32 %i171.0.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp223.i = getelementptr %struct.pointt* %tmp216.i, i64 %tmp217218.i, i32 1		; <i32*> [#uses=1]
	%tmp224.i = load i32* %tmp223.i, align 4		; <i32> [#uses=6]
	%tmp227230.i = sext i32 %tmp227.rle.i to i64		; <i64> [#uses=1]
	%tmp237.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp227230.i, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp238.i = load %struct.pointt** %tmp237.i, align 8		; <%struct.pointt*> [#uses=1]
	%tmp245.i = getelementptr %struct.pointt* %tmp238.i, i64 %tmp217218.i, i32 0		; <i32*> [#uses=1]
	%tmp246.i = load i32* %tmp245.i, align 4		; <i32> [#uses=7]
	%tmp7.i.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=1]
	%tmp10.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp12.i.i = mul i32 %tmp10.i.i, %tmp224.i		; <i32> [#uses=1]
	%tmp14.i.i = add i32 %tmp12.i.i, %tmp246.i		; <i32> [#uses=1]
	%tmp1415.i.i = sext i32 %tmp14.i.i to i64		; <i64> [#uses=1]
	%tmp17.i.i = getelementptr %struct.point16t* %tmp7.i.i, i64 %tmp1415.i.i, i32 0		; <i16*> [#uses=2]
	%tmp18.i.i = load i16* %tmp17.i.i, align 2		; <i16> [#uses=1]
	%tmp21.i.i = load i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8		; <i16> [#uses=2]
	%tmp22.i.i = icmp eq i16 %tmp18.i.i, %tmp21.i.i		; <i1> [#uses=1]
	br i1 %tmp22.i.i, label %_ZN7way2obj12releasepointEii.exit.i, label %cond_next.i.i

cond_next.i.i:		; preds = %bb203.i
	store i16 %tmp21.i.i, i16* %tmp17.i.i, align 2
	%tmp41.i.i = add i32 %tmp246.i, -1		; <i32> [#uses=2]
	%tmp43.i.i = add i32 %tmp224.i, -1		; <i32> [#uses=2]
	%tmp45.i.i = add i32 %tmp246.i, 1		; <i32> [#uses=2]
	%tmp47.i.i = add i32 %tmp224.i, 1		; <i32> [#uses=2]
	%tmp49.i.i = icmp slt i32 %tmp41.i.i, 0		; <i1> [#uses=1]
	%x1.0.i.i = select i1 %tmp49.i.i, i32 0, i32 %tmp41.i.i		; <i32> [#uses=1]
	%tmp55.i.i = icmp slt i32 %tmp43.i.i, 0		; <i1> [#uses=1]
	%y1.0.i.i = select i1 %tmp55.i.i, i32 0, i32 %tmp43.i.i		; <i32> [#uses=3]
	%tmp62.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 13), align 8		; <i32> [#uses=2]
	%tmp64.i.i = icmp slt i32 %tmp62.i.i, %tmp45.i.i		; <i1> [#uses=1]
	%x2.0.i.i = select i1 %tmp64.i.i, i32 %tmp62.i.i, i32 %tmp45.i.i		; <i32> [#uses=3]
	%tmp74.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 14), align 8		; <i32> [#uses=3]
	%tmp76.i.i = icmp slt i32 %tmp74.i.i, %tmp47.i.i		; <i1> [#uses=1]
	br i1 %tmp76.i.i, label %cond_true79.i.i, label %bb352.i.i

cond_true79.i.i:		; preds = %cond_next.i.i
	%tmp355493.i.i = icmp sgt i32 %y1.0.i.i, %tmp74.i.i		; <i1> [#uses=1]
	br i1 %tmp355493.i.i, label %bb358.i.i, label %bb343.preheader.i.i

bb343.preheader.i.i:		; preds = %bb352.i.i, %cond_true79.i.i
	%y2.0.reg2mem.0.ph.i.i = phi i32 [ %tmp74.i.i, %cond_true79.i.i ], [ %y2.0.i.i, %bb352.i.i ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph.i.i = phi i32 [ %y1.0.i.i, %cond_true79.i.i ], [ %y.0.i.i, %bb352.i.i ]		; <i32> [#uses=6]
	%mindist.1.ph.i.i = phi i32 [ 10000000, %cond_true79.i.i ], [ %mindist.2.i.i, %bb352.i.i ]		; <i32> [#uses=1]
	%flcenter.1.ph.i.i = phi i8 [ 1, %cond_true79.i.i ], [ %flcenter.2.i.i, %bb352.i.i ]		; <i8> [#uses=1]
	%tmp93.i.i = icmp eq i32 %y.0.reg2mem.0.ph.i.i, %tmp224.i		; <i1> [#uses=1]
	br label %bb343.i.i

bb86.i.i:		; preds = %bb86.preheader.i.i, %cond_true142.i.i
	%indvar553.i.i = phi i32 [ %indvar.next554.i.i, %cond_true142.i.i ], [ 0, %bb86.preheader.i.i ]		; <i32> [#uses=2]
	%mindist.1.reg2mem.0.i.i = phi i32 [ %tmp135136.i.i, %cond_true142.i.i ], [ %mindist.1.i.i, %bb86.preheader.i.i ]		; <i32> [#uses=4]
	%flcenter.1.reg2mem.0.i.i = phi i8 [ 0, %cond_true142.i.i ], [ %flcenter.1.i.i, %bb86.preheader.i.i ]		; <i8> [#uses=3]
	%val311 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val412 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 97, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val311, i32 %val412, i32 97 )
	%x.0.reg2mem.0.i.i = add i32 %indvar553.i.i, %x.0.i.i		; <i32> [#uses=6]
	%tmp89.i.i = icmp eq i32 %x.0.reg2mem.0.i.i, %tmp246.i		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp89.i.i, label %cond_next340.i.i, label %cond_true100.i.i

cond_true100.i.i:		; preds = %bb86.i.i
	%tmp103.i.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=2]
	%tmp106.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=2]
	%tmp108.i.i = mul i32 %tmp106.i.i, %y.0.reg2mem.0.ph.i.i		; <i32> [#uses=1]
	%tmp110.i.i = add i32 %tmp108.i.i, %x.0.reg2mem.0.i.i		; <i32> [#uses=1]
	%tmp110111.i.i = sext i32 %tmp110.i.i to i64		; <i64> [#uses=2]
	%tmp113.i.i = getelementptr %struct.point16t* %tmp103.i.i, i64 %tmp110111.i.i, i32 0		; <i16*> [#uses=1]
	%tmp114.i.i = load i16* %tmp113.i.i, align 2		; <i16> [#uses=1]
	%tmp117.i.i = load i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8		; <i16> [#uses=1]
	%tmp118.i.i = icmp eq i16 %tmp114.i.i, %tmp117.i.i		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp118.i.i, label %cond_true121.i.i, label %cond_false.split.i.i

cond_true121.i.i:		; preds = %cond_true100.i.i
	%tmp134.i.i = getelementptr %struct.point16t* %tmp103.i.i, i64 %tmp110111.i.i, i32 1		; <i16*> [#uses=1]
	%tmp135.i.i = load i16* %tmp134.i.i, align 2		; <i16> [#uses=1]
	%tmp135136.i.i = zext i16 %tmp135.i.i to i32		; <i32> [#uses=3]
	%tmp139.i.i = icmp slt i32 %tmp135136.i.i, %mindist.1.reg2mem.0.i.i		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp139.i.i, label %cond_true142.i.i, label %cond_next340.i.i

cond_true142.i.i:		; preds = %cond_true121.i.i
	%tmp342496.i.i = add i32 %x.0.reg2mem.0.i.i, 1		; <i32> [#uses=1]
	%tmp346509.i.i = icmp sgt i32 %tmp342496.i.i, %x2.0.i.i		; <i1> [#uses=1]
	%indvar.next554.i.i = add i32 %indvar553.i.i, 1		; <i32> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %tmp346509.i.i, label %bb349.i.i, label %bb86.i.i

cond_false.split.i.i:		; preds = %bb86.us.i.i, %cond_true100.i.i
	%tmp164.rle.i.i = phi i32 [ %tmp106.i.i, %cond_true100.i.i ], [ %tmp106.us.i.i, %bb86.us.i.i ]		; <i32> [#uses=1]
	%flcenter.1.reg2mem.0.lcssa520.us-lcssa.i.i = phi i8 [ %flcenter.1.reg2mem.0.i.i, %cond_true100.i.i ], [ %flcenter.1.reg2mem.0.us.i.i, %bb86.us.i.i ]		; <i8> [#uses=2]
	%mindist.1.reg2mem.0.lcssa517.us-lcssa.i.i = phi i32 [ %mindist.1.reg2mem.0.i.i, %cond_true100.i.i ], [ %mindist.1.reg2mem.0.us.i.i, %bb86.us.i.i ]		; <i32> [#uses=2]
	%x.0.reg2mem.0.lcssa514.us-lcssa.i.i = phi i32 [ %x.0.reg2mem.0.i.i, %cond_true100.i.i ], [ %x.0.reg2mem.0.us.i.i, %bb86.us.i.i ]		; <i32> [#uses=4]
	%tmp161.i.i = load i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32		; <i8*> [#uses=1]
	%tmp166.i.i = mul i32 %tmp164.rle.i.i, %y.0.reg2mem.0.ph.i.i		; <i32> [#uses=1]
	%tmp168.i.i = add i32 %tmp166.i.i, %x.0.reg2mem.0.lcssa514.us-lcssa.i.i		; <i32> [#uses=1]
	%tmp168169.i.i = sext i32 %tmp168.i.i to i64		; <i64> [#uses=1]
	%tmp170.i.i = getelementptr i8* %tmp161.i.i, i64 %tmp168169.i.i		; <i8*> [#uses=1]
	%tmp171.i.i = load i8* %tmp170.i.i, align 1		; <i8> [#uses=1]
	%tmp171172175.i.i = zext i8 %tmp171.i.i to i64		; <i64> [#uses=1]
	%tmp176.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 3, i64 %tmp171172175.i.i		; <i8*> [#uses=1]
	%tmp177.i.i = load i8* %tmp176.i.i, align 1		; <i8> [#uses=2]
	%tmp183.i.i = icmp eq i8 %tmp177.i.i, 0		; <i1> [#uses=1]
	br i1 %tmp183.i.i, label %cond_next340.i.i, label %cond_true197.critedge.i.i

cond_true197.critedge.i.i:		; preds = %cond_false.split.i.i
	%tmp207.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 8		; <i32> [#uses=1]
	%tmp233234.i.i = zext i8 %tmp177.i.i to i32		; <i32> [#uses=1]
	%tmp240.i.i = add i32 %tmp233234.i.i, %tmp207.i.i		; <i32> [#uses=1]
	%tmp241.i.i = srem i32 %tmp240.i.i, 256		; <i32> [#uses=1]
	%tmp248251.i.i = sext i32 %tmp241.i.i to i64		; <i64> [#uses=4]
	%tmp256.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp248251.i.i, i32 1		; <i32*> [#uses=4]
	%tmp257.i.i = load i32* %tmp256.i.i, align 8		; <i32> [#uses=1]
	%tmp259.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp248251.i.i, i32 2		; <i32*> [#uses=2]
	%tmp260.i.i = load i32* %tmp259.i.i, align 8		; <i32> [#uses=3]
	%tmp261.i.i = icmp eq i32 %tmp257.i.i, %tmp260.i.i		; <i1> [#uses=1]
	br i1 %tmp261.i.i, label %cond_true264.i.i, label %cond_next310.i.i

cond_true264.i.i:		; preds = %cond_true197.critedge.i.i
	%tmp271.i.i = shl i32 %tmp260.i.i, 1		; <i32> [#uses=2]
	%tmp279.i.i = malloc %struct.pointt, i32 %tmp271.i.i		; <%struct.pointt*> [#uses=2]
	%tmpcast.i.i = bitcast %struct.pointt* %tmp279.i.i to i8*		; <i8*> [#uses=1]
	%tmp289290.i.i = sext i32 %tmp260.i.i to i64		; <i64> [#uses=1]
	%tmp291.i.i = shl i64 %tmp289290.i.i, 3		; <i64> [#uses=1]
	%tmp293.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp248251.i.i, i32 0		; <%struct.pointt**> [#uses=3]
	%tmp294.i.i = load %struct.pointt** %tmp293.i.i, align 8		; <%struct.pointt*> [#uses=1]
	%tmp294297.i.i = bitcast %struct.pointt* %tmp294.i.i to i8*		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 19, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 93, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 95, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 96, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i.i, i8* %tmp294297.i.i, i64 %tmp291.i.i, i32 4 ) nounwind 
	%tmp301.i.i = load %struct.pointt** %tmp293.i.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp301.i.i
	store %struct.pointt* %tmp279.i.i, %struct.pointt** %tmp293.i.i, align 8
	store i32 %tmp271.i.i, i32* %tmp259.i.i, align 8
	br label %cond_next310.i.i

cond_next310.i.i:		; preds = %cond_true264.i.i, %cond_true197.critedge.i.i
	%tmp312.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp248251.i.i, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp313.i.i = load %struct.pointt** %tmp312.i.i, align 8		; <%struct.pointt*> [#uses=2]
	%tmp316.i.i = load i32* %tmp256.i.i, align 8		; <i32> [#uses=1]
	%tmp316324.i.i = sext i32 %tmp316.i.i to i64		; <i64> [#uses=2]
	%tmp326.i.i = getelementptr %struct.pointt* %tmp313.i.i, i64 %tmp316324.i.i, i32 0		; <i32*> [#uses=1]
	store i32 %x.0.reg2mem.0.lcssa514.us-lcssa.i.i, i32* %tmp326.i.i, align 4
	%tmp329.i.i = getelementptr %struct.pointt* %tmp313.i.i, i64 %tmp316324.i.i, i32 1		; <i32*> [#uses=1]
	store i32 %y.0.reg2mem.0.ph.i.i, i32* %tmp329.i.i, align 4
	%tmp334.i.i = load i32* %tmp256.i.i, align 8		; <i32> [#uses=1]
	%tmp335.i.i = add i32 %tmp334.i.i, 1		; <i32> [#uses=1]
	store i32 %tmp335.i.i, i32* %tmp256.i.i, align 8
	br label %cond_next340.i.i

cond_next340.i.i:		; preds = %cond_true121.us.i.i, %cond_next310.i.i, %cond_false.split.i.i, %cond_true121.i.i, %bb86.i.i
	%flcenter.1.reg2mem.0.lcssa521.i.i = phi i8 [ %flcenter.1.reg2mem.0.lcssa520.us-lcssa.i.i, %cond_next310.i.i ], [ %flcenter.1.reg2mem.0.lcssa520.us-lcssa.i.i, %cond_false.split.i.i ], [ %flcenter.1.reg2mem.0.i.i, %bb86.i.i ], [ %flcenter.1.reg2mem.0.i.i, %cond_true121.i.i ], [ %flcenter.1.reg2mem.0.us.i.i, %cond_true121.us.i.i ]		; <i8> [#uses=1]
	%mindist.1.reg2mem.0.lcssa518.i.i = phi i32 [ %mindist.1.reg2mem.0.lcssa517.us-lcssa.i.i, %cond_next310.i.i ], [ %mindist.1.reg2mem.0.lcssa517.us-lcssa.i.i, %cond_false.split.i.i ], [ %mindist.1.reg2mem.0.i.i, %bb86.i.i ], [ %mindist.1.reg2mem.0.i.i, %cond_true121.i.i ], [ %mindist.1.reg2mem.0.us.i.i, %cond_true121.us.i.i ]		; <i32> [#uses=1]
	%x.0.reg2mem.0.lcssa515.i.i = phi i32 [ %x.0.reg2mem.0.lcssa514.us-lcssa.i.i, %cond_next310.i.i ], [ %x.0.reg2mem.0.lcssa514.us-lcssa.i.i, %cond_false.split.i.i ], [ %x.0.reg2mem.0.i.i, %bb86.i.i ], [ %x.0.reg2mem.0.i.i, %cond_true121.i.i ], [ %x.0.reg2mem.0.us.i.i, %cond_true121.us.i.i ]		; <i32> [#uses=1]
	%tmp342.i.i = add i32 %x.0.reg2mem.0.lcssa515.i.i, 1		; <i32> [#uses=1]
	br label %bb343.i.i

bb343.i.i:		; preds = %cond_next340.i.i, %bb343.preheader.i.i
	%x.0.i.i = phi i32 [ %tmp342.i.i, %cond_next340.i.i ], [ %x1.0.i.i, %bb343.preheader.i.i ]		; <i32> [#uses=3]
	%mindist.1.i.i = phi i32 [ %mindist.1.reg2mem.0.lcssa518.i.i, %cond_next340.i.i ], [ %mindist.1.ph.i.i, %bb343.preheader.i.i ]		; <i32> [#uses=3]
	%flcenter.1.i.i = phi i8 [ %flcenter.1.reg2mem.0.lcssa521.i.i, %cond_next340.i.i ], [ %flcenter.1.ph.i.i, %bb343.preheader.i.i ]		; <i8> [#uses=3]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 96, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 96 )
	%tmp346.i.i = icmp sgt i32 %x.0.i.i, %x2.0.i.i		; <i1> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %tmp346.i.i, label %bb349.i.i, label %bb86.preheader.i.i

bb86.preheader.i.i:		; preds = %bb343.i.i
	br i1 %tmp93.i.i, label %bb86.i.i, label %bb86.us.i.i.preheader

bb86.us.i.i.preheader:		; preds = %bb86.preheader.i.i
	%tmp103.us.i.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=2]
	%tmp106.us.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=2]
	%tmp108.us.i.i = mul i32 %tmp106.us.i.i, %y.0.reg2mem.0.ph.i.i		; <i32> [#uses=1]
	%tmp117.us.i.i = load i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8		; <i16> [#uses=1]
	br label %bb86.us.i.i

bb86.us.i.i:		; preds = %cond_true142.us.i.i, %bb86.us.i.i.preheader
	%indvar.i.i = phi i32 [ %indvar.next.i.i, %cond_true142.us.i.i ], [ 0, %bb86.us.i.i.preheader ]		; <i32> [#uses=2]
	%mindist.1.reg2mem.0.us.i.i = phi i32 [ %tmp135136.us.i.i, %cond_true142.us.i.i ], [ %mindist.1.i.i, %bb86.us.i.i.preheader ]		; <i32> [#uses=3]
	%flcenter.1.reg2mem.0.us.i.i = phi i8 [ 0, %cond_true142.us.i.i ], [ %flcenter.1.i.i, %bb86.us.i.i.preheader ]		; <i8> [#uses=2]
	%val313 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val414 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 98, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val313, i32 %val414, i32 98 )
	%x.0.reg2mem.0.us.i.i = add i32 %indvar.i.i, %x.0.i.i		; <i32> [#uses=4]
	%tmp110.us.i.i = add i32 %tmp108.us.i.i, %x.0.reg2mem.0.us.i.i		; <i32> [#uses=1]
	%tmp110111.us.i.i = sext i32 %tmp110.us.i.i to i64		; <i64> [#uses=2]
	%tmp113.us.i.i = getelementptr %struct.point16t* %tmp103.us.i.i, i64 %tmp110111.us.i.i, i32 0		; <i16*> [#uses=1]
	%tmp114.us.i.i = load i16* %tmp113.us.i.i, align 2		; <i16> [#uses=1]
	%tmp118.us.i.i = icmp eq i16 %tmp114.us.i.i, %tmp117.us.i.i		; <i1> [#uses=1]
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %tmp118.us.i.i, label %cond_true121.us.i.i, label %cond_false.split.i.i

cond_true142.us.i.i:		; preds = %cond_true121.us.i.i
	%tmp342496.us.i.i = add i32 %x.0.reg2mem.0.us.i.i, 1		; <i32> [#uses=1]
	%tmp346509.us.i.i = icmp sgt i32 %tmp342496.us.i.i, %x2.0.i.i		; <i1> [#uses=1]
	%indvar.next.i.i = add i32 %indvar.i.i, 1		; <i32> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %tmp346509.us.i.i, label %bb349.i.i, label %bb86.us.i.i

cond_true121.us.i.i:		; preds = %bb86.us.i.i
	%tmp134.us.i.i = getelementptr %struct.point16t* %tmp103.us.i.i, i64 %tmp110111.us.i.i, i32 1		; <i16*> [#uses=1]
	%tmp135.us.i.i = load i16* %tmp134.us.i.i, align 2		; <i16> [#uses=1]
	%tmp135136.us.i.i = zext i16 %tmp135.us.i.i to i32		; <i32> [#uses=3]
	%tmp139.us.i.i = icmp slt i32 %tmp135136.us.i.i, %mindist.1.reg2mem.0.us.i.i		; <i1> [#uses=1]
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %tmp139.us.i.i, label %cond_true142.us.i.i, label %cond_next340.i.i

bb349.i.i:		; preds = %cond_true142.us.i.i, %bb343.i.i, %cond_true142.i.i
	%mindist.1.reg2mem.1.i.i = phi i32 [ %tmp135136.i.i, %cond_true142.i.i ], [ %tmp135136.us.i.i, %cond_true142.us.i.i ], [ %mindist.1.i.i, %bb343.i.i ]		; <i32> [#uses=1]
	%flcenter.1.reg2mem.1.i.i = phi i8 [ 0, %cond_true142.i.i ], [ 0, %cond_true142.us.i.i ], [ %flcenter.1.i.i, %bb343.i.i ]		; <i8> [#uses=1]
	%tmp351.i.i = add i32 %y.0.reg2mem.0.ph.i.i, 1		; <i32> [#uses=1]
	br label %bb352.i.i

bb352.i.i:		; preds = %bb349.i.i, %cond_next.i.i
	%y2.0.i.i = phi i32 [ %y2.0.reg2mem.0.ph.i.i, %bb349.i.i ], [ %tmp47.i.i, %cond_next.i.i ]		; <i32> [#uses=2]
	%y.0.i.i = phi i32 [ %tmp351.i.i, %bb349.i.i ], [ %y1.0.i.i, %cond_next.i.i ]		; <i32> [#uses=2]
	%mindist.2.i.i = phi i32 [ %mindist.1.reg2mem.1.i.i, %bb349.i.i ], [ 10000000, %cond_next.i.i ]		; <i32> [#uses=2]
	%flcenter.2.i.i = phi i8 [ %flcenter.1.reg2mem.1.i.i, %bb349.i.i ], [ 1, %cond_next.i.i ]		; <i8> [#uses=2]
	%tmp355.i.i = icmp sgt i32 %y.0.i.i, %y2.0.i.i		; <i1> [#uses=1]
	br i1 %tmp355.i.i, label %bb358.i.i, label %bb343.preheader.i.i

bb358.i.i:		; preds = %bb352.i.i, %cond_true79.i.i
	%mindist.2.reg2mem.0.i.i = phi i32 [ 10000000, %cond_true79.i.i ], [ %mindist.2.i.i, %bb352.i.i ]		; <i32> [#uses=1]
	%flcenter.2.reg2mem.0.i.i = phi i8 [ 1, %cond_true79.i.i ], [ %flcenter.2.i.i, %bb352.i.i ]		; <i8> [#uses=1]
	%tmp361.i.i = icmp eq i8 %flcenter.2.reg2mem.0.i.i, 0		; <i1> [#uses=1]
	%tmp367.i.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=2]
	%tmp370.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp372.i.i = mul i32 %tmp370.i.i, %tmp224.i		; <i32> [#uses=1]
	%tmp374.i.i = add i32 %tmp372.i.i, %tmp246.i		; <i32> [#uses=1]
	%tmp374375.i.i = sext i32 %tmp374.i.i to i64		; <i64> [#uses=3]
	%tmp386.i.i = load i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32		; <i8*> [#uses=1]
	%tmp395.i.i = getelementptr i8* %tmp386.i.i, i64 %tmp374375.i.i		; <i8*> [#uses=1]
	%tmp396.i.i = load i8* %tmp395.i.i, align 1		; <i8> [#uses=1]
	%tmp396397400.i.i = zext i8 %tmp396.i.i to i64		; <i64> [#uses=1]
	%tmp401.i.i = getelementptr %struct.way2obj* @way2, i32 0, i32 3, i64 %tmp396397400.i.i		; <i8*> [#uses=1]
	%tmp402.i.i = load i8* %tmp401.i.i, align 1		; <i8> [#uses=1]
	%tmp406407408.i.i = zext i8 %tmp402.i.i to i16		; <i16> [#uses=2]
	br i1 %tmp361.i.i, label %cond_true364.i.i, label %cond_false413.i.i

cond_true364.i.i:		; preds = %bb358.i.i
	%tmp409410.i.i = trunc i32 %mindist.2.reg2mem.0.i.i to i16		; <i16> [#uses=1]
	%tmp411.i.i = add i16 %tmp406407408.i.i, %tmp409410.i.i		; <i16> [#uses=1]
	%tmp412.i.i = getelementptr %struct.point16t* %tmp367.i.i, i64 %tmp374375.i.i, i32 1		; <i16*> [#uses=1]
	store i16 %tmp411.i.i, i16* %tmp412.i.i, align 2
	%tmp462510.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 8), align 8		; <i32> [#uses=1]
	%tmp464511.i.i = icmp eq i32 %tmp462510.i.i, %tmp246.i		; <i1> [#uses=1]
	br i1 %tmp464511.i.i, label %cond_true467.i.i, label %_ZN7way2obj12releasepointEii.exit.i

cond_false413.i.i:		; preds = %bb358.i.i
	%tmp458.i.i = getelementptr %struct.point16t* %tmp367.i.i, i64 %tmp374375.i.i, i32 1		; <i16*> [#uses=1]
	store i16 %tmp406407408.i.i, i16* %tmp458.i.i, align 2
	%tmp462.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 8), align 8		; <i32> [#uses=1]
	%tmp464.i.i = icmp eq i32 %tmp462.i.i, %tmp246.i		; <i1> [#uses=1]
	br i1 %tmp464.i.i, label %cond_true467.i.i, label %_ZN7way2obj12releasepointEii.exit.i

cond_true467.i.i:		; preds = %cond_false413.i.i, %cond_true364.i.i
	%tmp470.i.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 9), align 8		; <i32> [#uses=1]
	%tmp472.i.i = icmp eq i32 %tmp470.i.i, %tmp224.i		; <i1> [#uses=1]
	br i1 %tmp472.i.i, label %cond_true475.i.i, label %_ZN7way2obj12releasepointEii.exit.i

cond_true475.i.i:		; preds = %cond_true467.i.i
	store i8 1, i8* getelementptr (%struct.way2obj* @way2, i32 0, i32 12), align 8
	br label %_ZN7way2obj12releasepointEii.exit.i

_ZN7way2obj12releasepointEii.exit.i:		; preds = %cond_true475.i.i, %cond_true467.i.i, %cond_false413.i.i, %cond_true364.i.i, %bb203.i
	%tmp206.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 5), align 8		; <i32> [#uses=3]
	%tmp206209.i = sext i32 %tmp206.i to i64		; <i64> [#uses=2]
	%indvar.next.i = add i32 %indvar.i, 1		; <i32> [#uses=2]
	%exitcond.i = icmp eq i32 %indvar.next.i, %tmp324.i		; <i1> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i, label %bb255.i, label %bb203.i

bb255.i:		; preds = %_ZN7way2obj12releasepointEii.exit.i, %cond_false.i
	%.promoted24.rle25 = phi i32 [ %tmp164.i, %cond_false.i ], [ %tmp206.i, %_ZN7way2obj12releasepointEii.exit.i ]		; <i32> [#uses=1]
	%tmp206209.reg2mem.1.i = phi i64 [ %tmp174177.i, %cond_false.i ], [ %tmp206209.i, %_ZN7way2obj12releasepointEii.exit.i ]		; <i64> [#uses=1]
	%tmp265.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp206209.reg2mem.1.i, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp265.i, align 8
	%tmp269.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 8		; <i32> [#uses=1]
	%tmp270.i = add i32 %tmp269.i, 1		; <i32> [#uses=3]
	store i32 %tmp270.i, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 8
	%tmp276.i = load i8* getelementptr (%struct.way2obj* @way2, i32 0, i32 12), align 8		; <i8> [#uses=3]
	%tmp278.i = icmp eq i8 %tmp276.i, 0		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp278.i, label %cond_next282.i.outer, label %_ZN7way2obj4fillEii.exit

cond_next282.i.outer:		; preds = %bb255.i, %cond_next115.i
	%.promoted24.rle = phi i32 [ %.promoted24.rle25, %bb255.i ], [ 0, %cond_next115.i ]		; <i32> [#uses=1]
	%.promoted23.rle = phi i32 [ %tmp270.i, %bb255.i ], [ 0, %cond_next115.i ]		; <i32> [#uses=1]
	%tmp276310.rle.i.ph = phi i8 [ %tmp276.i, %bb255.i ], [ %tmp276303.i, %cond_next115.i ]		; <i8> [#uses=2]
	%tmp163.rle.i.ph = phi i32 [ %tmp270.i, %bb255.i ], [ 0, %cond_next115.i ]		; <i32> [#uses=1]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 93, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 93 )
	%tmp278311.i = icmp eq i8 %tmp276310.rle.i.ph, 0		; <i1> [#uses=1]
	%.promoted = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 6), align 4		; <i32> [#uses=1]
	br label %cond_next282.i

cond_next282.i:		; preds = %cond_next282.i.outer, %cond_true184.i
	%.tmp22.0 = phi i32 [ %.promoted24.rle, %cond_next282.i.outer ], [ %tmp164.i, %cond_true184.i ]		; <i32> [#uses=1]
	%.tmp21.0 = phi i32 [ %.promoted23.rle, %cond_next282.i.outer ], [ %tmp270307.i, %cond_true184.i ]		; <i32> [#uses=2]
	%.tmp.0 = phi i32 [ %.promoted, %cond_next282.i.outer ], [ %tmp188.i, %cond_true184.i ]		; <i32> [#uses=3]
	%tmp163.rle.i = phi i32 [ %tmp270307.i, %cond_true184.i ], [ %tmp163.rle.i.ph, %cond_next282.i.outer ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=4]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=4]
	store i32 94, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 94 )
	%tmp286.i = icmp slt i32 %.tmp.0, 265		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp286.i, label %bb160.i, label %_ZN7way2obj4fillEii.exit.loopexit.loopexit

_ZN7way2obj4fillEii.exit.loopexit.loopexit:		; preds = %cond_next282.i, %cond_true184.i
	%.tmp22.1 = phi i32 [ %.tmp22.0, %cond_next282.i ], [ %tmp164.i, %cond_true184.i ]		; <i32> [#uses=1]
	%.tmp21.1 = phi i32 [ %.tmp21.0, %cond_next282.i ], [ %tmp270307.i, %cond_true184.i ]		; <i32> [#uses=1]
	%.tmp.1 = phi i32 [ %.tmp.0, %cond_next282.i ], [ %tmp188.i, %cond_true184.i ]		; <i32> [#uses=1]
	store i32 %.tmp.1, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 6), align 4
	store i32 %.tmp21.1, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 7), align 4
	store i32 %.tmp22.1, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 5), align 4
	br label %_ZN7way2obj4fillEii.exit

_ZN7way2obj4fillEii.exit:		; preds = %_ZN7way2obj4fillEii.exit.loopexit.loopexit, %bb255.i, %cond_next115.i
	%tmp292.rle.i = phi i8 [ %tmp276303.i, %cond_next115.i ], [ %tmp276310.rle.i.ph, %_ZN7way2obj4fillEii.exit.loopexit.loopexit ], [ %tmp276.i, %bb255.i ]		; <i8> [#uses=1]
	%toBool52 = icmp eq i8 %tmp292.rle.i, 0		; <i1> [#uses=1]
	br i1 %toBool52, label %cond_true56, label %cond_next60

cond_true56:		; preds = %_ZN7way2obj4fillEii.exit
	store %struct.pointt* null, %struct.pointt** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_next60:		; preds = %_ZN7way2obj4fillEii.exit
	%tmp15.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=6]
	%tmp2324.i = shl i32 %tmp15.i, 3		; <i32> [#uses=1]
	%tmp28.i = malloc i8, i32 %tmp2324.i		; <i8*> [#uses=3]
	%tmp35.i1 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 9), align 8		; <i32> [#uses=1]
	%tmp38.i2 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 8), align 8		; <i32> [#uses=1]
	%tmp48.i = icmp eq i32 %tmp15.i, 0		; <i1> [#uses=1]
	br i1 %tmp48.i, label %cond_true.i3, label %cond_next88.i

cond_true.i3:		; preds = %cond_next60
	%tmp53.i = shl i32 %tmp15.i, 1		; <i32> [#uses=1]
	%tmp5657.i = shl i32 %tmp15.i, 4		; <i32> [#uses=1]
	%tmp63.i = malloc i8, i32 %tmp5657.i		; <i8*> [#uses=2]
	%tmp7273.i = sext i32 %tmp15.i to i64		; <i64> [#uses=1]
	%tmp74.i = shl i64 %tmp7273.i, 3		; <i64> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 19, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmp63.i, i8* %tmp28.i, i64 %tmp74.i, i32 8 ) nounwind 
	free i8* %tmp28.i
	br label %cond_next88.i

cond_next88.i:		; preds = %cond_true.i3, %cond_next60
	%wayar.0.2.in.i = phi i8* [ %tmp63.i, %cond_true.i3 ], [ %tmp28.i, %cond_next60 ]		; <i8*> [#uses=2]
	%wayar.2.2.i = phi i32 [ %tmp53.i, %cond_true.i3 ], [ %tmp15.i, %cond_next60 ]		; <i32> [#uses=1]
	%wayar.0.2.i = bitcast i8* %wayar.0.2.in.i to %struct.pointt*		; <%struct.pointt*> [#uses=2]
	%tmp102.i = bitcast i8* %wayar.0.2.in.i to i32*		; <i32*> [#uses=1]
	store i32 %tmp38.i2, i32* %tmp102.i, align 4
	%tmp105.i = getelementptr %struct.pointt* %wayar.0.2.i, i32 0, i32 1		; <i32*> [#uses=1]
	store i32 %tmp35.i1, i32* %tmp105.i, align 4
	store i32 1, i32* %waylength, align 4
	br label %cond_next496.i

bb113.i:		; preds = %cond_next496.i
	%tmp115.i = load i32* %waylength, align 4		; <i32> [#uses=2]
	%tmp116.i = add i32 %tmp115.i, -1		; <i32> [#uses=1]
	%tmp121122.i = sext i32 %tmp116.i to i64		; <i64> [#uses=2]
	%tmp127.i = getelementptr %struct.pointt* %wayar.0.1.reg2mem.0.i, i64 %tmp121122.i, i32 0		; <i32*> [#uses=1]
	%tmp128.i = load i32* %tmp127.i, align 4		; <i32> [#uses=2]
	%tmp129.i = add i32 %tmp128.i, -1		; <i32> [#uses=2]
	%tmp143.i = getelementptr %struct.pointt* %wayar.0.1.reg2mem.0.i, i64 %tmp121122.i, i32 1		; <i32*> [#uses=1]
	%tmp144.i = load i32* %tmp143.i, align 4		; <i32> [#uses=2]
	%tmp145.i4 = add i32 %tmp144.i, -1		; <i32> [#uses=2]
	%tmp161.i = add i32 %tmp128.i, 1		; <i32> [#uses=2]
	%tmp177.i = add i32 %tmp144.i, 1		; <i32> [#uses=2]
	%tmp179.i5 = icmp slt i32 %tmp129.i, 0		; <i1> [#uses=1]
	%x1.0.i = select i1 %tmp179.i5, i32 0, i32 %tmp129.i		; <i32> [#uses=2]
	%tmp185.i = icmp slt i32 %tmp145.i4, 0		; <i1> [#uses=1]
	%y1.0.i = select i1 %tmp185.i, i32 0, i32 %tmp145.i4		; <i32> [#uses=3]
	%tmp192.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 13), align 8		; <i32> [#uses=2]
	%tmp194.i = icmp slt i32 %tmp192.i, %tmp161.i		; <i1> [#uses=1]
	%x2.0.i = select i1 %tmp194.i, i32 %tmp192.i, i32 %tmp161.i		; <i32> [#uses=2]
	%tmp204.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 14), align 8		; <i32> [#uses=3]
	%tmp206.i6 = icmp slt i32 %tmp204.i, %tmp177.i		; <i1> [#uses=1]
	br i1 %tmp206.i6, label %cond_true209.i, label %bb373.i

cond_true209.i:		; preds = %bb113.i
	%tmp376634.i = icmp sgt i32 %y1.0.i, %tmp204.i		; <i1> [#uses=1]
	br i1 %tmp376634.i, label %bb379.i, label %bb364.preheader.i

bb364.preheader.i:		; preds = %bb373.i, %cond_true209.i
	%y2.0.reg2mem.0.ph.i = phi i32 [ %tmp204.i, %cond_true209.i ], [ %y2.0.i, %bb373.i ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph.i = phi i32 [ %y1.0.i, %cond_true209.i ], [ %y.0.i, %bb373.i ]		; <i32> [#uses=5]
	%mx.1.ph.i = phi i32 [ %mx.3.reg2mem.0.i, %cond_true209.i ], [ %mx.2.i, %bb373.i ]		; <i32> [#uses=2]
	%my.1.ph.i = phi i32 [ %my.3.reg2mem.0.i, %cond_true209.i ], [ %my.2.i, %bb373.i ]		; <i32> [#uses=2]
	%mind.1.ph.i = phi i32 [ 100000000, %cond_true209.i ], [ %mind.2.i, %bb373.i ]		; <i32> [#uses=2]
	%tmp367647.i = icmp sgt i32 %x1.0.i, %x2.0.i		; <i1> [#uses=1]
	br i1 %tmp367647.i, label %bb370.i, label %bb.nph.i

bb.nph.i:		; preds = %bb364.preheader.i
	%tmp220.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=2]
	%tmp225.i = mul i32 %tmp499.i, %y.0.reg2mem.0.ph.i		; <i32> [#uses=1]
	%tmp234.i = load i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8		; <i16> [#uses=1]
	br label %bb217.i

bb217.i:		; preds = %cond_next361.i, %bb.nph.i
	%indvar658.i = phi i32 [ 0, %bb.nph.i ], [ %indvar.next659.i, %cond_next361.i ]		; <i32> [#uses=2]
	%mind.1646.i = phi i32 [ %mind.1.ph.i, %bb.nph.i ], [ %mind.0.i, %cond_next361.i ]		; <i32> [#uses=6]
	%my.1644.i = phi i32 [ %my.1.ph.i, %bb.nph.i ], [ %my.0.i, %cond_next361.i ]		; <i32> [#uses=4]
	%mx.1643.i = phi i32 [ %mx.1.ph.i, %bb.nph.i ], [ %mx.0.i, %cond_next361.i ]		; <i32> [#uses=4]
	%val317 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val418 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 100, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val317, i32 %val418, i32 100 )
	%x.0645.i = add i32 %indvar658.i, %x1.0.i		; <i32> [#uses=5]
	%tmp227.i = add i32 %tmp225.i, %x.0645.i		; <i32> [#uses=1]
	%tmp227228.i = sext i32 %tmp227.i to i64		; <i64> [#uses=2]
	%tmp230.i = getelementptr %struct.point16t* %tmp220.i, i64 %tmp227228.i, i32 0		; <i16*> [#uses=1]
	%tmp231.i = load i16* %tmp230.i, align 2		; <i16> [#uses=1]
	%tmp235.i = icmp eq i16 %tmp231.i, %tmp234.i		; <i1> [#uses=1]
	br i1 %tmp235.i, label %cond_true238.i, label %cond_next361.i

cond_true238.i:		; preds = %bb217.i
	%tmp251.i = getelementptr %struct.point16t* %tmp220.i, i64 %tmp227228.i, i32 1		; <i16*> [#uses=1]
	%tmp252.i = load i16* %tmp251.i, align 2		; <i16> [#uses=1]
	%tmp252253.i = zext i16 %tmp252.i to i32		; <i32> [#uses=3]
	%tmp255.i = icmp slt i32 %tmp252253.i, %mind.1646.i		; <i1> [#uses=1]
	br i1 %tmp255.i, label %cond_next361.i, label %cond_false.i8

cond_false.i8:		; preds = %cond_true238.i
	%tmp292.i = icmp eq i32 %tmp252253.i, %mind.1646.i		; <i1> [#uses=1]
	br i1 %tmp292.i, label %cond_true295.i, label %cond_next361.i

cond_true295.i:		; preds = %cond_false.i8
	%tmp298.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 10), align 8		; <i32> [#uses=2]
	%tmp300.i = sub i32 %tmp298.i, %mx.1643.i		; <i32> [#uses=2]
	%tmp305.i = mul i32 %tmp300.i, %tmp300.i		; <i32> [#uses=1]
	%tmp310.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 11), align 8		; <i32> [#uses=2]
	%tmp312.i = sub i32 %tmp310.i, %my.1644.i		; <i32> [#uses=2]
	%tmp317.i = mul i32 %tmp312.i, %tmp312.i		; <i32> [#uses=1]
	%tmp322.i = add i32 %tmp317.i, %tmp305.i		; <i32> [#uses=1]
	%tmp327.i = sub i32 %tmp298.i, %x.0645.i		; <i32> [#uses=2]
	%tmp332.i = mul i32 %tmp327.i, %tmp327.i		; <i32> [#uses=1]
	%tmp339.i = sub i32 %tmp310.i, %y.0.reg2mem.0.ph.i		; <i32> [#uses=2]
	%tmp344.i = mul i32 %tmp339.i, %tmp339.i		; <i32> [#uses=1]
	%tmp349.i = add i32 %tmp344.i, %tmp332.i		; <i32> [#uses=1]
	%tmp352.i = icmp slt i32 %tmp349.i, %tmp322.i		; <i1> [#uses=1]
	br i1 %tmp352.i, label %cond_true355.i, label %cond_next361.i

cond_true355.i:		; preds = %cond_true295.i
	br label %cond_next361.i

cond_next361.i:		; preds = %cond_true355.i, %cond_true295.i, %cond_false.i8, %cond_true238.i, %bb217.i
	%mx.0.i = phi i32 [ %x.0645.i, %cond_true355.i ], [ %mx.1643.i, %bb217.i ], [ %x.0645.i, %cond_true238.i ], [ %mx.1643.i, %cond_false.i8 ], [ %mx.1643.i, %cond_true295.i ]		; <i32> [#uses=2]
	%my.0.i = phi i32 [ %y.0.reg2mem.0.ph.i, %cond_true355.i ], [ %my.1644.i, %bb217.i ], [ %y.0.reg2mem.0.ph.i, %cond_true238.i ], [ %my.1644.i, %cond_false.i8 ], [ %my.1644.i, %cond_true295.i ]		; <i32> [#uses=2]
	%mind.0.i = phi i32 [ %mind.1646.i, %cond_true355.i ], [ %mind.1646.i, %bb217.i ], [ %tmp252253.i, %cond_true238.i ], [ %mind.1646.i, %cond_false.i8 ], [ %mind.1646.i, %cond_true295.i ]		; <i32> [#uses=2]
	%tmp363.i = add i32 %x.0645.i, 1		; <i32> [#uses=1]
	%tmp367.i = icmp sgt i32 %tmp363.i, %x2.0.i		; <i1> [#uses=1]
	%indvar.next659.i = add i32 %indvar658.i, 1		; <i32> [#uses=1]
	store i32 %val418, i32* @cg_caller_call_site_var, align 4
	store i32 %val317, i32* @cg_caller_id_var, align 4
	br i1 %tmp367.i, label %bb370.i, label %bb217.i

bb370.i:		; preds = %cond_next361.i, %bb364.preheader.i
	%mind.1.lcssa.i = phi i32 [ %mind.1.ph.i, %bb364.preheader.i ], [ %mind.0.i, %cond_next361.i ]		; <i32> [#uses=1]
	%my.1.lcssa.i = phi i32 [ %my.1.ph.i, %bb364.preheader.i ], [ %my.0.i, %cond_next361.i ]		; <i32> [#uses=1]
	%mx.1.lcssa.i = phi i32 [ %mx.1.ph.i, %bb364.preheader.i ], [ %mx.0.i, %cond_next361.i ]		; <i32> [#uses=1]
	%tmp372.i = add i32 %y.0.reg2mem.0.ph.i, 1		; <i32> [#uses=1]
	br label %bb373.i

bb373.i:		; preds = %bb370.i, %bb113.i
	%y2.0.i = phi i32 [ %y2.0.reg2mem.0.ph.i, %bb370.i ], [ %tmp177.i, %bb113.i ]		; <i32> [#uses=2]
	%mx.2.i = phi i32 [ %mx.1.lcssa.i, %bb370.i ], [ %mx.3.reg2mem.0.i, %bb113.i ]		; <i32> [#uses=2]
	%my.2.i = phi i32 [ %my.1.lcssa.i, %bb370.i ], [ %my.3.reg2mem.0.i, %bb113.i ]		; <i32> [#uses=2]
	%y.0.i = phi i32 [ %tmp372.i, %bb370.i ], [ %y1.0.i, %bb113.i ]		; <i32> [#uses=2]
	%mind.2.i = phi i32 [ %mind.1.lcssa.i, %bb370.i ], [ 100000000, %bb113.i ]		; <i32> [#uses=1]
	%tmp376.i = icmp sgt i32 %y.0.i, %y2.0.i		; <i1> [#uses=1]
	br i1 %tmp376.i, label %bb379.i, label %bb364.preheader.i

bb379.i:		; preds = %bb373.i, %cond_true209.i
	%mx.2.reg2mem.0.i = phi i32 [ %mx.3.reg2mem.0.i, %cond_true209.i ], [ %mx.2.i, %bb373.i ]		; <i32> [#uses=3]
	%my.2.reg2mem.0.i = phi i32 [ %my.3.reg2mem.0.i, %cond_true209.i ], [ %my.2.i, %bb373.i ]		; <i32> [#uses=3]
	%tmp382.i = add i32 %tmp115.i, 1		; <i32> [#uses=1]
	store i32 %tmp382.i, i32* %waylength, align 4
	%tmp400.i = icmp eq i32 %wayar.1.0.reg2mem.0.i, %wayar.2.1.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp400.i, label %cond_true403.i, label %cond_next447.i

cond_true403.i:		; preds = %bb379.i
	%tmp410.i = shl i32 %wayar.2.1.reg2mem.0.i, 1		; <i32> [#uses=2]
	%tmp420.i = malloc %struct.pointt, i32 %tmp410.i		; <%struct.pointt*> [#uses=2]
	%tmpcast.i9 = bitcast %struct.pointt* %tmp420.i to i8*		; <i8*> [#uses=1]
	%tmp429430.i = sext i32 %wayar.2.1.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp431.i = shl i64 %tmp429430.i, 3		; <i64> [#uses=1]
	%tmp433436.i = bitcast %struct.pointt* %wayar.0.1.reg2mem.0.i to i8*		; <i8*> [#uses=1]
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 19, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 99, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i9, i8* %tmp433436.i, i64 %tmp431.i, i32 4 ) nounwind 
	free %struct.pointt* %wayar.0.1.reg2mem.0.i
	br label %cond_next447.i

cond_next447.i:		; preds = %cond_true403.i, %bb379.i
	%wayar.0.0.i = phi %struct.pointt* [ %tmp420.i, %cond_true403.i ], [ %wayar.0.1.reg2mem.0.i, %bb379.i ]		; <%struct.pointt*> [#uses=4]
	%wayar.2.0.i = phi i32 [ %tmp410.i, %cond_true403.i ], [ %wayar.2.1.reg2mem.0.i, %bb379.i ]		; <i32> [#uses=1]
	%tmp451459.i = sext i32 %wayar.1.0.reg2mem.0.i to i64		; <i64> [#uses=2]
	%tmp461.i = getelementptr %struct.pointt* %wayar.0.0.i, i64 %tmp451459.i, i32 0		; <i32*> [#uses=1]
	store i32 %mx.2.reg2mem.0.i, i32* %tmp461.i, align 4
	%tmp464.i = getelementptr %struct.pointt* %wayar.0.0.i, i64 %tmp451459.i, i32 1		; <i32*> [#uses=1]
	store i32 %my.2.reg2mem.0.i, i32* %tmp464.i, align 4
	%tmp473.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 10), align 8		; <i32> [#uses=1]
	%tmp475.i = icmp eq i32 %tmp473.i, %mx.2.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp475.i, label %cond_true478.i, label %bb489.i

cond_true478.i:		; preds = %cond_next447.i
	%tmp481.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 11), align 8		; <i32> [#uses=1]
	%tmp483.i = icmp eq i32 %tmp481.i, %my.2.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp483.i, label %cond_true486.i, label %bb489.i

cond_true486.i:		; preds = %cond_true478.i
	br label %bb489.i

bb489.i:		; preds = %cond_true486.i, %cond_true478.i, %cond_next447.i
	%flfinish.0.i = phi i8 [ 1, %cond_true486.i ], [ %flfinish.0.reg2mem.0.i, %cond_next447.i ], [ %flfinish.0.reg2mem.0.i, %cond_true478.i ]		; <i8> [#uses=2]
	%cond.i = icmp eq i8 %flfinish.0.i, 0		; <i1> [#uses=1]
	store i32 %val416, i32* @cg_caller_call_site_var, align 4
	store i32 %val315, i32* @cg_caller_id_var, align 4
	br i1 %cond.i, label %cond_next496.i, label %cond_next523.i.loopexit

cond_next496.i:		; preds = %bb489.i, %cond_next88.i
	%index.0.reg2mem.0.i = phi i32 [ 0, %cond_next88.i ], [ %wayar.1.0.reg2mem.0.i, %bb489.i ]		; <i32> [#uses=3]
	%wayar.0.1.reg2mem.0.i = phi %struct.pointt* [ %wayar.0.2.i, %cond_next88.i ], [ %wayar.0.0.i, %bb489.i ]		; <%struct.pointt*> [#uses=7]
	%wayar.2.1.reg2mem.0.i = phi i32 [ %wayar.2.2.i, %cond_next88.i ], [ %wayar.2.0.i, %bb489.i ]		; <i32> [#uses=4]
	%mx.3.reg2mem.0.i = phi i32 [ 0, %cond_next88.i ], [ %mx.2.reg2mem.0.i, %bb489.i ]		; <i32> [#uses=3]
	%my.3.reg2mem.0.i = phi i32 [ 0, %cond_next88.i ], [ %my.2.reg2mem.0.i, %bb489.i ]		; <i32> [#uses=3]
	%flfinish.0.reg2mem.0.i = phi i8 [ 0, %cond_next88.i ], [ %flfinish.0.i, %bb489.i ]		; <i8> [#uses=3]
	%val315 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val416 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 99, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val315, i32 %val416, i32 99 )
	%wayar.1.0.reg2mem.0.i = add i32 %index.0.reg2mem.0.i, 1		; <i32> [#uses=4]
	%tmp499.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=2]
	%tmp502.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 8		; <i32> [#uses=1]
	%tmp503.i = mul i32 %tmp502.i, %tmp499.i		; <i32> [#uses=1]
	%tmp505.i = icmp sgt i32 %tmp503.i, %index.0.reg2mem.0.i		; <i1> [#uses=1]
	store i32 %val416, i32* @cg_caller_call_site_var, align 4
	store i32 %val315, i32* @cg_caller_id_var, align 4
	br i1 %tmp505.i, label %bb113.i, label %bb508.i

bb508.i:		; preds = %cond_next496.i
	%tmp511.i = icmp eq i8 %flfinish.0.reg2mem.0.i, 0		; <i1> [#uses=1]
	br i1 %tmp511.i, label %cond_true514.i, label %cond_next523.i

cond_true514.i:		; preds = %bb508.i
	free %struct.pointt* %wayar.0.1.reg2mem.0.i
	store %struct.pointt* null, %struct.pointt** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store %struct.pointt* null, %struct.pointt** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_next523.i.loopexit:		; preds = %bb489.i
	%tmp469.i = add i32 %index.0.reg2mem.0.i, 2		; <i32> [#uses=1]
	br label %cond_next523.i

cond_next523.i:		; preds = %cond_next523.i.loopexit, %bb508.i
	%wayar.0.1.reg2mem.1.i = phi %struct.pointt* [ %wayar.0.1.reg2mem.0.i, %bb508.i ], [ %wayar.0.0.i, %cond_next523.i.loopexit ]		; <%struct.pointt*> [#uses=3]
	%wayar.1.0.reg2mem.1.i = phi i32 [ %wayar.1.0.reg2mem.0.i, %bb508.i ], [ %tmp469.i, %cond_next523.i.loopexit ]		; <i32> [#uses=3]
	%tmp528.i = malloc %struct.pointt, i32 %wayar.1.0.reg2mem.1.i		; <%struct.pointt*> [#uses=1]
	store %struct.pointt* %tmp528.i, %struct.pointt** %wayar, align 8
	%i.0640.i = add i32 %wayar.1.0.reg2mem.1.i, -1		; <i32> [#uses=3]
	%tmp571642.i = icmp sgt i32 %i.0640.i, -1		; <i1> [#uses=1]
	br i1 %tmp571642.i, label %bb534.preheader.i, label %bb574.i

bb534.preheader.i:		; preds = %cond_next523.i
	%tmp654.i = icmp slt i32 %i.0640.i, 0		; <i1> [#uses=1]
	%tmp655.i = select i1 %tmp654.i, i32 1, i32 %wayar.1.0.reg2mem.1.i		; <i32> [#uses=1]
	br label %bb534.i

bb534.i:		; preds = %bb534.i, %bb534.preheader.i
	%indvar.i10 = phi i32 [ 0, %bb534.preheader.i ], [ %indvar.next.i12, %bb534.i ]		; <i32> [#uses=3]
	%val319 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val420 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 101, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val319, i32 %val420, i32 101 )
	%i.0.reg2mem.0.i11 = sub i32 %i.0640.i, %indvar.i10		; <i32> [#uses=1]
	%tmp536.i = load %struct.pointt** %wayar, align 8		; <%struct.pointt*> [#uses=2]
	%tmp547548.i = sext i32 %i.0.reg2mem.0.i11 to i64		; <i64> [#uses=2]
	%tmp554.i = getelementptr %struct.pointt* %wayar.0.1.reg2mem.1.i, i64 %tmp547548.i, i32 0		; <i32*> [#uses=1]
	%tmp555.i = load i32* %tmp554.i, align 4		; <i32> [#uses=1]
	%tmp557.i = getelementptr %struct.pointt* %wayar.0.1.reg2mem.1.i, i64 %tmp547548.i, i32 1		; <i32*> [#uses=1]
	%tmp558.i = load i32* %tmp557.i, align 4		; <i32> [#uses=1]
	%tmp541559.i = sext i32 %indvar.i10 to i64		; <i64> [#uses=2]
	%tmp561.i = getelementptr %struct.pointt* %tmp536.i, i64 %tmp541559.i, i32 0		; <i32*> [#uses=1]
	store i32 %tmp555.i, i32* %tmp561.i, align 4
	%tmp564.i = getelementptr %struct.pointt* %tmp536.i, i64 %tmp541559.i, i32 1		; <i32*> [#uses=1]
	store i32 %tmp558.i, i32* %tmp564.i, align 4
	%indvar.next.i12 = add i32 %indvar.i10, 1		; <i32> [#uses=2]
	%exitcond.i13 = icmp eq i32 %indvar.next.i12, %tmp655.i		; <i1> [#uses=1]
	store i32 %val420, i32* @cg_caller_call_site_var, align 4
	store i32 %val319, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i13, label %bb574.i, label %bb534.i

bb574.i:		; preds = %bb534.i, %cond_next523.i
	free %struct.pointt* %wayar.0.1.reg2mem.1.i
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1
}

define internal fastcc void @_ZN6wayobj7destroyEv() nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 20, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 20 )
	%tmp2 = load i32** @way.19, align 8		; <i32*> [#uses=2]
	%tmp3 = icmp eq i32* %tmp2, null		; <i1> [#uses=1]
	br i1 %tmp3, label %cond_next, label %cond_true

cond_true:		; preds = %entry
	%tmp78 = bitcast i32* %tmp2 to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 20, i32* @cg_caller_id_var, align 4
	tail call void @_ZdaPv( i8* %tmp78 ) nounwind 
	br label %cond_next

cond_next:		; preds = %cond_true, %entry
	%tmp11 = load i32** @way.18, align 8		; <i32*> [#uses=2]
	%tmp12 = icmp eq i32* %tmp11, null		; <i1> [#uses=1]
	br i1 %tmp12, label %cond_next20, label %cond_true15

cond_true15:		; preds = %cond_next
	%tmp1819 = bitcast i32* %tmp11 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 20, i32* @cg_caller_id_var, align 4
	tail call void @_ZdaPv( i8* %tmp1819 ) nounwind 
	br label %cond_next20

cond_next20:		; preds = %cond_true15, %cond_next
	%tmp23 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=2]
	%tmp24 = icmp eq %struct.point16t* %tmp23, null		; <i1> [#uses=1]
	br i1 %tmp24, label %cond_next32, label %cond_true27

cond_true27:		; preds = %cond_next20
	%tmp3031 = bitcast %struct.point16t* %tmp23 to i8*		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 20, i32* @cg_caller_id_var, align 4
	tail call void @_ZdaPv( i8* %tmp3031 ) nounwind 
	br label %cond_next32

cond_next32:		; preds = %cond_true27, %cond_next20
	%tmp36 = load i16** @way.16, align 8		; <i16*> [#uses=2]
	%tmp37 = icmp eq i16* %tmp36, null		; <i1> [#uses=1]
	br i1 %tmp37, label %UnifiedReturnBlock, label %cond_true40

cond_true40:		; preds = %cond_next32
	%tmp4344 = bitcast i16* %tmp36 to i8*		; <i8*> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 20, i32* @cg_caller_id_var, align 4
	tail call void @_ZdaPv( i8* %tmp4344 ) nounwind 
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void

UnifiedReturnBlock:		; preds = %cond_next32
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN6wayobj6createE17createwaymnginfot(i32 %info.0.0, i32 %info.0.1, i32 %info.0.2, i32 %info.0.3, i32 %info.0.4, i32 %info.0.5, i32 %info.0.6, i32 %info.0.7) {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 21, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 21 )
	%info_addr = alloca %struct.createwaymnginfot		; <%struct.createwaymnginfot*> [#uses=4]
	%tmp = bitcast %struct.createwaymnginfot* %info_addr to { [8 x i32] }*		; <{ [8 x i32] }*> [#uses=7]
	%tmp2 = bitcast %struct.createwaymnginfot* %info_addr to i32*		; <i32*> [#uses=1]
	store i32 %info.0.0, i32* %tmp2, align 8
	%tmp3 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 1		; <i32*> [#uses=1]
	store i32 %info.0.1, i32* %tmp3, align 4
	%tmp4 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 2		; <i32*> [#uses=1]
	store i32 %info.0.2, i32* %tmp4, align 4
	%tmp5 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 3		; <i32*> [#uses=1]
	store i32 %info.0.3, i32* %tmp5, align 4
	%tmp6 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 4		; <i32*> [#uses=1]
	store i32 %info.0.4, i32* %tmp6, align 4
	%tmp7 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 5		; <i32*> [#uses=1]
	store i32 %info.0.5, i32* %tmp7, align 4
	%tmp8 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 6		; <i32*> [#uses=1]
	store i32 %info.0.6, i32* %tmp8, align 4
	%tmp9 = getelementptr { [8 x i32] }* %tmp, i32 0, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 %info.0.7, i32* %tmp9, align 4
	%tmp29 = getelementptr %struct.createwaymnginfot* %info_addr, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp30 = load i32* %tmp29, align 4		; <i32> [#uses=3]
	%tmp32 = getelementptr %struct.createwaymnginfot* %info_addr, i32 0, i32 5		; <i32*> [#uses=1]
	%tmp33 = load i32* %tmp32, align 4		; <i32> [#uses=3]
	store i32 %tmp30, i32* @way.0, align 32
	store i32 %tmp33, i32* @way.1, align 8
	store i32 %tmp30, i32* @way.2, align 8
	%tmp55 = shl i32 1, %tmp30		; <i32> [#uses=4]
	%tmp56 = add i32 %tmp55, -1		; <i32> [#uses=1]
	store i32 %tmp56, i32* @way.3, align 8
	%tmp62 = shl i32 1, %tmp33		; <i32> [#uses=3]
	%tmp63 = add i32 %tmp62, -1		; <i32> [#uses=1]
	store i32 %tmp63, i32* @way.4, align 8
	%tmp69 = add i32 %tmp55, -2		; <i32> [#uses=1]
	store i32 %tmp69, i32* @way.5, align 8
	%tmp75 = add i32 %tmp62, -2		; <i32> [#uses=1]
	store i32 %tmp75, i32* @way.6, align 8
	store i32 %tmp55, i32* @way.7, align 8
	store i32 %tmp62, i32* @way.8, align 8
	%tmp195 = shl i32 %tmp55, %tmp33		; <i32> [#uses=1]
	%tmp196197 = sext i32 %tmp195 to i64		; <i64> [#uses=2]
	%tmp199 = shl i64 %tmp196197, 1		; <i64> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	%tmp200 = call i8* @_Znam( i64 %tmp199 )		; <i8*> [#uses=1]
	%tmp200201 = bitcast i8* %tmp200 to i16*		; <i16*> [#uses=1]
	store i16* %tmp200201, i16** @way.16, align 8
	%tmp207 = shl i64 %tmp196197, 2		; <i64> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	%tmp208 = call i8* @_Znam( i64 %tmp207 )		; <i8*> [#uses=1]
	%tmp208209 = bitcast i8* %tmp208 to %struct.point16t*		; <%struct.point16t*> [#uses=1]
	store %struct.point16t* %tmp208209, %struct.point16t** @way.17, align 8
	%tmp217 = load i32* @way.0, align 32		; <i32> [#uses=1]
	%tmp218 = shl i32 1, %tmp217		; <i32> [#uses=1]
	%tmp221 = load i32* @way.1, align 8		; <i32> [#uses=1]
	%tmp222 = shl i32 %tmp218, %tmp221		; <i32> [#uses=1]
	%tmp223224 = sext i32 %tmp222 to i64		; <i64> [#uses=2]
	%tmp225 = shl i64 %tmp223224, 1		; <i64> [#uses=1]
	%tmp228 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp228229 = bitcast i16* %tmp228 to i8*		; <i8*> [#uses=1]
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp228229, i8 0, i64 %tmp225, i32 2 )
	%tmp232 = shl i64 %tmp223224, 2		; <i64> [#uses=1]
	%tmp235 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=1]
	%tmp235236 = bitcast %struct.point16t* %tmp235 to i8*		; <i8*> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp235236, i8 0, i64 %tmp232, i32 2 )
	%tmp252370 = load i32* @way.8, align 8		; <i32> [#uses=4]
	%tmp254372 = icmp sgt i32 %tmp252370, 0		; <i1> [#uses=2]
	br i1 %tmp254372, label %bb.preheader, label %bb293

bb.preheader:		; preds = %entry
	%tmp239 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp242 = load i32* @way.2, align 8		; <i32> [#uses=1]
	br label %bb

bb:		; preds = %bb, %bb.preheader
	%y.0.reg2mem.0 = phi i32 [ %tmp248, %bb ], [ 0, %bb.preheader ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 102, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 102 )
	%tmp244 = shl i32 %y.0.reg2mem.0, %tmp242		; <i32> [#uses=1]
	%tmp244245 = sext i32 %tmp244 to i64		; <i64> [#uses=1]
	%tmp246 = getelementptr i16* %tmp239, i64 %tmp244245		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp246, align 2
	%tmp248 = add i32 %y.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp254 = icmp sgt i32 %tmp252370, %tmp248		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp254, label %bb, label %bb275

bb258:		; preds = %bb258.preheader, %bb258
	%y.1.reg2mem.0 = phi i32 [ %tmp274, %bb258 ], [ 0, %bb258.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 103, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 103 )
	%tmp266 = shl i32 %y.1.reg2mem.0, %tmp264		; <i32> [#uses=1]
	%tmp270 = or i32 %tmp266, %tmp269		; <i32> [#uses=1]
	%tmp270271 = sext i32 %tmp270 to i64		; <i64> [#uses=1]
	%tmp272 = getelementptr i16* %tmp261, i64 %tmp270271		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp272, align 2
	%tmp274 = add i32 %y.1.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp280378 = icmp sgt i32 %tmp252370, %tmp274		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp280378, label %bb258, label %bb293

bb275:		; preds = %bb
	br i1 %tmp254372, label %bb258.preheader, label %bb293

bb258.preheader:		; preds = %bb275
	%tmp261 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp264 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%tmp269 = load i32* @way.3, align 8		; <i32> [#uses=1]
	br label %bb258

bb284:		; preds = %bb284.preheader, %bb284
	%x.0.reg2mem.0 = phi i32 [ %tmp292, %bb284 ], [ 0, %bb284.preheader ]		; <i32> [#uses=2]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 104, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 104 )
	%tmp288289 = sext i32 %x.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp290 = getelementptr i16* %tmp287, i64 %tmp288289		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp290, align 2
	%tmp292 = add i32 %x.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp298384 = icmp sgt i32 %tmp296, %tmp292		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp298384, label %bb284, label %bb319.preheader

bb293:		; preds = %bb275, %bb258, %entry
	%tmp296 = load i32* @way.7, align 8		; <i32> [#uses=4]
	%tmp298 = icmp sgt i32 %tmp296, 0		; <i1> [#uses=2]
	br i1 %tmp298, label %bb284.preheader, label %bb327

bb284.preheader:		; preds = %bb293
	%tmp287 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	br label %bb284

bb302:		; preds = %bb302.preheader, %bb302
	%x.1385 = phi i32 [ %tmp318, %bb302 ], [ 0, %bb302.preheader ]		; <i32> [#uses=2]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 105, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 105 )
	%tmp314 = or i32 %tmp312, %x.1385		; <i32> [#uses=1]
	%tmp314315 = sext i32 %tmp314 to i64		; <i64> [#uses=1]
	%tmp316 = getelementptr i16* %tmp305, i64 %tmp314315		; <i16*> [#uses=1]
	store i16 -1, i16* %tmp316, align 2
	%tmp318 = add i32 %x.1385, 1		; <i32> [#uses=2]
	%tmp324 = icmp sgt i32 %tmp296, %tmp318		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %tmp324, label %bb302, label %bb327

bb319.preheader:		; preds = %bb284
	br i1 %tmp298, label %bb302.preheader, label %bb327

bb302.preheader:		; preds = %bb319.preheader
	%tmp305 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp308 = load i32* @way.4, align 8		; <i32> [#uses=1]
	%tmp311 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%tmp312 = shl i32 %tmp308, %tmp311		; <i32> [#uses=1]
	br label %bb302

bb327:		; preds = %bb319.preheader, %bb302, %bb293
	%tmp334 = add i32 %tmp252370, %tmp296		; <i32> [#uses=1]
	%tmp335 = mul i32 %tmp334, 12		; <i32> [#uses=2]
	store i32 %tmp335, i32* @way.20, align 8
	%tmp340341 = sext i32 %tmp335 to i64		; <i64> [#uses=1]
	%tmp343 = shl i64 %tmp340341, 2		; <i64> [#uses=1]
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	%tmp344 = call i8* @_Znam( i64 %tmp343 )		; <i8*> [#uses=1]
	%tmp344345 = bitcast i8* %tmp344 to i32*		; <i32*> [#uses=1]
	store i32* %tmp344345, i32** @way.18, align 8
	%tmp350 = load i32* @way.20, align 8		; <i32> [#uses=1]
	%tmp350351 = sext i32 %tmp350 to i64		; <i64> [#uses=1]
	%tmp353 = shl i64 %tmp350351, 2		; <i64> [#uses=1]
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 21, i32* @cg_caller_id_var, align 4
	%tmp354 = call i8* @_Znam( i64 %tmp353 )		; <i8*> [#uses=1]
	%tmp354355 = bitcast i8* %tmp354 to i32*		; <i32*> [#uses=1]
	store i32* %tmp354355, i32** @way.19, align 8
	%tmp360 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%tmp361 = shl i32 1, %tmp360		; <i32> [#uses=1]
	%tmp362 = add i32 %tmp361, -1		; <i32> [#uses=1]
	store i32 %tmp362, i32* @way.21, align 8
	store i16 0, i16* @way.25, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare double @log(double) nounwind readonly 

declare i32 @putchar(i32) nounwind 

define i32 @main(i32 %argc, i8** %argv) {
entry:
	store i32 22, i32* @cg_caller_id_var, align 4
	%info.i286 = alloca %struct.createwaymnginfot		; <%struct.createwaymnginfot*> [#uses=10]
	%xRunion.i = alloca %struct..1._38		; <%struct..1._38*> [#uses=3]
	%yRunion.i = alloca %struct..1._38		; <%struct..1._38*> [#uses=3]
	%info.i = alloca %struct.createwaymnginfot		; <%struct.createwaymnginfot*> [#uses=10]
	%info = alloca %struct.workinfot		; <%struct.workinfot*> [#uses=12]
	%startx = alloca i32		; <i32*> [#uses=3]
	%starty = alloca i32		; <i32*> [#uses=3]
	%endx = alloca i32		; <i32*> [#uses=3]
	%endy = alloca i32		; <i32*> [#uses=3]
	%wayar = alloca %struct.point16t*		; <%struct.point16t**> [#uses=3]
	%waylength = alloca i32		; <i32*> [#uses=3]
	%wayar187 = alloca %struct.regobj**		; <%struct.regobj***> [#uses=3]
	%waylength188 = alloca i32		; <i32*> [#uses=3]
	%wayar288 = alloca %struct.pointt*		; <%struct.pointt**> [#uses=3]
	%waylength289 = alloca i32		; <i32*> [#uses=3]
	%movetimear = alloca [256 x i8]		; <[256 x i8]*> [#uses=5]
	%wayar453 = alloca %struct.pointt*		; <%struct.pointt**> [#uses=3]
	%waylength454 = alloca i32		; <i32*> [#uses=3]
	%movetimear456 = alloca [256 x i8]		; <[256 x i8]*> [#uses=5]
	%startx703 = alloca i32		; <i32*> [#uses=3]
	%starty704 = alloca i32		; <i32*> [#uses=3]
	%endx705 = alloca i32		; <i32*> [#uses=3]
	%endy706 = alloca i32		; <i32*> [#uses=3]
	%wayar707 = alloca %struct.point16t*		; <%struct.point16t**> [#uses=3]
	%waylength708 = alloca i32		; <i32*> [#uses=3]
	%wayar779 = alloca %struct.regobj**		; <%struct.regobj***> [#uses=3]
	%waylength780 = alloca i32		; <i32*> [#uses=3]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp19 = call i32 @puts( i8* getelementptr ([27 x i8]* @.str13, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp21 = call i32 @puts( i8* getelementptr ([24 x i8]* @.str14, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	%tmp23 = icmp eq i32 %argc, 2		; <i1> [#uses=1]
	br i1 %tmp23, label %cond_next, label %cond_true

cond_true:		; preds = %entry
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp26 = call i32 @puts( i8* getelementptr ([36 x i8]* @.str15, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

cond_next:		; preds = %entry
	%tmp29 = getelementptr i8** %argv, i64 1		; <i8**> [#uses=1]
	%tmp30 = load i8** %tmp29, align 8		; <i8*> [#uses=1]
	store i32 3, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp32 = call %struct.FILE* @fopen( i8* noalias  %tmp30, i8* noalias  getelementptr ([2 x i8]* @.str16, i32 0, i64 0) )		; <%struct.FILE*> [#uses=14]
	%tmp34 = icmp eq %struct.FILE* %tmp32, null		; <i1> [#uses=1]
	br i1 %tmp34, label %cond_true37, label %cond_next41

cond_true37:		; preds = %cond_next
	store i32 4, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp39 = call i32 @puts( i8* getelementptr ([31 x i8]* @.str17, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 1

cond_next41:		; preds = %cond_next
	%tmp45 = getelementptr %struct.workinfot* %info, i32 0, i32 0, i64 0		; <i8*> [#uses=5]
	store i32 5, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp46 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str18, i32 0, i64 0), i8* %tmp45 )		; <i32> [#uses=0]
	%tmp49 = getelementptr %struct.workinfot* %info, i32 0, i32 1		; <i32*> [#uses=2]
	store i32 6, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp50 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp49 )		; <i32> [#uses=0]
	%tmp53 = getelementptr %struct.workinfot* %info, i32 0, i32 2		; <i32*> [#uses=3]
	store i32 7, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp54 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp53 )		; <i32> [#uses=0]
	%tmp57 = getelementptr %struct.workinfot* %info, i32 0, i32 3		; <i32*> [#uses=3]
	store i32 8, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp58 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp57 )		; <i32> [#uses=0]
	%tmp61 = getelementptr %struct.workinfot* %info, i32 0, i32 4		; <i32*> [#uses=3]
	store i32 9, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp62 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp61 )		; <i32> [#uses=0]
	%tmp65 = getelementptr %struct.workinfot* %info, i32 0, i32 5		; <i32*> [#uses=3]
	store i32 10, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp66 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp65 )		; <i32> [#uses=0]
	%tmp69 = getelementptr %struct.workinfot* %info, i32 0, i32 6		; <i32*> [#uses=2]
	store i32 11, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp70 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp69 )		; <i32> [#uses=0]
	%tmp73 = getelementptr %struct.workinfot* %info, i32 0, i32 7		; <i32*> [#uses=2]
	store i32 12, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp74 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp73 )		; <i32> [#uses=0]
	%tmp77 = getelementptr %struct.workinfot* %info, i32 0, i32 8		; <float*> [#uses=2]
	store i32 13, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp78 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str20, i32 0, i64 0), float* %tmp77 )		; <i32> [#uses=0]
	%tmp81 = getelementptr %struct.workinfot* %info, i32 0, i32 9		; <i32*> [#uses=2]
	store i32 14, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp82 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp81 )		; <i32> [#uses=0]
	%tmp85 = getelementptr %struct.workinfot* %info, i32 0, i32 10		; <i32*> [#uses=3]
	store i32 15, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp86 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp85 )		; <i32> [#uses=0]
	%tmp89 = getelementptr %struct.workinfot* %info, i32 0, i32 11		; <i32*> [#uses=3]
	store i32 16, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp90 = call i32 (%struct.FILE*, i8*, ...)* @fscanf( %struct.FILE* noalias  %tmp32, i8* noalias  getelementptr ([3 x i8]* @.str19, i32 0, i64 0), i32* %tmp89 )		; <i32> [#uses=0]
	store i32 17, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp92 = call i32 @fclose( %struct.FILE* %tmp32 )		; <i32> [#uses=0]
	store i32 18, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp94 = call i32 @puts( i8* getelementptr ([12 x i8]* @.str21, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	store i32 19, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp97 = call i32 @puts( i8* %tmp45 ) nounwind 		; <i32> [#uses=0]
	store i32 20, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj6createEv( )
	store %struct.regmngobj* @regmng, %struct.regmngobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 5), align 8
	%tmp8.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp9.i = add i32 %tmp8.i, 1		; <i32> [#uses=4]
	store i32 %tmp9.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8
	%tmp28.i = malloc %struct.regobj*, i32 %tmp9.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp28.i, %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8
	store i32 %tmp9.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 1), align 8
	%tmp62.i1 = malloc %struct.regobj*, i32 %tmp9.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp62.i1, %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 0), align 8
	store i32 21, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp2.i = call i32 (i8*, i32, ...)* @open( i8* %tmp45, i32 0 )		; <i32> [#uses=11]
	%tmp4.i2 = icmp eq i32 %tmp2.i, -1		; <i1> [#uses=1]
	br i1 %tmp4.i2, label %_ZN6wayobj7loadmapEPKc.exit, label %cond_next.i

cond_next.i:		; preds = %cond_next41
	%tmp10.i3 = bitcast %struct..1._38* %xRunion.i to i8*		; <i8*> [#uses=1]
	store i32 22, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp11.i = call i64 @read( i32 %tmp2.i, i8* %tmp10.i3, i64 1 )		; <i64> [#uses=0]
	%tmp1314.i = bitcast %struct..1._38* %xRunion.i to %struct..0._27*		; <%struct..0._27*> [#uses=3]
	%tmp15.i4 = getelementptr %struct..0._27* %tmp1314.i, i32 0, i32 1		; <i8*> [#uses=1]
	store i32 23, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp16.i = call i64 @read( i32 %tmp2.i, i8* %tmp15.i4, i64 1 )		; <i64> [#uses=0]
	%tmp20.i5 = getelementptr %struct..0._27* %tmp1314.i, i32 0, i32 2		; <i8*> [#uses=1]
	store i32 24, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp21.i6 = call i64 @read( i32 %tmp2.i, i8* %tmp20.i5, i64 1 )		; <i64> [#uses=0]
	%tmp25.i = getelementptr %struct..0._27* %tmp1314.i, i32 0, i32 3		; <i8*> [#uses=1]
	store i32 25, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp26.i7 = call i64 @read( i32 %tmp2.i, i8* %tmp25.i, i64 1 )		; <i64> [#uses=0]
	%tmp30.i = bitcast %struct..1._38* %yRunion.i to i8*		; <i8*> [#uses=1]
	store i32 26, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp31.i8 = call i64 @read( i32 %tmp2.i, i8* %tmp30.i, i64 1 )		; <i64> [#uses=0]
	%tmp3334.i = bitcast %struct..1._38* %yRunion.i to %struct..0._27*		; <%struct..0._27*> [#uses=3]
	%tmp35.i = getelementptr %struct..0._27* %tmp3334.i, i32 0, i32 1		; <i8*> [#uses=1]
	store i32 27, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp36.i9 = call i64 @read( i32 %tmp2.i, i8* %tmp35.i, i64 1 )		; <i64> [#uses=0]
	%tmp40.i10 = getelementptr %struct..0._27* %tmp3334.i, i32 0, i32 2		; <i8*> [#uses=1]
	store i32 28, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp41.i = call i64 @read( i32 %tmp2.i, i8* %tmp40.i10, i64 1 )		; <i64> [#uses=0]
	%tmp46.i = getelementptr %struct..0._27* %tmp3334.i, i32 0, i32 3		; <i8*> [#uses=1]
	store i32 29, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp47.i11 = call i64 @read( i32 %tmp2.i, i8* %tmp46.i, i64 1 )		; <i64> [#uses=0]
	%tmp48.i = getelementptr %struct..1._38* %xRunion.i, i32 0, i32 0		; <i32*> [#uses=1]
	%tmp49.i = load i32* %tmp48.i, align 8		; <i32> [#uses=2]
	%tmp50.i = getelementptr %struct..1._38* %yRunion.i, i32 0, i32 0		; <i32*> [#uses=1]
	%tmp51.i = load i32* %tmp50.i, align 8		; <i32> [#uses=2]
	%tmp52.i12 = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 0		; <float*> [#uses=1]
	store float -1.000000e+03, float* %tmp52.i12, align 8
	%tmp53.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 2		; <float*> [#uses=1]
	store float -1.000000e+03, float* %tmp53.i, align 4
	%tmp54.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 1		; <float*> [#uses=1]
	store float 1.000000e+03, float* %tmp54.i, align 4
	%tmp55.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 3		; <float*> [#uses=1]
	store float 1.000000e+03, float* %tmp55.i, align 4
	%tmp5657.i = sitofp i32 %tmp49.i to double		; <double> [#uses=1]
	store i32 30, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp58.i = call double @log( double %tmp5657.i ) nounwind readonly 		; <double> [#uses=1]
	%tmp60.i = fdiv double %tmp58.i, 0x3FE62E42FEFA39EF		; <double> [#uses=1]
	%tmp61.i = add double %tmp60.i, 5.000000e-01		; <double> [#uses=1]
	%tmp6162.i = fptosi double %tmp61.i to i32		; <i32> [#uses=1]
	%tmp63.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 4		; <i32*> [#uses=1]
	store i32 %tmp6162.i, i32* %tmp63.i, align 4
	%tmp6465.i = sitofp i32 %tmp51.i to double		; <double> [#uses=1]
	store i32 31, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp66.i = call double @log( double %tmp6465.i ) nounwind readonly 		; <double> [#uses=1]
	%tmp68.i = fdiv double %tmp66.i, 0x3FE62E42FEFA39EF		; <double> [#uses=1]
	%tmp69.i = add double %tmp68.i, 5.000000e-01		; <double> [#uses=1]
	%tmp6970.i = fptosi double %tmp69.i to i32		; <i32> [#uses=1]
	%tmp71.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 5		; <i32*> [#uses=1]
	store i32 %tmp6970.i, i32* %tmp71.i, align 4
	%tmp72.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 6		; <float*> [#uses=1]
	store float 0.000000e+00, float* %tmp72.i, align 4
	%tmp73.i = getelementptr %struct.createwaymnginfot* %info.i, i32 0, i32 7		; <float*> [#uses=1]
	store float 1.000000e+05, float* %tmp73.i, align 4
	%tmp75.i = bitcast %struct.createwaymnginfot* %info.i to { [8 x i32] }*		; <{ [8 x i32] }*> [#uses=7]
	%tmp77.i = bitcast %struct.createwaymnginfot* %info.i to i32*		; <i32*> [#uses=1]
	%tmp78.i = load i32* %tmp77.i, align 8		; <i32> [#uses=1]
	%tmp79.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 1		; <i32*> [#uses=1]
	%tmp80.i = load i32* %tmp79.i, align 4		; <i32> [#uses=1]
	%tmp81.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 2		; <i32*> [#uses=1]
	%tmp82.i = load i32* %tmp81.i, align 4		; <i32> [#uses=1]
	%tmp83.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 3		; <i32*> [#uses=1]
	%tmp84.i = load i32* %tmp83.i, align 4		; <i32> [#uses=1]
	%tmp85.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp86.i = load i32* %tmp85.i, align 4		; <i32> [#uses=1]
	%tmp87.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 5		; <i32*> [#uses=1]
	%tmp88.i = load i32* %tmp87.i, align 4		; <i32> [#uses=1]
	%tmp90.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 6		; <i32*> [#uses=1]
	%tmp91.i = load i32* %tmp90.i, align 4		; <i32> [#uses=1]
	%tmp92.i = getelementptr { [8 x i32] }* %tmp75.i, i32 0, i32 0, i32 7		; <i32*> [#uses=1]
	%tmp93.i = load i32* %tmp92.i, align 4		; <i32> [#uses=1]
	store i32 32, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6wayobj6createE17createwaymnginfot( i32 %tmp78.i, i32 %tmp80.i, i32 %tmp82.i, i32 %tmp84.i, i32 %tmp86.i, i32 %tmp88.i, i32 %tmp91.i, i32 %tmp93.i )
	%tmp96.i = mul i32 %tmp51.i, %tmp49.i		; <i32> [#uses=2]
	%tmp98.i = malloc i8, i32 %tmp96.i		; <i8*> [#uses=3]
	%tmp101102.i = sext i32 %tmp96.i to i64		; <i64> [#uses=1]
	store i32 33, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp105.i = call i64 @read( i32 %tmp2.i, i8* %tmp98.i, i64 %tmp101102.i )		; <i64> [#uses=0]
	%tmp147163.i = load i32* @way.4, align 8		; <i32> [#uses=2]
	%tmp149165.i = icmp sgt i32 %tmp147163.i, 1		; <i1> [#uses=1]
	br i1 %tmp149165.i, label %bb133.preheader.i, label %bb152.i

bb133.preheader.i:		; preds = %cond_next.i
	%tmp136168.i = load i32* @way.3, align 8		; <i32> [#uses=2]
	%tmp138169.i = icmp sgt i32 %tmp136168.i, 1		; <i1> [#uses=1]
	%tmp109.i = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp112.i = load i32* @way.2, align 8		; <i32> [#uses=1]
	br label %bb133.outer.i

bb133.outer.i:		; preds = %bb144.i, %bb133.preheader.i
	%indvar170.i = phi i32 [ 0, %bb133.preheader.i ], [ %y.0.reg2mem.0.ph.i, %bb144.i ]		; <i32> [#uses=2]
	%val329 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val430 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 121, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val329, i32 %val430, i32 121 )
	%y.0.reg2mem.0.ph.i = add i32 %indvar170.i, 1		; <i32> [#uses=2]
	br i1 %tmp138169.i, label %bb106.i.preheader, label %bb144.i

bb106.i.preheader:		; preds = %bb133.outer.i
	%tmp114.i = shl i32 %y.0.reg2mem.0.ph.i, %tmp112.i		; <i32> [#uses=1]
	br label %bb106.i

bb106.i:		; preds = %bb106.i, %bb106.i.preheader
	%indvar.i = phi i32 [ %x.0166.i, %bb106.i ], [ 0, %bb106.i.preheader ]		; <i32> [#uses=2]
	%val331 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val432 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 122, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val331, i32 %val432, i32 122 )
	%x.0166.i = add i32 %indvar.i, 1		; <i32> [#uses=2]
	%tmp116.i = or i32 %tmp114.i, %x.0166.i		; <i32> [#uses=1]
	%tmp123125.i = sext i32 %tmp116.i to i64		; <i64> [#uses=2]
	%tmp126.i = getelementptr i8* %tmp98.i, i64 %tmp123125.i		; <i8*> [#uses=1]
	%tmp127.i = load i8* %tmp126.i, align 1		; <i8> [#uses=1]
	%tmp127128.i = zext i8 %tmp127.i to i16		; <i16> [#uses=1]
	%tmp130.i = getelementptr i16* %tmp109.i, i64 %tmp123125.i		; <i16*> [#uses=1]
	store i16 %tmp127128.i, i16* %tmp130.i, align 2
	%tmp132.i = add i32 %indvar.i, 2		; <i32> [#uses=1]
	%tmp138.i = icmp sgt i32 %tmp136168.i, %tmp132.i		; <i1> [#uses=1]
	store i32 %val432, i32* @cg_caller_call_site_var, align 4
	store i32 %val331, i32* @cg_caller_id_var, align 4
	br i1 %tmp138.i, label %bb106.i, label %bb144.i

bb144.i:		; preds = %bb106.i, %bb133.outer.i
	%tmp143.i = add i32 %indvar170.i, 2		; <i32> [#uses=1]
	%tmp149.i = icmp sgt i32 %tmp147163.i, %tmp143.i		; <i1> [#uses=1]
	store i32 %val430, i32* @cg_caller_call_site_var, align 4
	store i32 %val329, i32* @cg_caller_id_var, align 4
	br i1 %tmp149.i, label %bb133.outer.i, label %bb152.i

bb152.i:		; preds = %bb144.i, %cond_next.i
	free i8* %tmp98.i
	store i32 34, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp155.i = call i32 @close( i32 %tmp2.i )		; <i32> [#uses=0]
	br label %_ZN6wayobj7loadmapEPKc.exit

_ZN6wayobj7loadmapEPKc.exit:		; preds = %bb152.i, %cond_next41
	store i32 35, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp2.i14 = call i32 (i8*, i32, ...)* @open( i8* %tmp45, i32 0 )		; <i32> [#uses=11]
	%tmp4.i15 = icmp eq i32 %tmp2.i14, -1		; <i1> [#uses=1]
	br i1 %tmp4.i15, label %_ZN9regmngobj7loadmapEPKc.exit, label %cond_next.i30

cond_next.i30:		; preds = %_ZN6wayobj7loadmapEPKc.exit
	store i32 36, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp13.i16 = call i64 @read( i32 %tmp2.i14, i8* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 14) to i8*), i64 1 )		; <i64> [#uses=0]
	store i32 37, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp20.i17 = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 14) to %struct..0._27*), i32 0, i32 1), i64 1 )		; <i64> [#uses=0]
	store i32 38, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp27.i = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 14) to %struct..0._27*), i32 0, i32 2), i64 1 )		; <i64> [#uses=0]
	store i32 39, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp34.i = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 14) to %struct..0._27*), i32 0, i32 3), i64 1 )		; <i64> [#uses=0]
	store i32 40, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp41.i18 = call i64 @read( i32 %tmp2.i14, i8* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 15) to i8*), i64 1 )		; <i64> [#uses=0]
	store i32 41, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp48.i19 = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 15) to %struct..0._27*), i32 0, i32 1), i64 1 )		; <i64> [#uses=0]
	store i32 42, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp55.i20 = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 15) to %struct..0._27*), i32 0, i32 2), i64 1 )		; <i64> [#uses=0]
	store i32 43, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp62.i21 = call i64 @read( i32 %tmp2.i14, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 15) to %struct..0._27*), i32 0, i32 3), i64 1 )		; <i64> [#uses=0]
	%tmp66.i22 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 14, i32 0), align 8		; <i32> [#uses=3]
	store i32 %tmp66.i22, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8
	%tmp72.i23 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 15, i32 0), align 8		; <i32> [#uses=3]
	store i32 %tmp72.i23, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8
	%tmp78.i24 = add i32 %tmp66.i22, -1		; <i32> [#uses=1]
	store i32 %tmp78.i24, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8
	%tmp84.i25 = add i32 %tmp72.i23, -1		; <i32> [#uses=1]
	store i32 %tmp84.i25, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8
	%tmp93.i26 = mul i32 %tmp72.i23, %tmp66.i22		; <i32> [#uses=4]
	%tmp96.i27 = malloc %struct.regobj*, i32 %tmp93.i26		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp96.i27, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8
	%tmp108.i = malloc i8, i32 %tmp93.i26		; <i8*> [#uses=1]
	store i8* %tmp108.i, i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8
	%tmp120.i = malloc i16, i32 %tmp93.i26		; <i16*> [#uses=2]
	store i16* %tmp120.i, i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32
	%tmp130131.i = sext i32 %tmp93.i26 to i64		; <i64> [#uses=1]
	%tmp132.i28 = shl i64 %tmp130131.i, 1		; <i64> [#uses=1]
	%tmp135136.i = bitcast i16* %tmp120.i to i8*		; <i8*> [#uses=1]
	store i32 44, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp135136.i, i8 0, i64 %tmp132.i28, i32 8 )
	store i16 0, i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8
	%tmp141.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8		; <i32> [#uses=1]
	%tmp144.i = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp145.i = mul i32 %tmp144.i, %tmp141.i		; <i32> [#uses=1]
	%tmp145146.i = sext i32 %tmp145.i to i64		; <i64> [#uses=1]
	%tmp149.i29 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8		; <i8*> [#uses=1]
	store i32 45, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp151.i = call i64 @read( i32 %tmp2.i14, i8* %tmp149.i29, i64 %tmp145146.i )		; <i64> [#uses=0]
	br label %bb.i

bb.i:		; preds = %bb.i, %cond_next.i30
	%i.0.reg2mem.0.i = phi i32 [ 0, %cond_next.i30 ], [ %indvar.next.i, %bb.i ]		; <i32> [#uses=2]
	%val327 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val428 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 120, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val327, i32 %val428, i32 120 )
	%tmp152155.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp156.i = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp152155.i		; <i8*> [#uses=1]
	store i8 0, i8* %tmp156.i, align 1
	%indvar.next.i = add i32 %i.0.reg2mem.0.i, 1		; <i32> [#uses=2]
	%exitcond.i = icmp eq i32 %indvar.next.i, 256		; <i1> [#uses=1]
	store i32 %val428, i32* @cg_caller_call_site_var, align 4
	store i32 %val327, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i, label %bb164.i, label %bb.i

bb164.i:		; preds = %bb.i
	store i8 1, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 8, i64 0), align 1
	store i32 46, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp169.i = call i32 @close( i32 %tmp2.i14 )		; <i32> [#uses=0]
	br label %_ZN9regmngobj7loadmapEPKc.exit

_ZN9regmngobj7loadmapEPKc.exit:		; preds = %bb164.i, %_ZN6wayobj7loadmapEPKc.exit
	%tmp118 = load i32* %tmp49, align 4		; <i32> [#uses=1]
	store i32 47, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj13createregionsEi( i32 %tmp118 )
	store i32 48, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp120 = call i64 @time( i64* null ) nounwind 		; <i64> [#uses=0]
	%tmp178921 = load i32* %tmp53, align 4		; <i32> [#uses=1]
	%tmp180923 = icmp sgt i32 %tmp178921, 0		; <i1> [#uses=1]
	br i1 %tmp180923, label %bb, label %bb183

bb:		; preds = %bb176, %_ZN9regmngobj7loadmapEPKc.exit
	%i.0.reg2mem.0 = phi i32 [ %tmp175, %bb176 ], [ 0, %_ZN9regmngobj7loadmapEPKc.exit ]		; <i32> [#uses=1]
	%stat.8.4 = phi i64 [ %stat.8.3, %bb176 ], [ 0, %_ZN9regmngobj7loadmapEPKc.exit ]		; <i64> [#uses=2]
	%stat.5.4 = phi i64 [ %stat.5.3, %bb176 ], [ 0, %_ZN9regmngobj7loadmapEPKc.exit ]		; <i64> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 106, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 106 )
	store i32 0, i32* %waylength, align 4
	store %struct.point16t* null, %struct.point16t** %wayar, align 8
	%tmp122 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 32		; <i32> [#uses=1]
	%tmp56.i = sitofp i32 %tmp122 to float		; <float> [#uses=1]
	%tmp8.i66 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i67 = mul i32 %tmp8.i66, 171		; <i32> [#uses=1]
	%tmp10.i68 = srem i32 %tmp9.i67, 30269		; <i32> [#uses=2]
	%tmp11.i69 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i = mul i32 %tmp11.i69, 172		; <i32> [#uses=1]
	%tmp13.i70 = srem i32 %tmp12.i, 30307		; <i32> [#uses=2]
	%tmp14.i = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i71 = mul i32 %tmp14.i, 170		; <i32> [#uses=1]
	%tmp16.i72 = srem i32 %tmp15.i71, 30323		; <i32> [#uses=2]
	%tmp1718.i73 = sitofp i32 %tmp10.i68 to float		; <float> [#uses=1]
	%tmp21.i74 = mul float %tmp1718.i73, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i75 = sitofp i32 %tmp13.i70 to float		; <float> [#uses=1]
	%tmp26.i76 = mul float %tmp2223.i75, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i = sitofp i32 %tmp16.i72 to float		; <float> [#uses=1]
	%tmp31.i77 = mul float %tmp2728.i, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i78 = add float %tmp21.i74, %tmp26.i76		; <float> [#uses=1]
	%tmp36.i79 = add float %tmp34.i78, %tmp31.i77		; <float> [#uses=2]
	%tmp4142.i80 = fptosi float %tmp36.i79 to i32		; <i32> [#uses=1]
	%tmp414243.i = sitofp i32 %tmp4142.i80 to float		; <float> [#uses=1]
	%tmp44.i81 = sub float %tmp36.i79, %tmp414243.i		; <float> [#uses=1]
	%tmp47.i82 = mul float %tmp56.i, %tmp44.i81		; <float> [#uses=1]
	%tmp4748.i = fptosi float %tmp47.i82 to i32		; <i32> [#uses=1]
	%tmp50.i83 = add i32 %tmp4748.i, 1		; <i32> [#uses=2]
	store i32 %tmp50.i83, i32* %startx, align 4
	%tmp125 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 32		; <i32> [#uses=1]
	%tmp56.i84 = sitofp i32 %tmp125 to float		; <float> [#uses=1]
	%tmp9.i86 = mul i32 %tmp10.i68, 171		; <i32> [#uses=1]
	%tmp10.i87 = srem i32 %tmp9.i86, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i87, i32* @y1rnd, align 4
	%tmp12.i89 = mul i32 %tmp13.i70, 172		; <i32> [#uses=1]
	%tmp13.i90 = srem i32 %tmp12.i89, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i90, i32* @y2rnd, align 4
	%tmp15.i92 = mul i32 %tmp16.i72, 170		; <i32> [#uses=1]
	%tmp16.i93 = srem i32 %tmp15.i92, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i93, i32* @y3rnd, align 4
	%tmp1718.i94 = sitofp i32 %tmp10.i87 to float		; <float> [#uses=1]
	%tmp21.i95 = mul float %tmp1718.i94, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i96 = sitofp i32 %tmp13.i90 to float		; <float> [#uses=1]
	%tmp26.i97 = mul float %tmp2223.i96, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i98 = sitofp i32 %tmp16.i93 to float		; <float> [#uses=1]
	%tmp31.i99 = mul float %tmp2728.i98, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i100 = add float %tmp21.i95, %tmp26.i97		; <float> [#uses=1]
	%tmp36.i101 = add float %tmp34.i100, %tmp31.i99		; <float> [#uses=2]
	%tmp4142.i102 = fptosi float %tmp36.i101 to i32		; <i32> [#uses=1]
	%tmp414243.i103 = sitofp i32 %tmp4142.i102 to float		; <float> [#uses=1]
	%tmp44.i104 = sub float %tmp36.i101, %tmp414243.i103		; <float> [#uses=1]
	%tmp47.i105 = mul float %tmp56.i84, %tmp44.i104		; <float> [#uses=1]
	%tmp4748.i106 = fptosi float %tmp47.i105 to i32		; <i32> [#uses=1]
	%tmp50.i107 = add i32 %tmp4748.i106, 1		; <i32> [#uses=2]
	store i32 %tmp50.i107, i32* %starty, align 4
	store i32 49, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 106, i32* @cg_caller_id_var, align 4
	%tmp129 = call fastcc i8 @_ZN6wayobj13findfreepointEiiRiS0_( i32 %tmp50.i83, i32 %tmp50.i107, i32* %startx, i32* %starty ) zeroext 		; <i8> [#uses=1]
	%toBool131 = icmp eq i8 %tmp129, 0		; <i1> [#uses=1]
	br i1 %toBool131, label %cond_next159, label %cond_true132

cond_true132:		; preds = %bb
	%tmp134 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 32		; <i32> [#uses=1]
	%tmp56.i156 = sitofp i32 %tmp134 to float		; <float> [#uses=1]
	%tmp8.i157 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i158 = mul i32 %tmp8.i157, 171		; <i32> [#uses=1]
	%tmp10.i159 = srem i32 %tmp9.i158, 30269		; <i32> [#uses=2]
	%tmp11.i160 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i161 = mul i32 %tmp11.i160, 172		; <i32> [#uses=1]
	%tmp13.i162 = srem i32 %tmp12.i161, 30307		; <i32> [#uses=2]
	%tmp14.i163 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i164 = mul i32 %tmp14.i163, 170		; <i32> [#uses=1]
	%tmp16.i165 = srem i32 %tmp15.i164, 30323		; <i32> [#uses=2]
	%tmp1718.i166 = sitofp i32 %tmp10.i159 to float		; <float> [#uses=1]
	%tmp21.i167 = mul float %tmp1718.i166, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i168 = sitofp i32 %tmp13.i162 to float		; <float> [#uses=1]
	%tmp26.i169 = mul float %tmp2223.i168, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i170 = sitofp i32 %tmp16.i165 to float		; <float> [#uses=1]
	%tmp31.i171 = mul float %tmp2728.i170, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i172 = add float %tmp21.i167, %tmp26.i169		; <float> [#uses=1]
	%tmp36.i173 = add float %tmp34.i172, %tmp31.i171		; <float> [#uses=2]
	%tmp4142.i174 = fptosi float %tmp36.i173 to i32		; <i32> [#uses=1]
	%tmp414243.i175 = sitofp i32 %tmp4142.i174 to float		; <float> [#uses=1]
	%tmp44.i176 = sub float %tmp36.i173, %tmp414243.i175		; <float> [#uses=1]
	%tmp47.i177 = mul float %tmp56.i156, %tmp44.i176		; <float> [#uses=1]
	%tmp4748.i178 = fptosi float %tmp47.i177 to i32		; <i32> [#uses=1]
	%tmp50.i179 = add i32 %tmp4748.i178, 1		; <i32> [#uses=2]
	store i32 %tmp50.i179, i32* %endx, align 4
	%tmp137 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 32		; <i32> [#uses=1]
	%tmp56.i228 = sitofp i32 %tmp137 to float		; <float> [#uses=1]
	%tmp9.i230 = mul i32 %tmp10.i159, 171		; <i32> [#uses=1]
	%tmp10.i231 = srem i32 %tmp9.i230, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i231, i32* @y1rnd, align 4
	%tmp12.i233 = mul i32 %tmp13.i162, 172		; <i32> [#uses=1]
	%tmp13.i234 = srem i32 %tmp12.i233, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i234, i32* @y2rnd, align 4
	%tmp15.i236 = mul i32 %tmp16.i165, 170		; <i32> [#uses=1]
	%tmp16.i237 = srem i32 %tmp15.i236, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i237, i32* @y3rnd, align 4
	%tmp1718.i238 = sitofp i32 %tmp10.i231 to float		; <float> [#uses=1]
	%tmp21.i239 = mul float %tmp1718.i238, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i240 = sitofp i32 %tmp13.i234 to float		; <float> [#uses=1]
	%tmp26.i241 = mul float %tmp2223.i240, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i242 = sitofp i32 %tmp16.i237 to float		; <float> [#uses=1]
	%tmp31.i243 = mul float %tmp2728.i242, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i244 = add float %tmp21.i239, %tmp26.i241		; <float> [#uses=1]
	%tmp36.i245 = add float %tmp34.i244, %tmp31.i243		; <float> [#uses=2]
	%tmp4142.i246 = fptosi float %tmp36.i245 to i32		; <i32> [#uses=1]
	%tmp414243.i247 = sitofp i32 %tmp4142.i246 to float		; <float> [#uses=1]
	%tmp44.i248 = sub float %tmp36.i245, %tmp414243.i247		; <float> [#uses=1]
	%tmp47.i249 = mul float %tmp56.i228, %tmp44.i248		; <float> [#uses=1]
	%tmp4748.i250 = fptosi float %tmp47.i249 to i32		; <i32> [#uses=1]
	%tmp50.i251 = add i32 %tmp4748.i250, 1		; <i32> [#uses=2]
	store i32 %tmp50.i251, i32* %endy, align 4
	store i32 50, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 106, i32* @cg_caller_id_var, align 4
	%tmp141 = call fastcc i8 @_ZN6wayobj13findfreepointEiiRiS0_( i32 %tmp50.i179, i32 %tmp50.i251, i32* %endx, i32* %endy ) zeroext 		; <i8> [#uses=1]
	%toBool143 = icmp eq i8 %tmp141, 0		; <i1> [#uses=1]
	br i1 %toBool143, label %cond_next150, label %cond_true144

cond_true144:		; preds = %cond_true132
	%tmp145 = load i32* %endy, align 4		; <i32> [#uses=1]
	%tmp146 = load i32* %endx, align 4		; <i32> [#uses=1]
	%tmp147 = load i32* %starty, align 4		; <i32> [#uses=1]
	%tmp148 = load i32* %startx, align 4		; <i32> [#uses=1]
	store i32 51, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 106, i32* @cg_caller_id_var, align 4
	%tmp149 = call fastcc i8 @_ZN6wayobj9createwayEiiiiRP8point16tRi( i32 %tmp148, i32 %tmp147, i32 %tmp146, i32 %tmp145, %struct.point16t** %wayar, i32* %waylength ) zeroext 		; <i8> [#uses=1]
	br label %cond_next150

cond_next150:		; preds = %cond_true144, %cond_true132
	%flcreate.0 = phi i8 [ %tmp149, %cond_true144 ], [ 0, %cond_true132 ]		; <i8> [#uses=2]
	%tmp151 = load %struct.point16t** %wayar, align 8		; <%struct.point16t*> [#uses=2]
	%tmp152 = icmp eq %struct.point16t* %tmp151, null		; <i1> [#uses=1]
	br i1 %tmp152, label %cond_next159, label %cond_true155

cond_true155:		; preds = %cond_next150
	free %struct.point16t* %tmp151
	br label %cond_next159

cond_next159:		; preds = %cond_true155, %cond_next150, %bb
	%flcreate.1 = phi i8 [ %flcreate.0, %cond_true155 ], [ 0, %bb ], [ %flcreate.0, %cond_next150 ]		; <i8> [#uses=1]
	%toBool161 = icmp eq i8 %flcreate.1, 0		; <i1> [#uses=1]
	br i1 %toBool161, label %bb176, label %cond_true162

cond_true162:		; preds = %cond_next159
	%tmp165 = load i32* %waylength, align 4		; <i32> [#uses=1]
	%tmp165166 = sext i32 %tmp165 to i64		; <i64> [#uses=1]
	%tmp167 = add i64 %tmp165166, %stat.5.4		; <i64> [#uses=1]
	%tmp171 = add i64 %stat.8.4, 1		; <i64> [#uses=1]
	br label %bb176

bb176:		; preds = %cond_true162, %cond_next159
	%stat.8.3 = phi i64 [ %tmp171, %cond_true162 ], [ %stat.8.4, %cond_next159 ]		; <i64> [#uses=2]
	%stat.5.3 = phi i64 [ %tmp167, %cond_true162 ], [ %stat.5.4, %cond_next159 ]		; <i64> [#uses=2]
	%tmp175 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp178 = load i32* %tmp53, align 4		; <i32> [#uses=1]
	%tmp180 = icmp sgt i32 %tmp178, %tmp175		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp180, label %bb, label %bb183

bb183:		; preds = %bb176, %_ZN9regmngobj7loadmapEPKc.exit
	%stat.8.5 = phi i64 [ 0, %_ZN9regmngobj7loadmapEPKc.exit ], [ %stat.8.3, %bb176 ]		; <i64> [#uses=1]
	%stat.5.5 = phi i64 [ 0, %_ZN9regmngobj7loadmapEPKc.exit ], [ %stat.5.3, %bb176 ]		; <i64> [#uses=1]
	store i32 52, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp185 = call i64 @time( i64* null ) nounwind 		; <i64> [#uses=0]
	%tmp273926 = load i32* %tmp65, align 4		; <i32> [#uses=1]
	%tmp275928 = icmp sgt i32 %tmp273926, 0		; <i1> [#uses=1]
	br i1 %tmp275928, label %bb186, label %bb278

bb186:		; preds = %bb271, %bb183
	%i.1.reg2mem.0 = phi i32 [ %tmp270, %bb271 ], [ 0, %bb183 ]		; <i32> [#uses=1]
	%stat.12.4 = phi i64 [ %stat.12.3, %bb271 ], [ 0, %bb183 ]		; <i64> [#uses=4]
	%stat.11.4 = phi i64 [ %stat.11.3, %bb271 ], [ 0, %bb183 ]		; <i64> [#uses=4]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 107, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 107 )
	%tmp192 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 32		; <i32> [#uses=1]
	%tmp193 = add i32 %tmp192, -1		; <i32> [#uses=1]
	%tmp3.i320 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp4.i321 = mul i32 %tmp3.i320, 171		; <i32> [#uses=1]
	%tmp5.i322 = srem i32 %tmp4.i321, 30269		; <i32> [#uses=2]
	%tmp6.i323 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp7.i324 = mul i32 %tmp6.i323, 172		; <i32> [#uses=1]
	%tmp8.i325 = srem i32 %tmp7.i324, 30307		; <i32> [#uses=2]
	%tmp9.i326 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp10.i327 = mul i32 %tmp9.i326, 170		; <i32> [#uses=1]
	%tmp11.i328 = srem i32 %tmp10.i327, 30323		; <i32> [#uses=2]
	%tmp1213.i329 = sitofp i32 %tmp5.i322 to float		; <float> [#uses=1]
	%tmp16.i330 = mul float %tmp1213.i329, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp1718.i331 = sitofp i32 %tmp8.i325 to float		; <float> [#uses=1]
	%tmp21.i332 = mul float %tmp1718.i331, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2223.i333 = sitofp i32 %tmp11.i328 to float		; <float> [#uses=1]
	%tmp26.i334 = mul float %tmp2223.i333, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp29.i335 = add float %tmp16.i330, %tmp21.i332		; <float> [#uses=1]
	%tmp31.i336 = add float %tmp29.i335, %tmp26.i334		; <float> [#uses=2]
	%tmp3637.i337 = fptosi float %tmp31.i336 to i32		; <i32> [#uses=1]
	%tmp363738.i338 = sitofp i32 %tmp3637.i337 to float		; <float> [#uses=1]
	%tmp39.i339 = sub float %tmp31.i336, %tmp363738.i338		; <float> [#uses=1]
	%tmp4142.i340 = sitofp i32 %tmp193 to float		; <float> [#uses=2]
	%tmp44.i341 = mul float %tmp39.i339, %tmp4142.i340		; <float> [#uses=1]
	%tmp4445.i342 = fptosi float %tmp44.i341 to i32		; <i32> [#uses=1]
	%tmp4.i352 = mul i32 %tmp5.i322, 171		; <i32> [#uses=1]
	%tmp5.i353 = srem i32 %tmp4.i352, 30269		; <i32> [#uses=2]
	store i32 %tmp5.i353, i32* @y1rnd, align 4
	%tmp7.i355 = mul i32 %tmp8.i325, 172		; <i32> [#uses=1]
	%tmp8.i356 = srem i32 %tmp7.i355, 30307		; <i32> [#uses=2]
	store i32 %tmp8.i356, i32* @y2rnd, align 4
	%tmp10.i358 = mul i32 %tmp11.i328, 170		; <i32> [#uses=1]
	%tmp11.i359 = srem i32 %tmp10.i358, 30323		; <i32> [#uses=2]
	store i32 %tmp11.i359, i32* @y3rnd, align 4
	%tmp1213.i360 = sitofp i32 %tmp5.i353 to float		; <float> [#uses=1]
	%tmp16.i361 = mul float %tmp1213.i360, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp1718.i362 = sitofp i32 %tmp8.i356 to float		; <float> [#uses=1]
	%tmp21.i363 = mul float %tmp1718.i362, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2223.i364 = sitofp i32 %tmp11.i359 to float		; <float> [#uses=1]
	%tmp26.i365 = mul float %tmp2223.i364, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp29.i366 = add float %tmp16.i361, %tmp21.i363		; <float> [#uses=1]
	%tmp31.i367 = add float %tmp29.i366, %tmp26.i365		; <float> [#uses=2]
	%tmp204 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 32		; <%struct.regobj**> [#uses=2]
	%tmp205206 = sext i32 %tmp4445.i342 to i64		; <i64> [#uses=1]
	%tmp207 = getelementptr %struct.regobj** %tmp204, i64 %tmp205206		; <%struct.regobj**> [#uses=1]
	%tmp211 = load %struct.regobj** %tmp207, align 8		; <%struct.regobj*> [#uses=2]
	%tmp214 = getelementptr %struct.regobj* %tmp211, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp215 = load i32* %tmp214, align 8		; <i32> [#uses=1]
	%tmp216 = icmp eq i32 %tmp215, 0		; <i1> [#uses=1]
	br i1 %tmp216, label %bb271, label %cond_next220

cond_next220:		; preds = %bb186
	%tmp3637.i368 = fptosi float %tmp31.i367 to i32		; <i32> [#uses=1]
	%tmp363738.i369 = sitofp i32 %tmp3637.i368 to float		; <float> [#uses=1]
	%tmp39.i370 = sub float %tmp31.i367, %tmp363738.i369		; <float> [#uses=1]
	%tmp44.i372 = mul float %tmp39.i370, %tmp4142.i340		; <float> [#uses=1]
	%tmp4445.i373 = fptosi float %tmp44.i372 to i32		; <i32> [#uses=1]
	%tmp227228 = sext i32 %tmp4445.i373 to i64		; <i64> [#uses=1]
	%tmp229 = getelementptr %struct.regobj** %tmp204, i64 %tmp227228		; <%struct.regobj**> [#uses=1]
	%tmp233 = load %struct.regobj** %tmp229, align 8		; <%struct.regobj*> [#uses=2]
	%tmp236 = getelementptr %struct.regobj* %tmp233, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp237 = load i32* %tmp236, align 8		; <i32> [#uses=1]
	%tmp238 = icmp eq i32 %tmp237, 0		; <i1> [#uses=1]
	br i1 %tmp238, label %bb271, label %cond_next242

cond_next242:		; preds = %cond_next220
	store %struct.regobj** null, %struct.regobj*** %wayar187, align 8
	store i32 0, i32* %waylength188, align 4
	store i32 53, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 107, i32* @cg_caller_id_var, align 4
	%tmp245 = call fastcc i8 @_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri( %struct.regobj* %tmp211, %struct.regobj* %tmp233, %struct.regobj*** %wayar187, i32* %waylength188 ) zeroext 		; <i8> [#uses=1]
	%tmp246 = load %struct.regobj*** %wayar187, align 8		; <%struct.regobj**> [#uses=2]
	%tmp247 = icmp eq %struct.regobj** %tmp246, null		; <i1> [#uses=1]
	br i1 %tmp247, label %cond_next253, label %cond_true250

cond_true250:		; preds = %cond_next242
	free %struct.regobj** %tmp246
	br label %cond_next253

cond_next253:		; preds = %cond_true250, %cond_next242
	%toBool255 = icmp eq i8 %tmp245, 0		; <i1> [#uses=1]
	br i1 %toBool255, label %bb271, label %cond_true256

cond_true256:		; preds = %cond_next253
	%tmp259 = load i32* %waylength188, align 4		; <i32> [#uses=1]
	%tmp259260 = sext i32 %tmp259 to i64		; <i64> [#uses=1]
	%tmp261 = add i64 %tmp259260, %stat.11.4		; <i64> [#uses=1]
	%tmp265 = add i64 %stat.12.4, 1		; <i64> [#uses=1]
	br label %bb271

bb271:		; preds = %cond_true256, %cond_next253, %cond_next220, %bb186
	%stat.12.3 = phi i64 [ %tmp265, %cond_true256 ], [ %stat.12.4, %bb186 ], [ %stat.12.4, %cond_next220 ], [ %stat.12.4, %cond_next253 ]		; <i64> [#uses=2]
	%stat.11.3 = phi i64 [ %tmp261, %cond_true256 ], [ %stat.11.4, %bb186 ], [ %stat.11.4, %cond_next220 ], [ %stat.11.4, %cond_next253 ]		; <i64> [#uses=2]
	%tmp270 = add i32 %i.1.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp273 = load i32* %tmp65, align 4		; <i32> [#uses=1]
	%tmp275 = icmp sgt i32 %tmp273, %tmp270		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp275, label %bb186, label %bb278

bb278:		; preds = %bb271, %bb183
	%stat.12.5 = phi i64 [ 0, %bb183 ], [ %stat.12.3, %bb271 ]		; <i64> [#uses=1]
	%stat.11.5 = phi i64 [ 0, %bb183 ], [ %stat.11.3, %bb271 ]		; <i64> [#uses=1]
	%tmp5.i470 = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp5.i470
	%tmp13.i471 = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp13.i471
	store i32 54, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj7destroyEv( )
	store i32 55, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6wayobj7destroyEv( )
	store %struct.point16t* null, %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8
	store i8* null, i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32
	store i32 56, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp2.i568 = call i32 (i8*, i32, ...)* @open( i8* %tmp45, i32 0 )		; <i32> [#uses=11]
	%tmp4.i569 = icmp eq i32 %tmp2.i568, -1		; <i1> [#uses=1]
	br i1 %tmp4.i569, label %_ZN7way2obj7loadmapEPKc.exit, label %cond_next.i580

cond_next.i580:		; preds = %bb278
	store i32 57, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp13.i570 = call i64 @read( i32 %tmp2.i568, i8* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 15) to i8*), i64 1 )		; <i64> [#uses=0]
	store i32 58, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp20.i571 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 15) to %struct..0._27*), i32 0, i32 1), i64 1 )		; <i64> [#uses=0]
	store i32 59, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp27.i572 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 15) to %struct..0._27*), i32 0, i32 2), i64 1 )		; <i64> [#uses=0]
	store i32 60, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp34.i573 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 15) to %struct..0._27*), i32 0, i32 3), i64 1 )		; <i64> [#uses=0]
	store i32 61, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp41.i574 = call i64 @read( i32 %tmp2.i568, i8* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 16) to i8*), i64 1 )		; <i64> [#uses=0]
	store i32 62, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp48.i575 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 16) to %struct..0._27*), i32 0, i32 1), i64 1 )		; <i64> [#uses=0]
	store i32 63, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp55.i576 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 16) to %struct..0._27*), i32 0, i32 2), i64 1 )		; <i64> [#uses=0]
	store i32 64, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp62.i577 = call i64 @read( i32 %tmp2.i568, i8* getelementptr (%struct..0._27* bitcast (%struct..1._38* getelementptr (%struct.way2obj* @way2, i32 0, i32 16) to %struct..0._27*), i32 0, i32 3), i64 1 )		; <i64> [#uses=0]
	%tmp66.i578 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 15, i32 0), align 8		; <i32> [#uses=3]
	store i32 %tmp66.i578, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8
	%tmp72.i579 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 16, i32 0), align 8		; <i32> [#uses=3]
	store i32 %tmp72.i579, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 8
	br label %bb.i586

bb.i586:		; preds = %bb.i586, %cond_next.i580
	%i.0.reg2mem.0.i581 = phi i32 [ 0, %cond_next.i580 ], [ %indvar.next.i584, %bb.i586 ]		; <i32> [#uses=2]
	%val325 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val426 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 119, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val325, i32 %val426, i32 119 )
	%tmp7578.i = sext i32 %i.0.reg2mem.0.i581 to i64		; <i64> [#uses=3]
	%tmp83.i582 = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp7578.i, i32 2		; <i32*> [#uses=1]
	store i32 128, i32* %tmp83.i582, align 8
	%tmp86.i583 = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp7578.i, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp86.i583, align 8
	%tmp96189.i = malloc [128 x %struct.pointt]		; <[128 x %struct.pointt]*> [#uses=1]
	%tmp96189.sub.i = getelementptr [128 x %struct.pointt]* %tmp96189.i, i32 0, i32 0		; <%struct.pointt*> [#uses=1]
	%tmp102.i = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp7578.i, i32 0		; <%struct.pointt**> [#uses=1]
	store %struct.pointt* %tmp96189.sub.i, %struct.pointt** %tmp102.i, align 8
	%indvar.next.i584 = add i32 %i.0.reg2mem.0.i581, 1		; <i32> [#uses=2]
	%exitcond.i585 = icmp eq i32 %indvar.next.i584, 256		; <i1> [#uses=1]
	store i32 %val426, i32* @cg_caller_call_site_var, align 4
	store i32 %val325, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i585, label %bb110.i, label %bb.i586

bb110.i:		; preds = %bb.i586
	%tmp114.i587 = add i32 %tmp66.i578, -1		; <i32> [#uses=1]
	store i32 %tmp114.i587, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 13), align 8
	%tmp120.i588 = add i32 %tmp72.i579, -1		; <i32> [#uses=1]
	store i32 %tmp120.i588, i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 14), align 8
	%tmp129.i = mul i32 %tmp72.i579, %tmp66.i578		; <i32> [#uses=2]
	%tmp132.i589 = malloc %struct.point16t, i32 %tmp129.i		; <%struct.point16t*> [#uses=2]
	store %struct.point16t* %tmp132.i589, %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8
	%tmp142143.i = sext i32 %tmp129.i to i64		; <i64> [#uses=1]
	%tmp144.i590 = shl i64 %tmp142143.i, 2		; <i64> [#uses=1]
	%tmp147148.i = bitcast %struct.point16t* %tmp132.i589 to i8*		; <i8*> [#uses=1]
	store i32 65, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp147148.i, i8 0, i64 %tmp144.i590, i32 8 )
	store i16 0, i16* getelementptr (%struct.way2obj* @way2, i32 0, i32 2), align 8
	%tmp153.i = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 8		; <i32> [#uses=1]
	%tmp156.i591 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 8		; <i32> [#uses=1]
	%tmp157.i = mul i32 %tmp156.i591, %tmp153.i		; <i32> [#uses=2]
	%tmp159.i = malloc i8, i32 %tmp157.i		; <i8*> [#uses=2]
	store i8* %tmp159.i, i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32
	%tmp168169.i = sext i32 %tmp157.i to i64		; <i64> [#uses=1]
	store i32 66, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp174.i = call i64 @read( i32 %tmp2.i568, i8* %tmp159.i, i64 %tmp168169.i )		; <i64> [#uses=0]
	store i32 67, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp176.i = call i32 @close( i32 %tmp2.i568 )		; <i32> [#uses=0]
	br label %_ZN7way2obj7loadmapEPKc.exit

_ZN7way2obj7loadmapEPKc.exit:		; preds = %bb110.i, %bb278
	%tmp440931 = load i32* %tmp57, align 4		; <i32> [#uses=1]
	%tmp442933 = icmp sgt i32 %tmp440931, 0		; <i1> [#uses=1]
	br i1 %tmp442933, label %bb299.preheader, label %bb445

bb299.preheader:		; preds = %_ZN7way2obj7loadmapEPKc.exit
	%tmp305 = getelementptr [256 x i8]* %movetimear, i32 0, i64 0		; <i8*> [#uses=2]
	%tmp306 = getelementptr [256 x i8]* %movetimear, i32 0, i64 1		; <i8*> [#uses=1]
	%tmp307 = getelementptr [256 x i8]* %movetimear, i32 0, i64 2		; <i8*> [#uses=1]
	br label %bb299.outer

bb299.outer:		; preds = %bb438, %bb299.preheader
	%i.2.reg2mem.0.ph = phi i32 [ 0, %bb299.preheader ], [ %tmp437, %bb438 ]		; <i32> [#uses=1]
	%stat.9.1.ph = phi i64 [ 0, %bb299.preheader ], [ %stat.9.0, %bb438 ]		; <i64> [#uses=3]
	%stat.6.1.ph = phi i64 [ 0, %bb299.preheader ], [ %stat.6.0, %bb438 ]		; <i64> [#uses=3]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 108, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 108 )
	br label %bb291

bb291:		; preds = %bb291, %bb299.outer
	%j.0965 = phi i32 [ 0, %bb299.outer ], [ %indvar.next984, %bb291 ]		; <i32> [#uses=3]
	%val35 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val46 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 109, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val35, i32 %val46, i32 109 )
	%tmp293294 = trunc i32 %j.0965 to i8		; <i8> [#uses=1]
	%tmp292295 = sext i32 %j.0965 to i64		; <i64> [#uses=1]
	%tmp296 = getelementptr [256 x i8]* %movetimear, i32 0, i64 %tmp292295		; <i8*> [#uses=1]
	store i8 %tmp293294, i8* %tmp296, align 1
	%indvar.next984 = add i32 %j.0965, 1		; <i32> [#uses=2]
	%exitcond985 = icmp eq i32 %indvar.next984, 256		; <i1> [#uses=1]
	store i32 %val46, i32* @cg_caller_call_site_var, align 4
	store i32 %val35, i32* @cg_caller_id_var, align 4
	br i1 %exitcond985, label %bb304, label %bb291

bb304:		; preds = %bb291
	store i8 -1, i8* %tmp305, align 1
	store i8 1, i8* %tmp306, align 1
	store i8 -1, i8* %tmp307, align 1
	store i32 0, i32* %waylength289, align 4
	store %struct.pointt* null, %struct.pointt** %wayar288, align 8
	%tmp309 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 32		; <i32> [#uses=2]
	%tmp310 = add i32 %tmp309, -1		; <i32> [#uses=1]
	%tmp56.i544 = sitofp i32 %tmp310 to float		; <float> [#uses=2]
	%tmp8.i545 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i546 = mul i32 %tmp8.i545, 171		; <i32> [#uses=1]
	%tmp10.i547 = srem i32 %tmp9.i546, 30269		; <i32> [#uses=2]
	%tmp11.i548 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i549 = mul i32 %tmp11.i548, 172		; <i32> [#uses=1]
	%tmp13.i550 = srem i32 %tmp12.i549, 30307		; <i32> [#uses=2]
	%tmp14.i551 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i552 = mul i32 %tmp14.i551, 170		; <i32> [#uses=1]
	%tmp16.i553 = srem i32 %tmp15.i552, 30323		; <i32> [#uses=2]
	%tmp1718.i554 = sitofp i32 %tmp10.i547 to float		; <float> [#uses=1]
	%tmp21.i555 = mul float %tmp1718.i554, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i556 = sitofp i32 %tmp13.i550 to float		; <float> [#uses=1]
	%tmp26.i557 = mul float %tmp2223.i556, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i558 = sitofp i32 %tmp16.i553 to float		; <float> [#uses=1]
	%tmp31.i559 = mul float %tmp2728.i558, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i560 = add float %tmp21.i555, %tmp26.i557		; <float> [#uses=1]
	%tmp36.i561 = add float %tmp34.i560, %tmp31.i559		; <float> [#uses=2]
	%tmp4142.i562 = fptosi float %tmp36.i561 to i32		; <i32> [#uses=1]
	%tmp414243.i563 = sitofp i32 %tmp4142.i562 to float		; <float> [#uses=1]
	%tmp44.i564 = sub float %tmp36.i561, %tmp414243.i563		; <float> [#uses=1]
	%tmp47.i565 = mul float %tmp56.i544, %tmp44.i564		; <float> [#uses=1]
	%tmp4748.i566 = fptosi float %tmp47.i565 to i32		; <i32> [#uses=1]
	%tmp50.i567 = add i32 %tmp4748.i566, 1		; <i32> [#uses=2]
	%tmp319 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 32		; <i32> [#uses=1]
	%tmp320 = add i32 %tmp319, -1		; <i32> [#uses=1]
	%tmp56.i520 = sitofp i32 %tmp320 to float		; <float> [#uses=2]
	%tmp9.i522 = mul i32 %tmp10.i547, 171		; <i32> [#uses=1]
	%tmp10.i523 = srem i32 %tmp9.i522, 30269		; <i32> [#uses=3]
	store i32 %tmp10.i523, i32* @y1rnd, align 4
	%tmp12.i525 = mul i32 %tmp13.i550, 172		; <i32> [#uses=1]
	%tmp13.i526 = srem i32 %tmp12.i525, 30307		; <i32> [#uses=3]
	store i32 %tmp13.i526, i32* @y2rnd, align 4
	%tmp15.i528 = mul i32 %tmp16.i553, 170		; <i32> [#uses=1]
	%tmp16.i529 = srem i32 %tmp15.i528, 30323		; <i32> [#uses=3]
	store i32 %tmp16.i529, i32* @y3rnd, align 4
	%tmp1718.i530 = sitofp i32 %tmp10.i523 to float		; <float> [#uses=1]
	%tmp21.i531 = mul float %tmp1718.i530, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i532 = sitofp i32 %tmp13.i526 to float		; <float> [#uses=1]
	%tmp26.i533 = mul float %tmp2223.i532, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i534 = sitofp i32 %tmp16.i529 to float		; <float> [#uses=1]
	%tmp31.i535 = mul float %tmp2728.i534, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i536 = add float %tmp21.i531, %tmp26.i533		; <float> [#uses=1]
	%tmp36.i537 = add float %tmp34.i536, %tmp31.i535		; <float> [#uses=2]
	%tmp4142.i538 = fptosi float %tmp36.i537 to i32		; <i32> [#uses=1]
	%tmp414243.i539 = sitofp i32 %tmp4142.i538 to float		; <float> [#uses=1]
	%tmp44.i540 = sub float %tmp36.i537, %tmp414243.i539		; <float> [#uses=1]
	%tmp47.i541 = mul float %tmp56.i520, %tmp44.i540		; <float> [#uses=1]
	%tmp4748.i542 = fptosi float %tmp47.i541 to i32		; <i32> [#uses=1]
	%tmp50.i543 = add i32 %tmp4748.i542, 1		; <i32> [#uses=2]
	%tmp334 = load i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32		; <i8*> [#uses=1]
	%tmp338 = mul i32 %tmp309, %tmp50.i543		; <i32> [#uses=1]
	%tmp340 = add i32 %tmp338, %tmp50.i567		; <i32> [#uses=1]
	%tmp340341 = sext i32 %tmp340 to i64		; <i64> [#uses=1]
	%tmp342 = getelementptr i8* %tmp334, i64 %tmp340341		; <i8*> [#uses=1]
	%tmp343 = load i8* %tmp342, align 1		; <i8> [#uses=1]
	%tmp347348349350 = zext i8 %tmp343 to i64		; <i64> [#uses=1]
	%tmp351 = getelementptr [256 x i8]* %movetimear, i32 0, i64 %tmp347348349350		; <i8*> [#uses=1]
	%tmp352 = load i8* %tmp351, align 1		; <i8> [#uses=1]
	%tmp353 = icmp eq i8 %tmp352, 0		; <i1> [#uses=1]
	br i1 %tmp353, label %bb438, label %cond_true357

cond_true357:		; preds = %bb304
	%tmp9.i498 = mul i32 %tmp10.i523, 171		; <i32> [#uses=1]
	%tmp10.i499 = srem i32 %tmp9.i498, 30269		; <i32> [#uses=2]
	%tmp12.i501 = mul i32 %tmp13.i526, 172		; <i32> [#uses=1]
	%tmp13.i502 = srem i32 %tmp12.i501, 30307		; <i32> [#uses=2]
	%tmp15.i504 = mul i32 %tmp16.i529, 170		; <i32> [#uses=1]
	%tmp16.i505 = srem i32 %tmp15.i504, 30323		; <i32> [#uses=2]
	%tmp1718.i506 = sitofp i32 %tmp10.i499 to float		; <float> [#uses=1]
	%tmp21.i507 = mul float %tmp1718.i506, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i508 = sitofp i32 %tmp13.i502 to float		; <float> [#uses=1]
	%tmp26.i509 = mul float %tmp2223.i508, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i510 = sitofp i32 %tmp16.i505 to float		; <float> [#uses=1]
	%tmp31.i511 = mul float %tmp2728.i510, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i512 = add float %tmp21.i507, %tmp26.i509		; <float> [#uses=1]
	%tmp36.i513 = add float %tmp34.i512, %tmp31.i511		; <float> [#uses=2]
	%tmp9.i474 = mul i32 %tmp10.i499, 171		; <i32> [#uses=1]
	%tmp10.i475 = srem i32 %tmp9.i474, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i475, i32* @y1rnd, align 4
	%tmp12.i477 = mul i32 %tmp13.i502, 172		; <i32> [#uses=1]
	%tmp13.i478 = srem i32 %tmp12.i477, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i478, i32* @y2rnd, align 4
	%tmp15.i480 = mul i32 %tmp16.i505, 170		; <i32> [#uses=1]
	%tmp16.i481 = srem i32 %tmp15.i480, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i481, i32* @y3rnd, align 4
	%tmp1718.i482 = sitofp i32 %tmp10.i475 to float		; <float> [#uses=1]
	%tmp21.i483 = mul float %tmp1718.i482, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i484 = sitofp i32 %tmp13.i478 to float		; <float> [#uses=1]
	%tmp26.i485 = mul float %tmp2223.i484, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i486 = sitofp i32 %tmp16.i481 to float		; <float> [#uses=1]
	%tmp31.i487 = mul float %tmp2728.i486, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i488 = add float %tmp21.i483, %tmp26.i485		; <float> [#uses=1]
	%tmp36.i489 = add float %tmp34.i488, %tmp31.i487		; <float> [#uses=2]
	%tmp4142.i514 = fptosi float %tmp36.i513 to i32		; <i32> [#uses=1]
	%tmp414243.i515 = sitofp i32 %tmp4142.i514 to float		; <float> [#uses=1]
	%tmp44.i516 = sub float %tmp36.i513, %tmp414243.i515		; <float> [#uses=1]
	%tmp47.i517 = mul float %tmp56.i544, %tmp44.i516		; <float> [#uses=1]
	%tmp4748.i518 = fptosi float %tmp47.i517 to i32		; <i32> [#uses=1]
	%tmp50.i519 = add i32 %tmp4748.i518, 1		; <i32> [#uses=1]
	%tmp4142.i490 = fptosi float %tmp36.i489 to i32		; <i32> [#uses=1]
	%tmp414243.i491 = sitofp i32 %tmp4142.i490 to float		; <float> [#uses=1]
	%tmp44.i492 = sub float %tmp36.i489, %tmp414243.i491		; <float> [#uses=1]
	%tmp47.i493 = mul float %tmp56.i520, %tmp44.i492		; <float> [#uses=1]
	%tmp4748.i494 = fptosi float %tmp47.i493 to i32		; <i32> [#uses=1]
	%tmp50.i495 = add i32 %tmp4748.i494, 1		; <i32> [#uses=1]
	store i32 68, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 108, i32* @cg_caller_id_var, align 4
	%tmp417 = call fastcc i8 @_ZN7way2obj9createwayEiiiiPhRP6pointtRi( i32 %tmp50.i567, i32 %tmp50.i543, i32 %tmp50.i519, i32 %tmp50.i495, i8* %tmp305, %struct.pointt** %wayar288, i32* %waylength289 ) zeroext 		; <i8> [#uses=1]
	%tmp419 = load %struct.pointt** %wayar288, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp419
	%phitmp = icmp eq i8 %tmp417, 0		; <i1> [#uses=1]
	br i1 %phitmp, label %bb438, label %cond_true424

cond_true424:		; preds = %cond_true357
	%tmp427 = load i32* %waylength289, align 4		; <i32> [#uses=1]
	%tmp427428 = sext i32 %tmp427 to i64		; <i64> [#uses=1]
	%tmp429 = add i64 %tmp427428, %stat.6.1.ph		; <i64> [#uses=1]
	%tmp433 = add i64 %stat.9.1.ph, 1		; <i64> [#uses=1]
	br label %bb438

bb438:		; preds = %cond_true424, %cond_true357, %bb304
	%stat.9.0 = phi i64 [ %tmp433, %cond_true424 ], [ %stat.9.1.ph, %cond_true357 ], [ %stat.9.1.ph, %bb304 ]		; <i64> [#uses=2]
	%stat.6.0 = phi i64 [ %tmp429, %cond_true424 ], [ %stat.6.1.ph, %cond_true357 ], [ %stat.6.1.ph, %bb304 ]		; <i64> [#uses=2]
	%tmp437 = add i32 %i.2.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp440 = load i32* %tmp57, align 4		; <i32> [#uses=1]
	%tmp442 = icmp sgt i32 %tmp440, %tmp437		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp442, label %bb299.outer, label %bb445

bb445:		; preds = %bb438, %_ZN7way2obj7loadmapEPKc.exit
	%stat.9.2 = phi i64 [ 0, %_ZN7way2obj7loadmapEPKc.exit ], [ %stat.9.0, %bb438 ]		; <i64> [#uses=1]
	%stat.6.2 = phi i64 [ 0, %_ZN7way2obj7loadmapEPKc.exit ], [ %stat.6.0, %bb438 ]		; <i64> [#uses=1]
	store i32 69, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp447 = call i64 @time( i64* null ) nounwind 		; <i64> [#uses=0]
	%tmp611936 = load i32* %tmp61, align 4		; <i32> [#uses=1]
	%tmp613938 = icmp sgt i32 %tmp611936, 0		; <i1> [#uses=1]
	br i1 %tmp613938, label %bb466.preheader, label %bb616

bb466.preheader:		; preds = %bb445
	%tmp472 = getelementptr [256 x i8]* %movetimear456, i32 0, i64 0		; <i8*> [#uses=2]
	%tmp473 = getelementptr [256 x i8]* %movetimear456, i32 0, i64 1		; <i8*> [#uses=1]
	%tmp474 = getelementptr [256 x i8]* %movetimear456, i32 0, i64 2		; <i8*> [#uses=1]
	br label %bb466.outer

bb466.outer:		; preds = %bb609, %bb466.preheader
	%i.3.reg2mem.0.ph = phi i32 [ 0, %bb466.preheader ], [ %tmp608, %bb609 ]		; <i32> [#uses=1]
	%stat.10.1.ph = phi i64 [ 0, %bb466.preheader ], [ %stat.10.0, %bb609 ]		; <i64> [#uses=3]
	%stat.7.1.ph = phi i64 [ 0, %bb466.preheader ], [ %stat.7.0, %bb609 ]		; <i64> [#uses=3]
	%val37 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val48 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 110, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val37, i32 %val48, i32 110 )
	br label %bb458

bb458:		; preds = %bb458, %bb466.outer
	%j457.0963 = phi i32 [ 0, %bb466.outer ], [ %indvar.next979, %bb458 ]		; <i32> [#uses=3]
	%val39 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val410 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 111, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val39, i32 %val410, i32 111 )
	%tmp460461 = trunc i32 %j457.0963 to i8		; <i8> [#uses=1]
	%tmp459462 = sext i32 %j457.0963 to i64		; <i64> [#uses=1]
	%tmp463 = getelementptr [256 x i8]* %movetimear456, i32 0, i64 %tmp459462		; <i8*> [#uses=1]
	store i8 %tmp460461, i8* %tmp463, align 1
	%indvar.next979 = add i32 %j457.0963, 1		; <i32> [#uses=2]
	%exitcond980 = icmp eq i32 %indvar.next979, 256		; <i1> [#uses=1]
	store i32 %val410, i32* @cg_caller_call_site_var, align 4
	store i32 %val39, i32* @cg_caller_id_var, align 4
	br i1 %exitcond980, label %bb471, label %bb458

bb471:		; preds = %bb458
	store i8 1, i8* %tmp472, align 1
	store i8 -1, i8* %tmp473, align 1
	store i8 -1, i8* %tmp474, align 1
	store i32 0, i32* %waylength454, align 4
	store %struct.pointt* null, %struct.pointt** %wayar453, align 8
	%tmp476 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 17), align 32		; <i32> [#uses=2]
	%tmp477 = add i32 %tmp476, -2		; <i32> [#uses=1]
	%tmp56.i446 = sitofp i32 %tmp477 to float		; <float> [#uses=2]
	%tmp8.i447 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i448 = mul i32 %tmp8.i447, 171		; <i32> [#uses=1]
	%tmp10.i449 = srem i32 %tmp9.i448, 30269		; <i32> [#uses=2]
	%tmp11.i450 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i451 = mul i32 %tmp11.i450, 172		; <i32> [#uses=1]
	%tmp13.i452 = srem i32 %tmp12.i451, 30307		; <i32> [#uses=2]
	%tmp14.i453 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i454 = mul i32 %tmp14.i453, 170		; <i32> [#uses=1]
	%tmp16.i455 = srem i32 %tmp15.i454, 30323		; <i32> [#uses=2]
	%tmp1718.i456 = sitofp i32 %tmp10.i449 to float		; <float> [#uses=1]
	%tmp21.i457 = mul float %tmp1718.i456, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i458 = sitofp i32 %tmp13.i452 to float		; <float> [#uses=1]
	%tmp26.i459 = mul float %tmp2223.i458, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i460 = sitofp i32 %tmp16.i455 to float		; <float> [#uses=1]
	%tmp31.i461 = mul float %tmp2728.i460, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i462 = add float %tmp21.i457, %tmp26.i459		; <float> [#uses=1]
	%tmp36.i463 = add float %tmp34.i462, %tmp31.i461		; <float> [#uses=2]
	%tmp4142.i464 = fptosi float %tmp36.i463 to i32		; <i32> [#uses=1]
	%tmp414243.i465 = sitofp i32 %tmp4142.i464 to float		; <float> [#uses=1]
	%tmp44.i466 = sub float %tmp36.i463, %tmp414243.i465		; <float> [#uses=1]
	%tmp47.i467 = mul float %tmp56.i446, %tmp44.i466		; <float> [#uses=1]
	%tmp4748.i468 = fptosi float %tmp47.i467 to i32		; <i32> [#uses=1]
	%tmp50.i469 = add i32 %tmp4748.i468, 1		; <i32> [#uses=2]
	%tmp488 = load i32* getelementptr (%struct.way2obj* @way2, i32 0, i32 18), align 32		; <i32> [#uses=1]
	%tmp489 = add i32 %tmp488, -2		; <i32> [#uses=1]
	%tmp56.i422 = sitofp i32 %tmp489 to float		; <float> [#uses=2]
	%tmp9.i424 = mul i32 %tmp10.i449, 171		; <i32> [#uses=1]
	%tmp10.i425 = srem i32 %tmp9.i424, 30269		; <i32> [#uses=3]
	store i32 %tmp10.i425, i32* @y1rnd, align 4
	%tmp12.i427 = mul i32 %tmp13.i452, 172		; <i32> [#uses=1]
	%tmp13.i428 = srem i32 %tmp12.i427, 30307		; <i32> [#uses=3]
	store i32 %tmp13.i428, i32* @y2rnd, align 4
	%tmp15.i430 = mul i32 %tmp16.i455, 170		; <i32> [#uses=1]
	%tmp16.i431 = srem i32 %tmp15.i430, 30323		; <i32> [#uses=3]
	store i32 %tmp16.i431, i32* @y3rnd, align 4
	%tmp1718.i432 = sitofp i32 %tmp10.i425 to float		; <float> [#uses=1]
	%tmp21.i433 = mul float %tmp1718.i432, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i434 = sitofp i32 %tmp13.i428 to float		; <float> [#uses=1]
	%tmp26.i435 = mul float %tmp2223.i434, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i436 = sitofp i32 %tmp16.i431 to float		; <float> [#uses=1]
	%tmp31.i437 = mul float %tmp2728.i436, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i438 = add float %tmp21.i433, %tmp26.i435		; <float> [#uses=1]
	%tmp36.i439 = add float %tmp34.i438, %tmp31.i437		; <float> [#uses=2]
	%tmp4142.i440 = fptosi float %tmp36.i439 to i32		; <i32> [#uses=1]
	%tmp414243.i441 = sitofp i32 %tmp4142.i440 to float		; <float> [#uses=1]
	%tmp44.i442 = sub float %tmp36.i439, %tmp414243.i441		; <float> [#uses=1]
	%tmp47.i443 = mul float %tmp56.i422, %tmp44.i442		; <float> [#uses=1]
	%tmp4748.i444 = fptosi float %tmp47.i443 to i32		; <i32> [#uses=1]
	%tmp50.i445 = add i32 %tmp4748.i444, 1		; <i32> [#uses=2]
	%tmp505 = load i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32		; <i8*> [#uses=1]
	%tmp509 = mul i32 %tmp476, %tmp50.i445		; <i32> [#uses=1]
	%tmp511 = add i32 %tmp509, %tmp50.i469		; <i32> [#uses=1]
	%tmp511512 = sext i32 %tmp511 to i64		; <i64> [#uses=1]
	%tmp513 = getelementptr i8* %tmp505, i64 %tmp511512		; <i8*> [#uses=1]
	%tmp514 = load i8* %tmp513, align 1		; <i8> [#uses=1]
	%tmp518519520521 = zext i8 %tmp514 to i64		; <i64> [#uses=1]
	%tmp522 = getelementptr [256 x i8]* %movetimear456, i32 0, i64 %tmp518519520521		; <i8*> [#uses=1]
	%tmp523 = load i8* %tmp522, align 1		; <i8> [#uses=1]
	%tmp524 = icmp eq i8 %tmp523, 0		; <i1> [#uses=1]
	br i1 %tmp524, label %bb609, label %cond_true528

cond_true528:		; preds = %bb471
	%tmp9.i400 = mul i32 %tmp10.i425, 171		; <i32> [#uses=1]
	%tmp10.i401 = srem i32 %tmp9.i400, 30269		; <i32> [#uses=2]
	%tmp12.i403 = mul i32 %tmp13.i428, 172		; <i32> [#uses=1]
	%tmp13.i404 = srem i32 %tmp12.i403, 30307		; <i32> [#uses=2]
	%tmp15.i406 = mul i32 %tmp16.i431, 170		; <i32> [#uses=1]
	%tmp16.i407 = srem i32 %tmp15.i406, 30323		; <i32> [#uses=2]
	%tmp1718.i408 = sitofp i32 %tmp10.i401 to float		; <float> [#uses=1]
	%tmp21.i409 = mul float %tmp1718.i408, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i410 = sitofp i32 %tmp13.i404 to float		; <float> [#uses=1]
	%tmp26.i411 = mul float %tmp2223.i410, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i412 = sitofp i32 %tmp16.i407 to float		; <float> [#uses=1]
	%tmp31.i413 = mul float %tmp2728.i412, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i414 = add float %tmp21.i409, %tmp26.i411		; <float> [#uses=1]
	%tmp36.i415 = add float %tmp34.i414, %tmp31.i413		; <float> [#uses=2]
	%tmp9.i376 = mul i32 %tmp10.i401, 171		; <i32> [#uses=1]
	%tmp10.i377 = srem i32 %tmp9.i376, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i377, i32* @y1rnd, align 4
	%tmp12.i379 = mul i32 %tmp13.i404, 172		; <i32> [#uses=1]
	%tmp13.i380 = srem i32 %tmp12.i379, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i380, i32* @y2rnd, align 4
	%tmp15.i382 = mul i32 %tmp16.i407, 170		; <i32> [#uses=1]
	%tmp16.i383 = srem i32 %tmp15.i382, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i383, i32* @y3rnd, align 4
	%tmp1718.i384 = sitofp i32 %tmp10.i377 to float		; <float> [#uses=1]
	%tmp21.i385 = mul float %tmp1718.i384, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i386 = sitofp i32 %tmp13.i380 to float		; <float> [#uses=1]
	%tmp26.i387 = mul float %tmp2223.i386, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i388 = sitofp i32 %tmp16.i383 to float		; <float> [#uses=1]
	%tmp31.i389 = mul float %tmp2728.i388, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i390 = add float %tmp21.i385, %tmp26.i387		; <float> [#uses=1]
	%tmp36.i391 = add float %tmp34.i390, %tmp31.i389		; <float> [#uses=2]
	%tmp4142.i416 = fptosi float %tmp36.i415 to i32		; <i32> [#uses=1]
	%tmp414243.i417 = sitofp i32 %tmp4142.i416 to float		; <float> [#uses=1]
	%tmp44.i418 = sub float %tmp36.i415, %tmp414243.i417		; <float> [#uses=1]
	%tmp47.i419 = mul float %tmp56.i446, %tmp44.i418		; <float> [#uses=1]
	%tmp4748.i420 = fptosi float %tmp47.i419 to i32		; <i32> [#uses=1]
	%tmp50.i421 = add i32 %tmp4748.i420, 1		; <i32> [#uses=1]
	%tmp4142.i392 = fptosi float %tmp36.i391 to i32		; <i32> [#uses=1]
	%tmp414243.i393 = sitofp i32 %tmp4142.i392 to float		; <float> [#uses=1]
	%tmp44.i394 = sub float %tmp36.i391, %tmp414243.i393		; <float> [#uses=1]
	%tmp47.i395 = mul float %tmp56.i422, %tmp44.i394		; <float> [#uses=1]
	%tmp4748.i396 = fptosi float %tmp47.i395 to i32		; <i32> [#uses=1]
	%tmp50.i397 = add i32 %tmp4748.i396, 1		; <i32> [#uses=1]
	store i32 70, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 110, i32* @cg_caller_id_var, align 4
	%tmp588 = call fastcc i8 @_ZN7way2obj9createwayEiiiiPhRP6pointtRi( i32 %tmp50.i469, i32 %tmp50.i445, i32 %tmp50.i421, i32 %tmp50.i397, i8* %tmp472, %struct.pointt** %wayar453, i32* %waylength454 ) zeroext 		; <i8> [#uses=1]
	%tmp590 = load %struct.pointt** %wayar453, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp590
	%phitmp603 = icmp eq i8 %tmp588, 0		; <i1> [#uses=1]
	br i1 %phitmp603, label %bb609, label %cond_true595

cond_true595:		; preds = %cond_true528
	%tmp598 = load i32* %waylength454, align 4		; <i32> [#uses=1]
	%tmp598599 = sext i32 %tmp598 to i64		; <i64> [#uses=1]
	%tmp600 = add i64 %tmp598599, %stat.7.1.ph		; <i64> [#uses=1]
	%tmp604 = add i64 %stat.10.1.ph, 1		; <i64> [#uses=1]
	br label %bb609

bb609:		; preds = %cond_true595, %cond_true528, %bb471
	%stat.10.0 = phi i64 [ %tmp604, %cond_true595 ], [ %stat.10.1.ph, %cond_true528 ], [ %stat.10.1.ph, %bb471 ]		; <i64> [#uses=2]
	%stat.7.0 = phi i64 [ %tmp600, %cond_true595 ], [ %stat.7.1.ph, %cond_true528 ], [ %stat.7.1.ph, %bb471 ]		; <i64> [#uses=2]
	%tmp608 = add i32 %i.3.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%tmp611 = load i32* %tmp61, align 4		; <i32> [#uses=1]
	%tmp613 = icmp sgt i32 %tmp611, %tmp608		; <i1> [#uses=1]
	store i32 %val48, i32* @cg_caller_call_site_var, align 4
	store i32 %val37, i32* @cg_caller_id_var, align 4
	br i1 %tmp613, label %bb466.outer, label %bb616

bb616:		; preds = %bb609, %bb445
	%stat.10.2 = phi i64 [ 0, %bb445 ], [ %stat.10.0, %bb609 ]		; <i64> [#uses=1]
	%stat.7.2 = phi i64 [ 0, %bb445 ], [ %stat.7.0, %bb609 ]		; <i64> [#uses=1]
	br label %bb.i349

bb.i349:		; preds = %bb.i349, %bb616
	%i.0.reg2mem.0.i343 = phi i32 [ 0, %bb616 ], [ %indvar.next.i347, %bb.i349 ]		; <i32> [#uses=2]
	%val311 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val412 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 112, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val311, i32 %val412, i32 112 )
	%tmp3.i344 = sext i32 %i.0.reg2mem.0.i343 to i64		; <i64> [#uses=1]
	%tmp7.i345 = getelementptr %struct.way2obj* @way2, i32 0, i32 4, i64 %tmp3.i344, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp8.i346 = load %struct.pointt** %tmp7.i345, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp8.i346
	%indvar.next.i347 = add i32 %i.0.reg2mem.0.i343, 1		; <i32> [#uses=2]
	%exitcond.i348 = icmp eq i32 %indvar.next.i347, 256		; <i1> [#uses=1]
	store i32 %val412, i32* @cg_caller_call_site_var, align 4
	store i32 %val311, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i348, label %_ZN7way2obj7destroyEv.exit, label %bb.i349

_ZN7way2obj7destroyEv.exit:		; preds = %bb.i349
	%tmp20.i350 = load i8** getelementptr (%struct.way2obj* @way2, i32 0, i32 0), align 32		; <i8*> [#uses=1]
	free i8* %tmp20.i350
	%tmp23.i = load %struct.point16t** getelementptr (%struct.way2obj* @way2, i32 0, i32 1), align 8		; <%struct.point16t*> [#uses=1]
	free %struct.point16t* %tmp23.i
	store i32 71, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp4.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([33 x i8]* @.str1, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 72, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp5.i = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 73, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp10.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str12, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 74, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp15.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([22 x i8]* @.str2, i32 0, i64 0), i64 %stat.8.5 )		; <i32> [#uses=0]
	store i32 75, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp20.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str3, i32 0, i64 0), i64 %stat.5.5 )		; <i32> [#uses=0]
	store i32 76, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp21.i = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 77, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp26.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([29 x i8]* @.str4, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 78, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp31.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([26 x i8]* @.str5, i32 0, i64 0), i64 %stat.12.5 )		; <i32> [#uses=0]
	store i32 79, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp36.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([29 x i8]* @.str6, i32 0, i64 0), i64 %stat.11.5 )		; <i32> [#uses=0]
	store i32 80, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp37.i = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 81, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp42.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([31 x i8]* @.str7, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 82, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp47.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([28 x i8]* @.str8, i32 0, i64 0), i64 %stat.9.2 )		; <i32> [#uses=0]
	store i32 83, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp52.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([31 x i8]* @.str9, i32 0, i64 0), i64 %stat.6.2 )		; <i32> [#uses=0]
	store i32 84, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp57.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([30 x i8]* @.str10, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 85, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp62.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([27 x i8]* @.str11, i32 0, i64 0), i64 %stat.10.2 )		; <i32> [#uses=0]
	store i32 86, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp67.i = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([30 x i8]* @.str123, i32 0, i64 0), i64 %stat.7.2 )		; <i32> [#uses=0]
	store i32 87, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp618 = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 88, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp620 = call i32 @puts( i8* getelementptr ([12 x i8]* @.str21, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	store i32 89, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp622 = call i32 @puts( i8* getelementptr ([11 x i8]* @.str22, i32 0, i64 0) ) nounwind 		; <i32> [#uses=0]
	store i32 90, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj6createEv( )
	store %struct.regmngobj* @regmng, %struct.regmngobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 5), align 8
	%tmp8.i314 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 8		; <i32> [#uses=1]
	%tmp9.i315 = add i32 %tmp8.i314, 1		; <i32> [#uses=4]
	store i32 %tmp9.i315, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8
	%tmp28.i316 = malloc %struct.regobj*, i32 %tmp9.i315		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp28.i316, %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8
	store i32 %tmp9.i315, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 2), align 8
	store i32 0, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 1), align 8
	%tmp62.i319 = malloc %struct.regobj*, i32 %tmp9.i315		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp62.i319, %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 0), align 8
	%tmp624 = load float* %tmp77, align 4		; <float> [#uses=1]
	%tmp626 = load i32* %tmp73, align 4		; <i32> [#uses=6]
	%tmp628 = load i32* %tmp69, align 4		; <i32> [#uses=7]
	%tmp1.i = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 0		; <float*> [#uses=1]
	store float -1.000000e+03, float* %tmp1.i, align 8
	%tmp2.i287 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 2		; <float*> [#uses=1]
	store float -1.000000e+03, float* %tmp2.i287, align 4
	%tmp3.i288 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 1		; <float*> [#uses=1]
	store float 1.000000e+03, float* %tmp3.i288, align 4
	%tmp4.i289 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 3		; <float*> [#uses=1]
	store float 1.000000e+03, float* %tmp4.i289, align 4
	%tmp56.i290 = sitofp i32 %tmp628 to double		; <double> [#uses=1]
	store i32 91, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp7.i291 = call double @log( double %tmp56.i290 ) nounwind readonly 		; <double> [#uses=1]
	%tmp9.i292 = fdiv double %tmp7.i291, 0x3FE62E42FEFA39EF		; <double> [#uses=1]
	%tmp10.i293 = add double %tmp9.i292, 5.000000e-01		; <double> [#uses=1]
	%tmp1011.i = fptosi double %tmp10.i293 to i32		; <i32> [#uses=1]
	%tmp12.i294 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 4		; <i32*> [#uses=1]
	store i32 %tmp1011.i, i32* %tmp12.i294, align 4
	%tmp1314.i295 = sitofp i32 %tmp626 to double		; <double> [#uses=1]
	store i32 92, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp15.i296 = call double @log( double %tmp1314.i295 ) nounwind readonly 		; <double> [#uses=1]
	%tmp17.i = fdiv double %tmp15.i296, 0x3FE62E42FEFA39EF		; <double> [#uses=1]
	%tmp18.i = add double %tmp17.i, 5.000000e-01		; <double> [#uses=1]
	%tmp1819.i = fptosi double %tmp18.i to i32		; <i32> [#uses=1]
	%tmp20.i297 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 5		; <i32*> [#uses=1]
	store i32 %tmp1819.i, i32* %tmp20.i297, align 4
	%tmp21.i298 = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 6		; <float*> [#uses=1]
	store float 0.000000e+00, float* %tmp21.i298, align 4
	%tmp22.i = getelementptr %struct.createwaymnginfot* %info.i286, i32 0, i32 7		; <float*> [#uses=1]
	store float 1.000000e+05, float* %tmp22.i, align 4
	%tmp24.i299 = bitcast %struct.createwaymnginfot* %info.i286 to { [8 x i32] }*		; <{ [8 x i32] }*> [#uses=7]
	%tmp26.i300 = bitcast %struct.createwaymnginfot* %info.i286 to i32*		; <i32*> [#uses=1]
	%tmp27.i301 = load i32* %tmp26.i300, align 8		; <i32> [#uses=1]
	%tmp28.i302 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 1		; <i32*> [#uses=1]
	%tmp29.i303 = load i32* %tmp28.i302, align 4		; <i32> [#uses=1]
	%tmp30.i304 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 2		; <i32*> [#uses=1]
	%tmp31.i305 = load i32* %tmp30.i304, align 4		; <i32> [#uses=1]
	%tmp32.i306 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 3		; <i32*> [#uses=1]
	%tmp33.i = load i32* %tmp32.i306, align 4		; <i32> [#uses=1]
	%tmp34.i307 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp35.i308 = load i32* %tmp34.i307, align 4		; <i32> [#uses=1]
	%tmp36.i309 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 5		; <i32*> [#uses=1]
	%tmp37.i310 = load i32* %tmp36.i309, align 4		; <i32> [#uses=1]
	%tmp38.i = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 6		; <i32*> [#uses=1]
	%tmp39.i311 = load i32* %tmp38.i, align 4		; <i32> [#uses=1]
	%tmp40.i312 = getelementptr { [8 x i32] }* %tmp24.i299, i32 0, i32 0, i32 7		; <i32*> [#uses=1]
	%tmp41.i313 = load i32* %tmp40.i312, align 4		; <i32> [#uses=1]
	store i32 93, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6wayobj6createE17createwaymnginfot( i32 %tmp27.i301, i32 %tmp29.i303, i32 %tmp31.i305, i32 %tmp33.i, i32 %tmp35.i308, i32 %tmp37.i310, i32 %tmp39.i311, i32 %tmp41.i313 )
	store i32 %tmp628, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 16), align 8
	store i32 %tmp626, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 17), align 8
	%tmp10.i275 = add i32 %tmp628, -1		; <i32> [#uses=1]
	store i32 %tmp10.i275, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 8
	%tmp16.i276 = add i32 %tmp626, -1		; <i32> [#uses=2]
	store i32 %tmp16.i276, i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 8
	%tmp25.i277 = mul i32 %tmp626, %tmp628		; <i32> [#uses=4]
	%tmp28.i278 = malloc %struct.regobj*, i32 %tmp25.i277		; <%struct.regobj**> [#uses=1]
	store %struct.regobj** %tmp28.i278, %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 6), align 8
	%tmp40.i279 = malloc i8, i32 %tmp25.i277		; <i8*> [#uses=1]
	store i8* %tmp40.i279, i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 8
	%tmp52.i280 = malloc i16, i32 %tmp25.i277		; <i16*> [#uses=2]
	store i16* %tmp52.i280, i16** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 0), align 32
	%tmp6263.i = sext i32 %tmp25.i277 to i64		; <i64> [#uses=1]
	%tmp64.i = shl i64 %tmp6263.i, 1		; <i64> [#uses=1]
	%tmp6768.i = bitcast i16* %tmp52.i280 to i8*		; <i8*> [#uses=1]
	store i32 94, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call void @llvm.memset.i64( i8* %tmp6768.i, i8 0, i64 %tmp64.i, i32 8 ) nounwind 
	store i16 0, i16* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 1), align 8
	br label %bb.i285

bb.i285:		; preds = %bb.i285, %_ZN7way2obj7destroyEv.exit
	%i.0.reg2mem.0.i281 = phi i32 [ 0, %_ZN7way2obj7destroyEv.exit ], [ %indvar.next.i283, %bb.i285 ]		; <i32> [#uses=2]
	%val313 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val414 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 113, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val313, i32 %val414, i32 113 )
	%tmp7174.i = sext i32 %i.0.reg2mem.0.i281 to i64		; <i64> [#uses=1]
	%tmp75.i282 = getelementptr %struct.regmngobj* @regmng, i32 0, i32 8, i64 %tmp7174.i		; <i8*> [#uses=1]
	store i8 0, i8* %tmp75.i282, align 1
	%indvar.next.i283 = add i32 %i.0.reg2mem.0.i281, 1		; <i32> [#uses=2]
	%exitcond.i284 = icmp eq i32 %indvar.next.i283, 256		; <i1> [#uses=1]
	store i32 %val414, i32* @cg_caller_call_site_var, align 4
	store i32 %val313, i32* @cg_caller_id_var, align 4
	br i1 %exitcond.i284, label %_ZN9regmngobj7initmapEii.exit, label %bb.i285

_ZN9regmngobj7initmapEii.exit:		; preds = %bb.i285
	store i8 1, i8* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 8, i64 0), align 1
	%tmp638 = load i8** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 7), align 32		; <i8*> [#uses=1]
	%tmp681943 = icmp sgt i32 %tmp626, 0		; <i1> [#uses=1]
	br i1 %tmp681943, label %bb669.preheader, label %bb684

bb669.preheader:		; preds = %_ZN9regmngobj7initmapEii.exit
	%tmp976 = icmp slt i32 %tmp16.i276, 0		; <i1> [#uses=1]
	%tmp977 = select i1 %tmp976, i32 1, i32 %tmp626		; <i32> [#uses=1]
	%tmp4.i261 = sub float %tmp624, 0.000000e+00		; <float> [#uses=1]
	%tmp2.i252 = load i16** @way.16, align 8		; <i16*> [#uses=1]
	%tmp5.i253 = load i32* @way.2, align 8		; <i32> [#uses=1]
	%y1rnd.promoted = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%y2rnd.promoted = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%y3rnd.promoted = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	br label %bb669.outer

bb669.outer:		; preds = %bb675, %bb669.preheader
	%y3rnd.tmp.1 = phi i32 [ %y3rnd.promoted, %bb669.preheader ], [ %y3rnd.tmp.0602, %bb675 ]		; <i32> [#uses=1]
	%y2rnd.tmp.1 = phi i32 [ %y2rnd.promoted, %bb669.preheader ], [ %y2rnd.tmp.0601, %bb675 ]		; <i32> [#uses=1]
	%y1rnd.tmp.1 = phi i32 [ %y1rnd.promoted, %bb669.preheader ], [ %y1rnd.tmp.0600, %bb675 ]		; <i32> [#uses=1]
	%y630.0.reg2mem.0.ph = phi i32 [ 0, %bb669.preheader ], [ %indvar.next975, %bb675 ]		; <i32> [#uses=3]
	%val315 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val416 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 114, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val315, i32 %val416, i32 114 )
	%tmp650 = mul i32 %y630.0.reg2mem.0.ph, %tmp628		; <i32> [#uses=1]
	%tmp7.i254 = shl i32 %y630.0.reg2mem.0.ph, %tmp5.i253		; <i32> [#uses=1]
	br label %bb669

bb640:		; preds = %bb669, %cond_true647
	%y3rnd.tmp.0 = phi i32 [ %tmp14.i270, %cond_true647 ], [ %y3rnd.tmp.0599, %bb669 ]		; <i32> [#uses=1]
	%y2rnd.tmp.0 = phi i32 [ %tmp11.i267, %cond_true647 ], [ %y2rnd.tmp.0598, %bb669 ]		; <i32> [#uses=1]
	%y1rnd.tmp.0 = phi i32 [ %tmp8.i264, %cond_true647 ], [ %y1rnd.tmp.0597, %bb669 ]		; <i32> [#uses=1]
	%indvar = phi i32 [ %indvar.next973, %cond_true647 ], [ 0, %bb669 ]		; <i32> [#uses=2]
	%val319 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val420 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 116, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val319, i32 %val420, i32 116 )
	%x629.0.reg2mem.0 = add i32 %indvar, %x629.0		; <i32> [#uses=3]
	%tmp7.i263 = mul i32 %y1rnd.tmp.0, 171		; <i32> [#uses=1]
	%tmp8.i264 = srem i32 %tmp7.i263, 30269		; <i32> [#uses=5]
	%tmp10.i266 = mul i32 %y2rnd.tmp.0, 172		; <i32> [#uses=1]
	%tmp11.i267 = srem i32 %tmp10.i266, 30307		; <i32> [#uses=5]
	%tmp13.i269 = mul i32 %y3rnd.tmp.0, 170		; <i32> [#uses=1]
	%tmp14.i270 = srem i32 %tmp13.i269, 30323		; <i32> [#uses=5]
	%tmp1516.i = sitofp i32 %tmp8.i264 to float		; <float> [#uses=1]
	%tmp19.i = mul float %tmp1516.i, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2021.i = sitofp i32 %tmp11.i267 to float		; <float> [#uses=1]
	%tmp24.i = mul float %tmp2021.i, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2526.i = sitofp i32 %tmp14.i270 to float		; <float> [#uses=1]
	%tmp29.i271 = mul float %tmp2526.i, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp32.i = add float %tmp19.i, %tmp24.i		; <float> [#uses=1]
	%tmp34.i272 = add float %tmp32.i, %tmp29.i271		; <float> [#uses=2]
	%tmp3940.i = fptosi float %tmp34.i272 to i32		; <i32> [#uses=1]
	%tmp394041.i = sitofp i32 %tmp3940.i to float		; <float> [#uses=1]
	%tmp42.i273 = sub float %tmp34.i272, %tmp394041.i		; <float> [#uses=1]
	%tmp45.i = mul float %tmp4.i261, %tmp42.i273		; <float> [#uses=1]
	%tmp47.i274 = add float %tmp45.i, 0.000000e+00		; <float> [#uses=1]
	%tmp643 = fcmp ugt float %tmp47.i274, 1.000000e+00		; <i1> [#uses=1]
	%tmp652 = add i32 %x629.0.reg2mem.0, %tmp650		; <i32> [#uses=1]
	%tmp652654 = sext i32 %tmp652 to i64		; <i64> [#uses=1]
	%tmp655 = getelementptr i8* %tmp638, i64 %tmp652654		; <i8*> [#uses=2]
	%tmp668 = add i32 %x629.0.reg2mem.0, 1		; <i32> [#uses=3]
	store i32 %val420, i32* @cg_caller_call_site_var, align 4
	store i32 %val319, i32* @cg_caller_id_var, align 4
	br i1 %tmp643, label %cond_false, label %cond_true647

cond_true647:		; preds = %bb640
	store i8 0, i8* %tmp655, align 1
	%tmp672948 = icmp slt i32 %tmp668, %tmp628		; <i1> [#uses=1]
	%indvar.next973 = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val418, i32* @cg_caller_call_site_var, align 4
	store i32 %val317, i32* @cg_caller_id_var, align 4
	store i32 %val420, i32* @cg_caller_call_site_var, align 4
	store i32 %val319, i32* @cg_caller_id_var, align 4
	br i1 %tmp672948, label %bb640, label %bb675

cond_false:		; preds = %bb640
	store i8 1, i8* %tmp655, align 1
	%tmp9.i255 = or i32 %tmp7.i254, %x629.0.reg2mem.0		; <i32> [#uses=1]
	%tmp910.i = sext i32 %tmp9.i255 to i64		; <i64> [#uses=1]
	%tmp11.i256 = getelementptr i16* %tmp2.i252, i64 %tmp910.i		; <i16*> [#uses=2]
	%tmp12.i257 = load i16* %tmp11.i256, align 2		; <i16> [#uses=2]
	%tmp13.i258 = icmp sgt i16 %tmp12.i257, -1		; <i1> [#uses=1]
	br i1 %tmp13.i258, label %cond_true.i, label %bb669

cond_true.i:		; preds = %cond_false
	%tmp28.i259 = add i16 %tmp12.i257, 1		; <i16> [#uses=1]
	store i16 %tmp28.i259, i16* %tmp11.i256, align 2
	br label %bb669

bb669:		; preds = %cond_true.i, %cond_false, %bb669.outer
	%y3rnd.tmp.0599 = phi i32 [ %y3rnd.tmp.1, %bb669.outer ], [ %tmp14.i270, %cond_false ], [ %tmp14.i270, %cond_true.i ]		; <i32> [#uses=2]
	%y2rnd.tmp.0598 = phi i32 [ %y2rnd.tmp.1, %bb669.outer ], [ %tmp11.i267, %cond_false ], [ %tmp11.i267, %cond_true.i ]		; <i32> [#uses=2]
	%y1rnd.tmp.0597 = phi i32 [ %y1rnd.tmp.1, %bb669.outer ], [ %tmp8.i264, %cond_false ], [ %tmp8.i264, %cond_true.i ]		; <i32> [#uses=2]
	%x629.0 = phi i32 [ 0, %bb669.outer ], [ %tmp668, %cond_false ], [ %tmp668, %cond_true.i ]		; <i32> [#uses=2]
	%val317 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val418 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 115, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val317, i32 %val418, i32 115 )
	%tmp672 = icmp slt i32 %x629.0, %tmp628		; <i1> [#uses=1]
	store i32 %val418, i32* @cg_caller_call_site_var, align 4
	store i32 %val317, i32* @cg_caller_id_var, align 4
	br i1 %tmp672, label %bb640, label %bb675

bb675:		; preds = %bb669, %cond_true647
	%y3rnd.tmp.0602 = phi i32 [ %tmp14.i270, %cond_true647 ], [ %y3rnd.tmp.0599, %bb669 ]		; <i32> [#uses=2]
	%y2rnd.tmp.0601 = phi i32 [ %tmp11.i267, %cond_true647 ], [ %y2rnd.tmp.0598, %bb669 ]		; <i32> [#uses=2]
	%y1rnd.tmp.0600 = phi i32 [ %tmp8.i264, %cond_true647 ], [ %y1rnd.tmp.0597, %bb669 ]		; <i32> [#uses=2]
	%indvar.next975 = add i32 %y630.0.reg2mem.0.ph, 1		; <i32> [#uses=2]
	%exitcond = icmp eq i32 %indvar.next975, %tmp977		; <i1> [#uses=1]
	store i32 %val416, i32* @cg_caller_call_site_var, align 4
	store i32 %val315, i32* @cg_caller_id_var, align 4
	br i1 %exitcond, label %bb684.loopexit, label %bb669.outer

bb684.loopexit:		; preds = %bb675
	store i32 %y1rnd.tmp.0600, i32* @y1rnd, align 4
	store i32 %y2rnd.tmp.0601, i32* @y2rnd, align 4
	store i32 %y3rnd.tmp.0602, i32* @y3rnd, align 4
	br label %bb684

bb684:		; preds = %bb684.loopexit, %_ZN9regmngobj7initmapEii.exit
	%tmp699 = load i32* %tmp81, align 4		; <i32> [#uses=1]
	store i32 95, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj13createregionsEi( i32 %tmp699 )
	store i32 96, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp701 = call i64 @time( i64* null ) nounwind 		; <i64> [#uses=0]
	%tmp767951 = load i32* %tmp85, align 4		; <i32> [#uses=1]
	%tmp769953 = icmp sgt i32 %tmp767951, 0		; <i1> [#uses=1]
	br i1 %tmp769953, label %bb702, label %bb772

bb702:		; preds = %bb765, %bb684
	%i.4.reg2mem.0 = phi i32 [ %tmp764, %bb765 ], [ 0, %bb684 ]		; <i32> [#uses=1]
	%stat.8.1 = phi i64 [ %stat.8.0, %bb765 ], [ 0, %bb684 ]		; <i64> [#uses=2]
	%stat.5.1 = phi i64 [ %stat.5.0, %bb765 ], [ 0, %bb684 ]		; <i64> [#uses=2]
	%val321 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val422 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 117, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val321, i32 %val422, i32 117 )
	store i32 0, i32* %waylength708, align 4
	store %struct.point16t* null, %struct.point16t** %wayar707, align 8
	%tmp711 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 32		; <i32> [#uses=1]
	%tmp56.i204 = sitofp i32 %tmp711 to float		; <float> [#uses=1]
	%tmp8.i205 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i206 = mul i32 %tmp8.i205, 171		; <i32> [#uses=1]
	%tmp10.i207 = srem i32 %tmp9.i206, 30269		; <i32> [#uses=2]
	%tmp11.i208 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i209 = mul i32 %tmp11.i208, 172		; <i32> [#uses=1]
	%tmp13.i210 = srem i32 %tmp12.i209, 30307		; <i32> [#uses=2]
	%tmp14.i211 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i212 = mul i32 %tmp14.i211, 170		; <i32> [#uses=1]
	%tmp16.i213 = srem i32 %tmp15.i212, 30323		; <i32> [#uses=2]
	%tmp1718.i214 = sitofp i32 %tmp10.i207 to float		; <float> [#uses=1]
	%tmp21.i215 = mul float %tmp1718.i214, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i216 = sitofp i32 %tmp13.i210 to float		; <float> [#uses=1]
	%tmp26.i217 = mul float %tmp2223.i216, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i218 = sitofp i32 %tmp16.i213 to float		; <float> [#uses=1]
	%tmp31.i219 = mul float %tmp2728.i218, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i220 = add float %tmp21.i215, %tmp26.i217		; <float> [#uses=1]
	%tmp36.i221 = add float %tmp34.i220, %tmp31.i219		; <float> [#uses=2]
	%tmp4142.i222 = fptosi float %tmp36.i221 to i32		; <i32> [#uses=1]
	%tmp414243.i223 = sitofp i32 %tmp4142.i222 to float		; <float> [#uses=1]
	%tmp44.i224 = sub float %tmp36.i221, %tmp414243.i223		; <float> [#uses=1]
	%tmp47.i225 = mul float %tmp56.i204, %tmp44.i224		; <float> [#uses=1]
	%tmp4748.i226 = fptosi float %tmp47.i225 to i32		; <i32> [#uses=1]
	%tmp50.i227 = add i32 %tmp4748.i226, 1		; <i32> [#uses=2]
	store i32 %tmp50.i227, i32* %startx703, align 4
	%tmp714 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 32		; <i32> [#uses=1]
	%tmp56.i180 = sitofp i32 %tmp714 to float		; <float> [#uses=1]
	%tmp9.i182 = mul i32 %tmp10.i207, 171		; <i32> [#uses=1]
	%tmp10.i183 = srem i32 %tmp9.i182, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i183, i32* @y1rnd, align 4
	%tmp12.i185 = mul i32 %tmp13.i210, 172		; <i32> [#uses=1]
	%tmp13.i186 = srem i32 %tmp12.i185, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i186, i32* @y2rnd, align 4
	%tmp15.i188 = mul i32 %tmp16.i213, 170		; <i32> [#uses=1]
	%tmp16.i189 = srem i32 %tmp15.i188, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i189, i32* @y3rnd, align 4
	%tmp1718.i190 = sitofp i32 %tmp10.i183 to float		; <float> [#uses=1]
	%tmp21.i191 = mul float %tmp1718.i190, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i192 = sitofp i32 %tmp13.i186 to float		; <float> [#uses=1]
	%tmp26.i193 = mul float %tmp2223.i192, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i194 = sitofp i32 %tmp16.i189 to float		; <float> [#uses=1]
	%tmp31.i195 = mul float %tmp2728.i194, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i196 = add float %tmp21.i191, %tmp26.i193		; <float> [#uses=1]
	%tmp36.i197 = add float %tmp34.i196, %tmp31.i195		; <float> [#uses=2]
	%tmp4142.i198 = fptosi float %tmp36.i197 to i32		; <i32> [#uses=1]
	%tmp414243.i199 = sitofp i32 %tmp4142.i198 to float		; <float> [#uses=1]
	%tmp44.i200 = sub float %tmp36.i197, %tmp414243.i199		; <float> [#uses=1]
	%tmp47.i201 = mul float %tmp56.i180, %tmp44.i200		; <float> [#uses=1]
	%tmp4748.i202 = fptosi float %tmp47.i201 to i32		; <i32> [#uses=1]
	%tmp50.i203 = add i32 %tmp4748.i202, 1		; <i32> [#uses=2]
	store i32 %tmp50.i203, i32* %starty704, align 4
	store i32 97, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 117, i32* @cg_caller_id_var, align 4
	%tmp718 = call fastcc i8 @_ZN6wayobj13findfreepointEiiRiS0_( i32 %tmp50.i227, i32 %tmp50.i203, i32* %startx703, i32* %starty704 ) zeroext 		; <i8> [#uses=1]
	%toBool720 = icmp eq i8 %tmp718, 0		; <i1> [#uses=1]
	br i1 %toBool720, label %cond_next748, label %cond_true721

cond_true721:		; preds = %bb702
	%tmp723 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 12), align 32		; <i32> [#uses=1]
	%tmp56.i132 = sitofp i32 %tmp723 to float		; <float> [#uses=1]
	%tmp8.i133 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp9.i134 = mul i32 %tmp8.i133, 171		; <i32> [#uses=1]
	%tmp10.i135 = srem i32 %tmp9.i134, 30269		; <i32> [#uses=2]
	%tmp11.i136 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp12.i137 = mul i32 %tmp11.i136, 172		; <i32> [#uses=1]
	%tmp13.i138 = srem i32 %tmp12.i137, 30307		; <i32> [#uses=2]
	%tmp14.i139 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp15.i140 = mul i32 %tmp14.i139, 170		; <i32> [#uses=1]
	%tmp16.i141 = srem i32 %tmp15.i140, 30323		; <i32> [#uses=2]
	%tmp1718.i142 = sitofp i32 %tmp10.i135 to float		; <float> [#uses=1]
	%tmp21.i143 = mul float %tmp1718.i142, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i144 = sitofp i32 %tmp13.i138 to float		; <float> [#uses=1]
	%tmp26.i145 = mul float %tmp2223.i144, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i146 = sitofp i32 %tmp16.i141 to float		; <float> [#uses=1]
	%tmp31.i147 = mul float %tmp2728.i146, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i148 = add float %tmp21.i143, %tmp26.i145		; <float> [#uses=1]
	%tmp36.i149 = add float %tmp34.i148, %tmp31.i147		; <float> [#uses=2]
	%tmp4142.i150 = fptosi float %tmp36.i149 to i32		; <i32> [#uses=1]
	%tmp414243.i151 = sitofp i32 %tmp4142.i150 to float		; <float> [#uses=1]
	%tmp44.i152 = sub float %tmp36.i149, %tmp414243.i151		; <float> [#uses=1]
	%tmp47.i153 = mul float %tmp56.i132, %tmp44.i152		; <float> [#uses=1]
	%tmp4748.i154 = fptosi float %tmp47.i153 to i32		; <i32> [#uses=1]
	%tmp50.i155 = add i32 %tmp4748.i154, 1		; <i32> [#uses=2]
	store i32 %tmp50.i155, i32* %endx705, align 4
	%tmp726 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 13), align 32		; <i32> [#uses=1]
	%tmp56.i108 = sitofp i32 %tmp726 to float		; <float> [#uses=1]
	%tmp9.i110 = mul i32 %tmp10.i135, 171		; <i32> [#uses=1]
	%tmp10.i111 = srem i32 %tmp9.i110, 30269		; <i32> [#uses=2]
	store i32 %tmp10.i111, i32* @y1rnd, align 4
	%tmp12.i113 = mul i32 %tmp13.i138, 172		; <i32> [#uses=1]
	%tmp13.i114 = srem i32 %tmp12.i113, 30307		; <i32> [#uses=2]
	store i32 %tmp13.i114, i32* @y2rnd, align 4
	%tmp15.i116 = mul i32 %tmp16.i141, 170		; <i32> [#uses=1]
	%tmp16.i117 = srem i32 %tmp15.i116, 30323		; <i32> [#uses=2]
	store i32 %tmp16.i117, i32* @y3rnd, align 4
	%tmp1718.i118 = sitofp i32 %tmp10.i111 to float		; <float> [#uses=1]
	%tmp21.i119 = mul float %tmp1718.i118, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp2223.i120 = sitofp i32 %tmp13.i114 to float		; <float> [#uses=1]
	%tmp26.i121 = mul float %tmp2223.i120, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2728.i122 = sitofp i32 %tmp16.i117 to float		; <float> [#uses=1]
	%tmp31.i123 = mul float %tmp2728.i122, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp34.i124 = add float %tmp21.i119, %tmp26.i121		; <float> [#uses=1]
	%tmp36.i125 = add float %tmp34.i124, %tmp31.i123		; <float> [#uses=2]
	%tmp4142.i126 = fptosi float %tmp36.i125 to i32		; <i32> [#uses=1]
	%tmp414243.i127 = sitofp i32 %tmp4142.i126 to float		; <float> [#uses=1]
	%tmp44.i128 = sub float %tmp36.i125, %tmp414243.i127		; <float> [#uses=1]
	%tmp47.i129 = mul float %tmp56.i108, %tmp44.i128		; <float> [#uses=1]
	%tmp4748.i130 = fptosi float %tmp47.i129 to i32		; <i32> [#uses=1]
	%tmp50.i131 = add i32 %tmp4748.i130, 1		; <i32> [#uses=2]
	store i32 %tmp50.i131, i32* %endy706, align 4
	store i32 98, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 117, i32* @cg_caller_id_var, align 4
	%tmp730 = call fastcc i8 @_ZN6wayobj13findfreepointEiiRiS0_( i32 %tmp50.i155, i32 %tmp50.i131, i32* %endx705, i32* %endy706 ) zeroext 		; <i8> [#uses=1]
	%toBool732 = icmp eq i8 %tmp730, 0		; <i1> [#uses=1]
	br i1 %toBool732, label %cond_next739, label %cond_true733

cond_true733:		; preds = %cond_true721
	%tmp734 = load i32* %endy706, align 4		; <i32> [#uses=1]
	%tmp735 = load i32* %endx705, align 4		; <i32> [#uses=1]
	%tmp736 = load i32* %starty704, align 4		; <i32> [#uses=1]
	%tmp737 = load i32* %startx703, align 4		; <i32> [#uses=1]
	store i32 99, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 117, i32* @cg_caller_id_var, align 4
	%tmp738 = call fastcc i8 @_ZN6wayobj9createwayEiiiiRP8point16tRi( i32 %tmp737, i32 %tmp736, i32 %tmp735, i32 %tmp734, %struct.point16t** %wayar707, i32* %waylength708 ) zeroext 		; <i8> [#uses=1]
	br label %cond_next739

cond_next739:		; preds = %cond_true733, %cond_true721
	%flcreate709.0 = phi i8 [ %tmp738, %cond_true733 ], [ 0, %cond_true721 ]		; <i8> [#uses=2]
	%tmp740 = load %struct.point16t** %wayar707, align 8		; <%struct.point16t*> [#uses=2]
	%tmp741 = icmp eq %struct.point16t* %tmp740, null		; <i1> [#uses=1]
	br i1 %tmp741, label %cond_next748, label %cond_true744

cond_true744:		; preds = %cond_next739
	free %struct.point16t* %tmp740
	br label %cond_next748

cond_next748:		; preds = %cond_true744, %cond_next739, %bb702
	%flcreate709.1 = phi i8 [ %flcreate709.0, %cond_true744 ], [ 0, %bb702 ], [ %flcreate709.0, %cond_next739 ]		; <i8> [#uses=1]
	%toBool750 = icmp eq i8 %flcreate709.1, 0		; <i1> [#uses=1]
	br i1 %toBool750, label %bb765, label %cond_true751

cond_true751:		; preds = %cond_next748
	%tmp754 = load i32* %waylength708, align 4		; <i32> [#uses=1]
	%tmp754755 = sext i32 %tmp754 to i64		; <i64> [#uses=1]
	%tmp756 = add i64 %tmp754755, %stat.5.1		; <i64> [#uses=1]
	%tmp760 = add i64 %stat.8.1, 1		; <i64> [#uses=1]
	br label %bb765

bb765:		; preds = %cond_true751, %cond_next748
	%stat.8.0 = phi i64 [ %tmp760, %cond_true751 ], [ %stat.8.1, %cond_next748 ]		; <i64> [#uses=2]
	%stat.5.0 = phi i64 [ %tmp756, %cond_true751 ], [ %stat.5.1, %cond_next748 ]		; <i64> [#uses=2]
	%tmp764 = add i32 %i.4.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp767 = load i32* %tmp85, align 4		; <i32> [#uses=1]
	%tmp769 = icmp sgt i32 %tmp767, %tmp764		; <i1> [#uses=1]
	store i32 %val422, i32* @cg_caller_call_site_var, align 4
	store i32 %val321, i32* @cg_caller_id_var, align 4
	br i1 %tmp769, label %bb702, label %bb772

bb772:		; preds = %bb765, %bb684
	%stat.8.2 = phi i64 [ 0, %bb684 ], [ %stat.8.0, %bb765 ]		; <i64> [#uses=1]
	%stat.5.2 = phi i64 [ 0, %bb684 ], [ %stat.5.0, %bb765 ]		; <i64> [#uses=1]
	%tmp866956 = load i32* %tmp89, align 4		; <i32> [#uses=1]
	%tmp868958 = icmp sgt i32 %tmp866956, 0		; <i1> [#uses=1]
	br i1 %tmp868958, label %bb774, label %bb871

bb774:		; preds = %bb864, %bb772
	%i.5.reg2mem.0 = phi i32 [ %tmp863, %bb864 ], [ 0, %bb772 ]		; <i32> [#uses=1]
	%stat.12.1 = phi i64 [ %stat.12.0, %bb864 ], [ 0, %bb772 ]		; <i64> [#uses=4]
	%stat.11.1 = phi i64 [ %stat.11.0, %bb864 ], [ 0, %bb772 ]		; <i64> [#uses=4]
	%val323 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val424 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 118, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val323, i32 %val424, i32 118 )
	%tmp784 = load i32* getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 4), align 32		; <i32> [#uses=1]
	%tmp785 = add i32 %tmp784, -1		; <i32> [#uses=1]
	%tmp3.i43 = load i32* @y1rnd, align 4		; <i32> [#uses=1]
	%tmp4.i44 = mul i32 %tmp3.i43, 171		; <i32> [#uses=1]
	%tmp5.i45 = srem i32 %tmp4.i44, 30269		; <i32> [#uses=2]
	%tmp6.i46 = load i32* @y2rnd, align 4		; <i32> [#uses=1]
	%tmp7.i47 = mul i32 %tmp6.i46, 172		; <i32> [#uses=1]
	%tmp8.i48 = srem i32 %tmp7.i47, 30307		; <i32> [#uses=2]
	%tmp9.i49 = load i32* @y3rnd, align 4		; <i32> [#uses=1]
	%tmp10.i50 = mul i32 %tmp9.i49, 170		; <i32> [#uses=1]
	%tmp11.i51 = srem i32 %tmp10.i50, 30323		; <i32> [#uses=2]
	%tmp1213.i52 = sitofp i32 %tmp5.i45 to float		; <float> [#uses=1]
	%tmp16.i53 = mul float %tmp1213.i52, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp1718.i54 = sitofp i32 %tmp8.i48 to float		; <float> [#uses=1]
	%tmp21.i55 = mul float %tmp1718.i54, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2223.i56 = sitofp i32 %tmp11.i51 to float		; <float> [#uses=1]
	%tmp26.i57 = mul float %tmp2223.i56, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp29.i58 = add float %tmp16.i53, %tmp21.i55		; <float> [#uses=1]
	%tmp31.i59 = add float %tmp29.i58, %tmp26.i57		; <float> [#uses=2]
	%tmp3637.i60 = fptosi float %tmp31.i59 to i32		; <i32> [#uses=1]
	%tmp363738.i61 = sitofp i32 %tmp3637.i60 to float		; <float> [#uses=1]
	%tmp39.i62 = sub float %tmp31.i59, %tmp363738.i61		; <float> [#uses=1]
	%tmp4142.i63 = sitofp i32 %tmp785 to float		; <float> [#uses=2]
	%tmp44.i64 = mul float %tmp39.i62, %tmp4142.i63		; <float> [#uses=1]
	%tmp4445.i65 = fptosi float %tmp44.i64 to i32		; <i32> [#uses=1]
	%tmp4.i32 = mul i32 %tmp5.i45, 171		; <i32> [#uses=1]
	%tmp5.i33 = srem i32 %tmp4.i32, 30269		; <i32> [#uses=2]
	store i32 %tmp5.i33, i32* @y1rnd, align 4
	%tmp7.i = mul i32 %tmp8.i48, 172		; <i32> [#uses=1]
	%tmp8.i34 = srem i32 %tmp7.i, 30307		; <i32> [#uses=2]
	store i32 %tmp8.i34, i32* @y2rnd, align 4
	%tmp10.i36 = mul i32 %tmp11.i51, 170		; <i32> [#uses=1]
	%tmp11.i37 = srem i32 %tmp10.i36, 30323		; <i32> [#uses=2]
	store i32 %tmp11.i37, i32* @y3rnd, align 4
	%tmp1213.i = sitofp i32 %tmp5.i33 to float		; <float> [#uses=1]
	%tmp16.i38 = mul float %tmp1213.i, 0x3F01522A20000000		; <float> [#uses=1]
	%tmp1718.i = sitofp i32 %tmp8.i34 to float		; <float> [#uses=1]
	%tmp21.i39 = mul float %tmp1718.i, 0x3F014C9AE0000000		; <float> [#uses=1]
	%tmp2223.i = sitofp i32 %tmp11.i37 to float		; <float> [#uses=1]
	%tmp26.i40 = mul float %tmp2223.i, 0x3F014A44A0000000		; <float> [#uses=1]
	%tmp29.i = add float %tmp16.i38, %tmp21.i39		; <float> [#uses=1]
	%tmp31.i41 = add float %tmp29.i, %tmp26.i40		; <float> [#uses=2]
	%tmp797 = load %struct.regobj*** getelementptr (%struct.regmngobj* @regmng, i32 0, i32 18, i32 0), align 32		; <%struct.regobj**> [#uses=2]
	%tmp798799 = sext i32 %tmp4445.i65 to i64		; <i64> [#uses=1]
	%tmp800 = getelementptr %struct.regobj** %tmp797, i64 %tmp798799		; <%struct.regobj**> [#uses=1]
	%tmp804 = load %struct.regobj** %tmp800, align 8		; <%struct.regobj*> [#uses=2]
	%tmp807 = getelementptr %struct.regobj* %tmp804, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp808 = load i32* %tmp807, align 8		; <i32> [#uses=1]
	%tmp809 = icmp eq i32 %tmp808, 0		; <i1> [#uses=1]
	br i1 %tmp809, label %bb864, label %cond_next813

cond_next813:		; preds = %bb774
	%tmp3637.i = fptosi float %tmp31.i41 to i32		; <i32> [#uses=1]
	%tmp363738.i = sitofp i32 %tmp3637.i to float		; <float> [#uses=1]
	%tmp39.i42 = sub float %tmp31.i41, %tmp363738.i		; <float> [#uses=1]
	%tmp44.i = mul float %tmp39.i42, %tmp4142.i63		; <float> [#uses=1]
	%tmp4445.i = fptosi float %tmp44.i to i32		; <i32> [#uses=1]
	%tmp820821 = sext i32 %tmp4445.i to i64		; <i64> [#uses=1]
	%tmp822 = getelementptr %struct.regobj** %tmp797, i64 %tmp820821		; <%struct.regobj**> [#uses=1]
	%tmp826 = load %struct.regobj** %tmp822, align 8		; <%struct.regobj*> [#uses=2]
	%tmp829 = getelementptr %struct.regobj* %tmp826, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp830 = load i32* %tmp829, align 8		; <i32> [#uses=1]
	%tmp831 = icmp eq i32 %tmp830, 0		; <i1> [#uses=1]
	br i1 %tmp831, label %bb864, label %cond_next835

cond_next835:		; preds = %cond_next813
	store %struct.regobj** null, %struct.regobj*** %wayar779, align 8
	store i32 0, i32* %waylength780, align 4
	store i32 100, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 118, i32* @cg_caller_id_var, align 4
	%tmp838 = call fastcc i8 @_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri( %struct.regobj* %tmp804, %struct.regobj* %tmp826, %struct.regobj*** %wayar779, i32* %waylength780 ) zeroext 		; <i8> [#uses=1]
	%tmp839 = load %struct.regobj*** %wayar779, align 8		; <%struct.regobj**> [#uses=2]
	%tmp840 = icmp eq %struct.regobj** %tmp839, null		; <i1> [#uses=1]
	br i1 %tmp840, label %cond_next846, label %cond_true843

cond_true843:		; preds = %cond_next835
	free %struct.regobj** %tmp839
	br label %cond_next846

cond_next846:		; preds = %cond_true843, %cond_next835
	%toBool848 = icmp eq i8 %tmp838, 0		; <i1> [#uses=1]
	br i1 %toBool848, label %bb864, label %cond_true849

cond_true849:		; preds = %cond_next846
	%tmp852 = load i32* %waylength780, align 4		; <i32> [#uses=1]
	%tmp852853 = sext i32 %tmp852 to i64		; <i64> [#uses=1]
	%tmp854 = add i64 %tmp852853, %stat.11.1		; <i64> [#uses=1]
	%tmp858 = add i64 %stat.12.1, 1		; <i64> [#uses=1]
	br label %bb864

bb864:		; preds = %cond_true849, %cond_next846, %cond_next813, %bb774
	%stat.12.0 = phi i64 [ %tmp858, %cond_true849 ], [ %stat.12.1, %bb774 ], [ %stat.12.1, %cond_next813 ], [ %stat.12.1, %cond_next846 ]		; <i64> [#uses=2]
	%stat.11.0 = phi i64 [ %tmp854, %cond_true849 ], [ %stat.11.1, %bb774 ], [ %stat.11.1, %cond_next813 ], [ %stat.11.1, %cond_next846 ]		; <i64> [#uses=2]
	%tmp863 = add i32 %i.5.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp866 = load i32* %tmp89, align 4		; <i32> [#uses=1]
	%tmp868 = icmp sgt i32 %tmp866, %tmp863		; <i1> [#uses=1]
	store i32 %val424, i32* @cg_caller_call_site_var, align 4
	store i32 %val323, i32* @cg_caller_id_var, align 4
	br i1 %tmp868, label %bb774, label %bb871

bb871:		; preds = %bb864, %bb772
	%stat.12.2 = phi i64 [ 0, %bb772 ], [ %stat.12.0, %bb864 ]		; <i64> [#uses=1]
	%stat.11.2 = phi i64 [ 0, %bb772 ], [ %stat.11.0, %bb864 ]		; <i64> [#uses=1]
	%tmp5.i13 = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp5.i13
	%tmp13.i = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp13.i
	store i32 101, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN9regmngobj7destroyEv( )
	store i32 102, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	call fastcc void @_ZN6wayobj7destroyEv( )
	store i32 103, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp4.i879 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([33 x i8]* @.str1, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 104, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp5.i880 = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 105, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp10.i883 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str12, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 106, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp15.i886 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([22 x i8]* @.str2, i32 0, i64 0), i64 %stat.8.2 )		; <i32> [#uses=0]
	store i32 107, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp20.i889 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([25 x i8]* @.str3, i32 0, i64 0), i64 %stat.5.2 )		; <i32> [#uses=0]
	store i32 108, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp21.i890 = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 109, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp26.i893 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([29 x i8]* @.str4, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 110, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp31.i896 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([26 x i8]* @.str5, i32 0, i64 0), i64 %stat.12.2 )		; <i32> [#uses=0]
	store i32 111, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp36.i899 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([29 x i8]* @.str6, i32 0, i64 0), i64 %stat.11.2 )		; <i32> [#uses=0]
	store i32 112, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp37.i900 = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	store i32 113, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp42.i903 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([31 x i8]* @.str7, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 114, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp47.i906 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([28 x i8]* @.str8, i32 0, i64 0), i64 0 )		; <i32> [#uses=0]
	store i32 115, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp52.i909 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([31 x i8]* @.str9, i32 0, i64 0), i64 0 )		; <i32> [#uses=0]
	store i32 116, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp57.i912 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([30 x i8]* @.str10, i32 0, i64 0), double 0.000000e+00 )		; <i32> [#uses=0]
	store i32 117, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp62.i915 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([27 x i8]* @.str11, i32 0, i64 0), i64 0 )		; <i32> [#uses=0]
	store i32 118, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp67.i918 = call i32 (i8*, ...)* @printf( i8* noalias  getelementptr ([30 x i8]* @.str123, i32 0, i64 0), i64 0 )		; <i32> [#uses=0]
	store i32 119, i32* @cg_caller_call_site_var, align 4
	store i32 22, i32* @cg_caller_id_var, align 4
	%tmp873 = call i32 @putchar( i32 10 ) nounwind 		; <i32> [#uses=0]
	call void @CallProfPrinter( )
	ret i32 0
}

declare i32 @puts(i8*) nounwind 

declare %struct.FILE* @fopen(i8* noalias , i8* noalias )

declare i32 @fscanf(%struct.FILE* noalias , i8* noalias , ...)

declare i32 @fclose(%struct.FILE*)

define internal void @_ZN9regwayobj6createEP9regmngobj(%struct.regwayobj* %this, %struct.regmngobj* %regmngpin) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 23, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 23 )
	%tmp1 = getelementptr %struct.regwayobj* %this, i32 0, i32 5		; <%struct.regmngobj**> [#uses=1]
	store %struct.regmngobj* %regmngpin, %struct.regmngobj** %tmp1, align 8
	%tmp7 = getelementptr %struct.regmngobj* %regmngpin, i32 0, i32 18, i32 4		; <i32*> [#uses=2]
	%tmp8 = load i32* %tmp7, align 8		; <i32> [#uses=1]
	%tmp9 = add i32 %tmp8, 1		; <i32> [#uses=2]
	%tmp15 = getelementptr %struct.regwayobj* %this, i32 0, i32 1, i32 2		; <i32*> [#uses=1]
	store i32 %tmp9, i32* %tmp15, align 8
	%tmp18 = getelementptr %struct.regwayobj* %this, i32 0, i32 1, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp18, align 8
	%tmp28 = malloc %struct.regobj*, i32 %tmp9		; <%struct.regobj**> [#uses=1]
	%tmp33 = getelementptr %struct.regwayobj* %this, i32 0, i32 1, i32 0		; <%struct.regobj***> [#uses=1]
	store %struct.regobj** %tmp28, %struct.regobj*** %tmp33, align 8
	%tmp39 = load i32* %tmp7, align 8		; <i32> [#uses=1]
	%tmp40 = add i32 %tmp39, 1		; <i32> [#uses=2]
	%tmp47 = getelementptr %struct.regwayobj* %this, i32 0, i32 2, i32 2		; <i32*> [#uses=1]
	store i32 %tmp40, i32* %tmp47, align 8
	%tmp50 = getelementptr %struct.regwayobj* %this, i32 0, i32 2, i32 1		; <i32*> [#uses=1]
	store i32 0, i32* %tmp50, align 8
	%tmp62 = malloc %struct.regobj*, i32 %tmp40		; <%struct.regobj**> [#uses=1]
	%tmp68 = getelementptr %struct.regwayobj* %this, i32 0, i32 2, i32 0		; <%struct.regobj***> [#uses=1]
	store %struct.regobj** %tmp62, %struct.regobj*** %tmp68, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

declare i64 @time(i64*) nounwind 

define internal fastcc i8 @_ZN9regwayobj9createwayEP6regobjS1_RPS1_Ri(%struct.regobj* %rstart, %struct.regobj* %rfinish, %struct.regobj*** %wayar, i32* %waylength) zeroext  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=5]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=5]
	store i32 24, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 24 )
	%tmp3 = icmp eq %struct.regobj* %rstart, %rfinish		; <i1> [#uses=1]
	br i1 %tmp3, label %cond_true, label %cond_next

cond_true:		; preds = %entry
	%tmp5 = malloc %struct.regobj*		; <%struct.regobj**> [#uses=2]
	store %struct.regobj** %tmp5, %struct.regobj*** %wayar, align 8
	store %struct.regobj* %rstart, %struct.regobj** %tmp5, align 8
	store i32 1, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1

cond_next:		; preds = %entry
	store i8 0, i8* getelementptr (%struct.regwayobj* @regway, i32 0, i32 6), align 8
	store %struct.regobj* %rfinish, %struct.regobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 7), align 8
	store %struct.regobj* %rstart, %struct.regobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 8), align 8
	%tmp11.i = load %struct.regmngobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 5), align 8		; <%struct.regmngobj*> [#uses=4]
	%tmp3.i.i = getelementptr %struct.regmngobj* %tmp11.i, i32 0, i32 5		; <i32*> [#uses=4]
	%tmp4.i.i = load i32* %tmp3.i.i, align 8		; <i32> [#uses=1]
	%tmp5.i.i = add i32 %tmp4.i.i, 1		; <i32> [#uses=2]
	store i32 %tmp5.i.i, i32* %tmp3.i.i, align 8
	%tmp11.i.i = icmp eq i32 %tmp5.i.i, 1073741824		; <i1> [#uses=1]
	br i1 %tmp11.i.i, label %cond_true.i.i, label %bb33.i.i

cond_true.i.i:		; preds = %cond_next
	store i32 1, i32* %tmp3.i.i, align 8
	%tmp3650.i.i = getelementptr %struct.regmngobj* %tmp11.i, i32 0, i32 18, i32 4		; <i32*> [#uses=1]
	%tmp3751.i.i = load i32* %tmp3650.i.i, align 8		; <i32> [#uses=1]
	%tmp3953.i.i = icmp sgt i32 %tmp3751.i.i, 0		; <i1> [#uses=1]
	br i1 %tmp3953.i.i, label %bb.i.i, label %_ZN9regmngobj13getregfillnumEv.exit.i

bb.i.i:		; preds = %bb33.i.i, %cond_true.i.i
	%i.0.reg2mem.0.i.i = phi i32 [ 0, %cond_true.i.i ], [ %i.0.i.i, %bb33.i.i ]		; <i32> [#uses=2]
	%tmp21.i.i = getelementptr %struct.regmngobj* %tmp11.i, i32 0, i32 18, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp22.i.i = load %struct.regobj*** %tmp21.i.i, align 8		; <%struct.regobj**> [#uses=1]
	%tmp2324.i.i = sext i32 %i.0.reg2mem.0.i.i to i64		; <i64> [#uses=1]
	%tmp25.i.i = getelementptr %struct.regobj** %tmp22.i.i, i64 %tmp2324.i.i		; <%struct.regobj**> [#uses=1]
	%tmp29.i.i = load %struct.regobj** %tmp25.i.i, align 8		; <%struct.regobj*> [#uses=1]
	%tmp30.i.i = getelementptr %struct.regobj* %tmp29.i.i, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 0, i32* %tmp30.i.i, align 8
	%tmp32.i.i = add i32 %i.0.reg2mem.0.i.i, 1		; <i32> [#uses=1]
	br label %bb33.i.i

bb33.i.i:		; preds = %bb.i.i, %cond_next
	%i.0.i.i = phi i32 [ %tmp32.i.i, %bb.i.i ], [ 0, %cond_next ]		; <i32> [#uses=2]
	%tmp36.i.i = getelementptr %struct.regmngobj* %tmp11.i, i32 0, i32 18, i32 4		; <i32*> [#uses=1]
	%tmp37.i.i = load i32* %tmp36.i.i, align 8		; <i32> [#uses=1]
	%tmp39.i.i = icmp sgt i32 %tmp37.i.i, %i.0.i.i		; <i1> [#uses=1]
	br i1 %tmp39.i.i, label %bb.i.i, label %_ZN9regmngobj13getregfillnumEv.exit.i

_ZN9regmngobj13getregfillnumEv.exit.i:		; preds = %bb33.i.i, %cond_true.i.i
	%tmp45.i.i = load i32* %tmp3.i.i, align 8		; <i32> [#uses=2]
	store i32 %tmp45.i.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 4), align 8
	%tmp19.i = getelementptr %struct.regobj* %rstart, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 %tmp45.i.i, i32* %tmp19.i, align 8
	%tmp21.i = getelementptr %struct.regobj* %rstart, i32 0, i32 8		; <i32*> [#uses=1]
	store i32 0, i32* %tmp21.i, align 8
	store i32 0, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8
	%tmp35.i = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 2), align 8		; <i32> [#uses=3]
	%tmp36.i = icmp eq i32 %tmp35.i, 0		; <i1> [#uses=1]
	br i1 %tmp36.i, label %cond_true.i, label %cond_next81.i

cond_true.i:		; preds = %_ZN9regmngobj13getregfillnumEv.exit.i
	%tmp44.i = shl i32 %tmp35.i, 1		; <i32> [#uses=2]
	%tmp52.i = malloc %struct.regobj*, i32 %tmp44.i		; <%struct.regobj**> [#uses=2]
	%tmpcast.i = bitcast %struct.regobj** %tmp52.i to i8*		; <i8*> [#uses=1]
	%tmp6162.i = sext i32 %tmp35.i to i64		; <i64> [#uses=1]
	%tmp63.i = shl i64 %tmp6162.i, 3		; <i64> [#uses=1]
	%tmp66.i = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp6669.i = bitcast %struct.regobj** %tmp66.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp6669.i, i64 %tmp63.i, i32 8 )
	%tmp72.i = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp72.i
	store %struct.regobj** %tmp52.i, %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8
	store i32 %tmp44.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 2), align 8
	br label %cond_next81.i

cond_next81.i:		; preds = %cond_true.i, %_ZN9regmngobj13getregfillnumEv.exit.i
	%tmp84.i = load %struct.regobj*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 0), align 8		; <%struct.regobj**> [#uses=1]
	%tmp87.i = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp8790.i = sext i32 %tmp87.i to i64		; <i64> [#uses=1]
	%tmp91.i = getelementptr %struct.regobj** %tmp84.i, i64 %tmp8790.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %rstart, %struct.regobj** %tmp91.i, align 8
	%tmp94.i = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8		; <i32> [#uses=1]
	%tmp95.i = add i32 %tmp94.i, 1		; <i32> [#uses=1]
	store i32 %tmp95.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), align 8
	store i32 1, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 3), align 8
	br label %cond_next139.i

bb100.i:		; preds = %cond_next139.i
	%tmp103.i = icmp eq i8 %flodd.0.reg2mem.0.i, 0		; <i1> [#uses=1]
	br i1 %tmp103.i, label %cond_true106.i, label %cond_false.i

cond_true106.i:		; preds = %bb100.i
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 123, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_( %"struct.flexarray<regobj*>"* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1), %"struct.flexarray<regobj*>"* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2) )
	br label %cond_next125.i

cond_false.i:		; preds = %bb100.i
	store i32 2, i32* @cg_caller_call_site_var, align 4
	store i32 24, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 123, i32* @cg_caller_id_var, align 4
	tail call fastcc void @_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_( %"struct.flexarray<regobj*>"* getelementptr (%struct.regwayobj* @regway, i32 0, i32 2), %"struct.flexarray<regobj*>"* getelementptr (%struct.regwayobj* @regway, i32 0, i32 1) )
	br label %cond_next125.i

cond_next125.i:		; preds = %cond_false.i, %cond_true106.i
	%newflodd.0.i = phi i8 [ 0, %cond_false.i ], [ 1, %cond_true106.i ]		; <i8> [#uses=1]
	%boundl.0.in.i = phi i32* [ getelementptr (%struct.regwayobj* @regway, i32 0, i32 1, i32 1), %cond_false.i ], [ getelementptr (%struct.regwayobj* @regway, i32 0, i32 2, i32 1), %cond_true106.i ]		; <i32*> [#uses=1]
	%boundl.0.i = load i32* %boundl.0.in.i		; <i32> [#uses=1]
	%tmp129.i = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 3), align 8		; <i32> [#uses=1]
	%tmp130.i = add i32 %tmp129.i, 1		; <i32> [#uses=3]
	store i32 %tmp130.i, i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 3), align 8
	%phitmp.i = icmp eq i32 %boundl.0.i, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %phitmp.i, label %_ZN9regwayobj4fillEP6regobjS1_.exit, label %cond_next139.i

cond_next139.i:		; preds = %cond_next125.i, %cond_next81.i
	%tmp6.i.rle9 = phi i32 [ %tmp130.i, %cond_next125.i ], [ 1, %cond_next81.i ]		; <i32> [#uses=1]
	%flodd.0.reg2mem.0.i = phi i8 [ 0, %cond_next81.i ], [ %newflodd.0.i, %cond_next125.i ]		; <i8> [#uses=1]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 123, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 123 )
	%tmp142.i = load i8* getelementptr (%struct.regwayobj* @regway, i32 0, i32 6), align 8		; <i8> [#uses=1]
	%tmp144.i = icmp eq i8 %tmp142.i, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp144.i, label %bb100.i, label %_ZN9regwayobj4fillEP6regobjS1_.exit

_ZN9regwayobj4fillEP6regobjS1_.exit:		; preds = %cond_next139.i, %cond_next125.i
	%tmp6.i.rle = phi i32 [ %tmp130.i, %cond_next125.i ], [ %tmp6.i.rle9, %cond_next139.i ]		; <i32> [#uses=4]
	%tmp150.i = load i8* getelementptr (%struct.regwayobj* @regway, i32 0, i32 6), align 8		; <i8> [#uses=1]
	%toBool18 = icmp eq i8 %tmp150.i, 0		; <i1> [#uses=1]
	br i1 %toBool18, label %cond_true22, label %cond_next26

cond_true22:		; preds = %_ZN9regwayobj4fillEP6regobjS1_.exit
	store %struct.regobj** null, %struct.regobj*** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

cond_next26:		; preds = %_ZN9regwayobj4fillEP6regobjS1_.exit
	%tmp10.i = malloc %struct.regobj*, i32 %tmp6.i.rle		; <%struct.regobj**> [#uses=5]
	store %struct.regobj** %tmp10.i, %struct.regobj*** %wayar, align 8
	%tmp16.i = add i32 %tmp6.i.rle, -1		; <i32> [#uses=3]
	%tmp1617.i = sext i32 %tmp16.i to i64		; <i64> [#uses=1]
	%tmp18.i = getelementptr %struct.regobj** %tmp10.i, i64 %tmp1617.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %rfinish, %struct.regobj** %tmp18.i, align 8
	%tmp200223.i = icmp sgt i32 %tmp16.i, 0		; <i1> [#uses=1]
	br i1 %tmp200223.i, label %bb.preheader.i, label %bb203.i

bb.preheader.i:		; preds = %cond_next26
	%tmp79.i = getelementptr %struct.regobj* %rfinish, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	%tmp95.i1 = getelementptr %struct.regobj* %rfinish, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	br label %bb.i

bb.i:		; preds = %cond_next188.i, %bb.preheader.i
	%tmp190.rle245.i = phi %struct.regobj** [ %tmp10.i, %bb.preheader.i ], [ %tmp23.i, %cond_next188.i ]		; <%struct.regobj**> [#uses=1]
	%indvar.i = phi i32 [ 0, %bb.preheader.i ], [ %indvar.next239.i, %cond_next188.i ]		; <i32> [#uses=3]
	%tmp23.reg2mem.0.i = phi %struct.regobj** [ %tmp10.i, %bb.preheader.i ], [ %tmp23.i, %cond_next188.i ]		; <%struct.regobj**> [#uses=1]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=3]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=3]
	store i32 124, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 124 )
	%i.0.reg2mem.0.i = sub i32 %tmp16.i, %indvar.i		; <i32> [#uses=2]
	%i.0.in.reg2mem.0.i = sub i32 %tmp6.i.rle, %indvar.i		; <i32> [#uses=2]
	%tmp2425.i = sext i32 %i.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp26.i = getelementptr %struct.regobj** %tmp23.reg2mem.0.i, i64 %tmp2425.i		; <%struct.regobj**> [#uses=1]
	%tmp27.i = load %struct.regobj** %tmp26.i, align 8		; <%struct.regobj*> [#uses=2]
	%tmp175235.i = getelementptr %struct.regobj* %tmp27.i, i32 0, i32 9, i32 1		; <i32*> [#uses=1]
	%tmp176236.i = load i32* %tmp175235.i, align 8		; <i32> [#uses=2]
	%tmp178238.i = icmp sgt i32 %tmp176236.i, 0		; <i1> [#uses=1]
	br i1 %tmp178238.i, label %bb28.preheader.i, label %bb181.i

bb28.preheader.i:		; preds = %bb.i
	%tmp35.i2 = getelementptr %struct.regobj* %tmp27.i, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp36.i3 = load %struct.regobj*** %tmp35.i2, align 8		; <%struct.regobj**> [#uses=1]
	%tmp49.i = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 4), align 8		; <i32> [#uses=1]
	%tmp56.i = add i32 %i.0.in.reg2mem.0.i, -2		; <i32> [#uses=1]
	br label %bb28.i

bb28.i:		; preds = %bb172.i, %bb28.preheader.i
	%j.0.reg2mem.0.i = phi i32 [ 0, %bb28.preheader.i ], [ %tmp171.i, %bb172.i ]		; <i32> [#uses=2]
	%minregionp.1.reg2mem.0.i = phi %struct.regobj* [ null, %bb28.preheader.i ], [ %minregionp.0.i, %bb172.i ]		; <%struct.regobj*> [#uses=4]
	%mindist2.1.reg2mem.0.i = phi float [ 1.000000e+10, %bb28.preheader.i ], [ %mindist2.0.i, %bb172.i ]		; <float> [#uses=4]
	%val33 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val44 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 125, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val33, i32 %val44, i32 125 )
	%tmp3738.i = sext i32 %j.0.reg2mem.0.i to i64		; <i64> [#uses=1]
	%tmp39.i = getelementptr %struct.regobj** %tmp36.i3, i64 %tmp3738.i		; <%struct.regobj**> [#uses=1]
	%tmp43.i = load %struct.regobj** %tmp39.i, align 8		; <%struct.regobj*> [#uses=6]
	%tmp45.i = getelementptr %struct.regobj* %tmp43.i, i32 0, i32 7		; <i32*> [#uses=1]
	%tmp46.i = load i32* %tmp45.i, align 8		; <i32> [#uses=1]
	%tmp50.i = icmp eq i32 %tmp46.i, %tmp49.i		; <i1> [#uses=1]
	br i1 %tmp50.i, label %cond_true.i4, label %bb172.i

cond_true.i4:		; preds = %bb28.i
	%tmp53.i = getelementptr %struct.regobj* %tmp43.i, i32 0, i32 8		; <i32*> [#uses=1]
	%tmp54.i = load i32* %tmp53.i, align 8		; <i32> [#uses=1]
	%tmp57.i = icmp eq i32 %tmp54.i, %tmp56.i		; <i1> [#uses=1]
	br i1 %tmp57.i, label %cond_true60.i, label %bb172.i

cond_true60.i:		; preds = %cond_true.i4
	%tmp62.i = icmp eq %struct.regobj* %minregionp.1.reg2mem.0.i, null		; <i1> [#uses=1]
	%tmp74.i = getelementptr %struct.regobj* %tmp43.i, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	%tmp75.i = load i32* %tmp74.i, align 8		; <i32> [#uses=1]
	%tmp80.i = load i32* %tmp79.i, align 8		; <i32> [#uses=1]
	%tmp81.i = sub i32 %tmp75.i, %tmp80.i		; <i32> [#uses=1]
	%tmp8182.i = sitofp i32 %tmp81.i to float		; <float> [#uses=2]
	%tmp86.i = mul float %tmp8182.i, %tmp8182.i		; <float> [#uses=1]
	%tmp91.i5 = getelementptr %struct.regobj* %tmp43.i, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	%tmp92.i = load i32* %tmp91.i5, align 8		; <i32> [#uses=1]
	%tmp96.i = load i32* %tmp95.i1, align 8		; <i32> [#uses=1]
	%tmp97.i = sub i32 %tmp92.i, %tmp96.i		; <i32> [#uses=1]
	%tmp9798.i = sitofp i32 %tmp97.i to float		; <float> [#uses=2]
	%tmp103.i6 = mul float %tmp9798.i, %tmp9798.i		; <float> [#uses=1]
	%tmp108.i = add float %tmp86.i, %tmp103.i6		; <float> [#uses=3]
	br i1 %tmp62.i, label %bb172.i, label %cond_false.i7

cond_false.i7:		; preds = %cond_true60.i
	%tmp161.i = fcmp olt float %tmp108.i, %mindist2.1.reg2mem.0.i		; <i1> [#uses=1]
	br i1 %tmp161.i, label %cond_true164.i, label %bb172.i

cond_true164.i:		; preds = %cond_false.i7
	br label %bb172.i

bb172.i:		; preds = %cond_true164.i, %cond_false.i7, %cond_true60.i, %cond_true.i4, %bb28.i
	%mindist2.0.i = phi float [ %tmp108.i, %cond_true164.i ], [ %mindist2.1.reg2mem.0.i, %bb28.i ], [ %mindist2.1.reg2mem.0.i, %cond_true.i4 ], [ %tmp108.i, %cond_true60.i ], [ %mindist2.1.reg2mem.0.i, %cond_false.i7 ]		; <float> [#uses=1]
	%minregionp.0.i = phi %struct.regobj* [ %tmp43.i, %cond_true164.i ], [ %minregionp.1.reg2mem.0.i, %bb28.i ], [ %minregionp.1.reg2mem.0.i, %cond_true.i4 ], [ %tmp43.i, %cond_true60.i ], [ %minregionp.1.reg2mem.0.i, %cond_false.i7 ]		; <%struct.regobj*> [#uses=2]
	%tmp171.i = add i32 %j.0.reg2mem.0.i, 1		; <i32> [#uses=2]
	%tmp178.i = icmp sgt i32 %tmp176236.i, %tmp171.i		; <i1> [#uses=1]
	store i32 %val44, i32* @cg_caller_call_site_var, align 4
	store i32 %val33, i32* @cg_caller_id_var, align 4
	br i1 %tmp178.i, label %bb28.i, label %bb181.i

bb181.i:		; preds = %bb172.i, %bb.i
	%minregionp.1.reg2mem.1.i = phi %struct.regobj* [ null, %bb.i ], [ %minregionp.0.i, %bb172.i ]		; <%struct.regobj*> [#uses=2]
	%tmp183.i = icmp eq %struct.regobj* %minregionp.1.reg2mem.1.i, null		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp183.i, label %_ZN9regwayobj6getwayEP6regobjRPS1_.exit, label %cond_next188.i

cond_next188.i:		; preds = %bb181.i
	%tmp192.i = add i32 %i.0.in.reg2mem.0.i, -2		; <i32> [#uses=1]
	%tmp192193.i = sext i32 %tmp192.i to i64		; <i64> [#uses=1]
	%tmp194.i = getelementptr %struct.regobj** %tmp190.rle245.i, i64 %tmp192193.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %minregionp.1.reg2mem.1.i, %struct.regobj** %tmp194.i, align 8
	%i.0.i = add i32 %i.0.reg2mem.0.i, -1		; <i32> [#uses=1]
	%tmp200.i = icmp sgt i32 %i.0.i, 0		; <i1> [#uses=1]
	%tmp23.i = load %struct.regobj*** %wayar, align 8		; <%struct.regobj**> [#uses=3]
	%indvar.next239.i = add i32 %indvar.i, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp200.i, label %bb.i, label %bb203.i

bb203.i:		; preds = %cond_next188.i, %cond_next26
	%tmp23.reg2mem.1.i = phi %struct.regobj** [ %tmp10.i, %cond_next26 ], [ %tmp23.i, %cond_next188.i ]		; <%struct.regobj**> [#uses=1]
	%tmp208.i = load %struct.regobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 8), align 8		; <%struct.regobj*> [#uses=1]
	store %struct.regobj* %tmp208.i, %struct.regobj** %tmp23.reg2mem.1.i, align 8
	br label %_ZN9regwayobj6getwayEP6regobjRPS1_.exit

_ZN9regwayobj6getwayEP6regobjRPS1_.exit:		; preds = %bb203.i, %bb181.i
	%tmp308 = phi i32 [ %tmp6.i.rle, %bb203.i ], [ -1, %bb181.i ]		; <i32> [#uses=2]
	store i32 %tmp308, i32* %waylength, align 4
	%tmp35 = icmp eq i32 %tmp308, -1		; <i1> [#uses=1]
	br i1 %tmp35, label %cond_true38, label %UnifiedReturnBlock

cond_true38:		; preds = %_ZN9regwayobj6getwayEP6regobjRPS1_.exit
	%tmp40 = load %struct.regobj*** %wayar, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp40
	store %struct.regobj** null, %struct.regobj*** %wayar, align 8
	store i32 0, i32* %waylength, align 4
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 0

UnifiedReturnBlock:		; preds = %_ZN9regwayobj6getwayEP6regobjRPS1_.exit
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 1
}

define internal void @_ZN9regwayobj7destroyEv(%struct.regwayobj* %this) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 25, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 25 )
	%tmp4 = getelementptr %struct.regwayobj* %this, i32 0, i32 1, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp5 = load %struct.regobj*** %tmp4, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp5
	%tmp12 = getelementptr %struct.regwayobj* %this, i32 0, i32 2, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp13 = load %struct.regobj*** %tmp12, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp13
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc void @_ZN6regobj10makebound2ER9flexarrayI6pointtES3_(%struct.regobj* %this, %struct.boundart* %b1arp, %struct.boundart* %b2arp) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 26, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 26 )
	%tmp8 = getelementptr %struct.boundart* %b2arp, i32 0, i32 1		; <i32*> [#uses=5]
	store i32 0, i32* %tmp8, align 8
	%tmp178190 = getelementptr %struct.boundart* %b1arp, i32 0, i32 1		; <i32*> [#uses=2]
	%tmp179191 = load i32* %tmp178190, align 8		; <i32> [#uses=1]
	%tmp181193 = icmp sgt i32 %tmp179191, 0		; <i1> [#uses=1]
	br i1 %tmp181193, label %bb.preheader, label %return

bb.preheader:		; preds = %entry
	%tmp14 = getelementptr %struct.boundart* %b1arp, i32 0, i32 0		; <%struct.pointt**> [#uses=1]
	%tmp86 = getelementptr %struct.regobj* %this, i32 0, i32 3		; <%struct.regmngobj**> [#uses=3]
	%tmp43.i = getelementptr %struct.regobj* %this, i32 0, i32 5, i32 0		; <i32*> [#uses=1]
	%tmp56.i = getelementptr %struct.regobj* %this, i32 0, i32 5, i32 1		; <i32*> [#uses=1]
	%tmp102.i = getelementptr %struct.boundart* %b2arp, i32 0, i32 2		; <i32*> [#uses=2]
	%tmp136.i = getelementptr %struct.boundart* %b2arp, i32 0, i32 0		; <%struct.pointt**> [#uses=4]
	%tmp206.i = getelementptr %struct.regobj* %this, i32 0, i32 4		; <i32*> [#uses=2]
	br label %bb

bb:		; preds = %bb176, %bb.preheader
	%j.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp175, %bb176 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 126, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 126 )
	%tmp15 = load %struct.pointt** %tmp14, align 8		; <%struct.pointt*> [#uses=2]
	%tmp1617 = sext i32 %j.0.reg2mem.0 to i64		; <i64> [#uses=2]
	%tmp22 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 0		; <i32*> [#uses=1]
	%tmp23 = load i32* %tmp22, align 4		; <i32> [#uses=2]
	%tmp24 = add i32 %tmp23, -1		; <i32> [#uses=2]
	%tmp39 = getelementptr %struct.pointt* %tmp15, i64 %tmp1617, i32 1		; <i32*> [#uses=1]
	%tmp40 = load i32* %tmp39, align 4		; <i32> [#uses=2]
	%tmp41 = add i32 %tmp40, -1		; <i32> [#uses=2]
	%tmp58 = add i32 %tmp23, 1		; <i32> [#uses=2]
	%tmp75 = add i32 %tmp40, 1		; <i32> [#uses=2]
	%tmp77 = icmp slt i32 %tmp24, 0		; <i1> [#uses=1]
	%x1.0 = select i1 %tmp77, i32 0, i32 %tmp24		; <i32> [#uses=2]
	%tmp80 = icmp slt i32 %tmp41, 0		; <i1> [#uses=1]
	%y1.0 = select i1 %tmp80, i32 0, i32 %tmp41		; <i32> [#uses=3]
	%tmp87 = load %struct.regmngobj** %tmp86, align 8		; <%struct.regmngobj*> [#uses=2]
	%tmp88 = getelementptr %struct.regmngobj* %tmp87, i32 0, i32 12		; <i32*> [#uses=1]
	%tmp89 = load i32* %tmp88, align 8		; <i32> [#uses=2]
	%tmp91 = icmp slt i32 %tmp89, %tmp58		; <i1> [#uses=1]
	%x2.0 = select i1 %tmp91, i32 %tmp89, i32 %tmp58		; <i32> [#uses=2]
	%tmp104 = getelementptr %struct.regmngobj* %tmp87, i32 0, i32 13		; <i32*> [#uses=1]
	%tmp105 = load i32* %tmp104, align 8		; <i32> [#uses=3]
	%tmp107 = icmp slt i32 %tmp105, %tmp75		; <i1> [#uses=1]
	br i1 %tmp107, label %cond_true110, label %bb167

cond_true110:		; preds = %bb
	%tmp170200 = icmp sgt i32 %y1.0, %tmp105		; <i1> [#uses=1]
	br i1 %tmp170200, label %bb176, label %bb158.preheader

bb158.preheader:		; preds = %bb167, %cond_true110
	%y2.0.reg2mem.0.ph = phi i32 [ %tmp105, %cond_true110 ], [ %y2.0, %bb167 ]		; <i32> [#uses=1]
	%y.0.reg2mem.0.ph = phi i32 [ %y1.0, %cond_true110 ], [ %y.0, %bb167 ]		; <i32> [#uses=5]
	%tmp161202 = icmp sgt i32 %x1.0, %x2.0		; <i1> [#uses=1]
	br i1 %tmp161202, label %bb164, label %bb120

bb120:		; preds = %cond_next155, %bb158.preheader
	%indvar = phi i32 [ %indvar.next, %cond_next155 ], [ 0, %bb158.preheader ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 127, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 127 )
	%x.0201 = add i32 %indvar, %x1.0		; <i32> [#uses=5]
	%tmp123 = load %struct.regmngobj** %tmp86, align 8		; <%struct.regmngobj*> [#uses=5]
	%tmp131 = getelementptr %struct.regmngobj* %tmp123, i32 0, i32 6		; <%struct.regobj***> [#uses=1]
	%tmp132 = load %struct.regobj*** %tmp131, align 8		; <%struct.regobj**> [#uses=1]
	%tmp134 = getelementptr %struct.regmngobj* %tmp123, i32 0, i32 16		; <i32*> [#uses=1]
	%tmp135 = load i32* %tmp134, align 8		; <i32> [#uses=1]
	%tmp137 = mul i32 %tmp135, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp139 = add i32 %tmp137, %x.0201		; <i32> [#uses=1]
	%tmp139140 = sext i32 %tmp139 to i64		; <i64> [#uses=2]
	%tmp141 = getelementptr %struct.regobj** %tmp132, i64 %tmp139140		; <%struct.regobj**> [#uses=1]
	%tmp145 = load %struct.regobj** %tmp141, align 8		; <%struct.regobj*> [#uses=1]
	%tmp146 = icmp eq %struct.regobj* %tmp145, null		; <i1> [#uses=1]
	br i1 %tmp146, label %cond_true150, label %cond_next155

cond_true150:		; preds = %bb120
	%tmp19.i = getelementptr %struct.regmngobj* %tmp123, i32 0, i32 7		; <i8**> [#uses=1]
	%tmp20.i = load i8** %tmp19.i, align 8		; <i8*> [#uses=1]
	%tmp29.i = getelementptr i8* %tmp20.i, i64 %tmp139140		; <i8*> [#uses=1]
	%tmp30.i = load i8* %tmp29.i, align 1		; <i8> [#uses=1]
	%tmp33343537.i = zext i8 %tmp30.i to i64		; <i64> [#uses=1]
	%tmp38.i = getelementptr %struct.regmngobj* %tmp123, i32 0, i32 8, i64 %tmp33343537.i		; <i8*> [#uses=1]
	%tmp39.i = load i8* %tmp38.i, align 1		; <i8> [#uses=1]
	%toBool.i = icmp eq i8 %tmp39.i, 0		; <i1> [#uses=1]
	br i1 %toBool.i, label %cond_next155, label %cond_true.i

cond_true.i:		; preds = %cond_true150
	%tmp44.i = load i32* %tmp43.i, align 8		; <i32> [#uses=1]
	%tmp46.i = sub i32 %x.0201, %tmp44.i		; <i32> [#uses=2]
	%tmp51.i = mul i32 %tmp46.i, %tmp46.i		; <i32> [#uses=1]
	%tmp57.i = load i32* %tmp56.i, align 8		; <i32> [#uses=1]
	%tmp59.i = sub i32 %y.0.reg2mem.0.ph, %tmp57.i		; <i32> [#uses=2]
	%tmp64.i = mul i32 %tmp59.i, %tmp59.i		; <i32> [#uses=1]
	%tmp69.i = add i32 %tmp64.i, %tmp51.i		; <i32> [#uses=1]
	%tmp6970.i = sitofp i32 %tmp69.i to float		; <float> [#uses=1]
	%tmp74.i = add float %tmp6970.i, 5.000000e-01		; <float> [#uses=1]
	%tmp7475.i = fptosi float %tmp74.i to i32		; <i32> [#uses=1]
	%tmp81.i = getelementptr %struct.regmngobj* %tmp123, i32 0, i32 10		; <i32*> [#uses=1]
	%tmp82.i = load i32* %tmp81.i, align 8		; <i32> [#uses=1]
	%tmp84.i = icmp sgt i32 %tmp7475.i, %tmp82.i		; <i1> [#uses=1]
	br i1 %tmp84.i, label %cond_next155, label %cond_true88.i

cond_true88.i:		; preds = %cond_true.i
	%tmp100.i = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp103.i = load i32* %tmp102.i, align 8		; <i32> [#uses=3]
	%tmp104.i = icmp eq i32 %tmp100.i, %tmp103.i		; <i1> [#uses=1]
	br i1 %tmp104.i, label %cond_true107.i, label %cond_next152.i

cond_true107.i:		; preds = %cond_true88.i
	%tmp114.i = shl i32 %tmp103.i, 1		; <i32> [#uses=2]
	%tmp122.i = malloc %struct.pointt, i32 %tmp114.i		; <%struct.pointt*> [#uses=2]
	%tmpcast.i = bitcast %struct.pointt* %tmp122.i to i8*		; <i8*> [#uses=1]
	%tmp132133.i = sext i32 %tmp103.i to i64		; <i64> [#uses=1]
	%tmp134.i = shl i64 %tmp132133.i, 3		; <i64> [#uses=1]
	%tmp137.i = load %struct.pointt** %tmp136.i, align 8		; <%struct.pointt*> [#uses=1]
	%tmp137140.i = bitcast %struct.pointt* %tmp137.i to i8*		; <i8*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 26, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 126, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 127, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast.i, i8* %tmp137140.i, i64 %tmp134.i, i32 4 ) nounwind 
	%tmp143.i = load %struct.pointt** %tmp136.i, align 8		; <%struct.pointt*> [#uses=1]
	free %struct.pointt* %tmp143.i
	store %struct.pointt* %tmp122.i, %struct.pointt** %tmp136.i, align 8
	store i32 %tmp114.i, i32* %tmp102.i, align 8
	br label %cond_next152.i

cond_next152.i:		; preds = %cond_true107.i, %cond_true88.i
	%tmp155.i = load %struct.pointt** %tmp136.i, align 8		; <%struct.pointt*> [#uses=2]
	%tmp158.i = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp158166.i = sext i32 %tmp158.i to i64		; <i64> [#uses=2]
	%tmp168.i = getelementptr %struct.pointt* %tmp155.i, i64 %tmp158166.i, i32 0		; <i32*> [#uses=1]
	store i32 %x.0201, i32* %tmp168.i, align 4
	%tmp171.i = getelementptr %struct.pointt* %tmp155.i, i64 %tmp158166.i, i32 1		; <i32*> [#uses=1]
	store i32 %y.0.reg2mem.0.ph, i32* %tmp171.i, align 4
	%tmp176.i = load i32* %tmp8, align 8		; <i32> [#uses=1]
	%tmp177.i = add i32 %tmp176.i, 1		; <i32> [#uses=1]
	store i32 %tmp177.i, i32* %tmp8, align 8
	%tmp182.i = load %struct.regmngobj** %tmp86, align 8		; <%struct.regmngobj*> [#uses=2]
	%tmp190.i = getelementptr %struct.regmngobj* %tmp182.i, i32 0, i32 6		; <%struct.regobj***> [#uses=1]
	%tmp191.i = load %struct.regobj*** %tmp190.i, align 8		; <%struct.regobj**> [#uses=1]
	%tmp193.i = getelementptr %struct.regmngobj* %tmp182.i, i32 0, i32 16		; <i32*> [#uses=1]
	%tmp194.i = load i32* %tmp193.i, align 8		; <i32> [#uses=1]
	%tmp196.i = mul i32 %tmp194.i, %y.0.reg2mem.0.ph		; <i32> [#uses=1]
	%tmp198.i = add i32 %tmp196.i, %x.0201		; <i32> [#uses=1]
	%tmp198199.i = sext i32 %tmp198.i to i64		; <i64> [#uses=1]
	%tmp200.i = getelementptr %struct.regobj** %tmp191.i, i64 %tmp198199.i		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %this, %struct.regobj** %tmp200.i, align 8
	%tmp207.i = load i32* %tmp206.i, align 8		; <i32> [#uses=1]
	%tmp208.i = add i32 %tmp207.i, 1		; <i32> [#uses=1]
	store i32 %tmp208.i, i32* %tmp206.i, align 8
	br label %cond_next155

cond_next155:		; preds = %cond_next152.i, %cond_true.i, %cond_true150, %bb120
	%tmp157 = add i32 %x.0201, 1		; <i32> [#uses=1]
	%tmp161 = icmp sgt i32 %tmp157, %x2.0		; <i1> [#uses=1]
	%indvar.next = add i32 %indvar, 1		; <i32> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp161, label %bb164, label %bb120

bb164:		; preds = %cond_next155, %bb158.preheader
	%tmp166 = add i32 %y.0.reg2mem.0.ph, 1		; <i32> [#uses=1]
	br label %bb167

bb167:		; preds = %bb164, %bb
	%y2.0 = phi i32 [ %y2.0.reg2mem.0.ph, %bb164 ], [ %tmp75, %bb ]		; <i32> [#uses=2]
	%y.0 = phi i32 [ %tmp166, %bb164 ], [ %y1.0, %bb ]		; <i32> [#uses=2]
	%tmp170 = icmp sgt i32 %y.0, %y2.0		; <i1> [#uses=1]
	br i1 %tmp170, label %bb176, label %bb158.preheader

bb176:		; preds = %bb167, %cond_true110
	%tmp175 = add i32 %j.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp179 = load i32* %tmp178190, align 8		; <i32> [#uses=1]
	%tmp181 = icmp sgt i32 %tmp179, %tmp175		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp181, label %bb, label %return

return:		; preds = %bb176, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal i8 @_ZN9regwayobj12isaddtoboundEP6regobjS1_(%struct.regwayobj* %this, %struct.regobj* %initialregionp, %struct.regobj* %regionp) zeroext nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 27, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 27 )
	%tmp2 = getelementptr %struct.regobj* %regionp, i32 0, i32 7		; <i32*> [#uses=1]
	%tmp3 = load i32* %tmp2, align 8		; <i32> [#uses=1]
	%tmp5 = getelementptr %struct.regwayobj* %this, i32 0, i32 4		; <i32*> [#uses=1]
	%tmp6 = load i32* %tmp5, align 8		; <i32> [#uses=1]
	%not.tmp7 = icmp ne i32 %tmp3, %tmp6		; <i1> [#uses=1]
	%retval = zext i1 %not.tmp7 to i8		; <i8> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i8 %retval
}

define internal fastcc void @_ZN9regwayobj10makebound2ER9flexarrayIP6regobjES4_(%"struct.flexarray<regobj*>"* %b1arp, %"struct.flexarray<regobj*>"* %b2arp) {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 28, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 28 )
	%tmp5 = getelementptr %"struct.flexarray<regobj*>"* %b2arp, i32 0, i32 1		; <i32*> [#uses=5]
	store i32 0, i32* %tmp5, align 8
	%tmp163173 = getelementptr %"struct.flexarray<regobj*>"* %b1arp, i32 0, i32 1		; <i32*> [#uses=2]
	%tmp164174 = load i32* %tmp163173, align 8		; <i32> [#uses=1]
	%tmp166176 = icmp sgt i32 %tmp164174, 0		; <i1> [#uses=1]
	br i1 %tmp166176, label %bb.preheader, label %return

bb.preheader:		; preds = %entry
	%tmp11 = getelementptr %"struct.flexarray<regobj*>"* %b1arp, i32 0, i32 0		; <%struct.regobj***> [#uses=1]
	%tmp78 = getelementptr %"struct.flexarray<regobj*>"* %b2arp, i32 0, i32 2		; <i32*> [#uses=2]
	%tmp112 = getelementptr %"struct.flexarray<regobj*>"* %b2arp, i32 0, i32 0		; <%struct.regobj***> [#uses=4]
	br label %bb

bb:		; preds = %bb161, %bb.preheader
	%j.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp160, %bb161 ]		; <i32> [#uses=2]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 128, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 128 )
	%tmp12 = load %struct.regobj*** %tmp11, align 8		; <%struct.regobj**> [#uses=1]
	%tmp1314 = sext i32 %j.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp15 = getelementptr %struct.regobj** %tmp12, i64 %tmp1314		; <%struct.regobj**> [#uses=1]
	%tmp19 = load %struct.regobj** %tmp15, align 8		; <%struct.regobj*> [#uses=3]
	%tmp152179 = getelementptr %struct.regobj* %tmp19, i32 0, i32 9, i32 1		; <i32*> [#uses=2]
	%tmp153180 = load i32* %tmp152179, align 8		; <i32> [#uses=1]
	%tmp155182 = icmp sgt i32 %tmp153180, 0		; <i1> [#uses=1]
	br i1 %tmp155182, label %bb20.preheader, label %bb161

bb20.preheader:		; preds = %bb
	%tmp28 = getelementptr %struct.regobj* %tmp19, i32 0, i32 9, i32 0		; <%struct.regobj***> [#uses=1]
	br label %bb20

bb20:		; preds = %bb149, %bb20.preheader
	%i.0.reg2mem.0 = phi i32 [ 0, %bb20.preheader ], [ %tmp148, %bb149 ]		; <i32> [#uses=2]
	%val31 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=2]
	%val42 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=2]
	store i32 129, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val31, i32 %val42, i32 129 )
	%tmp29 = load %struct.regobj*** %tmp28, align 8		; <%struct.regobj**> [#uses=1]
	%tmp3031 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp32 = getelementptr %struct.regobj** %tmp29, i64 %tmp3031		; <%struct.regobj**> [#uses=1]
	%tmp36 = load %struct.regobj** %tmp32, align 8		; <%struct.regobj*> [#uses=5]
	%tmp39 = load i32 (...)*** getelementptr (%struct.regwayobj* @regway, i32 0, i32 0), align 32		; <i32 (...)**> [#uses=1]
	%tmp41 = load i32 (...)** %tmp39, align 8		; <i32 (...)*> [#uses=1]
	%tmp4142 = bitcast i32 (...)* %tmp41 to i8 (%struct.regwayobj*, %struct.regobj*, %struct.regobj*)*		; <i8 (%struct.regwayobj*, %struct.regobj*, %struct.regobj*)*> [#uses=1]
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 28, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 128, i32* @cg_caller_id_var, align 4
	store i32 0, i32* @cg_caller_call_site_var, align 4
	store i32 129, i32* @cg_caller_id_var, align 4
	%tmp46 = tail call i8 %tmp4142( %struct.regwayobj* @regway, %struct.regobj* %tmp19, %struct.regobj* %tmp36 ) zeroext 		; <i8> [#uses=1]
	%toBool = icmp eq i8 %tmp46, 0		; <i1> [#uses=1]
	br i1 %toBool, label %bb149, label %cond_true

cond_true:		; preds = %bb20
	%tmp55 = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 4), align 8		; <i32> [#uses=1]
	%tmp56 = getelementptr %struct.regobj* %tmp36, i32 0, i32 7		; <i32*> [#uses=1]
	store i32 %tmp55, i32* %tmp56, align 8
	%tmp60 = load i32* getelementptr (%struct.regwayobj* @regway, i32 0, i32 3), align 8		; <i32> [#uses=1]
	%tmp61 = getelementptr %struct.regobj* %tmp36, i32 0, i32 8		; <i32*> [#uses=1]
	store i32 %tmp60, i32* %tmp61, align 8
	%tmp64 = load %struct.regobj** getelementptr (%struct.regwayobj* @regway, i32 0, i32 7), align 8		; <%struct.regobj*> [#uses=1]
	%tmp66 = icmp eq %struct.regobj* %tmp64, %tmp36		; <i1> [#uses=1]
	br i1 %tmp66, label %cond_true69, label %cond_next

cond_true69:		; preds = %cond_true
	store i8 1, i8* getelementptr (%struct.regwayobj* @regway, i32 0, i32 6), align 8
	br label %cond_next

cond_next:		; preds = %cond_true69, %cond_true
	%tmp76 = load i32* %tmp5, align 8		; <i32> [#uses=1]
	%tmp79 = load i32* %tmp78, align 8		; <i32> [#uses=3]
	%tmp80 = icmp eq i32 %tmp76, %tmp79		; <i1> [#uses=1]
	br i1 %tmp80, label %cond_true83, label %cond_next129

cond_true83:		; preds = %cond_next
	%tmp90 = shl i32 %tmp79, 1		; <i32> [#uses=2]
	%tmp98 = malloc %struct.regobj*, i32 %tmp90		; <%struct.regobj**> [#uses=2]
	%tmpcast = bitcast %struct.regobj** %tmp98 to i8*		; <i8*> [#uses=1]
	%tmp108109 = sext i32 %tmp79 to i64		; <i64> [#uses=1]
	%tmp110 = shl i64 %tmp108109, 3		; <i64> [#uses=1]
	%tmp113 = load %struct.regobj*** %tmp112, align 8		; <%struct.regobj**> [#uses=1]
	%tmp113116 = bitcast %struct.regobj** %tmp113 to i8*		; <i8*> [#uses=1]
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 28, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 128, i32* @cg_caller_id_var, align 4
	store i32 1, i32* @cg_caller_call_site_var, align 4
	store i32 129, i32* @cg_caller_id_var, align 4
	tail call void @llvm.memcpy.i64( i8* %tmpcast, i8* %tmp113116, i64 %tmp110, i32 8 )
	%tmp120 = load %struct.regobj*** %tmp112, align 8		; <%struct.regobj**> [#uses=1]
	free %struct.regobj** %tmp120
	store %struct.regobj** %tmp98, %struct.regobj*** %tmp112, align 8
	store i32 %tmp90, i32* %tmp78, align 8
	br label %cond_next129

cond_next129:		; preds = %cond_true83, %cond_next
	%tmp132 = load %struct.regobj*** %tmp112, align 8		; <%struct.regobj**> [#uses=1]
	%tmp135 = load i32* %tmp5, align 8		; <i32> [#uses=1]
	%tmp135138 = sext i32 %tmp135 to i64		; <i64> [#uses=1]
	%tmp139 = getelementptr %struct.regobj** %tmp132, i64 %tmp135138		; <%struct.regobj**> [#uses=1]
	store %struct.regobj* %tmp36, %struct.regobj** %tmp139, align 8
	%tmp142 = load i32* %tmp5, align 8		; <i32> [#uses=1]
	%tmp143 = add i32 %tmp142, 1		; <i32> [#uses=1]
	store i32 %tmp143, i32* %tmp5, align 8
	br label %bb149

bb149:		; preds = %cond_next129, %bb20
	%tmp148 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp153 = load i32* %tmp152179, align 8		; <i32> [#uses=1]
	%tmp155 = icmp sgt i32 %tmp153, %tmp148		; <i1> [#uses=1]
	store i32 %val42, i32* @cg_caller_call_site_var, align 4
	store i32 %val31, i32* @cg_caller_id_var, align 4
	br i1 %tmp155, label %bb20, label %bb161

bb161:		; preds = %bb149, %bb
	%tmp160 = add i32 %j.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp164 = load i32* %tmp163173, align 8		; <i32> [#uses=1]
	%tmp166 = icmp sgt i32 %tmp164, %tmp160		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp166, label %bb, label %return

return:		; preds = %bb161, %entry
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret void
}

define internal fastcc i32 @_ZN6wayobj10makebound2EPiiS0_(i32* %bound1p, i32 %bound1l, i32* %bound2p) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=10]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=10]
	store i32 29, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 29 )
	%tmp3 = load i32* @way.8, align 8		; <i32> [#uses=4]
	%tmp6 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=16]
	%tmp549563 = icmp sgt i32 %bound1l, 0		; <i1> [#uses=1]
	br i1 %tmp549563, label %bb.preheader, label %UnifiedReturnBlock

bb.preheader:		; preds = %entry
	%tmp336 = add i32 %tmp3, -1		; <i32> [#uses=1]
	%tmp467 = add i32 %tmp3, 1		; <i32> [#uses=1]
	%tmp24 = load i16* @way.25, align 8		; <i16> [#uses=16]
	%tmp29 = load i16** @way.16, align 8		; <i16*> [#uses=8]
	%tmp59 = load i16* @way.24, align 8		; <i16> [#uses=8]
	%tmp63 = load i32* @way.23, align 8		; <i32> [#uses=8]
	%tmp533 = load i32* @way.20, align 8		; <i32> [#uses=2]
	%tmp542 = add i32 %tmp533, -1		; <i32> [#uses=1]
	br label %bb

bb:		; preds = %cond_next530, %bb.preheader
	%i.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp545, %cond_next530 ]		; <i32> [#uses=2]
	%bound2l.1.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %bound2l.9, %cond_next530 ]		; <i32> [#uses=4]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=10]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=10]
	store i32 130, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 130 )
	%tmp89 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp10 = getelementptr i32* %bound1p, i64 %tmp89		; <i32*> [#uses=1]
	%tmp11 = load i32* %tmp10, align 4		; <i32> [#uses=6]
	%tmp14 = sub i32 %tmp11, %tmp3		; <i32> [#uses=5]
	%tmp15 = add i32 %tmp14, -1		; <i32> [#uses=3]
	%tmp1718 = sext i32 %tmp15 to i64		; <i64> [#uses=3]
	%tmp20 = getelementptr %struct.point16t* %tmp6, i64 %tmp1718, i32 0		; <i16*> [#uses=2]
	%tmp21 = load i16* %tmp20, align 2		; <i16> [#uses=1]
	%tmp25 = icmp eq i16 %tmp21, %tmp24		; <i1> [#uses=1]
	br i1 %tmp25, label %cond_next74, label %cond_true

cond_true:		; preds = %bb
	%tmp32 = getelementptr i16* %tmp29, i64 %tmp1718		; <i16*> [#uses=1]
	%tmp33 = load i16* %tmp32, align 2		; <i16> [#uses=1]
	%tmp34 = icmp eq i16 %tmp33, 0		; <i1> [#uses=1]
	br i1 %tmp34, label %cond_true37, label %cond_next74

cond_true37:		; preds = %cond_true
	%tmp3940 = sext i32 %bound2l.1.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp41 = getelementptr i32* %bound2p, i64 %tmp3940		; <i32*> [#uses=1]
	store i32 %tmp15, i32* %tmp41, align 4
	%tmp44 = add i32 %bound2l.1.reg2mem.0, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp20, align 2
	%tmp60 = getelementptr %struct.point16t* %tmp6, i64 %tmp1718, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp60, align 2
	%tmp65 = icmp eq i32 %tmp63, %tmp15		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp65, label %cond_true68, label %cond_next74

cond_true68:		; preds = %cond_true37
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp44

cond_next74:		; preds = %cond_true37, %cond_true, %bb
	%bound2l.0 = phi i32 [ %bound2l.1.reg2mem.0, %bb ], [ %bound2l.1.reg2mem.0, %cond_true ], [ %tmp44, %cond_true37 ]		; <i32> [#uses=4]
	%tmp7980 = sext i32 %tmp14 to i64		; <i64> [#uses=3]
	%tmp82 = getelementptr %struct.point16t* %tmp6, i64 %tmp7980, i32 0		; <i16*> [#uses=2]
	%tmp83 = load i16* %tmp82, align 2		; <i16> [#uses=1]
	%tmp87 = icmp eq i16 %tmp83, %tmp24		; <i1> [#uses=1]
	br i1 %tmp87, label %cond_next139, label %cond_true90

cond_true90:		; preds = %cond_next74
	%tmp96 = getelementptr i16* %tmp29, i64 %tmp7980		; <i16*> [#uses=1]
	%tmp97 = load i16* %tmp96, align 2		; <i16> [#uses=1]
	%tmp98 = icmp eq i16 %tmp97, 0		; <i1> [#uses=1]
	br i1 %tmp98, label %cond_true101, label %cond_next139

cond_true101:		; preds = %cond_true90
	%tmp103104 = sext i32 %bound2l.0 to i64		; <i64> [#uses=1]
	%tmp105 = getelementptr i32* %bound2p, i64 %tmp103104		; <i32*> [#uses=1]
	store i32 %tmp14, i32* %tmp105, align 4
	%tmp108 = add i32 %bound2l.0, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp82, align 2
	%tmp124 = getelementptr %struct.point16t* %tmp6, i64 %tmp7980, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp124, align 2
	%tmp129 = icmp eq i32 %tmp63, %tmp14		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp129, label %cond_true132, label %cond_next139

cond_true132:		; preds = %cond_true101
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp108

cond_next139:		; preds = %cond_true101, %cond_true90, %cond_next74
	%bound2l.2 = phi i32 [ %bound2l.0, %cond_next74 ], [ %bound2l.0, %cond_true90 ], [ %tmp108, %cond_true101 ]		; <i32> [#uses=4]
	%tmp143 = add i32 %tmp14, 1		; <i32> [#uses=3]
	%tmp145146 = sext i32 %tmp143 to i64		; <i64> [#uses=3]
	%tmp148 = getelementptr %struct.point16t* %tmp6, i64 %tmp145146, i32 0		; <i16*> [#uses=2]
	%tmp149 = load i16* %tmp148, align 2		; <i16> [#uses=1]
	%tmp153 = icmp eq i16 %tmp149, %tmp24		; <i1> [#uses=1]
	br i1 %tmp153, label %cond_next205, label %cond_true156

cond_true156:		; preds = %cond_next139
	%tmp162 = getelementptr i16* %tmp29, i64 %tmp145146		; <i16*> [#uses=1]
	%tmp163 = load i16* %tmp162, align 2		; <i16> [#uses=1]
	%tmp164 = icmp eq i16 %tmp163, 0		; <i1> [#uses=1]
	br i1 %tmp164, label %cond_true167, label %cond_next205

cond_true167:		; preds = %cond_true156
	%tmp169170 = sext i32 %bound2l.2 to i64		; <i64> [#uses=1]
	%tmp171 = getelementptr i32* %bound2p, i64 %tmp169170		; <i32*> [#uses=1]
	store i32 %tmp143, i32* %tmp171, align 4
	%tmp174 = add i32 %bound2l.2, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp148, align 2
	%tmp190 = getelementptr %struct.point16t* %tmp6, i64 %tmp145146, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp190, align 2
	%tmp195 = icmp eq i32 %tmp63, %tmp143		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp195, label %cond_true198, label %cond_next205

cond_true198:		; preds = %cond_true167
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp174

cond_next205:		; preds = %cond_true167, %cond_true156, %cond_next139
	%bound2l.3 = phi i32 [ %bound2l.2, %cond_next139 ], [ %bound2l.2, %cond_true156 ], [ %tmp174, %cond_true167 ]		; <i32> [#uses=4]
	%tmp207 = add i32 %tmp11, -1		; <i32> [#uses=3]
	%tmp209210 = sext i32 %tmp207 to i64		; <i64> [#uses=3]
	%tmp212 = getelementptr %struct.point16t* %tmp6, i64 %tmp209210, i32 0		; <i16*> [#uses=2]
	%tmp213 = load i16* %tmp212, align 2		; <i16> [#uses=1]
	%tmp217 = icmp eq i16 %tmp213, %tmp24		; <i1> [#uses=1]
	br i1 %tmp217, label %cond_next269, label %cond_true220

cond_true220:		; preds = %cond_next205
	%tmp226 = getelementptr i16* %tmp29, i64 %tmp209210		; <i16*> [#uses=1]
	%tmp227 = load i16* %tmp226, align 2		; <i16> [#uses=1]
	%tmp228 = icmp eq i16 %tmp227, 0		; <i1> [#uses=1]
	br i1 %tmp228, label %cond_true231, label %cond_next269

cond_true231:		; preds = %cond_true220
	%tmp233234 = sext i32 %bound2l.3 to i64		; <i64> [#uses=1]
	%tmp235 = getelementptr i32* %bound2p, i64 %tmp233234		; <i32*> [#uses=1]
	store i32 %tmp207, i32* %tmp235, align 4
	%tmp238 = add i32 %bound2l.3, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp212, align 2
	%tmp254 = getelementptr %struct.point16t* %tmp6, i64 %tmp209210, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp254, align 2
	%tmp259 = icmp eq i32 %tmp63, %tmp207		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp259, label %cond_true262, label %cond_next269

cond_true262:		; preds = %cond_true231
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp238

cond_next269:		; preds = %cond_true231, %cond_true220, %cond_next205
	%bound2l.4 = phi i32 [ %bound2l.3, %cond_next205 ], [ %bound2l.3, %cond_true220 ], [ %tmp238, %cond_true231 ]		; <i32> [#uses=4]
	%tmp271 = add i32 %tmp11, 1		; <i32> [#uses=3]
	%tmp273274 = sext i32 %tmp271 to i64		; <i64> [#uses=3]
	%tmp276 = getelementptr %struct.point16t* %tmp6, i64 %tmp273274, i32 0		; <i16*> [#uses=2]
	%tmp277 = load i16* %tmp276, align 2		; <i16> [#uses=1]
	%tmp281 = icmp eq i16 %tmp277, %tmp24		; <i1> [#uses=1]
	br i1 %tmp281, label %cond_next333, label %cond_true284

cond_true284:		; preds = %cond_next269
	%tmp290 = getelementptr i16* %tmp29, i64 %tmp273274		; <i16*> [#uses=1]
	%tmp291 = load i16* %tmp290, align 2		; <i16> [#uses=1]
	%tmp292 = icmp eq i16 %tmp291, 0		; <i1> [#uses=1]
	br i1 %tmp292, label %cond_true295, label %cond_next333

cond_true295:		; preds = %cond_true284
	%tmp297298 = sext i32 %bound2l.4 to i64		; <i64> [#uses=1]
	%tmp299 = getelementptr i32* %bound2p, i64 %tmp297298		; <i32*> [#uses=1]
	store i32 %tmp271, i32* %tmp299, align 4
	%tmp302 = add i32 %bound2l.4, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp276, align 2
	%tmp318 = getelementptr %struct.point16t* %tmp6, i64 %tmp273274, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp318, align 2
	%tmp323 = icmp eq i32 %tmp63, %tmp271		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp323, label %cond_true326, label %cond_next333

cond_true326:		; preds = %cond_true295
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp302

cond_next333:		; preds = %cond_true295, %cond_true284, %cond_next269
	%bound2l.5 = phi i32 [ %bound2l.4, %cond_next269 ], [ %bound2l.4, %cond_true284 ], [ %tmp302, %cond_true295 ]		; <i32> [#uses=4]
	%tmp337 = add i32 %tmp336, %tmp11		; <i32> [#uses=3]
	%tmp339340 = sext i32 %tmp337 to i64		; <i64> [#uses=3]
	%tmp342 = getelementptr %struct.point16t* %tmp6, i64 %tmp339340, i32 0		; <i16*> [#uses=2]
	%tmp343 = load i16* %tmp342, align 2		; <i16> [#uses=1]
	%tmp347 = icmp eq i16 %tmp343, %tmp24		; <i1> [#uses=1]
	br i1 %tmp347, label %cond_next399, label %cond_true350

cond_true350:		; preds = %cond_next333
	%tmp356 = getelementptr i16* %tmp29, i64 %tmp339340		; <i16*> [#uses=1]
	%tmp357 = load i16* %tmp356, align 2		; <i16> [#uses=1]
	%tmp358 = icmp eq i16 %tmp357, 0		; <i1> [#uses=1]
	br i1 %tmp358, label %cond_true361, label %cond_next399

cond_true361:		; preds = %cond_true350
	%tmp363364 = sext i32 %bound2l.5 to i64		; <i64> [#uses=1]
	%tmp365 = getelementptr i32* %bound2p, i64 %tmp363364		; <i32*> [#uses=1]
	store i32 %tmp337, i32* %tmp365, align 4
	%tmp368 = add i32 %bound2l.5, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp342, align 2
	%tmp384 = getelementptr %struct.point16t* %tmp6, i64 %tmp339340, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp384, align 2
	%tmp389 = icmp eq i32 %tmp63, %tmp337		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp389, label %cond_true392, label %cond_next399

cond_true392:		; preds = %cond_true361
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp368

cond_next399:		; preds = %cond_true361, %cond_true350, %cond_next333
	%bound2l.6 = phi i32 [ %bound2l.5, %cond_next333 ], [ %bound2l.5, %cond_true350 ], [ %tmp368, %cond_true361 ]		; <i32> [#uses=4]
	%tmp402 = add i32 %tmp11, %tmp3		; <i32> [#uses=3]
	%tmp404405 = sext i32 %tmp402 to i64		; <i64> [#uses=3]
	%tmp407 = getelementptr %struct.point16t* %tmp6, i64 %tmp404405, i32 0		; <i16*> [#uses=2]
	%tmp408 = load i16* %tmp407, align 2		; <i16> [#uses=1]
	%tmp412 = icmp eq i16 %tmp408, %tmp24		; <i1> [#uses=1]
	br i1 %tmp412, label %cond_next464, label %cond_true415

cond_true415:		; preds = %cond_next399
	%tmp421 = getelementptr i16* %tmp29, i64 %tmp404405		; <i16*> [#uses=1]
	%tmp422 = load i16* %tmp421, align 2		; <i16> [#uses=1]
	%tmp423 = icmp eq i16 %tmp422, 0		; <i1> [#uses=1]
	br i1 %tmp423, label %cond_true426, label %cond_next464

cond_true426:		; preds = %cond_true415
	%tmp428429 = sext i32 %bound2l.6 to i64		; <i64> [#uses=1]
	%tmp430 = getelementptr i32* %bound2p, i64 %tmp428429		; <i32*> [#uses=1]
	store i32 %tmp402, i32* %tmp430, align 4
	%tmp433 = add i32 %bound2l.6, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp407, align 2
	%tmp449 = getelementptr %struct.point16t* %tmp6, i64 %tmp404405, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp449, align 2
	%tmp454 = icmp eq i32 %tmp63, %tmp402		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp454, label %cond_true457, label %cond_next464

cond_true457:		; preds = %cond_true426
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp433

cond_next464:		; preds = %cond_true426, %cond_true415, %cond_next399
	%bound2l.7 = phi i32 [ %bound2l.6, %cond_next399 ], [ %bound2l.6, %cond_true415 ], [ %tmp433, %cond_true426 ]		; <i32> [#uses=4]
	%tmp468 = add i32 %tmp467, %tmp11		; <i32> [#uses=3]
	%tmp470471 = sext i32 %tmp468 to i64		; <i64> [#uses=3]
	%tmp473 = getelementptr %struct.point16t* %tmp6, i64 %tmp470471, i32 0		; <i16*> [#uses=2]
	%tmp474 = load i16* %tmp473, align 2		; <i16> [#uses=1]
	%tmp478 = icmp eq i16 %tmp474, %tmp24		; <i1> [#uses=1]
	br i1 %tmp478, label %cond_next530, label %cond_true481

cond_true481:		; preds = %cond_next464
	%tmp487 = getelementptr i16* %tmp29, i64 %tmp470471		; <i16*> [#uses=1]
	%tmp488 = load i16* %tmp487, align 2		; <i16> [#uses=1]
	%tmp489 = icmp eq i16 %tmp488, 0		; <i1> [#uses=1]
	br i1 %tmp489, label %cond_true492, label %cond_next530

cond_true492:		; preds = %cond_true481
	%tmp494495 = sext i32 %bound2l.7 to i64		; <i64> [#uses=1]
	%tmp496 = getelementptr i32* %bound2p, i64 %tmp494495		; <i32*> [#uses=1]
	store i32 %tmp468, i32* %tmp496, align 4
	%tmp499 = add i32 %bound2l.7, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp473, align 2
	%tmp515 = getelementptr %struct.point16t* %tmp6, i64 %tmp470471, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp515, align 2
	%tmp520 = icmp eq i32 %tmp63, %tmp468		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp520, label %cond_true523, label %cond_next530

cond_true523:		; preds = %cond_true492
	store i1 true, i1* @way.22.b, align 1
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %tmp499

cond_next530:		; preds = %cond_true492, %cond_true481, %cond_next464
	%bound2l.8 = phi i32 [ %bound2l.7, %cond_next464 ], [ %bound2l.7, %cond_true481 ], [ %tmp499, %cond_true492 ]		; <i32> [#uses=2]
	%tmp535 = icmp sgt i32 %tmp533, %bound2l.8		; <i1> [#uses=1]
	%bound2l.9 = select i1 %tmp535, i32 %bound2l.8, i32 %tmp542		; <i32> [#uses=2]
	%tmp545 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp549 = icmp slt i32 %tmp545, %bound1l		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp549, label %bb, label %UnifiedReturnBlock

UnifiedReturnBlock:		; preds = %cond_next530, %entry
	%UnifiedRetVal = phi i32 [ 0, %entry ], [ %bound2l.9, %cond_next530 ]		; <i32> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %UnifiedRetVal
}

define internal fastcc i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(i32* %bound1p, i32 %bound1l, i32* %bound2p) nounwind  {
entry:
	%val = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=10]
	%val2 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=10]
	store i32 30, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val, i32 %val2, i32 30 )
	%tmp3 = load i32* @way.8, align 8		; <i32> [#uses=4]
	%tmp6 = load %struct.point16t** @way.17, align 8		; <%struct.point16t*> [#uses=16]
	%tmp605620 = icmp sgt i32 %bound1l, 0		; <i1> [#uses=1]
	br i1 %tmp605620, label %bb.preheader, label %UnifiedReturnBlock

bb.preheader:		; preds = %entry
	%tmp371 = add i32 %tmp3, -1		; <i32> [#uses=1]
	%tmp516 = add i32 %tmp3, 1		; <i32> [#uses=1]
	%tmp24 = load i16* @way.25, align 8		; <i16> [#uses=16]
	%tmp29 = load i16** @way.16, align 8		; <i16*> [#uses=8]
	%tmp59 = load i16* @way.24, align 8		; <i16> [#uses=8]
	%tmp589622 = load i32* @way.20, align 8		; <i32> [#uses=3]
	br label %bb

bb:		; preds = %bb602, %bb.preheader
	%i.0.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %tmp601, %bb602 ]		; <i32> [#uses=2]
	%bound2l.1.reg2mem.0 = phi i32 [ 0, %bb.preheader ], [ %bound2l.9, %bb602 ]		; <i32> [#uses=5]
	%val3 = load i32* @cg_caller_id_var, align 4		; <i32> [#uses=10]
	%val4 = load i32* @cg_caller_call_site_var, align 4		; <i32> [#uses=10]
	store i32 131, i32* @cg_caller_id_var, align 4
	call void @CallEdgeProfiler( i32 %val3, i32 %val4, i32 131 )
	%tmp89 = sext i32 %i.0.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp10 = getelementptr i32* %bound1p, i64 %tmp89		; <i32*> [#uses=1]
	%tmp11 = load i32* %tmp10, align 4		; <i32> [#uses=6]
	%tmp14 = sub i32 %tmp11, %tmp3		; <i32> [#uses=5]
	%tmp15 = add i32 %tmp14, -1		; <i32> [#uses=3]
	%tmp1718 = sext i32 %tmp15 to i64		; <i64> [#uses=3]
	%tmp20 = getelementptr %struct.point16t* %tmp6, i64 %tmp1718, i32 0		; <i16*> [#uses=2]
	%tmp21 = load i16* %tmp20, align 2		; <i16> [#uses=1]
	%tmp25 = icmp eq i16 %tmp21, %tmp24		; <i1> [#uses=1]
	br i1 %tmp25, label %cond_next80, label %cond_true

cond_true:		; preds = %bb
	%tmp32 = getelementptr i16* %tmp29, i64 %tmp1718		; <i16*> [#uses=1]
	%tmp33 = load i16* %tmp32, align 2		; <i16> [#uses=2]
	%tmp34 = icmp sgt i16 %tmp33, 0		; <i1> [#uses=1]
	br i1 %tmp34, label %cond_true37, label %cond_false

cond_true37:		; preds = %cond_true
	%tmp3940 = sext i32 %bound2l.1.reg2mem.0 to i64		; <i64> [#uses=1]
	%tmp41 = getelementptr i32* %bound2p, i64 %tmp3940		; <i32*> [#uses=1]
	store i32 %tmp15, i32* %tmp41, align 4
	%tmp44 = add i32 %bound2l.1.reg2mem.0, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp20, align 2
	%tmp60 = getelementptr %struct.point16t* %tmp6, i64 %tmp1718, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp60, align 2
	br label %cond_next80

cond_false:		; preds = %cond_true
	%tmp68 = icmp eq i16 %tmp33, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp68, label %cond_true71, label %cond_next80

cond_true71:		; preds = %cond_false
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp15, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.1.reg2mem.0

cond_next80:		; preds = %cond_false, %cond_true37, %bb
	%bound2l.0 = phi i32 [ %tmp44, %cond_true37 ], [ %bound2l.1.reg2mem.0, %bb ], [ %bound2l.1.reg2mem.0, %cond_false ]		; <i32> [#uses=5]
	%tmp8586 = sext i32 %tmp14 to i64		; <i64> [#uses=3]
	%tmp88 = getelementptr %struct.point16t* %tmp6, i64 %tmp8586, i32 0		; <i16*> [#uses=2]
	%tmp90 = load i16* %tmp88, align 2		; <i16> [#uses=1]
	%tmp94 = icmp eq i16 %tmp90, %tmp24		; <i1> [#uses=1]
	br i1 %tmp94, label %cond_next153, label %cond_true97

cond_true97:		; preds = %cond_next80
	%tmp103 = getelementptr i16* %tmp29, i64 %tmp8586		; <i16*> [#uses=1]
	%tmp104 = load i16* %tmp103, align 2		; <i16> [#uses=2]
	%tmp105 = icmp sgt i16 %tmp104, 0		; <i1> [#uses=1]
	br i1 %tmp105, label %cond_true108, label %cond_false132

cond_true108:		; preds = %cond_true97
	%tmp110111 = sext i32 %bound2l.0 to i64		; <i64> [#uses=1]
	%tmp112 = getelementptr i32* %bound2p, i64 %tmp110111		; <i32*> [#uses=1]
	store i32 %tmp14, i32* %tmp112, align 4
	%tmp115 = add i32 %bound2l.0, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp88, align 2
	%tmp131 = getelementptr %struct.point16t* %tmp6, i64 %tmp8586, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp131, align 2
	br label %cond_next153

cond_false132:		; preds = %cond_true97
	%tmp140 = icmp eq i16 %tmp104, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp140, label %cond_true143, label %cond_next153

cond_true143:		; preds = %cond_false132
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp14, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.0

cond_next153:		; preds = %cond_false132, %cond_true108, %cond_next80
	%bound2l.2 = phi i32 [ %tmp115, %cond_true108 ], [ %bound2l.0, %cond_next80 ], [ %bound2l.0, %cond_false132 ]		; <i32> [#uses=5]
	%tmp157 = add i32 %tmp14, 1		; <i32> [#uses=3]
	%tmp159160 = sext i32 %tmp157 to i64		; <i64> [#uses=3]
	%tmp162 = getelementptr %struct.point16t* %tmp6, i64 %tmp159160, i32 0		; <i16*> [#uses=2]
	%tmp163 = load i16* %tmp162, align 2		; <i16> [#uses=1]
	%tmp167 = icmp eq i16 %tmp163, %tmp24		; <i1> [#uses=1]
	br i1 %tmp167, label %cond_next226, label %cond_true170

cond_true170:		; preds = %cond_next153
	%tmp176 = getelementptr i16* %tmp29, i64 %tmp159160		; <i16*> [#uses=1]
	%tmp177 = load i16* %tmp176, align 2		; <i16> [#uses=2]
	%tmp178 = icmp sgt i16 %tmp177, 0		; <i1> [#uses=1]
	br i1 %tmp178, label %cond_true181, label %cond_false205

cond_true181:		; preds = %cond_true170
	%tmp183184 = sext i32 %bound2l.2 to i64		; <i64> [#uses=1]
	%tmp185 = getelementptr i32* %bound2p, i64 %tmp183184		; <i32*> [#uses=1]
	store i32 %tmp157, i32* %tmp185, align 4
	%tmp188 = add i32 %bound2l.2, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp162, align 2
	%tmp204 = getelementptr %struct.point16t* %tmp6, i64 %tmp159160, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp204, align 2
	br label %cond_next226

cond_false205:		; preds = %cond_true170
	%tmp213 = icmp eq i16 %tmp177, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp213, label %cond_true216, label %cond_next226

cond_true216:		; preds = %cond_false205
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp157, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.2

cond_next226:		; preds = %cond_false205, %cond_true181, %cond_next153
	%bound2l.3 = phi i32 [ %tmp188, %cond_true181 ], [ %bound2l.2, %cond_next153 ], [ %bound2l.2, %cond_false205 ]		; <i32> [#uses=5]
	%tmp228 = add i32 %tmp11, -1		; <i32> [#uses=3]
	%tmp230231 = sext i32 %tmp228 to i64		; <i64> [#uses=3]
	%tmp233 = getelementptr %struct.point16t* %tmp6, i64 %tmp230231, i32 0		; <i16*> [#uses=2]
	%tmp234 = load i16* %tmp233, align 2		; <i16> [#uses=1]
	%tmp238 = icmp eq i16 %tmp234, %tmp24		; <i1> [#uses=1]
	br i1 %tmp238, label %cond_next297, label %cond_true241

cond_true241:		; preds = %cond_next226
	%tmp247 = getelementptr i16* %tmp29, i64 %tmp230231		; <i16*> [#uses=1]
	%tmp248 = load i16* %tmp247, align 2		; <i16> [#uses=2]
	%tmp249 = icmp sgt i16 %tmp248, 0		; <i1> [#uses=1]
	br i1 %tmp249, label %cond_true252, label %cond_false276

cond_true252:		; preds = %cond_true241
	%tmp254255 = sext i32 %bound2l.3 to i64		; <i64> [#uses=1]
	%tmp256 = getelementptr i32* %bound2p, i64 %tmp254255		; <i32*> [#uses=1]
	store i32 %tmp228, i32* %tmp256, align 4
	%tmp259 = add i32 %bound2l.3, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp233, align 2
	%tmp275 = getelementptr %struct.point16t* %tmp6, i64 %tmp230231, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp275, align 2
	br label %cond_next297

cond_false276:		; preds = %cond_true241
	%tmp284 = icmp eq i16 %tmp248, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp284, label %cond_true287, label %cond_next297

cond_true287:		; preds = %cond_false276
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp228, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.3

cond_next297:		; preds = %cond_false276, %cond_true252, %cond_next226
	%bound2l.4 = phi i32 [ %tmp259, %cond_true252 ], [ %bound2l.3, %cond_next226 ], [ %bound2l.3, %cond_false276 ]		; <i32> [#uses=5]
	%tmp299 = add i32 %tmp11, 1		; <i32> [#uses=3]
	%tmp301302 = sext i32 %tmp299 to i64		; <i64> [#uses=3]
	%tmp304 = getelementptr %struct.point16t* %tmp6, i64 %tmp301302, i32 0		; <i16*> [#uses=2]
	%tmp305 = load i16* %tmp304, align 2		; <i16> [#uses=1]
	%tmp309 = icmp eq i16 %tmp305, %tmp24		; <i1> [#uses=1]
	br i1 %tmp309, label %cond_next368, label %cond_true312

cond_true312:		; preds = %cond_next297
	%tmp318 = getelementptr i16* %tmp29, i64 %tmp301302		; <i16*> [#uses=1]
	%tmp319 = load i16* %tmp318, align 2		; <i16> [#uses=2]
	%tmp320 = icmp sgt i16 %tmp319, 0		; <i1> [#uses=1]
	br i1 %tmp320, label %cond_true323, label %cond_false347

cond_true323:		; preds = %cond_true312
	%tmp325326 = sext i32 %bound2l.4 to i64		; <i64> [#uses=1]
	%tmp327 = getelementptr i32* %bound2p, i64 %tmp325326		; <i32*> [#uses=1]
	store i32 %tmp299, i32* %tmp327, align 4
	%tmp330 = add i32 %bound2l.4, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp304, align 2
	%tmp346 = getelementptr %struct.point16t* %tmp6, i64 %tmp301302, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp346, align 2
	br label %cond_next368

cond_false347:		; preds = %cond_true312
	%tmp355 = icmp eq i16 %tmp319, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp355, label %cond_true358, label %cond_next368

cond_true358:		; preds = %cond_false347
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp299, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.4

cond_next368:		; preds = %cond_false347, %cond_true323, %cond_next297
	%bound2l.5 = phi i32 [ %tmp330, %cond_true323 ], [ %bound2l.4, %cond_next297 ], [ %bound2l.4, %cond_false347 ]		; <i32> [#uses=5]
	%tmp372 = add i32 %tmp371, %tmp11		; <i32> [#uses=3]
	%tmp374375 = sext i32 %tmp372 to i64		; <i64> [#uses=3]
	%tmp377 = getelementptr %struct.point16t* %tmp6, i64 %tmp374375, i32 0		; <i16*> [#uses=2]
	%tmp378 = load i16* %tmp377, align 2		; <i16> [#uses=1]
	%tmp382 = icmp eq i16 %tmp378, %tmp24		; <i1> [#uses=1]
	br i1 %tmp382, label %cond_next441, label %cond_true385

cond_true385:		; preds = %cond_next368
	%tmp391 = getelementptr i16* %tmp29, i64 %tmp374375		; <i16*> [#uses=1]
	%tmp392 = load i16* %tmp391, align 2		; <i16> [#uses=2]
	%tmp393 = icmp sgt i16 %tmp392, 0		; <i1> [#uses=1]
	br i1 %tmp393, label %cond_true396, label %cond_false420

cond_true396:		; preds = %cond_true385
	%tmp398399 = sext i32 %bound2l.5 to i64		; <i64> [#uses=1]
	%tmp400 = getelementptr i32* %bound2p, i64 %tmp398399		; <i32*> [#uses=1]
	store i32 %tmp372, i32* %tmp400, align 4
	%tmp403 = add i32 %bound2l.5, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp377, align 2
	%tmp419 = getelementptr %struct.point16t* %tmp6, i64 %tmp374375, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp419, align 2
	br label %cond_next441

cond_false420:		; preds = %cond_true385
	%tmp428 = icmp eq i16 %tmp392, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp428, label %cond_true431, label %cond_next441

cond_true431:		; preds = %cond_false420
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp372, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.5

cond_next441:		; preds = %cond_false420, %cond_true396, %cond_next368
	%bound2l.6 = phi i32 [ %tmp403, %cond_true396 ], [ %bound2l.5, %cond_next368 ], [ %bound2l.5, %cond_false420 ]		; <i32> [#uses=5]
	%tmp444 = add i32 %tmp11, %tmp3		; <i32> [#uses=3]
	%tmp446447 = sext i32 %tmp444 to i64		; <i64> [#uses=3]
	%tmp449 = getelementptr %struct.point16t* %tmp6, i64 %tmp446447, i32 0		; <i16*> [#uses=2]
	%tmp450 = load i16* %tmp449, align 2		; <i16> [#uses=1]
	%tmp454 = icmp eq i16 %tmp450, %tmp24		; <i1> [#uses=1]
	br i1 %tmp454, label %cond_next513, label %cond_true457

cond_true457:		; preds = %cond_next441
	%tmp463 = getelementptr i16* %tmp29, i64 %tmp446447		; <i16*> [#uses=1]
	%tmp464 = load i16* %tmp463, align 2		; <i16> [#uses=2]
	%tmp465 = icmp sgt i16 %tmp464, 0		; <i1> [#uses=1]
	br i1 %tmp465, label %cond_true468, label %cond_false492

cond_true468:		; preds = %cond_true457
	%tmp470471 = sext i32 %bound2l.6 to i64		; <i64> [#uses=1]
	%tmp472 = getelementptr i32* %bound2p, i64 %tmp470471		; <i32*> [#uses=1]
	store i32 %tmp444, i32* %tmp472, align 4
	%tmp475 = add i32 %bound2l.6, 1		; <i32> [#uses=1]
	store i16 %tmp24, i16* %tmp449, align 2
	%tmp491 = getelementptr %struct.point16t* %tmp6, i64 %tmp446447, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp491, align 2
	br label %cond_next513

cond_false492:		; preds = %cond_true457
	%tmp500 = icmp eq i16 %tmp464, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp500, label %cond_true503, label %cond_next513

cond_true503:		; preds = %cond_false492
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp444, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.6

cond_next513:		; preds = %cond_false492, %cond_true468, %cond_next441
	%bound2l.7 = phi i32 [ %tmp475, %cond_true468 ], [ %bound2l.6, %cond_next441 ], [ %bound2l.6, %cond_false492 ]		; <i32> [#uses=5]
	%tmp517 = add i32 %tmp516, %tmp11		; <i32> [#uses=3]
	%tmp519520 = sext i32 %tmp517 to i64		; <i64> [#uses=3]
	%tmp522 = getelementptr %struct.point16t* %tmp6, i64 %tmp519520, i32 0		; <i16*> [#uses=2]
	%tmp523 = load i16* %tmp522, align 2		; <i16> [#uses=1]
	%tmp527 = icmp eq i16 %tmp523, %tmp24		; <i1> [#uses=1]
	br i1 %tmp527, label %cond_next586, label %cond_true530

cond_true530:		; preds = %cond_next513
	%tmp536 = getelementptr i16* %tmp29, i64 %tmp519520		; <i16*> [#uses=1]
	%tmp537 = load i16* %tmp536, align 2		; <i16> [#uses=2]
	%tmp538 = icmp sgt i16 %tmp537, 0		; <i1> [#uses=1]
	br i1 %tmp538, label %cond_true541, label %cond_false565

cond_true541:		; preds = %cond_true530
	%tmp543544 = sext i32 %bound2l.7 to i64		; <i64> [#uses=1]
	%tmp545 = getelementptr i32* %bound2p, i64 %tmp543544		; <i32*> [#uses=1]
	store i32 %tmp517, i32* %tmp545, align 4
	%tmp548 = add i32 %bound2l.7, 1		; <i32> [#uses=2]
	store i16 %tmp24, i16* %tmp522, align 2
	%tmp564 = getelementptr %struct.point16t* %tmp6, i64 %tmp519520, i32 1		; <i16*> [#uses=1]
	store i16 %tmp59, i16* %tmp564, align 2
	%tmp591623 = icmp sgt i32 %tmp589622, %tmp548		; <i1> [#uses=1]
	br i1 %tmp591623, label %bb602, label %cond_true594

cond_false565:		; preds = %cond_true530
	%tmp573 = icmp eq i16 %tmp537, 0		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp573, label %cond_true576, label %cond_next586

cond_true576:		; preds = %cond_false565
	store i1 true, i1* @way.22.b, align 1
	store i32 %tmp517, i32* @way.23, align 8
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %bound2l.7

cond_next586:		; preds = %cond_false565, %cond_next513
	%tmp591 = icmp sgt i32 %tmp589622, %bound2l.7		; <i1> [#uses=1]
	br i1 %tmp591, label %bb602, label %cond_true594

cond_true594:		; preds = %cond_next586, %cond_true541
	%tmp598 = add i32 %tmp589622, -1		; <i32> [#uses=1]
	br label %bb602

bb602:		; preds = %cond_true594, %cond_next586, %cond_true541
	%bound2l.9 = phi i32 [ %tmp598, %cond_true594 ], [ %tmp548, %cond_true541 ], [ %bound2l.7, %cond_next586 ]		; <i32> [#uses=2]
	%tmp601 = add i32 %i.0.reg2mem.0, 1		; <i32> [#uses=2]
	%tmp605 = icmp slt i32 %tmp601, %bound1l		; <i1> [#uses=1]
	store i32 %val4, i32* @cg_caller_call_site_var, align 4
	store i32 %val3, i32* @cg_caller_id_var, align 4
	br i1 %tmp605, label %bb, label %UnifiedReturnBlock

UnifiedReturnBlock:		; preds = %bb602, %entry
	%UnifiedRetVal = phi i32 [ 0, %entry ], [ %bound2l.9, %bb602 ]		; <i32> [#uses=1]
	store i32 %val2, i32* @cg_caller_call_site_var, align 4
	store i32 %val, i32* @cg_caller_id_var, align 4
	ret i32 %UnifiedRetVal
}

declare void @CallEdgeProfiler(i32, i32, i32)

declare void @CallProfPrinter()
