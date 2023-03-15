`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/18 09:41:46
// Design Name: 
// Module Name: out_select_cell
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


module out_select_cell(
    input   clk,
    input   [31:0]  A,
    input   [31:0]  B,
    output  [31:0]  O,
    //number
    input   [3:0]   upper_number,
    input   [3:0]   current_number,
    output  reg [3:0]   number_o
    );
    
    reg [31:0] O_s;
    
    always@(posedge clk) begin
        case({A[31],B[31]})
            2'b00, 2'b11: begin
                if(A[23:0] < B[23:0]) begin
                    O_s         <= B;
                    number_o    <= current_number;
                end
                else begin
                    O_s         <= A;
                    number_o    <= upper_number;
                end
            end
            2'b01: begin
                O_s         <= A;
                number_o    <= upper_number;
            end
            2'b10: begin
                O_s         <= B;
                number_o    <= current_number;
            end
            default:;
        endcase
    end
    
    assign O = O_s;

endmodule
