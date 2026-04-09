module nor_tb ();

    reg a, b;
    wire out;

    nor_gate uut (
        .a  (a),
        .b  (b),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, nor_tb);

        $monitor("a = %b | b = %b | out = %b", a, b, out);

        for (integer i = 0; i < 4; i++) begin
            {a, b} = i[1:0];
            #10;
        end

        $finish;
    end

endmodule
