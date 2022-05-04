module binarySearchControl(A, currData, start, reset, clk, dataFound, correct, ready, increment, decrement);
	input logic [7:0] A, currData;
	input logic reset, clk, start;
	output logic correct, dataFound, ready, increment, decrement;

	enum {S1, S2, S2Wait, S3} ps, ns;
	always_comb begin
		case(ps)
			S1: 	if (start)
						ns = S2Wait;
					else 
						ns = S1;
			S2Wait:
					ns =  S2;
			S2: 	if (dataFound) 
						ns = S3;
					else
						ns = S2;
			S3: 	if (start)
						ns = S3;
					else
						ns = S1;
		endcase
	end
	
	always_ff @(posedge clk) begin
		if (reset) 
			ps = S1;
		else 
			ps = ns;
	end
	
	assign dataFound = (currData == A);
	assign correct = (ps == S3);
	assign ready = (ps == S1);
	assign increment = (ps == S2) & (~dataFound) & (currData > A);
	assign decrement = (ps == S2) & (~dataFound) & (currData > A);
	
endmodule

module binarySearchControl_testbench();
	logic [7:0] A, currData;
	logic reset, clk, start, correct, dataFound, ready, increment, decrement;
	binarySearchControl dut (.A, .currData, .start, .reset, .clk, .dataFound, .correct, .ready, .increment, .decrement);
	
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
