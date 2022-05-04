onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /binarySearchControl_testbench/CLOCK_PERIOD
add wave -noupdate /binarySearchControl_testbench/A
add wave -noupdate /binarySearchControl_testbench/currData
add wave -noupdate /binarySearchControl_testbench/reset
add wave -noupdate /binarySearchControl_testbench/clk
add wave -noupdate /binarySearchControl_testbench/start
add wave -noupdate /binarySearchControl_testbench/correct
add wave -noupdate /binarySearchControl_testbench/dataFound
add wave -noupdate /binarySearchControl_testbench/ready
add wave -noupdate /binarySearchControl_testbench/increment
add wave -noupdate /binarySearchControl_testbench/decrement
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {973 ps} 0}
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
WaveRestoreZoom {504 ps} {2026 ps}
