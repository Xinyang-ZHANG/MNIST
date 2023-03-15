`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/29 16:50:23
// Design Name: 
// Module Name: CTRL_tb
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


module pooling_ctrl_tb();

    localparam ADDRW=8;
    localparam SIZE=3;
    localparam LENGTH_PIC=13;
    localparam STRIDE=1;

    reg clk;
    reg rst;
    reg en;
    wire [(SIZE+STRIDE)*SIZE*ADDRW-1 : 0] addr;
    wire [SIZE+STRIDE-1 : 0] ram_select;   // ram_select == 1100, read data of upper RAMs
    wire [(SIZE+STRIDE)*SIZE-1 : 0] ram_write;  // ram_write, 
    wire valid;
    
    initial begin
        clk <= 1'b0;
        rst <= 1'b1;
        en <= 1'b0;
        #56;
        rst <= 1'b0;
        #109;
        
        @(posedge clk)
            en <= 1'b1;
    end
    
    always #10 clk = ~clk;
    
    CTRL #(
        .LENGTH_PIC(LENGTH_PIC),
        .ADDRW(ADDRW),
        .SIZE(SIZE),
        .STRIDE(STRIDE)
    )
    DUT(
        .clk(clk),
        .rst(rst),
        .en(en),
        
        .addr(addr),   // 计数器生成addr，与STRIDE有关
        .ram_select(ram_select),  // 计数器生成片选信号，选中的若干RAM连接到POOLING，其他的更新数据
        .ram_write(ram_write),
        .valid(valid)
    );  
    
endmodule
