module top_module ( input clk, input d, output q );

    wire [3:0] c;
    assign c[0] = d;
    assign q = c[3];
    generate
	genvar i;
        for(i=1;i<4;i+=1)begin: blovk
            my_dff (.clk(clk), .d(c[i-1]), .q(c[i]));
        end
    endgenerate
    
endmodule
