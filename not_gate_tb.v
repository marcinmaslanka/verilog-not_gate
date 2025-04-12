`include "not_gate.v"

module not_tb();
    reg a;
    wire y;

    not_gate uut(a,y);

    initial begin

    $dumpfile("not_tb.vcd");
    $dumpvars(0, not_tb);
    
    a=1'b0;
    #100 a=1'b1;
    #100 a=1'b0;
    
    end

endmodule
