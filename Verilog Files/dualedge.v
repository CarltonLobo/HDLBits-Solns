module top_module (
    input clk,
    input d,
    output q
);
    wire [1:0] line;
    pdff(clk, d, line[1]);
    ndff(clk, d, line[0]);
    assign q = clk&line[1]|~clk&line[0];
endmodule
module pdff(input clk, input d, output q);
    always@(posedge clk)
        q = d;
endmodule
module ndff(input clk, input d, output q);
    always@(negedge clk)
        q = d;
endmodule