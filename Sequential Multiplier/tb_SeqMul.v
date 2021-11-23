`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb_SeqMul;
    reg clk, reset;
    reg [7:0] testvecs [(`TESTVECS-1):0];
    reg [3:0] Qin, Min;
    reg [7:0] product;
    output Cout;
    output [3:0] Aout, Qout, Mout;

    initial begin
        reset = 1'b1; 
        #5 reset = 1'b0;
    end

    initial clk = 1'b0; 
    always #1 clk = ~clk;

    initial begin
        testvecs[0][7:4] = 4'b1011; testvecs[0][3:0] = 4'b1101;
        testvecs[1][7:4] = 4'b0111; testvecs[1][3:0] = 4'b0101;
        testvecs[2][7:4] = 4'b0010; testvecs[2][3:0] = 4'b1111;
        testvecs[3][7:4] = 4'b1000; testvecs[3][3:0] = 4'b0110;
        testvecs[4][7:4] = 4'b1111; testvecs[4][3:0] = 4'b1111;
        testvecs[5][7:4] = 4'b1010; testvecs[5][3:0] = 4'b1110;
        testvecs[6][7:4] = 4'b0100; testvecs[6][3:0] = 4'b1101;
        testvecs[7][7:4] = 4'b0110; testvecs[7][3:0] = 4'b1111;
    end
    
    initial {Qin, Min} = 0;
    seqmul seqmul_0(clk, reset, 1'b0, 4'b0000, Qin, Min, Cout, Aout, Qout, Mout);
    integer i;
    initial begin
        for(i=0; i<`TESTVECS; i=i+1) begin
            #3 {Qin, Min} = testvecs[i];
            $write("\tMultiplicand M = %b (%02d), Multiplier Q = %b (%02d)", Min, Min, Qin, Qin);
            #20 product = {Aout, Qout};
            $write(", Product = %b (%03d) \n", product, product);
        end
    end

    initial begin
        $dumpfile("SeqMul.vcd"); 
        $dumpvars(0,tb_SeqMul); 
        #200 $finish;
    end
    
endmodule