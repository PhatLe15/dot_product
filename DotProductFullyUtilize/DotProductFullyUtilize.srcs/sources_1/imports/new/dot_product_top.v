`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2020 09:04:55 AM
// Design Name: 
// Module Name: dot_product_top
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


module dot_product_top # (parameter WIDTH = 32, DEPTH = 8)(
        input  [WIDTH-1:0] A  [DEPTH-1:0],
        input  [WIDTH-1:0] qB  [DEPTH-1:0],
        input  [2:0]       Q,   // select quantization level
        input              clk, 
                           rst, 
                           load,
                           //en,
        output [WIDTH-1:0] Result 
        
    );
    
    wire [DEPTH-1:0] qA [WIDTH-1:0];
   // wire [WIDTH-1:0] qB  [DEPTH-1:0];
    
    //input data registers
    transposer #(WIDTH,DEPTH) transposerA (
        .clk(clk),    
        .rst(rst),
        .load(load),
        .d(A),
        .q(qA)
    );
        
//    dreg #(WIDTH,DEPTH) regB (
//        .clk(clk),    
//        .rst(rst),
//        .load(load),
//        .d(B),
//        .q(qB)
//    );
    
//    wire [DEPTH-1:0] mux_out [DEPTH-1:0]; 
    wire [WIDTH-1:0] qR      [WIDTH-1:0],
                     shiftedR [WIDTH-1:0];
    wire [4:0] shiftAmount [WIDTH-1:0];
                     
    ShiftValueArray#(WIDTH) shifter (
        .Q(Q),
        .out(shiftAmount)
    );
    
    generate
        genvar i;
        for(i = 0 ; i < WIDTH; i = i+1)begin      // should be 32 units  
        
            // perform dot product 1 slice at a time
            DotProduct1Bit #(WIDTH, DEPTH) DotProduct( 
                .A(qA[i]),
                .B(qB),
                .out(qR[i])
            );
            
            //perform shifting based on the array
            shifter #(WIDTH) shifter ( 
                .a(qR[i]),
                .amount(shiftAmount[i]),
                .y(shiftedR[i])
            );
        end
    endgenerate
        
    combine #(WIDTH, WIDTH) combine(
        .a(shiftedR),
        .y(Result)
    );   
endmodule
