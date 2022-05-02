module binarySearchDatapath(A, start, reset, clk, out, done);
	input logic reset, clk, start;
	input logic [7:0] in;
	output logic [3:0] out;
	logic [7:0] ramOut;
	logic [4:0] addr;
	RAM32X8 (.address(addr), .clock(clk), .data(1), .wren(1), .q(ramOut));
	
endmodule
