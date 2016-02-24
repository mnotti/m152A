`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:13 01/21/2016 
// Design Name: 
// Module Name:    tb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tb;
	reg [11:0] num1;
	reg [10:0] MAG1;
	reg [0:0] S1;
	
	always@(*)
	begin
		num1 = 12'b11000000000;
		convertToSignMag testFun1(
			.D2(num1),
			.S2(S1),
			.MAG2(MAG1) 
			);
		$display("The binary value of a is: %b", MAG1);
		$display("The binary value of a is: %b", S1) ;
	end

endmodule
