`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2020 07:49:16 PM
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


module ControlUnit#(parameter WIDTH = 3)(
    input  wire go, // the dot product only happen when go is asserted.
    input  wire clk,
    input  wire rst,
    input  wire cnt_zero,  //flag to check if the index = 0
    output reg  load,  //load the input register
    output reg  en,    //load the result register 
    output reg  down,  //decrement the index serial for A and An
    output reg  rst_DP,
    output reg  done 
    );
    
    parameter S0 = 4'b00,    //IDLE state                      //ignore the yellow warning on this line
              S1 = 4'b01,   // LOAD state                     
              S2 = 4'b10;   //Calculation state
              
    reg [1:0] NS, CS;
    reg [WIDTH-1:0] cnt = WIDTH;
    
    
    always@(CS, go, cnt_zero)begin
        case(CS)
            S0: begin 
                    if(go) NS = S1;  // go to next state if go is pressed
                    else NS = S0; 
                end
            S1: NS = S2;
            S2: begin
                    if(cnt_zero) begin NS = S0; end // continue calculation until index is zero
                    else NS = S2;
                end
           default: NS = S0; 
        endcase
    end
    
    always@(posedge clk, posedge rst) begin
        if(rst) CS <= S0;
        else    CS <= NS;
    end
    
    always@(CS, cnt_zero)begin
        case(CS)
           S0:begin
                    load = 0; en = 0; down = 0; done = 0; rst_DP = 1;
               end
           S1:begin
                    load = 1; en = 0; down = 0; done = 0; rst_DP = 0;                  
              end 
           S2:begin
                    load = 0; en = 1; rst_DP = 0;
                    if(cnt_zero) begin done = 1; down = 0; end
                    else         begin done = 0; down = 1; end   //down to countdown the index of serial inputs               
              end 
           default: begin
                    load = 0; en = 0; down = 0; done = 0; rst_DP = 0;
              end
        endcase
    end
    
              
              
endmodule
