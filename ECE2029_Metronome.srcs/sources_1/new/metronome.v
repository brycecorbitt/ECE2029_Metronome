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
    input btnL, btnR, btnU, btnD, btnC, clk,
    input [15:15] sw,
    output [1:0] JA,
    output [15:14] LED,
    output [3:0] an,
    output [6:0] seg
    );
    wire brL, brR, brU, brD, brC;
    wire [2:0]tempo_val;
    wire [1:0] time_sig_val;
    wire [31:0] beat_cycles;
    wire [1:0] output_pulses;
    wire [7:0] tsc_pulses;
    
    // Display wires
    wire clk_out;
    wire [3:0] b_ones, b_tens, b_hundreds, b_thousands;
    wire [3:0] t_ones, t_tens, t_hundreds, t_thousands;
    wire [3:0] t_out, b_out, to_display;
    wire [1:0] digit;
    wire mode;
    
    button bL(clk, btnL, brL);
    button bR(clk, btnR, brR);
    button bU(clk, btnU, brU);
    button bD(clk, btnD, brD);
    button bC(clk, btnC, brC);
    counter_3bit c0(clk, 0, brR, brL, tempo_val);
    counter_2bit c1(clk, 0, brU, brD, time_sig_val);
    tempo_selector t0(tempo_val, beat_cycles);
    time_signature_clock tl_44(clk, beat_cycles, tsc_pulses[1:0]);
    time_signature_clock #(.BEATS_PER_MEASURE(3)) tl_34(clk, beat_cycles, tsc_pulses[3:2]);
    time_signature_clock #(.BEATS_PER_MEASURE(2)) tl_24(clk, beat_cycles, tsc_pulses[5:4]);
    time_signature_clock #(.BEATS_PER_MEASURE(6), .NOTE_BEAT(8)) tl_68(clk, beat_cycles, tsc_pulses[7:6]);
    mux_4x1_2bit mu0(tsc_pulses[1:0], tsc_pulses[3:2], tsc_pulses[5:4], tsc_pulses[7:6], time_sig_val, output_pulses);
    
    assign JA[0] = (output_pulses[0] & ~sw)? output_pulses[0] : 0;
    assign JA[1] = (output_pulses[1] & ~sw)? output_pulses[1] : 0;
    assign LED = output_pulses;
    
        // Display code
    // Get the BCD values for each
    tempo_to_sevenseg tss0(tempo_val, b_ones, b_tens, b_hundreds, b_thousands);
    timesig_to_sevenseg tss1(time_sig_val, t_ones, t_tens, t_hundreds, t_thousands);
    
    // Slow Clock for 100 HZ
    slowclock sclk(clk, clk_out);
    
    // Counter to store the mode
    counter_1bit c10(clk, 0, brC, mode);
    // Counter to store the what digit is displayed
    clk_counter_2bit c20(clk_out, digit);
    
    // 8x1 mux
    // Using digit, get the appropriate value
    four_by_one_mux f0(b_ones, b_tens, b_hundreds, b_thousands, digit, b_out);
    four_by_one_mux f1(t_ones, t_tens, t_hundreds, t_thousands, digit, t_out);
    
    // Using mode, display the correct output
    two_by_one_mux t1(b_out, t_out, mode, to_display); 
    
    // for the enable pins of the display
    two_to_four_decoder ttf0(digit, an);
    
    // Actual output to the 7 segment display
    bcd7seg bcd(to_display, seg);    
    
endmodule
