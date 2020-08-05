module dreg # (parameter WIDTH = 2, DEPTH = 2) (
        input  wire             clk,
        input  wire             rst,
        input  wire             load,
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
        else begin
            q  <= q; 
        end
    end
endmodule