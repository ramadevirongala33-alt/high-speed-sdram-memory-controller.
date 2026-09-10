`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:37:57
// Design Name: 
// Module Name: sdram_refresh_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


//====================================================
// File Name : sdram_refresh_controller.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : SDRAM Auto Refresh Controller
//====================================================


module sdram_refresh_controller(

input clk,

input reset,


output reg refresh_request,


output reg refresh_done,


output reg [2:0] refresh_state

);



// Refresh States

parameter IDLE        = 3'd0;

parameter COUNT       = 3'd1;

parameter PRECHARGE   = 3'd2;

parameter REFRESH_CMD = 3'd3;

parameter COMPLETE    = 3'd4;



// Refresh Counter

reg [15:0] counter;



always @(posedge clk)

begin


if(reset)

begin

counter <= 0;

refresh_request <= 0;

refresh_done <= 0;

refresh_state <= IDLE;

end


else

begin


case(refresh_state)



IDLE:

begin

refresh_done <= 0;

refresh_state <= COUNT;

end



COUNT:

begin


counter <= counter + 1;


if(counter == 16'd1000)

begin

refresh_request <= 1;

counter <= 0;

refresh_state <= PRECHARGE;

end


end



PRECHARGE:

begin

refresh_request <= 0;

refresh_state <= REFRESH_CMD;

end



REFRESH_CMD:

begin

refresh_state <= COMPLETE;

end



COMPLETE:

begin

refresh_done <= 1;

refresh_state <= IDLE;

end



default:

begin

refresh_state <= IDLE;

end



endcase


end


end


endmodule
