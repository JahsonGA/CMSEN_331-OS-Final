`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 05:59:19 PM
// Design Name: 
// Module Name: ifid_pipeline_reg
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


module ifid_pipeline_reg(input wire [31:0] instOut, input wire clock, output reg [31:0] dinstOut);
    always @ (posedge clock) begin
        dinstOut <= instOut;
    end
endmodule
