// Design of a NOR gate using PMOS and NMOS transistors
module nor_gate (
    a,
    b,
    out
);

    input a, b;
    output out;

    supply1 vcc;
    supply0 gnd;

    wire w1;

    pmos p1 (w1, vcc, a);
    pmos p2 (out, w1, b);

    nmos n1 (out, gnd, a);
    nmos n2 (out, gnd, b);

endmodule
