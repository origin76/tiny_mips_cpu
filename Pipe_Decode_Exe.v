`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/03 01:19:38
// Design Name: 
// Module Name: Pipe_Decode_Exe
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


module Pipe_Decode_Exe(
        clk, flushe,pcsrcd,pcsrcd2,mux1out, mux1out2,mux2out,mux2out2,rsd,rsd2,rtd,rtd2,rdd,rdd2,signimmd,signimmd2,memtoregd,memtoregd2,
        regwrited, regwrited2, memwrited, memwrited2, alucontrold, alucontrold2,
        stalle, stalle2,
        alusrcd, alusrcd2, regdstd, regdstd2, memtorege, memtorege2, regwritee, regwritee2, memwritee, memwritee2,
        alucontrole, alucontrole2, alusrce, alusrce2, regdste, regdste2, rse, rse2, rte, rte2, rde, rde2, signimme, signimme2, mux1after, mux1after2, mux2after, mux2after2 
    );
    input clk, flushe;
    input [1:0] pcsrcd2 , pcsrcd;
    input stalle,stalle2;
    input [31:0] mux1out,mux1out2,mux2out,mux2out2;
    output reg [31:0] mux1after,mux1after2,mux2after,mux2after2;
    input [4:0] rsd,rsd2, rtd,rtd2, rdd,rdd2;
    output reg [4:0] rse,rse2,rte,rte2, rde, rde2 ;
    input [31:0] signimmd, signimmd2;
    output reg [31:0] signimme,signimme2;
    input memtoregd,memtoregd2,regwrited,regwrited2,memwrited,memwrited2;
    output reg  memtorege,memtorege2,regwritee,regwritee2,memwritee,memwritee2;
    input [2:0] alucontrold,alucontrold2;
    output reg [2:0] alucontrole,alucontrole2;
    input alusrcd,alusrcd2,regdstd,regdstd2;
    output reg alusrce, alusrce2,regdste,regdste2; 
    
    wire clr;
    // assign clr  =  (pcsrcd2[1:1] || pcsrcd2[0:0] || pcsrcd[1:1] || pcsrcd[0:0] || flushe);
    assign clr  =  (pcsrcd[1:1] || pcsrcd[0:0] || flushe);
    
    initial begin 
          { mux1after,mux1after2,mux2after,mux2after2 } <= 0;
          { rse,rse2,rte,rte2, rde, rde2 } <= 0;
          { signimme,signimme2 } <= 0;
          { memtorege,memtorege2,regwritee,regwritee2,memwritee,memwritee2 } <= 0;
          { alucontrole,alucontrole2 } <=  0 ; 
          { alusrce, alusrce2,regdste,regdste2 } <=  0;
    end
    
    always @ (posedge clk) begin
        if ( !stalle & !stalle2 & !clr) begin
            { mux1after,mux1after2,mux2after,mux2after2 } <= { mux1out,mux1out2,mux2out,mux2out2 };
            { rse,rse2,rte,rte2, rde, rde2 } <= { rsd,rsd2, rtd,rtd2, rdd,rdd2 };
            { signimme,signimme2 } <= { signimmd,signimmd2 };
            { memtorege,memtorege2,regwritee,regwritee2,memwritee,memwritee2 } <= { memtoregd,memtoregd2,regwrited,regwrited2,memwrited,memwrited2 };
            { alucontrole,alucontrole2 } <= { alucontrold,alucontrold2 };
            { alusrce, alusrce2,regdste,regdste2 } <= { alusrcd,alusrcd2,regdstd,regdstd2 } ;
        end
        if  (!stalle & !stalle2 & clr) begin
            { mux1after,mux1after2,mux2after,mux2after2 } <= 0;
            { rse,rse2,rte,rte2, rde, rde2 } <= 0;
            { signimme,signimme2 } <= 0;
            { memtorege,memtorege2,regwritee,regwritee2,memwritee,memwritee2 } <= 0;
            { alucontrole,alucontrole2 } <=  0 ; 
            { alusrce, alusrce2,regdste,regdste2 } <=  0;
        end
    end
    
endmodule
