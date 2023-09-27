`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu_top#(
    parameter OP_CODE_SIZE = 6,
    parameter OPERAND_SIZE = 8
)
(
    input [OPERAND_SIZE-1:0]sw,
    input btnC,
    input btnL,
    input btnR,
    output [OPERAND_SIZE:0]LED
);
    alu_logic ALU(.i_clk(i_clk),.i_switches(sw),.i_btn_A(btnL),.i_btn_B(btnC),.i_btn_OP(btnR),.o_resultado(LED));
endmodule
