`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:30:33
// Design Name: 
// Module Name: sdram_parameters
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


module sdram_parameters;


// SDRAM Data Width

parameter DATA_WIDTH = 16;


// SDRAM Address Width

parameter ADDR_WIDTH = 24;


// Row Address Width

parameter ROW_WIDTH = 13;


// Column Address Width

parameter COLUMN_WIDTH = 10;


// Bank Address Width

parameter BANK_WIDTH = 2;


// Burst Length

parameter BURST_LENGTH = 4;


// CAS Latency

parameter CAS_LATENCY = 2;


// Refresh Counter

parameter REFRESH_COUNT = 780;


endmodule
