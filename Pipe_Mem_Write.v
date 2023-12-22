`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 01:19:38
// Design Name: 
// Module Name: Pipe_Mem_Write
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

module Pipe_Mem_Write(clk,memtoregm,memtoregm2,regwritem,regwritem2,readdatam,readdatam2,aluoutm,aluoutm2,writeregm,writeregm2,
	      memtoregw,memtoregw2,regwritew,regwritew2,readdataw,readdataw2,aluoutw,aluoutw2,writeregw,writeregw2,stallw,stallw2);
	      
    input clk, stallw, stallw2;
    input memtoregm,memtoregm2,regwritem,regwritem2;
    input [31:0] readdatam,readdatam2,aluoutm,aluoutm2;
    input [4:0] writeregm,writeregm2;
  
    output reg memtoregw,memtoregw2,regwritew,regwritew2;
    output reg [31:0] readdataw,readdataw2,aluoutw,aluoutw2;
    output reg [4:0] writeregw,writeregw2;
    
    initial begin 
    { memtoregw,memtoregw2,regwritew,regwritew2,readdataw,readdataw2,aluoutw,aluoutw2,writeregw,writeregw2} = 0;
    end
    
    always @ (posedge clk) begin
        if (!stallw2) begin
            memtoregw<=memtoregm;
            regwritew<=regwritem;
            readdataw<=readdatam;
            aluoutw<=aluoutm;
            writeregw<=writeregm;
            memtoregw2<=memtoregm2;
            regwritew2<=regwritem2;
            readdataw2<=readdatam2;
            aluoutw2<=aluoutm2;
            writeregw2<=writeregm2;
        end
    end
      
endmodule