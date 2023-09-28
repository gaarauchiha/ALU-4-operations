module Alu7seg (
    input [2:0] fun_sel0,
    input [2:0] fun_sel1,
    input [2:0] ain,
    input [2:0] bin,
    output reg [2:0] out,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1
);

    always @*
    begin
        case ({fun_sel1, fun_sel0})
            2'b00: out = ain + bin; // Sum
            2'b01: out = ain - bin; // Subtract
            2'b10: out = ain ^ bin; // Xor
            2'b11: out = {ain[1:0], 1'b0}; // Shifting
            default: out = 3'b0;
        endcase
    end

    always @*
    begin
        case (out)
            3'b000: begin
                HEX0 = 7'b1000000; // 0
                HEX1 = 7'b1000000; // 0
            end
            3'b001: begin
                HEX0 = 7'b1111001; // 1
                HEX1 = 7'b1000000; // 0
            end
            3'b010: begin
                HEX0 = 7'b0100100; // 2
                HEX1 = 7'b1000000; // 0
            end
            3'b011: begin
                HEX0 = 7'b0110000; // 3
                HEX1 = 7'b1000000; // 0
            end
            3'b100: begin
                HEX0 = 7'b0011001; // 4
                HEX1 = 7'b1000000; // 0
            end
            3'b101: begin
                HEX0 = 7'b0010010; // 5
                HEX1 = 7'b1000000; // 0
            end
            3'b110: begin
                HEX0 = 7'b0000010; // 6
                HEX1 = 7'b1000000; // 0
            end
            3'b111: begin
                HEX0 = 7'b1111000; // 7
                HEX1 = 7'b1000000; // 0
            end
            default: begin
                HEX0 = 7'b0000000;
                HEX1 = 7'b0000000;
            end
        endcase
    end

endmodule