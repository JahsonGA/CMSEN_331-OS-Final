`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:15:18 PM
// Design Name: 
// Module Name: exemem_pipeline_reg
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


module exemem_pipeline_reg(
    input wire ewreg,
    input wire em2reg,
    input wire ewmem,
    input wire [4:0] edestReg,
    input wire [31:0] r,
    input wire [31:0] eqb,
    input wire clock,
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg [4:0] mdestReg,
    output reg [31:0] mr,
    output reg [31:0] mqb
);
    always @(posedge clock) begin
        mwreg <= ewreg;
        mm2reg <= em2reg;
        mwmem <= ewmem;
        mdestReg <= edestReg;
        mr <= r;
        mqb <= eqb;
    end
endmodule
