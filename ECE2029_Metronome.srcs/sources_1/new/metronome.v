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
    input btnL, btnR, btnU, btnD, clk,
    output [1:0] JA,
    output [15:14] LED
    );
    wire brL, brR, brU, brD;
    wire [2:0]tempo_val;
    wire [1:0] time_sig_val;
    wire [31:0] beat_cycles;
    wire [1:0] output_pulses;
    wire [7:0] tsc_pulses;
    
    button bL(clk, btnL, brL);
    button bR(clk, btnR, brR);
    button bU(clk, btnU, brU);
    button bD(clk, btnD, brD);
    counter_3bit c0(clk, 0, brR, brL, tempo_val);
    counter_2bit c1(clk, 0, brU, brD, time_sig_val);
    tempo_selector t0(tempo_val, beat_cycles);
    time_signature_clock tl_44(clk, beat_cycles, tsc_pulses[1:0]);
    time_signature_clock #(.BEATS_PER_MEASURE(3)) tl_34(clk, beat_cycles, tsc_pulses[3:2]);
    time_signature_clock #(.BEATS_PER_MEASURE(2)) tl_24(clk, beat_cycles, tsc_pulses[5:4]);
    time_signature_clock #(.BEATS_PER_MEASURE(6), .NOTE_BEAT(8)) tl_68(clk, beat_cycles, tsc_pulses[7:6]);
    mux_4x1_2bit mu0(tsc_pulses[1:0], tsc_pulses[3:2], tsc_pulses[5:4], tsc_pulses[7:6], time_sig_val, output_pulses);
    
    assign JA = output_pulses;
    assign LED = output_pulses;
    
    
endmodule
