`include "./Verilog_source_files/WallaceMultiplier32bit/fullAdderGate.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/PartialProductGenerator.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/RecursiveAdderWM.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA1.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA2.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA3.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA4.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA5.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA6.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA7.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA8.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA9.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA10.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA11.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA12.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA13.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA14.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA15.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA16.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA17.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA18.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA19.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA20.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA21.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA22.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA23.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA24.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA25.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA26.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA27.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA28.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA29.v"
`include "./Verilog_source_files/WallaceMultiplier32bit/CSA30.v"

module WallaceMultiplier (res, a, b);

input [31:0] a, b;
output [31:0] res;

wire [63:0] res1;
wire [63:0] res2;
wire [63:0] finalres;
wire [1:0] intermediate;
wire [1:0] carout;

// a1 to a32 are initial partial products
wire [31:0] a1;
wire [32:0] a2;
wire [33:0] a3;
wire [34:0] a4;
wire [35:0] a5;
wire [36:0] a6;
wire [37:0] a7;
wire [38:0] a8;
wire [39:0] a9;
wire [40:0] a10;
wire [41:0] a11;
wire [42:0] a12;
wire [43:0] a13;
wire [44:0] a14;
wire [45:0] a15;
wire [46:0] a16;
wire [47:0] a17;
wire [48:0] a18;
wire [49:0] a19;
wire [50:0] a20;
wire [51:0] a21;
wire [52:0] a22;
wire [53:0] a23;
wire [54:0] a24;
wire [55:0] a25;
wire [56:0] a26;
wire [57:0] a27;
wire [58:0] a28;
wire [59:0] a29;
wire [60:0] a30;
wire [61:0] a31;
wire [62:0] a32;

// second layer partial products
wire [33:0] b1;
wire [33:0] b2;
wire [36:0] b3;
wire [36:0] b4;
wire [39:0] b5;
wire [39:0] b6;
wire [42:0] b7;
wire [42:0] b8;
wire [45:0] b9;
wire [45:0] b10;
wire [48:0] b11;
wire [48:0] b12;
wire [51:0] b13;
wire [51:0] b14;
wire [54:0] b15;
wire [54:0] b16;
wire [57:0] b17;
wire [57:0] b18;
wire [60:0] b19;
wire [60:0] b20;
wire [61:0] b21;
wire [62:0] b22;

// third layer partial products
wire [36:0] c1;
wire [34:0] c2;
wire [39:0] c3;
wire [40:0] c4;
wire [45:0] c5;
wire [43:0] c6;
wire [48:0] c7;
wire [49:0] c8;
wire [54:0] c9;
wire [52:0] c10;
wire [57:0] c11;
wire [58:0] c12;
wire [61:0] c13;
wire [61:0] c14;
wire [62:0] c15;

// fourth layer partial products

wire [39:0] d1;
wire [37:0] d2;
wire [45:0] d3;
wire [44:0] d4;
wire [54:0] d5;
wire [50:0] d6;
wire [58:0] d7;
wire [58:0] d8;
wire [62:0] d9;
wire [62:0] d10;

// fifth layer partial products

wire [45:0] e1;
wire [40:0] e2;
wire [54:0] e3;
wire [51:0] e4;
wire [62:0] e5;
wire [59:0] e6;
wire [62:0] e7;

// sixth layer partial products

wire [54:0] f1;
wire [46:0] f2;
wire [62:0] f3;
wire [60:0] f4;
wire [62:0] f5;

// seventh layer partial products

wire [62:0] g1;
wire [55:0] g2;
wire [60:0] g3;
wire [62:0] g4;

// eigth layer partial products

wire [62:0] h1;
wire [61:0] h2;
wire [62:0] h3;

// ninth layer partial products

wire [62:0] i1;
wire [63:0] i2;

// calculating partial products initially
PPG PPG1(a1[31:0], a[31:0], b[0]);

PPG PPG2(a2[32:1], a[31:0], b[1]);
assign a2[0] = 1'b0;

PPG PPG3(a3[33:2], a[31:0], b[2]);
assign a3[1:0] = 2'b00;

PPG PPG4(a4[34:3], a[31:0], b[3]);
assign a4[2:0] = 3'b000;

PPG PPG5(a5[35:4], a[31:0], b[4]);
assign a5[3:0] = 4'b0000;

PPG PPG6(a6[36:5], a[31:0], b[5]);
assign a6[4:0] = 5'b00000;

PPG PPG7(a7[37:6], a[31:0], b[6]);
assign a7[5:0] = 6'b000000;

PPG PPG8(a8[38:7], a[31:0], b[7]);
assign a8[6:0] = 7'b0000000;

PPG PPG9(a9[39:8], a[31:0], b[8]);
assign a9[7:0] = 8'b00000000;

PPG PPG10(a10[40:9], a[31:0], b[9]);
assign a10[8:0] = 9'b000000000;

PPG PPG11(a11[41:10], a[31:0], b[10]);
assign a11[9:0] = 10'b0000000000;

PPG PPG12(a12[42:11], a[31:0], b[11]);
assign a12[10:0] = 11'b00000000000;

PPG PPG13(a13[43:12], a[31:0], b[12]);
assign a13[11:0] = 12'b000000000000;

PPG PPG14(a14[44:13], a[31:0], b[13]);
assign a14[12:0] = 13'b0000000000000;

