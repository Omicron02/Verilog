`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:10 11/11/2016 
// Design Name: 
// Module Name:    mux16 
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
module mux(A,B,S,Y);

    input  A,B;
    output  Y;
    input S;
 

assign Y = (S)? B : A;
endmodule
