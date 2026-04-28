module adder4_tb();
    reg  [3:0] A, B;
    reg        Cin;
    wire [3:0] X;
    wire       Cout;
    integer errors;

    adder4 DUT (.A(A), .B(B), .Cin(Cin), .X(X), .Cout(Cout));

    task check;
        input [3:0] expectedX;
        input       expectedCout;
        begin
            #1;
            if (X !== expectedX || Cout !== expectedCout) begin
                errors = errors + 1;
                $display("FAIL adder4: A=%b B=%b Cin=%b -> X=%b Cout=%b (expected X=%b Cout=%b)", A, B, Cin, X, Cout, expectedX, expectedCout);
            end else begin
                $display("PASS adder4: A=%b B=%b Cin=%b -> X=%b Cout=%b", A, B, Cin, X, Cout);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b0011; B = 4'b0101; Cin = 1'b0; check(4'b1000, 1'b0);
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; check(4'b0000, 1'b1);
        A = 4'b0111; B = 4'b0001; Cin = 1'b1; check(4'b1001, 1'b0);

        if (errors == 0)
            $display("All adder4 tests passed.");
        else
            $fatal(1, "%0d adder4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_adder4.vcd");
        $dumpvars(0, adder4_tb);
    end
endmodule
