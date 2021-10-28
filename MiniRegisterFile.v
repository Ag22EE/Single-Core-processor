`timescale 1ns / 1ps


module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);

    output [63:0] BusA;
    output [63:0] BusB;
    //initial BusA = 64'b0;
    //initial BusB = 64'b0;
    
    input [4:0] RA;
    input [4:0] RB;
    
    input [63:0] BusW;
    input [4:0] RW;  // 5 bits wide to address 32 registers
    input RegWr;
    input Clk;
    
    
    
    reg [63:0] registers [31:0];
    assign #2 BusA = registers[RA];
    assign #2 BusB = registers[RB];
    
    initial registers[31] = 64'b0;
     
    
    
    always @(*) begin
        registers[31] <='d0;
        end
    
    always @ (negedge Clk) begin
        
        if(RegWr) begin
            
            if(RW != 5'b11111)
                registers[RW] <= #3 BusW;
            //else
              //  registers[RW] <= #3 'd0;
            end
        
        
    end


endmodule
