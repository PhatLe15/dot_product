`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  San Jose State University
// Engineer: Phat Le
// 
// Create Date: 08/31/2020 09:04:55 AM
// Design Name: BSI Dot Product using Bit Count algorithm
// Module Name: dot_product_top
// Project Name:    BSI DNN
// Target Devices: BSI Dot Product 
// Tool Versions:  1.0
// Description:  
// 
// Dependencies: 
// 
// Revision: 10/6/2020
// Revision 1.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dot_product_top # (parameter WIDTH = 32, DEPTH = 8)(
        input  [WIDTH-1:0] A  [DEPTH-1:0],
        input  [WIDTH-1:0] B  [DEPTH-1:0],
        input   [2:0]      Q,
        input              clk, 
                           rst, 
                           load,
                           up,
                           enResult,
        output [WIDTH-1:0] Result 
        
    );
    
    //input buffer bit slice output
    wire [DEPTH-1:0] qA [WIDTH-1:0];        //8-bit width slices
    wire [DEPTH-1:0] qB [WIDTH-1:0];        //32 number of slices
    
    //the index array and shift array which change based on quantization and control
    wire [4:0] Aindex      [WIDTH-1:0];     //5 bits since the max is 31
    wire [4:0] shiftAmount [WIDTH-1:0];
    
    wire [WIDTH-1:0] DotProdcut1Bit_out [WIDTH-1:0]; //output from each slice dot product
    wire [WIDTH-1:0] comebine_out; //output from the final adder
    
    //input data registers
    inputBuffer #(WIDTH,DEPTH) inputBuffer (
        .clk(clk),    
        .rst(rst),
        .load(load),
        .A(A),
        .B(B),
        .qA(qB),
        .qB(qA)
    );
    
    // A index array
    AindexSelector #(WIDTH) AindexArray (
        .Q(Q),
        .clk(clk),    
        .rst(rst),     //to clear array to 0
        .load(load),   //to load data to array
        .up(up),      //to increment data 
        .out(Aindex)
    );
    
    //shift array index of A to select depend on quantization
    shiftValue #(WIDTH) shiftArray (
        .Q(Q),
        .clk(clk),    
        .rst(rst),
        .load(load),
        .up(up),
        .out(shiftAmount)
    );

    generate
        genvar i;
        for(i = 0 ; i < WIDTH; i = i+1)begin   //32 processes for 32 bit slices
            DotProduct1bit#(WIDTH, DEPTH) DotProduct1bit(
                .A(qA),
                .B(qB[i]),
                .Aindex(Aindex[i]),
                .shiftAmount(shiftAmount[i]),
                .out(DotProdcut1Bit_out[i])
            );
        end
    endgenerate
          
    combine #(WIDTH, WIDTH) combine( //ADD 32 slices together
        .a(DotProdcut1Bit_out),
        .y(comebine_out)
    );
    
    outputBuffer#(WIDTH) outputBuffer (
        .clk(clk),
        .rst(rst),
        .load(enResult),
        .d(comebine_out + Result),
        .q(Result)
    );
    
endmodule
