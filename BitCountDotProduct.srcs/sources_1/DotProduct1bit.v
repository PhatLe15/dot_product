`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 10:40:35 AM
// Design Name: 
// Module Name: DotProduct1bit
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


module DotProduct1bit# (parameter WIDTH = 32, DEPTH = 8)(
    input   [DEPTH-1:0] A [WIDTH-1:0], 
    input   [DEPTH-1:0] B,
    input   [4:0]       Aindex,       //4 bit since the max is 31th index 
                        shiftAmount,                         // or 31-bit shift left
    output  [WIDTH-1:0] out    
    );
    
    wire [DEPTH-1:0] muxA;    //mux output
    wire [DEPTH-1:0] AandB;   //AND output
    wire [DEPTH-1:0] bitCount;//bitcount output
    
            MUX32 #(WIDTH, DEPTH) MUX32 (       //each slice is determine by the array
                .a(A),
                .sel(Aindex),
                .out(muxA)
            );
            
            AND #(DEPTH) AND ( //8 bit AND operation
                .a(muxA),
                .b(B),
                .y(AandB)
            );
            
            bitCounter #(DEPTH) bitcounter ( //counting 1 from each slices
                .a(AandB),
                .y(bitCount)
            );
            
            shifter #(WIDTH) shifter(  //expected 32 bit to preserve
                .a({24'b0,bitCount}),  //pad 0 before shift to preserve data
                .amount(shiftAmount),  
                .y(out)
            );
endmodule
