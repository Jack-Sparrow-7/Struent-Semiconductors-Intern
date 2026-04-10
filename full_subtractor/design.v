`include "../gates_by_universal_gates/and/design.v"
`include "../gates_by_universal_gates/or/design.v"
`include "../gates_by_universal_gates/xor/design.v"

// Full Subtractor using Dataflow
module full_subtractor_dataflow (
    a,
    b,
    bin,
    diff,
    borrow
);
    input a, b, bin;
    output diff, borrow;

    assign diff   = a ^ b ^ bin;
    assign borrow = (~a & b) | (b & bin) | (~a & bin);

endmodule

// Full Subtractor using Behavioural Modeling
module full_subtractor_behavioural (
    a,
    b,
    bin,
    diff,
    borrow
);
    input a, b, bin;
    output reg diff, borrow;

    always @(*) begin
        diff   = a ^ b ^ bin;
        borrow = (~a & b) | (b & bin) | (~a & bin);
    end

endmodule

// Full Subtractor using Gate Level Modeling
module full_subtractor_gate_level (
    a,
    b,
    bin,
    diff,
    borrow
);
    input a, b, bin;
    output diff, borrow;

    xor (diff, a, b, bin);

    wire and1_out, and2_out, and3_out;

    and and1 (and1_out, ~a, b);
    and and2 (and2_out, b, bin);
    and and3 (and3_out, ~a, bin);

    or or1 (borrow, and1_out, and2_out, and3_out);

endmodule

// Full Subtractor using Switch Level Modeling
module full_subtractor_switch_level (
    a,
    b,
    bin,
    diff,
    borrow
);

    input a, b, bin;
    output diff, borrow;


    wire xor1_out;
    wire and1_out, and2_out, and3_out;
    wire or1_out;

    xor_by_nand xor1 (
        .a  (a),
        .b  (b),
        .out(xor1_out)
    );
    xor_by_nand xor2 (
        .out(diff),
        .a(xor1_out),
        .b(bin)
    );

    and_by_nand and1 (
        .out(and1_out),
        .a(~a),
        .b(b)
    );
    and_by_nand and2 (
        .out(and2_out)  ,
        .a(b),
        .b(bin)
    );
    and_by_nand and3 (
        .out(and3_out),
        .a(~a),
        .b(bin)
    );

    or_by_nand or1 (
        .out(or1_out),
        .a(and1_out),
        .b(and2_out)
    );
    or_by_nand or2 (
        .out(borrow),
        .a(or1_out),
        .b(and3_out)
    );

endmodule
