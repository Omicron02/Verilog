`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset, wr, sel;
  reg [1:0] op;
  reg [2:0] rd_addr_a, rd_addr_b, wr_addr; reg [15:0] d_in;
  wire [15:0] d_out_a, d_out_b;
  reg [28:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("tb_reg_alu.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
    test_vecs[0][28:25] = 4'b0100;
    test_vecs[0][24:16] = 9'oxx3; 
    test_vecs[0][15:0] = 16'hcdef;

    test_vecs[1][28:25] = 4'b0100;
    test_vecs[1][24:16] = 9'oxx7;
    test_vecs[1][15:0] = 16'h3210;

    test_vecs[2][28:25] = 4'b0100;
    test_vecs[2][24:16] = 9'o375; 
    test_vecs[2][15:0] = 16'h4567;

    test_vecs[3][28:25] = 4'b0100;
    test_vecs[3][24:16] = 9'o151; 
    test_vecs[3][15:0] = 16'hba98;

    test_vecs[4][28:25] = 4'b0000;
    test_vecs[4][24:16] = 9'o151;
    test_vecs[4][15:0] = 16'hxxxx;

    test_vecs[5][28:25] = 4'b1100;
    test_vecs[5][24:16] = 9'o152; 
    test_vecs[5][15:0] = 16'hxxxx;

    test_vecs[6][28:25] = 4'b1101;
    test_vecs[6][24:16] = 9'o374;
    test_vecs[6][15:0] = 16'hxxxx;

    test_vecs[7][28:25] = 4'b1001;
    test_vecs[7][24:16] = 9'o00x; 
    test_vecs[7][15:0] = 16'hxxxx;
  end
  initial {sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in} = 0;
  reg_alu reg_alu_0 (clk, reset, sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in,
  d_out_a, d_out_b, cout);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {sel, wr, op, rd_addr_a, rd_addr_b, wr_addr, d_in}=test_vecs[i]; end
    #100 $finish;
  end
endmodule
