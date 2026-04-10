module half_subtractor_tb;
    reg df_a, df_b;
    wire df_diff, df_borrow;

    reg bh_a, bh_b;
    wire bh_diff, bh_borrow;

    reg gl_a, gl_b;
    wire gl_diff, gl_borrow;

    reg sl_a, sl_b;
    wire sl_diff, sl_borrow;

    half_subtractor_dataflow df (
        .a(df_a),
        .b(df_b),
        .diff(df_diff),
        .borrow(df_borrow)
    );

    half_subtractor_behavioural bh (
        .a(bh_a),
        .b(bh_b),
        .diff(bh_diff),
        .borrow(bh_borrow)
    );

    half_subtractor_structural gl (
        .a(gl_a),
        .b(gl_b),
        .diff(gl_diff),
        .borrow(gl_borrow)
    );

    half_subtractor_switch_level sl (
        .a(sl_a),
        .b(sl_b),
        .diff(sl_diff),
        .borrow(sl_borrow)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, half_subtractor_tb);

        for (integer i = 0; i < 4; i++) begin
            {df_a, df_b} = i[1:0];
            #10;

            $display("Dataflow: a=%b, b=%b, diff=%b, borrow=%b", df_a, df_b,
                     df_diff, df_borrow);
        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {bh_a, bh_b} = i[1:0];
            #10;

            $display("Behavioural: a=%b, b=%b, diff=%b, borrow=%b", bh_a, bh_b,
                     bh_diff, bh_borrow);
        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {gl_a, gl_b} = i[1:0];
            #10;

            $display("Gate-level: a=%b, b=%b, diff=%b, borrow=%b", gl_a, gl_b,
                     gl_diff, gl_borrow);
        end
        
        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {sl_a, sl_b} = i[1:0];
            #10;

            $display("Switch-level: a=%b, b=%b, diff=%b, borrow=%b", sl_a, sl_b,
                     sl_diff, sl_borrow);
        end

        $finish;
    end
endmodule
