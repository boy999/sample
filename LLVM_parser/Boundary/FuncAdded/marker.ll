; ModuleID = 'marker.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32 %i) {
entry:
	%tmp1 = tail call i32 (...)* @func_enter( i32 %i )		; <i32> [#uses=0]
	%tmp3 = tail call i32 (...)* @loop_enter( i32 %i )		; <i32> [#uses=0]
	ret void
}

declare i32 @func_enter(...)

declare i32 @loop_enter(...)
