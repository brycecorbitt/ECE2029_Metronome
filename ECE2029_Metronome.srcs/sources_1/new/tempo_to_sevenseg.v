`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 10:01:17 AM
// Design Name: 
// Module Name: tempo_to_sevenseg
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


module tempo_to_sevenseg(
    input [2:0] tempo_selection,
    output [3:0] ones, tens, hundreds, mode
    );
    
    // Temporary Registers
    reg [3:0] temp_ones = 4'd0;
    reg [3:0] temp_tens = 4'd0;
    reg [3:0] temp_hundreds = 4'd0;
    
    always@(tempo_selection) begin
    case (tempo_selection)
    // 60 BPM
    0: begin
        temp_hundreds = 4'd0;
        temp_tens = 4'd6;
        temp_ones = 4'd0;
    end
    // 75 BPM
    1: begin
        temp_hundreds = 4'd0;
        temp_tens = 4'd7;
        temp_ones = 4'd5;
    end
    // 90 BPM
    2: begin
        temp_hundreds = 4'd0;
        temp_tens = 4'd9;
        temp_ones = 4'd0;
    end
    // 100 BPM
    3: begin
       temp_hundreds = 4'd1;
       temp_tens = 4'd0;
       temp_ones = 4'd0;
    end 
    // 120 BPM
    4: begin
       temp_hundreds = 4'd1;
       temp_tens = 4'd2;
       temp_ones = 4'd0;
    end 
    // 140 BPM
    5: begin
       temp_hundreds = 4'd1;
       temp_tens = 4'd4;
       temp_ones = 4'd0;
    end
    // 200 BPM
    6: begin
        temp_hundreds = 4'd2;
        temp_tens = 4'd0;
        temp_ones = 4'd0;
    end 
    // 240 BPM
    7: begin
       temp_hundreds = 4'd2;
       temp_tens = 4'd4;
       temp_ones = 4'd0;
    end
    endcase
    end
    
    assign ones = temp_ones;
    assign tens = temp_tens;
    assign hundreds = temp_hundreds;
    assign mode = 4'd10;
    
endmodule
