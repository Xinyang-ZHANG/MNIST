-makelib ies_lib/xil_defaultlib -sv \
  "D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Vivado2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../ipstatic/src/ClockGen.vhd" \
  "../../../ipstatic/src/SyncAsync.vhd" \
  "../../../ipstatic/src/SyncAsyncReset.vhd" \
  "../../../ipstatic/src/DVI_Constants.vhd" \
  "../../../ipstatic/src/OutputSERDES.vhd" \
  "../../../ipstatic/src/TMDS_Encoder.vhd" \
  "../../../ipstatic/src/rgb2dvi.vhd" \
  "../../../ip/rgb2dvi_hdmi/sim/rgb2dvi_hdmi.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

