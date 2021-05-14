`include "ParallelPrefixCircuit.v"

module ParallelPrefixCircuit_tb();

reg [65:0] in;
wire [65:0] out;

ParallelPrefixCircuit PPC(out, in);

initial begin
in[65:2] = 64'h5555555555555555;
in[1:0] = 2'b00;
end

initial begin
    $monitor ($time, " in = %b-%h   out = %h ", in[65:64], in[63:0], out);
end

endmodule


