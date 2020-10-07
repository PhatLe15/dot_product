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


module transposer_tb;
    reg  clk_tb, rst_tb;
    reg  load;
    reg  [3:0] d [7:0];
    wire [7:0] q [3:0];
    
    transposer#(4,8) DUT(   //test on 8 data points and 4bit width
        .clk(clk_tb),
        .rst(rst_tb),
        .load(load),
        .d(d),
        .q(q)
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
        load = 1;
        d[0] = 8'b00000001;
        for(i = 1; i < 8; i = i+1)begin
            d[i] = d[i-1] + 1'b1;
        end
        ticktock();
        rst_tb = 0;
        
//        while(!done_tb) begin
//            ticktock();
//        end   
//        ticktock();
        ticktock();
        load = 0;
        ticktock();
        rst_tb = 1;
        ticktock();
        ticktock();
        ticktock();
        ticktock();
   end
   
endmodule
