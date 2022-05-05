# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./DE1_SoC.sv"
vlog "./task1.sv"
vlog "./shiftRightA.sv"
vlog "./task1HexDisplay.sv"
vlog "./binarySearchDatapath.sv"
vlog "./binarySearchControl.sv"
vlog "./RAM32X8.v"
vlog "./DE1_SoC_task2.sv"
vlog "./all_seg7.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work binarySearchDatapath_testbench
# vsim -voptargs="+acc" -t 1ps -lib work binarySearchDatapath_testbench -Lf altera_mf_ver

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do binarySearchDatapath.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
