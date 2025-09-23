`timescale 1ns/1ps

module clock_test;
    reg i_clock;

    // Initialize clock
    initial i_clock = 0;

    // Clock toggle: 50% duty cycle, period = 40 ns
    always #20 i_clock = ~i_clock;

    // Dump signals for GTKWave
    initial begin
        $dumpfile("clock_test.vcd");   // output file
        $dumpvars(0, clock_test);      // dump all signals in this module
        #200 $finish;                  // run for 200 ns then finish
    end
endmodule