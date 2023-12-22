`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/06 15:08:01
// Design Name: 
// Module Name: 1WordFF
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


module OneWordFF(
    clk, reset, en, d, q
    );
  
    input clk, reset, en;
    input [31:0] d;
    output reg [31:0] q;
    
    always @(posedge clk, posedge reset) begin
        if (reset)
            q <= 0;
        else if (!en)
            q <= d;
    end
    
endmodule

