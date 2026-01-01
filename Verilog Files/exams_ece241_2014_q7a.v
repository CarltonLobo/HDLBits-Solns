module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    wire twe;
    assign twe = (Q==4'd12);
    assign c_enable = enable && !twe;
    assign c_load = reset | (twe && enable);
    assign c_d = 4'b1;
    count4 the_counter (clk, c_enable, c_load, c_d, Q );

endmodule
