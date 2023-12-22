`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/02 19:32:26
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile (
  input clk, writeEnable1, writeEnable2,
  input [4:0] readAddr1, readAddr2, readAddr3, readAddr4,
  input [4:0] writeAddr1, writeAddr2,
  input [31:0] writeData1, writeData2,
  output  [31:0] readData1, readData2, readData3, readData4
);

  // 内部寄存器数组
  reg [31:0] registers [0:31];
  integer i;
   
  initial begin
        for (i=0;i<32;i=i+1) 
            registers[i] <= 32'b0;
  end
    
  always @(posedge clk) begin
    begin
      if (writeEnable1) registers[writeAddr1] <= writeData1;
      if (writeEnable2) registers[writeAddr2] <= writeData2;
    end
  end

  // 读取逻辑
  assign readData1 = (readAddr1 != 0) ?  registers[readAddr1] : 0 ;
  assign readData2 = (readAddr2 != 0) ?  registers[readAddr2] : 0 ;
  assign readData3 = (readAddr3 != 0) ?  registers[readAddr3] : 0 ;
  assign readData4 = (readAddr4 != 0) ?  registers[readAddr4] : 0 ;

endmodule