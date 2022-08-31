# Constraints for CLK
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# Constraints for VS and HS
set_property PACKAGE_PIN R19 [get_ports {vs}]
set_property IOSTANDARD LVCMOS33 [get_ports {vs}]
set_property PACKAGE_PIN P19 [get_ports {hs}]
set_property IOSTANDARD LVCMOS33 [get_ports {hs}]

# Constraints for RED
set_property PACKAGE_PIN G19 [get_ports {r[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[0]}]
set_property PACKAGE_PIN H19 [get_ports {r[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[1]}]
set_property PACKAGE_PIN J19 [get_ports {r[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[2]}]
set_property PACKAGE_PIN N19 [get_ports {r[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {r[3]}]

# Constraints for GRN
set_property PACKAGE_PIN J17 [get_ports {g[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[0]}]
set_property PACKAGE_PIN H17 [get_ports {g[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[1]}]
set_property PACKAGE_PIN G17 [get_ports {g[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[2]}]
set_property PACKAGE_PIN D17 [get_ports {g[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {g[3]}]

# Constraints for BLU
set_property PACKAGE_PIN N18 [get_ports {b[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[0]}]
set_property PACKAGE_PIN L18 [get_ports {b[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[1]}]
set_property PACKAGE_PIN K18 [get_ports {b[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[2]}]
set_property PACKAGE_PIN J18 [get_ports {b[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {b[3]}]

# Constraints for CFGBVS
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

# Constraints for RST
set_property PACKAGE_PIN U18 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

# Constraints for BUTTONS
set_property PACKAGE_PIN T18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]
set_property PACKAGE_PIN T17 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]
set_property PACKAGE_PIN U17 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[2]}]
set_property PACKAGE_PIN W19 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[3]}]

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {sseg_ca[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[0]}]
set_property PACKAGE_PIN W6 [get_ports {sseg_ca[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[1]}]
set_property PACKAGE_PIN U8 [get_ports {sseg_ca[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[2]}]
set_property PACKAGE_PIN V8 [get_ports {sseg_ca[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[3]}]
set_property PACKAGE_PIN U5 [get_ports {sseg_ca[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[4]}]
set_property PACKAGE_PIN V5 [get_ports {sseg_ca[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[5]}]
set_property PACKAGE_PIN U7 [get_ports {sseg_ca[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_ca[6]}]

set_property PACKAGE_PIN U2 [get_ports {sseg_an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_an[0]}]
set_property PACKAGE_PIN U4 [get_ports {sseg_an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_an[1]}]
set_property PACKAGE_PIN V4 [get_ports {sseg_an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_an[2]}]
set_property PACKAGE_PIN W4 [get_ports {sseg_an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg_an[3]}]

# Constraints for PCLK
set_property PACKAGE_PIN J1 [get_ports {pclk}]
set_property IOSTANDARD LVCMOS33 [get_ports {pclk}]
	
##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports RsRx]                        
    #set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#set_property PACKAGE_PIN A18 [get_ports tx]                        
 #   set_property IOSTANDARD LVCMOS33 [get_ports tx]

#USB HID (PS/2)
set_property PACKAGE_PIN C17 [get_ports PS2Clk]						
	set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	set_property PULLUP true [get_ports PS2Clk]
set_property PACKAGE_PIN B17 [get_ports PS2Data]					
	set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
	set_property PULLUP true [get_ports PS2Data]