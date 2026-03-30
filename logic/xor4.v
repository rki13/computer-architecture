// 4-bit XOR Gate
// Performs bitwise XOR on two 4-bit inputs
module xor4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = A ^ B;
endmodule
