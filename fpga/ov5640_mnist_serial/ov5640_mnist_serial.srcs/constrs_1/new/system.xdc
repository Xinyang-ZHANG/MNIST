
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property PACKAGE_PIN J16 [get_ports {number[0]}]
set_property PACKAGE_PIN K16 [get_ports {number[1]}]
set_property PACKAGE_PIN M15 [get_ports {number[2]}]
set_property PACKAGE_PIN M14 [get_ports {number[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {number[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {number[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {number[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {number[0]}]







create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list cmos1_pclk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {mnist_process/mnist_data[0]} {mnist_process/mnist_data[1]} {mnist_process/mnist_data[2]} {mnist_process/mnist_data[3]} {mnist_process/mnist_data[4]} {mnist_process/mnist_data[5]} {mnist_process/mnist_data[6]} {mnist_process/mnist_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list mnist_process/mnist_data_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets cmos1_pclk_IBUF_BUFG]
