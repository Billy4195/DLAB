`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:07 12/27/2015 
// Design Name: 
// Module Name:    status_board 
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
module status_board(
	input [9:0]x,
	input [9:0]y,
	input [3:0]id,
	output reg [2:0]rgb,
	output reg stbd_valid
	 );
	always@(*)begin
		if(x > 520 && y < 75)begin
			case(id)
			10:
				if((x > 555 && x < 565 && y > 10 && y < 60 ) || ((x >580 && x < 610 && y> 10 && y <60) && !( x >590 && x < 600 && y > 20 && y<50)))begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			9:
				if( ((x > 580 && x <610 && y >10  && y <40) && !( x >590 &&  x <600 && y >20  && y < 30)) || (x >580 && x <610 && y >50 && y <60) || (x >600 && x<610 && y >=40 && y<60))begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			8:
				if( (x > 580 && x <610 && y >10 && y <60) && !(x >590 && x < 600 && ( (y> 20 && y <30) || (y> 40 && y <50))) )begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			7:
				if(  (x>580 && x <590 && y >10 && y<35) || (x >=590 && x <600 &&y>10 && y <20) || (x >=600 && x <610 && y >10 && y<60))begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			6:
				if( ((x > 580 && x <610 && y >10 && y <60) && !(x >590 && x < 600 && ( (y> 20 && y <30) || (y> 40 && y <50)))) && !(x >= 600 && x <610 && y>20 && y <30) )begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			5:
				if( ((x > 580 && x <610 && y >10 && y <60) && !(x >590 && x < 600 && ( (y> 20 && y <30) || (y> 40 && y <50)))) && !((x >= 600 && x <610 && y>20 && y <30) || (x >580 && x <=590 &&y >40 && y <50)) )begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			4:
				if( (x >580 && x < 590 && y >10 && y < 40) || ( x >= 590 && x <= 600 && y > 30 && y <40) || ( x > 600 && x <610 && y >10 && y <60))begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			3:
				if( ((x > 580 && x <610 && y >10 && y <60) && !(x >590 && x < 600 && ( (y> 20 && y <30) || (y> 40 && y <50)))) && !( (x>580 && x <= 590) && ( (y >20 && y <30) || (y >40 && y <50)))  )begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			2:
				if( ((x > 580 && x <610 && y >10 && y <60) && !(x >590 && x < 600 && ( (y> 20 && y <30) || (y> 40 && y <50)))) && !( (x>580 && x <= 590 && y >20 && y <30) || (x>=600 && x <610 && y>40 && y <50)) )begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			1:
				if( x > 600 && x <610 && y >10 && y < 60)begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			0:
				if( (x > 580 && x <610 && y >10 && y <60) && !(x>590 && x <600 && y>20 && y <50))begin
					rgb <= 3'b110;
					stbd_valid <= 1;
				end
				else begin
					rgb <= 3'b011;
					stbd_valid <= 1;
				end
			endcase
		end
		else stbd_valid <= 0;
	end
	 


endmodule
