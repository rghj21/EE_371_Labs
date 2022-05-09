// Datapath module for binary search algorithm
// takes 8-bit ramOut and currData, 1-bit clk, ready, increment, decrement, and unsucessful
// outputs 1-bit fail, 5-bit left, right, and addr, 8-bit currData
// The datapath module performs the nesscary operations for the algorithm 
// based on the signals from the controller module. 
module binarySearchDatapath(ramOut, clk, currData, addr, ready, increment, decrement, left, right, unsuccessful, fail);
	// port defintions
	input logic clk, ready, increment, decrement, unsuccessful;
	input logic [7:0] ramOut;
	output logic fail;
	output logic [4:0] addr; 
	output logic [7:0] currData;
	output logic [4:0] left, right;
	
	// internal logic
	logic [4:0] mid, tempFail;
	assign addr = mid;
	assign currData = ramOut;
	assign mid = (left + right) / 2;
	
	always_ff @(posedge clk) begin
		// load condition
		if (ready) begin
			left <= 0;
			right <= 5'b11111;
			tempFail <= 0;
		end
		if (~tempFail | ~unsuccessful) begin // while loop - L <= R
			if (increment)
				// case when input A has larger value than greatest value in memory
				if (left == 31) 
					tempFail <= 1;
				else
					left <= mid + 1; // increment left
			else if (decrement)
				if (right == 0)
					tempFail <= 1;
				else
					right <= mid - 1; // decrement right 
		end // always_ff	
	end
	// fail to find the target A
	assign fail = unsuccessful | tempFail;
endmodule

module binarySearchDatapath_testbench();
	logic [7:0] ramOut, currData;
	logic clk, ready, increment, decrement,unsuccessful,fail;
	logic [4:0] addr, left, right;
	binarySearchDatapath dut (.ramOut, .clk, .currData, .addr, .ready, .increment, .decrement, .left, .right, .unsuccessful, .fail);
	
	parameter CLOCK_PERIOD = 100;
	initial begin
		clk <= 0;
		forever #(CLOCK_PERIOD / 2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		ramOut <= 8'b00001101;		@(posedge clk);
		ready <= 1; 		@(posedge clk);
		unsuccessful <= 0; @(posedge clk);
		ready <= 0; 		@(posedge clk);
		increment <= 1;	@(posedge clk);
		increment <= 0;	@(posedge clk);
		decrement <= 1;	@(posedge clk);
		repeat(2)			@(posedge clk);
		increment <= 1;	@(posedge clk);
		repeat(2)			@(posedge clk);
		$stop;	
	end
endmodule
