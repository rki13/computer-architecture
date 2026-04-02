// 4-bit XNOR Gate
// Performs bitwise XNOR on two 4-bit inputs
module xnor4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = ~(A ^ B);
endmodule
