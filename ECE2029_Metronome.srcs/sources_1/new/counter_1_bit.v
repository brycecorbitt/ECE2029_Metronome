`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 08:51:20 AM
// Design Name: 
// Module Name: counter_1_bit
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


module counter_1bit(
    input clk, reset, increment,
    output count
    );
    
    reg current = 0;
    always@(posedge clk) begin
        if (reset)
            current <= 0;
        else if (increment)
            current <= ~current;
        else
            current <= current;
     end
     assign count = current;    
endmodule
