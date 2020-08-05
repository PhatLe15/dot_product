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


module dot_product_tb#(parameter WIDTH = 4) ;
    reg     [WIDTH-1:0] A     [1:0];
    reg     [WIDTH-1:0] An    [1:0];
    reg     [WIDTH-1:0] B     [1:0];
    reg           go_tb;
    reg           clk_tb;
    reg           rst_tb;
    wire    [WIDTH-1:0] R_tb, 
                  Rn_tb;
    wire          done_tb;
    reg     [WIDTH-1:0] ExpectedR,
                        ExpectedRn;
    
    dot_product_top#(WIDTH,2) DUT(   //the WIDTH is adjustable to fit the input data width
                        .go(go_tb),
                        .clk(clk_tb),
                        .rst(rst_tb),
                        .A(A),
                        .An(An),
                        .B(B),
                        .done(done_tb),
                        .R(R_tb),
                        .Rn(Rn_tb));
    task tick; //ise as manual clock
        begin
            #5 clk_tb = ~clk_tb;
            #5 clk_tb = ~clk_tb;
        end
    endtask
    
    task go; //ise as manual clock
        begin
            go_tb = ~go_tb;
            tick();
            go_tb = ~go_tb;
            tick();
        end
    endtask   
    
    integer errors;                        
    initial begin   

        // initialization
        A[0]= 3'b0000;
        A[1]= 3'b0001;
        An[0]= 3'b0001;
        An[1]= 3'b0011;
        B[0]= 3'b0011;
        B[1]= 3'b0001;
        ExpectedR  = A[0] * B[0] + A[1]* B[1];
        ExpectedRn = An[0] * B[0] + An[1]* B[1];
        go_tb = 0;
        clk_tb = 0;
        tick();
        errors = 0; //no errors
        //begin the test
        go();
        while(!done_tb) begin
            tick();
        end
        
        if(ExpectedR == R_tb)begin
            errors = errors +1;
        end
        
        if(ExpectedRn == Rn_tb)begin
            errors = errors +1;
        end
        
        tick();
        tick();
        tick();
        tick();
        
        A[0]= 3'b0010;
        A[1]= 3'b0011;
        An[0]= 3'b0011;
        An[1]= 3'b0001;
        B[0]= 3'b0011;
        B[1]= 3'b0010;
        ExpectedR  = A[0] * B[0] + A[1]* B[1];
        ExpectedRn = An[0] * B[0] + An[1]* B[1];
        tick();
        go();
        while(!done_tb) begin
            tick();
        end
        
        if(ExpectedR == R_tb)begin
            errors = errors +1;
        end
        
        if(ExpectedRn == Rn_tb)begin
            errors = errors +1;
        end
        
        $finish;
        
    end                    
     
endmodule
