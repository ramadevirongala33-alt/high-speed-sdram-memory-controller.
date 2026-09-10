`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:35:35
// Design Name: 
// Module Name: sdram_read_controller
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
// File Name : sdram_read_controller.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : SDRAM Read Controller
//====================================================


module sdram_read_controller(

input clk,

input reset,


input read_enable,


input [15:0] sdram_data,


output reg [15:0] read_data,


output reg read_done,


output reg [2:0] read_state

);



// Read States

parameter IDLE      = 3'd0;

parameter ACTIVATE  = 3'd1;

parameter WAIT      = 3'd2;

parameter READ_CMD  = 3'd3;

parameter DATA      = 3'd4;

parameter COMPLETE  = 3'd5;



always @(posedge clk)

begin


if(reset)

begin

read_state <= IDLE;

read_data <= 16'b0;

read_done <= 0;

end


else

begin


case(read_state)



IDLE:

begin

read_done <= 0;


if(read_enable)

read_state <= ACTIVATE;


end



ACTIVATE:

begin

read_state <= WAIT;

end



WAIT:

begin

read_state <= READ_CMD;

end



READ_CMD:

begin

read_state <= DATA;

end



DATA:

begin

read_data <= sdram_data;

read_state <= COMPLETE;

end



COMPLETE:

begin

read_done <= 1;

read_state <= IDLE;

end



default:

read_state <= IDLE;



endcase


end


end


endmodule
