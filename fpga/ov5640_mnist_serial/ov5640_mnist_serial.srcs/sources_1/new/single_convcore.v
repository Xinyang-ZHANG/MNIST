`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 09:04:14
// Design Name: 
// Module Name: single_convcore
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


module single_convcore#(
    parameter   W = 5,
    parameter   H = 5)
    (
    input                                       cmos_pclk,        //cmos pxiel clock
    //weights and bias
    input [32*(W*H)-1:0]                        weights,
    //mnist data
    input                                       conv_in_data_valid,
    input [32*(W*H)-1:0]                        conv_in_data,
    //output
    output reg                                 conv_out_data_valid,
    output [31:0]                               conv_out_data         
    );
    //8bits fraction precision
    reg     [27:0]  data1_mul   [H-1:0][W-1:0];
    wire    [31:0]  data1_mul_s [H-1:0][W-1:0];
    reg     [31:0]  data2_row   [H-1:0];
    reg     [31:0]  conv_out_data_r; 

    //(*use_dsp = "yes"*)
    genvar  W_CNT, H_CNT;
    generate
        for (H_CNT=0; H_CNT<H; H_CNT=H_CNT+1)
        begin : h
            for (W_CNT=0; W_CNT<W; W_CNT=W_CNT+1)
            begin : w
                always@(posedge cmos_pclk) data1_mul[H_CNT][W_CNT] <= weights[32*(H_CNT*W+W_CNT) +: 28] * conv_in_data[32*(H_CNT*W+W_CNT) +: 28];
                assign  data1_mul_s[H_CNT][W_CNT]   = data1_mul[H_CNT][W_CNT][27]?{12'hfff,data1_mul[H_CNT][W_CNT][27:8]}:{12'h0,data1_mul[H_CNT][W_CNT][27:8]};
            end
            //这里采用5x5的，暂写死成5
            always@(posedge cmos_pclk)  data2_row[H_CNT]    <= data1_mul_s[H_CNT][0]+data1_mul_s[H_CNT][1]+data1_mul_s[H_CNT][2]+data1_mul_s[H_CNT][3]+data1_mul_s[H_CNT][4];
        end
    endgenerate
    
    reg     conv_in_data_valid_r, conv_in_data_valid_r2;
    
    initial begin
        conv_out_data_valid     <= 0;
        conv_out_data_r         <= 0;
    end
    
    always@(posedge cmos_pclk) begin
        //数据运算延迟两个时钟
        conv_in_data_valid_r    <= conv_in_data_valid;
        conv_in_data_valid_r2   <= conv_in_data_valid_r;
        conv_out_data_valid     <= conv_in_data_valid_r2;
        //这里采用5x5的，暂写死成5
        conv_out_data_r         <= data2_row[0]+data2_row[1]+data2_row[2]+data2_row[3]+data2_row[4];
    end
    
    assign  conv_out_data = conv_out_data_r;
    
endmodule
