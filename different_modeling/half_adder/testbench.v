module half_adder_tb;
    reg df_a, df_b;
    wire df_sum, df_carry;

    reg bh_a, bh_b;
    wire bh_sum, bh_carry;

    reg gl_a, gl_b;
    wire gl_sum, gl_carry;

    reg sl_a, sl_b;
    wire sl_sum, sl_carry;

    half_adder_dataflow df (
        .a(df_a),
        .b(df_b),
        .sum(df_sum),
        .carry(df_carry)
    );

    half_adder_behavioural bh (
        .a(bh_a),
        .b(bh_b),
        .sum(bh_sum),
        .carry(bh_carry)
    );

    half_adder_gate_level gl (
        .a(gl_a),
        .b(gl_b),
        .sum(gl_sum),
        .carry(gl_carry)
    );

    half_adder_switch_level sl (
        .a(sl_a),
        .b(sl_b),
        .sum(sl_sum),
        .carry(sl_carry)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, half_adder_tb);

        for (integer i = 0; i < 4; i++) begin
            {df_a, df_b} = i[1:0];
            #10;

            $display("Dataflow: a=%b, b=%b, sum=%b, carry=%b", df_a, df_b,
                     df_sum, df_carry);
        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {bh_a, bh_b} = i[1:0];
            #10;

            $display("Behavioural: a=%b, b=%b, sum=%b, carry=%b", bh_a, bh_b,
                     bh_sum, bh_carry);
        end

        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {gl_a, gl_b} = i[1:0];
            #10;

            $display("Gate-level: a=%b, b=%b, sum=%b, carry=%b", gl_a, gl_b,
                     gl_sum, gl_carry);
        end
        
        $write("\n");

        for (integer i = 0; i < 4; i++) begin
            {sl_a, sl_b} = i[1:0];
            #10;

            $display("Switch-level: a=%b, b=%b, sum=%b, carry=%b", sl_a, sl_b,
                     sl_sum, sl_carry);
        end
    end
endmodule
