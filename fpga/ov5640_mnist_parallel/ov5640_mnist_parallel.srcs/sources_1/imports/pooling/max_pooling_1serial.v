`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/02 09:53:29
// Design Name: 
// Module Name: max_pooling_1serial
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


module max_pooling_1serial#(
    parameter integer LENGTH_SIZE=8,
    parameter integer NUM=0
    )(
    input clk,
    input rstn,
    input [15:0]                store,  // Activation signal for storing new data
    input [LENGTH_SIZE*48-1:0]  din,  // 一次进来SIZE*SIZE的正方形pool
    output [47:0] dout
    );
    
    wire [47:0] data_s [LENGTH_SIZE-1 : 0];
    reg [47:0] data_reg [LENGTH_SIZE-1 : 0];
    
    generate
        genvar STORE_i;
        for(STORE_i=0; STORE_i<LENGTH_SIZE; STORE_i=STORE_i+1) begin : store_data
            always@(posedge clk) begin
                if(~rstn)
                    data_reg[STORE_i] <= 'b0;
                else if(store == NUM)
                    data_reg[STORE_i] <= din[48*STORE_i +: 48];
            end
        end
    endgenerate
    
    assign data_s[0] = data_reg[0];
    
    generate
        genvar INTER_i;
        for(INTER_i=0; INTER_i<LENGTH_SIZE-1; INTER_i=INTER_i+1) begin : compare   // 0, 1, 2
            max2to1 max(
                .clk(clk),
                .rstn(rstn),
                .A(data_s[INTER_i]),
                .B(data_reg[INTER_i+1]),
                .O(data_s[INTER_i+1]));
        end
    endgenerate
    
    assign dout = data_s[LENGTH_SIZE-1];
    
endmodule
