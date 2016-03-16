`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:23 02/02/2016 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(clk, rstButton, pauseButton, adj, sel, dir, seg, an
	 );
	 
	input clk;	
	input rstButton;
	input pauseButton;
	input adj;
	input sel;
	input dir;
	
	output[7:0] seg;
	output[3:0] an;
	
	reg[7:0] seg;
	reg[3:0] an;

	wire hz2;
	wire hz_big;
	reg state;
	
	clock ck(.clk(clk), .hz2(hz2), .hz_big(hz_big), .pauseButton(pauseButton));
	
	integer secs = 0;
	integer mins = 0;
	
	integer rst_trigger = 0;
	integer rst_ack = 0;
	
	integer pause_pressed = 0;
	integer pause_ack = 0;
	integer pause_count = 0;
	integer paused = 0;
	
	integer adj_pause = 0;
	integer hz = 1;
	
	integer seg_num = 0;
	integer ones_secs = 0;
	integer tens_secs = 0;
	integer ones_mins = 0;
	integer tens_mins = 0;
	
	integer flashCounter = 0;
	
	reg [7:0] ones_secs_seg;
	reg [7:0] tens_secs_seg;
	reg [7:0] ones_mins_seg;
	reg [7:0] tens_mins_seg;
	
	
	always@(posedge hz2)
	begin
		if (rst_trigger && rst_ack == 0)
		begin
			rst_ack = 1;
			mins = 0;
			secs = 0;
			hz = 2;
		end
		if (adj_pause == 1 && sel == 1)
		begin
			if (dir == 0)
			begin
				secs = secs + 1;
				if (secs == 60)
					secs = 0;
			end
			else
				if (secs == 0 && mins != 0)
				begin
					//mins = mins - 1;
					secs = 59;
				end
				else if (secs != 0)
					secs = secs - 1;
		end
		else if (adj_pause == 1 && sel == 0)
		begin
			if (dir == 0)
				mins = mins + 1;
			else if (mins != 0)
				mins = mins - 1;
		end

		else if (hz == 1)
		begin
			hz = 2;
			if (adj_pause == 0)
			begin
				if (dir == 0)
					secs = secs + 1;
				else
				begin
					if (secs != 0)
						secs = secs - 1;
					else if (mins != 0)
					begin
						secs = 59;
						mins = mins - 1;
					end
				end
			end
			
		
			if (rst_ack && rst_trigger == 0)
				rst_ack = 0;
		end
		else
			hz = 1;
		
		if (secs == 60)
		begin
			secs = 0;
			mins = mins + 1;
		end
		
		ones_secs = secs % 10;
		tens_secs = (secs/10) % 10;
		ones_mins = mins % 10;
		tens_mins = (mins/10) % 10;
		
		ones_secs_seg = (ones_secs == 0)?8'b11000000: (
		(ones_secs == 1)?8'b11111001:
		(ones_secs == 2)?8'b10100100:
		(ones_secs == 3)?8'b10110000:
		(ones_secs == 4)?8'b10011001:
		(ones_secs == 5)?8'b10010010:
		(ones_secs == 6)?8'b10000010:
		(ones_secs == 7)?8'b11111000:
		(ones_secs == 8)?8'b10000000:
			8'b10010000
		);
		tens_secs_seg = (tens_secs == 0)?8'b11000000: (
		(tens_secs == 1)?8'b11111001:
		(tens_secs == 2)?8'b10100100:
		(tens_secs == 3)?8'b10110000:
		(tens_secs == 4)?8'b10011001:
		(tens_secs == 5)?8'b10010010:
		(tens_secs == 6)?8'b10000010:
		(tens_secs == 7)?8'b11111000:
		(tens_secs == 8)?8'b10000000:
			8'b10010000
		);
		 
		ones_mins_seg = (ones_mins == 0)?8'b11000000: (
		(ones_mins == 1)?8'b11111001:
		(ones_mins == 2)?8'b10100100:
		(ones_mins == 3)?8'b10110000:
		(ones_mins == 4)?8'b10011001:
		(ones_mins == 5)?8'b10010010:
		(ones_mins == 6)?8'b10000010:
		(ones_mins == 7)?8'b11111000:
		(ones_mins == 8)?8'b10000000:
			8'b10010000
		);
		tens_mins_seg = (tens_mins == 0)?8'b11000000: (
		(tens_mins == 1)?8'b11111001:
		(tens_mins == 2)?8'b10100100:
		(tens_mins == 3)?8'b10110000:
		(tens_mins == 4)?8'b10011001:
		(tens_mins == 5)?8'b10010010:
		(tens_mins == 6)?8'b10000010:
		(tens_mins == 7)?8'b11111000:
		(tens_mins == 8)?8'b10000000:
			8'b10010000
		);
	end
	
	always@(posedge hz_big)
	begin
		//adj pause ack and triggers
		if (adj == 1)
			adj_pause = 1;
		else
			adj_pause = 0;
		
		
		seg = 8'b11111111;
		if (rstButton == 1)
			rst_trigger = 1;
		if (rst_ack && rst_trigger)
			rst_trigger = 0;
			
		flashCounter = flashCounter + 1;
		if (flashCounter == 200)
			flashCounter = 0;
		
		if(seg_num == 0 && !(flashCounter < 100 && sel == 0 && adj == 1))
		begin
			an = 4'b0111;
			seg = tens_mins_seg;
		end
		else if(seg_num == 1 && !(flashCounter < 100 && sel == 0 && adj == 1))
		begin
			an = 4'b1011;
			seg = ones_mins_seg;
		end
		else if(seg_num == 2 && !(flashCounter < 100 && sel == 1 && adj == 1))
		begin
			an = 4'b1101;
			seg = tens_secs_seg;
		end
		else if(seg_num == 3 && !(flashCounter < 100 && sel == 1 && adj == 1))
		begin
			an = 4'b1110;
			seg = ones_secs_seg;
		end
		
		seg_num = (seg_num + 1) % 4;
		
		if (rst_trigger == 1)
		begin
			seg = 8'b11000000;
		end

		
	end


endmodule

module clock(clk, hz2, hz_big, pauseButton, rstButton
	 );
	input clk;
	input pauseButton;
	input rstButton;
	output hz2;
	output hz_big;
	
	reg temp_hz2;
	reg temp_hz_big;
	
	//integer counter1 = 100000000;
	integer counter2 = 200000;
	integer counter1 = 50000000;
	integer paused = 0;
	integer pause_count = 0;
	
	always@(posedge clk)
	begin
		if (rstButton == 1)
		begin
			counter1 = 50000000;
			temp_hz2 = 1;
		end
		//pause button acks and trigger
		if (pauseButton == 1)
		begin
			if (pause_count < 3000000)
				pause_count = pause_count + 1;
		end
		else
		begin
			if (pause_count == 3000000)
				paused = !paused;
			pause_count = 0;
		end
			
		temp_hz2 = 0;
		temp_hz_big = 0;
		if (!paused)
			counter1 = counter1 - 1;
		counter2 = counter2 - 1;
		if (counter1 == 0)
		begin
			counter1 = 50000000;
			temp_hz2 = 1;
		end
		if (counter2 == 0)
		begin
			counter2 = 200000;
			temp_hz_big = 1;
		end
		
	end
	
	assign hz2 = temp_hz2;
	assign hz_big = temp_hz_big;
endmodule
