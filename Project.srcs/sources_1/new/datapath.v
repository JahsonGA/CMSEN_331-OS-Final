`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 11:58:25 AM
// Design Name: 
// Module Name: datapath
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


module datapath(input wire clock,
    output wire [31:0] pc,
    output wire [31:0] dinstOut,
    output wire ewreg,
    output wire em2reg,
    output wire ewmem,
    output wire [3:0] ealuc,
    output wire ealuimm,
    output wire [4:0] edestReg,
    output wire [31:0] eqa,
    output wire [31:0] eqb,
    output wire [31:0] eimm32,
    output wire mwreg,
    output wire mm2reg,
    output wire mwmem,
    output wire [4:0] mdestReg,
    output wire [31:0] mr,
    output wire [31:0] mqb,
    output wire wwreg,
    output wire wm2reg,
    output wire [4:0] wdestReg,
    output wire [31:0] wr,
    output wire [31:0] wdo
);

wire [31:0] nextPc;
pc pCounter(.nextPc(nextPc), .clock(clock), .pc(pc));

pc_adder pcAdder(.pc(pc), .nextPc(nextPc));

wire [31:0] instOut;
inst_memory instMemory(.pc(pc), .instOut(instOut));

ifid_pipeline_reg ifidPipelineReg(.instOut(instOut), .clock(clock), .dinstOut(dinstOut));

wire [5:0] op = dinstOut[31:26];
wire [4:0] rs = dinstOut[25:21];
wire [4:0] rt = dinstOut[20:16];
wire [4:0] rd = dinstOut[15:11];
wire [5:0] func = dinstOut[5:0];
wire wreg;
wire m2reg;
wire wmem;
wire [3:0] aluc;
wire aluimm;
wire regrt;
wire [4:0] destReg;
wire [31:0] qa; 
wire [31:0] qb; 
wire [31:0] wbData;
wire [15:0] imm = dinstOut[15:0];
wire [31:0] imm32;
wire [31:0] r;
wire [31:0] mdo;
wire [1:0] fwda;
wire [1:0] fwdb;
wire [31:0] fwd_qa;
wire [31:0] fwd_qb;
control_unit controlUnit(.op(op),
.func(func),
.rs(rs),
.rt(rt),
.mdestReg(mdestReg),
.mm2reg(mm2reg),
.mwreg(mwreg),
.edestReg(edestReg),
.em2reg(em2reg),
.ewreg(ewreg),
.fwda(fwda),
.fwdb(fwdb),
.wreg(wreg),
.m2reg(m2reg),
.wmem(wmem),
.aluc(aluc),
.aluimm(aluimm),
.regrt(regrt)
);


reg_multiplex regMultiplex(.rt(rt), .rd(rd), .regrt(regrt), .destReg(destReg));

forward_a_mux fwdA(.fwda(fwda), .qa(qa), .r(r), .mr(mr), .mdo(mdo), .fwd_qa(fwd_qa));
forward_b_mux fwdB(.fwdb(fwdb), .qb(qb), .r(r), .mr(mr), .mdo(mdo), .fwd_qb(fwd_qb));
reg_file regFile(.rs(rs), .rt(rt), .wdestReg(wdestReg), .wbData(wbData), .wwreg(wwreg), .clock(clock), .qa(qa), .qb(qb));

immediate_extender immediateExtender(.imm(imm), .imm32(imm32));

id_exe_pipeline_reg idExePipelineReg(
.wreg(wreg),
.m2reg(m2reg),
.wmem(wmem),
.aluc(aluc),
.aluimm(aluimm),
.destReg(destReg),
.qa(fwd_qa), //
.qb(fwd_qb), //
.imm32(imm32),
.clock(clock),
.ewreg(ewreg),
.em2reg(em2reg),
.ewmem(ewmem),
.ealuc(ealuc),
.ealuimm(ealuimm),
.edestReg(edestReg),
.eqa(eqa),
.eqb(eqb),
.eimm32(eimm32)
);

wire [31:0] b;
alu_multiplex aluMultiplex(.eqb(eqb), .eimm32(eimm32), .ealuimm(ealuimm), .b(b));


alu ALU(.eqa(eqa), .b(b), .ealuc(ealuc), .r(r));

exemem_pipeline_reg exeMemPipelineReg(
.ewreg(ewreg),
.em2reg(em2reg),
.ewmem(ewmem),
.edestReg(edestReg),
.r(r),
.eqb(eqb),
.clock(clock),
.mwreg(mwreg),
.mm2reg(mm2reg),
.mwmem(mwmem),
.mdestReg(mdestReg),
.mr(mr),
.mqb(mqb)
);


data_memory dataMemory(
.mr(mr),
.mqb(mqb),
.mwmem(mwmem),
.clock(clock),
.mdo(mdo)
);

memwb_pipeline_reg memWbPipelineReg(
.mwreg(mwreg),
.mm2reg(mm2reg),
.mdestReg(mdestReg),
.mr(mr),
.mdo(mdo),
.clock(clock),
.wwreg(wwreg),
.wm2reg(wm2reg),
.wdestReg(wdestReg),
.wr(wr),
.wdo(wdo)
);

wb_mux wbMux(
.wr(wr), .wdo(wdo), .wm2reg(wm2reg), .wbData(wbData)
);
endmodule
