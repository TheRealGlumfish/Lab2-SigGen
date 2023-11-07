module sigdelay #(
    parameter ADDRESS_WIDTH = 9,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic reset,
    input logic wr,
    input logic rd,
    input logic [ADDRESS_WIDTH-1:0] offset,
    input logic [DATA_WIDTH-1:0] mic_signal,
    output logic [DATA_WIDTH-1:0] delayed_signal
);

    logic [ADDRESS_WIDTH-1:0] addr;

    counter sample(clk, reset, 1, 1, addr);

    ram sample_buffer(clk, wr, rd, addr, addr - offset, mic_signal, delayed_signal); 

endmodule

