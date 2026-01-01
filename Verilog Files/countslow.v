module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always@(posedge clk)
        begin 
            if(slowena&~reset)
                if(q < 4'd9)
               	 	q += 1;
            	else
                    q=0;
            else if(reset)
                q = 0;
            else 
                q = q;
        end
endmodule
