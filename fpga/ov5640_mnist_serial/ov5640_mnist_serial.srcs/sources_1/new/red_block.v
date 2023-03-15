`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/27 17:30:38
// Design Name: 
// Module Name: red_block
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


module red_block(
	input                cmos_vsync,       //cmos vsync
    input                cmos_href,        //cmos hsync refrence
    input                                        cmos_pclk,        //cmos pxiel clock
    input   [9:0]        cmos_d,           //cmos data
    input   [3:0]                                number_i,         //predicted number
    //output
    output reg                                  cmos_vsync_o,       //cmos vsync
    output reg                                  cmos_href_o,        //cmos hsync refrence
    output reg [9:0]                            cmos_d_o,           //cmos data
    //mnist
    output reg                                  mnist_en,
    output reg                                  mnist_start,
    output reg                                  load_start
    );
    
    reg [15:0]  h_cnt, v_cnt;
    reg [5:0]   f_cnt;

    initial begin
        h_cnt   <= 0;
        v_cnt   <= 0;
        f_cnt   <= 0;
        mnist_en    <= 0;
        mnist_start <= 0;
        load_start  <= 0;
    end 
    
    always@(posedge cmos_pclk)
    begin
        cmos_vsync_o <= cmos_vsync;
        cmos_href_o <= cmos_href;
        //red block: 448p*448p
        if((v_cnt>=131 && v_cnt<136) || (v_cnt>=584 && v_cnt<589)) begin
            if(h_cnt>=1454 && h_cnt<=2370)
                cmos_d_o <= h_cnt[0]?10'b0001111100:10'b0;  //red block horizontal
            else
                cmos_d_o <= cmos_d;
        end
        else if(v_cnt>=136 && v_cnt<584) begin
            if((h_cnt>=1454 && h_cnt<1464) || (h_cnt>=2360 && h_cnt<2370)) begin
                mnist_en    <= 0;
                cmos_d_o    <= h_cnt[0]?10'b0001111100:10'b0;  //red block vertical
            end
            else if(h_cnt>=1464 && h_cnt<2360) begin       //inside red block is gray
                mnist_en    <= 1;
                cmos_d_o    <= cmos_d;
            end
            else begin
                mnist_en    <= 0;
                cmos_d_o    <= cmos_d;
            end
        end
        else begin
            mnist_en    <= 0;
            cmos_d_o    <= cmos_d;
        end
        //mnist calculate start
        if(h_cnt==2370 && v_cnt==590)
            mnist_start <= 1;
        else
            mnist_start <= 0;
        if(h_cnt==2370 && v_cnt==600) begin
            if(f_cnt == 29) begin
                load_start  <= 1;
                f_cnt       <= 0;
            end
            else
                f_cnt       <= f_cnt + 1;
        end
        else 
            load_start  <= 0;
        
        //pixel counter
        if(cmos_href)
            h_cnt   <= h_cnt + 1;
        else
            h_cnt   <= 0;
        //line counter
        if(cmos_vsync)
            v_cnt   <= 0;
        else if(~cmos_href && cmos_href_o)
            v_cnt   <= v_cnt + 1;
    end
    
endmodule
