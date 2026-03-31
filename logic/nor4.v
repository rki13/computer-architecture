// 4-bit NOR Gate
// Performs bitwise NOR on two 4-bit inputs
module nor4(
    input  [3:0] A,
    input  [3:0] B,
    output [3:0] X
);
    assign X = ~(A | B);
endmodule
