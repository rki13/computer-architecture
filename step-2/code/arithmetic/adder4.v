// 4-bit Adder with Carry In and Carry Out
// X = A + B + Cin
// Cout = carry out
module adder4(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] X,
    output       Cout
);
    wire [4:0] sum;
    assign sum  = A + B + Cin;
    assign X    = sum[3:0];
    assign Cout = sum[4];
endmodule
