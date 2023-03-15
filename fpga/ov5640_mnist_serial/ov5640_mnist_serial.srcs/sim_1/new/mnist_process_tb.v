`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/03 23:21:13
// Design Name: 
// Module Name: mnist_process_tb
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


module mnist_process_tb();

    reg         cmos_pclk;
    reg [15:0]  cnt;
    reg [31:0]  wait_cnt;
    reg [10:0]  cnt_gap;
    reg [2:0]   state;
    reg         mnist_o_en, mnist_o_en_r;  
    reg [10:0]  mnist_addr_o;
    wire [15:0] mnist_data_o;
    reg         load_start;
    
    initial begin
        cmos_pclk       <= 0;
        cnt             <= 0;
        wait_cnt        <= 0;
        cnt_gap         <= 0;
        mnist_addr_o    <= 0;
        mnist_o_en      <= 0;
        mnist_o_en_r    <= 0;
        load_start      <= 0;
        state           <= 0;
    end

    always
    begin
        cmos_pclk       <= 1'b1;
        #2.5 cmos_pclk  <= 1'b0;
        #2.5;
    end
    always@(posedge cmos_pclk)
    begin
        mnist_o_en_r    <= mnist_o_en;
        case(state)
            0:
            begin
                if(cnt == 10) begin
                    load_start  <= 1;
                    state       <= 1;
                    cnt         <= 0;
                end
                else begin
                    cnt         <= cnt + 1;
                    load_start  <= 0;
                end
            end
            1:
            begin
                load_start  <= 0;
                if(cnt == 4094) begin
                    mnist_o_en  <= 1;
                    state       <= 2;
                    cnt         <= 0;
                end
                else begin
                    cnt         <= cnt + 1;
                    mnist_o_en  <= 0;
                end
            end
            2:
            begin
                load_start  <= 0;
                if(cnt == 27) begin
                    mnist_o_en  <= 0;
                    state       <= 3;
                    cnt         <= 0;
                end
                else begin
                    cnt             <= cnt + 1;
                    mnist_addr_o    <= mnist_addr_o + 1;
                    mnist_o_en      <= 1;
                end
            end
            3:
            begin
                load_start      <= 0;
                if(cnt == 4) begin
                    if(cnt_gap == 27) begin
                        mnist_o_en      <= 0;
                        cnt_gap         <= 0;
                        mnist_addr_o    <= 0;
                        state           <= 4;
                    end
                    else begin
                        mnist_o_en      <= 1;
                        cnt_gap         <= cnt_gap + 1;
                        mnist_addr_o    <= mnist_addr_o + 1;
                        state           <= 2;
                    end
                    cnt         <= 0;
                end
                else begin
                    cnt             <= cnt + 1;
                    mnist_o_en      <= 0;
                end
            end
            4:
            begin
                mnist_addr_o    <= 0;
                load_start  <= 0;
                mnist_o_en  <= 0;
                cnt         <= 0;
                cnt_gap     <= 0;
                if(wait_cnt == 40000-1) begin
                    state       <= 0;
                    wait_cnt    <= 0;
                end
                else
                    wait_cnt    <= wait_cnt + 1;
            end
        endcase
    end
    
    test_imgrom  test_imgrom(    
        .addra(mnist_addr_o), 
        .clka(cmos_pclk),    
        .douta(mnist_data_o)  
    ); 
    
    mnist_process   mnist_process(
        .cmos_pclk(cmos_pclk),        //cmos pxiel clock
        .load_start(load_start),
        //mnist data
        .mnist_data_valid(mnist_o_en_r),
        .mnist_data(mnist_data_o[15:8]),
        //output
        .number_o()
    );

endmodule
