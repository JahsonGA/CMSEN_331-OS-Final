`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 07:36:56 PM
// Design Name: 
// Module Name: wb_mux
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


module wb_mux(input wire [31:0] wr, input wire [31:0] wdo, input wire wm2reg, output reg [31:0] wbData);
    always @(*) begin
        if (wm2reg == 1'b0) begin
            wbData <= wr;
        end
        else if (wm2reg == 1'b1) begin
            wbData <= wdo;
        end
    end
endmodule
