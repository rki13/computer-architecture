module shifter4_tb();
    reg  [3:0] A, B;
    wire [3:0] X, Y;
    integer errors;

    shifter4 DUT (.A(A), .B(B), .X(X), .Y(Y));

    task check;
        input [3:0] expectedX;
        input [3:0] expectedY;
        begin
            #1;
            if (X !== expectedX || Y !== expectedY) begin
                errors = errors + 1;
                $display("FAIL shifter4: A=%b B=%b -> X=%b Y=%b (expected X=%b Y=%b)", A, B, X, Y, expectedX, expectedY);
            end else begin
                $display("PASS shifter4: A=%b B=%b -> X=%b Y=%b", A, B, X, Y);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b1011; B = 4'b0110; check(4'b1000, 4'b0101); // left shift 3, fill 0
        A = 4'b0101; B = 4'b1101; check(4'b1101, 4'b0100); // right shift 2, fill 1
        A = 4'b1010; B = 4'b0000; check(4'b1010, 4'b0000); // no shift
        A = 4'b0011; B = 4'b0011; check(4'b0111, 4'b0000); // left shift 1, fill 1
        A = 4'b1001; B = 4'b1010; check(4'b0100, 4'b1000); // right shift 1, fill 0

        if (errors == 0)
            $display("All shifter4 tests passed.");
        else
            $fatal(1, "%0d shifter4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_shifter4.vcd");
        $dumpvars(0, shifter4_tb);
    end
endmodule
