// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Mar 10 00:20:49 2023
// Host        : DESKTOP-C3MDEKS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Alinx/Alinx7010/Self_learning/ov5640_mnist_serial/ov5640_mnist_serial.runs/W1_blkmem_synth_1/W1_blkmem_stub.v
// Design      : W1_blkmem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module W1_blkmem(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[6:0],douta[31:0]" */;
  input clka;
  input [6:0]addra;
  output [31:0]douta;
endmodule
