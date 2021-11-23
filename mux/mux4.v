module mux4(output wire o,input wire [3:0] i,input wire [1:0] j);
assign o=j[0]?j[1]?i[3]:i[1]:j[1]?i[2]:i[0];
endmodule