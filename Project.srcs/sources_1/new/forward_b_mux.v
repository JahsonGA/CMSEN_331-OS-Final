`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 09:42:56 PM
// Design Name: 
// Module Name: forward_b_mux
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


module forward_b_mux(
    input wire [1:0] fwdb, //control_unit OUTPUT
    input wire [31:0] qb, //regfile OUTPUT
    input wire [31:0] r, //alu OUTPUT
    input wire [31:0] mr, //exemem_pipeline OUTPUT
    input wire [31:0] mdo, //datamemory OUTPUT
    output reg [31:0] fwd_qb //goes into idexePipeLineReg: replaces its qa
);
always @(*) begin
    case(fwdb)
        2'b00:
        begin
            fwd_qb <= qb;
        end
        2'b01:
        begin
            fwd_qb <= r;
        end
        2'b10:
        begin
            fwd_qb <= mr;
        end
        2'b11:
        begin
            fwd_qb <= mdo;
        end
    endcase
end
endmodule
