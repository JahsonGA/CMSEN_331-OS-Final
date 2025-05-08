`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 05:37:37 PM
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(input wire [31:0] pc, output reg [31:0] instOut);
    reg [31:0] memory [0:63];
    initial begin 
        memory[25] = {6'b000000, //add $3, $1, $2
        5'b00001,
        5'b00010,
        5'b00011,
        5'b00000,
        6'b100000
        };
        memory[26] = {6'b000000, //sub $4, $9, $3
        5'b01001,
        5'b00011,
        5'b00100,
        5'b00000,
        6'b100010
        };
        memory[27] = {6'b000000, //or $5, $3, $9
        5'b00011,
        5'b01001,
        5'b00101,
        5'b00000,
        6'b100101
        };
        memory[28] = {6'b000000, //xor $6, $3, $9
        5'b00011,
        5'b01001,
        5'b00110,
        5'b00000,
        6'b100110
        };
        memory[29] = {6'b000000, //and $7, $3, $9
        5'b00011,
        5'b01001,
        5'b00111,
        5'b00000,
        6'b100100
        };
    end
    always @(*) begin
        instOut <= memory[pc[7:2]]; //divide pc by 4 to access memory 25 and 26
    end
endmodule
