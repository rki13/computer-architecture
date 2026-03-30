// 4-bit Subtractor with Borrow In and Borrow Out
// X = A - B - Bin
// Bout = borrow out (1 if result underflows)
module subtractor4(
    input  [3:0] A,
    input  [3:0] B,
    input        Bin,
    output [3:0] X,
    output       Bout
);
    wire [4:0] diff;
    assign diff = A - B - Bin;
    assign X    = diff[3:0];
    assign Bout = diff[4]; // borrow out
endmodule
