`include "/home/jack/struent_semiconductors_intern/muxes/4x1/design.v"
`include "/home/jack/struent_semiconductors_intern/muxes/2x1/design.v"

module mux8x1(
    in,
    sel,
    out
);
    input [7:0] in;
    input [2:0] sel;
    wire out1, out2;
    output out;

    mux4x1 mux0(
        .in(in[3:0]),
        .sel(sel[1:0]),
        .out(out1)
    );

    mux4x1 mux1(
        .in(in[7:4]),
        .sel(sel[1:0]),
        .out(out2)
    );

    mux2x1 mux2(
        .in({out2, out1}),
        .sel(sel[2]),
        .out(out)
    );

endmodule