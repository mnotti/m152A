`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:25 01/22/2016
// Design Name:   extractLeadBits
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab2/Lab2/tb_extractLeadBits.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: extractLeadBits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_extractLeadBits;

	// Inputs
	reg [10:0] MAG4;

	// Outputs
	wire [3:0] SIG4;
	wire FB4;

	// Instantiate the Unit Under Test (UUT)
	extractLeadBits uut (
		.MAG4(MAG4), 
		.SIG4(SIG4), 
		.FB4(FB4)
	);

	initial begin
		// Initialize Inputs
		MAG4 = 11'b00000101111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		//MAG4 = 11'b01101000101;
		//#100;

	end
      
endmodule

