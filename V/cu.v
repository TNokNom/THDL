module ControlUnit (
    input clk,
    input [8:0] Wstore,
    input [7:0] Rstore,
    input enable,
    input StoreRam,
    input [3:0] MemoryAddressIN,
    input StartSignal,
    input MemReset,
    input [3:0] AddressIn,
    input [31:0] DecoderInstruct,
    output reg MemoryStore,
    output reg AluOFF_ON,
    output reg [2:0] ALUsignal,
    output reg ResetSignal,
    output reg [7:0] RegisterAddress,
    output reg CarrySignal,
    output reg ZeroSignal,
    output reg [31:0] MainInstruction,
    output reg RegHighlightA,
    output reg RegHighlightB,
    output reg Mux,
    output reg WriteEnable,
    output reg [4:0] Addr,
    output reg [3:0] MemoryAddressOut,
    output reg [3:0] SelReg,
    output reg MemResetOut,
    output reg [8:0] DataOut,
    output reg [7:0] DataR,
    output reg RegisterReset,
    output reg [2:0] ControlSignal
);

    typedef enum logic [1:0] {Fetch, Decode, Execute} state_t;
    state_t CurrentState = Fetch;

    always @(posedge clk) begin
        case (CurrentState)
            Fetch: CurrentState <= Decode;
            Decode: CurrentState <= Execute;
            Execute: CurrentState <= Fetch;
        endcase
    end

    always @(posedge clk) begin
        if (enable && CurrentState == Execute) begin
            AluOFF_ON <= 1'b1;
            case (DecoderInstruct[31:29])
                3'b000: ALUsignal <= 3'b000;
                3'b001: ALUsignal <= 3'b001;
                3'b010: ALUsignal <= 3'b010;
                3'b011: ALUsignal <= 3'b011;
                3'b100: ALUsignal <= 3'b011;
                3'b101: ALUsignal <= 3'b101;
                3'b110: ALUsignal <= 3'b110;
                3'b111: ALUsignal <= 3'b111;
            endcase

            if (StoreRam) begin
                case (RegisterAddress)
                    5'b00000: DataR <= Rstore;
                    5'b00001: DataR <= Rstore;
                    5'b00010: DataR <= Rstore;
                    5'b00011: DataR <= Rstore;
                    5'b00100: DataR <= Rstore;
                    5'b00101: DataR <= Rstore;
                    5'b00110: DataR <= Rstore;
                    5'b00111: DataR <= Rstore;
                    5'b01000: DataR <= Rstore;
                    5'b01001: DataR <= Rstore;
                    5'b01010: DataR <= Rstore;
                    5'b01011: DataR <= Rstore;
                    5'b01100: DataR <= Rstore;
                    5'b01101: DataR <= Rstore;
                    5'b01110: DataR <= Rstore;
                    5'b01111: DataR <= Rstore;
                    5'b10000: DataR <= Rstore;
                endcase
            end

            if (MemoryStore) begin
                case (MemoryAddressIN)
                    4'b0000: DataOut <= Wstore;
                    4'b0001: DataOut <= Wstore;
                    4'b0010: DataOut <= Wstore;
                    4'b0011: DataOut <= Wstore;
                    4'b0100: DataOut <= Wstore;
                    4'b0101: DataOut <= Wstore;
                    4'b0110: DataOut <= Wstore;
                    4'b0111: DataOut <= Wstore;
                    4'b1000: DataOut <= Wstore;
                    4'b1001: DataOut <= Wstore;
                    4'b1010: DataOut <= Wstore;
                    4'b1011: DataOut <= Wstore;
                    4'b1100: DataOut <= Wstore;
                    4'b1101: DataOut <= Wstore;
                    4'b1110: DataOut <= Wstore;
                    4'b1111: DataOut <= Wstore;
                endcase
            end
        end
    end

endmodule
