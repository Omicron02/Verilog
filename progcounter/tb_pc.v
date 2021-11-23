`timescale 1 ns / 100 ps
`define TESTVECS 5

module tb;
  reg clk, reset, inc, add, sub;
  reg [15:0] offset;
  wire [15:0] pc;
  reg [18:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin 
  $dumpfile("tb_pc.vcd"); 
  $dumpvars(0,tb); 
  end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][18:16] = 3'b100;
    test_vecs[0][15:0] = 15'hxx;
    test_vecs[1][18:16] = 3'b010;
    test_vecs[1][15:0] = 15'ha5;
    test_vecs[2][18:16] = 3'b000;
    test_vecs[2][15:0] = 15'hxx;
    test_vecs[3][18:16] = 3'b100;
    test_vecs[3][15:0] = 15'hxx;
    test_vecs[4][18:16] = 3'b001;
    test_vecs[4][15:0] = 15'h14;
  end
  initial {inc, add, sub, offset} = 0;
  pc pc_0 (clk, reset, inc, add, sub, offset, pc);
  initial begin
    for(i=0;i<`TESTVECS;i=i+1) begin 
       #10 {inc, add, sub, offset}=test_vecs[i]; 
    end
    #100 $finish;
  end
always@(reset or inc or add or sub )
$monitor($time," Reset= %b, inc=%b, add=%b, sub = %b, pc =%h ",reset,inc,add,sub,pc);
endmodule
