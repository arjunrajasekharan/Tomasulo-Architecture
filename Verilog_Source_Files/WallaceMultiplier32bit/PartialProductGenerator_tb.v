`include "./Verilog_source_files/WallaceMultiplier32bit/PartialProductGenerator.v"

module PartialProductGenerator_tb();

reg [31:0] in;
reg c;
wire [31:0] out;

PPG PPG_sample(out, in, c);

initial begin
in[31:0] = 32'hA6A6A6A6;
c = 1'b0;
#5 c = 1'b1;
end

initial begin
    $monitor ($time, " in = %h  c = %b out = %h ", in[31:0], c, out[31:0]);
end

endmodule
