module testbench;
    reg  [7:0] in;
    wire [2:0] out;

    encoder8x3 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b | out = %b", in, out);

        for (integer i = 0; i < 64; i++) begin
            in = i[7:0];
            #15;
        end

        $finish;
    end
endmodule
