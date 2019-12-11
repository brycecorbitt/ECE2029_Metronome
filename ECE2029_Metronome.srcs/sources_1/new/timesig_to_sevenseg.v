`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 10:01:17 AM
// Design Name: 
// Module Name: timesig_to_sevenseg
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


module timesig_to_sevenseg(
    input [1:0] time_sig,
    output [3:0] ones, tens, hundreds, thousands
    );
    
    // Temporary Registers
    reg [3:0] temp_ones = 4'd0;
    reg [3:0] temp_tens = 4'd0;
    
    always@(time_sig) begin
    case (time_sig)
    // 2/4
    0: begin
        temp_tens = 4'd4;
        temp_ones = 4'd4;
    end
    // 3/4
    1: begin
        temp_tens = 4'd3;
        temp_ones = 4'd4;
    end
    // 4/4
    2: begin
        temp_tens = 4'd2;
        temp_ones = 4'd4;
    end
    // 6/8
    3: begin
       temp_tens = 4'd6;
       temp_ones = 4'd8;
    end 
    endcase
    end
    
    assign ones = temp_ones;
    assign tens = 4'd12;
    assign hundreds = temp_tens;
    assign thousands = 4'd11;
    
endmodule
