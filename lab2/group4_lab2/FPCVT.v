`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Marcus, Niels, Kyle
// 
// Create Date:    14:51:41 01/21/2016 
// Design Name: 
// Module Name:    FPCVT 
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
module FPCVT(D, S, E, F
    );
	 input [11:0] D;
	 output [0:0] S;
	 output [2:0] E;
	 output [3:0] F;
	
	 wire[10:0] tempMAG;
	 wire[2:0] tempE; 
	 wire[3:0] tempS;
	 wire[0:0] tempFB;
	 wire[2:0] tempE2;
	 wire[3:0] tempF2;
	 
	 convertToSignMag CS(.D2(D), .S2(S), .MAG(tempMAG));
	 countLeadZeros  CLZ(.MAG3(tempMAG), .E3(tempE));
	 extractLeadBits ELB(.MAG4(tempMAG), .SIG4(tempS), .FB4(tempFB)); 
	 rounding RD(.E5(tempE), .SIG5(tempS), .FB5(tempFB), .E6(tempE2), .F6(tempF2));
	 
	 assign E= tempE2;
	 assign F= tempF2;
	 
	 
//To Do: Hard Code Case of ALL 1's//
endmodule

//////////////Converting to Sign Magnitute /////////////////
module convertToSignMag( D2, S2, MAG
	);
	input [11:0] D2;
	output [0:0] S2;
	output [10:0] MAG;
	integer i;
	
	reg [11:0] tempMAG;
	//reg [0:0] tempS2;
	reg [10:0] tempShortMag;
	
	always@(*)
	begin 
		tempMAG=D2; //Originally, tempMAG is = unaltered to D2, unless leading bit is 1
		if(tempMAG == 12'b100000000000)
		begin
			tempShortMag = 11'b11111111111;
		end
		else 
		begin
			if (D2[11] == 1) //if sign is 1 (and thus negative)
			begin
				tempMAG = ~D2 + 1'b1; //inverts the input and stores in tempMAG
			end
		
			//tempS2[0]= D2[0];  //Assign Sign 
			for (i=10; i>=0; i=i-1) //Now Assign the MAG by making it take in tempMAG
				tempShortMag[i]= tempMAG[i];
		end
	end	
		assign MAG= tempShortMag;
		assign S2= D2[11]; 
endmodule

//////////////Count the Leading Zeros /////////////////
module countLeadZeros( MAG3, E3
	);
	input [10:0] MAG3;
	output [2:0] E3;
	
	assign E3 = (MAG3[10])?3'b111: (
		(MAG3[9])?3'b110:
		(MAG3[8])?3'b101:
		(MAG3[7])?3'b100:
		(MAG3[6])?3'b011:
		(MAG3[5])?3'b010:
		(MAG3[4])?3'b001: 3'b000
		 );
	
endmodule

//////////////Extract the Leading Bits/////////////////
module extractLeadBits( MAG4, SIG4, FB4
	);
	
	input [10:0] MAG4;
	output [3:0] SIG4;
	output FB4;
	
	reg[2:0] SHIFTYBY;
	reg[10:0] TEMPMAG4;
	
	always@(*)
	begin
		SHIFTYBY = (MAG4[10])?3'b000: (
			(MAG4[9])?3'b001:
			(MAG4[8])?3'b010:
			(MAG4[7])?3'b011:
			(MAG4[6])?3'b100:
			(MAG4[5])?3'b101:
			(MAG4[4])?3'b110: 3'b111
			);
		TEMPMAG4= MAG4 << SHIFTYBY;
	end 
	
	assign SIG4[3] = TEMPMAG4[10];
	assign SIG4[2] = TEMPMAG4[9];
	assign SIG4[1] = TEMPMAG4[8];
	assign SIG4[0] = TEMPMAG4[7];
	assign FB4= TEMPMAG4[6];
	
endmodule

//////////////Rounding Phase/////////////////
module rounding( E5, SIG5, FB5, E6, F6
	);
	input [2:0] E5;
	input [3:0] SIG5;
	input FB5;
	output [2:0] E6;
	output [3:0] F6;
	
	integer overflow;
	integer allOnes;
	reg [3:0] TEMPSIG5;
	reg [2:0] TEMPE5;
	
	always@(*) //TO DO: if E and SIG are all 1's
	begin
		TEMPSIG5= SIG5;
		overflow=0;
		allOnes=0;
		TEMPE5=E5;
		
		if(TEMPSIG5 == 4'b1111 && FB5==1)
		begin
			if(TEMPE5 != 3'b111)
			overflow=1;
			else
				allOnes=1; 
		end
		
		if(FB5==1 && allOnes == 0)
		begin
			if(overflow == 1) 
			begin
				TEMPSIG5= TEMPSIG5 >> 1;
				TEMPE5 = TEMPE5 + 1;
			end
			
			TEMPSIG5= TEMPSIG5 + 1;
			
		end
	
	end
	
	assign E6= TEMPE5;
	assign F6= TEMPSIG5; 
	
endmodule