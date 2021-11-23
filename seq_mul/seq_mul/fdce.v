`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:28 11/09/2016 
// Design Name: 
// Module Name:    fdce 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fdce(q,clk,ce,d);
    input d,clk,ce;
    output reg q;
initial begin q=0; end
always @ (posedge (clk)) begin
 if (ce)
  q <= d;
 else 
 q<= q ;
end
endmodule