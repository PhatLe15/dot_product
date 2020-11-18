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


module dot_product_tb#(parameter WIDTH = 32, DEPTH = 8) ;
    reg     [WIDTH-1:0] A     [DEPTH-1:0];
    reg     [WIDTH-1:0] B     [DEPTH-1:0];
    reg           go_tb;
    reg           clk_tb;
    reg           rst_tb;
    wire    [WIDTH-1:0] R_tb;
    wire          done_tb;
    reg     [WIDTH-1:0] ExpectedR;
    
    dot_product_top#(WIDTH,DEPTH) DUT(   //the WIDTH is adjustable to fit the input data width
                        //.go(go_tb),
                        .clk(clk_tb),
                        .rst(rst_tb),
                        //.A(A),
                        //.B(B),
                        .done(done_tb),
                        .Result(R_tb));
    task tick; //ise as manual clock
        begin
            #5 clk_tb = ~clk_tb;
            #5 clk_tb = ~clk_tb;
        end
    endtask
    
//    task go; //ise as manual clock
//        begin
//            go_tb = ~go_tb;
//            tick();
//            go_tb = ~go_tb;
//            tick();
//        end
//    endtask   
    
    integer errors;                        
    initial begin   

        // initialization
        A[0]= 32'h11111111;
        A[1]= 32'h22222222;
        A[2]= 32'h33333333;//FFFFF8C1
        A[3]= 32'h44444444;//FFFFF8C1
        A[4]= 32'h55555555;
        A[5]= 32'h66666666;
        A[6]= 32'h77777777;//FFFFF8C1
        A[7]= 32'h88888888;//FFFFF8C1
        
        B[0]= 32'h22222222;
        B[1]= 32'h33333333;
        B[2]= 32'h44444444;//FFFFF8C1
        B[3]= 32'h55555555;//FFFFF8C1
        B[4]= 32'h66666666;
        B[5]= 32'h77777777;
        B[6]= 32'h88888888;//FFFFF8C1
        B[7]= 32'h99999999;//FFFFF8C1
        ExpectedR  = A[0] * B[0] + A[1]* B[1] + A[2] * B[2] + A[3]* B[3] + A[4] * B[4] + A[5]* B[5] + A[6] * B[6] + A[7]* B[7];
        go_tb = 0;
        rst_tb = 1;
        clk_tb = 0;
        tick();
        rst_tb = 0;
        errors = 0; //no errors
        //begin the test
        //go();
        while(!done_tb) begin
            tick();
        end
        
        if(ExpectedR != R_tb)begin
            errors = errors +1;
        end
        
        //tick();
        //tick();
//        tick();
//        tick();
        
//        A[0]= 3'b0010;
//        A[1]= 3'b0011;
//        An[0]= 3'b0011;
//        An[1]= 3'b0001;
//        B[0]= 3'b0011;
//        B[1]= 3'b0010;
//        ExpectedR  = A[0] * B[0] + A[1]* B[1];
//        ExpectedRn = An[0] * B[0] + An[1]* B[1];
//        tick();
//        go();
//        while(!done_tb) begin
//            tick();
//        end
        
//        if(ExpectedR != R_tb)begin
//            errors = errors +1;
//        end
        
//        if(ExpectedRn != Rn_tb)begin
//            errors = errors +1;
//        end
        
        $finish;
        
    end                    
     
endmodule
