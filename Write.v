`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 06:20:06
// Design Name: 
// Module Name: Write
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


module Write(memtoregw,memtoregw2,readdataw,readdataw2,aluoutw,aluoutw2,resultw,resultw2);
  input memtoregw,memtoregw2;
  input  [31:0] readdataw,readdataw2,aluoutw,aluoutw2;
  output [31:0] resultw,resultw2;
  
  mux2 #(32) muxwrite(aluoutw,readdataw,memtoregw,resultw);
  mux2 #(32) muxwrite2(aluoutw2,readdataw2,memtoregw2,resultw2);
endmodule