`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/10 04:38:52
// Design Name: 
// Module Name: Execute
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


module Execute(
        clk,rse,rse2,rte,rte2, rde,rde2,signimme,signimme2,mux1after,mux1after2,mux2after,mux2after2,resultw,resultw2,aluoutm,aluoutm2,
	    alucontrole,alucontrole2,alusrce,alusrce2,regdste,regdste2,forwardae,forwardae2,forwardbe,forwardbe2,writerege,writerege2,
	    solutione,solutione2,writedatae,writedatae2
    );
    
     input 	clk, alusrce,alusrce2, regdste,regdste2;
     input [4:0]    rse,rse2, rte, rte2,rde,rde2;
     input [31:0]   signimme,signimme2, mux1after,mux1after2, mux2after,mux2after2, resultw,resultw2, aluoutm,aluoutm2;
     input [2:0]    alucontrole,alucontrole2;
     input [2:0]    forwardae,forwardae2, forwardbe,forwardbe2;
     output [4:0]   writerege,writerege2;
     output [31:0]  solutione,solutione2, writedatae,writedatae2;
   
     wire [31:0] srcae,srcae2,srcbe,srcbe2;
     wire zero,zero2;
     wire aluc,aluc2;
   
     mux2  #(5) mux2execute(rte,rde,regdste,writerege);
     mux5  #(32) mux3alu1(mux1after,resultw,aluoutm,aluoutm2,resultw2,forwardae,srcae);
     mux5  #(32) mux3alu2(mux2after,resultw,aluoutm,aluoutm2,resultw2,forwardbe,writedatae);
     mux2  #(32) mux2alu(writedatae,signimme,alusrce,srcbe);
     ALU     alu(alucontrole,srcae, srcbe, solutione,aluc, zero);
   
     mux2  #(5) mux2execute2(rte2,rde2,regdste2,writerege2);
     mux6  #(32) mux3alu1_2(mux1after2,resultw2,aluoutm2,solutione,aluoutm,resultw,forwardae2,srcae2);
     mux6  #(32) mux3alu2_2(mux2after2,resultw2,aluoutm2,solutione,aluoutm,resultw,forwardbe2,writedatae2);
     mux2  #(32) mux2alu2(writedatae2,signimme2,alusrce2,srcbe2);
     ALU     alu2(alucontrole2,srcae2, srcbe2, solutione2,aluc2, zero2);
     
endmodule
