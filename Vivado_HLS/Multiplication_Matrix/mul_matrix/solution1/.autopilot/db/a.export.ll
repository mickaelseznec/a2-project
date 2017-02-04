; ModuleID = 'C:/Users/vince/Desktop/Zynq_Stuff/Multiplication_Matrix/mul_matrix/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@matrix_multiply_top_str = internal unnamed_addr constant [20 x i8] c"matrix_multiply_top\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@a_row_loop_b_col_loop_str = internal unnamed_addr constant [22 x i8] c"a_row_loop_b_col_loop\00"
@a_col_loop_a_row_loop_b_col_lo = internal unnamed_addr constant [33 x i8] c"a_col_loop_a_row_loop_b_col_loop\00"
@p_str1812 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1809 = private unnamed_addr constant [11 x i8] c"c_col_loop\00", align 1
@p_str1808 = private unnamed_addr constant [11 x i8] c"c_row_loop\00", align 1
@p_str1807 = private unnamed_addr constant [11 x i8] c"b_col_loop\00", align 1
@p_str1806 = private unnamed_addr constant [11 x i8] c"b_row_loop\00", align 1
@p_str1805 = private unnamed_addr constant [11 x i8] c"a_col_loop\00", align 1
@p_str1804 = private unnamed_addr constant [11 x i8] c"a_row_loop\00", align 1

define void @matrix_multiply_top([9 x float]* %A, [9 x float]* %B, [9 x float]* %C) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %A) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %B) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %C) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecTopModule([20 x i8]* @matrix_multiply_top_str) nounwind
  %a_i = alloca [9 x float], align 4
  %b_i = alloca [9 x float], align 4
  %C_assign = alloca [9 x float], align 4
  br label %1

; <label>:1                                       ; preds = %5, %0
  %r = phi i2 [ 0, %0 ], [ %r_1, %5 ]
  %exitcond5 = icmp eq i2 %r, -1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %r_1 = add i2 %r, 1
  br i1 %exitcond5, label %.preheader, label %2

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1804) nounwind
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1804) nounwind
  %tmp_cast = zext i2 %r to i5
  %tmp_6 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r, i2 0)
  %p_shl_cast = zext i4 %tmp_6 to i5
  %tmp_9 = sub i5 %p_shl_cast, %tmp_cast
  br label %3

; <label>:3                                       ; preds = %4, %2
  %c = phi i2 [ 0, %2 ], [ %c_1, %4 ]
  %exitcond4 = icmp eq i2 %c, -1
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %c_1 = add i2 %c, 1
  br i1 %exitcond4, label %5, label %4

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1805) nounwind
  %tmp_3_cast = zext i2 %c to i5
  %tmp_3 = add i5 %tmp_9, %tmp_3_cast
  %tmp_12_cast = sext i5 %tmp_3 to i64
  %A_addr = getelementptr [9 x float]* %A, i64 0, i64 %tmp_12_cast
  %a_i_addr = getelementptr [9 x float]* %a_i, i64 0, i64 %tmp_12_cast
  %A_load = load float* %A_addr, align 4
  store float %A_load, float* %a_i_addr, align 4
  br label %3

; <label>:5                                       ; preds = %3
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1804, i32 %tmp_2) nounwind
  br label %1

.preheader:                                       ; preds = %1, %9
  %r1 = phi i2 [ %r_2, %9 ], [ 0, %1 ]
  %exitcond3 = icmp eq i2 %r1, -1
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %r_2 = add i2 %r1, 1
  br i1 %exitcond3, label %10, label %6

; <label>:6                                       ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1806) nounwind
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1806) nounwind
  %tmp_1_cast = zext i2 %r1 to i5
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r1, i2 0)
  %p_shl1_cast = zext i4 %tmp_s to i5
  %tmp_1 = sub i5 %p_shl1_cast, %tmp_1_cast
  br label %7

; <label>:7                                       ; preds = %8, %6
  %c2 = phi i2 [ 0, %6 ], [ %c_2, %8 ]
  %exitcond2 = icmp eq i2 %c2, -1
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %c_2 = add i2 %c2, 1
  br i1 %exitcond2, label %9, label %8

; <label>:8                                       ; preds = %7
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1807) nounwind
  %tmp_7_cast = zext i2 %c2 to i5
  %tmp_10 = add i5 %tmp_1, %tmp_7_cast
  %tmp_15_cast = sext i5 %tmp_10 to i64
  %B_addr = getelementptr [9 x float]* %B, i64 0, i64 %tmp_15_cast
  %b_i_addr = getelementptr [9 x float]* %b_i, i64 0, i64 %tmp_15_cast
  %B_load = load float* %B_addr, align 4
  store float %B_load, float* %b_i_addr, align 4
  br label %7

