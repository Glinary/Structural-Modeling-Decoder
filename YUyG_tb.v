//Gleezell Vina A. Uy S14

`timescale 1ns / 1ps

module YUyG_tb();
    wire t_F;
    reg [3:0] t_input;
    reg t_en;
    integer i;    
    
    YUyG dut(t_en, t_F, t_input[3], t_input[2], t_input[1], t_input[0]);
    initial 
    begin
        t_input = 4'b0000;
        t_en = 1'b0; // Set en to 0 initially
        for (i = 1; i < 17; i++)
            #10 t_input = i;
        
        // Set en to 1 for another round of testing
        #10 t_en = 1'b1;
        for (i = 1; i < 17; i++)
            #10 t_input = i;
    end

    initial
    begin
        $display("Written by Gleezell Vina A. Uy");
        $display("Boolean Function: F = (AB' + A'B)(C + D')");
        $display("Structural Function: 2x4 negative output, positive enable decoder");
        $monitor("en=%b time = %0d ", t_en, $time, "ABCD = %b%b%b%b output_F = %b", t_input[3], t_input[2], t_input[1], t_input[0], t_F);
        $dumpfile("YUyG.vcd");
        $dumpvars();
    end
endmodule
