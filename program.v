//25MHz, %50 duty cycle
module led_blinker(
    input i_clock, i_enable, i_switch_1, i_switch_2,
    output o_led_drive
);

//en s1 s2 Hz
//0  -  -  -
//1  0  0  100
//1  0  1  50
//1  1  0  10
//1  1  1  1

//keep in mind below 50% duty cycle!
//keep in mind count starts at 0 so do minus 1!
//25MHz = 25,000,000Hz
//100Hz --> count=125,000-1
//50Hz --> count=250,000-1
//10Hz --> count=1,250,000-1
//1Hz --> count=12,500,000-1

//log2(25MHz) --> 25 bits
reg[24:0] count = 0;

reg t100 = 1'b0;
reg t50 = 1'b0;
reg t10 = 1'b0;
reg t1 = 1'b0;

//100hz
always @(posedge i_clock) begin
    if (count%(125000-1)==0) begin
        t100 = !t100;
    end if (!i_switch_1&!i_switch_2) begin
        o_led_drive = t100;
    end
end

//50hz
always @(posedge i_clock) begin
    if (count%(250000-1)==0) begin
        t50 = !t50;
    end if (!i_switch_1&i_switch_2) begin
        o_led_drive = t50;
    end
end

//10hz
always @(posedge i_clock) begin
    if (count%(1250000-1)==0) begin
        t10 = !t10;
    end if (i_switch_1&!i_switch_2) begin
        o_led_drive = t10;
    end
end
always @(posedge i_clock) begin
    if (count%(12500000-1)==0) begin
        t1 = !t1;
    end if (!i_switch_1&!i_switch_2) begin
        o_led_drive = t1;
    end
end

endmodule