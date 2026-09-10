`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 12:17:45
// Design Name: 
// Module Name: memory_test_sequence
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
// File Name : memory_test_sequence.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : Functional Test Sequence
//====================================================


module memory_test_sequence;


reg [23:0] test_address;

reg [15:0] test_data;


// Test counter

integer i;



initial
begin


// Initial values

test_address = 24'h000000;

test_data = 16'h0000;



// Multiple Write Test


for(i=0;i<10;i=i+1)

begin


test_address = i * 16;


test_data = 16'h1000 + i;



$display("WRITE TEST : Address=%h Data=%h",
test_address,
test_data);



#20;


end



// Multiple Read Test


for(i=0;i<10;i=i+1)

begin


test_address = i * 16;


$display("READ TEST : Address=%h",
test_address);



#20;


end



$display("FUNCTIONAL TEST COMPLETED");


end



endmodule
