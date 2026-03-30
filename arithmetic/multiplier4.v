// 4-bit Multiplier
// X = lower 4 bits of A * B
// Y = upper 4 bits of A * B (overflow)
module multiplier4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X,
    output [3:0] Y
);
    wire [7:0] product;
    assign product = A * B;
    assign X = product[3:0]; // lower 4 bits
    assign Y = product[7:4]; // upper 4 bits
endmodule
