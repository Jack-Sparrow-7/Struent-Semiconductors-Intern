module testbench;
    reg a, b, cin;
    wire sum, cout;

    full_adder_by_decoder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout),
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        for (integer i = 0; i < 8; i++) begin
            {a, b, cin} = i[2:0];
            #10;

            $display("a=%b, b=%b, cin=%b, sum=%b, carry=%b", a, b, cin, sum,
                     cout);
        end

        $finish;
    end
endmodule
