; ModuleID = 'test_output.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @func1(i32 %m, i32 %n) {
entry:
	%m_addr = alloca i32		; <i32*> [#uses=2]
	%n_addr = alloca i32		; <i32*> [#uses=2]
	%retval = alloca i32		; <i32*> [#uses=2]
	%tmp = alloca i32		; <i32*> [#uses=2]
	%a = alloca i32		; <i32*> [#uses=4]
	%k = alloca i32		; <i32*> [#uses=5]
	%j = alloca i32		; <i32*> [#uses=5]
	%"alloca point" = bitcast i32 0 to i32		; <i32> [#uses=0]
	store i32 %m, i32* %m_addr
	store i32 %n, i32* %n_addr
	store i32 0, i32* %a, align 4
	store i32 0, i32* %k, align 4
	br label %bb17

bb:		; preds = %bb17
	store i32 0, i32* %j, align 4
	br label %bb9

bb1:		; preds = %bb9
	%tmp2 = load i32* %a, align 4		; <i32> [#uses=1]
	%tmp3 = load i32* %k, align 4		; <i32> [#uses=1]
	%tmp4 = add i32 %tmp2, %tmp3		; <i32> [#uses=1]
	%tmp5 = load i32* %j, align 4		; <i32> [#uses=1]
	%tmp6 = sub i32 %tmp4, %tmp5		; <i32> [#uses=1]
	store i32 %tmp6, i32* %a, align 4
	%tmp7 = load i32* %j, align 4		; <i32> [#uses=1]
	%tmp8 = add i32 %tmp7, 1		; <i32> [#uses=1]
	store i32 %tmp8, i32* %j, align 4
	br label %bb9

bb9:		; preds = %bb1, %bb
	%tmp10 = load i32* %j, align 4		; <i32> [#uses=1]
	%tmp11 = load i32* %n_addr, align 4		; <i32> [#uses=1]
	%tmp12 = icmp slt i32 %tmp10, %tmp11		; <i1> [#uses=1]
	%tmp1213 = zext i1 %tmp12 to i8		; <i8> [#uses=1]
	%toBool = icmp ne i8 %tmp1213, 0		; <i1> [#uses=1]
	br i1 %toBool, label %bb1, label %bb14

bb14:		; preds = %bb9
	%tmp15 = load i32* %k, align 4		; <i32> [#uses=1]
	%tmp16 = add i32 %tmp15, 1		; <i32> [#uses=1]
	store i32 %tmp16, i32* %k, align 4
	br label %bb17

bb17:		; preds = %bb14, %entry
	%tmp18 = load i32* %k, align 4		; <i32> [#uses=1]
	%tmp19 = load i32* %m_addr, align 4		; <i32> [#uses=1]
	%tmp20 = icmp slt i32 %tmp18, %tmp19		; <i1> [#uses=1]
	%tmp2021 = zext i1 %tmp20 to i8		; <i8> [#uses=1]
	%toBool22 = icmp ne i8 %tmp2021, 0		; <i1> [#uses=1]
	br i1 %toBool22, label %bb, label %bb23

bb23:		; preds = %bb17
	%tmp24 = load i32* %a, align 4		; <i32> [#uses=1]
	store i32 %tmp24, i32* %tmp, align 4
	%tmp25 = load i32* %tmp, align 4		; <i32> [#uses=1]
	store i32 %tmp25, i32* %retval, align 4
	br label %return

return:		; preds = %bb23
	%retval26 = load i32* %retval		; <i32> [#uses=1]
	ret i32 %retval26
}

define i32 @main() {
entry:
	%retval = alloca i32		; <i32*> [#uses=2]
	%tmp = alloca i32		; <i32*> [#uses=2]
	%x = alloca i32		; <i32*> [#uses=2]
	%y = alloca i32		; <i32*> [#uses=2]
	%"alloca point" = bitcast i32 0 to i32		; <i32> [#uses=0]
	%tmp1 = call i32 @func1( i32 10, i32 10 )		; <i32> [#uses=1]
	store i32 %tmp1, i32* %x, align 4
	%tmp2 = call i32 @func1( i32 100, i32 100 )		; <i32> [#uses=1]
	store i32 %tmp2, i32* %y, align 4
	%tmp3 = load i32* %x, align 4		; <i32> [#uses=1]
	%tmp4 = load i32* %y, align 4		; <i32> [#uses=1]
	%tmp5 = add i32 %tmp3, %tmp4		; <i32> [#uses=1]
	store i32 %tmp5, i32* %tmp, align 4
	%tmp6 = load i32* %tmp, align 4		; <i32> [#uses=1]
	store i32 %tmp6, i32* %retval, align 4
	br label %return

return:		; preds = %entry
	%retval7 = load i32* %retval		; <i32> [#uses=1]
	ret i32 %retval7
}
