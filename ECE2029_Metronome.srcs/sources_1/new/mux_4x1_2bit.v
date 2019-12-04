`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 09:51:09 PM
// Design Name: 
// Module Name: mux_4x1_2bit
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


module mux_4x1_2bit(
    input [1:0] a,b,c,d, index,
    output [1:0] selection
    );
    
    assign selection = (index == 0)? a : (index == 1)? b : (index == 2)? c : d;
endmodule
