onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+conv2_ram -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_1 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.conv2_ram xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {conv2_ram.udo}

run -all

endsim

quit -force
