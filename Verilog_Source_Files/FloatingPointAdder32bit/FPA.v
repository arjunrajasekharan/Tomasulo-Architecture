`include "./Verilog_source_files/FloatingPointAdder32bit/swap.v"
`include "./Verilog_source_files/FloatingPointAdder32bit/cla.v"
`include "./Verilog_source_files/FloatingPointAdder32bit/shifters.v"
`include "./Verilog_source_files/FloatingPointAdder32bit/split.v"

module FPA(input [31:0]I1,input [31:0]I2,output [31:0]out);
    wire [31:0]A,B;
    Swap SW(I1,I2,A,B);


    wire S1,S2;
    wire [7:0] E1,E2;
    wire [22:0] M1,M2;

    Split SP1(A,S1,E1,M1);
    Split SP2(B,S2,E2,M2);

    wire  [7:0]Ediff;
    assign Ediff = E1 - E2;

    wire [31:0] N1,N2,N3;
    assign N1 = {|E1,M1};   //Reduction or handles zeroes
    assign N2 = {|E2,M2};   //and denormal numbers

    RightShift BS(N2,Ediff,N3);

    wire [31:0]N4;
    assign N4 = {32{S1^S2}}^N3;

    wire [31:0]Sum;
    wire Carry;
    CLA C1(N1,N4,S1^S2,Sum,Carry);

    reg [22:0] M3,tmp;
    reg [7:0] E3;

    integer i =0;

    always @*
    begin
        if(Sum[24]==1'b1)
        begin
            M3 = Sum[23:1];
            E3 = E1 + 1'b1;
        end
        else if(Sum[23]==1'b0)
        begin
            i = 1;
            while(Sum[23-i] == 1'b0)
            begin
                i = i+1;
            end 
            E3 = E1 - i;
            tmp = Sum[22:0];
            M3 = tmp<<i;
        end
        else
        begin
            M3 = Sum[22:0];
            E3 = E1;
        end
    end

    reg [31:0]out;
    always @*
    begin
        // Case for infinity
        if(&E1 == 1'b1 && |M1 == 1'b0)
            out = {S1,{8{1'b1}},23'b0};
        else if(|E1==1'b0 && |E2==1'b0)
            out = {S1,{8'b0},Sum[22:0]};
        //Handles normal + NaN 
        else 
            out = {S1,{8{|Sum}} & E3,M3}; // reduction or for 0 case
    end

endmodule

// module top;

//     reg [31:0] I1,I2;
//     wire [31:0]out;

//     Adder A(I1,I2,out);
    
//     initial
//     begin
//         // case infinity
//         #0 I1={1'b0,{8{1'b1}},23'b0}; I2={1'b0,{7{1'b1}},24'b111011};

//         // Adding denormal
//         #10 I1={31'b0,1'b1}; I2=32'b0;

//         // 10000 - 800
//         #10 I1=32'b01000110000111000100000000000000;I2=32'b11000101111110100000000000000000;

//         // 800 - 800
//         #10 I1=32'b01000101111110100000000000000000;I2=32'b11000101111110100000000000000000;

//         //1.234 + 63.201 = (supposed) 64.435 but gets 64.4349975586 because of floating point precision error
//         #10 I1=32'b00111111100111011111001110110110;I2=32'b01000010011111001100110111010011;

//         // 9.75 + 0.5625 = 10.3125
//         #10 I1={1'b0,{8'b10000010},23'b00111000000000000000000}; I2={1'b0,{8'b01111110},23'b00100000000000000000000};

//         // -6 + -8 = -14
//         #20 I1={1'b1,{8'b10000001},23'b10000000000000000000000}; I2={1'b1,{8'b10000010},23'b00000000000000000000000};

//         // -6 + 8 = 2
//         #30 I1={1'b1,{8'b10000001},23'b10000000000000000000000}; I2={1'b0,{8'b10000010},23'b00000000000000000000000};
//     end
//     initial
//     begin
//         $monitor($time, " A=%b B=%b\tC=%b\n",I1,I2,out);
//     end

// endmodule
