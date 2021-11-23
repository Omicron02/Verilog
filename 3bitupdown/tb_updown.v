`timescale 1 ns / 100 ps
module updown_tb;
reg clk, reset, u;
reg [2:0] q;
output [2:0] out;

initial begin $dumpfile("updown.vcd");
$dumpvars(0,updown_tb);
#150 $finish;
end
initial begin reset = 1'b1;
#10 reset = 1'b0;
end
initial clk = 1'b0;
always #5 clk = ~clk;
initial u = 1'b0;
always #75 u = ~u;
initial q = 3'b000;
updown updown_0(clk, reset, u, q, out);
always@(out) begin $display($time, " u = %b, number = %b%b%b", u, out[2], out[1], out[0]);
assign q = out;
end
endmodule