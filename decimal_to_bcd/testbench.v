module testbench;
    reg [9:0] in;
    wire [3:0] out;
    integer i;

    decimal_to_bcd uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        for (i = 0; i < 10; i++) begin
            in = 10'd0;
            in[i] = 1;

            #15;
            $display("in = %b or %d | out = %b", in, i[3:0], out);
        end

        $finish;
    end

endmodule
