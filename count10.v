module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    always@(posedge clk)
        begin
            if(q < 4'd9)
            	q = q + 1;
			else
                q = 0;
            if(reset)
                q = 0;
        end
endmodule
