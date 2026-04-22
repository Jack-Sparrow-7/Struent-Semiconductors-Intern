module testbench;
    reg [15:0] in;
    wire [3:0] out;
    integer i;

    hexadecimal_to_binary uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        for (i = 0; i < 16; i++) begin
            in = 16'd0;
            in[i] = 1;

            #15;
            $display("in = %b or %d | out = %b", in, i[3:0], out);
        end

        $finish;
    end

endmodule
