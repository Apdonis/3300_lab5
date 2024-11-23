`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 06:32:34 PM
// Design Name: 
// Module Name: sseg_driver_tb
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


module sseg_driver_tb(

    );
    
    reg [5:0] in0,in1,in2,in3,in4,in5,in6,in7;
    reg clk,rst;
    wire [6:0] sseg;
    wire DP;
    wire [7:0] AN;
    wire count_en;
    wire [2:0] count_out;
    wire [5:0] D_out;
    
    sseg_driver uut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),
        .clk(clk),
        .rst(rst),
        .sseg(sseg),
        .DP(DP),
        .AN(AN),
        .count_en(count_en),
        .count_out(count_out),
        .D_out(D_out)
        );
        
       always begin
            clk = 0; #5;
            clk = 1; #5;
            end
       
       initial begin
        rst = 1;
        #10;
        rst=0;
        end
        
       initial 
       #1100 $finish;
       
       initial
       begin
       
       in0 = 6'd0;
       in1 = 6'd1;
       in2 = 6'd2;
       in3 = 6'd3;
       in4 = 6'd4;
       in5 = 6'd5;
       in6 = 6'd6;
       in7 = 6'd7;
       end
    
endmodule
