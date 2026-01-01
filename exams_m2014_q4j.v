module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] w;
    assign {w[0], sum[0]} = x[0] + y[0];
	generate
	genvar i;
        for(i=1;i<4;i++)begin: blook
            assign {w[i], sum[i]} = x[i] + y[i] + w[i-1];
        end
    endgenerate
    assign sum[4] = w[3];
        
endmodule
