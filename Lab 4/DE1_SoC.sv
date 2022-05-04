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
	logic done, ready;
	
//	bitCountingControl ctrl(.in(SW[7:0]), .start, .reset, .clk(CLOCK_50), .ready);
//	bitCountingDatapath path(.in(), .result(out), .done(done));
//	
//	task1HexDisplay hex (.result(out), .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5);
//	assign LEDR[9] = done;
	RAM32X8 (.address(addr), .clock(CLOCK_50), .data(0), .wren(0), .q(ramOut));
	binarySearchDatapath(.ramOut, .clk(CLOCK_50), .currData, .addr, .ready, .increment, .decrement);
	binarySearchControl(.A(SW[7:0]), .currData, .start, .reset, .clk(CLOCK_50), .dataFound, .correct, .ready, .increment, .decrement);
endmodule
