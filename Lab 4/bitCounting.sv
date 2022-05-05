// Bit counting algorithm module
// takes 8-bit in, 1-bit start, reset, and clk
// outputs 4-bit result and 1-bit done
// Bit-counting algorithm for counting all the 1s 
// in the 8-bit input and returns the how many 1s
// there are as well as a done signal.
module bitCounting(in, start, reset, clk, result, done);
	
	// port definitions
	input logic [7:0] in;
	input logic reset, clk, start;
	output logic [3:0] result;
	output logic done;
	
	// internal logic
	logic [7:0] A;
	
	// define state names and variables
	enum {S1, S2, S3} ps, ns;
	
	// next state logic 
	always_comb begin
		case(ps)
			S1: 	if (start)
						ns = S2;
					else 
						ns = S1;
			S2: 	if (done) 
						ns = S3;
					else
						ns = S2;
			S3: 	if (start)
						ns = S3;
					else
						ns = S1;
		endcase
	end // always_comb
	
	always_ff @(posedge clk) begin
		if (reset) 
			ps <= S1;
		else 
			ps <= ns;
		case(ns)
			S1: 	begin
						result <= 0;
						done <= 0;
						A <= in;
					end
			S2: 	begin
						if(A == 0)
							done = 1;
						else if (A[0] == 1)
							result <= result + 1;
						A <= A >> 1;
					end		
		endcase
	end // always_ff
endmodule

module bitCounting_testbench();
	logic [7:0] in;
	logic reset, clk, start;
	logic [3:0] result;
	bitCounting dut (.in, .start, .reset, .clk, .result);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		reset <= 1;		@(posedge clk);
		reset <= 0;	in <= 8'b00100100;	@(posedge clk);
		start <= 0;		@(posedge clk);
		start <= 1;		@(posedge clk);
		repeat(10)		@(posedge clk);
		start <= 0;		@(posedge clk);
		$stop;	
	end
endmodule
