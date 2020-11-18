module shifter# (parameter WIDTH = 32) (
        input  wire [WIDTH-1:0] a,
        input  wire [4:0] amount,
        output wire [WIDTH-1:0] y
    );

    assign y = a<<amount;
    
endmodule