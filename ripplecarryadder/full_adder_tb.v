module full_adder_tb;
reg a,b,c;
wire sum,carry;
full_adder F(a,b,c,sum,carry);
initial begin
#00 a=0;b=0;c=0;
#10 a=0;b=0;c=1;
#10 a=0;b=1;c=0;
#10 a=0;b=1;c=1;
#10 a=1;b=0;c=0;
#10 a=1;b=0;c=1;
#10 a=1;b=1;c=0;
#10 a=1;b=1;c=1;
end
initial begin
$monitor($time," a=%b, b=%b, c=%b, sum=%b, carry=%b",a,b,c,sum,carry);
end
initial begin
$dumpfile("full_adder.vcd");
$dumpvars(0,full_adder_tb);
end 
endmodule