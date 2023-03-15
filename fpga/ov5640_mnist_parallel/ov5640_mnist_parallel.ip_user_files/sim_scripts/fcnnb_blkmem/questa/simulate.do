onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fcnnb_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {fcnnb_blkmem.udo}

run -all

quit -force
