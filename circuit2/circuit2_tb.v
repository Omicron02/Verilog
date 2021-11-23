module circuit2_tb;
	reg a,b,c;
	wire d;
	circuit2 M1(a,b,c,d);
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
		$monitor($time,"s a=%b, b=%b, c=%b, d=%b",a,b,c,d);
	end
	initial begin
		$dumpfile("circuit2.vcd");
		$dumpvars(0,circuit2_tb);
	end 
endmodule

		