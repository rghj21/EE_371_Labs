onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bitCounting_testbench/CLOCK_PERIOD
add wave -noupdate /bitCounting_testbench/in
add wave -noupdate /bitCounting_testbench/reset
add wave -noupdate /bitCounting_testbench/clk
add wave -noupdate /bitCounting_testbench/start
add wave -noupdate /bitCounting_testbench/result
add wave -noupdate /bitCounting_testbench/dut/doneFlag
add wave -noupdate /bitCounting_testbench/dut/A
add wave -noupdate /bitCounting_testbench/dut/ps
add wave -noupdate /bitCounting_testbench/dut/ns
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
WaveRestoreZoom {504 ps} {1064 ps}
