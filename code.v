module oneBitNot(input a, output out);
	assign out = ~a;
endmodule

module oneBitNand(input a, input b, output out);
	assign out = ~(a & b);
endmodule

module oneBitNor(input a, input b, output out);
	assign out = ~(a | b);
endmodule


module fourBitShiftLeft(
	input a, input b, input c, input d,
	output out_a, output out_b, output out_c, output out_d
);
	assign out_a = b;
	assign out_b = c;
	assign out_c = d;
	assign out_d = 0;
endmodule
