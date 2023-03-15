`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/18 09:41:16
// Design Name: 
// Module Name: out_select
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


module out_select#(
    parameter integer SIZE_OUT=10
    )(
        input                                       cmos_pclk,        //cmos pxiel clock
        //mnist data
        input   [32*SIZE_OUT-1:0]                   result_data,
        //output
        output  [31:0]                              maxdata,
        output  [3:0]                               number_o 
    );
    
    wire    [31:0]  compare_data    [SIZE_OUT-1:0];
    wire    [3:0]   number          [SIZE_OUT-2:0];
    assign  compare_data[0] = result_data[31:0]; // µÚ0Í¨µÀ
    
    genvar  OUT_CNT;
    generate
        for(OUT_CNT=0; OUT_CNT<SIZE_OUT-1; OUT_CNT=OUT_CNT+1) begin 
            out_select_cell out_select_cellx(
                .clk(cmos_pclk),
                .A(compare_data[OUT_CNT]),
                .B(result_data[32*(OUT_CNT+1+1)-1 -: 32]),
                .O(compare_data[OUT_CNT+1]),
                //number
                .upper_number((OUT_CNT==0)?0:number[OUT_CNT-1]),
                .current_number(OUT_CNT+1),
                .number_o(number[OUT_CNT])
            );
        end
    endgenerate
    
    assign  maxdata     = compare_data[SIZE_OUT-1];
    assign  number_o    = number[SIZE_OUT-2];
    
endmodule