; <label>:9                                       ; preds = %7
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1806, i32 %tmp_4) nounwind
  br label %.preheader

; <label>:10                                      ; preds = %.preheader
  call fastcc void @matrix_multiply_top_matrix_multiply_alt2([9 x float]* %a_i, [9 x float]* %b_i, [9 x float]* %C_assign) nounwind
  br label %11

; <label>:11                                      ; preds = %15, %10
  %r3 = phi i2 [ 0, %10 ], [ %r_3, %15 ]
  %exitcond1 = icmp eq i2 %r3, -1
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %r_3 = add i2 %r3, 1
  br i1 %exitcond1, label %16, label %12

; <label>:12                                      ; preds = %11
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1808) nounwind
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1808) nounwind
  %tmp_5_cast = zext i2 %r3 to i5
  %tmp_5 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r3, i2 0)
  %p_shl2_cast = zext i4 %tmp_5 to i5
  %tmp_7 = sub i5 %p_shl2_cast, %tmp_5_cast
  br label %13

; <label>:13                                      ; preds = %14, %12
  %c4 = phi i2 [ 0, %12 ], [ %c_3, %14 ]
  %exitcond = icmp eq i2 %c4, -1
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  %c_3 = add i2 %c4, 1
  br i1 %exitcond, label %15, label %14

; <label>:14                                      ; preds = %13
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1809) nounwind
  %tmp_cast_10 = zext i2 %c4 to i5
  %tmp_11 = add i5 %tmp_7, %tmp_cast_10
  %tmp_16_cast = sext i5 %tmp_11 to i64
  %C_addr = getelementptr [9 x float]* %C, i64 0, i64 %tmp_16_cast
  %C_assign_addr = getelementptr [9 x float]* %C_assign, i64 0, i64 %tmp_16_cast
  %C_assign_load = load float* %C_assign_addr, align 4
  store float %C_assign_load, float* %C_addr, align 4
  br label %13

; <label>:15                                      ; preds = %13
  %empty_11 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1808, i32 %tmp_8) nounwind
  br label %11

; <label>:16                                      ; preds = %11
  ret void
}

define internal fastcc void @matrix_multiply_top_matrix_multiply_alt2([9 x float]* nocapture %A, [9 x float]* nocapture %B, [9 x float]* nocapture %C) {
  %sum_mult = alloca [9 x float], align 4
  br label %1

; <label>:1                                       ; preds = %ifBlock, %0
  %indvar_flatten1 = phi i5 [ 0, %0 ], [ %indvar_flatten_next1, %ifBlock ]
  %Col_assign_2 = phi i2 [ 0, %0 ], [ %tmp_i_i_mid2_v, %ifBlock ]
  %indvar_flatten = phi i4 [ 0, %0 ], [ %indvar_flatten_next, %ifBlock ]
  %Row_assign = phi i2 [ 0, %0 ], [ %tmp_1_mid2, %ifBlock ]
  %Col_assign = phi i2 [ 0, %0 ], [ %c, %ifBlock ]
  %exitcond_flatten1 = icmp eq i5 %indvar_flatten1, -5
  %indvar_flatten_next1 = add i5 %indvar_flatten1, 1
  br i1 %exitcond_flatten1, label %7, label %.reset7

; <label>:2                                       ; preds = %.reset7
  store float %mult, float* %sum_mult_addr, align 4
  br label %ifBlock

; <label>:3                                       ; preds = %.reset7
  %tmp_4 = fadd float %sum_mult_load, %mult
  br i1 %tmp_mid2_14, label %4, label %5

; <label>:4                                       ; preds = %3
  store float %tmp_4, float* %C_addr, align 4
  br label %6

; <label>:5                                       ; preds = %3
  store float %tmp_4, float* %sum_mult_addr, align 4
  br label %6

; <label>:6                                       ; preds = %5, %4
  br label %ifBlock

ifBlock:                                          ; preds = %6, %2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1807, i32 %tmp_5)
  %c = add i2 %Col_assign_mid2, 1
  %indvar_flatten_op = add i4 %indvar_flatten, 1
  %indvar_flatten_next = select i1 %exitcond_flatten, i4 1, i4 %indvar_flatten_op
  br label %1

