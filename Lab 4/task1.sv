
module task1(clk, reset, start, inputA, result);
	input logic clk, reset, start;
	input logic [7:0] inputA; // 8-bit input from Sw[7] - SW[0]
	output logic [3:0] result; // stores how many ones there are 
	
	
	logic loadA;
	logic S1, S2, S3;
	logic [7:0] ps, ns;
	assign loadA = S1 && !start;
	
		
endmodule
