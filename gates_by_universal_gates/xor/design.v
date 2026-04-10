`include "../../universal_gates/nand/design.v"
`include "../../universal_gates/nor/design.v"


// XOR gate implemented using NAND gates
module xor_by_nand (
    a,
    b,
    out
);

    input a, b;
    output out;

    wire nand1_out;
    wire nand2_out;
    wire nand3_out;

    nand_gate nand1(.a(a), .b(b), .out(nand1_out));
    nand_gate nand2(.a(a), .b(nand1_out), .out(nand2_out));
    nand_gate nand3(.a(nand1_out), .b(b), .out(nand3_out));
    nand_gate nand4(.a(nand2_out), .b(nand3_out), .out(out));

endmodule


// XOR gate implemented using NOR gates
module xor_by_nor (
    a,
    b,
    out
);
    
    input a, b;
    output out;

    wire nor1_out;
    wire nor2_out;
    wire nor3_out;
    wire nor4_out;

    nor_gate nor1(.a(a), .b(b), .out(nor1_out));
    nor_gate nor2(.a(a), .b(nor1_out), .out(nor2_out));
    nor_gate nor3(.a(nor1_out), .b(b), .out(nor3_out));
    nor_gate nor4(.a(nor2_out), .b(nor3_out), .out(nor4_out));
    nor_gate nor5(.a(nor4_out), .b(nor4_out), .out(out));

endmodule
