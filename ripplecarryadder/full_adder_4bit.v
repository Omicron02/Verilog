module full_adder_4bit(input wire [3:0] a,b,input wire cin,output wire [3:0] sum,output wire cout);
    wire carry[2:0];
    full_adder FA1(a[0],b[0],cin,sum[0],carry[0]);//takes first bit of a & b along with cin and returns first bit of sum and first carry
    full_adder FA2(a[1],b[1],carry[0],sum[1],carry[1]);//takes 2nd bit of a & b along with first carry and returns first bit of sum and 2nd carry and so on
    full_adder FA3(a[2],b[2],carry[1],sum[2],carry[2]);
    full_adder FA4(a[3],b[3],carry[2],sum[3],cout);
endmodule