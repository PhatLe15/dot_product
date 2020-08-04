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


module CU_tb;
    reg go_tb;
    reg clk_tb;
    reg rst_tb;
    reg cnt_zero_tb;
    wire load_tb;
    wire en_tb;
    wire down_tb;
    //wire [1:0] sel_tb;
    wire done_tb;
    
    
    ControlUnit#(3) DUT(.go(go_tb),
                        .clk(clk_tb),
                        .rst(rst_tb),
                        .load(load_tb),
                        .cnt_zero(cnt_zero_tb),
                        .en(en_tb),
                        .down(down_tb),
                        .done(done_tb));
    task tick;
        begin
            #5 clk_tb = ~clk_tb;
            #5 clk_tb = ~clk_tb;
        end
    endtask
                    
    initial begin
        go_tb = 0;
        clk_tb = 1;
        rst_tb = 1;
        tick();
        rst_tb = 0;
        go_tb = 1;
        tick();
        go_tb = 0;
        cnt_zero_tb = 0;
        tick();
        
        cnt_zero_tb = 0;
        tick();
        cnt_zero_tb = 1;
        tick();
        tick();
        tick();
        tick();
        tick();
    end                    
     
endmodule
