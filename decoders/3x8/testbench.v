module testbench;

    reg  [2:0] in;
    wire [7:0] out;

    decoder3x8 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in: %b, out: %b", in, out);

        for (integer i = 0; i < 8; i = i + 1) begin
            in = i[2:0];
            #10;
        end

        $finish;
    end

endmodule
