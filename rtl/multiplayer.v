`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: AGH
// Engineer: Aleksandra Roman, Karolina Brodziak
// 
// Create Date: 04.09.2022 15:32:49
// Design Name: 
// Module Name: multiplayer
// Project Name: Entliczek pentliczek
// Target Devices: 
// Tool Versions: 
// Description: Porównwanie wyników obydwóch p³ytek i zaœwiecanie ledów na wygrywaj¹cej p³ytce (lub remis)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplayer(
    input wire clk, reset,
    input wire [3:0] score,
    input wire [3:0] r_score,
    output reg [15:0] led
);
    
    reg [15:0] led_nxt;
    
always@(posedge clk) begin
    if (reset)
        led <= 16'b0;
    else
        led <= led_nxt;
end

always @* begin
if(score >= r_score)
    led_nxt = 16'b1111111111111111;
else
    led_nxt = 16'b0;
end
     
endmodule
