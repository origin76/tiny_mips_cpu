`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:33:37
// Design Name: 
// Module Name: decoder38
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


module decoder38(A,Y);
    input [2:0] A;
    output reg[7:0] Y;
    integer i;
    always@(A) begin
    Y = 8'b00000000;
    for(i = 0;i<8;i=i+1)
        if (A == i) 
            Y[i] = 1;
        else
            Y[i] = 0;
   end
endmodule

