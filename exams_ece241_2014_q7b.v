module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] count [2:0];
    assign c_enable[0] = 1;
    bcdcount counter0 (clk, reset, c_enable[0], count[0]);
    assign c_enable[1] = (count[0]== 4'd9);
    bcdcount counter1 (clk, reset, c_enable[1], count[1]);
    assign c_enable[2] = (count[1]== 4'd9 && count[0]== 4'd9);
    bcdcount counter2 (clk, reset, c_enable[2], count[2]);
    assign OneHertz = (count[2]== 4'd9 && count[1]== 4'd9 && count[0]== 4'd9);
    

endmodule
