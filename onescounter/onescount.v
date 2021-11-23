module fulladder(input wire a, b, c, output wire sum, carry);
    assign sum = a^b^c;
    assign carry = a&b | b&c | a&c;
endmodule

module fulladder_row1(input wire [5:0] i, output wire [1:0] o1, o2);
    fulladder fa0(i[0], i[1], i[2], o1[0], o1[1]);
    fulladder fa1(i[3], i[4], i[5], o2[0], o2[1]);
endmodule

module fulladder_row2(input wire [1:0] a, b, input wire c, output wire [2:0] count);
    wire carry;
    fulladder fa2(a[0], b[0], c, count[0], carry);
    fulladder fa3(a[1], b[1], carry, count[1], count[2]);
endmodule

module onescount(input wire [6:0] i, output wire [2:0] o);
    wire [1:0] t1, t2;
    fulladder_row1 fa_r1(i[5:0], t1, t2);
    fulladder_row2 fa_r2(t1, t2, i[6], o);
endmodule