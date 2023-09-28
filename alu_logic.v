`timescale 1ns / 1ps
module alu_logic#(
    parameter OP_CODE_SIZE = 6,
    parameter OPERAND_SIZE = 8
)
(
    input [OPERAND_SIZE-1:0]dato_a,
    input [OPERAND_SIZE-1:0]dato_b,
    input [OP_CODE_SIZE-1:0]op_code,
    output reg [OPERAND_SIZE:0]o_resultado
);
    localparam OP_ADD = 6'b100000;
    localparam OP_SUB = 6'b100010;
    localparam OP_AND = 6'b100100;
    localparam OP_OR = 6'b100101;
    localparam OP_XOR = 6'b100110;
    localparam OP_SRA = 6'b000011;
    localparam OP_SRL = 6'b000010;
    localparam OP_NOR = 6'b100111;
    
    
    always @(*)
    begin
            case(op_code)
                OP_ADD:
                    o_resultado = dato_a + dato_b;
                OP_SUB:
                    o_resultado = dato_a - dato_b;
                OP_AND:
                    o_resultado = dato_a & dato_b;
                OP_OR:
                    o_resultado = dato_a | dato_b;
                OP_XOR:
                    o_resultado = dato_a ^ dato_b;
                OP_SRA:
                    o_resultado = dato_a >> 1;
                OP_SRL:
                    o_resultado = dato_a >>> 1;
                OP_NOR:
                    o_resultado = ~(dato_a | dato_b);
            endcase
    end
endmodule
