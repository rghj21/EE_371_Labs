module binarySearchDatapath(ramOut, clk, currData, addr, ready, increment, decrement);
	input logic clk, ready, increment, decrement;
	input logic [7:0] ramOut;
	output logic [4:0] addr; 
	output logic [7:0] currData;
	logic [4:0] left, right, mid;
	assign addr = mid;
	assign currData = ramOut;
	
	always_ff @(posedge clk) begin
		if (ready) begin
			left <= 0;
			right <= 5'b11111;
		end
		mid <= (left + right) / 2;
		if (increment)
			mid <= mid + 1;
		else if (decrement)
			mid <= mid - 1;	
	end
endmodule

module binarySearchDatapath_testbench();
	logic [7:0] ramOut, currData;
	logic clk, ready, increment, decrement;
	logic [4:0] addr;
	binarySearchDatapath dut (.ramOut, .clk, .currData, .addr, .ready, .increment, .decrement);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		ramOut <= 1;		@(posedge clk);
		ready <= 1; 		@(posedge clk);
		ready <= 0; 		@(posedge clk);
		increment <= 1;	@(posedge clk);
		decrement <= 1;	@(posedge clk);
		repeat(5)			@(posedge clk);
		increment <= 1;	@(posedge clk);
		repeat(5)			@(posedge clk);
		$stop;	
	end
endmodule
