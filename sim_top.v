`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/17 15:06:52
// Design Name: 
// Module Name: sim
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


module sim_top(

    );
    reg clk,rst_n;
    reg [7:0]din;
    wire [15:0]dout;
    
    initial
    begin
        clk <= 1'b1;
        rst_n <= 1'b0;
        #100
        rst_n <= 1'b1;

    end
    
    always
    begin
        #25
        clk <= !clk;
    end
    
    
    always
    begin
        #60
        din <= 8'd10;
        #50
        din <= 8'd2;
        #50
        din <= 8'd8;
        #50
        din <= 8'd2;
        #50
        din <= 8'd52;
        #50
        din <= 8'd21;
        #50
        din <= 8'd25;
        #50
        din <= 8'd1;      
    end
    
    
    top_given u1(
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .dout(dout)
    );
endmodule
