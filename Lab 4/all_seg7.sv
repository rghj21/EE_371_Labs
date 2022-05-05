/* Basic 7-segment display driver for hex digits 0-F.
 * Takes 4-bit input hex and outputs 7-bit leds.
 * LED segments are active low:
 *    -0-
 *   5   1
 *    -6-
 *   4   2
 *    -3-
 */
module all_seg7 (loc, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input  logic [4:0] loc;
	output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	assign HEX2 = 7'b1111111; 
	assign HEX3 = 7'b1111111; 
	assign HEX4 = 7'b1111111; 
	assign HEX5 = 7'b1111111; 
	always_comb
		case (loc)
			//       Light: 6543210
			5'b00000  : begin 
								HEX0 = 7'b1000000; 
								HEX1 = 7'b1111111;//0
							end
			5'b00001  : begin
								HEX0 = 7'b1111001; 
								HEX1 = 7'b1111111;//1
							end
			5'b00010  : begin
								HEX0 = 7'b0100100; 
								HEX1 = 7'b1111111;//2
							end
			5'b00011  : begin 
								HEX0 = 7'b0110000; 
								HEX1 = 7'b1111111;//3
							end
			5'b00100  : begin 
								HEX0 = 7'b0011001; 
								HEX1 = 7'b1111111;//4
							end
			5'b00101  : begin 
								HEX0 = 7'b0010010;
								HEX1 = 7'b1111111;//5
							end
			5'b00110  : begin
								HEX0 = 7'b0000010;
								HEX1 = 7'b1111111;//6
							end
			5'b00111  : begin 
								HEX0 = 7'b1111000;
								HEX1 = 7'b1111111;//7
							end
			5'b01000  : begin
								HEX0 = 7'b0000000;
								HEX1 = 7'b1111111;//8
							end
			5'b01001  : begin 	
								HEX0 = 7'b0010000;
								HEX1 = 7'b1111111;//9 
							end
			5'b01010  : begin 
								HEX0 = 7'b1000000;
								HEX1 = 7'b1111001;//10
							end
			5'b01011  : begin 
								HEX0 = 7'b1111001; 
								HEX1 = 7'b1111001;//11
							end
			5'b01100  : begin 	
								HEX0 = 7'b0100100;
								HEX1 = 7'b1111001;//12
							end
			5'b01101  : begin 
								HEX0 = 7'b0110000;
								HEX1 = 7'b1111001;//13
							end
			5'b01110  : begin	
								HEX0 = 7'b0011001;
								HEX1 = 7'b1111001;//14
							end
			5'b01111  : begin
								HEX0 = 7'b0010010;
								HEX1 = 7'b1111001;//15
							end
			5'b10000  : begin	
								HEX0 = 7'b0000010;
								HEX1 = 7'b1111001;//16
							end
			5'b10001  : begin 	
								HEX0 = 7'b1111000; 
								HEX1 = 7'b1111001;//17
							end
			5'b10010  : begin
								HEX0 = 7'b0000000; 
								HEX1 = 7'b1111001;//18
							end
			5'b10011  : begin 
								HEX0 = 7'b0010000; 
								HEX1 = 7'b1111001;//19 
							end
			5'b10100  : begin
								HEX0 = 7'b1000000;
								HEX1 = 7'b0100100;//20
							end
			5'b10101  : begin
								HEX0 = 7'b1111001; 
								HEX1 = 7'b0100100;//21
							end
			5'b10110  : begin	
								HEX0 = 7'b0100100; 
								HEX1 = 7'b0100100;//22
							end
			5'b10111  : begin
								HEX0 = 7'b0110000; 
								HEX1 = 7'b0100100;//23
							end
			5'b11000  : begin
								HEX0 = 7'b0011001; 
								HEX1 = 7'b0100100;//24
							end
			5'b11001  : begin 
								HEX0 = 7'b0010010;
								HEX1 = 7'b0100100;//25
							end
			5'b11010  : begin 
								HEX0 = 7'b0000010; 
								HEX1 = 7'b0100100;//26
							end
			5'b11011  : begin
								HEX0 = 7'b1111000;
								HEX1 = 7'b0100100;//27
							end
			5'b11100  : begin	
								HEX0 = 7'b0000000;
								HEX1 = 7'b0100100;//28
							end
			5'b11101  : begin 
								HEX0 = 7'b0010000; 
								HEX1 = 7'b0100100;//29
							end
			5'b11110  : begin
								HEX0 = 7'b1000000; 
								HEX1 = 7'b0110000;//30
							end
			5'b11111  : begin	
								HEX0 = 7'b1111001;
								HEX1 = 7'b0110000;//31	
							end
      endcase
endmodule  // all_seg7