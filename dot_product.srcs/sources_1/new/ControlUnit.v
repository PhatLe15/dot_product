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
    input wire go,
    input wire clk,
    input wire rst,
    input wire cnt_zero,
    output reg load,
    output reg en,
    output reg down, 
    output reg rst_DP,
    output reg done 
    );
    
    parameter S0 = 4'b00,
              S1 = 4'b01,
              S2 = 4'b10;
              
    reg [1:0] NS, CS;
    reg [WIDTH-1:0] cnt = WIDTH;
    
    
    always@(CS, go, cnt_zero)begin
        case(CS)
            S0: begin 
                    if(go) NS = S1;
                    else NS = S0; 
                end
            S1: NS = S2;
            S2: begin
                    if(cnt_zero) begin NS = S0; end
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
                    //cnt = 0;
               end
           S1:begin
                    //cnt = WIDTH-1;
                    load = 1; en = 0; down = 0; done = 0; rst_DP = 0;                  
              end 
           S2:begin
                    load = 0; en = 1; rst_DP = 0;// down = 1;// sel = sel;
                    if(cnt_zero) begin done = 1; down = 0; end
                    else begin done = 0; down = 1;    end                  
              end 
           default: begin
                    load = 0; en = 0; down = 0; done = 0; rst_DP = 0;
              end
        endcase
    end
    
              
              
endmodule
