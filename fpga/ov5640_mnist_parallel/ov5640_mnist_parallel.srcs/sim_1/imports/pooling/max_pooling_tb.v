`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/10/30 09:59:08
// Design Name: 
// Module Name: TOP_POOLING_tb
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


module max_pooling_tb();

    localparam SIZE=3;
    localparam CHANNEL=1;
    localparam STRIDE=2;
    localparam LENGTH_PIC=26;  //13
    localparam DATA_MAX=1000;  // test用

    reg     clk;
    reg     rstn;
    reg     [CHANNEL*48-1 : 0] data_generator_s;
    wire    [CHANNEL*48-1 : 0] dout;
    reg     din_valid;
    wire    dout_valid;
    reg [7:0]   cnt;
    
    initial begin
        clk         <= 1'b0;
        rstn        <= 1'b0;
        din_valid   <= 1'b0;
        cnt         <= 0;
        data_generator_s <= 'b0;
        
        #58;
        rstn <= 1'b1;
    end
    
     /////////////////// data generator二选一 ///////////////////
    //第n行RAM的数据是i=i+1
    always@(posedge clk) begin
        if(~rstn) begin
            data_generator_s    <= 0;
            din_valid           <= 0;
            cnt                 <= 0;
        end
        else begin
            if(data_generator_s == DATA_MAX)
                 data_generator_s <= 0;
            else
                 data_generator_s <= data_generator_s + 1;  
            //数据valid信号间分隔
            if(cnt == 29)
                cnt     <= 0;
            else
                cnt     <= cnt + 1;
            if(cnt < LENGTH_PIC)
                din_valid   <= 1;
            else
                din_valid   <= 0;
         end
     end
    
    
    
    //随机数据
    //always@(posedge clk) data_generator_s <= {{$random}, {$random}, {$random}, {$random}, {$random}};
    
    /////////////////// data generator二选一 ///////////////////
    
    always #10 clk <= ~clk;
    
    max_pooling #(
        .SIZE(SIZE),
        .CHANNEL(CHANNEL),
        .STRIDE(STRIDE),
        .LENGTH_PIC(LENGTH_PIC)
    )
    DUT(
        .clk(clk),
        .rstn(rstn),
        .din_valid(din_valid),
        .din(data_generator_s),
        .dout(dout),
        .dout_valid(dout_valid)
    );

endmodule
