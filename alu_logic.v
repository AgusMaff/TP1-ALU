`timescale 1ns / 1ps
module alu_logic#(
    parameter OP_CODE_SIZE = 6,
    parameter OPERAND_SIZE = 8
)
(
    input i_clk,
    input [OPERAND_SIZE-1:0]i_switches,
    input i_btn_A,
    input i_btn_B,
    input i_btn_OP,
    output reg [OPERAND_SIZE-1:0]o_resultado //el bit mas significativo del arreglo "o_resultado" se usa para representar el carry
);
    localparam OP_ADD = 6'b100000;
    localparam OP_SUB = 6'b100010;
    localparam OP_AND = 6'b100100;
    localparam OP_OR = 6'b100101;
    localparam OP_XOR = 6'b100110;
    localparam OP_SRA = 6'b000011;
    localparam OP_SRL = 6'b000010;
    localparam OP_NOR = 6'b100111;
    
    //reg [2:0]flags; //bit 2: flag codigo de operacion; bit 1: flag dato B; bit 0: flag dato A
    reg [OPERAND_SIZE-1:0]dato_a;
    reg [OPERAND_SIZE-1:0]dato_b;
    reg [OP_CODE_SIZE-1:0]op_code;
    
    always @(posedge i_clk)
    begin
        if(i_btn_A == 1)
            dato_a <= i_switches;
            //flags[0] = 1'b1; 
    end
    
    always @(posedge i_clk)
    begin
        if(i_btn_B == 1)
            dato_b <= i_switches;
            //flags[1] = 1'b1;        
    end
    
    always @(posedge i_clk)
    begin
        if(i_btn_OP == 1)
            op_code <= i_switches;
            //flags[2] = 1'b1;        
    end
    
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
