module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
	wire [7:0] dq [3:0];
    generate
	genvar i;
        for(i=0; i<3; i+=1)
		begin: bllok
            my_dff8(.clk(clk), .d(dq[i]), .q(dq[i+1]));
        end
    endgenerate
    
    assign dq[0] = d;
    assign q = (sel == 2'b00) ? dq[0] : (sel == 2'b01) ? dq[1] : (sel == 2'b10) ? dq[2] : dq[3];
endmodule
