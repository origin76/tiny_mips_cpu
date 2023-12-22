`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 07:16:32
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk;
    reg reset;
    wire [31:0] writedata, dataadr, writedata2, dataadr2;
    wire memwrite,memwrite2;
// instantiate device to be tested
    TopMIPSCPU dut (clk, reset, memwrite,memwrite2, dataadr,dataadr2, writedata,writedata2);
// initialize test
    initial begin
    reset <=  1; 
    #22; 
    reset <= 0;
    end
// generate clock to sequence tests
    always begin
    clk <= 1; 
    # 15; 
    clk <= 0;
     # 15;
    end
   
endmodule