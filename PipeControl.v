`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 11:43:01
// Design Name: 
// Module Name: PipeControl
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


module PipeControl(instrd, equald, memtoregd, regwrited, memwrited, alucontrold, alusrcd, regdstd, pcsrcd, branchd);
  input [31:0] instrd;
  input equald;
  output memtoregd, regwrited, memwrited, branchd;
  output [2:0] alucontrold;
  output alusrcd;
  output regdstd;
  output [1:0] pcsrcd;
  reg pc0;
  wire [5:0] op, funct;
  wire [3:0] aluop;
  wire jumpd;

  assign op    = instrd[31:26];
  assign funct = instrd[5:0];
  
  PipeDecode  pd(op, regwrited, memtoregd, memwrited, aluop, alusrcd, regdstd, branchd, jumpd);
  ALUDecode   ad(funct, aluop, alucontrold);
  
  always @(*) begin
     pc0 <= (equald & branchd);
  end
  assign pcsrcd = {jumpd, pc0};

endmodule

