module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
        // Extract digits from q
    wire [3:0] d0 = q[3:0];
    wire [3:0] d1 = q[7:4];
    wire [3:0] d2 = q[11:8];
    wire [3:0] d3 = q[15:12];

    always @(posedge clk) begin
        if (reset) begin
            q <= 0;
        end else begin
            // Always increment least significant digit
            if (d0 == 9) begin
                q[3:0] <= 0;

                if (d1 == 9) begin
                    q[7:4] <= 0;

                    if (d2 == 9) begin
                        q[11:8] <= 0;

                        if (d3 == 9)
                            q[15:12] <= 0;
                        else
                            q[15:12] <= d3 + 1;
                    end else begin
                        q[11:8] <= d2 + 1;
                    end
                end else begin
                    q[7:4] <= d1 + 1;
                end
            end else begin
                q[3:0] <= d0 + 1;
            end
        end
    end

    // Compute enable signals
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = ena[1] && (q[7:4] == 4'd9);
    assign ena[3] = ena[2] && (q[11:8] == 4'd9);
endmodule
