module testbench;
    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    mux16x1 uut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in: %b, sel: %b, out: %b", in, sel, out);

        in  = 16'b0101010101010101;

        for (integer i = 0; i < 16; i = i + 1) begin
            sel = i[3:0];
            #10;
        end

        $finish;
    end
endmodule
