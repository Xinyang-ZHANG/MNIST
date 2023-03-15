//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Dec 27 15:54:51 2022
//Host        : DESKTOP-C3MDEKS running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
 DDR_ba,
 DDR_cas_n,
 DDR_ck_n,
 DDR_ck_p,
 DDR_cke,
 DDR_cs_n,
 DDR_dm,
 DDR_dq,
 DDR_dqs_n,
 DDR_dqs_p,
 DDR_odt,
 DDR_ras_n,
 DDR_reset_n,
 DDR_we_n,
 FIXED_IO_ddr_vrn,
 FIXED_IO_ddr_vrp,
 FIXED_IO_mio,
 FIXED_IO_ps_clk,
 FIXED_IO_ps_porb,
 FIXED_IO_ps_srstb,
 TMDS_clk_n,
 TMDS_clk_p,
 TMDS_data_n,
 TMDS_data_p,
 cmos1_d,
 cmos1_href,
 cmos1_i2c_scl_io,
 cmos1_i2c_sda_io,
 cmos1_pclk,
 cmos1_vsync,
 cmos_rstn_tri_o,
 hdmi_oen,
 number);
inout [14:0]DDR_addr;
inout [2:0]DDR_ba;
inout DDR_cas_n;
inout DDR_ck_n;
inout DDR_ck_p;
inout DDR_cke;
inout DDR_cs_n;
inout [3:0]DDR_dm;
inout [31:0]DDR_dq;
inout [3:0]DDR_dqs_n;
inout [3:0]DDR_dqs_p;
inout DDR_odt;
inout DDR_ras_n;
inout DDR_reset_n;
inout DDR_we_n;
inout FIXED_IO_ddr_vrn;
inout FIXED_IO_ddr_vrp;
inout [53:0]FIXED_IO_mio;
inout FIXED_IO_ps_clk;
inout FIXED_IO_ps_porb;
inout FIXED_IO_ps_srstb;
output TMDS_clk_n;
output TMDS_clk_p;
output [2:0]TMDS_data_n;
output [2:0]TMDS_data_p;
input [9:0]cmos1_d;
input cmos1_href;
inout cmos1_i2c_scl_io;
inout cmos1_i2c_sda_io;
input cmos1_pclk;
input cmos1_vsync;
output [0:0]cmos_rstn_tri_o;
output hdmi_oen;
output [3:0]    number;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire LOCKED_O_0;
  wire PXL_CLK_5X_O_0;
  wire PXL_CLK_O;
  wire [23:0]S_AXIS_ov5640_tdata;
  wire [1:0]S_AXIS_ov5640_tkeep;
  wire S_AXIS_ov5640_tlast;
  wire S_AXIS_ov5640_tready;
  wire [0:0]S_AXIS_ov5640_tuser;
  wire S_AXIS_ov5640_tvalid;
  wire clk142m;
  wire [0:0]rstn142m;
  wire cmos1_i2c_scl_i;
  wire cmos1_i2c_scl_o;
  wire cmos1_i2c_scl_t;
  wire cmos1_i2c_sda_i;
  wire cmos1_i2c_sda_o;
  wire cmos1_i2c_sda_t;
  wire [0:0]cmos_rstn_tri_o;
  wire hdmi_io_out_active_video;
  wire [23:0]hdmi_io_out_data;
  wire hdmi_io_out_field;
  wire hdmi_io_out_hblank;
  wire hdmi_io_out_hsync;
  wire hdmi_io_out_vblank;
  wire hdmi_io_out_vsync;
  wire cmos1_vsync_o;
  wire cmos1_href_o;
  wire [9:0]    cmos1_d_o;
  
  wire  mnist_en;
  wire  mnist_start;
  wire  load_start;
  wire  mnist_data_valid;
  wire [7:0]    mnist_data;
  
  wire  mnist_data_norm_valid;
  wire [15:0]   mnist_data_norm;
  
  IOBUF cmos1_i2c_scl_iobuf
       (.I(cmos1_i2c_scl_o),
        .IO(cmos1_i2c_scl_io),
        .O(cmos1_i2c_scl_i),
        .T(cmos1_i2c_scl_t));
  IOBUF cmos1_i2c_sda_iobuf
       (.I(cmos1_i2c_sda_o),
        .IO(cmos1_i2c_sda_io),
        .O(cmos1_i2c_sda_i),
        .T(cmos1_i2c_sda_t));
 
  red_block red_block(
      .cmos_vsync(cmos1_vsync),       //cmos vsync
      .cmos_href(cmos1_href),        //cmos hsync refrence
      .cmos_pclk(cmos1_pclk),        //cmos pxiel clock
      .cmos_d(cmos1_d),              //cmos data
      .number_i(number),             //mnist result
      .cmos_vsync_o(cmos1_vsync_o),       //cmos vsync
      .cmos_href_o(cmos1_href_o),        //cmos hsync refrence
      .cmos_d_o(cmos1_d_o),           //cmos data
      .mnist_en(mnist_en),
      .mnist_start(mnist_start),
      .load_start(load_start)
  );
     
  alinx_ov5640 #(
      .BUFFER_DEPTH(2048))
  alinx_ov5640(
      .cmos_vsync(cmos1_vsync_o),       //cmos vsync
      .cmos_href(cmos1_href_o),        //cmos hsync refrence
      .cmos_pclk(cmos1_pclk),        //cmos pxiel clock
      .cmos_d(cmos1_d_o),           //cmos data
      .mnist_en(mnist_en),
      .m_axis_video_aclk(clk142m),     // AXI4-Stream clock
      .m_axis_video_aresetn(rstn142m),  // AXI4-Stream reset, active low 
      .m_axis_video_tdata(S_AXIS_ov5640_tdata),    // AXI4-Stream data
      .m_axis_video_tvalid(S_AXIS_ov5640_tvalid),   // AXI4-Stream valid 
      .m_axis_video_tready(S_AXIS_ov5640_tready),   // AXI4-Stream ready 
      .m_axis_video_tuser(S_AXIS_ov5640_tuser),    // AXI4-Stream tuser (SOF)
      .m_axis_video_tlast(S_AXIS_ov5640_tlast),    // AXI4-Stream tlast (EOL)
      .m_axis_video_tkeep(S_AXIS_ov5640_tkeep),    // AXI4-Stream tkeep
      .mnist_data_valid(mnist_data_valid),
      .mnist_data(mnist_data)
  );
  
  
  mnist_256to1pix   mnist_256to1pix(
      .cmos_pclk(cmos1_pclk),        //cmos pxiel clock
      //mnist data
      .mnist_data_valid(mnist_data_valid),
      .mnist_data(mnist_data),
      //mnist 28x28
      .mnist_data_valid_norm(mnist_data_norm_valid),
      .mnist_data_norm(mnist_data_norm),
      //mnist start
      .mnist_start(mnist_start)
  );
  
  mnist_process mnist_process(
      .cmos_pclk(cmos1_pclk),        //cmos pxiel clock
      .load_start(load_start),
      //mnist data
      .mnist_data_valid(mnist_data_norm_valid),
      .mnist_data(mnist_data_norm),
      //output
      .number_o(number)
      );

  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .LOCKED_O_0(LOCKED_O_0),
        .PXL_CLK_5X_O_0(PXL_CLK_5X_O_0),
        .PXL_CLK_O(PXL_CLK_O),
        .S_AXIS_ov5640_tdata(S_AXIS_ov5640_tdata),
        .S_AXIS_ov5640_tkeep(S_AXIS_ov5640_tkeep),
        .S_AXIS_ov5640_tlast(S_AXIS_ov5640_tlast),
        .S_AXIS_ov5640_tready(S_AXIS_ov5640_tready),
        .S_AXIS_ov5640_tuser(S_AXIS_ov5640_tuser),
        .S_AXIS_ov5640_tvalid(S_AXIS_ov5640_tvalid),
        .clk142m(clk142m),
        .cmos1_i2c_scl_i(cmos1_i2c_scl_i),
        .cmos1_i2c_scl_o(cmos1_i2c_scl_o),
        .cmos1_i2c_scl_t(cmos1_i2c_scl_t),
        .cmos1_i2c_sda_i(cmos1_i2c_sda_i),
        .cmos1_i2c_sda_o(cmos1_i2c_sda_o),
        .cmos1_i2c_sda_t(cmos1_i2c_sda_t),
        .cmos_rstn_tri_o(cmos_rstn_tri_o),
        .hdmi_io_out_active_video(hdmi_io_out_active_video),
        .hdmi_io_out_data(hdmi_io_out_data),
        .hdmi_io_out_field(hdmi_io_out_field),
        .hdmi_io_out_hblank(hdmi_io_out_hblank),
        .hdmi_io_out_hsync(hdmi_io_out_hsync),
        .hdmi_io_out_vblank(hdmi_io_out_vblank),
        .hdmi_io_out_vsync(hdmi_io_out_vsync),
        .rstn142m(rstn142m));
        
       rgb2dvi_hdmi  rgb2dvi_hdmi(
             .vid_pData(hdmi_io_out_data),
             .vid_pHSync(hdmi_io_out_hsync),
             .vid_pVSync(hdmi_io_out_vsync),
             .vid_pVDE(hdmi_io_out_active_video),
             .aRst_n(LOCKED_O_0),
             .PixelClk(PXL_CLK_O),
             .SerialClk(PXL_CLK_5X_O_0),
             .TMDS_Clk_p(TMDS_clk_p),
             .TMDS_Clk_n(TMDS_clk_n),
             .TMDS_Data_p(TMDS_data_p),
             .TMDS_Data_n(TMDS_data_n),
             .oen(hdmi_oen)
        );
            
endmodule
