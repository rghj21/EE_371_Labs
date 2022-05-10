module lineDrawerControl(clk, reset, start, isSteep, error_gt_zero, x, xOne, load, done, swap, incr_y);
	// port defintions
	input logic clk, reset, start, isSteep, error_gt_zero;
	input logic [10:0] x, xOne;
	output logic load, done, swap;
	// define state names and variables
	enum {S1, S2, S3, Sdraw, S5} ps, ns;
	
	// internal logic
	logic x_lt_x1;
	logic x_gt_x1;
	
	assign x_lt_x1 = (x < xOne);
	assign x_gt_x1 = (x > xOne);
	// next state logic
	always_comb begin
		case(ps)
			S1:	if(start)
						ns = S2;
					else 
						ns = S1;
						
			S2:	ns = S3;
			
			S3:	if(x_lt_x1)
						ns = Sdraw
					else
						ns = S5;
						
			Sdraw:
			
			S5:	if(start)
						ns = S5;
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
	
	// output assignments
	assign load = (ps == S1); // ready signal
	assign done = (ps == S5); // done signal
	assign x_gt_x1 = (ps == S2) & (~isSteep);
	assign swap = 
	assign incr_y = (ps == Sdraw) & (error_gt_zero)
	
endmodule // controller