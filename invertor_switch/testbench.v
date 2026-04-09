module not_tb;

    reg  a;
    wire out;

    not_gate uut (
        .a  (a),
        .out(out)
    );

    initial begin
        $monitor("a = %b, out = %b", a, out);

        $dumpfile("wave.vcd");
        $dumpvars(0, not_tb);

        a = 0;
        #10;

        a = 1;
        #10;

        $finish;
    end

endmodule
