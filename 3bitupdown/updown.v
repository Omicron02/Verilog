module tfr(input wire clk, reset, t, output wire out);
reg memory_bit;
wire t_in, m_in;
assign t_in =  t? ~memory_bit:memory_bit;
assign m_in = reset?0:t_in;
always @(posedge clk)
    begin
        memory_bit <= m_in;
    end
    assign out = memory_bit;
endmodule

module updown(input wire clk, reset, u,input wire [2:0] q, output wire [2:0] out);
wire [2:0] t;
assign t[0] = 1;
assign t[1] = u^q[0];
assign t[2] = !u & q[1] & q[0] | u & !q[1] & !q[0];
tfr tfr_0(clk, reset, t[0], out[0]);
tfr tfr_1(clk, reset, t[1], out[1]);
tfr tfr_2(clk, reset, t[2], out[2]);
endmodule