module nand2_tb;
    reg a,b;
    wire c;
    nand nand2_tb(c,a,b);
    initial
    begin
        #000 a=0;b=0;
        #100 a=0;b=1;
        #100 a=1;b=0;
        #100 a=1;b=1;
    end
    initial
    begin
        $monitor($time,"s a=%b, b=%b, c=%b",a,b,c);
    end
    initial
    begin
        $dumpfile("nand2_tb.vcd");
        $dumpvars(0,nand2_tb);
    end
endmodule

