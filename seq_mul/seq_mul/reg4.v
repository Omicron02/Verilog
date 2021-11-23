`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:59 05/17/2018 
// Design Name: 
// Module Name:    reg4 
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
module reg4(y,clk,en,a);
    input [3:0] a;
    output [3:0] y;
    input clk,en;
 
fdce d1(y[0],clk,en,a[0]);
fdce d2(y[1],clk,en,a[1]);
fdce d3(y[2],clk,en,a[2]);
fdce d4(y[3],clk,en,a[3]);

endmodule
