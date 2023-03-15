// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Mar  8 23:56:47 2023
// Host        : DESKTOP-C3MDEKS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ W2_blkmem_sim_netlist.v
// Design      : W2_blkmem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "W2_blkmem,blk_mem_gen_v8_4_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1 U0
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux \has_mux_a.A 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 ,\ramloop[2].ram.r_n_8 ,\ramloop[2].ram.r_n_9 ,\ramloop[2].ram.r_n_10 ,\ramloop[2].ram.r_n_11 ,\ramloop[2].ram.r_n_12 ,\ramloop[2].ram.r_n_13 }),
        .DOADO({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 ,\ramloop[1].ram.r_n_8 ,\ramloop[1].ram.r_n_9 ,\ramloop[1].ram.r_n_10 ,\ramloop[1].ram.r_n_11 ,\ramloop[1].ram.r_n_12 ,\ramloop[1].ram.r_n_13 ,\ramloop[1].ram.r_n_14 ,\ramloop[1].ram.r_n_15 }),
        .DOBDO({\ramloop[1].ram.r_n_16 ,\ramloop[1].ram.r_n_17 ,\ramloop[1].ram.r_n_18 ,\ramloop[1].ram.r_n_19 ,\ramloop[1].ram.r_n_20 ,\ramloop[1].ram.r_n_21 ,\ramloop[1].ram.r_n_22 ,\ramloop[1].ram.r_n_23 ,\ramloop[1].ram.r_n_24 ,\ramloop[1].ram.r_n_25 ,\ramloop[1].ram.r_n_26 ,\ramloop[1].ram.r_n_27 ,\ramloop[1].ram.r_n_28 ,\ramloop[1].ram.r_n_29 ,\ramloop[1].ram.r_n_30 ,\ramloop[1].ram.r_n_31 }),
        .addra(addra[10:9]),
        .clka(clka),
        .douta(douta),
        .ram_douta(ram_douta));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram (\ramloop[0].ram.r_n_18 ),
        .addra(addra),
        .clka(clka),
        .ram_douta(ram_douta));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.DOADO({\ramloop[1].ram.r_n_0 ,\ramloop[1].ram.r_n_1 ,\ramloop[1].ram.r_n_2 ,\ramloop[1].ram.r_n_3 ,\ramloop[1].ram.r_n_4 ,\ramloop[1].ram.r_n_5 ,\ramloop[1].ram.r_n_6 ,\ramloop[1].ram.r_n_7 ,\ramloop[1].ram.r_n_8 ,\ramloop[1].ram.r_n_9 ,\ramloop[1].ram.r_n_10 ,\ramloop[1].ram.r_n_11 ,\ramloop[1].ram.r_n_12 ,\ramloop[1].ram.r_n_13 ,\ramloop[1].ram.r_n_14 ,\ramloop[1].ram.r_n_15 }),
        .DOBDO({\ramloop[1].ram.r_n_16 ,\ramloop[1].ram.r_n_17 ,\ramloop[1].ram.r_n_18 ,\ramloop[1].ram.r_n_19 ,\ramloop[1].ram.r_n_20 ,\ramloop[1].ram.r_n_21 ,\ramloop[1].ram.r_n_22 ,\ramloop[1].ram.r_n_23 ,\ramloop[1].ram.r_n_24 ,\ramloop[1].ram.r_n_25 ,\ramloop[1].ram.r_n_26 ,\ramloop[1].ram.r_n_27 ,\ramloop[1].ram.r_n_28 ,\ramloop[1].ram.r_n_29 ,\ramloop[1].ram.r_n_30 ,\ramloop[1].ram.r_n_31 }),
        .addra(addra),
        .clka(clka));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.addra(addra[9:0]),
        .\addra[10] (\ramloop[0].ram.r_n_18 ),
        .clka(clka),
        .\douta[31] ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 ,\ramloop[2].ram.r_n_8 ,\ramloop[2].ram.r_n_9 ,\ramloop[2].ram.r_n_10 ,\ramloop[2].ram.r_n_11 ,\ramloop[2].ram.r_n_12 ,\ramloop[2].ram.r_n_13 }));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram ),
        .addra(addra),
        .clka(clka),
        .ram_douta(ram_douta));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.DOADO(DOADO),
        .DOBDO(DOBDO),
        .addra(addra),
        .clka(clka));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1
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

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.addra(addra),
        .\addra[10] (\addra[10] ),
        .clka(clka),
        .\douta[31] (\douta[31] ));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init
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
    .INITP_00(256'hEFAE16CDB6164ABE14F748C4CFF9942D1A2433EEF10E659C08FB3B1F90E3437B),
    .INITP_01(256'h6EBBA42F528D0C3A2A539527136DF296A028D5AFAFD028DB3136AFE03A67885E),
    .INITP_02(256'h919EEED52B5F3562EAA43F438D5ABE2A16C4F642EFF314A53D95CBECB0681A21),
    .INITP_03(256'hA216FABED5A57B849EEA90690F202A8EB91E46CC48AABC0B9133022EB3C5A13C),
    .INITP_04(256'h06891BAAB84A1173427BBB02F50DC4E7B1B1F9626532FF302E53C858BE1B1FD5),
    .INITP_05(256'h3D4F2166EFA559139419EFF85799E612BCE752E52C94CAB7813CD66430FCA55F),
    .INITP_06(256'hC0F529D4BBE6D4A9DA603AFCF96E00D55ABB8657C52702AAFE55B539D0A3E4A1),
    .INITP_07(256'h7B5B84A353FBBB40C47F54FABD816C1B6136FEF47F5798DFFAB846C127532EE7),
    .INIT_00(256'h2873C4412B14E525842682610EEE12D7E1068BC98CF4B5D9F3F9469D6CE12647),
    .INIT_01(256'h863BA345CCE0B4CE31255A097F5681B01A12CEE0C5C2F9ADB3D575451FB949AB),
    .INIT_02(256'hE8A791704DBF66EB6B99AF37B058EC7EAEE2F7F9C8561E7FD1615E244D72877A),
    .INIT_03(256'h3B8EFFDCCC778D6065FA6190D6428E639A84CA00F81C7B4995A14972D31EE2B9),
    .INIT_04(256'hAA3BB0465BC835CC309CCBF7F82A0B0DFCD11093847C6FC3EF5D9111A82989B6),
    .INIT_05(256'h261F92019913D30275A682B5DDCFE973AB011340C585908700C7C317B6238400),
    .INIT_06(256'hF0068EC9117022B345117BB45BBC8CC1E3A0EA18498783BD9EF78EAEF831B9C6),
    .INIT_07(256'h4F89CF001D5CB0D2FC97993B9500E5E56B5ACB78D6907067E8829D88FB6DD754),
    .INIT_08(256'hB9F31FB93EA172EED3F9F1E196FC85B5B5C777DA3814A425A36D5BAC82720222),
    .INIT_09(256'h74A9565D8B28DA31751CBF47B55D19822CE012BDCE4AE51CFB7AE0840EA39CC0),
    .INIT_0A(256'h4EB0A9A4B6AFE8A79BEB60266DB88A0AEB898A8BBE55CCC4EF9DA0FAAE389C6C),
    .INIT_0B(256'hD1118CD79EAC49B7FDBDFFDDEEEF20BD1E71B7D2DEAA7766FCD70F30979AAB26),
    .INIT_0C(256'hC4A69CF073B8F326FCE04B80943DF44A9353CDAF0E2BC96AC937482A759002C3),
    .INIT_0D(256'h03A4ED26D0DAD5D7773E91B7ABA6CCBA7CE8C52B179C957C06A6B75C7A026475),
    .INIT_0E(256'hC703162F7A73BA81F1E8583D116C7A9667BE9D4BDF28C52FF8414BA66B1AB47C),
    .INIT_0F(256'h8308893F3F0352A8A3F650C2AEB3C3F3CB12A29A149D6F0881FD064860AFBA59),
    .INIT_10(256'hF799C10985AC74B6E3676CCA4336A222158F9E587E59AB4C5B884F29A5B47006),
    .INIT_11(256'h87C7EB1986E756C71EBA65EACD97AE4FC832E6A54CE864842A61DF92EA5A03D6),
    .INIT_12(256'h12DE4C905ADE6B91C6859A5D185F96AD034458C256A3EF37CA8BE8D0C0B906B1),
    .INIT_13(256'h55C47052E352DF3ABB8FF96F1DADC16BD244C5041D9E7715E0BDA03A9E329B48),
    .INIT_14(256'hD75C2CD960C7AA73E9896CEBE0C011D52B805EB84CEEA84819B9DDE4BB41D3B2),
    .INIT_15(256'h812B3E80A116A215B3F3B4882300951FBDC108877AE3C663EA69557EE186AC73),
    .INIT_16(256'hA648A3CDE7F307034ED373A6BCA09B6219CC32FB43819F62B67E995BEFAA2F55),
    .INIT_17(256'h27CC8644C14E4D83EACEFB557337B97B6647C438DD27DACB6C1539DA49CBC63B),
    .INIT_18(256'hAC2BF8830CC2D9B7B81D6AE97545E367A3DE92EED04B3CEBCBF2BCC9882D364A),
    .INIT_19(256'hF917C9A52303BBBD0FC79DFB3D9432AF55A3C63B5E089EB7ABE32F0740D67F56),
    .INIT_1A(256'hF96D5E32C971D46E3FF79DFD4D20928F9D7CD6D0BF9943443BE18A0A210EA8FC),
    .INIT_1B(256'hF369A29ED3B27B9186D8DE15B4BF8B48E9B63651C8C7BFDDE2E557D263AF9E9E),
    .INIT_1C(256'h31CF9DD8BE4A8B525EB0307F8D92D593576680C0021D6295521EF22BD4E2AB90),
    .INIT_1D(256'h8784DAB45BEF65D9498AA2A5D03EDB4FCB9D1F52A348ABEACC35B8C59CE8DC40),
    .INIT_1E(256'hF9DA4D79BEDFDA3E5D00EBA1AC404ED39754C93A83BFFE0A02B39C25C84D780E),
    .INIT_1F(256'h6744F43829B110B89B3A636D37FEFB1605D0869D5EB82EA4C5C8ECDFBF08C7D7),
    .INIT_20(256'h544420D62175DBE3366437CCAD1EEB84C41D8C5A44F6881B5DF8B26A37AEEC81),
    .INIT_21(256'h8A0A0F378B1AA8D0763F2A5F75F0FE7FCA9510FB23F7677AD1456912A7A3EBE3),
    .INIT_22(256'h214C6001C0BDBAFC5A84D829F5FD6B01C7783D6899EBA3480BC6CDC25BE87A51),
    .INIT_23(256'h21E3EE15011523B0A42DC26A5EAF87674352CBD47433C0CB34C10E0516F2964C),
    .INIT_24(256'h9417E2B5AFA6125FAFAF22F88CE1765460C7A3176EC718F6E14F075AFF767D28),
    .INIT_25(256'h7E4487BE8637D070D577288972733624C7E39CD7F3F3CC2C2F0A3171C2FF0BA6),
    .INIT_26(256'hEE6ECD31D47124559F5065AB1EEC5D00183ADBF963C9AFF8058CD2772BA3516C),
    .INIT_27(256'hC2222CA37E58791BBD23329C59A4DEE882DE9131DCA52D2CAD6ABD2925B8D60F),
    .INIT_28(256'h5F97C832B4CEF4449B984E0FBC731BA1D95BED1E0109B812DFC0DA7B97D446E4),
    .INIT_29(256'hAA14088224CC64CCA29D83BEB24AD5AFD4DA9A2D222DC4C835382CE25632D9A1),
    .INIT_2A(256'hE2FAA739D86A4819653EC5FBDD1B900AC2A4CB8248E2A5590EB0C68516AFC4F9),
    .INIT_2B(256'h075A12DC997AEACFEE15BD6711D9E10E1EBC7A01C19A10ECCA44C25CF7DF1332),
    .INIT_2C(256'h2567BAA2FBED75A68096EE17DFF8D1CEBE4A98EB5B91307FD2CFC9894052C46E),
    .INIT_2D(256'hD40644D6EDBE66A0828084A7C247B1C95F9DA44A52769F86C5C3E2ABF8360CEC),
    .INIT_2E(256'h9F476D14F0D2B08DA8F4E6485D8837F4B5F3EDA471F612FD90EE362FE70D9225),
    .INIT_2F(256'hC68572962017A4414099A6B56AF2DB9420C57EE173DD671B7F5A8ACEEEBC647F),
    .INIT_30(256'h3120B6329464D16E943D187CF444911D3DC7CDBB251C15ADE970C965C06F9545),
    .INIT_31(256'hA685ADC3BFBCB9CC58C9490A833DE86A7725A95F77CE334B90B3B1E6F16164F0),
    .INIT_32(256'hA0CDB5C12698E8C71910D29E1C0F9934D076DC8B500AD79A21077E67AFD465C4),
    .INIT_33(256'h72753447DF3011D52B8063F50592F701D9B90E2B064CE1DB49BA83B9E700AA44),
    .INIT_34(256'hE11CDBE5F44866F6791307F8C2408444AD875040C18622F8BD29447DFF37D35F),
    .INIT_35(256'hE996E0409A81B1E871702A104F8CDED29EDAAEE014E854937302444DBA4903A4),
    .INIT_36(256'h81E345D0A47F5A0A810A92610264CCA2C9F64A223BA2A959181F43CDFD78EDD0),
    .INIT_37(256'hE7D65783CF78DC0A446D8FCFD26A161EDC3A6396A3F018697BC2D5FC671B55E0),
    .INIT_38(256'h1375B69F836117ED6809BF6ECDC097EBFC2A0F073F46566BD735CD783B7AF0CC),
    .INIT_39(256'h33EC91F23CD9A0B8F83EB6D0B48F04D477327485C86A9DF2F24AC3D803039142),
    .INIT_3A(256'h75901A67BC1BB2A4F2A239FFC738B781D29E18614E2AB0760796658FBD671F78),
    .INIT_3B(256'h711663E6E4A67CF02E7B9864B3F406436B512F0CDDCEAA01E75FDEF02CE5460B),
    .INIT_3C(256'h5AD2D50CBB482B97B0DA1EC32DC39028E4D9B3877D77A30D4B038C90B4CFB43D),
    .INIT_3D(256'h9F1F0126C703223AC1CFE93A8EC9FF9AFE05B1AA96769D4B928E23A0012C85D9),
    .INIT_3E(256'h7EE87A813450B98753F941608F005EEBDB4DB5CBB1DFD2E1149D5446BB30EB86),
    .INIT_3F(256'h0E08F28ED3EBB0C1D0B6DFC03D9A57D464C5C8EF00999DC988D4B97517DA72D7),
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0
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
    .INIT_00(256'h000125D50001226EFFFFC6F50001DE91000601DE0006BCB7000AF938FFFF0B5E),
    .INIT_01(256'h00058E860007A4BB0009071900035719FFFF9D430000F57600023A2A0004A2F5),
    .INIT_02(256'h0007705F0003FF99000495A00004DD4700088C5C0009F2B20007667700038BB1),
    .INIT_03(256'h00004B8FFFFF3129000225DE00066A7C000782AB000AC835FFFF85D700036601),
    .INIT_04(256'h0008E9C100099E940004016CFFFFA49E000073F00002F85300056AB300015EF2),
    .INIT_05(256'h000376410003FDBC0004D8D800097D7B000A993E00079F820002E3140006045A),
    .INIT_06(256'hFFFFAED40001AFA20006B7C8000680470009F0F8FFFF889A0003A35D0007DEBB),
    .INIT_07(256'h000987A500035973FFFF760A000032730002282D0005275F0001419E000026B8),
    .INIT_08(256'h0003913E0004BE9A0008CA1D0009A37200070A5E0003A6FC0005719200086D0D),
    .INIT_09(256'h0001AE060006C4BC000757A6000B1DC8FFFF517200034E520007A6F3000365F9),
    .INIT_0A(256'h0003A7B4FFFF22E80000D4140001CEF10005663A00019E1A0000A85FFFFF1DE0),
    .INIT_0B(256'h00049E0800091F260009C49A0006B2520003D6A100052B2C000862F20009B473),
    .INIT_0C(256'h00070D9D0007208F000AFB5CFFFFEC0F00038A830007F9EA0002F2AE0004BB88),
    .INIT_0D(256'hFFFF2AC7000029BB0002C2000004D4F200018C8C0000328EFFFF619B00022D18),
    .INIT_0E(256'h0009D95A0009CC850006FF300002DAB100060422000849470009C5060002A2BF),
    .INIT_0F(256'h000653C1000A29DCFFFFF97300041D080008658E00036C090003DCA200059C97),
    .INIT_10(256'h00010242000241D80004B4E000019B970000AA1CFFFFB799000202680005B282),
    .INIT_11(256'h000975410007E677000410D00005D11600085F9D0008EAF000036B94FFFFEC9F),
    .INIT_12(256'h000B05A6FFFF8AF50003D9340008024B000409D6000474590004CB5B00096B14),
    .INIT_13(256'h0002E66700060E8A000147E800006528FFFFCAC300019E300006AD0B0006CA59),
    .INIT_14(256'h000717D4000306EB00050C080007FBAD0009F30F0003891BFFFF97D1000045DC),
    .INIT_15(256'hFFFF489A00039401000840020003312300044FA70004BF3F0009A6710009F567),
    .INIT_16(256'h0004E240000137600000E6B8FFFFF91200021609000625DC0006E18F0009DF0C),
    .INIT_17(256'h0003298C0005F940000896030009EB7C0003E3B1FFFF12330000964A000241C7),
    .INIT_18(256'h0003B4B800081F450003E5F90004565C0004C3B900090CAD0009BA7D000730C5),
    .INIT_19(256'h000107100000CEC6FFFFED3C0001AE06000684BC000717A6000A6A95FFFF3549),
    .INIT_1A(256'h0005FA880008776D00094B7D0003A296FFFF62E8000007470002636C00049BFC),
    .INIT_1B(256'h00080198000372AE000495220004F7A20008F3A100094ED70006D10B00041BBF),
    .INIT_1C(256'h000000000000000000000000000000000000000000000000FFFF5F43000359DF),
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1
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
    .INIT_00(256'h000000010002000200007F7F000000000001000000007F7F0000000100010002),
    .INIT_01(256'h000000007F7F00000001000100027F7F00010001000000000001000200020001),
    .INIT_02(256'h0001000000010001000200020001000000010001000200017F7F000000000001),
    .INIT_03(256'h0002000200007F7F000000000001000000007F7F00000001000100027F7F0000),
    .INIT_04(256'h7F7F00000001000100027F7F0000000200000001000100020002000100000001),
    .INIT_05(256'h00010001000200020001000000010001000200017F7F00000000000100000000),
    .INIT_06(256'h00007F7F000000000001000000007F7F00000001000100027F7F000000010000),
    .INIT_07(256'h0001000100027F7F000000010000000000010002000200010000000100010002),
    .INIT_08(256'h000200020001000000010001000200007F7F000000000001000000007F7F0000),
    .INIT_09(256'h000000000001000000007F7F00000001000100027F7F00000001000000010001),
    .INIT_0A(256'h00027F7F00000001000000010001000200020001000000010001000200007F7F),
    .INIT_0B(256'h0001000000010002000200007F7F000000000001000000007F7F000000010001),
    .INIT_0C(256'h0001000000007F7F00000001000100027F7F0000000200000000000100020002),
    .INIT_0D(256'h00010001000000000001000200020001000000010002000200017F7F00000000),
    .INIT_0E(256'h00010002000200007F7F000000000001000000007F7F00000001000100027F7F),
    .INIT_0F(256'h00007F7F00000001000100027F7F000000010000000100010002000200010000),
    .INIT_10(256'h000000000001000200020001000000010002000200007F7F0000000000010000),
    .INIT_11(256'h000200007F7F000000000001000000007F7F00000001000100027F7F00000002),
    .INIT_12(256'h00000001000100027F7F00000002000000010001000200020001000000010002),
    .INIT_13(256'h0001000200020001000000010002000200007F7F000000000001000000007F7F),
    .INIT_14(256'h7F7F000000000001000000007F7F00000001000100027F7F0001000100000000),
    .INIT_15(256'h000100027F7F0000000100000001000100020002000100000001000200020000),
    .INIT_16(256'h00020001000000010002000200007F7F000000000001000000007F7F00000001),
    .INIT_17(256'h00000001000000007F7F00000001000100027F7F000000010000000100010002),
    .INIT_18(256'h7F7F00000002000000000001000200020001000000010002000200007F7F0000),
    .INIT_19(256'h000000010002000200017F7F000000000001000000007F7F0000000100010002),
    .INIT_1A(256'h000000007F7F00000001000100027F7F00000001000000010001000200020001),
    .INIT_1B(256'h0001000000000001000200020001000000010002000200007F7F000000000001),
    .INIT_1C(256'h0002000200007F7F000000000001000000007F7F00000001000100027F7F0000),
    .INIT_1D(256'h7F7F00000001000100027F7F0000000100000001000100020002000100000001),
    .INIT_1E(256'h00000001000200020001000000010002000200007F7F7F7F0000000100000000),
    .INIT_1F(256'h00007F7F000000000001000000007F7F00000001000100027F7F000000010000),
    .INIT_20(256'h0001000100027F7F000100020000000000010002000200010000000100020002),
    .INIT_21(256'h000200020001000000010002000200007F7F000000000001000000007F7F0000),
    .INIT_22(256'h000000000001000000007F7F00000001000100027F7F00000002000000010001),
    .INIT_23(256'h00027F7F00010002000000000001000200020001000000010002000200017F7F),
    .INIT_24(256'h0001000000010002000200017F7F000000000001000000007F7F000000010001),
    .INIT_25(256'h0001000000007F7F00000001000100027F7F0000000100000001000100020002),
    .INIT_26(256'h00000001000000010001000200020001000100010002000200017F7F00000000),
    .INIT_27(256'h00010002000200007F7F000000000001000000007F7F00000001000100027F7F),
    .INIT_28(256'h00007F7F00000001000100027F7F000100010000000100010002000200010000),
    .INIT_29(256'h000000010001000200020001000000010001000200017F7F0000000000010000),
    .INIT_2A(256'h000200007F7F000000000001000000007F7F00000001000100027F7F00010001),
    .INIT_2B(256'h00000001000100027F7F00000002000000010001000200020001000000010002),
    .INIT_2C(256'h0001000200020001000000010001000200007F7F000000000001000000007F7F),
    .INIT_2D(256'h7F7F000000000001000000007F7F00000001000100027F7F0000000100000001),
    .INIT_2E(256'h000100027F7F0000000100000001000100020002000100010001000200020000),
    .INIT_2F(256'h00020001000000010002000200007F7F000000000001000000007F7F00000001),
    .INIT_30(256'h00000001000000007F7F00000001000100027F7F000100020000000000010002),
    .INIT_31(256'h7F7F00000001000000010001000200020001000000010002000200007F7F0000),
    .INIT_32(256'h000000010002000200017F7F000000000001000000007F7F0000000100010002),
    .INIT_33(256'h000000007F7F00000001000100027F7F00000002000100000001000200020001),
    .INIT_34(256'h0001000000000001000200020001000000010002000200017F7F000000000001),
    .INIT_35(256'h0001000200007F7F000000000001000000007F7F00000001000100027F7F0001),
    .INIT_36(256'h7F7F00000001000100027F7F0001000100000001000100020002000100000001),
    .INIT_37(256'h00000001000200020001000000010002000200007F7F00000000000100000000),
    .INIT_38(256'h00017F7F000000000001000000007F7F00000001000100027F7F000000020000),
    .INIT_39(256'h0001000100027F7F000000010000000100010002000200010000000100020002),
    .INIT_3A(256'h000200020001000000010002000200007F7F000000000001000000007F7F0000),
    .INIT_3B(256'h000000000001000000007F7F00000001000100027F7F00000001000000010001),
    .INIT_3C(256'h00027F7F00000002000000010001000200020001000000010002000200007F7F),
    .INIT_3D(256'h0001000100010002000200007F7F7F7F00000001000000007F7F000000010001),
    .INIT_3E(256'h0001000000007F7F00000001000100027F7F0000000100000001000100020002),
    .INIT_3F(256'h00010001000000000001000200020001000000010002000200007F7F00000000),
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

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (douta,
    addra,
    clka);
  output [31:0]douta;
  input [10:0]addra;
  input clka;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
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
(* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth inst_blk_mem_gen
       (.addra(addra),
        .clka(clka),
        .douta(douta));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_1_synth
   (douta,
    addra,
    clka);
  output [31:0]douta;
  input [10:0]addra;
  input clka;

  wire [10:0]addra;
  wire clka;
  wire [31:0]douta;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
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
