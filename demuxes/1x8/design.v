`include "/home/jack/struent_semiconductors_intern/demuxes/1x4/design.v"
`include "/home/jack/struent_semiconductors_intern/demuxes/1x2/design.v"

module demux1x8 (
    in,
    sel,
    out
);
    input in;
    input [2:0] sel;
    output [7:0] out;
    wire [1:0] out1;

    demux1x2 demux0 (
        .in (in),
        .sel(sel[2]),
        .out(out1)
    );

    demux1x4 demux1 (
        .in (out1[0]),
        .sel(sel[1:0]),
        .out(out[3:0])
    );

    demux1x4 demux2 (
        .in (out1[1]),
        .sel(sel[1:0]),
        .out(out[7:4])
    );

endmodule
