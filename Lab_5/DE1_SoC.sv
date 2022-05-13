/* Top level module of the FPGA that takes the onboard resources 
 * as input and outputs the lines drawn from the VGA port.
 *
 * Inputs:
 *   KEY 			- On board keys of the FPGA
 *   SW 			- On board switches of the FPGA
 *   CLOCK_50 		- On board 50 MHz clock of the FPGA
 *
 * Outputs:
 *   HEX 			- On board 7 segment displays of the FPGA
 *   LEDR 			- On board LEDs of the FPGA
 *   VGA_R 			- Red data of the VGA connection
 *   VGA_G 			- Green data of the VGA connection
 *   VGA_B 			- Blue data of the VGA connection
 *   VGA_BLANK_N 	- Blanking interval of the VGA connection
 *   VGA_CLK 		- VGA's clock signal
 *   VGA_HS 		- Horizontal Sync of the VGA connection
 *   VGA_SYNC_N 	- Enable signal for the sync of the VGA connection
 *   VGA_VS 		- Vertical Sync of the VGA connection
 */
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, CLOCK_50, 
	VGA_R, VGA_G, VGA_B, VGA_BLANK_N, VGA_CLK, VGA_HS, VGA_SYNC_N, VGA_VS);
	
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output logic [9:0] LEDR;
	input logic [3:0] KEY;
	input logic [9:0] SW;
	input CLOCK_50;
	output [7:0] VGA_R;
	output [7:0] VGA_G;
	output [7:0] VGA_B;
	output VGA_BLANK_N;
	output VGA_CLK;
	output VGA_HS;
	output VGA_SYNC_N;
	output VGA_VS;
	
	assign HEX0 = '1;
	assign HEX1 = '1;
	assign HEX2 = '1;
	assign HEX3 = '1;
	assign HEX4 = '1;
	assign HEX5 = '1;
	assign LEDR[8:0] = SW[8:0];
	
	logic [10:0] x0, y0, x1, y1, x, y, colorX, colorY, blackX, blackY;
	logic reset, done, clearFlag;
	assign reset = ~KEY[0];
	VGA_framebuffer fb (
		.clk50			(CLOCK_50), 
		.reset			, 
		.x(colorX),
		.y(colorY),
		.pixel_color	(clearFlag), 
		.pixel_write	(1'b1),
		.VGA_R, 
		.VGA_G, 
		.VGA_B, 
		.VGA_CLK, 
		.VGA_HS, 
		.VGA_VS,
		.VGA_BLANK_n	(VGA_BLANK_N), 
		.VGA_SYNC_n		(VGA_SYNC_N));
	// clock_divider
	logic [31:0] clk;	
	logic SYSTEM_CLOCK;			
	clock_divider divider (CLOCK_50, reset, clk);
   assign SYSTEM_CLOCK = clk[20];
   
	line_drawer line1 (.clk(SYSTEM_CLOCK), .reset(reset), .x0(0), .y0(0), .x1(240), .y1(240), .x, .y, .done);
	clearLine clear (.x0(0), .y0(0), .x1(240), .y1(240), .clk(SYSTEM_CLOCK), .reset(reset), .clearFlag, .done, .blackX, .blackY);
	
	assign LEDR[9] = done;
	assign colorX =  done ? blackX : x;
	assign colorY = done ? blackY : y;
endmodule  // DE1_SoC

module clock_divider(clock, reset, divided_clocks);
    input logic reset, clock;
    output logic [31:0] divided_clocks = 0;
    
    always_ff @(posedge clock) begin
        divided_clocks <= divided_clocks + 1;
    end
endmodule // clock_divider
