`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 08:07:03 PM
// Design Name: 
// Module Name: metronome
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


module metronome(
    input btnL, btnR, clk,
    output [1:0] JA,
    output [15:14] LED
    );
    wire brL, brR;
    wire [2:0]tempo_val;
    wire [31:0] beat_cycles;
    wire [1:0] pulses;
    
    button bL(clk, btnL, brL);
    button bR(clk, btnR, brR);
    counter_3bit c0(clk, 0, brR, brL, tempo_val);
    tempo_selector t0(tempo_val, beat_cycles);
    time_signature_clock tl(clk, beat_cycles, pulses);
    assign JA = pulses;
    assign LED = pulses;
    
    
endmodule
