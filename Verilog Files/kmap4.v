module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    wire s;
    assign {s,out}= a+b+c+d;
endmodule
