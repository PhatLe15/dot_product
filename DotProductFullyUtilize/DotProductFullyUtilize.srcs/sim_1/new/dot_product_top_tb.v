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


module dot_product_top_tb;  //for now just test for 4bit quantization
    reg  clk_tb, rst_tb;
    reg load;
    reg [2:0] Q;
    reg [7:0] A [7:0];
    reg [7:0] qB [7:0];
    wire [7:0] result;
    
    dot_product_top#(8,8) DUT(   //test on 8 data points and 4bit width
        .clk(clk_tb),
        .rst(rst_tb),
        .load(load),
        .A(A),
        .qB(qB),
        .Q(Q),
        .Result(result)
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
        Q = 3'b011;  //select 4 bit quantization
        A[0] = 8'b0001;
        for(i = 1; i < 8; i = i+1)begin
            A[i] = A[i-1] + 1'b1;
        end
        
        qB[0] = 8'b0010;
        qB[7] = 8'b0001;
        for(i = 1; i < 7; i = i+1)begin
            qB[i] = qB[i-1] + 1'b1;
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
