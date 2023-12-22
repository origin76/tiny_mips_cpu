`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 00:56:51
// Design Name: 
// Module Name: mux6
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


module mux6 #(parameter WIDTH = 8) (d0, d1, d2, d3, d4, d5, s, y);
  input [WIDTH-1:0] d0, d1, d2, d3, d4, d5;
  input [2:0] s;
  output reg [WIDTH-1:0] y;

  always @(*)
    case(s)
      3'b000: y <= d0;
      3'b001: y <= d1;
      3'b010: y <= d2;
      3'b011: y <= d3;
      3'b100: y <= d4;
      3'b101: y <= d5;
    endcase
endmodule
