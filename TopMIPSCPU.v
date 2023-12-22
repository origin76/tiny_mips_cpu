`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 06:22:56
// Design Name: 
// Module Name: TopMIPSCPU
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


module TopMIPSCPU(
    clk, reset, memwritem, memwritem2, aluoutm, aluoutm2,writedatam, writedatam2
    );
    
    input clk, reset;
    output memwritem,memwritem2;
    output [31:0] aluoutm,aluoutm2, writedatam,writedatam2 ;
    
    wire  [31:0] instrf, instrd, pcplus4f, pcplus4d, pcbranchd, mux1after, mux2after, mux1out, mux2out, aluoutm, solutione, aluoutw, readdataw, readdatam,resultw, 
                  writedatae, writedatam, signextd, signimmd, signimme, pcf;
    wire         stallf, stalld, stalle, stallm,stallw, flushe, regwrited, regwritee, regwritem, regwritew, memtoregd, memtorege, memtoregm, memtoregw, memwrited, memwritee, 
                  memwritem, alusrcd, alusrce, regdstd, regdste, equald,branchd;
    wire  [2:0]  forwardae, forwardbe;
    wire  [1:0]  pcsrcd, forwardad, forwardbd;
    wire  [2:0]  alucontrold, alucontrole;
    wire  [4:0]  rsd, rtd, rdd, rse, rte, rde, writerege, writeregm, writeregw;
      
    wire  [31:0] instrf2, instrd2, pcplus4d2, pcbranchd2, mux1after2, mux2after2, mux1out2, mux2out2, aluoutm2, solutione2, aluoutw2, readdataw2, readdatam2,resultw2, 
                  writedatae2, writedatam2, signextd2, signimmd2, signimme2;
    wire         stallf2,stalld2, stalle2, stallm2,stallw2, flushe2, regwrited2, regwritee2, regwritem2, regwritew2, memtoregd2, memtorege2, memtoregm2,
                  memtoregw2, memwrited2, memwritee2, memwritem2, alusrcd2, alusrce2, regdstd2, regdste2, equald2,branchd2, branchstalld; 
    wire  [2:0]  forwardae2, forwardbe2;
    wire  [1:0]  pcsrcd2, forwardad2, forwardbd2;
    wire  [2:0]  alucontrold2, alucontrole2;
    wire  [4:0]  rsd2, rtd2, rdd2, rse2, rte2, rde2, writerege2, writeregm2, writeregw2;
    
    
    
    PipeControl      pc  (instrd, equald, memtoregd, regwrited, memwrited, alucontrold, alusrcd, regdstd, pcsrcd, branchd);
    PipeControl      pc2 (instrd2, equald2, memtoregd2, regwrited2, memwrited2, alucontrold2, alusrcd2, regdstd2, pcsrcd2, branchd2);
    
    hazardcontroller hc  (clk,rsd,rsd2,rtd,rtd2,rse,rse2,rte,rte2,branchd,branchd2,regwritee,regwritee2,memtorege,memtorege2,regwritem,regwritem2,
                            memtoregm,memtoregm2,regwritew,regwritew2,writerege,writerege2,writeregm,writeregm2,writeregw,writeregw2,stalld,stalld2,
                            stallf,stallf2,stalle,stalle2,stallm,stallm2,stallw,stallw2,flushe,flushe2,forwardad,forwardad2,forwardbd,forwardbd2,forwardae,forwardae2,forwardbe,forwardbe2,
                            memwritem,memwritem2,branchstalld);                          
                            
    Fetch	  f	      (clk, reset, stallf, pcsrcd, pcsrcd2, pcbranchd,pcbranchd2, signextd, signextd2, instrf, instrf2, pcplus4f, pcf);
    Pipe_Fetch_Decode pipe1(clk, stalld, stalld2, pcsrcd, pcsrcd2, instrf,instrf2, pcplus4f, pcf, instrd,instrd2, pcplus4d);
    Decode    d       (clk, regwritew,regwritew2, forwardad,forwardad2, forwardbd,forwardbd2, instrd,instrd2, resultw,resultw2, writeregw, writeregw2,aluoutm, aluoutm2,pcplus4d,pcplus4d2,
                      pcbranchd, pcbranchd2,equald,equald2, mux1out, mux1out2,mux2out, mux2out2,rsd,rsd2, rtd, rtd2,rdd,rdd2, signimmd,signimmd2,signextd,signextd2);
    Pipe_Decode_Exe   pipe2(clk, flushe,pcsrcd,pcsrcd2,mux1out, mux1out2,mux2out,mux2out2,rsd,rsd2,rtd,rtd2,rdd,rdd2,signimmd,signimmd2,memtoregd,memtoregd2,
                              regwrited, regwrited2, memwrited, memwrited2, alucontrold, alucontrold2,
                              stalle, stalle2,
                              alusrcd, alusrcd2, regdstd, regdstd2, memtorege, memtorege2, regwritee, regwritee2, memwritee, memwritee2,
                              alucontrole, alucontrole2, alusrce, alusrce2, regdste, regdste2, rse, rse2, rte, rte2, rde, rde2, signimme, signimme2, mux1after, mux1after2, mux2after, mux2after2 
                      );
    Execute   e      ( clk,rse,rse2,rte,rte2, rde,rde2,signimme,signimme2,mux1after,mux1after2,mux2after,mux2after2,resultw,resultw2,aluoutm,aluoutm2,
                       alucontrole,alucontrole2,alusrce,alusrce2,regdste,regdste2,forwardae,forwardae2,forwardbe,forwardbe2,writerege,writerege2,
                       solutione,solutione2,writedatae,writedatae2
                      );
    Pipe_Exe_Mem     pipe3(clk,writerege,writerege2,solutione,solutione2,writedatae,writedatae2,memwritee,memwritee2,
                      regwritee,regwritee2,memtorege,memtorege2,regwritem,regwritem2,memtoregm,memtoregm2,
                      memwritem,memwritem2,writeregm,writeregm2,aluoutm,aluoutm2,writedatam,writedatam2,stallm,stallm2);
    Memory    m      (clk,memtoregm,memtoregm2,memwritem,memwritem2,aluoutm,aluoutm2,writedatam,writedatam2,readdatam,readdatam2);
    Pipe_Mem_Write   pipe4(clk,memtoregm,memtoregm2,regwritem,regwritem2,readdatam,readdatam2,aluoutm,aluoutm2,writeregm,writeregm2,
                      memtoregw,memtoregw2,regwritew,regwritew2,readdataw,readdataw2,aluoutw,aluoutw2,writeregw,writeregw2,stallw,stallw2);
    Write     w      (memtoregw,memtoregw2,readdataw,readdataw2,aluoutw,aluoutw2,resultw,resultw2);
    
endmodule
