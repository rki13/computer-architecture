module not4_tb();
    reg  [3:0] A;
    wire [3:0] X;
    integer errors;

    not4 DUT (.A(A), .X(X));

    task check;
        input [3:0] expectedX;
        begin
            #1;
            if (X !== expectedX) begin
                errors = errors + 1;
                $display("FAIL not4: A=%b -> X=%b (expected %b)", A, X, expectedX);
            end else begin
                $display("PASS not4: A=%b -> X=%b", A, X);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b0000; check(4'b1111);
        A = 4'b1010; check(4'b0101);
        A = 4'b1111; check(4'b0000);

        if (errors == 0)
            $display("All not4 tests passed.");
        else
            $fatal(1, "%0d not4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_not4.vcd");
        $dumpvars(0, not4_tb);
    end
endmodule
