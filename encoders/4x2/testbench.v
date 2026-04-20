module testbench;
    reg  [3:0] in;
    wire [1:0] out;

    encoder4x2 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b | out = %b", in, out);

        for (integer i = 0; i < 16; i++) begin
            in = i[3:0];
            #15;
        end

        $finish;
    end
endmodule
