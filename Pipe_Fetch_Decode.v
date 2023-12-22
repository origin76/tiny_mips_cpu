`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 01:19:38
// Design Name: 
// Module Name: Pipe_Fetch_Decode
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

module Pipe_Fetch_Decode(
    clk, stalld, stalld2, pcsrcd, pcsrcd2, instrf,instrf2, pcplus4f, pcf, instrd,instrd2, pcplus4d
    );
    
    input clk, stalld,stalld2;
    input [1:0] pcsrcd, pcsrcd2;
    input [31:0] pcplus4f, pcf;
    input [31:0] instrf,instrf2;
    output reg [31:0] pcplus4d;
    output reg [31:0] instrd,instrd2;
    
    wire clr;
    assign clr = (pcsrcd2[1:1] || pcsrcd2[0:0] || pcsrcd[1:1] || pcsrcd[0:0]);
    
    always @ (posedge clk) begin
        if (clr & !stalld) begin
            pcplus4d = 32'b0;
            instrd   = 32'b0;
            instrd2  = 32'b0;
        end
        else if (!stalld & !clr) begin
            pcplus4d = pcplus4f;
            instrd   = instrf;
            instrd2  = instrf2;
        end
    end
    
endmodule