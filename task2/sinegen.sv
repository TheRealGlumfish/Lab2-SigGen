module sinegen #(
    parameter ADDRESS_WIDTH = 8,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic reset,
    input logic en,
    input logic [DATA_WIDTH-1:0] incr,
    input logic [DATA_WIDTH-1:0] offset,
    output logic [DATA_WIDTH-1:0] dout1,
    output logic [DATA_WIDTH-1:0] dout2
);

    logic [ADDRESS_WIDTH-1:0] addr;
    
    counter sample(clk, reset, en, incr, addr);

    rom lut(clk, addr, addr + offset, dout1, dout2);

endmodule
