module bitCountingControl(in, start, reset, clk, done, currA, ready, A_is_zero, incr_result, switchInput);
	// port definitions
	input logic [7:0] in, currA;
	input logic reset, clk, start, done;
	output logic ready, incr_result, A_is_zero;
	output logic [7:0] switchInput;
	
	// define state names and variables
	enum {S1, S2, S2wait, S3} ps, ns;
	
	always_comb begin
		case(ps)
			S1: ns = start ? S2wait : S1;
			
			S2wait: ns = S2;
				
			S2: ns = (done) ? S3 : S2;
			
			S3: ns = start ? S3 : S1;
		endcase
	end // always_comb
	
	always_ff @(posedge clk) begin
		if (reset) 
			ps <= S1;
		else 
			ps <= ns;
	end // always_ff

	assign switchInput = in;
	assign A_is_zero = (currA == 0);
	assign ready = (ps == S1) & ~start;
	assign incr_result = (ps == S2) & (currA[0] == 1);
	
endmodule // controller

module bitCountingControl_testbench();
	logic [7:0] in, currA, switchInput;
	logic reset, clk, start, done, ready, incr_result, A_is_zero;

	bitCountingControl dut(.in, .start, .reset, .clk, .done, .currA, .ready, .A_is_zero, .incr_result, .switchInput);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		reset <= 1;	@(posedge clk);
		reset <= 0;	@(posedge clk);
		in <= 8'b00100100; @(posedge clk);
		// S1 -> S1
		start <= 0; @(posedge clk);
		// S1 -> S2wait
		start <= 1; done <= 0; @(posedge clk);
		start <= 0;	@(posedge clk);
		// result = 1
		currA <= 8'b0000101; @(posedge clk);
		currA <= 8'b0000010; @(posedge clk);
		// result = 2
		currA <= 8'b0000001; @(posedge clk);
		currA <= 8'b0000000; @(posedge clk);
		// S2 -> S3
		done <= 1; @(posedge clk);
		// S3 -> S3
		start <= 1; @(posedge clk);
		// S3 -> S1
		start <= 0; @(posedge clk);
		$stop;
	end
endmodule
