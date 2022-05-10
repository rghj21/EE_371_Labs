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
add wave -noupdate /line_drawer_testbench/clk
add wave -noupdate -radix decimal /line_drawer_testbench/x
add wave -noupdate -radix decimal /line_drawer_testbench/y
add wave -noupdate /line_drawer_testbench/reset
add wave -noupdate /line_drawer_testbench/done
add wave -noupdate -radix decimal /line_drawer_testbench/dut/x0
add wave -noupdate -radix decimal /line_drawer_testbench/dut/y0
add wave -noupdate -radix decimal /line_drawer_testbench/dut/x1
add wave -noupdate -radix decimal /line_drawer_testbench/dut/y1
add wave -noupdate /line_drawer_testbench/dut/done
add wave -noupdate -radix decimal /line_drawer_testbench/dut/x
add wave -noupdate -radix decimal /line_drawer_testbench/dut/y
add wave -noupdate -radix decimal /line_drawer_testbench/dut/currX
add wave -noupdate -radix decimal /line_drawer_testbench/dut/currY
add wave -noupdate -radix decimal /line_drawer_testbench/dut/error
add wave -noupdate -radix decimal -childformat {{{/line_drawer_testbench/dut/deltaX[10]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[9]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[8]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[7]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[6]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[5]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[4]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[3]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[2]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[1]} -radix decimal} {{/line_drawer_testbench/dut/deltaX[0]} -radix decimal}} -subitemconfig {{/line_drawer_testbench/dut/deltaX[10]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[9]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[8]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[7]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[6]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[5]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[4]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[3]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[2]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[1]} {-height 15 -radix decimal} {/line_drawer_testbench/dut/deltaX[0]} {-height 15 -radix decimal}} /line_drawer_testbench/dut/deltaX
add wave -noupdate -radix decimal /line_drawer_testbench/dut/deltaY
add wave -noupdate -radix decimal /line_drawer_testbench/dut/absX
add wave -noupdate -radix decimal /line_drawer_testbench/dut/absY
add wave -noupdate -radix decimal /line_drawer_testbench/dut/xFirst
add wave -noupdate -radix decimal /line_drawer_testbench/dut/xSecond
add wave -noupdate -radix decimal /line_drawer_testbench/dut/yFirst
add wave -noupdate -radix decimal /line_drawer_testbench/dut/ySecond
add wave -noupdate -radix decimal /line_drawer_testbench/dut/xStart
add wave -noupdate -radix decimal /line_drawer_testbench/dut/xEnd
add wave -noupdate -radix decimal /line_drawer_testbench/dut/yStart
add wave -noupdate -radix decimal /line_drawer_testbench/dut/yEnd
add wave -noupdate /line_drawer_testbench/dut/isSteep
add wave -noupdate /line_drawer_testbench/dut/yStep
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34 ps} 0}
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
WaveRestoreZoom {0 ps} {2153 ps}
