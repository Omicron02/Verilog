module dfr(input wire clk, reset, d, output wire out);
    reg memory;
    wire d_in;
    assign d_in = reset ? 0 : d;
    always @(posedge clk) memory <= d_in;
    assign out = memory;
endmodule

module dfr_4bit(input wire clk, reset, input wire [3:0] d, output wire [3:0] out);
    dfr dfr_0(clk, reset, d[0], out[0]);
    dfr dfr_1(clk, reset, d[1], out[1]);
    dfr dfr_2(clk, reset, d[2], out[2]);
    dfr dfr_3(clk, reset, d[3], out[3]);
endmodule

module productreg(input wire clk, reset, Cin, input wire [3:0] Ain, Qin, output wire Cout, output wire [3:0] Aout, Qout);
    dfr_4bit Q(clk, reset, Qin, Qout);
    dfr_4bit A(clk, reset, Ain, Aout);
    dfr C(clk, reset, Cin, Cout);
endmodule

module ctrlsqcr(input wire clk, reset, Cin, input wire [3:0] Ain, Qin, Min, output wire Cout, output wire [3:0] Aout, Qout);
    wire [3:0] add, sum, A, Q, Ashift, Qshift;
    wire carry, C, Cshift;
    assign add = Qin[0] ? Min : 4'b0000;
    rca rca_0(Ain, add, 1'b0, sum, carry);
    productreg productreg_add(clk, reset, carry, sum, Qin, C, A, Q);
    assign Qshift = {A[0], Q[3:1]};
    assign Ashift = {C, A[3:1]};
    assign Cshift = 1'b0;
    productreg productreg_shift(clk, reset, Cshift, Ashift, Qshift, Cout, Aout, Qout);
endmodule

module seqmul(input wire clk, reset, Cin, input wire [3:0] Ain, Qin, Min, output wire Cout, output wire [3:0] Aout, Qout, Mout);
    wire [3:0] A [3:0];
    wire [3:0] Q [3:0];
    wire [3:0] C;
    dfr_4bit M(clk, reset, Min, Mout);
    productreg init(clk, reset, Cin, Ain, Qin, C[0], A[0], Q[0]);
    ctrlsqcr ctrlsqcr_0(clk, reset, C[0], A[0], Q[0], Mout, C[1], A[1], Q[1]);
    ctrlsqcr ctrlsqcr_1(clk, reset, C[1], A[1], Q[1], Mout, C[2], A[2], Q[2]);
    ctrlsqcr ctrlsqcr_2(clk, reset, C[2], A[2], Q[2], Mout, C[3], A[3], Q[3]);
    ctrlsqcr ctrlsqcr_3(clk, reset, C[3], A[3], Q[3], Mout, Cout, Aout, Qout);
endmodule