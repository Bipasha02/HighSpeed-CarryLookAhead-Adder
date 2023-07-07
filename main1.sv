// A 4-bit ripple carry adder

// Verilog code :1

module ripple_carry_adder (Cin,A,B,S,Cout);
	parameter n=4;
	input Cin;
	input [n-1:0] A, B;
	output reg [n-1:0] S;
	output reg Cout;
	reg[n:0] C;
	integer k;  

	always@ (Cin,A,B)
	begin
		C[0]=Cin;
		for(k=0; k<=n-1; k=k+1)


		begin
           	S[k]= A[k]^B[k]^C[k];
			C[k+1]=(A[k] & B[k])|(A[k] & C[k])|(B[k] & C[k]);
		end
			Cout= C[k]; 
	end
endmodule
