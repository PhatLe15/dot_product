`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 03:40:17 PM
// Design Name: 
// Module Name: dot_product_top
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


module dot_product_top# (parameter WIDTH = 2, DEPTH = 2)(
    input       [WIDTH-1:0] A  [DEPTH-1:0],
                            An [DEPTH-1:0],
                            B  [DEPTH-1:0],
    input                   go,
                            clk,
                            rst,
    output wire [WIDTH-1:0] R, 
                            Rn,
    output wire             done
    );
    
    wire load, cnt_zero, en, down, rst_DP;
    
    ControlUnit#(WIDTH) CU(.go(go),
                        .clk(clk),
                        .rst(rst),
                        .load(load),
                        .cnt_zero(cnt_zero),
                        .en(en),
                        .down(down),
                        .rst_DP(rst_DP),
                        .done(done));
                    
    DataPath#(WIDTH, DEPTH) DP(
                        .A(A),
                        .An(An),
                        .B(B),
                        .clk(clk),
                        .rst(rst_DP),
                        .load(load),
                        .cnt_zero(cnt_zero),
                        .en(en),
                        .down(down),
                        .done(done),
                        .AdotB(R),
                        .AndotB(Rn));
   
endmodule
