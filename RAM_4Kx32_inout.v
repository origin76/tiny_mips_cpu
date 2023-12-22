`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:11:44
// Design Name: 
// Module Name: RAM_4Kx32_inout
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


module RAM(
   clk,memtoregm,memtoregm2,memwritem,memwritem2,aluoutm,aluoutm2,writedatam,writedatam2,readdatam,readdatam2
    );
    parameter Addr_Width = 12;
    parameter Data_Width = 32;
    parameter SIZE = 2 ** Addr_Width;
    input  [Data_Width - 1 : 0] writedatam;
    input  [Data_Width - 1 : 0] writedatam2;
    output reg [Data_Width - 1 : 0] readdatam,readdatam2;
    input  [Addr_Width - 1 : 0] aluoutm;
    input  [Addr_Width - 1 : 0] aluoutm2;
    input  clk,memtoregm,memtoregm2,memwritem,memwritem2;
    reg [Data_Width - 1 : 0] RAM [SIZE - 1 : 0];
    reg [Data_Width - 1 : 0] Data_i1;
    reg [Data_Width - 1 : 0] Data_i2;
    integer i;
    
    initial begin 
        for( i = 0;i < SIZE ;i = i+1) RAM[i] = 0;
    end
    
    always@(*) begin 
        if (memtoregm) begin
        readdatam <= RAM[aluoutm];end
        else readdatam <= 0 ;
        if (memtoregm2) begin
        readdatam2 <= RAM[aluoutm2];end
        else readdatam2 <= 0 ;
        if (memwritem) begin
        RAM[aluoutm] <= writedatam; end
        if (memwritem2) begin 
        RAM[aluoutm2] <= writedatam2;  end
    end
endmodule

