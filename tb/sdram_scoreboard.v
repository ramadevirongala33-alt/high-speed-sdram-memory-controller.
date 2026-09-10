`timescale 1ns/1ps

//====================================================
// File Name : sdram_scoreboard.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : Read/Write Checker
//====================================================

module sdram_scoreboard
(

input write_check,

input read_check,

input [23:0] address,

input [15:0] write_data,

input [15:0] read_data

);


//====================================================
// Reference Memory
//====================================================

reg [15:0] expected_memory [0:1023];


integer i;


//====================================================
// Initialize Memory
//====================================================

initial
begin

for(i=0;i<1024;i=i+1)

begin

expected_memory[i] = 16'h0000;

end

end



//====================================================
// Write Checking
//====================================================

always @(posedge write_check)
begin

expected_memory[address[9:0]] = write_data;


$display("--------------------------------");

$display("SCOREBOARD WRITE");

$display("ADDRESS = %h DATA = %h",
address,
write_data);

$display("--------------------------------");


end



//====================================================
// Read Checking
//====================================================

always @(posedge read_check)
begin


if(expected_memory[address[9:0]] == read_data)

begin


$display("--------------------------------");

$display("PASS");

$display("ADDRESS = %h EXPECTED = %h RECEIVED = %h",
address,
expected_memory[address[9:0]],
read_data);

$display("--------------------------------");


end


else

begin


$display("--------------------------------");

$display("FAIL");

$display("ADDRESS = %h EXPECTED = %h RECEIVED = %h",
address,
expected_memory[address[9:0]],
read_data);

$display("--------------------------------");


end


end


endmodule