module full_adder_tb;
    reg a,b,c;
    wire sum,carry;
    full_adder F(a,b,c,sum,carry);
    initial begin
        a=0;b=0;c=0;
        repeat (2) begin
            repeat (2) begin
                repeat (2) begin
                    #100 c=~c;
                end
                b=~b;
            end
            a=~a;
        end
    end
    initial begin
        $monitor($time,"s a=%b, b=%b, c=%b, sum=%b, carry=%b",a,b,c,sum,carry);
    end
    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0,full_adder_tb);
    end 
endmodule