`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 06:44:05 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(ALUCtrl, ALUop, Opcode);
     input [1:0] ALUop;
     input [10:0] Opcode;
     output reg [3:0] ALUCtrl;
     
     always @ (*) begin
    
     if (ALUop == 2'b00)  //load or store
        ALUCtrl <= #2 4'b0010;   // add  
     
     else if (ALUop == 2'b01) //cbz
        ALUCtrl <= #2 4'b0111;  //pass b
     
     else if (ALUop == 2'b10) begin
        if (Opcode == 11'b10001011000)  
            ALUCtrl <= #2 4'b0010;  //ADD
        
        else if (Opcode == 11'b11001011000)  
            ALUCtrl <= #2 4'b0110;  // SUB
        
        else if (Opcode == 11'b10001010000)  
            ALUCtrl <= #2 4'b0000;  //AND
        
        else if (Opcode == 11'b10101010000)  
            ALUCtrl <= #2 4'b0001; // ORR
        
     end
      
     end
endmodule
