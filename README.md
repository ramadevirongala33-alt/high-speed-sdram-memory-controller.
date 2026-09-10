# High-Speed SDRAM Memory Controller

## Project Overview

This project implements a High-Speed SDRAM Memory Controller using Verilog HDL.

The controller provides memory access control through an FSM-based architecture and includes SDRAM initialization, read/write operations, address mapping, bank selection and refresh control.

## Tools and Technologies

- HDL: Verilog HDL
- Design Tool: Xilinx Vivado 2018.2
- Target Device: xc7k70tfbv676-1
- Clock Frequency: 100 MHz
- Clock Period: 10 ns

## Project Features

- FSM-based SDRAM control
- SDRAM initialization
- Read and write operations
- Address mapping
- Bank selection
- Refresh control
- SDRAM memory model for simulation
- Scoreboard-based verification
- RTL simulation
- Synthesis and implementation analysis
- Timing and power analysis

## Verification

The design was verified using a Verilog testbench and SDRAM memory model.

Verification included reset, initialization, read, write, address mapping, bank selection and refresh-related scenarios.

## Implementation Results

- WNS: 8.865 ns
- TNS: 0 ns
- WHS: 0.109 ns
- Failing Endpoints: 0
- Slice LUTs: 4
- Slice Registers: 19
- Bonded IOB: 86
- BUFGCTRL: 1
- Estimated Total On-Chip Power: 0.091 W

## Hardware Status

RTL simulation, synthesis, timing analysis, power estimation and implementation were completed.

Bitstream generation and physical FPGA testing were not completed because board-specific I/O pin constraints were not available.

## Project Structure

The repository contains the Verilog RTL source files, testbench, SDRAM memory model, scoreboard and XDC constraint file.

## Author
Rongala Ramadevi
