//  verilog code 2 

module carry_lookahead_adder (Cin,A,B,S,C);
	parameter n=4;
	inputCin;
	input [n-1:0] A, B;
	output [n-1:0] S;
	output [n-1:0] C;
	reg [n-1:0] G;
	reg [n-1:0] P;
	integer k;  
	always@ (A, B)
		begin
			for (k=0; k<=n-1; k=k+1)
			begin
				G[k]= (A[k]&B[k]);
           		P[k]= (A[k]^B[k]);
			end
		end
	assign C[0]= G[0] | (P[0] &Cin);
	assign C[1]= G[1] | (P[1] & G[0]) | (P[1] & P[0] &Cin);
   	assign C[2]= G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] &Cin);
   	assign C[3]= G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] &Cin);
	assign S[0]= A[0]^B[0]^C[0];
	assign S[1]= A[1]^B[1]^C[1]; 
	assign S[2]= A[2]^B[2]^C[2]; 
	assign S[3]= A[3]^B[3]^C[3];

endmodule
