module top_module (
    input clk,
    input x,
    output z
); 
    wire [2:0] w;
    
    always@(posedge clk)
        begin 
            w[2] = w[2]^x;
            w[1] = ~w[1]&x;
            w[0] = ~w[0]|x;
        end
    assign z = ~(w[2]|w[1]|w[0]);
    
endmodule
