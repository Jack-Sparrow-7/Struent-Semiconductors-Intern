module not_by_nand_nor_tb;

    reg nand_a;
    wire nand_out;

    reg nor_a;
    wire nor_out;

    not_by_nand not_gate (
        .a  (nand_a),
        .out(nand_out)
    );

    not_by_nor not_gate2 (
        .a  (nor_a),
        .out(nor_out)
    );


    initial begin


        $dumpfile("wave.vcd");
        $dumpvars(0, not_by_nand_nor_tb);

        for (integer i = 0; i < 2; i = i + 1) begin
            nand_a = i;
            #10;
            $display("NAND ---  a: %b, out: %b", nand_a, nand_out);
        end

        for (integer i = 0; i < 2; i = i + 1) begin
            nor_a = i;
            #10;
            $display("NOR ---  a: %b, out: %b", nor_a, nor_out);
        end

        $finish;

    end

endmodule

