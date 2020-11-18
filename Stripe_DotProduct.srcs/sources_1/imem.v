module imem (
        input [5:0] a,
        output [3:0] instr
    );

    reg [3:0] rom [0:63];

    initial begin
        $readmemh ("memFile.dat", rom);   //instruction data from mem
    end


    assign instr = rom[a];
endmodule