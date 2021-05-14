`include "CSA1.v"

module CSA1_tb();

reg [31:0] a1;
reg [32:0] a2;
reg [33:0] a3;
wire [33:0] b1;
wire [33:0] b2;

CSA1 CSAsample1(a1, a2, a3, b1, b2);

initial begin
a1[31:0] =   32'b10001000100010001000100010001000;
a2[32:0] =  33'b001000100010001000100010001000100;
a3[33:0] = 34'b0000100010001000100010001000100010;
end

initial begin
    $monitor ($time, " a1 = %b  a2 = %b a3 = %b b1 = %b b2 = %b", a1[31:0], a2[32:0], a3[33:0], b1[33:0], b2[33:0]);
end

endmodule
