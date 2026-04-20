module decoder4x16 (
    input [3:0] in,
    output reg [15:0] out
);
    always @(*) begin
        out = 8'd0;

        for (integer i = 0; i < 16; i = i + 1) begin
            if (in == i) begin
                out[i] = 1'b1;
            end
        end

    end

endmodule
