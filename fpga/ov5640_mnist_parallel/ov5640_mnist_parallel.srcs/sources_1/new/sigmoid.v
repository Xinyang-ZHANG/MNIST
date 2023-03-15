`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/15 23:14:50
// Design Name: 
// Module Name: sigmoid
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


module sigmoid(
        input                                       cmos_pclk,        //cmos pxiel clock
        //mnist data
        input                                       sigmoid_in_data_valid,
        input   [47:0]                              sigmoid_in_data,
        //output
        output  reg                                sigmoid_out_data_valid,
        output  [47:0]                              sigmoid_out_data       
    );
    
    wire    [47:0]  addr_temp = sigmoid_in_data * 48'd26843546;  // data*409.6+4096
    reg     [47:0]  addr;
    
    reg     [47:0]  sigmoid_in_data_r;
    reg             sigmoid_in_data_valid_r;
    
    always@(posedge cmos_pclk) begin
        addr    <= (addr_temp[47]?{16'hffff,addr_temp[47:16]}:{16'h0,addr_temp[47:16]}) + 48'd268435456;
        sigmoid_in_data_valid_r     <= sigmoid_in_data_valid;
        sigmoid_out_data_valid      <= sigmoid_in_data_valid_r;
    end

    //store 8192 sigmoid points from -10 to 10, equals -4096/409.6 to 4096/409.6
    sigmoid_blkmem  sigmoid_rom(
        .clka(cmos_pclk),
        .addra(addr[31:16]),
        .douta(sigmoid_out_data)
    );
    
endmodule
