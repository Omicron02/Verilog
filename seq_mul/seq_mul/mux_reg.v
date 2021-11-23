`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:45 04/10/2019 
// Design Name: 
// Module Name:    mux_reg 
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
module mux_reg(clk,a,b,s,en,z);
input clk,a,b,s,en;
output z;
wire y;
mux m1(a,b,s,y);
fdce m2(z,clk,en,y);
endmodule
