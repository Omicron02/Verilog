module half_adder(a,b,sum,carry);
    output sum,carry;
    input a,b;
    xor Sum(sum,a,b);
    and Carry(carry,a,b);
endmodule
