module dreg # (parameter WIDTH = 8, DEPTH = 32) (
        input  wire             clk,
        input  wire             rst,
        input  wire             load,
        input  wire             up,
        input  wire [WIDTH-1:0] d [DEPTH-1:0],
        output reg  [WIDTH-1:0] q [DEPTH-1:0]
    );
    
    
    integer i;

    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            for(i = 0 ; i < DEPTH; i = i+1)begin
                q[i] <= {WIDTH{1'b0}};
            end
        end
        else if(load)
        begin
             q <= d;
        end
        else if (up) begin
            for(i = 0 ; i < DEPTH; i = i+1)begin
                q[i] <= q[i] + 1'b1;
            end
        end
        else begin
            q  <= q; 
        end
    end
endmodule