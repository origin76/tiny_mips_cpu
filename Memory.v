`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 06:00:04
// Design Name: 
// Module Name: Memory
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


module Memory(clk,memtoregm,memtoregm2,memwritem,memwritem2,aluoutm,aluoutm2,writedatam,writedatam2,readdatam,readdatam2);
    input clk,memtoregm,memwritem,memtoregm2,memwritem2;
    input  [31:0] aluoutm,aluoutm2,writedatam,writedatam2;
    output [31:0] readdatam,readdatam2;
    RAM ram(clk,memtoregm,memtoregm2,memwritem,memwritem2,aluoutm,aluoutm2,writedatam,writedatam2,readdatam,readdatam2);
endmodule
