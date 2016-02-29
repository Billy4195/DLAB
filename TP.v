`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:37 12/27/2015 
// Design Name: 
// Module Name:    TP 
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
module TP(
	input clk,
	input show,
	input [1:0]id,
	input [9:0]midx,
	input [9:0]midy,
	input [9:0]x,
	input [9:0]y,
	output reg [2:0]rgb,
	output reg tp_valid
    );
	wire [9:0] x_;
	wire [9:0] y_;
	//reg [25:0] cnt;
	assign x_ = x > midx ? x - midx : midx - x;
	assign y_ = y > midy ? y - midy : midy - y;
	always@(*)begin
		if(show)begin
			case(id)
			0:begin
				if(x <= midx+8 && x >= midx-8 && y <= midy+8 && y >= midy-8)begin
					rgb <= 3'b001;
					tp_valid <= 1;
				end
				else tp_valid <=0;
			end
			1:begin
				if(y <= midy+20 && 2*x+midy < y+2*midx && 2*x+y > 2*midx+midy)begin
					rgb <= 3'b010;
					tp_valid <= 1;
				end
				else tp_valid <=0;
			end
			2:begin
				if( x_*x_ + y_*y_ <= 10*10)begin
					rgb <= 3'b100;
					tp_valid <= 1;
				end
				else tp_valid <=0;
			end
			3:begin
				if( x_*x_ + y_*y_ <= 10*10)begin
					rgb <= 3'b101;
					tp_valid <= 1;
				end
				else tp_valid <=0;
			end
			default:
				tp_valid <= 0;
         endcase
		end
		else
			tp_valid <= 0;
	end


endmodule
