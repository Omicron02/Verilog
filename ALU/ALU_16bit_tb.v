`define TESTVECS 16

module alu_tb;
    reg [1:0] op;
    reg [15:0] i0, i1;
    wire [15:0] o;
    wire cout;
    reg [33:0] v [0:(`TESTVECS-1)];
    integer i;
    initial begin
        v[0][33:32] = 2'b00; v[0][31:0] = 32'h00000000;
        v[1][33:32] = 2'b00; v[1][31:0] = 32'haa5555aa;
        v[2][33:32] = 2'b00; v[2][31:0] = 32'hffff0001;
        v[3][33:32] = 2'b00; v[3][31:0] = 32'h00017fff;
        v[4][33:32] = 2'b01; v[4][31:0] = 32'h00000000;
        v[5][33:32] = 2'b01; v[5][31:0] = 32'haa5555aa;
        v[6][33:32] = 2'b01; v[6][31:0] = 32'hffff0001;
        v[7][33:32] = 2'b01; v[7][31:0] = 32'h00017fff;
        v[8][33:32] = 2'b10; v[8][31:0] = 32'h00000000;
        v[9][33:32] = 2'b10; v[9][31:0] = 32'haa5555aa;
        v[10][33:32] = 2'b10; v[10][31:0] = 32'hffff0001;
        v[11][33:32] = 2'b10; v[11][31:0] = 32'h00017fff;
        v[12][33:32] = 2'b11; v[12][31:0] = 32'h00000000;
        v[13][33:32] = 2'b11; v[13][31:0] = 32'haa5555aa;
        v[14][33:32] = 2'b11; v[14][31:0] = 32'hffff0001;
        v[15][33:32] = 2'b11; v[15][31:0] = 32'h00017fff;
    end
    initial {op, i0, i1} = 0;
        alu alu_0 (op, i0, i1, o, cout);
    initial begin
        for(i=0;i<`TESTVECS;i=i+1) begin 
            #10 {op, i0, i1}=v[i]; 
        end
        #10;
    end
    initial begin
        $dumpfile("alu_tb.vcd"); 
        $dumpvars(0,alu_tb); 
    end
    always @(i0 or i1)
    $monitor($time, "s Operator = %b, i0 = %h, i1 = %h, Sum = %h, Carry = %h",op,i0,i1,o,cout);


endmodule




 
 
  
   
