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


module ShiftValueArray_tb;
    reg  clk_tb, rst_tb;
    reg [2:0] Q_tb;
    wire [4:0] out_tb [31:0];
    
    ShiftValueArray DUT(
        .Q(Q_tb),
        .out(out_tb)
    );
    
    
   task ticktock();
   begin
    #20 clk_tb = ~clk_tb;
    #20 clk_tb = ~clk_tb;
   end  
   endtask
   
   initial begin
        clk_tb = 0;
        rst_tb = 1;
//        ticktock();
//        rst_tb = 0;
        
//        while(!done_tb) begin
//            ticktock();
//        end   
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();
//        ticktock();

    Q_tb = 0;
    ticktock();
   // ticktock();
    Q_tb = 1;
    ticktock();
    ticktock();
    Q_tb = 2;
    ticktock();
    ticktock();
    Q_tb = 5; 
    ticktock();
    ticktock();
        
            
   end
   
endmodule
