module half_adder_tb;
    reg a,b;
    half_adder M1(a,b,sum,carry);
    initial begin
        #000 a=0;b=0;
        #100 a=0;b=1;
        #100 a=1;b=0;
        #100 a=1;b=1;
    end
    initial begin
        $monitor($time,"s a=%b, b=%b, sum=%b, carry=%b",a,b,sum,carry);
    end
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0,half_adder_tb);
    end 
endmodule

		