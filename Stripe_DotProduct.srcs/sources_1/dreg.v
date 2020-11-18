module dreg # (parameter WIDTH = 32) (
        input  wire             clk,
        //input wire              en,
        input wire              up,
        input  wire             rst,
        input  wire [WIDTH-1:0] d,
        output reg  [WIDTH-1:0] q
    );

    always @ (posedge clk, posedge rst) begin
        if (rst) q <= 0;
        else if(up) q <= d;
        else     q <= q;
    end
endmodule