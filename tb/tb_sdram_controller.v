`timescale 1ns/1ps

//====================================================
// Testbench : tb_sdram_controller
// Project   : High Speed SDRAM Memory Controller
//====================================================

module tb_sdram_controller;


//====================================================
// Clock and Reset
//====================================================

reg clk;
reg reset;


//====================================================
// User Interface
//====================================================

reg req;
reg rw;

reg [23:0] addr;

reg [15:0] data_in;


wire [15:0] data_out;

wire busy;


//====================================================
// SDRAM Interface
//====================================================

wire [12:0] sdram_addr;

wire [1:0] sdram_bank;

wire [15:0] sdram_data;

wire sdram_cs;

wire sdram_ras;

wire sdram_cas;

wire sdram_we;



//====================================================
// DUT Instance
//====================================================

sdram_controller_top DUT
(

.clk(clk),

.reset(reset),

.req(req),

.rw(rw),

.addr(addr),

.data_in(data_in),

.data_out(data_out),

.busy(busy),

.sdram_addr(sdram_addr),

.sdram_bank(sdram_bank),

.sdram_data(sdram_data),

.sdram_cs(sdram_cs),

.sdram_ras(sdram_ras),

.sdram_cas(sdram_cas),

.sdram_we(sdram_we)

);
sdram_scoreboard SCOREBOARD
(
.write_check(sb_write_check),
.read_check(sb_read_check),
.address(sb_address),
.write_data(sb_write_data),
.read_data(sb_read_data)
);


//====================================================
// SDRAM Memory Model
//====================================================

sdram_memory_model MEM_MODEL
(

.clk(clk),

.write_enable(req && rw),

.read_enable(req && !rw),

.address(addr),

.data_bus(sdram_data)

);



//====================================================
// Clock Generation
//====================================================

initial
begin

clk = 0;

forever #5 clk = ~clk;

end



//====================================================
// Functional Verification Test
//====================================================

integer i;


initial
begin


// Initial Reset

reset = 1;

req = 0;

rw = 0;

addr = 24'h000000;

data_in = 16'h0000;



#50;


reset = 0;



//====================================================
// WRITE TEST
//====================================================

for(i=0;i<5;i=i+1)

begin


#20;


req = 1;

rw = 1;


addr = i * 16;


data_in = 16'hA000 + i;



#10;


req = 0;



$display("WRITE : ADDRESS=%h DATA=%h",
addr,
data_in);



end



//====================================================
// READ TEST
//====================================================

for(i=0;i<5;i=i+1)

begin


#100;


req = 1;

rw = 0;


addr = i * 16;



#10;


req = 0;



$display("READ : ADDRESS=%h DATA=%h",
addr,
data_out);



end



#200;


$display("==============================");

$display("SDRAM FUNCTIONAL TEST COMPLETE");

$display("==============================");


$finish;


end




//====================================================
// Monitor
//====================================================

initial
begin


$monitor(

"TIME=%0t RESET=%b BUSY=%b ADDR=%h DATA=%h",

$time,

reset,

busy,

addr,

data_out

);


end




//====================================================
// Waveform Dump
//====================================================

initial
begin

$dumpfile("sdram_controller.vcd");

$dumpvars(0,tb_sdram_controller);

end



endmodule