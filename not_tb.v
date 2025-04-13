// --------------------------------------------------------------------
// Testbench for NOT gate (not_gate)
// This simulates a simple NOT gate by applying test values to input 'a'
// and observing the output 'y'.
// --------------------------------------------------------------------

module not_tb();

    // Declare a register for the input signal
    reg a;

    // Declare a wire for the output signal
    wire y;

    // Instantiate the Unit Under Test (UUT)
    not_gate uut (
        .a(a),  // Connect testbench input 'a' to DUT input
        .y(y)   // Connect DUT output to testbench output 'y'
    );

    // Initial block to apply stimulus
    initial begin

        // Create a dump file for GTKWave waveform viewing
        $dumpfile("not_tb.vcd");
        $dumpvars(0, not_tb);  // Dump all variables in this module

        // Apply test values
        a = 1'b0;   // Test case 1: input = 0
        #100 a = 1'b1; // Test case 2: input = 1 (after 100 time units)
        #100 a = 1'b0; // Test case 3: input = 0 (after another 100 time units)

        // Simulation ends implicitly
    end

endmodule
