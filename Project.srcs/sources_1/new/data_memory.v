`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2023 05:15:18 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire [31:0] mr,
    input wire [31:0] mqb,
    input wire mwmem,
    input wire clock,
    output reg [31:0] mdo
);
    reg [31:0] data_memory [0:63];
    initial begin
        data_memory[0] = 32'hA00000AA;
        data_memory[1] = 32'h10000011;
        data_memory[2] = 32'h20000022;
        data_memory[3] = 32'h30000033;
        data_memory[4] = 32'h40000044;
        data_memory[5] = 32'h50000055;
        data_memory[6] = 32'h60000066;
        data_memory[7] = 32'h70000077;
        data_memory[8] = 32'h80000088;
        data_memory[9] = 32'h90000099;
    end
    always @(*) begin
        mdo <= data_memory[mr[31:2]];
    end
    always @(negedge clock) begin
        if (mwmem == 1'b1) begin
            data_memory[mr[31:2]] <= mqb;
        end
    end
endmodule
