// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Mar 10 00:12:47 2023
// Host        : DESKTOP-C3MDEKS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Alinx/Alinx7010/Self_learning/ov5640_mnist_serial/ov5640_mnist_serial.runs/W2_blkmem_synth_1/W2_blkmem_sim_netlist.v
// Design      : W2_blkmem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "W2_blkmem,blk_mem_gen_v8_4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module W2_blkmem
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_WRITE_MODE READ_WRITE" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "3" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.82994 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "W2_blkmem.mem" *) 
  (* C_INIT_FILE_NAME = "W2_blkmem.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1250" *) 
  (* C_READ_DEPTH_B = "1250" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1250" *) 
  (* C_WRITE_DEPTH_B = "1250" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  W2_blkmem_blk_mem_gen_v8_4_1 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_generic_cstr" *) 
module W2_blkmem_blk_mem_gen_generic_cstr
   (douta,
    addra,
    clka);
  output [31:0]douta;
  input [10:0]addra;
  input clka;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;
  wire [17:0]ram_douta;
  wire \ramloop[0].ram.r_n_18 ;
  wire \ramloop[1].ram.r_n_0 ;
  wire \ramloop[1].ram.r_n_1 ;
  wire \ramloop[1].ram.r_n_10 ;
  wire \ramloop[1].ram.r_n_11 ;
  wire \ramloop[1].ram.r_n_12 ;
  wire \ramloop[1].ram.r_n_13 ;
  wire \ramloop[1].ram.r_n_14 ;
  wire \ramloop[1].ram.r_n_15 ;
  wire \ramloop[1].ram.r_n_16 ;
  wire \ramloop[1].ram.r_n_17 ;
  wire \ramloop[1].ram.r_n_18 ;
  wire \ramloop[1].ram.r_n_19 ;
  wire \ramloop[1].ram.r_n_2 ;
  wire \ramloop[1].ram.r_n_20 ;
  wire \ramloop[1].ram.r_n_21 ;
  wire \ramloop[1].ram.r_n_22 ;
  wire \ramloop[1].ram.r_n_23 ;
  wire \ramloop[1].ram.r_n_24 ;
  wire \ramloop[1].ram.r_n_25 ;
  wire \ramloop[1].ram.r_n_26 ;
  wire \ramloop[1].ram.r_n_27 ;
  wire \ramloop[1].ram.r_n_28 ;
  wire \ramloop[1].ram.r_n_29 ;
  wire \ramloop[1].ram.r_n_3 ;
  wire \ramloop[1].ram.r_n_30 ;
  wire \ramloop[1].ram.r_n_31 ;
  wire \ramloop[1].ram.r_n_4 ;
  wire \ramloop[1].ram.r_n_5 ;
  wire \ramloop[1].ram.r_n_6 ;
  wire \ramloop[1].ram.r_n_7 ;
  wire \ramloop[1].ram.r_n_8 ;
  wire \ramloop[1].ram.r_n_9 ;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_1 ;
  wire \ramloop[2].ram.r_n_10 ;
  wire \ramloop[2].ram.r_n_11 ;
  wire \ramloop[2].ram.r_n_12 ;
  wire \ramloop[2].ram.r_n_13 ;
  wire \ramloop[2].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_3 ;
  wire \ramloop[2].ram.r_n_4 ;
  wire \ramloop[2].ram.r_n_5 ;
  wire \ramloop[2].ram.r_n_6 ;
  wire \ramloop[2].ram.r_n_7 ;
  wire \ramloop[2].ram.r_n_8 ;
  wire \ramloop[2].ram.r_n_9 ;

  W2_blkmem_blk_mem_gen_mux \has_mux_a.A 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 ,\ramloop[2].ram.r_n_8 ,\ramloop[2].ram.r_n_9 ,\ramloop[2].ram.r_n_10 ,\ramloop[2].ram.r_n_11 ,\ramloop[2].ram.r_n_12 ,\ramloop[2].ram.r_n_13 }),
        .DOADO({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 ,\ramloop[1].ram.r_n_8 ,\ramloop[1].ram.r_n_9 ,\ramloop[1].ram.r_n_10 ,\ramloop[1].ram.r_n_11 ,\ramloop[1].ram.r_n_12 ,\ramloop[1].ram.r_n_13 ,\ramloop[1].ram.r_n_14 ,\ramloop[1].ram.r_n_15 }),
        .DOBDO({\ramloop[1].ram.r_n_16 ,\ramloop[1].ram.r_n_17 ,\ramloop[1].ram.r_n_18 ,\ramloop[1].ram.r_n_19 ,\ramloop[1].ram.r_n_20 ,\ramloop[1].ram.r_n_21 ,\ramloop[1].ram.r_n_22 ,\ramloop[1].ram.r_n_23 ,\ramloop[1].ram.r_n_24 ,\ramloop[1].ram.r_n_25 ,\ramloop[1].ram.r_n_26 ,\ramloop[1].ram.r_n_27 ,\ramloop[1].ram.r_n_28 ,\ramloop[1].ram.r_n_29 ,\ramloop[1].ram.r_n_30 ,\ramloop[1].ram.r_n_31 }),
        .addra(addra[10:9]),
        .clka(clka),
        .douta(douta),
        .ram_douta(ram_douta));
  W2_blkmem_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram (\ramloop[0].ram.r_n_18 ),
        .addra(addra),
        .clka(clka),
        .ram_douta(ram_douta));
  W2_blkmem_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.DOADO({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 ,\ramloop[1].ram.r_n_8 ,\ramloop[1].ram.r_n_9 ,\ramloop[1].ram.r_n_10 ,\ramloop[1].ram.r_n_11 ,\ramloop[1].ram.r_n_12 ,\ramloop[1].ram.r_n_13 ,\ramloop[1].ram.r_n_14 ,\ramloop[1].ram.r_n_15 }),
        .DOBDO({\ramloop[1].ram.r_n_16 ,\ramloop[1].ram.r_n_17 ,\ramloop[1].ram.r_n_18 ,\ramloop[1].ram.r_n_19 ,\ramloop[1].ram.r_n_20 ,\ramloop[1].ram.r_n_21 ,\ramloop[1].ram.r_n_22 ,\ramloop[1].ram.r_n_23 ,\ramloop[1].ram.r_n_24 ,\ramloop[1].ram.r_n_25 ,\ramloop[1].ram.r_n_26 ,\ramloop[1].ram.r_n_27 ,\ramloop[1].ram.r_n_28 ,\ramloop[1].ram.r_n_29 ,\ramloop[1].ram.r_n_30 ,\ramloop[1].ram.r_n_31 }),
        .addra(addra),
        .clka(clka));
  W2_blkmem_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.addra(addra[9:0]),
        .\addra[10] (\ramloop[0].ram.r_n_18 ),
        .clka(clka),
        .\douta[31] ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 ,\ramloop[2].ram.r_n_8 ,\ramloop[2].ram.r_n_9 ,\ramloop[2].ram.r_n_10 ,\ramloop[2].ram.r_n_11 ,\ramloop[2].ram.r_n_12 ,\ramloop[2].ram.r_n_13 }));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module W2_blkmem_blk_mem_gen_mux
   (douta,
    addra,
    clka,
    DOADO,
    ram_douta,
    DOBDO,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram );
  output [31:0]douta;
  input [1:0]addra;
  input clka;
  input [15:0]DOADO;
  input [17:0]ram_douta;
  input [15:0]DOBDO;
  input [13:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;

  wire [13:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  wire [15:0]DOADO;
  wire [15:0]DOBDO;
  wire [1:0]addra;
  wire clka;
  wire [31:0]douta;
  wire [17:0]ram_douta;
  wire [1:0]sel_pipe;

  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[0]_INST_0 
       (.I0(DOADO[0]),
        .I1(ram_douta[0]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[0]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[10]_INST_0 
       (.I0(DOADO[10]),
        .I1(ram_douta[10]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[10]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[11]_INST_0 
       (.I0(DOADO[11]),
        .I1(ram_douta[11]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[11]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[12]_INST_0 
       (.I0(DOADO[12]),
        .I1(ram_douta[12]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[12]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[13]_INST_0 
       (.I0(DOADO[13]),
        .I1(ram_douta[13]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[13]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[14]_INST_0 
       (.I0(DOADO[14]),
        .I1(ram_douta[14]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[14]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[15]_INST_0 
       (.I0(DOADO[15]),
        .I1(ram_douta[15]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[15]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[16]_INST_0 
       (.I0(DOBDO[0]),
        .I1(ram_douta[16]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[16]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[17]_INST_0 
       (.I0(DOBDO[1]),
        .I1(ram_douta[17]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[17]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[18]_INST_0 
       (.I0(DOBDO[2]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [0]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[18]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[19]_INST_0 
       (.I0(DOBDO[3]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [1]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[19]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[1]_INST_0 
       (.I0(DOADO[1]),
        .I1(ram_douta[1]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[1]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[20]_INST_0 
       (.I0(DOBDO[4]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [2]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[20]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[21]_INST_0 
       (.I0(DOBDO[5]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [3]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[21]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[22]_INST_0 
       (.I0(DOBDO[6]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [4]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[22]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[23]_INST_0 
       (.I0(DOBDO[7]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [5]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[23]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[24]_INST_0 
       (.I0(DOBDO[8]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [6]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[24]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[25]_INST_0 
       (.I0(DOBDO[9]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [7]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[25]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[26]_INST_0 
       (.I0(DOBDO[10]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [8]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[26]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[27]_INST_0 
       (.I0(DOBDO[11]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [9]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[27]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[28]_INST_0 
       (.I0(DOBDO[12]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [10]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[28]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[29]_INST_0 
       (.I0(DOBDO[13]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [11]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[29]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[2]_INST_0 
       (.I0(DOADO[2]),
        .I1(ram_douta[2]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[2]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[30]_INST_0 
       (.I0(DOBDO[14]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [12]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[30]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[31]_INST_0 
       (.I0(DOBDO[15]),
        .I1(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram [13]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[31]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[3]_INST_0 
       (.I0(DOADO[3]),
        .I1(ram_douta[3]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[3]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[4]_INST_0 
       (.I0(DOADO[4]),
        .I1(ram_douta[4]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[4]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[5]_INST_0 
       (.I0(DOADO[5]),
        .I1(ram_douta[5]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[5]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[6]_INST_0 
       (.I0(DOADO[6]),
        .I1(ram_douta[6]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[6]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[7]_INST_0 
       (.I0(DOADO[7]),
        .I1(ram_douta[7]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[7]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[8]_INST_0 
       (.I0(DOADO[8]),
        .I1(ram_douta[8]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[8]));
  LUT4 #(
    .INIT(16'h0CAC)) 
    \douta[9]_INST_0 
       (.I0(DOADO[9]),
        .I1(ram_douta[9]),
        .I2(sel_pipe[1]),
        .I3(sel_pipe[0]),
        .O(douta[9]));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[0]),
        .Q(sel_pipe[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[1] 
       (.C(clka),
        .CE(1'b1),
        .D(addra[1]),
        .Q(sel_pipe[1]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module W2_blkmem_blk_mem_gen_prim_width
   (ram_douta,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ,
    clka,
    addra);
  output [17:0]ram_douta;
  output \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  input clka;
  input [10:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ;
  wire [10:0]addra;
  wire clka;
  wire [17:0]ram_douta;

  W2_blkmem_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .addra(addra),
        .clka(clka),
        .ram_douta(ram_douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module W2_blkmem_blk_mem_gen_prim_width__parameterized0
   (DOADO,
    DOBDO,
    clka,
    addra);
  output [15:0]DOADO;
  output [15:0]DOBDO;
  input clka;
  input [10:0]addra;

  wire [15:0]DOADO;
  wire [15:0]DOBDO;
  wire [10:0]addra;
  wire clka;

  W2_blkmem_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.DOADO(DOADO),
        .DOBDO(DOBDO),
        .addra(addra),
        .clka(clka));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module W2_blkmem_blk_mem_gen_prim_width__parameterized1
   (\douta[31] ,
    clka,
    \addra[10] ,
    addra);
  output [13:0]\douta[31] ;
  input clka;
  input \addra[10] ;
  input [9:0]addra;

  wire [9:0]addra;
  wire \addra[10] ;
  wire clka;
  wire [13:0]\douta[31] ;

  W2_blkmem_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.addra(addra),
        .\addra[10] (\addra[10] ),
        .clka(clka),
        .\douta[31] (\douta[31] ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module W2_blkmem_blk_mem_gen_prim_wrapper_init
   (ram_douta,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ,
    clka,
    addra);
  output [17:0]ram_douta;
  output \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  input clka;
  input [10:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ;
  wire [10:0]addra;
  wire clka;
  wire [17:0]ram_douta;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h13551455700351D515154D15D03444551705744D501554C15D03154011705740),
    .INITP_01(256'h704D504141C01D43151511305345D140545C14C53541555705340D514055C14C),
    .INITP_02(256'h14D13501540701744D514145C14C03150551705700D101545C05D03454411304),
    .INITP_03(256'h304310D545145F14D03545551705301D545545C14D13541151301340D141545C),
    .INITP_04(256'h40C15C53544011301740D504544C10C43051110305344D104501C04D03055111),
    .INITP_05(256'h411300344D505045C45D13541455705305D104545C15D13140555301354C5154),
    .INITP_06(256'h45144C10C47141055701700C540544C50C03411551315304D505105C15C53055),
    .INITP_07(256'h155011700304D505445F55C13441511704340D500545C10C13540551341740D1),
    .INIT_00(256'h01500289045604CA0109FF04001C012502C300160018FF6B00E7038D03D8054D),
    .INIT_01(256'h000C0046FF980068036303B505FEFF030234039D018A01F3026604EB053F0393),
    .INIT_02(256'h03D10123029A02CD04D6045E036101D8025D03EE0491023DFFA200BD019B020E),
    .INIT_03(256'h047604FF0198FF1A00CA01C202AD001C0034FF9500F003F7032B0592FFA701C4),
    .INIT_04(256'hFF55006003B7036B0561FF9701F0041701F80221020904DE04DE032201510213),
    .INIT_05(256'h024C0225043304A603EB010502BB03D304570226FF8A002001010286006D0008),
    .INIT_06(256'h01E0FF1D00230144028A00F700B7FF1800C702D403920506FF3C011D03F10172),
    .INIT_07(256'h039F039E053BFF6101F80332012B01CA02D6049704AD03E001D1023A03F704AF),
    .INIT_08(256'h0472053F037C01E402A703E2042D010BFF6A00EE01700248004700B7FF050104),
    .INIT_09(256'h00E801AD021600B500EAFF7F006B033203580524FF9D01CB03F701C0021C0238),
    .INIT_0A(256'h059CFF52016D03D1013702C102DA041404D60314017C029803DF0441015CFF39),
    .INIT_0B(256'h03A20118023C049204FA01FEFFDC0040013D026F00BD00EFFFF8011E032F0357),
    .INIT_0C(256'h0288003900E6FFE700F90396032904E9FF27019B041C01920192029104EB0504),
    .INIT_0D(256'h020603DA01A001AA02EF04230456039901F8028B042F042B020CFF6E00F501C9),
    .INIT_0E(256'h028F042D04F40174FFE200B0012302F500CE003AFFBF008A02F0039705DAFF68),
    .INIT_0F(256'h0007FF12017F03A4034605A1FF5C018703960144022902DE0402050C03C10175),
    .INIT_10(256'h01EE0183020A04E804C703D801860244042A043D01FCFF5600B6019E024A00E1),
    .INIT_11(256'h040E01D7FF0D00AD013C02CB009B005DFF9100CC039803C90555FFBE01D50406),
    .INIT_12(256'h0125039803B505D7FF8D01350430012D020602B104AD04DE039401D00281040D),
    .INIT_13(256'h02AA04E104C703BE017702F2043B048201A5FF8B003B01EE02C10040003CFF36),
    .INIT_14(256'hFFAE005801C1025500D300D9FFC00122035603BD0599FF50023203BA017601A6),
    .INIT_15(256'h0303057CFF420144036601680247022A047A051103F5018D02D504AA04C20159),
    .INIT_16(256'h044C034601CE030F049D04E70179FF37003201650287003F006DFF3200DE035E),
    .INIT_17(256'h014E020D0082009BFFD400F703E7037205CDFF8801BB03B401D902730293048D),
    .INIT_18(256'hFF5801F1041801B3017102D404EB04C70346012402A0047904960179FF11006C),
    .INIT_19(256'h01F2029304460477021EFF3B007A016502AA008C00BCFF3C0056035E038105FE),
    .INIT_1A(256'h00F300BCFF9200A8037E033A059AFF24013A03AD017F02860276041405420351),
    .INIT_1B(256'h03E6014501A602F7040C04BD0369011602D3046C0491017EFFC500AE01C7023C),
    .INIT_1C(256'h0462043A017DFF1700BC0160021A00AA00AEFF00010403C403A404E4FFA90156),
    .INIT_1D(256'hFF0E00B503B703CA0593FF4401A003B60196023F0246045604990370013802B9),
    .INIT_1E(256'h01F3029B047D04B503BA01D60259049D042F0193FF06FFFD01040238009100F0),
    .INIT_1F(256'h01CEFFE800520120023600C7006FFFF6010B030D03BC055CFF8A01D9037F018E),
    .INIT_20(256'h03A803410543FFB6026C046F015A01D7028804190589031101BB0265046F04D9),
    .INIT_21(256'h0414051E0317015002ED045504EA01FDFF950020014602CE00A300D3FF4E00D6),
    .INIT_22(256'h004301C00281007500B4FFB100EA03D6038F057BFF3301470416019B02B602F4),
    .INIT_23(256'h0542FFDD020204470148018502BC040F0587039701E802810469051C022CFF2C),
    .INIT_24(256'h032901C5025F0425045E0244FF1900ED01C1024600DD0030FFC3010E02FF03FB),
    .INIT_25(256'h02FD000E000CFFA000AB035103E4056DFF8E013903E60199025E026204840516),
    .INIT_26(256'h01DC039B01A80248023F04CA053C03BA023002B704C6045F020BFFA5005601A3),
    .INIT_27(256'h0284045804FD01F2FF7A006401B202BD00040023FFB8015B035A037A054AFFAC),
    .INIT_28(256'h00BEFF91006802E80337059DFF79023603B201DA0203027104BF04B5032F018D),
    .INIT_29(256'h01540210024804C904440307016502AA03A904350245FF88006B015802AD00B2),
    .INIT_2A(256'h04C4014EFFB1009001CA028B00BB0020FF8500960390034A051CFF8D022D0389),
    .INIT_2B(256'h010E0325033304D4FFDD017A042301C3023D02F5048205200395018402EF0427),
    .INIT_2C(256'h024B047504F703EB010002DD03BE04A3017DFF3000B7016002A400930080FF88),
    .INIT_2D(256'hFFA8008900DB02CC00040009FF84006303BF034805A5FF3F018B03C501F00218),
    .INIT_2E(256'h033F05D4FFE10161035001CC02BB026F046B04DB03E202250220046D04CE0125),
    .INIT_2F(256'h048C03E5014102490481044C01D5FFB7004001FC02E600CF00FFFF1400DD03C8),
    .INIT_30(256'h0163026D002800A2FF28013002E80323057BFF9A024B042A01D201920280042B),
    .INIT_31(256'hFF4D015B037F017202B10293040704D103EE015302EF046704200163FFE200C9),
    .INIT_32(256'h0141026A044D04D10232FFA40039013302A000B800A0FFAE014203FC035E05CA),
    .INIT_33(256'h00E50069FFBE0122035603C7050AFFEF01B2041C020D01C20293040704CF0355),
    .INIT_34(256'h03C301B701E802CD04F3050E03850108025A04A004820244FF7B008900FF02A7),
    .INIT_35(256'h03D304C10134FF6200E30154029E00BC003CFF5D012803A803E70589FF750206),
    .INIT_36(256'hFF02018B034803B50503FF240205039801930295027704520530038601FA02DB),
    .INIT_37(256'h01CF02AE049E04B80389011F02A5042D04B801C6FF46003101F702AB00CF00AA),
    .INIT_38(256'h0226FF6C0007012F02D1007F009AFF2F00F8031E037F05ACFFAF019A047701E1),
    .INIT_39(256'h036703230578FF4001F0036D0168020802EF04E80491033A01E5028604060423),
    .INIT_3A(256'h04EB05350379016502E50473048F016FFFA40031019C0260010F00CBFF7B013F),
    .INIT_3B(256'h00E301C602C800F9005CFF310067030C03D7055FFFBB015403CF01BD0259028C),
    .INIT_3C(256'h05B4FFAB017704570160023C025A042104C9036601FB0246049604190168FF69),
    .INIT_3D(256'h033F0202028F0444048301D3FF1DFFFF00FD0263002D003AFF2501470302030A),
    .INIT_3E(256'h02FD00F50068FF7301A70383031E05BDFFB6016B036201A5022902A8047604D6),
    .INIT_3F(256'h021D03E501A6016102A104BF057A03AF01C802900401043A0110FF72002E01E5),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({ram_douta[16:9],ram_douta[7:0]}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({ram_douta[17],ram_douta[8]}),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT1 #(
    .INIT(2'h1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_i_1 
       (.I0(addra[10]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module W2_blkmem_blk_mem_gen_prim_wrapper_init__parameterized0
   (DOADO,
    DOBDO,
    clka,
    addra);
  output [15:0]DOADO;
  output [15:0]DOBDO;
  input clka;
  input [10:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_i_1_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 ;
  wire [15:0]DOADO;
  wire [15:0]DOBDO;
  wire [10:0]addra;
  wire clka;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000012500000122FFFFFFC6000001DE00000601000006BC00000AF9FFFFFF0B),
    .INIT_01(256'h0000058E000007A40000090700000357FFFFFF9D000000F50000023A000004A2),
    .INIT_02(256'h00000770000003FF00000495000004DD0000088C000009F2000007660000038B),
    .INIT_03(256'h0000004BFFFFFF31000002250000066A0000078200000AC8FFFFFF8500000366),
    .INIT_04(256'h000008E90000099E00000401FFFFFFA400000073000002F80000056A0000015E),
    .INIT_05(256'h00000376000003FD000004D80000097D00000A990000079F000002E300000604),
    .INIT_06(256'hFFFFFFAE000001AF000006B700000680000009F0FFFFFF88000003A3000007DE),
    .INIT_07(256'h0000098700000359FFFFFF760000003200000228000005270000014100000026),
    .INIT_08(256'h00000391000004BE000008CA000009A30000070A000003A6000005710000086D),
    .INIT_09(256'h000001AE000006C40000075700000B1DFFFFFF510000034E000007A600000365),
    .INIT_0A(256'h000003A7FFFFFF22000000D4000001CE000005660000019E000000A8FFFFFF1D),
    .INIT_0B(256'h0000049E0000091F000009C4000006B2000003D60000052B00000862000009B4),
    .INIT_0C(256'h0000070D0000072000000AFBFFFFFFEC0000038A000007F9000002F2000004BB),
    .INIT_0D(256'hFFFFFF2A00000029000002C2000004D40000018C00000032FFFFFF610000022D),
    .INIT_0E(256'h000009D9000009CC000006FF000002DA0000060400000849000009C5000002A2),
    .INIT_0F(256'h0000065300000A29FFFFFFF90000041D000008650000036C000003DC0000059C),
    .INIT_10(256'h0000010200000241000004B40000019B000000AAFFFFFFB700000202000005B2),
    .INIT_11(256'h00000975000007E600000410000005D10000085F000008EA0000036BFFFFFFEC),
    .INIT_12(256'h00000B05FFFFFF8A000003D9000008020000040900000474000004CB0000096B),
    .INIT_13(256'h000002E60000060E0000014700000065FFFFFFCA0000019E000006AD000006CA),
    .INIT_14(256'h00000717000003060000050C000007FB000009F300000389FFFFFF9700000045),
    .INIT_15(256'hFFFFFF480000039400000840000003310000044F000004BF000009A6000009F5),
    .INIT_16(256'h000004E200000137000000E6FFFFFFF90000021600000625000006E1000009DF),
    .INIT_17(256'h00000329000005F900000896000009EB000003E3FFFFFF120000009600000241),
    .INIT_18(256'h000003B40000081F000003E500000456000004C30000090C000009BA00000730),
    .INIT_19(256'h00000107000000CEFFFFFFED000001AE000006840000071700000A6AFFFFFF35),
    .INIT_1A(256'h000005FA000008770000094B000003A2FFFFFF6200000007000002630000049B),
    .INIT_1B(256'h000008010000037200000495000004F7000008F30000094E000006D10000041B),
    .INIT_1C(256'h000000000000000000000000000000000000000000000000FFFFFF5F00000359),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram 
       (.ADDRARDADDR({addra[8:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addra[8:0],1'b1,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(DOADO),
        .DOBDO(DOBDO),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_33 }),
        .DOPBDOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_34 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_n_35 }),
        .ENARDEN(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_i_1_n_0 ),
        .ENBWREN(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_i_1_n_0 ),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_i_1 
       (.I0(addra[10]),
        .I1(addra[9]),
        .O(\DEVICE_7SERIES.NO_BMM_INFO.SP.WIDE_PRIM18.ram_i_1_n_0 ));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module W2_blkmem_blk_mem_gen_prim_wrapper_init__parameterized1
   (\douta[31] ,
    clka,
    \addra[10] ,
    addra);
  output [13:0]\douta[31] ;
  input clka;
  input \addra[10] ;
  input [9:0]addra;

  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_8 ;
  wire [9:0]addra;
  wire \addra[10] ;
  wire clka;
  wire [13:0]\douta[31] ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h000000000000000000007F7F000000000000000000007F7F0000000000000000),
    .INIT_01(256'h000000007F7F00000000000000007F7F00000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000007F7F000000000000),
    .INIT_03(256'h0000000000007F7F000000000000000000007F7F00000000000000007F7F0000),
    .INIT_04(256'h7F7F00000000000000007F7F0000000000000000000000000000000000000000),
    .INIT_05(256'h00000000000000000000000000000000000000007F7F00000000000000000000),
    .INIT_06(256'h00007F7F000000000000000000007F7F00000000000000007F7F000000000000),
    .INIT_07(256'h0000000000007F7F000000000000000000000000000000000000000000000000),
    .INIT_08(256'h000000000000000000000000000000007F7F000000000000000000007F7F0000),
    .INIT_09(256'h000000000000000000007F7F00000000000000007F7F00000000000000000000),
    .INIT_0A(256'h00007F7F00000000000000000000000000000000000000000000000000007F7F),
    .INIT_0B(256'h0000000000000000000000007F7F000000000000000000007F7F000000000000),
    .INIT_0C(256'h0000000000007F7F00000000000000007F7F0000000000000000000000000000),
    .INIT_0D(256'h00000000000000000000000000000000000000000000000000007F7F00000000),
    .INIT_0E(256'h00000000000000007F7F000000000000000000007F7F00000000000000007F7F),
    .INIT_0F(256'h00007F7F00000000000000007F7F000000000000000000000000000000000000),
    .INIT_10(256'h000000000000000000000000000000000000000000007F7F0000000000000000),
    .INIT_11(256'h000000007F7F000000000000000000007F7F00000000000000007F7F00000000),
    .INIT_12(256'h00000000000000007F7F00000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000007F7F000000000000000000007F7F),
    .INIT_14(256'h7F7F000000000000000000007F7F00000000000000007F7F0000000000000000),
    .INIT_15(256'h000000007F7F0000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h00000000000000000000000000007F7F000000000000000000007F7F00000000),
    .INIT_17(256'h00000000000000007F7F00000000000000007F7F000000000000000000000000),
    .INIT_18(256'h7F7F00000000000000000000000000000000000000000000000000007F7F0000),
    .INIT_19(256'h000000000000000000007F7F000000000000000000007F7F0000000000000000),
    .INIT_1A(256'h000000007F7F00000000000000007F7F00000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000007F7F000000000000),
    .INIT_1C(256'h0000000000007F7F000000000000000000007F7F00000000000000007F7F0000),
    .INIT_1D(256'h7F7F00000000000000007F7F0000000000000000000000000000000000000000),
    .INIT_1E(256'h00000000000000000000000000000000000000007F7F7F7F0000000000000000),
    .INIT_1F(256'h00007F7F000000000000000000007F7F00000000000000007F7F000000000000),
    .INIT_20(256'h0000000000007F7F000000000000000000000000000000000000000000000000),
    .INIT_21(256'h000000000000000000000000000000007F7F000000000000000000007F7F0000),
    .INIT_22(256'h000000000000000000007F7F00000000000000007F7F00000000000000000000),
    .INIT_23(256'h00007F7F00000000000000000000000000000000000000000000000000007F7F),
    .INIT_24(256'h0000000000000000000000007F7F000000000000000000007F7F000000000000),
    .INIT_25(256'h0000000000007F7F00000000000000007F7F0000000000000000000000000000),
    .INIT_26(256'h00000000000000000000000000000000000000000000000000007F7F00000000),
    .INIT_27(256'h00000000000000007F7F000000000000000000007F7F00000000000000007F7F),
    .INIT_28(256'h00007F7F00000000000000007F7F000000000000000000000000000000000000),
    .INIT_29(256'h000000000000000000000000000000000000000000007F7F0000000000000000),
    .INIT_2A(256'h000000007F7F000000000000000000007F7F00000000000000007F7F00000000),
    .INIT_2B(256'h00000000000000007F7F00000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000007F7F000000000000000000007F7F),
    .INIT_2D(256'h7F7F000000000000000000007F7F00000000000000007F7F0000000000000000),
    .INIT_2E(256'h000000007F7F0000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h00000000000000000000000000007F7F000000000000000000007F7F00000000),
    .INIT_30(256'h00000000000000007F7F00000000000000007F7F000000000000000000000000),
    .INIT_31(256'h7F7F00000000000000000000000000000000000000000000000000007F7F0000),
    .INIT_32(256'h000000000000000000007F7F000000000000000000007F7F0000000000000000),
    .INIT_33(256'h000000007F7F00000000000000007F7F00000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000007F7F000000000000),
    .INIT_35(256'h0000000000007F7F000000000000000000007F7F00000000000000007F7F0000),
    .INIT_36(256'h7F7F00000000000000007F7F0000000000000000000000000000000000000000),
    .INIT_37(256'h00000000000000000000000000000000000000007F7F00000000000000000000),
    .INIT_38(256'h00007F7F000000000000000000007F7F00000000000000007F7F000000000000),
    .INIT_39(256'h0000000000007F7F000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h000000000000000000000000000000007F7F000000000000000000007F7F0000),
    .INIT_3B(256'h000000000000000000007F7F00000000000000007F7F00000000000000000000),
    .INIT_3C(256'h00007F7F00000000000000000000000000000000000000000000000000007F7F),
    .INIT_3D(256'h0000000000000000000000007F7F7F7F00000000000000007F7F000000000000),
    .INIT_3E(256'h0000000000007F7F00000000000000007F7F0000000000000000000000000000),
    .INIT_3F(256'h00000000000000000000000000000000000000000000000000007F7F00000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_0 ,\douta[31] [13:7],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_8 ,\douta[31] [6:0]}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP({\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_32 ,\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_n_33 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(\addra[10] ),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_top" *) 
module W2_blkmem_blk_mem_gen_top
   (douta,
    addra,
    clka);
  output [31:0]douta;
  input [10:0]addra;
  input clka;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;

  W2_blkmem_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* C_ADDRA_WIDTH = "11" *) (* C_ADDRB_WIDTH = "11" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "3" *) 
(* C_COUNT_36K_BRAM = "0" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.82994 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "0" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "W2_blkmem.mem" *) 
(* C_INIT_FILE_NAME = "W2_blkmem.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "1250" *) (* C_READ_DEPTH_B = "1250" *) (* C_READ_WIDTH_A = "32" *) 
(* C_READ_WIDTH_B = "32" *) (* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) 
(* C_RST_PRIORITY_A = "CE" *) (* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) 
(* C_USE_BRAM_BLOCK = "0" *) (* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) 
(* C_USE_DEFAULT_DATA = "0" *) (* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) 
(* C_USE_URAM = "0" *) (* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) 
(* C_WRITE_DEPTH_A = "1250" *) (* C_WRITE_DEPTH_B = "1250" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
(* C_WRITE_MODE_B = "WRITE_FIRST" *) (* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) 
(* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "blk_mem_gen_v8_4_1" *) (* downgradeipidentifiedwarnings = "yes" *) 
module W2_blkmem_blk_mem_gen_v8_4_1
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [10:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [10:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [10:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [10:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  W2_blkmem_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_v8_4_1_synth" *) 
module W2_blkmem_blk_mem_gen_v8_4_1_synth
   (douta,
    addra,
    clka);
  output [31:0]douta;
  input [10:0]addra;
  input clka;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;

  W2_blkmem_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
