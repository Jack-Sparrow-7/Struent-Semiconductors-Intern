module testbench;
    reg [1:0] in;
    reg sel;
    wire out;

    mux2x1 uut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("i0: %b, i1: %b, sel: %b, out: %b", in[0], in[1], sel, out);

        in  = 2'b01;

        sel = 0;
        #10;
        sel = 1;
        #10;

        $finish;
    end
endmodule
