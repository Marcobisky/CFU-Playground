## Arty A7-100T Constraints File for VGA Project

## Clock signal (100 MHz)
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; 
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}];

## LEDs
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { led[0] }]; 
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { led[1] }]; 
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { led[2] }]; 
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { led[3] }]; 

## Reset Button
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { rst }]; 

## VGA Connector
set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { vga_red[0] }]; 
set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { vga_red[1] }]; 
set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { vga_red[2] }]; 
set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { vga_red[3] }]; 

set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { vga_green[0] }]; 
set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { vga_green[1] }]; 
set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { vga_green[2] }]; 
set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { vga_green[3] }]; 

set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { vga_blue[0] }]; 
set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { vga_blue[1] }]; 
set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { vga_blue[2] }]; 
set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { vga_blue[3] }]; 

set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { vga_hsync }]; 
set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { vga_vsync }]; 

## Configuration options
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
