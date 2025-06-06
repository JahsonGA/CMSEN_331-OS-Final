`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2023 11:58:25 AM
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
reg clock;
initial clock = 1'b0;
always begin
    #1 clock = ~clock;
end

wire [31:0] pc;
wire [31:0] dinstOut;
wire ewreg;
wire em2reg;
wire ewmem;
wire [3:0] ealuc;
wire ealuimm;
wire [4:0] edestReg;
wire [31:0] eqa;
wire [31:0] eqb;
wire [31:0] eimm32;
wire mwreg;
wire mm2reg;
wire mwmem;
wire [4:0] mdestReg;
wire [31:0] mr;
wire [31:0] mqb;
wire wwreg;
wire wm2reg;
wire [4:0] wdestReg;
wire [31:0] wr;
wire [31:0] wdo;
datapath dataPath(
    .clock(clock),
    .pc(pc),
    .dinstOut(dinstOut),
    .ewreg(ewreg),
    .em2reg(em2reg),
    .ewmem(ewmem),
    .ealuc(ealuc),
    .ealuimm(ealuimm),
    .edestReg(edestReg),
    .eqa(eqa),
    .eqb(eqb),
    .eimm32(eimm32),
    .mwreg(mwreg),
    .mm2reg(mm2reg),
    .mwmem(mwmem),
    .mdestReg(mdestReg),
    .mr(mr),
    .mqb(mqb),
    .wwreg(wwreg),
    .wm2reg(wm2reg),
    .wdestReg(wdestReg),
    .wr(wr),
    .wdo(wdo)
);

endmodule
