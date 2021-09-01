`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/17 15:02:57
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
module top_given(clk,rst_n,RXD,TXD);	 
    //ATTENTION:这里输入的din与输出的dout均为补码
	input clk;
	input rst_n;
	//input [7:0] din;
	//output [15:0]dout;
	input RXD;
	output TXD;
	//input RXD;
	(*keep = "TURE"*)wire [7:0]UART_RX_data;
	(*keep = "TURE"*)reg [7:0]UART_TX_data;
	wire [23:0]Data_out;
    (*keep = "TURE"*)wire interrupt_UART;
	//parameter a1 = 8'd0,a2 = 8'd0,a3 = 8'd0,a4 = 8'd0,a5 = 8'd0,a6 = 8'd56,a7 = 8'd198,a8 = 8'd85;
	(*keep = "TURE"*)reg [7:0]  x_1;
	(*keep = "TURE"*)reg [7:0]  x_2;
	(*keep = "TURE"*)reg [7:0]  x_3;
	(*keep = "TURE"*)reg [7:0]  x_4;
	(*keep = "TURE"*)reg [7:0]  x_5;
	(*keep = "TURE"*)reg [7:0]  x_6;
	(*keep = "TURE"*)reg [7:0]  x_7;
	(*keep = "TURE"*)reg [7:0]  x_8;
	
	wire [7:0] temp [0:7];	 
	//wire [7:0] dout_temp [0:14];
	
	
	always @(posedge interrupt_UART or negedge rst_n)
		begin
		if(!rst_n)
			begin
				x_1 <= 8'd0;
				x_2 <= 8'd0;
				x_3 <= 8'd0;
				x_4 <= 8'd0;
				x_5 <= 8'd0;
				x_6 <= 8'd0;
				x_7 <= 8'd0;
				x_8 <= 8'd0;

			end
		else 
			begin  
				x_1 <= UART_RX_data;
				x_2 <= x_1;
				x_3 <= x_2;
				x_4 <= x_3;
				x_5 <= x_4;
				x_6 <= x_5;
				x_7 <= x_6;
				x_8 <= x_7;//8 periods finish
				
			end	
		end
		
    wire [63:0]x;
    wire [63:0]A_in;
    
    assign x = {x_8 , x_7 , x_6 , x_5 , x_4 , x_3 , x_2 , x_1};
    //assign A_in = {a8 , a7 , a6 , a5 , a4 , a3 , a2 , a1};

    neda u1(
    .x_in(x),
    //.A_in(A_in),
    .y(Data_out)
    );
    

//------------------------------------------------------------------------------
// UART
//------------------------------------------------------------------------------

    wire clk_uart;
    wire bps_en;
    wire bps_en_rx,bps_en_tx;
    
    assign bps_en = bps_en_rx | bps_en_tx;
    
    clkuart_pwm clkuart_pwm(
            .clk(clk),
            .RSTn(rst_n),
            .clk_uart(clk_uart),
            .bps_en(bps_en)
    );
    
    UART_RX UART_RX(
            .clk(clk),
            .clk_uart(clk_uart),
            .RSTn(rst_n),
            .TXD(RXD),
            .data(UART_RX_data),
            .interrupt(interrupt_UART),
            .bps_en(bps_en_rx)
    );
    
//    (*keep = "TURE"*)reg trigger;
//    (*keep = "TURE"*)reg [1:0]flag;
//    (*keep = "TURE"*)reg [3:0]count;
//    (*keep = "TURE"*)reg [3:0]count2;
//    always@(posedge clk or negedge rst_n)
//    begin
//        if(!rst_n)
//        begin
//            count <= 4'd0;
//            count2 <= 4'd0;
//            trigger <= 1'b0;
//            flag<=2'b0;
//        end
//        else
//        begin
//            if(interrupt_UART)
//                flag<=2'b01;
//            else if(count==4'd4)begin
//                flag<=2'b10;
//                count<=4'b0;
//            end
//            else if (flag==2'b01)
//                count<=count+4'b1;
//            else if(flag==2'b10)
//            begin
//                trigger<=1'b1;
//                if(count2==4'd0)begin
//                    UART_TX_data<=Data_out[23:16];
//                    count2 <= 4'd1;
//                end
//                else if(count2==4'd1)begin
//                    UART_TX_data<=Data_out[15:8];
//                    count2 <= 4'd2;
//                end
//                else if(count2==4'd2)begin
//                    UART_TX_data<=Data_out[7:0];
//                    count2 <= 4'd0;
//                    flag <= 2'b00;                
//                end
//            end
//            else  trigger<=1'b0;                 
            
//        end
//    end
    
    //将NEDA24位的滤波输出分时复用为UART_TX的8位输入
    //state machine
    (*keep = "TURE"*)reg [1:0]current_state;
    (*keep = "TURE"*)wire [1:0]next_state;
    (*keep = "TURE"*)reg trigger;
    (*keep = "TURE"*)reg [3:0]count;
    (*keep = "TURE"*)reg [3:0]count2;
    
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
        begin
            current_state <= 2'b00;
        end
        else
            current_state <= next_state;
    end
   
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            count <= 4'd0;
        else
        begin
            if(current_state == 2'b01)
            begin
                if(count == 4'd4)
                    count <= 4'd0;
                else
                    count <= count +1'b1;
            end
            else
                count <= 4'd0;
        end
    end
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            count2 <= 4'd0;
        else
        begin
            if(current_state == 2'b10)
            begin
                case(count2)
                    4'd0:begin
                            //trigger <= 1'b1;
                            //UART_TX_data<=Data_out[23:16];
                            count2 <= 4'd1;
                         end
                    4'd1:begin
                            //UART_TX_data<=Data_out[15:8];
                            count2 <= 4'd2;
                         end
                    4'd2:begin
                            //UART_TX_data<=Data_out[7:0];
                            count2 <= 4'd0;
                            
                         end
                endcase
            end
            else
                count2 <= 4'd0;
        end
    end



    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            UART_TX_data <= 8'h00;
        else
        begin
            if(current_state == 2'b10)
            begin
                case(count2)
                    4'd0:
                            UART_TX_data <= Data_out[23:16];
                    4'd1:
                            UART_TX_data <= Data_out[15:8];
                    4'd2:
                            UART_TX_data <= Data_out[7:0];
                   default:
                            UART_TX_data <= 8'h11;
                endcase
            end
//            else
//                count2 <= 4'd0;
        end
    end
    
        
    
    always@(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            trigger <= 1'b0;
        else
        begin
            if(current_state == 2'b10)
            begin
                case(count2)
                    4'd0:
                            trigger <= 1'b1;
                    default:
                            trigger <= trigger;
                endcase
            end
            else
                trigger <= 1'b0; 
        end
    end
    
    assign next_state = (current_state == 2'b00) ? ((!rst_n) ? 2'b00 : ((interrupt_UART) ? 2'b01 : 2'b00)) : (
                        (current_state == 2'b01) ? ((!rst_n) ? 2'b00 : (count == 4'd4 ? 2'b10 : 2'b01)) : (
                                                   (!rst_n) ? 2'b00 : ((count2 == 4'd2) ? 2'b00 : 2'b10)
                        )   
                        );
    //assign trigger = (current_state == 2'b10) ? 1'b1 : 1'b0;
    
    
    UART_TX UART_TX(
            .clk(clk),
            .clk_uart(clk_uart),
            .RSTn(rst_n),
            .data(UART_TX_data),
            .tx_en(trigger),
            .TXD(TXD),
            //.state(state),
            .bps_en(bps_en_tx)
    );
	endmodule
