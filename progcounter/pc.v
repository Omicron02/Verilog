module fa (input wire i0, i1, cin, output wire sum, cout);
wire t0, t1, t2;
xor _i0 (sum, i0, i1, cin);
and _i1 (t0, i0, i1);
and _i2 (t1, i0, cin);
and _i3 (t2, i1, cin);
or _i4 (cout, t0, t1, t2);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
wire t;
fa _i0 (i0, t, cin, sumdiff, cout);
xor _i1 (t, i1, addsub);
endmodule

module pc_slice (input wire clk, reset, cin, load, inc, sub, offset,
output wire cout, pc);
wire inc_, t, sumdiff;
not not_0 (inc_, inc);
and and_0 (t, inc_, offset);
addsub addsub_0 (sub, pc, t, cin, sumdiff, cout);
dfrl dfrl_0 (clk, reset, load, sumdiff, pc);
endmodule

module pc_slice0 (input wire clk, reset, cin, load, inc, sub, offset,  output wire cout, pc);
  
wire t, sumdiff;
or or_0 (t, inc, offset);
addsub addsub_0 (sub, pc, t, cin, sumdiff, cout);
dfrl dfrl_0 (clk, reset, load, sumdiff, pc);
endmodule

module pc (input wire clk, reset, inc, add, sub, input wire [15:0] offset, output wire [15:0] pc);
wire load;
wire [15:0] c;
or or_0 (load, inc, add, sub);
pc_slice0 pc_slice_0 (clk, reset, sub, load, inc, sub, offset[0], c[0], pc[0]);
genvar i;
generate
  for (i = 1; i<16; i=i+1) begin
    pc_slice pc_slice_ (clk, reset, c[i-1], load, inc, sub, offset[i], c[i], pc[i]);
  end
endgenerate
endmodule
