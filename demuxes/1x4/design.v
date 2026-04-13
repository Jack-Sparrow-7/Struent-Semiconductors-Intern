`include "/home/jack/struent_semiconductors_intern/demuxes/1x2/design.v"

module demux1x4 (
    in,
    sel,
    out
);
    input in;
    input [1:0] sel;
    output [3:0] out;
    wire [1:0] out1;

    demux1x2 demux0 (
        .in (in),
        .sel(sel[1]),
        .out(out1)
    );

    demux1x2 demux1 (
        .in (out1[0]),
        .sel(sel[0]),
        .out(out[1:0])
    );

    demux1x2 demux2 (
        .in (out1[1]),
        .sel(sel[0]),
        .out(out[3:2])
    );

endmodule
