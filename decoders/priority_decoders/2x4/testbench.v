module testbench;

    reg  [1:0] lsb_in;
    wire [3:0] lsb_out;

    reg  [1:0] msb_in;
    wire [3:0] msb_out;

    priority_decoder2x4_LSB uut (
        .in (lsb_in),
        .out(lsb_out)
    );

    priority_decoder2x4_MSB uut2 (
        .in (msb_in),
        .out(msb_out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        for (integer i = 0; i < 4; i++) begin
            lsb_in = i[1:0];
            #15;
            $display("LSB: in = %b | out = %b", lsb_in, lsb_out);

        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            msb_in = i[1:0];
            #15;
            $display("MSB: in = %b | out = %b", msb_in, msb_out);
        end

        $finish;
    end
endmodule
