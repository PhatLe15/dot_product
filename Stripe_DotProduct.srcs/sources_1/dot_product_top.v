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


module dot_product_top# (parameter WIDTH = 32, DEPTH = 8)(
    //input       [WIDTH-1:0] A  [DEPTH-1:0],
    //                        B  [DEPTH-1:0],
    input                   //go,
                            clk,
                            rst,
    output wire [WIDTH-1:0] R,  
    output wire             done
    );
    
    wire load, cnt_zero, en, down, rst_DP;
    wire [3:0] instr;
    
    wire       [WIDTH-1:0] A  [DEPTH-1:0],
                           B  [DEPTH-1:0];
//    ControlUnit#(WIDTH) CU(.go(go),
//                        .clk(clk),
//                        .rst(rst),
//                        .load(load),
//                        .cnt_zero(cnt_zero),
//                        .en(en),
//                        .down(down),
//                        .rst_DP(rst_DP),
//                        .done(done));
    Amem dmemA(
        //.addr(addr),
        //.dataA(A),
        .dataA(A)  
    );
     
    Bmem dmemB(
        //.addr(addr),
        //.dataA(A),
        .dataB(B)  
    );
    
    InstructionMem imem(.clk(clk),
                        .rst(rst),
                        .instr(instr));

    ControlUnit CU(.instr(instr),
                   .load(load),
                   .en(en),
                   .done(done),
                   .down(down)
    );
                    
    DataPath#(WIDTH, DEPTH) DP(
                        .A(A),
                        .B(B),
                        .clk(clk),
                        .rst(rst),
                        .load(load),
                        //.cnt_zero(cnt_zero),
                        .en(en),
                        .down(down),
                        .done(done),
                        .AdotB(R));
   
endmodule
