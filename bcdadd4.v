module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0] carry;
    assign carry[0] = cin;
    assign cout = carry[4];
	generate
        genvar i;
        for(i=0;i<4;i++)begin:blook
            bcd_fadd (.a(a[i*4+3:i*4]), .b(b[i*4+3:i*4]), .cin(carry[i]), .cout(carry[i+1]), .sum(sum[i*4+3:i*4]));
        end
    endgenerate
endmodule
