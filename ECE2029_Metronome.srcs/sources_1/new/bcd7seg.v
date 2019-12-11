`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 11:04:56 AM
// Design Name: 
// Module Name: bcd7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module bcd7seg(
input[3:0] Y,
output reg[6:0] disp); //Declaring outputs as register.
    always@(Y) //Describing an event that should happen to Y when a certain condition is met.
    begin
    case(Y) //The case statement is a decision instruction that executes the statement.
        0: disp=7'b0000001; //Here 7 bits represent 7 segments (a to g) on the display. Remember we
        1: disp=7'b1001111; // provide active-low logic to the display. To display 0 , all segments (or
        2: disp=7'b0010010; // bits) are set to 0 except for g. To display 1, b and c are set to zero, and rest are all 1s.
        3: disp=7'b0000110;
        4: disp=7'b1001100;
        5: disp=7'b0100100;
        6: disp=7'b0100000;
        7: disp=7'b0001111;
        8: disp=7'b0000000;
        9: disp=7'b0000100;
        10: disp=7'b1100000;  // 'b'
        11: disp=7'b1110000;  // 't'
        12: disp=7'b1011010;  // '/'
        13: disp=7'b1000010;
        14: disp=7'b0110000;
        15: disp=7'b0111000;
        endcase
    end
endmodule
