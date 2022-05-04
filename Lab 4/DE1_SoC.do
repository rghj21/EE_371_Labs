onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /DE1_SoC_testbench/dut/SW
add wave -noupdate {/DE1_SoC_testbench/dut/LEDR[9]}
add wave -noupdate /DE1_SoC_testbench/dut/KEY
add wave -noupdate /DE1_SoC_testbench/dut/CLOCK_50
add wave -noupdate /DE1_SoC_testbench/dut/HEX0
add wave -noupdate /DE1_SoC_testbench/dut/reset
add wave -noupdate /DE1_SoC_testbench/dut/start
add wave -noupdate /DE1_SoC_testbench/dut/out
add wave -noupdate /DE1_SoC_testbench/dut/done
add wave -noupdate /DE1_SoC_testbench/dut/ready
add wave -noupdate /DE1_SoC_testbench/dut/A_zero
add wave -noupdate /DE1_SoC_testbench/dut/A_one
add wave -noupdate /DE1_SoC_testbench/dut/increment
add wave -noupdate /DE1_SoC_testbench/dut/shift
add wave -noupdate /DE1_SoC_testbench/dut/ctrlA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {476 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
