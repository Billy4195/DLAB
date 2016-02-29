`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:26:28 12/27/2015 
// Design Name: 
// Module Name:    GP 
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
module GP(
	input clk,
	input [9:0]midx,
	input [9:0]midy,
	input [9:0]x,
	input [9:0]y,
	output reg [2:0]rgb,
	output reg gp_valid
    );
	wire [9:0] x_;
	wire [9:0] y_;
	reg [25:0] cnt;
	assign x_ = x > midx ? x - midx : midx - x;
	assign y_ = y > midy ? y - midy : midy - y;
	always@(*)begin
		if(  ((x_*x_) + (y_*y_) <= 16*16))begin
			gp_valid <= 1;
			if(cnt <= 5000000)begin
				if((x+y > midx+midy) ||(x+midy < y+midx))begin
					rgb <= 3'b110;
					gp_valid <= 1;
				end
				else
//					rgb <= 3'b111;//background color
					gp_valid <= 0;
			end
			else if(cnt <= 10000000)begin
				rgb <= 3'b110;
				gp_valid <= 1;
			end
		end
		else 
			gp_valid <= 0;
	end
	
	always@(posedge clk)begin
		if(cnt >=10000000)
			cnt <= 0;
		else
			cnt <= cnt + 1 ;
	end

//(x+y > midx+midy) || right down
//(x+midy < y+midx)		left down
endmodule
