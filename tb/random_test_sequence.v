`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 12:57:21
// Design Name: 
// Module Name: random_test_sequence
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


`timescale 1ns/1ps


module random_test_sequence;


// Test counter

integer i;


// Random variables

reg [23:0] random_addr;

reg [15:0] random_data;



initial
begin


$display("==============================");
$display("RANDOM SDRAM TEST START");
$display("==============================");



for(i=0;i<20;i=i+1)

begin


// Generate random address

random_addr = $random;


// Generate random data

random_data = $random;



// WRITE

#20;


tb_sdram_controller.req = 1;

tb_sdram_controller.rw  = 1;


tb_sdram_controller.addr = random_addr;


tb_sdram_controller.data_in = random_data;



#10;


tb_sdram_controller.req = 0;



$display("RANDOM WRITE ADDR=%h DATA=%h",
random_addr,
random_data);




// READ

#100;


tb_sdram_controller.req = 1;

tb_sdram_controller.rw = 0;


tb_sdram_controller.addr = random_addr;



#10;


tb_sdram_controller.req = 0;



$display("RANDOM READ ADDR=%h",
random_addr);



end



#200;


$display("==============================");
$display("RANDOM TEST COMPLETE");
$display("==============================");


end


endmodule
