`include "WallaceMultiplier.v"

module WallaceMultiplier_tb();

reg [31:0] a, b;
wire [63:0] res1;
wire [63:0] res2;
wire [63:0] finalres;

WallaceMultiplier WM(finalres, res1, res2, a, b); // a and b are 32 bit numbers, res1 + res2 = product

initial begin
a[31:0] = 32'h00e00003;
b[31:0] = 32'h0000a000;
#30
a[31:0] = 32'h0000FFFF;
b[31:0] = 32'h0000FFFF;
end

initial begin
    $monitor ($time, " a = %d  b = %d res1 = %d res2 = %d finalres = %d", a[31:0], b[31:0], res1[62:0], res2[63:0], finalres[63:0]);
end

endmodule
