## Generated SDC file "D:/Documentos/Documents/FPGA/8bits/msx1fpga/src/syn-mist/timing.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Tue Sep 19 15:11:38 2017"

##
## DEVICE  "EP3C25E144C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_27} -period 37.037 -waveform { 0.000 0.500 } [get_ports {clk27_i[0]}]
create_clock -name {clock_3m_s} -period 279.365 -waveform { 0.000 139.683 } [get_nets {clks|clock_3m_s}]
create_clock -name {clock_vdp_s} -period 93.121 -waveform { 0.000 46.560 } [get_nets {clks|clock_vdp_s}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {pll_1|altpll_component|auto_generated|pll1|clk[0]} -source [get_pins {pll_1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 35 -divide_by 44 -master_clock {clk_27} [get_pins {pll_1|altpll_component|auto_generated|pll1|clk[0]}] 
create_generated_clock -name {pll_1|altpll_component|auto_generated|pll1|clk[1]} -source [get_pins {pll_1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 35 -divide_by 11 -master_clock {clk_27} [get_pins {pll_1|altpll_component|auto_generated|pll1|clk[1]}] 
create_generated_clock -name {pll_1|altpll_component|auto_generated|pll1|clk[2]} -source [get_pins {pll_1|altpll_component|auto_generated|pll1|inclk[0]}] -duty_cycle 50.000 -multiply_by 35 -divide_by 11 -phase -45.000 -master_clock {clk_27} [get_pins {pll_1|altpll_component|auto_generated|pll1|clk[2]}] 
create_generated_clock -name {sd1clk_pin} -source [get_pins {pll_1|altpll_component|auto_generated|pll1|clk[2]}] -master_clock {pll_1|altpll_component|auto_generated|pll1|clk[2]} [get_ports {sdram_clk_o}] 
create_generated_clock -name {sysclk} -source [get_pins {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -master_clock {pll_1|altpll_component|auto_generated|pll1|clk[1]} 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_vdp_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {sd1clk_pin}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {sd1clk_pin}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {sd1clk_pin}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {sd1clk_pin}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[2]}] -rise_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[2]}] -fall_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {sd1clk_pin}]  0.110  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -rise_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -fall_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_vdp_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_vdp_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_vdp_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_vdp_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_vdp_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_vdp_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_vdp_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_vdp_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -rise_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_3m_s}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -fall_to [get_clocks {clock_3m_s}] -hold 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {clock_3m_s}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {clock_3m_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {clock_vdp_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[0]}] -hold 0.100  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -rise_to [get_clocks {clock_3m_s}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clock_3m_s}] -fall_to [get_clocks {clock_3m_s}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[0]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[0]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[1]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[1]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[2]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[2]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[3]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[3]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[4]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[4]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[5]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[5]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[6]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[6]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[7]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[7]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[8]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[8]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[9]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[9]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[10]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[10]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[11]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[11]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[12]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[12]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[13]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[13]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[14]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[14]}]
set_input_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  5.800 [get_ports {sdram_data_io[15]}]
set_input_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  3.200 [get_ports {sdram_data_io[15]}]
set_input_delay -add_delay  -clock [get_clocks {sysclk}]  0.000 [get_ports {uart_rx_i}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[0]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[0]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[1]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[1]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[2]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[2]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[3]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[3]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[4]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[4]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[5]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[5]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[6]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[6]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[7]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[7]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[8]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[8]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[9]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[9]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[10]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[10]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[11]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[11]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_addr_o[12]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_addr_o[12]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_ba_o[0]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_ba_o[0]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_ba_o[1]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_ba_o[1]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_cas_n_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_cas_n_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_cke_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_cke_o}]
set_output_delay -add_delay  -clock [get_clocks {sd1clk_pin}]  0.500 [get_ports {sdram_clk_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_cs_n_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_cs_n_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[0]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[0]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[1]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[1]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[2]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[2]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[3]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[3]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[4]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[4]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[5]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[5]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[6]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[6]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[7]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[7]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[8]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[8]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[9]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[9]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[10]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[10]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[11]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[11]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[12]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[12]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[13]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[13]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[14]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[14]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_data_io[15]}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_data_io[15]}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_ldqm_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_ldqm_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_ras_n_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_ras_n_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_udqm_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_udqm_o}]
set_output_delay -add_delay -max -clock [get_clocks {sd1clk_pin}]  1.500 [get_ports {sdram_we_n_o}]
set_output_delay -add_delay -min -clock [get_clocks {sd1clk_pin}]  -0.800 [get_ports {sdram_we_n_o}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -from  [get_clocks {sd1clk_pin}]  -to  [get_clocks {pll_1|altpll_component|auto_generated|pll1|clk[1]}] 2


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

