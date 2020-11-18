`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2020 10:19:47 AM
// Design Name: 
// Module Name: dmemB
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


module Bmem(
        //input  [5:0] addr, //address from rom
       // output  [31:0] dataA [7:0],
        output  [31:0] dataB [7:0]
    );
    
    reg [31:0] romB [0:63];
   // reg [31:0] romA [0:63];


    initial begin
        $readmemh ("input-o.dat", romB);
       // $readmemh ("conv1-o.dat", romA);
            //instruction data from mem
    end
    
//    integer i;
//    always@(*)begin
//        for (i = 0; i < 8; i = i+1)begin
//            dataA[i] = romA[i];
//            dataB[i] = romB[i];
//        end
//    end
    assign dataB = romB[0:7];
  //  assign dataA = romA[0:7];
    
endmodule
