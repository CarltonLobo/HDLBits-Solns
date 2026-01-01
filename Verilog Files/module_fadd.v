module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire carry;
    add16 one (.a(a[15:0]), .b(b[15:0]), .sum(sum[15:0]), .cout(carry));
    add16 two (.a(a[31:16]), .b(b[31:16]), .sum(sum[31:16]), .cin(carry));
    
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    wire [1:0] fullsum;
    assign fullsum = a + b + cin;
    assign cout = fullsum[1];
    assign sum = fullsum[0];
// Full adder module here

endmodule
