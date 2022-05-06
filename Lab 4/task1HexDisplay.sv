// Hex Display module
// takes 4-bit input 
// outputs 6-bit HEX0-5
// Determines what number should be displayed on HEX0 based on the 4-bit input
module task1HexDisplay(result, HEX0);
	input logic [3:0] result;
	output logic [6:0] HEX0;
	
	// HEX1 - HEX5 are turned off
	
	//determines value of HEX0 based on input
	always_comb begin 
		case(result)
			4'b0000  : HEX0 = 7'b1000000; //0
			4'b0001  : HEX0 = 7'b1111001; //1
			4'b0010  : HEX0 = 7'b0100100; //2
			4'b0011  : HEX0 = 7'b0110000; //3
			4'b0100  : HEX0 = 7'b0011001; //4
			4'b0101  : HEX0 = 7'b0010010; //5
			4'b0110  : HEX0 = 7'b0000010; //6
			4'b0111  : HEX0 = 7'b1111000; //7
			4'b1000  : HEX0 = 7'b0000000; //8
			4'b1001  : HEX0 = 7'b0010000; //9 
			default: HEX0 = 7'b1111111; //empty
		endcase 
	end // always_comb
endmodule
