`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/06 18:29:53
// Design Name: 
// Module Name: Fetch
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


module Fetch(clk, reset, stallf, pcsrcd, pcsrcd2, pcbranchd,pcbranchd2, signextd, signextd2, instrf, instrf2, pcplus4f, pcf);

  input clk, reset, stallf;
  input  [1:0]  pcsrcd, pcsrcd2;
  input  [31:0] signextd, signextd2, pcbranchd,pcbranchd2; 
  output [31:0] instrf, pcplus4f, pcf, instrf2;

  wire [31:0] pcnext;  

  wire [2:0] muxselect;
  assign muxselect = {pcsrcd2[1], pcsrcd};   // [3]  {2beq 1jump 1beq}  

  mux6  	                #(32) pcmux(pcplus4f, pcbranchd, signextd, signextd, signextd2, signextd2, muxselect, pcnext);
  OneWordFF                 pcreg(clk, reset, stallf, pcnext, pcf);
  adder   	                pcadder(pcf, 32'h8, pcplus4f);
  InstructionMem            instructmem(pcf, instrf,instrf2);

endmodule