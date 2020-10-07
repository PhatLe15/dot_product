module mux3 #(parameter WIDTH = 8, DEPTH = 32) (
        input  wire [4:0]            sel,
        input  wire [WIDTH-1:0] a [DEPTH-1:0],
        output wire [WIDTH-1:0] y
    );
    
    assign y = (sel) ? a[sel] : 0; //select depend on the index

endmodule