; ModuleID = 'C:/Users/vince/Desktop/Zynq_Stuff/Multiplication_Matrix/mul_matrix/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-w64-mingw32"

@matrix_multiply_top_str = internal unnamed_addr constant [20 x i8] c"matrix_multiply_top\00" ; [#uses=1 type=[20 x i8]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@a_row_loop_b_col_loop_str = internal unnamed_addr constant [22 x i8] c"a_row_loop_b_col_loop\00" ; [#uses=1 type=[22 x i8]*]
@a_col_loop_a_row_loop_b_col_lo = internal unnamed_addr constant [33 x i8] c"a_col_loop_a_row_loop_b_col_loop\00" ; [#uses=1 type=[33 x i8]*]
@p_str1812 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@p_str1809 = private unnamed_addr constant [11 x i8] c"c_col_loop\00", align 1 ; [#uses=1 type=[11 x i8]*]
@p_str1808 = private unnamed_addr constant [11 x i8] c"c_row_loop\00", align 1 ; [#uses=3 type=[11 x i8]*]
@p_str1807 = private unnamed_addr constant [11 x i8] c"b_col_loop\00", align 1 ; [#uses=4 type=[11 x i8]*]
@p_str1806 = private unnamed_addr constant [11 x i8] c"b_row_loop\00", align 1 ; [#uses=3 type=[11 x i8]*]
@p_str1805 = private unnamed_addr constant [11 x i8] c"a_col_loop\00", align 1 ; [#uses=1 type=[11 x i8]*]
@p_str1804 = private unnamed_addr constant [11 x i8] c"a_row_loop\00", align 1 ; [#uses=3 type=[11 x i8]*]

; [#uses=0]
define void @matrix_multiply_top([9 x float]* %A, [9 x float]* %B, [9 x float]* %C) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %A) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %B) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap([9 x float]* %C) nounwind, !map !17
  call void (...)* @_ssdm_op_SpecTopModule([20 x i8]* @matrix_multiply_top_str) nounwind
  %a_i = alloca [9 x float], align 4              ; [#uses=2 type=[9 x float]*]
  %b_i = alloca [9 x float], align 4              ; [#uses=2 type=[9 x float]*]
  %C_assign = alloca [9 x float], align 4         ; [#uses=2 type=[9 x float]*]
  call void @llvm.dbg.value(metadata !{[9 x float]* %A}, i64 0, metadata !21), !dbg !39 ; [debug line = 36:41] [debug variable = A]
  call void @llvm.dbg.value(metadata !{[9 x float]* %B}, i64 0, metadata !40), !dbg !41 ; [debug line = 37:36] [debug variable = B]
  call void @llvm.dbg.value(metadata !{[9 x float]* %C}, i64 0, metadata !42), !dbg !44 ; [debug line = 38:30] [debug variable = C]
  call void @llvm.dbg.declare(metadata !{[9 x float]* %a_i}, metadata !45), !dbg !47 ; [debug line = 40:12] [debug variable = a_i]
  call void @llvm.dbg.declare(metadata !{[9 x float]* %b_i}, metadata !48), !dbg !49 ; [debug line = 41:12] [debug variable = b_i]
  br label %1, !dbg !50                           ; [debug line = 45:28]

; <label>:1                                       ; preds = %5, %0
  %r = phi i2 [ 0, %0 ], [ %r_1, %5 ]             ; [#uses=4 type=i2]
  %exitcond5 = icmp eq i2 %r, -1, !dbg !50        ; [#uses=1 type=i1] [debug line = 45:28]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %r_1 = add i2 %r, 1, !dbg !52                   ; [#uses=1 type=i2] [debug line = 45:38]
  br i1 %exitcond5, label %.preheader, label %2, !dbg !50 ; [debug line = 45:28]

; <label>:2                                       ; preds = %1
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1804) nounwind, !dbg !53 ; [debug line = 45:44]
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1804) nounwind, !dbg !53 ; [#uses=1 type=i32] [debug line = 45:44]
  %tmp_cast = zext i2 %r to i5                    ; [#uses=1 type=i5]
  %tmp_6 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r, i2 0) ; [#uses=1 type=i4]
  %p_shl_cast = zext i4 %tmp_6 to i5, !dbg !55    ; [#uses=1 type=i5] [debug line = 47:7]
  %tmp_9 = sub i5 %p_shl_cast, %tmp_cast, !dbg !55 ; [#uses=1 type=i5] [debug line = 47:7]
  br label %3, !dbg !58                           ; [debug line = 46:30]

; <label>:3                                       ; preds = %4, %2
  %c = phi i2 [ 0, %2 ], [ %c_1, %4 ]             ; [#uses=3 type=i2]
  %exitcond4 = icmp eq i2 %c, -1, !dbg !58        ; [#uses=1 type=i1] [debug line = 46:30]
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %c_1 = add i2 %c, 1, !dbg !59                   ; [#uses=1 type=i2] [debug line = 46:40]
  br i1 %exitcond4, label %5, label %4, !dbg !58  ; [debug line = 46:30]

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1805) nounwind, !dbg !60 ; [debug line = 46:46]
  %tmp_3_cast = zext i2 %c to i5, !dbg !55        ; [#uses=1 type=i5] [debug line = 47:7]
  %tmp_3 = add i5 %tmp_9, %tmp_3_cast, !dbg !55   ; [#uses=1 type=i5] [debug line = 47:7]
  %tmp_12_cast = sext i5 %tmp_3 to i64, !dbg !55  ; [#uses=2 type=i64] [debug line = 47:7]
  %A_addr = getelementptr [9 x float]* %A, i64 0, i64 %tmp_12_cast, !dbg !55 ; [#uses=1 type=float*] [debug line = 47:7]
  %a_i_addr = getelementptr [9 x float]* %a_i, i64 0, i64 %tmp_12_cast, !dbg !55 ; [#uses=1 type=float*] [debug line = 47:7]
  %A_load = load float* %A_addr, align 4, !dbg !55 ; [#uses=1 type=float] [debug line = 47:7]
  store float %A_load, float* %a_i_addr, align 4, !dbg !55 ; [debug line = 47:7]
  call void @llvm.dbg.value(metadata !{i2 %c_1}, i64 0, metadata !61), !dbg !59 ; [debug line = 46:40] [debug variable = c]
  br label %3, !dbg !59                           ; [debug line = 46:40]

; <label>:5                                       ; preds = %3
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1804, i32 %tmp_2) nounwind, !dbg !63 ; [#uses=0 type=i32] [debug line = 49:3]
  call void @llvm.dbg.value(metadata !{i2 %r_1}, i64 0, metadata !64), !dbg !52 ; [debug line = 45:38] [debug variable = r]
  br label %1, !dbg !52                           ; [debug line = 45:38]

.preheader:                                       ; preds = %9, %1
  %r1 = phi i2 [ %r_2, %9 ], [ 0, %1 ]            ; [#uses=4 type=i2]
  %exitcond3 = icmp eq i2 %r1, -1, !dbg !65       ; [#uses=1 type=i1] [debug line = 50:28]
  %empty_5 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %r_2 = add i2 %r1, 1, !dbg !67                  ; [#uses=1 type=i2] [debug line = 50:38]
  br i1 %exitcond3, label %10, label %6, !dbg !65 ; [debug line = 50:28]

; <label>:6                                       ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1806) nounwind, !dbg !68 ; [debug line = 50:44]
  %tmp_4 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1806) nounwind, !dbg !68 ; [#uses=1 type=i32] [debug line = 50:44]
  %tmp_1_cast = zext i2 %r1 to i5                 ; [#uses=1 type=i5]
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r1, i2 0) ; [#uses=1 type=i4]
  %p_shl1_cast = zext i4 %tmp_s to i5, !dbg !70   ; [#uses=1 type=i5] [debug line = 52:7]
  %tmp_1 = sub i5 %p_shl1_cast, %tmp_1_cast, !dbg !70 ; [#uses=1 type=i5] [debug line = 52:7]
  br label %7, !dbg !73                           ; [debug line = 51:30]

; <label>:7                                       ; preds = %8, %6
  %c2 = phi i2 [ 0, %6 ], [ %c_2, %8 ]            ; [#uses=3 type=i2]
  %exitcond2 = icmp eq i2 %c2, -1, !dbg !73       ; [#uses=1 type=i1] [debug line = 51:30]
  %empty_6 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %c_2 = add i2 %c2, 1, !dbg !74                  ; [#uses=1 type=i2] [debug line = 51:40]
  br i1 %exitcond2, label %9, label %8, !dbg !73  ; [debug line = 51:30]

; <label>:8                                       ; preds = %7
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1807) nounwind, !dbg !75 ; [debug line = 51:46]
  %tmp_7_cast = zext i2 %c2 to i5, !dbg !70       ; [#uses=1 type=i5] [debug line = 52:7]
  %tmp_10 = add i5 %tmp_1, %tmp_7_cast, !dbg !70  ; [#uses=1 type=i5] [debug line = 52:7]
  %tmp_15_cast = sext i5 %tmp_10 to i64, !dbg !70 ; [#uses=2 type=i64] [debug line = 52:7]
  %B_addr = getelementptr [9 x float]* %B, i64 0, i64 %tmp_15_cast, !dbg !70 ; [#uses=1 type=float*] [debug line = 52:7]
  %b_i_addr = getelementptr [9 x float]* %b_i, i64 0, i64 %tmp_15_cast, !dbg !70 ; [#uses=1 type=float*] [debug line = 52:7]
  %B_load = load float* %B_addr, align 4, !dbg !70 ; [#uses=1 type=float] [debug line = 52:7]
  store float %B_load, float* %b_i_addr, align 4, !dbg !70 ; [debug line = 52:7]
  call void @llvm.dbg.value(metadata !{i2 %c_2}, i64 0, metadata !76), !dbg !74 ; [debug line = 51:40] [debug variable = c]
  br label %7, !dbg !74                           ; [debug line = 51:40]

; <label>:9                                       ; preds = %7
  %empty_7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1806, i32 %tmp_4) nounwind, !dbg !77 ; [#uses=0 type=i32] [debug line = 54:3]
  call void @llvm.dbg.value(metadata !{i2 %r_2}, i64 0, metadata !78), !dbg !67 ; [debug line = 50:38] [debug variable = r]
  br label %.preheader, !dbg !67                  ; [debug line = 50:38]

; <label>:10                                      ; preds = %.preheader
  call void @llvm.dbg.value(metadata !{[9 x float]* %a_i}, i64 0, metadata !79) nounwind, !dbg !116 ; [debug line = 541:40@57:3] [debug variable = A]
  call void @llvm.dbg.value(metadata !{[9 x float]* %b_i}, i64 0, metadata !117) nounwind, !dbg !118 ; [debug line = 542:40@57:3] [debug variable = B]
  call void @llvm.dbg.value(metadata !{[9 x float]* %a_i}, i64 0, metadata !119) nounwind, !dbg !132 ; [debug line = 486:44@548:5@57:3] [debug variable = A]
  call void @llvm.dbg.value(metadata !{[9 x float]* %b_i}, i64 0, metadata !133) nounwind, !dbg !134 ; [debug line = 487:44@548:5@57:3] [debug variable = B]
  call fastcc void @matrix_multiply_top_matrix_multiply_alt2([9 x float]* %a_i, [9 x float]* %b_i, [9 x float]* %C_assign) nounwind, !dbg !135 ; [debug line = 499:7@548:5@57:3]
  br label %11, !dbg !137                         ; [debug line = 60:28]

; <label>:11                                      ; preds = %15, %10
  %r3 = phi i2 [ 0, %10 ], [ %r_3, %15 ]          ; [#uses=4 type=i2]
  %exitcond1 = icmp eq i2 %r3, -1, !dbg !137      ; [#uses=1 type=i1] [debug line = 60:28]
  %empty_8 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %r_3 = add i2 %r3, 1, !dbg !139                 ; [#uses=1 type=i2] [debug line = 60:38]
  br i1 %exitcond1, label %16, label %12, !dbg !137 ; [debug line = 60:28]

; <label>:12                                      ; preds = %11
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1808) nounwind, !dbg !140 ; [debug line = 60:44]
  %tmp_8 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1808) nounwind, !dbg !140 ; [#uses=1 type=i32] [debug line = 60:44]
  %tmp_5_cast = zext i2 %r3 to i5                 ; [#uses=1 type=i5]
  %tmp_5 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %r3, i2 0) ; [#uses=1 type=i4]
  %p_shl2_cast = zext i4 %tmp_5 to i5, !dbg !142  ; [#uses=1 type=i5] [debug line = 62:7]
  %tmp_7 = sub i5 %p_shl2_cast, %tmp_5_cast, !dbg !142 ; [#uses=1 type=i5] [debug line = 62:7]
  br label %13, !dbg !145                         ; [debug line = 61:30]

; <label>:13                                      ; preds = %14, %12
  %c4 = phi i2 [ 0, %12 ], [ %c_3, %14 ]          ; [#uses=3 type=i2]
  %exitcond = icmp eq i2 %c4, -1, !dbg !145       ; [#uses=1 type=i1] [debug line = 61:30]
  %empty_9 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %c_3 = add i2 %c4, 1, !dbg !146                 ; [#uses=1 type=i2] [debug line = 61:40]
  br i1 %exitcond, label %15, label %14, !dbg !145 ; [debug line = 61:30]

; <label>:14                                      ; preds = %13
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1809) nounwind, !dbg !147 ; [debug line = 61:46]
  %tmp_cast_10 = zext i2 %c4 to i5, !dbg !142     ; [#uses=1 type=i5] [debug line = 62:7]
  %tmp_11 = add i5 %tmp_7, %tmp_cast_10, !dbg !142 ; [#uses=1 type=i5] [debug line = 62:7]
  %tmp_16_cast = sext i5 %tmp_11 to i64, !dbg !142 ; [#uses=2 type=i64] [debug line = 62:7]
  %C_addr = getelementptr [9 x float]* %C, i64 0, i64 %tmp_16_cast, !dbg !142 ; [#uses=1 type=float*] [debug line = 62:7]
  %C_assign_addr = getelementptr [9 x float]* %C_assign, i64 0, i64 %tmp_16_cast, !dbg !142 ; [#uses=1 type=float*] [debug line = 62:7]
  %C_assign_load = load float* %C_assign_addr, align 4, !dbg !142 ; [#uses=1 type=float] [debug line = 62:7]
  store float %C_assign_load, float* %C_addr, align 4, !dbg !142 ; [debug line = 62:7]
  call void @llvm.dbg.value(metadata !{i2 %c_3}, i64 0, metadata !148), !dbg !146 ; [debug line = 61:40] [debug variable = c]
  br label %13, !dbg !146                         ; [debug line = 61:40]

; <label>:15                                      ; preds = %13
  %empty_11 = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1808, i32 %tmp_8) nounwind, !dbg !149 ; [#uses=0 type=i32] [debug line = 64:3]
  call void @llvm.dbg.value(metadata !{i2 %r_3}, i64 0, metadata !150), !dbg !139 ; [debug line = 60:38] [debug variable = r]
  br label %11, !dbg !139                         ; [debug line = 60:38]

; <label>:16                                      ; preds = %11
  ret void, !dbg !151                             ; [debug line = 66:1]
}

; [#uses=1]
define internal fastcc void @matrix_multiply_top_matrix_multiply_alt2([9 x float]* nocapture %A, [9 x float]* nocapture %B, [9 x float]* nocapture %C) {
  %sum_mult = alloca [9 x float], align 4         ; [#uses=1 type=[9 x float]*]
  call void @llvm.dbg.value(metadata !{[9 x float]* %A}, i64 0, metadata !152), !dbg !154 ; [debug line = 290:45] [debug variable = A]
  call void @llvm.dbg.value(metadata !{[9 x float]* %B}, i64 0, metadata !155), !dbg !156 ; [debug line = 291:45] [debug variable = B]
  call void @llvm.dbg.value(metadata !{[9 x float]* %C}, i64 0, metadata !157), !dbg !159 ; [debug line = 292:40] [debug variable = C]
  call void @llvm.dbg.declare(metadata !{[9 x float]* %sum_mult}, metadata !160), !dbg !172 ; [debug line = 304:41] [debug variable = sum_mult]
  br label %1, !dbg !173                          ; [debug line = 310:28]

; <label>:1                                       ; preds = %ifBlock, %0
  %indvar_flatten1 = phi i5 [ 0, %0 ], [ %indvar_flatten_next1, %ifBlock ] ; [#uses=2 type=i5]
  %Col_assign_2 = phi i2 [ 0, %0 ], [ %tmp_i_i_mid2_v, %ifBlock ] ; [#uses=4 type=i2]
  %indvar_flatten = phi i4 [ 0, %0 ], [ %indvar_flatten_next, %ifBlock ] ; [#uses=2 type=i4]
  %Row_assign = phi i2 [ 0, %0 ], [ %tmp_1_mid2, %ifBlock ] ; [#uses=1 type=i2]
  %Col_assign = phi i2 [ 0, %0 ], [ %c, %ifBlock ] ; [#uses=2 type=i2]
  call void @llvm.dbg.value(metadata !{i2 %k}, i64 0, metadata !175), !dbg !176 ; [debug line = 310:65] [debug variable = k]
  %exitcond_flatten1 = icmp eq i5 %indvar_flatten1, -5 ; [#uses=1 type=i1]
  %indvar_flatten_next1 = add i5 %indvar_flatten1, 1 ; [#uses=1 type=i5]
  br i1 %exitcond_flatten1, label %7, label %.reset7

; <label>:2                                       ; preds = %.reset7
  store float %mult, float* %sum_mult_addr, align 4, !dbg !177 ; [debug line = 324:13]
  br label %ifBlock, !dbg !184                    ; [debug line = 325:11]

; <label>:3                                       ; preds = %.reset7
  %tmp_4 = fadd float %sum_mult_load, %mult, !dbg !185 ; [#uses=2 type=float] [debug line = 327:13]
  br i1 %tmp_mid2_14, label %4, label %5, !dbg !187 ; [debug line = 325:18]

; <label>:4                                       ; preds = %3
  store float %tmp_4, float* %C_addr, align 4, !dbg !185 ; [debug line = 327:13]
  br label %6, !dbg !188                          ; [debug line = 328:11]

; <label>:5                                       ; preds = %3
  store float %tmp_4, float* %sum_mult_addr, align 4, !dbg !189 ; [debug line = 330:13]
  br label %6

; <label>:6                                       ; preds = %5, %4
  br label %ifBlock

ifBlock:                                          ; preds = %6, %2
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([11 x i8]* @p_str1807, i32 %tmp_5), !dbg !191 ; [#uses=0 type=i32] [debug line = 332:9]
  %c = add i2 %Col_assign_mid2, 1, !dbg !192      ; [#uses=1 type=i2] [debug line = 312:72]
  call void @llvm.dbg.value(metadata !{i2 %c}, i64 0, metadata !193), !dbg !192 ; [debug line = 312:72] [debug variable = c]
  %indvar_flatten_op = add i4 %indvar_flatten, 1  ; [#uses=1 type=i4]
  %indvar_flatten_next = select i1 %exitcond_flatten, i4 1, i4 %indvar_flatten_op ; [#uses=1 type=i4]
  br label %1

.reset7:                                          ; preds = %1
  %k = add i2 %Col_assign_2, 1, !dbg !176         ; [#uses=3 type=i2] [debug line = 310:65]
  call void @llvm.dbg.value(metadata !{i2 %k}, i64 0, metadata !175), !dbg !176 ; [debug line = 310:65] [debug variable = k]
  call void (...)* @_ssdm_op_SpecLoopName([33 x i8]* @a_col_loop_a_row_loop_b_col_lo)
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 27, i64 27, i64 27) ; [#uses=0 type=i32]
  %exitcond_flatten = icmp eq i4 %indvar_flatten, -7 ; [#uses=7 type=i1]
  %Row_assign_mid = select i1 %exitcond_flatten, i2 0, i2 %Row_assign ; [#uses=2 type=i2]
  %tmp_mid1 = icmp eq i2 %k, 0, !dbg !194         ; [#uses=1 type=i1] [debug line = 322:11]
  %tmp3 = icmp eq i2 %Col_assign_2, 0, !dbg !194  ; [#uses=1 type=i1] [debug line = 322:11]
  %tmp_mid2 = select i1 %exitcond_flatten, i1 %tmp_mid1, i1 %tmp3, !dbg !194 ; [#uses=1 type=i1] [debug line = 322:11]
  %tmp_mid1_13 = icmp eq i2 %k, -2, !dbg !187     ; [#uses=1 type=i1] [debug line = 325:18]
  %tmp_2 = icmp eq i2 %Col_assign_2, -2, !dbg !187 ; [#uses=1 type=i1] [debug line = 325:18]
  %tmp_mid2_14 = select i1 %exitcond_flatten, i1 %tmp_mid1_13, i1 %tmp_2, !dbg !187 ; [#uses=1 type=i1] [debug line = 325:18]
  %tmp_i_i_mid2_v = select i1 %exitcond_flatten, i2 %k, i2 %Col_assign_2, !dbg !195 ; [#uses=3 type=i2] [debug line = 60:7@99:12@316:23]
  %tmp_i_i_mid2_cast = zext i2 %tmp_i_i_mid2_v to i5 ; [#uses=2 type=i5]
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_i_i_mid2_v, i2 0) ; [#uses=1 type=i4]
  %p_shl1_cast = zext i4 %tmp_s to i5, !dbg !204  ; [#uses=1 type=i5] [debug line = 60:7@99:12@317:23]
  %tmp_12 = sub i5 %p_shl1_cast, %tmp_i_i_mid2_cast, !dbg !204 ; [#uses=1 type=i5] [debug line = 60:7@99:12@317:23]
  %not_exitcond_flatten = xor i1 %exitcond_flatten, true, !dbg !207 ; [#uses=1 type=i1] [debug line = 312:35]
  %exitcond = icmp eq i2 %Col_assign, -1, !dbg !207 ; [#uses=1 type=i1] [debug line = 312:35]
  %exitcond_mid = and i1 %exitcond, %not_exitcond_flatten, !dbg !207 ; [#uses=2 type=i1] [debug line = 312:35]
  %r = add i2 %Row_assign_mid, 1, !dbg !208       ; [#uses=1 type=i2] [debug line = 311:70]
  call void @llvm.dbg.value(metadata !{i2 %r}, i64 0, metadata !209), !dbg !208 ; [debug line = 311:70] [debug variable = r]
  call void (...)* @_ssdm_op_SpecLoopName([22 x i8]* @a_row_loop_b_col_loop_str)
  %tmp_13 = or i1 %exitcond_mid, %exitcond_flatten ; [#uses=1 type=i1]
  %Col_assign_mid2 = select i1 %tmp_13, i2 0, i2 %Col_assign ; [#uses=2 type=i2]
  %tmp_1_mid2 = select i1 %exitcond_mid, i2 %r, i2 %Row_assign_mid, !dbg !177 ; [#uses=3 type=i2] [debug line = 324:13]
  %tmp_1_mid2_cast = zext i2 %tmp_1_mid2 to i5, !dbg !177 ; [#uses=1 type=i5] [debug line = 324:13]
  %tmp = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %tmp_1_mid2, i2 0) ; [#uses=1 type=i4]
  %p_shl_cast = zext i4 %tmp to i5, !dbg !195     ; [#uses=1 type=i5] [debug line = 60:7@99:12@316:23]
  %tmp_14 = sub i5 %p_shl_cast, %tmp_1_mid2_cast, !dbg !195 ; [#uses=2 type=i5] [debug line = 60:7@99:12@316:23]
  %tmp_15 = add i5 %tmp_i_i_mid2_cast, %tmp_14, !dbg !195 ; [#uses=1 type=i5] [debug line = 60:7@99:12@316:23]
  %tmp_22_cast = zext i5 %tmp_15 to i64, !dbg !195 ; [#uses=1 type=i64] [debug line = 60:7@99:12@316:23]
  %A_addr = getelementptr [9 x float]* %A, i64 0, i64 %tmp_22_cast, !dbg !195 ; [#uses=1 type=float*] [debug line = 60:7@99:12@316:23]
  call void (...)* @_ssdm_op_SpecLoopName([11 x i8]* @p_str1807) nounwind, !dbg !210 ; [debug line = 312:78]
  %tmp_5 = call i32 (...)* @_ssdm_op_SpecRegionBegin([11 x i8]* @p_str1807), !dbg !210 ; [#uses=1 type=i32] [debug line = 312:78]
  call void (...)* @_ssdm_op_SpecPipeline(i32 1, i32 1, i32 1, i32 0, [1 x i8]* @p_str1812) nounwind, !dbg !211 ; [debug line = 313:1]
  call void @llvm.dbg.value(metadata !{[9 x float]* %A}, i64 0, metadata !212), !dbg !213 ; [debug line = 96:46@316:23] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i2 %Row_assign}, i64 0, metadata !214), !dbg !215 ; [debug line = 96:73@316:23] [debug variable = Row]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign_2}, i64 0, metadata !216), !dbg !217 ; [debug line = 96:87@316:23] [debug variable = Col]
  call void @llvm.dbg.value(metadata !{[9 x float]* %A}, i64 0, metadata !218), !dbg !219 ; [debug line = 57:49@99:12@316:23] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i2 %Row_assign}, i64 0, metadata !220), !dbg !221 ; [debug line = 57:76@99:12@316:23] [debug variable = Row]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign_2}, i64 0, metadata !222), !dbg !223 ; [debug line = 57:90@99:12@316:23] [debug variable = Col]
  %cast_in_a = load float* %A_addr, align 4, !dbg !195 ; [#uses=1 type=float] [debug line = 60:7@99:12@316:23]
  call void @llvm.dbg.value(metadata !{float %cast_in_a}, i64 0, metadata !224), !dbg !203 ; [debug line = 316:23] [debug variable = cast_in_a]
  call void @llvm.dbg.value(metadata !{[9 x float]* %B}, i64 0, metadata !226), !dbg !227 ; [debug line = 96:46@317:23] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign_2}, i64 0, metadata !228), !dbg !229 ; [debug line = 96:73@317:23] [debug variable = Row]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign}, i64 0, metadata !230), !dbg !231 ; [debug line = 96:87@317:23] [debug variable = Col]
  call void @llvm.dbg.value(metadata !{[9 x float]* %B}, i64 0, metadata !232), !dbg !233 ; [debug line = 57:49@99:12@317:23] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign_2}, i64 0, metadata !234), !dbg !235 ; [debug line = 57:76@99:12@317:23] [debug variable = Row]
  call void @llvm.dbg.value(metadata !{i2 %Col_assign}, i64 0, metadata !236), !dbg !237 ; [debug line = 57:90@99:12@317:23] [debug variable = Col]
  %tmp_i_i4_cast = zext i2 %Col_assign_mid2 to i5, !dbg !204 ; [#uses=2 type=i5] [debug line = 60:7@99:12@317:23]
  %tmp_16 = add i5 %tmp_i_i4_cast, %tmp_12, !dbg !204 ; [#uses=1 type=i5] [debug line = 60:7@99:12@317:23]
  %tmp_23_cast = sext i5 %tmp_16 to i64, !dbg !204 ; [#uses=1 type=i64] [debug line = 60:7@99:12@317:23]
  %B_addr = getelementptr [9 x float]* %B, i64 0, i64 %tmp_23_cast, !dbg !204 ; [#uses=1 type=float*] [debug line = 60:7@99:12@317:23]
  %tmp_17 = add i5 %tmp_i_i4_cast, %tmp_14, !dbg !185 ; [#uses=1 type=i5] [debug line = 327:13]
  %tmp_24_cast = zext i5 %tmp_17 to i64, !dbg !185 ; [#uses=2 type=i64] [debug line = 327:13]
  %C_addr = getelementptr [9 x float]* %C, i64 0, i64 %tmp_24_cast, !dbg !185 ; [#uses=1 type=float*] [debug line = 327:13]
  %sum_mult_addr = getelementptr [9 x float]* %sum_mult, i64 0, i64 %tmp_24_cast ; [#uses=3 type=float*]
  %cast_in_b = load float* %B_addr, align 4, !dbg !204 ; [#uses=1 type=float] [debug line = 60:7@99:12@317:23]
  call void @llvm.dbg.value(metadata !{float %cast_in_b}, i64 0, metadata !238), !dbg !206 ; [debug line = 317:23] [debug variable = cast_in_b]
  %mult = fmul float %cast_in_a, %cast_in_b, !dbg !239 ; [#uses=2 type=float] [debug line = 318:11]
  call void @llvm.dbg.value(metadata !{float %mult}, i64 0, metadata !240), !dbg !239 ; [debug line = 318:11] [debug variable = mult]
  call void @llvm.dbg.value(metadata !{float %mult}, i64 0, metadata !246), !dbg !247 ; [debug line = 320:11] [debug variable = recast_mult]
  %sum_mult_load = load float* %sum_mult_addr, align 4, !dbg !185 ; [#uses=1 type=float] [debug line = 327:13]
  br i1 %tmp_mid2, label %2, label %3, !dbg !194  ; [debug line = 322:11]

; <label>:7                                       ; preds = %1
  ret void, !dbg !248                             ; [debug line = 335:3]
}

; [#uses=36]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=4]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=4]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak void @_ssdm_op_SpecPipeline(...) nounwind {
entry:
  ret void
}

; [#uses=7]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=9]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=5]
define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2, i2) nounwind readnone {
entry:
  %empty = zext i2 %0 to i4                       ; [#uses=1 type=i4]
  %empty_15 = zext i2 %1 to i4                    ; [#uses=1 type=i4]
  %empty_16 = shl i4 %empty, 2                    ; [#uses=1 type=i4]
  %empty_17 = or i4 %empty_16, %empty_15          ; [#uses=1 type=i4]
  ret i4 %empty_17
}

; [#uses=1]
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
!21 = metadata !{i32 786689, metadata !22, metadata !"A", null, i32 36, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 786478, i32 0, metadata !23, metadata !"matrix_multiply_top", metadata !"matrix_multiply_top", metadata !"_Z19matrix_multiply_topPA3_KfS1_PA3_f", metadata !23, i32 36, metadata !24, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !35, i32 38} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 786473, metadata !"mul_matrix/main.cpp", metadata !"C:\5CUsers\5Cvince\5CDesktop\5CZynq_Stuff\5CMultiplication_Matrix", null} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{null, metadata !26, metadata !26, metadata !33}
!26 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !28, metadata !31, i32 0, i32 0} ; [ DW_TAG_array_type ]
!28 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ]
!29 = metadata !{i32 786454, null, metadata !"MATRIX_T", metadata !23, i32 45, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!30 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!31 = metadata !{metadata !32}
!32 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !29, metadata !31, i32 0, i32 0} ; [ DW_TAG_array_type ]
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!37 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !28, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!38 = metadata !{metadata !32, metadata !32}
!39 = metadata !{i32 36, i32 41, metadata !22, null}
!40 = metadata !{i32 786689, metadata !22, metadata !"B", null, i32 37, metadata !37, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 37, i32 36, metadata !22, null}
!42 = metadata !{i32 786689, metadata !22, metadata !"C", null, i32 38, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!43 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !29, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!44 = metadata !{i32 38, i32 30, metadata !22, null}
!45 = metadata !{i32 786688, metadata !46, metadata !"a_i", metadata !23, i32 40, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!46 = metadata !{i32 786443, metadata !22, i32 38, i32 48, metadata !23, i32 0} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 40, i32 12, metadata !46, null}
!48 = metadata !{i32 786688, metadata !46, metadata !"b_i", metadata !23, i32 41, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 41, i32 12, metadata !46, null}
!50 = metadata !{i32 45, i32 28, metadata !51, null}
!51 = metadata !{i32 786443, metadata !46, i32 45, i32 16, metadata !23, i32 1} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 45, i32 38, metadata !51, null}
!53 = metadata !{i32 45, i32 44, metadata !54, null}
!54 = metadata !{i32 786443, metadata !51, i32 45, i32 43, metadata !23, i32 2} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 47, i32 7, metadata !56, null}
!56 = metadata !{i32 786443, metadata !57, i32 46, i32 45, metadata !23, i32 4} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 786443, metadata !54, i32 46, i32 18, metadata !23, i32 3} ; [ DW_TAG_lexical_block ]
!58 = metadata !{i32 46, i32 30, metadata !57, null}
!59 = metadata !{i32 46, i32 40, metadata !57, null}
!60 = metadata !{i32 46, i32 46, metadata !56, null}
!61 = metadata !{i32 786688, metadata !57, metadata !"c", metadata !23, i32 46, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!63 = metadata !{i32 49, i32 3, metadata !54, null}
!64 = metadata !{i32 786688, metadata !51, metadata !"r", metadata !23, i32 45, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 50, i32 28, metadata !66, null}
!66 = metadata !{i32 786443, metadata !46, i32 50, i32 16, metadata !23, i32 5} ; [ DW_TAG_lexical_block ]
!67 = metadata !{i32 50, i32 38, metadata !66, null}
!68 = metadata !{i32 50, i32 44, metadata !69, null}
!69 = metadata !{i32 786443, metadata !66, i32 50, i32 43, metadata !23, i32 6} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 52, i32 7, metadata !71, null}
!71 = metadata !{i32 786443, metadata !72, i32 51, i32 45, metadata !23, i32 8} ; [ DW_TAG_lexical_block ]
!72 = metadata !{i32 786443, metadata !69, i32 51, i32 18, metadata !23, i32 7} ; [ DW_TAG_lexical_block ]
!73 = metadata !{i32 51, i32 30, metadata !72, null}
!74 = metadata !{i32 51, i32 40, metadata !72, null}
!75 = metadata !{i32 51, i32 46, metadata !71, null}
!76 = metadata !{i32 786688, metadata !72, metadata !"c", metadata !23, i32 51, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!77 = metadata !{i32 54, i32 3, metadata !69, null}
!78 = metadata !{i32 786688, metadata !66, metadata !"r", metadata !23, i32 50, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!79 = metadata !{i32 786689, metadata !80, metadata !"A", null, i32 541, metadata !114, i32 0, metadata !115} ; [ DW_TAG_arg_variable ]
!80 = metadata !{i32 786478, i32 0, metadata !81, metadata !"matrix_multiply<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, float, float>", metadata !"matrix_multiply<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, float, float>", metadata !"_ZN3hls15matrix_multiplyINS_11NoTransposeES1_Li3ELi3ELi3ELi3ELi3ELi3EffEEvPAT2__KT7_PAT4__S3_PAT6__T8_", metadata !82, i32 541, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, metadata !90, null, metadata !35, i32 544} ; [ DW_TAG_subprogram ]
!81 = metadata !{i32 786489, null, metadata !"hls", metadata !82, i32 67} ; [ DW_TAG_namespace ]
!82 = metadata !{i32 786473, metadata !"C:/Vivado/Vivado_HLS/2016.2/common/technology/autopilot/hls/linear_algebra/hls_matrix_multiply.h", metadata !"C:\5CUsers\5Cvince\5CDesktop\5CZynq_Stuff\5CMultiplication_Matrix", null} ; [ DW_TAG_file_type ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!84 = metadata !{null, metadata !85, metadata !85, metadata !88}
!85 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !86} ; [ DW_TAG_pointer_type ]
!86 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !87, metadata !31, i32 0, i32 0} ; [ DW_TAG_array_type ]
!87 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ]
!88 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_pointer_type ]
!89 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !30, metadata !31, i32 0, i32 0} ; [ DW_TAG_array_type ]
!90 = metadata !{metadata !91, metadata !108, metadata !101, metadata !102, metadata !109, metadata !110, metadata !111, metadata !112, metadata !103, metadata !113}
!91 = metadata !{i32 786479, null, metadata !"TransposeFormA", metadata !92, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!92 = metadata !{i32 786434, metadata !93, metadata !"NoTranspose", metadata !94, i32 51, i64 8, i64 8, i32 0, i32 0, null, metadata !95, i32 0, null, null} ; [ DW_TAG_class_type ]
!93 = metadata !{i32 786489, null, metadata !"hls", metadata !94, i32 47} ; [ DW_TAG_namespace ]
!94 = metadata !{i32 786473, metadata !"C:/Vivado/Vivado_HLS/2016.2/common/technology/autopilot\5Chls/linear_algebra/utils/x_hls_matrix_utils.h", metadata !"C:\5CUsers\5Cvince\5CDesktop\5CZynq_Stuff\5CMultiplication_Matrix", null} ; [ DW_TAG_file_type ]
!95 = metadata !{metadata !96, metadata !104}
!96 = metadata !{i32 786478, i32 0, metadata !92, metadata !"GetElement<3, 3, float>", metadata !"GetElement<3, 3, float>", metadata !"_ZN3hls11NoTranspose10GetElementILi3ELi3EfEET1_PAT0__KS2_jj", metadata !94, i32 57, metadata !97, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, metadata !100, i32 0, metadata !35, i32 57} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!98 = metadata !{metadata !30, metadata !85, metadata !99, metadata !99}
!99 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!100 = metadata !{metadata !101, metadata !102, metadata !103}
!101 = metadata !{i32 786480, null, metadata !"RowsA", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!102 = metadata !{i32 786480, null, metadata !"ColsA", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!103 = metadata !{i32 786479, null, metadata !"InputType", metadata !30, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!104 = metadata !{i32 786478, i32 0, metadata !92, metadata !"NoTranspose", metadata !"NoTranspose", metadata !"", metadata !94, i32 64, metadata !105, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !35, i32 64} ; [ DW_TAG_subprogram ]
!105 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !106, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!106 = metadata !{null, metadata !107}
!107 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !92} ; [ DW_TAG_pointer_type ]
!108 = metadata !{i32 786479, null, metadata !"TransposeFormB", metadata !92, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!109 = metadata !{i32 786480, null, metadata !"RowsB", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!110 = metadata !{i32 786480, null, metadata !"ColsB", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!111 = metadata !{i32 786480, null, metadata !"RowsC", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!112 = metadata !{i32 786480, null, metadata !"ColsC", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!113 = metadata !{i32 786479, null, metadata !"OutputType", metadata !30, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!114 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !87, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!115 = metadata !{i32 57, i32 3, metadata !46, null}
!116 = metadata !{i32 541, i32 40, metadata !80, metadata !115}
!117 = metadata !{i32 786689, metadata !80, metadata !"B", null, i32 542, metadata !114, i32 0, metadata !115} ; [ DW_TAG_arg_variable ]
!118 = metadata !{i32 542, i32 40, metadata !80, metadata !115}
!119 = metadata !{i32 786689, metadata !120, metadata !"A", null, i32 486, metadata !114, i32 0, metadata !130} ; [ DW_TAG_arg_variable ]
!120 = metadata !{i32 786478, i32 0, metadata !81, metadata !"matrix_multiply_top<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, hls::matrix_multiply_traits<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, float, float>, float, float>", metadata !"matrix_multiply_top<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, hls::matrix_multiply_traits<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, float, float>, float, float>", metadata !"_ZN3hls19matrix_multiply_topINS_11NoTransposeES1_Li3ELi3ELi3ELi3ELi3ELi3ENS_22matrix_multiply_traitsIS1_S1_Li3ELi3ELi3ELi3EffEEffEEvPAT2__KT8_PAT4__S5_PAT6__T9_", metadata !82, i32 486, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, metadata !121, null, metadata !35, i32 489} ; [ DW_TAG_subprogram ]
!121 = metadata !{metadata !91, metadata !108, metadata !101, metadata !102, metadata !109, metadata !110, metadata !111, metadata !112, metadata !122, metadata !103, metadata !113}
!122 = metadata !{i32 786479, null, metadata !"MULTIPLIER_TRAITS", metadata !123, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!123 = metadata !{i32 786434, metadata !81, metadata !"matrix_multiply_traits<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, float, float>", metadata !82, i32 80, i64 8, i64 8, i32 0, i32 0, null, metadata !124, i32 0, null, metadata !129} ; [ DW_TAG_class_type ]
!124 = metadata !{metadata !125}
!125 = metadata !{i32 786478, i32 0, metadata !123, metadata !"matrix_multiply_traits", metadata !"matrix_multiply_traits", metadata !"", metadata !82, i32 101, metadata !126, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !35, i32 101} ; [ DW_TAG_subprogram ]
!126 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !127, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!127 = metadata !{null, metadata !128}
!128 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !123} ; [ DW_TAG_pointer_type ]
!129 = metadata !{metadata !91, metadata !108, metadata !101, metadata !102, metadata !109, metadata !110, metadata !103, metadata !113}
!130 = metadata !{i32 548, i32 5, metadata !131, metadata !115}
!131 = metadata !{i32 786443, metadata !80, i32 544, i32 3, metadata !82, i32 13} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 486, i32 44, metadata !120, metadata !130}
!133 = metadata !{i32 786689, metadata !120, metadata !"B", null, i32 487, metadata !114, i32 0, metadata !130} ; [ DW_TAG_arg_variable ]
!134 = metadata !{i32 487, i32 44, metadata !120, metadata !130}
!135 = metadata !{i32 499, i32 7, metadata !136, metadata !130}
!136 = metadata !{i32 786443, metadata !120, i32 489, i32 3, metadata !82, i32 14} ; [ DW_TAG_lexical_block ]
!137 = metadata !{i32 60, i32 28, metadata !138, null}
!138 = metadata !{i32 786443, metadata !46, i32 60, i32 16, metadata !23, i32 9} ; [ DW_TAG_lexical_block ]
!139 = metadata !{i32 60, i32 38, metadata !138, null}
!140 = metadata !{i32 60, i32 44, metadata !141, null}
!141 = metadata !{i32 786443, metadata !138, i32 60, i32 43, metadata !23, i32 10} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 62, i32 7, metadata !143, null}
!143 = metadata !{i32 786443, metadata !144, i32 61, i32 45, metadata !23, i32 12} ; [ DW_TAG_lexical_block ]
!144 = metadata !{i32 786443, metadata !141, i32 61, i32 18, metadata !23, i32 11} ; [ DW_TAG_lexical_block ]
!145 = metadata !{i32 61, i32 30, metadata !144, null}
!146 = metadata !{i32 61, i32 40, metadata !144, null}
!147 = metadata !{i32 61, i32 46, metadata !143, null}
!148 = metadata !{i32 786688, metadata !144, metadata !"c", metadata !23, i32 61, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!149 = metadata !{i32 64, i32 3, metadata !141, null}
!150 = metadata !{i32 786688, metadata !138, metadata !"r", metadata !23, i32 60, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!151 = metadata !{i32 66, i32 1, metadata !46, null}
!152 = metadata !{i32 786689, metadata !153, metadata !"A", null, i32 290, metadata !114, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!153 = metadata !{i32 786478, i32 0, metadata !81, metadata !"matrix_multiply_alt2<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, hls::matrix_multiply_traits<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, float, float>, float, float>", metadata !"matrix_multiply_alt2<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, 3, 3, hls::matrix_multiply_traits<hls::NoTranspose, hls::NoTranspose, 3, 3, 3, 3, float, float>, float, float>", metadata !"_ZN3hls20matrix_multiply_alt2INS_11NoTransposeES1_Li3ELi3ELi3ELi3ELi3ELi3ENS_22matrix_multiply_traitsIS1_S1_Li3ELi3ELi3ELi3EffEEffEEvPAT2__KT8_PAT4__S5_PAT6__T9_", metadata !82, i32 290, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, metadata !121, null, metadata !35, i32 293} ; [ DW_TAG_subprogram ]
!154 = metadata !{i32 290, i32 45, metadata !153, null}
!155 = metadata !{i32 786689, metadata !153, metadata !"B", null, i32 291, metadata !114, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!156 = metadata !{i32 291, i32 45, metadata !153, null}
!157 = metadata !{i32 786689, metadata !153, metadata !"C", null, i32 292, metadata !158, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!158 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !30, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!159 = metadata !{i32 292, i32 40, metadata !153, null}
!160 = metadata !{i32 786688, metadata !161, metadata !"sum_mult", metadata !82, i32 304, metadata !162, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!161 = metadata !{i32 786443, metadata !153, i32 293, i32 3, metadata !82, i32 15} ; [ DW_TAG_lexical_block ]
!162 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 288, i64 32, i32 0, i32 0, metadata !163, metadata !38, i32 0, i32 0} ; [ DW_TAG_array_type ]
!163 = metadata !{i32 786454, metadata !123, metadata !"ACCUM_T", metadata !82, i32 90, i64 0, i64 0, i64 0, i32 0, metadata !164} ; [ DW_TAG_typedef ]
!164 = metadata !{i32 786454, metadata !165, metadata !"ACCUM_T", metadata !82, i32 234, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!165 = metadata !{i32 786434, metadata !166, metadata !"x_traits_d_default<float, 3>", metadata !167, i32 233, i64 8, i64 8, i32 0, i32 0, null, metadata !168, i32 0, null, metadata !169} ; [ DW_TAG_class_type ]
!166 = metadata !{i32 786489, null, metadata !"hls", metadata !167, i32 40} ; [ DW_TAG_namespace ]
!167 = metadata !{i32 786473, metadata !"C:/Vivado/Vivado_HLS/2016.2/common/technology/autopilot\5Chls/utils/x_hls_traits.h", metadata !"C:\5CUsers\5Cvince\5CDesktop\5CZynq_Stuff\5CMultiplication_Matrix", null} ; [ DW_TAG_file_type ]
!168 = metadata !{i32 0}
!169 = metadata !{metadata !170, metadata !171}
!170 = metadata !{i32 786479, null, metadata !"T1", metadata !30, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!171 = metadata !{i32 786480, null, metadata !"DIM", metadata !62, i64 3, null, i32 0, i32 0} ; [ DW_TAG_template_value_parameter ]
!172 = metadata !{i32 304, i32 41, metadata !161, null}
!173 = metadata !{i32 310, i32 28, metadata !174, null}
!174 = metadata !{i32 786443, metadata !161, i32 310, i32 14, metadata !82, i32 16} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 786688, metadata !174, metadata !"k", metadata !82, i32 310, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!176 = metadata !{i32 310, i32 65, metadata !174, null}
!177 = metadata !{i32 324, i32 13, metadata !178, null}
!178 = metadata !{i32 786443, metadata !179, i32 322, i32 21, metadata !82, i32 22} ; [ DW_TAG_lexical_block ]
!179 = metadata !{i32 786443, metadata !180, i32 312, i32 77, metadata !82, i32 21} ; [ DW_TAG_lexical_block ]
!180 = metadata !{i32 786443, metadata !181, i32 312, i32 21, metadata !82, i32 20} ; [ DW_TAG_lexical_block ]
!181 = metadata !{i32 786443, metadata !182, i32 311, i32 75, metadata !82, i32 19} ; [ DW_TAG_lexical_block ]
!182 = metadata !{i32 786443, metadata !183, i32 311, i32 19, metadata !82, i32 18} ; [ DW_TAG_lexical_block ]
!183 = metadata !{i32 786443, metadata !174, i32 310, i32 70, metadata !82, i32 17} ; [ DW_TAG_lexical_block ]
!184 = metadata !{i32 325, i32 11, metadata !178, null}
!185 = metadata !{i32 327, i32 13, metadata !186, null}
!186 = metadata !{i32 786443, metadata !179, i32 325, i32 58, metadata !82, i32 23} ; [ DW_TAG_lexical_block ]
!187 = metadata !{i32 325, i32 18, metadata !179, null}
!188 = metadata !{i32 328, i32 11, metadata !186, null}
!189 = metadata !{i32 330, i32 13, metadata !190, null}
!190 = metadata !{i32 786443, metadata !179, i32 328, i32 18, metadata !82, i32 24} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 332, i32 9, metadata !179, null}
!192 = metadata !{i32 312, i32 72, metadata !180, null}
!193 = metadata !{i32 786688, metadata !180, metadata !"c", metadata !82, i32 312, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!194 = metadata !{i32 322, i32 11, metadata !179, null}
!195 = metadata !{i32 60, i32 7, metadata !196, metadata !198}
!196 = metadata !{i32 786443, metadata !197, i32 58, i32 5, metadata !94, i32 26} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 786478, i32 0, metadata !93, metadata !"GetElement<3, 3, float>", metadata !"GetElement<3, 3, float>", metadata !"_ZN3hls11NoTranspose10GetElementILi3ELi3EfEET1_PAT0__KS2_jj", metadata !94, i32 57, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, metadata !100, metadata !96, metadata !35, i32 58} ; [ DW_TAG_subprogram ]
!198 = metadata !{i32 99, i32 12, metadata !199, metadata !203}
!199 = metadata !{i32 786443, metadata !200, i32 97, i32 3, metadata !94, i32 25} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 786478, i32 0, metadata !93, metadata !"GetMatrixElement<hls::NoTranspose, 3, 3, float>", metadata !"GetMatrixElement<hls::NoTranspose, 3, 3, float>", metadata !"_ZN3hls16GetMatrixElementINS_11NoTransposeELi3ELi3EfEET2_PAT1__KS2_jj", metadata !94, i32 96, metadata !97, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, metadata !201, null, metadata !35, i32 97} ; [ DW_TAG_subprogram ]
!201 = metadata !{metadata !202, metadata !101, metadata !102, metadata !103}
!202 = metadata !{i32 786479, null, metadata !"TransposeForm", metadata !92, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!203 = metadata !{i32 316, i32 23, metadata !179, null}
!204 = metadata !{i32 60, i32 7, metadata !196, metadata !205}
!205 = metadata !{i32 99, i32 12, metadata !199, metadata !206}
!206 = metadata !{i32 317, i32 23, metadata !179, null}
!207 = metadata !{i32 312, i32 35, metadata !180, null}
!208 = metadata !{i32 311, i32 70, metadata !182, null}
!209 = metadata !{i32 786688, metadata !182, metadata !"r", metadata !82, i32 311, metadata !62, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!210 = metadata !{i32 312, i32 78, metadata !179, null}
!211 = metadata !{i32 313, i32 1, metadata !179, null}
!212 = metadata !{i32 786689, metadata !200, metadata !"A", null, i32 96, metadata !114, i32 0, metadata !203} ; [ DW_TAG_arg_variable ]
!213 = metadata !{i32 96, i32 46, metadata !200, metadata !203}
!214 = metadata !{i32 786689, metadata !200, metadata !"Row", metadata !94, i32 33554528, metadata !99, i32 0, metadata !203} ; [ DW_TAG_arg_variable ]
!215 = metadata !{i32 96, i32 73, metadata !200, metadata !203}
!216 = metadata !{i32 786689, metadata !200, metadata !"Col", metadata !94, i32 50331744, metadata !99, i32 0, metadata !203} ; [ DW_TAG_arg_variable ]
!217 = metadata !{i32 96, i32 87, metadata !200, metadata !203}
!218 = metadata !{i32 786689, metadata !197, metadata !"A", null, i32 57, metadata !114, i32 0, metadata !198} ; [ DW_TAG_arg_variable ]
!219 = metadata !{i32 57, i32 49, metadata !197, metadata !198}
!220 = metadata !{i32 786689, metadata !197, metadata !"Row", metadata !94, i32 33554489, metadata !99, i32 0, metadata !198} ; [ DW_TAG_arg_variable ]
!221 = metadata !{i32 57, i32 76, metadata !197, metadata !198}
!222 = metadata !{i32 786689, metadata !197, metadata !"Col", metadata !94, i32 50331705, metadata !99, i32 0, metadata !198} ; [ DW_TAG_arg_variable ]
!223 = metadata !{i32 57, i32 90, metadata !197, metadata !198}
!224 = metadata !{i32 786688, metadata !161, metadata !"cast_in_a", metadata !82, i32 301, metadata !225, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!225 = metadata !{i32 786454, metadata !123, metadata !"INPUT_T", metadata !82, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!226 = metadata !{i32 786689, metadata !200, metadata !"A", null, i32 96, metadata !114, i32 0, metadata !206} ; [ DW_TAG_arg_variable ]
!227 = metadata !{i32 96, i32 46, metadata !200, metadata !206}
!228 = metadata !{i32 786689, metadata !200, metadata !"Row", metadata !94, i32 33554528, metadata !99, i32 0, metadata !206} ; [ DW_TAG_arg_variable ]
!229 = metadata !{i32 96, i32 73, metadata !200, metadata !206}
!230 = metadata !{i32 786689, metadata !200, metadata !"Col", metadata !94, i32 50331744, metadata !99, i32 0, metadata !206} ; [ DW_TAG_arg_variable ]
!231 = metadata !{i32 96, i32 87, metadata !200, metadata !206}
!232 = metadata !{i32 786689, metadata !197, metadata !"A", null, i32 57, metadata !114, i32 0, metadata !205} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 57, i32 49, metadata !197, metadata !205}
!234 = metadata !{i32 786689, metadata !197, metadata !"Row", metadata !94, i32 33554489, metadata !99, i32 0, metadata !205} ; [ DW_TAG_arg_variable ]
!235 = metadata !{i32 57, i32 76, metadata !197, metadata !205}
!236 = metadata !{i32 786689, metadata !197, metadata !"Col", metadata !94, i32 50331705, metadata !99, i32 0, metadata !205} ; [ DW_TAG_arg_variable ]
!237 = metadata !{i32 57, i32 90, metadata !197, metadata !205}
!238 = metadata !{i32 786688, metadata !161, metadata !"cast_in_b", metadata !82, i32 301, metadata !225, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!239 = metadata !{i32 318, i32 11, metadata !179, null}
!240 = metadata !{i32 786688, metadata !161, metadata !"mult", metadata !82, i32 302, metadata !241, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!241 = metadata !{i32 786454, metadata !123, metadata !"MULT_T", metadata !82, i32 89, i64 0, i64 0, i64 0, i32 0, metadata !242} ; [ DW_TAG_typedef ]
!242 = metadata !{i32 786454, metadata !243, metadata !"MULT_T", metadata !82, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!243 = metadata !{i32 786434, metadata !166, metadata !"x_traits_default<float>", metadata !167, i32 44, i64 8, i64 8, i32 0, i32 0, null, metadata !168, i32 0, null, metadata !244} ; [ DW_TAG_class_type ]
!244 = metadata !{metadata !245}
!245 = metadata !{i32 786479, null, metadata !"T", metadata !30, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!246 = metadata !{i32 786688, metadata !161, metadata !"recast_mult", metadata !82, i32 303, metadata !163, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!247 = metadata !{i32 320, i32 11, metadata !179, null}
!248 = metadata !{i32 335, i32 3, metadata !161, null}
