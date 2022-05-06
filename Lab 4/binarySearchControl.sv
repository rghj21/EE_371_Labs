// Controller module for binary search algorithm
// takes 8-bit A and currData, 1-bit reset, clk, and start, 5-bit left and right
// outputs 1-bit correct, ready, increment, decrement, and unsuccessful
// The controller module determines the state of the algorithm circuit
// and which operation the datapath needs to perform. 
module binarySearchControl(A, currData, start, reset, clk, correct, ready, increment, decrement, left, right, unsuccessful);
	// port definitions
	input logic [7:0] A, currData;
	input logic reset, clk, start;
	input logic [4:0] left, right;
	output logic correct, ready, increment, decrement, unsuccessful;
	
	// internal logic 
	logic dataFound;

	// define state names and variables
	enum {S1, S2, S2Wait, S3} ps, ns;
	
	// next state logic
	always_comb begin
		case(ps)
			S1: 	if (start)
						ns = S2Wait;
					else 
						ns = S1;
			// wait state to avoid clock delay			
			S2Wait:
					ns =  S2;
			S2: 	if (dataFound) 
						ns = S3;
					else
						ns = S2Wait;
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
	end // always_ff
	
	
	// output assignments 
	assign ready = (ps == S1); // ready signal
	assign dataFound = (currData == A);
	assign unsuccessful = left > right; // Unable to find A
	assign increment = (ps == S2) & (~dataFound) & (currData < A); // increment left value
	assign decrement = (ps == S2) & (~dataFound) & (currData > A); // decrement right value
	assign correct = (ps == S3); // if we find A
	
endmodule // controller

module binarySearchControl_testbench();
	logic [7:0] A, currData;
	logic [4:0] left, right;
	logic reset, clk, start, correct, dataFound, ready, increment, decrement, unsuccessful;
	binarySearchControl dut (.A, .currData, .start, .reset, .clk, .correct, .ready, .increment, .decrement, .left, .right, .unsuccessful);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		reset <= 1;		@(posedge clk);	
		reset <= 0;		@(posedge clk);
		A <= 8'b00000110;	@(posedge clk);
		start <= 0;		@(posedge clk);
		start <= 1;		@(posedge clk);
		currData <= 8'b00001000;	@(posedge clk);
		currData <= 8'b10001000;	@(posedge clk);
		currData <= 8'b01001000;	@(posedge clk);
		currData <= 8'b00000110;	@(posedge clk);
		$stop;	
	end
endmodule