.reset7:                                          ; preds = %1
  %k = add i2 %Col_assign_2, 1
  call void (...)* @_ssdm_op_SpecLoopName([33 x i8]* @a_col_loop_a_row_loop_b_col_lo)
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 27, i64 27, i64 27)
  %exitcond_flatten = icmp eq i4 %indvar_flatten, -7
  %Row_assign_mid = select i1 %exitcond_flatten, i2 0, i2 %Row_assign
  %tmp_mid1 = icmp eq i2 %k, 0
  %tmp3 = icmp eq i2 %Col_assign_2, 0
  %tmp_mid2 = select i1 %exitcond_flatten, i1 %tmp_mid1, i1 %tmp3
  %tmp_mid1_13 = icmp eq i2 %k, -2
  %tmp_2 = icmp eq i2 %Col_assign_2, -2
  %tmp_mid2_14 = select i1 %exitcond_flatten, i1 %tmp_mid1_13, i1 %tmp_2
  %tmp_i_i_mid2_v = select i1 %exitcond_flatten, i2 %k, i2 %Col_assign_2
  %tmp_i_i_mid2_cast = zext i2 %tmp_i_i_mid2_v to i5
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_i_i_mid2_v, i2 0)
  %p_shl1_cast = zext i4 %tmp_s to i5
  %tmp_12 = sub i5 %p_shl1_cast, %tmp_i_i_mid2_cast
  %not_exitcond_flatten = xor i1 %exitcond_flatten, true
  %exitcond = icmp eq i2 %Col_assign, -1
  %exitcond_mid = and i1 %exitcond, %not_exitcond_flatten
  %r = add i2 %Row_assign_mid, 1
  call void (...)* @_ssdm_op_SpecLoopName([22 x i8]* @a_row_loop_b_col_loop_str)
  %tmp_13 = or i1 %exitcond_mid, %exitcond_flatten
  %Col_assign_mid2 = select i1 %tmp_13, i2 0, i2 %Col_assign
  %tmp_1_mid2 = select i1 %exitcond_mid, i2 %r, i2 %Row_assign_mid
  %tmp_1_mid2_cast = zext i2 %tmp_1_mid2 to i5
  %tmp = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_1_mid2, i2 0)
  %p_shl_cast = zext i4 %tmp to i5
  %tmp_14 = sub i5 %p_shl_cast, %tmp_1_mid2_cast
  %tmp_15 = add i5 %tmp_i_i_mid2_cast, %tmp_14
  %tmp_22_cast = zext i5 %tmp_15 to i64
  %A_addr = getelementptr [9 x float]* %A, i64 0, i64 %tmp_22_cast
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1807) nounwind
  %tmp_5 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1807)
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1812) nounwind
  %cast_in_a = load float* %A_addr, align 4
  %tmp_i_i4_cast = zext i2 %Col_assign_mid2 to i5
  %tmp_16 = add i5 %tmp_i_i4_cast, %tmp_12
  %tmp_23_cast = sext i5 %tmp_16 to i64
  %B_addr = getelementptr [9 x float]* %B, i64 0, i64 %tmp_23_cast
  %tmp_17 = add i5 %tmp_i_i4_cast, %tmp_14
  %tmp_24_cast = zext i5 %tmp_17 to i64
  %C_addr = getelementptr [9 x float]* %C, i64 0, i64 %tmp_24_cast
  %sum_mult_addr = getelementptr [9 x float]* %sum_mult, i64 0, i64 %tmp_24_cast
  %cast_in_b = load float* %B_addr, align 4
  %mult = fmul float %cast_in_a, %cast_in_b
  %sum_mult_load = load float* %sum_mult_addr, align 4
  br i1 %tmp_mid2, label %2, label %3

; <label>:7                                       ; preds = %1
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2, i2) nounwind readnone {
entry:
  %empty = zext i2 %0 to i4
  %empty_15 = zext i2 %1 to i4
  %empty_16 = shl i4 %empty, 2
  %empty_17 = or i4 %empty_16, %empty_15
  ret i4 %empty_17
}

declare void @_GLOBAL__I_a() nounwind

!hls.encrypted.func = !{}
!llvm.map.gv = !{!0}

!0 = metadata !{metadata !1, [1 x i32]* @llvm_global_ctors_0}
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0, i32 31, metadata !3}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !"llvm.global_ctors.0", metadata !5, metadata !"", i32 0, i32 31}
!5 = metadata !{metadata !6}
!6 = metadata !{i32 0, i32 0, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"A", metadata !11, metadata !"float", i32 0, i32 31}
!11 = metadata !{metadata !12, metadata !12}
!12 = metadata !{i32 0, i32 2, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"B", metadata !11, metadata !"float", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 31, metadata !19}
!19 = metadata !{metadata !20}
!20 = metadata !{metadata !"C", metadata !11, metadata !"float", i32 0, i32 31}
