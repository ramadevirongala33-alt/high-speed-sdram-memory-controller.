`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:39:09
// Design Name: 
// Module Name: sdram_burst_controller
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
// File Name : sdram_burst_controller.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : SDRAM Burst Transfer Controller
//====================================================


module sdram_burst_controller(

input clk,

input reset,


input burst_enable,


input [15:0] burst_data_in,


output reg [15:0] burst_data_out,


output reg burst_done,


output reg [2:0] burst_state

);



// Burst States

parameter IDLE    = 3'd0;

parameter BURST1  = 3'd1;

parameter BURST2  = 3'd2;

parameter BURST3  = 3'd3;

parameter BURST4  = 3'd4;

parameter COMPLETE= 3'd5;



reg [1:0] burst_count;



always @(posedge clk)

begin


if(reset)

begin

burst_state <= IDLE;

burst_count <= 0;

burst_done <= 0;

burst_data_out <= 0;

end


else

begin


case(burst_state)



IDLE:

begin

burst_done <= 0;


if(burst_enable)

begin

burst_count <= 0;

burst_state <= BURST1;

end


end



BURST1:

begin

burst_data_out <= burst_data_in;

burst_count <= burst_count + 1;

burst_state <= BURST2;

end



BURST2:

begin

burst_data_out <= burst_data_in;

burst_count <= burst_count + 1;

burst_state <= BURST3;

end



BURST3:

begin

burst_data_out <= burst_data_in;

burst_count <= burst_count + 1;

burst_state <= BURST4;

end



BURST4:

begin

burst_data_out <= burst_data_in;

burst_state <= COMPLETE;

end



COMPLETE:

begin

burst_done <= 1;

burst_state <= IDLE;

end



default:

begin

burst_state <= IDLE;

end



endcase


end


end


endmodule
