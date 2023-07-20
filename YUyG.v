//Gleezell Vina A. Uy S14

/*
CONVERSION SOLUTION: 
(AB' + A'B)(C + D')
AB'C + AB'D' + A'BC + A'BD'
AB'C(D+D') + AB'D'(C+C') + A'BC(D+D') + A'BD'(C+C')
AB'CD + AB'CD' + AB'CD' + AB'C'D' + A'BCD + A'BCD' + A'BCD' + A'BC'D'
AB'CD + AB'CD' + AB'C'D' + A'BCD + A'BCD' + A'BC'D'
1011 + 1010 + 1000 + 0111 + 0110 + 0100
11, 10, 8, 7, 6, 4

Em=(4,6,7,8,10,11)

*/

`timescale 1ns / 1ps

//Module name: 
//F = (AB' + A'B)(C + D')

//implement negative output
module YUyG(En, F, A, B, C, D);
    input En, A, B, C, D;
    output F;
    wire E0, E1, E2, E3, O0, O1, O2, O3, O4, O5, O6, O7, O8, O9, O10, O11, O12, O13, O14, O15;
    wire temp1, temp2, temp3, temp4, temp5, temp6;

    // Structural decoder instantiation
    decoder_2x4 G1(En, A, B, E0, E1, E2, E3);
    decoder_2x4 G2(E0, C, D, O0, O1, O2, O3);
    decoder_2x4 G3(E1, C, D, O4, O5, O6, O7);
    decoder_2x4 G4(E2, C, D, O8, O9, O10, O11);
    decoder_2x4 G5(E3, C, D, O12, O13, O14, O15);

    //balance maxterms before nand
    not_6 G7(temp1, temp2, temp3, temp4, temp5, temp6, O4, O6, O7, O8, O10, O11);

    //nand
    assign F = ~(temp1 & temp2 & temp3 & temp4 & temp5 & temp6);
endmodule

module not_6(F1, F2, F3, F4, F5, F6, O1, O2, O3, O4, O5, O6);
    input O1, O2, O3, O4, O5, O6;
    output F1, F2, F3, F4, F5, F6;

    not G6(F1, O1);
    not G7(F2, O2);
    not G8(F3, O3);
    not G9(F4, O4);
    not G10(F5, O5);
    not G11(F6, O6);

endmodule

module decoder_2x4(E,I0, I1, O0, O1, O2, O3);
    // declare input and output ports
    input E, I0, I1;
    output O0, O1, O2, O3;

    // assign output value by referring to logic diagram
    assign O0 = (E& ~I0& ~I1);
    assign O1 = (E& ~I0& I1);
    assign O2 = (E& I0& ~I1);
    assign O3 = (E& I0& I1);

endmodule


