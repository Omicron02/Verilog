`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:37 02/09/2017 
// Design Name: 
// Module Name:    DFF 
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
module DFF(q,clk,reset,d);
    input d,clk,reset;
    output reg q;
initial begin q=0; end
always @ (posedge (clk)) begin
 if (reset)
  q <= 0;
 else  
 q<= d ;
end
endmodule
