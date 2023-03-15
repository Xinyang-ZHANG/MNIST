`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/26 15:23:45
// Design Name: 
// Module Name: max2to1
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


module max2to1(
    input clk,
    input rstn,
    input [31:0] A,
    input [31:0] B,
    output [31:0] O
    );
    
    reg [31:0] O_s;
    
    always@(posedge clk) begin
        if(~rstn)
            O_s <= 'b0;
        else begin
            case({A[31],B[31]})
                2'b00, 2'b11: begin
                    if(A[23:0] < B[23:0])
                        O_s <= B;
                    else
                        O_s <= A;
                    end
                2'b01: O_s <= A;
                2'b10: O_s <= B;
                default:;
            endcase
        end
    end
    
    assign O = O_s;
    
endmodule
