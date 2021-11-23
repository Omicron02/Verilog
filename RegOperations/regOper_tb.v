`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
    reg clk, reset;
    reg [1:0] s;
    reg [3:0] in;
    reg [5:0] testvecs [0:(`TESTVECS-1)];
    wire [3:0] o;
    integer i;
    initial begin $dumpfile("RegOper.vcd"); $dumpvars(0,tb); end
    initial begin reset = 1'b1; #12.5 reset = 1'b0; end
    initial clk = 1'b0; always #5 clk =~ clk;

    initial begin
        testvecs[0][5:2] = 4'b1010; testvecs[0][1:0] = 2'b00;
        testvecs[1][5:2] = 4'b0110; testvecs[1][1:0] = 2'b01;
        testvecs[2][5:2] = 4'b1010; testvecs[2][1:0] = 2'b10;
        testvecs[3][5:2] = 4'b0101; testvecs[3][1:0] = 2'b11;
        testvecs[4][5:2] = 4'b1111; testvecs[4][1:0] = 2'b10;
        testvecs[5][5:2] = 4'b0001; testvecs[5][1:0] = 2'b01;
        testvecs[6][5:2] = 4'b0011; testvecs[6][1:0] = 2'b11;
        testvecs[7][5:2] = 4'b1110; testvecs[7][1:0] = 2'b00;
    end

    initial {in, s} = 0;
    RegOperations RegOper(clk, reset, in, s, o);

    initial begin
    for(i=0;i<`TESTVECS;i=i+1) begin 
        $write("in = %b, s = %b, ", in, s);
        #10 {in, s} = testvecs[i];
        $display("o = %b",o);
      end
      
    #50 $finish;
  end
        
endmodule

