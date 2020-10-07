`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2020 02:48:30 PM
// Design Name: 
// Module Name: ShiftValueArray
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

//shift value base on quantization and Dot product unit
module AindexArray# (parameter WIDTH = 32)( 
    input    [2:0] Q,    //32 16 8 4 2 1
    output  reg [4:0] out [WIDTH-1:0]
    );
    
    integer i;
    always@(*)begin
        case(Q)
            3'b000:begin  //Q = 1   no shift needed
                for(i = 0; i < WIDTH; i = i + 1)begin
                    out[i]   = i;
                end            
            end
            3'b001:begin //Q = 2
                for(i = 0; i < WIDTH; i = i + 2)begin
                    out[i]   = i;
                    out[i+1] = i;
                end            
            end
            3'b010:begin  //Q = 4
                for(i = 0; i < WIDTH; i = i + 4)begin
                    out[i]   = i;
                    out[i+1] = i;
                    out[i+2] = i;
                    out[i+3] = i;
                end            
            end
          
            3'b011:begin // Q = 8
                for(i = 0; i < WIDTH; i = i + 8)begin
                    out[i]   = i;
                    out[i+1] = i;
                    out[i+2] = i;
                    out[i+3] = i;
                    out[i+4] = i;
                    out[i+5] = i;
                    out[i+6] = i;
                    out[i+7] = i;
                end            
            end
            
            3'b100:begin // Q = 16
                for(i = 0; i < WIDTH; i = i + 16)begin
                    out[i]    = i;
                    out[i+1]  = i;
                    out[i+2]  = i;
                    out[i+3]  = i;
                    out[i+4]  = i;
                    out[i+5]  = i;
                    out[i+6]  = i;
                    out[i+7]  = i;
                    out[i+8]  = i;
                    out[i+9]  = i;
                    out[i+10] = i;
                    out[i+11] = i;
                    out[i+12] = i;
                    out[i+13] = i;
                    out[i+14] = i;
                    out[i+15] = i;
                end            
            end
            
            3'b101:begin // Q = 32
                for(i = 0; i < WIDTH; i = i + 1)begin
                    out[i]    = i;
                end            
            end
            
            default: begin  // unknown selection
                for(i = 0; i < WIDTH; i = i + 1)begin
                    out[i]   = 5'bxxxxx;
                end            
            end
        endcase
    end
     
endmodule
