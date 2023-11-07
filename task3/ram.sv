module ram #(
    parameter ADDRESS_WIDTH = 9,
    parameter DATA_WIDTH = 8
)(
    input logic clk,
    input logic wr,
    input logic rd,
    input logic [ADDRESS_WIDTH-1:0] wr_addr,
    input logic [ADDRESS_WIDTH-1:0] rd_addr,
    input logic [DATA_WIDTH-1:0] din,
    output logic [DATA_WIDTH-1:0] dout
);

    logic [DATA_WIDTH-1:0] ram_array [2**ADDRESS_WIDTH-1:0];
    
    always_ff @ (posedge clk)
    begin
       if (wr == 1)
           ram_array[wr_addr] <= din;
       if (rd == 1)
           dout <= ram_array[rd_addr];
    end

endmodule
