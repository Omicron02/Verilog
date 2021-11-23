// Write code for modules you need here




module dfrl_16 (input wire clk, reset, load, input wire [15:0] in, output wire [15:0] out);

genvar i;
  generate 
    for(i=0;i<16;i=i+1) begin
    dfrl dfrl_(clk, reset, load, in[i], out[i]);
    end
  endgenerate
endmodule

module mux8_16 (input wire [0:15] i0, i1, i2, i3, i4, i5, i6, i7, input wire [0:2] j, 
output wire [0:15] o);
  
genvar i;
  generate 
    for(i=0;i<16;i=i+1) begin
      mux8 mux8_({i0[i], i1[i], i2[i], i3[i], i4[i], i5[i], i6[i], i7[i]}, j[0], j[1], j[2], o[i]);
    end
  endgenerate
 
endmodule
 
module reg_file (input wire  clk, reset, wr, input wire [0:2] rd_addr_a, 
rd_addr_b, wr_addr, input wire [0:15] d_in, 
output wire [0:15] d_out_a, d_out_b);
  
wire [0:7] load;
  wire [0:15] dout_0, dout_1, dout_2, dout_3, dout_4, dout_5, dout_6, dout_7;
  dfrl_16 dfrl_16_0(clk, reset, load[0], d_in, dout_0);
  dfrl_16 dfrl_16_1(clk, reset, load[1], d_in, dout_1);
  dfrl_16 dfrl_16_2(clk, reset, load[2], d_in, dout_2);
  dfrl_16 dfrl_16_3(clk, reset, load[3], d_in, dout_3);
  dfrl_16 dfrl_16_4(clk, reset, load[4], d_in, dout_4);
  dfrl_16 dfrl_16_5(clk, reset, load[5], d_in, dout_5);
  dfrl_16 dfrl_16_6(clk, reset, load[6], d_in, dout_6);
  dfrl_16 dfrl_16_7(clk, reset, load[7], d_in, dout_7);
  demux8 demux8_0(wr, wr_addr[2], wr_addr[1], wr_addr[0], load);
  mux8_16 mux8_16_9(dout_0, dout_1, dout_2, dout_3, dout_4, dout_5, dout_6, dout_7, rd_addr_a, d_out_a);
  mux8_16 mux8_16_10(dout_0, dout_1, dout_2, dout_3, dout_4, dout_5, dout_6, dout_7, rd_addr_b, d_out_b);
endmodule



