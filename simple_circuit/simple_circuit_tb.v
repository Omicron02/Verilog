module simple_circuit_tb;
	reg a,b,c;
	wire d,e;
	simple_circuit M1(a,b,c,d,e);
	initial begin
		a=0;b=0;c=0;
		repeat (2) begin
			repeat (2) begin
				repeat (2) begin
					#100 c=~c;	
				end
				b=~b;
			end
			a=~a;
		end
	end
	initial begin
		$monitor($time,"s a=%b, b=%b, c=%b, d=%b, e=%b",a,b,c,d,e);
	end
	initial begin
		$dumpfile("simple_circuit.vcd");
		$dumpvars(0,simple_circuit_tb);
	end 
endmodule

		