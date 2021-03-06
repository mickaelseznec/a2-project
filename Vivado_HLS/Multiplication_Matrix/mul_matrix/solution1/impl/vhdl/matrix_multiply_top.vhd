-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matrix_multiply_top is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    A_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    B_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    B_ce0 : OUT STD_LOGIC;
    B_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    C_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
    C_ce0 : OUT STD_LOGIC;
    C_we0 : OUT STD_LOGIC;
    C_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of matrix_multiply_top is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "matrix_multiply_top,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=9.646000,HLS_SYN_LAT=115,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=5,HLS_SYN_FF=963,HLS_SYN_LUT=978}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (10 downto 0) := "00000000010";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (10 downto 0) := "00000000100";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (10 downto 0) := "00000001000";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (10 downto 0) := "00000010000";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (10 downto 0) := "00000100000";
    constant ap_ST_st7_fsm_6 : STD_LOGIC_VECTOR (10 downto 0) := "00001000000";
    constant ap_ST_st8_fsm_7 : STD_LOGIC_VECTOR (10 downto 0) := "00010000000";
    constant ap_ST_st9_fsm_8 : STD_LOGIC_VECTOR (10 downto 0) := "00100000000";
    constant ap_ST_st10_fsm_9 : STD_LOGIC_VECTOR (10 downto 0) := "01000000000";
    constant ap_ST_st11_fsm_10 : STD_LOGIC_VECTOR (10 downto 0) := "10000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_A : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001010";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (10 downto 0) := "00000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_26 : BOOLEAN;
    signal r_1_fu_211_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal r_1_reg_388 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_59 : BOOLEAN;
    signal tmp_9_fu_233_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_9_reg_393 : STD_LOGIC_VECTOR (4 downto 0);
    signal exitcond5_fu_205_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_1_fu_245_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal c_1_reg_401 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st3_fsm_2 : STD_LOGIC;
    signal ap_sig_74 : BOOLEAN;
    signal tmp_12_cast_fu_260_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_12_cast_reg_406 : STD_LOGIC_VECTOR (63 downto 0);
    signal exitcond4_fu_239_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_2_fu_271_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal r_2_reg_419 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st5_fsm_4 : STD_LOGIC;
    signal ap_sig_90 : BOOLEAN;
    signal tmp_1_fu_293_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_1_reg_424 : STD_LOGIC_VECTOR (4 downto 0);
    signal exitcond3_fu_265_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_2_fu_305_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal c_2_reg_432 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st6_fsm_5 : STD_LOGIC;
    signal ap_sig_104 : BOOLEAN;
    signal tmp_15_cast_fu_320_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_15_cast_reg_437 : STD_LOGIC_VECTOR (63 downto 0);
    signal exitcond2_fu_299_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal r_3_fu_331_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal r_3_reg_450 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st9_fsm_8 : STD_LOGIC;
    signal ap_sig_120 : BOOLEAN;
    signal tmp_7_fu_353_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_7_reg_455 : STD_LOGIC_VECTOR (4 downto 0);
    signal exitcond1_fu_325_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal c_3_fu_365_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal c_3_reg_463 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st10_fsm_9 : STD_LOGIC;
    signal ap_sig_134 : BOOLEAN;
    signal tmp_16_cast_fu_380_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_16_cast_reg_468 : STD_LOGIC_VECTOR (63 downto 0);
    signal exitcond_fu_359_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal a_i_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal a_i_ce0 : STD_LOGIC;
    signal a_i_we0 : STD_LOGIC;
    signal a_i_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal b_i_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal b_i_ce0 : STD_LOGIC;
    signal b_i_we0 : STD_LOGIC;
    signal b_i_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal C_assign_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal C_assign_ce0 : STD_LOGIC;
    signal C_assign_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_idle : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0 : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0 : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0 : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0 : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0 : STD_LOGIC;
    signal grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal r_reg_132 : STD_LOGIC_VECTOR (1 downto 0);
    signal c_reg_143 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st4_fsm_3 : STD_LOGIC;
    signal ap_sig_202 : BOOLEAN;
    signal r1_reg_154 : STD_LOGIC_VECTOR (1 downto 0);
    signal c2_reg_165 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st7_fsm_6 : STD_LOGIC;
    signal ap_sig_217 : BOOLEAN;
    signal r3_reg_176 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st8_fsm_7 : STD_LOGIC;
    signal ap_sig_226 : BOOLEAN;
    signal c4_reg_187 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_sig_cseq_ST_st11_fsm_10 : STD_LOGIC;
    signal ap_sig_240 : BOOLEAN;
    signal ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start : STD_LOGIC := '0';
    signal tmp_6_fu_221_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_shl_cast_fu_229_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_cast_fu_217_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_3_cast_fu_251_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_3_fu_255_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_s_fu_281_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_shl1_cast_fu_289_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_1_cast_fu_277_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_7_cast_fu_311_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_10_fu_315_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_5_fu_341_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal p_shl2_cast_fu_349_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_5_cast_fu_337_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_cast_10_fu_371_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal tmp_11_fu_375_p2 : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (10 downto 0);

    component matrix_multiply_top_matrix_multiply_alt2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        A_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        A_ce0 : OUT STD_LOGIC;
        A_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        B_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        B_ce0 : OUT STD_LOGIC;
        B_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        C_address0 : OUT STD_LOGIC_VECTOR (3 downto 0);
        C_ce0 : OUT STD_LOGIC;
        C_we0 : OUT STD_LOGIC;
        C_d0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component matrix_multiply_top_a_i IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (3 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    a_i_U : component matrix_multiply_top_a_i
    generic map (
        DataWidth => 32,
        AddressRange => 9,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => a_i_address0,
        ce0 => a_i_ce0,
        we0 => a_i_we0,
        d0 => A_q0,
        q0 => a_i_q0);

    b_i_U : component matrix_multiply_top_a_i
    generic map (
        DataWidth => 32,
        AddressRange => 9,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => b_i_address0,
        ce0 => b_i_ce0,
        we0 => b_i_we0,
        d0 => B_q0,
        q0 => b_i_q0);

    C_assign_U : component matrix_multiply_top_a_i
    generic map (
        DataWidth => 32,
        AddressRange => 9,
        AddressWidth => 4)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => C_assign_address0,
        ce0 => C_assign_ce0,
        we0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0,
        d0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0,
        q0 => C_assign_q0);

    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198 : component matrix_multiply_top_matrix_multiply_alt2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start,
        ap_done => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done,
        ap_idle => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_idle,
        ap_ready => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready,
        A_address0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0,
        A_ce0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0,
        A_q0 => a_i_q0,
        B_address0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0,
        B_ce0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0,
        B_q0 => b_i_q0,
        C_address0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0,
        C_ce0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0,
        C_we0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_we0,
        C_d0 => grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_d0);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_4) and not((ap_const_lv1_0 = exitcond3_fu_265_p2)))) then 
                    ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_ready)) then 
                    ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    c2_reg_165_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_6)) then 
                c2_reg_165 <= c_2_reg_432;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_4) and (ap_const_lv1_0 = exitcond3_fu_265_p2))) then 
                c2_reg_165 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    c4_reg_187_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st11_fsm_10)) then 
                c4_reg_187 <= c_3_reg_463;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8) and (ap_const_lv1_0 = exitcond1_fu_325_p2))) then 
                c4_reg_187 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    c_reg_143_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
                c_reg_143 <= c_1_reg_401;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond5_fu_205_p2 = ap_const_lv1_0))) then 
                c_reg_143 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    r1_reg_154_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((exitcond5_fu_205_p2 = ap_const_lv1_0)))) then 
                r1_reg_154 <= ap_const_lv2_0;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5) and not((ap_const_lv1_0 = exitcond2_fu_299_p2)))) then 
                r1_reg_154 <= r_2_reg_419;
            end if; 
        end if;
    end process;

    r3_reg_176_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st10_fsm_9) and not((ap_const_lv1_0 = exitcond_fu_359_p2)))) then 
                r3_reg_176 <= r_3_reg_450;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7) and not((ap_const_logic_0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done)))) then 
                r3_reg_176 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;

    r_reg_132_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and not((ap_const_lv1_0 = exitcond4_fu_239_p2)))) then 
                r_reg_132 <= r_1_reg_388;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                r_reg_132 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then
                c_1_reg_401 <= c_1_fu_245_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5)) then
                c_2_reg_432 <= c_2_fu_305_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st10_fsm_9)) then
                c_3_reg_463 <= c_3_fu_365_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1)) then
                r_1_reg_388 <= r_1_fu_211_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_4)) then
                r_2_reg_419 <= r_2_fu_271_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8)) then
                r_3_reg_450 <= r_3_fu_331_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and (ap_const_lv1_0 = exitcond4_fu_239_p2))) then
                tmp_12_cast_reg_406 <= tmp_12_cast_fu_260_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5) and (ap_const_lv1_0 = exitcond2_fu_299_p2))) then
                tmp_15_cast_reg_437 <= tmp_15_cast_fu_320_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st10_fsm_9) and (ap_const_lv1_0 = exitcond_fu_359_p2))) then
                tmp_16_cast_reg_468 <= tmp_16_cast_fu_380_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_4) and (ap_const_lv1_0 = exitcond3_fu_265_p2))) then
                tmp_1_reg_424 <= tmp_1_fu_293_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8) and (ap_const_lv1_0 = exitcond1_fu_325_p2))) then
                tmp_7_reg_455 <= tmp_7_fu_353_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (exitcond5_fu_205_p2 = ap_const_lv1_0))) then
                tmp_9_reg_393 <= tmp_9_fu_233_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, exitcond5_fu_205_p2, exitcond4_fu_239_p2, exitcond3_fu_265_p2, exitcond2_fu_299_p2, exitcond1_fu_325_p2, exitcond_fu_359_p2, grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if ((exitcond5_fu_205_p2 = ap_const_lv1_0)) then
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                else
                    ap_NS_fsm <= ap_ST_st5_fsm_4;
                end if;
            when ap_ST_st3_fsm_2 => 
                if (not((ap_const_lv1_0 = exitcond4_fu_239_p2))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st3_fsm_2;
            when ap_ST_st5_fsm_4 => 
                if ((ap_const_lv1_0 = exitcond3_fu_265_p2)) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                end if;
            when ap_ST_st6_fsm_5 => 
                if (not((ap_const_lv1_0 = exitcond2_fu_299_p2))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_4;
                else
                    ap_NS_fsm <= ap_ST_st7_fsm_6;
                end if;
            when ap_ST_st7_fsm_6 => 
                ap_NS_fsm <= ap_ST_st6_fsm_5;
            when ap_ST_st8_fsm_7 => 
                if (not((ap_const_logic_0 = grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_done))) then
                    ap_NS_fsm <= ap_ST_st9_fsm_8;
                else
                    ap_NS_fsm <= ap_ST_st8_fsm_7;
                end if;
            when ap_ST_st9_fsm_8 => 
                if (not((ap_const_lv1_0 = exitcond1_fu_325_p2))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st10_fsm_9;
                end if;
            when ap_ST_st10_fsm_9 => 
                if (not((ap_const_lv1_0 = exitcond_fu_359_p2))) then
                    ap_NS_fsm <= ap_ST_st9_fsm_8;
                else
                    ap_NS_fsm <= ap_ST_st11_fsm_10;
                end if;
            when ap_ST_st11_fsm_10 => 
                ap_NS_fsm <= ap_ST_st10_fsm_9;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXXX";
        end case;
    end process;
    A_address0 <= tmp_12_cast_fu_260_p1(4 - 1 downto 0);

    A_ce0_assign_proc : process(ap_sig_cseq_ST_st3_fsm_2)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
            A_ce0 <= ap_const_logic_1;
        else 
            A_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    B_address0 <= tmp_15_cast_fu_320_p1(4 - 1 downto 0);

    B_ce0_assign_proc : process(ap_sig_cseq_ST_st6_fsm_5)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5)) then 
            B_ce0 <= ap_const_logic_1;
        else 
            B_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    C_address0 <= tmp_16_cast_reg_468(4 - 1 downto 0);

    C_assign_address0_assign_proc : process(ap_sig_cseq_ST_st10_fsm_9, tmp_16_cast_fu_380_p1, grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st10_fsm_9)) then 
            C_assign_address0 <= tmp_16_cast_fu_380_p1(4 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            C_assign_address0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_address0;
        else 
            C_assign_address0 <= "XXXX";
        end if; 
    end process;


    C_assign_ce0_assign_proc : process(ap_sig_cseq_ST_st10_fsm_9, grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st10_fsm_9)) then 
            C_assign_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            C_assign_ce0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_C_ce0;
        else 
            C_assign_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    C_ce0_assign_proc : process(ap_sig_cseq_ST_st11_fsm_10)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st11_fsm_10)) then 
            C_ce0 <= ap_const_logic_1;
        else 
            C_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    C_d0 <= C_assign_q0;

    C_we0_assign_proc : process(ap_sig_cseq_ST_st11_fsm_10)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st11_fsm_10))) then 
            C_we0 <= ap_const_logic_1;
        else 
            C_we0 <= ap_const_logic_0;
        end if; 
    end process;


    a_i_address0_assign_proc : process(tmp_12_cast_reg_406, grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0, ap_sig_cseq_ST_st4_fsm_3, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
            a_i_address0 <= tmp_12_cast_reg_406(4 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            a_i_address0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_address0;
        else 
            a_i_address0 <= "XXXX";
        end if; 
    end process;


    a_i_ce0_assign_proc : process(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0, ap_sig_cseq_ST_st4_fsm_3, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
            a_i_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            a_i_ce0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_A_ce0;
        else 
            a_i_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    a_i_we0_assign_proc : process(ap_sig_cseq_ST_st4_fsm_3)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3))) then 
            a_i_we0 <= ap_const_logic_1;
        else 
            a_i_we0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_sig_cseq_ST_st9_fsm_8, exitcond1_fu_325_p2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8) and not((ap_const_lv1_0 = exitcond1_fu_325_p2)))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st9_fsm_8, exitcond1_fu_325_p2)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st9_fsm_8) and not((ap_const_lv1_0 = exitcond1_fu_325_p2)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_104_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_104 <= (ap_const_lv1_1 = ap_CS_fsm(5 downto 5));
    end process;


    ap_sig_120_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_120 <= (ap_const_lv1_1 = ap_CS_fsm(8 downto 8));
    end process;


    ap_sig_134_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_134 <= (ap_const_lv1_1 = ap_CS_fsm(9 downto 9));
    end process;


    ap_sig_202_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_202 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    ap_sig_217_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_217 <= (ap_const_lv1_1 = ap_CS_fsm(6 downto 6));
    end process;


    ap_sig_226_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_226 <= (ap_const_lv1_1 = ap_CS_fsm(7 downto 7));
    end process;


    ap_sig_240_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_240 <= (ap_const_lv1_1 = ap_CS_fsm(10 downto 10));
    end process;


    ap_sig_26_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_26 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_59_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_59 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_74_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_74 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    ap_sig_90_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_90 <= (ap_const_lv1_1 = ap_CS_fsm(4 downto 4));
    end process;


    ap_sig_cseq_ST_st10_fsm_9_assign_proc : process(ap_sig_134)
    begin
        if (ap_sig_134) then 
            ap_sig_cseq_ST_st10_fsm_9 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st10_fsm_9 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st11_fsm_10_assign_proc : process(ap_sig_240)
    begin
        if (ap_sig_240) then 
            ap_sig_cseq_ST_st11_fsm_10 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st11_fsm_10 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_26)
    begin
        if (ap_sig_26) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_59)
    begin
        if (ap_sig_59) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st3_fsm_2_assign_proc : process(ap_sig_74)
    begin
        if (ap_sig_74) then 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st4_fsm_3_assign_proc : process(ap_sig_202)
    begin
        if (ap_sig_202) then 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st5_fsm_4_assign_proc : process(ap_sig_90)
    begin
        if (ap_sig_90) then 
            ap_sig_cseq_ST_st5_fsm_4 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st5_fsm_4 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st6_fsm_5_assign_proc : process(ap_sig_104)
    begin
        if (ap_sig_104) then 
            ap_sig_cseq_ST_st6_fsm_5 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st6_fsm_5 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st7_fsm_6_assign_proc : process(ap_sig_217)
    begin
        if (ap_sig_217) then 
            ap_sig_cseq_ST_st7_fsm_6 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st7_fsm_6 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st8_fsm_7_assign_proc : process(ap_sig_226)
    begin
        if (ap_sig_226) then 
            ap_sig_cseq_ST_st8_fsm_7 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st8_fsm_7 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st9_fsm_8_assign_proc : process(ap_sig_120)
    begin
        if (ap_sig_120) then 
            ap_sig_cseq_ST_st9_fsm_8 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st9_fsm_8 <= ap_const_logic_0;
        end if; 
    end process;


    b_i_address0_assign_proc : process(tmp_15_cast_reg_437, grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0, ap_sig_cseq_ST_st7_fsm_6, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_6)) then 
            b_i_address0 <= tmp_15_cast_reg_437(4 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            b_i_address0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_address0;
        else 
            b_i_address0 <= "XXXX";
        end if; 
    end process;


    b_i_ce0_assign_proc : process(grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0, ap_sig_cseq_ST_st7_fsm_6, ap_sig_cseq_ST_st8_fsm_7)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_6)) then 
            b_i_ce0 <= ap_const_logic_1;
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st8_fsm_7)) then 
            b_i_ce0 <= grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_B_ce0;
        else 
            b_i_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    b_i_we0_assign_proc : process(ap_sig_cseq_ST_st7_fsm_6)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st7_fsm_6))) then 
            b_i_we0 <= ap_const_logic_1;
        else 
            b_i_we0 <= ap_const_logic_0;
        end if; 
    end process;

    c_1_fu_245_p2 <= std_logic_vector(unsigned(c_reg_143) + unsigned(ap_const_lv2_1));
    c_2_fu_305_p2 <= std_logic_vector(unsigned(c2_reg_165) + unsigned(ap_const_lv2_1));
    c_3_fu_365_p2 <= std_logic_vector(unsigned(c4_reg_187) + unsigned(ap_const_lv2_1));
    exitcond1_fu_325_p2 <= "1" when (r3_reg_176 = ap_const_lv2_3) else "0";
    exitcond2_fu_299_p2 <= "1" when (c2_reg_165 = ap_const_lv2_3) else "0";
    exitcond3_fu_265_p2 <= "1" when (r1_reg_154 = ap_const_lv2_3) else "0";
    exitcond4_fu_239_p2 <= "1" when (c_reg_143 = ap_const_lv2_3) else "0";
    exitcond5_fu_205_p2 <= "1" when (r_reg_132 = ap_const_lv2_3) else "0";
    exitcond_fu_359_p2 <= "1" when (c4_reg_187 = ap_const_lv2_3) else "0";
    grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start <= ap_reg_grp_matrix_multiply_top_matrix_multiply_alt2_fu_198_ap_start;
    p_shl1_cast_fu_289_p1 <= std_logic_vector(resize(unsigned(tmp_s_fu_281_p3),5));
    p_shl2_cast_fu_349_p1 <= std_logic_vector(resize(unsigned(tmp_5_fu_341_p3),5));
    p_shl_cast_fu_229_p1 <= std_logic_vector(resize(unsigned(tmp_6_fu_221_p3),5));
    r_1_fu_211_p2 <= std_logic_vector(unsigned(r_reg_132) + unsigned(ap_const_lv2_1));
    r_2_fu_271_p2 <= std_logic_vector(unsigned(r1_reg_154) + unsigned(ap_const_lv2_1));
    r_3_fu_331_p2 <= std_logic_vector(unsigned(r3_reg_176) + unsigned(ap_const_lv2_1));
    tmp_10_fu_315_p2 <= std_logic_vector(unsigned(tmp_1_reg_424) + unsigned(tmp_7_cast_fu_311_p1));
    tmp_11_fu_375_p2 <= std_logic_vector(unsigned(tmp_7_reg_455) + unsigned(tmp_cast_10_fu_371_p1));
        tmp_12_cast_fu_260_p1 <= std_logic_vector(resize(signed(tmp_3_fu_255_p2),64));

        tmp_15_cast_fu_320_p1 <= std_logic_vector(resize(signed(tmp_10_fu_315_p2),64));

        tmp_16_cast_fu_380_p1 <= std_logic_vector(resize(signed(tmp_11_fu_375_p2),64));

    tmp_1_cast_fu_277_p1 <= std_logic_vector(resize(unsigned(r1_reg_154),5));
    tmp_1_fu_293_p2 <= std_logic_vector(unsigned(p_shl1_cast_fu_289_p1) - unsigned(tmp_1_cast_fu_277_p1));
    tmp_3_cast_fu_251_p1 <= std_logic_vector(resize(unsigned(c_reg_143),5));
    tmp_3_fu_255_p2 <= std_logic_vector(unsigned(tmp_9_reg_393) + unsigned(tmp_3_cast_fu_251_p1));
    tmp_5_cast_fu_337_p1 <= std_logic_vector(resize(unsigned(r3_reg_176),5));
    tmp_5_fu_341_p3 <= (r3_reg_176 & ap_const_lv2_0);
    tmp_6_fu_221_p3 <= (r_reg_132 & ap_const_lv2_0);
    tmp_7_cast_fu_311_p1 <= std_logic_vector(resize(unsigned(c2_reg_165),5));
    tmp_7_fu_353_p2 <= std_logic_vector(unsigned(p_shl2_cast_fu_349_p1) - unsigned(tmp_5_cast_fu_337_p1));
    tmp_9_fu_233_p2 <= std_logic_vector(unsigned(p_shl_cast_fu_229_p1) - unsigned(tmp_cast_fu_217_p1));
    tmp_cast_10_fu_371_p1 <= std_logic_vector(resize(unsigned(c4_reg_187),5));
    tmp_cast_fu_217_p1 <= std_logic_vector(resize(unsigned(r_reg_132),5));
    tmp_s_fu_281_p3 <= (r1_reg_154 & ap_const_lv2_0);
end behav;
