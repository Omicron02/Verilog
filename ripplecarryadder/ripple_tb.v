`define TESTVECS 10

module ripple_tb;
reg [3:0] i0, i1;//defining two arrays i0 and i1 of length 4
reg cin;
wire [3:0] o; 
wire cout;
reg [8:0] test_vecs [0:(`TESTVECS-1)]; //defining array which stores 10 9 bit numbers
integer i;
initial begin $dumpfile("dump.vcd");
            $dumpvars(0,ripple_tb); 
end
initial begin
test_vecs[0] = 9'b000000010;
test_vecs[1] = 9'b000100010;
test_vecs[2] = 9'b011100010;
test_vecs[3] = 9'b000001110;
test_vecs[4] = 9'b011001111;
test_vecs[5] = 9'b001110011;
test_vecs[6] = 9'b111100011;
test_vecs[7] = 9'b011101110;
test_vecs[8] = 9'b000001110;
test_vecs[9] = 9'b011001111;
end
initial {i0, i1, cin, i} = 0; //If initial value is not given then the graph has dont care values upto 16 seconds
full_adder_4bit u0(i0, i1, cin, o, cout);
initial begin
#6 for(i=0;i<`TESTVECS;i=i+1)
//i0 and i1 are arrays of size 4, cin is a variable and test_vecs is a 2d array with ten 9-bit values.
//first 4 bits from the left of the array test_vecs[i] is stored in i0, next 4 in i1 and rightmost bit in cin
  begin #10 {i0, i1, cin}=test_vecs[i]; end
end

always @(i0 or i1 or cin)
$monitor($time," a=%b,b=%b,cin=%b,sum=%b,cout=%b",i0,i1,cin,o,cout);
endmodule
