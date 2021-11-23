module fa (input wire i0, i1, cin, output wire sum, cout);
    wire [2:0] t;
    xor _i0 (sum,i0,i1,cin);
    and _i1 (t[0],i0,cin);
    and _i2 (t[1],i1,cin);
    and _i3 (t[2],i1,i0);
    or _i4 (cout,t[0],t[1],t[2]);
endmodule

module addsub (input wire addsub, i0, i1, cin, output wire sumdiff, cout);
    wire t;
    fa _i0 (i0,t,cin,sumdiff,cout);
    xor _i1 (t,i1,addsub);
endmodule

module alu_slice (input wire [1:0] op, input wire i0, i1, cin, output wire o, cout);
    wire t_sumdiff, t_and, t_or, t_andor;
    addsub _i0 (op[0],i0,i1,cin,t_sumdiff,cout);
    and _i1 (t_and,i0,i1);
    or _i2 (t_or,i0,i1);
    assign t_andor = op[0]?t_or:t_and;
    assign o = op[1]?t_andor:t_sumdiff;
endmodule

module alu (input wire [1:0] op, input wire [15:0] i0, i1, output wire [15:0] o, output wire cout);
    wire [14:0] c;
    alu_slice _i0 (op, i0[0], i1[0], op[0] , o[0], c[0]);
    genvar i;
    generate
        for (i = 1;i < 15; i = i+1) begin
            alu_slice alu_slice_i0(op,i0[i],i1[i],c[i-1],o[i],c[i]);
        end
    endgenerate
    alu_slice _i15 (op,i0[15],i1[15],c[14],o[15],cout);
endmodule
