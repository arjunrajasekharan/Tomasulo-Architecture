`include "./Verilog_source_files/RecursiveAdder32bit/ParallelPrefixCircuit.v"

module RecursiveAdder(sum, a, b);

input [31:0] a, b;
output [31:0] sum;
wire [65:0] inputsignal;
wire [32:0] carry;
wire [65:0] outsig;

assign inputsignal[1:0] = 2'b00;
assign inputsignal[3:2] = (a[0]^b[0]) ? 2'b01 : {a[0],b[0]} ;
assign inputsignal[5:4] = (a[1]^b[1]) ? 2'b01 : {a[1],b[1]} ;
assign inputsignal[7:6] = (a[2]^b[2]) ? 2'b01 : {a[2],b[2]} ;
assign inputsignal[9:8] = (a[3]^b[3]) ? 2'b01 : {a[3],b[3]} ;
assign inputsignal[11:10] = (a[4]^b[4]) ? 2'b01 : {a[4],b[4]} ;
assign inputsignal[13:12] = (a[5]^b[5]) ? 2'b01 : {a[5],b[5]} ;
assign inputsignal[15:14] = (a[6]^b[6]) ? 2'b01 : {a[6],b[6]} ;
assign inputsignal[17:16] = (a[7]^b[7]) ? 2'b01 : {a[7],b[7]} ;
assign inputsignal[19:18] = (a[8]^b[8]) ? 2'b01 : {a[8],b[8]} ;
assign inputsignal[21:20] = (a[9]^b[9]) ? 2'b01 : {a[9],b[9]} ;
assign inputsignal[23:22] = (a[10]^b[10]) ? 2'b01 : {a[10],b[10]} ;
assign inputsignal[25:24] = (a[11]^b[11]) ? 2'b01 : {a[11],b[11]} ;
assign inputsignal[27:26] = (a[12]^b[12]) ? 2'b01 : {a[12],b[12]} ;
assign inputsignal[29:28] = (a[13]^b[13]) ? 2'b01 : {a[13],b[13]} ;
assign inputsignal[31:30] = (a[14]^b[14]) ? 2'b01 : {a[14],b[14]} ;
assign inputsignal[33:32] = (a[15]^b[15]) ? 2'b01 : {a[15],b[15]} ;
assign inputsignal[35:34] = (a[16]^b[16]) ? 2'b01 : {a[16],b[16]} ;
assign inputsignal[37:36] = (a[17]^b[17]) ? 2'b01 : {a[17],b[17]} ;
assign inputsignal[39:38] = (a[18]^b[18]) ? 2'b01 : {a[18],b[18]} ;
assign inputsignal[41:40] = (a[19]^b[19]) ? 2'b01 : {a[19],b[19]} ;
assign inputsignal[43:42] = (a[20]^b[20]) ? 2'b01 : {a[20],b[20]} ;
assign inputsignal[45:44] = (a[21]^b[21]) ? 2'b01 : {a[21],b[21]} ;
assign inputsignal[47:46] = (a[22]^b[22]) ? 2'b01 : {a[22],b[22]} ;
assign inputsignal[49:48] = (a[23]^b[23]) ? 2'b01 : {a[23],b[23]} ;
assign inputsignal[51:50] = (a[24]^b[24]) ? 2'b01 : {a[24],b[24]} ;
assign inputsignal[53:52] = (a[25]^b[25]) ? 2'b01 : {a[25],b[25]} ;
assign inputsignal[55:54] = (a[26]^b[26]) ? 2'b01 : {a[26],b[26]} ;
assign inputsignal[57:56] = (a[27]^b[27]) ? 2'b01 : {a[27],b[27]} ;
assign inputsignal[59:58] = (a[28]^b[28]) ? 2'b01 : {a[28],b[28]} ;
assign inputsignal[61:60] = (a[29]^b[29]) ? 2'b01 : {a[29],b[29]} ;
assign inputsignal[63:62] = (a[30]^b[30]) ? 2'b01 : {a[30],b[30]} ;
assign inputsignal[65:64] = (a[31]^b[31]) ? 2'b01 : {a[31],b[31]} ;

ParallelPrefixCircuit PPC(outsig, inputsignal);

assign carry[32:0] = {outsig[64],outsig[62],outsig[60],outsig[58],outsig[56],outsig[54],outsig[52],outsig[50],outsig[48],outsig[46],outsig[44],outsig[42],outsig[40],outsig[38],outsig[36],outsig[34],outsig[32],outsig[30],outsig[28],outsig[26],outsig[24],outsig[22],outsig[20],outsig[18],outsig[16],outsig[14],outsig[12],outsig[10],outsig[8],outsig[6],outsig[4],outsig[2],outsig[0]};

xor xor0(sum[0], a[0], b[0], carry[0]);
xor xor1(sum[1], a[1], b[1], carry[1]);
xor xor2(sum[2], a[2], b[2], carry[2]);
xor xor3(sum[3], a[3], b[3], carry[3]);
xor xor4(sum[4], a[4], b[4], carry[4]);
xor xor5(sum[5], a[5], b[5], carry[5]);
xor xor6(sum[6], a[6], b[6], carry[6]);
xor xor7(sum[7], a[7], b[7], carry[7]);
xor xor8(sum[8], a[8], b[8], carry[8]);
xor xor9(sum[9], a[9], b[9], carry[9]);
xor xor10(sum[10], a[10], b[10], carry[10]);
xor xor11(sum[11], a[11], b[11], carry[11]);
xor xor12(sum[12], a[12], b[12], carry[12]);
xor xor13(sum[13], a[13], b[13], carry[13]);
xor xor14(sum[14], a[14], b[14], carry[14]);
xor xor15(sum[15], a[15], b[15], carry[15]);
xor xor16(sum[16], a[16], b[16], carry[16]);
xor xor17(sum[17], a[17], b[17], carry[17]);
xor xor18(sum[18], a[18], b[18], carry[18]);
xor xor19(sum[19], a[19], b[19], carry[19]);
xor xor20(sum[20], a[20], b[20], carry[20]);
xor xor21(sum[21], a[21], b[21], carry[21]);
xor xor22(sum[22], a[22], b[22], carry[22]);
xor xor23(sum[23], a[23], b[23], carry[23]);
xor xor24(sum[24], a[24], b[24], carry[24]);
xor xor25(sum[25], a[25], b[25], carry[25]);
xor xor26(sum[26], a[26], b[26], carry[26]);
xor xor27(sum[27], a[27], b[27], carry[27]);
xor xor28(sum[28], a[28], b[28], carry[28]);
xor xor29(sum[29], a[29], b[29], carry[29]);
xor xor30(sum[30], a[30], b[30], carry[30]);
xor xor31(sum[31], a[31], b[31], carry[31]);
// assign sum[32] = carry[32];

endmodule
