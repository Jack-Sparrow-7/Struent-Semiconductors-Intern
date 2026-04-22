module decimal_to_bcd (
    input [9:0] in,
    output reg [3:0] out
);

    always @(*) begin
        out = 4'd0;

        out[3] = in[8] | in[9];

        out[2] = in[4] | in[5] | in[6] | in[7];

        out[1] = in[2] | in[3] | in[6] | in[7];

        out[0] = in[1] | in[3] | in[5] | in[7] | in[9];

    end

endmodule
