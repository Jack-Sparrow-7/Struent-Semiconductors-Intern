module testbench;

    reg  [ 3:0] in;
    wire [15:0] out;

    decoder4x16 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b, out = %b", in, out);

        for (integer i = 0; i < 16; i = i + 1) begin
            in = i[3:0];
            #10;
        end

        $finish;
    end

endmodule
