module FullAdder(A,B,Cin, Sum);
	input A,B, Cin;
	output Sum;
	assign Sum= A^B^Cin;
endmodule

module CLA(A, B, iniC,Sum, Carry);
	input [31:0] A,B;
	output [31:0] Sum;
	output Carry;
	input iniC;
	
	reg [1:0] kgp[0:31];//Each location has two bits
	reg [31:0] Cin;//Input carry after final stage
	
	reg [1:0] kgp2[0:31];//Final kpg array
	reg [1:0] kgp_t1[0:31];//Temporary arrays for changing
	reg [1:0] kgp_t2[0:31];
	reg [5:0] i,j,k,m,n,o;//Loop variables
	reg [1:0] access, inaccess1, inaccess2;//Two bit vectors for each location

	//Bit Zero requires different calculations.`include "FullAdder.v"
	//Using k maps we get equations for bit 0
	always @* begin
	
		//bit0
		//access = kgp[0];
		access[1] = A[0]&B[0] | A[0]&iniC | B[0]&iniC ;
		access[0] = A[0]&B[0] | A[0]&iniC | B[0]&iniC ;
		kgp[0] = access;

		
		o = 6'b000001;//Loop variable---6 bit 32	
		//bit i
		/*
		Kpg calculation takes place here for all the 32 bits
		*/
		while(o<=31)
		begin
			//access = kgp[o];
			access[1] = A[o] & B[o];
			access[0] = A[o] | B[o];
			kgp[o] = access;

			o=o+1;
		end
		
		for(n=0; n<=31; n=n+1)
		begin
			kgp2[n] = kgp[n];//Final array stores the copy of first kpg array initially
			kgp_t2[n] = kgp[n];
			kgp_t1[n] = kgp[n];
		end
		i=6'b000001;//Loop variable for calculation
		//----Calculation takes place as step-i,step-i+2,step-i+4,..step-i+8
		
		while(i<32)//i is number of shifts 
			begin
				j=i;           //j is used to calculate along the whole array the prefix sum of j and j-i
				while(j<32)
					begin
						inaccess1 = kgp_t1[j-i];      //Each bit calculations
						inaccess2 = kgp_t2[j];
						access[1] = inaccess1[1] & inaccess2[0] | inaccess2[1];
						access[0] = inaccess1[0] & inaccess2[0] | inaccess2[1];
						kgp2[j] = access;

						j=j+1;
					end

				
				for(k=0; k<=31; k=k+1)
				begin
					kgp_t1[k] = kgp2[k];//Temporary arrays for the next stage
					kgp_t2[k] = kgp2[k];
				end

				i=i<<1;

			end
		
		m = 6'b000000;
		while(m<32)
			begin
				access = kgp2[m];
				Cin[m] = access[0]&access[1];
				m=m+1;
			end
		
	end

	/*
	Sums are calculated below
	*/
	FullAdder f1(A[0],B[0],iniC,Sum[0]);
	FullAdder f2(A[1],B[1],Cin[0],Sum[1]);
	FullAdder f3(A[2],B[2],Cin[1],Sum[2]);
	FullAdder f4(A[3],B[3],Cin[2],Sum[3]);
	FullAdder f5(A[4],B[4],Cin[3],Sum[4]);
	FullAdder f6(A[5],B[5],Cin[4],Sum[5]);
	FullAdder f7(A[6],B[6],Cin[5],Sum[6]);
	FullAdder f8(A[7],B[7],Cin[6],Sum[7]);
	FullAdder f9(A[8],B[8],Cin[7],Sum[8]);
	FullAdder f10(A[9],B[9],Cin[8],Sum[9]);
	FullAdder f11(A[10],B[10],Cin[9],Sum[10]);
	FullAdder f12(A[11],B[11],Cin[10],Sum[11]);
	FullAdder f13(A[12],B[12],Cin[11],Sum[12]);
	FullAdder f14(A[13],B[13],Cin[12],Sum[13]);
	FullAdder f15(A[14],B[14],Cin[13],Sum[14]);
	FullAdder f16(A[15],B[15],Cin[14],Sum[15]);
	FullAdder f17(A[16],B[16],Cin[15],Sum[16]);
	FullAdder f18(A[17],B[17],Cin[16],Sum[17]);
	FullAdder f19(A[18],B[18],Cin[17],Sum[18]);
	FullAdder f20(A[19],B[19],Cin[18],Sum[19]);
	FullAdder f21(A[20],B[20],Cin[19],Sum[20]);
	FullAdder f22(A[21],B[21],Cin[20],Sum[21]);
	FullAdder f23(A[22],B[22],Cin[21],Sum[22]);
	FullAdder f24(A[23],B[23],Cin[22],Sum[23]);
	FullAdder f25(A[24],B[24],Cin[23],Sum[24]);
	FullAdder f26(A[25],B[25],Cin[24],Sum[25]);
	FullAdder f27(A[26],B[26],Cin[25],Sum[26]);
	FullAdder f28(A[27],B[27],Cin[26],Sum[27]);
	FullAdder f29(A[28],B[28],Cin[27],Sum[28]);
	FullAdder f30(A[29],B[29],Cin[28],Sum[29]);
	FullAdder f31(A[30],B[30],Cin[29],Sum[30]);
	FullAdder f32(A[31],B[31],Cin[30],Sum[31]);

	
	assign Carry = Cin[31];
		
endmodule
