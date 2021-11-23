module dfrl_16 (input wire  clk, reset, load, input wire [0:15] in, output wire [0:15] out);
  genvar i;
  generate 
    for(i=0;i<16;i=i+1) begin
    dfrl dfrl_(clk, reset, load, in[i], out[i]);
    end
  endgenerate
endmodule

module mux2_16 (input wire [15:0] i0, i1, input wire j, output wire [15:0] o);
  genvar i;
  generate 
    for(i=0;i<16;i=i+1) begin
      mux2 mux2_ (i0[i], i1[i], j, o[i]);
    end
  endgenerate
endmodule

module mux8_16 (input wire [0:15] i0, i1, i2, i3, i4, i5, i6, i7, input wire [0:2] j, output wire [0:15] o);
  genvar i;
  generate 
    for(i=0;i<16;i=i+1) begin
      mux8 mux8_({i0[i], i1[i], i2[i], i3[i], i4[i], i5[i], i6[i], i7[i]}, j[0], j[1], j[2], o[i]);
    end
  endgenerate
endmodule

module reg_file (input wire  clk, reset, wr, input wire [0:2] rd_addr_a, rd_addr_b, wr_addr, input wire [0:15] d_in, output wire [0:15] d_out_a, d_out_b);
  wire [0:7] load;
  wire [0:15] dout [0:7];
  genvar i;
  generate 
    for(i=0;i<8;i=i+1) begin
      dfrl_16 dfrl_16_(clk, reset, load[i], d_in, dout[i]);
    end
  endgenerate

  demux8 demux8_0(wr, wr_addr[2], wr_addr[1], wr_addr[0], load);
  mux8_16 mux8_16_9(dout[0],dout[1], dout[2], dout[3], dout[4], dout[5], dout[6], dout[7], rd_addr_a, d_out_a);
  mux8_16 mux8_16_10(dout[0],dout[1], dout[2], dout[3], dout[4], dout[5], dout[6], dout[7], rd_addr_b, d_out_b);
endmodule

module reg_alu (input wire clk, reset, sel, wr, input wire [1:0] op, input wire [2:0] rd_addr_a,
  rd_addr_b, wr_addr, input wire [15:0] d_in, output wire [15:0] d_out_a, d_out_b, output wire cout);
  wire [15:0] d_in_alu, d_in_reg; wire cout_0;
  alu alu_0 (op, d_out_a, d_out_b, d_in_alu, cout_0);
  reg_file reg_file_0 (clk, reset, wr, rd_addr_a, rd_addr_b, wr_addr, d_in_reg, d_out_a, d_out_b);
  mux2_16 mux2_16_0 (d_in, d_in_alu, sel, d_in_reg);
  dfr dfr_0 (clk, reset, cout_0, cout);
endmodule
