`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/28 20:28:38
// Design Name: 
// Module Name: CTRL
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

// This file needs to contain a counter to ensure that the full signal can be set properly
// The "addr" signal uses another independent counter, depend on STRIDE, SIZE,...

module pooling_ctrl #(
    parameter integer SIZE=2,
    parameter integer STRIDE=2
    )(
    input                                   clk,
    input                                   rstn,
    input       [7:0]                       LENGTH_PIC,
    input       [7:0]                       WIDTH_PIC,
    input                                   din_valid,
    output      [(SIZE+STRIDE)*SIZE*16-1:0] addr,
    output reg [SIZE+STRIDE-1:0]            ram_select,   // ram_select == 10, read data of upper RAMs
    output      [(SIZE+STRIDE)*SIZE-1:0]    ram_write,  // ram_write, 
    output                                  din_core_valid,
    output                                  dout_valid
    );
    
    localparam  RAM_LAT      = 2;  //ram=1, data_pooling=1
    wire  [7:0] LENGTH_RAM;
    wire  [7:0] LOAD_ALL;
    wire  [7:0] VALID_LENGTH;
    //资源不够这里也要改
    localparam  VALID_LAG    = RAM_LAT+3;//RAM_LAT+(SIZE+STRIDE)*SIZE+1;
    wire  [7:0] LASTLINE;
    
    assign  LENGTH_RAM = LENGTH_PIC-SIZE+1;  // 200-2+1=199
    assign  LOAD_ALL   = SIZE*LENGTH_PIC; // Load all pixels for SIZE(2, 3, 4...) lines
    assign  LASTLINE   = WIDTH_PIC/STRIDE-1;
    assign  VALID_LENGTH      = (LENGTH_RAM-1)/STRIDE+1;
    
    reg [15:0] cnt_select, cnt_line;
    reg [15:0] cnt_wr_addr;
    
    reg [SIZE+STRIDE-1:0]   ram_select_s; // Latency of RAM
    reg [15:0]              addr_s [SIZE+STRIDE-1:0][SIZE-1:0];
    
    reg                     first_read;  // The first moment we can read value from RAMs
    reg [VALID_LAG-1:0]     valid_reg;
    
    //////////////// MAIN COUNTER ////////////////
    always@(posedge clk) begin : main_counter
        if(~rstn) begin
            cnt_select  <= 'b0;
            cnt_wr_addr <= 'b0;
            cnt_line    <= 'b0;
        end
        else if(din_valid) begin
            if(cnt_select == (STRIDE+SIZE)*LENGTH_PIC-1) begin  //ram select
                cnt_select  <= LOAD_ALL;
                cnt_line    <= cnt_line + 1;
            end
            else
                cnt_select  <= cnt_select + 1;
            if(cnt_wr_addr == (STRIDE+SIZE)*LENGTH_PIC-1)  //ram write
                cnt_wr_addr <= 'b0;
            else
                cnt_wr_addr <= cnt_wr_addr + 1;
        end
        else if(cnt_line == LASTLINE) begin
            if(cnt_select == (STRIDE+SIZE)*LENGTH_PIC-1) begin
                cnt_select  <= 'b0;
                cnt_line    <= 'b0;
            end
            else
                cnt_select  <= cnt_select + 1;
        end
    end
    //////////////// MAIN COUNTER ////////////////
    
    
    //////////////// RAM_SELECT_CTRL ////////////////
    // only for ram select start control
    generate
        genvar SEL;
        for(SEL=0; SEL<SIZE+STRIDE; SEL=SEL+1) begin : RAM_SEL
            always@(posedge clk) begin : RAM_SELECT_CTRL
                if(~rstn)
                    ram_select_s[SEL]       <= 1'b0;
                else if(cnt_select == LOAD_ALL - 1) begin
                    if(SEL<SIZE)
                        ram_select_s[SEL]   <= 1'b1;  // Start from the first 3 lines (SIZE=3)
                    else
                        ram_select_s[SEL]   <= 1'b0;
                end
                else if(cnt_select == LOAD_ALL+STRIDE*LENGTH_PIC-1) begin //(cnt > RAM_LAG-1 && cnt < LOAD_ALL+RAM_LAG)
                    if(SEL<STRIDE)
                        ram_select_s[SEL]   <= ram_select_s[SEL+SIZE];   //原ram_select_s[SIZE+STRIDE-1:SIZE]，被放置在低位
                    else
                        ram_select_s[SEL]   <= ram_select_s[SEL-STRIDE]; //原ram_select_s[SIZE-1:0]，被放置在高位
                end
             end
        end
    endgenerate
    
    always@(posedge clk) begin
        if(~rstn) 
            ram_select      <= 'b0;
        else 
            ram_select      <= ram_select_s;
    end
    //////////////// RAM_SELECT_CTRL ////////////////
    
    
    //////////////// RAM_WRITE_CTRL ////////////////
    generate
        genvar ROW, COL;  // Different elements in one line need different write enable signal
        for(ROW=0; ROW<SIZE+STRIDE; ROW=ROW+1) begin : RAM_WRITEr
            for(COL=0; COL<SIZE; COL=COL+1) begin : RAM_WRITEc
                assign  ram_write[SIZE*ROW+COL] = (cnt_wr_addr>=ROW*LENGTH_PIC+COL && cnt_wr_addr<ROW*LENGTH_PIC+LENGTH_RAM+COL) & din_valid;
            end
        end
    endgenerate
    //////////////// RAM_WRITE_CTRL ////////////////
    
    
    //////////////// RAM_WRITE & POOLING READ ADDRESS_CTRL ////////////////
    // When RAM write, addr <= addr + 1; when POOLING, addr <= addr + STRIDE;
    generate
        genvar ROW_ADDR, COL_ADDR;
        for(ROW_ADDR=0; ROW_ADDR<SIZE+STRIDE; ROW_ADDR=ROW_ADDR+1) begin : ADDR_ROW
            for(COL_ADDR=0; COL_ADDR<SIZE; COL_ADDR=COL_ADDR+1) begin : ADDR_COL
                always@(posedge clk) begin
                    if(~rstn)
                        addr_s[ROW_ADDR][COL_ADDR] <= 0;
                    else
                        if(ram_write[SIZE*ROW_ADDR+COL_ADDR] && addr_s[ROW_ADDR][COL_ADDR]<LENGTH_RAM-1) // ram_write == 1
                            addr_s[ROW_ADDR][COL_ADDR] <= addr_s[ROW_ADDR][COL_ADDR] + 1;
                        else if(ram_select_s[ROW_ADDR])  // ram_select == 1
                            if(cnt_select == LOAD_ALL)
                                addr_s[ROW_ADDR][COL_ADDR] <= 0;
                            else if(addr_s[ROW_ADDR][COL_ADDR]>=LENGTH_RAM-1)
                                addr_s[ROW_ADDR][COL_ADDR] <= addr_s[ROW_ADDR][COL_ADDR];
                            else
                                addr_s[ROW_ADDR][COL_ADDR] <= addr_s[ROW_ADDR][COL_ADDR] + STRIDE;
                        else
                            addr_s[ROW_ADDR][COL_ADDR] <= 0;
                end
                assign addr[(ROW_ADDR*SIZE+COL_ADDR)*16 +: 16] = addr_s[ROW_ADDR][COL_ADDR];
            end
        end
    endgenerate
    //////////////// RAM_WRITE & POOLING READ ADDRESS_CTRL ////////////////
    
    
    //////////////// VALID SIGNAL ////////////////
    always@(posedge clk) begin : VALID_PERMITTED
        if(~rstn)
            first_read <= 1'b0;
        else
            if(cnt_select == LOAD_ALL)
                first_read <= 1'b1;
    end
    
    always@(posedge clk) begin : VALID_EN
        if(~rstn)
            valid_reg[0] <= 'b0;
        else
            if(first_read)
                if((cnt_select>LOAD_ALL && cnt_select<=(LOAD_ALL+VALID_LENGTH)))
                    valid_reg[0] <= 1'b1;
                else
                    valid_reg[0] <= 1'b0;
            else
                valid_reg[0] <= 1'b0;
    end
    
    generate
        genvar VLD_LAG;
        for(VLD_LAG=0; VLD_LAG<VALID_LAG-1; VLD_LAG=VLD_LAG+1) begin 
            always@(posedge clk) begin
                if(~rstn)
                    valid_reg[VLD_LAG+1] <= 'b0;
                else
                    valid_reg[VLD_LAG+1] <= valid_reg[VLD_LAG];
            end
        end
    endgenerate
    
    assign  din_core_valid = valid_reg[0];
    assign  dout_valid = valid_reg[VALID_LAG-1];
    //////////////// VALID SIGNAL ////////////////
    
endmodule
