// 4-bit NAND Gate
// Performs bitwise NAND on two 4-bit inputs
module nand4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = ~(A & B);
endmodule
