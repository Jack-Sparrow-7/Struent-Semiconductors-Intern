module testbench;

    reg  [15:0] in;
    wire [ 3:0] out;

    encoder16x4 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b | out = %b", in, out);

        for (integer i = 0; i < (16 * 16); i++) begin
            in = i[15:0];
            #15;
        end

        $finish;
    end
endmodule
