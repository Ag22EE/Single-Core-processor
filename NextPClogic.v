`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2021 03:31:00 PM
// Design Name: 
// Module Name: NextPClogic
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


module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);

       input [63:0] CurrentPC; 
       input [63:0] SignExtImm64;
       input Branch, ALUZero, Uncondbranch;
       
       output reg [63:0] NextPC;
       
       always @ (*)begin
       #1;
       
       if(Uncondbranch) begin
            NextPC[63:0] <= #2 CurrentPC[63:0] + (SignExtImm64<<2);
       end
       
       else if(Branch) begin
            if(ALUZero)
                NextPC[63:0] <= #2 CurrentPC[63:0] + (SignExtImm64<<2);
            else
                NextPC[63:0] <= #1 CurrentPC[63:0] + 4;
        
       end
       else
            NextPC[63:0] <= #1 CurrentPC[63:0] + 4;
       
       $display("Next PC:%h inserted PC:%h",NextPC, CurrentPC);
       end
              
endmodule
