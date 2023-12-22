`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/06 16:47:03
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem(a, rd, rd2);
  input [31:0] a;           // 输入，32位地址
  output [31:0] rd, rd2;    // 输出，32位指令数据

  reg [31:0] RAM[63:0];     // 内部寄存器数组，模拟存储器

  integer i;

  initial begin
    for (i=21; i<64; i=i+1)
      RAM[i] = 32'b0;        // 初始化 RAM 数组，可以根据需要进行修改
    $readmemh("C:\\Users\\origin\\Desktop\\memfile.txt", RAM); // 从文件 "memfile.dat" 中读取初始化数据到 RAM 数组
  end

  assign rd = {RAM[a[31:2]]};           // 从 RAM 读取指定地址的 32 位指令数据，word 对齐
  assign rd2 = {RAM[a[31:2]+30'h1]};    // 从 RAM 读取指定地址的下一个字的 32 位指令数据
endmodule
