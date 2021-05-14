`include "RecursiveAdder.v"

module RecursiveAdder_tb();

reg [31:0] a, b;
wire [32:0] sum;

RecursiveAdder RA(sum, a, b);

initial begin
a = 32'h000FF00E;
b = 32'h00000070;
#10 a = 32'h00000011;
b = 32'h000000DE;
#10 a = 32'hAAAAAAAA;
b = 32'h55555555;
#10 a = 32'hF00F8C05;
b = 32'h10A13206;
end

initial begin
    $monitor ($time, " a = %h   b = %h   sum = %b-%h ", a, b, sum[32], sum[31:0]);
end

endmodule
