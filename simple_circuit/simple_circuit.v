module simple_circuit(a,b,c,d,e);
    output d,e;
    input a,b,c;
    wire w1;
    and G1(w1,a,b);
    not G2(e,c);
    or G3(d,w1,e);
endmodule
