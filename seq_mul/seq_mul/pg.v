`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:13 11/22/2016 
// Design Name: 
// Module Name:    pg 
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
module pg(start,tc,q,clk,reset);
	 input start,tc,clk,reset;
	 output  q;
	 
	 wire t1,t2;
	 parameter vdd=1'b1;
	 parameter gnd=1'b0;
	
    mux M1(t2,vdd,start,q);
	 mux M2(q,gnd,tc,t1);
	 DFF d2(t2,clk,reset,t1);
//    assign  s1 = (start|tc);
endmodule
