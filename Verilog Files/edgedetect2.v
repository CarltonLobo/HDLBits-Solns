module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    wire [7:0] last;
    always@(posedge clk)
        begin 
			anyedge <= in^last;
            last <= in;
        end
endmodule
