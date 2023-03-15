`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/07 16:35:12
// Design Name: 
// Module Name: conv1layer
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


module convlayer#(
    parameter   W = 5,
    parameter   H = 5)
    (
    input                                       cmos_pclk,        //cmos pxiel clock
    input                                       clear,
    //weights and bias
    input [32*(W*H)-1:0]                        weights,
    input [31:0]                                bias,
    input                                       bias_en,
    input [7:0]                                 IMAGEL,
    input [7:0]                                 IMAGEW,
    //mnist data
    input                                       conv_in_data_valid,
    input[31:0]                                 conv_in_data,
    //output
    output reg                                  conv_out_data_valid,
    output reg[31:0]                            conv_out_data          
    );
    
    reg [5:0]   align_line_cnt, align_row_cnt, align_row_cnt_r, align_row_cnt_r2, align_row_cnt_r3;
    reg [2:0]   align_fifo_cnt, align_fifo_cnt2, align_fifo_cnt2_r, align_fifo_cnt2_r2;
    wire        wr_ram [H-1:0];
    
    reg [5:0]   rd_ram_addr, rd_ram_addr_r1, rd_ram_addr_r2;
    
    reg  [32*H-1:0]     current_line_data   [W-1:0];    //连续缓存4级数据，连同当前数据组成5个当前行数据
    wire [32*H-1:0]     convcore_data;
    wire [32*(W*H)-1:0] convcore_in_data;
    wire                convcore_in_data_valid = ((rd_ram_addr_r2 >= W-1) && (align_row_cnt_r3 >= H-1));
    wire                convcore_out_data_valid;
    wire [31:0]         convcore_out_data;
    reg                 conv_out_data_valid_relu;
    reg [31:0]          conv_out_data_relu;                  
    
    //图像输入同步用计数器
    always@(posedge cmos_pclk) begin
        if(clear) begin
            align_line_cnt          <= 0;
            align_row_cnt           <= 0;
            align_fifo_cnt          <= 0;
            align_fifo_cnt2         <= 1;
        end
        else begin
            //读取ram进卷积核心运算核
            rd_ram_addr             <= align_line_cnt;
            rd_ram_addr_r1          <= rd_ram_addr;     //convcore_data
            rd_ram_addr_r2          <= rd_ram_addr_r1;  //current_line_data
            align_row_cnt_r         <= align_row_cnt;   //rd_ram_addr
            align_row_cnt_r2        <= align_row_cnt_r; //convcore_data
            align_row_cnt_r3        <= align_row_cnt_r2;//current_line_data
            align_fifo_cnt2_r       <= align_fifo_cnt2;   //rd_ram_addr
            align_fifo_cnt2_r2      <= align_fifo_cnt2_r; //convcore_data
            //图像计数器
            if(conv_in_data_valid) begin
                if(align_line_cnt == IMAGEW-1) begin
                    align_line_cnt      <= 0;
                    align_row_cnt       <= align_row_cnt + 1;
                    if(align_fifo_cnt == H-1)
                        align_fifo_cnt  <= 0;
                    else
                        align_fifo_cnt  <= align_fifo_cnt + 1;
                    if(align_fifo_cnt2 == H-1)
                        align_fifo_cnt2 <= 0;
                    else
                        align_fifo_cnt2 <= align_fifo_cnt2 + 1;
                end
                else
                    align_line_cnt      <= align_line_cnt + 1;
            end
        end
    end
    
    wire    [3:0]   rd_arbitre_temp [H-1:0];
    
    genvar  H_CNT, W_CNT;
    generate
        //每行数据连续5个做成平行输出
        for (W_CNT=0; W_CNT<W-1; W_CNT=W_CNT+1)
        begin : data_buf
            always@(posedge cmos_pclk) current_line_data[W_CNT] <= current_line_data[W_CNT+1];
        end
        for (H_CNT=0; H_CNT<H; H_CNT=H_CNT+1)
        begin : h1
            //输出在有输入后的下一个时钟就启动，但直到第五行才进入卷积运算核
            //在第五行输入时，第一个ram对应第1行，第二个ram对应第2行，以此类推
            //在第六行输入时，第一个ram对应第6行，第二个ram对应第2行，第三个ram对应第3行，以此类推。如果是这种情况，那第二个ram的数据应该放在最低数据处，第一个ram是最高数据处
            //循环H次，需要分H种情况
            //align_fifo_cnt2_r2 == 4 : ram:01234 --> line:01234
            //align_fifo_cnt2_r2 == 0 : ram:12340 --> line:01234
            //align_fifo_cnt2_r2 == 1 : ram:23401 --> line:01234
            //align_fifo_cnt2_r2 == 2 : ram:34012 --> line:01234
            //align_fifo_cnt2_r2 == 3 : ram:40123 --> line:01234
            assign  rd_arbitre_temp[H_CNT] = ((H_CNT+align_fifo_cnt2_r2)>=H)?(H_CNT+align_fifo_cnt2_r2-H):(H_CNT+align_fifo_cnt2_r2);
            always@(posedge cmos_pclk) current_line_data[W-1][32*(H_CNT+1)-1 -: 32]  <= convcore_data[32*(rd_arbitre_temp[H_CNT]+1)-1 -: 32];
            conv_ram    conv_ramx(
                .clka(cmos_pclk),
                .clkb(cmos_pclk),
                .dina(conv_in_data),
                .wea(wr_ram[H_CNT]),
                .doutb(convcore_data[32*(H_CNT+1)-1 -: 32]),
                .addra(align_line_cnt),
                .addrb(rd_ram_addr)
            );
            //改变数据进入方式，进入计算核
            for (W_CNT=0; W_CNT<W; W_CNT=W_CNT+1)
            begin : data_to_core
                assign  convcore_in_data[32*(H_CNT*W+W_CNT+1)-1 -: 32]  = current_line_data[W_CNT][32*(H_CNT+1)-1 -: 32];
            end
        end
        
        for (H_CNT=0; H_CNT<H; H_CNT=H_CNT+1)
        begin : h2
            //数据先缓存5行
            assign  wr_ram[H_CNT]   = (align_fifo_cnt == H_CNT) && conv_in_data_valid;
        end
        
        //convcore
        always@(posedge cmos_pclk) begin
            if(bias_en)
                conv_out_data_relu  <= convcore_out_data + {8'h0,bias[31:8]};
            else
                conv_out_data_relu  <= convcore_out_data;
            //relu激活函数
            conv_out_data       <= (conv_out_data_relu[31])?0:conv_out_data_relu;   
        end              
        //5x5卷积核    
        single_convcore #(
            .W(W),
            .H(H))
        single_convcore(
            .cmos_pclk(cmos_pclk),        //cmos pxiel clock
            //weights and bias
            .weights(weights),
            //mnist data
            .conv_in_data_valid(convcore_in_data_valid),
            .conv_in_data(convcore_in_data),
            //output
            .conv_out_data_valid(convcore_out_data_valid),
            .conv_out_data(convcore_out_data)         
         );
    endgenerate
    
    always@(posedge cmos_pclk) begin                                        
        conv_out_data_valid_relu                     <= convcore_out_data_valid; 
        conv_out_data_valid                          <= conv_out_data_valid_relu; 
    end
    
endmodule
