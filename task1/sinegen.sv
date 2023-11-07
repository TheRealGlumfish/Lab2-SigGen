module sinegen #(
    parameter ADDRESS_WIDTH = 8,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic reset,
    input logic en,
    input logic [DATA_WIDTH-1:0] incr,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [ADDRESS_WIDTH-1:0] addr;
    
    counter sample(clk, reset, en, incr, addr);

    rom lut(clk, addr, dout);

endmodule
