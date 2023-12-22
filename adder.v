`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/09 22:48:19
// Design Name: 
// Module Name: adder
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


module adder (a, b, cout);
  input [31:0] a, b;
  output reg [31:0] cout;
  
  always @(*) begin
    if (a + b > 32'hFFFFFFFF)
      cout <= 32'h0;
    else
      cout <= a + b;
  end
  
endmodule