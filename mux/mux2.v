module mux2(output wire o, input wire i0,i1,j);
    assign o=j?i1:i0;
endmodule