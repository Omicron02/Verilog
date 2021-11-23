`define TESTVECS 10

module ripple_carry_adder_tb;
    reg [3:0] a,b;//defining two arrays a and b of length 4
    reg cin;
    wire [3:0] sum; 
    wire cout;
    reg [8:0] inputs [0:(`TESTVECS-1)]; //defining array which stores 10 9 bit numbers

    initial begin
        inputs[0] = 9'b000001010;
        inputs[1] = 9'b010101010;
        inputs[2] = 9'b011100110;
        inputs[3] = 9'b100001110;
        inputs[4] = 9'b011001111;
        inputs[5] = 9'b001010011;
        inputs[6] = 9'b111100011;
        inputs[7] = 9'b111101010;
        inputs[8] = 9'b001000110;
        inputs[9] = 9'b011101111;
    end
    initial {a, b, cin, i} = 0; //If initial value is not given then the graph has dont care values upto 10 seconds
    full_adder_4bit FA4bit(a, b, cin, sum, cout);
    integer i; 
    initial begin
        for(i=0;i<`TESTVECS;i=i+1) begin
        //a and b are arrays of size 4, cin is a variable and test_vecs is a 2d array with ten 9-bit values.
        //first 4 bits from the left of the array test_vecs[i] is stored in a, next 4 in b and rightmost bit in cin
            #100 {a, b, cin}=inputs[i];
        end
        #100; 
    end
    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0,ripple_carry_adder_tb); 
    end
    always @(a or b or cin)
        $monitor($time,"s a=%b,b=%b,cin=%b,sum=%b,cout=%b",a,b,cin,sum,cout);
endmodule
