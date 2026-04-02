module multiplier4_tb();
    reg  [3:0] A, B;
    wire [3:0] X, Y;
    integer errors;

    multiplier4 DUT (.A(A), .B(B), .X(X), .Y(Y));

    task check;
        input [3:0] expectedX;
        input [3:0] expectedY;
        begin
            #1;
            if (X !== expectedX || Y !== expectedY) begin
                errors = errors + 1;
                $display("FAIL multiplier4: A=%b B=%b -> X=%b Y=%b (expected X=%b Y=%b)", A, B, X, Y, expectedX, expectedY);
            end else begin
                $display("PASS multiplier4: A=%b B=%b -> X=%b Y=%b", A, B, X, Y);
            end
        end
    endtask

    initial begin
        errors = 0;

        A = 4'b0011; B = 4'b0101; check(4'b1111, 4'b0000); // 3*5=15
        A = 4'b1010; B = 4'b0011; check(4'b1110, 4'b0001); // 10*3=30
        A = 4'b1111; B = 4'b1111; check(4'b0001, 4'b1110); // 15*15=225

        if (errors == 0)
            $display("All multiplier4 tests passed.");
        else
            $fatal(1, "%0d multiplier4 test(s) failed.", errors);

        #5 $finish;
    end

    initial begin
        $dumpfile("waveform_multiplier4.vcd");
        $dumpvars(0, multiplier4_tb);
    end
endmodule
