`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 11:45:46 PM
// Design Name: 
// Module Name: metronome_debug
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


module metronome_debug(
    );
    reg btnL, btnR;
    reg clk = 0;
    wire brL, brR;
    wire [2:0]tempo_val;
    wire [31:0] beat_cycles;
    wire [1:0] led;
    always #10 clk = ~clk;
    button bL(clk, btnL, brL);
    button bR(clk, btnR, brR);
    counter_3bit c0(clk, 0, brR, brL, tempo_val);
    tempo_selector t0(tempo_val, beat_cycles);
    time_signature_clock tl(clk, beat_cycles, led);


endmodule
