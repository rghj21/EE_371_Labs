onerror {resume}
radix define 7segHex {
    "7'b1000000" "0" -color "white",
    "7'b1111001" "1" -color "white",
    "7'b0100100" "2" -color "white",
    "7'b0110000" "3" -color "white",
    "7'b0011001" "4" -color "white",
    "7'b0010010" "5" -color "white",
    "7'b0000010" "6" -color "white",
    "7'b1111000" "7" -color "white",
    "7'b0000000" "8" -color "white",
    "7'b0010000" "9" -color "white",
    "7'b0001000" "A" -color "white",
    "7'b0000011" "B" -color "white",
    "7'b1000110" "C" -color "white",
    "7'b0100001" "D" -color "white",
    "7'b0000110" "E" -color "white",
    "7'b0001110" "F" -color "white",
    "7'b1111111" "off" -color "white",
    -default binary
}
quietly WaveActivateNextPane {} 0
add wave -noupdate /DE1_SoC_task2_testbench/dut/CLOCK_50
add wave -noupdate /DE1_SoC_task2_testbench/dut/correct
add wave -noupdate /DE1_SoC_task2_testbench/dut/ready
add wave -noupdate /DE1_SoC_task2_testbench/dut/increment
add wave -noupdate /DE1_SoC_task2_testbench/dut/decrement
add wave -noupdate /DE1_SoC_task2_testbench/dut/reset
add wave -noupdate /DE1_SoC_task2_testbench/dut/start
add wave -noupdate /DE1_SoC_task2_testbench/dut/addr
add wave -noupdate /DE1_SoC_task2_testbench/dut/ramOut
add wave -noupdate /DE1_SoC_task2_testbench/dut/currData
add wave -noupdate -radix 7segHex /DE1_SoC_task2_testbench/dut/HEX0
add wave -noupdate -radix 7segHex /DE1_SoC_task2_testbench/dut/HEX1
add wave -noupdate {/DE1_SoC_task2_testbench/dut/LEDR[9]}
add wave -noupdate {/DE1_SoC_task2_testbench/LEDR[0]}
add wave -noupdate -radix unsigned /DE1_SoC_task2_testbench/dut/left
add wave -noupdate -radix unsigned /DE1_SoC_task2_testbench/dut/right
add wave -noupdate /DE1_SoC_task2_testbench/dut/datapath/mid
add wave -noupdate /DE1_SoC_task2_testbench/dut/control/A
add wave -noupdate /DE1_SoC_task2_testbench/dut/ram/address
add wave -noupdate /DE1_SoC_task2_testbench/dut/ram/q
add wave -noupdate /DE1_SoC_task2_testbench/dut/control/ps
add wave -noupdate /DE1_SoC_task2_testbench/dut/control/ns
add wave -noupdate /DE1_SoC_task2_testbench/dut/control/correct
add wave -noupdate /DE1_SoC_task2_testbench/dut/datapath/fail
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2705294 ps} 0}
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
WaveRestoreZoom {0 ps} {3937500 ps}
