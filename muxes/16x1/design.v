`include "/home/jack/struent_semiconductors_intern/muxes/8x1/design.v"
`include "/home/jack/struent_semiconductors_intern/muxes/2x1/design.v"

module mux16x1(
    in,
    sel,
    out
);
    input [15:0] in;
    input [3:0] sel;
    wire out1, out2;
    output out;

    mux8x1 mux0(
        .in(in[7:0]),
        .sel(sel[2:0]),
        .out(out1)
    );

    mux8x1 mux1(
        .in(in[15:8]),
        .sel(sel[2:0]),
        .out(out2)
    );

    mux2x1 mux2(
        .in({out2, out1}),
        .sel(sel[3]),
        .out(out)
    );

endmodule