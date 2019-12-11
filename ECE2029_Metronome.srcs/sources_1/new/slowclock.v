`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 11:09:15 AM
// Design Name: 
// Module Name: slowclock
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


module slowclock (input clk_in,
output reg clk_out); //Clock input of the design, output clock
    reg [20:0] period_count = 0;
    
    always @ (posedge clk_in) //We trigger the clock with respect to positive (rising) edge of the clock.
    if (period_count != 500000 - 1) //If the statement is not true, period_count not equivalent to 499000.
    begin
        period_count <= period_count + 1; //Increment period_count by 1.
        clk_out <= 0; //clk_out gets 0.
    end
    else //If above statement is true
    begin
        period_count <= 0; // period_count gets 0
        clk_out <= 1; // clk_out gets 1.
    end
endmodule
