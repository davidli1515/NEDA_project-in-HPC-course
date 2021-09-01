`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/24 15:29:29
// Design Name: 
// Module Name: sim_neda
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


module sim__neda(

    );
   //reg [63:0]A_in; 
    reg [63:0]x_in;
    wire [23:0]y;
    
    initial
    begin

//          A_in[7:0] = 8'd0;
//          A_in[15:8] = 8'd0;
//          A_in[23:16] = 8'd0;
//          A_in[31:24] = 8'd0;
//          A_in[39:32] = 8'd0;
//          A_in[47:40] = 8'd56;
//          A_in[55:48] = 8'd198;
//          A_in[63:56] = 8'd85;

        
    end
    
    always
    begin
        #10000
        x_in[7:0] = 8'd49;
        x_in[15:8] = 8'd49;
        x_in[23:16] = 8'd49;
        x_in[31:24] = 8'd49;
        x_in[39:32] = 8'd49;
        x_in[47:40] = 8'd49;
        x_in[55:48] = 8'd49;
        x_in[63:56] = 8'd49;        
    end
    
    neda u1(
    .x_in(x_in),
    //.A_in(A_in),
    .y(y)
    );
    
endmodule
