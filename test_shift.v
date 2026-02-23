module fourBitShiftLeft_tb();
	reg a, b, c, d;
	wire out_a, out_b, out_c, out_d;

	fourBitShiftLeft DUT (.a(a), .b(b), .c(c), .d(d), .out_a(out_a), .out_b(out_b), .out_c(out_c), .out_d(out_d));

	initial begin
		$display("Starting Simulation");

		a = 1;
		b = 0;
		c = 1;
		d = 1;

		#2 a = 0;
		b = 1;
		c = 0;
		d = 0;

		#2 a = 0;
		b = 1;
		c = 0;
		d = 1;


		#40 $finish;
		$display("Finishing Simulation");

	end

	initial begin
		$dumpfile("waveform_shift.vcd");
		$dumpvars(0, fourBitShiftLeft_tb);
	end
endmodule
