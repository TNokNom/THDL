module Memory (
    input Clk,
    input Reset,
    input [4:0] addr,
    input WriteEnable,
    input [31:0] DataIn,
    output reg [31:0] DataOut
);

    reg [31:0] mem [0:255]; // 256 x 32-bit memory array

    always @(posedge Clk) begin
        if (Reset) begin
            integer i;
            for (i = 0; i < 256; i = i + 1) begin
                mem[i] <= 32'b0;
            end
        end else if (WriteEnable) begin
            mem[addr] <= DataIn;
        end
        DataOut <= mem[addr];
    end

endmodule
