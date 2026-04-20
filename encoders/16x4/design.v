module encoder16x4 (
    input [15:0] in,
    output reg [3:0] out
);

    always @(*) begin
        out = 4'd0;

        for (integer i = 0; i < 16; i++) begin
            if (in[i] && (in != 0) && (in & (in - 1)) == 0) out = i[3:0];
        end
    end

endmodule
