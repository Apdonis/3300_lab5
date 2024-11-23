`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 07:23:39 PM
// Design Name: 
// Module Name: mux_8x1_nbit
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


module mux_8x1_nbit
    #(parameter n=6)(
    input [2:0] s,
    input [n-1:0] I0,I1,I2,I3,I4,I5,I6,I7,
    output reg [n-1:0] out
    );
    
    always @(I0,I1,I2,I3,I4,I5,I6,I7,s)
    begin
        case(s)
            3'b000: out = I0;
            3'b001: out = I1;
            3'b010: out = I2;
            3'b011: out = I3;
            3'b100: out = I4;
            3'b101: out = I5;
            3'b110: out = I6;
            3'b111: out = I7;
            default: out = 'bx;
            endcase
            end
endmodule
