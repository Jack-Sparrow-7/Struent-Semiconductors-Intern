`ifndef UNIVERSAL_GATES_NAND_DESIGN_V
`define UNIVERSAL_GATES_NAND_DESIGN_V

// Design of a NAND gate using PMOS and NMOS transistors
module nand_gate (
    a,
    b,
    out
);
    input a, b;
    output out;

    supply1 vcc;
    supply0 gnd;

    wire w1;

    pmos p1 (out, vcc, a);
    pmos p2 (out, vcc, b);

    nmos n1 (out, w1, a);
    nmos n2 (w1, gnd, b);

endmodule

`endif
