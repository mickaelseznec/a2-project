############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mul_matrix
set_top matrix_multiply_top
add_files mul_matrix/main.cpp
add_files -tb mul_matrix/test
open_solution "solution1"
set_part {xc7z020clg484-1} -tool vivado
create_clock -period 10 -name default
#source "./mul_matrix/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
