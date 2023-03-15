`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/05 19:07:32
// Design Name: 
// Module Name: read_write_mem_tb
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


module read_write_mem_tb();

    localparam BITW=16;
    localparam SIZE=2;
    localparam CHANNEL=10;
    localparam STRIDE=2;
    localparam LENGTH_PIC=198;  //13

    reg clk;
    reg rst;
    reg en;
    reg [CHANNEL*BITW-1 : 0] data_generator_s;
    wire [CHANNEL*BITW-1 : 0] dout;
    wire valid;
    
    initial begin
        clk <= 1'b0;
        rst <= 1'b1;
        en <= 1'b0;
        data_generator_s <= 'b0;
        
        #58;
        @(posedge clk)
            rst <= 1'b0;
        #33;
        @(posedge clk)
            en <= 1'b1;
    end
    
    /////////////////// data generator ///////////////////
    
    reg [BITW-1 : 0] data_reg [392040-1 : 0];
    reg [CHANNEL*BITW-1 : 0] data_reform [39-1 : 0];
    integer handler;
    integer cnt_in=0;
    integer cnt_out=0;
    
    // read
    initial
    begin
        $readmemh("C:/Users/xinyang.Zhang/Documents/GitHub/DNN_RTL/Pooling Max/TestBench/MaxPool_Input_Hex.txt",data_reg);
        handler = $fopen("C:/Users/xinyang.Zhang/Documents/GitHub/DNN_RTL/Pooling Max/TestBench/out.txt","w");
    end
    
    
    always@(posedge clk) begin
        if(rst || !en)
            cnt_in <= 'b0;
        else
            if(cnt_in == 392040) 
                cnt_in <= cnt_in;
            else
                cnt_in <= cnt_in + CHANNEL;
    end
    
    always@(posedge clk) begin
        if(rst || !en)
            data_generator_s <= 'b0;
        else
            if(cnt_in < 392040)
                data_generator_s <= {data_reg[cnt_in+9], data_reg[cnt_in+8], data_reg[cnt_in+7], data_reg[cnt_in+6], data_reg[cnt_in+5], data_reg[cnt_in+4], data_reg[cnt_in+3], data_reg[cnt_in+2], data_reg[cnt_in+1], data_reg[cnt_in]};
    end
    
    // write
    always@(posedge clk) begin
        if(rst || !en)
            cnt_out <= 'b0;
        else
            if(cnt_out == 9801) begin
                $fclose(handler);
                $finish;
            end
            if(valid) begin
                $fwrite(handler,"%h\n",dout);
                cnt_out <= cnt_out + 1;
            end
    end
    /////////////////// data generator ///////////////////
    
    always #10 clk <= ~clk;
    
    TOP_POOLING #(
        .BITW(BITW),
        .SIZE(SIZE),
        .CHANNEL(CHANNEL),
        .STRIDE(STRIDE),
        .LENGTH_PIC(LENGTH_PIC)
    )
    DUT(
        .clk(clk),
        .rst(rst),
        .en(en),
        .din(data_generator_s),
        .dout(dout),
        .valid(valid)
    );

endmodule
