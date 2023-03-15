`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/30 08:58:24
// Design Name: 
// Module Name: mnist_256to1pix
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


module mnist_256to1pix(
    input                                        cmos_pclk,        //cmos pxiel clock
    //mnist data
    input                                        mnist_data_valid,
    input[7:0]                                   mnist_data,
    //mnist 28x28
    output                                       mnist_data_valid_norm,
    output[15:0]                                 mnist_data_norm,
    //mnist start
    (* mark_debug="true" *)input                mnist_start
    );
    
    reg [5:0]       index;
    reg [9:0]       h_cnt, v_cnt;
    reg [10:0]      mnist_addr_i;
    reg [10:0]      mnist_addr_o;   
    reg             mnist_o_en, mnist_o_en_r;    
    reg [15:0]      sum [27:0];
    wire [15:0]     mnist_data_i = sum[index];
    wire [15:0]     mnist_data_o;
    
    initial begin
        h_cnt   <= 0;
        v_cnt   <= 0;
        mnist_o_en      <= 0;
        mnist_o_en_r    <= 0;
        index   <= 0;
    end
    
    genvar LINE_CNT;
        
    generate
        for (LINE_CNT=0; LINE_CNT<28; LINE_CNT=LINE_CNT+1)
        begin : line
            initial
                sum[LINE_CNT]   <= 0;
            always@(posedge cmos_pclk)
            begin
                if(mnist_start)
                    sum[LINE_CNT]   <= 0;
                else if(mnist_data_valid) begin
                    if(h_cnt>=16*LINE_CNT && h_cnt<16*(LINE_CNT+1)) 
                        sum[LINE_CNT]   <= sum[LINE_CNT] + mnist_data;  // 1 clock later than h_cnt, need index
                end
                else if(~mnist_data_valid) begin
                    if(h_cnt==0 && v_cnt[3:0]==0) 
                        sum[LINE_CNT]   <= 0;
                end
            end
        end
    endgenerate
    
    always@(posedge cmos_pclk)
    begin
        mnist_o_en_r    <= mnist_o_en;
        index           <= h_cnt[9:4];
        mnist_addr_i    <= 28*v_cnt[9:4]+h_cnt[9:4];
        if(mnist_start) begin
            h_cnt   <= 0;
            v_cnt   <= 0;
            mnist_o_en  <= 1;
        end
        //red block: 448p*448p
        else if(mnist_data_valid) begin
            if(h_cnt == 447) begin
                h_cnt   <= 0;
                v_cnt   <= v_cnt + 1;
            end
            else
                h_cnt   <= h_cnt + 1;
        end
        if(mnist_o_en)
            mnist_addr_o    <= mnist_addr_o + 1;
        if(mnist_addr_o == 783) begin
            mnist_addr_o    <= 0;
            mnist_o_en      <= 0;
        end
    end
    
    mnist_image_blkmem  mnist_image_blkmem(
        .addra(mnist_addr_i),        
        .dina(mnist_data_i),        
        .addrb(mnist_addr_o), 
        .clkb(cmos_pclk),
        .clka(cmos_pclk),    
        .wea(1),    
        .doutb(mnist_data_o)  
    );
    
    assign  mnist_data_norm = mnist_data_o;  // 65536=256*256 --> 16x16pix * 256 gray scale normalization; mnist_data_o is fraction part
    assign  mnist_data_valid_norm = mnist_o_en_r; 
    
endmodule
