onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib b1_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {b1_blkmem.udo}

run -all

quit -force
