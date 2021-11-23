`timescale 1 ns / 100 ps
module tb;
reg clk, reset;
reg [2:0] d;
output [2:0] q;

initial begin $dumpfile("mod3.vcd");
$dumpvars(0,tb);
#150 $finish;
end
initial begin reset = 1'b1;
#10 assign reset = q[1]&q[2];
end
initial clk = 1'b0;
always begin
#5 clk = ~clk;
assign d = q;
end

initial d = 3'b000;
mod3count m3c(clk, reset, d, q);
always @(q) begin $display($time, " q = %b", q);

end
endmodule