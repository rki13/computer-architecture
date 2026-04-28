module subtractor4_tb();
    reg  [3:0] A, B;
    reg        Bin;
    wire [3:0] X;
    wire       Bout;
    integer errors;

    subtractor4 DUT (.A(A), .B(B), .Bin(Bin), .X(X), .Bout(Bout));

    task check;
        input [3:0] expectedX;
        input       expectedBout;
        begin
            #1;
            if (X !== expectedX || Bout !== expectedBout) begin
                errors = errors + 1;
                $display("FAIL subtractor4: A=%b B=%b Bin=%b -> X=%b Bout=%b (expected X=%b Bout=%b)", A, B, Bin, X, Bout, expectedX, expectedBout);
            end else begin
                $display("PASS subtractor4: A=%b B=%b Bin=%b -> X=%b Bout=%b", A, B, Bin, X, Bout);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b1001; B = 4'b0011; Bin = 1'b0; check(4'b0110, 1'b0);
        A = 4'b0010; B = 4'b0101; Bin = 1'b0; check(4'b1101, 1'b1);
        A = 4'b1000; B = 4'b0001; Bin = 1'b1; check(4'b0110, 1'b0);

        if (errors == 0)
            $display("All subtractor4 tests passed.");
        else
            $fatal(1, "%0d subtractor4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_subtractor4.vcd");
        $dumpvars(0, subtractor4_tb);
    end
endmodule
