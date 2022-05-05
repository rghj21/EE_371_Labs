module bitCountingDatapath(clk, ready, incr_result, A_is_zero, switchInput, result, done, currA); 
	input logic clk, ready, incr_result, A_is_zero;
	input logic [7:0] switchInput;
	output logic [3:0] result;
	output logic done;
	output logic [7:0] currA;

	// datapath logic 
	always_ff @(posedge clk) begin
		if(ready) begin
			result <= 0;
			done <= 0;
			currA <= switchInput;
		end
		if(A_is_zero) begin
			done <= 1;
		end
		else if(incr_result) begin
			result <= result + 1;
		end
		else begin
			currA <= currA >> 1;
		end
	end // always_ff
	
	
endmodule // datapath


module bitCountingDatapath_testbench();
	logic clk, ready, incr_result, A_is_zero, done;
	logic [7:0] switchInput, currA;
	logic [3:0] result;
	
	bitCountingDatapath dut (.clk, .ready, .incr_result, .A_is_zero, .switchInput, .result, .done, .currA); 
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		switchInput <= 8'b00100100; @(posedge clk);
		ready <= 1; switchInput <= 8'b00100100; @(posedge clk);
		ready <= 0; switchInput <= 8'b00100100; @(posedge clk);
		repeat(20) @(posedge clk);
		$stop;
	end
endmodule

		
		
		