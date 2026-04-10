`include "/home/jack/struent_semiconductors_intern/universal_gates/nor/design.v"
`include "/home/jack/struent_semiconductors_intern/universal_gates/nand/design.v"

// OR gate implemented using Nor gates
module or_by_nor (
    a,
    b,
    out
);

    input a, b;
    output out;
    wire nor_out;

    nor_gate nor1 (
        .a  (a),
        .b  (b),
        .out(nor_out)
    );

    nor_gate nor2 (
        .a  (nor_out),
        .b  (nor_out),
        .out(out)
    );

endmodule


// OR gate implemented using NAND gates
module or_by_nand(
    a,
    b,
    out
);

    input a, b;
    output out;
    wire nand1_out;
    wire nand2_out;

    nand_gate nand1 (
        .a  (a),
        .b  (a),
        .out(nand1_out)
    );

    nand_gate nand2 (
        .a  (b),
        .b  (b),
        .out(nand2_out)
    );

    nand_gate nand3 (
        .a  (nand1_out),
        .b  (nand2_out),
        .out(out)
    );

endmodule
