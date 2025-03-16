module multiplier (
	input [3:0] a,
	input [3:0] b,
	output [7:0] product);
	
	wire [3:0] p0,p1,p2,p3;
	assign p0 = a & {4{b[0]}};
	assign p1 = a & {4{b[1]}};
	assign p2 = a & {4{b[2]}};
	assign p3 = a & {4{b[3]}};

	wire [4:0] sum1, sum2, sum3;

	adder_begin add4bit (.a(p0), .b(p1), .sum(sum1));
	adder_after add5bit (.a(sum1), .b(p2), .sum(sum2));
	adder_after add6bit (.a(sum2), .b(p3), .sum(sum3));
	assign product = {sum3[4:0], sum2[0], sum1[0], p0[0]};
endmodule

module adder_begin (
	input [3:0] a,
	input [3:0] b,
	output [4:0] sum);

	wire c1, c2, c3;
	half_adder ha0 (.a(a[1]), .b(b[0]), .sum(sum[0]), .cout(c1));
	full_adder fa1 (.a(a[2]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	full_adder fa2 (.a(a[3]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	half_adder ha3 (.a(c3), .b(b[3]), .sum(sum[3]), .cout(sum[4]));
endmodule

module adder_after (
	input [4:0] a,
	input [3:0] b,
	output [4:0] sum);

	wire c1, c2, c3;
	half_adder ha0 (.a(a[1]), .b(b[0]), .sum(sum[0]), .cout(c1));
	full_adder fa1 (.a(a[2]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
	full_adder fa2 (.a(a[3]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
	full_adder fa3 (.a(a[4]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(sum[4]));
endmodule


module half_adder (
	input a,
	input b,
	output cout,
	output sum
);

	assign sum = a ^ b;
	assign cout = a & b;
endmodule

module full_adder (
	input a,
	input b,
	input cin,
	output sum,
	output cout);

	assign sum = a ^ b ^ cin;
	assign cout = (a & b) | ((a ^ b) & cin);
endmodule
