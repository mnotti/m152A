`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:28 01/22/2016
// Design Name:   countLeadZeros
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab2/Lab2/tb_CountLeadZeros.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: countLeadZeros
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_CountLeadZeros;

	// Inputs
	reg [10:0] MAG3;

	// Outputs
	wire [2:0] E3;

	// Instantiate the Unit Under Test (UUT)
	countLeadZeros uut (
		.MAG3(MAG3), 
		.E3(E3)
	);

	initial begin
		// Initialize Inputs
		MAG3 = 11'b00000000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		MAG3 = 11'b00000000001;
		#100;
		
		MAG3 = 11'b00000000010;
		#100;
		
		MAG3 = 11'b00000000100;
		#100;
		
		MAG3 = 11'b00000001000;
		#100;
		
		MAG3 = 11'b00000010000;
		#100;
		
		MAG3 = 11'b00000100000;
		#100;
		
		MAG3 = 11'b10100100000;
		#100;
		
		MAG3 = 11'b11111111111;
		#100;
	end
      
endmodule

