`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 21:05:35
// Design Name: 
// Module Name: ALUDecode
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


module ALUDecode(
    funct, aluop, alucontrol
    );
    input [5:0] funct;
    input [3:0] aluop;
    output reg [2:0] alucontrol;
      
    always @(*) begin
        case(aluop)
            4'b0000: begin alucontrol <= 3'b100; end           // add (for lw/sw/addi)
            4'b0010: begin
            case(funct)         // R-type instructions
                6'b100000: begin alucontrol <= 3'b100; end // add
                6'b100010: begin alucontrol <= 3'b101; end // sub
                6'b101010: begin alucontrol <= 3'b110; end // slt
                6'b100101: begin alucontrol <= 3'b001; end // or
                6'b100100: begin alucontrol <= 3'b000; end // and
                default:   begin alucontrol <= 3'bxxx; end // ???
            endcase
            end
            4'b0001: begin alucontrol <= 3'b101; end          // sub (for beq)
            default: begin alucontrol <= 3'bxxx; end  // ???         
        endcase
    end
    
endmodule
