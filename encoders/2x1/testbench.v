module testbench;

    reg [1:0] in;
    wire out;

    encoder2x1 uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in = %b, out = %b", in, out);

        for (integer i = 0; i < 4; i = i + 1) begin
            in = i[1:0];
            #10;
        end

        $finish;
    end
endmodule
