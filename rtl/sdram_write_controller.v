`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:36:54
// Design Name: 
// Module Name: sdram_write_controller
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
// File Name : sdram_write_controller.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : SDRAM Write Controller
//====================================================


module sdram_write_controller(

input clk,

input reset,


input write_enable,


input [15:0] write_data,


output reg [15:0] sdram_data,


output reg write_done,


output reg [2:0] write_state

);



// Write States

parameter IDLE      = 3'd0;

parameter ACTIVATE  = 3'd1;

parameter WAIT      = 3'd2;

parameter WRITE_CMD = 3'd3;

parameter DATA      = 3'd4;

parameter COMPLETE  = 3'd5;



always @(posedge clk)

begin


if(reset)

begin

write_state <= IDLE;

sdram_data <= 16'b0;

write_done <= 0;

end


else

begin


case(write_state)



IDLE:

begin

write_done <= 0;


if(write_enable)

write_state <= ACTIVATE;


end



ACTIVATE:

begin

write_state <= WAIT;

end



WAIT:

begin

write_state <= WRITE_CMD;

end



WRITE_CMD:

begin

write_state <= DATA;

end



DATA:

begin

sdram_data <= write_data;

write_state <= COMPLETE;

end



COMPLETE:

begin

write_done <= 1;

write_state <= IDLE;

end



default:

begin

write_state <= IDLE;

end



endcase


end


end


endmodule
