module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);
    wire [99:0] w_and, w_or, w_xor;
    assign w_and[0] = in[0];
    assign w_or[0] = in[0];
    assign w_xor[0] = in[0];
    generate
    genvar i;
        for(i = 1; i<100; i+=1) begin: blook
            assign w_and[i] = w_and[i-1] && in[i]; 
            assign w_or[i] = w_or[i-1] || in[i]; 
            assign w_xor[i] = w_xor[i-1] ^ in[i]; 
        end
    endgenerate
    assign out_and = w_and[99];
    assign out_or = w_or[99];
    assign out_xor = w_xor[99];
endmodule
