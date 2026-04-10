`include "../gates_by_universal_gates/and/design.v"
`include "../gates_by_universal_gates/xor/design.v"

// Design of a half adder using data flow modeling
module half_adder_dataflow (
    a,
    b,
    sum,
    carry
);

    input a, b;
    output sum, carry;

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule

// Design of a half adder using behavioural modeling
module half_adder_behavioural (
    a,
    b,
    sum,
    carry
);

    input a, b;
    output reg sum, carry;

    always @(a or b) begin
        sum   = a ^ b;
        carry = a & b;
    end

endmodule


// Design of a half adder using structural modeling
module half_adder_structural (
    a,
    b,
    sum,
    carry
);

    input a, b;
    output sum, carry;

    xor (sum, a, b);
    and (carry, a, b);

endmodule

// Design of a half adder using switch level modeling
module half_adder_switch_level (
    a,
    b,
    sum,
    carry
);

    input a, b;
    output sum, carry;

    and_by_nand and_gate (
        .a  (a),
        .b  (b),
        .out(carry)
    );

    xor_by_nand xor_gate (
        .a  (a),
        .b  (b),
        .out(sum)
    );

endmodule
