

module CSA22 (a1, a2, a3, b1, b2); // 62 X 62 x 63 -> 63 x 63

input [61:0] a1;
input [61:0] a2;
input [62:0] a3;
output [62:0] b1;
output [62:0] b2;

fullAdder FA1(a1[0], a2[0], a3[0], b1[0], b2[1]);
fullAdder FA2(a1[1], a2[1], a3[1], b1[1], b2[2]);
fullAdder FA3(a1[2], a2[2], a3[2], b1[2], b2[3]);
fullAdder FA4(a1[3], a2[3], a3[3], b1[3], b2[4]);
fullAdder FA5(a1[4], a2[4], a3[4], b1[4], b2[5]);
fullAdder FA6(a1[5], a2[5], a3[5], b1[5], b2[6]);
fullAdder FA7(a1[6], a2[6], a3[6], b1[6], b2[7]);
fullAdder FA8(a1[7], a2[7], a3[7], b1[7], b2[8]);
fullAdder FA9(a1[8], a2[8], a3[8], b1[8], b2[9]);
fullAdder FA10(a1[9], a2[9], a3[9], b1[9], b2[10]);

fullAdder FA11(a1[10], a2[10], a3[10], b1[10], b2[11]);
fullAdder FA12(a1[11], a2[11], a3[11], b1[11], b2[12]);
fullAdder FA13(a1[12], a2[12], a3[12], b1[12], b2[13]);
fullAdder FA14(a1[13], a2[13], a3[13], b1[13], b2[14]);
fullAdder FA15(a1[14], a2[14], a3[14], b1[14], b2[15]);
fullAdder FA16(a1[15], a2[15], a3[15], b1[15], b2[16]);
fullAdder FA17(a1[16], a2[16], a3[16], b1[16], b2[17]);
fullAdder FA18(a1[17], a2[17], a3[17], b1[17], b2[18]);
fullAdder FA19(a1[18], a2[18], a3[18], b1[18], b2[19]);
fullAdder FA20(a1[19], a2[19], a3[19], b1[19], b2[20]);

fullAdder FA21(a1[20], a2[20], a3[20], b1[20], b2[21]);
fullAdder FA22(a1[21], a2[21], a3[21], b1[21], b2[22]);
fullAdder FA23(a1[22], a2[22], a3[22], b1[22], b2[23]);
fullAdder FA24(a1[23], a2[23], a3[23], b1[23], b2[24]);
fullAdder FA25(a1[24], a2[24], a3[24], b1[24], b2[25]);
fullAdder FA26(a1[25], a2[25], a3[25], b1[25], b2[26]);
fullAdder FA27(a1[26], a2[26], a3[26], b1[26], b2[27]);
fullAdder FA28(a1[27], a2[27], a3[27], b1[27], b2[28]);
fullAdder FA29(a1[28], a2[28], a3[28], b1[28], b2[29]);
fullAdder FA30(a1[29], a2[29], a3[29], b1[29], b2[30]);

fullAdder FA31(a1[30], a2[30], a3[30], b1[30], b2[31]);
fullAdder FA32(a1[31], a2[31], a3[31], b1[31], b2[32]);
fullAdder FA33(a1[32], a2[32], a3[32], b1[32], b2[33]);
fullAdder FA34(a1[33], a2[33], a3[33], b1[33], b2[34]);
fullAdder FA35(a1[34], a2[34], a3[34], b1[34], b2[35]);
fullAdder FA36(a1[35], a2[35], a3[35], b1[35], b2[36]);
fullAdder FA37(a1[36], a2[36], a3[36], b1[36], b2[37]);
fullAdder FA38(a1[37], a2[37], a3[37], b1[37], b2[38]);
fullAdder FA39(a1[38], a2[38], a3[38], b1[38], b2[39]);
fullAdder FA40(a1[39], a2[39], a3[39], b1[39], b2[40]);

fullAdder FA41(a1[40], a2[40], a3[40], b1[40], b2[41]);
fullAdder FA42(a1[41], a2[41], a3[41], b1[41], b2[42]);
fullAdder FA43(a1[42], a2[42], a3[42], b1[42], b2[43]);
fullAdder FA44(a1[43], a2[43], a3[43], b1[43], b2[44]);
fullAdder FA45(a1[44], a2[44], a3[44], b1[44], b2[45]);
fullAdder FA46(a1[45], a2[45], a3[45], b1[45], b2[46]);
fullAdder FA47(a1[46], a2[46], a3[46], b1[46], b2[47]);
fullAdder FA48(a1[47], a2[47], a3[47], b1[47], b2[48]);
fullAdder FA49(a1[48], a2[48], a3[48], b1[48], b2[49]);
fullAdder FA50(a1[49], a2[49], a3[49], b1[49], b2[50]);

fullAdder FA51(a1[50], a2[50], a3[50], b1[50], b2[51]);
fullAdder FA52(a1[51], a2[51], a3[51], b1[51], b2[52]);
fullAdder FA53(a1[52], a2[52], a3[52], b1[52], b2[53]);
fullAdder FA54(a1[53], a2[53], a3[53], b1[53], b2[54]);
fullAdder FA55(a1[54], a2[54], a3[54], b1[54], b2[55]);
fullAdder FA56(a1[55], a2[55], a3[55], b1[55], b2[56]);
fullAdder FA57(a1[56], a2[56], a3[56], b1[56], b2[57]);
fullAdder FA58(a1[57], a2[57], a3[57], b1[57], b2[58]);
fullAdder FA59(a1[58], a2[58], a3[58], b1[58], b2[59]);
fullAdder FA60(a1[59], a2[59], a3[59], b1[59], b2[60]);

fullAdder FA61(a1[60], a2[60], a3[60], b1[60], b2[61]);
fullAdder FA62(a1[61], a2[61], a3[61], b1[61], b2[62]);

assign b1[62] = a3[62];
assign b2[0] = 1'b0;

endmodule
