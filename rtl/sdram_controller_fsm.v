`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:31:55
// Design Name: 
// Module Name: sdram_controller_fsm
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
// File Name : sdram_controller_fsm.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : SDRAM Controller State Machine
//====================================================


module sdram_controller_fsm(

input clk,

input reset,


output reg [3:0] state

);


//====================================================
// State Declaration
//====================================================

parameter IDLE      = 4'd0;

parameter INIT      = 4'd1;

parameter ACTIVATE  = 4'd2;

parameter READ      = 4'd3;

parameter WRITE     = 4'd4;

parameter PRECHARGE = 4'd5;

parameter REFRESH   = 4'd6;

parameter WAIT      = 4'd7;



//====================================================
// FSM Sequential Logic
//====================================================

always @(posedge clk)

begin


if(reset)

begin

state <= INIT;

end


else

begin


case(state)



INIT:

begin

state <= IDLE;

end



IDLE:

begin

state <= ACTIVATE;

end



ACTIVATE:

begin

state <= WAIT;

end



WAIT:

begin

state <= READ;

end



READ:

begin

state <= PRECHARGE;

end



WRITE:

begin

state <= PRECHARGE;

end



PRECHARGE:

begin

state <= REFRESH;

end



REFRESH:

begin

state <= IDLE;

end



default:

begin

state <= IDLE;

end



endcase


end


end


endmodule
