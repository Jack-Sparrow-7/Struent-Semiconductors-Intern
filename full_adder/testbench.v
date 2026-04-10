module full_adder_tb;
    reg df_a, df_b, df_cin;
    wire df_sum, df_carry;

    reg bh_a, bh_b, bh_cin;
    wire bh_sum, bh_carry;

    reg gl_a, gl_b, gl_cin;
    wire gl_sum, gl_carry;

    reg sl_a, sl_b, sl_cin;
    wire sl_sum, sl_carry;

    full_adder_dataflow df (
        .a(df_a),
        .b(df_b),
        .cin(df_cin),
        .sum(df_sum),
        .carry(df_carry)
    );

    full_adder_behavioural bh (
        .a(bh_a),
        .b(bh_b),
        .cin(bh_cin),
        .sum(bh_sum),
        .carry(bh_carry)
    );

    full_adder_gate_level gl (
        .a(gl_a),
        .b(gl_b),
        .cin(gl_cin),
        .sum(gl_sum),
        .carry(gl_carry)
    );

    full_adder_switch_level sl (
        .a(sl_a),
        .b(sl_b),
        .cin(sl_cin),
        .sum(sl_sum),
        .carry(sl_carry)
    );

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, full_adder_tb);

        for (integer i = 0; i < 8; i++) begin
            {df_a, df_b, df_cin} = i[2:0];
            #10;

            $display("Dataflow: a=%b, b=%b, cin=%b, sum=%b, carry=%b", df_a, df_b, df_cin,
                     df_sum, df_carry);
        end

        $write("\n");

        for (integer i = 0; i < 8; i++) begin
            {bh_a, bh_b, bh_cin} = i[2:0];
            #10;

            $display("Behavioural: a=%b, b=%b, cin=%b, sum=%b, carry=%b", bh_a, bh_b, bh_cin,
                     bh_sum, bh_carry);
        end

        $write("\n");

        for (integer i = 0; i < 8; i++) begin
            {gl_a, gl_b, gl_cin} = i[2:0];
            #10;

            $display("Gate-level: a=%b, b=%b, cin=%b, sum=%b, carry=%b", gl_a, gl_b, gl_cin,
                     gl_sum, gl_carry);
        end
        
        $write("\n");

        for (integer i = 0; i < 8 ; i++) begin
            {sl_a, sl_b, sl_cin} = i[2:0];
            #10;

            $display("Switch-level: a=%b, b=%b, cin=%b, sum=%b, carry=%b", sl_a, sl_b, sl_cin,
                     sl_sum, sl_carry);
        end

        $finish;
    end
endmodule
