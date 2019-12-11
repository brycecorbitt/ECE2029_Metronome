`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 08:31:59 AM
// Design Name: 
// Module Name: counter_2bit
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


module clk_counter_2bit(input clk,
    output [1:0] Q); //clk is input, two outputs Q[1]--MSB, Q[0]--LSB.
    reg [1:0] temp = 0;
    always @(posedge clk) begin
        temp = temp + 1;
    end
    assign Q = temp;
endmodule