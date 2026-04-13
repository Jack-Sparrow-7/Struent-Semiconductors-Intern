`include "/home/jack/struent_semiconductors_intern/muxes/2x1/design.v"

module mux4x1 (
    in,
    sel,
    out
);

    input [3:0] in;
    input [1:0] sel;
    wire out0, out1;
    output out;

    mux2x1 mux0(
        .in (in[1:0]),
        .sel(sel[0]),
        .out(out0)
    );

    mux2x1 mux1(
        .in (in[3:2]),
        .sel(sel[0]),
        .out(out1)
    );

    mux2x1 mux2(
        .in ({out1, out0}),
        .sel(sel[1]),
        .out(out)
    );

endmodule
