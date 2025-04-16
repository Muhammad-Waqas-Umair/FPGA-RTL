# Clock Signal
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports {clk}]           ;# 100MHz clock
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk}]

# Buttons
set_property -dict { PACKAGE_PIN N17  IOSTANDARD LVCMOS33 } [get_ports {reset}]         ;# Center button
set_property -dict { PACKAGE_PIN M18  IOSTANDARD LVCMOS33 } [get_ports {transmit_en}]   ;# Up button

# Data Input Switches [3:0]
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports {data_in[0]}]  ;# SW0
set_property -dict { PACKAGE_PIN L16  IOSTANDARD LVCMOS33 } [get_ports {data_in[1]}]  ;# SW1
set_property -dict { PACKAGE_PIN M13  IOSTANDARD LVCMOS33 } [get_ports {data_in[2]}]  ;# SW2
set_property -dict { PACKAGE_PIN R15  IOSTANDARD LVCMOS33 } [get_ports {data_in[3]}]  ;# SW3

# Status LEDs [3:0]
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports {status_leds[0]}] ;# LED0
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports {status_leds[1]}] ;# LED1
set_property -dict { PACKAGE_PIN J13  IOSTANDARD LVCMOS33 } [get_ports {status_leds[2]}] ;# LED2
set_property -dict { PACKAGE_PIN N14  IOSTANDARD LVCMOS33 } [get_ports {status_leds[3]}] ;# LED3

# UART Interface
set_property -dict { PACKAGE_PIN C17  IOSTANDARD LVCMOS33 } [get_ports {tx_out}]        ;# UART TX
