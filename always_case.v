// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        out = 4'b0;
        case(sel)
            3'b0: out = data0;
            3'b1: out = data1;
           	3'b10: out = data2;
            3'b11: out = data3;
            3'b100: out = data4;
            3'b101: out = data5;
        endcase
    end

endmodule
