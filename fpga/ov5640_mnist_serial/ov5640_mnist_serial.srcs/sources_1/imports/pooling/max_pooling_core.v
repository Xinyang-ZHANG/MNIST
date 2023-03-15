`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/28 11:56:22
// Design Name: 
// Module Name: POOLING
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


module max_pooling_core #(
    parameter integer LENGTH_SIZE=8
    )(
    input   clk,
    input   rstn,
    input   [LENGTH_SIZE*32-1:0]    din,  // 一次进来CHANNEL个SIZE*(SIZE+STRIDE)的长方形RAM阵列，包含pool和无效数据
    //output  reg [31:0]              dout
    output  [31:0]                  dout
    );
    
    //资源不够了qAq不用这个方法了
    /*
    reg  [15:0] cnt;
    wire [31:0] dout_s [LENGTH_SIZE-1:0];
    
    always@(posedge clk) begin  //通过cnt来决定输入比较器的值和输出
        if(~rstn)
            cnt     <= 0;
        else begin
            if(cnt == LENGTH_SIZE-1)
                cnt <= 0;
            else
                cnt <= cnt + 1;
        end
    end
    
    genvar SHIFT;
    
    generate
        for(SHIFT=0; SHIFT<LENGTH_SIZE; SHIFT=SHIFT+1) begin : shifting_pooling
            max_pooling_1serial #(
                .LENGTH_SIZE(LENGTH_SIZE),
                .NUM(SHIFT)
            )
            max_pooling_1serial_inst(
                .clk(clk),
                .rstn(rstn),
                .store(cnt),
                .din(din),
                .dout(dout_s[SHIFT])
            );
        end
        always@(posedge clk) dout   <= dout_s[cnt];  // cnt == SHIFT时，使用那个SHIFT的输出
    endgenerate
    */
    
    wire    [31:0]  d1  [3:0];
    wire    [31:0]  d2  [1:0];
    
    max2to1 maxd1_0(  .clk(clk), .rstn(rstn), .A(din[32*0 +: 32]), .B(din[32*1 +: 32]), .O(d1[0]));
    max2to1 maxd1_1(  .clk(clk), .rstn(rstn), .A(din[32*2 +: 32]), .B(din[32*3 +: 32]), .O(d1[1]));
    max2to1 maxd1_2(  .clk(clk), .rstn(rstn), .A(din[32*4 +: 32]), .B(din[32*5 +: 32]), .O(d1[2]));
    max2to1 maxd1_3(  .clk(clk), .rstn(rstn), .A(din[32*6 +: 32]), .B(din[32*7 +: 32]), .O(d1[3]));
    max2to1 maxd2_0(  .clk(clk), .rstn(rstn), .A(d1[0]), .B(d1[1]), .O(d2[0]));
    max2to1 maxd2_1(  .clk(clk), .rstn(rstn), .A(d1[2]), .B(d1[3]), .O(d2[1]));
    max2to1 maxd3_1(  .clk(clk), .rstn(rstn), .A(d2[0]), .B(d2[1]), .O(dout));
    
endmodule
