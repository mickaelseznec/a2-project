// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="matrix_multiply_top,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=9.646000,HLS_SYN_LAT=115,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=5,HLS_SYN_FF=963,HLS_SYN_LUT=978}" *)

module matrix_multiply_top (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_address0,
        A_ce0,
        A_q0,
        B_address0,
        B_ce0,
        B_q0,
        C_address0,
        C_ce0,
        C_we0,
        C_d0
);

parameter    ap_ST_st1_fsm_0 = 11'b1;
parameter    ap_ST_st2_fsm_1 = 11'b10;
parameter    ap_ST_st3_fsm_2 = 11'b100;
parameter    ap_ST_st4_fsm_3 = 11'b1000;
parameter    ap_ST_st5_fsm_4 = 11'b10000;
parameter    ap_ST_st6_fsm_5 = 11'b100000;
parameter    ap_ST_st7_fsm_6 = 11'b1000000;
parameter    ap_ST_st8_fsm_7 = 11'b10000000;
parameter    ap_ST_st9_fsm_8 = 11'b100000000;
parameter    ap_ST_st10_fsm_9 = 11'b1000000000;
parameter    ap_ST_st11_fsm_10 = 11'b10000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_9 = 32'b1001;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv2_3 = 2'b11;
parameter    ap_const_lv2_1 = 2'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] A_address0;
output   A_ce0;
input  [31:0] A_q0;
output  [3:0] B_address0;
output   B_ce0;
input  [31:0] B_q0;
output  [3:0] C_address0;
output   C_ce0;
output   C_we0;
output  [31:0] C_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_ce0;
reg B_ce0;
reg C_ce0;
reg C_we0;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_26;
wire   [1:0] r_1_fu_211_p2;
reg   [1:0] r_1_reg_388;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_59;
wire   [4:0] tmp_9_fu_233_p2;
reg   [4:0] tmp_9_reg_393;
wire   [0:0] exitcond5_fu_205_p2;
wire   [1:0] c_1_fu_245_p2;
reg   [1:0] c_1_reg_401;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_74;
wire  signed [63:0] tmp_12_cast_fu_260_p1;
reg  signed [63:0] tmp_12_cast_reg_406;
wire   [0:0] exitcond4_fu_239_p2;
wire   [1:0] r_2_fu_271_p2;
reg   [1:0] r_2_reg_419;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_90;
wire   [4:0] tmp_1_fu_293_p2;
reg   [4:0] tmp_1_reg_424;
wire   [0:0] exitcond3_fu_265_p2;
wire   [1:0] c_2_fu_305_p2;
reg   [1:0] c_2_reg_432;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_104;
wire  signed [63:0] tmp_15_cast_fu_320_p1;
reg  signed [63:0] tmp_15_cast_reg_437;
wire   [0:0] exitcond2_fu_299_p2;
wire   [1:0] r_3_fu_331_p2;
reg   [1:0] r_3_reg_450;
reg    ap_sig_cseq_ST_st9_fsm_8;
reg    ap_sig_120;
wire   [4:0] tmp_7_fu_353_p2;
reg   [4:0] tmp_7_reg_455;
wire   [0:0] exitcond1_fu_325_p2;
wire   [1:0] c_3_fu_365_p2;
reg   [1:0] c_3_reg_463;
reg    ap_sig_cseq_ST_st10_fsm_9;
reg    ap_sig_134;
wire  signed [63:0] tmp_16_cast_fu_380_p1;
reg  signed [63:0] tmp_16_cast_reg_468;
wire   [0:0] exitcond_fu_359_p2;
reg   [3:0] a_i_address0;
reg    a_i_ce0;
reg    a_i_we0;
wire   [31:0] a_i_q0;
reg   [3:0] b_i_address0;
reg    b_i_ce0;
reg    b_i_we0;
wire   [31:0] b_i_q0;
reg   [3:0] C_assign_address0;
reg    C_assign_ce0;
wire   [31:0] C_assign_q0;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_idle;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready;
wire   [3:0] grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0;
wire   [3:0] grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0;
wire   [3:0] grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0;
wire    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0;
wire   [31:0] grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0;
reg   [1:0] r_reg_132;
reg   [1:0] c_reg_143;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_202;
reg   [1:0] r1_reg_154;
reg   [1:0] c2_reg_165;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_217;
reg   [1:0] r3_reg_176;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_226;
reg   [1:0] c4_reg_187;
reg    ap_sig_cseq_ST_st11_fsm_10;
reg    ap_sig_240;
reg    ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start;
wire   [3:0] tmp_6_fu_221_p3;
wire   [4:0] p_shl_cast_fu_229_p1;
wire   [4:0] tmp_cast_fu_217_p1;
wire   [4:0] tmp_3_cast_fu_251_p1;
wire   [4:0] tmp_3_fu_255_p2;
wire   [3:0] tmp_s_fu_281_p3;
wire   [4:0] p_shl1_cast_fu_289_p1;
wire   [4:0] tmp_1_cast_fu_277_p1;
wire   [4:0] tmp_7_cast_fu_311_p1;
wire   [4:0] tmp_10_fu_315_p2;
wire   [3:0] tmp_5_fu_341_p3;
wire   [4:0] p_shl2_cast_fu_349_p1;
wire   [4:0] tmp_5_cast_fu_337_p1;
wire   [4:0] tmp_cast_10_fu_371_p1;
wire   [4:0] tmp_11_fu_375_p2;
reg   [10:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'b1;
#0 ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start = 1'b0;
end

matrix_multiply_top_a_i #(
    .DataWidth( 32 ),
    .AddressRange( 9 ),
    .AddressWidth( 4 ))
