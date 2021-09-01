#set_property PACKAGE_PIN E12 [get_ports {din[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[0]}]
#set_property PACKAGE_PIN D13 [get_ports {din[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[1]}]
#set_property PACKAGE_PIN D11 [get_ports {din[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[2]}]
#set_property PACKAGE_PIN E11 [get_ports {din[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[3]}]
#set_property PACKAGE_PIN B14 [get_ports {din[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[4]}]
#set_property PACKAGE_PIN C12 [get_ports {din[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[5]}]
#set_property PACKAGE_PIN B12 [get_ports {din[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[6]}]
#set_property PACKAGE_PIN A10 [get_ports {din[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {din[7]}]


#set_property PACKAGE_PIN D10 [get_ports {dout[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[0]}]
#set_property PACKAGE_PIN D9 [get_ports {dout[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[1]}]
#set_property PACKAGE_PIN C7 [get_ports {dout[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[2]}]
#set_property PACKAGE_PIN C6 [get_ports {dout[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[3]}]
#set_property PACKAGE_PIN D5 [get_ports {dout[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[4]}]
#set_property PACKAGE_PIN C4 [get_ports {dout[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[5]}]
#set_property PACKAGE_PIN B7 [get_ports {dout[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[6]}]
#set_property PACKAGE_PIN A5 [get_ports {dout[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[7]}]

#set_property PACKAGE_PIN C9 [get_ports {dout[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[8]}]
#set_property PACKAGE_PIN D8 [get_ports {dout[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[9]}]
#set_property PACKAGE_PIN E6 [get_ports {dout[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[10]}]
#set_property PACKAGE_PIN D6 [get_ports {dout[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[11]}]
#set_property PACKAGE_PIN E5 [get_ports {dout[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[12]}]
#set_property PACKAGE_PIN A7 [get_ports {dout[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[13]}]
#set_property PACKAGE_PIN B6 [get_ports {dout[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[14]}]
#set_property PACKAGE_PIN B5 [get_ports {dout[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {dout[15]}]


##clk
set_property PACKAGE_PIN D4 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

##rst_n
set_property PACKAGE_PIN T9 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]
##RXD
set_property PACKAGE_PIN F13 [get_ports RXD]
set_property IOSTANDARD LVCMOS33 [get_ports RXD]
##TXD
set_property PACKAGE_PIN F12 [get_ports TXD]
set_property IOSTANDARD LVCMOS33 [get_ports TXD]




connect_debug_port u_ila_0/probe14 [get_nets [list flag]]

connect_debug_port u_ila_0/probe12 [get_nets [list {flag[0]} {flag[1]}]]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 4 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {count2[0]} {count2[1]} {count2[2]} {count2[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {x_6[0]} {x_6[1]} {x_6[2]} {x_6[3]} {x_6[4]} {x_6[5]} {x_6[6]} {x_6[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {x_5[0]} {x_5[1]} {x_5[2]} {x_5[3]} {x_5[4]} {x_5[5]} {x_5[6]} {x_5[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {x_4[0]} {x_4[1]} {x_4[2]} {x_4[3]} {x_4[4]} {x_4[5]} {x_4[6]} {x_4[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {x_7[0]} {x_7[1]} {x_7[2]} {x_7[3]} {x_7[4]} {x_7[5]} {x_7[6]} {x_7[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {next_state[0]} {next_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {x_1[0]} {x_1[1]} {x_1[2]} {x_1[3]} {x_1[4]} {x_1[5]} {x_1[6]} {x_1[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {UART_TX_data[0]} {UART_TX_data[1]} {UART_TX_data[2]} {UART_TX_data[3]} {UART_TX_data[4]} {UART_TX_data[5]} {UART_TX_data[6]} {UART_TX_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {x_2[0]} {x_2[1]} {x_2[2]} {x_2[3]} {x_2[4]} {x_2[5]} {x_2[6]} {x_2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 2 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {current_state[0]} {current_state[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {x_8[0]} {x_8[1]} {x_8[2]} {x_8[3]} {x_8[4]} {x_8[5]} {x_8[6]} {x_8[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {x_3[0]} {x_3[1]} {x_3[2]} {x_3[3]} {x_3[4]} {x_3[5]} {x_3[6]} {x_3[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {UART_RX_data[0]} {UART_RX_data[1]} {UART_RX_data[2]} {UART_RX_data[3]} {UART_RX_data[4]} {UART_RX_data[5]} {UART_RX_data[6]} {UART_RX_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 4 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {count[0]} {count[1]} {count[2]} {count[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list interrupt_UART]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list RXD_IBUF]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list trigger]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list TXD_OBUF]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
