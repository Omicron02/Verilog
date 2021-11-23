module nor2_tb;
    reg a,b;
    wire c;
    nor nor2_tb(c,a,b);
    initial
    begin
        #000 a=0;b=0;
        #100 a=0;b=1;
        #100 a=1;b=0;
        #100 a=1;b=1;
    end
    initial
    begin
        $monitor($time,"s a=%b,b=%b,c=%b",a,b,c);
    end
    initial
    begin
        $dumpfile("nor2_tb.vcd");
        $dumpvars(0,nor2_tb);
    end
endmodule

