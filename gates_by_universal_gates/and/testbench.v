module and_by_nand_nor_tb;

    reg nand_a, nand_b;
    wire nand_out;

    reg nor_a, nor_b;
    wire nor_out;

    and_by_nand and_gate (
        .a  (nand_a),
        .b  (nand_b),
        .out(nand_out)
    );

    and_by_nor and_gate2 (
        .a  (nor_a),
        .b  (nor_b),
        .out(nor_out)
    );


    initial begin


        $dumpfile("wave.vcd");
        $dumpvars(0, and_by_nand_nor_tb);

        for (integer i = 0; i < 4; i = i + 1) begin
            nand_a = i[1];
            nand_b = i[0];
            #10;
            $display("NAND ---  a: %b, b: %b, out: %b", nand_a, nand_b,
                     nand_out);
        end

        $write("\n");

        for (integer i = 0; i < 4; i = i + 1) begin
            nor_a = i[1];
            nor_b = i[0];
            #10;
            $display("NOR ---  a: %b, b: %b, out: %b", nor_a, nor_b, nor_out);
        end

        $finish;

    end

endmodule
