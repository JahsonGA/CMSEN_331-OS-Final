`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 05:10:40 PM
// Design Name: 
// Module Name: immediate_extender
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


module immediate_extender(input wire [15:0] imm, output reg [31:0] imm32);

always @(*) begin
    imm32 = {{16{imm[15]}},imm};
end
endmodule
