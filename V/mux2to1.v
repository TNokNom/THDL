module mux2to1 (
    input WriteEnable,
    input Clk,
    input RegSel,
    input [31:0] RegA,
    input [31:0] RegB,
    output reg [31:0] Store
);

    always @(posedge Clk) begin
        if (WriteEnable) begin
            case (RegSel)
                1'b1: Store <= RegA;
                1'b0: Store <= RegB;
            endcase
        end
    end

endmodule
