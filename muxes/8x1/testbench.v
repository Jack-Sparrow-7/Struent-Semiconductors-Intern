module testbench;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;

    mux8x1 uut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in: %b, sel: %b, out: %b", in, sel, out);

        in  = 8'b01010101;

        for (integer i = 0; i < 8; i = i + 1) begin
            sel = i[2:0];
            #10;
        end

        $finish;
    end
endmodule
