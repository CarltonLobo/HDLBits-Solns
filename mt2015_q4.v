module top_module (input x, input y, output z);
    wire [3:0] w;
    assign w[0] = (x^y)&x;
    assign w[2] = (x^y)&x;
    assign w[1] =  ~(x^y);
    assign w[3] =  ~(x^y);
    assign z = (w[0]|w[1])^(w[2]&w[3]);
    
endmodule
