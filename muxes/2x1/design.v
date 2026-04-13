`ifndef MUX2X1_DESIGN_V
`define MUX2X1_DESIGN_V

module mux2x1(
    in,
    sel,
    out,
);
    input [1:0] in;
    input sel;
    output out;

    assign out = sel ? in[1] : in[0];

endmodule

`endif