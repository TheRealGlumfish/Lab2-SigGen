module counter #(
    parameter WIDTH = 8
)(
    input logic clk,
    input logic reset,
    input logic en,
    input logic [WIDTH-1:0] incr,
    output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk)
    if (reset) count <= {WIDTH{1'b0}};
    else count <= en ? count + incr : count;

endmodule

