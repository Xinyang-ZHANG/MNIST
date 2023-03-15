onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fcnnW_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {fcnnW_blkmem.udo}

run -all

quit -force
