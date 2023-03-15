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
    input [47:0] A,
    input [47:0] B,
    output [47:0] O
    );
    
    reg [47:0] O_s;
    
    always@(posedge clk) begin
        if(~rstn)
            O_s <= 'b0;
        else begin
            case({A[47],B[47]})
                2'b00, 2'b11: begin
                    if(A < B)
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
