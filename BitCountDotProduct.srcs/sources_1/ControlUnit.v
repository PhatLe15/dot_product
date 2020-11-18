`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 04:43:09 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input wire [3:0] instr,
    output wire      load,
    output wire      up,
    output wire      enResult,
    output wire      done,
    output wire     down
    );
    
    reg [3:0] ctrl;
    assign {load, up, done, enResult} = ctrl;
    
    always@(*)begin
        case(instr)
            2'b00: ctrl = 4'b0_0_0_0; // NOP
            2'b01: ctrl = 4'b1_0_0_0;//LOAD memfile->input buffer  1 cycle required
            2'b10: ctrl = 4'b0_1_0_1; //EXE
            2'b11: ctrl = 4'b0_1_1_0; //DONE
            default: ctrl = 4'b0_0_0_0; //NOP
        endcase
    end
      
endmodule
