module full_adder(a,b,c,sum,carry);
output sum,carry;
input a,b,c;
wire w[3:0];
xor G1(sum,a,b,c);
and G2(w[1],a,b);
and G3(w[2],b,c);
and G4(w[3],a,c);
or G5(carry,w[1],w[2],w[3]);
endmodule