`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/30 08:58:24
// Design Name: 
// Module Name: mnist_process
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


module mnist_process(
    input                                        cmos_pclk,        //cmos pxiel clock
    input                                        load_start,
    //mnist data
    input                                        mnist_data_valid,
    input[15:0]                                  mnist_data,
    //output
    output[3:0]                                  number_o
    );
    
    localparam  CHANNEL_CONV1 = 5;
    localparam  CHANNEL_CONV2 = 10;
    localparam  SIZE_CONV1 = 28;
    localparam  SIZE_POOL1 = 24;
    localparam  SIZE_CONV2 = 12;
    localparam  SIZE_POOL2 = 8;
    localparam  SIZE_2FCNN = 4;
    localparam  SIZE_FCNN = SIZE_2FCNN*SIZE_2FCNN*CHANNEL_CONV2;
    localparam  SIZE_OUT = 10;
    
    //weights and bias
    reg [48*(5*5*1*CHANNEL_CONV1)-1:0]                  weights_conv1;
    reg [48*CHANNEL_CONV1-1:0]                          bias_conv1;
    reg [48*(5*5*CHANNEL_CONV1*CHANNEL_CONV2)-1:0]      weights_conv2;
    reg [48*CHANNEL_CONV2-1:0]                          bias_conv2;
    reg [48*2-1:0]                                      bn;
    wire [47:0]                                         fcnn_W  [SIZE_OUT-1:0];
    reg [48*SIZE_OUT-1:0]                               fcnn_b;
    wire [47:0]                                         W1; 
    wire [47:0]                                         B1; 
    wire [47:0]                                         W2; 
    wire [47:0]                                         B2; 
    wire [47:0]                                         BN; 
    wire [47:0]                                         FCNN_W;
    wire [47:0]                                         FCNN_b;
    
    //load parameters
    reg [10:0]  weight1_load_addr, weight2_load_addr, weight1_load_addr_r, weight2_load_addr_r;
    reg [3:0]   bias1_load_addr, bias2_load_addr, bias1_load_addr_r, bias2_load_addr_r;
    reg [1:0]   bn_load_addr, bn_load_addr_r;
    reg [7:0]   fcnnW_load_addr, fcnnW_load_addr_r, fcnnW_buffer_addr, fcnnW_buffer_addr_r;
    reg         fcnnW_wr_en [SIZE_OUT-1:0];
    reg [3:0]   fcnnb_load_addr, fcnnb_load_addr_r;
    
    reg [7:0]   load_fcnn_addr, select_fcnn_addr, select_fcnn_addr_r;
    reg [1:0]   BN_step_r, BN_step_r2, BN_step;
    reg [15:0]  fcnn_addr;
    reg [3:0]   load_state;
    
    localparam  IDLE=0;
    localparam  LOAD_W1=1;
    localparam  LOAD_B1=2;
    localparam  LOAD_W2=3;
    localparam  LOAD_B2=4;
    localparam  LOAD_BN=5;
    localparam  LOAD_FCNNW=6;
    localparam  LOAD_FCNNB=7;
    localparam  SAVE_FCNN=8;
    localparam  LOAD_FCNN=9;  //BN u, o2, calculate
    localparam  LOAD_FINI=10;
    localparam  RUN_FCNN=11;
    
    wire                        conv1out_data_valid;
    wire    [48*CHANNEL_CONV1-1:0]    conv1out_data;  
    wire                        pool1out_data_valid;
    wire    [48*CHANNEL_CONV1-1:0]    pool1out_data; 
    wire                        conv2out_data_valid;
    wire    [48*CHANNEL_CONV2-1:0]    conv2out_data;  
    wire                        pool2out_data_valid;
    wire    [48*CHANNEL_CONV2-1:0]    pool2out_data; 
    wire    [47:0]              select_fcnn_data    [CHANNEL_CONV2-1:0];
    reg                         classified_data_valid_r, classified_data_valid;
    reg     [47:0]              classified_data;
    wire                        bn_data_valid;
    wire    [47:0]              bn_data;
    reg                         bn_in_data_cal;
    wire                        sigmoid_data_valid;
    reg                         sigmoid_data_valid_r, sigmoid_data_valid_r2, sigmoid_data_valid_r3;
    wire    [47:0]              sigmoid_data;
    reg     [47:0]              sigmoid_data_r;
    reg     [47:0]              fcnn_mul            [SIZE_OUT-1:0];
    reg     [47:0]              fcnn_data           [SIZE_OUT-1:0];
    
    initial begin
        load_state  <= 0;
        weight1_load_addr   <= 0;
        weight2_load_addr   <= 0;
        bias1_load_addr     <= 0;
        bias2_load_addr     <= 0;
        bn_load_addr        <= 0;
        weight1_load_addr_r <= 0;
        weight2_load_addr_r <= 0;
        bias1_load_addr_r   <= 0;
        bias2_load_addr_r   <= 0;
        bn_load_addr_r      <= 0;
        fcnnW_load_addr     <= 0;
        fcnnW_buffer_addr   <= 0;
        fcnnb_load_addr     <= 0;
        fcnnb_load_addr_r   <= 0;
        weights_conv1       <= 0;
        bias_conv1          <= 0;
        weights_conv2       <= 0;
        bias_conv2          <= 0;
        bn                  <= 0;
        fcnn_b              <= 0;
        load_fcnn_addr      <= 0;
        select_fcnn_addr_r  <= 0;
        BN_step_r           <= 0;
        bn_in_data_cal      <= 0;
        classified_data     <= 0;
        classified_data_valid_r <= 0;
        fcnn_addr           <= 0;
    end
    
    always@(posedge cmos_pclk) begin
        weight1_load_addr_r <= weight1_load_addr;
        weight2_load_addr_r <= weight2_load_addr;
        bias1_load_addr_r   <= bias1_load_addr;
        bias2_load_addr_r   <= bias2_load_addr;
        bn_load_addr_r      <= bn_load_addr;
        fcnnW_load_addr_r   <= fcnnW_load_addr;
        fcnnW_buffer_addr_r <= fcnnW_buffer_addr;
        fcnnb_load_addr_r   <= fcnnb_load_addr;
        weights_conv1[48*(weight1_load_addr_r+1)-1 -: 48] <= W1;
        bias_conv1[48*(bias1_load_addr_r+1)-1 -: 48]      <= B1;
        weights_conv2[48*(weight2_load_addr_r+1)-1 -: 48] <= W2;
        bias_conv2[48*(bias2_load_addr_r+1)-1 -: 48]      <= B2;
        bn[48*(bn_load_addr_r+1)-1 -: 48]                 <= BN;
        fcnn_b[48*(fcnnb_load_addr_r+1)-1 -: 48]          <= FCNN_b;
        BN_step_r2                                        <= BN_step_r;
        BN_step                                           <= BN_step_r2;
        bn_in_data_cal                                    <= (BN_step_r2 == 2)&classified_data_valid_r;
        classified_data_valid                             <= classified_data_valid_r;
        select_fcnn_addr                                  <= select_fcnn_addr_r;
        sigmoid_data_valid_r                              <= sigmoid_data_valid;
        sigmoid_data_valid_r2                             <= sigmoid_data_valid_r;
        sigmoid_data_valid_r3                             <= sigmoid_data_valid_r2;
        sigmoid_data_r                                    <= sigmoid_data;
        case(load_state)
            IDLE:
            begin
                weight1_load_addr   <= 0;
                weight2_load_addr   <= 0;
                bias1_load_addr     <= 0;
                bias2_load_addr     <= 0;
                bn_load_addr        <= 0;
                load_fcnn_addr      <= 0;
                select_fcnn_addr_r  <= 0;
                BN_step_r           <= 0;
                fcnn_addr           <= 0;
                classified_data_valid_r <= 0;
                if(load_start)
                    load_state  <= LOAD_W1;
            end
            LOAD_W1:
            begin
                if(weight1_load_addr == 5*5*1*CHANNEL_CONV1-1) begin
                    weight1_load_addr   <= 0;   
                    load_state          <= LOAD_B1;
                end
                else
                    weight1_load_addr   <= weight1_load_addr + 1;  
            end
            LOAD_B1:
            begin
                if(bias1_load_addr == CHANNEL_CONV1-1) begin
                    bias1_load_addr     <= 0;   
                    load_state          <= LOAD_W2;
                end
                else
                    bias1_load_addr     <= bias1_load_addr + 1;  
            end
            LOAD_W2:
            begin
                if(weight2_load_addr == 5*5*CHANNEL_CONV1*CHANNEL_CONV2-1) begin
                    weight2_load_addr   <= 0;   
                    load_state          <= LOAD_B2;
                end
                else
                    weight2_load_addr   <= weight2_load_addr + 1;  
            end
            LOAD_B2:
            begin
                if(bias2_load_addr == CHANNEL_CONV2-1) begin
                    bias2_load_addr     <= 0;   
                    load_state          <= LOAD_BN;
                end
                else
                    bias2_load_addr     <= bias2_load_addr + 1;  
            end
            LOAD_BN:
            begin
                if(bn_load_addr == 2-1) begin
                    bn_load_addr    <= 0;   
                    load_state      <= LOAD_FCNNW;
                end
                else
                    bn_load_addr    <= bn_load_addr + 1;  
            end
            LOAD_FCNNW:
            begin
                //将一串参数发送给fcnnW_buffer
                if(fcnnW_buffer_addr < SIZE_FCNN-1)
                    fcnnW_buffer_addr   <= fcnnW_buffer_addr + 1;
                else begin
                    fcnnW_buffer_addr   <= 0;
                    if(fcnnW_load_addr == SIZE_OUT-1) begin
                        fcnnW_load_addr <= 0;   
                        load_state      <= LOAD_FCNNB;
                    end
                    else
                        fcnnW_load_addr <= fcnnW_load_addr + 1;
                end  
            end
            LOAD_FCNNB:
            begin
                if(fcnnb_load_addr == SIZE_OUT-1) begin
                    fcnnb_load_addr <= 0;   
                    load_state      <= SAVE_FCNN;
                end
                else
                    fcnnb_load_addr <= fcnnb_load_addr + 1;  
            end
            SAVE_FCNN:
            begin
                if(pool2out_data_valid) begin
                    if(load_fcnn_addr<SIZE_2FCNN*SIZE_2FCNN-1)
                        load_fcnn_addr  <= load_fcnn_addr + 1;
                    else begin
                        load_fcnn_addr  <= 0;
                        load_state      <= LOAD_FCNN;
                    end
                end
            end
            LOAD_FCNN:
            begin
                classified_data_valid_r <= 1;
                classified_data         <= select_fcnn_data[select_fcnn_addr];
                if(load_fcnn_addr<SIZE_2FCNN*SIZE_2FCNN-1)
                    load_fcnn_addr  <= load_fcnn_addr + 1;
                else begin
                    load_fcnn_addr  <= 0;
                    if(select_fcnn_addr_r == CHANNEL_CONV2-1) begin
                        select_fcnn_addr_r  <= 0;
                        load_state      <= LOAD_FINI;
                    end
                    else
                        select_fcnn_addr_r  <= select_fcnn_addr_r + 1;
                end
            end
            LOAD_FINI:
            begin
                load_fcnn_addr      <= 0;
                select_fcnn_addr_r  <= 0;
                classified_data_valid_r <= 0;
                classified_data     <= select_fcnn_data[select_fcnn_addr];
                if(BN_step_r == 2) begin
                    BN_step_r       <= 0;
                    load_state      <= RUN_FCNN;
                end
                else begin
                    BN_step_r       <= BN_step_r + 1;
                    load_state      <= LOAD_FCNN;
                end
            end
            RUN_FCNN:
            begin
                classified_data     <= 0;
            end
        endcase
        if(sigmoid_data_valid) begin
            if(fcnn_addr<SIZE_FCNN-1)
                fcnn_addr   <= fcnn_addr + 1;
            else 
                fcnn_addr   <= 0;
        end
    end
    
    genvar  fcnnW_i;
    W1_blkmem   W1_blkmem( .clka(cmos_pclk), .addra(weight1_load_addr), .douta(W1) );
    b1_blkmem   b1_blkmem( .clka(cmos_pclk), .addra(bias1_load_addr), .douta(B1) );
    W2_blkmem   W2_blkmem( .clka(cmos_pclk), .addra(weight2_load_addr), .douta(W2) );
    b2_blkmem   b2_blkmem( .clka(cmos_pclk), .addra(bias2_load_addr), .douta(B2) );
    BN_blkmem   BN_blkmem( .clka(cmos_pclk), .addra(bn_load_addr), .douta(BN) );
    fcnnW_blkmem   fcnnW_blkmem( .clka(cmos_pclk), .addra(fcnnW_load_addr*SIZE_FCNN+fcnnW_buffer_addr), .douta(FCNN_W) );
    generate
    for(fcnnW_i=0; fcnnW_i<SIZE_OUT; fcnnW_i=fcnnW_i+1) begin
        fcnnW_buffer    fcnnW_buffer( .clka(cmos_pclk), .addra(fcnnW_buffer_addr_r), .wea(fcnnW_load_addr_r==fcnnW_i), .dina(FCNN_W), .clkb(cmos_pclk), .addrb(fcnn_addr),  .doutb(fcnn_W[fcnnW_i]) ); 
    end
    endgenerate
    fcnnb_blkmem   fcnnb_blkmem( .clka(cmos_pclk), .addra(fcnnb_load_addr), .douta(FCNN_b) );
    
    wire [47:0]     image_data = {32'h0,mnist_data};
    wire            image_data_valid = mnist_data_valid;
    
    convlayer #(
        .IMAGEL(SIZE_CONV1),
        .IMAGEW(SIZE_CONV1),
        .W(5),
        .H(5),
        .CHANNEL_IN(1),
        .CONVCORE(CHANNEL_CONV1),
        .CORENUM(1))
    conv1layer (
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        .clear(load_start),
        //weights and bias
        .weights(weights_conv1),
        .bias(bias_conv1),
        //mnist data
        .conv_in_data_valid(image_data_valid),
        .conv_in_data(image_data),
        //output
        .conv_out_data_valid(conv1out_data_valid),
        .conv_out_data(conv1out_data)         
    );
    
    max_pooling #(
        .SIZE(2),
        .CHANNEL(CHANNEL_CONV1),
        .STRIDE(2),
        .LENGTH_PIC(SIZE_POOL1),
        .WIDTH_PIC(SIZE_POOL1)
    )
    max_pooling1(
        .clk(cmos_pclk),
        .rstn(~load_start),
        .din_valid(conv1out_data_valid),
        .din(conv1out_data),
        .dout(pool1out_data),
        .dout_valid(pool1out_data_valid)
    );
    
    convlayer #(
        .IMAGEL(SIZE_CONV2),
        .IMAGEW(SIZE_CONV2),
        .W(5),
        .H(5),
        .CHANNEL_IN(CHANNEL_CONV1),
        .CONVCORE(CHANNEL_CONV2),
        .CORENUM(2))
    conv2layer (
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        .clear(load_start),
        //weights and bias
        .weights(weights_conv2),
        .bias(bias_conv2),
        //mnist data
        .conv_in_data_valid(pool1out_data_valid),
        .conv_in_data(pool1out_data),
        //output
        .conv_out_data_valid(conv2out_data_valid),
        .conv_out_data(conv2out_data)         
    );
    
    max_pooling #(
        .SIZE(2),
        .CHANNEL(CHANNEL_CONV2),
        .STRIDE(2),
        .LENGTH_PIC(SIZE_POOL2),
        .WIDTH_PIC(SIZE_POOL2)
    )
    max_pooling2(
        .clk(cmos_pclk),
        .rstn(~load_start),
        .din_valid(conv2out_data_valid),
        .din(conv2out_data),
        .dout(pool2out_data),
        .dout_valid(pool2out_data_valid)
    );
    
    genvar  i;
    generate
        for (i=0; i<CHANNEL_CONV2; i=i+1) begin
            classify_ram    classify_ramx(
                .clka(cmos_pclk),
                .wea(pool2out_data_valid),  
                .addra(load_fcnn_addr),   // SAVE_FCNN, LOAD_FCNN
                .dina(pool2out_data[48*(i+1)-1 -: 48]), 
                .douta(select_fcnn_data[i])
            );
        end
    endgenerate
    
    batch_normalization #(
        .SIZE_FCNN(SIZE_FCNN)
    )
    batch_normalization_inst(
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        //parameters
        .bn(bn),
        .bn_step(BN_step),      //calculate o2 or avg
        //mnist data
        .bn_in_data_valid(classified_data_valid),
        .bn_in_data_cal(bn_in_data_cal),
        .bn_in_data(classified_data),
        //output
        .bn_out_data_valid(bn_data_valid),
        .bn_out_data(bn_data)       
    );
    
    sigmoid sigmoid_inst(
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        //mnist data
        .sigmoid_in_data_valid(bn_data_valid),
        .sigmoid_in_data(bn_data),
        //output
        .sigmoid_out_data_valid(sigmoid_data_valid),
        .sigmoid_out_data(sigmoid_data)       
    );
    
    //fcnn
    reg    [47:0]   fcnn_temp   [SIZE_OUT-1:0];
    wire   [48*SIZE_OUT-1 : 0]    result_data;
    
    genvar  FCNN_CNT;
    generate
        for(FCNN_CNT=0; FCNN_CNT<SIZE_OUT; FCNN_CNT=FCNN_CNT+1) begin 
            initial begin
                fcnn_temp[FCNN_CNT] <= 0;
                fcnn_mul[FCNN_CNT]  <= 0;
                fcnn_data[FCNN_CNT] <= 0;
            end
            assign  result_data[48*(FCNN_CNT+1)-1 -: 48] = fcnn_data[FCNN_CNT];
            always@(posedge cmos_pclk) begin
                if(load_start) begin
                    fcnn_temp[FCNN_CNT] <= 0;
                    fcnn_mul[FCNN_CNT]  <= 0;
                    fcnn_data[FCNN_CNT] <= 0;
                end
                else begin
                    if(sigmoid_data_valid_r)
                        fcnn_temp[FCNN_CNT] <= sigmoid_data_r[15:0] * fcnn_W[FCNN_CNT];
                    if(sigmoid_data_valid_r2)
                        fcnn_mul[FCNN_CNT]  <= fcnn_mul[FCNN_CNT] + (fcnn_temp[FCNN_CNT][47]?{16'hffff,fcnn_temp[FCNN_CNT][47:16]}:{16'h0,fcnn_temp[FCNN_CNT][47:16]});
                    if(sigmoid_data_valid_r3)
                        fcnn_data[FCNN_CNT] <= fcnn_mul[FCNN_CNT] + fcnn_b[48*(FCNN_CNT+1)-1 -: 48];
                end
            end
        end
    endgenerate
    
    wire    [47:0]  maxdata;
    
    out_select#(
       .SIZE_OUT(SIZE_OUT)
    )
    out_select(
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        //mnist data
        .result_data(result_data),
        //output
        .maxdata(maxdata),
        .number_o(number_o)
    );
    
endmodule
