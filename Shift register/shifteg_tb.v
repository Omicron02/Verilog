`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
    reg [3:0] i;
    reg [1:0] op;
    reg clk;
    reg [5:0] tvecs [(`TESTVECS-1):0];
    output [3:0] y;
    integer j;

    initial begin
        $dumpfile("shiftreg.vcd"); 
        $dumpvars(0,tb); 
        #100 $finish;
    end

    initial clk = 1'b0; 
    always #5 clk = ~clk;

    initial begin
        tvecs[0][5:2] = 4'b1011; tvecs[0][1:0] = 2'b00;
        tvecs[1][5:2] = 4'b0111; tvecs[1][1:0] = 2'b01;
        tvecs[2][5:2] = 4'b0011; tvecs[2][1:0] = 2'b11;
        tvecs[3][5:2] = 4'b1000; tvecs[3][1:0] = 2'b10;
        tvecs[4][5:2] = 4'b1111; tvecs[4][1:0] = 2'b01;
        tvecs[5][5:2] = 4'b1011; tvecs[5][1:0] = 2'b11;
        tvecs[6][5:2] = 4'b1100; tvecs[6][1:0] = 2'b10;
        tvecs[7][5:2] = 4'b1110; tvecs[7][1:0] = 2'b00;
    end

    initial {i, op} = 0;
    shiftreg sh(clk, i, op, y);

    initial begin
        for(j = 0; j < `TESTVECS; j = j + 1) begin
            #10 {i, op} = tvecs[j];
        end
    end

    always @(y)
        $display($time, "i = %b, op = %b, y = %b", i, op, y);
endmodule