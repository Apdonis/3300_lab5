`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2024 08:16:19 PM
// Design Name: 
// Module Name: counter_application_tb
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


module counter_application_tb(

    );
    reg clk,up,down,load,rst;
    reg [7:0] SW;
    wire [6:0] sseg;
    wire [7:0] AN;
    wire DP;
    
    counter_application uut (
        .clk(clk),
        .up(up),
        .down(down),
        .load(load),
        .rst(rst),
        .SW(SW),
        .sseg(sseg),
        .AN(AN),
        .DP(DP)
        );
        
    always begin 
        clk = 0; #5;
        clk = 1; #5;
        end
        
    initial begin
    rst = 1;
    #10;
    rst = 0;
    end
    
    initial
    #70 $finish;
    
    initial
    begin
    SW = 8'b0;
    up = 1'b0;
    down = 1'b0;
    load = 1'b0;
    
    #10
    SW = 8'b0;
    up = 1'b1;
    down = 1'b0;
    load = 1'b0;    
    
    #20
    SW = 8'b0;
    up = 1'b0;
    down = 1'b0;
    load = 1'b0;
    
    #30
    SW = 8'b0;
    up = 1'b1;
    down = 1'b0;
    load = 1'b0;
    
    #40
    SW = 8'b0;
    up = 1'b0;
    down = 1'b0;
    load = 1'b0;
    
    #50
    SW = 8'b0;
    up = 1'b1;
    down = 1'b0;
    load = 1'b0;
    
    #60
    SW = 8'b00000101;
    up = 1'b0;
    down = 1'b0;
    load = 1'b1;
    end
endmodule
