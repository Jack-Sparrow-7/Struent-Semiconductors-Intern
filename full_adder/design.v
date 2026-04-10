`include "../gates_by_universal_gates/and/design.v"
`include "../gates_by_universal_gates/or/design.v"
`include "../gates_by_universal_gates/xor/design.v"

// Full Adder using dataflow modeling
module full_adder_dataflow (
    a,
    b,
    cin,
    sum,
    carry
);

    input a, b, cin;
    output sum, carry;

    assign sum   = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);

endmodule

// Full Adder using behavioural modeling
module full_adder_behavioural (
    a,
    b,
    cin,
    sum,
    carry
);

    input a, b, cin;
    output reg sum, carry;

    always @(*) begin
        sum   = a ^ b ^ cin;
        carry = (a & b) | (b & cin) | (a & cin);
    end

endmodule

// Full Adder using gate level modeling
module full_adder_gate_level (
    a,
    b,
    cin,
    sum,
    carry
);

    input a, b, cin;
    output sum, carry;

    wire and1_out, and2_out, and3_out;

    xor xor1 (sum, a, b, cin);

    and and1 (and1_out, a, b);
    and and2 (and2_out, b, cin);
    and and3 (and3_out, a, cin);
    or (carry, and1_out, and2_out, and3_out);

endmodule

// Full Adder using switch level modeling
module full_adder_switch_level (
    a,
    b,
    cin,
    sum,
    carry
);

    input a, b, cin;
    output sum, carry;

    wire and1_out, and2_out, and3_out;
    wire or1_out;
    wire xor1_out;

    xor_by_nand xor1 (
        .a  (a),
        .b  (b),
        .out(xor1_out)
    );

    xor_by_nand xor2 (
        .a  (xor1_out),
        .b  (cin),
        .out(sum)
    );

    and_by_nand and1 (
        .a  (a),
        .b  (b),
        .out(and1_out)
    );
    and_by_nand and2 (
        .a  (b),
        .b  (cin),
        .out(and2_out)
    );
    and_by_nand and3 (
        .a  (a),
        .b  (cin),
        .out(and3_out)
    );

    or_by_nand or1 (
        .a  (and1_out),
        .b  (and2_out),
        .out(or1_out)
    );
    or_by_nand or2 (
        .a  (or1_out),
        .b  (and3_out),
        .out(carry)
    );

endmodule
