`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 12:05:30 AM
// Design Name: 
// Module Name: reg_multiplex
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


module reg_multiplex(
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire regrt,
    output reg [4:0] destReg
);
    always @(*) begin
        if (regrt == 1'b0) begin
            destReg <= rd;
        end
        else begin
            destReg <= rt;
        end
    end
endmodule
