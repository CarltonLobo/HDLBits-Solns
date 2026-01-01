// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos );

    always@(*)
    begin
        casex(in)
            8'bzzzzzzz1: pos = 3'b0;
            8'bzzzzzz10: pos = 3'b1;
            8'bzzzzz100: pos = 3'b10;
            8'bzzzz1000: pos = 3'b11;
            8'bzzz10000: pos = 3'b100;
            8'bzz100000: pos = 3'b101;
            8'bz1000000: pos = 3'b110;
            8'b10000000: pos = 3'b111;
            default : pos = 8'b0;
        endcase
    end
endmodule
