`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:15:18 PM
// Design Name: 
// Module Name: memwb_pipeline_reg
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


module memwb_pipeline_reg(
    input wire mwreg,
    input wire mm2reg,
    input wire [4:0] mdestReg,
    input wire [31:0] mr,
    input wire [31:0] mdo,
    input wire clock,
    output reg wwreg,
    output reg wm2reg,
    output reg [4:0] wdestReg,
    output reg [31:0] wr,
    output reg [31:0] wdo
);
    always @(posedge clock) begin
        wwreg <= mwreg;
        wm2reg <= mm2reg;
        wdestReg <= mdestReg;
        wr <= mr;
        wdo <= mdo;
    end
endmodule
