onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+W2_blkmem -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_1 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.W2_blkmem xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {W2_blkmem.udo}

run -all

endsim

quit -force