onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib layer1_ram_opt

do {wave.do}

view wave
view structure
view signals

do {layer1_ram.udo}

run -all

quit -force
