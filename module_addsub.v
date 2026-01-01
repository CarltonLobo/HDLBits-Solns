module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] B;
    wire carry;
    
    assign B = b ^ {32{sub}};
    
    add16 one (.a(a[15:0]), .b(B[15:0]), .cout(carry), .cin(sub), .sum(sum[15:0]));
    add16 two (.a(a[31:16]), .b(B[31:16]), .cin(carry), .sum(sum[31:16]));

endmodule
