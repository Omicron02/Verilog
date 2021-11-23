module full_adder(input wire a, b, c, output wire sum, carry);
    assign sum = a^b^c;
    assign carry = a&b | b&c | a&c;
endmodule

module rca(input wire [3:0] a, b, input wire cin, output wire [3:0] sum, output wire cout);
    wire [2:0] carry;
    full_adder fa_0(a[0], b[0], cin, sum[0], carry[0]);
    full_adder fa_1(a[1], b[1], carry[0], sum[1], carry[1]);
    full_adder fa_2(a[2], b[2], carry[1], sum[2], carry[2]);
    full_adder fa_3(a[3], b[3], carry[2], sum[3], cout);
endmodule