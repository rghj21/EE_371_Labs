module bitCountingDatapath(clk, ready, incr_result, shiftA, inputA, result, done, A_is_zero, A_is_one); 
	input logic clk, ready, incr_result, shiftA;
	input logic [7:0] inputA;
	output logic [3:0] result;
	output logic done, A_is_zero, A_is_one;

	logic [7:0] A;
	// datapath logic 
	
	always_ff @(posedge clk) begin
		if(ready) begin
			result <= 0;
			done <= 0;
			A <= inputA;
		end
		if(A_is_zero) begin
			done <= 1;
		end
		else if(incr_result) begin
			result <= result + 1;
			A_is_one <= 1;
		end
		else if(shiftA) begin
			A <= A >> 1;
		end
	end // always_ff
endmodule // datapath


module bitCountingDatapath_testbench();
	logic clk, ready, incr_result, shiftA, done, A_is_zero, A_is_one;
	logic [7:0] inputA;
	logic [3:0] result;
	
	bitCountingDatapath dut (.clk, .ready, .incr_result, .shiftA, .inputA, .result, .done, .A_is_zero, .A_is_one);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		inputA <= 8'b00100100; @(posedge clk);
		ready <= 1;	@(posedge clk);
		ready <= 0; @(posedge clk);
		// testing when A[0] = 1
		incr_result <= 1; repeat(8) @(posedge clk);
		incr_result <= 0; @(posedge clk);
		// testing when A[0] = 0
		shiftA <= 1; repeat(8) @(posedge clk);
		
		// testing when A = 0
		incr_result <= 1; shiftA <= 1; @(posedge clk);
		$stop;
	end
endmodule

		
		
		