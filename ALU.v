`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 14:32:06
// Design Name: 
// Module Name: ALU
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


module ALU(
    OP,A,B,F,C,Zero
    );
    
    parameter SIZE = 32;
    input [2:0] OP;
    input [SIZE : 1] A;
    input [SIZE : 1] B;
    output reg [SIZE : 1] F;
    output reg C;
    output reg Zero;
    
    parameter ALU_AND = 3'b000;
    parameter ALU_OR  = 3'b001;
    parameter ALU_XOR = 3'b010;
    parameter ALU_NOR = 3'b011;
    parameter ALU_ADD = 3'b100;
    parameter ALU_SUB = 3'b101;
    parameter ALU_SLT = 3'b110;
    parameter ALU_SLL = 3'b111;
    wire[SIZE:1] Fw;
    wire[7:0] EN;
    wire Cf;
    
    decoder38 decoder(.A(OP[2:0]),.Y(EN));
    ADD32 adder(
    .A (A) ,
    .B (B) ,
    .Cin (0),
    .EN (EN[4]),
    .Cout (Cf),
    .Sum (Fw)
    );
    
    always@(*) begin 
    C = 0;
        case(OP) 
            ALU_AND: begin F <= A&B;end
            ALU_OR: begin F <= (A|B); end
            ALU_XOR: begin F <= A^B; end
            ALU_NOR: begin F <= ~(A|B); end
            ALU_SUB: begin {C,F} <= A - B;end
            ALU_SLT: begin F <= A<B; end
            ALU_SLL: begin F = B<<A; end
            ALU_ADD: begin F = A + B ;C=Cf; end
        endcase
    Zero <= (F == 8'h0) ? 1:0;
    end
    
endmodule
