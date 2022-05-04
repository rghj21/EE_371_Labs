onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_testbench/dut/CLOCK_50
add wave -noupdate {/DE1_SoC_testbench/dut/KEY[0]}
add wave -noupdate /DE1_SoC_testbench/dut/reset
add wave -noupdate {/DE1_SoC_testbench/dut/KEY[3]}
add wave -noupdate /DE1_SoC_testbench/dut/start
add wave -noupdate /DE1_SoC_testbench/dut/SW
add wave -noupdate /DE1_SoC_testbench/dut/currA
add wave -noupdate /DE1_SoC_testbench/dut/incr_result
add wave -noupdate /DE1_SoC_testbench/dut/A_is_zero
add wave -noupdate /DE1_SoC_testbench/dut/out
add wave -noupdate /DE1_SoC_testbench/dut/HEX0
add wave -noupdate /DE1_SoC_testbench/dut/done
add wave -noupdate {/DE1_SoC_testbench/dut/LEDR[9]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {915 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 2
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2573 ps}
