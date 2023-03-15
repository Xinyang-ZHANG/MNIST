`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/12 12:01:58
// Design Name: 
// Module Name: batch_normalization
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


module batch_normalization#(
    parameter integer SIZE_FCNN = 4*4*10
    )(
    input                                       cmos_pclk,        //cmos pxiel clock
    //parameters
    input   [48*2-1:0]                          bn,              // gamma, beta
    input   [1:0]                               bn_step,
    //mnist data
    input                                       bn_in_data_valid,
    input                                       bn_in_data_cal,
    input   [47:0]                              bn_in_data,
    //output
    output  reg                                 bn_out_data_valid,
    output  reg[47:0]                           bn_out_data       
    );
    
    wire    [47:0]  gamma  = bn[47:0];
    wire    [47:0]  beta   = bn[95:48];
    (*use_dsp = "yes"*)wire    [47:0]  gamma_xhat;
    
    //code c++
    /*
    //u
    x.u = 0;
    for(int i=0; i<x.L; i++)
        x.u += x.data[i];
    x.u = x.u / x.L;
    //o2
    x.o2 = 0;
    for(int i=0; i<x.L; i++)
        x.o2 += (x.data[i]-x.u)*(x.data[i]-x.u);
    x.o2 = x.o2 / x.L;
    cout << x.o2 << endl;
    //xhat
    for(int i=0; i<x.L; i++) {
        x.xhat[i] = (x.data[i] - x.u) / sqrt(x.o2 + 0.0001);
        x.data[i] = x.gamma * x.xhat[i] + x.beta;
    }
    */
    
    (*use_dsp = "yes"*)reg [63:0]  u_add;
    (*use_dsp = "yes"*)reg [47:0]  u;
    (*use_dsp = "yes"*)wire[47:0]  d_minus_u; 
    (*use_dsp = "yes"*)reg [95:0]  o2_add;
    (*use_dsp = "yes"*)reg [47:0]  o2;
    
    (*use_dsp = "yes"*)wire[31:0]  o2_f;
    (*use_dsp = "yes"*)wire[31:0]  d_minus_u_f;
    (*use_dsp = "yes"*)wire        d_minus_u_val_f;
    (*use_dsp = "yes"*)wire[31:0]  xhat_f;
    (*use_dsp = "yes"*)wire[47:0]  xhat;
    (*use_dsp = "yes"*)wire        xhat_f_val, xhat_val;
    
    assign  d_minus_u = bn_in_data - u;
    
    fix_float   fix_float_bndata(
        .aclk(cmos_pclk),
        .s_axis_a_tdata(d_minus_u),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(bn_in_data_cal),
        .m_axis_result_tdata(d_minus_u_f),
        .m_axis_result_tvalid(d_minus_u_val_f)
    );
    
    fix_float   fix_float_o2(
        .aclk(cmos_pclk),
        .s_axis_a_tdata(o2),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(1),
        .m_axis_result_tdata(o2_f),
        .m_axis_result_tvalid()
    );
    
    float_div   float_div(
        .aclk(cmos_pclk),
        .s_axis_a_tdata(d_minus_u_f),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(d_minus_u_val_f),
        .s_axis_b_tdata(o2_f),
        .s_axis_b_tready(),
        .s_axis_b_tvalid(d_minus_u_val_f),
        .m_axis_result_tdata(xhat_f),
        .m_axis_result_tvalid(xhat_f_val)
    );
    
    float_fix   float_fix(
        .aclk(cmos_pclk),
        .s_axis_a_tdata(xhat_f),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(xhat_f_val),
        .m_axis_result_tdata(xhat),
        .m_axis_result_tvalid(xhat_val)
    );
    
    initial begin
        u_add           <= 0;
        u               <= 0;
        o2_add          <= 0;
        o2              <= 0;
    end
    
    always@(posedge cmos_pclk) begin
        u   <= u_add/SIZE_FCNN;
        o2  <= o2_add/SIZE_FCNN;  //慢2拍
        if(bn_in_data_valid) begin
            if(bn_step == 0) begin
                if(bn_in_data[47])
                    u_add   <= u_add - (~bn_in_data+1);
                else
                    u_add   <= u_add + bn_in_data;
            end
            else if(bn_step == 1) begin
                if(d_minus_u[47])  //将方差加0.0001开方直接替换为标准差方便运算
                    o2_add  <= o2_add + {48'h0,(~d_minus_u+1)};  //o2 += abs(x.data[i]-x.u)
                else
                    o2_add  <= o2_add + d_minus_u;
            end
        end
        //最终运算
        bn_out_data         <= (gamma_xhat[47]?{16'hffff,gamma_xhat[47:16]}:{16'h0,gamma_xhat[47:16]}) + beta;
        bn_out_data_valid   <= xhat_val;
    end
    
    assign  gamma_xhat = gamma * xhat;
    
endmodule
