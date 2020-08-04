`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2020 03:52:23 PM
// Design Name: 
// Module Name: CU_tb
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


module dot_product_tb;
    reg     [2:0] A     [1:0];
    reg     [2:0] An    [1:0];
    reg     [2:0] B     [1:0];
    reg           go_tb;
    reg           clk_tb;
    reg           rst_tb;
    wire    [2:0] R_tb, 
                  Rn_tb;
    wire done_tb;
    
    
    dot_product_top#(3,2) DUT(
                        .go(go_tb),
                        .clk(clk_tb),
                        .rst(rst_tb),
                        .A(A),
                        .An(An),
                        .B(B),
                        .done(done_tb),
                        .R(R_tb),
                        .Rn(Rn_tb));
    task tick;
        begin
            #5 clk_tb = ~clk_tb;
            #5 clk_tb = ~clk_tb;
        end
    endtask
                            
    initial begin
        A[0]= 3'b000;
        A[1]= 3'b001;
        An[0]= 3'b001;
        An[1]= 3'b011;
        B[0]= 3'b011;
        B[1]= 3'b001;
        go_tb = 0;
        clk_tb = 1;
        //rst_tb = 1;
        tick();
        //rst_tb = 0;
        go_tb = 1;
        tick();
        //go_tb = 0;
        tick();
        tick();
        tick();
        //        rst_tb =1;
        tick();
        //        rst_tb =0;
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        tick();
        $finish;
    end                    
     
endmodule
