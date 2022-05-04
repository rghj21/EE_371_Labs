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
add wave -noupdate /DE1_SoC_testbench/dut/CLOCK_50
add wave -noupdate {/DE1_SoC_testbench/dut/KEY[0]}
add wave -noupdate /DE1_SoC_testbench/dut/reset
add wave -noupdate {/DE1_SoC_testbench/dut/KEY[3]}
add wave -noupdate /DE1_SoC_testbench/dut/start
add wave -noupdate /DE1_SoC_testbench/dut/count/A
add wave -noupdate /DE1_SoC_testbench/dut/SW
add wave -noupdate -radix unsigned /DE1_SoC_testbench/dut/out
add wave -noupdate /DE1_SoC_testbench/dut/count/result
add wave -noupdate -radix 7segHex /DE1_SoC_testbench/dut/HEX0
add wave -noupdate /DE1_SoC_testbench/dut/done
add wave -noupdate {/DE1_SoC_testbench/dut/LEDR[9]}
add wave -noupdate /DE1_SoC_testbench/dut/count/ps
add wave -noupdate /DE1_SoC_testbench/dut/count/ns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1198 ps} 0}
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
