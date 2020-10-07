`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 03:19:23 PM
// Design Name: 
// Module Name: bitCounter
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


module bitCounter# (parameter DEPTH = 8)(
    input [DEPTH-1:0] a,
    output reg [DEPTH-1:0] y
    );
    integer i;
    always@(*) begin
        y = 0;  //initialize count
        for(i = 0; i< DEPTH; i = i + 1)begin  //run all the bit
            y = y + a[i];  //add the bit to count
        end
    end
endmodule
