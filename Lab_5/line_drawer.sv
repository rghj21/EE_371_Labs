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
	logic [10:0] deltaX, deltaY, absX, absY, xFirst, xSecond, yFirst, ySecond, xStart, xEnd, yStart, yEnd, tempY ,currX ,currY, nextX, nextY;
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
	
	assign deltaX = xStart - xEnd;
	assign deltaY = (yStart > yEnd) ? yStart - yEnd : yEnd -yStart;
	assign yStep = (yStart < yEnd) ? 1'b1 : 1'b0;
	always_comb begin
		if (currX < xEnd) begin
			nextX = currX + 1'b1;
			if (isSteep) begin
				nextX = currY;
				nextY = currX;
			end 
			if (error >= 0) begin
				if (yStep)
					nextY = currY + 1'b1;
				else
					nextY = currY - 1'b1;
			end
		end else begin
			nextY = currY;
			nextX = currX;
		end
	end
	
	always_comb begin
		x = currX;
		y = currY;
		error <= -deltaX/2;
	end
		
	always_ff @(posedge clk) begin
		if(reset) begin
			currX <= xStart;
			currY <= yStart;
		end 
		else begin
			if(error < 0)
				error <= error + deltaY;
			else
				error <= error + deltaY - deltaX;
		end
	end	// always_ff
	
endmodule  // line_drawer

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
		reset = 1; #100;
		reset = 0; #100;
		//straight line
		x0 = 0; x1= 0; y0=0; y1=8; reset = 1; #100;
		reset = 0; #1000;
		//down line
		x0 = 0; x1= 8; y0=0; y1=0; reset = 1; #100;
		reset = 0; #1000;
		//straight line (flipped points)
		x0 = 0; x1= 0; y1=0; y0=8; reset = 1; #100;
		reset = 0; #1000;
		//down line (flipped points)
		x1 = 0; x0= 8; y0=0; y1=0; reset = 1; #100;
		reset = 0; #1000;
		//diagonal from origin point
		x0 = 0; x1= 3; y0=0; y1=9; reset = 1; #100;
		reset = 0; #1000;
		//diagonal from origin point
		x0 = 0; x1= 9; y0=0; y1=3; reset = 1; #100;
		reset = 0; #1000;
		//diagonal line
		x0 = 4; x1= 42; y0=3; y1=59; reset = 1; #100;
		reset = 0; #6000;
		//hard case
		x0 = 123; x1= 234; y0=345; y1=456; reset = 1; #100;
		reset = 0; #20000;
		$stop;
	end
	
endmodule 