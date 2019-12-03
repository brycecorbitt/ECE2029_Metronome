`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2019 07:48:50 PM
// Design Name: 
// Module Name: button
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


module button #(parameter threshold = 100000 )// set parameter thresehold to guage how long button pressed
(
input clk, //clock signal
input btnC, //input button
//output [0:0] LED //LED output. Light up when btn is pressed
output signal //debounced signal to logic analyzer
//output button_out1, //flip-flop1 signal to logic analyzer
//output button_out2 //flip-flop2 signal to logic analyzer
    );
reg dbsig = 0;
reg button_ff1 = 0; //button flip-flop for synchronization. Initialize it to 0
reg button_ff2 = 0; //button flip-flop for synchronization. Initialize it to 0
reg [20:0]count = 0; //20 bits count for increment & decrement when button is pressed or released. Initialize it to 0 

// First use two flip-flops to synchronize the button signal the "clk" clock domain

always @(posedge clk)begin
button_ff1 <= btnC;
button_ff2 <= button_ff1;
end

// When the push-button is pushed or released, we increment or decrement the counter
// The counter has to reach threshold before we decide that the push-button state has changed
always @(posedge clk) begin 
 if (button_ff2) //if button_ff2 is 1
 begin
    if (~&count)//if it isn't at the count limit. Make sure won't count up at the limit. First AND all count and then not the AND
        count <= count+1; // when btn pressed, count up
 end else begin
    if (|count)//if count has at least 1 in it. Make sure no subtraction when count is 0 
        count <= count-1; //when btn relesed, count down
 end
 if (count > threshold)//if the count is greater the threshold 
    dbsig <= 1; //debounced signal is 1
 else
    dbsig <= 0; //debounced signal is 0
end

assign signal = dbsig; // assign debounced signal to LED
//assign button_out1 = button_ff1; //assign button_out1 to button_ff1
//assign button_out2 = button_ff2; //assign button_out2 to button_ff2


endmodule