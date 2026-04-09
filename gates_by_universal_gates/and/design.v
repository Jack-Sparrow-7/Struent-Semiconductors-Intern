`include "../../universal_gates/nand/design.v"
`include "../../universal_gates/nor/design.v"

// AND gate implemented using NAND gates
module and_by_nand (
    a,
    b,
    out
);

    input a, b;
    output out;
    wire nand_out;

    nand_gate nand1 (
        .a  (a),
        .b  (b),
        .out(nand_out)
    );

    nand_gate nand2 (
        .a  (nand_out),
        .b  (nand_out),
        .out(out)
    );

endmodule


// AND gate implemented using NOR gates
module and_by_nor(
    a,
    b,
    out
);

    input a, b;
    output out;
    wire nor1_out;
    wire nor2_out;

    nor_gate nor1 (
        .a  (a),
        .b  (b),
        .out(nor1_out)
    );

    nor_gate nor2 (
        .a  (nor1_out),
        .b  (nor1_out),
        .out(nor2_out)
    );

    nor_gate nor3 (
        .a  (nor2_out),
        .b  (nor2_out),
        .out(out)
    );

endmodule
