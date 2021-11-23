module not1_tb;
    reg a;
    wire b;
    not not1_tb(b,a);
    initial
    begin
        #000 a=0;
        #100 a=1;
    end
    initial
    begin
        $monitor($time,"s a=%b, b=%b",a,b);
    end
    initial
    begin
        $dumpfile("not1_tb.vcd");
        $dumpvars(0,not1_tb);
    end
endmodule

