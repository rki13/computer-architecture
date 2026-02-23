module oneBitNor_tb();
	reg a, b;
	wire out;

	oneBitNor DUT (.a(a), .b(b), .out(out));	

	initial begin
		$display("Starting Simulation");

		a = 0;
		b = 0;

		#2 a = 1;
		b = 0;

		#2 a = 0;
		b = 1;

		#2 a = 1;
		b = 1;


		#40 $finish;
		$display("Finishing Simulation");

	end

	initial begin
		$dumpfile("waveform_nor.vcd");
		$dumpvars(0, oneBitNor_tb);
	end
endmodule
