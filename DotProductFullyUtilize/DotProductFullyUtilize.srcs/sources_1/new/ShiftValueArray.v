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
module ShiftValueArray# (parameter WIDTH = 32)( 
    input    [2:0] Q,    //32 16 8 4 2 1
    output  reg [4:0] out [WIDTH-1:0]
    );
    
    integer i;
    always@(*)begin
        case(Q)
            3'b000:begin  //Q = 1   no shift needed
                for(i = 0; i < WIDTH; i = i + 1)begin
                    out[i]   = 5'b00000;
                end            
            end
            3'b001:begin //Q = 2
                for(i = 0; i < WIDTH; i = i + 2)begin
                    out[i]   = 5'b00000;
                    out[i+1] = 5'b00001;
                end            
            end
            3'b010:begin  //Q = 4
                for(i = 0; i < WIDTH; i = i + 4)begin
                    out[i]   = 5'b00000;
                    out[i+1] = 5'b00001;
                    out[i+2]   = 5'b00010;
                    out[i+3] = 5'b00011;
                end            
            end
          
            3'b011:begin // Q = 8
                for(i = 0; i < WIDTH; i = i + 8)begin
                    out[i]   = 5'b00000;
                    out[i+1] = 5'b00001;
                    out[i+2] = 5'b00010;
                    out[i+3] = 5'b00011;
                    out[i+4] = 5'b00100;
                    out[i+5] = 5'b00101;
                    out[i+6] = 5'b00110;
                    out[i+7] = 5'b00111;
                end            
            end
            
            3'b100:begin // Q = 16
                for(i = 0; i < WIDTH; i = i + 16)begin
                    out[i]    = 5'b00000;
                    out[i+1]  = 5'b00001;
                    out[i+2]  = 5'b00010;
                    out[i+3]  = 5'b00011;
                    out[i+4]  = 5'b00100;
                    out[i+5]  = 5'b00101;
                    out[i+6]  = 5'b00110;
                    out[i+7]  = 5'b00111;
                    out[i+8]  = 5'b01000;
                    out[i+9]  = 5'b01001;
                    out[i+10] = 5'b01010;
                    out[i+11] = 5'b01011;
                    out[i+12] = 5'b01100;
                    out[i+13] = 5'b01101;
                    out[i+14] = 5'b01110;
                    out[i+15] = 5'b01111;
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
