`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module tb_alu_logic();
    localparam OP_CODE_SIZE = 6;
    localparam OPERAND_SIZE = 8;
    
    reg t_clk;
    reg [OPERAND_SIZE-1:0]t_switches;
    reg btnA;
    reg btnB;
    reg btnOP;
    
    alu_logic DUT(.i_clk(t_clk),.i_switches(t_switches),.i_btn_A(btnA),.i_btn_B(btnB),.i_btn_OP(btnOP),.o_resultado(o_resultado));
    
    initial begin
    t_clk = 1'b0;
    btnA = 0;
    btnB = 0;
    btnOP = 0;
    t_switches=8'b00000000;
    #5
    t_switches=8'b00001000;
    btnA = 0; 
    btnB = 1;
    btnOP = 0;
    #5
    t_switches=8'b00000100;
    btnA = 1; 
    btnB = 0;
    btnOP = 0;
    #5
    t_switches=6'b100111;
    btnA = 0; 
    btnB = 0;
    btnOP = 1;
    #5
    btnOP = 0;
    #20
    $stop;      
    end
    
    always begin
        #1
        t_clk = ~t_clk;
    end 
endmodule
