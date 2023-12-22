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
  input [31:0] a;           // ���룬32λ��ַ
  output [31:0] rd, rd2;    // �����32λָ������

  reg [31:0] RAM[63:0];     // �ڲ��Ĵ������飬ģ��洢��

  integer i;

  initial begin
    for (i=21; i<64; i=i+1)
      RAM[i] = 32'b0;        // ��ʼ�� RAM ���飬���Ը�����Ҫ�����޸�
    $readmemh("C:\\Users\\origin\\Desktop\\memfile.txt", RAM); // ���ļ� "memfile.dat" �ж�ȡ��ʼ�����ݵ� RAM ����
  end

  assign rd = {RAM[a[31:2]]};           // �� RAM ��ȡָ����ַ�� 32 λָ�����ݣ�word ����
  assign rd2 = {RAM[a[31:2]+30'h1]};    // �� RAM ��ȡָ����ַ����һ���ֵ� 32 λָ������
endmodule
