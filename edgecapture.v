module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    wire [31:0] last;
    
    always@(posedge clk)
        begin 
            out = out | (last&~in);
            if(reset)
                out= 0;
            last = in;
        end
endmodule
