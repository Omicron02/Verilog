module dfr(input wire clk, reset, d, output wire q, _q);
    wire tmp;
    reg M;
    assign tmp = reset ? 0 : d;
    always @(posedge clk)
        M <= tmp;
    assign q = M;
    assign _q = !M;
endmodule

module mod3count(input wire clk, reset, input wire [2:0] d, output wire [2:0] q);
    wire [2:0] _q;
    dfr dfr0(clk, reset, d[0], q[0], _q[0]);
    dfr dfr1(_q[0], reset, d[1], q[1], _q[1]);
    dfr dfr2(_q[1], reset, d[2], q[2], _q[2]);
endmodule

// module mod3count(input wire clk, reset, [2:0] d, output wire [2:0] q);
