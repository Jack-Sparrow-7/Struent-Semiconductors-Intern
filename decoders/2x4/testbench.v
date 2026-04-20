module testbench;

    reg [1:0] in;
    wire [3:0] out;

    decoder2x4 uut (
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
