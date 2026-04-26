`include "/home/jack/struent_semiconductors_intern/decoders/3x8/design.v"

module full_adder_by_decoder (
    a,
    b,
    cin,
    sum,
    cout
);
    input a, b, cin;
    output sum, cout;
    wire [7:0] out;

    decoder3x8 decoder1 (
        .in ({a, b, cin}),
        .out(out)
    );

    assign sum  = out[1] | out[2] | out[4] | out[7];
    assign cout = out[3] | out[5] | out[6] | out[7];

endmodule
