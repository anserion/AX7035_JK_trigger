set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
set_property CONFIG_MODE SPIx4 [current_design] 
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design] 

set_property IOSTANDARD LVCMOS33 [get_ports {KEY*}]
set_property PACKAGE_PIN M13 [get_ports {KEY1}]
set_property PACKAGE_PIN K14 [get_ports {KEY2}]
set_property PACKAGE_PIN K13 [get_ports {KEY3}]
set_property PACKAGE_PIN L13 [get_ports {KEY4}]

set_property PACKAGE_PIN F20 [get_ports {RESET}]
set_property IOSTANDARD LVCMOS33 [get_ports {RESET}]

set_property IOSTANDARD LVCMOS33 [get_ports {LED*}]
set_property PACKAGE_PIN F19 [get_ports {LED1}]
set_property PACKAGE_PIN E21 [get_ports {LED2}]

set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets LED1_OBUF]