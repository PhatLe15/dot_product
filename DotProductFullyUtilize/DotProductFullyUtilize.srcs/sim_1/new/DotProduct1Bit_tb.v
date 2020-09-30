`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/22/2020 06:20:30 PM
// Design Name: 
// Module Name: BSI_processor_tb
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


module DotProduct1Bit_tb;
    reg  clk_tb, rst_tb;
    reg [7:0] A;
    reg [3:0] B [7:0];
    wire [3:0] out_tb;
    
    DotProduct1Bit#(4,8) DUT(   //test on 8 data points and 4bit width
        .A(A),
        .B(B),
        .out(out_tb)
    );
    
    
   task ticktock();
   begin
    #20 clk_tb = ~clk_tb;
    #20 clk_tb = ~clk_tb;
   end  
   endtask
   
   integer i;
   initial begin
        clk_tb = 0;
        rst_tb = 1;
        A = 8'b01010101;
        B[0] = 4'b0010;
        B[7] = 4'b0001;
        for(i = 1; i < 7; i = i+1)begin
            B[i] = B[i-1] + 1'b1;
        end
//        ticktock();
//        rst_tb = 0;
        
//        while(!done_tb) begin
//            ticktock();
//        end   
//        ticktock();
        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
   end
   
endmodule
