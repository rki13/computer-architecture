module divider4_tb();
    reg  [3:0] A, B;
    wire [3:0] X, Y;
    integer errors;

    divider4 DUT (.A(A), .B(B), .X(X), .Y(Y));

    task check;
        input [3:0] expectedX;
        input [3:0] expectedY;
        begin
            #1;
            if (X !== expectedX || Y !== expectedY) begin
                errors = errors + 1;
                $display("FAIL divider4: A=%b B=%b -> X=%b Y=%b (expected X=%b Y=%b)", A, B, X, Y, expectedX, expectedY);
            end else begin
                $display("PASS divider4: A=%b B=%b -> X=%b Y=%b", A, B, X, Y);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b1100; B = 4'b0011; check(4'b0100, 4'b0000); // 12/3 = 4 r0
        A = 4'b0111; B = 4'b0010; check(4'b0011, 4'b0001); // 7/2 = 3 r1
        A = 4'b0101; B = 4'b0000; check(4'b1111, 4'b1111); // divide by zero

        if (errors == 0)
            $display("All divider4 tests passed.");
        else
            $fatal(1, "%0d divider4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_divider4.vcd");
        $dumpvars(0, divider4_tb);
    end
endmodule
