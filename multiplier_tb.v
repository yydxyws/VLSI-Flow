`timescale 1ns/1ps

module multiplier_tb ();
	reg [3:0] a;
	reg [3:0] b;
	wire [7:0] product;
	initial begin
		$fsdbDumpfile("multiplier_tb.fsdb");
		$fsdbDumpvars(); 
		//1
		a=4'b0000;
		b=4'b0001;
		#10;
		//2
		a=4'b0001;
		b=4'b0001;
		#10;
		//3
		a=4'b0010;
		b=4'b0010;
		#10;
		//4
		a=4'b0011;
		b=4'b0011;
		#10;
		//5
		a=4'b0101;
		b=4'b0101;
		#10;
		//6
		a=4'b0110;
		b=4'b0110;
		#10;
		//7
		a=4'b0110;
		b=4'b0101;
		#10;
		//8
		a=4'b1101;
		b=4'b1010;
		#10;
		//9
		a=4'b1111;
		b=4'b1110;
		#10;
		//10
		a=4'b1111;
		b=4'b1111;
		#10;

	$finish;
	end

	multiplier mul(
		.a(a),
		.b(b),
		.product(product));
endmodule
