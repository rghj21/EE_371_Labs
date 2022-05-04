onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /binarySearchDatapath_testbench/CLOCK_PERIOD
add wave -noupdate /binarySearchDatapath_testbench/ramOut
add wave -noupdate /binarySearchDatapath_testbench/currData
add wave -noupdate /binarySearchDatapath_testbench/clk
add wave -noupdate /binarySearchDatapath_testbench/ready
add wave -noupdate /binarySearchDatapath_testbench/increment
add wave -noupdate /binarySearchDatapath_testbench/decrement
add wave -noupdate /binarySearchDatapath_testbench/addr
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
WaveRestoreZoom {1548555 ps} {1550077 ps}
