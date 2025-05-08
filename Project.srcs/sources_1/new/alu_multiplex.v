`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:15:18 PM
// Design Name: 
// Module Name: alu_multiplex
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


module alu_multiplex(
    input wire [31:0] eqb,
    input wire [31:0] eimm32,
    input wire ealuimm,
    output reg [31:0] b
    ); 
    always @(*) begin
        if (ealuimm == 1'b0) begin
            b <= eqb;
        end
        else begin
            b <= eimm32;
        end
    end
endmodule