PPG PPG15(a15[45:14], a[31:0], b[14]);
assign a15[13:0] = 14'b00000000000000;

PPG PPG16(a16[46:15], a[31:0], b[15]);
assign a16[14:0] = 15'b000000000000000;

PPG PPG17(a17[47:16], a[31:0], b[16]);
assign a17[15:0] = 16'b0000000000000000;

PPG PPG18(a18[48:17], a[31:0], b[17]);
assign a18[16:0] = 17'b00000000000000000;

PPG PPG19(a19[49:18], a[31:0], b[18]);
assign a19[17:0] = 18'b000000000000000000;

PPG PPG20(a20[50:19], a[31:0], b[19]);
assign a20[18:0] = 19'b0000000000000000000;

PPG PPG21(a21[51:20], a[31:0], b[20]);
assign a21[19:0] = 20'b00000000000000000000;

PPG PPG22(a22[52:21], a[31:0], b[21]);
assign a22[20:0] = 21'b000000000000000000000;

PPG PPG23(a23[53:22], a[31:0], b[22]);
assign a23[21:0] = 22'b0000000000000000000000;

PPG PPG24(a24[54:23], a[31:0], b[23]);
assign a24[22:0] = 23'b00000000000000000000000;

PPG PPG25(a25[55:24], a[31:0], b[24]);
assign a25[23:0] = 24'b000000000000000000000000;

PPG PPG26(a26[56:25], a[31:0], b[25]);
assign a26[24:0] = 25'b0000000000000000000000000;

PPG PPG27(a27[57:26], a[31:0], b[26]);
assign a27[25:0] = 26'b00000000000000000000000000;

PPG PPG28(a28[58:27], a[31:0], b[27]);
assign a28[26:0] = 27'b000000000000000000000000000;

PPG PPG29(a29[59:28], a[31:0], b[28]);
assign a29[27:0] = 28'b0000000000000000000000000000;

PPG PPG30(a30[60:29], a[31:0], b[29]);
assign a30[28:0] = 29'b00000000000000000000000000000;

PPG PPG31(a31[61:30], a[31:0], b[30]);
assign a31[29:0] = 30'b000000000000000000000000000000;

PPG PPG32(a32[62:31], a[31:0], b[31]);
assign a32[30:0] = 31'b0000000000000000000000000000000;

// layer 1 computations

CSA1 CSA_1(a1, a2, a3, b1, b2);
CSA2 CSA_2(a4, a5, a6, b3, b4);
CSA3 CSA_3(a7, a8, a9, b5, b6);
CSA4 CSA_4(a10, a11, a12, b7, b8);
CSA5 CSA_5(a13, a14, a15, b9, b10);
CSA6 CSA_6(a16, a17, a18, b11, b12);
CSA7 CSA_7(a19, a20, a21, b13, b14);
CSA8 CSA_8(a22, a23, a24, b15, b16);
CSA9 CSA_9(a25, a26, a27, b17, b18);
CSA10 CSA_10(a28, a29, a30, b19, b20);
assign b21[61:0] = a31[61:0];
assign b22[62:0] = a32[62:0];

// layer 2 computations

CSA11 CSA_11(b1, b2, b3, c1, c2);
CSA12 CSA_12(b4, b5, b6, c3, c4);
CSA13 CSA_13(b7, b8, b9, c5, c6);
CSA14 CSA_14(b10, b11, b12, c7, c8);
CSA15 CSA_15(b13, b14, b15, c9, c10);
CSA16 CSA_16(b16, b17, b18, c11, c12);
CSA17 CSA_17(b19, b20, b21, c13, c14);
assign c15[62:0] = b22[62:0];

// layer 3 computations

CSA18 CSA_18(c1, c2, c3, d1, d2);
CSA19 CSA_19(c4, c5, c6, d3, d4);
CSA20 CSA_20(c7, c8, c9, d5, d6);
CSA21 CSA_21(c10, c11, c12, d7, d8);
CSA22 CSA_22(c13, c14, c15, d9, d10);

// layer 4 computations

CSA23 CSA_23(d1, d2, d3, e1, e2);
CSA24 CSA_24(d4, d5, d6, e3, e4);
CSA25 CSA_25(d7, d8, d9, e5, e6);
assign e7[62:0] = d10[62:0];

// layer 5 computations

CSA26 CSA_26(e1, e2, e3, f1, f2);
CSA27 CSA_27(e4, e5, e6, f3, f4);
assign f5[62:0] = e7[62:0];

// layer 6 computations

CSA28 CSA_28(f1, f2, f3, g1, g2);
assign g3[60:0] = f4[60:0];
assign g4[62:0] = f5[62:0];

// layer 7 computations

CSA29 CSA_29(g1, g2, g3, h1, h2);
assign h3[62:0] = g4[62:0];

// layer 8 computations

CSA30 CSA_30(h1, h2, h3, i1, i2);

assign res1[62:0] = i1[62:0];
assign res1[63] = 1'b0;
assign res2[63:0] = i2[63:0];

// final sum calculation

RecursiveAdderWM RAWM1(intermediate, finalres[31:0], res1[31:0], res2[31:0], 2'b00);
RecursiveAdderWM RAWM2(carout, finalres[63:32], res1[63:32], res2[63:32], intermediate);

assign res = finalres[31:0];

endmodule
