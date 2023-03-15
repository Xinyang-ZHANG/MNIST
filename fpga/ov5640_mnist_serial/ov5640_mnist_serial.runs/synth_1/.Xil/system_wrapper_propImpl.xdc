set_property SRC_FILE_INFO {cfile:D:/Alinx/Alinx7010/Self_learning/ov5640_mnist_serial/ov5640_mnist_serial.srcs/constrs_1/new/system.xdc rfile:../../../ov5640_mnist_serial.srcs/constrs_1/new/system.xdc id:1} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Alinx/Alinx7010/Self_learning/ov5640_mnist_serial/ov5640_mnist_serial.srcs/constrs_1/new/hdmi_out.xdc rfile:../../../ov5640_mnist_serial.srcs/constrs_1/new/hdmi_out.xdc id:2} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Alinx/Alinx7010/Self_learning/ov5640_mnist_serial/ov5640_mnist_serial.srcs/constrs_1/new/an5642.xdc rfile:../../../ov5640_mnist_serial.srcs/constrs_1/new/an5642.xdc id:3} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:4 order:LATE scoped_inst:alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.rd_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:5 order:LATE scoped_inst:alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.wr_pntr_cdc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:6 order:LATE scoped_inst:alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.wr_pntr_cdc_dc_inst unmanaged:yes} [current_design]
set_property SRC_FILE_INFO {cfile:D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl rfile:../../../../../../../Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/tcl/xpm_cdc_gray.tcl id:7 order:LATE scoped_inst:alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.rd_pntr_cdc_dc_inst unmanaged:yes} [current_design]
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN J16 [get_ports {number[0]}]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN K16 [get_ports {number[1]}]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M15 [get_ports {number[2]}]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN M14 [get_ports {number[3]}]
set_property src_info {type:XDC file:1 line:20 export:INPUT save:INPUT read:READ} [current_design]
create_debug_core u_ila_0 ila
set_property src_info {type:XDC file:1 line:21 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:27 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:28 export:INPUT save:INPUT read:READ} [current_design]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property src_info {type:XDC file:1 line:29 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
set_property src_info {type:XDC file:1 line:30 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/clk [get_nets [list cmos1_pclk_IBUF_BUFG]]
set_property src_info {type:XDC file:1 line:31 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:32 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
set_property src_info {type:XDC file:1 line:33 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe0 [get_nets [list {mnist_process/number_o[0]} {mnist_process/number_o[1]} {mnist_process/number_o[2]} {mnist_process/number_o[3]}]]
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
create_debug_port u_ila_0 probe
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
set_property src_info {type:XDC file:1 line:37 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port u_ila_0/probe1 [get_nets [list mnist_process/number_val]]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
connect_debug_port dbg_hub/clk [get_nets cmos1_pclk_IBUF_BUFG]
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N18 [get_ports TMDS_clk_p]
set_property src_info {type:XDC file:2 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V20 [get_ports {TMDS_data_p[0]}]
set_property src_info {type:XDC file:2 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T20 [get_ports {TMDS_data_p[1]}]
set_property src_info {type:XDC file:2 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN N20 [get_ports {TMDS_data_p[2]}]
set_property src_info {type:XDC file:2 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V16 [get_ports hdmi_oen]
set_property src_info {type:XDC file:3 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T16      [get_ports {cmos1_i2c_sda_io}]
set_property src_info {type:XDC file:3 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V18     [get_ports {cmos1_d[9]}]
set_property src_info {type:XDC file:3 line:4 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V17     [get_ports {cmos1_d[8]}]
set_property src_info {type:XDC file:3 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T15     [get_ports {cmos1_i2c_scl_io}]
set_property src_info {type:XDC file:3 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T14     [get_ports {cmos1_d[5]}]
set_property src_info {type:XDC file:3 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V13     [get_ports {cmos1_d[3]}]
set_property src_info {type:XDC file:3 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U13     [get_ports {cmos1_d[4]}]
set_property src_info {type:XDC file:3 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN W13     [get_ports {cmos1_d[6]}]
set_property src_info {type:XDC file:3 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN V12     [get_ports {cmos1_d[0]}]
set_property src_info {type:XDC file:3 line:11 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN U12     [get_ports {cmos1_d[7]}]
set_property src_info {type:XDC file:3 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T12     [get_ports {cmos1_d[1]}]
set_property src_info {type:XDC file:3 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T10     [get_ports {cmos1_d[2]}]
set_property src_info {type:XDC file:3 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN T11     [get_ports {cmos1_pclk}]
set_property src_info {type:XDC file:3 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN A20     [get_ports {cmos1_href}]
set_property src_info {type:XDC file:3 line:16 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN B19     [get_ports {cmos1_vsync}]
set_property src_info {type:XDC file:3 line:17 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN B20     [get_ports {cmos_rstn_tri_o[0]}]
set_property src_info {type:XDC file:3 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos1_pclk_IBUF]
current_instance alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.rd_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:4 line:16 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_gray_ff_reg*] -to [get_cells {dest_graysync_ff_reg[0]*}] 7.000
current_instance
current_instance alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.wr_pntr_cdc_inst
set_property src_info {type:SCOPED_XDC file:5 line:16 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_gray_ff_reg*] -to [get_cells {dest_graysync_ff_reg[0]*}] 7.000
current_instance
current_instance alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.wr_pntr_cdc_dc_inst
set_property src_info {type:SCOPED_XDC file:6 line:16 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_gray_ff_reg*] -to [get_cells {dest_graysync_ff_reg[0]*}] 7.000
current_instance
current_instance alinx_ov5640/xpm_fifo_async_inst/gnuram_async_fifo.xpm_fifo_base_inst/gen_cdc_pntr.rd_pntr_cdc_dc_inst
set_property src_info {type:SCOPED_XDC file:7 line:16 export:INPUT save:NONE read:READ} [current_design]
set_bus_skew -from [get_cells src_gray_ff_reg*] -to [get_cells {dest_graysync_ff_reg[0]*}] 7.000
