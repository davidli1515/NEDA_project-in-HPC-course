`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/31 10:33:03
// Design Name: 
// Module Name: sim_uartpwm
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


module sim_uartpwm(

    );
    wire bps_en;
    reg clk,RSTn;
    wire clk_uart;
    reg TXD;
    wire [7:0] data;
    wire interrupt;
  
    initial
    begin
        RSTn <= 1'b0;
        clk <= 1'b0;
        TXD <= 1'b1;
        #5000
        RSTn <= 1'b1;
        #10000
        TXD <= 1'b0;
    end
    
    always
    begin
        #25
        clk <= !clk;
    end
    
    clkuart_pwm u1(
    .RSTn(RSTn),
    .clk(clk),
    .bps_en(bps_en),
    .clk_uart(clk_uart)

    
    );
    
   UART_RX u2(
   .RSTn(RSTn),
   .clk(clk),
   .clk_uart(clk_uart),
   .TXD(TXD),
   .data(data),
   .interrupt(interrupt),
   .bps_en(bps_en)
   );
    
endmodule
