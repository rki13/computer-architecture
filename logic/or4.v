// 4-bit OR Gate
// Performs bitwise OR on two 4-bit inputs
module or4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = A | B;
endmodule
