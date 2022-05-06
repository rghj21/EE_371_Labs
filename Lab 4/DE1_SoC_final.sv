// top level module for both task 1 and task 2
//
module DE1_SoC_final(HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, SW, KEY, LEDR, CLOCK_50);
	input logic [9:0] SW;
	input logic [3:0] KEY;
	input logic CLOCK_50;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	// task 1 internal logic
	logic reset, start;
	assign reset = ~KEY[0];
	assign start = ~KEY[3];
	logic [3:0] out;
	logic done;
	
	// task 2 internal logic 
	logic task2LEDR9;
	logic correct, ready, increment, decrement, unsuccessful, fail;
	logic [4:0] addr, left, right;
	logic [7:0] ramOut, currData;
	logic [6:0] HEXOne, HEXZero, HEXTask1, HEXTASK2O, HEXTASK2Z;
	assign task2LEDR9 = correct | fail;
	
	// calls the bit-counting algorithm module and outputs 4-bit result
	bitCounting count(.in(SW[7:0]), .start(start), .reset(reset), .clk(CLOCK_50), .result(out), .done(done));
	// calls the hex display module and determines the value of the all HEX based on result value of bit counter 
	task1HexDisplay hex (.result(out), .HEX0(HEXTask1));
	
	// calls the all_seg7 module and displays the address if found on HEX0 and HEX1
	all_seg7 seg (.loc(addr), .HEX0(HEXZero), .HEX1(HEXOne), .HEX2, .HEX3, .HEX4, .HEX5);
	// calls the 32x8 RAM module
	RAM32X8 ram (.address(addr), .clock(CLOCK_50), .data(0), .wren(0), .q(ramOut));
	// calls the binarySearchDatapath module 
	binarySearchDatapath datapath (.ramOut, .clk(CLOCK_50), .currData, .addr, .ready, .increment, .decrement, .left, .right, .unsuccessful, .fail);
	// calls the binarySearchControl module
	binarySearchControl control (.A(SW[7:0]), .currData, .start, .reset, .clk(CLOCK_50), 
											.correct, .ready, .increment, .decrement, .left, .right, .unsuccessful);
											
	// if found A then we display on the address on the HEX
	always_comb begin
		if(correct) begin
			HEXTASK2O = HEXOne;
			HEXTASK2Z = HEXZero;
		end
		else begin
			HEXTASK2O = 7'b1111111; 
			HEXTASK2Z = 7'b1111111;
		end
	end
	// assign HEX0 and HEX1 for task 1 and 2
	assign HEX0 = SW[9] ? HEXTASK2Z : HEXTask1;
	assign HEX1 = SW[9] ? HEXTASK2O : 7'b1111111;
	// assign LEDR for task 1 and 2
	assign LEDR[9] = SW[9] ? task2LEDR9 : done;
	assign LEDR[0] = SW[9] ? correct : 1'b0;
endmodule


`timescale 1ns/ 1ps
module DE1_SoC_final_testbench();
	logic [9:0] SW;
	logic [3:0] KEY;
	logic CLOCK_50;
	logic [9:0] LEDR;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	DE1_SoC_final dut(.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .SW, .KEY, .LEDR, .CLOCK_50);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD / 2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
	end
	
	initial begin
		// testing for task 2
		// reset system
		KEY[0] <= 0; @(posedge CLOCK_50);
		KEY[0] <= 1; @(posedge CLOCK_50);
		// start system
		KEY[3] <= 1; @(posedge CLOCK_50);
		KEY[3] <= 0; @(posedge CLOCK_50);
		// enable SW[9] 
		SW[9] <= 1;	@(posedge CLOCK_50);
		SW[7:0] <= 8'b00000000;	@(posedge CLOCK_50);
		repeat(30) @(posedge CLOCK_50);
		
		//testing for task 1
		// reset system
		KEY[0] <= 0; @(posedge CLOCK_50);
		KEY[0] <= 1; @(posedge CLOCK_50);
		SW[9] <= 0; @(posedge CLOCK_50);
		SW[7:0] <= 8'b00110011; @(posedge CLOCK_50);
		// start system
		KEY[3] <= 1; @(posedge CLOCK_50);
		KEY[3] <= 0; @(posedge CLOCK_50);
		repeat(20) @(posedge CLOCK_50);
		KEY[3] <= 1; @(posedge CLOCK_50);
		$stop;
	end
endmodule
