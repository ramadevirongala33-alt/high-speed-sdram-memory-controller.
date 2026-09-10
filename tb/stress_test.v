`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 13:03:41
// Design Name: 
// Module Name: stress_test
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

module stress_test;


integer i;


initial
begin


$display("==============================");
$display("SDRAM STRESS TEST START");
$display("==============================");


// 100 continuous write/read operations

for(i=0;i<100;i=i+1)

begin


// WRITE

#10;

tb_sdram_controller.req = 1;

tb_sdram_controller.rw = 1;

tb_sdram_controller.addr = i;

tb_sdram_controller.data_in = 16'h5500 + i;


#10;

tb_sdram_controller.req = 0;



// READ

#50;

tb_sdram_controller.req = 1;

tb_sdram_controller.rw = 0;

tb_sdram_controller.addr = i;


#10;

tb_sdram_controller.req = 0;


end



#200;


$display("==============================");
$display("SDRAM STRESS TEST COMPLETE");
$display("==============================");


$finish;


end


endmodule