a_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(a_i_address0),
    .ce0(a_i_ce0),
    .we0(a_i_we0),
    .d0(A_q0),
    .q0(a_i_q0)
);

matrix_multiply_top_a_i #(
    .DataWidth( 32 ),
    .AddressRange( 9 ),
    .AddressWidth( 4 ))
b_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(b_i_address0),
    .ce0(b_i_ce0),
    .we0(b_i_we0),
    .d0(B_q0),
    .q0(b_i_q0)
);

matrix_multiply_top_a_i #(
    .DataWidth( 32 ),
    .AddressRange( 9 ),
    .AddressWidth( 4 ))
C_assign_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(C_assign_address0),
    .ce0(C_assign_ce0),
    .we0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0),
    .d0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0),
    .q0(C_assign_q0)
);

matrix_multiply_top_matrix_multiply_alt2 grp_matrix_multiply_top_matrix_multiply_alt2_fu_198(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start),
    .ap_done(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done),
    .ap_idle(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_idle),
    .ap_ready(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready),
    .A_address0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0),
    .A_ce0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0),
    .A_q0(a_i_q0),
    .B_address0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0),
    .B_ce0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0),
    .B_q0(b_i_q0),
    .C_address0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0),
    .C_ce0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0),
    .C_we0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0),
    .C_d0(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & ~(1'b0 == exitcond3_fu_265_p2))) begin
            ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= 1'b1;
        end else if ((1'b1 == grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready)) begin
            ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        c2_reg_165 <= c_2_reg_432;
    end else if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond3_fu_265_p2))) begin
        c2_reg_165 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        c4_reg_187 <= c_3_reg_463;
    end else if (((1'b1 == ap_sig_cseq_ST_st9_fsm_8) & (1'b0 == exitcond1_fu_325_p2))) begin
        c4_reg_187 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        c_reg_143 <= c_1_reg_401;
    end else if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_205_p2 == 1'b0))) begin
        c_reg_143 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(exitcond5_fu_205_p2 == 1'b0))) begin
        r1_reg_154 <= ap_const_lv2_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(1'b0 == exitcond2_fu_299_p2))) begin
        r1_reg_154 <= r_2_reg_419;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st10_fsm_9) & ~(1'b0 == exitcond_fu_359_p2))) begin
        r3_reg_176 <= r_3_reg_450;
    end else if (((1'b1 == ap_sig_cseq_ST_st8_fsm_7) & ~(1'b0 == grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done))) begin
        r3_reg_176 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == exitcond4_fu_239_p2))) begin
        r_reg_132 <= r_1_reg_388;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        r_reg_132 <= ap_const_lv2_0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        c_1_reg_401 <= c_1_fu_245_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        c_2_reg_432 <= c_2_fu_305_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        c_3_reg_463 <= c_3_fu_365_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        r_1_reg_388 <= r_1_fu_211_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        r_2_reg_419 <= r_2_fu_271_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st9_fsm_8)) begin
        r_3_reg_450 <= r_3_fu_331_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (1'b0 == exitcond4_fu_239_p2))) begin
        tmp_12_cast_reg_406 <= tmp_12_cast_fu_260_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond2_fu_299_p2))) begin
        tmp_15_cast_reg_437 <= tmp_15_cast_fu_320_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st10_fsm_9) & (1'b0 == exitcond_fu_359_p2))) begin
        tmp_16_cast_reg_468 <= tmp_16_cast_fu_380_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond3_fu_265_p2))) begin
        tmp_1_reg_424 <= tmp_1_fu_293_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st9_fsm_8) & (1'b0 == exitcond1_fu_325_p2))) begin
        tmp_7_reg_455 <= tmp_7_fu_353_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (exitcond5_fu_205_p2 == 1'b0))) begin
        tmp_9_reg_393 <= tmp_9_fu_233_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        B_ce0 = 1'b1;
    end else begin
        B_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        C_assign_address0 = tmp_16_cast_fu_380_p1;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        C_assign_address0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0;
    end else begin
        C_assign_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        C_assign_ce0 = 1'b1;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        C_assign_ce0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0;
    end else begin
        C_assign_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        C_ce0 = 1'b1;
    end else begin
        C_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        C_we0 = 1'b1;
    end else begin
        C_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        a_i_address0 = tmp_12_cast_reg_406;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        a_i_address0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0;
    end else begin
        a_i_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        a_i_ce0 = 1'b1;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        a_i_ce0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0;
    end else begin
        a_i_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        a_i_we0 = 1'b1;
    end else begin
        a_i_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st9_fsm_8) & ~(1'b0 == exitcond1_fu_325_p2))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st9_fsm_8) & ~(1'b0 == exitcond1_fu_325_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_134) begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_240) begin
        ap_sig_cseq_ST_st11_fsm_10 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st11_fsm_10 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_26) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_59) begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_74) begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_202) begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_90) begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_104) begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_217) begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_226) begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_120) begin
        ap_sig_cseq_ST_st9_fsm_8 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st9_fsm_8 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        b_i_address0 = tmp_15_cast_reg_437;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        b_i_address0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0;
    end else begin
        b_i_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        b_i_ce0 = 1'b1;
    end else if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        b_i_ce0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0;
    end else begin
        b_i_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st7_fsm_6)) begin
        b_i_we0 = 1'b1;
    end else begin
        b_i_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : begin
            if ((exitcond5_fu_205_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        ap_ST_st3_fsm_2 : begin
            if (~(1'b0 == exitcond4_fu_239_p2)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        ap_ST_st4_fsm_3 : begin
            ap_NS_fsm = ap_ST_st3_fsm_2;
        end
        ap_ST_st5_fsm_4 : begin
            if ((1'b0 == exitcond3_fu_265_p2)) begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end else begin
                ap_NS_fsm = ap_ST_st8_fsm_7;
            end
        end
        ap_ST_st6_fsm_5 : begin
            if (~(1'b0 == exitcond2_fu_299_p2)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end
        end
        ap_ST_st7_fsm_6 : begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st8_fsm_7 : begin
            if (~(1'b0 == grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done)) begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end else begin
                ap_NS_fsm = ap_ST_st8_fsm_7;
            end
        end
        ap_ST_st9_fsm_8 : begin
            if (~(1'b0 == exitcond1_fu_325_p2)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st10_fsm_9;
            end
        end
        ap_ST_st10_fsm_9 : begin
            if (~(1'b0 == exitcond_fu_359_p2)) begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end else begin
                ap_NS_fsm = ap_ST_st11_fsm_10;
            end
        end
        ap_ST_st11_fsm_10 : begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_address0 = tmp_12_cast_fu_260_p1;

assign B_address0 = tmp_15_cast_fu_320_p1;

assign C_address0 = tmp_16_cast_reg_468;

assign C_d0 = C_assign_q0;

always @ (*) begin
    ap_sig_104 = (1'b1 == ap_CS_fsm[ap_const_lv32_5]);
end

always @ (*) begin
    ap_sig_120 = (1'b1 == ap_CS_fsm[ap_const_lv32_8]);
end

always @ (*) begin
    ap_sig_134 = (1'b1 == ap_CS_fsm[ap_const_lv32_9]);
end

always @ (*) begin
    ap_sig_202 = (1'b1 == ap_CS_fsm[ap_const_lv32_3]);
end

always @ (*) begin
    ap_sig_217 = (1'b1 == ap_CS_fsm[ap_const_lv32_6]);
end

always @ (*) begin
    ap_sig_226 = (1'b1 == ap_CS_fsm[ap_const_lv32_7]);
end

always @ (*) begin
    ap_sig_240 = (1'b1 == ap_CS_fsm[ap_const_lv32_A]);
end

always @ (*) begin
    ap_sig_26 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_59 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

always @ (*) begin
    ap_sig_74 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

always @ (*) begin
    ap_sig_90 = (1'b1 == ap_CS_fsm[ap_const_lv32_4]);
end

assign c_1_fu_245_p2 = (c_reg_143 + ap_const_lv2_1);

assign c_2_fu_305_p2 = (c2_reg_165 + ap_const_lv2_1);

assign c_3_fu_365_p2 = (c4_reg_187 + ap_const_lv2_1);

assign exitcond1_fu_325_p2 = ((r3_reg_176 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign exitcond2_fu_299_p2 = ((c2_reg_165 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign exitcond3_fu_265_p2 = ((r1_reg_154 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign exitcond4_fu_239_p2 = ((c_reg_143 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign exitcond5_fu_205_p2 = ((r_reg_132 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign exitcond_fu_359_p2 = ((c4_reg_187 == ap_const_lv2_3) ? 1'b1 : 1'b0);

assign grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start = ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start;

assign p_shl1_cast_fu_289_p1 = tmp_s_fu_281_p3;

assign p_shl2_cast_fu_349_p1 = tmp_5_fu_341_p3;

assign p_shl_cast_fu_229_p1 = tmp_6_fu_221_p3;

assign r_1_fu_211_p2 = (r_reg_132 + ap_const_lv2_1);

assign r_2_fu_271_p2 = (r1_reg_154 + ap_const_lv2_1);

assign r_3_fu_331_p2 = (r3_reg_176 + ap_const_lv2_1);

assign tmp_10_fu_315_p2 = (tmp_1_reg_424 + tmp_7_cast_fu_311_p1);

assign tmp_11_fu_375_p2 = (tmp_7_reg_455 + tmp_cast_10_fu_371_p1);

assign tmp_12_cast_fu_260_p1 = $signed(tmp_3_fu_255_p2);

assign tmp_15_cast_fu_320_p1 = $signed(tmp_10_fu_315_p2);

assign tmp_16_cast_fu_380_p1 = $signed(tmp_11_fu_375_p2);

assign tmp_1_cast_fu_277_p1 = r1_reg_154;

assign tmp_1_fu_293_p2 = (p_shl1_cast_fu_289_p1 - tmp_1_cast_fu_277_p1);

assign tmp_3_cast_fu_251_p1 = c_reg_143;

assign tmp_3_fu_255_p2 = (tmp_9_reg_393 + tmp_3_cast_fu_251_p1);

assign tmp_5_cast_fu_337_p1 = r3_reg_176;

assign tmp_5_fu_341_p3 = {{r3_reg_176}, {ap_const_lv2_0}};

assign tmp_6_fu_221_p3 = {{r_reg_132}, {ap_const_lv2_0}};

assign tmp_7_cast_fu_311_p1 = c2_reg_165;

assign tmp_7_fu_353_p2 = (p_shl2_cast_fu_349_p1 - tmp_5_cast_fu_337_p1);

assign tmp_9_fu_233_p2 = (p_shl_cast_fu_229_p1 - tmp_cast_fu_217_p1);

assign tmp_cast_10_fu_371_p1 = c4_reg_187;

assign tmp_cast_fu_217_p1 = r_reg_132;

assign tmp_s_fu_281_p3 = {{r1_reg_154}, {ap_const_lv2_0}};

endmodule //matrix_multiply_top