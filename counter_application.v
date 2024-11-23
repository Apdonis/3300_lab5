`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 08:52:18 PM
// Design Name: 
// Module Name: counter_application
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


module counter_application(
    input clk, up,down, load,rst_n,
    input [7:0] SW,
    output [6:0] sseg,
    output [7:0] AN,
    output DP
    );
    wire rst_but,load_but,up_but,down_but;
    wire [7:0] count_out;
    wire [11:0] bcd;
    wire [5:0] i1,i2,i3,i4;
    wire count_en;
    
      button downbut (
    .clk(clk),
    .in(down),
    .out(down_but)
    );

   button upbut (
    .clk(clk),
    .in(up),
    .out(up_but)
    );    
   button loadbut (
    .clk(clk),
    .in(load),
    .out(load_but)
    );     
    
    
    
        
    udl_counter #(.BITS(8)) count (
        .clk(clk),
        .reset_n(rst_n),
        .enable(up_but | down_but | load_but),
        .up(up_but),
        .load(load_but),
        .D(SW),
        .Q(count_out)
        );
        
    bin2bcd b2b (
        .bin(count_out),
        .bcd(bcd)
        );
    
    wire [5:0] I0,I1,I2;
    assign I0[5:0] = {1'b1, bcd[3:0],1'b1};
    assign I1[5:0] = {1'b1, bcd[7:4],1'b1};
    assign I2[5:0] = {1'b1, bcd[11:8],1'b1};
    
    sseg_driver ssegd (
        .in0(I0),
        .in1(I1),
        .in2(I2),
        .in3(6'b000000),
        .in4(6'b000000),
        .in5(6'b000000),
        .in6(6'b000000),
        .in7(6'b000000),
        .clk(clk),
        .sseg(sseg),
        .AN(AN),
        .DP(DP)
        );       
  
   
   
           
endmodule