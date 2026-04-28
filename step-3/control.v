
`include "../step-2/code/arithmetic/adder4.v"
`include "../step-2/code/arithmetic/divider4.v"
`include "../step-2/code/arithmetic/multiplier4.v"
`include "../step-2/code/arithmetic/subtractor4.v"


`include "../step-2/code/logic/not4.v"

`include "../step-2/code/logic/shifter4.v"


`include "../step-2/code/logic/and4.v"
`include "../step-2/code/logic/nand4.v"

`include "../step-2/code/logic/or4.v"
`include "../step-2/code/logic/nor4.v"

`include "../step-2/code/logic/xor4.v"
`include "../step-2/code/logic/xnor4.v"

module control (
    input  [3:0] opcode,
    input  [3:0] A,
    input  [3:0] B,

    output reg [7:0] out
);

    wire [7:0] addOutput;
    wire [7:0] subOutput;
    wire [7:0] mulOutput;
    wire [7:0] divOutput;

    wire [7:0] notOutput;

    wire [7:0] andOutput;
    wire [7:0] nandOutput;
    wire [7:0] orOutput;
    wire [7:0] norOutput;
    wire [7:0] xorOutput;
    wire [7:0] xnorOutput;

    wire [7:0] shiftOutput;



    adder4      ADD(A, B, 1'b0, addOutput[3:0], addOutput[4]);
    subtractor4 SUB(A, B, 1'b0, subOutput[3:0], subOutput[4]);
    multiplier4 MUL(A, B, mulOutput[3:0], mulOutput[7:4]);
    divider4    DIV(A, B, divOutput[3:0], divOutput[7:4]);



    not4        NOTA(A, notOutput[3:0]);
    not4        NOTB(B, notOutput[7:4]);

    shifter4    SHIFT(A, B, shiftOutput[3:0], shiftOutput[7:4]);


    and4        AND(A, B, andOutput[3:0]);
    nand4       NAND(A, B, nandOutput[3:0]);
    or4         OR(A, B, orOutput[3:0]);
    nor4        NOR(A, B, norOutput[3:0]);
    xor4        XOR(A, B, xorOutput[3:0]);
    xnor4       XNOR(A, B, xnorOutput[3:0]);


    always @(*) begin
        case (opcode)
            4'b0000: out = addOutput;
            4'b0001: out = subOutput;
            4'b0010: out = mulOutput;
            4'b0011: out = divOutput;

            4'b1111: out = notOutput;
            4'b0111: out = shiftOutput;

            4'b0100: out = andOutput;
            4'b0101: out = orOutput;
            4'b0110: out = xorOutput;

            4'b1100: out = nandOutput;
            4'b1101: out = norOutput;
            4'b1110: out = xnorOutput;
        endcase
    end
    
endmodule
