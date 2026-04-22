module octal_to_binary (
    input [7:0] in,
    output reg [2:0] out
);

    always @(*) begin
        out = 3'd0;

        out[2] = in[4] | in[5] | in[6] | in[7];

        out[1] = in[2] | in[3] | in[6] | in[7];

        out[0] = in[1] | in[3] | in[5] | in[7];

    end

endmodule
