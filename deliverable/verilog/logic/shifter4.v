// 2x4-bit Arithmetic Shifter
// B[3] = direction (0 = left, 1 = right)
// B[2:1] = shift amount (0 to 3)
// B[0] = fill bit
// X = shifted result, Y = bits shifted out
module shifter4(
    input  [3:0] A,
    input  [3:0] B,
    output reg [3:0] X,
    output reg [3:0] Y
);
    always @(*) begin
        case (B[2:1])
            2'b00: begin
                X = A;
                Y = 4'b0000;
            end

            2'b01: begin
                if (B[3] == 1'b0) begin
                    X = {A[2:0], B[0]};
                    Y = {3'b000, A[3]};
                end else begin
                    X = {B[0], A[3:1]};
                    Y = {A[0], 3'b000};
                end
            end

            2'b10: begin
                if (B[3] == 1'b0) begin
                    X = {A[1:0], B[0], B[0]};
                    Y = {2'b00, A[3:2]};
                end else begin
                    X = {B[0], B[0], A[3:2]};
                    Y = {A[1:0], 2'b00};
                end
            end

            2'b11: begin
                if (B[3] == 1'b0) begin
                    X = {A[0], B[0], B[0], B[0]};
                    Y = {1'b0, A[3:1]};
                end else begin
                    X = {B[0], B[0], B[0], A[3]};
                    Y = {A[2:0], 1'b0};
                end
            end
        endcase
    end
endmodule
