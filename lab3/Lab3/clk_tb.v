`timescale 1ps / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:45 02/04/2016
// Design Name:   stopwatch
// Module Name:   C:/Users/152/Desktop/aaCoolM152A/Lab3/ISE Files/Lab3/clk_tb.v
// Project Name:  Lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stopwatch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clk_tb;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	stopwatch uut (
		.clk(clk), 
		.seg(seg), 
		.an(an)
	);
	integer counter;
	initial begin
		// Initialize Inputs
		for (counter = 2000000; counter > 0; counter = counter - 1)
		begin
			clk = 0;
			#100
			clk = 1;
		end
        
		// Add stimulus here

	end
      
endmodule

