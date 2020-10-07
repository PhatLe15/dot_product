`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 06:06:32 PM
// Design Name: 
// Module Name: shiftValue
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


module shiftValue# (parameter WIDTH = 32)(
    input   [2:0]      Q,
    input              clk, 
                       rst, 
                       load,
                       up,
    output  [4:0]      out   [WIDTH-1:0]
    );
    
    wire [4:0]      amount   [WIDTH-1:0];
    
    ShiftValueArray #(WIDTH) shiftArray(
        .Q(Q),
        .out(amount)
    );
          
    dreg #(5,WIDTH) indexA (    //4-bit since max index is 31
        .clk(clk),              //32 index
        .rst(rst),
        .load(load),
        .up(up),
        .d(amount),
        .q(out)
    );

endmodule
