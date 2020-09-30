`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2020 02:22:31 PM
// Design Name: 
// Module Name: DotProduct1Bit
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


module DotProduct1Bit# (parameter WIDTH = 32, DEPTH = 8)(
    input  [DEPTH-1:0] A,
    input  [WIDTH-1:0] B  [DEPTH-1:0],
    output [WIDTH-1:0] out
    );
    
    
    wire [WIDTH-1:0] BandA [DEPTH-1:0];
    generate
        genvar i;
        for(i = 0 ; i < DEPTH; i = i+1)begin
            AND #(WIDTH) BandA (
                .a({WIDTH{A[i]}}),
                .b(B[i]),
                .y(BandA[i])
            );
        end
    endgenerate
    
    combine #(WIDTH, DEPTH) combine(
        .a(BandA),
        .y(out)
    );   
endmodule
