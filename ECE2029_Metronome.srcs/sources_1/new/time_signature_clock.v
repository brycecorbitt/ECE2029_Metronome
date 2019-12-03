`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 10:25:27 PM
// Design Name: 
// Module Name: time_signature_clock
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


module time_signature_clock(
    input clk,
    input [31:0] beat_cycles,
    output [1:0] pulse
    );
    parameter BEATS_PER_MEASURE = 4;
    parameter NOTE_BEAT = 4;
    parameter PULSE_LENGTH = 10000000;
    
    reg [31:0] period_count = 0;
    reg [7:0] beat_count = 0;
    reg [1:0] tick = 2'b10;
    
    always@ (posedge clk)
        if (period_count != beat_cycles -1)
        begin
            period_count <= period_count + 1;
            if((tick[0] | tick[1]) & period_count == PULSE_LENGTH -1)
            begin
                tick <= 2'b00;
            end
        end
        else begin
            period_count <= 0;
            beat_count <= beat_count + 1;
            if (beat_count == BEATS_PER_MEASURE -1)
                beat_count <= 0;
            if(beat_count == 0)
                    tick <= 2'b10;
            else
                tick <= 2'b01;
         end
     
     assign pulse = tick;
endmodule
