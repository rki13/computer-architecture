module oneBitNot_tb();
	reg in;
	wire out;

	oneBitNot DUT (.a(in), .out(out));	

	initial begin
		$display("Starting Simulation");

		in = 1;
		#2 in = 0;


		#10 $finish;
		$display("Finishing Simulation");

	end

	initial begin
		$dumpfile("waveform_not.vcd");
		$dumpvars(0, oneBitNot_tb);
	end
endmodule

