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
	logic [10:0] deltaX, deltaY, absX, absY, xFirst, xSecond, yFirst, ySecond, xStart, xEnd, yStart, yEnd, tempY ,outX ,outY;
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
	
	// int deltax = x1-x0 
	assign deltaX = xEnd - xStart;
   // int deltay = abs(y1-y0) 
	assign deltaY = (yStart > yEnd) ? yStart - yEnd : yEnd - yStart;
	// int error = -(deltax/2) 
	assign error = -(deltaX/2);
   // int y = y0 
	assign tempY = yStart;
	// if y0 < y1 then y_step = 1 else y_step = -1
	assign yStep = (yStart < yEnd) ? 1'b1 : 1'b0;
	
	always_comb begin
		if (xStart < xEnd) begin
			if (isSteep) begin
				outX = yStart;
				outY = xStart;
			end else begin
				outX = xStart;
				outY = yStart;
			end
			error = error + deltaY;
			if (error >= 0) begin
				if (yStep)
					outY = outY + 1'b1;
				else
					outY = outY - 1'b1;
				error = error - deltaX;
			end
			xStart = xStart + 1'b1;
		end
	end
	
	always_comb begin
		x = outX;
		y = outY;
	end
		

	always_ff @(posedge clk) begin
		// YOUR CODE HERE
	end  // always_ff
	
endmodule  // line_drawer