`include "../../gates_by_universal_gates/and/design.v"
`include "../../gates_by_universal_gates/or/design.v"
`include "../../gates_by_universal_gates/xor/design.v"

// Dataflow modeling
module half_adder_dataflow (
    a,
    b,
    sum,
    carry
);
    input a;
    input b;
    output sum;
    output carry;

    assign sum   = a ^ b;
    assign carry = a & b;

endmodule

// Behavioral modeling
module half_adder_behavioural (
    a,
    b,
    sum,
    carry
);
    input a;
    input b;
    output reg sum;
    output reg carry;

    always @(*) begin
        sum   = a ^ b;
        carry = a & b;
    end

endmodule


// Structural modeling
module half_adder_gate_level (
    a,
    b,
    sum,
    carry
);
    input a;
    input b;
    output sum;
    output carry;

    xor (sum, a, b);
    and (carry, a, b);

endmodule

// Switch-level modeling
module half_adder_switch_level (
    a,
    b,
    sum,
    carry
);
    input a;
    input b;
    output sum;
    output carry;

    wire and_gate2_out;
    wire and_gate3_out;

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
