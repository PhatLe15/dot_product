module transposer # (parameter WIDTH = 2, DEPTH = 2) (
        input  wire             clk,
        input  wire             rst,
        input  wire             load,
        //input  wire [WIDTH-1:0] sel,
        input  wire [WIDTH-1:0] d [DEPTH-1:0],
        output reg  [DEPTH-1:0] q [WIDTH-1:0]
    );
    
    //reg  [DEPTH-1:0] temp [WIDTH-1:0];
    integer i,j;

    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            for(i = 0 ; i < WIDTH; i = i+1)begin  // reset temp to 0
                q[i] <= {DEPTH{1'b0}};
            end
            //q <= 0;
        end
        else if(load)
        begin
             for(i = 0 ; i < DEPTH; i = i+1)begin   // transpose the new data and store it to temp
                for(j = 0 ; j < WIDTH; j = j+1)begin
                    q[j][i] <= d[i][j];
                end
             end
        end
        else begin //output 
            q <= q ;
        end
    end
endmodule