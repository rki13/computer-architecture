// 4-bit NOT Gate
// Performs bitwise NOT on a 4-bit input
module not4(
    input  [3:0] A,
    output [3:0] X
);
    assign X = ~A;
endmodule
