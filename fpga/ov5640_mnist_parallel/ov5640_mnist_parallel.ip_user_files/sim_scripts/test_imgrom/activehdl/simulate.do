onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+test_imgrom -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_1 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.test_imgrom xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {test_imgrom.udo}

run -all

endsim

quit -force
