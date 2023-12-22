`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:35:09
// Design Name: 
// Module Name: CLA4
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

module CLA4(
  input [3:0] A,       
  input [3:0] B,       
  input Cin,           
  output [3:0] Sum,   
  output Cout          
);

wire [3:0] G;
wire [3:0] P; 
wire [3:0] C; 

assign G[0] = A[0] & B[0];
assign G[1] = A[1] & B[1];
assign G[2] = A[2] & B[2];
assign G[3] = A[3] & B[3];

assign P[0] = A[0] | B[0];
assign P[1] = A[1] | B[1];
assign P[2] = A[2] | B[2];
assign P[3] = A[3] | B[3];

assign C[0] = Cin | (G[0] & P[0]);
assign C[1] = G[1] | (P[1] & (Cin | (G[0] & P[0])));
assign C[2] = G[2] | (P[2] & (G[1] | (P[1] & (Cin | (G[0] & P[0])))));
assign C[3] = G[3] | (P[3] &  (G[2] | (P[2] & (G[1] | (P[1] & (Cin | (G[0] & P[0])))))));

assign Sum[0] = A[0] ^ B[0] ^ Cin;
assign Sum[1] = A[1] ^ B[1] ^ C[0];
assign Sum[2] = A[2] ^ B[2] ^ C[1];
assign Sum[3] = A[3] ^ B[3] ^ C[2];
assign Cout = C[3];

endmodule
