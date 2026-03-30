// 4-bit AND Gate
// Performs bitwise AND on two 4-bit inputs
module and4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = A & B;
endmodule
