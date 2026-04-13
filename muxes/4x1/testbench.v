module testbench;
    reg [3:0] in;
    reg [1:0] sel;
    wire out;

    mux4x1 uut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("i0: %b, i1: %b, i2: %b, i3: %b, sel: %b, out: %b", in[0], in[1], in[2], in[3], sel, out);

        in  = 4'b0101;

        sel = 0;
        #10;
        sel = 1;
        #10;
        sel = 2;
        #10;
        sel = 3;
        #10;

        $finish;
    end
endmodule
