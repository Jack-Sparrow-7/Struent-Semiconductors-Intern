`include "/home/jack/struent_semiconductors_intern/demuxes/1x8/design.v"
`include "/home/jack/struent_semiconductors_intern/demuxes/1x2/design.v"

module demux1x16 (
    in,
    sel,
    out
);

    input in;
    input [3:0] sel;
    output [15:0] out;
    wire [3:0] out1;

    demux1x2 demux0 (
        .in (in),
        .sel(sel[3]),
        .out(out1)
    );

    demux1x8 demux1 (
        .in (out1[0]),
        .sel(sel[2:0]),
        .out(out[7:0])
    );

    demux1x8 demux2 (
        .in (out1[1]),
        .sel(sel[2:0]),
        .out(out[15:8])
    );

endmodule
