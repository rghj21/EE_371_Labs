module clearLine(x0, y0, x1, y1, clk, reset, clearFlag, done, blackX, blackY);
	input logic [10:0] x0, y0, x1, y1;
	input logic clk, reset;
	output logic clearFlag, done;
	output logic [10:0] blackX, blackY;
	
	line_drawer line (.clk, .reset, .x0, .y0, .x1, .y1, .x(blackX), .y(blackY), .done);
	
	always_comb begin
		if(done) begin
			clearFlag = 1'b0;
		end
		else begin
			clearFlag = 1'b1;
		end
	end // always_comb
endmodule
