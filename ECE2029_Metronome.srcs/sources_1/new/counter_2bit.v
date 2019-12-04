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
    reg prev_inc = 0;
    reg prev_dec = 0;
    
    always@(posedge clk) begin
        if(reset)
            current_count <= 0;
        else if(increment && decrement)
            current_count <= current_count;
        else if(increment & ~prev_inc)
            current_count <= current_count + 1;
        else if (decrement & ~prev_dec)
            current_count <= current_count - 1;
        else
            current_count <= current_count;
        prev_inc <= increment;
        prev_dec <= decrement;
    end
    assign count = current_count;

endmodule
