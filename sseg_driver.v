`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 06:03:26 PM
// Design Name: 
// Module Name: sseg_driver
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


module sseg_driver(
    input [5:0] in0,in1,in2,in3,in4,in5,in6,in7,
    input clk,
    output [6:0] sseg,
    output DP,
    output [7:0] AN   
    );
    wire count_en;
    wire [2:0] count_out;
    wire [5:0] D_out;
    wire [7:0] cathode;
    
    timer_parameter #(.FINAL_VALUE(1100))timer (
        .clk(clk),
        .reset_n(1'b1),
        .enable(1'b1),
        .done(count_en)
        );
        
    udl_counter #(.BITS(3)) count (
        .clk(clk),
        .reset_n(1'b1),
        .enable(count_en),
        .up(1'b1),
        .load(1'b0),
        .D(3'b000),
        .Q(count_out)
        );
    
    
        
    mux_8x1_nbit #(.n(6)) mux (
       .s(count_out),
       .I0(in0),
       .I1(in1),
       .I2(in2),
       .I3(in3),
       .I4(in4),
       .I5(in5),
       .I6(in6),
       .I7(in7),
       .out(D_out[5:0])
       );
   
   decoder_generic dec (
        .w(count_out),
        .en(D_out[5]),
        .y(cathode)
        ); 
   
   assign AN[0] = ~cathode[0];
   assign AN[1] = ~cathode[1];
   assign AN[2] = ~cathode[2];
   assign AN[3] = ~cathode[3];
   assign AN[4] = ~cathode[4];
   assign AN[5] = ~cathode[5];
   assign AN[6] = ~cathode[6];
   assign AN[7] = ~cathode[7];
   
   hex2sseg h2sseg (
       .hex(D_out[4:1]),
       .sseg(sseg)
       );    
   
   assign DP = D_out[0]; 
    //create a 6-bit 8x1 mux    

endmodule
