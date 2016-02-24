`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:17 01/22/2016
// Design Name:   rounding
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab2/Lab2/tb_rounding.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rounding
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_rounding;

	// Inputs
	reg [2:0] E5;
	reg [3:0] SIG5;
	reg FB5;

	// Outputs
	wire [2:0] E6;
	wire [3:0] F6;

	// Instantiate the Unit Under Test (UUT)
	rounding uut (
		.E5(E5), 
		.SIG5(SIG5), 
		.FB5(FB5), 
		.E6(E6), 
		.F6(F6)
	);

	initial begin
		// Initialize Inputs
		E5 = 3'b001;
		SIG5 = 4'b0001;
		FB5 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		E5 = 3'b001;
		SIG5 = 4'b0001;
		FB5 = 1;
		#100;
		
		E5 = 3'b001;
		SIG5 = 4'b1111;
		FB5 = 1;
		#100;
		
		E5 = 3'b111;
		SIG5 = 4'b1111;
		FB5 = 1;
		#100;
	
	
		
	end
      
endmodule

