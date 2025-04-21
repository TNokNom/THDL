module alu
(
    input wire       Clk,
    input wire       Enable,
    input wire       reset,
    input wire       Matrix,
    input wire       DataA,
    input wire       DataB,
    input wire [3:0] AOP,
    output reg [7:0] Data_out,
    output reg [7:0] Data_MLU, //sends data to MLU
    output reg [7:0] store,
    output reg [7:0] Data
 );


      localparam
             ADD =  3'b000,
             MUL =  3'b001,
             SUB =  3'b010,
             DIV =  3'b011,
             NOR =  3'b100,
             XNOR = 3'b101,
             SL =   3'b110,
             SR =   3'b111;

 reg [7:0] hold_data;
    assign hold_data = Data; // Assigns Data to a temporary register
    always @(posedge Clk or posedge reset) begin
        if (reset) begin
            hold_data <= 8'b0; // Reset hold_data to 0
        end else begin
            hold_data <= Data; // Update hold_data with Data on clock edge
        end
       if (Matrix) begin
      Data_MLU <= Data; //send the data to the MLU
          end else begin
        case (AOP)
          ADD: begin
          end
          SUB: begin
          end
          MUL: begin
          end
          DIV: begin
          end
          NOR: begin
          end
          XNOR: begin
          end
          SL: begin
          end
          SR: begin
          end

        endcase
        end
    end
endmodule
