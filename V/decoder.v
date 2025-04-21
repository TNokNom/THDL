module Decoder (
    input clk,
    input [31:0] Instruction,
    output reg MemoryStore,
    output reg AluOFF_ON,
    output reg [2:0] ALUsignal,
    output reg ResetSignal,
    output reg StoreRam,
    output reg [7:0] RegisterAddress,
    output reg [3:0] MemoryAddress,
    output reg [8:0] Wstore,
    output reg [7:0] Rstore,
    output reg [14:0] ImmediateValue
);

    always @(posedge clk) begin
        ALUsignal <= Instruction[31:29]; // ALU operation
        AluOFF_ON <= Instruction[28];   // ALU enable
        MemoryStore <= Instruction[27]; // Memory store enable
        MemoryAddress <= Instruction[26:23]; // Memory address
        StoreRam <= Instruction[22];    // RAM store enable
        RegisterAddress <= Instruction[21:15]; // Register address
        Rstore <= Instruction[14:9];    // Read store value
        Wstore <= Instruction[8:0];     // Write store value / Immediate value
    end

endmodule
