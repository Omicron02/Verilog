module df(input wire clk, d, output wire o);
    reg data;
    always @(posedge clk)
        data <= d;
    assign o = data;
endmodule

module df_4b(input wire clk, input wire [3:0] d, output wire [3:0] o);
    df dff0(clk, d[0], o[0]);
    df dff1(clk, d[1], o[1]);
    df dff2(clk, d[2], o[2]);
    df dff3(clk, d[3], o[3]);
endmodule

module mux4x1_4b(input wire [3:0] i0, i1, i2, i3, input wire [1:0] op, output wire [3:0] y);
    wire [3:0] w0, w1;
    assign w0 = op[0]?i1:i0;
    assign w1 = op[0]?i3:i2;
    assign y = op[1]?w1:w0;
endmodule

module shiftreg(input wire clk, input wire [3:0] i, input wire [1:0] op, output wire [3:0] y);
    wire [3:0] x, out, i0, i1, i2, i3;
    df_4b dfset(clk, i, x);
    assign i0 = {i[2:0], 1'b0};
    assign i1 = {1'b0, i[3:1]};
    assign i2 = {i[2:0], i[3]};
    assign i3 = {i[0], i[3:1]};
    mux4x1_4b mux(i0, i1, i2, i3, op, out);
    df_4b dfshift(clk, out, y);
endmodule
