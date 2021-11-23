`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:06 04/10/2019 
// Design Name: 
// Module Name:    adder_4bit 
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
module adder_4bit(a,b,sum,cy);
input [3:0] a,b;
output [3:0] sum;
output cy;

fa m1(a[0],b[0],1'b0,sum[0],co1);
fa m2(a[1],b[1],co1,sum[1],co2);
fa m3(a[2],b[2],co2,sum[2],co3);
fa m4(a[3],b[3],co3,sum[3],cy);

endmodule
