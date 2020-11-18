`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 04:30:27 PM
// Design Name: 
// Module Name: inputBuffer
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


module inputBuffer # (parameter WIDTH = 32, DEPTH = 8)(
    input   clk,rst, load,
    input  [WIDTH-1:0] A  [DEPTH-1:0],
    input  [WIDTH-1:0] B  [DEPTH-1:0],
    output  [DEPTH-1:0] qA  [WIDTH-1:0],
    output  [DEPTH-1:0] qB  [WIDTH-1:0]
    );
    
    transposer#(WIDTH, DEPTH) transposerA(
        .clk(clk),
        .rst(rst),
        .load(load),
        .d(A),
        .q(qA)
    );
    
    transposer#(WIDTH, DEPTH) transposerB(
        .clk(clk),
        .rst(rst),
        .load(load),
        .d(B),
        .q(qB)
    );
    
endmodule
