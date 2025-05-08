
module pc_adder(input wire [31:0] pc, output reg [31:0] nextPc);
    always @(*) begin
        nextPc = pc + 32'd4;
    end
endmodule