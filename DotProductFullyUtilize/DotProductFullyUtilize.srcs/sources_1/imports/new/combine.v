`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2020 05:23:30 PM
// Design Name: 
// Module Name: combine
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


module combine# (parameter WIDTH = 32, DEPTH = 8)(
        input  wire [WIDTH-1:0] a [DEPTH-1:0],
        output reg  [WIDTH-1:0] y
    );

    integer i;
    always@(*)begin
        y = 0;
        for(i = 0; i< DEPTH; i = i + 1)begin
            y = y + a[i];
        end
    end
endmodule
