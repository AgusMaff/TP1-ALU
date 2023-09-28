`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu_top#(
    parameter OP_CODE_SIZE = 6,
    parameter OPERAND_SIZE = 8
)
(
    input CLK100MHZ,
    input [OPERAND_SIZE-1:0]sw,
    input btnC,
    input btnL,
    input btnR,
    output [OPERAND_SIZE:0]LED
);
    
    reg [OPERAND_SIZE-1:0]dato_a;
    reg [OPERAND_SIZE-1:0]dato_b;
    reg [OP_CODE_SIZE-1:0]op_code;

    always @(posedge CLK100MHZ)
    begin
        if(btnL == 1)
            dato_a <= sw;
            //flags[0] = 1'b1; 
    end
    
    always @(posedge CLK100MHZ)
    begin
        if(btnC == 1)
            dato_b <= sw;
            //flags[1] = 1'b1;        
    end
    
    always @(posedge CLK100MHZ)
    begin
        if(btnR == 1)
            op_code <= sw;
            //flags[2] = 1'b1;        
    end

    alu_logic ALU(.dato_a(dato_a),.dato_b(dato_b),.op_code(op_code),.o_resultado(LED));
endmodule
