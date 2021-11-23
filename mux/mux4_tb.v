module mux4_tb;
    reg [3:0] i;
    reg [1:0] j;
    wire o;
    mux4 m(o,i,j);
    initial begin 
        i=4'b0001;j=2'b00; #100
        i=4'b0010;j=2'b01; #100
        i=4'b0100;j=2'b10; #100
        i=4'b1000;j=2'b11; #100;
    end
    initial begin
        $monitor($time,"s i=%b, j=%b, o=%b",i,j,o);
    end
    initial begin
        $dumpfile("mux4.vcd");
        $dumpvars(0,mux4_tb);
    end
endmodule