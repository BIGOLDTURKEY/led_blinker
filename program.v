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
//25MHz = 25,000,000Hz
//100Hz --> count=125,000
//50Hz --> count=250,000
//10Hz --> count=1,250,000
//1Hz --> count=12,500,000

//log2(25MHz) --> 25 bits
reg[24:0] count = 0;

reg t100 = 1'b0;
reg t50 = 1'b0;
reg t10 = 1'b0;
reg t1 = 1'b0;

always @(posedge i_clock) begin
        
end
always @(posedge i_clock) begin
    
end
always @(posedge i_clock) begin
    
end
always @(posedge i_clock) begin
    
end

endmodule