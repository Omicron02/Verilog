`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:35 04/10/2019 
// Design Name: 
// Module Name:    Regbank 
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
module Regbank(clk,start,ld,cy,c,b,p);

input [3:0] c,b;
output [8:0] p;
input clk,start,ld,cy;
wire en1,en2;
fdce f1(p[8],clk,ld,cy);

fdce d1(p[7],clk,ld,c[3]);
fdce d2(p[6],clk,ld,c[2]);
fdce d3(p[5],clk,ld,c[1]);
fdce d4(p[4],clk,ld,c[0]);

//mux_reg m1(clk,p[8],c[3],ld,en1,p[7]);
//mux_reg m2(clk,p[7],c[2],ld,en1,p[6]);
//mux_reg m3(clk,p[6],c[1],ld,en1,p[5]);
//mux_reg m4(clk,p[5],c[0],ld,en1,p[4]);
//assign en1 = ld | shift;

mux_reg m5(clk,p[4],b[3],start,en2,p[3]);
mux_reg m6(clk,p[3],b[2],start,en2,p[2]);
mux_reg m7(clk,p[2],b[1],start,en2,p[1]);
mux_reg m8(clk,p[1],b[0],start,en2,p[0]);
assign en2 = start | ld;
endmodule
