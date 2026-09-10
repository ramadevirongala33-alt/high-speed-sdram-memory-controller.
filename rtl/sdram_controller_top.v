`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2026 11:41:02
// Design Name: 
// Module Name: sdram_controller_top
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
// File Name : sdram_controller_top.v
// Project   : High Speed SDRAM Memory Controller
// Purpose   : Top Level SDRAM Controller Module
//====================================================


module sdram_controller_top(

input clk,

input reset,


// User Interface

input req,

input rw,

input [23:0] addr,

input [15:0] data_in,


output reg [15:0] data_out,


output busy,



// SDRAM Interface

output [12:0] sdram_addr,

output [1:0] sdram_bank,


inout [15:0] sdram_data,


output sdram_cs,

output sdram_ras,

output sdram_cas,

output sdram_we


);



// FSM State

wire [3:0] state;



//====================================================
// FSM Module
//====================================================

sdram_controller_fsm FSM
(

.clk(clk),

.reset(reset),

.state(state)

);



//====================================================
// Address Mapping
//====================================================

wire [12:0] row_address;

wire [9:0] column_address;



sdram_address_mapping ADDR_MAP
(

.address(addr),

.row_address(row_address),

.column_address(column_address),

.bank_address(sdram_bank)

);



assign sdram_addr = row_address;



//====================================================
// Busy Signal
//====================================================

assign busy = (state != 4'd0);



//====================================================
// SDRAM Control Signals
//====================================================

assign sdram_cs  = 1'b0;

assign sdram_ras = 1'b1;

assign sdram_cas = 1'b1;

assign sdram_we  = 1'b1;



// SDRAM Data Bus

// SDRAM data bus control

wire [15:0] write_data_bus;

assign sdram_data = (req && rw) ? data_in : 16'bz;



//====================================================
// Data Output
//====================================================

always @(posedge clk)

begin


if(reset)

data_out <= 16'b0;


else

data_out <= data_in;


end



endmodule
