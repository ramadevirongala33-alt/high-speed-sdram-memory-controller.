`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:34:27
// Design Name: 
// Module Name: sdram_initialization
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


module sdram_initialization(

input clk,

input reset,


output reg init_done,


output reg [2:0] init_state

);



// Initialization States

parameter POWER_ON  = 3'd0;

parameter NOP       = 3'd1;

parameter PRECHARGE = 3'd2;

parameter REFRESH   = 3'd3;

parameter LOAD_MODE = 3'd4;

parameter COMPLETE  = 3'd5;



// Counter for delay

reg [3:0] counter;



always @(posedge clk)

begin


if(reset)

begin

init_state <= POWER_ON;

counter <= 0;

init_done <= 0;

end


else

begin


case(init_state)



POWER_ON:

begin

counter <= counter + 1;


if(counter == 4'd5)

begin

init_state <= NOP;

counter <= 0;

end

end



NOP:

begin

init_state <= PRECHARGE;

end



PRECHARGE:

begin

init_state <= REFRESH;

end



REFRESH:

begin

init_state <= LOAD_MODE;

end



LOAD_MODE:

begin

init_state <= COMPLETE;

end



COMPLETE:

begin

init_done <= 1;

init_state <= COMPLETE;

end



default:

begin

init_state <= POWER_ON;

end



endcase


end


end


endmodule
