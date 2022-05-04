module DE1_SoC(HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, SW, KEY, LEDR, CLOCK_50);
	input logic [9:0] SW;
	input logic [3:0] KEY;
	input logic CLOCK_50;
	output logic [9:0] LEDR;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	logic reset, start;
	assign reset = ~KEY[0];
	assign start = ~KEY[3];
	
	logic [3:0] out;
	logic done;
	
	bitCounting count(.in(SW[7:0]), .start(start), .reset(reset), .clk(CLOCK_50), .result(out), .done(done));
	task1HexDisplay hex (.result(out), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
	assign LEDR[9] = done;
	
endmodule

module DE1_SoC_testbench();
	logic [9:0] SW;
	logic [3:0] KEY;
	logic CLOCK_50;
	logic [9:0] LEDR;
	logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	DE1_SoC dut(.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .SW, .KEY, .LEDR, .CLOCK_50);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		CLOCK_50 <= 0;
		forever #(CLOCK_PERIOD / 2) CLOCK_50 <= ~CLOCK_50; // Forever toggle the clock
	end
	
	initial begin
		KEY[0] <= 0; @(posedge CLOCK_50);
		KEY[0] <= 1; @(posedge CLOCK_50);
		SW[7:0] <= 8'b00110011; @(posedge CLOCK_50);
		KEY[3] <= 1; @(posedge CLOCK_50);
		KEY[3] <= 0; @(posedge CLOCK_50);
		repeat(20) @(posedge CLOCK_50);
		$stop;
	end
endmodule
