module rom #(
    parameter ADDRESS_WIDTH = 8,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic [ADDRESS_WIDTH-1:0] addr,
    output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] rom_array [2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading rom.");
    $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk)
    dout <= rom_array[addr];

endmodule

