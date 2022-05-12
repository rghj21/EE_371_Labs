/* Given two points on the screen this module draws a line between
 * those two points by coloring necessary pixels
 *
 * Inputs:
 *   clk    - should be connected to a 50 MHz clock
 *   reset  - resets the module and starts over the drawing process
 *	 x0 	- x coordinate of the first end point
 *   y0 	- y coordinate of the first end point
 *   x1 	- x coordinate of the second end point
 *   y1 	- y coordinate of the second end point
 *
 * Outputs:
 *   x 		- x coordinate of the pixel to color
 *   y 		- y coordinate of the pixel to color
 *   done	- flag that line has finished drawing
 *
 */
module line_drawer(clk, reset, x0, y0, x1, y1, x, y, done);
	input logic clk, reset;
	input logic [10:0]	x0, y0, x1, y1;
	output logic done;
	output logic [10:0]	x, y;
	
	
	
	/* You'll need to create some registers to keep track of things
	 * such as error and direction.
	 */
	logic signed [11:0] error;  // example - feel free to change/delete
	logic [10:0] absX, absY, xFirst, xSecond, yFirst, ySecond, xStart, xEnd, yStart, yEnd, outX, outY;
	logic signed [10:0]  deltaX, deltaY, currX, currY;
	logic isSteep, yStep;
	
	assign absX = (x0 > x1) ? (x0 - x1) : (x1 - x0);
	assign absY = (y0 > y1) ? (y0 - y1) : (y1 - y0);
	assign isSteep = (absY > absX) ? 1'b1 : 1'b0;
	
	always_comb begin
		xFirst = isSteep ? y0 : x0;
		xSecond = isSteep ? y1 : x1;
		yFirst = isSteep ? x0 : y0;
		ySecond = isSteep ? x1 : y1;
		
		xStart = (xFirst > xSecond) ? xSecond : xFirst;
		xEnd = (xFirst > xSecond) ? xFirst : xSecond;
		yStart = (xFirst > xSecond) ? ySecond : yFirst;
		yEnd = (xFirst > xSecond) ? yFirst : ySecond;
	end
	
	assign deltaX = xEnd - xStart;
	assign deltaY = (yStart > yEnd) ? yStart - yEnd : yEnd - yStart;
	assign yStep = (yStart < yEnd) ? 1'b1 : 1'b0;

	always_ff @(posedge clk) begin
		if(reset) begin
			done <= 0;
			currX <= xStart;
			currY <= yStart;
			error <= (-1) * deltaX / 2;
		end 
		else begin
			if (currX <= xEnd) begin
				if (isSteep) begin
					outX <= currY;
					outY <= currX;
				end else begin
					outY <= currY;
					outX <= currX;
				end
				//error <= error + deltaY;
				if (error >= 0) begin
					if (yStep)
						currY <= currY + 1'b1;
					else begin
						currY <= currY - 1'b1;
					end
					error <= error - deltaX + deltaY;
				end else 
					error <= error + deltaY;
				currX <= currX + 1'b1;
			end else
				done <= 1;
		end
	end	// always_ff
	
	always_comb begin
		x = outX;
		y = outY;
	end
	
endmodule  // line_drawer

//`timescale 1ps / 1ns
module line_drawer_testbench();
	logic [10:0]x0, x1, y0, y1, x, y;
	logic clk, reset, done;
	line_drawer dut (.clk, .reset, .x0, .y0, .x1, .y1, .x, .y, .done);
	
	parameter CLOCK_PERIOD=100;  
	initial begin   
	  clk <= 0;  
	  forever #(CLOCK_PERIOD/2) clk <= ~clk; // Forever toggle the clock
	end
	
	initial begin
		// horizontal line
//		x0 = 0; x1 = 20; y0 = 0; y1 = 0; reset = 1;  @(posedge clk);
//		x0 = 0; x1 = 20; y0 = 0; y1 = 0; reset = 0; repeat(30) @(posedge clk);
		
		// vertical line
//		x0 = 0; x1 = 0; y0 = 0; y1 = 20; reset = 1;  @(posedge clk);
//		x0 = 0; x1 = 0; y0 = 0; y1 = 20; reset = 0; repeat(30) @(posedge clk);
		
		// right down line gradual case
		x0 = 0; x1 = 9; y0 = 0; y1 = 4; reset = 1;  @(posedge clk);
		x0 = 0; x1 = 9; y0 = 0; y1 = 4; reset = 0; repeat(20) @(posedge clk);

		// right down line steep case 
		x0 = 0; x1 = 4; y0 = 0; y1 = 9; reset = 1;  @(posedge clk);
		x0 = 0; x1 = 4; y0 = 0; y1 = 9; reset = 0; repeat(20) @(posedge clk);

		// right up line gradual case
		x0 = 0; x1 = 9; y0 = 4; y1 = 0; reset = 1;  @(posedge clk);
		x0 = 0; x1 = 9; y0 = 4; y1 = 0; reset = 0; repeat(20) @(posedge clk);

		// right up line steep case broken
		x0 = 0; x1 = 4; y0 = 9; y1 = 0; reset = 1;  @(posedge clk);
		x0 = 0; x1 = 4; y0 = 9; y1 = 0; reset = 0; repeat(20) @(posedge clk);

		// left up line steep case
		x0 = 4; x1 = 0; y0 = 9; y1 = 0; reset = 1;  @(posedge clk);
		x0 = 4; x1 = 0; y0 = 9; y1 = 0; reset = 0; repeat(20) @(posedge clk);

		// left up line gradual case
		x0 = 9; x1 = 0; y0 = 4; y1 = 0; reset = 1;  @(posedge clk);
		x0 = 9; x1 = 0; y0 = 4; y1 = 0; reset = 0; repeat(20) @(posedge clk);

		// left down line steep case
		x0 = 4; x1 = 0; y0 = 0; y1 = 9; reset = 1;  @(posedge clk);
		x0 = 4; x1 = 0; y0 = 0; y1 = 9; reset = 0; repeat(20) @(posedge clk);

		// left down line gradual case
		x0 = 9; x1 = 0; y0 = 0; y1 = 4; reset = 1;  @(posedge clk);
		x0 = 9; x1 = 0; y0 = 0; y1 = 4; reset = 0; repeat(20) @(posedge clk);
		$stop;
	end
	
endmodule 