module and4_tb();
    reg  [3:0] A, B;
    wire [3:0] X;
    integer errors;

    and4 DUT (.A(A), .B(B), .X(X));

    task check;
        input [3:0] expectedX;
        begin
            #1;
            if (X !== expectedX) begin
                errors = errors + 1;
                $display("FAIL and4: A=%b B=%b -> X=%b (expected %b)", A, B, X, expectedX);
            end else begin
                $display("PASS and4: A=%b B=%b -> X=%b", A, B, X);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b1010; B = 4'b1100; check(4'b1000);
        A = 4'b1111; B = 4'b0000; check(4'b0000);
        A = 4'b0111; B = 4'b0011; check(4'b0011);

        if (errors == 0)
            $display("All and4 tests passed.");
        else
            $fatal(1, "%0d and4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_and4.vcd");
        $dumpvars(0, and4_tb);
    end
endmodule
