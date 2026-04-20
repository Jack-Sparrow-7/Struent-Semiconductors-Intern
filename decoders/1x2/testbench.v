module testbench;

    reg in;
    wire [1:0] out;

    decoder1x2 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b, out = %b", in, out);

        in = 0;
        #10;

        in = 1;
        #10;

        $finish;
    end

endmodule
