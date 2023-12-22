`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:16:13
// Design Name: 
// Module Name: PipeDecode
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


module PipeDecode(
    op, regwrited, memtoregd, memwrited, aluop, alusrcd, regdstd, branchd, jumpd
    );
    
    input [5:0] op;
    output  reg memtoregd, regwrited, memwrited;
    output  reg [3:0] aluop;
    output  reg alusrcd, regdstd, branchd, jumpd;  
    
    parameter J     = 6'b000010;  // Opcode for j
    parameter ADDI  = 6'b001000;  // Opcode for addi
    parameter LW    = 6'b100011;  // Opcode for lw
    parameter SW    = 6'b101011;  // Opcode for sw
    parameter RTYPE = 6'b000000;  // Opcode for R-type
    parameter BEQ   = 6'b000100;  // Opcode for beq
    
    initial begin
         regwrited = 1'b0;
         memtoregd = 1'b0;
         memwrited = 1'b0;
         aluop     = 4'b0000;
         alusrcd   = 1'b0;
         regdstd   = 1'b0;
         branchd   = 1'b0;
         jumpd     = 1'b0;
    end
         
    always @(op) begin
        case (op)
        LW: begin
            regwrited = 1'b1;
            memtoregd = 1'b1;
            memwrited = 1'b0;
            aluop     = 4'b0000;
            alusrcd   = 1'b1;
            regdstd   = 1'b0;
            branchd   = 1'b0; 
            jumpd     = 1'b0;
        end
   
        SW: begin
            regwrited = 1'b0;
            memtoregd = 1'b0;
            memwrited = 1'b1;
            aluop     = 4'b0000;
            alusrcd   = 1'b1;
            regdstd   = 1'b0;
            branchd   = 1'b0;
            jumpd     = 1'b0;
        end
         
        RTYPE: begin
            regwrited = 1'b1;
            memtoregd = 1'b0;
            memwrited = 1'b0;
            aluop     = 4'b0010;
            alusrcd   = 1'b0;
            regdstd   = 1'b1;
            branchd   = 1'b0;
            jumpd     = 1'b0;
        end
        
        BEQ: begin
            regwrited = 1'b0;
            memtoregd = 1'b0;
            memwrited = 1'b0;
            aluop     = 4'b0001;
            alusrcd   = 1'b0;
            regdstd   = 1'b0;
            branchd   = 1'b1;
            jumpd     = 1'b0;
        end
         
        ADDI: begin
            regwrited = 1'b1;
            memtoregd = 1'b0;
            memwrited = 1'b0;
            aluop     = 4'b0000;
            alusrcd   = 1'b1;
            regdstd   = 1'b0;
            branchd   = 1'b0;
            jumpd     = 1'b0;
         end
         
        J: begin
            regwrited = 1'b0;
            memtoregd = 1'b0;
            memwrited = 1'b0;
            aluop     = 4'b0000;
            alusrcd   = 1'b0;
            regdstd   = 1'b0;
            branchd   = 1'b0;
            jumpd     = 1'b1;
         end
         
        default: begin
            regwrited = 1'bx;
            memtoregd = 1'bx;
            memwrited = 1'bx;
            aluop     = 4'bxxxx;
            alusrcd   = 1'bx;
            regdstd   = 1'bx;
            branchd   = 1'bx;
            jumpd     = 1'bx;
        end
        
        endcase
     end    
     
endmodule
