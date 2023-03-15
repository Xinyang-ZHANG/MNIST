onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BN_blkmem_opt

do {wave.do}

view wave
view structure
view signals

do {BN_blkmem.udo}

run -all

quit -force
