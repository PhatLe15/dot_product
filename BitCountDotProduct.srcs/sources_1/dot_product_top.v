`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  San Jose State University
// Engineer: Phat Le
// 
// Create Date: 08/31/2020 09:04:55 AM
// Design Name: BSI Dot Product using Bit Count algorithm
// Module Name: dot_product_top
// Project Name:    BSI DNN
// Target Devices: BSI Dot Product 
// Tool Versions:  1.0
// Description:  
// 
// Dependencies: 
// 
// Revision: 10/6/2020
// Revision 1.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dot_product_top # (parameter WIDTH = 32, DEPTH = 8)(
//        input  [WIDTH-1:0] A  [DEPTH-1:0],
//        input  [WIDTH-1:0] B  [DEPTH-1:0],
      //  input   [2:0]      Q,
        input                   clk,
                                rst,
        output wire [WIDTH-1:0] Result,
        output wire             done
        
    );
    
    wire                   load,
                           up,
                           enResult;
    wire  [3:0]            instr;
    
    wire  [WIDTH-1:0] A  [DEPTH-1:0],
                      B  [DEPTH-1:0];
    dmem dmemA(
        //.addr(addr),
        //.dataA(A),
        .dataA(A)  
    );
     
    dmemB dmemB(
        //.addr(addr),
        //.dataA(A),
        .dataB(B)  
    );
    
    InstructionMem imem(.clk(clk),
                        .rst(rst),
                        .instr(instr));
                        
    ControlUnit CU(.instr(instr),
                   .load(load),
                   .enResult(enResult),
                   .done(done),
                   .up(up)
    );
    
    DataPath DP(
        .A(A),
        .B(B),
        .clk(clk),
        .rst(rst),
        .load(load),
        .up(up),
        .enResult(enResult),
        .done(done),
        .Result(Result)
    );
    
endmodule
