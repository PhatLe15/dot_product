`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 05:02:25 PM
// Design Name: 
// Module Name: AindexSelector
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


module AindexSelector# (parameter WIDTH = 32)(
    //input   [2:0]      Q,
    input              clk, 
                       rst, 
                       load,
                       up,
    output  [4:0]      out   [WIDTH-1:0]
    );
    
    wire [4:0]      index   [WIDTH-1:0];
    
    AindexArray #(WIDTH) indexArray(
        .Q(3'b000),
        .out(index)
    );
          
    dreg #(5,WIDTH) indexA (    //4-bit since max index is 31
        .clk(clk),              //32 index
        .rst(rst),
        .load(load),
        .up(up),
        .d(index),
        .q(out)
    );

endmodule
