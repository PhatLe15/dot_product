`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2020 03:27:48 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath# (parameter WIDTH = 2, DEPTH = 2)(
    input [WIDTH-1:0] A  [DEPTH-1:0],
    input [WIDTH-1:0] An [DEPTH-1:0],
    input [WIDTH-1:0] B  [DEPTH-1:0],
    input load,
    input en,
    //input [WIDTH-1:0] sel,
    input done,
    input clk,
    input rst,
    input down,
    output [WIDTH-1:0] AdotB, AndotB ,
    output wire cnt_zero
    );
    
    wire [DEPTH-1:0] qA, qAn;
    wire [WIDTH-1:0] qB  [DEPTH-1:0];
    wire [WIDTH-1:0] A0andB, A1andB, An0andB, An1andB;
    wire [WIDTH-1:0] AplusB, AnplusB;
    wire [WIDTH-1:0] Rshifted, Rnshifted;
    wire [WIDTH-1:0] R, Rn, sel;
    wire [WIDTH-1:0] Result [0:0], Resultn [0:0], qResult [0:0], qResultn [0:0];
    wire [WIDTH-1:0] qR, qRn ;
    //input registers
    transposer #(WIDTH,DEPTH) transposerA (
        .clk(clk),    
        .rst(rst),
        .load(load),
        .sel(sel),
        .d(A),
        .q(qA)
    );
    
    transposer #(WIDTH,DEPTH) transposerAn (
        .clk(clk),    
        .rst(rst),
        .load(load),
        .sel(sel),
        .d(An),
        .q(qAn)
    );
    
    dreg #(WIDTH,DEPTH) regB (
        .clk(clk),    
        .rst(rst),
        .load(load),
        .d(B),
        .q(qB)
    );
    
    counter #(WIDTH) counter(
        .load(load),
        .down(down),
        .clk(clk),
        .rst(rst),
        .d(WIDTH[WIDTH-1:0]-1'b1),
        .q(sel)
    
    );
    
    assign cnt_zero = &sel;
    //and operation
    
    AND #(WIDTH) A0B (
        .a({WIDTH{qA[0]}}),
        .b(qB[0]),
        .y(A0andB)
    );
    
    AND #(WIDTH) A1B (
        .a({WIDTH{qA[1]}}),
        .b(qB[1]),
        .y(A1andB)
    );
    
    AND #(WIDTH) An0B (
        .a({WIDTH{qAn[0]}}),
        .b(qB[0]),
        .y(An0andB)
    );
    
    AND #(WIDTH) An1B (
        .a({WIDTH{qAn[1]}}),
        .b(qB[1]),
        .y(An1andB)
    );
    
    //add operation
    adder #(WIDTH) AaddB (
        .a(A0andB),
        .b(A1andB),
        .y(AplusB)
    );
    
    adder #(WIDTH) AnaddB (
        .a(An0andB),
        .b(An1andB),
        .y(AnplusB)
    );
    
    adder #(WIDTH) ABR (
        .a(AplusB),
        .b(Rshifted),
        .y(R)
    );
    
    adder #(WIDTH) AnBR (
        .a(AnplusB),
        .b(Rnshifted),
        .y(Rn)
    );
    
    assign Result[0] = R;
    assign Resultn[0] = Rn;

    
    //result registers
    dreg #(WIDTH,1) regAB (
        .clk(clk),    
        .rst(rst),
        .load(en),
        .d(Result),
        .q(qResult)
    );
    
    dreg #(WIDTH,1) regAnB (
        .clk(clk),    
        .rst(rst),
        .load(en),
        .d(Resultn),
        .q(qResultn)
    );
    
    assign qR = qResult[0];
    assign qRn = qResultn[0];
    
    //shift operation
    shifter #(WIDTH) shiftR(
        .a(qR),
        .y(Rshifted)
    );
    
    shifter #(WIDTH) shiftRn(
        .a(qRn),
        .y(Rnshifted)
    );   
    
    //done muxes
    mux2 #(WIDTH) muxR (
        .sel(done),
        .a({WIDTH{1'b0}}),
        .b(qR), 
        .y(AdotB)   
    );
    
    mux2 #(WIDTH) muxRn (
        .sel(done),
        .a({WIDTH{1'b0}}),
        .b(qRn),
        .y(AndotB)    
    );
endmodule
