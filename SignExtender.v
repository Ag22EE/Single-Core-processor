`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/26/2021 04:30:43 PM
// Design Name: 
// Module Name: SignExtender
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// D type
// CB type
// B type


module SignExtender(BusImm, Imm32);

  output reg [63:0] BusImm;  // 64 bits
  input [31:0] Imm32;  // 32 bits 
//  input [1:0] Ctrl;  // 2 bit control  00  01  10  11
  
  always @(*) begin
    
      if (Imm32[31:21] == 11'b11111000000 || Imm32[31:21] == 11'b11111000010) begin  // D type
        BusImm = {{55{Imm32[20]}}, Imm32[20:12]};
        end 
        
      else if (Imm32[31:26] == 6'b000101) begin
        //assign #1 extBit = Imm32[25];  // B
        BusImm = {{38{Imm32[25]}}, Imm32[25:0]};
        end
        
      
      else if (Imm32[31:24] == 8'b10110100) begin
        //assign #1 extBit = Imm32[23];  // CB   23: 5
        BusImm = {{45{Imm32[23]}}, Imm32[23:5]};
        end
      
      else begin 
        //assign #1 extBit = Imm32[20]; // other
        BusImm = 64'b0;
        end
    $display("Sign extended Imm64:%h Instruction:%b",BusImm, Imm32);
    end

endmodule

    

