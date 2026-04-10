module full_subtractor_tb;
    reg df_a, df_b, df_bin;
    wire df_diff, df_borrow;

    reg bh_a, bh_b, bh_bin;
    wire bh_diff, bh_borrow;

    reg gl_a, gl_b, gl_bin;
    wire gl_diff, gl_borrow;

    reg sl_a, sl_b, sl_bin;
    wire sl_diff, sl_borrow;

    full_subtractor_dataflow df (
        .a(df_a),
        .b(df_b),
        .bin(df_bin),
        .diff(df_diff),
        .borrow(df_borrow)
    );

    full_subtractor_behavioural bh (
        .a(bh_a),
        .b(bh_b),
        .bin(bh_bin),
        .diff(bh_diff),
        .borrow(bh_borrow)
    );

    full_subtractor_gate_level gl (
        .a(gl_a),
        .b(gl_b),
        .bin(gl_bin),
        .diff(gl_diff),
        .borrow(gl_borrow)
    );

    full_subtractor_switch_level sl (
        .a(sl_a),
        .b(sl_b),
        .bin(sl_bin),
        .diff(sl_diff),
        .borrow(sl_borrow)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, full_subtractor_tb);

        for (integer i = 0; i < 8; i++) begin
            {df_a, df_b, df_bin} = i[2:0];
            #10;

            $display("Dataflow: a=%b, b=%b, bin=%b, diff=%b, borrow=%b", df_a, df_b, df_bin,
                     df_diff, df_borrow);
        end

        $write("\n");

        for (integer i = 0; i < 8; i++) begin
            {bh_a, bh_b, bh_bin} = i[2:0];
            #10;

            $display("Behavioural: a=%b, b=%b, bin=%b, diff=%b, borrow=%b", bh_a, bh_b, bh_bin,
                     bh_diff, bh_borrow);
        end

        $write("\n");

        for (integer i = 0; i < 8; i++) begin
            {gl_a, gl_b, gl_bin} = i[2:0];
            #10;

            $display("Gate-level: a=%b, b=%b, bin=%b, diff=%b, borrow=%b", gl_a, gl_b, gl_bin,
                     gl_diff, gl_borrow);
        end
        
        $write("\n");

        for (integer i = 0; i < 8 ; i++) begin
            {sl_a, sl_b, sl_bin} = i[2:0];
            #10;

            $display("Switch-level: a=%b, b=%b, bin=%b, diff=%b, borrow=%b", sl_a, sl_b, sl_bin,
                     sl_diff, sl_borrow);
        end

        $finish;
    end
endmodule
