`include "../gates_by_universal_gates/and/design.v"
`include "../gates_by_universal_gates/xor/design.v"

// Design of a half subtractor using data flow modeling
module half_subtractor_dataflow (
    a,
    b,
    diff,
    borrow
);

    input a, b;
    output diff, borrow;

    assign diff   = a ^ b;
    assign borrow = ~a & b;
endmodule

// Design of a half subtractor using behavioural modeling
module half_subtractor_behavioural (
    a,
    b,
    diff,
    borrow

);

    input a, b;
    output reg diff, borrow;

    always @(*) begin
        diff   = a ^ b;
        borrow = ~a & b;
    end

endmodule

// Design of a half subtractor using structural modeling
module half_subtractor_structural (
    a,
    b,
    diff,
    borrow
);

    input a, b;
    output diff, borrow;

    xor (diff, a, b);
    and (borrow, ~a, b);

endmodule

// Design of a half subtractor using switch level modeling
module half_subtractor_switch_level (
    a,
    b,
    diff,
    borrow
);

    input a, b;
    output diff, borrow;

    and_by_nand and_gate (
        .a  (~a),
        .b  (b),
        .out(borrow)
    );

    xor_by_nand xor_gate (
        .a  (a),
        .b  (b),
        .out(diff)
    );

endmodule
