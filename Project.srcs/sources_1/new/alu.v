`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:15:18 PM
// Design Name: 
// Module Name: alu
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


module alu(
    input wire [31:0] eqa,
    input wire [31:0] b,
    input wire [3:0] ealuc,
    output reg [31:0] r
);
    always @(*) begin
        case(ealuc)
            4'b0010: begin
                r <= eqa + b;
            end
            4'b0110: begin
                r <= eqa - b;
            end
            4'b0001: begin
                r <= eqa | b;
            end
            4'b1100: begin
                r <= eqa ^ b;
            end
            4'b0000: begin
                r <= eqa & b;
            end
        endcase
    end
endmodule
