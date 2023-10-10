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
    wire [OPERAND_SIZE-1:0]LED;
    
    alu_top DUT(.CLK100MHZ(t_clk),.sw(t_switches),.btnL(btnA),.btnC(btnB),.btnR(btnOP),.LED(LED));
    
    initial begin
        t_clk = 0;
        t_switches = 8'b00000000;
        btnA = 0;
        btnB = 0;
        btnOP = 0;
        #5
        //t_switches = 8'b01001001;
        t_switches = $random % 256;
        btnA = 1;
        btnB = 0;
        btnOP = 0;
        #5
        //t_switches = 8'b01001000;
        t_switches = $random % 256;
        btnA = 0;
        btnB = 1;
        btnOP = 0;
        #5
        t_switches = 6'b100100;
        btnA = 0;
        btnB = 0;
        btnOP = 1;
        #5
        t_switches = 8'b00000000;
        btnA = 0;
        btnB = 0;
        btnOP = 0;
        #1
        btnOP = 1;
        #5
        t_switches = $random % 256;
        btnA = 1;
        btnB = 0;
        btnOP = 0;
        #5
        t_switches = $random % 256;
        btnA = 0;
        btnB = 1;
        btnOP = 0;
        #5
        t_switches = 6'b100101;
        btnA = 0;
        btnB = 0;
        btnOP = 1;        
    $stop;      
    end
    
    always begin
        #1
        t_clk = ~(t_clk);
    end
endmodule
