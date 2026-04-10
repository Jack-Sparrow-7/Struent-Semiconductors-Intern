module xor_tb;
    reg nand_a, nand_b;
    wire nand_out;

    reg nor_a, nor_b;
    wire nor_out;

    xor_by_nand xor_nand (
        .a(nand_a),
        .b(nand_b),
        .out(nand_out)
    );
    xor_by_nor xor_nor (
        .a(nor_a),
        .b(nor_b),
        .out(nor_out)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, xor_tb);

        for (integer i = 0; i < 4; i++) begin
            {nand_a, nand_b} = i[1:0];
            #10;

            $display("XOR_BY_NAND: a=%b, b=%b, y=%b", nand_a, nand_b, nand_out);
        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {nor_a, nor_b} = i[1:0];
            #10;

            $display("XOR_BY_NOR: a=%b, b=%b, y=%b", nor_a, nor_b, nor_out);
        end

        $finish;
    end
endmodule
