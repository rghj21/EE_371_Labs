module DE1_SoC_task2(HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, SW, KEY, LEDR, CLOCK_50);
	input logic [9:0] SW;
	input logic [3:0] KEY;
	input logic CLOCK_50;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	logic correct, ready, increment, decrement, unsuccessful, fail;
	assign reset = ~KEY[0];
	assign start = ~KEY[3];
	assign LEDR[0] = correct;
	assign LEDR[9] = correct | fail;
	logic [4:0] addr, left, right;
	logic [7:0] ramOut, currData;
	logic [6:0] HEXOne, HEXZero;
	all_seg7 seg (.loc(addr), .HEX0(HEXZero), .HEX1(HEXOne), .HEX2, .HEX3, .HEX4, .HEX5);
	RAM32X8 ram (.address(addr), .clock(CLOCK_50), .data(0), .wren(0), .q(ramOut));
	binarySearchDatapath datapath (.ramOut, .clk(CLOCK_50), .currData, .addr, .ready, .increment, .decrement, .left, .right, .unsuccessful, .fail);
	binarySearchControl control (.A(SW[7:0]), .currData, .start, .reset, .clk(CLOCK_50), 
											.correct, .ready, .increment, .decrement, .left, .right, .unsuccessful);
	always_comb begin
		if(correct) begin
			HEX1 = HEXOne;
			HEX0 = HEXZero;
		end
		else begin
			HEX1 = 7'b1111111;
			HEX0 = 7'b1111111;
		end
	end
endmodule

`timescale 1ns/ 1ns
module DE1_SoC_task2_testbench();
	logic [9:0] SW, LEDR;
	logic [3:0] KEY;
	logic CLOCK_50;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	DE1_SoC_task2 dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .SW, .KEY, .LEDR, .CLOCK_50);
	parameter CLOCK_PERIOD = 100;
	initial begin
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD / 2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
	end
	initial begin
		KEY[0] <= 0;	@(posedge CLOCK_50);
		KEY[0] <= 1;	@(posedge CLOCK_50);
		KEY[3] <= 1; 	@(posedge CLOCK_50);
		KEY[3] <= 0;	@(posedge CLOCK_50);
		// testing when input is higher than maximum output of memory
//		SW[7:0] <= 8'b10000000;	@(posedge CLOCK_50); 
//		repeat(30) 		@(posedge CLOCK_50);
//		KEY[0] <= 0;	@(posedge CLOCK_50);
//		KEY[0] <= 1;	@(po		SW[7:0] <= 8'b00010001;	@(posedge CLOCK_50);
//		repeat(30)	@(posedge CLOCK_50);sedge CLOCK_50);
//
		
		SW[7:0] <= 8'b00000000;	@(posedge CLOCK_50);
		repeat(30)	@(posedge CLOCK_50);
		$stop;
	end
endmodule
