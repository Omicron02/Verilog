`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:02 05/06/2018 
// Design Name: 
// Module Name:    FA 
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
module fa(a,b,cin,sum,co);
input a,b,cin;
output sum,co; 
wire t1,t2,t3;
ha X1(a,b,t1,t2);
ha X2(cin,t1,sum,t4);
assign co = t2 | t4;
endmodule
