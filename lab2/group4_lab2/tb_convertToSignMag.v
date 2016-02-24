`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:47:04 01/22/2016
// Design Name:   convertToSignMag
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab2/Lab2/tb_convertToSignMag.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: convertToSignMag
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_convertToSignMag;

	// Inputs
	reg [11:0] D2;

	// Outputs
	wire [0:0] S2;
	wire [10:0] MAG;

	// Instantiate the Unit Under Test (UUT)
	convertToSignMag uut (
		.D2(D2), 
		.S2(S2), 
		.MAG(MAG)
	);

	initial begin
		// Initialize Inputs
		D2 = 12'b000000000001;

		// Wait 100 ns for global reset to finish
		#100;
        
		  D2 = 12'b111111111111;
		// Add stimulus here

	end
      
endmodule

