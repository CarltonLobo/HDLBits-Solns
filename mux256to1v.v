module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    wire [9:0] w ; 
    assign w = {sel, 2'b11}; 
    assign out = in[w -: 4];
endmodule
