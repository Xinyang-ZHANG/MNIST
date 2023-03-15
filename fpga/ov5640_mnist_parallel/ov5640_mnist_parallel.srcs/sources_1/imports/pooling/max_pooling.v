`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/28 11:41:48
// Design Name: 
// Module Name: TOP_POOLING
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


module max_pooling#(
    parameter integer SIZE=2,
    parameter integer CHANNEL=5,
    parameter integer STRIDE=2,
    parameter integer LENGTH_PIC=28,
    parameter integer WIDTH_PIC=28
    )(
    input   clk,
    input   rstn,
    input   din_valid,
    input   [CHANNEL*48-1 : 0] din,
    output  [CHANNEL*48-1 : 0] dout, 
    output  dout_valid
    );
    
    wire    [47:0]                              data_ram [CHANNEL-1:0][SIZE+STRIDE-1:0][SIZE-1:0];  // from RAM to POOLING
    wire    [(SIZE+STRIDE)*SIZE*16-1:0]         addr;                                               // from CTRL to RAM, 200位的RAM
    reg     [(SIZE+STRIDE)*SIZE*CHANNEL*48-1:0] data_pooling;                                       // from RAM to POOLING
    wire    [SIZE+STRIDE-1:0]                   ram_select;                                         // 片选，举例：SIZE=01110，则片选信号选中中间三个RAM
    wire    [(SIZE+STRIDE)*SIZE-1:0]            ram_write;
    wire    din_core_valid;
    
    // 赋值data_ram给data_pooling并同时片选
    generate
        genvar ROW, COL, CHA;
        for(CHA=0; CHA<CHANNEL; CHA=CHA+1) begin : CHANNEL_GEN
            for(ROW=0; ROW<STRIDE+SIZE; ROW=ROW+1) begin : ROW_GEN
                for(COL=0; COL<SIZE; COL=COL+1) begin : COL_GEN
                    always@(posedge clk) begin : SELECT
                        if(ram_select[ROW] == 1'b0)  // 未选中，赋最小值
                            data_pooling[(48*(SIZE*ROW+COL) + 48*SIZE*(SIZE+STRIDE)*CHA) +: 48] <= 48'h800000000000;
                        else if(ram_select[ROW] == 1'b1) // 选中
                            data_pooling[(48*(SIZE*ROW+COL) + 48*SIZE*(SIZE+STRIDE)*CHA) +: 48] <= data_ram[CHA][ROW][COL];
                    end
                    // 每个CHANNEL数据一样
                end
            end
        end
    endgenerate
    /////////////////////////////////////////////////////////////////////////
    
    pooling_ctrl #(
        .LENGTH_PIC(LENGTH_PIC),
        .WIDTH_PIC(WIDTH_PIC),
        .SIZE(SIZE),
        .STRIDE(STRIDE)
    )
    pooling_ctrl_inst(
        .clk(clk),
        .rstn(rstn),
        .din_valid(din_valid),
        .addr(addr),   // 计数器生成addr，与STRIDE有关
        .ram_select(ram_select),  // 计数器生成片选信号，选中的若干RAM连接到POOLING，其他的更新数据
        .ram_write(ram_write),
        .din_core_valid(din_core_valid),
        .dout_valid(dout_valid)
    );  
    
    wire    [47:0]  test_result [CHANNEL-1:0];
    
    generate  // RAM生成，所有CHANNEL共用同一组RAM。并且RAM长度为LONG_PIC-SIZE+1，SIZE=2时为199
        genvar ROW_RAM, COL_RAM, CHA_RAM;
        for(CHA_RAM=0; CHA_RAM<CHANNEL; CHA_RAM=CHA_RAM+1) begin : channel_ram
            for(ROW_RAM=0; ROW_RAM<STRIDE+SIZE; ROW_RAM=ROW_RAM+1) begin : row_ram   // 对于不同行，data_generator给出不同数据。乒乓算法
                for(COL_RAM=0; COL_RAM<SIZE; COL_RAM=COL_RAM+1) begin : col_ram  // 对于相同行，不同列数据相同（无法同时读同一个RAM的不同列，所以对不同列使用SIZE个RAM）
                    pooling_ram pooling_ramx(
                        .clka(clk),
                        .wea(ram_write[ROW_RAM*SIZE+COL_RAM]),  // 可以向内写新数
                        .addra(addr[((ROW_RAM*SIZE)+COL_RAM)*16 +: 16]),  // 对于每一行的若干RAM，取出其基准地址+0，1，2...位的数据并concatenate
                        .dina(din[CHA_RAM*48 +: 48]),  //  data_generator给出新数据，每列相同每行不同（SIZE=3时，每行为n, 2n, ..., 6n）
                        .douta(data_ram[CHA_RAM][ROW_RAM][COL_RAM])
                    );
                end
            end
            assign  test_result[CHA_RAM] = dout[48*CHA_RAM +: 48];
        end
    endgenerate
    
    max_pooling_core #(
        .LENGTH_SIZE(SIZE*(SIZE+STRIDE)),
        .CHANNEL(CHANNEL)
        )
    max_pooling_core_inst (
        .clk(clk),
        .rstn(rstn),
        .din(data_pooling),
        .dout(dout)
    );
    
endmodule
