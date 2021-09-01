`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/24 14:24:38
// Design Name: 
// Module Name: top
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


module neda(
//A_in,
x_in,y
//,clk,rst_n
    );
    //input [63:0]A_in;//A1=A[7:0] A2=A[15:8] 
    input [63:0]x_in;
    output [23:0]y;
    //input clk,rst_n;
    //wire [63:0]A;
    //A的排列是
    //A0 A1  ----  A7
    //A8 A9  ----  A15
    //wire [63:0]A_in;
    
    
    //CSDN系数：num=[ 5    17    43    63    63    43    17     5];
    
    //注意！！！！！！！！！！！！
    //A给的是补码
    //因而此处给定的十进制数不是真正的A的十进制数值
    //parameter a1 = 8'd5,a2 = 8'd17,a3 = 8'd43,a4 = 8'd63,a5 = 8'd63,a6 = 8'd43,a7 = 8'd17,a8 = 8'd5;
    
    wire [127:0]x;
    //扩充x_in
    
    assign x[15:0]    = {(x_in[7] ? 8'hFF : 8'd0) , x_in[7:0]};
    assign x[31:16]   = {(x_in[15] ? 8'hFF : 8'd0) , x_in[15:8]};
    assign x[47:32]   = {(x_in[23] ? 8'hFF : 8'd0) , x_in[23:16]};
    assign x[63:48]   = {(x_in[31] ? 8'hFF : 8'd0) , x_in[31:24]};
    assign x[79:64]   = {(x_in[39] ? 8'hFF : 8'd0) , x_in[39:32]};
    assign x[95:80]   = {(x_in[47] ? 8'hFF : 8'd0) , x_in[47:40]};
    assign x[111:96]  = {(x_in[55] ? 8'hFF : 8'd0) , x_in[55:48]};
    assign x[127:112] = {(x_in[63] ? 8'hFF : 8'd0) , x_in[63:56]};
    

    
    
    
    
    
    wire [127:0]x_temp1;
    wire [15:0]x_sum1;
    
    
    //A1_1 ----- A8_1
    //访问x_temp[7：0]可能有问题
    assign x_temp1[15:0]    =  x[15:0]   ;
    assign x_temp1[31:16]   =  x[31:16]  ;
    assign x_temp1[47:32]   =  x[47:32]  ;
    assign x_temp1[63:48]   =  x[63:48]  ;
    assign x_temp1[79:64]   =  x[79:64]  ;
    assign x_temp1[95:80]   =  x[95:80]  ;
    assign x_temp1[111:96]  =  x[111:96] ;
    assign x_temp1[127:112] =  x[127:112];


   wire [15:0]temp1,temp2,temp3,temp4,temp5,temp6,temp7;
     assign temp1 = x_temp1[15:0]   
                  + x_temp1[31:16]   ; 
     assign temp2 = x_temp1[47:32]  
                  + x_temp1[63:48]   ;
     assign temp3 = x_temp1[79:64]  
                  + x_temp1[95:80]   ;
     assign temp4 = x_temp1[111:96] 
                  + x_temp1[127:112] ; 
              
     assign temp5 = temp1 + temp2;
     assign temp6 = temp3 + temp4;
     
     assign temp7 = temp5 + temp6; 
 
     assign x_sum1 = temp7;                         
    
    

    
    
     wire [127:0]x_temp2;
     wire [15:0]x_sum2;
    //A1_2 ----- A8_2
    assign x_temp2[15:0]    =  16'd0      ;
    assign x_temp2[31:16]   =  16'd0      ;
    assign x_temp2[47:32]   =  x[47:32]   ;
    assign x_temp2[63:48]   =  x[63:48]   ;
    assign x_temp2[79:64]   =  x[79:64]   ;
    assign x_temp2[95:80]   =  x[95:80]   ;
    assign x_temp2[111:96]  =  16'd0      ;
    assign x_temp2[127:112] =  16'd0      ;
     

                     
   wire [15:0]temp8,temp9,temp10,temp11,temp12,temp13,temp14;
                       assign temp8  = x_temp2[15:0]   
                                     + x_temp2[31:16]  ; 
                       assign temp9  = x_temp2[47:32]  
                                     + x_temp2[63:48]  ;
                       assign temp10 = x_temp2[79:64]  
                                     + x_temp2[95:80]  ;
                       assign temp11 = x_temp2[111:96] 
                                     + x_temp2[127:112];
                                
                       assign temp12 = temp8 + temp9;
                       assign temp13 = temp10 + temp11;
                       
                       assign temp14 = temp12 + temp13; 
                   
                       assign x_sum2 = temp14;
    

    wire [127:0]x_temp3;
    wire [15:0]x_sum3;
    //A1_3 ----- A8_3
    assign x_temp3[15:0]    = x[15:0]   ;
    assign x_temp3[31:16]   = 16'd0     ;
    assign x_temp3[47:32]   = 16'd0     ;
    assign x_temp3[63:48]   = x[63:48]  ;
    assign x_temp3[79:64]   = x[79:64]  ;
    assign x_temp3[95:80]   = 16'd0     ;
    assign x_temp3[111:96]  = 16'd0     ;
    assign x_temp3[127:112] = x[127:112]; 
    

   wire [15:0]temp15,temp16,temp17,temp18,temp19,temp20,temp21;
                       assign temp15 = x_temp3[15:0]   
                                     + x_temp3[31:16]  ;  
                       assign temp16 = x_temp3[47:32]  
                                     + x_temp3[63:48]  ;
                       assign temp17 = x_temp3[79:64]  
                                     + x_temp3[95:80]  ;
                       assign temp18 = x_temp3[111:96] 
                                     + x_temp3[127:112];
                                
                       assign temp19 = temp15 + temp16;
                       assign temp20 = temp17 + temp18;
                       
                       assign temp21 = temp19 + temp20; 
                   
                       assign x_sum3 = temp21;

                     
                     
    wire [127:0]x_temp4;
    wire [15:0]x_sum4;
    //A1_4 ----- A8_4
    assign x_temp4[15:0]    = 16'd0   ;
    assign x_temp4[31:16]   = 16'd0   ;
    assign x_temp4[47:32]   = x[47:32];
    assign x_temp4[63:48]   = x[63:48];
    assign x_temp4[79:64]   = x[79:64];
    assign x_temp4[95:80]   = x[95:80];
    assign x_temp4[111:96]  = 16'd0   ;
    assign x_temp4[127:112] = 16'd0   ;
 
   
                     
     wire [15:0]temp22,temp23,temp24,temp25,temp26,temp27,temp28;
                    assign temp22 = x_temp4[15:0]   
                                  + x_temp4[31:16]  ; 
                    assign temp23 = x_temp4[47:32]  
                                  + x_temp4[63:48]  ;
                    assign temp24 = x_temp4[79:64]  
                                  + x_temp4[95:80]  ;
                    assign temp25 = x_temp4[111:96] 
                                  + x_temp4[127:112];
                             
                    assign temp26 = temp22 + temp23;
                    assign temp27 = temp24 + temp25;
                    
                    assign temp28 = temp26 + temp27; 
                
                    assign x_sum4 = temp28;
                     
                     
    wire [127:0]x_temp5;
    wire [15:0]x_sum5;
    //A1_5 ----- A8_5
    assign x_temp5[15:0]    = 16'd0   ;
    assign x_temp5[31:16]   = x[31:16];
    assign x_temp5[47:32]   = 16'd0   ;
    assign x_temp5[63:48]   = x[63:48];
    assign x_temp5[79:64]   = x[79:64];
    assign x_temp5[95:80]   = 16'd0   ;
    assign x_temp5[111:96]  = x[111:96];
    assign x_temp5[127:112] = 16'd0   ;

 

     wire [15:0]temp29,temp30,temp31,temp32,temp33,temp34,temp35;
                    assign temp29 = x_temp5[15:0]   
                                  + x_temp5[31:16]  ; 
                    assign temp30 = x_temp5[47:32]  
                                  + x_temp5[63:48]  ;
                    assign temp31 = x_temp5[79:64]  
                                  + x_temp5[95:80]  ;
                    assign temp32 = x_temp5[111:96] 
                                  + x_temp5[127:112];
                             
                    assign temp33 = temp29 + temp30;
                    assign temp34 = temp31 + temp32;
                    
                    assign temp35 = temp33 + temp34; 
                
                    assign x_sum5 = temp35;

    wire [127:0]x_temp6;
    wire [15:0]x_sum6;
    //A1_6 ----- A8_6
    assign x_temp6[15:0]    = 16'd0     ;
    assign x_temp6[31:16]   = 16'd0     ;
    assign x_temp6[47:32]   = x[47:32]  ;
    assign x_temp6[63:48]   = x[63:48]  ;
    assign x_temp6[79:64]   = x[79:64]  ;
    assign x_temp6[95:80]   = x[95:80]  ;
    assign x_temp6[111:96]  = 16'd0     ;
    assign x_temp6[127:112] = 16'd0     ;
    


     wire [15:0]temp36,temp37,temp38,temp39,temp40,temp41,temp42;
                    assign temp36 = x_temp6[15:0]   
                                  + x_temp6[31:16]  ; 
                    assign temp37 = x_temp6[47:32]  
                                  + x_temp6[63:48]  ;
                    assign temp38 = x_temp6[79:64]  
                                  + x_temp6[95:80]  ;
                    assign temp39 = x_temp6[111:96] 
                                  + x_temp6[127:112];
                             
                    assign temp40 = temp36 + temp37;
                    assign temp41 = temp38 + temp39;
                    
                    assign temp42 = temp40 + temp41; 
                
                    assign x_sum6 = temp42;
                    
                                         
                         
     wire [127:0]x_temp7;
    wire [15:0]x_sum7;
    //A1_7 ----- A8_7
    assign x_temp7[15:0]    = 16'd0;
    assign x_temp7[31:16]   = 16'd0;
    assign x_temp7[47:32]   = 16'd0;
    assign x_temp7[63:48]   = 16'd0;
    assign x_temp7[79:64]   = 16'd0;
    assign x_temp7[95:80]   = 16'd0;
    assign x_temp7[111:96]  = 16'd0;
    assign x_temp7[127:112] = 16'd0;



     wire [15:0]temp43,temp44,temp45,temp46,temp47,temp48,temp49;
                    assign temp43 = x_temp7[15:0]   
                                  + x_temp7[31:16]  ; 
                    assign temp44 = x_temp7[47:32]  
                                  + x_temp7[63:48]  ;
                    assign temp45 = x_temp7[79:64]  
                                  + x_temp7[95:80]  ;
                    assign temp46 = x_temp7[111:96] 
                                  + x_temp7[127:112];
                             
                    assign temp47 = temp43 + temp44;
                    assign temp48 = temp45 + temp46;
                    
                    assign temp49 = temp47 + temp48; 
                
                    assign x_sum7 = temp49;
                    
                    
                    

        wire [127:0]x_temp8;
        wire [15:0]x_sum8;
    //A1_8 ----- A8_8
    assign x_temp8[15:0]    = 16'd0;
    assign x_temp8[31:16]   = 16'd0;
    assign x_temp8[47:32]   = 16'd0;
    assign x_temp8[63:48]   = 16'd0;
    assign x_temp8[79:64]   = 16'd0;
    assign x_temp8[95:80]   = 16'd0;
    assign x_temp8[111:96]  = 16'd0;
    assign x_temp8[127:112] = 16'd0;   
  
    
      wire [15:0]temp50,temp51,temp52,temp53,temp54,temp55,temp56;
                    assign temp50 = x_temp8[15:0]   
                                  + x_temp8[31:16]  ; 
                    assign temp51 = x_temp8[47:32]  
                                  + x_temp8[63:48]  ;
                    assign temp52 = x_temp8[79:64]  
                                  + x_temp8[95:80]  ;
                    assign temp53 = x_temp8[111:96] 
                                  + x_temp8[127:112];
                             
                    assign temp54 = temp50 + temp51;
                    assign temp55 = temp52 + temp53;
                    
                    assign temp56 = temp54 + temp55; 
                    
                    assign x_sum8 = temp56;   
    
    
    wire [22:0]x_sum_8;
    wire [21:0]x_sum_7;
    wire [20:0]x_sum_6;
    wire [19:0]x_sum_5;
    wire [18:0]x_sum_4;
    wire [17:0]x_sum_3;
    wire [16:0]x_sum_2;
    wire [15:0]x_sum_1;


    wire [15:0]x__sum_8;
    
    wire [23:0]x_sum__1,x_sum__2,x_sum__3,x_sum__4,x_sum__5,x_sum__6,x_sum__7,x_sum__8;
    
    
    assign x__sum_8 = (~x_sum8) + 1'b1;
    assign x_sum_8 = (x__sum_8 << 7);
    
    
    assign x_sum_7 = (x_sum7 << 6);
    assign x_sum_6 = (x_sum6 << 5);
    assign x_sum_5 = (x_sum5 << 4);
    assign x_sum_4 = (x_sum4 << 3);
    assign x_sum_3 = (x_sum3 << 2);
    assign x_sum_2 = (x_sum2 << 1);
    assign x_sum_1 = (x_sum1 << 0);
    
    assign x_sum__8 = {(x_sum_8[22] ? 1'h1 : 1'd0) , x_sum_8};
    assign x_sum__7 = {(x_sum_7[21] ? 2'h3 : 2'd0) , x_sum_7};
    assign x_sum__6 = {(x_sum_6[20] ? 3'h7 : 3'd0) , x_sum_6};
    assign x_sum__5 = {(x_sum_5[19] ? 4'hF : 4'd0) , x_sum_5};
    assign x_sum__4 = {(x_sum_4[18] ? 5'h1F : 5'd0) , x_sum_4};
    assign x_sum__3 = {(x_sum_3[17] ? 6'h3F : 6'd0) , x_sum_3};
    assign x_sum__2 = {(x_sum_2[16] ? 7'h7F : 7'd0) , x_sum_2};
    assign x_sum__1 = {(x_sum_1[15] ? 8'hFF : 8'd0) , x_sum_1};

//    wire [31:0]sum_temp1,sum_temp2,sum_temp3,sum_temp4,sum_temp5,sum_temp6,sum_temp7,sum_temp8;
    
    
//    assign sum_temp8 = {(x_sum_8[14] ? 17'b1 : 17'b0) , 15'b0};
//    assign sum_temp7 = {(x_sum_7[13] ? 18'b1 : 18'b0) , 14'b0};
//    assign sum_temp6 = {(x_sum_6[12] ? 19'b1 : 19'b0) , 13'b0};
//    assign sum_temp5 = {(x_sum_5[11] ? 20'b1 : 20'b0) , 12'b0};
//    assign sum_temp4 = {(x_sum_4[10] ? 21'b1 : 21'b0) , 11'b0};
//    assign sum_temp3 = {(x_sum_3[9] ? 22'b1 : 22'b0) , 10'b0} ;
//    assign sum_temp2 = {(x_sum_2[8] ? 23'b1 : 23'b0) , 9'b0};
//    assign sum_temp1 = {(x_sum_1[7] ? 24'b1 : 24'b0) , 8'b0};
    
//    assign x_sum__8 = {(x_sum_8[22] ? 9'h1FF : 9'd0) , 15'b0} | x_sum_8;
//    assign x_sum__7 = {(x_sum_7[21] ? 10'h3FF : 10'd0) , 14'b0} | x_sum_7;
//    assign x_sum__6 = {(x_sum_6[20] ? 11'h7FF : 11'd0) , 13'b0} | x_sum_6;
//    assign x_sum__5 = {(x_sum_5[19] ? 12'hFFF : 12'd0) , 12'b0} | x_sum_5;
//    assign x_sum__4 = {(x_sum_4[18] ? 13'h1FFF : 13'd0) , 11'b0} | x_sum_4;
//    assign x_sum__3 = {(x_sum_3[17] ? 14'h3FFF : 14'd0) , 10'b0} | x_sum_3;
//    assign x_sum__2 = {(x_sum_2[16] ? 15'h7FFF : 15'd0) , 9'b0} | x_sum_2;
//    assign x_sum__1 = {(x_sum_1[15] ? 16'hFFFF : 16'd0) , 8'b0} | x_sum_1;
    
    
    wire [23:0]temp_temp_1,temp_temp_2,temp_temp_3,temp_temp_4,temp_temp_5,temp_temp_6;
    
    //wire [31:0]y_temp;
    assign temp_temp_1 = x_sum__8 + x_sum__7;
    assign temp_temp_2 = x_sum__6 + x_sum__5;
    assign temp_temp_3 = x_sum__4 + x_sum__3;
    assign temp_temp_4 = x_sum__2 + x_sum__1;
    
    assign temp_temp_5 = temp_temp_1 + temp_temp_2;
    assign temp_temp_6 = temp_temp_3 + temp_temp_4;
    
    assign y = temp_temp_5 + temp_temp_6;
    
endmodule
