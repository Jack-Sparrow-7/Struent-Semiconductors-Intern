module encoder2x1 (
    input [1:0] in,
    output reg out
);

    always @(*) begin
        case (in)
            2'b01:   out = 0;
            2'b10:   out = 1;
            default: out = 0;
        endcase
    end

endmodule
