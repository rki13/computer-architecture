module oneBitNand_tb();
	reg a, b;
	wire out;

	oneBitNand DUT (.a(a), .b(b), .out(out));	

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
		$dumpfile("waveform_nand.vcd");
		$dumpvars(0, oneBitNand_tb);
	end
endmodule
