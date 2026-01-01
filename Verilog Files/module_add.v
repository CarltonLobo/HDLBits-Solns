module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire carry;
    wire [15:0] halfsum [1:0];
    add16 one (.cin(0), .cout(carry), .a(a[15:0]), .b(b[15:0]), .sum(halfsum[0]));
    add16 two (.cin(carry), .a(a[31:16]), .b(b[31:16]), .sum(halfsum[1]));
    assign sum = {halfsum[1], halfsum[0]};
    
endmodule
