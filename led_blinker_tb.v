module led_blinker_tb;

    reg i_clock, i_enable, i_switch_1, i_switch_2;
    wire o_led_drive, dbg_t100, dbg_t50, dbg_t10, dgb_t1;

    led_blinker #(
        .c100(10),
        .c50(20),
        .c10(50),
        .c1(100)
        ) dut (
        .i_clock(i_clock),
        .i_enable(i_enable),
        .i_switch_1(i_switch_1),
        .i_switch_2(i_switch_2),
        .o_led_drive(o_led_drive),
        .dbg_t100(dbg_t100),
        .dbg_t50(dbg_t50),
        .dbg_t10(dbg_t10),
        .dbg_t1(dbg_t1),
        .dbg_temp_o_led(dbg_temp_o_led)
    );

    initial begin
        i_enable = 0;
        #20 i_enable = 1;
    end

    initial begin
        i_clock = 0;
    end
    always begin
        #20 i_clock = ~i_clock;
    end

    always @(posedge i_clock) begin
        $display("Time=%0t | t100=%b t50=%b t10=%b t1=%b temp_o_led=%b o_led_drive=%b", 
                $time, dbg_t100, dbg_t50, dbg_t10, dbg_t1, dbg_temp_o_led, o_led_drive);
    end

    integer i, j;
    initial begin
        $dumpfile("led_blinker.vcd");
        @(posedge i_enable);
        $dumpvars(0, led_blinker_tb);
        for (i = 0; i<4; i=i+1) begin
            for (j = 0; j<4; j=j+1) begin
                {i_switch_1, i_switch_2} = i[1:0];
                #1000;
            end
        end 
        $finish;
    end
endmodule