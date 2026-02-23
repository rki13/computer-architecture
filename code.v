module oneBitNot(input a, output out);
	assign out = ~a;
endmodule

module oneBitNand(input a, input b, output out);
	assign out = ~(a & b);
endmodule
