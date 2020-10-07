`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 10:25:13 AM
// Design Name: 
// Module Name: outputBuffer
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


module outputBuffer # (parameter WIDTH = 32)(
        input  wire             clk,
        input  wire             rst,
        input  wire             load,
        input  wire [WIDTH-1:0] d,
        output reg  [WIDTH-1:0] q 
    );
    
    always @ (posedge clk, posedge rst) begin
        if (rst)        q <= 0;
        else if(load)   q <= d;
        else            q <= q; 
    end

endmodule
