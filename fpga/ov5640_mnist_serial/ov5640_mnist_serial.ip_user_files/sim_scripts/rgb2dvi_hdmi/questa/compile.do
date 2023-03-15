vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv -L smartconnect_v1_0 -L axi_protocol_checker_v2_0_1 -L axi_vip_v1_1_1 -L processing_system7_vip_v1_0_3 -L xilinx_vip "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../ipstatic/src/ClockGen.vhd" \
"../../../ipstatic/src/SyncAsync.vhd" \
"../../../ipstatic/src/SyncAsyncReset.vhd" \
"../../../ipstatic/src/DVI_Constants.vhd" \
"../../../ipstatic/src/OutputSERDES.vhd" \
"../../../ipstatic/src/TMDS_Encoder.vhd" \
"../../../ipstatic/src/rgb2dvi.vhd" \
"../../../ip/rgb2dvi_hdmi/sim/rgb2dvi_hdmi.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

