`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:35:52
// Design Name: 
// Module Name: ADD32
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


module ADD32(
  input [31:0] A,      
  input [31:0] B,     
  input Cin,          
  input EN,  
  output reg [31:0] Sum,    
  output reg Cout           
);

wire [31:0] Rsum;
wire [7:0] CarryIn, CarryOut;

genvar i;
generate
  for (i = 0; i < 8; i = i + 1) begin
    CLA4 adder(
      .A        (A[i*4 + 3:i*4]), 
      .B        (B[i*4 + 3:i*4]), 
      .Cin      (CarryIn[i]),   
      .Sum      (Rsum[i*4 + 3:i*4]),
      .Cout     (CarryOut[i])
    );
  end
endgenerate

assign CarryIn[0] = Cin;
generate
  for (i = 1; i < 8; i = i + 1) begin
    assign CarryIn[i] = CarryOut[i - 1];
  end
endgenerate

always @(*) begin
    Cout = CarryOut[7]; 
    Sum = Rsum;
  if (~EN) begin
    Sum = 32'bz;
    Cout = 1'bz;
  end
  
end

endmodule
