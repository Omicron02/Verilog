module circuit1_tb;
	reg a,b,c;
	wire d;
	circuit1 M1(a,b,c,d);
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
		$dumpfile("circuit1.vcd");
		$dumpvars(0,circuit1_tb);
	end 
endmodule

		