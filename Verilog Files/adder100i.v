module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire [1:0] carry;
    
    always@(*)
	begin
        carry = 2'b0;
        for(int i=0; i<100; i++)begin: blook
            if(i==0)
                carry = a[i] + b[i] + cin;
            else
                carry = a[i] + b[i] + carry[1];
            sum[i] = carry[0];
            cout[i] = carry[1];
        end
    end
    
    
endmodule
