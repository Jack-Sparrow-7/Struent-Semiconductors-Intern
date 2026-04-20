module decoder1x2 (
    input in,
    output reg [1:0] out
);

    always @(*) begin
        case (in)
            1'b0: out = 2'b01;
            1'b1: out = 2'b10;
            default: out = 2'b00;
        endcase
    end

endmodule
