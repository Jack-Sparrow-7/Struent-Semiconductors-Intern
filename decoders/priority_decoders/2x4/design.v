module priority_decoder2x4_LSB (
    input [1:0] in,
    output reg [3:0] out
);

    always @(*) begin
        out = 4'd0;

        for (integer i = 0; i < 4; i++) begin
            if (in == i) begin
                out[i] = 1;
            end
        end

    end

endmodule


module priority_decoder2x4_MSB (
    input [1:0] in,
    output reg [3:0] out
);

    always @(*) begin
        out = 4'd0;

        for (integer i = 3; i >= 0; i--) begin
            if (in == i) begin
                out[i] = 1;
            end
        end

    end

endmodule
