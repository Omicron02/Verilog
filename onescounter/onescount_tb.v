`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
    reg [6:0] in;
    reg [6:0] testvecs [0:(`TESTVECS-1)];
    output [2:0] count;

    initial begin
        testvecs[0] = 7'b1010011;
        testvecs[1] = 7'b0111101;
        testvecs[2] = 7'b1111111;
        testvecs[3] = 7'b0000111;
        testvecs[4] = 7'b1000010;
        testvecs[5] = 7'b0010000;
        testvecs[6] = 7'b1011111;
        testvecs[7] = 7'b0110011;
    end
    
    initial {in} = 0;
    onescount oc(in, count);

    integer i;
    initial begin
        for (i = 0; i < `TESTVECS; i = i + 1) begin
            #10 {in} = testvecs[i];
        end
    end

    initial begin
        $monitor($time, " input = %b, count = %b (%d)", in, count, count);
    end

    initial begin 
        $dumpfile("onescount.vcd"); 
        $dumpvars(0,tb); 
    end
endmodule