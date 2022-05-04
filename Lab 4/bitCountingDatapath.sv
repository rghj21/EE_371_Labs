module bitCountingDatapath(inputA, A_zero, ready, result, done, clk);  
	//port definitions
	input logic A_zero, clk, ready;
	input logic [7:0] inputA;
	output logic [3:0] result;
	output logic done;

	logic [7:0] A;
	
	// datapath logic 
	
	always_ff @(posedge clk) begin
		if(ready) begin
			result <= 0;
			done <= 0;
			A <= inputA;
		end
		if(A_zero) begin
			done = 1;
		end
		else if(A[0] == 1) begin
			result <= result + 1;
		end
		else begin
			A <= A >> 1;
		end
	end // always_ff
endmodule // datapath


module bitCountingDatapath_testbench();
	logic A_zero, done, ready, clk;
	logic [3:0] result;
	logic [7:0] inputA;
	
	bitCountingDatapath dut (.inputA, .A_zero, .ready, .result, .done, .clk);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		inputA <= 8'b00100100; @(posedge clk);
		ready <= 1;	@(posedge clk);
		ready <= 0; @(posedge clk);
		A_zero <= 0; repeat(20) @(posedge clk);
		A_zero <= 1; repeat(5) @(posedge clk);
		$stop;
	end
endmodule

		
		
		