module testbench;
    reg in, sel;
    wire [1:0] out;

    demux1x2 dut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in=%b, sel=%b, out=%b", in, sel, out);

        in = 0; sel = 0; #10;
        in = 0; sel = 1; #10;

        in = 1; sel = 0; #10;
        in = 1; sel = 1; #10;

        $finish;
    end
endmodule