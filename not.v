// --------------------------------------------------------------------
// Module Name: not_gate
// Description: Simple NOT gate (inverter) in Verilog HDL
// --------------------------------------------------------------------

module not_gate (
    input a,     // Input signal (1-bit)
    output y     // Output signal (inverted input)
);

// Logic: Invert the input signal
assign y = ~a;

endmodule

