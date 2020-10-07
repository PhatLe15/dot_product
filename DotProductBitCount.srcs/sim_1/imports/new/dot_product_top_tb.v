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
    reg up;
    reg enResult;
    reg [31:0] A [7:0];
    reg [31:0] B [7:0];
    wire [31:0] result;
    
    dot_product_top#(32,8) DUT(   //test on 8 data points and 4bit width
        .clk(clk_tb),
        .rst(rst_tb),
        .load(load),
        .up(up),
        .A(A),
        .B(B),
        .Q(Q),
        .enResult(enResult),
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
        clk_tb = 1;
        rst_tb = 1;
        load = 0;
        up = 0;
        enResult = 1;
        Q = 3'b010;  //select 4 bit quantization 4cycle
        A[0] = 8'b0000;
        for(i = 1; i < 8; i = i+1)begin
            A[i] = A[i-1] + 1'b1;
        end
        
        B[0] = 8'b0001;
        for(i = 1; i < 8; i = i+1)begin
            B[i] = B[i-1] + 1'b1;
        end
        
        ticktock();
        load = 1;
        rst_tb = 0;
        ticktock();
        up = 1;
        load = 0;
        
//        while(!done_tb) begin
//            ticktock();
//        end   
//        ticktock();   

//0 result                   
        ticktock();// 1st cycle             
        // 1 result 
        ticktock();//2nd cyccle      
        // 2 result
        ticktock();//3rd cycle       
        // 3
        ticktock();//4th cycle  output cycle

        ticktock();
        //up = 0;
        //rst_tb = 0;
        ticktock();
   end
   
endmodule
