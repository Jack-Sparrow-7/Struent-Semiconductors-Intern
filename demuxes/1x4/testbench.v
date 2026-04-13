module testbench;
    reg in;
    reg [1:0] sel;
    wire [3:0] out;

    demux1x4 dut (
        .in (in),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, testbench);

        $monitor("in=%b, sel=%b, out=%b", in, sel, out);

        in = 1;

        for (integer i = 0; i < 4; i++) begin
            sel = i[1:0];
            #10;
        end

        $finish;
    end
endmodule
