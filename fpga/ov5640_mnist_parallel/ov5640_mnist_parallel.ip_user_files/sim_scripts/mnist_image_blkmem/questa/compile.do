vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/blk_mem_gen_v8_4_1

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap blk_mem_gen_v8_4_1 questa_lib/msim/blk_mem_gen_v8_4_1

vlog -work xil_defaultlib -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_1 -L axi_vip_v1_1_1 -L processing_system7_vip_v1_0_3 -L xilinx_vip "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_1 -64 "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"../../../ip/mnist_image_blkmem/sim/mnist_image_blkmem.v" \

vlog -work xil_defaultlib \
"glbl.v"

