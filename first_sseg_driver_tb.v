`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 08:05:37 PM
// Design Name: 
// Module Name: first_sseg_driver_tb
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


module first_sseg_driver_tb(

    );
    
    reg clk,rst;
    wire [6:0] sseg;
    wire [7:0] ad;
    wire dp;
    
    first_sseg_driver_test uut (
        .clk(clk),
        .rst(rst),
        .sseg(sseg),
        .ad(ad),
        .dp(dp)
        );
        
    always begin
    clk = 0; #5;
    clk = 1; #5;
    end
    
    initial begin
    rst = 0;
    end
    
    initial
    #70 $finish;
    
  
        
endmodule
