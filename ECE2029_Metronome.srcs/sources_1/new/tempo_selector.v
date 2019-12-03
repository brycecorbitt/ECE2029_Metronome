`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 09:27:06 PM
// Design Name: 
// Module Name: tempo_selector
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

// 6000000000 / bpm = cycles per beat
// 60bpm = 100000000
// 75bpm = 80000000
// 90bpm = 66666666
// 100bpm = 60000000
// 120bpm = 50000000
// 140bpm = 42857142
// 200bpm = 30000000
// 240bpm = 25000000

module tempo_selector(
    input [2:0] val,
    output [31:0] beat_cycles
    );
    reg [31:0] cycles;
    always @* //NOTE: You are describing combo logic, since there is no clock signal
    case(val)
    3'b000: cycles=32'd100000000;
    3'b001: cycles=32'd80000000;
    3'b010: cycles=32'd66666666;
    3'b011: cycles=32'd60000000;
    3'b100: cycles=32'd50000000;
    3'b101: cycles=32'd42857142;
    3'b110: cycles=32'd30000000;
    3'b111: cycles=32'd25000000;
    endcase
    
    assign beat_cycles = cycles;
    
endmodule
