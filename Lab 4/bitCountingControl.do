onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bitCountingControl_testbench/dut/in
add wave -noupdate /bitCountingControl_testbench/dut/reset
add wave -noupdate /bitCountingControl_testbench/dut/clk
add wave -noupdate /bitCountingControl_testbench/dut/start
add wave -noupdate /bitCountingControl_testbench/dut/done
add wave -noupdate /bitCountingControl_testbench/dut/ready
add wave -noupdate /bitCountingControl_testbench/dut/incr_result
add wave -noupdate /bitCountingControl_testbench/dut/shiftA
add wave -noupdate /bitCountingControl_testbench/dut/A_is_zero
add wave -noupdate /bitCountingControl_testbench/dut/inputA
add wave -noupdate /bitCountingControl_testbench/dut/ps
add wave -noupdate /bitCountingControl_testbench/dut/ns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {174 ps} 0}
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
