`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 05:10:41 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input wire [5:0] op,
    input wire [5:0] func,
    //project update
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] mdestReg,
    input wire mm2reg,
    input wire mwreg,
    input wire [4:0] edestReg,
    input wire em2reg,
    input wire ewreg,
    output reg [1:0] fwda, //rs 
    output reg [1:0] fwdb, //rt
    //output reg wpcir, //enable write to PC
    //
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluimm,
    output reg regrt
);
    always @(*) begin
       case (op)
           6'b000000: //memory[29]: r-type instructions
           begin
               case(func)
                   6'b100000: //add r-type
                   begin                    
                       aluc <= 4'b0010;
                   end
                   6'b100010: //sub
                   begin
                       aluc <= 4'b0110;
                   end
                   6'b100101: //or
                   begin
                       aluc <= 4'b0001;
                   end
                   6'b100110: //xor
                   begin
                       aluc <= 4'b1100;
                   end
                   6'b100100: //and
                   begin
                       aluc <= 4'b0000;
                   end
               endcase
               wreg <= 1'b1;
               m2reg <= 1'b0;
               wmem <= 1'b0;
               aluimm <= 1'b0;
               regrt <= 1'b0;
           end
           6'b100011: //load word
           begin
               wreg <= 1'b1;
               m2reg <= 1'b1;
               wmem <= 1'b0;
               aluc <= 4'b0010;
               aluimm <= 1'b1;
               regrt <= 1'b1;
           end
       endcase
       
    //forwarding updates
       if (ewreg == 1'b1 && em2reg == 1'b0 && edestReg != 5'b00000 && edestReg == rs) begin
           fwda <= 2'b01;
       end
       else if (mwreg == 1'b1 && mm2reg == 1'b0 && mdestReg != 5'b00000 && mdestReg == rs) begin
           fwda <= 2'b10;
       end
       else if (mwreg == 1'b1 && mm2reg == 1'b1 && mdestReg != 5'b00000 && mdestReg == rs) begin
           fwda <= 2'b11;
       end
       else begin
           fwda <= 2'b00;
       end
       
       if (ewreg == 1'b1 && em2reg == 1'b0 && edestReg != 5'b00000 && edestReg == rt) begin
           fwdb <= 2'b01;
       end
       else if (mwreg == 1'b1 && mm2reg == 1'b0 && mdestReg != 5'b00000 && mdestReg == rt) begin
           fwdb <= 2'b10;
       end
       else if (mwreg == 1'b1 && mm2reg == 1'b1 && mdestReg != 5'b00000 && mdestReg == rt) begin
           fwdb <= 2'b11;
       end
       else begin
           fwdb <= 2'b00;
       end
    end
endmodule
