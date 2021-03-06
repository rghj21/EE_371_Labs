onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bitCountingDatapath_testbench/dut/clk
add wave -noupdate /bitCountingDatapath_testbench/dut/ready
add wave -noupdate /bitCountingDatapath_testbench/dut/switchInput
add wave -noupdate /bitCountingDatapath_testbench/dut/currA
add wave -noupdate /bitCountingDatapath_testbench/dut/incr_result
add wave -noupdate /bitCountingDatapath_testbench/dut/A_is_zero
add wave -noupdate /bitCountingDatapath_testbench/dut/result
add wave -noupdate /bitCountingDatapath_testbench/dut/done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {150 ps} 0}
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
WaveRestoreZoom {0 ps} {2363 ps}
