`ifndef DEMUX1X2_DESIGN_V
`define DEMUX1X2_DESIGN_V

module demux1x2 (
    in,
    sel,
    out
);
    input in, sel;
    output [1:0] out;

    assign out[0] = in & ~sel;
    assign out[1] = in & sel;

endmodule

`endif