`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2020 05:53:44 PM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(
    //input next, //need no more
    input clk,
    input rst,
    output wire [3:0]     instr
    );
    
    wire [31:0]     pc_current;
    wire [31:0]     pc_next;
    
     ddreg pc_reg (
            .clk            (clk),   //press button
            .rst            (rst),
            .up             (1'b1), //always increment on every clock
            .d              (pc_next),
            .q              (pc_current)
     );

    adder #(32) pc_plus_4 (
            .a              (pc_current),
            .b              (32'd4),
            .y              (pc_next)
     );
    
    imem imem(.a(pc_current[7:2]),  //fetch data from two different memfiles
              .instr(   instr)
     ); 
     
endmodule
