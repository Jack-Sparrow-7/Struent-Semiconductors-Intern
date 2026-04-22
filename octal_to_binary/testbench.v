module testbench;
    reg [7:0] in;
    wire [2:0] out;
    integer i;

    octal_to_binary uut (
        .in (in),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        for (i = 0; i < 8; i++) begin
            in = 8'd0;
            in[i] = 1;

            #15;
            $display("in = %b or %d | out = %b", in, i[2:0], out);
        end

        $finish;
    end

endmodule
