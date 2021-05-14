`include "./Verilog_source_files/FloatingPointMultiplier32bit/Mul.v"
`include "./Verilog_source_files/FloatingPointMultiplier32bit/swap.v"
`include "./Verilog_source_files/FloatingPointMultiplier32bit/shifters.v"
`include "./Verilog_source_files/FloatingPointMultiplier32bit/split.v"
`include "./Verilog_source_files/FloatingPointMultiplier32bit/triArr.v"


module FPM(input [31:0] I1, input [31:0] I2, output [31:0] out);

    // reg [31:0] I1,I2;
    // wire [31:0]out;

    wire [31:0]A,B;
    Swap SW1(I1,I2,A,B);

    wire S1,S2;
    wire [7:0] E1,E2;
    wire [22:0] M1,M2;

    Split SP1(A,S1,E1,M1);
    Split SP2(B,S2,E2,M2);

    // Summing up the Exponents
    wire [31:0]Ednm,Eout;
    wire  Carr;
    CLA CL1(Ednm,Carr,{24'b0,E1},{24'b0,E2},1'b0); 
    CLA CL2(Eout,Carr,Ednm,~(32'd127),1'b1);

    wire [31:0]N1,N2;
    wire [63:0]P;
    assign N1 = {|E1,M1};
    assign N2 = {|E2,M2};

    WallaceMul Wm(N1,N2,P);

    TriArr T1(A,&E1 & |B[30:0],out);
    TriArr T2(B,~(|B[30:0]) & ~&E1,out);
    TriArr T3({32{1'b1}},&E1 & ~(|B[30:0]),out);

    //Case of overflow
    wire [31:0]EoutShift;
    CLA CL3(EoutShift,Carr,Eout,32'b1,1'b0);
    TriArr T4({S1^S2,EoutShift[7:0],P[46:24]},P[47] & ~(&E1 | ~(|B[30:0])),out);
    //Normal Case
    TriArr T5({S1^S2,Eout[7:0],P[45:23]},~P[47] & P[46] & ~(&E1 | ~(|B[30:0])),out);
    //Case of Underflow
    genvar i;
    wire [31:0]shift;
    generate
        for(i=0;i<47;i=i+1)
        begin : LV
            wire prev1;
            wire [31:0]tmpi;
            if(i==0)
                assign prev1 = 1'b0;
            else
            begin
                assign tmpi= i;
                or R(prev1, LV[i-1].prev1, P[46-i]);
                TriArr T7(tmpi,~LV[i-1].prev1 & P[46-i],shift);            
            end
        end
    endgenerate
    wire [31:0]Enew;
    CLA CL4(Enew,Carr,Eout,~shift,1'b1);

    //2 case -ve Enew and +ve Enew
    wire [31:0] MoutC1,MoutC2;
    RightShift RS1(P[45:14],shift[7:0],MoutC1);
    LeftShift LS1(P[45:14],Eout[7:0],MoutC2);

    //Case 1 can shift without Enegative
    TriArr T6({S1^S2,Enew[7:0],MoutC1[31:9]},~P[47] & ~P[46] & ~&E1 & (|B[30:0]) & ~Enew[31],out);
    //Case 2 shift would make negative
    TriArr T7({S1^S2,8'b0,MoutC2[31:9]},~P[47] & ~P[46] & ~&E1 & (|B[30:0]) & Enew[31],out);

//     initial
//     begin
//         // case infinity
//         #0 I2={1'b0,{8{1'b1}},23'b0}; I1={1'b0,{7{1'b1}},24'b111011};

//         // case zero
//         #10 I2={32'b0}; I1=32'b00111111110010100011110101110001;

//         // case infinity and zero (out = NAN)
//         #10 I2={1'b0,{8{1'b1}},23'b0}; I1=32'b0;

//         // 10000 - 800
//         #10 I1=32'b01000110000111000100000000000000;I2=32'b11000101111110100000000000000000;

//         // 800 - 800
//         #10 I1=32'b01000101111110100000000000000000;I2=32'b11000101111110100000000000000000;

//         //1.234 + 63.201 = (supposed) 64.435 but gets 64.4349975586 because of floating point precision error
//         #10 I1=32'b00111111100111011111001110110110;I2=32'b01000010011111001100110111010011;

//         // 9.75 + 0.5625 = 10.3125
//         #10 I1={1'b0,{8'b10000010},23'b00111000000000000000000}; I2={1'b0,{8'b01111110},23'b00100000000000000000000};

//         // denormal
//         #20 I1=32'b00000000000000000000000100000001; I2=32'b01000000000000000000000000000000;

//         // 2 , 9
//         #40 I1 = 32'b01000000000000000000000000000000; I2 = 32'b01000001000100000000000000000000;
//     end
//     initial
//     begin
//         $monitor($time, " A=%b B=%b\tC=%b\n",I1,I2,out);
//    end

endmodule
