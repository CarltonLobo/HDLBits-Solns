module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    wire [3:0] w [5:0];
    assign {hh[7:0], mm[7:0], ss[7:0]} = {w[5], w[4], w[3], w[2], w[1], w[0]};
    always@(posedge clk)
        begin
            if(reset)
                begin
                    w[0] = 4'd0;
                    w[1] = 4'd0;
                    w[2] = 4'd0;
                    w[3] = 4'd0;
                    w[4] = 4'd2;
                    w[5] = 4'd1;
                end
            else if(ena)
                begin 
                    if(w[0] == 4'd9)
                        begin
                       	 	w[0] = 4'd0;
                            if(w[1] == 4'd5)
                                begin
                                    w[1] = 4'd0;
                                    if(w[2] == 4'd9)
                                        begin 
                                            w[2] = 4'd0;
                                            if(w[3] == 4'd5)
                                                begin 
                                                    w[3] = 4'd0;
                                                    if((w[4]==4'd9)||(w[4]==4'd2&&w[5]==4'd1)||(w[4]==4'd1&&w[5]==4'd1))
                                                        begin
                                                            if(w[4] == 4'd2)
                                                                begin
                                                                    w[4] = 4'd1;
                                                                    w[5] = 4'd0;
                                                                end
                                                            else if(w[4]==4'd1&&w[5]==4'd1)
                                                                begin
                                                                    pm = ~pm;
                                                                    w[4]+=1;
                                                                end
                                                            else                                                                
                                                                begin
                                                                    w[4] = 4'd0;
                                                                    w[5] = 4'd1;
                                                                end
                                                        end
                                                    else
                                                        w[4]+=1;
                                                end
                                            else
                                                w[3]+=1;
                                        end
                                    else
                                        w[2]+=1;
                                end
                            else
                                w[1]+=1;
                        end
                    else
                        w[0]+=1;
                end
        end
    
endmodule
