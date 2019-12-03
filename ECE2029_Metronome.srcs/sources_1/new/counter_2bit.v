`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 07:43:49 PM
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


module counter_2bit(
    input clk, reset, increment, decrement,
    output [1:0] count 
);
    reg[1:0] current_count = 0;
    
    always@(posedge clk) begin
        if(reset)
            current_count <= 0;
        else if(increment && decrement)
            current_count <= current_count;
        else if(increment)
            current_count <= current_count + 1;
        else if (decrement)
            current_count <= current_count - 1;
        else
            current_count <= current_count;
    end
    assign count = current_count;
            
endmodule
