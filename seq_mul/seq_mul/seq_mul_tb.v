`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:38:15 04/10/2019
// Design Name:   seq_mul
// Module Name:   D:/xilinx_simulation/BLOG/seq_mul_tb.v
// Project Name:  BLOG
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seq_mul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seq_mul_tb;

	// Inputs
	reg clk;
	reg start;
	reg [3:0] a;
	reg [3:0] b;

   wire [7:0] op;
	// Instantiate the Unit Under Test (UUT)
	seq_mul uut (
		.clk(clk), 
		.start(start), 
		.a(a), 
		.b(b),
		.op(op)
	);
always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#109.5;
        start = 1;
		  a = 4'b1001;
		b = 4'b1101;
		#20;
		start = 0;
		  a = 0;
		b = 0;
		// Add stimulus here

	end
      
endmodule

