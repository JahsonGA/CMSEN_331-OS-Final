`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 05:10:40 PM
// Design Name: 
// Module Name: pc
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


module pc(input wire [31:0] nextPc, input wire clock, output reg [31:0] pc);
    initial begin
        pc = 32'd100;
    end
    always @ (posedge clock) begin
        pc <= nextPc;
    end
endmodule
