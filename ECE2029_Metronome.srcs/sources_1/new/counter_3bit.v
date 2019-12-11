`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 11:08:50 PM
// Design Name: 
// Module Name: counter_3bit
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 07:41:07 PM
// Design Name: 
// Module Name: counter_4bit
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


module counter_3bit(
    input clk, reset, increment, decrement,
    output [2:0] count 
);
    reg[2:0] current_count = 0;
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