`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 09:15:28 AM
// Design Name: 
// Module Name: MUX4
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


module MUX32 # (WIDTH = 32, DEPTH = 8)(
    input [DEPTH-1:0] a [WIDTH-1:0],
    input [4:0] sel,
    output [DEPTH-1:0] out
    );
    
    assign out = sel? a[sel]:a[0];
endmodule
