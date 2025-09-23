module led_blinker_tb;

    reg i_clock, i_enable, i_switch_1, i_switch_2;
    wire o_led_drive;

    led_blinker #(
        .c100(10),
        .c50(20),
        .c10(50),
        .c1(100)
        ) dut (
        .i_clock(i_clock),
        .i_enable(i_enable),
        .i_switch_1(i_switch_1),
        .i_switch_2(i_switch_2)
    );

    initial begin
        i_enable = 0;
        #200 i_enable = 1;
    end

    initial begin
        i_clock = 0;
    end
    always #20 i_clock = ~i_clock;

    initial begin
        $dumpfile("led_blinker.vcd");
        @(posedge i_enable);
        $dumpvars(0, led_blinker_tb);
        integer i;
        for (i = 0; i<4; i=i+1) begin
            {i_switch_1, i_switch_2} = i[1:0];
            #100;
        end
        $finish;
    end
endmodule