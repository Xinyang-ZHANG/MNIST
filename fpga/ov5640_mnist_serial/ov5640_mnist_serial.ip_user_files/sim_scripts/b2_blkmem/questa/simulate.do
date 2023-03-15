onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib b2_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {b2_blkmem.udo}

run -all

quit -force
