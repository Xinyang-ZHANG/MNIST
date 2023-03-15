onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib W1_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {W1_blkmem.udo}

run -all

quit -force
