module ProgramCounter (
    input clk,
    input reset,
    input enable,
    input [31:0] pc_in,
    output reg [31:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 32'b0;  // Reset PC to 0
        else if (enable)
            pc_out <= pc_in; // Update PC when enabled
    end

endmodule
