`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:08 01/26/2016
// Design Name:   FPCVT
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab2/Lab2/tb_FPCVT.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FPCVT;

	// Inputs
	reg [11:0] D;

	// Outputs
	wire [0:0] S;
	wire [2:0] E;
	wire [3:0] F;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		D = 12'b 000000101100;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		D = 12'b 000000101101;
		#100;
		
		D = 12'b 000000101110;
		#100;
		
		D = 12'b 000000101111;
		#100;
		
		D = 12'b 111111111111;
		#100;
		
		D = 12'b 011111111111;
		#100;
		
		D = 12'b 011111000000;
		#100;
		
		D = 12'b 100000000000;
		#100;
		
		D = 12'b 111001011010;
		#100;
	end
      
endmodule

