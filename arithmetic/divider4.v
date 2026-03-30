// 4-bit Divider
// X = A / B (quotient)
// Y = A % B (remainder)
// If B == 0, outputs are set to all 1s to indicate error
module divider4(
    input  [3:0] A,
    input  [3:0] B,
    output reg [3:0] X,
    output reg [3:0] Y
);
    always @(*) begin
        if (B == 4'b0000) begin
            X = 4'b1111; // division by zero: error indicator
            Y = 4'b1111;
        end else begin
            X = A / B;
            Y = A % B;
        end
    end
endmodule
