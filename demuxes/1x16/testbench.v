module testbench;
    reg in;
    reg [3:0] sel;
    wire [15:0] out;

    demux1x16 dut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in=%b, sel=%b, out=%b", in, sel, out);

        in = 1;

        for (integer i = 0; i < 16; i++) begin
            sel = i[3:0];
            #10;
        end

        $finish;
    end
endmodule
