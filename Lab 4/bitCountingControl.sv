module bitCountingControl(in, start, reset, clk, done, ready, A_is_zero, incr_result, shiftA, inputA);
	// port definitions
	input logic [7:0] in;
	input logic reset, clk, start, done;
	output logic ready, incr_result, shiftA, A_is_zero;
	output logic [7:0] inputA;
	
	// define state names and variables
	enum {S1, S2, S3} ps, ns;
	
	always_comb begin
		case(ps)
			S1: ns = start ? S2 : S1;
				
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

	assign inputA = in;
	assign A_is_zero = (inputA == 0);
	assign ready = (ps == S1) & ~start;
	assign incr_result = (ps == S2) & (inputA[0] == 1);
	assign shiftA = (ps == S2) & (inputA[0] == 0);
	
endmodule // controller


module bitCountingControl_testbench();
	logic [7:0] in, inputA;
	logic reset, clk, start, done, ready, incr_result, shiftA, A_is_zero;

	bitCountingControl dut(.in, .start, .reset, .clk, .done, .ready, .A_is_zero, .incr_result, .shiftA, .inputA);
	
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
		// change S1 -> S2
		start <= 1; @(posedge clk);
		start <= 0; @(posedge clk);
		// S2 -> S2
		done <= 0; @(posedge clk);
		// change S2 -> S3
		done <= 1; @(posedge clk);
		// S3 -> S3
		start <= 1; @(posedge clk);
		// S3 -> S1
		start <= 0; @(posedge clk);
		$stop;
	end
endmodule
