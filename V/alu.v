module alu
(
    input wire [3:0] ThreadID,      //Which thread the request is coming from
    input wire [3:0] AluId,         // Which ALU is being used
    input wire [3:0] SL,SR,         //The amounts of bits that need to be shifted
    input wire       Alu_Enable,    //Enable signal
    input wire       MLU,           // Signals that the mlu needs to be used for a matrix operation
    input wire       Clk,
    input reg        Data,
    input wire [9:0] Addr_global,
    input wire [4:0] Addr_chache,
    input wire [3:0] Addr_shared,
    input wire [2:0] ControlSignal, // What operation to perform
    output wire      OC,            //occupied signal lets other threads know this ALU is being used
    output reg       IP,
    output reg       Data,          //Actual data being sent
    output reg [4:0] Ystore,        // Amount of bits represents which register we want to send data too
    output reg       Carry,
    output reg       Zero

 );
   reg [4:0] RegN;
   reg [3:0] SLH, SRH;
   reg signed [31:0] A, B, Y;
   assign A =  Astore;
   assign B = Bstore;
   assign SLH = SL;
   assign SRH = SR;

    always @(posedge clk) begin
        if (Alu_Enable) begin
            case (ControlSignal)
                3'b000: Y <= A + B;        // ADD
                3'b001: Y <= A - B;        // SUB
                3'b010: Y <= A & B;        // AND
                3'b011: Y <= A | B;        // OR
                3'b100: Y <= A ^ B;        // XOR
                3'b101: Y <= A << SLH;  // Shift Left
                3'b110: Y <= A >> SRH; // Shift Right
                default: Y <= 32'b0;
              if (result)
            endcase

        end
    end
   assign Ystore = Y;
end
module
