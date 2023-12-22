`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 01:36:44
// Design Name: 
// Module Name: signext
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


module signext  (
    input [15:0] instr_immediate,
    output reg [31:0] sign_extended_immediate
);

    always @* begin
    if (instr_immediate[15] == 1'b0) begin
        sign_extended_immediate = {16'b0, instr_immediate};
        end else begin
        sign_extended_immediate = {16'b1111111111111111, instr_immediate};
        end
    end

endmodule