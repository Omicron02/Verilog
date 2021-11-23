module circuit2(a,b,c,d);
    output d;
    input a,b,c;
    wire x,y,z;
    and G1(x,b,c);
    or G2(y,a,x);
    and G3(z,a,b);
    or G4(d,y,z);
endmodule
