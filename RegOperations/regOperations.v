module dfr(input wire clk, reset, d, output wire o);
    reg memory;
    wire d_in;
    assign d_in = reset ? 0 : d;
    always @(posedge clk) memory <= d_in;
    assign o = memory;
endmodule

module dfr_4(input wire clk, reset, input wire [3:0] d, output wire [3:0] o);
    dfr dfr_0(clk, reset, d[0], o[0]);
    dfr dfr_1(clk, reset, d[1], o[1]);
    dfr dfr_2(clk, reset, d[2], o[2]);
    dfr dfr_3(clk, reset, d[3], o[3]);
endmodule

module mux_4x1(input wire [3:0] i, input wire [1:0] s, output wire o);
    assign o = s[0]?s[1]?i[3]:i[1]:s[1]?i[2]:i[0];
endmodule

module RegOperations(input wire clk, reset, input wire [3:0] i, input wire [1:0] s, output wire [3:0] o);
    wire [3:0] w;
    assign w[0] = ~i[0];
    assign w[1] = ~i[1];
    assign w[2] = ~i[2];
    assign w[3] = ~i[3];
    wire [3:0] t;
    mux_4x1 m0({1'b0, i[1], w[0], i[0]}, s, t[0]);
    mux_4x1 m1({i[0], i[2], w[1], i[1]}, s, t[1]);
    mux_4x1 m2({i[1], i[3], w[2], i[2]}, s, t[2]);
    mux_4x1 m3({i[2], 1'b0, w[3], i[3]}, s, t[3]);
    dfr_4 dfr4(clk, reset, t, o);
endmodule



