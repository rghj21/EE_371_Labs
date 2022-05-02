module binarySearchControl(in, start, reset, clk, out));
	input logic [7:0] in;
	input logic reset, clk, start;
	output logic [3:0] result;
	logic doneFlag;
	logic [7:0] A;
	enum {S1, S2, S3} ps, ns;
endmodule
