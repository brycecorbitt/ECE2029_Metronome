`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 04:15:25 PM
// Design Name: 
// Module Name: four_by_one_mux
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


module four_by_one_mux( input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] sel,
    output[3:0] Y);
    
    assign Y = (sel==0)?A : (sel==1)?B : (sel==2)?C : D;
    
endmodule
