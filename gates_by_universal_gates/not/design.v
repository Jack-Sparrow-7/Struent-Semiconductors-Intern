`include "/home/jack/struent_semiconductors_intern/universal_gates/nor/design.v"
`include "/home/jack/struent_semiconductors_intern/universal_gates/nand/design.v"

// NOT gate implemented using NAND gates
module not_by_nand (
    a,
    out
);

    input a;
    output out;

    nand_gate nand1 (
        .a  (a),
        .b  (a),
        .out(out)
    );

endmodule


// NOT gate implemented using NOR gates
module not_by_nor (
    a,
    out
);

    input a;
    output out;

    nor_gate nor1 (
        .a  (a),
        .b  (a),
        .out(out)
    );

endmodule
