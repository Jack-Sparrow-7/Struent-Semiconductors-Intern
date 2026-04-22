module priority_encoder4x2_LSB (
    input [3:0] in,
    output reg [1:0] out
);

    always @(*) begin
        out = 2'd0;

        for (integer i = 0; i < 4; i++) begin
            if (in[i] && (in != 0) && (in & (in - 1)) == 0) out = i[1:0];
        end

    end

endmodule


module priority_encoder4x2_MSB (
    input [3:0] in,
    output reg [1:0] out
);

    always @(*) begin
        out = 2'd0;

        for (integer i = 3; i >= 0; i--) begin
            if (in[i] && (in != 0) && (in & (in - 1)) == 0) out = i[1:0];
        end

    end

endmodule
