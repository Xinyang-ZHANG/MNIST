vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" "+incdir+D:/Vivado2017.4/Vivado/2017.4/data/xilinx_vip/include" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93 \
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

