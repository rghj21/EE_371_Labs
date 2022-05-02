module shiftRightA(inputA, currA, enabler, loadA, out);
	input logic loadA, enabler;
	input logic [7:0] inputA, currA;
	output logic [7:0] out;
	
	always_comb begin
		if(loadA) begin
			out = inputA;
		end
		// shifting right
		else if(enabler) begin
			out[6:0] = currA[7:1];
			out[7] = 1'b0;
		end
		else begin
			out = currA;
		end
	end
endmodule

module shiftRightA_testbench();
	logic loadA, enabler;
	logic [7:0] inputA, currA, out;
	
	shiftRightA dut(.inputA, .currA, .enabler, .loadA, .out);
	
	initial begin
		inputA <= 8'b01010101; currA <= 8'b00001111; loadA <= 1; #200;
		loadA <= 0; enabler <= 1; #200;
		enabler <= 0; #200;
		$stop;
	end
endmodule

