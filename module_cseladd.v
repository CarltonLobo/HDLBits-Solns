module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire carry;
    wire [15:0] halfsum [1:0];
    add16 one (.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(carry), .cin(0));
    add16 two (.a(a[31:16]), .b(b[31:16]), .sum(halfsum[0]), .cin(0));
    add16 three (.a(a[31:16]), .b(b[31:16]), .sum(halfsum[1]), .cin(1));
    assign sum[31:16] = halfsum[carry];
    
endmodule
