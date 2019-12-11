`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2019 04:11:25 PM
// Design Name: 
// Module Name: two_by_one_mux
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


module two_by_one_mux(
    input [3:0] in0,
    input [3:0] in1,
    input selector,
    output [3:0] Y
    );
    
    assign Y = (selector == 0) ? in0 : in1;
endmodule
