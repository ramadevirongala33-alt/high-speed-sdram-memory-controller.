`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:32:47
// Design Name: 
// Module Name: sdram_address_mapping
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
// File Name : sdram_address_mapping.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : Address Mapping for SDRAM
//====================================================


module sdram_address_mapping(

input [23:0] address,


output [12:0] row_address,


output [9:0] column_address,


output [1:0] bank_address

);



// Row Address

assign row_address = address[21:10];



// Column Address

assign column_address = address[9:0];



// Bank Address

assign bank_address = address[23:22];



endmodule
