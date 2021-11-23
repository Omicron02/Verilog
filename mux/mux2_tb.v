module mux2_tb;
    reg i0,i1,j;
    wire o;
    mux2 M(o,i0,i1,j);
    initial begin
        i0=0;i1=0;j=0;
        repeat (2) begin
            repeat (2) begin
                repeat (2) begin
                    #100 j=~j;
                end
                i1=~i1;
            end
            i0=~i0;
        end
    end
    initial begin
        $monitor($time,"s i0=%b, i1=%b, j=%b, o=%b",i0,i1,j,o);
    end
    initial begin
        $dumpfile("mux2.vcd");
        $dumpvars(0,mux2_tb);
    end
endmodule