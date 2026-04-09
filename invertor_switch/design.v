// Invertor switch design using CMOS technology
module not_gate (
    a,
    out
);
    input a;
    output out;

    supply1 vcc;
    supply0 gnd;

    pmos p1 (out, vcc, a);
    nmos n1 (out, gnd, a);

endmodule
