`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:12:35 12/03/2016 
// Design Name: 
// Module Name:    cnt1 
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
//////////////////////////////////////////////////////////////////////////////////`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:32:48 11/11/2016 
// Design Name: 
// Module Name:    upcnt1 
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
module cnt4(out,data,load,en,clk,tc,lmt);
output [1:0] out;
output reg tc;
input [1:0] data;
input load, en, clk;
reg [1:0] out;
parameter reset=0;
input [1:0]lmt;
initial begin out=2'b00;
tc=0; end
always @(posedge clk)
if (reset) begin
  out <= 2'b00 ;
end else if (load) begin
  out <= data;
end else if (en)
  out <= out + 2'b01;
else out <= out;
always @(posedge clk)
if (out ==lmt)
tc<=1;
else tc<=0;
endmodule 