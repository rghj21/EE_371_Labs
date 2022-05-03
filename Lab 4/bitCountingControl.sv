module bitCountingControl(in, start, reset, clk, done, ready, A_is_zero, inputA);
	// port definitions
	input logic [7:0] in;
	input logic reset, clk, start, done;
	output logic ready, A_is_zero;
	output logic [7:0] inputA;
	
	
	enum {S1, S2, S3} ps, ns;
	
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
	end // always_ff

	assign inputA = in;
	assign ready = (ps == S1);
	assign A_is_zero = (ps == S2);
	
endmodule // controller


module bitCountingControl_testbench();
	logic [7:0] in, inputA;
	logic reset, clk, start, done, ready, A_is_zero;
	
	bitCountingControl dut(.in, .start, .reset, .clk, .done, .ready, .A_is_zero, .inputA);
	
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
		repeat(20)		@(posedge clk);
		$stop;	
	end
endmodule
