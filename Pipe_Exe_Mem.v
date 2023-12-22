`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 01:19:38
// Design Name: 
// Module Name: Pipe_Exe_Mem
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


module Pipe_Exe_Mem(clk,writerege,writerege2,aluoute,aluoute2,writedatae,writedatae2,memwritee,memwritee2,
	      regwritee,regwritee2,memtorege,memtorege2,regwritem,regwritem2,memtoregm,memtoregm2,
          memwritem,memwritem2,writeregm,writeregm2,aluoutm,aluoutm2,writedatam,writedatam2,stallm,stallm2
    );
    input clk;
    input [4:0]  writerege,writerege2;
    input [31:0] aluoute,writedatae,aluoute2,writedatae2;
    input memwritee,memwritee2,regwritee,regwritee2,memtorege,memtorege2,stallm,stallm2;
    output reg regwritem,memtoregm,memwritem,regwritem2,memtoregm2,memwritem2;
    output reg [4:0] writeregm, writeregm2;
    output reg [31:0] aluoutm,writedatam,aluoutm2,writedatam2;
     
    initial begin
    { regwritem,memtoregm,memwritem,regwritem2,memtoregm2,memwritem2 } <= 0;
    { writeregm, writeregm2,aluoutm,writedatam,aluoutm2,writedatam2 } <= 0;
    end
    
    always @ (posedge clk) begin
          regwritem<=regwritee;
          memtoregm<=memtorege;
          memwritem<=memwritee;
          aluoutm<=aluoute;
          writedatam<=writedatae;
          writeregm<=writerege;
          regwritem2<=regwritee2;
          memtoregm2<=memtorege2;
          memwritem2<=memwritee2;
          aluoutm2<=aluoute2;
          writedatam2<=writedatae2;
          writeregm2<=writerege2;
      end
      
endmodule