//Gleezell Vina A. Uy S14

`timescale 1ns / 1ps

module YUyG_tb();
    wire t_F;
    reg [3:0] t_input;
    integer i;
    //reg t_A, t_B, t_C, t_D;
    
    YUyG dut(1'b1, t_F, t_input[3], t_input[2], t_input[1], t_input[0]);

    initial 
    begin
        t_input = 4'b0000;
        for (i=1; i<17; i++)
            #10 t_input = i;

    end
        initial
        begin
            $display("Written by Gleezell Vina A. Uy");
            $display("F = (AB' + A'B)(C + D')");
            $display("Verilog Model: Structural 2x4 negative output, positive enable decoder");
            $monitor("time = %0d ", $time, "ABCD = %b%b%b%b output_F = %b", t_input[3], t_input[2], t_input[1], t_input[0], t_F);
            $dumpfile("YUyG.vcd");
            $dumpvars();
        end
endmodule