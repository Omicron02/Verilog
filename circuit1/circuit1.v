module circuit1(a,b,c,d);
    output d;
    input a,b,c;
    wire x;
    and G1(x,b,c);
    or G2(d,a,x);
endmodule
