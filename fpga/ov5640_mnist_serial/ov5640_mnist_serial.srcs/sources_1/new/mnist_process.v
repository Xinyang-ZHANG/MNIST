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
    (* mark_debug="true" *)input                mnist_data_valid,
    (* mark_debug="true" *)input[7:0]           mnist_data,
    //output
    (* mark_debug="true" *)output reg          number_val,
    (* mark_debug="true" *)output[3:0]          number_o
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
    reg [32*(5*5)-1:0]                                  weights_conv;
    reg [31:0]                                          bias_conv;
    reg [32*2-1:0]                                      bn;
    wire [31:0]                                         fcnn_W  [SIZE_OUT-1:0];
    reg [32*SIZE_OUT-1:0]                               fcnn_b;
    wire [31:0]                                         W1; 
    wire [31:0]                                         B1; 
    wire [31:0]                                         W2; 
    wire [31:0]                                         B2; 
    wire [31:0]                                         BN; 
    wire [31:0]                                         FCNN_W;
    wire [31:0]                                         FCNN_b;
    reg  [7:0]                                          SIZE_CONV, SIZE_POOL;
    
    //load parameters
    reg [9:0]   img_load_addr, img_out_addr;
    reg         img_out_valid, img_out_valid_r;
    reg [10:0]  weight_load_addr, weight_load_addr_r;
    reg [7:0]   conv_cnt, conv_cnt_r, ci_cnt, co_cnt;
    reg [3:0]   bias_load_addr;
    reg [1:0]   bn_load_addr, bn_load_addr_r;
    reg [7:0]   fcnnW_load_addr, fcnnW_load_addr_r, fcnnW_buffer_addr, fcnnW_buffer_addr_r;
    reg [3:0]   fcnnb_load_addr, fcnnb_load_addr_r;
    
    reg [9:0]   pooling1_in_addr;
    reg [7:0]   pooling1_out_ccnt;
    wire [9:0]  pooling1_out_addr;       
    reg [5:0]   conv2_inout_addr, conv2_inout_addr_r;
    reg [7:0]   pooling_ccnt;
    reg         pooling1_out_valid, pooling1_out_valid_r;
    reg         conv2_out_valid, conv2_out_valid_r, conv2_out_valid_r2;
    reg         poolout_data_valid_r;
    wire [31:0] classify_ram_data;
    reg [1:0]   BN_step_r, BN_step_r2, BN_step;
    reg [8:0]   classify_ram_addr, fcnn_addr;
    reg [7:0]   wait_fcnn_cnt;
    (* mark_debug="true" *)reg [3:0]   load_state;
    
    localparam  IDLE=0;
    localparam  LOAD_FCNNW=1;
    localparam  LOAD_FCNNB=2;
    localparam  LOAD_BN=3;
    localparam  LOAD_IMG=4;
    localparam  LOAD_LAYER1=5;
    localparam  WAIT_LAYER1=6;
    localparam  LOAD_LAYER2=7;
    localparam  WAIT_LAYER2=8;
    localparam  ADD_CONV2=9;
    localparam  LOAD_FCNN=10;  //BN u, o2, calculate
    localparam  LOAD_FINI=11;
    localparam  RUN_FCNN=12;
    
    wire                        convout_data_valid;
    wire    [31:0]              convout_data;  
    wire    [31:0]              conv2_cdata         [CHANNEL_CONV1-1:0];  
    reg     [31:0]              conv2_data;
    wire                        poolout_data_valid;
    wire    [31:0]              poolout_data; 
    reg     [31:0]              poolout_data_r;
    
    reg                         classified_data_valid_r, classified_data_valid;
    reg     [31:0]              classified_data;
    wire                        bn_data_valid;
    wire    [31:0]              bn_data;
    reg                         bn_in_data_cal;
    wire                        sigmoid_data_valid;
    reg                         sigmoid_data_valid_r, sigmoid_data_valid_r2, sigmoid_data_valid_r3;
    wire    [31:0]              sigmoid_data;
    reg     [31:0]              sigmoid_data_r;
    reg     [31:0]              fcnn_mul            [SIZE_OUT-1:0];
    reg     [31:0]              fcnn_data           [SIZE_OUT-1:0];
    
    wire [7:0]      image_data;
    wire [31:0]     layer1_out_data;
    
    reg             clear;
    reg             bias_en;
    
    initial begin
        load_state          <= IDLE;
        SIZE_CONV           <= SIZE_CONV1;
        SIZE_POOL           <= SIZE_POOL1;
        img_load_addr       <= 0;
        img_out_addr        <= 0;
        img_out_valid       <= 0;
        weight_load_addr    <= 0;
        bias_load_addr      <= 0;
        conv_cnt            <= 0;
        ci_cnt              <= 0;
        co_cnt              <= 0;
        bn_load_addr        <= 0;
        bn_load_addr_r      <= 0;
        fcnnW_load_addr     <= 0;
        fcnnW_buffer_addr   <= 0;
        fcnnb_load_addr     <= 0;
        fcnnb_load_addr_r   <= 0;
        weights_conv        <= 0;
        bias_conv           <= 0;
        bn                  <= 0;
        fcnn_b              <= 0;
        pooling1_in_addr    <= 0;
        conv2_inout_addr    <= 0;
        classify_ram_addr  <= 0;
        pooling_ccnt        <= 0;
        pooling1_out_ccnt   <= 0;
        pooling1_out_valid  <= 0;
        conv2_out_valid     <= 0;
        conv2_data          <= 0;
        BN_step_r           <= 0;
        bn_in_data_cal      <= 0;
        classified_data     <= 0;
        classified_data_valid   <= 0;
        classified_data_valid_r <= 0;
        fcnn_addr           <= 0;
        clear               <= 0;
        bias_en             <= 0;
        wait_fcnn_cnt       <= 0;
        number_val          <= 0;
    end
    
    always@(posedge cmos_pclk) begin
        conv_cnt_r          <= conv_cnt;
        weight_load_addr_r  <= weight_load_addr;
        bn_load_addr_r      <= bn_load_addr;
        fcnnW_load_addr_r   <= fcnnW_load_addr;
        fcnnW_buffer_addr_r <= fcnnW_buffer_addr;
        fcnnb_load_addr_r   <= fcnnb_load_addr;
        img_out_valid_r     <= img_out_valid;
        BN_step_r2                                        <= BN_step_r;
        BN_step                                           <= BN_step_r2;
        bn_in_data_cal                                    <= (BN_step_r2 == 2)&classified_data_valid;
        poolout_data_valid_r                              <= poolout_data_valid;
        pooling1_out_valid_r                              <= pooling1_out_valid;
        conv2_inout_addr_r                                <= conv2_inout_addr;
        poolout_data_r                                    <= poolout_data;
        conv2_out_valid_r                                 <= conv2_out_valid;
        conv2_out_valid_r2                                <= conv2_out_valid_r;
        classified_data_valid_r                           <= classified_data_valid;
        sigmoid_data_valid_r                              <= sigmoid_data_valid;
        sigmoid_data_valid_r2                             <= sigmoid_data_valid_r;
        sigmoid_data_valid_r3                             <= sigmoid_data_valid_r2;
        sigmoid_data_r                                    <= sigmoid_data;
        //预载入参数
        fcnn_b[32*(fcnnb_load_addr_r+1)-1 -: 32]          <= FCNN_b;
        bn[32*(bn_load_addr_r+1)-1 -: 32]                 <= BN;
        case(load_state)
            IDLE:
            begin
                SIZE_CONV           <= SIZE_CONV1;
                SIZE_POOL           <= SIZE_POOL1;
                img_load_addr       <= 0;
                img_out_addr        <= 0;
                img_out_valid       <= 0;
                conv_cnt            <= 0;
                ci_cnt              <= 0;
                co_cnt              <= 0;
                weight_load_addr    <= 0;
                bias_load_addr      <= 0;
                bn_load_addr        <= 0;
                pooling1_in_addr    <= 0;
                conv2_inout_addr    <= 0;
                classify_ram_addr   <= 0;
                pooling_ccnt        <= 0;
                pooling1_out_ccnt   <= 0;
                pooling1_out_valid  <= 0;
                conv2_out_valid     <= 0;
                BN_step_r           <= 0;
                fcnn_addr           <= 0;
                classified_data_valid   <= 0;
                clear               <= 0;
                bias_en             <= 0;
                wait_fcnn_cnt       <= 0;
                number_val          <= 0;
                if(load_start)
                    load_state  <= LOAD_FCNNW;
            end
            //可事先缓存一部分参数
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
                    load_state      <= LOAD_BN;
                end
                else
                    fcnnb_load_addr <= fcnnb_load_addr + 1;  
            end
            LOAD_BN:
            begin
                if(bn_load_addr == 2-1) begin
                    bn_load_addr    <= 0;   
                    load_state      <= LOAD_IMG;
                end
                else
                    bn_load_addr    <= bn_load_addr + 1;  
            end
            //装载图片
            LOAD_IMG:
            begin
                img_out_addr    <= 0;
                if(mnist_data_valid) begin
                    if(img_load_addr == SIZE_CONV1*SIZE_CONV1-1) begin
                        img_load_addr   <= 0;
                        load_state      <= LOAD_LAYER1;
                    end
                    else
                        img_load_addr   <= img_load_addr + 1;
                end
            end
            LOAD_LAYER1:    //加载卷积层参数
            begin
                weights_conv[32*(conv_cnt_r+1)-1 -: 32] <= W1;
                bias_conv                               <= B1;
                SIZE_CONV                               <= SIZE_CONV1;
                SIZE_POOL                               <= SIZE_POOL1;
                if(conv_cnt == 5*5) begin
                    clear           <= 1;
                    conv_cnt        <= 0;
                    img_out_valid   <= 1;
                    load_state      <= WAIT_LAYER1;
                end
                else begin
                    conv_cnt            <= conv_cnt + 1;
                    weight_load_addr    <= weight_load_addr + 1;  
                end
                bias_load_addr  <= co_cnt;
            end
            WAIT_LAYER1:
            begin
                clear           <= 0;
                bias_en         <= (ci_cnt==0);
                //输出图像缓存
                if((img_out_addr < SIZE_CONV1*SIZE_CONV1-1) && img_out_valid)
                    img_out_addr        <= img_out_addr + 1;    
                else begin
                    img_out_addr        <= 0;  
                    img_out_valid       <= 0;
                end
                //有当前层最终输出，存储该输出
                if(poolout_data_valid) begin
                    if(pooling_ccnt == SIZE_CONV2*SIZE_CONV2-1) begin
                        pooling_ccnt    <= 0;
                        if(co_cnt==CHANNEL_CONV1-1) begin
                            conv_cnt    <= 0;
                            ci_cnt      <= 0;
                            co_cnt      <= 0;
                            bias_en     <= 0;
                            weight_load_addr    <= 0;
                            load_state  <= LOAD_LAYER2;
                        end
                        else begin
                            co_cnt      <= co_cnt + 1;
                            load_state  <= LOAD_LAYER1;
                        end
                    end
                    else
                        pooling_ccnt    <= pooling_ccnt + 1;
                    pooling1_in_addr    <= pooling1_in_addr + 1;
                end
            end
            LOAD_LAYER2:
            begin
                pooling1_in_addr    <= 0;
                weights_conv[32*(conv_cnt_r+1)-1 -: 32] <= W2;
                bias_conv                               <= B2;
                SIZE_CONV                               <= SIZE_CONV2;
                SIZE_POOL                               <= SIZE_POOL2;
                if(conv_cnt == 5*5) begin
                    clear               <= 1;
                    conv_cnt            <= 0;
                    pooling1_out_valid  <= 1;
                    load_state  <= WAIT_LAYER2;
                end
                else begin
                    conv_cnt            <= conv_cnt + 1;
                    weight_load_addr    <= weight_load_addr + 1;  
                end
                bias_load_addr  <= co_cnt;
            end
            WAIT_LAYER2:  //由于有多层输入，此处先保存卷积核2的值，累加后再统一发送给池化层
            begin
                clear           <= 0;
                bias_en         <= (ci_cnt==CHANNEL_CONV1-1);
                //输出图像缓存
                if((pooling1_out_ccnt < SIZE_CONV2*SIZE_CONV2-1) && pooling1_out_valid)
                    pooling1_out_ccnt   <= pooling1_out_ccnt + 1;   
                else begin
                    pooling1_out_valid  <= 0;
                    pooling1_out_ccnt   <= 0;  
                end
                //有当前层最终输出，存储该输出
                if(convout_data_valid) begin
                    if(conv2_inout_addr == SIZE_POOL2*SIZE_POOL2-1) begin
                        conv2_inout_addr    <= 0;
                        if(ci_cnt == CHANNEL_CONV1-1)
                            conv2_out_valid <= 1;
                        else 
                            ci_cnt      <= ci_cnt + 1;
                        //状态跳转
                        if(ci_cnt == CHANNEL_CONV1-1)
                            load_state  <= ADD_CONV2;
                        else
                            load_state  <= LOAD_LAYER2;
                    end
                    else
                        conv2_inout_addr    <= conv2_inout_addr + 1;
                end
            end
            ADD_CONV2:
            begin
                bias_en                 <= 0;
                //将数据送入pool2
                if((conv2_inout_addr < SIZE_POOL2*SIZE_POOL2-1) && conv2_out_valid)
                    conv2_inout_addr    <= conv2_inout_addr + 1;
                else begin
                    conv2_inout_addr    <= 0;
                    conv2_out_valid     <= 0;
                end
                //有当前层最终输出，存储该输出
                if(poolout_data_valid) begin
                    classify_ram_addr   <= classify_ram_addr + 1;
                    if(classify_ram_addr == (co_cnt+1)*SIZE_2FCNN*SIZE_2FCNN-1) begin
                        ci_cnt  <= 0;
                        co_cnt  <= co_cnt + 1;
                        if(co_cnt == CHANNEL_CONV2-1) begin
                            classify_ram_addr   <= 0;
                            load_state      <= LOAD_FCNN;
                        end
                        else
                            load_state      <= LOAD_LAYER2;
                    end
                end
            end
            LOAD_FCNN:
            begin
                ci_cnt  <= 0;
                co_cnt  <= 0;
                weight_load_addr    <= 0;
                classified_data_valid   <= 1;
                classified_data         <= classify_ram_data;
                if(classify_ram_addr < SIZE_2FCNN*SIZE_2FCNN*CHANNEL_CONV2-1)
                    classify_ram_addr   <= classify_ram_addr + 1;
                else begin
                    classify_ram_addr   <= 0;
                    load_state          <= LOAD_FINI;
                end
            end
            LOAD_FINI:
            begin
                classify_ram_addr       <= 0;
                classified_data         <= classify_ram_data;
                classified_data_valid   <= 0;
                if(BN_step_r == 2) 
                    load_state      <= RUN_FCNN;
                else begin
                    BN_step_r       <= BN_step_r + 1;
                    load_state      <= LOAD_FCNN;
                end
            end
            RUN_FCNN:
            begin
                classified_data     <= 0;
                if(wait_fcnn_cnt == 8'd255) begin
                    wait_fcnn_cnt   <= 0;
                    number_val      <= 1;
                    load_state      <= IDLE;
                end
                else
                    wait_fcnn_cnt   <= wait_fcnn_cnt + 1;
            end
        endcase
        if(sigmoid_data_valid) begin
            if(fcnn_addr<SIZE_FCNN-1)
                fcnn_addr   <= fcnn_addr + 1;
            else 
                fcnn_addr   <= 0;
        end
        conv2_data  <= conv2_cdata[0] + conv2_cdata[1] + conv2_cdata[2] + conv2_cdata[3] + conv2_cdata[4];
    end
    
    
    assign  pooling1_out_addr = pooling1_out_ccnt + ci_cnt*SIZE_CONV2*SIZE_CONV2;
    
    genvar  conv2_i, fcnnW_i;
    input_ram       input_ram( .clka(cmos_pclk), .addra(img_load_addr), .wea(mnist_data_valid), .dina(mnist_data),
                               .clkb(cmos_pclk), .addrb(img_out_addr),  .doutb(image_data) ); 
    layer1_ram      layer1_ram( .clka(cmos_pclk), .addra(pooling1_in_addr), .wea(poolout_data_valid&&(load_state==WAIT_LAYER1)), .dina(poolout_data),
                                .clkb(cmos_pclk), .addrb(pooling1_out_addr),  .doutb(layer1_out_data) );
    generate
    for(conv2_i=0; conv2_i<CHANNEL_CONV1; conv2_i=conv2_i+1) begin
        conv2_ram   conv2_ram(.clka(cmos_pclk), .addra(conv2_inout_addr), .wea((ci_cnt==conv2_i) && convout_data_valid), .dina(convout_data), .douta(conv2_cdata[conv2_i]));      
    end
    endgenerate                
                                
    classify_ram    classify_ram( .clka(cmos_pclk), .addra(classify_ram_addr), .wea(poolout_data_valid), .dina(poolout_data), .douta(classify_ram_data) ); 
    
    W1_blkmem   W1_blkmem( .clka(cmos_pclk), .addra(weight_load_addr), .douta(W1) );
    b1_blkmem   b1_blkmem( .clka(cmos_pclk), .addra(bias_load_addr), .douta(B1) );
    W2_blkmem   W2_blkmem( .clka(cmos_pclk), .addra(weight_load_addr), .douta(W2) );
    b2_blkmem   b2_blkmem( .clka(cmos_pclk), .addra(bias_load_addr), .douta(B2) );
    BN_blkmem   BN_blkmem( .clka(cmos_pclk), .addra(bn_load_addr), .douta(BN) );
    fcnnW_blkmem   fcnnW_blkmem( .clka(cmos_pclk), .addra(fcnnW_load_addr*SIZE_FCNN+fcnnW_buffer_addr), .douta(FCNN_W) );
    generate
    for(fcnnW_i=0; fcnnW_i<SIZE_OUT; fcnnW_i=fcnnW_i+1) begin
        fcnnW_buffer    fcnnW_buffer( .clka(cmos_pclk), .addra(fcnnW_buffer_addr_r), .wea(fcnnW_load_addr_r==fcnnW_i), .dina(FCNN_W), .clkb(cmos_pclk), .addrb(fcnn_addr),  .doutb(fcnn_W[fcnnW_i]) ); 
    end
    endgenerate
    fcnnb_blkmem   fcnnb_blkmem( .clka(cmos_pclk), .addra(fcnnb_load_addr), .douta(FCNN_b) );
    
    
    convlayer #(
        .W(5),
        .H(5))
    convlayer (                       //复用该模块
        .cmos_pclk(cmos_pclk),        //cmos pixel clock
        .clear(clear | load_start),
        //weights and bias
        .weights(weights_conv),
        .bias(bias_conv),
        .bias_en(bias_en),
        .IMAGEL(SIZE_CONV),
        .IMAGEW(SIZE_CONV),
        //mnist data
        .conv_in_data_valid(img_out_valid_r | pooling1_out_valid_r),
        .conv_in_data((load_state==WAIT_LAYER2)?layer1_out_data:{24'b0,image_data}),
        //output
        .conv_out_data_valid(convout_data_valid),
        .conv_out_data(convout_data)         
    );
    
    max_pooling #(
        .SIZE(2),
        .STRIDE(2)
    )
    max_pooling(
        .clk(cmos_pclk),
        .rstn(~(clear | load_start)),
        .LENGTH_PIC(SIZE_POOL),
        .WIDTH_PIC(SIZE_POOL),
        .din_valid((load_state==WAIT_LAYER1)?convout_data_valid:conv2_out_valid_r2),
        .din((load_state==WAIT_LAYER1)?convout_data:conv2_data),
        .dout(poolout_data),
        .dout_valid(poolout_data_valid)
    );
    
    
    batch_normalization #(
        .SIZE_FCNN(SIZE_FCNN)
    )
    batch_normalization_inst(
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        .clear(load_start),
        //parameters
        .bn(bn),
        .bn_step(BN_step),      //calculate o2 or avg
        //mnist data
        .bn_in_data_valid(classified_data_valid_r),
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
    (*use_dsp = "yes"*)reg    [31:0]   fcnn_temp   [SIZE_OUT-1:0];
    wire   [32*SIZE_OUT-1 : 0]    result_data;
    
    genvar  FCNN_CNT;
    generate
        for(FCNN_CNT=0; FCNN_CNT<SIZE_OUT; FCNN_CNT=FCNN_CNT+1) begin 
            initial begin
                fcnn_temp[FCNN_CNT] <= 0;
                fcnn_mul[FCNN_CNT]  <= 0;
                fcnn_data[FCNN_CNT] <= 0;
            end
            assign  result_data[32*(FCNN_CNT+1)-1 -: 32] = fcnn_data[FCNN_CNT];
            always@(posedge cmos_pclk) begin
                if(load_start) begin
                    fcnn_temp[FCNN_CNT] <= 0;
                    fcnn_mul[FCNN_CNT]  <= 0;
                    fcnn_data[FCNN_CNT] <= 0;
                end
                else begin
                    //if(sigmoid_data_valid_r)
                    fcnn_temp[FCNN_CNT] <= sigmoid_data_r[15:8] * (fcnn_W[FCNN_CNT][31]?{8'hff,fcnn_W[FCNN_CNT][31:8]}:{8'h0,fcnn_W[FCNN_CNT][31:8]});
                    if(sigmoid_data_valid_r2)
                        fcnn_mul[FCNN_CNT]  <= fcnn_mul[FCNN_CNT] + fcnn_temp[FCNN_CNT];
                    //if(sigmoid_data_valid_r3)
                    fcnn_data[FCNN_CNT] <= fcnn_mul[FCNN_CNT] + fcnn_b[32*(FCNN_CNT+1)-1 -: 32];
                end
            end
        end
    endgenerate
    
    wire    [31:0]  maxdata;
    
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
