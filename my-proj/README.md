# F4PGA/SymbiFlow Build Environment Test

This project demonstrates a working F4PGA (formerly SymbiFlow) build environment for the Arty A7-100T FPGA board.

## Project Contents

- `vga.v` - Simple VGA controller generating a test pattern
- `vga.pcf` - Pin constraint file mapping signals to FPGA pins
- `vga.xdc` - Timing constraint file
- `Makefile` - Build system using F4PGA tools

## Features

- **VGA Output**: Generates 640x480 VGA signal with test pattern
- **LED Counter**: 4-bit counter displayed on board LEDs
- **Clock Management**: Uses 100MHz input clock

## Build Commands

```bash
# Build the bitstream
make

# Clean generated files
make clean

# Program the FPGA (requires OpenOCD and hardware)
make prog
```

## Environment Setup

The build environment uses the existing `cfu-symbiflow` conda environment with F4PGA tools.

## Generated Files

- `vga.bit` - Final bitstream file for programming
- `vga.eblif` - Extended BLIF netlist
- `vga.net` - Packed netlist
- `vga.place` - Placement result
- `vga.route` - Routing result
- `vga.fasm` - FPGA Assembly format

## Hardware Requirements

- Arty A7-100T FPGA Development Board
- VGA monitor and cable
- OpenOCD-compatible programmer

## Pin Assignments

### VGA Signals
- **Red**: A3, B4, C5, A4 (4-bit)
- **Green**: C6, A5, B6, A6 (4-bit) 
- **Blue**: B7, C7, D7, D8 (4-bit)
- **HSync**: B11
- **VSync**: B12

### Other Signals
- **Clock**: E3 (100MHz)
- **LEDs**: H5, J5, T9, T10

## Build Status

✅ **Synthesis**: Successfully generates EBLIF netlist  
✅ **Packing**: Successfully packs logic blocks  
✅ **Placement**: Successfully places components  
✅ **Routing**: Successfully routes connections  
✅ **Bitstream**: Successfully generates programming file

The complete F4PGA toolchain is working correctly!
