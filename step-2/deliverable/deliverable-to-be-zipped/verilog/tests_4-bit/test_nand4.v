module nand4_tb();
    reg  [3:0] A, B;
    wire [3:0] X;
    integer errors;

    nand4 DUT (.A(A), .B(B), .X(X));

    task check;
        input [3:0] expectedX;
        begin
            #1;
            if (X !== expectedX) begin
                errors = errors + 1;
                $display("FAIL nand4: A=%b B=%b -> X=%b (expected %b)", A, B, X, expectedX);
            end else begin
                $display("PASS nand4: A=%b B=%b -> X=%b", A, B, X);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b1010; B = 4'b1100; check(4'b0111);
        A = 4'b1111; B = 4'b1111; check(4'b0000);
        A = 4'b0000; B = 4'b1010; check(4'b1111);

        if (errors == 0)
            $display("All nand4 tests passed.");
        else
            $fatal(1, "%0d nand4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_nand4.vcd");
        $dumpvars(0, nand4_tb);
    end
endmodule
