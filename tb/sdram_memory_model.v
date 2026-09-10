`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:51:56
// Design Name: 
// Module Name: sdram_memory_model
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


module sdram_memory_model(


input clk,


input write_enable,


input read_enable,


input [23:0] address,


inout [15:0] data_bus


);


// Memory Array

reg [15:0] memory [0:1023];


// Data output register

reg [15:0] data_out;


// Tri-state control

assign data_bus = read_enable ? data_out : 16'bz;



// Write Operation

always @(posedge clk)

begin


if(write_enable)

begin

memory[address[9:0]] <= data_bus;

end



end



// Read Operation

always @(posedge clk)

begin


if(read_enable)

begin

data_out <= memory[address[9:0]];

end


end



endmodule
